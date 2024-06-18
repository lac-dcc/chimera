// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

/*****************************************************************************
 * Function: JTAG debug interface (device)
 * Copyright: Lambda Project Authors. All rights Reserved.
 * License:  MIT (see LICENSE file in Lambda repository)
 *
 * Docs:
 *
 ****************************************************************************/


module la_jtag #(
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
    input           jtag_tck_in,
    input           jtag_tms_in,
    input           jtag_trst_in,
    input           jtag_tdi_in,
    input           jtag_tdo_in,
    // outputs
    output          jtag_tck_out,
    output          jtag_tms_out,
    output          jtag_trst_out,
    output          jtag_tdi_out,
    output          jtag_tdo_out,
    // output enable
    output          jtag_tck_oe,
    output          jtag_tms_oe,
    output          jtag_trst_oe,
    output          jtag_tdi_oe,
    output          jtag_tdo_oe
);

    generate
        if (PROP == "HOST") begin
            assign jtag_tms_oe  = 1'b1;
            assign jtag_trst_oe = 1'b1;
            assign jtag_tdi_oe  = 1'b1;
            assign jtag_tck_oe  = 1'b1;
            assign jtag_tdo_oe  = 1'b0;
        end else begin
            assign jtag_tms_oe  = 1'b0;
            assign jtag_trst_oe = 1'b0;
            assign jtag_tdi_oe  = 1'b0;
            assign jtag_tck_oe  = 1'b0;
            assign jtag_tdo_oe  = 1'b1;
        end
    endgenerate

endmodule  // la_jtag
