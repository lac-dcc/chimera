// This program was cloned from: https://github.com/aniketuppin/n-body-gravity-simulator
// License: Apache License 2.0

//--------------------------------------------------------------------------//
// Description: Pipelined design of acceleration calculator     //              					                      
//--------------------------------------------------------------------------//

module accelerator
(	input i_clk, i_rst,
	input [31:0] i_b1_x, i_b1_y, // body 1 x and y positions
	input [31:0] i_b2_x, i_b2_y, // body 1 x and y positions
	input [31:0] i_m_b2, // mass of body 2
	input [31:0] i_a_b1_x, i_a_b1_y, //previously computed acceleration for body 1 in x and y directions
	
	output [31:0] o_a_b1_x, o_a_b1_y //current computed acceleration for body 1 in x and y directions
);


localparam [26:0] epsilon_square = {1'd0, 8'd100, 18'd0}; // epsilon^2 = 7.45058*10^-9


//assign i_a_b1_x = {1'd0, 8'd100, 18'd0};
//assign i_a_b1_y = {1'd0, 8'd100, 18'd0};

integer i;
reg [26:0] r_mass_pipe_reg[0:14];

////////////////////////////////////////////////////////////////////////////////////////////////////////////

always @(posedge i_clk )
begin

	if(!i_rst)
	begin
		for(i=0;i<15;i=i+1)
			r_mass_pipe_reg[i] <= 'd0;
	end
	
	else
	begin
		for(i=0;i<14;i=i+1)
			r_mass_pipe_reg[i+1] <= r_mass_pipe_reg[i];
			
		r_mass_pipe_reg[0] <= i_m_b2[31:5];
	end

end

wire  [26:0] w_b2_x_neg, w_b2_y_neg;

fp_neg neg_inst1 (i_b2_x[31:5], w_b2_x_neg);
fp_neg neg_inst2 (i_b2_y[31:5], w_b2_y_neg);

////////////////////////////////////////////////////////////////////////////////////////////////////////////

wire  [26:0] w_x_displacement, w_y_displacement;

FpAdd add_inst1 (i_clk, i_b1_x[31:5], w_b2_x_neg, w_x_displacement, i_rst);
FpAdd add_inst2 (i_clk, i_b1_y[31:5], w_b2_y_neg, w_y_displacement, i_rst);

reg [26:0] r_x_displacement, r_y_displacement;

always @(posedge i_clk )
begin

	if(!i_rst)
	begin
		r_x_displacement <= 'd0;
		r_y_displacement <= 'd0;
	end
	
	else
	begin
		r_x_displacement <= w_x_displacement;
		r_y_displacement <= w_y_displacement;
	end
	
end


////////////////////////////////////////////////////////////////////////////////////////////////////////////

wire  [26:0] w_x_displacement_square, w_y_displacement_square;

fp_mul mul_inst1 (r_x_displacement, r_x_displacement,  w_x_displacement_square);
fp_mul mul_inst2 (r_y_displacement, r_y_displacement,  w_y_displacement_square);
		
reg [26:0] r_x_displacement_square, r_y_displacement_square;

always @(posedge i_clk )
begin

	if(!i_rst)
	begin
		r_x_displacement_square <= 'd0;
		r_y_displacement_square <= 'd0;
	end
	
	else
	begin
		r_x_displacement_square <= w_x_displacement_square;
		r_y_displacement_square <= w_y_displacement_square;
	end
	
end


reg [26:0] r_x_displacement_pipe_reg[0:7];
reg [26:0] r_y_displacement_pipe_reg[0:7];


always @(posedge i_clk )
begin

	if(!i_rst)
	begin
		for(i=0;i<8;i=i+1)
		begin
			r_x_displacement_pipe_reg[i] <= 'd0;
			r_y_displacement_pipe_reg[i] <= 'd0;
		end
	end
	
	else
	begin
		for(i=0;i<7;i=i+1)
		begin
			r_x_displacement_pipe_reg[i+1] <= r_x_displacement_pipe_reg[i];
			r_y_displacement_pipe_reg[i+1] <= r_y_displacement_pipe_reg[i];
		end
			
		r_x_displacement_pipe_reg[0] <= r_x_displacement;
		r_y_displacement_pipe_reg[0] <= r_y_displacement;
		
	end

end
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
wire  [26:0] w_r_square; //r^2 = x^2 + y^2
reg  [26:0] r_r_square;


FpAdd add_inst3 (i_clk, r_x_displacement_square, r_y_displacement_square, w_r_square, i_rst);

always @(posedge i_clk )
begin
	if(!i_rst)
		r_r_square <= 'd0;
		
	else
		r_r_square <= w_r_square;
		
end


reg [26:0] r_r_square_pipe_reg[0:4];

always @(posedge i_clk )
begin

	if(!i_rst)
	begin
		for(i=0;i<5;i=i+1)
			r_r_square_pipe_reg[i] <= 'd0;
	end
	
	else
	begin
		for(i=0;i<4;i=i+1)
			r_r_square_pipe_reg[i+1] <= r_r_square_pipe_reg[i];
			
		r_r_square_pipe_reg[0] <= r_r_square;
	end

end

////////////////////////////////////////////////////////////////////////////////////////////////////////////

wire  [26:0] w_inv_r; // 1/r
reg  [26:0] r_inv_r;

fast_inv_sqrt sqrt_inst1 (i_clk, i_rst, r_r_square, w_inv_r);


always @(posedge i_clk )
begin
	if(!i_rst)
		r_inv_r <= 'd0;
		
	else
		r_inv_r <= w_inv_r;
		
end
	

////////////////////////////////////////////////////////////////////////////////////////////////////////////

wire  [26:0] w_r_sqr_plus_ep_sqr; // r^2 + epsilon^2
reg  [26:0] r_r_sqr_plus_ep_sqr;

FpAdd add_inst4 (i_clk, r_r_square, epsilon_square, w_r_sqr_plus_ep_sqr, i_rst);

always @(posedge i_clk )
begin
	if(!i_rst)
		r_r_sqr_plus_ep_sqr <= 'd0;
		
	else
		r_r_sqr_plus_ep_sqr <= w_r_sqr_plus_ep_sqr;
		
end

////////////////////////////////////////////////////////////////////////////////////////////////////////////

wire  [26:0] w_inv_sqrt_r_sqr_plus_ep_sqr; // 1/sqrt(r^2 + epsilon^2)
reg  [26:0] r_inv_sqrt_r_sqr_plus_ep_sqr;

fast_inv_sqrt sqrt_inst2 (i_clk, i_rst, r_r_sqr_plus_ep_sqr, w_inv_sqrt_r_sqr_plus_ep_sqr);


always @(posedge i_clk )
begin
	if(!i_rst)
		r_inv_sqrt_r_sqr_plus_ep_sqr <= 'd0;
		
	else
		r_inv_sqrt_r_sqr_plus_ep_sqr <= w_inv_sqrt_r_sqr_plus_ep_sqr;
		
end

////////////////////////////////////////////////////////////////////////////////////////////////////////////


wire  [26:0] w_x_hat, w_y_hat, w_r; // (x2 - x1)/r and similar for y also and w_r --> radius(distance between two points)
reg  [26:0] r_x_hat_pipe_reg[0:3];
reg  [26:0] r_y_hat_pipe_reg[0:3];
reg  [26:0] r_r;


fp_mul mul_inst3 (r_x_displacement_pipe_reg[7], r_inv_r, w_x_hat);
fp_mul mul_inst4 (r_y_displacement_pipe_reg[7], r_inv_r, w_y_hat);
fp_mul mul_inst5 (r_r_square_pipe_reg[4], r_inv_r, w_r);
always @(posedge i_clk )
begin

	if(!i_rst)
	begin
		for(i=0;i<4;i=i+1)
		begin
			r_x_hat_pipe_reg[i] <= 'd0;
			r_y_hat_pipe_reg[i] <= 'd0;
		end
		
		r_r <= 'd0;
	end
	
	else
	begin
		for(i=0;i<3;i=i+1)
		begin
			r_x_hat_pipe_reg[i+1] <= r_x_hat_pipe_reg[i];
			r_y_hat_pipe_reg[i+1] <= r_y_hat_pipe_reg[i];
		end
			
		r_x_hat_pipe_reg[0] <= w_x_hat;
		r_y_hat_pipe_reg[0] <= w_y_hat;
		r_r <= w_r;
		
	end

end

////////////////////////////////////////////////////////////////////////////////////////////////////////////

reg [26:0] r_r_1;

always @(posedge i_clk )
begin
	if(!i_rst)
		r_r_1 <= 'd0;

	else
		r_r_1 <= r_r;
end

///////////////////////////////////////////////////////////////////////////////////////////////////////////


wire  [26:0] w_r_by_sqrt_r_sqr_plus_ep_sqr; // r/sqrt(r^2 + epsilon^2)
wire  [26:0] w_inv_r_sqr_plus_ep_sqr; // 1/(r^2 + epsilon^2)

reg [26:0] r_r_by_sqrt_r_sqr_plus_ep_sqr;
reg [26:0] r_inv_r_sqr_plus_ep_sqr;

fp_mul mul_inst6 (r_r_1, r_inv_sqrt_r_sqr_plus_ep_sqr, w_r_by_sqrt_r_sqr_plus_ep_sqr);
fp_mul mul_inst7 (r_inv_sqrt_r_sqr_plus_ep_sqr, r_inv_sqrt_r_sqr_plus_ep_sqr, w_inv_r_sqr_plus_ep_sqr);


always @(posedge i_clk )
begin

	if(!i_rst)
	begin
		r_r_by_sqrt_r_sqr_plus_ep_sqr <= 'd0;
		r_inv_r_sqr_plus_ep_sqr <= 'd0;
	end
	
	else
	begin
		r_r_by_sqrt_r_sqr_plus_ep_sqr <= w_r_by_sqrt_r_sqr_plus_ep_sqr;
		r_inv_r_sqr_plus_ep_sqr <= w_inv_r_sqr_plus_ep_sqr;
	end
	
end

///////////////////////////////////////////////////////////////////////////////////////////////////////////

wire  [26:0] w_r_by_cubeof_sqrt_r_sqr_plus_ep_sqr; // r/(sqrt(r^2 + epsilon^2))^3
reg  [26:0] r_r_by_cubeof_sqrt_r_sqr_plus_ep_sqr;

fp_mul mul_inst8 (r_r_by_sqrt_r_sqr_plus_ep_sqr, r_inv_r_sqr_plus_ep_sqr, w_r_by_cubeof_sqrt_r_sqr_plus_ep_sqr);

always @(posedge i_clk )
begin
	if(!i_rst)
		r_r_by_cubeof_sqrt_r_sqr_plus_ep_sqr <= 'd0;
	
	else
		r_r_by_cubeof_sqrt_r_sqr_plus_ep_sqr <= w_r_by_cubeof_sqrt_r_sqr_plus_ep_sqr;
		
end

///////////////////////////////////////////////////////////////////////////////////////////////////////////

wire  [26:0] w_x_a_part, w_y_a_part, w_neg_x_a_part, w_neg_y_a_part ; // x and y acceleration part
reg  [26:0] r_x_a_part, r_y_a_part;


fp_mul mul_inst9  (r_x_hat_pipe_reg[3], r_r_by_cubeof_sqrt_r_sqr_plus_ep_sqr, w_x_a_part);
fp_mul mul_inst10 (r_y_hat_pipe_reg[3], r_r_by_cubeof_sqrt_r_sqr_plus_ep_sqr, w_y_a_part);
fp_neg neg_inst3  (w_x_a_part, w_neg_x_a_part);
fp_neg neg_inst4  (w_y_a_part, w_neg_y_a_part);


always @(posedge i_clk )
begin

	if(!i_rst)
	begin
		r_x_a_part <= 'd0;
		r_y_a_part <= 'd0;
	end
	
	else
	begin
		r_x_a_part <= w_neg_x_a_part;
		r_y_a_part <= w_neg_y_a_part;
	end
	
end

///////////////////////////////////////////////////////////////////////////////////////////////////////////


wire  [26:0] w_a_b1_x, w_a_b1_y;
reg  [26:0] r_a_b1_x, r_a_b1_y;

fp_mul mul_inst11 (r_mass_pipe_reg[14], r_x_a_part, w_a_b1_x);
fp_mul mul_inst12 (r_mass_pipe_reg[14], r_y_a_part, w_a_b1_y);

always @(posedge i_clk )
begin

	if(!i_rst)
	begin
		r_a_b1_x <= 'd0;
		r_a_b1_y <= 'd0;
	end
	
	else
	begin
		r_a_b1_x <= w_a_b1_x;
		r_a_b1_y <= w_a_b1_y;
	end
	
end

///////////////////////////////////////////////////////////////////////////////////////////////////////////

wire  [26:0] w_final_a_b1_x, w_final_a_b1_y;
reg   [26:0] r_final_a_b1_x, r_final_a_b1_y;

FpAdd add_inst5 (i_clk, r_a_b1_x, i_a_b1_x[31:5], w_final_a_b1_x, i_rst);
FpAdd add_inst6 (i_clk, r_a_b1_y, i_a_b1_y[31:5], w_final_a_b1_y, i_rst);

always @(posedge i_clk )
begin

	if(!i_rst)
	begin
		r_final_a_b1_x <= 'd0;
		r_final_a_b1_y <= 'd0;
	end
	
	else
	begin
		r_final_a_b1_x <= w_final_a_b1_x;
		r_final_a_b1_y <= w_final_a_b1_y;
	end
	
end

assign o_a_b1_x = {r_final_a_b1_x, 5'b0};
assign o_a_b1_y = {r_final_a_b1_y, 5'b0};

endmodule
