// This program was cloned from: https://github.com/colognechip/gatemate_ila
// License: GNU General Public License v3.0

// Company           :   racyics
// Author            :   winter
// E-Mail            :   <email>
//
// Filename          :   bit_deselection_mux.v
// Project Name      :   p_cc
// Subproject Name   :   s_fpga, dpsram_block_4x512x20
// Description       :   <short description>
//
// Create Date       :   
// Last Change       :   $Date: 2015-03-11 10:16:31 +0100 (Wed, 11 Mar 2015) $
// by                :   $Author: winter $
//------------------------------------------------------------

`timescale 1 ns / 1 ps

module bit_deselection_mux
  #(parameter CONFIG_1BIT  = 3'd1, //non-split-->32k x 1 bit; split-->16K x 1 bit
    parameter CONFIG_2BIT  = 3'd2, //non-split-->16k x 2 bit; split-->8K x 2 bit
    parameter CONFIG_5BIT  = 3'd3, //non-split-->8k  x 5 bit; split-->4K x 5 bit
    parameter CONFIG_10BIT = 3'd4, //non-split-->4k  x 10 bit; split-->2K x 10 bit
    parameter CONFIG_20BIT = 3'd5, //non-split-->2k  x 20 bit; split-->1K x 20 bit
    parameter CONFIG_40BIT = 3'd6, //non-split-->1K  x 40 bit; split (SPR)-->512 x 40 bit
    parameter CONFIG_80BIT = 3'd7  //non-split(SPR)-->512 x 80 bit; split-->NA
    )
  (// signals from mode_selection
   input  wire [2:0]  output_config_i,
   input  wire [19:0] rddata_i,
   input  wire [19:0] aligned_rddata_i,
   output wire [19:0] rddata_o
   );
       

   assign rddata_o = (output_config_i==CONFIG_20BIT ||
                      output_config_i==CONFIG_40BIT ||
                      output_config_i==CONFIG_80BIT) ? rddata_i : aligned_rddata_i;

endmodule // bit_deselection_mux
