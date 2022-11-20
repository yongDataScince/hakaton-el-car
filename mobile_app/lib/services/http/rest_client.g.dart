// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestClient implements RestClient {
  _RestClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://10.1.1.200:3000/v1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<AuthDataModel> login(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AuthDataModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/auth-user',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AuthDataModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AuthDataModel> register(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AuthDataModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/reg-user',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AuthDataModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserModel> getUser(phone) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'phone': phone};
    final _headers = <String, dynamic>{r'Content-Type': 'application/json'};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<UserModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'application/json',
    )
            .compose(
              _dio.options,
              '/get-user',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CarModel> getCar(carId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'car_id': carId};
    final _headers = <String, dynamic>{r'Content-Type': 'application/json'};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<CarModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'application/json',
    )
            .compose(
              _dio.options,
              '/get-car',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CarModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> regCar(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Content-Type': 'application/json'};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(map);
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/json',
    )
        .compose(
          _dio.options,
          '/reg-car',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
