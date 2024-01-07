import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcase/contact_model.dart';

class ConatctPage extends StatefulWidget {
  const ConatctPage({Key? key}) : super(key: key);

  @override
  State<ConatctPage> createState() => _ConatctPageState();
}

class _ConatctPageState extends State<ConatctPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  List<Contact> contacts = List.empty(growable: true);

  int selectedIndex = -1;

  late SharedPreferences sp;

  getSharedPrefrences() async {
    sp = await SharedPreferences.getInstance();
    readFromSp();
  }

  //  if (response.statusCode == 200) {
  //     appguidelist = (response.body["payload"] as List)
  //         .map((e) => AppguideModel.fromJson(e))
  //         .toList();

  //     List<String> appguidelistStrings =
  //         appguidelist.map((e) => e.toString()).toList();
      // List<String> appguidelistStrings =
      //   appguidelist.map((e) => jsonEncode(e.toJson())).toList();
  //     sharedPreferences.setStringList('guideList', appguidelistStrings);
  //     sharedPreferences.setInt('guideListTimestamp', guideUpdateTime);
  //     print('with api call $appguidelist');
  //   } else {
  //     showCustomSnackBar(response.statusText.toString());
  //   }
  // } else {

  //   final guideStrings = sharedPreferences.getStringList('guideList') ?? [];
  //   appguidelist = guideStrings
  //       .map((e) => AppguideModel.fromJson(json.decode(e)))
  //       .toList();
  //   print('without api call $appguidelist');
  // }

  saveIntoSp() {
    //
    List<String> contactListString =
        contacts.map((contact) => jsonEncode(contact.toJson())).toList();
    sp.setStringList('myData', contactListString);
    print("saved Contact ==> $contactListString");
    print("saved Contact*** ==> $contacts");
    //
  }

  readFromSp() {
    //
    List<String>? contactListString = sp.getStringList('myData');
    if (contactListString != null) {
      contacts = contactListString
          .map((contact) => Contact.fromJson(json.decode(contact)))
          .toList();
    }
    setState(() {});
    print("get Contact ==> $contactListString");
    print("get Contact**** ==> $contacts");
    //
  }

  @override
  void initState() {
    getSharedPrefrences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Contacts List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  hintText: 'Contact Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: contactController,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: const InputDecoration(
                  hintText: 'Contact Number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      //
                      String name = nameController.text.trim();
                      String contact = contactController.text.trim();
                      if (name.isNotEmpty && contact.isNotEmpty) {
                        setState(() {
                          nameController.text = '';
                          contactController.text = '';
                          contacts.add(Contact(name: name, contact: contact));
                        });
                        // Saving contacts list into Shared Prefrences
                        saveIntoSp();
                      }
                      //
                    },
                    child: const Text('Save')),
                ElevatedButton(
                    onPressed: () {
                      //
                      String name = nameController.text.trim();
                      String contact = contactController.text.trim();
                      if (name.isNotEmpty && contact.isNotEmpty) {
                        setState(() {
                          nameController.text = '';
                          contactController.text = '';
                          contacts[selectedIndex].name = name;
                          contacts[selectedIndex].contact = contact;
                          selectedIndex = -1;
                        });
                        // Saving contacts list into Shared Prefrences
                        saveIntoSp();
                      }
                      //
                    },
                    child: const Text('Update')),
              ],
            ),
            const SizedBox(height: 10),
            contacts.isEmpty
                ? const Text(
                    'No Contact yet..',
                    style: TextStyle(fontSize: 22),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) => getRow(index),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              index % 2 == 0 ? Colors.deepPurpleAccent : Colors.purple,
          foregroundColor: Colors.white,
          child: Text(
            contacts[index].name[0],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contacts[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(contacts[index].contact),
          ],
        ),
        trailing: SizedBox(
          width: 70,
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    //
                    nameController.text = contacts[index].name;
                    contactController.text = contacts[index].contact;
                    setState(() {
                      selectedIndex = index;
                    });
                    //
                  },
                  child: const Icon(Icons.edit)),
              InkWell(
                  onTap: (() {
                    //
                    setState(() {
                      contacts.removeAt(index);
                    });
                    // Saving contacts list into Shared Prefrences
                    saveIntoSp();
                    //
                  }),
                  child: const Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
