module FAST9_Top (clock, nReset, refAddr, outPixel);
	input clock;
	input nReset;
	output [14:0] refAddr;
	output [7:0] outPixel;
	
	wire isCorner; // 코너 확인
	wire [31:0] compare; // DARK, BRIGHT, SIMILAR 값
	wire [14:0] refAddr; // 기준점 주소
	wire [7:0] refPixel; // 기준점 데이터
	wire [127:0] adjPixel; // 인접한 16개의 점 데이터
	wire [7:0] thres; // 임계값
	wire [14:0] outAddr; // 최종 코너 주소
	wire [7:0] outPixel; // 최종 코너 데이터
	wire [14:0] scoreAddr; // Score Memory 주소
	wire [7:0] scoreValue; // Score Memory에 저장할 값
	wire [7:0] scoreData; // Score Memory에서 Read한 값
	wire wren; // Score Memeory 쓰기 신호
	
	// Feature Detection
	FD_Top fd(
		.clock(clock), 
		.nReset(nReset),
		.isCorner(isCorner),
		.refAddr(refAddr),
		.refPixel(refPixel),
		.adjPixel(adjPixel),
		.thres(thres),
		.compare(compare)
	);
	
	// Feature Score
	FS_Top fs(
		.isCorner(isCorner),
		.compare(compare),
		.refAddr(refAddr),
		.refPixel(refPixel),
		.adjPixel(adjPixel),
		.thres(thres),
		.scoreValue(scoreValue),
		.wren(wren)
	);
	
	// Non-Maximal Suppression
	NMS_Top nms(
		.clock(clock),
		.nReset(nReset),
		.refAddr(refAddr),
		.refPixel(refPixel),
		.scoreData(scoreData),
		.scoreAddr(scoreAddr),
		.outAddr(outAddr),
		.outPixel(outPixel)
	);
	
	// Score Memory
	FS_ScoreMem scoreMem(
		.clock(clock),
		.address(scoreAddr),
		.data(scoreValue),
		.wren(wren),
		.q(scoreData)
	);
endmodule 