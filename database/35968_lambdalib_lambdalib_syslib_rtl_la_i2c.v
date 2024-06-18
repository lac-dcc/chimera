// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

/*****************************************************************************
 * Function: I2C interface
 * Copyright: Lambda Project Authors. All rights Reserved.
 * License:  MIT (see LICENSE file in Lambda repository)
 *
 * Docs:
 *
 * Firmware configurable as host or device.
 *
 ****************************************************************************/

module la_i2c #(
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
    // inputs
    input           i2c_scl_in,
    input           i2c_sda_in,
    // outputs
    output          i2c_scl_out,
    output          i2c_sda_out,
    // output enable
    output          i2c_scl_oe,
    output          i2c_sda_oe
);

    generate
        if (PROP == "HOST") begin
            assign i2c_scl_oe = 1'b1;
        end else begin
            assign i2c_scl_oe = 1'b0;
        end
    endgenerate

endmodule  // la_i2c
