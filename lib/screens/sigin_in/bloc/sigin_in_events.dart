abstract class SiginInEvents {
  const SiginInEvents();
}

class EmailEvent extends SiginInEvents {
  final String email;
  const EmailEvent(this.email);
}

class PasswordEvent extends SiginInEvents {
  final String password;
  const PasswordEvent(this.password);
}
