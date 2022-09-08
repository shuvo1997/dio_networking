import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final Dio dio = Dio(
    BaseOptions(
      connectTimeout: 5 * 1000,
      receiveTimeout: 5 * 1000,
    ),
  );

  Dio getDio() {
    dio.interceptors.clear();
    // dio.interceptors.add(
    //   InterceptorsWrapper(
    //     onRequest: (request, handlers) {
    //       request.headers['Authorization'] = 'token';
    //       return handlers.next(request);
    //     },
    //     onError: (e, handler) async {
    //       print('On error');
    //       print(e.error);
    //       final response = await dio.get(DioUserRepositoryImpl.userEndpoint);
    //       return handler.resolve(response);
    //     },
    //     onResponse: (response, handler) {
    //       Data user = Data.fromJson(response.data['data']);
    //       user.firstName = 'Jannat';
    //       user.lastName = 'Ferdous';
    //       response.data['data'] = user.toJson();
    //       return handler.next(response);
    //     },
    //   ),
    // );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
    return dio;
  }
}
