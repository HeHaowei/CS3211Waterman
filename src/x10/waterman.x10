package x10;

import x10.io.*;

import x10.io.Console;

import x10.array.*;

import x10.util.*;





public class waterman {

	static val letterValue = new HashMap[Char,Long]();
	static val A = 10;
	static val B = 5;

	//=================================================================================================

	// build the Blosum dict;

/*	public static def buildBlosum(inputBlosum: String):Array_2[Long]{

		// TODO build a real parser;
		
		val blosum = new Array_2[Long](4, 4);
		letterValue.put('A',0);
		letterValue.put('B',1);
		letterValue.put('G',2);
		letterValue.put('T',3);

		// A:0 C:1 G:2 T:3

		blosum(0,0) = 4;

		blosum(0,1) = 0;

		blosum(0,2) = 0;

		blosum(0,3) = 0;

		blosum(1,0) = 0;

		blosum(1,1) = 9;

		blosum(1,2) = -3;

		blosum(1,3) = -1;

		blosum(2,0) = 0;

		blosum(2,1) = -3;

		blosum(2,2) = 6;

		blosum(2,3) = -2;

		blosum(3,0) = 0;

		blosum(3,1) = -1;

		blosum(3,2) = -2;

		blosum(3,3) = 5;

		return blosum;

	};*/
	
public static def buildBlosum(inputBlosum: String):Array_2[Long]{



		// TODO build a real parser;

		

		

		letterValue.put('A',0);

		letterValue.put('R',1);

		letterValue.put('N',2);

		letterValue.put('D',3);

		letterValue.put('C',4);

		letterValue.put('Q',5);

		letterValue.put('E',6);

		letterValue.put('G',7);

		letterValue.put('H',8);

		letterValue.put('I',9);

		letterValue.put('L',10);

		letterValue.put('K',11);

		letterValue.put('M',12);

		letterValue.put('F',13);

		letterValue.put('P',14);

		letterValue.put('S',15);

		letterValue.put('T',16);

		letterValue.put('W',17);

		letterValue.put('Y',18);

		letterValue.put('V',19);

		letterValue.put('B',20);

		letterValue.put('Z',21);

		letterValue.put('X',22);

		letterValue.put('*',23);


		// A:0 R:1 N:2 D:3 ...

		/*$ cat BLOSUM62
   A  R  N  D  C  Q  E  G  H  I  L  K  M  F  P  S  T  W  Y  V  B  Z  X  *
A  4 -1 -2 -2  0 -1 -1  0 -2 -1 -1 -1 -1 -2 -1  1  0 -3 -2  0 -2 -1  0 -4
R -1  5  0 -2 -3  1  0 -2  0 -3 -2  2 -1 -3 -2 -1 -1 -3 -2 -3 -1  0 -1 -4
N -2  0  6  1 -3  0  0  0  1 -3 -3  0 -2 -3 -2  1  0 -4 -2 -3  3  0 -1 -4
D -2 -2  1  6 -3  0  2 -1 -1 -3 -4 -1 -3 -3 -1  0 -1 -4 -3 -3  4  1 -1 -4
C  0 -3 -3 -3  9 -3 -4 -3 -3 -1 -1 -3 -1 -2 -3 -1 -1 -2 -2 -1 -3 -3 -2 -4
Q -1  1  0  0 -3  5  2 -2  0 -3 -2  1  0 -3 -1  0 -1 -2 -1 -2  0  3 -1 -4
E -1  0  0  2 -4  2  5 -2  0 -3 -3  1 -2 -3 -1  0 -1 -3 -2 -2  1  4 -1 -4
G  0 -2  0 -1 -3 -2 -2  6 -2 -4 -4 -2 -3 -3 -2  0 -2 -2 -3 -3 -1 -2 -1 -4
H -2  0  1 -1 -3  0  0 -2  8 -3 -3 -1 -2 -1 -2 -1 -2 -2  2 -3  0  0 -1 -4
I -1 -3 -3 -3 -1 -3 -3 -4 -3  4  2 -3  1  0 -3 -2 -1 -3 -1  3 -3 -3 -1 -4
L -1 -2 -3 -4 -1 -2 -3 -4 -3  2  4 -2  2  0 -3 -2 -1 -2 -1  1 -4 -3 -1 -4
K -1  2  0 -1 -3  1  1 -2 -1 -3 -2  5 -1 -3 -1  0 -1 -3 -2 -2  0  1 -1 -4
M -1 -1 -2 -3 -1  0 -2 -3 -2  1  2 -1  5  0 -2 -1 -1 -1 -1  1 -3 -1 -1 -4
F -2 -3 -3 -3 -2 -3 -3 -3 -1  0  0 -3  0  6 -4 -2 -2  1  3 -1 -3 -3 -1 -4
P -1 -2 -2 -1 -3 -1 -1 -2 -2 -3 -3 -1 -2 -4  7 -1 -1 -4 -3 -2 -2 -1 -2 -4
S  1 -1  1  0 -1  0  0  0 -1 -2 -2  0 -1 -2 -1  4  1 -3 -2 -2  0  0  0 -4
T  0 -1  0 -1 -1 -1 -1 -2 -2 -1 -1 -1 -1 -2 -1  1  5 -2 -2  0 -1 -1  0 -4
W -3 -3 -4 -4 -2 -2 -3 -2 -2 -3 -2 -3 -1  1 -4 -3 -2  11 2 -3 -4 -3 -2 -4
Y -2 -2 -2 -3 -2 -1 -2 -3  2 -1 -1 -2 -1  3 -3 -2 -2  2  7 -1 -3 -2 -1 -4
V  0 -3 -3 -3 -1 -2 -2 -3 -3  3  1 -2  1 -1 -2 -2  0 -3 -1  4 -3 -2 -1 -4
B -2 -1  3  4 -3  0  1 -1  0 -3 -4  0 -3 -3 -2  0 -1 -4 -3 -3  4  1 -1 -4
Z -1  0  0  1 -3  3  4 -2  0 -3 -3  1 -1 -3 -1  0 -1 -3 -2 -2  1  4 -1 -4
X  0 -1 -1 -1 -2 -1 -1 -1 -1 -1 -1 -1 -1 -1 -2  0  0 -2 -1 -1 -1 -1 -1 -4
* -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4  1
*/


     val blosum = new Array_2[Long](24, 24) { 
  4, -1, -2, -2,  0, -1, -1,  0, -2, -1 ,-1 ,-1 ,-1 ,-2 ,-1 , 1 , 0 ,-3 ,-2 , 0 ,-2 ,-1,  0, -4,
 -1,  5,  0, -2, -3,  1,  0, -2,  0, -3, -2,  2, -1, -3, -2, -1, -1, -3, -2, -3, -1 , 0 ,-1, -4,
 -2,  0,  6,  1, -3,  0,  0,  0,  1, -3, -3,  0, -2, -3, -2,  1,  0, -4, -2, -3,  3,  0, -1, -4,
 -2, -2,  1,  6, -3,  0,  2, -1, -1, -3, -4, -1, -3, -3, -1,  0, -1, -4, -3, -3,  4,  1, -1, -4,
  0, -3, -3, -3,  9, -3, -4, -3, -3, -1, -1, -3, -1, -2, -3, -1, -1, -2, -2, -1, -3, -3, -2, -4,
 -1, 1,  0,  0, -3,  5,  2, -2,  0, -3, -2,  1,  0, -3,  -1,  0, -1, -2, -1, -2,  0,  3, -1, -4,
 -1,  0,  0,  2, -4,  2,  5, -2,  0, -3, -3,  1, -2, -3, -1,  0, -1, -3, -2, -2,  1,  4, -1, -4,
  0, -2,  0, -1, -3, -2, -2,  6, -2, -4, -4, -2, -3, -3, -2,  0, -2, -2, -3, -3, -1, -2, -1, -4,
 -2,  0,  1, -1, -3,  0,  0, -2,  8, -3, -3, -1, -2, -1, -2, -1, -2, -2,  2, -3,  0,  0, -1, -4,
 -1, -3, -3, -3, -1, -3, -3, -4, -3,  4,  2, -3,  1,  0, -3, -2, -1, -3, -1,  3, -3, -3, -1, -4,
 -1, -2, -3, -4, -1, -2, -3, -4, -3,  2,  4, -2,  2,  0, -3, -2, -1, -2, -1,  1, -4, -3, -1, -4,
 -1, 2 , 0, -1, -3,  1,  1,  -2, -1, -3, -2,  5, -1, -3, -1,  0, -1, -3, -2, -2,  0,  1, -1, -4,
 -1, -1, -2, -3, -1,  0, -2, -3, -2,  1,  2, -1,  5,  0, -2, -1, -1, -1, -1,  1, -3, -1, -1, -4,
 -2, -3, -3, -3, -2, -3, -3, -3, -1,  0,  0, -3,  0,  6, -4, -2, -2,  1,  3, -1, -3, -3, -1, -4,
 -1, -2, -2, -1, -3, -1, -1, -2, -2, -3, -3, -1, -2, -4,  7, -1, -1, -4, -3, -2, -2, -1, -2, -4,
  1, -1,  1,  0, -1,  0,  0,  0, -1, -2, -2,  0, -1, -2, -1,  4,  1, -3, -2, -2,  0,  0,  0, -4,
  0, -1,  0, -1, -1, -1, -1, -2, -2, -1, -1, -1, -1, -2, -1,  1,  5, -2, -2,  0, -1, -1,  0, -4,
 -3, -3, -4, -4, -2, -2, -3, -2, -2, -3, -2, -3, -1,  1, -4, -3, -2,  11, 2, -3, -4, -3, -2, -4,
 -2, -2, -2, -3, -2, -1, -2, -3,  2, -1, -1, -2, -1,  3, -3, -2, -2,  2, 7, -1, -3, -2, -1, -4,
  0, -3, -3, -3, -1, -2, -2, -3, -3,  3,  1, -2,  1, -1, -2, -2,  0, -3, -1,  4, -3, -2, -1, -4,
 -2, -1,  3,  4, -3,  0,  1, -1,  0, -3, -4,  0, -3, -3, -2,  0, -1, -4, -3, -3,  4,  1, -1, -4,
 -1,  0,  0,  1, -3,  3,  4, -2,  0, -3, -3,  1, -1, -3, -1,  0, -1, -3, -2, -2,  1,  4, -1, -4,
  0, -1, -1, -1, -2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -2,  0,  0, -2, -1, -1, -1, -1, -1, -4,
 -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4,  1};

       /*blosum(0,0) = 4; blosum(0,1) = -1; blosum(0,2) = -2; blosum(0,3) = -2;
       blosum(0,4) = 0; blosum(0,5) = -1; blosum(0,6) = -1; blosum(0,7) = 0;
       blosum(0,8) = -2; blosum(0,9) = 0; blosum(0,10) = 0; blosum(0,11) = 0;
       blosum(0,12) = 4; blosum(0,13) = 0; blosum(0,14) = 0; blosum(0,15) = 0;
       blosum(0,16) = 4; blosum(0,17) = 0; blosum(0,18) = 0; blosum(0,19) = 0;
       blosum(0,20) = 4; blosum(0,21) = 0; blosum(0,22) = 0; blosum(0,23) = 0;*/
		
	return blosum;



	};

	//=================================================================================================

	

	

	//=================================================================================================

	//penalty function;

	public static def penalty(a:Long,b:Long,l:Long): Long{

		return a+b*(l-1);

	}

	//=================================================================================================

	

	

	//=================================================================================================

	// parse the input files;

   public static def parseInput(inputPath: String): Rail[Char]{

   try {

   val input = new File(inputPath);

   var fullLength:Long = 0;

   val charList = new ArrayList[Char]();

   var count:Long = 0;

   	for (line in input.lines()) {

   		if(count!=0){

   			fullLength+=line.length();

   		val output:Rail[Char] = line.chars();

   		for (ch in output){

   			charList.add(ch);

   		}

   		}

   		count++;

   	}

   	val ret:Rail[Char] = charList.toRail();

   	return ret;



   }

   catch (e: IOException) { 

	   Console.OUT.println(e);  

   	}

   return null;

   };

   //=================================================================================================



   

   

   

   

   //=================================================================================================

   // calculate the score matrix;

   public static def calculate(scoreMatrix: Array_2[Long], input1:Rail[Char],input2:Rail[Char],blosum:Array_2[Long]): Array_2[Long]{

    
   for (var r:Long = 1;r<=input1.size;r++){
	   for(var c:Long = 1; c<=input2.size; c++){
		   var maxScore:Long = 0;
		   val maxR:Long = maxRowScore(r,c,scoreMatrix);
		   if(maxR>maxScore){
			   maxScore = maxR;
		   }
		   val maxC:Long = maxColumnScore(r,c,scoreMatrix);
		   if(maxC>maxScore){
			   maxScore = maxC;
		   }
		   val diagnalScore:Long = scoreMatrix(r-1,c-1)+blosum(letterValue.get(input1(r-1)),letterValue.get(input2(c-1)));
		   if(diagnalScore>maxScore){
			   maxScore = diagnalScore;
		   }
		   scoreMatrix(r,c) = maxScore;
	   }   
	  
   }
   return scoreMatrix;
   }

   //=================================================================================================

   
   //=================================================================================================

   // find the max value in Row;

   public static def maxRowScore(row: Long, column:Long, scoreMatrix:Array_2[Long]): Long{
	   var maxScore:Long = 0;
	   for (var c:Long = 0;c<column;c++){
		   var tempScore:Long = scoreMatrix(row,c)-penalty(A,B,column-c);
		   if (tempScore>maxScore){
			   maxScore = tempScore;
		   }
	   }
	   
	   return maxScore;
	   
   }

   //=================================================================================================

   //=================================================================================================

   
   

   //=================================================================================================

   // find the max value in Column;

   public static def maxColumnScore(row: Long, column:Long, scoreMatrix:Array_2[Long]): Long{
	   var maxScore:Long = 0;
	   for (var r:Long = 0;r<row;r++){
		   var tempScore:Long = scoreMatrix(r,column)-penalty(A,B,row-r);
		   if (tempScore>maxScore){
			   maxScore = tempScore;
		   }
	   }
   
	   
	   return maxScore;
	   
   }

   //=================================================================================================
   
   

   //=================================================================================================

   // Find the max score value and its position







   //=================================================================================================

   

   

   

   //=================================================================================================

   // traceback;

   public static def traceback(scoreMatrix: Array_2[Long], input1:Rail[Char], input2:Rail[Char], blosum:Array_2[Long]): Rail[Rail[Long]] {
	   var bestScore:Long = 0;
	   val bestCoordinate:Rail[Long] = new Rail[Long](2);
	   
	   val resultList = new ArrayList[Rail[Long]]();
	   //bestCoordinate(0) is row, bestCoordinate(1) is column;
	   for (var r:Long = 1;r<=input1.size;r++){
		   for(var c:Long = 1; c<=input2.size; c++){
			   if(scoreMatrix(r,c) > bestScore){
				   bestScore = scoreMatrix(r,c);
				   bestCoordinate(0) = r;
				   bestCoordinate(1) = c;
			   }
		   }
	   }	
	   var curRow:Long = bestCoordinate(0);
	   var curColumn:Long = bestCoordinate(1);
	   val curCoordinate:Rail[Long] = new Rail[Long](2);
	   curCoordinate(0) = curRow;
	   curCoordinate(1) = curColumn;
	   // start to find the route;

	   while(true){
		   if (curRow!=0 && curColumn!=0){
			   val midResult = new Rail[Long](2);
			   midResult(0) = curRow;
			   midResult(1) = curColumn;
			   resultList.add(midResult);
			   var tempColumn:Long = curColumn-1;
			   var tempRow:Long = curRow;
			   var BestScore:Long = scoreMatrix(curRow,curColumn-1);
			   // val upScore:Long = scoreMatrix(curRow,curColumn-1);
			   val leftScore:Long = scoreMatrix(curRow-1,curColumn);
			   if(leftScore>BestScore){
				   BestScore = leftScore;
				   tempRow = curRow-1;
				   tempColumn = curColumn;
			   }
			   val leftupScore:Long = scoreMatrix(curRow-1,curColumn-1);
			   if(leftupScore>BestScore){
				   BestScore = leftupScore;
				   tempRow = curRow-1;
				   tempColumn = curColumn-1;
			   }
			   curRow = tempRow;
			   curColumn = tempColumn;
			   //check if the best score is 0;
			   if(bestScore == 0){
				   midResult(0) = curRow;
				   midResult(1) = curColumn;
				   if(curRow!=0 && curColumn!=0){
					   resultList.add(midResult);
				   }
				   break;
			   }
		   }
		   else{
			   break;
		   }
	   }
	   
	   
	   val finalResult:Rail[Rail[Long]] = new Rail[Rail[Long]](resultList.size());
	   for(var i:Long = resultList.size()-1; i>=0;i--){
		   finalResult(resultList.size()-1-i) = resultList.get(i);
	   }
	   
	   printResult(finalResult,input1,input2,bestScore);
	   
	   return finalResult;
          

   }

   //=================================================================================================

   

   

   

   

   //=================================================================================================

   // Print Result

   public static def printResult(seq:Rail[Rail[Long]],input1:Rail[Char],input2:Rail[Char], maxScore:Long): void{
	   val totalLength:Float = seq.size;
	   var Gaps:Float = 0;
	   var identity:Float = 0;
	   val output1 = new ArrayList[Char]();
	   val output2 = new ArrayList[Char]();
	   var lastRow:Long = seq(0)(0);
	   var lastColumn:Long = seq(0)(1);
	   
	   // add the start point to the list;
	   output1.add(input1(lastRow-1));
	   output2.add(input2(lastColumn-1));
	   if (input1(lastRow-1).equals(input2(lastColumn-1))){
		   identity++;
	   }
	   
	   for(var i:Long = 1; i<totalLength;i++){
		   val coor:Rail[Long] = seq(i);
		   val row:Long = coor(0);
		   val column:Long = coor(1);
		   if((row - lastRow) == 0){
			   output1.add('-');
			   output2.add(input2(column-1));
			   Gaps++;
		   }
		   else if((column - lastColumn) == 0){
			   output2.add('-');
			   output1.add(input1(row-1));
			   Gaps++;
		   }
		   else if((row - lastRow) == 1 && (column - lastColumn) ==1){
			   output1.add(input1(row-1));
			   output2.add(input2(column-1));
		   }
		   lastRow = row;
		   lastColumn = column;
		   if (input1(lastRow-1).equals(input2(lastColumn-1))){
			   identity++;
		   }
	   }
	   
	   
	   
	   Console.OUT.println("Identity: "+identity+"/"+ totalLength + " (" + (identity/totalLength)*100 + "%)"); 
	   Console.OUT.println("Gaps: "+Gaps+"/"+ totalLength + " (" + (Gaps/totalLength)*100 + "%)"); 
	   Console.OUT.println("Score: "+maxScore); 
	   Console.OUT.print("1: "); 
	   for(var i:Long = 0; i<output1.size();i++){
		   Console.OUT.print(output1.get(i)); 
	   }
	   Console.OUT.print("\n");
	   
	   Console.OUT.print("2: "); 
	   for(var i:Long = 0; i<output2.size();i++){
		   Console.OUT.print(output2.get(i)); 
	   }
	   Console.OUT.print("\n");

   }

   //=================================================================================================

   

   

   

   

   

   //=================================================================================================

   //main function

    public static def main(args: Rail[String]) {
    	val date1 = new Date();
    	
    	val starttime = date1.getTime();
    	
    	val charList1:Rail[Char] = parseInput("./AF043946.1");

    	val charList2:Rail[Char] = parseInput("./AF043947.1");

    	Console.OUT.println("first input: "+ charList1.toString());  

    	Console.OUT.println("second input: "+charList2.toString()); 

    	val blosum = buildBlosum("not inplemented yet");

    	Console.OUT.println("blosum: "+blosum.toString()); 

    	Console.OUT.println("blosum[1,1]: "+blosum(1,1)); //用这种方法来调用blosum的分数，例如[A,A]的分数就是blosum(0,0)

    	

    	val n:Long = charList1.size + 1; // the row length of score matrix;

    	val m:Long = charList2.size + 1; // the column length of score matrix;

    	Console.OUT.println("n: "+n); 

    	Console.OUT.println("m: "+m); 

    	

    	

    	val scoreMatrix = new Array_2[Long](n, m, 0); // build a n x m matrix and initialize everything to 0, no need to initialize the first row and column;

    	calculate(scoreMatrix,charList1,charList2,blosum); // calculate the score matrix

    	val sequence:Rail[Rail[Long]] = traceback(scoreMatrix,charList1,charList2,blosum); // trace back and give out the sequence;
    	// for (var i:Long = 0;i<sequence.size;i++){
    	// 	Console.OUT.println(sequence(i)); 
    	// }
    	//暂时查看结果的坐标

    	//printResult(sequence); // print the result;
    	val date2 = new Date();
    	val endtime = date2.getTime();
    	
    	Console.OUT.println("Running Time: "+(endtime-starttime) +"  milliseconds."); 
    	

    	

    	

    }

}
