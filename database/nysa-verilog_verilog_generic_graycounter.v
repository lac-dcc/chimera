// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//==========================================
// Function : Code Gray counter.
// Coder    : Alex Claros F.
// Date     : 15/May/2005.
//=======================================

`timescale 1ns/1ps

module GrayCounter
   #(parameter   COUNTER_WIDTH = 4)
   
    (output reg  [COUNTER_WIDTH-1:0]    gray_count_out,  //'Gray' code count output.
    
     input wire                         en,  //Count enable.
     input wire                         rst,   //Count reset.
    
     input wire                         clk);

    /////////Internal connections & variables///////
    reg    [COUNTER_WIDTH-1:0]         binary_count;

    /////////Code///////////////////////
    
    always @ (posedge clk)
        if (rst) begin
            binary_count   <= {COUNTER_WIDTH{1'b 0}} + 1;  //Gray count begins @ '1' with
            gray_count_out <= {COUNTER_WIDTH{1'b 0}};      // first 'en'.
        end
        else if (en) begin
            binary_count   <= binary_count + 1;
            gray_count_out <= {binary_count[COUNTER_WIDTH-1],
                              binary_count[COUNTER_WIDTH-2:0] ^ binary_count[COUNTER_WIDTH-1:1]};
        end
    
endmodule
