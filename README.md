# JBDetector

A Swift Package for detecting JailBroken iOS Device.

## Installation

You can install this package via Swift Package Manager (SPM) or CocoaPods.

### 1. Swift Package Manager

1. Click File -> Add Packages
2. Enter: https://github.com/alfinsyahruddin/jb-detector
3. JBDetector package installed.

### 2. CocoaPods

```rb:Podfile
use_frameworks!

target 'YOUR_TARGET_NAME' do
    pod 'JBDetector', '1.0.0'
end
```

Replace `YOUR_TARGET_NAME` and then, run this command:

```sh
$ pod install
```

---

Also, don't forget to add `cydia` in `LSApplicationQueriesSchemes` key of `Info.plist`

```xml
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>cydia</string>
</array>
```

---

## Usage

```swift

import JBDetector

let isJailbroken = JBDetector().isJailbroken
```
