// This program was cloned from: https://github.com/pongsagon/tt07-tiniest-gpu
// License: Apache License 2.0

//`timescale 1ns / 1ps


module vs(
	input clk, 		
	input reset,
	// from vga
	input [9:0] x,
	input [9:0] y,
	// from top, set by IA
	input pc_data_ready,						// true for 1 clk	 
	input signed [15:0] x_world_v0,			// Q8.8
	input signed [15:0] y_world_v0,
	input signed [15:0] z_world_v0,
	input signed [15:0] x_world_v1,
	input signed [15:0] y_world_v1,
	input signed [15:0] z_world_v1,
	input signed [15:0] x_world_v2,
	input signed [15:0] y_world_v2,
	input signed [15:0] z_world_v2,
	input signed [15:0] nx,					// Q2.14
	input signed [15:0] ny,
	input signed [15:0] nz,
	input signed [15:0] light_x,			// Q2.14
	input signed [15:0] light_y,
	input signed [15:0] light_z,
	input signed [15:0] vp_00,				// Q8.8
	input signed [15:0] vp_01,
	input signed [15:0] vp_02,
	input signed [15:0] vp_03,
	input signed [15:0] vp_10,				
	input signed [15:0] vp_11,
	input signed [15:0] vp_12,
	input signed [15:0] vp_13,
	input signed [15:0] vp_30,				
	input signed [15:0] vp_31,
	input signed [15:0] vp_32,
	input signed [15:0] vp_33,
	// to raster
	//output reg [1:0] tri_color,				// 2-bit intensity for each tri							
	output reg signed [19:0] y_screen_v0,		// change per frame, int20		
	output reg signed [19:0] y_screen_v1,	
	output reg signed [19:0] y_screen_v2,
	output reg signed [19:0] e0_init_t1,		// change per line, int20
	output reg signed [19:0] e1_init_t1,
	output reg signed [19:0] e2_init_t1
	);


	// internal reg
	reg signed [15:0] x_clip_v0;				// Q8.8
	reg signed [15:0] x_clip_v1;
	reg signed [15:0] x_clip_v2;
	reg signed [15:0] y_clip_v0;
	reg signed [15:0] y_clip_v1;
	reg signed [15:0] y_clip_v2;
	reg signed [15:0] w_clip_v0;
	reg signed [15:0] w_clip_v1;
	reg signed [15:0] w_clip_v2;
	reg signed [15:0] x_ndc_v0;					// Q2.14
	reg signed [15:0] x_ndc_v1;	
	reg signed [15:0] x_ndc_v2;	
	reg signed [15:0] y_ndc_v0;	
	reg signed [15:0] y_ndc_v1;	
	reg signed [15:0] y_ndc_v2;				
	reg signed [19:0] x_screen_v0_buff1;		// int20
	reg signed [19:0] y_screen_v0_buff1;
	reg signed [19:0] x_screen_v1_buff1;		
	reg signed [19:0] y_screen_v1_buff1;
	reg signed [19:0] x_screen_v2_buff1;		
	reg signed [19:0] y_screen_v2_buff1;
	reg signed [19:0] x_screen_v0_buff2;		
	reg signed [19:0] y_screen_v0_buff2;
	reg signed [19:0] x_screen_v1_buff2;		
	reg signed [19:0] y_screen_v1_buff2;
	reg signed [19:0] x_screen_v2_buff2;		
	reg signed [19:0] y_screen_v2_buff2;
	reg signed [19:0] x_screen_v0;
	reg signed [19:0] x_screen_v1;
	reg signed [19:0] x_screen_v2;
	reg buff1_ready;



	reg signed [31:0] div_a;  
	reg signed [31:0] div_b;  
	wire signed [31:0] div_result;
    reg div_start;
	wire div_done;
    div div1 (.clk (clk), .rst(reset),.start(div_start),.done(div_done)
    		  ,.a(div_a),.b(div_b),.val(div_result));

	// mul 20-bit used to compute ei_init
	reg signed [19:0] mul_a;  
	reg signed [19:0] mul_b;  
    wire signed [39:0] mul_result;  
    reg mul_start;
    wire mul_done;
    slowmpy mul (.i_clk (clk), .i_reset(reset), .i_stb(mul_start),.i_a(mul_a)
    			,.i_b(mul_b),.i_aux(1'b0),.o_done(mul_done),.o_p(mul_result));

    reg dot_start;
    wire dot_done;
    // use in always @(*), not infer registers (that's not what declare the signal of reg type means), 
    // it infers a multiplexer with constant assignment 
    reg signed [15:0] v1_x;			
	reg signed [15:0] v1_y;
	reg signed [15:0] v1_z;
	reg signed [15:0] v1_w;
	reg signed [15:0] v2_x;
	reg signed [15:0] v2_y;
	reg signed [15:0] v2_z;
	reg signed [15:0] v2_w;
    wire signed [15:0] dot_result;
    dot4 dot (.clk (clk), .reset(reset),.start(dot_start)
    			,.v1_x(v1_x),.v1_y(v1_y),.v1_z(v1_z),.v1_w(v1_w)
    			,.v2_x(v2_x),.v2_y(v2_y),.v2_z(v2_z),.v2_w(v2_w)
    			,.done(dot_done),.result(dot_result));
    

    
    // for compute [VP] -> div w -> [S], dot(light,n)
	reg [4:0] state_transform;		// 0-30 states
	reg signed [15:0] tmp_ndc;

	// for setting wire input to dot4 module
	always @(*) begin
		case (state_transform)
			1: begin
				v1_x = x_world_v0;
				v1_y = y_world_v0;
				v1_z = z_world_v0;
				v1_w = 1;
				v2_x = vp_00;
				v2_y = vp_01;
				v2_z = vp_02;
				v2_w = vp_03;
			end
			2: begin
				v1_x = x_world_v0;
				v1_y = y_world_v0;
				v1_z = z_world_v0;
				v1_w = 1;
				v2_x = vp_10;
				v2_y = vp_11;
				v2_z = vp_12;
				v2_w = vp_13;
			end
			3: begin
				v1_x = x_world_v0;
				v1_y = y_world_v0;
				v1_z = z_world_v0;
				v1_w = 1;
				v2_x = vp_30;
				v2_y = vp_31;
				v2_z = vp_32;
				v2_w = vp_33;
			end
			4: begin
				v1_x = x_world_v1;
				v1_y = y_world_v1;
				v1_z = z_world_v1;
				v1_w = 1;
				v2_x = vp_00;
				v2_y = vp_01;
				v2_z = vp_02;
				v2_w = vp_03;
			end
			5: begin
				v1_x = x_world_v1;
				v1_y = y_world_v1;
				v1_z = z_world_v1;
				v1_w = 1;
				v2_x = vp_10;
				v2_y = vp_11;
				v2_z = vp_12;
				v2_w = vp_13;
			end
			6: begin
				v1_x = x_world_v1;
				v1_y = y_world_v1;
				v1_z = z_world_v1;
				v1_w = 1;
				v2_x = vp_30;
				v2_y = vp_31;
				v2_z = vp_32;
				v2_w = vp_33;
			end
			7: begin
				v1_x = x_world_v2;
				v1_y = y_world_v2;
				v1_z = z_world_v2;
				v1_w = 1;
				v2_x = vp_00;
				v2_y = vp_01;
				v2_z = vp_02;
				v2_w = vp_03;
			end
			8: begin
				v1_x = x_world_v2;
				v1_y = y_world_v2;
				v1_z = z_world_v2;
				v1_w = 1;
				v2_x = vp_10;
				v2_y = vp_11;
				v2_z = vp_12;
				v2_w = vp_13;
			end
			9: begin
				v1_x = x_world_v2;
				v1_y = y_world_v2;
				v1_z = z_world_v2;
				v1_w = 1;
				v2_x = vp_30;
				v2_y = vp_31;
				v2_z = vp_32;
				v2_w = vp_33;
			end
			default: begin
				v1_x = 0;
				v1_y = 0;
				v1_z = 0;
				v1_w = 0;
				v2_x = 0;
				v2_x = 0;
				v2_x = 0;
				v2_x = 0;
			end
		endcase
	end


    // for compute ei_int
    reg [1:0] state_ei_line;
    reg [3:0] state_ei_frame;
    reg signed [19:0] tmp_ei_mul1;
    reg signed [19:0] tmp_ei_mul2;

	always @(posedge clk) begin
		if (reset) begin
			// mul, div
			div_a <= 0;
			div_b <= 0;
			div_start <= 0;
			mul_a <= 0;
			mul_b <= 0;
			mul_start <= 0;
			// compute transform
			state_transform <= 0;
			tmp_ndc <= 0;
			// compute e0_init
			state_ei_line <= 1;
			state_ei_frame <= 0;
			tmp_ei_mul1 <= 0;
			tmp_ei_mul2 <= 0;
			// internal
			x_clip_v0 <= 0;
			x_clip_v1 <= 0;
			x_clip_v2 <= 0;
			y_clip_v0 <= 0;
			y_clip_v1 <= 0;
			y_clip_v2 <= 0;
			w_clip_v0 <= 0;
			w_clip_v1 <= 0;
			w_clip_v2 <= 0;
			x_ndc_v0 <= 0;
			x_ndc_v1 <= 0;
			x_ndc_v2 <= 0;
			y_ndc_v0 <= 0;
			y_ndc_v1 <= 0;
			y_ndc_v2 <= 0;
			buff1_ready <= 0;
			x_screen_v0 <= 0;
			y_screen_v0 <= 0;
			x_screen_v1 <= 0;
			y_screen_v1 <= 0;
			x_screen_v2 <= 0;
			y_screen_v2 <= 0;
			x_screen_v0_buff1 <= 0;
			y_screen_v0_buff1 <= 0;
			x_screen_v1_buff1 <= 0;
			y_screen_v1_buff1 <= 0;
			x_screen_v2_buff1 <= 0;
			y_screen_v2_buff1 <= 0;
			x_screen_v0_buff2 <= 0;
			y_screen_v0_buff2 <= 0;
			x_screen_v1_buff2 <= 0;
			y_screen_v1_buff2 <= 0;
			x_screen_v2_buff2 <= 0;
			y_screen_v2_buff2 <= 0;
			e0_init_t1 <= 0;
			e1_init_t1 <= 0;
			e2_init_t1 <= 0;
		end
		else begin

			//////////////////////////////
			// compute [VP] -> div w -> [S], dot(light,n)
			//////////////////////////////
			case (state_transform)
				0: begin
					// wait for pc_data_ready
					if (pc_data_ready) begin
						dot_start <= 1;
						state_transform <= 1;
					end
				end
				// clip = [VP] * world
				1: begin
					dot_start <= 0;
					if (dot_done) begin
						x_clip_v0 <= dot_result;
						dot_start <= 1;
						state_transform <= 2;
					end
				end 
				2: begin
					dot_start <= 0;
					if (dot_done) begin
						y_clip_v0 <= dot_result;
						dot_start <= 1;
						state_transform <= 3;
					end
				end 
				3: begin
					dot_start <= 0;
					if (dot_done) begin
						w_clip_v0 <= dot_result;
						dot_start <= 1;
						state_transform <= 4;
					end
				end 
				4: begin
					dot_start <= 0;
					if (dot_done) begin
						x_clip_v1 <= dot_result;
						dot_start <= 1;
						state_transform <= 5;
					end
				end 
				5: begin
					dot_start <= 0;
					if (dot_done) begin
						y_clip_v1 <= dot_result;
						dot_start <= 1;
						state_transform <= 6;
					end
				end 
				6: begin
					dot_start <= 0;
					if (dot_done) begin
						w_clip_v1 <= dot_result;
						dot_start <= 1;
						state_transform <= 7;
					end
				end 
				7: begin
					dot_start <= 0;
					if (dot_done) begin
						x_clip_v2 <= dot_result;
						dot_start <= 1;
						state_transform <= 8;
					end
				end 
				8: begin
					dot_start <= 0;
					if (dot_done) begin
						y_clip_v2 <= dot_result;
						dot_start <= 1;
						state_transform <= 9;
					end
				end 
				9: begin
					dot_start <= 0;
					if (dot_done) begin
						w_clip_v2 <= dot_result;
						// ndc = clip.xy / clip.w
						// 		Q8.8->Q16.16 -> Q16.16 = Q16.16/Q16.16 -> Q16.16->Q2.14
						// 		signed extended[15:0] <= { {8{extend[7]}}, extend[7:0] };
						div_a <= { {8{x_clip_v0[15]}}, x_clip_v0, 8'b0000_0000};
						div_b <= { {8{w_clip_v0[15]}}, w_clip_v0, 8'b0000_0000};
						div_start <= 1;
						state_transform <= 10;
					end
				end 
				// 
				//
				10: begin
					div_start <= 0;
					if (div_done) begin
						x_ndc_v0 <= div_result[17:2];
						div_a <= { {8{y_clip_v0[15]}}, y_clip_v0, 8'b0000_0000};
						div_b <= { {8{w_clip_v0[15]}}, w_clip_v0, 8'b0000_0000};
						div_start <= 1;
						state_transform <= 11;
					end
				end
				11: begin
					div_start <= 0;
					if (div_done) begin
						y_ndc_v0 <= div_result[17:2];
						div_a <= { {8{x_clip_v1[15]}}, x_clip_v1, 8'b0000_0000};
						div_b <= { {8{w_clip_v1[15]}}, w_clip_v1, 8'b0000_0000};
						div_start <= 1;
						state_transform <= 12;
					end
				end
				12: begin
					div_start <= 0;
					if (div_done) begin
						x_ndc_v1 <= div_result[17:2];
						div_a <= { {8{y_clip_v1[15]}}, y_clip_v1, 8'b0000_0000};
						div_b <= { {8{w_clip_v1[15]}}, w_clip_v1, 8'b0000_0000};
						div_start <= 1;
						state_transform <= 13;
					end
				end
				13: begin
					div_start <= 0;
					if (div_done) begin
						y_ndc_v1 <= div_result[17:2];
						div_a <= { {8{x_clip_v2[15]}}, x_clip_v2, 8'b0000_0000};
						div_b <= { {8{w_clip_v2[15]}}, w_clip_v2, 8'b0000_0000};
						div_start <= 1;
						state_transform <= 14;
					end
				end
				14: begin
					div_start <= 0;
					if (div_done) begin
						x_ndc_v2 <= div_result[17:2];
						div_a <= { {8{y_clip_v2[15]}}, y_clip_v2, 8'b0000_0000};
						div_b <= { {8{w_clip_v2[15]}}, w_clip_v2, 8'b0000_0000};
						div_start <= 1;
						state_transform <= 15;
					end
				end
				15: begin
					div_start <= 0;
					if (div_done) begin
						y_ndc_v2 <= div_result[17:2];
						// screen = [S] * ndc
						// 		x_ndc * 320 + 320 = x_ndc << 8 + x_ndc << 6 + 320
						x_ndc_v0 <= {x_ndc_v0[15],x_ndc_v0[15:1]};		// Q2.14 (x_ndc) -> Q10.6 (x_ndc << 8) -> Q11.5
						tmp_ndc <= { {3{x_ndc_v0[15]}}, x_ndc_v0[15:3]};	// Q2.14 (x_ndc) -> Q8.8 (x_ndc << 6) -> Q11.5
						state_transform <= 16;
					end
				end
				//
				//
	 			16: begin
					x_ndc_v0 <= x_ndc_v0 + tmp_ndc;
					//
					x_ndc_v1 <= {x_ndc_v1[15],x_ndc_v1[15:1]};		
					tmp_ndc <= { {3{x_ndc_v1[15]}}, x_ndc_v1[15:3]};
					state_transform <= 17;
				end
				17: begin  
					x_ndc_v0 <= x_ndc_v0 + 16'sb001_0100_0000_00000;		// Q11.5 (320)
					//
					x_ndc_v1 <= x_ndc_v1 + tmp_ndc;
					//
					x_ndc_v2 <= {x_ndc_v2[15],x_ndc_v2[15:1]};		
					tmp_ndc <= { {3{x_ndc_v2[15]}}, x_ndc_v2[15:3]};
					state_transform <= 18;
				end
				18: begin
					x_ndc_v1 <= x_ndc_v1 + 16'sb001_0100_0000_00000;		
					//
					x_ndc_v2 <= x_ndc_v2 + tmp_ndc;
					// y_ndc * 240 + 240 = y_ndc << 8 - y_ndcc << 4 + 240
					y_ndc_v0 <= {y_ndc_v0[15],y_ndc_v0[15:1]};		// Q2.14 (y_ndc) -> Q10.6 (y_ndc << 8) -> Q11.5
					tmp_ndc <= { {5{y_ndc_v0[15]}}, y_ndc_v0[15:5]};	// Q2.14 (y_ndc) -> Q6.10 (y_ndc << 4) -> Q11.5
					state_transform <= 19;
				end
				19: begin  
					x_ndc_v2 <= x_ndc_v2 + 16'sb001_0100_0000_00000;
					//
					y_ndc_v0 <= y_ndc_v0 - tmp_ndc;
					//
					y_ndc_v1 <= {y_ndc_v1[15],y_ndc_v1[15:1]};		
					tmp_ndc <= { {5{y_ndc_v1[15]}}, y_ndc_v1[15:5]};
					state_transform <= 20;
				end
				20: begin
					y_ndc_v0 <= y_ndc_v0 + 16'sb000_1111_0000_00000;		// Q11.5 (240)
					//
					y_ndc_v1 <= y_ndc_v1 - tmp_ndc;
					//
					y_ndc_v2 <= {y_ndc_v2[15],y_ndc_v2[15:1]};		
					tmp_ndc <= { {5{y_ndc_v2[15]}}, y_ndc_v2[15:5]};
					state_transform <= 21;
				end
				21: begin
					y_ndc_v1 <= y_ndc_v1 + 16'sb000_1111_0000_00000;		
					//
					y_ndc_v2 <= y_ndc_v2 - tmp_ndc;
					state_transform <= 22;
				end
				22: begin
					y_ndc_v2 <= y_ndc_v2 + 16'sb000_1111_0000_00000;		
					//
					state_transform <= 23;
				end
				23: begin
					if (buff1_ready) begin
						x_screen_v0_buff2 <= {9'b0000_0000_0,x_ndc_v0[15:5]};		// Q20.0 (screen), always positive 
						y_screen_v0_buff2 <= {9'b0000_0000_0,y_ndc_v0[15:5]};
						x_screen_v1_buff2 <= {9'b0000_0000_0,x_ndc_v1[15:5]};
						y_screen_v1_buff2 <= {9'b0000_0000_0,y_ndc_v1[15:5]};
						x_screen_v2_buff2 <= {9'b0000_0000_0,x_ndc_v2[15:5]};
						y_screen_v2_buff2 <= {9'b0000_0000_0,y_ndc_v2[15:5]};
						buff1_ready <= 0;
					end
					else begin
						x_screen_v0_buff1 <= {9'b0000_0000_0,x_ndc_v0[15:5]};		// Q20.0 (screen), always positive 
						y_screen_v0_buff1 <= {9'b0000_0000_0,y_ndc_v0[15:5]};
						x_screen_v1_buff1 <= {9'b0000_0000_0,x_ndc_v1[15:5]};
						y_screen_v1_buff1 <= {9'b0000_0000_0,y_ndc_v1[15:5]};
						x_screen_v2_buff1 <= {9'b0000_0000_0,x_ndc_v2[15:5]};
						y_screen_v2_buff1 <= {9'b0000_0000_0,y_ndc_v2[15:5]};
						buff1_ready <= 1;
					end
					state_transform <= 30;
				end 

				// dot(light, n)

				30: begin
					state_transform <= 0;
				end 
				default: begin
					state_transform <= 0;
				end
			endcase

			//////////////////////////////
			// double buffer xy_screen
			//////////////////////////////
			if ((y == 480) && (x == 0)) begin
	    		if (buff1_ready) begin
	    			x_screen_v0 <= x_screen_v0_buff1;
					y_screen_v0 <= y_screen_v0_buff1;
					x_screen_v1 <= x_screen_v1_buff1;
					y_screen_v1 <= y_screen_v1_buff1;
					x_screen_v2 <= x_screen_v2_buff1;
					y_screen_v2 <= y_screen_v2_buff1;
	    		end
	    		else begin
	    			x_screen_v0 <= x_screen_v0_buff2;
					y_screen_v0 <= y_screen_v0_buff2;
					x_screen_v1 <= x_screen_v1_buff2;
					y_screen_v1 <= y_screen_v1_buff2;
					x_screen_v2 <= x_screen_v2_buff2;
					y_screen_v2 <= y_screen_v2_buff2;
	    		end
	    	end

			//////////////////////////////
			// compute e0_init
			//////////////////////////////
			if (y < 480) begin
				if (x == 640) begin
					// @ endline, compute e0_init -= x2x1; 
					// 		- must finished before x == 799, raster will use e0_init @ x == 799
					state_ei_line <= state_ei_line + 1;
					if (state_ei_line == 1) begin
						state_ei_line <= 0;
						e0_init_t1 <= e0_init_t1 - (x_screen_v1 - x_screen_v0);		// b0
						e1_init_t1 <= e1_init_t1 - (x_screen_v2 - x_screen_v1);		// b1
						e2_init_t1 <= e2_init_t1 - (x_screen_v0 - x_screen_v2);		// b2
					end
				end
			end // y < 480
			else begin
				// @ endframe, compute e0_init = (-pts[0].x * a0) + (pts[0].y * (pts[1].x-pts[0].x);
				//		- call mul 6  time
				case (state_ei_frame)
					0: begin
						if ((y == 480) && (x == 1)) begin
							mul_a <= x_screen_v0;					// pts[0].x
							mul_b <= y_screen_v0 - y_screen_v1;		// -a0
							mul_start <= 1;
							state_ei_frame <= 1;
						end
					end
					1: begin
						mul_start <= 0;
						if (mul_done) begin
							tmp_ei_mul1 <= mul_result[19:0];		// ready in 23clk for 20bit mul
							mul_a <= y_screen_v0;					// pts[0].y
							mul_b <= x_screen_v1 - x_screen_v0;		// b0
							mul_start <= 1;
							state_ei_frame <= 2;
						end
					end
					2: begin
						mul_start <= 0;
						if (mul_done) begin
							tmp_ei_mul2 <= mul_result[19:0];		// ready in 23clk for 20bit mul
							state_ei_frame <= 3;
						end 
					end
					3: begin
						e0_init_t1 <= tmp_ei_mul2 + tmp_ei_mul1;	// fin e0_init_t1
						mul_a <= x_screen_v1;						// pts[1].x
						mul_b <= y_screen_v1 - y_screen_v2;			// -a1
						mul_start <= 1;
						state_ei_frame <= 4;
					end 
					4: begin
						mul_start <= 0;
						if (mul_done) begin
							tmp_ei_mul1 <= mul_result[19:0];		// ready in 23clk for 20bit mul
							mul_a <= y_screen_v1;					// pts[1].y
							mul_b <= x_screen_v2 - x_screen_v1;		// b1
							mul_start <= 1;
							state_ei_frame <= 5;
						end
					end
					5: begin
						mul_start <= 0;
						if (mul_done) begin
							tmp_ei_mul2 <= mul_result[19:0];		// ready in 23clk for 20bit mul
							state_ei_frame <= 6;
						end 
					end
					6: begin
						e1_init_t1 <= tmp_ei_mul2 + tmp_ei_mul1;	// fin e1_init_t1
						mul_a <= x_screen_v2;						// pts[2].x
						mul_b <= y_screen_v2 - y_screen_v0;			// -a2
						mul_start <= 1;
						state_ei_frame <= 7;
					end 
					7: begin
						mul_start <= 0;
						if (mul_done) begin
							tmp_ei_mul1 <= mul_result[19:0];		// ready in 23clk for 20bit mul
							mul_a <= y_screen_v2;					// pts[2].y
							mul_b <= x_screen_v0 - x_screen_v2;		// b2
							mul_start <= 1;
							state_ei_frame <= 8;
						end
					end
					8: begin
						mul_start <= 0;
						if (mul_done) begin
							tmp_ei_mul2 <= mul_result[19:0];		// ready in 23clk for 20bit mul	
							state_ei_frame <= 9;
						end 
					end
					9: begin
						e2_init_t1 <= tmp_ei_mul2 + tmp_ei_mul1;	// fin e2_init_t1
						state_ei_frame <= 0;
					end 
					default: begin
						state_ei_frame <= 0;
					end
				endcase
			end


		end // reset
	end



endmodule

