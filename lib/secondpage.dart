import 'package:flutter/material.dart';
import 'package:shayri/thirdpage.dart';

class secondpage extends StatefulWidget {
  List a;
  int index;

  secondpage(this.a, this.index);

  @override
  _secondpageState createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  List wish = [];

  List Dosti = [
    "Rise and shine. buddy! It’s time to see the beautiful world. I hope your morning is filled with love, happiness, peace, and harmony. Good morning, friend!",
    "Dear friend, get up and give me a text as your text is like sugar to me with my morning coffee. Good morning to my lovely and dearest friend!😊",
    "Every morning you have two options to choose one. One to continue with your dreams other to get up and work hard to make them real. Good Morning!!",
    "Think positive. You can see how wonderful this world! Have a nice day. Good morning.",
    '''Mil jati hai kitno ko khushi,
Mit jate hain kitno ke gum,
Message isliye bhejte hai hum,
Taki na milne se bhi apni dosti na ho kam.''',
    '''Hasti Mit jati hai Aashiya Banane Me,
Bahut Muskil hoti hai Aapno Ko Samjane Me,
Ek pal me Kisi Ko bhula na Dena,
Zindagi lag jati hai Kisi Ko Aapna Banane me.''',
    '''Matlab Ki Duniya Thi
Isliye Liye chor dia
sabse milna.
Warna ye choti si umar
thnahai ke qabil
to nahin thi.''',
    '''Har Lamha Yun Kal Ko Talash Raha Hai Yeh Dil,
Guzri Yaadon Ko Fir Se Jeena Chah Raha Hai Yeh Dil,
Koi Mujhse Bhi Puch Le Kyun Khamosh Hai Meri Aankhein,
Meri Zindagi Ko Fir Se Maang Raha Hai Ye Dil.''',
    '''Kabhi udaas ho jayo to btana mujhe
fir se apna dil denge tumhe khelne k liye'''
  ];

  List Festival = [
    "A beautiful morning is calling you to have fun it’s a spectacular beauty. You just can’t miss this morning at any cost. Good morning!",
    "Life is a wild journey. Embrace every second of it. Enjoy your Day. Good Morning.",
    "Have a day as bright as the bonfire and as sweet as gur. Wishing you a day of joy and laughter. Have a very happy Lohri.",
    '''For my lovely brother, I send loving Rakhi wishes through this text message. You are my most lovable person on earth and I send a beautiful Rakhi along with the text with sweets for you.''',
    'Festival Season is a perfect time to reflect on our blessings and seek out ways to make life better for those around us.',
    'Good health, loads of wealth, prosperity in abundance are the things I am wishing you on this Festival Season.',
    'Happiness, Joy, Health and Wealth may reach your door this festival. Have a great celebration!',
    'May this festival gives you – A rainbow for every storm, A smile for every tear, A promise for every care, And an answer to every prayer. Best wishes',
    'May this festival be the start of the year that will bring your joy and happiness! Best wishes to you and your family.'
  ];

  List Frienship = [
    "Start your day with a great attitude & solid determination. You’re going to have an amazing day today. Good morning!",
    '''
Let us pray, in the positive light of happiness, may our life shine with hope and love. May this year we are showered with glory and success. Happy Lohri sweetest friend.''',
    '''Celebrate life with good music and food as I hope you celebrate the joyous day of Lohri with your friends and family. Wishing you lots of sweetness of gazak and rewdi.''',
    '''For my lovely brother, I send loving Rakhi wishes through this text message. You are my most lovable person on earth and I send a beautiful Rakhi along with the text with sweets for you.''',
    'You have always been there in my hard times and my heartbreaks. I thank god everyday for blessing me with such a true friend like you!',
    'I just wanted to tell you that you’ve always held a special place in my heart. Happy Friendship Day, buddy!',
    'Happy Friendship Day, my buddy! You are someone I can count on in every step of my life. May our beautiful friendship last forever!',
    'Hey, bestie! Happy Friendship Day! You are one of the kindest, funniest, and most helpful one I’ve ever met. Let’s stick to each other forever!',
    'Thank you for being around when I was going through hard times, my best friend forever.',
    'I won’t promise to be your friend forever, cause I won’t live that long. But let me be your friend as long as I live.',
    'Wishing you a happy friendship day, my dear friend. May God strengthen our bond and fill our lives with happy memories.'
  ];
  String d = ""; // for image

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.index == 0) {
      wish = Dosti;
      d = "images/p1.jpg";
    } else if (widget.index == 1) {
      wish = Festival;
      d = "images/p2.jpg";
    } else if (widget.index == 2) {
      wish = Frienship;
      d = "images/p3.jpg";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.a[widget.index]}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: wish.length,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.tealAccent,
            contentPadding: EdgeInsets.all(10),
            shape: Border.all(color: Colors.black),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return thirdpage(wish, index);
                },
              ));
            },
            // trailing: Icon(Icons.arrow_right_rounded),
            title: Text(
              "${wish[index]}",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20),
              maxLines: 1,
            ),
            leading: Image.asset("${d}"),
          );
        },
      ),
    );
  }
}
