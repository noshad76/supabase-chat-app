import 'package:bloc/bloc.dart';
import 'package:chat_app/core/resources/data_state.dart';
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
      emit(state.copyWith(newGetMessageStatus: GetMessageLoading()));
      await emit.forEach(
        getMessageUsecase.call(),
        onData: (data) {
          if (data is DataSuccess) {
            return state.copyWith(
                newGetMessageStatus: GetMessageDone(messages: data.data!));
          } else {
            return state.copyWith(
                newGetMessageStatus: GetMessageFaild(error: data.error!));
          }
        },
      );
    });

    on<SendMessage>((event, emit) {
      emit(state.copyWith(newSendMessageStatus: SendMessageLoading()));
      DataState dataState = sendMessageUsecase.call(event.messageContent);
      if (dataState is DataSuccess) {
        emit(state.copyWith(newSendMessageStatus: SendMessageDone()));
      } else {
        emit(state.copyWith(
            newSendMessageStatus: SendMessageFaild(error: dataState.error!)));
      }
    });
  }
}
