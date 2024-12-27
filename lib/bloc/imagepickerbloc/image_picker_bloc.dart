import 'package:bloc/bloc.dart';
import 'package:counter_app/bloc/imagepickerbloc/image_picker_event.dart';
import 'package:counter_app/bloc/imagepickerbloc/image_picker_state.dart';
import 'package:counter_app/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

class Imagepickerbloc extends Bloc<Imagepickerevent, Imagepickerstate> {
  final ImagePickerUtils pickerUtils;
  Imagepickerbloc(this.pickerUtils) : super(Imagepickerstate()) {
    on<CameraImagePickerEvent>(_CameraImagePickerEvent);
    on<GalleryImagePickerEvent>(_GalleryImagePickerEvent);
  }
  void _CameraImagePickerEvent(
      Imagepickerevent events, Emitter<Imagepickerstate> emit) async {
    XFile? file = await pickerUtils.CamerImagePicker();
    emit(state.copyWith(file: file));
  }

  void _GalleryImagePickerEvent(
      GalleryImagePickerEvent events, Emitter<Imagepickerstate> emit) async {
    XFile? file = await pickerUtils.GalleryImagePiker();
    emit(state.copyWith(file: file));
  }
}
