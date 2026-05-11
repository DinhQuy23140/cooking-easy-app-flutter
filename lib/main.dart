import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'features/auth/presentation/auth_app.dart';
import 'features/main/presentation/screens/enter_name_screen.dart';
import 'features/main/presentation/screens/pick_avatar_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      home: PickAvatarScreen(),
    ),
  );
}