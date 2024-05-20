// This program was cloned from: https://github.com/ochsnega/ECE289AdvancedBadge
// License: MIT License

module core(
	input clk, // Button 0
	input rst, // Button 1
	input start, // Button 2
	input g_control, // SW 0
	input [4:0] r_control, // SW 5-1
	input locked, // Is arbiter locked?
	input [31:0] mem_out,
	output reg ask_for_lock, // Ask arbiter to lock memory
	output reg [6:0] g_out, // LED G 6-0
	output reg [15:0] r_out, // LED R 15-0
	output reg reg_w_en, // LED R 17
	output reg mem_wren, // LED R 16
	output reg [7:0] mem_address,
	output reg [31:0] mem_data
);

// Instantiate ALU
reg [31:0] alu_l_in;
reg [31:0] alu_r_in;
reg [4:0] alu_control;
wire [31:0] alu_result;
alu my_alu(alu_l_in, alu_r_in, alu_control, alu_result);

// Instantiate register file (Note: This takes a clock cycle!)
reg [31:0] reg_w_data;
reg [4:0] reg_w_add;
//reg reg_w_en;
reg [4:0] reg_rl_add;
reg [4:0] reg_rr_add;
wire [31:0] reg_rl_data;
wire [31:0] reg_rr_data;
registerFile my_registers(clk, rst, reg_w_data, reg_w_add, reg_w_en, reg_rl_add, reg_rr_add, reg_rl_data, reg_rr_data);

// FSM states
reg [6:0] S;
reg [6:0] NS;

// Define states of FSM 
parameter FSTART = 7'd0, 					// 7'b0000000
			 FETCH = 7'd1, 					// 7'b0000001
			 FETCH_BUF = 7'd2, 				// 7'b0000010
			 DECODE = 7'd3, 					// 7'b0000011
			 RR_ALU = 7'd4, 					// 7'b0000100
			 RI_ALU = 7'd5, 					// 7'b0000101
			 LUI_ALU = 7'd6, 					// 7'b0000110
			 AUIPC_ALU = 7'd7,				// 7'b0000111
			 LW = 7'd8, 						// 7'b0001000
			 SW = 7'd9,							// 7'b0001001
			 JAL = 7'd10, 						// 7'b0001010
			 JALR = 7'd11, 					// 7'b0001011
			 BR_ALU = 7'd12, 					// 7'b0001100
			 GET_REG_RR_ALU = 7'd13, 		// 7'b0001101
			 CALC_RR_ALU = 7'd14, 			// 7'b0001110
			 STORE_REG_RR_ALU = 7'd15,		// 7'b0001111
			 GET_REG_RI_ALU = 7'd16,		// 7'b0010000
			 CALC_RI_ALU = 7'd17,			// 7'b0010001
			 STORE_REG_RI_ALU = 7'd18,		// 7'b0010010
			 PC_INC = 7'd19,					// 7'b0010011
			 GET_REG_LUI_ALU = 7'd20,		// 7'b0010100
			 CALC_LUI_ALU = 7'd21,			// 7'b0010101
			 STORE_REG_LUI_ALU = 7'd22,	// 7'b0010110
			 GET_REG_AUIPC_ALU = 7'd23, 	// 7'b0010111
			 CALC_AUIPC_ALU = 7'd24,		// 7'b0011000
			 STORE_REG_AUIPC_ALU = 7'd25,	// 7'b0011001
			 GET_REG_LW = 7'd26,				// 7'b0011010
			 GET_ADD_LW = 7'd27,				// 7'b0011011
			 GET_WORD_LW = 7'd28,			// 7'b0011100
			 LW_BUFF = 7'd29,					// 7'b0011101
			 GET_REG_SW = 7'd30,				// 7'b0011110
			 GET_ADD_SW = 7'd31,				// 7'b0011111
			 STORE_WORD_SW = 7'd32,			// 7'b0100000
			 SW_BUFF = 7'd33,					// 7'b0100001
			 GET_REG_JAL = 7'd34,			// 7'b0100010
			 CALC_JAL = 7'd35,				// 7'b0100011
			 STORE_REG_JAL = 7'd36,			// 7'b0100100
			 GET_REG_JALR = 7'd37,			// 7'b0100101
			 CALC_JALR = 7'd38,				// 7'b0100110
			 STORE_REG_JALR = 7'd39,		// 7'b0100111
			 GET_REG_BR_ALU = 7'd40,		// 7'b0101000
			 CALC_BR_ALU = 7'd41,			// 7'b0101001
			 DECIDE_BR = 7'd42,				// 7'b0101010
			 PRE_FETCH = 7'd43,				// 7'b0101011
			 LOCK = 7'd44,						// 7'b0101100
			 LOCK_BUF = 7'd48,				// 7'b0110000
			 UNLOCK = 7'd45,					// 7'b0101101
			 FETCH_BUF_2 = 7'd46,			// 7'b0101110
			 FETCH_BUF_3 = 7'd47,			// 7'b0101111
			 ERROR = 7'b1111111;				// 7'b1111111
			 
// Define program counter/instruction register:
reg [7:0] PC;
reg [31:0] IR;
			 
// Move to next state
always@(posedge clk or negedge rst)
begin
	if (rst == 1'b0)
		S <= FSTART;
	else
		S <= NS;
end

// Choose next state
always@(*)
begin
	case (S)
		FSTART:
		begin
			if (start == 1'b1)
			begin
				NS = PRE_FETCH;
			end
			else
			begin
				NS = FSTART;
			end
		end
		PRE_FETCH: NS = FETCH;
		FETCH: NS = FETCH_BUF;
		FETCH_BUF: NS = FETCH_BUF_2;
		FETCH_BUF_2: NS = FETCH_BUF_3;
		FETCH_BUF_3: NS = DECODE;
		DECODE:
		begin
		case (IR[6:0])
			7'b0110011: NS = RR_ALU;
			7'b0010011: NS = RI_ALU;
			7'b0110111: NS = LUI_ALU;
			7'b0010111: NS = AUIPC_ALU;
			7'b0001111: NS = LOCK;
			7'b0000111: NS = UNLOCK;
			7'b0000011: NS = LW;
			7'b0100011: NS = SW;
			7'b1101111: NS = JAL;
			7'b1100111: NS = JALR;
			7'b1100011: NS = BR_ALU;
			default: NS = ERROR;
		endcase
		end
		RR_ALU: NS = GET_REG_RR_ALU; // Register-Register ALU Instructions
		GET_REG_RR_ALU: NS = CALC_RR_ALU;
		CALC_RR_ALU: NS = STORE_REG_RR_ALU;
		STORE_REG_RR_ALU: NS = PC_INC;
		RI_ALU: NS = GET_REG_RI_ALU; // Register-Imediate ALU Instructions
		GET_REG_RI_ALU: NS = CALC_RI_ALU;
		CALC_RI_ALU: NS = STORE_REG_RI_ALU;
		STORE_REG_RI_ALU: NS = PC_INC;
		LUI_ALU: NS = GET_REG_LUI_ALU; // LUI ALU Instruction
		GET_REG_LUI_ALU: NS = CALC_LUI_ALU;
		CALC_LUI_ALU: NS = STORE_REG_LUI_ALU;
		STORE_REG_LUI_ALU: NS = PC_INC;
		AUIPC_ALU: NS = GET_REG_AUIPC_ALU; // AUIPC ALU Instruction
		GET_REG_AUIPC_ALU: NS = CALC_AUIPC_ALU;
		CALC_AUIPC_ALU: NS = STORE_REG_AUIPC_ALU; 
		STORE_REG_AUIPC_ALU: NS = PC_INC;
		LW: NS = GET_REG_LW; // LW Instruction
		GET_REG_LW: NS = GET_ADD_LW;
		GET_ADD_LW: NS = GET_WORD_LW;
		GET_WORD_LW: NS = LW_BUFF;
		LW_BUFF: NS = PC_INC;
		SW: NS = GET_REG_SW; // SW Instruction
		GET_REG_SW: NS = GET_ADD_SW;
		GET_ADD_SW: NS = STORE_WORD_SW;
		STORE_WORD_SW: NS = SW_BUFF;
		SW_BUFF: NS = PC_INC;
		JAL: NS = GET_REG_JAL; // JAL Instruction
		GET_REG_JAL: NS = CALC_JAL; 
		CALC_JAL: NS = STORE_REG_JAL; // Note this state changes the PC, so no need to go to a PC changing state.
		STORE_REG_JAL: NS = PRE_FETCH;
		JALR: NS = GET_REG_JALR; // JALR Instruction
		GET_REG_JALR: NS = CALC_JALR;
		CALC_JALR: NS = STORE_REG_JALR; // Note this state changes the PC, so no need to go to a PC changing state.
		STORE_REG_JALR: NS = PRE_FETCH;
		BR_ALU: NS = GET_REG_BR_ALU; // Branch ALU Instructions
		GET_REG_BR_ALU: NS = CALC_BR_ALU;
		CALC_BR_ALU: NS = DECIDE_BR;
		DECIDE_BR: NS = PRE_FETCH;
		PC_INC: NS = PRE_FETCH; // Increment PC
		LOCK: NS = LOCK_BUF; // Get lock from arbiter
		LOCK_BUF:
		begin
			if (locked == 1'b0)
				NS = LOCK;
			else
				NS = PC_INC;
		end
		UNLOCK: NS = PC_INC; // Unlock from arbiter
		ERROR: NS = ERROR;
		default: NS = ERROR; // Catch Errors
	endcase
end

// What happens in each state
always@(posedge clk or negedge rst)
begin
	if (rst == 1'b0) // Reset variables
	begin
		PC <= 8'b0;
		IR <= 32'b0;
		mem_address <= 8'b0;
		mem_data <= 32'b0;
		mem_wren <= 1'b0;
		alu_l_in <= 32'b0;
		alu_r_in <= 32'b0;
		alu_control <= 5'b0;
		reg_w_data <= 32'b0;
		reg_w_add <= 5'b0;
		reg_w_en <= 1'b0;
		reg_rl_add <= 5'b0;
		reg_rr_add <= 5'b0;
		ask_for_lock <= 1'b0;
	end
	else
	begin
	case (S) // Change variables for each state
		FSTART:
		begin
			PC <= 8'b0;
			IR <= 32'b0;
			mem_address <= 8'b0;
			mem_data <= 32'b0;
			mem_wren <= 1'b0;
			alu_l_in <= 32'b0;
			alu_r_in <= 32'b0;
			alu_control <= 5'b0;
			reg_w_data <= 32'b0;
			reg_w_add <= 5'b0;
			reg_w_en <= 1'b0;
			reg_rl_add <= 5'b0;
			reg_rr_add <= 5'b0;
			ask_for_lock <= 1'b0;
		end
		PRE_FETCH:
		begin
			mem_address <= PC;
		
			PC <= PC;
			IR <= IR;
			//mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		FETCH: 
		begin
			mem_address <= PC;
			mem_wren <= 1'b0;
			IR <= mem_out;
			
			PC <= PC;
			IR <= IR;
			//mem_address <= mem_address;
			mem_data <= mem_data;
			//mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		FETCH_BUF:
		begin
			IR <= mem_out;
			
			PC <= PC;
			//IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		FETCH_BUF_2:
		begin
			IR <= mem_out;
			
			PC <= PC;
			//IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		FETCH_BUF_3:
		begin
			IR <= mem_out;
			
			PC <= PC;
			//IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		DECODE:
		begin
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		PC_INC:
		begin
			reg_w_en <= 1'b0;
			mem_wren <= 1'b0;
			PC <= PC + 1'b1;
			
			//PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			//mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			//reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		RR_ALU: // Register-Register ALU Instructions
		begin
		case (IR[14:12])
			3'b000: 
			begin
			case (IR[31:25])
				7'b0000000: alu_control <= 5'd0;
				7'b0100000: alu_control <= 5'd1;
				7'b0000001: alu_control <= 5'd10;
				default: alu_control <= 5'd31;
			endcase
			end
			3'b001: alu_control <= 5'd9;
			3'b010: alu_control <= 5'd5;
			3'b011: alu_control <= 5'd6;
			3'b100: alu_control <= 5'd4;
			3'b101:
			begin
			case (IR[31:25])
				7'b0100000: alu_control <= 5'd7;
				7'b0000000: alu_control <= 5'd8;
				default: alu_control <= 5'd31;
			endcase
			end
			3'b110: alu_control <= 5'd3;
			3'b111: alu_control <= 5'd2;
		endcase
			
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			//alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		GET_REG_RR_ALU:
		begin
			reg_rl_add <= IR[19:15];
			reg_rr_add <= IR[24:20];
			
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			//reg_rl_add <= reg_rl_add;
			//reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		CALC_RR_ALU:
		begin
			alu_l_in <= reg_rl_data;
			alu_r_in <= reg_rr_data;
			reg_w_data <= alu_result;
			
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			//alu_l_in <= alu_l_in;
			//alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			//reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		STORE_REG_RR_ALU:
		begin
			reg_w_data <= alu_result;
			reg_w_add <= IR[11:7];
			reg_w_en <= 1'b1;
			
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			//reg_w_data <= reg_w_data;
			//reg_w_add <= reg_w_add;
			//reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		RI_ALU: // Register-Immediate ALU Instructions
		begin
		case (IR[14:12])
			3'b000: alu_control <= 5'd0;
			3'b001: alu_control <= 5'd9;
			3'b010: alu_control <= 5'd5;
			3'b011: alu_control <= 5'd6;
			3'b100: alu_control <= 5'd4;
			3'b101:
			begin
			case (IR[31:25])
				7'b0100000: alu_control <= 5'd7;
				7'b0000000: alu_control <= 5'd8;
				default: alu_control <= 5'd31;
			endcase
			end
			3'b110: alu_control <= 5'd3;
			3'b111: alu_control <= 5'd2;
		endcase
		
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			//alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		GET_REG_RI_ALU:
		begin
			reg_rl_add <= IR[19:15];
		case (IR[31])
			1'b0: alu_r_in <= {20'h0, IR[31:20]};
			1'b1: alu_r_in <= {20'hfffff, IR[31:20]};
		endcase
		
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			//alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			//reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		CALC_RI_ALU:
		begin
			alu_l_in <= reg_rl_data;
			reg_w_data <= alu_result;
			
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			//alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			//reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		STORE_REG_RI_ALU:
		begin
			reg_w_data <= alu_result;
			reg_w_add <= IR[11:7];
			reg_w_en <= 1'b1;
			
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			//reg_w_data <= reg_w_data;
			//reg_w_add <= reg_w_add;
			//reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		LUI_ALU: 
		begin
			alu_control <= 5'd11; // LUI ALU Instruction
			
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			//alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		GET_REG_LUI_ALU:
		begin
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		CALC_LUI_ALU:
		begin
			alu_r_in <= {12'b0, IR[31:12]};
			reg_w_data <= alu_result;
			
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			//alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			//reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		STORE_REG_LUI_ALU:
		begin
			reg_w_data <= alu_result;
			reg_w_add <= IR[11:7];
			reg_w_en <= 1'b1;
			
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			//reg_w_data <= reg_w_data;
			//reg_w_add <= reg_w_add;
			//reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		AUIPC_ALU: 
		begin
			alu_control <= 5'd11; // AUIPC ALU Instruction
			
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			//alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		GET_REG_AUIPC_ALU:
		begin
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		CALC_AUIPC_ALU:
		begin
			alu_r_in <= {12'b0, IR[31:12]};
			reg_w_data <= alu_result + PC;
			
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			//alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			//reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		STORE_REG_AUIPC_ALU:
		begin
			reg_w_data <= alu_result + PC;
			reg_w_add <= IR[11:7];
			reg_w_en <= 1'b1;
			
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			//reg_w_data <= reg_w_data;
			//reg_w_add <= reg_w_add;
			//reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		LW: // Load Word Instruction
		begin
			reg_rl_add <= IR[19:15];
		case (IR[31])
			1'b0: mem_address <= reg_rl_data[7:0] + {1'b0, IR[26:20]};
			1'b1: mem_address <= reg_rl_data[7:0] + {1'b1, IR[26:20]};
		endcase
		
			PC <= PC;
			IR <= IR;
			//mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			//reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		GET_REG_LW:
		begin
		case (IR[31])
			1'b0: mem_address <= reg_rl_data[7:0] + {1'b0, IR[26:20]};
			1'b1: mem_address <= reg_rl_data[7:0] + {1'b1, IR[26:20]};
		endcase
			
			PC <= PC;
			IR <= IR;
			//mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		GET_ADD_LW:
		begin
		case (IR[31])
			1'b0: mem_address <= reg_rl_data[7:0] + {1'b0, IR[26:20]};
			1'b1: mem_address <= reg_rl_data[7:0] + {1'b1, IR[26:20]};
		endcase
			reg_w_data <= mem_out;
			
			PC <= PC;
			IR <= IR;
			//mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			//reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		GET_WORD_LW:
		begin
			reg_w_data <= mem_out;
			reg_w_en <= 1'b1;
			reg_w_add <= IR[11:7];
			
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			//reg_w_data <= reg_w_data;
			//reg_w_add <= reg_w_add;
			//reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		LW_BUFF: 
		begin
			reg_w_en <= 1'b0;
			
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			//reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		SW: // Store Word Instruction
		begin
			reg_rl_add <= IR[19:15]; // Mem address
			reg_rr_add <= IR[24:20]; // Mem data
			
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			//reg_rl_add <= reg_rl_add;
			//reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		GET_REG_SW: 
		begin
		case (IR[31])
			1'b0: mem_address <= reg_rl_data[7:0] + {1'b0, IR[26:25], IR[11:7]};
			1'b1: mem_address <= reg_rl_data[7:0] + {1'b1, IR[26:25], IR[11:7]};
		endcase
		
			PC <= PC;
			IR <= IR;
			//mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		GET_ADD_SW:
		begin
		case (IR[31])
			1'b0: mem_address <= reg_rl_data[7:0] + {1'b0, IR[26:25], IR[11:7]};
			1'b1: mem_address <= reg_rl_data[7:0] + {1'b1, IR[26:25], IR[11:7]};
		endcase
			mem_data <= reg_rr_data;
			
			PC <= PC;
			IR <= IR;
			//mem_address <= mem_address;
			//mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		STORE_WORD_SW:
		begin
			mem_wren <= 1'b1;
			
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			//mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		SW_BUFF:
		begin
			mem_wren <= 1'b0;
			
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			//mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		JAL: // JAL Instruction
		begin
			reg_w_data <= {24'b0, PC + 8'd1};
			reg_w_add <= IR[11:7];
			reg_w_en <= 1'b1;
			
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			//reg_w_data <= reg_w_data;
			//reg_w_add <= reg_w_add;
			//reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		GET_REG_JAL:
		begin
			PC <= PC + {IR[31], IR[18:12]};
			reg_w_en <= 1'b0;
			
			//PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			//reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		CALC_JAL:
		begin
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		STORE_REG_JAL:
		begin
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		JALR: // JALR Instruction
		begin
			reg_w_data <= {24'b0, PC + 8'd1};
			reg_w_add <= IR[11:7];
			reg_w_en <= 1'b1;
			reg_rl_add <= IR[19:15];
			
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			//reg_w_data <= reg_w_data;
			//reg_w_add <= reg_w_add;
			//reg_w_en <= 1'b0;
			//reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		GET_REG_JALR:
		begin
			reg_w_en <= 1'b0;
			PC <= ({reg_rl_data[31], reg_rl_data[6:0]} + {IR[31], IR[26:20]}) & 8'hfe;
			
			//PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			//reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		CALC_JALR:
		begin
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		STORE_REG_JALR:
		begin
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		BR_ALU:
		begin
		case (IR[14:12])
			3'b000: alu_control <= 5'd12;
			3'b001: alu_control <= 5'd13;
			3'b100: alu_control <= 5'd14;
			3'b101: alu_control <= 5'd15;
			3'b110: alu_control <= 5'd16;
			3'b111: alu_control <= 5'd17;
			default: alu_control <= 5'd31;
		endcase
			reg_rl_add <= IR[19:15];
			reg_rr_add <= IR[24:20];
			
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			//alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			//reg_rl_add <= reg_rl_add;
			//reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		GET_REG_BR_ALU:
		begin
			reg_rl_add <= IR[19:15];
			reg_rr_add <= IR[24:20];
			alu_l_in <= reg_rl_data;
			alu_r_in <= reg_rr_data;
			
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			//alu_l_in <= alu_l_in;
			//alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			//reg_rl_add <= reg_rl_add;
			//reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		CALC_BR_ALU:
		begin
			alu_l_in <= reg_rl_data;
			alu_r_in <= reg_rr_data;
			
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			//alu_l_in <= alu_l_in;
			//alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		DECIDE_BR:
		begin
			if (alu_result[0] == 1'b1)
			begin
				PC <= PC + {IR[31], IR[26:25], IR[11:7]};
			end
			else
			begin
				PC <= PC + 1'd1; // Is this 1 or 4?
			end
			
			//PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		LOCK:
		begin
			ask_for_lock <= 1'b1;
			
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			//ask_for_lock <= ask_for_lock;
		end
		LOCK_BUF:
		begin
			ask_for_lock <= 1'b1;
			
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			//ask_for_lock <= ask_for_lock;
		end
		UNLOCK:
		begin
			ask_for_lock <= 1'b0;
			
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			//ask_for_lock <= ask_for_lock;
		end
		ERROR: 
		begin
			alu_control <= 5'd20;
			
			PC <= PC;
			IR <= IR;
			mem_address <= mem_address;
			mem_data <= mem_data;
			mem_wren <= 1'b0;
			alu_l_in <= alu_l_in;
			alu_r_in <= alu_r_in;
			//alu_control <= alu_control;
			reg_w_data <= reg_w_data;
			reg_w_add <= reg_w_add;
			reg_w_en <= 1'b0;
			reg_rl_add <= reg_rl_add;
			reg_rr_add <= reg_rr_add;
			ask_for_lock <= ask_for_lock;
		end
		default:
		begin
			PC <= 8'b0;
			IR <= 32'b0;
			mem_address <= 8'b0;
			mem_data <= 32'b0;
			mem_wren <= 1'b0;
			alu_l_in <= 32'b0;
			alu_r_in <= 32'b0;
			alu_control <= 5'b0;
			reg_w_data <= 32'b0;
			reg_w_add <= 5'b0;
			reg_w_en <= 1'b0;
			reg_rl_add <= 5'b0;
			reg_rr_add <= 5'b0;
			ask_for_lock <= ask_for_lock;
		end
	endcase
	end
end


// Input/output handling (multiplexor for showing state of system/each signal)
// Green LED
always@(*)
begin
	if (g_control == 1'b1)
	begin
		g_out = S;
	end
	else
	begin
		g_out = NS;
	end
end

// Red LED
always@(*)
begin
case (r_control)
	5'b00000: r_out = IR[31:16];
	5'b00001: r_out = IR[15:0];
	5'b00010: r_out = {8'b0, PC};
	5'b00011: r_out = {8'b0, mem_address};
	5'b00100: r_out = mem_data[31:16];
	5'b00101: r_out = mem_data[15:0];
	5'b00110: r_out = mem_out[31:16];
	5'b00111: r_out = mem_out[15:0];
	5'b01000: r_out = alu_l_in[31:16];
	5'b01001: r_out = alu_l_in[15:0];
	5'b01010: r_out = alu_r_in[31:16];
	5'b01011: r_out = alu_r_in[15:0];
	5'b01100: r_out = alu_result[31:16];
	5'b01101: r_out = alu_result[15:0];
	5'b01110: r_out = {11'b0, alu_control};
	5'b01111: r_out = {11'b0, reg_w_add};
	5'b10000: r_out = reg_w_data[31:16];
	5'b10001: r_out = reg_w_data[15:0];
	5'b10010: r_out = {11'b0, reg_rl_add};
	5'b10011: r_out = {11'b0, reg_rr_add};
	5'b10100: r_out = reg_rl_data[31:16];
	5'b10101: r_out = reg_rl_data[15:0];
	5'b10110: r_out = reg_rr_data[31:16];
	5'b10111: r_out = reg_rr_data[15:0];
	default: r_out = 16'b0;
endcase
end

/*always@(*)
begin
case (r_control)
	5'd0: r_out = IR[31:16];
	5'd1: r_out = IR[15:0];
	5'd2: r_out = {8'b0, PC};
	5'd3: r_out = {8'b0, mem_address};
	5'd4: r_out = mem_data[31:16];
	5'd5: r_out = mem_data[15:0];
	5'd6: r_out = mem_out[31:16];
	5'd7: r_out = mem_out[15:0];
	5'd8: r_out = alu_l_in[31:16];
	5'd9: r_out = alu_l_in[15:0];
	5'd10: r_out = alu_r_in[31:16];
	5'd11: r_out = alu_r_in[15:0];
	5'd12: r_out = alu_result[31:16];
	5'd13: r_out = alu_result[15:0];
	5'd14: r_out = {11'b0, alu_control};
	5'd15: r_out = {11'b0, reg_w_add};
	5'd16: r_out = reg_w_data[31:16];
	5'd17: r_out = reg_w_data[15:0];
	5'd18: r_out = {11'b0, reg_rl_add};
	5'd19: r_out = {11'b0, reg_rr_add};
	5'd20: r_out = reg_rl_data[31:16];
	5'd21: r_out = reg_rl_data[15:0];
	5'd22: r_out = reg_rr_data[31:16];
	5'd23: r_out = reg_rr_data[15:0];
	default: r_out = 16'b0;
endcase
end*/


endmodule 