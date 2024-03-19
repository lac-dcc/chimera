// Company           :   racyics
// Author            :   winter
// E-Mail            :   <email>
//
// Filename          :   mode_deselection.v
// Project Name      :   p_cc
// Subproject Name   :   s_fpga, dpsram_block_4x512x20
// Description       :   <short description>
//
// Create Date       :
// Last Change       :   $Date: 2017-02-17 08:13:17 +0100 (Fri, 17 Feb 2017) $
// by                :   $Author: glueck $
//------------------------------------------------------------

`timescale 1 ns / 1 ps

module mode_deselection
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
   input wire [2:0]  cfg_output_config_a0_i,
   input wire [2:0]  cfg_output_config_a1_i,
   input wire [2:0]  cfg_output_config_b0_i,
   input wire [2:0]  cfg_output_config_b1_i,
   input wire [1:0]  cfg_cascade_enable_i,
   input wire        cfg_fifo_enable_i,

   // from which RAM shall data be forwarded to DPSRAM output
   input wire        a0_clk_i,
   input wire        a1_clk_i,
   input wire        b0_clk_i,
   input wire        b1_clk_i,
   input wire        a0_re_i,
   input wire        a1_re_i,
   input wire        b0_re_i,
   input wire        b1_re_i,
   input wire [1:0]  a0_ram_select_i,
   input wire [1:0]  a1_ram_select_i,
   input wire [1:0]  b0_ram_select_i,
   input wire [1:0]  b1_ram_select_i,
   input wire        a_cascade_select_i,
   input wire        b_cascade_select_i,

   // right aligned rddata from RAM X, port X
   input wire [19:0] RAM1_a_rddata_i,
   input wire [19:0] RAM1_b_rddata_i,
   input wire [19:0] RAM2_a_rddata_i,
   input wire [19:0] RAM2_b_rddata_i,
   input wire [19:0] RAM3_a_rddata_i,
   input wire [19:0] RAM3_b_rddata_i,
   input wire [19:0] RAM4_a_rddata_i,
   input wire [19:0] RAM4_b_rddata_i,

   // forward signals cascade mode
   input wire        forward_cascade_rddata_a_i,
   input wire        forward_cascade_rddata_b_i,
   output reg        forward_cascade_rddata_a_o,
   output reg        forward_cascade_rddata_b_o,

   // signals to DPSRAM-output ports
   output reg [19:0] a0_rddata_o,
   output reg [19:0] a1_rddata_o,
   output reg [19:0] b0_rddata_o,
   output reg [19:0] b1_rddata_o
   );


   reg [1:0]  r_a0_ram_select;
   reg [1:0]  r_a1_ram_select;
   reg [1:0]  r_b0_ram_select;
   reg [1:0]  r_b1_ram_select;
   reg        r_a_cascade_select;
   reg        r_b_cascade_select;

   // 9th stage of clock tree
   wire       a0_clk, a1_clk, b0_clk, b1_clk;
   common_clkbuf
     clkbuf_a0(.I(a0_clk_i),
               .Z(a0_clk));
   common_clkbuf
     clkbuf_a1(.I(a1_clk_i),
               .Z(a1_clk));
   common_clkbuf
     clkbuf_b0(.I(b0_clk_i),
               .Z(b0_clk));
   common_clkbuf
     clkbuf_b1(.I(b1_clk_i),
               .Z(b1_clk));


   always@(posedge a0_clk) begin
     if(a0_re_i) r_a0_ram_select    <= a0_ram_select_i;
     if(a0_re_i) r_a_cascade_select <= a_cascade_select_i;
   end
   always@(posedge a1_clk) begin
     if(a1_re_i) r_a1_ram_select    <= a1_ram_select_i;
   end
   always@(posedge b0_clk) begin
     if(b0_re_i) r_b0_ram_select    <= b0_ram_select_i;
     if(b0_re_i) r_b_cascade_select <= b_cascade_select_i;
   end
   always@(posedge b1_clk) begin
     if(b1_re_i) r_b1_ram_select    <= b1_ram_select_i;
   end


   always@* begin
      a0_rddata_o = 'd0;
      a1_rddata_o = 'd0;
      forward_cascade_rddata_a_o = 'd0;

      case(cfg_sram_mode_i)
        CONFIG_TDP_NONSPLIT: begin // possible bitwidths: 40, 20, 10,...
           case(cfg_output_config_a0_i)
             CONFIG_40BIT: begin // CONFIG_80BIT is actually not possible
                case(r_a0_ram_select[1])
                  1'b0: begin
                     a0_rddata_o = RAM1_a_rddata_i;
                     a1_rddata_o = RAM2_a_rddata_i;
                  end
                  1'b1: begin
                     a0_rddata_o = RAM3_a_rddata_i;
                     a1_rddata_o = RAM4_a_rddata_i;
                  end
                endcase
             end // case: CONFIG_40BIT, CONFIG_80BIT
             CONFIG_1BIT: begin // special handling due to cascade at 1 bit
                if(cfg_cascade_enable_i[1]==1'b1) begin // upper cascade memory
                   if(r_a_cascade_select==1'b0) begin // take data from lower mem
                      a0_rddata_o[0] = forward_cascade_rddata_a_i;
                   end
                   else begin // take data from upper mem (own data)
                      case(r_a0_ram_select)
                        2'd0: a0_rddata_o[0] = RAM1_a_rddata_i[0];
                        2'd1: a0_rddata_o[0] = RAM2_a_rddata_i[0];
                        2'd2: a0_rddata_o[0] = RAM3_a_rddata_i[0];
                        2'd3: a0_rddata_o[0] = RAM4_a_rddata_i[0];
                      endcase // case (r_a0_ram_select)
                   end // else: !if(r_a_cascade_select==1'b1)
                end
                else if(cfg_cascade_enable_i[0]==1'b1) begin // lower cascade memory
                   case(r_a0_ram_select) // forward read data to upper memory
                     2'd0: forward_cascade_rddata_a_o = RAM1_a_rddata_i[0];
                     2'd1: forward_cascade_rddata_a_o = RAM2_a_rddata_i[0];
                     2'd2: forward_cascade_rddata_a_o = RAM3_a_rddata_i[0];
                     2'd3: forward_cascade_rddata_a_o = RAM4_a_rddata_i[0];
                   endcase // case (r_a0_ram_select)
                end
                else begin
                   case(r_a0_ram_select)
                     2'd0: a0_rddata_o = RAM1_a_rddata_i;
                     2'd1: a0_rddata_o = RAM2_a_rddata_i;
                     2'd2: a0_rddata_o = RAM3_a_rddata_i;
                     2'd3: a0_rddata_o = RAM4_a_rddata_i;
                   endcase // case (r_a0_ram_select)
                end
             end
             default: begin // other CONFIGs with 20 bits or less
                case(r_a0_ram_select)
                  2'd0: a0_rddata_o = RAM1_a_rddata_i;
                  2'd1: a0_rddata_o = RAM2_a_rddata_i;
                  2'd2: a0_rddata_o = RAM3_a_rddata_i;
                  2'd3: a0_rddata_o = RAM4_a_rddata_i;
                endcase
             end
           endcase
        end

        CONFIG_TDP_SPLIT: begin // possible bitwidths: 20, 10,...
           case(r_a0_ram_select[0])
             1'd0: a0_rddata_o = RAM1_a_rddata_i;
             1'd1: a0_rddata_o = RAM2_a_rddata_i;
           endcase
           case(r_a1_ram_select[0])
             1'd0: a1_rddata_o = RAM3_a_rddata_i;
             1'd1: a1_rddata_o = RAM4_a_rddata_i;
           endcase
        end

        CONFIG_SDP_NONSPLIT: begin // possible (useful) bitwidths: 80
           // we read on port B, so take B ports of RAMs
           if(cfg_fifo_enable_i==1'b1)
             begin
                 a0_rddata_o = RAM1_a_rddata_i;
                 a1_rddata_o = RAM2_a_rddata_i;
             end
           else
             begin
                 a0_rddata_o = RAM1_b_rddata_i;
                 a1_rddata_o = RAM2_b_rddata_i;
             end
        end

        CONFIG_SDP_SPLIT: begin // possible (useful) bitwidths: 40
           // split mem 1
           // we read on port B, so take B port of RAM
           a0_rddata_o = RAM1_b_rddata_i;

           // split mem 2
           // we read on port B, so take B port of RAM
           a1_rddata_o = RAM3_b_rddata_i;
        end
      endcase
   end // always@ *




   always@* begin
      b0_rddata_o = 'd0;
      b1_rddata_o = 'd0;
      forward_cascade_rddata_b_o = 'd0;

      case(cfg_sram_mode_i)
        CONFIG_TDP_NONSPLIT: begin // possible bitwidths: 40, 20, 10,...
           case(cfg_output_config_b0_i)
             CONFIG_40BIT: begin // CONFIG_80BIT is actually not possible
                case(r_b0_ram_select[1])
                  1'b0: begin
                     b0_rddata_o = RAM1_b_rddata_i;
                     b1_rddata_o = RAM2_b_rddata_i;
                  end
                  1'b1: begin
                     b0_rddata_o = RAM3_b_rddata_i;
                     b1_rddata_o = RAM4_b_rddata_i;
                  end
                endcase
             end // case: CONFIG_40BIT, CONFIG_80BIT
             CONFIG_1BIT: begin // special handling due to cascade at 1 bit
                if(cfg_cascade_enable_i[1]==1'b1) begin // upper cascade memory
                   if(r_b_cascade_select==1'b0) begin // take data from lower mem
                      b0_rddata_o[0] = forward_cascade_rddata_b_i;
                   end
                   else begin // take data from upper mem (own data)
                      case(r_b0_ram_select)
                        2'd0: b0_rddata_o[0] = RAM1_b_rddata_i[0];
                        2'd1: b0_rddata_o[0] = RAM2_b_rddata_i[0];
                        2'd2: b0_rddata_o[0] = RAM3_b_rddata_i[0];
                        2'd3: b0_rddata_o[0] = RAM4_b_rddata_i[0];
                      endcase // case (r_b0_ram_select)
                   end // else: !if(r_b_cascade_select==1'b1)
                end
                else if(cfg_cascade_enable_i[0]==1'b1) begin // lower cascade memory
                   case(r_b0_ram_select) // forward read data to upper memory
                     2'd0: forward_cascade_rddata_b_o = RAM1_b_rddata_i[0];
                     2'd1: forward_cascade_rddata_b_o = RAM2_b_rddata_i[0];
                     2'd2: forward_cascade_rddata_b_o = RAM3_b_rddata_i[0];
                     2'd3: forward_cascade_rddata_b_o = RAM4_b_rddata_i[0];
                   endcase // case (r_b0_ram_select)
                end
                else begin
                   case(r_b0_ram_select)
                     2'd0: b0_rddata_o = RAM1_b_rddata_i;
                     2'd1: b0_rddata_o = RAM2_b_rddata_i;
                     2'd2: b0_rddata_o = RAM3_b_rddata_i;
                     2'd3: b0_rddata_o = RAM4_b_rddata_i;
                   endcase // case (r_b0_ram_select)
                end
             end
             default: begin // other CONFIGs with 20 bits or less
                case(r_b0_ram_select)
                  2'd0: b0_rddata_o = RAM1_b_rddata_i;
                  2'd1: b0_rddata_o = RAM2_b_rddata_i;
                  2'd2: b0_rddata_o = RAM3_b_rddata_i;
                  2'd3: b0_rddata_o = RAM4_b_rddata_i;
                endcase
             end
           endcase
        end

        CONFIG_TDP_SPLIT: begin // possible bitwidths: 20, 10,...
           case(r_b0_ram_select[0])
             1'd0: b0_rddata_o = RAM1_b_rddata_i;
             1'd1: b0_rddata_o = RAM2_b_rddata_i;
           endcase
           case(r_b1_ram_select[0])
             1'd0: b1_rddata_o = RAM3_b_rddata_i;
             1'd1: b1_rddata_o = RAM4_b_rddata_i;
           endcase
        end

        CONFIG_SDP_NONSPLIT: begin // possible (useful) bitwidths: 80
           // we read on port B, so take B ports of RAMs
           if(cfg_fifo_enable_i==1'b1)
             begin
                 b0_rddata_o = RAM3_a_rddata_i;
                 b1_rddata_o = RAM4_a_rddata_i;
             end
           else
             begin
                 b0_rddata_o = RAM3_b_rddata_i;
                 b1_rddata_o = RAM4_b_rddata_i;
             end
        end

        CONFIG_SDP_SPLIT: begin // possible (useful) bitwidths: 40
           // split mem 1
           // we read on port B, so take B port of RAM
           b0_rddata_o = RAM2_b_rddata_i;

           // split mem 2
           // we read on port B, so take B port of RAM
           b1_rddata_o = RAM4_b_rddata_i;
        end
      endcase
   end // always@ *


endmodule // mode_deselection
