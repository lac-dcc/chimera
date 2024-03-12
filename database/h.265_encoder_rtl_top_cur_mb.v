//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2013, VIPcore Group, Fudan University
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
//  Filename      : cur_mb.v
//  Author        : Yibo FAN
//  Created       : 2013-12-28
//  Description   : Current MB
//
//-------------------------------------------------------------------
//
//  Modified      : 2014-07-17 by HLL
//  Description   : lcu size changed into 64x64 (prediction to 64x64 block remains to be added)
//  Modified      : 2014-08-23 by HLL
//  Description   : optional mode for minimal tu size added
//  Modified      : 2015-03-12 by HLL
//  Description   : ping-pong logic removed
//
//  $Id$
//
//-------------------------------------------------------------------

`include "enc_defines.v"


module cur_mb   (
  clk               ,
  rst_n             ,
  mb_x_i            ,
  mb_y_i            ,
  pre_min_size_i    ,
  start_i           ,
  done_o            ,

  pinc_o            ,
  pvalid_i          ,
  pdata_i           ,

  fmeif_bank_i      ,
  fmeif_ren_i       ,
  fmeif_size_i      ,
  fmeif_4x4_x_i     ,
  fmeif_4x4_y_i     ,
  fmeif_idx_i       ,
  fmeif_data_o      ,

  tqif_sel_i        ,
  tqif_ren_i        ,
  tqif_size_i       ,
  tqif_4x4_x_i      ,
  tqif_4x4_y_i      ,
  tqif_idx_i        ,
  tqif_data_o       ,

  intraif_md_ren_i  ,
  intraif_md_addr_i ,
  intraif_md_data_o
  );

// ********************************************
//
//    Parameter DECLARATION
//
// ********************************************


// ********************************************
//
//    INPUT / OUTPUT DECLARATION
//
// ********************************************

  input                               clk               ; //clock
  input                               rst_n             ; //reset signal
  // ctrl if
  input    [`PIC_X_WIDTH-1    : 0]    mb_x_i            ; // load mb x
  input    [`PIC_Y_WIDTH-1    : 0]    mb_y_i            ; // load mb y
  input                               pre_min_size_i    ; // minimal tu size
  input                               start_i           ; // start load new mb from outside
  output                              done_o            ; // load done
  // pixel if
  output                              pinc_o            ; // read next pixel
  input                               pvalid_i          ; // pixel valid for input
  input    [`PIXEL_WIDTH*8-1  : 0]    pdata_i           ; // pixel data : 8 pixel input parallel
  // fme if
  input                               fmeif_ren_i       ; // cmb read enable
  input    [1                 : 0]    fmeif_bank_i      ; // 0x: luma, 10: cb; 11:cr
  input    [1                 : 0]    fmeif_size_i      ; // cmb read size (00:4x4 01:8x8 10:16x16 11:32x32)
  input    [4                 : 0]    fmeif_idx_i       ; // read index ({blk_index, line_number})
  input    [3                 : 0]    fmeif_4x4_x_i     ; // cmb read block top/left 4x4 x
  input    [3                 : 0]    fmeif_4x4_y_i     ; // cmb read block top/left 4x4 y
  output   [`PIXEL_WIDTH*32-1 : 0]    fmeif_data_o      ; // pixel data
  // tq if
  input                               tqif_sel_i        ; // luma/chroma selector
  input                               tqif_ren_i        ; // cmb read enable
  input    [1                 : 0]    tqif_size_i       ; // cmb read size (00:4x4 01:8x8 10:16x16 11:32x32)
  input    [4                 : 0]    tqif_idx_i        ; // read index ({blk_index, line_number})
  input    [3                 : 0]    tqif_4x4_x_i      ; // cmb read block top/left 4x4 x
  input    [3                 : 0]    tqif_4x4_y_i      ; // cmb read block top/left 4x4 y
  output   [`PIXEL_WIDTH*32-1 : 0]    tqif_data_o       ; // pixel data
  // intra if
  input                               intraif_md_ren_i  ; // intra predicted mode read enable
  input    [9                : 0]     intraif_md_addr_i ; // intra predicted mode read address
  output   [5                : 0]     intraif_md_data_o ; // intra predicted mode read data




// ********************************************
//
//    Register DECLARATION
//
// ********************************************
  reg                                 done_o            ;
  reg                                 imode_sel         ;
  reg                                 cmb_sel           ;

  reg                                 imode_sel_r       ;
  reg                                 cmb_sel_r         ;

  integer                             cmb_tp            ;
  integer                             mode_amount       ;

// ********************************************
//
//    Wire DECLARATION
//
// ********************************************
wire [5:0]            intraif_md_data_0, intraif_md_data_1;
wire [`PIXEL_WIDTH*32-1:0]    tqif_data_0, tqif_data_1;


// ********************************************
//
//    Logic DECLARATION
//
// ********************************************
always @(posedge clk) begin
  if (start_i) begin
    imode_sel_r <= 1 ;
    cmb_sel_r   <= 1 ;
  end
end

assign intraif_md_data_o  = imode_sel_r ? intraif_md_data_1 : intraif_md_data_0;
assign tqif_data_o      = cmb_sel_r ? tqif_data_1   : tqif_data_0    ;


buf_ram_1p_6x85 imode_buf_0(
        .clk      ( clk       ),
        .ce         ( intraif_md_ren_i  ),
        .we     ( 1'b0        ),
        .addr   ( intraif_md_addr_i ),
        .data_i     ( 6'b0        ),
        .data_o     ( intraif_md_data_0 )
);

buf_ram_1p_6x85 imode_buf_1(
        .clk      ( clk       ),
        .ce         ( intraif_md_ren_i  ),
        .we     ( 1'b0        ),
        .addr   ( intraif_md_addr_i ),
        .data_i     ( 6'b0        ),
        .data_o     ( intraif_md_data_1 )
);

mem_lipo_1p  cmb_buf_0 (
        .clk        ( clk         ),
        .rst_n      ( rst_n           ),

        .a_wen_i  ( 1'b0        ),
        .a_addr_i ( 8'b0        ),
        .a_wdata_i  ( 256'b0      ),

        .b_ren_i  ( tqif_ren_i    ),
        .b_sel_i  ( tqif_sel_i    ),
        .b_size_i   ( tqif_size_i   ),
        .b_4x4_x_i  ( tqif_4x4_x_i    ),
        .b_4x4_y_i  ( tqif_4x4_y_i    ),
        .b_idx_i    ( tqif_idx_i      ),
        .b_rdata_o  ( tqif_data_0   )
);

mem_lipo_1p  cmb_buf_1 (
        .clk        ( clk         ),
        .rst_n      ( rst_n           ),

        .a_wen_i  ( 1'b0        ),
        .a_addr_i ( 8'b0        ),
        .a_wdata_i  ( 256'b0      ),

        .b_ren_i  ( tqif_ren_i    ),
        .b_sel_i  ( tqif_sel_i    ),
        .b_size_i   ( tqif_size_i   ),
        .b_4x4_x_i  ( tqif_4x4_x_i    ),
        .b_4x4_y_i  ( tqif_4x4_y_i    ),
        .b_idx_i    ( tqif_idx_i      ),
        .b_rdata_o  ( tqif_data_1   )
);

// -------------------------------------------------------
//                   CMB LOAD Pixel Simulator
// -------------------------------------------------------
localparam          YUV_FILE   = "./tv/cur_mb_p32.dat";
localparam          IMODE_FILE = "./tv/intra_mode.dat";
reg [`PIXEL_WIDTH*32-1:0]   scan_pixel_32;
reg [5:0]           scan_intra_mode;
integer             i, fp_input, fp_intra_mode;

  initial begin
    fp_input      = $fopen( YUV_FILE   ,"r" );
    fp_intra_mode = $fopen( IMODE_FILE ,"r" );
    done_o        = 0  ;
    cmb_sel       = 0  ;
    imode_sel     = 0  ;
    mode_amount   = 0  ;
  end

always @(posedge clk) begin
  if (start_i) begin

    if( pre_min_size_i=='d1 )
      mode_amount = 21 ;
    else begin
      mode_amount = 85 ;
    end

    if (cmb_sel == 'd0) begin
      // load luma
      for (i=0; i<32; i=i+1) begin
        cmb_tp = $fscanf(fp_input, "%h", scan_pixel_32          );
        {cmb_buf_1.buf_org_0.u_ram_1p_64x192.mem_array[i*4+0],
         cmb_buf_1.buf_org_1.u_ram_1p_64x192.mem_array[i*4+0],
         cmb_buf_1.buf_org_2.u_ram_1p_64x192.mem_array[i*4+0],
         cmb_buf_1.buf_org_3.u_ram_1p_64x192.mem_array[i*4+0]} =
        {scan_pixel_32[`PIXEL_WIDTH*32-1:`PIXEL_WIDTH*24],
         scan_pixel_32[`PIXEL_WIDTH*16-1:`PIXEL_WIDTH*8],
         scan_pixel_32[`PIXEL_WIDTH*24-1:`PIXEL_WIDTH*16],
         scan_pixel_32[`PIXEL_WIDTH*8-1 :`PIXEL_WIDTH*0]};
    
        cmb_tp = $fscanf(fp_input, "%h", scan_pixel_32          );
        {cmb_buf_1.buf_org_0.u_ram_1p_64x192.mem_array[i*4+1],
         cmb_buf_1.buf_org_1.u_ram_1p_64x192.mem_array[i*4+1],
         cmb_buf_1.buf_org_2.u_ram_1p_64x192.mem_array[i*4+1],
         cmb_buf_1.buf_org_3.u_ram_1p_64x192.mem_array[i*4+1]} =
        {scan_pixel_32[`PIXEL_WIDTH*8 -1:`PIXEL_WIDTH*0],
         scan_pixel_32[`PIXEL_WIDTH*32-1:`PIXEL_WIDTH*24],
         scan_pixel_32[`PIXEL_WIDTH*16-1:`PIXEL_WIDTH*8],
         scan_pixel_32[`PIXEL_WIDTH*24-1:`PIXEL_WIDTH*16]};
    
        cmb_tp = $fscanf(fp_input, "%h", scan_pixel_32          );
        {cmb_buf_1.buf_org_0.u_ram_1p_64x192.mem_array[i*4+2],
         cmb_buf_1.buf_org_1.u_ram_1p_64x192.mem_array[i*4+2],
         cmb_buf_1.buf_org_2.u_ram_1p_64x192.mem_array[i*4+2],
         cmb_buf_1.buf_org_3.u_ram_1p_64x192.mem_array[i*4+2]} =
        {scan_pixel_32[`PIXEL_WIDTH*24-1:`PIXEL_WIDTH*16],
         scan_pixel_32[`PIXEL_WIDTH*8 -1:`PIXEL_WIDTH*0],
         scan_pixel_32[`PIXEL_WIDTH*32-1:`PIXEL_WIDTH*24],
         scan_pixel_32[`PIXEL_WIDTH*16-1:`PIXEL_WIDTH*8]};
    
        cmb_tp = $fscanf(fp_input, "%h", scan_pixel_32          );
        {cmb_buf_1.buf_org_0.u_ram_1p_64x192.mem_array[i*4+3],
         cmb_buf_1.buf_org_1.u_ram_1p_64x192.mem_array[i*4+3],
         cmb_buf_1.buf_org_2.u_ram_1p_64x192.mem_array[i*4+3],
         cmb_buf_1.buf_org_3.u_ram_1p_64x192.mem_array[i*4+3]} =
        {scan_pixel_32[`PIXEL_WIDTH*16-1:`PIXEL_WIDTH*8],
         scan_pixel_32[`PIXEL_WIDTH*24-1:`PIXEL_WIDTH*16],
         scan_pixel_32[`PIXEL_WIDTH*8 -1:`PIXEL_WIDTH*0],
         scan_pixel_32[`PIXEL_WIDTH*32-1:`PIXEL_WIDTH*24]};
      end
    
      // load chroma
      for (i=0; i<16; i=i+1) begin
        cmb_tp = $fscanf(fp_input, "%h", scan_pixel_32          );
        {cmb_buf_1.buf_org_0.u_ram_1p_64x192.mem_array[128+i*4+0],
         cmb_buf_1.buf_org_1.u_ram_1p_64x192.mem_array[128+i*4+0],
         cmb_buf_1.buf_org_2.u_ram_1p_64x192.mem_array[128+i*4+0],
         cmb_buf_1.buf_org_3.u_ram_1p_64x192.mem_array[128+i*4+0]} =
        {scan_pixel_32[`PIXEL_WIDTH*32-1:`PIXEL_WIDTH*24],
         scan_pixel_32[`PIXEL_WIDTH*16-1:`PIXEL_WIDTH*8 ],
         scan_pixel_32[`PIXEL_WIDTH*24-1:`PIXEL_WIDTH*16],
         scan_pixel_32[`PIXEL_WIDTH*8 -1:`PIXEL_WIDTH*0 ]};
    
        cmb_tp = $fscanf(fp_input, "%h", scan_pixel_32          );
        {cmb_buf_1.buf_org_0.u_ram_1p_64x192.mem_array[128+i*4+1],
         cmb_buf_1.buf_org_1.u_ram_1p_64x192.mem_array[128+i*4+1],
         cmb_buf_1.buf_org_2.u_ram_1p_64x192.mem_array[128+i*4+1],
         cmb_buf_1.buf_org_3.u_ram_1p_64x192.mem_array[128+i*4+1]} =
        {scan_pixel_32[`PIXEL_WIDTH*8 -1:`PIXEL_WIDTH*0 ],
         scan_pixel_32[`PIXEL_WIDTH*32-1:`PIXEL_WIDTH*24],
         scan_pixel_32[`PIXEL_WIDTH*16-1:`PIXEL_WIDTH*8 ],
         scan_pixel_32[`PIXEL_WIDTH*24-1:`PIXEL_WIDTH*16]};
    
        cmb_tp = $fscanf(fp_input, "%h", scan_pixel_32          );
        {cmb_buf_1.buf_org_0.u_ram_1p_64x192.mem_array[128+i*4+2],
         cmb_buf_1.buf_org_1.u_ram_1p_64x192.mem_array[128+i*4+2],
         cmb_buf_1.buf_org_2.u_ram_1p_64x192.mem_array[128+i*4+2],
         cmb_buf_1.buf_org_3.u_ram_1p_64x192.mem_array[128+i*4+2]} =
        {scan_pixel_32[`PIXEL_WIDTH*24-1:`PIXEL_WIDTH*16],
         scan_pixel_32[`PIXEL_WIDTH*8 -1:`PIXEL_WIDTH*0 ],
         scan_pixel_32[`PIXEL_WIDTH*32-1:`PIXEL_WIDTH*24],
         scan_pixel_32[`PIXEL_WIDTH*16-1:`PIXEL_WIDTH*8 ]};
    
        cmb_tp = $fscanf(fp_input, "%h", scan_pixel_32          );
        {cmb_buf_1.buf_org_0.u_ram_1p_64x192.mem_array[128+i*4+3],
         cmb_buf_1.buf_org_1.u_ram_1p_64x192.mem_array[128+i*4+3],
         cmb_buf_1.buf_org_2.u_ram_1p_64x192.mem_array[128+i*4+3],
         cmb_buf_1.buf_org_3.u_ram_1p_64x192.mem_array[128+i*4+3]} =
        {scan_pixel_32[`PIXEL_WIDTH*16-1:`PIXEL_WIDTH*8 ],
         scan_pixel_32[`PIXEL_WIDTH*24-1:`PIXEL_WIDTH*16],
         scan_pixel_32[`PIXEL_WIDTH*8 -1:`PIXEL_WIDTH*0 ],
         scan_pixel_32[`PIXEL_WIDTH*32-1:`PIXEL_WIDTH*24]};
      end
    
      // Load Mode
      for (i=0; i<mode_amount*4; i=i+1) begin
        cmb_tp = $fscanf(fp_intra_mode, "%h", scan_intra_mode);
        imode_buf_1.u_ram_1p_6x85.mem_array[i] = scan_intra_mode;
      end
      cmb_tp = $fscanf(fp_intra_mode, "%h", scan_intra_mode);

    end
    else if (cmb_sel == 'd1) begin
      // load luma
      for (i=0; i<32; i=i+1) begin
        cmb_tp = $fscanf(fp_input, "%h", scan_pixel_32          );
        {cmb_buf_0.buf_org_0.u_ram_1p_64x192.mem_array[i*4+0],
         cmb_buf_0.buf_org_1.u_ram_1p_64x192.mem_array[i*4+0],
         cmb_buf_0.buf_org_2.u_ram_1p_64x192.mem_array[i*4+0],
         cmb_buf_0.buf_org_3.u_ram_1p_64x192.mem_array[i*4+0]} =
        {scan_pixel_32[`PIXEL_WIDTH*32-1:`PIXEL_WIDTH*24],
         scan_pixel_32[`PIXEL_WIDTH*16-1:`PIXEL_WIDTH*8],
         scan_pixel_32[`PIXEL_WIDTH*24-1:`PIXEL_WIDTH*16],
         scan_pixel_32[`PIXEL_WIDTH*8-1 :`PIXEL_WIDTH*0]};
    
        cmb_tp = $fscanf(fp_input, "%h", scan_pixel_32          );
        {cmb_buf_0.buf_org_0.u_ram_1p_64x192.mem_array[i*4+1],
         cmb_buf_0.buf_org_1.u_ram_1p_64x192.mem_array[i*4+1],
         cmb_buf_0.buf_org_2.u_ram_1p_64x192.mem_array[i*4+1],
         cmb_buf_0.buf_org_3.u_ram_1p_64x192.mem_array[i*4+1]} =
        {scan_pixel_32[`PIXEL_WIDTH*8 -1:`PIXEL_WIDTH*0],
         scan_pixel_32[`PIXEL_WIDTH*32-1:`PIXEL_WIDTH*24],
         scan_pixel_32[`PIXEL_WIDTH*16-1:`PIXEL_WIDTH*8],
         scan_pixel_32[`PIXEL_WIDTH*24-1:`PIXEL_WIDTH*16]};
    
        cmb_tp = $fscanf(fp_input, "%h", scan_pixel_32          );
        {cmb_buf_0.buf_org_0.u_ram_1p_64x192.mem_array[i*4+2],
         cmb_buf_0.buf_org_1.u_ram_1p_64x192.mem_array[i*4+2],
         cmb_buf_0.buf_org_2.u_ram_1p_64x192.mem_array[i*4+2],
         cmb_buf_0.buf_org_3.u_ram_1p_64x192.mem_array[i*4+2]} =
        {scan_pixel_32[`PIXEL_WIDTH*24-1:`PIXEL_WIDTH*16],
         scan_pixel_32[`PIXEL_WIDTH*8 -1:`PIXEL_WIDTH*0],
         scan_pixel_32[`PIXEL_WIDTH*32-1:`PIXEL_WIDTH*24],
         scan_pixel_32[`PIXEL_WIDTH*16-1:`PIXEL_WIDTH*8]};
    
        cmb_tp = $fscanf(fp_input, "%h", scan_pixel_32          );
        {cmb_buf_0.buf_org_0.u_ram_1p_64x192.mem_array[i*4+3],
         cmb_buf_0.buf_org_1.u_ram_1p_64x192.mem_array[i*4+3],
         cmb_buf_0.buf_org_2.u_ram_1p_64x192.mem_array[i*4+3],
         cmb_buf_0.buf_org_3.u_ram_1p_64x192.mem_array[i*4+3]} =
        {scan_pixel_32[`PIXEL_WIDTH*16-1:`PIXEL_WIDTH*8],
         scan_pixel_32[`PIXEL_WIDTH*24-1:`PIXEL_WIDTH*16],
         scan_pixel_32[`PIXEL_WIDTH*8 -1:`PIXEL_WIDTH*0],
         scan_pixel_32[`PIXEL_WIDTH*32-1:`PIXEL_WIDTH*24]};
      end
    
      // load chroma
      for (i=0; i<16; i=i+1) begin
        cmb_tp = $fscanf(fp_input, "%h", scan_pixel_32          );
        {cmb_buf_0.buf_org_0.u_ram_1p_64x192.mem_array[128+i*4+0],
         cmb_buf_0.buf_org_1.u_ram_1p_64x192.mem_array[128+i*4+0],
         cmb_buf_0.buf_org_2.u_ram_1p_64x192.mem_array[128+i*4+0],
         cmb_buf_0.buf_org_3.u_ram_1p_64x192.mem_array[128+i*4+0]} =
        {scan_pixel_32[`PIXEL_WIDTH*32-1:`PIXEL_WIDTH*24],
         scan_pixel_32[`PIXEL_WIDTH*16-1:`PIXEL_WIDTH*8 ],
         scan_pixel_32[`PIXEL_WIDTH*24-1:`PIXEL_WIDTH*16],
         scan_pixel_32[`PIXEL_WIDTH*8 -1:`PIXEL_WIDTH*0 ]};
    
        cmb_tp = $fscanf(fp_input, "%h", scan_pixel_32          );
        {cmb_buf_0.buf_org_0.u_ram_1p_64x192.mem_array[128+i*4+1],
         cmb_buf_0.buf_org_1.u_ram_1p_64x192.mem_array[128+i*4+1],
         cmb_buf_0.buf_org_2.u_ram_1p_64x192.mem_array[128+i*4+1],
         cmb_buf_0.buf_org_3.u_ram_1p_64x192.mem_array[128+i*4+1]} =
        {scan_pixel_32[`PIXEL_WIDTH*8 -1:`PIXEL_WIDTH*0 ],
         scan_pixel_32[`PIXEL_WIDTH*32-1:`PIXEL_WIDTH*24],
         scan_pixel_32[`PIXEL_WIDTH*16-1:`PIXEL_WIDTH*8 ],
         scan_pixel_32[`PIXEL_WIDTH*24-1:`PIXEL_WIDTH*16]};
    
        cmb_tp = $fscanf(fp_input, "%h", scan_pixel_32          );
        {cmb_buf_0.buf_org_0.u_ram_1p_64x192.mem_array[128+i*4+2],
         cmb_buf_0.buf_org_1.u_ram_1p_64x192.mem_array[128+i*4+2],
         cmb_buf_0.buf_org_2.u_ram_1p_64x192.mem_array[128+i*4+2],
         cmb_buf_0.buf_org_3.u_ram_1p_64x192.mem_array[128+i*4+2]} =
        {scan_pixel_32[`PIXEL_WIDTH*24-1:`PIXEL_WIDTH*16],
         scan_pixel_32[`PIXEL_WIDTH*8 -1:`PIXEL_WIDTH*0 ],
         scan_pixel_32[`PIXEL_WIDTH*32-1:`PIXEL_WIDTH*24],
         scan_pixel_32[`PIXEL_WIDTH*16-1:`PIXEL_WIDTH*8 ]};
    
        cmb_tp = $fscanf(fp_input, "%h", scan_pixel_32          );
        {cmb_buf_0.buf_org_0.u_ram_1p_64x192.mem_array[128+i*4+3],
         cmb_buf_0.buf_org_1.u_ram_1p_64x192.mem_array[128+i*4+3],
         cmb_buf_0.buf_org_2.u_ram_1p_64x192.mem_array[128+i*4+3],
         cmb_buf_0.buf_org_3.u_ram_1p_64x192.mem_array[128+i*4+3]} =
        {scan_pixel_32[`PIXEL_WIDTH*16-1:`PIXEL_WIDTH*8 ],
         scan_pixel_32[`PIXEL_WIDTH*24-1:`PIXEL_WIDTH*16],
         scan_pixel_32[`PIXEL_WIDTH*8 -1:`PIXEL_WIDTH*0 ],
         scan_pixel_32[`PIXEL_WIDTH*32-1:`PIXEL_WIDTH*24]};
      end
    
      // Load Mode
      for (i=0; i<mode_amount*4; i=i+1) begin
        cmb_tp = $fscanf(fp_intra_mode, "%h", scan_intra_mode);
        imode_buf_0.u_ram_1p_6x85.mem_array[i] = scan_intra_mode;
      end
      cmb_tp = $fscanf(fp_intra_mode, "%h", scan_intra_mode);

    end


//    cmb_sel   <= ~cmb_sel ;
//    imode_sel   <= ~imode_sel;

    #55 done_o <= 1'b1;
    #10 done_o <= 1'b0;

  end
end



endmodule
