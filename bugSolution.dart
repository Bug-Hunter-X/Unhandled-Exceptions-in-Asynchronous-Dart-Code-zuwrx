```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Process jsonData here
    } else {
      // Handle specific HTTP error codes
      throw HttpException('HTTP error: ${response.statusCode}', uri: Uri.parse('https://api.example.com/data'));
    }
  } on SocketException catch (e) {
    // Handle network errors specifically
    print('Network error: $e');
    // Maybe show a 'no internet connection' message to the user
  } on FormatException catch (e) {
      // Handle JSON decoding errors
      print('JSON decoding error: $e');
  } on HttpException catch (e) {
      // Handle HTTP errors
      print('HTTP error: ${e.message}, uri: ${e.uri}');
  } catch (e) {
    // Handle any other unexpected errors
    print('An unexpected error occurred: $e');
    // Log the error for debugging
  }
}
```