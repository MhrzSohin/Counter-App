import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class Imagepickerstate extends Equatable {
  final XFile? file;
  const Imagepickerstate({this.file});
  Imagepickerstate copyWith({XFile? file}) {
    return Imagepickerstate(file: file);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [file];
}
