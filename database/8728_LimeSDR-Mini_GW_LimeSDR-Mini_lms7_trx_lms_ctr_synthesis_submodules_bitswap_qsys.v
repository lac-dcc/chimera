// This program was cloned from: https://github.com/myriadrf/LimeSDR-Mini_GW
// License: Apache License 2.0

// (C) 2001-2016 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


//Legal Notice: (C)2010 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module bitswap_qsys (
                      // inputs:
                       dataa,
                       datab,

                      // outputs:
                       result
                    )
;

  output  [ 31: 0] result;
  input   [ 31: 0] dataa;
  input   [ 31: 0] datab;

  wire    [ 31: 0] result;
  //s1, which is an e_custom_instruction_slave
  assign result[31] = dataa[0];
  assign result[30] = dataa[1];
  assign result[29] = dataa[2];
  assign result[28] = dataa[3];
  assign result[27] = dataa[4];
  assign result[26] = dataa[5];
  assign result[25] = dataa[6];
  assign result[24] = dataa[7];
  assign result[23] = dataa[8];
  assign result[22] = dataa[9];
  assign result[21] = dataa[10];
  assign result[20] = dataa[11];
  assign result[19] = dataa[12];
  assign result[18] = dataa[13];
  assign result[17] = dataa[14];
  assign result[16] = dataa[15];
  assign result[15] = dataa[16];
  assign result[14] = dataa[17];
  assign result[13] = dataa[18];
  assign result[12] = dataa[19];
  assign result[11] = dataa[20];
  assign result[10] = dataa[21];
  assign result[9] = dataa[22];
  assign result[8] = dataa[23];
  assign result[7] = dataa[24];
  assign result[6] = dataa[25];
  assign result[5] = dataa[26];
  assign result[4] = dataa[27];
  assign result[3] = dataa[28];
  assign result[2] = dataa[29];
  assign result[1] = dataa[30];
  assign result[0] = dataa[31];

endmodule

