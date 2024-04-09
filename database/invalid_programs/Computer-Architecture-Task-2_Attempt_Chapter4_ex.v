`ifdef ex.v
`else
 `define ex.v
// --------------------------------------------------------------------------------
 `include "defines.v"

module ex(

	  input wire 		   rst,
   
	  //送到执行阶段的信息
	  input wire [`AluOpBus]   aluop_i,
	  input wire [`AluSelBus]  alusel_i,
	  input wire [`RegBus] 	   reg1_i,
	  input wire [`RegBus] 	   reg2_i,
	  input wire [`RegAddrBus] wd_i,
	  input wire 		   wreg_i,


	  output reg [`RegAddrBus] wd_o,
	  output reg 		   wreg_o,
	  output reg [`RegBus] 	   wdata_o
	  );
   
   reg [`RegBus] 		   logicout;

   always @ (*)
     begin
	if (rst == `RstEnable) logicout <= `ZeroWord;
	else
	  begin
	     case (aluop_i)
	       `EXE_OR_OP: logicout <= reg1_i | reg2_i;
	       default: logicout <= `ZeroWord;
	     endcase // case (aluop_i)
	  end // else: !if(rst == `RstEnable)
     end // always @ (*)
   
   always @ (*) 
     begin
	wd_o <= wd_i;
	wreg_o <= wreg_i;
	case (alusel_i) 
	  `EXE_RES_LOGIC:	wdata_o <= logicout;
	  default: wdata_o <= `ZeroWord;
	endcase // case (alusel_i)
     end // always @ (*)
   
endmodule // ex

// --------------------------------------------------------------------------------
`endif
