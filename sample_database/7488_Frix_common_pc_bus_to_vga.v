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

module pc_bus_to_vga
  (
   input wire         clk_sys,
   input wire         rst,

   // input pc_bus_vga
   input wire [31:0]  pc_bus_vga_address,
   input wire [3:0]   pc_bus_vga_byteenable,
   input wire         pc_bus_vga_read,
   output wire [31:0] pc_bus_vga_readdata,
   input wire         pc_bus_vga_write,
   input wire [31:0]  pc_bus_vga_writedata,
   output wire        pc_bus_vga_waitrequest,
   output wire        pc_bus_vga_readdatavalid,
   input wire [2:0]   pc_bus_vga_burstcount,

   // output vga_mem
   output wire [16:0] vga_mem_address,
   output wire        vga_mem_read,
   input wire [7:0]   vga_mem_readdata,
   output wire        vga_mem_write,
   output wire [7:0]  vga_mem_writedata
   );

    wire [31:0]       burst_converted_address;
    wire              burst_converted_write;
    wire [31:0]       burst_converted_writedata;
    wire              burst_converted_read;
    wire [31:0]       burst_converted_readdata;
    wire              burst_converted_readdatavalid;
    wire [3:0]        burst_converted_byteenable;
    wire              burst_converted_waitrequest;

    burst_converter #(.IADDR(32), .OADDR(32))
    burst_converter (
                     .clk_sys           (clk_sys),
                     .rst               (rst),
                     .addr_in           (pc_bus_vga_address),
                     .write_in          (pc_bus_vga_write),
                     .writedata_in      (pc_bus_vga_writedata),
                     .read_in           (pc_bus_vga_read),
                     .readdata_out      (pc_bus_vga_readdata),
                     .readdatavalid_out (pc_bus_vga_readdatavalid),
                     .byteenable_in     (pc_bus_vga_byteenable),
                     .burstcount_in     (pc_bus_vga_burstcount),
                     .waitrequest_out   (pc_bus_vga_waitrequest),

                     .addr_out          (burst_converted_address),
                     .write_out         (burst_converted_write),
                     .writedata_out     (burst_converted_writedata),
                     .read_out          (burst_converted_read),
                     .readdata_in       (burst_converted_readdata),
                     .readdatavalid_in  (burst_converted_readdatavalid),
                     .byteenable_out    (burst_converted_byteenable),
                     .waitrequest_in    (burst_converted_waitrequest)
                     );

    reg               vga_mem_readdatavalid;
    always @(posedge clk_sys) vga_mem_readdatavalid <= vga_mem_read;

    byteen_converter #(.IADDR(32), .OADDR(17))
    byteen_converter (
                      .clk_sys           (clk_sys),
                      .rst               (rst),
                      .addr_in           (burst_converted_address),
                      .write_in          (burst_converted_write),
                      .writedata_in      (burst_converted_writedata),
                      .read_in           (burst_converted_read),
                      .readdata_out      (burst_converted_readdata),
                      .readdatavalid_out (burst_converted_readdatavalid),
                      .byteenable_in     (burst_converted_byteenable),
                      .waitrequest_out   (burst_converted_waitrequest),

                      .addr_out          (vga_mem_address),
                      .write_out         (vga_mem_write),
                      .writedata_out     (vga_mem_writedata),
                      .read_out          (vga_mem_read),
                      .readdata_in       (vga_mem_readdata),
                      .readdatavalid_in  (vga_mem_readdatavalid),
                      .waitrequest_in    (0)
                      );

endmodule
