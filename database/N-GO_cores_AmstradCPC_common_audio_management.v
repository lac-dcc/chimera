// This program was cloned from: https://github.com/ManuFerHi/N-GO
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:04:00 04/01/2012 
// Design Name: 
// Module Name:    sigma_delta_dac 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

`define MSBI 8 // Most significant Bit of DAC input

//This is a Delta-Sigma Digital to Analog Converter
module dac (DACout, DACin, Clk, Reset);
	output DACout; // This is the average output that feeds low pass filter
	input [`MSBI:0] DACin; // DAC input (excess 2**MSBI)
	input Clk;
	input Reset;

	reg DACout; // for optimum performance, ensure that this ff is in IOB
	reg [`MSBI+2:0] DeltaAdder; // Output of Delta adder
	reg [`MSBI+2:0] SigmaAdder; // Output of Sigma adder
	reg [`MSBI+2:0] SigmaLatch = 1'b1 << (`MSBI+1); // Latches output of Sigma adder
	reg [`MSBI+2:0] DeltaB; // B input of Delta adder

	always @(SigmaLatch) DeltaB = {SigmaLatch[`MSBI+2], SigmaLatch[`MSBI+2]} << (`MSBI+1);
	always @(DACin or DeltaB) DeltaAdder = DACin + DeltaB;
	always @(DeltaAdder or SigmaLatch) SigmaAdder = DeltaAdder + SigmaLatch;
	always @(posedge Clk)
	begin
		if(Reset)
		begin
			SigmaLatch <= #1 1'b1 << (`MSBI+1);
			DACout <= #1 1'b0;
		end
		else
		begin
			SigmaLatch <= #1 SigmaAdder;
			DACout <= #1 SigmaLatch[`MSBI+2];
		end
	end
endmodule


module mixer (
  input wire clk,
  input wire rst_n,
  //--- SOUND SOURCES ---
  input wire mic,
  input wire ear,
  input wire [7:0] ay_cha,
  input wire [7:0] ay_chb,
  input wire [7:0] ay_chc,
  // --- OUTPUTs ---
  output wire audio_out_left,
  output wire audio_out_right
  );

  // Mixer for EAR and MIC
  reg [8:0] beeper;
  always @* begin
    beeper = 8'd0;
    case ({ear,mic})
      2'b00: beeper = 9'd0;
      2'b01: beeper = 9'd16;
      2'b10: beeper = 9'd32;
      2'b11: beeper = 9'd48;
    endcase
  end
  
  reg [8:0] mixleft = 9'h000;
  reg [8:0] mixright = 9'h000;
  reg state = 1'b0;
  // Se replica esta máquina de estados para el canal derecho.
  always @(posedge clk) begin
    state <= ~state;
    if (state == 1'b0) begin
      mixleft <= ay_cha + ay_chb;
      mixright <= ay_chc + ay_chb;
    end
    else begin
      mixleft <= beeper;
      mixright <= beeper;
    end
  end
       
   // DACs
	dac audio_dac_left (
		.DACout(audio_out_left),
		.DACin(mixleft),
		.Clk(clk),
		.Reset(!rst_n)
		);
   
	dac audio_dac_right (
		.DACout(audio_out_right),
		.DACin(mixright),
		.Clk(clk),
		.Reset(!rst_n)
		);
endmodule
   