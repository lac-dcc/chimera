// This program was cloned from: https://github.com/ISKU/FAST9-Accelerator
// License: MIT License

module FS_Testbench;
	reg clock;
	reg nReset;
	
	always begin
		#10 clock = ~clock;
		if (clock && fast9.fs.isCorner) // 코너로 확인된 특징점인 경우에 스코어를 출력
			$display("refAddr: %d, score: %h", fast9.fs.refAddr, fast9.fs.scoreValue);
	end
	
	// FAST-9 Alogrithm Top Module
	FAST9_Top fast9(
		.clock(clock),
		.nReset(nReset)
	);
	
	initial begin
		clock = 1'b0;
		nReset = 1'b1;
		#100 nReset = 1'b0;
		#100 nReset = 1'b1;
		
		#10000000 $finish;
	end
endmodule 