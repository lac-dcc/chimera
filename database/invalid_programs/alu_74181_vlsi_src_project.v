// This program was cloned from: https://github.com/sidirima/alu_74181_vlsi
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_74181 (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
    wire [3:0] A, B, S;
    wire CNb, M;
    wire [3:0] F;
    wire X,Y,CN4b,AEB;

    //Assigning the input A and B pins
    assign uio_out = 8'b0;
    assign {A,B} = ui_in;
    assign {S,CNb,M} = uio_out; // Setting bidirectional bits as inputs
    assign uio_out[1:0] = 2'b0;
    assign uio_oe = 8'b0; // Output enable = 0

    
    assign uo_out = {F,AEB,X,Y,CN4b}; // Example: ou_out is the sum of ui_in and uio_in

    wire [3:0] E, D, C, Bb; // Assign temporary modules
    Emodule Emod1 (A, B, S, E);
    Dmodule Dmod2 (A, B, S, D);
    CLAmodule CLAmod3(E, D, CNb, C, X, Y, CN4b);
    Summodule Summod4(E, D, C, M, F, AEB);

endmodule

module Emodule (A, B, S, E);

  input [3:0] A, B, S;
  output [3:0] E;
  wire [3:0]  ABS3, ABbS2;

  assign ABS3 = A&B&{4{S[3]}};
  assign ABbS2 = A&~B&{4{S[2]}};
  assign E = ~(ABS3|ABbS2);

endmodule /* Emodule */

/*************************************************************************/

module Dmodule (A, B, S, D);

  input [3:0] A, B, S;
  output [3:0] D;
  wire [3:0]  BbS1, BS0;  

  assign BbS1 = ~B&{4{S[1]}};
  assign BS0 = B&{4{S[0]}};
  assign D = ~(BbS1|BS0|A);

endmodule /* Dmodule */

/*************************************************************************/

module CLAmodule(Gb, Pb, CNb, C, X, Y, CN4b);

  input [3:0] Gb, Pb;
  input CNb; 
  output [3:0] C;
  output X, Y, CN4b;

  assign C[0] = ~CNb;
  assign C[1] = ~(Pb[0]|(CNb&Gb[0]));
  assign C[2] = ~(Pb[1]|(Pb[0]&Gb[1])|(CNb&Gb[0]&Gb[1]));
  assign C[3] = ~(Pb[2]|(Pb[1]&Gb[2])|(Pb[0]&Gb[1]&Gb[2])|(CNb&Gb[0]&Gb[1]&Gb[2]));
  assign X = ~&Gb;
  assign Y = ~(Pb[3]|(Pb[2]&Gb[3])|(Pb[1]&Gb[2]&Gb[3])|(Pb[0]&Gb[1]&Gb[2]&Gb[3]));
  assign CN4b = ~(Y&~(&Gb&CNb));

endmodule /* CLAmodule */

/*************************************************************************/

module Summodule(E, D, C, M, F, AEB);

  input [3:0] E, D, C;
  input M; 
  output [3:0] F;
  output AEB;

  assign F = (E ^ D) ^ (C|{4{M}});
  assign AEB = &F;

endmodule /* Summodule */



    
