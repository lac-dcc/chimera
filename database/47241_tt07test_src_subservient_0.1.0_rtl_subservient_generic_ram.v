// This program was cloned from: https://github.com/olofk/tt07test
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
    output wire [7:0]	o_rdata,
    input wire		i_ren);

   reg [7:0]	       mem [0:depth-1] /* verilator public */;

   reg		       r0;

   reg [7:0]	       rdata;

   assign o_rdata = r0 ? 8'd0 : rdata;
   
   always @(posedge i_clk)
     r0 <= &i_raddr[aw-1:2];
      
   always @(posedge i_clk) begin
      if (i_wen) mem[i_waddr]   <= i_wdata;
      rdata <= i_ren ? mem[i_raddr] : 8'bx;
   end

   initial
     if(|memfile) begin
	$display("Preloading %m from %s", memfile);
	$readmemh(memfile, mem);
     end
endmodule
