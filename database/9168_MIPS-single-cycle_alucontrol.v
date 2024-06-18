// This program was cloned from: https://github.com/the-pinbo/MIPS-single-cycle
// License: MIT License

module alucontrol(
	input [1:0] AluOp,
	input [5:0] FnField, // for R-type instructions
	output reg [3:0] AluCtrl
	);
	/*
	AluOp : 00 (lw/sw)
	AluOp : 01 (beq)
	AluOp : 10 (R-type)
	*/
	always@(AluOp or FnField) begin
		casex({AluOp,FnField})
			8'b00_xxxxxx:AluCtrl=4'b0010; // lw/sw
			8'b01_xxxxxx:AluCtrl=4'b0110; // beq
			// R - type
			8'b1x_xx0000:AluCtrl=4'b0010; // add
			8'b1x_xx0010:AluCtrl=4'b0110; // sub
			8'b1x_xx0100:AluCtrl=4'b0000; // and
			8'b1x_xx0101:AluCtrl=4'b0001; // or
			8'b1x_xx1010:AluCtrl=4'b0111; // slt
		endcase
	end

endmodule
