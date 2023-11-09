import 'package:flutter/material.dart';

import '../class/Colors.dart';

class HomeFooter extends StatefulWidget {
  const HomeFooter({super.key});

  @override
  State<HomeFooter> createState() => _HomeFooterState();
}

class _HomeFooterState extends State<HomeFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10,left: 10),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
        color: PaletteColors.upTitle,
        boxShadow: [
          BoxShadow(
              color: PaletteColors.slideShadow.withOpacity(0.3),
              blurRadius: 2,
              spreadRadius: 0.05,
              offset: const Offset(
                  0,1
              )
          ),
          BoxShadow(
              color: Colors.white54.withOpacity(0.3),
              blurRadius: 0.05,
              spreadRadius: 0,
              offset: const Offset(
                  0,-0.1
              )
          )
        ],
      ),
      child: TextButton(
        onPressed: (){},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) => Colors.white)
        ),
        child: Text(
            "Home".toUpperCase(),
        style: TextStyle(
          fontSize: 12,fontFamily: "OpenSemiBold",color: PaletteColors.upTitle
        ),
        ),
      ),
    );
  }
}
