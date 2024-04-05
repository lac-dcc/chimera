//top module
`define multiply			0
`define multiplyLong		1
`define branchAndExchange	2
`define SingleDataSwap		3
`define HalfwordDataTransferR	4
`define HalfwordDataTransferI	5
`define signedDataTransfer	6
`define dataProcessing		7
`define loadStore			8
`define undefined			9
`define blockDataTransfer	10
`define branch				11
`define coprocessor			12


/* Blocks placed until now in order of placing:
1. Register File
2. Instruction Cache
3. Barrel Shifter
4. Instruction decoder
*/

/* Register I have to manage

Register File:
reg[3:0] read_address1;
reg[3:0] write_address;
reg[31:0] write_data;
reg reg_write_enable;

PC & cspr:
reg[31:0] pc_update;
reg pc_write;
reg[31:0] cspr_update;
reg cspr_write;

Instruction fetch
reg ir_read_enable;

*/

/* Connections to keep in mind:
out_data_2 - instr[11:8]
out_data_3 - instr[3:0]
*/

//tip: outputs always have to be wire! 
module armv7(clk);
input wire clk;

//register read adresses
reg[3:0] read_address1;

//data on the buses from register updated at negedge
wire[31:0] out_data_1;
wire[31:0] out_data_2;
wire[31:0] out_data_3;

//writing. will be written at posedge
reg[3:0] write_address;
reg[31:0] write_data;
reg reg_write_enable;

//pc
wire[31:0] pc; 			//we can only read from this
reg[31:0] pc_update;
reg pc_write;

//cspr
wire[31:0] cspr; 		//we can only read from this
reg[31:0] cspr_update;
reg cspr_write;


wire[31:0] instr;


//register file
//instr[11:8] and instr[3:0] directly connected to register file.
register_file register_file1(	read_address1,instr[11:8],instr[3:0],	write_address,write_data,
								out_data_1,out_data_2,out_data_3,reg_write_enable,
								pc, pc_update, pc_write, 
								cspr, cspr_write, cspr_update, clk );

								
reg ir_read_enable;


//instruction cache
instr_cache instr_cache1(pc[7:0],instr,ir_read_enable,clk);
//instr will be updated at negedge of clock, that too only if read_enable = 1. so read at posedge.




//shifter:
//Rm is ir[3:0], Rs is ir[11:8], cin is cspr[29]
//bshift bshift1(instr[25],instr[11:0], out_data_3, out_data_2, operand_2, cspr[29] , c_to_alu);

wire instr_bit_25;
wire[11:0] instr_11_to_0;
wire[31:0] out_data_Rm;
wire[31:0] out_data_Rs;
wire[31:0] operand_2; //will be connected to ALU
wire c_in_shifter;
wire c_to_alu; //will be connected to alu.
bshift(instr_bit_25,instr_11_to_0, out_data_Rm, out_data_Rs, operand2, cin, c_to_alu);

wire[31:0] alu_result;
wire isWriteback; //we have to write back result only if this is 1
wire[3:0] nzcv_write_back;

//Alu
alu alu1(instr[24:21], out_data_1, operand_2, alu_result, cspr[31:28], nzcv_write_back, c_to_alu, isWriteback);


//instruction decoder
wire[3:0] type;
inst_decode inst_decode1(instr, type);



//slow clock:
reg[1:0] phase = 0; 
always @(negedge(clk)) begin
	phase = phase+1;
end

wire cycle;
assign cycle =counter[1];

//pipeline registers:
reg F.DE;
reg DE.EX;

always@(negedge clk)	begin//b/w negedege of cycle = 4 Phases: you have 4 negedges of clk or 3 posedges
/* 
 * Instruction fetch
 */
 if(phase == 0) ir_read_enable = 1;	//fetch starts at phase 0.
 else ir_read_enable = 0;
 
 F.DE = instr;
 
 
 
 
 //read from instr at the next .
 
 
 end
endmodule