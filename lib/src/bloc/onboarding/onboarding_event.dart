// ignore_for_file: camel_case_types

part of 'onboarding_bloc.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

final class pageChanged extends OnboardingEvent {
  final int page;

  const pageChanged({required this.page});

  @override
  List<Object> get props => [page];
}

final class getStartedTapped extends OnboardingEvent {}