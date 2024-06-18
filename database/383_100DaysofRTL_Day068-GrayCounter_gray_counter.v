// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module gray_counter(
    input clk,rst,
    output reg [3:0] gray_count
    );

    reg [3:0] bin_count;
   
    always@(posedge clk)
    begin 
        if(rst)
            begin
                gray_count=4'b0000;
                bin_count=4'b0000;
            end
        else
            begin
                bin_count = bin_count + 1;
                gray_count = {bin_count[3],bin_count[3]^bin_count[2],bin_count[2]^bin_count[1],bin_count[1]^bin_count[0]};
            end
    end   
endmodule
