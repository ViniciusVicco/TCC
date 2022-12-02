import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc/config/firebase/firebase_instances.dart';
import 'package:tcc/core/session/session_manager.dart';
import 'package:tcc/features/profile/data/datasources/profile_datasource_impl.dart';
import 'package:tcc/features/profile/domain/usecases/get_profile_file_url_usecase.dart';
import 'package:tcc/features/profile/domain/usecases/upload_profile_file_usecase.dart';
import 'package:tcc/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:tcc/features/profile/presentation/pages/profile_page.dart';

import '../domain/repositories/profile_repository_impl.dart';

class ProfileModule extends Module {
  ProfileModule();
  @override
  List<Bind> get binds => [
        Bind.factory((i) => ProfileDatasourceImpl(
            firebaseFirestore:
                Modular.get<FirebaseInstances>().getFirebaseFireStoreInstance,
            firabaseStorage:
                Modular.get<FirebaseInstances>().getFirebaseStorageInstance)),
        Bind.factory((i) => ProfileRepositoryImpl(
            dataSource: Modular.get<ProfileDatasourceImpl>())),
        Bind.factory((i) => UploadFileUseCase(
            repository: Modular.get<ProfileRepositoryImpl>())),
        Bind.factory((i) => GetProfileFileUrlUseCase(
            repository: Modular.get<ProfileRepositoryImpl>())),
        Bind.singleton((i) => ProfileCubit(
              getProfileFileUrlUseCase: Modular.get<GetProfileFileUrlUseCase>(),
              sessionManager: Modular.get<SessionManager>(),
              uploadFileUseCase: Modular.get<UploadFileUseCase>(),
            )),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => BlocProvider(
                  create: (context) => Modular.get<ProfileCubit>(),
                  child: ProfilePage(
                    sessionManager: Modular.get<SessionManager>(),
                  ),
                )),
      ];
}
