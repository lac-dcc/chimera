// This program was cloned from: https://github.com/idea-fasoc/openfasoc-tapeouts
// License: Apache License 2.0

`timescale 1ns/1ps
// Anderson's SAR Control Logic
// A.L. 2022-12-11
module sarcon_bipolar #(
    parameter N = 8
)(
    input clk, 
    input rst_n, 
    input comp, 
    output [N-1:0] dq,
    output [N-1:0] dqn,
    output [N-1:0] dqn_cm,
    output valid
);

    reg [N-1:0] sr;
    assign dqn_cm = ~sr;
    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) sr <= {N{1'b0}};
        else       sr <= {sr, 1'b1};
    end

    reg [N-1:0] dr;
    assign dq  = dr;
    assign dqn = ~dr;
    genvar gi;
    generate 
        for(gi=0;gi<N;gi=gi+1) begin: gen_datareg
            always @(posedge sr[N-1-gi] or negedge rst_n) begin
                if(~rst_n) dr[gi] <= 1'b0;
                else       dr[gi] <= comp;
            end
        end
    endgenerate

endmodule /* sarcon_bipolar */
