// This program was cloned from: https://github.com/esda-inesc-id/pt-float
// License: MIT License

`timescale 1ns / 1ps

module iob_sticky_tb;

   parameter DATA_W = 32;
   parameter SHIFT_W = 16;

   reg [DATA_W-1:0] man;
   reg [SHIFT_W-1:0] shift;

   wire              sticky;

   iob_sticky
     #(
       .DATA_W(DATA_W),
       .SHIFT_W(SHIFT_W)
       )
   uut
     (
      .man_i    (man),
      .shift_i  (shift),
      .sticky_o (sticky)
      );

   initial begin

      $dumpfile("iob_sticky.vcd");
      $dumpvars();

      man = 0;
      shift = 0;

      #20;
      man = 'ha2e513cd;

      #20;
      shift = 5;

      #20;
      shift = 30;

      #20;
      shift = 1;

      #20;
      man = 'ha2e51300;

      #20;
      shift = 5;

      #20;
      shift = 30;

      #20;
      shift = 0;

      #20 $finish;
   end

endmodule
