// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

`default_nettype none
`define UNIT_DELAY #1
`define FUNCTIONAL
`include "libs.ref/sky130_fd_sc_hd/verilog/primitives.v"
`include "libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v"

module test_scan_controller_tb(
    input wire clk,
    input wire reset,

    input wire [1:0] driver_sel,
    input wire [8:0] active_select,
    input wire [7:0] inputs,
    input wire set_clk_div,
    output wire [7:0] outputs,
    output wire ready,
    output wire slow_clk
);

    // signals for user_project_wrapper
    wire [`MPRJ_IO_PADS-1:0] io_in;
    wire [`MPRJ_IO_PADS-1:0] io_out;
    wire [`MPRJ_IO_PADS-1:0] io_oeb;

    // map inputs to user_project_wrapper signals
    assign io_in[20:12] = active_select;
    assign io_in[28:21] = inputs;
    assign io_in[11]    = set_clk_div;
    assign io_in[9:8]  = driver_sel;
    assign outputs = io_out[36:29];
    assign ready = io_out[37];
    assign slow_clk = io_out[10];

    // 7 seg signals
    wire [6:0] seven_seg = outputs[6:0];

    `ifdef COCOTB
    initial begin
        $dumpfile ("test_scan_controller.vcd");
        $dumpvars (0, test_scan_controller_tb);
        #1;
    end
    `endif

    user_project_wrapper user_project_wrapper(
    `ifdef GL_TEST
        .vccd1( 1'b1),
        .vssd1( 1'b0),
    `endif
        .wb_clk_i   (clk),
        .wb_rst_i   (reset),
        .io_in      (io_in),
        .io_out     (io_out),
        .io_oeb     (io_oeb));

endmodule
