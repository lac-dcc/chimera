// Company           :   RacyICs GmbH                      
// Author            :   winter          
// E-Mail            :   <email>                    
//                          
// Filename          :   ecc_encoding_mux.v                
// Project Name      :   p_cc    
// Subproject Name   :   s_fpga    
// Description       :   <short description>            
//
// Create Date       :   Tue Aug  6 12:47:52 2013 
// Last Change       :   $Date: 2015-03-11 10:16:31 +0100 (Wed, 11 Mar 2015) $
// by                :   $Author: winter $                        
//------------------------------------------------------------

`timescale 1 ns / 1 ps

module ecc_encoding_mux
  #(parameter  CONFIG_TDP_NONSPLIT = 3'd0,
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
   
    input  wire [19:0] a0_data_i,
    input  wire [19:0] a1_data_i,
    input  wire [19:0] b0_data_i,
    input  wire [19:0] b1_data_i,
    input  wire [19:0] a0_bitmask_i,
    input  wire [19:0] a1_bitmask_i,
    input  wire [19:0] b0_bitmask_i,
    input  wire [19:0] b1_bitmask_i,
   
    input  wire [19:0] a0_data_ecc_i,
    input  wire [19:0] a1_data_ecc_i,
    input  wire [19:0] b0_data_ecc_i,
    input  wire [19:0] b1_data_ecc_i,   
    
    output wire [19:0] a0_data_o,
    output wire [19:0] a1_data_o,
    output wire [19:0] b0_data_o,
    output wire [19:0] b1_data_o,
    output wire [19:0] a0_bitmask_o,
    output wire [19:0] a1_bitmask_o,
    output wire [19:0] b0_bitmask_o,
    output wire [19:0] b1_bitmask_o
    );

   assign a0_data_o    = (cfg_ecc_enable_i[0]==1'b1) ? a0_data_ecc_i : a0_data_i;
   assign a0_bitmask_o = (cfg_ecc_enable_i[0]==1'b1) ? {20'hfffff}   : a0_bitmask_i;
   
   assign a1_data_o    = ((cfg_ecc_enable_i[0]==1'b1 && cfg_sram_mode_i==CONFIG_TDP_NONSPLIT) ||
                          (cfg_ecc_enable_i[0]==1'b1 && cfg_sram_mode_i==CONFIG_SDP_NONSPLIT) ||
                          (cfg_ecc_enable_i[1]==1'b1 && cfg_sram_mode_i==CONFIG_SDP_SPLIT)) ? a1_data_ecc_i : a1_data_i;
   assign a1_bitmask_o = ((cfg_ecc_enable_i[0]==1'b1 && cfg_sram_mode_i==CONFIG_TDP_NONSPLIT) ||
                          (cfg_ecc_enable_i[0]==1'b1 && cfg_sram_mode_i==CONFIG_SDP_NONSPLIT) ||
                          (cfg_ecc_enable_i[1]==1'b1 && cfg_sram_mode_i==CONFIG_SDP_SPLIT)) ? {20'hfffff}   : a1_bitmask_i;
   
   assign b0_data_o    = (cfg_ecc_enable_i[0]==1'b1) ? b0_data_ecc_i : b0_data_i;
   assign b0_bitmask_o = (cfg_ecc_enable_i[0]==1'b1) ? {20'hfffff}   : b0_bitmask_i;
   
   assign b1_data_o    = ((cfg_ecc_enable_i[0]==1'b1 && cfg_sram_mode_i==CONFIG_TDP_NONSPLIT) ||
                          (cfg_ecc_enable_i[0]==1'b1 && cfg_sram_mode_i==CONFIG_SDP_NONSPLIT) ||
                          (cfg_ecc_enable_i[1]==1'b1 && cfg_sram_mode_i==CONFIG_SDP_SPLIT)) ? b1_data_ecc_i : b1_data_i;
   assign b1_bitmask_o = ((cfg_ecc_enable_i[0]==1'b1 && cfg_sram_mode_i==CONFIG_TDP_NONSPLIT) ||
                          (cfg_ecc_enable_i[0]==1'b1 && cfg_sram_mode_i==CONFIG_SDP_NONSPLIT) ||
                          (cfg_ecc_enable_i[1]==1'b1 && cfg_sram_mode_i==CONFIG_SDP_SPLIT)) ? {20'hfffff}   : b1_bitmask_i;
   
endmodule // ecc_encoding_mux

