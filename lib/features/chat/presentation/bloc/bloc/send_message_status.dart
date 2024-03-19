import 'package:equatable/equatable.dart';

abstract class SendMessageStatus extends Equatable {}

class SendMessageLoading extends SendMessageStatus {
  @override
  List<Object?> get props => [];
}

class SendMessageDone extends SendMessageStatus {
  @override
  List<Object?> get props => [];
}

class MessageInitial extends SendMessageStatus {
  @override
  List<Object?> get props => [];
}

class SendMessageFaild extends SendMessageStatus {
  final String error;
  SendMessageFaild({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}
