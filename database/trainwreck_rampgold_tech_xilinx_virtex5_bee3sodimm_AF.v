//---------------------------------------------------------------------------   
// File:        AF.v
// Author:      Zhangxi Tan
// Description: Modified for 2GB dual-rank SODIMMs 
//------------------------------------------------------------------------------  

`timescale 1ns / 1ps

// © Copyright Microsoft Corporation, 2008


module AF(
 input [26:0] WD,       //write addr: 14(row)+ 3(bank)+ 10-2 (col) + 1 (rank) +  1 R/W
 input WEn,
 input WriteClk,
 output Full,

 output [26:0] RD,
 output Empty,
 input REn,
 input RDClk,
 input Reset
 );

wire[31:0] do_out, di_in;

assign RD = do_out[26:0];
assign di_in = {5'h0, WD};


FIFO18_36 #(
.SIM_MODE("SAFE"), // Simulation: "SAFE" vs. "FAST", see "Synthesis and Simulation Design Guide" for details
.ALMOST_FULL_OFFSET(9'h180), // Sets almost full threshold
.ALMOST_EMPTY_OFFSET(9'h100), // Sets the almost empty threshold
.DO_REG(1), // Enable output register (0 or 1)
// Must be 1 if EN_SYN = "FALSE"
.EN_SYN("FALSE"), // Specifies FIFO as Asynchronous ("FALSE")
// or Synchronous ("TRUE")
.FIRST_WORD_FALL_THROUGH("TRUE") // Sets the FIFO FWFT to "TRUE" or "FALSE"
) FIFO18_36_inst (
.ALMOSTEMPTY(), // 1-bit almost empty output flag
.ALMOSTFULL(Full), // 1-bit almost full output flag
.DO(do_out), // 32-bit data output
.DOP(), // 4-bit parity data output
.EMPTY(Empty), // 1-bit empty output flag
.FULL(), // 1-bit full output flag
.RDCOUNT(), // 9-bit read count output
.RDERR(), // 1-bit read error output
.WRCOUNT(), // 9-bit write count output
.WRERR(), // 1-bit write error
.DI(di_in), // 32-bit data input
.DIP(4'b0), // 4-bit parity input
.RDCLK(RDClk), // 1-bit read clock input
.RDEN(REn), // 1-bit read enable input
.RST(Reset), // 1-bit reset input
.WRCLK(WriteClk), // 1-bit write clock input
.WREN(WEn) // 1-bit write enable input
);

endmodule