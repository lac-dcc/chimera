// This program was cloned from: https://github.com/lmxyy/Computer-Architecture-Task-2
// License: MIT License

`ifdef mem_sim.v
`else
 `define mem_sim.v
// --------------------------------------------------------------------------------
 `include "defines.v"

module mem_sim
  (
   input wire 	     clk,
     
   input wire 	     if_ms_req_i,
   input wire [31:0] if_addr,

   input wire 	     mem_ms_req_i,
   input wire [31:0] mem_addr,
  
   input wire 	     ms_write_i,
   input wire [31:0] ms_write_data_i,
   input wire [3:0]  ms_write_mask_i,

   output reg 	     if_ms_rep_o,
   output reg [63:0] if_ms_rep_data_o,

   output reg 	     mem_ms_rep_o,
   output reg [63:0] mem_ms_rep_data_o
   );

   reg [`InstBus]    mem_data[0:`MemNumber];
   
   initial $readmemh("instr.data",mem_data);

   // always @ (mem_ms_req_i)
   //   $display("%b %h",mem_ms_req_i,mem_addr);
   
   
   always @ (*)
     begin
	if_ms_rep_o <= 0;
	if_ms_rep_data_o <= 0;

	if (if_ms_req_i == 1'b1)
	  begin
	     if_ms_rep_o <= 1;
	     if_ms_rep_data_o <= {mem_data[((if_addr>>3)<<1)+1],mem_data[(if_addr>>3)<<1]};
	  end
     end // always @ (clk)
   
   always @ (*)
     begin	
	mem_ms_rep_o <= 0;
	mem_ms_rep_data_o <= 0;

	if (mem_ms_req_i == 1'b1)
	  begin
	     // $display("%d %d",((mem_addr>>3)<<1)+1,((mem_addr>>3)<<1));
	     // $display("%h",mem_data[((mem_addr>>3)<<1)+1]);
	     
	     mem_ms_rep_o <= 1;
	     mem_ms_rep_data_o <= {mem_data[((mem_addr>>3)<<1)+1],mem_data[(mem_addr>>3)<<1]};
	  end
     end // always @ (clk)

   always @ (posedge clk)
     begin
	if (ms_write_i == 1'b1)
	  begin
	     if (ms_write_mask_i[3] == 1)
	       mem_data[mem_addr>>2][7:0] <= ms_write_data_i[31:24];
	     if (ms_write_mask_i[2] == 1)
	       mem_data[mem_addr>>2][15:8] <= ms_write_data_i[23:16];
	     if (ms_write_mask_i[1] == 1)
	       mem_data[mem_addr>>2][23:16] <= ms_write_data_i[15:8];
	     if (ms_write_mask_i[0] == 1)
	       begin
		  mem_data[mem_addr>>2][31:24] <= ms_write_data_i[7:0];
		  if (mem_addr == 32'h00000104)
		    $display("Print (%c)",ms_write_data_i[7:0]);
	       end
	  end
     end   

   // always @ (mem_data[65]) $display("%h",mem_data[65]);
      
endmodule // mem_sim

// --------------------------------------------------------------------------------
`endif
