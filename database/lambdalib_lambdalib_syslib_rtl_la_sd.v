// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

/*****************************************************************************
 * Function: SD/SDIO/MMC Controller
 * Copyright: Lambda Project Authors. All rights Reserved.
 * License:  MIT (see LICENSE file in Lambda repository)
 *
 * Docs:
 *
 ****************************************************************************/


module la_sd #(
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
    input           sd_clk_in,
    input           sd_cd_in,
    input           sd_wp_in,
    input           sd_cmd_in,
    input           sd_dat0_in,
    input           sd_dat1_in,
    input           sd_dat2_in,
    input           sd_dat3_in,
    // outputs
    output          sd_clk_out,
    output          sd_cd_out,
    output          sd_wp_out,
    output          sd_cmd_out,
    output          sd_dat0_out,
    output          sd_dat1_out,
    output          sd_dat2_out,
    output          sd_dat3_out,
    // enables
    output          sd_clk_oe,
    output          sd_cd_oe,
    output          sd_wp_oe,
    output          sd_cmd_oe,
    output          sd_dat0_oe,
    output          sd_dat1_oe,
    output          sd_dat2_oe,
    output          sd_dat3_oe
);

endmodule  // la_sd
