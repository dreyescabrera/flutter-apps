import 'package:dio/dio.dart';
import 'package:yes_no_maybe_app/domain/entities/message.dart';
import 'package:yes_no_maybe_app/infrastructure/models/reply_model.dart';

class GetReply {
  final _dio = Dio();

  Future<Message> get() async {
    final rawResponse = await _dio.get('https://yesno.wtf/api');

    final replyModel = ReplyModel.fromJson(rawResponse.data);

    return replyModel.toMessage();
  }
}
