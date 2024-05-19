// This program was cloned from: https://github.com/lmxyy/Computer-Architecture-Task-2
// License: MIT License

`ifdef id.v
`else
 `define id.v
// --------------------------------------------------------------------------------
 `include "defines.v"

module id(
	  input wire 		    rst,
	  input wire [`InstAddrBus] pc_i,
	  input wire [`InstBus]     inst_i,
	  
	  //处于执行阶段的指令要写入的目的寄存器信息
	  input wire 		    ex_wreg_i,
	  input wire [`RegBus] 	    ex_wdata_i,
	  input wire [`RegAddrBus]  ex_wd_i,

	  //处于访存阶段的指令要写入的目的寄存器信息
	  input wire 		    mem_wreg_i,
	  input wire [`RegBus] 	    mem_wdata_i,
	  input wire [`RegAddrBus]  mem_wd_i,

	  input wire [`RegBus] 	    reg1_data_i,
	  input wire [`RegBus] 	    reg2_data_i,

	  //送到regfile的信息
	  output reg 		    reg1_read_o,
	  output reg 		    reg2_read_o, 
	  output reg [`RegAddrBus]  reg1_addr_o,
	  output reg [`RegAddrBus]  reg2_addr_o, 

	  //送到执行阶段的信息
	  output reg [`AluOpBus]    aluop_o,
	  output reg [`AluSelBus]   alusel_o,
	  output reg [`RegBus] 	    reg1_o,
	  output reg [`RegBus] 	    reg2_o,
	  output reg [`RegAddrBus]  wd_o,
	  output reg 		    wreg_o
	  );

   reg [`RegBus] 		    imm;
   reg 				    instvalid;

   always @ (*) begin
      if (rst == `RstEnable)
	begin
	   aluop_o <= `EXE_NOP_OP;
	   alusel_o <= `EXE_RES_NOP;
	   wd_o <= `NOPRegAddr;
	   wreg_o <= `WriteDisable;
	   reg1_read_o <= 1'b0;
	   reg2_read_o <= 1'b0;
	   reg1_addr_o <= `NOPRegAddr;
	   reg2_addr_o <= `NOPRegAddr;
	   imm <= `ZeroWord;
	   instvalid <= `InstValid;
	end // if (rst == `RstEnable)
      else
	begin
	   aluop_o <= `EXE_NOP_OP;
	   alusel_o <= `EXE_RES_NOP;
	   wd_o <= inst_i[20:16];
	   wreg_o <= `WriteDisable;
	   reg1_read_o <= 1'b0;
	   reg2_read_o <= 1'b0;
	   reg1_addr_o <= inst_i[19:15];
	   reg2_addr_o <= inst_i[24:20];		
	   imm <= `ZeroWord;
	   instvalid <= `InstInvalid;
	   case (inst_i[6:0])

	     7'b0010011:
	       begin
		  case (inst_i[14:12])

		    3'b001:
		      begin
		      case (inst_i[31:25])
		    
			7'b0000000:
			  begin	// SLLI
			     wreg_o <= `WriteEnable;
			     aluop_o <= `EXE_SLL_OP;
			     alusel_o <= `EXE_RES_SHIFT;
			     reg1_read_o <= 1'b1;
			     reg2_read_o <= 1'b0;
			     imm <= {27'h0,inst_i[24:20]};
			     wd_o <= inst_i[11:7];
			     instvalid = `InstValid;
			  end // case: 7'b0000000
			
			default: begin end

		      endcase // case (inst_i[31:26])
		      end // case: 3'b001
		    
		    3'b100:
		      begin	// XORI
			 wreg_o <= `WriteEnable;
			 aluop_o <= `EXE_XOR_OP;
			 alusel_o <= `EXE_RES_LOGIC; 
			 reg1_read_o <= 1'b1;	
			 reg2_read_o <= 1'b0;	  	
			 imm <= {16'h0,inst_i[31:20]};		
			 wd_o <= inst_i[11:7];
			 instvalid <= `InstValid;
		      end // case: 3'b100
		    
		    3'b101:
		      begin
			 case (inst_i[31:25])

			   7'b0000000:
			     begin	// SRLI
				wreg_o <= `WriteEnable;
				aluop_o <= `EXE_SRL_OP;
				alusel_o <= `EXE_RES_SHIFT;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				imm <= {27'h0,inst_i[24:20]};
				wd_o <= inst_i[11:7];
				instvalid = `InstValid;	  
			     end // case: 7'b0000000
			   
			   7'b0100000:
			     begin	// SRAI
				wreg_o <= `WriteEnable;
				aluop_o <= `EXE_SRA_OP;
				alusel_o <= `EXE_RES_SHIFT;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				imm <= {27'h0,inst_i[24:20]};
				wd_o <= inst_i[11:7];
				instvalid = `InstValid;			 
			     end // case: 7'b0100000
			   
			   default: begin end
			   
			 endcase // case (inst_i[31:25])
		      end // case: 3'b101
		    
		    3'b110:
		      begin 	// ORI
			 wreg_o <= `WriteEnable;
			 aluop_o <= `EXE_OR_OP;
			 alusel_o <= `EXE_RES_LOGIC; 
			 reg1_read_o <= 1'b1;	
			 reg2_read_o <= 1'b0;	  	
			 imm <= {16'h0,inst_i[31:20]};		
			 wd_o <= inst_i[11:7];
			 instvalid <= `InstValid;
		      end // case: 3'b110

		    3'b111:
		      begin 	// ANDI
			 wreg_o <= `WriteEnable;
			 aluop_o <= `EXE_AND_OP;
			 alusel_o <= `EXE_RES_LOGIC; 
			 reg1_read_o <= 1'b1;	
			 reg2_read_o <= 1'b0;	  	
			 imm <= {16'h0,inst_i[31:20]};		
			 wd_o <= inst_i[11:7];
			 instvalid <= `InstValid;
		      end // case: 3'b111
		    
		    default: begin end
		  endcase // case (inst_i[14:12])
	       end // case: 7'b0010011
	     
	     7'b0110011:
	       begin
		  case (inst_i[14:12])

		    3'b001:
		      begin
			 case (inst_i[31:25])

			   7'b0000000:
			     begin // SLL
				wreg_o <= `WriteEnable;
				aluop_o <= `EXE_SLL_OP;
				alusel_o <= `EXE_RES_SHIFT;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b1;
				wd_o <= inst_i[11:7];
				instvalid <= `InstValid;
			     end

			   default: begin end
			   
			 endcase // case (inst_i[31:25])
		      end // case: 3'b001
		    
		    3'b100:
		      begin
			 case (inst_i[31:25])

			   7'b0000000:
			     begin // XOR
				wreg_o <= `WriteEnable;
				aluop_o <= `EXE_XOR_OP;
				alusel_o <= `EXE_RES_LOGIC; 
				reg1_read_o <= 1'b1;	
				reg2_read_o <= 1'b1;	  	
				wd_o <= inst_i[11:7];	 
				instvalid <= `InstValid;
			     end
			   
			   default: begin end
			   
			 endcase // case (inst_i[31:25])
		      end // case: 3'b100

		    3'b101:
		      begin
			 case (inst_i[31:25])

			   7'b0000000:
			     begin // SRL
				wreg_o <= `WriteEnable;
				aluop_o <= `EXE_SRL_OP;
				alusel_o <= `EXE_RES_SHIFT;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b1;
				wd_o <= inst_i[11:7];
				instvalid <= `InstValid;
			     end
			   
			   7'b0100000:
			     begin // SRA
				wreg_o <= `WriteEnable;
				aluop_o <= `EXE_SRA_OP;
				alusel_o <= `EXE_RES_SHIFT;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b1;
				wd_o <= inst_i[11:7];
				instvalid <= `InstValid;
			     end

			   default: begin end
			   
			 endcase // case (inst_i[31:25])
		      end // case: 3'b101
			 
		    3'b110:
		      begin
			 case (inst_i[31:25])

			   7'b0000000:
			     begin // OR
				wreg_o <= `WriteEnable;
				aluop_o <= `EXE_OR_OP;
				alusel_o <= `EXE_RES_LOGIC; 
				reg1_read_o <= 1'b1;	
				reg2_read_o <= 1'b1;	  	
				wd_o <= inst_i[11:7];
				instvalid <= `InstValid;
			     end

			   default: begin end
			 endcase // case (inst_i[31:25])
		      end // case: 3'b110

		    3'b111:
		      begin
			 case (inst_i[31:25])

			   7'b0000000:
			     begin // AND
				wreg_o <= `WriteEnable;
				aluop_o <= `EXE_AND_OP;
				alusel_o <= `EXE_RES_LOGIC; 
				reg1_read_o <= 1'b1;	
				reg2_read_o <= 1'b1;	  	
				wd_o <= inst_i[11:7];	 
				instvalid <= `InstValid;
			     end

			   default: begin end
			 endcase // case (inst_i[31:25])
		      end

		  endcase // case (inst_i[14:12])
	       end // case: 7'b0110011

	     7'b0110111:
	       begin		// LUI
		  wreg_o <= `WriteEnable;
		  aluop_o <= `EXE_OR_OP;
		  alusel_o <= `EXE_RES_LOGIC;
		  reg1_read_o <= 1'b1;
		  reg2_read_o <= 1'b0;
		  imm <= {inst_i[31:12],12'h000};
		  wd_o <= inst_i[11:7];
		  instvalid <= `InstValid;
	       end
	     
	     default: begin end
	     
	   endcase // case (inst_i[6:0])
	end // else: !if(rst == `RstEnable)
   end // always @ (*)

 `define GET_OPRAND(reg_o,reg_read_o,reg_data_i,reg_addr_o) \ 
   always @ (*) \ 
     begin \ 
 	if(rst == `RstEnable) reg_o <= `ZeroWord; \ 
	  else if ((reg_read_o == 1'b1)&&(ex_wreg_i == 1'b1)&&(ex_wd_i == reg_addr_o)) \ 
				reg_o <= ex_wdata_i; \ 
				  else if ((reg_read_o == 1'b1)&&(mem_wreg_i == 1'b1)&&(mem_wd_i == reg_addr_o)) \ 
							reg_o <= mem_wdata_i; \ 
 							  else if(reg_read_o == 1'b1) reg_o <= reg_data_i; \ 
 							    else if(reg_read_o == 1'b0) reg_o <= imm; \ 
 							      else reg_o <= `ZeroWord; \ 
									    end

   
   
   `GET_OPRAND(reg1_o,reg1_read_o,reg1_data_i,reg1_addr_o)
   `GET_OPRAND(reg2_o,reg2_read_o,reg2_data_i,reg2_addr_o)
   
endmodule // id

// --------------------------------------------------------------------------------
`endif
