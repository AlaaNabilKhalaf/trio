abstract class AuthStates {}
class AuthInitialState extends AuthStates {}


class ApiLoginLoading extends AuthStates {}
class ApiLoginSuccess extends AuthStates {}
class ApiLoginFailed extends AuthStates {
  final String message;
  ApiLoginFailed({required this.message});
}

class GoogleAuthLoading extends AuthStates {}
class GoogleAuthSuccess extends AuthStates {}
class GoogleAuthFailed extends AuthStates {}
class GoogleAuthLoggedOUT extends AuthStates {}


class CacheLoading extends AuthStates {}
class CacheSuccess extends AuthStates {}
class CacheFailed extends AuthStates {}



class GoogleAuthAndLoginSuccess extends AuthStates {}
