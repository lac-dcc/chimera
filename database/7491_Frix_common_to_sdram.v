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

module to_sdram
  (
   input wire         clk_sys,
   input wire         rst,
   input wire         ao486_rst,

   // input pc_bus_sdram
   input wire [31:0]  pc_bus_sdram_address,
   input wire [3:0]   pc_bus_sdram_byteenable,
   input wire         pc_bus_sdram_read,
   output wire [31:0] pc_bus_sdram_readdata,
   input wire         pc_bus_sdram_write,
   input wire [31:0]  pc_bus_sdram_writedata,
   output wire        pc_bus_sdram_waitrequest,
   output wire        pc_bus_sdram_readdatavalid,
   input wire [2:0]   pc_bus_sdram_burstcount,

   // input driver_sd_avm
   input wire [31:0]  driver_sd_avm_address,
   input wire         driver_sd_avm_read,
   output wire [31:0] driver_sd_avm_readdata,
   input wire         driver_sd_avm_write,
   input wire [31:0]  driver_sd_avm_writedata,
   output wire        driver_sd_avm_waitrequest,
   output wire        driver_sd_avm_readdatavalid,

   // output sdram_mem
   output wire [24:0] sdram_address,
   output wire [3:0]  sdram_byteenable,
   output wire        sdram_read,
   input wire [31:0]  sdram_readdata,
   output wire        sdram_write,
   output wire [31:0] sdram_writedata,
   input wire         sdram_waitrequest,
   input wire         sdram_readdatavalid,
   input wire         sdram_chipselect
   );

    wire [31:0]       burst_converted_address;
    wire              burst_converted_write;
    wire [31:0]       burst_converted_writedata;
    wire              burst_converted_read;
    wire [31:0]       burst_converted_readdata;
    wire              burst_converted_readdatavalid;
    wire [3:0]        burst_converted_byteenable;
    wire              burst_converted_waitrequest;

    burst_converter #(.IADDR(32), .OADDR(27))
    burst_converter (
                     .clk_sys           (clk_sys),
                     .rst               (rst),
                     .addr_in           (pc_bus_sdram_address),
                     .write_in          (pc_bus_sdram_write),
                     .writedata_in      (pc_bus_sdram_writedata),
                     .read_in           (pc_bus_sdram_read),
                     .readdata_out      (pc_bus_sdram_readdata),
                     .readdatavalid_out (pc_bus_sdram_readdatavalid),
                     .byteenable_in     (pc_bus_sdram_byteenable),
                     .burstcount_in     (pc_bus_sdram_burstcount),
                     .waitrequest_out   (pc_bus_sdram_waitrequest),

                     .addr_out          (burst_converted_address),
                     .write_out         (burst_converted_write),
                     .writedata_out     (burst_converted_writedata),
                     .read_out          (burst_converted_read),
                     .readdata_in       (burst_converted_readdata),
                     .readdatavalid_in  (burst_converted_readdatavalid),
                     .byteenable_out    (burst_converted_byteenable),
                     .waitrequest_in    (burst_converted_waitrequest)
                     );

    assign sdram_address    = (~ao486_rst) ? burst_converted_address[26:2] : driver_sd_avm_address[26:2];
    assign sdram_byteenable = (~ao486_rst) ? burst_converted_byteenable : 4'b1111;
    assign sdram_read       = (~ao486_rst) ? burst_converted_read : (driver_sd_avm_read && driver_sd_avm_address[27]);
    assign sdram_write      = (~ao486_rst) ? burst_converted_write : (driver_sd_avm_write && driver_sd_avm_address[27]);
    assign sdram_writedata  = (~ao486_rst) ? burst_converted_writedata : driver_sd_avm_writedata;

    assign burst_converted_readdata      = (~ao486_rst) ? sdram_readdata : 0;
    assign burst_converted_readdatavalid = (~ao486_rst) ? sdram_readdatavalid : 0;
    assign burst_converted_waitrequest   = (~ao486_rst) ? sdram_waitrequest : 0;

    assign driver_sd_avm_readdata      = (ao486_rst) ? sdram_readdata : 0;
    assign driver_sd_avm_readdatavalid = (ao486_rst) ? sdram_readdatavalid : 0;
    assign driver_sd_avm_waitrequest   = (ao486_rst) ? sdram_waitrequest : 0;

endmodule
