// This program was cloned from: https://github.com/ISKU/Autonomous-Drone-Design
// License: GNU General Public License v3.0

`define INIT 4'd15
`define S0 4'd0
`define S1 4'd1
`define S2 4'd2
`define S3 4'd3
`define S4 4'd4
`define S5 4'd5
`define S6 4'd6
`define S7 4'd7
`define S8 4'd8
`define S9 4'd9
`define S10 4'd10

module Mat_Controller (clock, nReset, refAddr, adjNumber, regAddr, matReaden);
	input clock;
	input nReset;
	input [14:0] refAddr; // 기준점
	output [2:0] adjNumber; // 인접한 점 번호
	output [2:0] regAddr; // 레지스터 주소
	output matReaden;
	
	reg [2:0] adjNumber; // 8개의 점 Index
	reg [2:0] regAddr; // 레지스터 주소
	reg matReaden; // Datapath가 수행될 수 있도록 하는 enable 신호
	
	reg [3:0] curState, nextState; // 상태 변화
	
	// Clock이 상승할 때마다 현재 상태에서 다음상태로 변화
	always @(posedge clock or negedge nReset) begin
		if (!nReset)
			curState <= `INIT;
		else
			curState <= nextState;
	end
	
	// FSM
	always @(curState or refAddr) begin
		casex (curState)
			`INIT: begin
				if (refAddr)
					nextState = `S0;
					
				adjNumber = 3'bx;
				regAddr = 3'bx;
				matReaden = 1'b0;
			end
		
			`S0: begin
				nextState = `S1;
				adjNumber = 3'd0;
				regAddr = 3'bx;
			end
			
			`S1: begin
				nextState = `S2;
				adjNumber = 3'd1;
				regAddr = 3'bx;
			end
			
			`S2: begin
				nextState = `S3;
				adjNumber = 3'd2;
				regAddr = 3'd0;
			end
			
			`S3: begin
				nextState = `S4;
				adjNumber = 3'd3;
				regAddr = 3'd1;
			end
			
			`S4: begin
				nextState = `S5;
				adjNumber = 3'd4;				
				regAddr = 3'd2;
			end
			
			`S5: begin
				nextState = `S6;
				adjNumber = 3'd5;
				regAddr = 3'd3;
			end
			
			`S6: begin
				nextState = `S7;
				adjNumber = 3'd6;
				regAddr = 3'd4;
			end
			
			`S7: begin
				nextState = `S8;
				adjNumber = 3'd7;
				regAddr = 3'd5;
			end
			
			`S8: begin
				nextState = `S9;
				adjNumber = 3'dx;
				regAddr = 3'd6;
			end
			
			`S9: begin
				nextState = `S10;
				adjNumber = 3'dx;
				regAddr = 3'd7;
			end
			
			`S10: begin
				nextState = `INIT;
				adjNumber = 3'bx;
				regAddr = 3'bx;
				matReaden = 1'b1;
			end
		endcase
	end
endmodule 