// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

/*****************************************************************************
 * Function: UART interface
 * Copyright: Lambda Project Authors. All rights Reserved.
 * License:  MIT (see LICENSE file in Lambda repository)
 *
 * Docs:
 *
 ****************************************************************************/

module la_uart #(
    parameter TARGET = "DEFAULT",  // technology target
    parameter PROP   = "HOST",     // block selector
    parameter RW     = 32,         // register width
    parameter DW     = 128,        // umi packet width
    parameter AW     = 64,         // address width
    parameter CW     = 32          // command width
) (  // basic control signals
    input           clk,                // core clock
    input           nreset,             // active low async reset
    input  [RW-1:0] ctrl,               // free form ctrl inputs
    output [RW-1:0] status,             // free form status outputs
    output          irq,                // interrupt request
    // UMI access
    input           udev_req_valid,
    input  [CW-1:0] udev_req_cmd,
    input  [AW-1:0] udev_req_dstaddr,
    input  [AW-1:0] udev_req_srcaddr,
    input  [DW-1:0] udev_req_data,
    output          udev_req_ready,
    output          udev_resp_valid,
    output [CW-1:0] udev_resp_cmd,
    output [AW-1:0] udev_resp_dstaddr,
    output [AW-1:0] udev_resp_srcaddr,
    output [DW-1:0] udev_resp_data,
    input           udev_resp_ready,
    // uart interface
    input           uart_rx,            // data from io
    output          uart_tx,            // data to io
    input           uart_cts_in,        // clear to send
    output          uart_cts_out,       //
    input           uart_dtr_in,        // data terminal  ready
    output          uart_dtr_out        //
);

endmodule  // la_uart
