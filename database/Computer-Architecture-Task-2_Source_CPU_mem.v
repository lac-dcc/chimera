// This program was cloned from: https://github.com/lmxyy/Computer-Architecture-Task-2
// License: MIT License

`ifdef mem.v
`else
 `define mem.v
// --------------------------------------------------------------------------------
 `include "defines.v"

module mem
  (
   input wire 		    rst,
     
   //来自执行阶段的信息	
   input wire [`RegAddrBus] wd_i,
   input wire 		    wreg_i,
   input wire [`RegBus]     wdata_i,

   input wire [`AluOpBus]   aluop_i,
   input wire [`RegBus]     mem_addr_i,
   input wire [`RegBus]     reg2_i,

   // 来自memory的信息
   input wire [`RegBus]     mem_data_i,
  
   //送到回写阶段的信息
   output reg [`RegAddrBus] wd_o,
   output reg 		    wreg_o,
   output reg [`RegBus]     wdata_o,

   // 送到memory的信息
   output reg [`RegBus]     mem_addr_o,
   output reg 		    mem_we_o,
   output reg 		    mem_re_o,
   output reg [3:0] 	    mem_sel_o,
   output reg [`RegBus]     mem_data_o,
   output reg 		    mem_ce_o
   );

   
   always @ (*) 
     begin

	if (rst == `RstEnable) 
	  begin
	     wd_o <= `NOPRegAddr;
	     wreg_o <= `WriteDisable;
	     wdata_o <= `ZeroWord;
	     mem_addr_o <= `ZeroWord;
	     mem_we_o <= `WriteDisable;
	     mem_re_o <= 0;
	     mem_sel_o <= 4'b0000;
	     mem_data_o <= `ZeroWord;
	     mem_ce_o <= `ChipDisable;
	  end // if (rst == `RstEnable)
	
	else
	  begin
	     wd_o <= wd_i;
	     wreg_o <= wreg_i;
	     wdata_o <= wdata_i;
	     mem_addr_o <= `ZeroWord;
	     mem_we_o <= `WriteDisable;
	     mem_re_o <= 0;
	     mem_sel_o <= 4'b0000;
	     mem_data_o <= `ZeroWord;
	     mem_ce_o <= `ChipDisable;

	     case (aluop_i)
	       
	       `EXE_LB_OP:	// LB
		 begin
		    mem_addr_o <= mem_addr_i;
		    mem_we_o <= `WriteDisable;
		    mem_re_o <= 1;
		    mem_ce_o <= `ChipEnable;
		    case (mem_addr_i[1:0])

		      2'b11: wdata_o <= {{24{mem_data_i[31]}},mem_data_i[31:24]};
		      2'b10: wdata_o <= {{24{mem_data_i[23]}},mem_data_i[23:16]};
		      2'b01: wdata_o <= {{24{mem_data_i[15]}},mem_data_i[15:8]};
		      2'b00: wdata_o <= {{24{mem_data_i[7]}},mem_data_i[7:0]};
		      
		      default: wdata_o <= `ZeroWord;
		      
		    endcase // case (mem_addr_i[1:0])
		 end // case: `EXE_LB_OP
	       
	       `EXE_LH_OP:
		 begin
		    mem_addr_o <= mem_addr_i;
		    mem_we_o <= `WriteDisable;
		    mem_re_o <= 1;
		    mem_ce_o <= `ChipEnable;
		    case (mem_addr_i[1:0])
		      
		      2'b10: wdata_o <= {{16{mem_data_i[31]}},mem_data_i[31:16]};
		      2'b00: wdata_o <= {{16{mem_data_i[15]}},mem_data_i[15:0]};
		      
		      default: wdata_o <= `ZeroWord;

		    endcase					

		 end // case: `EXE_LH_OP
	       
	       `EXE_LW_OP:
		 begin
		    mem_addr_o <= mem_addr_i;
		    mem_we_o <= `WriteDisable;
		    mem_re_o <= 1;
		    mem_ce_o <= `ChipEnable;
		    if (mem_addr_i[1:0] != 2'b00)
			  wdata_o <= `ZeroWord;
			else wdata_o <= mem_data_i;
		    mem_sel_o <= 4'b1111;
		    mem_ce_o <= `ChipEnable;
		 end // case: `EXE_LW_OP
	       
	       `EXE_LBU_OP:
		 begin
		    mem_addr_o <= mem_addr_i;
		    mem_we_o <= `WriteDisable;
		    mem_re_o <= 1;
		    mem_ce_o <= `ChipEnable;
		    case (mem_addr_i[1:0])

		      2'b11: wdata_o <= {24'b0,mem_data_i[31:24]};
		      2'b10: wdata_o <= {24'b0,mem_data_i[23:16]};
		      2'b01: wdata_o <= {24'b0,mem_data_i[15:8]};
		      2'b00: wdata_o <= {24'b0,mem_data_i[7:0]};
		      
		      default: wdata_o <= `ZeroWord;
		      
		    endcase // case (mem_addr_i[1:0])
		 end // case: `EXE_LBU_OP

	       `EXE_LHU_OP:
		 begin
		    mem_addr_o <= mem_addr_i;
		    mem_we_o <= `WriteDisable;
		    mem_re_o <= 1;
		    mem_ce_o <= `ChipEnable;
		    case (mem_addr_i[1:0])
		      
		      2'b10: wdata_o <= {16'b0,mem_data_i[31:16]};
		      2'b01: wdata_o <= {16'b0,mem_data_i[15:0]};
		      
		      default: wdata_o <= `ZeroWord;

		    endcase // case (mem_addr_i[1:0])
		    
		 end // case: `EXE_LHU_OP
	       
	       `EXE_SB_OP:
		 begin
		    mem_addr_o <= mem_addr_i;
		    mem_we_o <= `WriteEnable;
		    mem_data_o <= {reg2_i[7:0],reg2_i[7:0],reg2_i[7:0],reg2_i[7:0]};
		    mem_ce_o <= `ChipEnable;
		    case (mem_addr_i[1:0])
		      2'b00: mem_sel_o <= 4'b0001;
		      2'b01: mem_sel_o <= 4'b0010;
		      2'b10: mem_sel_o <= 4'b0100;
		      2'b11: mem_sel_o <= 4'b1000;	
		      default: mem_sel_o <= 4'b0000;
		    endcase // case (mem_addr_i[1:0])
		 end // case: `EXE_SB_OP
	       
	       `EXE_SH_OP:
		 begin
		    mem_addr_o <= mem_addr_i;
		    mem_we_o <= `WriteEnable;
		    mem_data_o <= {reg2_i[15:0],reg2_i[15:0]};
		    mem_ce_o <= `ChipEnable;
		    case (mem_addr_i[1:0])
		      2'b00: mem_sel_o <= 4'b0011;
		      2'b10: mem_sel_o <= 4'b1100;
		      default: mem_sel_o <= 4'b0000;
		    endcase // case (mem_addr_i[1:0])
		 end // case: `EXE_SH_OP
	       
	       `EXE_SW_OP:
		 begin
		    mem_addr_o <= mem_addr_i;
		    mem_we_o <= `WriteEnable;
		    mem_data_o <= reg2_i;
		    mem_sel_o <= 4'b1111;	
		    mem_ce_o <= `ChipEnable;		
		 end // case: `EXE_SW_OP
	       
	       default: begin end
	       
	     endcase // case (aluop_i)
	     
	  end // else: !if(rst == `RstEnable)

     end // always @ (*)

endmodule // mem

// --------------------------------------------------------------------------------
`endif
