class RegisterStates {}

class RegisterInitialState extends RegisterStates {
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;
  final bool isLoading;
  RegisterInitialState({
    this.userName = "",
    this.email = "",
    this.password = "",
    this.confirmPassword = "",
    this.isLoading = false,
  });
  RegisterInitialState copyWith({
    String? userName,
    String? email,
    String? password,
    String? confirmPassword,
    bool? isLoading,
  }) {
    return RegisterInitialState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
