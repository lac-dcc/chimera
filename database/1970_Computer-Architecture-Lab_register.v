// This program was cloned from: https://github.com/matahho/Computer-Architecture-Lab
// License: MIT License

module Register #(
    parameter N = 32
)(
    input clk, rst,
    input [N-1:0] in,
    input ld, clr,
    output reg [N-1:0] out
);
    always @(posedge clk) begin
        if (rst)
            out <= {N{1'b0}};
        else if (clr)
            out <= {N{1'b0}};
        else if (ld)
            out <= in;
    end
endmodule

module RegisterNegEdge #(
    parameter N = 32
)(
    input clk, rst,
    input [N-1:0] in,
    input ld, clr,
    output reg [N-1:0] out
);
    always @(negedge clk or posedge rst) begin
        if (rst)
            out <= {N{1'b0}};
        else if (clr)
            out <= {N{1'b0}};
        else if (ld)
            out <= in;
    end
endmodule
