import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vixor_project/componenet/widgets/text_widget.dart';
import 'package:vixor_project/componenet/widgets/title%20widget.dart';

import '../utils/app_imagse.dart';
// import 'package:vixor_project/const/Chat%20constants/constants.dart';

// import 'package:vixor_project/utils/app_imagse.dart';
void navigateTo(context,Widget)=>Navigator.push(context, MaterialPageRoute(
  builder:(context)=>Widget,
));
Future<void> errorDialog({
  required String subtitle,
  required BuildContext context,
}) async {
  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFF8D502F).withOpacity(0.9),
          title: Row(
            children: [
              Image.asset(
                'assets/images/pharaoh.png',
                height: 35.0,
                width: 40.0,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text('60'.tr),
            ],
          ),
          content: Text(
              subtitle,
              style:  TextStyle(color:Colors.white)),
          actions: [
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: Textwidget(
                color:Color(0xFF8D502F),
                text: 'Ok',
                textsize: 18,
              ),
            ),
          ],
        );
      });
}
PreferredSizeWidget defaultAppbar({
  required BuildContext context,
  String? title,
  List<Widget>? actions,
}) =>
    AppBar(
      backgroundColor: const Color(0xFF8D502F),
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          IconlyLight.arrowLeft2,
        ),
      ),
      titleSpacing: 5.0,
      title: Text(
        title!,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      actions: actions,
    );
Widget defaulttextbutton({
  required VoidCallback function,
  required String text, required Color background,
}) =>
    Container(
      margin: const EdgeInsets.fromLTRB(0, 14, 0, 20),
      child: SizedBox(
        width: 200, // Set width to 200 pixels
        child: TextButton(
          onPressed: function,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) => Color.fromARGB(255, 208, 208, 208).withOpacity(0.8),
            ),
          ),
          child: Text(
            text.toUpperCase(),
            style: TextStyle(
              color: Color.fromARGB(167, 33, 126, 180),
            ),
          ),
        ),
      ),
    );

Widget defaultButton({
  double width = double.infinity,
  Color? background,
  bool isUppercase = true,
  double radius = 100, // Corrected the spelling from "raduis" to "radius"
  @required Function()? function,
  @required String? text,
}) =>
    Container(
      width: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: MaterialButton(
          onPressed: function,
          height: 35.0,

          color: background ?? Color.fromARGB(255, 208, 208, 208).withOpacity(0.8),
          child: Text(
            isUppercase ? text!.toUpperCase() : text!,
            style: const TextStyle(
              fontSize: 13,
              color: Color.fromARGB(167, 33, 126, 180),
            ),
          ),
        ),
      ),
    );

Widget defaultformfield({
  required TextEditingController controller,
  required TextInputType type,
  Function(String x)? onchange,
  required String? Function(String? val)? validator,
  required String label,
  required IconData prefix,
}) =>
    TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefix,
          color: Colors.white, // Set icon color to white
        ),
        labelText: label,
        labelStyle: TextStyle(color: Colors.white), // Set label text color to white
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white), // Set border color to white
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white), // Set enabled border color to white
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white), // Set focused border color to white
        ),
      ),
      style: TextStyle(color: Colors.white), // Set text color to white
      validator: validator,
      keyboardType: type,
      onChanged: onchange,
    );

Widget listtile({
  required String title,
  required IconData icon,
  String? subtitle,
  required Function onpressed,
  required Color color,

})
{
  return ListTile(
    title: Textwidget(
      color: color,
      text:title,
      textsize:20,
      // istitle: true,
    ),
     leading: Icon(icon,color: Colors.white,),
     trailing: const Icon(IconlyLight.arrowRight2),
     onTap: (){
       onpressed();
     },
  );

}
Future<void> imagePickerDialog({
  required BuildContext context,
  required Function cameraFCT,
  required Function galleryFCT,
  required Function removeFCT,
}) async {
  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: TitlesTextWidget(
              label: "Choose option",
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                TextButton.icon(
                  onPressed: () {
                    cameraFCT();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(Icons.camera),
                  label: const Text("Camera"),
                ),
                TextButton.icon(
                  onPressed: () {
                    galleryFCT();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(
                    Icons.browse_gallery,
                  ),
                  label: const Text("Gallery"),
                ),
                TextButton.icon(
                  onPressed: () {
                    removeFCT();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(
                    Icons.remove_circle_outline,
                  ),
                  label: const Text("Remove"),
                ),
              ],
            ),
          ),
        );
      });
}
Future<void>warningDialog({
  required String title,
  required String subtitle,
  required VoidCallback fct,
  required BuildContext context,
})async {
  await showDialog(context: context, builder: (context){
    return AlertDialog(

      backgroundColor: Colors.brown.withOpacity(0.9),
      title: Row(
        children: [

          Image.asset(Assets.pharaon,height: 35.0,width: 40.0,fit: BoxFit.fill),
          const SizedBox(width: 8.0,),

          Text(title),
        ],
      ),
      content:
      Text(
          subtitle,
          style: const TextStyle(color:Colors.white),),

      actions: [
        TextButton(onPressed: (){
          if(Navigator.canPop(context))
          {
            Navigator.pop(context);
          }
        }, child:Textwidget(
          color: Colors.white,
          text: 'Cancel',
          textsize: 18,
        ),),
        TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.white),
          onPressed: fct
          ,child:Textwidget(
          color:  Color(0xFF8D502F),
          text: 'ok',
          textsize: 18,
        ),

        ),
      ],
    );
  });
}