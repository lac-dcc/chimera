// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module up_down_counter
  # (parameter N = 4)
  
  ( input clk, reset, upordown, output reg[N-1:0] count);
 
  always @ (posedge clk )
  begin
    if (reset==1)
     count <= 0;
    
	else if(upordown==1)      //Up Mode is selected

         if (count == 2*N -1) 
            count <= 0;
         
	   else
            count<=count+1;     //increment counter
		
	else                      //Down Mode is selected

	     if(count==0)
	       count<= 2*N -1;

	     else
	       count<=count-1;    //Decrement the counter

  end
endmodule
