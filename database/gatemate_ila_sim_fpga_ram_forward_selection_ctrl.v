// This program was cloned from: https://github.com/colognechip/gatemate_ila
// License: GNU General Public License v3.0

// Company           :   racyics
// Author            :   winter
// E-Mail            :   <email>
//
// Filename          :   forward_selection_ctrl.v
// Project Name      :   p_cc
// Subproject Name   :   s_fpga, dpsram_block_4x512x20
// Description       :   <short description>
//
// Create Date       :   
// Last Change       :   $Date: 2015-03-11 10:16:31 +0100 (Wed, 11 Mar 2015) $
// by                :   $Author: winter $
//------------------------------------------------------------

module forward_selection_ctrl
  (input  wire [7:0]  cfg_forward_ctrl_i,
   
   input  wire        local_1_i,
   input  wire        local_2_i,
   input  wire        local_ab1_i,
   input  wire        local_ab2_i,
   
   input  wire        global_x1_i,
   input  wire        global_x2_i,
   input  wire        global_y1_i,
   input  wire        global_y2_i,
                    
   input  wire        forward_sig_up_i,
   input  wire        forward_sig_low_i,
                    
   output wire        forward_sig_up_o,
   output wire        forward_sig_low_o,
                    
   output wire        ram_sig_o
   );

   wire               local_sel, global_sel;

   assign local_sel = (cfg_forward_ctrl_i[3:2]==2'b00) ? local_1_i : 
                      (cfg_forward_ctrl_i[3:2]==2'b01) ? local_2_i : 
                      (cfg_forward_ctrl_i[3:2]==2'b10) ? local_ab1_i : 
                                                         local_ab2_i; 

   assign global_sel = (cfg_forward_ctrl_i[5:4]==2'b00) ? global_y1_i : 
                       (cfg_forward_ctrl_i[5:4]==2'b01) ? global_y2_i : 
                       (cfg_forward_ctrl_i[5:4]==2'b10) ? global_x1_i : 
                                                          global_x2_i; 

   assign ram_sig_o = (cfg_forward_ctrl_i[1:0]==2'b00) ? local_sel : 
                      (cfg_forward_ctrl_i[1:0]==2'b01) ? forward_sig_low_i : 
                      (cfg_forward_ctrl_i[1:0]==2'b10) ? forward_sig_up_i : 
                                                         global_sel;

   assign forward_sig_up_o  = (cfg_forward_ctrl_i[7]==1'b0) ? local_sel : 
                                                              forward_sig_low_i;

   assign forward_sig_low_o = (cfg_forward_ctrl_i[6]==1'b0) ? local_sel : 
                                                              forward_sig_up_i;
   
endmodule
