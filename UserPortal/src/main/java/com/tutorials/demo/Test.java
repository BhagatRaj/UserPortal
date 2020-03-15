package com.tutorials.demo;

import java.util.ArrayList;
import java.util.List;

public class Test {

	public static void main(String[] args) {
		String tenLi=com.tutorials.Utils.Constants.tenureData;
		String [] arrOftenList=tenLi.split(",");
		
		List arrlst=new ArrayList<>();
		for(int i=0; i<arrOftenList.length;i++) {
			//arrlst=new ArrayList<>();
			
			arrlst.add(arrOftenList[i]);
			//System.out.println(arrOftenList[i]);
		}
		
		for(int j=0;j<arrlst.size(); j++) {
			
			System.out.println("list >>"+arrlst.get(j));
		}

	}

}
