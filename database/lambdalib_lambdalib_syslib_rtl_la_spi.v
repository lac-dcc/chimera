// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

/*****************************************************************************
 * Function: SPI Interface
 * Copyright: Lambda Project Authors. All rights Reserved.
 * License:  MIT (see LICENSE file in Lambda repository)
 *
 * Docs:
 *
 ****************************************************************************/

module la_spi #(
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
    input           hostmode,           // peripheral operates in host mode
    output          irq,                // interrupt
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
    input           spi_sck_in,         // serial clock
    output          spi_sck_out,
    output          spi_sck_oe,
    input           spi_csn_in,         // chip select (active low)
    output          spi_csn_out,
    output          spi_csn_oe,
    input           spi_sd_in,          // serial data
    output          spi_sd_out,
    output          spi_sd_oe
);

    assign spi_sck_oe = hostmode ? 1'b1 : 1'b0;
    assign spi_csn_oe = hostmode ? 1'b1 : 1'b0;
    assign spi_sd_oe  = hostmode ? 1'b1 : 1'b0;

endmodule  // la_spi
