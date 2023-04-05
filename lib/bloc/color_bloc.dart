import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  bool initState = true;
  ColorBloc() : super(ColorInitial()) {
    on<ColorEvent>((event, emit) {
    });
    on<InitialEvent>((event, emit) {
      emit(ColorUpdateState(initialState: initState));
    });
    on<ColorToBlue>((event, emit) {
      initState = true;
      emit(ColorUpdateState(initialState: initState));
    });
    on<ColorToRed>((event, emit) {
      initState = false;
      emit(ColorUpdateState(initialState: initState));
    });
  }
}
