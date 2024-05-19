// This program was cloned from: https://github.com/ISKU/FAST9-Accelerator
// License: MIT License

`define INIT 4'd0
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
`define S11 4'd11
`define S12 4'd12
`define S13 4'd13
`define S14 4'd14
`define S15 4'd15

module Mat_Counter (clock, nReset, matPoint, isFeature, posAddr, posReaden);
	input clock;
	input nReset;
	input matPoint; // Datapath에서 유효 특징점 여부
	input [7:0] isFeature; // 특징점 확인 변수
	output [3:0] posAddr; // 레지스터 주소
	output posReaden; // 매칭 여부
	
	reg [3:0] posAddr;
	reg posReaden;
	reg [3:0] curState, nextState; // 상태 변화
	
	// Clock이 상승할 때마다 현재 상태에서 다음상태로 변화
	always @(posedge clock or negedge nReset) begin
		if (!nReset)
			curState <= `INIT;
		else
			curState <= nextState;
	end
	
	// FSM
	always @(curState or matPoint or isFeature) begin
		casex (curState)
			`INIT: begin
				if (matPoint && isFeature) begin
					nextState = `S1;
					posAddr = 4'd0;
					posReaden = 1'b0;
				end
			end
			
			`S1: begin
				if (matPoint) begin
					nextState = `S2;
					posAddr = 4'd1;
					posReaden = 1'b0;
				end
			end
			
			`S2: begin
				if (matPoint) begin
					nextState = `S3;
					posAddr = 4'd2;
					posReaden = 1'b0;
				end
			end
			
			`S3: begin
				if (matPoint) begin
					nextState = `S4;
					posAddr = 4'd3;
					posReaden = 1'b0;
				end
			end
			
			`S4: begin
				if (matPoint) begin
					nextState = `S5;
					posAddr = 4'd4;
					posReaden = 1'b0;
				end
			end
			
			`S5: begin
				if (matPoint) begin
					nextState = `S6;
					posAddr = 4'd5;
					posReaden = 1'b0;
				end
			end
			
			`S6: begin
				if (matPoint) begin
					nextState = `S7;
					posAddr = 4'd6;
					posReaden = 1'b0;
				end
			end
			
			`S7: begin
				if (matPoint) begin
					nextState = `S8;
					posAddr = 4'd7;
					posReaden = 1'b0;
				end
			end
			
			`S8: begin
				if (matPoint) begin
					nextState = `S9;
					posAddr = 4'd8;
					posReaden = 1'b0;
				end
			end
			
			`S9: begin
				if (matPoint) begin
					nextState = `S10;
					posAddr = 4'd9;
					posReaden = 1'b0;
				end
			end
			
			`S10: begin
				if (matPoint) begin
					nextState = `S11;
					posAddr = 4'd10;
					posReaden = 1'b0;
				end
			end
			
			`S11: begin
				if (matPoint) begin
					nextState = `S12;
					posAddr = 4'd11;
					posReaden = 1'b0;
				end
			end
			
			`S12: begin
				if (matPoint) begin
					nextState = `S13;
					posAddr = 4'd12;
					posReaden = 1'b0;
				end
			end
			
			`S13: begin
				if (matPoint) begin
					nextState = `S14;
					posAddr = 4'd13;
					posReaden = 1'b0;
				end
			end
			
			`S14: begin
				if (matPoint) begin
					nextState = `S15;
					posAddr = 4'd14;
					posReaden = 1'b0;
				end
			end
			
			`S15: begin
				if (matPoint) begin
					nextState = `INIT;
					posAddr = 4'd15;
					posReaden = 1'b1;
				end
			end
		endcase
	end
endmodule 