// This program was cloned from: https://github.com/habibagamal/SoC_Automation
// License: GNU General Public License v2.0

/*******************************************************************
 * Module: tmr_pwm.v
 * Project: Raptor
 * Author: mshalan
 * Description: The file contains:
 *				(1) A simple 32-bit timer with a prescalar
 *				(2) A simple 32-bit PWM controller
 *				(3)	A simple 32-bit WD Timer
 **********************************************************************/
/*
	A simple 32-bit timer
	TMR : 32-bit counter
	PRE: clock prescalar (tmer_clk = clk / (PRE+1))
	TMRCMP: Timer CMP register
	TMROV: Timer overflow (TMR>=TMRCMP)
	TMROVCLR: Control signal to clear the TMROV flag
*/

module TIMER32 (
		input wire clk,
		input wire rst,
		output reg [31:0] TMR,
		input wire [31:0] PRE,
		input wire [31:0] TMRCMP,
		output reg TMROV,
		input wire TMROVCLR,
		input wire TMREN
	);

	reg [31:0] 	clkdiv;
	wire 		timer_clk = (clkdiv==PRE) ;
	wire 		tmrov = (TMR == TMRCMP);

	// Prescalar
	always @(posedge clk or posedge rst)
	begin
		if(rst)
			clkdiv <= 32'd0;
		else if(timer_clk)
			clkdiv <= 32'd0;
		else if(TMREN)
			clkdiv <= clkdiv + 32'd1;
	end

	// Timer
	always @(posedge clk or posedge rst)
	begin
		if(rst)
			TMR <= 32'd0;
		else if(tmrov)
			TMR <= 32'd0;
		else if(timer_clk)
			TMR <= TMR + 32'd1;
	end

	always @(posedge clk or posedge rst)
	begin
		if(rst)
			TMROV <= 1'd0;
		else if(TMROVCLR)
			TMROV <= 1'd0;
		else if(tmrov)
			TMROV <= 1'd1;
	end

endmodule
