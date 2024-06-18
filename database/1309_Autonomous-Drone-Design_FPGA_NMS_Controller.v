// This program was cloned from: https://github.com/ISKU/Autonomous-Drone-Design
// License: GNU General Public License v3.0

`define INIT 5'd20
`define S0 5'd0
`define S1 5'd1
`define S2 5'd2
`define S3 5'd3
`define S4 5'd4
`define S5 5'd5
`define S6 5'd6
`define S7 5'd7
`define S8 5'd8
`define S9 5'd9
`define S10 5'd10
`define S11 5'd11
`define S12 5'd12
`define S13 5'd13
`define S14 5'd14
`define S15 5'd15
`define S16 5'd16
`define S17 5'd17
`define S18 5'd18
`define S19 5'd19

module NMS_Controller (clock, nReset, refAddr, adjNumber, regAddr, readen);
	input clock;
	input nReset;
	input [14:0] refAddr; // 현재 주소
	output [3:0] adjNumber; // 인접한 8개의 점의 번호
	output [3:0] regAddr; // 레지스터 주소
	output readen; // datapath에 보낼 읽기 신호
	
	reg [3:0] adjNumber; // 8개의 점 Index
	reg [3:0] regAddr; // 레지스터 주소
	reg readen; // Datapath가 수행될 수 있도록 하는 enable 신호
	
	reg [4:0] curState, nextState; // 상태 변화
	reg setState;
	
	// 클락이 상승할 때마다 현재 상태에서 다음상태로 변화
	always @(posedge clock or negedge nReset) begin
		if (!nReset)
			curState <= `INIT;
		else
			curState <= nextState;
	end
	
	always @(refAddr) begin
		if (curState == `INIT)
			setState = 1'b0;
		else
			setState = 1'b1;
	end
	
	// FSM
	always @(curState or refAddr) begin
		casex (curState)
			`INIT: begin
				/*if (refAddr < 15'd904) begin
					nextState = `INIT;
					readen = 1'b0;
				end
				else begin*/
				if (setState) begin
					nextState = `S0;
					readen = 1'b0;
				end
			end
		
			`S0: begin
				nextState = `S1;
				adjNumber = `S0;
				regAddr = 4'bx;
			end
			
			`S1: begin
				nextState = `S2;
				adjNumber = `S1;
				regAddr = 4'bx;
			end
			
			`S2: begin
				nextState = `S3;
				adjNumber = `S2;
				regAddr = `S0;
			end
			
			`S3: begin
				nextState = `S4;
				adjNumber = `S3;
				regAddr = `S1;
			end
			
			`S4: begin
				nextState = `S5;
				adjNumber = `S4;				
				regAddr = `S2;
			end
			
			`S5: begin
				nextState = `S6;
				adjNumber = `S5;
				regAddr = `S3;
			end
			
			`S6: begin
				nextState = `S7;
				adjNumber = `S6;
				regAddr = `S4;
			end
			
			`S7: begin
				nextState = `S8;
				adjNumber = `S7;
				regAddr = `S5;
			end
			
			`S8: begin
				nextState = `S9;
				adjNumber = `S8;
				regAddr = `S6;
			end
			
			`S9: begin
				nextState = `S10;
				adjNumber = 4'bx;
				regAddr = `S7;
			end
			
			`S10: begin
				nextState = `S11;
				adjNumber = 4'bx;
				regAddr = `S8;
			end
			
			`S11: begin
				nextState = `S12;
				adjNumber = 4'bx;
				regAddr = 4'bx;
			end
			
			`S12: begin
				nextState = `S13;
				adjNumber = 4'bx;
				regAddr = 4'bx;
			end
			
			`S13: begin
				nextState = `S14;
				adjNumber = 4'bx;
				regAddr = 4'bx;
			end
			
			`S14: begin
				nextState = `S15;
				adjNumber = 4'bx;
				regAddr = 4'bx;
			end
			
			`S15: begin
				nextState = `S16;
				adjNumber = 4'bx;
				regAddr = 4'bx;
			end
			
			`S16: begin
				nextState = `S17;
				adjNumber = 4'bx;
				regAddr = 4'bx;
			end
			
			`S17: begin
				nextState = `S18;
				adjNumber = 4'bx;
				regAddr = 4'bx;
			end
			
			`S18: begin
				nextState = `S19;
				adjNumber = 4'bx;
				regAddr = 4'bx;
			end
			
			`S19: begin
				nextState = `INIT;
				adjNumber = 4'd15;
				regAddr = 4'bx;
				readen = 1'b1;
			end
		endcase
	end
endmodule 