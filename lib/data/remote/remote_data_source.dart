import 'package:clean_architecture_layer_exam/data/remote/model/image_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

///
/// clean_architecture_layer_exam
/// File Name: remote_data_source
/// Created by sujangmac
///
/// Description:
///
part 'remote_data_source.g.dart';

@RestApi(baseUrl: 'https://api.thedogapi.com/v1')
abstract class RemoteDataSource {
  factory RemoteDataSource(Dio dio, {String baseUrl}) = _RemoteDataSource;

  @GET('/images/search')
  Future<List<ImageResponse>> getDogImages(@Query('limit') int? limit);
}
