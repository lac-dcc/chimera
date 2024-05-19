// This program was cloned from: https://github.com/chsasank/ARM7
// License: MIT License

`define multiply			0
`define multiplyLong		1
`define branchAndExchange	2
`define SingleDataSwap		3
`define HalfwordDataTransferR	4
`define HalfwordDataTransferI	5
`define signedDataTransfer	6
`define dataProcessing		7
`define loadStoreUnsigned			8
`define undefined			9
`define blockDataTransfer	10
`define branch				11
`define coprocessor			12


module pipelined_arm(input clk);

/*
* F:	Fetch
*/
wire[31:0] instr;
reg update_instr;
instr_cache InstructionCache(//inputs
							.PC(pc),
							.read_enable(update_instr),
							.clk(clk),
							
							//outputs
							.instr(instr)		
							
							);

//---F/DE---
reg[31:0] F_DE_instr; // = instr in always

/*
* DE:	Decode
*/
wire[31:0] out_data_1;
wire[31:0] out_data_2;
wire[31:0] out_data_3;
wire[31:0] operand_2;
wire c_to_alu;
wire[3:0] type;



reg[3:0] nzcv_to_compare_with;
wire will_this_be_executed;

reg[31:0] pc_update;
reg pc_write;
reg cspr_write;
reg[31:0] cspr_update;

reg[31:0] write_data;	//for write back
reg write_enable;// 	"
reg[3:0] write_address;//have to change based on instruction

reg[3:0] universal_read_address;
wire[31:0] universal_out_data;

wire[31:0] cspr;
wire[31:0] pc;
//update cspr and pc and writeback in last phase, clk = 1. Here is when we check for <cond>. so, now on view pc and cspr as 'universal' (I care abt this because of cspr input to barell shifter in same pipeline stage
//But transfer to pipeline registers on last phase, clk = 0

reg[3:0] read_address; //have to change based on instruction
register_file RegisterFile(	//inputs
							.in_address1(read_address),
							.in_address2(F_DE_instr[11:8]),
							.in_address3(F_DE_instr[3:0]),
							.in_address4(write_address),
							.universal_read_address(universal_read_address),
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
							.universal_out_data(universal_out_data),
							.pc(pc), 
							.cspr(cspr)			
							
							);

bshift BarrelShifter(		
							.instr_bit_25(F_DE_instr[25]),
							.imm_value(F_DE_instr[11:0]), 
							.Rs(out_data_2), 
							.Rm(out_data_3), 
							.cin(cspr[29]), 
							
							.operand2(operand_2), 
							.c_to_alu(c_to_alu)
							
							);

inst_decode InstructionDecoder(
							.ir(F_DE_instr),
							
							.type(type)			
							
							);


cond conditionFieldChecker(
							.nzcv(cspr[31:28]),
							.condition_code(F_DE_instr[31:28]),
							
							.will_this_be_executed(will_this_be_executed)
							
							);

//--DE/EX--
reg[31:0] DE_EX_operand_2; //= operand_2
reg DE_EX_c_to_alu;	//=c_to_alu
reg[3:0] DE_EX_type;		//= type
reg[31:0] DE_EX_instr;	//=F_DE_instr
reg[31:0] DE_EX_out_data_1;//=out_data_1
reg[31:0] DE_EX_out_data_2;//=out_data_2
reg[31:0] DE_EX_out_data_3;//=out_data_3
reg[3:0] DE_EX_nzcv_old; // = cspr[31:28]
/*
* EX: Execute
*/
wire[31:0] alu_result;
wire[3:0] alu_nzcv;
wire alu_is_writeback;
wire[31:0] mult_result;
wire[3:0] mult_nzcv;

//I'm leaving these as registers because you may want to use this alu for address calculations.
reg[31:0] alu_operand_1;//for data processing,=DE_EX_out_data_1 
reg[31:0] alu_operand_2;//		"			=DE_EX_operand_2
reg[3:0] alu_opcode; //


reg[31:0] memory_data_address;
reg[31:0] memory_in_data;
wire[31:0] memory_out_data;
reg memory_write_enable;
reg memory_read_enable;
reg isByte;

alu ALU(
							.opcode(alu_opcode), 
							.operand_1(alu_operand_1), 
							.operand_2(alu_operand_2), 
							.nzcv_old(DE_EX_nzcv_old), 
							.c_from_shifter(DE_EX_c_to_alu), 
							
							.result(alu_result), 
							.nzcv(alu_nzcv), 
							.isWriteback(alu_is_writeback)
							
							);

multiplier Multiplier( 
							.A(DE_EX_instr[21]), 
							.Rn(DE_EX_out_data_1), 
							.Rs(DE_EX_out_data_2), 
							.Rm(DE_EX_out_data_3),
							
							.result(mult_result), 
							.nzcv(mult_nzcv)
							
							);
							
							
data_cache DataCache(
							.data_address(memory_data_address),
							.in_data(memory_in_data),
							.read_enable(memory_read_enable),
							.write_enable(memory_write_enable),
							.isByte(isByte),
							.clk(clk),
							
							.out_data(memory_out_data)
							
							);
							
//writeback too here.


//finis

//ask me if you have doubt abt this clock
//slow clock, i.e cycle
reg[1:0] phase = 0; 
always @(negedge(clk)) begin
	phase = phase+1;
end
wire cycle;
assign cycle =phase[1];
//slow clock ends

reg[3:0] nzcv_temp;
reg WantToFlush = 0;

always@ clk begin		//4phases for one cycle, i.e 8 clk changes.



/**********************************
*
*
*	Fetch Stage
*
*	
**********************************/
//fetch instruction from instr_cache, now that pc is stable. //instr will be available next phase
if(phase == 1) update_instr = 1;


/**********************************
*
*
*	Decode Stage
*
*	
**********************************/
if(phase == 0 && clk ==0) begin	//decode
	//registers will be available next phase.
	//type must be available by now
	if(type == `dataProcessing) begin
		read_address = F_DE_instr[19:16];
	end

	if(type == `multiply) begin
		read_address = F_DE_instr[15:12];
	end

	if(type == `multiplyLong) begin
		//do nothing. Not supported yet
	end
	
	if(type == `undefined) begin
		//do nothing.
	end

	if(type == `branch)begin
		//do nothing.
	end

	if(type == `branchAndExchange)begin
		//do nothing.
	end

	if(type == `loadStoreUnsigned) begin	//same as Single data transfer
		read_address = F_DE_instr[19:16];
	end


end




/**********************************
*
*
*	Execute Stage
*
*	
**********************************/

if(phase == 0 && clk ==0) begin	//assigning operands to alu at the start of execution stage


	if(DE_EX_type == `dataProcessing) begin
		alu_operand_1 = DE_EX_out_data_1;
		alu_operand_2 = DE_EX_operand_2;
		alu_opcode = DE_EX_instr[24:21];
	end



	if(DE_EX_type == `multiply) begin
		//you don't need to do anything. connections are made to multiply block by default
	end
	


	if(DE_EX_type == `multiplyLong) begin
		//not supported yet.
	end
	


	if(DE_EX_type == `undefined) begin
		//do nothing.
	end



	if(DE_EX_type == `branch) begin
		//Do I have to flush the pipeline?
		//If so, what do I have to do? Make DE_EX_type = `undefined and D_FE_instr = 32`b01111111111111111111111111111111 (encoding for undefined) 
		WantToFlush = 1;
		alu_operand_2 = pc - 8;	//pc-8 because current pc is 8 ahead of this instruction
		alu_opcode = `ADD;
		if(DE_EX_instr[23] == 0)	alu_operand_1 = {6'b0,DE_EX_instr[23:0]<<2};//note: I'm not doing left shift because we're using memory cell of word for instruction cache.  
		if(DE_EX_instr[23] == 1)	alu_operand_1 = {6'b1,DE_EX_instr[23:0]<<2};
	end


	if(DE_EX_type == `branchAndExchange) begin
		//you need not do anything.
	end

	if(DE_EX_type == `loadStoreUnsigned) begin
		alu_operand_1 = DE_EX_out_data_1;
		alu_operand_2 = DE_EX_operand_2;

		//if Up bit is set, add. else subtract
		if(DE_EX_type[23] == 1) alu_opcode = `ADD;
		else alu_opcode = `SUB;
	end
end


//phase 2, clk 0
if(phase == 2 && clk == 0) begin

	if(DE_EX_type == `loadStoreUnsigned) begin

		if(DE_EX_instr[24] == 1) begin	//Preincrement. For post increment see phase 3 clk 1.
			write_address = DE_EX_instr[19:16];
			write_data = alu_result;
			write_enable = 1;
		end

		if(DE_EX_instr[20] == 1) begin	//load
			memory_data_address = alu_result;
			memory_read_enable = 1; 
			isByte = DE_EX_instr[22];
		end 
		else begin	//store.
			universal_read_address = DE_EX_instr[15:12];
		end
		
	end

	else write_enable = 0;

end

//phase 2, clk 1
if(phase == 2 && clk == 1) begin

	if(DE_EX_type == `loadStoreUnsigned) begin
		if(DE_EX_instr[20] == 1) begin	//load. i.e, Store in register
			write_address = DE_EX_instr[15:12];
			write_data = memory_out_data;
			write_enable = 1;
		end

		else begin //store in memory
			memory_data_address = alu_result;
			memory_in_data = universal_out_data;
			isByte = DE_EX_instr[22];
			memory_write_enable = 1;
		end 
	end

end

//Writing back PC, CSPR, Registerfile, just before pipeline is updated
if(phase == 3 && clk ==0) begin 

	nzcv_temp = cspr[31:28];//have to do this here because cspr will be updated by the end of this



	if(DE_EX_type == `dataProcessing) begin
		write_address = DE_EX_instr[15:12];
		
		if(alu_is_writeback == 1) begin	//write back only if alu dictates you to
			write_data = alu_result;
			write_enable = 1;
		end 
		else write_enable = 0;
		
		if(DE_EX_instr[20] ==1) begin	//if S bit is 0, you shouldn't be updating cspr
			cspr_update = alu_nzcv<<28 || (cspr&&32'b00001111111111111111111111111111) ;	//masking
			cspr_write = 1;
		end
		else cspr_write = 0;
		
		pc_update = pc+4;
		pc_write = 1;	
	end
	


	if(DE_EX_type == `multiply) begin
		write_address = DE_EX_instr[19:16];
		write_data = mult_result;
		write_enable = 1;
		
		if(DE_EX_instr[20] ==1) begin	//if S bit is 0, you shouldn't be updating cspr
			cspr_update = mult_nzcv<<28 || (cspr&&32'b00001111111111111111111111111111) ;
			cspr_write = 1;
		end
		else cspr_write = 0;
		
		pc_update = pc+4;
		pc_write = 1;
	end



	if(DE_EX_type == `multiplyLong) begin
		//not supported yet
		write_enable = 0;
		cspr_write = 0;
		pc_update = pc+4;
		pc_write = 1;
	end
	


	if(DE_EX_type == `undefined) begin
		//just update pc and do nothing else
		write_enable = 0;
		cspr_write = 0;
		pc_update = pc+4;
		pc_write = 1;
	end
	


	if(DE_EX_type == `branch) begin
		if(DE_EX_instr[24] == 0) begin	//i.e not link
			pc_update = alu_result;
			pc_write = 1;	//simply update pc with alu's result.
			write_enable = 0;
			cspr_write = 0;
		end

		else begin
			write_address = 4'd14;	//Do link. ie. write pc to register file.
			write_data = pc - 8;
			write_enable = 1;
			pc_update = alu_result;
			pc_write = 1;	//update pc with alu's result.
			cspr_write = 0;
		end
	end


	if(DE_EX_type == `branchAndExchange) begin
		WantToFlush = 1;
		pc_update = DE_EX_out_data_3;
		pc_write = 1;
		write_enable = 0;
		cspr_write = 0;
	end

	if(DE_EX_type == `loadStoreUnsigned) begin
		if(DE_EX_instr[24] == 0) begin	//postincrement
			write_address = DE_EX_instr[19:16];
			write_data = alu_result;
			write_enable = 1;
		end
		else write_enable = 0;
		cspr_write = 0;
		pc_update = pc+4;
		pc_write = 1;
	end
end


/**********************************
*
*
*	Pipeline update
*
*	
**********************************/
if(phase == 3 && clk == 1) begin //update all pipeline registers.
	
	//F/DE
	F_DE_instr = instr;
	
	//DE/EX
	DE_EX_operand_2 = operand_2;
	DE_EX_c_to_alu	=c_to_alu;
	DE_EX_instr		=F_DE_instr;
	DE_EX_out_data_1=out_data_1;
	DE_EX_out_data_2=out_data_2;
	DE_EX_out_data_3=out_data_3;
	DE_EX_nzcv_old  = nzcv_temp;//have to do this here because cspr will be written back by now


	//by now cspr flags from execute stage are updated in register file
	//nzcv_to_compare_with = cspr;
	if(will_this_be_executed == 1) DE_EX_type = type;
	else DE_EX_type = `undefined;	//so that nothing but PC increment is done.

	if(WantToFlush == 1) begin	//Check if you want to flush pipeline. If you have to, make other instructions in pipeline look like NOPs
		DE_EX_type = `undefined;
		F_DE_instr = 32'b01111111111111111111111111111111;	//encoding for undefined instruction
		WantToFlush = 0;
	end

end






if( {phase,clk} != {2'd3,1'b0} && phase != 2) begin
	pc_write = 0;
	cspr_write = 0;
	write_enable = 0;
end

if(phase != 1) begin
	update_instr = 0;
end



end

endmodule