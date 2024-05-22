import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
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
          backgroundColor: Colors.brown.withOpacity(0.9),
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
                color: Colors.brown,
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
      backgroundColor: Colors.white,
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
          color: Colors.black,
        ),
      ),
      actions: actions,
    );
Widget defaulttextbutton({
  required VoidCallback function,
  required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
      ),
    );

Widget defaultButton({
  double width = double.infinity,
  Color? background,
  bool isUppercase = true,
  double raduis = 10,
  @required Function()? function,
  @required String? text,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: function,
        height: 45.0,
        color: background,
        child: Text(
          isUppercase ? text!.toUpperCase() : text!,
          style: const TextStyle(fontSize: 13, color: Colors.white),
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
          ),
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: validator,
        keyboardType: type,
        onChanged: onchange);
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
      textsize:19.0,
      // istitle: true,
    ),
     leading: Icon(icon),
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
          color: Colors.brown,
          text: 'ok',
          textsize: 18,
        ),

        ),
      ],
    );
  });
}