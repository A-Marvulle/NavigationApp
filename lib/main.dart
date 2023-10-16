import 'package:flutter/material.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> {

  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    _Lista(),
    _Image(),
    _Form()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tela $_selectedIndex', style: const TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 81, 15, 83),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 81, 15, 83),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Lista',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Image',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt),
            label: 'School',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
class _Lista extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  Container( //lista
          alignment: Alignment.center,
          child: Center(child: Container(
               decoration: BoxDecoration(
            color: Colors.white,
              border: Border.all(
                  color: const Color.fromARGB(255, 81, 15, 83), width: 2),
                  borderRadius: BorderRadius.circular(45),
                  boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                ),
              ]),
        
            height: 300,
            width: 300,
            child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.star),
                    title: Text("Item $index"),
                  );})),)
          
          ,
        ),
      )
    );
  }
}

class _Image extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  Container( //img
          height: 250,
          width: 300,
          alignment: Alignment.center,
          child: Column(children: [
            const Text('Indo Ali',
            style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Image.network("https://p16-sign-va.tiktokcdn.com/tos-maliva-p-0068/22a340cc40674b07a056cd558b266882_1694089195~tplv-photomode-video-cover:480:480.jpeg?x-expires=1694829600&x-signature=xEM5Dy%2FGic7Txo8eUUpWjcHwnUw%3D")
          ]),
        ),
      )
    );
  }
}

class _Form extends StatelessWidget{
    final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:    Container(
          width: 400,
          height: 550,
          padding: const EdgeInsets.all(10.0),
           decoration: BoxDecoration(
            color: Colors.white,
              border: Border.all(
                  color: const Color.fromARGB(255, 81, 15, 83), width: 2),
                  borderRadius: BorderRadius.circular(45),
                  boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                ),
              ]),
          alignment: Alignment.center,
          child: Column(children: [Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            //nome
            decoration: const InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 81, 15, 83),
                ),
                hintText: 'Digite seu Nome',
                labelText: 'Nome',
                labelStyle: TextStyle(color: Color.fromARGB(255, 81, 15, 83)),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 81, 15, 83)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 81, 15, 83)),
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor digite o nome completo';
              }
              if (!RegExp(r"\b(?:[A-Z][a-z]*\s*){2,}\b").hasMatch(value)) {
                return 'Por favor digite um nome com a primeira letra maiúscula';
              }
              return null;
            },
          ),
          TextFormField(
            //nickname
            decoration: const InputDecoration(
                icon: Icon(
                  Icons.group,
                  color: Color.fromARGB(255, 81, 15, 83),
                ),
                hintText: 'Digite seu Apelido',
                labelText: 'Nickname',
                labelStyle: TextStyle(color: Color.fromARGB(255, 81, 15, 83)),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 81, 15, 83)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 81, 15, 83)),
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor digite o nickname';
              }
              if (!RegExp(r"^[a-zA-Z]{5,15}$").hasMatch(value)) {
                return 'Deve ter entre 5 e 15 caracteres';
              }

              return null;
            },
          ),
          TextFormField(
            //idade
            decoration: const InputDecoration(
                icon: Icon(
                  Icons.cake,
                  color: Color.fromARGB(255, 81, 15, 83),
                ),
                hintText: 'Digite sua idade',
                labelText: 'Idade',
                labelStyle: TextStyle(color: Color.fromARGB(255, 81, 15, 83)),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 81, 15, 83)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 81, 15, 83)),
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor digite sua idade';
              }
              if (!RegExp(r"^(?:1[6-9]|[2-9][0-9]|100)$").hasMatch(value)) {
                return 'Você deve ter mais de 16 anos e menos de 100';
              }

              return null;
            },
          ),
          TextFormField(
            //email
            decoration: const InputDecoration(
                icon: Icon(
                  Icons.email,
                  color: Color.fromARGB(255, 81, 15, 83),
                ),
                hintText: 'Digite seu E-mail',
                labelText: 'E-mail',
                labelStyle: TextStyle(color: Color.fromARGB(255, 81, 15, 83)),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 81, 15, 83)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 81, 15, 83)),
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor digite se E-mail';
              }
              if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                  .hasMatch(value)) {
                return 'Por favor digite um formato válido';
              }

              return null;
            },
          ),
          TextFormField(
            //CPF
            decoration: const InputDecoration(
                icon: Icon(
                  Icons.dock,
                  color: Color.fromARGB(255, 81, 15, 83),
                ),
                hintText: 'Digite seu CPF',
                labelText: 'CPF',
                labelStyle: TextStyle(color: Color.fromARGB(255, 81, 15, 83)),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 81, 15, 83)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 81, 15, 83)),
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor digite o CPF';
              }
              if (!RegExp(
                      r"([0-9]{2}[\.]?[0-9]{3}[\.]?[0-9]{3}[\/]?[0-9]{4}[-]?[0-9]{2})|([0-9]{3}[\.]?[0-9]{3}[\.]?[0-9]{3}[-]?[0-9]{2})$")
                  .hasMatch(value)) {
                return 'Digite um formato válido';
              }

              return null;
            },
          ),
          TextFormField(
            //RG
            decoration: const InputDecoration(
                icon: Icon(
                  Icons.dock,
                  color: Color.fromARGB(255, 81, 15, 83),
                ),
                hintText: 'Digite seu RG',
                labelText: 'RG',
                labelStyle: TextStyle(color: Color.fromARGB(255, 81, 15, 83)),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 81, 15, 83)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 81, 15, 83)),
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor digite o RG';
              }
              if (!RegExp(r"(^\d{1,2}).?(\d{3}).?(\d{3})-?(\d{1}|X|x$)")
                  .hasMatch(value)) {
                return 'Digite um formato válido';
              }

              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SizedBox(
                width: 250,
                height: 35,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Background color
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            backgroundColor: Colors.green,
                            content: Text('Válido')),
                      );
                    }
                  },
                  child: const Text('Enviar'),
                )),
          ),
        ],
      ),
    )],),
      )
    )
    );
  }
}
