// Company           :   RacyICs GmbH                      
// Author            :   glueck
// E-Mail            :   <email>                    
//                          
// Filename          :   data_forwarding.v                
// Project Name      :   p_cc    
// Subproject Name   :   s_fpga    
// Description       :   <short description>            
//
// Create Date       :   Mon Oct  12 12:47:52 2015 
// Last Change       :   $Date: 2015-10-12 12:47:52 +0200 (Mon, 12 Oct 2015) $
// by                :   $Author: glueck $                        
//------------------------------------------------------------

`timescale 1 ns / 1 ps

module data_forwarding
   (
   input  wire        clk_i,
   input  wire        bist_enable_i,
   input  wire        y_select_i,
   input  wire [39:0] rddata_i,
   input  wire [39:0] bist_rddata_i,
   output wire [39:0] bist_rddata_o
    );


   reg 		      use_own_data;

   always @(posedge clk_i) begin
      use_own_data <= (bist_enable_i == 1'b1) && y_select_i;
   end
   
   assign bist_rddata_o = (use_own_data)? rddata_i : bist_rddata_i;

endmodule //data_forwarding