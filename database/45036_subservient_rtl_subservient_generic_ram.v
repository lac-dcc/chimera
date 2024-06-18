// This program was cloned from: https://github.com/olofk/subservient
// License: Apache License 2.0

module subservient_generic_ram
  #(parameter depth = 0,
    parameter aw = $clog2(depth),
    parameter memfile = "")
   (input wire		i_clk,
    input wire		i_rst,
    //SRAM interface
    input wire [aw-1:0]	i_waddr,
    input wire [7:0]	i_wdata,
    input wire		i_wen,
    input wire [aw-1:0]	i_raddr,
    output reg [7:0]	o_rdata,
    input wire		i_ren);

   reg [7:0]	       mem [0:depth-1] /* verilator public */;

   always @(posedge i_clk) begin
      if (i_wen) mem[i_waddr]   <= i_wdata;
      o_rdata <= i_ren ? mem[i_raddr] : 8'bx;
   end

   initial
     if(|memfile) begin
	$display("Preloading %m from %s", memfile);
	$readmemh(memfile, mem);
     end
endmodule
