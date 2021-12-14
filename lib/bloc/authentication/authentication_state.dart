
import 'package:admin_panel/model/user.dart';

abstract class AuthenticationState {
  AuthenticationState([List props = const []]) : super();
}

class Uninitialized extends AuthenticationState {
  @override
  String toString() => 'Uninitialized';

//  @override
//  // TODO: implement props
//  List<Object> get props => null;
}

class FirstOpenApp extends AuthenticationState {
  @override
  String toString() => 'FirstOpenApp';

//  @override
//  // TODO: implement props
//  List<Object> get props => null;
}

class Authenticated extends AuthenticationState {
  final User userInfo;

  Authenticated({
    required this.userInfo,
  }) : super([ userInfo.token]);

//  // TODO: implement props
  List<Object> get props => [userInfo];
}

class Unauthenticated extends AuthenticationState {
  Unauthenticated();
//  @override
//  // TODO: implement props
//  List<Object> get props => null;
}


class CompleteProfile extends AuthenticationState {
  final User userInfo;
  CompleteProfile({    required this.userInfo
  });
//  @override
//  // TODO: implement props
//  List<Object> get props => null;
}

class MostUpdateApp extends AuthenticationState {
  MostUpdateApp();
//  @override
//  // TODO: implement props
//  List<Object> get props => null;
}
