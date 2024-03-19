
`timescale 1ns/1ps

module bv_and_8(
clk,
reset,

bv_in_valid,
bv_1,
bv_2,
bv_3,
bv_4,
bv_5,
bv_6,
bv_7,
bv_8,
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
input [35:0]  bv_5;
input [35:0]  bv_6;
input [35:0]  bv_7;
input [35:0]  bv_8;
output  reg         bv_out_valid;
output  reg [35:0]  bv_out;

always @(posedge clk or negedge reset)
begin
    if(!reset)
      begin
          bv_out <= 36'b0;
          bv_out_valid <= 1'b0;
      end
    else
      begin
          if(bv_in_valid == 1'b1)
            begin
                bv_out <= bv_1 & bv_2 & bv_3 &bv_4 & bv_5 & bv_6 & bv_7 & bv_8;
                bv_out_valid <= 1'b1;
            end
          else  bv_out_valid <= 1'b0;
      end
end













endmodule

