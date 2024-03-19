import 'package:bloc/bloc.dart';
import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/features/chat/domain/entity/message_entity.dart';
import 'package:chat_app/features/chat/domain/usecase/get_message_usecase.dart';
import 'package:chat_app/features/chat/domain/usecase/send_message_usecase.dart';
import 'package:chat_app/features/chat/presentation/bloc/bloc/get_message_status.dart';
import 'package:chat_app/features/chat/presentation/bloc/bloc/send_message_status.dart';
import 'package:equatable/equatable.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  GetMessageUsecase getMessageUsecase;
  SendMessageUsecase sendMessageUsecase;
  MessageBloc(
      {required this.getMessageUsecase, required this.sendMessageUsecase})
      : super(MessageState(
            getMessageStatus: GetMessageLoading(),
            sendMessageStatus: MessageInitial())) {
    on<GetMessages>((event, emit) async {
      Stream<DataState<List<MessageEntity>>> messages =
          getMessageUsecase.call();
      await for (final dataState in messages) {
        if (dataState is DataSuccess) {
          emit(MessageState(
              getMessageStatus: GetMessageDone(messages: dataState.data!)));
        } else if (dataState is DataFailed) {
          emit(MessageState(
              getMessageStatus: GetMessageFaild(error: dataState.error!)));
        }
      }
    });

    on<SendMessage>((event, emit) {
      emit(MessageState(sendMessageStatus: SendMessageLoading()));
      DataState state = sendMessageUsecase.call(event.messageContent);
      if (state is DataSuccess) {
        emit(MessageState(sendMessageStatus: SendMessageDone()));
      } else {
        emit(MessageState(
            sendMessageStatus: SendMessageFaild(error: state.error!)));
      }
    });
  }
}
