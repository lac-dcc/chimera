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
//  Filename      : mc_top.v
//  Author        : Yufeng Bai
//  Email         : byfchina@gmail.com
//  Created On    : 2015-01-19
//
//-------------------------------------------------------------------
//
//  Modified      : 2015-08-31 by HLL
//  Description   : mvd added
//  Modified      : 2015-09-02 by HLL
//  Description   : mvd if connected out
//
//-------------------------------------------------------------------


`include "enc_defines.v"

module mc_top (
	clk		,
	rstn		,

  mb_x_total_i    ,
  mb_y_total_i    ,

	sysif_cmb_x_i		,
	sysif_cmb_y_i		,
	sysif_qp_i		,
	sysif_start_i		,
	sysif_done_o		,

        fetchif_rden_o          ,
	fetchif_idx_x_o		,
	fetchif_idx_y_o		,
	fetchif_sel_o		,
	fetchif_pel_i		,

	fmeif_partition_i		,
	fmeif_mv_i		,
	fmeif_mv_rden_o		,
	fmeif_mv_rdaddr_o	,

        pred_wrdata_o 	        ,
        pred_wren_o 	        ,
        pred_wraddr_o 	        ,
        pred_ren_o 	        ,
        pred_size_o 	        ,
        pred_4x4_x_o 	        ,
        pred_4x4_y_o 	        ,
        pred_4x4_idx_o 	        ,
        pred_rdata_i 	        ,

  mvd_wen_o      ,
  mvd_waddr_o    ,
  mvd_wdata_o    ,

	pre_start_o		,
	pre_en_o		,
	pre_sel_o		,
	pre_size_o		,
	pre_4x4_x_o		,
	pre_4x4_y_o		,
	pre_data_o		,
	rec_val_i		,
	rec_idx_i
);

// ********************************************
//
//    INPUT / OUTPUT DECLARATION
//
// ********************************************

input 	 [1-1:0] 	        clk 	 ; // clk signal
input 	 [1-1:0] 	        rstn 	 ; // asynchronous reset

input [(`PIC_X_WIDTH)-1 : 0]    mb_x_total_i ; // mb_x_total_i
input [(`PIC_Y_WIDTH)-1 : 0]    mb_y_total_i ; // mb_y_total_i

input 	 [`PIC_X_WIDTH-1:0] 	sysif_cmb_x_i 	 ; // x position of the current LCU in the frame
input 	 [`PIC_Y_WIDTH-1:0] 	sysif_cmb_y_i 	 ; // y position of the current LCU in the frame
input 	 [6-1:0] 	        sysif_qp_i 	 ; // qp of the current LCU
input 	 [1-1:0] 	        sysif_start_i 	 ; // C-ime start trigger signal
output 	 [1-1:0] 	        sysif_done_o 	 ; // C-ime done ack signal

output 	 [1-1:0] 	        fetchif_rden_o 	 ; // fetch u/v ref pixels enable
output 	 [6-1:0] 	        fetchif_idx_x_o  ; // "x position of ref LCU in the search window; (-12
output 	 [6-1:0] 	        fetchif_idx_y_o  ; // "y position of ref LCU in the search window; (-12
output 	 [1-1:0] 	        fetchif_sel_o 	 ; // fetch u/v ref pixels
input 	 [8*`PIXEL_WIDTH-1:0]  fetchif_pel_i 	 ; // ref LCU pixel data

input 	 [42-1:0] 	        fmeif_partition_i 	 ; // CU partition info ( 16 + 4 + 1) * 2
input 	 [`FMV_WIDTH*2-1:0] 	fmeif_mv_i 	 ; // 8 x 8 PU MVs
output 	 [1-1:0] 	        fmeif_mv_rden_o	 ; // mv read enable siganl
output 	 [6-1:0] 	        fmeif_mv_rdaddr_o; // mv address

//pred buf reuse
output 	 [32*`PIXEL_WIDTH-1:0] 	pred_wrdata_o 	 ; // chroma predicted pixel output
output 	 [4-1:0] 	        pred_wren_o 	 ; // chroma predicted pixel write enable
output 	 [7-1:0] 	        pred_wraddr_o 	 ; // chroma predicted pixel write address
output 	 [1-1:0] 	        pred_ren_o 	 ; // predicted pixel read request
output 	 [2-1:0] 	        pred_size_o 	 ; // predicted pixel read mode
output 	 [4-1:0] 	        pred_4x4_x_o 	 ; // predicted data 4x4 block x in LCU
output 	 [4-1:0] 	        pred_4x4_y_o 	 ; // predicted data 4x4 block y in LCU
output 	 [5-1:0] 	        pred_4x4_idx_o 	 ; // predicted data index
input 	 [32*`PIXEL_WIDTH-1:0] 	pred_rdata_i 	 ; // predicted pixel

output                         mvd_wen_o      ;
output   [6-1          : 0]    mvd_waddr_o    ;
output   [2*`MVD_WIDTH : 0]    mvd_wdata_o    ;

output 	 [1-1:0] 	        pre_start_o 	 ; // pre start (pulse)
output 	 [1-1:0] 	        pre_en_o 	 ; // pre enbale
output 	 [2-1:0] 	        pre_sel_o 	 ; // luma:0x,u:10,v:11
output 	 [2-1:0] 	        pre_size_o 	 ; // pre size info
output 	 [4-1:0] 	        pre_4x4_x_o 	 ; // tq 4x4 block index x in LCU
output 	 [4-1:0] 	        pre_4x4_y_o 	 ; // tq 4x4 block index y in LCU
output 	 [16*`PIXEL_WIDTH-1:0] 	pre_data_o 	 ; // tq 4x4 data
input 	 [1-1:0] 	        rec_val_i 	 ; // reconstruced info valid
input 	 [5-1:0] 	        rec_idx_i 	 ; // reconstruced idx

wire     [2-1:0]          tq_sel       ;


// ********************************************
//
//    WIRE / REG DECLARATION
//
// ********************************************

wire [1-1 : 0]    fmeif_mv_rden_mvd_w   ;
wire [6-1 : 0]    fmeif_mv_rdaddr_mvd_w ;
wire [1-1 : 0]    fmeif_mv_rden_mc_w    ;
wire [6-1 : 0]    fmeif_mv_rdaddr_mc_w  ;

wire              mvd_access_w          ;

wire              mvd_wen_w             ;


// ********************************************
//
//    Sub-modules Logic
//
// ********************************************
mc_chroma_top u_mc_chroma(
	.clk		        (clk		        ),
	.rstn		        (rstn		        ),

        .ctrl_launch_i          (chroma_start           ),
        .ctrl_launch_sel_i      (chroma_sel             ),
        .ctrl_done_o            (chroma_done            ),

	.mv_rden_o		(fmeif_mv_rden_mc_w	),
	.mv_rdaddr_o		(fmeif_mv_rdaddr_mc_w	),
	.mv_data_i		(fmeif_mv_i		),

	.ref_rden_o		(fetchif_rden_o		),
	.ref_idx_x_o		(fetchif_idx_x_o	),
	.ref_idx_y_o		(fetchif_idx_y_o	),
	.ref_sel_o		(fetchif_sel_o		),
	.ref_pel_i		(fetchif_pel_i		),

	.pred_pixel_o		(pred_wrdata_o		),
	.pred_wren_o		(pred_wren_o		),
	.pred_addr_o		(pred_wraddr_o		)
);

mc_ctrl u_ctrl (
	.clk		        (clk		        ),
	.rstn		        (rstn		        ),

	.mc_start_i		(sysif_start_i		),
	.mc_done_o		(sysif_done_o		),

  .mvd_access_o    ( mvd_access_w    ),

	.chroma_start_o		(chroma_start		),
	.chroma_sel_o		(chroma_sel		),
	.chroma_done_i		(chroma_done		),

	.tq_start_o		(tq_start		),
	.tq_sel_o		(tq_sel 		),
	.tq_done_i		(tq_done		)
);

mc_tq u_tq(
	.clk		(clk		),
	.rstn		(rstn		),

	.tq_start_i	(tq_start	),
	.tq_sel_i	(tq_sel 	),
	.tq_done_o	(tq_done	),

        .partition_i    (fmeif_partition_i),

	.ipre_start_o	(pre_start_o	),
	.ipre_en_o	(pre_en_o	),
	.ipre_sel_o	(pre_sel_o	),
	.ipre_size_o	(pre_size_o	),
	.ipre_4x4_x_o	(pre_4x4_x_o	),
	.ipre_4x4_y_o	(pre_4x4_y_o	),
        .ipre_data_o    (pre_data_o    ),
	.rec_val_i	(rec_val_i	),
	.rec_idx_i	(rec_idx_i	),

	.pred_ren_o	(pred_ren_o	),
	.pred_size_o	(pred_size_o	),
	.pred_4x4_x_o	(pred_4x4_x_o	),
	.pred_4x4_y_o	(pred_4x4_y_o	),
	.pred_4x4_idx_o	(pred_4x4_idx_o	),
	.pred_rdata_i	(pred_rdata_i	)
);

  // mvd
  mvd_top u_mvd_top(
    // global
    .clk                     ( clk                      ),
    .rst_n                   ( rstn                     ),
    .mb_x_total_i            ( mb_x_total_i             ),
    .mb_y_total_i            ( mb_y_total_i             ),
    // control
    .mvd_start_i             ( sysif_start_i            ),
    .mb_x_i                  ( sysif_cmb_x_i            ),
    .mb_y_i                  ( sysif_cmb_y_i            ),
    .inter_cu_part_size_i    ( fmeif_partition_i        ),
    .mvd_done_o              (                          ),
    // mv_i
    .mv_rden_o               ( fmeif_mv_rden_mvd_w      ),
    .mv_rdaddr_o             ( fmeif_mv_rdaddr_mvd_w    ),
    .mv_data_i               ( fmeif_mv_i               ),
    // mvd_o
    .mvd_wen_o               ( mvd_wen_w                ),
    .mvd_addr_o              ( mvd_waddr_o              ),
    .mvd_and_mvp_idx_o       ( mvd_wdata_o              )
    );

  assign fmeif_mv_rden_o   = mvd_access_w ? (!fmeif_mv_rden_mvd_w  ) : fmeif_mv_rden_mc_w   ;
  assign fmeif_mv_rdaddr_o = mvd_access_w ?   fmeif_mv_rdaddr_mvd_w  : fmeif_mv_rdaddr_mc_w ;

  assign mvd_wen_o   = !mvd_wen_w ;

endmodule

