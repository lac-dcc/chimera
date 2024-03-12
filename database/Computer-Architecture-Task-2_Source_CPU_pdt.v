`ifdef pdt.v
`else
 `define pdt.v
// --------------------------------------------------------------------------------
 `include "defines.v"

module pdt
  (
   input wire 		     rst,

   input wire [`InstAddrBus] if_pc,
   input wire [`InstBus]     if_inst,

   // from id
   input wire 		     id_is_branch,
   input wire 		     id_branch_res,
   input wire 		     id_pdt_true,
   input wire 		     which_pdt_i,
   input wire [`InstAddrBus] id_pc,
   input wire [9:0] 	     id_history,
   
   // to pc_reg
   output reg 		     branch_or_not, 
   output reg [`InstAddrBus] pdt_pc,
   
   // to id
   output reg 		     pdt_res,
   output reg 		     which_pdt_o,
   output wire [9:0] 	     history_o
   );

   reg [9:0] 		     history;
   reg [1:0] 		     alloyed_branch_predictor[0:1023];
   reg [1:0] 		     global_branch_predictor[0:1023];
   reg [1:0] 		     local_branch_predictor[0:1023][0:2];

   assign history_o = history;
   
   integer 		     i,j;	
   always @ (*)
     begin
	if (rst == `RstEnable)
	  begin
	     history <= 10'b0;
	     for (i = 0;i < 1024;i = i+1)
	       alloyed_branch_predictor[i] <= 2'b0;
	     for (i = 0;i < 1024;i = i+1)
	       global_branch_predictor[i] <= 2'b00;
	     for (i = 0;i < 1024;i = i+1)
	       for (j = 0;j < 16;j = j+1)
		 local_branch_predictor[i][j] <= 2'b00;
	     branch_or_not <= 1'b0;
	     pdt_pc <= 1'b0;
	     pdt_res <= 1'b0;
	     which_pdt_o <= 1'b0;
	  end // if (rst == `RstEnable)

	else if (if_inst[6:0] == 7'b1100011) // Is a branch instruction, ready to predict
	  begin
	     branch_or_not <= 1'b1;

	     if (alloyed_branch_predictor[if_pc[11:2]][1] == 0)
	       begin
		  which_pdt_o <= 1'b0;
		  if (local_branch_predictor[if_pc[11:2]][history[1:0]][1] == 0)
		    begin
		       pdt_res <= 1'b0;
		       pdt_pc <= if_pc+4;
		    end	
		  else
		    begin
		       pdt_res <= 1'b1;
		       pdt_pc <= if_pc+{{19{if_inst[31]}},if_inst[31],if_inst[7],if_inst[30:25],if_inst[11:8],1'b0};
		    end
	       end // if (alloyed_branch_predictor[if_pc[11:2]][1] == 0)
	     
	     else
	       begin
		  which_pdt_o <= 1'b1;
		  if (global_branch_predictor[history][1] == 0)
		    begin
		       pdt_res <= 1'b0;
		       pdt_pc <= if_pc+4;
		    end	
		  else
		    begin
		       pdt_res <= 1'b1;
		       pdt_pc <= if_pc+{{19{if_inst[31]}},if_inst[31],if_inst[7],if_inst[30:25],if_inst[11:8],1'b0};
		    end
	       end // else: !if(alloyed_branch_predictor[if_pc[11:2]][1] == 0)
	     
	  end

	else branch_or_not <= 1'b0;

     end // always @ (*)

   always @ (id_is_branch == 1'b1)
     begin
	history <= (history<<1|id_branch_res);
	// $display("history: %b",history);
	// $display("pdt_accurate: %b",id_pdt_true);
	if (id_pdt_true == 1'b1)
	  begin
	     if (which_pdt_i == 1'b0)
	       begin
		  if (local_branch_predictor[id_pc[11:2]][id_history[1:0]] < 3)
		    local_branch_predictor[id_pc[11:2]][id_history[1:0]] <= local_branch_predictor[id_pc[11:2]][id_history[1:0]]+1;
	       end
	     else
	       begin
		  if (global_branch_predictor[id_history] < 3)
		    global_branch_predictor[id_history] <= global_branch_predictor[id_history]+1;
	       end
	  end // if (id_pdt_true == 1'b1)
	
	else
	  begin
	     if (which_pdt_i == 1'b0)
	       begin
		  if (local_branch_predictor[id_pc[11:2]][id_history] > 0)
		    local_branch_predictor[id_pc[11:2]][id_history] <= local_branch_predictor[id_pc[11:2]][id_history]-1;
		  alloyed_branch_predictor[id_pc[11:2]] <= alloyed_branch_predictor[id_pc[11:2]]+1;
	       end
	     else
	       begin
		  if (global_branch_predictor[id_history] > 0)
		    global_branch_predictor[id_history] <= global_branch_predictor[id_history]-1;
		  alloyed_branch_predictor[id_pc[11:2]] <= alloyed_branch_predictor[id_pc[11:2]]-1;
	       end
	  end // else: !if(id_pdt_true == 1'b1)
	
     end
   
endmodule // regfile

// --------------------------------------------------------------------------------
`endif
