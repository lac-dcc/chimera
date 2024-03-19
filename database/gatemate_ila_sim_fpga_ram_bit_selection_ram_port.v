// Company           :   racyics
// Author            :   winter
// E-Mail            :   <email>
//
// Filename          :   bit_selection_ram_port.v
// Project Name      :   p_cc
// Subproject Name   :   s_fpga, dpsram_block_4x512x20
// Description       :   <short description>
//
// Create Date       :   
// Last Change       :   $Date: 2015-10-13 10:57:36 +0200 (Tue, 13 Oct 2015) $
// by                :   $Author: glueck $
//------------------------------------------------------------

`timescale 1 ns / 1 ps

module bit_selection_ram_port
  #(parameter C_RAM = 1,
    parameter CONFIG_1BIT  = 3'd1, //non-split-->32k x 1 bit; split-->16K x 1 bit
    parameter CONFIG_2BIT  = 3'd2, //non-split-->16k x 2 bit; split-->8K x 2 bit
    parameter CONFIG_5BIT  = 3'd3, //non-split-->8k  x 5 bit; split-->4K x 5 bit
    parameter CONFIG_10BIT = 3'd4, //non-split-->4k  x 10 bit; split-->2K x 10 bit
    parameter CONFIG_20BIT = 3'd5, //non-split-->2k  x 20 bit; split-->1K x 20 bit
    parameter CONFIG_40BIT = 3'd6, //non-split-->1K  x 40 bit; split (SPR)-->512 x 40 bit
    parameter CONFIG_80BIT = 3'd7  //non-split(SPR)-->512 x 80 bit; split-->NA
    )
  (
   input  wire        bist_active_i,
   input  wire [19:0] bist_wrdata_i,
   input  wire [19:0] bist_bitmask_i,
      
     
   // signals from mode_selection
   input  wire [2:0]  input_config_i,
   input  wire [2:0]  output_config_i,
   input  wire        clk_i,
   input  wire        en_i,
   input  wire        we_i,
   input  wire        re_i,
   input  wire [15:0] addr_i,
   input  wire [19:0] data_i,
   input  wire [19:0] bitmask_i,
   
   // signals to RAM-macro
   output wire        clk_o,
   output wire        en_o,
   output wire        we_o,
   output wire        re_o,
   output wire [15:0] addr_o,
   output wire [19:0] data_o,
   output wire [19:0] bitmask_o
   );

   // 9th stage of clock tree
   common_clkbuf 
     clkbuf_i(.I(clk_i),
              .Z(clk_o));

   assign en_o = en_i;
   assign re_o = re_i;
   assign we_o = we_i;
   assign addr_o = addr_i;

   reg [19:0]         aligned_wrdata, aligned_bitmask;

   wire [19:0] 	      after_aligned_wrdata, after_aligned_bitmask; 	      
   
   always@* begin
      aligned_wrdata  = 'd0;
      aligned_bitmask = 'd0;

      case(input_config_i)
        CONFIG_1BIT: begin
           case(addr_i[4:1])
             4'd0: begin
                aligned_wrdata[0]  = data_i[0];
                aligned_bitmask[0] = bitmask_i[0];
             end
             4'd1: begin
                aligned_wrdata[1]  = data_i[0];
                aligned_bitmask[1] = bitmask_i[0];
             end
             4'd2: begin
                aligned_wrdata[2]  = data_i[0];
                aligned_bitmask[2] = bitmask_i[0];
             end
             4'd3: begin
                aligned_wrdata[3]  = data_i[0];
                aligned_bitmask[3] = bitmask_i[0];
             end
             4'd4: begin
                aligned_wrdata[5]  = data_i[0];
                aligned_bitmask[5] = bitmask_i[0];
             end
             4'd5: begin
                aligned_wrdata[6]  = data_i[0];
                aligned_bitmask[6] = bitmask_i[0];
             end
             4'd6: begin
                aligned_wrdata[7]  = data_i[0];
                aligned_bitmask[7] = bitmask_i[0];
             end
             4'd7: begin
                aligned_wrdata[8]  = data_i[0];
                aligned_bitmask[8] = bitmask_i[0];
             end
             4'd8: begin
                aligned_wrdata[10]  = data_i[0];
                aligned_bitmask[10] = bitmask_i[0];
             end
             4'd9: begin
                aligned_wrdata[11]  = data_i[0];
                aligned_bitmask[11] = bitmask_i[0];
             end
             4'd10: begin
                aligned_wrdata[12]  = data_i[0];
                aligned_bitmask[12] = bitmask_i[0];
             end
             4'd11: begin
                aligned_wrdata[13]  = data_i[0];
                aligned_bitmask[13] = bitmask_i[0];
             end
             4'd12: begin
                aligned_wrdata[15]  = data_i[0];
                aligned_bitmask[15] = bitmask_i[0];
             end
             4'd13: begin
                aligned_wrdata[16]  = data_i[0];
                aligned_bitmask[16] = bitmask_i[0];
             end
             4'd14: begin
                aligned_wrdata[17]  = data_i[0];
                aligned_bitmask[17] = bitmask_i[0];
             end
             4'd15: begin
                aligned_wrdata[18]  = data_i[0];
                aligned_bitmask[18] = bitmask_i[0];
             end
           endcase
        end // case: CONFIG_1BIT
        
        CONFIG_2BIT: begin
           case(addr_i[4:2])
             3'd0: begin
                aligned_wrdata[1:0]  = data_i[1:0];
                aligned_bitmask[1:0] = bitmask_i[1:0];
             end
             3'd1: begin
                aligned_wrdata[3:2]  = data_i[1:0];
                aligned_bitmask[3:2] = bitmask_i[1:0];
             end
             3'd2: begin
                aligned_wrdata[6:5]  = data_i[1:0];
                aligned_bitmask[6:5] = bitmask_i[1:0];
             end
             3'd3: begin
                aligned_wrdata[8:7]  = data_i[1:0];
                aligned_bitmask[8:7] = bitmask_i[1:0];
             end
             3'd4: begin
                aligned_wrdata[11:10]  = data_i[1:0];
                aligned_bitmask[11:10] = bitmask_i[1:0];
             end
             3'd5: begin
                aligned_wrdata[13:12]  = data_i[1:0];
                aligned_bitmask[13:12] = bitmask_i[1:0];
             end
             3'd6: begin
                aligned_wrdata[16:15]  = data_i[1:0];
                aligned_bitmask[16:15] = bitmask_i[1:0];
             end
             3'd7: begin
                aligned_wrdata[18:17]  = data_i[1:0];
                aligned_bitmask[18:17] = bitmask_i[1:0];
             end
           endcase
        end // case: CONFIG_2BIT        
        
        CONFIG_5BIT: begin
           case(addr_i[4:3])
             2'd0: begin
                aligned_wrdata[4:0]  = data_i[4:0];
                aligned_bitmask[4:0] = bitmask_i[4:0];
             end
             2'd1: begin
                aligned_wrdata[9:5]  = data_i[4:0];
                aligned_bitmask[9:5] = bitmask_i[4:0];
             end
             2'd2: begin
                aligned_wrdata[14:10]  = data_i[4:0];
                aligned_bitmask[14:10] = bitmask_i[4:0];
             end
             2'd3: begin
                aligned_wrdata[19:15]  = data_i[4:0];
                aligned_bitmask[19:15] = bitmask_i[4:0];
             end
           endcase
        end // case: CONFIG_5BIT
        
        CONFIG_10BIT: begin
           case(addr_i[4])
             1'd0: begin
                aligned_wrdata[9:0]  = data_i[9:0];
                aligned_bitmask[9:0] = bitmask_i[9:0];
             end
             1'd1: begin
                aligned_wrdata[19:10]  = data_i[9:0];
                aligned_bitmask[19:10] = bitmask_i[9:0];
             end
           endcase
        end // case: CONFIG_10BIT
      endcase // case (input_config_i)

   end // always@ *

   assign after_aligned_wrdata  = (bist_active_i==1'b1) ? bist_wrdata_i : aligned_wrdata;
   assign after_aligned_bitmask = (bist_active_i==1'b1) ? bist_bitmask_i : aligned_bitmask;


   bit_selection_mux
     #(.CONFIG_1BIT (CONFIG_1BIT ),
       .CONFIG_2BIT (CONFIG_2BIT ),
       .CONFIG_5BIT (CONFIG_5BIT ),
       .CONFIG_10BIT(CONFIG_10BIT),
       .CONFIG_20BIT(CONFIG_20BIT),
       .CONFIG_40BIT(CONFIG_40BIT),
       .CONFIG_80BIT(CONFIG_80BIT) 
       )
     bit_selection_mux_i0
       (
	.bist_active_i    (bist_active_i),
	.input_config_i   (input_config_i),
        .wrdata_i         (data_i),
        .aligned_wrdata_i (after_aligned_wrdata),
        .wrdata_o         (data_o),
        .bitmask_i        (bitmask_i),
        .aligned_bitmask_i(after_aligned_bitmask),
        .bitmask_o        (bitmask_o)
        );

endmodule // bit_selection_ram_port
