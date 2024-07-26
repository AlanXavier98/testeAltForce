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
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => ProfileController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => ProfileScreen()),
        ChildRoute('/addAddress', child: (_, __) => AddAddressScreen()),
        ChildRoute('/addCard', child: (_, __) => AddCardScreen()),
        ChildRoute('/changeProfilePicture',
            child: (_, __) => ChangeProfilePictureScreen()),
        ChildRoute('/createProfile', child: (_, __) => CreateProfileScreen()),
        ChildRoute('/editProfile', child: (_, __) => EditProfileScreen()),
      ];
}
