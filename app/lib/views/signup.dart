// import 'dart:async';
import 'package:flutter/material.dart';
import '../shared/constants.dart';
import '../models/datamodel.dart';
import '../models/validators.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/signup';
  const SignUp({super.key});
  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  bool spinnerVisible = false;
  bool messageVisible = false;
  bool _btnEnabled = false;
  String messageTxt = "";
  String messageType = "";
  final _formKey = GlobalKey<FormState>();
  var model = LoginDataModel(email: 'noreply@duck.com', password: 'na',);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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

  // fetchData(AuthBloc authBloc, String loginType) async {
  //   toggleSpinner();
  //   var userAuth;
  //   if (loginType == "Google") {
  //     userAuth = await authBloc.signInWithGoogle();
  //   } else {
  //     userAuth = await authBloc.signInWithEmail(model);
  //   }

  //   if (userAuth == "") {
  //     showMessage(true, "success", "Login Successful");
  //   } else {
  //     showMessage(
  //         true,
  //         "error",
  //         (userAuth == 'user-not-found')
  //             ? "No user found for that email."
  //             : ((userAuth == 'wrong-password')
  //                 ? "Wrong password provided for that user."
  //                 : "An un-known error has occured."));
  //   }
  //   toggleSpinner();
  // }
  fetchData(String loginType) async {
    toggleSpinner();
    // ignore: prefer_typing_uninitialized_variables
    var userAuth;
    if (loginType == "Google") {
      // userAuth = await authBloc.signInWithGoogle();
    } else {
      // userAuth = await authBloc.signInWithEmail(model);
    }

    if (userAuth == "") {
      showMessage(true, "success", "Login Successful");
    } else {
      showMessage(
          true,
          "error",
          (userAuth == 'user-not-found')
              ? "No user found for that email."
              : ((userAuth == 'wrong-password')
                  ? "Wrong password provided for that user."
                  : "An un-known error has occured."));
    }
    toggleSpinner();
  }

  // Future logout(AuthBloc authBloc) async {
  //   setState(() {
  //     model.password = "";
  //     _passwordController.clear();
  //     _btnEnabled = false;
  //   });
  //   toggleSpinner();
  //   authBloc
  //       .logout()
  //       .then((res) =>
  //           showMessage(true, "success", "Successfully logout from system."))
  //       .catchError((error) => {showMessage(true, "error", error.toString())});
  //   toggleSpinner();
  // }

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
            const Text(
                "create a new Account .\n\nPlease use your email and non-secret password.",
                style: cBodyText),
            const SizedBox(
              width: 10,
              height: 10,
            ),
            // const Text("Sign In"),
            Container(
                width: 300.0,
                margin: const EdgeInsets.only(top: 25.0),
                child: TextFormField(
                  controller: _emailController,
                  cursorColor: Colors.blueAccent,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 50,
                  obscureText: false,
                  onChanged: (value) => model.email = value,
                  validator: (value) {
                          return Validators().evalEmail(value!);
                  },
                  // onSaved: (value) => _email = value,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0)),
                    hintText: 'username@domain.com',
                    labelText: 'EmailID *',
                    // errorText: snapshot.error,
                  ),
                )),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
            ),
            Container(
                width: 300.0,
                margin: const EdgeInsets.only(top: 25.0),
                child: TextFormField(
                  controller: _passwordController,
                  cursorColor: Colors.blueAccent,
                  keyboardType: TextInputType.visiblePassword,
                  maxLength: 50,
                  obscureText: true,
                  onChanged: (value) => model.password = value,
                  validator: (value) {
                          return Validators().evalPassword(value!);
                  },
                  decoration: InputDecoration(
                    icon: const Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0)),
                    hintText: 'enter password',
                    labelText: 'Password *',
                  ),
                )),
            Container(
              margin: const EdgeInsets.only(top: 25.0),
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
            signinSubmitBtn(context),
            Container(
              margin: const EdgeInsets.only(top: 15.0),
            ),
            Chip(
                label: const Text("login with Google"),
                avatar: ElevatedButton(
                  child: const Text(''),
                  // onPressed: () => fetchData(authBloc, "Google"),
                  onPressed: () => {},
                )),
            Container(
              margin: const EdgeInsets.only(top: 15.0),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/',
                );
              },
              child: const Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.black26,
                    child: Text("-"),
                  ),
                  label: Text("already have an Account")),
            )
          ],
        ),
      ),
    );
  }

  Widget signinSubmitBtn(context) {
    return ElevatedButton(
      onPressed:
          _btnEnabled == true ? () => fetchData("email") : null,
      child: const Text('SignIn')
    );
  }

  Widget settingsPage(context) {
    return Center(
      child: Column(
        children: [
          // const Chip(
          //     avatar: CircleAvatar(
          //       backgroundColor: Colors.grey,
          //       child: Icon(Icons.home, color: Colors.blue,),
          //     ),
          //     label: Text("welcome to Manualify!.", style: cNavText)),
          const SizedBox(width: 20, height: 50),
          ElevatedButton(
            child: const Text('click here to go to Manualify.'),
            // color: Colors.blue,
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                '/manualify',
              );
            },
          ),
          const SizedBox(width: 20, height: 70),
          ElevatedButton(
            child: const Text('Logout'),
            // color: Colors.blue,
            onPressed: () {
              // return logout(authBloc);
            },
          ),
        ],
      ),
    );
  }
}
