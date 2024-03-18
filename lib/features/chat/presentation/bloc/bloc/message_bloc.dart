import 'package:bloc/bloc.dart';
import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/features/chat/domain/entity/message_entity.dart';
import 'package:chat_app/features/chat/domain/usecase/get_message_usecase.dart';
import 'package:equatable/equatable.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  GetMessageUsecase getMessageUsecase;
  MessageBloc({required this.getMessageUsecase}) : super(MessageLoading()) {
    on<GetMessages>((event, emit) async {
      Stream<DataState<List<MessageEntity>>> messages =
          getMessageUsecase.call();
      await for (final dataState in messages) {
        if (dataState is DataSuccess) {
          emit(MessageDone(messages: dataState.data!));
        } else if (dataState is DataFailed) {
          emit(MessageFaild(error: dataState.error!));
        }
      }
    });
  }
}
