import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/core/routes.dart';
import 'package:flutter_news/presentation/bloc/navigation/navigation_bloc.dart';

class BottomTabBar extends StatelessWidget {
  const BottomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.favorite_outline,
              ),
              selectedIcon: Icon(Icons.favorite),
              label: "Favorite",
            ),
          ],
          selectedIndex: state.currentIndex,
          onDestinationSelected: (int index) {
            Navigator.pushReplacementNamed(context, tabs[index]);
            context.read<NavigationBloc>().add(NavigateTo(currentIndex: index));
          },
        );
      },
    );
  }
}
