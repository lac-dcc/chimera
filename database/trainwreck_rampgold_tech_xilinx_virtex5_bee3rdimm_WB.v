//---------------------------------------------------------------------------   
// File:        WB.v
// Author:      Zhangxi Tan
// Description: Modified for 2GB dual-rank SODIMMs 
//------------------------------------------------------------------------------  

`timescale 1ns / 1ps

// © Copyright Microsoft Corporation, 2008

module WB #(parameter WRITEECC="TRUE")(
//The write buffer.  Consists of two 512x72 FIFOs.  Generates ECC over WD.

 input Reset, //asynchronous, assert for 5 cycles
//user side
 input [143:0] WD, //Write data
 input WRen, //WriteEnable
 input WRclk, //WriteClock
 output Full,  //Can't write when full
 
//memory side
 output [143:0] MD, //Data to RAMs
 input Rclk,
 input RDen,
 output Empty //Can't read when empty
 );
    
FIFO36_72 #(
.SIM_MODE("SAFE"), // Simulation: "SAFE" vs. "FAST", see "Synthesis and Simulation Design Guide" for details
.ALMOST_FULL_OFFSET(9'h080), // Sets almost full threshold
.ALMOST_EMPTY_OFFSET(9'h080), // Sets the almost empty threshold
.DO_REG(1), // Enable output register (0 or 1)
// Must be 1 if EN_SYN = "FALSE"
.EN_ECC_READ("TRUE"),   // Enable ECC decoder, "TRUE" or "FALSE"
.EN_ECC_WRITE(WRITEECC), // Enable ECC encoder, "TRUE" or "FALSE"
.EN_SYN("FALSE"), // Specifies FIFO as Asynchronous ("FALSE")
// or Synchronous ("TRUE")
.FIRST_WORD_FALL_THROUGH("TRUE") // Sets the FIFO FWFT to "TRUE" or "FALSE"

) WBfifoA (
.ALMOSTEMPTY(), // 1-bit almost empty output flag
.ALMOSTFULL(Full), // 1-bit almost full output flag
.DBITERR(), // 1-bit double bit error status output
.DO(MD[63:0]), // 64-bit data output
.DOP(MD[71:64]), // 4-bit parity data output
.ECCPARITY(), // 8-bit generated error correction parity
.EMPTY(Empty), // 1-bit empty output flag
.FULL(), // 1-bit full output flag
.RDCOUNT(), // 9-bit read count output
.RDERR(), // 1-bit read error output
.SBITERR(), // 1-bit single bit error status output
.WRCOUNT(), // 9-bit write count output
.WRERR(), // 1-bit write error
.DI(WD[63:0]), // 64-bit data input
.DIP(WD[135:128]), // 4-bit parity input
.RDCLK(Rclk), // 1-bit read clock input
.RDEN(RDen), // 1-bit read enable input
.RST(Reset), // 1-bit reset input
.WRCLK(WRclk), // 1-bit write clock input
.WREN(WRen) // 1-bit write enable input
);

FIFO36_72 #(
.SIM_MODE("SAFE"), // Simulation: "SAFE" vs. "FAST", see "Synthesis and Simulation Design Guide" for details
.ALMOST_FULL_OFFSET(9'h080), // Sets almost full threshold
.ALMOST_EMPTY_OFFSET(9'h080), // Sets the almost empty threshold
.DO_REG(1), // Enable output register (0 or 1)
// Must be 1 if EN_SYN = "FALSE"
.EN_ECC_READ("TRUE"), // Enable ECC decoder, "TRUE" or "FALSE"
.EN_ECC_WRITE(WRITEECC), // Enable ECC encoder, "TRUE" or "FALSE"
.EN_SYN("FALSE"), // Specifies FIFO as Asynchronous ("FALSE")
// or Synchronous ("TRUE")
.FIRST_WORD_FALL_THROUGH("TRUE") // Sets the FIFO FWFT to "TRUE" or "FALSE"

) WBfifoB (
.ALMOSTEMPTY(), // 1-bit almost empty output flag
.ALMOSTFULL(), // 1-bit almost full output flag
.DBITERR(), // 1-bit double bit error status output
.DO(MD[135:72]), // 64-bit data output
.DOP(MD[143:136]), // 4-bit parity data output
.ECCPARITY(), // 8-bit generated error correction parity
.EMPTY(), // 1-bit empty output flag
.FULL(), // 1-bit full output flag
.RDCOUNT(), // 9-bit read count output
.RDERR(), // 1-bit read error output
.SBITERR(), // 1-bit single bit error status output
.WRCOUNT(), // 9-bit write count output
.WRERR(), // 1-bit write error
.DI(WD[127:64]), // 64-bit data input
.DIP(WD[143:136]), // 4-bit parity input
.RDCLK(Rclk), // 1-bit read clock input
.RDEN(RDen), // 1-bit read enable input
.RST(Reset), // 1-bit reset input
.WRCLK(WRclk), // 1-bit write clock input
.WREN(WRen) // 1-bit write enable input
);
endmodule