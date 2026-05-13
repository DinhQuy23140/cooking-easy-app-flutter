import 'package:flutter/material.dart';

/// Android XML drawable -> Flutter theme mappings.
///
/// Naming keeps the original XML file names for easy migration.
class AndroidDrawableTheme {
  const AndroidDrawableTheme._();

  // bg_test.xml
  static const LinearGradient bgTest = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0x00A2CB8B), Color(0x99CFE7BE), Color(0xFFEAF6E4)],
  );

  // bg_step_circle.xml
  static final BoxDecoration bgStepCircle = BoxDecoration(
    shape: BoxShape.circle,
    color: const Color(0xFF4CAF50),
    border: Border.all(color: const Color(0xFFA2CB8B), width: 1.5),
  );

  // bg_status.xml
  static final BoxDecoration bgStatus = BoxDecoration(
    color: const Color(0xFFE8F5E9),
    borderRadius: BorderRadius.circular(12),
  );

  // bg_start.xml
  static const LinearGradient bgStart = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [Color(0xFF2E7D32), Color(0xFF43A047), Color(0xFF66BB6A)],
  );

  // bg_recipe_image.xml / bg_image_round.xml
  static final BorderRadius bgRecipeImageRadius = BorderRadius.circular(14);
  static final BorderRadius bgImageRoundRadius = BorderRadius.circular(12);

  // bg_overlay.xml
  static const LinearGradient bgOverlay = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [Color(0x66000000), Color(0x00000000)],
  );

  // bg_gradient_overlay.xml
  static const LinearGradient bgGradientOverlay = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [Color(0x00000000), Color(0x99000000)],
  );

  // bg_icon_circle.xml
  static final BoxDecoration bgIconCircle = BoxDecoration(
    color: const Color(0xFFF5F5F5),
    borderRadius: BorderRadius.circular(50),
    border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
  );

  // bg_gradient_bottom.xml (uses screen gradient colors)
  static const LinearGradient bgGradientBottom = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [Color(0xFFA2CB8B), Color(0xFFCFE7BE), Color(0xFFEAF6E4)],
  );

  // bg_gradient.xml
  static const LinearGradient bgGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [Color(0x00000000), Color(0xAA000000)],
  );

  // bg_edittext.xml
  static final BoxDecoration bgEditText = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
  );

  // bg_circle_white_alpha.xml / bg_circle_white.xml / bg_circle.xml
  static final BoxDecoration bgCircleWhiteAlpha = BoxDecoration(
    color: const Color(0xCCFFFFFF),
    borderRadius: BorderRadius.circular(50),
  );
  static final BoxDecoration bgCircleWhite = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(50),
  );
  static final BoxDecoration bgCircle = BoxDecoration(
    color: const Color(0xFFEEEEEE),
    borderRadius: BorderRadius.circular(50),
  );

  // bg_chip.xml
  static final BoxDecoration bgChip = BoxDecoration(
    color: const Color(0xFFEEEEEE),
    borderRadius: BorderRadius.circular(18),
  );

  // bg_chat_input_rounded.xml
  static final BoxDecoration bgChatInputRounded = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(28),
    border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
  );

  // gradient_featured_overlay.xml
  static const LinearGradient gradientFeaturedOverlay = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0x00000000), Color(0x882E5E2E), Color(0xCC2E5E2E)],
    stops: [0.0, 0.7, 1.0],
  );

  // gradient_hero_bottom.xml
  static const LinearGradient gradientHeroBottom = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [Color(0x00FFFFFF), Color(0xCCFFFFFF)],
  );

  // gradient_result_header.xml
  static const LinearGradient gradientResultHeader = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [Color(0xFFEAF6E4), Color(0xFFCFE7BE), Color(0x00A2CB8B)],
  );

  // gradient_scan_line.xml
  static const LinearGradient gradientScanLine = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0x0000C897), Color(0xFF00C897), Color(0x0000C897)],
    stops: [0.0, 0.5, 1.0],
  );

  // gradient_top.xml
  static const LinearGradient gradientTop = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [Color(0xCC0A0A0F), Color(0x000A0A0F)],
  );

  // --- shape_*.xml (from Cooking-Easy-App res/drawable) ---

  // shape_circle_glass.xml
  static final BoxDecoration shapeCircleGlass = BoxDecoration(
    color: const Color(0x1AFFFFFF),
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: const Color(0x2AFFFFFF), width: 1),
  );

  // shape_input_field.xml
  static final BoxDecoration shapeInputField = BoxDecoration(
    color: const Color(0x1A43A047),
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: const Color(0x2A43A047), width: 1),
  );

  // shape_favorite_on_photo.xml (oval)
  static final BoxDecoration shapeFavoriteOnPhoto = BoxDecoration(
    shape: BoxShape.circle,
    color: const Color(0xE8FFFFFF),
    border: Border.all(color: const Color(0x99FFFFFF), width: 1.5),
  );

  // shape_icon_pill_green.xml (oval)
  static final BoxDecoration shapeIconPillGreen = BoxDecoration(
    shape: BoxShape.circle,
    color: const Color(0xFFEAF3DE),
  );

  // shape_info_box.xml
  static final BoxDecoration shapeInfoBox = BoxDecoration(
    color: const Color(0xFFF1F8E9),
    borderRadius: BorderRadius.circular(10),
  );

  // shape_bottom_card.xml
  static final BoxDecoration shapeBottomCard = const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
  );

  // shape_chat_search_pill.xml
  static final BoxDecoration shapeChatSearchPill = BoxDecoration(
    color: const Color(0xFFF5FBF2),
    borderRadius: BorderRadius.circular(22),
    border: Border.all(color: const Color(0x332E5E2E), width: 1),
  );

  // shape_avatar_item.xml (oval)
  static final BoxDecoration shapeAvatarItem = BoxDecoration(
    shape: BoxShape.circle,
    color: const Color(0xFFF5F5F5),
    border: Border.all(color: const Color(0xFFE0E0E0), width: 1.5),
  );

  // shape_chat_message_input.xml (@color/chat_input_bg / chat_input_stroke)
  static final BoxDecoration shapeChatMessageInput = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(22),
    border: Border.all(color: const Color(0x262E5E2E), width: 1),
  );

  // shape_accent_bar.xml
  static final BoxDecoration shapeAccentBar = BoxDecoration(
    color: const Color(0xFF4CAF50),
    borderRadius: BorderRadius.circular(2),
  );

  // shape_btn_primary.xml
  static final BoxDecoration shapeBtnPrimary = BoxDecoration(
    color: const Color(0xFF43A047),
    borderRadius: BorderRadius.circular(14),
  );

  // shape_avatar_ring.xml (oval)
  static final BoxDecoration shapeAvatarRing = BoxDecoration(
    shape: BoxShape.circle,
    color: const Color(0x33FFFFFF),
    border: Border.all(color: const Color(0x66FFFFFF), width: 2),
  );

  // shape_hero_header.xml (gradient + corners; @color/hero_gradient_*)
  static final BoxDecoration shapeHeroHeader = BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    gradient: const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [Color(0xFF4CAF50), Color(0xFF66BB6A), Color(0xFF81C784)],
    ),
  );

  /// shape_image_picker.xml — layer-list: fill + dashed stroke.
  /// Flutter không có stroke nét đứt sẵn; đây là xấp xỉ (nền + viền liền).
  static final BoxDecoration shapeImagePicker = BoxDecoration(
    color: const Color(0xFFEAF3DE),
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: const Color(0xFFA5D6A7), width: 1.5),
  );

  // shape_icon_pill_red.xml (oval)
  static final BoxDecoration shapeIconPillRed = BoxDecoration(
    shape: BoxShape.circle,
    color: const Color(0xFFFDECEA),
  );

  // shape_btn_outline.xml
  static final BoxDecoration shapeBtnOutline = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: const Color(0xFFE0E0E0), width: 1.5),
  );

  // shape_bubble_user.xml
  static final BoxDecoration shapeBubbleUser = BoxDecoration(
    color: const Color(0xFF43A047),
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(16),
      topRight: Radius.circular(16),
      bottomLeft: Radius.circular(16),
      bottomRight: Radius.circular(4),
    ),
  );

  // shape_bubble_bot.xml
  static final BoxDecoration shapeBubbleBot = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(4),
      topRight: Radius.circular(18),
      bottomLeft: Radius.circular(18),
      bottomRight: Radius.circular(18),
    ),
    border: Border.all(color: const Color(0xFFEAF6E4), width: 1),
  );

  // shape_calories_badge.xml
  static final BoxDecoration shapeCaloriesBadge = BoxDecoration(
    color: const Color(0x1500C897),
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: const Color(0x3000C897), width: 1),
  );

  // shape_message_attachment.xml
  static final BoxDecoration shapeMessageAttachment = BoxDecoration(
    color: const Color(0x14FFFFFF),
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: const Color(0x3AFFFFFF), width: 1),
  );

  // shape_message_received.xml
  static final BoxDecoration shapeMessageReceived = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(16),
      topRight: Radius.circular(16),
      bottomLeft: Radius.circular(6),
      bottomRight: Radius.circular(16),
    ),
    border: Border.all(color: const Color(0x222E5E2E), width: 1),
  );

  // shape_message_sent.xml
  static final BoxDecoration shapeMessageSent = BoxDecoration(
    color: const Color(0xFF5AB453),
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(16),
      topRight: Radius.circular(16),
      bottomLeft: Radius.circular(16),
      bottomRight: Radius.circular(6),
    ),
  );

  // shape_online_dot.xml (oval)
  static final BoxDecoration shapeOnlineDot = BoxDecoration(
    shape: BoxShape.circle,
    color: const Color(0xFF4CAF50),
    border: Border.all(color: Colors.white, width: 1.5),
  );

  // shape_profile_social_cover.xml (angle 125° linear gradient)
  static const LinearGradient shapeProfileSocialCoverGradient = LinearGradient(
    begin: Alignment(0.55, 1.0),
    end: Alignment(-0.55, -1.0),
    colors: [Color(0xFF1B5E20), Color(0xFF4CAF70), Color(0xFFC8E6C9)],
    stops: [0.0, 0.5, 1.0],
  );

  static final BoxDecoration shapeProfileSocialCover = BoxDecoration(
    gradient: shapeProfileSocialCoverGradient,
  );

  // shape_quick_action_card.xml
  static final BoxDecoration shapeQuickActionCard = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(14),
    border: Border.all(color: const Color(0x1A2E5E2E), width: 0.5),
  );

  // shape_search_hero.xml
  static final BoxDecoration shapeSearchHero = BoxDecoration(
    color: const Color(0x1AFFFFFF),
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: const Color(0x33FFFFFF), width: 1),
  );

  // shape_section_card.xml
  static final BoxDecoration shapeSectionCard = BoxDecoration(
    color: const Color(0x12FFFFFF),
    borderRadius: BorderRadius.circular(24),
    border: Border.all(color: Colors.white, width: 1),
  );

  // shape_tag_red.xml (oval + danger stroke)
  static final BoxDecoration shapeTagRed = BoxDecoration(
    shape: BoxShape.circle,
    color: const Color(0x33FFFFFF),
    border: Border.all(color: const Color(0xFFF44336), width: 1),
  );

  // shape_tag_white.xml
  static final BoxDecoration shapeTagWhite = BoxDecoration(
    color: const Color(0x33FFFFFF),
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: const Color(0x55FFFFFF), width: 1),
  );

  // shape_unread_badge.xml (oval)
  static final BoxDecoration shapeUnreadBadge = const BoxDecoration(
    shape: BoxShape.circle,
    color: Color(0xFF4CAF50),
  );

  // shape_typing_dot.xml (oval)
  static final BoxDecoration shapeTypingDot = const BoxDecoration(
    shape: BoxShape.circle,
    color: Color(0xFFA2CB8B),
  );
}

class AndroidButtonTheme {
  const AndroidButtonTheme._();

  // bg_button_primary.xml
  static final ButtonStyle bgButtonPrimary = ButtonStyle(
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    ),
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.pressed)) {
        return const Color(0xFF66BB6A);
      }
      return null;
    }),
    overlayColor: const WidgetStatePropertyAll(Colors.transparent),
  );

  static const LinearGradient bgButtonPrimaryDefaultGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFF81C784), Color(0xFF4CAF50)],
  );

  // bg_button_outline.xml
  static final BoxDecoration bgButtonOutlineDefault = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(24),
    border: Border.all(color: const Color(0xFFA5D6A7), width: 1.5),
  );

  static final BoxDecoration bgButtonOutlinePressed = BoxDecoration(
    color: const Color(0xFFEAF6E4),
    borderRadius: BorderRadius.circular(24),
    border: Border.all(color: const Color(0xFF66BB6A), width: 1.5),
  );
}
