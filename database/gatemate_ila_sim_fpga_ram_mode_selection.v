// This program was cloned from: https://github.com/colognechip/gatemate_ila
// License: GNU General Public License v3.0

// Company           :   racyics
// Author            :   winter
// E-Mail            :   <email>
//
// Filename          :   mode_selection.v
// Project Name      :   p_cc
// Subproject Name   :   s_fpga, dpsram_block_4x512x20
// Description       :   <short description>
//
// Create Date       :   
// Last Change       :   $Date: 2015-04-20 12:47:55 +0200 (Mon, 20 Apr 2015) $
// by                :   $Author: winter $
//------------------------------------------------------------

`timescale 1 ns / 1 ps

module mode_selection
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
   input  wire        cfg_set_outputreg_a0_i,
   input  wire        cfg_set_outputreg_a1_i,
   input  wire        cfg_set_outputreg_b0_i,
   input  wire        cfg_set_outputreg_b1_i,
   input  wire        cfg_writemode_a0_i,
   input  wire        cfg_writemode_a1_i,
   input  wire        cfg_writemode_b0_i,
   input  wire        cfg_writemode_b1_i,
   input  wire [1:0]  cfg_cascade_enable_i,

   
   // forward and inverted port A0
   input  wire        a0_clk_i,
   input  wire        a0_en_i,
   input  wire        a0_we_i,
   input  wire [15:0] a0_addr_i,
   input  wire [19:0] a0_data_i,
   input  wire [19:0] a0_bitmask_i,
   
   // forward and inverted port A1
   input  wire        a1_clk_i,
   input  wire        a1_en_i,
   input  wire        a1_we_i,
   input  wire [15:0] a1_addr_i,
   input  wire [19:0] a1_data_i,
   input  wire [19:0] a1_bitmask_i,
   
   // forward and inverted port B0
   input  wire        b0_clk_i,
   input  wire        b0_en_i,
   input  wire        b0_we_i,
   input  wire [15:0] b0_addr_i,
   input  wire [19:0] b0_data_i,
   input  wire [19:0] b0_bitmask_i,
   
   // forward and inverted port B1
   input  wire        b1_clk_i,
   input  wire        b1_en_i,
   input  wire        b1_we_i,
   input  wire [15:0] b1_addr_i,
   input  wire [19:0] b1_data_i,
   input  wire [19:0] b1_bitmask_i,


   // RAM to use for mode_deselection
   output  reg [1:0]  a0_ram_select_o,
   output  reg [1:0]  a1_ram_select_o,
   output  reg [1:0]  b0_ram_select_o,
   output  reg [1:0]  b1_ram_select_o,
   output  reg        a_cascade_select_o,
   output  reg        b_cascade_select_o,
   output  reg        a0_re_o,
   output  reg        a1_re_o,
   output  reg        b0_re_o,
   output  reg        b1_re_o,

   
   // signals to RAM-macro 1
   output  reg [2:0]  RAM1_a_input_config_o,
   output  reg [2:0]  RAM1_a_output_config_o,
   output  reg        RAM1_a_set_outputreg_o,
   output wire        RAM1_a_clk_o,
   output  reg        RAM1_a_en_o,
   output  reg        RAM1_a_we_o,
   output  reg        RAM1_a_re_o,
   output  reg [15:0] RAM1_a_addr_o,
   output  reg [19:0] RAM1_a_data_o,
   output  reg [19:0] RAM1_a_bitmask_o,
   output  reg [2:0]  RAM1_b_input_config_o,
   output  reg [2:0]  RAM1_b_output_config_o,
   output  reg        RAM1_b_set_outputreg_o,
   output wire        RAM1_b_clk_o,
   output  reg        RAM1_b_en_o,
   output  reg        RAM1_b_we_o,
   output  reg        RAM1_b_re_o,
   output  reg [15:0] RAM1_b_addr_o,
   output  reg [19:0] RAM1_b_data_o,
   output  reg [19:0] RAM1_b_bitmask_o,
   
   // signals to RAM-macro 2
   output  reg [2:0]  RAM2_a_input_config_o,
   output  reg [2:0]  RAM2_a_output_config_o,
   output  reg        RAM2_a_set_outputreg_o,
   output wire        RAM2_a_clk_o,
   output  reg        RAM2_a_en_o,
   output  reg        RAM2_a_we_o,
   output  reg        RAM2_a_re_o,
   output  reg [15:0] RAM2_a_addr_o,
   output  reg [19:0] RAM2_a_data_o,
   output  reg [19:0] RAM2_a_bitmask_o,
   output  reg [2:0]  RAM2_b_input_config_o,
   output  reg [2:0]  RAM2_b_output_config_o,
   output  reg        RAM2_b_set_outputreg_o,
   output wire        RAM2_b_clk_o,
   output  reg        RAM2_b_en_o,
   output  reg        RAM2_b_we_o,
   output  reg        RAM2_b_re_o,
   output  reg [15:0] RAM2_b_addr_o,
   output  reg [19:0] RAM2_b_data_o,
   output  reg [19:0] RAM2_b_bitmask_o,
   
   // signals to RAM-macro 3
   output  reg [2:0]  RAM3_a_input_config_o,
   output  reg [2:0]  RAM3_a_output_config_o,
   output  reg        RAM3_a_set_outputreg_o,
   output wire        RAM3_a_clk_o,
   output  reg        RAM3_a_en_o,
   output  reg        RAM3_a_we_o,
   output  reg        RAM3_a_re_o,
   output  reg [15:0] RAM3_a_addr_o,
   output  reg [19:0] RAM3_a_data_o,
   output  reg [19:0] RAM3_a_bitmask_o,
   output  reg [2:0]  RAM3_b_input_config_o,
   output  reg [2:0]  RAM3_b_output_config_o,
   output  reg        RAM3_b_set_outputreg_o,
   output wire        RAM3_b_clk_o,
   output  reg        RAM3_b_en_o,
   output  reg        RAM3_b_we_o,
   output  reg        RAM3_b_re_o,
   output  reg [15:0] RAM3_b_addr_o,
   output  reg [19:0] RAM3_b_data_o,
   output  reg [19:0] RAM3_b_bitmask_o,
   
   // signals to RAM-macro 4
   output  reg [2:0]  RAM4_a_input_config_o,
   output  reg [2:0]  RAM4_a_output_config_o,
   output  reg        RAM4_a_set_outputreg_o,
   output wire        RAM4_a_clk_o,
   output  reg        RAM4_a_en_o,
   output  reg        RAM4_a_we_o,
   output  reg        RAM4_a_re_o,
   output  reg [15:0] RAM4_a_addr_o,
   output  reg [19:0] RAM4_a_data_o,
   output  reg [19:0] RAM4_a_bitmask_o,
   output  reg [2:0]  RAM4_b_input_config_o,
   output  reg [2:0]  RAM4_b_output_config_o,
   output  reg        RAM4_b_set_outputreg_o,
   output wire        RAM4_b_clk_o,
   output  reg        RAM4_b_en_o,
   output  reg        RAM4_b_we_o,
   output  reg        RAM4_b_re_o,
   output  reg [15:0] RAM4_b_addr_o,
   output  reg [19:0] RAM4_b_data_o,
   output  reg [19:0] RAM4_b_bitmask_o
   );

   always@* begin
      a0_re_o = a0_en_i && (!a0_we_i | cfg_writemode_a0_i);
      a1_re_o = a1_en_i && (!a1_we_i | cfg_writemode_a1_i);
      b0_re_o = b0_en_i && (!b0_we_i | cfg_writemode_b0_i);
      b1_re_o = b1_en_i && (!b1_we_i | cfg_writemode_b1_i);
      a_cascade_select_o = 1'b0;
      b_cascade_select_o = 1'b0;

      case(cfg_sram_mode_i)
        CONFIG_TDP_NONSPLIT: begin // ram selection on port a1 and b1 do not care
           a0_ram_select_o = a0_addr_i[6:5];
           a1_ram_select_o = 'd0;
           b0_ram_select_o = b0_addr_i[6:5];
           b1_ram_select_o = 'd0;
           a_cascade_select_o = (cfg_cascade_enable_i!=2'd0) ? a0_addr_i[0] : 1'b0;
           b_cascade_select_o = (cfg_cascade_enable_i!=2'd0) ? b0_addr_i[0] : 1'b0;
        end
        CONFIG_TDP_SPLIT: begin
           a0_ram_select_o = {1'b0,a0_addr_i[5]};
           a1_ram_select_o = {1'b1,a1_addr_i[5]};
           b0_ram_select_o = {1'b0,b0_addr_i[5]};
           b1_ram_select_o = {1'b1,b1_addr_i[5]};
        end
        CONFIG_SDP_NONSPLIT: begin // only 80 bit possible: ram selection does not care
           a0_ram_select_o = 'd0;
           a1_ram_select_o = 'd0;
           b0_ram_select_o = 'd0;
           b1_ram_select_o = 'd0;
        end
        CONFIG_SDP_SPLIT: begin // only 40 bit possible (split): ram selection does not care
           a0_ram_select_o = 'd0;
           a1_ram_select_o = 'd0;
           b0_ram_select_o = 'd0;
           b1_ram_select_o = 'd0;
        end
        default: begin
           a0_ram_select_o = 'd0;
           a1_ram_select_o = 'd0;
           b0_ram_select_o = 'd0;
           b1_ram_select_o = 'd0;
        end
      endcase
   end
   

   // 8th stage of clk-tree
   common_clkbuf
     clkbuf_ram1_a(.I(a0_clk_i),
                   .Z(RAM1_a_clk_o));
   common_clkbuf
     clkbuf_ram2_a(.I(a0_clk_i),
                   .Z(RAM2_a_clk_o));
   common_clkmux
     clkmux_ram3_a(.I0(a0_clk_i),
                   .I1(a1_clk_i),
                   .S ((cfg_sram_mode_i==CONFIG_TDP_SPLIT) || 
                       (cfg_sram_mode_i==CONFIG_SDP_SPLIT)),
                   .Z (RAM3_a_clk_o));
   common_clkmux
     clkmux_ram4_a(.I0(a0_clk_i),
                   .I1(a1_clk_i),
                   .S ((cfg_sram_mode_i==CONFIG_TDP_SPLIT) || 
                       (cfg_sram_mode_i==CONFIG_SDP_SPLIT)),
                   .Z (RAM4_a_clk_o));   

   always@* begin
      RAM1_a_input_config_o  = 'd0;
      RAM1_a_output_config_o = 'd0;
      RAM1_a_set_outputreg_o = 'd0;
      RAM1_a_en_o            = 'd0;
      RAM1_a_we_o            = 'd0;
      RAM1_a_re_o            = 'd0;
      RAM1_a_addr_o          = 'd0;
      RAM1_a_data_o          = 'd0;
      RAM1_a_bitmask_o       = 'd0;
      
      RAM2_a_input_config_o  = 'd0;
      RAM2_a_output_config_o = 'd0;
      RAM2_a_set_outputreg_o = 'd0;
      RAM2_a_en_o            = 'd0;
      RAM2_a_we_o            = 'd0;
      RAM2_a_re_o            = 'd0;
      RAM2_a_addr_o          = 'd0;
      RAM2_a_data_o          = 'd0;
      RAM2_a_bitmask_o       = 'd0;
      
      RAM3_a_input_config_o  = 'd0;
      RAM3_a_output_config_o = 'd0;
      RAM3_a_set_outputreg_o = 'd0;
      RAM3_a_en_o            = 'd0;
      RAM3_a_we_o            = 'd0;
      RAM3_a_re_o            = 'd0;
      RAM3_a_addr_o          = 'd0;
      RAM3_a_data_o          = 'd0;
      RAM3_a_bitmask_o       = 'd0;
      
      RAM4_a_input_config_o  = 'd0;
      RAM4_a_output_config_o = 'd0;
      RAM4_a_set_outputreg_o = 'd0;
      RAM4_a_en_o            = 'd0;
      RAM4_a_we_o            = 'd0;
      RAM4_a_re_o            = 'd0;
      RAM4_a_addr_o          = 'd0;
      RAM4_a_data_o          = 'd0;
      RAM4_a_bitmask_o       = 'd0;
      
      case(cfg_sram_mode_i)
        CONFIG_TDP_NONSPLIT: begin // possible bitwidths: 40, 20, 10,...           
           RAM1_a_input_config_o  = cfg_input_config_a0_i;
           RAM1_a_output_config_o = cfg_output_config_a0_i;
           RAM1_a_set_outputreg_o = cfg_set_outputreg_a0_i;
           RAM1_a_addr_o          = a0_addr_i;
           
           RAM2_a_input_config_o  = cfg_input_config_a0_i;
           RAM2_a_output_config_o = cfg_output_config_a0_i;
           RAM2_a_set_outputreg_o = cfg_set_outputreg_a0_i;
           RAM2_a_addr_o          = a0_addr_i;
           
           RAM3_a_input_config_o  = cfg_input_config_a0_i;
           RAM3_a_output_config_o = cfg_output_config_a0_i;
           RAM3_a_set_outputreg_o = cfg_set_outputreg_a0_i;
           RAM3_a_addr_o          = a0_addr_i;
           
           RAM4_a_input_config_o  = cfg_input_config_a0_i;
           RAM4_a_output_config_o = cfg_output_config_a0_i;
           RAM4_a_set_outputreg_o = cfg_set_outputreg_a0_i;
           RAM4_a_addr_o          = a0_addr_i;
           
           case(cfg_input_config_a0_i)
             CONFIG_40BIT: begin // CONFIG_80BIT is actually not possible
                RAM1_a_we_o      = a0_en_i && a0_we_i && (a0_addr_i[6]==1'd0);
                RAM1_a_data_o    = a0_data_i;
                RAM1_a_bitmask_o = a0_bitmask_i;
                RAM2_a_we_o      = a0_en_i && a0_we_i && (a0_addr_i[6]==1'd0);
                RAM2_a_data_o    = a1_data_i;
                RAM2_a_bitmask_o = a1_bitmask_i;
                RAM3_a_we_o      = a0_en_i && a0_we_i && (a0_addr_i[6]==1'd1);
                RAM3_a_data_o    = a0_data_i;
                RAM3_a_bitmask_o = a0_bitmask_i;
                RAM4_a_we_o      = a0_en_i && a0_we_i && (a0_addr_i[6]==1'd1);
                RAM4_a_data_o    = a1_data_i;
                RAM4_a_bitmask_o = a1_bitmask_i;
             end // case: CONFIG_40BIT, CONFIG_80BIT
             default: begin // other CONFIGs with 20 bits or less
                RAM1_a_we_o      = a0_en_i && a0_we_i && (a0_addr_i[6:5]==2'd0);
                RAM1_a_data_o    = a0_data_i;
                RAM1_a_bitmask_o = a0_bitmask_i;
                RAM2_a_we_o      = a0_en_i && a0_we_i && (a0_addr_i[6:5]==2'd1);
                RAM2_a_data_o    = a0_data_i;
                RAM2_a_bitmask_o = a0_bitmask_i;
                RAM3_a_we_o      = a0_en_i && a0_we_i && (a0_addr_i[6:5]==2'd2);
                RAM3_a_data_o    = a0_data_i;
                RAM3_a_bitmask_o = a0_bitmask_i;
                RAM4_a_we_o      = a0_en_i && a0_we_i && (a0_addr_i[6:5]==2'd3);
                RAM4_a_data_o    = a0_data_i;
                RAM4_a_bitmask_o = a0_bitmask_i;
             end
           endcase
           
           case(cfg_output_config_a0_i)
             CONFIG_40BIT: begin // CONFIG_80BIT is actually not possible
                RAM1_a_re_o      = a0_en_i && (!a0_we_i | cfg_writemode_a0_i) && (a0_addr_i[6]==1'd0);
                RAM2_a_re_o      = a0_en_i && (!a0_we_i | cfg_writemode_a0_i) && (a0_addr_i[6]==1'd0);
                RAM3_a_re_o      = a0_en_i && (!a0_we_i | cfg_writemode_a0_i) && (a0_addr_i[6]==1'd1);
                RAM4_a_re_o      = a0_en_i && (!a0_we_i | cfg_writemode_a0_i) && (a0_addr_i[6]==1'd1);
             end // case: CONFIG_40BIT, CONFIG_80BIT
             default: begin // other CONFIGs with 20 bits or less
                RAM1_a_re_o      = a0_en_i && (!a0_we_i | cfg_writemode_a0_i) && (a0_addr_i[6:5]==2'd0);
                RAM2_a_re_o      = a0_en_i && (!a0_we_i | cfg_writemode_a0_i) && (a0_addr_i[6:5]==2'd1);
                RAM3_a_re_o      = a0_en_i && (!a0_we_i | cfg_writemode_a0_i) && (a0_addr_i[6:5]==2'd2);
                RAM4_a_re_o      = a0_en_i && (!a0_we_i | cfg_writemode_a0_i) && (a0_addr_i[6:5]==2'd3);
             end
           endcase
           
           RAM1_a_en_o      = RAM1_a_we_o | RAM1_a_re_o;
           RAM2_a_en_o      = RAM2_a_we_o | RAM2_a_re_o;
           RAM3_a_en_o      = RAM3_a_we_o | RAM3_a_re_o;
           RAM4_a_en_o      = RAM4_a_we_o | RAM4_a_re_o;

           if(cfg_cascade_enable_i[1]==1'b1) begin // upper cascade memory
              if(a0_addr_i[0]==1'b0) begin // do not write if addr 0
                 RAM1_a_en_o = 1'b0;
                 RAM1_a_we_o = 1'b0;
                 RAM2_a_en_o = 1'b0;
                 RAM2_a_we_o = 1'b0;
                 RAM3_a_en_o = 1'b0;
                 RAM3_a_we_o = 1'b0;
                 RAM4_a_en_o = 1'b0;
                 RAM4_a_we_o = 1'b0;
              end
           end
           else if(cfg_cascade_enable_i[0]==1'b1) begin // lower cascade memory
              if(a0_addr_i[0]==1'b1) begin // do not write if addr 1
                 RAM1_a_en_o = 1'b0;
                 RAM1_a_we_o = 1'b0;
                 RAM2_a_en_o = 1'b0;
                 RAM2_a_we_o = 1'b0;
                 RAM3_a_en_o = 1'b0;
                 RAM3_a_we_o = 1'b0;
                 RAM4_a_en_o = 1'b0;
                 RAM4_a_we_o = 1'b0;
              end              
           end
        end

        CONFIG_TDP_SPLIT: begin // possible bitwidths: 20, 10,...           
           RAM1_a_input_config_o  = cfg_input_config_a0_i;
           RAM1_a_output_config_o = cfg_output_config_a0_i;
           RAM1_a_set_outputreg_o = cfg_set_outputreg_a0_i;
           RAM1_a_en_o            = a0_en_i && (a0_addr_i[5]==1'd0);
           RAM1_a_we_o            = a0_we_i && (a0_addr_i[5]==1'd0);
           RAM1_a_re_o            = a0_en_i && (!a0_we_i | cfg_writemode_a0_i) && (a0_addr_i[5]==1'd0);
           RAM1_a_addr_o          = a0_addr_i;
           RAM1_a_data_o          = a0_data_i;
           RAM1_a_bitmask_o       = a0_bitmask_i;
                                  
           RAM2_a_input_config_o  = cfg_input_config_a0_i;
           RAM2_a_output_config_o = cfg_output_config_a0_i;
           RAM2_a_set_outputreg_o = cfg_set_outputreg_a0_i;
           RAM2_a_en_o            = a0_en_i && (a0_addr_i[5]==1'd1);
           RAM2_a_we_o            = a0_we_i && (a0_addr_i[5]==1'd1);
           RAM2_a_re_o            = a0_en_i && (!a0_we_i | cfg_writemode_a0_i) && (a0_addr_i[5]==1'd1);
           RAM2_a_addr_o          = a0_addr_i;
           RAM2_a_data_o          = a0_data_i;
           RAM2_a_bitmask_o       = a0_bitmask_i;
                                  
           RAM3_a_input_config_o  = cfg_input_config_a1_i;
           RAM3_a_output_config_o = cfg_output_config_a1_i;
           RAM3_a_set_outputreg_o = cfg_set_outputreg_a1_i;
           RAM3_a_en_o            = a1_en_i && (a1_addr_i[5]==1'd0);
           RAM3_a_we_o            = a1_we_i && (a1_addr_i[5]==1'd0);
           RAM3_a_re_o            = a1_en_i && (!a1_we_i | cfg_writemode_a1_i) && (a1_addr_i[5]==1'd0);
           RAM3_a_addr_o          = a1_addr_i;
           RAM3_a_data_o          = a1_data_i;
           RAM3_a_bitmask_o       = a1_bitmask_i;
                                  
           RAM4_a_input_config_o  = cfg_input_config_a1_i;
           RAM4_a_output_config_o = cfg_output_config_a1_i;
           RAM4_a_set_outputreg_o = cfg_set_outputreg_a1_i;
           RAM4_a_en_o            = a1_en_i && (a1_addr_i[5]==1'd1);
           RAM4_a_we_o            = a1_we_i && (a1_addr_i[5]==1'd1);
           RAM4_a_re_o            = a1_en_i && (!a1_we_i | cfg_writemode_a1_i) && (a1_addr_i[5]==1'd1);
           RAM4_a_addr_o          = a1_addr_i;
           RAM4_a_data_o          = a1_data_i;
           RAM4_a_bitmask_o       = a1_bitmask_i;
        end

        CONFIG_SDP_NONSPLIT: begin // possible (useful) bitwidths: 80, 
           // data assembling is independent of whether A or B is write port
           RAM1_a_input_config_o  = cfg_input_config_a0_i;
           RAM1_a_output_config_o = cfg_output_config_a0_i;
           RAM1_a_set_outputreg_o = cfg_set_outputreg_a0_i;
           RAM1_a_en_o            = a0_en_i;
           RAM1_a_we_o            = a0_we_i;
           RAM1_a_re_o            = a0_en_i && (!a0_we_i | cfg_writemode_a0_i);
           RAM1_a_addr_o          = a0_addr_i;
           RAM1_a_data_o          = a0_data_i;
           RAM1_a_bitmask_o       = a0_bitmask_i;
                                  
           RAM2_a_input_config_o  = cfg_input_config_a0_i;
           RAM2_a_output_config_o = cfg_output_config_a0_i;
           RAM2_a_set_outputreg_o = cfg_set_outputreg_a0_i;
           RAM2_a_en_o            = a0_en_i;
           RAM2_a_we_o            = a0_we_i;
           RAM2_a_re_o            = a0_en_i && (!a0_we_i | cfg_writemode_a0_i);
           RAM2_a_addr_o          = a0_addr_i;
           RAM2_a_data_o          = a1_data_i;
           RAM2_a_bitmask_o       = a1_bitmask_i;
                                  
           RAM3_a_input_config_o  = cfg_input_config_a0_i;
           RAM3_a_output_config_o = cfg_output_config_a0_i;
           RAM3_a_set_outputreg_o = cfg_set_outputreg_a0_i;
           RAM3_a_en_o            = a0_en_i;
           RAM3_a_we_o            = a0_we_i;
           RAM3_a_re_o            = a0_en_i && (!a0_we_i | cfg_writemode_a0_i);
           RAM3_a_addr_o          = a0_addr_i;
           RAM3_a_data_o          = b0_data_i;
           RAM3_a_bitmask_o       = b0_bitmask_i;
                                  
           RAM4_a_input_config_o  = cfg_input_config_a0_i;
           RAM4_a_output_config_o = cfg_output_config_a0_i;
           RAM4_a_set_outputreg_o = cfg_set_outputreg_a0_i;
           RAM4_a_en_o            = a0_en_i;
           RAM4_a_we_o            = a0_we_i;
           RAM4_a_re_o            = a0_en_i && (!a0_we_i | cfg_writemode_a0_i);
           RAM4_a_addr_o          = a0_addr_i;
           RAM4_a_data_o          = b1_data_i;
           RAM4_a_bitmask_o       = b1_bitmask_i;
        end

        CONFIG_SDP_SPLIT: begin // possible (useful) bitwidths: 40
           // data assembling is independent of whether A or B is write port           
           RAM1_a_input_config_o  = cfg_input_config_a0_i;
           RAM1_a_output_config_o = cfg_output_config_a0_i;
           RAM1_a_set_outputreg_o = cfg_set_outputreg_a0_i;
           RAM1_a_en_o            = a0_en_i;
           RAM1_a_we_o            = a0_we_i;
           RAM1_a_re_o            = a0_en_i && (!a0_we_i | cfg_writemode_a0_i);
           RAM1_a_addr_o          = a0_addr_i;
           RAM1_a_data_o          = a0_data_i;
           RAM1_a_bitmask_o       = a0_bitmask_i;
                                  
           RAM2_a_input_config_o  = cfg_input_config_a0_i;
           RAM2_a_output_config_o = cfg_output_config_a0_i;
           RAM2_a_set_outputreg_o = cfg_set_outputreg_a0_i;
           RAM2_a_en_o            = a0_en_i;
           RAM2_a_we_o            = a0_we_i;
           RAM2_a_re_o            = a0_en_i && (!a0_we_i | cfg_writemode_a0_i);
           RAM2_a_addr_o          = a0_addr_i;
           RAM2_a_data_o          = b0_data_i;
           RAM2_a_bitmask_o       = b0_bitmask_i;
                                  
           RAM3_a_input_config_o  = cfg_input_config_a1_i;
           RAM3_a_output_config_o = cfg_output_config_a1_i;
           RAM3_a_set_outputreg_o = cfg_set_outputreg_a1_i;
           RAM3_a_en_o            = a1_en_i;
           RAM3_a_we_o            = a1_we_i;
           RAM3_a_re_o            = a1_en_i && (!a1_we_i | cfg_writemode_a1_i);
           RAM3_a_addr_o          = a1_addr_i;
           RAM3_a_data_o          = a1_data_i;
           RAM3_a_bitmask_o       = a1_bitmask_i;
                                  
           RAM4_a_input_config_o  = cfg_input_config_a1_i;
           RAM4_a_output_config_o = cfg_output_config_a1_i;
           RAM4_a_set_outputreg_o = cfg_set_outputreg_a1_i;
           RAM4_a_en_o            = a1_en_i;
           RAM4_a_we_o            = a1_we_i;
           RAM4_a_re_o            = a1_en_i && (!a1_we_i | cfg_writemode_a1_i);
           RAM4_a_addr_o          = a1_addr_i;
           RAM4_a_data_o          = b1_data_i;
           RAM4_a_bitmask_o       = b1_bitmask_i;
        end
      endcase
   end


   



   // 8th stage of clk-tree
   common_clkbuf
     clkbuf_ram1_b(.I(b0_clk_i),
                   .Z(RAM1_b_clk_o));
   common_clkbuf
     clkbuf_ram2_b(.I(b0_clk_i),
                   .Z(RAM2_b_clk_o));
   common_clkmux
     clkmux_ram3_b(.I0(b0_clk_i),
                   .I1(b1_clk_i),
                   .S ((cfg_sram_mode_i==CONFIG_TDP_SPLIT) || 
                       (cfg_sram_mode_i==CONFIG_SDP_SPLIT)),
                   .Z (RAM3_b_clk_o));
   common_clkmux
     clkmux_ram4_b(.I0(b0_clk_i),
                   .I1(b1_clk_i),
                   .S ((cfg_sram_mode_i==CONFIG_TDP_SPLIT) || 
                       (cfg_sram_mode_i==CONFIG_SDP_SPLIT)),
                   .Z (RAM4_b_clk_o));
   
   always@* begin
      RAM1_b_input_config_o  = 'd0;
      RAM1_b_output_config_o = 'd0;
      RAM1_b_set_outputreg_o = 'd0;
      RAM1_b_en_o            = 'd0;
      RAM1_b_we_o            = 'd0;
      RAM1_b_re_o            = 'd0;
      RAM1_b_addr_o          = 'd0;
      RAM1_b_data_o          = 'd0;
      RAM1_b_bitmask_o       = 'd0;
   
      RAM2_b_input_config_o  = 'd0;
      RAM2_b_output_config_o = 'd0;
      RAM2_b_set_outputreg_o = 'd0;
      RAM2_b_en_o            = 'd0;
      RAM2_b_we_o            = 'd0;
      RAM2_b_re_o            = 'd0;
      RAM2_b_addr_o          = 'd0;
      RAM2_b_data_o          = 'd0;
      RAM2_b_bitmask_o       = 'd0;
   
      RAM3_b_input_config_o  = 'd0;
      RAM3_b_output_config_o = 'd0;
      RAM3_b_set_outputreg_o = 'd0;
      RAM3_b_en_o            = 'd0;
      RAM3_b_we_o            = 'd0;
      RAM3_b_re_o            = 'd0;
      RAM3_b_addr_o          = 'd0;
      RAM3_b_data_o          = 'd0;
      RAM3_b_bitmask_o       = 'd0;
   
      RAM4_b_input_config_o  = 'd0;
      RAM4_b_output_config_o = 'd0;
      RAM4_b_set_outputreg_o = 'd0;
      RAM4_b_en_o            = 'd0;
      RAM4_b_we_o            = 'd0;
      RAM4_b_re_o            = 'd0;
      RAM4_b_addr_o          = 'd0;
      RAM4_b_data_o          = 'd0;
      RAM4_b_bitmask_o       = 'd0;
      
      case(cfg_sram_mode_i)
        CONFIG_TDP_NONSPLIT: begin // possible bitwidths: 40, 20, 10,...           
           RAM1_b_input_config_o  = cfg_input_config_b0_i;
           RAM1_b_output_config_o = cfg_output_config_b0_i;
           RAM1_b_set_outputreg_o = cfg_set_outputreg_b0_i;
           RAM1_b_addr_o          = b0_addr_i;
                                  
           RAM2_b_input_config_o  = cfg_input_config_b0_i;
           RAM2_b_output_config_o = cfg_output_config_b0_i;
           RAM2_b_set_outputreg_o = cfg_set_outputreg_b0_i;
           RAM2_b_addr_o          = b0_addr_i;
                                  
           RAM3_b_input_config_o  = cfg_input_config_b0_i;
           RAM3_b_output_config_o = cfg_output_config_b0_i;
           RAM3_b_set_outputreg_o = cfg_set_outputreg_b0_i;
           RAM3_b_addr_o          = b0_addr_i;
                                  
           RAM4_b_input_config_o  = cfg_input_config_b0_i;
           RAM4_b_output_config_o = cfg_output_config_b0_i;
           RAM4_b_set_outputreg_o = cfg_set_outputreg_b0_i;
           RAM4_b_addr_o          = b0_addr_i;
                              
           case(cfg_input_config_b0_i)
             CONFIG_40BIT: begin // CONFIG_80BIT is actually not possible
                RAM1_b_we_o      = b0_en_i && b0_we_i && (b0_addr_i[6]==1'd0);
                RAM1_b_data_o    = b0_data_i;
                RAM1_b_bitmask_o = b0_bitmask_i;
                RAM2_b_we_o      = b0_en_i && b0_we_i && (b0_addr_i[6]==1'd0);
                RAM2_b_data_o    = b1_data_i;
                RAM2_b_bitmask_o = b1_bitmask_i;
                RAM3_b_we_o      = b0_en_i && b0_we_i && (b0_addr_i[6]==1'd1);
                RAM3_b_data_o    = b0_data_i;
                RAM3_b_bitmask_o = b0_bitmask_i;
                RAM4_b_we_o      = b0_en_i && b0_we_i && (b0_addr_i[6]==1'd1);
                RAM4_b_data_o    = b1_data_i;
                RAM4_b_bitmask_o = b1_bitmask_i;
             end // case: CONFIG_40BIT, CONFIG_80BIT
             default: begin // CONFIGs with 20 bits or less
                RAM1_b_we_o      = b0_en_i && b0_we_i && (b0_addr_i[6:5]==2'd0);
                RAM1_b_data_o    = b0_data_i;
                RAM1_b_bitmask_o = b0_bitmask_i;
                RAM2_b_we_o      = b0_en_i && b0_we_i && (b0_addr_i[6:5]==2'd1);
                RAM2_b_data_o    = b0_data_i;
                RAM2_b_bitmask_o = b0_bitmask_i;
                RAM3_b_we_o      = b0_en_i && b0_we_i && (b0_addr_i[6:5]==2'd2);
                RAM3_b_data_o    = b0_data_i;
                RAM3_b_bitmask_o = b0_bitmask_i;
                RAM4_b_we_o      = b0_en_i && b0_we_i && (b0_addr_i[6:5]==2'd3);
                RAM4_b_data_o    = b0_data_i;
                RAM4_b_bitmask_o = b0_bitmask_i;
             end
           endcase
                              
           case(cfg_output_config_b0_i)
             CONFIG_40BIT: begin // CONFIG_80BIT is actually not possible
                RAM1_b_re_o      = b0_en_i && (!b0_we_i | cfg_writemode_b0_i) && (b0_addr_i[6]==1'd0);
                RAM2_b_re_o      = b0_en_i && (!b0_we_i | cfg_writemode_b0_i) && (b0_addr_i[6]==1'd0);
                RAM3_b_re_o      = b0_en_i && (!b0_we_i | cfg_writemode_b0_i) && (b0_addr_i[6]==1'd1);
                RAM4_b_re_o      = b0_en_i && (!b0_we_i | cfg_writemode_b0_i) && (b0_addr_i[6]==1'd1);
             end // case: CONFIG_40BIT, CONFIG_80BIT
             default: begin // CONFIGs with 20 bits or less
                RAM1_b_re_o      = b0_en_i && (!b0_we_i | cfg_writemode_b0_i) && (b0_addr_i[6:5]==2'd0);
                RAM2_b_re_o      = b0_en_i && (!b0_we_i | cfg_writemode_b0_i) && (b0_addr_i[6:5]==2'd1);
                RAM3_b_re_o      = b0_en_i && (!b0_we_i | cfg_writemode_b0_i) && (b0_addr_i[6:5]==2'd2);
                RAM4_b_re_o      = b0_en_i && (!b0_we_i | cfg_writemode_b0_i) && (b0_addr_i[6:5]==2'd3);
             end
           endcase // case (cfg_output_config_b0_i)
           
           RAM1_b_en_o      = RAM1_b_we_o | RAM1_b_re_o;
           RAM2_b_en_o      = RAM2_b_we_o | RAM2_b_re_o;
           RAM3_b_en_o      = RAM3_b_we_o | RAM3_b_re_o;
           RAM4_b_en_o      = RAM4_b_we_o | RAM4_b_re_o;

           if(cfg_cascade_enable_i[1]==1'b1) begin // upper cascade memory
              if(b0_addr_i[0]==1'b0) begin // do not write if addr 0
                 RAM1_b_en_o = 1'b0;
                 RAM1_b_we_o = 1'b0;
                 RAM2_b_en_o = 1'b0;
                 RAM2_b_we_o = 1'b0;
                 RAM3_b_en_o = 1'b0;
                 RAM3_b_we_o = 1'b0;
                 RAM4_b_en_o = 1'b0;
                 RAM4_b_we_o = 1'b0;
              end
           end
           else if(cfg_cascade_enable_i[0]==1'b1) begin // lower cascade memory
              if(b0_addr_i[0]==1'b1) begin // do not write if addr 1
                 RAM1_b_en_o = 1'b0;
                 RAM1_b_we_o = 1'b0;
                 RAM2_b_en_o = 1'b0;
                 RAM2_b_we_o = 1'b0;
                 RAM3_b_en_o = 1'b0;
                 RAM3_b_we_o = 1'b0;
                 RAM4_b_en_o = 1'b0;
                 RAM4_b_we_o = 1'b0;
              end              
           end
        end

        CONFIG_TDP_SPLIT: begin // possible bitwidths: 20, 10,...           
           RAM1_b_input_config_o  = cfg_input_config_b0_i;
           RAM1_b_output_config_o = cfg_output_config_b0_i;
           RAM1_b_set_outputreg_o = cfg_set_outputreg_b0_i;
           RAM1_b_en_o            = b0_en_i && (b0_addr_i[5]==1'b0);
           RAM1_b_we_o            = b0_we_i && (b0_addr_i[5]==1'b0);
           RAM1_b_re_o            = b0_en_i && (!b0_we_i | cfg_writemode_b0_i) && (b0_addr_i[5]==1'b0);
           RAM1_b_addr_o          = b0_addr_i;
           RAM1_b_data_o          = b0_data_i;
           RAM1_b_bitmask_o       = b0_bitmask_i;
                                  
           RAM2_b_input_config_o  = cfg_input_config_b0_i;
           RAM2_b_output_config_o = cfg_output_config_b0_i;
           RAM2_b_set_outputreg_o = cfg_set_outputreg_b0_i;
           RAM2_b_en_o            = b0_en_i && (b0_addr_i[5]==1'b1);
           RAM2_b_we_o            = b0_we_i && (b0_addr_i[5]==1'b1);
           RAM2_b_re_o            = b0_en_i && (!b0_we_i | cfg_writemode_b0_i) && (b0_addr_i[5]==1'b1);
           RAM2_b_data_o          = b0_data_i;
           RAM2_b_bitmask_o       = b0_bitmask_i;
           RAM2_b_addr_o          = b0_addr_i;
                                  
           RAM3_b_input_config_o  = cfg_input_config_b1_i;
           RAM3_b_output_config_o = cfg_output_config_b1_i;
           RAM3_b_set_outputreg_o = cfg_set_outputreg_b1_i;
           RAM3_b_en_o            = b1_en_i && (b1_addr_i[5]==1'b0);
           RAM3_b_we_o            = b1_we_i && (b1_addr_i[5]==1'b0);
           RAM3_b_re_o            = b1_en_i && (!b1_we_i | cfg_writemode_b1_i) && (b1_addr_i[5]==1'b0);
           RAM3_b_addr_o          = b1_addr_i;
           RAM3_b_data_o          = b1_data_i;
           RAM3_b_bitmask_o       = b1_bitmask_i;
                                  
           RAM4_b_input_config_o  = cfg_input_config_b1_i;
           RAM4_b_output_config_o = cfg_output_config_b1_i;
           RAM4_b_set_outputreg_o = cfg_set_outputreg_b1_i;
           RAM4_b_en_o            = b1_en_i && (b1_addr_i[5]==1'b1);
           RAM4_b_we_o            = b1_we_i && (b1_addr_i[5]==1'b1);
           RAM4_b_re_o            = b1_en_i && (!b1_we_i | cfg_writemode_b1_i) && (b1_addr_i[5]==1'b1);
           RAM4_b_addr_o          = b1_addr_i;
           RAM4_b_data_o          = b1_data_i;
           RAM4_b_bitmask_o       = b1_bitmask_i;
        end

        CONFIG_SDP_NONSPLIT: begin // possible (useful) bitwidths: 80, 
           // data assembling is independent of whether A or B is write port
           RAM1_b_input_config_o  = cfg_input_config_b0_i;
           RAM1_b_output_config_o = cfg_output_config_b0_i;
           RAM1_b_set_outputreg_o = cfg_set_outputreg_b0_i;
           RAM1_b_en_o            = b0_en_i;
           RAM1_b_we_o            = b0_we_i;
           RAM1_b_re_o            = b0_en_i && (!b0_we_i | cfg_writemode_b0_i);
           RAM1_b_addr_o          = b0_addr_i;
           RAM1_b_data_o          = a0_data_i;
           RAM1_b_bitmask_o       = a0_bitmask_i;
                                  
           RAM2_b_input_config_o  = cfg_input_config_b0_i;
           RAM2_b_output_config_o = cfg_output_config_b0_i;
           RAM2_b_set_outputreg_o = cfg_set_outputreg_b0_i;
           RAM2_b_en_o            = b0_en_i;
           RAM2_b_we_o            = b0_we_i;
           RAM2_b_re_o            = b0_en_i && (!b0_we_i | cfg_writemode_b0_i);
           RAM2_b_addr_o          = b0_addr_i;
           RAM2_b_data_o          = a1_data_i;
           RAM2_b_bitmask_o       = a1_bitmask_i;
                                  
           RAM3_b_input_config_o  = cfg_input_config_b0_i;
           RAM3_b_output_config_o = cfg_output_config_b0_i;
           RAM3_b_set_outputreg_o = cfg_set_outputreg_b0_i;
           RAM3_b_en_o            = b0_en_i;
           RAM3_b_we_o            = b0_we_i;
           RAM3_b_re_o            = b0_en_i && (!b0_we_i | cfg_writemode_b0_i);
           RAM3_b_addr_o          = b0_addr_i;
           RAM3_b_data_o          = b0_data_i;
           RAM3_b_bitmask_o       = b0_bitmask_i;
                                  
           RAM4_b_input_config_o  = cfg_input_config_b0_i;
           RAM4_b_output_config_o = cfg_output_config_b0_i;
           RAM4_b_set_outputreg_o = cfg_set_outputreg_b0_i;
           RAM4_b_en_o            = b0_en_i;
           RAM4_b_we_o            = b0_we_i;
           RAM4_b_re_o            = b0_en_i && (!b0_we_i | cfg_writemode_b0_i);
           RAM4_b_addr_o          = b0_addr_i;
           RAM4_b_data_o          = b1_data_i;
           RAM4_b_bitmask_o       = b1_bitmask_i;
        end

        CONFIG_SDP_SPLIT: begin // possible (useful) bitwidths: 40
           // data assembling is independent of whether A or B is write port
           RAM1_b_input_config_o  = cfg_input_config_b0_i;
           RAM1_b_output_config_o = cfg_output_config_b0_i;
           RAM1_b_set_outputreg_o = cfg_set_outputreg_b0_i;
           RAM1_b_en_o            = b0_en_i;
           RAM1_b_we_o            = b0_we_i;
           RAM1_b_re_o            = b0_en_i && (!b0_we_i | cfg_writemode_b0_i);
           RAM1_b_addr_o          = b0_addr_i;
           RAM1_b_data_o          = a0_data_i;
           RAM1_b_bitmask_o       = a0_bitmask_i;
                                  
           RAM2_b_input_config_o  = cfg_input_config_b0_i;
           RAM2_b_output_config_o = cfg_output_config_b0_i;
           RAM2_b_set_outputreg_o = cfg_set_outputreg_b0_i;
           RAM2_b_en_o            = b0_en_i;
           RAM2_b_we_o            = b0_we_i;
           RAM2_b_re_o            = b0_en_i && (!b0_we_i | cfg_writemode_b0_i);
           RAM2_b_addr_o          = b0_addr_i;
           RAM2_b_data_o          = b0_data_i;
           RAM2_b_bitmask_o       = b0_bitmask_i;
                                  
           RAM3_b_input_config_o  = cfg_input_config_b1_i;
           RAM3_b_output_config_o = cfg_output_config_b1_i;
           RAM3_b_set_outputreg_o = cfg_set_outputreg_b1_i;
           RAM3_b_en_o            = b1_en_i;
           RAM3_b_we_o            = b1_we_i;
           RAM3_b_re_o            = b1_en_i && (!b1_we_i | cfg_writemode_b1_i);
           RAM3_b_addr_o          = b1_addr_i;
           RAM3_b_data_o          = a1_data_i;
           RAM3_b_bitmask_o       = a1_bitmask_i;
                                  
           RAM4_b_input_config_o  = cfg_input_config_b1_i;
           RAM4_b_output_config_o = cfg_output_config_b1_i;
           RAM4_b_set_outputreg_o = cfg_set_outputreg_b1_i;
           RAM4_b_en_o            = b1_en_i;
           RAM4_b_we_o            = b1_we_i;
           RAM4_b_re_o            = b1_en_i && (!b1_we_i | cfg_writemode_b1_i);
           RAM4_b_addr_o          = b1_addr_i;
           RAM4_b_data_o          = b1_data_i;
           RAM4_b_bitmask_o       = b1_bitmask_i;
        end
      endcase
   end
   
endmodule // mode_selection
