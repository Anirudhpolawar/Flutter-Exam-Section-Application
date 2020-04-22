
import 'dart:math';
import 'package:csv/csv.dart';
import 'package:examination/Models/Student.dart';
import 'package:flutter/services.dart';


class Operation
{

    List<Student> students;
    Operation()
    {
      this.students = [];
    }

    //To Fetch the data
    Future<void> fetch () async
    {
        print("Fetch");
        final myData = await  rootBundle.loadString('data/datacollected.csv');
        List<List<dynamic>> datacsv = const CsvToListConverter().convert(myData);
        List<String> codes = ["Cs3001","CS40001","CS7001","CS6001","CS6001"];
        List<int> sp = [5,4,5,5,5];
        int gr = 1710239;
        int year = 2020;
        Random random = new Random();
        for(int i = 1;i<datacsv.length;i++)
        {
          List<int> marks = [];
           List<int> grade = [];
          for(int j = 0;j<5;j++)
          {
              int temp = random.nextInt(40)+60;
              marks.add(temp);
              if(temp>90)
                grade.add(10);
              else if(temp>80)
                grade.add(9);
              else if(temp>75)
                  grade.add(8);
              else if(temp>70)
                  grade.add(7);
              else if(temp>65)
                  grade.add(6);
              else
                  grade.add(5);
          }
          Student temp = new Student(datacsv[i][2], datacsv[i][3],datacsv[i][4], 5, codes, marks, grade, sp, gr, year);
          students.add(temp);
        }   
    }

    //To sort on First name
    void sortByFirstname(String input)
    {
        List<int> temp = [];
        students.forEach((element) {
              int i = 0;
              int j = 0;
              int counter = 0;
              int max = 0;
              while(i <element.firstname.length && j<input.length)
              {
                   
                    if(element.firstname[i] == input[j])
                    {
                      j++;
                      counter++;
                    }
                    else
                    {
                      if(counter>max)
                        max = counter;
                      counter = 0;
                      j = 0;
                      if(input[j] == element.firstname[i])
                      {
                        j++;
                        counter++;
                      }
                    }
                     i++;
              }
              if(counter>max)
                max = counter;
              temp.add(max);
        });
        for(int i = 1;i<students.length;i++)
        {
              Student val = students[i];
              int val2 = temp[i];
              int j = i-1;
              while(j>=0 && temp[j]<val2)
              {
                temp[j+1] = temp[j];
                students[j+1] = students[j];
                j--;
              }
               temp[j+1] = val2;
              students[j+1] = val;
        }

    }

    void sortByCPI()
    {
        for(int i = 1;i<students.length;i++)
        {
              Student val = students[i];
              int j = i-1;
              while(j>=0 && val.cpi>students[j].cpi)
              {
                students[j+1] = students[j];
                j--;
              }
              students[j+1] = val;
        }

    }


    Student getprofile(int gr)
    {
        print(gr);
        for(int i = 0;i<students.length;i++)
        {
          if(students[i].grnumber == gr)
            return students[i];

        }
        return null;
    }

}