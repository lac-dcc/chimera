// This program was cloned from: https://github.com/buncram/cram-soc
// License: CERN Open Hardware Licence Version 2 - Weakly Reciprocal

// SPDX-FileCopyrightText: 2022 Lawrie Griffiths
// SPDX-License-Identifier: BSD-2-Clause

// `default_nettype none
module pio_decoder (
  input [15:0] instr,
  input [2:0]  sideset_bits,  // inclusive of the enable bit
  input        sideset_enable_bit,
  output [2:0] op,
  output [2:0] op1,
  output [4:0] op2,
  output reg [4:0] delay,
  output [4:0] side_set,
  output       sideset_enabled
);

  wire [2:0] delay_bits = 5 - ((sideset_bits > 5) ? 5 : sideset_bits);

  assign op = instr[15:13];
  assign op1 = instr[7:5];
  assign op2 = instr[4:0];
  assign side_set = (instr[12:8] & (sideset_enable_bit ? 5'hF : 5'h1F)) >> delay_bits;
  assign sideset_enabled = sideset_enable_bit ? instr[12] : 1;

  always @* begin
    case(delay_bits)
      3'b101: delay = instr[12:8];
      3'b100: delay = {1'b0, instr[11:8]};
      3'b011: delay = {2'b0, instr[10:8]};
      3'b010: delay = {3'b0, instr[9:8]};
      3'b001: delay = {4'b0, instr[8]};
      default: delay = 5'b0;
    endcase
  end
endmodule

