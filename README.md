# TransitionX

```Transition animation for Flutter Navigation```

## Getting Started

First you have to add the package dependency in ```pubspec.yml```

    transition_x: ^latest
Get th version from [pub.dev](https://pub.dev/packages/transition_x)

### To use with ```Navigator.of(context).push()```

In your push() 0r pushReplacement() add the Transition like this.

    Navigator.of(context).push(
        TransitionX(
            widget: Register(),
            transitionType: TransitionType.slideToLeftWithFade,
            bounce: false,
        ),
    );

### To use with ```Navigator.of(context).pushNamed()```

In your Material App's ```onGenerateRoute``` add the transitions. Make sure that the the route name you are using in ```onGenerateRoute``` is not defined in the routes list or anywhere in the ```Material App```

    onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/home':
            return TransitionX(
              widget: HomeScreen(),
              transitionType: TransitionType.slideToLeftWithFade,
              bounce: false,
            );
          case '/login':
            return TransitionX(
              widget: Login(),
              transitionType: TransitionType.slideToLeftWithFade,
              bounce: false,
            );
          case '/register':
            return TransitionX(
              widget: Register(),
              transitionType: TransitionType.slideToLeftWithFade,
              bounce: false,
            );
          default:
            return TransitionX(
              widget: Unknown(),
              transitionType: TransitionType.slideToLeftWithFade,
              bounce: false,
            );
        }
      }

## Optional Params

* bool bounce
  * Sets if the transition hase bounce effect.
* Duration duration
  * Sets the duration of Animation.
* TransitionType transitionType
  * Sets the Transition animation Type
* Curve curve
  * Sets Curve for animation type ```TransitionType.slideToRightWithFade```
