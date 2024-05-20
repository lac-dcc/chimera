// This program was cloned from: https://github.com/pongsagon/tt07-tiniest-gpu
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Matt Pongsagon Vichitvejpaisal
 * SPDX-License-Identifier: Apache-2.0
 */
//`timescale 1ns / 1ps


module tt_um_pongsagon_tiniest_gpu (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n    // reset_n - low to reset
    // verilator
    // input SIM_pc_data_ready,						
	// input signed [15:0] SIM_x_world_v0,			
	// input signed [15:0] SIM_y_world_v0,
	// input signed [15:0] SIM_z_world_v0,
	// input signed [15:0] SIM_x_world_v1,
	// input signed [15:0] SIM_y_world_v1,
	// input signed [15:0] SIM_z_world_v1,
	// input signed [15:0] SIM_x_world_v2,
	// input signed [15:0] SIM_y_world_v2,
	// input signed [15:0] SIM_z_world_v2,
	// input signed [15:0] SIM_nx,					
	// input signed [15:0] SIM_ny,
	// input signed [15:0] SIM_nz,
	// input signed [15:0] SIM_light_x,			
	// input signed [15:0] SIM_light_y,
	// input signed [15:0] SIM_light_z,
	// input signed [15:0] SIM_vp_00,				
	// input signed [15:0] SIM_vp_01,
	// input signed [15:0] SIM_vp_02,
	// input signed [15:0] SIM_vp_03,
	// input signed [15:0] SIM_vp_10,				
	// input signed [15:0] SIM_vp_11,
	// input signed [15:0] SIM_vp_12,
	// input signed [15:0] SIM_vp_13,
	// input signed [15:0] SIM_vp_30,				
	// input signed [15:0] SIM_vp_31,
	// input signed [15:0] SIM_vp_32,
	// input signed [15:0] SIM_vp_33,
	// output reg [9:0] SIM_sx,  
    // output reg [9:0] SIM_sy,  
    // output reg SIM_de,              
    // output reg [7:0] SIM_r,         
    // output reg [7:0] SIM_g,        
    // output reg [7:0] SIM_b          
);

	wire reset = !rst_n;
	wire [5:0] RGB;


	// internal reg, between IA, VS
	reg pc_data_ready;					// true for 1 clk	 
	reg signed [15:0] x_world_v0;			// Q8.8
	reg signed [15:0] y_world_v0;
	reg signed [15:0] z_world_v0;
	reg signed [15:0] x_world_v1;
	reg signed [15:0] y_world_v1;
	reg signed [15:0] z_world_v1;
	reg signed [15:0] x_world_v2;
	reg signed [15:0] y_world_v2;
	reg signed [15:0] z_world_v2;
	reg signed [15:0] nx;					// Q2.14
	reg signed [15:0] ny;
	reg signed [15:0] nz;
	reg signed [15:0] light_x;			// Q2.14
	reg signed [15:0] light_y;
	reg signed [15:0] light_z;
	reg signed [15:0] vp_00;				// Q8.8
	reg signed [15:0] vp_01;
	reg signed [15:0] vp_02;
	reg signed [15:0] vp_03;
	reg signed [15:0] vp_10;				
	reg signed [15:0] vp_11;
	reg signed [15:0] vp_12;
	reg signed [15:0] vp_13;
	reg signed [15:0] vp_30;				
	reg signed [15:0] vp_31;
	reg signed [15:0] vp_32;
	reg signed [15:0] vp_33;


	wire rx = ui_in[3];
	wire [7:0] read_data;
	wire read_done;
	wire update_reg;		
	wire pc_ready;
	wire [5:0] idx;		// 0-54
	uart_top UART_UNIT(.clk(clk),.reset(reset),.rx(rx),.rx_data_out(read_data),.rx_done_tick(read_done));
	// ia ia1( clk, reset, read_data,      idx, update_reg, pc_ready);

	// tmp code, assign something to wire has no driver warning
	assign update_reg = read_done;
	assign pc_ready = read_done;
	assign idx = 6'b11_1111;


	// update internal reg from IA
	always @(posedge clk) begin
		if(reset) begin
			pc_data_ready <= 0;			
			x_world_v0 <= 0;			
			y_world_v0 <= 0;
			z_world_v0 <= 0;
			x_world_v1 <= 0;
			y_world_v1 <= 0;
			z_world_v1 <= 0;
			x_world_v2 <= 0;
			y_world_v2 <= 0;
			z_world_v2 <= 0;
			nx <= 0;				
			ny <= 0;
			nz <= 0;
			light_x <= 0;			
			light_y <= 0;
			light_z <= 0;
			vp_00 <= 0;				
			vp_01 <= 0;
			vp_02 <= 0;
			vp_03 <= 0;
			vp_10 <= 0;				
			vp_11 <= 0;
			vp_12 <= 0;
			vp_13 <= 0;
			vp_30 <= 0;				
			vp_31 <= 0;
			vp_32 <= 0;
			vp_33 <= 0;
		end
		else begin
			if (update_reg) begin
				case(idx)
					0: begin
						x_world_v0[7:0] <= read_data;		
					end
					1: begin
						x_world_v0[15:8] <= read_data;	
					end
					2: begin
						y_world_v0[7:0] <= read_data;		
					end
					3: begin
						y_world_v0[15:8] <= read_data;		
					end
					4: begin
						z_world_v0[7:0] <= read_data;		
					end
					5: begin
						z_world_v0[15:8] <= read_data;		
					end
					6: begin
						x_world_v1[7:0] <= read_data;		
					end
					7: begin
						x_world_v1[15:8] <= read_data;	
					end
					8: begin
						y_world_v1[7:0] <= read_data;		
					end
					9: begin
						y_world_v1[15:8] <= read_data;		
					end
					10: begin
						z_world_v1[7:0] <= read_data;		
					end
					11: begin
						z_world_v1[15:8] <= read_data;		
					end
					12: begin
						x_world_v2[7:0] <= read_data;		
					end
					13: begin
						x_world_v2[15:8] <= read_data;	
					end
					14: begin
						y_world_v2[7:0] <= read_data;		
					end
					15: begin
						y_world_v2[15:8] <= read_data;		
					end
					16: begin
						z_world_v2[7:0] <= read_data;		
					end
					17: begin
						z_world_v2[15:8] <= read_data;		
					end
					18: begin
						nx[7:0] <= read_data;		
					end
					19: begin
						nx[15:8] <= read_data;		
					end
					20: begin
						ny[7:0] <= read_data;		
					end
					21: begin
						ny[15:8] <= read_data;		
					end
					22: begin
						nz[7:0] <= read_data;		
					end
					23: begin
						nz[15:8] <= read_data;		
					end
					24: begin
						light_x[7:0] <= read_data;		
					end
					25: begin
						light_x[15:8] <= read_data;		
					end
					26: begin
						light_y[7:0] <= read_data;		
					end
					27: begin
						light_y[15:8] <= read_data;		
					end
					28: begin
						light_z[7:0] <= read_data;		
					end
					29: begin
						light_z[15:8] <= read_data;		
					end
					30: begin
						vp_00[7:0] <= read_data;		
					end
					31: begin
						vp_00[15:8] <= read_data;		
					end
					32: begin
						vp_01[7:0] <= read_data;		
					end
					33: begin
						vp_01[15:8] <= read_data;		
					end
					34: begin
						vp_02[7:0] <= read_data;		
					end
					35: begin
						vp_02[15:8] <= read_data;		
					end
					36: begin
						vp_03[7:0] <= read_data;		
					end
					37: begin
						vp_03[15:8] <= read_data;		
					end
					38: begin
						vp_10[7:0] <= read_data;		
					end
					39: begin
						vp_10[15:8] <= read_data;		
					end
					40: begin
						vp_11[7:0] <= read_data;		
					end
					41: begin
						vp_11[15:8] <= read_data;		
					end
					42: begin
						vp_12[7:0] <= read_data;		
					end
					43: begin
						vp_12[15:8] <= read_data;		
					end
					44: begin
						vp_13[7:0] <= read_data;		
					end
					45: begin
						vp_13[15:8] <= read_data;		
					end
					46: begin
						vp_30[7:0] <= read_data;		
					end
					47: begin
						vp_30[15:8] <= read_data;		
					end
					48: begin
						vp_31[7:0] <= read_data;		
					end
					49: begin
						vp_31[15:8] <= read_data;		
					end
					51: begin
						vp_32[7:0] <= read_data;		
					end
					52: begin
						vp_32[15:8] <= read_data;		
					end
					53: begin
						vp_33[7:0] <= read_data;		
					end
					54: begin
						vp_33[15:8] <= read_data;		
					end
					default: begin
						
					end
				endcase
			end
		end
		pc_data_ready <= pc_ready;
	end

	
	wire [5:0] rgb;
	wire signed [19:0] y_screen_v0;		
	wire signed [19:0] y_screen_v1;	
	wire signed [19:0] y_screen_v2;
	wire signed [19:0] e0_init_t1;
	wire signed [19:0] e1_init_t1;
	wire signed [19:0] e2_init_t1;

	vs vs1(.clk(clk),.reset(reset),.x(x),.y(y),.pc_data_ready(pc_data_ready),
					.x_world_v0(x_world_v0),.y_world_v0(y_world_v0),.z_world_v0(z_world_v0),
					.x_world_v1(x_world_v1),.y_world_v1(y_world_v1),.z_world_v1(z_world_v1),
					.x_world_v2(x_world_v2),.y_world_v2(y_world_v2),.z_world_v2(z_world_v2),
					.nx(nx),.ny(ny),.nz(nz),
					.light_x(light_x),.light_y(light_y),.light_z(light_z),
					.vp_00(vp_00),.vp_01(vp_01),.vp_02(vp_02),.vp_03(vp_03),
					.vp_10(vp_10),.vp_11(vp_11),.vp_12(vp_12),.vp_13(vp_13),
					.vp_30(vp_30),.vp_31(vp_31),.vp_32(vp_32),.vp_33(vp_33),
					.y_screen_v0(y_screen_v0),.y_screen_v1(y_screen_v1),.y_screen_v2(y_screen_v2),
					.e0_init_t1(e0_init_t1),.e1_init_t1(e1_init_t1),.e2_init_t1(e2_init_t1));

	raster raster1(.clk(clk),.reset(reset),.x(x),.y(y),
					.y_screen_v0(y_screen_v0),.y_screen_v1(y_screen_v1),.y_screen_v2(y_screen_v2),
					.e0_init_t1(e0_init_t1),.e1_init_t1(e1_init_t1),.e2_init_t1(e2_init_t1),.rgb(rgb));

	wire hsync;
	wire vsync;
	wire [9:0] x, y;
	wire blank;
	vga v(.clk (clk),.reset(reset), .HS (hsync),.VS (vsync), .x (x), .y (y), .blank (blank));

	assign RGB = (blank)? 6'b000000: rgb;



	// All output pins must be assigned. If not used, assign to 0.
	
	// Output PMOD - Tiny VGA
    assign uio_out[0] = RGB[1];
    assign uio_out[1] = RGB[3];
    assign uio_out[2] = RGB[5];
    assign uio_out[3] = vsync;
    assign uio_out[4] = RGB[0];
    assign uio_out[5] = RGB[2];
    assign uio_out[6] = RGB[4];
    assign uio_out[7] = hsync;
	
	assign uio_oe[7:0] = 8'b1111_1111;
	assign uo_out[7:0] = 0;



	//////////////////////////////
	// verilator
	//////////////////////////////

	// always @(posedge clk) begin
	// 	pc_data_ready <= SIM_pc_data_ready;				
	// 	x_world_v0 <= SIM_x_world_v0;	
	// 	y_world_v0 <= SIM_y_world_v0;
	// 	z_world_v0 <= SIM_z_world_v0;
	// 	x_world_v1 <= SIM_x_world_v1;
	// 	y_world_v1 <= SIM_y_world_v1;
	// 	z_world_v1 <= SIM_z_world_v1;
	// 	x_world_v2 <= SIM_x_world_v2;
	// 	y_world_v2 <= SIM_y_world_v2;
	// 	z_world_v2 <= SIM_z_world_v2;
	// 	nx <= SIM_nx;					
	// 	ny <= SIM_ny;
	// 	nz <= SIM_nz;
	// 	light_x <= SIM_light_x;			
	// 	light_y <= SIM_light_y;
	// 	light_z <= SIM_light_z;
	// 	vp_00 <= SIM_vp_00;				
	// 	vp_01 <= SIM_vp_01;
	// 	vp_02 <= SIM_vp_02;
	// 	vp_03 <= SIM_vp_03;
	// 	vp_10 <= SIM_vp_10;				
	// 	vp_11 <= SIM_vp_11;
	// 	vp_12 <= SIM_vp_12;
	// 	vp_13 <= SIM_vp_13;
	// 	vp_30 <= SIM_vp_30;				
	// 	vp_31 <= SIM_vp_31;
	// 	vp_32 <= SIM_vp_32;
	// 	vp_33 <= SIM_vp_33;
	// 	SIM_sx <= x;
    //     SIM_sy <= y;
    //     SIM_de <= ~blank;
    //     SIM_r <= {4{RGB[1:0]}};
    //     SIM_g <= {4{RGB[3:2]}};
    //     SIM_b <= {4{RGB[5:4]}};
	// end


	//////////////////////////////
	// fpga code to reduce clk from 100Mhz to 50Mhz
	// commment this block in ASIC, verilator
	//////////////////////////////
	
	/*reg[27:0] counter=28'd0;
	parameter DIVISOR = 28'd2;
	reg clk;
	always @(posedge clk100)
	begin
		counter <= counter + 28'd1;
		if(counter>=(DIVISOR-1))
			counter <= 28'd0;

		clk <= (counter<DIVISOR/2)?1'b1:1'b0;
	end*/


endmodule

