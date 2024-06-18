// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

/*****************************************************************************
 * Function: GPIO Interface
 * Copyright: Lambda Project Authors. All rights Reserved.
 * License:  MIT (see LICENSE file in Lambda repository)
 *
 * Docs:
 *
 ****************************************************************************/

module la_gpio #(
    parameter TARGET = "DEFAULT",  // technology target
    parameter PROP   = "HOST",     // block selector
    parameter RW     = 32,         // register width
    parameter DW     = 128,        // umi packet width
    parameter AW     = 64,         // address width
    parameter CW     = 32,         // command width
    parameter N      = 8           // number of GPIO
) (  // basic control signals
    input           clk,                // core clock
    input           nreset,             // active low async reset
    input  [RW-1:0] ctrl,               // free form ctrl inputs
    output [RW-1:0] status,             // free form status outputs
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
    // io interface
    input  [ N-1:0] gpio_in,            // data from IO pins
    output [ N-1:0] gpio_out,           // data to drive to IO pins
    output [ N-1:0] gpio_oe,            // output enable
    output          gpio_irq            //global gpio interrupt (or-ed)
);

endmodule  // la_gpio
