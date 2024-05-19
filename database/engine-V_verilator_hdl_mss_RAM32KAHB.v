// This program was cloned from: https://github.com/micro-FPGA/engine-V
// License: Apache License 2.0

/*
 * Copyright 2018 MicroFPGA UG
 * Apache 2.0 License
 */


module RAM32KAHB (
   maddr,
   mwdata,
   mrdata,
   mwrite,
   mread,
   mready,
   HADDR,
   HTRANS,
   HWRITE,
   HSIZE,
   HWDATA,
   HSEL,
   HMASTLOCK,
   HREADY_OUT,
   HREADY,
   HRDATA,
   HRESP,
   Clk);
 

input   [15:0] maddr; 
input   [7:0] mwdata; 
output   [7:0] mrdata; 
input   mwrite; 
input   mread; 
output   mready; 
output   [31:0] HADDR; 
output   [1:0] HTRANS; 
output   HWRITE; 
output   [1:0] HSIZE; 
output   [31:0] HWDATA; 
output   HSEL; 
output   HMASTLOCK; 
output   HREADY_OUT; 
input   HREADY; 
input   [31:0] HRDATA; 
input   HRESP; 
input   Clk; 

wire    [7:0] mrdata; 
wire    mready; 
wire    [31:0] HADDR; 
wire    [1:0] HTRANS; 
wire    HWRITE; 
wire    [1:0] HSIZE; 
wire    [31:0] HWDATA; 
wire    HSEL; 
wire    HMASTLOCK; 
wire    HREADY_OUT; 
reg     [7:0] mwdata_s; 

assign HREADY_OUT = HREADY; 
assign mready = HREADY; 

// 
assign HWDATA[31:16] = 16'h 0000; 

//  Latch write DATA 
assign HWDATA[15:8] = mwdata_s; 
assign HWDATA[7:0] = mwdata_s; 

always @(posedge Clk)
   begin : process_1
   mwdata_s <= mwdata;   
   end

assign HSIZE = 2'b 00; 
//  Byte transfers only
assign HSEL = 1'b 1; 
assign HTRANS[0] = 1'b 0; 
assign HTRANS[1] = mread | mwrite; 
assign HWRITE = mwrite; 
assign HADDR[0] = maddr[0]; 
assign HADDR[1] = 1'b 0; 
assign HADDR[15:2] = maddr[14:1]; 
assign HADDR[31:16] = 16'h 2000; 
//  eSRAM

//  input mux
assign mrdata = maddr[0] === 1'b 0 ? HRDATA[7:0] : 
	HRDATA[15:8]; 

endmodule // module RAM32KAHB

