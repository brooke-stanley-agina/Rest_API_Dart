import 'app.dart';

void main() {
  final harness = Harness()..install();

  test('GET /reads a 200 OK', () async{
    final response = await harness.agent.get('/reads');
    expect(response.statusCode, 200);
  });
}