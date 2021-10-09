class AuthUtils {
  static String authAction(bool isAuthenticated) =>
      isAuthenticated ? 'signInWithPassword' : 'signUp';
}
