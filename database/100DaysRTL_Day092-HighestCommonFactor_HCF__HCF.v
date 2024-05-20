// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module HCF #(parameter N= 8)
    ( input [N-1:0] in1,in2,
      output [N-1:0] HCF );

    reg [N-1:0] i1,i2;

    always@(*)
        begin
            i1=in1;
            i2=in2;
            while(i1 != i2)
              begin
                if(i1 > i2) i1= i1 - i2;
                else i2= i2 - i1;
              end
        end
    
    assign HCF = i1;
endmodule
