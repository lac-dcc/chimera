// This program was cloned from: https://github.com/Xilinx/XilinxUnisimLibrary
// License: Apache License 2.0

///////////////////////////////////////////////////////////////////////////////
//     Copyright (c) 1995/2014 Xilinx, Inc.
// 
//    Licensed under the Apache License, Version 2.0 (the "License");
//    you may not use this file except in compliance with the License.
//    You may obtain a copy of the License at
// 
//        http://www.apache.org/licenses/LICENSE-2.0
// 
//    Unless required by applicable law or agreed to in writing, software
//    distributed under the License is distributed on an "AS IS" BASIS,
//    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//    See the License for the specific language governing permissions and
//    limitations under the License.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 2014.3
//  \   \         Description : Xilinx Unified Simulation Library Component
//  /   /                  Static Dual Port Synchronous RAM 256-Deep by 1-Wide
// /___/   /\     Filename : RAM256X1D.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//    07/02/12 - Initial version, from RAM128X1D
//    10/22/14 - Added #1 to $finish (CR 808642).
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module RAM256X1D #(
`ifdef XIL_TIMING
    parameter LOC = "UNPLACED",
`endif
    parameter [255:0] INIT = 256'h0,
    parameter [0:0] IS_WCLK_INVERTED = 1'b0
) (
    output DPO,
    output SPO,

    input [7:0] A,
    input D,
    input [7:0] DPRA,
    input WCLK,
    input WE
);

// define constants
  localparam MODULE_NAME = "RAM256X1D";

  reg trig_attr = 1'b0;

`ifdef XIL_ATTR_TEST
  reg attr_test = 1'b1;
`else
  reg attr_test = 1'b0;
`endif
  reg attr_err = 1'b0;

  wire IS_WCLK_INVERTED_BIN;

  wire D_in;
  wire WCLK_in;
  wire WE_in;
  wire [7:0] A_in;
  wire [7:0] DPRA_in;

  assign IS_WCLK_INVERTED_BIN = IS_WCLK_INVERTED;

`ifdef XIL_TIMING
  wire D_dly;
  wire WCLK_dly;
  wire WE_dly;
  wire [7:0] A_dly;
    
  reg notifier;

  wire sh_clk_en_p;
  wire sh_clk_en_n;
  wire sh_we_clk_en_p;
  wire sh_we_clk_en_n;

  assign A_in = A_dly;
  assign D_in = D_dly;
  assign WCLK_in = WCLK_dly ^ IS_WCLK_INVERTED_BIN;
  assign WE_in = (WE === 1'bz) || WE_dly; // rv 1
`else
  assign A_in = A;
  assign D_in = D;
  assign WCLK_in = WCLK ^ IS_WCLK_INVERTED_BIN;
  assign WE_in = (WE === 1'bz) || WE; // rv 1
`endif
  assign DPRA_in = DPRA;
    
  reg  [255:0] mem;

  initial 
    mem = INIT;

  assign DPO = mem[DPRA_in];
  assign SPO = mem[A_in];

  always @(posedge WCLK_in) 
    if (WE_in == 1'b1) mem[A_in] <= #100 D_in;
    
`ifdef XIL_TIMING
  always @(notifier) mem[A_in] <= 1'bx;
  assign sh_clk_en_p = ~IS_WCLK_INVERTED_BIN;
  assign sh_clk_en_n = IS_WCLK_INVERTED_BIN;
  assign sh_we_clk_en_p = WE_in && ~IS_WCLK_INVERTED_BIN;
  assign sh_we_clk_en_n = WE_in && IS_WCLK_INVERTED_BIN;
    
  specify
  (WCLK => DPO) = (0:0:0, 0:0:0);
  (WCLK => SPO) = (0:0:0, 0:0:0);
  (A[0] => SPO) = (0:0:0, 0:0:0);
  (A[1] => SPO) = (0:0:0, 0:0:0);
  (A[2] => SPO) = (0:0:0, 0:0:0);
  (A[3] => SPO) = (0:0:0, 0:0:0);
  (A[4] => SPO) = (0:0:0, 0:0:0);
  (A[5] => SPO) = (0:0:0, 0:0:0);
  (A[6] => SPO) = (0:0:0, 0:0:0);
  (A[7] => SPO) = (0:0:0, 0:0:0);
  (DPRA[0] => DPO) = (0:0:0, 0:0:0);
  (DPRA[1] => DPO) = (0:0:0, 0:0:0);
  (DPRA[2] => DPO) = (0:0:0, 0:0:0);
  (DPRA[3] => DPO) = (0:0:0, 0:0:0);
  (DPRA[4] => DPO) = (0:0:0, 0:0:0);
  (DPRA[5] => DPO) = (0:0:0, 0:0:0);
  (DPRA[6] => DPO) = (0:0:0, 0:0:0);
  (DPRA[7] => DPO) = (0:0:0, 0:0:0);
  $period (negedge WCLK &&& WE, 0:0:0, notifier);
  $period (posedge WCLK &&& WE, 0:0:0, notifier);
  $setuphold (negedge WCLK, negedge A[0], 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[0]);
  $setuphold (negedge WCLK, negedge A[1], 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[1]);
  $setuphold (negedge WCLK, negedge A[2], 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[2]);
  $setuphold (negedge WCLK, negedge A[3], 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[3]);
  $setuphold (negedge WCLK, negedge A[4], 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[4]);
  $setuphold (negedge WCLK, negedge A[5], 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[5]);
  $setuphold (negedge WCLK, negedge A[6], 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[6]);
  $setuphold (negedge WCLK, negedge A[7], 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[7]);
  $setuphold (negedge WCLK, negedge D, 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,D_dly);
  $setuphold (negedge WCLK, negedge WE, 0:0:0, 0:0:0, notifier,sh_clk_en_n,sh_clk_en_n,WCLK_dly,WE_dly);
  $setuphold (negedge WCLK, posedge A[0], 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[0]);
  $setuphold (negedge WCLK, posedge A[1], 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[1]);
  $setuphold (negedge WCLK, posedge A[2], 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[2]);
  $setuphold (negedge WCLK, posedge A[3], 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[3]);
  $setuphold (negedge WCLK, posedge A[4], 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[4]);
  $setuphold (negedge WCLK, posedge A[5], 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[5]);
  $setuphold (negedge WCLK, posedge A[6], 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[6]);
  $setuphold (negedge WCLK, posedge A[7], 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[7]);
  $setuphold (negedge WCLK, posedge D, 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,D_dly);
  $setuphold (negedge WCLK, posedge WE, 0:0:0, 0:0:0, notifier,sh_clk_en_n,sh_clk_en_n,WCLK_dly,WE_dly);
  $setuphold (posedge WCLK, negedge A[0], 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[0]);
  $setuphold (posedge WCLK, negedge A[1], 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[1]);
  $setuphold (posedge WCLK, negedge A[2], 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[2]);
  $setuphold (posedge WCLK, negedge A[3], 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[3]);
  $setuphold (posedge WCLK, negedge A[4], 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[4]);
  $setuphold (posedge WCLK, negedge A[5], 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[5]);
  $setuphold (posedge WCLK, negedge A[6], 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[6]);
  $setuphold (posedge WCLK, negedge A[7], 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[7]);
  $setuphold (posedge WCLK, negedge D, 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,D_dly);
  $setuphold (posedge WCLK, negedge WE, 0:0:0, 0:0:0, notifier,sh_clk_en_p,sh_clk_en_p,WCLK_dly,WE_dly);
  $setuphold (posedge WCLK, posedge A[0], 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[0]);
  $setuphold (posedge WCLK, posedge A[1], 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[1]);
  $setuphold (posedge WCLK, posedge A[2], 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[2]);
  $setuphold (posedge WCLK, posedge A[3], 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[3]);
  $setuphold (posedge WCLK, posedge A[4], 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[4]);
  $setuphold (posedge WCLK, posedge A[5], 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[5]);
  $setuphold (posedge WCLK, posedge A[6], 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[6]);
  $setuphold (posedge WCLK, posedge A[7], 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[7]);
  $setuphold (posedge WCLK, posedge D, 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,D_dly);
  $setuphold (posedge WCLK, posedge WE, 0:0:0, 0:0:0, notifier,sh_clk_en_p,sh_clk_en_p,WCLK_dly,WE_dly);
   specparam PATHPULSE$ = 0;
  endspecify
`endif
    
endmodule

`endcelldefine
