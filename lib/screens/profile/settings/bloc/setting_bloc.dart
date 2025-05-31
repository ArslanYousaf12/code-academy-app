import 'package:code_academy_app/screens/profile/settings/bloc/setting_events.dart';
import 'package:code_academy_app/screens/profile/settings/bloc/setting_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingBloc extends Bloc<SettingEvent, SettingStates> {
  SettingBloc() : super(const SettingStates()) {
    on<TriggerSetting>(_triggerSetting);
  }
  _triggerSetting(TriggerSetting event, Emitter<SettingStates> emit) {
    emit(SettingStates());
  }
}
