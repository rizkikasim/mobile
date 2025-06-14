import 'dart:async';
import 'package:flutter/material.dart';

class SplashController {
  late AnimationController entranceController;
  late AnimationController bounceController;
  late AnimationController explosionController;

  late Animation<Offset> circleOffset;
  late Animation<Offset> textOffset;
  late Animation<double> bounceScale;
  late Animation<double> circleExplosion;

  bool showBounce = false;
  bool startExplosion = false;

  void init({
    required TickerProvider vsync,
    required VoidCallback onExplosionComplete,
    required VoidCallback triggerBounce,
    required VoidCallback triggerExplosion,
  }) {
    entranceController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: vsync,
    );

    circleOffset = Tween<Offset>(
      begin: const Offset(-2.0, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: entranceController, curve: Curves.easeOut),
    );

    textOffset = Tween<Offset>(
      begin: const Offset(2.0, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: entranceController, curve: Curves.easeOut),
    );

    bounceController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: vsync,
    );

    bounceScale = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.2), weight: 40),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 0.95), weight: 30),
      TweenSequenceItem(tween: Tween(begin: 0.95, end: 1.0), weight: 30),
    ]).animate(
      CurvedAnimation(parent: bounceController, curve: Curves.easeInOut),
    );

    explosionController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: vsync,
    );

    circleExplosion = Tween<double>(begin: 40.0, end: 2000.0).animate(
      CurvedAnimation(parent: explosionController, curve: Curves.easeInOut),
    );

    entranceController.forward();

    entranceController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        showBounce = true;
        triggerBounce();
        bounceController.forward();
      }
    });

    bounceController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 400), () {
          startExplosion = true;
          triggerExplosion();
          explosionController.forward();
        });
      }
    });

    explosionController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        onExplosionComplete();
      }
    });
  }

  void dispose() {
    entranceController.dispose();
    bounceController.dispose();
    explosionController.dispose();
  }
}
