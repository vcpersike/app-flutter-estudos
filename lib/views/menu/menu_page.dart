import 'package:estudos/components/footer.dart';
import 'package:estudos/components/header.dart';
import 'package:estudos/components/menu_button.dart';
import 'package:estudos/models/router_names.dart';
import 'package:estudos/views/image_upload/image_upload_page.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

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
                  onAvatarTap: () => Navigator.pushNamed(context, routePaths[RouteNames.profile]!),

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
                      routeName: routePaths[RouteNames.pdf]!,
                    ),
                    MenuButton(
                      label: 'Excel',
                      icon: Icons.table_chart,
                      routeName: routePaths[RouteNames.excel]!,
                    ),
                    MenuButton(
                      label: 'Forms',
                      icon: Icons.format_align_left,
                      routeName: routePaths[RouteNames.forms]!,
                    ),
                    MenuButton(
                      label: 'Gráficos',
                      icon: Icons.pie_chart_outline,
                      routeName: routePaths[RouteNames.graphics]!,
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
