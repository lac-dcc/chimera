// This program was cloned from: https://github.com/abdelazeem201/Design-and-ASIC-Implementation-of-32-Point-FFT-Processor
// License: MIT License

// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Author: Ahmed Abdelazeem
// Github: https://github.com/abdelazeem201
// Email: ahmed_abdelazeem@outlook.com
// Description: FFT module
// Dependencies: 
// Since: 2021-12-24 15:16:50
// LastEditors: ahmed abdelazeem
// LastEditTime: 2021-17-18 15:16:50
// ********************************************************************
// Module Function
`include "shift_16.v"
`include "shift_8.v"
`include "shift_4.v"
`include "shift_2.v"
`include "shift_1.v"
`include "radix2.v"
`include "ROM_16.v"
`include "ROM_8.v"
`include "ROM_4.v"
`include "ROM_2.v"

module FFT(
		input wire clk,
		input wire  reset,
		input wire in_valid,
		input wire signed [11:0] din_r,
		input wire signed [11:0] din_i,
		output wire out_valid,
		output reg signed [15:0] dout_r,
		output reg signed [15:0] dout_i
	);

	integer i;
	reg signed  [15:0] result_r[0:31];
	reg signed  [15:0] result_i[0:31];
	reg signed  [15:0] result_r_ns[0:31];
	reg signed  [15:0] result_i_ns[0:31];
	reg signed [15:0] next_dout_r;
	reg signed [15:0] next_dout_i;
	reg         [5:0]   count_y;
	reg         [5:0]   next_count_y;

	reg signed [23:0] din_r_reg,din_i_reg;
	reg in_valid_reg,r4_valid,next_r4_valid;
	reg [1:0] no5_state;
	reg s5_count,next_s5_count;
	reg next_over,over;
	reg assign_out;
	reg next_out_valid;
	reg [4:0]y_1_delay;

	wire [23:0] out_r,out_i;
	wire [4:0] y_1;
	wire [23:0] din_r_wire,din_i_wire;

	assign out_valid = assign_out;
	assign y_1 = (count_y>5'd0)? (count_y - 5'd1) : count_y; 
	assign din_r_wire = din_r_reg;
	assign din_i_wire = din_i_reg;

	wire [1:0] rom16_state;
	wire [23:0]rom16_w_r,rom16_w_i;
	wire [23:0]shift_16_dout_r,shift_16_dout_i;
	wire [23:0] radix_no1_delay_r,radix_no1_delay_i;

	wire [1:0] rom8_state;
	wire [23:0]rom8_w_r,rom8_w_i;
	wire [23:0]shift_8_dout_r,shift_8_dout_i;
	wire [23:0]radix_no2_delay_r,radix_no2_delay_i;
	wire [23:0]radix_no1_op_r,radix_no1_op_i;
	wire [23:0]radix_no2_op_r,radix_no2_op_i;
	wire radix_no1_outvalid,radix_no2_outvalid;

	wire [1:0] rom4_state;
	wire [23:0]rom4_w_r,rom4_w_i;
	wire [23:0]shift_4_dout_r,shift_4_dout_i;
	wire [23:0]radix_no3_delay_r,radix_no3_delay_i;
	wire [23:0]radix_no3_op_r,radix_no3_op_i;
	wire radix_no3_outvalid;

	wire [1:0] rom2_state;
	wire [23:0]rom2_w_r,rom2_w_i;
	wire [23:0]shift_2_dout_r,shift_2_dout_i;
	wire [23:0]radix_no4_delay_r,radix_no4_delay_i;
	wire [23:0]radix_no4_op_r,radix_no4_op_i;
	wire radix_no4_outvalid;

	wire [23:0]shift_1_dout_r,shift_1_dout_i;
	wire [23:0]radix_no5_delay_r,radix_no5_delay_i;
	wire [23:0]radix_no5_op_r,radix_no5_op_i;

radix2 radix_no1(
		.state(rom16_state),//state ctrl
		.din_a_r(shift_16_dout_r),//fb
		.din_a_i(shift_16_dout_i),//fb
		.din_b_r(din_r_wire),//input
		.din_b_i(din_i_wire),//input
		.w_r(rom16_w_r),//twindle_r
		.w_i(rom16_w_i),//twindle_i
		.op_r(radix_no1_op_r),
		.op_i(radix_no1_op_i),
		.delay_r(radix_no1_delay_r),
		.delay_i(radix_no1_delay_i),
		.outvalid(radix_no1_outvalid)
	);

shift_16 shift_16(
		.clk(clk),.reset(reset),
		.in_valid(in_valid_reg),
		.din_r(radix_no1_delay_r),
		.din_i(radix_no1_delay_i),
		.dout_r(shift_16_dout_r),
		.dout_i(shift_16_dout_i)
	);

ROM_16 rom16(
		.clk(clk),
		.in_valid(in_valid_reg),
		.reset(reset),
		.w_r(rom16_w_r),
		.w_i(rom16_w_i),
		.state(rom16_state)
	);

radix2 radix_no2(
		.state(rom8_state),//state ctrl
		.din_a_r(shift_8_dout_r),//fb
		.din_a_i(shift_8_dout_i),//fb
		.din_b_r(radix_no1_op_r),//input
		.din_b_i(radix_no1_op_i),//input
		.w_r(rom8_w_r),//twindle
		.w_i(rom8_w_i),//d
		.op_r(radix_no2_op_r),
		.op_i(radix_no2_op_i),
		.delay_r(radix_no2_delay_r),
		.delay_i(radix_no2_delay_i),
		.outvalid(radix_no2_outvalid)
	);

shift_8 shift_8(
		.clk(clk),.reset(reset),
		.in_valid(radix_no1_outvalid),
		.din_r(radix_no2_delay_r),
		.din_i(radix_no2_delay_i),
		.dout_r(shift_8_dout_r),
		.dout_i(shift_8_dout_i)
	);

ROM_8 rom8(
		.clk(clk),
		.in_valid(radix_no1_outvalid),
		.reset(reset),
		.w_r(rom8_w_r),
		.w_i(rom8_w_i),
		.state(rom8_state)
	);


radix2 radix_no3(
		.state(rom4_state),//state ctrl
		.din_a_r(shift_4_dout_r),//fb
		.din_a_i(shift_4_dout_i),//fb
		.din_b_r(radix_no2_op_r),//input
		.din_b_i(radix_no2_op_i),//input
		.w_r(rom4_w_r),//twindle
		.w_i(rom4_w_i),//d
		.op_r(radix_no3_op_r),
		.op_i(radix_no3_op_i),
		.delay_r(radix_no3_delay_r),
		.delay_i(radix_no3_delay_i),
		.outvalid(radix_no3_outvalid)
	);

shift_4 shift_4(
		.clk(clk),.reset(reset),
		.in_valid(radix_no2_outvalid),
		.din_r(radix_no3_delay_r),
		.din_i(radix_no3_delay_i),
		.dout_r(shift_4_dout_r),
		.dout_i(shift_4_dout_i)  
	);

ROM_4 rom4(
		.clk(clk),
		.in_valid(radix_no2_outvalid),
		.reset(reset),
		.w_r(rom4_w_r),
		.w_i(rom4_w_i),
		.state(rom4_state)
	);


radix2 radix_no4(
		.state(rom2_state),//state ctrl
		.din_a_r(shift_2_dout_r),//fb
		.din_a_i(shift_2_dout_i),//fb
		.din_b_r(radix_no3_op_r),//input
		.din_b_i(radix_no3_op_i),//input
		.w_r(rom2_w_r),//twindle
		.w_i(rom2_w_i),//d
		.op_r(radix_no4_op_r),
		.op_i(radix_no4_op_i),
		.delay_r(radix_no4_delay_r),
		.delay_i(radix_no4_delay_i),
		.outvalid(radix_no4_outvalid)
	);

shift_2 shift_2(
		.clk(clk),.reset(reset),
		.in_valid(radix_no3_outvalid),
		.din_r(radix_no4_delay_r),
		.din_i(radix_no4_delay_i),
		.dout_r(shift_2_dout_r),
		.dout_i(shift_2_dout_i)
	);

ROM_2 rom2(
		.clk(clk),
		.in_valid(radix_no3_outvalid),
		.reset(reset),
		.w_r(rom2_w_r),
		.w_i(rom2_w_i),
		.state(rom2_state)
	);


radix2 radix_no5(
		.state(no5_state),//state ctrl
		.din_a_r(shift_1_dout_r),//fb
		.din_a_i(shift_1_dout_i),//fb
		.din_b_r(radix_no4_op_r),//input
		.din_b_i(radix_no4_op_i),//input
		.w_r(24'd256),//twindle
		.w_i(24'd0),//d
		.op_r(out_r),
		.op_i(out_i),
		.delay_r(radix_no5_delay_r),
		.delay_i(radix_no5_delay_i),
		.outvalid()
	);

shift_1 shift_1(
		.clk(clk),.reset(reset),
		.in_valid(radix_no4_outvalid),
		.din_r(radix_no5_delay_r),
		.din_i(radix_no5_delay_i),
		.dout_r(shift_1_dout_r),
		.dout_i(shift_1_dout_i)
	);

	always@(posedge clk or posedge reset)begin
		if(reset)begin
			din_r_reg <= 0;
			din_i_reg <= 0;
			in_valid_reg <= 0;
			s5_count <= 0;
			r4_valid <= 0;
			count_y <= 0;
			assign_out <= 0;
			over <= 0;
			dout_r <= 0;
			dout_i <= 0;
			y_1_delay <= 0;
			for (i=0;i<=31;i=i+1) begin
				result_r[i] <= 0;
				result_i[i] <= 0;
			end
		end
		else begin
			din_r_reg <= {{4{din_r[11]}},din_r,8'b0};
			din_i_reg <= {{4{din_i[11]}},din_i,8'b0};
			in_valid_reg <= in_valid;
			s5_count <= next_s5_count;
			r4_valid <= next_r4_valid;
			count_y  <= next_count_y;
			assign_out <= next_out_valid;
			over <= next_over;
			y_1_delay <= y_1;
			dout_r <= next_dout_r;
			dout_i <= next_dout_i;
			for (i=0;i<=31;i=i+1) begin
				result_r[i] <= result_r_ns[i];
				result_i[i] <= result_i_ns[i];
			end
		end
	end
	always@(*)begin

		next_r4_valid = radix_no4_outvalid;
		if (r4_valid)next_s5_count = s5_count + 1;
		else next_s5_count = s5_count;
		
		if(r4_valid && s5_count == 1'b0)no5_state = 2'b01;
		else if(r4_valid && s5_count == 1'b1)no5_state = 2'b10;
		else no5_state = 2'b00;

		if(radix_no4_outvalid) next_count_y = count_y + 5'd1;
		else next_count_y = count_y;

		if(next_out_valid) begin
			next_dout_r = result_r[y_1_delay];
			next_dout_i = result_i[y_1_delay];
		end
		else begin
			next_dout_r = dout_r;
			next_dout_i = dout_i;
		end
	end
	
	always @(*) begin

		next_over = over;
		for (i=0;i<=31;i=i+1) begin
			result_r_ns[i] = result_r[i];
			result_i_ns[i] = result_i[i];
		end
		if(next_over==1'b1)next_out_valid = 1'b1;
		else next_out_valid = assign_out;

		if(over!=1'b1) begin
			case((y_1))
			5'd0 : begin            
				result_r_ns[31] = out_r[23:8];
				result_i_ns[31] = out_i[23:8];
				
			end
			5'd1 : begin            
				result_r_ns[15] = out_r[23:8];
				result_i_ns[15] = out_i[23:8];
			end
			5'd2 : begin            
				result_r_ns[7 ] = out_r[23:8];
				result_i_ns[7 ] = out_i[23:8];
			end
			5'd3 : begin            
				result_r_ns[23] = out_r[23:8];
				result_i_ns[23] = out_i[23:8];
			end
			5'd4 : begin            
				result_r_ns[3 ] = out_r[23:8];
				result_i_ns[3 ] = out_i[23:8];
			end
			5'd5 : begin            
				result_r_ns[19] = out_r[23:8];
				result_i_ns[19] = out_i[23:8];
			end
			5'd6 : begin            
				result_r_ns[11] = out_r[23:8];
				result_i_ns[11] = out_i[23:8];
			end
			5'd7 : begin            
				result_r_ns[27] = out_r[23:8];
				result_i_ns[27] = out_i[23:8];
			end
			5'd8: begin            
				result_r_ns[1 ] = out_r[23:8];
				result_i_ns[1 ] = out_i[23:8];
			end
			5'd9: begin            
				result_r_ns[17] = out_r[23:8];
				result_i_ns[17] = out_i[23:8];
			end
			5'd10: begin            
				result_r_ns[9] = out_r[23:8];
				result_i_ns[9] = out_i[23:8];
			end
			5'd11: begin            
				result_r_ns[25] = out_r[23:8];
				result_i_ns[25] = out_i[23:8];
			end
			5'd12: begin            
				result_r_ns[5 ] = out_r[23:8];
				result_i_ns[5 ] = out_i[23:8];
			end
			5'd13: begin            
				result_r_ns[21] = out_r[23:8];
				result_i_ns[21] = out_i[23:8];
			end
			5'd14: begin            
				result_r_ns[13] = out_r[23:8];
				result_i_ns[13] = out_i[23:8];
			end
			5'd15: begin            
				result_r_ns[29] = out_r[23:8];
				result_i_ns[29] = out_i[23:8];
			end
			5'd16: begin            
				result_r_ns[0 ] = out_r[23:8];
				result_i_ns[0 ] = out_i[23:8];
			end
			5'd17: begin            
				result_r_ns[16] = out_r[23:8];
				result_i_ns[16] = out_i[23:8];
			end
			5'd18: begin            
				result_r_ns[8 ] = out_r[23:8];
				result_i_ns[8 ] = out_i[23:8];
			end
			5'd19: begin            
				result_r_ns[24] = out_r[23:8];
				result_i_ns[24] = out_i[23:8];
			end
			5'd20: begin            
				result_r_ns[4 ] = out_r[23:8];
				result_i_ns[4 ] = out_i[23:8];
			end
			5'd21: begin            
				result_r_ns[20] = out_r[23:8];
				result_i_ns[20] = out_i[23:8];
			end
			5'd22: begin            
				result_r_ns[12] = out_r[23:8];
				result_i_ns[12] = out_i[23:8];
			end
			5'd23: begin            
				result_r_ns[28] = out_r[23:8];
				result_i_ns[28] = out_i[23:8];
			end
			5'd24: begin            
				result_r_ns[2 ] = out_r[23:8];
				result_i_ns[2 ] = out_i[23:8];
			end
			5'd25: begin            
				result_r_ns[18] = out_r[23:8];
				result_i_ns[18] = out_i[23:8];
			end
			5'd26: begin            
				result_r_ns[10] = out_r[23:8];
				result_i_ns[10] = out_i[23:8];
			end
			5'd27: begin            
				result_r_ns[26] = out_r[23:8];
				result_i_ns[26] = out_i[23:8];
			end
			5'd28: begin            
				result_r_ns[6 ] = out_r[23:8];
				result_i_ns[6 ] = out_i[23:8];
			end
			5'd29: begin            
				result_r_ns[22] = out_r[23:8];
				result_i_ns[22] = out_i[23:8];
			end
			5'd30 : begin            
				result_r_ns[14] = out_r[23:8];
				result_i_ns[14] = out_i[23:8];
			end
			5'd31 : begin            
				result_r_ns[30] = out_r[23:8];
				result_i_ns[30] = out_i[23:8];
				next_over = 1'b1;
					end

			endcase
		end
	end

endmodule
