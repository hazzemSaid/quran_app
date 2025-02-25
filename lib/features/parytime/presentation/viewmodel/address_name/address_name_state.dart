part of 'address_name_cubit.dart';

@immutable
abstract class AddressNameState {}

class AddressNameInitial extends AddressNameState {}

class AddressNameLoading extends AddressNameState {}

class AddressNameLoaded extends AddressNameState {
  final String addressName;

  AddressNameLoaded(this.addressName);
}

class AddressNameError extends AddressNameState {
  final String message;

  AddressNameError(this.message);
}
