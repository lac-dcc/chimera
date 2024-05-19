// This program was cloned from: https://github.com/hipersys-team/lightning
// License: MIT License

// Asymmetric port RAM
// Read Wider than Write. Read Statement in loop
// (c) Xilinx, Inc. 2023
//
// asym_ram_sdp_read_wider.v
//
// note for any readers in the lightning project: this
// is a template from xilinx's website, hence the super weird
// formatting. however because it's a template we have a good
// guarantee this can be synthesized to a block ram. i've added
// a few comments in here to get this through the verilator linter.

`resetall
`timescale 1ns / 1ps
`default_nettype wire

module asym_ram_sdp_read_wider (clkA, clkB, enaA, weA, enaB, addrA, addrB, diA, doB);
parameter WIDTHA = 4;
parameter SIZEA = 1024;
parameter ADDRWIDTHA = 10;

parameter WIDTHB = 16;
parameter SIZEB = 256;
parameter ADDRWIDTHB = 8;
input clkA;
input clkB;
input weA;
input enaA, enaB;
input [ADDRWIDTHA-1:0] addrA;
input [ADDRWIDTHB-1:0] addrB;
input [WIDTHA-1:0] diA;
output [WIDTHB-1:0] doB;
`define max(a,b) {(a) > (b) ? (a) : (b)}
`define min(a,b) {(a) < (b) ? (a) : (b)}

function integer log2;
input integer value;
reg [31:0] shifted;
integer res;
begin
  if (value < 2)
  log2 = value;
 else
 begin
  shifted = value-1;
  for (res=0; shifted>0; res=res+1)
   shifted = shifted>>1;
  log2 = res;
 end
end
endfunction

/* verilator lint_off WIDTHCONCAT */
localparam maxSIZE = `max(SIZEA, SIZEB);
localparam maxWIDTH = `max(WIDTHA, WIDTHB);
localparam minWIDTH = `min(WIDTHA, WIDTHB);

localparam RATIO = maxWIDTH / minWIDTH;
localparam log2RATIO = log2(RATIO);

reg [minWIDTH-1:0] RAM [0:maxSIZE-1];
reg [WIDTHB-1:0] readB;

always @(posedge clkA)
begin
 if (enaA) begin
  if (weA)
   RAM[addrA] <= diA;
 end
end

always @(posedge clkB)
begin : ramread
 integer i;
 reg [log2RATIO-1:0] lsbaddr;
 if (enaB) begin
  for (i = 0; i < RATIO; i = i+1) begin
   lsbaddr = log2RATIO'(i);
   readB[(i+1)*minWIDTH-1 -: minWIDTH] <= RAM[{addrB, lsbaddr}];
  end
 end
end
assign doB = readB;

endmodule

`default_nettype none
`resetall