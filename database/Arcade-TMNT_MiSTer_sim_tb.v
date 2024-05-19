// This program was cloned from: https://github.com/furrtek/Arcade-TMNT_MiSTer
// License: GNU General Public License v2.0

`timescale 1 ns / 1 ns

module tb(
);

reg clk;
reg reset;
wire [5:0] video_r;
wire [5:0] video_g;
wire [5:0] video_b;

reg [7:0] dipswitch1;
reg [7:0] dipswitch2;
reg [3:0] dipswitch3;
wire [1:0] coin_counter;

reg [3:0] P_up;
reg [3:0] P_down;
reg [3:0] P_left;
reg [3:0] P_right;
reg [3:0] P_jump;
reg [3:0] P_attack1;
reg [3:0] P_attack2;
reg [3:0] P_attack3;
reg [3:0] P_start;
reg [3:0] P_coin;
reg [3:0] service;

top DUT(
	.reset(reset),
	.clk_main(clk),

	.P_up(P_up),
	.P_down(P_down),
	.P_left(P_left),
	.P_right(P_right),
	.P_jump(P_jump),
	.P_attack1(P_attack1),
	.P_attack2(P_attack2),
	.P_attack3(P_attack3),
	.P_start(P_start),
	.P_coin(P_coin),
	
	.service(service),
	
	.coin_counter(coin_counter),
	
	.video_r(video_r),
	.video_g(video_g),
	.video_b(video_b),
	.video_sync(video_sync),
	
	.dipswitch1(dipswitch1),
	.dipswitch2(dipswitch2),
	.dipswitch3(dipswitch3)
);

always @(*)
	#21 clk <= ~clk;	// 23.8MHz ~24MHz

integer f_video;
reg record_pixels;
reg prev_V6M, prev_NHBK;

reg [3:0] d_init;
integer f_init;

initial begin
	f_video = $fopen("C:/Users/furrtek/Documents/Arcade-TMNT_MiSTer/sim/log_video.txt", "w");
	
	//record_pixels <= 1'b0;
	record_pixels <= 1'b1;
	prev_V6M <= 1'b0;
	prev_NHBK <= 1'b0;
	
	clk <= 1'b0;
	reset <= 1'b1;
	dipswitch1 <= 8'b11111100;
	/*	Correct order ?
	xxxxCCCC x:unused
	CCCC: Coin/play setting
	1 coin = 4 play
	*/
	dipswitch2 <= 8'b01111100;
	/*	Correct order ?
	SDDxxxLL x:unused
	LL: Player lives 00:5
	DD: Difficulty 11:Easy
	S: Attract sound 0:On
	xxx: See mame tmnt.cpp, should be kept OFF
	*/
	dipswitch3 <= 4'b1111;
	/*	Correct order ?
	xMxF x:unused
	F: Display flip
	M: Test mode
	xx: See mame tmnt.cpp, should be kept OFF
	*/
	P_up <= 4'b1111;
	P_down <= 4'b1111;
	P_left <= 4'b1111;
	P_right <= 4'b1111;
	P_jump <= 4'b1111;
	P_attack1 <= 4'b1111;
	P_attack2 <= 4'b1111;
	P_attack3 <= 4'b1111;
	P_start <= 4'b1111;
	P_coin <= 4'b1111;
	service <= 4'b1111;
	
	#100
	reset <= 1'b0;
	
	#2
	// Preset k052109 registers 1D80 and 1F00 with values from MAME savestate
	f_init = $fopen("C:/Users/furrtek/Documents/Arcade-TMNT_MiSTer/sim/tools/vram_bg_banks.bin", "rb");
	$fread(d_init, f_init);
	DUT.PLANES.k052109_1.REG1D80[3:0] <= d_init;
	$fread(d_init, f_init);
	DUT.PLANES.k052109_1.REG1D80[7:4] <= d_init;
	$fread(d_init, f_init);
	DUT.PLANES.k052109_1.REG1F00[3:0] <= d_init;
	$fread(d_init, f_init);
	DUT.PLANES.k052109_1.REG1F00[7:4] <= d_init;
	$fclose(f_init);
	
	//#50000
	//$stop();
end

always @(posedge clk) begin
	if (!DUT.HVOT) begin
		if (record_pixels) begin
			$fwrite(f_video, "V ");
			$fclose(f_video);
			$display("TB: Done");
			#1000
			$stop;
		end
	end
	
	if (DUT.PLANES.NHBK & ~prev_NHBK) begin
		if (record_pixels) begin
			$fwrite(f_video, "L ");
			$display("TB: Line !");
			
			/*if (DUT.PLANES.k052109_1.ROW == 8'd10) begin
				$fclose(f_video);
				$display("TB: Done");
				$stop;
			end*/
		end
	end
	
	if (DUT.V6M & ~prev_V6M) begin
		if (record_pixels) begin
			$fwrite(f_video, "%05X ", {video_r, video_g, video_b});
		end
	end
	
	// Ignore first "frame"
	//if (DUT.PLANES.k052109_1.ROW == 8'hFF)
	//	record_pixels <= 1'b1;
	
	prev_V6M <= DUT.V6M;
	prev_NHBK <= DUT.PLANES.NHBK;
end

endmodule
