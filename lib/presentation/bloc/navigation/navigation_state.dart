part of 'navigation_bloc.dart';


class NavigationState extends Equatable {

  final int currentIndex;


  const NavigationState({required this.currentIndex});


  @override

  List<Object> get props => [currentIndex];

}


final class NavigationInitial extends NavigationState {

  const NavigationInitial({required super.currentIndex});

}

