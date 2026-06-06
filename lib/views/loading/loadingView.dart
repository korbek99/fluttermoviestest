import 'package:flutter/material.dart';

class Loadingview {
  
  static Route<T> create<T>({
    required Widget page, 
    String message = 'Loading...', 
    Duration duration = const Duration(milliseconds: 600),
  }) {
    return PageRouteBuilder<T>(
      transitionDuration: duration,
      reverseTransitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        
    
        final loadingOpacity = Tween<double>(begin: 1.0, end: 0.0).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0.0, 0.4, curve: Curves.easeIn),
          ),
        );

     
        final contentOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
          ),
        );

        return Stack(
          children: [
            
            if (animation.value < 1.0)
              Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: FadeTransition(
                  opacity: loadingOpacity,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(
                          color: Colors.yellow, 
                          strokeWidth: 3,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          message,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            decoration: TextDecoration.none, 
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            
            FadeTransition(
              opacity: contentOpacity,
              child: child,
            ),
          ],
        );
      },
    );
  }
}