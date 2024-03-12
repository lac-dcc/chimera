module non_restoring_div(clk, reset, Dividend, Divisor, Quotient, Remainder);
	input clk, reset;
	input [63:0] Dividend, Divisor;
	output [63:0] Quotient, Remainder;
	reg [63:0] Quotient, Remainder;
	reg [63:0] p, a, temp;
	integer i;

	always @(posedge clk, negedge reset)
	begin
		if( !reset )
		begin
			Quotient <= 0;
			Remainder <= 0;
		end
		else
		begin
			Quotient <= a;
			Remainder <= p;
		end
	end

	always @(*)
	begin
		a = Dividend;
		p = 0;

		for(i = 0; i < 64; i = i+1)
		begin
			//Shift Left carrying a's MSB into p's LSB
			p = (p << 1) | a[63];
			a = a << 1;

			//Check the old value of p
			if( p[63] ) //if p is negative
				temp = Divisor; //add divisor
			else
				temp = ~Divisor+1; //subtract divisor

			//this will do the appropriate add or subtract
			//depending on the value of temp
			p = p + temp;

			//Check the new value of p
			if( p[63] ) // if p is negative
				a = a | 0; //no change to quotient
			else
				a = a | 1; 
		end

		//Correction is needed if remainder is negative
		if( p[63] ) //if p is negative
			p = p + Divisor;
	end
				
endmodule

module non_restoring_div_tb;
	reg clk, reset;
	reg [63:0] dividend, divisor;
	wire [63:0] quotient, remainder;

	non_restoring_div divider(clk, reset, dividend, divisor, quotient, remainder);

	initial
		forever #1 clk = ~clk;

	initial
		$monitor("%0d / %0d: q = %0d, r = %0d", dividend, divisor, quotient, remainder);

	initial
	begin
		clk = 0;
		reset = 0;

		#1;
		reset = 1;
		dividend = 87;
		divisor = 5;

		#5;
		dividend = 59;
		divisor = 20;

		#5;
		dividend = 64'hFFFF_FFFF_FFFF_FFFF;
		divisor = 2;

		#5;
		dividend = 32'h1234_5678;
		divisor = 1;

		#5;
		divisor = dividend;
	
		#5;
		$finish;
	end

endmodule
