


import 'package:my_app/my_app.dart';
import 'package:my_app/model/read.dart';


List reads = [
  {
    'title': 'Head First Design Patterns',
    'author': 'Eric Freeman',
    'year': 2004
  },
  {
    'title': 'Clean Code: A handbook of Agile Software Craftsmanship',
    'author': 'Robert C. Martin',
    'year': 2008
  },
  {
    'title': 'Code Complete: A Practical Handbook of Software Construction',
    'author': 'Steve McConnell',
    'year': 2004
  },
];

class ReadsController extends ResourceController{
  @override
 

  @Operation.get()
  Future<Response> getAllowed() async{
    return Response.ok(reads);
  }

  @Operation.get('id')
  Future<Response> getRead(@Bind.path('id') int id) async{
    if(id < 0 || id > reads.length-1){
      return Response.notFound(body:'Item not found');
    }
    
    return Response.ok(reads[id]);
  }

  @Operation.post()
  Future<Response> createdNewRead(@Bind.body() Read body) async{
    final Map<String, dynamic> body =  request.body.as();

    reads.add(body);
    return Response.ok(body);
  }

  @Operation.put('id')
  Future<Response> updatedRead(@Bind.path('id') int id) async{
    if( id < 0 || id > reads.length - 1 ){
      return Response.notFound(body:'Item not found.');
    }
    final Map<String, dynamic> body =  request.body.as();
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