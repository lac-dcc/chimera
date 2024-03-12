module lfsr(
    input clk,

    output reg [2:0]w
);

initial w = 3'b001;

wire out = w[0];

always @(posedge clk) begin
    w[2] <= out;
    w[1] <= w[2];
    w[0] <= w[1] ^ out;
end

endmodule
