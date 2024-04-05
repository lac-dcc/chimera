//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date: 03/11/2017 
// Module Name: PxsBouncingBall
// Description: draw bouncing ball overlay
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
//
// Additional Comments: based on PixelStream lib from Celoxica Ltd.
//
//-----------------------------------------------------------------------------
//-- GPL license
//-----------------------------------------------------------------------------
`include "Pxs.vh"

module PxsBouncingBall #(
        parameter SIZE_BALL = 16)
			(
                input wire        px_clk,       // pixel clock.
                input wire [25:0] RGBStr_i,       // VGA stream
                output reg [25:0] RGBStr_o       // 
               );
    
    // Border definition.
    parameter border = 0;
    parameter [9:0] x_ball_min = border;
    parameter [9:0] x_ball_max = 640 - SIZE_BALL - border;
    parameter [9:0] y_ball_min = border;
    parameter [9:0] y_ball_max = 480 - SIZE_BALL - border;

    // 
	parameter [9:0] VISIBLECOLS = 640;
	parameter [9:0] VISIBLEROWS = 480;

	//speed and direction regs;
	reg [4:0] speed;
	reg dx,dy;
	wire endframe;
	reg [9:0] x_ball, y_ball;
	reg [9:0] BX, BY;
	reg [25:0] AuxStr1, AuxStr2;
	reg Ball;
	
	// initialization of ball location, direction and speed
	initial
    begin
		x_ball <= (640 - SIZE_BALL)/4;
		y_ball <= (480 - SIZE_BALL)/2;
		dx <=0;
		dy <=0;
		speed <= 1;
    end
	
	assign endframe = (RGBStr_i[`XC]==VISIBLECOLS-1 && RGBStr_i[`YC]==VISIBLEROWS-1)? 1'b1 : 1'b0 ;
	
	// Block1: Visualization
	always @(posedge px_clk)
    begin
		// Clone VGA stream in a RGB stream.
		RGBStr_o[`VGA] <= RGBStr_i[`VGA];
		// Draw ball.
		RGBStr_o[`RGB] <= (
               (RGBStr_i[`YC] > y_ball) && (RGBStr_i[`YC] < y_ball+SIZE_BALL) &&
               (RGBStr_i[`XC] > x_ball) && (RGBStr_i[`XC] < x_ball+SIZE_BALL)
             ) ? 3'b101 : RGBStr_i[`RGB];
		
	end
		
	//Block2: Update Ball parameters	
	always @(posedge px_clk)
    begin
		if (endframe)
		begin
				// bounce with vertical borders
				if (x_ball>=x_ball_max  || x_ball>=(VISIBLECOLS-speed-border) || x_ball<border || x_ball<speed) 
				begin	
					dx = ~ dx;
					//mute = 0;
					//code_sound <= pong;
				end
				// bounce with horizontal borders
				if (y_ball>=y_ball_max  || y_ball>=(VISIBLEROWS-speed-border) || y_ball<border || y_ball<speed) 
				begin
					dy = ~ dy;
					//mute = 0;
					//code_sound <= pong;
				end
				// update the X coordinate
				if (dx==0)
					x_ball = x_ball+speed;
				else 
					x_ball = x_ball-speed;
				//update the X coordinate
				if (dy==0)
					y_ball = y_ball+speed;
				else 
					y_ball = y_ball-speed;
				//inc velocities
				// if (inc_vel && speed < 20)
					// speed = speed +1;
				// else 
					// if (dec_vel && speed > 0) 
						// speed = speed -1;

		end		
    end
	
endmodule
