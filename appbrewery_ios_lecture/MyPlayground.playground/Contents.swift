import UIKit

//var aYear =  1200
//
//func isLeap(year: Int) {
//
//  //Write your code inside this function.
//    if year % 4 == 0  && (year % 100 != 0 || year % 400 == 0) {
//        print("YES")
//    }
//    else {
//        print("NO")
//    }
//
//
//
//}

//Try out your function with some different years. Don't copy the line below (it's not part of the exercise you need to complete).
//isLeap(year: aYear)

//var aNumber =  4
//
//func dayOfTheWeek(day: Int) {
//
//  //Write your code inside this function.
//    switch aNumber {
//    case 1:
//        print("Monday")
//    case 2:
//        print("Tuesday")
//    case 3:
//        print("Wednesday")
//    case 4:
//        print("Thursday")
//    case 5:
//        print("Friday")
//    case 6:
//        print("Saturday")
//    case 7:
//        print("Sunday")
//    default:
//        print("Error")
//    }
//
//}
//
////Try out some different numbers here
////Don't copy the line below into Udemy
//dayOfTheWeek(day: 5)


var studentsAndScores = ["Amy": 88, "James": 55, "Helen": 99]

func highestScore(scores: [String: Int]) {
    var max = 0
    let amy = scores["Amy"]!
    let james = scores["James"]!
    let helen = scores["Helen"]!
    if amy > james {
        max = amy
    } else {
        max = james
    }
    if max < helen {
        max = helen
    }
    print(max)
    
    
  //Write your code here.
}
highestScore(scores: studentsAndScores)
