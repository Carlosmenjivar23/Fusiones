import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dart_tarea_3/types/imagen.dart'; 
Future<List<Imagen>> fetchImagenes() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return imagenFromJson(json.encode(data));
  } else {
    throw Exception('Failed to load imagenes');
  }
}

void main() async {
  try {
    final List<Imagen> imagenes = await fetchImagenes();
    print('Imágenes obtenidas:');
    imagenes.forEach((imagen) {
      print('ID: ${imagen.id}, Título: ${imagen.title}, URL: ${imagen.url}');
    });
  } catch (e) {
    print('Error: $e');
  }
}
