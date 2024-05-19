// This program was cloned from: https://github.com/combinatorylogic/soc
// License: MIT License

// A pipelined non-restoring integer division,
// output is valid in WIDTH/2 + 1 clock cycles.
// E.g.,  9 cycles for 16-bit, 17 cycles for 32-bit
//
// If timing is shitty, use div1.v for a twice as long pipeline.
//
// WIDTH: input width
module div_pipelined2(clk, rst, z, d,
                      quot, rem);
   parameter WIDTH = 32;
   localparam ZBITS = WIDTH*2;
   
   localparam DBITS = ZBITS/2;
   localparam STAGES = DBITS/2;
	
   input clk;
   input rst;
   input [WIDTH -1:0] z;
   input [DBITS -1:0] d;
   output [DBITS -1:0] quot;
   output [DBITS -1:0] rem;
   reg [DBITS-1:0]     quot;
   reg [DBITS-1:0]     rem;

   function [ZBITS:0] remainder;
      input [ZBITS:0]  rem_i; input [ZBITS:0]  d_i;
      begin
	 remainder = (rem_i[ZBITS])?({rem_i[ZBITS-1:0], 1'b0} + d_i):
	                            ({rem_i[ZBITS-1:0], 1'b0} - d_i);
      end
   endfunction // remainder
   
   function [ZBITS-1:0] remainder_final;
      input [ZBITS:0] rem_i; input [ZBITS:0] d_i;
      begin
	 remainder_final = (rem_i[ZBITS]?(rem_i + d_i):rem_i);
      end
   endfunction // remainder_final

   function [DBITS-1:0] quotient;
      input [DBITS-1:0] quot_i; input [ZBITS:0] rem_i;
      begin
	 quotient = {quot_i[DBITS-2:0], ~rem_i[ZBITS]};
      end
   endfunction

   reg [ZBITS:0]   d_stage  [STAGES:0];
   reg [DBITS-1:0] quot_stage  [STAGES:0];
   reg [ZBITS:0]   rem_stage  [STAGES:0];

   wire [ZBITS-1:0] quot_stage_wire  [STAGES:0];
   wire [ZBITS:0]   rem_stage_wire  [STAGES:0];

   wire [ZBITS:0]  rem_next;
   assign rem_next = remainder_final(rem_stage_wire[STAGES], d_stage[STAGES]);

   integer         stage, stage0;

   generate genvar stage1;
      for(stage1=0; stage1 <= STAGES; stage1=stage1+1) begin
         assign rem_stage_wire[stage1] = remainder(rem_stage[stage1], d_stage[stage1]);
         if (stage1>0)
           assign quot_stage_wire[stage1] = quotient(quot_stage[stage1], rem_stage[stage1]);
         else assign quot_stage_wire[stage1] = 0;
      end
   endgenerate
   
   always @(posedge clk)
     if (!rst) begin
        quot <= 0;
        rem <= 0;
        for (stage=0; stage <=STAGES; stage=stage+1) begin
           rem_stage[stage] <= 0;
           quot_stage[stage] <= 0;
           d_stage[stage] <= 0;
        end
     end  else begin
        d_stage[0] <= { 1'b0, d, { (ZBITS-DBITS){1'b0} } };
        rem_stage[0] <= z;
        quot_stage[0] <= 0;
        
        for(stage0=1; stage0 <= STAGES; stage0=stage0+1) begin
           d_stage[stage0] <= d_stage[stage0-1];
	   rem_stage[stage0] <= remainder(rem_stage_wire[stage0-1], d_stage[stage0-1]);
           quot_stage[stage0] <= quotient(quot_stage_wire[stage0-1], rem_stage_wire[stage0-1]);
        end

        quot <= quot_stage_wire[STAGES];
        rem <= rem_next[ZBITS-1:ZBITS-DBITS];
     end // else: !if(!rst)
      
endmodule

