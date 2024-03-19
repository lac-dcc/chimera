//
// recodedFloat32Compare( a, b, a_eq_b, a_lt_b, a_eq_b_invalid, a_lt_b_invalid )
// Author: B. Richards, U. C. Berkeley, 4/5/2011
//

module recodedFloat32Compare( a, b, a_eq_b, a_lt_b, a_eq_b_invalid, a_lt_b_invalid);
	parameter SIG_WIDTH			= 23;
	parameter EXP_WIDTH			= 9;

	localparam FLOAT_WIDTH      = SIG_WIDTH + EXP_WIDTH + 1;

	input  [FLOAT_WIDTH-1:0] a, b;
	output			 a_eq_b;
	output			 a_lt_b;
	output			 a_eq_b_invalid;
	output			 a_lt_b_invalid;

	wire			 signalling_nan; // If '1', EQ or NE op is invalid.
	wire			 a_or_b_is_nan;  // If '1', LT, LE, GT, GE op is invalid.

	wire                     a_sign;
	wire   [EXP_WIDTH-1:0]   a_exp;
	wire   [2:0]             a_code;
	wire   [SIG_WIDTH-1:0]   a_sig;
	wire                     b_sign;
	wire   [EXP_WIDTH-1:0]   b_exp;
	wire   [2:0]             b_code;
	wire   [SIG_WIDTH-1:0]   b_sig;

	wire			 neg_zero_eq;

	wire                     sign_equal;
	wire			 exp_equal;
	wire			 sig_equal;

	wire			 exp_a_lt_exp_b;
	wire			 sig_a_lt_sig_b;

	//
	// Break out {sign, exponent, significand} for inputs
	//
	assign a_sign = a[FLOAT_WIDTH-1];
	assign a_exp  = a[FLOAT_WIDTH-2:SIG_WIDTH];
	assign a_sig  = a[SIG_WIDTH-1:0];

	assign b_sign = b[FLOAT_WIDTH-1];
	assign b_exp  = b[FLOAT_WIDTH-2:SIG_WIDTH];
	assign b_sig  = b[SIG_WIDTH-1:0];

	assign a_code = a[FLOAT_WIDTH-2:FLOAT_WIDTH-4];
	assign b_code = b[FLOAT_WIDTH-2:FLOAT_WIDTH-4];

	//
	// Compare {sign, exponent, significand} separately
	//
	assign sign_equal =  (a_sign == b_sign);
	assign exp_equal  =  (a_exp  == b_exp);
	assign sig_equal  =  (a_sig  == b_sig);

	assign exp_a_lt_exp_b = (a_exp < b_exp);
	assign exp_a_gt_exp_b = ~exp_a_lt_exp_b && ~exp_equal;
	assign sig_a_lt_sig_b = (a_sig < b_sig);
	assign sig_a_gt_sig_b = ~sig_a_lt_sig_b && ~sig_equal;

	//
	// Special case checks
	//
	assign neg_zero_eq = (a_code == 3'b000 && b_code == 3'b000 && ~sign_equal);
	assign a_or_b_is_nan  = (a_code == 3'b111 || b_code == 3'b111);
	assign signalling_nan =
						 ({a_code,a[SIG_WIDTH-1]} == 4'b1110 ||
						  {b_code,b[SIG_WIDTH-1]} == 4'b1110);

	//
	// Equality test.  Special cases include:
	//	 -0 == +0  => true
	//	NaN == NaN => false
	//
	assign a_eq_b 	  =  neg_zero_eq      ? 1'b1 :
						 ~sign_equal      ? 1'b0 :
						 ~exp_equal       ? 1'b0 :
						 ~sig_equal       ? 1'b0 :
						 a_code == 3'b111 ? 1'b0 :
						 1'b1;

	//
	// Less-Than test.  Special cases include:
	//	NaN < any => false
	//	any < NaN => false
	//	-0  < +0  => false
	//  +0  < -0  => false
	//
	assign a_lt_b	  =  a_or_b_is_nan ? 1'b0 :
						 neg_zero_eq ? 1'b0 :
						 (a_sign == 1'b0 && b_sign == 1'b0) ?
							(exp_equal ? sig_a_lt_sig_b : exp_a_lt_exp_b) :
						 (a_sign == 1'b1 && b_sign == 1'b0) ? 1'b1 :
						 (a_sign == 1'b0 && b_sign == 1'b1) ? 1'b0 :
						 (a_sign == 1'b1 && b_sign == 1'b1) ?
							(exp_equal ? sig_a_gt_sig_b : exp_a_gt_exp_b) :
						 1'bx;

	assign a_eq_b_invalid = signalling_nan;
	assign a_lt_b_invalid = a_or_b_is_nan;

endmodule
