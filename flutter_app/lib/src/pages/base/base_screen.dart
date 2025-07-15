import 'package:catalogo_produtos/src/pages/home/home_tab.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
   const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          HomeTab(),
          Container(color: Colors.yellow,),
          Container(color: Colors.blue,),
          Container(color: Colors.purple,),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pageController.jumpToPage(index);
          });

        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 129, 63, 242),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        items: const[
          BottomNavigationBarItem(
            icon: 
            Icon(Icons.home_outlined),
            label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Carrinho',
              ),
            BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pedidos',
            ),
          BottomNavigationBarItem(
            icon: 
            Icon(Icons.person_outlined),
            label: 'Perfil',
            ),

            ]),
    );
  }
}