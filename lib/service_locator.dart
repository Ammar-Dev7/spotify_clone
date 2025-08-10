import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:spotify/domain/usecases/get_song_usecase.dart';
import 'package:spotify/domain/usecases/login_usecase.dart';
import 'package:spotify/presentation/Home/bloc/song_bloc.dart';
import 'package:spotify/presentation/auth/bloc/auth_bloc.dart';
import 'package:spotify/presentation/choose_mode/bloc/choose_mode_bloc.dart';

import 'data/repository/auth_repository.dart';
import 'data/repository/song_repository.dart';
import 'data/source/remote_data_source.dart';
import 'domain/repository/auth_repository.dart';
import 'domain/repository/song_repository.dart';
import 'domain/usecases/register_usecases.dart';


final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerFactory(()=>ChooseModeBloc());
  sl.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(repository: sl()));
  sl.registerFactory(()=>AuthBloc(registerUseCase: sl(),loginUseCase: sl()));
  sl.registerLazySingleton<AuthRepository>(
      () => AuthReoositoryImpl(sl()));
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(auth: sl(), firestore: sl()));
  sl.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(repository: sl()));
  sl.registerLazySingleton<GetSongUseCase>(()=>GetSongUseCase(songRepository: sl()));
  sl.registerLazySingleton<SongRepository>(
      () => SongRepositoryImpl(remoteDataSource: sl()));
  sl.registerFactory<SongBloc>(()=>SongBloc(getSongUseCase: sl()));

}

