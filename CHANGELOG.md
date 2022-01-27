# USP Data Models Change Log

*The latest [User Services Platform (USP)](https://usp.technology) data models can be found at <https://usp-data-models.broadband-forum.org>.*

## 2022-01-27: [TR-369 Amendment 2](https://usp.technology), [TR-106 Amendment 11](https://data-model-template.broadband-forum.org) and [TR-181 Issue 2 Amendment 15](https://usp-data-models.broadband-forum.org/#Device:2.15)

*Tag: [v1.2.0](https://github.com/BroadbandForum/usp-data-models/releases/tag/v1.2.0)*

TR-106

* Allowed the version attribute in component references
* Allowed minEntries and maxEntries in command and event argument objects
* Allowed status attribute in profile command/event arguments
* Added secured attribute

TR-181

* Split the XML into multiple smaller files (this is just housekeeping; it
  doesn't affect how the model is used)
* Allowed USP to access the EnableCWMP parameter (so a USP Controller can
  enable/disable CWMP access)
* Added Device.Routing.Babel for the RFC 8966 Babel routing protocol
* Added Device.DOCSIS for modeling DOCSIS 3.0 and 3.1 interfaces
* Added Device.Users.Group, Device.Users.Role and Device.Users.SupportedShell
  tables for modeling system users
* Improved the Wi-Fi data model by adding Data Elements R2 parameters,
  commands and events, moving MultiAP parameters and commands into the Data
  Elements structure, and by deprecating AIFSN, ECWMin, ECWMax and TxOpMax
* Clarified the LockoutPeriod and Retries ControllerTrust parameters that
  impact how the RequestChallenge() and ChallengeResponse() data model
  commands handle failed attempts
* Clarified bulk data profile, threshold and periodic statistics USP
  Controller permissions: only the USP Controller that created the profile
  will receive the corresponding events
* Added a bulk data profile ForceCollection() command
* Added support for a new bulk data collection mechanism that utilizes MQTT
  as the transport protocol
* Removed old bulk data collection protocols (Streaming and File) from the USP
  data model (they don't apply to USP)
* Updated the IPLayerCapacity() test to support TR-472 Issue 2
* Added an enumeration to indicate when a Boot! event was due to a factory
  reset
* Added an enumeration to distinguish encrypted and unencrypted USP MQTT
  WebSocket connections
* Added an Order parameter to provide guidance to USP Agents on which MTP to
  use when communicating with a Controller
* Clarified that Device.Optical is intended for generic optical interfaces
  and is not intended to model anything specific to IEEE or ITU-T PON
  technologies (objects specific to such technologies may be added in future
  versions of the data model)
* Clarified the meaning and usage of the Device.Ethernet.Interface and
  Device.Ethernet.Link objects (also allowed the Ethernet Link MACAddress
  parameter to be written)
* Improved (and made more consistent) the marking of (and explanation of)
  deprecated items, and how such items should progress from being deprecated
  to obsoleted to deleted
* Added a Baseline:4 profile that doesn't include Device.LANConfigSecurity
  (it relates to the now-deprecated TR-064 LAN management protocol)
* Many minor improvements to object, parameter, command and event descriptions
* Replaced the non-standard dmr:version attribute with the version attribute
  (which supports three levels of version)
* Switched to DMR (data model report) schema v1.0, which supports multi-line
  paragraphs, and wrapped all lines to 80 characters maximum

## 2020-11-17: [TR-181 Issue 2 Amendment 14 Corrigendum 1](https://usp-data-models.broadband-forum.org/#Device:2.14)

*Tag: [v1.1.4](https://github.com/BroadbandForum/usp-data-models/releases/tag/v1.1.4)*

TR-181

* Fixed Device.LocalAgent.Subscription.{i}.ID constraints
* Removed duplicate remarks about CWMP BOOTSTRAP from descriptions
* Fixed typos

## 2020-11-05: [TR-106 Amendment 10](https://data-model-template.broadband-forum.org) and [TR-181 Issue 2 Amendment 14](https://usp-data-models.broadband-forum.org/#Device:2.14)

*Tag: [v1.1.3](https://github.com/BroadbandForum/usp-data-models/releases/tag/v1.1.3)*

TR-106

* Converted document to markdown
* Various editorial improvements

TR-181

* Added WWC (5G Wireline Wireless Convergence), PDU (Protocol Data Unit) and FWE (5G Wireline wireless Encapsulation) top-level objects
* Updated Cellular object to be applicable to 5G Residential Gateways
* Extended support for TR-471 IP-layer metrics, including new IP-layer capacity test
* Supported LAN device time-based access-control
* Various Wi-Fi improvements

## 2020-06-30: [TR-369 Amendment 1 Corrigendum 2](https://usp.technology)

*Tag: [v1.1.2](https://github.com/BroadbandForum/usp-data-models/releases/tag/v1.1.2)*

* No changes to data models

## 2020-04-06: [TR-369 Amendment 1 Corrigendum 1](https://usp.technology)

*Tag: [v1.1.1](https://github.com/BroadbandForum/usp-data-models/releases/tag/v1.1.1)*

* Regenerated HTML using new [report.pl#425](https://github.com/BroadbandForum/cwmp-xml-tools/releases/tag/report.pl%23425) version of the BBF report tool

## 2020-01-17: [TR-104 Issue 2 Corrigendum 2](https://usp-data-models.broadband-forum.org/#VoiceService:2)

*Tag: [v1.1.0c1](https://github.com/BroadbandForum/usp-data-models/releases/tag/v1.1.0c1)*

TR-104

* Clarified meaning of SessionID and added new SIPSessionID

## 2019-09-05: [TR-369 Amendment 1](https://usp.technology) and [TR-181 Issue 2 Amendment 13](https://usp-data-models.broadband-forum.org/#Device:2.13)

*Tag: [v1.1.0](https://github.com/BroadbandForum/usp-data-models/releases/tag/v1.1.0)*

TR-181

* Added support for WFA Data Elements
* Added support for Multi AP
* Added support for WPA3 and 802.11ax
* Added support for MQTT 5.0
* Added support for Package capture diagnostics
* Updates for TR-369 MQTT support
* Added support for IoT Data model

## 2018-11-01: [TR-369 Corrigendum 2](https://usp.technology)

*Tag: [v1.0.2](https://github.com/BroadbandForum/usp-data-models/releases/tag/v1.0.2)*

* No changes to data models

## 2018-08-02: [TR-369 Corrigendum 1](https://usp.technology)

*Tag: [v1.0.1](https://github.com/BroadbandForum/usp-data-models/releases/tag/v1.0.1)*

* No changes to data models

## 2018-04-17: [TR-369](https://usp.technology) and [TR-181 Issue 2 Amendment 12](https://usp-data-models.broadband-forum.org/#Device:2.12)

*Tag: [v1.0.0](https://github.com/BroadbandForum/usp-data-models/releases/tag/v1.0.0)*

TR-181

* Added USP Local agent support (TR-369)
* Added Firmware Image support
* Added Ethernet Link Aggregation Group
* Added additional Wi-Fi and WAN statistics
* Added support for Two-Way Active Measurement Protocol (TWAMP) reflector
* Added support for Layer Two Tunneling Protocol version 3 (L2TPv3)
* Added support for Virtual eXtensible Local Area Network (VXLAN) tunnels
* Added support for Broadband Access Service Attributes and Performance Metrics measurement test framework (BASAPM)
* Added support for Large-Scale Measurement of Broadband Performance (LMAP)
