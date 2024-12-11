import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  const ButtonRow({super.key, required this.onSavePressed});

  final void Function() onSavePressed;

  @override
  Widget build(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 5,
          child: Padding(padding: EdgeInsets.only(left: 20),child: OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: OutlinedButton.styleFrom(
              side:BorderSide(color: Color(0xffE5E8EB)) ,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              backgroundColor: Colors.white,
            ),
            child: Text('Cancel', style: TextStyle(color: Color(0xff2E528D),fontWeight: FontWeight.w700,fontSize: 16),),
          ),),
        ),
        SizedBox(width: 15,),
        Expanded(
          flex: 7,
            child: Padding(padding: EdgeInsets.only(right: 20),child: OutlinedButton(
              onPressed: onSavePressed,
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                backgroundColor: Color(0xff2E528D),
              ),
              child: Text('Save', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 16)),
            ),)
        ),
      ],
    );
  }
}
