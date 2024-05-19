// This program was cloned from: https://github.com/ISKU/Autonomous-Drone-Design
// License: GNU General Public License v3.0

`define SIMILAR 2'b00
`define DARK 2'b01
`define BRIGHT 2'b10

module FS_Datapath (isCorner, compare, refPixel, adjPixel, thres, wren, scoreValue);
	input isCorner; // 코너 확인
	input [31:0] compare; // DARK, BRIGHT, SIMILAR 값
	input [7:0] refPixel; // 기준점 데이터
	input [127:0] adjPixel; // 인접한 16개의 점 데이터
	input [7:0] thres; // 임계값
	output wren; // 쓰기 신호
	output [7:0] scoreValue; // 코너 점수 값
	
	wire [11:0] sBright; // Bright Set 점수
	wire [11:0] sDark; // Dark Set 점수

	// Calculate dark set
	assign sDark =
		((compare[31:30] == `DARK) ? 
			(((refPixel - adjPixel[127:120]) > 255) ? 
				(adjPixel[127:120] - refPixel - thres) : (refPixel - adjPixel[127:120] - thres)) : 12'b0) +
		((compare[29:28] == `DARK) ? 
			(((refPixel - adjPixel[119:112]) > 255) ? 
				(adjPixel[119:112] - refPixel - thres) : (refPixel - adjPixel[119:112] - thres)) : 12'b0) +
		((compare[27:26] == `DARK) ? 
			(((refPixel - adjPixel[111:104]) > 255) ? 
				(adjPixel[111:104] - refPixel - thres) : (refPixel - adjPixel[111:104] - thres)) : 12'b0) +
		((compare[25:24] == `DARK) ? 
			(((refPixel - adjPixel[103:96]) > 255) ? 
				(adjPixel[103:96] - refPixel - thres) : (refPixel - adjPixel[103:96] - thres)) : 12'b0) +
		((compare[23:22] == `DARK) ? 
			(((refPixel - adjPixel[95:88]) > 255) ? 
				(adjPixel[95:88] - refPixel - thres) : (refPixel - adjPixel[95:88] - thres)) : 12'b0) +
		((compare[21:20] == `DARK) ? 
			(((refPixel - adjPixel[87:80]) > 255) ? 
				(adjPixel[87:80] - refPixel - thres) : (refPixel - adjPixel[87:80] - thres)) : 12'b0) +
		((compare[19:18] == `DARK) ? 
			(((refPixel - adjPixel[79:72]) > 255) ? 
				(adjPixel[79:72] - refPixel - thres) : (refPixel - adjPixel[79:72] - thres)) : 12'b0) +
		((compare[17:16] == `DARK) ? 
			(((refPixel - adjPixel[71:64]) > 255) ? 
				(adjPixel[71:64] - refPixel - thres) : (refPixel - adjPixel[71:64] - thres)) : 12'b0) +
		((compare[15:14] == `DARK) ? 
			(((refPixel - adjPixel[63:56]) > 255) ? 
				(adjPixel[63:56] - refPixel - thres) : (refPixel - adjPixel[63:56] - thres)) : 12'b0) +
		((compare[13:12] == `DARK) ? 
			(((refPixel - adjPixel[55:48]) > 255) ? 
				(adjPixel[55:48] - refPixel - thres) : (refPixel - adjPixel[55:48] - thres)) : 12'b0) +
		((compare[11:10] == `DARK) ? 
			(((refPixel - adjPixel[47:40]) > 255) ? 
				(adjPixel[47:40] - refPixel - thres) : (refPixel - adjPixel[47:40] - thres)) : 12'b0) +
		((compare[9:8] == `DARK) ? 
			(((refPixel - adjPixel[39:32]) > 255) ? 
				(adjPixel[39:32] - refPixel - thres) : (refPixel - adjPixel[39:32] - thres)) : 12'b0) +
		((compare[7:6] == `DARK) ?
			(((refPixel - adjPixel[31:24]) > 255) ? 
				(adjPixel[31:24] - refPixel - thres) : (refPixel - adjPixel[31:24] - thres)) : 12'b0) +
		((compare[5:4] == `DARK) ? 
			(((refPixel - adjPixel[23:16]) > 255) ? 
				(adjPixel[23:16] - refPixel - thres) : (refPixel - adjPixel[23:16] - thres)) : 12'b0) +
		((compare[3:2] == `DARK) ? 
			(((refPixel - adjPixel[15:8]) > 255) ? 
				(adjPixel[15:8] - refPixel - thres) : (refPixel - adjPixel[15:8] - thres)) : 12'b0) +
		((compare[1:0] == `DARK) ? 
			(((refPixel - adjPixel[7:0]) > 255) ? 
				(adjPixel[7:0] - refPixel - thres) : (refPixel - adjPixel[7:0] - thres)) : 12'b0);				
		
	// Calculate bright set
	assign sBright =
		((compare[31:30] == `BRIGHT) ? 
			(((adjPixel[127:120] - refPixel) > 255) ? 
				(refPixel - adjPixel[127:120] - thres) : (adjPixel[127:120] - refPixel - thres)) : 12'b0) +
		((compare[29:28] == `BRIGHT) ? 
			(((adjPixel[119:112] - refPixel) > 255) ? 
				(refPixel - adjPixel[119:112] - thres) : (adjPixel[119:112] - refPixel - thres)) : 12'b0) +
		((compare[27:26] == `BRIGHT) ? 
			(((adjPixel[111:104] - refPixel) > 255) ? 
				(refPixel - adjPixel[111:104] - thres) : (adjPixel[111:104] - refPixel - thres)) : 12'b0) +
		((compare[25:24] == `BRIGHT) ? 
			(((adjPixel[103:96] - refPixel) > 255) ? 
				(refPixel - adjPixel[103:96] - thres) : (adjPixel[103:96] - refPixel - thres)) : 12'b0) +
		((compare[23:22] == `BRIGHT) ? 
			(((adjPixel[95:88] - refPixel) > 255) ? 
				(refPixel - adjPixel[95:88] - thres) : (adjPixel[95:88] - refPixel - thres)) : 12'b0) +
		((compare[21:20] == `BRIGHT) ? 
			(((adjPixel[87:80] - refPixel) > 255) ? 
				(refPixel - adjPixel[87:80] - thres) : (adjPixel[87:80] - refPixel - thres)) : 12'b0) +
		((compare[19:18] == `BRIGHT) ? 
			(((adjPixel[79:72] - refPixel) > 255) ? 
				(refPixel - adjPixel[79:72] - thres) : (adjPixel[79:72] - refPixel - thres)) : 12'b0) +
		((compare[17:16] == `BRIGHT) ? 
			(((adjPixel[71:64] - refPixel) > 255) ? 
				(refPixel - adjPixel[71:64] - thres) : (adjPixel[71:64] - refPixel - thres)) : 12'b0) +
		((compare[15:14] == `BRIGHT) ? 
			(((adjPixel[63:56] - refPixel) > 255) ? 
				(refPixel - adjPixel[63:56] - thres) : (adjPixel[63:56] - refPixel - thres)) : 12'b0) +
		((compare[13:12] == `BRIGHT) ? 
			(((adjPixel[55:48] - refPixel) > 255) ? 
				(refPixel - adjPixel[55:48] - thres) : (adjPixel[55:48] - refPixel - thres)) : 12'b0) + 
		((compare[11:10] == `BRIGHT) ? 
			(((adjPixel[47:40] - refPixel) > 255) ? 
				(refPixel - adjPixel[47:40] - thres) : (adjPixel[47:40] - refPixel - thres)) : 12'b0) +
		((compare[9:8] == `BRIGHT) ? 
			(((adjPixel[39:32] - refPixel) > 255) ? 
				(refPixel - adjPixel[39:32] - thres) : (adjPixel[39:32] - refPixel - thres)) : 12'b0) +
		((compare[7:6] == `BRIGHT) ? 
			(((adjPixel[31:24] - refPixel) > 255) ? 
				(refPixel - adjPixel[31:24] - thres) : (adjPixel[31:24] - refPixel - thres)) : 12'b0) +
		((compare[5:4] == `BRIGHT) ? 
			(((adjPixel[23:16] - refPixel) > 255) ? 
				(refPixel - adjPixel[23:16] - thres) : (adjPixel[23:16] - refPixel - thres)) : 12'b0) +
		((compare[3:2] == `BRIGHT) ? 
			(((adjPixel[15:8] - refPixel) > 255) ? 
				(refPixel - adjPixel[15:8] - thres) : (adjPixel[15:8] - refPixel - thres)) : 12'b0) +
		((compare[1:0] == `BRIGHT) ? 
			(((adjPixel[7:0] - refPixel) > 255) ? 
				(refPixel - adjPixel[7:0] - thres) : (adjPixel[7:0] - refPixel - thres)) : 12'b0);

	assign scoreValue = (sBright >= sDark) ? sBright : sDark; // Dark, Bright Set 중 큰 점수가 최종 스코어로 결정
	assign wren = isCorner; // 코너인 경우에만 스코어 SRAM에 저장하기 위해 쓰기 신호를 셋.
endmodule 