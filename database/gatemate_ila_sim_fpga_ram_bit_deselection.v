// Company           :   racyics
// Author            :   winter
// E-Mail            :   <email>
//
// Filename          :   bit_deselection.v
// Project Name      :   p_cc
// Subproject Name   :   s_fpga, dpsram_block_4x512x20
// Description       :   <short description>
//
// Create Date       :   
// Last Change       :   $Date: 2015-03-11 10:16:31 +0100 (Wed, 11 Mar 2015) $
// by                :   $Author: winter $
//------------------------------------------------------------

`timescale 1 ns / 1 ps

module bit_deselection
  #(parameter CONFIG_1BIT  = 3'd1, //non-split-->32k x 1 bit; split-->16K x 1 bit
    parameter CONFIG_2BIT  = 3'd2, //non-split-->16k x 2 bit; split-->8K x 2 bit
    parameter CONFIG_5BIT  = 3'd3, //non-split-->8k  x 5 bit; split-->4K x 5 bit
    parameter CONFIG_10BIT = 3'd4, //non-split-->4k  x 10 bit; split-->2K x 10 bit
    parameter CONFIG_20BIT = 3'd5, //non-split-->2k  x 20 bit; split-->1K x 20 bit
    parameter CONFIG_40BIT = 3'd6, //non-split-->1K  x 40 bit; split (SPR)-->512 x 40 bit
    parameter CONFIG_80BIT = 3'd7  //non-split(SPR)-->512 x 80 bit; split-->NA
    )
   (// signals from RAM-macro 1
    input  wire [2:0]  RAM1_a_output_config_i,
    input  wire        RAM1_a_clk_i,
    input  wire        RAM1_a_re_i,
    input  wire [15:0] RAM1_a_addr_i,
    input  wire [19:0] RAM1_a_rddata_i,
    input  wire [2:0]  RAM1_b_output_config_i,
    input  wire        RAM1_b_clk_i,
    input  wire        RAM1_b_re_i,
    input  wire [15:0] RAM1_b_addr_i,
    input  wire [19:0] RAM1_b_rddata_i,

    // signals from RAM-macro 2
    input  wire [2:0]  RAM2_a_output_config_i,
    input  wire        RAM2_a_clk_i,
    input  wire        RAM2_a_re_i,
    input  wire [15:0] RAM2_a_addr_i,
    input  wire [19:0] RAM2_a_rddata_i,
    input  wire [2:0]  RAM2_b_output_config_i,
    input  wire        RAM2_b_clk_i,
    input  wire        RAM2_b_re_i,
    input  wire [15:0] RAM2_b_addr_i,
    input  wire [19:0] RAM2_b_rddata_i,
    
    // signals from RAM-macro 3
    input  wire [2:0]  RAM3_a_output_config_i,
    input  wire        RAM3_a_clk_i,
    input  wire        RAM3_a_re_i,
    input  wire [15:0] RAM3_a_addr_i,
    input  wire [19:0] RAM3_a_rddata_i,
    input  wire [2:0]  RAM3_b_output_config_i,
    input  wire        RAM3_b_clk_i,
    input  wire        RAM3_b_re_i,
    input  wire [15:0] RAM3_b_addr_i,
    input  wire [19:0] RAM3_b_rddata_i,

    // signals from RAM-macro 4
    input  wire [2:0]  RAM4_a_output_config_i,
    input  wire        RAM4_a_clk_i,
    input  wire        RAM4_a_re_i,
    input  wire [15:0] RAM4_a_addr_i,
    input  wire [19:0] RAM4_a_rddata_i,
    input  wire [2:0]  RAM4_b_output_config_i,
    input  wire        RAM4_b_clk_i,
    input  wire        RAM4_b_re_i,
    input  wire [15:0] RAM4_b_addr_i,
    input  wire [19:0] RAM4_b_rddata_i,

    
    
    // right-aligned data for mode-deselection 
    output wire [19:0] RAM1_a_rddata_o,
    output wire [19:0] RAM1_b_rddata_o,
    output wire [19:0] RAM2_a_rddata_o,
    output wire [19:0] RAM2_b_rddata_o,
    output wire [19:0] RAM3_a_rddata_o,
    output wire [19:0] RAM3_b_rddata_o,
    output wire [19:0] RAM4_a_rddata_o,
    output wire [19:0] RAM4_b_rddata_o
    );


   // RAM 1, port A
   bit_deselection_ram_port
     #(.C_RAM       (1),
       .CONFIG_1BIT (CONFIG_1BIT ),
       .CONFIG_2BIT (CONFIG_2BIT ),
       .CONFIG_5BIT (CONFIG_5BIT ),
       .CONFIG_10BIT(CONFIG_10BIT),
       .CONFIG_20BIT(CONFIG_20BIT),
       .CONFIG_40BIT(CONFIG_40BIT),
       .CONFIG_80BIT(CONFIG_80BIT) 
       )
   bit_deselection_ram1_a
     (.output_config_i(RAM1_a_output_config_i),
      .clk_i          (RAM1_a_clk_i),
      .re_i           (RAM1_a_re_i),
      .addr_i         (RAM1_a_addr_i),
      .rddata_i       (RAM1_a_rddata_i),                      
      .rddata_o       (RAM1_a_rddata_o)
      );

   // RAM 1, port B
   bit_deselection_ram_port
     #(.C_RAM       (1),
       .CONFIG_1BIT (CONFIG_1BIT ),
       .CONFIG_2BIT (CONFIG_2BIT ),
       .CONFIG_5BIT (CONFIG_5BIT ),
       .CONFIG_10BIT(CONFIG_10BIT),
       .CONFIG_20BIT(CONFIG_20BIT),
       .CONFIG_40BIT(CONFIG_40BIT),
       .CONFIG_80BIT(CONFIG_80BIT) 
       )
   bit_deselection_ram1_b
     (.output_config_i(RAM1_b_output_config_i),
      .clk_i          (RAM1_b_clk_i),
      .re_i           (RAM1_b_re_i),
      .addr_i         (RAM1_b_addr_i),
      .rddata_i       (RAM1_b_rddata_i),                            
      .rddata_o       (RAM1_b_rddata_o)
      );

   


   // RAM 2, port A
   bit_deselection_ram_port
     #(.C_RAM       (2),
       .CONFIG_1BIT (CONFIG_1BIT ),
       .CONFIG_2BIT (CONFIG_2BIT ),
       .CONFIG_5BIT (CONFIG_5BIT ),
       .CONFIG_10BIT(CONFIG_10BIT),
       .CONFIG_20BIT(CONFIG_20BIT),
       .CONFIG_40BIT(CONFIG_40BIT),
       .CONFIG_80BIT(CONFIG_80BIT) 
       )
   bit_deselection_ram2_a
     (.output_config_i(RAM2_a_output_config_i),
      .clk_i          (RAM2_a_clk_i),
      .re_i           (RAM2_a_re_i),
      .addr_i         (RAM2_a_addr_i),
      .rddata_i       (RAM2_a_rddata_i),                      
      .rddata_o       (RAM2_a_rddata_o)
      );

   // RAM 2, port B
   bit_deselection_ram_port
     #(.C_RAM       (2),
       .CONFIG_1BIT (CONFIG_1BIT ),
       .CONFIG_2BIT (CONFIG_2BIT ),
       .CONFIG_5BIT (CONFIG_5BIT ),
       .CONFIG_10BIT(CONFIG_10BIT),
       .CONFIG_20BIT(CONFIG_20BIT),
       .CONFIG_40BIT(CONFIG_40BIT),
       .CONFIG_80BIT(CONFIG_80BIT) 
       )
   bit_deselection_ram2_b
     (.output_config_i(RAM2_b_output_config_i),
      .clk_i          (RAM2_b_clk_i),
      .re_i           (RAM2_b_re_i),
      .addr_i         (RAM2_b_addr_i),
      .rddata_i       (RAM2_b_rddata_i),                            
      .rddata_o       (RAM2_b_rddata_o)
      );

   


   // RAM 3, port A
   bit_deselection_ram_port
     #(.C_RAM       (3),
       .CONFIG_1BIT (CONFIG_1BIT ),
       .CONFIG_2BIT (CONFIG_2BIT ),
       .CONFIG_5BIT (CONFIG_5BIT ),
       .CONFIG_10BIT(CONFIG_10BIT),
       .CONFIG_20BIT(CONFIG_20BIT),
       .CONFIG_40BIT(CONFIG_40BIT),
       .CONFIG_80BIT(CONFIG_80BIT) 
       )
   bit_deselection_ram3_a
     (.output_config_i(RAM3_a_output_config_i),
      .clk_i          (RAM3_a_clk_i),
      .re_i           (RAM3_a_re_i),
      .addr_i         (RAM3_a_addr_i),
      .rddata_i       (RAM3_a_rddata_i),                      
      .rddata_o       (RAM3_a_rddata_o)
      );

   // RAM 3, port B
   bit_deselection_ram_port
     #(.C_RAM       (3),
       .CONFIG_1BIT (CONFIG_1BIT ),
       .CONFIG_2BIT (CONFIG_2BIT ),
       .CONFIG_5BIT (CONFIG_5BIT ),
       .CONFIG_10BIT(CONFIG_10BIT),
       .CONFIG_20BIT(CONFIG_20BIT),
       .CONFIG_40BIT(CONFIG_40BIT),
       .CONFIG_80BIT(CONFIG_80BIT) 
       )
   bit_deselection_ram3_b
     (.output_config_i(RAM3_b_output_config_i),
      .clk_i          (RAM3_b_clk_i),
      .re_i           (RAM3_b_re_i),
      .addr_i         (RAM3_b_addr_i),
      .rddata_i       (RAM3_b_rddata_i),                            
      .rddata_o       (RAM3_b_rddata_o)
      );

   


   // RAM 4, port A
   bit_deselection_ram_port
     #(.C_RAM       (4),
       .CONFIG_1BIT (CONFIG_1BIT ),
       .CONFIG_2BIT (CONFIG_2BIT ),
       .CONFIG_5BIT (CONFIG_5BIT ),
       .CONFIG_10BIT(CONFIG_10BIT),
       .CONFIG_20BIT(CONFIG_20BIT),
       .CONFIG_40BIT(CONFIG_40BIT),
       .CONFIG_80BIT(CONFIG_80BIT) 
       )
   bit_deselection_ram4_a
     (.output_config_i(RAM4_a_output_config_i),
      .clk_i          (RAM4_a_clk_i),
      .re_i           (RAM4_a_re_i),
      .addr_i         (RAM4_a_addr_i),
      .rddata_i       (RAM4_a_rddata_i),                      
      .rddata_o       (RAM4_a_rddata_o)
      );

   // RAM 4, port B
   bit_deselection_ram_port
     #(.C_RAM       (4),
       .CONFIG_1BIT (CONFIG_1BIT ),
       .CONFIG_2BIT (CONFIG_2BIT ),
       .CONFIG_5BIT (CONFIG_5BIT ),
       .CONFIG_10BIT(CONFIG_10BIT),
       .CONFIG_20BIT(CONFIG_20BIT),
       .CONFIG_40BIT(CONFIG_40BIT),
       .CONFIG_80BIT(CONFIG_80BIT) 
       )
   bit_deselection_ram4_b
     (.output_config_i(RAM4_b_output_config_i),
      .clk_i          (RAM4_b_clk_i),
      .re_i           (RAM4_b_re_i),
      .addr_i         (RAM4_b_addr_i),
      .rddata_i       (RAM4_b_rddata_i),                            
      .rddata_o       (RAM4_b_rddata_o)
      );
   
endmodule // bit_deselection
