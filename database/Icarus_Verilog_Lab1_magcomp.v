// Magnitude comparator

module mag_beh(a, b, c);

	input [3:0] a, b;
	output [2:0]c;
	reg c;
	always@ (a or b)
		begin
			if(a==b) c=3'b100;
			else if(a>b)	c=3'b010;
			else if(a<b)	c=3'b001;
		end
endmodule

module mag_df(a, b, c);

    input [3:0] a, b;
    output [2:0] c;
    wire [3:0] x;

    assign x = ~(((~a) & b) | (a & (~b)));
    assign c[2] = x[0] & x[1] & x[2] & x[3];
    assign c[1] = (a[3] & ~b[3]) | (x[3] & a[2] & ~b[2]) | (x[3] & x[2] & a[1] & ~b[1]) | (x[3] & x[2] & x[1] & a[0] & ~b[0]);
    assign c[0] = !(c[1] | c[2]);

endmodule

module testbench;
	reg [3:0]a, b;
	wire [2:0]c;
	mag_df mag_com(a, b, c);
	initial
		begin
			$monitor(, $time, " a=%4b, b=%4b, c=%3b", a, b, c);
			#0 a=4'b0000; b=4'b0000;
			#5 a=4'b0001; b=4'b0000;
			#10 a=4'b0000; b=4'b0001;
			#100 $finish;
		end
		
endmodule