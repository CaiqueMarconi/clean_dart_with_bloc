import 'package:clean_dart_with_bloc/app/modules/home/presenter/bloc/get_address/get_address_bloc.dart';
import 'package:clean_dart_with_bloc/app/modules/home/presenter/bloc/get_address/get_address_event.dart';
import 'package:clean_dart_with_bloc/app/modules/home/presenter/bloc/get_address/get_address_state.dart';
import 'package:clean_dart_with_bloc/app/modules/home/presenter/bloc/home_screen/home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  final HomeScreenBloc homeScreenBloc;
  const HomeScreen({
    super.key,
    required this.homeScreenBloc,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formkey = GlobalKey<FormState>();
  String cep = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => widget.homeScreenBloc.getAddressBloc,
            ),
            BlocProvider(
              create: (context) => HomeScreenBloc(
                getAddressBloc: widget.homeScreenBloc.getAddressBloc,
              ),
            ),
          ],
          child: BlocConsumer<GetAddressBloc, GetAddressState>(
            listener: (context, state) {
              if (state is ErrorGetAdressState) {
                // Exibindo erro como Snackbar
                final errorState = state;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(errorState.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: _formkey,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Digite o CEP',
                      ),
                      onSaved: (v) {
                        cep = v!;
                      },
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'O CEP não pode ser vazio';
                        } else if (v.length != 8) {
                          return 'Digite um CEP válido!';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: state is LoadingGetAddressState
                        ? null
                        : () async {
                            _formkey.currentState!.save();

                            if (_formkey.currentState!.validate()) {
                              widget.homeScreenBloc.getAddressBloc.add(
                                GetAddress(cep: cep),
                              );
                            }
                          },
                    child: Text(
                      state is LoadingGetAddressState
                          ? 'Buscando...'
                          : 'Buscar',
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (state is SuccessGetAddressState) ...[
                    Text(state.address.city),
                    Text(state.address.neighborhood),
                    Text(state.address.state),
                    Text(state.address.street),
                  ]
                ],
              );
            },
          ),
        ),
      ),
    );
    ;
  }
}
