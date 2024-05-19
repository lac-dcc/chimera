// This program was cloned from: https://github.com/adumont/hrm-cpu
// License: GNU General Public License v3.0

`default_nettype none

// ** Single-Port RAM **
// LATTICE, Memory Usage Guide for iCE40 Devices
// Technical Note TN1250, June 2016
// Appendix A. Standard HDL Code References, p20
module PROG (din, Addr, write_en, clk, Data);
  parameter addr_width = 8;
  parameter data_width = 8;
  parameter PROGRAM = "dummy_prg.hex";

  input [addr_width-1:0] Addr;
  input [data_width-1:0] din;
  input write_en, clk;

  output [data_width-1:0] Data;

  reg [data_width-1:0] Data; // Register for output.
  reg [data_width-1:0] rom [(1<<addr_width)-1:0];

  initial begin
      if( PROGRAM !=0 ) $readmemh(PROGRAM, rom);
  end

  always @(posedge clk)
  begin
    if (write_en)
      rom[(Addr)] <= din;
    Data = rom[Addr]; // Output register controlled by clock.
  end
endmodule