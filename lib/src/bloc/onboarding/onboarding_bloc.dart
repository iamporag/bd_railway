import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial()) {
    on<pageChanged>(_onPageChanged);
  }

  FutureOr<void> _onPageChanged(
      pageChanged event, Emitter<OnboardingState> emit) {
        final showGetStarted = event.page == 2;
        emit(state.copyWith(
          currentPage: event.page,
          showGetStarted: showGetStarted,
        ));
      }
}
