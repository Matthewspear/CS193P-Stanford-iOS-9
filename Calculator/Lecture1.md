## Lecture 1

These are called *modules*:

```
import UIKit
import Foundation
```

Modules contain classes...


### The MVC Design Pattern

MVC stand for Model View Controller

In the example:

* View - Main.storyboard
* Controller - ViewController

The model hasn't been implemented yet!


### Interface Builder

Attributes inspector goes up the class, superclass hierarchy:

```
Button > Control > View
```

Outlets and Actions are used to link up the code to the interface.

```
@IBOutlet
@IBAction
```
An action is used to link up the buttons to methods in the code.

### Constants, Variables 

let - constant
var - variable

Only use `var` if the value needs to be changed.

All values must have an initial value or initialiser.

Optionals are the exception and get automatically set to nil.

### Types

Types can be written explictly after the name with a semicolon:

```
let digit: Int = 10

```

If not specified then Swift uses type inference to determine the type automatically. Where possible let Swift infer the type, it looks cleaner.

### Optionals

Optional is a type that is either nothing (`nil`) or something (an associated type).

e.g `String?` - Optional String

* Type is Optional
* Associated value is String

! - implicitly unwrapped optional

Explicitly unwrap a `nil` value will cause a crash.

An `if let` statment can be used to unwrap an optional safely and check if the value is `nil`.


