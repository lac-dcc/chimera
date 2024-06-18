// This program was cloned from: https://github.com/sep-81/Digital-Logic-Design-Lab-Experiments
// License: MIT License

module ABRCKT(input BRGCLK, ABAUD, UxRX, output UxRXIF, output [7 : 0] N);
	wire ld_en, cnt_rst, cnt_en;
	wire [7 : 0]tmp_N;
	Controller controller(ABAUD, UxRX, BRGCLK, UxRXIF, ld_en, cnt_rst, cnt_en);
	DataPath data_path(BRGCLK, cnt_en, cnt_rst, ld_en, tmp_N);
	assign N = 8'b11111111 - tmp_N;
endmodule