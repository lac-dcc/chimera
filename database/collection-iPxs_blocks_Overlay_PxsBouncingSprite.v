//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date: 23/11/2017 
// Module Name: PxsBouncingSprite
// Description: draw a bouncing ball overlay with sprites
//	
//
// Revision: 
// Revision 0.01 - File Created
// Revision 0.02 - Optimized for BRAM mapping of sprite ROM
//					Added background transparency
//				   	sprite can be upscaled 2x 
//
// Additional Comments: based on PixelStream lib from Celoxica Ltd.
//
// WARNING: iCE40 sysMEM only support the following conf: 
//          256x16b, 512x8b, 1Kx4b, 2Kx2b
//			ROM of 1b word is mapped to 2Kx2b wasting 1bit per word
//			Alternatively compress pixels into 2b words to save BRAM
//-----------------------------------------------------------------------------
//-- GPL license
//-----------------------------------------------------------------------------
`include "Pxs.vh"

module PxsBouncingSprite (
                input wire        px_clk,       
                input wire [25:0] RGBStr_i,      
                output reg [25:0] RGBStr_o      
               );


    //sprite definition
	parameter FILE_sprite = "BallSpritesROM.list";
   
	// sprite dimension.
    parameter width_sprite = 16;
    parameter height_sprite = 16;
	parameter n_sprite=4;
	parameter n_color=4;

	// use the following parameters to get the sprite upscaled 2x
	// parameter up_width_sprite = 16*2;
    // parameter up_height_sprite = 16*2;

	localparam pixel_width = $clog2(n_color);
	localparam Awidth = $clog2(n_sprite*width_sprite*height_sprite); // calculate the address width
	// sprite ROM
	reg  [1:0] sprite [n_sprite*width_sprite*height_sprite-1:0];

	// Some colors.
    parameter [2:0] black = 3'b000;
    parameter [2:0] blue  = 3'b001;
    parameter [2:0] green = 3'b010;
    parameter [2:0] white = 3'b111;
    parameter [2:0] pink  = 3'b101;
	parameter [2:0] red   = 3'b100;

    parameter background = pink;

	parameter [9:0] VISIBLECOLS = 640;
	parameter [9:0] VISIBLEROWS = 480;
    parameter border = 0;
    parameter [9:0] x_sprite_min = border;
    parameter [9:0] y_sprite_min = border;
	parameter [9:0] x_sprite_max = VISIBLECOLS - width_sprite - border;
    parameter [9:0] y_sprite_max = VISIBLEROWS - height_sprite - border;

	// use the following parameters to get the sprite upscaled 2x
	// parameter [9:0] x_sprite_max = VISIBLECOLS - up_width_sprite - border;
    // parameter [9:0] y_sprite_max = VISIBLEROWS - up_height_sprite - border;

	//speed and direction regs;
	wire [Awidth-1:0] addr, addr2x;
	//wire [13:0] addr;
	reg [4:0] SPEED;
	reg dx,dy;
	wire endframe;
	reg [9:0] x_sprite, y_sprite;  // upper left sprite coord
	reg [9:0] x_img, y_img;    // image coord  
	reg [1:0] index_img; // select one of the img in the ROM
	reg [25:0] AuxStr1, AuxStr2;
	reg Insprite;
	reg [pixel_width-1:0] pixel;
	reg [5:0] frame_counter;
	
	// initialization of sprite location, direction and speed
	initial
    begin
		if (FILE_sprite) $readmemh(FILE_sprite, sprite);   // Load sprites on memory
		x_sprite <=(VISIBLECOLS - width_sprite)/2;
		y_sprite <=(VISIBLEROWS - height_sprite)/2;
		dx <=0;
		dy <=0;
		SPEED <= 1;
		frame_counter <= 0;
    end
	
	assign endframe = (RGBStr_i[`XC]==VISIBLECOLS-1 && RGBStr_i[`YC]==VISIBLEROWS-1)? 1'b1 : 1'b0 ;
	//assign addr=n_sprite*width_sprite*height_sprite+y_img*width_sprite+x_img;
	// If all parameters are power of 2  address can be calculated as
	assign addr = {index_img,y_img[3:0],x_img[3:0]};
	
	// use the following addr to get the sprite upscaled 2x
	//assign addr2x=y_img[9:1]*width_sprite+x_img[9:1];

    
// Task1: draw the sprite	( 3-stages pipeline)
	// Stage0: calculate img coordinates
	always @(posedge px_clk)
    begin
		x_img <= RGBStr_i[`XC]-x_sprite;
		y_img <= RGBStr_i[`YC]-y_sprite;
		AuxStr1[`HS]<=RGBStr_i[`HS]; AuxStr1[`VS]<=RGBStr_i[`VS];
		AuxStr1[`XC]<=RGBStr_i[`XC]; AuxStr1[`YC]<=RGBStr_i[`YC];
		AuxStr1[`Active]<=RGBStr_i[`Active];
		AuxStr1[`RGB]<=RGBStr_i[`RGB];
	end
	// Stage1: read pixel
	always @(posedge px_clk)
    begin
		// replace Insprite to get the sprite upscaled 2x
		//Insprite<= (x_img >= 0 && x_img < up_width_sprite) && (y_img >= 0 && y_img < up_height_sprite);
		Insprite<= (x_img >= 0 && x_img < width_sprite) && (y_img >= 0 && y_img < height_sprite);
		AuxStr2[`HS]<=AuxStr1[`HS]; AuxStr2[`VS]<=AuxStr1[`VS];
		AuxStr2[`XC]<=AuxStr1[`XC]; AuxStr2[`YC]<=AuxStr1[`YC];
		AuxStr2[`Active]<=AuxStr1[`Active];
		AuxStr2[`RGB]<=AuxStr1[`RGB];
		// replace to get the sprite upscaled 2x
		//pixel <= sprite [add2x];
		pixel <= sprite [addr];
	end		
	// Stage2: draw sprite 
	always @(posedge px_clk)
    begin
		RGBStr_o[`HS]<=AuxStr2[`HS]; RGBStr_o[`VS]<=AuxStr2[`VS];
		RGBStr_o[`XC]<=AuxStr2[`XC]; RGBStr_o[`YC]<=AuxStr2[`YC];
		RGBStr_o[`Active]<=AuxStr2[`Active];

		if(Insprite)
			case (pixel)
				2'b00 : RGBStr_o[`RGB]<= AuxStr2[`RGB];
				2'b01 : RGBStr_o[`RGB]<= black;
				2'b10 : RGBStr_o[`RGB]<= red;
				2'b11 : RGBStr_o[`RGB]<= white;
			endcase
		else
			RGBStr_o[`RGB]<=AuxStr2[`RGB];
	end

// Task2: update parameters during Vblanking period
	always @(posedge px_clk)
    begin
		if (endframe)
		begin
			// bounce with vertical borders
			if (x_sprite>=x_sprite_max  || x_sprite>=(VISIBLECOLS-SPEED-border) || x_sprite<border || x_sprite<SPEED) 
			begin	
				dx = ~ dx;
				//mute = 0;
				//code_sound <= pong;
			end
			// bounce with horizontal borders
			if (y_sprite>=y_sprite_max  || y_sprite>=(VISIBLEROWS-SPEED-border) || y_sprite<border || y_sprite<SPEED) 
			begin
				dy = ~ dy;
				//mute = 0;
				//code_sound <= pong;
			end
			// update the X coordinate
			if (dx==0)
				x_sprite = x_sprite+SPEED;
			else 
				x_sprite = x_sprite-SPEED;
			//update the Y coordinate
			if (dy==0)
				y_sprite = y_sprite+SPEED;
			else 
				y_sprite = y_sprite-SPEED;
			//inc velocities
			// if (inc_vel && SPEED < 20)
				// SPEED = SPEED +1;
			// else 
				// if (dec_vel && SPEED > 0) 
					// SPEED = SPEED -1;

			// change the sprite every 16 frames
			if (frame_counter == 10)
				begin
					if (dy ==0)	
						index_img <= index_img-1;
					else
						index_img <= index_img+1;
					frame_counter<= 0;
				end
			else
				frame_counter<= frame_counter+1;
		end		
    end
	
endmodule
