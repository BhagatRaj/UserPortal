package com.javainterviewpoint;

public class PairsOfSumProgram {
	
	public static void printPairs(int [] arr, int sum) {
		
		for(int i=0; i<arr.length; i++) {
			
			int firstArr=arr[i];
			for(int j=i+1; j<arr.length; j++) {
				int secondArr=arr[j];
				
				if((firstArr+secondArr) == sum) {
					System.out.printf("(%d, %d) %n", firstArr, secondArr);
				}
			}
		}
		
	}
	
	  public static void main(String[] args) {
		int [] number= {2,4,3,5,7,8,9};
		int sum=7;
		printPairs(number, sum);
		  
	}

}
