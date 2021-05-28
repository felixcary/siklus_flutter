import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siklus_flutter/Bloc/HomeBloc/HomeBloc.dart';
import 'package:siklus_flutter/Extension/ColorsExtension.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _homeBloc = BlocProvider.of<HomeBloc>(context);
    return Scaffold(
      appBar: _appBar(),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: _homeBloc,
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                _nameTextfield(_homeBloc),
                SizedBox(
                  height: 24,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (state.isConfirmable) {
                        _homeBloc.add(ConfirmName(name: _nameController.text));
                      }
                    },
                    child: Text("Confirm"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        state.isConfirmable
                            ? SiklusColorPallete.blueCyan
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (state.name.isNotEmpty) {
                        _homeBloc.add(AddCounter(counter: state.counter));
                      }
                    },
                    child: Text("Add"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        state.name.isNotEmpty
                            ? SiklusColorPallete.blueCyan
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                _resultContainer(state),
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: SiklusColorPallete.blueCyan,
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logoSiklus.png",
              height: 35,
            ),
            SizedBox(
              width: 4,
            ),
            Text("SIKLUS"),
          ],
        ),
      ),
    );
  }

  Widget _nameTextfield(HomeBloc _homeBloc) {
    return Container(
      child: TextField(
        controller: _nameController,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
        ],
        decoration: InputDecoration(
          hintText: "Nama",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            borderSide: BorderSide(
              color: SiklusColorPallete.blueCyan,
              width: 2,
            ),
          ),
        ),
        onChanged: (value) {
          _homeBloc.add(TextFieldChanged(value: value));
        },
      ),
    );
  }

  Widget _resultContainer(HomeState state) {
    String _text = "Result";
    if (state.name.isNotEmpty) {
      _text = "Hai, ${state.name}";
    }

    if (state.counter > 0) {
      _text =
          "Hai, ${state.name}. Kamu sudah menekan tombol add sebanyak ${state.counter}";
    }

    return Container(
      child: Text(
        _text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
