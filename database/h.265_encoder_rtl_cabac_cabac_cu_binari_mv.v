//-------------------------------------------------------------------
//                                                                 
//  COPYRIGHT (C) 2011, VIPcore Group, Fudan University
//                                                                  
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE      
//  EXPRESSED WRITTEN CONSENT OF VIPcore Group
//                                                                  
//  VIPcore       : http://soc.fudan.edu.cn/vip    
//  IP Owner 	  : Yibo FAN
//  Contact       : fanyibo@fudan.edu.cn             
//-----------------------------------------------------------------------------------------------------------------------------
// Filename       : cabac_cu_binari_mv.v
// Author         : chewein
// Created        : 2014-9-11
// Description    : binarization inter mv and mv index 
//-----------------------------------------------------------------------------------------------------------------------------
`include"enc_defines.v"

module cabac_cu_binari_mv(
                            cu_mv_data_i         ,

							ctx_pair_mv_0_0_o    ,
							ctx_pair_mv_0_1_o    ,
							ctx_pair_mv_0_2_o    ,
							ctx_pair_mv_0_3_o    ,
							ctx_pair_mv_0_4_o    ,
							ctx_pair_mv_0_5_o    ,
							ctx_pair_mv_0_6_o    ,
							ctx_pair_mv_0_7_o    ,
							ctx_pair_mv_0_8_o    ,
							ctx_pair_mv_0_9_o    ,
							ctx_pair_mv_0_10_o   ,
							ctx_pair_mv_0_11_o   ,
							ctx_pair_mv_0_12_o   ,
							ctx_pair_mv_0_13_o   ,
							ctx_pair_mv_0_14_o   ,
							
							ctx_pair_mv_1_0_o    ,
							ctx_pair_mv_1_1_o    ,
							ctx_pair_mv_1_2_o    ,
							ctx_pair_mv_1_3_o    ,
							ctx_pair_mv_1_4_o    ,
							ctx_pair_mv_1_5_o    ,
							ctx_pair_mv_1_6_o    ,
							ctx_pair_mv_1_7_o    ,
							ctx_pair_mv_1_8_o    ,
							ctx_pair_mv_1_9_o    ,
							ctx_pair_mv_1_10_o   ,
							ctx_pair_mv_1_11_o   ,
							ctx_pair_mv_1_12_o   ,
							ctx_pair_mv_1_13_o   ,
							ctx_pair_mv_1_14_o   
                        );
//-----------------------------------------------------------------------------------------------------------------------------
//
//              inputs and outputs declaration 
//
//-----------------------------------------------------------------------------------------------------------------------------
input         [(4*`MVD_WIDTH+5):0]     cu_mv_data_i                  ;     

output        [10:0]                   ctx_pair_mv_0_0_o             ;         
output        [10:0]                   ctx_pair_mv_0_1_o             ;
output        [10:0]                   ctx_pair_mv_0_2_o             ;
output        [10:0]                   ctx_pair_mv_0_3_o             ;
output        [10:0]                   ctx_pair_mv_0_4_o             ;
output        [10:0]                   ctx_pair_mv_0_5_o             ;
output        [10:0]                   ctx_pair_mv_0_6_o             ;
output        [10:0]                   ctx_pair_mv_0_7_o             ;
output        [10:0]                   ctx_pair_mv_0_8_o             ;
output        [10:0]                   ctx_pair_mv_0_9_o             ;
output        [10:0]                   ctx_pair_mv_0_10_o            ;
output        [10:0]                   ctx_pair_mv_0_11_o            ;
output        [10:0]                   ctx_pair_mv_0_12_o            ;
output        [10:0]                   ctx_pair_mv_0_13_o            ;
output        [10:0]                   ctx_pair_mv_0_14_o            ;

output        [10:0]                   ctx_pair_mv_1_0_o             ;
output        [10:0]                   ctx_pair_mv_1_1_o             ;
output        [10:0]                   ctx_pair_mv_1_2_o             ;
output        [10:0]                   ctx_pair_mv_1_3_o             ;
output        [10:0]                   ctx_pair_mv_1_4_o             ;
output        [10:0]                   ctx_pair_mv_1_5_o             ;
output        [10:0]                   ctx_pair_mv_1_6_o             ;
output        [10:0]                   ctx_pair_mv_1_7_o             ;
output        [10:0]                   ctx_pair_mv_1_8_o             ;
output        [10:0]                   ctx_pair_mv_1_9_o             ;
output        [10:0]                   ctx_pair_mv_1_10_o            ;
output        [10:0]                   ctx_pair_mv_1_11_o            ;
output        [10:0]                   ctx_pair_mv_1_12_o            ;
output        [10:0]                   ctx_pair_mv_1_13_o            ;
output        [10:0]                   ctx_pair_mv_1_14_o            ;
  
//-----------------------------------------------------------------------------------------------------------------------------
//
//              wire signals declaration 
//
//-----------------------------------------------------------------------------------------------------------------------------
wire          [2:0]                    mvp_idx_0_w                   ;
wire          [2*`MVD_WIDTH-1:0]       mv_curr_0_w                   ;
wire          [2:0]                    mvp_idx_1_w                   ;
wire          [2*`MVD_WIDTH-1:0]       mv_curr_1_w                   ;

assign   mvp_idx_0_w        =      cu_mv_data_i[ 5:3 ]               ;
assign   mv_curr_0_w        =      cu_mv_data_i[49:28]               ;
assign   mvp_idx_1_w        =      cu_mv_data_i[ 2:0 ]               ;
assign   mv_curr_1_w        =      cu_mv_data_i[ 27:6]               ;

//-----------------------------------------------------------------------------------------------------------------------------
//
//             mv binarization 
//
//-----------------------------------------------------------------------------------------------------------------------------

wire          [10:0]         ctx_pair_mv_0_0_w                       ;
wire          [10:0]         ctx_pair_mv_0_1_w                       ;
wire          [10:0]         ctx_pair_mv_0_2_w                       ;
wire          [10:0]         ctx_pair_mv_0_3_w                       ;
wire          [10:0]         ctx_pair_mv_0_4_w                       ;
wire          [10:0]         ctx_pair_mv_0_5_w                       ;
wire          [10:0]         ctx_pair_mv_0_6_w                       ;
wire          [10:0]         ctx_pair_mv_0_7_w                       ;
wire          [10:0]         ctx_pair_mv_0_8_w                       ;
wire          [10:0]         ctx_pair_mv_0_9_w                       ;
wire          [10:0]         ctx_pair_mv_0_10_w                      ;
wire          [10:0]         ctx_pair_mv_0_11_w                      ;
wire          [10:0]         ctx_pair_mv_0_12_w                      ;
wire          [10:0]         ctx_pair_mv_0_13_w                      ;
wire          [10:0]         ctx_pair_mv_0_14_w                      ;

wire          [10:0]         ctx_pair_mv_1_0_w                       ;
wire          [10:0]         ctx_pair_mv_1_1_w                       ;
wire          [10:0]         ctx_pair_mv_1_2_w                       ;
wire          [10:0]         ctx_pair_mv_1_3_w                       ;
wire          [10:0]         ctx_pair_mv_1_4_w                       ;
wire          [10:0]         ctx_pair_mv_1_5_w                       ;
wire          [10:0]         ctx_pair_mv_1_6_w                       ;
wire          [10:0]         ctx_pair_mv_1_7_w                       ;
wire          [10:0]         ctx_pair_mv_1_8_w                       ;
wire          [10:0]         ctx_pair_mv_1_9_w                       ;
wire          [10:0]         ctx_pair_mv_1_10_w                      ;
wire          [10:0]         ctx_pair_mv_1_11_w                      ;
wire          [10:0]         ctx_pair_mv_1_12_w                      ;
wire          [10:0]         ctx_pair_mv_1_13_w                      ;
wire          [10:0]         ctx_pair_mv_1_14_w                      ;


cabac_pu_binari_mv  cabac_pu_binari_mv_u0 (
                        .mvp_idx_i         ( mvp_idx_0_w             ),
                        .mv_i              ( mv_curr_0_w             ),
						
						.ctx_pair_mv_0_o   ( ctx_pair_mv_0_0_w       ), 
						.ctx_pair_mv_1_o   ( ctx_pair_mv_0_1_w       ), 
						.ctx_pair_mv_2_o   ( ctx_pair_mv_0_2_w       ), 
						.ctx_pair_mv_3_o   ( ctx_pair_mv_0_3_w       ), 
						.ctx_pair_mv_4_o   ( ctx_pair_mv_0_4_w       ), 
						.ctx_pair_mv_5_o   ( ctx_pair_mv_0_5_w       ), 
						.ctx_pair_mv_6_o   ( ctx_pair_mv_0_6_w       ), 
						.ctx_pair_mv_7_o   ( ctx_pair_mv_0_7_w       ), 
						.ctx_pair_mv_8_o   ( ctx_pair_mv_0_8_w       ), 
						.ctx_pair_mv_9_o   ( ctx_pair_mv_0_9_w       ), 
						.ctx_pair_mv_10_o  ( ctx_pair_mv_0_10_w      ),
						.ctx_pair_mv_11_o  ( ctx_pair_mv_0_11_w      ),
						.ctx_pair_mv_12_o  ( ctx_pair_mv_0_12_w      ),
						.ctx_pair_mv_13_o  ( ctx_pair_mv_0_13_w      ),
						.ctx_pair_mv_14_o  ( ctx_pair_mv_0_14_w      )						
					);
					
cabac_pu_binari_mv  cabac_pu_binari_mv_u1(
                        .mvp_idx_i         ( mvp_idx_1_w             ),
                        .mv_i              ( mv_curr_1_w             ),
						
						.ctx_pair_mv_0_o   ( ctx_pair_mv_1_0_w       ), 
						.ctx_pair_mv_1_o   ( ctx_pair_mv_1_1_w       ), 
						.ctx_pair_mv_2_o   ( ctx_pair_mv_1_2_w       ), 
						.ctx_pair_mv_3_o   ( ctx_pair_mv_1_3_w       ), 
						.ctx_pair_mv_4_o   ( ctx_pair_mv_1_4_w       ), 
						.ctx_pair_mv_5_o   ( ctx_pair_mv_1_5_w       ), 
						.ctx_pair_mv_6_o   ( ctx_pair_mv_1_6_w       ), 
						.ctx_pair_mv_7_o   ( ctx_pair_mv_1_7_w       ), 
						.ctx_pair_mv_8_o   ( ctx_pair_mv_1_8_w       ), 
						.ctx_pair_mv_9_o   ( ctx_pair_mv_1_9_w       ), 
						.ctx_pair_mv_10_o  ( ctx_pair_mv_1_10_w      ),
						.ctx_pair_mv_11_o  ( ctx_pair_mv_1_11_w      ),
						.ctx_pair_mv_12_o  ( ctx_pair_mv_1_12_w      ),
						.ctx_pair_mv_13_o  ( ctx_pair_mv_1_13_w      ),
						.ctx_pair_mv_14_o  ( ctx_pair_mv_1_14_w      )						
					);					
					
assign    ctx_pair_mv_0_0_o  =  ctx_pair_mv_0_0_w                     ;				
assign    ctx_pair_mv_0_1_o  =  ctx_pair_mv_0_1_w     				  ;
assign    ctx_pair_mv_0_2_o  =  ctx_pair_mv_0_2_w     				  ;
assign    ctx_pair_mv_0_3_o  =  ctx_pair_mv_0_3_w     				  ;
assign    ctx_pair_mv_0_4_o  =  ctx_pair_mv_0_4_w     				  ;
assign    ctx_pair_mv_0_5_o  =  ctx_pair_mv_0_5_w     				  ;
assign    ctx_pair_mv_0_6_o  =  ctx_pair_mv_0_6_w     				  ;
assign    ctx_pair_mv_0_7_o  =  ctx_pair_mv_0_7_w     				  ;
assign    ctx_pair_mv_0_8_o  =  ctx_pair_mv_0_8_w     				  ;
assign    ctx_pair_mv_0_9_o  =  ctx_pair_mv_0_9_w     				  ;
assign    ctx_pair_mv_0_10_o =  ctx_pair_mv_0_10_w    				  ;
assign    ctx_pair_mv_0_11_o =  ctx_pair_mv_0_11_w    				  ;
assign    ctx_pair_mv_0_12_o =  ctx_pair_mv_0_12_w    				  ;
assign    ctx_pair_mv_0_13_o =  ctx_pair_mv_0_13_w    				  ;
assign    ctx_pair_mv_0_14_o =  ctx_pair_mv_0_14_w    				  ;

assign    ctx_pair_mv_1_0_o  =  ctx_pair_mv_1_0_w                     ;				
assign    ctx_pair_mv_1_1_o  =  ctx_pair_mv_1_1_w     				  ;
assign    ctx_pair_mv_1_2_o  =  ctx_pair_mv_1_2_w     				  ;
assign    ctx_pair_mv_1_3_o  =  ctx_pair_mv_1_3_w     				  ;
assign    ctx_pair_mv_1_4_o  =  ctx_pair_mv_1_4_w     				  ;
assign    ctx_pair_mv_1_5_o  =  ctx_pair_mv_1_5_w     				  ;
assign    ctx_pair_mv_1_6_o  =  ctx_pair_mv_1_6_w     				  ;
assign    ctx_pair_mv_1_7_o  =  ctx_pair_mv_1_7_w     				  ;
assign    ctx_pair_mv_1_8_o  =  ctx_pair_mv_1_8_w     				  ;
assign    ctx_pair_mv_1_9_o  =  ctx_pair_mv_1_9_w     				  ;
assign    ctx_pair_mv_1_10_o =  ctx_pair_mv_1_10_w    				  ;
assign    ctx_pair_mv_1_11_o =  ctx_pair_mv_1_11_w    				  ;
assign    ctx_pair_mv_1_12_o =  ctx_pair_mv_1_12_w    				  ;
assign    ctx_pair_mv_1_13_o =  ctx_pair_mv_1_13_w    				  ;
assign    ctx_pair_mv_1_14_o =  ctx_pair_mv_1_14_w    				  ;					



endmodule 
