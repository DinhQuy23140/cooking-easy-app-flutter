import 'package:dotted_border/dotted_border.dart';
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
              colors: [Color(0xFF66BB6A), Color(0xFF43A047), Color(0xFF2E7D32)],
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
                          ),
                        ),
                        child: Icon(Icons.person_2_outlined, size: 24, color: Colors.white,),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            color: Color(0xFF43A047),
                            borderRadius: BorderRadius.circular(14),
                          ),
                            child: Icon(
                              Icons.camera_alt_outlined, size: 14, color: Colors.white,)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                child: const Text(
                  'Pick your avatar',
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
                child: const Text(
                  "Choose an avatar or upload your own photo",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0x99FFFFFF),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DottedBorder(
                          color: Color(0xFFA5D6A7),
                          strokeWidth: 2,
                          dashPattern: [8, 4],
                          borderType: BorderType.RRect,
                          radius: Radius.circular(12),
                          child: Container(
                            width: double.infinity,
                            height: 52,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xFFEAF3DE),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.camera_alt_outlined, size: 18),
                                const SizedBox(width: 10),
                                const Text(
                                  "Upload from gallery",
                                  style: TextStyle(
                                    color: Color(0xFF43A047),
                                    fontSize: 13,
                                    fontFamily: 'sans-serif',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 22),
                        Row(
                          children: [
                            Container(
                              width: 3,
                              height: 16,
                              margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Color(0xFF4CAF50),
                              ),
                            ),
                            const Text(
                              " CHOOSE AVATAR",
                              style: TextStyle(
                                letterSpacing: 0.1,
                                color: Color(0xFF2E5E2E),
                                fontSize: 12,
                                fontFamily: 'sans-serif',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14,),
                        // recyclerview avatar
                        const SizedBox(height: 24,),
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF43A047),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                )
                            ),
                            child: Text("Confirm & Continue",
                            style: TextStyle(
                              fontFamily: 'sans-serif',
                              color: Colors.white,
                              fontSize: 15
                            ),),
                          ),
                        ),
                        const SizedBox(height: 12,),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: const Text("Skip for now",
                          style: TextStyle(
                            color: Color(0xFFAAAAAA),
                            fontSize: 12
                          ),),
                        ),
                      ],
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
