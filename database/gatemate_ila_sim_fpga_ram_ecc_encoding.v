// This program was cloned from: https://github.com/colognechip/gatemate_ila
// License: GNU General Public License v3.0

// Company           :   RacyICs GmbH                      
// Author            :   winter          
// E-Mail            :   <email>                    
//                          
// Filename          :   ecc_encoding.v                
// Project Name      :   p_cc    
// Subproject Name   :   s_fpga    
// Description       :   <short description>            
//
// Create Date       :   Tue Aug  6 12:47:52 2013 
// Last Change       :   $Date: 2015-05-18 15:51:28 +0200 (Mon, 18 May 2015) $
// by                :   $Author: winter $                        
//------------------------------------------------------------

`timescale 1 ns / 1 ps

module ecc_encoding
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
    input  wire [1:0]  cfg_ecc_enable_i,
   
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
   
    // signals to mode-selection port A0
    output wire        a0_clk_o,
    output wire        a0_en_o,
    output wire        a0_we_o,
    output wire [15:0] a0_addr_o,
    output wire [19:0] a0_data_o,
    output wire [19:0] a0_bitmask_o,
    
    // signals to mode-selection port A1
    output wire        a1_clk_o,
    output wire        a1_en_o,
    output wire        a1_we_o,
    output wire [15:0] a1_addr_o,
    output wire [19:0] a1_data_o,
    output wire [19:0] a1_bitmask_o,
    
    // signals to mode-selection port B0
    output wire        b0_clk_o,
    output wire        b0_en_o,
    output wire        b0_we_o,
    output wire [15:0] b0_addr_o,
    output wire [19:0] b0_data_o,
    output wire [19:0] b0_bitmask_o,
    
    // signals to mode-selection port B1
    output wire        b1_clk_o,
    output wire        b1_en_o,
    output wire        b1_we_o,
    output wire [15:0] b1_addr_o,
    output wire [19:0] b1_data_o,
    output wire [19:0] b1_bitmask_o    
    );

   

   wire [31:0]         ecc_data_in0, ecc_data_in1;
   wire [38:0]         ecc_data_out0, ecc_data_out1;
 
   assign ecc_data_in0 = (cfg_ecc_enable_i[0]==1'b1 && cfg_sram_mode_i==CONFIG_TDP_NONSPLIT) ? {a1_data_i[15:0], a0_data_i[15:0]} :
                         (cfg_ecc_enable_i[0]==1'b1 && cfg_sram_mode_i==CONFIG_SDP_NONSPLIT) ? {a1_data_i[15:0], a0_data_i[15:0]} :
                         (cfg_ecc_enable_i[0]==1'b1 && cfg_sram_mode_i==CONFIG_SDP_SPLIT) ?    {b0_data_i[15:0], a0_data_i[15:0]} :
                         32'd0;
   assign ecc_data_in1 = (cfg_ecc_enable_i[0]==1'b1 && cfg_sram_mode_i==CONFIG_TDP_NONSPLIT) ? {b1_data_i[15:0], b0_data_i[15:0]} :
                         (cfg_ecc_enable_i[0]==1'b1 && cfg_sram_mode_i==CONFIG_SDP_NONSPLIT) ? {b1_data_i[15:0], b0_data_i[15:0]} :
                         (cfg_ecc_enable_i[1]==1'b1 && cfg_sram_mode_i==CONFIG_SDP_SPLIT) ?    {b1_data_i[15:0], a1_data_i[15:0]} :
                         32'd0;

   // TDP_NONSPLIT: port A (a1+a0), SDP_NONSPLIT: lower 40 bits (a1+a0), SDP_SPLIT: DPSRAM0 (b0+a0)
   ecc_encode ecc_encode_i0(.data_in(ecc_data_in0), .code_out(ecc_data_out0));
   // TDP_NONSPLIT: port B (b1+b0), SDP_NONSPLIT: upper 40 bits (b1+b0), SDP_SPLIT: DPSRAM1 (b1+a1)
   ecc_encode ecc_encode_i1(.data_in(ecc_data_in1), .code_out(ecc_data_out1));
   
   wire [19:0]         a0_data_ecc, a1_data_ecc, b0_data_ecc, b1_data_ecc;
   assign a0_data_ecc = {ecc_data_out0[19:0]};
   assign a1_data_ecc = (cfg_sram_mode_i==CONFIG_SDP_SPLIT) ? {ecc_data_out1[19:0]} : {1'b0,ecc_data_out0[38:20]};
   assign b0_data_ecc = (cfg_sram_mode_i==CONFIG_SDP_SPLIT) ? {1'b0,ecc_data_out0[38:20]} : {ecc_data_out1[19:0]};
   assign b1_data_ecc = {1'b0,ecc_data_out1[38:20]};

   
   
   assign a0_clk_o     = a0_clk_i    ;
   assign a0_en_o      = a0_en_i     ;
   assign a0_we_o      = a0_we_i     ;
   assign a0_addr_o    = a0_addr_i   ;
   
   assign a1_clk_o     = a1_clk_i    ;
   assign a1_en_o      = a1_en_i     ;
   assign a1_we_o      = a1_we_i     ;
   assign a1_addr_o    = a1_addr_i   ;
   
   assign b0_clk_o     = b0_clk_i    ;
   assign b0_en_o      = b0_en_i     ;
   assign b0_we_o      = b0_we_i     ;
   assign b0_addr_o    = b0_addr_i   ;
   
   assign b1_clk_o     = b1_clk_i    ;
   assign b1_en_o      = b1_en_i     ;
   assign b1_we_o      = b1_we_i     ;
   assign b1_addr_o    = b1_addr_i   ;

   ecc_encoding_mux
     #(.CONFIG_TDP_NONSPLIT(CONFIG_TDP_NONSPLIT),
       .CONFIG_TDP_SPLIT   (CONFIG_TDP_SPLIT   ),
       .CONFIG_SDP_NONSPLIT(CONFIG_SDP_NONSPLIT),
       .CONFIG_SDP_SPLIT   (CONFIG_SDP_SPLIT   ),
       .CONFIG_FIFO_ASYNC  (CONFIG_FIFO_ASYNC  ),
       .CONFIG_FIFO_SYNC   (CONFIG_FIFO_SYNC   ),
       .CONFIG_CASCADE_UP  (CONFIG_CASCADE_UP  ),
       .CONFIG_CASCADE_LOW (CONFIG_CASCADE_LOW )
       )
   ecc_encoding_mux_i0
     (.cfg_sram_mode_i (cfg_sram_mode_i ),
      .cfg_ecc_enable_i(cfg_ecc_enable_i),
      
      .a0_data_i   (a0_data_i   ),
      .a1_data_i   (a1_data_i   ),
      .b0_data_i   (b0_data_i   ),
      .b1_data_i   (b1_data_i   ),
      .a0_bitmask_i(a0_bitmask_i),
      .a1_bitmask_i(a1_bitmask_i),
      .b0_bitmask_i(b0_bitmask_i),
      .b1_bitmask_i(b1_bitmask_i),
      
      .a0_data_ecc_i(a0_data_ecc),
      .a1_data_ecc_i(a1_data_ecc),
      .b0_data_ecc_i(b0_data_ecc),
      .b1_data_ecc_i(b1_data_ecc),   
      
      .a0_data_o   (a0_data_o   ),
      .a1_data_o   (a1_data_o   ),
      .b0_data_o   (b0_data_o   ), 
      .b1_data_o   (b1_data_o   ),
      .a0_bitmask_o(a0_bitmask_o),
      .a1_bitmask_o(a1_bitmask_o),
      .b0_bitmask_o(b0_bitmask_o),
      .b1_bitmask_o(b1_bitmask_o)
      );
   
endmodule // ecc_encoding

