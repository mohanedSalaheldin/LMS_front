import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'borrows_state.dart';

class BorrowsCubit extends Cubit<BorrowsState> {
  BorrowsCubit() : super(BorrowsInitial());
}
