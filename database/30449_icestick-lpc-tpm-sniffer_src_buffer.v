// This program was cloned from: https://github.com/SySS-Research/icestick-lpc-tpm-sniffer
// License: GNU General Public License v3.0

/*
 * iCEstick LPC TPM Sniffer (buffer.v)
 * 
 * Dual port memory
 */

module buffer #(parameter AW = 8, parameter DW = 8)(
    input wire clk,
    input wire write_clk_enable,
    input wire [DW - 1:0] write_data,
    input wire [AW - 1:0] write_addr,
    input wire read_clk_enable,
    input wire [AW - 1:0] read_addr,
    output reg [DW - 1:0] read_data
);

    // parameters
    localparam NPOS = 2 ** AW;

    // registers
    reg [DW - 1:0] ram [0:NPOS - 1];

    // synchronous logic
    always @(posedge clk)
    begin
        if (write_clk_enable)
            ram[write_addr] <= write_data;

        if (read_clk_enable)
            read_data <= ram[read_addr];
    end

endmodule
