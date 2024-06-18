// This program was cloned from: https://github.com/katherinezhao02/karatroc-hsm
// License: MIT License

`timescale 1 ns / 1 ps

module ram #(
    parameter ADDR_BITS = 10,
    parameter FILENAME = "ram.mem"
) (
    input clk,
    input resetn,
    input valid,
    input [31:0] addr,
    input [31:0] din,
    input [3:0] wstrb,
    output [31:0] dout,
    output ready
);

wire [ADDR_BITS-3:0] idx = addr[ADDR_BITS-1:2];
reg [31:0] ram [(2**(ADDR_BITS-2))-1:0];

wire [31:0] din_masked = {wstrb[3] ? din[31:24] : ram[idx][31:24],
    wstrb[2] ? din[23:16] : ram[idx][23:16],
    wstrb[1] ? din[15:8] : ram[idx][15:8],
    wstrb[0] ? din[7:0] : ram[idx][7:0]};

always @(posedge clk) begin
    if (resetn && valid && wstrb != 4'b0000) begin
        ram[idx] <= din_masked;
    end
end

assign dout = ram[idx];
assign ready = valid; // always ready

endmodule
