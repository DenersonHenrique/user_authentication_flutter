class AppUrl {
  static String authenticationUrl(String urlSegment, String authKey) =>
      'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=$authKey';
}
