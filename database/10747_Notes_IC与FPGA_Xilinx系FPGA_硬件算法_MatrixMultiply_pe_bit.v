// This program was cloned from: https://github.com/redlightASl/Notes
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
// `include "multip_adder.v"

module pe_bit#(
           parameter BITWIDTH = 8,
           parameter IS_BITWIDTH_DOUBLE_SCALE = 1
       )(
           input wire clk,
           input wire rst_n,
           input wire en,
           input wire signed [BITWIDTH - 1: 0] in_a,
           input wire signed [BITWIDTH - 1: 0] in_b,
           output reg signed [BITWIDTH - 1: 0] out_a_delay, //1 clk delay
           output reg signed [BITWIDTH - 1: 0] out_b_delay, //1 clk delay
           output wire signed [BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1) - 1: 0] result //1 clk delay
       );
reg signed [BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1) - 1: 0] product_acc;
wire signed [BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1) - 1: 0] product;

assign result = product_acc;

multip_adder #(
                 .BITWIDTH ( BITWIDTH ),
                 .IS_BITWIDTH_DOUBLE_SCALE(IS_BITWIDTH_DOUBLE_SCALE)
                 )
             u_multip_adder(
                 //ports
                 .in_a ( in_a ),
                 .in_b ( in_b ),
                 .in_c ( product_acc ),
                 .product ( product )
             );

//delay
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        product_acc <= {(BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1)){1'b0}};
        out_a_delay <= {BITWIDTH{1'b0}};
        out_b_delay <= {BITWIDTH{1'b0}};
    end
    else begin
        if (en) begin
            product_acc <= product;
            out_a_delay <= in_a;
            out_b_delay <= in_b;
        end
        else begin
            product_acc <= product_acc;
            out_a_delay <= out_a_delay;
            out_b_delay <= out_b_delay;
        end
    end
end

endmodule
