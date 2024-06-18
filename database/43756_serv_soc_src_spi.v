// This program was cloned from: https://github.com/DaveBerkeley/serv_soc
// License: MIT License


module spi_tx(
    input wire ck,
    input wire rst,
    output wire cs,
    output wire sck,
    output wire mosi,
    input wire miso,

    input wire [7:0] code,
    input wire [23:0] addr,
    input wire tx_addr,
    input wire no_read,
    input wire req,
    output reg [31:0] rdata,
    output wire ready
);

    initial begin
        rdata = 0;
    end

    reg [31:0] tx = 32'b0;
    reg [6:0] bit_count = 0;
    wire sending;
    assign sending = bit_count != 0;

    reg clock = 0;

    function [7:0] reverse(input [7:0] d);

        begin
            reverse = { d[0], d[1], d[2], d[3], d[4], d[5], d[6], d[7] };
        end

    endfunction

    /* verilator lint_off UNUSED */
    reg [31:0] rx = 32'b0;
    /* verilator lint_on UNUSED */

    always @(posedge ck) begin

        if (rst) begin
            bit_count <= 0;
        end

        clock <= !clock;

        if (req) begin
            if (tx_addr)
                tx <= { reverse(addr[7:0]), reverse(addr[15:8]), reverse(addr[23:16]), reverse(code) };
            else
                tx <= { 24'h0, reverse(code) };

            bit_count <= 8 + (tx_addr ? 24 : 0) + (no_read ? 0 : 32);

            clock <= 0;
        end

        if (clock) begin
            if (sending) begin

                if (bit_count == 1) begin
                    rdata <= { rx[30:0], miso };
                end

                bit_count <= bit_count - 1;
                tx <= { 1'b0, tx[31:1] };
                rx <= { rx[30:0], miso };

            end
        end
    end

    assign mosi  = sending ? tx[0] : 1;
    assign sck   = sending ? clock : 0;
    assign cs    = !sending;
    assign ready = !sending;

endmodule

