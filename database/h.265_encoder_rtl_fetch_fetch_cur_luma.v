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
//  Filename      : fetch_cur_luma.v
//  Author        : Yufeng Bai
//  Email 	  : byfchina@gmail.com
//
//-------------------------------------------------------------------
//
//  Modified      : 2015-09-02 by HLL
//  Description   : rotate by sys_start_i
//  Modified      : 2015-09-05 by HLL
//  Description   : intra supported
//  Modified      : 2015-09-07 by HLL
//  Description   : pre_intra supported
//
//-------------------------------------------------------------------

`include "enc_defines.v"

module fetch_cur_luma (
	clk		        ,
	rstn		        ,
  sysif_start_i    ,
  sysif_type_i     ,
  pre_i_4x4_x_i      ,
  pre_i_4x4_y_i      ,
  pre_i_4x4_idx_i    ,
  pre_i_sel_i        ,
  pre_i_size_i       ,
  pre_i_rden_i       ,
  pre_i_pel_o        ,
	fime_cur_4x4_x_i	,
	fime_cur_4x4_y_i	,
	fime_cur_4x4_idx_i	,
	fime_cur_sel_i		,
	fime_cur_size_i		,
	fime_cur_rden_i		,
	fime_cur_pel_o		,
	fme_cur_4x4_x_i		,
	fme_cur_4x4_y_i		,
	fme_cur_4x4_idx_i	,
	fme_cur_sel_i		,
	fme_cur_size_i		,
	fme_cur_rden_i		,
	fme_cur_pel_o		,
	mc_cur_4x4_x_i		,
	mc_cur_4x4_y_i		,
	mc_cur_4x4_idx_i	,
	mc_cur_sel_i		,
	mc_cur_size_i		,
	mc_cur_rden_i		,
	mc_cur_pel_o		,
	db_cur_4x4_x_i		,
	db_cur_4x4_y_i		,
	db_cur_4x4_idx_i	,
	db_cur_sel_i		,
	db_cur_size_i		,
	db_cur_rden_i		,
	db_cur_pel_o		,
	ext_load_done_i		,
	ext_load_data_i		,
        ext_load_addr_i         ,
	ext_load_valid_i
);


// ********************************************
//
//    PARAMETER DECLARATION
//
// ********************************************

  parameter INTRA = 0 ,
            INTER = 1 ;


// ********************************************
//
//    INPUT / OUTPUT DECLARATION
//
// ********************************************

input 	 [1-1:0] 	        clk 	                 ; // clk signal
input 	 [1-1:0] 	        rstn 	                 ; // asynchronous reset
input                     sysif_start_i          ;
input                     sysif_type_i           ;

input    [4-1               : 0]    pre_i_4x4_x_i   ; // pre_i current lcu x
input    [4-1               : 0]    pre_i_4x4_y_i   ; // pre_i current lcu y
input    [5-1               : 0]    pre_i_4x4_idx_i ; // pre_i current lcu idx
input    [1-1               : 0]    pre_i_sel_i     ; // pre_i current lcu chroma/luma sel
input    [2-1               : 0]    pre_i_size_i    ; // pre_i current lcu size :4x4
input    [1-1               : 0]    pre_i_rden_i    ; // pre_i current lcu read enable
output   [32*`PIXEL_WIDTH-1 : 0]    pre_i_pel_o     ; // pre_i current lcu pixel

input 	 [4-1:0] 	        fime_cur_4x4_x_i 	 ; // fime current lcu x
input 	 [4-1:0] 	        fime_cur_4x4_y_i 	 ; // fime current lcu y
input 	 [5-1:0] 	        fime_cur_4x4_idx_i 	 ; // fime current lcu idx
input 	 [1-1:0] 	        fime_cur_sel_i 	         ; // fime current lcu chroma/luma sel
input 	 [3-1:0] 	        fime_cur_size_i 	 ; // "fime current lcu size :4x4
input 	 [1-1:0] 	        fime_cur_rden_i 	 ; // fime current lcu read enable
output 	 [64*`PIXEL_WIDTH-1:0] 	fime_cur_pel_o 	         ; // fime current lcu pixel

input 	 [4-1:0] 	        fme_cur_4x4_x_i 	 ; // fme current lcu x
input 	 [4-1:0] 	        fme_cur_4x4_y_i 	 ; // fme current lcu y
input 	 [5-1:0] 	        fme_cur_4x4_idx_i 	 ; // fme current lcu idx
input 	 [1-1:0] 	        fme_cur_sel_i 	         ; // fme current lcu chroma/luma sel
input 	 [2-1:0] 	        fme_cur_size_i 	         ; // "fme current lcu size :4x4
input 	 [1-1:0] 	        fme_cur_rden_i 	         ; // fme current lcu read enable
output 	 [32*`PIXEL_WIDTH-1:0] 	fme_cur_pel_o 	         ; // fme current lcu pixel

input 	 [4-1:0] 	        mc_cur_4x4_x_i 	         ; // mc current lcu x
input 	 [4-1:0] 	        mc_cur_4x4_y_i 	         ; // mc current lcu y
input 	 [5-1:0] 	        mc_cur_4x4_idx_i 	 ; // mc current lcu idx
input 	 [1-1:0] 	        mc_cur_sel_i             ; // mc current lcu chroma/luma sel
input 	 [2-1:0] 	        mc_cur_size_i 	         ; // "mc current lcu size :4x4
input 	 [1-1:0] 	        mc_cur_rden_i 	         ; // mc current lcu read enable
output 	 [32*`PIXEL_WIDTH-1:0] 	mc_cur_pel_o 	         ; // mc current lcu pixel

input 	 [4-1:0] 	        db_cur_4x4_x_i 	         ; // db current lcu x
input 	 [4-1:0] 	        db_cur_4x4_y_i 	         ; // db current lcu y
input 	 [5-1:0] 	        db_cur_4x4_idx_i 	 ; // db current lcu idx
input 	 [1-1:0] 	        db_cur_sel_i 	         ; // db current lcu chroma/luma sel
input 	 [2-1:0] 	        db_cur_size_i 	         ; // "db current lcu size :4x4
input 	 [1-1:0] 	        db_cur_rden_i 	         ; // db current lcu read enable
output 	 [32*`PIXEL_WIDTH-1:0] 	db_cur_pel_o 	         ; // db current lcu pixel

input 	 [1-1:0] 	        ext_load_done_i 	 ; // load current lcu done
input 	 [32*`PIXEL_WIDTH-1:0] 	ext_load_data_i 	 ; // load current lcu data
input    [7-1:0]                ext_load_addr_i          ;
input 	 [1-1:0] 	        ext_load_valid_i 	 ; // load current lcu data valid

// ********************************************
//
//    WIRE / REG DECLARATION
//
// ********************************************

reg      [3-1:0]               rotate                   ; // rotatation counter
reg                            duo_rotate               ; // rotatation counter

reg 	 [4-1:0] 	       cur_00_4x4_x 	        ;
reg 	 [4-1:0] 	       cur_00_4x4_y 	        ;
reg 	 [5-1:0] 	       cur_00_idx       	;
reg 	 [1-1:0] 	       cur_00_sel 	        ;
reg 	 [2-1:0] 	       cur_00_size 	        ;
reg 	 [1-1:0] 	       cur_00_ren 	        ;
reg  	 [32*`PIXEL_WIDTH-1:0] cur_00_pel 	        ;

reg 	 [4-1:0] 	       cur_01_4x4_x 	        ;
reg 	 [4-1:0] 	       cur_01_4x4_y 	        ;
reg 	 [5-1:0] 	       cur_01_idx       	;
reg 	 [1-1:0] 	       cur_01_sel 	        ;
reg 	 [2-1:0] 	       cur_01_size 	        ;
reg 	 [1-1:0] 	       cur_01_ren 	        ;
reg  	 [32*`PIXEL_WIDTH-1:0] cur_01_pel 	        ;

reg 	 [4-1:0] 	       cur_02_4x4_x 	        ;
reg 	 [4-1:0] 	       cur_02_4x4_y 	        ;
reg 	 [5-1:0] 	       cur_02_idx       	;
reg 	 [1-1:0] 	       cur_02_sel 	        ;
reg 	 [2-1:0] 	       cur_02_size 	        ;
reg 	 [1-1:0] 	       cur_02_ren 	        ;
reg  	 [32*`PIXEL_WIDTH-1:0] cur_02_pel 	        ;

reg 	 [4-1:0] 	       cur_03_4x4_x 	        ;
reg 	 [4-1:0] 	       cur_03_4x4_y 	        ;
reg 	 [5-1:0] 	       cur_03_idx       	;
reg 	 [1-1:0] 	       cur_03_sel 	        ;
reg 	 [2-1:0] 	       cur_03_size 	        ;
reg 	 [1-1:0] 	       cur_03_ren 	        ;
reg  	 [32*`PIXEL_WIDTH-1:0] cur_03_pel 	        ;

reg 	 [4-1:0] 	       cur_04_4x4_x 	        ;
reg 	 [4-1:0] 	       cur_04_4x4_y 	        ;
reg 	 [5-1:0] 	       cur_04_idx       	;
reg 	 [1-1:0] 	       cur_04_sel 	        ;
reg 	 [2-1:0] 	       cur_04_size 	        ;
reg 	 [1-1:0] 	       cur_04_ren 	        ;
reg  	 [32*`PIXEL_WIDTH-1:0] cur_04_pel 	        ;

reg 	 [4-1:0] 	       cur_duo1_4x4_x 	        ;
reg 	 [4-1:0] 	       cur_duo1_4x4_y 	        ;
reg 	 [5-1:0] 	       cur_duo1_idx       	;
reg 	 [1-1:0] 	       cur_duo1_sel 	        ;
reg 	 [2-1:0] 	       cur_duo1_size 	        ;
reg 	 [1-1:0] 	       cur_duo1_ren 	        ;
reg  	 [32*`PIXEL_WIDTH-1:0] cur_duo1_pel 	        ;

reg 	 [4-1:0] 	       cur_duo2_4x4_x 	        ;
reg 	 [4-1:0] 	       cur_duo2_4x4_y 	        ;
reg 	 [5-1:0] 	       cur_duo2_idx       	;
reg 	 [1-1:0] 	       cur_duo2_sel 	        ;
reg 	 [2-1:0] 	       cur_duo2_size 	        ;
reg 	 [1-1:0] 	       cur_duo2_ren 	        ;
reg  	 [32*`PIXEL_WIDTH-1:0] cur_duo2_pel 	        ;

reg                            cur_00_wen;
reg      [7:0]               cur_00_waddr;
reg      [32*`PIXEL_WIDTH-1:0] cur_00_wdata;
wire     [32*`PIXEL_WIDTH-1:0] cur_00_rdata;

reg                            cur_01_wen;
reg      [7:0]               cur_01_waddr;
reg      [32*`PIXEL_WIDTH-1:0] cur_01_wdata;
wire     [32*`PIXEL_WIDTH-1:0] cur_01_rdata;

reg                            cur_02_wen;
reg      [7:0]               cur_02_waddr;
reg      [32*`PIXEL_WIDTH-1:0] cur_02_wdata;
wire     [32*`PIXEL_WIDTH-1:0] cur_02_rdata;

reg                            cur_03_wen;
reg      [7:0]               cur_03_waddr;
reg      [32*`PIXEL_WIDTH-1:0] cur_03_wdata;
wire     [32*`PIXEL_WIDTH-1:0] cur_03_rdata;

reg                            cur_04_wen;
reg      [7:0]               cur_04_waddr;
reg      [32*`PIXEL_WIDTH-1:0] cur_04_wdata;
wire     [32*`PIXEL_WIDTH-1:0] cur_04_rdata;


//fime
reg      [32*`PIXEL_WIDTH-1:0] fime_cur_pel0, fime_cur_pel1;

reg                            cur_duo1_wen;
reg      [7:0]               cur_duo1_waddr;
reg      [32*`PIXEL_WIDTH-1:0] cur_duo1_wdata;
wire     [32*`PIXEL_WIDTH-1:0] cur_duo1_rdata;

reg                            cur_duo2_wen;
reg      [7:0]               cur_duo2_waddr;
reg      [32*`PIXEL_WIDTH-1:0] cur_duo2_wdata;
wire     [32*`PIXEL_WIDTH-1:0] cur_duo2_rdata;

//output

reg 	 [32*`PIXEL_WIDTH-1:0] 	fme_cur_pel_o 	         ; // fme current lcu pixel
reg 	 [32*`PIXEL_WIDTH-1:0] 	mc_cur_pel_o 	         ; // fme current lcu pixel
reg 	 [32*`PIXEL_WIDTH-1:0] 	db_cur_pel_o 	         ; // fme current lcu pixel
reg 	 [32*`PIXEL_WIDTH-1:0] 	pre_i_pel_o 	         ; // fme current lcu pixel


// ********************************************
//
//    Combinational Logic
//
// ********************************************


// ********************************************
//
//    Sequential Logic
//
// ********************************************


  always @(posedge clk or negedge rstn ) begin
    if( !rstn ) begin
      rotate     <= 0 ;
      duo_rotate <= 0 ;
    end
    else if( sysif_start_i ) begin
      duo_rotate <= ~duo_rotate ;
      if( rotate == 4 )
        rotate <= 0 ;
      else begin
        rotate <= rotate + 1 ;
      end
    end
  end

/*
always @ (posedge clk or negedge rstn) begin
    if(~rstn) begin
        ext_load_addr_i <= 'd0;
    end
    else if(ext_load_valid_i) begin
        ext_load_addr_i <= ext_load_addr_i + 'd1;
    end
end
*/



// cur_00
always @ (*) begin
    case (rotate)
        'd0: begin
            cur_00_wen   = ext_load_valid_i;
            cur_00_waddr = ext_load_addr_i;
            cur_00_wdata = ext_load_data_i;

            cur_00_ren   = 'b0;
            cur_00_sel   = 'b0;
            cur_00_size  = 'b0;
            cur_00_4x4_x = 'b0;
            cur_00_4x4_y = 'b0;
            cur_00_idx   = 'b0;
        end
        'd1: begin
            cur_00_wen   = 'b0;
            cur_00_waddr = 'b0;
            cur_00_wdata = 'b0;

            cur_00_ren   = ( sysif_type_i==INTRA ) ? pre_i_rden_i     : fime_cur_rden_i    ;
            cur_00_sel   = ( sysif_type_i==INTRA ) ? pre_i_sel_i      : fime_cur_sel_i     ;
            cur_00_size  = ( sysif_type_i==INTRA ) ? pre_i_size_i     : fime_cur_size_i    ;
            cur_00_4x4_x = ( sysif_type_i==INTRA ) ? pre_i_4x4_x_i    : fime_cur_4x4_x_i   ;
            cur_00_4x4_y = ( sysif_type_i==INTRA ) ? pre_i_4x4_y_i    : fime_cur_4x4_y_i   ;
            cur_00_idx   = ( sysif_type_i==INTRA ) ? pre_i_4x4_idx_i  : fime_cur_4x4_idx_i ;
        end
        'd2: begin
            cur_00_wen   = 'b0;
            cur_00_waddr = 'b0;
            cur_00_wdata = 'b0;

            cur_00_ren   = ( sysif_type_i==INTRA ) ? mc_cur_rden_i    : fme_cur_rden_i     ;
            cur_00_sel   = ( sysif_type_i==INTRA ) ? mc_cur_sel_i     : fme_cur_sel_i      ;
            cur_00_size  = ( sysif_type_i==INTRA ) ? mc_cur_size_i    : fme_cur_size_i     ;
            cur_00_4x4_x = ( sysif_type_i==INTRA ) ? mc_cur_4x4_x_i   : fme_cur_4x4_x_i    ;
            cur_00_4x4_y = ( sysif_type_i==INTRA ) ? mc_cur_4x4_y_i   : fme_cur_4x4_y_i    ;
            cur_00_idx   = ( sysif_type_i==INTRA ) ? mc_cur_4x4_idx_i : fme_cur_4x4_idx_i  ;
        end
        'd3: begin
            cur_00_wen   = 'b0;
            cur_00_waddr = 'b0;
            cur_00_wdata = 'b0;

            cur_00_ren   = mc_cur_rden_i;
            cur_00_sel   = mc_cur_sel_i ;
            cur_00_size  = mc_cur_size_i;
            cur_00_4x4_x = mc_cur_4x4_x_i;
            cur_00_4x4_y = mc_cur_4x4_y_i;
            cur_00_idx   = mc_cur_4x4_idx_i;
        end
        'd4: begin
            cur_00_wen   = 'b0;
            cur_00_waddr = 'b0;
            cur_00_wdata = 'b0;

            cur_00_ren   = db_cur_rden_i;
            cur_00_sel   = db_cur_sel_i ;
            cur_00_size  = db_cur_size_i;
            cur_00_4x4_x = db_cur_4x4_x_i;
            cur_00_4x4_y = db_cur_4x4_y_i;
            cur_00_idx   = db_cur_4x4_idx_i;
        end
        default: begin
            cur_00_wen   = 'b0;
            cur_00_waddr = 'b0;
            cur_00_wdata = 'b0;

            cur_00_ren   = 'b0;
            cur_00_sel   = 'b0;
            cur_00_size  = 'b0;
            cur_00_4x4_x = 'b0;
            cur_00_4x4_y = 'b0;
            cur_00_idx   = 'b0;
        end
    endcase
end

// cur_01
always @ (*) begin
    case (rotate)
        'd0: begin
            cur_01_wen   = 'b0;
            cur_01_waddr = 'b0;
            cur_01_wdata = 'b0;

            cur_01_ren   = db_cur_rden_i;
            cur_01_sel   = db_cur_sel_i ;
            cur_01_size  = db_cur_size_i;
            cur_01_4x4_x = db_cur_4x4_x_i;
            cur_01_4x4_y = db_cur_4x4_y_i;
            cur_01_idx   = db_cur_4x4_idx_i;
        end
        'd1: begin
            cur_01_wen   = ext_load_valid_i;
            cur_01_waddr = ext_load_addr_i;
            cur_01_wdata = ext_load_data_i;

            cur_01_ren   = 'b0;
            cur_01_sel   = 'b0;
            cur_01_size  = 'b0;
            cur_01_4x4_x = 'b0;
            cur_01_4x4_y = 'b0;
            cur_01_idx   = 'b0;
        end
        'd2: begin
            cur_01_wen   = 'b0;
            cur_01_waddr = 'b0;
            cur_01_wdata = 'b0;

            cur_01_ren   = ( sysif_type_i==INTRA ) ? pre_i_rden_i     : fime_cur_rden_i    ;
            cur_01_sel   = ( sysif_type_i==INTRA ) ? pre_i_sel_i      : fime_cur_sel_i     ;
            cur_01_size  = ( sysif_type_i==INTRA ) ? pre_i_size_i     : fime_cur_size_i    ;
            cur_01_4x4_x = ( sysif_type_i==INTRA ) ? pre_i_4x4_x_i    : fime_cur_4x4_x_i   ;
            cur_01_4x4_y = ( sysif_type_i==INTRA ) ? pre_i_4x4_y_i    : fime_cur_4x4_y_i   ;
            cur_01_idx   = ( sysif_type_i==INTRA ) ? pre_i_4x4_idx_i  : fime_cur_4x4_idx_i ;
        end
        'd3: begin
            cur_01_wen   = 'b0;
            cur_01_waddr = 'b0;
            cur_01_wdata = 'b0;

            cur_01_ren   = ( sysif_type_i==INTRA ) ? mc_cur_rden_i    : fme_cur_rden_i     ;
            cur_01_sel   = ( sysif_type_i==INTRA ) ? mc_cur_sel_i     : fme_cur_sel_i      ;
            cur_01_size  = ( sysif_type_i==INTRA ) ? mc_cur_size_i    : fme_cur_size_i     ;
            cur_01_4x4_x = ( sysif_type_i==INTRA ) ? mc_cur_4x4_x_i   : fme_cur_4x4_x_i    ;
            cur_01_4x4_y = ( sysif_type_i==INTRA ) ? mc_cur_4x4_y_i   : fme_cur_4x4_y_i    ;
            cur_01_idx   = ( sysif_type_i==INTRA ) ? mc_cur_4x4_idx_i : fme_cur_4x4_idx_i  ;
        end
        'd4: begin
            cur_01_wen   = 'b0;
            cur_01_waddr = 'b0;
            cur_01_wdata = 'b0;

            cur_01_ren   = mc_cur_rden_i;
            cur_01_sel   = mc_cur_sel_i ;
            cur_01_size  = mc_cur_size_i;
            cur_01_4x4_x = mc_cur_4x4_x_i;
            cur_01_4x4_y = mc_cur_4x4_y_i;
            cur_01_idx   = mc_cur_4x4_idx_i;
        end
        default: begin
            cur_01_wen   = 'b0;
            cur_01_waddr = 'b0;
            cur_01_wdata = 'b0;

            cur_01_ren   = 'b0;
            cur_01_sel   = 'b0;
            cur_01_size  = 'b0;
            cur_01_4x4_x = 'b0;
            cur_01_4x4_y = 'b0;
            cur_01_idx   = 'b0;
        end
    endcase
end

// cur_02
always @ (*) begin
    case (rotate)
        'd0: begin
            cur_02_wen   = 'b0;
            cur_02_waddr = 'b0;
            cur_02_wdata = 'b0;

            cur_02_ren   = mc_cur_rden_i;
            cur_02_sel   = mc_cur_sel_i ;
            cur_02_size  = mc_cur_size_i;
            cur_02_4x4_x = mc_cur_4x4_x_i;
            cur_02_4x4_y = mc_cur_4x4_y_i;
            cur_02_idx   = mc_cur_4x4_idx_i;
        end
        'd1: begin
            cur_02_wen   = 'b0;
            cur_02_waddr = 'b0;
            cur_02_wdata = 'b0;

            cur_02_ren   = db_cur_rden_i;
            cur_02_sel   = db_cur_sel_i ;
            cur_02_size  = db_cur_size_i;
            cur_02_4x4_x = db_cur_4x4_x_i;
            cur_02_4x4_y = db_cur_4x4_y_i;
            cur_02_idx   = db_cur_4x4_idx_i;
        end
        'd2: begin
            cur_02_wen   = ext_load_valid_i;
            cur_02_waddr = ext_load_addr_i;
            cur_02_wdata = ext_load_data_i;

            cur_02_ren   = 'b0;
            cur_02_sel   = 'b0;
            cur_02_size  = 'b0;
            cur_02_4x4_x = 'b0;
            cur_02_4x4_y = 'b0;
            cur_02_idx   = 'b0;
        end
        'd3: begin
            cur_02_wen   = 'b0;
            cur_02_waddr = 'b0;
            cur_02_wdata = 'b0;

            cur_02_ren   = ( sysif_type_i==INTRA ) ? pre_i_rden_i     : fime_cur_rden_i    ;
            cur_02_sel   = ( sysif_type_i==INTRA ) ? pre_i_sel_i      : fime_cur_sel_i     ;
            cur_02_size  = ( sysif_type_i==INTRA ) ? pre_i_size_i     : fime_cur_size_i    ;
            cur_02_4x4_x = ( sysif_type_i==INTRA ) ? pre_i_4x4_x_i    : fime_cur_4x4_x_i   ;
            cur_02_4x4_y = ( sysif_type_i==INTRA ) ? pre_i_4x4_y_i    : fime_cur_4x4_y_i   ;
            cur_02_idx   = ( sysif_type_i==INTRA ) ? pre_i_4x4_idx_i  : fime_cur_4x4_idx_i ;
        end
        'd4: begin
            cur_02_wen   = 'b0;
            cur_02_waddr = 'b0;
            cur_02_wdata = 'b0;

            cur_02_ren   = ( sysif_type_i==INTRA ) ? mc_cur_rden_i    : fme_cur_rden_i     ;
            cur_02_sel   = ( sysif_type_i==INTRA ) ? mc_cur_sel_i     : fme_cur_sel_i      ;
            cur_02_size  = ( sysif_type_i==INTRA ) ? mc_cur_size_i    : fme_cur_size_i     ;
            cur_02_4x4_x = ( sysif_type_i==INTRA ) ? mc_cur_4x4_x_i   : fme_cur_4x4_x_i    ;
            cur_02_4x4_y = ( sysif_type_i==INTRA ) ? mc_cur_4x4_y_i   : fme_cur_4x4_y_i    ;
            cur_02_idx   = ( sysif_type_i==INTRA ) ? mc_cur_4x4_idx_i : fme_cur_4x4_idx_i  ;
        end
        default: begin
            cur_02_wen   = 'b0;
            cur_02_waddr = 'b0;
            cur_02_wdata = 'b0;

            cur_02_ren   = 'b0;
            cur_02_sel   = 'b0;
            cur_02_size  = 'b0;
            cur_02_4x4_x = 'b0;
            cur_02_4x4_y = 'b0;
            cur_02_idx   = 'b0;
        end
    endcase
end

// cur_03
always @ (*) begin
    case (rotate)
        'd0: begin
            cur_03_wen   = 'b0;
            cur_03_waddr = 'b0;
            cur_03_wdata = 'b0;

            cur_03_ren   = ( sysif_type_i==INTRA ) ? mc_cur_rden_i    : fme_cur_rden_i     ;
            cur_03_sel   = ( sysif_type_i==INTRA ) ? mc_cur_sel_i     : fme_cur_sel_i      ;
            cur_03_size  = ( sysif_type_i==INTRA ) ? mc_cur_size_i    : fme_cur_size_i     ;
            cur_03_4x4_x = ( sysif_type_i==INTRA ) ? mc_cur_4x4_x_i   : fme_cur_4x4_x_i    ;
            cur_03_4x4_y = ( sysif_type_i==INTRA ) ? mc_cur_4x4_y_i   : fme_cur_4x4_y_i    ;
            cur_03_idx   = ( sysif_type_i==INTRA ) ? mc_cur_4x4_idx_i : fme_cur_4x4_idx_i  ;
        end
        'd1: begin
            cur_03_wen   = 'b0;
            cur_03_waddr = 'b0;
            cur_03_wdata = 'b0;

            cur_03_ren   = mc_cur_rden_i;
            cur_03_sel   = mc_cur_sel_i ;
            cur_03_size  = mc_cur_size_i;
            cur_03_4x4_x = mc_cur_4x4_x_i;
            cur_03_4x4_y = mc_cur_4x4_y_i;
            cur_03_idx   = mc_cur_4x4_idx_i;
        end
        'd2: begin
            cur_03_wen   = 'b0;
            cur_03_waddr = 'b0;
            cur_03_wdata = 'b0;

            cur_03_ren   = db_cur_rden_i;
            cur_03_sel   = db_cur_sel_i ;
            cur_03_size  = db_cur_size_i;
            cur_03_4x4_x = db_cur_4x4_x_i;
            cur_03_4x4_y = db_cur_4x4_y_i;
            cur_03_idx   = db_cur_4x4_idx_i;
        end
        'd3: begin
            cur_03_wen   = ext_load_valid_i;
            cur_03_waddr = ext_load_addr_i;
            cur_03_wdata = ext_load_data_i;

            cur_03_ren   = 'b0;
            cur_03_sel   = 'b0;
            cur_03_size  = 'b0;
            cur_03_4x4_x = 'b0;
            cur_03_4x4_y = 'b0;
            cur_03_idx   = 'b0;
        end
        'd4: begin
            cur_03_wen   = 'b0;
            cur_03_waddr = 'b0;
            cur_03_wdata = 'b0;

            cur_03_ren   = ( sysif_type_i==INTRA ) ? pre_i_rden_i     : fime_cur_rden_i    ;
            cur_03_sel   = ( sysif_type_i==INTRA ) ? pre_i_sel_i      : fime_cur_sel_i     ;
            cur_03_size  = ( sysif_type_i==INTRA ) ? pre_i_size_i     : fime_cur_size_i    ;
            cur_03_4x4_x = ( sysif_type_i==INTRA ) ? pre_i_4x4_x_i    : fime_cur_4x4_x_i   ;
            cur_03_4x4_y = ( sysif_type_i==INTRA ) ? pre_i_4x4_y_i    : fime_cur_4x4_y_i   ;
            cur_03_idx   = ( sysif_type_i==INTRA ) ? pre_i_4x4_idx_i  : fime_cur_4x4_idx_i ;
        end
        default: begin
            cur_03_wen   = 'b0;
            cur_03_waddr = 'b0;
            cur_03_wdata = 'b0;

            cur_03_ren   = 'b0;
            cur_03_sel   = 'b0;
            cur_03_size  = 'b0;
            cur_03_4x4_x = 'b0;
            cur_03_4x4_y = 'b0;
            cur_03_idx   = 'b0;
        end
    endcase
end

// cur_04
always @ (*) begin
    case (rotate)
        'd0: begin
            cur_04_wen   = 'b0;
            cur_04_waddr = 'b0;
            cur_04_wdata = 'b0;

            cur_04_ren   = ( sysif_type_i==INTRA ) ? pre_i_rden_i     : fime_cur_rden_i    ;
            cur_04_sel   = ( sysif_type_i==INTRA ) ? pre_i_sel_i      : fime_cur_sel_i     ;
            cur_04_size  = ( sysif_type_i==INTRA ) ? pre_i_size_i     : fime_cur_size_i    ;
            cur_04_4x4_x = ( sysif_type_i==INTRA ) ? pre_i_4x4_x_i    : fime_cur_4x4_x_i   ;
            cur_04_4x4_y = ( sysif_type_i==INTRA ) ? pre_i_4x4_y_i    : fime_cur_4x4_y_i   ;
            cur_04_idx   = ( sysif_type_i==INTRA ) ? pre_i_4x4_idx_i  : fime_cur_4x4_idx_i ;
        end
        'd1: begin
            cur_04_wen   = 'b0;
            cur_04_waddr = 'b0;
            cur_04_wdata = 'b0;

            cur_04_ren   = ( sysif_type_i==INTRA ) ? mc_cur_rden_i    : fme_cur_rden_i     ;
            cur_04_sel   = ( sysif_type_i==INTRA ) ? mc_cur_sel_i     : fme_cur_sel_i      ;
            cur_04_size  = ( sysif_type_i==INTRA ) ? mc_cur_size_i    : fme_cur_size_i     ;
            cur_04_4x4_x = ( sysif_type_i==INTRA ) ? mc_cur_4x4_x_i   : fme_cur_4x4_x_i    ;
            cur_04_4x4_y = ( sysif_type_i==INTRA ) ? mc_cur_4x4_y_i   : fme_cur_4x4_y_i    ;
            cur_04_idx   = ( sysif_type_i==INTRA ) ? mc_cur_4x4_idx_i : fme_cur_4x4_idx_i  ;
        end
        'd2: begin
            cur_04_wen   = 'b0;
            cur_04_waddr = 'b0;
            cur_04_wdata = 'b0;

            cur_04_ren   = mc_cur_rden_i;
            cur_04_sel   = mc_cur_sel_i ;
            cur_04_size  = mc_cur_size_i;
            cur_04_4x4_x = mc_cur_4x4_x_i;
            cur_04_4x4_y = mc_cur_4x4_y_i;
            cur_04_idx   = mc_cur_4x4_idx_i;
        end
        'd3: begin
            cur_04_wen   = 'b0;
            cur_04_waddr = 'b0;
            cur_04_wdata = 'b0;

            cur_04_ren   = fime_cur_rden_i;
            cur_04_sel   = fime_cur_sel_i ;
            cur_04_size  = fime_cur_size_i;
            cur_04_4x4_x = fime_cur_4x4_x_i;
            cur_04_4x4_y = fime_cur_4x4_y_i;
            cur_04_idx   = fime_cur_4x4_idx_i;
        end
        'd4: begin
            cur_04_wen   = ext_load_valid_i;
            cur_04_waddr = ext_load_addr_i;
            cur_04_wdata = ext_load_data_i;

            cur_04_ren   = 'b0;
            cur_04_sel   = 'b0;
            cur_04_size  = 'b0;
            cur_04_4x4_x = 'b0;
            cur_04_4x4_y = 'b0;
            cur_04_idx   = 'b0;
        end
        default: begin
            cur_04_wen   = 'b0;
            cur_04_waddr = 'b0;
            cur_04_wdata = 'b0;

            cur_04_ren   = 'b0;
            cur_04_sel   = 'b0;
            cur_04_size  = 'b0;
            cur_04_4x4_x = 'b0;
            cur_04_4x4_y = 'b0;
            cur_04_idx   = 'b0;
        end
    endcase
end

// cur_duo1
always @ (*) begin
    case (duo_rotate)
        'd0: begin
            cur_duo1_wen   = ext_load_valid_i;
            cur_duo1_waddr = ext_load_addr_i;
            cur_duo1_wdata = ext_load_data_i;

            cur_duo1_ren   = 'b0;
            cur_duo1_sel   = 'b0;
            cur_duo1_size  = 'b0;
            cur_duo1_4x4_x = 'b0;
            cur_duo1_4x4_y = 'b0;
            cur_duo1_idx   = 'b0;
        end
        'd1: begin
            cur_duo1_wen   = 'b0;
            cur_duo1_waddr = 'b0;
            cur_duo1_wdata = 'b0;

            cur_duo1_ren   = fime_cur_rden_i;
            cur_duo1_sel   = fime_cur_sel_i ;
            cur_duo1_size  = fime_cur_size_i;
            cur_duo1_4x4_x = fime_cur_4x4_x_i + 'd8;
            cur_duo1_4x4_y = fime_cur_4x4_y_i;
            cur_duo1_idx   = fime_cur_4x4_idx_i;
        end
    endcase
end

// cur_duo2
always @ (*) begin
    case (duo_rotate)
        'd0: begin
            cur_duo2_wen   = 'b0;
            cur_duo2_waddr = 'b0;
            cur_duo2_wdata = 'b0;

            cur_duo2_ren   = fime_cur_rden_i;
            cur_duo2_sel   = fime_cur_sel_i ;
            cur_duo2_size  = fime_cur_size_i;
            cur_duo2_4x4_x = fime_cur_4x4_x_i + 'd8;   //
            cur_duo2_4x4_y = fime_cur_4x4_y_i;
            cur_duo2_idx   = fime_cur_4x4_idx_i;
        end
        'd1: begin
            cur_duo2_wen   = ext_load_valid_i;
            cur_duo2_waddr = ext_load_addr_i;
            cur_duo2_wdata = ext_load_data_i;

            cur_duo2_ren   = 'b0;
            cur_duo2_sel   = 'b0;
            cur_duo2_size  = 'b0;
            cur_duo2_4x4_x = 'b0;
            cur_duo2_4x4_y = 'b0;
            cur_duo2_idx   = 'b0;
        end
    endcase
end


always @  (*) begin
    case (rotate)
        'd0:begin
            fime_cur_pel0      = cur_04_rdata ;
            fme_cur_pel_o      = cur_03_rdata ;
            mc_cur_pel_o       = ( sysif_type_i==INTRA ) ? cur_03_rdata : cur_02_rdata ;
            db_cur_pel_o       = cur_01_rdata ;
            pre_i_pel_o        = cur_04_rdata ;
        end
        'd1:begin
            fime_cur_pel0      = cur_00_rdata ;
            fme_cur_pel_o      = cur_04_rdata ;
            mc_cur_pel_o       = ( sysif_type_i==INTRA ) ? cur_04_rdata : cur_03_rdata ;
            db_cur_pel_o       = cur_02_rdata ;
            pre_i_pel_o        = cur_00_rdata ;
        end
        'd2:begin
            fime_cur_pel0      = cur_01_rdata ;
            fme_cur_pel_o      = cur_00_rdata ;
            mc_cur_pel_o       = ( sysif_type_i==INTRA ) ? cur_00_rdata : cur_04_rdata ;
            db_cur_pel_o       = cur_03_rdata ;
            pre_i_pel_o        = cur_01_rdata ;
        end
        'd3:begin
            fime_cur_pel0      = cur_02_rdata ;
            fme_cur_pel_o      = cur_01_rdata ;
            mc_cur_pel_o       = ( sysif_type_i==INTRA ) ? cur_01_rdata : cur_00_rdata ;
            db_cur_pel_o       = cur_04_rdata ;
            pre_i_pel_o        = cur_02_rdata ;
        end
        'd4:begin
            fime_cur_pel0      = cur_03_rdata ;
            fme_cur_pel_o      = cur_02_rdata ;
            mc_cur_pel_o       = ( sysif_type_i==INTRA ) ? cur_02_rdata : cur_01_rdata ;
            db_cur_pel_o       = cur_00_rdata ;
            pre_i_pel_o        = cur_03_rdata ;
        end
        default: begin
            fime_cur_pel0      = 0 ;
            fme_cur_pel_o      = 0 ;
            mc_cur_pel_o       = 0 ;
            db_cur_pel_o       = 0 ;
			pre_i_pel_o        = 0 ;
        end
    endcase
end


always @  (*) begin
    case (duo_rotate)
        'd0:begin
            fime_cur_pel1 = cur_duo2_rdata;
        end
        'd1:begin
            fime_cur_pel1 = cur_duo1_rdata;
        end
    endcase
end

assign fime_cur_pel_o = {fime_cur_pel0,fime_cur_pel1};


// ********************************************
//
//    Wrapper
//
// ********************************************

mem_lipo_1p  cur00 (
    .clk      	(clk  ),
    .rst_n      (rstn ),

    .a_wen_i	(cur_00_wen  ),
    .a_addr_i	(cur_00_waddr),
    .a_wdata_i  (cur_00_wdata),

    .b_ren_i 	(cur_00_ren  ),
    .b_sel_i	(cur_00_sel  ),
    .b_size_i 	(cur_00_size ),
    .b_4x4_x_i	(cur_00_4x4_x),
    .b_4x4_y_i	(cur_00_4x4_y),
    .b_idx_i  	(cur_00_idx  ),
    .b_rdata_o 	(cur_00_rdata)
);
mem_lipo_1p  cur01 (
    .clk      	(clk  ),
    .rst_n      (rstn ),

    .a_wen_i	(cur_01_wen  ),
    .a_addr_i	(cur_01_waddr),
    .a_wdata_i  (cur_01_wdata),

    .b_ren_i 	(cur_01_ren  ),
    .b_sel_i	(cur_01_sel  ),
    .b_size_i 	(cur_01_size ),
    .b_4x4_x_i	(cur_01_4x4_x),
    .b_4x4_y_i	(cur_01_4x4_y),
    .b_idx_i  	(cur_01_idx  ),
    .b_rdata_o 	(cur_01_rdata)
);
mem_lipo_1p  cur02 (
    .clk      	(clk  ),
    .rst_n      (rstn),

    .a_wen_i	(cur_02_wen  ),
    .a_addr_i	(cur_02_waddr),
    .a_wdata_i  (cur_02_wdata),

    .b_ren_i 	(cur_02_ren  ),
    .b_sel_i	(cur_02_sel  ),
    .b_size_i 	(cur_02_size ),
    .b_4x4_x_i	(cur_02_4x4_x),
    .b_4x4_y_i	(cur_02_4x4_y),
    .b_idx_i  	(cur_02_idx  ),
    .b_rdata_o 	(cur_02_rdata)
);
mem_lipo_1p  cur03 (
    .clk      	(clk  ),
    .rst_n      (rstn),

    .a_wen_i	(cur_03_wen  ),
    .a_addr_i	(cur_03_waddr),
    .a_wdata_i  (cur_03_wdata),

    .b_ren_i 	(cur_03_ren  ),
    .b_sel_i	(cur_03_sel  ),
    .b_size_i 	(cur_03_size ),
    .b_4x4_x_i	(cur_03_4x4_x),
    .b_4x4_y_i	(cur_03_4x4_y),
    .b_idx_i  	(cur_03_idx  ),
    .b_rdata_o 	(cur_03_rdata)
);
mem_lipo_1p  cur04 (
    .clk      	(clk  ),
    .rst_n      (rstn),

    .a_wen_i	(cur_04_wen  ),
    .a_addr_i	(cur_04_waddr),
    .a_wdata_i  (cur_04_wdata),

    .b_ren_i 	(cur_04_ren  ),
    .b_sel_i	(cur_04_sel  ),
    .b_size_i 	(cur_04_size ),
    .b_4x4_x_i	(cur_04_4x4_x),
    .b_4x4_y_i	(cur_04_4x4_y),
    .b_idx_i  	(cur_04_idx  ),
    .b_rdata_o 	(cur_04_rdata)
);

mem_lipo_1p  duo1 (
    .clk      	(clk  ),
    .rst_n      (rstn),

    .a_wen_i	(cur_duo1_wen  ),
    .a_addr_i	(cur_duo1_waddr),
    .a_wdata_i  (cur_duo1_wdata),

    .b_ren_i 	(cur_duo1_ren  ),
    .b_sel_i	(cur_duo1_sel  ),
    .b_size_i 	(cur_duo1_size ),
    .b_4x4_x_i	(cur_duo1_4x4_x),
    .b_4x4_y_i	(cur_duo1_4x4_y),
    .b_idx_i  	(cur_duo1_idx  ),
    .b_rdata_o 	(cur_duo1_rdata)
);

mem_lipo_1p  duo2 (
    .clk      	(clk  ),
    .rst_n      (rstn),

    .a_wen_i	(cur_duo2_wen  ),
    .a_addr_i	(cur_duo2_waddr),
    .a_wdata_i  (cur_duo2_wdata),

    .b_ren_i 	(cur_duo2_ren  ),
    .b_sel_i	(cur_duo2_sel  ),
    .b_size_i 	(cur_duo2_size ),
    .b_4x4_x_i	(cur_duo2_4x4_x),
    .b_4x4_y_i	(cur_duo2_4x4_y),
    .b_idx_i  	(cur_duo2_idx  ),
    .b_rdata_o 	(cur_duo2_rdata)
);
endmodule

