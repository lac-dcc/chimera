//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.1 (lin64) Build 1846317 Fri Apr 14 18:54:47 MDT 2017
//Date        : Sun Jul 23 23:40:12 2017
//Host        : nuc6i7 running 64-bit Ubuntu 16.04.2 LTS
//Command     : generate_target bd_mem_wrapper.bd
//Design      : bd_mem_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_mem_wrapper
   (AHB1_haddr,
    AHB1_hburst,
    AHB1_hprot,
    AHB1_hrdata,
    AHB1_hready_in,
    AHB1_hready_out,
    AHB1_hresp,
    AHB1_hsize,
    AHB1_htrans,
    AHB1_hwdata,
    AHB1_hwrite,
    AHB1_sel,
    AHB2_haddr,
    AHB2_hburst,
    AHB2_hprot,
    AHB2_hrdata,
    AHB2_hready_in,
    AHB2_hready_out,
    AHB2_hresp,
    AHB2_hsize,
    AHB2_htrans,
    AHB2_hwdata,
    AHB2_hwrite,
    AHB2_sel,
    clk_ref_i,
    cpu_clk,
    cpu_rstn,
    ddr3_addr,
    ddr3_ba,
    ddr3_cas_n,
    ddr3_ck_n,
    ddr3_ck_p,
    ddr3_cke,
    ddr3_dm,
    ddr3_dq,
    ddr3_dqs_n,
    ddr3_dqs_p,
    ddr3_odt,
    ddr3_ras_n,
    ddr3_reset_n,
    ddr3_we_n,
    sys_clk_i,
    sys_rst);
  input [31:0]AHB1_haddr;
  input [2:0]AHB1_hburst;
  input [3:0]AHB1_hprot;
  output [31:0]AHB1_hrdata;
  input AHB1_hready_in;
  output AHB1_hready_out;
  output AHB1_hresp;
  input [2:0]AHB1_hsize;
  input [1:0]AHB1_htrans;
  input [31:0]AHB1_hwdata;
  input AHB1_hwrite;
  input AHB1_sel;
  input [31:0]AHB2_haddr;
  input [2:0]AHB2_hburst;
  input [3:0]AHB2_hprot;
  output [31:0]AHB2_hrdata;
  input AHB2_hready_in;
  output AHB2_hready_out;
  output AHB2_hresp;
  input [2:0]AHB2_hsize;
  input [1:0]AHB2_htrans;
  input [31:0]AHB2_hwdata;
  input AHB2_hwrite;
  input AHB2_sel;
  input clk_ref_i;
  input cpu_clk;
  input cpu_rstn;
  output [12:0]ddr3_addr;
  output [2:0]ddr3_ba;
  output ddr3_cas_n;
  output [0:0]ddr3_ck_n;
  output [0:0]ddr3_ck_p;
  output [0:0]ddr3_cke;
  output [1:0]ddr3_dm;
  inout [15:0]ddr3_dq;
  inout [1:0]ddr3_dqs_n;
  inout [1:0]ddr3_dqs_p;
  output [0:0]ddr3_odt;
  output ddr3_ras_n;
  output ddr3_reset_n;
  output ddr3_we_n;
  input sys_clk_i;
  input sys_rst;

  wire [31:0]AHB1_haddr;
  wire [2:0]AHB1_hburst;
  wire [3:0]AHB1_hprot;
  wire [31:0]AHB1_hrdata;
  wire AHB1_hready_in;
  wire AHB1_hready_out;
  wire AHB1_hresp;
  wire [2:0]AHB1_hsize;
  wire [1:0]AHB1_htrans;
  wire [31:0]AHB1_hwdata;
  wire AHB1_hwrite;
  wire AHB1_sel;
  wire [31:0]AHB2_haddr;
  wire [2:0]AHB2_hburst;
  wire [3:0]AHB2_hprot;
  wire [31:0]AHB2_hrdata;
  wire AHB2_hready_in;
  wire AHB2_hready_out;
  wire AHB2_hresp;
  wire [2:0]AHB2_hsize;
  wire [1:0]AHB2_htrans;
  wire [31:0]AHB2_hwdata;
  wire AHB2_hwrite;
  wire AHB2_sel;
  wire clk_ref_i;
  wire cpu_clk;
  wire cpu_rstn;
  wire [12:0]ddr3_addr;
  wire [2:0]ddr3_ba;
  wire ddr3_cas_n;
  wire [0:0]ddr3_ck_n;
  wire [0:0]ddr3_ck_p;
  wire [0:0]ddr3_cke;
  wire [1:0]ddr3_dm;
  wire [15:0]ddr3_dq;
  wire [1:0]ddr3_dqs_n;
  wire [1:0]ddr3_dqs_p;
  wire [0:0]ddr3_odt;
  wire ddr3_ras_n;
  wire ddr3_reset_n;
  wire ddr3_we_n;
  wire sys_clk_i;
  wire sys_rst;

  bd_mem bd_mem_i
       (.AHB1_haddr(AHB1_haddr),
        .AHB1_hburst(AHB1_hburst),
        .AHB1_hprot(AHB1_hprot),
        .AHB1_hrdata(AHB1_hrdata),
        .AHB1_hready_in(AHB1_hready_in),
        .AHB1_hready_out(AHB1_hready_out),
        .AHB1_hresp(AHB1_hresp),
        .AHB1_hsize(AHB1_hsize),
        .AHB1_htrans(AHB1_htrans),
        .AHB1_hwdata(AHB1_hwdata),
        .AHB1_hwrite(AHB1_hwrite),
        .AHB1_sel(AHB1_sel),
        .AHB2_haddr(AHB2_haddr),
        .AHB2_hburst(AHB2_hburst),
        .AHB2_hprot(AHB2_hprot),
        .AHB2_hrdata(AHB2_hrdata),
        .AHB2_hready_in(AHB2_hready_in),
        .AHB2_hready_out(AHB2_hready_out),
        .AHB2_hresp(AHB2_hresp),
        .AHB2_hsize(AHB2_hsize),
        .AHB2_htrans(AHB2_htrans),
        .AHB2_hwdata(AHB2_hwdata),
        .AHB2_hwrite(AHB2_hwrite),
        .AHB2_sel(AHB2_sel),
        .clk_ref_i(clk_ref_i),
        .cpu_clk(cpu_clk),
        .cpu_rstn(cpu_rstn),
        .ddr3_addr(ddr3_addr),
        .ddr3_ba(ddr3_ba),
        .ddr3_cas_n(ddr3_cas_n),
        .ddr3_ck_n(ddr3_ck_n),
        .ddr3_ck_p(ddr3_ck_p),
        .ddr3_cke(ddr3_cke),
        .ddr3_dm(ddr3_dm),
        .ddr3_dq(ddr3_dq),
        .ddr3_dqs_n(ddr3_dqs_n),
        .ddr3_dqs_p(ddr3_dqs_p),
        .ddr3_odt(ddr3_odt),
        .ddr3_ras_n(ddr3_ras_n),
        .ddr3_reset_n(ddr3_reset_n),
        .ddr3_we_n(ddr3_we_n),
        .sys_clk_i(sys_clk_i),
        .sys_rst(sys_rst));
endmodule
