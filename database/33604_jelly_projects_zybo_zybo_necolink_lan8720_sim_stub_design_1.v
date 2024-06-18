// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1 ns / 1 ps

module design_1
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    out_clk100,
    out_clk125,
    out_clk200,
    out_clk250,
    out_reset,
    core_clk,
    core_reset,
    in_clk125,
    in_reset);
   inout [14:0]DDR_addr;
   inout [2:0]DDR_ba;
   inout DDR_cas_n;
   inout DDR_ck_n;
   inout DDR_ck_p;
   inout DDR_cke;
   inout DDR_cs_n;
   inout [3:0]DDR_dm;
   inout [31:0]DDR_dq;
   inout [3:0]DDR_dqs_n;
   inout [3:0]DDR_dqs_p;
   inout DDR_odt;
   inout DDR_ras_n;
   inout DDR_reset_n;
   inout DDR_we_n;
   inout FIXED_IO_ddr_vrn;
   inout FIXED_IO_ddr_vrp;
   inout [53:0]FIXED_IO_mio;
   inout FIXED_IO_ps_clk;
   inout FIXED_IO_ps_porb;
   inout FIXED_IO_ps_srstb;
   output out_clk100;
   output out_clk125;
   output out_clk200;
   output out_clk250;
   output core_clk;
   output core_reset;
   output [0:0]out_reset;
   input in_clk125;
   input in_reset;
  
   
	reg			reset  ;//= 1;
	reg			clk100 ;//= 1'b1;
	reg			clk125 ;//= 1'b1;
	reg			clk200 ;//= 1'b1;
	reg			clk250 ;//= 1'b1;
	
	
	assign out_reset             = reset;
	assign out_clk100            = clk100;
	assign out_clk125            = clk125;
	assign out_clk200            = clk200;
	assign out_clk250            = clk250;

   assign core_reset  = reset;
   assign core_clk    = clk200;

   
endmodule
