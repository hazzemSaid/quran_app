import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'parytime_state.dart';

class ParytimeCubit extends Cubit<ParytimeState> {
  ParytimeCubit() : super(ParytimeInitial());
  //  final url = Uri.parse('https://api.aladhan.com/v1/timings?latitude=$latitude&longitude=$longitude&method=2');
}
