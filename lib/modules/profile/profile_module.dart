import 'package:flutter_modular/flutter_modular.dart';
import 'package:online_store/modules/profile/controllers/profile_controller.dart';
import 'package:online_store/modules/profile/views/profile_screen.dart';
import 'package:online_store/modules/profile/views/add_address_screen.dart';
import 'package:online_store/modules/profile/views/add_card_screen.dart';
import 'package:online_store/modules/profile/views/change_profile_picture_screen.dart';
import 'package:online_store/modules/profile/views/create_profile_screen.dart';
import 'package:online_store/modules/profile/views/edit_profile_screen.dart';

class ProfileModule extends Module {
  @override
  void binds(Injector i) {
    i.add<ProfileController>((i) => ProfileController());
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (_) => ProfileScreen());
    r.child('/addAddress', child: (_) => AddAddressScreen());
    r.child('/addCard', child: (_) => AddCardScreen());
    r.child('/changeProfilePicture',
        child: (_) => ChangeProfilePictureScreen());
    r.child('/createProfile', child: (_) => CreateProfileScreen());
    r.child('/editProfile', child: (_) => EditProfileScreen());
  }
}
