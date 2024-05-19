// This program was cloned from: https://github.com/DaveBerkeley/serv_soc
// License: MIT License


module gpio
    #(parameter ADDR=0, AWIDTH=8)
    (
    // cpu bus
    input wire wb_clk,
    input wire wb_rst,
    /* verilator lint_off UNUSED */
    input [31:0] wb_dbus_adr,
    input [31:0] wb_dbus_dat,
    input [3:0] wb_dbus_sel,
    /* verilator lint_on UNUSED */
    input wb_dbus_we,
    input wb_dbus_cyc,
    output wire [31:0] rdt,
    output wire ack,
    // IO
    output reg [7:0] gpio
);

    wire cyc;

    initial gpio = 0;

    chip_select #(.ADDR(ADDR), .WIDTH(AWIDTH))
        cs_gpio (
        .wb_ck(wb_clk), 
        .addr(wb_dbus_adr[31:31-7]), 
        .wb_cyc(wb_dbus_cyc), 
        .wb_rst(wb_rst),
        .ack(ack), 
        .cyc(cyc)
    );

    always @(posedge wb_clk) begin
        if (cyc) begin
            if (wb_dbus_we)
                gpio <= wb_dbus_dat[7:0];
        end
    end

    assign rdt = cyc ? { 24'h0, gpio } : 32'h0;

endmodule

