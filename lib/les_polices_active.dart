import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/features/app_bar.dart';
import 'package:sidam_assurance_app/features/polices_card.dart';
import 'package:sidam_assurance_app/network_controllers/my_assurances_controller.dart';
import 'package:sidam_assurance_app/selectiveDTOS/my_polices_record.dart';

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
      final fetchedAssurances = await requestwithdio(email: widget.useremail);
      setState(() {
        assurances = fetchedAssurances;
        _isLoading = false; // Stop showing loading indicator when data is fetched
      });
    } catch (error) {
      print('Error fetching data: $error');
      setState(() {
        _isLoading = false; // Stop showing loading indicator in case of error
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
          ?const Center(child: CircularProgressIndicator()) // Show loading indicator while fetching data
          : ListView.builder(
              itemCount: assurances.length,
              itemBuilder: (context, index) {
                final assurance = assurances[index];
                return  Column(
                  children: [
                    PolicesCard(type_assurance: assurance.type_assurance ?? "not found",
                     montant_total: assurance.montantTotal ?? "not found",
                     paiement: assurance.paiement ?? "not found"),
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