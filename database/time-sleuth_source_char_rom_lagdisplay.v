// This program was cloned from: https://github.com/chriz2600/time-sleuth
// License: MIT License

module lagdisplay(
    input clock,
    input [3:0] addr,
    output [WIDTH-1:0] q
);
    parameter WIDTH = 512;

    reg [WIDTH-1:0] q_reg;
    reg [WIDTH-1:0] q_reg_2;

    always @(posedge clock) begin
        `include "font/predef/lagdisplay.v";
        q_reg_2 <= q_reg;
    end

    assign q = q_reg_2;

endmodule 
