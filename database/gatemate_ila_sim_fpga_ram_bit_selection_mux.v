// Company           :   racyics
// Author            :   winter
// E-Mail            :   <email>
//
// Filename          :   bit_selection_mux.v
// Project Name      :   p_cc
// Subproject Name   :   s_fpga, dpsram_block_4x512x20
// Description       :   <short description>
//
// Create Date       :   
// Last Change       :   $Date: 2015-03-11 10:16:31 +0100 (Wed, 11 Mar 2015) $
// by                :   $Author: winter $
//------------------------------------------------------------

`timescale 1 ns / 1 ps

module bit_selection_mux
  #(parameter CONFIG_1BIT  = 3'd1, //non-split-->32k x 1 bit; split-->16K x 1 bit
    parameter CONFIG_2BIT  = 3'd2, //non-split-->16k x 2 bit; split-->8K x 2 bit
    parameter CONFIG_5BIT  = 3'd3, //non-split-->8k  x 5 bit; split-->4K x 5 bit
    parameter CONFIG_10BIT = 3'd4, //non-split-->4k  x 10 bit; split-->2K x 10 bit
    parameter CONFIG_20BIT = 3'd5, //non-split-->2k  x 20 bit; split-->1K x 20 bit
    parameter CONFIG_40BIT = 3'd6, //non-split-->1K  x 40 bit; split (SPR)-->512 x 40 bit
    parameter CONFIG_80BIT = 3'd7  //non-split(SPR)-->512 x 80 bit; split-->NA
    )
  (// signals from mode_selection
   input  wire        bist_active_i,
   input  wire [2:0]  input_config_i,
   input  wire [19:0] wrdata_i,
   input  wire [19:0] aligned_wrdata_i,
   output wire [19:0] wrdata_o,
   input  wire [19:0] bitmask_i,
   input  wire [19:0] aligned_bitmask_i,
   output wire [19:0] bitmask_o
   );
       

   wire 	      mux_sel;
   assign mux_sel = (input_config_i==CONFIG_20BIT ||
                     input_config_i==CONFIG_40BIT ||
                     input_config_i==CONFIG_80BIT) && (bist_active_i==1'b0);

   genvar 	      geni;
   generate
      for(geni=0;geni<20;geni=geni+1) begin: bistMUX
	 common_mux2 
	   i_common_mux2_data(
			    .I0(aligned_wrdata_i[geni]),
			    .I1(wrdata_i[geni]),
			    .S(mux_sel),
			    .Z(wrdata_o[geni])
			    );
	 common_mux2 
	   i_common_mux2_mask(
			    .I0(aligned_bitmask_i[geni]),
			    .I1(bitmask_i[geni]),
			    .S(mux_sel),
			    .Z(bitmask_o[geni])
			    );
      end
   endgenerate

   /*
   assign wrdata_o  = ((input_config_i==CONFIG_20BIT ||
                       input_config_i==CONFIG_40BIT ||
                       input_config_i==CONFIG_80BIT) && (bist_active_i==1'b0)) ? wrdata_i : aligned_wrdata_i;
   assign bitmask_o = ((input_config_i==CONFIG_20BIT ||
                       input_config_i==CONFIG_40BIT ||
                       input_config_i==CONFIG_80BIT) && (bist_active_i==1'b0)) ? bitmask_i : aligned_bitmask_i;
    */

endmodule // bit_selection_mux
