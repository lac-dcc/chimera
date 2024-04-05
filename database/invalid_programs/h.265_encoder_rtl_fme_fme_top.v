//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2014, VIPcore Group, Fudan University
//
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE
//  EXPRESSED WRITTEN CONSENT OF VIPcore Group
//
//  VIPcore       : http://soc.fudan.edu.cn/vip
//  IP Owner      : Yibo FAN
//  Contact       : fanyibo@fudan.edu.cn
//
//-------------------------------------------------------------------
//
//  Filename      : fme_top.v
//  Author        : Yufeng Bai
//  Email 	  : byfchina@gmail.com	
//
//  $Id$
//
//-------------------------------------------------------------------

`include "enc_defines.v"

module fme_top (
	clk		        ,
	rstn		        ,
	sysif_cmb_x_i		,
	sysif_cmb_y_i		,
	sysif_qp_i		,
	sysif_start_i		,
	sysif_done_o		,
	fimeif_partition_i	,
	fimeif_mv_rden_o	,
	fimeif_mv_rdaddr_o	,
	fimeif_mv_data_i	,
	cur_rden_o		,
	//cur_sel_o		,
	//cur_idx_o		,
	cur_4x4_idx_o           ,
	cur_4x4_x_o             ,
	cur_4x4_y_o             ,
	cur_pel_i		,
	ref_rden_o		,
	ref_idx_x_o		,
	ref_idx_y_o		,
	ref_pel_i		,
        mcif_mv_rden_o 		,
        mcif_mv_rdaddr_o 	,
        mcif_mv_data_i 		,
	mcif_mv_wren_o          ,
	mcif_mv_wraddr_o        ,
	mcif_mv_data_o          ,
	mcif_pre_pixel_o        ,
        mcif_pre_wren_o         ,
        mcif_pre_addr_o          
);

// ********************************************
//
//    INPUT / OUTPUT DECLARATION
//
// ********************************************

input 	 [1-1:0] 	         clk 	                 ; // clk signal 
input 	 [1-1:0] 	         rstn 	                 ; // asynchronous reset 
input 	 [`PIC_X_WIDTH-1:0] 	 sysif_cmb_x_i 	         ; // current LCU x index 
input 	 [`PIC_X_WIDTH-1:0] 	 sysif_cmb_y_i 	         ; // current LCU y index 
input 	 [6-1:0] 	         sysif_qp_i 	         ; // qp value 
input 	 [1-1:0] 	         sysif_start_i 	         ; // fme start signal 
output 	 [1-1:0] 	         sysif_done_o 	         ; // fme done signal 
input 	 [42-1:0] 	         fimeif_partition_i 	 ; // ime partition info  
output 	 [1-1:0] 	         fimeif_mv_rden_o 	 ; // imv read enable 
output 	 [6-1:0] 	         fimeif_mv_rdaddr_o 	 ; // imv sram read address 
input 	 [2*`FMV_WIDTH-1:0] 	 fimeif_mv_data_i 	 ; // imv from fime 
output 	 [1-1:0] 	         mcif_mv_rden_o 	 ; // half fmv write back enable 
output 	 [6-1:0] 	         mcif_mv_rdaddr_o 	 ; // half fmv write back  address 
input 	 [2*`FMV_WIDTH-1:0] 	 mcif_mv_data_i 	 ; // half fmv  
output 	 [1-1:0] 	         cur_rden_o 	         ; // current lcu read enable 
//output 	 [1-1:0] 	         cur_sel_o 	         ; // use block read mode 
//output 	 [6-1:0] 	         cur_idx_o 	         ; // current block read index ( raster sacn) 
output   [5-1:0]                 cur_4x4_idx_o           ;
output   [4-1:0]                 cur_4x4_x_o             ;
output   [4-1:0]                 cur_4x4_y_o             ;
input 	 [32*`PIXEL_WIDTH-1:0] 	 cur_pel_i 	         ; // current block pixel  
output 	 [1-1:0] 	         ref_rden_o 	         ; // referenced pixel read enable  
output 	 [7-1:0] 	         ref_idx_x_o 	         ; // referenced pixel x index 
output 	 [7-1:0] 	         ref_idx_y_o 	         ; // referenced pixel y index 
input 	 [64*`PIXEL_WIDTH-1:0] 	 ref_pel_i 	         ; // referenced pixel 
output                           mcif_mv_wren_o          ; // fmv sram write enable
output   [6-1:0]                 mcif_mv_wraddr_o        ; // fmv sram write address
output   [2*`FMV_WIDTH-1:0]      mcif_mv_data_o          ; // fmv data
output   [32*`PIXEL_WIDTH-1 :0]  mcif_pre_pixel_o        ;
output   [4-1              :0]   mcif_pre_wren_o         ;
output   [7-1              :0]   mcif_pre_addr_o          ;

// ********************************************
//
//     PARAMETER DECLARATION
//
// ********************************************

localparam SATD_WIDTH = `PIXEL_WIDTH + 10;

// ********************************************
//
//    Combinational Logic
//
// ********************************************

// CTRL <-> IP IF

wire                         ip_start_ctrl    ;
wire                         ip_half_ctrl     ;
wire   [`FMV_WIDTH-1     :0] ip_mv_x_ctrl     ;
wire   [`FMV_WIDTH-1     :0] ip_mv_y_ctrl     ;
wire   [2-1              :0] ip_frac_x_ctrl   ;
wire   [2-1              :0] ip_frac_y_ctrl   ;
wire   [6-1              :0] ip_idx_ctrl      ;

// REF <-> IP IF

reg                          refpel_valid     ;
wire   [`PIXEL_WIDTH-1   :0] ref_pel0	      ;
wire   [`PIXEL_WIDTH-1   :0] ref_pel1	      ;
wire   [`PIXEL_WIDTH-1   :0] ref_pel2	      ;
wire   [`PIXEL_WIDTH-1   :0] ref_pel3	      ;
wire   [`PIXEL_WIDTH-1   :0] ref_pel4	      ;
wire   [`PIXEL_WIDTH-1   :0] ref_pel5	      ;
wire   [`PIXEL_WIDTH-1   :0] ref_pel6	      ;
wire   [`PIXEL_WIDTH-1   :0] ref_pel7	      ;
wire   [`PIXEL_WIDTH-1   :0] ref_pel8	      ;
wire   [`PIXEL_WIDTH-1   :0] ref_pel9	      ;
wire   [`PIXEL_WIDTH-1   :0] ref_pel10	      ;
wire   [`PIXEL_WIDTH-1   :0] ref_pel11	      ;
wire   [`PIXEL_WIDTH-1   :0] ref_pel12	      ;
wire   [`PIXEL_WIDTH-1   :0] ref_pel13	      ;
wire   [`PIXEL_WIDTH-1   :0] ref_pel14	      ;
wire   [`PIXEL_WIDTH-1   :0] ref_pel15	      ;

/*
wire   [64*`PIXEL_WIDTH-1:0] ref_pixels       ;
reg    [9-1              :0] ref_shift        ;
always @ (posedge clk or negedge rstn) begin
    if(~rstn) begin
	ref_shift <= 'd0;
    end
    else begin
	ref_shift <=  {ip_idx_ctrl[4], ip_idx_ctrl[2], ip_idx_ctrl[0],6'b0};
    end
end
assign ref_pixels =   ref_pel_i << ref_shift;
*/

assign ref_pel0   =   ref_pel_i[64*`PIXEL_WIDTH-1:63*`PIXEL_WIDTH];
assign ref_pel1   =   ref_pel_i[63*`PIXEL_WIDTH-1:62*`PIXEL_WIDTH];
assign ref_pel2   =   ref_pel_i[62*`PIXEL_WIDTH-1:61*`PIXEL_WIDTH];
assign ref_pel3   =   ref_pel_i[61*`PIXEL_WIDTH-1:60*`PIXEL_WIDTH];
assign ref_pel4   =   ref_pel_i[60*`PIXEL_WIDTH-1:59*`PIXEL_WIDTH];
assign ref_pel5   =   ref_pel_i[59*`PIXEL_WIDTH-1:58*`PIXEL_WIDTH];
assign ref_pel6   =   ref_pel_i[58*`PIXEL_WIDTH-1:57*`PIXEL_WIDTH];
assign ref_pel7   =   ref_pel_i[57*`PIXEL_WIDTH-1:56*`PIXEL_WIDTH];
assign ref_pel8   =   ref_pel_i[56*`PIXEL_WIDTH-1:55*`PIXEL_WIDTH];
assign ref_pel9   =   ref_pel_i[55*`PIXEL_WIDTH-1:54*`PIXEL_WIDTH];
assign ref_pel10  =   ref_pel_i[54*`PIXEL_WIDTH-1:53*`PIXEL_WIDTH];
assign ref_pel11  =   ref_pel_i[53*`PIXEL_WIDTH-1:52*`PIXEL_WIDTH];
assign ref_pel12  =   ref_pel_i[52*`PIXEL_WIDTH-1:51*`PIXEL_WIDTH];
assign ref_pel13  =   ref_pel_i[51*`PIXEL_WIDTH-1:50*`PIXEL_WIDTH];
assign ref_pel14  =   ref_pel_i[50*`PIXEL_WIDTH-1:49*`PIXEL_WIDTH];
assign ref_pel15  =   ref_pel_i[49*`PIXEL_WIDTH-1:48*`PIXEL_WIDTH];

// IP <-> SATD IF

wire   [`FMV_WIDTH-1     :0] mv_x_ip          ;
wire   [`FMV_WIDTH-1     :0] mv_y_ip          ;
wire   [6-1              :0] blk_idx_ip       ;
wire                         half_ip_flag_ip  ;

wire                         ip_ready	      ;
wire                         end_ip           ; 
wire                         mc_end_ip        ; 
wire                         satd_start       ; 

wire                         candi0_valid     ;
wire                         candi1_valid     ;	
wire                         candi2_valid     ;	
wire                         candi3_valid     ;	
wire                         candi4_valid     ;	
wire                         candi5_valid     ;	
wire                         candi6_valid     ;	
wire                         candi7_valid     ;	
wire                         candi8_valid     ;	
               
wire   [8*`PIXEL_WIDTH-1 :0] candi0_pixles    ; 
wire   [8*`PIXEL_WIDTH-1 :0] candi1_pixles    ; 
wire   [8*`PIXEL_WIDTH-1 :0] candi2_pixles    ; 
wire   [8*`PIXEL_WIDTH-1 :0] candi3_pixles    ; 
wire   [8*`PIXEL_WIDTH-1 :0] candi4_pixles    ; 
wire   [8*`PIXEL_WIDTH-1 :0] candi5_pixles    ; 
wire   [8*`PIXEL_WIDTH-1 :0] candi6_pixles    ; 
wire   [8*`PIXEL_WIDTH-1 :0] candi7_pixles    ; 
wire   [8*`PIXEL_WIDTH-1 :0] candi8_pixles    ; 

// SATD <-> COST
wire                         cost_start       ;    
wire   [`FMV_WIDTH-1     :0] mv_x_satd	      ;
wire   [`FMV_WIDTH-1     :0] mv_y_satd	      ;
wire                         half_ip_flag_satd;
wire   [6-1              :0] blk_idx_satd     ;

wire   [SATD_WIDTH-1     :0] satd0            ; 	
wire   [SATD_WIDTH-1     :0] satd1            ; 	
wire   [SATD_WIDTH-1     :0] satd2            ; 	
wire   [SATD_WIDTH-1     :0] satd3            ; 	
wire   [SATD_WIDTH-1     :0] satd4            ; 	
wire   [SATD_WIDTH-1     :0] satd5            ; 	
wire   [SATD_WIDTH-1     :0] satd6            ; 	
wire   [SATD_WIDTH-1     :0] satd7            ; 	
wire   [SATD_WIDTH-1     :0] satd8            ; 	
wire                         satd_valid	      ;

// COST <-> CTRL IF
wire   [3                :0] current_state    ;
wire                         cost_done        ;	
wire   [4-1              :0] best_sp          ;      
wire   [6-1              :0] best_addr        ;      
wire                         best_valid       ;      

wire   [2*`FMV_WIDTH-1   :0] fmv_best         ;
wire                         fmv_wren         ;
wire                         fmv_sel          ;
wire   [6-1              :0] fmv_addr         ;

wire signed [`FMV_WIDTH-1:0] imv_x            ;
wire signed [`FMV_WIDTH-1:0] imv_y            ;
wire signed [`FMV_WIDTH-1:0] fmv_x            ;
wire signed [`FMV_WIDTH-1:0] fmv_y            ;

wire   [1-1              :0] predicted_en     ;
wire   [4-1              :0] pred_wren  ;
// ********************************************
//
//    Sequential Logic
//
// ********************************************

always @ (posedge clk or negedge rstn) begin
    if(~rstn) begin
	refpel_valid <= 1'b0;
    end
    else begin
	refpel_valid <= ref_rden_o;
    end
end

fme_interpolator_8x8 ip8x8(
	.clk	         	(clk	        ),
	.rstn	         	(rstn	        ),

	// CTRL -> IP IF
	.blk_start_i		(ip_start_ctrl	),
	.half_ip_flag_i		(ip_half_ctrl	),                                      
	.mv_x_i	        	(ip_mv_x_ctrl   ),
	.mv_y_i	        	(ip_mv_y_ctrl   ),
	.frac_x_i	        (ip_frac_x_ctrl ),
	.frac_y_i	        (ip_frac_y_ctrl ),
	.blk_idx_i              (ip_idx_ctrl    ),

	// REF -> IP IF
	.refpel_valid_i		(refpel_valid	),
	.ref_pel0_i		(ref_pel0	),
	.ref_pel1_i		(ref_pel1	),
	.ref_pel2_i		(ref_pel2	),
	.ref_pel3_i		(ref_pel3	),
	.ref_pel4_i		(ref_pel4	),
	.ref_pel5_i		(ref_pel5	),
	.ref_pel6_i		(ref_pel6	),
	.ref_pel7_i		(ref_pel7	),
	.ref_pel8_i		(ref_pel8	),
	.ref_pel9_i		(ref_pel9	),
	.ref_pel10_i		(ref_pel10	),
	.ref_pel11_i		(ref_pel11	),
	.ref_pel12_i		(ref_pel12	),
	.ref_pel13_i		(ref_pel13	),
	.ref_pel14_i		(ref_pel14	),
	.ref_pel15_i		(ref_pel15	),
	
	// SATD <- IP IF
	.mv_x_o	        	(mv_x_ip        ),
	.mv_y_o	        	(mv_y_ip        ),
	.blk_idx_o              (blk_idx_ip     ),
	.half_ip_flag_o         (half_ip_flag_ip),

	.ip_ready_o		(ip_ready	),
        .end_ip_o               (end_ip         ),
        .mc_end_ip_o            (mc_end_ip      ),
	.satd_start_o           (satd_start     ),             

	.candi0_valid_o		(candi0_valid	),
	.candi1_valid_o		(candi1_valid	),
	.candi2_valid_o		(candi2_valid	),
	.candi3_valid_o		(candi3_valid	),
	.candi4_valid_o		(candi4_valid	),
	.candi5_valid_o		(candi5_valid	),
	.candi6_valid_o		(candi6_valid	),
	.candi7_valid_o		(candi7_valid	),
	.candi8_valid_o		(candi8_valid	),

	.candi0_pixles_o	(candi0_pixles  ),
	.candi1_pixles_o	(candi1_pixles  ),
	.candi2_pixles_o	(candi2_pixles  ),
	.candi3_pixles_o	(candi3_pixles  ),
	.candi4_pixles_o	(candi4_pixles  ),
	.candi5_pixles_o	(candi5_pixles  ),
	.candi6_pixles_o	(candi6_pixles  ),
	.candi7_pixles_o	(candi7_pixles  ),
	.candi8_pixles_o	(candi8_pixles  )	
);


fme_satd_gen satd_gen(
	.clk			(clk		),
	.rstn			(rstn		),

	// IP -> SATD IF
	.satd_start_i		(satd_start	),

	.blk_idx_i		(blk_idx_ip     ),
	.mv_x_i			(mv_x_ip	),
	.mv_y_i			(mv_y_ip	),
	.half_ip_flag_i         (half_ip_flag_ip),

	.ip_ready_i             (ip_ready       ),
	.end_ip_i		(end_ip         ),

	.candi0_valid_i		(candi0_valid	),
	.candi1_valid_i		(candi1_valid	),
	.candi2_valid_i		(candi2_valid	),
	.candi3_valid_i		(candi3_valid	),
	.candi4_valid_i		(candi4_valid	),
	.candi5_valid_i		(candi5_valid	),
	.candi6_valid_i		(candi6_valid	),
	.candi7_valid_i		(candi7_valid	),
	.candi8_valid_i		(candi8_valid	),

	.candi0_pixles_i	(candi0_pixles  ),
	.candi1_pixles_i	(candi1_pixles  ),
	.candi2_pixles_i	(candi2_pixles  ),
	.candi3_pixles_i	(candi3_pixles  ),
	.candi4_pixles_i	(candi4_pixles  ),
	.candi5_pixles_i	(candi5_pixles  ),
	.candi6_pixles_i	(candi6_pixles  ),
	.candi7_pixles_i	(candi7_pixles  ),
	.candi8_pixles_i	(candi8_pixles  ),

	// CUR <-> SATD IF
	.cur_rden_o		(cur_rden_o	),
	//.cur_sel_o		(cur_sel_o	),
	//.cur_idx_o		(cur_idx_o	),
	.cur_4x4_x_o            (cur_4x4_x_o    ),
	.cur_4x4_y_o            (cur_4x4_y_o    ),
	.cur_4x4_idx_o          (cur_4x4_idx_o  ),
	.cur_pel_i		(cur_pel_i	),
	

	// COST <- SATD IF
	.cost_start_o           (cost_start     ),
	.mv_x_o			(mv_x_satd	),
	.mv_y_o			(mv_y_satd	),
	.half_ip_flag_o         (half_ip_flag_satd ),
	.blk_idx_o              (blk_idx_satd   ),

	.satd0_o		(satd0       	),
	.satd1_o		(satd1       	),
	.satd2_o		(satd2       	),
	.satd3_o		(satd3       	),
	.satd4_o		(satd4       	),
	.satd5_o		(satd5       	),
	.satd6_o		(satd6       	),
	.satd7_o		(satd7       	),
	.satd8_o		(satd8       	),
	.satd_valid_o		(satd_valid	)
);

fme_cost sp_cost(
	.clk		        (clk		),
	.rstn		        (rstn		),

	// SYS IF
	.qp_i                   (sysif_qp_i     ),
	.partition_i	        (fimeif_partition_i	),

	// SATD -> COST IF
	.cost_start_i	        (cost_start	),

	.mv_x_i		        (mv_x_satd	),
	.mv_y_i		        (mv_y_satd	),
	.blk_idx_i	        (blk_idx_satd	),
	.half_ip_flag_i	        (half_ip_flag_satd	),

	.satd0_i	        (satd0          ),
	.satd1_i	        (satd1          ),
	.satd2_i	        (satd2          ),
	.satd3_i	        (satd3          ),
	.satd4_i	        (satd4          ),
	.satd5_i	        (satd5          ),
	.satd6_i	        (satd6          ),
	.satd7_i	        (satd7          ),
	.satd8_i	        (satd8          ),
	.satd_valid_i	        (satd_valid	),

	// CTRL <- COST IF
	.cost_done_o	        (cost_done	),
	.best_sp_o              (best_sp        ),

	// MC <- COST IF
	.fmv_best_o	        (fmv_best	),
	.fmv_wren_o	        (fmv_wren	),
	.fmv_sel_o	        (fmv_sel	),
	.fmv_addr_o	        (fmv_addr	)	
);

fme_ctrl ctrl(
	.clk		        (clk		),
	.rstn		        (rstn		),

	// SYS IF
	.sysif_start_i		(sysif_start_i	),
	.sysif_done_o		(sysif_done_o	),

        // STATE 
	.current_state		(current_state  ),

	// FIME <-> CTRL IF
	.fimeif_partition_i	(fimeif_partition_i	),
	.fimeif_mv_rden_o       (fimeif_mv_rden_o       ),
	.fimeif_mv_rdaddr_o     (fimeif_mv_rdaddr_o     ),
	.fimeif_mv_data_i       (fimeif_mv_data_i       ),

	// MC <-> CTRL IF
	.mcif_mv_rden_o         (mcif_mv_rden_o       ),
	.mcif_mv_rdaddr_o       (mcif_mv_rdaddr_o     ),
	.mcif_mv_data_i         (mcif_mv_data_i       ),

	// REF <- CTRL IF
	.ref_rden_o		(ref_rden_o	),
	.ref_idx_x_o		(ref_idx_x_o	),
	.ref_idx_y_o		(ref_idx_y_o	),

	// IP <-> CTRL IF
	.ip_start_o		(ip_start_ctrl	),
	.ip_done_i              (mc_end_ip      ),
	.ip_mv_x_o		(ip_mv_x_ctrl	),
	.ip_mv_y_o		(ip_mv_y_ctrl	),
	.ip_frac_x_o            (ip_frac_x_ctrl ),
        .ip_frac_y_o            (ip_frac_y_ctrl ),
	.ip_half_flag_o		(ip_half_ctrl	),
	.ip_idx_o		(ip_idx_ctrl	),

	// COST -> CTRL IF
	.cost_done_i		(cost_done	),
	.predicted_en_o         (predicted_en   )
);

fme_pred fme_pred (
	.clk		        (clk		        ),
	.rstn		        (rstn		        ),
	.ip_start_i	        (ip_start_ctrl	        ),
        .end_ip_i               (end_ip                 ),
	.imv_x_i		(imv_x	        	),
	.imv_y_i		(imv_y	        	),
	.fmv_x_i		(fmv_x	        	),
	.fmv_y_i		(fmv_y	        	),
	.block_idx_i	        (ip_idx_ctrl	        ),
	.candi0_valid_i	        (candi0_valid	        ),
	.candi1_valid_i	        (candi1_valid	        ),
	.candi2_valid_i	        (candi2_valid	        ),
	.candi3_valid_i	        (candi3_valid	        ),
	.candi4_valid_i	        (candi4_valid	        ),
	.candi5_valid_i	        (candi5_valid	        ),
	.candi6_valid_i	        (candi6_valid	        ),
	.candi7_valid_i	        (candi7_valid	        ),
	.candi8_valid_i	        (candi8_valid	        ),
	.candi0_pixles_i	(candi0_pixles  	),
	.candi1_pixles_i	(candi1_pixles  	),
	.candi2_pixles_i	(candi2_pixles  	),
	.candi3_pixles_i	(candi3_pixles  	),
	.candi4_pixles_i	(candi4_pixles  	),
	.candi5_pixles_i	(candi5_pixles  	),
	.candi6_pixles_i	(candi6_pixles  	),
	.candi7_pixles_i	(candi7_pixles  	),
	.candi8_pixles_i	(candi8_pixles  	),
	.pred_pixel_o	        (mcif_pre_pixel_o       ),
	.pred_wren_o	        (pred_wren              ),
	.pred_addr_o 	        (mcif_pre_addr_o        )          
);
assign mcif_pre_wren_o = pred_wren & {predicted_en, predicted_en, predicted_en, predicted_en};

assign mcif_mv_wren_o     = fmv_wren && ( (current_state>=1)&(current_state<=6) ); // the third round, do not need to override mv buffer
assign mcif_mv_wraddr_o   = fmv_addr;
assign mcif_mv_data_o     = fmv_best;

assign imv_x = fimeif_mv_data_i[2*`FMV_WIDTH-1 : `FMV_WIDTH];
assign imv_y = fimeif_mv_data_i[`FMV_WIDTH-1   :          0];
assign fmv_x = mcif_mv_data_i  [2*`FMV_WIDTH-1 : `FMV_WIDTH];
assign fmv_y = mcif_mv_data_i  [`FMV_WIDTH-1   :          0];


endmodule

