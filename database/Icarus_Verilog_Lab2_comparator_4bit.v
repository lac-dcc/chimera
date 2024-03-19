`ifndef COMPARATOR_4BIT
`define COMPARATOR_4BIT

	module sign(
		output sign,
		input [3:0] num
	);
		reg sign;

		always @* begin
			if( num[3] == 1)
				sign = 1;
			else
				sign = 0;
		end

	endmodule

	module comparator_4bit(
		output agtb,
		output altb,
		output aeqb,
		input [3:0] a,
		input [3:0] b
	);
		
	wire signa, signb;
	reg agtb, altb, aeqb;

	sign sa(signa, a);
	sign sb(signb, b);

	always @(a or b or signa or signb) begin

		if( (signa == 1) && (signb == 0) ) begin

			agtb = 0;
			altb = 1;
			aeqb = 0;

		end

		else if( (signa == 0) && (signb == 1) ) begin

			// $display("hi");
			agtb = 1;
			altb = 0;
			aeqb = 0;
			
		end

		else begin

			if( a > b ) begin
			
				agtb = 1;
				altb = 0;
				aeqb = 0;

			end

			else if( a < b) begin
			
				agtb = 0;
				altb = 1;
				aeqb = 0;

			end

			else begin

				agtb = 0;
				altb = 0;
				aeqb = 1;

			end

		end
	end
		
	endmodule
`endif