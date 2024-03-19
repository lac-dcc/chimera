// Company           :   racyics
// Author            :   winter
// E-Mail            :   <email>
//
// Filename          :   forward_selection.v
// Project Name      :   p_cc
// Subproject Name   :   s_fpga, dpsram_block_4x512x20
// Description       :   <short description>
//
// Create Date       :   
// Last Change       :   $Date: 2015-03-26 09:25:47 +0100 (Thu, 26 Mar 2015) $
// by                :   $Author: winter $
//------------------------------------------------------------

`timescale 1 ns / 1 ps

module forward_selection
  (input  wire [7:0]  cfg_forward_a_addr_i,
   input  wire [7:0]  cfg_forward_b_addr_i,
   
   input  wire [7:0]  cfg_forward_a0_clk_i,
   input  wire [7:0]  cfg_forward_a0_en_i,
   input  wire [7:0]  cfg_forward_a0_we_i,
   input  wire [7:0]  cfg_forward_a1_clk_i,
   input  wire [7:0]  cfg_forward_a1_en_i,
   input  wire [7:0]  cfg_forward_a1_we_i,
   input  wire [7:0]  cfg_forward_b0_clk_i,
   input  wire [7:0]  cfg_forward_b0_en_i,
   input  wire [7:0]  cfg_forward_b0_we_i,
   input  wire [7:0]  cfg_forward_b1_clk_i,
   input  wire [7:0]  cfg_forward_b1_en_i,
   input  wire [7:0]  cfg_forward_b1_we_i,

   input  wire [3:0]  cfg_datbm_sel_i,
   input  wire [1:0]  cfg_cascade_enable_i,


   // Global clocks
   input  wire        global_clk_x1_i,
   input  wire        global_clk_x2_i,
   input  wire        global_clk_y1_i,
   input  wire        global_clk_y2_i,
   
   // DPSRAM-block port A0
   input  wire        a0_clk1_i,
   input  wire        a0_clk2_i,
   input  wire        a0_en1_i,
   input  wire        a0_en2_i,
   input  wire        a0_we1_i,
   input  wire        a0_we2_i,
   input  wire [15:0] a0_addr1_i,
   input  wire [15:0] a0_addr2_i,
   input  wire [19:0] a0_data_i,
   input  wire [19:0] a0_bitmask_i,
   
   // DPSRAM-block port A1
   input  wire        a1_clk1_i,
   input  wire        a1_clk2_i,
   input  wire        a1_en1_i,
   input  wire        a1_en2_i,
   input  wire        a1_we1_i,
   input  wire        a1_we2_i,
   input  wire [15:0] a1_addr1_i,
   input  wire [15:0] a1_addr2_i,
   input  wire [19:0] a1_data_i,
   input  wire [19:0] a1_bitmask_i,
   
   // DPSRAM-block port B0
   input  wire        b0_clk1_i,
   input  wire        b0_clk2_i,
   input  wire        b0_en1_i,
   input  wire        b0_en2_i,
   input  wire        b0_we1_i,
   input  wire        b0_we2_i,
   input  wire [15:0] b0_addr1_i,
   input  wire [15:0] b0_addr2_i,
   input  wire [19:0] b0_data_i,
   input  wire [19:0] b0_bitmask_i,
   
   // DPSRAM-block port B1
   input  wire        b1_clk1_i,
   input  wire        b1_clk2_i,
   input  wire        b1_en1_i,
   input  wire        b1_en2_i,
   input  wire        b1_we1_i,
   input  wire        b1_we2_i,
   input  wire [15:0] b1_addr1_i,
   input  wire [15:0] b1_addr2_i,
   input  wire [19:0] b1_data_i,
   input  wire [19:0] b1_bitmask_i,


   // forward signals addr
   input  wire [15:0] forward_low_a_addr_i,
   input  wire [15:0] forward_up_a_addr_i,
   output wire [15:0] forward_low_a_addr_o,
   output wire [15:0] forward_up_a_addr_o,
   input  wire [15:0] forward_low_b_addr_i,
   input  wire [15:0] forward_up_b_addr_i,
   output wire [15:0] forward_low_b_addr_o,
   output wire [15:0] forward_up_b_addr_o,

   
   // forward signals cascade mode
   input  wire        forward_cascade_data_a_i,
   input  wire        forward_cascade_data_b_i,
   output wire        forward_cascade_data_a_o,
   output wire        forward_cascade_data_b_o,
   input  wire        forward_cascade_bitmask_a_i,
   input  wire        forward_cascade_bitmask_b_i,
   output wire        forward_cascade_bitmask_a_o,
   output wire        forward_cascade_bitmask_b_o,
   
   
   // forward signals port A0 
   input  wire        forward_low_a0_clk_i,
   input  wire        forward_low_a0_en_i,
   input  wire        forward_low_a0_we_i,
   input  wire        forward_up_a0_clk_i,
   input  wire        forward_up_a0_en_i,
   input  wire        forward_up_a0_we_i,
   output wire        forward_low_a0_clk_o,
   output wire        forward_low_a0_en_o,
   output wire        forward_low_a0_we_o,
   output wire        forward_up_a0_clk_o,
   output wire        forward_up_a0_en_o,
   output wire        forward_up_a0_we_o,

   // forward signals port A1   
   input  wire        forward_low_a1_clk_i,
   input  wire        forward_low_a1_en_i,
   input  wire        forward_low_a1_we_i,
   input  wire        forward_up_a1_clk_i,
   input  wire        forward_up_a1_en_i,
   input  wire        forward_up_a1_we_i,
   output wire        forward_low_a1_clk_o,
   output wire        forward_low_a1_en_o,
   output wire        forward_low_a1_we_o,
   output wire        forward_up_a1_clk_o,
   output wire        forward_up_a1_en_o,
   output wire        forward_up_a1_we_o,

   // forward signals port B0   
   input  wire        forward_low_b0_clk_i,
   input  wire        forward_low_b0_en_i,
   input  wire        forward_low_b0_we_i,
   input  wire        forward_up_b0_clk_i,
   input  wire        forward_up_b0_en_i,
   input  wire        forward_up_b0_we_i,
   output wire        forward_low_b0_clk_o,
   output wire        forward_low_b0_en_o,
   output wire        forward_low_b0_we_o,
   output wire        forward_up_b0_clk_o,
   output wire        forward_up_b0_en_o,
   output wire        forward_up_b0_we_o,

   // forward signals port B1   
   input  wire        forward_low_b1_clk_i,
   input  wire        forward_low_b1_en_i,
   input  wire        forward_low_b1_we_i,
   input  wire        forward_up_b1_clk_i,
   input  wire        forward_up_b1_en_i,
   input  wire        forward_up_b1_we_i,
   output wire        forward_low_b1_clk_o,
   output wire        forward_low_b1_en_o,
   output wire        forward_low_b1_we_o,
   output wire        forward_up_b1_clk_o,
   output wire        forward_up_b1_en_o,
   output wire        forward_up_b1_we_o,

   
   // post-forward-selected port A0
   output wire        a0_clk_o,
   output wire        a0_en_o,
   output wire        a0_we_o,
   output wire [15:0] a0_addr_o,
   output wire [19:0] a0_data_o,
   output wire [19:0] a0_bitmask_o,
   
   // post-forward-selected port A1
   output wire        a1_clk_o,
   output wire        a1_en_o,
   output wire        a1_we_o,
   output wire [15:0] a1_addr_o,
   output wire [19:0] a1_data_o,
   output wire [19:0] a1_bitmask_o,
   
   // post-forward-selected port B0
   output wire        b0_clk_o,
   output wire        b0_en_o,
   output wire        b0_we_o,
   output wire [15:0] b0_addr_o,
   output wire [19:0] b0_data_o,
   output wire [19:0] b0_bitmask_o,
   
   // post-forward-selected port B1
   output wire        b1_clk_o,
   output wire        b1_en_o,
   output wire        b1_we_o,
   output wire [15:0] b1_addr_o,
   output wire [19:0] b1_data_o,
   output wire [19:0] b1_bitmask_o  
   );


   forward_selection_addr
     forward_selection_addr_a
       (.cfg_forward_addr_i(cfg_forward_a_addr_i),
        
        .x0_addr1_local_i  (a0_addr1_i),
        .x0_addr2_local_i  (a0_addr2_i),
        .x1_addr1_local_i  (a1_addr1_i),
        .x1_addr2_local_i  (a1_addr2_i),
        .forward_addr_up_i (forward_up_a_addr_i),
        .forward_addr_low_i(forward_low_a_addr_i),
        
        .forward_addr_up_o (forward_up_a_addr_o),
        .forward_addr_low_o(forward_low_a_addr_o),
        
        .x0_addr_o(a0_addr_o),
        .x1_addr_o(a1_addr_o)
        );
   forward_selection_addr
     forward_selection_addr_b
       (.cfg_forward_addr_i(cfg_forward_b_addr_i),
        
        .x0_addr1_local_i  (b0_addr1_i),
        .x0_addr2_local_i  (b0_addr2_i),
        .x1_addr1_local_i  (b1_addr1_i),
        .x1_addr2_local_i  (b1_addr2_i),
        .forward_addr_up_i (forward_up_b_addr_i),
        .forward_addr_low_i(forward_low_b_addr_i),
        
        .forward_addr_up_o (forward_up_b_addr_o),
        .forward_addr_low_o(forward_low_b_addr_o),
        
        .x0_addr_o(b0_addr_o),
        .x1_addr_o(b1_addr_o)
        );

   forward_selection_datbm
     forward_selection_datbm_a0
       (.cfg_datbm_sel_i          (cfg_datbm_sel_i[0]),
        .cfg_cascade_enable_i     (cfg_cascade_enable_i),
        .data_i                   (a0_data_i   ),
        .bitmask_i                (a0_bitmask_i),
        .data_o                   (a0_data_o   ),
        .bitmask_o                (a0_bitmask_o),
        .forward_cascade_data_i   (forward_cascade_data_a_i),
        .forward_cascade_data_o   (forward_cascade_data_a_o), 
        .forward_cascade_bitmask_i(forward_cascade_bitmask_a_i),
        .forward_cascade_bitmask_o(forward_cascade_bitmask_a_o)    
        );
   forward_selection_datbm
     forward_selection_datbm_a1
       (.cfg_datbm_sel_i          (cfg_datbm_sel_i[1]),
        .cfg_cascade_enable_i     (2'd0),
        .data_i                   (a1_data_i   ),
        .bitmask_i                (a1_bitmask_i),
        .data_o                   (a1_data_o   ),
        .bitmask_o                (a1_bitmask_o),
        .forward_cascade_data_i   (1'b0),
        .forward_cascade_data_o   (), 
        .forward_cascade_bitmask_i(1'b0),
        .forward_cascade_bitmask_o()
        );
   forward_selection_datbm
     forward_selection_datbm_b0
       (.cfg_datbm_sel_i          (cfg_datbm_sel_i[2]),
        .cfg_cascade_enable_i     (cfg_cascade_enable_i),
        .data_i                   (b0_data_i   ),
        .bitmask_i                (b0_bitmask_i),
        .data_o                   (b0_data_o   ),
        .bitmask_o                (b0_bitmask_o),
        .forward_cascade_data_i   (forward_cascade_data_b_i),
        .forward_cascade_data_o   (forward_cascade_data_b_o), 
        .forward_cascade_bitmask_i(forward_cascade_bitmask_b_i),
        .forward_cascade_bitmask_o(forward_cascade_bitmask_b_o)
        );
   forward_selection_datbm
     forward_selection_datbm_b1
       (.cfg_datbm_sel_i          (cfg_datbm_sel_i[3]),
        .cfg_cascade_enable_i     (2'd0),
        .data_i                   (b1_data_i   ),
        .bitmask_i                (b1_bitmask_i),
        .data_o                   (b1_data_o   ),
        .bitmask_o                (b1_bitmask_o),
        .forward_cascade_data_i   (1'b0),
        .forward_cascade_data_o   (), 
        .forward_cascade_bitmask_i(1'b0),
        .forward_cascade_bitmask_o()
        );
   
   forward_selection_clk
     forward_selection_clk_a0
       (.cfg_forward_clk_i(cfg_forward_a0_clk_i),
        
        .local_1_i        (a0_clk1_i),
        .local_2_i        (a0_clk2_i),
        .local_ab1_i      (b0_clk1_i),
        .local_ab2_i      (b0_clk2_i),
                          
        .global_x1_i      (global_clk_x1_i),
        .global_x2_i      (global_clk_x2_i),
        .global_y1_i      (global_clk_y1_i),
        .global_y2_i      (global_clk_y2_i),
   
        .forward_clk_up_i (forward_up_a0_clk_i),
        .forward_clk_low_i(forward_low_a0_clk_i),
   
        .forward_clk_up_o (forward_up_a0_clk_o),
        .forward_clk_low_o(forward_low_a0_clk_o),
   
        .ram_clk_o        (a0_clk_o)
        );
   forward_selection_clk
     forward_selection_clk_a1
       (.cfg_forward_clk_i(cfg_forward_a1_clk_i),
        
        .local_1_i        (a1_clk1_i),
        .local_2_i        (a1_clk2_i),
        .local_ab1_i      (b1_clk1_i),
        .local_ab2_i      (b1_clk2_i),
                          
        .global_x1_i      (global_clk_x1_i),
        .global_x2_i      (global_clk_x2_i),
        .global_y1_i      (global_clk_y1_i),
        .global_y2_i      (global_clk_y2_i),
   
        .forward_clk_up_i (forward_up_a1_clk_i),
        .forward_clk_low_i(forward_low_a1_clk_i),
   
        .forward_clk_up_o (forward_up_a1_clk_o),
        .forward_clk_low_o(forward_low_a1_clk_o),
   
        .ram_clk_o        (a1_clk_o)
        );
   forward_selection_clk
     forward_selection_clk_b0
       (.cfg_forward_clk_i(cfg_forward_b0_clk_i),
        
        .local_1_i        (b0_clk1_i),
        .local_2_i        (b0_clk2_i),
        .local_ab1_i      (a0_clk1_i),
        .local_ab2_i      (a0_clk2_i),
                          
        .global_x1_i      (global_clk_x1_i),
        .global_x2_i      (global_clk_x2_i),
        .global_y1_i      (global_clk_y1_i),
        .global_y2_i      (global_clk_y2_i),
   
        .forward_clk_up_i (forward_up_b0_clk_i),
        .forward_clk_low_i(forward_low_b0_clk_i),
   
        .forward_clk_up_o (forward_up_b0_clk_o),
        .forward_clk_low_o(forward_low_b0_clk_o),
   
        .ram_clk_o        (b0_clk_o)
        );
   forward_selection_clk
     forward_selection_clk_b1
       (.cfg_forward_clk_i(cfg_forward_b1_clk_i),
        
        .local_1_i        (b1_clk1_i),
        .local_2_i        (b1_clk2_i),
        .local_ab1_i      (a1_clk1_i),
        .local_ab2_i      (a1_clk2_i),
                          
        .global_x1_i      (global_clk_x1_i),
        .global_x2_i      (global_clk_x2_i),
        .global_y1_i      (global_clk_y1_i),
        .global_y2_i      (global_clk_y2_i),
   
        .forward_clk_up_i (forward_up_b1_clk_i),
        .forward_clk_low_i(forward_low_b1_clk_i),
   
        .forward_clk_up_o (forward_up_b1_clk_o),
        .forward_clk_low_o(forward_low_b1_clk_o),
   
        .ram_clk_o        (b1_clk_o)
        );

   forward_selection_ctrl
     forward_selection_en_a0
       (.cfg_forward_ctrl_i(cfg_forward_a0_en_i),
        
        .local_1_i         (a0_en1_i),
        .local_2_i         (a0_en2_i),
        .local_ab1_i       (b0_en1_i),
        .local_ab2_i       (b0_en2_i),
                          
        .global_x1_i       (1'b0),
        .global_x2_i       (1'b1),
        .global_y1_i       (1'b0),
        .global_y2_i       (1'b1),
   
        .forward_sig_up_i  (forward_up_a0_en_i),
        .forward_sig_low_i (forward_low_a0_en_i),
   
        .forward_sig_up_o  (forward_up_a0_en_o),
        .forward_sig_low_o (forward_low_a0_en_o),
   
        .ram_sig_o         (a0_en_o)
        );
   forward_selection_ctrl
     forward_selection_en_a1
       (.cfg_forward_ctrl_i(cfg_forward_a1_en_i),
        
        .local_1_i         (a1_en1_i),
        .local_2_i         (a1_en2_i),
        .local_ab1_i       (b1_en1_i),
        .local_ab2_i       (b1_en2_i),
                          
        .global_x1_i       (1'b0),
        .global_x2_i       (1'b1),
        .global_y1_i       (1'b0),
        .global_y2_i       (1'b1),
   
        .forward_sig_up_i  (forward_up_a1_en_i),
        .forward_sig_low_i (forward_low_a1_en_i),
   
        .forward_sig_up_o  (forward_up_a1_en_o),
        .forward_sig_low_o (forward_low_a1_en_o),
   
        .ram_sig_o         (a1_en_o)
        );
   forward_selection_ctrl
     forward_selection_en_b0
       (.cfg_forward_ctrl_i(cfg_forward_b0_en_i),
        
        .local_1_i         (b0_en1_i),
        .local_2_i         (b0_en2_i),
        .local_ab1_i       (a0_en1_i),
        .local_ab2_i       (a0_en2_i),
                          
        .global_x1_i       (1'b0),
        .global_x2_i       (1'b1),
        .global_y1_i       (1'b0),
        .global_y2_i       (1'b1),
   
        .forward_sig_up_i  (forward_up_b0_en_i),
        .forward_sig_low_i (forward_low_b0_en_i),
   
        .forward_sig_up_o  (forward_up_b0_en_o),
        .forward_sig_low_o (forward_low_b0_en_o),
   
        .ram_sig_o         (b0_en_o)
        );
   forward_selection_ctrl
     forward_selection_en_b1
       (.cfg_forward_ctrl_i(cfg_forward_b1_en_i),
        
        .local_1_i         (b1_en1_i),
        .local_2_i         (b1_en2_i),
        .local_ab1_i       (a1_en1_i),
        .local_ab2_i       (a1_en2_i),
                          
        .global_x1_i       (1'b0),
        .global_x2_i       (1'b1),
        .global_y1_i       (1'b0),
        .global_y2_i       (1'b1),
   
        .forward_sig_up_i  (forward_up_b1_en_i),
        .forward_sig_low_i (forward_low_b1_en_i),
   
        .forward_sig_up_o  (forward_up_b1_en_o),
        .forward_sig_low_o (forward_low_b1_en_o),
   
        .ram_sig_o         (b1_en_o)
        );

   forward_selection_ctrl
     forward_selection_we_a0
       (.cfg_forward_ctrl_i(cfg_forward_a0_we_i),
        
        .local_1_i         (a0_we1_i),
        .local_2_i         (a0_we2_i),
        .local_ab1_i       (b0_we1_i),
        .local_ab2_i       (b0_we2_i),
                          
        .global_x1_i       (1'b0),
        .global_x2_i       (1'b1),
        .global_y1_i       (1'b0),
        .global_y2_i       (1'b1),
   
        .forward_sig_up_i  (forward_up_a0_we_i),
        .forward_sig_low_i (forward_low_a0_we_i),
   
        .forward_sig_up_o  (forward_up_a0_we_o),
        .forward_sig_low_o (forward_low_a0_we_o),
   
        .ram_sig_o         (a0_we_o)
        );
   forward_selection_ctrl
     forward_selection_we_a1
       (.cfg_forward_ctrl_i(cfg_forward_a1_we_i),
        
        .local_1_i         (a1_we1_i),
        .local_2_i         (a1_we2_i),
        .local_ab1_i       (b1_we1_i),
        .local_ab2_i       (b1_we2_i),
                          
        .global_x1_i       (1'b0),
        .global_x2_i       (1'b1),
        .global_y1_i       (1'b0),
        .global_y2_i       (1'b1),
   
        .forward_sig_up_i  (forward_up_a1_we_i),
        .forward_sig_low_i (forward_low_a1_we_i),
   
        .forward_sig_up_o  (forward_up_a1_we_o),
        .forward_sig_low_o (forward_low_a1_we_o),
   
        .ram_sig_o         (a1_we_o)
        );
   forward_selection_ctrl
     forward_selection_we_b0
       (.cfg_forward_ctrl_i(cfg_forward_b0_we_i),
        
        .local_1_i         (b0_we1_i),
        .local_2_i         (b0_we2_i),
        .local_ab1_i       (a0_we1_i),
        .local_ab2_i       (a0_we2_i),
                          
        .global_x1_i       (1'b0),
        .global_x2_i       (1'b1),
        .global_y1_i       (1'b0),
        .global_y2_i       (1'b1),
   
        .forward_sig_up_i  (forward_up_b0_we_i),
        .forward_sig_low_i (forward_low_b0_we_i),
   
        .forward_sig_up_o  (forward_up_b0_we_o),
        .forward_sig_low_o (forward_low_b0_we_o),
   
        .ram_sig_o         (b0_we_o)
        );
   forward_selection_ctrl
     forward_selection_we_b1
       (.cfg_forward_ctrl_i(cfg_forward_b1_we_i),
        
        .local_1_i         (b1_we1_i),
        .local_2_i         (b1_we2_i),
        .local_ab1_i       (a1_we1_i),
        .local_ab2_i       (a1_we2_i),
                          
        .global_x1_i       (1'b0),
        .global_x2_i       (1'b1),
        .global_y1_i       (1'b0),
        .global_y2_i       (1'b1),
   
        .forward_sig_up_i  (forward_up_b1_we_i),
        .forward_sig_low_i (forward_low_b1_we_i),
   
        .forward_sig_up_o  (forward_up_b1_we_o),
        .forward_sig_low_o (forward_low_b1_we_o),
   
        .ram_sig_o         (b1_we_o)
        );
endmodule // forward_selection
