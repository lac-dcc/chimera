// This program was cloned from: https://github.com/DaveBerkeley/serv_soc
// License: MIT License


`default_nettype none

module uart_tx(
    input wire ck,
    input wire baud_ck,
    input wire [7:0] in,
    input wire we,
    output reg ready,
    output reg tx
);

    reg [9:0] shift = 10'h3ff;
    reg [3:0] count = 0;

    initial ready = 1;
    initial tx = 1;

    always @(posedge ck) begin

        if (baud_ck) begin
            shift <= { 1'b1, shift[9:1] };
            if (count != 0) begin
                count <= count - 1;
            end

            ready <= count == 0;
            tx <= shift[0];
        end

        if (we & ready) begin
            shift <= { 1'b1, in, 1'b0 };
            count <= 9;
            ready <= 0;
        end

    end

endmodule

   /*
    *
    */

module uart_baud
    #(parameter DIVIDE=16)
    (input wire ck, 
    output reg baud_ck
);

    localparam WIDTH = $clog2(DIVIDE);
    reg [(WIDTH-1):0] baud = 0;

    initial baud_ck = 0;

    always @(posedge ck) begin
        /* verilator lint_off WIDTH */
        if (baud == (DIVIDE - 1)) begin
            baud <= 0;
            baud_ck <= 1;
        end else begin
            baud <= baud + 1;
            baud_ck <= 0;
        end
        /* verilator lint_on WIDTH */
    end

endmodule

   /*
    *
    */

module uart
    #(parameter ADDR=0, AWIDTH=8)
    (
    // cpu bus
    input wire wb_clk,
    input wire wb_rst,
    /* verilator lint_off UNUSED */
    input wire [31:0] wb_dbus_adr,
    input wire [31:0] wb_dbus_dat,
    input wire [3:0] wb_dbus_sel,
    /* verilator lint_on UNUSED */
    input wire wb_dbus_we,
    input wire wb_dbus_cyc,
    output wire [31:0] rdt,
    output wire ack,
    // IO
    input wire baud_en,
    output wire tx,
    output wire busy
);

    wire cyc;
    wire uart_ready;
    wire cs_ack;
    reg  ready = 0;

    chip_select #(.ADDR(ADDR), .WIDTH(AWIDTH))
        cs_uart (
        .wb_ck(wb_clk), 
        .addr(wb_dbus_adr[31:31-7]), 
        .wb_cyc(wb_dbus_cyc), 
        .wb_rst(wb_rst),
        .ack(cs_ack), 
        .cyc(cyc)
    );    

    uart_tx uart(
        .ck(wb_clk),
        .baud_ck(baud_en),
        .in(wb_dbus_dat[7:0]),
        .we(cyc & wb_dbus_we),
        .ready(uart_ready),
        .tx(tx));

    always @(posedge wb_clk) begin

        if (cyc) begin
            // allow immeadiate ack if not busy
            ready <= uart_ready;
        end

    end

    assign rdt = 0;
    assign ack = (cyc & ready) ? cs_ack : (cyc & uart_ready);
    assign busy = !uart_ready;

endmodule


