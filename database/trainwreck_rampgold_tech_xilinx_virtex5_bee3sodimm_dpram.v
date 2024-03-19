//---------------------------------------------------------------------------   
// File:        dpram.v
// Author:      Zhangxi Tan
// Description: Modified for 2GB dual-rank SODIMMs 
//------------------------------------------------------------------------------  

`timescale 1ns / 1ps

// © Copyright Microsoft Corporation, 2008

module dpram(CLK, in, out, ra, wa, we);
    input CLK;
    input in;
    output out;
    input [4:0] ra;
    input [4:0] wa;
    input we;


 RAM32X1D #(.INIT(32'h00000000)) rbx (
  .DPO(out), //data addressed by DPRA
  .SPO(),    //data addressed by A (not used)
  .A0(wa[0]), // Port A address[0] input bit
  .A1(wa[1]), // Port A address[1] input bit
  .A2(wa[2]), // Port A address[2] input bit
  .A3(wa[3]), // Port A address[3] input bit
  .A4(wa[4]), // Port A address[4] input bit
//  .A5(wa[5]), // Port A address[5] input bit
  .D(in),     // writes to location addressed by A
  .DPRA0(ra[0]), // Port B address[0] input bit
  .DPRA1(ra[1]), // Port B address[1] input bit
  .DPRA2(ra[2]), // Port B address[2] input bit
  .DPRA3(ra[3]), // Port B address[3] input bit
  .DPRA4(ra[4]), // Port B address[4] input bit
//  .DPRA5(ra[5]), // Port B address[5] input bit
  .WCLK(CLK), // Port A write clock input
  .WE(we) // Port A write enable input
 );

endmodule
