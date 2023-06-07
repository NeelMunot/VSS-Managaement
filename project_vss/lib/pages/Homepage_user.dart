import 'package:VSS/pages/Batches.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:VSS/pages/Calendar.dart';
import 'package:VSS/pages/Login_page.dart';
import 'package:VSS/pages/profile.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Homepage_user extends StatelessWidget {
   Homepage_user({super.key});
  final storage = FlutterSecureStorage();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void logout() async{
        await storage.write(key: 'username', value: "");
        await storage.write(key: 'password', value: "");
        await storage.write(key: 'role', value: "");
        await storage.write(key: 'grn', value: "");
        _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Students Vidyarthi Shayyak Samiti"),
      ),
      drawer: Drawer(
          child: SingleChildScrollView(
              child: Container(
        child: Column(children: [
          MyDrawerList(),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: const Text(
                "Profile",
              )),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Calendar()),
                );
              },
              child: const Text("Attendence")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyBatches()),
                );
              },
              child: const Text("Change My Batch")),
          ElevatedButton(
            onPressed: () {
            logout();
              Navigator.pushAndRemoveUntil(
                  context,MaterialPageRoute(builder: (context) => LoginPage()),
                  (Route<dynamic> route) => false, // Remove all previous routes
                  );
                  
                },
            child: const Text("Log out"),
            ),
        ]),
      ))),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),

          Image.asset("assets/images/logo.png"),
          Image.asset("assets/images/line2.png"),

          const SizedBox(
            height: 20,
          ),

          Image.asset("assets/images/Hostel.jpg"),
          // Padding(padding: Padding.top(20)),
          const SizedBox(
            height: 20,
          ),

          Image.asset("assets/images/line2.png"),
          const Text(
            "Welcome ",
            textScaleFactor: 3,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Color.fromARGB(255, 12, 1, 109), fontSize: 20),
          ),
          Image.asset("assets/images/line2.png"),
          const SizedBox(
            height: 20,
          ),

          Image.asset("assets/images/Hos.jpg"),

          const SizedBox(
            height: 20,
          ),

          Image.asset("assets/images/line2.png"),
          const Text(
            " समितीविषयी ",
            textScaleFactor: 2,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Color.fromARGB(255, 12, 1, 109), fontSize: 20),
          ),
          Image.asset("assets/images/line2.png"),
          const SizedBox(
            height: 20,
          ),

          const Text(
            " ग्रामीण भागातील हजारो विद्यार्थ्यांच्या जीवनात परिवर्तन घडविणारी संस्था आहे. युवा परिवर्तनाचे केंद्र म्हणून विद्यार्थी साहाय्यक समितीच्या कामाकडे पाहिले जाते. समिती ही धर्मादाय आयुक्त कार्यालयाकडे सार्वजनिक विश्वस्त अधिनियम १९५० च्या कलम ५० ए (३) अंतर्गत नोंदणीकृत (क्र. ई-२१९, पुणे) संस्था असून संस्थेचे कार्यक्षेत्र संपूर्ण भारतभर आहे.  समाजातील आर्थिकदृष्ट्या दुर्बल परंतु गुणवत्तेच्या जोरावर काहीतरी ध्येय ठेवून धडपड करणाऱ्या विद्यार्थी-विद्यार्थिनींना पुण्यात अतिशय माफक दरात राहण्याची आणि जेवणाची सोय उपलब्ध करून द्यावी या हेतूने ज्येष्ठ गणितज्ज्ञ डॉ. अच्युतराव आपटे, स्वातंत्र्यसेनानी हरिभाऊ फाटक, सुमित्राताई केरकर आदींनी १९५५ मध्ये या कामाला सुरवात केली. त्यावेळी पाच विद्यार्थ्यांची वेगवेगळ्या घरी वाराने जेवणाची सोय करण्यापासून काम सुरू झाले. पुढे विद्यार्थ्यांचा निवासाचा प्रश्न मार्गी लावला. मग विद्यार्थिनींसाठी सोय करण्यात आली. आता समितीची पुण्यात चार वसतिगृहे असून त्यात ७४७ विद्यार्थी आणि विद्यार्थिनी येथील सुविधांचा लाभ घेत आहेत. समिती म्हणजे केवळ लॉजिंग बोर्डिंग नाही तर येथे माफक दरात निवास, भोजन व्यवस्थेबरोबर व्यक्तिमत्त्व विकास या संकल्पनेला सर्वाधिक महत्त्व दिले जाते. समितीत जात, धर्म, पंथ या संकल्पनेला थारा दिला जात नाही. स्वच्छता, समता आणि श्रमप्रतिष्ठा या त्रिसूत्रीवर समितीचे काम चालते. देणगीदार जरी शहरी भागातले असले तरी प्रवेश फक्त ग्रामीण भागातील गरजू आणि होतकरू विद्यार्थ्यांनाच दिला जातो. ",
            textScaleFactor: 1,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Color.fromARGB(255, 12, 1, 109), fontSize: 17),
          ),
          const SizedBox(
            height: 20,
          ),

          Image.asset("assets/images/line2.png"),
          Image.asset("assets/images/organisations-structure.png"),

          const SizedBox(
            height: 20,
          ),

          Image.asset("assets/images/line2.png"),
          const Text(
            " उपक्रम ",
            textScaleFactor: 2,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Color.fromARGB(255, 12, 1, 109), fontSize: 20),
          ),
          Image.asset("assets/images/line2.png"),
          const SizedBox(
            height: 20,
          ),

          const Text(
            " अल्पदरात निवास व भोजन एवढ्यापुरतेच मर्यादित समितीचे कार्य नाही तर येथील विद्यार्थ्यांचा व्यक्तिमत्त्व विकास हे समितीचे मुख्य ध्येय आहे. त्यासाठी विविध कार्यक्रमांचे आयोजन केले जाते. विद्यार्थी व्यवस्थापनातून या ग्रामीण युवकांचे सुसंस्कारित आणि आत्मविश्वासपूर्ण पिढीत रुपांतर करण्याचा समितीचा प्रयन्त असतो. ",
            textScaleFactor: 1,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Color.fromARGB(255, 12, 1, 109), fontSize: 17),
          ),
          const SizedBox(
            height: 20,
          ),

          const Text(
            " गटचर्चा, इंग्रजी भाषा वर्ग, इंग्रजी प्रेझेंटेशन, योगासने, क्रीडा (अनिवार्य), सांस्कृतिक कार्यक्रम,पाककला, वादविवाद, वक्तुव, कथाकथन, कवितावाचन आदी स्पर्धांचे आयोजन, विविध क्षेत्रांतील तज्ज्ञांची व्याख्याने,शैक्षणिक सहली,उद्योजकता विकास उपक्रम, विद्यार्थी व्यवस्थापन इत्यादी..",
            textScaleFactor: 1,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Color.fromARGB(255, 12, 1, 109), fontSize: 17),
          ),
          const SizedBox(
            height: 20,
          ),

          const SizedBox(
            height: 20,
          ),

          Image.asset("assets/images/yoga.jpg"),
          const SizedBox(
            height: 10,
          ),

          Image.asset("assets/images/Vaktrutv.jpg"),
          const SizedBox(
            height: 10,
          ),

          Image.asset("assets/images/Gat.jpg"),
          const SizedBox(
            height: 30,
          ),

          Image.asset("assets/images/line2.png"),
          const Text(
            " सुविधा ",
            textScaleFactor: 2,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Color.fromARGB(255, 12, 1, 109), fontSize: 20),
          ),
          Image.asset("assets/images/line2.png"),
          const SizedBox(
            height: 20,
          ),

          Image.asset("assets/images/room.jpg"),
          const SizedBox(
            height: 10,
          ),

          const Text(
            " खोली – एका खोलीत तीन किंवा चार विद्यार्थ्यांची खोलीच्या आकारानुसार व्यवस्था केली जाते. खोलीत प्रत्येकाला कॉट, गादी, टेबल, खुर्ची, कपाट, पंखा आदी सुविधा असतात. ",
            textScaleFactor: 1,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Color.fromARGB(255, 12, 1, 109), fontSize: 17),
          ),
          const SizedBox(
            height: 30,
          ),

          Image.asset("assets/images/restaurant.jpg"),
          const SizedBox(
            height: 10,
          ),

          const Text(
            " भोजनालय –समितीत प्रवेश झाल्यावर विद्यार्थ्याला येथील भोजन घेणेच अनिवार्य असते. रोज सकाळी आणि रात्री अशा दोन वेळेला जेवणाची व्यवस्था आहे. ",
            textScaleFactor: 1,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Color.fromARGB(255, 12, 1, 109), fontSize: 17),
          ),
          const SizedBox(
            height: 30,
          ),

          Image.asset("assets/images/lab.jpg"),
          const SizedBox(
            height: 10,
          ),

          const Text(
            " ग्रंथालय – वसतिगृहनिहाय स्वतंत्र ग्रंथालयाची सुविधा आहे. क्रमिक आणि अवांतर पुस्तके उपलब्ध होऊ शकतात. विद्यार्थ्यांनी अवांतर वाचन करावे यासाठी प्रयत्न केले जातात. ",
            textScaleFactor: 1,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Color.fromARGB(255, 12, 1, 109), fontSize: 17),
          ),
          const SizedBox(
            height: 30,
          ),

          Image.asset("assets/images/computer.jpg"),
          const SizedBox(
            height: 10,
          ),

          const Text(
            " संगणक – विद्यार्थी विद्यार्थिनींसाठी सुसज्ज संगणक लॅब आहेत. अभ्यासक्रमाशी निगडीत गोष्टींसाठी विद्यार्थी या लॅबचा उपयोग करू शकतात. तज्ज्ञांच्या सल्ल्याने त्याविषयीचे काही अभ्यासक्रमही शिकवले जातात. ",
            textScaleFactor: 1,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Color.fromARGB(255, 12, 1, 109), fontSize: 17),
          ),
          const SizedBox(
            height: 30,
          ),

          Image.asset("assets/images/aarogya.jpg"),
          const SizedBox(
            height: 10,
          ),

          const Text(
            " आरोग्य केंद्र : प्रवेश झाल्यावर प्रत्येक विद्यार्थ्याची आरोग्य तपासणी केली जाते. प्राथमिक उपचाराकरिता डॉक्टरांची सेवा आहे. रुग्णालयात दाखल करायची वेळ आल्यास पालकांशी संपर्काचा प्रयत्न केला जातो. त्या खर्चाची जबाबदारी पालकांची असते. ",
            textScaleFactor: 1,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Color.fromARGB(255, 12, 1, 109), fontSize: 17),
          ),
          const SizedBox(
            height: 30,
          ),

          Image.asset("assets/images/gallery.jpg"),
          const SizedBox(
            height: 10,
          ),

          const Text(
            " क्रीडा विभाग – विद्यार्थ्यांना संस्थांतर्गत आणि क्रीडांगणावर खेळण्यासाठी क्रीडासाहित्य उपलब्ध करून दिले जाते. विविध खेळांमध्ये सहभाग नोंदवून शारीरिक, मानसिक तंदुरुस्तीबरोबरच स्पर्धेत सहभागी होऊन हार-जीतीचे प्रशिक्षण नकळत मिळते. ",
            textScaleFactor: 1,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Color.fromARGB(255, 12, 1, 109), fontSize: 17),
          ),
          const SizedBox(
            height: 20,
          ),

          Image.asset("assets/images/line2.png"),

          const Text(
            " देणगी ",
            textScaleFactor: 2,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Color.fromARGB(255, 12, 1, 109), fontSize: 20),
          ),
          Image.asset("assets/images/line2.png"),
          const SizedBox(
            height: 20,
          ),
          // Image.asset("assets/images/line2.png"),

          Image.asset("assets/images/dengi.jpg"),

          const SizedBox(
            height: 20,
          ),

          const Text(
            " सन्माननीय साहाय्यदाते व हितचिंतक, हजारो ग्रामीण युवकांच्या आयुष्यात शिक्षणसंधीतून परिवर्तन साधण्याचे काम समिती अर्धशतकाहून अधिक काळ करत आहे. समितीत येणारा विद्यार्थी हा अल्प उत्पन्न गटातीलच असतो. परंतु तो नुसताच गरजू नसतो तर तो होतकरूही असतो. अशा विद्यार्थ्यांना केवळ अल्प दरात निवास, भोजन नाही, तर त्यांचा व्यक्तिमत्त्व विकास साधण्यासाठी येथे विविध उपक्रम राबवले जातात. मुळात युवकांना काही चांगले करायचे असते. परंतु त्यासाठी त्यांना तसे वातावरण देणे, सामाजिक समरसतेचा, सकारात्मकतेचा विचार त्यांच्यापुढे ठेवणे, त्यांची ऊर्जा विधायकतेकडे वळवणे, त्यांचे स्फुल्लिंग चेतवणे गरजेचे असते. एका नवनिर्माण करणाऱ्या पिढीची त्यातून निर्मिती होते, यावर समितीचा विश्वास आहे. आजवर आम्ही ते अनुभवत आहोत. अर्थात हे सारे शक्य होते ते आपल्यासारख्या दानशूरांमुळे, हितचिंतकांमुळे. समितीचा व्यवहार अतिशय पारदर्शी असल्यामुळे पिढ्यानपिढ्या देणगी देणाऱ्यांच्या बळावरच हा जगन्नाथाचा रथ हाकणे शक्य होते आहे. आपण समितीच्या कार्याची माहिती घ्यावी, एकदा अवश्य भेट द्यावी.आपल्या परिचितांपर्यंत हे कार्य पोचवावे आणि यथाशक्ती आपलाही सहभाग या कार्यात नोंदवावा, अशी विनंती आहे. ",
            textScaleFactor: 1,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Color.fromARGB(255, 12, 1, 109), fontSize: 17),
          ),
          const SizedBox(
            height: 20,
          ),

          Image.asset("assets/images/line2.png"),
          const Text(
            " योजना ",
            textScaleFactor: 2,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Color.fromARGB(255, 12, 1, 109), fontSize: 20),
          ),
          Image.asset("assets/images/line2.png"),
          const SizedBox(
            height: 20,
          ),

          Image.asset("assets/images/4tas.jpg"),
          const SizedBox(
            height: 10,
          ),

          const Text(
            " चार तास काम योजना - समितीतील प्रत्येक विद्यार्थ्याला संस्थेसाठी रोज अर्धा तास (आठवड्यातून चार तास) कामासाठी द्यावे लागतात. स्वच्छता, कार्यालयात, भोजनालयात काम असे त्याचे स्वरूप असते. त्यातून श्रमसंस्काराची जाणीव दृढ होते. या कामाच्या नोंदी ठेवल्या जातात. त्याला श्रेणी दिली जाते. ",
            textScaleFactor: 1,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Color.fromARGB(255, 12, 1, 109), fontSize: 17),
          ),
          const SizedBox(
            height: 30,
          ),

          Image.asset("assets/images/earnnlearn.jpg"),
          const SizedBox(
            height: 10,
          ),

          const Text(
            " कमवा व शिका योजना - समितीमध्ये स्वावलंबन व अर्थार्जनासाठी कमवा व शिका ही योजना अनिवार्य आहे. या योजनेत काम केल्याने श्रमसंस्कार लक्षात येऊन पैशाचे मोल कळते, संभाषण कौशल्य, कामाची जबाबदारी, स्वावलंबन, व्यवहाराचे अनौपचारिक शिक्षण मिळते. रोज किमान एक ते दोन तास काम केल्यामुळे त्यांचा महिन्याचा खर्च भागण्यास व पालकांवरील आर्थिक ताण कमी होण्यास मदत होते. ",
            textScaleFactor: 1,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Color.fromARGB(255, 12, 1, 109), fontSize: 17),
          ),
          const SizedBox(
            height: 30,
          ),

          Image.asset("assets/images/parent.jpg"),
          const SizedBox(
            height: 10,
          ),

          const Text(
            " पाल्य पालक योजना - समितीला पालकत्व योजनेत देणगी देणाऱ्या साहाय्यदात्याला विद्यार्थी महिन्यातून एकदा त्यांच्या घरी जाऊन भेटतात. त्यांची विद्यार्थ्याच्या शिक्षणाविषयी, कौटुंबिक स्थितीविषयी चर्चा होते, काहीवेळा विद्यार्थ्याला मार्गदर्शन मिळते. त्यातून विद्यार्थ्याची प्रगती साधण्यास मदत होते. शक्यतो साहाय्यदात्यांच्या शैक्षणिक, व्यावसायिक अनुभवानुसार त्या त्या शाखेचे विद्यार्थी भेटीसाठी पाठवले जातात. एक ग्रामीण घर एका शहरी घराशी जोडले जाते. ",
            textScaleFactor: 1,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Color.fromARGB(255, 12, 1, 109), fontSize: 17),
          ),
          const SizedBox(
            height: 30,
          ),

          Image.asset("assets/images/line2.png"),

          const Text(
            " संपर्क ",
            textScaleFactor: 2,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Color.fromARGB(255, 12, 1, 109), fontSize: 20),
          ),
          Image.asset("assets/images/line2.png"),

          const SizedBox(
            height: 20,
          ),

          const Text(
            " विद्यार्थी साहाय्यक समिती ",
            textScaleFactor: 1,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Color.fromARGB(255, 12, 1, 109), fontSize: 17),
          ),
          const Text(
            " ११८२/१/४, शिवाजीनगर, फर्ग्युसन कॉलेज रोड, पुणे: ४११००५. ",
            textScaleFactor: 1,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Color.fromARGB(255, 12, 1, 109), fontSize: 17),
          ),
          const Text(
            " ईमेल: info@samiti.org ",
            textScaleFactor: 1,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Color.fromARGB(255, 12, 1, 109), fontSize: 17),
          ),
          const Text(
            " फोन: ०२०-२५५३३६३१ |९४०४८ ५५५३० ",
            textScaleFactor: 1,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Color.fromARGB(255, 12, 1, 109), fontSize: 17),
          ),
          const SizedBox(
            height: 20,
          ),

          const SizedBox(
            height: 20,
          ),

          // Image.asset("assets/images/line2.png"),
          // Image.asset("assets/images/download.png"),
          // Image.asset("assets/images/line2.png"),
          const SizedBox(
            height: 60,
          ),
        ]),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(children: [
        // shows the list of menu drawer
        menuItem(),
      ]),
    );
  }

  Widget menuItem() {
    return Material(
        child: InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(children: [
          const Expanded(
            child: Icon(
              Icons.dashboard_outlined,
              size: 20,
              color: Colors.black,
            ),
          ),
          const Expanded(
            flex: 3,
            child: Text(
              "Dashboard",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}

enum DrawerSections {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
