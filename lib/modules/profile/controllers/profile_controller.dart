import 'package:get/get.dart';
import 'package:online_store/modules/profile/services/user_model.dart';

class ProfileController extends GetxController {
  var userProfile = UserModel(
    name: '',
    age: 0,
    email: '',
    address: '',
    hasCreditCard: false,
  ).obs;

  bool get isProfileComplete {
    return userProfile.value.name.isNotEmpty;
  }

  void updateProfile(UserModel profile) {
    userProfile.value = profile;
  }

  void addCreditCard(String number, String expiry, String cvv) {
    userProfile.value.cardNumber = number;
    userProfile.value.cardExpiry = expiry;
    userProfile.value.cardCVV = cvv;
    userProfile.value.hasCreditCard = true;
  }
}
