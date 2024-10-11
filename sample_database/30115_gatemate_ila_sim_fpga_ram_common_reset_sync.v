// This program was cloned from: https://github.com/colognechip/gatemate_ila
// License: GNU General Public License v3.0

// Company           :   RacyICs
// Author            :   eisenreich            
// E-Mail            :   eisenreich@racyics.com                    
//                                
// Filename          :   common_reset_sync.v                
// Project Name      :   p_ri    
// Subproject Name   :   s_common    
// Description       :   common cell for reset synchronization            
//
// Create Date       :   Thu Jun 13 11:59:54 2013 
// Last Change       :   $Date$
// by                :   $Author$                              
// -----------------------------------------------------------------------------
// Version   |  Author    |  Date         |  Comment
// -----------------------------------------------------------------------------
// 1.0       |  eisenreich  | 13 Juni 2013   |  initial release
// -----------------------------------------------------------------------------
module common_reset_sync (
               clk_i,
               reset_q_i,
               scan_mode_i,
               sync_reset_q_o
               );

   input  clk_i;
   input  reset_q_i;
   input  scan_mode_i;

   output sync_reset_q_o;

   wire   sync_reset_q_o;
`ifdef FPGA_IMPL
   (* INIT = 1, SHREG_EXTRACT = "NO", RLOC = "X0Y0" *)
`endif
   reg    sync_reset_q_syn0;
`ifdef FPGA_IMPL
   (* INIT = 1, SHREG_EXTRACT = "NO", RLOC = "X0Y0" *)
`endif
   reg    sync_reset_q_syn1;

   always@(posedge clk_i or negedge reset_q_i)
   begin
      if(reset_q_i == 1'b0)
      begin
         sync_reset_q_syn0 <= 1'b0;
         sync_reset_q_syn1 <= 1'b0;
      end
      else
      begin
         sync_reset_q_syn1 <= sync_reset_q_syn0;
         sync_reset_q_syn0 <= 1'b1;
      end
   end

   assign sync_reset_q_o = (scan_mode_i) ? reset_q_i : sync_reset_q_syn1;

endmodule
