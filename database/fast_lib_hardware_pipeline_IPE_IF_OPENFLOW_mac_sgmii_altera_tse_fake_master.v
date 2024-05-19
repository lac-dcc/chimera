// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

// (C) 2001-2015 Altera Corporation. All rights reserved.
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


// 
// ALTERA Confidential and Proprietary
// Copyright 2007 (c) Altera Corporation
// All rights reserved
//
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------

//Legal Notice: (C)2007 Altera Corporation. All rights reserved.  Your
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

`timescale 1ps/1ps
module altera_tse_fake_master(
   // Clock and reset
   input clk,
   input reset,

   // Avalon MM master interface
   output [8:0] phy_mgmt_address,
   output phy_mgmt_read,
   input [31:0] phy_mgmt_readdata,
   output phy_mgmt_write,
   output reg [31:0] phy_mgmt_writedata,
   input phy_mgmt_waitrequest,

   // Serial data loopback control
   input sd_loopback
);

//////////////////////////////////internal registers and paramaters//////////////////////////////////
reg [1:0] state;
reg [1:0] next_state;
reg sd_loopback_r1, sd_loopback_r2;
reg bit_event;

localparam IDLE = 2'b0 ;
localparam WRITE_DATA = 2'b1;

////////////////////to detect the toggled data from sd_loopback //////////
always @ (posedge clk or posedge reset)
begin
   if (reset)
   begin
      sd_loopback_r1 <= 1'b0;
      sd_loopback_r2 <= 1'b0;
   end
   else
   begin
	   sd_loopback_r2 <= sd_loopback_r1;
	   sd_loopback_r1 <= sd_loopback;
   end
end 

// bit_event is the bit to remember there is an event happening at the sd_loopback
// and used to trigger IDLE -> WRITE_DATA state transition
// This bit is only cleared during WRITE_DATA -> IDLE transition and make sure that
// phy_mgmt_writedata[0] value is equal to sd_loopback data
// This is to ensure that our Avalon MM write transaction is always in sync with sd_loopback value
always @ (posedge clk or posedge reset)
begin 
   if (reset)
   begin
      bit_event <= 0;
   end
   else
   begin
      if ( sd_loopback_r1 != sd_loopback_r2)
      begin 
         bit_event <= 1'b1;
      end
      else
      begin
         if (next_state == IDLE && state == WRITE_DATA && phy_mgmt_writedata[0] == sd_loopback)
         begin 
            bit_event <= 1'b0;
         end
      end 
   end
end
   
// State machine
always @ (posedge clk or posedge reset)
begin 
     if (reset)
        state <= IDLE;
     else 
        state <= next_state;
end 

// next_state logic
always @ (*)
begin
	case (state)
	IDLE:
   begin
		if (bit_event)
		   next_state = WRITE_DATA;
		else 
		   next_state = IDLE;
   end
	WRITE_DATA:
   begin
		if (!phy_mgmt_waitrequest)
			next_state = IDLE;
		else
		   next_state = WRITE_DATA;
   end
	default : next_state = IDLE;
	endcase
end

// Connection to PHYIP (Avalon MM master signals)
assign phy_mgmt_write = (state == WRITE_DATA)? 1'b1 : 1'b0;
assign phy_mgmt_read = 1'b0;
assign phy_mgmt_address = (state == WRITE_DATA) ? 9'h61 : 9'h0;

always @(posedge clk or posedge reset)
begin
   if (reset)
   begin
      phy_mgmt_writedata <= 32'b0;
   end
   else
   begin
      if (state == IDLE && next_state == WRITE_DATA)
      begin
         phy_mgmt_writedata <= {31'b0, sd_loopback};
      end
      else if (state == WRITE_DATA && next_state == IDLE)
      begin
         phy_mgmt_writedata <= 32'b0;
      end
   end
end

endmodule 
