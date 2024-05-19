// This program was cloned from: https://github.com/ahegazy/aes
// License: MIT License

/*
*
*	Creator : Ahmad Adel <github.com/ahmadadel8>
*						Dina  Elsokary <github.com/dinaelsokary>
*
*	Date: September 2018
* 
* Description: Inverse shiftrows step in AES encryption/Decryption.
* Language: Verilog
*
*/
module Inv_Shift_Rows 
 #(parameter word_size =8 ,array_size =16)(
  input en,clk,rst,
  input  wire [0:word_size*array_size-1] Shifted_Data,
	output reg  [0:word_size*array_size-1] Inv_Shifted_Data );
  
  reg [word_size-1:0] shifted_data [0:3] [0:3];
  reg [word_size-1:0] inv_shifted_data[0:3] [0:3];
 
 integer i,j,ij;	 
  
always @(posedge clk)
  begin
    if (rst)
	       Inv_Shifted_Data = 128'b0;
  else if (en) begin
    for ( i=0; i<=3; i=i+1)
	   for ( j=0; j<=3; j=j+1)
	      begin 
	        ij =((4*i)+j);
		      shifted_data[j][i]=Shifted_Data[ij*word_size  +:  word_size];
		    end	
		    
		 for ( i=0; i<=3; i=i+1)
	    for ( j=0; j<=3; j=j+1)
	     begin
	      if (i ==0)
	         inv_shifted_data[i][j] = shifted_data[i][j];
	      else if (i ==1)
	        begin
	         inv_shifted_data[1][0] = shifted_data[1][3];
           inv_shifted_data[1][1] = shifted_data[1][0];
           inv_shifted_data[1][2] = shifted_data[1][1];
           inv_shifted_data[1][3] = shifted_data[1][2];
          end
         else if (i ==2)
           begin
	          inv_shifted_data[2][0] = shifted_data[2][2];
	          inv_shifted_data[2][1] = shifted_data[2][3];
            inv_shifted_data[2][2] = shifted_data[2][0];
            inv_shifted_data[2][3] = shifted_data[2][1];
           end
          else if (i ==3) 
           begin
		        inv_shifted_data[3][0] = shifted_data[3][1];
            inv_shifted_data[3][1] = shifted_data[3][2];
            inv_shifted_data[3][2] = shifted_data[3][3];
            inv_shifted_data[3][3] = shifted_data[3][0];
           end
        end 
 
    for ( i=0; i<=3; i=i+1)
	    for ( j=0; j<=3; j=j+1)
	      begin 
	        ij =((4*i)+j);
	       	Inv_Shifted_Data[ij*word_size  +:  word_size]=inv_shifted_data[j][i];
		    end	
		    end
	 end
		   
  
endmodule
