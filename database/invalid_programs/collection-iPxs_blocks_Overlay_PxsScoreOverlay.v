//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date: 23/11/2017 
// Module Name: PxsScoreOverlay
// Description: draw 1 score of 2 digits
//				high PLB consumption: large comparators, 3 stages, binary2bcd conv.
//
// Revision: 
// Revision 0.01 - File Created
//
// Additional Comments: 
//
//
//-----------------------------------------------------------------------------
//-- GPL license
//-----------------------------------------------------------------------------
`include "Pxs.vh"

module PxsScoreOverlay(
                input wire        px_clk,  
				input wire [7:0]  score,
                input wire [25:0] RGBStr_i,       
                output reg [25:0] RGBStr_o        
               );


    //logo definition
	parameter FILE_NUMBERS = "numbers2b.list";

   
	// Numbers dimension. Power of two eases the address generation
    parameter width_number = 8;  
    parameter height_number = 8;
	
	//parameter widthx4 = width_number*4;  
    //parameter heightx4 = height_number*4;

	
	// numbers rom 10 numbers of 8*8bits => 10*8*4 words (2b/word)
	reg  [0:0] Nums [10*height_number*width_number-1:0];
	// addr(10b): 4b(10numbers) + 3b (8rows)+ 3b(8cols)
	// addr(9b): 4b(10numbers) + 3b (8rows)+ 2b(4cols) = {Number, y_img[2:0], x_img[2:1]} 
	// x_img[0] is used to select the bit 
	// For upscaling the numbers 4x, use the msb bits
	// addrx4= {Number, y_img[4:2], x_img[4:3]} and x_img[2] used to select the bit

	
	// Location of Digits: 1st digit (X_Score,Y_Score); 2nd digit (X_Score+4+8, Y_Score)
	parameter Sc1_TensX = 128; 
	parameter Sc1_TensY = 8;
	parameter DigitStride = 4;
	parameter Sc1_OnesX = Sc1_TensX+width_number+DigitStride; 
	//parameter Sc1_OnesY = Sc1_TensY;
	
	// Second player Score
	// parameter Sc2_TensX = 512; 
	// parameter Sc2_TensY = 8;
	// parameter Sc2_OnesX = Sc2_TensX+width_number+DigitStrid; 
	// parameter Sc2_OnesY = Sc2_TensY;


	
	// Some colors.
    parameter [2:0] black = 3'b000;
    parameter [2:0] blue  = 3'b001;
    parameter [2:0] green = 3'b010;
    parameter [2:0] white = 3'b111;
    parameter [2:0] pink = 3'b101;	
    parameter ink = white;
    parameter background = black;

	parameter [9:0] VISIBLECOLS = 640;
	parameter [9:0] VISIBLEROWS = 480;

	//auxiliar variables;
	wire [9:0] TensAddr, OnesAddr; 
	// Addr is built as {Number, y, x} : Numbers(4b), y(3b), x(3b)
	
	
	reg [9:0] addr;
	wire endframe;
	reg [9:0] x_imgTens, x_imgOnes, y_imgTens;    // image coord
	reg [25:0] AuxStr1, AuxStr2;
	reg InTensDigit, InOnesDigit;
	reg pixel;
	
	// initialization of Numbers ROM
	initial
    begin
		if (FILE_NUMBERS) $readmemh(FILE_NUMBERS, Nums);   // Load logo on memory
    end

	// conversion from binary to BCD
	integer i;
	reg [3:0] Tens, TensDigit;
	reg [3:0] Ones, OnesDigit;
	always @(score)
	begin
		Tens = 4'd0;
		Ones = 4'd0;
		for (i=7; i>=0; i=i-1)
		begin 
			// add 3 to columns >=5
			if (Tens>4)
				Tens=Tens+4'd3;
			if (Ones>4)
				Ones=Ones+4'd3;
			// shift left one
			Tens = Tens <<1;
			Tens[0]=Ones[3];
			Ones = Ones <<1;
			Ones[0] = score[i];
		end
	end

	
	assign endframe = (RGBStr_i[`XC]==VISIBLECOLS-1 && RGBStr_i[`YC]==VISIBLEROWS-1)? 1'b1 : 1'b0 ;

	// if 1bit word memory: assign Faddr=y_img*width_number+x_img;
	//assign Faddr=y_img*width_number+x_img;
	assign TensAddr = {TensDigit,y_imgTens[2:0],x_imgTens[2:0]};
	//assign Saddr=y_img*width_number+x_img-12;
	assign OnesAddr = {OnesDigit,y_imgTens[2:0],x_imgOnes[2:0]};
    
// Task1: draw the number (3-stages pipeline)
	// Stage0: calculate img coordinates
	always @(posedge px_clk)
    begin
		x_imgTens <= RGBStr_i[`XC]-Sc1_TensX; 
		x_imgOnes <= RGBStr_i[`XC]-Sc1_OnesX;  		
		y_imgTens <= RGBStr_i[`YC]-Sc1_TensY; // y_imgOnes=y_imgTens
		AuxStr1[`HS]<=RGBStr_i[`HS]; AuxStr1[`VS]<=RGBStr_i[`VS];
		AuxStr1[`XC]<=RGBStr_i[`XC]; AuxStr1[`YC]<=RGBStr_i[`YC];
		AuxStr1[`Active]<=RGBStr_i[`Active];
		AuxStr1[`RGB]<=RGBStr_i[`RGB];
	end
	// Stage1: read pixel
	always @(posedge px_clk)
    begin
		InTensDigit<= (x_imgTens >= 0 && x_imgTens < width_number) && (y_imgTens >= 0 && y_imgTens < height_number);
		InOnesDigit<= (x_imgOnes >= 0 && x_imgOnes < width_number) && (y_imgTens >= 0 && y_imgTens < height_number);
		AuxStr2[`HS]<=AuxStr1[`HS]; AuxStr2[`VS]<=AuxStr1[`VS];
		AuxStr2[`XC]<=AuxStr1[`XC]; AuxStr2[`YC]<=AuxStr1[`YC];
		AuxStr2[`Active]<=AuxStr1[`Active];
		AuxStr2[`RGB]<=AuxStr1[`RGB];
		// para que infiera 1BRAM
		if ((x_imgTens>= 0) && (x_imgTens < width_number) && (y_imgTens>= 0) && (y_imgTens < height_number)) // we are in the 1st digit
			addr <= TensAddr; //[x_img[0]];
		else
			if ((x_imgOnes >= 0 && x_imgOnes < width_number) && (y_imgTens >= 0 && y_imgTens < height_number)) // we are in the 2nd digit
				addr <= OnesAddr;//[x_img[0]];
				//TODO falta por ajustar este número
			// else	
				// pixel <= 1'b0;
	end		
	// Stage2: draw Numbers
	always @(posedge px_clk)
    begin
		RGBStr_o[`HS]<=AuxStr2[`HS]; RGBStr_o[`VS]<=AuxStr2[`VS];
		RGBStr_o[`XC]<=AuxStr2[`XC]; RGBStr_o[`YC]<=AuxStr2[`YC];
		RGBStr_o[`Active]<=AuxStr2[`Active];

		if(InTensDigit || InOnesDigit)
			RGBStr_o[`RGB]<= Nums[addr]? ink: AuxStr2[`RGB]; //AuxStr2[`RGB]; //background;
		else
			RGBStr_o[`RGB]<=AuxStr2[`RGB];
	end

// Task2: update score during Vblanking time
	always @(posedge px_clk)
    begin
		if (endframe)
		begin
			OnesDigit <= Ones; 
			TensDigit <= Tens;
		end		
    end
	
	
endmodule
