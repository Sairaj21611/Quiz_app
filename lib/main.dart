import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
} 
class QuizApp extends StatefulWidget{
  const QuizApp({super.key});

  @override
  State createState()=> _QuizAppState();

}
class _QuizAppState extends State{

  List<Map> allQuestions = [
    {
      "question":"Who is the founder of Microsoft?",
      "options":["Steve Jobs", "Bill Gates", "Lary Page", "Elon musk"],
      "correctAnswer": 1
    },
     {
      "question":"Who is the founder of Google?",
      "options":["Steve Jobs", "Bill Gates", "Lary Page", "Elon musk"],
      "correctAnswer": 2
    },
     {
      "question":"Who is the founder of SpaceX?",
      "options":["Steve Jobs", "Bill Gates", "Lary Page", "Elon musk"],
      "correctAnswer": 3
    },
     {
      "question":"Who is the founder of Apple?",
      "options":["Steve Jobs", "Bill Gates", "Lary Page", "Elon musk"],
      "correctAnswer": 0
    },
     {
      "question":"Who is the founder of Meta?",
      "options":["Steve Jobs", "mark zukya", "Lary Page", "Elon musk"],
      "correctAnswer": 1
    }
  ];
   
  int currentQuestionIndex = 0;
  int selectAnswerIndex = -1;
  int score = 0;

  WidgetStateProperty<Color?> checkAnswer(int answerIndex){
    if(selectAnswerIndex != -1){
      if(answerIndex == allQuestions[currentQuestionIndex]["correctAnswer"]){
        return const WidgetStatePropertyAll(Colors.green);
      }else if(selectAnswerIndex == answerIndex){
        return const WidgetStatePropertyAll(Colors.red);
      }else{
        return const WidgetStatePropertyAll(null);
      }
    }
    else{
      return const WidgetStatePropertyAll(null);
    }
  }

  bool flag = true;
  

  @override
  Widget build(BuildContext context){
    return  isQuestionScreen();
  }
    Scaffold isQuestionScreen(){
      if(flag == true){
        return Scaffold(
      backgroundColor:  const Color.fromARGB(255, 2, 42, 76),
      appBar: AppBar(
        title: const Text("Quiz App",
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 28,
          color:  Color.fromARGB(255, 2, 42, 76),
        ), 
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Question : ${currentQuestionIndex + 1}/${allQuestions.length}",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 28,
              color: Colors.white
            ),
            ),
            const SizedBox(
              height: 60,
            ),
            ///Questions
           SizedBox(
              height: 50,
              width: 380,
              child: Text(allQuestions[currentQuestionIndex]["question"],
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),)

            ),
            const SizedBox(
              height: 50,
            ),
            ///OPtion 1
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(0)
                ),
                onPressed: () {
                  if(selectAnswerIndex == -1){
                    selectAnswerIndex = 0;
                    
                    setState(() {});
                  }
                },
                child: Text("A. ${allQuestions[currentQuestionIndex]["options"][0]}",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color:  Color.fromARGB(255, 2, 42, 76),
                )
              
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
            ///OPtion 2
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
               style: ButtonStyle(
                  backgroundColor: checkAnswer(1)
                ),
              onPressed: () {
                if(selectAnswerIndex ==-1){
                  selectAnswerIndex = 1;
                  setState(() {});
                }
              },
              child: Text("B. ${allQuestions[currentQuestionIndex]["options"][1]}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color:  Color.fromARGB(255, 2, 42, 76),
              ),),
          ),
          ),
           const SizedBox(
            height: 30,
          ),
            ///OPtion 3
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
               style: ButtonStyle(
                  backgroundColor: checkAnswer(2)
                ),
              onPressed: () {
                 if(selectAnswerIndex ==-1){
                  selectAnswerIndex = 2;
                  setState(() {});
                 }
              },
              child: Text("C. ${allQuestions[currentQuestionIndex]["options"][2]}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color:  Color.fromARGB(255, 2, 42, 76),
              ),),
          ),
          ),
           const SizedBox(
            height: 30,
          ),
            ///OPtion 4
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
               style: ButtonStyle(
                  backgroundColor: checkAnswer(3)
                ),
              onPressed: () {
                 if(selectAnswerIndex ==-1){
                  selectAnswerIndex = 3;
                  setState(() {});
                 }
              },
              child: Text("D. ${allQuestions[currentQuestionIndex]["options"][3]}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color:  Color.fromARGB(255, 2, 42, 76),
              ),
              ),
          ),
          ),
          const SizedBox(
            height: 100,
          ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         if(selectAnswerIndex != -1){
           if(currentQuestionIndex<allQuestions.length-1){
            currentQuestionIndex++;
           } else{
            flag = false;
          }
           selectAnswerIndex = -1;
            setState(() {});
         }
        },
        backgroundColor:  Colors.white,
        child: const Icon(Icons.forward,
        color:   Color.fromARGB(255, 2, 42, 76),
        ),
        ),
        
    );
  }else{
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quiz Result",
            style: TextStyle(

              fontSize: 28,
              fontWeight: FontWeight.w900,
                color: Colors.white,
),
),
        centerTitle: true,
        backgroundColor:  const Color.fromARGB(255, 2, 42, 76),

        ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("https://t4.ftcdn.net/jpg/05/93/91/27/360_F_593912714_6pEIEP3YlFQkbwknHEYxQzbne5ZN6BlE.jpg",
            height: 300,
            ),
          const SizedBox(height: 30),
          const Text(
            "Congratulations",
             style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Colors.orange,
              ),
            ),
          const SizedBox(height: 30),
           Text("Score: $score/${allQuestions.length} ",),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              currentQuestionIndex = 0;
              flag = true;
              score = 0;
              setState(() {});
            },
           
            style: const ButtonStyle(
              foregroundColor: WidgetStatePropertyAll( Color.fromARGB(255, 2, 42, 76),),
            ),
             child: const  Text("Reset",),
          ),
    ] 
  ),
    )
);

    
  }
}
}