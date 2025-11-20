part of 'services.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    try {
      print("🚀 Starting Google Sign-In...");
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        print("❌ Sign-In dibatalkan pengguna");
        return null;
      }

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      final user = userCredential.user;

      print("✅ Firebase Sign-In success: ${user?.email}");

      // --- 🔹 Dummy cek user terdaftar ---
      final bool userExists = user?.email == "dheni.serenade@gmail.com";

      if (!userExists) {
        print("🆕 User belum terdaftar: ${user?.email}");
        await launchUrl(
          Uri.parse("https://portal.bpkpenaburjakarta.or.id/register"),
          mode: LaunchMode.externalApplication,
        );
        await signOut();
        return null;
      }

      print("✅ User valid, lanjut ke aplikasi");
      return user;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.code} - ${e.message}");
      return null;
    } catch (e, stack) {
      print("Unknown error: $e");
      print(stack);
      return null;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    print("✅ User signed out successfully.");
  }
}

// part of 'services.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//   Future<User?> signInWithGoogle() async {
//     try {
//       print("Starting Google Sign-In...");

//       final googleUser = await _googleSignIn.signIn();
//       if (googleUser == null) return null;

//       final googleAuth = await googleUser.authentication;

//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       final userCredential = await _auth.signInWithCredential(credential);
//       final user = userCredential.user;

//       print("Firebase Sign-In success: ${user?.email}");

//       final idToken = await user?.getIdToken();

//       final response = await http.get(
//         Uri.parse("https://portal.bpkpenaburjakarta.or.id/api/check-user?email=${user?.email}"),
//         headers: {"Authorization": "Bearer $idToken"},
//       );

//       if (response.statusCode == 404) {
//         const registrationUrl = "https://portal.bpkpenaburjakarta.or.id/register";
//         await launchUrl(Uri.parse(registrationUrl), mode: LaunchMode.externalApplication);

//         await user?.delete();
//         await signOut();

//         return null;
//       }

//       return user;
//     } catch (e, stack) {
//       print("Error during Google Sign-In: $e");
//       print(stack);
//       return null;
//     }
//   }

//   Future<void> signOut() async {
//     try {
//       print("Signing out...");
//       await _googleSignIn.signOut();
//       await _auth.signOut();
//       print("User signed out successfully.");
//     } catch (e, stack) {
//       print("Error signing out: $e");
//       print(stack);
//     }
//   }
// }
