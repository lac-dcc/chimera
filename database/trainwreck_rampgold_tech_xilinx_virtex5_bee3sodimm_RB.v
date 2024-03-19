//---------------------------------------------------------------------------   
// File:        RB.v
// Author:      Zhangxi Tan
// Description: Modified for 2GB dual-rank SODIMMs 
//------------------------------------------------------------------------------  

`timescale 1ns / 1ps

// © Copyright Microsoft Corporation, 2008

module RB (
//The read buffer.  Consists of two 512x72 FIFOs.  Checks ECC over MD.

 input Reset, //asynchronous, assert for 5 cycles
 
//memory side
 input [127:0] MD, //Data from RAMs
 input WRen, //WriteEnable
 input WRclk, //WriteClock
 output Full,  //Can't write when full
 
//user side
 output [143:0] RD, //User data
 input Rclk,
 input RDen,
 output SingleError,
 output DoubleError,
 output Empty //Can't read when empty
 );

wire SEA, SEB; //single error
wire DEA, DEB; //double error
wire [1:0] Emptyx;

assign Empty = |Emptyx;

assign SingleError = SEA | SEB;
assign DoubleError = DEA | DEB;
    
FIFO36_72 #(
.SIM_MODE("SAFE"), // Simulation: "SAFE" vs. "FAST", see "Synthesis and Simulation Design Guide" for details
.ALMOST_FULL_OFFSET(9'h180), // Sets almost full threshold
.ALMOST_EMPTY_OFFSET(9'h080), // Sets the almost empty threshold
.DO_REG(1), // Enable output register (0 or 1)
// Must be 1 if EN_SYN = "FALSE"
.EN_ECC_READ("TRUE"), // Enable ECC decoder, "TRUE" or "FALSE"
.EN_ECC_WRITE("TRUE"), // Enable ECC encoder, "TRUE" or "FALSE"
.EN_SYN("FALSE"), // Specifies FIFO as Asynchronous ("FALSE")
// or Synchronous ("TRUE")
.FIRST_WORD_FALL_THROUGH("TRUE") // Sets the FIFO FWFT to "TRUE" or "FALSE"

) RBfifoA (
.ALMOSTEMPTY(), // 1-bit almost empty output flag
.ALMOSTFULL(Full), // 1-bit almost full output flag
.DBITERR(DEA), // 1-bit double bit error status output
.DO(RD[63:0]), // 64-bit data output
.DOP(RD[135:128]), // 8-bit parity data output
.ECCPARITY(), // 8-bit generated error correction parity
.EMPTY(Emptyx[0]), // 1-bit empty output flag
.FULL(), // 1-bit full output flag
.RDCOUNT(), // 9-bit read count output
.RDERR(), // 1-bit read error output
.SBITERR(SEA), // 1-bit single bit error status output
.WRCOUNT(), // 9-bit write count output
.WRERR(), // 1-bit write error
.DI(MD[63:0]), // 64-bit data input
.DIP(8'b0), // 8-bit parity input
.RDCLK(Rclk), // 1-bit read clock input
.RDEN(RDen), // 1-bit read enable input
.RST(Reset), // 1-bit reset input
.WRCLK(WRclk), // 1-bit write clock input
.WREN(WRen) // 1-bit write enable input
);

FIFO36_72 #(
.SIM_MODE("SAFE"), // Simulation: "SAFE" vs. "FAST", see "Synthesis and Simulation Design Guide" for details
.ALMOST_FULL_OFFSET(9'h180), // Sets almost full threshold
.ALMOST_EMPTY_OFFSET(9'h080), // Sets the almost empty threshold
.DO_REG(1), // Enable output register (0 or 1)
// Must be 1 if EN_SYN = "FALSE"
.EN_ECC_READ("TRUE"), // Enable ECC decoder, "TRUE" or "FALSE"
.EN_ECC_WRITE("TRUE"), // Enable ECC encoder, "TRUE" or "FALSE"
.EN_SYN("FALSE"), // Specifies FIFO as Asynchronous ("FALSE")
// or Synchronous ("TRUE")
.FIRST_WORD_FALL_THROUGH("TRUE") // Sets the FIFO FWFT to "TRUE" or "FALSE"

) RBfifoB (
.ALMOSTEMPTY(), // 1-bit almost empty output flag
.ALMOSTFULL(), // 1-bit almost full output flag
.DBITERR(DEB), // 1-bit double bit error status output
.DO(RD[127:64]), // 64-bit data output
.DOP(RD[143:136]), // 8-bit parity data output
.ECCPARITY(), // 8-bit generated error correction parity
.EMPTY(Emptyx[1]), // 1-bit empty output flag
.FULL(), // 1-bit full output flag
.RDCOUNT(), // 9-bit read count output
.RDERR(), // 1-bit read error output
.SBITERR(SEB), // 1-bit single bit error status output
.WRCOUNT(), // 9-bit write count output
.WRERR(), // 1-bit write error
.DI(MD[127:64]), // 64-bit data input
.DIP(8'b0), // 4-bit parity input
.RDCLK(Rclk), // 1-bit read clock input
.RDEN(RDen), // 1-bit read enable input
.RST(Reset), // 1-bit reset input
.WRCLK(WRclk), // 1-bit write clock input
.WREN(WRen) // 1-bit write enable input
);

endmodule