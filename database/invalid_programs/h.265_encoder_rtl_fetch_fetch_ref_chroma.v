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
//  Filename      : fetch_ref_chroma.v
//  Author        : Yufeng Bai
//  Email 	  : byfchina@gmail.com
//
//-------------------------------------------------------------------
//
//  Modified      : 2015-09-02 by HLL
//  Description   : rotate by sys_start_i
//  Modified      : 2015-09-17 by HLL
//  Description   : ref_chroma provided in the order of uvuvuv...
//
//-------------------------------------------------------------------

`include "enc_defines.v"

module fetch_ref_chroma (
	clk		        ,
	rstn		        ,
  sysif_start_i    ,
        sysif_total_y_i         ,

        mc_cur_y_i              ,
	mc_ref_x_i		,
	mc_ref_y_i		,
	mc_ref_rden_i		,
	mc_ref_sel_i		,
	mc_ref_pel_o		,

	ext_load_done_i		,
	ext_load_data_i		,
        ext_load_addr_i         ,
	ext_load_valid_i
);

// ********************************************
//
//    INPUT / OUTPUT DECLARATION
//
// ********************************************

input 	 [1-1:0] 	         clk 	         ; // clk signal
input 	 [1-1:0] 	         rstn 	         ; // asynchronous reset
input                      sysif_start_i    ;
input    [`PIC_Y_WIDTH-1:0]      sysif_total_y_i ;

input    [`PIC_Y_WIDTH-1:0]      mc_cur_y_i ;
input 	 [6-1:0] 	         mc_ref_x_i 	 ; // mc ref x
input 	 [6-1:0] 	         mc_ref_y_i 	 ; // mc ref y
input 	 [1-1:0] 	         mc_ref_rden_i 	 ; // mc ref read enable
input 	 [1-1:0] 	         mc_ref_sel_i 	 ; // "mc ref read sel: cb
output 	 [8*`PIXEL_WIDTH-1:0] 	 mc_ref_pel_o 	 ; // mc ref pixel
input 	 [1-1:0] 	         ext_load_done_i ; // load current lcu done
input 	 [96*`PIXEL_WIDTH-1:0] 	 ext_load_data_i ; // load current lcu data
input    [6-1:0]                 ext_load_addr_i ;
input 	 [1-1:0] 	         ext_load_valid_i; // load current lcu data valid

// ********************************************
//
//    WIRE / REG DECLARATION
//
// ********************************************

  reg                             rotate      ;
  reg  [6-1               : 0]    mc_ref_y    ;
  reg  [6-1               : 0]    mc_ref_x    ;
  reg  [1-1               : 0]    mc_ref_sel  ;
  wire [1-1               : 0]    ref_u_wen   ,ref_u_0_wen   ,ref_u_1_wen   ,ref_v_wen   ,ref_v_0_wen   ,ref_v_1_wen   ;
  wire [6-1               : 0]    ref_u_waddr ,ref_u_0_waddr ,ref_u_1_waddr ,ref_v_waddr ,ref_v_0_waddr ,ref_v_1_waddr ;
  wire [48*`PIXEL_WIDTH-1 : 0]    ref_u_wdata ,ref_u_0_wdata ,ref_u_1_wdata ,ref_v_wdata ,ref_v_0_wdata ,ref_v_1_wdata ;
  wire [1-1:0]                    ref_u_rden  ,ref_u_0_rden  ,ref_u_1_rden  ,ref_v_rden  ,ref_v_0_rden  ,ref_v_1_rden  ;
  wire [6-1:0]                    ref_u_raddr ,ref_u_0_raddr ,ref_u_1_raddr ,ref_v_raddr ,ref_v_0_raddr ,ref_v_1_raddr ;
  wire [48*`PIXEL_WIDTH-1 : 0]    ref_u_rdata ,ref_u_0_rdata ,ref_u_1_rdata ,ref_v_rdata ,ref_v_0_rdata ,ref_v_1_rdata ;
  wire [48*`PIXEL_WIDTH-1 : 0]    mc_ref_pel  ;
  wire [48*`PIXEL_WIDTH-1 : 0]    ref_data    ;


// ********************************************
//
//    Combinational Logic
//
// ********************************************
always @ (*) begin
    if(mc_cur_y_i  == 'd0)
        mc_ref_y = (mc_ref_y_i < 'd8) ? 'd0 : mc_ref_y_i - 'd8;
    else if(mc_cur_y_i  == sysif_total_y_i)
        mc_ref_y = (mc_ref_y_i >= 'd40) ? 'd39 : mc_ref_y_i;
    else
        mc_ref_y = mc_ref_y_i;
end

  assign ref_u_wen    = ext_load_valid_i ;
  assign ref_u_waddr  = ext_load_addr_i  ;
  assign ref_u_wdata  = ext_load_data_i[96*`PIXEL_WIDTH-1 : 48*`PIXEL_WIDTH] ;
  assign ref_u_rden   = mc_ref_rden_i & (~mc_ref_sel_i);
  assign ref_u_raddr  = mc_ref_y;

  assign ref_v_wen    = ext_load_valid_i ;
  assign ref_v_waddr  = ext_load_addr_i  ;
  assign ref_v_wdata  = ext_load_data_i[48*`PIXEL_WIDTH-1 : 00*`PIXEL_WIDTH] ;
  assign ref_v_rden   = mc_ref_rden_i & ( mc_ref_sel_i);
  assign ref_v_raddr  = mc_ref_y;

  assign ref_data     = mc_ref_sel ? ref_v_rdata : ref_u_rdata;
  assign mc_ref_pel   = ref_data << ({mc_ref_x,3'b0});
  assign mc_ref_pel_o = mc_ref_pel[48*`PIXEL_WIDTH-1:40*`PIXEL_WIDTH];

// ********************************************
//
//    Sequential Logic
//
// ********************************************
always @ (posedge clk or negedge rstn) begin
    if (~rstn) begin
        mc_ref_x    <= 'd0;
        mc_ref_sel  <= 'd0;
    end
    else if (mc_ref_rden_i) begin
        mc_ref_x    <= mc_ref_x_i;
        mc_ref_sel  <= mc_ref_sel_i;
    end
end

  always @(posedge clk or negedge rstn ) begin
    if( !rstn )
      rotate <= 0 ;
    else if( sysif_start_i ) begin
      rotate <= !rotate ;
    end
  end

  assign ref_u_0_wen    = rotate ? ref_u_wen   : 0 ;
  assign ref_u_0_waddr  = rotate ? ref_u_waddr : 0 ;
  assign ref_u_0_wdata  = rotate ? ref_u_wdata : 0 ;
  assign ref_u_1_wen    = rotate ? 0 : ref_u_wen   ;
  assign ref_u_1_waddr  = rotate ? 0 : ref_u_waddr ;
  assign ref_u_1_wdata  = rotate ? 0 : ref_u_wdata ;

  assign ref_u_0_rden   = rotate ? 0 : ref_u_rden  ;
  assign ref_u_0_raddr  = rotate ? 0 : ref_u_raddr ;
  assign ref_u_1_rden   = rotate ? ref_u_rden  : 0 ;
  assign ref_u_1_raddr  = rotate ? ref_u_raddr : 0 ;

  assign ref_u_rdata    = rotate ? ref_u_1_rdata : ref_u_0_rdata ;

  assign ref_v_0_wen    = rotate ? ref_v_wen   : 0 ;
  assign ref_v_0_waddr  = rotate ? ref_v_waddr : 0 ;
  assign ref_v_0_wdata  = rotate ? ref_v_wdata : 0 ;
  assign ref_v_1_wen    = rotate ? 0 : ref_v_wen   ;
  assign ref_v_1_waddr  = rotate ? 0 : ref_v_waddr ;
  assign ref_v_1_wdata  = rotate ? 0 : ref_v_wdata ;

  assign ref_v_0_rden   = rotate ? 0 : ref_v_rden  ;
  assign ref_v_0_raddr  = rotate ? 0 : ref_v_raddr ;
  assign ref_v_1_rden   = rotate ? ref_v_rden  : 0 ;
  assign ref_v_1_raddr  = rotate ? ref_v_raddr : 0 ;

  assign ref_v_rdata    = rotate ? ref_v_1_rdata : ref_v_0_rdata ;


// ********************************************
//
//    mem
//
// ********************************************

wrap_ref_chroma  ref_chroma_u_0 (
    .clk            (clk         ),
    .rstn           (rstn        ),

    .wrif_en_i      (ref_u_0_wen   ),
    .wrif_addr_i    (ref_u_0_waddr ),
    .wrif_data_i    (ref_u_0_wdata ),

    .rdif_en_i      (ref_u_0_rden  ),
    .rdif_addr_i    (ref_u_0_raddr ),
    .rdif_pdata_o   (ref_u_0_rdata )
);

wrap_ref_chroma  ref_chroma_v_0 (
    .clk            (clk         ),
    .rstn           (rstn        ),

    .wrif_en_i      (ref_v_0_wen   ),
    .wrif_addr_i    (ref_v_0_waddr ),
    .wrif_data_i    (ref_v_0_wdata ),

    .rdif_en_i      (ref_v_0_rden  ),
    .rdif_addr_i    (ref_v_0_raddr ),
    .rdif_pdata_o   (ref_v_0_rdata )
);

wrap_ref_chroma  ref_chroma_u_1 (
    .clk            (clk         ),
    .rstn           (rstn        ),

    .wrif_en_i      (ref_u_1_wen   ),
    .wrif_addr_i    (ref_u_1_waddr ),
    .wrif_data_i    (ref_u_1_wdata ),

    .rdif_en_i      (ref_u_1_rden  ),
    .rdif_addr_i    (ref_u_1_raddr ),
    .rdif_pdata_o   (ref_u_1_rdata )
);

wrap_ref_chroma  ref_chroma_v_1 (
    .clk            (clk         ),
    .rstn           (rstn        ),

    .wrif_en_i      (ref_v_1_wen   ),
    .wrif_addr_i    (ref_v_1_waddr ),
    .wrif_data_i    (ref_v_1_wdata ),

    .rdif_en_i      (ref_v_1_rden  ),
    .rdif_addr_i    (ref_v_1_raddr ),
    .rdif_pdata_o   (ref_v_1_rdata )
);


endmodule

