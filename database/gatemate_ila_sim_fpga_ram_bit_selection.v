// Company           :   racyics
// Author            :   winter
// E-Mail            :   <email>
//
// Filename          :   bit_selection.v
// Project Name      :   p_cc
// Subproject Name   :   s_fpga, dpsram_block_4x512x20
// Description       :   <short description>
//
// Create Date       :
// Last Change       :   $Date: 2016-06-14 14:42:30 +0200 (Tue, 14 Jun 2016) $
// by                :   $Author: glueck $
//------------------------------------------------------------

`timescale 1 ns / 1 ps

module bit_selection
  #(parameter CONFIG_1BIT  = 3'd1, //non-split-->32k x 1 bit; split-->16K x 1 bit
    parameter CONFIG_2BIT  = 3'd2, //non-split-->16k x 2 bit; split-->8K x 2 bit
    parameter CONFIG_5BIT  = 3'd3, //non-split-->8k  x 5 bit; split-->4K x 5 bit
    parameter CONFIG_10BIT = 3'd4, //non-split-->4k  x 10 bit; split-->2K x 10 bit
    parameter CONFIG_20BIT = 3'd5, //non-split-->2k  x 20 bit; split-->1K x 20 bit
    parameter CONFIG_40BIT = 3'd6, //non-split-->1K  x 40 bit; split (SPR)-->512 x 40 bit
    parameter CONFIG_80BIT = 3'd7  //non-split(SPR)-->512 x 80 bit; split-->NA
    )
   (
    input  wire        bist_active_a_i,
    input  wire [39:0] bist_wrdata_i,
    input  wire        bist_active_b_i,
    // signals from mode_selection for RAM-macro 1
    input  wire [2:0]  RAM1_a_input_config_i,
    input  wire [2:0]  RAM1_a_output_config_i,
    input  wire        RAM1_a_clk_i,
    input  wire        RAM1_a_en_i,
    input  wire        RAM1_a_we_i,
    input  wire        RAM1_a_re_i,
    input  wire [15:0] RAM1_a_addr_i,
    input  wire [19:0] RAM1_a_data_i,
    input  wire [19:0] RAM1_a_bitmask_i,
    input  wire [2:0]  RAM1_b_input_config_i,
    input  wire [2:0]  RAM1_b_output_config_i,
    input  wire        RAM1_b_clk_i,
    input  wire        RAM1_b_en_i,
    input  wire        RAM1_b_we_i,
    input  wire        RAM1_b_re_i,
    input  wire [15:0] RAM1_b_addr_i,
    input  wire [19:0] RAM1_b_data_i,
    input  wire [19:0] RAM1_b_bitmask_i,

    // signals from mode_selection for RAM-macro 2
    input  wire [2:0]  RAM2_a_input_config_i,
    input  wire [2:0]  RAM2_a_output_config_i,
    input  wire        RAM2_a_clk_i,
    input  wire        RAM2_a_en_i,
    input  wire        RAM2_a_we_i,
    input  wire        RAM2_a_re_i,
    input  wire [15:0] RAM2_a_addr_i,
    input  wire [19:0] RAM2_a_data_i,
    input  wire [19:0] RAM2_a_bitmask_i,
    input  wire [2:0]  RAM2_b_input_config_i,
    input  wire [2:0]  RAM2_b_output_config_i,
    input  wire        RAM2_b_clk_i,
    input  wire        RAM2_b_en_i,
    input  wire        RAM2_b_we_i,
    input  wire        RAM2_b_re_i,
    input  wire [15:0] RAM2_b_addr_i,
    input  wire [19:0] RAM2_b_data_i,
    input  wire [19:0] RAM2_b_bitmask_i,

    // signals from mode_selection for RAM-macro 3
    input  wire [2:0]  RAM3_a_input_config_i,
    input  wire [2:0]  RAM3_a_output_config_i,
    input  wire        RAM3_a_clk_i,
    input  wire        RAM3_a_en_i,
    input  wire        RAM3_a_we_i,
    input  wire        RAM3_a_re_i,
    input  wire [15:0] RAM3_a_addr_i,
    input  wire [19:0] RAM3_a_data_i,
    input  wire [19:0] RAM3_a_bitmask_i,
    input  wire [2:0]  RAM3_b_input_config_i,
    input  wire [2:0]  RAM3_b_output_config_i,
    input  wire        RAM3_b_clk_i,
    input  wire        RAM3_b_en_i,
    input  wire        RAM3_b_we_i,
    input  wire        RAM3_b_re_i,
    input  wire [15:0] RAM3_b_addr_i,
    input  wire [19:0] RAM3_b_data_i,
    input  wire [19:0] RAM3_b_bitmask_i,

    // signals from mode_selection for RAM-macro 4
    input  wire [2:0]  RAM4_a_input_config_i,
    input  wire [2:0]  RAM4_a_output_config_i,
    input  wire        RAM4_a_clk_i,
    input  wire        RAM4_a_en_i,
    input  wire        RAM4_a_we_i,
    input  wire        RAM4_a_re_i,
    input  wire [15:0] RAM4_a_addr_i,
    input  wire [19:0] RAM4_a_data_i,
    input  wire [19:0] RAM4_a_bitmask_i,
    input  wire [2:0]  RAM4_b_input_config_i,
    input  wire [2:0]  RAM4_b_output_config_i,
    input  wire        RAM4_b_clk_i,
    input  wire        RAM4_b_en_i,
    input  wire        RAM4_b_we_i,
    input  wire        RAM4_b_re_i,
    input  wire [15:0] RAM4_b_addr_i,
    input  wire [19:0] RAM4_b_data_i,
    input  wire [19:0] RAM4_b_bitmask_i,


    // signals to RAM-macro 1
    output wire        RAM1_a_clk_o,
    output wire        RAM1_a_en_o,
    output wire        RAM1_a_we_o,
    output wire        RAM1_a_re_o,
    output wire [15:0] RAM1_a_addr_o,
    output wire [19:0] RAM1_a_data_o,
    output wire [19:0] RAM1_a_bitmask_o,
    output wire        RAM1_b_clk_o,
    output wire        RAM1_b_en_o,
    output wire        RAM1_b_we_o,
    output wire        RAM1_b_re_o,
    output wire [15:0] RAM1_b_addr_o,
    output wire [19:0] RAM1_b_data_o,
    output wire [19:0] RAM1_b_bitmask_o,

    // signals to RAM-macro 2
    output wire        RAM2_a_clk_o,
    output wire        RAM2_a_en_o,
    output wire        RAM2_a_we_o,
    output wire        RAM2_a_re_o,
    output wire [15:0] RAM2_a_addr_o,
    output wire [19:0] RAM2_a_data_o,
    output wire [19:0] RAM2_a_bitmask_o,
    output wire        RAM2_b_clk_o,
    output wire        RAM2_b_en_o,
    output wire        RAM2_b_we_o,
    output wire        RAM2_b_re_o,
    output wire [15:0] RAM2_b_addr_o,
    output wire [19:0] RAM2_b_data_o,
    output wire [19:0] RAM2_b_bitmask_o,

    // signals to RAM-macro 3
    output wire        RAM3_a_clk_o,
    output wire        RAM3_a_en_o,
    output wire        RAM3_a_we_o,
    output wire        RAM3_a_re_o,
    output wire [15:0] RAM3_a_addr_o,
    output wire [19:0] RAM3_a_data_o,
    output wire [19:0] RAM3_a_bitmask_o,
    output wire        RAM3_b_clk_o,
    output wire        RAM3_b_en_o,
    output wire        RAM3_b_we_o,
    output wire        RAM3_b_re_o,
    output wire [15:0] RAM3_b_addr_o,
    output wire [19:0] RAM3_b_data_o,
    output wire [19:0] RAM3_b_bitmask_o,

    // signals to RAM-macro 4
    output wire        RAM4_a_clk_o,
    output wire        RAM4_a_en_o,
    output wire        RAM4_a_we_o,
    output wire        RAM4_a_re_o,
    output wire [15:0] RAM4_a_addr_o,
    output wire [19:0] RAM4_a_data_o,
    output wire [19:0] RAM4_a_bitmask_o,
    output wire        RAM4_b_clk_o,
    output wire        RAM4_b_en_o,
    output wire        RAM4_b_we_o,
    output wire        RAM4_b_re_o,
    output wire [15:0] RAM4_b_addr_o,
    output wire [19:0] RAM4_b_data_o,
    output wire [19:0] RAM4_b_bitmask_o
    );

   wire [39:0]        bist_bitmask;
   genvar             geni;
   generate
      for(geni=1;geni<6;geni=geni+1) begin: generate_bitmask
         assign bist_bitmask[geni*8-1:(geni-1)*8] = (RAM1_a_addr_i[geni-1]==1'b1) ? {8{1'b1}} : {8{1'b0}};
      end
   endgenerate

   // RAM 1, port A
   bit_selection_ram_port
     #(.C_RAM       (1),
       .CONFIG_1BIT (CONFIG_1BIT ),
       .CONFIG_2BIT (CONFIG_2BIT ),
       .CONFIG_5BIT (CONFIG_5BIT ),
       .CONFIG_10BIT(CONFIG_10BIT),
       .CONFIG_20BIT(CONFIG_20BIT),
       .CONFIG_40BIT(CONFIG_40BIT),
       .CONFIG_80BIT(CONFIG_80BIT)
       )
   bit_selection_ram1_a
     (
      .bist_active_i (bist_active_a_i),
      .bist_wrdata_i (bist_wrdata_i[19:0]),
      .bist_bitmask_i (bist_bitmask[19:0]),

      .input_config_i (RAM1_a_input_config_i),
      .output_config_i(RAM1_a_output_config_i),
      .clk_i         (RAM1_a_clk_i),
      .en_i          (RAM1_a_en_i),
      .we_i          (RAM1_a_we_i),
      .re_i          (RAM1_a_re_i),
      .addr_i        (RAM1_a_addr_i),
      .data_i        (RAM1_a_data_i),
      .bitmask_i     (RAM1_a_bitmask_i),

      .clk_o         (RAM1_a_clk_o),
      .en_o          (RAM1_a_en_o),
      .we_o          (RAM1_a_we_o),
      .re_o          (RAM1_a_re_o),
      .addr_o        (RAM1_a_addr_o),
      .data_o        (RAM1_a_data_o),
      .bitmask_o     (RAM1_a_bitmask_o)
      );

   // RAM 1, port B
   bit_selection_ram_port
     #(.C_RAM       (1),
       .CONFIG_1BIT (CONFIG_1BIT ),
       .CONFIG_2BIT (CONFIG_2BIT ),
       .CONFIG_5BIT (CONFIG_5BIT ),
       .CONFIG_10BIT(CONFIG_10BIT),
       .CONFIG_20BIT(CONFIG_20BIT),
       .CONFIG_40BIT(CONFIG_40BIT),
       .CONFIG_80BIT(CONFIG_80BIT)
       )
   bit_selection_ram1_b
     (
      .bist_active_i (bist_active_b_i),
      .bist_wrdata_i (bist_wrdata_i[19:0]),
      .bist_bitmask_i (bist_bitmask[19:0]),

      .input_config_i (RAM1_b_input_config_i),
      .output_config_i(RAM1_b_output_config_i),
      .clk_i         (RAM1_b_clk_i),
      .en_i          (RAM1_b_en_i),
      .we_i          (RAM1_b_we_i),
      .re_i          (RAM1_b_re_i),
      .addr_i        (RAM1_b_addr_i),
      .data_i        (RAM1_b_data_i),
      .bitmask_i     (RAM1_b_bitmask_i),

      .clk_o         (RAM1_b_clk_o),
      .en_o          (RAM1_b_en_o),
      .we_o          (RAM1_b_we_o),
      .re_o          (RAM1_b_re_o),
      .addr_o        (RAM1_b_addr_o),
      .data_o        (RAM1_b_data_o),
      .bitmask_o     (RAM1_b_bitmask_o)
      );



   // RAM 2, port A
   bit_selection_ram_port
     #(.C_RAM       (2),
       .CONFIG_1BIT (CONFIG_1BIT ),
       .CONFIG_2BIT (CONFIG_2BIT ),
       .CONFIG_5BIT (CONFIG_5BIT ),
       .CONFIG_10BIT(CONFIG_10BIT),
       .CONFIG_20BIT(CONFIG_20BIT),
       .CONFIG_40BIT(CONFIG_40BIT),
       .CONFIG_80BIT(CONFIG_80BIT)
       )
   bit_selection_ram2_a
     (
      .bist_active_i (bist_active_a_i),
      .bist_wrdata_i (bist_wrdata_i[39:20]),
      .bist_bitmask_i (bist_bitmask[39:20]),

      .input_config_i (RAM2_a_input_config_i),
      .output_config_i(RAM2_a_output_config_i),
      .clk_i         (RAM2_a_clk_i),
      .en_i          (RAM2_a_en_i),
      .we_i          (RAM2_a_we_i),
      .re_i          (RAM2_a_re_i),
      .addr_i        (RAM2_a_addr_i),
      .data_i        (RAM2_a_data_i),
      .bitmask_i     (RAM2_a_bitmask_i),

      .clk_o         (RAM2_a_clk_o),
      .en_o          (RAM2_a_en_o),
      .we_o          (RAM2_a_we_o),
      .re_o          (RAM2_a_re_o),
      .addr_o        (RAM2_a_addr_o),
      .data_o        (RAM2_a_data_o),
      .bitmask_o     (RAM2_a_bitmask_o)
      );

   // RAM 2, port B
   bit_selection_ram_port
     #(.C_RAM       (2),
       .CONFIG_1BIT (CONFIG_1BIT ),
       .CONFIG_2BIT (CONFIG_2BIT ),
       .CONFIG_5BIT (CONFIG_5BIT ),
       .CONFIG_10BIT(CONFIG_10BIT),
       .CONFIG_20BIT(CONFIG_20BIT),
       .CONFIG_40BIT(CONFIG_40BIT),
       .CONFIG_80BIT(CONFIG_80BIT)
       )
   bit_selection_ram2_b
     (
      .bist_active_i (bist_active_b_i),
      .bist_wrdata_i (bist_wrdata_i[39:20]),
      .bist_bitmask_i (bist_bitmask[39:20]),

     .input_config_i (RAM2_b_input_config_i),
      .output_config_i(RAM2_b_output_config_i),
      .clk_i         (RAM2_b_clk_i),
      .en_i          (RAM2_b_en_i),
      .we_i          (RAM2_b_we_i),
      .re_i          (RAM2_b_re_i),
      .addr_i        (RAM2_b_addr_i),
      .data_i        (RAM2_b_data_i),
      .bitmask_i     (RAM2_b_bitmask_i),

      .clk_o         (RAM2_b_clk_o),
      .en_o          (RAM2_b_en_o),
      .we_o          (RAM2_b_we_o),
      .re_o          (RAM2_b_re_o),
      .addr_o        (RAM2_b_addr_o),
      .data_o        (RAM2_b_data_o),
      .bitmask_o     (RAM2_b_bitmask_o)
      );



   // RAM 3, port A
   bit_selection_ram_port
     #(.C_RAM       (3),
       .CONFIG_1BIT (CONFIG_1BIT ),
       .CONFIG_2BIT (CONFIG_2BIT ),
       .CONFIG_5BIT (CONFIG_5BIT ),
       .CONFIG_10BIT(CONFIG_10BIT),
       .CONFIG_20BIT(CONFIG_20BIT),
       .CONFIG_40BIT(CONFIG_40BIT),
       .CONFIG_80BIT(CONFIG_80BIT)
       )
   bit_selection_ram3_a
     (
      .bist_active_i (bist_active_a_i),
      .bist_wrdata_i (bist_wrdata_i[19:0]),
      .bist_bitmask_i (bist_bitmask[19:0]),

      .input_config_i (RAM3_a_input_config_i),
      .output_config_i(RAM3_a_output_config_i),
      .clk_i         (RAM3_a_clk_i),
      .en_i          (RAM3_a_en_i),
      .we_i          (RAM3_a_we_i),
      .re_i          (RAM3_a_re_i),
      .addr_i        (RAM3_a_addr_i),
      .data_i        (RAM3_a_data_i),
      .bitmask_i     (RAM3_a_bitmask_i),

      .clk_o         (RAM3_a_clk_o),
      .en_o          (RAM3_a_en_o),
      .we_o          (RAM3_a_we_o),
      .re_o          (RAM3_a_re_o),
      .addr_o        (RAM3_a_addr_o),
      .data_o        (RAM3_a_data_o),
      .bitmask_o     (RAM3_a_bitmask_o)
      );

   // RAM 3, port B
   bit_selection_ram_port
     #(.C_RAM       (3),
       .CONFIG_1BIT (CONFIG_1BIT ),
       .CONFIG_2BIT (CONFIG_2BIT ),
       .CONFIG_5BIT (CONFIG_5BIT ),
       .CONFIG_10BIT(CONFIG_10BIT),
       .CONFIG_20BIT(CONFIG_20BIT),
       .CONFIG_40BIT(CONFIG_40BIT),
       .CONFIG_80BIT(CONFIG_80BIT)
       )
   bit_selection_ram3_b
     (
      .bist_active_i (bist_active_b_i),
      .bist_wrdata_i (bist_wrdata_i[19:0]),
      .bist_bitmask_i (bist_bitmask[19:0]),

     .input_config_i (RAM3_b_input_config_i),
      .output_config_i(RAM3_b_output_config_i),
      .clk_i         (RAM3_b_clk_i),
      .en_i          (RAM3_b_en_i),
      .we_i          (RAM3_b_we_i),
      .re_i          (RAM3_b_re_i),
      .addr_i        (RAM3_b_addr_i),
      .data_i        (RAM3_b_data_i),
      .bitmask_i     (RAM3_b_bitmask_i),

      .clk_o         (RAM3_b_clk_o),
      .en_o          (RAM3_b_en_o),
      .we_o          (RAM3_b_we_o),
      .re_o          (RAM3_b_re_o),
      .addr_o        (RAM3_b_addr_o),
      .data_o        (RAM3_b_data_o),
      .bitmask_o     (RAM3_b_bitmask_o)
      );



   // RAM 4, port A
   bit_selection_ram_port
     #(.C_RAM       (4),
       .CONFIG_1BIT (CONFIG_1BIT ),
       .CONFIG_2BIT (CONFIG_2BIT ),
       .CONFIG_5BIT (CONFIG_5BIT ),
       .CONFIG_10BIT(CONFIG_10BIT),
       .CONFIG_20BIT(CONFIG_20BIT),
       .CONFIG_40BIT(CONFIG_40BIT),
       .CONFIG_80BIT(CONFIG_80BIT)
       )
   bit_selection_ram4_a
     (
      .bist_active_i (bist_active_a_i),
      .bist_wrdata_i (bist_wrdata_i[39:20]),
      .bist_bitmask_i (bist_bitmask[39:20]),

      .input_config_i (RAM4_a_input_config_i),
      .output_config_i(RAM4_a_output_config_i),
      .clk_i         (RAM4_a_clk_i),
      .en_i          (RAM4_a_en_i),
      .we_i          (RAM4_a_we_i),
      .re_i          (RAM4_a_re_i),
      .addr_i        (RAM4_a_addr_i),
      .data_i        (RAM4_a_data_i),
      .bitmask_i     (RAM4_a_bitmask_i),

      .clk_o         (RAM4_a_clk_o),
      .en_o          (RAM4_a_en_o),
      .we_o          (RAM4_a_we_o),
      .re_o          (RAM4_a_re_o),
      .addr_o        (RAM4_a_addr_o),
      .data_o        (RAM4_a_data_o),
      .bitmask_o     (RAM4_a_bitmask_o)
      );

   // RAM 4, port B
   bit_selection_ram_port
     #(.C_RAM       (4),
       .CONFIG_1BIT (CONFIG_1BIT ),
       .CONFIG_2BIT (CONFIG_2BIT ),
       .CONFIG_5BIT (CONFIG_5BIT ),
       .CONFIG_10BIT(CONFIG_10BIT),
       .CONFIG_20BIT(CONFIG_20BIT),
       .CONFIG_40BIT(CONFIG_40BIT),
       .CONFIG_80BIT(CONFIG_80BIT)
       )
   bit_selection_ram4_b
     (
      .bist_active_i (bist_active_b_i),
      .bist_wrdata_i (bist_wrdata_i[39:20]),
      .bist_bitmask_i (bist_bitmask[39:20]),

     .input_config_i (RAM4_b_input_config_i),
      .output_config_i(RAM4_b_output_config_i),
      .clk_i         (RAM4_b_clk_i),
      .en_i          (RAM4_b_en_i),
      .we_i          (RAM4_b_we_i),
      .re_i          (RAM4_b_re_i),
      .addr_i        (RAM4_b_addr_i),
      .data_i        (RAM4_b_data_i),
      .bitmask_i     (RAM4_b_bitmask_i),

      .clk_o         (RAM4_b_clk_o),
      .en_o          (RAM4_b_en_o),
      .we_o          (RAM4_b_we_o),
      .re_o          (RAM4_b_re_o),
      .addr_o        (RAM4_b_addr_o),
      .data_o        (RAM4_b_data_o),
      .bitmask_o     (RAM4_b_bitmask_o)
      );


endmodule // bit_selection
