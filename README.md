# VRT iOS App assignment

<img src="https://github.com/TanyEm/vrt/raw/master/screenshots/sc1.png" height="500"> <img src="https://github.com/TanyEm/vrt/raw/master/screenshots/sc2.png" height="500"> <img src="https://github.com/TanyEm/vrt/raw/master/screenshots/sc3.png" height="500">

## Description

I decided to use **MVVM** architecture with a **network layer** and **services** covered by integration tests to develop the application.

The application architecture scheme is:

![schema](https://github.com/TanyEm/vrt/raw/master/screenshots/schema.png)

### Implementation notes

To create dynamic cells, such as ```connectors``` and ```evses```, I decided to use custom ```UIViewCollectionsCells``` in connection with xib.  Unfortunately, I encountered a problem with ```StationList```. I’ll fix it in the future.

I decided to use the ```SwiftKeychainWrapper``` library for saving token, it is simple and proven by iOS community.

### Things to improve

- In services, we can cache business logic data (an an example, in ```Realm```) for performance and scaling;
- In API models I found some inaccuracies such are:
  - in ```ConnectorType``` Swagger model there are no ```Mennekes``` and ```Schuko``` (but ```Shuko``` instead);
  - in ```Connectors``` Swagger model ```maxKw``` mentioned as ```number($Int32)``` but API returns Double values as well;



## Xcode Project Setup

### Requirements

> A code signing key from Apple is required to deploy apps to a device. Without a developer key, the app can only be installed on the iPhone Simulator.

- Xcode  
- iOS 13 SDK 
- CocoaPods

### How to install CocoaPods?

```
$ sudo gem install cocoapods
```

More information about CocoaPods on the official CocoaPods [website](https://cocoapods.org/).

### Dependencies 

Run the following command from the Terminal to install the required libraries, and then open the generated IRCCloud.xcworkspace file to build and run the app.

```
$ pod install
```
