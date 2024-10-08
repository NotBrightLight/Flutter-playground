import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_screen_state.freezed.dart';

// 1
@freezed
class MainScreenState with _$MainScreenState {
  const factory MainScreenState({
    @Default(0) int selectedIndex,
  }) = _MainScreenState;
}

class MainScreenStateProvider extends StateNotifier<MainScreenState> {
  MainScreenStateProvider() : super(const MainScreenState());

  void updateSelectedIndex(int index) {
    state = MainScreenState(selectedIndex: index);
  }
}