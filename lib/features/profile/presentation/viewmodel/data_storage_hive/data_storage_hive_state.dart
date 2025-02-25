part of 'data_storage_hive_cubit.dart';

@immutable
abstract class DataStorageHiveState {}

class DataStorageHiveInitial extends DataStorageHiveState {}

class DataStorageHiveSuccess extends DataStorageHiveState {
  DataStorageHiveSuccess();
}

class DataStorageHiveFailure extends DataStorageHiveState {
  final String message;
  DataStorageHiveFailure(this.message);
}

class DataStorageHiveLoading extends DataStorageHiveState {
  DataStorageHiveLoading();
}
