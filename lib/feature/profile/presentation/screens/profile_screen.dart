import 'package:flutter/material.dart';
import 'package:healhify/core/widget/container_component.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ContainerComponent(
            height: 400,
              child: Column(
                children: [

                ],
              )
          ),
        ],
      ),
    );
  }
}
