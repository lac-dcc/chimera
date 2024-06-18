// This program was cloned from: https://github.com/katherinezhao02/karatroc-hsm
// License: MIT License

`timescale 1 ns / 1 ps

module pwr #(
    parameter [31:0] ADDR = 32'hffff_ffff
) (
    input clk,
    input resetn,
    input mem_valid,
    input [31:0] mem_addr,
    input [31:0] mem_wdata,
    input [3:0] mem_wstrb,
    output pwr_ready,
    output pwr_sel,
    output reg poweroff_rq
);

assign pwr_sel = mem_valid && (mem_addr == ADDR);
// always ready, because we handle everything in a single cycle
assign pwr_ready = 1;

// write logic
always @(posedge clk) begin
    if (!resetn) begin
        poweroff_rq <= 0;
    end else if (pwr_sel && mem_wstrb[0]) begin
        poweroff_rq <= mem_wdata[7:0] != 0;
    end
end

endmodule
