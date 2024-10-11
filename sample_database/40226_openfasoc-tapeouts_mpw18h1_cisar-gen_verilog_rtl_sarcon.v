// This program was cloned from: https://github.com/idea-fasoc/openfasoc-tapeouts
// License: Apache License 2.0

`timescale 1ns/1ps
// J-S. Wang, et al., An Improved SAR Controller for DLL Applications
// A.L. 2022-12-11
module sarcell #(parameter init = 0)(
    input       rst_n,
    input       clk,
    input       a,
    input       shift,
    input       en_n,
    output reg  k
    );
    reg d;
    always @* begin
        casex ({en_n, k})
            2'b1x:      d = k;
            2'b01:      d = a;
            2'b00:      d = shift;
            default:    d = 1'bx;
        endcase
    end
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)    k <= init;
        else            k <= d;
    end
endmodule /* sarcon */
module sarcon #(parameter N = 8)(
    input          rst_n,
    input          comp,
    input          clk,
    output [N-1:0] dq,
    output         valid,
    output         last_cycle
    );
    wire [N-1:0]  en_n;
    assign last_cycle = en_n[1];
    reg term_q;
    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) term_q <= 0;
        else         term_q <= |{dq[0], term_q};
    end
    sarcell cell_0 (
        .rst_n(rst_n),
        .clk    (clk),
        .a      (comp),
        .shift  (dq[1]),
        .en_n   (en_n[0]),
        .k      (dq[0])
    );
    genvar i;
    generate
        for(i=1; i<N-1; i=i+1) begin: gen_sarcell
            sarcell cell_i (
                .rst_n(rst_n),
                .clk    (clk),
                .a      (comp),
                .shift  (dq[i+1]),
                .en_n   (en_n[i]),
                .k      (dq[i])
            );
            assign en_n[i] = |{dq[i-1], en_n[i-1]};
        end
    endgenerate
    assign en_n[N-1] = |{dq[N-1-1], en_n[N-1-1]};
    assign en_n[0] = valid;
    assign valid = term_q;
    sarcell #(1) cell_last (
        .rst_n(rst_n),
        .clk    (clk),
        .a      (comp),
        .shift  (1),
        .en_n   (en_n[N-1]),
        .k      (dq[N-1])
    );
endmodule /* sarcon */
