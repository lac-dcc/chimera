module NMS_Testbench;
	reg clock;
	reg nReset;
	
	wire [14:0] outAddr;
	wire [7:0] outPixel;
	
	always begin
		#10 clock = ~clock;
		if (clock && (outPixel == 8'hff)) // 최종적으로 결정된 Corner의 주소와 값 출력
			$display("outAddr: %d, outPixel: %h", outAddr, outPixel);
	end
	
	// FAST-9 Alogrithm Top Module
	FAST9_Top fast9(
		.clock(clock),
		.nResetedd(nReset),
		.outAddr(outAddr),
		.outPixel(outPixel)
	);
	
	initial begin
		clock = 1'b0;
		nReset = 1'b1;
		#100 nReset = 1'b0;
		#100 nReset = 1'b1;
		
		#10000000 $finish;
	end
endmodule 