// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1ns / 1ps
`include "iob_lib.vh"


module iob_modcnt
  #(
    parameter DATA_W = 32
    )
   (

    input                   clk,
    input                   arst,
    input                   rst,
    input                   en,

    input [DATA_W-1:0]      load_val,

    //masters interface
    input [DATA_W-1:0]      mod,

    //slave interface
    output reg [DATA_W-1:0] cnt
    );

   reg                      loaded;
   
   always @(posedge clk, posedge arst) 
      if(arst) begin
         cnt <= -1'b1;
         loaded <= 1'b0;
      end else if (rst) begin 
         cnt <= -1'b1;
         loaded <= 1'b0;
      end else if (!loaded) begin
          cnt <= load_val;
          loaded <= 1'b1;
      end else if (en)
        if (cnt == (mod-1'b1))
          cnt <= 1'b0;
        else
          cnt <= cnt + 1'b1;
   
endmodule
