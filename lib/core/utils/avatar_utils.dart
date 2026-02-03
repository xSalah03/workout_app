/// Utilities for generating placeholder/avatar URLs
class AvatarUtils {
  AvatarUtils._();

  /// Generate a placeholder avatar URL from display name
  /// Uses UI Avatars API - no signup required, works offline-friendly
  /// If [name] is null/empty, returns a default generic avatar
  static String getPlaceholderAvatarUrl(String? name, {int size = 200}) {
    final displayName = (name ?? 'User').trim();
    if (displayName.isEmpty) {
      return 'https://ui-avatars.com/api/?name=User&size=$size&background=random';
    }
    // Encode for URL safety
    final encoded = Uri.encodeComponent(displayName);
    return 'https://ui-avatars.com/api/?name=$encoded&size=$size&background=random';
  }
}
