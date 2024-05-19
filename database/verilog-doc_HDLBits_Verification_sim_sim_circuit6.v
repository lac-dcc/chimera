// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input [2:0] a,
    output [15:0] q ); 

    always @(*) begin
        case (a)
            3'd0: q <= 16'h1232;
            3'd1: q <= 16'haee0;
            3'd2: q <= 16'h27d4;
            3'd3: q <= 16'h5a0e;
            3'd4: q <= 16'h2066;
            3'd5: q <= 16'h64ce;
            3'd6: q <= 16'hc526;
            3'd7: q <= 16'h2f19;
        endcase
    end
endmodule
