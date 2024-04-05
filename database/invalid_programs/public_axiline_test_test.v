module accelerator#(
    parameter INPUT_BITWIDTH = `INPUT_BITWIDTH,
    parameter BITWIDTH = `BITWIDTH,
    parameter SIZE = `SIZE
)(
input clk,
input rst_n,
input [INPUT_BITWIDTH-1:0]W_0_0,
input [INPUT_BITWIDTH-1:0]y_0_1,
input [INPUT_BITWIDTH-1:0]x_0_2,
input [INPUT_BITWIDTH-1:0]sub_x_0_3,
input [INPUT_BITWIDTH-1:0]Const_0_4,
output [BITWIDTH-1:0]op_sgd_6
);
wire[BITWIDTH-1:0]sub_7;
assign sub_7=sub_x_0_3-y_0_1;
wire[BITWIDTH-1:0]mul_8;
assign mul_8=y_0_1 *osip_5;
wire gt_9;
assign gt_9=mul_8>y_0_1;
wire[BITWIDTH-1:0]mul_10;
assign mul_10=gt_9 *sub_7;
wire[BITWIDTH-1:0]mul_11;
assign mul_11=Const_0_4 *mul_10;
reg[BITWIDTH-1:0]pipe_12;
always@(posedge clk or negedge rst_n) begin
  if(~rst_n) pipe_12<=0;
  else pipe_12<=mul_11;
end
wire [BITWIDTH-1:0]osip_5;
osip#(
   .INPUT_BITWIDTH(INPUT_BITWIDTH),
   .BITWIDTH(BITWIDTH),
   .SIZE(%SIZE%)
)osip_unit(
   .w(W_0_0),
   .x(x_0_2),
   .output(osip_5)
);
wire [BITWIDTH-1:0]op_sgd_6;
op_sgd#(
   .INPUT_BITWIDTH(INPUT_BITWIDTH),
   .BITWIDTH(BITWIDTH),
   .SIZE(%SIZE%)
)sgd_unit(
   .in(pipe_12)
   .w(W_0_0),
   .x(x_0_2),
   .output(op_sgd_6)
);

endmodule;
