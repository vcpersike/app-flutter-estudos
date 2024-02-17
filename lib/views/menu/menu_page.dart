import 'package:estudos/components/footer.dart';
import 'package:estudos/components/header.dart';
import 'package:estudos/components/menu_button.dart';
import 'package:estudos/views/image_upload/image_upload_page.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.primaryDelta! > 20) {
          Navigator.pop(context);
        } else if (details.primaryDelta! < -20) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ImageUploadPage()));
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.zero,
                child: Header(
                  title: 'Menu',
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    MenuButton(
                      label: 'PDF',
                      icon: Icons.picture_as_pdf,
                      routeName: '/pdf',
                    ),
                    MenuButton(
                      label: 'Excel',
                      icon: Icons.table_chart,
                      routeName: '/excel',
                    ),
                    MenuButton(
                      label: 'Forms',
                      icon: Icons.format_align_left,
                      routeName: '/forms',
                    ),
                    MenuButton(
                      label: 'Gráficos',
                      icon: Icons.pie_chart_outline,
                      routeName: '/graphics',
                    ),
                  ],
                ),
              ),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}
