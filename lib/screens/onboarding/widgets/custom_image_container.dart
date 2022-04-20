import 'package:dating_app/config/colors.dart';
import 'package:dating_app/repositories/storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImageContainer extends StatelessWidget {
  final String? imageUrl;
  const CustomImageContainer({
    Key? key,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 10),
      child: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: const Border(
            bottom: BorderSide(width: 1),
            top: BorderSide(width: 1),
            left: BorderSide(width: 1),
            right: BorderSide(width: 1),
          ),
        ),
        child: imageUrl == null
            ? IconButton(
                icon: const Icon(Icons.add_circle, color: pink),
                onPressed: () async {
                  ImagePicker _picker = ImagePicker();
                  final XFile? _image =
                      await _picker.pickImage(source: ImageSource.gallery);

                  if (_image != null) {
                    StorageRepository().uploadImage(_image);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('No image was selected.')));
                  }
                },
              )
            : Image.network(imageUrl!, fit: BoxFit.cover),
      ),
    );
  }
}
