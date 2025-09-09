// lib/ui/home_screen.dart
import 'package:flutter/material.dart';
import '../i18n/i18n.dart';
import 'widgets/app_background.dart';

class HomeScreen extends StatelessWidget {
  final String languageCode;
  final VoidCallback onLanguageTap;
  final VoidCallback onAudioTap;

  // 🔧 Gap values (adjust these numbers to move things around)
  static const double topGap = 65;               // space from top → logo
  static const double logoToSubtitleGap = 25;   // space from logo → subtitle
  static const double subtitleToButtonsGap = 170; // space from subtitle → buttons
  static const double betweenButtonsGap = 50;   // space between the two buttons

  const HomeScreen({
    super.key,
    required this.languageCode,
    required this.onLanguageTap,
    required this.onAudioTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AppBackground(
        imageAsset: 'assets/images/brawHome.jpg',
        blueOverlayOpacity: 0.75,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // --- Gap: top of screen → logo
              SizedBox(height: topGap),

              // --- Braw logo ---
              Center(
                child: Image.asset(
                  'assets/images/brawHeading.png',
                  width: 300,
                  height: 120,
                  fit: BoxFit.contain,
                ),
              ),

              // --- Gap: logo → subtitle
              SizedBox(height: logoToSubtitleGap),

              // --- Subheading ---
              Center(
                child: Text(
                  I18n.t("scotspeak", lang: languageCode),
                  style: const TextStyle(
                    fontSize: 27,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFFBD59), // yellow
                    shadows: [Shadow(blurRadius: 6, offset: Offset(0, 1))],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // --- Gap: subtitle → buttons block
              SizedBox(height: subtitleToButtonsGap),

              // --- Buttons (centered & fixed width for consistency) ---
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 180),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Audio button (moved above)
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                color: Color(0xFFFFBD59), width: 2),
                            foregroundColor: const Color(0xFFFFBD59),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'SourceSerif4',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: onAudioTap,
                          child: Text(I18n.t("audio", lang: languageCode)),
                        ),
                      ),

                      SizedBox(height: betweenButtonsGap),

                      // Language button (now below audio)
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                color: Color(0xFFFFBD59), width: 2),
                            foregroundColor: const Color(0xFFFFBD59),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'SourceSerif4',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: onLanguageTap,
                          child: Text(I18n.labelFor(languageCode)),
                        ),
                      ),
                    ],
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
