import 'package:chat/domain/entities/message.dart';
import 'package:chat/infrastructure/models/yes_no_model.dart';
import 'package:dio/dio.dart';

class YesOrNotAswer {
  final _dio = Dio();

  Future<Message> getAswer() async {
    try {
      final response = await _dio.get('https://yesno.wtf/api');

      final yesNoModel = YesNoModel.fromJson(response.data);

      return yesNoModel.toMessageToEntity();
    } catch (error) {
      throw Exception('has occurred an error: $error');
    }
  }
}
