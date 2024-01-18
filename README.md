<!-- do not edit! this file was created from PROJECT.yaml by project-parser.py -->

# Broadband Forum User Services Platform (USP) Data Models

The latest [User Services Platform (USP)](https://usp.technology)
data models can be found at <https://usp-data-models.broadband-forum.org>.

[The Broadband Forum][BBF] defines several data models for use with the [User
Services Platform (USP)][USP]. These data models contain objects,
parameters, commands, and events that describe the many different service
elements that can be exposed via USP Agents.

USP data models are divided into two types: *Root* and *Service*. The
root data model, *Device*, is used to describe the major functions of
network aware devices, including interfaces, software/firmware,
diagnostics, components common to USP and other services, and the
basic Agent information necessary to the operation of USP.

Service data models describe modular functionality that allow the
extension of the root data model on a device (under *Device.Services.*)
to provide particular services, such as a voice service, set top box
service, network attached storage, smart home objects, etc.

Each data model is defined by a *Name:Version* syntax. The objects,
parameters, commands, and events that a particular Agent supports from
its implementation of the data model define what is reported to
Controllers via the *GetSupportedDM* message.

[BBF]: https://www.broadband-forum.org
[USP]: https://usp.technology

## How do I use these? 

Use the USP data model files to define and implement what exists in your
solution's *Supported Data Model*. This will help Controllers learn what your
solution is capable of. The data models will also describe how your
solution's *Instantiated Data Model* will behave during operation.

* View the HTML files on this page for a human-readable look at the data
  model documentation.

* Use the XML files in this repository when generating code and performing
  data validation.

These data models are based on the Broadband Forum's [data models for the CPE
WAN Management Protocol][cwmp-data-models], also known as "TR-069", with a
robust development history.

The source files used to build the complete USP data model can be found on
[GitHub].

A ZIP file containing all the latest data models can be downloaded from
[here][ZIP].

[cwmp-data-models]: https://cwmp-data-models.broadband-forum.org
[GitHub]: https://github.com/BroadbandForum/usp-data-models
[ZIP]: https://github.com/BroadbandForum/usp-data-models/archive/master.zip
