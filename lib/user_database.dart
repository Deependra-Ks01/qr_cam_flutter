class UserDatabase {
  static final List<Map<String, String>> _users = [];

  // Function to add a new user
  static void addUser(String name, String email, String password) {
    _users.add({
      'name': name,
      'email': email,
      'password': password,
    });
  }

  // Function to verify user login
  static bool verifyUser(String email, String password) {
    for (var user in _users) {
      if (user['email'] == email && user['password'] == password) {
        return true;
      }
    }
    return false;
  }
}
