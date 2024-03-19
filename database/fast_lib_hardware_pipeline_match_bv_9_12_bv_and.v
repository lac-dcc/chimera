`timescale 1ns/1ps

module bv_and(
clk,
reset,
stage_enable_in,
stage_enable_out,

bv_1,
bv_2,
bv_3,
bv_valid,
bv
);


input clk;
input reset;
input stage_enable_in;
output  stage_enable_out;

input [35:0]  bv_1;
input [35:0]  bv_2;
input [35:0]  bv_3;
output        bv_valid;
output [35:0] bv;


reg         bv_valid;
reg [35:0]  bv;

reg stage_enable_out;


always @(posedge clk or negedge reset)
begin
    if(!reset)
      begin
          stage_enable_out <= 1'b0;
          bv_valid <= 1'b0;
		  bv <= 36'b0;
      end
    else
      begin
          if(stage_enable_in == 1'b1)
            begin
                bv <= bv_1 & bv_2 & bv_3;
                bv_valid <= 1'b1;
            end
          else  bv_valid <= 1'b0;
      end
end

























endmodule


