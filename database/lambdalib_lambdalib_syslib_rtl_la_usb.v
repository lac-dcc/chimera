// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

/*****************************************************************************
 * Function: USB Interface
 * Copyright: Lambda Project Authors. All rights Reserved.
 * License:  MIT (see LICENSE file in Lambda repository)
 *
 * Docs:
 *
 ****************************************************************************/
module la_usb #(
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
    // low/full speed
    input           usb_oen,            // output enable for bidir signals
    output          usb_dp_out,         // data output (pos)
    output          usb_dn_out,         // data output (neg)
    input           usb_dp_in,          // data input (pos)
    input           usb_dn_in,          // data input (pos)
    input           usb_id,             // indicates initial usb role for otg
    // ulpi
    input           ulpi_clk,           // clock from PHY
    input           ulpi_dir,           // data direction control from PHY
    input           ulpi_nxt,           // nxt throttle
    output          ulpi_stp,           // end of packet from link
    input  [   7:0] ulpi_data_in,       // data bus
    output [   7:0] ulpi_data_out,
    output          ulpi_oen            // output enable for bidir signals
);



endmodule  // la_usb
