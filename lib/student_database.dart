class StudentDatabase {
  static final List<Map<String, String>> _students = [];

  // Function to add a new student
  static void addStudent(String name, String email, String password) {
    _students.add({
      'name': name,
      'email': email,
      'password': password,
    });
  }

  // Function to verify student login
  static bool verifyStudent(String email, String password) {
    for (var student in _students) {
      if (student['email'] == email && student['password'] == password) {
        return true;
      }
    }
    return false;
  }
}
