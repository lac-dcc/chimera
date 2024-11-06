// This program was cloned from: https://github.com/ISKU/Autonomous-Drone-Design
// License: GNU General Public License v3.0

module Mat_Reg (clock, nReset, matReaden, regAddr, FBData, adjFBPixel);
	input clock;
	input nReset;
	input matReaden; // Datapath에 input으로 값을 주기 위한 신호
	input [2:0] regAddr; // 레지스터 주소
	input [7:0] FBData; // 레지스터에 저장할 값
	output [63:0] adjFBPixel; // 인접한 8개의 점의 픽셀 데이터

	reg [7:0] r1, r2, r3, r4, r5, r6, r7, r8; // 인접한 8개 점의 데이터를 저장
	
	// 주소로부터 저장할 레지스터를 선택하기 위한 디코더로 인접한 8개의 점의 데이터를 저장한다.
	wire [7:0] decoder;
	assign decoder =
		(regAddr == 4'd0) ? 9'd1 :
		(regAddr == 4'd1) ? 9'd2 :
		(regAddr == 4'd2) ? 9'd4 :
		(regAddr == 4'd3) ? 9'd8 :
		(regAddr == 4'd4) ? 9'd16 :
		(regAddr == 4'd5) ? 9'd32 :
		(regAddr == 4'd6) ? 9'd64 :
		(regAddr == 4'd7) ? 9'd128 : 8'bx;
	
	// 레지스터 저장
	always @ (posedge clock or negedge nReset)
		if (!nReset)
			r1 <= 8'bx;
		else if (decoder[0])
			r1 <= FBData;

	always @ (posedge clock or negedge nReset)
		if (!nReset)
			r2 <= 8'bx;
		else if (decoder[1])
			r2 <= FBData;
			
	always @ (posedge clock or negedge nReset)
		if (!nReset)
			r3 <= 8'bx;
		else if (decoder[2])
			r3 <= FBData;
			
	always @ (posedge clock or negedge nReset)
		if (!nReset)
			r4 <= 8'bx;
		else if (decoder[3])
			r4 <= FBData;
			
	always @ (posedge clock or negedge nReset)
		if (!nReset)
			r5 <= 8'bx;
		else if (decoder[4])
			r5 <= FBData;
			
	always @ (posedge clock or negedge nReset)
		if (!nReset)
			r6 <= 8'bx;
		else if (decoder[5])
			r6 <= FBData;
			
	always @ (posedge clock or negedge nReset)
		if (!nReset)
			r7 <= 8'bx;
		else if (decoder[6])
			r7 <= FBData;
			
	always @ (posedge clock or negedge nReset)
		if (!nReset)
			r8 <= 8'bx;
		else if (decoder[7])
			r8 <= FBData;
	
	// matReaden이 1로 셋팅 되면 8개의 인접한 점의 데이터를 한번에 Output으로 보낸다.
	assign adjFBPixel = (matReaden) ? {r1, r2, r3, r4, r5, r6, r7, r8} : 64'bx; // 8개 점
endmodule 