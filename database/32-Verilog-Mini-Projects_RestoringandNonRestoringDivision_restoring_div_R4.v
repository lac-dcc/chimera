module restoring_div_R4(clk, reset, Dividend, Divisor, Quotient, Remainder);
	input clk, reset;
	input [63:0] Dividend, Divisor;

	output [63:0] Quotient, Remainder;
	reg [63:0] Quotient, Remainder;
	reg [63:0] p, a;
	reg [63:0] Result1, Result2, Result3;
	reg [63:0] DivisorX2, DivisorX3;
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
		DivisorX2 = Divisor << 1; //Divisor*2
		DivisorX3 = (Divisor << 1) + Divisor; //Divisor*3

		for(i = 0; i < 32; i = i+1)
		begin
			//Shift Left carrying a's MSB into p's LSB
			p = (p << 2) | a[63:62];
			a = a << 2;

			//Subtract
			Result1 = p - Divisor;
			Result2 = p - DivisorX2;
			Result3 = p - DivisorX3;

			if( Result1[63] ) //Divisor is too big
			begin
				a = a | 0;
			end
			else if( Result2[63] )//Divisor*2 is too big, but Divisor*1 is OK
			begin
				p = Result1;
				a = a | 1;
			end
			else if( Result3[63] ) //Divisor*3 is too big, but Divisor*2 is OK
			begin
				p = Result2;
				a = a | 2;
			end
			else
			begin //Divisor*3 is OK
				p = Result3;
				a = a | 3;
			end
		end	
	end
				
endmodule

module restoring_div_R4_tb;
	reg clk, reset;
	reg [63:0] dividend, divisor;
	wire [63:0] quotient, remainder;

	restoring_div_R4 divider(clk, reset, dividend, divisor, quotient, remainder);

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
