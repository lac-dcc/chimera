// This program was cloned from: https://github.com/zhanghai/archexp
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module Terminal (

		input clock,

		input isVgaActive,
		input [9:0] vgaX,
		input [8:0] vgaY,
		output [7:0] vgaColor,

		input [11:0] textAddress,
		output [7:0] textReadData,
		input shouldWriteText,
		input [7:0] textWriteData
	);

	localparam COLOR_BLACK = 8'b000_000_00;
	localparam COLOR_RED = 8'b111_000_00;
	localparam COLOR_WHITE = 8'b111_111_11;

	// 640x480, 80x30
	// Make synthesizer happy so that it won't mess up.
	//reg [15:0] text [0:2399];
	reg [15:0] text [0:4095];

	wire [11:0] textIndex = vgaX / 8 + (vgaY / 16) * 80;
	wire [15:0] textData = text[textIndex];
	wire [7:0] fontIndex = textData[7:0];
	wire [2:0] fontX = vgaX % 8;
	wire [3:0] fontY = vgaY % 16;
	wire [11:0] fontAddress = fontIndex * 16 + fontY;
	wire [7:0] fontData;
	Font font (
		.a(fontAddress[11:0]),
		.spo(fontData[7:0])
	);
	wire hasPoint = fontData[8 - fontX];
	wire [7:0] textColor = textData[15:8];
	assign vgaColor = isVgaActive ? (hasPoint ? textColor : COLOR_BLACK) : 8'b0;

	always @(posedge clock) begin
		if (shouldWriteText) begin
			// HACK FOR LOVE!
			text[textAddress] <= {textWriteData == "" ? COLOR_RED : COLOR_WHITE, textWriteData};
		end
	end
	assign textReadData = text[textAddress][7:0];
endmodule
