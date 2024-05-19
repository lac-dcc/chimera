// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module binary2bcd(
    input [7:0]data,
    output reg [3:0] bit0,bit1,bit2,
    output reg[11:0] BCD    
    );
    integer n;

    always@(data)
    begin
        bit0=0; bit1=0; bit2=0;
        for(n=0; n<8; n=n+1)
        begin
            if(bit0>4) bit0 = bit0+3;
            if(bit1>4) bit1 = bit1+3;
            if(bit2>4) bit2 = bit2+3;
            {bit2,bit1,bit0} = {bit2,bit1,bit0,data[7-n]};
        end
        BCD= {bit2, bit1, bit0};
    end
endmodule
