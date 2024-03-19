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

module FD_Controller (clock, nReset, refAddr, adjNumber, regAddr, readen);
	input clock;
	input nReset;
	output [14:0] refAddr;
	output [4:0] adjNumber;
	output [4:0] regAddr;
	output readen;
	
	reg [14:0] refAddr; // 기준점 주소
	reg [4:0] adjNumber; // 16개의 점 Index
	reg [4:0] regAddr; // 레지스터 주소
	reg readen; // Datapath가 수행될 수 있도록 하는 enable 신호
	
	reg [4:0] curState, nextState; // 상태 변화
	
	// 클락이 상승할 때마다 현재 상태에서 다음상태로 변화
	always @(posedge clock or negedge nReset) begin
		if (!nReset)
			curState <= `INIT;
		else
			curState <= nextState;
	end
	
	// FSM
	always @(curState) begin
		casex (curState)
			`INIT: begin
				nextState = `S0;
				adjNumber = 5'bx;
				regAddr = 5'bx;
				readen = 1'b0;
				
				if (refAddr == 15'd21056)
					refAddr = 15'd543;
				//else if (refAddr % 177 == 0)
				//	refAddr = refAddr + 7;
				else if (refAddr != 0)
					refAddr = refAddr + 1;
				else
					refAddr = 15'd543;
			end
		
			`S0: begin
				nextState = `S1;
				adjNumber = `S0;
				regAddr = 5'bx;
			end
			
			`S1: begin
				nextState = `S2;
				adjNumber = `S1;
				regAddr = 5'bx;
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
				adjNumber = `S9;
				regAddr = `S7;
			end

			`S10: begin
				nextState = `S11;
				adjNumber = `S10;
				regAddr = `S8;
			end
			
			`S11: begin
				nextState = `S12;
				adjNumber = `S11;
				regAddr = `S9;
			end
			
			`S12: begin
				nextState = `S13;
				adjNumber = `S12;
				regAddr = `S10;
			end
			
			`S13: begin
				nextState = `S14;
				adjNumber = `S13;
				regAddr = `S11;
			end
			
			`S14: begin
				nextState = `S15;
				adjNumber = `S14;
				regAddr = `S12;
			end
			
			`S15: begin
				nextState = `S16;
				adjNumber = `S15;
				regAddr = `S13;
			end
			
			`S16: begin
				nextState = `S17;
				adjNumber = `S16;
				regAddr = `S14;
			end
			
			`S17: begin
				nextState = `S18;
				adjNumber = 5'bx;
				regAddr = `S15;
			end
			
			`S18: begin
				nextState = `S19;
				adjNumber = 5'bx;
				regAddr = `S16;
			end
			
			`S19: begin
				nextState = `INIT;
				adjNumber = 5'bx;
				regAddr = 5'bx;
				readen = 1'b1;
			end
		endcase
	end
endmodule 