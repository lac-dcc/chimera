// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input [3:0] a,
    input [3:0] b,
    input [3:0] c,
    input [3:0] d,
    input [3:0] e,
    output [3:0] q );
    always @(*) begin
        case (c) 
            4'h0: begin q <= b; end
            4'h1: begin q <= e; end
            4'h2: begin q <= a; end
            4'h3: begin q <= d; end
            default: q <= 4'hf;
        endcase
    end
endmodule

