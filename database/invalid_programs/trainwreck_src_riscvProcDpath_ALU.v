`include "riscvConst.vh"

module riscvProcDpath_Shifter
(
  input dw,
  input [3:0] fn,
  input [5:0] shamt,
  input [63:0] in,
  output [63:0] out
);

  wire left  = fn == `FN_SL  ? 1'b1
             : fn == `FN_SR  ? 1'b0
             : fn == `FN_SRA ? 1'b0
             :                 1'bx;
  wire arith = fn == `FN_SL  ? 1'b0
             : fn == `FN_SR  ? 1'b0
             : fn == `FN_SRA ? 1'b1
             :                 1'bx;
  wire trunc = fn == `FN_SR && dw == `DW_32 ? 1'b1
             : fn == `FN_SR && dw == `DW_64 ? 1'b0
             : fn == `FN_SRA                ? 1'b0
             :                                1'bx;

  wire tmp;
  wire [63:0] in_reversed, shift_out_reversed, shift_out;
  generate
    genvar i;
    for(i = 0; i < 64; i=i+1)
    begin : reverse
      assign in_reversed[i] = in[63-i];
      assign shift_out_reversed[i] = shift_out[63-i];
    end
  endgenerate

  wire [63:0] shift_in = left ? in_reversed : {{32{~trunc}}&in[63:32],in[31:0]};
  assign {tmp, shift_out} = $signed({arith & shift_in[63], shift_in}) >>> shamt;
  assign out = left ? shift_out_reversed : shift_out;

endmodule

module riscvProcDpath_ALU
(
  input dw,
  input [3:0] fn,
  input [5:0] shamt,
  input [63:0] in2,
  input [63:0] in1,
  output [63:0] out,
  output        lt,
  output        ltu
);

  wire [63:0] adder_out, shift_out;
  wire tmp;

  riscvProcDpath_Shifter shifter
  (
    .dw(dw),
    .fn(fn),
    .shamt(shamt),
    .in(in1),
    .out(shift_out)
  );

  wire sub = fn == `FN_ADD ? 1'b0
           : fn == `FN_SUB ? 1'b1
           :                 1'bx;
  assign {adder_out, tmp} = {in1, sub} + {in2 ^ {64{sub}}, sub};

  wire [63:0] out64
    = (fn == `FN_ADD || fn == `FN_SUB) ? adder_out
    : (fn == `FN_SL || fn == `FN_SR || fn == `FN_SRA) ? shift_out
    : (fn == `FN_SLT) ? {63'b0,lt}
    : (fn == `FN_SLTU) ? {63'b0,ltu}
    : (fn == `FN_AND) ? in1 & in2
    : (fn == `FN_OR) ? in1 | in2
    : (fn == `FN_XOR) ? in1 ^ in2
    : 64'bx;

  assign out
    = (dw == `DW_64) ? out64
    : (dw == `DW_32) ? {{32{out64[31]}}, out64[31:0]}
    : 64'bx;

  assign ltu = (in1 < in2);
  assign lt = (in1[63] == in2[63]) & ltu | in1[63] & ~in2[63];

endmodule
