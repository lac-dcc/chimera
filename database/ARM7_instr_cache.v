/*`define instr_size 32
`define N ??	//N is the address size of the PC
//size of PC*/
module instr_cache(PC,instr,read_enable,clk);
parameter instr_size = 32;
parameter N = 32;
parameter addr_size = 8;	//pc supplies address to instr_cache, so addr_size is same as addr_width here. We ignore msb bits from r15.

reg [instr_size-1:0] M [256-1:0];	//2^addr_size-1, 32 bit instructions
input read_enable;
input [N-1:0]PC;
input clk;
output reg [instr_size-1:0] instr;

initial begin
//application code here.
M[0]= 32'he3a0000a;	
M[1]= 32'he3a00000; //MOV      r0, #10        ; Set up parameters
M[2]= 32'he3a01001;	//MOV      r1, #3
M[3] =32'he0913002;	//MOV		 r4, #4;here
M[4]= 32'he1a01002;	//MOV r9, #19
M[5]= 32'he1a02003;	//add ro,r1,#43
M[6]= 32'h3afffffb;	//MOV		 r7, #2
M[7]= 32'he3a07001;	//
M[8]= 32'he3a07002; //
M[9]= 32'he3a07002; //
M[10]= 32'he3a07003; //
M[11]= 32'he3a07004; //
M[12]= 32'he3a07005; //
M[13]= 32'he3a07006; //
M[14]= 32'he3a07007; //
M[15]= 32'he3a07008; //
M[16]= 32'he3a07009; //
M[17]= 32'he3a07001; //
end


always @ (negedge clk)	
begin
	if(read_enable==1) begin
		instr= M[PC[addr_size+1:2]];
	end
end

endmodule