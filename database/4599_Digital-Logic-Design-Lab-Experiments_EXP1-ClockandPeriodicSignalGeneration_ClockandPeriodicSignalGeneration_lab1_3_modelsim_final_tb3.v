// This program was cloned from: https://github.com/sep-81/Digital-Logic-Design-Lab-Experiments
// License: MIT License

`timescale 1ps/1ps
`define delay 1000
module FinalTB();
	reg ABAUD, UxRX, ring_en, tf_set;
	wire clk0, clk1, clk2, clk3,UxRXIF, BRGout,BRGCLK;
	wire [7:0] cnt_num,N;
	reg [1 : 0]k;
	TFlioFlop t1(1'b1, clk0, tf_set, clk1);
	TFlioFlop t2(1'b1, clk1, tf_set, clk2);
	TFlioFlop t3(1'b1, clk2, tf_set, clk3);
	MUX mux(k, {clk3, clk2, clk1, clk0}, BRGCLK);
	BRGCKT UUT(
	.UxRXIF(UxRXIF),
	.BRGCLK(BRGCLK),
	.ABAUD(ABAUD),
	.UxRX(UxRX),
	.cout(BRGout),
	.preset(~UxRXIF),
	.cnt_num(cnt_num),
	.N(N));
	parameter w = `delay*10;
	ring_osil #(3,`delay)osil(ring_en, clk0);
	initial begin
		tf_set = 1;
		UxRX = 1;
		ABAUD = 0;
		k = 2'b01;
		ring_en = 0;
		#w;
		ring_en = 1;
		tf_set = 0;
		ABAUD = 1;
		#100000;
		UxRX = 0;
		#50000;
		UxRX = 1;
		#50000;
		UxRX = 0;
		#50000;
		UxRX = 1;
		#50000;
		UxRX = 0;
		#50000;
		UxRX = 1;
		#50000;
		UxRX = 0;
		#50000;
		UxRX = 1;
		#50000;
		UxRX = 0;
		#50000;
		UxRX = 1;
		ABAUD = 0;
		#500000000;
		$stop;
	end

endmodule

module TFlioFlop(input t, clk, preset, output reg o);
	always @(posedge clk, posedge preset) begin
		if (preset)
			o <= 1;
		else if(t)
			o <= ~o;
	end
endmodule

module MUX(input k, input [3 : 0] in, output out);
	assign out = in[k];
endmodule