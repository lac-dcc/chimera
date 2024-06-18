// This program was cloned from: https://github.com/ISKU/Autonomous-Drone-Design
// License: GNU General Public License v3.0

module Mat_Top (clock, nReset, refAddr, isFeature, FBData, position, isMatching, FBAddr);
	input clock;
	input nReset;
	input [14:0] refAddr; // 기준점
	input [7:0] isFeature; // 특징점 확인
	input [7:0] FBData; // Frame Buffer Output 데이터
	output [239:0] position; // 매칭된 유효 특징점 주소
	output isMatching; // 매칭 결과
	output [14:0] FBAddr; // Frame Buffer 주소
	
	wire [2:0] adjNumber; // 8개의 인접한 점
	wire [2:0] regAddr; // 레지스터 주소
	wire [63:0] adjFBPixel; // 인접한 8개의 점 데이터
	wire [287:0] dbValue; // DB 데이터
	wire [3:0] posAddr; // 레지스터 주소
	wire matPoint; // 매칭 여부

	// Controller, 특징점과 인접한 8개의 주소를 얻어, 레지스터에 저장하는 과정을 제어
	Mat_Controller controller(
		.clock(clock),
		.nReset(nReset),
		.refAddr(refAddr),
		.adjNumber(adjNumber),
		.regAddr(regAddr),
		.matReaden(matReaden)
	);
	
	// 기준점으로부터 인접한 8개의 점의 주소를 계산
	Mat_AddrCal addrCal(
		.refAddr(refAddr),
		.adjNumber(adjNumber),
		.FBAddr(FBAddr)
	);
	
	// 인접한 8개의 픽셀 값을 저장
	Mat_Reg mat_reg(
		.clock(clock),
		.nReset(nReset),
		.matReaden(matReaden),
		.regAddr(regAddr),
		.FBData(FBData),
		.adjFBPixel(adjFBPixel)
	);
	
	// DB의 데이터와 레지스터의 저장된 특징점 주변의 평균값의 1:N 비교를 통해 매칭여부 확인
	Mat_Datapath datapath(
		.adjFBPixel(adjFBPixel),
		.dbValue(dbValue),
		.matPoint(matPoint)
	);
	
	// 실제 이미지의 특징점의 평균값이 저장
	DBMEM dbmem(
		.matReaden(matReaden),
		.dbValue(dbValue)
	);

	// 최종적으로 매칭된 특징점의 주소를 저장 
	Mat_AddrReg addr_reg(
		.refAddr(refAddr),
		.posAddr(posAddr),
		.posReaden(posReaden),
		.position(position),
		.isMatching(isMatching)
	);
	
	// 매칭된 특징점의 개수를 센다.
	Mat_Counter counter(
		.clock(clock),
		.nReset(nReset),
		.matPoint(matPoint),
		.isFeature(isFeature),
		.posAddr(posAddr),
		.posReaden(posReaden)
	);
endmodule 