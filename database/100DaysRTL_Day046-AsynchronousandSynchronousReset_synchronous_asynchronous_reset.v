// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module synchronous_asynchronous_reset(
    input clk,rst,in,
    output reg out_async,out_sync
    );

    
////////// SYNCHRONOUS RESET //////////
    always@(posedge clk)  
    begin
        if(rst) out_sync<= 1'b0;
        else out_sync <= in;
    end


////////// ASYNCHRONOUS RESET /////////
    always@(posedge clk, posedge rst)
    begin
        if(rst) out_async<= 1'b0;
        else out_async <= in;
    end  
    
endmodule

