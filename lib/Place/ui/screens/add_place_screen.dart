import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:trips_app/Place/model/place.dart';
import 'package:trips_app/Place/ui/widgets/card_image_with_fab_icon.dart';
import 'package:trips_app/Place/ui/widgets/text_input_location.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'package:trips_app/widgets/button_purple.dart';
import 'package:trips_app/widgets/gradient_back.dart';
import 'package:trips_app/widgets/text_input.dart';
import 'package:trips_app/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {
  File image;

  AddPlaceScreen({
    @required this.image
  });

  @override
  State<StatefulWidget> createState() => _AddPlaceScreen();

}

class _AddPlaceScreen extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();
    final _controllerLocationPlace = TextEditingController();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(
            height: screenHeight * 0.35,
          ),
          /// App Bar
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: 45.0,
                  left: 5.0
                ),
                child: SizedBox(
                  width: 45.0,
                  height: 45.0,
                  child: IconButton(
                    padding: EdgeInsets.all(0.0),
                    alignment: Alignment.centerRight,
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 40.0,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(
                    top: 45.0,
                    left: 20.0,
                    right: 10.0
                  ),
                  child: TitleHeader(
                    title: "Add a new place"
                  ),
                ),
              ),
            ],
          ),
          /// List View Body
          Container(
            margin: EdgeInsets.only(
              top: 90.0,
              bottom: 20.0
            ),
            child: ListView(
              children: <Widget>[
                /// Preview Picture
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    top: 30.0,
                    left: 40.0,
                    right: 40.0,
                    bottom: 30.0
                  ),
                  child: CardImageWithFabIcon(
                    image: widget.image.path, /// "assets/img/img-1.jpg"
                    height: 220,
                    width: MediaQuery.of(context).size.width - 80.0,
                    icon: Icons.camera_alt,
                    isMiniIcon: false,
                    onPressedTabIcon: () {
                      ImagePicker.pickImage(
                        source: ImageSource.camera
                      )
                        .then((File _image) {
                          if (_image != null) {
                            setState(() {
                              widget.image = _image;
                            });
                          } else {
                            print('Error : Imagen no valida');
                          }
                        })
                        .catchError((onError) {
                          print('Error : Al intentar capturar imagen de la cámara');
                          print(onError);
                        });
                    },
                    left: 0.0
                  ),
                ),
                /// Input - Title
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: TextInput(
                    placeholder: "Title",
                    type: TextInputType.text,
                    controller: _controllerTitlePlace,
                  ),
                ),
                /// Input - Description
                TextInput(
                  placeholder: "Description",
                  type: TextInputType.multiline,
                  maxLines: 5,
                  controller: _controllerDescriptionPlace,
                ),
                /// Input - Location
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(
                    placeholder: "Add Location",
                    controller: _controllerLocationPlace,
                    icon: MdiIcons.mapMarkerOutline,
                  ),
                ),
                /// Button Add Place
                Container(
                  width: 70.0,
                  child: ButtonPurple(
                    buttonText: "Add Place",
                    onTap: () {
                      /// PROCESOS AGREGAR NUEVO LUGAR

                      print("Subiendo datos a Firestore de Firebase");

                      /// Verificando la session del usuario
                      userBloc.currentUser.then((FirebaseUser user) {
                        if (user != null) {
                          String uid = user.uid;
                          String path = "${uid.toString()}/${DateTime.now().toString()}.jpg";

                          /// 1. Upload image -> Firebase Storage
                          userBloc.uploadFile(path, widget.image)
                            .then((StorageUploadTask storageUploadTask) {
                              storageUploadTask.onComplete
                                .then((StorageTaskSnapshot snapshot) {
                                  /// Opteniendo url de la imaen cargada
                                  snapshot.ref.getDownloadURL()
                                    .then((urlImageStorage) {
                                      print("IMAGEN URL UPLOADED : ${urlImageStorage.toString()}");

                                      /// 2. Update or Create Place on Cloud Firestore
                                      /// New Place
                                      userBloc.updatePlaceData(Place(
                                        name: _controllerTitlePlace.text,
                                        description: _controllerDescriptionPlace.text,
                                        type: "Scenery & Photography",
                                        urlImage: urlImageStorage
                                      )).whenComplete(() {
                                        print("Send Data To Firebase : FIN");
                                        Navigator.pop(context);
                                      });
                                    })
                                    .catchError((onError) {
                                      print('Error : En la function getDownloadURL()');
                                      print(onError);
                                    });
                                });
                            })
                            .catchError((onError) {
                              print('Error : En la function uploadFile()');
                              print(onError);
                            });

                        } else {
                          print('Error : usuario no esta logeado');
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}
