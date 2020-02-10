


import 'package:my_app/my_app.dart';
import 'package:my_app/model/read.dart';


List<Read> reads = [
 Read()
 ..readFromMap( {
    'title': 'Head First Design Patterns',
    'author': 'Eric Freeman',
    'year': 2004
  }),
  Read()
  ..readFromMap({
    'title': 'Clean Code: A handbook of Agile Software Craftsmanship',
    'author': 'Robert C. Martin',
    'year': 2008
  }),
  Read()
  ..readFromMap({
    'title': 'Code Complete: A Practical Handbook of Software Construction',
    'author': 'Steve McConnell',
    'year': 2004
  }),
];

class ReadsController extends ResourceController{
  @Operation.get()
  Future<Response> getAllReads() async => Response.ok(reads);

  @Operation.get('id')
  Future<Response> getRead(@Bind.path('id') int id, @Bind.body() Read body) async{
    if(id < 0 || id > reads.length-1){
      return Response.notFound(body:'Item not found');
    }
    
    return Response.ok(reads[id]);
  }

  @Operation.post()
  Future<Response> createdNewRead(@Bind.body() Read body) async{
    

    reads.add(body);
    return Response.ok(body);
  }

  @Operation.put('id')
  Future<Response> updatedRead(@Bind.path('id') int id, 
  @Bind.body() Read body,) async{
    if( id < 0 || id > reads.length - 1 ){
      return Response.notFound(body:'Item not found.');
    }
    
    reads[id] = body;
    return Response.ok('updated new read');
  }

  @Operation.delete('id')
  Future<Response> deletedRead(@Bind.path('id') int id) async{
    if( id < 0 || id > reads.length - 1 ){
      return Response.notFound(body:'Item not found.');
    }
    reads.removeAt(id);
    return Response.ok('Deleted read');
  }
}