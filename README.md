# Analytico
Analytico is _super-simple analytics data getherer_ written in pure `Swift 5`.  

[![Swift](https://github.com/vexy/analytico/actions/workflows/swift-build.yml/badge.svg?branch=main)](https://github.com/vexy/analytico/actions/workflows/swift-build.yml)

As they said:  
> _Use it wisely_ ☝️

## Usage
Using `Analytico` is pretty darn simple. All you can do are following two things:
  - trace your custom metrics in iOS way
  - collect traced metrics

Something like this:

### Trace important screen visits using `screenVisit` and `event`
```Swift
Analytico.trace(entry: .screenVisit(name: "Signup", metaData: nil)
Analytico.trace(entry: .event("Signup completed", metaData: "Method: AppleSignin")
```

### Granually trace your app usage `interaction`

```Swift
Analytico.trace(entry: .interaction("Help button clicked"))
```

### Capture app specific events with `systemEvent`
```Swift
// Mark app specific events like this
Analytico.trace(entry: .systemEvent(.appStart), metaData: "Testing app start trace")
Analytico.trace(entry: .systemEvent(.iOS.locationUpdate))
```

### Collect gathered data for futher processing
```Swift
Analytico.collect()
```

And that's pretty much it... 🤷🏻‍♂️  

## Installation
`Analytico` can easily be installed using SPM.  

Quick links:  
> Package name: Analytico  
> URL: https://github.com/vexy/analytico.git

Your `Package.swift` example:
```
let package = Package(
    name: "YOUR_PACKAGE",
    products: [
        // ....
    ],
    dependencies: [
        .package(url: https://github.com/vexy/analytico.git, branch: "main"),
    ],
    targets: [
        .target(
            name: "YOUR_TARGET_NAME",
            dependencies: ["Analytico"]
        ),
    ]
)
```

# Licence
`Analytico` has been published under `MIT Licence`.  
Check the LICENCE for more information.

---  
Copyright (C) 2022 Veljko Tekelerovic  
PGP: `6302 D860 B74C BD34 6482 DBA2 5187 66D0 8213 DBC0`
