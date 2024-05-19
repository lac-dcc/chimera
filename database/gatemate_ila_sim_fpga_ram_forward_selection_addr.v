// This program was cloned from: https://github.com/colognechip/gatemate_ila
// License: GNU General Public License v3.0

// Company           :   racyics
// Author            :   winter
// E-Mail            :   <email>
//
// Filename          :   forward_selection_addr.v
// Project Name      :   p_cc
// Subproject Name   :   s_fpga, dpsram_block_4x512x20
// Description       :   <short description>
//
// Create Date       :   
// Last Change       :   $Date: 2015-03-26 09:25:47 +0100 (Thu, 26 Mar 2015) $
// by                :   $Author: winter $
//------------------------------------------------------------

module forward_selection_addr
  (input  wire [7:0]  cfg_forward_addr_i,
   
   input  wire [15:0] x0_addr1_local_i,
   input  wire [15:0] x0_addr2_local_i,
   input  wire [15:0] x1_addr1_local_i,
   input  wire [15:0] x1_addr2_local_i,
   input  wire [15:0] forward_addr_up_i,
   input  wire [15:0] forward_addr_low_i,
   
   output wire [15:0] forward_addr_up_o,
   output wire [15:0] forward_addr_low_o,
   
   output wire [15:0] x0_addr_o,
   output wire [15:0] x1_addr_o
   );

   wire [15:0] x0_addr_local;
   wire [15:0] x1_addr_local;
                      
   assign x0_addr_local = (cfg_forward_addr_i[6]==1'b0) ? x0_addr1_local_i : x0_addr2_local_i;
   assign x1_addr_local = (cfg_forward_addr_i[7]==1'b0) ? x1_addr1_local_i : x1_addr2_local_i;


   assign x0_addr_o = (cfg_forward_addr_i[1:0]==2'b00) ? x0_addr_local : 
                      (cfg_forward_addr_i[1:0]==2'b01) ? x1_addr_local : 
                      (cfg_forward_addr_i[1:0]==2'b10) ? forward_addr_low_i : 
                                                         forward_addr_up_i;

   assign x1_addr_o = (cfg_forward_addr_i[3:2]==2'b00) ? x1_addr_local : 
                      (cfg_forward_addr_i[3:2]==2'b01) ? x0_addr_local : 
                      (cfg_forward_addr_i[3:2]==2'b10) ? forward_addr_low_i : 
                                                         forward_addr_up_i;

   assign forward_addr_up_o  = (cfg_forward_addr_i[5]==1'b0) ? x0_addr_local : 
                                                               forward_addr_low_i;

   assign forward_addr_low_o = (cfg_forward_addr_i[4]==1'b0) ? x0_addr_local : 
                                                               forward_addr_up_i;
   
endmodule
