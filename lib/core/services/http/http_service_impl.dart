import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:softshop_mobile/app/locator.dart';
import 'package:softshop_mobile/core/exceptions/network_exception.dart';
import 'package:softshop_mobile/core/services/http/http_service.dart';
import 'package:softshop_mobile/core/utils/logger.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../utils/network_utils.dart' as network_utils;

/// Helper service that abstracts away common HTTP Requests
class HttpServiceImpl extends HttpService {
  final NavigationService _navigationService = locator<NavigationService>();
  // final _userService = locator<UserService>();
  // User get user => _userService.user;

  final _dio = Dio(BaseOptions(connectTimeout: 50000));

  @override
  setHeader() {
    // _userService.getUser();
    Map<String, dynamic> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    // if ( this.user != null ) {
    //   header['Authorization'] = '${this.user.token.tokenType} ${this.user.token.accessToken}';
    // }

    _dio.options.headers.addAll(header);
  }

  @override
  void dispose() {
    _dio.clear();
    _dio.close(force: true);
  }

  @override
  clearHeaders() {
    _dio.options.headers.clear();
  }

  @override
  Future<dynamic> getHttp(String route, {Map<String, dynamic> params, bool refreshed: false}) async {
    Response response;
    params?.removeWhere((key, value) => value == null);
    final fullRoute = '${env['API']}$route';
    if(env['APP_DEBUG'] == 'true') {
      Logger.d('[GET] Sending $params to $fullRoute');
    }
    

    try {
      setHeader();
      response = await _dio.get(
        fullRoute,
        queryParameters: params,
        options: Options(
          contentType: 'application/json',
        ),
      );
    } on DioError catch (e) {
      
      if(env['APP_DEBUG'] == 'true') {
        Logger.e('HttpService: Failed to GET $fullRoute: Error message: ${e.message}');
      }
      
      if(env['APP_DEBUG'] == 'true') {
        debugPrint('Http response data is: ${e.response?.data}');
      }

      if (e.response?.statusCode == 401) {
        // _navigationService.clearStackAndShow(Routes.authenticate);
        // return AuthException('Invalid token and credentials');
      }
      
      throw NetworkException( e.message); //e.response?.data != null ? e.response.data['message'] ?? e.message : e.message
    }

    if(env['APP_DEBUG'] == 'true') {
      Logger.d('Received Response: $response');
    }

    network_utils.checkForNetworkExceptions(response);

    return response.data;
    // return network_utils.decodeResponseBodyToJson(response.data);
  }

  @override
  Future<dynamic> postHttp(String route, dynamic body, {Map<String, dynamic> params}) async {
    Response response;
    params?.removeWhere((key, value) => value == null);
    body?.removeWhere((key, value) => value == null);
    final fullRoute = '${env['API']}$route';
    // debugPrint('[POST] Sending $body to $fullRoute');
    if(env['APP_DEBUG'] == 'true') {
      Logger.d('[POST] Sending $body to $fullRoute');
    }
    

    try {
      setHeader();
      
      response = await _dio.post(
        fullRoute,
        data: body,
        queryParameters: params,
        onSendProgress: network_utils.showLoadingProgress,
        onReceiveProgress: network_utils.showLoadingProgress,
        options: Options(
          contentType: 'application/json',
        ),
      );
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        // _navigationService.clearStackAndShow(Routes.authenticate);
        // throw AuthException('Invalid token and credentials');
      }
      if(env['APP_DEBUG'] == 'true') {
        Logger.e('HttpService: Failed to POST ${e.response?.data['message']}');
      }
      

      if(env['APP_DEBUG'] == 'true') {
        debugPrint('Http response data is: ${e.message}');
      }
      
      // return e.response?.data;
      throw NetworkException(e.response?.data != null ? e.response.data['message'] ?? e.message : e.message);
    }

    // network_utils.checkForNetworkExceptions(response);
    if(env['APP_DEBUG'] == 'true') {
      Logger.d('Received Response: $response');
    }
    

    return response?.data;
    // return network_utils.decodeResponseBodyToJson(response.data);
  }

  @override
  Future putHttp(String route, body, {Map<String, dynamic> params, refreshed: false}) async {
    Response response;
    params?.removeWhere((key, value) => value == null);
    body?.removeWhere((key, value) => value == null);

    Logger.d('[PUT] Sending $body to $route');

    try {
      setHeader();
      final fullRoute = '${env['API']}$route';
      response = await _dio.put(
        fullRoute,
        data: body,
        queryParameters: params,
        onSendProgress: network_utils.showLoadingProgress,
        onReceiveProgress: network_utils.showLoadingProgress,
        options: Options(
          contentType: 'application/json',
        ),
      );
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        // _navigationService.clearStackAndShow(Routes.signinViewRoute);
        // throw AuthException('Invalid token and credentials');
      }
      Logger.e('HttpService: Failed to PUT ${e.message}');
      debugPrint('Http response data is: ${e.response?.data}');
      // throw NetworkException(e.response?.data != null ? e.response.data['message'] ?? e.message : e.message);
    }

    network_utils.checkForNetworkExceptions(response);

    return network_utils.decodeResponseBodyToJson(response.data);
  }

  @override
  Future deleteHttp(String route, {Map<String, dynamic> params, refreshed: false}) async {
    Response response;
    params?.removeWhere((key, value) => value == null);

    Logger.d('[DELETE] Sending $params to $route');

    try {
      setHeader();
      final fullRoute = '${env['API']}$route';
      response = await _dio.delete(
        fullRoute,
        queryParameters: params,
        options: Options(
          contentType: 'application/json',
        ),
      );
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        // _navigationService.clearStackAndShow(Routes.signinViewRoute);
        // throw AuthException('Invalid token and credentials');
      }
      Logger.e('HttpService: Failed to DELETE $route: Error message: ${e.message}');
      debugPrint('Http response data is: ${e.response?.data}');
      // throw NetworkException(e.response?.data != null ? e.response.data['message'] ?? e.message : e.message);
    }

    network_utils.checkForNetworkExceptions(response);

    Logger.d('Received Response: $response');

    return network_utils.decodeResponseBodyToJson(response.data);
  }
}