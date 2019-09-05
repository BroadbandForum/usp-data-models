# makefile

TOPDIR = .

include $(TOPDIR)/../../install/etc/defs.mk

REPORTFLAGS += --altnotifreqstyle
REPORTFLAGS += --ignoreenableparameter
REPORTFLAGS += --immutablenonfunctionalkeys
REPORTFLAGS += --markmounttype
REPORTFLAGS += --cwmpindex=..
REPORTFLAGS += --nofontstyles
REPORTFLAGS += --nowarnreport
REPORTFLAGS += --quiet

REPORTINDEXFLAGS += --report=htmlbbf
REPORTINDEXFLAGS += --autobase
REPORTINDEXFLAGS += --configfile=$(TOPDIR)/OD-148.txt
REPORTINDEXFLAGS += --cwmppath=''
REPORTINDEXFLAGS += --option htmlbbf_configfile_suffix=usp
REPORTINDEXFLAGS += --option \
	htmlbbf_omitpattern="-(\d+-\d+-(biblio|types)|common|iot)\.xml$$"
REPORTINDEXFLAGS += --option htmlbbf_createfragment=true
REPORTINDEXFLAGS += --option htmlbbf_onlyfullxml=true
# XXX should this use master or a tag such as v1.1.0?
REPORTINDEXFLAGS += --option htmlbbf_protobufurlprefix=https://github.com/BroadbandForum/usp/blob/master/specification

# XXX these remove many warnings and errors; a good idea?
REPORTINDEXFLAGS += --autobase
REPORTINDEXFLAGS += --automodel
REPORTINDEXFLAGS += --loglevel=error

# disable default CWMP stuff
# XXX shouldn't be using reportincludes (it's lower case so internal)
CWMPXSD =
TRXSD =
DMXML =
reportincludes =
INSTALLCWMP =
PUBLISHCWMP =

# CWMPDIR contains all the source files
SRCXSD  =
SRCXSD += $(subst $(CWMPDIR),,$(wildcard $(CWMPDIR)cwmp-datamodel-*.xsd))
SRCXSD += $(subst $(CWMPDIR),,$(wildcard $(CWMPDIR)cwmp-devicetype-*.xsd))

SRCXML  =
SRCXML += $(subst $(CWMPDIR),,$(wildcard $(CWMPDIR)tr-069-*biblio.xml))
SRCXML += $(subst $(CWMPDIR),,$(wildcard $(CWMPDIR)tr-106-*types.xml))
SRCXML += $(subst $(CWMPDIR),,$(wildcard $(CWMPDIR)catalog.xml))

SRCXML += $(subst $(CWMPDIR),,$(wildcard $(CWMPDIR)tr-104-*.xml))
SRCXML += $(subst $(CWMPDIR),,$(wildcard $(CWMPDIR)tr-135-*.xml))
SRCXML += $(subst $(CWMPDIR),,$(wildcard $(CWMPDIR)tr-140-*.xml))
SRCXML += $(subst $(CWMPDIR),,$(wildcard $(CWMPDIR)tr-196-*.xml))

SRCXML += $(subst $(CWMPDIR),,$(wildcard $(CWMPDIR)tr-181-2-*.xml))

# filter out DM and DT XSD files prior to USP
SRCXSD_ = $(filter-out cwmp-datamodel-1-0.xsd cwmp-datamodel-1-1.xsd \
		       cwmp-datamodel-1-2.xsd cwmp-datamodel-1-3.xsd \
		       cwmp-datamodel-1-4.xsd cwmp-datamodel-1-5.xsd \
		       cwmp-devicetype-1-0.xsd cwmp-devicetype-1-1.xsd \
		       cwmp-devicetype-1-2.xsd, $(SRCXSD))

# filter out CWMP XML files and files prior to USP
# XXX tr-106-1-1-0-types.xml isn't needed because there's a 1-1-1 version; it's
#     worth omitting because it's the only use of cwmp-datamodel-1-5.xsd
# XXX tr-181-2-common.xml shouldn't be in the install tree, so we ignore it
#     rather than be dependent on the install tree having been fixed
SRCXML_ = $(filter-out %-cwmp.xml \
		       tr-106-1-1-0-types.xml \
                       tr-181-2-0-%.xml tr-181-2-1-%.xml tr-181-2-2-%.xml \
                       tr-181-2-3-%.xml tr-181-2-4-%.xml tr-181-2-5-%.xml \
                       tr-181-2-6-%.xml tr-181-2-7-%.xml tr-181-2-8-%.xml \
                       tr-181-2-9-%.xml tr-181-2-10-%.xml tr-181-2-11-%.xml \
		       tr-181-2-common.xml \
		       tr-104-1-%.xml tr-104-2-0-0%.xml \
		       tr-135-1-0-%.xml tr-135-1-1-%.xml tr-135-1-2-%.xml \
		       tr-135-1-3-%.xml tr-135-1-4-0%.xml \
		       tr-140-1-0-%.xml tr-140-1-1-%.xml tr-140-1-2-%.xml \
		       tr-140-1-3-0%.xml \
		       tr-196-1-%.xml tr-196-2-0-%.xml tr-196-2-1-0%.xml, \
		$(SRCXML))

# candidate model XML (new major version)
SRCXML0 = $(subst $(CWMPDIR),,$(wildcard $(CWMPDIR)tr-???-?-0*.xml))

# latest model XML
# XXX if this is wrong, it won't be detected... could easily warn?
# XXX since flattening, need to include all versions, which causes some
#     report tool warnings and errors
LATESTXML = tr-181-2-12-0-usp.xml \
	    tr-181-2-13-0-usp.xml \
	    tr-104-2-0-1-usp.xml \
	    tr-135-1-4-1-usp.xml \
	    tr-140-1-3-1-usp.xml \
	    tr-196-2-1-1-usp.xml

# support XML
BIBLIOXML = $(filter tr-069%-biblio.xml, $(SRCXML_))
TYPESXML = $(filter tr-106%-types.xml, $(SRCXML_))
EXTRAXML = $(filter catalog%.xml, $(SRCXML_))
SUPPORTXML = $(BIBLIOXML) $(TYPESXML) $(EXTRAXML)

# model XML
modelxml = $(filter-out $(SUPPORTXML), $(SRCXML_))
USPXML = $(filter tr-%-usp.xml, $(modelxml))
COMMONXML = $(filter tr-%-common.xml, $(modelxml))
OTHERXML = $(filter-out $(USPXML) $(COMMONXML), $(modelxml))

# USP XML (new major version)
USPXML0 = $(filter $(USPXML), $(SRCXML0))

# USP XML (not new major version)
USPXML1 = $(filter-out $(USPXML0), $(USPXML))

# all XML (source and generated)
XML = $(SUPPORTXML) $(USPXML) $(COMMONXML) $(OTHERXML) \
	$(USPXML:%.xml=%-full.xml)

# support HTML
BIBLIOHTML = $(BIBLIOXML:%.xml=%.html)
TYPESHTML = $(TYPESXML:%.xml=%.html)
SUPPORTHTML = $(BIBLIOHTML) $(TYPESHTML)

# diffs HTML (not new major version)
DIFFSHTML = $(USPXML1:%.xml=%-diffs.html)

# full HTML (all versions)
FULLHTML = $(USPXML:%.xml=%.html) $(OTHERXML:%.xml=%.html)

# index HTML
INDEXHTML = _index.html

# all HTML
HTML = $(SUPPORTHTML) $(DIFFSHTML) $(FULLHTML) $(INDEXHTML)

# overrides
$(BIBLIOHTML): REPORTFLAGS += --allbibrefs

TARGETS = $(SRCXSD_) $(XML) $(HTML)

# build in the local directory
TARGETDIR =

include $(TOPDIR)/../../install/etc/rules.mk

$(SRCXSD_) $(SRCXML_): %: $(CWMPDIR)%
	$(INSTALLCMD) $< $@

# index file can also include Protobuf schemas (*.proto) but these are linked
# to rather than copied
SRCPROTO = usp-record-1-0.proto usp-msg-1-0.proto \
	   usp-record-1-1.proto usp-msg-1-1.proto

# XXX these dependencies are incomplete (need proper dependencies)
$(INDEXHTML): $(SRCXSD_) $(LATESTXML)
	$(REPORT) $(REPORTFLAGS) $(REPORTINDEXFLAGS) --outfile=$@ \
		$(SRCPROTO) $^
