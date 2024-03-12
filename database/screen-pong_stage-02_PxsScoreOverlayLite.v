//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date: 27/11/2017 
// Module Name: PxsScoreOverlayLite
// Description: draw 2 scores of 1 digit
//				optimized version for minimum PLB consumption
//
//					
//
// Revision: 
// Revision 0.01 - File Created
//
// Additional Comments: based on PixelStream lib from Celoxica Ltd.
// Ocupa muchos PLBs aprox. 112, incluso cuando reducimos los Str a Vs, Hs y RGB
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
//
//////////////////////////////////////////////////////////////////////////////////


module PxsScoreOverlayLite(
                input wire        px_clk,  
				input wire [7:0]  score,
                input wire [25:0] RGBStr_i,       
                output reg [25:0] RGBStr_o        
               );

// alias 
`define Active 0:0
`define VS 1:1
`define HS 2:2
`define YC 12:3
`define XC 22:13
`define RGB 25:23


    //logo definition
	parameter FILE_NUMBERS = "numbers2b.list";

   
	// Numbers size. Power of two eases the address generation
    parameter width_number = 8;  
    parameter height_number = 8; 
	
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
	wire endframe;
	reg [25:0] AuxStr1;
	reg InScore1X, InScore1Y, InScore2X, InScore2Y;
	reg pixel;
	
	// initialization of Numbers ROM
	initial
    begin
		if (FILE_NUMBERS) $readmemh(FILE_NUMBERS, Nums);   // Load logo on memory
    end
	
	reg [3:0] TensDigit, OnesDigit;
	assign endframe = (RGBStr_i[`XC]==VISIBLECOLS-1 && RGBStr_i[`YC]==VISIBLEROWS-1)? 1'b1 : 1'b0 ;
    
// Task1: draw the number (2-stages pipeline)
	// Stage1: calculate img coordinates
	always @(posedge px_clk)
    begin
		AuxStr1[`HS]<=RGBStr_i[`HS]; AuxStr1[`VS]<=RGBStr_i[`VS];
		AuxStr1[`Active]<=RGBStr_i[`Active];
		AuxStr1[`RGB]<=RGBStr_i[`RGB];
		// XC and YC are not preserved for saving PLBs
		// scale1x
		// InDigitX <= (RGBStr_i[`XC]==128)? 1 : ((RGBStr_i[`XC]==136)? 0 : InDigitX);
		// InDigitY <= (RGBStr_i[`YC]==8)? 1 : ((RGBStr_i[`YC]==16)? 0 : InDigitY);
		// addr <= {OnesDigit, RGBStr_i[5:3], RGBStr_i[15:13]};
		// scale4x
		InScore1X <= (RGBStr_i[`XC]==Score1X)? 1 : ((RGBStr_i[`XC]==160)? 0 : InScore1X);
		InScore1Y <= (RGBStr_i[`YC]==Score1Y)? 1 : ((RGBStr_i[`YC]==64)? 0 : InScore1Y);
		
		addr <= {OnesDigit, RGBStr_i[7:5], RGBStr_i[17:15]};

	end
	// Stage2: draw Numbers
	always @(posedge px_clk)
    begin
		RGBStr_o[`HS]<=AuxStr1[`HS]; RGBStr_o[`VS]<=AuxStr1[`VS];
		// RGBStr_o[`XC]<=AuxStr1[`XC]; RGBStr_o[`YC]<=AuxStr1[`YC];
		// RGBStr_o[`Active]<=AuxStr1[`Active];
		
		RGBStr_o[`XC]<=0; RGBStr_o[`YC]<=0;
		RGBStr_o[`Active]<=1;


		//if(InTensDigit || InOnesDigit)
		if(InScore1X && InScore1Y)
			RGBStr_o[`RGB]<= Nums[addr]? ink: AuxStr1[`RGB]; //AuxStr2[`RGB]; //background;
		else
			RGBStr_o[`RGB]<=AuxStr1[`RGB];
	end

// Task2: update score during Vblanking time
	always @(posedge px_clk)
    begin
		if (endframe)
		begin
			OnesDigit <= score[3:0]; //Ones; 
			TensDigit <= score[7:4]; //Tens;
		end		
    end
	
	
endmodule
