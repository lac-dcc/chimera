// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module rom #(parameter LENGTH = 8, parameter WIDTH = 32)(
    input [WIDTH - 1:0]addr,
    input clk,
    output reg [WIDTH - 1:0]q
);

reg [WIDTH - 1:0]mem[LENGTH - 1:0];

initial begin
    $readmemh("program.txt", mem);
end

always @(posedge clk) begin
    q <= mem[addr];
end

endmodule

// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

module rom #(parameter LENGTH = 8, parameter WIDTH = 32)(
    input [WIDTH - 1:0]addr,
    input clk,
    output reg [WIDTH - 1:0]q
);

reg [WIDTH - 1:0]mem[LENGTH - 1:0];

initial begin
    $readmemh("program.txt", mem);
end

always @(posedge clk) begin
    q <= mem[addr];
end

endmodule

