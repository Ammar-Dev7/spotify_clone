import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/UserModel.dart';
import 'package:spotify/data/models/songModel.dart';


abstract class RemoteDataSource{
  Future<UserModel> register(String name, String email, String password);
  Future<UserModel> login(String email, String password);
  Future<List<SongModel>> getSongs();
}
class RemoteDataSourceImpl implements RemoteDataSource{

  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
   RemoteDataSourceImpl({required this.auth, required this.firestore});
  @override
  Future<UserModel> register(String name, String email, String password)async{

    try{
      final userCredential=await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user=UserModel(email: email,
        username: name,
        uid: userCredential.user!.uid,
      );
      await firestore.collection('users').doc(userCredential.user!.uid).set(user
          .toMap()
        );
        return UserModel.fromMap(user.toMap());
    }
    catch(e){
      print(e.toString());
      throw Exception(e.toString());
    }


  }

  @override
  Future<UserModel> login(String email, String password) async{

    try{
      final userCredential=await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user=await firestore.collection('users').doc(userCredential.user!.uid).get();
      return UserModel.fromMap(user.data()!);
    }
    catch(e){
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<SongModel>> getSongs() {
    try{
      return firestore.collection('songs').get().then((value) {
        final songs=value.docs.map((e) => SongModel.fromJson(e.data())).toList();
        return songs;
      });
    }
        catch(e){
      print(e.toString());
      throw Exception(e.toString());
    }
  }






}