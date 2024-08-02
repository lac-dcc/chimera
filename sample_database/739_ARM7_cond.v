// This program was cloned from: https://github.com/chsasank/ARM7
// License: MIT License

//This module decides if a particticular instruction satisfies conditions or not

module cond ( nzcv,  condition_code, will_this_be_executed);
input wire[3:0] nzcv;
input wire[3:0] condition_code;
output reg will_this_be_executed;

always @* begin

case(condition_code)
	0: begin	//EQ
	if(nzcv[2] == 1)  will_this_be_executed = 1;
	else will_this_be_executed = 0;	
	end

	1: begin //NE
	if(nzcv[2] == 0)  will_this_be_executed = 1;
	else will_this_be_executed = 0;	
	end
	
	2: begin //CS
	if(nzcv[1] == 1)  will_this_be_executed = 1;
	else will_this_be_executed = 0;	
	end	
	
	3: begin //CC	
	if(nzcv[1] == 0)  will_this_be_executed = 1;
	else will_this_be_executed = 0;	
	end	
	
	4: begin //MI
	if(nzcv[3] == 1)  will_this_be_executed = 1;
	else will_this_be_executed = 0;	
	end	
	
	5: begin //PL
	if(nzcv[3] == 0)  will_this_be_executed = 1;
	else will_this_be_executed = 0;	
	end	
	
	6: begin //VS
	if(nzcv[0] == 1)  will_this_be_executed = 1;
	else will_this_be_executed = 0;	
	end	
	
	7: begin //VC
	if(nzcv[0] == 0)  will_this_be_executed = 1;
	else will_this_be_executed = 0;	
	end	
	
	8: begin //HI
	if(nzcv[1] == 1 && nzcv[2] == 0)  will_this_be_executed = 1;
	else will_this_be_executed = 0;	
	end	
	
	9: begin //LS
	if(nzcv[1] == 0 && nzcv[2] == 1)  will_this_be_executed = 1;
	else will_this_be_executed = 0;	
	end	
	
	10: begin //GE
	if(nzcv[3] == nzcv[0])  will_this_be_executed = 1;
	else will_this_be_executed = 0;	
	end	
	
	11: begin //LT
	if(nzcv[3] != nzcv[0])  will_this_be_executed = 1;
	else will_this_be_executed = 0;	
	end	
	
	12: begin //GT
	if(nzcv[2] == 0 && nzcv[3] == nzcv[0])  will_this_be_executed = 1;
	else will_this_be_executed = 0;	
	end	
	
	13: begin //LE
	if(nzcv[2] == 0 || nzcv[3] != nzcv[0])  will_this_be_executed = 1;
	else will_this_be_executed = 0;	
	end	
	
	14: begin //AL
	will_this_be_executed = 1;	
	end	
	
	15: begin //reserved
	will_this_be_executed = 1;
	end

endcase


end

endmodule