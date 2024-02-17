import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! < 0) {
          Navigator.pushNamed(context, '/imageUpload');
        }
      },
    child: Scaffold(
      appBar: AppBar(title: Text('Menu')),
      body: Center(
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: [
            buildMenuButton(
              context,
              label: 'PDF',
              icon: Icons.picture_as_pdf,
              routeName: '/pdf',
            ),
            buildMenuButton(
              context,
              label: 'Excel',
              icon: Icons.table_chart,
              routeName: '/excel',
            ),
            buildMenuButton(
              context,
              label: 'Forms',
              icon: Icons.format_align_left,
              routeName: '/forms',
            ),
            buildMenuButton(
              context,
              label: 'Gráficos',
              icon: Icons.pie_chart_outline,
              routeName: '/graphics',
            ),
          ],
        ),
      ),
    ),
    );
  }

  Widget buildMenuButton(BuildContext context, {required String label, required IconData icon, required String routeName}) {
    return Container(
      width: 150,
      height: 150,
      padding: EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, routeName),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          primary: Colors.white,
          onPrimary: Colors.black,
          onSurface: Colors.grey,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 60, color: Theme.of(context).primaryColor),
            SizedBox(height: 8),
            Text(label, style: TextStyle(color: Theme.of(context).primaryColor)),
          ],
        ),
      ),
    );
  }
}