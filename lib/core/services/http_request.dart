// 通常文件命名使用小写,各单词之间用下划线分隔

import './config.dart';
import 'package:dio/dio.dart';

class HttpRequest {
  // 创建基础配置
  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseURL, connectTimeout: HttpConfig.timeout);

  // 创建Dio对象
  static final Dio dio = Dio(baseOptions);

  // 创建通用网络请求函数
  static Future<T> request<T>(
    String url, {
    String? method = 'get',
    Map<String, dynamic>? params,
    Interceptor? interceptor,
  }) async {
    // 1.创建单独配置
    final options = Options(method: method);

    // 2.创建请求拦截器
    // 创建默认的全局拦截器
    Interceptor dInter = InterceptorsWrapper(
      onRequest: (options, handle) {
        print('请求拦截~');
        return handle.next(options);
      },
      onResponse: (response, handle) {
//        print('响应拦截~response.data:${response.data}');
        return handle.next(response);
      },
      onError: (error, handle) {
//        print('失败拦截~');
        return handle.next(error);
      },
    );

    List<Interceptor> inters = [dInter];

    // 合并调用者设置的拦截器
    if (interceptor != null) {
      inters.add(interceptor);
    }

    dio.interceptors.addAll(inters);

    // 3.发送网络请求
    try {
      Response response =
          await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (error) {
      return Future.error('------$error------');
    }
  }
}
