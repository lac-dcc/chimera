module FS_Top (isCorner, compare, refAddr, refPixel, adjPixel, thres, scoreValue, wren);
	input isCorner; // Corner 확인
	input [31:0] compare; // DARK, BRIGHT, SIMILAR 값
	input [14:0] refAddr; // 기준점 주소
	input [7:0] refPixel; // 기준점 데이터
	input [127:0] adjPixel; // 인접한 16개의 점 데이터
	input [7:0] thres; // 임계값
	output [7:0] scoreValue; // 점수 데이터
	output wren; // Score Memory에 쓰기 신호
	
	// 코너의 스코어를 계산하는 모듈
	FS_Datapath datapth(
		.isCorner(isCorner),
		.compare(compare),
		.refPixel(refPixel),
		.adjPixel(adjPixel),
		.thres(thres),
		.wren(wren),
		.scoreValue(scoreValue)
	);
endmodule 