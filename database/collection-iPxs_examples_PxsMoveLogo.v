//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date: 23/11/2017 
// Module Name: PxsMoveLogo
// Description: draw a Logo overlay with movement
//	
//
// Revision: 
// Revision 0.01 - File Created
// Revision 0.02 - Optimized for BRAM mapping of logo ROM
//					Added background transparency
//				   	Logo can be upscaled 2x 
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

module PxsMoveLogo (
                input wire        px_clk,       
                input wire [25:0] RGBStr_i,      
                output reg [25:0] RGBStr_o      
               );


    //logo definition
	parameter FILE_LOGO = "logofpga.list";
	parameter ALFA = 1'b0;  // background color selected
   
	// Logo dimension.
    parameter width_logo = 96; //80;
    parameter height_logo = 80; //96;

	// use the following parameters to get the logo upscaled 2x
	 //parameter up_width_logo = 96*2;
     //parameter up_height_logo = 80*2;

	localparam Awidth = $clog2(width_logo*height_logo); // calculate the address width
	// logo rom 
	reg  [0:0] logo [width_logo*height_logo-1:0];

	// Some colors.
    parameter [2:0] black = 3'b000;
    parameter [2:0] blue  = 3'b001;
    parameter [2:0] green = 3'b010;
    parameter [2:0] white = 3'b111;
    parameter [2:0] pink = 3'b101;

    parameter ink = white;
    parameter background = white;

	parameter [9:0] VISIBLECOLS = 640;
	parameter [9:0] VISIBLEROWS = 480;
    parameter border = 240;
    parameter [9:0] x_logo_min = border;
    parameter [9:0] y_logo_min = border;
	parameter [9:0] x_logo_max = VISIBLECOLS - width_logo - border;
    parameter [9:0] y_logo_max = VISIBLEROWS - height_logo - border;

	// use the following parameters to get the logo upscaled 2x
	// parameter [9:0] x_logo_max = VISIBLECOLS - up_width_logo - border;
    // parameter [9:0] y_logo_max = VISIBLEROWS - up_height_logo - border;

	//speed and direction regs;
	wire [Awidth-1:0] addr, addr2x;
	//wire [13:0] addr;
	reg [4:0] SPEED;
	reg dx,dy;
	wire endframe;
	reg [9:0] x_logo, y_logo;  // upper left logo coord
	reg [9:0] x_img, y_img;    // image coord
	reg [25:0] AuxStr1, AuxStr2;
	reg InLogo;
	reg pixel;
	reg [6:0] counter;
	
	// initialization of logo location, direction and speed
	initial
    begin
		if (FILE_LOGO) $readmemb(FILE_LOGO, logo);   // Load logo on memory
		x_logo <=10; //(VISIBLECOLS - width_logo)/8;
		y_logo <=(VISIBLEROWS - height_logo)/4;
		dx <=0;
		dy <=1;
		SPEED <= 1;
    end
	
	assign endframe = (RGBStr_i[`XC]==VISIBLECOLS-1 && RGBStr_i[`YC]==VISIBLEROWS-1)? 1'b1 : 1'b0 ;
	assign addr=y_img*width_logo+x_img;
	
	// use the following addr to get the logo upscaled 2x
	//assign addr2x=y_img[9:1]*width_logo+x_img[9:1];

    
// Task1: draw the logo	( 3-stages pipeline)
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
		// replace InLogo to get the logo upscaled 2x
		//InLogo<= (x_img >= 0 && x_img < up_width_logo) && (y_img >= 0 && y_img < up_height_logo);
		InLogo<= (x_img >= 0 && x_img < width_logo) && (y_img >= 0 && y_img < height_logo);
		AuxStr2[`HS]<=AuxStr1[`HS]; AuxStr2[`VS]<=AuxStr1[`VS];
		AuxStr2[`XC]<=AuxStr1[`XC]; AuxStr2[`YC]<=AuxStr1[`YC];
		AuxStr2[`Active]<=AuxStr1[`Active];
		AuxStr2[`RGB]<=AuxStr1[`RGB];
		// replace to get the logo upscaled 2x
		//pixel <= logo [add2x];
		pixel <= logo [addr];
	end		
	// Stage2: draw Logo 
	always @(posedge px_clk)
    begin
		RGBStr_o[`HS]<=AuxStr2[`HS]; RGBStr_o[`VS]<=AuxStr2[`VS];
		RGBStr_o[`XC]<=AuxStr2[`XC]; RGBStr_o[`YC]<=AuxStr2[`YC];
		RGBStr_o[`Active]<=AuxStr2[`Active];

		if(InLogo)
			RGBStr_o[`RGB]<= pixel? ink: (ALFA? AuxStr2[`RGB]:background);
		else
			RGBStr_o[`RGB]<=AuxStr2[`RGB];
	end

// Task2: update parameters during Vblanking period
	always @(posedge px_clk)
    begin
		if (endframe)
		begin
				counter <= counter+1;
				
				// update the X coordinate
				//update the Y coordinate
				/*if (counter==7'b1000000) 
				begin	
					dx = ~ dx;
					//mute = 0;
					//code_sound <= pong;
				end*/
				// update X coordinate every 8 frames
				if (counter[0]==1)
				begin
					if (y_logo>=200  ||  y_logo<80) 
						dy = ~ dy;
					if (dx==0)
						x_logo = x_logo+2;
					else 
						x_logo = x_logo-SPEED;
					if (dy==0)
						y_logo = y_logo+SPEED;
					else 
						y_logo = y_logo-SPEED;
				end
		end		
    end
	
endmodule
