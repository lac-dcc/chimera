// This program was cloned from: https://github.com/archlabo/Frix
// License: BSD 2-Clause "Simplified" License

/*
 * Copyright (c) 2015, Arch Labolatory
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

`default_nettype wire

`timescale 1 ps / 1 ps
  module system (
                 output wire        clk_sys,
                 input wire         reset_sys,
                 input wire         clk_vga,
                 input wire         reset_vga,
                 input wire         clk_200m,
                 input wire         dram_rst_in,
                 output wire        dram_rst_out,
                 inout wire [15:0]  DDR2DQ,
                 inout wire [1:0]   DDR2DQS_N,
                 inout wire [1:0]   DDR2DQS_P,
                 output wire [12:0] DDR2ADDR,
                 output wire [2:0]  DDR2BA,
                 output wire        DDR2RAS_N,
                 output wire        DDR2CAS_N,
                 output wire        DDR2WE_N,
                 output wire [0:0]  DDR2CK_P,
                 output wire [0:0]  DDR2CK_N,
                 output wire [0:0]  DDR2CKE,
                 output wire [0:0]  DDR2CS_N,
                 output wire [1:0]  DDR2DM,
                 output wire [0:0]  DDR2ODT,

                 output wire        reset_only_ao486,
                 output wire        vga_clock,
                 output wire        vga_sync_n,
                 output wire        vga_blank_n,
                 output wire        vga_horiz_sync,
                 output wire        vga_vert_sync,
                 output wire [7:0]  vga_r,
                 output wire [7:0]  vga_g,
                 output wire [7:0]  vga_b,
                 inout wire         ps2_kbclk,
                 inout wire         ps2_kbdat,
                 inout wire [3:0]   sd_dat,
                 inout wire         sd_cmd,
                 output wire        sd_clk,

                 output wire        sdram_read,
                 output wire        sdram_write,
                 output wire        dram_read,
                 output wire        dram_write
                 );

    wire [7:0]                      ide_3f6_writedata;
    wire                            ide_3f6_write;
    wire                            ide_3f6_read;
    wire [7:0]                      ide_3f6_readdata;
    wire                            pic_interrupt_do;
    wire [7:0]                      pic_interrupt_vector;
    wire                            ao486_interrupt_done;

    wire                            bios_loader_waitrequest;
    wire [31:0]                     bios_loader_writedata;
    wire [27:0]                     bios_loader_address;
    wire                            bios_loader_write;
    wire                            bios_loader_read;
    wire [31:0]                     bios_loader_readdata;
    wire                            bios_loader_debugaccess;
    wire [3:0]                      bios_loader_byteenable;

    wire                            hdd_avalon_master_waitrequest;
    wire [31:0]                     hdd_avalon_master_writedata;
    wire [31:0]                     hdd_avalon_master_address;
    wire                            hdd_avalon_master_write;
    wire                            hdd_avalon_master_read;
    wire [31:0]                     hdd_avalon_master_readdata;
    wire                            hdd_avalon_master_readdatavalid;

    wire                            ao486_avalon_memory_waitrequest;
    wire [2:0]                      ao486_avalon_memory_burstcount;
    wire [31:0]                     ao486_avalon_memory_writedata;
    wire [31:0]                     ao486_avalon_memory_address;
    wire                            ao486_avalon_memory_write;
    wire                            ao486_avalon_memory_read;
    wire [31:0]                     ao486_avalon_memory_readdata;
    wire                            ao486_avalon_memory_readdatavalid;
    wire [3:0]                      ao486_avalon_memory_byteenable;

    wire                            ao486_avalon_io_waitrequest;
    wire [31:0]                     ao486_avalon_io_writedata;
    wire [15:0]                     ao486_avalon_io_address;
    wire                            ao486_avalon_io_write;
    wire                            ao486_avalon_io_read;
    wire [31:0]                     ao486_avalon_io_readdata;
    wire                            ao486_avalon_io_readdatavalid;
    wire [3:0]                      ao486_avalon_io_byteenable;

    wire [3:0]                      vga_io_b_address;
    wire                            vga_io_b_write;
    wire [7:0]                      vga_io_b_writedata;
    wire                            vga_io_b_read;
    wire [7:0]                      vga_io_b_readdata;

    wire [3:0]                      vga_io_c_address;
    wire                            vga_io_c_write;
    wire [7:0]                      vga_io_c_writedata;
    wire                            vga_io_c_read;
    wire [7:0]                      vga_io_c_readdata;

    wire [3:0]                      vga_io_d_address;
    wire                            vga_io_d_write;
    wire [7:0]                      vga_io_d_writedata;
    wire                            vga_io_d_read;
    wire [7:0]                      vga_io_d_readdata;

    wire [2:0]                      ps2_io_address;
    wire                            ps2_io_write;
    wire [7:0]                      ps2_io_writedata;
    wire                            ps2_io_read;
    wire [7:0]                      ps2_io_readdata;

    wire [3:0]                      ps2_sysctl_address;
    wire                            ps2_sysctl_write;
    wire [7:0]                      ps2_sysctl_writedata;
    wire                            ps2_sysctl_read;
    wire [7:0]                      ps2_sysctl_readdata;

    wire [1:0]                      pit_io_address;
    wire                            pit_io_write;
    wire [7:0]                      pit_io_writedata;
    wire                            pit_io_read;
    wire [7:0]                      pit_io_readdata;

    wire                            rtc_io_address;
    wire                            rtc_io_write;
    wire [7:0]                      rtc_io_writedata;
    wire                            rtc_io_read;
    wire [7:0]                      rtc_io_readdata;

    wire                            pic_master_address;
    wire                            pic_master_write;
    wire [7:0]                      pic_master_writedata;
    wire                            pic_master_read;
    wire [7:0]                      pic_master_readdata;

    wire                            pic_slave_address;
    wire                            pic_slave_write;
    wire [7:0]                      pic_slave_writedata;
    wire                            pic_slave_read;
    wire [7:0]                      pic_slave_readdata;

    wire                            hdd_io_address;
    wire                            hdd_io_write;
    wire [31:0]                     hdd_io_writedata;
    wire                            hdd_io_read;
    wire [31:0]                     hdd_io_readdata;
    wire [3:0]                      hdd_io_byteenable;

    wire                            pc_bus_mem_waitrequest;
    wire [2:0]                      pc_bus_mem_burstcount;
    wire [31:0]                     pc_bus_mem_writedata;
    wire [29:0]                     pc_bus_mem_address;
    wire                            pc_bus_mem_write;
    wire                            pc_bus_mem_read;
    wire [31:0]                     pc_bus_mem_readdata;
    wire                            pc_bus_mem_readdatavalid;
    wire [3:0]                      pc_bus_mem_byteenable;

    wire                            pc_bus_vga_waitrequest;
    wire [2:0]                      pc_bus_vga_burstcount;
    wire [31:0]                     pc_bus_vga_writedata;
    wire [31:0]                     pc_bus_vga_address;
    wire                            pc_bus_vga_write;
    wire                            pc_bus_vga_read;
    wire [31:0]                     pc_bus_vga_readdata;
    wire                            pc_bus_vga_readdatavalid;
    wire [3:0]                      pc_bus_vga_byteenable;

    wire [16:0]                     vga_mem_address;
    wire                            vga_mem_read;
    wire [7:0]                      vga_mem_readdata;
    wire                            vga_mem_write;
    wire [7:0]                      vga_mem_writedata;

    wire [8:0]                      hdd_sd_slave_address;
    wire                            hdd_sd_slave_read;
    wire [31:0]                     hdd_sd_slave_readdata;
    wire                            hdd_sd_slave_write;
    wire [31:0]                     hdd_sd_slave_writedata;

    wire [24:0]                     sdram_address;
    wire [3:0]                      sdram_byteenable;

    wire [31:0]                     sdram_readdata;

    wire [31:0]                     sdram_writedata;
    wire                            sdram_waitrequest;
    wire                            sdram_readdatavalid;

    wire [31:0]                     pc_bus_sdram_address;
    wire                            pc_bus_sdram_read;
    wire [31:0]                     pc_bus_sdram_readdata;
    wire                            pc_bus_sdram_write;
    wire [31:0]                     pc_bus_sdram_writedata;
    wire                            pc_bus_sdram_waitrequest;
    wire                            pc_bus_sdram_readdatavalid;
    wire [2:0]                      pc_bus_sdram_burstcount;
    wire [3:0]                      pc_bus_sdram_byteenable;

    wire [31:0]                     driver_sd_avm_address;
    wire                            driver_sd_avm_read;
    wire [31:0]                     driver_sd_avm_readdata;
    wire                            driver_sd_avm_write;
    wire [31:0]                     driver_sd_avm_writedata;
    wire                            driver_sd_avm_waitrequest;
    wire                            driver_sd_avm_readdatavalid;

    wire [31:0]                     driver_sd_avm_readdata_from_sdram;
    wire                            driver_sd_avm_readdatavalid_from_sdram;
    wire                            driver_sd_avm_waitrequest_from_sdram;

    wire                            ps2_irq_keyb;
    wire                            ps2_irq_mouse;
    wire                            pit_irq;
    wire                            rtc_irq;
    wire                            floppy_irq;
    wire                            hdd_irq;
    wire [15:0]                     pic_interrupt_input;

    wire                            ao486_rst;
    assign reset_only_ao486 = ao486_rst;

    wire [1:0]                      driver_sd_avs_address;
    wire                            driver_sd_avs_read;
    wire [31:0]                     driver_sd_avs_readdata;
    wire                            driver_sd_avs_write;
    wire [31:0]                     driver_sd_avs_writedata;

    wire [26:0]                     dram_address;

    wire [127:0]                    dram_writedata;

    wire [127:0]                    dram_readdata;
    wire                            dram_readdatavalid;
    wire                            dram_waitrequest;

    ao486 ao486 (
                 .clk                     (clk_sys),
                 .rst                     (ao486_rst),
                 .avm_address             (ao486_avalon_memory_address),
                 .avm_writedata           (ao486_avalon_memory_writedata),
                 .avm_byteenable          (ao486_avalon_memory_byteenable),
                 .avm_burstcount          (ao486_avalon_memory_burstcount),
                 .avm_write               (ao486_avalon_memory_write),
                 .avm_read                (ao486_avalon_memory_read),
                 .avm_waitrequest         (ao486_avalon_memory_waitrequest),
                 .avm_readdatavalid       (ao486_avalon_memory_readdatavalid),
                 .avm_readdata            (ao486_avalon_memory_readdata),
                 .interrupt_do            (pic_interrupt_do),
                 .interrupt_vector        (pic_interrupt_vector),
                 .interrupt_done          (ao486_interrupt_done),
                 .avalon_io_address       (ao486_avalon_io_address),
                 .avalon_io_byteenable    (ao486_avalon_io_byteenable),
                 .avalon_io_read          (ao486_avalon_io_read),
                 .avalon_io_readdatavalid (ao486_avalon_io_readdatavalid),
                 .avalon_io_readdata      (ao486_avalon_io_readdata),
                 .avalon_io_write         (ao486_avalon_io_write),
                 .avalon_io_writedata     (ao486_avalon_io_writedata),
                 .avalon_io_waitrequest   (ao486_avalon_io_waitrequest)
                 );

    bios_loader bios_loader (
                             .clk         (clk_sys),
                             .rst         (reset_sys),
                             .address     (bios_loader_address),
                             .byteenable  (bios_loader_byteenable),
                             .read        (bios_loader_read),
                             .readdata    (bios_loader_readdata),
                             .waitrequest (bios_loader_waitrequest),
                             .write       (bios_loader_write),
                             .writedata   (bios_loader_writedata)
                             );

    pc_bus pc_bus (
                   .clk                 (clk_sys),
                   .mem_address         (pc_bus_mem_address),
                   .mem_byteenable      (pc_bus_mem_byteenable),
                   .mem_read            (pc_bus_mem_read),
                   .mem_readdata        (pc_bus_mem_readdata),
                   .mem_write           (pc_bus_mem_write),
                   .mem_writedata       (pc_bus_mem_writedata),
                   .mem_waitrequest     (pc_bus_mem_waitrequest),
                   .mem_readdatavalid   (pc_bus_mem_readdatavalid),
                   .mem_burstcount      (pc_bus_mem_burstcount),
                   .rst                 (reset_sys),
                   .vga_address         (pc_bus_vga_address),
                   .vga_byteenable      (pc_bus_vga_byteenable),
                   .vga_read            (pc_bus_vga_read),
                   .vga_readdata        (pc_bus_vga_readdata),
                   .vga_write           (pc_bus_vga_write),
                   .vga_writedata       (pc_bus_vga_writedata),
                   .vga_waitrequest     (pc_bus_vga_waitrequest),
                   .vga_readdatavalid   (pc_bus_vga_readdatavalid),
                   .vga_burstcount      (pc_bus_vga_burstcount),
                   .sdram_address       (pc_bus_sdram_address),
                   .sdram_byteenable    (pc_bus_sdram_byteenable),
                   .sdram_read          (pc_bus_sdram_read),
                   .sdram_readdata      (pc_bus_sdram_readdata),
                   .sdram_write         (pc_bus_sdram_write),
                   .sdram_writedata     (pc_bus_sdram_writedata),
                   .sdram_waitrequest   (pc_bus_sdram_waitrequest),
                   .sdram_readdatavalid (pc_bus_sdram_readdatavalid),
                   .sdram_burstcount    (pc_bus_sdram_burstcount)
                   );

    vga vga (
             .io_b_address   (vga_io_b_address),
             .io_b_read      (vga_io_b_read),
             .io_b_readdata  (vga_io_b_readdata),
             .io_b_write     (vga_io_b_write),
             .io_b_writedata (vga_io_b_writedata),
             .io_c_address   (vga_io_c_address),
             .io_c_read      (vga_io_c_read),
             .io_c_readdata  (vga_io_c_readdata),
             .io_c_write     (vga_io_c_write),
             .io_c_writedata (vga_io_c_writedata),
             .io_d_address   (vga_io_d_address),
             .io_d_read      (vga_io_d_read),
             .io_d_readdata  (vga_io_d_readdata),
             .io_d_write     (vga_io_d_write),
             .io_d_writedata (vga_io_d_writedata),
             .mem_address    (vga_mem_address),
             .mem_read       (vga_mem_read),
             .mem_readdata   (vga_mem_readdata),
             .mem_write      (vga_mem_write),
             .mem_writedata  (vga_mem_writedata),
             .clk_sys        (clk_sys),
             .clk_26         (clk_vga),
             .rst            (reset_vga),
             .vga_clock      (vga_clock),
             .vga_sync_n     (vga_sync_n),
             .vga_blank_n    (vga_blank_n),
             .vga_horiz_sync (vga_horiz_sync),
             .vga_vert_sync  (vga_vert_sync),
             .vga_r          (vga_r),
             .vga_g          (vga_g),
             .vga_b          (vga_b)
             );

    cache #(.cache_entry(10))
    cache(
          .clk                (clk_sys),
          .rst                (reset_sys),
          .i_p_addr           (sdram_address),
          .i_p_byte_en        (sdram_byteenable),
          .i_p_writedata      (sdram_writedata),
          .i_p_write          (sdram_write),
          .i_p_read           (sdram_read),
          .o_p_readdata       (sdram_readdata),
          .o_p_readdata_valid (sdram_readdatavalid),
          .o_p_waitrequest    (sdram_waitrequest),

          .o_m_addr           (dram_address),
          .o_m_writedata      (dram_writedata),
          .o_m_write          (dram_write),
          .o_m_read           (dram_read),
          .i_m_readdata       (dram_readdata),
          .i_m_readdata_valid (dram_readdatavalid),
          .i_m_waitrequest    (dram_waitrequest)
          );


    DRAMCON sdram (
                   .CLK200M   (clk_200m),
                   .RST_IN    (dram_rst_in),
                   .CLK_OUT   (clk_sys),
                   .RST_OUT   (dram_rst_out),

                   .D_ADDR    (dram_address),
                   .D_DIN     (dram_writedata),
                   .D_WE      (dram_write),
                   .D_RE      (dram_read),
                   .D_DOUT    (dram_readdata),
                   .D_DOUTEN  (dram_readdatavalid),
                   .D_BUSY    (dram_waitrequest),

                   .DDR2DQ    (DDR2DQ),
                   .DDR2DQS_N (DDR2DQS_N),
                   .DDR2DQS_P (DDR2DQS_P),
                   .DDR2ADDR  (DDR2ADDR),
                   .DDR2BA    (DDR2BA),
                   .DDR2RAS_N (DDR2RAS_N),
                   .DDR2CAS_N (DDR2CAS_N),
                   .DDR2WE_N  (DDR2WE_N),
                   .DDR2CK_P  (DDR2CK_P),
                   .DDR2CK_N  (DDR2CK_N),
                   .DDR2CKE   (DDR2CKE),
                   .DDR2CS_N  (DDR2CS_N),
                   .DDR2DM    (DDR2DM),
                   .DDR2ODT   (DDR2ODT)
                   );


    rtc rtc (
             .clk          (clk_sys),
             .io_address   (rtc_io_address),
             .io_read      (rtc_io_read),
             .io_readdata  (rtc_io_readdata),
             .io_write     (rtc_io_write),
             .io_writedata (rtc_io_writedata),
             .rst          (reset_sys),
             .irq          (rtc_irq)
             );

    pit pit (
             .clk          (clk_sys),
             .io_address   (pit_io_address),
             .io_read      (pit_io_read),
             .io_readdata  (pit_io_readdata),
             .io_write     (pit_io_write),
             .io_writedata (pit_io_writedata),
             .rst          (reset_sys),
             .irq          (pit_irq)
             );


    assign pic_interrupt_input = {1'b0, hdd_irq, 1'b0, ps2_irq_mouse, 3'b0, rtc_irq, 6'b0, ps2_irq_keyb, pit_irq};
    pic pic (
             .clk              (clk_sys),
             .master_address   (pic_master_address),
             .master_read      (pic_master_read),
             .master_readdata  (pic_master_readdata),
             .master_write     (pic_master_write),
             .master_writedata (pic_master_writedata),
             .slave_address    (pic_slave_address),
             .slave_read       (pic_slave_read),
             .slave_readdata   (pic_slave_readdata),
             .slave_write      (pic_slave_write),
             .slave_writedata  (pic_slave_writedata),
             .rst              (reset_sys),
             .interrupt_vector (pic_interrupt_vector),
             .interrupt_done   (ao486_interrupt_done),
             .interrupt_do     (pic_interrupt_do),
             .interrupt_input  (pic_interrupt_input)
             );

    hdd hdd (
             .clk                     (clk_sys),
             .io_address              (hdd_io_address),
             .io_byteenable           (hdd_io_byteenable),
             .io_read                 (hdd_io_read),
             .io_readdata             (hdd_io_readdata),
             .io_write                (hdd_io_write),
             .io_writedata            (hdd_io_writedata),
             .sd_slave_address        (hdd_sd_slave_address),
             .sd_slave_read           (hdd_sd_slave_read),
             .sd_slave_readdata       (hdd_sd_slave_readdata),
             .sd_slave_write          (hdd_sd_slave_write),
             .sd_slave_writedata      (hdd_sd_slave_writedata),
             .rst                     (reset_sys),
             .irq                     (hdd_irq),
             .sd_master_address       (hdd_avalon_master_address),
             .sd_master_waitrequest   (hdd_avalon_master_waitrequest),
             .sd_master_read          (hdd_avalon_master_read),
             .sd_master_readdatavalid (hdd_avalon_master_readdatavalid),
             .sd_master_readdata      (hdd_avalon_master_readdata),
             .sd_master_write         (hdd_avalon_master_write),
             .sd_master_writedata     (hdd_avalon_master_writedata),
             .ide_3f6_read            (ide_3f6_read),
             .ide_3f6_readdata        (ide_3f6_readdata),
             .ide_3f6_write           (ide_3f6_write),
             .ide_3f6_writedata       (ide_3f6_writedata)
             );

    ao486_rst_controller ao486_rst_controller(
                                              .clk_sys   (clk_sys),
                                              .rst       (reset_sys),
                                              .ao486_rst (ao486_rst),

                                              .address   (bios_loader_address[4:3]),
                                              .write     (bios_loader_write && bios_loader_address[15:4] == 12'h886),
                                              .writedata (bios_loader_writedata)
                                              );

    ps2 ps2 (
             .clk              (clk_sys),
             .io_address       (ps2_io_address),
             .io_read          (ps2_io_read),
             .io_readdata      (ps2_io_readdata),
             .io_write         (ps2_io_write),
             .io_writedata     (ps2_io_writedata),
             .sysctl_address   (ps2_sysctl_address),
             .sysctl_read      (ps2_sysctl_read),
             .sysctl_readdata  (ps2_sysctl_readdata),
             .sysctl_write     (ps2_sysctl_write),
             .sysctl_writedata (ps2_sysctl_writedata),
             .rst              (reset_sys),
             .irq_mouse        (ps2_irq_mouse),
             .ps2_kbclk        (ps2_kbclk),
             .ps2_kbdat        (ps2_kbdat),
             .irq_keyb         (ps2_irq_keyb)
             );

    driver_sd driver_sd (
                         .clk               (clk_sys),
                         .avs_address       (driver_sd_avs_address),
                         .avs_read          (driver_sd_avs_read),
                         .avs_readdata      (driver_sd_avs_readdata),
                         .avs_write         (driver_sd_avs_write),
                         .avs_writedata     (driver_sd_avs_writedata),
                         .avm_waitrequest   (driver_sd_avm_waitrequest),
                         .avm_read          (driver_sd_avm_read),
                         .avm_readdata      (driver_sd_avm_readdata),
                         .avm_readdatavalid (driver_sd_avm_readdatavalid),
                         .avm_write         (driver_sd_avm_write),
                         .avm_writedata     (driver_sd_avm_writedata),
                         .avm_address       (driver_sd_avm_address),
                         .rst               (reset_sys),
                         .sd_cmd            (sd_cmd),
                         .sd_dat            (sd_dat),
                         .sd_clk            (sd_clk)
                         );


    assign hdd_sd_slave_address   = driver_sd_avm_address[10:2];
    assign hdd_sd_slave_read      = driver_sd_avm_read && (driver_sd_avm_address[31:11] == 21'h000000);
    assign hdd_sd_slave_write     = driver_sd_avm_write && (driver_sd_avm_address[31:11] == 21'h000000);
    assign hdd_sd_slave_writedata = driver_sd_avm_writedata;

    reg                             hdd_sd_slave_readdatavalid;
    always @(posedge clk_sys) hdd_sd_slave_readdatavalid <= hdd_sd_slave_read;

    assign driver_sd_avm_readdata = (hdd_sd_slave_readdatavalid) ? hdd_sd_slave_readdata :
                                    driver_sd_avm_readdata_from_sdram;

    assign driver_sd_avm_readdatavalid = hdd_sd_slave_readdatavalid || driver_sd_avm_readdatavalid_from_sdram;
    assign driver_sd_avm_waitrequest = driver_sd_avm_waitrequest_from_sdram;

    to_sdram bus_to_sdram (
                           .clk_sys                     (clk_sys),
                           .rst                         (reset_sys),
                           .ao486_rst                   (ao486_rst),
                           .pc_bus_sdram_address        (pc_bus_sdram_address),
                           .pc_bus_sdram_write          (pc_bus_sdram_write),
                           .pc_bus_sdram_writedata      (pc_bus_sdram_writedata),
                           .pc_bus_sdram_read           (pc_bus_sdram_read),
                           .pc_bus_sdram_readdata       (pc_bus_sdram_readdata),
                           .pc_bus_sdram_readdatavalid  (pc_bus_sdram_readdatavalid),
                           .pc_bus_sdram_byteenable     (pc_bus_sdram_byteenable),
                           .pc_bus_sdram_burstcount     (pc_bus_sdram_burstcount),
                           .pc_bus_sdram_waitrequest    (pc_bus_sdram_waitrequest),

                           .driver_sd_avm_address       (driver_sd_avm_address),
                           .driver_sd_avm_write         (driver_sd_avm_write),
                           .driver_sd_avm_writedata     (driver_sd_avm_writedata),
                           .driver_sd_avm_read          (driver_sd_avm_read),
                           .driver_sd_avm_readdata      (driver_sd_avm_readdata_from_sdram),
                           .driver_sd_avm_readdatavalid (driver_sd_avm_readdatavalid_from_sdram),
                           .driver_sd_avm_waitrequest   (driver_sd_avm_waitrequest_from_sdram),

                           .sdram_address               (sdram_address),
                           .sdram_write                 (sdram_write),
                           .sdram_writedata             (sdram_writedata),
                           .sdram_read                  (sdram_read),
                           .sdram_readdata              (sdram_readdata),
                           .sdram_readdatavalid         (sdram_readdatavalid),
                           .sdram_byteenable            (sdram_byteenable),
                           .sdram_waitrequest           (sdram_waitrequest),
                           .sdram_chipselect            (sdram_chipselect)
                           );


    to_driver_sd_avs bus_to_driver_sd_avs (
                                           .clk_sys                         (clk_sys),
                                           .rst                             (reset_sys),
                                           .ao486_rst                       (ao486_rst),
                                           .hdd_avalon_master_address       (hdd_avalon_master_address),
                                           .hdd_avalon_master_write         (hdd_avalon_master_write),
                                           .hdd_avalon_master_writedata     (hdd_avalon_master_writedata),
                                           .hdd_avalon_master_read          (hdd_avalon_master_read),
                                           .hdd_avalon_master_readdata      (hdd_avalon_master_readdata),
                                           .hdd_avalon_master_readdatavalid (hdd_avalon_master_readdatavalid),
                                           .hdd_avalon_master_waitrequest   (hdd_avalon_master_waitrequest),

                                           .bios_loader_address             (bios_loader_address),
                                           .bios_loader_write               (bios_loader_write),
                                           .bios_loader_writedata           (bios_loader_writedata),
                                           .bios_loader_read                (bios_loader_read),
                                           .bios_loader_readdata            (bios_loader_readdata),
                                           .bios_loader_waitrequest         (bios_loader_waitrequest),
                                           .bios_loader_byteenable          (bios_loader_byteenable),

                                           .driver_sd_avs_address           (driver_sd_avs_address),
                                           .driver_sd_avs_write             (driver_sd_avs_write),
                                           .driver_sd_avs_writedata         (driver_sd_avs_writedata),
                                           .driver_sd_avs_read              (driver_sd_avs_read),
                                           .driver_sd_avs_readdata          (driver_sd_avs_readdata)
                                           );

    pc_bus_to_vga pc_bus_to_vga (
                                 .clk_sys                  (clk_sys),
                                 .rst                      (reset_sys),
                                 .pc_bus_vga_address       (pc_bus_vga_address),
                                 .pc_bus_vga_write         (pc_bus_vga_write),
                                 .pc_bus_vga_writedata     (pc_bus_vga_writedata),
                                 .pc_bus_vga_read          (pc_bus_vga_read),
                                 .pc_bus_vga_readdata      (pc_bus_vga_readdata),
                                 .pc_bus_vga_readdatavalid (pc_bus_vga_readdatavalid),
                                 .pc_bus_vga_byteenable    (pc_bus_vga_byteenable),
                                 .pc_bus_vga_burstcount    (pc_bus_vga_burstcount),
                                 .pc_bus_vga_waitrequest   (pc_bus_vga_waitrequest),

                                 .vga_mem_address          (vga_mem_address),
                                 .vga_mem_write            (vga_mem_write),
                                 .vga_mem_writedata        (vga_mem_writedata),
                                 .vga_mem_read             (vga_mem_read),
                                 .vga_mem_readdata         (vga_mem_readdata)
                                 );

    assign pc_bus_mem_address    = ao486_avalon_memory_address[31:2];
    assign pc_bus_mem_write      = ao486_avalon_memory_write;
    assign pc_bus_mem_read       = ao486_avalon_memory_read;
    assign pc_bus_mem_writedata  = ao486_avalon_memory_writedata;
    assign pc_bus_mem_byteenable = ao486_avalon_memory_byteenable;
    assign pc_bus_mem_burstcount = ao486_avalon_memory_burstcount;

    assign ao486_avalon_memory_readdata      = pc_bus_mem_readdata;
    assign ao486_avalon_memory_readdatavalid = pc_bus_mem_readdatavalid;
    assign ao486_avalon_memory_waitrequest   = pc_bus_mem_waitrequest;

    io_bus io_bus(
                  .clk_sys                       (clk_sys),
                  .rst                           (reset_sys),
                  .ao486_avalon_io_address       (ao486_avalon_io_address),
                  .ao486_avalon_io_waitrequest   (ao486_avalon_io_waitrequest),
                  .ao486_avalon_io_byteenable    (ao486_avalon_io_byteenable),
                  .ao486_avalon_io_read          (ao486_avalon_io_read),
                  .ao486_avalon_io_readdata      (ao486_avalon_io_readdata),
                  .ao486_avalon_io_readdatavalid (ao486_avalon_io_readdatavalid),
                  .ao486_avalon_io_write         (ao486_avalon_io_write),
                  .ao486_avalon_io_writedata     (ao486_avalon_io_writedata),
                  .vga_io_b_address              (vga_io_b_address),
                  .vga_io_b_write                (vga_io_b_write),
                  .vga_io_b_writedata            (vga_io_b_writedata),
                  .vga_io_b_read                 (vga_io_b_read),
                  .vga_io_b_readdata             (vga_io_b_readdata),
                  .vga_io_c_address              (vga_io_c_address),
                  .vga_io_c_write                (vga_io_c_write),
                  .vga_io_c_writedata            (vga_io_c_writedata),
                  .vga_io_c_read                 (vga_io_c_read),
                  .vga_io_c_readdata             (vga_io_c_readdata),
                  .vga_io_d_address              (vga_io_d_address),
                  .vga_io_d_write                (vga_io_d_write),
                  .vga_io_d_writedata            (vga_io_d_writedata),
                  .vga_io_d_read                 (vga_io_d_read),
                  .vga_io_d_readdata             (vga_io_d_readdata),
                  .ps2_io_address                (ps2_io_address),
                  .ps2_io_write                  (ps2_io_write),
                  .ps2_io_writedata              (ps2_io_writedata),
                  .ps2_io_read                   (ps2_io_read),
                  .ps2_io_readdata               (ps2_io_readdata),
                  .ps2_sysctl_address            (ps2_sysctl_address),
                  .ps2_sysctl_write              (ps2_sysctl_write),
                  .ps2_sysctl_writedata          (ps2_sysctl_writedata),
                  .ps2_sysctl_read               (ps2_sysctl_read),
                  .ps2_sysctl_readdata           (ps2_sysctl_readdata),
                  .pit_io_address                (pit_io_address),
                  .pit_io_write                  (pit_io_write),
                  .pit_io_writedata              (pit_io_writedata),
                  .pit_io_read                   (pit_io_read),
                  .pit_io_readdata               (pit_io_readdata),
                  .rtc_io_address                (rtc_io_address),
                  .rtc_io_write                  (rtc_io_write),
                  .rtc_io_writedata              (rtc_io_writedata),
                  .rtc_io_read                   (rtc_io_read),
                  .rtc_io_readdata               (rtc_io_readdata),
                  .pic_master_address            (pic_master_address),
                  .pic_master_write              (pic_master_write),
                  .pic_master_writedata          (pic_master_writedata),
                  .pic_master_read               (pic_master_read),
                  .pic_master_readdata           (pic_master_readdata),
                  .pic_slave_address             (pic_slave_address),
                  .pic_slave_write               (pic_slave_write),
                  .pic_slave_writedata           (pic_slave_writedata),
                  .pic_slave_read                (pic_slave_read),
                  .pic_slave_readdata            (pic_slave_readdata),
                  .hdd_io_address                (hdd_io_address),
                  .hdd_io_write                  (hdd_io_write),
                  .hdd_io_writedata              (hdd_io_writedata),
                  .hdd_io_read                   (hdd_io_read),
                  .hdd_io_readdata               (hdd_io_readdata),
                  .hdd_io_byteenable             (hdd_io_byteenable),
                  .ide_3f6_write                 (ide_3f6_write),
                  .ide_3f6_writedata             (ide_3f6_writedata),
                  .ide_3f6_read                  (ide_3f6_read),
                  .ide_3f6_readdata              (ide_3f6_readdata)
                  );

endmodule
