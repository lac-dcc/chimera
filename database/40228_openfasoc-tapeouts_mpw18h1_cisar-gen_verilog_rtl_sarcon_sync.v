// This program was cloned from: https://github.com/idea-fasoc/openfasoc-tapeouts
// License: Apache License 2.0

`timescale 1ns/1ps
// SAR Controller - Fully Synchronized version.
// The sr_dly register is introduced to avoid using asynchronous DFF control
// Making it more friendly to the synthesis tools
module sarcon_sync #(
    parameter N = 8
)(
    input          rst_n,   // synchronous
    input          clk,     //
    input          comp,
    output [N-1:0] dq,
    output         valid,
    output         last_cycle
);
    genvar gi;
    reg [N-1:0] dr;
    reg [N-1:0] sr;
    reg [N-1:0] sr_dly;
    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) begin
            sr     <= {1'b1,{(N-1){1'b0}}};
            sr_dly <= {N{1'b0}};
        end else begin
            sr     <= {1'b0,sr[N-1:1]};
            sr_dly <= sr;
        end
    end
    generate
        for(gi=0;gi<N;gi=gi+1) begin: gen_datareg
            always @(posedge clk or negedge rst_n) begin
                if(~rst_n)          dr[gi] <= 1'b0;
                else if(sr[gi])     dr[gi] <= 1'b1;
                else if(sr_dly[gi]) dr[gi] <= comp;
                else                dr[gi] <= dr[gi];
            end
        end
    endgenerate

    assign last_cycle = sr[0];
    assign valid      = sr_dly[0];
    assign dq = dr;

endmodule /* sarcon_sync */
