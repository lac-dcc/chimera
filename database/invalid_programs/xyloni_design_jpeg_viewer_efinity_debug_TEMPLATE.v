edb_top edb_top_inst (
    .bscan_CAPTURE      ( jtag_inst1_CAPTURE ),
    .bscan_DRCK         ( jtag_inst1_DRCK ),
    .bscan_RESET        ( jtag_inst1_RESET ),
    .bscan_RUNTEST      ( jtag_inst1_RUNTEST ),
    .bscan_SEL          ( jtag_inst1_SEL ),
    .bscan_SHIFT        ( jtag_inst1_SHIFT ),
    .bscan_TCK          ( jtag_inst1_TCK ),
    .bscan_TDI          ( jtag_inst1_TDI ),
    .bscan_TMS          ( jtag_inst1_TMS ),
    .bscan_UPDATE       ( jtag_inst1_UPDATE ),
    .bscan_TDO          ( jtag_inst1_TDO ),
    .vio0_clk       ( $INSERT_YOUR_CLOCK_NAME ),
    .vio0_state     ( vio0_state ),
    .vio0_on        ( vio0_on ),
    .vio0_off       ( vio0_off ),
    .vio0_trigger   ( vio0_trigger ),
    .vio0_mode      ( vio0_mode ),
    .vio0_en        ( vio0_en ),
    .vio0_we        ( vio0_we ),
    .vio0_re        ( vio0_re ),
    .vio0_rgb       ( vio0_rgb ),
    .vio0_pix       ( vio0_pix ),
    .vio0_next      ( vio0_next ),
    .vio0_back      ( vio0_back ),
    .vio0_interrupt ( vio0_interrupt ),
    .la0_clk            ( $INSERT_YOUR_CLOCK_NAME ),
    .la0_csx        ( la0_csx ),
    .la0_dcx        ( la0_dcx ),
    .la0_wrx        ( la0_wrx ),
    .la0_rdx        ( la0_rdx ),
    .la0_o_d        ( la0_o_d ),
    .la0_oe     ( la0_oe ),
    .la0_i_d        ( la0_i_d ),
    .la0_state      ( la0_state ),
    .la0_x      ( la0_x ),
    .la0_y      ( la0_y ),
    .la0_fsm_status     ( la0_fsm_status ),
    .la0_spi_status     ( la0_spi_status ),
    .la0_sos_status     ( la0_sos_status ),
    .la0_scan_state     ( la0_scan_state ),
    .la0_Y_lb_we        ( la0_Y_lb_we ),
    .la0_U_lb_we        ( la0_U_lb_we ),
    .la0_V_lb_we        ( la0_V_lb_we ),
    .la0_lb_full        ( la0_lb_full ),
    .la0_lb_nempty      ( la0_lb_nempty ),
    .la0_trigger        ( la0_trigger )
);

////////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2013-2019 Efinix Inc. All rights reserved.              
//
// This   document  contains  proprietary information  which   is        
// protected by  copyright. All rights  are reserved.  This notice       
// refers to original work by Efinix, Inc. which may be derivitive       
// of other work distributed under license of the authors.  In the       
// case of derivative work, nothing in this notice overrides the         
// original author's license agreement.  Where applicable, the           
// original license agreement is included in it's original               
// unmodified form immediately below this header.                        
//                                                                       
// WARRANTY DISCLAIMER.                                                  
//     THE  DESIGN, CODE, OR INFORMATION ARE PROVIDED “AS IS” AND        
//     EFINIX MAKES NO WARRANTIES, EXPRESS OR IMPLIED WITH               
//     RESPECT THERETO, AND EXPRESSLY DISCLAIMS ANY IMPLIED WARRANTIES,  
//     INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF          
//     MERCHANTABILITY, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR    
//     PURPOSE.  SOME STATES DO NOT ALLOW EXCLUSIONS OF AN IMPLIED       
//     WARRANTY, SO THIS DISCLAIMER MAY NOT APPLY TO LICENSEE.           
//                                                                       
// LIMITATION OF LIABILITY.                                              
//     NOTWITHSTANDING ANYTHING TO THE CONTRARY, EXCEPT FOR BODILY       
//     INJURY, EFINIX SHALL NOT BE LIABLE WITH RESPECT TO ANY SUBJECT    
//     MATTER OF THIS AGREEMENT UNDER TORT, CONTRACT, STRICT LIABILITY   
//     OR ANY OTHER LEGAL OR EQUITABLE THEORY (I) FOR ANY INDIRECT,      
//     SPECIAL, INCIDENTAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES OF ANY    
//     CHARACTER INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF      
//     GOODWILL, DATA OR PROFIT, WORK STOPPAGE, OR COMPUTER FAILURE OR   
//     MALFUNCTION, OR IN ANY EVENT (II) FOR ANY AMOUNT IN EXCESS, IN    
//     THE AGGREGATE, OF THE FEE PAID BY LICENSEE TO EFINIX HEREUNDER    
//     (OR, IF THE FEE HAS BEEN WAIVED, $100), EVEN IF EFINIX SHALL HAVE 
//     BEEN INFORMED OF THE POSSIBILITY OF SUCH DAMAGES.  SOME STATES DO 
//     NOT ALLOW THE EXCLUSION OR LIMITATION OF INCIDENTAL OR            
//     CONSEQUENTIAL DAMAGES, SO THIS LIMITATION AND EXCLUSION MAY NOT   
//     APPLY TO LICENSEE.                                                
//
////////////////////////////////////////////////////////////////////////////////
