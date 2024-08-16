class EndPoints {
  static const String baseUrl = 'https://api.example.com/';
  static const String signIn = 'auth/signin';
  static const String signUp = 'auth/signup';
  static const String signOut = 'auth/signout';
  static String getUserProfile(String id) => 'users/get-user/$id';
}

class ApiKey {
  static const String status = "status";
  static const String errorMessage = "ErrorMessage";
  static const String email = "email";
  static const String password = "password";
  static const String token = "token";
  static const String id = "id";
  static const String message = "message";
}
