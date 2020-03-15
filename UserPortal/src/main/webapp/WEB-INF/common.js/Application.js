function getPages(action){
	

	 $.ajax({
			url:action,
			type:'POST',
			dataType:'html',
			data:'cardName='+cardName+'&cardNum='+cardNumber+'&cardDate='+cardDate+'&toDate='+toDate,
			
			success:function(data){
				
				console.log(data);
				var autData=data;
				console.log("autData  "+autData);
				var trHTML='';
				if(autData == ''){
					document.getElementById('warning-pop').style.display='block';
				}else{	
					$('.errMsg').fadeOut(2000);
					document.getElementById('listOfEmiDetails').style.display='block';
					for(var i=0; i<autData.length; i++){
						 trHTML += 
			                '<tr><td>' + autData[i].cardName+ 
			                '</td><td>' + autData[i].cardNum  + 
			                '</td><td>' + autData[i].creditExpAm + 
			                '</td><td>' + autData[i].creditExpMonth + 
			                '</td><td>' + autData[i].comment + 
			                '</td><td>' + autData[i].cardType + 
			                '</td><td>' + autData[i].userName + 
			                '</td></tr>';  
						
						$('#tBody').append(trHTML);
					}
					
				}
			},
			error: function(result){
				
				document.getElementById("cardNa").innerHTML ='';
				document.getElementById("cardNu").innerHTML ='';
				document.getElementById("expense").innerHTML ='';
				document.getElementById("expenseYr").innerHTML ='';
				document.getElementById("expenseDesc").innerHTML ='';
				document.getElementById("typeCard").innerHTML ='';
				document.getElementById("userCard").innerHTML ='';
				document.getElementById('warning-pop').style.display='block';
				
			}
		}); 
}