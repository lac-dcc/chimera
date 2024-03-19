module DBMEM (matReaden, dbValue);
	input matReaden;
	output [287:0] dbValue;
	
	// 36개의 실제 특징점의 평균값 데이터로 matReaden이 1로 셋되면 값을 반환
	assign dbValue =
		(matReaden == 1'b1) ? 
		{8'd95, 8'd95, 8'd95, 8'd95, 8'd0, 8'd0, 8'd0, 8'd0, 8'd95, 8'd95, 8'd95, 8'd95,
		8'd159, 8'd159, 8'd255, 8'd255, 8'd159, 8'd159, 8'd159, 8'd159, 8'd255, 8'd255,
		8'd159, 8'd159, 8'd95, 8'd95, 8'd95, 8'd95, 8'd0, 8'd0, 8'd0, 8'd0, 8'd95, 8'd95, 8'd95, 8'd95} : 288'bx;
endmodule 