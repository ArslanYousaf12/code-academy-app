abstract class RegisterEvent {}

class UsernameChangedEvent extends RegisterEvent {
  final String username;
  UsernameChangedEvent(this.username);
}

class EmailChangedEvent extends RegisterEvent {
  final String email;
  EmailChangedEvent(this.email);
}

class PasswordChangedEvent extends RegisterEvent {
  final String password;
  PasswordChangedEvent(this.password);
}

class ConfirmPasswordChangedEvent extends RegisterEvent {
  final String confirmPassword;
  ConfirmPasswordChangedEvent(this.confirmPassword);
}
