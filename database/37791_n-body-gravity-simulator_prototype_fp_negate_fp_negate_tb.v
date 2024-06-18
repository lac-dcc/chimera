// This program was cloned from: https://github.com/aniketuppin/n-body-gravity-simulator
// License: Apache License 2.0

//--------------------------------------------------------------------
//
// Author:      Omkar Girish Kamath
// Module:      fp_negate_tb
// Date:        Oct 21st, 2023
// Description: Testbench module for fp_negate main module
//--------------------------------------------------------------------
module fp_negate_tb;

   reg [26:0] in;
   wire [26:0] neg_out;

   fp_negate dut (
                  .in(in),
                  .neg_out(neg_out)
                  );
   
   initial
     begin
        $dumpvars;
        in <= 27'b10000_00000_00000_00000_00000_00;
        #10;
        in <= 27'b00110_00000_10010_01100_01111_00;
        #10;
        in <= 27'b00000_00000_00000_00000_00000_00;
        #10;
        in <= 27'b10011_00000_00000_00000_00000_00;
        #10;
        in <= 27'b00000_00000_11100_00000_00000_00;
        #100;
        
        $finish;
     end
endmodule
