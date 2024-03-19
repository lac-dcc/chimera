module NMS_Reg (clock, nReset, readen, regAddr, scoreData, refScore, adjScore);
	input clock;
	input nReset;
	input readen; // Datapath에 input으로 값을 주기 위한 신호
	input [3:0] regAddr; // 레지스터 주소
	input [7:0] scoreData; // 레지스터에 저장할 값
	output [7:0] refScore; // 기준점 Score
	output [63:0] adjScore; // 인접한 8개의 점 Score

	reg [7:0] refPoint; // 기준점 데이터를 저장
	reg [7:0] r1, r2, r3, r4, r5, r6, r7, r8; // 인접한 8개 점의 데이터를 저장
	
	// 주소로부터 저장할 레지스터를 선택하기 위한 디코더로 기준점의 데이터와, 인접한 8개의 점의 데이터를 저장한다.
	wire [8:0] decoder;
	assign decoder =
		(regAddr == 4'd0) ? 9'd1 :
		(regAddr == 4'd1) ? 9'd2 :
		(regAddr == 4'd2) ? 9'd4 :
		(regAddr == 4'd3) ? 9'd8 :
		(regAddr == 4'd4) ? 9'd16 :
		(regAddr == 4'd5) ? 9'd32 :
		(regAddr == 4'd6) ? 9'd64 :
		(regAddr == 4'd7) ? 9'd128 :
		(regAddr == 4'd8) ? 9'd256 : 9'bx;
	
	always @ (posedge clock or negedge nReset)
		if (!nReset)
			refPoint <= 8'bx;
		else if (decoder[0])
			refPoint <= scoreData;

	always @ (posedge clock or negedge nReset)
		if (!nReset)
			r1 <= 8'bx;
		else if (decoder[1])
			r1 <= scoreData;

	always @ (posedge clock or negedge nReset)
		if (!nReset)
			r2 <= 8'bx;
		else if (decoder[2])
			r2 <= scoreData;
			
	always @ (posedge clock or negedge nReset)
		if (!nReset)
			r3 <= 8'bx;
		else if (decoder[3])
			r3 <= scoreData;
			
	always @ (posedge clock or negedge nReset)
		if (!nReset)
			r4 <= 8'bx;
		else if (decoder[4])
			r4 <= scoreData;
			
	always @ (posedge clock or negedge nReset)
		if (!nReset)
			r5 <= 8'bx;
		else if (decoder[5])
			r5 <= scoreData;
			
	always @ (posedge clock or negedge nReset)
		if (!nReset)
			r6 <= 8'bx;
		else if (decoder[6])
			r6 <= scoreData;
			
	always @ (posedge clock or negedge nReset)
		if (!nReset)
			r7 <= 8'bx;
		else if (decoder[7])
			r7 <= scoreData;
			
	always @ (posedge clock or negedge nReset)
		if (!nReset)
			r8 <= 8'bx;
		else if (decoder[8])
			r8 <= scoreData;
	
	// readen이 1로 셋팅 되면 기준점 데이터와, 8개의 인접한 점의 데이터를 한번에 Output으로 보낸다.
	assign refScore = (readen) ? refPoint : 8'bx; // 기준점 
	assign adjScore = (readen) ? {r1, r2, r3, r4, r5, r6, r7, r8} : 64'bx; // 8개 점
endmodule 