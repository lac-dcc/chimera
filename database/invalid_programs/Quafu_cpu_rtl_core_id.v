`include "defines.v"

module id(

	input wire							rst,
	input wire[`InstAddrBus]		pc_i,
	input wire[`InstBus]          inst_i,
	
	//处于执行阶段的指令要写入的目的寄存器信息
	input wire							ex_wreg_i,
	input wire[`RegBus]				ex_wdata_i,
	input wire[`RegAddrBus]       ex_wd_i,
	
	//处于访存阶段的指令要写入的目的寄存器信息
	input wire							mem_wreg_i,
	input wire[`RegBus]				mem_wdata_i,
	input wire[`RegAddrBus]       mem_wd_i,

	input wire[`RegBus]           reg1_data_i,
	input wire[`RegBus]           reg2_data_i,
	
	input wire[`AluOpBus]			ex_aluop_i,
	
//	input wire							flush,			//专门用于清除异常向量，此做法导致严重bug
	input wire[1:0]					curr_mode,

	//送到regfile的信息
	output reg                    reg1_read_o,
	output reg                    reg2_read_o,     
	output reg[`RegAddrBus]       reg1_addr_o,
	output reg[`RegAddrBus]       reg2_addr_o, 	      
	
	//送到执行阶段的信息
	output reg[`AluOpBus]         aluop_o,
	output reg[`AluSelBus]        alusel_o,
	output reg[`RegBus]           reg1_o,
	output reg[`RegBus]           reg2_o,
	output reg[`RegAddrBus]       wd_o,
	output reg                    wreg_o,

	output wire                   stallreq,

	output reg							branch_flag_o,
	output reg[`RegBus]				branch_target_address_o,
	output reg[`RegBus]				link_addr_o,

	output [`RegBus]					inst_o,
	
	output wire[31:0]					excepttype_o,
	output wire[`RegBus]				current_inst_address_o
);

  wire[6:0] op = inst_i[6:0];
  wire[2:0] op2 = inst_i[14:12];
  wire[6:0] op3 = inst_i[31:25];
  wire[5:0] op3_i = inst_i[31:26];
  reg[`RegBus]	imm;
  reg[1:0] get_current_pc;
  reg instvalid;
  wire reg1_lt_reg2;
  wire[`RegBus] temp_sum;
  wire[`RegBus] reg2_o_mux;
  
  //处理load相关
  reg stallreq_for_reg1_loadrelate;
  reg stallreq_for_reg2_loadrelate;
  wire pre_inst_is_load;
  
  reg excepttype_is_ecall;
  reg excepttype_is_mret;
  
  //exceptiontype的低8bit留给外部中断，第9bit表示是否是ecall指令
  //第10bit表示是否是无效指令，第11bit表示是否是trap指令，第13bit表示是否是mret指令
  assign excepttype_o = {19'b0,excepttype_is_mret,2'b0,
  												instvalid, excepttype_is_ecall, 8'b0};
												
	assign current_inst_address_o = pc_i;
  
  assign stallreq = stallreq_for_reg1_loadrelate | stallreq_for_reg2_loadrelate;
  
  assign pre_inst_is_load = ((ex_aluop_i == `EXE_LB_OP) ||
										(ex_aluop_i == `EXE_LBU_OP) ||
										(ex_aluop_i == `EXE_LH_OP) ||
										(ex_aluop_i == `EXE_LHU_OP) ||
										(ex_aluop_i == `EXE_LW_OP) ||
										(ex_aluop_i == `EXE_LWU_OP)) ? 1'b1 : 1'b0;
 
//  assign pc_plus_4 = pc_i + 4;
//  assign stallreq = `NoStop;
 
  assign inst_o = inst_i;
  
  assign reg2_o_mux = (~reg2_o) + 1;
  assign temp_sum = reg1_o + reg2_o_mux;
  assign reg1_lt_reg2 = ((reg1_o[31] && !reg2_o[31]) || 
														(!reg1_o[31] && !reg2_o[31] && temp_sum[31])||
																(reg1_o[31] && reg2_o[31] && temp_sum[31]));
 
	always @ (*) begin	
		if (rst == `RstEnable) begin
			aluop_o = `EXE_NOP_OP;
			alusel_o = `EXE_RES_NOP;
			wd_o = `NOPRegAddr;
			wreg_o = `WriteDisable;
			instvalid = `InstInvalid;
			reg1_read_o = 1'b0;
			reg2_read_o = 1'b0;
			reg1_addr_o = `NOPRegAddr;
			reg2_addr_o = `NOPRegAddr;
			imm = 32'h0;
			link_addr_o = `ZeroWord;
			branch_target_address_o = `ZeroWord;
			branch_flag_o = `NotBranch;
//			reg1_lt_reg2 = 1'b0;
//			temp_sum = 32'b0;
			get_current_pc = 2'b00;
			
			excepttype_is_ecall = `False_v;
			excepttype_is_mret = `False_v;
	  end else begin
			aluop_o = `EXE_NOP_OP;
			alusel_o = `EXE_RES_NOP;
			wd_o = inst_i[11:7];
			wreg_o = `WriteDisable;
			instvalid = `InstValid;  
			reg1_read_o = 1'b0;
			reg2_read_o = 1'b0;
			reg1_addr_o = inst_i[19:15];    // rs1
			reg2_addr_o = inst_i[24:20];		// rs1 | imm
			imm = `ZeroWord;
			link_addr_o = `ZeroWord;
			branch_target_address_o = `ZeroWord;
			branch_flag_o = `NotBranch;
//			reg1_lt_reg2 = 1'b0;
//			temp_sum = 32'b0;
			get_current_pc = 2'b00;
		  case (op)
			 `EXE_I_INST:	begin
					case(op2) 
						   `EXE_ORI:			begin                        //ORI指令
								wreg_o = `WriteEnable;
								aluop_o = `EXE_OR_OP;
								alusel_o = `EXE_RES_LOGIC;
								reg1_read_o = 1'b1;
								reg2_read_o = 1'b0;	  	
								imm = {{20{inst_i[31]}},inst_i[31:20]};
								wd_o = inst_i[11:7];
								instvalid = `InstValid;	
							end
							`EXE_ANDI:		begin									//ANDI
								wreg_o = `WriteEnable;
								aluop_o = `EXE_AND_OP;
								alusel_o = `EXE_RES_LOGIC;
								reg1_read_o = 1'b1;
								reg2_read_o = 1'b0;	  	
								imm = {{20{inst_i[31]}},inst_i[31:20]};
								wd_o = inst_i[11:7];	  	
								instvalid = `InstValid;
							end
							`EXE_XORI:		begin							//XORI
								wreg_o = `WriteEnable;
								aluop_o = `EXE_XOR_OP;
								alusel_o = `EXE_RES_LOGIC;
								reg1_read_o = 1'b1;	reg2_read_o = 1'b0;	  	
								imm = {{20{inst_i[31]}},inst_i[31:20]};
								wd_o = inst_i[11:7];			  	
								instvalid = `InstValid;
							end
							`EXE_SLLI:		begin							//SLLI
								if(op3_i == 6'b000000 & inst_i[25] == 0) begin
									wreg_o = `WriteEnable;
									aluop_o = `EXE_SLL_OP;
									alusel_o = `EXE_RES_SHIFT;
									reg1_read_o = 1'b1;	reg2_read_o = 1'b0;	  	
									imm[5:0] = inst_i[25:20];
									wd_o = inst_i[11:7];	
									instvalid = `InstValid;
								end
							end
							`EXE_SRLI_SRAI:		begin
								if(op3_i == 6'b000000 & inst_i[25] == 0) begin		//SRLI
									wreg_o = `WriteEnable;
									aluop_o = `EXE_SRL_OP;
									alusel_o = `EXE_RES_SHIFT;
									reg1_read_o = 1'b1;	reg2_read_o = 1'b0;	  	
									imm[5:0] = inst_i[25:20];
									wd_o = inst_i[11:7];
									instvalid = `InstValid;
								end
								if(op3_i == 6'b010000 & inst_i[25] == 0) begin		//SRAI
									wreg_o = `WriteEnable;
									aluop_o = `EXE_SRA_OP;
									alusel_o = `EXE_RES_SHIFT;
									reg1_read_o = 1'b1;	reg2_read_o = 1'b0;	  	
									imm[5:0] = inst_i[25:20];
									wd_o = inst_i[11:7];
									instvalid = `InstValid;
								end
							end
							`EXE_ADDI:		begin											//ADDI
								wreg_o = `WriteEnable;
								aluop_o = `EXE_ADDI_OP;
								alusel_o = `EXE_RES_ARITHMETIC;
								reg1_read_o = 1'b1;
								reg2_read_o = 1'b0;	  	
								imm = {{20{inst_i[31]}}, inst_i[31:20]};
								wd_o = inst_i[11:7];		  	
								instvalid = `InstValid;
							end
							`EXE_SLTI:	begin												//SLTI
								wreg_o = `WriteEnable;
								aluop_o = `EXE_SLT_OP;
								alusel_o = `EXE_RES_ARITHMETIC;
								reg1_read_o = 1'b1;
								reg2_read_o = 1'b0;	  	
								imm = {{20{inst_i[31]}}, inst_i[31:20]};
								wd_o = inst_i[11:7];		  	
								instvalid = `InstValid;
							end
							`EXE_SLTIU:		begin										//SLTIU
								wreg_o = `WriteEnable;
								aluop_o = `EXE_SLTU_OP;
								alusel_o = `EXE_RES_ARITHMETIC;
								reg1_read_o = 1'b1;
								reg2_read_o = 1'b0;	  	
								imm = {{20{inst_i[31]}}, inst_i[31:20]};
								wd_o = inst_i[11:7];		  	
								instvalid = `InstValid;
							end
							default:		begin
							end
					endcase
				end
				`EXE_R_INST:		begin
					case(op2)
						`EXE_AND_REMU:		begin
							if(op3 == 7'b0000000) begin			//AND
		    					wreg_o = `WriteEnable;
								aluop_o = `EXE_AND_OP;
		  						alusel_o = `EXE_RES_LOGIC;
								reg1_read_o = 1'b1;
								reg2_read_o = 1'b1;
								wd_o = inst_i[11:7];
		  						instvalid = `InstValid;
							end
							if(op3 == 7'b0000001) begin		//REMU
								wreg_o = `WriteEnable;
								aluop_o = `EXE_REMU_OP;
								alusel_o = `EXE_RES_DIV;
		  						reg1_read_o = 1'b1;
								reg2_read_o = 1'b1;
								wd_o = inst_i[11:7];
								instvalid = `InstValid;
							end
						end
						`EXE_OR_REM:		begin
							if(op3 == 7'b0000000) begin			//OR
		    					wreg_o = `WriteEnable;
								aluop_o = `EXE_OR_OP;
		  						alusel_o = `EXE_RES_LOGIC;
								reg1_read_o = 1'b1;
								reg2_read_o = 1'b1;
								wd_o = inst_i[11:7];
		  						instvalid = `InstValid;
							end
							if(op3 == 7'b0000001) begin		//REMU
								wreg_o = `WriteEnable;
								aluop_o = `EXE_REM_OP;
								alusel_o = `EXE_RES_DIV;
		  						reg1_read_o = 1'b1;
								reg2_read_o = 1'b1;
								wd_o = inst_i[11:7];
								instvalid = `InstValid;
							end
						end
						`EXE_XOR_DIV:		begin
							if(op3 == 7'b0000000) begin			//XOR
		    					wreg_o = `WriteEnable;
								aluop_o = `EXE_XOR_OP;
		  						alusel_o = `EXE_RES_LOGIC;
								reg1_read_o = 1'b1;
								reg2_read_o = 1'b1;
								wd_o = inst_i[11:7];
		  						instvalid = `InstValid;
							end
							if(op3 == 7'b0000001) begin			//DIV
								wreg_o = `WriteEnable;
								aluop_o = `EXE_DIV_OP;
								alusel_o = `EXE_RES_DIV;
		  						reg1_read_o = 1'b1;
								reg2_read_o = 1'b1;
								wd_o = inst_i[11:7];
								instvalid = `InstValid;	
							end
						end
						`EXE_SLL_MULH:		begin
							if(op3 == 7'b0000000) begin		//SLL
								wreg_o = `WriteEnable;
								aluop_o = `EXE_SLL_OP;
		  						alusel_o = `EXE_RES_SHIFT;
								reg1_read_o = 1'b1;
								reg2_read_o = 1'b1;
								wd_o = inst_i[11:7];
		  						instvalid = `InstValid;
							end
							if(op3 == 7'b0000001) begin		//MULH
								wreg_o = `WriteEnable;
								aluop_o = `EXE_MULH_OP;
								alusel_o = `EXE_RES_MUL;
		  						reg1_read_o = 1'b1;
								reg2_read_o = 1'b1;
								wd_o = inst_i[11:7];
								instvalid = `InstValid;	
							end
						end
						`EXE_SRL_SRA_DIVU:		begin
							if(op3 == 7'b0000000) begin		//SRL
								wreg_o = `WriteEnable;
								aluop_o = `EXE_SRL_OP;
		  						alusel_o = `EXE_RES_SHIFT;
								reg1_read_o = 1'b1;
								reg2_read_o = 1'b1;
								wd_o = inst_i[11:7];
		  						instvalid = `InstValid;
							end
							if(op3 == 7'b0100000) begin		//SRA
								wreg_o = `WriteEnable;
								aluop_o = `EXE_SRA_OP;
		  						alusel_o = `EXE_RES_SHIFT;
								reg1_read_o = 1'b1;
								reg2_read_o = 1'b1;
								wd_o = inst_i[11:7];
		  						instvalid = `InstValid;	
							end
							if(op3 == 7'b0000001) begin		//DIVU
								wreg_o = `WriteEnable;
								aluop_o = `EXE_DIVU_OP;
								alusel_o = `EXE_RES_DIV;
		  						reg1_read_o = 1'b1;
								reg2_read_o = 1'b1;
								wd_o = inst_i[11:7];
								instvalid = `InstValid;	
							end
						end
						`EXE_ADD_SUB_MUL:		begin
							if(op3 == 7'b0000000) begin		//ADD
								wreg_o = `WriteEnable;
								aluop_o = `EXE_ADD_OP;
		  						alusel_o = `EXE_RES_ARITHMETIC;
								reg1_read_o = 1'b1;
								reg2_read_o = 1'b1;
								wd_o = inst_i[11:7];
		  						instvalid = `InstValid;
							end
							if(op3 == 7'b0100000)begin			//SUB
								wreg_o = `WriteEnable;
								aluop_o = `EXE_SUB_OP;
		  						alusel_o = `EXE_RES_ARITHMETIC;
								reg1_read_o = 1'b1;
								reg2_read_o = 1'b1;
								wd_o = inst_i[11:7];
		  						instvalid = `InstValid;
							end
							if(op3 == 7'b0000001) begin		//MUL
								wreg_o = `WriteEnable;
								aluop_o = `EXE_MUL_OP;
								alusel_o = `EXE_RES_MUL;
								reg1_read_o = 1'b1;
								reg2_read_o = 1'b1;
								wd_o = inst_i[11:7];
								instvalid = `InstValid;
							end
						end
						`EXE_SLT_MULHSU:	begin
							if(op3 == 7'b0000000) begin		//SLT
								wreg_o = `WriteEnable;
								aluop_o = `EXE_SLT_OP;
		  						alusel_o = `EXE_RES_ARITHMETIC;
								reg1_read_o = 1'b1;
								reg2_read_o = 1'b1;
								wd_o = inst_i[11:7];
		  						instvalid = `InstValid;
							end
							if(op3 == 7'b0000001) begin		//MULHSU
								wreg_o = `WriteEnable;
								aluop_o = `EXE_MULHSU_OP;
		  						alusel_o = `EXE_RES_MUL;
								reg1_read_o = 1'b1;
								reg2_read_o = 1'b1;
								wd_o = inst_i[11:7];
		  						instvalid = `InstValid;
							end
						end
						`EXE_SLTU_MULHU:	begin
							if(op3 == 7'b0000000) begin		//SLTU
								wreg_o = `WriteEnable;
								aluop_o = `EXE_SLTU_OP;
		  						alusel_o = `EXE_RES_ARITHMETIC;
								reg1_read_o = 1'b1;
								reg2_read_o = 1'b1;
								wd_o = inst_i[11:7];
		  						instvalid = `InstValid;
							end
							if(op3 == 7'b0000001) begin		//MULHU
								wreg_o = `WriteEnable;
								aluop_o = `EXE_MULHU_OP;
		  						alusel_o = `EXE_RES_MUL;
								reg1_read_o = 1'b1;
								reg2_read_o = 1'b1;
								wd_o = inst_i[11:7];
		  						instvalid = `InstValid;
							end
						end
						default:		begin
						end
					endcase
				end
				`EXE_B_INST:	begin
					case(op2)
						`EXE_BEQ: 	begin
							wreg_o = `WriteDisable;			//BEQ
							aluop_o = `EXE_BEQ_OP;
							alusel_o = `EXE_RES_JUMP_BRANCH;
							reg1_read_o = 1'b1;
							reg2_read_o = 1'b1;
							instvalid = `InstValid;	
							if(reg1_o == reg2_o) begin
//								offset = {{21{inst_i[31]}}, inst_i[7], inst_i[30:25], inst_i[11:8]};
								branch_target_address_o = pc_i + ({{21{inst_i[31]}}, inst_i[7], inst_i[30:25], inst_i[11:8]} << 1);
								branch_flag_o = `Branch;
							end
						end
						`EXE_BNE: 	begin							//BNE
							wreg_o = `WriteDisable;
							aluop_o = `EXE_BNE_OP;
							alusel_o = `EXE_RES_JUMP_BRANCH;
							reg1_read_o = 1'b1;
							reg2_read_o = 1'b1;
							instvalid = `InstValid;	
							if(reg1_o != reg2_o) begin
//								offset = {{21{inst_i[31]}}, inst_i[7], inst_i[30:25], inst_i[11:8]};
								branch_target_address_o = pc_i + ({{21{inst_i[31]}}, inst_i[7], inst_i[30:25], inst_i[11:8]} << 1);
								branch_flag_o = `Branch;
							end
						end
						`EXE_BLT: 	begin							//BLT
							wreg_o = `WriteDisable;
							aluop_o = `EXE_BLT_OP;
							alusel_o = `EXE_RES_JUMP_BRANCH;
							reg1_read_o = 1'b1;
							reg2_read_o = 1'b1;
							instvalid = `InstValid;
//							temp_sum = reg1_o + reg2_o;
//							reg1_lt_reg2 = ((reg1_o[31] && !reg2_o[31]) || 
//														(!reg1_o[31] && !reg2_o[31] && temp_sum[31])||
//																(reg1_o[31] && reg2_o[31] && temp_sum[31]));
							if(reg1_lt_reg2 == 1'b1) begin
								branch_target_address_o = pc_i + ({{21{inst_i[31]}}, inst_i[7], inst_i[30:25], inst_i[11:8]} << 1);
								branch_flag_o = `Branch;
							end
						end
						`EXE_BLTU: 	begin							//BLTU
							wreg_o = `WriteDisable;
							aluop_o = `EXE_BLTU_OP;
							alusel_o = `EXE_RES_JUMP_BRANCH;
							reg1_read_o = 1'b1;
							reg2_read_o = 1'b1;
							instvalid = `InstValid;	
							if(reg1_o < reg2_o) begin
//								offset = {{21{inst_i[31]}}, inst_i[7], inst_i[30:25], inst_i[11:8]};
								branch_target_address_o = pc_i + ({{21{inst_i[31]}}, inst_i[7], inst_i[30:25], inst_i[11:8]} << 1);
								branch_flag_o = `Branch;
							end
						end
						`EXE_BGE: 	begin							//BGE
							wreg_o = `WriteDisable;
							aluop_o = `EXE_BGE_OP;
							alusel_o = `EXE_RES_JUMP_BRANCH;
							reg1_read_o = 1'b1;
							reg2_read_o = 1'b1;
							instvalid = `InstValid;
//							temp_sum = reg1_o + reg2_o;
//							reg1_lt_reg2 = ((reg1_o[31] && !reg2_o[31]) || 
//														(!reg1_o[31] && !reg2_o[31] && temp_sum[31])||
//																(reg1_o[31] && reg2_o[31] && temp_sum[31]));
							if(reg1_lt_reg2 == 1'b0) begin
//								offset = {{21{inst_i[31]}}, inst_i[7], inst_i[30:25], inst_i[11:8]};
								branch_target_address_o = pc_i + ({{21{inst_i[31]}}, inst_i[7], inst_i[30:25], inst_i[11:8]} << 1);
								branch_flag_o = `Branch;
							end
						end
						`EXE_BGEU: 	begin							//BGEU
							wreg_o = `WriteDisable;
							aluop_o = `EXE_BGEU_OP;
							alusel_o = `EXE_RES_JUMP_BRANCH;
							reg1_read_o = 1'b1;
							reg2_read_o = 1'b1;
							instvalid = `InstValid;	
							if((reg1_o > reg2_o) || (reg1_o == reg2_o)) begin
								branch_target_address_o = pc_i + ({{21{inst_i[31]}}, inst_i[7], inst_i[30:25], inst_i[11:8]} << 1);
//								branch_target_address_o = 32'h0000003c;
								branch_flag_o = `Branch;
							end
						end
						default:		begin
						end
					endcase
				end
				`EXE_L_INST: 		begin
					case(op2)
						`EXE_LB:		begin							//LB
							wreg_o = `WriteEnable;
							aluop_o = `EXE_LB_OP;
							alusel_o = `EXE_RES_LOAD_STORE;
							reg1_read_o = 1'b1;
							reg2_read_o = 1'b0;	  	
							wd_o = inst_i[11:7];
							instvalid = `InstValid;	
						end
						`EXE_LH:		begin								//LH
							wreg_o = `WriteEnable;
							aluop_o = `EXE_LH_OP;
							alusel_o = `EXE_RES_LOAD_STORE;
							reg1_read_o = 1'b1;
							reg2_read_o = 1'b0;	  	
							wd_o = inst_i[11:7];
							instvalid = `InstValid;
						end
						`EXE_LBU:		begin					//LBU
							wreg_o = `WriteEnable;
							aluop_o = `EXE_LBU_OP;
							alusel_o = `EXE_RES_LOAD_STORE;
							reg1_read_o = 1'b1;
							reg2_read_o = 1'b0;	  	
							wd_o = inst_i[11:7];
							instvalid = `InstValid;
						end
						`EXE_LHU:		begin							//LHU
							wreg_o = `WriteEnable;
							aluop_o = `EXE_LHU_OP;
							alusel_o = `EXE_RES_LOAD_STORE;
							reg1_read_o = 1'b1;
							reg2_read_o = 1'b0;	  	
							wd_o = inst_i[11:7];
							instvalid = `InstValid;
						end
						`EXE_LW:		begin									//LW
							wreg_o = `WriteEnable;
							aluop_o = `EXE_LW_OP;
							alusel_o = `EXE_RES_LOAD_STORE;
							reg1_read_o = 1'b1;
							reg2_read_o = 1'b0;	  	
							wd_o = inst_i[11:7];
							instvalid = `InstValid;
						end
						`EXE_LWU:	begin								//LWU
							wreg_o = `WriteEnable;
							aluop_o = `EXE_LWU_OP;
							alusel_o = `EXE_RES_LOAD_STORE;
							reg1_read_o = 1'b1;
							reg2_read_o = 1'b0;	  	
							wd_o = inst_i[11:7];
							instvalid = `InstValid;
						end
						`EXE_LD:	begin								//
							wreg_o = `WriteEnable;
							aluop_o = `EXE_LD_OP;
							alusel_o = `EXE_RES_LOAD_STORE;
							reg1_read_o = 1'b1;
							reg2_read_o = 1'b0;	  	
							wd_o = inst_i[11:7];
							instvalid = `InstValid;
						end
						default:		begin
						end
					endcase
				end
				`EXE_S_INST:		begin
					case(op2)
						`EXE_SB:		begin								//SB
							wreg_o = `WriteDisable;
							aluop_o = `EXE_SB_OP;
							alusel_o = `EXE_RES_LOAD_STORE;
							reg1_read_o = 1'b1;
							reg2_read_o = 1'b1;	  	
							wd_o = inst_i[11:7];
							instvalid = `InstValid;
						end
						`EXE_SH:		begin							//SH
							wreg_o = `WriteDisable;
							aluop_o = `EXE_SH_OP;
							alusel_o = `EXE_RES_LOAD_STORE;
							reg1_read_o = 1'b1;
							reg2_read_o = 1'b1;	  	
							wd_o = inst_i[11:7];
							instvalid = `InstValid;
						end
						`EXE_SW:		begin					//SW
							wreg_o = `WriteDisable;
							aluop_o = `EXE_SW_OP;
							alusel_o = `EXE_RES_LOAD_STORE;
							reg1_read_o = 1'b1;
							reg2_read_o = 1'b1;	  	
							wd_o = inst_i[11:7];
							instvalid = `InstValid;
						end
						`EXE_SD: 	begin						//
							wreg_o = `WriteDisable;
							aluop_o = `EXE_SD_OP;
							alusel_o = `EXE_RES_LOAD_STORE;
							reg1_read_o = 1'b1;
							reg2_read_o = 1'b1;	  	
							wd_o = inst_i[11:7];
							instvalid = `InstValid;
						end
					endcase
				end
				`EXE_LUI:		begin							//LUI
					wreg_o = `WriteEnable;
					aluop_o = `EXE_OR_OP;
					alusel_o = `EXE_RES_LOGIC;
					reg1_read_o = 1'b1;
					reg1_addr_o = 5'b00000;		// zero
					reg2_read_o = 1'b0;
//					imm = {inst_i[31:12],12'b0};
					imm = (inst_i >> 12)<<12;
					wd_o = inst_i[11:7];  	
					instvalid = `InstValid;	
				end
				`EXE_AUIPC_INST:		begin				//AUIPC
					wreg_o = `WriteEnable;
					aluop_o = `EXE_ADDI_OP;
					alusel_o = `EXE_RES_ARITHMETIC;
					reg1_read_o = 1'b0;
					reg2_read_o = 1'b0;
					get_current_pc = 2'b01;
					imm = ({{12{inst_i[31]}}, inst_i[31:12]} << 12);
					wd_o = inst_i[11:7];		  	
					instvalid = `InstValid;
				end
				`EXE_JAL:		begin					//JAL
					 wreg_o = `WriteEnable;
					 aluop_o = `EXE_JAL_OP;
					 alusel_o = `EXE_RES_JUMP_BRANCH;
					 reg1_read_o = 1'b0;
					 reg2_read_o = 1'b0;
					 wd_o = 5'b00001;			//defalut: x1	JAL x1, label
					 link_addr_o = pc_i + 4;
//					 offset = {{11{inst_i[31]}},{inst_i[31], inst_i[19:12], inst_i[20], inst_i[30:21]} << 1};
					 branch_target_address_o = {{11{inst_i[31]}},{inst_i[31], inst_i[19:12], inst_i[20], inst_i[30:21]} << 1} + pc_i;
					 branch_flag_o = `Branch;		  	
					 instvalid = `InstValid;
				end
				`EXE_JALR:		begin					//JALR
					wreg_o = `WriteEnable;
					aluop_o = `EXE_JALR_OP;
					alusel_o = `EXE_RES_JUMP_BRANCH;
					reg1_read_o = 1'b1;
					reg2_read_o = 1'b0;
					wd_o = 5'b00000;			//defalut: x0   JALR x0, 0(x1)
					link_addr_o = pc_i + 4;
//					offset = {{20{inst_i[31]}},inst_i[31:20]};
//					test = offset & (~1) + 8;
					branch_target_address_o = (({{20{inst_i[31]}},inst_i[31:20]} >> 1) << 1) + reg1_data_i;
					branch_flag_o = `Branch;
					instvalid = `InstValid;	
				end
				`EXE_CSR_ENV_INST:		begin
					case(op2)
						`EXE_CSRRW:		begin
							wreg_o = `WriteEnable;
							aluop_o = `EXE_CSRRW_OP;
							alusel_o = `EXE_RES_LOGIC;
							reg1_read_o = 1'b1;
							reg2_read_o = 1'b0;
							wd_o = inst_i[11:7];
//							instvalid = `InstValid;
						end
						`EXE_CSRRWI:	begin
							wreg_o = `WriteEnable;
							aluop_o = `EXE_CSRRW_OP;
							alusel_o = `EXE_RES_LOGIC;
							reg1_read_o = 1'b0;
							reg2_read_o = 1'b0;
							imm = {27'b0,inst_i[19:15]};
							wd_o = inst_i[11:7];
//							instvalid = `InstValid;
						end
						`EXE_CSRRS:		begin
							wreg_o = `WriteEnable;
							aluop_o = `EXE_CSRRS_OP;
							alusel_o = `EXE_RES_LOGIC;
							reg1_read_o = 1'b1;
							reg2_read_o = 1'b0;
							wd_o = inst_i[11:7];
//							instvalid = `InstValid;
						end
						`EXE_CSRRSI:	begin
							wreg_o = `WriteEnable;
							aluop_o = `EXE_CSRRS_OP;
							alusel_o = `EXE_RES_LOGIC;
							reg1_read_o = 1'b0;
							reg2_read_o = 1'b0;
							imm = {27'b0,inst_i[19:15]};
							wd_o = inst_i[11:7];
//							instvalid = `InstValid;
						end
						`EXE_CSRRC:		begin
							wreg_o = `WriteEnable;
							aluop_o = `EXE_CSRRC_OP;
							alusel_o = `EXE_RES_LOGIC;
							reg1_read_o = 1'b1;
							reg2_read_o = 1'b0;
							wd_o = inst_i[11:7];
//							instvalid = `InstValid;
						end
						`EXE_CSRRCI:	begin
							wreg_o = `WriteEnable;
							aluop_o = `EXE_CSRRC_OP;
							alusel_o = `EXE_RES_LOGIC;
							reg1_read_o = 1'b0;
							reg2_read_o = 1'b0;
							imm = {27'b0,inst_i[19:15]};
							wd_o = inst_i[11:7];
//							instvalid = `InstValid;
						end
							`EXE_ECALL_EBREAK_MRET:		begin
								case(inst_i[31:20])
									12'b001100000010:		begin				//MRET
										wreg_o = `WriteDisable;
										aluop_o = `EXE_MRET_OP;
										alusel_o = `EXE_RES_NOP;
										reg1_read_o = 1'b0;
										reg2_read_o = 1'b0;
										instvalid = `InstValid;
										excepttype_is_mret = `True_v;
									end
									12'b000000000000:		begin				//ECALL
										wreg_o = `WriteDisable;
										aluop_o = `EXE_ECALL_OP;
										alusel_o = `EXE_RES_NOP;
										reg1_read_o = 1'b0;
										reg2_read_o = 1'b0;
										instvalid = `InstValid;
										excepttype_is_ecall = `True_v;
									end
									12'b000000000001:		begin				//EBREAK
									end
									default:		begin
									end
								endcase
							end
					endcase
				end
		    default:			begin
//				instvalid = `InstInvalid;				此处先暂时屏蔽了非法指令异常
		    end
		  endcase		  //case op			
		end       //if
		
		if(inst_i != 32'h00000073) begin
			excepttype_is_ecall = `False_v;
		end
		if(inst_i != 32'h30200073) begin
			excepttype_is_mret = `False_v;
		end
		if((inst_i[6:0] == 7'b1110011) && (inst_i[14:12] != 3'b000) && (curr_mode != `m_mode)) begin
			instvalid = `InstInvalid;
		end else begin
			instvalid = `InstValid;
		end
	end         //always
	
	
	

	always @ (*) begin
		stallreq_for_reg1_loadrelate = `NoStop;
		if(rst == `RstEnable) begin
			reg1_o = `ZeroWord;
		end else if(pre_inst_is_load == 1'b1 && ex_wd_i == reg1_addr_o 
								&& reg1_read_o == 1'b1 ) begin
		  stallreq_for_reg1_loadrelate = `Stop;
		end else if(reg1_read_o == 1'b0) begin
			if(get_current_pc != 2'b01) begin
					reg1_o = imm;
			end else if(get_current_pc == 2'b01) begin
				reg1_o = pc_i;
			end
		end else if(reg1_read_o == 1'b1) begin
			if((ex_wreg_i == 1'b1) && (ex_wd_i == reg1_addr_o)) begin
				reg1_o = ex_wdata_i;
			end else if((mem_wreg_i == 1'b1)&& (mem_wd_i == reg1_addr_o)) begin
				reg1_o = mem_wdata_i;
			end else begin
				reg1_o = reg1_data_i;
			end
		end else begin
	    reg1_o = `ZeroWord;
	  end
	end
	
	always @ (*) begin
		stallreq_for_reg2_loadrelate = `NoStop;
		if(rst == `RstEnable) begin
			reg2_o = `ZeroWord;
		end else if(pre_inst_is_load == 1'b1 && ex_wd_i == reg2_addr_o 
								&& reg2_read_o == 1'b1 ) begin
		  stallreq_for_reg2_loadrelate = `Stop;
		end else if(reg2_read_o == 1'b0) begin
			if(get_current_pc != 2'b10) begin
					reg2_o = imm;
			end else if(get_current_pc == 2'b10) begin
				reg2_o = pc_i;
			end
		end else if(reg2_read_o == 1'b1) begin
			if((ex_wreg_i == 1'b1) && (ex_wd_i == reg2_addr_o)) begin
				reg2_o = ex_wdata_i;
			end else if((mem_wreg_i == 1'b1)&& (mem_wd_i == reg2_addr_o)) begin
				reg2_o = mem_wdata_i;
			end
			else begin
				reg2_o = reg2_data_i;
			end
		end else begin
	    reg2_o = `ZeroWord;
	  end
	end
	
//	always @ (*) begin
//		if(rst == `RstEnable) begin
//			reg2_o = `ZeroWord;
//		end else if((reg2_read_o == 1'b1) && (ex_wreg_i == 1'b1) 
//								&& (ex_wd_i == reg2_addr_o)) begin
//			reg2_o = ex_wdata_i; 
//		end else if((reg2_read_o == 1'b1) && (mem_wreg_i == 1'b1) 
//								&& (mem_wd_i == reg2_addr_o)) begin
//			reg2_o = mem_wdata_i;	
//	  end else if(reg2_read_o == 1'b1) begin
//	  	reg2_o = reg2_data_i;
//	  end else if(reg2_read_o == 1'b0) begin
//	  	reg2_o = imm;
//	  end else begin
//	    reg2_o = `ZeroWord;
//	  end
//	end

endmodule
