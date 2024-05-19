// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1ns / 1ps
`include "iob_lib.vh"


module iob_sipo_reg_are
  #(
    parameter DATA_W = 32
    )
   (

    input               clk,
    input               rst,
    input               en,

    //parallel input
    input               s_in,

    //serial output
    output [DATA_W-1:0] p_out
    );

   reg [DATA_W-1:0]  data_reg;
   
   always @(posedge clk, posedge rst)
     if(rst)
       data_reg <= 1'b0;
     else if (en)
       data_reg <= (data_reg<<1)|s_in;

   assign p_out = data_reg;
   
endmodule
