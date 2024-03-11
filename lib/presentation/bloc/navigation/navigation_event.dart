part of 'navigation_bloc.dart';


sealed class NavigationEvent extends Equatable {

  const NavigationEvent();


  @override

  List<Object> get props => [];

}


class NavigateTo extends NavigationEvent {

  final int currentIndex;


  const NavigateTo({required this.currentIndex});

}

