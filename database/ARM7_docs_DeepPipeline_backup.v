// This program was cloned from: https://github.com/chsasank/ARM7
// License: MIT License

`define multiply				0
`define multiplyLong			1
`define branchAndExchange		2
`define SingleDataSwap			3
`define HalfwordDataTransferR	4
`define HalfwordDataTransferI	5
`define signedDataTransfer		6
`define dataProcessing			7
`define loadStoreUnsigned		8
`define undefined				9
`define blockDataTransfer		10
`define branch					11
`define coprocessor				12

module DeepPipline (input clk);

/******************
*
* F: Instruction Fetch and decode
*
******************/
wire[31:0] instr;
reg fetch_instr;
instr_cache InstructionCache(//inputs
							.PC(pc),
							.read_enable(fetch_instr),
							.clk(clk),
							
							//outputs
							.instr(instr)		
							
							);

inst_decode InstructionDecoder(
							.ir(instr),
							
							.type(type)			
							
							);

/*******F/R*****/
reg[31:0] F_R_instr; // = instr in always
reg[3:0] F_R_type;		//= type

/******************
*
* R: Register Read (RegisterFile access)
*
******************/

wire[31:0] out_data_1;
wire[31:0] out_data_2;
wire[31:0] out_data_3;
wire[31:0] operand_2;
wire[3:0] type;
wire[31:0] cspr;
wire[31:0] pc;

reg[3:0] read_address; //have to change based on instruction

//For writeback.
reg[3:0] write_address;
reg[31:0] write_data;
reg write_enable;
reg[31:0] pc_update;
reg pc_write;
reg cspr_write;
reg[31:0] cspr_update;
//



register_file RegisterFile(	//inputs
							.in_address1(read_address),
							.in_address2(F_R_instr[11:8]),
							.in_address3(F_R_instr[3:0]),
							.in_address4(write_address),

							//.universal_read_address(),
							
							.in_data(write_data),
							.write_enable(write_enable),
							.pc_update(pc_update), 
							.pc_write(pc_write), 
							.cspr_write(cspr_write), 
							.cspr_update(cspr_update),
							.clk(clk), 
							
							//outputs
							.out_data1(out_data_1),
							.out_data2(out_data_2),
							.out_data3(out_data_3),
							
							//s.universal_out_data(),
							
							.pc(pc), 
							.cspr(cspr)			
							
							);

/*******R/MUL*****/
reg[3:0] R_MUL_type;			//= F_R_type
reg[31:0] R_MUL_instr;			//=F_R_instr
reg[31:0] R_MUL_out_data_1;	//=out_data_1
reg[31:0] R_MUL_out_data_2;	//=out_data_2
reg[31:0] R_MUL_out_data_3;	//=out_data_3

/******************
*
* MUL : Multiply (Multiply)
*
******************/

wire[31:0] mult_result;
wire[3:0] mult_nzcv;


multiplier Multiplier(
							.Rs(R_MUL_out_data_2), 
							.Rm(R_MUL_out_data_3),
							
							.result(mult_result)

							);


/*******MUL/ALU*****/
reg[3:0] MUL_ALU_type;			//= //= make this 'nop' of condchecker says it will not be executed else, MUL_ALU_type
reg[31:0] MUL_ALU_instr;		//=R_MUL_instr
reg[31:0] MUL_ALU_out_data_1;	//=R_MUL_out_data_1
reg[31:0] MUL_ALU_out_data_2;	//=R_MUL_out_data_2
reg[31:0] MUL_ALU_out_data_3;	//=R_MUL_out_data_3
reg [31:0] MUL_ALU_mult_result;	// = mult_result
//reg [31:0] ; //= shifter_result;
reg MUL_ALU_c_update; 	//= c_update
reg MUL_ALU_c_write;	// = c_write
/******************
*
* ALU : ALU (Barrel shifter, ALU and condition code checker.)
*
******************/


wire[31:0] alu_result;
wire[3:0] alu_nzcv;
wire alu_is_writeback;
wire will_this_be_executed;

wire c_to_alu;
wire[31:0] shifter_result;

reg[3:0] nzcv_forward;	//connected to alu. fed from alu.

reg use_shifter;
reg[31:0] alu_operand_1;
reg[31:0] alu_operand_2;
reg[3:0] alu_opcode;


bshift BarrelShifter(		
							.instr_bit_25(MUL_ALU_instr[25]),
							.imm_value(MUL_ALU_instr[11:0]), 
							.Rs(MUL_ALU_out_data_2), 
							.Rm(MUL_ALU_out_data_3), 
							.cin(nzcv_forward[1]),
							.direct_data(alu_operand_2),
							.use_shifter(use_shifter),

							
							.operand2(shifter_result), 
							.c_to_alu(c_to_alu)
							
							);

alu ALU(
							.opcode(alu_opcode), 
							.operand_1(alu_operand_1), 
							.operand_2(shifter_result), 
							.nzcv_old(nzcv_forward), //I have forwarded this from result of alu itself
							.c_from_shifter(MUL_ALU_c_update), 
							
							.result(alu_result), 
							.nzcv(alu_nzcv), 
							.isWriteback(alu_is_writeback)
							
							);

cond conditionFieldChecker(
							.nzcv(alu_nzcv),	//we check for condition right after calculation of nzcv flags. Check this with previous instruction.
							.condition_code(R_MUL_instr[31:28]),//i.e  with instruction from previous pipeline
							
							.will_this_be_executed(will_this_be_executed)
							
							);

/*******ALU/MEM*****/
reg[3:0]  ALU_MEM_type;			
reg[31:0] ALU_MEM_instr;			//
reg[31:0] ALU_MEM_out_data_1;	//=
reg[31:0] ALU_MEM_out_data_2;	//=
reg[31:0] ALU_MEM_out_data_3;	//=
reg [31:0] ALU_MEM_mult_result;	// = MUL_ALU_mult_result
reg [31:0] ALU_MEM_alu_result;	// = alu_result
reg [3:0] ALU_MEM_alu_nzcv;		// = alu_nzcv
reg ALU_MEM_alu_is_writeback;	//  = alu_is_writeback
//nzcv_forward = alu_nzcv;

/******************
*
* MEM: Memory (Memory access)
*
******************/
wire[31:0] memory_out_data;

reg[31:0] memory_data_address;
reg[31:0] memory_in_data;
reg memory_write_enable;
reg memory_read_enable;
reg isByte;

data_cache DataCache(
							.data_address(memory_data_address),
							.in_data(memory_in_data),
							.read_enable(memory_read_enable),
							.write_enable(memory_write_enable),
							.isByte(isByte),
							.clk(clk),
							
							.out_data(memory_out_data)
							
							);

/*******MEM/W*****/
reg[3:0]  MEM_W_type;			//= ALU_MEM_type
reg[31:0] MEM_W_instr;			//
reg[31:0] MEM_W_out_data_1;		//=
reg[31:0] MEM_W_out_data_2;		//=
reg[31:0] MEM_W_out_data_3;		//=
reg [31:0] MEM_W_mult_result;	// = ALU_MEM_mult_result
reg [31:0] MEM_W_alu_result;	// = ALU_MEM_alu_result
reg [3:0] MEM_W_alu_nzcv;		// = ALU_MEM_alu_nzcv
reg MEM_W_alu_is_writeback;		//  = ALU_MEM_alu_is_writeback


/******************
*
* W: Writeback (To RegisterFile and PC)
*
******************/
/*For reference
reg[3:0] write_address;
reg[31:0] write_data;
reg write_enable;

reg[31:0] pc_update;
reg pc_write;

reg cspr_write;
reg[31:0] cspr_update;
*/

reg want_to_flush = 0;

initial begin
	//Fill alu with nops at the beginning.
	F_R_type = `undefined;
	R_MUL_type = `undefined;
	MUL_ALU_type = `undefined;
	ALU_MEM_type = `undefined;
	MEM_W_type = `undefined;
end


always@(posedge clk) begin
	//Fetch
	fetch_instr = 1; //fetch instruction.
	
	
	
	//Register Read
	case(F_R_type)
		`dataProcessing: read_address = F_R_instr[19:16];
		`multiply: read_address = F_R_instr[15:12];
		`loadStoreUnsigned: read_address = F_R_instr[19:16];

		/*doesn't matter for 
		`undefined
		`branch
		`branchAndExchange
		`multiplyLong
		*/
		default: read_address = F_R_instr[19:16];
	endcase

	//Multiply. Have to do nothing. Connections are made already.

	//ALU. 
	case(MUL_ALU_type)
		`dataProcessing: begin
				alu_operand_1 = MUL_ALU_out_data_1;
				use_shifter = 1; //alu_operand_2 = shifter_result;
				alu_opcode = MUL_ALU_instr[24:21];
			end

		`multiply: begin
			if(MUL_ALU_instr[21] == 1 ) begin //Multiply accumulate
				alu_operand_1 = MUL_ALU_out_data_1;
				alu_operand_2 = MUL_ALU_mult_result;
				use_shifter = 0;
				alu_opcode = `ADD;
			end
			else begin	//No accumulate. Add 0, so that nzcv flags go through.
				alu_operand_1 = MUL_ALU_out_data_1;
				alu_operand_2 = 0;
				use_shifter = 0;
				alu_opcode = `ADD;
			end
		end

		`branch: begin	//address calculation
			//flush instructions.
			want_to_flush = 1;
			alu_operand_1 = pc-20;
			use_shifter = 0;
			//sign extended 24 bit offset.
			if (MUL_ALU_instr[23] == 0) alu_operand_2 = {6'b0,MUL_ALU_instr[23:0]<<2};
			else alu_operand_2 = {6'b111111,MUL_ALU_instr[23:0]<<2};
			alu_opcode = `ADD;
		end

		`loadStoreUnsigned: begin
			//address calculation
			alu_operand_1 = MUL_ALU_out_data_1;
			use_shifter = 1;			//alu_operand_2 = shifter_result;
			alu_opcode = (MUL_ALU_instr[23]==1)?`ADD: `SUB;
		end

		/*
		Not supported yet: 
		Multiply long

		Need not do anything for
		`undefined
		`branchAndExchange
		*/

		default: begin
				want_to_flush = 0;
				alu_operand_1 = MUL_ALU_out_data_1;
				use_shifter = 1; //alu_operand_2 = shifter_result;	
				alu_opcode =`ADD;
			end
	endcase

	//Memory
	case(ALU_MEM_type)

		default: begin
			memory_write_enable = 0;
			memory_read_enable = 0;
		end
	endcase
	
	//Write back
	case(MEM_W_type)
		`dataProcessing:begin
			write_address = MEM_W_instr[15:12];
			write_data = MEM_W_alu_result;
			write_enable = (MEM_W_alu_is_writeback == 1)? 1:0;
			cspr_update = MEM_W_alu_nzcv;
			cspr_write = MEM_W_instr[20];	//set bit
			pc_update = pc+4;
			pc_update = 1;
		end

		`multiply: begin
			write_address = MEM_W_instr[19:16];
			write_data = MEM_W_alu_result;	//remember accumulate.
			write_enable = 1;
			cspr_update = MEM_W_alu_nzcv;
			cspr_update = MEM_W_instr[20];	//set bit
			pc_update = pc+4;
			pc_write = 1;
		end

		`branch: begin
			pc_update = MEM_W_alu_result;
			pc_write = 1;
			cspr_write = 0;
			if(MEM_W_instr[24]==0)	write_enable = 0;	//i.e, not link
			else begin
				write_address = 4'd14;
				write_enable = 1;
				write_data = pc-14;
			end
		end

		`branchAndExchange: begin
			pc_update = MEM_W_out_data_3;
			pc_write = 1;
			cspr_write = 0;
			write_enable = 0;
		end

		`loadStoreUnsigned: begin
			if(MEM_W_instr[24] == 0) begin	//postincrement
				write_address = MEM_W_instr[19:16];
				write_data = MEM_W_alu_result;
				write_enable = 1;
			end
			else write_enable = 0;
			cspr_write = 0;
			pc_update = pc+4;
			pc_write = 1;
		end
		/*
		Not supported yet: 
			Multiply long

		Just to increase pc:
			undefined
		*/
		default: begin
			pc_update = pc+4;
			pc_write = 1;
			cspr_write = 0;
			write_enable = 0;
		end
	endcase

	//pipeline update

	/*******R/MUL*****/
	R_MUL_type 		 = F_R_type;
	R_MUL_instr 		 =F_R_instr;
	R_MUL_out_data_1 	 =out_data_1;
	R_MUL_out_data_2 	 =out_data_2;
	R_MUL_out_data_3 	 =out_data_3;
	/*******MUL/ALU*****/
	//condition field checking done in alu stage, right aftern zcvnzcv is calculated . so if decided to be not executing, make type undefined.
	MUL_ALU_type 		 = (will_this_be_executed == 1)? R_MUL_type: `undefined;
	MUL_ALU_instr 		 =R_MUL_instr;
	MUL_ALU_out_data_1 	 =R_MUL_out_data_1;
	MUL_ALU_out_data_2 	 =R_MUL_out_data_2;
	MUL_ALU_out_data_3 	 =R_MUL_out_data_3;
	MUL_ALU_mult_result	 = mult_result;
	//MUL_ALU_shifter_result = shifter_result;
	/*******ALU/MEM*****/
	ALU_MEM_type 		 = MUL_ALU_type;
	ALU_MEM_instr 		 = MUL_ALU_instr;
	ALU_MEM_out_data_1 	 = MUL_ALU_out_data_1;
	ALU_MEM_out_data_2 	 = MUL_ALU_out_data_2;
	ALU_MEM_out_data_3 	 = MUL_ALU_out_data_3;
	ALU_MEM_mult_result  = MUL_ALU_mult_result;
	ALU_MEM_alu_result 	 = alu_result;
	ALU_MEM_alu_nzcv 	 = alu_nzcv;
	ALU_MEM_alu_is_writeback  = alu_is_writeback;
	nzcv_forward = alu_nzcv;	//forwarding!
	/*******MEM/W*****/
	MEM_W_type 			 = ALU_MEM_type;
	MEM_W_instr 		 = ALU_MEM_instr;
	MEM_W_out_data_1 	 = ALU_MEM_out_data_1;
	MEM_W_out_data_2 	 = ALU_MEM_out_data_2;
	MEM_W_out_data_3 	 = ALU_MEM_out_data_3;
	MEM_W_mult_result 	 = ALU_MEM_mult_result;
	MEM_W_alu_result 	 = ALU_MEM_alu_result;
	MEM_W_alu_nzcv 		 = ALU_MEM_alu_nzcv;
	MEM_W_alu_is_writeback = ALU_MEM_alu_is_writeback;

	if(want_to_flush == 1)begin
		F_R_type = `undefined;
		R_MUL_type = `undefined;
		MUL_ALU_type = `undefined;
	end 

end

endmodule