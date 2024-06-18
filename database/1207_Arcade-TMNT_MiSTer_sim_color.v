// This program was cloned from: https://github.com/furrtek/Arcade-TMNT_MiSTer
// License: GNU General Public License v2.0

module TMNTColor(
	input V6M,
	input [12:1] AB,
	input [9:0] CD,
	input SHADOW,
	input NCBLK,
	input COLCS,
	input NLWR,
	input NREAD,
	input [7:0] CPU_DIN,
	output [7:0] CPU_DOUT,
	output [5:0] RED_OUT,
	output [5:0] GREEN_OUT,
	output [5:0] BLUE_OUT
);

	// Color data CD[9:0], NCBLK and SHADOW latched by V6M
	// Goes into mux for CPU palette RAM access, select by COLCS
	// Output of mux used as address for 2* 2kB palette RAM
	// Output of palette RAM also latched by V6M -> 5 bits + 1 common -> DACs
	// Also goes into 245's for CPU access (lower byte only)

	reg [12:0] C_REG;
	wire [10:0] CR;
	wire [7:0] RAM_DOUT_LOW;
	wire [7:0] RAM_DOUT_HIGH;
	reg [15:0] COL;
	wire [15:0] COL_OUT;
	wire [4:0] RED;
	wire [4:0] GREEN;
	wire [4:0] BLUE;
	wire [15:0] I;
	
	always @(posedge V6M)
		C_REG <= {C_REG[11], SHADOW, NCBLK, CD};
	
	assign {nCOE, CR} = COLCS ? {2'b00, C_REG[9:0]} : {NREAD, AB[12:2]};
	// nCOE useless ?

	assign I[7:0] = (~COLCS & AB[1] & NREAD) ? CPU_DIN : 8'bzzzzzzzz;
	assign I[15:8] = (~COLCS & ~AB[1] & NREAD) ? CPU_DIN : 8'bzzzzzzzz;
	
	assign CPU_DOUT = (~COLCS & ~NREAD) ? AB[1] ? RAM_DOUT_LOW : RAM_DOUT_HIGH : 8'bzzzzzzzz;
	
	// TMNT only uses half of palette RAM ?
	ram_sim #(8, 11, "C:/Users/furrtek/Documents/Arcade-TMNT_MiSTer/sim/tools/palettes_L.txt") RAM_PAL_HIGH(CR, AB[1] | COLCS | NLWR, 1'b0, I[15:8], RAM_DOUT_HIGH);
	ram_sim #(8, 11, "C:/Users/furrtek/Documents/Arcade-TMNT_MiSTer/sim/tools/palettes_U.txt") RAM_PAL_LOW(CR, ~AB[1] | COLCS | NLWR, 1'b0, I[7:0], RAM_DOUT_LOW);

	always @(posedge V6M)
		COL <= {C_REG[10], RAM_DOUT_HIGH[6:0], RAM_DOUT_LOW};
	
	// COL[15] = NCBLK delayed
	assign RED = COL[15] ? COL[4:0] : 5'd0;
	assign GREEN = COL[15] ? COL[9:5] : 5'd0;
	assign BLUE = COL[15] ? COL[14:10] : 5'd0;
	
	assign RED_OUT = C_REG[12] ? {RED, RED[0]} : {1'b0, RED};
	assign GREEN_OUT = C_REG[12] ? {GREEN, GREEN[0]} : {1'b0, GREEN};
	assign BLUE_OUT = C_REG[12] ? {BLUE, BLUE[0]} : {1'b0, BLUE};
	
endmodule
