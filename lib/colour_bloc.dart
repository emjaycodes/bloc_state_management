import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ChangeColourCubit extends Cubit<bool> {
  ChangeColourCubit(super.initialState);
  bool get initialState => true;

  void ColorToBlue() => emit(state);
  void ColorToRed() => emit(!state);
}

class ColorEvents {}
