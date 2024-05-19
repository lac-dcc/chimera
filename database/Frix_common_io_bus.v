// This program was cloned from: https://github.com/archlabo/Frix
// License: BSD 2-Clause "Simplified" License

/*
 * Copyright (c) 2015, Arch Laboratory
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

module io_bus
  (
   input wire         clk_sys,
   input wire         rst,

   // input ao486_avalon_io
   input wire [15:0]  ao486_avalon_io_address,
   output wire        ao486_avalon_io_waitrequest,
   input wire [3:0]   ao486_avalon_io_byteenable,
   input wire         ao486_avalon_io_read,
   output wire [31:0] ao486_avalon_io_readdata,
   output wire        ao486_avalon_io_readdatavalid,
   input wire         ao486_avalon_io_write,
   input wire [31:0]  ao486_avalon_io_writedata,

   // output vga_io_b, address: 0x3b0~0x3bf
   output wire [3:0]  vga_io_b_address,
   output wire        vga_io_b_write,
   output wire [7:0]  vga_io_b_writedata,
   output wire        vga_io_b_read,
   input wire [7:0]   vga_io_b_readdata,

   // output vga_io_c, address: 0x3c0~0x3cf
   output wire [3:0]  vga_io_c_address,
   output wire        vga_io_c_write,
   output wire [7:0]  vga_io_c_writedata,
   output wire        vga_io_c_read,
   input wire [7:0]   vga_io_c_readdata,

   // output vga_io_d, address: 0x3d0~0x3df
   output wire [3:0]  vga_io_d_address,
   output wire        vga_io_d_write,
   output wire [7:0]  vga_io_d_writedata,
   output wire        vga_io_d_read,
   input wire [7:0]   vga_io_d_readdata,

   // output ps2_io, address: 0x60~0x67
   output wire [2:0]  ps2_io_address,
   output wire        ps2_io_write,
   output wire [7:0]  ps2_io_writedata,
   output wire        ps2_io_read,
   input wire [7:0]   ps2_io_readdata,

   // output ps2_sysctl, address: 0x90~0x9f
   output wire [3:0]  ps2_sysctl_address,
   output wire        ps2_sysctl_write,
   output wire [7:0]  ps2_sysctl_writedata,
   output wire        ps2_sysctl_read,
   input wire [7:0]   ps2_sysctl_readdata,

   // output pit_io, address: 0x40~0x43
   output wire [1:0]  pit_io_address,
   output wire        pit_io_write,
   output wire [7:0]  pit_io_writedata,
   output wire        pit_io_read,
   input wire [7:0]   pit_io_readdata,

   // output rtc_io, address: 0x70~0x71
   output wire        rtc_io_address,
   output wire        rtc_io_write,
   output wire [7:0]  rtc_io_writedata,
   output wire        rtc_io_read,
   input wire [7:0]   rtc_io_readdata,

   // output pic_master, address: 0x20~0x21
   output wire        pic_master_address,
   output wire        pic_master_write,
   output wire [7:0]  pic_master_writedata,
   output wire        pic_master_read,
   input wire [7:0]   pic_master_readdata,

   // output pic_slave, address: 0xa0~0xa1
   output wire        pic_slave_address,
   output wire        pic_slave_write,
   output wire [7:0]  pic_slave_writedata,
   output wire        pic_slave_read,
   input wire [7:0]   pic_slave_readdata,

   // output hdd_io, address: 0x1f0, 0x1f4
   output wire        hdd_io_address,
   output wire        hdd_io_write,
   output wire [31:0] hdd_io_writedata,
   output wire        hdd_io_read,
   input wire [31:0]  hdd_io_readdata,
   output wire [3:0]  hdd_io_byteenable,

   // output ide_3f6, address: 0x3f6
   output wire        ide_3f6_write,
   output wire [7:0]  ide_3f6_writedata,
   output wire        ide_3f6_read,
   input wire [7:0]   ide_3f6_readdata

   );

    function [1:0] count_bit;
        input [3:0]   data;
        integer       i;
        begin
            count_bit = 0;
            for(i = 0; i <= 3; i = i + 1) begin
                if(data[i])
                  count_bit = count_bit + 1;
            end
        end
    endfunction

    //------------------------------------------------------------------------------------
    //------------------ ao486    --------------------------------------------------------
    //------------------------------------------------------------------------------------
    reg               vga_io_b_readdatavalid;
    always @(posedge clk_sys) vga_io_b_readdatavalid <= vga_io_b_read;

    reg               vga_io_c_readdatavalid;
    always @(posedge clk_sys) vga_io_c_readdatavalid <= vga_io_c_read;

    reg               vga_io_d_readdatavalid;
    always @(posedge clk_sys) vga_io_d_readdatavalid <= vga_io_d_read;

    reg               ps2_io_readdatavalid;
    always @(posedge clk_sys) ps2_io_readdatavalid <= ps2_io_read;

    reg               ps2_sysctl_readdatavalid;
    always @(posedge clk_sys) ps2_sysctl_readdatavalid <= ps2_sysctl_read;

    reg               pit_io_readdatavalid;
    always @(posedge clk_sys) pit_io_readdatavalid <= pit_io_read;

    reg               rtc_io_readdatavalid;
    always @(posedge clk_sys) rtc_io_readdatavalid <= rtc_io_read;

    reg               pic_master_readdatavalid;
    always @(posedge clk_sys) pic_master_readdatavalid <= pic_master_read;

    reg               pic_slave_readdatavalid;
    always @(posedge clk_sys) pic_slave_readdatavalid <= pic_slave_read;

    reg               ide_3f6_readdatavalid;
    always @(posedge clk_sys) ide_3f6_readdatavalid <= ide_3f6_read;

    reg               hdd_io_readdatavalid;
    always @(posedge clk_sys) hdd_io_readdatavalid <= hdd_io_read;

    wire [31:0]       converted_readdata;
    wire              converted_readdatavalid;

    wire [7:0]        readdata_without_hdd;
    wire              readdatavalid_without_hdd;

    reg               error_rdvalid;

    assign readdatavalid_without_hdd = vga_io_b_readdatavalid   || vga_io_c_readdatavalid   ||
                                       vga_io_d_readdatavalid   || ps2_io_readdatavalid     ||
                                       ps2_io_readdatavalid     || ps2_sysctl_readdatavalid ||
                                       pit_io_readdatavalid     || rtc_io_readdatavalid     ||
                                       pic_master_readdatavalid || pic_slave_readdatavalid  ||
                                       ide_3f6_readdatavalid    || error_rdvalid;

    assign readdata_without_hdd = (vga_io_b_readdatavalid)   ? vga_io_b_readdata   :
                                  (vga_io_c_readdatavalid)   ? vga_io_c_readdata   :
                                  (vga_io_d_readdatavalid)   ? vga_io_d_readdata   :
                                  (ps2_io_readdatavalid)     ? ps2_io_readdata     :
                                  (ps2_sysctl_readdatavalid) ? ps2_sysctl_readdata :
                                  (pit_io_readdatavalid)     ? pit_io_readdata     :
                                  (rtc_io_readdatavalid)     ? rtc_io_readdata     :
                                  (pic_master_readdatavalid) ? pic_master_readdata :
                                  (pic_slave_readdatavalid)  ? pic_slave_readdata  :
                                  (ide_3f6_readdatavalid)    ? ide_3f6_readdata  : 0;

    assign ao486_avalon_io_readdata      = (hdd_io_readdatavalid) ? hdd_io_readdata : converted_readdata;
    assign ao486_avalon_io_readdatavalid = converted_readdatavalid || hdd_io_readdatavalid;

    wire [15:0]       converted_address;
    wire [7:0]        converted_writedata;
    wire              converted_write, converted_read;

    byteen_converter #(.IADDR(16), .OADDR(16))
    byteen_converter(.clk_sys(clk_sys), .rst(rst), .addr_in(ao486_avalon_io_address), .write_in(ao486_avalon_io_write && ~hdd_io_write),
                     .writedata_in(ao486_avalon_io_writedata), .read_in(ao486_avalon_io_read && ~hdd_io_read), .byteenable_in(ao486_avalon_io_byteenable),
                     .waitrequest_out(ao486_avalon_io_waitrequest), .addr_out(converted_address), .write_out(converted_write),
                     .writedata_out(converted_writedata), .read_out(converted_read), .waitrequest_in(0), .readdata_in(readdata_without_hdd),
                     .readdatavalid_in(readdatavalid_without_hdd), .readdata_out(converted_readdata), .readdatavalid_out(converted_readdatavalid));

    //------------------------------------------------------------------------------------
    //------------------ vga_io_b --------------------------------------------------------
    //------------------------------------------------------------------------------------
    assign vga_io_b_address   = converted_address[3:0];
    assign vga_io_b_read      = (converted_address[15:4] == 12'h3b) && converted_read;
    assign vga_io_b_write     = (converted_address[15:4] == 12'h3b) && converted_write;
    assign vga_io_b_writedata = converted_writedata;

    //------------------------------------------------------------------------------------
    //------------------ vga_io_c --------------------------------------------------------
    //------------------------------------------------------------------------------------
    assign vga_io_c_address   = converted_address[3:0];
    assign vga_io_c_read      = (converted_address[15:4] == 12'h3c) && converted_read;
    assign vga_io_c_write     = (converted_address[15:4] == 12'h3c) && converted_write;
    assign vga_io_c_writedata = converted_writedata;

    //------------------------------------------------------------------------------------
    //------------------ vga_io_d --------------------------------------------------------
    //------------------------------------------------------------------------------------
    assign vga_io_d_address   = converted_address[3:0];
    assign vga_io_d_read      = (converted_address[15:4] == 12'h3d) && converted_read;
    assign vga_io_d_write     = (converted_address[15:4] == 12'h3d) && converted_write;
    assign vga_io_d_writedata = converted_writedata;

    //------------------------------------------------------------------------------------
    //------------------ ps2_io ----------------------------------------------------------
    //------------------------------------------------------------------------------------
    assign ps2_io_address   = converted_address[2:0];
    assign ps2_io_read      = (converted_address[15:4] == 12'h6) && converted_read;
    assign ps2_io_write     = (converted_address[15:4] == 12'h6) && converted_write;
    assign ps2_io_writedata = converted_writedata;

    //------------------------------------------------------------------------------------
    //------------------ ps2_sysctl ------------------------------------------------------
    //------------------------------------------------------------------------------------
    assign ps2_sysctl_address   = converted_address[3:0];
    assign ps2_sysctl_read      = (converted_address[15:4] == 12'h9) && converted_read;
    assign ps2_sysctl_write     = (converted_address[15:4] == 12'h9) && converted_write;
    assign ps2_sysctl_writedata = converted_writedata;

    //------------------------------------------------------------------------------------
    //------------------ pit_io ----------------------------------------------------------
    //------------------------------------------------------------------------------------
    assign pit_io_address   = converted_address[1:0];
    assign pit_io_read      = (converted_address[15:4] == 12'h4) && converted_read;
    assign pit_io_write     = (converted_address[15:4] == 12'h4) && converted_write;
    assign pit_io_writedata = converted_writedata;

    //------------------------------------------------------------------------------------
    //------------------ rtc_io ----------------------------------------------------------
    //------------------------------------------------------------------------------------
    assign rtc_io_address   = converted_address[0];
    assign rtc_io_read      = (converted_address[15:4] == 12'h7) && converted_read;
    assign rtc_io_write     = (converted_address[15:4] == 12'h7) && converted_write;
    assign rtc_io_writedata = converted_writedata;

    //------------------------------------------------------------------------------------
    //------------------ pic_master ------------------------------------------------------
    //------------------------------------------------------------------------------------
    assign pic_master_address   = converted_address[0];
    assign pic_master_read      = (converted_address[15:4] == 12'h2) && converted_read;
    assign pic_master_write     = (converted_address[15:4] == 12'h2) && converted_write;
    assign pic_master_writedata = converted_writedata;

    //------------------------------------------------------------------------------------
    //------------------ pic_slave -------------------------------------------------------
    //------------------------------------------------------------------------------------
    assign pic_slave_address   = converted_address[0];
    assign pic_slave_read      = (converted_address[15:4] == 12'ha) && converted_read;
    assign pic_slave_write     = (converted_address[15:4] == 12'ha) && converted_write;
    assign pic_slave_writedata = converted_writedata;

    //------------------------------------------------------------------------------------
    //------------------ hdd_io ----------------------------------------------------------
    //------------------------------------------------------------------------------------
    assign hdd_io_address    = ao486_avalon_io_address[2];
    assign hdd_io_read       = (ao486_avalon_io_address[15:4] == 12'h1f) && ao486_avalon_io_read;
    assign hdd_io_write      = (ao486_avalon_io_address[15:4] == 12'h1f) && ao486_avalon_io_write;
    assign hdd_io_writedata  = ao486_avalon_io_writedata;
    assign hdd_io_byteenable = ao486_avalon_io_byteenable;

    //------------------------------------------------------------------------------------
    //------------------ ide_3f6 ---------------------------------------------------------
    //------------------------------------------------------------------------------------
    assign ide_3f6_read      = (converted_address[15:0] == 16'h3f6) && converted_read;
    assign ide_3f6_write     = (converted_address[15:0] == 16'h3f6) && converted_write;
    assign ide_3f6_writedata = converted_writedata;

    //------------------------------------------------------------------------------------
    //------------------ error    --------------------------------------------------------
    //------------------------------------------------------------------------------------

    wire              error_read = converted_read &&
                      ~(vga_io_b_read || vga_io_c_read || vga_io_d_read || ps2_io_read || ps2_sysctl_read ||
                        pit_io_read || rtc_io_read || pic_master_read || pic_slave_read ||
                        ide_3f6_read);

    wire              error_write = converted_write &&
                      ~(vga_io_b_write || vga_io_c_write || vga_io_d_write || ps2_io_write || ps2_sysctl_write ||
                        pit_io_write || rtc_io_write || pic_master_write || pic_slave_write ||
                        ide_3f6_write);

    wire              error_cond = error_read || error_write;

    always @(posedge clk_sys) error_rdvalid <= error_read;

endmodule
