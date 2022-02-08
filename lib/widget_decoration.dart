import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Widgets {
  static Widget fieldData(String? key, String? value, BuildContext context,
      {bool isHighlight = false, Color? color}) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 5),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Text(
                    key ?? "",
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Text(
                      value ?? "",
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: isHighlight ? Colors.white : null,
                          backgroundColor: isHighlight ? color : null),
                    )),
              ],
            ),
          ),
          const SizedBox(height: 5),
          const Divider(
            endIndent: 30,
            indent: 30,
            thickness: 1,
            color: Colors.black38,
          ),
        ],
      ),
    );
  }

  static Color requestStatusColor(element) {
    String status = element["requestStatus"];
    Color? color;
    if (status == "Pending_Approval") {
      return color = Colors.orange;
    } else if (status == "In_Progress") {
      return color = Colors.blue;
    } else if (status == "Completed") {
      return color = Colors.green;
    } else if (status == "Cancelled" || status == "Rejected") {
      return color = Colors.red;
    }
    return color!;
  }

  static TextStyle headingStyle() => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );

  static TextStyle bodyStyle() => const TextStyle(
        fontSize: 15,
        color: Colors.blue,
      );


}
