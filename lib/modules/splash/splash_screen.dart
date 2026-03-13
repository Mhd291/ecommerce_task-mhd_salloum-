import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mhd_salloum_ecommerce_task/core/shared/extensions/context_extension.dart';
import 'package:responsive_s/responsive_s.dart';

import '../../core/managers/assets_managers/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _fadeZoomController;
  late final AnimationController _pulseController;

  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();


    _fadeZoomController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1300),
    );

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _fadeZoomController,
        curve: Curves.easeOutCubic,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(
        parent: _fadeZoomController,
        curve: Curves.easeOutBack,
      ),
    );

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(
        parent: _pulseController,
        curve: Curves.easeInOut,
      ),
    );

    _fadeZoomController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _pulseController.repeat(reverse: true);
      }
    });

    _fadeZoomController.forward();


    _navigateToNext();
  }

  void _navigateToNext() {
    Timer(const Duration(seconds: 3), () async {


        Get.offNamed('/dashboard');


    });
  }


  @override
  void dispose() {
    _fadeZoomController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return ResponsiveWidget(
      builder: (sizer) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            children: [

              Container(
                width: double.infinity,
                height: double.infinity,
                decoration:  BoxDecoration(
                 color: context.grey900
                ),
              ),

              Center(
                child: AnimatedBuilder(
                  animation: Listenable.merge([
                    _fadeZoomController,
                    _pulseController,
                  ]),
                  builder: (context, child) {
                    final scale = (_fadeZoomController.status !=
                        AnimationStatus.completed)
                        ? _scaleAnimation.value
                        : _pulseAnimation.value;

                    return Opacity(
                      opacity: _fadeAnimation.value,
                      child: Transform.scale(
                        scale: scale,
                        child: child,
                      ),
                    );
                  },
                  child: SizedBox(
                    width: sizer.w(350),
                    height: sizer.w(350),
                    child: AssetsManager.images.salloumLogo.image(
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
