// This program was cloned from: https://github.com/ISKU/FAST9-Accelerator
// License: MIT License

module FD_Testbench;
	reg clock;
	reg nReset;
	
	wire isCorner; // 코너 확인
	wire [14:0] refAddr; // 기준점 주소
	wire [7:0] refPixel; // 기준점 데이터
	wire [127:0] adjPixel; // 인접한 16개의 점 데이터
	wire [7:0] thres; // 임계값
	wire [31:0] compare;
	
	always begin
		#10 clock = ~clock;
		if (clock && isCorner) // 코너로 확인된 특징점인 경우에 출력
			$display($time, " isCorner: %d, refAddr: %d, refPixel: %h", isCorner, refAddr - 1, refPixel);
	end
	
	// Feature Detection Top Module
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
	
	initial begin
		clock = 1'b0;
		nReset = 1'b1;
		#100 nReset = 1'b0;
		#100 nReset = 1'b1;
		
		#10000000 $finish;
	end
endmodule 