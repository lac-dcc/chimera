// This program was cloned from: https://github.com/aniketuppin/n-body-gravity-simulator
// License: Apache License 2.0


module fast_inv_sqrt
( input i_clk, i_rst,
  input [26:0] i_x,
  output [26:0] o_inv_sqrt
);

wire w_sign;
wire [7:0] w_exponent;
wire [17:0] w_mantissa;

assign w_sign = i_x[26];
assign w_exponent = i_x[25:18];
assign w_mantissa = i_x[17:0];

reg [26:0] r_s12_a, r_s12_b, r_s12_c; // r_s12_a --> 'a' feild pipeline register between stage 1 and 2 
reg [26:0] r_s23_a, r_s23_b;
reg [26:0] r_s34_a;
reg [26:0] r_s45_a, r_s45_b;

wire [26:0] w_s12_a, w_s12_b, w_s12_c; // w_s12_a --> the data on this wire will be assigned to r_s12_a in each clock cycle 
wire [26:0] w_s23_a, w_s23_b;
wire [26:0] w_s34_a;
wire [26:0] w_s45_a, w_s45_b;

assign w_s12_c = 27'd49920718 - (i_x>>1); //27'd49920718 is a overhead term which also helps in better approximation of log(1+x) as x
assign w_s12_b = {w_sign, w_exponent-8'd1,w_mantissa}; // divide by 2

always @(posedge i_clk or negedge i_rst)
begin
	if(!i_rst)
	begin
		r_s12_a <= 27'b0;
		r_s12_b <= 27'b0;
		r_s12_c <= 27'b0;
		r_s23_a <= 27'b0;
		r_s23_b <= 27'b0;
		r_s34_a <= 27'b0;
		r_s45_a <= 27'b0;
		r_s45_b <= 27'b0;
	end
	
	else
	begin
		r_s12_a <= w_s12_a;
		r_s12_b <= w_s12_b;
		r_s12_c <= w_s12_c;
		r_s23_a <= w_s23_a;
		r_s23_b <= w_s23_b;
		r_s34_a <= w_s34_a;
		r_s45_a <= w_s45_a;
		r_s45_b <= w_s45_b;
	end
	
end

// stage 1		
fp_mul m_inst1 (w_s12_c, w_s12_c, w_s12_a);

// stage 2
fp_mul m_inst2 (r_s12_a, r_s12_b, w_s23_a);
assign w_s23_b = r_s12_c;

//stage 3
FpAdd a_inst1 (i_clk, 27'd33423360, {~r_s23_a[26],r_s23_a[25:0]}, w_s45_a, i_rst);
assign w_s34_a = r_s23_b;

//stage 4
assign w_s45_b = r_s34_a;

//stage 5
fp_mul m_inst3 (r_s45_a, r_s45_b, o_inv_sqrt);

endmodule