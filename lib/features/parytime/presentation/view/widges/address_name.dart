import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/parytime/presentation/viewmodel/address_name/address_name_cubit.dart';

import '../../../../../util/Appconstrains.dart';

class address_name extends StatelessWidget {
  const address_name({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressNameCubit, AddressNameState>(
      builder: (context, state) {
        if (state is AddressNameError) {
          return Text(
            'لم يتم العثور على العنوان',
            style: Appconstrains.tajawal_medium.copyWith(
              color: Appconstrains.secondaryColor,
              fontSize: 20.0,
            ),
          );
        }
        if (state is AddressNameLoaded) {
          return Text(
            state.addressName,
            style: Appconstrains.tajawal_medium.copyWith(
              color: Appconstrains.secondaryColor,
              fontSize: 18.0,
            ),
          );
        }
        return CircularProgressIndicator(
          color: Appconstrains.secondaryColor,
        );
      },
    );
  }
}
