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

module to_driver_sd_avs(
                        input wire         clk_sys,
                        input wire         rst,
                        input wire         ao486_rst,

                        // input hdd_avalon_master
                        input wire [31:0]  hdd_avalon_master_address,
                        input wire         hdd_avalon_master_read,
                        output wire [31:0] hdd_avalon_master_readdata,
                        input wire         hdd_avalon_master_write,
                        input wire [31:0]  hdd_avalon_master_writedata,
                        output wire        hdd_avalon_master_waitrequest,
                        output reg         hdd_avalon_master_readdatavalid,

                        // input bios_loader
                        input wire [31:0]  bios_loader_address,
                        input wire         bios_loader_read,
                        output wire [31:0] bios_loader_readdata,
                        input wire         bios_loader_write,
                        input wire [31:0]  bios_loader_writedata,
                        output wire        bios_loader_waitrequest,
                        input wire [3:0]   bios_loader_byteenable,

                        // output driver_sd_avs
                        output wire [1:0]  driver_sd_avs_address,
                        output wire        driver_sd_avs_read,
                        input wire [31:0]  driver_sd_avs_readdata,
                        output wire        driver_sd_avs_write,
                        output wire [31:0] driver_sd_avs_writedata
                        );

    assign driver_sd_avs_address   = (~ao486_rst) ? hdd_avalon_master_address[3:2] : bios_loader_address[3:2];
    assign driver_sd_avs_read      = (~ao486_rst) ? hdd_avalon_master_read : bios_loader_read && bios_loader_address[31:4] == 28'h0;
    assign driver_sd_avs_write     = (~ao486_rst) ? hdd_avalon_master_write : bios_loader_write && bios_loader_address[31:4] == 28'h0;
    assign driver_sd_avs_writedata = (~ao486_rst) ? hdd_avalon_master_writedata : bios_loader_writedata;

    assign hdd_avalon_master_readdata = (~ao486_rst) ? driver_sd_avs_readdata : 0;
    assign hdd_avalon_master_waitrequest = 0;
    always @(posedge clk_sys) hdd_avalon_master_readdatavalid <= (~ao486_rst) ? driver_sd_avs_read : 0;

    assign bios_loader_readdata = (~ao486_rst) ? 0 : driver_sd_avs_readdata;
    assign bios_loader_waitrequest = 0;

endmodule
