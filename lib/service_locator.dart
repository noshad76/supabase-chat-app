import 'package:chat_app/features/authentication/data/data_source/authentication_data_source.dart';
import 'package:chat_app/features/authentication/data/repository/authentication_repository_impl.dart';
import 'package:chat_app/features/authentication/domain/repository/authentication_repository.dart';
import 'package:chat_app/features/authentication/domain/usecases/login_usecase.dart';
import 'package:chat_app/features/authentication/domain/usecases/logout_usecase.dart';
import 'package:chat_app/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:chat_app/features/authentication/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:chat_app/features/chat/data/data_source/remote/message_data_source.dart';
import 'package:chat_app/features/chat/data/repository/message_repository_impl.dart';
import 'package:chat_app/features/chat/domain/repository/message_repository.dart';
import 'package:chat_app/features/chat/domain/usecase/get_message_usecase.dart';
import 'package:chat_app/features/chat/domain/usecase/send_message_usecase.dart';
import 'package:chat_app/features/chat/presentation/bloc/bloc/message_bloc.dart';
import 'package:chat_app/features/contacts/data/data_source/remote/contacts_data_source.dart';
import 'package:chat_app/features/contacts/data/repository/profiles_repository_impl.dart';
import 'package:chat_app/features/contacts/domain/repository/profiles_repository.dart';
import 'package:chat_app/features/contacts/domain/usecases/get_profiles_usecase.dart';
import 'package:chat_app/features/contacts/presentation/bloc/bloc/contacts_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

var instance = GetIt.instance;

Future<void> initializeLocator() async {
  final supabaseClient = Supabase.instance.client;

  instance.registerSingleton<SupabaseClient>(supabaseClient);
  //authentication service

  instance.registerSingleton<AuthenticationDataSource>(
      AuthenticationDataSource(supabaseClient: supabaseClient));

  instance.registerSingleton<AuthenticationRepository>(
      AuthenticationRepositoryImpl(authenticationDataSource: instance()));

  instance.registerSingleton<LoginUsecase>(
      LoginUsecase(authenticationRepository: instance()));
  instance.registerSingleton<LogoutUsecase>(
      LogoutUsecase(authenticationRepository: instance()));
  instance.registerSingleton<SignUpUsecase>(
      SignUpUsecase(authenticationRepository: instance()));

  instance.registerSingleton<AuthenticationBloc>(
    AuthenticationBloc(
      loginUsecase: instance(),
      logoutUsecase: instance(),
      signUpUsecase: instance(),
    ),
  );

  //contacts service
  instance.registerSingleton<ContactsDataSource>(
      ContactsDataSource(client: supabaseClient));

  instance.registerSingleton<ProfileRepository>(
      ProfileRepositoryImpl(contactsDataSource: instance()));

  instance.registerSingleton<GetProfilesUsecase>(
      GetProfilesUsecase(profileRepository: instance()));

  instance.registerSingleton<ContactsBloc>(
      ContactsBloc(getProfilesUsecase: instance()));
  //message chat service

  instance.registerSingleton<MessageDataSource>(
      MessageDataSource(supabaseClient: supabaseClient));

  instance.registerSingleton<MessageRepository>(
      MessageRepositoryImpl(messageDataSource: instance()));

  instance.registerSingleton<GetMessageUsecase>(
      GetMessageUsecase(messageRepository: instance()));
  instance.registerSingleton<SendMessageUsecase>(
      SendMessageUsecase(messageRepository: instance()));

  instance.registerFactory<MessageBloc>(() => MessageBloc(
      getMessageUsecase: instance(), sendMessageUsecase: instance()));
}
