// This program was cloned from: https://github.com/adumont/hrm-cpu
// License: GNU General Public License v3.0

`ifndef __TOP_MODULE__
`define __TOP_MODULE__

`default_nettype none

// Use of `define allows override from iverilog using -Dkey=value
`ifndef PROGRAM
`define PROGRAM "dummy_prg.hex"
`endif

`ifndef ROMFILE
`define ROMFILE "dummy_ram.hex"
`endif

module top (
        input  wire       clk,    // System clock.

        input  wire       RX,
        output wire       TX,

        `ifdef BOARD_HAVE_BUTTONS
        input  wire       sw1,    // board button 1
        input  wire       sw2,    // board button 2
        `endif
        output wire [7:0] leds    // board leds
    );

    localparam baudsDivider=24'd104;

    initial begin
        // will dump parameters values in the yosys log
        $display("PARAM PROGRAM: %s",`PROGRAM);
        $display("PARAM ROMFILE: %s",`ROMFILE);
    end

    `ifdef BOARD_HAVE_BUTTONS
    wire sw1_d; // pulse when sw pressed
    wire sw1_u; // pulse when sw released
    wire sw1_s; // sw state
    debouncer db_sw1 (.clk(clk), .PB(sw1), .PB_down(sw1_d), .PB_up(sw1_u), .PB_state(sw1_s));
    `endif

    // Assign top Module Output
    assign TX = tx_o_uart_tx;
    assign leds = cpu_o_leds;

    // ---------------------------------------- //
    // HRM-CPU
    //
    // input signals
    reg        cpu_debug = 0;
    reg        cpu_hold = 0;
    reg        cpu_nxtInstr = 0;
    wire [7:0] cpu_in_data;
    wire       cpu_in_wr; // write to CPU's INBOX
    wire       cpu_out_rd;// read from CPU's OUTBOX
    wire       cpu_i_rst;
    wire [2:0] cpu_dmp_chip_select;
    wire [4:0] cpu_dmp_fifo_pos;
    // output signals
    wire       cpu_in_full;
    wire       cpu_out_empty;
    wire [7:0] cpu_out_data;
    wire [7:0] cpu_dmp_data;
    wire [7:0] cpu_o_leds;
    wire       cpu_dmp_valid;

    hrmcpu CPU (
        // input ports
        .cpu_debug(cpu_debug),
        .cpu_hold(cpu_hold),
        .cpu_nxtInstr(cpu_nxtInstr),
        .cpu_in_data(cpu_in_data),
        .cpu_in_wr(cpu_in_wr),
        .cpu_out_rd(cpu_out_rd),
        .cpu_dmp_fifo_pos(cpu_dmp_fifo_pos),
        .cpu_dmp_chip_select(cpu_dmp_chip_select),
        // output ports
        .cpu_in_full(cpu_in_full),
        .cpu_out_empty(cpu_out_empty),
        .cpu_out_data(cpu_out_data),
        .cpu_dmp_data(cpu_dmp_data),
        .cpu_dmp_valid(cpu_dmp_valid),
        .cpu_o_leds(cpu_o_leds),
        // clk, rst
        .clk(clk),
        .i_rst(cpu_i_rst)
    );
    defparam CPU.PROGRAM = `PROGRAM;
    defparam CPU.ROMFILE = `ROMFILE;
    // Connect inputs
    assign cpu_in_data = rx_o_data;
    assign cpu_in_wr = rx_o_wr;
    assign cpu_out_rd = txctl_o_pop_value;
    // assign cpu_dmp_chip_select = ; // TODO: connect
    // assign cpu_dmp_fifo_pos = ; // TODO: connect

    `ifdef BOARD_HAVE_BUTTONS
    assign cpu_i_rst = sw1_d || !reset_n;
    `else
    assign cpu_i_rst = !reset_n;
    `endif
    // ---------------------------------------- //

    // ---------------------------------------- //
    // Power-Up Reset
    // reset_n low for (2^reset_counter_size) first clocks
    wire reset_n;

    localparam reset_counter_size = 6;
    reg [(reset_counter_size-1):0] reset_reg = 0;

    always @(posedge clk)
        reset_reg <= reset_reg + { {(reset_counter_size-1) {1'b0}} , !reset_n};

    assign reset_n = &reset_reg;
    // ---------------------------------------- //

    // ---------------------------------------- //
    // UART-RX
    //
    // input ports
    wire       rx_i_uart_rx;
    // output ports
    wire       rx_o_wr;
    wire [7:0] rx_o_data;
    rxuartlite #(.CLOCKS_PER_BAUD(baudsDivider)) rx (
        .i_clk(clk),
        .i_uart_rx(rx_i_uart_rx),
        .o_wr(rx_o_wr),
        .o_data(rx_o_data)
    );
    // Connect inputs
    assign rx_i_uart_rx = RX;
    // ---------------------------------------- //

    // ---------------------------------------- //
    // UART-TX
    //
    // input ports
    wire       tx_i_wr;
    wire [7:0] tx_i_data;
    // output ports
    wire       tx_o_uart_tx;
    wire       tx_o_busy;

    txuartlite #(.CLOCKS_PER_BAUD(baudsDivider)) tx (
        .i_clk(clk),
        .i_wr(tx_i_wr),
        .i_data(tx_i_data),
        .o_uart_tx(tx_o_uart_tx),
        .o_busy(tx_o_busy)
    );
    // Connect inputs
    assign tx_i_wr = txctl_o_pop_value;
    assign tx_i_data = cpu_out_data;
    // ---------------------------------------- //

    // ---------------------------------------- //
    // out2txCtl
    //
    // input ports
    wire       txctl_i_empty_n;
    wire       txctl_i_busy_n;
    // output ports
    wire       txctl_o_pop_value;

    out2txCtl txctl (
        .clk(clk),
        .i_empty_n(txctl_i_empty_n),
        .i_busy_n(txctl_i_busy_n),
        .o_pop_value(txctl_o_pop_value)
    );
    // Connect inputs
    assign txctl_i_empty_n = ~cpu_out_empty;
    assign txctl_i_busy_n = ~tx_o_busy;
    // ---------------------------------------- //

endmodule

module out2txCtl (
        input wire       clk,
        input wire       i_empty_n, // Outbox not empty
        input wire       i_busy_n,  // TX not busy
        output reg       o_pop_value
    );
    initial o_pop_value = 0;

    always @(posedge clk)
    begin
        o_pop_value <= 1'b 0;

        if( i_empty_n && i_busy_n && ~o_pop_value )
        begin
            o_pop_value <= 1'b 1;
        end
    end

endmodule
`endif // __TOP_MODULE__
