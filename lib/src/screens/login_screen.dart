part of 'screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = true;
  String _messageUser = '';
  String _messagePass = '';
  String _messageError = '';
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  bool isLoginProcessing = false;

  Widget _headerText(Size size) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.only(top: 30, bottom: 35),
      child: Column(
        children: const [
          Text(
            'Hello Again!',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black87),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Welcome back you've been missed!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputField(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_messageError,
              style: TextStyle(color: Colors.red, fontSize: 12)),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: usernameController,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              labelText: 'Input your username',
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  _messageUser = '';
                });
              }
            },
          ),
          Text(
            _messageUser,
            style: TextStyle(color: Colors.red, fontSize: 12),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            obscureText: _showPassword,
            controller: passwordController,
            onChanged: (value) {
              if (value.length <= 7) {
                setState(() {
                  _messagePass = '*Password min 8 digit';
                });
              } else {
                setState(() {
                  _messagePass = '';
                });
              }
            },
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              labelText: 'Input your password',
              suffixIcon: IconButton(
                  icon: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  }),
            ),
          ),
          Text(
            _messagePass,
            style: TextStyle(color: Colors.red, fontSize: 12),
          ),
        ],
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  Widget _textForgot() {
    return const Padding(
      padding: EdgeInsets.only(right: 20),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          'Forgot your password?',
          style: TextStyle(color: Colors.blue, fontSize: 13),
        ),
      ),
    );
  }

  Widget _buttonLogin(Size size) {
    return SizedBox(
      width: 330,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (usernameController.text.isEmpty &&
              passwordController.text.isEmpty) {
            setState(() {
              _messageUser = '*Username Harus Diisi';
              _messagePass = '*Password Harus Diisi';
            });
          } else if (usernameController.text.isEmpty) {
            setState(() {
              _messageUser = '*Username Harus Diisi';
            });
          } else if (passwordController.text.isEmpty) {
            setState(() {
              _messagePass = '*Password Harus Diisi';
            });
          } else {
            if (passwordController.text != '12345678') {
              setState(() {
                _messageError = 'Username atau Password anda salah';
              });
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeSreen()));
            }
          }
        },
        child: const Text('Sign In'),
      ),
    );
  }

  Widget _buttonNyoba(Size size) {
    return SizedBox(
      child: ButtonWidget(
        onPressed: () {
          setState(() {
            isLoginProcessing = true;
          });
          Future.delayed(const Duration(milliseconds: 3000), () {
            // if (usernameController.text.isEmpty) {
            //   setState(() {
            //     isLoginProcessing = false;
            //   });
            //   ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(content: Text("Username Kosong")));
            // }
            if (usernameController.text.isEmpty &&
                passwordController.text.isEmpty) {
              setState(() {
                isLoginProcessing = false;
                _messageUser = '*Username Harus Diisi';
                _messagePass = '*Password Harus Diisi';
              });
            } else if (usernameController.text.isEmpty) {
              setState(() {
                isLoginProcessing = false;
                _messageUser = '*Username Harus Diisi';
              });
            } else if (passwordController.text.isEmpty) {
              setState(() {
                isLoginProcessing = false;
                _messagePass = '*Password Harus Diisi';
              });
            } else {
              if (passwordController.text != '12345678') {
                setState(() {
                  isLoginProcessing = false;
                  _messageError = 'Username atau Password anda salah';
                });
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomeSreen()));
              }
            }
          });
        },
        isLoading: isLoginProcessing,
        caption: 'Sign In',
      ),
    );
  }

  Widget _textLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            color: Colors.black26,
          ),
        ),
        Container(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: const Text('Or Continue With')),
        const Expanded(
          child: Divider(
            color: Colors.black26,
          ),
        )
      ],
    );
  }

  Widget _iconButton() {
    return SizedBox(
      width: double.infinity,
      height: 25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {},
            child: Image.asset('assets/images/logo_google.png'),
          ),
          MaterialButton(
            onPressed: () {},
            child: Image.asset('assets/images/logo_ig.png'),
          ),
          MaterialButton(
            onPressed: () {},
            child: Image.asset('assets/images/logo_fb.png'),
          ),
        ],
      ),
    );
  }

  Widget _textRegister() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Not a member?',
          style: TextStyle(fontSize: 12),
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              'Register Now',
              style: TextStyle(color: Colors.blue, fontSize: 12),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _headerText(size),
            _inputField(size),
            _textForgot(),
            const SizedBox(height: 20),
            // _buttonLogin(size),
            _buttonNyoba(size),
            const SizedBox(height: 25),
            _textLogin(),
            const SizedBox(height: 15),
            _iconButton(),
            const SizedBox(
              height: 15,
            ),
            _textRegister(),
          ],
        ),
      ),
    );
  }
}
