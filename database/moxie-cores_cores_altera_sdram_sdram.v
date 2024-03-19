////////////////////////////////////////////////////////////////////////////////
// Author: lsilvest
//
// Create Date:   02/03/2008
//
// Module Name:    sdram
//
// Target Devices: Altera DE2
//
// Tool versions:  Quartus II 7.2 Web Edition
//
//
// Description: This module is the top level module for the SDRAM controller.
//              It instantiates the PLL, testbench and controller.
//
////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2008 Authors
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
////////////////////////////////////////////////////////////////////////////////
module sdram
  (
   input CLOCK_50,
   input [0:0] SW,
   output [1:0] LEDG,
   output [0:0] LEDR,
   // SDRAM signals
   output [11:0] DRAM_ADDR,
   output DRAM_BA_0,
   output DRAM_BA_1,
   output DRAM_CAS_N,
   output DRAM_CKE,
   output DRAM_CLK,
   output DRAM_CS_N,
   inout [15:0] DRAM_DQ,
   output DRAM_LDQM,
   output DRAM_UDQM,
   output DRAM_RAS_N,
   output DRAM_WE_N
   );

  wire clk0; // 133.333 MHZ
  wire clk1; // 50 MHZ user side 
  wire clk2; // 133.333 MHZ -3ns
  wire [1:0] dram_bank;
  wire 	     dll_locked;

  wire [21:0] addr_i;
  wire [31:0] dat_i;
  wire [31:0] dat_o;
  wire 	      we_i;
  wire 	      ack_o;
  wire 	      stb_i;
  wire 	      cyc_i;
  wire        rst_i;

  reg [31:0]  counter;


  assign LEDG[0] = dll_locked;
  assign {DRAM_BA_1, DRAM_BA_0} = dram_bank;
  assign rst_i = 1'b0;


  pll pll_inst
    (
     .areset(SW),
     .inclk0(CLOCK_50),
     .c0(clk0),
     .c1(clk1),
     .c2(clk2),
     .locked (dll_locked)
     );


  sdram_controller sdram_controller_inst 
    (
     .clk_i(clk0),
     .dram_clk_i(clk2),
     .rst_i(rst_i),
     .dll_locked(dll_locked),
     // all sdram signals
     .dram_addr(DRAM_ADDR),
     .dram_bank(dram_bank),
     .dram_cas_n(DRAM_CAS_N),
     .dram_cke(DRAM_CKE),
     .dram_clk(DRAM_CLK),
     .dram_cs_n(DRAM_CS_N),
     .dram_dq(DRAM_DQ),
     .dram_ldqm(DRAM_LDQM),
     .dram_udqm(DRAM_UDQM),
     .dram_ras_n(DRAM_RAS_N),
     .dram_we_n(DRAM_WE_N),
     // wishbone bus
     .addr_i(addr_i),
     .dat_i(dat_i),
     .dat_o(dat_o),
     .we_i(we_i),
     .ack_o(ack_o),
     .stb_i(stb_i),
     .cyc_i(cyc_i)
     );


  sdram_rw rw_inst
    (
     .clk_i(clk1),
     .rst_i(rst_i),
     .addr_i(addr_i),
     .dat_i(dat_i),
     .dat_o(dat_o),
     .we_i(we_i),
     .ack_o(ack_o),
     .stb_i(stb_i),
     .cyc_i(cyc_i),
     .red_led(LEDR[0]),
     .green_led(LEDG[1])
     );


endmodule
