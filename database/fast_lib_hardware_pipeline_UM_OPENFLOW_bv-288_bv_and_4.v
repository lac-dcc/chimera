
`timescale 1ns/1ps

module bv_and_4(
clk,
reset,

bv_in_valid,
bv_1,
bv_2,
bv_3,
bv_4,
bv_out_valid,
bv_out

);

input clk;
input reset;
input bv_in_valid;
input [35:0]  bv_1;
input [35:0]  bv_2;
input [35:0]  bv_3;
input [35:0]  bv_4;
output  reg         bv_out_valid;
output  reg [63:0]  bv_out;

always @(posedge clk or negedge reset)
begin
    if(!reset)
      begin
          bv_out <= 64'b0;
          bv_out_valid <= 1'b0;
      end
    else
      begin
          if(bv_in_valid == 1'b1)
            begin
                bv_out <= {28'b0,bv_1 & bv_2 & bv_3 &bv_4};
                bv_out_valid <= 1'b1;
            end
          else  bv_out_valid <= 1'b0;
      end
end













endmodule
