import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petsly/data/firestore.dart';
import 'package:petsly/features/auth/bloc/auth_state_cubit.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context
        .watch<AuthStateCubit>()
        .state
        .whenOrNull(loggedIn: (user) => user);

    return user != null
        ? StreamBuilder<QuerySnapshot>(
            stream: context
                .read<Firestore>()
                .getDocumentStream(collectionPath: 'users'),
            builder: (context, snapshot) {
              if (snapshot.hasError ||
                  snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              final userDoc = snapshot.data!.docs.firstWhere((doc) {
                return doc.mappedData['id'] == user.uid;
              });
              final photoUrl = userDoc.mappedData['photoUrl'] as String?;

              return _Body(photoUrl: photoUrl, userDoc: userDoc);
            },
          )
        : const CircularProgressIndicator();
  }
}

class _Body extends HookWidget {
  const _Body({
    Key? key,
    required this.photoUrl,
    required this.userDoc,
  }) : super(key: key);

  final String? photoUrl;
  final QueryDocumentSnapshot<Object?> userDoc;

  @override
  Widget build(BuildContext context) {
    final photoLoading = useState(false);

    return Column(
      children: [
        const SizedBox(height: 24),
        _Image(
          photoUrl: photoUrl,
          photoLoading: photoLoading,
        ),
        const SizedBox(height: 24),
        _ChangePhotoButtons(
          userDoc: userDoc,
          photoUrl: photoUrl,
          photoLoading: photoLoading,
        ),
        Text(userDoc.mappedData['phone']),
        Text(userDoc.mappedData['name']),
      ],
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    Key? key,
    required this.photoUrl,
    required this.photoLoading,
  }) : super(key: key);

  final String? photoUrl;
  final ValueNotifier<bool> photoLoading;

  @override
  Widget build(BuildContext context) {
    final photoUrl = this.photoUrl;

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
    required this.userDoc,
    required this.photoUrl,
    required this.photoLoading,
  }) : super(key: key);

  final QueryDocumentSnapshot userDoc;
  final String? photoUrl;
  final ValueNotifier<bool> photoLoading;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () => _loadImage(context, ImageSource.camera),
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
          onTap: () => _loadImage(context, ImageSource.gallery),
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

  Future<void> _loadImage(
    BuildContext context,
    ImageSource source,
  ) async {
    final file = await ImagePicker().pickImage(source: source);
    final storage = FirebaseStorage.instance
        .ref('${userDoc.mappedData['id']}-profilePhoto');

    if (file != null) {
      photoLoading.value = true;
      final bytes = await file.readAsBytes();
      final uploadTask = await storage.putData(bytes);

      final imageUri = await uploadTask.ref.getDownloadURL();
      final id = userDoc.id;

      await context.read<Firestore>().updateDocument(
        collectionPath: 'users',
        docId: id,
        data: {
          'photoUrl': imageUri,
        },
      );
      photoLoading.value = false;
    }
  }
}
