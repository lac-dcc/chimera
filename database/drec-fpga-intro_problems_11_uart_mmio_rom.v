// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module rom #(parameter ADDR_WIDTH = 3, parameter WIDTH = 32, parameter FILE = "")(
    input [ADDR_WIDTH - 1:0]addr,
    input clk,
    output reg [WIDTH - 1:0]q
);

initial
    q = 0;

reg [WIDTH - 1:0]mem[2**ADDR_WIDTH - 1:0];

initial begin
    $readmemh(FILE, mem);
end

always @(posedge clk) begin
    q <= mem[addr];
end

endmodule

