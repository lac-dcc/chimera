`ifdef ex.v
`else
 `define ex.v
// --------------------------------------------------------------------------------
 `include "defines.v"

module ex
  (
   input wire 		    rst,
     
   //送到执行阶段的信息
   input wire [`AluOpBus]   aluop_i,
   input wire [`AluSelBus]  alusel_i,
   input wire [`RegBus]     reg1_i,
   input wire [`RegBus]     reg2_i,
   input wire [`RegAddrBus] wd_i,
   input wire 		    wreg_i,
   input wire [`RegBus]     inst_i, 

   input wire [`RegBus]     link_address_i, 
  
   output reg [`RegAddrBus] wd_o,
   output reg 		    wreg_o,
   output reg [`RegBus]     wdata_o,

   output wire [`AluOpBus]  aluop_o,
   output wire [`RegBus]    mem_addr_o,
   output wire [`RegBus]    reg2_o,

   output wire 		    is_load_o
   );
   
   // --------------------------------------------------Logic--------------------------------------------------
   reg [`RegBus] 	    logicout;

   always @ (*)
     begin
	if (rst == `RstEnable) logicout <= `ZeroWord;
	else
	  begin
	     case (aluop_i)
	       `EXE_AND_OP: logicout <= reg1_i & reg2_i;
	       `EXE_OR_OP: logicout <= reg1_i | reg2_i;
	       `EXE_XOR_OP: logicout <= reg1_i ^ reg2_i;
	       default: logicout <= `ZeroWord;
	     endcase // case (aluop_i)
	  end // else: !if(rst == `RstEnable)
     end // always @ (*)

   // --------------------------------------------------Shift--------------------------------------------------
   reg [`RegBus] 		   shiftres;

   always @ (*) begin
      if(rst == `RstEnable) shiftres <= `ZeroWord;
      else 
	begin
	   case (aluop_i)
	     `EXE_SLL_OP: shiftres <= reg1_i << reg2_i[4:0];
	     `EXE_SRL_OP: shiftres <= reg1_i >> reg2_i[4:0];
	     `EXE_SRA_OP:
	       shiftres <= ({32{reg1_i[31]}} << (6'd32-{1'b0, reg2_i[4:0]}))| reg1_i >> reg2_i[4:0];
	     default: shiftres <= `ZeroWord;	     
	   endcase // case (aluop_i)
	end // else: !if(rst == `RstEnable)
   end // always @ (*)
   
   // --------------------------------------------------Arithmetic--------------------------------------------------
   wire reg1_eq_reg2;
   wire reg1_lt_reg2;
   reg [`RegBus] arithmeticres;
   wire [`RegBus] reg2_i_mux;
   wire [`RegBus] reg1_i_not;
   wire [`RegBus] result_sum;

   assign reg2_i_mux = ((aluop_i == `EXE_SUB_OP)||(aluop_i == `EXE_SLT_OP))?(~reg2_i)+1:reg2_i;
   assign result_sum = reg1_i+reg2_i_mux;
   assign reg1_lt_reg2 = (aluop_i == `EXE_SLT_OP)?
			 ((reg1_i[31]&&!reg2_i[31])||(!reg1_i[31]&&!reg2_i[31]&&result_sum[31])
			  ||(reg1_i[31]&&reg2_i[31]&&result_sum[31])):(reg1_i < reg2_i);

   always @ (*)
     begin
	if (rst == `RstEnable) arithmeticres <= `ZeroWord;
	else
	  case (aluop_i)	
	    `EXE_SLT_OP,`EXE_SLTU_OP: arithmeticres <= reg1_lt_reg2;
	    `EXE_ADD_OP,`EXE_SUB_OP: arithmeticres <= result_sum;
	    default: arithmeticres <= `ZeroWord;
	  endcase // case (aluop_i)
     end // always @ (*)

   // --------------------------------------------------Load and Store--------------------------------------------------

   assign aluop_o = aluop_i;
   assign mem_addr_o = reg1_i+((inst_i[6:0] == 7'b0000011)?{{20{inst_i[31]}},inst_i[31:20]}:{{20{inst_i[31]}},inst_i[31:25],inst_i[11:7]});
   assign is_load_o = (inst_i[6:0] == 7'b0000011)?1'b1:1'b0;
   assign reg2_o = reg2_i;
   
   // ####################################################################################################
   // ####################################################################################################
   
   always @ (*) 
     begin
	wd_o <= wd_i;
	wreg_o <= wreg_i;
	case (alusel_i) 
	  `EXE_RES_LOGIC: wdata_o <= logicout;
	  `EXE_RES_SHIFT: wdata_o <= shiftres;
	  `EXE_RES_ARITHMETIC: wdata_o <= arithmeticres;
	  `EXE_RES_JUMP_BRANCH: wdata_o <= link_address_i;
	  default: wdata_o <= `ZeroWord;
	endcase // case (alusel_i)
     end // always @ (*)
   
endmodule // ex

// --------------------------------------------------------------------------------
`endif
