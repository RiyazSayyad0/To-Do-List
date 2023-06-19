import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";

  var bgColor = Colors.pink.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Body Mass Index (BMI)'),
        ),

        body: Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
            
                  const Text(
                    'BMI',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
                  ),
            
            
                  const SizedBox(height: 31),
            
            
                  TextField(
                    controller: wtController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        label: Text('Enter Your Weight(in KGs)',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                        prefixIcon: Icon(Icons.line_weight)),
                  ),
            
            
                  const SizedBox(height: 21,),
            
            
                  TextField(
                    controller: ftController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        label: Text('Enter Your Height(in Feet)',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                        prefixIcon: Icon(Icons.height)),
                  ),
            
            
                  const SizedBox(height: 21),
            
            
                  TextField(
                    controller: inController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        label: Text('Enter Your Height(in Inches)',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                        prefixIcon: Icon(Icons.height_outlined)),
                  ),
        
                  const SizedBox(height: 21),
        
                  ElevatedButton(onPressed: (){
        
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();
        
                  
        
                    if(wt != "" && ft != "" && inch != ""){
        
                    //BMI Calculation
        
                      var iWt = int.parse(wt);
                      var iFt = int.parse(ft);
                      var iInch = int.parse(inch);
        
        
                    //Here we will Convert the feet to Inches
        
                      var tInch = (iFt*12) + iInch;
        
                    //Here we will Convert the Inches to Cm
        
                      var tCm = tInch * 2.54;
        
                    //Here we will Convert the Cm to Meter  
        
                      var tM = tCm/100;
        
                    //Here we will Count the BMI 
        
                      var bmi = iWt/(tM * tM);


                      var msg = "";

                      if(bmi>25){
                        msg = "You're OverWeighted!!!";
                        bgColor = Color.fromARGB(255, 229, 76, 76);
                      } else if(bmi<18){
                        msg = "You're UnderWeighted!!!";
                        bgColor = Color.fromARGB(255, 218, 206, 103);
                      } else{
                        msg = "You're Healthy!!!";
                        bgColor = Color.fromARGB(255, 107, 224, 111);
                      }
        
                      setState(() {
                        result = "$msg \n Your BMI is ${bmi.toStringAsFixed(4)}";
                      });
        
                    } else {
                      setState(() {
                        result = "Please Fill All The Required Blanks";
                      });
                    }
        
                  },
                  child: Text('Calculate')),
        
                  const SizedBox(height: 15),
        
                  Text(result, style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),)
            
                ],
              ),
            ),
          ),
        ));
  }
}
