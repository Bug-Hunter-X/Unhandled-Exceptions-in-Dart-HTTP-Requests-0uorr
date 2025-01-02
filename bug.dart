```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Success!
      final data = jsonDecode(response.body);
      // Process the data
      print(data);
    } else {
      // Error!
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions, this might not catch all errors
    print('Error: $e');
    // Re-throw the error to be handled by a higher-level mechanism
    rethrow;
  }
}
```