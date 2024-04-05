//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2011, VIPcore Group, Fudan University
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
//  Filename      : mem_buf.v
//  Author        : Yibo FAN
//  Created       : 2014-01-16
//  Description   : Memory Buf
//                  includes PRED_MEM, REC_MEM, COEFF_MEM
//
//  Data Orgnization
//    4x4               TQ  bit not fully fixed                     Normal Bit
//  0  1  2  3         [fedc xxxx ba98 xxxx 7654 xxxx 3210]        [0 1 2 3 4 5 6 7 ....]
//  4  5  6  7
//  8  9  a  b
//  c  d  e  f
//
//    8x8               TQ  bit fully fixed
//  0 1 2 3 4 5 6 7    [fedc ba98 7654 3210 fedc ba98 7654 3210]
//  8 9 a b c d e f
//  0 1 2 3 4 5 6 7
//  8 9 a b c d e f
//  ...
//
//    16x16
//  0 1 2 3 4 5 6 7 8 9 a b c d e f
//  0 1 2 3 4 5 6 7 8 9 a b c d e f
//  ...
//
//    32x32
//  0 1 2 3 4 5 6 7 8 9 a b c d e f ...
//  ...
//
//-------------------------------------------------------------------
//
//  Modified      : 2014-09-11 by HLL
//  Description   : chroma supported
//  Modified      : 2014-09-18 by HLL
//  Description   : tlb for coe_mem added, cabac read supported
//  Modified      : 2014-09-22 by HLL
//  Description   : separated reconstruction and cover signals generated
//                  (cover signals come later than reconstruction signals instead of simultaneously)
//  Modified      : 2014-09-22 by HLL
//  Description   : one-cycle cover signals supported
//  Modified      : 2014-09-23 by HLL
//  Description   : tlb for rec_mem added, db read supported
//  Modified      : 2014-10-13 by HLL
//  Description   : cbf added
//  Modified      : 2014-10-14 by HLL
//  Description   : partition added
//  Modified      : 2014-10-16 by HLL
//  Description   : mode added
//  Modified      : 2014-10-17 by HLL
//  Description   : mode for uv prediction exported
//  Modified      : 2014-10-21 by HLL
//  Description   : rdcost added
//  Modified      : 2014-11-30 by HLL
//  Description   : storage method for mode changed from registers to sram
//  Modified      : 2015-04-29 by HLL
//  Description   : inter supported
//
//  $Id$
//
//-------------------------------------------------------------------

`include "enc_defines.v"

module mem_buf   (
				clk      		,
				rst_n        	,

        pre_start_i   ,
        pre_type_i    ,
				pre_bank_i		,
				pre_cbank_i		,
				ec_bank_i		,
				ec_cbank_i		,
				db_bank_i		,
				db_cbank_i		,

				cmb_sel_o		,
				cmb_ren_o		,
				cmb_size_o      ,
				cmb_4x4_x_o		,
				cmb_4x4_y_o		,
				cmb_idx_o		,
				cmb_data_i		,

        ipre_min_size_i ,

				ipre_en_i  		,
				ipre_sel_i 		,
				ipre_size_i		,
				ipre_4x4_x_i	,
				ipre_4x4_y_i	,
				ipre_data_i 	,
				ipre_mode_i   ,
				ipre_qp_i     ,

				tq_res_en_o 	,
				tq_res_sel_o 	,
				tq_res_size_o	,
				tq_res_idx_o	,
				tq_res_data_o 	,

				tq_rec_val_i 	,
				tq_rec_idx_i	,
				tq_rec_data_i 	,

				tq_cef_en_i     ,
				tq_cef_rw_i		,
				tq_cef_idx_i   	,
				tq_cef_data_i   ,
				tq_cef_data_o   ,

				rec_val_o    	,
				rec_idx_o    	,
				rec_data_o   	,

				cover_valid_o   ,
				cover_value_o   ,

        db_mem_ren_i    ,
        db_mem_raddr_i  ,
        db_mem_rdata_o  ,


  ec_mem_ren_i        ,
  ec_mem_sel_i        ,
  ec_mem_raddr_i      ,
  ec_mem_rdata_o      ,

  ec_cbf_luma_o       ,
  ec_cbf_cb_o         ,
  ec_cbf_cr_o         ,

  partition_old_o      ,
  partition_cur_o      ,

  lm_md_renab_i        ,
  lm_md_raddr_i        ,
  lm_md_rdata_o        ,
  cm_md_renab_i        ,
  cm_md_raddr_i        ,
  cm_md_rdata_o
  );

//*** PARAMETER ****************************************************************

  localparam    I_4x4    = 2'b00 ,
                I_8x8    = 2'b01 ,
                I_16x16  = 2'b10 ,
                I_32x32  = 2'b11 ;

  localparam    INTRA    = 0     ,
                INTER    = 1     ;


// ********************************************
//
//    INPUT / OUTPUT DECLARATION
//
// ********************************************
input								clk				; // clock
input								rst_n			; // reset signal
input              pre_start_i ;
input              pre_type_i  ;
input  [1:0]						pre_bank_i		; // predicted pixels memory bank selector
input  [1:0]						ec_bank_i		; // cabac coefficient memory bank selector
input  [1:0]						db_bank_i		; // deblocking filter bank selector
input  								pre_cbank_i		; // predicted chroma pixels memory bank
input  								ec_cbank_i		; // cabac chroma coefficient memory bank
input  								db_cbank_i		; // deblocking filter chroma bank
// CMB IF
output								cmb_sel_o		;
output 								cmb_ren_o		; // cmb read enable
output [1:0]						cmb_size_o		; // cmb read size (00:4x4 01:8x8 10:16x16 11:32x32)
output [3:0]						cmb_4x4_x_o		; // cmb read block coordinates
output [3:0]						cmb_4x4_y_o		; // cmb read block coordinates
output [4:0]						cmb_idx_o		; // read index ({blk_index, line_number})
input  [`PIXEL_WIDTH*32-1:0]		cmb_data_i		; // pixel data
// Intra Pred IF
input                 ipre_min_size_i ;

input  								ipre_en_i  		; // tq data enable
input  [1:0]						ipre_sel_i 		; // 0x: luma, 10: cb; 11:cr
input  [1:0]						ipre_size_i		; // tq tu size (00:4x4 01:8x8 10:16x16 11:32
input  [3:0]						ipre_4x4_x_i	; // tq 4x4 block index x in LCU
input  [3:0]						ipre_4x4_y_i	; // tq 4x4 block index y in LCU
input  [`PIXEL_WIDTH*16-1:0]		ipre_data_i 	; // tq predicted pixels
input  [5                 : 0]    ipre_mode_i ; // tq predition mode
input  [5                 : 0]    ipre_qp_i   ;
// TQ IF
output								tq_res_en_o 	; // tq data enable
output [1:0]						tq_res_sel_o	; // 0x: luma, 10: cb; 11:cr
output [1:0]						tq_res_size_o	; // tq tu size (00:4x4 01:8x8 10:16x16 11:3
output [4:0]						tq_res_idx_o	; // tq row pixel index
output [(`PIXEL_WIDTH+1)*32-1:0]	tq_res_data_o	; // tq residuals

input  								tq_rec_val_i	; // tq rec valid
input  [4:0]						tq_rec_idx_i	; // tq rec row pixel index
input  [(`PIXEL_WIDTH+1)*32-1:0]	tq_rec_data_i	; // tq reconstructed pixels

input  								tq_cef_en_i		; // tq coefficient RW enable
input  								tq_cef_rw_i		; // tq coefficient RW -> 0: Read; 1: Write
input  [4:0]						tq_cef_idx_i	; // tq coefficient write row pixel index
input  [`COEFF_WIDTH*32-1:0]		tq_cef_data_i	; // tq coefficient write values
output [`COEFF_WIDTH*32-1:0]		tq_cef_data_o	; // tq coefficient read values
// Intra Rec IF
//wire								rec_cov_o		; // reconstructed coverage
output 								rec_val_o 		; // reconstructed valid
output [4:0]						rec_idx_o		; // reconstructed parallel row index
output [`PIXEL_WIDTH*32-1:0]		rec_data_o 		; // reconstructed pixels

output           cover_valid_o ;
output           cover_value_o ;

  // DB IF
  input                             db_mem_ren_i   ;
  input  [8                 : 0]    db_mem_raddr_i ;
  output [`PIXEL_WIDTH*16-1 : 0]    db_mem_rdata_o ;

// EC IF
input 								ec_mem_ren_i	; // cabac read enable
input  [1:0]          ec_mem_sel_i  ;
input  [8:0]						ec_mem_raddr_i	; // cabac read address
output [`COEFF_WIDTH*16-1:0] 		ec_mem_rdata_o	; // cabac read data
output reg [`LCU_SIZE*`LCU_SIZE/16-1:0] ec_cbf_luma_o	; // cbf
output reg [`LCU_SIZE*`LCU_SIZE/16-1:0] ec_cbf_cb_o		; // cbf
output reg [`LCU_SIZE*`LCU_SIZE/16-1:0] ec_cbf_cr_o		; // cbf

  // PARTITION
  output      [20     : 0]      partition_cur_o ;
  output reg  [20     : 0]      partition_old_o ;

  // MODE
  input                    lm_md_renab_i ;
  input     [5     : 0]    lm_md_raddr_i ;
  output    [23    : 0]    lm_md_rdata_o ;
  input                    cm_md_renab_i ;
  input     [3     : 0]    cm_md_raddr_i ;
  output    [23    : 0]    cm_md_rdata_o ;


// ********************************************
//
//    Signals DECLARATION
//
// ********************************************
// Global parameters for Pre-Rec Loop
reg	 [1:0]							tq_pre_sel		; // 0x: luma, 10: cb; 11:cr
reg	 [1:0]							tq_pre_size     ; // 00:4x4 01:8x8 10:16x16 11:32
reg	 [3:0]							tq_pre_4x4_x    ;
reg	 [3:0]							tq_pre_4x4_y    ;
reg  [3:0]							tq_tl_4x4_x     ;
reg  [3:0]							tq_tl_4x4_y     ;

// Pred MEM control
wire 								pre_wen    	 	; // pred write
wire [1:0]							pre_wsize       ;
wire [3:0]							pre_w4x4_x      ;
wire [3:0]							pre_w4x4_y      ;
wire [`PIXEL_WIDTH*16-1:0]			pre_wdata       ;
wire 								pre_ren   		;
wire [4:0]							pre_ridx     	;
wire [`PIXEL_WIDTH*32-1:0]			pre_rdata		;

reg									tq_pre_ren		; // tq read
reg  [2:0]							tq_pre_idxh		;
reg  [4:0]							tq_pre_idx		;

reg  [1:0]							line_cnt		;
// TQ IF Reg
reg									tq_res_en_o 	;
reg  [1:0]							tq_res_sel_o	;
reg  [1:0]							tq_res_size_o	;
reg  [4:0]							tq_res_idx_o	;
wire [(`PIXEL_WIDTH+1)*32-1:0]		tq_res_data_o	;

reg  								tq_rec_wen		;
reg  [4:0]							tq_rec_widx     ;
reg signed[(`PIXEL_WIDTH+1)*32-1:0] tq_rec_data		;

wire [`PIXEL_WIDTH*32-1:0] 			rec_data		;

// REC
wire signed[`PIXEL_WIDTH:0]			res_data_0, res_data_8 , res_data_16, res_data_24, tq_rec_data_0, tq_rec_data_8 , tq_rec_data_16, tq_rec_data_24,
                                    res_data_1, res_data_9 , res_data_17, res_data_25, tq_rec_data_1, tq_rec_data_9 , tq_rec_data_17, tq_rec_data_25,
                                    res_data_2, res_data_10, res_data_18, res_data_26, tq_rec_data_2, tq_rec_data_10, tq_rec_data_18, tq_rec_data_26,
                                    res_data_3, res_data_11, res_data_19, res_data_27, tq_rec_data_3, tq_rec_data_11, tq_rec_data_19, tq_rec_data_27,
                                    res_data_4, res_data_12, res_data_20, res_data_28, tq_rec_data_4, tq_rec_data_12, tq_rec_data_20, tq_rec_data_28,
                                    res_data_5, res_data_13, res_data_21, res_data_29, tq_rec_data_5, tq_rec_data_13, tq_rec_data_21, tq_rec_data_29,
                                    res_data_6, res_data_14, res_data_22, res_data_30, tq_rec_data_6, tq_rec_data_14, tq_rec_data_22, tq_rec_data_30,
                                    res_data_7, res_data_15, res_data_23, res_data_31, tq_rec_data_7, tq_rec_data_15, tq_rec_data_23, tq_rec_data_31;

wire signed [`PIXEL_WIDTH:0]		rec_data_0, rec_data_8 , rec_data_16, rec_data_24,
									rec_data_1, rec_data_9 , rec_data_17, rec_data_25,
									rec_data_2, rec_data_10, rec_data_18, rec_data_26,
									rec_data_3, rec_data_11, rec_data_19, rec_data_27,
									rec_data_4, rec_data_12, rec_data_20, rec_data_28,
									rec_data_5, rec_data_13, rec_data_21, rec_data_29,
									rec_data_6, rec_data_14, rec_data_22, rec_data_30,
									rec_data_7, rec_data_15, rec_data_23, rec_data_31;
// EC IF
wire								ec_ren			;
wire [1:0]							ec_size         ;
wire [3:0]							ec_4x4_x        ;
wire [3:0]							ec_4x4_y        ;
wire [4:0]							ec_idx          ;
wire [`COEFF_WIDTH*32-1:0]			ec_data         ;
// DB IF
wire								db_ren			;
wire [1:0]							db_size         ;
wire [3:0]							db_4x4_x        ;
wire [3:0]							db_4x4_y        ;
wire [4:0]							db_idx          ;
wire [`PIXEL_WIDTH*32-1:0]			db_data         ;

  // cbf
  reg  [`LCU_SIZE*`LCU_SIZE/16-1 : 0]    ec_cbf_luma_cur_r    ;
  reg  [`LCU_SIZE*`LCU_SIZE/16-1 : 0]    ec_cbf_luma_nxt_r    ;
  reg  [`LCU_SIZE*`LCU_SIZE/16-1 : 0]    ec_cbf_cb_nxt_r      ;
  reg  [`LCU_SIZE*`LCU_SIZE/16-1 : 0]    ec_cbf_cr_nxt_r      ;
  reg                                    ec_cbf_done_r        ;
  reg                                    ec_cbf_zero_r        ;
  wire [`LCU_SIZE*`LCU_SIZE/16-1 : 0]    ec_cbf_1_mask_w      ;
  wire [`LCU_SIZE*`LCU_SIZE/16-1 : 0]    ec_cbf_0_mask_w      ;
  reg  [`LCU_SIZE*`LCU_SIZE/16-1 : 0]    ec_cbf_cur_w         ;    // 64 bits is enough
  wire [7                        : 0]    ec_cbf_addr_w        ;

  // partition
  wire [20                       : 0]    partition_cur_w      ;
  wire                                   partition_64         ;
  reg  [4 -1                     : 0]    partition_32         ;
  reg  [16-1                     : 0]    partition_16         ;
  wire [16-1                     : 0]    partition_0_mask_w   ;
  wire [16-1                     : 0]    partition_1_mask_w   ;
  wire [7                        : 0]    partition_addr_w     ;

  // mode
  reg  [383                      : 0]    ec_i_l_mode_r        ;
  reg  [383                      : 0]    ec_i_c_mode_r        ;
  wire [383                      : 0]    ec_i_mask_0_w        ;
  reg  [383                      : 0]    ec_i_mask_1_w        ;
  reg  [383                      : 0]    ec_i_mask_mode_w     ;
  wire [7                        : 0]    ec_i_addr_w          ;



// ********************************************
//
//    Logic DECLARATION
//
// ********************************************
// --------------------------------------------
//		Memory Banks
//---------------------------------------------
// Pred MEM: Write from Intra or Inter; Read from TQ I/O
assign pre_wen    	=  ipre_en_i    ;
assign pre_wsize    =  ipre_size_i  ;
assign pre_w4x4_x   =  ipre_4x4_x_i ;
assign pre_w4x4_y   =  ipre_4x4_y_i ;
assign pre_wdata    =  ipre_data_i  ;

assign pre_ren    	=  tq_rec_val_i?tq_rec_val_i:tq_pre_ren;
assign pre_ridx  	=  tq_rec_val_i?tq_rec_idx_i:tq_pre_idx;

mem_bipo_2p  pre_buf (
				.clk      	( clk    		),
				.rst_n      ( rst_n         ),
				.wen_i		( pre_wen    	),
				.wsize_i    ( pre_wsize    	),
				.w4x4_x_i   ( pre_w4x4_x   	),
				.w4x4_y_i   ( pre_w4x4_y   	),
				.wdata_i    ( pre_wdata    	),
				.ren_i      ( pre_ren  		),
				.rsize_i    ( tq_pre_size	),
				.r4x4_x_i   ( tq_tl_4x4_x	),
				.r4x4_y_i   ( tq_tl_4x4_y	),
				.ridx_i     ( pre_ridx   	),
				.rdata_o    ( pre_rdata  	)
);

  // Coeff. MEM: PORTA: Write/Read from TQ; PORT B: Read from CABAC

  wire [1:0] pre_bank_0_w ;
  wire [1:0] pre_bank_1_w ;
  wire [1:0] pre_bank_2_w ;
  wire [1:0] pre_bank_3_w ;

  wire [1:0] ec_bank_w ;
  reg  [1:0] ec_sel_i  ;

  wire [7:0] ec_mem_raddr_w ;
  assign ec_mem_raddr_w = ec_mem_raddr_i ;
  assign ec_4x4_x       = { ec_mem_raddr_w[6] ,ec_mem_raddr_w[4] ,ec_mem_raddr_w[2] ,ec_mem_raddr_w[0] };
  assign ec_4x4_y       = { ec_mem_raddr_w[7] ,ec_mem_raddr_w[5] ,ec_mem_raddr_w[3] ,ec_mem_raddr_w[1] };
  assign ec_size        = 2'b0 ;
  assign ec_idx         = 2'b0 ;
  assign ec_ren         = ec_mem_ren_i ;

  always @(*) begin
    case( ec_mem_sel_i )
      2'b00   : ec_sel_i = 2'b11 ;
      2'b01   : ec_sel_i = 2'b10 ;
      2'b10   : ec_sel_i = 2'b00 ;
      default : ec_sel_i = 2'b00 ;
    endcase
  end

  reg ec_mem_raddr_r ;
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
      ec_mem_raddr_r <= 2'b0 ;
    else begin
      ec_mem_raddr_r <= ec_mem_raddr_i[1] ;
    end
  end

  assign ec_mem_rdata_o = ec_mem_raddr_r ? { ec_data[(0+27)*16+15:(0+27)*16] ,
                                             ec_data[(0+19)*16+15:(0+19)*16] ,
                                             ec_data[(0+26)*16+15:(0+26)*16] ,
                                             ec_data[(0+18)*16+15:(0+18)*16] ,
                                             ec_data[(0+11)*16+15:(0+11)*16] ,
                                             ec_data[(0+03)*16+15:(0+03)*16] ,
                                             ec_data[(0+10)*16+15:(0+10)*16] ,
                                             ec_data[(0+02)*16+15:(0+02)*16] ,
                                             ec_data[(0+25)*16+15:(0+25)*16] ,
                                             ec_data[(0+17)*16+15:(0+17)*16] ,
                                             ec_data[(0+24)*16+15:(0+24)*16] ,
                                             ec_data[(0+16)*16+15:(0+16)*16] ,
                                             ec_data[(0+09)*16+15:(0+09)*16] ,
                                             ec_data[(0+01)*16+15:(0+01)*16] ,
                                             ec_data[(0+08)*16+15:(0+08)*16] ,
                                             ec_data[(0+00)*16+15:(0+00)*16] }
                                         :
                                           { ec_data[(4+27)*16+15:(4+27)*16] ,
                                             ec_data[(4+19)*16+15:(4+19)*16] ,
                                             ec_data[(4+26)*16+15:(4+26)*16] ,
                                             ec_data[(4+18)*16+15:(4+18)*16] ,
                                             ec_data[(4+11)*16+15:(4+11)*16] ,
                                             ec_data[(4+03)*16+15:(4+03)*16] ,
                                             ec_data[(4+10)*16+15:(4+10)*16] ,
                                             ec_data[(4+02)*16+15:(4+02)*16] ,
                                             ec_data[(4+25)*16+15:(4+25)*16] ,
                                             ec_data[(4+17)*16+15:(4+17)*16] ,
                                             ec_data[(4+24)*16+15:(4+24)*16] ,
                                             ec_data[(4+16)*16+15:(4+16)*16] ,
                                             ec_data[(4+09)*16+15:(4+09)*16] ,
                                             ec_data[(4+01)*16+15:(4+01)*16] ,
                                             ec_data[(4+08)*16+15:(4+08)*16] ,
                                             ec_data[(4+00)*16+15:(4+00)*16] }
                                         ;

  wire [511 :0]  tq_cef_data_i_w;
  wire [511 :0]  tq_cef_data_o_w;
  assign tq_cef_data_i_w = { tq_cef_data_i[015:000], tq_cef_data_i[031:016] ,
                             tq_cef_data_i[047:032], tq_cef_data_i[063:048] ,
                             tq_cef_data_i[079:064], tq_cef_data_i[095:080] ,
                             tq_cef_data_i[111:096], tq_cef_data_i[127:112] ,
                             tq_cef_data_i[143:128], tq_cef_data_i[159:144] ,
                             tq_cef_data_i[175:160], tq_cef_data_i[191:176] ,
                             tq_cef_data_i[207:192], tq_cef_data_i[223:208] ,
                             tq_cef_data_i[239:224], tq_cef_data_i[255:240] ,
                             tq_cef_data_i[271:256], tq_cef_data_i[287:272] ,
                             tq_cef_data_i[303:288], tq_cef_data_i[319:304] ,
                             tq_cef_data_i[335:320], tq_cef_data_i[351:336] ,
                             tq_cef_data_i[367:352], tq_cef_data_i[383:368] ,
                             tq_cef_data_i[399:384], tq_cef_data_i[415:400] ,
                             tq_cef_data_i[431:416], tq_cef_data_i[447:432] ,
                             tq_cef_data_i[463:448], tq_cef_data_i[479:464] ,
                             tq_cef_data_i[495:480], tq_cef_data_i[511:496] };

  assign tq_cef_data_o = { tq_cef_data_o_w[015:000], tq_cef_data_o_w[031:016] ,
                           tq_cef_data_o_w[047:032], tq_cef_data_o_w[063:048] ,
                           tq_cef_data_o_w[079:064], tq_cef_data_o_w[095:080] ,
                           tq_cef_data_o_w[111:096], tq_cef_data_o_w[127:112] ,
                           tq_cef_data_o_w[143:128], tq_cef_data_o_w[159:144] ,
                           tq_cef_data_o_w[175:160], tq_cef_data_o_w[191:176] ,
                           tq_cef_data_o_w[207:192], tq_cef_data_o_w[223:208] ,
                           tq_cef_data_o_w[239:224], tq_cef_data_o_w[255:240] ,
                           tq_cef_data_o_w[271:256], tq_cef_data_o_w[287:272] ,
                           tq_cef_data_o_w[303:288], tq_cef_data_o_w[319:304] ,
                           tq_cef_data_o_w[335:320], tq_cef_data_o_w[351:336] ,
                           tq_cef_data_o_w[367:352], tq_cef_data_o_w[383:368] ,
                           tq_cef_data_o_w[399:384], tq_cef_data_o_w[415:400] ,
                           tq_cef_data_o_w[431:416], tq_cef_data_o_w[447:432] ,
                           tq_cef_data_o_w[463:448], tq_cef_data_o_w[479:464] ,
                           tq_cef_data_o_w[495:480], tq_cef_data_o_w[511:496] };

  mem_pipo_dp cef_buf (
    .clk           ( clk              ),
    .rst_n         ( rst_n            ),

    .a_en_i        ( tq_cef_en_i      ),
    .a_rw_i        ( tq_cef_rw_i      ),
    .a_bank_0_i    ( pre_bank_0_w     ),
    .a_bank_1_i    ( pre_bank_1_w     ),
    .a_bank_2_i    ( pre_bank_2_w     ),
    .a_bank_3_i    ( pre_bank_3_w     ),
    .a_cbank_i     ( pre_cbank_w      ),
    .a_size_i      ( tq_pre_size      ),
    .a_sel_i       ( tq_pre_sel       ),
    .a_4x4_x_i     ( tq_tl_4x4_y      ),  // !!!
    .a_4x4_y_i     ( tq_tl_4x4_x      ),  // !!!
    .a_idx_i       ( tq_cef_idx_i     ),
    .a_wdata_i     ( tq_cef_data_i_w  ),
    .a_rdata_o     ( tq_cef_data_o_w  ),

    .b_ren_i       ( ec_ren           ),
    .b_bank_i      ( ec_bank_w        ),
    .b_cbank_i     ( ec_cbank_w       ),
    .b_size_i      ( ec_size          ),
    .b_sel_i       ( ec_sel_i         ),
    .b_4x4_x_i     ( ec_4x4_y         ),  // !!!
    .b_4x4_y_i     ( ec_4x4_x         ),  // !!!
    .b_idx_i       ( ec_idx           ),
    .b_rdata_o     ( ec_data          )
    );

  // Rec MEM

  wire [1:0] rec_bank_0_w ;
  wire [1:0] rec_bank_1_w ;
  wire [1:0] rec_bank_2_w ;
  wire [1:0] rec_bank_3_w ;

  wire [1:0] db_bank_w ;
  wire [1:0] db_sel_i  ;

  wire [7:0] db_mem_raddr_w ;
  assign db_mem_raddr_w = (db_mem_raddr_i<256) ? db_mem_raddr_i
                                               : ( (db_mem_raddr_i>319) ? (db_mem_raddr_i-320)
                                                                        : (db_mem_raddr_i-256)
                                                 );

  assign db_4x4_x       = { db_mem_raddr_w[6] ,db_mem_raddr_w[4] ,db_mem_raddr_w[2] ,db_mem_raddr_w[0] };
  assign db_4x4_y       = { db_mem_raddr_w[7] ,db_mem_raddr_w[5] ,db_mem_raddr_w[3] ,db_mem_raddr_w[1] };
  assign db_size        = 2'b0 ;
  assign db_idx         = 2'b0 ;
  assign db_ren         = db_mem_ren_i ;
  assign db_sel_i[1]    = db_mem_raddr_i>255 ;
  assign db_sel_i[0]    = db_mem_raddr_i>319 ;

  reg db_mem_raddr_r ;
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
      db_mem_raddr_r <= 1'b0 ;
    else begin
      db_mem_raddr_r <= db_mem_raddr_i[0] ;
    end
  end

  assign db_mem_rdata_o = db_mem_raddr_r ? { db_data[223:192] ,db_data[159:128] ,db_data[095:064] ,db_data[031:000] }
                                         : { db_data[255:224] ,db_data[191:160] ,db_data[127:096] ,db_data[063:032] };

  mem_pipo_2p  rec_buf (
    .clk           ( clk              ),
    .rst_n         ( rst_n            ),

    .a_wen_i       ( tq_rec_wen       ),
    .a_bank_0_i    ( rec_bank_0_w     ),
    .a_bank_1_i    ( rec_bank_1_w     ),
    .a_bank_2_i    ( rec_bank_2_w     ),
    .a_bank_3_i    ( rec_bank_3_w     ),
    .a_cbank_i     ( rec_cbank_w      ),
    .a_size_i      ( tq_pre_size      ),
    .a_sel_i       ( tq_pre_sel       ),
    .a_4x4_x_i     ( tq_tl_4x4_x      ),
    .a_4x4_y_i     ( tq_tl_4x4_y      ),
    .a_idx_i       ( tq_rec_widx      ),
    .a_wdata_i     ( rec_data         ),

    .b_ren_i       ( db_ren           ),
    .b_bank_i      ( db_bank_w        ),
    .b_cbank_i     ( db_cbank_w       ),
    .b_size_i      ( db_size          ),
    .b_sel_i       ( db_sel_i         ),
    .b_4x4_x_i     ( db_4x4_x         ),
    .b_4x4_y_i     ( db_4x4_y         ),
    .b_idx_i       ( db_idx           ),
    .b_rdata_o     ( db_data          )
  );

// --------------------------------------------
//		TQ IF
//---------------------------------------------
// Save Global parameters
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		tq_pre_sel		<= 'b0;
		tq_pre_size 	<= 'b0;
		tq_pre_4x4_x	<= 'b0;
		tq_pre_4x4_y	<= 'b0;
	end
	else if (ipre_en_i) begin
		tq_pre_sel		<= ipre_sel_i;
		tq_pre_size		<= ipre_size_i;
		tq_pre_4x4_x	<= ipre_4x4_x_i;
		tq_pre_4x4_y	<= ipre_4x4_y_i;
	end
end

always @(*) begin
	case (tq_pre_size)
		I_4x4	: begin tq_tl_4x4_x	= tq_pre_4x4_x;
						tq_tl_4x4_y	= tq_pre_4x4_y;
				  	end
		I_8x8   : begin tq_tl_4x4_x	= {tq_pre_4x4_x[3:1], 1'b0};
		                tq_tl_4x4_y	= {tq_pre_4x4_y[3:1], 1'b0};
		          	end
		I_16x16 : begin tq_tl_4x4_x	= {tq_pre_4x4_x[3:2], 2'b0};
		                tq_tl_4x4_y	= {tq_pre_4x4_y[3:2], 2'b0};
		          	end
		I_32x32 : begin tq_tl_4x4_x	= {tq_pre_4x4_x[3], 3'b0};
		                tq_tl_4x4_y	= {tq_pre_4x4_y[3], 3'b0};
		          	end
	endcase
end

// Read Pre/Orig MEM
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		tq_pre_ren <= 1'b0;
		tq_pre_idxh<= 3'b0;
	end
	else if (tq_pre_ren) begin
		tq_pre_idxh<= tq_pre_idxh;
		case (ipre_size_i)
			I_4x4	: tq_pre_ren <= 1'b0;
			I_8x8	: tq_pre_ren <= 1'b0;
			I_16x16	: tq_pre_ren <= (line_cnt==2'd1)?1'b0:tq_pre_ren;
			I_32x32	: tq_pre_ren <= (line_cnt==2'd3)?1'b0:tq_pre_ren;
		endcase
	end
	else if (ipre_en_i) begin
		case (ipre_size_i)
			I_4x4	: begin tq_pre_ren <= 1'b1;
							tq_pre_idxh<= 3'b0;
						end
			I_8x8	: begin tq_pre_ren <= ipre_4x4_x_i[0] ? 1'b1 : tq_pre_ren;
							tq_pre_idxh<= {2'b0, tq_pre_4x4_y[0]};
						end
			I_16x16	: begin tq_pre_ren <= (ipre_4x4_x_i[1:0]==2'h3) ? 1'b1 : tq_pre_ren;
							tq_pre_idxh<= {1'b0, tq_pre_4x4_y[1:0]};
						end
			I_32x32	: begin tq_pre_ren <= (ipre_4x4_x_i[2:0]==3'h7) ? 1'b1 : tq_pre_ren;
							tq_pre_idxh<= tq_pre_4x4_y[2:0];
						end
		endcase
	end
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		line_cnt <= 2'b0;
	else if (tq_pre_ren)
		line_cnt <= line_cnt + 1'b1;
	else
		line_cnt <= 2'b0;
end

always @(*) begin
	case (tq_pre_size)
		I_4x4	,
		I_8x8	: tq_pre_idx = {tq_pre_idxh,2'b0};
		I_16x16	: tq_pre_idx = {tq_pre_idxh,line_cnt[0],1'b0};
		I_32x32	: tq_pre_idx = {tq_pre_idxh,line_cnt[1:0]};
	endcase
end

// output data to TQ
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		tq_res_en_o 	<= 'b0;
		tq_res_sel_o	<= 'b0;
		tq_res_size_o	<= 'b0;
		tq_res_idx_o	<= 'b0;
	end
	else begin
		tq_res_en_o 	<= tq_pre_ren	;
		tq_res_sel_o	<= tq_pre_sel   ;
		tq_res_size_o	<= tq_pre_size  ;
		tq_res_idx_o	<= tq_pre_idx   ;
	end
end

assign res_data_31 = {1'b0, cmb_data_i[`PIXEL_WIDTH*1 -1:`PIXEL_WIDTH*0 ]} - {1'b0, pre_rdata[`PIXEL_WIDTH*1 -1:`PIXEL_WIDTH*0 ]};
assign res_data_30 = {1'b0, cmb_data_i[`PIXEL_WIDTH*2 -1:`PIXEL_WIDTH*1 ]} - {1'b0, pre_rdata[`PIXEL_WIDTH*2 -1:`PIXEL_WIDTH*1 ]};
assign res_data_29 = {1'b0, cmb_data_i[`PIXEL_WIDTH*3 -1:`PIXEL_WIDTH*2 ]} - {1'b0, pre_rdata[`PIXEL_WIDTH*3 -1:`PIXEL_WIDTH*2 ]};
assign res_data_28 = {1'b0, cmb_data_i[`PIXEL_WIDTH*4 -1:`PIXEL_WIDTH*3 ]} - {1'b0, pre_rdata[`PIXEL_WIDTH*4 -1:`PIXEL_WIDTH*3 ]};
assign res_data_27 = {1'b0, cmb_data_i[`PIXEL_WIDTH*5 -1:`PIXEL_WIDTH*4 ]} - {1'b0, pre_rdata[`PIXEL_WIDTH*5 -1:`PIXEL_WIDTH*4 ]};
assign res_data_26 = {1'b0, cmb_data_i[`PIXEL_WIDTH*6 -1:`PIXEL_WIDTH*5 ]} - {1'b0, pre_rdata[`PIXEL_WIDTH*6 -1:`PIXEL_WIDTH*5 ]};
assign res_data_25 = {1'b0, cmb_data_i[`PIXEL_WIDTH*7 -1:`PIXEL_WIDTH*6 ]} - {1'b0, pre_rdata[`PIXEL_WIDTH*7 -1:`PIXEL_WIDTH*6 ]};
assign res_data_24 = {1'b0, cmb_data_i[`PIXEL_WIDTH*8 -1:`PIXEL_WIDTH*7 ]} - {1'b0, pre_rdata[`PIXEL_WIDTH*8 -1:`PIXEL_WIDTH*7 ]};
assign res_data_23 = {1'b0, cmb_data_i[`PIXEL_WIDTH*9 -1:`PIXEL_WIDTH*8 ]} - {1'b0, pre_rdata[`PIXEL_WIDTH*9 -1:`PIXEL_WIDTH*8 ]};
assign res_data_22 = {1'b0, cmb_data_i[`PIXEL_WIDTH*10-1:`PIXEL_WIDTH*9 ]} - {1'b0, pre_rdata[`PIXEL_WIDTH*10-1:`PIXEL_WIDTH*9 ]};
assign res_data_21 = {1'b0, cmb_data_i[`PIXEL_WIDTH*11-1:`PIXEL_WIDTH*10]} - {1'b0, pre_rdata[`PIXEL_WIDTH*11-1:`PIXEL_WIDTH*10]};
assign res_data_20 = {1'b0, cmb_data_i[`PIXEL_WIDTH*12-1:`PIXEL_WIDTH*11]} - {1'b0, pre_rdata[`PIXEL_WIDTH*12-1:`PIXEL_WIDTH*11]};
assign res_data_19 = {1'b0, cmb_data_i[`PIXEL_WIDTH*13-1:`PIXEL_WIDTH*12]} - {1'b0, pre_rdata[`PIXEL_WIDTH*13-1:`PIXEL_WIDTH*12]};
assign res_data_18 = {1'b0, cmb_data_i[`PIXEL_WIDTH*14-1:`PIXEL_WIDTH*13]} - {1'b0, pre_rdata[`PIXEL_WIDTH*14-1:`PIXEL_WIDTH*13]};
assign res_data_17 = {1'b0, cmb_data_i[`PIXEL_WIDTH*15-1:`PIXEL_WIDTH*14]} - {1'b0, pre_rdata[`PIXEL_WIDTH*15-1:`PIXEL_WIDTH*14]};
assign res_data_16 = {1'b0, cmb_data_i[`PIXEL_WIDTH*16-1:`PIXEL_WIDTH*15]} - {1'b0, pre_rdata[`PIXEL_WIDTH*16-1:`PIXEL_WIDTH*15]};
assign res_data_15 = {1'b0, cmb_data_i[`PIXEL_WIDTH*17-1:`PIXEL_WIDTH*16]} - {1'b0, pre_rdata[`PIXEL_WIDTH*17-1:`PIXEL_WIDTH*16]};
assign res_data_14 = {1'b0, cmb_data_i[`PIXEL_WIDTH*18-1:`PIXEL_WIDTH*17]} - {1'b0, pre_rdata[`PIXEL_WIDTH*18-1:`PIXEL_WIDTH*17]};
assign res_data_13 = {1'b0, cmb_data_i[`PIXEL_WIDTH*19-1:`PIXEL_WIDTH*18]} - {1'b0, pre_rdata[`PIXEL_WIDTH*19-1:`PIXEL_WIDTH*18]};
assign res_data_12 = {1'b0, cmb_data_i[`PIXEL_WIDTH*20-1:`PIXEL_WIDTH*19]} - {1'b0, pre_rdata[`PIXEL_WIDTH*20-1:`PIXEL_WIDTH*19]};
assign res_data_11 = {1'b0, cmb_data_i[`PIXEL_WIDTH*21-1:`PIXEL_WIDTH*20]} - {1'b0, pre_rdata[`PIXEL_WIDTH*21-1:`PIXEL_WIDTH*20]};
assign res_data_10 = {1'b0, cmb_data_i[`PIXEL_WIDTH*22-1:`PIXEL_WIDTH*21]} - {1'b0, pre_rdata[`PIXEL_WIDTH*22-1:`PIXEL_WIDTH*21]};
assign res_data_9  = {1'b0, cmb_data_i[`PIXEL_WIDTH*23-1:`PIXEL_WIDTH*22]} - {1'b0, pre_rdata[`PIXEL_WIDTH*23-1:`PIXEL_WIDTH*22]};
assign res_data_8  = {1'b0, cmb_data_i[`PIXEL_WIDTH*24-1:`PIXEL_WIDTH*23]} - {1'b0, pre_rdata[`PIXEL_WIDTH*24-1:`PIXEL_WIDTH*23]};
assign res_data_7  = {1'b0, cmb_data_i[`PIXEL_WIDTH*25-1:`PIXEL_WIDTH*24]} - {1'b0, pre_rdata[`PIXEL_WIDTH*25-1:`PIXEL_WIDTH*24]};
assign res_data_6  = {1'b0, cmb_data_i[`PIXEL_WIDTH*26-1:`PIXEL_WIDTH*25]} - {1'b0, pre_rdata[`PIXEL_WIDTH*26-1:`PIXEL_WIDTH*25]};
assign res_data_5  = {1'b0, cmb_data_i[`PIXEL_WIDTH*27-1:`PIXEL_WIDTH*26]} - {1'b0, pre_rdata[`PIXEL_WIDTH*27-1:`PIXEL_WIDTH*26]};
assign res_data_4  = {1'b0, cmb_data_i[`PIXEL_WIDTH*28-1:`PIXEL_WIDTH*27]} - {1'b0, pre_rdata[`PIXEL_WIDTH*28-1:`PIXEL_WIDTH*27]};
assign res_data_3  = {1'b0, cmb_data_i[`PIXEL_WIDTH*29-1:`PIXEL_WIDTH*28]} - {1'b0, pre_rdata[`PIXEL_WIDTH*29-1:`PIXEL_WIDTH*28]};
assign res_data_2  = {1'b0, cmb_data_i[`PIXEL_WIDTH*30-1:`PIXEL_WIDTH*29]} - {1'b0, pre_rdata[`PIXEL_WIDTH*30-1:`PIXEL_WIDTH*29]};
assign res_data_1  = {1'b0, cmb_data_i[`PIXEL_WIDTH*31-1:`PIXEL_WIDTH*30]} - {1'b0, pre_rdata[`PIXEL_WIDTH*31-1:`PIXEL_WIDTH*30]};
assign res_data_0  = {1'b0, cmb_data_i[`PIXEL_WIDTH*32-1:`PIXEL_WIDTH*31]} - {1'b0, pre_rdata[`PIXEL_WIDTH*32-1:`PIXEL_WIDTH*31]};

assign tq_res_data_o = {res_data_31, res_data_30, res_data_29, res_data_28, res_data_27, res_data_26, res_data_25, res_data_24,
                        res_data_23, res_data_22, res_data_21, res_data_20, res_data_19, res_data_18, res_data_17, res_data_16,
                        res_data_15, res_data_14, res_data_13, res_data_12, res_data_11, res_data_10, res_data_9 , res_data_8 ,
                        res_data_7 , res_data_6 , res_data_5 , res_data_4 , res_data_3 , res_data_2 , res_data_1 , res_data_0 };

// --------------------------------------------
//		TQ REC IF
//---------------------------------------------
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		tq_rec_wen	<= 'b0;
		tq_rec_widx <= 'b0;
		tq_rec_data	<= 'b0;
	end
	else begin
		tq_rec_wen	<= tq_rec_val_i;
		tq_rec_widx <= tq_rec_idx_i;
		tq_rec_data	<= tq_rec_data_i;
	end
end

assign {tq_rec_data_31, tq_rec_data_30, tq_rec_data_29, tq_rec_data_28, tq_rec_data_27, tq_rec_data_26, tq_rec_data_25, tq_rec_data_24,
        tq_rec_data_23, tq_rec_data_22, tq_rec_data_21, tq_rec_data_20, tq_rec_data_19, tq_rec_data_18, tq_rec_data_17, tq_rec_data_16,
        tq_rec_data_15, tq_rec_data_14, tq_rec_data_13, tq_rec_data_12, tq_rec_data_11, tq_rec_data_10, tq_rec_data_9 , tq_rec_data_8 ,
        tq_rec_data_7 , tq_rec_data_6 , tq_rec_data_5 , tq_rec_data_4 , tq_rec_data_3 , tq_rec_data_2 , tq_rec_data_1 , tq_rec_data_0 } = tq_rec_data;

assign rec_data_31 = tq_rec_data_31 + {1'b0, pre_rdata[`PIXEL_WIDTH*1 -1:`PIXEL_WIDTH*0 ]};
assign rec_data_30 = tq_rec_data_30 + {1'b0, pre_rdata[`PIXEL_WIDTH*2 -1:`PIXEL_WIDTH*1 ]};
assign rec_data_29 = tq_rec_data_29 + {1'b0, pre_rdata[`PIXEL_WIDTH*3 -1:`PIXEL_WIDTH*2 ]};
assign rec_data_28 = tq_rec_data_28 + {1'b0, pre_rdata[`PIXEL_WIDTH*4 -1:`PIXEL_WIDTH*3 ]};
assign rec_data_27 = tq_rec_data_27 + {1'b0, pre_rdata[`PIXEL_WIDTH*5 -1:`PIXEL_WIDTH*4 ]};
assign rec_data_26 = tq_rec_data_26 + {1'b0, pre_rdata[`PIXEL_WIDTH*6 -1:`PIXEL_WIDTH*5 ]};
assign rec_data_25 = tq_rec_data_25 + {1'b0, pre_rdata[`PIXEL_WIDTH*7 -1:`PIXEL_WIDTH*6 ]};
assign rec_data_24 = tq_rec_data_24 + {1'b0, pre_rdata[`PIXEL_WIDTH*8 -1:`PIXEL_WIDTH*7 ]};
assign rec_data_23 = tq_rec_data_23 + {1'b0, pre_rdata[`PIXEL_WIDTH*9 -1:`PIXEL_WIDTH*8 ]};
assign rec_data_22 = tq_rec_data_22 + {1'b0, pre_rdata[`PIXEL_WIDTH*10-1:`PIXEL_WIDTH*9 ]};
assign rec_data_21 = tq_rec_data_21 + {1'b0, pre_rdata[`PIXEL_WIDTH*11-1:`PIXEL_WIDTH*10]};
assign rec_data_20 = tq_rec_data_20 + {1'b0, pre_rdata[`PIXEL_WIDTH*12-1:`PIXEL_WIDTH*11]};
assign rec_data_19 = tq_rec_data_19 + {1'b0, pre_rdata[`PIXEL_WIDTH*13-1:`PIXEL_WIDTH*12]};
assign rec_data_18 = tq_rec_data_18 + {1'b0, pre_rdata[`PIXEL_WIDTH*14-1:`PIXEL_WIDTH*13]};
assign rec_data_17 = tq_rec_data_17 + {1'b0, pre_rdata[`PIXEL_WIDTH*15-1:`PIXEL_WIDTH*14]};
assign rec_data_16 = tq_rec_data_16 + {1'b0, pre_rdata[`PIXEL_WIDTH*16-1:`PIXEL_WIDTH*15]};
assign rec_data_15 = tq_rec_data_15 + {1'b0, pre_rdata[`PIXEL_WIDTH*17-1:`PIXEL_WIDTH*16]};
assign rec_data_14 = tq_rec_data_14 + {1'b0, pre_rdata[`PIXEL_WIDTH*18-1:`PIXEL_WIDTH*17]};
assign rec_data_13 = tq_rec_data_13 + {1'b0, pre_rdata[`PIXEL_WIDTH*19-1:`PIXEL_WIDTH*18]};
assign rec_data_12 = tq_rec_data_12 + {1'b0, pre_rdata[`PIXEL_WIDTH*20-1:`PIXEL_WIDTH*19]};
assign rec_data_11 = tq_rec_data_11 + {1'b0, pre_rdata[`PIXEL_WIDTH*21-1:`PIXEL_WIDTH*20]};
assign rec_data_10 = tq_rec_data_10 + {1'b0, pre_rdata[`PIXEL_WIDTH*22-1:`PIXEL_WIDTH*21]};
assign rec_data_9  = tq_rec_data_9  + {1'b0, pre_rdata[`PIXEL_WIDTH*23-1:`PIXEL_WIDTH*22]};
assign rec_data_8  = tq_rec_data_8  + {1'b0, pre_rdata[`PIXEL_WIDTH*24-1:`PIXEL_WIDTH*23]};
assign rec_data_7  = tq_rec_data_7  + {1'b0, pre_rdata[`PIXEL_WIDTH*25-1:`PIXEL_WIDTH*24]};
assign rec_data_6  = tq_rec_data_6  + {1'b0, pre_rdata[`PIXEL_WIDTH*26-1:`PIXEL_WIDTH*25]};
assign rec_data_5  = tq_rec_data_5  + {1'b0, pre_rdata[`PIXEL_WIDTH*27-1:`PIXEL_WIDTH*26]};
assign rec_data_4  = tq_rec_data_4  + {1'b0, pre_rdata[`PIXEL_WIDTH*28-1:`PIXEL_WIDTH*27]};
assign rec_data_3  = tq_rec_data_3  + {1'b0, pre_rdata[`PIXEL_WIDTH*29-1:`PIXEL_WIDTH*28]};
assign rec_data_2  = tq_rec_data_2  + {1'b0, pre_rdata[`PIXEL_WIDTH*30-1:`PIXEL_WIDTH*29]};
assign rec_data_1  = tq_rec_data_1  + {1'b0, pre_rdata[`PIXEL_WIDTH*31-1:`PIXEL_WIDTH*30]};
assign rec_data_0  = tq_rec_data_0  + {1'b0, pre_rdata[`PIXEL_WIDTH*32-1:`PIXEL_WIDTH*31]};

assign rec_data = (tq_pre_size==2'b00)?
				   {rec_data_0[7:0] , rec_data_1[7:0] , rec_data_2[7:0] , rec_data_3[7:0],
				    rec_data_8[7:0] , rec_data_9[7:0] , rec_data_10[7:0], rec_data_11[7:0],
				    rec_data_16[7:0], rec_data_17[7:0], rec_data_18[7:0], rec_data_19[7:0],
				    rec_data_24[7:0], rec_data_25[7:0], rec_data_26[7:0], rec_data_27[7:0],
				    128'b0} :
				   {rec_data_0[7:0] , rec_data_1[7:0] , rec_data_2[7:0] , rec_data_3[7:0] , rec_data_4[7:0] , rec_data_5[7:0] , rec_data_6[7:0] , rec_data_7[7:0] ,
					rec_data_8[7:0] , rec_data_9[7:0] , rec_data_10[7:0], rec_data_11[7:0], rec_data_12[7:0], rec_data_13[7:0], rec_data_14[7:0], rec_data_15[7:0],
					rec_data_16[7:0], rec_data_17[7:0], rec_data_18[7:0], rec_data_19[7:0], rec_data_20[7:0], rec_data_21[7:0], rec_data_22[7:0], rec_data_23[7:0],
					rec_data_24[7:0], rec_data_25[7:0], rec_data_26[7:0], rec_data_27[7:0], rec_data_28[7:0], rec_data_29[7:0], rec_data_30[7:0], rec_data_31[7:0]};

//---------------------------------------------
//    Intra MODE Decision
//---------------------------------------------

/*  // fake one
  parameter INPUT_MD_DECISION = "./tv/intra_md.dat" ;

  integer   fp_md_decision ;
  integer   tp_md_decision ;

  reg       rec_cov_r      ;

  initial begin
    fp_md_decision = $fopen( INPUT_MD_DECISION ,"r" );
  end

  always @(posedge clk) begin
    if( tb_top.u_top.u_intra_top.pre_sel_o==2'b00 ) begin
      if( u_top.u_tq_top.rec_val_o )
        tp_md_decision = $fscanf( fp_md_decision ,"%h" ,rec_cov_r );
      else begin
        rec_cov_r <= 'd0 ;
      end
    end
    else begin
      rec_cov_r <= 'd1 ;
    end
  end

  always @(posedge clk) begin
    if( rec_val_o ) begin
      if( rec_cov_r )
        cover_value_o <= 'd1 ;
      else begin
        cover_value_o <= 'd0 ;
      end
    end
  end

  reg rec_val_r ;

  always @(posedge clk) begin
    if( !rst_n )
      rec_val_r <= 'd0 ;
    else begin
      rec_val_r <= rec_val_o ;
    end
  end

  assign cover_valid_o = rec_val_r && (!rec_val_o) ;
*/

  rdcost_decision rdcost_decision0(
    .clk               ( clk             ),
    .rst_n             ( rst_n           ),
    .pre_min_size_i    ( ipre_min_size_i ),
    .pre_qp_i          ( ipre_qp_i       ),
    .pre_sel_i         ( tq_pre_sel      ),
    .pre_size_i        ( tq_pre_size     ),
    .pre_position_i    ( { tq_tl_4x4_y[3] ,tq_tl_4x4_x[3] ,
                           tq_tl_4x4_y[2] ,tq_tl_4x4_x[2] ,
                           tq_tl_4x4_y[1] ,tq_tl_4x4_x[1] ,
                           tq_tl_4x4_y[0] ,tq_tl_4x4_x[0] }
                                         ),
    .coe_val_i         ( tq_cef_en_i&tq_cef_rw_i
                                         ),
    .coe_data_i        ( tq_cef_data_i_w ),
    .rec_val_i         ( tq_rec_wen      ),
    .rec_data_i        ( rec_data        ),
    .ori_data_i        ( cmb_data_i      ),
    .cover_valid_o     ( cover_valid_o   ),
    .cover_value_o     ( cover_value_o   )
    );

//--------------------------------------------------------------------
//    TLB (Translation Lookaside Like Buffere) for Coeff. MEM
//--------------------------------------------------------------------

  coe_tlb u_coe_tlb(
    // global
    .clk             ( clk              ),
    .rst_n           ( rst_n            ),
    // rec
    .cover_valid_i   ( cover_valid_o    ),
    .cover_value_i   ( cover_value_o    ),
    // pre
    .pre_start_i     ( pre_start_i      ),
    .pre_type_i      ( pre_type_i       ),
    .pre_sel_i       ( tq_pre_sel       ),
    .pre_tl_4x4_x_i  ( tq_tl_4x4_y      ),
    .pre_tl_4x4_y_i  ( tq_tl_4x4_x      ),
    .pre_size_i      ( tq_pre_size      ),
    .pre_idx_i       ( tq_cef_idx_i     ),
    .pre_bank_0_o    ( pre_bank_0_w     ),
    .pre_bank_1_o    ( pre_bank_1_w     ),
    .pre_bank_2_o    ( pre_bank_2_w     ),
    .pre_bank_3_o    ( pre_bank_3_w     ),
    .pre_cbank_o     ( pre_cbank_w      ),
    // ec
    .ec_sel_i        ( ec_sel_i         ),
    .ec_addr_i       ( ec_mem_raddr_i   ),
    .ec_bank_o       ( ec_bank_w        ),
    .ec_cbank_o      ( ec_cbank_w       )
    );

  rec_tlb u_rec_tlb(
    // global
    .clk             ( clk              ),
    .rst_n           ( rst_n            ),
    // rec
    .cover_valid_i   ( cover_valid_o    ),
    .cover_value_i   ( cover_value_o    ),
    // pre
    .pre_start_i     ( pre_start_i      ),
    .pre_type_i      ( pre_type_i       ),
    .pre_bank_0_o    ( rec_bank_0_w     ),
    .pre_bank_1_o    ( rec_bank_1_w     ),
    .pre_bank_2_o    ( rec_bank_2_w     ),
    .pre_bank_3_o    ( rec_bank_3_w     ),
    .pre_cbank_o     ( rec_cbank_w      ),
    .pre_size_i      ( tq_pre_size      ),
    .pre_sel_i       ( tq_pre_sel       ),
    .pre_tl_4x4_x_i  ( tq_tl_4x4_x      ),
    .pre_tl_4x4_y_i  ( tq_tl_4x4_y      ),
    .pre_idx_i       ( tq_rec_widx      ),
    // ec
    .ec_addr_i       ( db_mem_raddr_i   ),
    .ec_bank_o       ( db_bank_w        ),
    .ec_cbank_o      ( db_cbank_w       )
    );

// --------------------------------------------
//		Cur MB IF
//---------------------------------------------
assign cmb_ren_o    = tq_pre_ren | tq_rec_val_i ;
assign cmb_sel_o    = tq_pre_sel[1] ;
assign cmb_size_o   = tq_pre_size   ;
assign cmb_4x4_x_o  = tq_pre_ren ? ( tq_pre_sel[1] ? {tq_pre_4x4_y[2],tq_pre_sel[0],tq_pre_4x4_x[1:0]} : tq_pre_4x4_x )
                                 : tq_tl_4x4_x ;
assign cmb_4x4_y_o  = tq_pre_ren ? ( tq_pre_sel[1] ? {1'b0,tq_pre_4x4_x[2],tq_pre_4x4_y[1:0]}: tq_pre_4x4_y )
                                 : tq_tl_4x4_y ;
assign cmb_idx_o    = tq_pre_ren ? tq_pre_idx
                                 : tq_rec_idx_i ;


// --------------------------------------------
//		Intra IF
//---------------------------------------------
//assign rec_cov_o  = rec_cov_r   ;
assign rec_val_o  = tq_rec_wen  ;
assign rec_idx_o  = tq_rec_widx ;
assign rec_data_o = rec_data    ;

//---------------------------------------------
//		EC IF
//---------------------------------------------


//*** CBF ******************************

  // ec_cbf_luma_o
  always @(posedge clk or negedge rst_n ) begin
    if( !rst_n )
      ec_cbf_luma_o <= 'd0 ;
    else if( pre_start_i ) begin
      ec_cbf_luma_o <= (pre_type_i==INTER) ? ec_cbf_luma_nxt_r : ec_cbf_luma_cur_r ;
    end
  end

  // ec_cbf_luma_cur_r
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
      ec_cbf_luma_cur_r <= 'd0 ;
    else if( cover_valid_o && cover_value_o && (tq_pre_sel=='b00) ) begin
      ec_cbf_luma_cur_r <= ec_cbf_luma_nxt_r ;
    end
  end

  // ec_cbf_cb_o
  always @(posedge clk or negedge rst_n ) begin
    if( !rst_n )
      ec_cbf_cb_o <= 'd0 ;
    else if( pre_start_i ) begin
      ec_cbf_cb_o <= ec_cbf_cb_nxt_r ;
    end
  end

  // ec_cbf_cr_o
  always @(posedge clk or negedge rst_n ) begin
    if( !rst_n )
      ec_cbf_cr_o <= 'd0 ;
    else if( pre_start_i ) begin
      ec_cbf_cr_o <= ec_cbf_cr_nxt_r ;
    end
  end

  // ec_cbf_nxt_r
  always @(posedge clk or negedge rst_n ) begin
    if( !rst_n ) begin
      ec_cbf_luma_nxt_r <= 'd0 ;
      ec_cbf_cb_nxt_r   <= 'd0 ;
      ec_cbf_cr_nxt_r   <= 'd0 ;
    end
    else if( ec_cbf_done_r ) begin
      if( ec_cbf_zero_r )
        case( tq_pre_sel )
          2'b00   : ec_cbf_luma_nxt_r <= ec_cbf_0_mask_w & ( (pre_type_i==INTER) ? ec_cbf_luma_nxt_r 
                                                                                 : ec_cbf_luma_cur_r
                                                           );
          2'b10   : ec_cbf_cb_nxt_r   <= ec_cbf_0_mask_w & ec_cbf_cb_nxt_r   ;
          2'b11   : ec_cbf_cr_nxt_r   <= ec_cbf_0_mask_w & ec_cbf_cr_nxt_r   ;
        endcase
      else begin
        case( tq_pre_sel )
          2'b00   : ec_cbf_luma_nxt_r <= ec_cbf_1_mask_w | ( (pre_type_i==INTER) ? ec_cbf_luma_nxt_r 
                                                                                 : ec_cbf_luma_cur_r
                                                           );
          2'b10   : ec_cbf_cb_nxt_r   <= ec_cbf_1_mask_w | ec_cbf_cb_nxt_r   ;
          2'b11   : ec_cbf_cr_nxt_r   <= ec_cbf_1_mask_w | ec_cbf_cr_nxt_r   ;
        endcase
      end
    end
  end

  // ec_cbf_done_r
  always @(posedge clk or negedge rst_n ) begin
    if( !rst_n )
	   ec_cbf_done_r <= 'd0 ;
    else if( tq_cef_en_i&&tq_cef_rw_i )
      case( tq_pre_size )
        2'b00   : ec_cbf_done_r <= ( tq_cef_idx_i=='h00 );
        2'b01   : ec_cbf_done_r <= ( tq_cef_idx_i=='h04 );
        2'b10   : ec_cbf_done_r <= ( tq_cef_idx_i=='h0e );
        2'b11   : ec_cbf_done_r <= ( tq_cef_idx_i=='h1f );
        default : ec_cbf_done_r <= 'd0 ;
      endcase
    else begin
      ec_cbf_done_r <= 'd0 ;
    end
  end

  // ec_cbf_zero_r
  always @(posedge clk or negedge rst_n ) begin
    if( !rst_n )
      ec_cbf_zero_r <= 'd1 ;
    else if( ec_cbf_done_r )
      ec_cbf_zero_r <= 'd1 ;
    else if( tq_cef_data_i_w!='d0 ) begin
      ec_cbf_zero_r <= 'd0 ;
    end
  end

  // ec_cbf_mask_w
  assign ec_cbf_1_mask_w = ( tq_pre_sel==2'b00 ) ? ( ec_cbf_cur_w<<ec_cbf_addr_w) : ( ec_cbf_cur_w<<(ec_cbf_addr_w<<2)) ;
  assign ec_cbf_0_mask_w = ~ec_cbf_1_mask_w ;

  // ec_cbf_cur_w
  always @(*) begin
    if( tq_pre_sel==2'b00 )
      case( tq_pre_size )
        2'b00   : ec_cbf_cur_w = 64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0001 ;
        2'b01   : ec_cbf_cur_w = 64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_1111 ;
        2'b10   : ec_cbf_cur_w = 64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_1111_1111_1111_1111 ;
        2'b11   : ec_cbf_cur_w = 64'b1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111 ;
        default : ec_cbf_cur_w = 64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000 ;
      endcase
    else begin
      case( tq_pre_size )
        2'b00   : ec_cbf_cur_w = 64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_1111 ;
        2'b01   : ec_cbf_cur_w = 64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_1111_1111_1111_1111 ;
        2'b10   : ec_cbf_cur_w = 64'b1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111 ;
        default : ec_cbf_cur_w = 64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000 ;
      endcase
    end
  end

  // ec_cbf_addr_w
  assign ec_cbf_addr_w = { tq_tl_4x4_y[3] ,tq_tl_4x4_x[3] ,
                           tq_tl_4x4_y[2] ,tq_tl_4x4_x[2] ,
                           tq_tl_4x4_y[1] ,tq_tl_4x4_x[1] ,
                           tq_tl_4x4_y[0] ,tq_tl_4x4_x[0] };

//*** PARTITION ************************

  // partition_old_o
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
      partition_old_o <= 'd0 ;
    else if( pre_start_i ) begin
      partition_old_o <= partition_cur_o ;
    end
  end

  // partition_cur_o
  assign partition_cur_o = { partition_16, partition_32 ,partition_64 };

  // partition_64
  assign partition_64 = 'd1 ;

  // partition_32&16
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n ) begin
      partition_32 <= 'd0 ;
      partition_16 <= 'd0 ;
    end
    else if( pre_start_i ) begin
      partition_32 <= -1'b1 ;
      partition_16 <= -1'b1 ;
    end
    else if( cover_valid_o && cover_value_o && (tq_pre_sel=='b00) ) begin
      case( tq_pre_size )
        //2'b00   : partition_32 <= partition_32 & ( 1'b1 << (partition_addr_w>>tq_pre_size) );
        //2'b01   : partition_32 <= partition_32 & ( 1'b1 << (partition_addr_w>>tq_pre_size) );
        2'b10   : partition_16 <= partition_16 & partition_0_mask_w ;
        2'b11   : partition_32 <= partition_32 & partition_0_mask_w ;
      endcase
    end
  end

  // partition_mask_w
  assign partition_1_mask_w = 1'b1 << ( partition_addr_w >> ({1'b0,tq_pre_size}<<1) );
  assign partition_0_mask_w = ~partition_1_mask_w ;

  // partition_addr_w
  assign partition_addr_w = { tq_tl_4x4_y[3] ,tq_tl_4x4_x[3] ,   // same as ec_cbf_addr_w
                              tq_tl_4x4_y[2] ,tq_tl_4x4_x[2] ,
                              tq_tl_4x4_y[1] ,tq_tl_4x4_x[1] ,
                              tq_tl_4x4_y[0] ,tq_tl_4x4_x[0] };

//*** MODE ******************************

  reg               md_sel_r           ;
  wire  [31 : 0]    md_luma_0_w        ;
  wire  [31 : 0]    md_luma_1_w        ;
  wire  [31 : 0]    md_cuma_0_w        ;
  wire  [31 : 0]    md_cuma_1_w        ;
  wire  [7  : 0]    cu_mode_waddr_i    ;
  wire  [3  : 0]    md_wr_luma_0       ;
  wire  [3  : 0]    md_wr_luma_1       ;
  wire  [3  : 0]    md_wr_cuma_0       ;
  wire  [3  : 0]    md_wr_cuma_1       ;

  always @(posedge clk or negedge rst_n ) begin
    if( !rst_n )
      md_sel_r <= 'd0 ;
    else if( pre_start_i ) begin
      md_sel_r <= !md_sel_r ;
    end
  end

//  assign lm_md_rdata_o =  md_sel_r ? {md_luma_0_w[29:24],md_luma_0_w[21:16],md_luma_0_w[13:8],md_luma_0_w[5:0]}
//                                   : {md_luma_1_w[29:24],md_luma_1_w[21:16],md_luma_1_w[13:8],md_luma_1_w[5:0]}
//                                   ;
//  assign cm_md_rdata_o =  md_sel_r ? {md_cuma_0_w[29:24],md_cuma_0_w[21:16],md_cuma_0_w[13:8],md_cuma_0_w[5:0]}
//                                   : {md_cuma_1_w[29:24],md_cuma_1_w[21:16],md_cuma_1_w[13:8],md_cuma_1_w[5:0]}
//                                   ;

  assign lm_md_rdata_o =  md_sel_r ? {md_luma_0_w[5:0],md_luma_0_w[13:8],md_luma_0_w[21:16],md_luma_0_w[29:24]}
                                   : {md_luma_1_w[5:0],md_luma_1_w[13:8],md_luma_1_w[21:16],md_luma_1_w[29:24]}
                                   ;
  assign cm_md_rdata_o =  md_sel_r ? {md_cuma_0_w[5:0],md_cuma_0_w[13:8],md_cuma_0_w[21:16],md_cuma_0_w[29:24]}
                                   : {md_cuma_1_w[5:0],md_cuma_1_w[13:8],md_cuma_1_w[21:16],md_cuma_1_w[29:24]}
                                   ;

  assign md_wr_luma_0 = {4{cover_valid_o && cover_value_o && (tq_pre_sel=='b00)}} &
                        ( md_sel_r ? 4'b0000
                                   : ( (tq_pre_size!=2'b00) ? 4'b1111
                                                            : (4'b0001<<cu_mode_waddr_i[1:0])
                                     )
                        );
  assign md_wr_luma_1 = {4{cover_valid_o && cover_value_o && (tq_pre_sel=='b00)}} &
                        ( (!md_sel_r) ? 4'b0000
                                      : ( (tq_pre_size!=2'b00) ? 4'b1111
                                                               : (4'b0001<<cu_mode_waddr_i[1:0])
                                        )
                        );
  assign md_wr_cuma_0 = ( md_sel_r ? 4'b0 : ( cover_valid_o && cover_value_o && (tq_pre_sel!='b00) ) ) << { cu_mode_waddr_i[1:0] };
  assign md_wr_cuma_1 = ( md_sel_r ? ( cover_valid_o && cover_value_o && (tq_pre_sel!='b00) ) : 1'b0 ) << { cu_mode_waddr_i[1:0] };

  assign cu_mode_waddr_i = (tq_pre_sel=='b00) ? { tq_tl_4x4_y[3] ,tq_tl_4x4_x[3] ,   // same as ec_cbf_addr_w
                                                  tq_tl_4x4_y[2] ,tq_tl_4x4_x[2] ,
                                                  tq_tl_4x4_y[1] ,tq_tl_4x4_x[1] ,
                                                  tq_tl_4x4_y[0] ,tq_tl_4x4_x[0] }
                                              : { tq_tl_4x4_y[3] ,tq_tl_4x4_x[3] ,
                                                  tq_tl_4x4_y[2] ,tq_tl_4x4_x[2] ,
                                                  tq_tl_4x4_y[1] ,tq_tl_4x4_x[1] }
                                              ;

  // luma mode ram
  rf_2p_be #(
    .Word_Width ( 32                      ),
    .Addr_Width ( 6                       )
  ) md_ram_l_0 (
    .clkb       ( clk                     ),
    .cenb_i     ( 1'b0                    ),
    .wenb_i     ( ~md_wr_luma_0           ),
    .addrb_i    ( cu_mode_waddr_i[7:2]    ),
    .datab_i    ( {4{2'b0,ipre_mode_i}}   ),
    .clka       ( clk                     ),
    .cena_i     ( lm_md_renab_i           ),
    .addra_i    ( lm_md_raddr_i           ),
    .dataa_o    ( md_luma_0_w             )
    );

  rf_2p_be #(
    .Word_Width ( 32                      ),
    .Addr_Width ( 6                       )
  ) md_ram_l_1 (
    .clkb       ( clk                     ),
    .cenb_i     ( 1'b0                    ),
    .wenb_i     ( ~md_wr_luma_1           ),
    .addrb_i    ( cu_mode_waddr_i[7:2]    ),
    .datab_i    ( {4{2'b0,ipre_mode_i}}   ),
    .clka       ( clk                     ),
    .cena_i     ( lm_md_renab_i           ),
    .addra_i    ( lm_md_raddr_i           ),
    .dataa_o    ( md_luma_1_w             )
    );

  // chroma mode ram
  rf_2p_be #(
    .Word_Width ( 32                      ),
    .Addr_Width ( 4                       )
  ) md_ram_c_0 (
    .clkb       ( clk                     ),
    .cenb_i     ( 1'b0                    ),
    .wenb_i     ( ~md_wr_cuma_0           ),
    .addrb_i    ( cu_mode_waddr_i[5:2]    ),
    .datab_i    ( {4{2'b0,ipre_mode_i}}   ),
    .clka       ( clk                     ),
    .cena_i     ( cm_md_renab_i           ),
    .addra_i    ( cm_md_raddr_i           ),
    .dataa_o    ( md_cuma_0_w             )
    );

  rf_2p_be #(
    .Word_Width ( 32                      ),
    .Addr_Width ( 4                       )
  ) md_ram_c_1 (
    .clkb       ( clk                     ),
    .cenb_i     ( 1'b0                    ),
    .wenb_i     ( ~md_wr_cuma_1           ),
    .addrb_i    ( cu_mode_waddr_i[5:2]    ),
    .datab_i    ( {4{2'b0,ipre_mode_i}}   ),
    .clka       ( clk                     ),
    .cena_i     ( cm_md_renab_i           ),
    .addra_i    ( cm_md_raddr_i           ),
    .dataa_o    ( md_cuma_1_w             )
    );

endmodule
