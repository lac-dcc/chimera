module CMP(D1,D2,equ,zero_greater,zero_equ,zero_less);
//interface
	input [31:0] D1;
    input [31:0] D2;

    output equ;
	
	output zero_greater;
	output zero_equ;
	output zero_less;

//combinational logic
    assign equ=(D1==D2);
	assign zero_greater=($signed(D1)>0);
	assign zero_equ=($signed(D1)==0);
	assign zero_less=($signed(D1)<0);

endmodule
