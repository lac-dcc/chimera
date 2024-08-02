// This program was cloned from: https://github.com/ISKU/Autonomous-Drone-Design
// License: GNU General Public License v3.0

`define COLUMNS 8'd180
`define ROWS 8'd120

module FD_AddrCal (refAddr, adjNumber, sramAddr, sramRead);
	input [14:0] refAddr; // 기준점
	input [4:0] adjNumber; // 인접한 16개의 점
	output [14:0] sramAddr; // SRAM의 Input 주소
	output sramRead; // SRAM 읽기 신호
	
	assign sramRead =
		(adjNumber == 5'd0) ? 1'b0 : 1'b1;
	
	assign sramAddr =
		(adjNumber == 5'd17) ? refAddr : // 기준점 
		(adjNumber == 5'd1) ? refAddr - (3 * `COLUMNS) : // 1
		(adjNumber == 5'd2) ? refAddr - (3 * `COLUMNS) + 1 : // 2
		(adjNumber == 5'd3) ? refAddr - (2 * `COLUMNS) + 2 : // 3
		(adjNumber == 5'd4) ? refAddr - (1 * `COLUMNS) + 3 : // 4
		(adjNumber == 5'd5) ? refAddr + 3 : // 5
		(adjNumber == 5'd6) ? refAddr + (1 * `COLUMNS) + 3 : // 6
		(adjNumber == 5'd7) ? refAddr + (2 * `COLUMNS) + 2 : // 7
		(adjNumber == 5'd8) ? refAddr + (3 * `COLUMNS) + 1 : // 8
		(adjNumber == 5'd9) ? refAddr + (3 * `COLUMNS) : // 9
		(adjNumber == 5'd10) ? refAddr + (3 * `COLUMNS) - 1 : // 10
		(adjNumber == 5'd11) ? refAddr + (2 * `COLUMNS) - 2 : // 11
		(adjNumber == 5'd12) ? refAddr + (1 * `COLUMNS) - 3 : // 12
		(adjNumber == 5'd13) ? refAddr - 3 : // 13
		(adjNumber == 5'd14) ? refAddr - (1 * `COLUMNS) - 3 : // 14
		(adjNumber == 5'd15) ? refAddr - (2 * `COLUMNS) - 2 : // 15
		(adjNumber == 5'd16) ? refAddr - (3 * `COLUMNS) - 1 : 15'bx; // 16
endmodule 