## Lecture 2

###MVC design pattern

MVC Stands for Model, View, Controller

Model - What your application is (but not how it is displayed)

Controller - How your Model is presented to the user (UI logic)

View - Your controller’s minions

###Controller > Model

- Controllers can always talk directly to their model
- Controllers can also directly talk to their View Controller

###View > Controller

Can the View speak to its Controller?

- The Controller can drop a target on itself.
- Then hand out an action to the View.


###Delegates

Sometime the View needs to synchronise with the Controller. The Controller sets itself as the View’s delegate.

Delegate - delegating some responsibility to the controller.

- The delegate is set via a protocol (ie. it is blind to class)
- Views do not own the data they display

So, if needed, they have a protocol to acquire it.

###Datasource
- Controllers are almost always the data source (not Model!)
- Controllers interpret/format Model information for the View

Can the Model talk directly to the Controller?

- Model directly UI independent.

So what if the Model has information to update or something?

- It uses a “radio station” - like broadcast mechanism (Notification & KVO)
- Controller (or other Model) “tune in” to interesting stuff.
- A view might “tune in”, but probably not to a Model’s "Station"

###Structure

- One MVC per screen on an iPhone Screen, need load for an app.
- Controller like UITabBarController might show multiple different MVCs
- each MVC is completely self contained

###Structs
- passed by value as opposed to classes w which are passed by reference
- Structs are passed by value meaning values are copied
- Double, Int, String are all examples of structs
- Structs have auto initialisers

###Closures
- Inline function that captures the state of it’s environment

from:

```
func multiply(op1: Double, op2: Double) -> Double
{
  return op1 * op2
}
```

to:

```
{ $0 * $1 }
```

using type inference and default value names within the closure.

### Misc.

== as a function, adopting the Comparable protocol and implementing the required methods (also needs to be accessible outside the class).


Internal vs Public

public - visible to everyone in all module

internal - visible across the same module
