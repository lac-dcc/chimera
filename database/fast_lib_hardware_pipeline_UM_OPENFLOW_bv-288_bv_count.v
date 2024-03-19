//
//  bv_count module
//
//  bv2.0_programmable
//
//  Created by LiJunnan on 16/9/16.
//  Copyright (c) 2016year LiJunnan. All rights reserved.


`timescale 1ns/1ps


module bv_count(
reset,
clk,
bv_valid,
bv,
count,
bv_out_valid,
bv_out,
count_out
);

parameter width       = 64;
parameter width_count = 6;
parameter stage       = 1;
parameter range_end   = 1;


input reset;
input clk;
input bv_valid;
input [width-1:0] bv;
input [width_count-1:0] count;

output  reg bv_out_valid;
output  reg [width-1:0] bv_out;
output  reg [width_count-1:0] count_out;



always @ (posedge clk)begin
    if(bv_valid == 1'b1)begin
        bv_out_valid <= 1'b1;
        if(bv[range_end-1:0])begin
            bv_out <= bv;
            count_out <= count;
          end
        else begin
            bv_out <= bv >> range_end;
            count_out <= count + range_end;
          end
    end
    else begin
        bv_out_valid <= 1'b0;
        bv_out <= {width{1'b0}};
        count_out <= {width_count{1'b0}};
      end
end














endmodule
