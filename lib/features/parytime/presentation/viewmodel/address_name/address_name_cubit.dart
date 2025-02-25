import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart'
    show Geolocator, LocationAccuracy, LocationPermission, Position;
import 'package:meta/meta.dart';

part 'address_name_state.dart';

class AddressNameCubit extends Cubit<AddressNameState> {
  AddressNameCubit() : super(AddressNameInitial());

  Future<void> getAddressFromLatLng() async {
    emit(AddressNameLoading());
    // Call the getAddressFromLatLng method and handle the result
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(AddressNameError("Location services are disabled."));
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(AddressNameError("Location permission denied."));
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(AddressNameError("Location permissions are permanently denied."));
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        String address = "${place.country}, ${place.administrativeArea}";
        emit(AddressNameLoaded(address));
        return;
      }

      emit(AddressNameError("Address not found."));
    } catch (e) {
      emit(AddressNameError("An error occurred: $e"));
    }
  }
}
