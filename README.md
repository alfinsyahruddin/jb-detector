# JBDetector

A Swift Package for detecting JailBroken iOS Device.

## Installation

You can install this package via Swift Package Manager (SPM).

1. Click File -> Add Packages
2. Enter: https://github.com/alfinsyahruddin/jb-detector
3. JBDetector package installed.

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
