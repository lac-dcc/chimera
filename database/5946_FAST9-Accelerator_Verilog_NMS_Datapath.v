// This program was cloned from: https://github.com/ISKU/FAST9-Accelerator
// License: MIT License

module NMS_Datapath (refScore, adjScore, refAddr, outAddr, outPixel);
	input [7:0] refScore; // 기준점 Score
	input [63:0] adjScore; // 인접한 8개의 점 Score
	input [14:0] refAddr; // 현재 주소
	output [14:0] outAddr; // 최종 Corner 주소
	output [7:0] outPixel; // 최종 Corner 데이터

	// 인접한 8개의 점과 비교하여 기준점의 Score가 모든 인접한 점보다 크면 0xff로 최종 Corner 출력
	assign outPixel = 
		(refScore == 8'd0) ? 8'bx : // Corner가 아닌 경우
		(refScore < adjScore[63:56]) ? 8'bx :
		(refScore < adjScore[55:48]) ? 8'bx :
		(refScore < adjScore[47:40]) ? 8'bx :
		(refScore < adjScore[39:32]) ? 8'bx :
		(refScore < adjScore[31:24]) ? 8'bx :
		(refScore < adjScore[23:16]) ? 8'bx :
		(refScore < adjScore[15:8]) ? 8'bx :
		(refScore < adjScore[7:0]) ? 8'bx : 8'hff;
		
	// 최종적으로 결정된 코너의 주소
	assign outAddr = (outPixel == 8'hff) ? refAddr - 182 : 15'bx;
endmodule 