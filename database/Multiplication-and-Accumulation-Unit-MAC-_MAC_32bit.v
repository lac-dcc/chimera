// This program was cloned from: https://github.com/Nilesh002/Multiplication-and-Accumulation-Unit-MAC-
// License: MIT License


module mac32(
    input [31:0] a, b,
    input clk, rst,
    output reg [63:0] p,
    output reg [63:0] accumulator
);

wire [31:0] q1, q2, q3, q4;
wire [31:0] w1;
wire [47:0] w2, w3, w4;

mul16 a1(a[15:0], b[15:0], q1); // ln
mul16 a2(a[31:16], b[15:0], q2);
mul16 a3(a[15:0], b[31:16], q3);
mul16 a4(a[31:16], b[31:16], q4);

add32 g1({16'b00, q1[31:16]}, q2[31:0], w1);
add48 g2({q4[31:0], 16'b00}, {16'b00, q3[31:0]}, w2);
add48 g3(w2, {16'b00, w1[31:0]}, w4); //ej


always @(posedge clk or posedge rst) begin
    if (rst) begin
        p = 64'b0;
        accumulator = 64'b0;
    end else begin
        p = {w4[47:0],q1[15:0]};
        accumulator = accumulator + p;
    end
end

endmodule

