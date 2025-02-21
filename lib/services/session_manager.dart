// class SessionManager {
//   static final SessionManager _instance = SessionManager._internal();
//   factory SessionManager() => _instance;
//   SessionManager._internal();

//   dynamic _currentUser;

//   void setUser(dynamic user) {
//     _currentUser = user;
//   }

//   dynamic getCurrentUser() => _currentUser;

//   String? getCurrentUserEmail() {
//     return _currentUser?.email;
//   }

//   String? getCurrentUserId() => _currentUser?.uid;

//   void logout() {
//     _currentUser = null;
//   }
// }

class SessionManager {
  static final SessionManager _instance = SessionManager._internal();
  factory SessionManager() => _instance;
  SessionManager._internal();

  dynamic _currentUser;

  void setUser(dynamic user) {
    _currentUser = user;
  }

  dynamic getCurrentUser() => _currentUser;

  String? getCurrentUserEmail() {
    return _currentUser?.email;
  }

    String? getCurrentToken() {
    return _currentUser?.token;
  }

  String? getCurrentUserId() => _currentUser?.uid;

  void logout() {
    _currentUser = null;
  }
}