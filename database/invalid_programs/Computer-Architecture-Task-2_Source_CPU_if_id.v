`ifdef if_id.v
`else
 `define if_id.v
// --------------------------------------------------------------------------------
 `include "defines.v"

module if_id
  (
   input wire 		     clk,
   input wire 		     rst,

   input wire [5:0] 	     stall,

   input wire [`InstAddrBus] if_pc,
   input wire [`InstBus]     if_inst,

   input wire 		     pdt_res_i,
   input wire		     which_pdt_i,
   input wire [9:0] 	     history_i,
   
   output reg [`InstAddrBus] id_pc,
   output reg [`InstBus]     id_inst,

   output reg 		     pdt_res_o,
   output reg 		     which_pdt_o,
   output reg [9:0] 	     history_o
   );

   always @ (posedge clk)
     begin

	if (rst == `RstEnable) 
	  begin
	     id_pc <= `ZeroWord;
	     id_inst <= `ZeroWord;
	     pdt_res_o <= 0;
	     which_pdt_o <= 0;
	     history_o <= 10'b0;
	  end
	else if (stall[1] == 1'b1&&stall[2] == 1'b0)
	  begin
	     id_pc <= `ZeroWord;
	     id_inst <= `ZeroWord;
	     pdt_res_o <= 0;
	     which_pdt_o <= 0;
	     history_o <= 10'b0;
	  end
	else if (stall[1] == 1'b0)
	  begin
	     id_pc <= if_pc;
	     id_inst <= if_inst;
	     pdt_res_o <= pdt_res_i;
	     which_pdt_o <= which_pdt_i;
	     history_o <= history_i;
	  end
	
     end // always @ (posedge clk)

endmodule // if_id

// --------------------------------------------------------------------------------
`endif
