// This program was cloned from: https://github.com/colognechip/gatemate_ila
// License: GNU General Public License v3.0

// Company           :   racyics
// Author            :   winter
// E-Mail            :   <email>
//
// Filename          :   forward_selection_clk.v
// Project Name      :   p_cc
// Subproject Name   :   s_fpga, dpsram_block_4x512x20
// Description       :   <short description>
//
// Create Date       :   
// Last Change       :   $Date: 2015-03-11 10:16:31 +0100 (Wed, 11 Mar 2015) $
// by                :   $Author: winter $
//------------------------------------------------------------

module forward_selection_clk
  (input  wire [7:0]  cfg_forward_clk_i,
   
   input  wire        local_1_i,
   input  wire        local_2_i,
   input  wire        local_ab1_i,
   input  wire        local_ab2_i,
   
   input  wire        global_x1_i,
   input  wire        global_x2_i,
   input  wire        global_y1_i,
   input  wire        global_y2_i,
                    
   input  wire        forward_clk_up_i,
   input  wire        forward_clk_low_i,
                    
   output wire        forward_clk_up_o,
   output wire        forward_clk_low_o,
                    
   output wire        ram_clk_o
   );

   wire               local0_clk, local1_clk, local2_clk, local_clk;
   wire               global0_clk, global1_clk, global2_clk, global_clk;
   wire               ram0_clk, ram1_clk; 


   // 1st stage of clk-tree (1st and 2nd stage done in signal_inversion)
   common_clkmux
     clkmux_local0(.I0(local_1_i),
                   .I1(local_2_i),
                   .S (cfg_forward_clk_i[2]),
                   .Z (local0_clk));
   common_clkmux
     clkmux_local1(.I0(local_ab1_i),
                   .I1(local_ab2_i),
                   .S (cfg_forward_clk_i[2]),
                   .Z (local1_clk));
   
   common_clkmux
     clkmux_global0(.I0(global_y1_i),
                    .I1(global_y2_i),
                    .S (cfg_forward_clk_i[4]),
                    .Z (global0_clk));
   common_clkmux
     clkmux_global1(.I0(global_x1_i),
                    .I1(global_x2_i),
                    .S (cfg_forward_clk_i[4]),
                    .Z (global1_clk));
   
   // 2nd stage of clk-tree
   common_clkmux
     clkmux_local2(.I0(local0_clk),
                   .I1(local1_clk),
                   .S (cfg_forward_clk_i[3]),
                   .Z (local2_clk));
   common_clkmux
     clkmux_global2(.I0(global0_clk),
                    .I1(global1_clk),
                    .S (cfg_forward_clk_i[5]),
                    .Z (global2_clk));
   

   // 3rd stage of clk-tree
   // forwarded clocks have already 3 stages, so we require here a buffer
   common_clkbuf
     clkbuf_local(.I(local2_clk),
                  .Z(local_clk));
   common_clkbuf
     clkbuf_global(.I(global2_clk),
                   .Z(global_clk));
   common_clkmux
     clkmux_forwup(.I0(local2_clk),
                   .I1(forward_clk_low_i),
                   .S (cfg_forward_clk_i[7]),
                   .Z (forward_clk_up_o));
   common_clkmux
     clkmux_forwlow(.I0(local2_clk),
                    .I1(forward_clk_up_i),
                    .S (cfg_forward_clk_i[6]),
                    .Z (forward_clk_low_o));
   
   // 4th stage of clk-tree
   common_clkmux
     clkmux_ram0(.I0(local_clk),
                 .I1(forward_clk_low_i),
                 .S (cfg_forward_clk_i[0]),
                 .Z (ram0_clk));
   common_clkmux
     clkmux_ram1(.I0(forward_clk_up_i),
                 .I1(global_clk),
                 .S (cfg_forward_clk_i[0]),
                 .Z (ram1_clk));


   // 5th stage of clk-tree
   common_clkmux
     clkmux_ram2(.I0(ram0_clk),
                 .I1(ram1_clk),
                 .S (cfg_forward_clk_i[1]),
                 .Z (ram_clk_o));
   
endmodule
