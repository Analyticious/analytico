<div align="center">
    <i>PLEASE NOTE - project is in <b>early stages</b> of development.</i><br>
    <i>Coworking opened. Drop a message if you're interested !!</i>
</div>

# Analytico
Analytico is _super-simple analytics data collector_ written in pure `Swift 5`.  

[![Swift](https://github.com/vexy/analytico/actions/workflows/swift-build.yml/badge.svg?branch=main)](https://github.com/vexy/analytico/actions/workflows/swift-build.yml)

As they said:  
> _Use it wisely_ ☝️

## Usage
Using `Analytico` is pretty darn simple. All you can do are following two things:
  - **trace** your custom metrics in iOS friendly way
  - **collect** traced metrics for further analysis

### Trace screen visits using `screenVisit` and `event` enums.
```Swift
Analytico.trace(.screenVisit(name: "Signup", metaData: nil)
Analytico.trace(.event("Signup completed", metaData: "Method: AppleSignin")
```

### Granually trace app usage with `interaction` enum.
```Swift
Analytico.trace(.interaction("Help button clicked"))
```

### Capture app specific events with `systemEvent` enum.
```Swift
Analytico.trace(.systemEvent(.appStart), metaData: "App initialized...")
Analytico.trace(.systemEvent(.iOS.locationUpdate))
```

### `collect` gathered data for futher processing
```Swift
Analytico.collect()     // still in progress, don't rely on this untill v1.0 !!
```

And that's pretty much it... 🤷🏻‍♂️

_Docs comming soon !! Expect them [here](https://github.com/vexy/analytico/wiki)._

## Installation
`Analytico` can easily be installed using SPM.  

Quick links:  
> Package name: Analytico  
> URL: https://github.com/vexy/analytico.git

`Package.swift` example:
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

Keep your dependency tree with `main` branch untill official, `v1.0` release comes up.

# Contribution
... is more than welcome :)
Feel free to fire an [issue](https://github.com/vexy/analytico/issues) or start [discussion](https://github.com/vexy/analytico/discussions) at your will.
Wikis will be used for [documentation](https://github.com/vexy/analytico/wiki).

# Licence
`Analytico` has been published under `MIT Licence`.  
Check the LICENCE file for more information.

---  
Copyright (C) 2022 Veljko Tekelerovic  
PGP: `6302 D860 B74C BD34 6482 DBA2 5187 66D0 8213 DBC0`
