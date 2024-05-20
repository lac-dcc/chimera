// This program was cloned from: https://github.com/martinmaly21/ELEC374
// License: MIT License

module ALU(
	input wire [31:0] a_in,
	input wire [31:0] b_in,
	output reg [31:0] c_lo_out,
	output reg [31:0] c_hi_out,
	input wire [3:0] ctrl //note: will not need to use all 16 values
);

	wire [63:0] division_quotient;
	wire [63:0] multiplication_result;

	wire [31:0] ror_temp_lo;
	wire [31:0] rol_temp_lo;
	wire [31:0] shr_temp_lo;
	wire [31:0] shl_temp_lo;
	wire [31:0] not_temp_lo;
	wire [31:0] neg_temp_lo;
	wire [31:0] sub_temp_lo;
	wire [31:0] add_temp_lo;
	wire [31:0] or_temp_lo;
	wire [31:0] and_temp_lo;
	
 	div_32_gate div(a_in, b_in, division_quotient);
	mul_32_gate mul(a_in, b_in, multiplication_result); //weird stuff
	ror_32_gate ror(a_in, b_in, ror_temp_lo);
	rol_32_gate rol(a_in, b_in, rol_temp_lo);
	shr_32_gate shr(a_in, b_in, shr_temp_lo);
	shl_32_gate shl(a_in, b_in, shl_temp_lo);
	not_32_gate notnotnot(b_in, not_temp_lo);
	neg_32_gate neg(b_in, neg_temp_lo);
	sub_32_gate sub(a_in, b_in, sub_temp_lo);
	add_32_gate add(a_in, b_in, add_temp_lo);
	or_32_gate myOr(a_in, b_in, or_temp_lo);
	and_32_gate myAnd(a_in, b_in, and_temp_lo);
	
	always@(*) begin
		case(ctrl)
			11  :	begin
						//division stuff
						c_lo_out = division_quotient[31:0];
						c_hi_out = division_quotient[63:32];
				    end
			10  :   begin
						//multiplication stuff
						c_lo_out = multiplication_result[31:0];
						c_hi_out = multiplication_result[63:32];
				    end
			9  :    begin
						//rotate right
						c_lo_out = ror_temp_lo;
					end
			8  :    begin
						//rotate left
						c_lo_out = rol_temp_lo;
					end
			7  :    begin
						//shift right
						c_lo_out = shr_temp_lo;
					end
			6  :    begin
						//shift left
						c_lo_out = shl_temp_lo;
					end
			5  :    begin
						//logical not
						//should we pass b or a?
						c_lo_out = not_temp_lo;
					end
			4  :    begin
						//logical neg
						//should we pass b or a? 
			            c_lo_out = neg_temp_lo;
					end
			3  :    begin
			            //subtract
						c_lo_out = sub_temp_lo;
					end
			2  :    begin
			           //add
					   c_lo_out = add_temp_lo;
					end
			1  :    begin
			           //or
					   c_lo_out = or_temp_lo;
					end
			0  :    begin
						//and
						c_lo_out = and_temp_lo;
				    end
			default : begin end
		endcase
	end
endmodule
