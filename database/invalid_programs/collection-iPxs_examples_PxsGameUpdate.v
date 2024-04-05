//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date: 03/11/2017 
// Module Name: PxsGameUpdate
// Description: 
//
// Dependencies: Update the game table 
//
// Revision: 
// Revision 0.01 - File Created
//
// Additional Comments: 
//
//-----------------------------------------------------------------------------
//-- GPL license
//-----------------------------------------------------------------------------
`include "Pxs.vh"

module PxsGameUpdate (
				input wire        	px_clk,
				input wire			rst,
				input wire [25:0]	RGBStr_i,				
				output reg			write_en,
				output reg [10:0] 	TabAdd,
				output reg [3:0] 	TabDat
			
               );
  
// alias 
`define Active 0:0
`define VS 1:1
`define HS 2:2
`define YC 12:3
`define XC 22:13
`define RGB 25:23

parameter VISIBLECOLS=640;
parameter VISIBLEROWS=480;

	// one-hot state codes
	parameter 	WAIT		= 6'b000001, 
				RMV_PAC		= 6'b000010, 
				RMV_GOHST	= 6'b000100, 
				UPDT_PACMAN	= 6'b001000, 
				UPDT_GOHST	= 6'b010000, 
				WAIT_0		= 6'b100000;

	reg  [5:0]state, next_state;

	reg [4:0] contframe;
	reg [10:0] pospac;  // Pacman position
	reg close;
	
	initial
    begin
		contframe <= 0;
		pospac<=600;
		state <= WAIT;
		write_en<=0;
		close<=0;
    end
	
	assign endframe = (RGBStr_i[`XC]==VISIBLECOLS-1 && RGBStr_i[`YC]==VISIBLEROWS-1)? 1'b1 : 1'b0 ;
	
	// 25-frames counter 
	always @(posedge px_clk)  
	begin
		if (rst) 
			contframe<=0;
		else
			if (endframe==1) 
				contframe <= (contframe == 25)? 0 : contframe+1;
	end
	
	// Update location and pacman state only once every 25 frames 
	// (for different refresh frequencies another value could be preferable)
	always @(posedge contframe[4])  
	begin
		pospac<=pospac-1;
		close <= ~close;
	end

		
	/* explicit FSM implementation */
	always @(posedge px_clk)
	if (rst) state = WAIT; else state = next_state;
	
	always @(*) begin 
		next_state = state;
		case (state)
			WAIT: 			if (contframe==25) next_state = RMV_PAC;
							else next_state = WAIT;
			RMV_PAC: 		next_state = RMV_GOHST;
			RMV_GOHST: 		next_state = UPDT_PACMAN;
			UPDT_PACMAN: 	next_state = UPDT_GOHST;
			UPDT_GOHST: 	next_state = WAIT_0;
			WAIT_0:			if(contframe==0) next_state = WAIT;
							else next_state<= WAIT_0;
		endcase
	end
	
	always @(state) begin
		case (state)
			WAIT: 			begin 
							write_en = 0; 
							end
			
			RMV_PAC: 		begin
							write_en = 1;
							TabAdd = pospac; 
							TabDat = 0;
							end
							
			RMV_GOHST: 		begin
							write_en = 1;
							TabAdd = pospac-2; 
							TabDat = 0;
							end
														
			UPDT_PACMAN: 	begin
							write_en = 1;
							TabAdd = pospac-1;
							if (close==0)
								TabDat = 3; // open
							else
								TabDat = 2; // close	
							end
							
			UPDT_GOHST: 	begin
							write_en = 1;
							TabAdd = pospac-3; 
							TabDat = 1;
							end	

			WAIT_0:			begin write_en = 0; end
			
			default:		begin 
								write_en = 0;
							end
		endcase
	end
	
	
	
	/* implicit FSM, not supported by yosys synthesis */
	
	// execute only once whenever enter into Vblanking area
	// always @(posedge px_clk)  begin: loop
	// if (endframe) begin 
		// @(posedge px_clk) begin  	// Cycle0: wait the end of frame
			// contframe<=contframe+1;
		// end
		// @(posedge px_clk) begin 	// Cycle 1 : erase pacman
			// if (contframe == 3'b111) begin
				// write_en <= 1;
				// TabAdd <= pospac; 
				// TabDat <= 0;
				// close <= ~close;
			// end
			// else disable loop;
		// end

		// @(posedge px_clk) begin 	// Cycle 2: erase gohst
			// TabAdd <= pospac-2; 
			// TabDat <= 0;
		// end
		// @(posedge px_clk) begin 	// Cycle 3: update pacman
			// if (close==0)
				// TabDat <= 1; // open
			// else
				// TabDat <= 2; // close		
		// end
		// @(posedge px_clk) begin 	// Cycle 4: update gohst and pacman location
			// TabAdd <= pospac; 
			// TabDat <= 3;
			// pospac <= pospac-1;
		// end
		// @(posedge px_clk) write_en<=0; 	// Cycle 5: disable writing

	// end
	// else disable loop;
	// end
endmodule		
	




		
			