// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

module sgd#(
    parameter INPUT_BITWIDTH =8,
    parameter BITWIDTH = 16,
    parameter SIZE = 10
)(
    input clk,
    input rst_n,
    input [INPUT_BITWIDTH-1:0]mu,
    input [INPUT_BITWIDTH*size-1:0] x,
    input [BITWIDTH*size-1:0] w,
    input [BITWIDTH*size-1:0] in,
    output [BITWIDTH*size-1:0]out
);
wire [BITWIDTH*size-1:0]data;
genvar i;
generate
for (i=0,j<SIZE;i=i+1)begin
assign data[BITWIDTH*i+BITWIDTH-1:BITWIDTH*i] = w[BITWIDTH*i+BITWIDTH-1:BITWIDTH*i] - mu * in[BITWIDTH*i+BITWIDTH-1:BITWIDTH*i]*x[INPUT_BITWIDTH*i+INPUT_BITWIDTH-1:INPUT_BITWIDTH*i]
end
endgenerate
always@(posedge clk or negedge rst_n) begin
    if(~rst_n) out<=0;
    else out<=data;
end
endmodule