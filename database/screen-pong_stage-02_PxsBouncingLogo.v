//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date: 03/11/2017 
// Module Name: PxsBouncingLogo
// Description: draw bouncing Logo overlay
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
//
// Additional Comments: based on PixelStream lib from Celoxica Ltd.
//
//////////////////////////////////////////////////////////////////////////////////
module PxsBouncingLogo (
                input wire        px_clk,       // pixel clock.
                input wire [25:0] RGBStr_i,       // VGA stream
				input wire pixel,
				output wire [9:0] x_add,
				output wire [9:0] y_add,
                output reg [25:0] RGBStr_o       // 
               );

// alias 
`define Active 0:0
`define VS 1:1
`define HS 2:2
`define YC 12:3
`define XC 22:13
`define RGB 25:23
   
	// Logo dimension.
    parameter width_logo = 80;
    parameter height_logo = 96;

	// Some colors.
    parameter [2:0] black = 3'b000;
    parameter [2:0] blue  = 3'b001;
    parameter [2:0] green = 3'b010;
    parameter [2:0] white = 3'b111;

    parameter ink = green;
    parameter background = white;

    parameter border = 0;
    parameter [9:0] x_logo_min = border;
    parameter [9:0] x_logo_max = 640 - width_logo - border;
    parameter [9:0] y_logo_min = border;
    parameter [9:0] y_logo_max = 480 - height_logo - border;

	parameter [9:0] VISIBLECOLS = 640;
	parameter [9:0] VISIBLEROWS = 480;

	//speed and direction regs;
	reg [4:0] SPEED;
	reg dx,dy;
	wire endframe;
	reg [9:0] x_logo, y_logo;  // upper left logo coord
	reg [9:0] x_img, y_img;    // image coord
	reg [25:0] AuxStr1, AuxStr2;
	reg Logo, pix;
	
	// initialization of logo location, direction and speed
	initial
    begin
		x_logo <= (640 - width_logo)/2;
		y_logo <= (480 - height_logo)/2;
		dx <=0;
		dy <=0;
		SPEED <= 1;
    end
	
	assign endframe = (RGBStr_i[`XC]==VISIBLECOLS-1 && RGBStr_i[`YC]==VISIBLEROWS-1)? 1'b1 : 1'b0 ;
	assign x_add = x_img;
	assign y_add = y_img;
	
	// Stage0: calculate img coordinates
	always @(posedge px_clk)
    begin
		x_img <= RGBStr_i[`XC]-x_logo;
		y_img <= RGBStr_i[`YC]-y_logo;
		AuxStr1[`HS]<=RGBStr_i[`HS]; AuxStr1[`VS]<=RGBStr_i[`VS];
		AuxStr1[`XC]<=RGBStr_i[`XC]; AuxStr1[`YC]<=RGBStr_i[`YC];
		AuxStr1[`Active]<=RGBStr_i[`Active];
		AuxStr1[`RGB]<=RGBStr_i[`RGB];
	end
	// Stage1: read pixel
	always @(posedge px_clk)
    begin
		Logo<= (x_img >= 0 && x_img < width_logo) && (y_img >= 0 && y_img < height_logo);
		AuxStr2[`HS]<=AuxStr1[`HS]; AuxStr2[`VS]<=AuxStr1[`VS];
		AuxStr2[`XC]<=AuxStr1[`XC]; AuxStr2[`YC]<=AuxStr1[`YC];
		AuxStr2[`Active]<=AuxStr1[`Active];
		AuxStr2[`RGB]<=AuxStr1[`RGB];
		pix<=pixel;
	end		
	// Stage2: draw Logo 
	always @(posedge px_clk)
    begin
		RGBStr_o[`HS]<=AuxStr2[`HS]; RGBStr_o[`VS]<=AuxStr2[`VS];
		RGBStr_o[`XC]<=AuxStr2[`XC]; RGBStr_o[`YC]<=AuxStr2[`YC];
		RGBStr_o[`Active]<=AuxStr2[`Active];

		if(Logo)
		begin
			RGBStr_o[`RGB]<= pix? ink: AuxStr2[`RGB]; //background;
		end
		else
		begin
			RGBStr_o[`RGB]<=AuxStr2[`RGB];
		end
	end
	
	// Update logo parameters	
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
				// bounce with horizontal borders
				if (y_logo>=y_logo_max  || y_logo>=(VISIBLEROWS-SPEED-border) || y_logo<border || y_logo<SPEED) 
				begin
					dy = ~ dy;
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
		end		
    end
	
endmodule
