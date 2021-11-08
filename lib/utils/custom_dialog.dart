import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  final String title;
  final Widget content;
  final bool enableAgreeButton;
  final bool enableCloseButton;
  final String agreeButtonText;
  final String closeButtonText;
  final VoidCallback onPressedAgreeButton;
  final VoidCallback onPressedCloseButton;

  CustomDialog({
    this.title = '',
    required this.content,
    this.enableAgreeButton = false,
    this.enableCloseButton = false,
    this.agreeButtonText = '',
    this.closeButtonText = '',
    required this.onPressedAgreeButton,
    required this.onPressedCloseButton,
  });

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      titlePadding: EdgeInsets.only(top: 16),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: widget.content,
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  widget.enableCloseButton
                      ? Expanded(
                          child: Container(
                            child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(0xFFF7F7F7),
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width, 52),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                ),
                                child: Text(
                                  widget.closeButtonText,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: widget.onPressedCloseButton),
                          ),
                        )
                      : Container(),
                  widget.enableAgreeButton && widget.enableCloseButton
                      ? SizedBox(width: 16)
                      : Container(),
                  widget.enableAgreeButton && widget.enableCloseButton
                      ? Expanded(
                          child: Container(
                            // width: 142,
                            height: 52,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xFFFFDE00),
                                minimumSize:
                                    Size(MediaQuery.of(context).size.width, 52),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Text(
                                widget.agreeButtonText,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: widget.onPressedAgreeButton,
                            ),
                          ),
                        )
                      : widget.enableAgreeButton && !widget.enableCloseButton
                          ? Expanded(
                              child: Container(
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    minimumSize: Size(142, 52),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                  ),
                                  child: Text(
                                    widget.agreeButtonText,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: widget.onPressedAgreeButton,
                                ),
                              ),
                            )
                          : Container()
                ],
              ),
            )
          ],
        ),
      ),
      contentPadding: EdgeInsets.all(0),
    );
  }
}
