


import 'package:my_app/my_app.dart';
import 'package:my_app/model/read.dart';



List reads = [];
class ReadsController extends ResourceController{

  ReadsController(this.context);

  ManagedContext context;

  @Operation.get()
  Future<Response> getAllReads() async {
    final readQuery = Query<Read>(context);

   return Response.ok(await readQuery.fetch());
  } 

  @Operation.get('id')
  Future<Response> getRead(@Bind.path('id') int id) async{
  final readQuery = Query<Read>(context)
  ..where((read) => read.id).equalTo(id);
  final read = await readQuery.fetchOne();
    if(read == null ){
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