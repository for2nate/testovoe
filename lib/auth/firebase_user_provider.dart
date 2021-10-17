import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class TestovoeFirebaseUser {
  TestovoeFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

TestovoeFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<TestovoeFirebaseUser> testovoeFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<TestovoeFirebaseUser>(
            (user) => currentUser = TestovoeFirebaseUser(user));
