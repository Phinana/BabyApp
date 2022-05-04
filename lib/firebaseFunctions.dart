import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_app/model/baby.dart';
import 'package:plant_app/model/postmodel.dart';
import 'package:plant_app/model/user_model.dart';


final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference userCollection = _firestore.collection('users');
final CollectionReference postsCollection = _firestore.collection('posts');

class FirebaseService {
  List array =  [];

  List<PostModel> PostModelList = [];

  final String uid;
  FirebaseService({this.uid});
  UserModel userModel = UserModel();

  Future addBaby(Baby baby) async{
    print(uid);
    return await userCollection.doc(uid).update(
      {
        "babies": FieldValue.arrayUnion([baby.BabytoMap()]),
      },
    );
  }

  Future deleteBaby(Baby baby) async{
    print(uid);
    return await userCollection.doc(uid).update(
      {
        "babies": FieldValue.arrayRemove([baby.BabytoMap()]),
      },
    );
  }

  Future<List> getBabies() async {
    var document = await userCollection.doc(uid).get();
    Map<String, dynamic> userData = document.data();
    var babies = userData["babies"];
    return babies;
  }

  Future<List> getPosts() async {
    QuerySnapshot querySnapshot = await postsCollection.get();
    var document = querySnapshot.docs.map((doc) => doc.data()).toList();
    return document;
  }

  Future<List<PostModel>> getPostDocuments(int i) async {
    List list_of_posts = await postsCollection.get().then((value) => value.docs);
    List<PostModel> list_of_subtitles = [];
    await postsCollection.doc(list_of_posts[i].id.toString()).collection("subtitle").get().then((value) =>
    value.docs.forEach((element) async {
       list_of_subtitles.add(PostModel.fromMap(element.data()));
    })
    );
    return list_of_subtitles;
  }

  addMainTitle(String title) async {
    await postsCollection.add({"baslik": title});
  }

  deleteMainTitle(int index) async {
    List list_of_posts = await postsCollection.get().then((value) => value.docs);
    await postsCollection.doc(list_of_posts[index].id.toString()).delete();
  }

  updateMainTitle(int index, String title) async {
    List list_of_posts = await postsCollection.get().then((value) => value.docs);
    await postsCollection.doc(list_of_posts[index].id.toString()).update({"baslik": title});
  }

  addSubTitle(int index, String title) async {
    List list_of_posts = await postsCollection.get().then((value) => value.docs);
    await postsCollection.doc(list_of_posts[index].id.toString()).collection("subtitle").add({"ana_baslik": list_of_posts[index].data()["baslik"], "baslik": title, "icerik": "İçerik daha eklenmedi"});
  }

  deleteSubTitle(int anaindex, int index) async {
    List list_of_posts = await postsCollection.get().then((value) => value.docs);
    List array = await postsCollection.doc(list_of_posts[anaindex].id.toString()).collection("subtitle").get().then((value) => value.docs);
    await postsCollection.doc(list_of_posts[anaindex].id.toString()).collection("subtitle").doc(array[index].id.toString()).delete();
  }

  updateSubTitle(int anaindex, int index, PostModel post) async {
    List list_of_posts = await postsCollection.get().then((value) => value.docs);
    List array = await postsCollection.doc(list_of_posts[anaindex].id.toString()).collection("subtitle").get().then((value) => value.docs);
    await postsCollection.doc(list_of_posts[anaindex].id.toString()).collection("subtitle").doc(array[index].id.toString()).update({
      "ana_baslik": post.ana_baslik,
      "baslik": post.baslik,
      "icerik": post.icerik
    });
  }

  Future<bool> getAdminState() async {
    int result;
    Future<DocumentSnapshot> snapshot = userCollection.doc(uid).get();
    result = await snapshot.then((value) => UserModel.fromMap(value).admin);
    if(result == 1){
      return true;
    }else return false;
  }

  editTextField(int anaindex, int index){

  }

}