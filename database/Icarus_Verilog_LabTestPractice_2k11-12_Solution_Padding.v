// Desing Module for Padding

module Padd(paddedText,plainText);
    output reg [255:0] paddedText;
    input [247:0] plainText;
    

    initial 
       begin
         
         // $display("before padding");
         // $display("at time %0d padded text = %d\n",$time,paddedText);
         
         #5 paddedText[247:0] = plainText;
            paddedText[255:248] = 8'd248;
         
         $display("after padding");
         $display("at time %0d padded text = %d\n",$time, paddedText);
         
      end
      
endmodule
