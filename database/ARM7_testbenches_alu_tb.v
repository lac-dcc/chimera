module alu_test;
parameter N = 4;

reg[3:0] opcode;
reg[N-1:0] op1, op2;
wire[N-1:0] result;
wire[3:0] nzcv;
wire[3:0] nzcv_old = 'bxx1x;
wire c_from_shifter = 'bz;
wire writeback;

reg [N-1:0]temp;
alu#(N) alu1(opcode, op1, op2, result, nzcv_old, nzcv, c_from_shifter, isWriteback); 

initial begin
	$display("\nc_old - 1, remaining_old - x, c from shifter - z \n");
	opcode = `AND;
	op1 = 'b1100;
	op2 = 'b1010;
	#10 $display("%b & %b = %b , nzcv:%b", op1, op2, result, nzcv);
	$display("To write back? - %b \n", isWriteback);

	opcode = `EOR;
	op1 = 'b1100;
	op2 = 'b1010;
	#10 $display("%b ^ %b = %b , nzcv:%b", op1, op2, result, nzcv);
	$display("To write back? - %b \n", isWriteback);

	opcode = `SUB;
	op1 = 'd9;
	op2 = 'd4;
	#10 $display("%d - %d = %d , nzcv:%b", op1, op2, result, nzcv);
	$display("To write back? - %b \n", isWriteback);
	
	opcode = `RSB;
	op1 = 'd9;
	op2 = 'd4;
	#10 $display("%d - %d = %d , nzcv:%b", op2, op1, result, nzcv);
	$display("To write back? - %b \n", isWriteback);
	
	opcode = `ADD;
	op1 = 'd9;
	op2 = 'd4;
	#10 $display("%d + %d = %d , nzcv:%b", op1, op2, result, nzcv);
	$display("To write back? - %b \n", isWriteback);
	
	opcode = `ADC;
	op1 = 'd9;
	op2 = 'd4;
	#10 $display("%d +c %d = %d , nzcv:%b", op1, op2, result, nzcv);
	$display("To write back? - %b \n", isWriteback);
	
	opcode = `SBC;
	op1 = 'd9;
	op2 = 'd4;
	#10 $display("%d -c %d = %d , nzcv:%b", op1, op2, result, nzcv);
	$display("To write back? - %b \n", isWriteback);
	
	opcode = `RSC;
	op1 = 'd9;
	op2 = 'd4;
	#10 $display("%d -c %d = %d , nzcv:%b", op2, op1, result, nzcv);
	$display("To write back? - %b \n", isWriteback);

	opcode = `TST;
	op1 = 'd9;
	op2 = 'd4;
	#10 $display("%d tst  %d = %d , nzcv:%b", op1, op2, result, nzcv);
	$display("To write back? - %b \n", isWriteback);

	opcode = `TEQ;
	op1 = 'd4;
	op2 = 'd9;
	#10 $display("%d teq %d = %d , nzcv:%b", op1, op2, result, nzcv);
	$display("To write back? - %b \n", isWriteback);

	opcode = `CMP;
	op1 = 'd7;
	op2 = 'd2;
	#10 $display("%d cmp %d = %d , nzcv:%b", op1, op2, result, nzcv);
	$display("To write back? - %b \n", isWriteback);
	
	opcode = `CMN;
	op1 = 'd2;
	op2 = 'd8;
	#10 $display("%d cmn %d = %d , nzcv:%b", op1, op2, result, nzcv);
	$display("To write back? - %b \n", isWriteback);
	
	opcode = `ORR;
	op1 = 'd2;
	op2 = 'd4;
	#10 $display("%b orr %b = %b , nzcv:%b", op1, op2, result, nzcv);
	$display("To write back? - %b \n", isWriteback);

	opcode = `MOV;
	op1 = 'd9;
	op2 = 'd4;
	#10 $display("%d]  %d -> %d , nzcv:%b", op1, op2, result, nzcv);
	$display("To write back? - %b \n", isWriteback);

	opcode = `BIC;
	op1 = 'd9;
	op2 = 'd4;
	#10 $display("%b bic %b = %b , nzcv:%b", op1, op2, result, nzcv);
	$display("To write back? - %b \n", isWriteback);

	opcode = `MVN;
	op1 = 'd5;
	op2 = 'd2;
	#10 $display("%b mvn %b = %b , nzcv:%b", op1, op2, result, nzcv);
	$display("To write back? - %b \n", isWriteback);

/*

`define CMP 4'd10
`define CMN 4'd11
`define ORR 4'd12
`define MOV 4'd13
`define BIC 4'd14
`define MVN 4'd15	
*/
	
	
	
	
end

endmodule