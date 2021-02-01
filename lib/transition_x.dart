library transition_x;

import 'package:flutter/material.dart';
part 'transitionType.dart';

class TransitionX extends PageRouteBuilder {
  static const animationDuration = Duration(seconds: 1);

  final Widget widget;
  final bool bounce;
  final Duration duration;
  final TransitionType transitionType;
  final Curve curve;
  TransitionX({
    @required this.widget,
    this.transitionType = TransitionType.fade,
    this.bounce = true,
    this.curve = Curves.linear,
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
