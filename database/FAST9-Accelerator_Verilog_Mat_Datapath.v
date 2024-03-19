module Mat_Datapath (adjFBPixel, dbValue, matPoint);
	input [63:0] adjFBPixel; // 인접한 8개의 점 데이터
	input [287:0] dbValue; // DB 데이터
	output matPoint; // 매칭 여부

	wire [7:0] refAvg; // 특징점 주변의 평균값
	wire [7:0] threshold; // 임계값
	
	// 임의 임계값
	assign threshold = 8'd30;
	
	// 특징점 평균값 계산
	assign refAvg = 
		(adjFBPixel[7:0] +
		adjFBPixel[15:8] +
		adjFBPixel[23:16] +
		adjFBPixel[31:24] +
		adjFBPixel[39:32] +
		adjFBPixel[47:40] +
		adjFBPixel[55:48] +
		adjFBPixel[63:56]) / 8;
	
	// 각 뺄셈 결과가 threshold 이하 값이 나올 경우 해당 특징점은 유효 특징점으로 판단
	assign matPoint =
		(dbValue[7:0] - refAvg < threshold) ? 1'b1 :
		(dbValue[15:8] - refAvg < threshold) ? 1'b1 :
		(dbValue[23:16] - refAvg < threshold) ? 1'b1 :
		(dbValue[31:24] - refAvg < threshold) ? 1'b1 :
		(dbValue[39:32] - refAvg < threshold) ? 1'b1 :
		(dbValue[47:40] - refAvg < threshold) ? 1'b1 :
		(dbValue[55:48] - refAvg < threshold) ? 1'b1 :
		(dbValue[63:56] - refAvg < threshold) ? 1'b1 :
		(dbValue[71:64] - refAvg < threshold) ? 1'b1 :
		(dbValue[79:72] - refAvg < threshold) ? 1'b1 :
		(dbValue[87:80] - refAvg < threshold) ? 1'b1 :
		(dbValue[95:88] - refAvg < threshold) ? 1'b1 :
		(dbValue[103:96] - refAvg < threshold) ? 1'b1 :
		(dbValue[111:104] - refAvg < threshold) ? 1'b1 :
		(dbValue[119:112] - refAvg < threshold) ? 1'b1 :
		(dbValue[127:120] - refAvg < threshold) ? 1'b1 :
		(dbValue[135:128] - refAvg < threshold) ? 1'b1 :
		(dbValue[143:136] - refAvg < threshold) ? 1'b1 :
		(dbValue[151:144] - refAvg < threshold) ? 1'b1 :
		(dbValue[159:152] - refAvg < threshold) ? 1'b1 :
		(dbValue[167:160] - refAvg < threshold) ? 1'b1 :
		(dbValue[175:168] - refAvg < threshold) ? 1'b1 :
		(dbValue[183:176] - refAvg < threshold) ? 1'b1 :
		(dbValue[191:184] - refAvg < threshold) ? 1'b1 :
		(dbValue[199:192] - refAvg < threshold) ? 1'b1 :
		(dbValue[207:200] - refAvg < threshold) ? 1'b1 :
		(dbValue[215:208] - refAvg < threshold) ? 1'b1 :
		(dbValue[223:216] - refAvg < threshold) ? 1'b1 :
		(dbValue[231:224] - refAvg < threshold) ? 1'b1 :
		(dbValue[239:232] - refAvg < threshold) ? 1'b1 :
		(dbValue[247:240] - refAvg < threshold) ? 1'b1 :
		(dbValue[255:248] - refAvg < threshold) ? 1'b1 :
		(dbValue[263:256] - refAvg < threshold) ? 1'b1 :
		(dbValue[271:264] - refAvg < threshold) ? 1'b1 :
		(dbValue[279:272] - refAvg < threshold) ? 1'b1 :
		(dbValue[287:280] - refAvg < threshold) ? 1'b1 : 1'b0;
endmodule 