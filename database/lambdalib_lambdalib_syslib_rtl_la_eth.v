// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

/*****************************************************************************
 * Function: Ethernet Interface
 * Copyright: Lambda Project Authors. All rights Reserved.
 * License:  MIT (see LICENSE file in Lambda repository)
 *
 * Docs:
 *
 ****************************************************************************/

module la_eth #(
    parameter TARGET = "DEFAULT",  // technology target
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
    // gmii interface
    input  [   7:0] gmii_rx_data,
    input           gmii_rx_valid,
    input           gmii_rx_error,
    output          gmii_tx_clk,
    output [   7:0] gmii_tx_data,
    output          gmii_tx_enable,
    output          gmii_tx_error,
    // rgmii interface
    input  [   3:0] rgmii_rx_data,
    input           rgmii_rx_ctl,
    input           rgmii_rx_mdc,
    input           rgmii_rx_mdin,
    output          rgmii_rx_mdout,
    output          rgmii_rx_mden,
    output          rgmii_tx_clk,
    output [   3:0] rgmii_tx_data,
    output          rgmii_tx_ctl
);

endmodule  // la_eth
