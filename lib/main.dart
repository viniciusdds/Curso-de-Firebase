import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

    FirebaseAuth auth = FirebaseAuth.instance;

    // Criando um usuário com email e senha
    String email = "vinicius@gmail.com";
    String senha = "123456";

//    auth.createUserWithEmailAndPassword(
//        email: email,
//        password: senha
//    ).then((firebaseUser) {
//        print("novo usuario: sucesso!!! e-mail: "+ firebaseUser.user.email);
//    }).catchError((erro){
//        print("novo usuario: erro "+ erro.toString());
//    });

    auth.signOut();

   // Logando usuário
//    auth.signInWithEmailAndPassword(
//        email: email,
//        password: senha
//    ).then((firebaseUser) {
//        print("Logar usuario: sucesso!!! e-mail: "+ firebaseUser.user.email);
//    }).catchError((erro){
//        print("Logar usuario: erro "+ erro.toString());
//    });

    User usuarioAtual = await auth.currentUser;
    if(usuarioAtual != null){
       //logado
       print("Usuario atual logado email: "+ usuarioAtual.email);
    }else{
       //deslogado
       print("Usuario atual está DESLOGADO!!!");
    }

    runApp(MaterialApp(
        home: App()
    ));

}


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


//  WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp();
//
//  FirebaseFirestore db = FirebaseFirestore.instance;
//
//  var pesquisa = "mar";
//
//  QuerySnapshot querySnapshot = await db.collection("usuarios")
//      //.where("nome", isEqualTo: "vinicius")
//      //.where("idade", isEqualTo: 31)
//      //.where("idade", isGreaterThan: 15)
//      //.where("idade", isLessThan: 30)
////      .orderBy("idade", descending: true)
////      .orderBy("nome", descending: false)
//      //.limit(2)
//
//      .where("nome", isGreaterThanOrEqualTo: pesquisa)
//      .where("nome", isLessThanOrEqualTo: pesquisa + "\uf8ff")
//      .get();
//      //.snapshots().listen((snapshots) { });
//
//  for(DocumentSnapshot item in querySnapshot.docs){
//    var dados = item.data();
//    print("filtro nome: ${dados["nome"]} idade: ${dados["idade"]}");
//  }
//
//// Para inserir
////  db.collection("usuarios").doc("002").set({"nome": "Ana Maria Silva", "idade": "25"});
//
////    DocumentReference ref = await db.collection("noticias").add({
////       "titulo": "Ondas de calor em São Paulo",
////       "descricao": "texto de exemplo..."
////    });
//
//   // print("item salvo: "+ ref.id);
//
//// Para atualizar
////   db.collection("noticias").doc("mScRAu5G9duWtvQH9ifZ").set({
////      "titulo": "Onda de calor na Bahia",
////      "descricao": "texto de exemplo..."
////   });
//
//// Para deletar
////    db.collection("usuarios").doc("003").delete();
//
//  // Para recuperar especifico
////  DocumentSnapshot snapshot = await db.collection("usuarios").doc("002").get();
////
////  var dados = snapshot.data();
////  print("dados nome: "+ dados["nome"] +" idade: "+ dados["idade"]);
//
//
//  // para recuperar tudo
////  QuerySnapshot querySnapshot = await db.collection("usuarios").get();
//
////  for(DocumentSnapshot item in querySnapshot.docs){
////    var dados = item.data();
////    print("dados usuarios: "+ dados["nome"] + " - " + dados["idade"] );
////  }
//
//  // Para recuperar tudo em tempo real
////    db.collection("usuarios").snapshots().listen(
////             (snapshot) {
////                for(DocumentSnapshot item in snapshot.docs){
////                    var dados = item.data();
////                    print("dados usuarios: "+ dados["nome"] + " - " + dados["idade"]);
////                }
////             }
////           );

