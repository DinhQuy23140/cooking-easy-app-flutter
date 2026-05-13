import 'package:flutter/material.dart';

/// Flutter port of the inline `Dialog` shown by `LoginActivity.showForgotPasswordDialog`.
///
/// Displays an email field with Send/Cancel actions, returns the entered email
/// when the user taps Send (or `null` on Cancel / dismiss).
Future<String?> showForgotPasswordDialog(BuildContext context) {
  return showDialog<String>(
    context: context,
    builder: (dialogContext) => const _ForgotPasswordDialog(),
  );
}

class _ForgotPasswordDialog extends StatefulWidget {
  const _ForgotPasswordDialog();

  @override
  State<_ForgotPasswordDialog> createState() => _ForgotPasswordDialogState();
}

class _ForgotPasswordDialogState extends State<_ForgotPasswordDialog> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF66BB6A), Color(0xFF43A047), Color(0xFF2E7D32)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 28),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0x2AFFFFFF),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0x1AFFFFFF)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                    child: Icon(Icons.lock_clock_outlined, size: 26),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Forgot Password',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                fontFamily: 'sans-serif',
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: const Text(
                "Enter your email and we'll send you a link to reset you...",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'sans-serif',
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "EMAIL",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Color(0xFF888888),
                fontSize: 11,
                fontFamily: 'sans-serif',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 50,
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: "your@email.com",
                  filled: true,
                  prefixIcon: Icon(Icons.email_outlined, size: 18),
                  fillColor: Color(0x1A43A047),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x1A43A047)),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x1A43A047)),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                style: TextStyle(
                  color: Color(0xFF2E5E2E),
                  fontSize: 14,
                  fontFamily: 'sans-serif',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xFFF1F8E9),
                border: Border.all(color: Color(0x1A43A047)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: const Row(
                  children: [
                    Icon(Icons.notification_add_outlined, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      'You will receive a link to reset your password',
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: 'sans-serif',
                        color: Color(0xFF388E3C),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      foregroundColor: Color(0xFF888888),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: BorderSide(color: Color(0xFFE0E0E0)),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context).pop(_emailController.text.trim()),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Color(0xFF43A047),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Send",
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'sans-serif',
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.send, size: 18, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
