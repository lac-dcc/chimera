// This program was cloned from: https://github.com/sep-81/Digital-Logic-Design-Lab-Experiments
// License: MIT License

`define zero 4'b0
`define one 4'b0001
`define	two 4'b0010 
`define	three 4'b0011
`define	four 4'b0100
`define five 4'b0101
`define	six 4'b0110 
`define	seven 4'b0111 
`define	eight 4'b1000
`define	nine 4'b1001 
`define	ten 4'b1010 
`define	eleven 4'b1011 

module Controller(ABAUD,
 	UxRX,
	BRGCLK,
	UxRXIF,
	ld_en,
	cnt_rst,
	cnt_en);
	input ABAUD, UxRX, BRGCLK;
	output UxRXIF, ld_en, cnt_rst, cnt_en;
	reg [3 : 0] ps;
	reg [3 : 0] ns;
	assign ld_en = (ps == 4'b1011);
	assign cnt_en = (ps == 4'b0011) | (ps == 4'b0100) | (ps == 4'b0101) | (ps == 4'b0110) | (ps == 4'b0111) |
			(ps == 4'b1000) | (ps == 4'b1001) | (ps == 4'b1010);
	assign cnt_rst = (ps == 4'b0001);
	assign UxRXIF = (ps == 4'b1011);
	always @(ps, ABAUD, UxRX)
	begin
		ns = 0;
		case (ps)
			`zero : ns = ABAUD ? `one : `zero;
			`one : ns = UxRX ? `one : `two;
			`two : ns = UxRX ? `three : `two;
			`three : ns = UxRX ? `three : `four;
			`four : ns = UxRX ? `five : `four;
			`five : ns = UxRX ? `five : `six;
			`six : ns = UxRX ? `seven : `six;
			`seven : ns = UxRX ? `seven : `eight;
			`eight : ns = UxRX ? `nine : `eight;
			`nine : ns = UxRX ? `nine : `ten;
			`ten : ns = UxRX ? `eleven : `ten;
			`eleven : ns = 4'b0;
			default : ns = 4'b0;
		endcase
	end
	always @(posedge BRGCLK) begin
		ps <= ns;
		
	end
endmodule