library transition_x;

import 'package:flutter/material.dart';
part 'transitionType.dart';

class TransitionX extends PageRouteBuilder {
  static const animationDuration = Duration(seconds: 1);

  /// Destination Widget
  final Widget widget;

  /// Set Bounce
  final bool bounce;

  /// Sets duration of transition animation
  final Duration duration;

  /// Sets transition animation type
  final TransitionType transitionType;

  /// Sets curve of animation type [TransitionType.slideToRightWithFade]
  final Curve curve;

  /// TransitionX animation constractor
  TransitionX({
    /// Destination widget
    @required this.widget,

    /// Transition type
    this.transitionType = TransitionType.fade,

    /// Set Bounce
    this.bounce = true,

    /// Sets curve of animation type [TransitionType.slideToRightWithFade]
    this.curve = Curves.linear,

    /// Duration of animation
    this.duration = TransitionX.animationDuration,
  }) : super(
          transitionDuration: duration,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secAmination,
            Widget child,
          ) {
            if (bounce) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.elasticInOut);
            }
            switch (transitionType) {
              case TransitionType.bouncyScale:
                return ScaleTransition(
                  alignment: Alignment.center,
                  scale: animation,
                  child: child,
                );
              case TransitionType.slideToBottom:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, -1),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              case TransitionType.slideToTop:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              case TransitionType.slideToLeft:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              case TransitionType.slideToRight:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              case TransitionType.slideToLeftWithFade:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                );
              case TransitionType.slideToRightWithFade:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1.0, 0.0),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                );
              default:
                return FadeTransition(opacity: animation, child: child);
            }
          },
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secAmination,
          ) {
            return widget;
          },
        );
}
