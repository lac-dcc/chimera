// This program was cloned from: https://github.com/huangxc6/Software_Hardware_Co-Design_24Spring
// License: MIT License

//Function: dec 2 to 4
//Author: Zhang Lei

module decoder
#(parameter CODEWID = 2, OUTWID=4)
(
   input      [CODEWID-1:0] W,
   input                    En,
   output reg [OUTWID-1:0]  Y
);
                    
always @ (*)
 begin
  if(En == 1)    
     case(W)     
       2'b00:  Y = 'b1000;
       2'b01:  Y = 'b0100;
       2'b10:  Y = 'b0010;
       2'b11:  Y = 'b0001;                
     endcase
  else
     Y = 'b0000;    
 end
 
endmodule
