`default_nettype none

// ** Single-Port RAM **
// LATTICE, Memory Usage Guide for iCE40 Devices
// Technical Note TN1250, June 2016
// Appendix A. Standard HDL Code References, p20
module ram #(
    parameter addr_width =  8,
    parameter data_width =  8,
    parameter ROMFILE = ""
  ) (
    input wire clk,
    input wire [addr_width-1:0] addr,
    input wire write_en,
    input wire [data_width-1:0] din,
    output reg [data_width-1:0] dout
  );

  reg [data_width-1:0] mem [(1<<addr_width)-1:0];

  initial begin
      if( ROMFILE !=0 ) $readmemh(ROMFILE, mem);
  end

  always @(posedge clk)
  begin
    if (write_en)
      mem[(addr)] <= din;
    dout = mem[addr];
  end
endmodule