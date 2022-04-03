import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petsly/features/auth/bloc/auth_state_cubit.dart';
import 'package:provider/provider.dart';

class UserProfile extends HookWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context
        .watch<AuthStateCubit>()
        .state
        .whenOrNull(loggedIn: (user) => user);

    final photoUrl = useState(user?.photoURL);
    final photoLoading = useState(false);

    return user != null
        ? SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 24),
                _Image(
                  photoUrl: photoUrl,
                  photoLoading: photoLoading,
                ),
                const SizedBox(height: 24),
                _ChangePhotoButtons(
                  user: user,
                  photoUrl: photoUrl,
                  photoLoading: photoLoading,
                ),
              ],
            ),
          )
        : const CircularProgressIndicator();
  }
}

class _Image extends StatelessWidget {
  const _Image({
    Key? key,
    required this.photoUrl,
    required this.photoLoading,
  }) : super(key: key);

  final ValueNotifier<String?> photoUrl;
  final ValueNotifier<bool> photoLoading;

  @override
  Widget build(BuildContext context) {
    final photoUrl = this.photoUrl.value;

    if (photoUrl == null) {
      return const Icon(
        Icons.account_circle,
        color: Colors.grey,
        size: 128,
      );
    }
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: photoLoading.value ? 0.5 : 1,
          child: ClipOval(
            child: CachedNetworkImage(
              width: 128,
              height: 128,
              imageUrl: photoUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (photoLoading.value) const CircularProgressIndicator()
      ],
    );
  }
}

class _ChangePhotoButtons extends StatelessWidget {
  const _ChangePhotoButtons({
    Key? key,
    required this.user,
    required this.photoUrl,
    required this.photoLoading,
  }) : super(key: key);

  final User user;
  final ValueNotifier<String?> photoUrl;
  final ValueNotifier<bool> photoLoading;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () => _loadImage(ImageSource.camera),
          child: Container(
            width: 144,
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.blue),
            ),
            child: const Text('Zrób zdjęcie'),
          ),
        ),
        const SizedBox(width: 24),
        InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () => _loadImage(ImageSource.gallery),
          child: Container(
            width: 144,
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.blue),
            ),
            child: const Text('Wybierz zdjęcie'),
          ),
        )
      ],
    );
  }

  Future<void> _loadImage(ImageSource source) async {
    final file = await ImagePicker().pickImage(source: source);
    final storage = FirebaseStorage.instance.ref('${user.uid}-profilePhoto');

    if (file != null) {
      photoLoading.value = true;
      final bytes = await file.readAsBytes();
      final uploadTask = await storage.putData(bytes);

      final imageUri = await uploadTask.ref.getDownloadURL();
      photoLoading.value = false;

      photoUrl.value = imageUri;

      await user.updatePhotoURL(imageUri);
    }
  }
}
