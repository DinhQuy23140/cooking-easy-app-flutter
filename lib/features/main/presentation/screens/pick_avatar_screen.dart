import 'package:flutter/material.dart';

/// Flutter placeholder for `PickAvatarActivity`.
class PickAvatarScreen extends StatelessWidget {
  const PickAvatarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF66BB6A),
                Color(0xFF43A047),
                Color(0xFF2E7D32),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 56),
              Center(
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: Stack(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Color(0x33FFFFFF),
                          borderRadius: BorderRadius.circular(45),
                          border: Border.all(
                            color: Color(0x66FFFFFF),
                            width: 2,
                          )
                        ),
                        child: Icon(Icons.person_2_outlined, size: 24,)
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(Icons.camera_alt_outlined))
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14,),
              SizedBox(
                width: double.infinity,
                child: const Text('Pick your avatar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: const Text("Choose an avatar or upload your own photo",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0x99FFFFFF),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),)),
              const SizedBox(height: 28,),
            ],
          ),
        ),
      )
    );
  }
}
