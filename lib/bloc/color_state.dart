part of 'color_bloc.dart';

@immutable
abstract class ColorState {}

class ColorInitial extends ColorState {}

class ColorUpdateState extends ColorState {
  bool? initialState;
  
  ColorUpdateState({
    this.initialState,
  });
}
