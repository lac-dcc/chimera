// This program was cloned from: https://github.com/ISKU/FAST9-Accelerator
// License: MIT License

module NMS_Top (clock, nReset, refAddr, refPixel, scoreData, scoreAddr, outAddr, outPixel);
	input clock;
	input nReset;
	input [14:0] refAddr; // 기준점 주소
	input [7:0] refPixel; // 기준점 데이터
	input [7:0] scoreData; // Score Memory에 저장할 데이터 
	output [14:0] scoreAddr; // Score Memoery 주소
	output [14:0] outAddr; // 최종적으로 결정된 코너의 주소
	output [7:0] outPixel; // 코너 여부를 확인하여 최종적으로 결정된 기준점의 데이터

	wire [3:0] adjNumber; // 1~8개의 인접한 점 번호
	wire [3:0] regAddr; // 레지스터 주소
	wire [7:0] refScore; // 기준점 Score
	wire [63:0] adjScore; // 인접한 8개의 점 Score

	// Controller, 기준점과 인접한 8개의 주소를 얻어, 레지스터에 저장하는 과정을 제어
	NMS_Controller controller(
		.clock(clock),
		.nReset(nReset),
		.refAddr(refAddr), 
		.adjNumber(adjNumber),
		.regAddr(regAddr),
		.readen(readen)
	);
	
	// 기준점으로 부터 인접한 8개의 점을 계산
	NMS_AddrCal addrCal(
		.refAddr(refAddr),
		.adjNumber(adjNumber),
		.scoreAddr(scoreAddr)
	);

	// 기준점과 인접한 8개의 점을 저장할 레지스터 파일
	NMS_Reg nms_reg(
		.clock(clock),
		.nReset(nReset),
		.readen(readen),
		.regAddr(regAddr),
		.scoreData(scoreData),
		.refScore(refScore),
		.adjScore(adjScore)
	);
	
	// 레지스터에 저장된 기준점과 인접한 8개의 점의 데이터를 이용하여 최종적으로 코너를 결정
	NMS_Datapath datapath(
		.refScore(refScore),
		.adjScore(adjScore),
		.refAddr(refAddr),
		.outAddr(outAddr),
		.outPixel(outPixel)
	);
endmodule 