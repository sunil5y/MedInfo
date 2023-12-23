import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

class ProfileImage {
  static Future<Uint8List?> pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);

    if (_file != null) {
      return await _file.readAsBytes();
    }
    print('No Image Selected');
    return null;
  }
}
