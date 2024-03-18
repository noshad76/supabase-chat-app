import 'package:bloc/bloc.dart';
import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/core/usecase/no_params.dart';
import 'package:chat_app/features/contacts/domain/entity/profile_entity.dart';
import 'package:chat_app/features/contacts/domain/usecases/get_profiles_usecase.dart';
import 'package:chat_app/service_locator.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  GetProfilesUsecase getProfilesUsecase;
  ContactsBloc({required this.getProfilesUsecase}) : super(ContactsLoading()) {
    on<GetContacts>((event, emit) async {
      DataState<List<ProfileEntity>> dataState =
          await getProfilesUsecase(NoParam());
      dataState.data!.removeWhere((element) =>
          element.id == instance<SupabaseClient>().auth.currentUser!.id);

      if (dataState is DataSuccess) {
        emit(ContactsDone(profiles: dataState.data!));
      } else {
        emit(ContactsError(error: dataState.error!));
      }
    });
  }
}
