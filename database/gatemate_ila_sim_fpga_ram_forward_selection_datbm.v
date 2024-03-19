// Company           :   racyics
// Author            :   winter
// E-Mail            :   <email>
//
// Filename          :   forward_selection_datbm.v
// Project Name      :   p_cc
// Subproject Name   :   s_fpga, dpsram_block_4x512x20
// Description       :   <short description>
//
// Create Date       :   
// Last Change       :   $Date: 2015-03-11 10:16:31 +0100 (Wed, 11 Mar 2015) $
// by                :   $Author: winter $
//------------------------------------------------------------

module forward_selection_datbm
  (input  wire        cfg_datbm_sel_i,
   input  wire [1:0]  cfg_cascade_enable_i,
   
   input  wire [19:0] data_i,
   input  wire [19:0] bitmask_i,
   
   output wire [19:0] data_o,
   output wire [19:0] bitmask_o,

   input  wire        forward_cascade_data_i,
   output wire        forward_cascade_data_o, 
   input  wire        forward_cascade_bitmask_i,
   output wire        forward_cascade_bitmask_o    
   );

   wire [19:0]        data;
   wire [19:0]        bitmask;
   genvar             geni;
   generate
      for(geni=0;geni<10;geni=geni+1) begin: datbm_flip
         assign bitmask[2*geni+0] = (cfg_datbm_sel_i==1'b1) ? bitmask_i[2*geni+0] : bitmask_i[2*geni+0];
         assign bitmask[2*geni+1] = (cfg_datbm_sel_i==1'b1) ? data_i[2*geni+0]    : bitmask_i[2*geni+1];
         assign data[2*geni+0]    = (cfg_datbm_sel_i==1'b1) ? bitmask_i[2*geni+1] : data_i[2*geni+0];
         assign data[2*geni+1]    = (cfg_datbm_sel_i==1'b1) ? data_i[2*geni+1]    : data_i[2*geni+1];
      end
   endgenerate

   assign bitmask_o = (cfg_cascade_enable_i[0]==1'b1) ? {19'd0,forward_cascade_bitmask_i} : // lower part of cascaded memory
                      bitmask; // upper pat of cascaded memory or no cascade
   assign data_o    = (cfg_cascade_enable_i[0]==1'b1) ? {19'd0,forward_cascade_data_i} : // lower part of cascaded memory
                      data; // upper pat of cascaded memory or no cascade
   assign forward_cascade_data_o    = (cfg_cascade_enable_i[1]==1'b1) ? data[0]    : 1'b0;
   assign forward_cascade_bitmask_o = (cfg_cascade_enable_i[1]==1'b1) ? bitmask[0] : 1'b0;
   
endmodule // forward_selection_datbm

