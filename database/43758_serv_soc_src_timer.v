// This program was cloned from: https://github.com/DaveBerkeley/serv_soc
// License: MIT License


`default_nettype none

module timer 
    #(parameter INITIAL = 64'h0)
(
    input wire wb_clk,
    input wire wb_rst,
    input wire ck_en,
    input wire [31:0] wb_dbus_dat,
    /* verilator lint_off UNUSED */
    input wire [31:0] wb_dbus_adr,
    /* verilator lint_on UNUSED */
    input wire wb_dbus_we,
    input wire cyc,
    output reg irq,
    output wire [31:0] rdt
);

    reg [63:0] mtime;
    reg [63:0] mtimecmp;
    // temp registers needed to make 64-bit read/writes atomic
    reg [31:0] temp_time;
    reg [31:0] temp_cmp;

    initial begin
        irq = 0;
        mtime = INITIAL;
        mtimecmp = 0;
    end

    wire [1:0] addr;
    assign addr = wb_dbus_adr[3:2];

    always @(posedge wb_clk) begin

        if (wb_rst) begin
            mtime <= INITIAL;
            mtimecmp <= 0;
        end else if (ck_en) begin
            mtime <= mtime + 1;
        end

        irq <= (mtimecmp != 0) ? (mtime > mtimecmp) : 0;

        if (cyc & wb_dbus_we) begin
            if (addr == 2) begin
                // latch mtimecmp_lo
                temp_cmp <= wb_dbus_dat;
            end 
            if (addr == 3) begin
                // mtimecmp_hi + latched lo word
                mtimecmp[31:0]  <= temp_cmp;
                mtimecmp[63:32] <= wb_dbus_dat;
            end
        end

        if (cyc & !wb_dbus_we) begin
            if (addr == 0) begin
                // mtime_lo : latch the hi word
                temp_time <= mtime[63:32];
            end 
        end

    end

    function [31:0] read(input [1:0] reg_addr);

        begin
            case (reg_addr)
                0   :   read = mtime[31:0];
                1   :   read = temp_time;
                2   :   read = mtimecmp[31:0];
                3   :   read = mtimecmp[63:32];
            endcase
        end

    endfunction

    assign rdt = (cyc & !wb_dbus_we) ? read(addr) : 0;

endmodule

