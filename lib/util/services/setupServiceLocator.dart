import 'package:get_it/get_it.dart';
import 'package:quran_app/features/parytime/presentation/viewmodel/address_name/address_name_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  // Register your Cubit as a singleton
  getIt.registerSingleton<AddressNameCubit>(AddressNameCubit());
}
