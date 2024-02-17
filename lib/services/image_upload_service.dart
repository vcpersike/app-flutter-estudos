import 'package:http/http.dart' as http;
import 'dart:io';

Future uploadImage(File image) async {
  var uri = Uri.parse('SEU_ENDPOINT_DE_UPLOAD');
  var request = http.MultipartRequest('POST', uri)
    ..files.add(await http.MultipartFile.fromPath('imagem', image.path));

  var response = await request.send();

  if (response.statusCode == 200) {
    print('Upload bem-sucedido');
  } else {
    print('Falha no upload');
  }
}
