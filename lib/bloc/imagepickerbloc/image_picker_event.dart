import 'package:equatable/equatable.dart';

abstract class Imagepickerevent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CameraImagePickerEvent extends Imagepickerevent {}

class GalleryImagePickerEvent extends Imagepickerevent {}
