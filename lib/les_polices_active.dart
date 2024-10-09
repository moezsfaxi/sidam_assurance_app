import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/features/app_bar.dart';
import 'package:sidam_assurance_app/features/polices_card.dart';
import 'package:sidam_assurance_app/network_controllers/my_assurances_controller.dart';
import 'package:sidam_assurance_app/selectiveDTOS/my_polices_record.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivePolices extends StatefulWidget {
  final String useremail;
  const ActivePolices({super.key,required this.useremail});

  @override
  State<ActivePolices> createState() => _DtostestState();
}

class _DtostestState extends State<ActivePolices> {
List<AssuranceRecord> assurances = [];
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is created
    _fetchAssuranceData();
  }
  Future<void> _fetchAssuranceData() async {
    try {
      // Call your requestwithdio function or the Dio logic directly here
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String emailfromstorage = prefs.getString('user_email') ?? 'default@example.com';
      
      final fetchedAssurances = await requestwithdio(email: emailfromstorage);
      setState(() {
        assurances = fetchedAssurances;
        _isLoading = false; 
      });
    } catch (error) {
      print('Error fetching data: $error');
      setState(() {
        _isLoading = false; 
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    appBar:const AppBarwidget(isHome: true),
    body: Padding(
       
        padding:const EdgeInsets.all(8.0),
       child:
       _isLoading
          ?const Center(child: CircularProgressIndicator()) 
          : ListView.builder(
              itemCount: assurances.length,
              itemBuilder: (context, index) {
                final assurance = assurances[index];
                return  Column(
                  children: [
                    PolicesCard(type_assurance: assurance.type_assurance ?? "not found",
                     montant_total: assurance.montantTotal ?? "not found",
                     paiement: assurance.paiement ?? "not found",
                     date_debut_couvert: assurance.date_debut_couvert ?? "not found",
                     date_fin_couvert: assurance.date_fin_couvert ?? "not found",
                     id: assurance.id ?? 120,

                     ),
                     SizedBox(height: MediaQuery.of(context).size.width*0.05)

                  ],
                );
              },
            ),
    



       
        // const  PolicesCard(),
        // SizedBox(height: MediaQuery.of(context).size.width*0.05),




       
      
      
        ),
    

    );
  }
}