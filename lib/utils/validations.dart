class Validations {
  const Validations();

  static isNull(String? field, String label) {
    if (field == null || field.isEmpty) {
      return 'É necessário um $label';
    }

    return null;
  }

  static email(String? email) {
    if (email == null || !email.contains('@') || !email.contains('.')) {
      return 'Insira um email válido!';
    }

    return null;
  }

  static password(String? password) {
    if (password == null || password.length < 6 || password.isEmpty) {
      return 'Insira uma senha válida!';
    }

    return null;
  }

  static bool verifyPasswords(String password, String passwordConfirm) {
    if (password.compareTo(passwordConfirm) == 0) {
      return true;
    }

    return false;
  }
}
