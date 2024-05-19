// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

/*****************************************************************************
 * Function: QSPI Interface
 * Copyright: Lambda Project Authors. All rights Reserved.
 * License:  MIT (see LICENSE file in Lambda repository)
 *
 * Docs:
 *
 * 1. Statically configurable as host/device by TYPE.

 ****************************************************************************/
module la_qspi #(
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
    input           qspi_clk_in,
    input           qspi_csn_in,
    input           qspi_io0_in,
    input           qspi_io1_in,
    input           qspi_io2_in,
    input           qspi_io3_in,
    // outputs
    output          qspi_clk_out,
    output          qspi_csn_out,
    output          qspi_io0_out,
    output          qspi_io1_out,
    output          qspi_io2_out,
    output          qspi_io3_out,
    // output enable
    output          qspi_clk_oe,
    output          qspi_csn_oe,
    output          qspi_io0_oe,
    output          qspi_io1_oe,
    output          qspi_io2_oe,
    output          qspi_io3_oe
);

    generate
        if (PROP == "HOST") begin
            assign qspi_clk_oe = 1'b1;
            assign qspi_csn_oe = 1'b1;
        end else begin
            assign qspi_clk_oe = 1'b0;
            assign qspi_csn_oe = 1'b0;
        end
    endgenerate

endmodule  // la_qspi
