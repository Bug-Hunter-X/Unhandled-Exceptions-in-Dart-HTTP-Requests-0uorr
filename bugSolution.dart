```dart
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data')).timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } on SocketException catch (e) {
    print('Socket exception: $e');
  } on TimeoutException catch (e) {
    print('Timeout exception: $e');
  } on FormatException catch (e) {
    print('JSON format exception: $e');
  } catch (e) {
    print('General error: $e');
    rethrow;
  }
}
```