import 'package:flutter/material.dart';

/// Flutter placeholder for `EnterNameActivity` (com.example.cookingeasy.ui.main).
class EnterNameScreen extends StatelessWidget {
  const EnterNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
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
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0x66FFFFFF),
                      width: 2,
                    ),
                    color: const Color(0x33FFFFFF),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Icon(
                      Icons.person_2_outlined,
                      size: 36,
                      color: Color(0xFF5C5C5C),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                "What's your name?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: 'sans-serif',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'This is how other chefs will know you in the app',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0x99FFFFFF),
                  fontSize: 13,
                  fontFamily: 'sans-serif',
                ),
              ),
              const SizedBox(height: 28),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Enter your name",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color(0xFF1B5E20),
                            fontSize: 18,
                            fontFamily: 'sans-serif',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text("FULL NAME",
                          style: TextStyle(
                            color: Color(0xFF888888),
                            fontSize: 11,
                            fontFamily: 'sans-serif',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6,),
                        const SizedBox(
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person_2_outlined, size: 18,),
                              hintText: "Enter your name",
                              fillColor: Color(0x1A43A047),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x2A43A047),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(12))
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x2A43A047),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(12))
                              )
                            ),
                            style: TextStyle(
                              color: Color(0xFF2E5E2E),
                              fontSize: 14,
                              fontFamily: 'sans-serif',
                            ),
                          ),
                        ),
                        const SizedBox(height: 6,),
                        const Text("Min 2 characters",
                          style: TextStyle(
                            color: Color(0xFFAAAAAA),
                            fontSize: 11,
                            fontFamily: 'sans-serif',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 18,),
                        const Text("NICKNAME (optional)",
                          style: TextStyle(
                            color: Color(0xFF888888),
                            fontSize: 11,
                            fontFamily: 'sans-serif',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6,),
                        const SizedBox(
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: Color(0x1A43A047),
                              filled: true,
                              hintText: "Enter your nickname",
                              prefixIcon: Icon(Icons.person_2_outlined, size: 18,),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x2A43A047),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(12))
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x2A43A047),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(12))
                              )
                            ),
                            style: TextStyle(
                              color: Color(0xFF2E5E2E),
                              fontSize: 14,
                              fontFamily: 'sans-serif',
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF43A047),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              )
                            ),
                            child: const Text("Continue"),
                          ),
                        ),
                        const SizedBox(height: 14),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("Skip for now",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFAAAAAA),
                              fontSize: 12,
                              fontFamily: 'sans-serif',
                            ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        )
      )
    );
  }
}
