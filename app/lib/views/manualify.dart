import 'package:flutter/material.dart';
import '../shared/constants.dart';
import '../models/datamodel.dart';
import '../models/validators.dart';

class Manualify extends StatefulWidget {
  static const routeName = '/manualify';
  const Manualify({super.key});
  @override
  ManualifyState createState() => ManualifyState();
}

class ManualifyState extends State<Manualify> {
  bool spinnerVisible = false;
  bool messageVisible = false;
  bool _btnEnabled = false;
  String messageTxt = "";
  String messageType = "";
  final _formKey = GlobalKey<FormState>();
  var model = PromptDataModel(prompt: 'none', res: 'na');
  final TextEditingController _txtController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _txtController.dispose();
    super.dispose();
  }

  toggleSpinner() {
    setState(() => spinnerVisible = !spinnerVisible);
  }

  showMessage(bool msgVisible, msgType, message) {
    messageVisible = msgVisible;
    setState(() {
      messageType = msgType == "error"
          ? cMessageType.error.toString()
          : cMessageType.success.toString();
      messageTxt = message;
    });
  }

  fetchData(String prompt) async {
    toggleSpinner();
    // ignore: prefer_typing_uninitialized_variables
    var userAuth;
    if (prompt != "") {
      // userAuth = await authBloc.signInWithGoogle();
      showMessage(
          true,
          "success",
          prompt);
    } else {
      showMessage(
          true,
          "error",
          "no text found in Prompt.");
    }
    toggleSpinner();
  }

  @override
  Widget build(BuildContext context) {
    // AuthBloc authBloc = AuthBloc();
    return Scaffold(
      appBar: createCustomAppBar(context),
      body: Material(
          child: Container(
              margin: const EdgeInsets.all(20.0),
              // child: authBloc.isSignedIn()
              //     ? settingsPage(authBloc)
              //     : userForm(authBloc)));
              child: userForm(context))),
    );
  }

  Widget userForm(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      onChanged: () =>
          setState(() => _btnEnabled = _formKey.currentState!.validate()),
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 25.0),
            ),
            Container(
                width: 300.0,
                margin: const EdgeInsets.only(top: 25.0),
                child: TextFormField(
                  controller: _txtController,
                  cursorColor: Colors.blueAccent,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 50,
                  obscureText: false,
                  onChanged: (value) => model.prompt = value,
                  validator: (value) {
                          return Validators().evalChar(value!);
                  },
                  // onSaved: (value) => _email = value,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0)),
                    hintText: 'type your prompt',
                    labelText: 'query *',
                    // errorText: snapshot.error,
                  ),
                )),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
            ),
            CustomSpinner(toggleSpinner: spinnerVisible, key: null),
            CustomMessage(
                toggleMessage: messageVisible,
                toggleMessageType: messageType,
                toggleMessageTxt: messageTxt, key: null,),
            Container(
              margin: const EdgeInsets.only(top: 15.0),
            ),
            // signinSubmitBtn(context, authBloc),
            sendBtn(context),
          ],
        ),
      ),
    );
  }

  Widget sendBtn(context) {
    return ElevatedButton(
      onPressed:
          _btnEnabled == true ? () => fetchData(model.prompt) : null,
      child: const Text('send')
    );
  }

  Widget settingsPage(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.warning, color: Colors.red,),
              ),
              label: Text("please sign in after some time. Your free trial expired. \n\n Please upgrade to Pro to get unlimited access.", style: cWarnText)),
          const SizedBox(width: 20, height: 50),
          ElevatedButton(
            child: const Text('Home'),
            // color: Colors.blue,
            onPressed: () { Navigator.pushNamed(
                    context,
                    '/',
                  );},
          ),
        ],
      ),
    );
  }
}
