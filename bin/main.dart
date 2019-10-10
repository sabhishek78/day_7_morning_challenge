
// Last time you wrote PrintBoard function which takes in the board and prints it to the console
// Today you have to take user input and populate the Board at required location

// Challenge 1
// Take user input like A1, B3, C2 etc. and put 'X' or 'O' in required places turn by turn

//  A   B   C
// 1   |   |
//  ---+---+---
// 2   |   |
//  ---+---+---
// 3   |   |

// X's move:
// A2

//    A   B   C
//  1    |   |
//    ---+---+---
//  2  X |   |
//    ---+---+---
//  3    |   |

//  0's move:
//  B2

//  A   B   C
//  1    |   |
//    ---+---+---
//  2  X | 0 |
//    ---+---+---
//  3    |   |

//  X's move:
//  B3

//  A   B   C
//  1    |   |
//    ---+---+---
//  2  X | 0 |
//    ---+---+---
//  3    | X |

//  0's move:
//  A2

//  A   B   C
// 1    |   |
//   ---+---+---
// 2  0 | 0 |
//   ---+---+---
// 3    | X |

//  X's move:
//  B2

//    A   B   C
//  1    |   |
//    ---+---+---
//  2  0 | X |
//    ---+---+---
//  3    | X |
//  0's move:

// HINT: to get string character you can use [], example String name ='Arnav'; name[0] gives 'A'


// Challenge 2
// Validate the move
// In case if there is already an entry on board print invalid move
import 'dart:io';
bool firstrun=true;
int i=0;
main() {
  var boardSize = 3;
  List<List<String>> board =
  List.generate(boardSize, (_) => List.filled(boardSize, ' '));
  printBoard(board);
  String currentPlayer='X';
  List<int>x=[];

  List<int>y=[];
  int tempx, tempy;

  while(true)
  {
    print('$currentPlayer\'s move');
    String userChoice=stdin.readLineSync();
    tempx=getRow(userChoice);
    tempy=getColumn(userChoice);
    if(validateUserInput(x,  y,tempx, tempy))
      {
        x.add(tempx);
        y.add(tempy);
        print("Printing List x");
        print(x);
        print("Printing List y");
        print(y);
        board[x[i]][y[i]]=currentPlayer;
        printBoard(board);
        i++;
        if(currentPlayer=='X')
        {
          currentPlayer='O';
        }
        else
        {
          currentPlayer='X';
        }
      }


  }



}
bool validateUserInput(List<int>x,List<int>y,int tempx, int tempy)
{
  if(firstrun)
  {
    print("first run");
    firstrun=false;
    return true;
  }
  for(int j=0;j<x.length;j++)
    {

      if((x[j]==tempx)&&(y[j]==tempy))
        {
          print("Invalid Input. Try Again!!");
          return false;
        }


    }
  return true;
}
void printBoard(List<List<String>> board) {
  print('   A   B   C ');
  List<String> rows = board.map(rowToString).toList();
  print('1 ${rows[0]}');
  print('  ---+---+---');
  print('2 ${rows[1]}');
  print('  ---+---+---');
  print('3 ${rows[2]}');
}

int getColumn(String userInput){
  if(userInput[0]=='A') {
    return 0;
  }else if(userInput[0]=='B') {
    return 1;
  }else{
    return 2;
  }
}

int getRow(String userInput){
  if(userInput[1]=='1') {
    return 0;
  }else if(userInput[1]=='2') {
    return 1;
  }else{
    return 2;
  }
}

String rowToString(List<String> row) {
  return row.map((String val) => ' $val ').join('|');
}

