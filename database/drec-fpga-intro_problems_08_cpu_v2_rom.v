// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module rom #(parameter ADDR_WIDTH = 3, parameter WIDTH = 32)(
    input [ADDR_WIDTH - 1:0]addr,
    input clk,

    output reg [WIDTH - 1:0]q
);

initial begin
    q = 0;
end

reg [WIDTH - 1:0]mem[2**ADDR_WIDTH - 1:0];

initial begin
    $readmemh("samples/test_v2.txt", mem);
end

always @(posedge clk) begin
    q <= mem[addr];
end

endmodule
// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

module rom #(parameter ADDR_WIDTH = 3, parameter WIDTH = 32)(
    input [ADDR_WIDTH - 1:0]addr,
    input clk,

    output reg [WIDTH - 1:0]q
);

initial begin
    q = 0;
end

reg [WIDTH - 1:0]mem[2**ADDR_WIDTH - 1:0];

initial begin
    $readmemh("samples/test_v2.txt", mem);
end

always @(posedge clk) begin
    q <= mem[addr];
end

endmodule
