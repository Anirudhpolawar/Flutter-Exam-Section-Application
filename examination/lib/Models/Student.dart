
class Student 
{

  String firstname;
  String lastname;
  String middlename;
  int numberOfSubjects;
  List<String> subjectCodes;
  List<int> marks;
  List<int> grade;
  List<int> subjectpoint;
  int grnumber;
  int year;
  double cpi; 

  Student(String first,String last,String middle,int number,List<String> codes,List<int> marks,List<int> grade, List<int> subjectpoint,int gr,int year)
  {
      this.firstname = first;
      this.middlename = middle;
      this.lastname = last; 
      this.grnumber =gr;
      this.numberOfSubjects = number;
      this.marks = marks;
      this.grade = grade;
      this.subjectCodes = codes;  
      this.subjectpoint = subjectpoint;
      this.year = year;
      this.cpi = getCPI();
      
  }

  double getCPI()
  {
     int sum = 0;

     this.subjectpoint.forEach((element) {
       sum += element;
     });

     int studentsum = 0; 
     for(int i = 0;i<grade.length;i++)
     {
       studentsum += grade[i] * subjectpoint[i];
     }
     double cpicalculated = studentsum/sum;
     return cpicalculated;
  }

}