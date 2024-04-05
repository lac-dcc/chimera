//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date: 27/11/2017 
// Module Name: PxsScoreOverlayLiteParam
// Description: draw 1 score of 1 digit (2 scores adding the commented lines)
//				optimized version for minimum PLB consumption
//              visualization scale can be easily changed
//				with just 2 parameters: upscale and power2scale 
//
//					
//
// Revision: 
// Revision 0.01 - File Created
//
// Additional Comments: based on PixelStream lib from Celoxica Ltd.
// Ideas para reducir: 
//			- un dígito por jugador, no necesita conversor => ROM 0-F
//			- utilizar comparadores de pocos bits
//				p.ej: 
//					ScoreX=128; ScoreY=8;
//					InDigitX= (scanx==128)? 1 : ((scanx==136)? 0 : InDigitX);
//					InDigitY= (scany==8)? 1 : ((scany==16)? 0 : InDigitY);
//					InDigit= InDigitX && InDigitY;
//					addr = {Num, scany[2:0], scanx[2:0]};
//					
//					if (InDigit)
//						RGBStr_o[`RGB]<= Nums[addr]? ink: AuxStr2[`RGB]; //AuxStr2[`RGB]; //background;
//					else
//						RGBStr_o[`RGB]<=AuxStr2[`RGB];
// 
//-----------------------------------------------------------------------------
//-- GPL license
//-----------------------------------------------------------------------------
`include "Pxs.vh"

module PxsScoreOverlayLiteParam(
                input wire        px_clk,  
				input wire [7:0]  score,
                input wire [25:0] RGBStr_i,       
                output reg [25:0] RGBStr_o        
               );

    //logo definition
	parameter FILE_NUMBERS = "numbers2b.list";
   
	// Numbers size. Power of two eases the address generation
    parameter width_number = 8;  
    parameter height_number = 8; 
	parameter upscale = 1;   		// upscale factor
	parameter power2Scale = 0; //$clog2(upscale);		// log2 of upscale 
	
	// numbers rom 10 numbers of 8*8bits => 10*8*4 words (2b/word)
	//reg  [word_size-1:0] Nums [10*height_number*(width_number/word_size)-1:0];
	reg  [0:0] Nums [10*height_number*width_number-1:0];
	
	// Location of Scores
	parameter Score1X = 128; // WARNING: initial positions with 5 LSBbit==0_0000 
	parameter Score1Y = 32;  // are needed if scaled4x
	parameter DigitStride = 4; // stride between digits in pixels
		
	// Some colors.
    parameter [2:0] black = 3'b000;
    parameter [2:0] blue  = 3'b001;
    parameter [2:0] green = 3'b010;
    parameter [2:0] white = 3'b111;
    parameter [2:0] pink = 3'b101;	
    parameter ink = pink;
    parameter background = black;

	parameter [9:0] VISIBLECOLS = 640;
	parameter [9:0] VISIBLEROWS = 480;
	
	reg [9:0] addr;
	reg [9:0] x,y;
	// Addr is built as {Number, y, x} : Numbers(4b), y(3b), x(3b)
	wire [9:0] numbaddr;
	wire endframe;
	reg [25:0] AuxStr1, AuxStr2;
	reg InScore1X, InScore1Y; // InScore2X, InScore2Y;
	
	// initialization of Numbers ROM
	initial
    begin
		if (FILE_NUMBERS) $readmemh(FILE_NUMBERS, Nums);   // Load logo on memory
    end
	
	reg [3:0] OnesDigit;
	assign endframe = (RGBStr_i[`XC]==VISIBLECOLS-1 && RGBStr_i[`YC]==VISIBLEROWS-1)? 1'b1 : 1'b0 ;
	assign numbaddr = {OnesDigit,y[power2Scale+2:power2Scale],x[power2Scale+2:power2Scale]};
    
// Task1: draw the number (2-stages pipeline)
	// Stage0: calculate img coordinates
	always @(posedge px_clk)
    begin
		AuxStr1[`HS]<=RGBStr_i[`HS]; AuxStr1[`VS]<=RGBStr_i[`VS];
		AuxStr1[`Active]<=RGBStr_i[`Active];
		AuxStr1[`RGB]<=RGBStr_i[`RGB];
		AuxStr1[`XC]<=RGBStr_i[`XC];
		AuxStr1[`YC]<=RGBStr_i[`YC];
		x<= RGBStr_i[`XC]-Score1X;
		y<= RGBStr_i[`XC]-Score1Y;
	end

	// Stage1: read pixel
	always @(posedge px_clk)
    begin
		// InScore1X <= (AuxStr1[`XC]==Score1X)? 1 : ((AuxStr1[`XC]==Score1X+width_number*upscale)? 0 : InScore1X);
		// InScore1Y <= (AuxStr1[`YC]==Score1Y)? 1 : ((AuxStr1[`YC]==Score1Y+height_number*upscale)? 0 : InScore1Y);
		InScore1X <= (x==0)? 1 : ((x==width_number*upscale)? 0 : InScore1X);
		InScore1Y <= (y==0)? 1 : ((y==height_number*upscale)? 0 : InScore1Y);

		AuxStr2[`HS]<=AuxStr1[`HS]; AuxStr2[`VS]<=AuxStr1[`VS];
		AuxStr2[`Active]<=AuxStr1[`Active];
		AuxStr2[`RGB]<=AuxStr1[`RGB];
		
		if((x>=0) && (x<width_number*upscale) && (y>= 0) && (y<height_number*upscale)) // we are in the digit
			addr<= numbaddr;

	end
	// Stage2: draw Numbers
	always @(posedge px_clk)
    begin
		RGBStr_o[`HS]<=AuxStr2[`HS]; RGBStr_o[`VS]<=AuxStr2[`VS];
		// RGBStr_o[`XC]<=AuxStr1[`XC]; RGBStr_o[`YC]<=AuxStr1[`YC];
		// RGBStr_o[`Active]<=AuxStr1[`Active];
		
		RGBStr_o[`XC]<=0; RGBStr_o[`YC]<=0;
		RGBStr_o[`Active]<=1;


		//if(InTensDigit || InOnesDigit)
		if(InScore1X && InScore1Y)
			RGBStr_o[`RGB]<= Nums[addr]? ink: AuxStr2[`RGB]; 
		else
			RGBStr_o[`RGB]<=AuxStr2[`RGB];
	end

// Task2: update score during Vblanking time
	always @(posedge px_clk)
    begin
		if (endframe)
		begin
			OnesDigit <= score[3:0]; //Ones; 
			//TensDigit <= score[7:4]; //Tens;
		end		
    end
	
	
endmodule
