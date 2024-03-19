`timescale 1ns/1ps
module mac #(
parameter LEN = 8)(
  in1,
  in2,
  preResult,
  out,
  overflow,
  done
);
  //--------------------------------------------------------------------------------------
  

  //--------------------------------------------------------------------------------------
  input  signed [LEN - 1: 0]    in1;
  input  signed [LEN - 1: 0]    in2;
  input  signed [LEN - 1: 0]    preResult;
  output signed [2*LEN - 1: 0]  out;
  output                        overflow;
  output                        done;

  //--------------------------------------------------------------------------------------
  //wire[2 * LEN - 1: 0] imm1;
  //wire imm2;

	wire [2*LEN - 1:0] in1_imm;
	wire [2*LEN - 1:0] in2_imm;
	wire [2*LEN - 1:0] preResult_imm;
	
	assign in1_imm = { {LEN{in1[LEN-1]}}, in1 };
	//assign in1_imm[LEN - 1 : 0] = in1;

	assign in2_imm = { {LEN{in2[LEN-1]}}, in2 };
	//assign in2_imm[LEN - 1 : 0] = in2;
	
	assign preResult_imm = { {LEN{preResult[LEN-1]}}, preResult};
	//assign preResult_imm[LEN - 1 : 0] = preResult;

  //assign out = in1_imm * in2_imm + preResult_imm;
  assign out = in1 * in2 + preResult;
  assign done = 1;

  //--------------------------------------------------------------------------------------
	//assign imm2  = |{imm1[2*LEN:LEN]}; 
	//assign out = imm2 ? ((1 << LEN) - 1) : imm1[LEN - 1: 0];

endmodule
