import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 5.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.location_on, 'Track Me', 0),
          _buildNavItem(Icons.warning_outlined, 'SOS', 1),
          _buildNavItem(Icons.check_circle_outline, 'Safe Zones', 2),
          _buildNavItem(Icons.security_outlined, 'Safety Resources', 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        onItemTapped(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: selectedIndex == index ? Colors.pink : Colors.black,
            size: 24.0,
          ),
          SizedBox(height: 4.0),
          Text(
            label,
            style: TextStyle(
              color: selectedIndex == index ? Colors.pink : Colors.black,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
