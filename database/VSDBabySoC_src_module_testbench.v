// This program was cloned from: https://github.com/manili/VSDBabySoC
// License: Apache License 2.0

`timescale 1ns / 1ps
`ifdef PRE_SYNTH_SIM
   `include "vsdbabysoc.v"
   `include "avsddac.v"
   `include "avsdpll.v"
   `include "rvmyth.v"
   `include "clk_gate.v"
`elsif POST_SYNTH_SIM
   `include "vsdbabysoc.synth.v"
   `include "avsddac.v"
   `include "avsdpll.v"
   `include "primitives.v"
   `include "sky130_fd_sc_hd.v"
`endif

module vsdbabysoc_tb;
   reg       reset;
   reg       VCO_IN;
   reg       ENb_CP;
   reg       ENb_VCO;
   reg       REF;
   reg  real VREFL;
   reg  real VREFH;
   wire real OUT;

   vsdbabysoc uut (
      .OUT(OUT),
      .reset(reset),
      .VCO_IN(VCO_IN),
      .ENb_CP(ENb_CP),
      .ENb_VCO(ENb_VCO),
      .REF(REF),
      // .VREFL(VREFL),
      .VREFH(VREFH)
   );

   initial begin
      reset = 0;
      VREFL = 0.0;
      VREFH = 3.3;
      {REF, ENb_VCO} = 0;
      VCO_IN = 1'b0 ;
      
      #20 reset = 1;
      #100 reset = 0;
   end
   
   initial begin
`ifdef PRE_SYNTH_SIM
      $dumpfile("pre_synth_sim.vcd");
`elsif POST_SYNTH_SIM
      $dumpfile("post_synth_sim.vcd");
`endif
      $dumpvars(0, vsdbabysoc_tb);
   end
 
   initial begin
      repeat(600) begin
         ENb_VCO = 1;
         #100 REF = ~REF;
         #(83.33/2) VCO_IN = ~VCO_IN;
      end
      $finish;
   end
   
endmodule