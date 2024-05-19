// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module rom #(parameter ADDR_WIDTH = 4, parameter WIDTH = 8, parameter FILE = "")(
    input [ADDR_WIDTH - 1:0]addr,
    input clk,

    output reg [WIDTH - 1:0]q
);

initial begin
    q = 0;
end

reg [WIDTH - 1:0]mem[2**ADDR_WIDTH - 1:0];

initial begin
    $readmemb(FILE, mem);
end

always @(posedge clk) begin
    q <= mem[addr];
end

endmodule
