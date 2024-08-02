// This program was cloned from: https://github.com/DaveBerkeley/serv_soc
// License: MIT License


   /*
    *   iBus Arbitration
    */

module bus_arb(
    input wire wb_clk,
    // Device A
    input wire a_cyc,
    input wire [31:0] a_adr,
    output wire a_ack,
    output wire [31:0] a_rdt,
    // Device B
    input wire b_cyc,
    input wire [31:0] b_adr,
    output wire b_ack,
    output wire [31:0] b_rdt,
    // Controlled Device
    output wire x_cyc,
    output wire [31:0] x_adr,
    input wire x_ack,
    input wire [31:0] x_rdt,
    output wire busy
);

    /* verilator lint_off UNUSED */
    wire x_we;
    wire [3:0] x_sel;
    wire [31:0] x_dat;
    /* verilator lint_on UNUSED */

    ram_arb #(.WIDTH(32))
    arb
    (
        .wb_clk(wb_clk),
        .a_cyc(a_cyc),
        .a_adr(a_adr),
        .a_ack(a_ack),
        .a_rdt(a_rdt),
        .b_cyc(b_cyc),
        .b_adr(b_adr),
        .b_ack(b_ack),
        .b_rdt(b_rdt),
        .x_cyc(x_cyc),
        .x_adr(x_adr),
        .x_ack(x_ack),
        .x_rdt(x_rdt),
        // signals not present in ROM
        .a_we(1'b0),
        .a_sel(4'b0),
        .a_dat(32'b0),
        .b_we(1'b0),
        .b_sel(4'b0),
        .b_dat(32'b0),
        .x_we(x_we),
        .x_sel(x_sel),
        .x_dat(x_dat)
    );

    assign busy = x_cyc;

endmodule

