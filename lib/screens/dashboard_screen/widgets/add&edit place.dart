import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:vixor_project/componenet/widgets/subtitle_text.dart';
import 'package:vixor_project/componenet/widgets/title%20widget.dart';
import 'package:vixor_project/const/app_constants.dart';
import 'package:vixor_project/const/validator.dart';
import 'package:vixor_project/models/place%20model.dart';
import 'package:vixor_project/screens/auth/loading%20manager.dart';
import 'package:vixor_project/services/MyAppFunctions.dart';
class EditOrUploadPlaceScreen extends StatefulWidget {


  const EditOrUploadPlaceScreen({super.key, this.productModel});
  final Placemodel? productModel;
  @override
  State<EditOrUploadPlaceScreen> createState() =>
      _EditOrUploadPlaceScreenState();
}

class _EditOrUploadPlaceScreenState extends State<EditOrUploadPlaceScreen> {
  final _formKey = GlobalKey<FormState>();
  XFile? _pickedImage;
  late TextEditingController
  _titleController,
      _addressController,
      _descriptionController,
      _timeController,
      _thingsController;


//  _adultController,
// _studentController;
//var openedat = TextEditingController();
//var closedat = TextEditingController();
  String? _categoryValue;
  bool isEditing = false;
  String? productNetworkImage;
  bool _isLoading = false;
  String? productImageUrl;
  // String?x;
  //String?y;
  @override
  void initState() {
    if (widget.productModel != null) {
      isEditing = true;
      productNetworkImage = widget.productModel!.PlaceImage;
      productImageUrl = productNetworkImage;
      _categoryValue = widget.productModel!.PlaceCategory;
    }
    _titleController =
        TextEditingController(text: widget.productModel?.PlaceTitle);
    _addressController =
        TextEditingController(text: widget.productModel?.PlaceAddress);
    _descriptionController =
        TextEditingController(text: widget.productModel?.PlaceDescription);
    _timeController =
        TextEditingController(text: widget.productModel?.BestTime);
    _thingsController =
        TextEditingController(text: widget.productModel?.thingToKnow);

    /* _studentController =
        TextEditingController(text: widget.productModel?.TicketforStudent);
    _adultController =
        TextEditingController(text: widget.productModel?.Ticketforadult);
    openedat= TextEditingController(text: widget.productModel?.openedat);
    closedat= TextEditingController(text: widget.productModel?.closedat);*/


    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _addressController.dispose();
    _descriptionController.dispose();
    _timeController.dispose();
    _thingsController.dispose();
    /* _studentController.dispose();
    _adultController.dispose();
    openedat.dispose();
    closedat.dispose();*/
    super.dispose();
  }

  void clearForm() {
    _titleController.clear();
    _addressController.clear();
    _descriptionController.clear();
    _timeController.clear();
    _thingsController.clear();
    /* _studentController.clear();
    _adultController.clear();
    openedat.clear();
    closedat.clear();*/
    removePickedImage();
  }

  void removePickedImage() {
    setState(() {
      _pickedImage = null;
      productNetworkImage = null;
    });
  }

  Future<void> _uploadProduct() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (_pickedImage == null) {
      MyAppFunctions.showErrorOrWarningDialog(
          context: context,
          subtitle: "Make sure to pick up an image",
          fct: () {});
      return;
    }
    if (isValid) {
      try {
        setState(() {
          _isLoading = true;
        });

        final placeId = const Uuid().v4();
        final ref = FirebaseStorage.instance
            .ref()
            .child("PlacesImages")
            .child("$placeId.jpg");
        await ref.putFile(File(_pickedImage!.path));
        productImageUrl = await ref.getDownloadURL();

        await FirebaseFirestore.instance
            .collection("Places")
            .doc(placeId)
            .set({
          'PlaceId': placeId,
          'PlaceTitle': _titleController.text,
          'PlaceAddress':_addressController.text,
          'PlaceImage': productImageUrl,
          'PlaceCategory': _categoryValue,
          'PlaceDescription': _descriptionController.text,
          'thingToKnow':_thingsController.text,
          'BestTime':_timeController.text,
          'createdAt': Timestamp.now(),

        });
        Fluttertoast.showToast(
          msg: "Place has been added",
          backgroundColor: Colors.brown.shade600,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        if (!mounted) return;
        MyAppFunctions.showErrorOrWarningDialog(
            isError: false,
            context: context,
            subtitle: "Clear Form?",
            fct: () {
              clearForm();
            });
      } on FirebaseException catch (error) {
        await MyAppFunctions.showErrorOrWarningDialog(
          context: context,
          subtitle: error.message.toString(),
          fct: () {},
        );
      } catch (error) {
        await MyAppFunctions.showErrorOrWarningDialog(
          context: context,
          subtitle: error.toString(),
          fct: () {},
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _editProduct() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (_pickedImage == null && productNetworkImage == null) {
      MyAppFunctions.showErrorOrWarningDialog(
        context: context,
        subtitle: "Please pick up an image",
        fct: () {},
      );
      return;
    }
    if (isValid) {
      try {
        setState(() {
          _isLoading = true;
        });

        if (_pickedImage != null) {
          final ref = FirebaseStorage.instance
              .ref()
              .child("PlacesImages")
              .child("${widget.productModel!.PlaceImage}.jpg");
          await ref.putFile(File(_pickedImage!.path));
          productImageUrl = await ref.getDownloadURL();
        }
        if (productImageUrl == null && productNetworkImage != null) {
          productImageUrl = productNetworkImage;
        }


        await FirebaseFirestore.instance
            .collection("Places")
            .doc(widget.productModel!.PlaceId)
            .update({
          'PlaceId': widget.productModel!.PlaceId,
          'PlaceTitle': _titleController.text,
          'PlaceAddress':_addressController.text,
          'PlaceImage': productImageUrl, // Ensure this is updated
          'PlaceCategory': _categoryValue,
          'PlaceDescription': _descriptionController.text,
          'thingToKnow': _thingsController.text,
          'BestTime':_timeController.text,
          'createdAt': Timestamp.now(),
        });
        Fluttertoast.showToast(
          msg: "Place has been edited",
          textColor: Colors.white,
        );
        if (!mounted) return;
        MyAppFunctions.showErrorOrWarningDialog(
            isError: false,
            context: context,
            subtitle: "Clear Form?",
            fct: () {
              clearForm();
            });
      } on FirebaseException catch (error) {
        await MyAppFunctions.showErrorOrWarningDialog(
          context: context,
          subtitle: error.message.toString(),
          fct: () {},
        );
      } catch (error) {
        await MyAppFunctions.showErrorOrWarningDialog(
          context: context,
          subtitle: error.toString(),
          fct: () {},
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }


  Future<void> localImagePicker() async {
    final ImagePicker picker = ImagePicker();
    await MyAppFunctions.imagePickerDialog(
      context: context,
      cameraFCT: () async {
        _pickedImage = await picker.pickImage(source: ImageSource.camera);
        setState(() {
          productNetworkImage = null;
        });
      },
      galleryFCT: () async {
        _pickedImage = await picker.pickImage(source: ImageSource.gallery);
        setState(() {
          productNetworkImage = null;
        });
      },
      removeFCT: () {
        setState(() {
          _pickedImage = null;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LoadingManager(
      isLoading: _isLoading,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          bottomSheet: SizedBox(
            height: kBottomNavigationBarHeight + 10,
            child: Material(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(12),
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                    ),
                    icon: const Icon(Icons.clear),
                    label: const Text(
                      "Clear",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      clearForm();
                    },
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(12),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                    ),
                    icon: const Icon(Icons.upload,color: Colors.white,),
                    label: Text(
                      isEditing ? "Edit " : "Upload ",style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                    ),
                    onPressed: () {
                      if (isEditing) {
                        _editProduct();
                      } else {
                        _uploadProduct();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            title: TitlesTextWidget(
              label: isEditing ? "Edit place" : "Upload a new tourism Place",
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),

                  // Image Picker
                  if (isEditing && productNetworkImage != null) ...[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        productNetworkImage!,
                        // width: size.width * 0.7,
                        height: size.width * 0.5,
                        alignment: Alignment.center,
                      ),
                    ),
                  ] else if (_pickedImage == null) ...[
                    SizedBox(
                      width: size.width * 0.4 + 10,
                      height: size.width * 0.4,
                      child: DottedBorder(
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.image_outlined,
                                  size: 80,
                                  color: Colors.blue,
                                ),
                                TextButton(
                                  onPressed: () {
                                    localImagePicker();
                                  },
                                  child: const Text("Pick Place Image"),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ] else ...[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        File(
                          _pickedImage!.path,
                        ),
                        // width: size.width * 0.7,
                        height: size.width * 0.5,
                        alignment: Alignment.center,
                      ),
                    ),
                  ],
                  if (_pickedImage != null || productNetworkImage != null) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            localImagePicker();
                          },
                          child: const Text("Pick another image"),
                        ),
                        TextButton(
                          onPressed: () {
                            removePickedImage();
                          },
                          child: const Text(
                            "Remove image",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    )
                  ],
                  const SizedBox(
                    height: 25,
                  ),

                  // Category dropdown widget
                  DropdownButton(
                      items: AppConstants.categoriesDropDownList,
                      value: _categoryValue,
                      hint: const Text("Choose a Category"),
                      onChanged: (String? value) {
                        setState(() {
                          _categoryValue = value;
                        });
                      }),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _titleController,
                            key: const ValueKey('Title'),
                            maxLength: 80,
                            minLines: 1,
                            maxLines: 2,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            decoration: const InputDecoration(
                              hintText: 'Place Name',
                            ),
                            validator: (value) {
                              return MyValidators.uploadProdTexts(
                                value: value,
                                toBeReturnedString:
                                "Please enter a valid Name",
                              );
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _addressController,
                            key: const ValueKey('Address'),
                            maxLength: 80,
                            minLines: 1,
                            maxLines: 2,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            decoration: const InputDecoration(
                              hintText: 'Address',
                            ),
                            validator: (value) {
                              return MyValidators.uploadProdTexts(
                                value: value,
                                toBeReturnedString:
                                "Please enter a valid Address",
                              );
                            },
                          ),
                          const SizedBox(
                              height: 10
                          ),
                          TextFormField(
                            controller:  _timeController,
                            key: const ValueKey('The Best Time'),
                            minLines: 5,
                            maxLines: 8,
                            maxLength: 200,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            decoration: const InputDecoration(
                              hintText: 'The Best Time',
                            ),
                            validator: (value) {
                              return MyValidators.uploadProdTexts(
                                value: value,
                                toBeReturnedString:
                                "Please enter a valid Time",
                              );
                            },
                          ),
                          const SizedBox(
                              height: 10
                          ),
                          TextFormField(
                            key: const ValueKey('Description'),
                            controller: _descriptionController,
                            minLines: 5,
                            maxLines: 8,
                            maxLength: 1000,
                            textCapitalization: TextCapitalization.sentences,
                            decoration: const InputDecoration(
                              hintText: 'about',
                            ),
                            validator: (value) {
                              return MyValidators.uploadProdTexts(
                                value: value,
                                toBeReturnedString: "Description is missed",
                              );
                            },
                            onTap: () {},
                          ),
                          const SizedBox(
                              height: 10
                          ),
                          TextFormField(
                            key: const ValueKey('thingToKnow'),
                            controller: _thingsController,
                            minLines: 5,
                            maxLines: 8,
                            maxLength: 1000,
                            textCapitalization: TextCapitalization.sentences,
                            decoration: const InputDecoration(
                              hintText: 'thing To Know before you go',
                            ),
                            validator: (value) {
                              return MyValidators.uploadProdTexts(
                                value: value,
                                toBeReturnedString: "thing To Know is missed",
                              );
                            },
                            onTap: () {},
                          ),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: kBottomNavigationBarHeight + 10,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}