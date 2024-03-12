module mult_test;
parameter N = 7;

wire[N-1:0] result;
reg[N-1:0] Rn;
reg[N-1:0]  Rs;
reg[N-1:0] Rm;
reg A;
multiplier#(N) multiplier1( A, Rn, Rs, Rm, result);

initial begin
	Rn = 30;
	Rs = 20;
	Rm = 2;
	A = 1;
	#2 $display("(%d * %d) + %d = %d", Rm, Rs, Rn, result);
end

endmodule