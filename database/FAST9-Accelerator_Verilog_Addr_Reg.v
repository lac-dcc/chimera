// This program was cloned from: https://github.com/ISKU/FAST9-Accelerator
// License: MIT License

module Addr_Reg (refAddr, posAddr, posReaden, position, isMatching);
	input [14:0] refAddr; // 특징점 주소
	input [3:0] posAddr; // 레지스터 주소
	input posReaden; // 매칭 여부
	output [239:0] position; // 유효 특징점 주소
	output isMatching; // 매칭 여부

	reg [14:0] r1, r2, r3, r4, r5, r6, r7, r8, r9;
	reg [14:0] r10, r11, r12, r13, r14, r15, r16;
	
	// 주소로부터 저장할 레지스터를 선택하기 위한 인접한 8개의 점의 데이터를 저장한다.
	wire [15:0] decoder;
	assign decoder =
		(posAddr == 4'd0) ? 16'd1 :
		(posAddr == 4'd1) ? 16'd2 :
		(posAddr == 4'd2) ? 16'd4 :
		(posAddr == 4'd3) ? 16'd8 :
		(posAddr == 4'd4) ? 16'd16 :
		(posAddr == 4'd5) ? 16'd32 :
		(posAddr == 4'd6) ? 16'd64 :
		(posAddr == 4'd7) ? 16'd128 :
		(posAddr == 4'd8) ? 16'd256 :
		(posAddr == 4'd9) ? 16'd512 :
		(posAddr == 4'd10) ? 16'd1024 :
		(posAddr == 4'd11) ? 16'd2048 :
		(posAddr == 4'd12) ? 16'd4096 :
		(posAddr == 4'd13) ? 16'd8192 :
		(posAddr == 4'd14) ? 16'd16384 :
		(posAddr == 4'd15) ? 16'd32768 : 4'bx;
	
	// 레지스터 저장
	always @(posAddr)
	if (decoder[0])
		r1 <= refAddr;
		
	always @(posAddr)
	if (decoder[1])
		r2 <= refAddr;
	
	always @(posAddr)
	if (decoder[2])
		r3 <= refAddr;
	
	always @(posAddr)
	if (decoder[3])
		r4 <= refAddr;
	
	always @(posAddr)
	if (decoder[4])
		r5 <= refAddr;
	
	always @(posAddr)
	if (decoder[5])
		r6 <= refAddr;
	
	always @(posAddr)
	if (decoder[6])
		r7 <= refAddr;
	
	always @(posAddr)
	if (decoder[7])
		r8 <= refAddr;
	
	always @(posAddr)
	if (decoder[8])
		r9 <= refAddr;
	
	always @(posAddr)
	if (decoder[9])
		r10 <= refAddr;
	
	always @(posAddr)
	if (decoder[10])
		r11 <= refAddr;
	
	always @(posAddr)
	if (decoder[11])
		r12 <= refAddr;
	
	always @(posAddr)
	if (decoder[12])
		r13 <= refAddr;
	
	always @(posAddr)
	if (decoder[13])
		r14 <= refAddr;
	
	always @(posAddr)
	if (decoder[14])
		r15 <= refAddr;
	
	always @(posAddr)
	if (decoder[15])
		r16 <= refAddr;
		
	// 저장된 유효 특징점의 모든 주소를 반환
	assign position = 
		(posReaden == 1'b1) ? {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16} : 240'bx;
	
	// 매칭 여부를 반환
	assign isMatching = (posReaden == 1'b1) ? 1'b1 : 1'b0;
endmodule 