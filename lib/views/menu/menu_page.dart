import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        // Verifica se o gesto foi um arrastar para a esquerda
        if (details.primaryVelocity! < 0) { // Verifica se a velocidade é negativa, o que indica um arrasto para a esquerda
          Navigator.pushNamed(context, '/customerService');
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
      width: 150, // Largura do botão
      height: 150, // Altura do botão
      padding: EdgeInsets.all(8), // Padding dentro do container
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, routeName),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18), // Bordas arredondadas
          ),
          primary: Colors.white, // Cor de fundo do botão
          onPrimary: Colors.black, // Cor do texto e ícone para botão em estado ativo (light theme)
          onSurface: Colors.grey, // Cor do texto e ícone quando o botão está desabilitado
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Para garantir que os itens fiquem centralizados
          children: [
            Icon(icon, size: 60, color: Theme.of(context).primaryColor), // Ícone com cor definida
            SizedBox(height: 8),
            Text(label, style: TextStyle(color: Theme.of(context).primaryColor)), // Texto com cor definida
          ],
        ),
      ),
    );
  }
}