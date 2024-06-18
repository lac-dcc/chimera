// This program was cloned from: https://github.com/colognechip/gatemate_ila
// License: GNU General Public License v3.0

// Company           :   RacyICs GmbH
// Author            :   winter
// E-Mail            :   <email>
//
// Filename          :   fifo_controller.v
// Project Name      :   p_cc
// Subproject Name   :   s_fpga
// Description       :   <short description>
//
// Create Date       :   Tue Aug  6 12:47:52 2013
// Last Change       :   $Date: 2016-06-22 14:17:42 +0200 (Wed, 22 Jun 2016) $
// by                :   $Author: glueck $
//------------------------------------------------------------

`timescale 1 ns / 1 ps

module fifo_controller
  #(parameter CONFIG_1BIT  = 3'd1, //non-split-->32k x 1 bit; split-->16K x 1 bit
    parameter CONFIG_2BIT  = 3'd2, //non-split-->16k x 2 bit; split-->8K x 2 bit
    parameter CONFIG_5BIT  = 3'd3, //non-split-->8k  x 5 bit; split-->4K x 5 bit
    parameter CONFIG_10BIT = 3'd4, //non-split-->4k  x 10 bit; split-->2K x 10 bit
    parameter CONFIG_20BIT = 3'd5, //non-split-->2k  x 20 bit; split-->1K x 20 bit
    parameter CONFIG_40BIT = 3'd6, //non-split-->1K  x 40 bit; split (SPR)-->512 x 40 bit
    parameter CONFIG_80BIT = 3'd7, //non-split(SPR)-->512 x 80 bit; split-->NA

    parameter  CONFIG_TDP_NONSPLIT = 3'd0,
    parameter  CONFIG_TDP_SPLIT    = 3'd1,
    parameter  CONFIG_SDP_NONSPLIT = 3'd2,
    parameter  CONFIG_SDP_SPLIT    = 3'd3,
    parameter  CONFIG_FIFO_ASYNC   = 3'd7,
    parameter  CONFIG_FIFO_SYNC    = 3'd6,
    parameter  CONFIG_CASCADE_UP   = 3'd5,
    parameter  CONFIG_CASCADE_LOW  = 3'd4
    )
   (input  wire [2:0]  cfg_sram_mode_i,
    input  wire [2:0]  cfg_input_config_a0_i,
    input  wire [2:0]  cfg_input_config_a1_i,
    input  wire [2:0]  cfg_input_config_b0_i,
    input  wire [2:0]  cfg_input_config_b1_i,
    input  wire [2:0]  cfg_output_config_a0_i,
    input  wire [2:0]  cfg_output_config_a1_i,
    input  wire [2:0]  cfg_output_config_b0_i,
    input  wire [2:0]  cfg_output_config_b1_i,
    input  wire [1:0]  cfg_fifo_sync_enable_i,
    input  wire [1:0]  cfg_fifo_async_enable_i,
    input  wire [14:0] cfg_almost_full_offset_i,
    input  wire [14:0] cfg_almost_empty_offset_i,

    input  wire        fifo_reset_n_i,


    // forward, inverted and ecc-endoded port A0
    input  wire        a0_clk_i,
    input  wire        a0_en_i,
    input  wire        a0_we_i,
    input  wire [15:0] a0_addr_i,
    input  wire [19:0] a0_data_i,
    input  wire [19:0] a0_bitmask_i,

    // forward, inverted and ecc-endoded port A1
    input  wire        a1_clk_i,
    input  wire        a1_en_i,
    input  wire        a1_we_i,
    input  wire [15:0] a1_addr_i,
    input  wire [19:0] a1_data_i,
    input  wire [19:0] a1_bitmask_i,

    // forward, inverted and ecc-endoded port B0
    input  wire        b0_clk_i,
    input  wire        b0_en_i,
    input  wire        b0_we_i,
    input  wire [15:0] b0_addr_i,
    input  wire [19:0] b0_data_i,
    input  wire [19:0] b0_bitmask_i,

    // forward, inverted and ecc-endoded port B1
    input  wire        b1_clk_i,
    input  wire        b1_en_i,
    input  wire        b1_we_i,
    input  wire [15:0] b1_addr_i,
    input  wire [19:0] b1_data_i,
    input  wire [19:0] b1_bitmask_i,


    // port A0
    output wire        a0_clk_o,
    output wire        a0_en_o,
    output wire        a0_we_o,
    output wire [15:0] a0_addr_o,
    output wire [19:0] a0_data_o,
    output wire [19:0] a0_bitmask_o,

    // port A1
    output wire        a1_clk_o,
    output wire        a1_en_o,
    output wire        a1_we_o,
    output wire [15:0] a1_addr_o,
    output wire [19:0] a1_data_o,
    output wire [19:0] a1_bitmask_o,

    // port B0
    output wire        b0_clk_o,
    output wire        b0_en_o,
    output wire        b0_we_o,
    output wire [15:0] b0_addr_o,
    output wire [19:0] b0_data_o,
    output wire [19:0] b0_bitmask_o,

    // port B1
    output wire        b1_clk_o,
    output wire        b1_en_o,
    output wire        b1_we_o,
    output wire [15:0] b1_addr_o,
    output wire [19:0] b1_data_o,
    output wire [19:0] b1_bitmask_o,


    // FIFO status data
    output wire        fifo_full_o,
    output wire        fifo_empty_o,
    output wire        fifo_almost_full_o,
    output wire        fifo_almost_empty_o,
    output wire        fifo_write_error_o,
    output wire        fifo_read_error_o,
    output wire [15:0] fifo_write_address_o,
    output wire [15:0] fifo_read_address_o,

    input wire         testmode_i
    );

   wire [14:0] fifo_sync_wraddr;
   wire [14:0] fifo_sync_rdaddr;
   wire        fifo_sync_we;
   wire        fifo_sync_re;
   wire        fifo_sync_empty;
   wire        fifo_sync_full;
   wire        fifo_sync_af;
   wire        fifo_sync_ae;
   wire        fifo_sync_wrerr;
   wire        fifo_sync_rderr;

   wire [14:0] fifo_async_wraddr;
   wire [14:0] fifo_async_rdaddr;
   wire        fifo_async_we;
   wire        fifo_async_re;
   wire        fifo_async_empty;
   wire        fifo_async_full;
   wire        fifo_async_af;
   wire        fifo_async_ae;
   wire        fifo_async_wrerr;
   wire        fifo_async_rderr;

   reg  [15:0] fifo_sync_a0_addr;
   reg  [15:0] fifo_sync_b0_addr;
   reg  [15:0] fifo_async_a0_addr;
   reg  [15:0] fifo_async_b0_addr;

   assign a0_clk_o = a0_clk_i;
   assign a1_clk_o = a1_clk_i;
   assign b0_clk_o = b0_clk_i;
   assign b1_clk_o = b1_clk_i;

   assign a0_data_o = a0_data_i;
   assign a1_data_o = a1_data_i;
   assign b0_data_o = b0_data_i;
   assign b1_data_o = b1_data_i;

   assign a0_bitmask_o = a0_bitmask_i;
   assign a1_bitmask_o = a1_bitmask_i;
   assign b0_bitmask_o = b0_bitmask_i;
   assign b1_bitmask_o = b1_bitmask_i;

   assign a0_en_o = (cfg_fifo_sync_enable_i[0]==1'b1)  ? fifo_sync_re  :
                    (cfg_fifo_async_enable_i[0]==1'b1) ? fifo_async_re : a0_en_i;
   assign a1_en_o = a1_en_i;
   assign b0_en_o = (cfg_fifo_sync_enable_i[0]==1'b1)  ? fifo_sync_we  :
                    (cfg_fifo_async_enable_i[0]==1'b1) ? fifo_async_we : b0_en_i;
   assign b1_en_o = b1_en_i;


   assign a0_we_o = (cfg_fifo_sync_enable_i[0]==1'b1)  ? 1'b0          :
                    (cfg_fifo_async_enable_i[0]==1'b1) ? 1'b0          : a0_we_i;
   assign a1_we_o = a1_we_i;
   assign b0_we_o = (cfg_fifo_sync_enable_i[0]==1'b1)  ? fifo_sync_we  :
                    (cfg_fifo_async_enable_i[0]==1'b1) ? fifo_async_we : b0_we_i;
   assign b1_we_o = b1_we_i;

   assign a0_addr_o = (cfg_fifo_sync_enable_i[0]==1'b1)  ? fifo_sync_a0_addr  :
                      (cfg_fifo_async_enable_i[0]==1'b1) ? fifo_async_a0_addr : a0_addr_i;
   assign a1_addr_o = a1_addr_i;
   assign b0_addr_o = (cfg_fifo_sync_enable_i[0]==1'b1)  ? fifo_sync_b0_addr  :
                      (cfg_fifo_async_enable_i[0]==1'b1) ? fifo_async_b0_addr : b0_addr_i;
   assign b1_addr_o = b1_addr_i;


   assign fifo_full_o          = (cfg_fifo_sync_enable_i[0]==1'b1)  ? fifo_sync_full    :
                                 (cfg_fifo_async_enable_i[0]==1'b1) ? fifo_async_full   : 1'b0;
   assign fifo_empty_o         = (cfg_fifo_sync_enable_i[0]==1'b1)  ? fifo_sync_empty   :
                                 (cfg_fifo_async_enable_i[0]==1'b1) ? fifo_async_empty  : 1'b0;
   assign fifo_almost_full_o   = (cfg_fifo_sync_enable_i[0]==1'b1)  ? fifo_sync_af      :
                                 (cfg_fifo_async_enable_i[0]==1'b1) ? fifo_async_af     : 1'b0;
   assign fifo_almost_empty_o  = (cfg_fifo_sync_enable_i[0]==1'b1)  ? fifo_sync_ae      :
                                 (cfg_fifo_async_enable_i[0]==1'b1) ? fifo_async_ae     : 1'b0;
   assign fifo_write_error_o   = (cfg_fifo_sync_enable_i[0]==1'b1)  ? fifo_sync_wrerr   :
                                 (cfg_fifo_async_enable_i[0]==1'b1) ? fifo_async_wrerr  : 1'b0;
   assign fifo_read_error_o    = (cfg_fifo_sync_enable_i[0]==1'b1)  ? fifo_sync_rderr   :
                                 (cfg_fifo_async_enable_i[0]==1'b1) ? fifo_async_rderr  : 1'b0;
   assign fifo_write_address_o = (cfg_fifo_sync_enable_i[0]==1'b1)  ? {1'b0,fifo_sync_wraddr}  :
                                 (cfg_fifo_async_enable_i[0]==1'b1) ? {1'b0,fifo_async_wraddr} : 16'd0;
   assign fifo_read_address_o  = (cfg_fifo_sync_enable_i[0]==1'b1)  ? {1'b0,fifo_sync_rdaddr}  :
                                 (cfg_fifo_async_enable_i[0]==1'b1) ? {1'b0,fifo_async_rdaddr} : 16'd0;


   // 8th stage of clock tree
    wire       a0_clk, b0_clk; //a1_clk, b1_clk;
   common_clkbuf
     clkbuf_a0(.I(a0_clk_i),
               .Z(a0_clk));
/*   common_clkbuf
     clkbuf_a1(.I(a1_clk_i),
               .Z(a1_clk));*/
   common_clkbuf
     clkbuf_b0(.I(b0_clk_i),
               .Z(b0_clk));
/*   common_clkbuf
     clkbuf_b1(.I(b1_clk_i),
               .Z(b1_clk));*/

   // 9th stage of clock tree
   wire                fifo_sync_clk;
   wire                fifo_async_wrclk, fifo_async_rdclk;
   common_clkbuf
     clkbuf_sync_clk(.I(a0_clk),
                     .Z(fifo_sync_clk));
   common_clkbuf
     clkbuf_async_wrclk(.I(b0_clk),
                        .Z(fifo_async_wrclk));
   common_clkbuf
     clkbuf_async_rdclk(.I(a0_clk),
                        .Z(fifo_async_rdclk));

   // reset_syncronizer
   wire                fifo_sync_rstn;
   wire                fifo_async_wrrstn, fifo_async_rdrstn;
   common_reset_sync
     rstsync_sync_rstn
       (.clk_i         (fifo_sync_clk),
        .reset_q_i     (fifo_reset_n_i),
        .scan_mode_i   (testmode_i),
        .sync_reset_q_o(fifo_sync_rstn)
        );
   common_reset_sync
     rstsync_async_wrrstn
       (.clk_i         (fifo_async_wrclk),
        .reset_q_i     (fifo_reset_n_i),
        .scan_mode_i   (testmode_i),
        .sync_reset_q_o(fifo_async_wrrstn)
        );
   common_reset_sync
     rstsync_async_rdrstn
       (.clk_i         (fifo_async_rdclk),
        .reset_q_i     (fifo_reset_n_i),
        .scan_mode_i   (testmode_i),
        .sync_reset_q_o(fifo_async_rdrstn)
        );


   reg [15:0]          counter_max;
   reg [15:0]          sram_depth;
   always @(cfg_input_config_b0_i or
            fifo_sync_rdaddr or fifo_sync_wraddr or
            fifo_async_rdaddr or fifo_async_wraddr) begin
      fifo_sync_a0_addr  = {fifo_sync_rdaddr, 1'b0};
      fifo_sync_b0_addr  = {fifo_sync_wraddr, 1'b0};
      fifo_async_a0_addr = {fifo_async_rdaddr, 1'b0};
      fifo_async_b0_addr = {fifo_async_wraddr, 1'b0};

      case(cfg_input_config_b0_i)
        CONFIG_1BIT: begin
           counter_max = 2 * 32*1024 - 1;
           sram_depth  =     32*1024;
        end
        CONFIG_2BIT: begin
           counter_max = 2 * 16*1024 - 1;
           sram_depth  =     16*1024;
        end
        CONFIG_5BIT: begin
           counter_max = 2 * 8*1024 - 1;
           sram_depth  =     8*1024;
        end
        CONFIG_10BIT: begin
           counter_max = 2 * 4*1024 - 1;
           sram_depth  =     4*1024;
        end
        CONFIG_20BIT: begin
           counter_max = 2 * 2*1024 - 1;
           sram_depth  =     2*1024;
        end
        CONFIG_40BIT: begin
           counter_max = 2 * 1*1024 - 1;
           sram_depth  =     1*1024;
        end
        default: begin // 80 BIT
           counter_max = 2 * 512 - 1;
           sram_depth  =     512;
        end
      endcase
   end



   // synchronous FIFO controller
   // TDP-nonsplit, A is read, B is write
   fifo_sync
     #(.CONFIG_1BIT (CONFIG_1BIT ),
       .CONFIG_2BIT (CONFIG_2BIT ),
       .CONFIG_5BIT (CONFIG_5BIT ),
       .CONFIG_10BIT(CONFIG_10BIT),
       .CONFIG_20BIT(CONFIG_20BIT),
       .CONFIG_40BIT(CONFIG_40BIT),
       .CONFIG_80BIT(CONFIG_80BIT),
       .ADDR_WIDTH  (15          ))
   fifo_ctrl_sync
     (.clk_i        (fifo_sync_clk),
      .a_reset_n_i  (fifo_sync_rstn),

      .counter_max_i(counter_max),
      .fifo_config_i(cfg_input_config_b0_i),
      .sram_depth_i (sram_depth),

      .almost_full_offset_i (cfg_almost_full_offset_i),
      .almost_empty_offset_i(cfg_almost_empty_offset_i),

      .rd_en_i        (cfg_fifo_sync_enable_i[0] & a0_en_i),
      .wr_en_i        (cfg_fifo_sync_enable_i[0] & b0_en_i & b0_we_i),
      .write_address_o(fifo_sync_wraddr),
      .read_address_o (fifo_sync_rdaddr),
      .we_out_o       (fifo_sync_we),
      .re_out_o       (fifo_sync_re),

      .empty_o        (fifo_sync_empty),
      .full_o         (fifo_sync_full),
      .almost_full_o  (fifo_sync_af),
      .almost_empty_o (fifo_sync_ae),
      .write_error_o  (fifo_sync_wrerr),
      .read_error_o   (fifo_sync_rderr)
      );



   // asynchronous FIFO controller
   // TDP-nonsplit, A is read, B is write
   fifo_async
       #(.CONFIG_1BIT (CONFIG_1BIT ),
         .CONFIG_2BIT (CONFIG_2BIT ),
         .CONFIG_5BIT (CONFIG_5BIT ),
         .CONFIG_10BIT(CONFIG_10BIT),
         .CONFIG_20BIT(CONFIG_20BIT),
         .CONFIG_40BIT(CONFIG_40BIT),
         .CONFIG_80BIT(CONFIG_80BIT),
         .ADDR_WIDTH  (15          ))
       fifo_ctrl_async
       (.wclk_i      (fifo_async_wrclk),
        .rclk_i      (fifo_async_rdclk),
        .wa_reset_n_i(fifo_async_wrrstn),
        .ra_reset_n_i(fifo_async_rdrstn),

        .next_bin_max_i(counter_max),
        .fifo_config_i (cfg_input_config_b0_i),
        .sram_depth_i  (sram_depth),

        .almost_full_offset_i (cfg_almost_full_offset_i),
        .almost_empty_offset_i(cfg_almost_empty_offset_i),

        .read_en_i      (cfg_fifo_async_enable_i[0] & a0_en_i),
        .write_en_i     (cfg_fifo_async_enable_i[0] & b0_en_i & b0_we_i),
        .write_address_o(fifo_async_wraddr),
        .read_address_o (fifo_async_rdaddr),
        .we_out_o       (fifo_async_we),
        .re_out_o       (fifo_async_re),

        .empty_o        (fifo_async_empty),
        .full_o         (fifo_async_full),
        .almost_full_o  (fifo_async_af),
        .almost_empty_o (fifo_async_ae),
        .write_error_o  (fifo_async_wrerr),
        .read_error_o   (fifo_async_rderr)
        );

endmodule // fifo_controller
