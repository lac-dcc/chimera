// This program was cloned from: https://github.com/lnis-uofu/LSOracle
// License: MIT License

// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: bw_r_rf16x160.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
//
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
//
// The above named program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
//
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
//
// ========== Copyright Header End ============================================
 ////////////////////////////////////////////////////////////////////////
// 16 X 160 R1 W1 RF macro
// REad/Write ports can be accessed in PH1 only.
////////////////////////////////////////////////////////////////////////









//PITON_PROTO enables all FPGA related modifications





























































































































































































































































































































































































module bw_r_rf16x160(/*AUTOARG*/
   // Outputs
   dout, so_w, so_r,
   // Inputs
   din, rd_adr, wr_adr, read_en, wr_en, rst_tri_en, word_wen,
   byte_wen, rd_clk, wr_clk, se, si_r, si_w, reset_l, sehold
   );

   input [159:0]  din; // data input
   input [3:0]    rd_adr;   // read addr
   input [3:0]    wr_adr;  // write addr
   input          read_en;
   input    wr_en;  //   used in conjunction with
        //  word_wen and byte_wen
   input    rst_tri_en ; // gates off writes during SCAN.
   input [3:0]    word_wen; // word enables ( if you don't use these
          // tie them to Vdd )
   input [19:0]   byte_wen; // byte enables ( if you don't use these
                            // tie them to Vdd )
   input          rd_clk;
   input          wr_clk;
   input          se, si_r, si_w ;
   input    reset_l;
   input    sehold; // hold scan in data.

   output [159:0] dout;
   output         so_w;
   output         so_r;

   // Lint
   wire _unused_ok = &{1'b0,
                      se,
                      si_r,
                      si_w,
                      1'b0};

   wire _unused_output = 1'b0;
   assign so_w = _unused_output;
   assign so_r = _unused_output;

   wire [159:0] bit_en; // write-mask
   // reg [159:0] din_d1;
   reg [3:0] rd_adr_d1;
   reg [3:0] rd_adr_d2;
   reg [3:0] wr_adr_d1;
   reg wr_en_d1;
   reg [3:0] word_wen_d1;
   reg [19:0] byte_wen_d1;
   reg read_en_d1;
   reg read_en_d2;

   // memory
   reg [159:0] inq_ary [15:0];

   // read
   assign dout = inq_ary[rd_adr_d1];

   // write
   always @ (posedge wr_clk)
   begin
      if (!reset_l)
      begin
         // assume flops
         inq_ary[00] <= 160'b0;
         inq_ary[01] <= 160'b0;
         inq_ary[02] <= 160'b0;
         inq_ary[03] <= 160'b0;
         inq_ary[04] <= 160'b0;
         inq_ary[05] <= 160'b0;
         inq_ary[06] <= 160'b0;
         inq_ary[07] <= 160'b0;
         inq_ary[08] <= 160'b0;
         inq_ary[09] <= 160'b0;
         inq_ary[10] <= 160'b0;
         inq_ary[11] <= 160'b0;
         inq_ary[12] <= 160'b0;
         inq_ary[13] <= 160'b0;
         inq_ary[14] <= 160'b0;
         inq_ary[15] <= 160'b0;
      end
      else
      begin
         if (wr_en)
         begin
            inq_ary[wr_adr] <= (din & bit_en) | (inq_ary[wr_adr] & ~bit_en);
         end
      end
   end

   // pipeline crap

   always @ (posedge rd_clk)
   begin
      // din_d1 <= din;
      rd_adr_d1 <= rd_adr;
      rd_adr_d2 <= rd_adr_d1;
      wr_adr_d1 <= wr_adr;
      wr_en_d1 <= wr_en;
      word_wen_d1 <= word_wen;
      byte_wen_d1 <= byte_wen;
      read_en_d1 <= read_en;
      read_en_d2 <= read_en_d1;
   end

   assign bit_en[0]  = word_wen[0] & byte_wen[0] & ~rst_tri_en;
   assign bit_en[1]  = word_wen[1] & byte_wen[0] & ~rst_tri_en;
   assign bit_en[2]  = word_wen[2] & byte_wen[0] & ~rst_tri_en;
   assign bit_en[3]  = word_wen[3] & byte_wen[0] & ~rst_tri_en;
   assign bit_en[4]  = word_wen[0] & byte_wen[0] & ~rst_tri_en;
   assign bit_en[5]  = word_wen[1] & byte_wen[0] & ~rst_tri_en;
   assign bit_en[6]  = word_wen[2] & byte_wen[0] & ~rst_tri_en;
   assign bit_en[7]  = word_wen[3] & byte_wen[0] & ~rst_tri_en;
   assign bit_en[8]  = word_wen[0] & byte_wen[1] & ~rst_tri_en;
   assign bit_en[9]  = word_wen[1] & byte_wen[1] & ~rst_tri_en;
   assign bit_en[10] = word_wen[2] & byte_wen[1] & ~rst_tri_en;
   assign bit_en[11] = word_wen[3] & byte_wen[1] & ~rst_tri_en;
   assign bit_en[12] = word_wen[0] & byte_wen[1] & ~rst_tri_en;
   assign bit_en[13] = word_wen[1] & byte_wen[1] & ~rst_tri_en;
   assign bit_en[14] = word_wen[2] & byte_wen[1] & ~rst_tri_en;
   assign bit_en[15] = word_wen[3] & byte_wen[1] & ~rst_tri_en;
   assign bit_en[16] = word_wen[0] & byte_wen[2] & ~rst_tri_en;
   assign bit_en[17] = word_wen[1] & byte_wen[2] & ~rst_tri_en;
   assign bit_en[18] = word_wen[2] & byte_wen[2] & ~rst_tri_en;
   assign bit_en[19] = word_wen[3] & byte_wen[2] & ~rst_tri_en;
   assign bit_en[20] = word_wen[0] & byte_wen[2] & ~rst_tri_en;
   assign bit_en[21] = word_wen[1] & byte_wen[2] & ~rst_tri_en;
   assign bit_en[22] = word_wen[2] & byte_wen[2] & ~rst_tri_en;
   assign bit_en[23] = word_wen[3] & byte_wen[2] & ~rst_tri_en;
   assign bit_en[24] = word_wen[0] & byte_wen[3] & ~rst_tri_en;
   assign bit_en[25] = word_wen[1] & byte_wen[3] & ~rst_tri_en;
   assign bit_en[26] = word_wen[2] & byte_wen[3] & ~rst_tri_en;
   assign bit_en[27] = word_wen[3] & byte_wen[3] & ~rst_tri_en;
   assign bit_en[28] = word_wen[0] & byte_wen[3] & ~rst_tri_en;
   assign bit_en[29] = word_wen[1] & byte_wen[3] & ~rst_tri_en;
   assign bit_en[30] = word_wen[2] & byte_wen[3] & ~rst_tri_en;
   assign bit_en[31] = word_wen[3] & byte_wen[3] & ~rst_tri_en;
   assign bit_en[32] = word_wen[0] & byte_wen[4] & ~rst_tri_en;
   assign bit_en[33] = word_wen[1] & byte_wen[4] & ~rst_tri_en;
   assign bit_en[34] = word_wen[2] & byte_wen[4] & ~rst_tri_en;
   assign bit_en[35] = word_wen[3] & byte_wen[4] & ~rst_tri_en;
   assign bit_en[36] = word_wen[0] & byte_wen[4] & ~rst_tri_en;
   assign bit_en[37] = word_wen[1] & byte_wen[4] & ~rst_tri_en;
   assign bit_en[38] = word_wen[2] & byte_wen[4] & ~rst_tri_en;
   assign bit_en[39] = word_wen[3] & byte_wen[4] & ~rst_tri_en;
   assign bit_en[40] = word_wen[0] & byte_wen[5] & ~rst_tri_en;
   assign bit_en[41] = word_wen[1] & byte_wen[5] & ~rst_tri_en;
   assign bit_en[42] = word_wen[2] & byte_wen[5] & ~rst_tri_en;
   assign bit_en[43] = word_wen[3] & byte_wen[5] & ~rst_tri_en;
   assign bit_en[44] = word_wen[0] & byte_wen[5] & ~rst_tri_en;
   assign bit_en[45] = word_wen[1] & byte_wen[5] & ~rst_tri_en;
   assign bit_en[46] = word_wen[2] & byte_wen[5] & ~rst_tri_en;
   assign bit_en[47] = word_wen[3] & byte_wen[5] & ~rst_tri_en;
   assign bit_en[48] = word_wen[0] & byte_wen[6] & ~rst_tri_en;
   assign bit_en[49] = word_wen[1] & byte_wen[6] & ~rst_tri_en;
   assign bit_en[50] = word_wen[2] & byte_wen[6] & ~rst_tri_en;
   assign bit_en[51] = word_wen[3] & byte_wen[6] & ~rst_tri_en;
   assign bit_en[52] = word_wen[0] & byte_wen[6] & ~rst_tri_en;
   assign bit_en[53] = word_wen[1] & byte_wen[6] & ~rst_tri_en;
   assign bit_en[54] = word_wen[2] & byte_wen[6] & ~rst_tri_en;
   assign bit_en[55] = word_wen[3] & byte_wen[6] & ~rst_tri_en;
   assign bit_en[56] = word_wen[0] & byte_wen[7] & ~rst_tri_en;
   assign bit_en[57] = word_wen[1] & byte_wen[7] & ~rst_tri_en;
   assign bit_en[58] = word_wen[2] & byte_wen[7] & ~rst_tri_en;
   assign bit_en[59] = word_wen[3] & byte_wen[7] & ~rst_tri_en;
   assign bit_en[60] = word_wen[0] & byte_wen[7] & ~rst_tri_en;
   assign bit_en[61] = word_wen[1] & byte_wen[7] & ~rst_tri_en;
   assign bit_en[62] = word_wen[2] & byte_wen[7] & ~rst_tri_en;
   assign bit_en[63] = word_wen[3] & byte_wen[7] & ~rst_tri_en;
   assign bit_en[64] = word_wen[0] & byte_wen[8] & ~rst_tri_en;
   assign bit_en[65] = word_wen[1] & byte_wen[8] & ~rst_tri_en;
   assign bit_en[66] = word_wen[2] & byte_wen[8] & ~rst_tri_en;
   assign bit_en[67] = word_wen[3] & byte_wen[8] & ~rst_tri_en;
   assign bit_en[68] = word_wen[0] & byte_wen[8] & ~rst_tri_en;
   assign bit_en[69] = word_wen[1] & byte_wen[8] & ~rst_tri_en;
   assign bit_en[70] = word_wen[2] & byte_wen[8] & ~rst_tri_en;
   assign bit_en[71] = word_wen[3] & byte_wen[8] & ~rst_tri_en;
   assign bit_en[72] = word_wen[0] & byte_wen[9] & ~rst_tri_en;
   assign bit_en[73] = word_wen[1] & byte_wen[9] & ~rst_tri_en;
   assign bit_en[74] = word_wen[2] & byte_wen[9] & ~rst_tri_en;
   assign bit_en[75] = word_wen[3] & byte_wen[9] & ~rst_tri_en;
   assign bit_en[76] = word_wen[0] & byte_wen[9] & ~rst_tri_en;
   assign bit_en[77] = word_wen[1] & byte_wen[9] & ~rst_tri_en;
   assign bit_en[78] = word_wen[2] & byte_wen[9] & ~rst_tri_en;
   assign bit_en[79] = word_wen[3] & byte_wen[9] & ~rst_tri_en;
   assign bit_en[80] = word_wen[0] & byte_wen[10] & ~rst_tri_en;
   assign bit_en[81] = word_wen[1] & byte_wen[10] & ~rst_tri_en;
   assign bit_en[82] = word_wen[2] & byte_wen[10] & ~rst_tri_en;
   assign bit_en[83] = word_wen[3] & byte_wen[10] & ~rst_tri_en;
   assign bit_en[84] = word_wen[0] & byte_wen[10] & ~rst_tri_en;
   assign bit_en[85] = word_wen[1] & byte_wen[10] & ~rst_tri_en;
   assign bit_en[86] = word_wen[2] & byte_wen[10] & ~rst_tri_en;
   assign bit_en[87] = word_wen[3] & byte_wen[10] & ~rst_tri_en;
   assign bit_en[88] = word_wen[0] & byte_wen[11] & ~rst_tri_en;
   assign bit_en[89] = word_wen[1] & byte_wen[11] & ~rst_tri_en;
   assign bit_en[90] = word_wen[2] & byte_wen[11] & ~rst_tri_en;
   assign bit_en[91] = word_wen[3] & byte_wen[11] & ~rst_tri_en;
   assign bit_en[92] = word_wen[0] & byte_wen[11] & ~rst_tri_en;
   assign bit_en[93] = word_wen[1] & byte_wen[11] & ~rst_tri_en;
   assign bit_en[94] = word_wen[2] & byte_wen[11] & ~rst_tri_en;
   assign bit_en[95] = word_wen[3] & byte_wen[11] & ~rst_tri_en;
   assign bit_en[96] = word_wen[0] & byte_wen[12] & ~rst_tri_en;
   assign bit_en[97] = word_wen[1] & byte_wen[12] & ~rst_tri_en;
   assign bit_en[98] = word_wen[2] & byte_wen[12] & ~rst_tri_en;
   assign bit_en[99] = word_wen[3] & byte_wen[12] & ~rst_tri_en;
   assign bit_en[100] = word_wen[0] & byte_wen[12] & ~rst_tri_en;
   assign bit_en[101] = word_wen[1] & byte_wen[12] & ~rst_tri_en;
   assign bit_en[102] = word_wen[2] & byte_wen[12] & ~rst_tri_en;
   assign bit_en[103] = word_wen[3] & byte_wen[12] & ~rst_tri_en;
   assign bit_en[104] = word_wen[0] & byte_wen[13] & ~rst_tri_en;
   assign bit_en[105] = word_wen[1] & byte_wen[13] & ~rst_tri_en;
   assign bit_en[106] = word_wen[2] & byte_wen[13] & ~rst_tri_en;
   assign bit_en[107] = word_wen[3] & byte_wen[13] & ~rst_tri_en;
   assign bit_en[108] = word_wen[0] & byte_wen[13] & ~rst_tri_en;
   assign bit_en[109] = word_wen[1] & byte_wen[13] & ~rst_tri_en;
   assign bit_en[110] = word_wen[2] & byte_wen[13] & ~rst_tri_en;
   assign bit_en[111] = word_wen[3] & byte_wen[13] & ~rst_tri_en;
   assign bit_en[112] = word_wen[0] & byte_wen[14] & ~rst_tri_en;
   assign bit_en[113] = word_wen[1] & byte_wen[14] & ~rst_tri_en;
   assign bit_en[114] = word_wen[2] & byte_wen[14] & ~rst_tri_en;
   assign bit_en[115] = word_wen[3] & byte_wen[14] & ~rst_tri_en;
   assign bit_en[116] = word_wen[0] & byte_wen[14] & ~rst_tri_en;
   assign bit_en[117] = word_wen[1] & byte_wen[14] & ~rst_tri_en;
   assign bit_en[118] = word_wen[2] & byte_wen[14] & ~rst_tri_en;
   assign bit_en[119] = word_wen[3] & byte_wen[14] & ~rst_tri_en;
   assign bit_en[120] = word_wen[0] & byte_wen[15] & ~rst_tri_en;
   assign bit_en[121] = word_wen[1] & byte_wen[15] & ~rst_tri_en;
   assign bit_en[122] = word_wen[2] & byte_wen[15] & ~rst_tri_en;
   assign bit_en[123] = word_wen[3] & byte_wen[15] & ~rst_tri_en;
   assign bit_en[124] = word_wen[0] & byte_wen[15] & ~rst_tri_en;
   assign bit_en[125] = word_wen[1] & byte_wen[15] & ~rst_tri_en;
   assign bit_en[126] = word_wen[2] & byte_wen[15] & ~rst_tri_en;
   assign bit_en[127] = word_wen[3] & byte_wen[15] & ~rst_tri_en;
   assign bit_en[128] = word_wen[0] & byte_wen[16] & ~rst_tri_en;
   assign bit_en[129] = word_wen[1] & byte_wen[16] & ~rst_tri_en;
   assign bit_en[130] = word_wen[2] & byte_wen[16] & ~rst_tri_en;
   assign bit_en[131] = word_wen[3] & byte_wen[16] & ~rst_tri_en;
   assign bit_en[132] = word_wen[0] & byte_wen[16] & ~rst_tri_en;
   assign bit_en[133] = word_wen[1] & byte_wen[16] & ~rst_tri_en;
   assign bit_en[134] = word_wen[2] & byte_wen[16] & ~rst_tri_en;
   assign bit_en[135] = word_wen[3] & byte_wen[16] & ~rst_tri_en;
   assign bit_en[136] = word_wen[0] & byte_wen[17] & ~rst_tri_en;
   assign bit_en[137] = word_wen[1] & byte_wen[17] & ~rst_tri_en;
   assign bit_en[138] = word_wen[2] & byte_wen[17] & ~rst_tri_en;
   assign bit_en[139] = word_wen[3] & byte_wen[17] & ~rst_tri_en;
   assign bit_en[140] = word_wen[0] & byte_wen[17] & ~rst_tri_en;
   assign bit_en[141] = word_wen[1] & byte_wen[17] & ~rst_tri_en;
   assign bit_en[142] = word_wen[2] & byte_wen[17] & ~rst_tri_en;
   assign bit_en[143] = word_wen[3] & byte_wen[17] & ~rst_tri_en;
   assign bit_en[144] = word_wen[0] & byte_wen[18] & ~rst_tri_en;
   assign bit_en[145] = word_wen[1] & byte_wen[18] & ~rst_tri_en;
   assign bit_en[146] = word_wen[2] & byte_wen[18] & ~rst_tri_en;
   assign bit_en[147] = word_wen[3] & byte_wen[18] & ~rst_tri_en;
   assign bit_en[148] = word_wen[0] & byte_wen[18] & ~rst_tri_en;
   assign bit_en[149] = word_wen[1] & byte_wen[18] & ~rst_tri_en;
   assign bit_en[150] = word_wen[2] & byte_wen[18] & ~rst_tri_en;
   assign bit_en[151] = word_wen[3] & byte_wen[18] & ~rst_tri_en;
   assign bit_en[152] = word_wen[0] & byte_wen[19] & ~rst_tri_en;
   assign bit_en[153] = word_wen[1] & byte_wen[19] & ~rst_tri_en;
   assign bit_en[154] = word_wen[2] & byte_wen[19] & ~rst_tri_en;
   assign bit_en[155] = word_wen[3] & byte_wen[19] & ~rst_tri_en;
   assign bit_en[156] = word_wen[0] & byte_wen[19] & ~rst_tri_en;
   assign bit_en[157] = word_wen[1] & byte_wen[19] & ~rst_tri_en;
   assign bit_en[158] = word_wen[2] & byte_wen[19] & ~rst_tri_en;
   assign bit_en[159] = word_wen[3] & byte_wen[19] & ~rst_tri_en;

endmodule











/*
Copyright (c) 2015 Princeton University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Princeton University nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

//==================================================================================================
//  Filename      : clk_gating_latch.v
//  Created On    : 2015-01-26 14:10:43
//  Last Modified : 2019-04-17 11:56:55
//  Revision      :
//  Author        : Tri Nguyen
//  Company       : Princeton University
//  Email         : trin@princeton.edu
//
//  Description   : Latch for glitchless clock gating
//==================================================================================================

module clk_gating_latch (
    input wire clk,
    input wire clk_en,
    output wire clk_out
);

// use clock buffer on FPGA
// note that not all FPGAs have enough of these available
// so we use the latch as a fallback on certain boards (e.g., vc707)




 // PITON_FPGA_SYNTH

  wire clk_en_sync;
  reg clk_en_sync_latch;

  assign clk_out = clk & clk_en_sync_latch;

  synchronizer sync(
      .clk            (clk),
      .presyncdata    (clk_en),
      .syncdata       (clk_en_sync)
  );

  // if possible, replace this with a native clock gate from the std cell lib
  // clk_en_sync_latch changes only on the negative duty of the cycle
  always @ (clk or clk_en_sync)
      if (~clk) clk_en_sync_latch = clk_en_sync;



endmodule // clk_gating_latch
// Copyright (c) 2015 Princeton University
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

/****************************************************************************
 *
 *   FILE: credit_to_valrdy.v
 *
 *   Modified: Yaosheng Fu
 *   Date: May 2 2014

 ***************************************************************************/

/*
Copyright (c) 2015 Princeton University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Princeton University nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/////////////////////////////////////////////////////////////////////////////////////////////
// 63         50 49      42 41      34 33           30 29      22 21                 0   
// ------------------------------------------------------------------------------------
// |            |          |          |               |          |                    |
// |  Chip ID   |  Dest X  |  Dest Y  |  Final Route  |  Length  |    Header Payload  | 
// |            |          |          |               |          |                    |
// ------------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////////////////////











 //whether the routing is based on chipid or x y position
 //`define    ROUTING_CHIP_ID
 

 //defines for different topology, only one should be active
 //`define    NETWORK_TOPO_2D_MESH
 //`define    NETWORK_TOPO_3D_MESH
 

module credit_to_valrdy (
   clk,
   reset,
   //credit based interface	
   data_in,
   valid_in,
   yummy_in,
            
   //val/rdy interface
   data_out,
   valid_out,
   ready_out
);

   input	 clk;
   input	 reset;
   input [64-1:0]	 data_in;
   input	 valid_in;
   input     ready_out;
    
   output	 yummy_in;
   output	 valid_out;
   output [64-1:0] data_out;
   
   wire	 thanksIn;

   wire valid_out_temp;

   assign valid_out = valid_out_temp;

   network_input_blk_multi_out #(.LOG2_NUMBER_FIFO_ELEMENTS(2)) data(
      .clk(clk),
      .reset(reset),
      .data_in(data_in),
      .valid_in(valid_in),

      .thanks_in(valid_out & ready_out),

      .yummy_out(yummy_in),
      .data_val(data_out),
      .data_val1(/*not used*/),
      .data_avail(valid_out_temp));

endmodule



// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: m1.behV
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
////////////////////////////////////////////////////////////////////////
// 64 bit nor gate with first 32 bits out

module zznor64_32 ( znor64, znor32, a );
  input  [63:0] a;
  output        znor64;
  output        znor32;

  assign znor32 =  ~(a[0]  | a[1]  | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
		   | a[8]  | a[9]  | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]
		   | a[16] | a[17] | a[18] | a[19] | a[20] | a[21] | a[22] | a[23]
		   | a[24] | a[25] | a[26] | a[27] | a[28] | a[29] | a[30] | a[31]); 

  assign znor64 =  ~(a[0]  | a[1]  | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
		   | a[8]  | a[9]  | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]
		   | a[16] | a[17] | a[18] | a[19] | a[20] | a[21] | a[22] | a[23]
		   | a[24] | a[25] | a[26] | a[27] | a[28] | a[29] | a[30] | a[31] 
		   | a[32] | a[33] | a[34] | a[35] | a[36] | a[37] | a[38] | a[39] 
		   | a[40] | a[41] | a[42] | a[43] | a[44] | a[45] | a[46] | a[47] 
		   | a[48] | a[49] | a[50] | a[51] | a[52] | a[53] | a[54] | a[55] 
		   | a[56] | a[57] | a[58] | a[59] | a[60] | a[61] | a[62] | a[63]);

endmodule // zznor64_32



////////////////////////////////////////////////////////////////////////////////
// 36 bit or gate

module zzor36 ( z, a );
  input  [35:0] a;
  output        z;

  assign z =  (a[0]  | a[1]  | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
	     | a[8]  | a[9]  | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]
	     | a[16] | a[17] | a[18] | a[19] | a[20] | a[21] | a[22] | a[23]
	     | a[24] | a[25] | a[26] | a[27] | a[28] | a[29] | a[30] | a[31]
	     | a[32] | a[33] | a[34] | a[35]); 
   
endmodule // zzor36



////////////////////////////////////////////////////////////////////////////////
// 32 bit or gate

module zzor32 ( z, a );
  input  [31:0] a;
  output        z;

  assign z =  (a[0]  | a[1]  | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
	     | a[8]  | a[9]  | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]
	     | a[16] | a[17] | a[18] | a[19] | a[20] | a[21] | a[22] | a[23]
	     | a[24] | a[25] | a[26] | a[27] | a[28] | a[29] | a[30] | a[31]); 

endmodule // zzor32



////////////////////////////////////////////////////////////////////////////////
// 24 bit nor gate

module zznor24 ( z, a );
  input  [23:0] a;
  output        z;

  assign z =  ~(a[0]  | a[1]  | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
	      | a[8]  | a[9]  | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]
	      | a[16] | a[17] | a[18] | a[19] | a[20] | a[21] | a[22] | a[23]); 

endmodule // zznor24



////////////////////////////////////////////////////////////////////////////////
// 16 bit nor gate

module zznor16 ( z, a );
  input  [15:0] a;
  output        z;

  assign z =  ~(a[0] | a[1] | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
	      | a[8] | a[9] | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]); 

endmodule // zznor16



////////////////////////////////////////////////////////////////////////////////
// 8 bit or gate

module zzor8 ( z, a );
  input  [7:0] a;
  output       z;

  assign z =  (a[0] | a[1] | a[2] | a[3] | a[4] | a[5] | a[6] | a[7]); 
   
endmodule // zzor8




////////////////////////////////////////////////////////////////////////////////
//  Description:	This block implements the adder for the sparc FPU.
//  			It takes two operands and a carry bit.  It adds them together
//			and sends the output to adder_out. 

module zzadd13 ( rs1_data, rs2_data, cin, adder_out );

  input  [12:0] rs1_data;   // 1st input operand
  input  [12:0] rs2_data;   // 2nd input operand
  input         cin;        // carry in

  output [12:0] adder_out;  // result of adder

  assign adder_out = rs1_data + rs2_data + cin;

endmodule // zzadd13



////////////////////////////////////////////////////////////////////////////////
//  Description:	This block implements the adder for the sparc FPU.
//  			It takes two operands and a carry bit.  It adds them together
//			and sends the output to adder_out. 

module zzadd56 ( rs1_data, rs2_data, cin, adder_out );

  input  [55:0] rs1_data;   // 1st input operand
  input  [55:0] rs2_data;   // 2nd input operand
  input         cin;        // carry in

  output [55:0] adder_out;  // result of adder

  assign adder_out = rs1_data + rs2_data + cin;

endmodule // zzadd56



////////////////////////////////////////////////////////////////////////////////

module zzadd48 ( rs1_data, rs2_data, cin, adder_out );

  input  [47:0] rs1_data;   // 1st input operand
  input  [47:0] rs2_data;   // 2nd input operand
  input         cin;        // carry in

  output [47:0] adder_out;  // result of adder

  assign adder_out = rs1_data + rs2_data + cin;

endmodule // zzadd48



////////////////////////////////////////////////////////////////////////////////
//  This adder is primarily used in the multiplier.
//  The cin to out path is optimized.

module zzadd34c ( rs1_data, rs2_data, cin, adder_out );

  input  [33:0] rs1_data;
  input  [33:0] rs2_data;
  input         cin;

  output [33:0] adder_out;

  assign adder_out = rs1_data + rs2_data + cin;


endmodule // zzadd34c



////////////////////////////////////////////////////////////////////////////////

module zzadd32 ( rs1_data, rs2_data, cin, adder_out, cout );

  input  [31:0] rs1_data;   // 1st input operand
  input  [31:0] rs2_data;   // 2nd input operand
  input         cin;        // carry in

  output [31:0] adder_out;  // result of adder
  output 	cout;       // carry out

  assign {cout, adder_out} = rs1_data + rs2_data + cin;

endmodule // zzadd32



////////////////////////////////////////////////////////////////////////////////

module zzadd18 ( rs1_data, rs2_data, cin, adder_out, cout );

  input  [17:0] rs1_data;   // 1st input operand
  input  [17:0] rs2_data;   // 2nd input operand
  input         cin;        // carry in

  output [17:0] adder_out;  // result of adder
  output 	cout;       // carry out

  assign {cout, adder_out} = rs1_data + rs2_data + cin;

endmodule // zzadd18



////////////////////////////////////////////////////////////////////////////////

module zzadd8 ( rs1_data, rs2_data, cin, adder_out, cout );

  input  [7:0] rs1_data;   // 1st input operand
  input  [7:0] rs2_data;   // 2nd input operand
  input        cin;        // carry in

  output [7:0] adder_out;  // result of add & decrement
  output       cout;       // carry out

  assign {cout, adder_out} = rs1_data + rs2_data + cin;

endmodule // zzadd8



////////////////////////////////////////////////////////////////////////////////
// Special 4-operand 32b adder used in spu_shamd5
//  Description:        This block implements the 4-operand 32-bit adder for SPU
//			It takes four 32-bit operands. It add them together and
//			output the 32-bit results to adder_out. The overflow of
//			32th bit and higher will be ignored.

module zzadd32op4 ( rs1_data, rs2_data, rs3_data, rs4_data, adder_out );

  input  [31:0] rs1_data;   // 1st input operand
  input  [31:0] rs2_data;   // 2nd input operand
  input  [31:0] rs3_data;   // 3rd input operand
  input  [31:0] rs4_data;   // 4th input operand

  output [31:0] adder_out;  // result of add

  assign adder_out = rs1_data + rs2_data + rs3_data + rs4_data;

endmodule // zzadd32op4


////////////////////////////////////////////////////////////////////////////////
//  Description:	This block implements the adder for the sparc alu.
//  			It takes two operands and a carry bit.  It adds them together
//			and sends the output to adder_out.  It outputs the overflow
//			and carry condition codes for both 64 bit and 32 bit operations.

module zzadd64 ( rs1_data, rs2_data, cin, adder_out, cout32, cout64 );

   input [63:0]  rs1_data;   // 1st input operand
   input [63:0]  rs2_data;   // 2nd input operand
   input         cin;        // carry in

   output [63:0] adder_out;  // result of adder
   output        cout32;     // carry out from lower 32 bit add
   output        cout64;     // carry out from 64 bit add

   assign {cout32, adder_out[31:0]}  = rs1_data[31:0]  + rs2_data[31:0]  + cin;
   assign {cout64, adder_out[63:32]} = rs1_data[63:32] + rs2_data[63:32] + cout32;

endmodule // zzadd64



///////////////////////////////////////////////////////////////////////
/*
//      Description: This is the ffu VIS adder.  It can do either
//                              2 16 bit adds or 1 32 bit add.
*/

module zzadd32v (/*AUTOARG*/
   // Outputs
   z,
   // Inputs
   a, b, cin, add32
   ) ;
   input [31:0] a;
   input [31:0] b;
   input        cin;
   input        add32;

   output [31:0] z;

   wire          cout15; // carry out from lower 16 bit add
   wire          cin16; // carry in to the upper 16 bit add
   wire          cout31; // carry out from the upper 16 bit add

   assign        cin16 = (add32)? cout15: cin;

   assign      {cout15, z[15:0]} = a[15:0]+b[15:0]+ cin;
   assign      {cout31, z[31:16]} = a[31:16]+b[31:16]+ cin16;

endmodule // zzadd32v




////////////////////////////////////////////////////////////////////////////////
// 64-bit incrementer

module zzinc64 ( in, out );

  input  [63:0] in;

  output [63:0] out;   // result of increment

  assign out = in + 1'b1;

endmodule // zzinc64


////////////////////////////////////////////////////////////////////////////////
// 48-bit incrementer

module zzinc48 ( in, out, overflow );

  input  [47:0] in;

  output [47:0] out;      // result of increment
  output        overflow; // overflow

  assign out      = in + 1'b1;
  assign overflow = ~in[47] & out[47];

endmodule // zzinc48


////////////////////////////////////////////////////////////////////////////////
// 32-bit incrementer

module zzinc32 ( in, out );

  input  [31:0] in;

  output [31:0] out;   // result of increment

  assign out = in + 1'b1;

endmodule // zzinc32


////////////////////////////////////////////////////////////////////////////////

module zzecc_exu_chkecc2 ( q,ce, ue, ne, d, p, vld );
   input [63:0] d;
   input [7:0]  p;
   input        vld;
   output [6:0] q;
   output       ce,
                ue,
                ne;

   wire       parity;

   assign     ce = vld & parity;

   assign ue = vld & ~parity & (q[6] | q[5] | q[4] | q[3] | q[2] | q[1] | q[0]);

   assign ne = ~vld | ~(parity | q[6] | q[5] | q[4] | q[3] | q[2] | q[1] | q[0]);


   assign q[0] = d[0]  ^ d[1]  ^ d[3]  ^ d[4]  ^ d[6]  ^ d[8]  ^ d[10]
               ^ d[11] ^ d[13] ^ d[15] ^ d[17] ^ d[19] ^ d[21] ^ d[23]
               ^ d[25] ^ d[26] ^ d[28] ^ d[30] ^ d[32] ^ d[34] ^ d[36]
               ^ d[38] ^ d[40] ^ d[42] ^ d[44] ^ d[46] ^ d[48] ^ d[50]
               ^ d[52] ^ d[54] ^ d[56] ^ d[57] ^ d[59] ^ d[61] ^ d[63]
               ^ p[0]  ;

   assign q[1] = d[0]  ^ d[2]  ^ d[3]  ^ d[5]  ^ d[6]  ^ d[9]  ^ d[10]
               ^ d[12] ^ d[13] ^ d[16] ^ d[17] ^ d[20] ^ d[21] ^ d[24]
               ^ d[25] ^ d[27] ^ d[28] ^ d[31] ^ d[32] ^ d[35] ^ d[36]
               ^ d[39] ^ d[40] ^ d[43] ^ d[44] ^ d[47] ^ d[48] ^ d[51]
               ^ d[52] ^ d[55] ^ d[56] ^ d[58] ^ d[59] ^ d[62] ^ d[63]
               ^ p[1]  ;

   assign q[2] = d[1]  ^ d[2]  ^ d[3]  ^ d[7]  ^ d[8]  ^ d[9]  ^ d[10]
               ^ d[14] ^ d[15] ^ d[16] ^ d[17] ^ d[22] ^ d[23] ^ d[24]
               ^ d[25] ^ d[29] ^ d[30] ^ d[31] ^ d[32] ^ d[37] ^ d[38]
               ^ d[39] ^ d[40] ^ d[45] ^ d[46] ^ d[47] ^ d[48] ^ d[53]
               ^ d[54] ^ d[55] ^ d[56] ^ d[60] ^ d[61] ^ d[62] ^ d[63]
               ^ p[2]  ;

   assign q[3] = d[4]  ^ d[5]  ^ d[6]  ^ d[7]  ^ d[8]  ^ d[9]  ^ d[10]
               ^ d[18] ^ d[19] ^ d[20] ^ d[21] ^ d[22] ^ d[23] ^ d[24]
               ^ d[25] ^ d[33] ^ d[34] ^ d[35] ^ d[36] ^ d[37] ^ d[38]
               ^ d[39] ^ d[40] ^ d[49] ^ d[50] ^ d[51] ^ d[52] ^ d[53]
               ^ d[54] ^ d[55] ^ d[56] ^ p[3]  ;

   assign q[4] = d[11] ^ d[12] ^ d[13] ^ d[14] ^ d[15] ^ d[16] ^ d[17]
               ^ d[18] ^ d[19] ^ d[20] ^ d[21] ^ d[22] ^ d[23] ^ d[24]
               ^ d[25] ^ d[41] ^ d[42] ^ d[43] ^ d[44] ^ d[45] ^ d[46]
               ^ d[47] ^ d[48] ^ d[49] ^ d[50] ^ d[51] ^ d[52] ^ d[53]
               ^ d[54] ^ d[55] ^ d[56] ^ p[4]  ;

   assign q[5] = d[26] ^ d[27] ^ d[28] ^ d[29] ^ d[30] ^ d[31] ^ d[32]
               ^ d[33] ^ d[34] ^ d[35] ^ d[36] ^ d[37] ^ d[38] ^ d[39]
               ^ d[40] ^ d[41] ^ d[42] ^ d[43] ^ d[44] ^ d[45] ^ d[46]
               ^ d[47] ^ d[48] ^ d[49] ^ d[50] ^ d[51] ^ d[52] ^ d[53]
               ^ d[54] ^ d[55] ^ d[56] ^ p[5]  ;

   assign q[6] = d[57] ^ d[58] ^ d[59] ^ d[60] ^ d[61] ^ d[62] ^ d[63] ^ p[6] ;

   assign parity = d[0]  ^ d[1]  ^ d[2]  ^ d[3]  ^ d[4]  ^ d[5]  ^ d[6]  ^ d[7]
                 ^ d[8]  ^ d[9]  ^ d[10] ^ d[11] ^ d[12] ^ d[13] ^ d[14] ^ d[15]
                 ^ d[16] ^ d[17] ^ d[18] ^ d[19] ^ d[20] ^ d[21] ^ d[22] ^ d[23]
                 ^ d[24] ^ d[25] ^ d[26] ^ d[27] ^ d[28] ^ d[29] ^ d[30] ^ d[31]
                 ^ d[32] ^ d[33] ^ d[34] ^ d[35] ^ d[36] ^ d[37] ^ d[38] ^ d[39]
                 ^ d[40] ^ d[41] ^ d[42] ^ d[43] ^ d[44] ^ d[45] ^ d[46] ^ d[47]
                 ^ d[48] ^ d[49] ^ d[50] ^ d[51] ^ d[52] ^ d[53] ^ d[54] ^ d[55]
                 ^ d[56] ^ d[57] ^ d[58] ^ d[59] ^ d[60] ^ d[61] ^ d[62] ^ d[63]
                 ^ p[0]  ^ p[1]  ^ p[2]  ^ p[3]  ^ p[4]  ^ p[5]  ^ p[6]  ^ p[7];

endmodule // zzecc_exu_chkecc2



////////////////////////////////////////////////////////////////////////////////

module zzecc_sctag_24b_gen ( din, dout, parity ) ;

// Input Ports
input  [23:0] din ;

// Output Ports
output [23:0] dout ;
output [5:0]  parity ;

wire   [23:0] dout ;
wire   [5:0]  parity ;

// Local Reg and Wires
wire          p1 ;
wire          p2 ;
wire          p4 ;
wire          p8 ;
wire          p16 ;
wire          p30 ;


//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
//    |1 |2 |3 |4 |5 |6 |7 |8 |9 |10|11|12|13|14|15 |16 |17 |18 |19 |20 |21 |22 |23 |24 |25 |26 |27 |28 |29 |30 |
//    |P1|P2|D0|P4|D1|D2|D3|P8|D4|D5|D6|D7|D8|D9|D10|P16|D11|D12|D13|D14|D15|D16|D17|D18|D19|D20|D21|D22|D23|P30|
//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
//P1  |  |  |* |  |* |  |* |  |* |  |* |  |* |  | * |   | * |   | * |   | * |   | * |   | * |   | * |   | * |   |
//P2  |  |  |* |  |  |* |* |  |  |* |* |  |  |* | * |   |   | * | * |   |   | * | * |   |   | * | * |   |   |   |
//P4  |  |  |  |  |* |* |* |  |  |  |  |* |* |* | * |   |   |   |   | * | * | * | * |   |   |   |   | * | * |   |
//P8  |  |  |  |  |  |  |  |  |* |* |* |* |* |* | * |   |   |   |   |   |   |   |   | * | * | * | * | * | * |   |
//P16 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   |   | * | * | * | * | * | * | * | * | * | * | * | * | * |   |
//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
//p30 |  |  |* |  |* |* |  |  |* |* |  |* |  |  | * |   | * | * |   | * |   |   | * | * |   |   | * |   | * |   |
//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|


assign p1  = din[0]  ^ din[1]  ^ din[3]  ^ din[4]  ^ din[6]  ^ din[8]  ^
             din[10] ^ din[11] ^ din[13] ^ din[15] ^ din[17] ^ din[19] ^
             din[21] ^ din[23] ;

assign p2  = din[0]  ^ din[2]  ^ din[3]  ^ din[5]  ^ din[6]  ^ din[9]  ^
             din[10] ^ din[12] ^ din[13] ^ din[16] ^ din[17] ^ din[20] ^
             din[21] ;

assign p4  = din[1]  ^ din[2]  ^ din[3]  ^ din[7]  ^ din[8]  ^ din[9]  ^
             din[10] ^ din[14] ^ din[15] ^ din[16] ^ din[17] ^ din[22] ^
             din[23] ;

assign p8  = din[4]  ^ din[5]  ^ din[6]  ^ din[7]  ^ din[8]  ^ din[9]  ^
             din[10] ^ din[18] ^ din[19] ^ din[20] ^ din[21] ^ din[22] ^
             din[23] ;

assign p16 = din[11] ^ din[12] ^ din[13] ^ din[14] ^ din[15] ^ din[16] ^
             din[17] ^ din[18] ^ din[19] ^ din[20] ^ din[21] ^ din[22] ^
             din[23] ;

assign p30 = din[0]  ^ din[1]  ^ din[2]  ^ din[4]  ^ din[5]  ^
             din[7]  ^ din[10] ^ din[11] ^ din[12] ^ din[14] ^
             din[17] ^ din[18] ^ din[21] ^ din[23] ;

assign dout   = din ;
assign parity = {p30, p16, p8, p4, p2, p1} ;

endmodule



////////////////////////////////////////////////////////////////////////////////

module zzecc_sctag_30b_cor ( din, parity, dout, corrected_bit ) ;

// Input Ports
input  [23:0] din ;
input  [4:0]  parity ;

// Output Ports
output [23:0] dout ;
output [4:0]  corrected_bit ;

wire   [23:0] dout ;
wire   [4:0]  corrected_bit ;

// Local Reg and Wires
wire          p1 ;
wire          p2 ;
wire          p4 ;
wire          p8 ;
wire          p16 ;
wire [23:0]   error_bit ;


//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
//    |1 |2 |3 |4 |5 |6 |7 |8 |9 |10|11|12|13|14|15 |16 |17 |18 |19 |20 |21 |22 |23 |24 |25 |26 |27 |28 |29 |30 |
//    |P1|P2|D0|P4|D1|D2|D3|P8|D4|D5|D6|D7|D8|D9|D10|P16|D11|D12|D13|D14|D15|D16|D17|D18|D19|D20|D21|D22|D23|P30|
//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
//P1  |* |  |* |  |* |  |* |  |* |  |* |  |* |  | * |   | * |   | * |   | * |   | * |   | * |   | * |   | * |   |
//P2  |  |* |* |  |  |* |* |  |  |* |* |  |  |* | * |   |   | * | * |   |   | * | * |   |   | * | * |   |   |   |
//P4  |  |  |  |* |* |* |* |  |  |  |  |* |* |* | * |   |   |   |   | * | * | * | * |   |   |   |   | * | * |   |
//P8  |  |  |  |  |  |  |  |* |* |* |* |* |* |* | * |   |   |   |   |   |   |   |   | * | * | * | * | * | * |   |
//P16 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   | * | * | * | * | * | * | * | * | * | * | * | * | * | * |   |
//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
//p30 |* |* |* |* |* |* |* |* |* |* |* |* |* |* | * | * | * | * | * | * | * | * | * | * | * | * | * | * | * | * |
//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|


assign p1  = parity[0] ^
             din[0]  ^ din[1]  ^ din[3]  ^ din[4]  ^ din[6]  ^ din[8]  ^
             din[10] ^ din[11] ^ din[13] ^ din[15] ^ din[17] ^ din[19] ^
             din[21] ^ din[23] ;

assign p2  = parity[1] ^
             din[0]  ^ din[2]  ^ din[3]  ^ din[5]  ^ din[6]  ^ din[9]  ^
             din[10] ^ din[12] ^ din[13] ^ din[16] ^ din[17] ^ din[20] ^
             din[21] ;

assign p4  = parity[2] ^
             din[1]  ^ din[2]  ^ din[3]  ^ din[7]  ^ din[8]  ^ din[9]  ^
             din[10] ^ din[14] ^ din[15] ^ din[16] ^ din[17] ^ din[22] ^
             din[23] ;

assign p8  = parity[3] ^
             din[4]  ^ din[5]  ^ din[6]  ^ din[7]  ^ din[8]  ^ din[9]  ^
             din[10] ^ din[18] ^ din[19] ^ din[20] ^ din[21] ^ din[22] ^
             din[23] ;

assign p16 = parity[4] ^
             din[11] ^ din[12] ^ din[13] ^ din[14] ^ din[15] ^ din[16] ^
             din[17] ^ din[18] ^ din[19] ^ din[20] ^ din[21] ^ din[22] ^
             din[23] ;

assign  error_bit[0]  = !p16 & !p8 & !p4 &  p2 &  p1 ; // 3
assign  error_bit[1]  = !p16 & !p8 &  p4 & !p2 &  p1 ; // 5
assign  error_bit[2]  = !p16 & !p8 &  p4 &  p2 & !p1 ; // 6
assign  error_bit[3]  = !p16 & !p8 &  p4 &  p2 &  p1 ; // 7
assign  error_bit[4]  = !p16 &  p8 & !p4 & !p2 &  p1 ; // 9
assign  error_bit[5]  = !p16 &  p8 & !p4 &  p2 & !p1 ; // 10
assign  error_bit[6]  = !p16 &  p8 & !p4 &  p2 &  p1 ; // 11
assign  error_bit[7]  = !p16 &  p8 &  p4 & !p2 & !p1 ; // 12
assign  error_bit[8]  = !p16 &  p8 &  p4 & !p2 &  p1 ; // 13
assign  error_bit[9]  = !p16 &  p8 &  p4 &  p2 & !p1 ; // 14
assign  error_bit[10] = !p16 &  p8 &  p4 &  p2 &  p1 ; // 15
assign  error_bit[11] =  p16 & !p8 & !p4 & !p2 &  p1 ; // 17
assign  error_bit[12] =  p16 & !p8 & !p4 &  p2 & !p1 ; // 18
assign  error_bit[13] =  p16 & !p8 & !p4 &  p2 &  p1 ; // 19
assign  error_bit[14] =  p16 & !p8 &  p4 & !p2 & !p1 ; // 20
assign  error_bit[15] =  p16 & !p8 &  p4 & !p2 &  p1 ; // 21
assign  error_bit[16] =  p16 & !p8 &  p4 &  p2 & !p1 ; // 22
assign  error_bit[17] =  p16 & !p8 &  p4 &  p2 &  p1 ; // 23
assign  error_bit[18] =  p16 &  p8 & !p4 & !p2 & !p1 ; // 24
assign  error_bit[19] =  p16 &  p8 & !p4 & !p2 &  p1 ; // 25
assign  error_bit[20] =  p16 &  p8 & !p4 &  p2 & !p1 ; // 26
assign  error_bit[21] =  p16 &  p8 & !p4 &  p2 &  p1 ; // 27
assign  error_bit[22] =  p16 &  p8 &  p4 & !p2 & !p1 ; // 28
assign  error_bit[23] =  p16 &  p8 &  p4 & !p2 &  p1 ; // 29

assign  dout          = din ^ error_bit ;
assign  corrected_bit = {p16, p8, p4, p2, p1} ;

endmodule



////////////////////////////////////////////////////////////////////////////////
//Module Name: zzecc_sctag_ecc39
//Function: Error Detection and Correction
//
//

module zzecc_sctag_ecc39 ( dout, cflag, pflag, parity, din);

   //Output: 32bit corrected data
   output[31:0] dout;
   output [5:0] cflag;
   output 	pflag;
   
   //Input: 32bit data din
   input [31:0] din;
   input [6:0]	parity;

   wire 	c0,c1,c2,c3,c4,c5;
   wire [31:0] 	err_bit_pos;

   //refer to the comments in parity_gen_32b.v for the position description
   
   assign c0= parity[0]^(din[0]^din[1])^(din[3]^din[4])^(din[6]^din[8])
                     ^(din[10]^din[11])^(din[13]^din[15])^(din[17]^din[19])
		     ^(din[21]^din[23])^(din[25]^din[26])^(din[28]^din[30]);
   
   assign c1= parity[1]^(din[0]^din[2])^(din[3]^din[5])^(din[6]^din[9])
                     ^(din[10]^din[12])^(din[13]^din[16])^(din[17]^din[20])
		     ^(din[21]^din[24])^(din[25]^din[27])^(din[28]^din[31]);
   
   assign c2= parity[2]^(din[1]^din[2])^(din[3]^din[7])^(din[8]^din[9])
                     ^(din[10]^din[14])^(din[15]^din[16])^(din[17]^din[22])
		     ^(din[23]^din[24])^(din[25]^din[29])^(din[30]^din[31]);
   
   assign c3= parity[3]^(din[4]^din[5])^(din[6]^din[7])^(din[8]^din[9])
                     ^(din[10]^din[18])^(din[19]^din[20])^(din[21]^din[22])
		     ^(din[23]^din[24])^din[25];
   
   assign c4= parity[4]^(din[11]^din[12])^(din[13]^din[14])^
                    (din[15]^din[16])^(din[17]^din[18])^(din[19]^din[20])^
                    (din[21]^din[22])^(din[23]^din[24])^din[25];

   assign c5= parity[5]^(din[26]^din[27])^(din[28]^din[29])^
		    (din[30]^din[31]);

   //generate total parity flag
   assign pflag= c0 ^
		(( (((parity[1]^parity[2])^(parity[3]^parity[4])) ^
		 ((parity[5]^parity[6])^(din[2]^din[5]))) ^		 
		 (((din[7]^din[9])^(din[12]^din[14])) ^
		 ((din[16]^din[18])^(din[20]^din[22]))) ) ^
		 ((din[24]^din[27])^(din[29]^din[31])) );
   
   assign cflag= {c5,c4,c3,c2,c1,c0};
   
   //6 to 32 decoder
   assign err_bit_pos[0] = (c0)&(c1)&(~c2)&(~c3)&(~c4)&(~c5);
   assign err_bit_pos[1] = (c0)&(~c1)&(c2)&(~c3)&(~c4)&(~c5);
   assign err_bit_pos[2] = (~c0)&(c1)&(c2)&(~c3)&(~c4)&(~c5);
   assign err_bit_pos[3] = (c0)&(c1)&(c2)&(~c3)&(~c4)&(~c5);
   assign err_bit_pos[4] = (c0)&(~c1)&(~c2)&(c3)&(~c4)&(~c5);
   assign err_bit_pos[5] = (~c0)&(c1)&(~c2)&(c3)&(~c4)&(~c5);
   assign err_bit_pos[6] = (c0)&(c1)&(~c2)&(c3)&(~c4)&(~c5);
   assign err_bit_pos[7] = (~c0)&(~c1)&(c2)&(c3)&(~c4)&(~c5);
   assign err_bit_pos[8] = (c0)&(~c1)&(c2)&(c3)&(~c4)&(~c5);
   assign err_bit_pos[9] = (~c0)&(c1)&(c2)&(c3)&(~c4)&(~c5);
   assign err_bit_pos[10] = (c0)&(c1)&(c2)&(c3)&(~c4)&(~c5);
   assign err_bit_pos[11] = (c0)&(~c1)&(~c2)&(~c3)&(c4)&(~c5);
   assign err_bit_pos[12] = (~c0)&(c1)&(~c2)&(~c3)&(c4)&(~c5);
   assign err_bit_pos[13] = (c0)&(c1)&(~c2)&(~c3)&(c4)&(~c5);
   assign err_bit_pos[14] = (~c0)&(~c1)&(c2)&(~c3)&(c4)&(~c5);
   assign err_bit_pos[15] = (c0)&(~c1)&(c2)&(~c3)&(c4)&(~c5);
   assign err_bit_pos[16] = (~c0)&(c1)&(c2)&(~c3)&(c4)&(~c5);
   assign err_bit_pos[17] = (c0)&(c1)&(c2)&(~c3)&(c4)&(~c5);
   assign err_bit_pos[18] = (~c0)&(~c1)&(~c2)&(c3)&(c4)&(~c5);
   assign err_bit_pos[19] = (c0)&(~c1)&(~c2)&(c3)&(c4)&(~c5);
   assign err_bit_pos[20] = (~c0)&(c1)&(~c2)&(c3)&(c4)&(~c5);
   assign err_bit_pos[21] = (c0)&(c1)&(~c2)&(c3)&(c4)&(~c5);
   assign err_bit_pos[22] = (~c0)&(~c1)&(c2)&(c3)&(c4)&(~c5);
   assign err_bit_pos[23] = (c0)&(~c1)&(c2)&(c3)&(c4)&(~c5);
   assign err_bit_pos[24] = (~c0)&(c1)&(c2)&(c3)&(c4)&(~c5);
   assign err_bit_pos[25] = (c0)&(c1)&(c2)&(c3)&(c4)&(~c5);
   assign err_bit_pos[26] = (c0)&(~c1)&(~c2)&(~c3)&(~c4)&(c5);
   assign err_bit_pos[27] = (~c0)&(c1)&(~c2)&(~c3)&(~c4)&(c5);
   assign err_bit_pos[28] = (c0)&(c1)&(~c2)&(~c3)&(~c4)&(c5);
   assign err_bit_pos[29] = (~c0)&(~c1)&(c2)&(~c3)&(~c4)&(c5);
   assign err_bit_pos[30] = (c0)&(~c1)&(c2)&(~c3)&(~c4)&(c5);
   assign err_bit_pos[31] = (~c0)&(c1)&(c2)&(~c3)&(~c4)&(c5);

   //correct the error bit, it can only correct one error bit.
   
   assign dout = din ^ err_bit_pos;

endmodule // zzecc_sctag_ecc39


////////////////////////////////////////////////////////////////////////////////
//Module Name: zzecc_sctag_pgen_32b
//Function: Generate 7 parity bits for 32bits input data
//

module zzecc_sctag_pgen_32b ( dout, parity, din);

   //Output: 32bit dout and 7bit parity bit
   output[31:0] dout;
   output [6:0] parity;

   //Input: 32bit data din
   input [31:0] din;

   //input data passing through this module
   assign dout = din ;

   //generate parity bits based on the hamming codes
   //the method to generate parity bit is shown as follows
   //1   2  3  4  5  6  7  8  9 10 11 12 13 14  15  16  17  18  19
   //P1 P2 d0 P4 d1 d2 d3 P8 d4 d5 d6 d7 d8 d9 d10 P16 d11 d12 d13 
   //
   // 20  21  22  23  24  25  26  27  28  29  30  31  32  33  34  35 
   //d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 P32 d26 d27 d28
   //
   // 36  37  38       
   //d29 d30 d31
   //For binary numbers B1-B2-B3-B4-B5-B6:
   //B1=1 for (1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39,...)
   //B2=1 for (2,3,6,7,10,11,14,15,18,19,22,23,26,27,30,31,34,35,38,39...)
   //B3=1 for (4,5,6,7,12,13,14,15,20,21,22,23,28,29,30,31,36,37,38,39....)
   //B4=1 for (8,9,10,11,12,13,14,15,24,25,26,27,28,29,30,31,40,41,42,....)
   //B5=1 for (16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,48,49,...)
   //B6=1 for (32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49...)
   //Parity bit P1,P2,P4,P8,P16,P32 can be generated from the above group of
   //bits B1=1,B2=1,B3=1,B4=1,B5=1,B6=1 respectively.

   //use parity[5:0] to stand for P1,P2,P4,P8,P16,P32
   assign parity[0] = (din[0]^din[1])^(din[3]^din[4])^(din[6]^din[8])
                     ^(din[10]^din[11])^(din[13]^din[15])^(din[17]^din[19])
		     ^(din[21]^din[23])^(din[25]^din[26])^(din[28]^din[30]);
   //
   assign parity[1] = (din[0]^din[2])^(din[3]^din[5])^(din[6]^din[9])
                     ^(din[10]^din[12])^(din[13]^din[16])^(din[17]^din[20])
		     ^(din[21]^din[24])^(din[25]^din[27])^(din[28]^din[31]);
   //
   assign parity[2] = (din[1]^din[2])^(din[3]^din[7])^(din[8]^din[9])
                     ^(din[10]^din[14])^(din[15]^din[16])^(din[17]^din[22])
		     ^(din[23]^din[24])^(din[25]^din[29])^(din[30]^din[31]);
   //
   assign parity[3] = (din[4]^din[5])^(din[6]^din[7])^(din[8]^din[9])
                     ^(din[10]^din[18])^(din[19]^din[20])^(din[21]^din[22])
		     ^(din[23]^din[24])^din[25];
   //
   assign parity[4] = (din[11]^din[12])^(din[13]^din[14])^(din[15]^din[16])
                     ^(din[17]^din[18])^(din[19]^din[20])^(din[21]^din[22])
		     ^(din[23]^din[24])^din[25];
   //
   assign parity[5] = (din[26]^din[27])^(din[28]^din[29])^(din[30]^din[31]);

   //the last parity bit is the xor of all 38bits
   //assign parity[6] = (^din)^(^parity[5:0]);
   //it can be further simplified as:
   //din= d0  d1  d2  d3  d4  d5  d6  d7  d8  d9 d10 d11 d12 d13 d14 d15 
   //p0 =  x   x       x   x       x       x       x   x       x       x
   //p1 =  x       x   x       x   x           x   x       x   x
   //p2 =      x   x   x               x   x   x   x               x   x
   //p3 =                  x   x   x   x   x   x   x  
   //p4 =                                              x   x   x   x   x
   //p5 =
   //-------------------------------------------------------------------
   //Total 3   3   3   4   3   3   4   3   4   4   5   3   3   4   3   4 
   //
   //din=d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 d31 
   //p0=       x       x       x       x       x   x       x       x    
   //p1=   x   x           x   x           x   x       x   x           x
   //p2=   x   x                   x   x   x   x               x   x   x
   //p3=           x   x   x   x   x   x   x   x
   //p4=   x   x   x   x   x   x   x   x   x   x
   //p5=                                           x   x   x   x   x   x
   //-------------------------------------------------------------------
   //total 4   5   3   4   4   5   4   5   5   6   3   3   4   3   4   4

   //so total=even number, the corresponding bit will not show up in the
   //final xor tree.
   assign parity[6] =  din[0] ^ din[1]  ^ din[2]  ^ din[4]  ^ din[5] ^ din[7]
		    ^ din[10] ^ din[11] ^ din[12] ^ din[14] ^ din[17]
		    ^ din[18] ^ din[21] ^ din[23] ^ din[24] ^ din[26]
		    ^ din[27] ^ din[29];
   
endmodule // zzecc_sctag_pgen_32b

////////////////////////////////////////////////////////////////////////////////
// 34 bit parity tree

module zzpar34 ( z, d );
   input  [33:0] d;
   output        z;

   assign  z =  d[0]  ^ d[1]  ^ d[2]  ^ d[3]  ^ d[4]  ^ d[5]  ^ d[6]  ^ d[7]
	      ^ d[8]  ^ d[9]  ^ d[10] ^ d[11] ^ d[12] ^ d[13] ^ d[14] ^ d[15]
	      ^ d[16] ^ d[17] ^ d[18] ^ d[19] ^ d[20] ^ d[21] ^ d[22] ^ d[23]
	      ^ d[24] ^ d[25] ^ d[26] ^ d[27] ^ d[28] ^ d[29] ^ d[30] ^ d[31]
	      ^ d[32] ^ d[33]; 

endmodule // zzpar34



////////////////////////////////////////////////////////////////////////////////
// 32 bit parity tree

module zzpar32 ( z, d );
   input  [31:0] d;
   output        z;

   assign  z =  d[0]  ^ d[1]  ^ d[2]  ^ d[3]  ^ d[4]  ^ d[5]  ^ d[6]  ^ d[7]
	      ^ d[8]  ^ d[9]  ^ d[10] ^ d[11] ^ d[12] ^ d[13] ^ d[14] ^ d[15]
	      ^ d[16] ^ d[17] ^ d[18] ^ d[19] ^ d[20] ^ d[21] ^ d[22] ^ d[23]
	      ^ d[24] ^ d[25] ^ d[26] ^ d[27] ^ d[28] ^ d[29] ^ d[30] ^ d[31]; 

endmodule // zzpar32



////////////////////////////////////////////////////////////////////////////////
// 28 bit parity tree

module zzpar28 ( z, d );
   input  [27:0] d;
   output        z;

   assign  z =  d[0]  ^ d[1]  ^ d[2]  ^ d[3]  ^ d[4]  ^ d[5]  ^ d[6]  ^ d[7]
	      ^ d[8]  ^ d[9]  ^ d[10] ^ d[11] ^ d[12] ^ d[13] ^ d[14] ^ d[15]
	      ^ d[16] ^ d[17] ^ d[18] ^ d[19] ^ d[20] ^ d[21] ^ d[22] ^ d[23]
	      ^ d[24] ^ d[25] ^ d[26] ^ d[27]; 

endmodule // zzpar28



////////////////////////////////////////////////////////////////////////////////
// 16 bit parity tree

module zzpar16 ( z, d );
   input  [15:0] d;
   output        z;

   assign z = d[0] ^ d[1] ^ d[2]  ^ d[3]  ^ d[4]  ^ d[5]  ^ d[6]  ^ d[7]
	    ^ d[8] ^ d[9] ^ d[10] ^ d[11] ^ d[12] ^ d[13] ^ d[14] ^ d[15]; 
   
endmodule // zzpar16



////////////////////////////////////////////////////////////////////////////////
// 8 bit parity tree

module zzpar8 ( z, d );
   input  [7:0] d;
   output       z;

   assign  z =  d[0] ^ d[1] ^ d[2] ^ d[3] ^ d[4] ^ d[5] ^ d[6] ^ d[7]; 

endmodule // zzpar8



////////////////////////////////////////////////////////////////////////////////
//    64 -> 6 priority encoder
//    Bit 63 has the highest priority

module zzpenc64 (/*AUTOARG*/
   // Outputs
   z, 
   // Inputs
  a 
   );

   input [63:0] a;
   output [5:0] z;

   integer      i;
   reg  [5:0]   z;

     always @ (a)
     begin
          z = 6'b0;
          for (i=0;i<64;i=i+1)
               if (a[i])
                      z = i;
     end

endmodule // zzpenc64

////////////////////////////////////////////////////////////////////////////////
//    4-bit 60x buffers

module zzbufh_60x4 (/*AUTOARG*/
   // Outputs
   z,
   // Inputs
  a
   );

   input [3:0] a;
   output [3:0] z;

   assign z = a;

endmodule //zzbufh_60x4

// LVT modules added below

module zzadd64_lv ( rs1_data, rs2_data, cin, adder_out, cout32, cout64 );

   input [63:0]  rs1_data;   // 1st input operand
   input [63:0]  rs2_data;   // 2nd input operand
   input         cin;        // carry in

   output [63:0] adder_out;  // result of adder
   output        cout32;     // carry out from lower 32 bit add
   output        cout64;     // carry out from 64 bit add

   assign {cout32, adder_out[31:0]}  = rs1_data[31:0]  + rs2_data[31:0]  + cin;
   assign {cout64, adder_out[63:32]} = rs1_data[63:32] + rs2_data[63:32] + cout32;

endmodule // zzadd64_lv

module zzpar8_lv ( z, d );
   input  [7:0] d;
   output       z;

   assign  z =  d[0] ^ d[1] ^ d[2] ^ d[3] ^ d[4] ^ d[5] ^ d[6] ^ d[7]; 

endmodule // zzpar8_lv


module zzpar32_lv ( z, d );
   input  [31:0] d;
   output        z;

   assign  z =  d[0]  ^ d[1]  ^ d[2]  ^ d[3]  ^ d[4]  ^ d[5]  ^ d[6]  ^ d[7]
              ^ d[8]  ^ d[9]  ^ d[10] ^ d[11] ^ d[12] ^ d[13] ^ d[14] ^ d[15]
              ^ d[16] ^ d[17] ^ d[18] ^ d[19] ^ d[20] ^ d[21] ^ d[22] ^ d[23]
              ^ d[24] ^ d[25] ^ d[26] ^ d[27] ^ d[28] ^ d[29] ^ d[30] ^ d[31];

endmodule // zzpar32_lv



module zznor64_32_lv ( znor64, znor32, a );
  input  [63:0] a;
  output        znor64;
  output        znor32;

  assign znor32 =  ~(a[0]  | a[1]  | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
		   | a[8]  | a[9]  | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]
		   | a[16] | a[17] | a[18] | a[19] | a[20] | a[21] | a[22] | a[23]
		   | a[24] | a[25] | a[26] | a[27] | a[28] | a[29] | a[30] | a[31]); 

  assign znor64 =  ~(a[0]  | a[1]  | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
		   | a[8]  | a[9]  | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]
		   | a[16] | a[17] | a[18] | a[19] | a[20] | a[21] | a[22] | a[23]
		   | a[24] | a[25] | a[26] | a[27] | a[28] | a[29] | a[30] | a[31] 
		   | a[32] | a[33] | a[34] | a[35] | a[36] | a[37] | a[38] | a[39] 
		   | a[40] | a[41] | a[42] | a[43] | a[44] | a[45] | a[46] | a[47] 
		   | a[48] | a[49] | a[50] | a[51] | a[52] | a[53] | a[54] | a[55] 
		   | a[56] | a[57] | a[58] | a[59] | a[60] | a[61] | a[62] | a[63]);

endmodule // zznor64_32_lv

////////////////////////////////////////////////////////////////////////////////
//    64 -> 6 priority encoder
//    Bit 63 has the highest priority
//    LVT version

module zzpenc64_lv (/*AUTOARG*/
   // Outputs
   z,
   // Inputs
  a
   );

   input [63:0] a;
   output [5:0] z;

   integer      i;
   reg  [5:0]   z;

     always @ (a)
     begin
          z = 6'b0;
          for (i=0;i<64;i=i+1)
               if (a[i])
                      z = i;
     end

endmodule // zzpenc64_lv

////////////////////////////////////////////////////////////////////////////////
// 36 bit or gate
// LVT version

module zzor36_lv ( z, a );
  input  [35:0] a;
  output        z;

  assign z =  (a[0]  | a[1]  | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
             | a[8]  | a[9]  | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]
             | a[16] | a[17] | a[18] | a[19] | a[20] | a[21] | a[22] | a[23]
             | a[24] | a[25] | a[26] | a[27] | a[28] | a[29] | a[30] | a[31]
             | a[32] | a[33] | a[34] | a[35]);

endmodule // zzor36_lv

////////////////////////////////////////////////////////////////////////////////
// 34 bit parity tree
// LVT version

module zzpar34_lv ( z, d );
   input  [33:0] d;
   output        z;

   assign  z =  d[0]  ^ d[1]  ^ d[2]  ^ d[3]  ^ d[4]  ^ d[5]  ^ d[6]  ^ d[7]
              ^ d[8]  ^ d[9]  ^ d[10] ^ d[11] ^ d[12] ^ d[13] ^ d[14] ^ d[15]
              ^ d[16] ^ d[17] ^ d[18] ^ d[19] ^ d[20] ^ d[21] ^ d[22] ^ d[23]
              ^ d[24] ^ d[25] ^ d[26] ^ d[27] ^ d[28] ^ d[29] ^ d[30] ^ d[31]
              ^ d[32] ^ d[33];

endmodule // zzpar34_lv


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: mul64.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
/*//////////////////////////////////////////////////////////////////////
//
//  Module Name: mul64
//  Description:        *This block implements the multiplier used in the modular multiplier
//                       unit (MUL) and be shared by sparc EXU and the streaming unit (SPU).
//                       It is also used as the 54x54 multiplier in the FPU.
//                      *It takes two 64-bit unsign data and accumulated operand and do the
//                       64x64 MAC operation at two cycle thruput and 5 cycle latency.
//                      *The mul_valid signal indicate the beginning of a new operation.
//                       It MUST be dis-asserted at the next cycle to have the proper 2-cycle
//                       latency operation in the csa array. If there are two back-to-back
//                       cycle operation, the first operation result will be incorrect.
//                      *Results are avaliable on the 5th cycle of the mul_valid as shows
//
//			*Following inputs should tie to "0" when used as a 64x64 multiplier
//			 - areg 
//			 - accreg 
//			 - x2
//
//                         Cycle-0  | Cycle-1 | Cycle-2 | Cycle-3 | Cycle-4 | Cycle-5
//                       1st        *         |         |         |         |
//                       rs1, rs2   ^         |         |         |         | 1st results
//                       valid=1    | valid=0 |         *         |         | avaliable
//                                1st         | 2nd OP  ^         |         |
//                                setup       | valid=1 |         |         |
//                                            |        2nd        |         |
//                                            |       setup       |         |
//
*/

//PITON_PROTO enables all FPGA related modifications



























































module mul64 (rs1_l, rs2, valid, areg, accreg, x2, out, rclk, si, so, se, mul_rst_l, mul_step);

input  [63:0]  	rs1_l;			// op1
input  [63:0]  	rs2;			// op2
input	       	valid;			// begin of the MUL operation
input  [96:0]  	areg;			// accumulated input for ACCUM
input  [135:129] accreg;		// direct input from ACCUM [135:129]
input	       	x2;			// for op1*op2*2
input	       	rclk, si, se, mul_rst_l, mul_step;
output  	so;
output [135:0] 	out;

wire	       	cyc1, cyc2, cyc3;	// cycle stage of MUL
wire [2:0]	b0, b1, b2,  b3,  b4,  b5,  b6,  b7;
wire [2:0]	b8, b9, b10, b11, b12, b13, b14, b15;
wire	    	b16;
wire [63:0]	op1_l, op1;
wire [81:0]	a0sum, a1sum, a0s, a1s; 
wire [81:4]	a0cout, a1cout, a0c, a1c;
wire		pcoutx2, psumx2;
wire 		x2_c1, x2_c2, x2_c3, x2_c2c3;

wire [98:0]	psum, pcout;
wire [98:30]	pcout_in, pc;
wire [98:31]	psum_in, ps;
wire [96:0]	ary2_cout, addin_cout;
wire [97:0]	ary2_sum,  addin_sum ;
wire		add_cin, addin_cin, add_co31, add_co96;
wire [103:0]	addout;
wire		clk_enb0, clk_enb1;
wire 		rst;
wire		clk;
wire		tm_l;

  assign clk = rclk;
  assign rst = ~mul_rst_l; 
  assign tm_l = ~se;

  clken_buf	ckbuf_0(.clk(clk_enb0), .rclk(clk), .enb_l(~mul_step), .tmb_l(tm_l));

  /////////////////////////////////////////////////////////////////////
  // 	States count
  /////////////////////////////////////////////////////////////////////
  dffr_s  cyc1_dff(.din(valid), .clk(clk_enb0), .q(cyc1), .rst(rst), .se(se), .si(), .so());
  dffr_s  cyc2_dff(.din(cyc1),  .clk(clk_enb0), .q(cyc2), .rst(rst), .se(se), .si(), .so());
  dffr_s  cyc3_dff(.din(cyc2),  .clk(clk_enb0), .q(cyc3), .rst(rst), .se(se), .si(), .so());
  dffr_s  x2c1_dff(.din(x2),    .clk(clk_enb0), .q(x2_c1), .rst(rst), .se(se), .si(), .so());
  dffr_s  x2c2_dff(.din(x2_c1), .clk(clk_enb0), .q(x2_c2), .rst(rst), .se(se), .si(), .so());
  dffr_s  x2c3_dff(.din(x2_c2), .clk(clk_enb0), .q(x2_c3), .rst(rst), .se(se), .si(), .so());

  assign x2_c2c3 =  x2_c2 | x2_c3 ;
	
  /////////////////////////////////////////////////////////////////////
  // 	Enable flops for op1
  /////////////////////////////////////////////////////////////////////
  clken_buf	ckbuf_1(.clk(clk_enb1), .rclk(clk), .enb_l(~(valid & mul_step)), .tmb_l(tm_l));
  dff_s #(64)  	ffrs1  (.din(rs1_l[63:0]), .clk(clk_enb1), .q(op1_l[63:0]),
			.se(se), .si(), .so());




  assign op1[63:0] = ~op1_l[63:0];

  mul_booth	 booth (.head (valid),
			.b_in (rs2),
			.b0   (b0),
			.b1   (b1),
			.b2   (b2),
			.b3   (b3),
			.b4   (b4),
			.b5   (b5),
			.b6   (b6),
			.b7   (b7),
			.b8   (b8),
			.b9   (b9),
			.b10  (b10),
			.b11  (b11),
			.b12  (b12),
			.b13  (b13),
			.b14  (b14),
			.b15  (b15),
			.b16  (b16),
			.clk  (clk), .se(se), .si(), .so(), .mul_step(mul_step), .tm_l(tm_l));
			
  /////////////////////////////////////////////////////////////////////
  // 	Two Array1 inst ary1_a0 & ary1_a1 with the ouput flops 
  /////////////////////////////////////////////////////////////////////
  mul_array1	ary1_a0(.cout (a0cout[81:4]),
			.sum  (a0sum[81:0]),
			.a    (op1),
			.b0   (b0),
			.b1   (b1),
			.b2   (b2),
			.b3   (b3),
			.b4   (b4),
			.b5   (b5),
			.b6   (b6),
			.b7   (b7),
			.b8   (3'b000),
			.head (cyc1),
			.bot  (1'b0)); //array a is never at the bottom of 33-pp rows
 
  dff_s #(78)  a0cot_dff (.din(a0cout[81:4]), .clk(clk_enb0), .q(a0c[81:4]),
			.se(se), .si(), .so());
  dff_s #(82)  a0sum_dff (.din(a0sum[81:0]), .clk(clk_enb0), .q(a0s[81:0]),
			.se(se), .si(), .so());

  mul_array1	ary1_a1(.cout (a1cout[81:4]),
			.sum  (a1sum[81:0]),
			.a    (op1),
			.b0   (b8),
			.b1   (b9),
			.b2   (b10),
			.b3   (b11),
			.b4   (b12),
			.b5   (b13),
			.b6   (b14),
			.b7   (b15),
			.b8   ({1'b0,b16,1'b0}),
			.head (1'b0),	//array b is never at the head of 33-pp rows
			.bot  (cyc2)); 

  dff_s #(78)  a1cot_dff (.din(a1cout[81:4]), .clk(clk_enb0), .q(a1c[81:4]),
			.se(se), .si(), .so());
  dff_s #(82)  a1sum_dff (.din(a1sum[81:0]), .clk(clk_enb0), .q(a1s[81:0]),
			.se(se), .si(), .so());

  /////////////////////////////////////////////////////////////////////
  // 	Array2 with the reorder output mux-flops
  /////////////////////////////////////////////////////////////////////
  mul_array2 	 array2(.pcoutx2 (pcoutx2),
			.psumx2  (psumx2),
			.pcout 	 (pcout[98:0]),
			.psum    (psum[98:0]), 
			.a0c     (a0c[81:4]),
			.a0s     (a0s[81:0]),
			.a1c     (a1c[81:4]),
			.a1s     (a1s[81:0]),
			.pc	 (pc[98:30]),
			.ps	 (ps[98:31]),
			.areg    (areg[96:0]),
			.bot     (cyc3),
			.x2      (x2_c2c3));
 
  //// Outpput re-order muxes and flops	////
  dp_mux2es #(97)  ary2_cmux (.dout(ary2_cout[96:0]),
                              .in0(pcout[96:0]),
                              .in1({pcout[95:0],pcoutx2}),
                              .sel(x2_c2c3));
  dff_s #(97)  a2cot_dff (.din(ary2_cout[96:0]), .clk(clk_enb0), .q(addin_cout[96:0]), 
              		.se(se), .si(), .so());

  dp_mux2es #(98) ary2_smux (.dout(ary2_sum[97:0]),
                             .in0(psum[97:0]),
                             .in1({psum[96:0],psumx2}),
                             .sel(x2_c2c3));
  dff_s #(98)  a2sum_dff (.din(ary2_sum[97:0]), .clk(clk_enb0), .q(addin_sum[97:0]), 
			.se(se), .si(), .so());

  //// Pseudo sum & cout logic and flops ////
  assign psum_in[98:32]  = psum[98:32] & {67{cyc2}} ;
  assign psum_in[31]     = psum[31] & x2_c2 ;

  assign pcout_in[98:31] = pcout[98:31] & {68{cyc2}} ;
  assign pcout_in[30]    = pcout[30] & x2_c2 ;
  
  dff_s #(68)  psum_dff  (.din(psum_in[98:31]), .clk(clk_enb0), .q(ps[98:31]),
                	.se(se), .si(), .so());
  dff_s #(69)  pcout_dff (.din(pcout_in[98:30]), .clk(clk_enb0), .q(pc[98:30]),
            		.se(se), .si(), .so());

  /////////////////////////////////////////////////////////////////////
  // 	Adder (104-bit) 
  /////////////////////////////////////////////////////////////////////

  assign 	add_cin = add_co31 & cyc3 ;

  assign {add_co31,addout[31:0]} =   {{1'b0},addin_sum[31:0]} 
		     		   + {{1'b0},addin_cout[30:0],addin_cin} ;


  assign {add_co96,addout[96:32]} =  addin_sum[97:32]	
				  + addin_cout[96:31]
				  + {{65'b0},add_co31} ;

  assign 	addout[103:97] =  accreg[135:129] + {{6'b0},add_co96} ;

  /////////////////////////////////////////////////////////////////////
  // 	Pipe adder outputs  
  /////////////////////////////////////////////////////////////////////

  dff_s  	      co31_dff (.din(add_cin), .clk(clk_enb0), .q(addin_cin),
       			.se(se), .si(), .so());

  dff_s #(104)   out_dff (.din(addout[103:0]), .clk(clk_enb0), .q(out[135:32]),
              		.se(se), .si(), .so());

  dff_s #(32)    pip_dff (.din(out[63:32]), .clk(clk_enb0), .q(out[31:0]),
               		.se(se), .si(), .so());

endmodule // mul64




////////////////////////////////////////////////////////////////////////
//	Sub-moudle for mul64
////////////////////////////////////////////////////////////////////////

module mul_array1 ( cout, sum, a, b0, b1, b2, b3, b4, b5, b6, b7, b8,
     bot, head );

input  bot, head;
output [81:4]  cout;
output [81:0]  sum;
input [2:0]  b6;
input [2:0]  b3;
input [2:0]  b8;
input [2:0]  b2;
input [2:0]  b1;
input [2:0]  b7;
input [63:0]  a;
input [2:0]  b0;
input [2:0]  b4;
input [2:0]  b5;

// Buses in the design

wire  [1:0]  b5n;
wire  [1:0]  b2n;
wire  [68:1]  c0;
wire  [69:0]  s1;
wire  [68:1]  c1;
wire  [69:0]  s2;
wire  [68:1]  c2;
wire  [70:4]  s_1;
wire  [69:2]  s0;
wire  [76:10]  s_2;
wire  [70:2]  c_1;
wire  [76:10]  c_2;
wire  [75:11]  co;

mul_negen p1n ( .b(b5[2:0]), .n1(b5n[1]), .n0(b5n[0]));
mul_negen p0n ( .b(b2[2:0]), .n1(b2n[1]), .n0(b2n[0]));
mul_csa42  sc3_71_ ( .c(s_2[71]), .cin(co[70]), .a(c_1[70]),
     .b(c_2[70]), .cout(co[71]), .sum(sum[71]), .d(s1[65]),
     .carry(cout[71]));
mul_csa42  sc3_75_ ( .c(s_2[75]), .cin(co[74]), .a(1'b0),
     .b(c_2[74]), .cout(co[75]), .sum(sum[75]), .d(s1[69]),
     .carry(cout[75]));
mul_csa42  sc3_74_ ( .c(s_2[74]), .cin(co[73]), .a(1'b0),
     .b(c_2[73]), .cout(co[74]), .sum(sum[74]), .d(s1[68]),
     .carry(cout[74]));
mul_csa42  sc3_73_ ( .c(s_2[73]), .cin(co[72]), .a(1'b0),
     .b(c_2[72]), .cout(co[73]), .sum(sum[73]), .d(s1[67]),
     .carry(cout[73]));
mul_csa42  sc3_72_ ( .c(s_2[72]), .cin(co[71]), .a(1'b0),
     .b(c_2[71]), .cout(co[72]), .sum(sum[72]), .d(s1[66]),
     .carry(cout[72]));
mul_csa42  sc3_76_ ( .c(s_2[76]), .cin(co[75]), .a(1'b0),
     .b(c_2[75]), .cout(), .sum(sum[76]), .d(1'b0),
     .carry(cout[76]));
mul_csa42  sc3_70_ ( .c(s_2[70]), .cin(co[69]), .a(c_1[69]),
     .b(c_2[69]), .cout(co[70]), .sum(sum[70]), .d(s_1[70]),
     .carry(cout[70]));
mul_csa42  sc3_69_ ( .c(s_2[69]), .cin(co[68]), .a(c_1[68]),
     .b(c_2[68]), .cout(co[69]), .sum(sum[69]), .d(s_1[69]),
     .carry(cout[69]));
mul_csa42  sc3_68_ ( .c(s_2[68]), .cin(co[67]), .a(c_1[67]),
     .b(c_2[67]), .cout(co[68]), .sum(sum[68]), .d(s_1[68]),
     .carry(cout[68]));
mul_csa42  sc3_67_ ( .c(s_2[67]), .cin(co[66]), .a(c_1[66]),
     .b(c_2[66]), .cout(co[67]), .sum(sum[67]), .d(s_1[67]),
     .carry(cout[67]));
mul_csa42  sc3_66_ ( .c(s_2[66]), .cin(co[65]), .a(c_1[65]),
     .b(c_2[65]), .cout(co[66]), .sum(sum[66]), .d(s_1[66]),
     .carry(cout[66]));
mul_csa42  sc3_65_ ( .c(s_2[65]), .cin(co[64]), .a(c_1[64]),
     .b(c_2[64]), .cout(co[65]), .sum(sum[65]), .d(s_1[65]),
     .carry(cout[65]));
mul_csa42  sc3_64_ ( .c(s_2[64]), .cin(co[63]), .a(c_1[63]),
     .b(c_2[63]), .cout(co[64]), .sum(sum[64]), .d(s_1[64]),
     .carry(cout[64]));
mul_csa42  sc3_63_ ( .c(s_2[63]), .cin(co[62]), .a(c_1[62]),
     .b(c_2[62]), .cout(co[63]), .sum(sum[63]), .d(s_1[63]),
     .carry(cout[63]));
mul_csa42  sc3_62_ ( .c(s_2[62]), .cin(co[61]), .a(c_1[61]),
     .b(c_2[61]), .cout(co[62]), .sum(sum[62]), .d(s_1[62]),
     .carry(cout[62]));
mul_csa42  sc3_61_ ( .c(s_2[61]), .cin(co[60]), .a(c_1[60]),
     .b(c_2[60]), .cout(co[61]), .sum(sum[61]), .d(s_1[61]),
     .carry(cout[61]));
mul_csa42  sc3_60_ ( .c(s_2[60]), .cin(co[59]), .a(c_1[59]),
     .b(c_2[59]), .cout(co[60]), .sum(sum[60]), .d(s_1[60]),
     .carry(cout[60]));
mul_csa42  sc3_59_ ( .c(s_2[59]), .cin(co[58]), .a(c_1[58]),
     .b(c_2[58]), .cout(co[59]), .sum(sum[59]), .d(s_1[59]),
     .carry(cout[59]));
mul_csa42  sc3_58_ ( .c(s_2[58]), .cin(co[57]), .a(c_1[57]),
     .b(c_2[57]), .cout(co[58]), .sum(sum[58]), .d(s_1[58]),
     .carry(cout[58]));
mul_csa42  sc3_57_ ( .c(s_2[57]), .cin(co[56]), .a(c_1[56]),
     .b(c_2[56]), .cout(co[57]), .sum(sum[57]), .d(s_1[57]),
     .carry(cout[57]));
mul_csa42  sc3_56_ ( .c(s_2[56]), .cin(co[55]), .a(c_1[55]),
     .b(c_2[55]), .cout(co[56]), .sum(sum[56]), .d(s_1[56]),
     .carry(cout[56]));
mul_csa42  sc3_55_ ( .c(s_2[55]), .cin(co[54]), .a(c_1[54]),
     .b(c_2[54]), .cout(co[55]), .sum(sum[55]), .d(s_1[55]),
     .carry(cout[55]));
mul_csa42  sc3_54_ ( .c(s_2[54]), .cin(co[53]), .a(c_1[53]),
     .b(c_2[53]), .cout(co[54]), .sum(sum[54]), .d(s_1[54]),
     .carry(cout[54]));
mul_csa42  sc3_53_ ( .c(s_2[53]), .cin(co[52]), .a(c_1[52]),
     .b(c_2[52]), .cout(co[53]), .sum(sum[53]), .d(s_1[53]),
     .carry(cout[53]));
mul_csa42  sc3_52_ ( .c(s_2[52]), .cin(co[51]), .a(c_1[51]),
     .b(c_2[51]), .cout(co[52]), .sum(sum[52]), .d(s_1[52]),
     .carry(cout[52]));
mul_csa42  sc3_51_ ( .c(s_2[51]), .cin(co[50]), .a(c_1[50]),
     .b(c_2[50]), .cout(co[51]), .sum(sum[51]), .d(s_1[51]),
     .carry(cout[51]));
mul_csa42  sc3_50_ ( .c(s_2[50]), .cin(co[49]), .a(c_1[49]),
     .b(c_2[49]), .cout(co[50]), .sum(sum[50]), .d(s_1[50]),
     .carry(cout[50]));
mul_csa42  sc3_49_ ( .c(s_2[49]), .cin(co[48]), .a(c_1[48]),
     .b(c_2[48]), .cout(co[49]), .sum(sum[49]), .d(s_1[49]),
     .carry(cout[49]));
mul_csa42  sc3_48_ ( .c(s_2[48]), .cin(co[47]), .a(c_1[47]),
     .b(c_2[47]), .cout(co[48]), .sum(sum[48]), .d(s_1[48]),
     .carry(cout[48]));
mul_csa42  sc3_47_ ( .c(s_2[47]), .cin(co[46]), .a(c_1[46]),
     .b(c_2[46]), .cout(co[47]), .sum(sum[47]), .d(s_1[47]),
     .carry(cout[47]));
mul_csa42  sc3_46_ ( .c(s_2[46]), .cin(co[45]), .a(c_1[45]),
     .b(c_2[45]), .cout(co[46]), .sum(sum[46]), .d(s_1[46]),
     .carry(cout[46]));
mul_csa42  sc3_45_ ( .c(s_2[45]), .cin(co[44]), .a(c_1[44]),
     .b(c_2[44]), .cout(co[45]), .sum(sum[45]), .d(s_1[45]),
     .carry(cout[45]));
mul_csa42  sc3_44_ ( .c(s_2[44]), .cin(co[43]), .a(c_1[43]),
     .b(c_2[43]), .cout(co[44]), .sum(sum[44]), .d(s_1[44]),
     .carry(cout[44]));
mul_csa42  sc3_43_ ( .c(s_2[43]), .cin(co[42]), .a(c_1[42]),
     .b(c_2[42]), .cout(co[43]), .sum(sum[43]), .d(s_1[43]),
     .carry(cout[43]));
mul_csa42  sc3_42_ ( .c(s_2[42]), .cin(co[41]), .a(c_1[41]),
     .b(c_2[41]), .cout(co[42]), .sum(sum[42]), .d(s_1[42]),
     .carry(cout[42]));
mul_csa42  sc3_41_ ( .c(s_2[41]), .cin(co[40]), .a(c_1[40]),
     .b(c_2[40]), .cout(co[41]), .sum(sum[41]), .d(s_1[41]),
     .carry(cout[41]));
mul_csa42  sc3_40_ ( .c(s_2[40]), .cin(co[39]), .a(c_1[39]),
     .b(c_2[39]), .cout(co[40]), .sum(sum[40]), .d(s_1[40]),
     .carry(cout[40]));
mul_csa42  sc3_39_ ( .c(s_2[39]), .cin(co[38]), .a(c_1[38]),
     .b(c_2[38]), .cout(co[39]), .sum(sum[39]), .d(s_1[39]),
     .carry(cout[39]));
mul_csa42  sc3_38_ ( .c(s_2[38]), .cin(co[37]), .a(c_1[37]),
     .b(c_2[37]), .cout(co[38]), .sum(sum[38]), .d(s_1[38]),
     .carry(cout[38]));
mul_csa42  sc3_37_ ( .c(s_2[37]), .cin(co[36]), .a(c_1[36]),
     .b(c_2[36]), .cout(co[37]), .sum(sum[37]), .d(s_1[37]),
     .carry(cout[37]));
mul_csa42  sc3_36_ ( .c(s_2[36]), .cin(co[35]), .a(c_1[35]),
     .b(c_2[35]), .cout(co[36]), .sum(sum[36]), .d(s_1[36]),
     .carry(cout[36]));
mul_csa42  sc3_35_ ( .c(s_2[35]), .cin(co[34]), .a(c_1[34]),
     .b(c_2[34]), .cout(co[35]), .sum(sum[35]), .d(s_1[35]),
     .carry(cout[35]));
mul_csa42  sc3_34_ ( .c(s_2[34]), .cin(co[33]), .a(c_1[33]),
     .b(c_2[33]), .cout(co[34]), .sum(sum[34]), .d(s_1[34]),
     .carry(cout[34]));
mul_csa42  sc3_33_ ( .c(s_2[33]), .cin(co[32]), .a(c_1[32]),
     .b(c_2[32]), .cout(co[33]), .sum(sum[33]), .d(s_1[33]),
     .carry(cout[33]));
mul_csa42  sc3_32_ ( .c(s_2[32]), .cin(co[31]), .a(c_1[31]),
     .b(c_2[31]), .cout(co[32]), .sum(sum[32]), .d(s_1[32]),
     .carry(cout[32]));
mul_csa42  sc3_31_ ( .c(s_2[31]), .cin(co[30]), .a(c_1[30]),
     .b(c_2[30]), .cout(co[31]), .sum(sum[31]), .d(s_1[31]),
     .carry(cout[31]));
mul_csa42  sc3_30_ ( .c(s_2[30]), .cin(co[29]), .a(c_1[29]),
     .b(c_2[29]), .cout(co[30]), .sum(sum[30]), .d(s_1[30]),
     .carry(cout[30]));
mul_csa42  sc3_29_ ( .c(s_2[29]), .cin(co[28]), .a(c_1[28]),
     .b(c_2[28]), .cout(co[29]), .sum(sum[29]), .d(s_1[29]),
     .carry(cout[29]));
mul_csa42  sc3_28_ ( .c(s_2[28]), .cin(co[27]), .a(c_1[27]),
     .b(c_2[27]), .cout(co[28]), .sum(sum[28]), .d(s_1[28]),
     .carry(cout[28]));
mul_csa42  sc3_27_ ( .c(s_2[27]), .cin(co[26]), .a(c_1[26]),
     .b(c_2[26]), .cout(co[27]), .sum(sum[27]), .d(s_1[27]),
     .carry(cout[27]));
mul_csa42  sc3_26_ ( .c(s_2[26]), .cin(co[25]), .a(c_1[25]),
     .b(c_2[25]), .cout(co[26]), .sum(sum[26]), .d(s_1[26]),
     .carry(cout[26]));
mul_csa42  sc3_25_ ( .c(s_2[25]), .cin(co[24]), .a(c_1[24]),
     .b(c_2[24]), .cout(co[25]), .sum(sum[25]), .d(s_1[25]),
     .carry(cout[25]));
mul_csa42  sc3_24_ ( .c(s_2[24]), .cin(co[23]), .a(c_1[23]),
     .b(c_2[23]), .cout(co[24]), .sum(sum[24]), .d(s_1[24]),
     .carry(cout[24]));
mul_csa42  sc3_23_ ( .c(s_2[23]), .cin(co[22]), .a(c_1[22]),
     .b(c_2[22]), .cout(co[23]), .sum(sum[23]), .d(s_1[23]),
     .carry(cout[23]));
mul_csa42  sc3_22_ ( .c(s_2[22]), .cin(co[21]), .a(c_1[21]),
     .b(c_2[21]), .cout(co[22]), .sum(sum[22]), .d(s_1[22]),
     .carry(cout[22]));
mul_csa42  sc3_21_ ( .c(s_2[21]), .cin(co[20]), .a(c_1[20]),
     .b(c_2[20]), .cout(co[21]), .sum(sum[21]), .d(s_1[21]),
     .carry(cout[21]));
mul_csa42  sc3_20_ ( .c(s_2[20]), .cin(co[19]), .a(c_1[19]),
     .b(c_2[19]), .cout(co[20]), .sum(sum[20]), .d(s_1[20]),
     .carry(cout[20]));
mul_csa42  sc3_19_ ( .c(s_2[19]), .cin(co[18]), .a(c_1[18]),
     .b(c_2[18]), .cout(co[19]), .sum(sum[19]), .d(s_1[19]),
     .carry(cout[19]));
mul_csa42  sc3_18_ ( .c(s_2[18]), .cin(co[17]), .a(c_1[17]),
     .b(c_2[17]), .cout(co[18]), .sum(sum[18]), .d(s_1[18]),
     .carry(cout[18]));
mul_csa42  sc3_17_ ( .c(s_2[17]), .cin(co[16]), .a(c_1[16]),
     .b(c_2[16]), .cout(co[17]), .sum(sum[17]), .d(s_1[17]),
     .carry(cout[17]));
mul_csa42  sc3_16_ ( .c(s_2[16]), .cin(co[15]), .a(c_1[15]),
     .b(c_2[15]), .cout(co[16]), .sum(sum[16]), .d(s_1[16]),
     .carry(cout[16]));
mul_csa42  sc3_15_ ( .c(s_2[15]), .cin(co[14]), .a(c_1[14]),
     .b(c_2[14]), .cout(co[15]), .sum(sum[15]), .d(s_1[15]),
     .carry(cout[15]));
mul_csa42  sc3_14_ ( .c(s_2[14]), .cin(co[13]), .a(c_1[13]),
     .b(c_2[13]), .cout(co[14]), .sum(sum[14]), .d(s_1[14]),
     .carry(cout[14]));
mul_csa42  sc3_13_ ( .c(s_2[13]), .cin(co[12]), .a(c_1[12]),
     .b(c_2[12]), .cout(co[13]), .sum(sum[13]), .d(s_1[13]),
     .carry(cout[13]));
mul_csa42  sc3_12_ ( .c(s_2[12]), .cin(co[11]), .a(c_1[11]),
     .b(c_2[11]), .cout(co[12]), .sum(sum[12]), .d(s_1[12]),
     .carry(cout[12]));
mul_csa42  sc3_11_ ( .c(s_2[11]), .cin(1'b0),
     .a(c_1[10]), .b(c_2[10]), .cout(co[11]), .sum(sum[11]),
     .d(s_1[11]), .carry(cout[11]));
mul_csa32  sc2_2_70_ ( .c(c1[63]), .b(c2[57]), .a(s2[58]),
     .cout(c_2[70]), .sum(s_2[70]));
mul_csa32  sc2_2_69_ ( .c(c1[62]), .b(c2[56]), .a(s2[57]),
     .cout(c_2[69]), .sum(s_2[69]));
mul_csa32  sc2_2_68_ ( .c(c1[61]), .b(c2[55]), .a(s2[56]),
     .cout(c_2[68]), .sum(s_2[68]));
mul_csa32  sc2_2_67_ ( .c(c1[60]), .b(c2[54]), .a(s2[55]),
     .cout(c_2[67]), .sum(s_2[67]));
mul_csa32  sc2_2_66_ ( .c(c1[59]), .b(c2[53]), .a(s2[54]),
     .cout(c_2[66]), .sum(s_2[66]));
mul_csa32  sc2_2_65_ ( .c(c1[58]), .b(c2[52]), .a(s2[53]),
     .cout(c_2[65]), .sum(s_2[65]));
mul_csa32  sc2_2_64_ ( .c(c1[57]), .b(c2[51]), .a(s2[52]),
     .cout(c_2[64]), .sum(s_2[64]));
mul_csa32  sc2_2_63_ ( .c(c1[56]), .b(c2[50]), .a(s2[51]),
     .cout(c_2[63]), .sum(s_2[63]));
mul_csa32  sc2_2_62_ ( .c(c1[55]), .b(c2[49]), .a(s2[50]),
     .cout(c_2[62]), .sum(s_2[62]));
mul_csa32  sc2_2_61_ ( .c(c1[54]), .b(c2[48]), .a(s2[49]),
     .cout(c_2[61]), .sum(s_2[61]));
mul_csa32  sc2_2_60_ ( .c(c1[53]), .b(c2[47]), .a(s2[48]),
     .cout(c_2[60]), .sum(s_2[60]));
mul_csa32  sc2_2_59_ ( .c(c1[52]), .b(c2[46]), .a(s2[47]),
     .cout(c_2[59]), .sum(s_2[59]));
mul_csa32  sc2_2_58_ ( .c(c1[51]), .b(c2[45]), .a(s2[46]),
     .cout(c_2[58]), .sum(s_2[58]));
mul_csa32  sc2_2_57_ ( .c(c1[50]), .b(c2[44]), .a(s2[45]),
     .cout(c_2[57]), .sum(s_2[57]));
mul_csa32  sc2_2_56_ ( .c(c1[49]), .b(c2[43]), .a(s2[44]),
     .cout(c_2[56]), .sum(s_2[56]));
mul_csa32  sc2_2_55_ ( .c(c1[48]), .b(c2[42]), .a(s2[43]),
     .cout(c_2[55]), .sum(s_2[55]));
mul_csa32  sc2_2_54_ ( .c(c1[47]), .b(c2[41]), .a(s2[42]),
     .cout(c_2[54]), .sum(s_2[54]));
mul_csa32  sc2_2_53_ ( .c(c1[46]), .b(c2[40]), .a(s2[41]),
     .cout(c_2[53]), .sum(s_2[53]));
mul_csa32  sc2_2_52_ ( .c(c1[45]), .b(c2[39]), .a(s2[40]),
     .cout(c_2[52]), .sum(s_2[52]));
mul_csa32  sc2_2_51_ ( .c(c1[44]), .b(c2[38]), .a(s2[39]),
     .cout(c_2[51]), .sum(s_2[51]));
mul_csa32  sc2_2_50_ ( .c(c1[43]), .b(c2[37]), .a(s2[38]),
     .cout(c_2[50]), .sum(s_2[50]));
mul_csa32  sc2_2_49_ ( .c(c1[42]), .b(c2[36]), .a(s2[37]),
     .cout(c_2[49]), .sum(s_2[49]));
mul_csa32  sc2_2_48_ ( .c(c1[41]), .b(c2[35]), .a(s2[36]),
     .cout(c_2[48]), .sum(s_2[48]));
mul_csa32  sc2_2_47_ ( .c(c1[40]), .b(c2[34]), .a(s2[35]),
     .cout(c_2[47]), .sum(s_2[47]));
mul_csa32  sc2_2_46_ ( .c(c1[39]), .b(c2[33]), .a(s2[34]),
     .cout(c_2[46]), .sum(s_2[46]));
mul_csa32  sc2_2_45_ ( .c(c1[38]), .b(c2[32]), .a(s2[33]),
     .cout(c_2[45]), .sum(s_2[45]));
mul_csa32  sc2_2_44_ ( .c(c1[37]), .b(c2[31]), .a(s2[32]),
     .cout(c_2[44]), .sum(s_2[44]));
mul_csa32  sc2_2_43_ ( .c(c1[36]), .b(c2[30]), .a(s2[31]),
     .cout(c_2[43]), .sum(s_2[43]));
mul_csa32  sc2_2_42_ ( .c(c1[35]), .b(c2[29]), .a(s2[30]),
     .cout(c_2[42]), .sum(s_2[42]));
mul_csa32  sc2_2_41_ ( .c(c1[34]), .b(c2[28]), .a(s2[29]),
     .cout(c_2[41]), .sum(s_2[41]));
mul_csa32  sc2_2_40_ ( .c(c1[33]), .b(c2[27]), .a(s2[28]),
     .cout(c_2[40]), .sum(s_2[40]));
mul_csa32  sc2_2_39_ ( .c(c1[32]), .b(c2[26]), .a(s2[27]),
     .cout(c_2[39]), .sum(s_2[39]));
mul_csa32  sc2_2_38_ ( .c(c1[31]), .b(c2[25]), .a(s2[26]),
     .cout(c_2[38]), .sum(s_2[38]));
mul_csa32  sc2_2_37_ ( .c(c1[30]), .b(c2[24]), .a(s2[25]),
     .cout(c_2[37]), .sum(s_2[37]));
mul_csa32  sc2_2_36_ ( .c(c1[29]), .b(c2[23]), .a(s2[24]),
     .cout(c_2[36]), .sum(s_2[36]));
mul_csa32  sc2_2_35_ ( .c(c1[28]), .b(c2[22]), .a(s2[23]),
     .cout(c_2[35]), .sum(s_2[35]));
mul_csa32  sc2_2_34_ ( .c(c1[27]), .b(c2[21]), .a(s2[22]),
     .cout(c_2[34]), .sum(s_2[34]));
mul_csa32  sc2_2_33_ ( .c(c1[26]), .b(c2[20]), .a(s2[21]),
     .cout(c_2[33]), .sum(s_2[33]));
mul_csa32  sc2_2_32_ ( .c(c1[25]), .b(c2[19]), .a(s2[20]),
     .cout(c_2[32]), .sum(s_2[32]));
mul_csa32  sc2_2_31_ ( .c(c1[24]), .b(c2[18]), .a(s2[19]),
     .cout(c_2[31]), .sum(s_2[31]));
mul_csa32  sc2_2_30_ ( .c(c1[23]), .b(c2[17]), .a(s2[18]),
     .cout(c_2[30]), .sum(s_2[30]));
mul_csa32  sc2_2_29_ ( .c(c1[22]), .b(c2[16]), .a(s2[17]),
     .cout(c_2[29]), .sum(s_2[29]));
mul_csa32  sc2_2_28_ ( .c(c1[21]), .b(c2[15]), .a(s2[16]),
     .cout(c_2[28]), .sum(s_2[28]));
mul_csa32  sc2_2_27_ ( .c(c1[20]), .b(c2[14]), .a(s2[15]),
     .cout(c_2[27]), .sum(s_2[27]));
mul_csa32  sc2_2_26_ ( .c(c1[19]), .b(c2[13]), .a(s2[14]),
     .cout(c_2[26]), .sum(s_2[26]));
mul_csa32  sc2_2_25_ ( .c(c1[18]), .b(c2[12]), .a(s2[13]),
     .cout(c_2[25]), .sum(s_2[25]));
mul_csa32  sc2_2_24_ ( .c(c1[17]), .b(c2[11]), .a(s2[12]),
     .cout(c_2[24]), .sum(s_2[24]));
mul_csa32  sc2_2_23_ ( .c(c1[16]), .b(c2[10]), .a(s2[11]),
     .cout(c_2[23]), .sum(s_2[23]));
mul_csa32  sc2_2_22_ ( .c(c1[15]), .b(c2[9]), .a(s2[10]),
     .cout(c_2[22]), .sum(s_2[22]));
mul_csa32  sc2_2_21_ ( .c(c1[14]), .b(c2[8]), .a(s2[9]),
     .cout(c_2[21]), .sum(s_2[21]));
mul_csa32  sc2_2_20_ ( .c(c1[13]), .b(c2[7]), .a(s2[8]),
     .cout(c_2[20]), .sum(s_2[20]));
mul_csa32  sc2_2_19_ ( .c(c1[12]), .b(c2[6]), .a(s2[7]),
     .cout(c_2[19]), .sum(s_2[19]));
mul_csa32  sc2_2_18_ ( .c(c1[11]), .b(c2[5]), .a(s2[6]),
     .cout(c_2[18]), .sum(s_2[18]));
mul_csa32  sc2_2_17_ ( .c(c1[10]), .b(c2[4]), .a(s2[5]),
     .cout(c_2[17]), .sum(s_2[17]));
mul_csa32  sc2_2_16_ ( .c(c1[9]), .b(c2[3]), .a(s2[4]),
     .cout(c_2[16]), .sum(s_2[16]));
mul_csa32  sc2_2_15_ ( .c(c1[8]), .b(c2[2]), .a(s2[3]),
     .cout(c_2[15]), .sum(s_2[15]));
mul_csa32  sc2_2_14_ ( .c(c1[7]), .b(c2[1]), .a(s2[2]),
     .cout(c_2[14]), .sum(s_2[14]));
mul_csa32  sc2_2_13_ ( .c(c1[6]), .b(s1[7]), .a(s2[1]),
     .cout(c_2[13]), .sum(s_2[13]));
mul_csa32  sc2_2_12_ ( .c(c1[5]), .b(s1[6]), .a(s2[0]),
     .cout(c_2[12]), .sum(s_2[12]));
mul_csa32  sc2_2_11_ ( .c(c1[4]), .b(s1[5]), .a(b5n[1]),
     .cout(c_2[11]), .sum(s_2[11]));
mul_csa32  sc2_2_10_ ( .c(c1[3]), .b(s1[4]), .a(b5n[0]),
     .cout(c_2[10]), .sum(s_2[10]));
mul_csa32  sc2_2_76_ ( .c(1'b1), .b(c2[63]), .a(s2[64]),
     .cout(c_2[76]), .sum(s_2[76]));
mul_csa32  sc2_2_77_ ( .c(c_2[76]), .b(c2[64]), .a(s2[65]),
     .cout(cout[77]), .sum(sum[77]));
mul_csa32  sc2_1_9_ ( .c(s1[3]), .b(c0[8]), .a(s0[9]), .cout(c_1[9]),
     .sum(s_1[9]));
mul_csa32  sc2_1_8_ ( .c(s1[2]), .b(c0[7]), .a(s0[8]), .cout(c_1[8]),
     .sum(s_1[8]));
mul_csa32  sc2_1_3_ ( .c(c_1[2]), .b(c0[2]), .a(s0[3]),
     .cout(c_1[3]), .sum(sum[3]));
mul_csa32  sc3_10_ ( .c(s_2[10]), .b(s_1[10]), .a(c_1[9]),
     .cout(cout[10]), .sum(sum[10]));
mul_csa32  sc3_9_ ( .c(c1[2]), .sum(sum[9]), .cout(cout[9]),
     .a(c_1[8]), .b(s_1[9]));
mul_csa32  sc3_8_ ( .c(c1[1]), .sum(sum[8]), .cout(cout[8]),
     .a(c_1[7]), .b(s_1[8]));
mul_csa32  sc2_2_71_ ( .c(c1[64]), .b(c2[58]), .a(s2[59]),
     .cout(c_2[71]), .sum(s_2[71]));
mul_csa32  sc2_2_75_ ( .c(c1[68]), .b(c2[62]), .a(s2[63]),
     .cout(c_2[75]), .sum(s_2[75]));
mul_csa32  sc2_2_74_ ( .c(c1[67]), .b(c2[61]), .a(s2[62]),
     .cout(c_2[74]), .sum(s_2[74]));
mul_csa32  sc2_2_73_ ( .c(c1[66]), .b(c2[60]), .a(s2[61]),
     .cout(c_2[73]), .sum(s_2[73]));
mul_csa32  sc2_2_72_ ( .c(c1[65]), .b(c2[59]), .a(s2[60]),
     .cout(c_2[72]), .sum(s_2[72]));
mul_csa32  sc2_1_69_ ( .c(s1[63]), .sum(s_1[69]), .cout(c_1[69]),
     .a(s0[69]), .b(c0[68]));
mul_csa32  sc2_1_68_ ( .c(s1[62]), .sum(s_1[68]), .cout(c_1[68]),
     .a(s0[68]), .b(c0[67]));
mul_csa32  sc2_1_67_ ( .c(s1[61]), .sum(s_1[67]), .cout(c_1[67]),
     .a(s0[67]), .b(c0[66]));
mul_csa32  sc2_1_66_ ( .c(s1[60]), .sum(s_1[66]), .cout(c_1[66]),
     .a(s0[66]), .b(c0[65]));
mul_csa32  sc2_1_65_ ( .c(s1[59]), .sum(s_1[65]), .cout(c_1[65]),
     .a(s0[65]), .b(c0[64]));
mul_csa32  sc2_1_64_ ( .c(s1[58]), .sum(s_1[64]), .cout(c_1[64]),
     .a(s0[64]), .b(c0[63]));
mul_csa32  sc2_1_63_ ( .c(s1[57]), .sum(s_1[63]), .cout(c_1[63]),
     .a(s0[63]), .b(c0[62]));
mul_csa32  sc2_1_62_ ( .c(s1[56]), .sum(s_1[62]), .cout(c_1[62]),
     .a(s0[62]), .b(c0[61]));
mul_csa32  sc2_1_61_ ( .c(s1[55]), .sum(s_1[61]), .cout(c_1[61]),
     .a(s0[61]), .b(c0[60]));
mul_csa32  sc2_1_60_ ( .c(s1[54]), .sum(s_1[60]), .cout(c_1[60]),
     .a(s0[60]), .b(c0[59]));
mul_csa32  sc2_1_59_ ( .c(s1[53]), .sum(s_1[59]), .cout(c_1[59]),
     .a(s0[59]), .b(c0[58]));
mul_csa32  sc2_1_58_ ( .c(s1[52]), .sum(s_1[58]), .cout(c_1[58]),
     .a(s0[58]), .b(c0[57]));
mul_csa32  sc2_1_57_ ( .c(s1[51]), .sum(s_1[57]), .cout(c_1[57]),
     .a(s0[57]), .b(c0[56]));
mul_csa32  sc2_1_56_ ( .c(s1[50]), .sum(s_1[56]), .cout(c_1[56]),
     .a(s0[56]), .b(c0[55]));
mul_csa32  sc2_1_55_ ( .c(s1[49]), .sum(s_1[55]), .cout(c_1[55]),
     .a(s0[55]), .b(c0[54]));
mul_csa32  sc2_1_54_ ( .c(s1[48]), .sum(s_1[54]), .cout(c_1[54]),
     .a(s0[54]), .b(c0[53]));
mul_csa32  sc2_1_53_ ( .c(s1[47]), .sum(s_1[53]), .cout(c_1[53]),
     .a(s0[53]), .b(c0[52]));
mul_csa32  sc2_1_52_ ( .c(s1[46]), .sum(s_1[52]), .cout(c_1[52]),
     .a(s0[52]), .b(c0[51]));
mul_csa32  sc2_1_51_ ( .c(s1[45]), .sum(s_1[51]), .cout(c_1[51]),
     .a(s0[51]), .b(c0[50]));
mul_csa32  sc2_1_50_ ( .c(s1[44]), .sum(s_1[50]), .cout(c_1[50]),
     .a(s0[50]), .b(c0[49]));
mul_csa32  sc2_1_49_ ( .c(s1[43]), .sum(s_1[49]), .cout(c_1[49]),
     .a(s0[49]), .b(c0[48]));
mul_csa32  sc2_1_48_ ( .c(s1[42]), .sum(s_1[48]), .cout(c_1[48]),
     .a(s0[48]), .b(c0[47]));
mul_csa32  sc2_1_47_ ( .c(s1[41]), .sum(s_1[47]), .cout(c_1[47]),
     .a(s0[47]), .b(c0[46]));
mul_csa32  sc2_1_46_ ( .c(s1[40]), .sum(s_1[46]), .cout(c_1[46]),
     .a(s0[46]), .b(c0[45]));
mul_csa32  sc2_1_45_ ( .c(s1[39]), .sum(s_1[45]), .cout(c_1[45]),
     .a(s0[45]), .b(c0[44]));
mul_csa32  sc2_1_44_ ( .c(s1[38]), .sum(s_1[44]), .cout(c_1[44]),
     .a(s0[44]), .b(c0[43]));
mul_csa32  sc2_1_43_ ( .c(s1[37]), .sum(s_1[43]), .cout(c_1[43]),
     .a(s0[43]), .b(c0[42]));
mul_csa32  sc2_1_42_ ( .c(s1[36]), .sum(s_1[42]), .cout(c_1[42]),
     .a(s0[42]), .b(c0[41]));
mul_csa32  sc2_1_41_ ( .c(s1[35]), .sum(s_1[41]), .cout(c_1[41]),
     .a(s0[41]), .b(c0[40]));
mul_csa32  sc2_1_40_ ( .c(s1[34]), .sum(s_1[40]), .cout(c_1[40]),
     .a(s0[40]), .b(c0[39]));
mul_csa32  sc2_1_39_ ( .c(s1[33]), .sum(s_1[39]), .cout(c_1[39]),
     .a(s0[39]), .b(c0[38]));
mul_csa32  sc2_1_38_ ( .c(s1[32]), .sum(s_1[38]), .cout(c_1[38]),
     .a(s0[38]), .b(c0[37]));
mul_csa32  sc2_1_37_ ( .c(s1[31]), .sum(s_1[37]), .cout(c_1[37]),
     .a(s0[37]), .b(c0[36]));
mul_csa32  sc2_1_36_ ( .c(s1[30]), .sum(s_1[36]), .cout(c_1[36]),
     .a(s0[36]), .b(c0[35]));
mul_csa32  sc2_1_35_ ( .c(s1[29]), .sum(s_1[35]), .cout(c_1[35]),
     .a(s0[35]), .b(c0[34]));
mul_csa32  sc2_1_34_ ( .c(s1[28]), .sum(s_1[34]), .cout(c_1[34]),
     .a(s0[34]), .b(c0[33]));
mul_csa32  sc2_1_33_ ( .c(s1[27]), .sum(s_1[33]), .cout(c_1[33]),
     .a(s0[33]), .b(c0[32]));
mul_csa32  sc2_1_32_ ( .c(s1[26]), .sum(s_1[32]), .cout(c_1[32]),
     .a(s0[32]), .b(c0[31]));
mul_csa32  sc2_1_31_ ( .c(s1[25]), .sum(s_1[31]), .cout(c_1[31]),
     .a(s0[31]), .b(c0[30]));
mul_csa32  sc2_1_30_ ( .c(s1[24]), .sum(s_1[30]), .cout(c_1[30]),
     .a(s0[30]), .b(c0[29]));
mul_csa32  sc2_1_29_ ( .c(s1[23]), .sum(s_1[29]), .cout(c_1[29]),
     .a(s0[29]), .b(c0[28]));
mul_csa32  sc2_1_28_ ( .c(s1[22]), .sum(s_1[28]), .cout(c_1[28]),
     .a(s0[28]), .b(c0[27]));
mul_csa32  sc2_1_27_ ( .c(s1[21]), .sum(s_1[27]), .cout(c_1[27]),
     .a(s0[27]), .b(c0[26]));
mul_csa32  sc2_1_26_ ( .c(s1[20]), .sum(s_1[26]), .cout(c_1[26]),
     .a(s0[26]), .b(c0[25]));
mul_csa32  sc2_1_25_ ( .c(s1[19]), .sum(s_1[25]), .cout(c_1[25]),
     .a(s0[25]), .b(c0[24]));
mul_csa32  sc2_1_24_ ( .c(s1[18]), .sum(s_1[24]), .cout(c_1[24]),
     .a(s0[24]), .b(c0[23]));
mul_csa32  sc2_1_23_ ( .c(s1[17]), .sum(s_1[23]), .cout(c_1[23]),
     .a(s0[23]), .b(c0[22]));
mul_csa32  sc2_1_22_ ( .c(s1[16]), .sum(s_1[22]), .cout(c_1[22]),
     .a(s0[22]), .b(c0[21]));
mul_csa32  sc2_1_21_ ( .c(s1[15]), .sum(s_1[21]), .cout(c_1[21]),
     .a(s0[21]), .b(c0[20]));
mul_csa32  sc2_1_20_ ( .c(s1[14]), .sum(s_1[20]), .cout(c_1[20]),
     .a(s0[20]), .b(c0[19]));
mul_csa32  sc2_1_19_ ( .c(s1[13]), .sum(s_1[19]), .cout(c_1[19]),
     .a(s0[19]), .b(c0[18]));
mul_csa32  sc2_1_18_ ( .c(s1[12]), .sum(s_1[18]), .cout(c_1[18]),
     .a(s0[18]), .b(c0[17]));
mul_csa32  sc2_1_17_ ( .c(s1[11]), .sum(s_1[17]), .cout(c_1[17]),
     .a(s0[17]), .b(c0[16]));
mul_csa32  sc2_1_16_ ( .c(s1[10]), .sum(s_1[16]), .cout(c_1[16]),
     .a(s0[16]), .b(c0[15]));
mul_csa32  sc2_1_15_ ( .c(s1[9]), .sum(s_1[15]), .cout(c_1[15]),
     .a(s0[15]), .b(c0[14]));
mul_csa32  sc2_1_14_ ( .c(s1[8]), .sum(s_1[14]), .cout(c_1[14]),
     .a(s0[14]), .b(c0[13]));
mul_csa32  sc2_1_7_ ( .c(s1[1]), .b(c0[6]), .a(s0[7]), .cout(c_1[7]),
     .sum(s_1[7]));
mul_csa32  sc2_1_6_ ( .c(s1[0]), .b(c0[5]), .a(s0[6]), .cout(c_1[6]),
     .sum(s_1[6]));
mul_csa32  sc2_1_5_ ( .c(b2n[1]), .b(c0[4]), .a(s0[5]),
     .cout(c_1[5]), .sum(s_1[5]));
mul_csa32  sc2_1_4_ ( .c(b2n[0]), .b(c0[3]), .a(s0[4]),
     .cout(c_1[4]), .sum(s_1[4]));
mul_ha sc2_1_10_ ( .sum(s_1[10]), .cout(c_1[10]), .a(s0[10]),
     .b(c0[9]));
mul_ha sc3_7_ ( .sum(sum[7]), .cout(cout[7]), .a(c_1[6]),
     .b(s_1[7]));
mul_ha sc3_6_ ( .sum(sum[6]), .cout(cout[6]), .a(c_1[5]),
     .b(s_1[6]));
mul_ha sc3_5_ ( .sum(sum[5]), .cout(cout[5]), .a(c_1[4]),
     .b(s_1[5]));
mul_ha sc3_4_ ( .sum(sum[4]), .cout(cout[4]), .a(c_1[3]),
     .b(s_1[4]));
mul_ha sc2_2_81_ ( .sum(sum[81]), .cout(cout[81]), .a(s2[69]),
     .b(c2[68]));
mul_ha sc2_2_80_ ( .sum(sum[80]), .cout(cout[80]), .a(s2[68]),
     .b(c2[67]));
mul_ha sc2_2_79_ ( .sum(sum[79]), .cout(cout[79]), .a(s2[67]),
     .b(c2[66]));
mul_ha sc2_2_78_ ( .sum(sum[78]), .cout(cout[78]), .a(s2[66]),
     .b(c2[65]));
mul_ha sc2_1_70_ ( .sum(s_1[70]), .cout(c_1[70]),
     .a(1'b1), .b(s1[64]));
mul_ha sc2_1_2_ ( .sum(sum[2]), .cout(c_1[2]), .a(s0[2]), .b(c0[1]));
mul_ha sc2_1_13_ ( .sum(s_1[13]), .cout(c_1[13]), .a(s0[13]),
     .b(c0[12]));
mul_ha sc2_1_12_ ( .sum(s_1[12]), .cout(c_1[12]), .a(s0[12]),
     .b(c0[11]));
mul_ha sc2_1_11_ ( .sum(s_1[11]), .cout(c_1[11]), .a(s0[11]),
     .b(c0[10]));
mul_ppgenrow3 I2 ( .head(1'b0), .bot(bot), .b2(b8[2:0]),
     .b1(b7[2:0]), .b0(b6[2:0]), .a(a[63:0]), .sum(s2[69:0]),
     .cout(c2[68:1]));
mul_ppgenrow3 I1 ( .head(1'b0), .bot(1'b1),
     .b2(b5[2:0]), .b1(b4[2:0]), .b0(b3[2:0]), .a(a[63:0]),
     .sum(s1[69:0]), .cout(c1[68:1]));
mul_ppgenrow3 I0 ( .head(head), .bot(1'b1), .b2(b2[2:0]),
     .b1(b1[2:0]), .b0(b0[2:0]), .a(a[63:0]), .sum({s0[69:2],
     sum[1:0]}), .cout(c0[68:1]));

endmodule // mul_array1

module mul_array2 ( pcout, pcoutx2, psum, psumx2, a0c, a0s, a1c, a1s,
     areg, bot, pc, ps, x2 );

output  pcoutx2, psumx2;
input  bot, x2;
output [98:0]  psum;
output [98:0]  pcout;
input [81:4]  a1c;
input [98:30]  pc;
input [98:31]  ps;
input [81:0]  a0s;
input [96:0]  areg;
input [81:0]  a1s;
input [81:4]  a0c;

// Buses in the design
wire  [81:15]  s3;
wire  [81:15]  c3;
wire  [96:0]  ain;
wire  [67:20]  co;
wire  [82:0]  s1;
wire  [96:0]  c2;
wire  [82:0]  c1;
wire  [96:0]  s2;
wire	      ainx2, s1x2, c1x2;

mul_mux2 sh_82_ ( .d1(areg[83]), .z(ain[82]), .d0(areg[82]), .s(x2));
mul_mux2 sh_68_ ( .d1(areg[69]), .z(ain[68]), .d0(areg[68]), .s(x2));
mul_mux2 sh_67_ ( .d1(areg[68]), .z(ain[67]), .d0(areg[67]), .s(x2));
mul_mux2 sh_66_ ( .d1(areg[67]), .z(ain[66]), .d0(areg[66]), .s(x2));
mul_mux2 sh_65_ ( .d1(areg[66]), .z(ain[65]), .d0(areg[65]), .s(x2));
mul_mux2 sh_64_ ( .d1(areg[65]), .z(ain[64]), .d0(areg[64]), .s(x2));
mul_mux2 sh_63_ ( .d1(areg[64]), .z(ain[63]), .d0(areg[63]), .s(x2));
mul_mux2 sh_62_ ( .d1(areg[63]), .z(ain[62]), .d0(areg[62]), .s(x2));
mul_mux2 sh_61_ ( .d1(areg[62]), .z(ain[61]), .d0(areg[61]), .s(x2));
mul_mux2 sh_60_ ( .d1(areg[61]), .z(ain[60]), .d0(areg[60]), .s(x2));
mul_mux2 sh_59_ ( .d1(areg[60]), .z(ain[59]), .d0(areg[59]), .s(x2));
mul_mux2 sh_58_ ( .d1(areg[59]), .z(ain[58]), .d0(areg[58]), .s(x2));
mul_mux2 sh_57_ ( .d1(areg[58]), .z(ain[57]), .d0(areg[57]), .s(x2));
mul_mux2 sh_56_ ( .d1(areg[57]), .z(ain[56]), .d0(areg[56]), .s(x2));
mul_mux2 sh_55_ ( .d1(areg[56]), .z(ain[55]), .d0(areg[55]), .s(x2));
mul_mux2 sh_54_ ( .d1(areg[55]), .z(ain[54]), .d0(areg[54]), .s(x2));
mul_mux2 sh_53_ ( .d1(areg[54]), .z(ain[53]), .d0(areg[53]), .s(x2));
mul_mux2 sh_52_ ( .d1(areg[53]), .z(ain[52]), .d0(areg[52]), .s(x2));
mul_mux2 sh_51_ ( .d1(areg[52]), .z(ain[51]), .d0(areg[51]), .s(x2));
mul_mux2 sh_50_ ( .d1(areg[51]), .z(ain[50]), .d0(areg[50]), .s(x2));
mul_mux2 sh_49_ ( .d1(areg[50]), .z(ain[49]), .d0(areg[49]), .s(x2));
mul_mux2 sh_48_ ( .d1(areg[49]), .z(ain[48]), .d0(areg[48]), .s(x2));
mul_mux2 sh_47_ ( .d1(areg[48]), .z(ain[47]), .d0(areg[47]), .s(x2));
mul_mux2 sh_46_ ( .d1(areg[47]), .z(ain[46]), .d0(areg[46]), .s(x2));
mul_mux2 sh_45_ ( .d1(areg[46]), .z(ain[45]), .d0(areg[45]), .s(x2));
mul_mux2 sh_44_ ( .d1(areg[45]), .z(ain[44]), .d0(areg[44]), .s(x2));
mul_mux2 sh_43_ ( .d1(areg[44]), .z(ain[43]), .d0(areg[43]), .s(x2));
mul_mux2 sh_42_ ( .d1(areg[43]), .z(ain[42]), .d0(areg[42]), .s(x2));
mul_mux2 sh_41_ ( .d1(areg[42]), .z(ain[41]), .d0(areg[41]), .s(x2));
mul_mux2 sh_40_ ( .d1(areg[41]), .z(ain[40]), .d0(areg[40]), .s(x2));
mul_mux2 sh_39_ ( .d1(areg[40]), .z(ain[39]), .d0(areg[39]), .s(x2));
mul_mux2 sh_38_ ( .d1(areg[39]), .z(ain[38]), .d0(areg[38]), .s(x2));
mul_mux2 sh_37_ ( .d1(areg[38]), .z(ain[37]), .d0(areg[37]), .s(x2));
mul_mux2 sh_36_ ( .d1(areg[37]), .z(ain[36]), .d0(areg[36]), .s(x2));
mul_mux2 sh_35_ ( .d1(areg[36]), .z(ain[35]), .d0(areg[35]), .s(x2));
mul_mux2 sh_34_ ( .d1(areg[35]), .z(ain[34]), .d0(areg[34]), .s(x2));
mul_mux2 sh_33_ ( .d1(areg[34]), .z(ain[33]), .d0(areg[33]), .s(x2));
mul_mux2 sh_32_ ( .d1(areg[33]), .z(ain[32]), .d0(areg[32]), .s(x2));
mul_mux2 sh_31_ ( .d1(areg[32]), .z(ain[31]), .d0(areg[31]), .s(x2));
mul_mux2 sh_30_ ( .d1(areg[31]), .z(ain[30]), .d0(areg[30]), .s(x2));
mul_mux2 sh_29_ ( .d1(areg[30]), .z(ain[29]), .d0(areg[29]), .s(x2));
mul_mux2 sh_28_ ( .d1(areg[29]), .z(ain[28]), .d0(areg[28]), .s(x2));
mul_mux2 sh_27_ ( .d1(areg[28]), .z(ain[27]), .d0(areg[27]), .s(x2));
mul_mux2 sh_26_ ( .d1(areg[27]), .z(ain[26]), .d0(areg[26]), .s(x2));
mul_mux2 sh_25_ ( .d1(areg[26]), .z(ain[25]), .d0(areg[25]), .s(x2));
mul_mux2 sh_24_ ( .d1(areg[25]), .z(ain[24]), .d0(areg[24]), .s(x2));
mul_mux2 sh_23_ ( .d1(areg[24]), .z(ain[23]), .d0(areg[23]), .s(x2));
mul_mux2 sh_22_ ( .d1(areg[23]), .z(ain[22]), .d0(areg[22]), .s(x2));
mul_mux2 sh_21_ ( .d1(areg[22]), .z(ain[21]), .d0(areg[21]), .s(x2));
mul_mux2 sh_20_ ( .d1(areg[21]), .z(ain[20]), .d0(areg[20]), .s(x2));
mul_mux2 sh_96_ ( .d1(1'b0), .z(ain[96]), .d0(areg[96]),
     .s(x2));
mul_mux2 sh_95_ ( .d1(areg[96]), .z(ain[95]), .d0(areg[95]), .s(x2));
mul_mux2 sh_94_ ( .d1(areg[95]), .z(ain[94]), .d0(areg[94]), .s(x2));
mul_mux2 sh_93_ ( .d1(areg[94]), .z(ain[93]), .d0(areg[93]), .s(x2));
mul_mux2 sh_92_ ( .d1(areg[93]), .z(ain[92]), .d0(areg[92]), .s(x2));
mul_mux2 sh_91_ ( .d1(areg[92]), .z(ain[91]), .d0(areg[91]), .s(x2));
mul_mux2 sh_90_ ( .d1(areg[91]), .z(ain[90]), .d0(areg[90]), .s(x2));
mul_mux2 sh_89_ ( .d1(areg[90]), .z(ain[89]), .d0(areg[89]), .s(x2));
mul_mux2 sh_88_ ( .d1(areg[89]), .z(ain[88]), .d0(areg[88]), .s(x2));
mul_mux2 sh_87_ ( .d1(areg[88]), .z(ain[87]), .d0(areg[87]), .s(x2));
mul_mux2 sh_86_ ( .d1(areg[87]), .z(ain[86]), .d0(areg[86]), .s(x2));
mul_mux2 sh_85_ ( .d1(areg[86]), .z(ain[85]), .d0(areg[85]), .s(x2));
mul_mux2 sh_84_ ( .d1(areg[85]), .z(ain[84]), .d0(areg[84]), .s(x2));
mul_mux2 sh_0_ ( .d1(areg[1]), .z(ain[0]), .d0(areg[0]), .s(x2));
mul_mux2 sh_81_ ( .d1(areg[82]), .z(ain[81]), .d0(areg[81]), .s(x2));
mul_mux2 sh_80_ ( .d1(areg[81]), .z(ain[80]), .d0(areg[80]), .s(x2));
mul_mux2 sh_79_ ( .d1(areg[80]), .z(ain[79]), .d0(areg[79]), .s(x2));
mul_mux2 sh_78_ ( .d1(areg[79]), .z(ain[78]), .d0(areg[78]), .s(x2));
mul_mux2 sh_77_ ( .d1(areg[78]), .z(ain[77]), .d0(areg[77]), .s(x2));
mul_mux2 sh_76_ ( .d1(areg[77]), .z(ain[76]), .d0(areg[76]), .s(x2));
mul_mux2 sh_75_ ( .d1(areg[76]), .z(ain[75]), .d0(areg[75]), .s(x2));
mul_mux2 sh_74_ ( .d1(areg[75]), .z(ain[74]), .d0(areg[74]), .s(x2));
mul_mux2 sh_73_ ( .d1(areg[74]), .z(ain[73]), .d0(areg[73]), .s(x2));
mul_mux2 sh_72_ ( .d1(areg[73]), .z(ain[72]), .d0(areg[72]), .s(x2));
mul_mux2 sh_71_ ( .d1(areg[72]), .z(ain[71]), .d0(areg[71]), .s(x2));
mul_mux2 sh_70_ ( .d1(areg[71]), .z(ain[70]), .d0(areg[70]), .s(x2));
mul_mux2 sh_69_ ( .d1(areg[70]), .z(ain[69]), .d0(areg[69]), .s(x2));
mul_mux2 sh_19_ ( .d1(areg[20]), .z(ain[19]), .d0(areg[19]), .s(x2));
mul_mux2 sh_18_ ( .d1(areg[19]), .z(ain[18]), .d0(areg[18]), .s(x2));
mul_mux2 sh_17_ ( .d1(areg[18]), .z(ain[17]), .d0(areg[17]), .s(x2));
mul_mux2 sh_16_ ( .d1(areg[17]), .z(ain[16]), .d0(areg[16]), .s(x2));
mul_mux2 sh_15_ ( .d1(areg[16]), .z(ain[15]), .d0(areg[15]), .s(x2));
mul_mux2 sh_4_ ( .d1(areg[5]), .z(ain[4]), .d0(areg[4]), .s(x2));
mul_mux2 sh_3_ ( .d1(areg[4]), .z(ain[3]), .d0(areg[3]), .s(x2));
mul_mux2 sh_2_ ( .d1(areg[3]), .z(ain[2]), .d0(areg[2]), .s(x2));
mul_mux2 sh_1_ ( .d1(areg[2]), .z(ain[1]), .d0(areg[1]), .s(x2));
mul_mux2 shx2 ( .d1(areg[0]), .z(ainx2), .d0(1'b0),
     .s(x2));
mul_mux2 sh_83_ ( .d1(areg[84]), .z(ain[83]), .d0(areg[83]), .s(x2));
mul_mux2 sh_14_ ( .d1(areg[15]), .z(ain[14]), .d0(areg[14]), .s(x2));
mul_mux2 sh_13_ ( .d1(areg[14]), .z(ain[13]), .d0(areg[13]), .s(x2));
mul_mux2 sh_12_ ( .d1(areg[13]), .z(ain[12]), .d0(areg[12]), .s(x2));
mul_mux2 sh_11_ ( .d1(areg[12]), .z(ain[11]), .d0(areg[11]), .s(x2));
mul_mux2 sh_10_ ( .d1(areg[11]), .z(ain[10]), .d0(areg[10]), .s(x2));
mul_mux2 sh_9_ ( .d1(areg[10]), .z(ain[9]), .d0(areg[9]), .s(x2));
mul_mux2 sh_8_ ( .d1(areg[9]), .z(ain[8]), .d0(areg[8]), .s(x2));
mul_mux2 sh_7_ ( .d1(areg[8]), .z(ain[7]), .d0(areg[7]), .s(x2));
mul_mux2 sh_6_ ( .d1(areg[7]), .z(ain[6]), .d0(areg[6]), .s(x2));
mul_mux2 sh_5_ ( .d1(areg[6]), .z(ain[5]), .d0(areg[5]), .s(x2));
mul_csa42  sc3_68_ ( .cin(co[67]), .d(1'b0),
     .carry(c3[68]), .c(c2[67]), .b(s2[68]), .a(1'b0),
     .cout(), .sum(s3[68]));
mul_csa42  sc3_67_ ( .cin(co[66]), .d(1'b0),
     .carry(c3[67]), .c(c2[66]), .b(s2[67]), .a(s1[67]), .cout(co[67]),
     .sum(s3[67]));
mul_csa42  sc3_66_ ( .cin(co[65]), .d(c1[65]), .carry(c3[66]),
     .c(c2[65]), .b(s2[66]), .a(s1[66]), .cout(co[66]), .sum(s3[66]));
mul_csa42  sc3_65_ ( .cin(co[64]), .d(c1[64]), .carry(c3[65]),
     .c(c2[64]), .b(s2[65]), .a(s1[65]), .cout(co[65]), .sum(s3[65]));
mul_csa42  sc3_64_ ( .cin(co[63]), .d(c1[63]), .carry(c3[64]),
     .c(c2[63]), .b(s2[64]), .a(s1[64]), .cout(co[64]), .sum(s3[64]));
mul_csa42  sc3_63_ ( .cin(co[62]), .d(c1[62]), .carry(c3[63]),
     .c(c2[62]), .b(s2[63]), .a(s1[63]), .cout(co[63]), .sum(s3[63]));
mul_csa42  sc3_62_ ( .cin(co[61]), .d(c1[61]), .carry(c3[62]),
     .c(c2[61]), .b(s2[62]), .a(s1[62]), .cout(co[62]), .sum(s3[62]));
mul_csa42  sc3_61_ ( .cin(co[60]), .d(c1[60]), .carry(c3[61]),
     .c(c2[60]), .b(s2[61]), .a(s1[61]), .cout(co[61]), .sum(s3[61]));
mul_csa42  sc3_60_ ( .cin(co[59]), .d(c1[59]), .carry(c3[60]),
     .c(c2[59]), .b(s2[60]), .a(s1[60]), .cout(co[60]), .sum(s3[60]));
mul_csa42  sc3_59_ ( .cin(co[58]), .d(c1[58]), .carry(c3[59]),
     .c(c2[58]), .b(s2[59]), .a(s1[59]), .cout(co[59]), .sum(s3[59]));
mul_csa42  sc3_58_ ( .cin(co[57]), .d(c1[57]), .carry(c3[58]),
     .c(c2[57]), .b(s2[58]), .a(s1[58]), .cout(co[58]), .sum(s3[58]));
mul_csa42  sc3_57_ ( .cin(co[56]), .d(c1[56]), .carry(c3[57]),
     .c(c2[56]), .b(s2[57]), .a(s1[57]), .cout(co[57]), .sum(s3[57]));
mul_csa42  sc3_56_ ( .cin(co[55]), .d(c1[55]), .carry(c3[56]),
     .c(c2[55]), .b(s2[56]), .a(s1[56]), .cout(co[56]), .sum(s3[56]));
mul_csa42  sc3_55_ ( .cin(co[54]), .d(c1[54]), .carry(c3[55]),
     .c(c2[54]), .b(s2[55]), .a(s1[55]), .cout(co[55]), .sum(s3[55]));
mul_csa42  sc3_54_ ( .cin(co[53]), .d(c1[53]), .carry(c3[54]),
     .c(c2[53]), .b(s2[54]), .a(s1[54]), .cout(co[54]), .sum(s3[54]));
mul_csa42  sc3_53_ ( .cin(co[52]), .d(c1[52]), .carry(c3[53]),
     .c(c2[52]), .b(s2[53]), .a(s1[53]), .cout(co[53]), .sum(s3[53]));
mul_csa42  sc3_52_ ( .cin(co[51]), .d(c1[51]), .carry(c3[52]),
     .c(c2[51]), .b(s2[52]), .a(s1[52]), .cout(co[52]), .sum(s3[52]));
mul_csa42  sc3_51_ ( .cin(co[50]), .d(c1[50]), .carry(c3[51]),
     .c(c2[50]), .b(s2[51]), .a(s1[51]), .cout(co[51]), .sum(s3[51]));
mul_csa42  sc3_50_ ( .cin(co[49]), .d(c1[49]), .carry(c3[50]),
     .c(c2[49]), .b(s2[50]), .a(s1[50]), .cout(co[50]), .sum(s3[50]));
mul_csa42  sc3_49_ ( .cin(co[48]), .d(c1[48]), .carry(c3[49]),
     .c(c2[48]), .b(s2[49]), .a(s1[49]), .cout(co[49]), .sum(s3[49]));
mul_csa42  sc3_48_ ( .cin(co[47]), .d(c1[47]), .carry(c3[48]),
     .c(c2[47]), .b(s2[48]), .a(s1[48]), .cout(co[48]), .sum(s3[48]));
mul_csa42  sc3_47_ ( .cin(co[46]), .d(c1[46]), .carry(c3[47]),
     .c(c2[46]), .b(s2[47]), .a(s1[47]), .cout(co[47]), .sum(s3[47]));
mul_csa42  sc3_46_ ( .cin(co[45]), .d(c1[45]), .carry(c3[46]),
     .c(c2[45]), .b(s2[46]), .a(s1[46]), .cout(co[46]), .sum(s3[46]));
mul_csa42  sc3_45_ ( .cin(co[44]), .d(c1[44]), .carry(c3[45]),
     .c(c2[44]), .b(s2[45]), .a(s1[45]), .cout(co[45]), .sum(s3[45]));
mul_csa42  sc3_44_ ( .cin(co[43]), .d(c1[43]), .carry(c3[44]),
     .c(c2[43]), .b(s2[44]), .a(s1[44]), .cout(co[44]), .sum(s3[44]));
mul_csa42  sc3_43_ ( .cin(co[42]), .d(c1[42]), .carry(c3[43]),
     .c(c2[42]), .b(s2[43]), .a(s1[43]), .cout(co[43]), .sum(s3[43]));
mul_csa42  sc3_42_ ( .cin(co[41]), .d(c1[41]), .carry(c3[42]),
     .c(c2[41]), .b(s2[42]), .a(s1[42]), .cout(co[42]), .sum(s3[42]));
mul_csa42  sc3_41_ ( .cin(co[40]), .d(c1[40]), .carry(c3[41]),
     .c(c2[40]), .b(s2[41]), .a(s1[41]), .cout(co[41]), .sum(s3[41]));
mul_csa42  sc3_40_ ( .cin(co[39]), .d(c1[39]), .carry(c3[40]),
     .c(c2[39]), .b(s2[40]), .a(s1[40]), .cout(co[40]), .sum(s3[40]));
mul_csa42  sc3_39_ ( .cin(co[38]), .d(c1[38]), .carry(c3[39]),
     .c(c2[38]), .b(s2[39]), .a(s1[39]), .cout(co[39]), .sum(s3[39]));
mul_csa42  sc3_38_ ( .cin(co[37]), .d(c1[37]), .carry(c3[38]),
     .c(c2[37]), .b(s2[38]), .a(s1[38]), .cout(co[38]), .sum(s3[38]));
mul_csa42  sc3_37_ ( .cin(co[36]), .d(c1[36]), .carry(c3[37]),
     .c(c2[36]), .b(s2[37]), .a(s1[37]), .cout(co[37]), .sum(s3[37]));
mul_csa42  sc3_36_ ( .cin(co[35]), .d(c1[35]), .carry(c3[36]),
     .c(c2[35]), .b(s2[36]), .a(s1[36]), .cout(co[36]), .sum(s3[36]));
mul_csa42  sc3_35_ ( .cin(co[34]), .d(c1[34]), .carry(c3[35]),
     .c(c2[34]), .b(s2[35]), .a(s1[35]), .cout(co[35]), .sum(s3[35]));
mul_csa42  sc3_34_ ( .cin(co[33]), .d(c1[33]), .carry(c3[34]),
     .c(c2[33]), .b(s2[34]), .a(s1[34]), .cout(co[34]), .sum(s3[34]));
mul_csa42  sc3_33_ ( .cin(co[32]), .d(c1[32]), .carry(c3[33]),
     .c(c2[32]), .b(s2[33]), .a(s1[33]), .cout(co[33]), .sum(s3[33]));
mul_csa42  sc3_32_ ( .cin(co[31]), .d(c1[31]), .carry(c3[32]),
     .c(c2[31]), .b(s2[32]), .a(s1[32]), .cout(co[32]), .sum(s3[32]));
mul_csa42  sc3_31_ ( .cin(co[30]), .d(c1[30]), .carry(c3[31]),
     .c(c2[30]), .b(s2[31]), .a(s1[31]), .cout(co[31]), .sum(s3[31]));
mul_csa42  sc3_30_ ( .cin(co[29]), .d(c1[29]), .carry(c3[30]),
     .c(c2[29]), .b(s2[30]), .a(s1[30]), .cout(co[30]), .sum(s3[30]));
mul_csa42  sc3_29_ ( .cin(co[28]), .d(c1[28]), .carry(c3[29]),
     .c(c2[28]), .b(s2[29]), .a(s1[29]), .cout(co[29]), .sum(s3[29]));
mul_csa42  sc3_28_ ( .cin(co[27]), .d(c1[27]), .carry(c3[28]),
     .c(c2[27]), .b(s2[28]), .a(s1[28]), .cout(co[28]), .sum(s3[28]));
mul_csa42  sc3_27_ ( .cin(co[26]), .d(c1[26]), .carry(c3[27]),
     .c(c2[26]), .b(s2[27]), .a(s1[27]), .cout(co[27]), .sum(s3[27]));
mul_csa42  sc3_26_ ( .cin(co[25]), .d(c1[25]), .carry(c3[26]),
     .c(c2[25]), .b(s2[26]), .a(s1[26]), .cout(co[26]), .sum(s3[26]));
mul_csa42  sc3_25_ ( .cin(co[24]), .d(c1[24]), .carry(c3[25]),
     .c(c2[24]), .b(s2[25]), .a(s1[25]), .cout(co[25]), .sum(s3[25]));
mul_csa42  sc3_24_ ( .cin(co[23]), .d(c1[23]), .carry(c3[24]),
     .c(c2[23]), .b(s2[24]), .a(s1[24]), .cout(co[24]), .sum(s3[24]));
mul_csa42  sc3_23_ ( .cin(co[22]), .d(c1[22]), .carry(c3[23]),
     .c(c2[22]), .b(s2[23]), .a(s1[23]), .cout(co[23]), .sum(s3[23]));
mul_csa42  sc3_22_ ( .cin(co[21]), .d(c1[21]), .carry(c3[22]),
     .c(c2[21]), .b(s2[22]), .a(s1[22]), .cout(co[22]), .sum(s3[22]));
mul_csa42  sc3_21_ ( .cin(co[20]), .d(c1[20]), .carry(c3[21]),
     .c(c2[20]), .b(s2[21]), .a(s1[21]), .cout(co[21]), .sum(s3[21]));
mul_csa42  sc3_20_ ( .cin(1'b0), .d(c1[19]),
     .carry(c3[20]), .c(c2[19]), .b(s2[20]), .a(s1[20]), .cout(co[20]),
     .sum(s3[20]));
mul_csa32  sc4_82_ ( .c(c3[81]), .b(s2[82]), .a(ain[82]),
     .cout(pcout[82]), .sum(psum[82]));
mul_csa32  sc4_68_ ( .c(c3[67]), .b(s3[68]), .a(ain[68]),
     .cout(pcout[68]), .sum(psum[68]));
mul_csa32  sc4_67_ ( .c(c3[66]), .b(s3[67]), .a(ain[67]),
     .cout(pcout[67]), .sum(psum[67]));
mul_csa32  sc4_66_ ( .c(c3[65]), .b(s3[66]), .a(ain[66]),
     .cout(pcout[66]), .sum(psum[66]));
mul_csa32  sc4_65_ ( .c(c3[64]), .b(s3[65]), .a(ain[65]),
     .cout(pcout[65]), .sum(psum[65]));
mul_csa32  sc4_64_ ( .c(c3[63]), .b(s3[64]), .a(ain[64]),
     .cout(pcout[64]), .sum(psum[64]));
mul_csa32  sc4_63_ ( .c(c3[62]), .b(s3[63]), .a(ain[63]),
     .cout(pcout[63]), .sum(psum[63]));
mul_csa32  sc4_62_ ( .c(c3[61]), .b(s3[62]), .a(ain[62]),
     .cout(pcout[62]), .sum(psum[62]));
mul_csa32  sc4_61_ ( .c(c3[60]), .b(s3[61]), .a(ain[61]),
     .cout(pcout[61]), .sum(psum[61]));
mul_csa32  sc4_60_ ( .c(c3[59]), .b(s3[60]), .a(ain[60]),
     .cout(pcout[60]), .sum(psum[60]));
mul_csa32  sc4_59_ ( .c(c3[58]), .b(s3[59]), .a(ain[59]),
     .cout(pcout[59]), .sum(psum[59]));
mul_csa32  sc4_58_ ( .c(c3[57]), .b(s3[58]), .a(ain[58]),
     .cout(pcout[58]), .sum(psum[58]));
mul_csa32  sc4_57_ ( .c(c3[56]), .b(s3[57]), .a(ain[57]),
     .cout(pcout[57]), .sum(psum[57]));
mul_csa32  sc4_56_ ( .c(c3[55]), .b(s3[56]), .a(ain[56]),
     .cout(pcout[56]), .sum(psum[56]));
mul_csa32  sc4_55_ ( .c(c3[54]), .b(s3[55]), .a(ain[55]),
     .cout(pcout[55]), .sum(psum[55]));
mul_csa32  sc4_54_ ( .c(c3[53]), .b(s3[54]), .a(ain[54]),
     .cout(pcout[54]), .sum(psum[54]));
mul_csa32  sc4_53_ ( .c(c3[52]), .b(s3[53]), .a(ain[53]),
     .cout(pcout[53]), .sum(psum[53]));
mul_csa32  sc4_52_ ( .c(c3[51]), .b(s3[52]), .a(ain[52]),
     .cout(pcout[52]), .sum(psum[52]));
mul_csa32  sc4_51_ ( .c(c3[50]), .b(s3[51]), .a(ain[51]),
     .cout(pcout[51]), .sum(psum[51]));
mul_csa32  sc4_50_ ( .c(c3[49]), .b(s3[50]), .a(ain[50]),
     .cout(pcout[50]), .sum(psum[50]));
mul_csa32  sc4_49_ ( .c(c3[48]), .b(s3[49]), .a(ain[49]),
     .cout(pcout[49]), .sum(psum[49]));
mul_csa32  sc4_48_ ( .c(c3[47]), .b(s3[48]), .a(ain[48]),
     .cout(pcout[48]), .sum(psum[48]));
mul_csa32  sc4_47_ ( .c(c3[46]), .b(s3[47]), .a(ain[47]),
     .cout(pcout[47]), .sum(psum[47]));
mul_csa32  sc4_46_ ( .c(c3[45]), .b(s3[46]), .a(ain[46]),
     .cout(pcout[46]), .sum(psum[46]));
mul_csa32  sc4_45_ ( .c(c3[44]), .b(s3[45]), .a(ain[45]),
     .cout(pcout[45]), .sum(psum[45]));
mul_csa32  sc4_44_ ( .c(c3[43]), .b(s3[44]), .a(ain[44]),
     .cout(pcout[44]), .sum(psum[44]));
mul_csa32  sc4_43_ ( .c(c3[42]), .b(s3[43]), .a(ain[43]),
     .cout(pcout[43]), .sum(psum[43]));
mul_csa32  sc4_42_ ( .c(c3[41]), .b(s3[42]), .a(ain[42]),
     .cout(pcout[42]), .sum(psum[42]));
mul_csa32  sc4_41_ ( .c(c3[40]), .b(s3[41]), .a(ain[41]),
     .cout(pcout[41]), .sum(psum[41]));
mul_csa32  sc4_40_ ( .c(c3[39]), .b(s3[40]), .a(ain[40]),
     .cout(pcout[40]), .sum(psum[40]));
mul_csa32  sc4_39_ ( .c(c3[38]), .b(s3[39]), .a(ain[39]),
     .cout(pcout[39]), .sum(psum[39]));
mul_csa32  sc4_38_ ( .c(c3[37]), .b(s3[38]), .a(ain[38]),
     .cout(pcout[38]), .sum(psum[38]));
mul_csa32  sc4_37_ ( .c(c3[36]), .b(s3[37]), .a(ain[37]),
     .cout(pcout[37]), .sum(psum[37]));
mul_csa32  sc4_36_ ( .c(c3[35]), .b(s3[36]), .a(ain[36]),
     .cout(pcout[36]), .sum(psum[36]));
mul_csa32  sc4_35_ ( .c(c3[34]), .b(s3[35]), .a(ain[35]),
     .cout(pcout[35]), .sum(psum[35]));
mul_csa32  sc4_34_ ( .c(c3[33]), .b(s3[34]), .a(ain[34]),
     .cout(pcout[34]), .sum(psum[34]));
mul_csa32  sc4_33_ ( .c(c3[32]), .b(s3[33]), .a(ain[33]),
     .cout(pcout[33]), .sum(psum[33]));
mul_csa32  sc4_32_ ( .c(c3[31]), .b(s3[32]), .a(ain[32]),
     .cout(pcout[32]), .sum(psum[32]));
mul_csa32  sc4_31_ ( .c(c3[30]), .b(s3[31]), .a(ain[31]),
     .cout(pcout[31]), .sum(psum[31]));
mul_csa32  sc4_30_ ( .c(c3[29]), .b(s3[30]), .a(ain[30]),
     .cout(pcout[30]), .sum(psum[30]));
mul_csa32  sc4_29_ ( .c(c3[28]), .b(s3[29]), .a(ain[29]),
     .cout(pcout[29]), .sum(psum[29]));
mul_csa32  sc4_28_ ( .c(c3[27]), .b(s3[28]), .a(ain[28]),
     .cout(pcout[28]), .sum(psum[28]));
mul_csa32  sc4_27_ ( .c(c3[26]), .b(s3[27]), .a(ain[27]),
     .cout(pcout[27]), .sum(psum[27]));
mul_csa32  sc4_26_ ( .c(c3[25]), .b(s3[26]), .a(ain[26]),
     .cout(pcout[26]), .sum(psum[26]));
mul_csa32  sc4_25_ ( .c(c3[24]), .b(s3[25]), .a(ain[25]),
     .cout(pcout[25]), .sum(psum[25]));
mul_csa32  sc4_24_ ( .c(c3[23]), .b(s3[24]), .a(ain[24]),
     .cout(pcout[24]), .sum(psum[24]));
mul_csa32  sc4_23_ ( .c(c3[22]), .b(s3[23]), .a(ain[23]),
     .cout(pcout[23]), .sum(psum[23]));
mul_csa32  sc4_22_ ( .c(c3[21]), .b(s3[22]), .a(ain[22]),
     .cout(pcout[22]), .sum(psum[22]));
mul_csa32  sc4_21_ ( .c(c3[20]), .b(s3[21]), .a(ain[21]),
     .cout(pcout[21]), .sum(psum[21]));
mul_csa32  sc4_20_ ( .c(c3[19]), .b(s3[20]), .a(ain[20]),
     .cout(pcout[20]), .sum(psum[20]));
mul_csa32  sc4_96_ ( .c(c2[95]), .b(s2[96]), .a(ain[96]),
     .cout(pcout[96]), .sum(psum[96]));
mul_csa32  sc4_95_ ( .c(c2[94]), .b(s2[95]), .a(ain[95]),
     .cout(pcout[95]), .sum(psum[95]));
mul_csa32  sc4_94_ ( .c(c2[93]), .b(s2[94]), .a(ain[94]),
     .cout(pcout[94]), .sum(psum[94]));
mul_csa32  sc4_93_ ( .c(c2[92]), .b(s2[93]), .a(ain[93]),
     .cout(pcout[93]), .sum(psum[93]));
mul_csa32  sc4_92_ ( .c(c2[91]), .b(s2[92]), .a(ain[92]),
     .cout(pcout[92]), .sum(psum[92]));
mul_csa32  sc4_91_ ( .c(c2[90]), .b(s2[91]), .a(ain[91]),
     .cout(pcout[91]), .sum(psum[91]));
mul_csa32  sc4_90_ ( .c(c2[89]), .b(s2[90]), .a(ain[90]),
     .cout(pcout[90]), .sum(psum[90]));
mul_csa32  sc4_89_ ( .c(c2[88]), .b(s2[89]), .a(ain[89]),
     .cout(pcout[89]), .sum(psum[89]));
mul_csa32  sc4_88_ ( .c(c2[87]), .b(s2[88]), .a(ain[88]),
     .cout(pcout[88]), .sum(psum[88]));
mul_csa32  sc4_87_ ( .c(c2[86]), .b(s2[87]), .a(ain[87]),
     .cout(pcout[87]), .sum(psum[87]));
mul_csa32  sc4_86_ ( .c(c2[85]), .b(s2[86]), .a(ain[86]),
     .cout(pcout[86]), .sum(psum[86]));
mul_csa32  sc4_85_ ( .c(c2[84]), .b(s2[85]), .a(ain[85]),
     .cout(pcout[85]), .sum(psum[85]));
mul_csa32  sc4_84_ ( .c(c2[83]), .b(s2[84]), .a(ain[84]),
     .cout(pcout[84]), .sum(psum[84]));
mul_csa32  sc4_81_ ( .c(c3[80]), .b(s3[81]), .a(ain[81]),
     .cout(pcout[81]), .sum(psum[81]));
mul_csa32  sc4_80_ ( .c(c3[79]), .b(s3[80]), .a(ain[80]),
     .cout(pcout[80]), .sum(psum[80]));
mul_csa32  sc4_79_ ( .c(c3[78]), .b(s3[79]), .a(ain[79]),
     .cout(pcout[79]), .sum(psum[79]));
mul_csa32  sc4_78_ ( .c(c3[77]), .b(s3[78]), .a(ain[78]),
     .cout(pcout[78]), .sum(psum[78]));
mul_csa32  sc4_77_ ( .c(c3[76]), .b(s3[77]), .a(ain[77]),
     .cout(pcout[77]), .sum(psum[77]));
mul_csa32  sc4_76_ ( .c(c3[75]), .b(s3[76]), .a(ain[76]),
     .cout(pcout[76]), .sum(psum[76]));
mul_csa32  sc4_75_ ( .c(c3[74]), .b(s3[75]), .a(ain[75]),
     .cout(pcout[75]), .sum(psum[75]));
mul_csa32  sc4_74_ ( .c(c3[73]), .b(s3[74]), .a(ain[74]),
     .cout(pcout[74]), .sum(psum[74]));
mul_csa32  sc4_73_ ( .c(c3[72]), .b(s3[73]), .a(ain[73]),
     .cout(pcout[73]), .sum(psum[73]));
mul_csa32  sc4_72_ ( .c(c3[71]), .b(s3[72]), .a(ain[72]),
     .cout(pcout[72]), .sum(psum[72]));
mul_csa32  sc4_71_ ( .c(c3[70]), .b(s3[71]), .a(ain[71]),
     .cout(pcout[71]), .sum(psum[71]));
mul_csa32  sc4_70_ ( .c(c3[69]), .b(s3[70]), .a(ain[70]),
     .cout(pcout[70]), .sum(psum[70]));
mul_csa32  sc4_69_ ( .c(c3[68]), .b(s3[69]), .a(ain[69]),
     .cout(pcout[69]), .sum(psum[69]));
mul_csa32  acc_4_ ( .c(c2[3]), .sum(psum[4]), .cout(pcout[4]),
     .a(ain[4]), .b(s2[4]));
mul_csa32  acc_3_ ( .c(c2[2]), .sum(psum[3]), .cout(pcout[3]),
     .a(ain[3]), .b(s2[3]));
mul_csa32  acc_2_ ( .c(c2[1]), .sum(psum[2]), .cout(pcout[2]),
     .a(ain[2]), .b(s2[2]));
mul_csa32  acc_1_ ( .c(c2[0]), .sum(psum[1]), .cout(pcout[1]),
     .a(ain[1]), .b(s2[1]));
mul_csa32  sc3_97_ ( .c(c2[96]), .sum(psum[97]), .cout(pcout[97]),
     .a(a1s[81]), .b(a1c[80]));
mul_csa32  sc1_19_ ( .c(a1s[3]), .b(pc[50]), .a(ps[51]),
     .cout(c1[19]), .sum(s1[19]));
mul_csa32  sc1_18_ ( .c(a1s[2]), .b(pc[49]), .a(ps[50]),
     .cout(c1[18]), .sum(s1[18]));
mul_csa32  sc1_17_ ( .c(a1s[1]), .b(pc[48]), .a(ps[49]),
     .cout(c1[17]), .sum(s1[17]));
mul_csa32  sc1_16_ ( .c(a1s[0]), .b(pc[47]), .a(ps[48]),
     .cout(c1[16]), .sum(s1[16]));
mul_csa32  sc1_15_ ( .c(1'b0), .b(pc[46]), .a(ps[47]),
     .cout(c1[15]), .sum(s1[15]));
mul_csa32  sc4_83_ ( .c(c2[82]), .b(s2[83]), .a(ain[83]),
     .cout(pcout[83]), .sum(psum[83]));
mul_csa32  sc2_83_ ( .c(c1[82]), .b(a1c[66]), .a(a1s[67]),
     .cout(c2[83]), .sum(s2[83]));
mul_csa32  sc2_19_ ( .c(a0c[18]), .b(a0s[19]), .a(s1[19]),
     .cout(c2[19]), .sum(s2[19]));
mul_csa32  sc2_18_ ( .c(a0c[17]), .b(a0s[18]), .a(s1[18]),
     .cout(c2[18]), .sum(s2[18]));
mul_csa32  sc2_17_ ( .c(a0c[16]), .b(a0s[17]), .a(s1[17]),
     .cout(c2[17]), .sum(s2[17]));
mul_csa32  sc2_16_ ( .c(a0c[15]), .b(a0s[16]), .a(s1[16]),
     .cout(c2[16]), .sum(s2[16]));
mul_csa32  sc2_15_ ( .c(a0c[14]), .b(a0s[15]), .a(s1[15]),
     .cout(c2[15]), .sum(s2[15]));
mul_csa32  sc1_81_ ( .c(a0s[81]), .b(a1c[64]), .a(a1s[65]),
     .cout(c1[81]), .sum(s1[81]));
mul_csa32  sc1_80_ ( .c(a0s[80]), .b(a1c[63]), .a(a1s[64]),
     .cout(c1[80]), .sum(s1[80]));
mul_csa32  sc1_79_ ( .c(a0s[79]), .b(a1c[62]), .a(a1s[63]),
     .cout(c1[79]), .sum(s1[79]));
mul_csa32  sc1_78_ ( .c(a0s[78]), .b(a1c[61]), .a(a1s[62]),
     .cout(c1[78]), .sum(s1[78]));
mul_csa32  sc1_77_ ( .c(a0s[77]), .b(a1c[60]), .a(a1s[61]),
     .cout(c1[77]), .sum(s1[77]));
mul_csa32  sc1_76_ ( .c(a0s[76]), .b(a1c[59]), .a(a1s[60]),
     .cout(c1[76]), .sum(s1[76]));
mul_csa32  sc1_75_ ( .c(a0s[75]), .b(a1c[58]), .a(a1s[59]),
     .cout(c1[75]), .sum(s1[75]));
mul_csa32  sc1_74_ ( .c(a0s[74]), .b(a1c[57]), .a(a1s[58]),
     .cout(c1[74]), .sum(s1[74]));
mul_csa32  sc1_73_ ( .c(a0s[73]), .b(a1c[56]), .a(a1s[57]),
     .cout(c1[73]), .sum(s1[73]));
mul_csa32  sc1_72_ ( .c(a0s[72]), .b(a1c[55]), .a(a1s[56]),
     .cout(c1[72]), .sum(s1[72]));
mul_csa32  sc1_71_ ( .c(a0s[71]), .b(a1c[54]), .a(a1s[55]),
     .cout(c1[71]), .sum(s1[71]));
mul_csa32  sc1_70_ ( .c(a0s[70]), .b(a1c[53]), .a(a1s[54]),
     .cout(c1[70]), .sum(s1[70]));
mul_csa32  sc1_69_ ( .c(a0s[69]), .b(a1c[52]), .a(a1s[53]),
     .cout(c1[69]), .sum(s1[69]));
mul_csa32  sc1_68_ ( .c(a0s[68]), .b(a1c[51]), .a(a1s[52]),
     .cout(c1[68]), .sum(s1[68]));
mul_csa32  sc3_19_ ( .c(c2[18]), .b(c1[18]), .a(s2[19]),
     .cout(c3[19]), .sum(s3[19]));
mul_csa32  sc3_18_ ( .c(c2[17]), .b(c1[17]), .a(s2[18]),
     .cout(c3[18]), .sum(s3[18]));
mul_csa32  sc3_17_ ( .c(c2[16]), .b(c1[16]), .a(s2[17]),
     .cout(c3[17]), .sum(s3[17]));
mul_csa32  sc3_16_ ( .c(c2[15]), .b(c1[15]), .a(s2[16]),
     .cout(c3[16]), .sum(s3[16]));
mul_csa32  sc3_15_ ( .c(c2[14]), .b(c1[14]), .a(s2[15]),
     .cout(c3[15]), .sum(s3[15]));
mul_csa32  sc1_82_ ( .c(a0c[81]), .b(a1c[65]), .a(a1s[66]),
     .cout(c1[82]), .sum(s1[82]));
mul_csa32  acc_14_ ( .c(c2[13]), .sum(psum[14]), .cout(pcout[14]),
     .a(ain[14]), .b(s2[14]));
mul_csa32  acc_13_ ( .c(c2[12]), .sum(psum[13]), .cout(pcout[13]),
     .a(ain[13]), .b(s2[13]));
mul_csa32  acc_12_ ( .c(c2[11]), .sum(psum[12]), .cout(pcout[12]),
     .a(ain[12]), .b(s2[12]));
mul_csa32  acc_11_ ( .c(c2[10]), .sum(psum[11]), .cout(pcout[11]),
     .a(ain[11]), .b(s2[11]));
mul_csa32  acc_10_ ( .c(c2[9]), .sum(psum[10]), .cout(pcout[10]),
     .a(ain[10]), .b(s2[10]));
mul_csa32  acc_9_ ( .c(c2[8]), .sum(psum[9]), .cout(pcout[9]),
     .a(ain[9]), .b(s2[9]));
mul_csa32  acc_8_ ( .c(c2[7]), .sum(psum[8]), .cout(pcout[8]),
     .a(ain[8]), .b(s2[8]));
mul_csa32  acc_7_ ( .c(c2[6]), .sum(psum[7]), .cout(pcout[7]),
     .a(ain[7]), .b(s2[7]));
mul_csa32  acc_6_ ( .c(c2[5]), .sum(psum[6]), .cout(pcout[6]),
     .a(ain[6]), .b(s2[6]));
mul_csa32  acc_5_ ( .c(c2[4]), .sum(psum[5]), .cout(pcout[5]),
     .a(ain[5]), .b(s2[5]));
mul_csa32  sc2_67_ ( .c(a0c[66]), .b(c1[66]), .a(a0s[67]),
     .cout(c2[67]), .sum(s2[67]));
mul_csa32  sc1_14_ ( .c(a0s[14]), .b(pc[45]), .a(ps[46]),
     .cout(c1[14]), .sum(s1[14]));
mul_csa32  sc1_13_ ( .c(a0s[13]), .b(pc[44]), .a(ps[45]),
     .cout(c1[13]), .sum(s1[13]));
mul_csa32  sc1_12_ ( .c(a0s[12]), .b(pc[43]), .a(ps[44]),
     .cout(c1[12]), .sum(s1[12]));
mul_csa32  sc1_11_ ( .c(a0s[11]), .b(pc[42]), .a(ps[43]),
     .cout(c1[11]), .sum(s1[11]));
mul_csa32  sc1_10_ ( .c(a0s[10]), .b(pc[41]), .a(ps[42]),
     .cout(c1[10]), .sum(s1[10]));
mul_csa32  sc1_9_ ( .c(a0s[9]), .b(pc[40]), .a(ps[41]), .cout(c1[9]),
     .sum(s1[9]));
mul_csa32  sc1_8_ ( .c(a0s[8]), .b(pc[39]), .a(ps[40]), .cout(c1[8]),
     .sum(s1[8]));
mul_csa32  sc1_7_ ( .c(a0s[7]), .b(pc[38]), .a(ps[39]), .cout(c1[7]),
     .sum(s1[7]));
mul_csa32  sc1_6_ ( .c(a0s[6]), .b(pc[37]), .a(ps[38]), .cout(c1[6]),
     .sum(s1[6]));
mul_csa32  sc1_5_ ( .c(a0s[5]), .b(pc[36]), .a(ps[37]), .cout(c1[5]),
     .sum(s1[5]));
mul_csa32  sc2_14_ ( .c(a0c[13]), .b(c1[13]), .a(s1[14]),
     .cout(c2[14]), .sum(s2[14]));
mul_csa32  sc2_13_ ( .c(a0c[12]), .b(c1[12]), .a(s1[13]),
     .cout(c2[13]), .sum(s2[13]));
mul_csa32  sc2_12_ ( .c(a0c[11]), .b(c1[11]), .a(s1[12]),
     .cout(c2[12]), .sum(s2[12]));
mul_csa32  sc2_11_ ( .c(a0c[10]), .b(c1[10]), .a(s1[11]),
     .cout(c2[11]), .sum(s2[11]));
mul_csa32  sc2_10_ ( .c(a0c[9]), .b(c1[9]), .a(s1[10]),
     .cout(c2[10]), .sum(s2[10]));
mul_csa32  sc2_9_ ( .c(a0c[8]), .b(c1[8]), .a(s1[9]), .cout(c2[9]),
     .sum(s2[9]));
mul_csa32  sc2_8_ ( .c(a0c[7]), .b(c1[7]), .a(s1[8]), .cout(c2[8]),
     .sum(s2[8]));
mul_csa32  sc2_7_ ( .c(a0c[6]), .b(c1[6]), .a(s1[7]), .cout(c2[7]),
     .sum(s2[7]));
mul_csa32  sc2_6_ ( .c(a0c[5]), .b(c1[5]), .a(s1[6]), .cout(c2[6]),
     .sum(s2[6]));
mul_csa32  sc2_5_ ( .c(a0c[4]), .b(c1[4]), .a(s1[5]), .cout(c2[5]),
     .sum(s2[5]));
mul_csa32  sc2_82_ ( .c(c2[81]), .b(c1[81]), .a(s1[82]),
     .cout(c2[82]), .sum(s2[82]));
mul_csa32  sc1_4_ ( .c(a0s[4]), .b(pc[35]), .a(ps[36]), .cout(c1[4]),
     .sum(s1[4]));
mul_csa32  sc1_3_ ( .c(a0s[3]), .b(pc[34]), .a(ps[35]), .cout(c1[3]),
     .sum(s1[3]));
mul_csa32  sc1_2_ ( .c(a0s[2]), .b(pc[33]), .a(ps[34]), .cout(c1[2]),
     .sum(s1[2]));
mul_csa32  sc1_1_ ( .c(a0s[1]), .b(pc[32]), .a(ps[33]), .cout(c1[1]),
     .sum(s1[1]));
mul_csa32  sc2_66_ ( .c(a0c[65]), .b(a0s[66]), .a(a1c[49]),
     .cout(c2[66]), .sum(s2[66]));
mul_csa32  sc2_65_ ( .c(a0c[64]), .b(a0s[65]), .a(a1c[48]),
     .cout(c2[65]), .sum(s2[65]));
mul_csa32  sc2_64_ ( .c(a0c[63]), .b(a0s[64]), .a(a1c[47]),
     .cout(c2[64]), .sum(s2[64]));
mul_csa32  sc2_63_ ( .c(a0c[62]), .b(a0s[63]), .a(a1c[46]),
     .cout(c2[63]), .sum(s2[63]));
mul_csa32  sc2_62_ ( .c(a0c[61]), .b(a0s[62]), .a(a1c[45]),
     .cout(c2[62]), .sum(s2[62]));
mul_csa32  sc2_61_ ( .c(a0c[60]), .b(a0s[61]), .a(a1c[44]),
     .cout(c2[61]), .sum(s2[61]));
mul_csa32  sc2_60_ ( .c(a0c[59]), .b(a0s[60]), .a(a1c[43]),
     .cout(c2[60]), .sum(s2[60]));
mul_csa32  sc2_59_ ( .c(a0c[58]), .b(a0s[59]), .a(a1c[42]),
     .cout(c2[59]), .sum(s2[59]));
mul_csa32  sc2_58_ ( .c(a0c[57]), .b(a0s[58]), .a(a1c[41]),
     .cout(c2[58]), .sum(s2[58]));
mul_csa32  sc2_57_ ( .c(a0c[56]), .b(a0s[57]), .a(a1c[40]),
     .cout(c2[57]), .sum(s2[57]));
mul_csa32  sc2_56_ ( .c(a0c[55]), .b(a0s[56]), .a(a1c[39]),
     .cout(c2[56]), .sum(s2[56]));
mul_csa32  sc2_55_ ( .c(a0c[54]), .b(a0s[55]), .a(a1c[38]),
     .cout(c2[55]), .sum(s2[55]));
mul_csa32  sc2_54_ ( .c(a0c[53]), .b(a0s[54]), .a(a1c[37]),
     .cout(c2[54]), .sum(s2[54]));
mul_csa32  sc2_53_ ( .c(a0c[52]), .b(a0s[53]), .a(a1c[36]),
     .cout(c2[53]), .sum(s2[53]));
mul_csa32  sc2_52_ ( .c(a0c[51]), .b(a0s[52]), .a(a1c[35]),
     .cout(c2[52]), .sum(s2[52]));
mul_csa32  sc2_51_ ( .c(a0c[50]), .b(a0s[51]), .a(a1c[34]),
     .cout(c2[51]), .sum(s2[51]));
mul_csa32  sc2_50_ ( .c(a0c[49]), .b(a0s[50]), .a(a1c[33]),
     .cout(c2[50]), .sum(s2[50]));
mul_csa32  sc2_49_ ( .c(a0c[48]), .b(a0s[49]), .a(a1c[32]),
     .cout(c2[49]), .sum(s2[49]));
mul_csa32  sc2_48_ ( .c(a0c[47]), .b(a0s[48]), .a(a1c[31]),
     .cout(c2[48]), .sum(s2[48]));
mul_csa32  sc2_47_ ( .c(a0c[46]), .b(a0s[47]), .a(a1c[30]),
     .cout(c2[47]), .sum(s2[47]));
mul_csa32  sc2_46_ ( .c(a0c[45]), .b(a0s[46]), .a(a1c[29]),
     .cout(c2[46]), .sum(s2[46]));
mul_csa32  sc2_45_ ( .c(a0c[44]), .b(a0s[45]), .a(a1c[28]),
     .cout(c2[45]), .sum(s2[45]));
mul_csa32  sc2_44_ ( .c(a0c[43]), .b(a0s[44]), .a(a1c[27]),
     .cout(c2[44]), .sum(s2[44]));
mul_csa32  sc2_43_ ( .c(a0c[42]), .b(a0s[43]), .a(a1c[26]),
     .cout(c2[43]), .sum(s2[43]));
mul_csa32  sc2_42_ ( .c(a0c[41]), .b(a0s[42]), .a(a1c[25]),
     .cout(c2[42]), .sum(s2[42]));
mul_csa32  sc2_41_ ( .c(a0c[40]), .b(a0s[41]), .a(a1c[24]),
     .cout(c2[41]), .sum(s2[41]));
mul_csa32  sc2_40_ ( .c(a0c[39]), .b(a0s[40]), .a(a1c[23]),
     .cout(c2[40]), .sum(s2[40]));
mul_csa32  sc2_39_ ( .c(a0c[38]), .b(a0s[39]), .a(a1c[22]),
     .cout(c2[39]), .sum(s2[39]));
mul_csa32  sc2_38_ ( .c(a0c[37]), .b(a0s[38]), .a(a1c[21]),
     .cout(c2[38]), .sum(s2[38]));
mul_csa32  sc2_37_ ( .c(a0c[36]), .b(a0s[37]), .a(a1c[20]),
     .cout(c2[37]), .sum(s2[37]));
mul_csa32  sc2_36_ ( .c(a0c[35]), .b(a0s[36]), .a(a1c[19]),
     .cout(c2[36]), .sum(s2[36]));
mul_csa32  sc2_35_ ( .c(a0c[34]), .b(a0s[35]), .a(a1c[18]),
     .cout(c2[35]), .sum(s2[35]));
mul_csa32  sc2_34_ ( .c(a0c[33]), .b(a0s[34]), .a(a1c[17]),
     .cout(c2[34]), .sum(s2[34]));
mul_csa32  sc2_33_ ( .c(a0c[32]), .b(a0s[33]), .a(a1c[16]),
     .cout(c2[33]), .sum(s2[33]));
mul_csa32  sc2_32_ ( .c(a0c[31]), .b(a0s[32]), .a(a1c[15]),
     .cout(c2[32]), .sum(s2[32]));
mul_csa32  sc2_31_ ( .c(a0c[30]), .b(a0s[31]), .a(a1c[14]),
     .cout(c2[31]), .sum(s2[31]));
mul_csa32  sc2_30_ ( .c(a0c[29]), .b(a0s[30]), .a(a1c[13]),
     .cout(c2[30]), .sum(s2[30]));
mul_csa32  sc2_29_ ( .c(a0c[28]), .b(a0s[29]), .a(a1c[12]),
     .cout(c2[29]), .sum(s2[29]));
mul_csa32  sc2_28_ ( .c(a0c[27]), .b(a0s[28]), .a(a1c[11]),
     .cout(c2[28]), .sum(s2[28]));
mul_csa32  sc2_27_ ( .c(a0c[26]), .b(a0s[27]), .a(a1c[10]),
     .cout(c2[27]), .sum(s2[27]));
mul_csa32  sc2_26_ ( .c(a0c[25]), .b(a0s[26]), .a(a1c[9]),
     .cout(c2[26]), .sum(s2[26]));
mul_csa32  sc2_25_ ( .c(a0c[24]), .b(a0s[25]), .a(a1c[8]),
     .cout(c2[25]), .sum(s2[25]));
mul_csa32  sc2_24_ ( .c(a0c[23]), .b(a0s[24]), .a(a1c[7]),
     .cout(c2[24]), .sum(s2[24]));
mul_csa32  sc2_23_ ( .c(a0c[22]), .b(a0s[23]), .a(a1c[6]),
     .cout(c2[23]), .sum(s2[23]));
mul_csa32  sc2_22_ ( .c(a0c[21]), .b(a0s[22]), .a(a1c[5]),
     .cout(c2[22]), .sum(s2[22]));
mul_csa32  sc2_21_ ( .c(a0c[20]), .b(a0s[21]), .a(a1c[4]),
     .cout(c2[21]), .sum(s2[21]));
mul_csa32  sc2_20_ ( .c(a0c[19]), .b(a0s[20]), .a(1'b0),
     .cout(c2[20]), .sum(s2[20]));
mul_csa32  sc1_66_ ( .c(a1s[50]), .b(pc[97]), .a(ps[98]),
     .cout(c1[66]), .sum(s1[66]));
mul_csa32  sc1_65_ ( .c(a1s[49]), .b(pc[96]), .a(ps[97]),
     .cout(c1[65]), .sum(s1[65]));
mul_csa32  sc1_64_ ( .c(a1s[48]), .b(pc[95]), .a(ps[96]),
     .cout(c1[64]), .sum(s1[64]));
mul_csa32  sc1_63_ ( .c(a1s[47]), .b(pc[94]), .a(ps[95]),
     .cout(c1[63]), .sum(s1[63]));
mul_csa32  sc1_62_ ( .c(a1s[46]), .b(pc[93]), .a(ps[94]),
     .cout(c1[62]), .sum(s1[62]));
mul_csa32  sc1_61_ ( .c(a1s[45]), .b(pc[92]), .a(ps[93]),
     .cout(c1[61]), .sum(s1[61]));
mul_csa32  sc1_60_ ( .c(a1s[44]), .b(pc[91]), .a(ps[92]),
     .cout(c1[60]), .sum(s1[60]));
mul_csa32  sc1_59_ ( .c(a1s[43]), .b(pc[90]), .a(ps[91]),
     .cout(c1[59]), .sum(s1[59]));
mul_csa32  sc1_58_ ( .c(a1s[42]), .b(pc[89]), .a(ps[90]),
     .cout(c1[58]), .sum(s1[58]));
mul_csa32  sc1_57_ ( .c(a1s[41]), .b(pc[88]), .a(ps[89]),
     .cout(c1[57]), .sum(s1[57]));
mul_csa32  sc1_56_ ( .c(a1s[40]), .b(pc[87]), .a(ps[88]),
     .cout(c1[56]), .sum(s1[56]));
mul_csa32  sc1_55_ ( .c(a1s[39]), .b(pc[86]), .a(ps[87]),
     .cout(c1[55]), .sum(s1[55]));
mul_csa32  sc1_54_ ( .c(a1s[38]), .b(pc[85]), .a(ps[86]),
     .cout(c1[54]), .sum(s1[54]));
mul_csa32  sc1_53_ ( .c(a1s[37]), .b(pc[84]), .a(ps[85]),
     .cout(c1[53]), .sum(s1[53]));
mul_csa32  sc1_52_ ( .c(a1s[36]), .b(pc[83]), .a(ps[84]),
     .cout(c1[52]), .sum(s1[52]));
mul_csa32  sc1_51_ ( .c(a1s[35]), .b(pc[82]), .a(ps[83]),
     .cout(c1[51]), .sum(s1[51]));
mul_csa32  sc1_50_ ( .c(a1s[34]), .b(pc[81]), .a(ps[82]),
     .cout(c1[50]), .sum(s1[50]));
mul_csa32  sc1_49_ ( .c(a1s[33]), .b(pc[80]), .a(ps[81]),
     .cout(c1[49]), .sum(s1[49]));
mul_csa32  sc1_48_ ( .c(a1s[32]), .b(pc[79]), .a(ps[80]),
     .cout(c1[48]), .sum(s1[48]));
mul_csa32  sc1_47_ ( .c(a1s[31]), .b(pc[78]), .a(ps[79]),
     .cout(c1[47]), .sum(s1[47]));
mul_csa32  sc1_46_ ( .c(a1s[30]), .b(pc[77]), .a(ps[78]),
     .cout(c1[46]), .sum(s1[46]));
mul_csa32  sc1_45_ ( .c(a1s[29]), .b(pc[76]), .a(ps[77]),
     .cout(c1[45]), .sum(s1[45]));
mul_csa32  sc1_44_ ( .c(a1s[28]), .b(pc[75]), .a(ps[76]),
     .cout(c1[44]), .sum(s1[44]));
mul_csa32  sc1_43_ ( .c(a1s[27]), .b(pc[74]), .a(ps[75]),
     .cout(c1[43]), .sum(s1[43]));
mul_csa32  sc1_42_ ( .c(a1s[26]), .b(pc[73]), .a(ps[74]),
     .cout(c1[42]), .sum(s1[42]));
mul_csa32  sc1_41_ ( .c(a1s[25]), .b(pc[72]), .a(ps[73]),
     .cout(c1[41]), .sum(s1[41]));
mul_csa32  sc1_40_ ( .c(a1s[24]), .b(pc[71]), .a(ps[72]),
     .cout(c1[40]), .sum(s1[40]));
mul_csa32  sc1_39_ ( .c(a1s[23]), .b(pc[70]), .a(ps[71]),
     .cout(c1[39]), .sum(s1[39]));
mul_csa32  sc1_38_ ( .c(a1s[22]), .b(pc[69]), .a(ps[70]),
     .cout(c1[38]), .sum(s1[38]));
mul_csa32  sc1_37_ ( .c(a1s[21]), .b(pc[68]), .a(ps[69]),
     .cout(c1[37]), .sum(s1[37]));
mul_csa32  sc1_36_ ( .c(a1s[20]), .b(pc[67]), .a(ps[68]),
     .cout(c1[36]), .sum(s1[36]));
mul_csa32  sc1_35_ ( .c(a1s[19]), .b(pc[66]), .a(ps[67]),
     .cout(c1[35]), .sum(s1[35]));
mul_csa32  sc1_34_ ( .c(a1s[18]), .b(pc[65]), .a(ps[66]),
     .cout(c1[34]), .sum(s1[34]));
mul_csa32  sc1_33_ ( .c(a1s[17]), .b(pc[64]), .a(ps[65]),
     .cout(c1[33]), .sum(s1[33]));
mul_csa32  sc1_32_ ( .c(a1s[16]), .b(pc[63]), .a(ps[64]),
     .cout(c1[32]), .sum(s1[32]));
mul_csa32  sc1_31_ ( .c(a1s[15]), .b(pc[62]), .a(ps[63]),
     .cout(c1[31]), .sum(s1[31]));
mul_csa32  sc1_30_ ( .c(a1s[14]), .b(pc[61]), .a(ps[62]),
     .cout(c1[30]), .sum(s1[30]));
mul_csa32  sc1_29_ ( .c(a1s[13]), .b(pc[60]), .a(ps[61]),
     .cout(c1[29]), .sum(s1[29]));
mul_csa32  sc1_28_ ( .c(a1s[12]), .b(pc[59]), .a(ps[60]),
     .cout(c1[28]), .sum(s1[28]));
mul_csa32  sc1_27_ ( .c(a1s[11]), .b(pc[58]), .a(ps[59]),
     .cout(c1[27]), .sum(s1[27]));
mul_csa32  sc1_26_ ( .c(a1s[10]), .b(pc[57]), .a(ps[58]),
     .cout(c1[26]), .sum(s1[26]));
mul_csa32  sc1_25_ ( .c(a1s[9]), .b(pc[56]), .a(ps[57]),
     .cout(c1[25]), .sum(s1[25]));
mul_csa32  sc1_24_ ( .c(a1s[8]), .b(pc[55]), .a(ps[56]),
     .cout(c1[24]), .sum(s1[24]));
mul_csa32  sc1_23_ ( .c(a1s[7]), .b(pc[54]), .a(ps[55]),
     .cout(c1[23]), .sum(s1[23]));
mul_csa32  sc1_22_ ( .c(a1s[6]), .b(pc[53]), .a(ps[54]),
     .cout(c1[22]), .sum(s1[22]));
mul_csa32  sc1_21_ ( .c(a1s[5]), .b(pc[52]), .a(ps[53]),
     .cout(c1[21]), .sum(s1[21]));
mul_csa32  sc1_20_ ( .c(a1s[4]), .b(pc[51]), .a(ps[52]),
     .cout(c1[20]), .sum(s1[20]));
mul_csa32  sc2_81_ ( .c(a0c[80]), .b(c1[80]), .a(s1[81]),
     .cout(c2[81]), .sum(s2[81]));
mul_csa32  sc2_80_ ( .c(a0c[79]), .b(c1[79]), .a(s1[80]),
     .cout(c2[80]), .sum(s2[80]));
mul_csa32  sc2_79_ ( .c(a0c[78]), .b(c1[78]), .a(s1[79]),
     .cout(c2[79]), .sum(s2[79]));
mul_csa32  sc2_78_ ( .c(a0c[77]), .b(c1[77]), .a(s1[78]),
     .cout(c2[78]), .sum(s2[78]));
mul_csa32  sc2_77_ ( .c(a0c[76]), .b(c1[76]), .a(s1[77]),
     .cout(c2[77]), .sum(s2[77]));
mul_csa32  sc2_76_ ( .c(a0c[75]), .b(c1[75]), .a(s1[76]),
     .cout(c2[76]), .sum(s2[76]));
mul_csa32  sc2_75_ ( .c(a0c[74]), .b(c1[74]), .a(s1[75]),
     .cout(c2[75]), .sum(s2[75]));
mul_csa32  sc2_74_ ( .c(a0c[73]), .b(c1[73]), .a(s1[74]),
     .cout(c2[74]), .sum(s2[74]));
mul_csa32  sc2_73_ ( .c(a0c[72]), .b(c1[72]), .a(s1[73]),
     .cout(c2[73]), .sum(s2[73]));
mul_csa32  sc2_72_ ( .c(a0c[71]), .b(c1[71]), .a(s1[72]),
     .cout(c2[72]), .sum(s2[72]));
mul_csa32  sc2_71_ ( .c(a0c[70]), .b(c1[70]), .a(s1[71]),
     .cout(c2[71]), .sum(s2[71]));
mul_csa32  sc2_70_ ( .c(a0c[69]), .b(c1[69]), .a(s1[70]),
     .cout(c2[70]), .sum(s2[70]));
mul_csa32  sc2_69_ ( .c(a0c[68]), .b(c1[68]), .a(s1[69]),
     .cout(c2[69]), .sum(s2[69]));
mul_csa32  sc2_68_ ( .c(a0c[67]), .b(c1[67]), .a(s1[68]),
     .cout(c2[68]), .sum(s2[68]));
mul_csa32  acc_19_ ( .c(c3[18]), .b(s3[19]), .a(ain[19]),
     .cout(pcout[19]), .sum(psum[19]));
mul_csa32  acc_18_ ( .c(c3[17]), .b(s3[18]), .a(ain[18]),
     .cout(pcout[18]), .sum(psum[18]));
mul_csa32  acc_17_ ( .c(c3[16]), .b(s3[17]), .a(ain[17]),
     .cout(pcout[17]), .sum(psum[17]));
mul_csa32  acc_16_ ( .c(c3[15]), .b(s3[16]), .a(ain[16]),
     .cout(pcout[16]), .sum(psum[16]));
mul_csa32  acc_15_ ( .c(1'b0), .b(s3[15]), .a(ain[15]),
     .cout(pcout[15]), .sum(psum[15]));
mul_csa32  sc1_0_ ( .c(a0s[0]), .sum(s1[0]), .cout(c1[0]),
     .a(ps[32]), .b(pc[31]));
mul_csa32  sc1_67_ ( .c(a1c[50]), .b(pc[98]), .a(a1s[51]),
     .cout(c1[67]), .sum(s1[67]));
mul_ha acc_0_ ( .sum(psum[0]), .cout(pcout[0]), .a(ain[0]),
     .b(s2[0]));
mul_ha sc3_98_ ( .sum(psum[98]), .cout(pcout[98]), .a(bot),
     .b(a1c[81]));
mul_ha sc2_96_ ( .b(a1c[79]), .a(a1s[80]), .cout(c2[96]),
     .sum(s2[96]));
mul_ha sc2_95_ ( .b(a1c[78]), .a(a1s[79]), .cout(c2[95]),
     .sum(s2[95]));
mul_ha sc2_94_ ( .b(a1c[77]), .a(a1s[78]), .cout(c2[94]),
     .sum(s2[94]));
mul_ha sc2_93_ ( .b(a1c[76]), .a(a1s[77]), .cout(c2[93]),
     .sum(s2[93]));
mul_ha sc2_92_ ( .b(a1c[75]), .a(a1s[76]), .cout(c2[92]),
     .sum(s2[92]));
mul_ha sc2_91_ ( .b(a1c[74]), .a(a1s[75]), .cout(c2[91]),
     .sum(s2[91]));
mul_ha sc2_90_ ( .b(a1c[73]), .a(a1s[74]), .cout(c2[90]),
     .sum(s2[90]));
mul_ha sc2_89_ ( .b(a1c[72]), .a(a1s[73]), .cout(c2[89]),
     .sum(s2[89]));
mul_ha sc2_88_ ( .b(a1c[71]), .a(a1s[72]), .cout(c2[88]),
     .sum(s2[88]));
mul_ha sc2_87_ ( .b(a1c[70]), .a(a1s[71]), .cout(c2[87]),
     .sum(s2[87]));
mul_ha sc2_86_ ( .b(a1c[69]), .a(a1s[70]), .cout(c2[86]),
     .sum(s2[86]));
mul_ha sc2_85_ ( .b(a1c[68]), .a(a1s[69]), .cout(c2[85]),
     .sum(s2[85]));
mul_ha sc2_84_ ( .b(a1c[67]), .a(a1s[68]), .cout(c2[84]),
     .sum(s2[84]));
mul_ha sc3_81_ ( .b(c2[80]), .a(s2[81]), .cout(c3[81]),
     .sum(s3[81]));
mul_ha sc3_80_ ( .b(c2[79]), .a(s2[80]), .cout(c3[80]),
     .sum(s3[80]));
mul_ha sc3_79_ ( .b(c2[78]), .a(s2[79]), .cout(c3[79]),
     .sum(s3[79]));
mul_ha sc3_78_ ( .b(c2[77]), .a(s2[78]), .cout(c3[78]),
     .sum(s3[78]));
mul_ha sc3_77_ ( .b(c2[76]), .a(s2[77]), .cout(c3[77]),
     .sum(s3[77]));
mul_ha sc3_76_ ( .b(c2[75]), .a(s2[76]), .cout(c3[76]),
     .sum(s3[76]));
mul_ha sc3_75_ ( .b(c2[74]), .a(s2[75]), .cout(c3[75]),
     .sum(s3[75]));
mul_ha sc3_74_ ( .b(c2[73]), .a(s2[74]), .cout(c3[74]),
     .sum(s3[74]));
mul_ha sc3_73_ ( .b(c2[72]), .a(s2[73]), .cout(c3[73]),
     .sum(s3[73]));
mul_ha sc3_72_ ( .b(c2[71]), .a(s2[72]), .cout(c3[72]),
     .sum(s3[72]));
mul_ha sc3_71_ ( .b(c2[70]), .a(s2[71]), .cout(c3[71]),
     .sum(s3[71]));
mul_ha sc3_70_ ( .b(c2[69]), .a(s2[70]), .cout(c3[70]),
     .sum(s3[70]));
mul_ha sc3_69_ ( .b(c2[68]), .a(s2[69]), .cout(c3[69]),
     .sum(s3[69]));
mul_ha accx2 ( .sum(psumx2), .cout(pcoutx2), .a(ainx2), .b(s1x2));
mul_ha sc2_4_ ( .sum(s2[4]), .cout(c2[4]), .a(s1[4]), .b(c1[3]));
mul_ha sc2_3_ ( .sum(s2[3]), .cout(c2[3]), .a(s1[3]), .b(c1[2]));
mul_ha sc2_2_ ( .sum(s2[2]), .cout(c2[2]), .a(s1[2]), .b(c1[1]));
mul_ha sc2_1_ ( .sum(s2[1]), .cout(c2[1]), .a(s1[1]), .b(c1[0]));
mul_ha sc2_0_ ( .sum(s2[0]), .cout(c2[0]), .a(s1[0]), .b(c1x2));
mul_ha sc1x2 ( .sum(s1x2), .cout(c1x2), .a(ps[31]), .b(pc[30]));

endmodule //mul_array2

module mul_csa32 (sum, cout, a, b, c);

output sum, cout;
input a, b, c;

wire x, y0, y1, y2;

assign x = a ^ b;
assign sum = c ^ x;

assign y0 = a & b ;
assign y1 = a & c ;
assign y2 = b & c ;

assign cout = y0 | y1 | y2 ;

endmodule //mul_csa32

module mul_csa42 (sum, carry, cout, a, b, c, d, cin);

output sum, carry, cout;
input a, b, c, d, cin;

wire x, y, z;

assign x = a ^ b;
assign y = c ^ d;
assign z = x ^ y;

assign sum = z ^ cin ;

assign carry = (b & ~z) | (cin & z);

assign cout = (d & ~y) | (a & y);

endmodule // mul_csa42

module mul_ha ( cout, sum, a, b );
output  cout, sum;
input  a, b;

assign sum = a ^ b;
assign cout = a & b ;

endmodule //mul_ha

module mul_negen ( n0, n1, b );
output  n0, n1;
input [2:0]  b;

assign n0 = b[2] & b[1] & ~b[0] ;
assign n1 = b[2] & b[1] & b[0] ;

endmodule //mul_negen

module mul_ppgen3lsb4 (cout, p0_l, p1_l, sum, a, b0, b1 );

output  p0_l, p1_l;
output [3:0]  sum;
output [3:1]  cout;
input [3:0]  a;
input [2:0]  b0;
input [2:0]  b1;

wire b0n, b0n_0, b0n_1, b1n_0, b1n_1;
wire p0_0, p0_1, p0_2, p0_3, p1_2, p1_3;
wire p0_l_0, p0_l_1, p0_l_2, p1_l_2;

assign b0n = b0n_1 | (b0n_0 & p0_0) ;
assign sum[0] = b0n_0 ^ p0_0 ;

mul_negen p0n ( .b(b0[2:0]), .n1(b0n_1), .n0(b0n_0));
mul_negen p1n ( .b(b1[2:0]), .n1(b1n_1), .n0(b1n_0));
mul_csa32  sc1_2_ ( .c(b1n_0), .sum(sum[2]), .cout(cout[2]),
     .a(p0_2), .b(p1_2));
mul_csa32  sc1_3_ ( .c(b1n_1), .sum(sum[3]), .cout(cout[3]),
     .a(p0_3), .b(p1_3));
mul_ha sc1_1_ ( .sum(sum[1]), .cout(cout[1]), .a(p0_1),
     .b(b0n));
mul_ppgen p0_3_ ( .pm1_l(p0_l_2), .p_l(p0_l), .b(b0[2:0]), .a(a[3]),
     .z(p0_3));
mul_ppgen p1_3_ ( .pm1_l(p1_l_2), .p_l(p1_l), .b(b1[2:0]), .a(a[1]),
     .z(p1_3));
mul_ppgen p0_2_ ( .pm1_l(p0_l_1), .p_l(p0_l_2), .b(b0[2:0]),
     .a(a[2]), .z(p0_2));
mul_ppgen p0_1_ ( .pm1_l(p0_l_0), .p_l(p0_l_1), .b(b0[2:0]),
     .a(a[1]), .z(p0_1));
mul_ppgen p0_0_ ( .pm1_l(1'b1), .p_l(p0_l_0),
     .b(b0[2:0]), .a(a[0]), .z(p0_0));
mul_ppgen p1_2_ ( .pm1_l(1'b1), .p_l(p1_l_2),
     .b(b1[2:0]), .a(a[0]), .z(p1_2));

endmodule // mul_ppgen3lsb4

module mul_ppgen3sign ( cout, sum, am1, am2, am3, am4, b0, b1, b2,
     bot, head, p0m1_l, p1m1_l, p2m1_l );
input  am1, am2, am3, am4;
input  bot, head, p0m1_l, p1m1_l, p2m1_l;
output [5:0]  sum;
output [4:0]  cout;
input [2:0]  b0;
input [2:0]  b2;
input [2:0]  b1;

wire net37, net42, net075, net088, net0117; 
wire net47, net073, net38, net0118, net078, net8, net15, net43, net48, net35;
wire p2_l_67, p2_l_66, p2_l_65, p2_l_64; 
wire p1_l_65, p1_l_64; 

assign sum[5] = bot & net075 ;
assign net0117 = head & net088 ; 
assign net37 = ~net0117 ;
assign net42 = head ^ net088 ;

mul_ppgensign p0_64_ ( .b(b0[2:0]), .z(net47), .p_l(net088),
     .pm1_l(p0m1_l));
mul_ppgensign p2_68_ ( .pm1_l(p2_l_67), .b(b2[2:0]), .z(net073),
     .p_l(net075));
mul_ppgensign p1_66_ ( .pm1_l(p1_l_65), .b(b1[2:0]), .z(net38),
     .p_l(net0118));
mul_ha sc1_68_ ( .b(net073), .a(1'b1), .cout(cout[4]),
     .sum(sum[4]));
mul_ppgen p2_67_ ( .pm1_l(p2_l_66), .b(b2[2:0]), .a(am1), .z(net078),
     .p_l(p2_l_67));
mul_ppgen p2_66_ ( .pm1_l(p2_l_65), .b(b2[2:0]), .a(am2), .z(net8),
     .p_l(p2_l_66));
mul_ppgen p2_65_ ( .pm1_l(p2_l_64), .p_l(p2_l_65), .b(b2[2:0]),
     .a(am3), .z(net15));
mul_ppgen p1_65_ ( .pm1_l(p1_l_64), .p_l(p1_l_65), .b(b1[2:0]),
     .a(am1), .z(net43));
mul_ppgen p1_64_ ( .pm1_l(p1m1_l), .p_l(p1_l_64), .b(b1[2:0]),
     .a(am2), .z(net48));
mul_ppgen p2_64_ ( .pm1_l(p2m1_l), .p_l(p2_l_64), .b(b2[2:0]),
     .a(am4), .z(net35));
mul_csa32  sc1_67_ ( .c(net078), .b(net0117), .a(net0118),
     .cout(cout[3]), .sum(sum[3]));
mul_csa32  sc1_66_ ( .c(net8), .b(net37), .a(net38), .cout(cout[2]),
     .sum(sum[2]));
mul_csa32  sc1_65_ ( .c(net15), .b(net42), .a(net43), .cout(cout[1]),
     .sum(sum[1]));
mul_csa32  sc1_64_ ( .c(net35), .b(net47), .a(net48), .cout(cout[0]),
     .sum(sum[0]));

endmodule //mul_ppgen3sign

module mul_ppgen3 ( cout, p0_l, p1_l, p2_l, sum, am2, am4,
     a, b0, b1, b2, p0m1_l, p1m1_l, p2m1_l );
output  cout, p0_l, p1_l, p2_l, sum;
input  am2, am4;
input  a, p0m1_l, p1m1_l, p2m1_l;
input [2:0]  b0;
input [2:0]  b2;
input [2:0]  b1;

wire net046, net32, net043;

mul_csa32  sc1 ( .a(net046), .b(net32), .cout(cout), .sum(sum),
     .c(net043));
mul_ppgen p2 ( .pm1_l(p2m1_l), .p_l(p2_l), .b(b2[2:0]), .a(am4),
     .z(net043));
mul_ppgen p1 ( .pm1_l(p1m1_l), .p_l(p1_l), .b(b1[2:0]), .a(am2),
     .z(net046));
mul_ppgen p0 ( .pm1_l(p0m1_l), .p_l(p0_l), .b(b0[2:0]), .a(a),
     .z(net32));

endmodule // mul_ppgen3

module mul_ppgenrow3 ( cout, sum, a, b0, b1, b2, bot, head );

output [68:1]  cout;
output [69:0]  sum;
input [63:0]  a;
input [2:0]  b2;
input [2:0]  b0;
input [2:0]  b1;
input  bot, head;

// Buses in the design
wire  [63:4]  p2_l;
wire  [63:3]  p1_l;
wire  [63:3]  p0_l;

mul_ppgen3sign I2 ( .am4(a[60]), .am3(a[61]), .am2(a[62]),
     .am1(a[63]), .p2m1_l(p2_l[63]), .p1m1_l(p1_l[63]),
     .p0m1_l(p0_l[63]), .b2(b2[2:0]), .head(head), .bot(bot),
     .sum(sum[69:64]), .cout(cout[68:64]), .b1(b1[2:0]), .b0(b0[2:0]));
mul_ppgen3 I1_63_ ( .p2_l(p2_l[63]), .b2(b2[2:0]),
     .am2(a[61]), .a(a[63]), .p2m1_l(p2_l[62]),
     .p1m1_l(p1_l[62]), .p0m1_l(p0_l[62]), .am4(a[59]), .sum(sum[63]),
     .cout(cout[63]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[63]),
     .p0_l(p0_l[63]));
mul_ppgen3 I1_62_ ( .p2_l(p2_l[62]), .b2(b2[2:0]), 
     .am2(a[60]), .a(a[62]), .p2m1_l(p2_l[61]),
     .p1m1_l(p1_l[61]), .p0m1_l(p0_l[61]), .am4(a[58]), .sum(sum[62]),
     .cout(cout[62]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[62]),
     .p0_l(p0_l[62]));
mul_ppgen3 I1_61_ ( .p2_l(p2_l[61]), .b2(b2[2:0]), 
     .am2(a[59]), .a(a[61]), .p2m1_l(p2_l[60]),
     .p1m1_l(p1_l[60]), .p0m1_l(p0_l[60]), .am4(a[57]), .sum(sum[61]),
     .cout(cout[61]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[61]),
     .p0_l(p0_l[61]));
mul_ppgen3 I1_60_ ( .p2_l(p2_l[60]), .b2(b2[2:0]), 
     .am2(a[58]), .a(a[60]), .p2m1_l(p2_l[59]),
     .p1m1_l(p1_l[59]), .p0m1_l(p0_l[59]), .am4(a[56]), .sum(sum[60]),
     .cout(cout[60]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[60]),
     .p0_l(p0_l[60]));
mul_ppgen3 I1_59_ ( .p2_l(p2_l[59]), .b2(b2[2:0]), 
     .am2(a[57]), .a(a[59]), .p2m1_l(p2_l[58]),
     .p1m1_l(p1_l[58]), .p0m1_l(p0_l[58]), .am4(a[55]), .sum(sum[59]),
     .cout(cout[59]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[59]),
     .p0_l(p0_l[59]));
mul_ppgen3 I1_58_ ( .p2_l(p2_l[58]), .b2(b2[2:0]), 
     .am2(a[56]), .a(a[58]), .p2m1_l(p2_l[57]),
     .p1m1_l(p1_l[57]), .p0m1_l(p0_l[57]), .am4(a[54]), .sum(sum[58]),
     .cout(cout[58]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[58]),
     .p0_l(p0_l[58]));
mul_ppgen3 I1_57_ ( .p2_l(p2_l[57]), .b2(b2[2:0]), 
     .am2(a[55]), .a(a[57]), .p2m1_l(p2_l[56]),
     .p1m1_l(p1_l[56]), .p0m1_l(p0_l[56]), .am4(a[53]), .sum(sum[57]),
     .cout(cout[57]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[57]),
     .p0_l(p0_l[57]));
mul_ppgen3 I1_56_ ( .p2_l(p2_l[56]), .b2(b2[2:0]), 
     .am2(a[54]), .a(a[56]), .p2m1_l(p2_l[55]),
     .p1m1_l(p1_l[55]), .p0m1_l(p0_l[55]), .am4(a[52]), .sum(sum[56]),
     .cout(cout[56]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[56]),
     .p0_l(p0_l[56]));
mul_ppgen3 I1_55_ ( .p2_l(p2_l[55]), .b2(b2[2:0]), 
     .am2(a[53]), .a(a[55]), .p2m1_l(p2_l[54]),
     .p1m1_l(p1_l[54]), .p0m1_l(p0_l[54]), .am4(a[51]), .sum(sum[55]),
     .cout(cout[55]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[55]),
     .p0_l(p0_l[55]));
mul_ppgen3 I1_54_ ( .p2_l(p2_l[54]), .b2(b2[2:0]), 
     .am2(a[52]), .a(a[54]), .p2m1_l(p2_l[53]),
     .p1m1_l(p1_l[53]), .p0m1_l(p0_l[53]), .am4(a[50]), .sum(sum[54]),
     .cout(cout[54]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[54]),
     .p0_l(p0_l[54]));
mul_ppgen3 I1_53_ ( .p2_l(p2_l[53]), .b2(b2[2:0]), 
     .am2(a[51]), .a(a[53]), .p2m1_l(p2_l[52]),
     .p1m1_l(p1_l[52]), .p0m1_l(p0_l[52]), .am4(a[49]), .sum(sum[53]),
     .cout(cout[53]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[53]),
     .p0_l(p0_l[53]));
mul_ppgen3 I1_52_ ( .p2_l(p2_l[52]), .b2(b2[2:0]), 
     .am2(a[50]), .a(a[52]), .p2m1_l(p2_l[51]),
     .p1m1_l(p1_l[51]), .p0m1_l(p0_l[51]), .am4(a[48]), .sum(sum[52]),
     .cout(cout[52]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[52]),
     .p0_l(p0_l[52]));
mul_ppgen3 I1_51_ ( .p2_l(p2_l[51]), .b2(b2[2:0]), 
     .am2(a[49]), .a(a[51]), .p2m1_l(p2_l[50]),
     .p1m1_l(p1_l[50]), .p0m1_l(p0_l[50]), .am4(a[47]), .sum(sum[51]),
     .cout(cout[51]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[51]),
     .p0_l(p0_l[51]));
mul_ppgen3 I1_50_ ( .p2_l(p2_l[50]), .b2(b2[2:0]), 
     .am2(a[48]), .a(a[50]), .p2m1_l(p2_l[49]),
     .p1m1_l(p1_l[49]), .p0m1_l(p0_l[49]), .am4(a[46]), .sum(sum[50]),
     .cout(cout[50]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[50]),
     .p0_l(p0_l[50]));
mul_ppgen3 I1_49_ ( .p2_l(p2_l[49]), .b2(b2[2:0]), 
     .am2(a[47]), .a(a[49]), .p2m1_l(p2_l[48]),
     .p1m1_l(p1_l[48]), .p0m1_l(p0_l[48]), .am4(a[45]), .sum(sum[49]),
     .cout(cout[49]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[49]),
     .p0_l(p0_l[49]));
mul_ppgen3 I1_48_ ( .p2_l(p2_l[48]), .b2(b2[2:0]), 
     .am2(a[46]), .a(a[48]), .p2m1_l(p2_l[47]),
     .p1m1_l(p1_l[47]), .p0m1_l(p0_l[47]), .am4(a[44]), .sum(sum[48]),
     .cout(cout[48]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[48]),
     .p0_l(p0_l[48]));
mul_ppgen3 I1_47_ ( .p2_l(p2_l[47]), .b2(b2[2:0]), 
     .am2(a[45]), .a(a[47]), .p2m1_l(p2_l[46]),
     .p1m1_l(p1_l[46]), .p0m1_l(p0_l[46]), .am4(a[43]), .sum(sum[47]),
     .cout(cout[47]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[47]),
     .p0_l(p0_l[47]));
mul_ppgen3 I1_46_ ( .p2_l(p2_l[46]), .b2(b2[2:0]), 
     .am2(a[44]), .a(a[46]), .p2m1_l(p2_l[45]),
     .p1m1_l(p1_l[45]), .p0m1_l(p0_l[45]), .am4(a[42]), .sum(sum[46]),
     .cout(cout[46]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[46]),
     .p0_l(p0_l[46]));
mul_ppgen3 I1_45_ ( .p2_l(p2_l[45]), .b2(b2[2:0]), 
     .am2(a[43]), .a(a[45]), .p2m1_l(p2_l[44]),
     .p1m1_l(p1_l[44]), .p0m1_l(p0_l[44]), .am4(a[41]), .sum(sum[45]),
     .cout(cout[45]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[45]),
     .p0_l(p0_l[45]));
mul_ppgen3 I1_44_ ( .p2_l(p2_l[44]), .b2(b2[2:0]), 
     .am2(a[42]), .a(a[44]), .p2m1_l(p2_l[43]),
     .p1m1_l(p1_l[43]), .p0m1_l(p0_l[43]), .am4(a[40]), .sum(sum[44]),
     .cout(cout[44]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[44]),
     .p0_l(p0_l[44]));
mul_ppgen3 I1_43_ ( .p2_l(p2_l[43]), .b2(b2[2:0]), 
     .am2(a[41]), .a(a[43]), .p2m1_l(p2_l[42]),
     .p1m1_l(p1_l[42]), .p0m1_l(p0_l[42]), .am4(a[39]), .sum(sum[43]),
     .cout(cout[43]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[43]),
     .p0_l(p0_l[43]));
mul_ppgen3 I1_42_ ( .p2_l(p2_l[42]), .b2(b2[2:0]), 
     .am2(a[40]), .a(a[42]), .p2m1_l(p2_l[41]),
     .p1m1_l(p1_l[41]), .p0m1_l(p0_l[41]), .am4(a[38]), .sum(sum[42]),
     .cout(cout[42]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[42]),
     .p0_l(p0_l[42]));
mul_ppgen3 I1_41_ ( .p2_l(p2_l[41]), .b2(b2[2:0]), 
     .am2(a[39]), .a(a[41]), .p2m1_l(p2_l[40]),
     .p1m1_l(p1_l[40]), .p0m1_l(p0_l[40]), .am4(a[37]), .sum(sum[41]),
     .cout(cout[41]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[41]),
     .p0_l(p0_l[41]));
mul_ppgen3 I1_40_ ( .p2_l(p2_l[40]), .b2(b2[2:0]), 
     .am2(a[38]), .a(a[40]), .p2m1_l(p2_l[39]),
     .p1m1_l(p1_l[39]), .p0m1_l(p0_l[39]), .am4(a[36]), .sum(sum[40]),
     .cout(cout[40]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[40]),
     .p0_l(p0_l[40]));
mul_ppgen3 I1_39_ ( .p2_l(p2_l[39]), .b2(b2[2:0]), 
     .am2(a[37]), .a(a[39]), .p2m1_l(p2_l[38]),
     .p1m1_l(p1_l[38]), .p0m1_l(p0_l[38]), .am4(a[35]), .sum(sum[39]),
     .cout(cout[39]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[39]),
     .p0_l(p0_l[39]));
mul_ppgen3 I1_38_ ( .p2_l(p2_l[38]), .b2(b2[2:0]), 
     .am2(a[36]), .a(a[38]), .p2m1_l(p2_l[37]),
     .p1m1_l(p1_l[37]), .p0m1_l(p0_l[37]), .am4(a[34]), .sum(sum[38]),
     .cout(cout[38]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[38]),
     .p0_l(p0_l[38]));
mul_ppgen3 I1_37_ ( .p2_l(p2_l[37]), .b2(b2[2:0]), 
     .am2(a[35]), .a(a[37]), .p2m1_l(p2_l[36]),
     .p1m1_l(p1_l[36]), .p0m1_l(p0_l[36]), .am4(a[33]), .sum(sum[37]),
     .cout(cout[37]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[37]),
     .p0_l(p0_l[37]));
mul_ppgen3 I1_36_ ( .p2_l(p2_l[36]), .b2(b2[2:0]), 
     .am2(a[34]), .a(a[36]), .p2m1_l(p2_l[35]),
     .p1m1_l(p1_l[35]), .p0m1_l(p0_l[35]), .am4(a[32]), .sum(sum[36]),
     .cout(cout[36]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[36]),
     .p0_l(p0_l[36]));
mul_ppgen3 I1_35_ ( .p2_l(p2_l[35]), .b2(b2[2:0]), 
     .am2(a[33]), .a(a[35]), .p2m1_l(p2_l[34]),
     .p1m1_l(p1_l[34]), .p0m1_l(p0_l[34]), .am4(a[31]), .sum(sum[35]),
     .cout(cout[35]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[35]),
     .p0_l(p0_l[35]));
mul_ppgen3 I1_34_ ( .p2_l(p2_l[34]), .b2(b2[2:0]), 
     .am2(a[32]), .a(a[34]), .p2m1_l(p2_l[33]),
     .p1m1_l(p1_l[33]), .p0m1_l(p0_l[33]), .am4(a[30]), .sum(sum[34]),
     .cout(cout[34]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[34]),
     .p0_l(p0_l[34]));
mul_ppgen3 I1_33_ ( .p2_l(p2_l[33]), .b2(b2[2:0]), 
     .am2(a[31]), .a(a[33]), .p2m1_l(p2_l[32]),
     .p1m1_l(p1_l[32]), .p0m1_l(p0_l[32]), .am4(a[29]), .sum(sum[33]),
     .cout(cout[33]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[33]),
     .p0_l(p0_l[33]));
mul_ppgen3 I1_32_ ( .p2_l(p2_l[32]), .b2(b2[2:0]), 
     .am2(a[30]), .a(a[32]), .p2m1_l(p2_l[31]),
     .p1m1_l(p1_l[31]), .p0m1_l(p0_l[31]), .am4(a[28]), .sum(sum[32]),
     .cout(cout[32]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[32]),
     .p0_l(p0_l[32]));
mul_ppgen3 I1_31_ ( .p2_l(p2_l[31]), .b2(b2[2:0]), 
     .am2(a[29]), .a(a[31]), .p2m1_l(p2_l[30]),
     .p1m1_l(p1_l[30]), .p0m1_l(p0_l[30]), .am4(a[27]), .sum(sum[31]),
     .cout(cout[31]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[31]),
     .p0_l(p0_l[31]));
mul_ppgen3 I1_30_ ( .p2_l(p2_l[30]), .b2(b2[2:0]), 
     .am2(a[28]), .a(a[30]), .p2m1_l(p2_l[29]),
     .p1m1_l(p1_l[29]), .p0m1_l(p0_l[29]), .am4(a[26]), .sum(sum[30]),
     .cout(cout[30]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[30]),
     .p0_l(p0_l[30]));
mul_ppgen3 I1_29_ ( .p2_l(p2_l[29]), .b2(b2[2:0]), 
     .am2(a[27]), .a(a[29]), .p2m1_l(p2_l[28]),
     .p1m1_l(p1_l[28]), .p0m1_l(p0_l[28]), .am4(a[25]), .sum(sum[29]),
     .cout(cout[29]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[29]),
     .p0_l(p0_l[29]));
mul_ppgen3 I1_28_ ( .p2_l(p2_l[28]), .b2(b2[2:0]), 
     .am2(a[26]), .a(a[28]), .p2m1_l(p2_l[27]),
     .p1m1_l(p1_l[27]), .p0m1_l(p0_l[27]), .am4(a[24]), .sum(sum[28]),
     .cout(cout[28]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[28]),
     .p0_l(p0_l[28]));
mul_ppgen3 I1_27_ ( .p2_l(p2_l[27]), .b2(b2[2:0]), 
     .am2(a[25]), .a(a[27]), .p2m1_l(p2_l[26]),
     .p1m1_l(p1_l[26]), .p0m1_l(p0_l[26]), .am4(a[23]), .sum(sum[27]),
     .cout(cout[27]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[27]),
     .p0_l(p0_l[27]));
mul_ppgen3 I1_26_ ( .p2_l(p2_l[26]), .b2(b2[2:0]), 
     .am2(a[24]), .a(a[26]), .p2m1_l(p2_l[25]),
     .p1m1_l(p1_l[25]), .p0m1_l(p0_l[25]), .am4(a[22]), .sum(sum[26]),
     .cout(cout[26]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[26]),
     .p0_l(p0_l[26]));
mul_ppgen3 I1_25_ ( .p2_l(p2_l[25]), .b2(b2[2:0]), 
     .am2(a[23]), .a(a[25]), .p2m1_l(p2_l[24]),
     .p1m1_l(p1_l[24]), .p0m1_l(p0_l[24]), .am4(a[21]), .sum(sum[25]),
     .cout(cout[25]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[25]),
     .p0_l(p0_l[25]));
mul_ppgen3 I1_24_ ( .p2_l(p2_l[24]), .b2(b2[2:0]), 
     .am2(a[22]), .a(a[24]), .p2m1_l(p2_l[23]),
     .p1m1_l(p1_l[23]), .p0m1_l(p0_l[23]), .am4(a[20]), .sum(sum[24]),
     .cout(cout[24]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[24]),
     .p0_l(p0_l[24]));
mul_ppgen3 I1_23_ ( .p2_l(p2_l[23]), .b2(b2[2:0]), 
     .am2(a[21]), .a(a[23]), .p2m1_l(p2_l[22]),
     .p1m1_l(p1_l[22]), .p0m1_l(p0_l[22]), .am4(a[19]), .sum(sum[23]),
     .cout(cout[23]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[23]),
     .p0_l(p0_l[23]));
mul_ppgen3 I1_22_ ( .p2_l(p2_l[22]), .b2(b2[2:0]), 
     .am2(a[20]), .a(a[22]), .p2m1_l(p2_l[21]),
     .p1m1_l(p1_l[21]), .p0m1_l(p0_l[21]), .am4(a[18]), .sum(sum[22]),
     .cout(cout[22]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[22]),
     .p0_l(p0_l[22]));
mul_ppgen3 I1_21_ ( .p2_l(p2_l[21]), .b2(b2[2:0]), 
     .am2(a[19]), .a(a[21]), .p2m1_l(p2_l[20]),
     .p1m1_l(p1_l[20]), .p0m1_l(p0_l[20]), .am4(a[17]), .sum(sum[21]),
     .cout(cout[21]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[21]),
     .p0_l(p0_l[21]));
mul_ppgen3 I1_20_ ( .p2_l(p2_l[20]), .b2(b2[2:0]), 
     .am2(a[18]), .a(a[20]), .p2m1_l(p2_l[19]),
     .p1m1_l(p1_l[19]), .p0m1_l(p0_l[19]), .am4(a[16]), .sum(sum[20]),
     .cout(cout[20]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[20]),
     .p0_l(p0_l[20]));
mul_ppgen3 I1_19_ ( .p2_l(p2_l[19]), .b2(b2[2:0]), 
     .am2(a[17]), .a(a[19]), .p2m1_l(p2_l[18]),
     .p1m1_l(p1_l[18]), .p0m1_l(p0_l[18]), .am4(a[15]), .sum(sum[19]),
     .cout(cout[19]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[19]),
     .p0_l(p0_l[19]));
mul_ppgen3 I1_18_ ( .p2_l(p2_l[18]), .b2(b2[2:0]), 
     .am2(a[16]), .a(a[18]), .p2m1_l(p2_l[17]),
     .p1m1_l(p1_l[17]), .p0m1_l(p0_l[17]), .am4(a[14]), .sum(sum[18]),
     .cout(cout[18]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[18]),
     .p0_l(p0_l[18]));
mul_ppgen3 I1_17_ ( .p2_l(p2_l[17]), .b2(b2[2:0]), 
     .am2(a[15]), .a(a[17]), .p2m1_l(p2_l[16]),
     .p1m1_l(p1_l[16]), .p0m1_l(p0_l[16]), .am4(a[13]), .sum(sum[17]),
     .cout(cout[17]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[17]),
     .p0_l(p0_l[17]));
mul_ppgen3 I1_16_ ( .p2_l(p2_l[16]), .b2(b2[2:0]), 
     .am2(a[14]), .a(a[16]), .p2m1_l(p2_l[15]),
     .p1m1_l(p1_l[15]), .p0m1_l(p0_l[15]), .am4(a[12]), .sum(sum[16]),
     .cout(cout[16]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[16]),
     .p0_l(p0_l[16]));
mul_ppgen3 I1_15_ ( .p2_l(p2_l[15]), .b2(b2[2:0]), 
     .am2(a[13]), .a(a[15]), .p2m1_l(p2_l[14]),
     .p1m1_l(p1_l[14]), .p0m1_l(p0_l[14]), .am4(a[11]), .sum(sum[15]),
     .cout(cout[15]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[15]),
     .p0_l(p0_l[15]));
mul_ppgen3 I1_14_ ( .p2_l(p2_l[14]), .b2(b2[2:0]), 
     .am2(a[12]), .a(a[14]), .p2m1_l(p2_l[13]),
     .p1m1_l(p1_l[13]), .p0m1_l(p0_l[13]), .am4(a[10]), .sum(sum[14]),
     .cout(cout[14]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[14]),
     .p0_l(p0_l[14]));
mul_ppgen3 I1_13_ ( .p2_l(p2_l[13]), .b2(b2[2:0]), 
     .am2(a[11]), .a(a[13]), .p2m1_l(p2_l[12]),
     .p1m1_l(p1_l[12]), .p0m1_l(p0_l[12]), .am4(a[9]), .sum(sum[13]),
     .cout(cout[13]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[13]),
     .p0_l(p0_l[13]));
mul_ppgen3 I1_12_ ( .p2_l(p2_l[12]), .b2(b2[2:0]), 
     .am2(a[10]), .a(a[12]), .p2m1_l(p2_l[11]),
     .p1m1_l(p1_l[11]), .p0m1_l(p0_l[11]), .am4(a[8]), .sum(sum[12]),
     .cout(cout[12]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[12]),
     .p0_l(p0_l[12]));
mul_ppgen3 I1_11_ ( .p2_l(p2_l[11]), .b2(b2[2:0]), 
     .am2(a[9]), .a(a[11]), .p2m1_l(p2_l[10]),
     .p1m1_l(p1_l[10]), .p0m1_l(p0_l[10]), .am4(a[7]), .sum(sum[11]),
     .cout(cout[11]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[11]),
     .p0_l(p0_l[11]));
mul_ppgen3 I1_10_ ( .p2_l(p2_l[10]), .b2(b2[2:0]), 
     .am2(a[8]), .a(a[10]), .p2m1_l(p2_l[9]),
     .p1m1_l(p1_l[9]), .p0m1_l(p0_l[9]), .am4(a[6]), .sum(sum[10]),
     .cout(cout[10]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[10]),
     .p0_l(p0_l[10]));
mul_ppgen3 I1_9_ ( .p2_l(p2_l[9]), .b2(b2[2:0]), 
     .am2(a[7]), .a(a[9]), .p2m1_l(p2_l[8]),
     .p1m1_l(p1_l[8]), .p0m1_l(p0_l[8]), .am4(a[5]), .sum(sum[9]),
     .cout(cout[9]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[9]),
     .p0_l(p0_l[9]));
mul_ppgen3 I1_8_ ( .p2_l(p2_l[8]), .b2(b2[2:0]), 
     .am2(a[6]), .a(a[8]), .p2m1_l(p2_l[7]),
     .p1m1_l(p1_l[7]), .p0m1_l(p0_l[7]), .am4(a[4]), .sum(sum[8]),
     .cout(cout[8]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[8]),
     .p0_l(p0_l[8]));
mul_ppgen3 I1_7_ ( .p2_l(p2_l[7]), .b2(b2[2:0]), 
     .am2(a[5]), .a(a[7]), .p2m1_l(p2_l[6]),
     .p1m1_l(p1_l[6]), .p0m1_l(p0_l[6]), .am4(a[3]), .sum(sum[7]),
     .cout(cout[7]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[7]),
     .p0_l(p0_l[7]));
mul_ppgen3 I1_6_ ( .p2_l(p2_l[6]), .b2(b2[2:0]), 
     .am2(a[4]), .a(a[6]), .p2m1_l(p2_l[5]),
     .p1m1_l(p1_l[5]), .p0m1_l(p0_l[5]), .am4(a[2]), .sum(sum[6]),
     .cout(cout[6]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[6]),
     .p0_l(p0_l[6]));
mul_ppgen3 I1_5_ ( .p2_l(p2_l[5]), .b2(b2[2:0]), 
     .am2(a[3]), .a(a[5]), .p2m1_l(p2_l[4]),
     .p1m1_l(p1_l[4]), .p0m1_l(p0_l[4]), .am4(a[1]), .sum(sum[5]),
     .cout(cout[5]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[5]),
     .p0_l(p0_l[5]));
mul_ppgen3 I1_4_ ( .p2_l(p2_l[4]), .b2(b2[2:0]), 
     .am2(a[2]), .a(a[4]), .p2m1_l(1'b1),
     .p1m1_l(p1_l[3]), .p0m1_l(p0_l[3]), .am4(a[0]), .sum(sum[4]),
     .cout(cout[4]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[4]),
     .p0_l(p0_l[4]));
mul_ppgen3lsb4 I0 ( .cout(cout[3:1]), .a(a[3:0]), .sum(sum[3:0]),
     .p1_l(p1_l[3]), .p0_l(p0_l[3]), .b1(b1[2:0]), .b0(b0[2:0]));

endmodule //mul_ppgenrow3

module mul_ppgensign ( p_l, z, b, pm1_l );
output  p_l, z;
input  pm1_l;
input [2:0]  b;

assign p_l = ~(b[1] & b[2]);
assign z = b[0] ? ~pm1_l : ~p_l ;

endmodule //mul_ppgensign

module mul_ppgen ( p_l, z, a, b, pm1_l );
output  p_l, z;
input  a, pm1_l;
input [2:0]  b;

assign p_l = ~((a ^ b[2]) & b[1]) ;
assign z = b[0] ? ~pm1_l : ~p_l ;

endmodule //mul_ppgen

module mul_mux2 ( z, d0, d1, s );
output  z;
input  d0, d1, s;

assign z = s ? d1 : d0 ;

endmodule // mul_mux2 

module mul_booth(
	head,
        b_in,
        b0, b1, b2, b3, b4, b5, b6, b7,
	b8, b9, b10, b11, b12, b13, b14, b15, b16,
	clk, se, si, so, mul_step, tm_l
	);
input		head;		// begin of the MUL operation
input   [63:0] 	b_in;
input		clk, se, si, mul_step, tm_l;
output  [2:0]  	b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15;
output 		b16;
output 		so;

wire  [63:31] 	b;
wire [2:0] 	b0_in0, b1_in0,  b2_in0,  b3_in0,  b4_in0,  b5_in0,  b6_in0,  b7_in0 ;
wire [2:0] 	b8_in0, b9_in0, b10_in0, b11_in0, b12_in0, b13_in0, b14_in0, b15_in0 ;
wire [2:0] 	b0_in1, b1_in1,  b2_in1,  b3_in1,  b4_in1,  b5_in1,  b6_in1,  b7_in1 ;
wire [2:0] 	b8_in1, b9_in1, b10_in1, b11_in1, b12_in1, b13_in1, b14_in1, b15_in1 ;
wire 	   	b16_in1;

wire [2:0] 	b0_outmx, b1_outmx, b2_outmx, b3_outmx, b4_outmx, b5_outmx, b6_outmx;
wire [2:0] 	b7_outmx, b8_outmx, b9_outmx, b10_outmx, b11_outmx, b12_outmx, b13_outmx;
wire [2:0] 	b14_outmx, b15_outmx;
wire 	   	b16_outmx;
wire		clk_enb0, clk_enb1;


  mul_bodec 		encode0_a(
				.x  (1'b0),
				.b  (b_in[15:0]),
				.b0 (b0_in0),
				.b1 (b1_in0),
				.b2 (b2_in0),
				.b3 (b3_in0),
				.b4 (b4_in0),
				.b5 (b5_in0),
				.b6 (b6_in0),
				.b7 (b7_in0)
				);
				//remove 16th row since it's never the last row
				//b8_in0 = 3'b010; 
  mul_bodec		encode0_b(
				.x  (b_in[15]),
				.b  (b_in[31:16]),
				.b0 (b8_in0),
				.b1 (b9_in0),
				.b2 (b10_in0),
				.b3 (b11_in0),
				.b4 (b12_in0),
				.b5 (b13_in0),
				.b6 (b14_in0),
				.b7 (b15_in0)
				);
				// remove 32th row since it's never the last row 
				// b16_in0 = 3'b010 ;

  // Pipe picked address [63:31] and hold flop

  clken_buf     ckbuf_0(.clk(clk_enb0), .rclk(clk), .enb_l(~mul_step), .tmb_l(tm_l));
  clken_buf     ckbuf_1(.clk(clk_enb1), .rclk(clk), .enb_l(~(head & mul_step)), .tmb_l(tm_l));

  dff_s 			hld_dff0(.din(b_in[31]), .clk(clk_enb1), .q(b[31]),
                        	.se(se), .si(), .so());
  dff_s #(32) 		hld_dff(.din(b_in[63:32]), .clk(clk_enb1), .q(b[63:32]),
				.se(se), .si(), .so());

  mul_bodec     	encode1_a(
                        	.x  (b[31]),
                        	.b  (b[47:32]),
                        	.b0 (b0_in1),
                        	.b1 (b1_in1),
                        	.b2 (b2_in1),
                        	.b3 (b3_in1),
                        	.b4 (b4_in1),
                        	.b5 (b5_in1),
                        	.b6 (b6_in1),
                        	.b7 (b7_in1)
                        	);
                        	//remove 16th row since it's never the last row
                        	//b8_in1 = 3'b010;
  mul_bodec     	encode1_b(
                        	.x  (b[47]),
                        	.b  (b[63:48]),
                        	.b0 (b8_in1),
                        	.b1 (b9_in1),
                        	.b2 (b10_in1),
                        	.b3 (b11_in1),
                        	.b4 (b12_in1),
                        	.b5 (b13_in1),
                        	.b6 (b14_in1),
                        	.b7 (b15_in1)
                        	);
				assign b16_in1 = b[63] ;

// Select booth encoded b outputs and flop based on the cycle0 and cycle1 

  dp_mux2es #(3)    out_mux0(.dout(b0_outmx[2:0]),
                        .in0(b0_in0[2:0]),
                        .in1(b0_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux1(.dout(b1_outmx[2:0]),
                        .in0(b1_in0[2:0]),
                        .in1(b1_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux2(.dout(b2_outmx[2:0]),
                        .in0(b2_in0[2:0]),
                        .in1(b2_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux3(.dout(b3_outmx[2:0]),
                        .in0(b3_in0[2:0]),
                        .in1(b3_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux4(.dout(b4_outmx[2:0]),
                        .in0(b4_in0[2:0]),
                        .in1(b4_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux5(.dout(b5_outmx[2:0]),
                        .in0(b5_in0[2:0]),
                        .in1(b5_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux6(.dout(b6_outmx[2:0]),
                        .in0(b6_in0[2:0]),
                        .in1(b6_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux7(.dout(b7_outmx[2:0]),
                        .in0(b7_in0[2:0]),
                        .in1(b7_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux8(.dout(b8_outmx[2:0]),
                        .in0(b8_in0[2:0]),
                        .in1(b8_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux9(.dout(b9_outmx[2:0]),
                        .in0(b9_in0[2:0]),
                        .in1(b9_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux10(.dout(b10_outmx[2:0]),
                        .in0(b10_in0[2:0]),
                        .in1(b10_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux11(.dout(b11_outmx[2:0]),
                        .in0(b11_in0[2:0]),
                        .in1(b11_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux12(.dout(b12_outmx[2:0]),
                        .in0(b12_in0[2:0]),
                        .in1(b12_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux13(.dout(b13_outmx[2:0]),
                        .in0(b13_in0[2:0]),
                        .in1(b13_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux14(.dout(b14_outmx[2:0]),
                        .in0(b14_in0[2:0]),
                        .in1(b14_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux15(.dout(b15_outmx[2:0]),
                        .in0(b15_in0[2:0]),
                        .in1(b15_in1[2:0]),
                        .sel(~head));
  dp_mux2es         out_mux16(.dout(b16_outmx),
                        .in0(1'b0),
                        .in1(b16_in1),
                        .sel(~head));

  dff_s #(3)    out_dff0 (.din(b0_outmx[2:0]), .clk(clk_enb0), .q(b0[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff1 (.din(b1_outmx[2:0]), .clk(clk_enb0), .q(b1[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff2 (.din(b2_outmx[2:0]), .clk(clk_enb0), .q(b2[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff3 (.din(b3_outmx[2:0]), .clk(clk_enb0), .q(b3[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff4 (.din(b4_outmx[2:0]), .clk(clk_enb0), .q(b4[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff5 (.din(b5_outmx[2:0]), .clk(clk_enb0), .q(b5[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff6 (.din(b6_outmx[2:0]), .clk(clk_enb0), .q(b6[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff7 (.din(b7_outmx[2:0]), .clk(clk_enb0), .q(b7[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff8 (.din(b8_outmx[2:0]), .clk(clk_enb0), .q(b8[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff9 (.din(b9_outmx[2:0]), .clk(clk_enb0), .q(b9[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff10 (.din(b10_outmx[2:0]), .clk(clk_enb0), .q(b10[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff11 (.din(b11_outmx[2:0]), .clk(clk_enb0), .q(b11[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff12 (.din(b12_outmx[2:0]), .clk(clk_enb0), .q(b12[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff13 (.din(b13_outmx[2:0]), .clk(clk_enb0), .q(b13[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff14 (.din(b14_outmx[2:0]), .clk(clk_enb0), .q(b14[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff15 (.din(b15_outmx[2:0]), .clk(clk_enb0), .q(b15[2:0]),
			.se(se), .si(), .so());
  dff_s 	      out_dff16 (.din(b16_outmx), .clk(clk_enb0), .q(b16),
			.se(se), .si(), .so());
endmodule //mul_booth

module mul_bodec (x, b,  
        b0, b1, b2, b3, b4, b5, b6, b7);

input	x;
input   [15:0] 	b;
output  [2:0] 	b0, b1, b2, b3, b4, b5, b6, b7; 

assign b0[2] = b[1];
assign b0[1] = ~((b[1] & b[0] & x) | (~b[1] & ~b[0] & ~x)) ;
assign b0[0] = (~b[1] & b[0] & x) | (b[1] & ~b[0] & ~x) ;

assign b1[2] = b[3]; 
assign b1[1] = ~((b[3] & b[2] & b[1]) | (~b[3] & ~b[2] & ~b[1])) ;
assign b1[0] = (~b[3] & b[2] & b[1]) | (b[3] & ~b[2] & ~b[1]) ;

assign b2[2] = b[5]; 
assign b2[1] = ~((b[5] & b[4] & b[3]) | (~b[5] & ~b[4] & ~b[3])) ;
assign b2[0] = (~b[5] & b[4] & b[3]) | (b[5] & ~b[4] & ~b[3]) ;

assign b3[2] = b[7] ;
assign b3[1] = ~((b[7] & b[6] & b[5]) | (~b[7] & ~b[6] & ~b[5])) ;
assign b3[0] = (~b[7] & b[6] & b[5]) | (b[7] & ~b[6] & ~b[5]) ;

assign b4[2] = b[9] ;
assign b4[1] = ~((b[9] & b[8] & b[7]) | (~b[9] & ~b[8] & ~b[7])) ;
assign b4[0] = (~b[9] & b[8] & b[7]) | (b[9] & ~b[8] & ~b[7]) ;

assign b5[2] = b[11] ;
assign b5[1] = ~((b[11] & b[10] & b[9]) | (~b[11] & ~b[10] & ~b[9])) ;
assign b5[0] = (~b[11] & b[10] & b[9]) | (b[11] & ~b[10] & ~b[9]) ;

assign b6[2] = b[13] ;
assign b6[1] = ~((b[13] & b[12] & b[11]) | (~b[13] & ~b[12] & ~b[11])) ;
assign b6[0] = (~b[13] & b[12] & b[11]) | (b[13] & ~b[12] & ~b[11]) ;

assign b7[2] = b[15] ;
assign b7[1] = ~((b[15] & b[14] & b[13]) | (~b[15] & ~b[14] & ~b[13])) ;
assign b7[0] = (~b[15] & b[14] & b[13]) | (b[15] & ~b[14] & ~b[13]) ;

endmodule // mul_bodec

// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: swrvr_clib.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////
/*
//
//  Module Name: swrvr_clib.v
//      Description: Design control behavioural library
*/                 





// POSITVE-EDGE TRIGGERED FLOP with SCAN
module dff_s (din, clk, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			clk ;	// clk or scan clk

output	[SIZE-1:0]	q ;	// output

input			se ;	// scan-enable
input	[SIZE-1:0]	si ;	// scan-input
output	[SIZE-1:0]	so ;	// scan-output

reg 	[SIZE-1:0]	q ;


always @ (posedge clk)
  q[SIZE-1:0]  <= din[SIZE-1:0] ;










endmodule // dff_s

// POSITVE-EDGE TRIGGERED FLOP with SCAN for Shadow-scan
module dff_sscan (din, clk, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			clk ;	// clk or scan clk

output	[SIZE-1:0]	q ;	// output

input			se ;	// scan-enable
input	[SIZE-1:0]	si ;	// scan-input
output	[SIZE-1:0]	so ;	// scan-output

reg 	[SIZE-1:0]	q ;










always @ (posedge clk)
  q[SIZE-1:0]  <= din[SIZE-1:0] ;

assign so={SIZE{1'b0}};


endmodule // dff_sscan

// POSITVE-EDGE TRIGGERED FLOP without SCAN
module dff_ns (din, clk, q);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			clk ;	// clk

output	[SIZE-1:0]	q ;	// output

reg 	[SIZE-1:0]	q ;

always @ (posedge clk)

	q[SIZE-1:0]  <= din[SIZE-1:0] ;

endmodule // dff_ns

// POSITIVE-EDGE TRIGGERED FLOP with SCAN, RESET
module dffr_s (din, clk, rst, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			clk ;	// clk or scan clk
input			rst ;	// reset

output	[SIZE-1:0]	q ;	// output

input			se ;	// scan-enable
input	[SIZE-1:0]	si ;	// scan-input
output	[SIZE-1:0]	so ;	// scan-output

reg 	[SIZE-1:0]	q ;


always @ (posedge clk)
	q[SIZE-1:0]  <= ((rst) ? {SIZE{1'b0}}  : din[SIZE-1:0] );










endmodule // dffr_s

// POSITIVE-EDGE TRIGGERED FLOP with SCAN, RESET_L
module dffrl_s (din, clk, rst_l, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			clk ;	// clk or scan clk
input			rst_l ;	// reset

output	[SIZE-1:0]	q ;	// output

input			se ;	// scan-enable
input	[SIZE-1:0]	si ;	// scan-input
output	[SIZE-1:0]	so ;	// scan-output

reg 	[SIZE-1:0]	q ;


always @ (posedge clk)
	q[SIZE-1:0]  <= rst_l ? din[SIZE-1:0] : {SIZE{1'b0}};










endmodule // dffrl_s

// POSITIVE-EDGE TRIGGERED FLOP with RESET, without SCAN
module dffr_ns (din, clk, rst, q);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			clk ;	// clk
input			rst ;	// reset

output	[SIZE-1:0]	q ;	// output

reg 	[SIZE-1:0]	q ;

// synopsys sync_set_reset "rst"
always @ (posedge clk)
  q[SIZE-1:0] <= rst ? {SIZE{1'b0}} : din[SIZE-1:0];
   
endmodule // dffr_ns

// POSITIVE-EDGE TRIGGERED FLOP with RESET_L, without SCAN
module dffrl_ns (din, clk, rst_l, q);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			clk ;	// clk
input			rst_l ;	// reset

output	[SIZE-1:0]	q ;	// output

reg 	[SIZE-1:0]	q ;

// synopsys sync_set_reset "rst_l"
always @ (posedge clk)
  q[SIZE-1:0] <= rst_l ? din[SIZE-1:0] : {SIZE{1'b0}};

endmodule // dffrl_ns

// POSITIVE-EDGE TRIGGERED FLOP with SCAN and FUNCTIONAL ENABLE
module dffe_s (din, en, clk, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			en ;	// functional enable
input			clk ;	// clk or scan clk

output	[SIZE-1:0]	q ;	// output

input			se ;	// scan-enable
input	[SIZE-1:0]	si ;	// scan-input
output	[SIZE-1:0]	so ;	// scan-output

reg 	[SIZE-1:0]	q ;

// Enable Interpretation. Ultimate interpretation depends on design
// 
// en	se	out
//------------------
// x	1	sin ; scan dominates
// 1  	0	din
// 0 	0	q
//


always @ (posedge clk)
	q[SIZE-1:0]  <= ((en) ? din[SIZE-1:0] : q[SIZE-1:0]) ;









endmodule // dffe_s

// POSITIVE-EDGE TRIGGERED FLOP with enable, without SCAN
module dffe_ns (din, en, clk, q);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			en ;	// functional enable
input			clk ;	// clk

output	[SIZE-1:0]	q ;	// output

reg 	[SIZE-1:0]	q ;

always @ (posedge clk)
  q[SIZE-1:0] <= en ? din[SIZE-1:0] : q[SIZE-1:0];

endmodule // dffe_ns

// POSITIVE-EDGE TRIGGERED FLOP with RESET, FUNCTIONAL ENABLE, SCAN.
module dffre_s (din, rst, en, clk, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			en ;	// functional enable
input			rst ;	// reset
input			clk ;	// clk or scan clk

output	[SIZE-1:0]	q ;	// output

input			se ;	// scan-enable
input	[SIZE-1:0]	si ;	// scan-input
output	[SIZE-1:0]	so ;	// scan-output

reg 	[SIZE-1:0]	q ;

// Enable Interpretation. Ultimate interpretation depends on design
// 
// rst	en	se	out
//------------------
// 1	x	x	0   ; reset dominates
// 0	x	1	sin ; scan dominates
// 0	1  	0	din
// 0 	0 	0	q
//


always @ (posedge clk)
	q[SIZE-1:0]  <= (rst ? {SIZE{1'b0}} : ((en) ? din[SIZE-1:0] : q[SIZE-1:0])) ;











endmodule // dffre_s

// POSITIVE-EDGE TRIGGERED FLOP with RESET_L, FUNCTIONAL ENABLE, SCAN.
module dffrle_s (din, rst_l, en, clk, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			en ;	// functional enable
input			rst_l ;	// reset
input			clk ;	// clk or scan clk

output	[SIZE-1:0]	q ;	// output

input			se ;	// scan-enable
input	[SIZE-1:0]	si ;	// scan-input
output	[SIZE-1:0]	so ;	// scan-output

reg 	[SIZE-1:0]	q ;

// Enable Interpretation. Ultimate interpretation depends on design
// 
// rst	en	se	out
//------------------
// 0	x	x	0   ; reset dominates
// 1	x	1	sin ; scan dominates
// 1	1  	0	din
// 1 	0 	0	q
//


always @ (posedge clk)
	 q[SIZE-1:0]  <= (rst_l ? ((en) ? din[SIZE-1:0] : q[SIZE-1:0]) : {SIZE{1'b0}}) ;










endmodule // dffrle_s

// POSITIVE-EDGE TRIGGERED FLOP with RESET, ENABLE, without SCAN.
module dffre_ns (din, rst, en, clk, q);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			en ;	// functional enable
input			rst ;	// reset
input			clk ;	// clk

output	[SIZE-1:0]	q ;	// output

reg 	[SIZE-1:0]	q ;

// Enable Interpretation. Ultimate interpretation depends on design
// 
// rst	en	out
//------------------
// 1	x	0   ; reset dominates
// 0	1  	din
// 0 	0 	q
//

// synopsys sync_set_reset "rst"
always @ (posedge clk)
  q[SIZE-1:0] <= rst ? {SIZE{1'b0}} : ((en) ? din[SIZE-1:0] : q[SIZE-1:0]);

endmodule // dffre_ns

// POSITIVE-EDGE TRIGGERED FLOP with RESET_L, ENABLE, without SCAN.
module dffrle_ns (din, rst_l, en, clk, q);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			en ;	// functional enable
input			rst_l ;	// reset
input			clk ;	// clk

output	[SIZE-1:0]	q ;	// output

reg 	[SIZE-1:0]	q ;

// Enable Interpretation. Ultimate interpretation depends on design
// 
// rst	en	out
//------------------
// 0	x	0   ; reset dominates
// 1	1  	din
// 1 	0 	q
//

// synopsys sync_set_reset "rst_l"
always @ (posedge clk)
  q[SIZE-1:0] <= rst_l ? ((en) ? din[SIZE-1:0] : q[SIZE-1:0]) : {SIZE{1'b0}} ;

endmodule // dffrle_ns

// POSITIVE-EDGE TRIGGERED FLOP with SCAN, and ASYNC RESET
module dffr_async (din, clk, rst, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clk ;   // clk or scan clk
input                   rst ;   // reset

output  [SIZE-1:0]      q ;     // output

input                   se ;    // scan-enable
input   [SIZE-1:0]      si ;    // scan-input
output  [SIZE-1:0]      so ;    // scan-output

reg     [SIZE-1:0]      q ;


always @ (posedge clk or posedge rst)
	q[SIZE-1:0]  <= rst ? {SIZE{1'b0}} : din[SIZE-1:0];










endmodule // dffr_async

// POSITIVE-EDGE TRIGGERED FLOP with SCAN, and ASYNC RESET_L
module dffrl_async (din, clk, rst_l, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clk ;   // clk or scan clk
input                   rst_l ;   // reset

output  [SIZE-1:0]      q ;     // output

input                   se ;    // scan-enable
input   [SIZE-1:0]      si ;    // scan-input
output  [SIZE-1:0]      so ;    // scan-output

reg     [SIZE-1:0]      q ;


always @ (posedge clk or negedge rst_l)
 
  if (!rst_l) q[SIZE-1:0] <= {SIZE{1'b0}}; else q[SIZE-1:0]  <= din[SIZE-1:0];
 












endmodule // dffrl_async

// POSITIVE-EDGE TRIGGERED FLOP with ASYNC RESET, without SCAN
//module dffr_async_ns (din, clk, rst, q);
//// synopsys template
//parameter SIZE = 1;
//input   [SIZE-1:0]      din ;   // data in
//input                   clk ;   // clk or scan clk
//input                   rst ;   // reset
//output  [SIZE-1:0]      q ;     // output
//reg     [SIZE-1:0]      q ;
// Reset dominates
//// synopsys async_set_reset "rst"
//always @ (posedge clk or posedge rst)
//        if(rst) q[SIZE-1:0]  <= {SIZE{1'b0}};
//        else if(clk) q[SIZE-1:0]  <= din[SIZE-1:0];
//endmodule // dffr_async_ns

// POSITIVE-EDGE TRIGGERED FLOP with ASYNC RESET_L, without SCAN
module dffrl_async_ns (din, clk, rst_l, q);
// synopsys template

parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clk ;   // clk or scan clk
input                   rst_l ;   // reset

output  [SIZE-1:0]      q ;     // output

// Reset dominates
// synopsys async_set_reset "rst_l"
 reg [SIZE-1:0] q;   
always @ (posedge clk or negedge rst_l) begin
 
    if (~rst_l) begin
        q[SIZE-1:0] <=  {SIZE{1'b0}};
    end else begin
        q[SIZE-1:0] <=  ({SIZE{rst_l}} & din[SIZE-1:0]);
    end
 



end

//   reg  [SIZE-1:0]   qm, qs, qm_l, qs_l, qm_f, qs_f;
//   wire              s_l;
//   assign            s_l = 1'b1;
//
//   always @ (rst_l or qm)   qm_l = ~(qm & {SIZE{rst_l}});
//   always @ (s_l or qs)   qs_l = ~(qs & {SIZE{s_l}});
//   always @ (s_l or qm_l) qm_f = ~(qm_l & {SIZE{s_l}});
//   always @ (rst_l or qs_l) qs_f = ~(qs_l & {SIZE{rst_l}});
//
//   always @ (clk or din or qm_f)
//      qm <= clk ? qm_f : din;
//
//   always @ (clk or qm_l or qs_f)
//      qs <= clk ? qm_l : qs_f;
//
//   assign q  = ~qs;

endmodule // dffrl_async_ns

// 2:1 MUX WITH DECODED SELECTS
module mux2ds (dout, in0, in1, sel0, sel1) ;
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in0;
input	[SIZE-1:0]	in1;
input			sel0;
input			sel1;

// reg declaration does not imply state being maintained
// across cycles. Used to construct case statement and
// always updated by inputs every cycle.
reg	[SIZE-1:0]	dout ;

// priority encoding takes care of mutex'ing selects.




wire [1:0] sel = {sel1, sel0}; // 0in one_hot
   
always @ (sel0 or sel1 or in0 or in1)

	case ({sel1,sel0}) // synopsys infer_mux
		2'b01 :	dout = in0 ;
		2'b10 : dout = in1 ;
		2'b11 : dout = {SIZE{1'bx}} ;
		2'b00 : dout = {SIZE{1'bx}} ;
			// 2'b00 : // E.g. 4state vs. 2state modelling.
			// begin
			//	`ifdef FOUR_STATE
			//		dout = {SIZE{1'bx}};
			//	`else
			//		begin
			//		dout = {SIZE{1'b0}};
			//		$error();
			//		end
			//	`endif
			// end
		default : dout = {SIZE{1'bx}};
	endcase

endmodule // mux2ds

// 3:1 MUX WITH DECODED SELECTS
module mux3ds (dout, in0, in1, in2, sel0, sel1, sel2) ;
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in0;
input	[SIZE-1:0]	in1;
input	[SIZE-1:0]	in2;
input			sel0;
input			sel1;
input			sel2;

// reg declaration does not imply state being maintained
// across cycles. Used to construct case statement and
// always updated by inputs every cycle.
reg	[SIZE-1:0]	dout ;





wire [2:0] sel = {sel2,sel1,sel0}; // 0in one_hot
   
// priority encoding takes care of mutex'ing selects.
always @ (sel0 or sel1 or sel2 or in0 or in1 or in2)

	case ({sel2,sel1,sel0}) 
		3'b001 : dout = in0 ;
		3'b010 : dout = in1 ;
		3'b100 : dout = in2 ;
		3'b000 : dout = {SIZE{1'bx}} ;
		3'b011 : dout = {SIZE{1'bx}} ;
		3'b101 : dout = {SIZE{1'bx}} ;
		3'b110 : dout = {SIZE{1'bx}} ;
		3'b111 : dout = {SIZE{1'bx}} ;
		default : dout = {SIZE{1'bx}};
			// two state vs four state modelling will be added.
	endcase

endmodule // mux3ds

// 4:1 MUX WITH DECODED SELECTS
module mux4ds (dout, in0, in1, in2, in3, sel0, sel1, sel2, sel3) ;
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in0;
input	[SIZE-1:0]	in1;
input	[SIZE-1:0]	in2;
input	[SIZE-1:0]	in3;
input			sel0;
input			sel1;
input			sel2;
input			sel3;

// reg declaration does not imply state being maintained
// across cycles. Used to construct case statement and
// always updated by inputs every cycle.
reg	[SIZE-1:0]	dout ;




   
wire [3:0] sel = {sel3,sel2,sel1,sel0}; // 0in one_hot
   
// priority encoding takes care of mutex'ing selects.
always @ (sel0 or sel1 or sel2 or sel3 or in0 or in1 or in2 or in3)

	case ({sel3,sel2,sel1,sel0}) 
		4'b0001 : dout = in0 ;
		4'b0010 : dout = in1 ;
		4'b0100 : dout = in2 ;
		4'b1000 : dout = in3 ;
		4'b0000 : dout = {SIZE{1'bx}} ;
		4'b0011 : dout = {SIZE{1'bx}} ;
		4'b0101 : dout = {SIZE{1'bx}} ;
		4'b0110 : dout = {SIZE{1'bx}} ;
		4'b0111 : dout = {SIZE{1'bx}} ;
		4'b1001 : dout = {SIZE{1'bx}} ;
		4'b1010 : dout = {SIZE{1'bx}} ;
		4'b1011 : dout = {SIZE{1'bx}} ;
		4'b1100 : dout = {SIZE{1'bx}} ;
		4'b1101 : dout = {SIZE{1'bx}} ;
		4'b1110 : dout = {SIZE{1'bx}} ;
		4'b1111 : dout = {SIZE{1'bx}} ;
		default : dout = {SIZE{1'bx}};
			// two state vs four state modelling will be added.
	endcase

endmodule // mux4ds

// SINK FOR UNLOADED INPUT PORTS
module sink (in);
// synopsys template

parameter SIZE = 1;

input [SIZE-1:0] in;

// Alexey
// `ifdef PITON_PROTO
   // As of version 8.2 XST does not remove this module without the
   // following additional dead code

   wire    a;

   assign		a = | in;

// `endif

endmodule //sink

// SOURCE FOR UNDRIVEN OUTPUT PORTS
module source (out) ;
// synopsys template

parameter SIZE = 1;

output  [SIZE-1:0] out;
// 
// Once 4state/2state model established
// then enable check.
// `ifdef FOUR_STATE
// leda check for x_or_z_in rhs_of assign turned off
// assign  out = {SIZE{1'bx}};
//`else
assign  out = {SIZE{1'b0}};
//`endif

endmodule //source

// 2:1 MUX WITH PRIORITY ENCODED SELECTS
//module mux2es (dout, in0, in1, sel0, sel1) ;
//
//parameter SIZE = 1;
//
//output 	[SIZE-1:0] 	dout;
//input	[SIZE-1:0]	in0;
//input	[SIZE-1:0]	in1;
//input			sel0;
//input			sel1;
//
//// reg declaration does not imply state being maintained
//// across cycles. Used to construct case statement and
//// always updated by inputs every cycle.
//reg	[SIZE-1:0]	dout ;
//
//// must take into account lack of mutex selects.
//// there is no reason for handling of x and z conditions.
//// This will be dictated by design.
//always @ (sel0 or sel1 or in0 or in1)
//
//	case ({sel1,sel0})
//		2'b1x : dout = in1 ; // 10(in1),11(z) 
//		2'b0x :	dout = in0 ; // 01(in0),00(x)
//	endcase
//
//endmodule // mux2es

// CLK Header for gating off the clock of
// a FF.
// clk - output of the clk header
// rclk - input clk
// enb_l - Active low clock enable
// tmb_l  - Active low clock enable ( in scan mode, this input is !se )

module clken_buf (clk, rclk, enb_l, tmb_l);
output clk;
input  rclk, enb_l, tmb_l;
reg    clken;

  always @ (rclk or enb_l or tmb_l)
    if (!rclk)  //latch opens on rclk low phase
      clken = !enb_l | !tmb_l;
  assign clk = clken & rclk;

endmodule



// The following flops are maintained and used in ENET , MAC IP  ONLY
// -- Mimi X61467

// POSITIVE-EDGE TRIGGERED FLOP with SET_L, without SCAN.

module dffsl_ns (din, clk, set_l, q);
// synopsys template
parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clk ;   // clk or scan clk
input                   set_l ; // set

output  [SIZE-1:0]      q ;     // output

reg     [SIZE-1:0]      q ;

// synopsys sync_set_reset "set_l"
always @ (posedge clk)
  q[SIZE-1:0] <= set_l ? din[SIZE-1:0] : {SIZE{1'b1}};

endmodule // dffsl_ns

// POSITIVE-EDGE TRIGGERED FLOP with SET_L, without SCAN.

module dffsl_async_ns (din, clk, set_l, q);
// synopsys template
parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clk ;   // clk or scan clk
input                   set_l ; // set

output  [SIZE-1:0]      q ;     // output

reg     [SIZE-1:0]      q ;

// synopsys async_set_reset "set_l"
always @ (posedge clk or negedge set_l) begin

    if (~set_l) begin
        q[SIZE-1:0] <= {SIZE{1'b1}};
    end else begin
        q[SIZE-1:0] <= ({SIZE{~set_l}} | din[SIZE-1:0]);
    end



end
endmodule // dffsl_async_ns

// POSITIVE-EDGE TRIGGERED FLOP WITH SET_H , without SCAN.

module dffr_ns_r1 (din, clk, rst, q);
// synopsys template
parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clk ;   // clk or scan clk
input                   rst ;   // reset

output  [SIZE-1:0]      q ;     // output

reg     [SIZE-1:0]      q ;

// Set to 1
// synopsys sync_set_reset "rst"
always @ (posedge clk)
  q[SIZE-1:0] <= rst ? {SIZE{1'b1}} : din[SIZE-1:0];

endmodule // dffr_ns_r1

// POSITIVE-EDGE TRIGGERED ASYNC RESET_H FLOP , without SCAN.

module dffr_async_ns (din, clk, rst, q);
// synopsys template

parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clk ;   // clk or scan clk
input                   rst;   // reset

output  [SIZE-1:0]      q ;     // output

reg     [SIZE-1:0]      q ;

// Reset dominates
// synopsys async_set_reset "rst"
always @ (posedge clk or posedge rst)
  q[SIZE-1:0] <= rst ? {SIZE{1'b0}} : din[SIZE-1:0];

endmodule // dffr_async_ns

// POSITIVE-EDGE TRIGGERED ASYNC SET_H FLOP , without SCAN.

module dffr_async_ns_r1 (din, clk, rst, q);
// synopsys template

parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clk ;   // clk or scan clk
input                   rst;   // reset

output  [SIZE-1:0]      q ;     // output

reg     [SIZE-1:0]      q ;

// Reset to 1
// synopsys async_set_reset "rst"
always @ (posedge clk or posedge rst)
  q[SIZE-1:0] <= rst ? {SIZE{1'b1}} : din[SIZE-1:0];

endmodule // dffr_async_ns_r1


// NEGATIVE-EDGE TRIGGERED ASYNC SET_H FLOP , without SCAN.

module dffr_async_ns_cl_r1 (din, clkl, rst, q);
// synopsys template
parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clkl ;  // clk or scan clk
input                   rst ;   // reset

output  [SIZE-1:0]      q ;     // output

reg     [SIZE-1:0]      q ;

// Set to 1
// synopsys sync_set_reset "rst"
always @ (negedge clkl or posedge rst)
  q[SIZE-1:0] <= rst ? {SIZE{1'b1}} : din[SIZE-1:0];

endmodule // dffr_async_ns_cl_r1

// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: swrvr_dlib.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
// DP library

// 2:1 MUX WITH ENCODED SELECT
module dp_mux2es (dout, in0, in1, sel) ;
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in0;
input	[SIZE-1:0]	in1;
input			sel;

reg	[SIZE-1:0]	dout ;

always @ (sel or in0 or in1)

 begin
	   case (sel)
	     1'b1: dout = in1 ; 
	     1'b0: dout = in0;
	     default: 
         begin
            if (in0 == in1) begin
               dout = in0;
            end
            else
              dout = {SIZE{1'bx}};
         end
	   endcase // case(sel)
 end

endmodule // dp_mux2es

// ----------------------------------------------------------------------


// 4:1 MUX WITH DECODED SELECTS
module dp_mux4ds (dout, in0, in1, in2, in3, 
		     sel0_l, sel1_l, sel2_l, sel3_l) ;
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in0;
input	[SIZE-1:0]	in1;
input	[SIZE-1:0]	in2;
input	[SIZE-1:0]	in3;
input			sel0_l;
input			sel1_l;
input			sel2_l;
input			sel3_l;

// reg declaration does not imply state being maintained
// across cycles. Used to construct case statement and
// always updated by inputs every cycle.
reg	[SIZE-1:0]	dout ;





wire [3:0] sel = {sel3_l,sel2_l,sel1_l,sel0_l}; // 0in one_cold
   
always @ (sel0_l or sel1_l or sel2_l or sel3_l or in0 or in1 or in2 or in3)

	case ({sel3_l,sel2_l,sel1_l,sel0_l})
		4'b1110 : dout = in0 ;
		4'b1101 : dout = in1 ;
		4'b1011 : dout = in2 ;
		4'b0111 : dout = in3 ;
		4'b1111 : dout = {SIZE{1'bx}} ;
		default : dout = {SIZE{1'bx}} ;
	endcase

endmodule // dp_mux4ds

// ----------------------------------------------------------------------


// 5:1 MUX WITH DECODED SELECTS
module dp_mux5ds (dout, in0, in1, in2, in3,  in4,
		     sel0_l, sel1_l, sel2_l, sel3_l, sel4_l) ;
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in0;
input	[SIZE-1:0]	in1;
input	[SIZE-1:0]	in2;
input	[SIZE-1:0]	in3;
input	[SIZE-1:0]	in4;
input			sel0_l;
input			sel1_l;
input			sel2_l;
input			sel3_l;
input			sel4_l;

// reg declaration does not imply state being maintained
// across cycles. Used to construct case statement and
// always updated by inputs every cycle.
reg	[SIZE-1:0]	dout ;




   
wire [4:0] sel = {sel4_l,sel3_l,sel2_l,sel1_l,sel0_l}; // 0in one_cold

always @ (sel0_l or sel1_l or sel2_l or sel3_l or sel4_l or
		in0 or in1 or in2 or in3 or in4)

	case ({sel4_l,sel3_l,sel2_l,sel1_l,sel0_l})
		5'b11110 : dout = in0 ;
		5'b11101 : dout = in1 ;
		5'b11011 : dout = in2 ;
		5'b10111 : dout = in3 ;
		5'b01111 : dout = in4 ;
		5'b11111 : dout = {SIZE{1'bx}} ;
		default : dout = {SIZE{1'bx}} ;
	endcase

endmodule // dp_mux5ds

// --------------------------------------------------------------------

// 8:1 MUX WITH DECODED SELECTS
module dp_mux8ds (dout, in0, in1, in2, in3, 
			in4, in5, in6, in7,
		     sel0_l, sel1_l, sel2_l, sel3_l,
		     sel4_l, sel5_l, sel6_l, sel7_l) ;
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in0;
input	[SIZE-1:0]	in1;
input	[SIZE-1:0]	in2;
input	[SIZE-1:0]	in3;
input	[SIZE-1:0]	in4;
input	[SIZE-1:0]	in5;
input	[SIZE-1:0]	in6;
input	[SIZE-1:0]	in7;
input			sel0_l;
input			sel1_l;
input			sel2_l;
input			sel3_l;
input			sel4_l;
input			sel5_l;
input			sel6_l;
input			sel7_l;

// reg declaration does not imply state being maintained
// across cycles. Used to construct case statement and
// always updated by inputs every cycle.
reg	[SIZE-1:0]	dout ;






wire [7:0] sel = {sel7_l,sel6_l,sel5_l,sel4_l,
                  sel3_l,sel2_l,sel1_l,sel0_l}; // 0in one_cold

always @ (sel0_l or sel1_l or sel2_l or sel3_l or in0 or in1 or in2 or in3 or
	  sel4_l or sel5_l or sel6_l or sel7_l or in4 or in5 or in6 or in7)

	case ({sel7_l,sel6_l,sel5_l,sel4_l,sel3_l,sel2_l,sel1_l,sel0_l})
		8'b11111110 : dout = in0 ;
		8'b11111101 : dout = in1 ;
		8'b11111011 : dout = in2 ;
		8'b11110111 : dout = in3 ;
		8'b11101111 : dout = in4 ;
		8'b11011111 : dout = in5 ;
		8'b10111111 : dout = in6 ;
		8'b01111111 : dout = in7 ;
		8'b11111111 : dout = {SIZE{1'bx}} ;
		default : dout = {SIZE{1'bx}} ;
	endcase

endmodule // dp_mux8ds


// ----------------------------------------------------------------------


// 3:1 MUX WITH DECODED SELECTS
module dp_mux3ds (dout, in0, in1, in2, 
		     sel0_l, sel1_l, sel2_l);
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in0;
input	[SIZE-1:0]	in1;
input	[SIZE-1:0]	in2;
input			sel0_l;
input			sel1_l;
input			sel2_l;

// reg declaration does not imply state being maintained
// across cycles. Used to construct case statement and
// always updated by inputs every cycle.
reg	[SIZE-1:0]	dout ;





wire [2:0] sel = {sel2_l,sel1_l,sel0_l}; // 0in one_cold
   
always @ (sel0_l or sel1_l or sel2_l or in0 or in1 or in2)

	case ({sel2_l,sel1_l,sel0_l})
		3'b110 : dout = in0 ;
		3'b101 : dout = in1 ;
		3'b011 : dout = in2 ;
	        default : dout = {SIZE{1'bx}} ;
	endcase

endmodule // dp_mux3ds

// ----------------------------------------------------------------------


// 2:1 MUX WITH DECODED SELECTS
module dp_mux2ds (dout, in0, in1,
             sel0_l, sel1_l);
// synopsys template

parameter SIZE = 1;

output  [SIZE-1:0]  dout;
input   [SIZE-1:0]  in0;
input   [SIZE-1:0]  in1;
input           sel0_l;
input           sel1_l;

// reg declaration does not imply state being maintained
// across cycles. Used to construct case statement and
// always updated by inputs every cycle.
reg [SIZE-1:0]  dout ;





wire [1:0] sel = {sel1_l,sel0_l}; // 0in one_cold

always @ (sel0_l or sel1_l or in0 or in1)

    case ({sel1_l,sel0_l})
        3'b10 : dout = in0 ;
        3'b01 : dout = in1 ;
            default : dout = {SIZE{1'bx}} ;
    endcase

endmodule // dp_mux3ds

// ---------------------------------------------------------------------


module dp_buffer(dout, in);
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in;

assign dout = in;

endmodule // dp_buffer









// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: test_stub_scan.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
// ____________________________________________________________________________
//
//  test_stub_bist - Test Stub with Scan Support
// ____________________________________________________________________________
//
// Description: DBB interface for test signal generation
// ____________________________________________________________________________

module test_stub_scan (/*AUTOARG*/
// Outputs
mux_drive_disable, mem_write_disable, sehold, se, testmode_l, 
mem_bypass, so_0, so_1, so_2, 
// Inputs
ctu_tst_pre_grst_l, arst_l, global_shift_enable, 
ctu_tst_scan_disable, ctu_tst_scanmode, ctu_tst_macrotest, 
ctu_tst_short_chain, long_chain_so_0, short_chain_so_0, 
long_chain_so_1, short_chain_so_1, long_chain_so_2, short_chain_so_2
);

   input        ctu_tst_pre_grst_l;
   input        arst_l;                // no longer used
   input        global_shift_enable;
   input        ctu_tst_scan_disable;  // redefined as pin_based_scan
   input        ctu_tst_scanmode;
   input 	ctu_tst_macrotest;
   input 	ctu_tst_short_chain;
   input 	long_chain_so_0;
   input 	short_chain_so_0;
   input 	long_chain_so_1;
   input 	short_chain_so_1;
   input 	long_chain_so_2;
   input 	short_chain_so_2;
   
   output 	mux_drive_disable;
   output 	mem_write_disable;
   output 	sehold;
   output 	se;
   output 	testmode_l;
   output 	mem_bypass;
   output 	so_0;
   output 	so_1;
   output 	so_2;

   wire         pin_based_scan;
   wire         short_chain_en;
   wire         short_chain_select;

   // INTERNAL CLUSTER CONNECTIONS
   //
   // Scan Chain Hookup
   // =================
   //
   // Scan chains have two configurations: long and short.
   // The short chain is typically the first tenth of the
   // long chain. The short chain should contain memory
   // collar flops for deep arrays. The CTU determines
   // which configuration is selected. Up to three chains
   // are supported.
   //
   // The scanout connections from the long and short
   // chains connect to the following inputs:
   //
   // long_chain_so_0, short_chain_so_0 (mandatory)
   // long_chain_so_1, short_chain_so_1 (optional)
   // long_chain_so_2, short_chain_so_2 (optional)
   //
   // The test stub outputs should connect directly to the
   // scanout port(s) of the cluster:
   //
   // so_0 (mandatory), so_1 (optional), so_2 (optional)
   //
   //
   // Static Output Signals
   // =====================
   //
   // testmode_l
   //
   // Local testmode control for overriding gated
   // clocks, asynchronous resets, etc. Asserted
   // for all shift-based test modes.
   //
   // mem_bypass
   //
   // Memory bypass control for arrays without output
   // flops. Allows testing of shadow logic. Asserted
   // for scan test; de-asserted for macrotest.
   //
   //
   // Dynamic Output Signals
   // ======================
   //
   // sehold
   //
   // The sehold signal needs to be set for macrotest
   // to allow holding flops in the array collars
   // to retain their shifted data during capture.
   // Inverted version of scan enable during macrotest.
   //
   // mux_drive_disable (for mux/long chain protection)
   //
   // Activate one-hot mux protection circuitry during
   // scan shift and reset. Formerly known as rst_tri_en.
   // Also used by long chain memories with embedded
   // control.
   //
   // mem_write_disable (for short chain protection)
   //
   // Protects contents of short chain memories during
   // shift and POR.
   //
   // se

   assign  mux_drive_disable  = ~ctu_tst_pre_grst_l | short_chain_select | se;
   assign  mem_write_disable  = ~ctu_tst_pre_grst_l | se;
   assign  sehold             = ctu_tst_macrotest & ~se;
   assign  se                 = global_shift_enable;
   assign  testmode_l         = ~ctu_tst_scanmode;
   assign  mem_bypass         = ~ctu_tst_macrotest & ~testmode_l;
   assign  pin_based_scan     = ctu_tst_scan_disable;
   assign  short_chain_en     = ~(pin_based_scan & se);
   assign  short_chain_select = ctu_tst_short_chain & ~testmode_l & short_chain_en;
   assign  so_0               = short_chain_select ? short_chain_so_0 : long_chain_so_0;
   assign  so_1               = short_chain_select ? short_chain_so_1 : long_chain_so_1;
   assign  so_2               = short_chain_select ? short_chain_so_2 : long_chain_so_2;
   
endmodule // test_stub_scan
// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: u1.behV
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
////////////////////////////////////////////////////////////////////////
//
// basic gates {
//
////////////////////////////////////////////////////////////////////////


//bw_u1_inv_0p6x
//
//

module bw_u1_inv_0p6x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_inv_1x
//
//

module bw_u1_inv_1x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_inv_1p4x
//
//

module bw_u1_inv_1p4x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_inv_2x
//
//

module bw_u1_inv_2x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_inv_3x
//
//

module bw_u1_inv_3x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_inv_4x
//
//

module bw_u1_inv_4x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule



//bw_u1_inv_5x
//
//

module bw_u1_inv_5x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_inv_8x
//
//

module bw_u1_inv_8x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_inv_10x
//
//

module bw_u1_inv_10x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_inv_15x
//
//

module bw_u1_inv_15x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_inv_20x
//
//

module bw_u1_inv_20x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_inv_30x
//
//

module bw_u1_inv_30x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_inv_40x
//
//

module bw_u1_inv_40x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule

//bw_u1_invh_15x
//
//

module bw_u1_invh_15x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule

//bw_u1_invh_25x
//
//

module bw_u1_invh_25x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_invh_30x
//
//

module bw_u1_invh_30x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_invh_50x
//
//

module bw_u1_invh_50x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule


//bw_u1_invh_60x
//
//

module bw_u1_invh_60x (
    z,
    a );

    output z;
    input  a;

    assign z = ~( a );

endmodule




//bw_u1_nand2_0p4x
//
//
module bw_u1_nand2_0p4x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a & b );

endmodule


//bw_u1_nand2_0p6x
//
//
module bw_u1_nand2_0p6x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a & b );

endmodule


//bw_u1_nand2_1x
//
//
module bw_u1_nand2_1x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a & b );

endmodule


//bw_u1_nand2_1p4x
//
//
module bw_u1_nand2_1p4x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a & b );

endmodule


//bw_u1_nand2_2x
//
//
module bw_u1_nand2_2x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a & b );

endmodule


//bw_u1_nand2_3x
//
//
module bw_u1_nand2_3x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a & b );

endmodule


//bw_u1_nand2_4x
//
//
module bw_u1_nand2_4x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a & b );

endmodule


//bw_u1_nand2_5x
//
//
module bw_u1_nand2_5x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a & b );

endmodule


//bw_u1_nand2_7x
//
//
module bw_u1_nand2_7x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a & b );

endmodule


//bw_u1_nand2_10x
//
//
module bw_u1_nand2_10x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a & b );

endmodule


//bw_u1_nand2_15x
//
//
module bw_u1_nand2_15x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a & b );

endmodule


//bw_u1_nand3_0p4x
//
//
module bw_u1_nand3_0p4x (
    z,
    a,
    b,
    c );

    output z;
    input  a;
    input  b;
    input  c;

    assign z = ~( a & b & c );

endmodule




//bw_u1_nand3_0p6x
//
//
module bw_u1_nand3_0p6x (
    z,
    a,
    b,
    c );

    output z;
    input  a;
    input  b;
    input  c;

    assign z = ~( a & b & c );

endmodule



//bw_u1_nand3_1x

//
//
module bw_u1_nand3_1x (
    z,
    a,  
    b,  
    c );
    
    output z;
    input  a;
    input  b;
    input  c;
    
    assign z = ~( a & b & c );

endmodule


//bw_u1_nand3_1p4x

//
//
module bw_u1_nand3_1p4x (
    z,
    a,  
    b,  
    c );
    
    output z;
    input  a;
    input  b;
    input  c;
    
    assign z = ~( a & b & c );

endmodule


//bw_u1_nand3_2x

//
//
module bw_u1_nand3_2x (
    z,
    a,  
    b,  
    c );
    
    output z;
    input  a;
    input  b;
    input  c;
    
    assign z = ~( a & b & c );

endmodule


//bw_u1_nand3_3x

//
//
module bw_u1_nand3_3x (
    z,
    a,  
    b,  
    c );
    
    output z;
    input  a;
    input  b;
    input  c;
    
    assign z = ~( a & b & c );

endmodule


//bw_u1_nand3_4x

//
//
module bw_u1_nand3_4x (
    z,
    a,  
    b,  
    c );
    
    output z;
    input  a;
    input  b;
    input  c;
    
    assign z = ~( a & b & c );

endmodule


//bw_u1_nand3_5x

//
//
module bw_u1_nand3_5x (
    z,
    a,  
    b,  
    c );
    
    output z;
    input  a;
    input  b;
    input  c;
    
    assign z = ~( a & b & c );

endmodule


//bw_u1_nand3_7x

//
//
module bw_u1_nand3_7x (
    z,
    a,  
    b,  
    c );
    
    output z;
    input  a;
    input  b;
    input  c;
    
    assign z = ~( a & b & c );

endmodule


//bw_u1_nand3_10x

//
//
module bw_u1_nand3_10x (
    z,
    a,  
    b,  
    c );
    
    output z;
    input  a;
    input  b;
    input  c;
    
    assign z = ~( a & b & c );

endmodule


//bw_u1_nand4_0p6x

//
//
module bw_u1_nand4_0p6x (
    z,
    a,  
    b,  
    c,  
    d );
    
    output z;
    input  a;
    input  b;
    input  c;
    input  d;
    
    assign z = ~( a & b & c & d );

endmodule


//bw_u1_nand4_1x
//
//
module bw_u1_nand4_1x (
    z,
    a,
    b,
    c,
    d );

    output z;
    input  a;
    input  b;
    input  c;
    input  d;

    assign z = ~( a & b & c & d );

endmodule


//bw_u1_nand4_1p4x
//
//
module bw_u1_nand4_1p4x (
    z,
    a,
    b,
    c,
    d );

    output z;
    input  a;
    input  b;
    input  c;
    input  d;

    assign z = ~( a & b & c & d );

endmodule


//bw_u1_nand4_2x
//
//
module bw_u1_nand4_2x (
    z,
    a,
    b,
    c,
    d );

    output z;
    input  a;
    input  b;
    input  c;
    input  d;

    assign z = ~( a & b & c & d );

endmodule


//bw_u1_nand4_3x
//
//
module bw_u1_nand4_3x (
    z,
    a,
    b,
    c,
    d );

    output z;
    input  a;
    input  b;
    input  c;
    input  d;

    assign z = ~( a & b & c & d );

endmodule


//bw_u1_nand4_4x
//
//
module bw_u1_nand4_4x (
    z,
    a,
    b,
    c,
    d );

    output z;
    input  a;
    input  b;
    input  c;
    input  d;

    assign z = ~( a & b & c & d );

endmodule


//bw_u1_nand4_6x
//
//

module bw_u1_nand4_6x (
    z,
    a,
    b,
    c,
    d );

    output z;
    input  a;
    input  b;
    input  c;
    input  d;


    nand( z, a, b,c,d);

endmodule

//bw_u1_nand4_8x
//
//

module bw_u1_nand4_8x (
    z,
    a,
    b,
    c,
    d );

    output z;
    input  a;
    input  b;
    input  c;
    input  d;


    nand( z, a, b,c,d);

endmodule

//bw_u1_nor2_0p6x
//
//

module bw_u1_nor2_0p6x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a | b );

endmodule


//bw_u1_nor2_1x
//
//

module bw_u1_nor2_1x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a | b );

endmodule


//bw_u1_nor2_1p4x
//
//

module bw_u1_nor2_1p4x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a | b );

endmodule


//bw_u1_nor2_2x
//
//

module bw_u1_nor2_2x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a | b );

endmodule


//bw_u1_nor2_3x
//
//

module bw_u1_nor2_3x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a | b );

endmodule


//bw_u1_nor2_4x
//
//

module bw_u1_nor2_4x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a | b );

endmodule


//bw_u1_nor2_6x
//
//

module bw_u1_nor2_6x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a | b );

endmodule


//bw_u1_nor2_8x
//
//

module bw_u1_nor2_8x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a | b );

endmodule


//bw_u1_nor2_12x
//
//

module bw_u1_nor2_12x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a | b );

endmodule




//bw_u1_nor3_0p6x
//
//

module bw_u1_nor3_0p6x (
    z,
    a,
    b,
    c );

    output z;
    input  a;
    input  b;
    input  c;

    assign z = ~( a | b | c );

endmodule


//bw_u1_nor3_1x
//
//

module bw_u1_nor3_1x (
    z,
    a,
    b,
    c );

    output z;
    input  a;
    input  b;
    input  c;

    assign z = ~( a | b | c );

endmodule


//bw_u1_nor3_1p4x
//
//

module bw_u1_nor3_1p4x (
    z,
    a,
    b,
    c );

    output z;
    input  a;
    input  b;
    input  c;

    assign z = ~( a | b | c );

endmodule


//bw_u1_nor3_2x
//
//

module bw_u1_nor3_2x (
    z,
    a,
    b,
    c );

    output z;
    input  a;
    input  b;
    input  c;

    assign z = ~( a | b | c );

endmodule


//bw_u1_nor3_3x
//
//

module bw_u1_nor3_3x (
    z,
    a,
    b,
    c );

    output z;
    input  a;
    input  b;
    input  c;

    assign z = ~( a | b | c );

endmodule


//bw_u1_nor3_4x
//
//

module bw_u1_nor3_4x (
    z,
    a,
    b,
    c );

    output z;
    input  a;
    input  b;
    input  c;

    assign z = ~( a | b | c );

endmodule


//bw_u1_nor3_6x
//
//

module bw_u1_nor3_6x (
    z,
    a,
    b,
    c );

    output z;
    input  a;
    input  b;
    input  c;

    assign z = ~( a | b | c );

endmodule


//bw_u1_nor3_8x
//
//

module bw_u1_nor3_8x (
    z,
    a,
    b,
    c );

    output z;
    input  a;
    input  b;
    input  c;

    assign z = ~( a | b | c );

endmodule


//bw_u1_aoi21_0p4x
//
// 
module bw_u1_aoi21_0p4x (
    z,
    b1,
    b2,
    a );

    output z;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 & b2 ) | ( a ));

endmodule
//bw_u1_aoi21_1x
//
// 
module bw_u1_aoi21_1x (

    z,
    b1,
    b2,
    a );

    output z;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 & b2 ) | ( a  ));

endmodule
//bw_u1_aoi21_2x
//
// 
module bw_u1_aoi21_2x (
    z,
    b1,
    b2,
    a );

    output z;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 & b2 ) | ( a ));

endmodule
//bw_u1_aoi21_4x
//
// 
module bw_u1_aoi21_4x (
    z,
    b1,
    b2,
    a );

    output z;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 & b2 ) | ( a ));

endmodule
//bw_u1_aoi21_8x
//
// 
module bw_u1_aoi21_8x (
    z,
    b1,
    b2,
    a );

    output z;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 & b2 ) | ( a ));

endmodule
//bw_u1_aoi21_12x
//
// 
module bw_u1_aoi21_12x (
    z,
    b1,
    b2,
    a );

    output z;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 & b2 ) | ( a ));

endmodule
//bw_u1_aoi22_0p4x
//
// 
module bw_u1_aoi22_0p4x (
    z,
    a1,
    a2,
    b1,
    b2 );

    output z;
    input  a1;
    input  a2;
    input  b1;
    input  b2;

    assign z = ~(( a1 & a2 ) | ( b1 & b2 ));

endmodule
//bw_u1_aoi22_1x
//
// 
module bw_u1_aoi22_1x (
    z,
    b1,
    b2,
    a1,
    a2 );

    output z;
    input  b1;
    input  b2;
    input  a1;
    input  a2;


    assign z = ~(( a1 & a2 ) | ( b1 & b2 ));

endmodule
//bw_u1_aoi22_2x
//
// 
module bw_u1_aoi22_2x (


    z,
    b1,
    b2,
    a1,
    a2 );

    output z;
    input  b1;
    input  b2;
    input  a1;
    input  a2;
 
    assign z = ~(( a1 & a2 ) | ( b1 & b2 ));

endmodule
//bw_u1_aoi22_4x
//
// 
module bw_u1_aoi22_4x (

    z,
    b1,
    b2,
    a1,
    a2 );

    output z;
    input  b1;
    input  b2;
    input  a1;
    input  a2;

    assign z = ~(( a1 & a2 ) | ( b1 & b2 ));

endmodule
//bw_u1_aoi22_8x
//
// 
module bw_u1_aoi22_8x (

    z,
    b1,
    b2,
    a1,
    a2 );

    output z;
    input  b1;
    input  b2;
    input  a1;
    input  a2;

    assign z = ~(( a1 & a2 ) | ( b1 & b2 ));

endmodule
//bw_u1_aoi211_0p3x
//
// 
module bw_u1_aoi211_0p3x (

    z,
    c1,
    c2,
    b,
    a );

    output z;
    input  c1;
    input  c2;
    input  b;
    input  a;

    assign z = ~(( c1 & c2 ) | (a)| (b));

endmodule

//bw_u1_aoi211_1x
//
// 
module bw_u1_aoi211_1x (

    z,
    c1,
    c2,
    b,
    a );

    output z;
    input  c1;
    input  c2;
    input  b;
    input  a;

    assign z = ~(( c1 & c2 ) | (a)| (b));

endmodule

//bw_u1_aoi211_2x
//
// 
module bw_u1_aoi211_2x (



    z,
    c1,
    c2,
    b, 
    a );

    output z;
    input  c1;
    input  c2;
    input  b;
    input  a;
 

    assign z = ~(( c1 & c2 ) | (a)| (b));

endmodule

//bw_u1_aoi211_4x
//
// 
module bw_u1_aoi211_4x (


    z,
    c1,
    c2,
    b, 
    a );

    output z;
    input  c1;
    input  c2;
    input  b;
    input  a;
 


    assign z = ~(( c1 & c2 ) | (a)| (b));

endmodule

//bw_u1_aoi211_8x
//
// 
module bw_u1_aoi211_8x (


    z,
    c1,
    c2,
    b, 
    a );

    output z;
    input  c1;
    input  c2;
    input  b;
    input  a;
 


    assign z = ~(( c1 & c2 ) | (a)| (b));

endmodule

//bw_u1_oai21_0p4x
//
//
module bw_u1_oai21_0p4x (
    z,
    b1,
    b2,
    a );

    output z;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 | b2 ) & ( a ));

endmodule



//bw_u1_oai21_1x
//
//
module bw_u1_oai21_1x (
    z,
    b1,
    b2,
    a );

    output z;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 | b2 ) & ( a ));

endmodule



//bw_u1_oai21_2x
//
//
module bw_u1_oai21_2x (
    z,
    b1,
    b2,
    a );

    output z;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 | b2 ) & ( a ));

endmodule



//bw_u1_oai21_4x
//
//
module bw_u1_oai21_4x (
    z,
    b1,
    b2,
    a );

    output z;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 | b2 ) & ( a ));

endmodule



//bw_u1_oai21_8x
//
//
module bw_u1_oai21_8x (
    z,
    b1,
    b2,
    a );

    output z;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 | b2 ) & ( a ));

endmodule



//bw_u1_oai21_12x
//
//
module bw_u1_oai21_12x (
    z,
    b1,
    b2,
    a );

    output z;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 | b2 ) & ( a ));

endmodule



//bw_u1_oai22_0p4x
// 
module bw_u1_oai22_0p4x (
    z,
    a1,
    a2,
    b1,
    b2 );

    output z;
    input  a1;
    input  a2;
    input  b1;
    input  b2;

    assign z = ~(( a1 | a2 ) & ( b1 | b2 ));

endmodule

//bw_u1_oai22_1x
// 
module bw_u1_oai22_1x (
    z,
    a1,
    a2,
    b1,
    b2 );

    output z;
    input  a1;
    input  a2;
    input  b1;
    input  b2;

    assign z = ~(( a1 | a2 ) & ( b1 | b2 ));

endmodule

//bw_u1_oai22_2x
// 
module bw_u1_oai22_2x (
    z,
    a1,
    a2,
    b1,
    b2 );

    output z;
    input  a1;
    input  a2;
    input  b1;
    input  b2;

    assign z = ~(( a1 | a2 ) & ( b1 | b2 ));

endmodule

//bw_u1_oai22_4x
// 
module bw_u1_oai22_4x (
    z,
    a1,
    a2,
    b1,
    b2 );

    output z;
    input  a1;
    input  a2;
    input  b1;
    input  b2;

    assign z = ~(( a1 | a2 ) & ( b1 | b2 ));

endmodule

//bw_u1_oai22_8x
// 
module bw_u1_oai22_8x (
    z,
    a1,
    a2,
    b1,
    b2 );

    output z;
    input  a1;
    input  a2;
    input  b1;
    input  b2;

    assign z = ~(( a1 | a2 ) & ( b1 | b2 ));

endmodule

//bw_u1_oai211_0p3x
//
//
module bw_u1_oai211_0p3x (
    z,
    c1,
    c2,
    b,
    a );

    output z;
    input  c1;
    input  c2;
    input  b;
    input  a;

    assign z = ~(( c1 | c2 ) & ( a ) & (b));

endmodule

//bw_u1_oai211_1x
//
//
module bw_u1_oai211_1x (
    z,
    c1,
    c2,
    b,
    a );

    output z;
    input  c1;
    input  c2;
    input  b;
    input  a;

    assign z = ~(( c1 | c2 ) & ( a ) & (b));

endmodule

//bw_u1_oai211_2x
//
//
module bw_u1_oai211_2x (
    z,
    c1,
    c2,
    b,
    a );

    output z;
    input  c1;
    input  c2;
    input  b;
    input  a;

    assign z = ~(( c1 | c2 ) & ( a ) & (b));

endmodule

//bw_u1_oai211_4x
//
//
module bw_u1_oai211_4x (
    z,
    c1,
    c2,
    b,
    a );

    output z;
    input  c1;
    input  c2;
    input  b;
    input  a;

    assign z = ~(( c1 | c2 ) & ( a ) & (b));

endmodule

//bw_u1_oai211_8x
//
//
module bw_u1_oai211_8x (
    z,
    c1,
    c2,
    b,
    a );

    output z;
    input  c1;
    input  c2;
    input  b;
    input  a;

    assign z = ~(( c1 | c2 ) & ( a ) & (b));

endmodule

//bw_u1_aoi31_1x
//
// 
module bw_u1_aoi31_1x (


    z,
    b1,
    b2,
    b3,
    a );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a;

    assign z = ~(( b1 & b2&b3 ) | ( a ));

endmodule
//bw_u1_aoi31_2x
//
// 
module bw_u1_aoi31_2x (

    z, 
    b1,
    b2, 
    b3, 
    a );
    
    output z; 
    input  b1;
    input  b2;
    input  b3;
    input  a;

    assign z = ~(( b1 & b2&b3 ) | ( a ));

endmodule
//bw_u1_aoi31_4x
//
// 
module bw_u1_aoi31_4x (
    z, 
    b1,
    b2, 
    b3, 
    a );
    
    output z; 
    input  b1;
    input  b2;
    input  b3;
    input  a;

    assign z = ~(( b1 & b2&b3 ) | ( a ));

endmodule
//bw_u1_aoi31_8x
//
// 
module bw_u1_aoi31_8x (

    z, 
    b1,
    b2, 
    b3, 
    a );
    
    output z; 
    input  b1;
    input  b2;
    input  b3;
    input  a;

    assign z = ~(( b1 & b2&b3 ) | ( a ));

endmodule
//bw_u1_aoi32_1x
//
// 
module bw_u1_aoi32_1x (
    z,
    b1,
    b2,
    b3,
    a1,
    a2 );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a1;
    input  a2;

    assign z = ~(( b1 & b2&b3 ) | ( a1 & a2 ));

endmodule

//bw_u1_aoi32_2x
//
// 
module bw_u1_aoi32_2x (
    z,
    b1, 
    b2,
    b3,
    a1,
    a2 );

    output z;
    input  b1; 
    input  b2; 
    input  b3; 
    input  a1;
    input  a2;

 

    assign z = ~(( b1 & b2&b3 ) | ( a1 & a2 ));

endmodule

//bw_u1_aoi32_4x
//
// 
module bw_u1_aoi32_4x (

    z,
    b1, 
    b2,
    b3,
    a1,
    a2 );

    output z;
    input  b1; 
    input  b2; 
    input  b3; 
    input  a1;
    input  a2;

 

    assign z = ~(( b1 & b2&b3 ) | ( a1 & a2 ));

endmodule

//bw_u1_aoi32_8x
//
// 
module bw_u1_aoi32_8x (

    z,
    b1, 
    b2,
    b3,
    a1,
    a2 );

    output z;
    input  b1; 
    input  b2; 
    input  b3; 
    input  a1;
    input  a2;

 
    assign z = ~(( b1 & b2&b3 ) | ( a1 & a2 ));

endmodule

//bw_u1_aoi33_1x
//
//
module bw_u1_aoi33_1x (




    z,
    b1,
    b2,
    b3,
    a1,
    a2,
    a3 );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a1;
    input  a2;
    input  a3;

    assign z = ~(( b1 & b2&b3 ) | ( a1&a2&a3 ));

endmodule


//bw_u1_aoi33_2x
//
//
module bw_u1_aoi33_2x (

       
    z, 
    b1, 
    b2,  
    b3,  
    a1,  
    a2,  
    a3 );
    
    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a1;
    input  a2;
    input  a3;
    

    assign z = ~(( b1 & b2&b3 ) | ( a1&a2&a3 ));

endmodule


//bw_u1_aoi33_4x
//
//
module bw_u1_aoi33_4x (

       
    z, 
    b1, 
    b2,  
    b3,  
    a1,  
    a2,  
    a3 );
    
    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a1;
    input  a2;
    input  a3;
    


    assign z = ~(( b1 & b2&b3 ) | ( a1&a2&a3 ));

endmodule


//bw_u1_aoi33_8x
//
//
module bw_u1_aoi33_8x (
       
    z, 
    b1, 
    b2,  
    b3,  
    a1,  
    a2,  
    a3 );
    
    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a1;
    input  a2;
    input  a3;
    


    assign z = ~(( b1 & b2&b3 ) | ( a1&a2&a3 ));

endmodule


//bw_u1_aoi221_1x
//
// 
module bw_u1_aoi221_1x (

    z,
    c1,
    c2,
    b1,
    b2,
    a );

    output z;
    input  c1;
    input  c2;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( c1 & c2 ) | (b1&b2)| (a));

endmodule


//bw_u1_aoi221_2x
//
// 
module bw_u1_aoi221_2x (

    z,
    c1,
    c2,
    b1,
    b2,
    a );

    output z;
    input  c1;
    input  c2;
    input  b1;
    input  b2;
    input  a; 


    assign z = ~(( c1 & c2 ) | (b1&b2)| (a));

endmodule


//bw_u1_aoi221_4x
//
// 
module bw_u1_aoi221_4x (



    z,
    c1,
    c2,
    b1,
    b2,
    a );

    output z;
    input  c1;
    input  c2;
    input  b1;
    input  b2;
    input  a; 


    assign z = ~(( c1 & c2 ) | (b1&b2)| (a));

endmodule


//bw_u1_aoi221_8x
//
// 
module bw_u1_aoi221_8x (
    z,
    c1,
    c2,
    b1,
    b2,
    a );

    output z;
    input  c1;
    input  c2;
    input  b1;
    input  b2;
    input  a; 


    assign z = ~(( c1 & c2 ) | (b1&b2)| (a));

endmodule


//bw_u1_aoi222_1x
//
//
module bw_u1_aoi222_1x (

    z,
    a1,
    a2,
    b1,
    b2,
    c1,
    c2 );

    output z;
    input  a1;
    input  a2;
    input  b1;
    input  b2;
    input  c1;
    input  c2;

    assign z = ~(( c1 & c2 ) | (b1&b2)| (a1& a2));

endmodule

//bw_u1_aoi222_2x
//
//
module bw_u1_aoi222_2x (

    z,
    a1,
    a2,
    b1,
    b2,
    c1,
    c2 );

    output z;
    input  a1;
    input  a2;
    input  b1;
    input  b2;
    input  c1;
    input  c2;

    assign z = ~(( c1 & c2 ) | (b1&b2)| (a1& a2));

endmodule


//bw_u1_aoi222_4x
//
//
module bw_u1_aoi222_4x (

    z,
    a1,
    a2,
    b1,
    b2,
    c1,
    c2 );

    output z;
    input  a1;
    input  a2;
    input  b1;
    input  b2;
    input  c1;
    input  c2;

    assign z = ~(( c1 & c2 ) | (b1&b2)| (a1& a2));

endmodule


//bw_u1_aoi311_1x
//
//
module bw_u1_aoi311_1x (

    z,
    c1,
    c2,
    c3,
    b, 
    a );

    output z;
    input  c1;
    input  c2;
    input  c3;
    input  b;
    input  a;

    assign z = ~(( c1 & c2& c3 ) | (a)| (b));

endmodule




//bw_u1_aoi311_2x
//
//
module bw_u1_aoi311_2x (
    z,
    c1,
    c2,
    c3,
    b, 
    a );

    output z;
    input  c1;
    input  c2;
    input  c3;
    input  b;
    input  a;

    assign z = ~(( c1 & c2& c3 ) | (a)| (b));

endmodule




//bw_u1_aoi311_4x
//
//
module bw_u1_aoi311_4x (
    z,
    c1,
    c2,
    c3,
    b, 
    a );

    output z;
    input  c1;
    input  c2;
    input  c3;
    input  b;
    input  a;


    assign z = ~(( c1 & c2& c3 ) | (a)| (b));

endmodule




//bw_u1_aoi311_8x
//
//
module bw_u1_aoi311_8x (
    z,
    c1,
    c2,
    c3,
    b, 
    a );

    output z;
    input  c1;
    input  c2;
    input  c3;
    input  b;
    input  a;

    assign z = ~(( c1 & c2& c3 ) | (a)| (b));

endmodule




//bw_u1_oai31_1x
//
//
module bw_u1_oai31_1x (
    z,
    b1,
    b2,
    b3,
    a );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a;

    assign z = ~(( b1 | b2|b3 ) & ( a ));

endmodule




//bw_u1_oai31_2x
//
//
module bw_u1_oai31_2x (
    z,
    b1,
    b2,
    b3,
    a );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a;

    assign z = ~(( b1 | b2|b3 ) & ( a ));

endmodule




//bw_u1_oai31_4x
//
//
module bw_u1_oai31_4x (
    z,
    b1,
    b2,
    b3,
    a );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a;

    assign z = ~(( b1 | b2|b3 ) & ( a ));

endmodule




//bw_u1_oai31_8x
//
//
module bw_u1_oai31_8x (
    z,
    b1,
    b2,
    b3,
    a );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a;

    assign z = ~(( b1 | b2|b3 ) & ( a ));

endmodule




//bw_u1_oai32_1x
//
//
module bw_u1_oai32_1x (
    z,
    b1,
    b2,
    b3,
    a1,
    a2 );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a1;
    input  a2;

    assign z = ~(( b1 | b2 | b3 ) & ( a1 | a2 ));

endmodule



//bw_u1_oai32_2x
//
//
module bw_u1_oai32_2x (
    z,
    b1,
    b2,
    b3,
    a1,
    a2 );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a1;
    input  a2;

    assign z = ~(( b1 | b2 | b3 ) & ( a1 | a2 ));

endmodule



//bw_u1_oai32_4x
//
//
module bw_u1_oai32_4x (
    z,
    b1,
    b2,
    b3,
    a1,
    a2 );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a1;
    input  a2;

    assign z = ~(( b1 | b2 | b3 ) & ( a1 | a2 ));

endmodule



//bw_u1_oai32_8x
//
//
module bw_u1_oai32_8x (
    z,
    b1,
    b2,
    b3,
    a1,
    a2 );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a1;
    input  a2;

    assign z = ~(( b1 | b2 | b3 ) & ( a1 | a2 ));

endmodule



//bw_u1_oai33_1x
//
//
module bw_u1_oai33_1x (
    z,
    b1,
    b2,
    b3,
    a1,
    a2,
    a3 );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a1;
    input  a2;
    input  a3;

    assign z = ~(( b1 | b2|b3 ) & ( a1|a2|a3 ));

endmodule


//bw_u1_oai33_2x
//
//
module bw_u1_oai33_2x (
    z,
    b1,
    b2,
    b3,
    a1,
    a2,
    a3 );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a1;
    input  a2;
    input  a3;

    assign z = ~(( b1 | b2|b3 ) & ( a1|a2|a3 ));

endmodule


//bw_u1_oai33_4x
//
//
module bw_u1_oai33_4x (
    z,
    b1,
    b2,
    b3,
    a1,
    a2,
    a3 );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a1;
    input  a2;
    input  a3;

    assign z = ~(( b1 | b2|b3 ) & ( a1|a2|a3 ));

endmodule


//bw_u1_oai33_8x
//
//
module bw_u1_oai33_8x (
    z,
    b1,
    b2,
    b3,
    a1,
    a2,
    a3 );

    output z;
    input  b1;
    input  b2;
    input  b3;
    input  a1;
    input  a2;
    input  a3;

    assign z = ~(( b1 | b2|b3 ) & ( a1|a2|a3 ));

endmodule


//bw_u1_oai221_1x
//
//
module bw_u1_oai221_1x (
    z,
    c1,
    c2,
    b1,
    b2,
    a );

    output z;
    input  c1;
    input  c2;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( c1 | c2 ) & ( a ) & (b1|b2));

endmodule

//bw_u1_oai221_2x
//
//
module bw_u1_oai221_2x (
    z,
    c1,
    c2,
    b1,
    b2,
    a );

    output z;
    input  c1;
    input  c2;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( c1 | c2 ) & ( a ) & (b1|b2));

endmodule

//bw_u1_oai221_4x
//
//
module bw_u1_oai221_4x (
    z,
    c1,
    c2,
    b1,
    b2,
    a );

    output z;
    input  c1;
    input  c2;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( c1 | c2 ) & ( a ) & (b1|b2));

endmodule

//bw_u1_oai221_8x
//
//
module bw_u1_oai221_8x (
    z,
    c1,
    c2,
    b1,
    b2,
    a );

    output z;
    input  c1;
    input  c2;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( c1 | c2 ) & ( a ) & (b1|b2));

endmodule

//bw_u1_oai222_1x
//
//
module bw_u1_oai222_1x (
    z,
    c1,
    c2,
    b1,
    b2,
    a1,
    a2 );

    output z;
    input  c1;
    input  c2;
    input  b1;
    input  b2;
    input  a1;
    input  a2;

    assign z = ~(( c1 | c2 ) & ( a1|a2 ) & (b1|b2));

endmodule


//bw_u1_oai222_2x
//
//
module bw_u1_oai222_2x (
    z,
    c1,
    c2,
    b1,
    b2,
    a1,
    a2 );

    output z;
    input  c1;
    input  c2;
    input  b1;
    input  b2;
    input  a1;
    input  a2;

    assign z = ~(( c1 | c2 ) & ( a1|a2 ) & (b1|b2));

endmodule


//bw_u1_oai222_4x
//
//
module bw_u1_oai222_4x (
    z,
    c1,
    c2,
    b1,
    b2,
    a1,
    a2 );

    output z;
    input  c1;
    input  c2;
    input  b1;
    input  b2;
    input  a1;
    input  a2;

    assign z = ~(( c1 | c2 ) & ( a1|a2 ) & (b1|b2));

endmodule


//bw_u1_oai311_1x
//
//
module bw_u1_oai311_1x (
    z,
    c1,
    c2,
    c3,
    b,
    a );

    output z;
    input  c1;
    input  c2;
    input  c3;
    input  b;
    input  a;

    assign z = ~(( c1 | c2|c3 ) & ( a ) & (b));

endmodule


//bw_u1_oai311_2x
//
//
module bw_u1_oai311_2x (
    z,
    c1,
    c2,
    c3,
    b,
    a );

    output z;
    input  c1;
    input  c2;
    input  c3;
    input  b;
    input  a;

    assign z = ~(( c1 | c2|c3 ) & ( a ) & (b));

endmodule


//bw_u1_oai311_4x
//
//
module bw_u1_oai311_4x (
    z,
    c1,
    c2,
    c3,
    b,
    a );

    output z;
    input  c1;
    input  c2;
    input  c3;
    input  b;
    input  a;

    assign z = ~(( c1 | c2 | c3 ) & ( a ) & (b));

endmodule


//bw_u1_oai311_8x
//
//
module bw_u1_oai311_8x (
    z,
    c1,
    c2,
    c3,
    b,
    a );

    output z;
    input  c1;
    input  c2;
    input  c3;
    input  b;
    input  a;

    assign z = ~(( c1 | c2|c3 ) & ( a ) & (b));

endmodule


//bw_u1_muxi21_0p6x



module bw_u1_muxi21_0p6x (z, d0, d1, s);
output z;
input  d0, d1, s;

    assign z = s ? ~d1 : ~d0;
endmodule


//bw_u1_muxi21_1x



module bw_u1_muxi21_1x (z, d0, d1, s);
output z;
input  d0, d1, s;

    assign z = s ? ~d1 : ~d0;
endmodule







//bw_u1_muxi21_2x



module bw_u1_muxi21_2x (z, d0, d1, s);
output z;
input  d0, d1, s;

    assign z = s ? ~d1 : ~d0;
endmodule


//bw_u1_muxi21_4x



module bw_u1_muxi21_4x (z, d0, d1, s);
output z;
input  d0, d1, s;

    assign z = s ? ~d1 : ~d0;
endmodule




//bw_u1_muxi21_6x


module bw_u1_muxi21_6x (z, d0, d1, s);
output z;
input  d0, d1, s;

    assign z = s ? ~d1 : ~d0;
endmodule

//bw_u1_muxi31d_4x
//

module bw_u1_muxi31d_4x (z, d0, d1, d2, s0, s1, s2);
output z;
input  d0, d1, d2, s0, s1, s2;
        zmuxi31d_prim i0 ( z, d0, d1, d2, s0, s1, s2 );
endmodule

//bw_u1_muxi41d_4x
//

module bw_u1_muxi41d_4x (z, d0, d1, d2, d3, s0, s1, s2, s3);
output z;
input  d0, d1, d2, d3, s0, s1, s2, s3;
        zmuxi41d_prim i0 ( z, d0, d1, d2, d3, s0, s1, s2, s3 );
endmodule

//bw_u1_muxi41d_6x
//

module bw_u1_muxi41d_6x (z, d0, d1, d2, d3, s0, s1, s2, s3);
output z;
input  d0, d1, d2, d3, s0, s1, s2, s3;
        zmuxi41d_prim i0 ( z, d0, d1, d2, d3, s0, s1, s2, s3 );
endmodule
 

//bw_u1_xor2_0p6x
//
// 
module bw_u1_xor2_0p6x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ( a ^ b );

endmodule
//bw_u1_xor2_1x
//
// 
module bw_u1_xor2_1x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ( a ^ b );

endmodule
//bw_u1_xor2_2x
//
// 
module bw_u1_xor2_2x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ( a ^ b );

endmodule
//bw_u1_xor2_4x
//
// 
module bw_u1_xor2_4x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ( a ^ b );

endmodule
//bw_u1_xnor2_0p6x
//
// 
module bw_u1_xnor2_0p6x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a ^ b );

endmodule
//bw_u1_xnor2_1x
//
// 
module bw_u1_xnor2_1x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a ^ b );

endmodule
//bw_u1_xnor2_2x
//
// 
module bw_u1_xnor2_2x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a ^ b );

endmodule
//bw_u1_xnor2_4x
//
// 
module bw_u1_xnor2_4x (
    z,
    a,
    b );

    output z;
    input  a;
    input  b;

    assign z = ~( a ^ b );

endmodule

//bw_u1_buf_1x
//

module bw_u1_buf_1x (
    z,
    a );

    output z;
    input  a;

    assign z = ( a );

endmodule

//bw_u1_buf_5x
//

module bw_u1_buf_5x (
    z,
    a );

    output z;
    input  a;

    assign z = ( a );

endmodule


//bw_u1_buf_10x
//

module bw_u1_buf_10x (
    z,
    a );

    output z;
    input  a;

    assign z = ( a );

endmodule


//bw_u1_buf_15x
//

module bw_u1_buf_15x (
    z,
    a );

    output z;
    input  a;

    assign z = ( a );

endmodule


//bw_u1_buf_20x
//

module bw_u1_buf_20x (
    z,
    a );

    output z;
    input  a;

    assign z = ( a );

endmodule


//bw_u1_buf_30x
//

module bw_u1_buf_30x (
    z,
    a );

    output z;
    input  a;

    assign z = ( a );

endmodule


//bw_u1_buf_40x
//

module bw_u1_buf_40x (
    z,
    a );

    output z;
    input  a;

    assign z = ( a );

endmodule


//bw_u1_ao2222_1x
//
//
module bw_u1_ao2222_1x (

    z,
    a1,
    a2,
    b1,
    b2,
    c1,
    c2,
    d1,
    d2 );

    output z;
    input  a1;
    input  a2;
    input  b1;
    input  b2;
    input  c1;
    input  c2;
    input  d1;
    input  d2;

    assign z = ((d1&d2) | ( c1 & c2 ) | (b1&b2)| (a1& a2));

endmodule


//bw_u1_ao2222_2x
//
//
module bw_u1_ao2222_2x (

    z,
    a1,
    a2,
    b1,
    b2,
    c1,
    c2,
    d1,
    d2 );

    output z;
    input  a1;
    input  a2;
    input  b1;
    input  b2;
    input  c1;
    input  c2;
    input  d1;
    input  d2;

    assign z = ((d1&d2) | ( c1 & c2 ) | (b1&b2)| (a1& a2));

endmodule

//bw_u1_ao2222_4x
//
//
module bw_u1_ao2222_4x (

    z,
    a1,
    a2,
    b1,
    b2,
    c1,
    c2,
    d1,
    d2 );

    output z;
    input  a1;
    input  a2;
    input  b1;
    input  b2;
    input  c1;
    input  c2;
    input  d1;
    input  d2;

    assign z = ((d1&d2) | ( c1 & c2 ) | (b1&b2)| (a1& a2));

endmodule

////////////////////////////////////////////////////////////////////////
//
// flipflops {
//
////////////////////////////////////////////////////////////////////////

//      scanable D-flipflop with scanout

module bw_u1_soff_1x (q, so, ck, d, se, sd);
output q, so;
input  ck, d, se, sd;
        zsoff_prim i0 ( q, so, ck, d, se, sd );
endmodule

module bw_u1_soff_2x (q, so, ck, d, se, sd);
output q, so;
input  ck, d, se, sd;
        zsoff_prim i0 ( q, so, ck, d, se, sd );
endmodule

module bw_u1_soff_4x (q, so, ck, d, se, sd);
output q, so;
input  ck, d, se, sd;
        zsoff_prim i0 ( q, so, ck, d, se, sd );
endmodule

module bw_u1_soff_8x (q, so, ck, d, se, sd);
output q, so;
input  ck, d, se, sd;
        zsoff_prim i0 ( q, so, ck, d, se, sd );
endmodule

//      fast scanable D-flipflop with scanout with inverted Q output

module bw_u1_soffi_4x (q_l, so, ck, d, se, sd);
output q_l, so;
input  ck, d, se, sd;
        zsoffi_prim i0 ( q_l, so, ck, d, se, sd );
endmodule
  
module bw_u1_soffi_8x (q_l, so, ck, d, se, sd);
output q_l, so;
input  ck, d, se, sd;
        zsoffi_prim i0 ( q_l, so, ck, d, se, sd );
endmodule

//      scanable D-flipflop with scanout with 2-to-1 input mux

module bw_u1_soffm2_4x (q, so, ck, d0, d1, s, se, sd);
output q, so;
input  ck, d0, d1, s, se, sd;
        zsoffm2_prim i0 ( q, so, ck, d0, d1, s, se, sd );
endmodule

module bw_u1_soffm2_8x (q, so, ck, d0, d1, s, se, sd);
output q, so;
input  ck, d0, d1, s, se, sd;
        zsoffm2_prim i0 ( q, so, ck, d0, d1, s, se, sd );
endmodule

//      scanable D-flipflop with scanout with sync reset-bar

module bw_u1_soffr_2x (q, so, ck, d, se, sd, r_l);
output q, so;
input  ck, d, se, sd, r_l;
        zsoffr_prim i0 ( q, so, ck, d, se, sd, r_l );
endmodule
  
module bw_u1_soffr_4x (q, so, ck, d, se, sd, r_l);
output q, so;
input  ck, d, se, sd, r_l;
        zsoffr_prim i0 ( q, so, ck, d, se, sd, r_l );
endmodule

module bw_u1_soffr_8x (q, so, ck, d, se, sd, r_l);
output q, so;
input  ck, d, se, sd, r_l;
        zsoffr_prim i0 ( q, so, ck, d, se, sd, r_l );
endmodule

//bw_u1_soffasr_2x

module bw_u1_soffasr_2x (q, so, ck, d, r_l, s_l, se, sd);
output q, so;
input  ck, d, r_l, s_l, se, sd;
        zsoffasr_prim i0 (q, so, ck, d, r_l, s_l, se, sd);
endmodule


//bw_u1_ckbuf_1p5x


module bw_u1_ckbuf_1p5x  (clk, rclk);
output clk;
input  rclk;
        buf (clk, rclk);
endmodule


//bw_u1_ckbuf_3x


module bw_u1_ckbuf_3x  (clk, rclk);
output clk;
input  rclk;
        buf (clk, rclk);
endmodule

//bw_u1_ckbuf_4p5x


module bw_u1_ckbuf_4p5x  (clk, rclk);
output clk;
input  rclk;
        buf (clk, rclk);
endmodule


//bw_u1_ckbuf_6x


module bw_u1_ckbuf_6x  (clk, rclk);
output clk;
input  rclk;
        buf (clk, rclk);
endmodule

//bw_u1_ckbuf_7x
//

module bw_u1_ckbuf_7x  (clk, rclk);
output clk;
input  rclk;
        buf (clk, rclk);
endmodule

//bw_u1_ckbuf_8x
//
module bw_u1_ckbuf_8x  (clk, rclk);
output clk;
input  rclk;
        buf (clk, rclk);
endmodule


//bw_u1_ckbuf_11x
//

module bw_u1_ckbuf_11x (clk, rclk);
output clk;
input  rclk;

    assign clk = ( rclk );

endmodule

//bw_u1_ckbuf_14x
//

module bw_u1_ckbuf_14x (clk, rclk);
output clk;
input  rclk;

    assign clk = ( rclk );

endmodule

//bw_u1_ckbuf_17x
//

module bw_u1_ckbuf_17x (clk, rclk);
output clk;
input  rclk;

    assign clk = ( rclk );

endmodule




//bw_u1_ckbuf_19x
//

module bw_u1_ckbuf_19x (clk, rclk);
output clk;
input  rclk;

    assign clk = ( rclk );

endmodule




//bw_u1_ckbuf_22x
//

module bw_u1_ckbuf_22x (clk, rclk);
output clk;
input  rclk;

    assign clk = ( rclk );

endmodule

//bw_u1_ckbuf_25x
//

module bw_u1_ckbuf_25x (clk, rclk);
output clk;
input  rclk;

    assign clk = ( rclk );

endmodule


//bw_u1_ckbuf_28x
//

module bw_u1_ckbuf_28x (clk, rclk);
output clk;
input  rclk;

    assign clk = ( rclk );

endmodule


//bw_u1_ckbuf_30x
//

module bw_u1_ckbuf_30x (clk, rclk);
output clk;
input  rclk;

    assign clk = ( rclk );

endmodule

//bw_u1_ckbuf_33x
//

module bw_u1_ckbuf_33x (clk, rclk);
output clk;
input  rclk;

    assign clk = ( rclk );

endmodule

//bw_u1_ckbuf_40x
//

module bw_u1_ckbuf_40x (clk, rclk);
output clk;
input  rclk;

    assign clk = ( rclk );

endmodule


// gated clock buffers


module bw_u1_ckenbuf_6x  (clk, rclk, en_l, tm_l);
output clk;
input  rclk, en_l, tm_l;
        zckenbuf_prim i0 ( clk, rclk, en_l, tm_l );
endmodule 

module bw_u1_ckenbuf_14x (clk, rclk, en_l, tm_l);
output clk;
input  rclk, en_l, tm_l;
        zckenbuf_prim i0 ( clk, rclk, en_l, tm_l );
endmodule   

////////////////////////////////////////////////////////////////////////
//
// half cells
//
////////////////////////////////////////////////////////////////////////



module bw_u1_zhinv_0p6x (z, a);
output z;
input  a;
        not (z, a);
endmodule


module bw_u1_zhinv_1x (z, a);
output z;
input  a;
        not (z, a);
endmodule



module bw_u1_zhinv_1p4x (z, a);
output z;
input  a;
        not (z, a);
endmodule


module bw_u1_zhinv_2x (z, a);
output z;
input  a;
        not (z, a);
endmodule



module bw_u1_zhinv_3x (z, a);
output z;
input  a;
        not (z, a);
endmodule



module bw_u1_zhinv_4x (z, a);
output z;
input  a;
        not (z, a);
endmodule



module bw_u1_zhnand2_0p4x (z, a, b);
output z;
input  a, b;
        nand (z, a, b);
endmodule


module bw_u1_zhnand2_0p6x (z, a, b);
output z;   
input  a, b;
        nand (z, a, b);
endmodule   


module bw_u1_zhnand2_1x (z, a, b);
output z;   
input  a, b;
        nand (z, a, b);
endmodule   


module bw_u1_zhnand2_1p4x (z, a, b);
output z;   
input  a, b;
        nand (z, a, b);
endmodule   


module bw_u1_zhnand2_2x (z, a, b);
output z;   
input  a, b;
        nand (z, a, b);
endmodule   


module bw_u1_zhnand2_3x (z, a, b);
output z;   
input  a, b;
        nand (z, a, b);
endmodule   


module bw_u1_zhnand3_0p6x (z, a, b, c);
output z;
input  a, b, c;
        nand (z, a, b, c);
endmodule

module bw_u1_zhnand3_1x (z, a, b, c);
output z;
input  a, b, c;
        nand (z, a, b, c);
endmodule

module bw_u1_zhnand3_2x (z, a, b, c);
output z;
input  a, b, c;
        nand (z, a, b, c);
endmodule


module bw_u1_zhnand4_0p6x (z, a, b, c, d);
output z;
input  a, b, c, d;
        nand (z, a, b, c, d);
endmodule

module bw_u1_zhnand4_1x (z, a, b, c, d);
output z;
input  a, b, c, d;
        nand (z, a, b, c, d);
endmodule

module bw_u1_zhnand4_2x (z, a, b, c, d);
output z;
input  a, b, c, d;
        nand (z, a, b, c, d);
endmodule


        
module bw_u1_zhnor2_0p6x (z, a, b);
output z;
input  a, b;
        nor (z, a, b);
endmodule

module bw_u1_zhnor2_1x (z, a, b);
output z;   
input  a, b;
        nor (z, a, b);
endmodule

module bw_u1_zhnor2_2x (z, a, b);
output z;   
input  a, b;
        nor (z, a, b);
endmodule



module bw_u1_zhnor3_0p6x (z, a, b, c);
output z;
input  a, b, c;
        nor (z, a, b, c);
endmodule


module bw_u1_zhaoi21_0p4x (z,b1,b2,a);

    output z;   
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 & b2 ) | ( a ));
    
endmodule



module bw_u1_zhaoi21_1x (z, a, b1, b2);

    output z;
    input  b1;
    input  b2;
    input  a;

    assign z = ~(( b1 & b2 ) | ( a ));

endmodule



module bw_u1_zhoai21_1x (z,b1,b2,a );
    
    output z;
    input  b1;
    input  b2;  
    input  a;
  
    assign z = ~(( b1 | b2 ) & ( a ));
      
endmodule




module bw_u1_zhoai211_0p3x (z, a, b, c1, c2);
    output z; 
    input  c1;  
    input  c2;
    input  b;
    input  a;
      
    assign z = ~(( c1 | c2 ) & ( a ) & (b));
       
endmodule





module bw_u1_zhoai211_1x (z, a, b, c1, c2);
output z;
input  a, b, c1, c2;
    assign z = ~(( c1 | c2 ) & ( a ) & (b));
       
endmodule





/////////////// Scan data lock up latch ///////////////

module bw_u1_scanlg_2x (so, sd, ck, se);
output so;
input sd, ck, se;

reg so_l;

    assign so = ~so_l;
    always @ ( ck or sd or se )
       if (~ck) so_l <= ~(sd & se) ;

endmodule

module bw_u1_scanl_2x (so, sd, ck);
output so;
input sd, ck;

reg so_l;

    assign so = ~so_l;
    always @ ( ck or sd )
       if (~ck) so_l <= ~sd ;

endmodule



////////////////// Synchronizer ////////////////

module bw_u1_syncff_4x (q, so, ck, d, se, sd);
output q, so;
input  ck, d, se, sd;

reg    q_r;
  always @ (posedge ck)
      q_r <= se ? sd : d;
  assign q  = q_r;
  assign so = q_r;

endmodule




////////////////////////////////////////////////////////////////////////
//
// non library cells
// 
////////////////////////////////////////////////////////////////////////

// These cells are used only in custom DP macros
// Do not use in any block design without prior permission


module bw_u1_zzeccxor2_5x (z, a, b); 
 output z; 
 input a, b;
    assign z = ( a ^ b );

endmodule



module bw_u1_zzmulcsa42_5x (sum, carry, cout, a, b, c, d, cin);
output sum, carry, cout;
input  a, b, c, d, cin;
wire and_cin_b, or_cin_b, xor_a_c_d, and_or_cin_b_xor_a_c_d;
wire and_a_c, and_a_d, and_c_d;
        assign sum   = cin ^ a ^ b ^ c ^ d;
        assign carry = cin & b | (cin | b) & (a ^ c ^ d);
        assign cout  = a & c | a & d | c & d;
endmodule



module bw_u1_zzmulcsa32_5x (sum, cout, a, b, c);
output sum, cout;
input  a, b, c;
wire and_a_b, and_a_c, and_b_c;
        assign sum  = a ^ b ^ c ;
        assign cout = a & b | a & c | b & c ;
endmodule



module bw_u1_zzmulppmuxi21_2x ( z, d0, d1, s );
output  z;
input  d0, d1, s;
    assign z = s ? ~d1 : ~d0;
endmodule



module bw_u1_zzmulnand2_2x ( z, a, b );
output z;
input  a;
input  b;
    assign z = ~( a & b );
endmodule



// Primitives




module zmuxi31d_prim (z, d0, d1, d2, s0, s1, s2);
output z;
input  d0, d1, d2, s0, s1, s2;
// for Blacktie



wire [2:0] sel = {s0,s1,s2}; // 0in one_hot
reg z;
    always @ (s2 or d2 or s1 or d1 or s0 or d0)
        casez ({s2,d2,s1,d1,s0,d0})
            6'b0?0?10: z = 1'b1;  
            6'b0?0?11: z = 1'b0;  
            6'b0?100?: z = 1'b1;  
            6'b0?110?: z = 1'b0;  
            6'b0?1010: z = 1'b1;  
            6'b0?1111: z = 1'b0;  
            6'b100?0?: z = 1'b1;  
            6'b110?0?: z = 1'b0;  
            6'b100?10: z = 1'b1;  
            6'b110?11: z = 1'b0;  
            6'b10100?: z = 1'b1;  
            6'b11110?: z = 1'b0;  
            6'b101010: z = 1'b1;  
            6'b111111: z = 1'b0;  
            default: z = 1'bx;
        endcase
endmodule







module zmuxi41d_prim (z, d0, d1, d2, d3, s0, s1, s2, s3);
output z;
input  d0, d1, d2, d3, s0, s1, s2, s3;
// for Blacktie



wire [3:0] sel = {s0,s1,s2,s3}; // 0in one_hot
reg z;
    always @ (s3 or d3 or s2 or d2 or s1 or d1 or s0 or d0)
        casez ({s3,d3,s2,d2,s1,d1,s0,d0})
            8'b0?0?0?10: z = 1'b1;
            8'b0?0?0?11: z = 1'b0;
            8'b0?0?100?: z = 1'b1;
            8'b0?0?110?: z = 1'b0;
            8'b0?0?1010: z = 1'b1;
            8'b0?0?1111: z = 1'b0;
            8'b0?100?0?: z = 1'b1;
            8'b0?110?0?: z = 1'b0;
            8'b0?100?10: z = 1'b1;
            8'b0?110?11: z = 1'b0;
            8'b0?10100?: z = 1'b1;
            8'b0?11110?: z = 1'b0;
            8'b0?101010: z = 1'b1;
            8'b0?111111: z = 1'b0;
            8'b100?0?0?: z = 1'b1;
            8'b110?0?0?: z = 1'b0;
            8'b100?0?10: z = 1'b1;
            8'b110?0?11: z = 1'b0;
            8'b100?100?: z = 1'b1;
            8'b110?110?: z = 1'b0;
            8'b100?1010: z = 1'b1;
            8'b110?1111: z = 1'b0;
            8'b10100?0?: z = 1'b1;
            8'b11110?0?: z = 1'b0;
            8'b10100?10: z = 1'b1;
            8'b11110?11: z = 1'b0;
            8'b1010100?: z = 1'b1;
            8'b1111110?: z = 1'b0;
            8'b10101010: z = 1'b1;
            8'b11111111: z = 1'b0;
            default: z = 1'bx;
        endcase   
endmodule



module zsoff_prim (q, so, ck, d, se, sd);
output q, so;
input  ck, d, se, sd;
reg    q_r;
  always @ (posedge ck)
      q_r <= se ? sd : d;
  assign q  = q_r;
  assign so = q_r ;
endmodule


module zsoffr_prim (q, so, ck, d, se, sd, r_l);
output q, so;
input  ck, d, se, sd, r_l;
reg    q_r;
  always @ (posedge ck)
      q_r <= se ? sd : (d & r_l) ;
  assign q  = q_r;
  assign so = q_r;
endmodule


module zsoffi_prim (q_l, so, ck, d, se, sd);
output q_l, so;
input  ck, d, se, sd;
reg    q_r;
  always @ (posedge ck)
      q_r <= se ? sd : d;
  assign q_l = ~q_r;
  assign so  = q_r;
endmodule



module zsoffm2_prim (q, so, ck, d0, d1, s, se, sd);
output q, so;
input  ck, d0, d1, s, se, sd;
reg    q_r;
  always @ (posedge ck)
      q_r <= se ? sd : (s ? d1 : d0) ;
  assign q  = q_r;
  assign so = q_r;
endmodule

module zsoffasr_prim (q, so, ck, d, r_l, s_l, se, sd);
  output q, so;
  input ck, d, r_l, s_l, se, sd;

  // asynchronous reset and asynchronous set
  // (priority: r_l > s_l > se > d)
  reg q;
  wire so;

  always @ (posedge ck or negedge r_l or negedge s_l) begin
		if(~r_l) q <= 1'b0;
		else if (~s_l) q <= r_l;
		else if (se) q <= r_l & s_l & sd;
		else q <= r_l & s_l & (~se) & d;
  end

  assign so = q | ~se;

endmodule



module zckenbuf_prim (clk, rclk, en_l, tm_l);
output clk;
input  rclk, en_l, tm_l;
reg    clken;

  always @ (rclk or en_l or tm_l)
    if (!rclk)  //latch opens on rclk low phase
      clken <= ~en_l | ~tm_l;
  assign clk = clken & rclk;

endmodule

module bw_mckbuf_40x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_33x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_30x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_28x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_25x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_22x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_19x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_17x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_14x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_11x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_8x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_7x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_6x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_4p5x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_3x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

module bw_mckbuf_1p5x (clk, rclk, en);
output clk;
input  rclk;
input  en;

    assign clk = rclk & en ;

endmodule

//bw_u1_minbuf_1x
//

module bw_u1_minbuf_1x (
    z,
    a );

    output z;
    input  a;

    assign z = ( a );

endmodule

//bw_u1_minbuf_4x
//

module bw_u1_minbuf_4x (
    z,
    a );

    output z;
    input  a;

    assign z = ( a );

endmodule

//bw_u1_minbuf_5x
//

module bw_u1_minbuf_5x (
    z,
    a );

    output z;
    input  a;

    assign z = ( a );

endmodule

module bw_u1_ckenbuf_4p5x  (clk, rclk, en_l, tm_l);
output clk;
input  rclk, en_l, tm_l;
        zckenbuf_prim i0 ( clk, rclk, en_l, tm_l );
endmodule 

// dummy fill modules to get rid of DFT "CAP" property errors (bug 5487)

module bw_u1_fill_1x(\vdd! );
input \vdd! ;
endmodule

module bw_u1_fill_2x(\vdd! );
input \vdd! ;
endmodule

module bw_u1_fill_3x(\vdd! );
input \vdd! ;
endmodule

module bw_u1_fill_4x(\vdd! );
input \vdd! ;
endmodule
// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: ucb_bus_in.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
//
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
//
// The above named program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
//
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
//
// ========== Copyright Header End ============================================
////////////////////////////////////////////////////////////////////////
/*
//  Module Name:	ucb_bus_in (ucb bus inbound interface block)
//  Description:	This interface block is instaniated by the
//                      UCB modules and IO Bridge to receive packets
//                      on the UCB bus.
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: sys.h
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
// -*- verilog -*-
////////////////////////////////////////////////////////////////////////
/*
//
// Description:		Global header file that contain definitions that 
//                      are common/shared at the systme level
*/
////////////////////////////////////////////////////////////////////////
//
// Setting the time scale
// If the timescale changes, JP_TIMESCALE may also have to change.
`timescale	1ps/1ps
`default_nettype wire

//
// Number of threads in a core
// ===========================
//

//`define CONFIG_NUM_THREADS // This must be defined for any of below to work
//`define THREADS_1
//`define THREADS_2
//`define THREADS_3


//
// JBUS clock
// =========
//
// `define SYSCLK_PERIOD   5000


// Afara Link Defines
// ==================

// Reliable Link




// Afara Link Objects


// Afara Link Object Format - Reliable Link










// Afara Link Object Format - Congestion



  







// Afara Link Object Format - Acknowledge











// Afara Link Object Format - Request

















// Afara Link Object Format - Message



// Acknowledge Types




// Request Types





// Afara Link Frame



//
// UCB Packet Type
// ===============
//

















//
// UCB Data Packet Format
// ======================
//






























// Size encoding for the UCB_SIZE_HI/LO field
// 000 - byte
// 001 - half-word
// 010 - word
// 011 - double-word
// 111 - quad-word







//
// UCB Interrupt Packet Format
// ===========================
//










//`define UCB_THR_HI             9      // (6) cpu/thread ID shared with
//`define UCB_THR_LO             4             data packet format
//`define UCB_PKT_HI             3      // (4) packet type shared with
//`define UCB_PKT_LO             0      //     data packet format







//
// FCRAM Bus Widths
// ================
//






//
// ENET clock periods
// ==================
//
// `define AXGRMII_CLK_PERIOD          6400 // 312.5MHz/2
// `define ENET_GMAC_CLK_PERIOD        8000 // 125MHz


//
// JBus Bridge defines
// =================
//
// `define      SYS_UPA_CLK        `SYS.upa_clk
// `define      SYS_J_CLK          `SYS.j_clk
// `define      SYS_P_CLK          `SYS.p_clk
// `define      SYS_G_CLK          `SYS.g_clk
// `define      JP_TIMESCALE       `timescale 1 ps / 1 ps
// `define      PCI_CLK_PERIOD     15152                  //  66 MHz
// `define      UPA_RD_CLK_PERIOD  6666                   // 150 MHz
// `define      UPA_REF_CLK_PERIOD 7576                   // 132 MHz
// `define      ICHIP_CLK_PERIOD   30304                  //  33 MHz


//
// PCI Device Address Configuration
// ================================
//























// system level definition file which contains the
			// time scale definition

////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////
// Interface signal list declarations
////////////////////////////////////////////////////////////////////////
module ucb_bus_in (/*AUTOARG*/
   // Outputs
   stall, indata_buf_vld, indata_buf,
   // Inputs
   rst_l, clk, vld, data, stall_a1
   );

   // synopsys template

   parameter UCB_BUS_WIDTH = 32;
   parameter REG_WIDTH = 64;


////////////////////////////////////////////////////////////////////////
// Signal declarations
////////////////////////////////////////////////////////////////////////
   // Global interface
   input                     rst_l;
   input 		     clk;


   // UCB bus interface
   input 		     vld;
   input [UCB_BUS_WIDTH-1:0] data;
   output 		     stall;


   // Local interface
   output 		     indata_buf_vld;
   output [REG_WIDTH+63:0]   indata_buf;
   input 		     stall_a1; // would this prevent indata_buf to change?


   // Internal signals
   wire 		     vld_d1;
   wire 		     stall_d1;
   wire [UCB_BUS_WIDTH-1:0]  data_d1;
   wire 		     skid_buf0_en;
   wire 		     vld_buf0;
   wire [UCB_BUS_WIDTH-1:0]  data_buf0;
   wire 		     skid_buf1_en;
   wire 		     vld_buf1;
   wire [UCB_BUS_WIDTH-1:0]  data_buf1;
   wire 		     skid_buf0_sel;
   wire 		     skid_buf1_sel;
   wire 		     vld_mux;
   wire [UCB_BUS_WIDTH-1:0]  data_mux;
   wire [(REG_WIDTH+64)/UCB_BUS_WIDTH-1:0] indata_vec_next;
   wire [(REG_WIDTH+64)/UCB_BUS_WIDTH-1:0] indata_vec;
   wire [REG_WIDTH+63:0]     indata_buf_next;
   wire 		     indata_vec0_d1;


////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////
   /************************************************************
    * UCB bus interface flops
    * This is to make signals going between IOB and UCB flop-to-flop
    * to improve timing.
    ************************************************************/
   dffrle_ns #(1) vld_d1_ff (.din(vld),
			     .rst_l(rst_l),
			     .en(~stall_d1),
			     .clk(clk),
			     .q(vld_d1));

   dffe_ns #(UCB_BUS_WIDTH) data_d1_ff (.din(data),
					.en(~stall_d1),
					.clk(clk),
					.q(data_d1));

   dffrl_ns #(1) stall_ff (.din(stall_a1),
			   .clk(clk),
			   .rst_l(rst_l),
			   .q(stall));

   dffrl_ns #(1) stall_d1_ff (.din(stall),
			      .clk(clk),
			      .rst_l(rst_l),
			      .q(stall_d1));


   /************************************************************
    * Skid buffer
    * We need a two deep skid buffer to handle stalling.
    ************************************************************/
   // Assertion: stall has to be deasserted for more than 1 cycle
   //            ie time between two separate stalls has to be
   //            at least two cycles.  Otherwise, contents from
   //            skid buffer will be lost.

   // Buffer 0
   assign 	 skid_buf0_en = stall_a1 & ~stall;

   dffrle_ns #(1) vld_buf0_ff (.din(vld_d1),
			       .rst_l(rst_l),
			       .en(skid_buf0_en),
			       .clk(clk),
			       .q(vld_buf0));

   dffe_ns #(UCB_BUS_WIDTH) data_buf0_ff (.din(data_d1),
					  .en(skid_buf0_en),
					  .clk(clk),
					  .q(data_buf0));

   // Buffer 1
   dffrl_ns #(1) skid_buf1_en_ff (.din(skid_buf0_en),
				  .clk(clk),
				  .rst_l(rst_l),
				  .q(skid_buf1_en));

   dffrle_ns #(1) vld_buf1_ff (.din(vld_d1),
			       .rst_l(rst_l),
			       .en(skid_buf1_en),
			       .clk(clk),
			       .q(vld_buf1));

   dffe_ns #(UCB_BUS_WIDTH) data_buf1_ff (.din(data_d1),
					  .en(skid_buf1_en),
					  .clk(clk),
					  .q(data_buf1));


   /************************************************************
    * Mux between skid buffer and interface flop
    ************************************************************/
   // Assertion: stall has to be deasserted for more than 1 cycle
   //            ie time between two separate stalls has to be
   //            at least two cycles.  Otherwise, contents from
   //            skid buffer will be lost.

   assign 	 skid_buf0_sel = ~stall_a1 & stall;

   dffrl_ns #(1) skid_buf1_sel_ff (.din(skid_buf0_sel),
				   .clk(clk),
				   .rst_l(rst_l),
				   .q(skid_buf1_sel));

   assign 	 vld_mux = skid_buf0_sel ? vld_buf0 :
		           skid_buf1_sel ? vld_buf1 :
		                           vld_d1;

   assign 	 data_mux = skid_buf0_sel ? data_buf0 :
		            skid_buf1_sel ? data_buf1 :
		                            data_d1;


   /************************************************************
    * Assemble inbound data
    ************************************************************/
   // valid vector
   assign 	 indata_vec_next = {vld_mux,
				    indata_vec[(REG_WIDTH+64)/UCB_BUS_WIDTH-1:1]};
   dffrle_ns #((REG_WIDTH+64)/UCB_BUS_WIDTH) indata_vec_ff (.din(indata_vec_next),
							    .en(~stall_a1),
							    .rst_l(rst_l),
							    .clk(clk),
							    .q(indata_vec));

   // data buffer
   assign 	 indata_buf_next = {data_mux,
				    indata_buf[REG_WIDTH+63:UCB_BUS_WIDTH]};
   dffe_ns #(REG_WIDTH+64) indata_buf_ff (.din(indata_buf_next),
					  .en(~stall_a1),
					  .clk(clk),
					  .q(indata_buf));

   // detect a new packet
   dffrle_ns #(1) indata_vec0_d1_ff (.din(indata_vec[0]),
				     .rst_l(rst_l),
				     .en(~stall_a1),
				     .clk(clk),
				     .q(indata_vec0_d1));

   assign        indata_buf_vld = indata_vec[0] & ~indata_vec0_d1;


endmodule // ucb_bus_in
// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: ucb_bus_out.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
//
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
//
// The above named program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
//
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
//
// ========== Copyright Header End ============================================
////////////////////////////////////////////////////////////////////////
/*
//  Module Name:        ucb_bus_out (ucb bus outbound interface block)
//	Description:	This interface block is instantiated by the
//                      UCB modules and IO Bridge to transmit packets
//                      on the UCB bus.
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: sys.h
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
// -*- verilog -*-
////////////////////////////////////////////////////////////////////////
/*
//
// Description:		Global header file that contain definitions that 
//                      are common/shared at the systme level
*/
////////////////////////////////////////////////////////////////////////
//
// Setting the time scale
// If the timescale changes, JP_TIMESCALE may also have to change.
`timescale	1ps/1ps
`default_nettype wire

//
// Number of threads in a core
// ===========================
//

//`define CONFIG_NUM_THREADS // This must be defined for any of below to work
//`define THREADS_1
//`define THREADS_2
//`define THREADS_3


//
// JBUS clock
// =========
//
// `define SYSCLK_PERIOD   5000


// Afara Link Defines
// ==================

// Reliable Link




// Afara Link Objects


// Afara Link Object Format - Reliable Link










// Afara Link Object Format - Congestion



  







// Afara Link Object Format - Acknowledge











// Afara Link Object Format - Request

















// Afara Link Object Format - Message



// Acknowledge Types




// Request Types





// Afara Link Frame



//
// UCB Packet Type
// ===============
//

















//
// UCB Data Packet Format
// ======================
//






























// Size encoding for the UCB_SIZE_HI/LO field
// 000 - byte
// 001 - half-word
// 010 - word
// 011 - double-word
// 111 - quad-word







//
// UCB Interrupt Packet Format
// ===========================
//










//`define UCB_THR_HI             9      // (6) cpu/thread ID shared with
//`define UCB_THR_LO             4             data packet format
//`define UCB_PKT_HI             3      // (4) packet type shared with
//`define UCB_PKT_LO             0      //     data packet format







//
// FCRAM Bus Widths
// ================
//






//
// ENET clock periods
// ==================
//
// `define AXGRMII_CLK_PERIOD          6400 // 312.5MHz/2
// `define ENET_GMAC_CLK_PERIOD        8000 // 125MHz


//
// JBus Bridge defines
// =================
//
// `define      SYS_UPA_CLK        `SYS.upa_clk
// `define      SYS_J_CLK          `SYS.j_clk
// `define      SYS_P_CLK          `SYS.p_clk
// `define      SYS_G_CLK          `SYS.g_clk
// `define      JP_TIMESCALE       `timescale 1 ps / 1 ps
// `define      PCI_CLK_PERIOD     15152                  //  66 MHz
// `define      UPA_RD_CLK_PERIOD  6666                   // 150 MHz
// `define      UPA_REF_CLK_PERIOD 7576                   // 132 MHz
// `define      ICHIP_CLK_PERIOD   30304                  //  33 MHz


//
// PCI Device Address Configuration
// ================================
//























// system level definition file which
                        // contains the time scale definition

////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////

module ucb_bus_out (/*AUTOARG*/
   // Outputs
   vld, data, outdata_buf_busy,
   // Inputs
   clk, rst_l, stall, outdata_buf_in, outdata_vec_in, outdata_buf_wr
   );

   // synopsys template

   parameter UCB_BUS_WIDTH = 32;
   parameter REG_WIDTH = 64;            // maximum data bits that needs to
                                        // be sent.  Set to 64 or 128

   // Globals
   input                                clk;
   input 				rst_l;


   // UCB bus interface
   output 				vld;
   output [UCB_BUS_WIDTH-1:0] 		data;
   input 				stall;


   // Local interface
   output 				outdata_buf_busy;  // busy outputting, can't accept data into buffer
   input [REG_WIDTH+63:0] 		outdata_buf_in;
   input [(REG_WIDTH+64)/UCB_BUS_WIDTH-1:0] outdata_vec_in; // indicating how much data to send
   input 				outdata_buf_wr;


   // Local signals
   wire 				stall_d1;
   wire [(REG_WIDTH+64)/UCB_BUS_WIDTH-1:0] 	outdata_vec;
   wire [(REG_WIDTH+64)/UCB_BUS_WIDTH-1:0] 	outdata_vec_next;
   wire [REG_WIDTH+63:0] 		outdata_buf;
   reg [REG_WIDTH+63:0] 		outdata_buf_next;
   wire 				load_outdata;
   wire 				shift_outdata;


////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////
   /************************************************************
    * UCB bus interface flops
    ************************************************************/
   assign 	 vld = outdata_vec[0];
   // assign 	 data = vld ? outdata_buf[UCB_BUS_WIDTH-1:0] : `UCB_BUS_WIDTH'b0;
   assign    data = outdata_buf[UCB_BUS_WIDTH-1:0];

   dffrl_ns #(1) stall_d1_ff (.din(stall),
                              .clk(clk),
                              .rst_l(rst_l),
                              .q(stall_d1));


   /************************************************************
    * Outbound Data
    ************************************************************/
   // accept new data only if there is none being processed
   assign 	 load_outdata = outdata_buf_wr & ~outdata_buf_busy;

   assign 	 outdata_buf_busy = outdata_vec[0] | stall_d1;

   // only shifts when then input vector is a straight valids
   assign 	 shift_outdata = outdata_vec[0] & ~stall_d1;

   assign 	 outdata_vec_next =
		 load_outdata  ? outdata_vec_in:
		 shift_outdata ? outdata_vec >> 1:
	                         outdata_vec;
   dffrl_ns #((REG_WIDTH+64)/UCB_BUS_WIDTH) outdata_vec_ff (.din(outdata_vec_next),
							    .clk(clk),
							    .rst_l(rst_l),
							    .q(outdata_vec));

   // assign 	 outdata_buf_next =
		 // load_outdata  ? outdata_buf_in:
		 // shift_outdata ? (outdata_buf >> UCB_BUS_WIDTH):
	  //                        outdata_buf;
   always @ *
   begin
      if (load_outdata)
         outdata_buf_next = outdata_buf_in;
      else if (shift_outdata)
      begin
         outdata_buf_next = outdata_buf >> UCB_BUS_WIDTH;
         if (outdata_vec[1] == 1'b0)
            outdata_buf_next[UCB_BUS_WIDTH-1:0] = 0;
      end
      else
         outdata_buf_next = outdata_buf; // no shifting
   end

   dff_ns #(REG_WIDTH+64) outdata_buf_ff (.din(outdata_buf_next),
					  .clk(clk),
					  .q(outdata_buf));


endmodule // ucb_bus_out






// Copyright (c) 2015 Princeton University
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

//File: valrdy_to_credit.v (modified from space_avail_top.v)
//
//Modified: Yaosheng Fu
//May 2, 2014
//
//Function: This module keeps track of how many spots are free in the NIB that
//	we are sending to
//
//State: count_f, yummy_out_f, valid_in_f
//
//Instantiates: 
//

module valrdy_to_credit (
            clk,
            reset,
                
            //val/rdy interface
            data_in,
            valid_in,
            ready_in,

			//credit based interface	
            data_out,
            valid_out,
		    yummy_out);

parameter BUFFER_SIZE = 4;
parameter BUFFER_BITS = 3;
   
input clk;
input reset;

 
input [64-1:0]	 data_in;
 input valid_in;			// sending data to the output
 input yummy_out;			// output consumed data

output [64-1:0]  data_out;
 output valid_out;
 output ready_in;		// is there space available?


//This is the state
 reg yummy_out_f;
 reg valid_temp_f;
 reg [BUFFER_BITS-1:0] count_f;

reg is_one_f;
 reg is_two_or_more_f;

//wires
 wire [BUFFER_BITS-1:0] count_plus_1;
 wire [BUFFER_BITS-1:0] count_minus_1;
 wire up;
 wire down;

 wire valid_temp;

//wire regs
  reg [BUFFER_BITS-1:0] count_temp;


//assigns
assign data_out = data_in;
assign valid_temp = valid_in & ready_in;
assign valid_out = valid_temp;

assign count_plus_1 = count_f + 1'b1;
assign count_minus_1 = count_f - 1'b1;
assign ready_in = is_two_or_more_f;
assign up = yummy_out_f & ~valid_temp_f;
assign down = ~yummy_out_f & valid_temp_f;

always @ (count_f or count_plus_1 or count_minus_1 or up or down)
begin
	case (count_f)
	0:
		begin
			if(up)
			begin
				count_temp <= count_plus_1;
			end
			else
			begin
				count_temp <= count_f;
			end
		end
	BUFFER_SIZE:
		begin
			if(down)
			begin
				count_temp <= count_minus_1;
			end
			else
			begin
				count_temp <= count_f;
			end
		end
	default:
		begin
			case ({up, down})
				2'b10:	count_temp <= count_plus_1;
				2'b01:	count_temp <= count_minus_1;
				default:	count_temp <= count_f;
			endcase
		end
	endcase
end

//wire top_bits_zero_temp = ~| count_temp[BUFFER_BITS-1:1];
 wire top_bits_zero_temp = count_temp < 3 ? 1 : 0;

always @ (posedge clk)
begin
	if(reset)
	begin
	   count_f <= BUFFER_SIZE;
	   yummy_out_f <= 1'b0;
	   valid_temp_f <= 1'b0;
	   is_one_f <= (BUFFER_SIZE == 1);
	   is_two_or_more_f <= (BUFFER_SIZE >= 2);
	end
	else
	begin
	   count_f <= count_temp;
	   yummy_out_f <= yummy_out;
	   valid_temp_f <= valid_temp;
	   is_one_f         <= top_bits_zero_temp & count_temp[0];
   	   is_two_or_more_f <= ~top_bits_zero_temp;
	end
end

endmodule
      
/*
Copyright (c) 2015 Princeton University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Princeton University nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/*
Copyright (c) 2015 Princeton University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Princeton University nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

//l15.h
// Copyright (c) 2015 Princeton University
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

//==================================================================================================
//  Filename      : define.h
//  Created On    : 2014-02-20
//  Last Modified : 2018-11-16 17:14:11
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : main header file defining global architecture parameters
//
//
//==================================================================================================




// Uncomment to define USE_GENERIC_SRAM_IMPLEMENTATION to use the old unsynthesizable BRAM
// `define USE_GENERIC_SRAM_IMPLEMENTATION




/*
Copyright (c) 2015 Princeton University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Princeton University nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/////////////////////////////////////////////////////////////////////////////////////////////
// 63         50 49      42 41      34 33           30 29      22 21                 0   
// ------------------------------------------------------------------------------------
// |            |          |          |               |          |                    |
// |  Chip ID   |  Dest X  |  Dest Y  |  Final Route  |  Length  |    Header Payload  | 
// |            |          |          |               |          |                    |
// ------------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////////////////////











 //whether the routing is based on chipid or x y position
 //`define    ROUTING_CHIP_ID
 

 //defines for different topology, only one should be active
 //`define    NETWORK_TOPO_2D_MESH
 //`define    NETWORK_TOPO_3D_MESH
 

// Tile config

// devices.xml





// NoC interface





















// NodeID decomposition








//========================
//Packet format
//=========================

//Header decomposition































// these shifted fields are added for convienience
// HEADER 2








// HEADER 3








//NoC header information










// Width of MSG_ADDR field - you're probably looking for PHY_ADDR_WIDTH


//Coherence information





//Requests from L15 to L2
// Should always make #0 an error








//condition satisfied

//condition not satisfied

//Both SWAP and LDSTUB are the same for L2









//RISC-V AMO requests









//RISC-V AMO L2-internal phase 1









//RISC-V AMO L2-internal phase 2












//Forward requests from L2 to L15







//Memory requests from L2 to DRAM






//Forward acks from L15 to L2







//Memory acks from memory to L2









//Acks from L2 to L15


//TODO



//Only exist within L2





//`define MSG_TYPE_LOAD_REQ           8'd31 if this is enabled, don't use 31





// These should be defined in l2.vh, not the global defines











//Physical address










//Transition data size












//`define HOME_ID_MASK_X          10:10
//Additional fields for Sharer Domain ID and Logical Sharer ID
//For coherence domain restriction only


// Tri: dynamically adjust these parameters based on how many tiles are available
//  Assumption: 8x8 topology























































//`define DMBR_TAG_WIDTH 4

//Clumpy Shared Memory






////////////////////////////////////////////
// SOME CONFIGURATION REGISTERS DEFINES
////////////////////////////////////////////
// example: read/write to csm_en would be 0xba_0000_0100

// `define ASI_ADDRESS_MASK    `L15_ADDR_TYPE
// `define CONFIG_ASI_ADDRESS  `L15_ADDR_TYPE_WIDTH'hba










// DMBR Config register 1 fields















// DMBR Config register 2 fields



//Home allocation method






//Additional fields for Sharer Domain ID and Logical Sharer ID
//For coherence domain restriction only

































//`define TTE_CSM_WIDTH           64
//`define TTE_CSM                 63:0
//`define TTE_CSM_VALID           63
//`define TTE_CSM_SZL             62:61
//`define TTE_CSM_NFO             60
//`define TTE_CSM_IE              59
//`define TTE_CSM_SOFT2           58:49
//`define TTE_CSM_SZH             48
//`define TTE_CSM_DIAG            47:40
//`define TTE_CSM_RES1            39
//`define TTE_CSM_SDID            38:29
//`define TTE_CSM_HDID            28:19
//`define TTE_CSM_LSID            18:13
//`define TTE_CSM_SOFT            12:8
//`define TTE_CSM_RES2            7
//`define TTE_CSM_LOCK            6
//`define TTE_CSM_CP              5
//`define TTE_CSM_CV              4
//`define TTE_CSM_E               3
//`define TTE_CSM_P               2
//`define TTE_CSM_W               1
//`define TTE_CSM_RES3            0







//`define HOME_ID_X_POS_WIDTH         3
//`define HOME_ID_X_POS               2:0
//`define HOME_ID_Y_POS_WIDTH         3
//`define HOME_ID_Y_POS               5:3

// Packet format for home id





/////////////////////////////////////
// BIST
/////////////////////////////////////

// the data width from tap to individual sram wrappers



//deprecated































/////////////////////////////////////
// IDs for JTAG-Core interface
/////////////////////////////////////

// 48b for writing the PC reset vector

// 94b for reading the sscan data











// Execution Drafting Synchronization Method Values





// Execution Drafting timeout counter bit width


// Configuration registers












// Execution Drafting configuration register bit positions








// Execution Drafting configuration register default values
// ED disabled, STSM sync method, LFSR seed = 16'b0, LFSR load = 1'b0,
// Counter Timeout = 16'd32



//Clumpy sharer memory configuration registers
























// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iop.h
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
//-*- verilog -*-
////////////////////////////////////////////////////////////////////////
/*
//
//  Description:	Global header file that contain definitions that 
//                      are common/shared at the IOP chip level
*/
////////////////////////////////////////////////////////////////////////


// Address Map Defines
// ===================




// CMP space



// IOP space




                               //`define ENET_ING_CSR     8'h84
                               //`define ENET_EGR_CMD_CSR 8'h85















// L2 space



// More IOP space





//Cache Crossbar Width and Field Defines
//======================================













































//bits 133:128 are shared by different fields
//for different packet types.
























//`define CPX_INV_PA_HI   116
//`define CPX_INV_PA_LO   112






// cache invalidation format
// `define CPX_INV_DCACHE_WORD0_VAL 0
// `define CPX_INV_ICACHE_WORD0_VAL 1
// `define CPX_INV_WORD0_WAY 5:2
// `define CPX_INV_DCACHE_WORD0_VAL 6
// `define CPX_INV_ICACHE_WORD0_VAL 7
// `define CPX_INV_WORD0_WAY 11:8
// `define CPX_INV_DCACHE_WORD0_VAL 12
// // `define CPX_INV_ICACHE_WORD0_VAL 13
// `define CPX_INV_WORD0_WAY 17:14
// `define CPX_INV_DCACHE_WORD0_VAL 18
// // `define CPX_INV_ICACHE_WORD0_VAL 19
// `define CPX_INV_WORD0_WAY 23:20




// 4 extra bits for bigger icache/dcache
// up to 512KB l1 icache, 256KB l1 dcache

































//Pico defines













//End cache crossbar defines


// Number of COS supported by EECU 



// 
// BSC bus sizes
// =============
//

// General




// CTags













// reinstated temporarily




// CoS






// L2$ Bank



// L2$ Req













// L2$ Ack








// Enet Egress Command Unit














// Enet Egress Packet Unit













// This is cleaved in between Egress Datapath Ack's








// Enet Egress Datapath
















// In-Order / Ordered Queue: EEPU
// Tag is: TLEN, SOF, EOF, QID = 15






// Nack + Tag Info + CTag




// ENET Ingress Queue Management Req












// ENET Ingress Queue Management Ack








// Enet Ingress Packet Unit












// ENET Ingress Packet Unit Ack







// In-Order / Ordered Queue: PCI
// Tag is: CTAG





// PCI-X Request











// PCI_X Acknowledge











//
// BSC array sizes
//================
//












// ECC syndrome bits per memory element




//
// BSC Port Definitions
// ====================
//
// Bits 7 to 4 of curr_port_id








// Number of ports of each type


// Bits needed to represent above


// How wide the linked list pointers are
// 60b for no payload (2CoS)
// 80b for payload (2CoS)

//`define BSC_OBJ_PTR   80
//`define BSC_HD1_HI    69
//`define BSC_HD1_LO    60
//`define BSC_TL1_HI    59
//`define BSC_TL1_LO    50
//`define BSC_CT1_HI    49
//`define BSC_CT1_LO    40
//`define BSC_HD0_HI    29
//`define BSC_HD0_LO    20
//`define BSC_TL0_HI    19
//`define BSC_TL0_LO    10
//`define BSC_CT0_HI     9
//`define BSC_CT0_LO     0


































// I2C STATES in DRAMctl







//
// IOB defines
// ===========
//



















//`define IOB_INT_STAT_WIDTH   32
//`define IOB_INT_STAT_HI      31
//`define IOB_INT_STAT_LO       0

















































// fixme - double check address mapping
// CREG in `IOB_INT_CSR space










// CREG in `IOB_MAN_CSR space





































// Address map for TAP access of SPARC ASI













//
// CIOP UCB Bus Width
// ==================
//
//`define IOB_EECU_WIDTH       16  // ethernet egress command
//`define EECU_IOB_WIDTH       16

//`define IOB_NRAM_WIDTH       16  // NRAM (RLDRAM previously)
//`define NRAM_IOB_WIDTH        4




//`define IOB_ENET_ING_WIDTH   32  // ethernet ingress
//`define ENET_ING_IOB_WIDTH    8

//`define IOB_ENET_EGR_WIDTH    4  // ethernet egress
//`define ENET_EGR_IOB_WIDTH    4

//`define IOB_ENET_MAC_WIDTH    4  // ethernet MAC
//`define ENET_MAC_IOB_WIDTH    4




//`define IOB_BSC_WIDTH         4  // BSC
//`define BSC_IOB_WIDTH         4







//`define IOB_CLSP_WIDTH        4  // clk spine unit
//`define CLSP_IOB_WIDTH        4





//
// CIOP UCB Buf ID Type
// ====================
//



//
// Interrupt Device ID
// ===================
//
// Caution: DUMMY_DEV_ID has to be 9 bit wide
//          for fields to line up properly in the IOB.



//
// Soft Error related definitions 
// ==============================
//



//
// CMP clock
// =========
//




//
// NRAM/IO Interface
// =================
//










//
// NRAM/ENET Interface
// ===================
//







//
// IO/FCRAM Interface
// ==================
//






//
// PCI Interface
// ==================
// Load/store size encodings
// -------------------------
// Size encoding
// 000 - byte
// 001 - half-word
// 010 - word
// 011 - double-word
// 100 - quad






//
// JBI<->SCTAG Interface
// =======================
// Outbound Header Format



























// Inbound Header Format




















//
// JBI->IOB Mondo Header Format
// ============================
//














// JBI->IOB Mondo Bus Width/Cycle
// ==============================
// Cycle  1 Header[15:8]
// Cycle  2 Header[ 7:0]
// Cycle  3 J_AD[127:120]
// Cycle  4 J_AD[119:112]
// .....
// Cycle 18 J_AD[  7:  0]






// `define L15_CACHELINE_WIDTH 128

















// devices.xml
// this is used in the ariane SV packages to derive the parameterization

















































// 7

// 7




// 16B cache lines

// 10




// 40 - 4 (16B line) - 7 (index width) = 29

// 11

// 39


// this need to be defined when L1.5 has more sets than L1D
// for correct operations
// `define L15_WMT_EXTENDED_ALIAS


















// `define L15_WMT_ENTRY_0_MASK 1*`L15_WMT_ENTRY_WIDTH-1 -: `L15_WMT_ENTRY_WIDTH
// `define L15_WMT_ENTRY_1_MASK 2*`L15_WMT_ENTRY_WIDTH-1 -: `L15_WMT_ENTRY_WIDTH
// `define L15_WMT_ENTRY_2_MASK 3*`L15_WMT_ENTRY_WIDTH-1 -: `L15_WMT_ENTRY_WIDTH
// `define L15_WMT_ENTRY_3_MASK 4*`L15_WMT_ENTRY_WIDTH-1 -: `L15_WMT_ENTRY_WIDTH
// `define L15_WMT_ENTRY_0_VALID_MASK 1*`L15_WMT_ENTRY_WIDTH-1
// `define L15_WMT_ENTRY_1_VALID_MASK 2*`L15_WMT_ENTRY_WIDTH-1
// `define L15_WMT_ENTRY_2_VALID_MASK 3*`L15_WMT_ENTRY_WIDTH-1
// `define L15_WMT_ENTRY_3_VALID_MASK 4*`L15_WMT_ENTRY_WIDTH-1


  
  


  
  


  
  


  
  







// LRU array storage
// keeps 6 bits per cache set: 4 "used" bits, 1 each cache line, and 2 bits for wayid round robin (4w)





// source





// MSHR






// controls how many mshr there are
// `define L15_MSHR_COUNT 10
// should be more than the count above when 2^n











// pipeline OPs




// `define L15_MSHR_ALLOCATE_TYPE_WIDTH 2
// `define L15_MSHR_ALLOCATE_TYPE_LD 2'd1
// `define L15_MSHR_ALLOCATE_TYPE_ST 2'd2
// `define L15_MSHR_ALLOCATE_TYPE_IFILL 2'd3









































































































// `define PCX_REQ_SIZE_WIDTH 4


























// define the width of the flattened, native L15 interface, used for ARIANE_RV64 option



























// [L15_DTAG_OP_WIDTH-1:0]































//`define L15_S3_MESI_WRITE_TAGCHECK_WAY_M_IF_LRSC_SET 3'd7






























































// `define L15_NOC1_DUMMY_GEN_NOC1_CREDIT 5'd11










































// L2 shared states


// `define L15_NOC2_ACK_STATE_WIDTH 2
// `define L15_NOC2_ACK_STATE_S 2'd1
// `define L15_NOC2_ACK_STATE_E 2'd2
// `define L15_NOC2_ACK_STATE_M 2'd3

// `define L15_NOC1_REQTYPE_WIDTH `MSG_TYPE_WIDTH
// `define L15_NOC1_REQTYPE_WRITEBACK_GUARD `MSG_TYPE_WBGUARD_REQ
// `define L15_NOC1_REQTYPE_LD_REQUEST `MSG_TYPE_LOAD_REQ
// `define L15_NOC1_REQTYPE_LD_PREFETCH_REQUEST `MSG_TYPE_PREFETCH_REQ
// `define L15_NOC1_REQTYPE_LD_NC_REQUEST `MSG_TYPE_NC_LOAD_REQ
// `define L15_NOC1_REQTYPE_IFILL_REQUEST `MSG_TYPE_LOAD_REQ
// // `define L15_NOC1_REQTYPE_WRITETHROUGH_REQUEST 6'd4
// `define L15_NOC1_REQTYPE_ST_REQUEST `MSG_TYPE_STORE_REQ
// `define L15_NOC1_REQTYPE_BLK_ST_REQUEST `MSG_TYPE_BLK_STORE_REQ
// `define L15_NOC1_REQTYPE_BLK_ST_INIT_REQUEST `MSG_TYPE_BLKINIT_STORE_REQ
// // `define L15_NOC1_REQTYPE__REQUEST
// // `define L15_NOC1_REQTYPE__REQUEST
// // `define L15_NOC1_REQTYPE_ST_UPGRADE_REQUEST 6
// // `define L15_NOC1_REQTYPE_ST_FILL_REQUEST 6'd6
// `define L15_NOC1_REQTYPE_CAS_REQUEST `MSG_TYPE_CAS_REQ
// `define L15_NOC1_REQTYPE_SWAP_REQUEST `MSG_TYPE_SWAP_REQ

// `define L15_NOC3_REQTYPE_WIDTH `MSG_TYPE_WIDTH
// `define L15_NOC3_REQTYPE_WRITEBACK `MSG_TYPE_WB_REQ
// `define L15_NOC3_REQTYPE_NO_DATA_FWD_ACK `MSG_TYPE_NODATA_ACK
// `define L15_NOC3_REQTYPE_DATA_FWD_ACK `MSG_TYPE_DATA_ACK

// `define L2_REQTYPE_WIDTH `MSG_TYPE_WIDTH
// `define L2_REQTYPE_INVALIDATE 6'd1
// `define L2_REQTYPE_DOWNGRADE 6'd2
// `define L2_REQTYPE_ACKDT_LD_NC 6'd3
// `define L2_REQTYPE_ACKDT_IFILL 6'd4
// `define L2_REQTYPE_ACKDT_LD 6'd5
// `define L2_REQTYPE_ACKDT_ST_IM 6'd6
// `define L2_REQTYPE_ACKDT_ST_SM 6'd7
// `define L2_REQTYPE_ACK_WRITETHROUGH 6'd8
// `define L2_REQTYPE_ACK_ATOMIC 6'd9






































// NOC1 ENCODER











// NOC3 ENCODER










// NOC2 BUFFER





// DMBR
// put this here for now, should be moved to a more appropriate location


// NOC1 CREDIT MANAGEMENT
// becareful, the noc1buffer module assumes these are power of two
// also, please change the corresponding pyv value in noc1buffer.v.pyv























// `define L15_NOC1BUFFER_BLKSTORE_LO  `L15_NOC1BUFFER_PREFETCH_HI + 1
// `define L15_NOC1BUFFER_BLKSTORE_HI  `L15_NOC1BUFFER_BLKSTORE_LO + 1 - 1
// `define L15_NOC1BUFFER_BLKINITSTORE_LO  `L15_NOC1BUFFER_BLKSTORE_HI + 1
// `define L15_NOC1BUFFER_BLKINITSTORE_HI  `L15_NOC1BUFFER_BLKINITSTORE_LO + 1 - 1
// `define L15_NOC1BUFFER_DATA_INDEX_LO  `L15_NOC1BUFFER_BLKINITSTORE_HI + 1
































// `define L15_CPUID_ADDRESS 40'h9800000900






////////////////
// CSM
////////////////



// Tri: save space on l15 sram






















//HMC array
































//Special addresses for HMC


//`define L15_ADDR_TYPE_TAG_ACCESS     8'hb4 // later
//`define L15_ADDR_TYPE_STATE_ACCESS   8'hb6 // later
//`define L15_ADDR_TYPE_DIR_ACCESS     8'hb1 // later
//`define L15_ADDR_TYPE_CTRL_REG       8'hb9
//`define L15_ADDR_TYPE_DIS_FLUSH      8'hbc, 8'hbd, 8'hbe, 8'hbf
// `define L15_ADDR_TYPE_HMT_BASE_REG      8'hb7


















// Copyright (c) 2015 Princeton University
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

//==================================================================================================
//  Filename      : define.h
//  Created On    : 2014-02-20
//  Last Modified : 2018-11-16 17:14:11
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : main header file defining global architecture parameters
//
//
//==================================================================================================






































































































































































































































































































































































































































































































































































































// devices.xml



module flat_id_to_xy(
    input  [(6-1):0] flat_id,
    output reg [(8-1):0] x_coord,
    output reg [(8-1):0] y_coord
);

    always @*
    begin
        case (flat_id)
        
//(`NOC_Y_WIDTH+`NOC_X_WIDTH)'d0: 
6'd0: 
begin
    x_coord = 8'd0;
    y_coord = 8'd0;
end

        default:
        begin
            x_coord = 8'dX;
            y_coord = 8'dX;
        end
        endcase
    end
endmodule
/*
Copyright (c) 2015 Princeton University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Princeton University nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/*
Copyright (c) 2015 Princeton University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Princeton University nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

//l15.h
// Copyright (c) 2015 Princeton University
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

//==================================================================================================
//  Filename      : define.h
//  Created On    : 2014-02-20
//  Last Modified : 2018-11-16 17:14:11
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : main header file defining global architecture parameters
//
//
//==================================================================================================





































































































































































































































































































































































































































































































































































































// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iop.h
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
//-*- verilog -*-
////////////////////////////////////////////////////////////////////////
/*
//
//  Description:	Global header file that contain definitions that 
//                      are common/shared at the IOP chip level
*/
////////////////////////////////////////////////////////////////////////


// Address Map Defines
// ===================




// CMP space



// IOP space




                               //`define ENET_ING_CSR     8'h84
                               //`define ENET_EGR_CMD_CSR 8'h85















// L2 space



// More IOP space





//Cache Crossbar Width and Field Defines
//======================================













































//bits 133:128 are shared by different fields
//for different packet types.
























//`define CPX_INV_PA_HI   116
//`define CPX_INV_PA_LO   112






// cache invalidation format
// `define CPX_INV_DCACHE_WORD0_VAL 0
// `define CPX_INV_ICACHE_WORD0_VAL 1
// `define CPX_INV_WORD0_WAY 5:2
// `define CPX_INV_DCACHE_WORD0_VAL 6
// `define CPX_INV_ICACHE_WORD0_VAL 7
// `define CPX_INV_WORD0_WAY 11:8
// `define CPX_INV_DCACHE_WORD0_VAL 12
// // `define CPX_INV_ICACHE_WORD0_VAL 13
// `define CPX_INV_WORD0_WAY 17:14
// `define CPX_INV_DCACHE_WORD0_VAL 18
// // `define CPX_INV_ICACHE_WORD0_VAL 19
// `define CPX_INV_WORD0_WAY 23:20




// 4 extra bits for bigger icache/dcache
// up to 512KB l1 icache, 256KB l1 dcache

































//Pico defines













//End cache crossbar defines


// Number of COS supported by EECU 



// 
// BSC bus sizes
// =============
//

// General




// CTags













// reinstated temporarily




// CoS






// L2$ Bank



// L2$ Req













// L2$ Ack








// Enet Egress Command Unit














// Enet Egress Packet Unit













// This is cleaved in between Egress Datapath Ack's








// Enet Egress Datapath
















// In-Order / Ordered Queue: EEPU
// Tag is: TLEN, SOF, EOF, QID = 15






// Nack + Tag Info + CTag




// ENET Ingress Queue Management Req












// ENET Ingress Queue Management Ack








// Enet Ingress Packet Unit












// ENET Ingress Packet Unit Ack







// In-Order / Ordered Queue: PCI
// Tag is: CTAG





// PCI-X Request











// PCI_X Acknowledge











//
// BSC array sizes
//================
//












// ECC syndrome bits per memory element




//
// BSC Port Definitions
// ====================
//
// Bits 7 to 4 of curr_port_id








// Number of ports of each type


// Bits needed to represent above


// How wide the linked list pointers are
// 60b for no payload (2CoS)
// 80b for payload (2CoS)

//`define BSC_OBJ_PTR   80
//`define BSC_HD1_HI    69
//`define BSC_HD1_LO    60
//`define BSC_TL1_HI    59
//`define BSC_TL1_LO    50
//`define BSC_CT1_HI    49
//`define BSC_CT1_LO    40
//`define BSC_HD0_HI    29
//`define BSC_HD0_LO    20
//`define BSC_TL0_HI    19
//`define BSC_TL0_LO    10
//`define BSC_CT0_HI     9
//`define BSC_CT0_LO     0


































// I2C STATES in DRAMctl







//
// IOB defines
// ===========
//



















//`define IOB_INT_STAT_WIDTH   32
//`define IOB_INT_STAT_HI      31
//`define IOB_INT_STAT_LO       0

















































// fixme - double check address mapping
// CREG in `IOB_INT_CSR space










// CREG in `IOB_MAN_CSR space





































// Address map for TAP access of SPARC ASI













//
// CIOP UCB Bus Width
// ==================
//
//`define IOB_EECU_WIDTH       16  // ethernet egress command
//`define EECU_IOB_WIDTH       16

//`define IOB_NRAM_WIDTH       16  // NRAM (RLDRAM previously)
//`define NRAM_IOB_WIDTH        4




//`define IOB_ENET_ING_WIDTH   32  // ethernet ingress
//`define ENET_ING_IOB_WIDTH    8

//`define IOB_ENET_EGR_WIDTH    4  // ethernet egress
//`define ENET_EGR_IOB_WIDTH    4

//`define IOB_ENET_MAC_WIDTH    4  // ethernet MAC
//`define ENET_MAC_IOB_WIDTH    4




//`define IOB_BSC_WIDTH         4  // BSC
//`define BSC_IOB_WIDTH         4







//`define IOB_CLSP_WIDTH        4  // clk spine unit
//`define CLSP_IOB_WIDTH        4





//
// CIOP UCB Buf ID Type
// ====================
//



//
// Interrupt Device ID
// ===================
//
// Caution: DUMMY_DEV_ID has to be 9 bit wide
//          for fields to line up properly in the IOB.



//
// Soft Error related definitions 
// ==============================
//



//
// CMP clock
// =========
//




//
// NRAM/IO Interface
// =================
//










//
// NRAM/ENET Interface
// ===================
//







//
// IO/FCRAM Interface
// ==================
//






//
// PCI Interface
// ==================
// Load/store size encodings
// -------------------------
// Size encoding
// 000 - byte
// 001 - half-word
// 010 - word
// 011 - double-word
// 100 - quad






//
// JBI<->SCTAG Interface
// =======================
// Outbound Header Format



























// Inbound Header Format




















//
// JBI->IOB Mondo Header Format
// ============================
//














// JBI->IOB Mondo Bus Width/Cycle
// ==============================
// Cycle  1 Header[15:8]
// Cycle  2 Header[ 7:0]
// Cycle  3 J_AD[127:120]
// Cycle  4 J_AD[119:112]
// .....
// Cycle 18 J_AD[  7:  0]























































































































































































































































































































































































































































































































































































































































































































































































// Copyright (c) 2015 Princeton University
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

//==================================================================================================
//  Filename      : define.h
//  Created On    : 2014-02-20
//  Last Modified : 2018-11-16 17:14:11
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : main header file defining global architecture parameters
//
//
//==================================================================================================






































































































































































































































































































































































































































































































































































































// devices.xml



module xy_to_flat_id(
    input  [(8-1):0] x_coord,
    input  [(8-1):0] y_coord,
    output reg [(6-1):0] flat_id
);
    
    
    always @*
    begin
        case (x_coord)
        
8'd0:
begin
     case (y_coord)

    // (x,y) = (0, 0)
    8'd0:
    begin
        flat_id = 6'd0;
    end
     default:
     begin
         flat_id = 6'dX;
     end
     endcase
end

        default:
        begin
            flat_id = 6'dX;
        end
        endcase
    end
endmodule

// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: fpu.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
//
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
//
// The above named program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
//
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
//
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//	Floating Point Unit.
//
///////////////////////////////////////////////////////////////////////////////

module fpu (
	pcx_fpio_data_rdy_px2,
	pcx_fpio_data_px2,
	arst_l,
	grst_l,
	gclk,
	cluster_cken,

	fp_cpx_req_cq,
	fp_cpx_data_ca,

	ctu_tst_pre_grst_l,
	global_shift_enable,
	ctu_tst_scan_disable,
	ctu_tst_scanmode,
	ctu_tst_macrotest,
	ctu_tst_short_chain,

	si,
	so
);


input		pcx_fpio_data_rdy_px2;	// FPU request ready from PCX
input [123:0]	pcx_fpio_data_px2;	// FPU request data from PCX
input		arst_l;			// chip async. reset- asserted low
input		grst_l;			// chip sync. reset- asserted low
input		gclk;			// chip clock
input		cluster_cken;			// cluster clock enable

output [7:0]	fp_cpx_req_cq;		// FPU result request to CPX
output [144:0]	fp_cpx_data_ca;		// FPU result to CPX

input						ctu_tst_pre_grst_l;
input						global_shift_enable;
input						ctu_tst_scan_disable;
input						ctu_tst_scanmode;
input 					ctu_tst_macrotest;
input 					ctu_tst_short_chain;
input           si;                     // scan in
output          so;                     // scan out


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_in.
//
///////////////////////////////////////////////////////////////////////////////

wire		inq_add;		// add pipe request
wire		inq_mul;		// multiply pipe request
wire		inq_div;		// divide pipe request
wire [4:0]	inq_id;			// request ID to the operation pipes
wire [1:0]	inq_rnd_mode;		// request rounding mode to op pipes
wire [1:0]	inq_fcc;		// request cc ID to op pipes
wire [7:0]	inq_op;			// request opcode to op pipes
wire		inq_in1_exp_neq_ffs;	// request operand 1 exp!=ff's
wire		inq_in1_exp_eq_0;	// request operand 1 exp==0
wire		inq_in1_53_0_neq_0;	// request operand 1[53:0]!=0
wire		inq_in1_50_0_neq_0;	// request operand 1[50:0]!=0
wire		inq_in1_53_32_neq_0;	// request operand 1[53:32]!=0
wire [63:0]	inq_in1;		// request operand 1 to op pipes
wire		inq_in2_exp_neq_ffs;	// request operand 2 exp!=ff's
wire		inq_in2_exp_eq_0;	// request operand 2 exp==0
wire		inq_in2_53_0_neq_0;	// request operand 2[53:0]!=0
wire		inq_in2_50_0_neq_0;	// request operand 2[50:0]!=0
wire		inq_in2_53_32_neq_0;	// request operand 2[53:32]!=0
wire [63:0]	inq_in2;		// request operand 2 to op pipes
wire  		fadd_clken_l;		// add      pipe clk enable - asserted low
wire 		fmul_clken_l;		// multiply pipe clk enable - asserted low
wire 		fdiv_clken_l;		// divide   pipe clk enable - asserted low

// 6/20/03: New outputs of fpu_in for fpu-level i_fpu_inq_sram

wire [4:0] fp_id_in; // id to be written into inq_sram
wire [1:0] fp_rnd_mode_in; // rnd_mode to be written into inq_sram
wire [1:0] fp_fcc_in; // fcc to be written into inq_sram
wire [7:0] fp_op_in; // op field to be written into inq_sram
wire [68:0] fp_src1_in; // operand1, includes pre-computed bits matching special values, such as exp all ffs
wire [68:0] fp_src2_in; // operand2, includes pre-computed bits matching special values, such as exp all ffs
wire [3:0] inq_rdaddr; // read address for inq_sram
wire [3:0] inq_wraddr; // write address for inq_sram
wire inq_read_en; // read enable for inq_sram
wire inq_we; // write enable for inq_sram


///////////////////////////////////////////////////////////////////////////////
//
// Outputs of i_fpu_inq_sram
//
///////////////////////////////////////////////////////////////////////////////

wire [154:0] inq_dout; // fpu op packet read out from inq_sram
wire [4:0] inq_dout_unused; // unused bits from sram


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_add.
//
///////////////////////////////////////////////////////////////////////////////

wire		a1stg_step;		// add pipe load
wire		a6stg_fadd_in;		// add pipe output request next cycle
wire [9:0]	add_id_out_in;		// add pipe output ID next cycle
wire		a6stg_fcmpop;		// compare- add 6 stage
wire [4:0]	add_exc_out;		// add pipe result- exception flags
wire		a6stg_dbl_dst;		// float double result- add 6 stage
wire		a6stg_sng_dst;		// float single result- add 6 stage
wire		a6stg_long_dst;		// 64bit integer result- add 6 stage
wire		a6stg_int_dst;		// 32bit integer result- add 6 stage
wire		add_sign_out;		// add sign output
wire [10:0]	add_exp_out;		// add exponent output
wire [63:0]	add_frac_out;		// add fraction output
wire [1:0]	add_cc_out;		// add pipe result- condition
wire [1:0]	add_fcc_out;		// add pipe input fcc passed through
wire		add_pipe_active;        // add pipe is executing a valid instr


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_mul.
//
///////////////////////////////////////////////////////////////////////////////

wire		m1stg_step;		// multiply pipe load
wire		m6stg_fmul_in;		// mul pipe output request next cycle
wire [9:0]	m6stg_id_in;		// mul pipe output ID next cycle
wire [4:0]	mul_exc_out;		// multiply pipe result- exception flags
wire		m6stg_fmul_dbl_dst;	// double precision multiply result
wire		m6stg_fmuls;		// fmuls- multiply 6 stage
wire		mul_sign_out;		// multiply sign output
wire [10:0]	mul_exp_out;		// multiply exponent output
wire [51:0]	mul_frac_out;		// multiply fraction output
wire		mul_pipe_active;        // mul pipe is executing a valid instr


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_div.
//
///////////////////////////////////////////////////////////////////////////////

wire		d1stg_step;		// divide pipe load
wire		d8stg_fdiv_in;		// div pipe output request next cycle
wire [9:0]	div_id_out_in;		// div pipe output ID next cycle
wire [4:0]	div_exc_out;		// divide pipe result- exception flags
wire		d8stg_fdivd;		// divide double- divide stage 8
wire		d8stg_fdivs;		// divide single- divide stage 8
wire		div_sign_out;		// divide sign output
wire [10:0]	div_exp_out;		// divide exponent output
wire [51:0]	div_frac_out;		// divide fraction output
wire		div_pipe_active;        // div pipe is executing a valid instr


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_out.
//
///////////////////////////////////////////////////////////////////////////////

wire [7:0]	fp_cpx_req_cq_unbuf;		// FPU result request to CPX
wire		add_dest_rdy;		// add pipe result request this cycle
wire		mul_dest_rdy;		// mul pipe result request this cycle
wire		div_dest_rdy;		// div pipe result request this cycle
wire [144:0]	fp_cpx_data_ca_unbuf;		// FPU result to CPX


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of cluster_header, test_stub.
//
///////////////////////////////////////////////////////////////////////////////

wire rclk; // ref. clock

wire		sehold; // scan in data hold

wire fpu_grst_l;

///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_rptr_groups.
//
///////////////////////////////////////////////////////////////////////////////

wire [63:0] inq_in1_add_buf1;
wire [63:0] inq_in1_mul_buf1;
wire [63:0] inq_in1_div_buf1;
wire [63:0] inq_in2_add_buf1;
wire [63:0] inq_in2_mul_buf1;
wire [63:0] inq_in2_div_buf1;
wire [4:0] inq_id_add_buf1;
wire [4:0] inq_id_mul_buf1;
wire [4:0] inq_id_div_buf1;
wire [7:0] inq_op_add_buf1;
wire [7:0] inq_op_mul_buf1;
wire [7:0] inq_op_div_buf1;
wire [1:0] inq_rnd_mode_add_buf1;
wire [1:0] inq_rnd_mode_mul_buf1;
wire [1:0] inq_rnd_mode_div_buf1;
wire inq_in1_50_0_neq_0_add_buf1;
wire inq_in1_50_0_neq_0_mul_buf1;
wire inq_in1_50_0_neq_0_div_buf1;
wire inq_in1_53_0_neq_0_add_buf1;
wire inq_in1_53_0_neq_0_mul_buf1;
wire inq_in1_53_0_neq_0_div_buf1;
wire inq_in1_53_32_neq_0_add_buf1;
wire inq_in1_53_32_neq_0_mul_buf1;
wire inq_in1_53_32_neq_0_div_buf1;
wire inq_in1_exp_eq_0_add_buf1;
wire inq_in1_exp_eq_0_mul_buf1;
wire inq_in1_exp_eq_0_div_buf1;
wire inq_in1_exp_neq_ffs_add_buf1;
wire inq_in1_exp_neq_ffs_mul_buf1;
wire inq_in1_exp_neq_ffs_div_buf1;
wire inq_in2_50_0_neq_0_add_buf1;
wire inq_in2_50_0_neq_0_mul_buf1;
wire inq_in2_50_0_neq_0_div_buf1;
wire inq_in2_53_0_neq_0_add_buf1;
wire inq_in2_53_0_neq_0_mul_buf1;
wire inq_in2_53_0_neq_0_div_buf1;
wire inq_in2_53_32_neq_0_add_buf1;
wire inq_in2_53_32_neq_0_mul_buf1;
wire inq_in2_53_32_neq_0_div_buf1;
wire inq_in2_exp_eq_0_add_buf1;
wire inq_in2_exp_eq_0_mul_buf1;
wire inq_in2_exp_eq_0_div_buf1;
wire inq_in2_exp_neq_ffs_add_buf1;
wire inq_in2_exp_neq_ffs_mul_buf1;
wire inq_in2_exp_neq_ffs_div_buf1;

wire [123:0] pcx_fpio_data_px2_buf1;
wire [155:0] inq_sram_din_buf1;

// Previously missing wire declarations:
wire         pcx_fpio_data_rdy_px2_buf1;
wire         arst_l_in_buf3;
wire         fpu_grst_l_in_buf2;
wire         se_in_buf3;
wire         manual_scan_0;
wire         scan_manual_1;
wire         se;
wire         si_buf1;
wire         scan_inq_sram_w;
wire         rst_tri_en;
wire         arst_l_add_buf4;
wire         fpu_grst_l_add_buf3;
wire         se_add_exp_buf2;
wire         se_add_frac_buf2;
wire         scan_manual_2;
wire         fmul_clken_l_buf1;
wire         arst_l_mul_buf2;
wire         fpu_grst_l_mul_buf1;
wire         se_mul_buf4;
wire         se_mul64_buf2;
wire         scan_manual_3;
wire         fdiv_clken_l_div_frac_buf1;
wire         fdiv_clken_l_div_exp_buf1;
wire         arst_l_div_buf2;
wire         se_div_buf5;
wire         scan_manual_4;
wire         arst_l_out_buf3;
wire         se_out_buf2;
wire         scan_manual_5;
wire         ctu_tst_pre_grst_l_buf1;
wire         global_shift_enable_buf1;
wire         ctu_tst_scan_disable_buf1;
wire         ctu_tst_scanmode_buf1;
wire         ctu_tst_macrotest_buf1;
wire         ctu_tst_short_chain_buf1;
wire         scan_manual_6_buf1;
wire         so_unbuf;
wire         scan_manual_6;
wire         grst_l_buf1;
wire         cluster_cken_buf1;
wire         se_cluster_header_buf2;
wire         arst_l_cluster_header_buf2;


///////////////////////////////////////////////////////////////////////////////
//
//      Instantiations.
//
///////////////////////////////////////////////////////////////////////////////

fpu_in fpu_in (
	.pcx_fpio_data_rdy_px2		(pcx_fpio_data_rdy_px2_buf1),
	.pcx_fpio_data_px2		(pcx_fpio_data_px2_buf1[123:0]),
	.a1stg_step			(a1stg_step),
	.m1stg_step			(m1stg_step),
	.d1stg_step			(d1stg_step),
	.add_pipe_active		(add_pipe_active),
	.mul_pipe_active		(mul_pipe_active),
	.div_pipe_active		(div_pipe_active),
	.inq_dout    (inq_dout[154:0]),
	.sehold (sehold),
	.arst_l				(arst_l_in_buf3),
	.grst_l				(fpu_grst_l_in_buf2),
	.rclk				(rclk),

	.fadd_clken_l			(fadd_clken_l),
	.fmul_clken_l			(fmul_clken_l),
	.fdiv_clken_l			(fdiv_clken_l),

	.inq_add			(inq_add),
	.inq_mul			(inq_mul),
	.inq_div			(inq_div),
	.inq_id				(inq_id[4:0]),
	.inq_rnd_mode			(inq_rnd_mode[1:0]),
	.inq_fcc			(inq_fcc[1:0]),
	.inq_op				(inq_op[7:0]),
	.inq_in1_exp_neq_ffs		(inq_in1_exp_neq_ffs),
	.inq_in1_exp_eq_0		(inq_in1_exp_eq_0),
	.inq_in1_53_0_neq_0		(inq_in1_53_0_neq_0),
	.inq_in1_50_0_neq_0		(inq_in1_50_0_neq_0),
	.inq_in1_53_32_neq_0		(inq_in1_53_32_neq_0),
	.inq_in1			(inq_in1[63:0]),
	.inq_in2_exp_neq_ffs		(inq_in2_exp_neq_ffs),
	.inq_in2_exp_eq_0		(inq_in2_exp_eq_0),
	.inq_in2_53_0_neq_0		(inq_in2_53_0_neq_0),
	.inq_in2_50_0_neq_0		(inq_in2_50_0_neq_0),
	.inq_in2_53_32_neq_0		(inq_in2_53_32_neq_0),
	.inq_in2			(inq_in2[63:0]),

// new outputs of fpu_in to drive i_fpu_inq_sram
	.fp_id_in (fp_id_in[4:0]),
	.fp_rnd_mode_in (fp_rnd_mode_in[1:0]),
	.fp_fcc_in (fp_fcc_in[1:0]),
	.fp_op_in (fp_op_in[7:0]),
	.fp_src1_in (fp_src1_in[68:0]),
	.fp_src2_in (fp_src2_in[68:0]),
	.inq_rdaddr (inq_rdaddr[3:0]),
	.inq_wraddr (inq_wraddr[3:0]),
	.inq_read_en (inq_read_en),
	.inq_we (inq_we),

	.se (se_in_buf3),
  .si (manual_scan_0),
  .so (scan_manual_1)
);


// 7/30/03: updated scan ports from si to si_r, si_w and so to so_r, so_w
// 06/20/03: Pulled up i_fpu_inq_sram from fpu_in_dp into fpu

bw_r_rf16x160 i_fpu_inq_sram (
	.din ({inq_sram_din_buf1[155:0], 4'b0000}),
	.rd_adr (inq_rdaddr[3:0]),
	.wr_adr (inq_wraddr[3:0]),
	.read_en (inq_read_en),
	.wr_en (inq_we),
	.word_wen (4'hf),
	.byte_wen (20'hfffff),
	.rd_clk (rclk),
	.wr_clk (rclk),
	.se (se),
	.si_r (si_buf1),
	.si_w (scan_inq_sram_w),
	.reset_l (arst_l_in_buf3),
	.sehold (sehold),
	.rst_tri_en (rst_tri_en),
	.dout ({inq_dout[154:0], inq_dout_unused[4:0]}),
	.so_r (scan_inq_sram_w),
	.so_w (manual_scan_0)
);


fpu_add fpu_add (
	.inq_op				(inq_op_add_buf1[7:0]),
	.inq_rnd_mode			(inq_rnd_mode_add_buf1[1:0]),
	.inq_id				(inq_id_add_buf1[4:0]),
	.inq_fcc			(inq_fcc[1:0]),
	.inq_in1			(inq_in1_add_buf1[63:0]),
	.inq_in1_50_0_neq_0		(inq_in1_50_0_neq_0_add_buf1),
	.inq_in1_53_32_neq_0		(inq_in1_53_32_neq_0_add_buf1),
	.inq_in1_exp_eq_0		(inq_in1_exp_eq_0_add_buf1),
	.inq_in1_exp_neq_ffs		(inq_in1_exp_neq_ffs_add_buf1),
	.inq_in2			(inq_in2_add_buf1[63:0]),
	.inq_in2_50_0_neq_0		(inq_in2_50_0_neq_0_add_buf1),
	.inq_in2_53_32_neq_0		(inq_in2_53_32_neq_0_add_buf1),
	.inq_in2_exp_eq_0		(inq_in2_exp_eq_0_add_buf1),
	.inq_in2_exp_neq_ffs		(inq_in2_exp_neq_ffs_add_buf1),
	.inq_add			(inq_add),
	.add_dest_rdy			(add_dest_rdy),
	.fadd_clken_l			(fadd_clken_l),
	.arst_l				(arst_l_add_buf4),
	.grst_l				(fpu_grst_l_add_buf3),
	.rclk				(rclk),

	.add_pipe_active                (add_pipe_active),
	.a1stg_step			(a1stg_step),
	.a6stg_fadd_in			(a6stg_fadd_in),
	.add_id_out_in			(add_id_out_in[9:0]),
	.a6stg_fcmpop			(a6stg_fcmpop),
	.add_exc_out			(add_exc_out[4:0]),
	.a6stg_dbl_dst			(a6stg_dbl_dst),
	.a6stg_sng_dst			(a6stg_sng_dst),
	.a6stg_long_dst			(a6stg_long_dst),
	.a6stg_int_dst			(a6stg_int_dst),
	.add_sign_out			(add_sign_out),
	.add_exp_out			(add_exp_out[10:0]),
	.add_frac_out			(add_frac_out[63:0]),
	.add_cc_out			(add_cc_out[1:0]),
	.add_fcc_out			(add_fcc_out[1:0]),

	.se_add_exp     (se_add_exp_buf2),
	.se_add_frac    (se_add_frac_buf2),
  .si             (scan_manual_1),
  .so             (scan_manual_2)
);


fpu_mul fpu_mul (
	.inq_op				(inq_op_mul_buf1[7:0]),
	.inq_rnd_mode			(inq_rnd_mode_mul_buf1[1:0]),
	.inq_id				(inq_id_mul_buf1[4:0]),
	.inq_in1			(inq_in1_mul_buf1[63:0]),
	.inq_in1_53_0_neq_0		(inq_in1_53_0_neq_0),
	.inq_in1_50_0_neq_0		(inq_in1_50_0_neq_0_mul_buf1),
	.inq_in1_53_32_neq_0		(inq_in1_53_32_neq_0_mul_buf1),
	.inq_in1_exp_eq_0		(inq_in1_exp_eq_0_mul_buf1),
	.inq_in1_exp_neq_ffs		(inq_in1_exp_neq_ffs_mul_buf1),
	.inq_in2			(inq_in2_mul_buf1[63:0]),
	.inq_in2_53_0_neq_0		(inq_in2_53_0_neq_0),
	.inq_in2_50_0_neq_0		(inq_in2_50_0_neq_0_mul_buf1),
	.inq_in2_53_32_neq_0		(inq_in2_53_32_neq_0_mul_buf1),
	.inq_in2_exp_eq_0		(inq_in2_exp_eq_0_mul_buf1),
	.inq_in2_exp_neq_ffs		(inq_in2_exp_neq_ffs_mul_buf1),
	.inq_mul			(inq_mul),
	.mul_dest_rdy			(mul_dest_rdy),
	.mul_dest_rdya			(mul_dest_rdy),
	.fmul_clken_l			(fmul_clken_l),
	.fmul_clken_l_buf1			(fmul_clken_l_buf1),
	.arst_l				(arst_l_mul_buf2),
	.grst_l				(fpu_grst_l_mul_buf1),
	.rclk				(rclk),

	.mul_pipe_active                (mul_pipe_active),
	.m1stg_step			(m1stg_step),
	.m6stg_fmul_in			(m6stg_fmul_in),
	.m6stg_id_in			(m6stg_id_in[9:0]),
	.mul_exc_out			(mul_exc_out[4:0]),
	.m6stg_fmul_dbl_dst		(m6stg_fmul_dbl_dst),
	.m6stg_fmuls			(m6stg_fmuls),
	.mul_sign_out			(mul_sign_out),
	.mul_exp_out			(mul_exp_out[10:0]),
	.mul_frac_out			(mul_frac_out[51:0]),

	.se_mul           (se_mul_buf4),
	.se_mul64 (se_mul64_buf2),
  .si              (scan_manual_2),
  .so              (scan_manual_3)
);


fpu_div fpu_div (
	.inq_op				(inq_op_div_buf1[7:0]),
	.inq_rnd_mode			(inq_rnd_mode_div_buf1[1:0]),
	.inq_id				(inq_id_div_buf1[4:0]),
	.inq_in1			(inq_in1_div_buf1[63:0]),
	.inq_in1_53_0_neq_0		(inq_in1_53_0_neq_0_div_buf1),
	.inq_in1_50_0_neq_0		(inq_in1_50_0_neq_0_div_buf1),
	.inq_in1_53_32_neq_0		(inq_in1_53_32_neq_0_div_buf1),
	.inq_in1_exp_eq_0		(inq_in1_exp_eq_0_div_buf1),
	.inq_in1_exp_neq_ffs		(inq_in1_exp_neq_ffs_div_buf1),
	.inq_in2			(inq_in2_div_buf1[63:0]),
	.inq_in2_53_0_neq_0		(inq_in2_53_0_neq_0_div_buf1),
	.inq_in2_50_0_neq_0		(inq_in2_50_0_neq_0_div_buf1),
	.inq_in2_53_32_neq_0		(inq_in2_53_32_neq_0_div_buf1),
	.inq_in2_exp_eq_0		(inq_in2_exp_eq_0_div_buf1),
	.inq_in2_exp_neq_ffs		(inq_in2_exp_neq_ffs_div_buf1),
	.inq_div			(inq_div),
	.div_dest_rdy			(div_dest_rdy),
  .fdiv_clken_l			(fdiv_clken_l_div_frac_buf1),
  .fdiv_clken_l_div_exp_buf1 (fdiv_clken_l_div_exp_buf1),
	.arst_l				(arst_l_div_buf2),
	.grst_l				(fpu_grst_l),
	.rclk				(rclk),

	.div_pipe_active                (div_pipe_active),
	.d1stg_step			(d1stg_step),
	.d8stg_fdiv_in			(d8stg_fdiv_in),
	.div_id_out_in			(div_id_out_in[9:0]),
	.div_exc_out			(div_exc_out[4:0]),
	.d8stg_fdivd			(d8stg_fdivd),
	.d8stg_fdivs			(d8stg_fdivs),
	.div_sign_out			(div_sign_out),
	.div_exp_outa			(div_exp_out[10:0]),
	.div_frac_outa			(div_frac_out[51:0]),

	.se              (se_div_buf5),
  .si              (scan_manual_3),
  .so              (scan_manual_4)
);


fpu_out fpu_out (
	.d8stg_fdiv_in			(d8stg_fdiv_in),
	.m6stg_fmul_in			(m6stg_fmul_in),
	.a6stg_fadd_in			(a6stg_fadd_in),
	.div_id_out_in			(div_id_out_in[9:0]),
	.m6stg_id_in			(m6stg_id_in[9:0]),
	.add_id_out_in			(add_id_out_in[9:0]),
	.div_exc_out			(div_exc_out[4:0]),
	.d8stg_fdivd			(d8stg_fdivd),
	.d8stg_fdivs			(d8stg_fdivs),
	.div_sign_out			(div_sign_out),
	.div_exp_out			(div_exp_out[10:0]),
	.div_frac_out			(div_frac_out[51:0]),
	.mul_exc_out			(mul_exc_out[4:0]),
	.m6stg_fmul_dbl_dst		(m6stg_fmul_dbl_dst),
	.m6stg_fmuls			(m6stg_fmuls),
	.mul_sign_out			(mul_sign_out),
	.mul_exp_out			(mul_exp_out[10:0]),
	.mul_frac_out			(mul_frac_out[51:0]),
	.add_exc_out			(add_exc_out[4:0]),
	.a6stg_fcmpop			(a6stg_fcmpop),
	.add_cc_out			(add_cc_out[1:0]),
	.add_fcc_out			(add_fcc_out[1:0]),
	.a6stg_dbl_dst			(a6stg_dbl_dst),
	.a6stg_sng_dst			(a6stg_sng_dst),
	.a6stg_long_dst			(a6stg_long_dst),
	.a6stg_int_dst			(a6stg_int_dst),
	.add_sign_out			(add_sign_out),
	.add_exp_out			(add_exp_out[10:0]),
	.add_frac_out			(add_frac_out[63:0]),
	.arst_l				(arst_l_out_buf3),
	.grst_l				(fpu_grst_l_add_buf3),
	.rclk				(rclk),

	.fp_cpx_req_cq			(fp_cpx_req_cq_unbuf[7:0]),
	.add_dest_rdy			(add_dest_rdy),
	.mul_dest_rdy			(mul_dest_rdy),
	.div_dest_rdy			(div_dest_rdy),
	.fp_cpx_data_ca			(fp_cpx_data_ca_unbuf[144:0]),

	.se               (se_out_buf2),
  .si           (scan_manual_4),
  .so           (scan_manual_5)
);

///////////////////////////////////////////////////////////////////////////////
//
//      FPU test_stub.
//
///////////////////////////////////////////////////////////////////////////////


assign se = 1'b0;
assign sehold = 1'b0;
assign rst_tri_en = 1'b0;






























///////////////////////////////////////////////////////////////////////////////
//
//      FPU cluster_header.
//
///////////////////////////////////////////////////////////////////////////////

//bw_clk_cl_fpu_cmp cluster_header (
//	.gclk (gclk),
//	.cluster_cken (cluster_cken_buf1),
//	.arst_l (arst_l_cluster_header_buf2),
//	.grst_l (grst_l_buf1),
//	.adbginit_l (1'b1),
//	.gdbginit_l (1'b1),
//	.dbginit_l (),
//	.cluster_grst_l (fpu_grst_l),
//	.rclk (rclk),
//	.se (se_cluster_header_buf2),
//	.si (scan_manual_5),
//	.so (scan_manual_6)
//);

assign rclk = gclk;
assign fpu_grst_l = grst_l;


///////////////////////////////////////////////////////////////////////////////
//
//      FPU repeater_groups.
//
///////////////////////////////////////////////////////////////////////////////

// 3/14/03: Added repeater groups
fpu_rptr_groups fpu_rptr_groups (
	.inq_in1 (inq_in1[63:0]),
	.inq_in2 (inq_in2[63:0]),
	.inq_id (inq_id[4:0]),
	.inq_op (inq_op[7:0]),
	.inq_rnd_mode (inq_rnd_mode[1:0]),
	.inq_in1_50_0_neq_0 (inq_in1_50_0_neq_0),
	.inq_in1_53_0_neq_0 (inq_in1_53_0_neq_0),
	.inq_in1_53_32_neq_0 (inq_in1_53_32_neq_0),
	.inq_in1_exp_eq_0 (inq_in1_exp_eq_0),
	.inq_in1_exp_neq_ffs (inq_in1_exp_neq_ffs),
	.inq_in2_50_0_neq_0 (inq_in2_50_0_neq_0),
	.inq_in2_53_0_neq_0 (inq_in2_53_0_neq_0),
	.inq_in2_53_32_neq_0 (inq_in2_53_32_neq_0),
	.inq_in2_exp_eq_0 (inq_in2_exp_eq_0),
	.inq_in2_exp_neq_ffs (inq_in2_exp_neq_ffs),

	.ctu_tst_macrotest (ctu_tst_macrotest),
	.ctu_tst_pre_grst_l (ctu_tst_pre_grst_l),
	.ctu_tst_scan_disable (ctu_tst_scan_disable),
	.ctu_tst_scanmode (ctu_tst_scanmode),
	.ctu_tst_short_chain (ctu_tst_short_chain),
	.global_shift_enable (global_shift_enable),

	.grst_l (grst_l),
	.cluster_cken (cluster_cken),

	.se (se),

	.arst_l (arst_l),

	.fpu_grst_l (fpu_grst_l),

	.fmul_clken_l (fmul_clken_l),
	.fdiv_clken_l (fdiv_clken_l),

	.scan_manual_6 (),
	// .scan_manual_6 (scan_manual_6),

	.si (si),
	.so_unbuf (so_unbuf),

	.pcx_fpio_data_px2 (pcx_fpio_data_px2[123:0]),
	.pcx_fpio_data_rdy_px2 (pcx_fpio_data_rdy_px2),

	.fp_cpx_data_ca (fp_cpx_data_ca_unbuf[144:0]),
	.fp_cpx_req_cq (fp_cpx_req_cq_unbuf[7:0]),

	.inq_sram_din_unbuf ({fp_id_in[4:0],
		fp_rnd_mode_in[1:0],
		fp_fcc_in[1:0],
		fp_op_in[7:0],
		fp_src1_in[68:0],
		fp_src2_in[68:0], 1'b0}),

	.inq_in1_add_buf1 (inq_in1_add_buf1[63:0]),
	.inq_in1_mul_buf1 (inq_in1_mul_buf1[63:0]),
	.inq_in1_div_buf1 (inq_in1_div_buf1[63:0]),
	.inq_in2_add_buf1 (inq_in2_add_buf1[63:0]),
	.inq_in2_mul_buf1 (inq_in2_mul_buf1[63:0]),
	.inq_in2_div_buf1 (inq_in2_div_buf1[63:0]),
	.inq_id_add_buf1 (inq_id_add_buf1[4:0]),
	.inq_id_div_buf1 (inq_id_div_buf1[4:0]),
	.inq_id_mul_buf1 (inq_id_mul_buf1[4:0]),
	.inq_op_add_buf1 (inq_op_add_buf1[7:0]),
	.inq_op_mul_buf1 (inq_op_mul_buf1[7:0]),
	.inq_op_div_buf1 (inq_op_div_buf1[7:0]),
	.inq_rnd_mode_add_buf1 (inq_rnd_mode_add_buf1[1:0]),
	.inq_rnd_mode_mul_buf1 (inq_rnd_mode_mul_buf1[1:0]),
	.inq_rnd_mode_div_buf1 (inq_rnd_mode_div_buf1[1:0]),
	.inq_in1_50_0_neq_0_add_buf1 (inq_in1_50_0_neq_0_add_buf1),
	.inq_in1_50_0_neq_0_mul_buf1 (inq_in1_50_0_neq_0_mul_buf1),
	.inq_in1_50_0_neq_0_div_buf1 (inq_in1_50_0_neq_0_div_buf1),
	.inq_in1_53_0_neq_0_add_buf1 (inq_in1_53_0_neq_0_add_buf1),
	.inq_in1_53_0_neq_0_mul_buf1 (inq_in1_53_0_neq_0_mul_buf1),
	.inq_in1_53_0_neq_0_div_buf1 (inq_in1_53_0_neq_0_div_buf1),
	.inq_in1_53_32_neq_0_add_buf1 (inq_in1_53_32_neq_0_add_buf1),
	.inq_in1_53_32_neq_0_mul_buf1 (inq_in1_53_32_neq_0_mul_buf1),
	.inq_in1_53_32_neq_0_div_buf1 (inq_in1_53_32_neq_0_div_buf1),
	.inq_in1_exp_eq_0_add_buf1 (inq_in1_exp_eq_0_add_buf1),
	.inq_in1_exp_eq_0_mul_buf1 (inq_in1_exp_eq_0_mul_buf1),
	.inq_in1_exp_eq_0_div_buf1 (inq_in1_exp_eq_0_div_buf1),
	.inq_in1_exp_neq_ffs_add_buf1 (inq_in1_exp_neq_ffs_add_buf1),
	.inq_in1_exp_neq_ffs_mul_buf1 (inq_in1_exp_neq_ffs_mul_buf1),
	.inq_in1_exp_neq_ffs_div_buf1 (inq_in1_exp_neq_ffs_div_buf1),
	.inq_in2_50_0_neq_0_add_buf1 (inq_in2_50_0_neq_0_add_buf1),
	.inq_in2_50_0_neq_0_mul_buf1 (inq_in2_50_0_neq_0_mul_buf1),
	.inq_in2_50_0_neq_0_div_buf1 (inq_in2_50_0_neq_0_div_buf1),
	.inq_in2_53_0_neq_0_add_buf1 (inq_in2_53_0_neq_0_add_buf1),
	.inq_in2_53_0_neq_0_mul_buf1 (inq_in2_53_0_neq_0_mul_buf1),
	.inq_in2_53_0_neq_0_div_buf1 (inq_in2_53_0_neq_0_div_buf1),
	.inq_in2_53_32_neq_0_add_buf1 (inq_in2_53_32_neq_0_add_buf1),
	.inq_in2_53_32_neq_0_mul_buf1 (inq_in2_53_32_neq_0_mul_buf1),
	.inq_in2_53_32_neq_0_div_buf1 (inq_in2_53_32_neq_0_div_buf1),
	.inq_in2_exp_eq_0_add_buf1 (inq_in2_exp_eq_0_add_buf1),
	.inq_in2_exp_eq_0_mul_buf1 (inq_in2_exp_eq_0_mul_buf1),
	.inq_in2_exp_eq_0_div_buf1 (inq_in2_exp_eq_0_div_buf1),
	.inq_in2_exp_neq_ffs_add_buf1 (inq_in2_exp_neq_ffs_add_buf1),
	.inq_in2_exp_neq_ffs_mul_buf1 (inq_in2_exp_neq_ffs_mul_buf1),
	.inq_in2_exp_neq_ffs_div_buf1 (inq_in2_exp_neq_ffs_div_buf1),

	.ctu_tst_macrotest_buf1 (ctu_tst_macrotest_buf1),
	.ctu_tst_pre_grst_l_buf1 (ctu_tst_pre_grst_l_buf1),
	.ctu_tst_scan_disable_buf1 (ctu_tst_scan_disable_buf1),
	.ctu_tst_scanmode_buf1 (ctu_tst_scanmode_buf1),
	.ctu_tst_short_chain_buf1 (ctu_tst_short_chain_buf1),
	.global_shift_enable_buf1 (global_shift_enable_buf1),

	.grst_l_buf1 (grst_l_buf1),
	.cluster_cken_buf1 (cluster_cken_buf1),

	.se_add_exp_buf2 (se_add_exp_buf2),
	.se_add_frac_buf2 (se_add_frac_buf2),
	.se_out_buf2 (se_out_buf2),
	.se_mul64_buf2 (se_mul64_buf2),
	.se_cluster_header_buf2 (se_cluster_header_buf2),
	.se_in_buf3 (se_in_buf3),
	.se_mul_buf4 (se_mul_buf4),
	.se_div_buf5 (se_div_buf5),

	.arst_l_div_buf2 (arst_l_div_buf2),
	.arst_l_mul_buf2 (arst_l_mul_buf2),
	.arst_l_cluster_header_buf2 (arst_l_cluster_header_buf2),
	.arst_l_in_buf3 (arst_l_in_buf3),
	.arst_l_out_buf3 (arst_l_out_buf3),
	.arst_l_add_buf4 (arst_l_add_buf4),

	.fpu_grst_l_mul_buf1 (fpu_grst_l_mul_buf1),
	.fpu_grst_l_in_buf2 (fpu_grst_l_in_buf2),
	.fpu_grst_l_add_buf3 (fpu_grst_l_add_buf3),

	.fmul_clken_l_buf1 (fmul_clken_l_buf1),
	.fdiv_clken_l_div_exp_buf1 (fdiv_clken_l_div_exp_buf1),
	.fdiv_clken_l_div_frac_buf1 (fdiv_clken_l_div_frac_buf1),

	.scan_manual_6_buf1 (scan_manual_6_buf1),

	.si_buf1 (si_buf1),
	.so (so),

	.pcx_fpio_data_px2_buf1 (pcx_fpio_data_px2_buf1[123:0]),
	.pcx_fpio_data_rdy_px2_buf1 (pcx_fpio_data_rdy_px2_buf1),

	.fp_cpx_data_ca_buf1 (fp_cpx_data_ca[144:0]),
	.fp_cpx_req_cq_buf1 (fp_cpx_req_cq[7:0]),

	.inq_sram_din_buf1 (inq_sram_din_buf1[155:0])

);


endmodule

// Local Variables:
// verilog-library-directories:("." "../../../srams/rtl")
// End:

// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_add.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//	FPU add pipe.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_add (
	inq_op,
	inq_rnd_mode,
	inq_id,
	inq_fcc,
	inq_in1,
	inq_in1_50_0_neq_0,
	inq_in1_53_32_neq_0,
	inq_in1_exp_eq_0,
	inq_in1_exp_neq_ffs,
	inq_in2,
	inq_in2_50_0_neq_0,
	inq_in2_53_32_neq_0,
	inq_in2_exp_eq_0,
	inq_in2_exp_neq_ffs,
	inq_add,
	add_dest_rdy,
	fadd_clken_l,
	arst_l,
	grst_l,
	rclk,

	add_pipe_active,	
	a1stg_step,
	a6stg_fadd_in,
	add_id_out_in,
	a6stg_fcmpop,
	add_exc_out,
	a6stg_dbl_dst,
	a6stg_sng_dst,
	a6stg_long_dst,
	a6stg_int_dst,
	add_sign_out,
	add_exp_out,
	add_frac_out,
	add_cc_out,
	add_fcc_out,

	se_add_exp,
	se_add_frac,
	si,
	so
);


input [7:0]	inq_op;			// request opcode to op pipes
input [1:0]	inq_rnd_mode;		// request rounding mode to op pipes
input [4:0]	inq_id;			// request ID to the operation pipes
input [1:0]	inq_fcc;		// request cc ID to op pipes
input [63:0]	inq_in1;		// request operand 1 to op pipes
input		inq_in1_50_0_neq_0;	// request operand 1[50:0]!=0
input		inq_in1_53_32_neq_0;	// request operand 1[53:32]!=0
input		inq_in1_exp_eq_0;	// request operand 1 exp==0
input		inq_in1_exp_neq_ffs;	// request operand 1 exp!=0xff's
input [63:0]	inq_in2;		// request operand 2 to op pipes
input		inq_in2_50_0_neq_0;	// request operand 2[50:0]!=0
input		inq_in2_53_32_neq_0;	// request operand 2[53:32]!=0
input		inq_in2_exp_eq_0;	// request operand 2 exp==0
input		inq_in2_exp_neq_ffs;	// request operand 2 exp!=0xff's
input		inq_add;		// add pipe request
input		add_dest_rdy;		// add result req accepted for CPX
input		fadd_clken_l;           // fadd clock enable
input		arst_l;			// global async. reset- asserted low
input		grst_l;			// global sync. reset- asserted low
input		rclk;			// global clock

output		add_pipe_active;        // add pipe is executing a valid instr
output		a1stg_step;		// add pipe load
output		a6stg_fadd_in;		// add pipe output request next cycle
output [9:0]    add_id_out_in;		// add pipe output ID next cycle
output		a6stg_fcmpop;		// compare- add 6 stage
output [4:0]	add_exc_out;		// add pipe result- exception flags
output		a6stg_dbl_dst;		// float double result- add 6 stage
output		a6stg_sng_dst;		// float single result- add 6 stage
output		a6stg_long_dst;		// 64bit integer result- add 6 stage
output		a6stg_int_dst;		// 32bit integer result- add 6 stage
output		add_sign_out;		// add sign output
output [10:0]	add_exp_out;		// add exponent output
output [63:0]	add_frac_out;		// add fraction output
output [1:0]	add_cc_out;		// add pipe result- condition
output [1:0]	add_fcc_out;		// add pipe input fcc passed through

input           se_add_exp;     // scan_enable for add_exp_dp, add_ctl
input           se_add_frac;    // scan_enable for add_frac_dp
input           si;                     // scan in
output          so;                     // scan out


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_add_ctl.
//
///////////////////////////////////////////////////////////////////////////////

wire		a1stg_denorm_sng_in1;	// select line to normalized fraction 1
wire		a1stg_denorm_dbl_in1;	// select line to normalized fraction 1
wire		a1stg_denorm_sng_in2;	// select line to normalized fraction 2
wire		a1stg_denorm_dbl_in2;	// select line to normalized fraction 2
wire		a1stg_norm_sng_in1;	// select line to normalized fraction 1
wire		a1stg_norm_dbl_in1;	// select line to normalized fraction 1
wire		a1stg_norm_sng_in2;	// select line to normalized fraction 2
wire		a1stg_norm_dbl_in2;	// select line to normalized fraction 2
wire		a1stg_step;		// add pipe load
wire		a1stg_stepa;		// add pipe load- copy
wire		a1stg_sngop;		// single precision operation- add 1 stg
wire		a1stg_intlngop;		// integer/long input- add 1 stage
wire		a1stg_fsdtoix;		// float to integer convert- add 1 stg
wire		a1stg_fstod;		// fstod- add 1 stage
wire		a1stg_fstoi;		// fstoi- add 1 stage
wire		a1stg_fstox;		// fstox- add 1 stage
wire		a1stg_fdtoi;		// fdtoi- add 1 stage
wire		a1stg_fdtox;		// fdtox- add 1 stage
wire		a1stg_faddsubs;		// add/subtract single- add 1 stg
wire		a1stg_faddsubd;		// add/subtract double- add 1 stg
wire		a1stg_fdtos;		// fdtos- add 1 stage
wire		a2stg_faddsubop;	// float add or subtract- add 2 stage
wire		a2stg_fsdtoix_fdtos;	// float to integer convert- add 2 stg
wire		a2stg_fitos;		// fitos- add 2 stage
wire		a2stg_fitod;		// fitod- add 2 stage
wire		a2stg_fxtos;		// fxtos- add 2 stage
wire		a2stg_fxtod;		// fxtod- add 2 stage
wire		a3stg_faddsubop;	// denorm compare lead0[10] input select
wire [1:0]	a3stg_faddsubopa;	// denorm compare lead0[10] input select
wire		a4stg_dblop;		// double precision operation- add 4 stg
wire		a6stg_fadd_in;		// add pipe output request next cycle
wire [9:0]	add_id_out_in;		// add pipe output ID next cycle
wire [1:0]	add_fcc_out;		// add pipe input fcc passed through
wire		a6stg_dbl_dst;		// float double result- add 6 stage
wire		a6stg_sng_dst;		// float single result- add 6 stage
wire		a6stg_long_dst;		// 64bit integer result- add 6 stage
wire		a6stg_int_dst;		// 32bit integer result- add 6 stage
wire		a6stg_fcmpop;		// compare- add 6 stage
wire		a6stg_step;		// advance the add pipe
wire		a3stg_sub_in;		// subtract in main adder- add 3 stage
wire		add_sign_out;		// add sign output
wire [1:0]	add_cc_out;		// add pipe result- condition
wire		a4stg_in_of;		// add overflow- select exp out
wire [4:0]	add_exc_out;		// add pipe result- exception flags
wire		a2stg_frac1_in_frac1;	// select line to a2stg_frac1
wire		a2stg_frac1_in_frac2;	// select line to a2stg_frac1
wire		a1stg_2nan_in_inv;	// 2 NaN inputs- a1 stage
wire		a1stg_faddsubop_inv;	// add/subtract- a1 stage
wire		a2stg_frac1_in_qnan;	// make fraction 1 a QNaN
wire		a2stg_frac1_in_nv;	// NV- make a new QNaN
wire		a2stg_frac1_in_nv_dbl;	// NV- make a new double prec QNaN
wire		a2stg_frac2_in_frac1;	// select line to a2stg_frac2
wire		a2stg_frac2_in_qnan;	// make fraction 2 a QNaN
wire [5:0]	a2stg_shr_cnt_in;	// right shift count input- add 1 stage
wire 		a2stg_shr_cnt_5_inv_in; // right shift count input[5]- add 1 stg
wire		a2stg_shr_frac2_shr_int; // select line to a3stg_frac2
wire		a2stg_shr_frac2_shr_dbl; // select line to a3stg_frac2
wire		a2stg_shr_frac2_shr_sng; // select line to a3stg_frac2
wire		a2stg_shr_frac2_max;	// select line to a3stg_frac2
wire		a2stg_sub_step;		// select line to a3stg_frac2
wire		a2stg_fracadd_frac2_inv_in; // sel line to main adder input 2
wire		a2stg_fracadd_frac2_inv_shr1_in; // sel line to main adder in 2
wire		a2stg_fracadd_frac2;	// select line to main adder input 2
wire		a2stg_fracadd_cin_in;	// carry in to main adder- add 1 stage
wire		a3stg_exp_7ff;		// select line to a3stg_exp
wire		a3stg_exp_ff;		// select line to a3stg_exp
wire		a3stg_exp_add;		// select line to a3stg_exp
wire		a2stg_expdec_neq_0;	// exponent will be < 54
wire		a3stg_exp10_0_eq0;	// exponent[10:0]==0- add 3 stage
wire		a3stg_exp10_1_eq0;	// exponent[10:1]==0- add 3 stage
wire		a3stg_fdtos_inv;	// double to single convert- add 3 stg
wire		a4stg_fixtos_fxtod_inv;	// int to single/double cvt- add 4 stg
wire		a4stg_rnd_frac_add_inv;	// select line to a4stg_rnd_frac
wire [9:0]	a4stg_shl_cnt_in;	// postnorm shift left count- add 3 stg
wire		a4stg_rnd_sng;		// round to single precision- add 4 stg
wire		a4stg_rnd_dbl;		// round to double precision- add 4 stg
wire		add_frac_out_rndadd;	// select line to add_frac_out
wire		add_frac_out_rnd_frac;	// select line to add_frac_out
wire		add_frac_out_shl;	// select line to add_frac_out
wire		a4stg_to_0;		// result to max finite on overflow
wire		add_exp_out_expinc;	// select line to add_exp_out
wire		add_exp_out_exp;	// select line to add_exp_out
wire		add_exp_out_exp1;	// select line to add_exp_out
wire		add_exp_out_expadd;	// select line to add_exp_out
wire		a4stg_to_0_inv;		// result to infinity on overflow
wire            add_pipe_active;        // add pipe is executing a valid instr


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_add_exp_dp.
//
///////////////////////////////////////////////////////////////////////////////

wire        	a1stg_expadd3_11;	// exponent adder 3 output- add 1 stage
wire [11:0]	a1stg_expadd1_11_0;	// exponent adder 1 output- add 1 stage
wire [10:0]	a1stg_expadd4_inv;	// exponent adder 4 output- add 1 stage
wire [5:0]	a1stg_expadd2_5_0;	// exponent adder 2 output- add 1 stage
wire [11:0]	a2stg_exp;		// exponent- add 2 stage
wire [12:0]	a2stg_expadd;		// exponent adder- add 2 stage
wire [10:0]	a3stg_exp_10_0;		// exponent adder- add 3 stage
wire [11:0]	a4stg_exp_11_0;		// exponent adder- add 4 stage
wire [10:0]	add_exp_out;		// add exponent output


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_add_frac_dp.
//
///////////////////////////////////////////////////////////////////////////////

wire		a1stg_in2_neq_in1_frac;	// operand 2 fraction != oprnd 1 frac
wire		a1stg_in2_gt_in1_frac;	// operand 2 fraction > oprnd 1 frac
wire		a1stg_in2_eq_in1_exp;	// operand 2 exponent == oprnd 1 exp
wire		a2stg_frac2_63;		// fraction 2 bit[63]- add 2 stage
wire		a2stg_frac2hi_neq_0;	// fraction 2[62:32]in add 2 stage != 0
wire		a2stg_frac2lo_neq_0;	// fraction 2[31:11] in add 2 stage != 0
wire		a3stg_fsdtoix_nx;	// inexact result for flt -> ints
wire		a3stg_fsdtoi_nx;	// inexact result for flt -> 32b ints
wire		a3stg_denorm;		// denorm output- add 3 stage
wire		a3stg_denorm_inv;	// result is not a denorm- add 3 stage
wire [5:0]	a3stg_lead0;		// leading 0's count- add 3 stage
wire		a4stg_round;		// round the result- add 4 stage
wire [5:0]	a4stg_shl_cnt;		// subtract in main adder- add 4 stage
wire		a4stg_denorm_inv;	// 0 the exponent
wire		a3stg_inc_exp_inv;	// increment the exponent- add 3 stg
wire		a3stg_same_exp_inv;	// keep the exponent- add 3 stg
wire		a3stg_dec_exp_inv;	// decrement the exponent- add 3 stg
wire		a4stg_rnd_frac_40;	// rounded fraction[40]- add 4 stage
wire		a4stg_rnd_frac_39;	// rounded fraction[39]- add 4 stage
wire		a4stg_rnd_frac_11;	// rounded fraction[11]- add 4 stage
wire		a4stg_rnd_frac_10;	// rounded fraction[10]- add 4 stage
wire		a4stg_rndadd_cout;	// fraction rounding adder carry out
wire		a4stg_frac_9_0_nx;	// inexact double precision result
wire		a4stg_frac_dbl_nx;	// inexact double precision result
wire		a4stg_frac_38_0_nx;	// inexact single precision result
wire		a4stg_frac_sng_nx;	// inexact single precision result
wire		a4stg_frac_neq_0;	// fraction != 0- add 4 stage
wire		a4stg_shl_data_neq_0;	// left shift result != 0- add 4 stage
wire		add_of_out_cout;	// fraction rounding adder carry out
wire [63:0]	add_frac_out;		// add fraction output

// Previously missing wires
wire        scan_out_fpu_add_ctl;
wire        scan_out_fpu_add_exp_dp;

///////////////////////////////////////////////////////////////////////////////
//
//      Instantiations.
//
///////////////////////////////////////////////////////////////////////////////

fpu_add_ctl fpu_add_ctl (
	.inq_in1_51			(inq_in1[51]),
	.inq_in1_54			(inq_in1[54]),
	.inq_in1_63			(inq_in1[63]),
	.inq_in1_50_0_neq_0		(inq_in1_50_0_neq_0),
	.inq_in1_53_32_neq_0		(inq_in1_53_32_neq_0),
	.inq_in1_exp_eq_0		(inq_in1_exp_eq_0),
	.inq_in1_exp_neq_ffs		(inq_in1_exp_neq_ffs),
	.inq_in2_51			(inq_in2[51]),
	.inq_in2_54			(inq_in2[54]),
	.inq_in2_63			(inq_in2[63]),
	.inq_in2_50_0_neq_0		(inq_in2_50_0_neq_0),
	.inq_in2_53_32_neq_0		(inq_in2_53_32_neq_0),
	.inq_in2_exp_eq_0		(inq_in2_exp_eq_0),
	.inq_in2_exp_neq_ffs		(inq_in2_exp_neq_ffs),
	.inq_op				(inq_op[7:0]),
	.inq_rnd_mode			(inq_rnd_mode[1:0]),
	.inq_id				(inq_id[4:0]),
	.inq_fcc			(inq_fcc[1:0]),
	.inq_add			(inq_add),
	.add_dest_rdy			(add_dest_rdy),
	.a1stg_in2_neq_in1_frac		(a1stg_in2_neq_in1_frac),
	.a1stg_in2_gt_in1_frac		(a1stg_in2_gt_in1_frac),
	.a1stg_in2_eq_in1_exp		(a1stg_in2_eq_in1_exp),
	.a1stg_expadd1			(a1stg_expadd1_11_0[11:0]),
	.a2stg_expadd			(a2stg_expadd[11:0]),
	.a2stg_frac2hi_neq_0		(a2stg_frac2hi_neq_0),
	.a2stg_frac2lo_neq_0		(a2stg_frac2lo_neq_0),
	.a2stg_exp			(a2stg_exp[11:0]),
	.a3stg_fsdtoix_nx		(a3stg_fsdtoix_nx),
	.a3stg_fsdtoi_nx		(a3stg_fsdtoi_nx),
	.a2stg_frac2_63			(a2stg_frac2_63),
	.a4stg_exp			(a4stg_exp_11_0[11:0]),
	.add_of_out_cout		(add_of_out_cout),
	.a4stg_frac_neq_0		(a4stg_frac_neq_0),
	.a4stg_shl_data_neq_0		(a4stg_shl_data_neq_0),
	.a4stg_frac_dbl_nx		(a4stg_frac_dbl_nx),
	.a4stg_frac_sng_nx		(a4stg_frac_sng_nx),
	.a1stg_expadd2			(a1stg_expadd2_5_0[5:0]),
	.a1stg_expadd4_inv		(a1stg_expadd4_inv[10:0]),
	.a3stg_denorm			(a3stg_denorm),
	.a3stg_denorm_inv		(a3stg_denorm_inv),
	.a4stg_denorm_inv		(a4stg_denorm_inv),
	.a3stg_exp			(a3stg_exp_10_0[10:0]),
	.a4stg_round			(a4stg_round),
	.a3stg_lead0			(a3stg_lead0[5:0]),
	.a4stg_rnd_frac_40		(a4stg_rnd_frac_40),
	.a4stg_rnd_frac_39		(a4stg_rnd_frac_39),
	.a4stg_rnd_frac_11		(a4stg_rnd_frac_11),
	.a4stg_rnd_frac_10		(a4stg_rnd_frac_10),
	.a4stg_frac_38_0_nx		(a4stg_frac_38_0_nx),
	.a4stg_frac_9_0_nx		(a4stg_frac_9_0_nx),
	.arst_l				(arst_l),
	.grst_l				(grst_l),
	.rclk			(rclk),

	.add_pipe_active                (add_pipe_active),
	.a1stg_denorm_sng_in1		(a1stg_denorm_sng_in1),
	.a1stg_denorm_dbl_in1		(a1stg_denorm_dbl_in1),
	.a1stg_denorm_sng_in2		(a1stg_denorm_sng_in2),
	.a1stg_denorm_dbl_in2		(a1stg_denorm_dbl_in2),
	.a1stg_norm_sng_in1		(a1stg_norm_sng_in1),
	.a1stg_norm_dbl_in1		(a1stg_norm_dbl_in1),
	.a1stg_norm_sng_in2		(a1stg_norm_sng_in2),
	.a1stg_norm_dbl_in2		(a1stg_norm_dbl_in2),
	.a1stg_step			(a1stg_step),
	.a1stg_stepa			(a1stg_stepa),
	.a1stg_sngop			(a1stg_sngop),
	.a1stg_intlngop			(a1stg_intlngop),
	.a1stg_fsdtoix			(a1stg_fsdtoix),
	.a1stg_fstod			(a1stg_fstod),
	.a1stg_fstoi			(a1stg_fstoi),
	.a1stg_fstox			(a1stg_fstox),
	.a1stg_fdtoi			(a1stg_fdtoi),
	.a1stg_fdtox			(a1stg_fdtox),
	.a1stg_faddsubs			(a1stg_faddsubs),
	.a1stg_faddsubd			(a1stg_faddsubd),
	.a1stg_fdtos			(a1stg_fdtos),
	.a2stg_faddsubop		(a2stg_faddsubop),
	.a2stg_fsdtoix_fdtos		(a2stg_fsdtoix_fdtos),
	.a2stg_fitos			(a2stg_fitos),
	.a2stg_fitod			(a2stg_fitod),
	.a2stg_fxtos			(a2stg_fxtos),
	.a2stg_fxtod			(a2stg_fxtod),
	.a3stg_faddsubop		(a3stg_faddsubop),
	.a3stg_faddsubopa		(a3stg_faddsubopa[1:0]),
	.a4stg_dblop			(a4stg_dblop),
	.a6stg_fadd_in			(a6stg_fadd_in),
	.add_id_out_in			(add_id_out_in[9:0]),
	.add_fcc_out			(add_fcc_out[1:0]),
	.a6stg_dbl_dst			(a6stg_dbl_dst),
	.a6stg_sng_dst			(a6stg_sng_dst),
	.a6stg_long_dst			(a6stg_long_dst),
	.a6stg_int_dst			(a6stg_int_dst),
	.a6stg_fcmpop			(a6stg_fcmpop),
	.a6stg_step			(a6stg_step),
	.a3stg_sub_in			(a3stg_sub_in),
	.add_sign_out			(add_sign_out),
	.add_cc_out			(add_cc_out[1:0]),
	.a4stg_in_of			(a4stg_in_of),
	.add_exc_out			(add_exc_out[4:0]),
	.a2stg_frac1_in_frac1		(a2stg_frac1_in_frac1),
	.a2stg_frac1_in_frac2		(a2stg_frac1_in_frac2),
	.a1stg_2nan_in_inv		(a1stg_2nan_in_inv),
	.a1stg_faddsubop_inv		(a1stg_faddsubop_inv),
	.a2stg_frac1_in_qnan		(a2stg_frac1_in_qnan),
	.a2stg_frac1_in_nv		(a2stg_frac1_in_nv),
	.a2stg_frac1_in_nv_dbl		(a2stg_frac1_in_nv_dbl),
	.a2stg_frac2_in_frac1		(a2stg_frac2_in_frac1),
	.a2stg_frac2_in_qnan		(a2stg_frac2_in_qnan),
	.a2stg_shr_cnt_in		(a2stg_shr_cnt_in[5:0]),
	.a2stg_shr_cnt_5_inv_in   (a2stg_shr_cnt_5_inv_in),
	.a2stg_shr_frac2_shr_int	(a2stg_shr_frac2_shr_int),
	.a2stg_shr_frac2_shr_dbl	(a2stg_shr_frac2_shr_dbl),
	.a2stg_shr_frac2_shr_sng	(a2stg_shr_frac2_shr_sng),
	.a2stg_shr_frac2_max		(a2stg_shr_frac2_max),
	.a2stg_sub_step			(a2stg_sub_step),
	.a2stg_fracadd_frac2_inv_in	(a2stg_fracadd_frac2_inv_in),
	.a2stg_fracadd_frac2_inv_shr1_in (a2stg_fracadd_frac2_inv_shr1_in),
	.a2stg_fracadd_frac2		(a2stg_fracadd_frac2),
	.a2stg_fracadd_cin_in		(a2stg_fracadd_cin_in),
	.a3stg_exp_7ff			(a3stg_exp_7ff),
	.a3stg_exp_ff			(a3stg_exp_ff),
	.a3stg_exp_add			(a3stg_exp_add),
	.a2stg_expdec_neq_0		(a2stg_expdec_neq_0),
	.a3stg_exp10_0_eq0		(a3stg_exp10_0_eq0),
	.a3stg_exp10_1_eq0		(a3stg_exp10_1_eq0),
	.a3stg_fdtos_inv		(a3stg_fdtos_inv),
	.a4stg_fixtos_fxtod_inv		(a4stg_fixtos_fxtod_inv),
	.a4stg_rnd_frac_add_inv		(a4stg_rnd_frac_add_inv),
	.a4stg_shl_cnt_in		(a4stg_shl_cnt_in[9:0]),
	.a4stg_rnd_sng			(a4stg_rnd_sng),
	.a4stg_rnd_dbl			(a4stg_rnd_dbl),
	.add_frac_out_rndadd		(add_frac_out_rndadd),
	.add_frac_out_rnd_frac		(add_frac_out_rnd_frac),
	.add_frac_out_shl		(add_frac_out_shl),
	.a4stg_to_0			(a4stg_to_0),
	.add_exp_out_expinc		(add_exp_out_expinc),
	.add_exp_out_exp		(add_exp_out_exp),
	.add_exp_out_exp1		(add_exp_out_exp1),
	.add_exp_out_expadd		(add_exp_out_expadd),
	.a4stg_to_0_inv			(a4stg_to_0_inv),

	.se				(se_add_exp),
	.si				(si),
	.so				(scan_out_fpu_add_ctl)
);


fpu_add_exp_dp fpu_add_exp_dp (
	.inq_in1			(inq_in1[62:52]),
	.inq_in2			(inq_in2[62:52]),
	.inq_op				(inq_op[1:0]),
	.inq_op_7			(inq_op[7]),
	.a1stg_step			(a1stg_stepa),
	.a1stg_faddsubd			(a1stg_faddsubd),
	.a1stg_faddsubs			(a1stg_faddsubs),
	.a1stg_fsdtoix			(a1stg_fsdtoix),
	.a6stg_step			(a6stg_step),
	.a1stg_fstod			(a1stg_fstod),
	.a1stg_fdtos			(a1stg_fdtos),
	.a1stg_fstoi			(a1stg_fstoi),
	.a1stg_fstox			(a1stg_fstox),
	.a1stg_fdtoi			(a1stg_fdtoi),
	.a1stg_fdtox			(a1stg_fdtox),
	.a2stg_fsdtoix_fdtos		(a2stg_fsdtoix_fdtos),
	.a2stg_faddsubop		(a2stg_faddsubop),
	.a2stg_fitos			(a2stg_fitos),
	.a2stg_fitod			(a2stg_fitod),
	.a2stg_fxtos			(a2stg_fxtos),
	.a2stg_fxtod			(a2stg_fxtod),
	.a3stg_exp_7ff			(a3stg_exp_7ff),
	.a3stg_exp_ff			(a3stg_exp_ff),
	.a3stg_exp_add			(a3stg_exp_add),
	.a3stg_inc_exp_inv		(a3stg_inc_exp_inv),
	.a3stg_same_exp_inv		(a3stg_same_exp_inv),
	.a3stg_dec_exp_inv		(a3stg_dec_exp_inv),
	.a3stg_faddsubop		(a3stg_faddsubop),
	.a3stg_fdtos_inv		(a3stg_fdtos_inv),
	.a4stg_fixtos_fxtod_inv		(a4stg_fixtos_fxtod_inv),
	.a4stg_shl_cnt			(a4stg_shl_cnt[5:0]),
	.a4stg_denorm_inv		(a4stg_denorm_inv),
	.a4stg_rndadd_cout		(a4stg_rndadd_cout),
	.add_exp_out_expinc		(add_exp_out_expinc),
	.add_exp_out_exp		(add_exp_out_exp),
	.add_exp_out_exp1		(add_exp_out_exp1),
	.a4stg_in_of			(a4stg_in_of),
	.add_exp_out_expadd		(add_exp_out_expadd),
	.a4stg_dblop			(a4stg_dblop),
	.a4stg_to_0_inv			(a4stg_to_0_inv),
	.fadd_clken_l			(fadd_clken_l),
	.rclk			(rclk),

	.a1stg_expadd3_11		(a1stg_expadd3_11),
	.a1stg_expadd1_11_0		(a1stg_expadd1_11_0[11:0]),
	.a1stg_expadd4_inv		(a1stg_expadd4_inv[10:0]),
	.a1stg_expadd2_5_0		(a1stg_expadd2_5_0[5:0]),
	.a2stg_exp			(a2stg_exp[11:0]),
	.a2stg_expadd			(a2stg_expadd[12:0]),
	.a3stg_exp_10_0			(a3stg_exp_10_0[10:0]),
	.a4stg_exp_11_0			(a4stg_exp_11_0[11:0]),
	.add_exp_out			(add_exp_out[10:0]),

	.se                             (se_add_exp),
        .si                             (scan_out_fpu_add_ctl),
        .so                             (scan_out_fpu_add_exp_dp)
);


fpu_add_frac_dp fpu_add_frac_dp (
	.inq_in1			(inq_in1[62:0]),
	.inq_in2			(inq_in2[63:0]),
	.a1stg_step			(a1stg_stepa),
	.a1stg_sngop			(a1stg_sngop),
	.a1stg_expadd3_11		(a1stg_expadd3_11),
	.a1stg_norm_dbl_in1		(a1stg_norm_dbl_in1),
	.a1stg_denorm_dbl_in1		(a1stg_denorm_dbl_in1),
	.a1stg_norm_sng_in1		(a1stg_norm_sng_in1),
	.a1stg_denorm_sng_in1		(a1stg_denorm_sng_in1),
	.a1stg_norm_dbl_in2		(a1stg_norm_dbl_in2),
	.a1stg_denorm_dbl_in2		(a1stg_denorm_dbl_in2),
	.a1stg_norm_sng_in2		(a1stg_norm_sng_in2),
	.a1stg_denorm_sng_in2		(a1stg_denorm_sng_in2),
	.a1stg_intlngop			(a1stg_intlngop),
	.a2stg_frac1_in_frac1		(a2stg_frac1_in_frac1),
	.a2stg_frac1_in_frac2		(a2stg_frac1_in_frac2),
	.a1stg_2nan_in_inv		(a1stg_2nan_in_inv),
	.a1stg_faddsubop_inv		(a1stg_faddsubop_inv),
	.a2stg_frac1_in_qnan		(a2stg_frac1_in_qnan),
	.a2stg_frac1_in_nv		(a2stg_frac1_in_nv),
	.a2stg_frac1_in_nv_dbl		(a2stg_frac1_in_nv_dbl),
	.a6stg_step			(a6stg_step),
	.a2stg_frac2_in_frac1		(a2stg_frac2_in_frac1),
	.a2stg_frac2_in_qnan		(a2stg_frac2_in_qnan),
	.a2stg_shr_cnt_in		(a2stg_shr_cnt_in[5:0]),
	.a2stg_shr_cnt_5_inv_in (a2stg_shr_cnt_5_inv_in),
	.a2stg_shr_frac2_shr_int	(a2stg_shr_frac2_shr_int),
	.a2stg_shr_frac2_shr_dbl	(a2stg_shr_frac2_shr_dbl),
	.a2stg_shr_frac2_shr_sng	(a2stg_shr_frac2_shr_sng),
	.a2stg_shr_frac2_max		(a2stg_shr_frac2_max),
	.a2stg_expadd_11		(a2stg_expadd[12]),
	.a2stg_sub_step			(a2stg_sub_step),
	.a2stg_fracadd_frac2_inv_in	(a2stg_fracadd_frac2_inv_in),
	.a2stg_fracadd_frac2_inv_shr1_in (a2stg_fracadd_frac2_inv_shr1_in),
	.a2stg_fracadd_frac2		(a2stg_fracadd_frac2),
	.a2stg_fracadd_cin_in		(a2stg_fracadd_cin_in),
	.a2stg_exp			(a2stg_exp[5:0]),
	.a2stg_expdec_neq_0		(a2stg_expdec_neq_0),
	.a3stg_faddsubopa		(a3stg_faddsubopa[1:0]),
	.a3stg_sub_in			(a3stg_sub_in),
	.a3stg_exp10_0_eq0		(a3stg_exp10_0_eq0),
	.a3stg_exp10_1_eq0		(a3stg_exp10_1_eq0),
	.a3stg_exp_0			(a3stg_exp_10_0[0]),
	.a4stg_rnd_frac_add_inv		(a4stg_rnd_frac_add_inv),
	.a3stg_fdtos_inv		(a3stg_fdtos_inv),
	.a4stg_fixtos_fxtod_inv		(a4stg_fixtos_fxtod_inv),
	.a4stg_rnd_sng			(a4stg_rnd_sng),
	.a4stg_rnd_dbl			(a4stg_rnd_dbl),
	.a4stg_shl_cnt_in		(a4stg_shl_cnt_in[9:0]),
	.add_frac_out_rndadd		(add_frac_out_rndadd),
	.add_frac_out_rnd_frac		(add_frac_out_rnd_frac),
	.a4stg_in_of			(a4stg_in_of),
	.add_frac_out_shl		(add_frac_out_shl),
	.a4stg_to_0			(a4stg_to_0),
	.fadd_clken_l			(fadd_clken_l),
	.rclk			(rclk),

	.a1stg_in2_neq_in1_frac		(a1stg_in2_neq_in1_frac),
	.a1stg_in2_gt_in1_frac		(a1stg_in2_gt_in1_frac),
	.a1stg_in2_eq_in1_exp		(a1stg_in2_eq_in1_exp),
	.a2stg_frac2_63			(a2stg_frac2_63),
	.a2stg_frac2hi_neq_0		(a2stg_frac2hi_neq_0),
	.a2stg_frac2lo_neq_0		(a2stg_frac2lo_neq_0),
	.a3stg_fsdtoix_nx		(a3stg_fsdtoix_nx),
	.a3stg_fsdtoi_nx		(a3stg_fsdtoi_nx),
	.a3stg_denorm			(a3stg_denorm),
	.a3stg_denorm_inv		(a3stg_denorm_inv),
	.a3stg_lead0			(a3stg_lead0[5:0]),
	.a4stg_round			(a4stg_round),
	.a4stg_shl_cnt			(a4stg_shl_cnt[5:0]),
	.a4stg_denorm_inv		(a4stg_denorm_inv),
	.a3stg_inc_exp_inv		(a3stg_inc_exp_inv),
	.a3stg_same_exp_inv		(a3stg_same_exp_inv),
	.a3stg_dec_exp_inv		(a3stg_dec_exp_inv),
	.a4stg_rnd_frac_40		(a4stg_rnd_frac_40),
	.a4stg_rnd_frac_39		(a4stg_rnd_frac_39),
	.a4stg_rnd_frac_11		(a4stg_rnd_frac_11),
	.a4stg_rnd_frac_10		(a4stg_rnd_frac_10),
	.a4stg_rndadd_cout		(a4stg_rndadd_cout),
	.a4stg_frac_9_0_nx		(a4stg_frac_9_0_nx),
	.a4stg_frac_dbl_nx		(a4stg_frac_dbl_nx),
	.a4stg_frac_38_0_nx		(a4stg_frac_38_0_nx),
	.a4stg_frac_sng_nx		(a4stg_frac_sng_nx),
	.a4stg_frac_neq_0		(a4stg_frac_neq_0),
	.a4stg_shl_data_neq_0		(a4stg_shl_data_neq_0),
	.add_of_out_cout		(add_of_out_cout),
	.add_frac_out			(add_frac_out[63:0]),

	.se                             (se_add_frac),
        .si                             (scan_out_fpu_add_exp_dp),
        .so                             (so)
);


endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_add_ctl.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//	Add pipeline synthesizable logic
//		- special input cases
//		- opcode pipeline
//		- sign logic
//		- exception logic
//		- datapath control- select lines and control logic
//
///////////////////////////////////////////////////////////////////////////////

module fpu_add_ctl (
	inq_in1_51,
	inq_in1_54,
	inq_in1_63,
	inq_in1_50_0_neq_0,
	inq_in1_53_32_neq_0,
	inq_in1_exp_eq_0,
	inq_in1_exp_neq_ffs,
	inq_in2_51,
	inq_in2_54,
	inq_in2_63,
	inq_in2_50_0_neq_0,
	inq_in2_53_32_neq_0,
	inq_in2_exp_eq_0,
	inq_in2_exp_neq_ffs,
	inq_op,
	inq_rnd_mode,
	inq_id,
	inq_fcc,
	inq_add,
	add_dest_rdy,
	a1stg_in2_neq_in1_frac,
	a1stg_in2_gt_in1_frac,
	a1stg_in2_eq_in1_exp,
	a1stg_expadd1,
	a2stg_expadd,
	a2stg_frac2hi_neq_0,
	a2stg_frac2lo_neq_0,
	a2stg_exp,
	a3stg_fsdtoix_nx,
	a3stg_fsdtoi_nx,
	a2stg_frac2_63,
	a4stg_exp,
	add_of_out_cout,
	a4stg_frac_neq_0,
	a4stg_shl_data_neq_0,
	a4stg_frac_dbl_nx,
	a4stg_frac_sng_nx,
	a1stg_expadd2,
	a1stg_expadd4_inv,
	a3stg_denorm,
	a3stg_denorm_inv,
	a4stg_denorm_inv,
	a3stg_exp,
	a4stg_round,
	a3stg_lead0,
	a4stg_rnd_frac_40,
	a4stg_rnd_frac_39,
	a4stg_rnd_frac_11,
	a4stg_rnd_frac_10,
	a4stg_frac_38_0_nx,
	a4stg_frac_9_0_nx,
	arst_l,
	grst_l,
	rclk,
	
	add_pipe_active,
	a1stg_denorm_sng_in1,
	a1stg_denorm_dbl_in1,
	a1stg_denorm_sng_in2,
	a1stg_denorm_dbl_in2,
	a1stg_norm_sng_in1,
	a1stg_norm_dbl_in1,
	a1stg_norm_sng_in2,
	a1stg_norm_dbl_in2,
	a1stg_step,
	a1stg_stepa,
	a1stg_sngop,
	a1stg_intlngop,
	a1stg_fsdtoix,
	a1stg_fstod,
	a1stg_fstoi,
	a1stg_fstox,
	a1stg_fdtoi,
	a1stg_fdtox,
	a1stg_faddsubs,
	a1stg_faddsubd,
	a1stg_fdtos,
	a2stg_faddsubop,
	a2stg_fsdtoix_fdtos,
	a2stg_fitos,
	a2stg_fitod,
	a2stg_fxtos,
	a2stg_fxtod,
	a3stg_faddsubop,
	a3stg_faddsubopa,
	a4stg_dblop,
	a6stg_fadd_in,
	add_id_out_in,
	add_fcc_out,
	a6stg_dbl_dst,
	a6stg_sng_dst,
	a6stg_long_dst,
	a6stg_int_dst,
	a6stg_fcmpop,
	a6stg_step,
	a3stg_sub_in,
	add_sign_out,
	add_cc_out,
	a4stg_in_of,
	add_exc_out,
	a2stg_frac1_in_frac1,
	a2stg_frac1_in_frac2,
	a1stg_2nan_in_inv,
	a1stg_faddsubop_inv,
	a2stg_frac1_in_qnan,
	a2stg_frac1_in_nv,
	a2stg_frac1_in_nv_dbl,
	a2stg_frac2_in_frac1,
	a2stg_frac2_in_qnan,
	a2stg_shr_cnt_in,
	a2stg_shr_cnt_5_inv_in,
	a2stg_shr_frac2_shr_int,
	a2stg_shr_frac2_shr_dbl,
	a2stg_shr_frac2_shr_sng,
	a2stg_shr_frac2_max,
	a2stg_sub_step,
	a2stg_fracadd_frac2_inv_in,
	a2stg_fracadd_frac2_inv_shr1_in,
	a2stg_fracadd_frac2,
	a2stg_fracadd_cin_in,
	a3stg_exp_7ff,
	a3stg_exp_ff,
	a3stg_exp_add,
	a2stg_expdec_neq_0,
	a3stg_exp10_0_eq0,
	a3stg_exp10_1_eq0,
	a3stg_fdtos_inv,
	a4stg_fixtos_fxtod_inv,
	a4stg_rnd_frac_add_inv,
	a4stg_shl_cnt_in,
	a4stg_rnd_sng,
	a4stg_rnd_dbl,
	add_frac_out_rndadd,
	add_frac_out_rnd_frac,
	add_frac_out_shl,
	a4stg_to_0,
	add_exp_out_expinc,
	add_exp_out_exp,
	add_exp_out_exp1,
	add_exp_out_expadd,
	a4stg_to_0_inv,

	se,
	si,
	so
);


parameter
		FADDS=	8'h41,
		FADDD=	8'h42,
		FSUBS=	8'h45,
		FSUBD=	8'h46,
		FCMPS=	8'h51,
		FCMPD=	8'h52,
		FCMPES=	8'h55,
		FCMPED=	8'h56,
		FSTOX=	8'h81,
		FDTOX=	8'h82,
		FSTOI=	8'hd1,
		FDTOI=	8'hd2,
		FSTOD=	8'hc9,
		FDTOS=	8'hc6,
		FXTOS=	8'h84,
		FXTOD=	8'h88,
		FITOS=	8'hc4,
		FITOD=	8'hc8;


input		inq_in1_51;		// request operand 1[51]
input		inq_in1_54;		// request operand 1[54]
input		inq_in1_63;		// request operand 1[63]
input		inq_in1_50_0_neq_0;	// request operand 1[50:0]!=0
input		inq_in1_53_32_neq_0;	// request operand 1[53:32]!=0
input		inq_in1_exp_eq_0;	// request operand 1[62:52]==0
input		inq_in1_exp_neq_ffs;	// request operand 1[62:52]!=0x7ff
input		inq_in2_51;		// request operand 2[51]
input		inq_in2_54;		// request operand 2[54]
input		inq_in2_63;		// request operand 2[63]
input		inq_in2_50_0_neq_0;	// request operand 2[50:0]!=0
input		inq_in2_53_32_neq_0;	// request operand 2[53:32]!=0
input		inq_in2_exp_eq_0;	// request operand 2[62:52]==0
input		inq_in2_exp_neq_ffs;	// request operand 2[62:52]!=0x7ff
input [7:0]	inq_op;			// request opcode to op pipes
input [1:0]	inq_rnd_mode;		// request rounding mode to op pipes
input [4:0]	inq_id;			// request ID to the operation pipes
input [1:0]	inq_fcc;		// request cc ID to op pipes
input		inq_add;		// add pipe request
input		add_dest_rdy;		// add result req accepted for CPX
input		a1stg_in2_neq_in1_frac;	// operand 2 fraction != oprnd 1 frac
input		a1stg_in2_gt_in1_frac;	// operand 2 fraction > oprnd 1 frac
input		a1stg_in2_eq_in1_exp;	// operand 2 exponent == oprnd 1 exp
input [11:0]	a1stg_expadd1;		// exponent adder 1 output- add 1 stage
input [11:0]	a2stg_expadd;		// exponent adder- add 2 stage
input		a2stg_frac2hi_neq_0;	// fraction 2[62:32]in add 2 stage != 0
input		a2stg_frac2lo_neq_0;	// fraction 2[31:11] in add 2 stage != 0
input [11:0]	a2stg_exp;		// exponent- add 2 stage
input		a3stg_fsdtoix_nx;	// inexact result for flt -> ints
input		a3stg_fsdtoi_nx;	// inexact result for flt -> 32b ints
input		a2stg_frac2_63;		// fraction 2 bit[63]- add 2 stage
input [11:0]	a4stg_exp;		// exponent- add 4 stage
input		add_of_out_cout;	// fraction rounding adder carry out
input		a4stg_frac_neq_0;	// fraction != 0- add 4 stage
input		a4stg_shl_data_neq_0;	// left shift result != 0- add 4 stage
input		a4stg_frac_dbl_nx;	// inexact double precision result
input		a4stg_frac_sng_nx;	// inexact single precision result
input [5:0]	a1stg_expadd2;		// exponent adder 2 output- add 1 stage
input [10:0]	a1stg_expadd4_inv;	// exponent adder 4 output- add 1 stage
input		a3stg_denorm;		// denorm output- add 3 stage
input		a3stg_denorm_inv;	// result is not a denorm- add 3 stage
input		a4stg_denorm_inv;	// 0 the exponent
input [10:0]	a3stg_exp;		// exponent- add 3 stage
input		a4stg_round;		// round the result- add 4 stage
input [5:0]	a3stg_lead0;		// leading 0's count- add 3 stage
input		a4stg_rnd_frac_40;	// rounded fraction[40]- add 4 stage
input		a4stg_rnd_frac_39;	// rounded fraction[39]- add 4 stage
input		a4stg_rnd_frac_11;	// rounded fraction[11]- add 4 stage
input		a4stg_rnd_frac_10;	// rounded fraction[10]- add 4 stage
input		a4stg_frac_38_0_nx;	// inexact single precision result
input		a4stg_frac_9_0_nx;	// inexact double precision result
input		arst_l;			// global asynchronous reset- asserted low
input		grst_l;			// global synchronous reset- asserted low
input		rclk;		// global clock

output		add_pipe_active;        // add pipe is executing a valid instr
output		a1stg_denorm_sng_in1;	// select line to normalized fraction 1
output		a1stg_denorm_dbl_in1;	// select line to normalized fraction 1
output		a1stg_denorm_sng_in2;	// select line to normalized fraction 2
output		a1stg_denorm_dbl_in2;	// select line to normalized fraction 2
output		a1stg_norm_sng_in1;	// select line to normalized fraction 1
output		a1stg_norm_dbl_in1;	// select line to normalized fraction 1
output		a1stg_norm_sng_in2;	// select line to normalized fraction 2
output		a1stg_norm_dbl_in2;	// select line to normalized fraction 2
output		a1stg_step;		// add pipe load
output		a1stg_stepa;		// add pipe load- copy
output		a1stg_sngop;		// single precision operation- add 1 stg
output		a1stg_intlngop;		// integer/long input- add 1 stage
output		a1stg_fsdtoix;		// float to integer convert- add 1 stg
output		a1stg_fstod;		// fstod- add 1 stage
output		a1stg_fstoi;		// fstoi- add 1 stage
output		a1stg_fstox;		// fstox- add 1 stage
output		a1stg_fdtoi;		// fdtoi- add 1 stage
output		a1stg_fdtox;		// fdtox- add 1 stage
output		a1stg_faddsubs;		// add/subtract single- add 1 stg
output		a1stg_faddsubd;		// add/subtract double- add 1 stg
output		a1stg_fdtos;		// fdtos- add 1 stage
output		a2stg_faddsubop;	// float add or subtract- add 2 stage
output		a2stg_fsdtoix_fdtos;	// float to integer convert- add 2 stg
output		a2stg_fitos;		// fitos- add 2 stage
output		a2stg_fitod;		// fitod- add 2 stage
output		a2stg_fxtos;		// fxtos- add 2 stage
output		a2stg_fxtod;		// fxtod- add 2 stage
output		a3stg_faddsubop;	// denorm compare lead0[10] input select
output [1:0]	a3stg_faddsubopa;	// denorm compare lead0[10] input select
output		a4stg_dblop;		// double precision operation- add 4 stg
output		a6stg_fadd_in;		// add pipe output request next cycle
output [9:0]	add_id_out_in;		// add pipe output ID next cycle
output [1:0]	add_fcc_out;		// add pipe input fcc passed through
output		a6stg_dbl_dst;		// float double result- add 6 stage
output		a6stg_sng_dst;		// float single result- add 6 stage
output		a6stg_long_dst;		// 64bit integer result- add 6 stage
output		a6stg_int_dst;		// 32bit integer result- add 6 stage
output		a6stg_fcmpop;		// compare- add 6 stage
output		a6stg_step;		// advance the add pipe
output		a3stg_sub_in;		// subtract in main adder- add 3 stage
output		add_sign_out;		// add sign output
output [1:0]	add_cc_out;		// add pipe result- condition
output		a4stg_in_of;		// add overflow- select exp out
output [4:0]	add_exc_out;		// add pipe result- exception flags
output		a2stg_frac1_in_frac1;	// select line to a2stg_frac1
output		a2stg_frac1_in_frac2;	// select line to a2stg_frac1
output		a1stg_2nan_in_inv;	// 2 NaN inputs- a1 stage
output		a1stg_faddsubop_inv;	// add/subtract- a1 stage
output		a2stg_frac1_in_qnan;	// make fraction 1 a QNaN
output		a2stg_frac1_in_nv;	// NV- make a new QNaN
output		a2stg_frac1_in_nv_dbl;	// NV- make a new double prec QNaN
output		a2stg_frac2_in_frac1;	// select line to a2stg_frac2
output		a2stg_frac2_in_qnan;	// make fraction 2 a QNaN
output [5:0]	a2stg_shr_cnt_in;	// right shift count input- add 1 stage
output    a2stg_shr_cnt_5_inv_in; // right shift count input[5]- add 1 stg
output		a2stg_shr_frac2_shr_int; // select line to a3stg_frac2
output		a2stg_shr_frac2_shr_dbl; // select line to a3stg_frac2
output		a2stg_shr_frac2_shr_sng; // select line to a3stg_frac2
output		a2stg_shr_frac2_max;	// select line to a3stg_frac2
output		a2stg_sub_step;		// select line to a3stg_frac2
output		a2stg_fracadd_frac2_inv_in; // sel line to main adder input 2
output		a2stg_fracadd_frac2_inv_shr1_in; // sel line to main adder in 2
output		a2stg_fracadd_frac2;	// select line to main adder input 2
output		a2stg_fracadd_cin_in;	// carry in to main adder- add 1 stage
output		a3stg_exp_7ff;		// select line to a3stg_exp
output		a3stg_exp_ff;		// select line to a3stg_exp
output		a3stg_exp_add;		// select line to a3stg_exp
output		a2stg_expdec_neq_0;	// exponent will be < 54
output		a3stg_exp10_0_eq0;	// exponent[10:0]==0- add 3 stage
output		a3stg_exp10_1_eq0;	// exponent[10:1]==0- add 3 stage
output		a3stg_fdtos_inv;	// double to single convert- add 3 stg
output		a4stg_fixtos_fxtod_inv;	// int to single/double cvt- add 4 stg
output		a4stg_rnd_frac_add_inv; // select line to a4stg_rnd_frac
output [9:0]	a4stg_shl_cnt_in;	// postnorm shift left count- add 3 stg
output		a4stg_rnd_sng;		// round to single precision- add 4 stg
output		a4stg_rnd_dbl;		// round to double precision- add 4 stg
output		add_frac_out_rndadd;	// select line to add_frac_out
output		add_frac_out_rnd_frac;	// select line to add_frac_out
output		add_frac_out_shl;	// select line to add_frac_out
output		a4stg_to_0;		// result to max finite on overflow
output		add_exp_out_expinc;	// select line to add_exp_out
output		add_exp_out_exp;	// select line to add_exp_out
output		add_exp_out_exp1;	// select line to add_exp_out
output		add_exp_out_expadd;	// select line to add_exp_out
output		a4stg_to_0_inv;		// result to infinity on overflow

input		se;			// scan_enable
input		si;			// scan in
output		so;			// scan out


wire		reset;
wire		a1stg_in1_51;
wire		a1stg_in1_54;
wire		a1stg_in1_63;
wire		a1stg_in1_50_0_neq_0;
wire		a1stg_in1_53_32_neq_0;
wire		a1stg_in1_exp_eq_0;
wire		a1stg_in1_exp_neq_ffs;
wire		a1stg_in2_51;
wire		a1stg_in2_54;
wire		a1stg_in2_63;
wire		a1stg_in2_50_0_neq_0;
wire		a1stg_in2_53_32_neq_0;
wire		a1stg_in2_exp_eq_0;
wire		a1stg_in2_exp_neq_ffs;
wire		a1stg_denorm_sng_in1;
wire		a1stg_denorm_dbl_in1;
wire		a1stg_denorm_sng_in2;
wire		a1stg_denorm_dbl_in2;
wire		a1stg_norm_sng_in1;
wire		a1stg_norm_dbl_in1;
wire		a1stg_norm_sng_in2;
wire		a1stg_norm_dbl_in2;
wire		a1stg_snan_sng_in1;
wire		a1stg_snan_dbl_in1;
wire		a1stg_snan_sng_in2;
wire		a1stg_snan_dbl_in2;
wire		a1stg_qnan_sng_in1;
wire		a1stg_qnan_dbl_in1;
wire		a1stg_qnan_sng_in2;
wire		a1stg_qnan_dbl_in2;
wire		a1stg_snan_in1;
wire		a1stg_snan_in2;
wire		a1stg_qnan_in1;
wire		a1stg_qnan_in2;
wire		a1stg_nan_sng_in1;
wire		a1stg_nan_dbl_in1;
wire		a1stg_nan_sng_in2;
wire		a1stg_nan_dbl_in2;
wire		a1stg_nan_in1;
wire		a1stg_nan_in2;
wire		a1stg_nan_in;
wire		a1stg_2nan_in;
wire		a1stg_inf_sng_in1;
wire		a1stg_inf_dbl_in1;
wire		a1stg_inf_sng_in2;
wire		a1stg_inf_dbl_in2;
wire		a1stg_inf_in1;
wire		a1stg_inf_in2;
wire		a1stg_2inf_in;
wire		a1stg_infnan_sng_in1;
wire		a1stg_infnan_dbl_in1;
wire		a1stg_infnan_sng_in2;
wire		a1stg_infnan_dbl_in2;
wire		a1stg_infnan_in1;
wire		a1stg_infnan_in2;
wire		a1stg_infnan_in;
wire		a1stg_2zero_in;
wire		a1stg_step;
wire		a1stg_stepa;
wire [7:0]	a1stg_op_in;
wire [7:0]	a1stg_op;
wire		a1stg_sngop;
wire [3:0]	a1stg_sngopa;
wire		a1stg_dblop;
wire [3:0]	a1stg_dblopa;
wire [1:0]	a1stg_rnd_mode;
wire [4:0]	a1stg_id;
wire [1:0]	a1stg_fcc;
wire		a1stg_fadd;
wire		a1stg_dbl_dst;
wire		a1stg_sng_dst;
wire		a1stg_long_dst;
wire		a1stg_int_dst;
wire		a1stg_intlngop;
wire		a1stg_faddsubop;
wire		a1stg_fsubop;
wire		a1stg_fsdtox;
wire		a1stg_fcmpesd;
wire		a1stg_fcmpsd;
wire		a1stg_faddsub_dtosop;
wire		a1stg_fdtoix;
wire		a1stg_fstoix;
wire		a1stg_fsdtoix;
wire		a1stg_fixtosd;
wire		a1stg_fstod;
wire		a1stg_fstoi;
wire		a1stg_fstox;
wire		a1stg_fdtoi;
wire		a1stg_fdtox;
wire		a1stg_fsdtoix_fdtos;
wire		a1stg_fitos;
wire		a1stg_fitod;
wire		a1stg_fxtos;
wire		a1stg_fcmpop;
wire		a1stg_f4cycop;
wire		a1stg_fixtos_fxtod;
wire		a1stg_faddsubs_fdtos;
wire		a1stg_faddsubs;
wire		a1stg_faddsubd;
wire		a1stg_fdtos;
wire		a1stg_fistod;
wire		a1stg_fixtos;
wire		a1stg_fxtod;
wire            a1stg_opdec_36;
wire [34:28]	a1stg_opdec;
wire [3:0]      a1stg_opdec_24_21;
wire [8:0]      a1stg_opdec_19_11;
wire [9:0]      a1stg_opdec_9_0;
wire		fixtosd_hold;
wire [30:0]	a2stg_opdec_in;
wire            a2stg_opdec_36;
wire [34:28]	a2stg_opdec;
wire [3:0]      a2stg_opdec_24_21;
wire [8:0]      a2stg_opdec_19_11;
wire [9:0]      a2stg_opdec_9_0;
wire [1:0]	a2stg_rnd_mode;
wire [4:0]	a2stg_id;
wire [1:0]	a2stg_fcc;
wire		a2stg_fadd;
wire		a2stg_long_dst;
wire		a2stg_faddsubop;
wire		a2stg_fsubop;
wire		a2stg_faddsub_dtosop;
wire		a2stg_fdtoix;
wire		a2stg_fstoix;
wire		a2stg_fsdtoix;
wire		a2stg_fstod;
wire		a2stg_fstoi;
wire		a2stg_fstox;
wire		a2stg_fdtoi;
wire		a2stg_fdtox;
wire		a2stg_fsdtoix_fdtos;
wire		a2stg_fitos;
wire		a2stg_fitod;
wire		a2stg_fxtos;
wire		a2stg_fcmpop;
wire		a2stg_fixtos_fxtod;
wire		a2stg_fdtos;
wire		a2stg_fxtod;
wire            a3stg_opdec_36;
wire [34:29]	a3stg_opdec;
wire            a3stg_opdec_24;
wire            a3stg_opdec_21;
wire [9:0]      a3stg_opdec_9_0;
wire [1:0]	a3stg_rnd_mode;
wire [4:0]	a3stg_id;
wire [1:0]	a3stg_fcc;
wire		a3stg_fadd;
wire		a3stg_int_dst;
wire		a3stg_faddsubop;
wire [1:0]	a3stg_faddsubopa;
wire		a3stg_fsdtoix;
wire		a3stg_f4cycop;
wire		a3stg_fixtos_fxtod;
wire		a3stg_fdtos;
wire            a4stg_opdec_36;
wire [34:29]	a4stg_opdec;
wire            a4stg_opdec_24;
wire            a4stg_opdec_21;
wire            a4stg_opdec_9;
wire [7:0]      a4stg_opdec_7_0;
wire [1:0]	a4stg_rnd_mode_in;
wire [1:0]	a4stg_rnd_mode;
wire [1:0]	a4stg_rnd_mode2;
wire [9:0]	a4stg_id_in;
wire [9:0]	a4stg_id;
wire [1:0]	a4stg_fcc;
wire		a4stg_dblop;
wire		a4stg_fadd;
wire		a4stg_faddsubop;
wire		a4stg_faddsub_dtosop;
wire		a4stg_fsdtoix;
wire		a4stg_fcmpop;
wire		a4stg_fixtos_fxtod;
wire		a4stg_faddsubs_fdtos;
wire		a4stg_faddsubs;
wire		a4stg_faddsubd;
wire		a4stg_fdtos;
wire		a4stg_fistod;
wire [34:30]	a5stg_opdec;
wire            a5stg_opdec_9;
wire            a5stg_opdec_7;
wire            a5stg_opdec_1;
wire            a5stg_opdec_0;
wire [9:0]	a5stg_id;
wire		a5stg_fadd;
wire		a5stg_fixtos_fxtod;
wire		a5stg_fixtos;
wire		a5stg_fxtod;
wire [34:30]	a6stg_opdec_in;
wire            a6stg_opdec_in_9;
wire		a6stg_fadd_in;
wire [34:30]	a6stg_opdec;
wire            a6stg_opdec_9;
wire [9:0]	add_id_out_in;
wire [9:0]	add_id_out;
wire [1:0]	add_fcc_out_in;
wire [1:0]	add_fcc_out;
wire		a6stg_fadd;
wire		a6stg_dbl_dst;
wire		a6stg_sng_dst;
wire		a6stg_long_dst;
wire		a6stg_int_dst;
wire		a6stg_fcmpop;
wire		a6stg_hold;
wire		a6stg_step;
wire		a1stg_sub;
wire		a2stg_sign1;
wire		a2stg_sign2;
wire		a2stg_sub;
wire		a2stg_in2_neq_in1_frac;
wire		a2stg_in2_gt_in1_frac;
wire		a2stg_in2_eq_in1_exp;
wire		a2stg_in2_gt_in1_exp;
wire		a2stg_nan_in;
wire		a2stg_nan_in2;
wire		a2stg_snan_in2;
wire		a2stg_qnan_in2;
wire		a2stg_snan_in1;
wire		a2stg_qnan_in1;
wire		a2stg_2zero_in;
wire		a2stg_2inf_in;
wire		a2stg_in2_eq_in1;
wire		a2stg_in2_gt_in1;
wire		a3stg_sub_in;
wire		a2stg_faddsub_sign;
wire		a3stg_sign_in;
wire		a3stg_sign;
wire		a2stg_cc_1;
wire		a2stg_cc_0;
wire [1:0]	a2stg_cc;
wire [1:0]	a3stg_cc;
wire		a4stg_sign_in;
wire		a4stg_sign;
wire		a4stg_sign2;
wire [1:0]	a4stg_cc;
wire		add_sign_out;
wire [1:0]	add_cc_out_in;
wire [1:0]	add_cc_out;
wire		a1stg_nv;
wire		a2stg_nv;
wire		a1stg_of_mask;
wire		a2stg_of_mask;
wire		a3stg_nv_in;
wire		a3stg_nv;
wire		a3stg_of_mask;
wire		a2stg_nx_tmp1;
wire		a2stg_nx_tmp2;
wire		a2stg_nx_tmp3;
wire		a3stg_a2_expadd_11;
wire		a3stg_nx_tmp1;
wire		a3stg_nx_tmp2;
wire		a3stg_nx_tmp3;
wire		a3stg_nx;
wire		a4stg_nv_in;
wire		a4stg_nv;
wire		a4stg_nv2;
wire		a4stg_of_mask_in;
wire		a4stg_of_mask;
wire		a4stg_of_mask2;
wire		a4stg_nx_in;
wire		a4stg_nx;
wire		a4stg_nx2;
wire		add_nv_out;
wire		a4stg_in_of;
wire		add_of_out_tmp1_in;
wire		add_of_out_tmp1;
wire		add_of_out_tmp2;
wire		add_of_out;
wire		a4stg_uf;
wire		add_uf_out;
wire		add_nx_out_in;
wire		add_nx_out;
wire [4:0]	add_exc_out;
wire		a2stg_frac1_in_frac1;
wire		a2stg_frac1_in_frac2;
wire		a1stg_2nan_in_inv;
wire		a1stg_faddsubop_inv;
wire		a2stg_frac1_in_qnan;
wire		a2stg_frac1_in_nv;
wire		a2stg_frac1_in_nv_dbl;
wire		a2stg_frac2_in_frac1;
wire		a2stg_frac2_in_qnan;
wire		a1stg_exp_diff_add1;
wire		a1stg_exp_diff_add2;
wire		a1stg_exp_diff_5;
wire [10:0]	a1stg_exp_diff;
wire [5:0]	a1stg_clamp63;
wire [5:0]	a2stg_shr_cnt_in;
wire    a2stg_shr_cnt_5_inv_in;
wire		a2stg_shr_frac2_shr_int;
wire		a2stg_shr_frac2_shr_dbl;
wire		a2stg_shr_frac2_shr_sng;
wire		a2stg_shr_frac2_max;
wire		a2stg_sub_step;
wire		a1stg_faddsub_clamp63_0;
wire		a2stg_fracadd_frac2_inv_in;
wire		a2stg_fracadd_frac2_inv_shr1_in;
wire		a2stg_fracadd_frac2_in;
wire		a2stg_fracadd_frac2;
wire		a2stg_fracadd_cin_in;
wire		a3stg_exp_7ff;
wire		a3stg_exp_ff;
wire		a3stg_exp_add;
wire		a2stg_expdec_neq_0;
wire		a3stg_exp10_0_eq0;
wire		a3stg_exp10_1_eq0;
wire		a3stg_fdtos_inv;
wire		a4stg_fixtos_fxtod_inv;
wire		a4stg_rnd_frac_add_inv;
wire [9:0]	a4stg_shl_cnt_in;
wire		a4stg_rnd_sng;
wire		a4stg_rnd_dbl;
wire		a4stg_rndup_sng;
wire		a4stg_rndup_dbl;
wire		a4stg_rndup;
wire		a5stg_rndup;
wire		add_frac_out_rndadd;
wire		add_frac_out_rnd_frac;
wire		add_frac_out_shl;
wire		a4stg_to_0;
wire		add_exp_out_expinc;
wire		add_exp_out_exp;
wire		add_exp_out_exp1;
wire		add_exp_out_expadd;
wire		a4stg_to_0_inv;
wire		add_pipe_active_in;
wire		add_pipe_active;

//Previously missing wires
wire        add_ctl_rst_l;

dffrl_async #(1)  dffrl_add_ctl (
  .din  (grst_l),
  .clk  (rclk),
  .rst_l(arst_l),
  .q    (add_ctl_rst_l),
	.se (se),
	.si (),
	.so ()
  );

assign reset= (!add_ctl_rst_l);


///////////////////////////////////////////////////////////////////////////////
//
//      Add pipeline special input cases.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(1) i_a1stg_in1_51 (
	.din	(inq_in1_51),
	.en     (a1stg_step),
        .clk    (rclk),
 
        .q      (a1stg_in1_51),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a1stg_in1_54 (
	.din	(inq_in1_54),
	.en     (a1stg_step),
        .clk    (rclk),
 
        .q      (a1stg_in1_54),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a1stg_in1_63 (
        .din	(inq_in1_63),
        .en	(a1stg_step),
        .clk	(rclk),
 
        .q	(a1stg_in1_63),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(1) i_a1stg_in1_50_0_neq_0 (
	.din	(inq_in1_50_0_neq_0),
	.en	(a1stg_step),
	.clk	(rclk),

	.q	(a1stg_in1_50_0_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_a1stg_in1_53_32_neq_0 (
	.din	(inq_in1_53_32_neq_0),
	.en	(a1stg_step),
	.clk	(rclk),

	.q	(a1stg_in1_53_32_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_a1stg_in1_exp_eq_0 (
        .din	(inq_in1_exp_eq_0),
        .en	(a1stg_step),
        .clk	(rclk),
 
        .q	(a1stg_in1_exp_eq_0),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(1) i_a1stg_in1_exp_neq_ffs (
	.din	(inq_in1_exp_neq_ffs),
	.en	(a1stg_step),
	.clk	(rclk),

	.q	(a1stg_in1_exp_neq_ffs),

   	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_a1stg_in2_51 (
	.din	(inq_in2_51),
	.en	(a1stg_step),
	.clk	(rclk),

	.q	(a1stg_in2_51),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_a1stg_in2_54 (
	.din	(inq_in2_54),
	.en	(a1stg_step),
	.clk	(rclk),

	.q	(a1stg_in2_54),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_a1stg_in2_63 (
        .din	(inq_in2_63),
        .en	(a1stg_step),
        .clk	(rclk),
 
        .q	(a1stg_in2_63),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(1) i_a1stg_in2_50_0_neq_0 (
	.din	(inq_in2_50_0_neq_0),
	.en	(a1stg_step),
	.clk	(rclk),

	.q	(a1stg_in2_50_0_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_a1stg_in2_53_32_neq_0 (
	.din	(inq_in2_53_32_neq_0),
	.en	(a1stg_step),
	.clk	(rclk),

	.q	(a1stg_in2_53_32_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_a1stg_in2_exp_eq_0 (
	.din	(inq_in2_exp_eq_0),
	 .en	(a1stg_step),
	.clk	(rclk),

	.q	(a1stg_in2_exp_eq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_a1stg_in2_exp_neq_ffs (
        .din	(inq_in2_exp_neq_ffs),
        .en	(a1stg_step),
        .clk	(rclk),
 
        .q	(a1stg_in2_exp_neq_ffs),
 
        .se	(se),
        .si	(),
        .so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Denorm add inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign a1stg_denorm_sng_in1= a1stg_in1_exp_eq_0 && a1stg_sngopa[0];

assign a1stg_denorm_dbl_in1= a1stg_in1_exp_eq_0 && a1stg_dblopa[0];

assign a1stg_denorm_sng_in2= a1stg_in2_exp_eq_0 && a1stg_sngopa[0];

assign a1stg_denorm_dbl_in2= a1stg_in2_exp_eq_0 && a1stg_dblopa[0];


///////////////////////////////////////////////////////////////////////////////
//
//	Non-denorm add inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign a1stg_norm_sng_in1= (!a1stg_in1_exp_eq_0) && a1stg_sngopa[0];

assign a1stg_norm_dbl_in1= (!a1stg_in1_exp_eq_0) && a1stg_dblopa[0];

assign a1stg_norm_sng_in2= (!a1stg_in2_exp_eq_0) && a1stg_sngopa[0];

assign a1stg_norm_dbl_in2= (!a1stg_in2_exp_eq_0) && a1stg_dblopa[0];


///////////////////////////////////////////////////////////////////////////////
//
//	Nan add inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign a1stg_snan_sng_in1= (!a1stg_in1_exp_neq_ffs) && (!a1stg_in1_54)
		&& a1stg_in1_53_32_neq_0 && a1stg_sngopa[1];

assign a1stg_snan_dbl_in1= (!a1stg_in1_exp_neq_ffs) && (!a1stg_in1_51)
		&& a1stg_in1_50_0_neq_0 && a1stg_dblopa[1];

assign a1stg_snan_sng_in2= (!a1stg_in2_exp_neq_ffs) && (!a1stg_in2_54)
                && a1stg_in2_53_32_neq_0 && a1stg_sngopa[1];

assign a1stg_snan_dbl_in2= (!a1stg_in2_exp_neq_ffs) && (!a1stg_in2_51)
                && a1stg_in2_50_0_neq_0 && a1stg_dblopa[1];

assign a1stg_qnan_sng_in1= (!a1stg_in1_exp_neq_ffs) && a1stg_in1_54
		&& a1stg_sngopa[1];

assign a1stg_qnan_dbl_in1= (!a1stg_in1_exp_neq_ffs) && a1stg_in1_51
		&& a1stg_dblopa[1];

assign a1stg_qnan_sng_in2= (!a1stg_in2_exp_neq_ffs) && a1stg_in2_54
                && a1stg_sngopa[1];

assign a1stg_qnan_dbl_in2= (!a1stg_in2_exp_neq_ffs) && a1stg_in2_51
                && a1stg_dblopa[1];

assign a1stg_snan_in1= a1stg_snan_sng_in1 || a1stg_snan_dbl_in1;

assign a1stg_snan_in2= a1stg_snan_sng_in2 || a1stg_snan_dbl_in2;

assign a1stg_qnan_in1= a1stg_qnan_sng_in1 || a1stg_qnan_dbl_in1;
 
assign a1stg_qnan_in2= a1stg_qnan_sng_in2 || a1stg_qnan_dbl_in2;

assign a1stg_nan_sng_in1= (!a1stg_in1_exp_neq_ffs)
		&& (a1stg_in1_54 || a1stg_in1_53_32_neq_0)
		&& a1stg_sngopa[2];

assign a1stg_nan_dbl_in1= (!a1stg_in1_exp_neq_ffs)
		&& (a1stg_in1_51 || a1stg_in1_50_0_neq_0)
		&& a1stg_dblopa[2];

assign a1stg_nan_sng_in2= (!a1stg_in2_exp_neq_ffs)
		&& (a1stg_in2_54 || a1stg_in2_53_32_neq_0)
		&& a1stg_sngopa[2];

assign a1stg_nan_dbl_in2= (!a1stg_in2_exp_neq_ffs)
		&& (a1stg_in2_51 || a1stg_in2_50_0_neq_0)
		&& a1stg_dblopa[2];

assign a1stg_nan_in1= a1stg_nan_sng_in1 || a1stg_nan_dbl_in1;

assign a1stg_nan_in2= a1stg_nan_sng_in2 || a1stg_nan_dbl_in2;

assign a1stg_nan_in= a1stg_nan_in1 || a1stg_nan_in2;

assign a1stg_2nan_in= a1stg_nan_in1 && a1stg_nan_in2;


///////////////////////////////////////////////////////////////////////////////
//
//	Infinity add inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign a1stg_inf_sng_in1= (!a1stg_in1_exp_neq_ffs)
		&& (!a1stg_in1_54) && (!a1stg_in1_53_32_neq_0)
		&& a1stg_sngopa[2];

assign a1stg_inf_dbl_in1= (!a1stg_in1_exp_neq_ffs)
		&& (!a1stg_in1_51) && (!a1stg_in1_50_0_neq_0)
		&& a1stg_dblopa[2];

assign a1stg_inf_sng_in2= (!a1stg_in2_exp_neq_ffs)
		&& (!a1stg_in2_54) && (!a1stg_in2_53_32_neq_0)
		&& a1stg_sngopa[2];

assign a1stg_inf_dbl_in2= (!a1stg_in2_exp_neq_ffs)
		&& (!a1stg_in2_51) && (!a1stg_in2_50_0_neq_0)
		&& a1stg_dblopa[2];

assign a1stg_inf_in1= a1stg_inf_sng_in1 || a1stg_inf_dbl_in1;

assign a1stg_inf_in2= a1stg_inf_sng_in2 || a1stg_inf_dbl_in2;

assign a1stg_2inf_in= a1stg_inf_in1 && a1stg_inf_in2;


///////////////////////////////////////////////////////////////////////////////
//
//      Infinity/Nan add inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign a1stg_infnan_sng_in1= (!a1stg_in1_exp_neq_ffs) && a1stg_sngopa[3];

assign a1stg_infnan_dbl_in1= (!a1stg_in1_exp_neq_ffs) && a1stg_dblopa[3];

assign a1stg_infnan_sng_in2= (!a1stg_in2_exp_neq_ffs) && a1stg_sngopa[3];

assign a1stg_infnan_dbl_in2= (!a1stg_in2_exp_neq_ffs) && a1stg_dblopa[3];

assign a1stg_infnan_in1= a1stg_infnan_sng_in1 || a1stg_infnan_dbl_in1;

assign a1stg_infnan_in2= a1stg_infnan_sng_in2 || a1stg_infnan_dbl_in2;

assign a1stg_infnan_in= a1stg_infnan_in1 || a1stg_infnan_in2;


///////////////////////////////////////////////////////////////////////////////
//
//	Zero inputs.
//
///////////////////////////////////////////////////////////////////////////////

// Austin update
// correctly detect case where both single precision operands are zero

// assign a1stg_2zero_in= a1stg_in1_exp_eq_0 && (!a1stg_in1_51)
//		&& (!a1stg_in1_50_0_neq_0)
//		&& a1stg_in2_exp_eq_0 && (!a1stg_in2_51)
//		&& (!a1stg_in2_50_0_neq_0);

assign a1stg_2zero_in =

		a1stg_in1_exp_eq_0                          &&
                (!a1stg_in1_54          || a1stg_dblopa[3]) &&  // (!bit54          ) || dp
                (!a1stg_in1_53_32_neq_0 || a1stg_dblopa[3]) &&  // (!bit53 && !bit52) || dp
                (!a1stg_in1_51)                             &&
                (!a1stg_in1_50_0_neq_0)                     &&

                a1stg_in2_exp_eq_0                          &&
                (!a1stg_in2_54          || a1stg_dblopa[3]) &&  // (!bit54          ) || dp
                (!a1stg_in2_53_32_neq_0 || a1stg_dblopa[3]) &&  // (!bit53 && !bit52) || dp
                (!a1stg_in2_51)                             &&
                (!a1stg_in2_50_0_neq_0);


///////////////////////////////////////////////////////////////////////////////
//
//      Floating point add control pipeline.
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- add input stage.
//
///////////////////////////////////////////////////////////////////////////////

assign a1stg_step= (!fixtosd_hold) && (!a6stg_hold);

assign a1stg_stepa= a1stg_step;

assign a1stg_op_in[7:0]= ({8{inq_add}}
			    & inq_op[7:0]);

dffre_s #(8) i_a1stg_op (
        .din    (a1stg_op_in[7:0]),
        .en     (a1stg_step),
        .rst    (reset),
        .clk    (rclk),

        .q      (a1stg_op[7:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a1stg_sngop (
	.din	(inq_op[0]),
        .en     (a1stg_step),
        .clk    (rclk),

        .q      (a1stg_sngop),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(4) i_a1stg_sngopa (
        .din	({4{inq_op[0]}}),
        .en	(a1stg_step),
        .clk	(rclk),
 
        .q	(a1stg_sngopa[3:0]),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(1) i_a1stg_dblop (
	.din	(inq_op[1]),
        .en     (a1stg_step),
        .clk    (rclk),
 
        .q      (a1stg_dblop),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(4) i_a1stg_dblopa (
 	.din	({4{inq_op[1]}}),
	.en	(a1stg_step),
	.clk	(rclk),

	.q	(a1stg_dblopa[3:0]),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(2) i_a1stg_rnd_mode (
        .din    (inq_rnd_mode[1:0]),
        .en     (a1stg_step),
        .clk    (rclk),

        .q      (a1stg_rnd_mode[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(5) i_a1stg_id (
        .din    (inq_id[4:0]),
        .en     (a1stg_step),
        .clk    (rclk),
 
        .q      (a1stg_id[4:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(2) i_a1stg_fcc (
        .din    (inq_fcc[1:0]),
        .en     (a1stg_step),
        .clk    (rclk),

        .q      (a1stg_fcc[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode decode- add stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign a1stg_fadd= (a1stg_op[7:0]==FADDS) || (a1stg_op[7:0]==FADDD)
		|| (a1stg_op[7:0]==FSUBS) || (a1stg_op[7:0]==FSUBD)
		|| (a1stg_op[7:0]==FCMPES) || (a1stg_op[7:0]==FCMPED)
		|| (a1stg_op[7:0]==FCMPS) || (a1stg_op[7:0]==FCMPD)
		|| (a1stg_op[7:0]==FITOS) || (a1stg_op[7:0]==FITOD)
		|| (a1stg_op[7:0]==FXTOS) || (a1stg_op[7:0]==FXTOD)
		|| (a1stg_op[7:0]==FSTOI) || (a1stg_op[7:0]==FSTOX)
		|| (a1stg_op[7:0]==FDTOI) || (a1stg_op[7:0]==FDTOX)
		|| (a1stg_op[7:0]==FSTOD) || (a1stg_op[7:0]==FDTOS);

assign a1stg_dbl_dst= (a1stg_op[7:0]==FADDD) || (a1stg_op[7:0]==FSUBD)
		|| (a1stg_op[7:0]==FITOD) || (a1stg_op[7:0]==FXTOD)
		|| (a1stg_op[7:0]==FSTOD);

assign a1stg_sng_dst= (a1stg_op[7:0]==FADDS) || (a1stg_op[7:0]==FSUBS)
		|| (a1stg_op[7:0]==FITOS) || (a1stg_op[7:0]==FXTOS)
		|| (a1stg_op[7:0]==FDTOS);

assign a1stg_long_dst= (a1stg_op[7:0]==FSTOX) || (a1stg_op[7:0]==FDTOX);

assign a1stg_int_dst= (a1stg_op[7:0]==FSTOI) || (a1stg_op[7:0]==FDTOI);

assign a1stg_intlngop= (!(a1stg_sngopa[3] || a1stg_dblop));

assign a1stg_faddsubop= (a1stg_op[7:0]==FADDS) || (a1stg_op[7:0]==FADDD)
		|| (a1stg_op[7:0]==FSUBS) || (a1stg_op[7:0]==FSUBD);

assign a1stg_fsubop= (a1stg_op[7:0]==FSUBS) || (a1stg_op[7:0]==FSUBD);

assign a1stg_fsdtox= (a1stg_op[7:0]==FSTOX) || (a1stg_op[7:0]==FDTOX);

assign a1stg_fcmpesd= (a1stg_op[7:0]==FCMPES) || (a1stg_op[7:0]==FCMPED);

assign a1stg_fcmpsd= (a1stg_op[7:0]==FCMPS) || (a1stg_op[7:0]==FCMPD);

assign a1stg_faddsub_dtosop= (a1stg_op[7:0]==FADDS) || (a1stg_op[7:0]==FADDD)
                || (a1stg_op[7:0]==FSUBS) || (a1stg_op[7:0]==FSUBD)
		|| (a1stg_op[7:0]==FDTOS);

assign a1stg_fdtoix= (a1stg_op[7:0]==FDTOI) || (a1stg_op[7:0]==FDTOX);

assign a1stg_fstoix= (a1stg_op[7:0]==FSTOI) || (a1stg_op[7:0]==FSTOX);

assign a1stg_fsdtoix= (a1stg_op[7:0]==FSTOI) || (a1stg_op[7:0]==FSTOX)
		|| (a1stg_op[7:0]==FDTOI) || (a1stg_op[7:0]==FDTOX);

assign a1stg_fixtosd= (a1stg_op[7:0]==FITOS) || (a1stg_op[7:0]==FITOD)
		|| (a1stg_op[7:0]==FXTOS) || (a1stg_op[7:0]==FXTOD);

assign a1stg_fstod= (a1stg_op[7:0]==FSTOD);

assign a1stg_fstoi= (a1stg_op[7:0]==FSTOI);

assign a1stg_fstox= (a1stg_op[7:0]==FSTOX);

assign a1stg_fdtoi= (a1stg_op[7:0]==FDTOI);

assign a1stg_fdtox= (a1stg_op[7:0]==FDTOX);

assign a1stg_fsdtoix_fdtos= (a1stg_op[7:0]==FSTOI) || (a1stg_op[7:0]==FSTOX)
                || (a1stg_op[7:0]==FDTOI) || (a1stg_op[7:0]==FDTOX)
		|| (a1stg_op[7:0]==FDTOS);

assign a1stg_fitos= (a1stg_op[7:0]==FITOS);

assign a1stg_fitod= (a1stg_op[7:0]==FITOD);

assign a1stg_fxtos= (a1stg_op[7:0]==FXTOS);

assign a1stg_fcmpop= (a1stg_op[7:0]==FCMPS) || (a1stg_op[7:0]==FCMPD)
		|| (a1stg_op[7:0]==FCMPES) || (a1stg_op[7:0]==FCMPED);

assign a1stg_f4cycop= (a1stg_op[7:0]==FADDS) || (a1stg_op[7:0]==FADDD)
                || (a1stg_op[7:0]==FSUBS) || (a1stg_op[7:0]==FSUBD)
                || (a1stg_op[7:0]==FDTOS) || (a1stg_op[7:0]==FSTOD)
		|| (a1stg_op[7:0]==FITOD);

assign a1stg_fixtos_fxtod= (a1stg_op[7:0]==FITOS) || (a1stg_op[7:0]==FXTOS)
		|| (a1stg_op[7:0]==FXTOD);

assign a1stg_faddsubs_fdtos= (a1stg_op[7:0]==FADDS) || (a1stg_op[7:0]==FSUBS)
		|| (a1stg_op[7:0]==FDTOS);

assign a1stg_faddsubs= (a1stg_op[7:0]==FADDS) || (a1stg_op[7:0]==FSUBS);

assign a1stg_faddsubd= (a1stg_op[7:0]==FADDD) || (a1stg_op[7:0]==FSUBD);

assign a1stg_fdtos= (a1stg_op[7:0]==FDTOS);

assign a1stg_fistod= (a1stg_op[7:0]==FITOD) || (a1stg_op[7:0]==FSTOD);

assign a1stg_fixtos= (a1stg_op[7:0]==FITOS) || (a1stg_op[7:0]==FXTOS);

assign a1stg_fxtod= (a1stg_op[7:0]==FXTOD);

assign a1stg_opdec_36 = a1stg_dblop;

assign a1stg_opdec[34:28] =
			 {a1stg_fadd,
			  a1stg_dbl_dst,
			  a1stg_sng_dst,
			  a1stg_long_dst,
			  a1stg_int_dst,
			  a1stg_faddsubop,
			  a1stg_fsubop};

assign a1stg_opdec_24_21[3:0] =
			 {a1stg_faddsub_dtosop,
			  a1stg_fdtoix,
			  a1stg_fstoix,
			  a1stg_fsdtoix};

assign a1stg_opdec_19_11[8:0] =
			 {a1stg_fstod,
			  a1stg_fstoi,
			  a1stg_fstox,
			  a1stg_fdtoi,
			  a1stg_fdtox,
			  a1stg_fsdtoix_fdtos,
			  a1stg_fitos,
			  a1stg_fitod,
			  a1stg_fxtos};
 
assign a1stg_opdec_9_0[9:0] = 
			 {a1stg_fcmpop,
			  a1stg_f4cycop,
			  a1stg_fixtos_fxtod,
			  a1stg_faddsubs_fdtos,
			  a1stg_faddsubs,
			  a1stg_faddsubd,
			  a1stg_fdtos,
			  a1stg_fistod,
			  a1stg_fixtos,
			  a1stg_fxtod};

assign fixtosd_hold= a2stg_fixtos_fxtod
		&& (!(a1stg_op[7] && (!a1stg_op[1]) && (!a1stg_op[0])
			&& (a1stg_op[2] || (!a1stg_op[6]))));

assign a2stg_opdec_in[30:0]= {31{(!fixtosd_hold)}}
			    & {a1stg_opdec_36, a1stg_opdec[34:28],
                               a1stg_opdec_24_21[3:0], a1stg_opdec_19_11[8:0],
                               a1stg_opdec_9_0[9:0]};

dffre_s #(31) i_a2stg_opdec (
	.din	(a2stg_opdec_in[30:0]),
	.en	(a6stg_step),
	.rst    (reset),
        .clk    (rclk),

        .q      ({a2stg_opdec_36, a2stg_opdec[34:28], a2stg_opdec_24_21[3:0],
                  a2stg_opdec_19_11[8:0], a2stg_opdec_9_0[9:0]}),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(2) i_a2stg_rnd_mode (
        .din    (a1stg_rnd_mode[1:0]),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a2stg_rnd_mode[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(5) i_a2stg_id (
        .din    (a1stg_id[4:0]),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_id[4:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(2) i_a2stg_fcc (
        .din    (a1stg_fcc[1:0]),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a2stg_fcc[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- add stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign a2stg_fadd= a2stg_opdec[34];
assign a2stg_long_dst= a2stg_opdec[31];
assign a2stg_faddsubop= a2stg_opdec[29];
assign a2stg_fsubop= a2stg_opdec[28];
assign a2stg_faddsub_dtosop= a2stg_opdec_24_21[3];
assign a2stg_fdtoix= a2stg_opdec_24_21[2];
assign a2stg_fstoix= a2stg_opdec_24_21[1];
assign a2stg_fsdtoix= a2stg_opdec_24_21[0];
assign a2stg_fstod= a2stg_opdec_19_11[8];
assign a2stg_fstoi= a2stg_opdec_19_11[7];
assign a2stg_fstox= a2stg_opdec_19_11[6];
assign a2stg_fdtoi= a2stg_opdec_19_11[5];
assign a2stg_fdtox= a2stg_opdec_19_11[4];
assign a2stg_fsdtoix_fdtos= a2stg_opdec_19_11[3];
assign a2stg_fitos= a2stg_opdec_19_11[2];
assign a2stg_fitod= a2stg_opdec_19_11[1];
assign a2stg_fxtos= a2stg_opdec_19_11[0];
assign a2stg_fcmpop= a2stg_opdec_9_0[9];
assign a2stg_fixtos_fxtod= a2stg_opdec_9_0[7];
assign a2stg_fdtos= a2stg_opdec_9_0[3];
assign a2stg_fxtod= a2stg_opdec_9_0[0];

dffre_s #(19) i_a3stg_opdec (
        .din    ({a2stg_opdec_36, a2stg_opdec[34:29], a2stg_opdec_24_21[3],
                  a2stg_opdec_24_21[0], a2stg_opdec_9_0[9:0]}),
        .en     (a6stg_step),
        .rst    (reset),
        .clk    (rclk),

        .q      ({a3stg_opdec_36, a3stg_opdec[34:29], a3stg_opdec_24,
                  a3stg_opdec_21, a3stg_opdec_9_0[9:0]}),

        .se     (se),
        .si     (),
        .so     ()
);

dffre_s #(2) i_a3stg_faddsubopa (
	.din	({2{a2stg_faddsubop}}),
	.en	(a6stg_step),
	.rst	(reset),
	.clk	(rclk),

	.q	(a3stg_faddsubopa[1:0]),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(2) i_a3stg_rnd_mode (
        .din    (a2stg_rnd_mode[1:0]),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a3stg_rnd_mode[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(5) i_a3stg_id (
        .din    (a2stg_id[4:0]),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a3stg_id[4:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(2) i_a3stg_fcc (
        .din    (a2stg_fcc[1:0]),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a3stg_fcc[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- add stage 3.
//
///////////////////////////////////////////////////////////////////////////////

assign a3stg_fadd= a3stg_opdec[34];
assign a3stg_int_dst= a3stg_opdec[30];
assign a3stg_faddsubop= a3stg_opdec[29];
assign a3stg_fsdtoix= a3stg_opdec_21;
assign a3stg_f4cycop= a3stg_opdec_9_0[8];
assign a3stg_fixtos_fxtod= a3stg_opdec_9_0[7];
assign a3stg_fdtos= a3stg_opdec_9_0[3];

dffre_s #(18) i_a4stg_opdec (
        .din    ({a3stg_opdec_36, a3stg_opdec[34:29], a3stg_opdec_24,
                  a3stg_opdec_21, a3stg_opdec_9_0[9], a3stg_opdec_9_0[7:0]}),
        .en     (a6stg_step),
        .rst    (reset),
        .clk    (rclk),

        .q      ({a4stg_opdec_36, a4stg_opdec[34:29], a4stg_opdec_24,
                  a4stg_opdec_21, a4stg_opdec_9, a4stg_opdec_7_0[7:0]}),

        .se     (se),
        .si     (),
        .so     ()
);

assign a4stg_rnd_mode_in[1:0]= ({2{a3stg_f4cycop}}
			    & a3stg_rnd_mode[1:0])
		| ({2{(!a3stg_f4cycop)}}
			    & a4stg_rnd_mode2[1:0]);

dffe_s #(2) i_a4stg_rnd_mode (
	.din	(a4stg_rnd_mode_in[1:0]),
	.en     (a6stg_step),
	.clk    (rclk),

        .q      (a4stg_rnd_mode[1:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(2) i_a4stg_rnd_mode2 (
	.din	(a3stg_rnd_mode[1:0]),
	.en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a4stg_rnd_mode2[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);

assign a4stg_id_in[9:0]= {(a3stg_id[4:2]==3'o7),
				(a3stg_id[4:2]==3'o6),
				(a3stg_id[4:2]==3'o5),
				(a3stg_id[4:2]==3'o4),
				(a3stg_id[4:2]==3'o3),
				(a3stg_id[4:2]==3'o2),
				(a3stg_id[4:2]==3'o1),
				(a3stg_id[4:2]==3'o0),
				a3stg_id[1:0]};

dffe_s #(10) i_a4stg_id (
        .din    (a4stg_id_in[9:0]),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a4stg_id[9:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(2) i_a4stg_fcc (
        .din    (a3stg_fcc[1:0]),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a4stg_fcc[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- add stages 4 and 5.
//
///////////////////////////////////////////////////////////////////////////////

assign a4stg_dblop= a4stg_opdec_36;
assign a4stg_fadd= a4stg_opdec[34];
assign a4stg_faddsubop= a4stg_opdec[29];
assign a4stg_faddsub_dtosop= a4stg_opdec_24;
assign a4stg_fsdtoix= a4stg_opdec_21;
assign a4stg_fcmpop= a4stg_opdec_9;
assign a4stg_fixtos_fxtod= a4stg_opdec_7_0[7];
assign a4stg_faddsubs_fdtos= a4stg_opdec_7_0[6];
assign a4stg_faddsubs= a4stg_opdec_7_0[5];
assign a4stg_faddsubd= a4stg_opdec_7_0[4];
assign a4stg_fdtos= a4stg_opdec_7_0[3];
assign a4stg_fistod= a4stg_opdec_7_0[2];

dffre_s #(9) i_a5stg_opdec (
        .din    ({a4stg_opdec[34:30], a4stg_opdec_9, a4stg_opdec_7_0[7],
                  a4stg_opdec_7_0[1], a4stg_opdec_7_0[0]}),
        .en     (a6stg_step),
        .rst    (reset),
        .clk    (rclk),

        .q      ({a5stg_opdec[34:30], a5stg_opdec_9, a5stg_opdec_7,
                  a5stg_opdec_1, a5stg_opdec_0}),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(10) i_a5stg_id (
        .din    (a4stg_id[9:0]),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a5stg_id[9:0]),

        .se     (se),
        .si     (),
        .so     ()
);

assign a5stg_fadd= a5stg_opdec[34];
assign a5stg_fixtos_fxtod= a5stg_opdec_7;
assign a5stg_fixtos= a5stg_opdec_1;
assign a5stg_fxtod= a5stg_opdec_0;

assign a6stg_opdec_in[34:30] = ({5{a5stg_fixtos_fxtod}}
			    & a5stg_opdec[34:30])
		| ({5{((!a4stg_fixtos_fxtod) && (!a5stg_fixtos_fxtod))}}
			    & a4stg_opdec[34:30]);

assign a6stg_opdec_in_9 = (a5stg_fixtos_fxtod
			    & a5stg_opdec_9)
		| (((!a4stg_fixtos_fxtod) && (!a5stg_fixtos_fxtod))
			    & a4stg_opdec_9);

assign a6stg_fadd_in= (a5stg_fixtos_fxtod && a6stg_step && (!reset)
			&& a5stg_fadd)
		|| ((!a4stg_fixtos_fxtod) && (!a5stg_fixtos_fxtod)
			&& a6stg_step && (!reset) && a4stg_fadd)
		|| ((!a6stg_step) && (!reset) && a6stg_fadd);

dffre_s #(6) i_a6stg_opdec (
	.din	({a6stg_opdec_in[34:30], a6stg_opdec_in_9}),
	.en     (a6stg_step),
        .rst    (reset),
        .clk    (rclk),

        .q      ({a6stg_opdec[34:30], a6stg_opdec_9}),

        .se     (se),
        .si     (),
        .so     ()
);

assign add_id_out_in[9:0]= ({10{((!a5stg_fixtos_fxtod) && a6stg_step)}}
			    & a4stg_id[9:0])
		| ({10{(a5stg_fixtos_fxtod && a6stg_step)}}
			    & a5stg_id[9:0])
		| ({10{(!a6stg_step)}}
			    & add_id_out[9:0]);

dff_s #(10) i_add_id_out (
	.din	(add_id_out_in[9:0]),
        .clk    (rclk),

        .q      (add_id_out[9:0]),

        .se     (se),
        .si     (),
        .so     ()
);

assign add_fcc_out_in[1:0]= ({2{a4stg_fcmpop}}
			    & a4stg_fcc);

dffe_s #(2) i_add_fcc_out (
	.din    (add_fcc_out_in[1:0]),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (add_fcc_out[1:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- add pipeline output.
//
///////////////////////////////////////////////////////////////////////////////

assign a6stg_fadd= a6stg_opdec[34];
assign a6stg_dbl_dst= a6stg_opdec[33];
assign a6stg_sng_dst= a6stg_opdec[32];
assign a6stg_long_dst= a6stg_opdec[31];
assign a6stg_int_dst= a6stg_opdec[30];
assign a6stg_fcmpop= a6stg_opdec_9;

assign a6stg_hold= a6stg_fadd && (!add_dest_rdy);

assign a6stg_step= (!a6stg_hold);

// Austin update
// Power management update

assign add_pipe_active_in =  // add pipe is executing a valid instr
   a1stg_fadd || a2stg_fadd || a3stg_fadd || a4stg_fadd || a5stg_fadd || a6stg_fadd;

dffre_s #(1) i_add_pipe_active (
	.din	(add_pipe_active_in),
	.en     (1'b1),
        .rst    (reset),
        .clk    (rclk),

        .q      (add_pipe_active),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Add sign and exception logic.
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
//
//	Add sign logic.
//
//	Add stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign a1stg_sub= (a1stg_fsubop ^ (a1stg_in1_63 ^ a1stg_in2_63))
		&& (!a1stg_fdtos)
		&& (!(a1stg_faddsubop && a1stg_nan_in));

dffe_s #(1) i_a2stg_sign1 (
	.din	(a1stg_in1_63),
	.en	(a6stg_step),
	.clk    (rclk),

        .q      (a2stg_sign1),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_sign2 (
	.din    (a1stg_in2_63),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_sign2),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_sub (
        .din    (a1stg_sub),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_sub),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_in2_neq_in1_frac (
        .din    (a1stg_in2_neq_in1_frac),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_in2_neq_in1_frac),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_in2_gt_in1_frac (
        .din    (a1stg_in2_gt_in1_frac),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_in2_gt_in1_frac),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_in2_eq_in1_exp (
        .din    (a1stg_in2_eq_in1_exp),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_in2_eq_in1_exp),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_in2_gt_in1_exp (
        .din    (a1stg_expadd1[11]),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_in2_gt_in1_exp),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_nan_in (
        .din    (a1stg_nan_in),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_nan_in),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_nan_in2 (
        .din    (a1stg_nan_in2),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_nan_in2),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_snan_in2 (
        .din    (a1stg_snan_in2),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_snan_in2),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_qnan_in2 (
        .din    (a1stg_qnan_in2),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_qnan_in2),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_snan_in1 (
        .din    (a1stg_snan_in1),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_snan_in1),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_qnan_in1 (
        .din    (a1stg_qnan_in1),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_qnan_in1),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_2zero_in (
        .din    (a1stg_2zero_in),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_2zero_in),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_2inf_in (
        .din    (a1stg_2inf_in),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_2inf_in),
 
        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Add sign logic.
//
//      Add stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign a2stg_in2_eq_in1= a2stg_in2_eq_in1_exp && (!a2stg_in2_neq_in1_frac);

assign a2stg_in2_gt_in1= a2stg_in2_gt_in1_exp
		|| (a2stg_in2_eq_in1_exp && a2stg_in2_neq_in1_frac
			&& a2stg_in2_gt_in1_frac);

assign a3stg_sub_in= a2stg_sub
		&& (!a2stg_nan_in)
		&& (!(a2stg_fsdtoix && (!a2stg_expadd[11])));

assign a2stg_faddsub_sign= (a2stg_sign1
			&& (!a2stg_nan_in)
			&& (a2stg_sign2 ^ a2stg_fsubop)
			&& (!(a2stg_2inf_in && a2stg_sub)))
		|| (a2stg_sign1
			&& (!a2stg_nan_in)
			&& (!a2stg_in2_eq_in1)
			&& (!a2stg_in2_gt_in1)
			&& (!(a2stg_2inf_in && a2stg_sub)))
		|| ((!a2stg_in2_eq_in1)
			&& a2stg_in2_gt_in1
			&& (!a2stg_nan_in)
			&& (a2stg_sign2 ^ a2stg_fsubop)
			&& (!(a2stg_2inf_in && a2stg_sub)))
		|| (a2stg_sign2
			&& (a2stg_snan_in2
				|| (a2stg_qnan_in2 && (!a2stg_snan_in1))))
		|| (a2stg_sign1
			&& ((a2stg_snan_in1 && (!a2stg_snan_in2))
				|| (a2stg_qnan_in1 && (!a2stg_nan_in2))))
		|| ((a2stg_rnd_mode[1:0]==2'b11)
			&& a2stg_in2_eq_in1
			&& (a2stg_sign1 ^ (a2stg_sign2 ^ a2stg_fsubop))
			&& (!a2stg_nan_in)
			&& (!a2stg_2inf_in));

assign a3stg_sign_in= (a2stg_faddsubop && a2stg_faddsub_sign)
		|| ((!a2stg_faddsubop) && a2stg_sign2);

dffe_s #(1) i_a3stg_sign (
	.din	(a3stg_sign_in),
	.en     (a6stg_step),
        .clk    (rclk),

        .q      (a3stg_sign),

	.se     (se),
        .si     (),
        .so     ()
);

assign a2stg_cc_1= ((a2stg_sign2 && (!a2stg_2zero_in) && a2stg_sub)
			|| ((!a2stg_in2_eq_in1) && (!a2stg_sub)
				&& (a2stg_in2_gt_in1 ^ (!a2stg_sign2)))
			|| a2stg_nan_in)
		&& a2stg_fcmpop;

assign a2stg_cc_0= (((!a2stg_sign2) && (!a2stg_2zero_in) && a2stg_sub)
			|| ((!a2stg_in2_eq_in1) && (!a2stg_sub)
				&& (a2stg_in2_gt_in1 ^ a2stg_sign2))
			|| a2stg_nan_in)
		&& a2stg_fcmpop;

assign a2stg_cc[1:0]= {a2stg_cc_1, a2stg_cc_0};

dffe_s #(2) i_a3stg_cc (
	.din	(a2stg_cc[1:0]),
	.en     (a6stg_step),
        .clk    (rclk),

        .q      (a3stg_cc[1:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Add sign logic.
//
//      Add stage 3.
//
///////////////////////////////////////////////////////////////////////////////

assign a4stg_sign_in= (a3stg_f4cycop && a3stg_sign)
		|| ((!a3stg_f4cycop) && a4stg_sign2);

dffe_s #(1) i_a4stg_sign (
	.din	(a4stg_sign_in),
	.en     (a6stg_step),
        .clk    (rclk),

        .q      (a4stg_sign),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a4stg_sign2 (
	.din	(a3stg_sign),
	.en     (a6stg_step),
        .clk    (rclk),

        .q      (a4stg_sign2),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(2) i_a4stg_cc (
        .din    (a3stg_cc[1:0]),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a4stg_cc[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Add sign logic.
//
//      Add stage 4.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(1) i_add_sign_out (
	.din	(a4stg_sign),
	.en     (a6stg_step),
        .clk    (rclk),

        .q      (add_sign_out),

	.se     (se),
        .si     (),
        .so     ()
);

assign add_cc_out_in[1:0]= ({2{a4stg_fcmpop}}
			    & a4stg_cc[1:0]);

dffe_s #(2) i_add_cc_out (
	.din	(add_cc_out_in[1:0]),
	.en     (a6stg_step),
        .clk    (rclk),

        .q      (add_cc_out[1:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Add exception logic.
//
//      Add stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign a1stg_nv= (a1stg_faddsubop
			&& ((a1stg_2inf_in && a1stg_sub)
				|| a1stg_snan_in1
				|| a1stg_snan_in2))
		|| (a1stg_fstod && a1stg_snan_in2)
		|| (a1stg_fdtos && a1stg_snan_in2)
		|| (a1stg_fcmpesd && a1stg_nan_in)
		|| (a1stg_fcmpsd
			&& (a1stg_snan_in1 || a1stg_snan_in2));

dffe_s #(1) i_a2stg_nv (
	.din	(a1stg_nv),
	.en     (a6stg_step),
        .clk    (rclk),

        .q      (a2stg_nv),

        .se     (se),
        .si     (),
        .so     ()
);

assign a1stg_of_mask= (!(a1stg_faddsub_dtosop && a1stg_infnan_in));

dffe_s #(1) i_a2stg_of_mask (
        .din    (a1stg_of_mask),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a2stg_of_mask),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Add exception logic.
//
//      Add stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign a3stg_nv_in= ((!a2stg_expadd[11])
			&& a2stg_fsdtoix
			&& ((!a2stg_sign2)
				|| (|a2stg_expadd[10:0])
				|| a2stg_frac2hi_neq_0
				|| (a2stg_long_dst && a2stg_frac2lo_neq_0)))
		|| a2stg_nv;

dffe_s #(1) i_a3stg_nv (
	.din	(a3stg_nv_in),
	.en     (a6stg_step),
        .clk    (rclk),

        .q      (a3stg_nv),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a3stg_of_mask (
        .din    (a2stg_of_mask),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a3stg_of_mask),

        .se     (se),
        .si     (),
        .so     ()
);

assign a2stg_nx_tmp1= (a2stg_fdtoix && (|a2stg_exp[11:10]))
		|| (a2stg_fstoix && (|a2stg_exp[11:7]));

assign a2stg_nx_tmp2= ((a2stg_fdtoix && (!(|a2stg_exp[11:10])))
			|| (a2stg_fstoix && (!(|a2stg_exp[11:7]))))
		&& ((|a2stg_exp[10:1])
			|| a2stg_frac2hi_neq_0
			|| a2stg_frac2lo_neq_0
			|| a2stg_frac2_63);

assign a2stg_nx_tmp3= (a2stg_exp[11:0]==12'h41f)
		&& a2stg_sign2
		&& (!a2stg_frac2hi_neq_0)
		&& a2stg_frac2lo_neq_0
		&& a2stg_fdtoi;

dffe_s #(1) i_a3stg_a2_expadd_11 (
	.din	(a2stg_expadd[11]),
	.en	(a6stg_step),
	.clk	(rclk),

	.q	(a3stg_a2_expadd_11),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_a3stg_nx_tmp1 (
	.din	(a2stg_nx_tmp1),
	.en	(a6stg_step),
	.clk	(rclk),

	.q	(a3stg_nx_tmp1),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_a3stg_nx_tmp2 (
	.din	(a2stg_nx_tmp2),
	.en	(a6stg_step),
	.clk	(rclk),

	.q	(a3stg_nx_tmp2),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_a3stg_nx_tmp3 (
	.din	(a2stg_nx_tmp3),
	.en	(a6stg_step),
	.clk	(rclk),

	.q	(a3stg_nx_tmp3),

	.se	(se),
	.si	(),
	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Add exception logic.
//
//      Add stage 3.
//
///////////////////////////////////////////////////////////////////////////////

assign a3stg_nx= (a3stg_a2_expadd_11
		    && ((a3stg_nx_tmp1
				&& ((a3stg_fsdtoi_nx && a3stg_int_dst)
					|| a3stg_fsdtoix_nx))
			|| a3stg_nx_tmp2))
		|| a3stg_nx_tmp3;

assign a4stg_nv_in= ((a3stg_fadd && (!a3stg_fixtos_fxtod))
			&& a3stg_nv)
		|| ((!(a3stg_fadd && (!a3stg_fixtos_fxtod)))
			&& a4stg_nv2);
dffe_s #(1) i_a4stg_nv (
        .din    (a4stg_nv_in),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a4stg_nv),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a4stg_nv2 (
        .din    (a3stg_nv),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a4stg_nv2),
 
        .se     (se),
        .si     (),
        .so     ()
);

assign a4stg_of_mask_in= ((a3stg_fadd && (!a3stg_fixtos_fxtod))
                        && a3stg_of_mask)
		|| ((!(a3stg_fadd && (!a3stg_fixtos_fxtod)))
                        && a4stg_of_mask2);

dffe_s #(1) i_a4stg_of_mask (
        .din    (a4stg_of_mask_in),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a4stg_of_mask),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a4stg_of_mask2 (
        .din    (a3stg_of_mask),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a4stg_of_mask2),
 
        .se     (se),
        .si     (),
        .so     ()
);

assign a4stg_nx_in= ((a3stg_fadd && (!a3stg_fixtos_fxtod))
                        && a3stg_nx)
                || ((!(a3stg_fadd && (!a3stg_fixtos_fxtod)))
                        && a4stg_nx2);

dffe_s #(1) i_a4stg_nx (
        .din    (a4stg_nx_in),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a4stg_nx),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a4stg_nx2 (
        .din    (a3stg_nx),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a4stg_nx2),
 
        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Add exception logic.
//
//      Add stage 4.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(1) i_add_nv_out (
        .din    (a4stg_nv),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (add_nv_out),

        .se     (se),
        .si     (),
        .so     ()
);

assign a4stg_in_of= ((a4stg_exp[11] || (&a4stg_exp[10:0]))
			&& a4stg_faddsubd
			&& a4stg_of_mask)
		|| (((|a4stg_exp[11:8]) || (&a4stg_exp[7:0]))
			&& a4stg_faddsubs_fdtos
			&& a4stg_of_mask);

assign add_of_out_tmp1_in= ((&a4stg_exp[10:1]) && a4stg_rndup && a4stg_round
			&& a4stg_faddsubd
                        && a4stg_of_mask)
		|| ((&a4stg_exp[7:1]) && a4stg_rndup
			&& (a4stg_round || a4stg_fdtos)
			&& a4stg_faddsubs_fdtos
			&& a4stg_of_mask);

dffe_s #(1) i_add_of_out_tmp1 (
        .din    (add_of_out_tmp1_in),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (add_of_out_tmp1),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_add_of_out_tmp2 (
	.din	(a4stg_in_of),
        .en	(a6stg_step),
        .clk	(rclk),
 
        .q	(add_of_out_tmp2),
 
        .se	(se),
        .si	(),
        .so	()
);

assign add_of_out= add_of_out_tmp2
		|| (add_of_out_tmp1 && add_of_out_cout);

assign a4stg_uf= ((!(|a4stg_exp[10:0]))
			&& a4stg_frac_neq_0
			&& (a4stg_round || a4stg_fdtos)
			&& a4stg_faddsub_dtosop)
		|| (a4stg_faddsubop
			&& (!(a4stg_round || a4stg_fdtos))
			&& (!a4stg_denorm_inv)
			&& a4stg_shl_data_neq_0);

dffe_s #(1) i_add_uf_out (
        .din    (a4stg_uf),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (add_uf_out),

        .se     (se),
        .si     (),
        .so     ()
);

assign add_nx_out_in= (a4stg_of_mask
			&& a4stg_frac_dbl_nx
			&& (a4stg_faddsubd || a5stg_fxtod)
			&& ((!a4stg_faddsubd) || a4stg_round))
		|| (a4stg_of_mask
			&& a4stg_frac_sng_nx
			&& (a4stg_faddsubs_fdtos || a5stg_fixtos)
			&& ((!a4stg_faddsubs) || a4stg_round))
		|| a4stg_nx;

dffe_s #(1) i_add_nx_out (
        .din    (add_nx_out_in),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (add_nx_out),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Add pipe exception output.
//
///////////////////////////////////////////////////////////////////////////////

// Austin update
// Overflow is always accompanied by inexact.
// Previously this was handled within the FFU.

// assign add_exc_out[4:0]= {add_nv_out, add_of_out, add_uf_out, 1'b0, add_nx_out};

assign add_exc_out[4:0] =
  {add_nv_out,
   add_of_out,
   add_uf_out,
   1'b0,
   (add_nx_out || add_of_out)};  // Overflow is always accompanied by inexact

///////////////////////////////////////////////////////////////////////////////
//
//      Add pipeline control logic.
//
///////////////////////////////////////////////////////////////////////////////
 
///////////////////////////////////////////////////////////////////////////////
//
//      Select lines- add normalization and special input injection.
//
//	Add stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign a2stg_frac1_in_frac1= a1stg_snan_in2
		|| (a1stg_qnan_in2 && (!a1stg_snan_in1));

assign a2stg_frac1_in_frac2= a1stg_faddsubop
		&& ((!a1stg_2nan_in)
			|| a1stg_snan_in2
        		|| (a1stg_qnan_in2 && (!a1stg_snan_in1)));

assign a1stg_2nan_in_inv= (!a1stg_2nan_in);

assign a1stg_faddsubop_inv= (!a1stg_faddsubop);

assign a2stg_frac1_in_qnan= (a1stg_nan_in
			|| (a1stg_2inf_in && a1stg_sub))
		&& a1stg_faddsubop;

assign a2stg_frac1_in_nv= a1stg_2inf_in && a1stg_sub && a1stg_faddsubop;

assign a2stg_frac1_in_nv_dbl= a1stg_2inf_in && a1stg_sub && a1stg_faddsubd;

assign a2stg_frac2_in_frac1= a1stg_faddsubop && (!a1stg_infnan_in);

assign a2stg_frac2_in_qnan= a1stg_snan_in2 && (!a1stg_faddsubop);


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines and control logic- add pipe right shift count
//		count calculation.
//
//      Add stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign a1stg_exp_diff_add1= a1stg_faddsub_dtosop && (!a1stg_expadd1[11]);

assign a1stg_exp_diff_add2= a1stg_faddsubop && a1stg_expadd1[11];

assign a1stg_exp_diff_5= (!a1stg_expadd2[5]) && a1stg_fsdtox;

assign a1stg_exp_diff[10:0]= ({11{a1stg_exp_diff_add1}}
			    & a1stg_expadd1[10:0])
		| ({11{a1stg_exp_diff_add2}}
			    & (~a1stg_expadd4_inv[10:0]))
		| ({11{a1stg_fsdtoix}}
			    & {5'b0, a1stg_exp_diff_5, (~a1stg_expadd2[4:0])});

assign a1stg_clamp63[5:0]= a1stg_exp_diff[5:0] | {6{(|a1stg_exp_diff[10:6])}};

assign a2stg_shr_cnt_in[5:0]= a1stg_clamp63[5:0];

assign a2stg_shr_cnt_5_inv_in= (!a1stg_clamp63[5]);


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines- add pipe right shift.
//
//      Add stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign a2stg_shr_frac2_shr_int= a2stg_faddsub_dtosop && a6stg_step;

assign a2stg_shr_frac2_shr_dbl= ((a2stg_fdtox && (|a2stg_exp[11:10]))
			|| (a2stg_fstox && (|a2stg_exp[11:7])))
		&& a6stg_step;

assign a2stg_shr_frac2_shr_sng= ((a2stg_fdtoi && (|a2stg_exp[11:10]))
			|| (a2stg_fstoi && (|a2stg_exp[11:7])))
		&& a6stg_step;

assign a2stg_shr_frac2_max= a2stg_fsdtoix && a6stg_step;

assign a2stg_sub_step= a2stg_sub && a6stg_step;


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines- add pipe adder.
//
//      Add stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign a1stg_faddsub_clamp63_0= (|(({6{a1stg_expadd1[11]}}
			    & (~{a1stg_expadd4_inv[10:6],
						a1stg_expadd4_inv[0]}))
		| ({6{(!a1stg_expadd1[11])}}
			    & {a1stg_expadd1[10:6], a1stg_expadd1[0]})));

assign a2stg_fracadd_frac2_inv_in= (a1stg_fixtosd && a1stg_in2_63)
		|| (a1stg_faddsubop && a1stg_sub
			&& (!a1stg_faddsub_clamp63_0));

assign a2stg_fracadd_frac2_inv_shr1_in= a1stg_faddsubop && a1stg_sub
			&& a1stg_faddsub_clamp63_0;

assign a2stg_fracadd_frac2_in= (a1stg_fixtosd && (!a1stg_in2_63))
		|| a1stg_fstod
		|| (a1stg_faddsubop && (!a1stg_sub));

dffe_s #(1) i_a2stg_fracadd_frac2 (
	.din	(a2stg_fracadd_frac2_in),
	.en	(a6stg_step),
	.clk	(rclk),

	.q	(a2stg_fracadd_frac2),

	.se	(se),
	.si	(),
	.so   	()
);

assign a2stg_fracadd_cin_in= (a1stg_fixtosd && a1stg_in2_63)
		|| (a1stg_faddsubop && a1stg_sub);


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines- add pipe exponent adjustment.
//
//      Add stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign a3stg_exp_7ff= a2stg_fstod && (&a2stg_exp[7:0]);

assign a3stg_exp_ff= a2stg_fdtos && (&a2stg_exp[10:0]);

assign a3stg_exp_add= (a2stg_fstod && (!(&a2stg_exp[7:0])))
		|| (a2stg_fdtos && (!(&a2stg_exp[10:0])));


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines- add pipe exponent decode- used to identify denorm results.
//
//      Add stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign a2stg_expdec_neq_0= a2stg_faddsubop && (a2stg_exp[10:0]<11'h36);


///////////////////////////////////////////////////////////////////////////////
//
//	Select lines and control logic
//		- add pipe main adder
//		- add pipe exponent increment/decrement adjustment
//
//      Add stage 3.
//
///////////////////////////////////////////////////////////////////////////////

assign a3stg_exp10_0_eq0= (a3stg_exp[10:0]==11'b0);

assign a3stg_exp10_1_eq0= (a3stg_exp[10:1]==10'b0);

assign a3stg_fdtos_inv= (!a3stg_fdtos);

assign a4stg_fixtos_fxtod_inv= (!a4stg_fixtos_fxtod);

assign a4stg_rnd_frac_add_inv= (!(a3stg_fsdtoix
		|| (a3stg_faddsubop && a3stg_exp10_0_eq0)));


///////////////////////////////////////////////////////////////////////////////
//
//	Control logic- add pipe left shift count.
//
//      Add stage 3.
//
///////////////////////////////////////////////////////////////////////////////

assign a4stg_shl_cnt_in[9:0]= ({10{a3stg_denorm}}
			    & {(a3stg_exp[5:4]==2'b11),
				(a3stg_exp[5:4]==2'b10),
				(a3stg_exp[5:4]==2'b01),
				(a3stg_exp[5:4]==2'b00),
				a3stg_exp[5:0]})
		| ({10{a3stg_denorm_inv}}
			    & {(a3stg_lead0[5:4]==2'b11),
				(a3stg_lead0[5:4]==2'b10),
				(a3stg_lead0[5:4]==2'b01),
				(a3stg_lead0[5:4]==2'b00),
				a3stg_lead0[5:0]});


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines and control logic- add pipe rounding adder.
//
//      Add stage 4.
//
///////////////////////////////////////////////////////////////////////////////

assign a4stg_rnd_sng= a5stg_fixtos || a4stg_faddsubs_fdtos;

assign a4stg_rnd_dbl= a5stg_fxtod || a4stg_faddsubd;

	
///////////////////////////////////////////////////////////////////////////////
//
//      Select lines and control logic- add pipe fraction output.
//
//      Add stage 4.
//
///////////////////////////////////////////////////////////////////////////////

assign a4stg_rndup_sng= ((a4stg_rnd_mode==2'b10) && (!a4stg_sign)
			&& a4stg_frac_sng_nx)
		|| ((a4stg_rnd_mode==2'b11) && a4stg_sign
			&& a4stg_frac_sng_nx)
		|| ((a4stg_rnd_mode==2'b00) && a4stg_rnd_frac_39
			&& (a4stg_frac_38_0_nx || a4stg_rnd_frac_40));

assign a4stg_rndup_dbl= ((a4stg_rnd_mode==2'b10) && (!a4stg_sign)
                        && a4stg_frac_dbl_nx)
                || ((a4stg_rnd_mode==2'b11) && a4stg_sign
                        && a4stg_frac_dbl_nx)
                || ((a4stg_rnd_mode==2'b00) && a4stg_rnd_frac_10
			&& (a4stg_frac_9_0_nx || a4stg_rnd_frac_11));

assign a4stg_rndup= (a4stg_faddsubd && a4stg_rndup_dbl)
		|| (a4stg_faddsubs && a4stg_rndup_sng)
		|| (a4stg_fdtos && a4stg_rndup_sng && a4stg_of_mask);

assign a5stg_rndup= (a5stg_fxtod && a4stg_rndup_dbl)
		|| (a5stg_fixtos && a4stg_rndup_sng);

assign add_frac_out_rndadd= (a4stg_faddsubop && a4stg_round && a4stg_rndup
			&& (!a4stg_in_of))
		|| (a4stg_fdtos && a4stg_rndup && (!a4stg_in_of))
		|| (a5stg_fixtos_fxtod && a5stg_rndup);

assign add_frac_out_rnd_frac= (a4stg_faddsubop && a4stg_round && (!a4stg_rndup)
			&& (!a4stg_in_of))
		|| (a4stg_fdtos && (!a4stg_rndup) && (!a4stg_in_of))
		|| (a5stg_fixtos_fxtod && (!a5stg_rndup))
		|| a4stg_fsdtoix;

assign add_frac_out_shl= (a4stg_faddsubop && (!a4stg_round) && (!a4stg_in_of))
		|| a4stg_fistod;

assign a4stg_to_0= (!((a4stg_rnd_mode==2'b00)
			|| ((a4stg_rnd_mode==2'b10) && (!a4stg_sign))
			|| ((a4stg_rnd_mode==2'b11) && a4stg_sign)));


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines and control logic- add pipe exponent output.
//
//      Add stage 4.
//
///////////////////////////////////////////////////////////////////////////////

assign add_exp_out_expinc= (a4stg_faddsubop && a4stg_round && a4stg_rndup
			&& (!a4stg_in_of))
		|| (a4stg_fdtos && a4stg_rndup
			&& (!a4stg_in_of))
		|| (a5stg_fixtos_fxtod && a5stg_rndup);

assign add_exp_out_exp= (a4stg_faddsubop && a4stg_round
			&& (!a4stg_in_of))
		|| (a4stg_fdtos
			&& (!a4stg_in_of))
		|| a5stg_fixtos_fxtod;

assign add_exp_out_exp1= (a4stg_faddsubop && a4stg_round
			&& (!a4stg_rndup)
			&& (!a4stg_in_of))
		|| (a4stg_fdtos
			&& (!a4stg_rndup)
			&& (!a4stg_in_of))
		|| (a5stg_fixtos_fxtod
			&& (!a5stg_rndup));

assign add_exp_out_expadd= (a4stg_faddsubop && (!a4stg_round) && (!a4stg_in_of))
		|| a4stg_fistod;

assign a4stg_to_0_inv= (!a4stg_to_0);


endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_add_exp_dp.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//	Add pipeline exponent datapath.
//
//  Patches by    : John Li
///////////////////////////////////////////////////////////////////////////////
//PITON_PROTO enables all FPGA related modifications





module fpu_add_exp_dp (
	inq_in1,
	inq_in2,
	inq_op,
	inq_op_7,
	a1stg_step,
	a1stg_faddsubd,
	a1stg_faddsubs,
	a1stg_fsdtoix,
	a6stg_step,
	a1stg_fstod,
	a1stg_fdtos,
	a1stg_fstoi,
	a1stg_fstox,
	a1stg_fdtoi,
	a1stg_fdtox,
	a2stg_fsdtoix_fdtos,
	a2stg_faddsubop,
	a2stg_fitos,
	a2stg_fitod,
	a2stg_fxtos,
	a2stg_fxtod,
	a3stg_exp_7ff,
	a3stg_exp_ff,
	a3stg_exp_add,
	a3stg_inc_exp_inv,
	a3stg_same_exp_inv,
	a3stg_dec_exp_inv,
	a3stg_faddsubop,
	a3stg_fdtos_inv,
	a4stg_fixtos_fxtod_inv,
	a4stg_shl_cnt,
	a4stg_denorm_inv,
	a4stg_rndadd_cout,
	add_exp_out_expinc,
	add_exp_out_exp,
	add_exp_out_exp1,
	a4stg_in_of,
	add_exp_out_expadd,
	a4stg_dblop,
	a4stg_to_0_inv,
	fadd_clken_l,
	rclk,
	
	a1stg_expadd3_11,
	a1stg_expadd1_11_0,
	a1stg_expadd4_inv,
	a1stg_expadd2_5_0,
	a2stg_exp,
	a2stg_expadd,
	a3stg_exp_10_0,
	a4stg_exp_11_0,
	add_exp_out,

	se,
	si,
	so
);


input [62:52]	inq_in1;		// request operand 1 to op pipes
input [62:52]	inq_in2;		// request operand 2 to op pipes
input [1:0]	inq_op;			// request opcode[1:0]
input		inq_op_7;		// request opcode[7]
input		a1stg_step;		// add pipe load
input		a1stg_faddsubd;		// add/subtract double- add 1 stg
input		a1stg_faddsubs;		// add/subtract single- add 1 stg
input		a1stg_fsdtoix;		// float to integer convert- add 1 stg
input		a6stg_step;		// advance the add pipe
input		a1stg_fstod;		// fstod- add 1 stage
input		a1stg_fdtos;		// fdtos- add 1 stage
input		a1stg_fstoi;		// fstoi- add 1 stage
input		a1stg_fstox;		// fstox- add 1 stage
input		a1stg_fdtoi;		// fdtoi- add 1 stage
input		a1stg_fdtox;		// fdtox- add 1 stage
input		a2stg_fsdtoix_fdtos;	// float to integer convert- add 2 stg
input		a2stg_faddsubop;	// float add or subtract- add 2 stage
input		a2stg_fitos;		// fitos- add 2 stage
input		a2stg_fitod;		// fitod- add 2 stage
input		a2stg_fxtos;		// fxtos- add 2 stage
input		a2stg_fxtod;		// fxtod- add 2 stage
input		a3stg_exp_7ff;		// select line to a3stg_exp
input		a3stg_exp_ff;		// select line to a3stg_exp
input		a3stg_exp_add;		// select line to a3stg_exp
input		a3stg_inc_exp_inv;	// increment the exponent- add 3 stg
input		a3stg_same_exp_inv;	// keep the exponent- add 3 stg
input		a3stg_dec_exp_inv;	// decrement the exponent- add 3 stg
input		a3stg_faddsubop;	// add/subtract- add 3 stage
input		a3stg_fdtos_inv;	// double to single convert- add 3 stg
input		a4stg_fixtos_fxtod_inv;	// int to single/double cvt- add 4 stg
input [5:0]	a4stg_shl_cnt;		// postnorm shift left count- add 4 stg
input		a4stg_denorm_inv;	// 0 the exponent
input		a4stg_rndadd_cout;	// fraction rounding adder carry out
input		add_exp_out_expinc;	// select line to add_exp_out
input		add_exp_out_exp;	// select line to add_exp_out
input		add_exp_out_exp1;	// select line to add_exp_out
input		a4stg_in_of;		// add overflow- select exp out
input		add_exp_out_expadd;	// select line to add_exp_out
input		a4stg_dblop;		// double precision operation- add 4 stg
input		a4stg_to_0_inv;		// result to infinity on overflow
input		fadd_clken_l;           // add pipe clk enable - asserted low
input		rclk;		// global clock

output        	a1stg_expadd3_11;	// exponent adder 3 output- add 1 stage
output [11:0]	a1stg_expadd1_11_0;	// exponent adder 1 output- add 1 stage
output [10:0]	a1stg_expadd4_inv;	// exponent adder 4 output- add 1 stage
output [5:0]	a1stg_expadd2_5_0;	// exponent adder 2 output- add 1 stage
output [11:0]	a2stg_exp;		// exponent- add 2 stage
output [12:0]	a2stg_expadd;		// exponent adder- add 2 stage
output [10:0]	a3stg_exp_10_0;		// exponent adder- add 3 stage
output [11:0]	a4stg_exp_11_0;		// exponent adder- add 4 stage
output [10:0]	add_exp_out;		// add exponent output

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


wire [62:52]	a1stg_in1;
wire [62:52]	a1stg_in1a;
wire [62:52]	a1stg_in2;
wire [62:52]	a1stg_in2a;
wire [12:0]	a1stg_dp_sngop;
wire [12:0]	a1stg_dp_sngopa;
wire [12:0]	a1stg_dp_dblop;
wire [12:0]	a1stg_dp_dblopa;
wire [9:7]      a1stg_op_7;
wire            a1stg_op_7_0;
wire [10:0]	a1stg_expadd3_in1;
wire [10:0]	a1stg_expadd3_in2_in;
wire [10:0]	a1stg_expadd3_in2;
wire [12:0]	a1stg_expadd3;
wire            a1stg_expadd3_11;
wire [12:0]	a1stg_expadd1_in1;
wire [12:0]	a1stg_expadd1_in2;
wire [12:0]	a1stg_expadd1;
wire [11:0]     a1stg_expadd1_11_0;
wire [12:0]	a1stg_expadd4_in1;
wire [12:0]	a1stg_expadd4_in2;
wire [12:0]	a1stg_expadd4;
wire [10:0]	a1stg_expadd4_inv;
wire [12:0]	a1stg_expadd2_in1;
wire [12:0]	a1stg_expadd2;
wire [5:0]      a1stg_expadd2_5_0;
wire [12:0]	a2stg_exp_in;
wire [11:0]	a2stg_exp;
wire [12:0]	a2stg_expa;
wire [12:0]	a2stg_expadd_in2_in;
wire [12:0]	a2stg_expadd_in2;
wire [12:0]	a2stg_expadd;
wire [12:0]	a3stg_exp_in;
wire [12:0]	a3stg_exp;
wire [10:0]     a3stg_exp_10_0;
wire [12:0]	a3stg_exp_plus1;
wire [12:0]	a3stg_exp_minus1;
wire [12:0]	a4stg_exp_pre1_in;
wire [12:0]	a4stg_exp_pre1;
wire [12:0]	a4stg_exp_pre3_in;
wire [12:0]	a4stg_exp_pre3;
wire [12:0]	a4stg_exp_pre2_in;
wire [12:0]	a4stg_exp_pre2;
wire [12:0]	a4stg_exp_pre4_in;
wire [12:0]	a4stg_exp_pre4;
wire [12:0]	a4stg_exp;
wire [11:0]	a4stg_exp_11_0;
wire [12:0]	a4stg_exp2;
wire [12:0]	a4stg_expinc;
wire [12:0]	a4stg_expadd_in2;
wire [12:0]	a4stg_expadd;
wire [12:0]	a4stg_expshl;
wire [10:0]	add_exp_out_in1;
wire [10:0]	add_exp_out1;
wire [10:0]	add_exp_out_in2;
wire [10:0]	add_exp_out2;
wire [10:0]	add_exp_out_in3;
wire [10:0]	add_exp_out3;
wire [10:0]	add_exp_out4;
wire [10:0]	add_exp_out;

//Previously missing wires
wire        clk;

// 6/23/03: Removed tm_l input port. Using locally generated se_l instead for cken_buf 
wire se_l;

assign se_l = ~se;




    clken_buf  ckbuf_add_exp_dp (
      .clk(clk),
      .rclk(rclk),
      .enb_l(fadd_clken_l),
      .tmb_l(se_l)
      );


///////////////////////////////////////////////////////////////////////////////
//
//	Add exponent inputs.
//
//	Add input stage.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(11) i_a1stg_in1 (
        .din    (inq_in1[62:52]),
        .en     (a1stg_step),
        .clk    (clk),
 
        .q      (a1stg_in1[62:52]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(11) i_a1stg_in1a (
	.din	(inq_in1[62:52]),
	.en	(a1stg_step),
	.clk	(clk),

	.q	(a1stg_in1a[62:52]),

	.se	(se),
        .si	(),
        .so	()
);

dffe_s #(11) i_a1stg_in2 (
	.din	(inq_in2[62:52]),
	.en	(a1stg_step),
	.clk	(clk),

	.q	(a1stg_in2[62:52]),

	.se	(se),
	.si	(),
   	.so	()
);

dffe_s #(11) i_a1stg_in2a (
        .din	(inq_in2[62:52]),
        .en	(a1stg_step),
        .clk	(clk),
 
        .q	(a1stg_in2a[62:52]),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(13) i_a1stg_dp_sngop (
	.din	({13{inq_op[0]}}),
	.en	(a1stg_step),
	.clk	(clk),

	.q	(a1stg_dp_sngop[12:0]),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(13) i_a1stg_dp_sngopa (
        .din	({13{inq_op[0]}}),
        .en	(a1stg_step),
        .clk	(clk),
 
        .q	(a1stg_dp_sngopa[12:0]),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(13) i_a1stg_dp_dblop (
	.din	({13{inq_op[1]}}),
	.en	(a1stg_step),
	.clk	(clk),

	.q	(a1stg_dp_dblop[12:0]),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(13) i_a1stg_dp_dblopa (
	.din	({13{inq_op[1]}}),
	.en	(a1stg_step),
	.clk	(clk),

	.q	(a1stg_dp_dblopa[12:0]),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(4) i_a1stg_op_7 (
	.din	({4{inq_op_7}}),
	.en	(a1stg_step),
	.clk	(clk),

	.q	({a1stg_op_7[9:7], a1stg_op_7_0}),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(11) i_a1stg_expadd3_in1 (
	.din	(inq_in1[62:52]),
	.en	(a1stg_step),
	.clk	(clk),

	.q	(a1stg_expadd3_in1[10:0]),

	.se	(se),
	.si	(),
	.so	()
);

assign a1stg_expadd3_in2_in[10:0]= (~(inq_in2[62:52] 
		& {8'hff, {3{inq_op[1]}}}));

dffe_s #(11) i_a1stg_expadd3_in2 (
	.din	(a1stg_expadd3_in2_in[10:0]),
	.en	(a1stg_step),
	.clk	(clk),

	.q	(a1stg_expadd3_in2[10:0]),

	.se	(se),
	.si	(),
	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Add pipe exponent comparison.
//
//	Add stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign a1stg_expadd3[12:0]= ({2'b00, a1stg_expadd3_in1[10:0]}
			+ {2'b11, a1stg_expadd3_in2[10:0]}
			+ 13'h0001);
assign a1stg_expadd3_11 = a1stg_expadd3[11];


assign a1stg_expadd1_in1[12:0]= (a1stg_dp_dblopa
			    & {2'b0, a1stg_in1[62:52]})
		| (a1stg_dp_sngopa
			    & {5'b0, a1stg_in1[62:55]})
		| {3'b0, a1stg_op_7[9:7], 6'b0, a1stg_op_7_0};

assign a1stg_expadd1_in2[12:0]= (~((a1stg_dp_dblop
			    & {2'b0, a1stg_in2[62:52]})
		| (a1stg_dp_sngop
			    & {5'b0, a1stg_in2[62:55]})));

assign a1stg_expadd1[12:0]= (a1stg_expadd1_in1[12:0]
			+ a1stg_expadd1_in2[12:0]
			+ 13'h0001);
assign a1stg_expadd1_11_0[11:0] = a1stg_expadd1[11:0];

assign a1stg_expadd4_in1[12:0]= (a1stg_dp_dblopa
			    & {2'b0, a1stg_in2a[62:52]})
                | (a1stg_dp_sngopa
			    & {5'b0, a1stg_in2a[62:55]});

assign a1stg_expadd4_in2[12:0]= (~((a1stg_dp_dblop
                            & {2'b0, a1stg_in1a[62:52]})
		| (a1stg_dp_sngop
			    & {5'b0, a1stg_in1a[62:55]})));

assign a1stg_expadd4[12:0]= (a1stg_expadd4_in1[12:0]
			+ a1stg_expadd4_in2[12:0]
			+ 13'h0001);
assign a1stg_expadd4_inv[10:0]= (~a1stg_expadd4[10:0]);

assign a1stg_expadd2_in1[12:0]= (a1stg_dp_dblopa
			    & {2'b0, a1stg_in2a[62:52]})
                | (a1stg_dp_sngopa
			    & {5'b0, a1stg_in2a[62:55]});

assign a1stg_expadd2[12:0]= (a1stg_expadd2_in1[12:0]
			+ 13'h0001);
assign a1stg_expadd2_5_0[5:0] = a1stg_expadd2[5:0];

assign a2stg_exp_in[12:0]= ({13{(a1stg_faddsubd && (!a1stg_expadd1[12]))}}
			    & {2'b0, a1stg_in1a[62:52]})
		| ({13{(a1stg_faddsubs && (!a1stg_expadd1[12]))}}
			    & {5'b0, a1stg_in1a[62:55]})
		| ({13{(a1stg_faddsubd && a1stg_expadd1[12])}}
			    & {2'b0, a1stg_in2[62:52]})
		| ({13{a1stg_fdtos}}
			    & {2'b0, a1stg_in2[62:52]})
		| ({13{(a1stg_faddsubs && a1stg_expadd1[12])}}
			    & {5'b0, a1stg_in2[62:55]})
		| ({13{a1stg_fstod}}
			    & {5'b0, a1stg_in2[62:55]})
		| ({13{a1stg_fsdtoix}}
			    & a1stg_expadd2[12:0]);

dffe_s #(12) i_a2stg_exp (
	.din	(a2stg_exp_in[11:0]),
	.en     (a6stg_step),
        .clk    (clk),
 
        .q      (a2stg_exp[11:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(13) i_a2stg_expa (
	.din	(a2stg_exp_in[12:0]),
	.en	(a6stg_step),
	.clk	(clk),

	.q	(a2stg_expa[12:0]),

	.se	(se),
	.si	(),
	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Add pipe exponent adjustment.
//
//      Add stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign a2stg_expadd_in2_in[12:0]= ({13{a1stg_fstod}}
			    & 13'h0380)
		| ({13{a1stg_fdtos}}
			    & (~13'h0380))
		| ({13{a1stg_fstoi}}
			    & (~13'h009f))
		| ({13{a1stg_fstox}}
			    & (~13'h00bf))
		| ({13{a1stg_fdtoi}}
			    & (~13'h041f))
		| ({13{a1stg_fdtox}}
			    & (~13'h043f));

dffe_s #(13) i_a2stg_expadd2_in2 (
        .din	(a2stg_expadd_in2_in[12:0]),
        .en	(a6stg_step),
        .clk	(clk),
 
        .q	(a2stg_expadd_in2[12:0]),
 
        .se	(se),
        .si	(),
        .so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Add pipe exponent adjustment.
//
//	Add stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign a2stg_expadd[12:0]= (a2stg_expa[12:0]
			+ a2stg_expadd_in2[12:0]
			+ {12'b0, a2stg_fsdtoix_fdtos});

assign a3stg_exp_in[12:0]= ({13{a2stg_faddsubop}}
			    & a2stg_expa[12:0])
		| ({13{a2stg_fitos}}
			    & 13'h009e)
		| ({13{a2stg_fitod}}
			    & 13'h041e)
		| ({13{a2stg_fxtos}}
			    & 13'h00be)
		| ({13{a2stg_fxtod}}
			    & 13'h043e)
		| ({13{a3stg_exp_7ff}}
			    & 13'h07ff)
		| ({13{a3stg_exp_ff}}
			    & 13'h00ff)
		| ({13{a3stg_exp_add}}
			    & (a2stg_expadd[12:0] & {13{(!a2stg_expadd[11])}}));

dffe_s #(13) i_a3stg_exp (
        .din    (a3stg_exp_in[12:0]),
        .en     (a6stg_step),
        .clk    (clk),
 
        .q      (a3stg_exp[12:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);

assign a3stg_exp_10_0[10:0] = a3stg_exp[10:0];



///////////////////////////////////////////////////////////////////////////////
//
//      Add pipe exponent increment/decrement adjustment.
//
//      Add stage 3.
//
///////////////////////////////////////////////////////////////////////////////

assign a3stg_exp_plus1[12:0]= a3stg_exp[12:0] + 13'h0001;

assign a3stg_exp_minus1[12:0]= a3stg_exp[12:0] - 13'h0001;

assign a4stg_exp_pre1_in[12:0]= ({13{(a3stg_faddsubop && a6stg_step
					&& (!a3stg_inc_exp_inv))}}
			    & a3stg_exp_plus1[12:0]);

dff_s #(13) i_a4stg_exp_pre1 (
	.din	(a4stg_exp_pre1_in[12:0]),
	.clk	(clk),

	.q	(a4stg_exp_pre1[12:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign a4stg_exp_pre3_in[12:0]= ({13{(a3stg_faddsubop && a6stg_step
					&& (!a3stg_dec_exp_inv))}}
			    & a3stg_exp_minus1[12:0]);

dff_s #(13) i_a4stg_exp_pre3 (
	.din	(a4stg_exp_pre3_in[12:0]),
	.clk	(clk),

	.q	(a4stg_exp_pre3[12:0]),

	.se	(se),
	.si	(),
	.so	()
);

assign a4stg_exp_pre2_in[12:0]= ({13{((!a3stg_fdtos_inv) && a6stg_step)}}
			    & a3stg_exp[12:0])
		| ({13{((!a4stg_fixtos_fxtod_inv) && a6stg_step)}}
			    & a4stg_expshl[12:0])
		| ({13{(!a6stg_step)}}
			    & a4stg_exp[12:0]);

dff_s #(13) i_a4stg_exp_pre2 (
	.din	(a4stg_exp_pre2_in[12:0]),
        .clk    (clk),

        .q      (a4stg_exp_pre2[12:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign a4stg_exp_pre4_in[12:0]= ({13{(a3stg_faddsubop && a6stg_step
					&& (!a3stg_same_exp_inv))}}
			    & a3stg_exp[12:0]);

dff_s #(13) i_a4stg_exp_pre4 (
	.din	(a4stg_exp_pre4_in[12:0]),
	.clk	(clk),

	.q	(a4stg_exp_pre4[12:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(13) i_a4stg_exp2 (
	.din	(a3stg_exp[12:0]),
	.en     (a6stg_step),
        .clk    (clk),

        .q      (a4stg_exp2[12:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Add pipe exponent rounding increment.
//
//      Add stage 4.
//
///////////////////////////////////////////////////////////////////////////////

assign a4stg_exp[12:0]= (a4stg_exp_pre1[12:0]
		| a4stg_exp_pre2[12:0]
		| a4stg_exp_pre3[12:0]
		| a4stg_exp_pre4[12:0]);

assign a4stg_exp_11_0[11:0] = a4stg_exp[11:0];

assign a4stg_expinc[12:0]= a4stg_exp[12:0] + 13'h0001;


///////////////////////////////////////////////////////////////////////////////
//
//      Add pipe exponent adjustment for post normalization left shift.
//
//      Add stage 4.
//
///////////////////////////////////////////////////////////////////////////////

assign a4stg_expadd_in2[12:0]= (~{7'b0, a4stg_shl_cnt[5:0]});

assign a4stg_expadd[12:0]= (a4stg_exp2[12:0]
			+ a4stg_expadd_in2[12:0]
			+ 13'h0001);


///////////////////////////////////////////////////////////////////////////////
//
//      Add pipe exponent output.
//
//      Add stage 4.
//
///////////////////////////////////////////////////////////////////////////////

assign a4stg_expshl[12:0]= (a4stg_expadd[12:0] & {13{a4stg_denorm_inv}});

assign add_exp_out_in1[10:0]= (~(({11{add_exp_out_exp1}}
			    & a4stg_exp[10:0])
		| ({11{a4stg_in_of}}
			    & {{3{a4stg_dblop}}, 7'h7f, a4stg_to_0_inv})
		| ({11{add_exp_out_expadd}}
			    & a4stg_expshl[10:0])));

dffe_s #(11) i_add_exp_out1 (
	.din	(add_exp_out_in1[10:0]),
	.en     (a6stg_step),
        .clk    (clk),

        .q      (add_exp_out1[10:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign add_exp_out_in2[10:0]= (~({11{(add_exp_out_expinc
					&& a4stg_rndadd_cout)}}
			    & a4stg_expinc[10:0]));

dffe_s #(11) i_add_exp_out2 (
	.din	(add_exp_out_in2[10:0]),
	.en	(a6stg_step),
	.clk	(clk),

	.q	(add_exp_out2[10:0]),

	.se  	(se),
	.si	(),
	.so	()
);

assign add_exp_out_in3[10:0]= (~({11{add_exp_out_exp}}
			    & a4stg_exp[10:0]));

dffe_s #(11) i_add_exp_out3 (
	.din	(add_exp_out_in3[10:0]),
	.en	(a6stg_step),
	.clk	(clk),

	.q	(add_exp_out3[10:0]),

	.se  	(se),
	.si	(),
	.so	()
);

dffe_s #(11) i_add_exp_out4 (
	.din	({11{a4stg_rndadd_cout}}),
	.en	(a6stg_step),
	.clk	(clk),

	.q	(add_exp_out4[10:0]),

	.se  	(se),
	.si	(),
	.so	()
);

assign add_exp_out[10:0]= (~(add_exp_out1[10:0]
		& add_exp_out2[10:0]
		& (add_exp_out3[10:0] | add_exp_out4[10:0])));


endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_add_frac_dp.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//	Add pipeline fraction datapath.
//
//  Patches by    : John Li
///////////////////////////////////////////////////////////////////////////////
//PITON_PROTO enables all FPGA related modifications





module fpu_add_frac_dp (
	inq_in1,
	inq_in2,
	a1stg_step,
	a1stg_sngop,
	a1stg_expadd3_11,
	a1stg_norm_dbl_in1,
	a1stg_denorm_dbl_in1,
	a1stg_norm_sng_in1,
	a1stg_denorm_sng_in1,
	a1stg_norm_dbl_in2,
	a1stg_denorm_dbl_in2,
	a1stg_norm_sng_in2,
	a1stg_denorm_sng_in2,
	a1stg_intlngop,
	a2stg_frac1_in_frac1,
	a2stg_frac1_in_frac2,
	a1stg_2nan_in_inv,
	a1stg_faddsubop_inv,
	a2stg_frac1_in_qnan,
	a2stg_frac1_in_nv,
	a2stg_frac1_in_nv_dbl,
	a6stg_step,
	a2stg_frac2_in_frac1,
	a2stg_frac2_in_qnan,
	a2stg_shr_cnt_in,
	a2stg_shr_cnt_5_inv_in,
	a2stg_shr_frac2_shr_int,
	a2stg_shr_frac2_shr_dbl,
	a2stg_shr_frac2_shr_sng,
	a2stg_shr_frac2_max,
	a2stg_expadd_11,
	a2stg_sub_step,
	a2stg_fracadd_frac2_inv_in,
	a2stg_fracadd_frac2_inv_shr1_in,
	a2stg_fracadd_frac2,
	a2stg_fracadd_cin_in,
	a2stg_exp,
	a2stg_expdec_neq_0,
	a3stg_faddsubopa,
	a3stg_sub_in,
	a3stg_exp10_0_eq0,
	a3stg_exp10_1_eq0,
	a3stg_exp_0,
	a4stg_rnd_frac_add_inv,
	a3stg_fdtos_inv,
	a4stg_fixtos_fxtod_inv,
	a4stg_rnd_sng,
	a4stg_rnd_dbl,
	a4stg_shl_cnt_in,
	add_frac_out_rndadd,
	add_frac_out_rnd_frac,
	a4stg_in_of,
	add_frac_out_shl,
	a4stg_to_0,
	fadd_clken_l,
	rclk,
	
	a1stg_in2_neq_in1_frac,
	a1stg_in2_gt_in1_frac,
	a1stg_in2_eq_in1_exp,
	a2stg_frac2_63,
	a2stg_frac2hi_neq_0,
	a2stg_frac2lo_neq_0,
	a3stg_fsdtoix_nx,
	a3stg_fsdtoi_nx,
	a3stg_denorm,
	a3stg_denorm_inv,
	a3stg_lead0,
	a4stg_round,
	a4stg_shl_cnt,
	a4stg_denorm_inv,
	a3stg_inc_exp_inv,
	a3stg_same_exp_inv,
	a3stg_dec_exp_inv,
	a4stg_rnd_frac_40,
	a4stg_rnd_frac_39,
	a4stg_rnd_frac_11,
	a4stg_rnd_frac_10,
	a4stg_rndadd_cout,
	a4stg_frac_9_0_nx,
	a4stg_frac_dbl_nx,
	a4stg_frac_38_0_nx,
	a4stg_frac_sng_nx,
	a4stg_frac_neq_0,
	a4stg_shl_data_neq_0,
	add_of_out_cout,
	add_frac_out,

	se,
        si,
        so
);


input [62:0]	inq_in1;		// request operand 1 to op pipes
input [63:0]	inq_in2;		// request operand 2 to op pipes
input		a1stg_step;		// add pipe load
input		a1stg_sngop;		// single precision operation- add 1 stg
input		a1stg_expadd3_11;	// exponent adder sign out- add 1 stg
input		a1stg_norm_dbl_in1;	// select line to normalized fraction 1
input		a1stg_denorm_dbl_in1;	// select line to normalized fraction 1
input		a1stg_norm_sng_in1;	// select line to normalized fraction 1
input		a1stg_denorm_sng_in1;	// select line to normalized fraction 1
input		a1stg_norm_dbl_in2;	// select line to normalized fraction 2
input		a1stg_denorm_dbl_in2;	// select line to normalized fraction 2
input		a1stg_norm_sng_in2;	// select line to normalized fraction 2
input		a1stg_denorm_sng_in2;	// select line to normalized fraction 2
input		a1stg_intlngop;		// integer/long input- add 1 stage
input		a2stg_frac1_in_frac1;	// select line to a2stg_frac1
input		a2stg_frac1_in_frac2;	// select line to a2stg_frac1
input		a1stg_2nan_in_inv;	// 2 NaN inputs- a1 stage
input		a1stg_faddsubop_inv;	// add/subtract- a1 stage
input		a2stg_frac1_in_qnan;	// make fraction 1 a QNaN
input		a2stg_frac1_in_nv;	// NV- make a new prec QNaN
input		a2stg_frac1_in_nv_dbl;	// NV- make a new double prec QNaN
input		a6stg_step;		// advance the add pipe
input		a2stg_frac2_in_frac1;	// select line to a2stg_frac2
input		a2stg_frac2_in_qnan;	// make fraction 2 a QNaN
input [5:0]	a2stg_shr_cnt_in;	// right shift count input- add 1 stage
input		a2stg_shr_cnt_5_inv_in;	// right shift count input[5]- add 1 stg
input		a2stg_shr_frac2_shr_int; // select line to a3stg_frac2
input		a2stg_shr_frac2_shr_dbl; // select line to a3stg_frac2
input		a2stg_shr_frac2_shr_sng; // select line to a3stg_frac2
input		a2stg_shr_frac2_max;	// select line to a3stg_frac2
input		a2stg_expadd_11;	// exponent adder[11]- add 2 stage
input		a2stg_sub_step;		// select line to a3stg_frac2
input		a2stg_fracadd_frac2_inv_in; // sel line to main adder input 2
input		a2stg_fracadd_frac2_inv_shr1_in; // sel line to main adder in 2
input		a2stg_fracadd_frac2;	// select line to main adder input 2
input		a2stg_fracadd_cin_in;	// carry in to main adder- add 1 stage
input [5:0]	a2stg_exp;		// exponent add 2 stage bits[5:0]
input		a2stg_expdec_neq_0;	// exponent will be < 54
input [1:0]	a3stg_faddsubopa;	// denorm compare lead0[10] input select
input		a3stg_sub_in;		// subtract in main adder- add 3 stage
input		a3stg_exp10_0_eq0;	// exponent[10:0]==0- add 3 stg
input		a3stg_exp10_1_eq0;	// exponent[10:1]==0- add 3 stg
input		a3stg_exp_0;		// exponent[0]- add 3 stg
input		a4stg_rnd_frac_add_inv;	// select line to a4stg_rnd_frac
input		a3stg_fdtos_inv;	// double to single convert- add 3 stg
input		a4stg_fixtos_fxtod_inv;	// int to single/double cvt- add 4 stg
input		a4stg_rnd_sng;		// round to single precision- add 4 stg
input		a4stg_rnd_dbl;		// round to double precision- add 4 stg
input [9:0]	a4stg_shl_cnt_in;	// postnorm shift left count- add 3 stg
input		add_frac_out_rndadd;	// select line to add_frac_out
input		add_frac_out_rnd_frac;	// select line to add_frac_out
input		a4stg_in_of;		// add overflow- select fraction out
input		add_frac_out_shl;	// select line to add_frac_out
input		a4stg_to_0;		// result to max finite on overflow
input		fadd_clken_l;           // add pipe clk enable - asserted low
input		rclk;		// global clock

output		a1stg_in2_neq_in1_frac;	// operand 2 fraction != oprnd 1 frac
output		a1stg_in2_gt_in1_frac;	// operand 2 fraction > oprnd 1 frac
output		a1stg_in2_eq_in1_exp;	// operand 2 exponent == oprnd 1 exp
output		a2stg_frac2_63;		// fraction 2 bit[63]- add 2 stage
output		a2stg_frac2hi_neq_0;	// fraction 2[62:32]in add 2 stage != 0
output		a2stg_frac2lo_neq_0;	// fraction 2[31:11] in add 2 stage != 0
output		a3stg_fsdtoix_nx;	// inexact result for flt -> ints
output		a3stg_fsdtoi_nx;	// inexact result for flt -> 32b ints
output		a3stg_denorm;		// denorm output- add 3 stage
output		a3stg_denorm_inv;	// result is not a denorm- add 3 stage
output [5:0]	a3stg_lead0;		// leading 0's count- add 3 stage
output		a4stg_round;		// round the result- add 4 stage
output [5:0]	a4stg_shl_cnt;		// subtract in main adder- add 4 stage
output		a4stg_denorm_inv;	// 0 the exponent
output		a3stg_inc_exp_inv;	// increment the exponent- add 3 stg
output		a3stg_same_exp_inv;	// keep the exponent- add 3 stg
output		a3stg_dec_exp_inv;	// decrement the exponent- add 3 stg
output		a4stg_rnd_frac_40;	// rounded fraction[40]- add 4 stage
output		a4stg_rnd_frac_39;	// rounded fraction[39]- add 4 stage
output		a4stg_rnd_frac_11;	// rounded fraction[11]- add 4 stage
output		a4stg_rnd_frac_10;	// rounded fraction[10]- add 4 stage
output		a4stg_rndadd_cout;	// fraction rounding adder carry out
output		a4stg_frac_9_0_nx;	// inexact double precision result
output		a4stg_frac_dbl_nx;	// inexact double precision result
output		a4stg_frac_38_0_nx;	// inexact single precision result
output		a4stg_frac_sng_nx;	// inexact single precision result
output		a4stg_frac_neq_0;	// fraction != 0- add 4 stage
output		a4stg_shl_data_neq_0;	// left shift result != 0- add 4 stage
output		add_of_out_cout;	// fraction rounding adder carry out
output [63:0]	add_frac_out;		// add fraction output

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


wire [62:0]	a1stg_in1;
wire [54:0]	a1stg_in1a;
wire		a1stg_in1_31_0_neq_0;
wire		a1stg_in1_50_32_neq_0;
wire		a1stg_in1_50_0_neq_0;
wire		a1stg_in1_53_32_neq_0;
wire		a1stg_in1_51;
wire		a1stg_in1_54;
wire [63:0]	a1stg_in2;
wire [54:0]	a1stg_in2a;
wire		a1stg_in2_31_0_neq_0;
wire		a1stg_in2_50_32_neq_0;
wire		a1stg_in2_50_0_neq_0;
wire		a1stg_in2_53_32_neq_0;
wire		a1stg_in2_51;
wire		a1stg_in2_54;
wire		a1stg_in2_neq_in1_frac;
wire		a1stg_in2_gt_in1_frac;
wire		a1stg_in2_gt_in1;
wire		a1stg_in2_eq_in1_exp;
wire [63:0]	a1stg_norm_frac1;
wire [63:0]	a1stg_norm_frac2;
wire [63:0]	a2stg_frac1_in;
wire [63:0]	a2stg_frac1;
wire [63:0]	a2stg_frac2_in;
wire [63:0]	a2stg_frac2;
wire [63:0]	a2stg_frac2a;
wire		a2stg_frac2_63;
wire		a2stg_frac2hi_neq_0;
wire		a2stg_frac2lo_neq_0;
wire [115:52]	a2stg_shr;
wire		a2stg_fsdtoix_nx;
wire		a2stg_fsdtoi_nx;
wire		a2stg_shr_60_0_neq_0;
wire [63:0]	a2stg_shr_frac2_inv;
wire [63:0]	a3stg_frac2_in;
wire [63:0]	a3stg_frac2;
wire [63:0]	a3stg_frac1;
wire [63:0]	a2stg_fracadd_in2;
wire [63:0]	a2stg_fracadd;
wire [63:0]	a3stg_ld0_frac;
wire [53:0]	a2stg_expdec_tmp;
wire [53:0]	a2stg_expdec;
wire [53:0]	a3stg_expdec;
wire		a3stg_ld0_dnrm_10;
wire		a3stg_denorm;
wire		a3stg_denorm_inv;
wire		a3stg_denorma;
wire		a3stg_denorm_inva;
wire [5:0]	a3stg_lead0;
wire [63:0]	a3stg_fracadd;
wire		a4stg_round_in;
wire		a4stg_round;
wire [5:0]	a2stg_shr_cnt;
wire [5:3]	a2stg_shr_cnta;
wire [2:0]	a2stg_shr_cnta_5;
wire [3:0]	a2stg_shr_cnt_5_inv;
wire [3:0]	a2stg_shr_cnt_5;
wire [4:0]	a2stg_shr_cnt_4;
wire [4:0]	a2stg_shr_cnt_3;
wire [1:0]	a2stg_shr_cnt_2;
wire [1:0]	a2stg_shr_cnt_1;
wire [1:0]	a2stg_shr_cnt_0;
wire		a3stg_sub;
wire		a3stg_suba;
wire [2:0]	a4stg_shl_cnt_dec54_0;
wire [2:0]	a4stg_shl_cnt_dec54_1;
wire [2:0]	a4stg_shl_cnt_dec54_2;
wire [2:0]	a4stg_shl_cnt_dec54_3;
wire [5:0]	a4stg_shl_cnt;
wire		a2stg_fracadd_frac2_inv;
wire		a2stg_fracadd_frac2_inv_shr1;
wire		a4stg_denorm_inv;
wire		a3stg_fsdtoix_nx;
wire		a3stg_fsdtoi_nx;
wire		a2stg_fracadd_cin;
wire [63:0]	astg_xtra_regs;
wire		a3stg_inc_exp_inv;
wire		a3stg_same_exp_inv;
wire		a3stg_dec_exp_inv;
wire		a3stg_inc_exp_inva;
wire		a3stg_fsame_exp_inv;
wire		a3stg_fdec_exp_inv;
wire [63:0]	a4stg_rnd_frac_pre1_in;
wire [63:0]	a4stg_rnd_frac_pre1;
wire [63:0]	a4stg_rnd_frac_pre2_in;
wire [63:0]	a4stg_rnd_frac_pre2;
wire [63:0]	a4stg_rnd_frac_pre3_in;
wire [63:0]	a4stg_rnd_frac_pre3;
wire [63:0]	a4stg_rnd_frac;
wire [63:0]	a4stg_rnd_fraca;
wire		a4stg_rnd_frac_40;
wire		a4stg_rnd_frac_39;
wire		a4stg_rnd_frac_11;
wire		a4stg_rnd_frac_10;
wire [63:0]	a4stg_shl_data_in;
wire [63:0]	a4stg_shl_data;
wire [52:0]	a4stg_rndadd_tmp;
wire		a4stg_rndadd_cout;
wire [51:0]	a4stg_rndadd;
wire		a4stg_frac_9_0_nx;
wire		a4stg_frac_dbl_nx;
wire		a4stg_frac_38_0_nx;
wire		a4stg_frac_sng_nx;
wire		a4stg_frac_neq_0;
wire		a4stg_shl_data_neq_0;
wire [126:0]	a4stg_shl_tmp;
wire [63:0]	a4stg_shl;
wire		add_of_out_cout;
wire		a5stg_frac_out_rndadd;
wire		a5stg_frac_out_rnd_frac;
wire		a5stg_in_of;
wire		a5stg_frac_out_shl;
wire		a5stg_to_0;
wire [51:0]	a5stg_rndadd;
wire [63:0]	a5stg_rnd_frac;
wire [63:0]	a5stg_shl;
wire [63:0]	add_frac_out;

wire [63:0] a2stg_shr_tmp2;
wire [63:0] a2stg_shr_tmp4;
wire [63:0] a2stg_shr_tmp6;
wire [63:0] a2stg_shr_tmp8;
wire [63:0] a2stg_shr_tmp10;
wire [63:0] a2stg_shr_tmp13;
wire [63:0] a2stg_shr_tmp18;
wire [63:20] a2stg_nx_neq0_84_tmp_1;
wire [63:36] a2stg_nx_neq0_84_tmp_2;
wire [63:44] a2stg_nx_neq0_84_tmp_3;
wire [63:48] a2stg_nx_neq0_84_tmp_4;
wire [61:50] a2stg_nx_neq0_84_tmp_5;
wire [60:59] a2stg_nx_neq0_84_tmp_6;
wire a2stg_nx_neq0_84_tmp_6_51;

wire [63:0] a4stg_shl_tmp4;

wire se_l;

//Previously missing wires
wire        clk;

assign se_l = ~se;




    clken_buf  ckbuf_add_frac_dp (
      .clk(clk),
      .rclk(rclk),
      .enb_l(fadd_clken_l),
      .tmb_l(se_l)
      );


///////////////////////////////////////////////////////////////////////////////
//
//	Add fraction inputs.
//
//	Add input stage.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(63) i_a1stg_in1 (
        .din    (inq_in1[62:0]),
        .en     (a1stg_step),
        .clk    (clk),
 
        .q      (a1stg_in1[62:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(55) i_a1stg_in1a (
        .din	(inq_in1[54:0]),
        .en	(a1stg_step),
        .clk	(clk),
 
        .q	(a1stg_in1a[54:0]),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(64) i_a1stg_in2 (
        .din    (inq_in2[63:0]),
        .en     (a1stg_step),
        .clk    (clk),
 
        .q      (a1stg_in2[63:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(55) i_a1stg_in2a (
        .din	(inq_in2[54:0]),
        .en	(a1stg_step),
        .clk	(clk),
 
        .q	(a1stg_in2a[54:0]),
 
        .se	(se),
        .si	(),
        .so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Add normalization and special input injection.
//
//	Add stage 1.
//
///////////////////////////////////////////////////////////////////////////////

fpu_in2_gt_in1_frac i_a1stg_in2_gt_in1_frac (
	.din1			(a1stg_in1a[54:0]),
	.din2			(a1stg_in2a[54:0]),
	.sngop			(a1stg_sngop),
	.expadd11		(a1stg_expadd3_11),
	.expeq			(a1stg_in2_eq_in1_exp),

	.din2_neq_din1		(a1stg_in2_neq_in1_frac),
	.din2_gt_din1		(a1stg_in2_gt_in1_frac),
	.din2_gt1_din1		(a1stg_in2_gt_in1)
);

assign a1stg_in2_eq_in1_exp= (&{(~(a1stg_in1[62:55] ^ a1stg_in2[62:55])),
				((~(a1stg_in1[54:52] ^ a1stg_in2[54:52]))
					| {3{a1stg_sngop}})});

assign a1stg_norm_frac1[63:0]= ({64{a1stg_norm_dbl_in1}}
			    & {1'b1, a1stg_in1[51:0], 11'b0})
		| ({64{a1stg_denorm_dbl_in1}}
			    & {a1stg_in1[51:0], 12'b0})
		| ({64{a1stg_norm_sng_in1}}
			    & {1'b1, a1stg_in1[54:32], 40'b0})
		| ({64{a1stg_denorm_sng_in1}}
			    & {a1stg_in1[54:32], 41'b0});

assign a1stg_norm_frac2[63:0]= ({64{a1stg_norm_dbl_in2}}
			    & {1'b1, a1stg_in2[51:0], 11'b0})
                | ({64{a1stg_denorm_dbl_in2}}
                            & {a1stg_in2[51:0], 12'b0})
                | ({64{a1stg_norm_sng_in2}} 
                            & {1'b1, a1stg_in2[54:32], 40'b0})
                | ({64{a1stg_denorm_sng_in2}}
                            & {a1stg_in2[54:32], 41'b0})
		| ({64{a1stg_intlngop}}
			    & a1stg_in2[63:0]);

assign a2stg_frac1_in[63:0]= ({64{(a1stg_faddsubop_inv
				|| (!((a1stg_in2_gt_in1 && a1stg_2nan_in_inv)
						|| a2stg_frac1_in_frac1)))}}
			    & {a1stg_norm_frac1[63],
				(a1stg_norm_frac1[62] || a2stg_frac1_in_qnan),
				(a1stg_norm_frac1[61:40]
						| {22{a2stg_frac1_in_nv}}),
				(a1stg_norm_frac1[39:11]
						| {29{a2stg_frac1_in_nv_dbl}}),
				a1stg_norm_frac1[10:0]})
		| ({64{(a2stg_frac1_in_frac2
				    && (a1stg_in2_gt_in1 || a2stg_frac1_in_frac1))}}
			    & {a1stg_norm_frac2[63],
				(a1stg_norm_frac2[62] || a2stg_frac1_in_qnan),
				(a1stg_norm_frac2[61:40]
						| {22{a2stg_frac1_in_nv}}),
				(a1stg_norm_frac2[39:11]
						| {29{a2stg_frac1_in_nv_dbl}}),
				a1stg_norm_frac2[10:0]});

dffe_s #(64) i_a2stg_frac1 (
	.din	(a2stg_frac1_in[63:0]),
	.en	(a6stg_step),
	.clk    (clk),

        .q      (a2stg_frac1[63:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign a2stg_frac2_in[63:0]= ({64{a1stg_faddsubop_inv}}
			    & {a1stg_norm_frac2[63],
				(a1stg_norm_frac2[62] || a2stg_frac2_in_qnan),
                                a1stg_norm_frac2[61:0]})
		| ({64{(a2stg_frac2_in_frac1 && (!a1stg_in2_gt_in1))}}
			    & {a1stg_norm_frac2[63],
        			(a1stg_norm_frac2[62] || a2stg_frac2_in_qnan),
        			a1stg_norm_frac2[61:0]})
		| ({64{(a2stg_frac2_in_frac1 && a1stg_in2_gt_in1)}}
			    & a1stg_norm_frac1[63:0]);

dffe_s #(64) i_a2stg_frac2 (
	.din	(a2stg_frac2_in[63:0]),
	.en	(a6stg_step),
	.clk    (clk),

        .q      (a2stg_frac2[63:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(64) i_a2stg_frac2a (
	.din	(a2stg_frac2_in[63:0]),
	.en	(a6stg_step),
	.clk	(clk),

	.q	(a2stg_frac2a[63:0]),

	.se	(se),
	.si	(),
	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Add pipe right shift
//		- shift the smaller fraction right for adds and subtracts
//		- shift the fraction right for float to integer conversion
//
//	Add stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign a2stg_frac2_63= a2stg_frac2[63];

assign a2stg_frac2hi_neq_0= (|a2stg_frac2[62:32]);

assign a2stg_frac2lo_neq_0= (|a2stg_frac2[31:11]);


// a2 stage right shifter
assign a2stg_shr_tmp2[63:0] = ({{24{a2stg_shr_cnt_5[0]}}, {16{a2stg_shr_cnt_5[1]}}, {13{a2stg_shr_cnt_5[2]}}, {11{a2stg_shr_cnt_5[3]}}} & {32'h00000000, a2stg_frac2a[63:32]})
	| ({{24{a2stg_shr_cnt_5_inv[0]}}, {16{a2stg_shr_cnt_5_inv[1]}}, {13{a2stg_shr_cnt_5_inv[2]}}, {11{a2stg_shr_cnt_5_inv[3]}}} & a2stg_frac2a[63:0]);

assign a2stg_shr_tmp4[63:0] = ({{24{a2stg_shr_cnt_4[0]}}, {16{a2stg_shr_cnt_4[1]}}, {13{a2stg_shr_cnt_4[2]}}, {11{a2stg_shr_cnt_4[3]}}} & {16'h0000, a2stg_shr_tmp2[63:16]})
	| ({{43{~a2stg_shr_cnt_4[4]}}, {21{~a2stg_shr_cnt_4[4]}}} & a2stg_shr_tmp2[63:0]);

assign a2stg_shr_tmp6[63:0] = ~(({{24{a2stg_shr_cnt_3[0]}}, {16{a2stg_shr_cnt_3[1]}}, {13{a2stg_shr_cnt_3[2]}}, {11{a2stg_shr_cnt_3[3]}}} & {8'h00, a2stg_shr_tmp4[63:8]})
	| ({64{~a2stg_shr_cnt_3[4]}} & a2stg_shr_tmp4[63:0]));

assign a2stg_shr_tmp8[63:0] = ~(({{43{a2stg_shr_cnt_2[0]}}, {21{a2stg_shr_cnt_2[0]}}} | a2stg_shr_tmp6[63:0])
	& ({64{~a2stg_shr_cnt_2[1]}} | {4'hf, a2stg_shr_tmp6[63:4]}));

assign a2stg_shr_tmp10[63:0] = ~(({{43{a2stg_shr_cnt_1[0]}}, {21{a2stg_shr_cnt_1[0]}}} & {2'b00, a2stg_shr_tmp8[63:2]})
	| ({64{~a2stg_shr_cnt_1[1]}} & a2stg_shr_tmp8[63:0]));

assign a2stg_shr[115:52] = ~(({{43{a2stg_shr_cnt_0[0]}}, {21{a2stg_shr_cnt_0[0]}}} | a2stg_shr_tmp10[63:0])
	 & ({64{~a2stg_shr_cnt_0[1]}} | {1'b1, a2stg_shr_tmp10[63:1]}));

assign a2stg_shr_tmp18[63:0] = ~a2stg_shr_tmp2[63:0];
assign a2stg_shr_tmp13[63:0] = a2stg_shr_tmp4[63:0];

// a2 stage nx signals
assign a2stg_fsdtoi_nx = (| a2stg_shr_tmp13[31:0])
	| (~(& a2stg_shr_tmp6[31:24]))
	| (| a2stg_shr_tmp8[31:28])
	| (~(& a2stg_shr_tmp10[31:30]))
	| a2stg_shr[83];


assign a2stg_nx_neq0_84_tmp_1[63:20] = ~((a2stg_frac2a[43:0] & {44{a2stg_shr_cnt[5]}})
	| ({a2stg_frac2a[11:0], 32'h00000000} & {44{~a2stg_shr_cnt[5]}}));

assign a2stg_nx_neq0_84_tmp_2[63:36] = ~(({a2stg_shr_tmp18[27:12], a2stg_nx_neq0_84_tmp_1[63:52]} | {28{~a2stg_shr_cnt[4]}})
	& (a2stg_nx_neq0_84_tmp_1[63:36] | {28{a2stg_shr_cnt[4]}}));

assign a2stg_nx_neq0_84_tmp_3[63:44] = ~(({a2stg_shr_tmp13[19:12], a2stg_nx_neq0_84_tmp_2[63:52]} & {20{a2stg_shr_cnt[3]}})
	| (a2stg_nx_neq0_84_tmp_2[63:44] & {20{~a2stg_shr_cnt[3]}}));

assign a2stg_nx_neq0_84_tmp_4[63:48] = ~(({a2stg_shr_tmp6[15:12], a2stg_nx_neq0_84_tmp_3[63:52]} | {16{~a2stg_shr_cnt[2]}})
	& (a2stg_nx_neq0_84_tmp_3[63:48] | {16{a2stg_shr_cnt[2]}}));

assign a2stg_nx_neq0_84_tmp_5[61:50] = ~((a2stg_nx_neq0_84_tmp_4[63:52] & {12{a2stg_shr_cnt[1]}})
	| (a2stg_nx_neq0_84_tmp_4[61:50] & {12{~a2stg_shr_cnt[1]}}));

assign a2stg_nx_neq0_84_tmp_6[59] = ~(a2stg_shr_cnt[0] | a2stg_nx_neq0_84_tmp_5[60]);
assign a2stg_nx_neq0_84_tmp_6[60] = ~(~a2stg_shr_cnt[0] | a2stg_nx_neq0_84_tmp_5[61]);
assign a2stg_nx_neq0_84_tmp_6_51 = ~((a2stg_nx_neq0_84_tmp_5[52] | ~a2stg_shr_cnt[0])
	& (a2stg_nx_neq0_84_tmp_5[51] | a2stg_shr_cnt[0]));

assign a2stg_fsdtoix_nx = (~(& a2stg_nx_neq0_84_tmp_1[51:20])
	| (| a2stg_nx_neq0_84_tmp_2[51:36])
	| ~(& a2stg_nx_neq0_84_tmp_3[51:44])
	| (| a2stg_nx_neq0_84_tmp_4[51:48])
	| ~(& a2stg_nx_neq0_84_tmp_5[51:50])
	| a2stg_nx_neq0_84_tmp_6_51);

assign a2stg_shr_60_0_neq_0 = (~(& a2stg_nx_neq0_84_tmp_1[60:20])
	| (| a2stg_nx_neq0_84_tmp_2[60:45])
	| ~(& a2stg_nx_neq0_84_tmp_3[60:53])
	| (| a2stg_nx_neq0_84_tmp_4[60:57])
	| ~(& a2stg_nx_neq0_84_tmp_5[60:59])
	| (| a2stg_nx_neq0_84_tmp_6[60:59]));


assign a2stg_shr_frac2_inv[63:0]= (~(({64{a2stg_shr_frac2_shr_int}}
			    & {1'b0, a2stg_shr[115:61], a2stg_shr_60_0_neq_0,
					7'b0})
		| ({64{(a2stg_shr_frac2_shr_dbl && a2stg_expadd_11)}}
			    & a2stg_shr[115:52])
		| ({64{(a2stg_shr_frac2_shr_sng && a2stg_expadd_11)}}
			    & {a2stg_shr[115:84], 32'b0})
		| ({64{(a2stg_shr_frac2_max && (!a2stg_expadd_11))}}
			    & 64'h7fffffffffffffff)
		| ({64{(!a6stg_step)}}
			    & a3stg_frac2[63:0])));

assign a3stg_frac2_in[63:0]= (~(a2stg_shr_frac2_inv[63:0]
		^ {64{a2stg_sub_step}}));

dff_s #(64) i_a3stg_frac2 (
	.din	(a3stg_frac2_in[63:0]),
        .clk    (clk),

        .q      (a3stg_frac2[63:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Pipe the other/larger fraction to stage 3.
//
//	Add stage 2.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(64) i_a3stg_frac1 (
	.din    ({1'b0, a2stg_frac1[63:1]}),
	.en     (a6stg_step),
        .clk    (clk),

        .q      (a3stg_frac1[63:0]),
         
        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Add pipe adder.
//
//	Add stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign a2stg_fracadd_in2[63:0]= ({64{a2stg_fracadd_frac2_inv}}
			    & (~a2stg_frac2[63:0]))
		| ({64{a2stg_fracadd_frac2_inv_shr1}}
			    & (~{1'b0, a2stg_frac2[63:1]}))
		| ({64{a2stg_fracadd_frac2}}
			    & a2stg_frac2[63:0]);

assign a2stg_fracadd[63:0]= (a2stg_frac1[63:0]
			+ a2stg_fracadd_in2[63:0]
			+ {63'b0, a2stg_fracadd_cin});

dffe_s #(64) i_a3stg_ld0_frac (
	.din	(a2stg_fracadd[63:0]),
	.en     (a6stg_step),
        .clk    (clk),

        .q      (a3stg_ld0_frac[63:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Add pipe exponent decode- used to identify denorm results.
//
//      Add stage 2.
//
///////////////////////////////////////////////////////////////////////////////

// assign a2stg_expdec_tmp[107:0]= ({54'b0, 54'h20000000000000} >> a2stg_exp[5:0]);
assign a2stg_expdec_tmp[53:0] =          54'h20000000000000  >> a2stg_exp[5:0] ;

assign a2stg_expdec[53:0]= a2stg_expdec_tmp[53:0] & {54{a2stg_expdec_neq_0}};

dffe_s #(54) i_a3stg_expdec (
	.din	(a2stg_expdec[53:0]),
	.en     (a6stg_step),
        .clk    (clk),

        .q      (a3stg_expdec[53:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Add pipe denorm comparator to identify denorm results.
//
//      Add stage 3.
//
///////////////////////////////////////////////////////////////////////////////

assign a3stg_ld0_dnrm_10= (a3stg_faddsubopa[0] && a3stg_ld0_frac[10])
		|| ((!a3stg_faddsubopa[0]) && (|a3stg_ld0_frac[10:0]));

fpu_denorm_frac i_a3stg_denorm (
	.din1			({a3stg_ld0_frac[63:11], a3stg_ld0_dnrm_10}),
	.din2			(a3stg_expdec[53:0]),

	.din2_din1_denorm	(a3stg_denorm),
	.din2_din1_denorm_inv	(a3stg_denorm_inv),
	.din2_din1_denorma	(a3stg_denorma),
	.din2_din1_denorm_inva	(a3stg_denorm_inva)
);


///////////////////////////////////////////////////////////////////////////////
//
//	Add pipe leading 0's counter.
//
//      Add stage 3.
//
///////////////////////////////////////////////////////////////////////////////

fpu_cnt_lead0_64b i_a3stg_lead0 (
	.din	(a3stg_ld0_frac[63:0]),

	.lead0	(a3stg_lead0[5:0])
);


///////////////////////////////////////////////////////////////////////////////
//
//      Add pipe main adder.
//
//      Add stage 3.
//
///////////////////////////////////////////////////////////////////////////////

assign a3stg_fracadd[63:0]= (a3stg_frac1[63:0]
			+ a3stg_frac2[63:0]
			+ {63'b0, a3stg_suba});

dffe_s #(64) i_astg_xtra_regs (
	.din	({{4{a2stg_shr_cnt_5_inv_in}}, {4{a2stg_shr_cnt_in[5]}},
			a2stg_shr_cnt_in[5:3],
			{5{a2stg_shr_cnt_in[4]}}, {5{a2stg_shr_cnt_in[3]}},
			a2stg_shr_cnt_in[5:0], a4stg_round_in,
			{2{a2stg_shr_cnt_in[2]}}, {2{a2stg_shr_cnt_in[1]}},
			{2{a2stg_shr_cnt_in[0]}},
			{3{a4stg_shl_cnt_in[6]}},
			{3{a4stg_shl_cnt_in[7]}},
			{3{a4stg_shl_cnt_in[8]}},
			{3{a4stg_shl_cnt_in[9]}},
			a4stg_shl_cnt_in[5:0],
			{3{a2stg_shr_cnt_in[5]}},
			a2stg_fracadd_frac2_inv_in,
			a2stg_fracadd_frac2_inv_shr1_in,
			a3stg_denorm_inva,
			a2stg_fsdtoix_nx, a2stg_fsdtoi_nx,
			1'b0, a2stg_fracadd_cin_in, {2{a3stg_sub_in}}}),
	.en	(a6stg_step),
	.clk	(clk),

	.q	({a2stg_shr_cnt_5_inv[3:0], a2stg_shr_cnt_5[3:0],
			a2stg_shr_cnta[5:3],
			a2stg_shr_cnt_4[4:0], a2stg_shr_cnt_3[4:0],
			a2stg_shr_cnt[5:0], a4stg_round,
			a2stg_shr_cnt_2[1:0], a2stg_shr_cnt_1[1:0],
			a2stg_shr_cnt_0[1:0],
			a4stg_shl_cnt_dec54_0[2:0],
			a4stg_shl_cnt_dec54_1[2:0],
			a4stg_shl_cnt_dec54_2[2:0],
			a4stg_shl_cnt_dec54_3[2:0],
			a4stg_shl_cnt[5:0],
			a2stg_shr_cnta_5[2:0],
			a2stg_fracadd_frac2_inv,
			a2stg_fracadd_frac2_inv_shr1,
			a4stg_denorm_inv,
			a3stg_fsdtoix_nx, a3stg_fsdtoi_nx,
			astg_xtra_regs[3], a2stg_fracadd_cin,
			a3stg_sub, a3stg_suba}),

	.se     (se),
        .si     (),
        .so     ()
);

assign a4stg_round_in= a3stg_fracadd[61]
		|| a3stg_fracadd[62]
		|| a3stg_fracadd[63];

assign a3stg_inc_exp_inv= (!a3stg_fracadd[63]);

assign a3stg_same_exp_inv= (!(((!a3stg_fracadd[63]) && a3stg_fracadd[62])
		|| ((!a3stg_fracadd[63]) && a3stg_exp10_0_eq0)));

assign a3stg_dec_exp_inv= (!((!a3stg_fracadd[63])
		&& (!a3stg_fracadd[62])
		&& a3stg_fracadd[61]
		&& (!a3stg_exp10_0_eq0)));

assign a3stg_inc_exp_inva= (!a3stg_fracadd[63]);

assign a3stg_fsame_exp_inv= (!(((!a3stg_fracadd[63])
			&& (!a3stg_fracadd[62])
			&& a3stg_fracadd[61]
			&& a3stg_exp10_1_eq0
			&& a3stg_exp_0)
		|| ((!a3stg_fracadd[63])
			&& a3stg_fracadd[62]
			&& (!a3stg_exp10_0_eq0))));

assign a3stg_fdec_exp_inv= (!((!a3stg_fracadd[63])
		&& (!a3stg_fracadd[62])
		&& a3stg_fracadd[61]
		&& (!a3stg_exp10_1_eq0)));

assign a4stg_rnd_frac_pre1_in[63:0]= ({64{(a3stg_faddsubopa[1] && a6stg_step
					&& (!a3stg_fdec_exp_inv))}}
			    & {a3stg_fracadd[61:0], 2'b00});

dff_s #(64) i_a4stg_rnd_frac_pre1 (
	.din	(a4stg_rnd_frac_pre1_in[63:0]),
        .clk    (clk),

        .q      (a4stg_rnd_frac_pre1[63:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign a4stg_rnd_frac_pre3_in[63:0]= ({64{(a3stg_faddsubopa[1] && a6stg_step
					&& (!a3stg_fsame_exp_inv))}}
			    & {a3stg_fracadd[62:0], 1'b0});

dff_s #(64) i_a4stg_rnd_frac_pre3 (
	.din	(a4stg_rnd_frac_pre3_in[63:0]),
        .clk    (clk),

        .q      (a4stg_rnd_frac_pre3[63:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign a4stg_rnd_frac_pre2_in[63:0]= ({64{(a3stg_faddsubopa[1] && a6stg_step
					&& (!a3stg_inc_exp_inva))}}
			    & a3stg_fracadd[63:0])
		| ({64{((!a4stg_rnd_frac_add_inv) && a6stg_step)}}
			    & a3stg_fracadd[63:0])
		| ({64{((!a3stg_fdtos_inv) && a6stg_step)}}
			    & {a3stg_fracadd[62:0], 1'b0})
		| ({64{((!a4stg_fixtos_fxtod_inv) && a6stg_step)}}
			    & a4stg_shl[63:0])
		| ({64{(!a6stg_step)}}
			    & a4stg_rnd_frac[63:0]);

dff_s #(64) i_a4stg_rnd_frac_pre2 (
	.din	(a4stg_rnd_frac_pre2_in[63:0]),
        .clk    (clk),

        .q      (a4stg_rnd_frac_pre2[63:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Add pipe input to left shift.
//
//      Add stage 3.
//
///////////////////////////////////////////////////////////////////////////////

assign a4stg_shl_data_in[63:0]= ({64{a3stg_denorm_inva}}
			    & a3stg_ld0_frac[63:0])
		| ({64{a3stg_denorma}}
			    & {1'b0, a3stg_ld0_frac[63:1]});

dffe_s #(64) i_a4stg_shl_data (
	.din	(a4stg_shl_data_in[63:0]),
	.en     (a6stg_step),
        .clk    (clk),

        .q      (a4stg_shl_data[63:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Add pipe rounding adder.
//
//      Add stage 4.
//
///////////////////////////////////////////////////////////////////////////////

assign a4stg_rnd_frac[63:0]= (a4stg_rnd_frac_pre1[63:0]
				| a4stg_rnd_frac_pre2[63:0]
				| a4stg_rnd_frac_pre3[63:0]);

assign a4stg_rnd_frac_40= a4stg_rnd_frac[40];

assign a4stg_rnd_frac_39= a4stg_rnd_frac[39];

assign a4stg_rnd_frac_11= a4stg_rnd_frac[11];

assign a4stg_rnd_frac_10= a4stg_rnd_frac[10];

assign a4stg_frac_9_0_nx= (|a4stg_rnd_frac[9:0]);

assign a4stg_frac_dbl_nx= a4stg_frac_9_0_nx || a4stg_rnd_frac[10];

assign a4stg_frac_38_0_nx= a4stg_frac_dbl_nx || (|a4stg_rnd_frac[38:11]);

assign a4stg_frac_sng_nx= a4stg_frac_38_0_nx || a4stg_rnd_frac[39];

assign a4stg_frac_neq_0= a4stg_frac_sng_nx || (|a4stg_rnd_frac[63:40]);

assign a4stg_rndadd_tmp[52:0]= {1'b0, a4stg_rnd_frac[62:11]}
			+ {23'b0, a4stg_rnd_sng, 28'b0, a4stg_rnd_dbl};

assign a4stg_rndadd_cout= a4stg_rndadd_tmp[52];

assign a4stg_rndadd[51:0]= a4stg_rndadd_tmp[51:0];


///////////////////////////////////////////////////////////////////////////////
//
//      Add pipe left shift.
//
//      Add stage 4.
//
///////////////////////////////////////////////////////////////////////////////

assign a4stg_shl_data_neq_0= (|a4stg_shl_data[63:0]);

assign a4stg_shl_tmp4[63:0] = ({{32{a4stg_shl_cnt_dec54_0[0]}}, {21{a4stg_shl_cnt_dec54_0[1]}}, {11{a4stg_shl_cnt_dec54_0[2]}}} & a4stg_shl_data[63:0])
	| ({{32{a4stg_shl_cnt_dec54_1[0]}}, {21{a4stg_shl_cnt_dec54_1[1]}}, {11{a4stg_shl_cnt_dec54_1[2]}}} & {a4stg_shl_data[47:0], 16'h0000})
	| ({{32{a4stg_shl_cnt_dec54_2[0]}}, {21{a4stg_shl_cnt_dec54_2[1]}}, {11{a4stg_shl_cnt_dec54_2[2]}}} & {a4stg_shl_data[31:0], 32'h00000000})
	| ({{32{a4stg_shl_cnt_dec54_3[0]}}, {21{a4stg_shl_cnt_dec54_3[1]}}, {11{a4stg_shl_cnt_dec54_3[2]}}} & {a4stg_shl_data[15:0], 32'h00000000, 16'h0000});

assign a4stg_shl[63:0] = a4stg_shl_tmp4[63:0] << a4stg_shl_cnt[3:0];


///////////////////////////////////////////////////////////////////////////////
//
//      Add pipe fraction output.
//
//      Add stage 4.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(58) i_a5stg_rndadd (
	.din	({a4stg_rndadd_cout, add_frac_out_rndadd, add_frac_out_rnd_frac,
			a4stg_in_of, add_frac_out_shl, a4stg_to_0,
			a4stg_rndadd[51:0]}),
	.en	(a6stg_step),
        .clk    (clk),

	.q	({add_of_out_cout, a5stg_frac_out_rndadd,
			a5stg_frac_out_rnd_frac, a5stg_in_of,
			a5stg_frac_out_shl, a5stg_to_0,
			a5stg_rndadd[51:0]}),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(64) i_a5stg_rnd_frac (
	.din	(a4stg_rnd_frac[63:0]),
	.en	(a6stg_step),
	.clk	(clk),

	.q	(a5stg_rnd_frac[63:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(64) i_a5stg_shl (
	.din	(a4stg_shl[63:0]),
	.en	(a6stg_step),
	.clk	(clk),

	.q	(a5stg_shl[63:0]),

	.se	(se),
	.si	(),
	.so	()
);

assign add_frac_out[63:0]= ({64{a5stg_frac_out_rndadd}}
			    & {1'b0, a5stg_rndadd[51:0], 11'b0})
		| ({64{a5stg_frac_out_rnd_frac}}
			    & a5stg_rnd_frac[63:0])
		| ({64{a5stg_in_of}}
			    & {64{a5stg_to_0}})
		| ({64{a5stg_frac_out_shl}}
			    & a5stg_shl[63:0]);


endmodule

// Copyright (c) 2015 Princeton University
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

///////////////////////////////////////////////////////////////////////////////
//
//	Floating Point Unit to modified CCX interface wrapper.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_arb (
	arst_l,
	grst_l,
	gclk,
	cluster_cken,

    // spc0_pcx_atom_pq,
	pcx_fpio_data_rdy_px1,
    pcx_fpio_data_rdy_squashed,
	pcx_fpio_data_px2,

    l15_fp_rdy,
    // l15_fp_grant,

	fpu_arb_data_rdy,
	fpu_arb_data,
	fpu_arb_grant,

	ctu_tst_pre_grst_l,
	global_shift_enable,
	ctu_tst_scan_disable,
	ctu_tst_scanmode,
	ctu_tst_macrotest,
	ctu_tst_short_chain,

	si,

	so
);


input		    arst_l;			// chip async. reset- asserted low
input		    grst_l;			// chip sync. reset- asserted low
input		    gclk;			// chip clock
input		    cluster_cken;			// cluster clock enable

// input           spc0_pcx_atom_pq;
input		    pcx_fpio_data_rdy_px1;	// FPU request ready from PCX
input           pcx_fpio_data_rdy_squashed;  // FPU request ready from PCX
input [123:0]	pcx_fpio_data_px2;	// FPU request data from PCX

input           l15_fp_rdy;
// input           l15_fp_grant;

input			ctu_tst_pre_grst_l;
input			global_shift_enable;
input			ctu_tst_scan_disable;
input			ctu_tst_scanmode;
input 			ctu_tst_macrotest;
input 			ctu_tst_short_chain;
input           si;                     // scan in

output      	fpu_arb_data_rdy;		// FPU result request to CPX
output [144:0]	fpu_arb_data;		// FPU result to CPX
output reg      fpu_arb_grant;

output          so;                     // scan out

wire [7:0]   fp_cpx_req_cq;
wire [144:0] fp_cpx_data_ca;


//wire pcx_fpio_data_rdy_px2 = pcx_fpio_data_rdy_px1;

reg pcx_fpio_data_rdy_px2;
// reg pcx_fpio_data_rdy_px2_next;
// reg fp_req_val_px2;
// reg fp_req_val_px2_next;
// reg fp_req_val_px3;
// reg data_rdy_f;
// reg data_atm_f;
reg is_fp;

always @*
begin
    is_fp = pcx_fpio_data_px2[122:119] == 4'b0101;
    pcx_fpio_data_rdy_px2 = pcx_fpio_data_px2[123] && is_fp;
    // pcx_fpio_data_rdy_px2 = pcx_fpio_data_px2[123] && is_fp;
    // pcx_fpio_data_rdy_px2_next = pcx_fpio_data_rdy_px1 | (data_rdy_f & data_atm_f);
    // pcx_fpio_data_rdy_px2_next = pcx_fpio_data_rdy_px1 && !pcx_fpio_data_rdy_squashed && is_fp;
    fpu_arb_grant = 1'b0;
    // pcx_fpio_data_rdy_px2 = fp_req_val_px2 || fp_req_val_px3;
end

always @(posedge gclk)
begin
    if (~grst_l)
    begin
        // data_rdy_f <= 1'b0;
        // data_atm_f <= 1'b0;
        // pcx_fpio_data_rdy_px2 <= 1'b0;
    end
    else
    begin
        // data_rdy_f <= pcx_fpio_data_rdy_px1;
        // data_atm_f <= 1'b0;
        // pcx_fpio_data_rdy_px2 <= pcx_fpio_data_rdy_px2_next;
        // fp_req_val_px2 <= fp_req_val_px2_next;
        // fp_req_val_px3 <= fp_req_val_px2;
    end
end



///////////////////////////////////////////////////////////////////////////////
//
//      Instantiations.
//
///////////////////////////////////////////////////////////////////////////////

fpu fpu (
    .pcx_fpio_data_rdy_px2 (pcx_fpio_data_rdy_px2),
    .pcx_fpio_data_px2 (pcx_fpio_data_px2[123:0]),
    .arst_l (arst_l),
    .grst_l (grst_l),
    .gclk (gclk),
    .cluster_cken (cluster_cken),

    .fp_cpx_req_cq (fp_cpx_req_cq[7:0]),
    .fp_cpx_data_ca (fp_cpx_data_ca[144:0]),

    .ctu_tst_pre_grst_l (ctu_tst_pre_grst_l),
    .global_shift_enable (global_shift_enable),
    .ctu_tst_scan_disable (ctu_tst_scan_disable),
    .ctu_tst_scanmode (ctu_tst_scanmode),
    .ctu_tst_macrotest (ctu_tst_macrotest),
    .ctu_tst_short_chain (ctu_tst_short_chain),

    .si (si),
    .so (so)
);

fpu_buf fpu_buf (
    .rst_n (grst_l),
    .clk (gclk),

    .fp_cpx_req_cq (fp_cpx_req_cq[7:0]),
    .fp_cpx_data_ca (fp_cpx_data_ca[144:0]),

    .l15_fp_rdy (l15_fp_rdy),

    .fpu_arb_data_rdy (fpu_arb_data_rdy),
    .fpu_arb_data (fpu_arb_data[144:0])
);
endmodule

// Copyright (c) 2015 Princeton University
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// Wrapper to tie unused signals in fpu_arb


module fpu_arb_wrap
(
    input           clk,
    input           rst_n,
    
    input [67:0]    pcx_fpio_data_px2_67_0,
    input [79:72]   pcx_fpio_data_px2_79_72,
    input [116:112] pcx_fpio_data_px2_116_112,
    input [123:118] pcx_fpio_data_px2_123_118,

    input           l15_fp_rdy,
    
    output          fpu_arb_data_rdy,
    output [144:0]  fpu_arb_data,
    output          fpu_arb_grant
);









    wire[123:0]  pcx_fpio_data_px2 = {pcx_fpio_data_px2_123_118, 
                                                           1'bx, 
                                      pcx_fpio_data_px2_116_112, 
                                                          32'bx,
                                        pcx_fpio_data_px2_79_72,
                                                           4'bx,
                                         pcx_fpio_data_px2_67_0};

    fpu_arb fpu_arb
    (
        .arst_l (rst_n),
        .grst_l (rst_n),
        .gclk (clk),
        .cluster_cken (1'b1),
        .pcx_fpio_data_rdy_px1 (1'bx),
        .pcx_fpio_data_rdy_squashed (1'bx),
        .pcx_fpio_data_px2 (pcx_fpio_data_px2),
        .l15_fp_rdy (l15_fp_rdy),
        .fpu_arb_data_rdy (fpu_arb_data_rdy),
        .fpu_arb_data (fpu_arb_data),
        .fpu_arb_grant (fpu_arb_grant),
        .ctu_tst_pre_grst_l(1'b1),
        .global_shift_enable(1'b0),
        .ctu_tst_scan_disable(1'b1),
        .ctu_tst_scanmode(),
        .ctu_tst_macrotest(1'b0),
        .ctu_tst_short_chain(),
        .si(),
        .so()
    );



endmodule
// Copyright (c) 2015 Princeton University
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

///////////////////////////////////////////////////////////////////////////////
//
//  Floating Point Unit to stallable CPX buffer.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_buf (
    input wire rst_n,
    input wire clk,

    input wire [7:0] fp_cpx_req_cq,
    input wire [144:0] fp_cpx_data_ca,

    input wire l15_fp_rdy,

    output reg fpu_arb_data_rdy,
    output reg [144:0] fpu_arb_data
);

// Tri: i'm going to write the logic using val/rdy convention; easier to understand
reg fp_cpx_req;
reg fp_cpx_req_d1;

reg output_rdy;
reg output_val;
reg [144:0] output_data;
reg buffer_val_next;
reg buffer_val;
reg [144:0] buffer_next;
reg [144:0] buffer;
reg buffer_wr_en;

always @*
begin
    // renaming
    fp_cpx_req = fp_cpx_req_cq[0];
    output_rdy = !l15_fp_rdy;

    // assigning outputs
    // output is valid when (buffer_val || fp_cpx_req_d1 == 1) && output_rdy;
    output_val = (buffer_val || fp_cpx_req_d1) && output_rdy;
    output_data = buffer_val ? buffer : fp_cpx_data_ca;

    // buffer is valid next cycle if
    // 1. buffer_val && !output_val (hold buffer)
    // 2. fp_cpx_req_d1 && !output_val (new buffer)
    buffer_val_next = (buffer_val || fp_cpx_req_d1) && !output_val;
    // write new buffer when fp_cpx_req_d1 && !output_val (new buffer)
    buffer_wr_en = fp_cpx_req_d1 && !output_val;
    buffer_next = buffer_wr_en ? fp_cpx_data_ca : buffer;

    // output assignments
    fpu_arb_data_rdy = output_val;
    fpu_arb_data = output_data;
end

always @(posedge clk)
begin
    if (~rst_n)
    begin
        fp_cpx_req_d1 <= 1'b0;
        buffer_val <= 1'b0;
        buffer <= 145'b0;
    end
    else
    begin 
        fp_cpx_req_d1 <= fp_cpx_req;
        buffer_val <= buffer_val_next;
        buffer <= buffer_next;
    end
end


endmodule
// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_cnt_lead0_53b.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//	53 bit lead 0 counter.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_cnt_lead0_53b (
	din,

	lead0
);


input [52:0]	din;			// data in- count its leading 0's

output [5:0]	lead0;			// number of leading 0's in data in


wire		din_52_49_eq_0;
wire		din_52_51_eq_0;
wire		lead0_52_49_0;
wire		din_48_45_eq_0;
wire		din_48_47_eq_0;
wire		lead0_48_45_0;
wire		din_44_41_eq_0;
wire		din_44_43_eq_0;
wire		lead0_44_41_0;
wire		din_40_37_eq_0;
wire		din_40_39_eq_0;
wire		lead0_40_37_0;
wire		din_36_33_eq_0;
wire		din_36_35_eq_0;
wire		lead0_36_33_0;
wire		din_32_29_eq_0;
wire		din_32_31_eq_0;
wire		lead0_32_29_0;
wire		din_28_25_eq_0;
wire		din_28_27_eq_0;
wire		lead0_28_25_0;
wire		din_24_21_eq_0;
wire		din_24_23_eq_0;
wire		lead0_24_21_0;
wire		din_20_17_eq_0;
wire		din_20_19_eq_0;
wire		lead0_20_17_0;
wire		din_16_13_eq_0;
wire		din_16_15_eq_0;
wire		lead0_16_13_0;
wire		din_12_9_eq_0;
wire		din_12_11_eq_0;
wire		lead0_12_9_0;
wire		din_8_5_eq_0;
wire		din_8_7_eq_0;
wire		lead0_8_5_0;
wire		din_4_1_eq_0;
wire		din_4_3_eq_0;
wire		lead0_4_1_0;
wire		lead0_0_0;
wire		din_52_45_eq_0;
wire		lead0_52_45_1;
wire		lead0_52_45_0;
wire		din_44_37_eq_0;
wire		lead0_44_37_1;
wire		lead0_44_37_0;
wire		din_36_29_eq_0;
wire		lead0_36_29_1;
wire		lead0_36_29_0;
wire		din_28_21_eq_0;
wire		lead0_28_21_1;
wire		lead0_28_21_0;
wire		din_20_13_eq_0;
wire		lead0_20_13_1;
wire		lead0_20_13_0;
wire		din_12_5_eq_0;
wire		lead0_12_5_1;
wire		lead0_12_5_0;
wire		lead0_4_0_1;
wire		lead0_4_0_0;
wire		din_52_37_eq_0;
wire		lead0_52_37_2;
wire		lead0_52_37_1;
wire		lead0_52_37_0;
wire		din_36_21_eq_0;
wire		lead0_36_21_2;
wire		lead0_36_21_1;
wire		lead0_36_21_0;
wire		din_20_5_eq_0;
wire		lead0_20_5_2;
wire		lead0_20_5_1;
wire		lead0_20_5_0;
wire		lead0_4_0_2;
wire		din_52_21_eq_0;
wire		lead0_52_21_3;
wire		lead0_52_21_2;
wire		lead0_52_21_1;
wire		lead0_52_21_0;
wire		lead0_20_0_3;
wire		lead0_20_0_2;
wire		lead0_20_0_1;
wire		lead0_20_0_0;
wire		lead0_5;
wire		lead0_4;
wire		lead0_3;
wire		lead0_2;
wire		lead0_1;
wire		lead0_0;
wire [5:0]	lead0;


///////////////////////////////////////////////////////////////////////////////
//
//	Instantiations of lead 0 building blocks.
//
///////////////////////////////////////////////////////////////////////////////

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_52_49 (
	.din			(din[52:49]),

	.din_3_0_eq_0		(din_52_49_eq_0),
	.din_3_2_eq_0		(din_52_51_eq_0),
	.lead0_4b_0		(lead0_52_49_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_48_45 (
        .din                    (din[48:45]),

        .din_3_0_eq_0           (din_48_45_eq_0),
        .din_3_2_eq_0           (din_48_47_eq_0),
        .lead0_4b_0             (lead0_48_45_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_44_41 (
        .din                    (din[44:41]),

        .din_3_0_eq_0           (din_44_41_eq_0),
        .din_3_2_eq_0           (din_44_43_eq_0),
        .lead0_4b_0             (lead0_44_41_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_40_37 (
        .din                    (din[40:37]),

        .din_3_0_eq_0           (din_40_37_eq_0),
        .din_3_2_eq_0           (din_40_39_eq_0),
        .lead0_4b_0             (lead0_40_37_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_36_33 (
        .din                    (din[36:33]),

        .din_3_0_eq_0           (din_36_33_eq_0),
        .din_3_2_eq_0           (din_36_35_eq_0),
        .lead0_4b_0             (lead0_36_33_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_32_29 (
        .din                    (din[32:29]),

        .din_3_0_eq_0           (din_32_29_eq_0),
        .din_3_2_eq_0           (din_32_31_eq_0),
        .lead0_4b_0             (lead0_32_29_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_28_25 (
        .din                    (din[28:25]),

        .din_3_0_eq_0           (din_28_25_eq_0),
        .din_3_2_eq_0           (din_28_27_eq_0),
        .lead0_4b_0             (lead0_28_25_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_24_21 (
        .din                    (din[24:21]),

        .din_3_0_eq_0           (din_24_21_eq_0),
        .din_3_2_eq_0           (din_24_23_eq_0),
        .lead0_4b_0             (lead0_24_21_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_20_17 (
        .din                    (din[20:17]),

        .din_3_0_eq_0           (din_20_17_eq_0),
        .din_3_2_eq_0           (din_20_19_eq_0),
        .lead0_4b_0             (lead0_20_17_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_16_13 (
        .din                    (din[16:13]),

        .din_3_0_eq_0           (din_16_13_eq_0),
        .din_3_2_eq_0           (din_16_15_eq_0),
        .lead0_4b_0             (lead0_16_13_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_12_9 (
        .din                    (din[12:9]),

        .din_3_0_eq_0           (din_12_9_eq_0),
        .din_3_2_eq_0           (din_12_11_eq_0),
        .lead0_4b_0             (lead0_12_9_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_8_5 (
        .din                    (din[8:5]),

        .din_3_0_eq_0           (din_8_5_eq_0),
        .din_3_2_eq_0           (din_8_7_eq_0),
        .lead0_4b_0             (lead0_8_5_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_4_1 (
        .din                    (din[4:1]),

        .din_3_0_eq_0           (din_4_1_eq_0),
        .din_3_2_eq_0           (din_4_3_eq_0),
        .lead0_4b_0             (lead0_4_1_0)
);

assign lead0_0_0= (!din[0]);


fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_52_45 (
	.din_7_4_eq_0		(din_52_49_eq_0),
	.din_7_6_eq_0		(din_52_51_eq_0),
	.lead0_4b_0_hi		(lead0_52_49_0),
	.din_3_0_eq_0		(din_48_45_eq_0),
	.din_3_2_eq_0		(din_48_47_eq_0),
	.lead0_4b_0_lo		(lead0_48_45_0),

	.din_7_0_eq_0		(din_52_45_eq_0),
	.lead0_8b_1		(lead0_52_45_1),
	.lead0_8b_0		(lead0_52_45_0)
);

fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_44_37 (
        .din_7_4_eq_0           (din_44_41_eq_0),
        .din_7_6_eq_0           (din_44_43_eq_0),
        .lead0_4b_0_hi          (lead0_44_41_0),
        .din_3_0_eq_0           (din_40_37_eq_0),
        .din_3_2_eq_0           (din_40_39_eq_0),
        .lead0_4b_0_lo          (lead0_40_37_0),

        .din_7_0_eq_0           (din_44_37_eq_0),
        .lead0_8b_1             (lead0_44_37_1),
        .lead0_8b_0             (lead0_44_37_0)
);

fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_36_29 (
        .din_7_4_eq_0           (din_36_33_eq_0),
        .din_7_6_eq_0           (din_36_35_eq_0),
        .lead0_4b_0_hi          (lead0_36_33_0),
        .din_3_0_eq_0           (din_32_29_eq_0),
        .din_3_2_eq_0           (din_32_31_eq_0),
        .lead0_4b_0_lo          (lead0_32_29_0),

        .din_7_0_eq_0           (din_36_29_eq_0),
        .lead0_8b_1             (lead0_36_29_1),
        .lead0_8b_0             (lead0_36_29_0)
);

fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_28_21 (
        .din_7_4_eq_0           (din_28_25_eq_0),
        .din_7_6_eq_0           (din_28_27_eq_0),
        .lead0_4b_0_hi          (lead0_28_25_0),
        .din_3_0_eq_0           (din_24_21_eq_0),
        .din_3_2_eq_0           (din_24_23_eq_0),
        .lead0_4b_0_lo          (lead0_24_21_0),

        .din_7_0_eq_0           (din_28_21_eq_0),
        .lead0_8b_1             (lead0_28_21_1),
        .lead0_8b_0             (lead0_28_21_0)
);

fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_20_13 (
        .din_7_4_eq_0           (din_20_17_eq_0),
        .din_7_6_eq_0           (din_20_19_eq_0),
        .lead0_4b_0_hi          (lead0_20_17_0),
        .din_3_0_eq_0           (din_16_13_eq_0),
        .din_3_2_eq_0           (din_16_15_eq_0),
        .lead0_4b_0_lo          (lead0_16_13_0),

        .din_7_0_eq_0           (din_20_13_eq_0),
        .lead0_8b_1             (lead0_20_13_1),
        .lead0_8b_0             (lead0_20_13_0)
);

fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_12_5 (
        .din_7_4_eq_0           (din_12_9_eq_0),
        .din_7_6_eq_0           (din_12_11_eq_0),
        .lead0_4b_0_hi          (lead0_12_9_0),
        .din_3_0_eq_0           (din_8_5_eq_0),
        .din_3_2_eq_0           (din_8_7_eq_0),
        .lead0_4b_0_lo          (lead0_8_5_0),

        .din_7_0_eq_0           (din_12_5_eq_0),
        .lead0_8b_1             (lead0_12_5_1),
        .lead0_8b_0             (lead0_12_5_0)
);

assign lead0_4_0_1= (!din_4_1_eq_0) && din_4_3_eq_0;

assign lead0_4_0_0= ((!din_4_1_eq_0) && lead0_4_1_0)
		|| (din_4_1_eq_0 && lead0_0_0);


fpu_cnt_lead0_lvl3 i_fpu_cnt_lead0_lvl3_52_37 (
	.din_15_8_eq_0		(din_52_45_eq_0),
	.din_15_12_eq_0		(din_52_49_eq_0),
	.lead0_8b_1_hi		(lead0_52_45_1),
	.lead0_8b_0_hi		(lead0_52_45_0),
	.din_7_0_eq_0		(din_44_37_eq_0),
	.din_7_4_eq_0		(din_44_41_eq_0),
	.lead0_8b_1_lo		(lead0_44_37_1),
	.lead0_8b_0_lo		(lead0_44_37_0),

	.din_15_0_eq_0		(din_52_37_eq_0),
	.lead0_16b_2		(lead0_52_37_2),
	.lead0_16b_1		(lead0_52_37_1),
	.lead0_16b_0		(lead0_52_37_0)
);

fpu_cnt_lead0_lvl3 i_fpu_cnt_lead0_lvl3_36_21 (
        .din_15_8_eq_0          (din_36_29_eq_0),
        .din_15_12_eq_0         (din_36_33_eq_0),           
        .lead0_8b_1_hi          (lead0_36_29_1),
        .lead0_8b_0_hi          (lead0_36_29_0),
        .din_7_0_eq_0           (din_28_21_eq_0),
        .din_7_4_eq_0           (din_28_25_eq_0),
        .lead0_8b_1_lo          (lead0_28_21_1),
        .lead0_8b_0_lo          (lead0_28_21_0),

        .din_15_0_eq_0          (din_36_21_eq_0),
        .lead0_16b_2            (lead0_36_21_2),
        .lead0_16b_1            (lead0_36_21_1),
        .lead0_16b_0            (lead0_36_21_0)
);

fpu_cnt_lead0_lvl3 i_fpu_cnt_lead0_lvl3_20_5 (
        .din_15_8_eq_0          (din_20_13_eq_0),
        .din_15_12_eq_0         (din_20_17_eq_0),           
        .lead0_8b_1_hi          (lead0_20_13_1),
        .lead0_8b_0_hi          (lead0_20_13_0),
        .din_7_0_eq_0           (din_12_5_eq_0),
        .din_7_4_eq_0           (din_12_9_eq_0),
        .lead0_8b_1_lo          (lead0_12_5_1),
        .lead0_8b_0_lo          (lead0_12_5_0),

        .din_15_0_eq_0          (din_20_5_eq_0),
        .lead0_16b_2            (lead0_20_5_2),
        .lead0_16b_1            (lead0_20_5_1),
        .lead0_16b_0            (lead0_20_5_0)
);

assign lead0_4_0_2= din_4_1_eq_0;


fpu_cnt_lead0_lvl4 i_fpu_cnt_lead0_lvl4_52_21 (
	.din_31_16_eq_0		(din_52_37_eq_0),
	.din_31_24_eq_0		(din_52_45_eq_0),
	.lead0_16b_2_hi		(lead0_52_37_2),
	.lead0_16b_1_hi		(lead0_52_37_1),
	.lead0_16b_0_hi		(lead0_52_37_0),
	.din_15_0_eq_0		(din_36_21_eq_0),
	.din_15_8_eq_0		(din_36_29_eq_0),
	.lead0_16b_2_lo		(lead0_36_21_2),
	.lead0_16b_1_lo		(lead0_36_21_1),
	.lead0_16b_0_lo		(lead0_36_21_0),

	.din_31_0_eq_0		(din_52_21_eq_0),
	.lead0_32b_3		(lead0_52_21_3),
	.lead0_32b_2		(lead0_52_21_2),
	.lead0_32b_1		(lead0_52_21_1),
	.lead0_32b_0		(lead0_52_21_0)
);

fpu_cnt_lead0_lvl4 i_fpu_cnt_lead0_lvl4_20_0 (
        .din_31_16_eq_0         (din_20_5_eq_0),
        .din_31_24_eq_0         (din_20_13_eq_0),
        .lead0_16b_2_hi         (lead0_20_5_2),
        .lead0_16b_1_hi         (lead0_20_5_1),
        .lead0_16b_0_hi         (lead0_20_5_0),
        .din_15_0_eq_0          (1'b0),     
        .din_15_8_eq_0          (1'b0),
        .lead0_16b_2_lo         (lead0_4_0_2),
        .lead0_16b_1_lo         (lead0_4_0_1),
        .lead0_16b_0_lo         (lead0_4_0_0),

        .din_31_0_eq_0          (            ),
        .lead0_32b_3            (lead0_20_0_3),
        .lead0_32b_2            (lead0_20_0_2),
        .lead0_32b_1            (lead0_20_0_1),
        .lead0_32b_0            (lead0_20_0_0)
);

assign lead0_5= din_52_21_eq_0;

assign lead0_4= ((!din_52_21_eq_0) && din_52_37_eq_0)
		|| (din_52_21_eq_0 && din_20_5_eq_0);

assign lead0_3= ((!din_52_21_eq_0) && lead0_52_21_3)
		|| (din_52_21_eq_0 && lead0_20_0_3);

assign lead0_2= ((!din_52_21_eq_0) && lead0_52_21_2)
		|| (din_52_21_eq_0 && lead0_20_0_2);

assign lead0_1= ((!din_52_21_eq_0) && lead0_52_21_1)
		|| (din_52_21_eq_0 && lead0_20_0_1);

assign lead0_0= ((!din_52_21_eq_0) && lead0_52_21_0)
		|| (din_52_21_eq_0 && lead0_20_0_0);

assign lead0[5:0]= {lead0_5, lead0_4, lead0_3, lead0_2, lead0_1, lead0_0};


endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_cnt_lead0_64b.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//	64 bit lead 0 counter.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_cnt_lead0_64b (
        din,

        lead0
);


input [63:0]    din;                    // data in- count its leading 0's

output [5:0]    lead0;                  // number of leading 0's in data in


wire		din_63_60_eq_0;
wire		din_63_62_eq_0;
wire		lead0_63_60_0;
wire		din_59_56_eq_0;
wire		din_59_58_eq_0;
wire		lead0_59_56_0;
wire		din_55_52_eq_0;
wire		din_55_54_eq_0;
wire		lead0_55_52_0;
wire		din_51_48_eq_0;
wire		din_51_50_eq_0;
wire		lead0_51_48_0;
wire		din_47_44_eq_0;
wire		din_47_46_eq_0;
wire		lead0_47_44_0;
wire		din_43_40_eq_0;
wire		din_43_42_eq_0;
wire		lead0_43_40_0;
wire		din_39_36_eq_0;
wire		din_39_38_eq_0;
wire		lead0_39_36_0;
wire		din_35_32_eq_0;
wire		din_35_34_eq_0;
wire		lead0_35_32_0;
wire		din_31_28_eq_0;
wire		din_31_30_eq_0;
wire		lead0_31_28_0;
wire		din_27_24_eq_0;
wire		din_27_26_eq_0;
wire		lead0_27_24_0;
wire		din_23_20_eq_0;
wire		din_23_22_eq_0;
wire		lead0_23_20_0;
wire		din_19_16_eq_0;
wire		din_19_18_eq_0;
wire		lead0_19_16_0;
wire		din_15_12_eq_0;
wire		din_15_14_eq_0;
wire		lead0_15_12_0;
wire		din_11_8_eq_0;
wire		din_11_10_eq_0;
wire		lead0_11_8_0;
wire		din_7_4_eq_0;
wire		din_7_6_eq_0;
wire		lead0_7_4_0;
wire		din_3_0_eq_0;
wire		din_3_2_eq_0;
wire		lead0_3_0_0;
wire		din_63_56_eq_0;
wire		lead0_63_56_1;
wire		lead0_63_56_0;
wire		din_55_48_eq_0;
wire		lead0_55_48_1;
wire		lead0_55_48_0;
wire		din_47_40_eq_0;
wire		lead0_47_40_1;
wire		lead0_47_40_0;
wire		din_39_32_eq_0;
wire		lead0_39_32_1;
wire		lead0_39_32_0;
wire		din_31_24_eq_0;
wire		lead0_31_24_1;
wire		lead0_31_24_0;
wire		din_23_16_eq_0;
wire		lead0_23_16_1;
wire		lead0_23_16_0;
wire		din_15_8_eq_0;
wire		lead0_15_8_1;
wire		lead0_15_8_0;
wire		din_7_0_eq_0;
wire		lead0_7_0_1;
wire		lead0_7_0_0;
wire		din_63_48_eq_0;
wire		lead0_63_48_2;
wire		lead0_63_48_1;
wire		lead0_63_48_0;
wire		din_47_32_eq_0;
wire		lead0_47_32_2;
wire		lead0_47_32_1;
wire		lead0_47_32_0;
wire		din_31_16_eq_0;
wire		lead0_31_16_2;
wire		lead0_31_16_1;
wire		lead0_31_16_0;
wire		din_15_0_eq_0;
wire		lead0_15_0_2;
wire		lead0_15_0_1;
wire		lead0_15_0_0;
wire		din_63_32_eq_0;
wire		lead0_63_32_3;
wire		lead0_63_32_2;
wire		lead0_63_32_1;
wire		din_31_0_eq_0;
wire		lead0_31_0_3;
wire		lead0_31_0_2;
wire		lead0_31_0_1;
wire		lead0_31_0_0;
wire		lead0_6;
wire		lead0_5;
wire		lead0_4;
wire		lead0_3;
wire		lead0_2;
wire		lead0_1;
wire		lead0_0;
wire [5:0]	lead0;

//Previously missing wires
wire        lead0_63_32_0;

///////////////////////////////////////////////////////////////////////////////
//
//      Instantiations of lead 0 building blocks.
//
///////////////////////////////////////////////////////////////////////////////

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_63_60 (
	.din			(din[63:60]),

	.din_3_0_eq_0		(din_63_60_eq_0),
	.din_3_2_eq_0		(din_63_62_eq_0),
	.lead0_4b_0		(lead0_63_60_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_59_56 (
        .din                    (din[59:56]),

        .din_3_0_eq_0           (din_59_56_eq_0),
        .din_3_2_eq_0           (din_59_58_eq_0),
        .lead0_4b_0             (lead0_59_56_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_55_52 (
        .din                    (din[55:52]),

        .din_3_0_eq_0           (din_55_52_eq_0),
        .din_3_2_eq_0           (din_55_54_eq_0),
        .lead0_4b_0             (lead0_55_52_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_51_48 (
        .din                    (din[51:48]),

        .din_3_0_eq_0           (din_51_48_eq_0),
        .din_3_2_eq_0           (din_51_50_eq_0),
        .lead0_4b_0             (lead0_51_48_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_47_44 (
        .din                    (din[47:44]),

        .din_3_0_eq_0           (din_47_44_eq_0),
        .din_3_2_eq_0           (din_47_46_eq_0),
        .lead0_4b_0             (lead0_47_44_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_43_40 (
        .din                    (din[43:40]),

        .din_3_0_eq_0           (din_43_40_eq_0),
        .din_3_2_eq_0           (din_43_42_eq_0),
        .lead0_4b_0             (lead0_43_40_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_39_36 (
        .din                    (din[39:36]),

        .din_3_0_eq_0           (din_39_36_eq_0),
        .din_3_2_eq_0           (din_39_38_eq_0),
        .lead0_4b_0             (lead0_39_36_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_35_32 (
        .din                    (din[35:32]),

        .din_3_0_eq_0           (din_35_32_eq_0),
        .din_3_2_eq_0           (din_35_34_eq_0),
        .lead0_4b_0             (lead0_35_32_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_31_28 (
        .din                    (din[31:28]),

        .din_3_0_eq_0           (din_31_28_eq_0),
        .din_3_2_eq_0           (din_31_30_eq_0),
        .lead0_4b_0             (lead0_31_28_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_27_24 (
        .din                    (din[27:24]),

        .din_3_0_eq_0           (din_27_24_eq_0),
        .din_3_2_eq_0           (din_27_26_eq_0),
        .lead0_4b_0             (lead0_27_24_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_23_20 (
        .din                    (din[23:20]),

        .din_3_0_eq_0           (din_23_20_eq_0),
        .din_3_2_eq_0           (din_23_22_eq_0),
        .lead0_4b_0             (lead0_23_20_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_19_16 (
        .din                    (din[19:16]),

        .din_3_0_eq_0           (din_19_16_eq_0),
        .din_3_2_eq_0           (din_19_18_eq_0),
        .lead0_4b_0             (lead0_19_16_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_15_12 (
        .din                    (din[15:12]),

        .din_3_0_eq_0           (din_15_12_eq_0),
        .din_3_2_eq_0           (din_15_14_eq_0),
        .lead0_4b_0             (lead0_15_12_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_11_8 (
        .din                    (din[11:8]),

        .din_3_0_eq_0           (din_11_8_eq_0),
        .din_3_2_eq_0           (din_11_10_eq_0),
        .lead0_4b_0             (lead0_11_8_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_7_4 (
        .din                    (din[7:4]),

        .din_3_0_eq_0           (din_7_4_eq_0),
        .din_3_2_eq_0           (din_7_6_eq_0),
        .lead0_4b_0             (lead0_7_4_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_3_0 (
        .din                    (din[3:0]),

        .din_3_0_eq_0           (din_3_0_eq_0),
        .din_3_2_eq_0           (din_3_2_eq_0),
        .lead0_4b_0             (lead0_3_0_0)
);


fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_63_56 (
	.din_7_4_eq_0		(din_63_60_eq_0),
	.din_7_6_eq_0		(din_63_62_eq_0),
	.lead0_4b_0_hi		(lead0_63_60_0),
	.din_3_0_eq_0		(din_59_56_eq_0),
	.din_3_2_eq_0		(din_59_58_eq_0),
	.lead0_4b_0_lo		(lead0_59_56_0),

	.din_7_0_eq_0		(din_63_56_eq_0),
	.lead0_8b_1		(lead0_63_56_1),
	.lead0_8b_0		(lead0_63_56_0)
);

fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_55_48 (
        .din_7_4_eq_0           (din_55_52_eq_0),
        .din_7_6_eq_0           (din_55_54_eq_0),
        .lead0_4b_0_hi          (lead0_55_52_0),
        .din_3_0_eq_0           (din_51_48_eq_0),
        .din_3_2_eq_0           (din_51_50_eq_0),
        .lead0_4b_0_lo          (lead0_51_48_0),

        .din_7_0_eq_0           (din_55_48_eq_0),
        .lead0_8b_1             (lead0_55_48_1),
        .lead0_8b_0             (lead0_55_48_0)
);

fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_47_40 (
        .din_7_4_eq_0           (din_47_44_eq_0),
        .din_7_6_eq_0           (din_47_46_eq_0),
        .lead0_4b_0_hi          (lead0_47_44_0),
        .din_3_0_eq_0           (din_43_40_eq_0),
        .din_3_2_eq_0           (din_43_42_eq_0),
        .lead0_4b_0_lo          (lead0_43_40_0),

        .din_7_0_eq_0           (din_47_40_eq_0),
        .lead0_8b_1             (lead0_47_40_1),
        .lead0_8b_0             (lead0_47_40_0)
);

fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_39_32 (
        .din_7_4_eq_0           (din_39_36_eq_0),
        .din_7_6_eq_0           (din_39_38_eq_0),
        .lead0_4b_0_hi          (lead0_39_36_0),
        .din_3_0_eq_0           (din_35_32_eq_0),
        .din_3_2_eq_0           (din_35_34_eq_0),
        .lead0_4b_0_lo          (lead0_35_32_0),

        .din_7_0_eq_0           (din_39_32_eq_0),
        .lead0_8b_1             (lead0_39_32_1),
        .lead0_8b_0             (lead0_39_32_0)
);

fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_31_24 (
        .din_7_4_eq_0           (din_31_28_eq_0),
        .din_7_6_eq_0           (din_31_30_eq_0),
        .lead0_4b_0_hi          (lead0_31_28_0),
        .din_3_0_eq_0           (din_27_24_eq_0),
        .din_3_2_eq_0           (din_27_26_eq_0),
        .lead0_4b_0_lo          (lead0_27_24_0),

        .din_7_0_eq_0           (din_31_24_eq_0),
        .lead0_8b_1             (lead0_31_24_1),
        .lead0_8b_0             (lead0_31_24_0)
);

fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_23_16 (
        .din_7_4_eq_0           (din_23_20_eq_0),
        .din_7_6_eq_0           (din_23_22_eq_0),
        .lead0_4b_0_hi          (lead0_23_20_0),
        .din_3_0_eq_0           (din_19_16_eq_0),
        .din_3_2_eq_0           (din_19_18_eq_0),
        .lead0_4b_0_lo          (lead0_19_16_0),

        .din_7_0_eq_0           (din_23_16_eq_0),
        .lead0_8b_1             (lead0_23_16_1),
        .lead0_8b_0             (lead0_23_16_0)
);

fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_15_8 (
        .din_7_4_eq_0           (din_15_12_eq_0),
        .din_7_6_eq_0           (din_15_14_eq_0),
        .lead0_4b_0_hi          (lead0_15_12_0),
        .din_3_0_eq_0           (din_11_8_eq_0),
        .din_3_2_eq_0           (din_11_10_eq_0),
        .lead0_4b_0_lo          (lead0_11_8_0),

        .din_7_0_eq_0           (din_15_8_eq_0),
        .lead0_8b_1             (lead0_15_8_1),
        .lead0_8b_0             (lead0_15_8_0)
);

fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_7_0 (
        .din_7_4_eq_0           (din_7_4_eq_0),
        .din_7_6_eq_0           (din_7_6_eq_0),
        .lead0_4b_0_hi          (lead0_7_4_0),
        .din_3_0_eq_0           (din_3_0_eq_0),
        .din_3_2_eq_0           (din_3_2_eq_0),
        .lead0_4b_0_lo          (lead0_3_0_0),

        .din_7_0_eq_0           (din_7_0_eq_0),
        .lead0_8b_1             (lead0_7_0_1),
        .lead0_8b_0             (lead0_7_0_0)
);


fpu_cnt_lead0_lvl3 i_fpu_cnt_lead0_lvl3_63_48 (
	.din_15_8_eq_0		(din_63_56_eq_0),
	.din_15_12_eq_0		(din_63_60_eq_0),
	.lead0_8b_1_hi		(lead0_63_56_1),
	.lead0_8b_0_hi		(lead0_63_56_0),
	.din_7_0_eq_0		(din_55_48_eq_0),
	.din_7_4_eq_0		(din_55_52_eq_0),
	.lead0_8b_1_lo		(lead0_55_48_1),
	.lead0_8b_0_lo		(lead0_55_48_0),

	.din_15_0_eq_0		(din_63_48_eq_0),
	.lead0_16b_2		(lead0_63_48_2),
	.lead0_16b_1		(lead0_63_48_1),
	.lead0_16b_0		(lead0_63_48_0)
);

fpu_cnt_lead0_lvl3 i_fpu_cnt_lead0_lvl3_47_32 (
        .din_15_8_eq_0          (din_47_40_eq_0),
        .din_15_12_eq_0         (din_47_44_eq_0),
        .lead0_8b_1_hi          (lead0_47_40_1),
        .lead0_8b_0_hi          (lead0_47_40_0),
        .din_7_0_eq_0           (din_39_32_eq_0),
        .din_7_4_eq_0           (din_39_36_eq_0),
        .lead0_8b_1_lo          (lead0_39_32_1),
        .lead0_8b_0_lo          (lead0_39_32_0),

        .din_15_0_eq_0          (din_47_32_eq_0),
        .lead0_16b_2            (lead0_47_32_2),
        .lead0_16b_1            (lead0_47_32_1),
        .lead0_16b_0            (lead0_47_32_0)
);

fpu_cnt_lead0_lvl3 i_fpu_cnt_lead0_lvl3_31_16 (
        .din_15_8_eq_0          (din_31_24_eq_0),
        .din_15_12_eq_0         (din_31_28_eq_0),
        .lead0_8b_1_hi          (lead0_31_24_1),
        .lead0_8b_0_hi          (lead0_31_24_0),
        .din_7_0_eq_0           (din_23_16_eq_0),
        .din_7_4_eq_0           (din_23_20_eq_0),
        .lead0_8b_1_lo          (lead0_23_16_1),
        .lead0_8b_0_lo          (lead0_23_16_0),

        .din_15_0_eq_0          (din_31_16_eq_0),
        .lead0_16b_2            (lead0_31_16_2),
        .lead0_16b_1            (lead0_31_16_1),
        .lead0_16b_0            (lead0_31_16_0)
);

fpu_cnt_lead0_lvl3 i_fpu_cnt_lead0_lvl3_15_0 (
        .din_15_8_eq_0          (din_15_8_eq_0),
        .din_15_12_eq_0         (din_15_12_eq_0),
        .lead0_8b_1_hi          (lead0_15_8_1),
        .lead0_8b_0_hi          (lead0_15_8_0),
        .din_7_0_eq_0           (din_7_0_eq_0),
        .din_7_4_eq_0           (din_7_4_eq_0),
        .lead0_8b_1_lo          (lead0_7_0_1),
        .lead0_8b_0_lo          (lead0_7_0_0),

        .din_15_0_eq_0          (din_15_0_eq_0),
        .lead0_16b_2            (lead0_15_0_2),
        .lead0_16b_1            (lead0_15_0_1),
        .lead0_16b_0            (lead0_15_0_0)
);


fpu_cnt_lead0_lvl4 i_fpu_cnt_lead0_lvl4_63_32 (
	.din_31_16_eq_0		(din_63_48_eq_0),
	.din_31_24_eq_0		(din_63_56_eq_0),
	.lead0_16b_2_hi		(lead0_63_48_2),
	.lead0_16b_1_hi		(lead0_63_48_1),
	.lead0_16b_0_hi		(lead0_63_48_0),
	.din_15_0_eq_0		(din_47_32_eq_0),
	.din_15_8_eq_0		(din_47_40_eq_0),
	.lead0_16b_2_lo		(lead0_47_32_2),
	.lead0_16b_1_lo		(lead0_47_32_1),
	.lead0_16b_0_lo		(lead0_47_32_0),

	.din_31_0_eq_0		(din_63_32_eq_0),
	.lead0_32b_3		(lead0_63_32_3),
	.lead0_32b_2		(lead0_63_32_2),
	.lead0_32b_1		(lead0_63_32_1),
	.lead0_32b_0		(lead0_63_32_0)
);

fpu_cnt_lead0_lvl4 i_fpu_cnt_lead0_lvl4_31_0 (
        .din_31_16_eq_0         (din_31_16_eq_0),
        .din_31_24_eq_0         (din_31_24_eq_0),
        .lead0_16b_2_hi         (lead0_31_16_2),
        .lead0_16b_1_hi         (lead0_31_16_1),
        .lead0_16b_0_hi         (lead0_31_16_0),
        .din_15_0_eq_0          (din_15_0_eq_0),
        .din_15_8_eq_0          (din_15_8_eq_0),
        .lead0_16b_2_lo         (lead0_15_0_2),
        .lead0_16b_1_lo         (lead0_15_0_1),
        .lead0_16b_0_lo         (lead0_15_0_0),

        .din_31_0_eq_0          (din_31_0_eq_0),
        .lead0_32b_3            (lead0_31_0_3),
        .lead0_32b_2            (lead0_31_0_2),
        .lead0_32b_1            (lead0_31_0_1),
        .lead0_32b_0            (lead0_31_0_0)
);


assign lead0_6= din_63_32_eq_0 && din_31_0_eq_0;

assign lead0_5= (!lead0_6) && din_63_32_eq_0;

assign lead0_4= ((!din_63_32_eq_0) && din_63_48_eq_0)
		|| (din_63_32_eq_0 && din_31_16_eq_0 && (!lead0_6));

assign lead0_3= ((!din_63_32_eq_0) && lead0_63_32_3)
		|| (din_63_32_eq_0 && lead0_31_0_3 && (!lead0_6));

assign lead0_2= ((!din_63_32_eq_0) && lead0_63_32_2)
		|| (din_63_32_eq_0 && lead0_31_0_2 && (!lead0_6));
 
assign lead0_1= ((!din_63_32_eq_0) && lead0_63_32_1)
		|| (din_63_32_eq_0 && lead0_31_0_1 && (!lead0_6));
 
assign lead0_0= ((!din_63_32_eq_0) && lead0_63_32_0)
		|| (din_63_32_eq_0 && lead0_31_0_0 && (!lead0_6));

assign lead0[5:0]= {lead0_5, lead0_4, lead0_3, lead0_2, lead0_1,
		lead0_0};


endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_cnt_lead0_lvl1.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//      Lowest level of lead 0 counters.  Lead 0 count for 4 bits.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_cnt_lead0_lvl1 (
	din,

	din_3_0_eq_0,
	din_3_2_eq_0,
	lead0_4b_0
);


input [3:0]	din;			// data for lead 0 count bits[3:0]

output		din_3_0_eq_0;		// data in[3:0] is zero
output		din_3_2_eq_0;		// data in[3:2] is zero
output		lead0_4b_0;		// bit[0] of lead 0 count


wire		din_3_0_eq_0;
wire		din_3_2_eq_0;
wire		lead0_4b_0;


assign din_3_0_eq_0= (!(|din[3:0]));

assign din_3_2_eq_0= (!(|din[3:2]));

assign lead0_4b_0= ((!din_3_2_eq_0) && (!din[3]))
		|| (din_3_2_eq_0 && (!din[1]));

endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_cnt_lead0_lvl2.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//	2nd level of lead 0 counters.  Lead 0 count for 8 bits.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_cnt_lead0_lvl2 (
	din_7_4_eq_0,
	din_7_6_eq_0,
	lead0_4b_0_hi,
	din_3_0_eq_0,
	din_3_2_eq_0,
	lead0_4b_0_lo,

	din_7_0_eq_0,
	lead0_8b_1,
	lead0_8b_0
);


input		din_7_4_eq_0;		// data in[7:4] is zero
input		din_7_6_eq_0;		// data in[7:6] is zero
input		lead0_4b_0_hi;		// bit[0] of lead 0 count- data in[7:4]
input		din_3_0_eq_0;		// data in[3:0] is zero
input		din_3_2_eq_0;		// data in[3:2] is zero
input		lead0_4b_0_lo;		// bit[0] of lead 0 count- data in[3:0]

output		din_7_0_eq_0;		// data in[7:0] is zero
output		lead0_8b_1;		// bit[1] of lead 0 count
output		lead0_8b_0;		// bit[0] of lead 0 count

wire		din_7_0_eq_0;
wire		lead0_8b_1;
wire		lead0_8b_0;


assign din_7_0_eq_0= din_3_0_eq_0 && din_7_4_eq_0;

assign lead0_8b_1= ((!din_7_4_eq_0) && din_7_6_eq_0)
		|| (din_7_4_eq_0 && din_3_2_eq_0);

assign lead0_8b_0= ((!din_7_4_eq_0) && lead0_4b_0_hi)
		|| (din_7_4_eq_0 && lead0_4b_0_lo);


endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_cnt_lead0_lvl3.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//	3rd level of lead 0 counters.  Lead 0 count for 16 bits.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_cnt_lead0_lvl3 (
	din_15_8_eq_0,
	din_15_12_eq_0,
	lead0_8b_1_hi,
	lead0_8b_0_hi,
	din_7_0_eq_0,
	din_7_4_eq_0,
	lead0_8b_1_lo,
	lead0_8b_0_lo,

	din_15_0_eq_0,
	lead0_16b_2,
	lead0_16b_1,
	lead0_16b_0
);


input		din_15_8_eq_0;		// data in[15:8] is zero
input		din_15_12_eq_0;		// data in[15:12] is zero
input		lead0_8b_1_hi;		// bit[1] of lead 0 count- din[15:8]
input		lead0_8b_0_hi;		// bit[0] of lead 0 count- din[15:8]
input		din_7_0_eq_0;		// data in[7:0] is zero
input		din_7_4_eq_0;		// data in[7:4] is zero
input		lead0_8b_1_lo;		// bit[1] of lead 0 count- din[7:0]
input		lead0_8b_0_lo;		// bit[0] of lead 0 count- din[7:0]

output		din_15_0_eq_0;		// data in[15:0] is zero
output		lead0_16b_2;		// bit[2] of lead 0 count
output		lead0_16b_1;		// bit[1] of lead 0 count
output		lead0_16b_0;		// bit[0] of lead 0 count


wire		din_15_0_eq_0;
wire		lead0_16b_2;
wire		lead0_16b_1;
wire		lead0_16b_0;


assign din_15_0_eq_0= din_7_0_eq_0 && din_15_8_eq_0;

assign lead0_16b_2= ((!din_15_8_eq_0) && din_15_12_eq_0)
		|| (din_15_8_eq_0 && din_7_4_eq_0);

assign lead0_16b_1= ((!din_15_8_eq_0) && lead0_8b_1_hi)
		|| (din_15_8_eq_0 && lead0_8b_1_lo);

assign lead0_16b_0= ((!din_15_8_eq_0) && lead0_8b_0_hi)
		|| (din_15_8_eq_0 && lead0_8b_0_lo);


endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_cnt_lead0_lvl4.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//	4th level of lead 0 counters.  Lead 0 count for 32 bits.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_cnt_lead0_lvl4 (
	din_31_16_eq_0,
	din_31_24_eq_0,
	lead0_16b_2_hi,
	lead0_16b_1_hi,
	lead0_16b_0_hi,
	din_15_0_eq_0,
	din_15_8_eq_0,
	lead0_16b_2_lo,
	lead0_16b_1_lo,
	lead0_16b_0_lo,

	din_31_0_eq_0,
	lead0_32b_3,
	lead0_32b_2,
	lead0_32b_1,
	lead0_32b_0
);


input		din_31_16_eq_0;		// data in[31:16] is zero
input		din_31_24_eq_0;		// data in[31:24] is zero
input		lead0_16b_2_hi;		// bit[2] of lead 0 count- din[31:16]
input		lead0_16b_1_hi;		// bit[1] of lead 0 count- din[31:16]
input		lead0_16b_0_hi;		// bit[0] of lead 0 count- din[31:16]
input		din_15_0_eq_0;		// data in[15:0] is zero
input		din_15_8_eq_0;		// data in[15:8] is zero
input		lead0_16b_2_lo;		// bit[2] of lead 0 count- din[15:0]
input		lead0_16b_1_lo;		// bit[1] of lead 0 count- din[15:0]
input		lead0_16b_0_lo;		// bit[0] of lead 0 count- din[15:0]

output		din_31_0_eq_0;		// data in[31:0] is zero
output		lead0_32b_3;		// bit[3] of lead 0 count
output		lead0_32b_2;		// bit[2] of lead 0 count
output		lead0_32b_1;		// bit[1] of lead 0 count
output		lead0_32b_0;		// bit[0] of lead 0 count


wire		din_31_0_eq_0;
wire		lead0_32b_3;
wire		lead0_32b_2;
wire		lead0_32b_1;
wire		lead0_32b_0;


assign din_31_0_eq_0= din_15_0_eq_0 && din_31_16_eq_0;

assign lead0_32b_3= ((!din_31_16_eq_0) && din_31_24_eq_0)
		|| (din_31_16_eq_0 && din_15_8_eq_0);

assign lead0_32b_2= ((!din_31_16_eq_0) && lead0_16b_2_hi)
		|| (din_31_16_eq_0 && lead0_16b_2_lo);

assign lead0_32b_1= ((!din_31_16_eq_0) && lead0_16b_1_hi)
		|| (din_31_16_eq_0 && lead0_16b_1_lo);

assign lead0_32b_0= ((!din_31_16_eq_0) && lead0_16b_0_hi)
		|| (din_31_16_eq_0 && lead0_16b_0_lo);


endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_denorm_3b.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//      Three bit comparison of two inputs when both will always have
//		leading 0s.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_denorm_3b (
	din1,
	din2,

	din2_din1_nz,
	din2_din1_denorm
);


input [2:0]     din1;                   // input 1- 3 bits
input [2:0]     din2;                   // input 2- 3 bits

output		din2_din1_nz;		// input 1 and input 2 are not 0
output		din2_din1_denorm;	// input 1 is a denorm


wire [2:0]	din2_din1_zero;
wire		din2_din1_nz;
wire		din2_din1_denorm;


assign din2_din1_zero[2:0]= (~(din1 | din2));

assign din2_din1_nz= (!(&din2_din1_zero[2:0]));

assign din2_din1_denorm= din2[2]
		|| (din2_din1_zero[2] && din2[1])
		|| ((&din2_din1_zero[2:1]) && din2[0]);


endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_denorm_3to1.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//      Reduce three fpu_denorm_3b results to one set of results.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_denorm_3to1 (
	din2_din1_nz_hi,
	din2_din1_denorm_hi,
	din2_din1_nz_mid,
	din2_din1_denorm_mid,
	din2_din1_nz_lo,
	din2_din1_denorm_lo,

	din2_din1_nz,
	din2_din1_denorm
);


input		din2_din1_nz_hi;	// input 1 and input 2 != 0- high 3 bits
input		din2_din1_denorm_hi;	// input 1 == denorm- high 3 bits
input		din2_din1_nz_mid;	// input 1 and input 2 != 0- mid 3 bits
input		din2_din1_denorm_mid;	// input 1 == denorm- mid 3 bits
input		din2_din1_nz_lo;	// input 1 and input 2 != 0- low 3 bits
input		din2_din1_denorm_lo;	// input 1 == denorm- low 3 bits

output		din2_din1_nz;		// input 1 and input 2 != 0
output		din2_din1_denorm;	// input 1 == denorm


wire		din2_din1_nz;
wire		din2_din1_denorm;


assign din2_din1_nz= din2_din1_nz_hi || din2_din1_nz_mid
		|| din2_din1_nz_lo;

assign din2_din1_denorm= (din2_din1_nz_hi && din2_din1_denorm_hi)
		|| ((!din2_din1_nz_hi) && din2_din1_nz_mid
			&& din2_din1_denorm_mid)
		|| ((!din2_din1_nz_hi) && (!din2_din1_nz_mid)
			&& din2_din1_denorm_lo);


endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_denorm_frac.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//      Fraction comparison of two inputs that both have leading 0's.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_denorm_frac (
	din1,
	din2,

	din2_din1_denorm,
	din2_din1_denorm_inv,
	din2_din1_denorma,
	din2_din1_denorm_inva
);


input [53:0]	din1;                   // input 1- fraction
input [53:0]    din2;                   // input 2- fraction

output		din2_din1_denorm;	// input 1 == denorm
output		din2_din1_denorm_inv;	// input 1 != denorm
output		din2_din1_denorma;	// input 1 == denorm- copy
output		din2_din1_denorm_inva;	// input 1 != denorm- copy


wire		din2_din1_nz_53_51;
wire		din2_din1_denorm_53_51;
wire		din2_din1_nz_50_48;
wire		din2_din1_denorm_50_48;
wire		din2_din1_nz_47_45;
wire		din2_din1_denorm_47_45;
wire		din2_din1_nz_44_42;
wire		din2_din1_denorm_44_42;
wire		din2_din1_nz_41_39;
wire		din2_din1_denorm_41_39;
wire		din2_din1_nz_38_36;
wire		din2_din1_denorm_38_36;
wire		din2_din1_nz_35_33;
wire		din2_din1_denorm_35_33;
wire		din2_din1_nz_32_30;
wire		din2_din1_denorm_32_30;
wire		din2_din1_nz_29_27;
wire		din2_din1_denorm_29_27;
wire		din2_din1_nz_26_24;
wire		din2_din1_denorm_26_24;
wire		din2_din1_nz_23_21;
wire		din2_din1_denorm_23_21;
wire		din2_din1_nz_20_18;
wire		din2_din1_denorm_20_18;
wire		din2_din1_nz_17_15;
wire		din2_din1_denorm_17_15;
wire		din2_din1_nz_14_12;
wire		din2_din1_denorm_14_12;
wire		din2_din1_nz_11_9;
wire		din2_din1_denorm_11_9;
wire		din2_din1_nz_8_6;
wire		din2_din1_denorm_8_6;
wire		din2_din1_nz_5_3;
wire		din2_din1_denorm_5_3;
wire		din2_din1_nz_2_0;
wire		din2_din1_denorm_2_0;
wire		din2_din1_nz_53_45;
wire		din2_din1_denorm_53_45;
wire		din2_din1_nz_44_36;
wire		din2_din1_denorm_44_36;
wire		din2_din1_nz_35_27;
wire		din2_din1_denorm_35_27;
wire		din2_din1_nz_26_18;
wire		din2_din1_denorm_26_18;
wire		din2_din1_nz_17_9;
wire		din2_din1_denorm_17_9;
wire		din2_din1_nz_8_0;
wire		din2_din1_denorm_8_0;
wire		din2_din1_nz_53_27;
wire		din2_din1_denorm_53_27;
wire		din2_din1_nz_26_0;
wire		din2_din1_denorm_26_0;
wire		din2_din1_denorm;
wire		din2_din1_denorm_inv;
wire		din2_din1_denorma;
wire		din2_din1_denorm_inva;


fpu_denorm_3b i_fpu_denorm_53_51 (
	.din1			(din1[53:51]),
	.din2			(din2[53:51]),

	.din2_din1_nz		(din2_din1_nz_53_51),
	.din2_din1_denorm	(din2_din1_denorm_53_51)
);

fpu_denorm_3b i_fpu_denorm_50_48 (
        .din1                   (din1[50:48]),
        .din2                   (din2[50:48]),

        .din2_din1_nz           (din2_din1_nz_50_48),
        .din2_din1_denorm       (din2_din1_denorm_50_48)
);

fpu_denorm_3b i_fpu_denorm_47_45 (
        .din1                   (din1[47:45]),
        .din2                   (din2[47:45]),

        .din2_din1_nz           (din2_din1_nz_47_45),
        .din2_din1_denorm       (din2_din1_denorm_47_45)
);

fpu_denorm_3b i_fpu_denorm_44_42 (
        .din1                   (din1[44:42]),
        .din2                   (din2[44:42]),

        .din2_din1_nz           (din2_din1_nz_44_42),
        .din2_din1_denorm       (din2_din1_denorm_44_42)
);

fpu_denorm_3b i_fpu_denorm_41_39 (
        .din1                   (din1[41:39]),
        .din2                   (din2[41:39]),

        .din2_din1_nz           (din2_din1_nz_41_39),
        .din2_din1_denorm       (din2_din1_denorm_41_39)
);

fpu_denorm_3b i_fpu_denorm_38_36 (
        .din1                   (din1[38:36]),
        .din2                   (din2[38:36]),

        .din2_din1_nz           (din2_din1_nz_38_36),
        .din2_din1_denorm       (din2_din1_denorm_38_36)
);

fpu_denorm_3b i_fpu_denorm_35_33 (
        .din1                   (din1[35:33]),
        .din2                   (din2[35:33]),

        .din2_din1_nz           (din2_din1_nz_35_33),
        .din2_din1_denorm       (din2_din1_denorm_35_33)
);

fpu_denorm_3b i_fpu_denorm_32_30 (
        .din1                   (din1[32:30]),
        .din2                   (din2[32:30]),

        .din2_din1_nz           (din2_din1_nz_32_30),
        .din2_din1_denorm       (din2_din1_denorm_32_30)
);

fpu_denorm_3b i_fpu_denorm_29_27 (
        .din1                   (din1[29:27]),
        .din2                   (din2[29:27]),

        .din2_din1_nz           (din2_din1_nz_29_27),
        .din2_din1_denorm       (din2_din1_denorm_29_27)
);

fpu_denorm_3b i_fpu_denorm_26_24 (
        .din1                   (din1[26:24]),
        .din2                   (din2[26:24]),

        .din2_din1_nz           (din2_din1_nz_26_24),
        .din2_din1_denorm       (din2_din1_denorm_26_24)
);

fpu_denorm_3b i_fpu_denorm_23_21 (
        .din1                   (din1[23:21]),
        .din2                   (din2[23:21]),

        .din2_din1_nz           (din2_din1_nz_23_21),
        .din2_din1_denorm       (din2_din1_denorm_23_21)
);

fpu_denorm_3b i_fpu_denorm_20_18 (
        .din1                   (din1[20:18]),
        .din2                   (din2[20:18]),

        .din2_din1_nz           (din2_din1_nz_20_18),
        .din2_din1_denorm       (din2_din1_denorm_20_18)
);

fpu_denorm_3b i_fpu_denorm_17_15 (
        .din1                   (din1[17:15]),
        .din2                   (din2[17:15]),

        .din2_din1_nz           (din2_din1_nz_17_15),
        .din2_din1_denorm       (din2_din1_denorm_17_15)
);

fpu_denorm_3b i_fpu_denorm_14_12 (
        .din1                   (din1[14:12]),
        .din2                   (din2[14:12]),

        .din2_din1_nz           (din2_din1_nz_14_12),
        .din2_din1_denorm       (din2_din1_denorm_14_12)
);

fpu_denorm_3b i_fpu_denorm_11_9 (
        .din1                   (din1[11:9]),
        .din2                   (din2[11:9]),

        .din2_din1_nz           (din2_din1_nz_11_9),
        .din2_din1_denorm       (din2_din1_denorm_11_9)
);

fpu_denorm_3b i_fpu_denorm_8_6 (
        .din1                   (din1[8:6]),
        .din2                   (din2[8:6]),

        .din2_din1_nz           (din2_din1_nz_8_6),
        .din2_din1_denorm       (din2_din1_denorm_8_6)
);

fpu_denorm_3b i_fpu_denorm_5_3 (
        .din1                   (din1[5:3]),
        .din2                   (din2[5:3]),

        .din2_din1_nz           (din2_din1_nz_5_3),
        .din2_din1_denorm       (din2_din1_denorm_5_3)
);

fpu_denorm_3b i_fpu_denorm_2_0 (
        .din1                   (din1[2:0]),
        .din2                   (din2[2:0]),

        .din2_din1_nz           (din2_din1_nz_2_0),
        .din2_din1_denorm       (din2_din1_denorm_2_0)
);


fpu_denorm_3to1 i_fpu_denorm_53_45 (
	.din2_din1_nz_hi	(din2_din1_nz_53_51),
	.din2_din1_denorm_hi	(din2_din1_denorm_53_51),
	.din2_din1_nz_mid	(din2_din1_nz_50_48),
	.din2_din1_denorm_mid	(din2_din1_denorm_50_48),
	.din2_din1_nz_lo	(din2_din1_nz_47_45),
	.din2_din1_denorm_lo	(din2_din1_denorm_47_45),

	.din2_din1_nz		(din2_din1_nz_53_45),
	.din2_din1_denorm	(din2_din1_denorm_53_45)
);

fpu_denorm_3to1 i_fpu_denorm_44_36 (
        .din2_din1_nz_hi        (din2_din1_nz_44_42),
        .din2_din1_denorm_hi    (din2_din1_denorm_44_42),
        .din2_din1_nz_mid       (din2_din1_nz_41_39),
        .din2_din1_denorm_mid   (din2_din1_denorm_41_39),
        .din2_din1_nz_lo        (din2_din1_nz_38_36),
        .din2_din1_denorm_lo    (din2_din1_denorm_38_36),

        .din2_din1_nz           (din2_din1_nz_44_36),
        .din2_din1_denorm       (din2_din1_denorm_44_36)
);

fpu_denorm_3to1 i_fpu_denorm_35_27 (
        .din2_din1_nz_hi        (din2_din1_nz_35_33),
        .din2_din1_denorm_hi    (din2_din1_denorm_35_33),
        .din2_din1_nz_mid       (din2_din1_nz_32_30),
        .din2_din1_denorm_mid   (din2_din1_denorm_32_30),
        .din2_din1_nz_lo        (din2_din1_nz_29_27),
        .din2_din1_denorm_lo    (din2_din1_denorm_29_27),

        .din2_din1_nz           (din2_din1_nz_35_27),
        .din2_din1_denorm       (din2_din1_denorm_35_27)
);

fpu_denorm_3to1 i_fpu_denorm_26_18 (
        .din2_din1_nz_hi        (din2_din1_nz_26_24),
        .din2_din1_denorm_hi    (din2_din1_denorm_26_24),
        .din2_din1_nz_mid       (din2_din1_nz_23_21),
        .din2_din1_denorm_mid   (din2_din1_denorm_23_21),
        .din2_din1_nz_lo        (din2_din1_nz_20_18),
        .din2_din1_denorm_lo    (din2_din1_denorm_20_18),

        .din2_din1_nz           (din2_din1_nz_26_18),
        .din2_din1_denorm       (din2_din1_denorm_26_18)
);

fpu_denorm_3to1 i_fpu_denorm_17_9 (
        .din2_din1_nz_hi        (din2_din1_nz_17_15),
        .din2_din1_denorm_hi    (din2_din1_denorm_17_15),
        .din2_din1_nz_mid       (din2_din1_nz_14_12),
        .din2_din1_denorm_mid   (din2_din1_denorm_14_12),
        .din2_din1_nz_lo        (din2_din1_nz_11_9),
        .din2_din1_denorm_lo    (din2_din1_denorm_11_9),

        .din2_din1_nz           (din2_din1_nz_17_9),
        .din2_din1_denorm       (din2_din1_denorm_17_9)
);

fpu_denorm_3to1 i_fpu_denorm_8_0 (
        .din2_din1_nz_hi        (din2_din1_nz_8_6),
        .din2_din1_denorm_hi    (din2_din1_denorm_8_6),
        .din2_din1_nz_mid       (din2_din1_nz_5_3),
        .din2_din1_denorm_mid   (din2_din1_denorm_5_3),
        .din2_din1_nz_lo        (din2_din1_nz_2_0),
        .din2_din1_denorm_lo    (din2_din1_denorm_2_0),

        .din2_din1_nz           (din2_din1_nz_8_0),
        .din2_din1_denorm       (din2_din1_denorm_8_0)
);


fpu_denorm_3to1 i_fpu_denorm_53_27 (
	.din2_din1_nz_hi	(din2_din1_nz_53_45),
	.din2_din1_denorm_hi	(din2_din1_denorm_53_45),
	.din2_din1_nz_mid	(din2_din1_nz_44_36),
	.din2_din1_denorm_mid	(din2_din1_denorm_44_36),
	.din2_din1_nz_lo	(din2_din1_nz_35_27),
	.din2_din1_denorm_lo	(din2_din1_denorm_35_27),

	.din2_din1_nz		(din2_din1_nz_53_27),
	.din2_din1_denorm	(din2_din1_denorm_53_27)
);

fpu_denorm_3to1 i_fpu_denorm_26_0 (
        .din2_din1_nz_hi        (din2_din1_nz_26_18),
        .din2_din1_denorm_hi    (din2_din1_denorm_26_18),
        .din2_din1_nz_mid       (din2_din1_nz_17_9),
        .din2_din1_denorm_mid   (din2_din1_denorm_17_9),
        .din2_din1_nz_lo        (din2_din1_nz_8_0),
        .din2_din1_denorm_lo    (din2_din1_denorm_8_0),

        .din2_din1_nz           (din2_din1_nz_26_0),
        .din2_din1_denorm       (din2_din1_denorm_26_0)
);


assign din2_din1_denorm= (din2_din1_nz_53_27 && din2_din1_denorm_53_27)
		|| ((!din2_din1_nz_53_27) && (!din2_din1_nz_26_0))
		|| ((!din2_din1_nz_53_27) && din2_din1_denorm_26_0);

assign din2_din1_denorm_inv= (!din2_din1_denorm);

assign din2_din1_denorma= din2_din1_denorm;

assign din2_din1_denorm_inva= din2_din1_denorm_inv;


endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_div.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//	FPU divide pipe.
//
///////////////////////////////////////////////////////////////////////////////


module fpu_div (
	inq_op,
	inq_rnd_mode,
	inq_id,
	inq_in1,
	inq_in1_53_0_neq_0,
	inq_in1_50_0_neq_0,
	inq_in1_53_32_neq_0,
	inq_in1_exp_eq_0,
	inq_in1_exp_neq_ffs,
	inq_in2,
	inq_in2_53_0_neq_0,
	inq_in2_50_0_neq_0,
	inq_in2_53_32_neq_0,
	inq_in2_exp_eq_0,
	inq_in2_exp_neq_ffs,
	inq_div,
	div_dest_rdy,
	fdiv_clken_l,
	fdiv_clken_l_div_exp_buf1,
	arst_l,
	grst_l,
	rclk,
	
	div_pipe_active,
	d1stg_step,
	d8stg_fdiv_in,
	div_id_out_in,
	div_exc_out,
	d8stg_fdivd,
	d8stg_fdivs,
	div_sign_out,
	div_exp_outa,
	div_frac_outa,

	se,
	si,
	so
);


input [7:0]	inq_op;			// request opcode to op pipes
input [1:0]	inq_rnd_mode;		// request rounding mode to op pipes
input [4:0]	inq_id;			// request ID to the operation pipes
input [63:0]	inq_in1;		// request operand 1 to op pipes
input		inq_in1_53_0_neq_0;	// request operand 1[53:0]!=0
input		inq_in1_50_0_neq_0;	// request operand 1[50:0]!=0
input		inq_in1_53_32_neq_0;	// request operand 1[53:32]!=0
input		inq_in1_exp_eq_0;	// request operand 1 exp==0
input		inq_in1_exp_neq_ffs;	// request operand 1 exp!=0xff's
input [63:0]	inq_in2;		// request operand 2 to op pipes
input		inq_in2_53_0_neq_0;	// request operand 2[53:0]!=0
input		inq_in2_50_0_neq_0;	// request operand 2[50:0]!=0
input		inq_in2_53_32_neq_0;	// request operand 2[53:32]!=0
input		inq_in2_exp_eq_0;	// request operand 2 exp==0
input		inq_in2_exp_neq_ffs;	// request operand 2 exp!=0xff's
input		inq_div;		// divide pipe request
input		div_dest_rdy;		// divide result req accepted for CPX
input		fdiv_clken_l;           // fdiv clock enable for div_frac_dp
input		fdiv_clken_l_div_exp_buf1;           // fdiv clock enable for div_exp_dp
input		arst_l;			// global async. reset- asserted low
input		grst_l;			// global sync. reset- asserted low
input		rclk;			// global clock

output		div_pipe_active;        // div pipe is executing a valid instr
output		d1stg_step;		// divide pipe load
output		d8stg_fdiv_in;		// div pipe output request next cycle
output [9:0]	div_id_out_in;		// div pipe output ID next cycle
output [4:0]	div_exc_out;		// divide pipe result- exception flags
output		d8stg_fdivd;		// divide double- divide stage 8
output		d8stg_fdivs;		// divide single- divide stage 8
output		div_sign_out;		// divide sign output
output [10:0]	div_exp_outa;		// divide exponent output
output [51:0]	div_frac_outa;		// divide fraction output

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_div_ctl.
//
///////////////////////////////////////////////////////////////////////////////

wire		d1stg_snan_sng_in1;	// operand 1 is single signalling NaN
wire		d1stg_snan_dbl_in1;	// operand 1 is double signalling NaN
wire		d1stg_snan_sng_in2;	// operand 2 is single signalling NaN
wire		d1stg_snan_dbl_in2;	// operand 2 is double signalling NaN
wire		d1stg_step;		// divide pipe load
wire		d1stg_dblop;		// double precision operation- d1 stg
wire		d234stg_fdiv;		// select line to div_expadd1
wire		d3stg_fdiv;		// divide operation- divide stage 3
wire		d4stg_fdiv;		// divide operation- divide stage 4
wire		d5stg_fdiva;		// divide operation- divide stage 5
wire		d5stg_fdivb;		// divide operation- divide stage 5
wire		d5stg_fdivs;		// divide single- divide stage 5
wire		d5stg_fdivd;		// divide double- divide stage 5
wire		d6stg_fdiv;		// divide operation- divide stage 6
wire		d6stg_fdivs;		// divide single- divide stage 6
wire		d6stg_fdivd;		// divide double- divide stage 6
wire		d7stg_fdiv;		// divide operation- divide stage 7
wire		d7stg_fdivd;		// divide double- divide stage 7
wire		d8stg_fdiv_in;		// div pipe output request next cycle
wire		d8stg_fdivs;		// divide single- divide stage 8
wire		d8stg_fdivd;		// divide double- divide stage 8
wire [9:0]	div_id_out_in;		// div pipe output ID next cycle
wire		div_sign_out;		// divide sign output
wire [4:0]	div_exc_out;		// divide pipe result- exception flags
wire		div_norm_frac_in1_dbl_norm; // select line to div_norm
wire		div_norm_frac_in1_dbl_dnrm; // select line to div_norm
wire		div_norm_frac_in1_sng_norm; // select line to div_norm
wire		div_norm_frac_in1_sng_dnrm; // select line to div_norm
wire		div_norm_frac_in2_dbl_norm; // select line to div_norm
wire		div_norm_frac_in2_dbl_dnrm; // select line to div_norm
wire		div_norm_frac_in2_sng_norm; // select line to div_norm
wire		div_norm_frac_in2_sng_dnrm; // select line to div_norm
wire		div_norm_inf;		// select line to div_norm
wire		div_norm_qnan;		// select line to div_norm
wire		div_norm_zero;		// select line to div_norm
wire		div_frac_add_in2_load;	// load enable to div_frac_add_in2
wire		d6stg_frac_out_shl1;	// select line to d6stg_frac
wire		d6stg_frac_out_nosh;	// select line to d6stg_frac
wire		div_frac_add_in1_add;	// select line to div_frac_add_in1
wire		div_frac_add_in1_load;	// load enable to div_frac_add_in1
wire		d7stg_rndup_inv;	// no rounding increment
wire		d7stg_to_0;		// result to max finite on overflow
wire		d7stg_to_0_inv;		// result to infinity on overflow
wire		div_frac_out_add_in1;	// select line to div_frac_out
wire		div_frac_out_add;	// select line to div_frac_out
wire		div_frac_out_shl1_dbl;	// select line to div_frac_out
wire		div_frac_out_shl1_sng;	// select line to div_frac_out
wire		div_frac_out_of;	// select line to div_frac_out
wire		div_frac_out_load;	// load enable to div_frac_out
wire		div_expadd1_in1_dbl;	// select line to div_expadd1
wire		div_expadd1_in1_sng;	// select line to div_expadd1
wire		div_expadd1_in2_exp_in2_dbl; // select line to div_expadd1
wire		div_expadd1_in2_exp_in2_sng; //select line to div_expadd1
wire		div_exp1_expadd1;	// select line to div_exp1
wire		div_exp1_0835;		// select line to div_exp1
wire		div_exp1_0118;		// select line to div_exp1
wire		div_exp1_zero;		// select line to div_exp1
wire		div_exp1_load;		// load enable to div_exp1
wire		div_expadd2_in1_exp_out; // select line to div_expadd2
wire		div_expadd2_no_decr_inv; // no exponent decrement
wire		div_expadd2_cin;	// carry in to 2nd exponent adder
wire		div_exp_out_expadd22_inv; // select line to div_exp_out
wire		div_exp_out_expadd2;	// select line to div_exp_out
wire		div_exp_out_of;		// overflow to exponent output
wire		div_exp_out_exp_out;	// select line to div_exp_out
wire		div_exp_out_load;	// load enable to div_exp_out
wire		div_pipe_active;        // div pipe is executing a valid instr


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_div_exp_dp.
//
///////////////////////////////////////////////////////////////////////////////

wire [12:0]	div_exp1;		// divide exponent- intermediate value
wire [12:12]	div_expadd2;		// divide exponent- 2nd adder output
wire [12:0]	div_exp_out;		// divide exponent output- fpu_div
wire [10:0]	div_exp_outa;		// divide exponent output


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_div_frac_dp.
//
///////////////////////////////////////////////////////////////////////////////

wire [5:0]	div_shl_cnt;		// divide left shift amount
wire		d6stg_frac_0;		// divide fraction[0]- intermediate val
wire		d6stg_frac_1;		// divide fraction[1]- intermediate val
wire		d6stg_frac_2;		// divide fraction[2]- intermediate val
wire		d6stg_frac_29;		// divide fraction[29]- intermediate val
wire		d6stg_frac_30;		// divide fraction[30]- intermediate val
wire		d6stg_frac_31;		// divide fraction[31]- intermediate val
wire		div_frac_add_in1_neq_0;	// div_frac_add_in1 != 0
wire		div_frac_add_52_inv;	// div_frac_add bit[52] inverted
wire		div_frac_add_52_inva;	// div_frac_add bit[52] inverted copy
wire [54:53]	div_frac_out;		// divide fraction output- fpu_div
wire [51:0]	div_frac_outa;		// divide fraction output

// Previously missing wires
wire        scan_out_fpu_div_ctl;
wire        scan_out_fpu_div_exp_dp;

///////////////////////////////////////////////////////////////////////////////
//
//	Instantiations.
//
///////////////////////////////////////////////////////////////////////////////

fpu_div_ctl fpu_div_ctl (
	.inq_in1_51			(inq_in1[51]),
	.inq_in1_54			(inq_in1[54]),
	.inq_in1_53_0_neq_0		(inq_in1_53_0_neq_0),
	.inq_in1_50_0_neq_0		(inq_in1_50_0_neq_0),
	.inq_in1_53_32_neq_0		(inq_in1_53_32_neq_0),
	.inq_in1_exp_eq_0		(inq_in1_exp_eq_0),
	.inq_in1_exp_neq_ffs		(inq_in1_exp_neq_ffs),
	.inq_in2_51			(inq_in2[51]),
	.inq_in2_54			(inq_in2[54]),
	.inq_in2_53_0_neq_0		(inq_in2_53_0_neq_0),
	.inq_in2_50_0_neq_0		(inq_in2_50_0_neq_0),
	.inq_in2_53_32_neq_0		(inq_in2_53_32_neq_0),
	.inq_in2_exp_eq_0		(inq_in2_exp_eq_0),
	.inq_in2_exp_neq_ffs		(inq_in2_exp_neq_ffs),
	.inq_op				(inq_op[7:0]),
	.div_exp1			(div_exp1[12:0]),
	.div_dest_rdy			(div_dest_rdy),
	.inq_rnd_mode			(inq_rnd_mode[1:0]),
	.inq_id				(inq_id[4:0]),
	.inq_in1_63			(inq_in1[63]),
	.inq_in2_63			(inq_in2[63]),
	.inq_div			(inq_div),
	.div_exp_out			(div_exp_out[12:0]),
	.div_frac_add_52_inva		(div_frac_add_52_inva),
	.div_frac_add_in1_neq_0		(div_frac_add_in1_neq_0),
	.div_frac_out_54		(div_frac_out[54]),
	.d6stg_frac_0			(d6stg_frac_0),
	.d6stg_frac_1			(d6stg_frac_1),
	.d6stg_frac_2			(d6stg_frac_2),
	.d6stg_frac_29			(d6stg_frac_29),
	.d6stg_frac_30			(d6stg_frac_30),
	.d6stg_frac_31			(d6stg_frac_31),
	.div_frac_out_53		(div_frac_out[53]),
	.div_expadd2_12			(div_expadd2[12]),
	.arst_l				(arst_l),
	.grst_l				(grst_l),
	.rclk			(rclk),

	.div_pipe_active		(div_pipe_active),
	.d1stg_snan_sng_in1		(d1stg_snan_sng_in1),
	.d1stg_snan_dbl_in1		(d1stg_snan_dbl_in1),
	.d1stg_snan_sng_in2		(d1stg_snan_sng_in2),
	.d1stg_snan_dbl_in2		(d1stg_snan_dbl_in2),
	.d1stg_step			(d1stg_step),
	.d1stg_dblop			(d1stg_dblop),
	.d234stg_fdiv			(d234stg_fdiv),
	.d3stg_fdiv			(d3stg_fdiv),
	.d4stg_fdiv			(d4stg_fdiv),
	.d5stg_fdiva			(d5stg_fdiva),
	.d5stg_fdivb			(d5stg_fdivb),
	.d5stg_fdivs			(d5stg_fdivs),
	.d5stg_fdivd			(d5stg_fdivd),
	.d6stg_fdiv			(d6stg_fdiv),
	.d6stg_fdivs			(d6stg_fdivs),
	.d6stg_fdivd			(d6stg_fdivd),
	.d7stg_fdiv			(d7stg_fdiv),
	.d7stg_fdivd			(d7stg_fdivd),
	.d8stg_fdiv_in			(d8stg_fdiv_in),
	.d8stg_fdivs			(d8stg_fdivs),
	.d8stg_fdivd			(d8stg_fdivd),
	.div_id_out_in			(div_id_out_in[9:0]),
	.div_sign_out			(div_sign_out),
	.div_exc_out			(div_exc_out[4:0]),
	.div_norm_frac_in1_dbl_norm	(div_norm_frac_in1_dbl_norm),
	.div_norm_frac_in1_dbl_dnrm	(div_norm_frac_in1_dbl_dnrm),
	.div_norm_frac_in1_sng_norm	(div_norm_frac_in1_sng_norm),
	.div_norm_frac_in1_sng_dnrm	(div_norm_frac_in1_sng_dnrm),
	.div_norm_frac_in2_dbl_norm	(div_norm_frac_in2_dbl_norm),
	.div_norm_frac_in2_dbl_dnrm	(div_norm_frac_in2_dbl_dnrm),
	.div_norm_frac_in2_sng_norm	(div_norm_frac_in2_sng_norm),
	.div_norm_frac_in2_sng_dnrm	(div_norm_frac_in2_sng_dnrm),
	.div_norm_inf			(div_norm_inf),
	.div_norm_qnan			(div_norm_qnan),
	.div_norm_zero			(div_norm_zero),
	.div_frac_add_in2_load		(div_frac_add_in2_load),
	.d6stg_frac_out_shl1		(d6stg_frac_out_shl1),
	.d6stg_frac_out_nosh		(d6stg_frac_out_nosh),
	.div_frac_add_in1_add		(div_frac_add_in1_add),
	.div_frac_add_in1_load		(div_frac_add_in1_load),
	.d7stg_rndup_inv		(d7stg_rndup_inv),
	.d7stg_to_0			(d7stg_to_0),
	.d7stg_to_0_inv			(d7stg_to_0_inv),
	.div_frac_out_add_in1		(div_frac_out_add_in1),
	.div_frac_out_add		(div_frac_out_add),
	.div_frac_out_shl1_dbl		(div_frac_out_shl1_dbl),
	.div_frac_out_shl1_sng		(div_frac_out_shl1_sng),
	.div_frac_out_of		(div_frac_out_of),
	.div_frac_out_load		(div_frac_out_load),
	.div_expadd1_in1_dbl		(div_expadd1_in1_dbl),
	.div_expadd1_in1_sng		(div_expadd1_in1_sng),
	.div_expadd1_in2_exp_in2_dbl	(div_expadd1_in2_exp_in2_dbl),
	.div_expadd1_in2_exp_in2_sng	(div_expadd1_in2_exp_in2_sng),
	.div_exp1_expadd1		(div_exp1_expadd1),
	.div_exp1_0835			(div_exp1_0835),
	.div_exp1_0118			(div_exp1_0118),
	.div_exp1_zero			(div_exp1_zero),
	.div_exp1_load			(div_exp1_load),
	.div_expadd2_in1_exp_out	(div_expadd2_in1_exp_out),
	.div_expadd2_no_decr_inv	(div_expadd2_no_decr_inv),
	.div_expadd2_cin		(div_expadd2_cin),
	.div_exp_out_expadd22_inv	(div_exp_out_expadd22_inv),
	.div_exp_out_expadd2		(div_exp_out_expadd2),
	.div_exp_out_of			(div_exp_out_of),
	.div_exp_out_exp_out		(div_exp_out_exp_out),
	.div_exp_out_load		(div_exp_out_load),

	.se                             (se),
        .si                             (si),
        .so                             (scan_out_fpu_div_ctl)
);


fpu_div_exp_dp fpu_div_exp_dp (
	.inq_in1			(inq_in1[62:52]),
	.inq_in2			(inq_in2[62:52]),
	.d1stg_step			(d1stg_step),
	.d234stg_fdiv			(d234stg_fdiv),
	.div_expadd1_in1_dbl		(div_expadd1_in1_dbl),
	.div_expadd1_in1_sng		(div_expadd1_in1_sng),
	.div_expadd1_in2_exp_in2_dbl	(div_expadd1_in2_exp_in2_dbl),
	.div_expadd1_in2_exp_in2_sng	(div_expadd1_in2_exp_in2_sng),
	.d3stg_fdiv			(d3stg_fdiv),
	.d4stg_fdiv			(d4stg_fdiv),
	.div_shl_cnt			(div_shl_cnt[5:0]),
	.div_exp1_expadd1		(div_exp1_expadd1),
	.div_exp1_0835			(div_exp1_0835),
	.div_exp1_0118			(div_exp1_0118),
	.div_exp1_zero			(div_exp1_zero),
	.div_exp1_load			(div_exp1_load),
	.div_expadd2_in1_exp_out	(div_expadd2_in1_exp_out),
	.d5stg_fdiva			(d5stg_fdiva),
	.d5stg_fdivd			(d5stg_fdivd),
	.d5stg_fdivs			(d5stg_fdivs),
	.d6stg_fdiv			(d6stg_fdiv),
	.d7stg_fdiv			(d7stg_fdiv),
	.div_expadd2_no_decr_inv	(div_expadd2_no_decr_inv),
	.div_expadd2_cin		(div_expadd2_cin),
	.div_exp_out_expadd2		(div_exp_out_expadd2),
	.div_exp_out_expadd22_inv	(div_exp_out_expadd22_inv),
	.div_exp_out_of			(div_exp_out_of),
	.d7stg_to_0_inv			(d7stg_to_0_inv),
	.d7stg_fdivd			(d7stg_fdivd),
	.div_exp_out_exp_out		(div_exp_out_exp_out),
	.d7stg_rndup_inv		(d7stg_rndup_inv),
	.div_frac_add_52_inv		(div_frac_add_52_inv),
	.div_exp_out_load		(div_exp_out_load),
	.fdiv_clken_l			(fdiv_clken_l_div_exp_buf1),
	.rclk			(rclk),

	.div_exp1			(div_exp1[12:0]),
	.div_expadd2_12			(div_expadd2[12]),
	.div_exp_out			(div_exp_out[12:0]),
	.div_exp_outa			(div_exp_outa[10:0]),

	.se                             (se),
        .si                             (scan_out_fpu_div_ctl),
        .so                             (scan_out_fpu_div_exp_dp)
);


fpu_div_frac_dp fpu_div_frac_dp (
	.inq_in1			(inq_in1[54:0]),
	.inq_in2			(inq_in2[54:0]),
	.d1stg_step			(d1stg_step),
	.div_norm_frac_in1_dbl_norm	(div_norm_frac_in1_dbl_norm),
	.div_norm_frac_in1_dbl_dnrm	(div_norm_frac_in1_dbl_dnrm),
	.div_norm_frac_in1_sng_norm	(div_norm_frac_in1_sng_norm),
	.div_norm_frac_in1_sng_dnrm	(div_norm_frac_in1_sng_dnrm),
	.div_norm_frac_in2_dbl_norm	(div_norm_frac_in2_dbl_norm),
	.div_norm_frac_in2_dbl_dnrm	(div_norm_frac_in2_dbl_dnrm),
	.div_norm_frac_in2_sng_norm	(div_norm_frac_in2_sng_norm),
	.div_norm_frac_in2_sng_dnrm	(div_norm_frac_in2_sng_dnrm),
	.div_norm_inf			(div_norm_inf),
	.div_norm_qnan			(div_norm_qnan),
	.d1stg_dblop			(d1stg_dblop),
	.div_norm_zero			(div_norm_zero),
	.d1stg_snan_dbl_in1		(d1stg_snan_dbl_in1),
	.d1stg_snan_sng_in1		(d1stg_snan_sng_in1),
	.d1stg_snan_dbl_in2		(d1stg_snan_dbl_in2),
	.d1stg_snan_sng_in2		(d1stg_snan_sng_in2),
	.d3stg_fdiv			(d3stg_fdiv),
	.d6stg_fdiv			(d6stg_fdiv),
	.d6stg_fdivd			(d6stg_fdivd),
	.d6stg_fdivs			(d6stg_fdivs),
	.div_frac_add_in2_load		(div_frac_add_in2_load),
	.d6stg_frac_out_shl1		(d6stg_frac_out_shl1),
	.d6stg_frac_out_nosh		(d6stg_frac_out_nosh),
	.d4stg_fdiv			(d4stg_fdiv),
	.div_frac_add_in1_add		(div_frac_add_in1_add),
	.div_frac_add_in1_load		(div_frac_add_in1_load),
	.d5stg_fdivb			(d5stg_fdivb),
	.div_frac_out_add_in1		(div_frac_out_add_in1),
	.div_frac_out_add		(div_frac_out_add),
	.div_frac_out_shl1_dbl		(div_frac_out_shl1_dbl),
	.div_frac_out_shl1_sng		(div_frac_out_shl1_sng),
	.div_frac_out_of		(div_frac_out_of),
	.d7stg_to_0			(d7stg_to_0),
	.div_frac_out_load		(div_frac_out_load),
	.fdiv_clken_l			(fdiv_clken_l),
	.rclk			(rclk),

	.div_shl_cnt			(div_shl_cnt[5:0]),
	.d6stg_frac_0			(d6stg_frac_0),
	.d6stg_frac_1			(d6stg_frac_1),
	.d6stg_frac_2			(d6stg_frac_2),
	.d6stg_frac_29			(d6stg_frac_29),
	.d6stg_frac_30			(d6stg_frac_30),
	.d6stg_frac_31			(d6stg_frac_31),
	.div_frac_add_in1_neq_0		(div_frac_add_in1_neq_0),
	.div_frac_add_52_inv		(div_frac_add_52_inv),
	.div_frac_add_52_inva		(div_frac_add_52_inva),
	.div_frac_out_54_53      	(div_frac_out[54:53]),
	.div_frac_outa			(div_frac_outa[51:0]),

	.se                             (se),
        .si                             (scan_out_fpu_div_exp_dp),
        .so                             (so)
);


endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_div_ctl.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//	Divide pipeline synthesizable logic
//              - special input cases
//              - opcode pipeline
//              - sign logic
//              - exception logic
//              - datapath control- select lines and control logic
//
///////////////////////////////////////////////////////////////////////////////

module fpu_div_ctl (
	inq_in1_51,
	inq_in1_54,
	inq_in1_53_0_neq_0,
	inq_in1_50_0_neq_0,
	inq_in1_53_32_neq_0,
	inq_in1_exp_eq_0,
	inq_in1_exp_neq_ffs,
	inq_in2_51,
	inq_in2_54,
	inq_in2_53_0_neq_0,
	inq_in2_50_0_neq_0,
	inq_in2_53_32_neq_0,
	inq_in2_exp_eq_0,
	inq_in2_exp_neq_ffs,
	inq_op,
	div_exp1,
	div_dest_rdy,
	inq_rnd_mode,
	inq_id,
	inq_in1_63,
	inq_in2_63,
	inq_div,
	div_exp_out,
	div_frac_add_52_inva,
	div_frac_add_in1_neq_0,
	div_frac_out_54,
	d6stg_frac_0,
	d6stg_frac_1,
	d6stg_frac_2,
	d6stg_frac_29,
	d6stg_frac_30,
	d6stg_frac_31,
	div_frac_out_53,
	div_expadd2_12,
	arst_l,
	grst_l,
	rclk,

	div_pipe_active,	
	d1stg_snan_sng_in1,
	d1stg_snan_dbl_in1,
	d1stg_snan_sng_in2,
	d1stg_snan_dbl_in2,
	d1stg_step,
	d1stg_dblop,
	d234stg_fdiv,
	d3stg_fdiv,
	d4stg_fdiv,
	d5stg_fdiva,
	d5stg_fdivb,
	d5stg_fdivs,
	d5stg_fdivd,
	d6stg_fdiv,
	d6stg_fdivs,
	d6stg_fdivd,
	d7stg_fdiv,
	d7stg_fdivd,
	d8stg_fdiv_in,
	d8stg_fdivs,
	d8stg_fdivd,
	div_id_out_in,
	div_sign_out,
	div_exc_out,
	div_norm_frac_in1_dbl_norm,
	div_norm_frac_in1_dbl_dnrm,
	div_norm_frac_in1_sng_norm,
	div_norm_frac_in1_sng_dnrm,
	div_norm_frac_in2_dbl_norm,
	div_norm_frac_in2_dbl_dnrm,
	div_norm_frac_in2_sng_norm,
	div_norm_frac_in2_sng_dnrm,
	div_norm_inf,
	div_norm_qnan,
	div_norm_zero,
	div_frac_add_in2_load,
	d6stg_frac_out_shl1,
	d6stg_frac_out_nosh,
	div_frac_add_in1_add,
	div_frac_add_in1_load,
	d7stg_rndup_inv,
	d7stg_to_0,
	d7stg_to_0_inv,
	div_frac_out_add_in1,
	div_frac_out_add,
	div_frac_out_shl1_dbl,
	div_frac_out_shl1_sng,
	div_frac_out_of,
	div_frac_out_load,
	div_expadd1_in1_dbl,
	div_expadd1_in1_sng,
	div_expadd1_in2_exp_in2_dbl,
	div_expadd1_in2_exp_in2_sng,
	div_exp1_expadd1,
	div_exp1_0835,
	div_exp1_0118,
	div_exp1_zero,
	div_exp1_load,
	div_expadd2_in1_exp_out,
	div_expadd2_no_decr_inv,
	div_expadd2_cin,
	div_exp_out_expadd22_inv,
	div_exp_out_expadd2,
	div_exp_out_of,
	div_exp_out_exp_out,
	div_exp_out_load,

	se,
	si,
	so
);


parameter
		FDIVS=  8'h4d,
		FDIVD=	8'h4e;


input		inq_in1_51;		// request operand 1[51]
input		inq_in1_54;		// request operand 1[54]
input		inq_in1_53_0_neq_0;	// request operand 1[53:0]!=0
input		inq_in1_50_0_neq_0;	// request operand 1[50:0]!=0
input		inq_in1_53_32_neq_0;	// request operand 1[53:32]!=0
input		inq_in1_exp_eq_0;	// request operand 1[62:52]==0
input		inq_in1_exp_neq_ffs;	// request operand 1[62:52]!=0x7ff
input		inq_in2_51;		// request operand 2[51]
input		inq_in2_54;		// request operand 2[54]
input		inq_in2_53_0_neq_0;	// request operand 2[53:0]!=0
input		inq_in2_50_0_neq_0;	// request operand 2[50:0]!=0
input		inq_in2_53_32_neq_0;	// request operand 2[53:32]!=0
input		inq_in2_exp_eq_0;	// request operand 2[62:52]==0
input		inq_in2_exp_neq_ffs;	// request operand 2[62:52]!=0x7ff
input [7:0]	inq_op;			// request opcode to op pipes
input [12:0]	div_exp1;		// divide exponent- intermediate value
input		div_dest_rdy;		// divide result req accepted for CPX
input [1:0]	inq_rnd_mode;		// request rounding mode to op pipes
input [4:0]	inq_id;			// request ID to the operation pipes
input		inq_in1_63;		// request operand 1 to op pipes- sign
input		inq_in2_63;		// request operand 2 to op pipes- sign
input		inq_div;		// divide pipe request
input [12:0]	div_exp_out;		// divide exponent output
input		div_frac_add_52_inva;	// div_frac_add bit[52] inverted
input		div_frac_add_in1_neq_0;	// div_frac_add_in1 != 0
input		div_frac_out_54;	// div_frac_out bit[54]
input		d6stg_frac_0;		// divide fraction[0]- intermediate val
input		d6stg_frac_1;		// divide fraction[1]- intermediate val
input		d6stg_frac_2;		// divide fraction[2]- intermediate val
input		d6stg_frac_29;		// divide fraction[29]- intermediate val
input		d6stg_frac_30;		// divide fraction[30]- intermediate val
input		d6stg_frac_31;		// divide fraction[31]- intermediate val
input		div_frac_out_53;	// div_frac_out bit[53]
input		div_expadd2_12;		// div_expadd2 bit[12]
input		arst_l;			// global async. reset- asserted low
input		grst_l;			// global sync. reset- asserted low
input		rclk;		// global clock

output		div_pipe_active;        // div pipe is executing a valid instr
output		d1stg_snan_sng_in1;	// operand 1 is single signalling NaN
output		d1stg_snan_dbl_in1;	// operand 1 is double signalling NaN
output		d1stg_snan_sng_in2;	// operand 2 is single signalling NaN
output		d1stg_snan_dbl_in2;	// operand 2 is double signalling NaN
output		d1stg_step;		// divide pipe load
output		d1stg_dblop;		// double precision operation- d1 stg
output		d234stg_fdiv;		// select line to div_expadd1
output		d3stg_fdiv;		// divide operation- divide stage 3
output		d4stg_fdiv;		// divide operation- divide stage 4
output		d5stg_fdiva;		// divide operation- divide stage 5
output		d5stg_fdivb;		// divide operation- divide stage 5
output		d5stg_fdivs;		// divide single- divide stage 5
output		d5stg_fdivd;		// divide double- divide stage 5
output		d6stg_fdiv;		// divide operation- divide stage 6
output		d6stg_fdivs;		// divide single- divide stage 6
output		d6stg_fdivd;		// divide double- divide stage 6
output		d7stg_fdiv;		// divide operation- divide stage 7
output		d7stg_fdivd;		// divide double- divide stage 7
output		d8stg_fdiv_in;		// div pipe output request next cycle
output		d8stg_fdivs;		// divide single- divide stage 8
output		d8stg_fdivd;		// divide double- divide stage 8
output [9:0]	div_id_out_in;		// div pipe output ID next cycle
output		div_sign_out;		// divide sign output
output [4:0]	div_exc_out;		// divide pipe result- exception flags
output		div_norm_frac_in1_dbl_norm; // select line to div_norm
output		div_norm_frac_in1_dbl_dnrm; // select line to div_norm
output		div_norm_frac_in1_sng_norm; // select line to div_norm
output		div_norm_frac_in1_sng_dnrm; // select line to div_norm
output		div_norm_frac_in2_dbl_norm; // select line to div_norm
output		div_norm_frac_in2_dbl_dnrm; // select line to div_norm
output		div_norm_frac_in2_sng_norm; // select line to div_norm
output		div_norm_frac_in2_sng_dnrm; // select line to div_norm
output		div_norm_inf;		// select line to div_norm
output		div_norm_qnan;		// select line to div_norm
output		div_norm_zero;		// select line to div_norm
output		div_frac_add_in2_load;	// load enable to div_frac_add_in2
output		d6stg_frac_out_shl1;	// select line to d6stg_frac
output		d6stg_frac_out_nosh;	// select line to d6stg_frac
output		div_frac_add_in1_add;	// select line to div_frac_add_in1
output		div_frac_add_in1_load;	// load enable to div_frac_add_in1
output		d7stg_rndup_inv;	// no rounding increment
output		d7stg_to_0;		// result to max finite on overflow
output		d7stg_to_0_inv;		// result to infinity on overflow
output		div_frac_out_add_in1;	// select line to div_frac_out
output		div_frac_out_add;	// select line to div_frac_out
output		div_frac_out_shl1_dbl;	// select line to div_frac_out
output		div_frac_out_shl1_sng;	// select line to div_frac_out
output		div_frac_out_of;	// select line to div_frac_out
output		div_frac_out_load;	// load enable to div_frac_out
output		div_expadd1_in1_dbl;	// select line to div_expadd1
output		div_expadd1_in1_sng;	// select line to div_expadd1
output		div_expadd1_in2_exp_in2_dbl; // select line to div_expadd1
output		div_expadd1_in2_exp_in2_sng; //select line to div_expadd1
output		div_exp1_expadd1;	// select line to div_exp1
output		div_exp1_0835;		// select line to div_exp1
output		div_exp1_0118;		// select line to div_exp1
output		div_exp1_zero;		// select line to div_exp1
output		div_exp1_load;		// load enable to div_exp1
output		div_expadd2_in1_exp_out; // select line to div_expadd2
output		div_expadd2_no_decr_inv; // no exponent decrement
output		div_expadd2_cin;	// carry in to 2nd exponent adder
output		div_exp_out_expadd22_inv; // select line to div_exp_out
output		div_exp_out_expadd2;	// select line to div_exp_out
output		div_exp_out_of;		// overflow to exponent output
output		div_exp_out_exp_out;	// select line to div_exp_out
output		div_exp_out_load;	// load enable to div_exp_out

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


wire		reset;
wire		div_frac_in1_51;
wire		div_frac_in1_54;
wire		div_frac_in1_53_0_neq_0;
wire		div_frac_in1_50_0_neq_0;
wire		div_frac_in1_53_32_neq_0;
wire		div_exp_in1_exp_eq_0;
wire		div_exp_in1_exp_neq_ffs;
wire		div_frac_in2_51;
wire		div_frac_in2_54;
wire		div_frac_in2_53_0_neq_0;
wire		div_frac_in2_50_0_neq_0;
wire		div_frac_in2_53_32_neq_0;
wire		div_exp_in2_exp_eq_0;
wire		div_exp_in2_exp_neq_ffs;
wire		d1stg_denorm_sng_in1;
wire		d1stg_denorm_dbl_in1;
wire		d1stg_denorm_sng_in2;
wire		d1stg_denorm_dbl_in2;
wire		d2stg_denorm_sng_in2;
wire		d2stg_denorm_dbl_in2;
wire		d1stg_norm_sng_in1;
wire		d1stg_norm_dbl_in1;
wire		d1stg_norm_sng_in2;
wire		d1stg_norm_dbl_in2;
wire		d2stg_norm_sng_in2;
wire		d2stg_norm_dbl_in2;
wire		d1stg_snan_sng_in1;
wire		d1stg_snan_dbl_in1;
wire		d1stg_snan_sng_in2;
wire		d1stg_snan_dbl_in2;
wire		d1stg_qnan_sng_in1;
wire		d1stg_qnan_dbl_in1;
wire		d1stg_qnan_sng_in2;
wire		d1stg_qnan_dbl_in2;
wire		d1stg_snan_in1;
wire		d1stg_snan_in2;
wire		d1stg_qnan_in1;
wire		d1stg_qnan_in2;
wire		d1stg_nan_sng_in1;
wire		d1stg_nan_dbl_in1;
wire		d1stg_nan_sng_in2;
wire		d1stg_nan_dbl_in2;
wire		d1stg_nan_in1;
wire		d1stg_nan_in2;
wire		d1stg_nan_in;
wire		d2stg_snan_in1;
wire		d2stg_snan_in2;
wire		d2stg_qnan_in1;
wire		d2stg_qnan_in2;
wire		d2stg_nan_in2;
wire		d2stg_nan_in;
wire		d1stg_inf_sng_in1;
wire		d1stg_inf_dbl_in1;
wire		d1stg_inf_sng_in2;
wire		d1stg_inf_dbl_in2;
wire		d1stg_inf_in1;
wire		d1stg_inf_in2;
wire		d1stg_inf_in;
wire		d1stg_2inf_in;
wire		d2stg_inf_in1;
wire		d2stg_inf_in2;
wire		d2stg_2inf_in;
wire		d1stg_infnan_sng_in1;
wire		d1stg_infnan_dbl_in1;
wire		d1stg_infnan_sng_in2;
wire		d1stg_infnan_dbl_in2;
wire		d1stg_infnan_in1;
wire		d1stg_infnan_in2;
wire		d1stg_infnan_in;
wire		d2stg_infnan_in1;
wire		d2stg_infnan_in2;
wire		d2stg_infnan_in;
wire		d1stg_zero_in1;
wire		d1stg_zero_in2;
wire		d1stg_zero_in;
wire		d1stg_2zero_in;
wire		d2stg_zero_in1;
wire		d2stg_zero_in2;
wire		d2stg_zero_in;
wire		d2stg_2zero_in;
wire		d1stg_hold;
wire		d1stg_holda;
wire		d1stg_step;
wire		d1stg_stepa;
wire [7:0]	d1stg_op_in;
wire [7:0]	d1stg_op;
wire		d1stg_div_in;
wire		d1stg_div;
wire [4:0]	d1stg_sngopa;
wire		d1stg_dblop;
wire [4:0]	d1stg_dblopa;
wire		d1stg_fdiv;
wire		d1stg_fdivs;
wire		d1stg_fdivd;
wire [2:0]	d1stg_opdec;
wire		d234stg_fdiv_in;
wire [2:0]	d2stg_opdec;
wire		d234stg_fdiv;
wire		d2stg_fdiv;
wire		d2stg_fdivs;
wire		d2stg_fdivd;
wire [2:0]	d3stg_opdec;
wire		d3stg_fdiv;
wire [2:0]	d4stg_opdec;
wire		d4stg_fdiv;
wire		d4stg_fdivs;
wire		d4stg_fdivd;
wire		d5stg_step;
wire [2:0]	d5stg_opdec;
wire		d5stg_fdiva;
wire		d5stg_fdivb_in;
wire		d5stg_fdivb;
wire		d5stg_fdiv;
wire		d5stg_fdivs;
wire		d5stg_fdivd;
wire		d6stg_step;
wire [2:0]	d6stg_opdec_in;
wire [2:0]	d6stg_opdec;
wire		d6stg_fdiv;
wire		d6stg_fdivs;
wire		d6stg_fdivd;
wire [2:0]	d7stg_opdec;
wire		d7stg_fdiv;
wire		d7stg_fdivs;
wire		d7stg_fdivd;
wire		d8stg_fdiv_in;
wire [2:0]	d8stg_opdec;
wire		d8stg_fdiv;
wire		d8stg_fdivs;
wire		d8stg_fdivd;
wire		d8stg_hold;
wire		d8stg_step;
wire [1:0]	d1stg_rnd_mode;
wire [4:0]	d1stg_id;
wire		d1stg_sign1;
wire		d1stg_sign2;
wire		d1stg_sign;
wire		div_bkend_step;
wire [1:0]	div_rnd_mode;
wire [9:0]	div_id_out_in;
wire [9:0]	div_id_out;
wire		div_sign_out;
wire [5:0]	div_cnt_plus1;
wire [5:0]	div_cnt_in;
wire		div_cnt_step;
wire [5:0]	div_cnt;
wire		div_cnt_lt_step;
wire		divs_cnt_lt_23_in;
wire		divs_cnt_lt_23;
wire		divs_cnt_lt_23a;
wire		divd_cnt_lt_52_in;
wire		divd_cnt_lt_52;
wire		divd_cnt_lt_52a;
wire		div_exc_step;
wire		div_of_mask_in;
wire		div_of_mask;
wire		div_nv_out_in;
wire		div_nv_out;
wire		div_dz_out_in;
wire		div_dz_out;
wire		d7stg_in_of;
wire		div_of_out_tmp1_in;
wire		div_of_out_tmp1;
wire		div_of_out_tmp2;
wire		div_out_52_inv;
wire		div_of_out;
wire		div_uf_out_in;
wire		div_uf_out;
wire		div_nx_out_in;
wire		div_nx_out;
wire [4:0]	div_exc_out;
wire		d1stg_spc_rslt;
wire		div_norm_frac_in1_dbl_norm;
wire		div_norm_frac_in1_dbl_dnrm;
wire		div_norm_frac_in1_sng_norm;
wire		div_norm_frac_in1_sng_dnrm;
wire		div_norm_frac_in2_dbl_norm;
wire		div_norm_frac_in2_dbl_dnrm;
wire		div_norm_frac_in2_sng_norm;
wire		div_norm_frac_in2_sng_dnrm;
wire		div_norm_inf;
wire		div_norm_qnan;
wire		div_norm_zero;
wire		div_frac_add_in2_load;
wire		d6stg_frac_out_shl1;
wire		d6stg_frac_out_nosh;
wire		div_frac_add_in1_add;
wire		div_frac_add_in1_load;
wire		d7stg_lsb_in;
wire		d7stg_grd_in;
wire		d7stg_stk_in;
wire		d7stg_lsb;
wire		d7stg_grd;
wire		d7stg_stk;
wire		d7stg_rndup;
wire		d7stg_rndup_inv;
wire		d7stg_to_0;
wire		d7stg_to_0_inv;
wire		div_frac_out_add_in1;
wire		div_frac_out_add;
wire		div_frac_out_shl1_dbl;
wire		div_frac_out_shl1_sng;
wire		div_frac_out_of;
wire		div_frac_out_load;
wire		div_expadd1_in1_dbl_in;
wire		div_expadd1_in1_dbl;
wire		div_expadd1_in1_sng_in;
wire		div_expadd1_in1_sng;
wire		div_expadd1_in2_exp_in2_dbl;
wire		div_expadd1_in2_exp_in2_sng;
wire		div_exp1_expadd1;
wire		div_exp1_0835;
wire		div_exp1_0118;
wire		div_exp1_zero;
wire		d2stg_max_exp;
wire		d2stg_zero_exp;
wire		div_exp1_load;
wire		div_expadd2_in1_exp_out_in;
wire		div_expadd2_in1_exp_out;
wire		div_expadd2_no_decr_inv_in;
wire		div_expadd2_no_decr_load;
wire		div_expadd2_no_decr_inv;
wire		div_expadd2_cin;
wire		div_exp_out_zero;
wire		div_exp_out_expadd22_inv;
wire		div_exp_out_expadd2;
wire		div_exp_out_of;
wire		div_exp_out_exp_out;
wire		div_exp_out_load;
wire		div_pipe_active_in;
wire		div_pipe_active;

//Previously missing wires
wire        div_ctl_rst_l;

dffrl_async #(1)  dffrl_div_ctl (
  .din  (grst_l),
  .clk  (rclk),
  .rst_l(arst_l),
  .q    (div_ctl_rst_l),
	.se (se),
	.si (),
	.so ()
  );

assign reset= (!div_ctl_rst_l);

///////////////////////////////////////////////////////////////////////////////
//
//	Divide pipeline special input cases.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(1) i_div_frac_in1_51 (
	.din	(inq_in1_51),
	.en     (d1stg_step),
        .clk    (rclk),
 
        .q      (div_frac_in1_51),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_div_frac_in1_54 (
	.din	(inq_in1_54),
	.en     (d1stg_step),
        .clk    (rclk),
 
        .q      (div_frac_in1_54),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_div_frac_in1_53_0_neq_0 (
	.din	(inq_in1_53_0_neq_0),
	.en     (d1stg_step),
        .clk    (rclk),
 
        .q      (div_frac_in1_53_0_neq_0),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_div_frac_in1_50_0_neq_0 (
	.din	(inq_in1_50_0_neq_0),
	.en	(d1stg_step),
	.clk	(rclk),

	.q	(div_frac_in1_50_0_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_div_frac_in1_53_32_neq_0 (
	.din	(inq_in1_53_32_neq_0),
	.en	(d1stg_step),
	.clk	(rclk),

	.q	(div_frac_in1_53_32_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_div_exp_in1_exp_eq_0 (
        .din	(inq_in1_exp_eq_0),
        .en	(d1stg_step),
        .clk	(rclk),
 
        .q	(div_exp_in1_exp_eq_0),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(1) i_div_exp_in1_exp_neq_ffs (
	.din	(inq_in1_exp_neq_ffs),
	.en	(d1stg_step),
	.clk	(rclk),

	.q	(div_exp_in1_exp_neq_ffs),

   	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_div_frac_in2_51 (
	.din	(inq_in2_51),
	.en	(d1stg_step),
	.clk	(rclk),

	.q	(div_frac_in2_51),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_div_frac_in2_54 (
	.din	(inq_in2_54),
	.en	(d1stg_step),
	.clk	(rclk),

	.q	(div_frac_in2_54),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_div_frac_in2_53_0_neq_0 (
	.din	(inq_in2_53_0_neq_0),
	.en  	(d1stg_step),
	.clk	(rclk),

	.q	(div_frac_in2_53_0_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_div_frac_in2_50_0_neq_0 (
	.din	(inq_in2_50_0_neq_0),
	.en	(d1stg_step),
	.clk	(rclk),

	.q	(div_frac_in2_50_0_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_div_frac_in2_53_32_neq_0 (
	.din	(inq_in2_53_32_neq_0),
	.en	(d1stg_step),
	.clk	(rclk),

	.q	(div_frac_in2_53_32_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_div_exp_in2_exp_eq_0 (
	.din	(inq_in2_exp_eq_0),
	 .en	(d1stg_step),
	.clk	(rclk),

	.q	(div_exp_in2_exp_eq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_div_exp_in2_exp_neq_ffs (
        .din	(inq_in2_exp_neq_ffs),
        .en	(d1stg_step),
        .clk	(rclk),
 
        .q	(div_exp_in2_exp_neq_ffs),
 
        .se	(se),
        .si	(),
        .so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Denorm divide inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign d1stg_denorm_sng_in1= div_exp_in1_exp_eq_0 && d1stg_sngopa[0];

assign d1stg_denorm_dbl_in1= div_exp_in1_exp_eq_0 && d1stg_dblopa[0];

assign d1stg_denorm_sng_in2= div_exp_in2_exp_eq_0 && d1stg_sngopa[0];

assign d1stg_denorm_dbl_in2= div_exp_in2_exp_eq_0 && d1stg_dblopa[0];

dff_s #(1) i_d2stg_denorm_sng_in2 (
	.din	(d1stg_denorm_sng_in2),
	.clk	(rclk),

	.q	(d2stg_denorm_sng_in2),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_denorm_dbl_in2 (
	.din	(d1stg_denorm_dbl_in2),
	.clk	(rclk),

	.q	(d2stg_denorm_dbl_in2),

	.se	(se),
	.si	(),
	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Non-denorm divide inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign d1stg_norm_sng_in1= (!div_exp_in1_exp_eq_0) && d1stg_sngopa[0];

assign d1stg_norm_dbl_in1= (!div_exp_in1_exp_eq_0) && d1stg_dblopa[0];

assign d1stg_norm_sng_in2= (!div_exp_in2_exp_eq_0) && d1stg_sngopa[0];

assign d1stg_norm_dbl_in2= (!div_exp_in2_exp_eq_0) && d1stg_dblopa[0];

dff_s #(1) i_d2stg_norm_sng_in2 (
	.din	(d1stg_norm_sng_in2),
	.clk	(rclk),

	.q	(d2stg_norm_sng_in2),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_norm_dbl_in2 (
	.din	(d1stg_norm_dbl_in2),
	.clk	(rclk),

	.q	(d2stg_norm_dbl_in2),

	.se	(se),
	.si	(),
	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Nan divide inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign d1stg_snan_sng_in1= (!div_exp_in1_exp_neq_ffs) && (!div_frac_in1_54)
		&& div_frac_in1_53_32_neq_0 && d1stg_sngopa[1];

assign d1stg_snan_dbl_in1= (!div_exp_in1_exp_neq_ffs) && (!div_frac_in1_51)
		&& div_frac_in1_50_0_neq_0 && d1stg_dblopa[1];

assign d1stg_snan_sng_in2= (!div_exp_in2_exp_neq_ffs) && (!div_frac_in2_54)
                && div_frac_in2_53_32_neq_0 && d1stg_sngopa[1];

assign d1stg_snan_dbl_in2= (!div_exp_in2_exp_neq_ffs) && (!div_frac_in2_51)
                && div_frac_in2_50_0_neq_0 && d1stg_dblopa[1];

assign d1stg_qnan_sng_in1= (!div_exp_in1_exp_neq_ffs) && div_frac_in1_54
		&& d1stg_sngopa[1];

assign d1stg_qnan_dbl_in1= (!div_exp_in1_exp_neq_ffs) && div_frac_in1_51
		&& d1stg_dblopa[1];

assign d1stg_qnan_sng_in2= (!div_exp_in2_exp_neq_ffs) && div_frac_in2_54
                && d1stg_sngopa[1];

assign d1stg_qnan_dbl_in2= (!div_exp_in2_exp_neq_ffs) && div_frac_in2_51
                && d1stg_dblopa[1];

assign d1stg_snan_in1= d1stg_snan_sng_in1 || d1stg_snan_dbl_in1;

assign d1stg_snan_in2= d1stg_snan_sng_in2 || d1stg_snan_dbl_in2;

assign d1stg_qnan_in1= d1stg_qnan_sng_in1 || d1stg_qnan_dbl_in1;
 
assign d1stg_qnan_in2= d1stg_qnan_sng_in2 || d1stg_qnan_dbl_in2;

assign d1stg_nan_sng_in1= (!div_exp_in1_exp_neq_ffs)
		&& (div_frac_in1_54 || div_frac_in1_53_32_neq_0)
		&& d1stg_sngopa[2];

assign d1stg_nan_dbl_in1= (!div_exp_in1_exp_neq_ffs)
		&& (div_frac_in1_51 || div_frac_in1_50_0_neq_0)
		&& d1stg_dblopa[2];

assign d1stg_nan_sng_in2= (!div_exp_in2_exp_neq_ffs)
		&& (div_frac_in2_54 || div_frac_in2_53_32_neq_0)
		&& d1stg_sngopa[2];

assign d1stg_nan_dbl_in2= (!div_exp_in2_exp_neq_ffs)
		&& (div_frac_in2_51 || div_frac_in2_50_0_neq_0)
		&& d1stg_dblopa[2];

assign d1stg_nan_in1= d1stg_nan_sng_in1 || d1stg_nan_dbl_in1;

assign d1stg_nan_in2= d1stg_nan_sng_in2 || d1stg_nan_dbl_in2;

assign d1stg_nan_in= d1stg_nan_in1 || d1stg_nan_in2;

dff_s #(1) i_d2stg_snan_in1 (
	.din	(d1stg_snan_in1),
	.clk	(rclk),

	.q	(d2stg_snan_in1),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_snan_in2 (
	.din	(d1stg_snan_in2),
	.clk	(rclk),

	.q	(d2stg_snan_in2),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_qnan_in1 (
	.din	(d1stg_qnan_in1),
	.clk	(rclk),

	.q	(d2stg_qnan_in1),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_qnan_in2 (
	.din	(d1stg_qnan_in2),
	.clk	(rclk),

	.q	(d2stg_qnan_in2),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_nan_in2 (
	.din	(d1stg_nan_in2),
	.clk	(rclk),

	.q	(d2stg_nan_in2),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_nan_in (
	.din	(d1stg_nan_in),
	.clk	(rclk),

	.q	(d2stg_nan_in),

	.se	(se),
	.si	(),
	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Infinity divide inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign d1stg_inf_sng_in1= (!div_exp_in1_exp_neq_ffs)
		&& (!div_frac_in1_54) && (!div_frac_in1_53_32_neq_0)
		&& d1stg_sngopa[2];

assign d1stg_inf_dbl_in1= (!div_exp_in1_exp_neq_ffs)
		&& (!div_frac_in1_51) && (!div_frac_in1_50_0_neq_0)
		&& d1stg_dblopa[2];

assign d1stg_inf_sng_in2= (!div_exp_in2_exp_neq_ffs)
		&& (!div_frac_in2_54) && (!div_frac_in2_53_32_neq_0)
		&& d1stg_sngopa[2];

assign d1stg_inf_dbl_in2= (!div_exp_in2_exp_neq_ffs)
		&& (!div_frac_in2_51) && (!div_frac_in2_50_0_neq_0)
		&& d1stg_dblopa[2];

assign d1stg_inf_in1= d1stg_inf_sng_in1 || d1stg_inf_dbl_in1;

assign d1stg_inf_in2= d1stg_inf_sng_in2 || d1stg_inf_dbl_in2;

assign d1stg_inf_in= d1stg_inf_in1 || d1stg_inf_in2;

assign d1stg_2inf_in= d1stg_inf_in1 && d1stg_inf_in2;

dff_s #(1) i_d2stg_inf_in1 (
	.din	(d1stg_inf_in1),
	.clk	(rclk),

	.q	(d2stg_inf_in1),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_inf_in2 (
	.din	(d1stg_inf_in2),
	.clk	(rclk),

	.q	(d2stg_inf_in2),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_2inf_in (
	.din	(d1stg_2inf_in),
	.clk	(rclk),

	.q	(d2stg_2inf_in),

	.se	(se),
	.si	(),
	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Infinity/Nan divide inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign d1stg_infnan_sng_in1= (!div_exp_in1_exp_neq_ffs) && d1stg_sngopa[3];

assign d1stg_infnan_dbl_in1= (!div_exp_in1_exp_neq_ffs) && d1stg_dblopa[3];

assign d1stg_infnan_sng_in2= (!div_exp_in2_exp_neq_ffs) && d1stg_sngopa[3];

assign d1stg_infnan_dbl_in2= (!div_exp_in2_exp_neq_ffs) && d1stg_dblopa[3];

assign d1stg_infnan_in1= d1stg_infnan_sng_in1 || d1stg_infnan_dbl_in1;

assign d1stg_infnan_in2= d1stg_infnan_sng_in2 || d1stg_infnan_dbl_in2;

assign d1stg_infnan_in= d1stg_infnan_in1 || d1stg_infnan_in2;

dff_s #(1) i_d2stg_infnan_in1 (
	.din	(d1stg_infnan_in1),
	.clk	(rclk),

	.q	(d2stg_infnan_in1),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_infnan_in2 (
	.din	(d1stg_infnan_in2),
	.clk	(rclk),

	.q	(d2stg_infnan_in2),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_infnan_in (
	.din	(d1stg_infnan_in),
	.clk	(rclk),

	.q	(d2stg_infnan_in),

	.se	(se),
	.si	(),
	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Zero divide inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign d1stg_zero_in1= div_exp_in1_exp_eq_0
		&& (!div_frac_in1_53_0_neq_0) && (!div_frac_in1_54);

assign d1stg_zero_in2= div_exp_in2_exp_eq_0
		&& (!div_frac_in2_53_0_neq_0) && (!div_frac_in2_54);

assign d1stg_zero_in= d1stg_zero_in1 || d1stg_zero_in2;
 
assign d1stg_2zero_in= d1stg_zero_in1 && d1stg_zero_in2;

dff_s #(1) i_d2stg_zero_in1 (
	.din	(d1stg_zero_in1),
	.clk	(rclk),

	.q	(d2stg_zero_in1),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_zero_in2 (
	.din	(d1stg_zero_in2),
	.clk	(rclk),

	.q	(d2stg_zero_in2),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_zero_in (
	.din	(d1stg_zero_in),
	.clk	(rclk),

	.q	(d2stg_zero_in),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_2zero_in (
	.din	(d1stg_2zero_in),
	.clk	(rclk),

	.q	(d2stg_2zero_in),

	.se	(se),
	.si	(),
	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Floating point divide control pipeline.
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
//
//	Opcode pipeline- divide pipeline input.
//
///////////////////////////////////////////////////////////////////////////////

assign d1stg_hold= d1stg_div 
		|| d234stg_fdiv
		|| divs_cnt_lt_23
		|| divd_cnt_lt_52;

assign d1stg_holda= d1stg_div
        	|| d234stg_fdiv
        	|| divs_cnt_lt_23a
		|| divd_cnt_lt_52a;

assign d1stg_step= (!d1stg_hold);

assign d1stg_stepa= (!d1stg_holda);


assign d1stg_op_in[7:0]= ({8{d1stg_stepa}}
			    & (inq_op[7:0] & {8{inq_div}}));

dffr_s #(8) i_d1stg_op (
	.din	(d1stg_op_in[7:0]),
	.rst	(reset),
	.clk	(rclk),

	.q	(d1stg_op[7:0]),

	.se	(se),
	.si	(),
	.so	()
);

assign d1stg_div_in= inq_div && d1stg_stepa;

dffr_s #(1) i_d1stg_div (
	.din	(d1stg_div_in),
	.rst	(reset),
        .clk	(rclk),
 
        .q	(d1stg_div),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(5) i_d1stg_sngopa (
        .din	({5{inq_op[0]}}),
        .en	(d1stg_stepa),
        .clk	(rclk),
 
        .q	(d1stg_sngopa[4:0]),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(1) i_d1stg_dblop (
        .din    (inq_op[1]),
        .en     (d1stg_stepa),
        .clk    (rclk),
 
        .q      (d1stg_dblop),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(5) i_d1stg_dblopa (
        .din	({5{inq_op[1]}}),
        .en	(d1stg_stepa),
        .clk	(rclk),
 
        .q	(d1stg_dblopa[4:0]),
 
        .se	(se),
        .si	(),
        .so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Opcode decode- divide stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign d1stg_fdiv= (d1stg_op[7:0]==FDIVS) || (d1stg_op[7:0]==FDIVD);

assign d1stg_fdivs= (d1stg_op[7:0]==FDIVS);

assign d1stg_fdivd= (d1stg_op[7:0]==FDIVD);

assign d1stg_opdec[2:0]= {d1stg_fdiv,
			d1stg_fdivs,
			d1stg_fdivd};

assign d234stg_fdiv_in= d1stg_fdiv || d2stg_fdiv || d3stg_fdiv;

dffr_s #(3) i_d2stg_opdec (
	.din	(d1stg_opdec[2:0]),
	.rst	(reset),
	.clk	(rclk),

	.q	(d2stg_opdec[2:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dffr_s #(1) i_d234stg_fdiv (
	.din	(d234stg_fdiv_in),
	.rst    (reset),
        .clk    (rclk),

	.q	(d234stg_fdiv),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Opcode pipeline- divide stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign d2stg_fdiv= d2stg_opdec[2];
assign d2stg_fdivs= d2stg_opdec[1];
assign d2stg_fdivd= d2stg_opdec[0];

dffr_s #(3) i_d3stg_opdec (
        .din    (d2stg_opdec[2:0]),
        .rst    (reset),
        .clk    (rclk),

        .q      (d3stg_opdec[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- divide stage 3.
//
///////////////////////////////////////////////////////////////////////////////

assign d3stg_fdiv= d3stg_opdec[2];
//assign d3stg_fdivs= d3stg_opdec[1];
//assign d3stg_fdivd= d3stg_opdec[0];

dffr_s #(3) i_d4stg_opdec (
        .din    (d3stg_opdec[2:0]),
        .rst    (reset),
        .clk    (rclk),
 
        .q      (d4stg_opdec[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);
 

///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- divide stage 4.
//
///////////////////////////////////////////////////////////////////////////////

assign d4stg_fdiv= d4stg_opdec[2];
assign d4stg_fdivs= d4stg_opdec[1];
assign d4stg_fdivd= d4stg_opdec[0];
 
assign d5stg_step= (!d5stg_fdiv) || d6stg_step;

dffre_s #(3) i_d5stg_opdec (
	.din	(d4stg_opdec[2:0]),
	.en	(d5stg_step),
	.rst    (reset),
        .clk    (rclk),

        .q	(d5stg_opdec[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffre_s #(1) i_d5stg_fdiva (
	.din	(d4stg_fdiv),
	.en	(d5stg_step),
	.rst	(reset),
	.clk	(rclk),

	.q	(d5stg_fdiva),

	.se	(se),
	.si	(),
	.so	()
);

assign d5stg_fdivb_in= ((d5stg_step && d4stg_fdiv)
			|| ((!d5stg_step) && d5stg_fdiv))
		&& (!reset);

dff_s #(1) i_d5stg_fdivb (
	.din	(d5stg_fdivb_in),
	.clk	(rclk),

	.q	(d5stg_fdivb),

	.se	(se),
	.si	(),
	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- divide stage 5.
//
///////////////////////////////////////////////////////////////////////////////

assign d5stg_fdiv= d5stg_opdec[2];
assign d5stg_fdivs= d5stg_opdec[1];
assign d5stg_fdivd= d5stg_opdec[0];

assign d6stg_step= (d5stg_fdivd && (div_cnt[5:0]==6'h36))
		|| (d5stg_fdivs && (div_cnt[5:0]==6'h19))
		|| (d5stg_fdiv && ((({7'b0, div_cnt[5:0]}==div_exp1[12:0])
					&& (div_exp1[12:0]!=13'b0))
				|| (({7'b0, div_cnt[5:0]}==div_exp1[12:0])
					&& (div_exp1[12:0]==13'b0)
					&& d8stg_step)
				|| (div_exp1[12] && d8stg_step)));

assign d6stg_opdec_in[2:0]= ({3{d6stg_step}}
			    & d5stg_opdec[2:0]);

dffr_s #(3) i_d6stg_opdec (
	.din	(d6stg_opdec_in[2:0]),
	.rst    (reset),
        .clk    (rclk),

        .q      (d6stg_opdec[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- divide stage 6.
//
///////////////////////////////////////////////////////////////////////////////

assign d6stg_fdiv= d6stg_opdec[2];
assign d6stg_fdivs= d6stg_opdec[1];
assign d6stg_fdivd= d6stg_opdec[0];

dffr_s #(3) i_d7stg_opdec (
        .din    (d6stg_opdec[2:0]),
	.rst    (reset),
        .clk    (rclk),

        .q      (d7stg_opdec[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- divide stage 7.
//
///////////////////////////////////////////////////////////////////////////////

assign d7stg_fdiv= d7stg_opdec[2];
assign d7stg_fdivs= d7stg_opdec[1];
assign d7stg_fdivd= d7stg_opdec[0];

assign d8stg_fdiv_in= (d8stg_step && (!reset) && d7stg_fdiv)
                || ((!d8stg_step) && (!reset) && d8stg_fdiv);

dffre_s #(3) i_d8stg_opdec (
        .din    (d7stg_opdec[2:0]),
	.en	(d8stg_step),
	.rst    (reset),
        .clk    (rclk),

        .q      (d8stg_opdec[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- divide pipeline output.
//
///////////////////////////////////////////////////////////////////////////////

assign d8stg_fdiv= d8stg_opdec[2];
assign d8stg_fdivs= d8stg_opdec[1];
assign d8stg_fdivd= d8stg_opdec[0];

assign d8stg_hold= d8stg_fdiv && (!div_dest_rdy);

assign d8stg_step= (!d8stg_hold);

// Austin update
// Power management update

assign div_pipe_active_in =  // div pipe is executing a valid instr
   d1stg_fdiv || d2stg_fdiv || d3stg_fdiv || d4stg_fdiv |
   d5stg_fdiv || d6stg_fdiv || d7stg_fdiv || d8stg_fdiv ;

dffre_s #(1) i_div_pipe_active (
	.din	(div_pipe_active_in),
	.en     (1'b1),
        .rst    (reset),
        .clk    (rclk),

        .q      (div_pipe_active),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Divide information pipeline
//		- rounding mode
//		- ID
//		- sign logic
//	Front end of the pipeline.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(2) i_d1stg_rnd_mode (
	.din	(inq_rnd_mode[1:0]),
	.en	(d1stg_stepa),
	.clk	(rclk),

	.q	(d1stg_rnd_mode[1:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(5) i_d1stg_id (
        .din    (inq_id[4:0]),
        .en     (d1stg_stepa),
        .clk    (rclk),

        .q      (d1stg_id[4:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_d1stg_sign1 (
	.din	(inq_in1_63),
	.en	(d1stg_stepa),
        .clk    (rclk),

        .q      (d1stg_sign1),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_d1stg_sign2 (
        .din    (inq_in2_63),
        .en     (d1stg_stepa),
        .clk    (rclk),

        .q      (d1stg_sign2),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Divide information pipeline
//              - rounding mode
//              - ID
//              - sign logic
//      Back end of the pipeline.
//
///////////////////////////////////////////////////////////////////////////////

assign d1stg_sign= ((d1stg_sign1
				&& (!d2stg_snan_in2)
				&& (!(d2stg_qnan_in2 && (!d2stg_snan_in1))))
			^ (d1stg_sign2
				&& (!(d2stg_snan_in1 && (!d2stg_snan_in2)))
				&& (!(d2stg_qnan_in1 && (!d2stg_nan_in2)))))
		&& (!(d2stg_2inf_in || d2stg_2zero_in));
 
assign div_bkend_step= (d5stg_fdiv && (div_cnt[5:0]==6'b0) && d8stg_step);

dffe_s #(2) i_div_rnd_mode (
	.din	(d1stg_rnd_mode[1:0]),
	.en	(div_bkend_step),
	.clk    (rclk),

        .q      (div_rnd_mode[1:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign div_id_out_in[9:0]= ({10{div_bkend_step}}
			    & {(d1stg_id[4:2]==3'o7),
				(d1stg_id[4:2]==3'o6),
				(d1stg_id[4:2]==3'o5),
				(d1stg_id[4:2]==3'o4),
				(d1stg_id[4:2]==3'o3),
				(d1stg_id[4:2]==3'o2),
				(d1stg_id[4:2]==3'o1),
				(d1stg_id[4:2]==3'o0),
				d1stg_id[1:0]})
		| ({10{(!div_bkend_step)}}
			    & div_id_out[9:0]);

dff_s #(10) i_div_id_out (
	.din	(div_id_out_in[9:0]),
	.clk    (rclk),
 
        .q      (div_id_out[9:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_div_sign_out (
	.din	(d1stg_sign),
	.en	(div_bkend_step),
	.clk    (rclk),
 
        .q      (div_sign_out),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Divide counter.
//
//	Tracks the number of subtraction iterations.
//
///////////////////////////////////////////////////////////////////////////////

assign div_cnt_plus1[5:0]= (div_cnt[5:0] + 6'h01);

assign div_cnt_in[5:0]= ({6{(d5stg_fdiv && d8stg_step)}}
			    & div_cnt_plus1[5:0])
		| ({6{d4stg_fdiv}}
			    & 6'b0);

assign div_cnt_step= (d5stg_fdiv && d8stg_step)
		|| d4stg_fdiv;

dffre_s #(6) i_div_cnt (
	.din	(div_cnt_in[5:0]),
	.en	(div_cnt_step),
	.rst	(reset),
	.clk    (rclk),
 
        .q      (div_cnt[5:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign div_cnt_lt_step= (!d5stg_fdiv) || d6stg_step || d8stg_step;

assign divs_cnt_lt_23_in= d4stg_fdivs
		|| (d5stg_fdivs && (!d6stg_step) && (div_cnt_plus1[5:0]<6'h17));

dffre_s #(1) i_divs_cnt_lt_23 (
	.din	(divs_cnt_lt_23_in),
	.en	(div_cnt_lt_step),
	.rst	(reset),
	.clk	(rclk),

	.q	(divs_cnt_lt_23),
 
        .se	(se),
        .si	(),
        .so	()
);

dffre_s #(1) i_divs_cnt_lt_23a (
        .din	(divs_cnt_lt_23_in),
        .en	(div_cnt_lt_step),
        .rst	(reset),
        .clk	(rclk),
 
        .q	(divs_cnt_lt_23a),
 
        .se	(se),
        .si	(),
        .so	()
);

assign divd_cnt_lt_52_in= d4stg_fdivd
		|| (d5stg_fdivd && (!d6stg_step) && (div_cnt_plus1[5:0]<6'h34));

dffre_s #(1) i_divd_cnt_lt_52 (
	.din	(divd_cnt_lt_52_in),
	.en	(div_cnt_lt_step),
	.rst	(reset),
	.clk	(rclk),

	.q	(divd_cnt_lt_52),
 
        .se	(se),
        .si	(),
        .so	()
);

dffre_s #(1) i_divd_cnt_lt_52a (
        .din	(divd_cnt_lt_52_in),
        .en	(div_cnt_lt_step),
        .rst	(reset),
        .clk	(rclk),
 
        .q	(divd_cnt_lt_52a),
 
        .se	(se),
        .si	(),
        .so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Divide exception logic.
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
//
//	Divide overflow exception enabled.
//
///////////////////////////////////////////////////////////////////////////////

assign div_exc_step= d5stg_fdiv && (div_cnt[5:0]==6'b0) && d8stg_step;

assign div_of_mask_in= (!(d1stg_infnan_in || d1stg_zero_in));

dffe_s #(1) i_div_of_mask (
	.din	(div_of_mask_in),
	.en	(div_exc_step),
	.clk    (rclk),

        .q      (div_of_mask),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Divide invalid exception.
//
///////////////////////////////////////////////////////////////////////////////

assign div_nv_out_in= d1stg_snan_in1 || d1stg_snan_in2 || d1stg_2inf_in
		|| d1stg_2zero_in;

dffe_s #(1) i_div_nv_out (
	.din	(div_nv_out_in),
	.en	(div_exc_step),
	.clk    (rclk),

        .q      (div_nv_out),

	.se     (se),
        .si     (),
        .so     ()
);

///////////////////////////////////////////////////////////////////////////////
//
//      Divide by zero exception.
//
///////////////////////////////////////////////////////////////////////////////

assign div_dz_out_in= d1stg_zero_in2 && (!d1stg_zero_in1)
		&& (!d1stg_infnan_in1);

dffe_s #(1) i_div_dz_out (
        .din    (div_dz_out_in),
        .en     (div_exc_step),
        .clk    (rclk),
 
        .q      (div_dz_out),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Divide overflow exception.
//
///////////////////////////////////////////////////////////////////////////////

assign d7stg_in_of= ((!div_exp_out[12])
			&& d7stg_fdivd
			&& (div_exp_out[11] || (&div_exp_out[10:0]))
			&& div_of_mask)
		|| ((!div_exp_out[12])
			&& d7stg_fdivs
			&& ((|div_exp_out[11:8]) || (&div_exp_out[7:0]))
			&& div_of_mask);

assign div_of_out_tmp1_in= ((!div_exp_out[12])
			&& d7stg_fdivd
			&& (&div_exp_out[10:1])
			&& d7stg_rndup
			&& div_of_mask)
		|| ((!div_exp_out[12])
	                && d7stg_fdivs
			&& (&div_exp_out[7:1])
	                && d7stg_rndup
	                && div_of_mask);

dffe_s #(1) i_div_of_out_tmp1 (
	.din	(div_of_out_tmp1_in),
	.en	(d7stg_fdiv),
	.clk    (rclk),

        .q      (div_of_out_tmp1),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_div_of_out_tmp2 (
	.din	(d7stg_in_of),
	.en	(d7stg_fdiv),
	.clk	(rclk),

	.q	(div_of_out_tmp2),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_div_out_52_inv (
	.din	(div_frac_add_52_inva),
	.en	(d7stg_fdiv),
        .clk	(rclk),
 
        .q	(div_out_52_inv),

// Austin update
// include se pin
	.se	(se),
	.si	(),
        .so	()
);

assign div_of_out= div_of_out_tmp2
		|| (div_of_out_tmp1 && (!div_out_52_inv));


///////////////////////////////////////////////////////////////////////////////
//
//      Divide underflow exception.
//
///////////////////////////////////////////////////////////////////////////////

assign div_uf_out_in= ((!(|div_exp_out[11:0]))
			&& (div_frac_add_in1_neq_0
				|| d7stg_grd
				|| d7stg_stk)
			&& div_of_mask)
		|| (div_exp_out[12]
			&& div_of_mask);

dffe_s #(1) i_div_uf_out (
        .din    (div_uf_out_in),
        .en     (d7stg_fdiv),
        .clk    (rclk),
 
        .q      (div_uf_out),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Divide inexact exception.
//
///////////////////////////////////////////////////////////////////////////////

assign div_nx_out_in= d7stg_grd || d7stg_stk;

dffe_s #(1) i_div_nx_out (
        .din    (div_nx_out_in),
        .en     (d7stg_fdiv),
        .clk    (rclk),

        .q      (div_nx_out),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Divide exception output.
//
///////////////////////////////////////////////////////////////////////////////

// Austin update
// Overflow is always accompanied by inexact.
// Previously this was handled within the FFU.

// assign div_exc_out[4:0]= {div_nv_out, div_of_out, div_uf_out, div_dz_out,
//				div_nx_out};

assign div_exc_out[4:0] =
  {div_nv_out,
   div_of_out,
   div_uf_out,
   div_dz_out,
   (div_nx_out || div_of_out)};  // Overflow is always accompanied by inexact


///////////////////////////////////////////////////////////////////////////////
//
//      Divide pipeline control logic.
//
///////////////////////////////////////////////////////////////////////////////
 
///////////////////////////////////////////////////////////////////////////////
//
//	Select lines- divide normalization and special input injection.
//
///////////////////////////////////////////////////////////////////////////////

assign d1stg_spc_rslt= (d1stg_inf_in || d1stg_zero_in) && (!d1stg_nan_in);

assign div_norm_frac_in1_dbl_norm= d1stg_fdiv && d1stg_norm_dbl_in1
		&& (!d1stg_snan_dbl_in2)
		&& ((!d1stg_qnan_dbl_in2) || d1stg_snan_dbl_in1)
		&& (!d1stg_spc_rslt);

assign div_norm_frac_in1_dbl_dnrm= d1stg_fdiv && d1stg_denorm_dbl_in1
		&& (!d1stg_snan_dbl_in2)
		&& (!d1stg_qnan_dbl_in2)
		&& (!d1stg_spc_rslt);

assign div_norm_frac_in1_sng_norm= d1stg_fdiv && d1stg_norm_sng_in1
		&& (!d1stg_snan_sng_in2)
		&& ((!d1stg_qnan_sng_in2) || d1stg_snan_sng_in1)
		&& (!d1stg_spc_rslt);

assign div_norm_frac_in1_sng_dnrm= d1stg_fdiv && d1stg_denorm_sng_in1
		&& (!d1stg_snan_sng_in2)
		&& (!d1stg_qnan_sng_in2)
		&& (!d1stg_spc_rslt);

assign div_norm_frac_in2_dbl_norm= (d2stg_fdiv && d2stg_norm_dbl_in2
			&& (!d2stg_infnan_in) && (!d2stg_zero_in))
		|| (d1stg_fdiv && d1stg_snan_dbl_in2)
		|| (d1stg_fdiv && d1stg_qnan_dbl_in2 && (!d1stg_snan_dbl_in1));

assign div_norm_frac_in2_dbl_dnrm= d2stg_fdiv && d2stg_denorm_dbl_in2
			&& (!d2stg_infnan_in) && (!d2stg_zero_in);

assign div_norm_frac_in2_sng_norm= (d2stg_fdiv && d2stg_norm_sng_in2
			&& (!d2stg_infnan_in) && (!d2stg_zero_in))
		|| (d1stg_fdiv && d1stg_snan_sng_in2)
		|| (d1stg_fdiv && d1stg_qnan_sng_in2 && (!d1stg_snan_sng_in1));

assign div_norm_frac_in2_sng_dnrm= d2stg_fdiv && d2stg_denorm_sng_in2
			&& (!d2stg_infnan_in) && (!d2stg_zero_in);

assign div_norm_inf= (d2stg_fdiv && (d2stg_infnan_in || d2stg_zero_in))
		|| (d1stg_fdiv && ((d1stg_inf_in1 && (!d1stg_infnan_in2))
				|| (d1stg_zero_in2 && (!d1stg_infnan_in1)
					&& (!d1stg_zero_in1))));

assign div_norm_qnan= d1stg_fdiv && (d1stg_2inf_in || d1stg_2zero_in);

assign div_norm_zero= d1stg_fdiv
		&& ((d1stg_inf_in2 && (!d1stg_infnan_in1))
			|| (d1stg_zero_in1 && (!d1stg_infnan_in2)
				&& (!d1stg_zero_in2)));


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines- divide left shift.
//
///////////////////////////////////////////////////////////////////////////////

assign div_frac_add_in2_load= d4stg_fdiv || d6stg_fdiv;


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines- divide adder/subtractor 2nd input.
//
///////////////////////////////////////////////////////////////////////////////

assign d6stg_frac_out_shl1= (!div_frac_out_54) && (!div_exp_out[12])
		&& (div_exp_out[11:1]!=11'b0);

assign d6stg_frac_out_nosh= (!d6stg_frac_out_shl1);

assign div_frac_add_in1_add= d5stg_fdiv && (!div_exp1[12]) && d8stg_step;

assign div_frac_add_in1_load= d4stg_fdiv
		|| (d5stg_fdiv && (!div_exp1[12]) && d8stg_step)
		|| d6stg_fdiv;


///////////////////////////////////////////////////////////////////////////////
//
//	Divide rounding bits.
//
///////////////////////////////////////////////////////////////////////////////

assign d7stg_lsb_in= (d6stg_fdivd && d6stg_frac_2)
		|| ((!d6stg_fdivd) && d6stg_frac_31);

assign d7stg_grd_in= (d6stg_fdivd && d6stg_frac_1)
		|| ((!d6stg_fdivd) && d6stg_frac_30);

assign d7stg_stk_in= (d6stg_fdivd && d6stg_frac_0)
		|| ((!d6stg_fdivd) && d6stg_frac_29)
		|| div_frac_add_in1_neq_0;

dffe_s #(1) i_d7stg_lsb (
	.din	(d7stg_lsb_in),
	.en	(d6stg_fdiv),
	.clk    (rclk),

        .q      (d7stg_lsb),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_d7stg_grd (
        .din    (d7stg_grd_in),
        .en     (d6stg_fdiv),
        .clk    (rclk),
 
        .q      (d7stg_grd),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_d7stg_stk (
        .din    (d7stg_stk_in),
        .en     (d6stg_fdiv),
        .clk    (rclk),
 
        .q      (d7stg_stk),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Select lines- divide adder/subtractor and fraction output register.
//
///////////////////////////////////////////////////////////////////////////////

assign d7stg_rndup= ((div_rnd_mode[1:0]==2'b10) && (!div_sign_out)
			&& (d7stg_grd || d7stg_stk))
		|| ((div_rnd_mode[1:0]==2'b11) && div_sign_out
			&& (d7stg_grd || d7stg_stk))
		|| ((div_rnd_mode[1:0]==2'b00)
			&& ((d7stg_grd && d7stg_stk)
				|| (d7stg_grd && (!d7stg_stk) && d7stg_lsb)));

assign d7stg_rndup_inv= (!d7stg_rndup);

assign d7stg_to_0= (div_rnd_mode[1:0]==2'b01)
		|| ((div_rnd_mode[1:0]==2'b10) && div_sign_out)
		|| ((div_rnd_mode[1:0]==2'b11) && (!div_sign_out));

assign d7stg_to_0_inv= (!d7stg_to_0);

assign div_frac_out_add_in1= d7stg_fdiv && (!d7stg_rndup) && (!d7stg_in_of);

assign div_frac_out_add= d7stg_fdiv && d7stg_rndup && (!d7stg_in_of);

assign div_frac_out_shl1_dbl= d5stg_fdivd && (!div_exp1[12]) && d8stg_step;

assign div_frac_out_shl1_sng= d5stg_fdivs && (!div_exp1[12]) && d8stg_step;

assign div_frac_out_of= d7stg_fdiv && d7stg_in_of;

assign div_frac_out_load= d4stg_fdiv
		|| d7stg_fdiv
		|| div_frac_out_shl1_dbl
		|| div_frac_out_shl1_sng;


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines- divide exponent adder in the front end of the divide pipe.
//
///////////////////////////////////////////////////////////////////////////////

assign div_expadd1_in1_dbl_in= ((d1stg_stepa && inq_op[1])
			|| ((!d1stg_stepa) && d1stg_dblopa[4]))
		&& (!((d1stg_fdiv || d2stg_fdiv || d3stg_fdiv) && (!reset)));

dff_s #(1) i_div_expadd1_in1_dbl (
	.din	(div_expadd1_in1_dbl_in),
        .clk    (rclk),

	.q	(div_expadd1_in1_dbl),

	.se     (se),
        .si     (),
        .so     ()
);

assign div_expadd1_in1_sng_in= ((d1stg_stepa && inq_op[0])
			|| ((!d1stg_stepa) && d1stg_sngopa[4]))
		&& (!((d1stg_fdiv || d2stg_fdiv || d3stg_fdiv) && (!reset)));

dff_s #(1) i_div_expadd1_in1_sng (
	.din	(div_expadd1_in1_sng_in),
	.clk	(rclk),

	.q	(div_expadd1_in1_sng),

	.se	(se),
	.si	(),
	.so	()
);

assign div_expadd1_in2_exp_in2_dbl= d2stg_fdivd;

assign div_expadd1_in2_exp_in2_sng= d2stg_fdivs;

assign div_exp1_expadd1= d1stg_fdiv
		|| (d2stg_fdiv && (!d2stg_infnan_in) && (!d2stg_zero_in))
		|| d3stg_fdiv
		|| d4stg_fdiv;

assign div_exp1_0835= d2stg_fdivd && d2stg_max_exp;

assign div_exp1_0118= d2stg_fdivs && d2stg_max_exp;

assign div_exp1_zero= d2stg_fdiv && d2stg_zero_exp;

assign d2stg_max_exp= d2stg_nan_in || d2stg_inf_in1 || d2stg_zero_in2;

assign d2stg_zero_exp= (d2stg_inf_in2 && (!d2stg_infnan_in1))
		|| (d2stg_zero_in1 && (!d2stg_infnan_in2) && (!d2stg_zero_in2));

assign div_exp1_load= d1stg_fdiv || d2stg_fdiv || d3stg_fdiv || d4stg_fdiv;


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines- divide exponent adder in the back end of the divide pipe.
//
///////////////////////////////////////////////////////////////////////////////

assign div_expadd2_in1_exp_out_in= d6stg_opdec_in[2] || d6stg_fdiv;

dffr_s #(1) i_div_expadd2_in1_exp_out (
	.din	(div_expadd2_in1_exp_out_in),
	.rst	(reset),
	.clk	(rclk),

	.q	(div_expadd2_in1_exp_out),

	.se	(se),
	.si	(),
	.so	()
);

assign div_expadd2_no_decr_inv_in= (!(div_frac_out_53
		|| (div_exp1[11:0]==(({12{(!d5stg_fdivs)}} & 12'h035)
					| ({12{d5stg_fdivs}} & 12'h018)))
		|| div_expadd2_12));

assign div_expadd2_no_decr_load= d5stg_fdiv && d8stg_step;

dffe_s #(1) i_div_expadd2_no_decr_inv (
	.din	(div_expadd2_no_decr_inv_in),
	.en	(div_expadd2_no_decr_load),
	.clk	(rclk),

	.q	(div_expadd2_no_decr_inv),

	.se     (se),
        .si     (),
        .so     ()
);

assign div_expadd2_cin= d5stg_fdiv || d7stg_fdiv;

assign div_exp_out_zero= d7stg_fdiv && div_exp_out[12];

assign div_exp_out_expadd22_inv= (!(d6stg_fdiv
			|| (d5stg_fdiv && (div_cnt[5:0]==6'b0) && d8stg_step)));

assign div_exp_out_expadd2= ((d7stg_fdiv && d7stg_rndup && (!d7stg_in_of))
			|| (d5stg_fdiv && (div_cnt[5:0]==6'b0) && d8stg_step)
			|| d6stg_fdiv)
		&& (!div_exp_out_zero);

assign div_exp_out_of= d7stg_fdiv && d7stg_in_of;

assign div_exp_out_exp_out= d7stg_fdiv
		&& (!d7stg_in_of)
		&& (!div_exp_out_zero);

assign div_exp_out_load= (d5stg_fdiv && (div_cnt[5:0]==6'b0) && d8stg_step)
		|| d6stg_fdiv
		|| d7stg_fdiv;


endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_div_exp_dp.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//	Divide pipeline exponent datapath.
//
//  Patches by    : John Li
///////////////////////////////////////////////////////////////////////////////
//PITON_PROTO enables all FPGA related modifications





module fpu_div_exp_dp (
	inq_in1,
	inq_in2,
	d1stg_step,
	d234stg_fdiv,
	div_expadd1_in1_dbl,
	div_expadd1_in1_sng,
	div_expadd1_in2_exp_in2_dbl,
	div_expadd1_in2_exp_in2_sng,
	d3stg_fdiv,
	d4stg_fdiv,
	div_shl_cnt,
	div_exp1_expadd1,
	div_exp1_0835,
	div_exp1_0118,
	div_exp1_zero,
	div_exp1_load,
	div_expadd2_in1_exp_out,
	d5stg_fdiva,
	d5stg_fdivd,
	d5stg_fdivs,
	d6stg_fdiv,
	d7stg_fdiv,
	div_expadd2_no_decr_inv,
	div_expadd2_cin,
	div_exp_out_expadd2,
	div_exp_out_expadd22_inv,
	div_exp_out_of,
	d7stg_to_0_inv,
	d7stg_fdivd,
	div_exp_out_exp_out,
	d7stg_rndup_inv,
	div_frac_add_52_inv,
	div_exp_out_load,
	fdiv_clken_l,
	rclk,
	
	div_exp1,
	div_expadd2_12,
	div_exp_out,
	div_exp_outa,

	se,
	si,
	so
);


input [62:52]	inq_in1;		// request operand 1 to op pipes
input [62:52]	inq_in2;		// request operand 2 to op pipes
input		d1stg_step;		// divide pipe load
input		d234stg_fdiv;		// select line to div_expadd1
input		div_expadd1_in1_dbl;	// select line to div_expadd1
input		div_expadd1_in1_sng;	// select line to div_expadd1
input		div_expadd1_in2_exp_in2_dbl; // select line to div_expadd1
input		div_expadd1_in2_exp_in2_sng; //select line to div_expadd1
input		d3stg_fdiv;		// divide operation- divide stage 3
input		d4stg_fdiv;		// divide operation- divide stage 4
input [5:0]	div_shl_cnt;		// divide left shift amount
input		div_exp1_expadd1;	// select line to div_exp1
input		div_exp1_0835;		// select line to div_exp1
input		div_exp1_0118;		// select line to div_exp1
input		div_exp1_zero;		// select line to div_exp1
input		div_exp1_load;		// load enable to div_exp1
input		div_expadd2_in1_exp_out; // select line to div_expadd2
input		d5stg_fdiva;		// divide operation- divide stage 5
input		d5stg_fdivd;		// divide double- divide stage 5
input		d5stg_fdivs;		// divide single- divide stage 5
input		d6stg_fdiv;		// divide operation- divide stage 6
input		d7stg_fdiv;		// divide operation- divide stage 7
input		div_expadd2_no_decr_inv; // no exponent decrement
input		div_expadd2_cin;	// carry in to 2nd exponent adder
input		div_exp_out_expadd2;	// select line to div_exp_out
input		div_exp_out_expadd22_inv; // select line to div_exp_out
input		div_exp_out_of;		// overflow to exponent output
input		d7stg_to_0_inv;		// result to infinity on overflow
input		d7stg_fdivd;		// divide double- divide stage 7
input		div_exp_out_exp_out;	// select line to div_exp_out
input		d7stg_rndup_inv;	// no rounding increment
input		div_frac_add_52_inv;	// div_frac_add bit[52] inverted
input		div_exp_out_load;	// load enable to div_exp_out
input		fdiv_clken_l;           // div pipe clk enable - asserted low
input		rclk;		// global clock

output [12:0]	div_exp1;		// divide exponent- intermediate value
output        	div_expadd2_12;		// divide exponent- 2nd adder output
output [12:0]	div_exp_out;		// divide exponent output
output [10:0]	div_exp_outa;		// divide exponent output- buffered copy

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


wire [10:0]	div_exp_in1;
wire [10:0]	div_exp_in2;
wire [12:0]	div_expadd1_in1;
wire [12:0]	div_expadd1_in2;
wire [12:0]	div_expadd1;
wire [12:0]	div_exp1_in;
wire [12:0]	div_exp1;
wire [12:0]	div_expadd2_in1;
wire [12:0]	div_expadd2_in2;
wire [12:0]     div_expadd2;
wire         	div_expadd2_12;
wire [12:0]	div_exp_out_in;
wire [12:0]	div_exp_out;
wire [10:0]	div_exp_outa;


wire se_l;

//Previously missing wires
wire        clk;

assign se_l = ~se;




    clken_buf  ckbuf_div_exp_dp (
      .clk(clk),
      .rclk(rclk),
      .enb_l(fdiv_clken_l),
      .tmb_l(se_l)
      );


///////////////////////////////////////////////////////////////////////////////
//
//      Divide exponent inputs.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(11) i_div_exp_in1 (
        .din    (inq_in1[62:52]),
        .en     (d1stg_step),
        .clk    (clk),
 
        .q      (div_exp_in1[10:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(11) i_div_exp_in2 (
        .din    (inq_in2[62:52]),
        .en     (d1stg_step),
        .clk    (clk),
 
        .q      (div_exp_in2[10:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Divide exponent adder in the front end of the divide pipe.
//
///////////////////////////////////////////////////////////////////////////////

assign div_expadd1_in1[12:0]= ({13{d234stg_fdiv}}
			    & div_exp1[12:0])
		| ({13{div_expadd1_in1_dbl}}
			    & {2'b0, div_exp_in1[10:0]})
		| ({13{div_expadd1_in1_sng}}
			    & {5'b0, div_exp_in1[10:3]});

assign div_expadd1_in2[12:0]= ({13{div_expadd1_in1_dbl}}
			    & 13'h0436)
		| ({13{div_expadd1_in1_sng}}
			    & 13'h0099)
		| ({13{div_expadd1_in2_exp_in2_dbl}}
			    & (~{2'b0, div_exp_in2[10:0]}))
		| ({13{div_expadd1_in2_exp_in2_sng}}
			    & (~{5'b0, div_exp_in2[10:3]}))
		| ({13{d3stg_fdiv}}
			    & (~{7'b0, div_shl_cnt[5:0]}))
		| ({13{d4stg_fdiv}}
			    & {7'b0, div_shl_cnt[5:0]});

assign div_expadd1[12:0]= (div_expadd1_in1[12:0]
			+ div_expadd1_in2[12:0]);

assign div_exp1_in[12:0]= ({13{div_exp1_expadd1}}
			    & div_expadd1[12:0])
		| ({13{div_exp1_0835}}
			    & 13'h0835)
		| ({13{div_exp1_0118}}
			    & 13'h0118)
		| ({13{div_exp1_zero}}
			    & 13'h0000);

dffe_s #(13) i_div_exp1 (
	.din	(div_exp1_in[12:0]),
	.en	(div_exp1_load),
	.clk    (clk),

        .q      (div_exp1[12:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Divide exponent adder in the back end of the divide pipe.
//
///////////////////////////////////////////////////////////////////////////////

assign div_expadd2_in1[12:0]= ({13{div_expadd2_in1_exp_out}}
			    & div_exp_out[12:0])
		| ({13{d5stg_fdiva}}
			    & div_exp1[12:0]);

assign div_expadd2_in2[12:0]= ({13{d5stg_fdiva}}
			    & {7'h7f, d5stg_fdivs, 1'b0, d5stg_fdivd,
				d5stg_fdivs, 1'b1, d5stg_fdivs})
		| ({13{d6stg_fdiv}}
			    & {13{div_expadd2_no_decr_inv}})
		| ({13{d7stg_fdiv}}
			    & 13'h0000);

assign div_expadd2[12:0]= (div_expadd2_in1[12:0]
			+ div_expadd2_in2[12:0]
			+ {12'b0, div_expadd2_cin});
assign div_expadd2_12 = div_expadd2[12];

assign div_exp_out_in[12:0]= ({13{(div_exp_out_expadd2
				&& (!(div_frac_add_52_inv
					&& div_exp_out_expadd22_inv)))}}
			    & div_expadd2[12:0])
		| ({13{div_exp_out_of}}
			    & {2'b00, {3{d7stg_fdivd}}, 7'h7f, d7stg_to_0_inv})
		| ({13{(div_exp_out_exp_out
			&& (div_frac_add_52_inv || d7stg_rndup_inv))}}
			    & div_exp_out[12:0]);

dffe_s #(13) i_div_exp_out (
	.din	(div_exp_out_in[12:0]),
	.en	(div_exp_out_load),
	.clk    (clk),

        .q      (div_exp_out[12:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign div_exp_outa[10:0]= div_exp_out[10:0];


endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_div_frac_dp.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//	Divide pipeline fraction datapath.
//
//  Patches by    : John Li
///////////////////////////////////////////////////////////////////////////////
//PITON_PROTO enables all FPGA related modifications






module fpu_div_frac_dp (
	inq_in1,
	inq_in2,
	d1stg_step,
	div_norm_frac_in1_dbl_norm,
	div_norm_frac_in1_dbl_dnrm,
	div_norm_frac_in1_sng_norm,
	div_norm_frac_in1_sng_dnrm,
	div_norm_frac_in2_dbl_norm,
	div_norm_frac_in2_dbl_dnrm,
	div_norm_frac_in2_sng_norm,
	div_norm_frac_in2_sng_dnrm,
	div_norm_inf,
	div_norm_qnan,
	d1stg_dblop,
	div_norm_zero,
	d1stg_snan_dbl_in1,
	d1stg_snan_sng_in1,
	d1stg_snan_dbl_in2,
	d1stg_snan_sng_in2,
	d3stg_fdiv,
	d6stg_fdiv,
	d6stg_fdivd,
	d6stg_fdivs,
	div_frac_add_in2_load,
	d6stg_frac_out_shl1,
	d6stg_frac_out_nosh,
	d4stg_fdiv,
	div_frac_add_in1_add,
	div_frac_add_in1_load,
	d5stg_fdivb,
	div_frac_out_add_in1,
	div_frac_out_add,
	div_frac_out_shl1_dbl,
	div_frac_out_shl1_sng,
	div_frac_out_of,
	d7stg_to_0,
	div_frac_out_load,
	fdiv_clken_l,
	rclk,
	
	div_shl_cnt,
	d6stg_frac_0,
	d6stg_frac_1,
	d6stg_frac_2,
	d6stg_frac_29,
	d6stg_frac_30,
	d6stg_frac_31,
	div_frac_add_in1_neq_0,
	div_frac_add_52_inv,
	div_frac_add_52_inva,
	div_frac_out_54_53,
	div_frac_outa,

	se,
	si,
	so
);


input [54:0]	inq_in1;		// request operand 1 to op pipes
input [54:0]	inq_in2;		// request operand 2 to op pipes
input		d1stg_step;		// divide pipe load
input		div_norm_frac_in1_dbl_norm; // select line to div_norm
input		div_norm_frac_in1_dbl_dnrm; // select line to div_norm
input		div_norm_frac_in1_sng_norm; // select line to div_norm
input		div_norm_frac_in1_sng_dnrm; // select line to div_norm
input		div_norm_frac_in2_dbl_norm; // select line to div_norm
input		div_norm_frac_in2_dbl_dnrm; // select line to div_norm
input		div_norm_frac_in2_sng_norm; // select line to div_norm
input		div_norm_frac_in2_sng_dnrm; // select line to div_norm
input		div_norm_inf;		// select line to div_norm
input		div_norm_qnan;		// select line to div_norm
input		d1stg_dblop;		// double precision operation- d1 stg
input		div_norm_zero;		// select line to div_norm
input		d1stg_snan_dbl_in1;	// operand 1 is double signalling NaN
input		d1stg_snan_sng_in1;	// operand 1 is single signalling NaN
input		d1stg_snan_dbl_in2;	// operand 2 is double signalling NaN
input		d1stg_snan_sng_in2;	// operand 2 is single signalling NaN
input		d3stg_fdiv;		// divide operation- divide stage 3
input		d6stg_fdiv;		// divide operation- divide stage 6
input		d6stg_fdivd;		// divide double- divide stage 6
input		d6stg_fdivs;		// divide single- divide stage 6
input		div_frac_add_in2_load;	// load enable to div_frac_add_in2
input		d6stg_frac_out_shl1;	// select line to d6stg_frac
input		d6stg_frac_out_nosh;	// select line to d6stg_frac
input		d4stg_fdiv;		// divide operation- divide stage 4
input		div_frac_add_in1_add;	// select line to div_frac_add_in1
input		div_frac_add_in1_load;	// load enable to div_frac_add_in1
input		d5stg_fdivb;		// divide operation- divide stage 5
input		div_frac_out_add_in1;	// select line to div_frac_out
input		div_frac_out_add;	// select line to div_frac_out
input		div_frac_out_shl1_dbl;	// select line to div_frac_out
input		div_frac_out_shl1_sng;	// select line to div_frac_out
input		div_frac_out_of;	// select line to div_frac_out
input		d7stg_to_0;		// result to max finite on overflow
input		div_frac_out_load;	// load enable to div_frac_out
input		fdiv_clken_l;           // div pipe clk enable - asserted low
input		rclk;		// global clock

output [5:0]	div_shl_cnt;		// divide left shift amount
output		d6stg_frac_0;		// divide fraction[0]- intermediate val
output		d6stg_frac_1;		// divide fraction[1]- intermediate val
output		d6stg_frac_2;		// divide fraction[2]- intermediate val
output		d6stg_frac_29;		// divide fraction[29]- intermediate val
output		d6stg_frac_30;		// divide fraction[30]- intermediate val
output		d6stg_frac_31;		// divide fraction[31]- intermediate val
output		div_frac_add_in1_neq_0;	// div_frac_add_in1 != 0
output		div_frac_add_52_inv;	// div_frac_add bit[52] inverted
output		div_frac_add_52_inva;	// div_frac_add bit[52] inverted copy
output [1:0]  	div_frac_out_54_53;	// divide fraction output
output [51:0]	div_frac_outa;		// divide fraction output- buffered copy

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


wire [54:0]	div_frac_in1;
wire [54:0]	div_frac_in2;
wire [52:0]	div_norm_inv_in;
wire [52:0]	div_norm_inv;
wire [52:0]	div_norm;
wire [5:0]	div_lead0;
wire [5:0]	div_shl_cnt;
wire [5:0]	div_shl_cnta;
wire [52:0]	div_shl_data;
wire [105:53]	div_shl_tmp;
wire [52:0]	div_shl;
wire [54:0]	div_shl_save;
wire [54:0]	div_frac_add_in2_in;
wire [54:0]	div_frac_add_in2;
wire [53:0]	d6stg_frac;
wire		d6stg_frac_0;
wire		d6stg_frac_1;
wire		d6stg_frac_2;
wire		d6stg_frac_29;
wire		d6stg_frac_30;
wire		d6stg_frac_31;
wire [54:0]	div_frac_add_in1_in;
wire [54:0]	div_frac_add_in1;
wire [54:0]	div_frac_add_in1a;
wire		div_frac_add_in1_neq_0;
wire [54:0]	div_frac_add;
wire		div_frac_add_52_inv;
wire		div_frac_add_52_inva;
wire [54:0]	div_frac_out_in;
wire  [1:0]     div_frac_out_54_53;
wire [54:0]	div_frac_out;
wire [51:0]	div_frac_outa;


wire se_l;

//Previously missing wires
wire        clk;

assign se_l = ~se;




    clken_buf  ckbuf_div_frac_dp (
      .clk(clk),
      .rclk(rclk),
      .enb_l(fdiv_clken_l),
      .tmb_l(se_l)
      );


///////////////////////////////////////////////////////////////////////////////
//
//	Divide fraction inputs.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(55) i_div_frac_in1 (
	.din	(inq_in1[54:0]),
	.en	(d1stg_step),
	.clk    (clk),
 
        .q      (div_frac_in1[54:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(55) i_div_frac_in2 (
        .din    (inq_in2[54:0]),
        .en     (d1stg_step),
        .clk    (clk),
 
        .q      (div_frac_in2[54:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Divide normalization and special input injection.
//
///////////////////////////////////////////////////////////////////////////////

assign div_norm_inv_in[52:0]= (~(({53{div_norm_frac_in1_dbl_norm}}
			    & {1'b1, (div_frac_in1[51] || d1stg_snan_dbl_in1),
				div_frac_in1[50:0]})
		| ({53{div_norm_frac_in1_dbl_dnrm}}
			    & {div_frac_in1[51:0], 1'b0})
		| ({53{div_norm_frac_in1_sng_norm}}
			    & {1'b1, (div_frac_in1[54] || d1stg_snan_sng_in1),
				div_frac_in1[53:32], 29'b0})
		| ({53{div_norm_frac_in1_sng_dnrm}}
			    & {div_frac_in1[54:32], 30'b0})
		| ({53{div_norm_frac_in2_dbl_norm}}
			    & {1'b1, (div_frac_in2[51] || d1stg_snan_dbl_in2),
				div_frac_in2[50:0]})
		| ({53{div_norm_frac_in2_dbl_dnrm}}
			    & {div_frac_in2[51:0], 1'b0})
		| ({53{div_norm_frac_in2_sng_norm}}
			    & {1'b1, (div_frac_in2[54] || d1stg_snan_sng_in2),
				div_frac_in2[53:32], 29'b0})
		| ({53{div_norm_frac_in2_sng_dnrm}}
			    & {div_frac_in2[54:32], 30'b0})
		| ({53{div_norm_inf}}
			    & 53'h10000000000000)
		| ({53{div_norm_qnan}}
			    & {24'hffffff, {29{d1stg_dblop}}})
		| ({53{div_norm_zero}}
			    & 53'h00000000000000)));

dff_s #(53) i_div_norm_inv (
	.din	(div_norm_inv_in[52:0]),
	.clk	(clk),

	.q	(div_norm_inv[52:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign div_norm[52:0]= (~div_norm_inv);


///////////////////////////////////////////////////////////////////////////////
//
//	Divide lead zero count.
//
///////////////////////////////////////////////////////////////////////////////


fpu_cnt_lead0_53b i_div_lead0 (
	.din	(div_norm[52:0]),

	.lead0 (div_lead0[5:0])
);

dff_s #(12) i_dstg_xtra_regs (
        .din    ({div_lead0[5:0], div_lead0[5:0]}),
        .clk    (clk),

        .q      ({div_shl_cnta[5:0], div_shl_cnt[5:0]}),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Divide left shift.
//
///////////////////////////////////////////////////////////////////////////////

dff_s #(53) i_div_shl_data (
	.din	(div_norm[52:0]),
	.clk    (clk),

        .q      (div_shl_data[52:0]),

	.se     (se),
        .si     (),
        .so     ()
);

//assign div_shl_tmp[105:0]= {div_shl_data[52:0], 53'b0} << div_shl_cnta[5:0];
  assign div_shl_tmp[105:53]= div_shl_data[52:0]         << div_shl_cnta[5:0];

assign div_shl[52:0]= div_shl_tmp[105:53];

dffe_s #(55) i_div_shl_save (
	.din	({2'b0, div_shl[52:0]}),
	.en	(d3stg_fdiv),
        .clk    (clk),
 
        .q      (div_shl_save[54:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);

assign div_frac_add_in2_in[54:0]= ({55{d4stg_fdiv}}
			    & (~{2'b0, div_shl[52:0]}))
		| ({55{d6stg_fdiv}}
			    & {25'b0, d6stg_fdivs, 28'b0, d6stg_fdivd});

dffe_s #(55) i_div_frac_add_in2 (
	.din	(div_frac_add_in2_in[54:0]),
	.en	(div_frac_add_in2_load),
	.clk    (clk),

        .q      (div_frac_add_in2[54:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Divide adder/subtractor 2nd input.
//
///////////////////////////////////////////////////////////////////////////////

assign d6stg_frac[53:0]= ({54{d6stg_frac_out_shl1}}
			    & {div_frac_out[52:0], 1'b0})
		| ({54{d6stg_frac_out_nosh}}
			    & div_frac_out[53:0]);

assign d6stg_frac_0= d6stg_frac[0];
assign d6stg_frac_1= d6stg_frac[1];
assign d6stg_frac_2= d6stg_frac[2];
assign d6stg_frac_29= d6stg_frac[29];
assign d6stg_frac_30= d6stg_frac[30];
assign d6stg_frac_31= d6stg_frac[31];

assign div_frac_add_in1_in[54:0]= ({55{d4stg_fdiv}}
			    & div_shl_save[54:0])
		| ({55{(div_frac_add_in1_add && (!div_frac_add[54]))}}
			    & {div_frac_add[53:0], 1'b0})
		| ({55{(div_frac_add_in1_add && div_frac_add[54])}}
			    & {div_frac_add_in1[53:0], 1'b0})
		| ({55{d6stg_fdiv}}
			    & {3'b0, d6stg_frac[53:31],
				(d6stg_frac[30:2] & {29{d6stg_fdivd}})});

dffe_s #(55) i_div_frac_add_in1 (
	.din	(div_frac_add_in1_in[54:0]),
	.en	(div_frac_add_in1_load),
	.clk    (clk),

        .q      (div_frac_add_in1[54:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(55) i_div_frac_add_in1a (
	.din	(div_frac_add_in1_in[54:0]),
	.en	(div_frac_add_in1_load),
	.clk	(clk),

	.q	(div_frac_add_in1a[54:0]),

	.se	(se),
	.si	(),
	.so	()
);

assign div_frac_add_in1_neq_0= (|div_frac_add_in1[54:0]);


///////////////////////////////////////////////////////////////////////////////
//
//      Divide adder/subtractor.
//
///////////////////////////////////////////////////////////////////////////////

assign div_frac_add[54:0]= (div_frac_add_in1a[54:0]
			+ div_frac_add_in2[54:0]
			+ {54'b0, d5stg_fdivb});

assign div_frac_add_52_inv= (!div_frac_add[52]);
assign div_frac_add_52_inva= (!div_frac_add[52]);

assign div_frac_out_in[54:0]= ({55{d4stg_fdiv}}
			    & 55'b0)
		| ({55{div_frac_out_add_in1}}
			    & div_frac_add_in1[54:0])
		| ({55{div_frac_out_add}}
			    & div_frac_add[54:0])
		| ({55{div_frac_out_shl1_dbl}}
			    & {div_frac_out[53:0], (!div_frac_add[54])})
		| ({55{div_frac_out_shl1_sng}}
			    & {div_frac_out[53:29], (!div_frac_add[54]), 29'b0})
		| ({55{div_frac_out_of}}
			    & {55{d7stg_to_0}});

dffe_s #(55) i_div_frac_out (
	.din	(div_frac_out_in[54:0]),
	.en	(div_frac_out_load),
	.clk    (clk),

        .q      (div_frac_out[54:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign div_frac_out_54_53[1:0] = div_frac_out[54:53];

assign div_frac_outa[51:0]= div_frac_out[51:0];

endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_in.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//	FPU request input.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_in (
	pcx_fpio_data_rdy_px2,
	pcx_fpio_data_px2,
	a1stg_step,
	m1stg_step,
	d1stg_step,
	add_pipe_active,
	mul_pipe_active,
	div_pipe_active,
	inq_dout,
	sehold,
	arst_l,
	grst_l,
	rclk,

	fadd_clken_l,
	fmul_clken_l,
	fdiv_clken_l,
	
	inq_add,
	inq_mul,
	inq_div,
	inq_id,
	inq_rnd_mode,
	inq_fcc,
	inq_op,
	inq_in1_exp_neq_ffs,
	inq_in1_exp_eq_0,
	inq_in1_53_0_neq_0,
	inq_in1_50_0_neq_0,
	inq_in1_53_32_neq_0,
	inq_in1,
	inq_in2_exp_neq_ffs,
	inq_in2_exp_eq_0,
	inq_in2_53_0_neq_0,
	inq_in2_50_0_neq_0,
	inq_in2_53_32_neq_0,
	inq_in2,

	fp_id_in,
	fp_rnd_mode_in,
	fp_fcc_in,
	fp_op_in,
	fp_src1_in,
	fp_src2_in,
	inq_rdaddr,
	inq_wraddr,
	inq_read_en,
	inq_we,

	se,
	si,
	so
);


input		pcx_fpio_data_rdy_px2;	// FPU request ready from PCX
input [123:0]	pcx_fpio_data_px2;	// FPU request data from PCX
input		a1stg_step;		// add pipe load
input		m1stg_step;		// multiply pipe load
input		d1stg_step;		// divide pipe load
input 		add_pipe_active;        // add pipe is executing a valid instr
input 		mul_pipe_active;        // mul pipe is executing a valid instr
input 		div_pipe_active;        // div pipe is executing a valid instr
input [154:0] inq_dout; // data read out from input Q SRAM
input sehold; // macrotest hold for sram output mux in fpu_in_dp
input		arst_l;			// global async. reset- asserted low
input		grst_l;			// global sync. reset- asserted low
input		rclk;			// global clock

output		fadd_clken_l;		// add      pipe clk enable - asserted low
output		fmul_clken_l;		// multiply pipe clk enable - asserted low
output		fdiv_clken_l;		// divide   pipe clk enable - asserted low

output		inq_add;		// add pipe request
output		inq_mul;		// multiply pipe request
output		inq_div;		// divide pipe request
output [4:0]	inq_id;			// request ID to the operation pipes
output [1:0]	inq_rnd_mode;		// request rounding mode to op pipes
output [1:0]	inq_fcc;		// request cc ID to op pipes
output [7:0]	inq_op;			// request opcode to op pipes
output		inq_in1_exp_neq_ffs;	// request operand 1 exp!=ff's
output		inq_in1_exp_eq_0;	// request operand 1 exp==0
output		inq_in1_53_0_neq_0;	// request operand 1[53:0]!=0
output		inq_in1_50_0_neq_0;	// request operand 1[50:0]!=0
output		inq_in1_53_32_neq_0;	// request operand 1[53:32]!=0
output [63:0]	inq_in1;		// request operand 1 to op pipes
output		inq_in2_exp_neq_ffs;	// request operand 2 exp!=ff's
output		inq_in2_exp_eq_0;	// request operand 2 exp==0
output		inq_in2_53_0_neq_0;	// request operand 2[53:0]!=0
output		inq_in2_50_0_neq_0;	// request operand 2[50:0]!=0
output		inq_in2_53_32_neq_0;	// request operand 2[53:32]!=0
output [63:0]	inq_in2;		// request operand 2 to op pipes

// 6/20/03: New outputs to drive fpu-level i_fpu_inq_sram inputs 
output [4:0] fp_id_in; // id to be written into inq_sram
output [1:0] fp_rnd_mode_in; // rnd_mode to be written into inq_sram
output [1:0] fp_fcc_in; // fcc to be written into inq_sram
output [7:0] fp_op_in; // op field to be written into inq_sram
output [68:0] fp_src1_in; // operand1 and its pre-computed bits portion
output [68:0] fp_src2_in; // operand2, includes pre-computed bits
output [3:0] inq_rdaddr; // read address for inq_sram
output [3:0] inq_wraddr; // write address for inq_sram
output inq_read_en; // read enable for inq_sram
output inq_we; // write enable for inq_sram

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


// Assertions
//
// PCX/FPU Protocol Assumptions:
// -----------------------------
// 
// (1) If a split transaction occurs (fpu packet type A --> N stall cycles -->
// fpu packet type B), the next valid packet after the N stall cycles will always
// be "fpu packet type B"
//
// not0in state_transition -var {pcx_fpio_data_rdy_px2, (pcx_fpio_data_px2[123] & (pcx_fpio_data_px2[122:118]==5'h0a)), (pcx_fpio_data_px2[122:118]==5'h0b)} -val {1'b1, 1'b1, 1'b0} -next {1'b1, 1'b0, 1'b1} {1'b0, 1'b0, 1'b0} {1'b0, 1'b0, 1'b1} {1'b0, 1'b1, 1'b0} -match_by_cycle -message "PCX/FPU protocol violation"
// 
// (3) Crossbar always provides a two beat fpu transfer (packet types A and B).
// Single source instructions produce an invalid transfer on the second beat
// (packet type B).
//
// not0in custom -fire (pcx_fpio_data_rdy_px2 & pcx_fpio_data_px2[123] & (pcx_fpio_data_px2[122:118]==5'h0b) & pcx_fpio_data_px2[79]) -message "FPU given valid PCX packet B for single src fpop"
// 
// (4) For single precision operands, the unused 32-bit region of the 64-bit
// source is forced to zero by the FFU. The 32-bits of single precision data is
// always contained in the upper 32-bits of the 64-bit source.
//
// not0in custom -fire (pcx_fpio_data_rdy_px2 & pcx_fpio_data_px2[123] & (pcx_fpio_data_px2[122:118]==5'h0a) & ~pcx_fpio_data_px2[73] & ~(pcx_fpio_data_px2[31:0]==32'b0)) -message "FPU given invalid SP data in PCX packet A"
// not0in custom -fire (pcx_fpio_data_rdy_px2 & pcx_fpio_data_px2[123] & (pcx_fpio_data_px2[122:118]==5'h0b) & ~pcx_fpio_data_px2[73] & ~(pcx_fpio_data_px2[31:0]==32'b0)) -message "FPU given invalid SP data in PCX packet B"


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_in_ctl.
//
///////////////////////////////////////////////////////////////////////////////

wire		inq_we;			// input Q write enable
wire [3:0]	inq_wraddr;		// input Q write address
wire            inq_read_en;            // input Q read enable
wire [3:0]	inq_rdaddr;		// input Q read address
wire		inq_bp;			// bypass the input Q SRAM
wire		inq_bp_inv;		// don't bypass the input Q SRAM
wire		inq_fwrd;		// input Q is fwrd
wire		inq_fwrd_inv;		// input Q is not fwrd
wire		inq_add;		// add pipe request
wire		inq_mul;		// multiply pipe request
wire		inq_div;		// divide pipe request
wire  		fadd_clken_l;		// add      pipe clk enable - asserted low
wire 		fmul_clken_l;		// multiply pipe clk enable - asserted low
wire 		fdiv_clken_l;		// divide   pipe clk enable - asserted low


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_in_dp.
//
///////////////////////////////////////////////////////////////////////////////

wire [7:0]	fp_op_in;		// request opcode
wire            fp_op_in_7in;           // request opcode
wire [4:0]	inq_id;			// request ID to the operation pipes
wire [1:0]	inq_rnd_mode;		// request rounding mode to op pipes
wire [1:0]	inq_fcc;		// request cc ID to op pipes
wire [7:0]	inq_op;			// request opcode to op pipes
wire		inq_in1_exp_neq_ffs;	// request operand 1 exp!=ff's
wire		inq_in1_exp_eq_0;	// request operand 1 exp==0
wire		inq_in1_53_0_neq_0;	// request operand 1[53:0]!=0
wire		inq_in1_50_0_neq_0;	// request operand 1[50:0]!=0
wire		inq_in1_53_32_neq_0;	// request operand 1[53:32]!=0
wire [63:0]	inq_in1;		// request operand 1 to op pipes
wire		inq_in2_exp_neq_ffs;	// request operand 2 exp!=ff's
wire		inq_in2_exp_eq_0;	// request operand 2 exp==0
wire		inq_in2_53_0_neq_0;	// request operand 2[53:0]!=0
wire		inq_in2_50_0_neq_0;	// request operand 2[50:0]!=0
wire		inq_in2_53_32_neq_0;	// request operand 2[53:32]!=0
wire [63:0]	inq_in2;		// request operand 2 to op pipes

// 6/20/03: New outputs to drive fpu-level i_fpu_inq_sram inputs 
wire [4:0] fp_id_in; // id to be written into inq_sram
wire [1:0] fp_rnd_mode_in; // rnd_mode to be written into inq_sram
wire [1:0] fp_fcc_in; // fcc to be written into inq_sram
wire [68:0] fp_src1_in; // operand1 and its pre-computed bits portion
wire [68:0] fp_src2_in; // operand2, includes pre-computed bits

wire fp_data_rdy;

//Previously missing wires
wire        scan_out_fpu_in_ctl;

///////////////////////////////////////////////////////////////////////////////
//
//	Instantiations.
//
///////////////////////////////////////////////////////////////////////////////

fpu_in_ctl fpu_in_ctl (
	.pcx_fpio_data_rdy_px2		(pcx_fpio_data_rdy_px2),
	.pcx_fpio_data_px2		(pcx_fpio_data_px2[123:118]),
	.fp_op_in    			(fp_op_in[3:2]),
        .fp_op_in_7in                   (fp_op_in_7in),
	.a1stg_step			(a1stg_step),
	.m1stg_step			(m1stg_step),
	.d1stg_step			(d1stg_step),
	.add_pipe_active		(add_pipe_active),
	.mul_pipe_active		(mul_pipe_active),
	.div_pipe_active		(div_pipe_active),
	.sehold (sehold),
	.arst_l				(arst_l),
	.grst_l				(grst_l),
	.rclk			(rclk),

        .fp_data_rdy			(fp_data_rdy),
	.fadd_clken_l			(fadd_clken_l),
	.fmul_clken_l			(fmul_clken_l),
	.fdiv_clken_l			(fdiv_clken_l),

	.inq_we				(inq_we),
	.inq_wraddr			(inq_wraddr[3:0]),
	.inq_read_en			(inq_read_en),
	.inq_rdaddr			(inq_rdaddr[3:0]),
	.inq_bp				(inq_bp),
	.inq_bp_inv			(inq_bp_inv),
	.inq_fwrd			(inq_fwrd),
	.inq_fwrd_inv			(inq_fwrd_inv),
	.inq_add			(inq_add),
	.inq_mul			(inq_mul),
	.inq_div			(inq_div),

	.se           (se),
  .si           (si),
  .so           (scan_out_fpu_in_ctl)
);


fpu_in_dp fpu_in_dp (
        .fp_data_rdy			(fp_data_rdy),
        .fpio_data_px2_116_112          (pcx_fpio_data_px2[116:112]),
        .fpio_data_px2_79_72            (pcx_fpio_data_px2[79:72]),
        .fpio_data_px2_67_0             (pcx_fpio_data_px2[67:0]),
	.inq_fwrd			(inq_fwrd),
	.inq_fwrd_inv			(inq_fwrd_inv),
	.inq_bp				(inq_bp),
	.inq_bp_inv			(inq_bp_inv),
	.inq_dout    (inq_dout[154:0]),
	.rclk			(rclk),

        .fp_op_in_7in                   (fp_op_in_7in),
	.inq_id				(inq_id[4:0]),
	.inq_rnd_mode			(inq_rnd_mode[1:0]),
	.inq_fcc			(inq_fcc[1:0]),
	.inq_op				(inq_op[7:0]),
	.inq_in1_exp_neq_ffs		(inq_in1_exp_neq_ffs),
	.inq_in1_exp_eq_0		(inq_in1_exp_eq_0),
	.inq_in1_53_0_neq_0		(inq_in1_53_0_neq_0),
	.inq_in1_50_0_neq_0		(inq_in1_50_0_neq_0),
	.inq_in1_53_32_neq_0		(inq_in1_53_32_neq_0),
	.inq_in1			(inq_in1[63:0]),
	.inq_in2_exp_neq_ffs		(inq_in2_exp_neq_ffs),
	.inq_in2_exp_eq_0		(inq_in2_exp_eq_0),
	.inq_in2_53_0_neq_0		(inq_in2_53_0_neq_0),
	.inq_in2_50_0_neq_0		(inq_in2_50_0_neq_0),
	.inq_in2_53_32_neq_0		(inq_in2_53_32_neq_0),
	.inq_in2			(inq_in2[63:0]),

	.fp_id_in (fp_id_in[4:0]),
	.fp_rnd_mode_in (fp_rnd_mode_in[1:0]),
	.fp_fcc_in (fp_fcc_in[1:0]),
	.fp_op_in (fp_op_in[7:0]),
	.fp_src1_in (fp_src1_in[68:0]),
	.fp_src2_in (fp_src2_in[68:0]),

	.se                             (se),
        .si                             (scan_out_fpu_in_ctl),
        .so                             (so)
);


endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_in_ctl.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//      FPU input control logic.
//
///////////////////////////////////////////////////////////////////////////////
 
module fpu_in_ctl (
	pcx_fpio_data_rdy_px2,
	pcx_fpio_data_px2,
	fp_op_in,
        fp_op_in_7in,
	a1stg_step,
	m1stg_step,
	d1stg_step,
	add_pipe_active,
	mul_pipe_active,
	div_pipe_active,
	sehold,
	arst_l,
	grst_l,
	rclk,

        fp_data_rdy,
	fadd_clken_l,
	fmul_clken_l,
	fdiv_clken_l,
	
	inq_we,
	inq_wraddr,
	inq_read_en,
	inq_rdaddr,
	inq_bp,
	inq_bp_inv,
	inq_fwrd,
	inq_fwrd_inv,
	inq_add,
	inq_mul,
	inq_div,

	se,
	si,
	so
);


input		pcx_fpio_data_rdy_px2;	// FPU request ready from PCX
input [123:118]	pcx_fpio_data_px2;	// FPU request data from PCX
input [3:2]	fp_op_in;		// request opcode
input         	fp_op_in_7in;		// request opcode
input		a1stg_step;		// add pipe load
input		m1stg_step;		// multiply pipe load
input		d1stg_step;		// divide pipe load
input 		add_pipe_active;        // add pipe is executing a valid instr
input 		mul_pipe_active;        // mul pipe is executing a valid instr
input 		div_pipe_active;        // div pipe is executing a valid instr
input sehold; // hold sram output MUX (for inq_data[155:0] in fpu_in_dp) for macrotest
input		arst_l;			// global asynchronous reset- asserted low
input		grst_l;			// global synchronous reset- asserted low
input		rclk;		// global clock

output          fp_data_rdy;

output		fadd_clken_l;		// add      pipe clk enable - asserted low
output		fmul_clken_l;		// multiply pipe clk enable - asserted low
output		fdiv_clken_l;		// divide   pipe clk enable - asserted low

output		inq_we;			// input Q write enable
output [3:0]	inq_wraddr;		// input Q write address
output          inq_read_en;            // input Q read enable
output [3:0]	inq_rdaddr;		// input Q read address
output		inq_bp;			// bypass the input Q SRAM
output		inq_bp_inv;		// don't bypass the input Q SRAM
output		inq_fwrd;		// input Q is empty
output		inq_fwrd_inv;		// input Q is not empty
output		inq_add;		// add pipe request
output		inq_mul;		// multiply pipe request
output		inq_div;		// divide pipe request

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


wire		reset;
wire		fp_data_rdy;
wire		fp_vld_in;
wire [4:0]	fp_type_in;
wire  		fadd_clken_l;
wire 		fmul_clken_l;
wire 		fdiv_clken_l;
wire		fp_op_in_7;
wire		fp_op_in_7_inv;
wire		inq_we;
wire            inq_read_en;
wire [3:0]	inq_wrptr_plus1;
wire		inq_wrptr_step;
wire [3:0]	inq_wrptr;
wire [3:0]	inq_div_wrptr_plus1;
wire		inq_div_wrptr_step;
wire [3:0]	inq_div_wrptr;
wire [3:0]	inq_wraddr;
wire [3:0]	inq_wraddr_del;
wire		inq_re;
wire [3:0]	inq_rdptr_plus1;
wire [3:0]	inq_rdptr_in;
wire [3:0]	inq_rdptr;
wire		inq_div_re;
wire [3:0]	inq_div_rdptr_plus1;
wire [3:0]	inq_div_rdptr_in;
wire [3:0]	inq_div_rdptr;
wire		inq_div_rd_in;
wire		inq_div_rd;
wire [3:0]	inq_rdaddr;
wire [3:0]	inq_rdaddr_del;
wire		inq_bp;
wire		inq_bp_inv;
wire		inq_empty;
wire		inq_div_empty;
wire		inq_fwrd;
wire		inq_fwrd_inv;
wire		fp_add_in;
wire		fp_mul_in;
wire		fp_div_in;
wire [7:0]	inq_rdptr_dec_in;
wire [7:0]	inq_rdptr_dec;
wire [7:0]	inq_div_rdptr_dec_in;
wire [7:0]	inq_div_rdptr_dec;
wire [15:0]	inq_rdaddr_del_dec_in;
wire [15:0]	inq_rdaddr_del_dec;
wire		inq_pipe0_we;
wire		inq_pipe1_we;
wire		inq_pipe2_we;
wire		inq_pipe3_we;
wire		inq_pipe4_we;
wire		inq_pipe5_we;
wire		inq_pipe6_we;
wire		inq_pipe7_we;
wire		inq_pipe8_we;
wire		inq_pipe9_we;
wire		inq_pipe10_we;
wire		inq_pipe11_we;
wire		inq_pipe12_we;
wire		inq_pipe13_we;
wire		inq_pipe14_we;
wire		inq_pipe15_we;
wire [2:0]	inq_pipe0;
wire [2:0]	inq_pipe1;
wire [2:0]	inq_pipe2;
wire [2:0]	inq_pipe3;
wire [2:0]	inq_pipe4;
wire [2:0]	inq_pipe5;
wire [2:0]	inq_pipe6;
wire [2:0]	inq_pipe7;
wire [2:0]	inq_pipe8;
wire [2:0]	inq_pipe9;
wire [2:0]	inq_pipe10;
wire [2:0]	inq_pipe11;
wire [2:0]	inq_pipe12;
wire [2:0]	inq_pipe13;
wire [2:0]	inq_pipe14;
wire [2:0]	inq_pipe15;
wire [2:0]	inq_pipe;
wire		inq_div;
wire		inq_diva;
wire		inq_diva_dly;
wire		d1stg_step_dly;
wire		inq_mul;
wire		inq_mula;
wire		inq_add;
wire		inq_adda;
wire		valid_packet;
wire            valid_packet_dly;
wire		tag_sel;
wire sehold_inv;

//Previously missing wires
wire        in_ctl_rst_l;
wire        inq_adda_dly;
wire        inq_mula_dly;

dffrl_async #(1)  dffrl_in_ctl (
  .din  (grst_l),
  .clk  (rclk),
  .rst_l(arst_l),
  .q    (in_ctl_rst_l),
	.se (se),
	.si (),
	.so ()
  );

assign reset= (!in_ctl_rst_l);


///////////////////////////////////////////////////////////////////////////////
//
//	Capture request and input control information.
//
///////////////////////////////////////////////////////////////////////////////

dffr_s #(1) i_fp_data_rdy (
	.din	(pcx_fpio_data_rdy_px2),
	.rst    (reset),
        .clk    (rclk),

        .q      (fp_data_rdy),

	.se     (se),
        .si     (),
        .so     ()
);

dff_s #(1) i_fp_vld_in (
	.din	(pcx_fpio_data_px2[123]),
	.clk    (rclk),

        .q      (fp_vld_in),

	.se     (se),
        .si     (),
        .so     ()
);

dff_s #(5) i_fp_type_in (
	.din	(pcx_fpio_data_px2[122:118]),
        .clk    (rclk),
 
        .q      (fp_type_in[4:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Select lines- extract the two operands.
//
///////////////////////////////////////////////////////////////////////////////

assign fp_op_in_7= fp_op_in_7in;

assign fp_op_in_7_inv= (!fp_op_in_7);


///////////////////////////////////////////////////////////////////////////////
//
//	Input queue control logic
//		- write enables
//		- write pointers
//		- read enables
//		- read pointers
//		- write address
//		- read address
//
///////////////////////////////////////////////////////////////////////////////

assign inq_we= fp_data_rdy && fp_vld_in
		&& (((fp_type_in[4:0]==5'h0a) && fp_op_in_7)
			|| ((fp_type_in[4:0]==5'h0b) && fp_op_in_7_inv));

assign inq_wrptr_plus1[3:0]= inq_wrptr[3:0] + 4'h1;

assign inq_wrptr_step= inq_we && (!fp_div_in);

dffre_s #(4) i_inq_wrptr (
	.din	(inq_wrptr_plus1[3:0]),
	.en	(inq_wrptr_step),
	.rst	(reset),
	.clk    (rclk),

        .q      (inq_wrptr[3:0]),

        .se     (se),
        .si     (),
        .so     ()
);

assign inq_div_wrptr_plus1[3:0]= inq_div_wrptr[3:0] + 4'h1;

assign inq_div_wrptr_step= inq_we && fp_div_in;

dffre_s #(4) i_inq_div_wrptr (
        .din    (inq_div_wrptr_plus1[3:0]),
        .en     (inq_div_wrptr_step),
        .rst    (reset),
        .clk    (rclk),
 
        .q      (inq_div_wrptr[3:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);

assign inq_wraddr[3:0]= {fp_div_in,
		(({3{fp_div_in}}
			    & inq_div_wrptr[2:0])
		    | ({3{(!fp_div_in)}}
			    & inq_wrptr[2:0]))};

dff_s #(4) i_inq_wraddr_del (
	.din	(inq_wraddr[3:0]),
	.clk	(rclk),

	.q	(inq_wraddr_del[3:0]),

	.se	(se),
	.si	(),
	.so	()
);

assign inq_read_en = ~inq_empty | ~inq_div_empty;

assign inq_re= (inq_adda && a1stg_step)
		|| (inq_mula && m1stg_step);

assign inq_rdptr_plus1[3:0]= inq_rdptr[3:0] + 4'h1;

assign inq_rdptr_in[3:0]= ({4{(inq_re && (!reset))}}
			    & inq_rdptr_plus1[3:0])
		| ({4{((!inq_re) && (!reset))}}
			    & inq_rdptr[3:0]);

dff_s #(4) i_inq_rdptr (
	.din	(inq_rdptr_in[3:0]),
	.clk    (rclk),
 
        .q      (inq_rdptr[3:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);

assign inq_div_re= (inq_diva && d1stg_step);

assign inq_div_rdptr_plus1[3:0]= inq_div_rdptr[3:0] + 4'h1;

assign inq_div_rdptr_in[3:0]= ({4{(inq_div_re && (!reset))}}
                            & inq_div_rdptr_plus1[3:0])
                | ({4{((!inq_div_re) && (!reset))}}
                            & inq_div_rdptr[3:0]);
 
dff_s #(4) i_inq_div_rdptr (
        .din    (inq_div_rdptr_in[3:0]),
        .clk    (rclk),

        .q      (inq_div_rdptr[3:0]),

        .se     (se),
        .si     (),
        .so     ()
);

assign inq_div_rd_in= (!inq_div_empty) && d1stg_step && (!inq_diva);

dff_s #(1) i_inq_div_rd (
	.din	(inq_div_rd_in),
	.clk    (rclk),

        .q      (inq_div_rd),

        .se     (se),
        .si     (),
        .so     ()
);

assign inq_rdaddr[3:0]= {inq_div_rd_in,
		(({3{inq_div_rd_in}}
			    & (inq_div_rdptr[2:0] & {3{(!reset)}}))
		    | ({3{(!inq_div_rd_in)}}
			    & inq_rdptr_in[2:0]))};

dff_s #(4) i_inq_rdaddr_del (
	.din	(inq_rdaddr[3:0]),
        .clk	(rclk),
 
        .q	(inq_rdaddr_del[3:0]),
 
        .se	(se),
        .si	(),
        .so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Input queue empty and bypass signals.
//
///////////////////////////////////////////////////////////////////////////////

// Power management update

assign valid_packet = fp_data_rdy && fp_vld_in &&
                      ((fp_type_in[4:0]==5'h0a) || (fp_type_in[4:0]==5'h0b));

dffre_s #(1) i_valid_packet_dly (
	.din	(valid_packet),
	.en     (1'b1),
        .rst    (reset),
        .clk    (rclk),

        .q      (valid_packet_dly),

        .se     (se),
        .si     (),
        .so     ()
);

// Never bypass/forward invalid packets to the execution pipes
// assign inq_bp= (inq_wraddr_del[3:0]==inq_rdaddr_del[3:0]);

// 11/11/03: macrotest (AND with sehold_inv) 
assign sehold_inv = ~sehold;

assign inq_bp= (inq_wraddr_del[3:0]==inq_rdaddr_del[3:0]) && valid_packet_dly && sehold_inv;

assign inq_bp_inv= (!inq_bp);

assign inq_empty= (inq_wrptr[3:0]==inq_rdptr[3:0]);

assign inq_div_empty= (inq_div_wrptr[3:0]==inq_div_rdptr[3:0]);

// Power management update
// Never bypass/forward invalid packets to the execution pipes
// assign inq_fwrd= (inq_empty && (!inq_div_rd))
//		|| (inq_div_empty && fp_div_in && fp_data_rdy && fp_vld_in
//			&& d1stg_step);

// 11/11/03: macrotest change (AND with sehold_inv) 
assign inq_fwrd= ((inq_empty && (!inq_div_rd))
  		|| (inq_div_empty && fp_div_in
  			&& d1stg_step)) && valid_packet && sehold_inv;

assign inq_fwrd_inv= (!inq_fwrd);


///////////////////////////////////////////////////////////////////////////////
//
//	FPU pipe selection flags.
//
///////////////////////////////////////////////////////////////////////////////

assign fp_add_in= fp_data_rdy && fp_vld_in && (fp_type_in[4:1]==4'h5)
		&& ((fp_op_in_7 && (!fp_type_in[0]))
			|| (fp_op_in_7_inv && (!fp_op_in[3]) && fp_type_in[0]));

assign fp_mul_in= fp_data_rdy && fp_vld_in && (fp_type_in[4:0]==5'h0b)
		&& fp_op_in_7_inv && (fp_op_in[3:2]==2'b10);

assign fp_div_in= fp_data_rdy && fp_vld_in && (fp_type_in[4:0]==5'h0b)
                && fp_op_in_7_inv && (fp_op_in[3:2]==2'b11);

assign inq_rdptr_dec_in[7:0]= ({8{reset}}
			    & 8'h01)
		| ({8{(inq_re && (!reset))}}
			    & {inq_rdptr_dec[6:0], inq_rdptr_dec[7]})
		| ({8{((!inq_re) && (!reset))}}
			    & inq_rdptr_dec[7:0]);

dff_s #(8) i_inq_rdptr_dec (
	.din	(inq_rdptr_dec_in[7:0]),
	.clk	(rclk),

	.q	(inq_rdptr_dec[7:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign inq_div_rdptr_dec_in[7:0]= ({8{reset}}
                            & 8'h01)
                | ({8{(inq_div_re && (!reset))}}
                            & {inq_div_rdptr_dec[6:0], inq_div_rdptr_dec[7]})
                | ({8{((!inq_div_re) && (!reset))}}
                            & inq_div_rdptr_dec[7:0]);
 
dff_s #(8) i_inq_div_rdptr_dec (
        .din    (inq_div_rdptr_dec_in[7:0]),
        .clk    (rclk),

        .q      (inq_div_rdptr_dec[7:0]),

        .se     (se),
        .si     (),
        .so     ()
);

assign inq_rdaddr_del_dec_in[15:0]= ({16{((!inq_div_empty) && d1stg_step
					&& (!inq_diva))}}
			    & {(inq_div_rdptr_dec[7:1] & {7{(!reset)}}),
				(inq_div_rdptr_dec[0] || reset), 8'b0})
		| ({16{(!((!inq_div_empty) && d1stg_step && (!inq_diva)))}}
			    & {8'b0, inq_rdptr_dec_in[7:0]});

dff_s #(16) i_inq_rdaddr_del_dec (
	.din	(inq_rdaddr_del_dec_in[15:0]),
	.clk	(rclk),

	.q	(inq_rdaddr_del_dec[15:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);

assign inq_pipe0_we= inq_we && (!fp_div_in) && (inq_wrptr[2:0]==3'h0);
assign inq_pipe1_we= inq_we && (!fp_div_in) && (inq_wrptr[2:0]==3'h1);
assign inq_pipe2_we= inq_we && (!fp_div_in) && (inq_wrptr[2:0]==3'h2);
assign inq_pipe3_we= inq_we && (!fp_div_in) && (inq_wrptr[2:0]==3'h3);
assign inq_pipe4_we= inq_we && (!fp_div_in) && (inq_wrptr[2:0]==3'h4);
assign inq_pipe5_we= inq_we && (!fp_div_in) && (inq_wrptr[2:0]==3'h5);
assign inq_pipe6_we= inq_we && (!fp_div_in) && (inq_wrptr[2:0]==3'h6);
assign inq_pipe7_we= inq_we && (!fp_div_in) && (inq_wrptr[2:0]==3'h7);

assign inq_pipe8_we= inq_we && fp_div_in && (inq_div_wrptr[2:0]==3'h0);
assign inq_pipe9_we= inq_we && fp_div_in && (inq_div_wrptr[2:0]==3'h1);
assign inq_pipe10_we= inq_we && fp_div_in && (inq_div_wrptr[2:0]==3'h2);
assign inq_pipe11_we= inq_we && fp_div_in && (inq_div_wrptr[2:0]==3'h3);
assign inq_pipe12_we= inq_we && fp_div_in && (inq_div_wrptr[2:0]==3'h4);
assign inq_pipe13_we= inq_we && fp_div_in && (inq_div_wrptr[2:0]==3'h5);
assign inq_pipe14_we= inq_we && fp_div_in && (inq_div_wrptr[2:0]==3'h6);
assign inq_pipe15_we= inq_we && fp_div_in && (inq_div_wrptr[2:0]==3'h7);

dffre_s #(3) i_inq_pipe0 (
	.din	({fp_div_in, fp_mul_in, fp_add_in}),
	.en	(inq_pipe0_we),
        .rst    (reset),
	.clk    (rclk),

        .q      (inq_pipe0[2:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffre_s #(3) i_inq_pipe1 (
        .din    ({fp_div_in, fp_mul_in, fp_add_in}),
        .en     (inq_pipe1_we),
        .rst    (reset),
        .clk    (rclk),

        .q      (inq_pipe1[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffre_s #(3) i_inq_pipe2 (
        .din    ({fp_div_in, fp_mul_in, fp_add_in}),
        .en     (inq_pipe2_we),
        .rst    (reset),
        .clk    (rclk),

        .q      (inq_pipe2[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffre_s #(3) i_inq_pipe3 (
        .din    ({fp_div_in, fp_mul_in, fp_add_in}),
        .en     (inq_pipe3_we),
        .rst    (reset),
        .clk    (rclk),

        .q      (inq_pipe3[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffre_s #(3) i_inq_pipe4 (
        .din    ({fp_div_in, fp_mul_in, fp_add_in}),
        .en     (inq_pipe4_we),
        .rst    (reset),
        .clk    (rclk),

        .q      (inq_pipe4[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffre_s #(3) i_inq_pipe5 (
        .din    ({fp_div_in, fp_mul_in, fp_add_in}),
        .en     (inq_pipe5_we),
        .rst    (reset),
        .clk    (rclk),

        .q      (inq_pipe5[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffre_s #(3) i_inq_pipe6 (
        .din    ({fp_div_in, fp_mul_in, fp_add_in}),
        .en     (inq_pipe6_we),
        .rst    (reset),
        .clk    (rclk),

        .q      (inq_pipe6[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffre_s #(3) i_inq_pipe7 (
        .din    ({fp_div_in, fp_mul_in, fp_add_in}),
        .en     (inq_pipe7_we),
        .rst    (reset),
        .clk    (rclk),

        .q      (inq_pipe7[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffre_s #(3) i_inq_pipe8 (
        .din    ({fp_div_in, fp_mul_in, fp_add_in}),
        .en     (inq_pipe8_we),
        .rst    (reset),
        .clk    (rclk),

        .q      (inq_pipe8[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffre_s #(3) i_inq_pipe9 (
        .din    ({fp_div_in, fp_mul_in, fp_add_in}),
        .en     (inq_pipe9_we),
        .rst    (reset),
        .clk    (rclk),

        .q      (inq_pipe9[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffre_s #(3) i_inq_pipe10 (
        .din    ({fp_div_in, fp_mul_in, fp_add_in}),
        .en     (inq_pipe10_we),
        .rst    (reset),
        .clk    (rclk),

        .q      (inq_pipe10[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffre_s #(3) i_inq_pipe11 (
        .din    ({fp_div_in, fp_mul_in, fp_add_in}),
        .en     (inq_pipe11_we),
        .rst    (reset),
        .clk    (rclk),

        .q      (inq_pipe11[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffre_s #(3) i_inq_pipe12 (
        .din    ({fp_div_in, fp_mul_in, fp_add_in}),
        .en     (inq_pipe12_we),
        .rst    (reset),
        .clk    (rclk),

        .q      (inq_pipe12[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffre_s #(3) i_inq_pipe13 (
        .din    ({fp_div_in, fp_mul_in, fp_add_in}),
        .en     (inq_pipe13_we),
        .rst    (reset),
        .clk    (rclk),

        .q      (inq_pipe13[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffre_s #(3) i_inq_pipe14 (
        .din    ({fp_div_in, fp_mul_in, fp_add_in}),
        .en     (inq_pipe14_we),
        .rst    (reset),
        .clk    (rclk),

        .q      (inq_pipe14[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffre_s #(3) i_inq_pipe15 (
        .din    ({fp_div_in, fp_mul_in, fp_add_in}),
        .en     (inq_pipe15_we),
        .rst    (reset),
        .clk    (rclk),

        .q      (inq_pipe15[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);

// Power management update
// 3-bit fifo pipe tags (div,mul,add) are not cleared after use.
// Now that inq_fwrd is qualified by valid_packet, inq_fwrd can't be
// used for inq_pipe[2:0] selection.

assign tag_sel = (inq_empty && (!inq_div_rd))
  		|| (inq_div_empty && fp_div_in && fp_data_rdy && fp_vld_in
  			&& d1stg_step);

assign inq_pipe[2:0]= ({3{tag_sel}}
                                // Austin update
                                // performance change: allow div to bypass FIFO (2 cyc latency reduction)
			    & {(inq_div_empty && fp_div_in && fp_data_rdy && fp_vld_in
				&& d1stg_step
				&& d1stg_step_dly && (!inq_diva_dly)),
                                fp_mul_in,
				fp_add_in})
		| ({3{(!tag_sel)}}
			    & (({3{inq_rdaddr_del_dec[0]}}
					& inq_pipe0[2:0])
				| ({3{inq_rdaddr_del_dec[1]}}
                                        & inq_pipe1[2:0])
                                | ({3{inq_rdaddr_del_dec[2]}}
                                        & inq_pipe2[2:0])
                                | ({3{inq_rdaddr_del_dec[3]}}
                                        & inq_pipe3[2:0])
                                | ({3{inq_rdaddr_del_dec[4]}}
                                        & inq_pipe4[2:0])
                                | ({3{inq_rdaddr_del_dec[5]}}
                                        & inq_pipe5[2:0])
                                | ({3{inq_rdaddr_del_dec[6]}}
                                        & inq_pipe6[2:0])
                                | ({3{inq_rdaddr_del_dec[7]}}
                                        & inq_pipe7[2:0])
                                | ({3{inq_rdaddr_del_dec[8]}}
                                        & inq_pipe8[2:0])
                                | ({3{inq_rdaddr_del_dec[9]}}
                                        & inq_pipe9[2:0])
                                | ({3{inq_rdaddr_del_dec[10]}}
                                        & inq_pipe10[2:0])
                                | ({3{inq_rdaddr_del_dec[11]}}
                                        & inq_pipe11[2:0])
                                | ({3{inq_rdaddr_del_dec[12]}}
                                        & inq_pipe12[2:0])
                                | ({3{inq_rdaddr_del_dec[13]}}
                                        & inq_pipe13[2:0])
                                | ({3{inq_rdaddr_del_dec[14]}}
                                        & inq_pipe14[2:0])
                                | ({3{inq_rdaddr_del_dec[15]}}
                                        & inq_pipe15[2:0])));

assign inq_div= inq_pipe[2];
assign inq_diva= inq_pipe[2];
assign inq_mul= inq_pipe[1];
assign inq_mula= inq_pipe[1];
assign inq_add= inq_pipe[0];
assign inq_adda= inq_pipe[0];


// Power management update
// Gate the clocks on a per pipe basis (add, mul, div independently)
// when a given pipe is not in use

dffre_s #(1) i_inq_adda_dly (
	.din	(inq_adda),
	.en     (1'b1),
        .rst    (reset),
        .clk    (rclk),

        .q      (inq_adda_dly),

        .se     (se),
        .si     (),
        .so     ()
);

dffre_s #(1) i_inq_mula_dly (
	.din	(inq_mula),
	.en     (1'b1),
        .rst    (reset),
        .clk    (rclk),

        .q      (inq_mula_dly),

        .se     (se),
        .si     (),
        .so     ()
);

dffre_s #(1) i_inq_diva_dly (
	.din	(inq_diva),
	.en     (1'b1),
        .rst    (reset),
        .clk    (rclk),

        .q      (inq_diva_dly),

        .se     (se),
        .si     (),
        .so     ()
);

dffre_s #(1) i_d1stg_step_dly (
	.din	(d1stg_step),
	.en     (1'b1),
        .rst    (reset),
        .clk    (rclk),

        .q      (d1stg_step_dly),

        .se     (se),
        .si     (),
        .so     ()
);

assign fadd_clken_l = !(add_pipe_active || inq_adda || inq_adda_dly || reset);
assign fmul_clken_l = !(mul_pipe_active || inq_mula || inq_mula_dly || reset);
assign fdiv_clken_l = !(div_pipe_active || inq_diva || inq_diva_dly || reset);


endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_in_dp.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//      FPU input datapath.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_in_dp (
	fp_data_rdy,
        fpio_data_px2_116_112,
        fpio_data_px2_79_72,
        fpio_data_px2_67_0,
	inq_fwrd,
	inq_fwrd_inv,
	inq_bp,
	inq_bp_inv,
	inq_dout,
	rclk,
	
        fp_op_in_7in,
	inq_id,
	inq_rnd_mode,
	inq_fcc,
	inq_op,
	inq_in1_exp_neq_ffs,
	inq_in1_exp_eq_0,
	inq_in1_53_0_neq_0,
	inq_in1_50_0_neq_0,
	inq_in1_53_32_neq_0,
	inq_in1,
	inq_in2_exp_neq_ffs,
	inq_in2_exp_eq_0,
	inq_in2_53_0_neq_0,
	inq_in2_50_0_neq_0,
	inq_in2_53_32_neq_0,
	inq_in2,

	fp_id_in,
	fp_rnd_mode_in,
	fp_fcc_in,
	fp_op_in,
	fp_src1_in,
	fp_src2_in,

	se,
	si,
	so
);


input           fp_data_rdy;
input [116:112] fpio_data_px2_116_112;  // FPU request data from PCX
input [79:72]   fpio_data_px2_79_72;    // FPU request data from PCX
input [67:0]    fpio_data_px2_67_0;     // FPU request data from PCX
input		inq_fwrd;		// input Q is empty
input		inq_fwrd_inv;		// input Q is not empty
input		inq_bp;			// bypass the input Q SRAM
input		inq_bp_inv;		// don't bypass the input Q SRAM
input [154:0] inq_dout; // data read out from input Q SRAM
input		rclk;		// global clock

output          fp_op_in_7in;           // request opcode
output [4:0]	inq_id;			// request ID to the operation pipes
output [1:0]	inq_rnd_mode;		// request rounding mode to op pipes
output [1:0]	inq_fcc;		// request cc ID to op pipes
output [7:0]	inq_op;			// request opcode to op pipes
output		inq_in1_exp_neq_ffs;	// request operand 1 exp!=ff's
output		inq_in1_exp_eq_0;	// request operand 1 exp==0
output		inq_in1_53_0_neq_0;	// request operand 1[53:0]!=0
output		inq_in1_50_0_neq_0;	// request operand 1[50:0]!=0
output		inq_in1_53_32_neq_0;	// request operand 1[53:32]!=0
output [63:0]	inq_in1;		// request operand 1 to op pipes
output		inq_in2_exp_neq_ffs;	// request operand 2 exp!=ff's
output		inq_in2_exp_eq_0;	// request operand 2 exp==0
output		inq_in2_53_0_neq_0;	// request operand 2[53:0]!=0
output		inq_in2_50_0_neq_0;	// request operand 2[50:0]!=0
output		inq_in2_53_32_neq_0;	// request operand 2[53:32]!=0
output [63:0]	inq_in2;		// request operand 2 to op pipes

// 6/20/03: New outputs to drive fpu-level i_fpu_inq_sram inputs 
output [4:0] fp_id_in; // id to be written into inq_sram
output [1:0] fp_rnd_mode_in; // rnd_mode to be written into inq_sram
output [1:0] fp_fcc_in; // fcc to be written into inq_sram
output [7:0] fp_op_in; // request opcode
output [68:0] fp_src1_in; // operand1 and its pre-computed bits portion
output [68:0] fp_src2_in; // operand2, includes pre-computed bits

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


wire [154:0]	inq_dout;
wire [4:0]	fp_id_in;
wire [7:0]	fp_op_in;
wire		fp_op_in_7;		// request opcode bit[7]
wire		fp_op_in_7_inv;		// inverted request opcode bit[7]
wire            fp_op_in_7in;
wire [1:0]	fp_fcc_in;
wire [1:0]	fp_rnd_mode_in;
wire [63:0]	fp_srca_in;
wire		fp_srca_53_0_neq_0;
wire		fp_srca_50_0_neq_0;
wire		fp_srca_53_32_neq_0;
wire		fp_srca_exp_eq_0;
wire		fp_srca_exp_neq_ffs;
wire [68:0]	fp_srcb_in;
wire [68:0]	fp_src1_in;
wire [68:0]	fp_src2_in;
wire [154:0]	inq_din_d1;
wire [154:0]	inq_data;
wire [4:0]	inq_id;
wire [1:0]	inq_rnd_mode;
wire [1:0]	inq_fcc;
wire [7:0]	inq_op;
wire		inq_in1_exp_neq_ffs;
wire		inq_in1_exp_eq_0;
wire		inq_in1_53_0_neq_0;
wire		inq_in1_50_0_neq_0;
wire		inq_in1_53_32_neq_0;
wire [63:0]	inq_in1;
wire		inq_in2_exp_neq_ffs;
wire		inq_in2_exp_eq_0;
wire		inq_in2_53_0_neq_0;
wire		inq_in2_50_0_neq_0;
wire		inq_in2_53_32_neq_0;
wire [63:0]	inq_in2;

wire clk;

wire se_l;

// 6/23/03: Replaced tm_l with se_l 
assign se_l = ~se;

clken_buf  ckbuf_in_dp (
  .clk(clk),
  .rclk(rclk),
  .enb_l(1'b0),
  .tmb_l(se_l)
  );

///////////////////////////////////////////////////////////////////////////////
//
//      Capture input information.
//
///////////////////////////////////////////////////////////////////////////////

dff_s #(5) i_fp_id_in (
	.din	(fpio_data_px2_116_112[116:112]),
	.clk    (clk),
 
        .q      (fp_id_in[4:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);

dff_s #(8) i_fp_op_in (
        .din    (fpio_data_px2_79_72[79:72]),
        .clk    (clk),

        .q      (fp_op_in[7:0]),

        .se     (se),
        .si     (),
        .so     ()
);

assign fp_op_in_7in = fp_op_in[7];
assign fp_op_in_7 = fp_op_in[7];
assign fp_op_in_7_inv = ~fp_op_in[7];

dff_s #(2) i_fp_fcc_in (
        .din    (fpio_data_px2_67_0[67:66]),
        .clk    (clk),

        .q      (fp_fcc_in[1:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);

dff_s #(2) i_fp_rnd_mode_in (
        .din    (fpio_data_px2_67_0[65:64]),
        .clk    (clk),

        .q      (fp_rnd_mode_in[1:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);

dff_s #(64) i_fp_srca_in (
	.din    (fpio_data_px2_67_0[63:0]),
        .clk    (clk),

        .q      (fp_srca_in[63:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);

assign fp_srca_53_0_neq_0= (|fp_srca_in[53:0]);

assign fp_srca_50_0_neq_0= (|fp_srca_in[50:0]);

assign fp_srca_53_32_neq_0= (|fp_srca_in[53:32]);

assign fp_srca_exp_eq_0= (!((|fp_srca_in[62:55])
		|| (fp_op_in[1] && (|fp_srca_in[54:52]))));

assign fp_srca_exp_neq_ffs= (!((&fp_srca_in[62:55])
		&& (fp_op_in[0] || (&fp_srca_in[54:52]))));


///////////////////////////////////////////////////////////////////////////////
//
//	Extract the two operands.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(69) i_fp_srcb_in (
	.din	({fp_srca_exp_neq_ffs, fp_srca_exp_eq_0, fp_srca_53_0_neq_0,
			fp_srca_50_0_neq_0, fp_srca_53_32_neq_0,
			fp_srca_in[63:0]}),
        .en     (fp_data_rdy),
	.clk    (clk),

        .q      (fp_srcb_in[68:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);

assign fp_src1_in[68:0]= ({69{fp_op_in_7_inv}}
			    & {fp_srca_exp_neq_ffs, fp_srca_exp_eq_0,
				fp_srca_53_0_neq_0, fp_srca_50_0_neq_0,
				fp_srca_53_32_neq_0, fp_srca_in[63:0]})
		| ({69{fp_op_in_7}}
			    & 69'h180000000000000000);

assign fp_src2_in[68:0]= ({69{fp_op_in_7_inv}}
			    & fp_srcb_in[68:0])
		| ({69{fp_op_in_7}}
			    & {fp_srca_exp_neq_ffs, fp_srca_exp_eq_0,
				fp_srca_53_0_neq_0, fp_srca_50_0_neq_0,
				fp_srca_53_32_neq_0, fp_srca_in[63:0]});


///////////////////////////////////////////////////////////////////////////////
//
//	Input queue FIFO bypass and output.
//
///////////////////////////////////////////////////////////////////////////////

dff_s #(155) i_inq_din_d1 (
	.din	({fp_id_in[4:0], fp_rnd_mode_in[1:0], fp_fcc_in[1:0],
                        fp_op_in[7:0], fp_src1_in[68:0], fp_src2_in[68:0]}),
	.clk    (clk),

        .q      (inq_din_d1[154:0]),

        .se     (se),
        .si     (),
        .so     ()
);


assign inq_data[154:0]= ({155{inq_fwrd}}
			    & {fp_id_in[4:0], fp_rnd_mode_in[1:0],
				fp_fcc_in[1:0], fp_op_in[7:0],
				fp_src1_in[68:0], fp_src2_in[68:0]})
		| ({155{inq_fwrd_inv}}
			    & (({155{inq_bp}}
					& inq_din_d1[154:0])
				| ({155{inq_bp_inv}}
					& inq_dout[154:0])));

assign inq_id[4:0]= inq_data[154:150];
assign inq_rnd_mode[1:0]= inq_data[149:148];
assign inq_fcc[1:0]= inq_data[147:146];
assign inq_op[7:0]= inq_data[145:138];
assign inq_in1_exp_neq_ffs= inq_data[137];
assign inq_in1_exp_eq_0= inq_data[136];
assign inq_in1_53_0_neq_0= inq_data[135];
assign inq_in1_50_0_neq_0= inq_data[134];
assign inq_in1_53_32_neq_0= inq_data[133];
assign inq_in1[63:0]= inq_data[132:69];
assign inq_in2_exp_neq_ffs= inq_data[68];
assign inq_in2_exp_eq_0= inq_data[67];
assign inq_in2_53_0_neq_0= inq_data[66];
assign inq_in2_50_0_neq_0= inq_data[65];
assign inq_in2_53_32_neq_0= inq_data[64];
assign inq_in2[63:0]= inq_data[63:0];


endmodule

// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_in2_gt_in1_2b.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//	Two bit comparison of two inputs that can have any value.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_in2_gt_in1_2b (
	din1,
	din2,

	din2_neq_din1,
	din2_gt_din1
);


input [1:0]	din1;			// input 1- 3 bits
input [1:0]	din2;			// input 2- 3 bits

output		din2_neq_din1;		// input 2 doesn't equal input 1
output		din2_gt_din1;		// input 2 is greater than input 1


wire [1:0]	din2_eq_din1;
wire		din2_neq_din1;
wire		din2_gt_din1;


assign din2_eq_din1[1:0]= (~(din1 ^ din2));

assign din2_neq_din1= (!(&din2_eq_din1));

assign din2_gt_din1= ((!din1[1]) && din2[1])
		|| (din2_eq_din1[1] && (!din1[0]) && din2[0]);


endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_in2_gt_in1_3b.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//	Three bit comparison of two inputs that can have any value.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_in2_gt_in1_3b (
	din1,
	din2,

	din2_neq_din1,
	din2_gt_din1
);


input [2:0]	din1;			// input 1- 3 bits
input [2:0]	din2;			// input 2- 3 bits

output		din2_neq_din1;		// input 2 doesn't equal input 1
output		din2_gt_din1;		// input 2 is greater than input 1


wire [2:0]	din2_eq_din1;
wire		din2_neq_din1;
wire		din2_gt_din1;


assign din2_eq_din1[2:0]= (~(din1 ^ din2));

assign din2_neq_din1= (!(&din2_eq_din1));

assign din2_gt_din1= ((!din1[2]) && din2[2])
		|| (din2_eq_din1[2] && (!din1[1]) && din2[1])
		|| ((&din2_eq_din1[2:1]) && (!din1[0]) && din2[0]);


endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_in2_gt_in1_3to1.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//	Reduce three fpu_in2_gt_in1_*b results to one set of results.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_in2_gt_in1_3to1 (
	din2_neq_din1_hi,
	din2_gt_din1_hi,
	din2_neq_din1_mid,
	din2_gt_din1_mid,
	din2_neq_din1_lo,
	din2_gt_din1_lo,

	din2_neq_din1,
	din2_gt_din1
);


input		din2_neq_din1_hi;	// input 2 != input 1- high 3 bits
input		din2_gt_din1_hi;	// input 2 > input 1- high 3 bits
input		din2_neq_din1_mid;	// input 2 != input 1- middle 3 bits
input		din2_gt_din1_mid;	// input 2 > input 1- middle 3 bits
input		din2_neq_din1_lo;	// input 2 != input 1- low 3 bits
input		din2_gt_din1_lo;	// input 2 > input 1- low 3 bits

output		din2_neq_din1;		// input 2 doesn't equal input 1
output		din2_gt_din1;		// input 2 is greater than input 1


wire		din2_neq_din1;
wire		din2_gt_din1;


assign din2_neq_din1= din2_neq_din1_hi || din2_neq_din1_mid || din2_neq_din1_lo;

assign din2_gt_din1= (din2_neq_din1_hi && din2_gt_din1_hi)
		|| ((!din2_neq_din1_hi) && din2_neq_din1_mid
			&& din2_gt_din1_mid)
		|| ((!din2_neq_din1_hi) && (!din2_neq_din1_mid)
			&& din2_gt_din1_lo);


endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_in2_gt_in1_frac.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//	Fraction comparison of two inputs that can have any value.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_in2_gt_in1_frac (
	din1,
	din2,
	sngop,
	expadd11,
	expeq,

	din2_neq_din1,
	din2_gt_din1,
	din2_gt1_din1
);


input [54:0]	din1;			// input 1- fraction
input [54:0]	din2;			// input 2- fraction
input		sngop;			// single precision inputs
input		expadd11;		// exponent sign bit
input		expeq;			// exponent are equal

output		din2_neq_din1;		// input 2 != input 1- fraction
output		din2_gt_din1;		// input 2 > input 1- fraction
output		din2_gt1_din1;		// input 2 > input 1


wire		din2_neq_din1_54_52;
wire		din2_gt_din1_54_52;
wire		din2_neq_din1_51_50;
wire		din2_gt_din1_51_50;
wire		din2_neq_din1_49_48;
wire		din2_gt_din1_49_48;
wire		din2_neq_din1_47_45;
wire		din2_gt_din1_47_45;
wire		din2_neq_din1_44_42;
wire		din2_gt_din1_44_42;
wire		din2_neq_din1_41_39;
wire		din2_gt_din1_41_39;
wire		din2_neq_din1_38_36;
wire		din2_gt_din1_38_36;
wire		din2_neq_din1_35_33;
wire		din2_gt_din1_35_33;
wire		din2_neq_din1_32_30;
wire		din2_gt_din1_32_30;
wire		din2_neq_din1_29_27;
wire		din2_gt_din1_29_27;
wire		din2_neq_din1_26_24;
wire		din2_gt_din1_26_24;
wire		din2_neq_din1_23_21;
wire		din2_gt_din1_23_21;
wire		din2_neq_din1_20_18;
wire		din2_gt_din1_20_18;
wire		din2_neq_din1_17_15;
wire		din2_gt_din1_17_15;
wire		din2_neq_din1_14_12;
wire		din2_gt_din1_14_12;
wire		din2_neq_din1_11_9;
wire		din2_gt_din1_11_9;
wire		din2_neq_din1_8_6;
wire		din2_gt_din1_8_6;
wire		din2_neq_din1_5_3;
wire		din2_gt_din1_5_3;
wire		din2_neq_din1_2_0;
wire		din2_gt_din1_2_0;
wire		din2_neq_din1_51_45;
wire		din2_gt_din1_51_45;
wire		din2_neq_din1_44_36;
wire		din2_gt_din1_44_36;
wire		din2_neq_din1_35_27;
wire		din2_gt_din1_35_27;
wire		din2_neq_din1_26_18;
wire		din2_gt_din1_26_18;
wire		din2_neq_din1_17_9;
wire		din2_gt_din1_17_9;
wire		din2_neq_din1_8_0;
wire		din2_gt_din1_8_0;
wire		din2_neq_din1_51_27;
wire		din2_gt_din1_51_27;
wire		din2_neq_din1_26_0;
wire		din2_gt_din1_26_0;
wire		din2_neq_din1;
wire		din2_gt_din1;
wire		din2_gt1_din1;


fpu_in2_gt_in1_3b fpu_in2_gt_in1_54_52 (
	.din1			(din1[54:52]),
	.din2			(din2[54:52]),

	.din2_neq_din1		(din2_neq_din1_54_52),
	.din2_gt_din1		(din2_gt_din1_54_52)
);

fpu_in2_gt_in1_2b fpu_in2_gt_in1_51_50 (
	.din1			(din1[51:50]),
	.din2			(din2[51:50]),

	.din2_neq_din1		(din2_neq_din1_51_50),
	.din2_gt_din1		(din2_gt_din1_51_50)
);

fpu_in2_gt_in1_2b fpu_in2_gt_in1_49_48 (
        .din1                   (din1[49:48]),
        .din2                   (din2[49:48]),

        .din2_neq_din1          (din2_neq_din1_49_48),
        .din2_gt_din1           (din2_gt_din1_49_48)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_47_45 (
        .din1                   (din1[47:45]),
        .din2                   (din2[47:45]),

        .din2_neq_din1          (din2_neq_din1_47_45),
        .din2_gt_din1           (din2_gt_din1_47_45)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_44_42 (
        .din1                   (din1[44:42]),
        .din2                   (din2[44:42]),

        .din2_neq_din1          (din2_neq_din1_44_42),
        .din2_gt_din1           (din2_gt_din1_44_42)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_41_39 (
        .din1                   (din1[41:39]),
        .din2                   (din2[41:39]),

        .din2_neq_din1          (din2_neq_din1_41_39),
        .din2_gt_din1           (din2_gt_din1_41_39)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_38_36 (
        .din1                   (din1[38:36]),
        .din2                   (din2[38:36]),

        .din2_neq_din1          (din2_neq_din1_38_36),
        .din2_gt_din1           (din2_gt_din1_38_36)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_35_33 (
        .din1                   (din1[35:33]),
        .din2                   (din2[35:33]),

        .din2_neq_din1          (din2_neq_din1_35_33),
        .din2_gt_din1           (din2_gt_din1_35_33)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_32_30 (
        .din1                   (din1[32:30]),
        .din2                   (din2[32:30]),

        .din2_neq_din1          (din2_neq_din1_32_30),
        .din2_gt_din1           (din2_gt_din1_32_30)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_29_27 (
        .din1                   (din1[29:27]),
        .din2                   (din2[29:27]),

        .din2_neq_din1          (din2_neq_din1_29_27),
        .din2_gt_din1           (din2_gt_din1_29_27)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_26_24 (
        .din1                   (din1[26:24]),
        .din2                   (din2[26:24]),

        .din2_neq_din1          (din2_neq_din1_26_24),
        .din2_gt_din1           (din2_gt_din1_26_24)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_23_21 (
        .din1                   (din1[23:21]),
        .din2                   (din2[23:21]),

        .din2_neq_din1          (din2_neq_din1_23_21),
        .din2_gt_din1           (din2_gt_din1_23_21)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_20_18 (
        .din1                   (din1[20:18]),
        .din2                   (din2[20:18]),

        .din2_neq_din1          (din2_neq_din1_20_18),
        .din2_gt_din1           (din2_gt_din1_20_18)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_17_15 (
        .din1                   (din1[17:15]),
        .din2                   (din2[17:15]),

        .din2_neq_din1          (din2_neq_din1_17_15),
        .din2_gt_din1           (din2_gt_din1_17_15)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_14_12 (
        .din1                   (din1[14:12]),
        .din2                   (din2[14:12]),

        .din2_neq_din1          (din2_neq_din1_14_12),
        .din2_gt_din1           (din2_gt_din1_14_12)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_11_9 (
        .din1                   (din1[11:9]),
        .din2                   (din2[11:9]),

        .din2_neq_din1          (din2_neq_din1_11_9),
        .din2_gt_din1           (din2_gt_din1_11_9)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_8_6 (
        .din1                   (din1[8:6]),
        .din2                   (din2[8:6]),

        .din2_neq_din1          (din2_neq_din1_8_6),
        .din2_gt_din1           (din2_gt_din1_8_6)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_5_3 (
        .din1                   (din1[5:3]),
        .din2                   (din2[5:3]),

        .din2_neq_din1          (din2_neq_din1_5_3),
        .din2_gt_din1           (din2_gt_din1_5_3)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_2_0 (
        .din1                   (din1[2:0]),
        .din2                   (din2[2:0]),

        .din2_neq_din1          (din2_neq_din1_2_0),
        .din2_gt_din1           (din2_gt_din1_2_0)
);


fpu_in2_gt_in1_3to1 fpu_in2_gt_in1_51_45 (
	.din2_neq_din1_hi	(din2_neq_din1_51_50),
	.din2_gt_din1_hi	(din2_gt_din1_51_50),
	.din2_neq_din1_mid	(din2_neq_din1_49_48),
	.din2_gt_din1_mid	(din2_gt_din1_49_48),
	.din2_neq_din1_lo	(din2_neq_din1_47_45),
	.din2_gt_din1_lo	(din2_gt_din1_47_45),

	.din2_neq_din1		(din2_neq_din1_51_45),
	.din2_gt_din1		(din2_gt_din1_51_45)
);

fpu_in2_gt_in1_3to1 fpu_in2_gt_in1_44_36 (
        .din2_neq_din1_hi       (din2_neq_din1_44_42),
        .din2_gt_din1_hi        (din2_gt_din1_44_42),
        .din2_neq_din1_mid      (din2_neq_din1_41_39),
        .din2_gt_din1_mid       (din2_gt_din1_41_39),
        .din2_neq_din1_lo       (din2_neq_din1_38_36),
        .din2_gt_din1_lo        (din2_gt_din1_38_36),

        .din2_neq_din1          (din2_neq_din1_44_36),
	.din2_gt_din1           (din2_gt_din1_44_36)
);

fpu_in2_gt_in1_3to1 fpu_in2_gt_in1_35_27 (
        .din2_neq_din1_hi       (din2_neq_din1_35_33),
        .din2_gt_din1_hi        (din2_gt_din1_35_33),
        .din2_neq_din1_mid      (din2_neq_din1_32_30),
        .din2_gt_din1_mid       (din2_gt_din1_32_30),
        .din2_neq_din1_lo       (din2_neq_din1_29_27),
        .din2_gt_din1_lo        (din2_gt_din1_29_27),

        .din2_neq_din1          (din2_neq_din1_35_27),
        .din2_gt_din1           (din2_gt_din1_35_27)
);

fpu_in2_gt_in1_3to1 fpu_in2_gt_in1_26_18 (
        .din2_neq_din1_hi       (din2_neq_din1_26_24),
        .din2_gt_din1_hi        (din2_gt_din1_26_24),
        .din2_neq_din1_mid      (din2_neq_din1_23_21),
        .din2_gt_din1_mid       (din2_gt_din1_23_21),
        .din2_neq_din1_lo       (din2_neq_din1_20_18),
        .din2_gt_din1_lo        (din2_gt_din1_20_18),

        .din2_neq_din1          (din2_neq_din1_26_18),
        .din2_gt_din1           (din2_gt_din1_26_18)
);

fpu_in2_gt_in1_3to1 fpu_in2_gt_in1_17_9 (
        .din2_neq_din1_hi       (din2_neq_din1_17_15),
        .din2_gt_din1_hi        (din2_gt_din1_17_15),
        .din2_neq_din1_mid      (din2_neq_din1_14_12),
        .din2_gt_din1_mid       (din2_gt_din1_14_12),
        .din2_neq_din1_lo       (din2_neq_din1_11_9),
        .din2_gt_din1_lo        (din2_gt_din1_11_9),

        .din2_neq_din1          (din2_neq_din1_17_9),
        .din2_gt_din1           (din2_gt_din1_17_9)
);

fpu_in2_gt_in1_3to1 fpu_in2_gt_in1_8_0 (
        .din2_neq_din1_hi       (din2_neq_din1_8_6),
        .din2_gt_din1_hi        (din2_gt_din1_8_6),
        .din2_neq_din1_mid      (din2_neq_din1_5_3),
        .din2_gt_din1_mid       (din2_gt_din1_5_3),
        .din2_neq_din1_lo       (din2_neq_din1_2_0),
        .din2_gt_din1_lo        (din2_gt_din1_2_0),

        .din2_neq_din1          (din2_neq_din1_8_0),
        .din2_gt_din1           (din2_gt_din1_8_0)
);


fpu_in2_gt_in1_3to1 fpu_in2_gt_in1_51_27 (
	.din2_neq_din1_hi       (din2_neq_din1_51_45),
	.din2_gt_din1_hi	(din2_gt_din1_51_45),
	.din2_neq_din1_mid      (din2_neq_din1_44_36),
	.din2_gt_din1_mid       (din2_gt_din1_44_36),
	.din2_neq_din1_lo       (din2_neq_din1_35_27),
	.din2_gt_din1_lo        (din2_gt_din1_35_27),

	.din2_neq_din1          (din2_neq_din1_51_27),
	.din2_gt_din1           (din2_gt_din1_51_27)
);

fpu_in2_gt_in1_3to1 fpu_in2_gt_in1_26_0 (
	.din2_neq_din1_hi       (din2_neq_din1_26_18),
	.din2_gt_din1_hi        (din2_gt_din1_26_18),
	.din2_neq_din1_mid      (din2_neq_din1_17_9),
	.din2_gt_din1_mid       (din2_gt_din1_17_9),
	.din2_neq_din1_lo       (din2_neq_din1_8_0),
	.din2_gt_din1_lo        (din2_gt_din1_8_0),

	.din2_neq_din1          (din2_neq_din1_26_0),
	.din2_gt_din1           (din2_gt_din1_26_0)
);


assign din2_neq_din1= din2_neq_din1_51_27
		|| din2_neq_din1_26_0
		|| (din2_neq_din1_54_52 && sngop);

assign din2_gt_din1= (din2_neq_din1_54_52 && din2_gt_din1_54_52
			&& sngop)
		|| ((!(din2_neq_din1_54_52 && sngop))
			&& din2_neq_din1_51_27 && din2_gt_din1_51_27)
		|| ((!(din2_neq_din1_54_52 && sngop))
			&& (!din2_neq_din1_51_27)
			&& din2_gt_din1_26_0);

assign din2_gt1_din1= expadd11
		|| (din2_gt_din1 && expeq);


endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_mul.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//	FPU multiply pipe.
//
///////////////////////////////////////////////////////////////////////////////


module fpu_mul (
	inq_op,
	inq_rnd_mode,
	inq_id,
	inq_in1,
	inq_in1_53_0_neq_0,
	inq_in1_50_0_neq_0,
	inq_in1_53_32_neq_0,
	inq_in1_exp_eq_0,
	inq_in1_exp_neq_ffs,
	inq_in2,
	inq_in2_53_0_neq_0,
	inq_in2_50_0_neq_0,
	inq_in2_53_32_neq_0,
	inq_in2_exp_eq_0,
	inq_in2_exp_neq_ffs,
	inq_mul,
	mul_dest_rdy,
	mul_dest_rdya,
	fmul_clken_l,
	fmul_clken_l_buf1,
	arst_l,
	grst_l,
	rclk,
	
	mul_pipe_active,
	m1stg_step,
	m6stg_fmul_in,
	m6stg_id_in,
	mul_exc_out,
	m6stg_fmul_dbl_dst,
	m6stg_fmuls,
	mul_sign_out,
	mul_exp_out,
	mul_frac_out,

	se_mul,
	se_mul64,
	si,
	so
);


input [7:0]	inq_op;			// request opcode to op pipes
input [1:0]	inq_rnd_mode;		// request rounding mode to op pipes
input [4:0]	inq_id;			// request ID to the operation pipes
input [63:0]	inq_in1;		// request operand 1 to op pipes
input		inq_in1_53_0_neq_0;	// request operand 1[53:0]!=0
input		inq_in1_50_0_neq_0;	// request operand 1[50:0]!=0
input		inq_in1_53_32_neq_0;	// request operand 1[53:32]!=0
input		inq_in1_exp_eq_0;	// request operand 1 exp==0
input		inq_in1_exp_neq_ffs;	// request operand 1 exp!=0xff's
input [63:0]	inq_in2;		// request operand 2 to op pipes
input		inq_in2_53_0_neq_0;	// request operand 2[53:0]!=0
input		inq_in2_50_0_neq_0;	// request operand 2[50:0]!=0
input		inq_in2_53_32_neq_0;	// request operand 2[53:32]!=0
input		inq_in2_exp_eq_0;	// request operand 2 exp==0
input		inq_in2_exp_neq_ffs;	// request operand 2 exp!=0xff's
input		inq_mul;		// multiply pipe request
input		mul_dest_rdy;		// multiply result req accepted for CPX
input		mul_dest_rdya;		// multiply result req accepted for CPX
input		fmul_clken_l;           // fmul clock enable for mul_frac_dp
input		fmul_clken_l_buf1;           // fmul clock enable for mul_exp_dp
input		arst_l;			// global asynch. reset- asserted low
input		grst_l;			// global synch. reset- asserted low
input		rclk;			// global clock

output		mul_pipe_active;        // mul pipe is executing a valid instr
output		m1stg_step;		// multiply pipe load
output		m6stg_fmul_in;		// mul pipe output request next cycle
output [9:0]	m6stg_id_in;		// mul pipe output ID next cycle
output [4:0]	mul_exc_out;		// multiply pipe result- exception flags
output		m6stg_fmul_dbl_dst;	// double precision multiply result
output		m6stg_fmuls;		// fmuls- multiply 6 stage
output		mul_sign_out;		// multiply sign output
output [10:0]	mul_exp_out;		// multiply exponent output
output [51:0]	mul_frac_out;		// multiply fraction output

input           se_mul;     // scan_enable for mul_frac_dp, mul_ctl, mul_exp_dp
input           se_mul64;       // scan_enable for mul64
input           si;                     // scan in
output          so;                     // scan out


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_mul_ctl.
//
///////////////////////////////////////////////////////////////////////////////

wire		m1stg_snan_sng_in1;	// operand 1 is single signalling NaN
wire		m1stg_snan_dbl_in1;	// operand 1 is double signalling NaN
wire		m1stg_snan_sng_in2;	// operand 2 is single signalling NaN
wire		m1stg_snan_dbl_in2;	// operand 2 is double signalling NaN
wire		m1stg_step;		// multiply pipe load
wire		m1stg_sngop;		// single precision operation- mul 1 stg
wire		m1stg_dblop;		// double precision operation- mul 1 stg
wire		m1stg_dblop_inv;	// single or int operation- mul 1 stg
wire		m1stg_fmul;		// multiply operation- mul 1 stage
wire		m1stg_fsmuld;		// fsmuld- multiply 1 stage
wire		m2stg_fmuls;		// fmuls- multiply 2 stage
wire		m2stg_fmuld;		// fmuld- multiply 2 stage
wire		m2stg_fsmuld;		// fsmuld- multiply 2 stage
wire		m5stg_fmuls;		// fmuls- multiply 5 stage
wire		m5stg_fmuld;		// fmuld- multiply 5 stage
wire		m5stg_fmulda;		// fmuld- multiply 5 stage copy
wire		m6stg_fmul_in;		// mul pipe output request next cycle
wire [9:0]	m6stg_id_in;		// mul pipe output ID next cycle
wire		m6stg_fmul_dbl_dst;	// double precision multiply result
wire		m6stg_fmuls;		// fmuls- multiply 6 stage
wire		m6stg_step;		// advance the multiply pipe
wire		mul_sign_out;		// multiply sign output
wire		m5stg_in_of;		// multiply overflow- select exp out
wire [4:0]	mul_exc_out;		// multiply pipe result- exception flags
wire		m2stg_frac1_dbl_norm;	// select line to m2stg_frac1
wire		m2stg_frac1_dbl_dnrm;	// select line to m2stg_frac1
wire		m2stg_frac1_sng_norm;	// select line to m2stg_frac1
wire		m2stg_frac1_sng_dnrm;	// select line to m2stg_frac1
wire		m2stg_frac1_inf;	// select line to m2stg_frac1
wire		m2stg_frac2_dbl_norm;	// select line to m2stg_frac2
wire		m2stg_frac2_dbl_dnrm;	// select line to m2stg_frac2
wire		m2stg_frac2_sng_norm;	// select line to m2stg_frac2
wire		m2stg_frac2_sng_dnrm;	// select line to m2stg_frac2
wire		m2stg_frac2_inf;	// select line to m2stg_frac2
wire		m1stg_inf_zero_in;	// 1 operand is infinity; other is 0
wire		m1stg_inf_zero_in_dbl;	// 1 opnd is infinity; other is 0- dbl
wire		m2stg_exp_expadd;	// select line to m2stg_exp
wire		m2stg_exp_0bff;		// select line to m2stg_exp
wire		m2stg_exp_017f;		// select line to m2stg_exp
wire		m2stg_exp_04ff;		// select line to m2stg_exp
wire		m2stg_exp_zero;		// select line to m2stg_exp
wire [6:0]	m3bstg_ld0_inv;		// leading 0's in multiply operands
wire [5:0]	m4stg_sh_cnt_in;	// multiply normalization shift count
wire            m4stg_inc_exp_54;       // select line to m5stg_exp
wire            m4stg_inc_exp_55;       // select line to m5stg_exp
wire            m4stg_inc_exp_105;      // select line to m5stg_exp
wire		m4stg_left_shift_step;	// select line to m5stg_frac
wire		m4stg_right_shift_step;	// select line to m5stg_frac
wire		m5stg_to_0;		// result to max finite on overflow
wire		m5stg_to_0_inv;		// result to infinity on overflow
wire		mul_frac_out_fracadd;	// select line to mul_frac_out
wire		mul_frac_out_frac;	// select line to mul_frac_out
wire		mul_exp_out_exp_plus1;	// select line to mul_exp_out
wire		mul_exp_out_exp;	// select line to mul_exp_out
wire		mul_pipe_active;        // mul pipe is executing a valid instr

// 3/14/03: output of dffrl_async is an input to mul64
wire mul_rst_l; // reset (active low) signal for mul64


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_mul_exp_dp.
//
///////////////////////////////////////////////////////////////////////////////

wire [12:0]	m3stg_exp;		// exponent input- multiply 3 stage
wire		m3stg_expadd_eq_0;	// mul stage 3 exponent adder sum == 0
wire		m3stg_expadd_lte_0_inv;	// mul stage 3 exponent adder sum <= 0
wire [12:0]	m4stg_exp;		// exponent input- multiply 4 stage
wire [12:0]	m5stg_exp;		// exponent input- multiply 5 stage
wire [10:0]	mul_exp_out;		// multiply exponent output


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_mul_frac_dp.
//
///////////////////////////////////////////////////////////////////////////////

wire [52:0]	m2stg_frac1_array_in;	// multiply array input 1
wire [52:0]	m2stg_frac2_array_in;	// multiply array input 2
wire [5:0]	m1stg_ld0_1;		// denorm operand 1 leading 0's
wire [5:0]	m1stg_ld0_2;		// denorm operand 2 leading 0's
wire		m4stg_frac_105;		// multiply stage 4a fraction input[105]
wire [6:0]	m3stg_ld0_inv;		// leading 0's in multiply operands
wire		m4stg_shl_54;		// multiply shift left output bit[54]
wire		m4stg_shl_55;		// multiply shift left output bit[55]
wire [32:0]	m5stg_frac_32_0;	// multiply stage 5 fraction input
wire		m5stg_frac_dbl_nx;	// double precision inexact result
wire		m5stg_frac_sng_nx;	// single precision inexact result
wire		m5stg_frac_neq_0;	// fraction input to mul 5 stage != 0
wire		m5stg_fracadd_cout;	// fraction rounding adder carry out
wire [51:0]	mul_frac_out;		// multiply fraction output


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of mul64
//
///////////////////////////////////////////////////////////////////////////////

wire [105:0]	m4stg_frac;		// multiply array output
wire [29:0] m4stg_frac_unused; // unused upper 30 bits (135:106) of the mul64 output

//Previously missing wires
wire        scan_out_fpu_mul_ctl;
wire        scan_out_fpu_mul_exp_dp;
wire        scan_out_fpu_mul_frac_dp;

///////////////////////////////////////////////////////////////////////////////
//
//	Instantiations.
//
///////////////////////////////////////////////////////////////////////////////

fpu_mul_ctl fpu_mul_ctl (
	.inq_in1_51			(inq_in1[51]),
	.inq_in1_54			(inq_in1[54]),
	.inq_in1_53_0_neq_0		(inq_in1_53_0_neq_0),
	.inq_in1_50_0_neq_0		(inq_in1_50_0_neq_0),
	.inq_in1_53_32_neq_0		(inq_in1_53_32_neq_0),
	.inq_in1_exp_eq_0		(inq_in1_exp_eq_0),
	.inq_in1_exp_neq_ffs		(inq_in1_exp_neq_ffs),
	.inq_in2_51			(inq_in2[51]),
	.inq_in2_54			(inq_in2[54]),
	.inq_in2_53_0_neq_0		(inq_in2_53_0_neq_0),
	.inq_in2_50_0_neq_0		(inq_in2_50_0_neq_0),
	.inq_in2_53_32_neq_0		(inq_in2_53_32_neq_0),
	.inq_in2_exp_eq_0		(inq_in2_exp_eq_0),
	.inq_in2_exp_neq_ffs		(inq_in2_exp_neq_ffs),
	.inq_op				(inq_op[7:0]),
	.inq_mul			(inq_mul),
	.inq_rnd_mode			(inq_rnd_mode[1:0]),
	.inq_id				(inq_id[4:0]),
	.inq_in1_63			(inq_in1[63]),
	.inq_in2_63			(inq_in2[63]),
	.mul_dest_rdy			(mul_dest_rdy),
	.mul_dest_rdya			(mul_dest_rdya),
	.m5stg_exp			(m5stg_exp[12:0]),
	.m5stg_fracadd_cout		(m5stg_fracadd_cout),
	.m5stg_frac_neq_0		(m5stg_frac_neq_0),
	.m5stg_frac_dbl_nx		(m5stg_frac_dbl_nx),
	.m5stg_frac_sng_nx		(m5stg_frac_sng_nx),
	.m1stg_ld0_1			(m1stg_ld0_1[5:0]),
	.m1stg_ld0_2			(m1stg_ld0_2[5:0]),
	.m3stg_exp			(m3stg_exp[12:0]),
	.m3stg_expadd_eq_0		(m3stg_expadd_eq_0),
	.m3stg_expadd_lte_0_inv		(m3stg_expadd_lte_0_inv),
	.m3stg_ld0_inv			(m3stg_ld0_inv[5:0]),
	.m4stg_exp			(m4stg_exp[12:0]),
	.m4stg_frac_105			(m4stg_frac_105),
	.m5stg_frac			(m5stg_frac_32_0[32:0]),
	.arst_l				(arst_l),
	.grst_l				(grst_l),
	.mula_rst_l    (mul_rst_l),
	.rclk			(rclk),

	.mul_pipe_active                (mul_pipe_active),
	.m1stg_snan_sng_in1		(m1stg_snan_sng_in1),
	.m1stg_snan_dbl_in1		(m1stg_snan_dbl_in1),
	.m1stg_snan_sng_in2		(m1stg_snan_sng_in2),
	.m1stg_snan_dbl_in2		(m1stg_snan_dbl_in2),
	.m1stg_step			(m1stg_step),
	.m1stg_sngop			(m1stg_sngop),
	.m1stg_dblop			(m1stg_dblop),
	.m1stg_dblop_inv		(m1stg_dblop_inv),
	.m1stg_fmul			(m1stg_fmul),
	.m1stg_fsmuld			(m1stg_fsmuld),
	.m2stg_fmuls			(m2stg_fmuls),
	.m2stg_fmuld			(m2stg_fmuld),
	.m2stg_fsmuld			(m2stg_fsmuld),
	.m5stg_fmuls			(m5stg_fmuls),
	.m5stg_fmuld			(m5stg_fmuld),
	.m5stg_fmulda			(m5stg_fmulda),
	.m6stg_fmul_in			(m6stg_fmul_in),
	.m6stg_id_in			(m6stg_id_in[9:0]),
	.m6stg_fmul_dbl_dst		(m6stg_fmul_dbl_dst),
	.m6stg_fmuls			(m6stg_fmuls),
	.m6stg_step			(m6stg_step),
	.mul_sign_out			(mul_sign_out),
	.m5stg_in_of			(m5stg_in_of),
	.mul_exc_out			(mul_exc_out[4:0]),
	.m2stg_frac1_dbl_norm		(m2stg_frac1_dbl_norm),
	.m2stg_frac1_dbl_dnrm		(m2stg_frac1_dbl_dnrm),
	.m2stg_frac1_sng_norm		(m2stg_frac1_sng_norm),
	.m2stg_frac1_sng_dnrm		(m2stg_frac1_sng_dnrm),
	.m2stg_frac1_inf		(m2stg_frac1_inf),
	.m2stg_frac2_dbl_norm		(m2stg_frac2_dbl_norm),
	.m2stg_frac2_dbl_dnrm		(m2stg_frac2_dbl_dnrm),
	.m2stg_frac2_sng_norm		(m2stg_frac2_sng_norm),
	.m2stg_frac2_sng_dnrm		(m2stg_frac2_sng_dnrm),
	.m2stg_frac2_inf		(m2stg_frac2_inf),
	.m1stg_inf_zero_in		(m1stg_inf_zero_in),
	.m1stg_inf_zero_in_dbl		(m1stg_inf_zero_in_dbl),
	.m2stg_exp_expadd		(m2stg_exp_expadd),
	.m2stg_exp_0bff			(m2stg_exp_0bff),
	.m2stg_exp_017f			(m2stg_exp_017f),
	.m2stg_exp_04ff			(m2stg_exp_04ff),
	.m2stg_exp_zero			(m2stg_exp_zero),
	.m3bstg_ld0_inv			(m3bstg_ld0_inv[6:0]),
	.m4stg_sh_cnt_in		(m4stg_sh_cnt_in[5:0]),
	.m4stg_inc_exp_54		(m4stg_inc_exp_54),
	.m4stg_inc_exp_55		(m4stg_inc_exp_55),
	.m4stg_inc_exp_105		(m4stg_inc_exp_105),
	.m4stg_left_shift_step		(m4stg_left_shift_step),
	.m4stg_right_shift_step		(m4stg_right_shift_step),
	.m5stg_to_0			(m5stg_to_0),
	.m5stg_to_0_inv			(m5stg_to_0_inv),
	.mul_frac_out_fracadd		(mul_frac_out_fracadd),
	.mul_frac_out_frac		(mul_frac_out_frac),
	.mul_exp_out_exp_plus1		(mul_exp_out_exp_plus1),
	.mul_exp_out_exp		(mul_exp_out_exp),

	.se                             (se_mul),
        .si                             (si),
        .so                             (scan_out_fpu_mul_ctl)
);


fpu_mul_exp_dp fpu_mul_exp_dp (
	.inq_in1			(inq_in1[62:52]),
	.inq_in2			(inq_in2[62:52]),
	.m6stg_step			(m6stg_step),
	.m1stg_dblop			(m1stg_dblop),
	.m1stg_sngop			(m1stg_sngop),
	.m2stg_exp_expadd		(m2stg_exp_expadd),
	.m2stg_exp_0bff			(m2stg_exp_0bff),
	.m2stg_exp_017f			(m2stg_exp_017f),
	.m2stg_exp_04ff			(m2stg_exp_04ff),
	.m2stg_exp_zero			(m2stg_exp_zero),
	.m1stg_fsmuld			(m1stg_fsmuld),
	.m2stg_fmuld			(m2stg_fmuld),
	.m2stg_fmuls			(m2stg_fmuls),
	.m2stg_fsmuld			(m2stg_fsmuld),
	.m3stg_ld0_inv			(m3stg_ld0_inv[6:0]),
	.m4stg_inc_exp_54		(m4stg_inc_exp_54),
	.m4stg_inc_exp_55		(m4stg_inc_exp_55),
	.m4stg_inc_exp_105		(m4stg_inc_exp_105),
	.m5stg_fracadd_cout		(m5stg_fracadd_cout),
	.mul_exp_out_exp_plus1		(mul_exp_out_exp_plus1),
	.mul_exp_out_exp		(mul_exp_out_exp),
	.m5stg_in_of			(m5stg_in_of),
	.m5stg_fmuld			(m5stg_fmuld),
	.m5stg_to_0_inv			(m5stg_to_0_inv),
	.m4stg_shl_54			(m4stg_shl_54),
	.m4stg_shl_55			(m4stg_shl_55),
	.fmul_clken_l			(fmul_clken_l_buf1),
	.rclk			(rclk),

	.m3stg_exp			(m3stg_exp[12:0]),
	.m3stg_expadd_eq_0		(m3stg_expadd_eq_0),
	.m3stg_expadd_lte_0_inv		(m3stg_expadd_lte_0_inv),
	.m4stg_exp			(m4stg_exp[12:0]),
	.m5stg_exp			(m5stg_exp[12:0]),
	.mul_exp_out			(mul_exp_out[10:0]),

	.se                             (se_mul),
        .si                             (scan_out_fpu_mul_ctl),
        .so                             (scan_out_fpu_mul_exp_dp)
);


fpu_mul_frac_dp fpu_mul_frac_dp (
	.inq_in1			(inq_in1[54:0]),
	.inq_in2			(inq_in2[54:0]),
	.m6stg_step			(m6stg_step),
	.m2stg_frac1_dbl_norm		(m2stg_frac1_dbl_norm),
	.m2stg_frac1_dbl_dnrm		(m2stg_frac1_dbl_dnrm),
	.m2stg_frac1_sng_norm		(m2stg_frac1_sng_norm),
	.m2stg_frac1_sng_dnrm		(m2stg_frac1_sng_dnrm),
	.m2stg_frac1_inf		(m2stg_frac1_inf),
	.m1stg_snan_dbl_in1		(m1stg_snan_dbl_in1),
	.m1stg_snan_sng_in1		(m1stg_snan_sng_in1),
	.m2stg_frac2_dbl_norm		(m2stg_frac2_dbl_norm),
	.m2stg_frac2_dbl_dnrm		(m2stg_frac2_dbl_dnrm),
	.m2stg_frac2_sng_norm		(m2stg_frac2_sng_norm),
	.m2stg_frac2_sng_dnrm		(m2stg_frac2_sng_dnrm),
	.m2stg_frac2_inf		(m2stg_frac2_inf),
	.m1stg_snan_dbl_in2		(m1stg_snan_dbl_in2),
	.m1stg_snan_sng_in2		(m1stg_snan_sng_in2),
	.m1stg_inf_zero_in		(m1stg_inf_zero_in),
	.m1stg_inf_zero_in_dbl		(m1stg_inf_zero_in_dbl),
	.m1stg_dblop			(m1stg_dblop),
	.m1stg_dblop_inv		(m1stg_dblop_inv),
	.m4stg_frac			(m4stg_frac),
	.m4stg_sh_cnt_in		(m4stg_sh_cnt_in[5:0]),
	.m3bstg_ld0_inv			(m3bstg_ld0_inv[6:0]),
	.m4stg_left_shift_step		(m4stg_left_shift_step),
	.m4stg_right_shift_step		(m4stg_right_shift_step),
	.m5stg_fmuls			(m5stg_fmuls),
	.m5stg_fmulda			(m5stg_fmulda),
	.mul_frac_out_fracadd		(mul_frac_out_fracadd),
	.mul_frac_out_frac		(mul_frac_out_frac),
	.m5stg_in_of			(m5stg_in_of),
	.m5stg_to_0			(m5stg_to_0),
	.fmul_clken_l			(fmul_clken_l),
	.rclk			(rclk),

	.m2stg_frac1_array_in		(m2stg_frac1_array_in),
	.m2stg_frac2_array_in		(m2stg_frac2_array_in),
	.m1stg_ld0_1			(m1stg_ld0_1),
	.m1stg_ld0_2			(m1stg_ld0_2),
	.m4stg_frac_105			(m4stg_frac_105),
	.m3stg_ld0_inv			(m3stg_ld0_inv[6:0]),
	.m4stg_shl_54			(m4stg_shl_54),
	.m4stg_shl_55			(m4stg_shl_55),
	.m5stg_frac_32_0		(m5stg_frac_32_0[32:0]),
	.m5stg_frac_dbl_nx		(m5stg_frac_dbl_nx),
	.m5stg_frac_sng_nx		(m5stg_frac_sng_nx),
	.m5stg_frac_neq_0		(m5stg_frac_neq_0),
	.m5stg_fracadd_cout		(m5stg_fracadd_cout),
	.mul_frac_out			(mul_frac_out[51:0]),

	.se                             (se_mul),
        .si                             (scan_out_fpu_mul_exp_dp),
        .so                             (scan_out_fpu_mul_frac_dp)
);


// 3/14/03: Promoted mul64 to unit level. Got rid of fpu_mul_array. Same representation for RTL and gates. Also, now agreed that mul64 will not have dffrl_async inside, so the staged signal mul_rst_l is sent from fpu_mul_ctl. mul64 port step has been renamed to mul_step to avoid conflicts with DEF keyword STEP in some backend flows (WARP).
mul64 i_m4stg_frac (
	.rs1_l ({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1,
		1'b1, 1'b1, 1'b1, m2stg_frac1_array_in[52:0]}),
	.rs2 ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, m2stg_frac2_array_in[52:0]}),
	.valid(m1stg_fmul),
	.areg ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0}),
	.accreg ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
	.x2 (1'b0),
	.rclk (rclk),
	.si (scan_out_fpu_mul_frac_dp),
	.se (se_mul64),
	.mul_rst_l (mul_rst_l),
	.mul_step (m6stg_step),
	.so (so),
	.out ({m4stg_frac_unused[29:0], m4stg_frac[105:0]})
);

endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_mul_ctl.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//	Multiply pipeline synthesizable logic
//              - special input cases
//              - opcode pipeline
//              - sign logic
//              - exception logic
//              - datapath control- select lines and control logic
//
///////////////////////////////////////////////////////////////////////////////


module fpu_mul_ctl (
	inq_in1_51,
	inq_in1_54,
	inq_in1_53_0_neq_0,
	inq_in1_50_0_neq_0,
	inq_in1_53_32_neq_0,
	inq_in1_exp_eq_0,
	inq_in1_exp_neq_ffs,
	inq_in2_51,
	inq_in2_54,
	inq_in2_53_0_neq_0,
	inq_in2_50_0_neq_0,
	inq_in2_53_32_neq_0,
	inq_in2_exp_eq_0,
	inq_in2_exp_neq_ffs,
	inq_op,
	inq_mul,
	inq_rnd_mode,
	inq_id,
	inq_in1_63,
	inq_in2_63,
	mul_dest_rdy,
	mul_dest_rdya,
	m5stg_exp,
	m5stg_fracadd_cout,
	m5stg_frac_neq_0,
	m5stg_frac_dbl_nx,
	m5stg_frac_sng_nx,
	m1stg_ld0_1,
	m1stg_ld0_2,
	m3stg_exp,
	m3stg_expadd_eq_0,
	m3stg_expadd_lte_0_inv,
	m3stg_ld0_inv,
	m4stg_exp,
	m4stg_frac_105,
	m5stg_frac,
	arst_l,
	grst_l,
	rclk,

	mul_pipe_active,
	m1stg_snan_sng_in1,
	m1stg_snan_dbl_in1,
	m1stg_snan_sng_in2,
	m1stg_snan_dbl_in2,
	m1stg_step,
	m1stg_sngop,
	m1stg_dblop,
	m1stg_dblop_inv,
	m1stg_fmul,
	m1stg_fsmuld,
	m2stg_fmuls,
	m2stg_fmuld,
	m2stg_fsmuld,
	m5stg_fmuls,
	m5stg_fmuld,
	m5stg_fmulda,
	m6stg_fmul_in,
	m6stg_id_in,
	m6stg_fmul_dbl_dst,
	m6stg_fmuls,
	m6stg_step,
	mul_sign_out,
	m5stg_in_of,
	mul_exc_out,
	m2stg_frac1_dbl_norm,
	m2stg_frac1_dbl_dnrm,
	m2stg_frac1_sng_norm,
	m2stg_frac1_sng_dnrm,
	m2stg_frac1_inf,
	m2stg_frac2_dbl_norm,
	m2stg_frac2_dbl_dnrm,
	m2stg_frac2_sng_norm,
	m2stg_frac2_sng_dnrm,
	m2stg_frac2_inf,
	m1stg_inf_zero_in,
	m1stg_inf_zero_in_dbl,
	m2stg_exp_expadd,
	m2stg_exp_0bff,
	m2stg_exp_017f,
	m2stg_exp_04ff,
	m2stg_exp_zero,
	m3bstg_ld0_inv,
	m4stg_sh_cnt_in,
	m4stg_inc_exp_54,
	m4stg_inc_exp_55,
	m4stg_inc_exp_105,
	m4stg_left_shift_step,
	m4stg_right_shift_step,
	m5stg_to_0,
	m5stg_to_0_inv,
	mul_frac_out_fracadd,
	mul_frac_out_frac,
	mul_exp_out_exp_plus1,
	mul_exp_out_exp,
	mula_rst_l,

	se,
	si,
	so
);


parameter
		FMULS=  8'h49,
		FMULD=	8'h4a,
		FSMULD=	8'h69;


input		inq_in1_51;		// request operand 1[51]
input		inq_in1_54;		// request operand 1[54]
input		inq_in1_53_0_neq_0;	// request operand 1[53:0]!=0
input		inq_in1_50_0_neq_0;	// request operand 1[50:0]!=0
input		inq_in1_53_32_neq_0;	// request operand 1[53:32]!=0
input		inq_in1_exp_eq_0;	// request operand 1[62:52]==0
input		inq_in1_exp_neq_ffs;	// request operand 1[62:52]!=0x7ff
input		inq_in2_51;		// request operand 2[51]
input		inq_in2_54;		// request operand 2[54]
input		inq_in2_53_0_neq_0;	// request operand 2[53:0]!=0
input		inq_in2_50_0_neq_0;	// request operand 2[50:0]!=0
input		inq_in2_53_32_neq_0;	// request operand 2[53:32]!=0
input		inq_in2_exp_eq_0;	// request operand 2[62:52]==0
input		inq_in2_exp_neq_ffs;	// request operand 2[62:52]!=0x7ff
input [7:0]	inq_op;			// request opcode to op pipes
input		inq_mul;		// multiply pipe request
input [1:0]	inq_rnd_mode;		// request rounding mode to op pipes
input [4:0]	inq_id;			// request ID to the operation pipes
input		inq_in1_63;		// request[63] operand 1 to op pipes
input		inq_in2_63;		// request[63] operand 2 to op pipes
input		mul_dest_rdy;		// multiply result req accepted for CPX
input		mul_dest_rdya;		// multiply result req accepted for CPX
input [12:0]	m5stg_exp;		// exponent input- multiply 5 stage
input		m5stg_fracadd_cout;	// fraction rounding adder carry out
input		m5stg_frac_neq_0;	// fraction input to mul 5 stage != 0
input		m5stg_frac_dbl_nx;	// double precision inexact result
input		m5stg_frac_sng_nx;	// single precision inexact result
input [5:0]	m1stg_ld0_1;		// denorm operand 1 leading 0's
input [5:0]	m1stg_ld0_2;		// denorm operand 2 leading 0's
input [12:0]	m3stg_exp;		// exponent input- multiply 3 stage
input		m3stg_expadd_eq_0;	// mul stage 3 exponent adder sum == 0
input		m3stg_expadd_lte_0_inv;	// mul stage 3 exponent adder sum <= 0
input [5:0]	m3stg_ld0_inv;		// leading 0's in multiply operands
input [12:0]	m4stg_exp;		// exponent input- multiply 4 stage
input		m4stg_frac_105;	// multiply stage 4a fraction input[105]
input [32:0]	m5stg_frac;		// multiply stage 5 fraction input
input		arst_l;			// asynchronous global reset- asserted low
input		grst_l;			// synchronous global reset- asserted low
input		rclk;		// global clock

output		mul_pipe_active;        // mul pipe is executing a valid instr
output		m1stg_snan_sng_in1;	// operand 1 is single signalling NaN
output		m1stg_snan_dbl_in1;	// operand 1 is double signalling NaN
output		m1stg_snan_sng_in2;	// operand 2 is single signalling NaN
output		m1stg_snan_dbl_in2;	// operand 2 is double signalling NaN
output		m1stg_step;		// multiply pipe load
output		m1stg_sngop;		// single precision operation- mul 1 stg
output		m1stg_dblop;		// double precision operation- mul 1 stg
output		m1stg_dblop_inv;	// single or int operation- mul 1 stg
output		m1stg_fmul;		// multiply operation- mul 1 stage
output		m1stg_fsmuld;		// fsmuld- multiply 1 stage
output		m2stg_fmuls;		// fmuls- multiply 2 stage
output		m2stg_fmuld;		// fmuld- multiply 2 stage
output		m2stg_fsmuld;		// fsmuld- multiply 2 stage
output		m5stg_fmuls;		// fmuls- multiply 5 stage
output		m5stg_fmuld;		// fmuld- multiply 5 stage
output		m5stg_fmulda;		// fmuld- multiply 5 stage copy
output		m6stg_fmul_in;		// mul pipe output request next cycle
output [9:0]	m6stg_id_in;		// mul pipe output ID next cycle
output		m6stg_fmul_dbl_dst;	// double precision multiply result
output		m6stg_fmuls;		// fmuls- multiply 6 stage
output		m6stg_step;		// advance the multiply pipe
output		mul_sign_out;		// multiply sign output
output		m5stg_in_of;		// multiply overflow- select exp out
output [4:0]	mul_exc_out;		// multiply pipe result- exception flags
output		m2stg_frac1_dbl_norm;	// select line to m2stg_frac1
output		m2stg_frac1_dbl_dnrm;	// select line to m2stg_frac1
output		m2stg_frac1_sng_norm;	// select line to m2stg_frac1
output		m2stg_frac1_sng_dnrm;	// select line to m2stg_frac1
output		m2stg_frac1_inf;	// select line to m2stg_frac1
output		m2stg_frac2_dbl_norm;	// select line to m2stg_frac2
output		m2stg_frac2_dbl_dnrm;	// select line to m2stg_frac2
output		m2stg_frac2_sng_norm;	// select line to m2stg_frac2
output		m2stg_frac2_sng_dnrm;	// select line to m2stg_frac2
output		m2stg_frac2_inf;	// select line to m2stg_frac2
output		m1stg_inf_zero_in;	// 1 operand is infinity; other is 0
output		m1stg_inf_zero_in_dbl;	// 1 opnd is infinity; other is 0- dbl
output		m2stg_exp_expadd;	// select line to m2stg_exp
output		m2stg_exp_0bff;		// select line to m2stg_exp
output		m2stg_exp_017f;		// select line to m2stg_exp
output		m2stg_exp_04ff;		// select line to m2stg_exp
output		m2stg_exp_zero;		// select line to m2stg_exp
output [6:0]	m3bstg_ld0_inv;		// leading 0's in multiply operands
output [5:0]	m4stg_sh_cnt_in;	// multiply normalization shift count
output          m4stg_inc_exp_54;       // select line to m5stg_exp
output          m4stg_inc_exp_55;       // select line to m5stg_exp
output          m4stg_inc_exp_105;      // select line to m5stg_exp
output		m4stg_left_shift_step;	// select line to m5stg_frac
output		m4stg_right_shift_step;	// select line to m5stg_frac
output		m5stg_to_0;		// result to max finite on overflow
output		m5stg_to_0_inv;		// result to infinity on overflow
output		mul_frac_out_fracadd;	// select line to mul_frac_out
output		mul_frac_out_frac;	// select line to mul_frac_out
output		mul_exp_out_exp_plus1;	// select line to mul_exp_out
output		mul_exp_out_exp;	// select line to mul_exp_out
output    mula_rst_l; // reset for mul64

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


wire		reset;
wire		mul_frac_in1_51;
wire		mul_frac_in1_54;
wire		mul_frac_in1_53_0_neq_0;
wire		mul_frac_in1_50_0_neq_0;
wire		mul_frac_in1_53_32_neq_0;
wire		mul_exp_in1_exp_eq_0;
wire		mul_exp_in1_exp_neq_ffs;
wire		mul_frac_in2_51;
wire		mul_frac_in2_54;
wire		mul_frac_in2_53_0_neq_0;
wire		mul_frac_in2_50_0_neq_0;
wire		mul_frac_in2_53_32_neq_0;
wire		mul_exp_in2_exp_eq_0;
wire		mul_exp_in2_exp_neq_ffs;
wire		m1stg_denorm_sng_in1;
wire		m1stg_denorm_dbl_in1;
wire		m1stg_denorm_sng_in2;
wire		m1stg_denorm_dbl_in2;
wire		m1stg_denorm_in1;
wire		m1stg_denorm_in2;
wire		m1stg_norm_sng_in1;
wire		m1stg_norm_dbl_in1;
wire		m1stg_norm_sng_in2;
wire		m1stg_norm_dbl_in2;
wire		m1stg_snan_sng_in1;
wire		m1stg_snan_dbl_in1;
wire		m1stg_snan_sng_in2;
wire		m1stg_snan_dbl_in2;
wire		m1stg_qnan_sng_in1;
wire		m1stg_qnan_dbl_in1;
wire		m1stg_qnan_sng_in2;
wire		m1stg_qnan_dbl_in2;
wire		m1stg_snan_in1;
wire		m1stg_snan_in2;
wire		m1stg_qnan_in1;
wire		m1stg_qnan_in2;
wire		m2stg_snan_in1;
wire		m2stg_snan_in2;
wire		m2stg_qnan_in1;
wire		m2stg_qnan_in2;
wire		m1stg_nan_sng_in1;
wire		m1stg_nan_dbl_in1;
wire		m1stg_nan_sng_in2;
wire		m1stg_nan_dbl_in2;
wire		m1stg_nan_in1;
wire		m1stg_nan_in2;
wire		m2stg_nan_in2;
wire		m1stg_inf_sng_in1;
wire		m1stg_inf_dbl_in1;
wire		m1stg_inf_sng_in2;
wire		m1stg_inf_dbl_in2;
wire		m1stg_inf_in1;
wire		m1stg_inf_in2;
wire		m1stg_inf_in;
wire		m2stg_inf_in1;
wire		m2stg_inf_in2;
wire		m2stg_inf_in;
wire		m1stg_infnan_sng_in1;
wire		m1stg_infnan_dbl_in1;
wire		m1stg_infnan_sng_in2;
wire		m1stg_infnan_dbl_in2;
wire		m1stg_infnan_in1;
wire		m1stg_infnan_in2;
wire		m1stg_infnan_in;
wire		m1stg_zero_in1;
wire		m1stg_zero_in2;
wire		m1stg_zero_in;
wire		m2stg_zero_in1;
wire		m2stg_zero_in2;
wire		m2stg_zero_in;
wire		m1stg_step;
wire [7:0]	m1stg_op_in;
wire [7:0]	m1stg_op;
wire		m1stg_mul_in;
wire		m1stg_mul;
wire		m1stg_sngop;
wire [3:0]	m1stg_sngopa;
wire		m1stg_dblop;
wire [3:0]	m1stg_dblopa;
wire		m1stg_dblop_inv_in;
wire		m1stg_dblop_inv;
wire [1:0]	m1stg_rnd_mode;
wire [4:0]	m1stg_id;
wire		m1stg_fmul;
wire		m1stg_fmul_dbl_dst;
wire		m1stg_fmuls;
wire		m1stg_fmuld;
wire		m1stg_fsmuld;
wire [4:0]	m1stg_opdec;
wire [4:0]	m2stg_opdec;
wire [1:0]	m2stg_rnd_mode;
wire [4:0]	m2stg_id;
wire		m2stg_fmul;
wire		m2stg_fmuls;
wire		m2stg_fmuld;
wire		m2stg_fsmuld;
wire [4:1]	m3astg_opdec;
wire [1:0]	m3astg_rnd_mode;
wire [4:0]	m3astg_id;
wire [4:1]	m3bstg_opdec;
wire [1:0]	m3bstg_rnd_mode;
wire [4:0]	m3bstg_id;
wire [4:1]	m3stg_opdec;
wire [1:0]	m3stg_rnd_mode;
wire [4:0]	m3stg_id;
wire		m3stg_fmul;
wire [4:1]	m4stg_opdec;
wire [1:0]	m4stg_rnd_mode;
wire [4:0]	m4stg_id;
wire		m4stg_fmul;
wire		m4stg_fmuld;
wire [4:1]	m5stg_opdec;
wire [1:0]	m5stg_rnd_mode;
wire [4:0]	m5stg_id;
wire		m5stg_fmul;
wire		m5stg_fmuls;
wire		m5stg_fmuld;
wire		m5stg_fmulda;
wire		m6stg_fmul_in;
wire [4:2]	m6stg_opdec;
wire [9:0]	m6stg_id_in;
wire [9:0]	m6stg_id;
wire		m6stg_fmul;
wire		m6stg_fmul_dbl_dst;
wire		m6stg_fmuls;
wire		m6stg_hold;
wire		m6stg_holda;
wire		m6stg_step;
wire		m6stg_stepa;
wire		m1stg_sign1;
wire		m1stg_sign2;
wire		m2stg_sign1;
wire		m2stg_sign2;
wire		m1stg_of_mask;
wire		m2stg_of_mask;
wire		m2stg_sign;
wire		m3astg_sign;
wire		m2stg_nv;
wire		m3astg_nv;
wire		m3astg_of_mask;
wire		m3bstg_sign;
wire		m3bstg_nv;
wire		m3stg_sign;
wire		m3stg_nv;
wire		m3stg_of_mask;
wire		m4stg_sign;
wire		m4stg_nv;
wire		m4stg_of_mask;
wire		m5stg_sign;
wire		m5stg_nv;
wire		m5stg_of_mask;
wire		mul_sign_out;
wire		mul_nv_out;
wire		m5stg_in_of;
wire		mul_of_out_tmp1_in;
wire		mul_of_out_tmp1;
wire		mul_of_out_tmp2;
wire		mul_of_out_cout;
wire		mul_of_out;
wire		mul_uf_out_in;
wire		mul_uf_out;
wire		mul_nx_out_in;
wire		mul_nx_out;
wire [4:0]	mul_exc_out;
wire		m2stg_frac1_dbl_norm;
wire		m2stg_frac1_dbl_dnrm;
wire		m2stg_frac1_sng_norm;
wire		m2stg_frac1_sng_dnrm;
wire		m2stg_frac1_inf;
wire		m2stg_frac2_dbl_norm;
wire		m2stg_frac2_dbl_dnrm;
wire		m2stg_frac2_sng_norm;
wire		m2stg_frac2_sng_dnrm;
wire		m2stg_frac2_inf;
wire		m1stg_inf_zero_in;
wire		m1stg_inf_zero_in_dbl;
wire [5:0]	m2stg_ld0_1_in;
wire [5:0]	m2stg_ld0_1;
wire [5:0]	m2stg_ld0_2_in;
wire [5:0]	m2stg_ld0_2;
wire		m2stg_exp_expadd;
wire		m2stg_exp_0bff;
wire		m2stg_exp_017f;
wire		m2stg_exp_04ff;
wire		m2stg_exp_zero;
wire [6:0]	m2stg_ld0;
wire [6:0]	m2stg_ld0_inv;
wire [6:0]	m3astg_ld0_inv;
wire [6:0]	m3bstg_ld0_inv;
wire		m4stg_expadd_eq_0;
wire		m3stg_exp_lte_0;
wire		m4stg_right_shift_in;
wire		m4stg_right_shift;
wire [5:0]	m3stg_exp_minus1;
wire [5:0]	m3stg_exp_inv_plus2;
wire		m3stg_exp_lt_neg57;
wire [5:0]	m4stg_sh_cnt_in;
wire		m4stg_left_shift_step;
wire		m4stg_right_shift_step;
wire		m4stg_inc_exp_54;
wire		m4stg_inc_exp_55;
wire		m4stg_inc_exp_105;
wire		m5stg_rndup;
wire		m5stg_to_0;
wire		m5stg_to_0_inv;
wire		mul_frac_out_fracadd;
wire		mul_frac_out_frac;
wire		mul_exp_out_exp_plus1;
wire		mul_exp_out_exp;
wire		mul_pipe_active_in;
wire		mul_pipe_active;
wire    mula_rst_l;

//Previously missing wires
wire        mul_ctl_rst_l;
wire        m3bstf_of_mask;

dffrl_async #(1)  dffrl_mul_ctl (
  .din  (grst_l),
  .clk  (rclk),
  .rst_l(arst_l),
  .q    (mul_ctl_rst_l),
	.se (se),
	.si (),
	.so ()
  );

assign reset= (!mul_ctl_rst_l);

// 3/14/03 reset signal for mul64
assign mula_rst_l = mul_ctl_rst_l;


///////////////////////////////////////////////////////////////////////////////
//
//	Multiply pipeline special input cases.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(1) i_mul_frac_in1_51 (
	.din	(inq_in1_51),
	.en     (m6stg_step),
        .clk    (rclk),
 
        .q      (mul_frac_in1_51),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_mul_frac_in1_54 (
	.din	(inq_in1_54),
	.en     (m6stg_step),
        .clk    (rclk),
 
        .q      (mul_frac_in1_54),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_mul_frac_in1_53_0_neq_0 (
	.din	(inq_in1_53_0_neq_0),
	.en     (m6stg_step),
        .clk    (rclk),
 
        .q      (mul_frac_in1_53_0_neq_0),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_mul_frac_in1_50_0_neq_0 (
	.din	(inq_in1_50_0_neq_0),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(mul_frac_in1_50_0_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_mul_frac_in1_53_32_neq_0 (
	.din	(inq_in1_53_32_neq_0),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(mul_frac_in1_53_32_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_mul_exp_in1_exp_eq_0 (
        .din	(inq_in1_exp_eq_0),
        .en	(m6stg_step),
        .clk	(rclk),
 
        .q	(mul_exp_in1_exp_eq_0),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(1) i_mul_exp_in1_exp_neq_ffs (
	.din	(inq_in1_exp_neq_ffs),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(mul_exp_in1_exp_neq_ffs),

   	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_mul_frac_in2_51 (
	.din	(inq_in2_51),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(mul_frac_in2_51),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_mul_frac_in2_54 (
	.din	(inq_in2_54),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(mul_frac_in2_54),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_mul_frac_in2_53_0_neq_0 (
	.din	(inq_in2_53_0_neq_0),
	.en  	(m6stg_step),
	.clk	(rclk),

	.q	(mul_frac_in2_53_0_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_mul_frac_in2_50_0_neq_0 (
	.din	(inq_in2_50_0_neq_0),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(mul_frac_in2_50_0_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_mul_frac_in2_53_32_neq_0 (
	.din	(inq_in2_53_32_neq_0),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(mul_frac_in2_53_32_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_mul_exp_in2_exp_eq_0 (
	.din	(inq_in2_exp_eq_0),
	 .en	(m6stg_step),
	.clk	(rclk),

	.q	(mul_exp_in2_exp_eq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_mul_exp_in2_exp_neq_ffs (
        .din	(inq_in2_exp_neq_ffs),
        .en	(m6stg_step),
        .clk	(rclk),
 
        .q	(mul_exp_in2_exp_neq_ffs),
 
        .se	(se),
        .si	(),
        .so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Denorm multiply inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign m1stg_denorm_sng_in1= mul_exp_in1_exp_eq_0 && m1stg_sngopa[0];

assign m1stg_denorm_dbl_in1= mul_exp_in1_exp_eq_0 && m1stg_dblopa[0];

assign m1stg_denorm_sng_in2= mul_exp_in2_exp_eq_0 && m1stg_sngopa[0];

assign m1stg_denorm_dbl_in2= mul_exp_in2_exp_eq_0 && m1stg_dblopa[0];

assign m1stg_denorm_in1= m1stg_denorm_sng_in1 || m1stg_denorm_dbl_in1;

assign m1stg_denorm_in2= m1stg_denorm_sng_in2 || m1stg_denorm_dbl_in2;


///////////////////////////////////////////////////////////////////////////////
//
//	Non-denorm multiply inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign m1stg_norm_sng_in1= (!mul_exp_in1_exp_eq_0) && m1stg_sngopa[0];

assign m1stg_norm_dbl_in1= (!mul_exp_in1_exp_eq_0) && m1stg_dblopa[0];

assign m1stg_norm_sng_in2= (!mul_exp_in2_exp_eq_0) && m1stg_sngopa[0];

assign m1stg_norm_dbl_in2= (!mul_exp_in2_exp_eq_0) && m1stg_dblopa[0];


///////////////////////////////////////////////////////////////////////////////
//
//	Nan multiply inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign m1stg_snan_sng_in1= (!mul_exp_in1_exp_neq_ffs) && (!mul_frac_in1_54)
		&& (mul_frac_in1_53_32_neq_0) && m1stg_sngopa[1];

assign m1stg_snan_dbl_in1= (!mul_exp_in1_exp_neq_ffs)
		&& (!mul_frac_in1_51) && mul_frac_in1_50_0_neq_0
		&& m1stg_dblopa[1];

assign m1stg_snan_sng_in2= (!mul_exp_in2_exp_neq_ffs) && (!mul_frac_in2_54)
                && (mul_frac_in2_53_32_neq_0) && m1stg_sngopa[1];

assign m1stg_snan_dbl_in2= (!mul_exp_in2_exp_neq_ffs)
                && (!mul_frac_in2_51) && mul_frac_in2_50_0_neq_0
                && m1stg_dblopa[1];

assign m1stg_qnan_sng_in1= (!mul_exp_in1_exp_neq_ffs) && mul_frac_in1_54
		&& m1stg_sngopa[1];

assign m1stg_qnan_dbl_in1= (!mul_exp_in1_exp_neq_ffs) && mul_frac_in1_51
		&& m1stg_dblopa[1];

assign m1stg_qnan_sng_in2= (!mul_exp_in2_exp_neq_ffs) && mul_frac_in2_54
                && m1stg_sngopa[1];

assign m1stg_qnan_dbl_in2= (!mul_exp_in2_exp_neq_ffs) && mul_frac_in2_51
                && m1stg_dblopa[1];

assign m1stg_snan_in1= m1stg_snan_sng_in1 || m1stg_snan_dbl_in1;

assign m1stg_snan_in2= m1stg_snan_sng_in2 || m1stg_snan_dbl_in2;

assign m1stg_qnan_in1= m1stg_qnan_sng_in1 || m1stg_qnan_dbl_in1;
 
assign m1stg_qnan_in2= m1stg_qnan_sng_in2 || m1stg_qnan_dbl_in2;

dffe_s #(1) i_m2stg_snan_in1 (
	.din	(m1stg_snan_in1),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(m2stg_snan_in1),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_m2stg_snan_in2 (
	.din	(m1stg_snan_in2),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(m2stg_snan_in2),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_m2stg_qnan_in1 (
	.din	(m1stg_qnan_in1),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(m2stg_qnan_in1),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_m2stg_qnan_in2 (
	.din	(m1stg_qnan_in2),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(m2stg_qnan_in2),

	.se	(se),
	.si	(),
	.so	()
);

assign m1stg_nan_sng_in1= (!mul_exp_in1_exp_neq_ffs)
		&& (mul_frac_in1_54 || mul_frac_in1_53_32_neq_0)
		&& m1stg_sngopa[2];

assign m1stg_nan_dbl_in1= (!mul_exp_in1_exp_neq_ffs)
		&& (mul_frac_in1_51 || mul_frac_in1_50_0_neq_0)
		&& m1stg_dblopa[2];

assign m1stg_nan_sng_in2= (!mul_exp_in2_exp_neq_ffs)
		&& (mul_frac_in2_54 || mul_frac_in2_53_32_neq_0)
		&& m1stg_sngopa[2];

assign m1stg_nan_dbl_in2= (!mul_exp_in2_exp_neq_ffs)
		&& (mul_frac_in2_51 || mul_frac_in2_50_0_neq_0)
		&& m1stg_dblopa[2];

assign m1stg_nan_in1= m1stg_nan_sng_in1 || m1stg_nan_dbl_in1;

assign m1stg_nan_in2= m1stg_nan_sng_in2 || m1stg_nan_dbl_in2;

dffe_s #(1) i_m2stg_nan_in2 (
	.din	(m1stg_nan_in2),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(m2stg_nan_in2),

	.se	(se),
	.si	(),
	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Infinity multiply inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign m1stg_inf_sng_in1= (!mul_exp_in1_exp_neq_ffs)
		&& (!mul_frac_in1_54) && (!mul_frac_in1_53_32_neq_0)
		&& m1stg_sngopa[2];

assign m1stg_inf_dbl_in1= (!mul_exp_in1_exp_neq_ffs)
		&& (!mul_frac_in1_51) && (!mul_frac_in1_50_0_neq_0)
		&& m1stg_dblopa[2];

assign m1stg_inf_sng_in2= (!mul_exp_in2_exp_neq_ffs)
		&& (!mul_frac_in2_54) && (!mul_frac_in2_53_32_neq_0)
		&& m1stg_sngopa[2];

assign m1stg_inf_dbl_in2= (!mul_exp_in2_exp_neq_ffs)
		&& (!mul_frac_in2_51) && (!mul_frac_in2_50_0_neq_0)
		&& m1stg_dblopa[2];

assign m1stg_inf_in1= m1stg_inf_sng_in1 || m1stg_inf_dbl_in1;

assign m1stg_inf_in2= m1stg_inf_sng_in2 || m1stg_inf_dbl_in2;

assign m1stg_inf_in= m1stg_inf_in1 || m1stg_inf_in2;

dffe_s #(1) i_m2stg_inf_in1 (
	.din	(m1stg_inf_in1),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(m2stg_inf_in1),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_m2stg_inf_in2 (
	.din	(m1stg_inf_in2),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(m2stg_inf_in2),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(1) i_m2stg_inf_in (
	.din	(m1stg_inf_in),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(m2stg_inf_in),
 
        .se	(se),
        .si	(),
        .so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Infinity/Nan multiply inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign m1stg_infnan_sng_in1= (!mul_exp_in1_exp_neq_ffs) && m1stg_sngopa[3];

assign m1stg_infnan_dbl_in1= (!mul_exp_in1_exp_neq_ffs) && m1stg_dblopa[3];

assign m1stg_infnan_sng_in2= (!mul_exp_in2_exp_neq_ffs) && m1stg_sngopa[3];

assign m1stg_infnan_dbl_in2= (!mul_exp_in2_exp_neq_ffs) && m1stg_dblopa[3];

assign m1stg_infnan_in1= m1stg_infnan_sng_in1 || m1stg_infnan_dbl_in1;

assign m1stg_infnan_in2= m1stg_infnan_sng_in2 || m1stg_infnan_dbl_in2;

assign m1stg_infnan_in= m1stg_infnan_in1 || m1stg_infnan_in2;


///////////////////////////////////////////////////////////////////////////////
//
//	Zero multiply inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign m1stg_zero_in1= mul_exp_in1_exp_eq_0
		&& (!mul_frac_in1_53_0_neq_0) && (!mul_frac_in1_54);

assign m1stg_zero_in2= mul_exp_in2_exp_eq_0
                && (!mul_frac_in2_53_0_neq_0) && (!mul_frac_in2_54);

assign m1stg_zero_in= m1stg_zero_in1 || m1stg_zero_in2;

dffe_s #(1) i_m2stg_zero_in1 (
	.din	(m1stg_zero_in1),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(m2stg_zero_in1),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_m2stg_zero_in2 (
	.din	(m1stg_zero_in2),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(m2stg_zero_in2),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_m2stg_zero_in (
	.din	(m1stg_zero_in),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(m2stg_zero_in),
 
        .se	(se),
        .si	(),
        .so	()
);
 

///////////////////////////////////////////////////////////////////////////////
//
//	Floating point multiply control pipeline.
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- multiply input stage.
//
///////////////////////////////////////////////////////////////////////////////

assign m1stg_step= m6stg_stepa && (!m1stg_mul);

assign m1stg_op_in[7:0]= ({8{(m1stg_step && (!reset))}}
			    & (inq_op[7:0] & {8{inq_mul}}))
		| ({8{((!m6stg_step) && (!reset))}}
			    & m1stg_op[7:0]);

dff_s #(8) i_m1stg_op (
	.din	(m1stg_op_in[7:0]),
	.clk	(rclk),

	.q	(m1stg_op[7:0]),

	.se	(se),
	.si	(),
	.so	()
);

assign m1stg_mul_in= (m1stg_step && (!reset) && inq_mul)
		|| ((!m6stg_step) && (!reset) && m1stg_mul);

dff_s #(1) i_m1stg_mul (
        .din    (m1stg_mul_in),
	.clk    (rclk),
 
        .q      (m1stg_mul),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_m1stg_sngop (
	.din	(inq_op[0]),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(m1stg_sngop),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(4) i_m1stg_sngopa (
	.din	({4{inq_op[0]}}),
	.en	(m6stg_step),
        .clk	(rclk),
 
        .q	(m1stg_sngopa[3:0]),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(1) i_m1stg_dblop (
        .din    (inq_op[1]),
        .en     (m6stg_step),
        .clk    (rclk),
 
        .q      (m1stg_dblop),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(4) i_m1stg_dblopa (
	.din	({4{inq_op[1]}}),
	.en	(m6stg_step),
	.clk	(rclk),

	 .q	(m1stg_dblopa[3:0]),

	.se	(se),
	.si	(),
	.so	()
);

assign m1stg_dblop_inv_in= (!inq_op[1]);

dffe_s #(1) i_m1stg_dblop_inv (
        .din	(m1stg_dblop_inv_in),
        .en	(m6stg_step),
        .clk	(rclk),
 
        .q	(m1stg_dblop_inv),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(2) i_m1stg_rnd_mode (
	.din	(inq_rnd_mode[1:0]),
	.en	(m6stg_step),
	.clk    (rclk),

        .q      (m1stg_rnd_mode[1:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(5) i_m1stg_id (
	.din	(inq_id[4:0]),
	.en     (m6stg_step),
        .clk    (rclk),
 
        .q      (m1stg_id[4:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Opcode decode- multiply stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign m1stg_fmul= (m1stg_op[7:0]==FMULS) || (m1stg_op[7:0]==FMULD)
		|| (m1stg_op[7:0]==FSMULD);

assign m1stg_fmul_dbl_dst= (m1stg_op[7:0]==FMULD) || (m1stg_op[7:0]==FSMULD);

assign m1stg_fmuls= (m1stg_op[7:0]==FMULS);

assign m1stg_fmuld= (m1stg_op[7:0]==FMULD);

assign m1stg_fsmuld= (m1stg_op[7:0]==FSMULD);

assign m1stg_opdec[4:0]= {m1stg_fmul,
			m1stg_fmul_dbl_dst,
			m1stg_fmuls,
			m1stg_fmuld,
			m1stg_fsmuld};

dffre_s #(5) i_m2stg_opdec (
	.din	(m1stg_opdec[4:0]),
	.en	(m6stg_step),
	.rst	(reset),
	.clk	(rclk),

	.q	(m2stg_opdec[4:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(2) i_m2stg_rnd_mode (
        .din    (m1stg_rnd_mode[1:0]),
        .en     (m6stg_step),
        .clk    (rclk),
 
        .q      (m2stg_rnd_mode[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);
 
dffe_s #(5) i_m2stg_id (
        .din    (m1stg_id[4:0]),
        .en     (m6stg_step),
        .clk    (rclk),
 
        .q      (m2stg_id[4:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Opcode pipeline- multiply stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign m2stg_fmul= m2stg_opdec[4];
assign m2stg_fmuls= m2stg_opdec[2];
assign m2stg_fmuld= m2stg_opdec[1];
assign m2stg_fsmuld= m2stg_opdec[0];

dffre_s #(4) i_m3astg_opdec (
        .din    (m2stg_opdec[4:1]),
        .en     (m6stg_step),
        .rst    (reset),
        .clk    (rclk),

        .q      (m3astg_opdec[4:1]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(2) i_m3astg_rnd_mode (
        .din    (m2stg_rnd_mode[1:0]),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3astg_rnd_mode[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(5) i_m3astg_id (
        .din    (m2stg_id[4:0]),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3astg_id[4:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- multiply stage 3a.
//
///////////////////////////////////////////////////////////////////////////////

dffre_s #(4) i_m3bstg_opdec (
        .din    (m3astg_opdec[4:1]),
        .en     (m6stg_step),
        .rst    (reset),
        .clk    (rclk),

        .q      (m3bstg_opdec[4:1]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(2) i_m3bstg_rnd_mode (
        .din    (m3astg_rnd_mode[1:0]),
        .en     (m6stg_step),
        .clk    (rclk),
 
        .q      (m3bstg_rnd_mode[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(5) i_m3bstg_id (
        .din    (m3astg_id[4:0]),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3bstg_id[4:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- multiply stage 3b.
//
///////////////////////////////////////////////////////////////////////////////

dffre_s #(4) i_m3stg_opdec (
        .din    (m3bstg_opdec[4:1]),
        .en     (m6stg_step),
        .rst    (reset),
        .clk    (rclk),

        .q      (m3stg_opdec[4:1]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(2) i_m3stg_rnd_mode (
        .din    (m3bstg_rnd_mode[1:0]),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3stg_rnd_mode[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(5) i_m3stg_id (
        .din    (m3bstg_id[4:0]),
        .en     (m6stg_step),
        .clk    (rclk),
 
        .q      (m3stg_id[4:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- multiply stage 3.
//
///////////////////////////////////////////////////////////////////////////////

assign m3stg_fmul= m3stg_opdec[4];

dffre_s #(4) i_m4stg_opdec (
        .din    (m3stg_opdec[4:1]),
        .en     (m6stg_step),
        .rst    (reset),
        .clk    (rclk),

        .q      (m4stg_opdec[4:1]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(2) i_m4stg_rnd_mode (
        .din    (m3stg_rnd_mode[1:0]),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m4stg_rnd_mode[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(5) i_m4stg_id (
        .din    (m3stg_id[4:0]),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m4stg_id[4:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- multiply stage 4.
//
///////////////////////////////////////////////////////////////////////////////

assign m4stg_fmul= m4stg_opdec[4];
assign m4stg_fmuld= m4stg_opdec[1];

dffre_s #(4) i_m5stg_opdec (
        .din    (m4stg_opdec[4:1]),
        .en     (m6stg_step),
        .rst    (reset),
        .clk    (rclk),

        .q      (m5stg_opdec[4:1]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(2) i_m5stg_rnd_mode (
        .din    (m4stg_rnd_mode[1:0]),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m5stg_rnd_mode[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(5) i_m5stg_id (
        .din    (m4stg_id[4:0]),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m5stg_id[4:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffre_s #(1) i_m5stg_fmulda (
	.din	(m4stg_fmuld),
	.en	(m6stg_step),
	.rst	(reset),
	.clk	(rclk),

  	.q	(m5stg_fmulda),

	.se	(se),
	.si	(),
	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- multiply stage 5.
//
///////////////////////////////////////////////////////////////////////////////

assign m5stg_fmul= m5stg_opdec[4];
assign m5stg_fmuls= m5stg_opdec[2];
assign m5stg_fmuld= m5stg_opdec[1];

assign m6stg_fmul_in= (m6stg_stepa && (!reset)
			&& m5stg_fmul)
		|| ((!m6stg_stepa) && (!reset)
			&& m6stg_fmul);

dffre_s #(3) i_m6stg_opdec (
        .din    (m5stg_opdec[4:2]),
        .en     (m6stg_step),
        .rst    (reset),
        .clk    (rclk),

        .q      (m6stg_opdec[4:2]),

        .se     (se),
        .si     (),
        .so     ()
);

assign m6stg_id_in[9:0]= ({10{m6stg_stepa}}
			    & {(m5stg_id[4:2]==3'o7),
				(m5stg_id[4:2]==3'o6),
				(m5stg_id[4:2]==3'o5),
				(m5stg_id[4:2]==3'o4),
				(m5stg_id[4:2]==3'o3),
				(m5stg_id[4:2]==3'o2),
				(m5stg_id[4:2]==3'o1),
				(m5stg_id[4:2]==3'o0),
				m5stg_id[1:0]})
		| ({10{(!m6stg_stepa)}}
			    & m6stg_id[9:0]);

dffe_s #(10) i_m6stg_id (
        .din    (m6stg_id_in[9:0]),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m6stg_id[9:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- multiply pipeline output.
//
///////////////////////////////////////////////////////////////////////////////

assign m6stg_fmul= m6stg_opdec[4];
assign m6stg_fmul_dbl_dst= m6stg_opdec[3];
assign m6stg_fmuls= m6stg_opdec[2];

assign m6stg_hold= m6stg_fmul && (!mul_dest_rdy);
assign m6stg_holda= m6stg_fmul && (!mul_dest_rdya);

assign m6stg_step= (!m6stg_hold);
assign m6stg_stepa= (!m6stg_holda);

// Austin update
// Power management update

assign mul_pipe_active_in =  // mul pipe is executing a valid instr
   m1stg_fmul || m2stg_fmul || m3astg_opdec[4] || m3bstg_opdec[4] ||
   m3stg_fmul || m4stg_fmul || m5stg_fmul      || m6stg_fmul;

dffre_s #(1) i_mul_pipe_active (
	.din	(mul_pipe_active_in),
	.en     (1'b1),
        .rst    (reset),
        .clk    (rclk),

        .q      (mul_pipe_active),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Multiply sign and exception logic.
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
//
//	Multiply sign inputs.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(1) i_m1stg_sign1 (
        .din    (inq_in1_63),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m1stg_sign1),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_m1stg_sign2 (
        .din    (inq_in2_63),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m1stg_sign2),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply sign and exceptions.
//
//	Multiply stage 1.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(1) i_m2stg_sign1 (
        .din	(m1stg_sign1),
        .en	(m6stg_step),
        .clk	(rclk),
 
        .q	(m2stg_sign1),
 
        .se	(se),
        .si	(),
        .so	()
);
 
dffe_s #(1) i_m2stg_sign2 (
        .din	(m1stg_sign2),
        .en	(m6stg_step),
        .clk	(rclk),
 
        .q	(m2stg_sign2),
 
        .se	(se),
        .si	(),
        .so	()
);

assign m1stg_of_mask= (!m1stg_infnan_in);

dffe_s #(1) i_m2stg_of_mask (
        .din    (m1stg_of_mask),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m2stg_of_mask),
 
        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply sign and exceptions.
//
//      Multiply stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign m2stg_sign= ((m2stg_sign1
				&& (!m2stg_snan_in2)
				&& (!(m2stg_qnan_in2 && (!m2stg_snan_in1))))
			^ (m2stg_sign2
				&& (!(m2stg_snan_in1 && (!m2stg_snan_in2)))
				&& (!(m2stg_qnan_in1 && (!m2stg_nan_in2)))))
		&& (!(m2stg_inf_in && m2stg_zero_in));

dffe_s #(1) i_m3astg_sign (
        .din    (m2stg_sign),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3astg_sign),

        .se     (se),
        .si     (),
        .so     ()
);

assign m2stg_nv= m2stg_snan_in1
		|| m2stg_snan_in2
		|| (m2stg_zero_in1 && m2stg_inf_in2)
		|| (m2stg_inf_in1 && m2stg_zero_in2);

dffe_s #(1) i_m3astg_nv (
        .din    (m2stg_nv),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3astg_nv),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_m3astg_of_mask (
        .din    (m2stg_of_mask),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3astg_of_mask),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply sign and exceptions.
//
//      Multiply stage 3a.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(1) i_m3bstg_sign (
        .din    (m3astg_sign),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3bstg_sign),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_m3bstg_nv (
        .din    (m3astg_nv),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3bstg_nv),

        .se     (se),
        .si     (),
        .so     ()
);

wire m3bstg_of_mask;
dffe_s #(1) i_m3bstg_of_mask (
        .din    (m3astg_of_mask),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3bstg_of_mask),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply sign and exceptions.
//
//      Multiply stage 3b.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(1) i_m3stg_sign (
        .din    (m3bstg_sign),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3stg_sign),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_m3stg_nv (
        .din    (m3bstg_nv),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3stg_nv),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_m3stg_of_mask (
        .din    (m3bstg_of_mask),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3stg_of_mask),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply sign and exceptions.
//
//      Multiply stage 3.
//
///////////////////////////////////////////////////////////////////////////////
 
dffe_s #(1) i_m4stg_sign (
        .din    (m3stg_sign),
        .en     (m6stg_step),
        .clk    (rclk),
 
        .q      (m4stg_sign),
 
        .se     (se),
        .si     (),
        .so     ()
);
 
dffe_s #(1) i_m4stg_nv (
        .din    (m3stg_nv),
        .en     (m6stg_step),
        .clk    (rclk),
 
        .q      (m4stg_nv),
 
        .se     (se),
        .si     (),
        .so     ()
);
 
dffe_s #(1) i_m4stg_of_mask (
        .din    (m3stg_of_mask),
        .en     (m6stg_step),
        .clk    (rclk),
 
        .q      (m4stg_of_mask),
 
        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply sign and exceptions.
//
//      Multiply stage 4.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(1) i_m5stg_sign (
        .din    (m4stg_sign),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m5stg_sign),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_m5stg_nv (
        .din    (m4stg_nv),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m5stg_nv),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_m5stg_of_mask (
        .din    (m4stg_of_mask),
        .en     (m6stg_step),
        .clk    (rclk),
 
        .q      (m5stg_of_mask),
 
        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply sign and exceptions.
//
//      Multiply stage 5.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(1) i_mul_sign_out (
	.din	(m5stg_sign),
	.en     (m6stg_step),
        .clk    (rclk),

        .q      (mul_sign_out),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_mul_nv_out (
	.din	(m5stg_nv),
	.en     (m6stg_step),
        .clk    (rclk),

        .q      (mul_nv_out),

	.se     (se),
        .si     (),
        .so     ()
);

assign m5stg_in_of= ((!m5stg_exp[12])
                        && m5stg_fmuld
                        && (m5stg_exp[11] || (&m5stg_exp[10:0]))
                        && m5stg_of_mask)
                || ((!m5stg_exp[12])
                        && m5stg_fmuls
                        && ((|m5stg_exp[11:8]) || (&m5stg_exp[7:0]))
                        && m5stg_of_mask);

assign mul_of_out_tmp1_in= ((!m5stg_exp[12])
                        && m5stg_fmuld
                        && (&m5stg_exp[10:1])
                        && m5stg_rndup
                        && m5stg_of_mask)
                || ((!m5stg_exp[12])
                        && m5stg_fmuls
                        && (&m5stg_exp[7:1])
                        && m5stg_rndup
                        && m5stg_of_mask);

dffe_s #(1) i_mul_of_out_tmp1 (
        .din    (mul_of_out_tmp1_in),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (mul_of_out_tmp1),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_mul_of_out_tmp2 (
	.din	(m5stg_in_of),
	.en	(m6stg_step),
    	.clk	(rclk),

	.q	(mul_of_out_tmp2),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_mul_of_out_cout (
	.din	(m5stg_fracadd_cout),
	.en	(m6stg_step),
    	.clk	(rclk),

	.q	(mul_of_out_cout),

	.se	(se),
	.si	(),
	.so	()
);

assign mul_of_out= mul_of_out_tmp2
		|| (mul_of_out_tmp1 && mul_of_out_cout);

assign mul_uf_out_in= (m5stg_exp[12] || (!(|m5stg_exp[11:0])))
		&& m5stg_frac_neq_0;

dffe_s #(1) i_mul_uf_out (
        .din    (mul_uf_out_in),
        .en     (m6stg_step),
        .clk    (rclk),
 
        .q      (mul_uf_out),
 
        .se     (se),
        .si     (),
        .so     ()
);

assign mul_nx_out_in= (m5stg_fmuld && m5stg_frac_dbl_nx)
		|| (m5stg_fmuls && m5stg_frac_sng_nx);

dffe_s #(1) i_mul_nx_out (
        .din    (mul_nx_out_in),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (mul_nx_out),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Multiply exception output.
//
///////////////////////////////////////////////////////////////////////////////

// Austin update
// Overflow is always accompanied by inexact.
// Previously this was handled within the FFU.

// assign mul_exc_out[4:0]= {mul_nv_out, mul_of_out, mul_uf_out, 1'b0, mul_nx_out};

assign mul_exc_out[4:0] =
  {mul_nv_out,
   mul_of_out,
   mul_uf_out,
   1'b0,
   (mul_nx_out || mul_of_out)};  // Overflow is always accompanied by inexact


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply pipeline control logic.
//
///////////////////////////////////////////////////////////////////////////////
 
///////////////////////////////////////////////////////////////////////////////
//
//      Select lines- multiply normalization and special input injection.
//
//	Multiply stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign m2stg_frac1_dbl_norm= m1stg_norm_dbl_in1
		&& ((!(m1stg_infnan_dbl_in1 || m1stg_infnan_dbl_in2))
			|| (m1stg_snan_dbl_in1 && (!m1stg_snan_dbl_in2))
			|| (m1stg_qnan_dbl_in1 && (!m1stg_nan_dbl_in2)));

assign m2stg_frac1_dbl_dnrm= m1stg_denorm_dbl_in1
		&& (!(m1stg_infnan_dbl_in1 || m1stg_infnan_dbl_in2));

assign m2stg_frac1_sng_norm= m1stg_norm_sng_in1
		&& ((!(m1stg_infnan_sng_in1 || m1stg_infnan_sng_in2))
                        || (m1stg_snan_sng_in1 && (!m1stg_snan_sng_in2))
                        || (m1stg_qnan_sng_in1 && (!m1stg_nan_sng_in2)));

assign m2stg_frac1_sng_dnrm= m1stg_denorm_sng_in1
		&& (!(m1stg_infnan_sng_in1 || m1stg_infnan_sng_in2));

assign m2stg_frac1_inf= (m1stg_inf_in && (!m1stg_nan_in1) && (!m1stg_nan_in2))
		|| m1stg_snan_in2
		|| (m1stg_qnan_in2 && (!m1stg_snan_in1));

assign m2stg_frac2_dbl_norm= m1stg_norm_dbl_in2
		&& ((!(m1stg_infnan_dbl_in1 || m1stg_infnan_dbl_in2))
			|| m1stg_snan_dbl_in2
			|| (m1stg_qnan_dbl_in2 && (!m1stg_snan_dbl_in1)));

assign m2stg_frac2_dbl_dnrm= m1stg_denorm_dbl_in2
		&& (!(m1stg_infnan_dbl_in1 || m1stg_infnan_dbl_in2));

assign m2stg_frac2_sng_norm= m1stg_norm_sng_in2
		&& ((!(m1stg_infnan_sng_in1 || m1stg_infnan_sng_in2))
                        || m1stg_snan_sng_in2
                        || (m1stg_qnan_sng_in2 && (!m1stg_snan_sng_in1)));

assign m2stg_frac2_sng_dnrm= m1stg_denorm_sng_in2
		&& (!(m1stg_infnan_sng_in1 || m1stg_infnan_sng_in2));

assign m2stg_frac2_inf= (m1stg_inf_in && (!m1stg_nan_in1) && (!m1stg_nan_in2))
		|| (m1stg_snan_in1 && (!m1stg_snan_in2))
		|| (m1stg_qnan_in1 && (!m1stg_nan_in2));

assign m1stg_inf_zero_in= (m1stg_inf_in1 && m1stg_zero_in2)
		|| (m1stg_zero_in1 && m1stg_inf_in2);

assign m1stg_inf_zero_in_dbl= ((m1stg_inf_in1 && m1stg_zero_in2)
			|| (m1stg_zero_in1 && m1stg_inf_in2))
		&& m1stg_fmul_dbl_dst;


///////////////////////////////////////////////////////////////////////////////
//
//	Select lines and control logic- multiply leading 0 counts.
//
//      Multiply stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign m2stg_ld0_1_in[5:0]= ({6{(m1stg_denorm_in1 && (!m1stg_infnan_in))}}
		& m1stg_ld0_1[5:0]);

dffe_s #(6) i_m2stg_ld0_1 (
	.din	(m2stg_ld0_1_in[5:0]),
	.en	(m6stg_step),
	.clk    (rclk),

        .q      (m2stg_ld0_1[5:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign m2stg_ld0_2_in[5:0]= ({6{(m1stg_denorm_in2 && (!m1stg_infnan_in))}}
		& m1stg_ld0_2[5:0]);

dffe_s #(6) i_m2stg_ld0_2 (
        .din    (m2stg_ld0_2_in[5:0]),
        .en     (m6stg_step),
        .clk    (rclk),
 
        .q      (m2stg_ld0_2[5:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines- multiply exponent adder.
//
//      Multiply stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign m2stg_exp_expadd= (!m1stg_infnan_in) && (!m1stg_zero_in);

assign m2stg_exp_0bff= m1stg_fmuld && m1stg_infnan_in;

assign m2stg_exp_017f= m1stg_fmuls && m1stg_infnan_in;

assign m2stg_exp_04ff= m1stg_fsmuld && m1stg_infnan_in;
 
assign m2stg_exp_zero= m1stg_zero_in && (!m1stg_infnan_in);


///////////////////////////////////////////////////////////////////////////////
//
//	Total the leading 0's.
//
//	Multiply stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign m2stg_ld0[6:0]= {1'b0, m2stg_ld0_1[5:0]}
			+ {1'b0, m2stg_ld0_2[5:0]};

assign m2stg_ld0_inv[6:0]= (~m2stg_ld0[6:0]);

dffe_s #(7) i_m3astg_ld0_inv (
	.din	(m2stg_ld0_inv[6:0]),
	.en     (m6stg_step),
        .clk    (rclk),

        .q      (m3astg_ld0_inv[6:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Leading 0's.
//
//      Multiply stage 3a.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(7) i_m3bstg_ld0_inv (
        .din    (m3astg_ld0_inv[6:0]),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3bstg_ld0_inv[6:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Post-normalization/denormalization shift count and direction.
//
//	Multiply stage 3.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(1) i_m4stg_expadd_eq_0 (
        .din    (m3stg_expadd_eq_0),
        .en     (m6stg_step),
        .clk    (rclk),
 
        .q      (m4stg_expadd_eq_0),
 
        .se     (se),
        .si     (),
        .so     ()
);

assign m3stg_exp_lte_0= (!(|m3stg_exp[11:0])) || m3stg_exp[12];

assign m4stg_right_shift_in= (!m3stg_expadd_lte_0_inv) && m3stg_exp_lte_0;

dffe_s #(1) i_m4stg_right_shift (
	.din	(m4stg_right_shift_in),
	.en     (m6stg_step),
        .clk    (rclk),

        .q      (m4stg_right_shift),

	.se     (se),
        .si     (),
        .so     ()
);

assign m3stg_exp_minus1[5:0]= m3stg_exp[5:0]
			+ 6'h3f;

assign m3stg_exp_inv_plus2[5:0]= (~m3stg_exp[5:0])
			+ 6'h02;

assign m3stg_exp_lt_neg57= ((!(&m3stg_exp[11:6]))
			|| (!(|m3stg_exp[5:3])))
		&& m3stg_exp[12];

assign m4stg_sh_cnt_in[5:0]= ({6{((!m3stg_expadd_lte_0_inv)
				&& (!m3stg_exp_lte_0))}}
			    & m3stg_exp_minus1[5:0])
		| ({6{((!m3stg_expadd_lte_0_inv) && m3stg_exp_lte_0
				&& m3stg_exp_lt_neg57)}}
			    & 6'h39)
		| ({6{((!m3stg_expadd_lte_0_inv) && m3stg_exp_lte_0
				&& (!m3stg_exp_lt_neg57))}}
			    & m3stg_exp_inv_plus2[5:0])
		| ({6{m3stg_expadd_lte_0_inv}}
			    & (~m3stg_ld0_inv[5:0]));


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines and control logic- multiply shifts for
//              post-normalization/denormalization.
//
//      Multiply stage 4.
//
///////////////////////////////////////////////////////////////////////////////

assign m4stg_left_shift_step= (!m4stg_right_shift) && m6stg_step;

assign m4stg_right_shift_step= m4stg_right_shift && m6stg_step;

// Austin update
// uarch timing fix
// Endpoint: fpu_mul_exp_dp/i_m5stg_exp_pre2_10

// assign m4stg_inc_exp= (((!(|m4stg_exp[12:0])) && (!m4stg_right_shift)
//				&& m4stg_shl_54)
//			|| (m4stg_expadd_eq_0 && m4stg_right_shift
//				&& m4stg_frac_105)
//			|| ((!m4stg_right_shift) && m4stg_shl_55))
//	 	&& m6stg_step;
//
// assign m4stg_inc_exp_inv= (!m4stg_inc_exp) && m6stg_step;

assign m4stg_inc_exp_54  = (!(|m4stg_exp[12:0])) && (!m4stg_right_shift);
assign m4stg_inc_exp_55  = !m4stg_right_shift;
assign m4stg_inc_exp_105 = m4stg_expadd_eq_0 && m4stg_right_shift && m4stg_frac_105;


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines and control logic- multiply rounding.
//
//      Multiply stage 5.
//
///////////////////////////////////////////////////////////////////////////////

assign m5stg_rndup= ((((m5stg_rnd_mode[1:0]==2'b10) && (!m5stg_sign)
					&& (m5stg_frac[2:0]!=3'b0))
				|| ((m5stg_rnd_mode[1:0]==2'b11) && m5stg_sign
					&& (m5stg_frac[2:0]!=3'b0))
				|| ((m5stg_rnd_mode[1:0]==2'b00)
					&& m5stg_frac[2]
					&& ((m5stg_frac[1:0]!=2'b0)
						|| m5stg_frac[3])))
			&& m5stg_fmuld)
		|| ((((m5stg_rnd_mode[1:0]==2'b10) && (!m5stg_sign)
					&& (m5stg_frac[31:0]!=32'b0))
				|| ((m5stg_rnd_mode[1:0]==2'b11) && m5stg_sign
                                        && (m5stg_frac[31:0]!=32'b0))
				|| ((m5stg_rnd_mode[1:0]==2'b00)
                                        && m5stg_frac[31]
					&& ((m5stg_frac[30:0]!=31'b0)
						|| m5stg_frac[32])))
			&& m5stg_fmuls);

assign m5stg_to_0= (m5stg_rnd_mode[1:0]==2'b01)
                || ((m5stg_rnd_mode[1:0]==2'b10) && m5stg_sign)
                || ((m5stg_rnd_mode[1:0]==2'b11) && (!m5stg_sign));

assign m5stg_to_0_inv= (!m5stg_to_0);

assign mul_frac_out_fracadd= m5stg_rndup && (!m5stg_in_of);

assign mul_frac_out_frac= (!m5stg_rndup) && (!m5stg_in_of);

assign mul_exp_out_exp_plus1= m5stg_rndup && (!m5stg_in_of);

assign mul_exp_out_exp= (!m5stg_rndup) && (!m5stg_in_of);


endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_mul_exp_dp.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//	Multiply pipeline exponent datapath.
//
//  Patches by    : John Li
///////////////////////////////////////////////////////////////////////////////
//PITON_PROTO enables all FPGA related modifications






module fpu_mul_exp_dp (
	inq_in1,
	inq_in2,
	m6stg_step,
	m1stg_dblop,
	m1stg_sngop,
	m2stg_exp_expadd,
	m2stg_exp_0bff,
	m2stg_exp_017f,
	m2stg_exp_04ff,
	m2stg_exp_zero,
	m1stg_fsmuld,
	m2stg_fmuld,
	m2stg_fmuls,
	m2stg_fsmuld,
	m3stg_ld0_inv,
	m5stg_fracadd_cout,
	mul_exp_out_exp_plus1,
	mul_exp_out_exp,
	m5stg_in_of,
	m5stg_fmuld,
	m5stg_to_0_inv,
	m4stg_shl_54,
	m4stg_shl_55,
	m4stg_inc_exp_54,
	m4stg_inc_exp_55,
	m4stg_inc_exp_105,
	fmul_clken_l,
	rclk,
	
	m3stg_exp,
	m3stg_expadd_eq_0,
	m3stg_expadd_lte_0_inv,
	m4stg_exp,
	m5stg_exp,
	mul_exp_out,

	se,
	si,
	so
);


input [62:52]	inq_in1;		// request operand 1 to op pipes
input [62:52]	inq_in2;		// request operand 2 to op pipes
input		m6stg_step;		// advance the multiply pipe
input		m1stg_dblop;		// double precision operation- mul 1 stg
input		m1stg_sngop;		// single precision operation- mul 1 stg
input		m2stg_exp_expadd;	// select line to m2stg_exp
input		m2stg_exp_0bff;		// select line to m2stg_exp
input		m2stg_exp_017f;		// select line to m2stg_exp
input		m2stg_exp_04ff;		// select line to m2stg_exp
input		m2stg_exp_zero;		// select line to m2stg_exp
input		m1stg_fsmuld;		// fsmuld- multiply 1 stage
input		m2stg_fmuld;		// fmuld- multiply 2 stage
input		m2stg_fmuls;		// fmuls- multiply 2 stage
input		m2stg_fsmuld;		// fsmuld- multiply 2 stage
input [6:0]	m3stg_ld0_inv;		// leading 0's in multiply operands
input           m4stg_inc_exp_54;       // select line to m5stg_exp
input           m4stg_inc_exp_55;       // select line to m5stg_exp
input           m4stg_inc_exp_105;      // select line to m5stg_exp
input		m5stg_fracadd_cout;	// fraction rounding adder carry out
input		mul_exp_out_exp_plus1;	// select line to mul_exp_out
input		mul_exp_out_exp;	// select line to mul_exp_out
input		m5stg_in_of;		// multiply overflow- select exp out
input		m5stg_fmuld;		// fmuld- multiply 5 stage
input		m5stg_to_0_inv;		// result to infinity on overflow
input		m4stg_shl_54;		// multiply shift left output bit[54]
input		m4stg_shl_55;		// multiply shift left output bit[55]
input		fmul_clken_l;           // multiply pipe clk enable - asserted low
input		rclk; 		// global clock

output [12:0]	m3stg_exp;		// exponent input- multiply 3 stage
output		m3stg_expadd_eq_0;	// mul stage 3 exponent adder sum == 0
output		m3stg_expadd_lte_0_inv;	// mul stage 3 exponent adder sum <= 0
output [12:0]	m4stg_exp;		// exponent input- multiply 4 stage
output [12:0]	m5stg_exp;		// exponent input- multiply 5 stage
output [10:0]	mul_exp_out;		// multiply exponent output

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


wire [10:0]	m1stg_exp_in1;
wire [10:0]	m1stg_exp_in2;
wire [12:0]	m1stg_expadd_in1;
wire [12:0]	m1stg_expadd_in2;
wire [12:0]	m1stg_expadd;
wire [12:0]	m2stg_exp_in;
wire [12:0]	m2stg_exp;
wire [12:0]	m2stg_expadd_in2;
wire [12:0]	m2stg_expadd;
wire [12:0]	m3astg_exp;
wire [12:0]	m3bstg_exp;
wire [12:0]	m3stg_exp;
wire [12:0]	m3stg_expa;
wire [12:0]	m3stg_expadd;
wire		m3stg_expadd_eq_0;
wire		m3stg_expadd_lte_0_inv;
wire [12:0]	m4stg_exp_in;
wire [12:0]	m4stg_exp;
wire [12:0]	m4stg_exp_plus1;
wire [12:0]	m5stg_exp_pre1_in;
wire [12:0]	m5stg_exp_pre1;
wire [12:0]	m5stg_exp_pre2_in;
wire [12:0]	m5stg_exp_pre2;
wire [12:0]	m5stg_exp_pre3_in;
wire [12:0]	m5stg_exp_pre3;
wire [12:0]	m5stg_exp;
wire [12:0]	m5stg_expa;
wire [12:0]	m5stg_exp_plus1;
wire [10:0]	mul_exp_out_in;
wire [10:0]	mul_exp_out;


wire se_l;

//Previously missing wires
wire        clk;
wire        m5stg_shl_55;
wire        m5stg_shl_54;
wire        m5stg_inc_exp_54;
wire        m5stg_inc_exp_55;
wire        m5stg_inc_exp_105;


assign se_l = ~se;




    clken_buf  ckbuf_mul_exp_dp (
      .clk(clk),
      .rclk(rclk),
      .enb_l(fmul_clken_l),
      .tmb_l(se_l)
      );


///////////////////////////////////////////////////////////////////////////////
//
//	Multiply exponent inputs.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(11) i_m1stg_exp_in1 (
        .din    (inq_in1[62:52]),
        .en     (m6stg_step),
        .clk    (clk),
 
        .q      (m1stg_exp_in1[10:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(11) i_m1stg_exp_in2 (
        .din    (inq_in2[62:52]),
        .en     (m6stg_step),
        .clk    (clk),
 
        .q      (m1stg_exp_in2[10:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Multiply exponent adder.
//
//	Multiply stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign m1stg_expadd_in1[12:0]= ({13{m1stg_dblop}}
			    & {2'b0, m1stg_exp_in1[10:0]})
		| ({13{m1stg_sngop}}
			    & {5'b0, m1stg_exp_in1[10:3]});

assign m1stg_expadd_in2[12:0]= ({13{m1stg_dblop}}
                            & {2'b0, m1stg_exp_in2[10:0]})
                | ({13{m1stg_sngop}}
                            & {5'b0, m1stg_exp_in2[10:3]});

assign m1stg_expadd[12:0]= (m1stg_expadd_in1[12:0]
			+ m1stg_expadd_in2[12:0]
			+ 13'h0001);

assign m2stg_exp_in[12:0]= ({13{m2stg_exp_expadd}}
			    & m1stg_expadd[12:0])
		| ({13{m2stg_exp_0bff}}
			    & 13'h0bff)
		| ({13{m2stg_exp_017f}}
			    & 13'h017f)
		| ({13{m2stg_exp_04ff}}
			    & 13'h04ff)
		| ({13{m2stg_exp_zero}}
			    & {{3{m1stg_fsmuld}}, 10'b0});

dffe_s #(13) i_m2stg_exp (
	.din	(m2stg_exp_in[12:0]),
	.en     (m6stg_step),
        .clk    (clk),

        .q      (m2stg_exp[12:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply exponent adder.
//
//      Multiply stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign m2stg_expadd_in2[12:0]= ({13{m2stg_fmuld}}
			    & 13'h1c00)
		| ({13{m2stg_fmuls}}
			    & 13'h1f80)
		| ({13{m2stg_fsmuld}}
			    & 13'h0300);

assign m2stg_expadd[12:0]= m2stg_exp[12:0]
			+ m2stg_expadd_in2[12:0];

dffe_s #(13) i_m3astg_exp (
	.din	(m2stg_expadd[12:0]),
	.en     (m6stg_step),
        .clk    (clk),

        .q      (m3astg_exp[12:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply exponent.
//
//      Multiply stage 3a.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(13) i_m3bstg_exp (
        .din    (m3astg_exp[12:0]),
	.en     (m6stg_step),
        .clk    (clk),

        .q      (m3bstg_exp[12:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply exponent.
//
//      Multiply stage 3b.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(13) i_m3stg_exp (
        .din    (m3bstg_exp[12:0]),
        .en     (m6stg_step),
        .clk    (clk),

        .q      (m3stg_exp[12:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(13) i_m3stg_expa (
	.din	(m3bstg_exp[12:0]),
	.en	(m6stg_step),
	.clk	(clk),

	.q	(m3stg_expa[12:0]),

	.se	(se),
	.si	(),
  	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply exponent adder.
//
//      Multiply stage 3.
//
///////////////////////////////////////////////////////////////////////////////

assign m3stg_expadd[12:0]= (m3stg_expa[12:0]
			+ {6'h3f, m3stg_ld0_inv[6:0]}
			+ 13'h0001);

assign m3stg_expadd_eq_0= (&(m3stg_exp[12:0] ^ {6'h3f, m3stg_ld0_inv[6:0]}));

assign m3stg_expadd_lte_0_inv= (!(m3stg_expadd[12] || m3stg_expadd_eq_0));

assign m4stg_exp_in[12:0]= (m3stg_expadd[12:0] & {13{(!m3stg_expadd[12])}});

dffe_s #(13) i_m4stg_exp (
        .din    (m4stg_exp_in[12:0]),
	.en     (m6stg_step),
        .clk    (clk),

        .q      (m4stg_exp[12:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply exponent increment.
//
//      Multiply stage 4.
//
///////////////////////////////////////////////////////////////////////////////

assign m4stg_exp_plus1[12:0]= m4stg_exp[12:0]
			+ 13'h0001;


// Austin update
// uarch timing fix
// Endpoint: fpu_mul_exp_dp/i_m5stg_exp_pre2_10

// assign m5stg_exp_pre1_in[12:0]= (~({13{m4stg_inc_exp}}
//			    & m4stg_exp_plus1[12:0]));

assign m5stg_exp_pre1_in[12:0]= ( ({13{m6stg_step}}
			    & m4stg_exp_plus1[12:0]));

dff_s #(13) i_m5stg_exp_pre1 (
	.din	(m5stg_exp_pre1_in[12:0]),
	.clk    (clk),
 
        .q      (m5stg_exp_pre1[12:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);


// Austin update
// uarch timing fix
// Endpoint: fpu_mul_exp_dp/i_m5stg_exp_pre2_10

// assign m5stg_exp_pre2_in[12:0]= (~({13{m4stg_inc_exp_inv}}
//			    & m4stg_exp[12:0]));

assign m5stg_exp_pre2_in[12:0]= ( ({13{m6stg_step}}
			    & m4stg_exp[12:0]));

dff_s #(13) i_m5stg_exp_pre2 (
	.din	(m5stg_exp_pre2_in[12:0]),
	.clk	(clk),

	.q	(m5stg_exp_pre2[12:0]),

	.se	(se),
	 .si	(),
	.so	()
);

assign m5stg_exp_pre3_in[12:0]= (~({13{(!m6stg_step)}}
			    & m5stg_expa[12:0]));

dff_s #(13) i_m5stg_exp_pre3 (
	.din	(m5stg_exp_pre3_in[12:0]),
	.clk	(clk),

	.q	(m5stg_exp_pre3[12:0]),

	.se	(se),
	 .si	(),
	.so	()
);


// Austin update
// uarch timing fix
// Endpoint: fpu_mul_exp_dp/i_m5stg_exp_pre2_10

//assign m5stg_exp[12:0]= (~m5stg_exp_pre1[12:0])
//		| (~m5stg_exp_pre2[12:0])
//		| (~m5stg_exp_pre3[12:0]);

dff_s #(5) i_m5stg_inc_exp (
	.din	({m4stg_shl_55,m4stg_shl_54,
                  m4stg_inc_exp_54,m4stg_inc_exp_55,m4stg_inc_exp_105}),
	.clk	(clk),

	.q	({m5stg_shl_55,m5stg_shl_54,
                  m5stg_inc_exp_54,m5stg_inc_exp_55,m5stg_inc_exp_105}),

	.se	(se),
	.si	(),
	.so	()
);

assign m5stg_exp[12:0] =

          ( {13{((m5stg_shl_54 & m5stg_inc_exp_54) |
                 (m5stg_shl_55 & m5stg_inc_exp_55) |
                 (m5stg_inc_exp_105)                )}} & m5stg_exp_pre1[12:0]) |

          (~{13{((m5stg_shl_54 & m5stg_inc_exp_54) |
                 (m5stg_shl_55 & m5stg_inc_exp_55) |
                 (m5stg_inc_exp_105)                )}} & m5stg_exp_pre2[12:0]) |

         ~(m5stg_exp_pre3[12:0]);


assign m5stg_expa[12:0]= m5stg_exp[12:0];


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply rounding.
//      Multiply stage 5.
//
///////////////////////////////////////////////////////////////////////////////
 
assign m5stg_exp_plus1[12:0]= m5stg_expa[12:0]
                        + 13'h0001;

assign mul_exp_out_in[10:0]= ({11{(mul_exp_out_exp_plus1
					&& m5stg_fracadd_cout)}}
			    & m5stg_exp_plus1[10:0])
		| ({11{mul_exp_out_exp}}
			    & m5stg_expa[10:0])
		| ({11{((!m5stg_fracadd_cout) && (!m5stg_in_of))}}
			    & m5stg_expa[10:0])
		| ({11{m5stg_in_of}}
			    & {{3{m5stg_fmuld}}, 7'h7f, m5stg_to_0_inv});


dffe_s #(11) i_mul_exp_out (
	.din	(mul_exp_out_in[10:0]),
	.en     (m6stg_step),
        .clk    (clk),

        .q      (mul_exp_out[10:0]),

	.se     (se),
        .si     (),
        .so     ()
);


endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_mul_frac_dp.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//	Multiply pipeline fraction datapath.
//
//  Patches by    : John Li
///////////////////////////////////////////////////////////////////////////////
//PITON_PROTO enables all FPGA related modifications





module fpu_mul_frac_dp (
	inq_in1,
	inq_in2,
	m6stg_step,
	m2stg_frac1_dbl_norm,
	m2stg_frac1_dbl_dnrm,
	m2stg_frac1_sng_norm,
	m2stg_frac1_sng_dnrm,
	m2stg_frac1_inf,
	m1stg_snan_dbl_in1,
	m1stg_snan_sng_in1,
	m2stg_frac2_dbl_norm,
	m2stg_frac2_dbl_dnrm,
	m2stg_frac2_sng_norm,
	m2stg_frac2_sng_dnrm,
	m2stg_frac2_inf,
	m1stg_snan_dbl_in2,
	m1stg_snan_sng_in2,
	m1stg_inf_zero_in,
	m1stg_inf_zero_in_dbl,
	m1stg_dblop,
	m1stg_dblop_inv,
	m4stg_frac,
	m4stg_sh_cnt_in,
	m3bstg_ld0_inv,
	m4stg_left_shift_step,
	m4stg_right_shift_step,
	m5stg_fmuls,
	m5stg_fmulda,
	mul_frac_out_fracadd,
	mul_frac_out_frac,
	m5stg_in_of,
	m5stg_to_0,
	fmul_clken_l,
	rclk,
	
	m2stg_frac1_array_in,
	m2stg_frac2_array_in,
	m1stg_ld0_1,
	m1stg_ld0_2,
	m4stg_frac_105,
	m3stg_ld0_inv,
	m4stg_shl_54,
	m4stg_shl_55,
	m5stg_frac_32_0,
	m5stg_frac_dbl_nx,
	m5stg_frac_sng_nx,
	m5stg_frac_neq_0,
	m5stg_fracadd_cout,
	mul_frac_out,

	se,
	si,
	so
);


input [54:0]	inq_in1;		// request operand 1 to op pipes
input [54:0]	inq_in2;		// request operand 2 to op pipes
input		m6stg_step;		// advance the multiply pipe
input		m2stg_frac1_dbl_norm;	// select line to m2stg_frac1
input		m2stg_frac1_dbl_dnrm;	// select line to m2stg_frac1
input		m2stg_frac1_sng_norm;	// select line to m2stg_frac1
input		m2stg_frac1_sng_dnrm;	// select line to m2stg_frac1
input		m2stg_frac1_inf;	// select line to m2stg_frac1
input		m1stg_snan_dbl_in1;	// operand 1 is double signalling NaN
input		m1stg_snan_sng_in1;	// operand 1 is single signalling NaN
input		m2stg_frac2_dbl_norm;	// select line to m2stg_frac2
input		m2stg_frac2_dbl_dnrm;	// select line to m2stg_frac2
input		m2stg_frac2_sng_norm;	// select line to m2stg_frac2
input		m2stg_frac2_sng_dnrm;	// select line to m2stg_frac2
input		m2stg_frac2_inf;	// select line to m2stg_frac2
input		m1stg_snan_dbl_in2;	// operand 2 is double signalling NaN
input		m1stg_snan_sng_in2;	// operand 2 is single signalling NaN
input		m1stg_inf_zero_in;	// 1 operand is infinity; other is 0
input		m1stg_inf_zero_in_dbl;	// 1 opnd is infinity; other is 0- dbl
input		m1stg_dblop;		// double precision operation- mul 1 stg
input		m1stg_dblop_inv;	// single or int operation- mul 1 stg
input [105:0]	m4stg_frac;		// multiply array output
input [5:0]	m4stg_sh_cnt_in;	// multiply normalization shift count
input [6:0]	m3bstg_ld0_inv;		// leading 0's in multiply operands
input		m4stg_left_shift_step;	// select line to m5stg_frac
input		m4stg_right_shift_step;	// select line to m5stg_frac
input		m5stg_fmuls;		// fmuls- multiply 5 stage
input		m5stg_fmulda;		// fmuld- multiply 5 stage
input		mul_frac_out_fracadd;	// select line to mul_frac_out
input		mul_frac_out_frac;	// select line to mul_frac_out
input		m5stg_in_of;		// multiply overflow- select exp out
input		m5stg_to_0;		// result to max finite on overflow
input		fmul_clken_l;           // multiply pipe clk enable - asserted low
input		rclk;		// global clock

output [52:0]	m2stg_frac1_array_in;	// multiply array input 1
output [52:0]	m2stg_frac2_array_in;	// multiply array input 2
output [5:0]	m1stg_ld0_1;		// denorm operand 1 leading 0's
output [5:0]	m1stg_ld0_2;		// denorm operand 2 leading 0's
output		m4stg_frac_105;		// multiply stage 4a fraction input[105]
output [6:0]	m3stg_ld0_inv;		// leading 0's in multiply operands
output		m4stg_shl_54;		// multiply shift left output bit[54]
output		m4stg_shl_55;		// multiply shift left output bit[55]
output [32:0]	m5stg_frac_32_0;	// multiply stage 5 fraction input
output		m5stg_frac_dbl_nx;	// double precision inexact result
output		m5stg_frac_sng_nx;	// single precision inexact result
output		m5stg_frac_neq_0;	// fraction input to mul 5 stage != 0
output		m5stg_fracadd_cout;	// fraction rounding adder carry out
output [51:0]	mul_frac_out;		// multiply fraction output

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


wire [54:0]	mul_frac_in1;
wire [54:0]	mul_frac_in2;
wire [52:0]	m2stg_frac1_in;
wire [52:0]	m2stg_frac1_array_in;
wire [52:0]	m2stg_frac2_in;
wire [52:0]	m2stg_frac2_array_in;
wire [52:0]	m1stg_ld0_1_din;
wire [5:0]	m1stg_ld0_1;
wire [52:0]	m1stg_ld0_2_din;
wire [5:0]	m1stg_ld0_2;
wire		m4stg_frac_105;
wire [5:0]	m4stg_sh_cnt_5;
wire [5:0]	m4stg_sh_cnt_4;
wire [5:0]	m4stg_sh_cnt;
wire [6:0]	m3stg_ld0_inv;
wire [168:63]	m4stg_shl_tmp;
wire [55:0]	m4stg_shl;
wire		m4stg_shl_54;
wire		m4stg_shl_55;

// 2/18/03: Changed to 225:0 (for easier LEC matching plus closer to implementation)
// wire [219:0]	m4stg_shr_tmp;
wire [168:0]	m4stg_shr_tmp;

wire [55:0]	m4stg_shr;
wire [54:0]	m5stg_frac_pre1_in;
wire [54:0]	m5stg_frac_pre1;
wire [54:0]	m5stg_frac_pre2_in;
wire [54:0]	m5stg_frac_pre2;
wire [54:0]	m5stg_frac_pre3_in;
wire [54:0]	m5stg_frac_pre3;
wire [54:0]	m5stg_frac_pre4_in;
wire [54:0]	m5stg_frac_pre4;
wire [54:33]	m5stg_frac_54_33;
wire [32:0]	m5stg_frac_32_0;
wire [54:3]	m5stg_fraca;
wire [54:0]	m5stg_fracb;
wire		m5stg_frac_dbl_nx;
wire		m5stg_frac_sng_nx;
wire		m5stg_frac_neq_0;
wire [52:0]	m5stg_fracadd_tmp;
wire		m5stg_fracadd_cout;
wire [51:0]	m5stg_fracadd;
wire [51:0]	mul_frac_out_in;
wire [51:0]	mul_frac_out;
wire [30:0] mstg_xtra_regs;

wire se_l;

//Previously missed wires
wire        clk;

assign se_l = ~se;




    clken_buf  ckbuf_mul_frac_dp (
      .clk(clk),
      .rclk(rclk),
      .enb_l(fmul_clken_l),
      .tmb_l(se_l)
      );


///////////////////////////////////////////////////////////////////////////////
//
//	Multiply fraction inputs.
//
//	Multiply input stage.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(55) i_mul_frac_in1 (
        .din    (inq_in1[54:0]),
        .en     (m6stg_step),
        .clk    (clk),
 
        .q      (mul_frac_in1[54:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(55) i_mul_frac_in2 (
        .din    (inq_in2[54:0]),
        .en     (m6stg_step),
        .clk    (clk),
 
        .q      (mul_frac_in2[54:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Multiply normalization and special input injection.
//
//	Multiply stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign m2stg_frac1_in[52:0]= ({53{m2stg_frac1_dbl_norm}}
			    & {1'b1, (mul_frac_in1[51] || m1stg_snan_dbl_in1),
				mul_frac_in1[50:0]})
		| ({53{m2stg_frac1_dbl_dnrm}}
                            & {mul_frac_in1[51:0], 1'b0})
                | ({53{m2stg_frac1_sng_norm}}
                            & {1'b1, (mul_frac_in1[54] || m1stg_snan_sng_in1),
                                mul_frac_in1[53:32], 29'b0})
                | ({53{m2stg_frac1_sng_dnrm}}
                            & {mul_frac_in1[54:32], 30'b0})
		| ({53{m2stg_frac1_inf}}
			    & 53'h10000000000000);

assign m2stg_frac1_array_in[52:0]= (~m2stg_frac1_in[52:0]);

assign m2stg_frac2_in[52:0]= ({53{m2stg_frac2_dbl_norm}}
                            & {1'b1, (mul_frac_in2[51] || m1stg_snan_dbl_in2),
                                mul_frac_in2[50:0]})
                | ({53{m2stg_frac2_dbl_dnrm}}
                            & {mul_frac_in2[51:0], 1'b0})
                | ({53{m2stg_frac2_sng_norm}}
                            & {1'b1, (mul_frac_in2[54] || m1stg_snan_sng_in2),
                                mul_frac_in2[53:32], 29'b0})
                | ({53{m2stg_frac2_sng_dnrm}}
                            & {mul_frac_in2[54:32], 30'b0})
                | ({53{m2stg_frac2_inf}}
			    & {1'b1, {23{m1stg_inf_zero_in}},
					{29{m1stg_inf_zero_in_dbl}}});
 
assign m2stg_frac2_array_in[52:0]= m2stg_frac2_in[52:0];


///////////////////////////////////////////////////////////////////////////////
//
//	Multiply leading 0 counts.
//
//	Multiply stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign m1stg_ld0_1_din[52:0]= ({53{m1stg_dblop_inv}}
			    & {mul_frac_in1[54:32], 30'b0})
		| ({53{m1stg_dblop}}
			    & {mul_frac_in1[51:0], 1'b0});

fpu_cnt_lead0_53b i_m1stg_ld0_1 (
	.din	(m1stg_ld0_1_din[52:0]),

	.lead0	(m1stg_ld0_1[5:0])
);

assign m1stg_ld0_2_din[52:0]= ({53{m1stg_dblop_inv}}
			    & {mul_frac_in2[54:32], 30'b0})
		| ({53{m1stg_dblop}}
			    & {mul_frac_in2[51:0], 1'b0});

fpu_cnt_lead0_53b i_m1stg_ld0_2 (
	.din	(m1stg_ld0_2_din[52:0]),

	.lead0	(m1stg_ld0_2[5:0])
);


///////////////////////////////////////////////////////////////////////////////
//
//	Multiply shifts for post-normalization/denormalization.
//
//	Multiply stage 4a.
//
///////////////////////////////////////////////////////////////////////////////

assign m4stg_frac_105= m4stg_frac[105];

dffe_s #(56) i_mstg_xtra_regs (
	.din	({{6{m4stg_sh_cnt_in[5]}}, 
			{6{m4stg_sh_cnt_in[4]}},
			m4stg_sh_cnt_in[5:0],
			m3bstg_ld0_inv[6:0],
			31'h0000_0000}),
	.en     (m6stg_step),
        .clk    (clk),

	.q	({m4stg_sh_cnt_5[5:0],
			m4stg_sh_cnt_4[5:0],
			m4stg_sh_cnt[5:0],
			m3stg_ld0_inv[6:0],
			mstg_xtra_regs[30:0]}),
	.se     (se),
        .si     (),
        .so     ()
);

//assign m4stg_shl_tmp[168:0]= {m4stg_frac[105:0], 63'b0}
//		<< {m4stg_sh_cnt_5[0], m4stg_sh_cnt[4:0]};

  assign m4stg_shl_tmp[168:63]=  m4stg_frac[105:0]
		<< {m4stg_sh_cnt_5[0], m4stg_sh_cnt[4:0]};

assign m4stg_shl[55:0]= {m4stg_shl_tmp[168:114], (|m4stg_shl_tmp[113:63])};
assign m4stg_shl_54= m4stg_shl[54];

assign m4stg_shl_55= m4stg_shl[55];

// 2/18/03: changed below to match implementation plus easier LEC
// assign m4stg_shr_tmp[219:0]= {57'b0, m4stg_frac[105:0], 57'b0} 
// 						>> m4stg_sh_cnt[5:0];
// assign m4stg_shr[55:0]= {m4stg_shr_tmp[162:108], (|m4stg_shr_tmp[107:0])};

//assign m4stg_shr_tmp[225:0]= {57'b0, m4stg_frac[105:0], 63'b0} >> m4stg_sh_cnt[5:0];
  assign m4stg_shr_tmp[168:0]= {       m4stg_frac[105:0], 63'b0} >> m4stg_sh_cnt[5:0];


assign m4stg_shr[55:0]= {m4stg_shr_tmp[168:114], (|m4stg_shr_tmp[113:0])};


///////////////////////////////////////////////////////////////////////////////
//
//	Select post-normalization or denormalization result.
//
//	Multiply stage 4.
//
///////////////////////////////////////////////////////////////////////////////

// 2/18/03: Inverted the logic (nand instead of and) to reflect implementation and easier LEC
// assign m5stg_frac_pre1_in[54:0]= ({55{(m4stg_left_shift_step && m4stg_shl[55])}}
//           & m4stg_shl[54:0])
//     | ({55{(!m6stg_step)}}
//           & m5stg_fracb[54:0]);

assign m5stg_frac_pre1_in[54:0]= ~(({55{(m4stg_left_shift_step && m4stg_shl[55])}}
			    & m4stg_shl[54:0])
		| ({55{(!m6stg_step)}}
			    & m5stg_fracb[54:0]));

dff_s #(55) i_m5stg_frac_pre1 (
	.din	(m5stg_frac_pre1_in[54:0]),
	.clk    (clk),

        .q      (m5stg_frac_pre1[54:0]),

	.se     (se),
        .si     (),
        .so     ()
);

// 2/18/03: Inverted the logic (nand instead of and) to reflect implementation and easier LEC
// assign m5stg_frac_pre2_in[54:0]= ({55{(m4stg_left_shift_step
//           && (!m4stg_shl[55]))}}
//           & {m4stg_shl[53:0], 1'b0});


assign m5stg_frac_pre2_in[54:0]= ~({55{(m4stg_left_shift_step
					&& (!m4stg_shl[55]))}}
			    & {m4stg_shl[53:0], 1'b0});

dff_s #(55) i_m5stg_frac_pre2 (
	.din	(m5stg_frac_pre2_in[54:0]),
	.clk	(clk),

	.q	(m5stg_frac_pre2[54:0]),

	.se	(se),
		.si	(),
	.so	()
);

// 2/18/03: Inverted the logic (nand instead of and) to reflect implementation and easier LEC
// assign m5stg_frac_pre3_in[54:0]= ({55{(m4stg_right_shift_step
//           && m4stg_shr[55])}}
//           & m4stg_shr[54:0]);

assign m5stg_frac_pre3_in[54:0]= ~({55{(m4stg_right_shift_step
					&& m4stg_shr[55])}}
			    & m4stg_shr[54:0]);

dff_s #(55) i_m5stg_frac_pre3 (
	.din	(m5stg_frac_pre3_in[54:0]),
	.clk	(clk),

	.q	(m5stg_frac_pre3[54:0]),

	.se	(se),
		.si	(),
	.so	()
);

// 2/18/03: Inverted the logic (nand instead of and) to reflect implementation and easier LEC
// assign m5stg_frac_pre4_in[54:0]= ({55{(m4stg_right_shift_step
//           && (!m4stg_shr[55]))}}
//           & {m4stg_shr[53:0], 1'b0});

assign m5stg_frac_pre4_in[54:0]= ~({55{(m4stg_right_shift_step
					&& (!m4stg_shr[55]))}}
			    & {m4stg_shr[53:0], 1'b0});

dff_s #(55) i_m5stg_frac_pre4 (
	.din	(m5stg_frac_pre4_in[54:0]),
	.clk	(clk),

	.q	(m5stg_frac_pre4[54:0]),

	.se	(se),
		.si	(),
	.so	()
);

// 2/18/03: Inverted the logic (nand instead of or) to reflect implementation and easier LEC
// assign m5stg_frac[54:0]= (m5stg_frac_pre1[54:0]
//     | m5stg_frac_pre2[54:0]
//     | m5stg_frac_pre3[54:0]
//     | m5stg_frac_pre4[54:0]);

assign {m5stg_frac_54_33[54:33], m5stg_frac_32_0[32:0]} = ~(m5stg_frac_pre1[54:0]
		& m5stg_frac_pre2[54:0]
		& m5stg_frac_pre3[54:0]
		& m5stg_frac_pre4[54:0]);


assign m5stg_fraca[54:3]= {m5stg_frac_54_33[54:33], m5stg_frac_32_0[32:3]};

assign m5stg_fracb[54:0]= {m5stg_frac_54_33[54:33], m5stg_frac_32_0[32:0]};


///////////////////////////////////////////////////////////////////////////////
//
//	Multiply rounding.
//
//	Multiply stage 5.
//
///////////////////////////////////////////////////////////////////////////////

assign m5stg_frac_dbl_nx= (|m5stg_fracb[2:0]);

assign m5stg_frac_sng_nx= m5stg_frac_dbl_nx || (|m5stg_fracb[31:3]);

assign m5stg_frac_neq_0= m5stg_frac_sng_nx || (|m5stg_fracb[54:32]);

assign m5stg_fracadd_tmp[52:0]= {1'b0, m5stg_fraca[54:3]}
			+ {23'b0, m5stg_fmuls, 28'b0, m5stg_fmulda};

assign m5stg_fracadd_cout= m5stg_fracadd_tmp[52];

assign m5stg_fracadd[51:0]= m5stg_fracadd_tmp[51:0];

assign mul_frac_out_in[51:0]= ({52{mul_frac_out_fracadd}}
			    & m5stg_fracadd[51:0])
		| ({52{mul_frac_out_frac}}
			    & m5stg_fracb[54:3])
		| ({52{m5stg_in_of}}
			    & {52{m5stg_to_0}});

dffe_s #(52) i_mul_frac_out (
	.din	(mul_frac_out_in[51:0]),
	.en     (m6stg_step),
        .clk    (clk),

        .q      (mul_frac_out[51:0]),

	.se     (se),
        .si     (),
        .so     ()
);

endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_out.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//	FPU result output.
//
///////////////////////////////////////////////////////////////////////////////


module fpu_out (
	d8stg_fdiv_in,
	m6stg_fmul_in,
	a6stg_fadd_in,
	div_id_out_in,
	m6stg_id_in,
	add_id_out_in,
	div_exc_out,
	d8stg_fdivd,
	d8stg_fdivs,
	div_sign_out,
	div_exp_out,
	div_frac_out,
	mul_exc_out,
	m6stg_fmul_dbl_dst,
	m6stg_fmuls,
	mul_sign_out,
	mul_exp_out,
	mul_frac_out,
	add_exc_out,
	a6stg_fcmpop,
	add_cc_out,
	add_fcc_out,
	a6stg_dbl_dst,
	a6stg_sng_dst,
	a6stg_long_dst,
	a6stg_int_dst,
	add_sign_out,
	add_exp_out,
	add_frac_out,
	arst_l,
	grst_l,
	rclk,
	
	fp_cpx_req_cq,
	add_dest_rdy,
	mul_dest_rdy,
	div_dest_rdy,
	fp_cpx_data_ca,

	se,
	si,
	so
);


input		d8stg_fdiv_in;		// div pipe output request next cycle
input		m6stg_fmul_in;		// mul pipe output request next cycle
input		a6stg_fadd_in;		// add pipe output request next cycle
input [9:0]	div_id_out_in;		// div pipe output ID next cycle
input [9:0]	m6stg_id_in;		// mul pipe output ID next cycle
input [9:0]	add_id_out_in;		// add pipe output ID next cycle
input [4:0]	div_exc_out;		// divide pipe result- exception flags
input		d8stg_fdivd;		// divide double- divide stage 8
input		d8stg_fdivs;		// divide single- divide stage 8
input		div_sign_out;		// divide sign output
input [10:0]	div_exp_out;		// divide exponent output
input [51:0]	div_frac_out;		// divide fraction output
input [4:0]	mul_exc_out;		// multiply pipe result- exception flags
input		m6stg_fmul_dbl_dst;	// double precision multiply result
input		m6stg_fmuls;		// fmuls- multiply 6 stage
input		mul_sign_out;		// multiply sign output
input [10:0]	mul_exp_out;		// multiply exponent output
input [51:0]	mul_frac_out;		// multiply fraction output
input [4:0]	add_exc_out;		// add pipe result- exception flags
input		a6stg_fcmpop;		// compare- add 6 stage
input [1:0]	add_cc_out;		// add pipe result- condition
input [1:0]	add_fcc_out;		// add pipe input fcc passed through
input		a6stg_dbl_dst;		// float double result- add 6 stage
input		a6stg_sng_dst;		// float single result- add 6 stage
input		a6stg_long_dst;		// 64bit integer result- add 6 stage
input		a6stg_int_dst;		// 32bit integer result- add 6 stage
input		add_sign_out;		// add sign output
input [10:0]	add_exp_out;		// add exponent output
input [63:0]	add_frac_out;		// add fraction output
input		arst_l;			// global async. reset- asserted low
input		grst_l;			// global sync. reset- asserted low
input		rclk;			// global clock

output [7:0]	fp_cpx_req_cq;		// FPU result request to CPX
output		add_dest_rdy;		// add pipe result request this cycle
output		mul_dest_rdy;		// mul pipe result request this cycle
output		div_dest_rdy;		// div pipe result request this cycle
output [144:0]	fp_cpx_data_ca;		// FPU result to CPX

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_out_ctl.
//
///////////////////////////////////////////////////////////////////////////////

wire [7:0]	fp_cpx_req_cq;		// FPU result request to CPX
wire [1:0]	req_thread;		// thread ID of result req this cycle
wire [2:0]	dest_rdy;		// pipe with result request this cycle
wire		add_dest_rdy;		// add pipe result request this cycle
wire		mul_dest_rdy;		// mul pipe result request this cycle
wire		div_dest_rdy;		// div pipe result request this cycle


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_out_dp.
//
///////////////////////////////////////////////////////////////////////////////

wire [144:0]	fp_cpx_data_ca;		// FPU result to CPX

//Previously missing wires
wire        scan_out_fpu_out_ctl;


///////////////////////////////////////////////////////////////////////////////
//
//	Instantiations.
//
///////////////////////////////////////////////////////////////////////////////

fpu_out_ctl fpu_out_ctl (
	.d8stg_fdiv_in			(d8stg_fdiv_in),
	.m6stg_fmul_in			(m6stg_fmul_in),
	.a6stg_fadd_in			(a6stg_fadd_in),
	.div_id_out_in			(div_id_out_in[9:0]),
	.m6stg_id_in			(m6stg_id_in[9:0]),
	.add_id_out_in			(add_id_out_in[9:0]),
	.arst_l				(arst_l),
	.grst_l				(grst_l),
	.rclk			(rclk),

	.fp_cpx_req_cq			(fp_cpx_req_cq[7:0]),
	.req_thread			(req_thread[1:0]),
	.dest_rdy			(dest_rdy[2:0]),
	.add_dest_rdy			(add_dest_rdy),
	.mul_dest_rdy			(mul_dest_rdy),
	.div_dest_rdy			(div_dest_rdy),

	.se                             (se),
        .si                             (si),
        .so                             (scan_out_fpu_out_ctl)
);


fpu_out_dp fpu_out_dp (
	.dest_rdy			(dest_rdy[2:0]),
	.req_thread			(req_thread[1:0]),
	.div_exc_out			(div_exc_out[4:0]),
	.d8stg_fdivd			(d8stg_fdivd),
	.d8stg_fdivs			(d8stg_fdivs),
	.div_sign_out			(div_sign_out),
	.div_exp_out			(div_exp_out[10:0]),
	.div_frac_out			(div_frac_out[51:0]),
	.mul_exc_out			(mul_exc_out[4:0]),
	.m6stg_fmul_dbl_dst		(m6stg_fmul_dbl_dst),
	.m6stg_fmuls			(m6stg_fmuls),
	.mul_sign_out			(mul_sign_out),
	.mul_exp_out			(mul_exp_out[10:0]),
	.mul_frac_out			(mul_frac_out[51:0]),
	.add_exc_out			(add_exc_out[4:0]),
	.a6stg_fcmpop			(a6stg_fcmpop),
	.add_cc_out			(add_cc_out[1:0]),
	.add_fcc_out			(add_fcc_out[1:0]),
	.a6stg_dbl_dst			(a6stg_dbl_dst),
	.a6stg_sng_dst			(a6stg_sng_dst),
	.a6stg_long_dst			(a6stg_long_dst),
	.a6stg_int_dst			(a6stg_int_dst),
	.add_sign_out			(add_sign_out),
	.add_exp_out			(add_exp_out[10:0]),
	.add_frac_out			(add_frac_out[63:0]),
	.rclk			(rclk),

	.fp_cpx_data_ca			(fp_cpx_data_ca[144:0]),

	.se                             (se),
        .si                             (scan_out_fpu_out_ctl),
        .so                             (so)
);


endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_out_ctl.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//	FPU output control logic.
//
///////////////////////////////////////////////////////////////////////////////
 

module fpu_out_ctl (
	d8stg_fdiv_in,
	m6stg_fmul_in,
	a6stg_fadd_in,
	div_id_out_in,
	m6stg_id_in,
	add_id_out_in,
	arst_l,
	grst_l,
	rclk,
	
	fp_cpx_req_cq,
	req_thread,
	dest_rdy,
	add_dest_rdy,
	mul_dest_rdy,
	div_dest_rdy,

	se,
	si,
	so
);


input		d8stg_fdiv_in;		// div pipe output request next cycle
input		m6stg_fmul_in;		// mul pipe output request next cycle
input		a6stg_fadd_in;		// add pipe output request next cycle
input [9:0]	div_id_out_in;		// div pipe output ID next cycle
input [9:0]	m6stg_id_in;		// mul pipe output ID next cycle
input [9:0]	add_id_out_in;		// add pipe output ID next cycle
input		arst_l;			// global async. reset- asserted low
input		grst_l;			// global sync. reset- asserted low
input		rclk;		// global clock

output [7:0]	fp_cpx_req_cq;		// FPU result request to CPX
output [1:0]	req_thread;		// thread ID of result req this cycle
output [2:0]	dest_rdy;		// pipe with result request this cycle
output		add_dest_rdy;		// add pipe result request this cycle
output		mul_dest_rdy;		// mul pipe result request this cycle
output		div_dest_rdy;		// div pipe result request this cycle

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


wire		reset;
wire		add_req_in;
wire		add_req_step;
wire		add_req;
wire		div_req_sel;
wire		mul_req_sel;
wire		add_req_sel;
wire [9:0]	out_id;
wire [7:0]	fp_cpx_req_cq;
wire [1:0]	req_thread;
wire [2:0]	dest_rdy_in;
wire [2:0]	dest_rdy;
wire		add_dest_rdy;
wire		mul_dest_rdy;
wire		div_dest_rdy;

//Previously missing wires
wire        out_ctl_rst_l;

dffrl_async #(1)  dffrl_out_ctl (
  .din  (grst_l),
  .clk  (rclk),
  .rst_l(arst_l),
  .q    (out_ctl_rst_l),
	.se (se),
	.si (),
	.so ()
  );

assign reset= (!out_ctl_rst_l);


///////////////////////////////////////////////////////////////////////////////
//
//	Arbitrate for the output.
//
//	Top priority- divide.
//	Low priority- round robin arbitration between the add and multiply
//		pipes.
//
///////////////////////////////////////////////////////////////////////////////

assign add_req_in= (!add_req);

assign add_req_step= add_req_sel || mul_req_sel;

dffre_s #(1) i_add_req (
	.din	(add_req_in),
	.en	(add_req_step),
	.rst    (reset),
        .clk    (rclk),

        .q      (add_req),

	.se     (se),
        .si     (),
        .so     ()
);

assign div_req_sel= d8stg_fdiv_in;

assign mul_req_sel= m6stg_fmul_in
		&& ((!add_req) || (!a6stg_fadd_in))
		&& (!div_req_sel);

assign add_req_sel= a6stg_fadd_in
		&& (add_req || (!m6stg_fmul_in))
		&& (!div_req_sel);


///////////////////////////////////////////////////////////////////////////////
//
//	Generate the request.
//
//	Input to the output request (CQ) stage.
//
///////////////////////////////////////////////////////////////////////////////

assign out_id[9:0]= ({10{div_req_sel}}
			    & div_id_out_in[9:0])
		| ({10{mul_req_sel}}
			    & m6stg_id_in[9:0])
		| ({10{add_req_sel}}
			    & add_id_out_in[9:0]);

dff_s #(8) i_fp_cpx_req_cq (
	.din	(out_id[9:2]),
	.clk    (rclk),

        .q      (fp_cpx_req_cq[7:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Capture the thread.
//
//      Input to the output request (CQ) stage.
//
///////////////////////////////////////////////////////////////////////////////

dff_s #(2) i_req_thread (
	.din	(out_id[1:0]),
	.clk    (rclk),
 
        .q      (req_thread[1:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Capture the pipe that wins the output request.
//
//      Input to the output request (CQ) stage.
//
///////////////////////////////////////////////////////////////////////////////

assign dest_rdy_in[2:0]= {div_req_sel, mul_req_sel, add_req_sel};

dff_s #(3) i_dest_rdy (
	.din	(dest_rdy_in[2:0]),
	.clk    (rclk),

        .q      (dest_rdy[2:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dff_s i_add_dest_rdy (
	.din	(add_req_sel),
	.clk	(rclk),

	.q	(add_dest_rdy),

	.se	(se),
        .si	(),
        .so	()
);

dff_s i_mul_dest_rdy (
	.din	(mul_req_sel),
	.clk	(rclk),

	.q	(mul_dest_rdy),

	.se	(se),
        .si	(),
        .so	()
);

dff_s i_div_dest_rdy (
	.din	(div_req_sel),
	.clk	(rclk),

	.q	(div_dest_rdy),

        .se	(se),
        .si	(),
        .so	()
);


endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_out_dp.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//      FPU output datapath.
//
///////////////////////////////////////////////////////////////////////////////
 

module fpu_out_dp (
	dest_rdy,
	req_thread,
	div_exc_out,
	d8stg_fdivd,
	d8stg_fdivs,
	div_sign_out,
	div_exp_out,
	div_frac_out,
	mul_exc_out,
	m6stg_fmul_dbl_dst,
	m6stg_fmuls,
	mul_sign_out,
	mul_exp_out,
	mul_frac_out,
	add_exc_out,
	a6stg_fcmpop,
	add_cc_out,
	add_fcc_out,
	a6stg_dbl_dst,
	a6stg_sng_dst,
	a6stg_long_dst,
	a6stg_int_dst,
	add_sign_out,
	add_exp_out,
	add_frac_out,
	rclk,
	
	fp_cpx_data_ca,

	se,
	si,
	so
);


input [2:0]	dest_rdy;		// pipe with result request this cycle
input [1:0]	req_thread;		// thread ID of result req this cycle
input [4:0]	div_exc_out;		// divide pipe result- exception flags
input		d8stg_fdivd;		// divide double- divide stage 8
input		d8stg_fdivs;		// divide single- divide stage 8
input		div_sign_out;		// divide sign output
input [10:0]	div_exp_out;		// divide exponent output
input [51:0]	div_frac_out;		// divide fraction output
input [4:0]	mul_exc_out;		// multiply pipe result- exception flags
input		m6stg_fmul_dbl_dst;	// double precision multiply result
input		m6stg_fmuls;		// fmuls- multiply 6 stage
input		mul_sign_out;		// multiply sign output
input [10:0]	mul_exp_out;		// multiply exponent output
input [51:0]	mul_frac_out;		// multiply fraction output
input [4:0]	add_exc_out;		// add pipe result- exception flags
input		a6stg_fcmpop;		// compare- add 6 stage
input [1:0]	add_cc_out;		// add pipe result- condition
input [1:0]	add_fcc_out;		// add pipe input fcc passed through
input		a6stg_dbl_dst;		// float double result- add 6 stage
input		a6stg_sng_dst;		// float single result- add 6 stage
input		a6stg_long_dst;		// 64bit integer result- add 6 stage
input		a6stg_int_dst;		// 32bit integer result- add 6 stage
input		add_sign_out;		// add sign output
input [10:0]	add_exp_out;		// add exponent output
input [63:0]	add_frac_out;		// add fraction output
input		rclk;		// global clock

output [144:0]	fp_cpx_data_ca;		// FPU result to CPX

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


wire [63:0]	add_out;
wire [63:0]	mul_out;
wire [63:0]	div_out;
wire [7:0]	fp_cpx_data_ca_84_77_in;
wire [76:0]	fp_cpx_data_ca_76_0_in;
wire [7:0]	fp_cpx_data_ca_84_77;
wire [76:0]	fp_cpx_data_ca_76_0;
wire [144:0]	fp_cpx_data_ca;


wire se_l;

//Previously missing wires
wire        clk;

assign se_l = ~se;

clken_buf  ckbuf_out_dp (
  .clk(clk),
  .rclk(rclk),
  .enb_l(1'b0),
  .tmb_l(se_l)
  );

///////////////////////////////////////////////////////////////////////////////
//
//      Add pipe output.
//
///////////////////////////////////////////////////////////////////////////////

assign add_out[63:0]= ({64{a6stg_dbl_dst}}
			    & {add_sign_out, add_exp_out[10:0],
				add_frac_out[62:11]})
		| ({64{a6stg_sng_dst}}
			    & {add_sign_out, add_exp_out[7:0],
				add_frac_out[62:40], 32'b0})
		| ({64{a6stg_long_dst}}
			    & add_frac_out[63:0])
		| ({64{a6stg_int_dst}}
			    & {add_frac_out[63:32], 32'b0});


///////////////////////////////////////////////////////////////////////////////
//
//	Multiply output.
//
///////////////////////////////////////////////////////////////////////////////

assign mul_out[63:0]= ({64{m6stg_fmul_dbl_dst}}
			    & {mul_sign_out, mul_exp_out[10:0],
				mul_frac_out[51:0]})
		| ({64{m6stg_fmuls}}
			    & {mul_sign_out, mul_exp_out[7:0],
				mul_frac_out[51:29], 32'b0});


///////////////////////////////////////////////////////////////////////////////
//
//	Divide output.
//
///////////////////////////////////////////////////////////////////////////////

assign div_out[63:0]= ({64{d8stg_fdivd}}
			    & {div_sign_out, div_exp_out[10:0],
				div_frac_out[51:0]})
		| ({64{d8stg_fdivs}}
			    & {div_sign_out, div_exp_out[7:0],
				div_frac_out[51:29], 32'b0});


///////////////////////////////////////////////////////////////////////////////
//
//	Choose the output data.
//
//	Input to the CPX data (CA) stage.
//
///////////////////////////////////////////////////////////////////////////////

assign fp_cpx_data_ca_84_77_in[7:0]= ({8{(|dest_rdy)}}
			    & {1'b1, 4'b1000, 1'b0, req_thread[1:0]});

assign fp_cpx_data_ca_76_0_in[76:0]= ({77{dest_rdy[2]}}
			    & {div_exc_out[4:0], 8'b0, div_out[63:0]})
		| ({77{dest_rdy[1]}}
			    & {mul_exc_out[4:0], 8'b0, mul_out[63:0]})
		| ({77{dest_rdy[0]}}
			    & {add_exc_out[4:0], 2'b0, a6stg_fcmpop,
				add_cc_out[1:0], add_fcc_out[1:0], 1'b0,
				add_out[63:0]});

dff_s #(8) i_fp_cpx_data_ca_84_77 (
	.din	(fp_cpx_data_ca_84_77_in[7:0]),
	.clk    (clk),

        .q      (fp_cpx_data_ca_84_77[7:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dff_s #(77) i_fp_cpx_data_ca_76_0 (
	.din	(fp_cpx_data_ca_76_0_in[76:0]),
	.clk    (clk),

        .q      (fp_cpx_data_ca_76_0[76:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign fp_cpx_data_ca[144:0]= {fp_cpx_data_ca_84_77[7:3],
				3'b0,
				fp_cpx_data_ca_84_77[2:0],
				57'b0,
				fp_cpx_data_ca_76_0[76:0]};


endmodule


// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_rptr_macros.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
module fpu_bufrpt_grp64 (
	in,
	out
);
	
	input [63:0] in;
	output [63:0] out;

	assign out[63:0] = in[63:0];

endmodule

module fpu_bufrpt_grp32 (
	in,
	out
);

	input [31:0] in;
	output [31:0] out;

	assign out[31:0] = in[31:0];

endmodule

// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_rptr_groups.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================

module fpu_rptr_groups (
	inq_in1,
	inq_in2,
	inq_id,
	inq_op,
	inq_rnd_mode,
	inq_in1_50_0_neq_0,
	inq_in1_53_0_neq_0,
	inq_in1_53_32_neq_0,
	inq_in1_exp_eq_0,
	inq_in1_exp_neq_ffs,
	inq_in2_50_0_neq_0,
	inq_in2_53_0_neq_0,
	inq_in2_53_32_neq_0,
	inq_in2_exp_eq_0,
	inq_in2_exp_neq_ffs,
	ctu_tst_macrotest,
	ctu_tst_pre_grst_l,
	ctu_tst_scan_disable,
	ctu_tst_scanmode,
	ctu_tst_short_chain,
	global_shift_enable,
	grst_l,
	cluster_cken,
	se,
	arst_l,
	fpu_grst_l,
	fmul_clken_l,
	fdiv_clken_l,
	scan_manual_6,
	si,
	so_unbuf,
	pcx_fpio_data_px2,
	pcx_fpio_data_rdy_px2,
	fp_cpx_req_cq,
	fp_cpx_data_ca,
	inq_sram_din_unbuf,

	inq_in1_add_buf1,
	inq_in1_mul_buf1,
	inq_in1_div_buf1,
	inq_in2_add_buf1,
	inq_in2_mul_buf1,
	inq_in2_div_buf1,
	inq_id_add_buf1,
	inq_id_mul_buf1,
	inq_id_div_buf1,
	inq_op_add_buf1,
	inq_op_div_buf1,
	inq_op_mul_buf1,
	inq_rnd_mode_add_buf1,
	inq_rnd_mode_div_buf1,
	inq_rnd_mode_mul_buf1,
	inq_in1_50_0_neq_0_add_buf1,
	inq_in1_50_0_neq_0_mul_buf1,
	inq_in1_50_0_neq_0_div_buf1,
	inq_in1_53_0_neq_0_add_buf1,
	inq_in1_53_0_neq_0_mul_buf1,
	inq_in1_53_0_neq_0_div_buf1,
	inq_in1_53_32_neq_0_add_buf1,
	inq_in1_53_32_neq_0_mul_buf1,
	inq_in1_53_32_neq_0_div_buf1,
	inq_in1_exp_eq_0_add_buf1,
	inq_in1_exp_eq_0_mul_buf1,
	inq_in1_exp_eq_0_div_buf1,
	inq_in1_exp_neq_ffs_add_buf1,
	inq_in1_exp_neq_ffs_mul_buf1,
	inq_in1_exp_neq_ffs_div_buf1,
	inq_in2_50_0_neq_0_add_buf1,
	inq_in2_50_0_neq_0_mul_buf1,
	inq_in2_50_0_neq_0_div_buf1,
	inq_in2_53_0_neq_0_add_buf1,
	inq_in2_53_0_neq_0_mul_buf1,
	inq_in2_53_0_neq_0_div_buf1,
	inq_in2_53_32_neq_0_add_buf1,
	inq_in2_53_32_neq_0_mul_buf1,
	inq_in2_53_32_neq_0_div_buf1,
	inq_in2_exp_eq_0_add_buf1,
	inq_in2_exp_eq_0_mul_buf1,
	inq_in2_exp_eq_0_div_buf1,
	inq_in2_exp_neq_ffs_add_buf1,
	inq_in2_exp_neq_ffs_mul_buf1,
	inq_in2_exp_neq_ffs_div_buf1,
	ctu_tst_macrotest_buf1,
	ctu_tst_pre_grst_l_buf1,
	ctu_tst_scan_disable_buf1,
	ctu_tst_scanmode_buf1,
	ctu_tst_short_chain_buf1,
	global_shift_enable_buf1,
	grst_l_buf1,
	cluster_cken_buf1,
	se_add_exp_buf2,
	se_add_frac_buf2,
	se_out_buf2,
	se_mul64_buf2,
	se_cluster_header_buf2,
	se_in_buf3,
	se_mul_buf4,
	se_div_buf5,
	arst_l_div_buf2,
	arst_l_mul_buf2,
	arst_l_cluster_header_buf2,
	arst_l_in_buf3,
	arst_l_out_buf3,
	arst_l_add_buf4,
	fpu_grst_l_mul_buf1,
	fpu_grst_l_in_buf2,
	fpu_grst_l_add_buf3,
	fmul_clken_l_buf1,
	fdiv_clken_l_div_exp_buf1,
	fdiv_clken_l_div_frac_buf1,
	scan_manual_6_buf1,
	si_buf1,
	so,
	pcx_fpio_data_px2_buf1,
	pcx_fpio_data_rdy_px2_buf1,
	fp_cpx_req_cq_buf1,
	fp_cpx_data_ca_buf1,
	inq_sram_din_buf1
);

	input [63:0] inq_in1;
	input [63:0] inq_in2;
	input [4:0] inq_id;
	input [7:0] inq_op;
	input [1:0] inq_rnd_mode;
	input inq_in1_50_0_neq_0;
	input inq_in1_53_0_neq_0;
	input inq_in1_53_32_neq_0;
	input inq_in1_exp_eq_0;
	input inq_in1_exp_neq_ffs;
	input inq_in2_50_0_neq_0;
	input inq_in2_53_0_neq_0;
	input inq_in2_53_32_neq_0;
	input inq_in2_exp_eq_0;
	input inq_in2_exp_neq_ffs;

	input ctu_tst_macrotest;
	input ctu_tst_pre_grst_l;
	input ctu_tst_scan_disable;
	input ctu_tst_scanmode;
	input ctu_tst_short_chain;
	input global_shift_enable;

	input grst_l;
	input cluster_cken;

	input se;

	input arst_l;

	input fpu_grst_l;

	input fmul_clken_l;
	input fdiv_clken_l;

	input scan_manual_6;

	input si;
	input so_unbuf;

	input [123:0] pcx_fpio_data_px2;
	input pcx_fpio_data_rdy_px2;

	input [7:0] fp_cpx_req_cq;
	input [144:0] fp_cpx_data_ca;

	input [155:0] inq_sram_din_unbuf;

	output [63:0] inq_in1_add_buf1;
	output [63:0] inq_in1_mul_buf1;
	output [63:0] inq_in1_div_buf1;
	output [63:0] inq_in2_add_buf1;
	output [63:0] inq_in2_mul_buf1;
	output [63:0] inq_in2_div_buf1;
	output [4:0] inq_id_add_buf1;
	output [4:0] inq_id_mul_buf1;
	output [4:0] inq_id_div_buf1;
	output [7:0] inq_op_add_buf1;
	output [7:0] inq_op_mul_buf1;
	output [7:0] inq_op_div_buf1;
	output [1:0] inq_rnd_mode_add_buf1;
	output [1:0] inq_rnd_mode_mul_buf1;
	output [1:0] inq_rnd_mode_div_buf1;
	output inq_in1_50_0_neq_0_add_buf1;
	output inq_in1_50_0_neq_0_mul_buf1;
	output inq_in1_50_0_neq_0_div_buf1;
	output inq_in1_53_0_neq_0_add_buf1;
	output inq_in1_53_0_neq_0_mul_buf1;
	output inq_in1_53_0_neq_0_div_buf1;
	output inq_in1_53_32_neq_0_add_buf1;
	output inq_in1_53_32_neq_0_mul_buf1;
	output inq_in1_53_32_neq_0_div_buf1;
	output inq_in1_exp_eq_0_add_buf1;
	output inq_in1_exp_eq_0_mul_buf1;
	output inq_in1_exp_eq_0_div_buf1;
	output inq_in1_exp_neq_ffs_add_buf1;
	output inq_in1_exp_neq_ffs_mul_buf1;
	output inq_in1_exp_neq_ffs_div_buf1;
	output inq_in2_50_0_neq_0_add_buf1;
	output inq_in2_50_0_neq_0_mul_buf1;
	output inq_in2_50_0_neq_0_div_buf1;
	output inq_in2_53_0_neq_0_add_buf1;
	output inq_in2_53_0_neq_0_mul_buf1;
	output inq_in2_53_0_neq_0_div_buf1;
	output inq_in2_53_32_neq_0_add_buf1;
	output inq_in2_53_32_neq_0_mul_buf1;
	output inq_in2_53_32_neq_0_div_buf1;
	output inq_in2_exp_eq_0_add_buf1;
	output inq_in2_exp_eq_0_mul_buf1;
	output inq_in2_exp_eq_0_div_buf1;
	output inq_in2_exp_neq_ffs_add_buf1;
	output inq_in2_exp_neq_ffs_mul_buf1;
	output inq_in2_exp_neq_ffs_div_buf1;

	output ctu_tst_macrotest_buf1;
	output ctu_tst_pre_grst_l_buf1;
	output ctu_tst_scan_disable_buf1;
	output ctu_tst_scanmode_buf1;
	output ctu_tst_short_chain_buf1;
	output global_shift_enable_buf1;

	output grst_l_buf1;
	output cluster_cken_buf1;

	output se_add_exp_buf2;
	output se_add_frac_buf2;
	output se_out_buf2;
	output se_mul64_buf2;
	output se_cluster_header_buf2;
	output se_in_buf3;
	output se_mul_buf4;
	output se_div_buf5;

	output arst_l_div_buf2;
	output arst_l_mul_buf2;
	output arst_l_cluster_header_buf2;
	output arst_l_in_buf3;
	output arst_l_out_buf3;
	output arst_l_add_buf4;

	output fpu_grst_l_mul_buf1;
	output fpu_grst_l_in_buf2;
	output fpu_grst_l_add_buf3;

	output fmul_clken_l_buf1;
	output fdiv_clken_l_div_exp_buf1;
	output fdiv_clken_l_div_frac_buf1;

	output scan_manual_6_buf1;

	output si_buf1;
	output so;

	output [123:0] pcx_fpio_data_px2_buf1;
	output pcx_fpio_data_rdy_px2_buf1;

	output [7:0] fp_cpx_req_cq_buf1;
	output [144:0] fp_cpx_data_ca_buf1;

	output [155:0] inq_sram_din_buf1;

	wire [3:0] inq_id_add_buf1_unused;
	wire [2:0] inq_id_mul_buf1_unused;
	wire [4:0] inq_id_div_buf1_unused;

	wire [1:0] ctu_tst_buf1_lo_unused;

	wire [1:0] cluster_cken_buf1_unused;

	wire [1:0] se_mul64_buf2_unused;

	wire [2:0] arst_l_buf1_unused;

	wire [1:0] fdiv_clken_l_buf1_unused;

	wire [2:0] so_cluster_header_buf1_unused;
	wire [2:0] si_buf1_unused;

	wire [2:0] pcx_fpio_data_px2_buf1_unused;
	wire [5:0] fp_cpx_buf1_9_unused;

    //Previously missing wires
    wire        se_add_buf1;
    wire        se_mul64_buf1;
    wire        so_buf1;
    wire        se_buf1_unused;
    wire        se_add_buf2_unused;
    wire        arst_l_buf1;

	// inq_in1
	fpu_bufrpt_grp32 i_inq_in1_add_buf1_hi (
		.in (inq_in1[63:32]),
		.out (inq_in1_add_buf1[63:32])
	);
	fpu_bufrpt_grp32 i_inq_in1_add_buf1_lo (
		.in (inq_in1[31:0]),
		.out (inq_in1_add_buf1[31:0])
	);
	fpu_bufrpt_grp32 i_inq_in1_mul_buf1_hi (
		.in (inq_in1[63:32]),
		.out (inq_in1_mul_buf1[63:32])
	);
	fpu_bufrpt_grp32 i_inq_in1_mul_buf1_lo (
		.in (inq_in1[31:0]),
		.out (inq_in1_mul_buf1[31:0])
	);
	fpu_bufrpt_grp64 i_inq_in1_div_buf1 (
		.in (inq_in1[63:0]),
		.out (inq_in1_div_buf1[63:0])
	);

	// inq_in2
	fpu_bufrpt_grp32 i_inq_in2_add_buf1_hi (
		.in (inq_in2[63:32]),
		.out (inq_in2_add_buf1[63:32])
	);
	fpu_bufrpt_grp32 i_inq_in2_add_buf1_lo (
		.in (inq_in2[31:0]),
		.out (inq_in2_add_buf1[31:0])
	);
	fpu_bufrpt_grp32 i_inq_in2_mul_buf1_hi (
		.in (inq_in2[63:32]),
		.out (inq_in2_mul_buf1[63:32])
	);
	fpu_bufrpt_grp32 i_inq_in2_mul_buf1_lo (
		.in (inq_in2[31:0]),
		.out (inq_in2_mul_buf1[31:0])
	);
	fpu_bufrpt_grp64 i_inq_in2_div_buf1 (
		.in (inq_in2[63:0]),
		.out (inq_in2_div_buf1[63:0])
	);

	// group inq_*eq_*
	fpu_bufrpt_grp32 i_inq_id_add_buf1 (
		.in ({4'h0,
			se_out_buf2,
			arst_l_out_buf3,
			fpu_grst_l_in_buf2,
			inq_id[4:0],
			inq_op[7:0],
			inq_rnd_mode[1:0],
			inq_in1_50_0_neq_0,
			inq_in1_53_0_neq_0,
			inq_in1_53_32_neq_0,
			inq_in1_exp_eq_0,
			inq_in1_exp_neq_ffs,
			inq_in2_50_0_neq_0,
			inq_in2_53_0_neq_0,
			inq_in2_53_32_neq_0,
			inq_in2_exp_eq_0,
			inq_in2_exp_neq_ffs}),
		.out ({inq_id_add_buf1_unused[3:0],
			se_in_buf3,
			arst_l_add_buf4,
			fpu_grst_l_add_buf3,
			inq_id_add_buf1[4:0],
			inq_op_add_buf1[7:0],
			inq_rnd_mode_add_buf1[1:0],
			inq_in1_50_0_neq_0_add_buf1,
			inq_in1_53_0_neq_0_add_buf1,
			inq_in1_53_32_neq_0_add_buf1,
			inq_in1_exp_eq_0_add_buf1,
			inq_in1_exp_neq_ffs_add_buf1,
			inq_in2_50_0_neq_0_add_buf1,
			inq_in2_53_0_neq_0_add_buf1,
			inq_in2_53_32_neq_0_add_buf1,
			inq_in2_exp_eq_0_add_buf1,
			inq_in2_exp_neq_ffs_add_buf1})
	);

	fpu_bufrpt_grp32 i_inq_id_mul_buf1 (
		.in ({3'h0,
			se_in_buf3,
			arst_l_mul_buf2,
			fpu_grst_l_mul_buf1,
			fmul_clken_l,
			inq_id[4:0],
			inq_op[7:0],
			inq_rnd_mode[1:0],
			inq_in1_50_0_neq_0,
			inq_in1_53_0_neq_0,
			inq_in1_53_32_neq_0,
			inq_in1_exp_eq_0,
			inq_in1_exp_neq_ffs,
			inq_in2_50_0_neq_0,
			inq_in2_53_0_neq_0,
			inq_in2_53_32_neq_0,
			inq_in2_exp_eq_0,
			inq_in2_exp_neq_ffs}),
		.out ({inq_id_mul_buf1_unused[2:0],
			se_mul_buf4,
			arst_l_out_buf3,
			fpu_grst_l_in_buf2,
			fmul_clken_l_buf1,
			inq_id_mul_buf1[4:0],
			inq_op_mul_buf1[7:0],
			inq_rnd_mode_mul_buf1[1:0],
			inq_in1_50_0_neq_0_mul_buf1,
			inq_in1_53_0_neq_0_mul_buf1,
			inq_in1_53_32_neq_0_mul_buf1,
			inq_in1_exp_eq_0_mul_buf1,
			inq_in1_exp_neq_ffs_mul_buf1,
			inq_in2_50_0_neq_0_mul_buf1,
			inq_in2_53_0_neq_0_mul_buf1,
			inq_in2_53_32_neq_0_mul_buf1,
			inq_in2_exp_eq_0_mul_buf1,
			inq_in2_exp_neq_ffs_mul_buf1})
	);

	fpu_bufrpt_grp32 i_inq_id_div_buf1 (
		.in ({5'h00,
			se_mul_buf4,
			arst_l_mul_buf2,
			inq_id[4:0],
			inq_op[7:0],
			inq_rnd_mode[1:0],
			inq_in1_50_0_neq_0,
			inq_in1_53_0_neq_0,
			inq_in1_53_32_neq_0,
			inq_in1_exp_eq_0,
			inq_in1_exp_neq_ffs,
			inq_in2_50_0_neq_0,
			inq_in2_53_0_neq_0,
			inq_in2_53_32_neq_0,
			inq_in2_exp_eq_0,
			inq_in2_exp_neq_ffs}),
		.out ({inq_id_div_buf1_unused[4:0],
			se_div_buf5,
			arst_l_in_buf3,
			inq_id_div_buf1[4:0],
			inq_op_div_buf1[7:0],
			inq_rnd_mode_div_buf1[1:0],
			inq_in1_50_0_neq_0_div_buf1,
			inq_in1_53_0_neq_0_div_buf1,
			inq_in1_53_32_neq_0_div_buf1,
			inq_in1_exp_eq_0_div_buf1,
			inq_in1_exp_neq_ffs_div_buf1,
			inq_in2_50_0_neq_0_div_buf1,
			inq_in2_53_0_neq_0_div_buf1,
			inq_in2_53_32_neq_0_div_buf1,
			inq_in2_exp_eq_0_div_buf1,
			inq_in2_exp_neq_ffs_div_buf1})
	);

	// buffer ctu_tst signals
	fpu_bufrpt_grp4 i_ctu_tst_buf1_hi (
		.in ({ctu_tst_short_chain,
			ctu_tst_macrotest,
			ctu_tst_scan_disable,
			ctu_tst_pre_grst_l}),
		.out ({ctu_tst_short_chain_buf1,
			ctu_tst_macrotest_buf1,
			ctu_tst_scan_disable_buf1,
			ctu_tst_pre_grst_l_buf1})
	);

	fpu_bufrpt_grp4 i_ctu_tst_buf1_lo (
		.in ({ctu_tst_scanmode,
			global_shift_enable,
			2'b00}),
		.out ({ctu_tst_scanmode_buf1,
			global_shift_enable_buf1,
			ctu_tst_buf1_lo_unused[1:0]})
	);

	// buffer cluster_header inputs
	fpu_bufrpt_grp4 i_cluster_cken_buf1 (
		.in ({cluster_cken,
			grst_l,
			2'b00}),
		.out ({cluster_cken_buf1,
			grst_l_buf1,
			cluster_cken_buf1_unused[1:0]})
	);

	// buffers for se (scan enable driven from test_stub_scan)
	fpu_bufrpt_grp4 i_se_buf1 (
		.in ({se,
			se,
			so_unbuf,
			1'b0}),
		.out ({se_add_buf1,
			se_mul64_buf1,
			so_buf1,
			se_buf1_unused})
	);

	fpu_bufrpt_grp4 i_se_add_buf2 (
		.in ({se_add_buf1,
			se_add_buf1,
			se_add_buf1,
			1'b0}),
		.out ({se_add_exp_buf2,
			se_add_frac_buf2,
			se_out_buf2,
			se_add_buf2_unused})
	);

	fpu_bufrpt_grp4 i_se_mul64_buf2 (
		.in ({se_mul64_buf1,
			se_mul64_buf1,
			2'b00}),
		.out ({se_mul64_buf2,
			se_cluster_header_buf2,
			se_mul64_buf2_unused[1:0]})
	);

	// buffers for arst_l, also use to buffer fpu_grst_l
	fpu_bufrpt_grp4 i_arst_l_buf1 (
		.in ({arst_l,
			3'b000}),
		.out ({arst_l_buf1,
			arst_l_buf1_unused[2:0]})
	);

	fpu_bufrpt_grp4 i_arst_l_buf2 (
		.in ({arst_l_buf1,
			arst_l_buf1,
			arst_l_buf1,
			fpu_grst_l}),
		.out ({arst_l_mul_buf2,
			arst_l_cluster_header_buf2,
			arst_l_div_buf2,
			fpu_grst_l_mul_buf1})
	);

	// buffers for fdiv_clken_l
	fpu_bufrpt_grp4 i_fdiv_clken_l_buf1 (
		.in ({fdiv_clken_l,
			fdiv_clken_l,
			2'b00}),
		.out ({fdiv_clken_l_div_exp_buf1,
			fdiv_clken_l_div_frac_buf1,
			fdiv_clken_l_buf1_unused[1:0]})
	);

	// buffer scan_out from cluster_header (internal driver 2X) to test_stub (long_chain_so_0)
	fpu_bufrpt_grp4 i_so_cluster_header_buf1 (
		.in ({scan_manual_6,
			3'b000}),
		.out ({scan_manual_6_buf1,
			so_cluster_header_buf1_unused[2:0]})
	);

	// buffer si at FPU cluster right edge
	fpu_bufrpt_grp4 i_si_buf1 (
		.in ({si,
			3'b000}),
		.out ({si_buf1,
			si_buf1_unused[2:0]})
	);

	// pcx_fpio* signals buffered for mintiming
	fpu_rptr_pcx_fpio_grp16 i_pcx_fpio_buf1_0 (
		.in ({pcx_fpio_data_px2[108],
			pcx_fpio_data_px2[109],
			pcx_fpio_data_px2[110],
			pcx_fpio_data_px2[111],
			pcx_fpio_data_px2[112],
			pcx_fpio_data_px2[113],
			pcx_fpio_data_px2[114],
			pcx_fpio_data_px2[115],
			pcx_fpio_data_px2[116],
			pcx_fpio_data_px2[117],
			pcx_fpio_data_px2[118],
			pcx_fpio_data_px2[119],
			pcx_fpio_data_px2[120],
			pcx_fpio_data_px2[121],
			pcx_fpio_data_px2[122],
			pcx_fpio_data_px2[123]}),
		.out ({pcx_fpio_data_px2_buf1[108],
			pcx_fpio_data_px2_buf1[109],
			pcx_fpio_data_px2_buf1[110],
			pcx_fpio_data_px2_buf1[111],
			pcx_fpio_data_px2_buf1[112],
			pcx_fpio_data_px2_buf1[113],
			pcx_fpio_data_px2_buf1[114],
			pcx_fpio_data_px2_buf1[115],
			pcx_fpio_data_px2_buf1[116],
			pcx_fpio_data_px2_buf1[117],
			pcx_fpio_data_px2_buf1[118],
			pcx_fpio_data_px2_buf1[119],
			pcx_fpio_data_px2_buf1[120],
			pcx_fpio_data_px2_buf1[121],
			pcx_fpio_data_px2_buf1[122],
			pcx_fpio_data_px2_buf1[123]})
	);

	fpu_rptr_pcx_fpio_grp16 i_pcx_fpio_buf1_1 (
		.in ({pcx_fpio_data_px2[92],
			pcx_fpio_data_px2[93],
			pcx_fpio_data_px2[94],
			pcx_fpio_data_px2[95],
			pcx_fpio_data_px2[96],
			pcx_fpio_data_px2[97],
			pcx_fpio_data_px2[98],
			pcx_fpio_data_px2[99],
			pcx_fpio_data_px2[100],
			pcx_fpio_data_px2[101],
			pcx_fpio_data_px2[102],
			pcx_fpio_data_px2[103],
			pcx_fpio_data_px2[104],
			pcx_fpio_data_px2[105],
			pcx_fpio_data_px2[106],
			pcx_fpio_data_px2[107]}),
		.out ({pcx_fpio_data_px2_buf1[92],
			pcx_fpio_data_px2_buf1[93],
			pcx_fpio_data_px2_buf1[94],
			pcx_fpio_data_px2_buf1[95],
			pcx_fpio_data_px2_buf1[96],
			pcx_fpio_data_px2_buf1[97],
			pcx_fpio_data_px2_buf1[98],
			pcx_fpio_data_px2_buf1[99],
			pcx_fpio_data_px2_buf1[100],
			pcx_fpio_data_px2_buf1[101],
			pcx_fpio_data_px2_buf1[102],
			pcx_fpio_data_px2_buf1[103],
			pcx_fpio_data_px2_buf1[104],
			pcx_fpio_data_px2_buf1[105],
			pcx_fpio_data_px2_buf1[106],
			pcx_fpio_data_px2_buf1[107]})
	);

	fpu_rptr_pcx_fpio_grp16 i_pcx_fpio_buf1_2 (
		.in ({pcx_fpio_data_px2[76],
			pcx_fpio_data_px2[77],
			pcx_fpio_data_px2[78],
			pcx_fpio_data_px2[79],
			pcx_fpio_data_px2[80],
			pcx_fpio_data_px2[81],
			pcx_fpio_data_px2[82],
			pcx_fpio_data_px2[83],
			pcx_fpio_data_px2[84],
			pcx_fpio_data_px2[85],
			pcx_fpio_data_px2[86],
			pcx_fpio_data_px2[87],
			pcx_fpio_data_px2[88],
			pcx_fpio_data_px2[89],
			pcx_fpio_data_px2[90],
			pcx_fpio_data_px2[91]}),
		.out ({pcx_fpio_data_px2_buf1[76],
			pcx_fpio_data_px2_buf1[77],
			pcx_fpio_data_px2_buf1[78],
			pcx_fpio_data_px2_buf1[79],
			pcx_fpio_data_px2_buf1[80],
			pcx_fpio_data_px2_buf1[81],
			pcx_fpio_data_px2_buf1[82],
			pcx_fpio_data_px2_buf1[83],
			pcx_fpio_data_px2_buf1[84],
			pcx_fpio_data_px2_buf1[85],
			pcx_fpio_data_px2_buf1[86],
			pcx_fpio_data_px2_buf1[87],
			pcx_fpio_data_px2_buf1[88],
			pcx_fpio_data_px2_buf1[89],
			pcx_fpio_data_px2_buf1[90],
			pcx_fpio_data_px2_buf1[91]})
	);

	fpu_rptr_pcx_fpio_grp16 i_pcx_fpio_buf1_3 (
		.in ({pcx_fpio_data_px2[3:0],
			pcx_fpio_data_px2[64],
			pcx_fpio_data_px2[65],
			pcx_fpio_data_px2[66],
			pcx_fpio_data_px2[67],
			pcx_fpio_data_px2[68],
			pcx_fpio_data_px2[69],
			pcx_fpio_data_px2[70],
			pcx_fpio_data_px2[71],
			pcx_fpio_data_px2[72],
			pcx_fpio_data_px2[73],
			pcx_fpio_data_px2[74],
			pcx_fpio_data_px2[75]}),
		.out ({pcx_fpio_data_px2_buf1[3:0],
			pcx_fpio_data_px2_buf1[64],
			pcx_fpio_data_px2_buf1[65],
			pcx_fpio_data_px2_buf1[66],
			pcx_fpio_data_px2_buf1[67],
			pcx_fpio_data_px2_buf1[68],
			pcx_fpio_data_px2_buf1[69],
			pcx_fpio_data_px2_buf1[70],
			pcx_fpio_data_px2_buf1[71],
			pcx_fpio_data_px2_buf1[72],
			pcx_fpio_data_px2_buf1[73],
			pcx_fpio_data_px2_buf1[74],
			pcx_fpio_data_px2_buf1[75]})
	);

	fpu_rptr_pcx_fpio_grp16 i_pcx_fpio_buf1_4 (
		.in (pcx_fpio_data_px2[19:4]),
		.out (pcx_fpio_data_px2_buf1[19:4])
	);

	fpu_rptr_pcx_fpio_grp16 i_pcx_fpio_buf1_5 (
		.in (pcx_fpio_data_px2[35:20]),
		.out (pcx_fpio_data_px2_buf1[35:20])
	);

	fpu_rptr_pcx_fpio_grp16 i_pcx_fpio_buf1_6 (
		.in ({pcx_fpio_data_rdy_px2,
			pcx_fpio_data_px2[50:36]}),
		.out ({pcx_fpio_data_rdy_px2_buf1,
			pcx_fpio_data_px2_buf1[50:36]})
	);

	fpu_rptr_pcx_fpio_grp16 i_pcx_fpio_buf1_7 (
		.in ({3'b000,
			pcx_fpio_data_px2[63:51]}),
		.out ({pcx_fpio_data_px2_buf1_unused[2:0],
			pcx_fpio_data_px2_buf1[63:51]})
	);

	// buffer fp_cpx_* signals for mintiming
	fpu_rptr_fp_cpx_grp16 i_fp_cpx_buf1_0 (
		.in ({
			fp_cpx_data_ca[142],
			fp_cpx_data_ca[140],
			fp_cpx_data_ca[138],
			fp_cpx_data_ca[136],
			fp_cpx_data_ca[134],
			fp_cpx_data_ca[132],
			fp_cpx_data_ca[130],
			fp_cpx_data_ca[128],
			fp_cpx_req_cq[6],
			fp_cpx_req_cq[7],
			fp_cpx_req_cq[3],
			fp_cpx_req_cq[2],
			fp_cpx_req_cq[5],
			fp_cpx_req_cq[1],
			fp_cpx_req_cq[0],
			fp_cpx_req_cq[4]}),
		.out ({
			fp_cpx_data_ca_buf1[142],
			fp_cpx_data_ca_buf1[140],
			fp_cpx_data_ca_buf1[138],
			fp_cpx_data_ca_buf1[136],
			fp_cpx_data_ca_buf1[134],
			fp_cpx_data_ca_buf1[132],
			fp_cpx_data_ca_buf1[130],
			fp_cpx_data_ca_buf1[128],
			fp_cpx_req_cq_buf1[6],
			fp_cpx_req_cq_buf1[7],
			fp_cpx_req_cq_buf1[3],
			fp_cpx_req_cq_buf1[2],
			fp_cpx_req_cq_buf1[5],
			fp_cpx_req_cq_buf1[1],
			fp_cpx_req_cq_buf1[0],
			fp_cpx_req_cq_buf1[4]})
	);
	fpu_rptr_fp_cpx_grp16 i_fp_cpx_buf1_1 (
		.in ({
			fp_cpx_data_ca[34],
			fp_cpx_data_ca[36],
			fp_cpx_data_ca[38],
			fp_cpx_data_ca[40],
			fp_cpx_data_ca[42],
			fp_cpx_data_ca[44],
			fp_cpx_data_ca[46],
			fp_cpx_data_ca[48],
			fp_cpx_data_ca[50],
			fp_cpx_data_ca[52],
			fp_cpx_data_ca[54],
			fp_cpx_data_ca[56],
			fp_cpx_data_ca[58],
			fp_cpx_data_ca[60],
			fp_cpx_data_ca[62],
			fp_cpx_data_ca[144]}),
		.out ({
			fp_cpx_data_ca_buf1[34],
			fp_cpx_data_ca_buf1[36],
			fp_cpx_data_ca_buf1[38],
			fp_cpx_data_ca_buf1[40],
			fp_cpx_data_ca_buf1[42],
			fp_cpx_data_ca_buf1[44],
			fp_cpx_data_ca_buf1[46],
			fp_cpx_data_ca_buf1[48],
			fp_cpx_data_ca_buf1[50],
			fp_cpx_data_ca_buf1[52],
			fp_cpx_data_ca_buf1[54],
			fp_cpx_data_ca_buf1[56],
			fp_cpx_data_ca_buf1[58],
			fp_cpx_data_ca_buf1[60],
			fp_cpx_data_ca_buf1[62],
			fp_cpx_data_ca_buf1[144]})
	);
	fpu_rptr_fp_cpx_grp16 i_fp_cpx_buf1_2 (
		.in ({
			fp_cpx_data_ca[2],
			fp_cpx_data_ca[4],
			fp_cpx_data_ca[6],
			fp_cpx_data_ca[8],
			fp_cpx_data_ca[10],
			fp_cpx_data_ca[12],
			fp_cpx_data_ca[14],
			fp_cpx_data_ca[16],
			fp_cpx_data_ca[18],
			fp_cpx_data_ca[20],
			fp_cpx_data_ca[22],
			fp_cpx_data_ca[24],
			fp_cpx_data_ca[26],
			fp_cpx_data_ca[28],
			fp_cpx_data_ca[30],
			fp_cpx_data_ca[32]}),
		.out ({
			fp_cpx_data_ca_buf1[2],
			fp_cpx_data_ca_buf1[4],
			fp_cpx_data_ca_buf1[6],
			fp_cpx_data_ca_buf1[8],
			fp_cpx_data_ca_buf1[10],
			fp_cpx_data_ca_buf1[12],
			fp_cpx_data_ca_buf1[14],
			fp_cpx_data_ca_buf1[16],
			fp_cpx_data_ca_buf1[18],
			fp_cpx_data_ca_buf1[20],
			fp_cpx_data_ca_buf1[22],
			fp_cpx_data_ca_buf1[24],
			fp_cpx_data_ca_buf1[26],
			fp_cpx_data_ca_buf1[28],
			fp_cpx_data_ca_buf1[30],
			fp_cpx_data_ca_buf1[32]})
	);
	fpu_rptr_fp_cpx_grp16 i_fp_cpx_buf1_3 (
		.in ({
			fp_cpx_data_ca[31],
			fp_cpx_data_ca[27],
			fp_cpx_data_ca[23],
			fp_cpx_data_ca[25],
			fp_cpx_data_ca[21],
			fp_cpx_data_ca[17],
			fp_cpx_data_ca[19],
			fp_cpx_data_ca[15],
			fp_cpx_data_ca[11],
			fp_cpx_data_ca[13],
			fp_cpx_data_ca[9],
			fp_cpx_data_ca[5],
			fp_cpx_data_ca[7],
			fp_cpx_data_ca[3],
			fp_cpx_data_ca[0],
			fp_cpx_data_ca[1]}),
		.out ({
			fp_cpx_data_ca_buf1[31],
			fp_cpx_data_ca_buf1[27],
			fp_cpx_data_ca_buf1[23],
			fp_cpx_data_ca_buf1[25],
			fp_cpx_data_ca_buf1[21],
			fp_cpx_data_ca_buf1[17],
			fp_cpx_data_ca_buf1[19],
			fp_cpx_data_ca_buf1[15],
			fp_cpx_data_ca_buf1[11],
			fp_cpx_data_ca_buf1[13],
			fp_cpx_data_ca_buf1[9],
			fp_cpx_data_ca_buf1[5],
			fp_cpx_data_ca_buf1[7],
			fp_cpx_data_ca_buf1[3],
			fp_cpx_data_ca_buf1[0],
			fp_cpx_data_ca_buf1[1]})
	);
	fpu_rptr_fp_cpx_grp16 i_fp_cpx_buf1_4 (
		.in ({
			fp_cpx_data_ca[59],
			fp_cpx_data_ca[61],
			fp_cpx_data_ca[57],
			fp_cpx_data_ca[53],
			fp_cpx_data_ca[55],
			fp_cpx_data_ca[51],
			fp_cpx_data_ca[47],
			fp_cpx_data_ca[49],
			fp_cpx_data_ca[45],
			fp_cpx_data_ca[41],
			fp_cpx_data_ca[43],
			fp_cpx_data_ca[39],
			fp_cpx_data_ca[35],
			fp_cpx_data_ca[37],
			fp_cpx_data_ca[33],
			fp_cpx_data_ca[29]}),
		.out ({
			fp_cpx_data_ca_buf1[59],
			fp_cpx_data_ca_buf1[61],
			fp_cpx_data_ca_buf1[57],
			fp_cpx_data_ca_buf1[53],
			fp_cpx_data_ca_buf1[55],
			fp_cpx_data_ca_buf1[51],
			fp_cpx_data_ca_buf1[47],
			fp_cpx_data_ca_buf1[49],
			fp_cpx_data_ca_buf1[45],
			fp_cpx_data_ca_buf1[41],
			fp_cpx_data_ca_buf1[43],
			fp_cpx_data_ca_buf1[39],
			fp_cpx_data_ca_buf1[35],
			fp_cpx_data_ca_buf1[37],
			fp_cpx_data_ca_buf1[33],
			fp_cpx_data_ca_buf1[29]})
	);
	fpu_rptr_fp_cpx_grp16 i_fp_cpx_buf1_5 (
		.in ({
			fp_cpx_data_ca[113],
			fp_cpx_data_ca[117],
			fp_cpx_data_ca[121],
			fp_cpx_data_ca[119],
			fp_cpx_data_ca[123],
			fp_cpx_data_ca[127],
			fp_cpx_data_ca[125],
			fp_cpx_data_ca[129],
			fp_cpx_data_ca[133],
			fp_cpx_data_ca[131],
			fp_cpx_data_ca[135],
			fp_cpx_data_ca[139],
			fp_cpx_data_ca[137],
			fp_cpx_data_ca[141],
			fp_cpx_data_ca[143],
			fp_cpx_data_ca[63]}),
		.out ({
			fp_cpx_data_ca_buf1[113],
			fp_cpx_data_ca_buf1[117],
			fp_cpx_data_ca_buf1[121],
			fp_cpx_data_ca_buf1[119],
			fp_cpx_data_ca_buf1[123],
			fp_cpx_data_ca_buf1[127],
			fp_cpx_data_ca_buf1[125],
			fp_cpx_data_ca_buf1[129],
			fp_cpx_data_ca_buf1[133],
			fp_cpx_data_ca_buf1[131],
			fp_cpx_data_ca_buf1[135],
			fp_cpx_data_ca_buf1[139],
			fp_cpx_data_ca_buf1[137],
			fp_cpx_data_ca_buf1[141],
			fp_cpx_data_ca_buf1[143],
			fp_cpx_data_ca_buf1[63]})
	);
	fpu_rptr_fp_cpx_grp16 i_fp_cpx_buf1_6 (
		.in ({
			fp_cpx_data_ca[85],
			fp_cpx_data_ca[83],
			fp_cpx_data_ca[87],
			fp_cpx_data_ca[91],
			fp_cpx_data_ca[89],
			fp_cpx_data_ca[93],
			fp_cpx_data_ca[97],
			fp_cpx_data_ca[95],
			fp_cpx_data_ca[99],
			fp_cpx_data_ca[103],
			fp_cpx_data_ca[101],
			fp_cpx_data_ca[105],
			fp_cpx_data_ca[109],
			fp_cpx_data_ca[107],
			fp_cpx_data_ca[111],
			fp_cpx_data_ca[115]}),
		.out ({
			fp_cpx_data_ca_buf1[85],
			fp_cpx_data_ca_buf1[83],
			fp_cpx_data_ca_buf1[87],
			fp_cpx_data_ca_buf1[91],
			fp_cpx_data_ca_buf1[89],
			fp_cpx_data_ca_buf1[93],
			fp_cpx_data_ca_buf1[97],
			fp_cpx_data_ca_buf1[95],
			fp_cpx_data_ca_buf1[99],
			fp_cpx_data_ca_buf1[103],
			fp_cpx_data_ca_buf1[101],
			fp_cpx_data_ca_buf1[105],
			fp_cpx_data_ca_buf1[109],
			fp_cpx_data_ca_buf1[107],
			fp_cpx_data_ca_buf1[111],
			fp_cpx_data_ca_buf1[115]})
	);
	fpu_rptr_fp_cpx_grp16 i_fp_cpx_buf1_7 (
		.in ({
			fp_cpx_data_ca[114],
			fp_cpx_data_ca[116],
			fp_cpx_data_ca[118],
			fp_cpx_data_ca[120],
			fp_cpx_data_ca[122],
			fp_cpx_data_ca[124],
			fp_cpx_data_ca[126],
			fp_cpx_data_ca[65],
			fp_cpx_data_ca[67],
			fp_cpx_data_ca[69],
			fp_cpx_data_ca[73],
			fp_cpx_data_ca[71],
			fp_cpx_data_ca[75],
			fp_cpx_data_ca[79],
			fp_cpx_data_ca[77],
			fp_cpx_data_ca[81]}),
		.out ({
			fp_cpx_data_ca_buf1[114],
			fp_cpx_data_ca_buf1[116],
			fp_cpx_data_ca_buf1[118],
			fp_cpx_data_ca_buf1[120],
			fp_cpx_data_ca_buf1[122],
			fp_cpx_data_ca_buf1[124],
			fp_cpx_data_ca_buf1[126],
			fp_cpx_data_ca_buf1[65],
			fp_cpx_data_ca_buf1[67],
			fp_cpx_data_ca_buf1[69],
			fp_cpx_data_ca_buf1[73],
			fp_cpx_data_ca_buf1[71],
			fp_cpx_data_ca_buf1[75],
			fp_cpx_data_ca_buf1[79],
			fp_cpx_data_ca_buf1[77],
			fp_cpx_data_ca_buf1[81]})
	);
	fpu_rptr_fp_cpx_grp16 i_fp_cpx_buf1_8 (
		.in ({
			fp_cpx_data_ca[82],
			fp_cpx_data_ca[84],
			fp_cpx_data_ca[86],
			fp_cpx_data_ca[88],
			fp_cpx_data_ca[90],
			fp_cpx_data_ca[92],
			fp_cpx_data_ca[94],
			fp_cpx_data_ca[96],
			fp_cpx_data_ca[98],
			fp_cpx_data_ca[100],
			fp_cpx_data_ca[102],
			fp_cpx_data_ca[104],
			fp_cpx_data_ca[106],
			fp_cpx_data_ca[108],
			fp_cpx_data_ca[110],
			fp_cpx_data_ca[112]}),
		.out ({
			fp_cpx_data_ca_buf1[82],
			fp_cpx_data_ca_buf1[84],
			fp_cpx_data_ca_buf1[86],
			fp_cpx_data_ca_buf1[88],
			fp_cpx_data_ca_buf1[90],
			fp_cpx_data_ca_buf1[92],
			fp_cpx_data_ca_buf1[94],
			fp_cpx_data_ca_buf1[96],
			fp_cpx_data_ca_buf1[98],
			fp_cpx_data_ca_buf1[100],
			fp_cpx_data_ca_buf1[102],
			fp_cpx_data_ca_buf1[104],
			fp_cpx_data_ca_buf1[106],
			fp_cpx_data_ca_buf1[108],
			fp_cpx_data_ca_buf1[110],
			fp_cpx_data_ca_buf1[112]})
	);
	fpu_rptr_fp_cpx_grp16 i_fp_cpx_buf1_9 (
		.in ({
			6'b000000,
			so_buf1,
			fp_cpx_data_ca[64],
			fp_cpx_data_ca[66],
			fp_cpx_data_ca[68],
			fp_cpx_data_ca[70],
			fp_cpx_data_ca[72],
			fp_cpx_data_ca[74],
			fp_cpx_data_ca[76],
			fp_cpx_data_ca[78],
			fp_cpx_data_ca[80]}),
		.out ({
			fp_cpx_buf1_9_unused[5:0],
			so,
			fp_cpx_data_ca_buf1[64],
			fp_cpx_data_ca_buf1[66],
			fp_cpx_data_ca_buf1[68],
			fp_cpx_data_ca_buf1[70],
			fp_cpx_data_ca_buf1[72],
			fp_cpx_data_ca_buf1[74],
			fp_cpx_data_ca_buf1[76],
			fp_cpx_data_ca_buf1[78],
			fp_cpx_data_ca_buf1[80]})
	);

	// buffer fpu_in_dp outputs  (sram din inputs) for mintiming

	fpu_rptr_inq i_inq_sram_din_buf1 (
		.in (inq_sram_din_unbuf[155:0]),
		.out (inq_sram_din_buf1[155:0])
	);

endmodule

// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_rptr_min_global.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================

// global (bufrpt_grp4 used to buffer rst_l, scan signals) and mintiming buffers in this file 

// fpu_bufrpt_grp4: 4 bit wide to fix max trans time for scan, reset
module fpu_bufrpt_grp4 (
	in,
	out
);
	
	input [3:0] in;
	output [3:0] out;

	assign out[3:0] = in[3:0];

endmodule


// fpu_rptr_fp_cpx_grp16: 16 bit wide vertical MSB top mintiming buffer for fp_cpx*
module fpu_rptr_fp_cpx_grp16 (
	in,
	out
);

	input [15:0] in;
	output [15:0] out;

	assign out[15:0] = in[15:0];

endmodule


// fpu_rptr_pcx_fpio_grp16: 16 bit wide mintming vertical buffer, MSB top, for pcx_fpio*
// use minbuf_5x -> buf_5x -> buf_30x
module fpu_rptr_pcx_fpio_grp16 (
	in,
	out
);

	input [15:0] in;
	output [15:0] out;

	assign out[15:0] = in[15:0];

endmodule

// fpu_rptr_inq: 156 bits wide mintiming buffer for inq_sram din (matched to inq_sram bit order)
module fpu_rptr_inq (
	in,
	out
);
	
	input [155:0] in;
	output [155:0] out;

	assign out[155:0] = in[155:0];

endmodule

