//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date: 03/11/2017 
// Module Name: PxsFrontonGame
// Description: draw Fronton Game
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
//
// Additional Comments: por alguna razón el bit B se coloca a 0 siempre
// 	
//  TODO: 
//		- check the paddle position beyond the vertical borders
//		- increase the ball speed with each bounce 
//		
//////////////////////////////////////////////////////////////////////////////////
module PxsFrontonGame (
                input wire        px_clk,       // pixel clock.
				input wire		  rightButton,
				input wire 		  leftButton,
                input wire [22:0] VGAStr_i,       // VGA stream
				output reg [7:0]  counter,			// Bouncing counter
                output reg [25:0] RGBStr_o       // 
               );

// alias 
`define Active 0:0
`define VS 1:1
`define HS 2:2
`define YC 12:3
`define XC 22:13
`define R 23:23
`define G 24:24
`define B 25:25
`define RGB 25:23
   
	// Logo dimension.
    parameter width_logo = 8;
    parameter height_logo = 10;

	// Paddle dimension.
    //parameter width_paddle = 64;
    parameter height_paddle = 8;

	
    // Border definition.
    parameter border = 0;
    parameter [9:0] x_logo_min = border;
    parameter [9:0] x_logo_max = 640 - width_logo - border;
    parameter [9:0] y_logo_min = border;
    parameter [9:0] y_logo_max = 480 - height_logo - border;

    // 
	parameter [9:0] VISIBLECOLS = 640;
	parameter [9:0] VISIBLEROWS = 480;

	//speed and direction regs;
	reg [4:0] SPEED;
	reg dx,dy;
	wire endframe;
	reg [9:0] x_logo, y_logo, x_paddle, y_paddle;
	reg [9:0] BX, BY, PX, PY;
	reg [22:0] AuxStr1, AuxStr2;
	reg [6:0] width_paddle;
	reg Ball, Paddle, left, right;
	
	// initialization of logo location, direction and speed
	initial
    begin
		x_logo <= (640 - width_logo)/4;
		y_logo <= (480 - height_logo)/2;
		x_paddle <= 320;
		y_paddle <= 480 - 20;
		width_paddle<= 64;
		counter<=0;
		left<=0;
		right<=0;
		dx <=0;
		dy <=0;
		SPEED <= 2;
    end
	
	assign endframe = (VGAStr_i[`XC]==VISIBLECOLS-1 && VGAStr_i[`YC]==VISIBLEROWS-1)? 1'b1 : 1'b0 ;
	// Stage0
	always @(posedge px_clk)
    begin
		BX <= VGAStr_i[`XC]-x_logo; PX<= VGAStr_i[`XC]-x_paddle;
		BY <= VGAStr_i[`YC]-y_logo; PY <= VGAStr_i[`YC]-y_paddle;
		AuxStr1[`HS]<=VGAStr_i[`HS]; AuxStr1[`VS]<=VGAStr_i[`VS];
		AuxStr1[`XC]<=VGAStr_i[`XC]; AuxStr1[`YC]<=VGAStr_i[`YC];
		AuxStr1[`Active]<=VGAStr_i[`Active];
	end
	// Stage1
	always @(posedge px_clk)
    begin
		Ball<= (BX >= 0 && BX < width_logo) && (BY >= 0 && BY < height_logo);
		Paddle <= (PX >= 0 && PX < width_paddle) && (PY >= 0 && PY < height_paddle);
		AuxStr2[`HS]<=AuxStr1[`HS]; AuxStr2[`VS]<=AuxStr1[`VS];
		AuxStr2[`XC]<=AuxStr1[`XC]; AuxStr2[`YC]<=AuxStr1[`YC];
		AuxStr2[`Active]<=AuxStr1[`Active];
	end		
	// Stage2 Draw the ball & the paddle
	always @(posedge px_clk)
    begin
		RGBStr_o[`HS]<=AuxStr2[`HS]; RGBStr_o[`VS]<=AuxStr2[`VS];
		RGBStr_o[`XC]<=AuxStr2[`XC]; RGBStr_o[`YC]<=AuxStr2[`YC];
		RGBStr_o[`Active]<=AuxStr2[`Active];
		
		RGBStr_o[`RGB]<= (Ball || Paddle)? 3'b111:3'b001;

	end
	
	// Update Ball and Paddle position and parameters	
	always @(posedge px_clk)
    begin
		if (endframe)
		begin
				// bounce with vertical borders
				if (x_logo>=x_logo_max  || x_logo>=(VISIBLECOLS-SPEED-border) || x_logo<border || x_logo<SPEED) 
				begin	
					dx = ~ dx;
					//mute = 0;
					//code_sound <= pong;
				end
				// bounce with horizontal borders or paddle
				//if (y_logo>=y_logo_max  || y_logo>=(VISIBLEROWS-SPEED-border) || y_logo<border || y_logo<SPEED)
				//if (y_logo>=y_logo_max  || y_logo>=(VISIBLEROWS-SPEED-border) || y_logo<border || y_logo<SPEED 
				//|| (y_logo>= y_paddle-SPEED-height_paddle && x_logo> x_paddle && x_logo<x_paddle+ width_paddle))

				// bounce with horizontal borders 
				if (y_logo<border || y_logo<SPEED)			
				begin
					dy = ~ dy;
				end
				if (y_logo>=y_logo_max  || y_logo>=(VISIBLEROWS-SPEED-border))			
				begin
					dy = ~ dy;
					counter<=counter-1;
					//width_paddle<=width_paddle-4;
					//mute = 0;
					//code_sound <= pong;
				end
				//bounce with paddle and increase bouncer counter
				if (y_logo>= y_paddle-SPEED-height_paddle && x_logo> x_paddle && x_logo<x_paddle+ width_paddle)			
				begin
					dy = ~ dy;
					counter<=counter+1;
					//mute = 0;
					//code_sound <= pong;
				end

				// update the X coordinate
				if (dx==0)
					x_logo = x_logo+SPEED;
				else 
					x_logo = x_logo-SPEED;
				//update the X coordinate
				if (dy==0)
					y_logo = y_logo+SPEED;
				else 
					y_logo = y_logo-SPEED;
				//inc velocities
				// if (inc_vel && SPEED < 20)
					// SPEED = SPEED +1;
				// else 
					// if (dec_vel && SPEED > 0) 
						// SPEED = SPEED -1;
						
				// update X paddle coordinate
				if (left==1)
				
					x_paddle = x_paddle-2;					
				else
					if (right==1)
						x_paddle = x_paddle+2;

				//left<=0;
				//right<=0;
		end		
    end
	
	
	// register the buttons
	always @(posedge px_clk)
    begin
		if (leftButton==1)
			left <= 1;
		else 
			left<=0;
			
		if (rightButton)
			right<=1;
		else
			right<=0;
	end
	
endmodule
