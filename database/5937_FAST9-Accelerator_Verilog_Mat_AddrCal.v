// This program was cloned from: https://github.com/ISKU/FAST9-Accelerator
// License: MIT License

`define COLUMNS 8'd180
`define ROWS 8'd120

module Mat_AddrCal (refAddr, adjNumber, FBAddr);
	input [14:0] refAddr; // 기준점
	input [2:0] adjNumber; // 인접한 8개의 점 번호
	output [14:0] FBAddr; // Frame Buffer의 Input 주소
	
	assign FBAddr =
		(adjNumber == 4'd0) ? refAddr - `COLUMNS : // 1
		(adjNumber == 4'd1) ? refAddr - `COLUMNS + 1 : // 2
		(adjNumber == 4'd2) ? refAddr + 1 : // 3
		(adjNumber == 4'd3) ? refAddr + `COLUMNS + 1 : // 4
		(adjNumber == 4'd4) ? refAddr + `COLUMNS : // 5
		(adjNumber == 4'd5) ? refAddr + `COLUMNS - 1 : // 6
		(adjNumber == 4'd6) ? refAddr - 1 : // 7
		(adjNumber == 4'd7) ? refAddr - `COLUMNS - 1 : 15'bx; // 8
endmodule 