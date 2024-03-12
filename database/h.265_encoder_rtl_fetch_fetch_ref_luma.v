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
//  Filename      : fetch_ref_luma.v
//  Author        : Yufeng Bai
//  Email 	  : byfchina@gmail.com	
//
//-------------------------------------------------------------------
//
//  Modified      : 2015-08-20 by HLL
//  Description   : fme_ref_x and fime_ref_x logic corrected
//  Modified      : 2015-09-02 by HLL
//  Description   : rotate by sys_start_i
//
//-------------------------------------------------------------------

`include "enc_defines.v"

module fetch_ref_luma (
	clk		        ,
	rstn		        ,
  sysif_start_i    ,
        sysif_total_y_i         ,

        fime_cur_y_i            ,
	fime_ref_x_i		,
	fime_ref_y_i		,
	fime_ref_rden_i		,
	fime_ref_pel_o		,
        fme_cur_y_i             ,
	fme_ref_x_i		,
	fme_ref_y_i		,
	fme_ref_rden_i		,
	fme_ref_pel_o		,
	ext_load_done_i		,
	ext_load_data_i		,
	ext_load_addr_i		,
	ext_load_valid_i	
);

// ********************************************
//
//    INPUT / OUTPUT DECLARATION
//
// ********************************************

input 	 [1-1:0] 	        clk 	            ; // clk signal 
input 	 [1-1:0] 	        rstn 	            ; // asynchronous reset 
input                     sysif_start_i    ;
input    [`PIC_Y_WIDTH-1:0]     sysif_total_y_i     ;

input    [`PIC_Y_WIDTH-1:0]     fime_cur_y_i        ;
input 	 [8-1:0] 	        fime_ref_x_i 	    ; // fime ref x 
input 	 [8-1:0] 	        fime_ref_y_i 	    ; // fime ref y 
input 	 [1-1:0] 	        fime_ref_rden_i     ; // fime ref read enable 
output 	 [64*`PIXEL_WIDTH-1:0] 	fime_ref_pel_o      ; // fime ref pixel 

input    [`PIC_Y_WIDTH-1:0]     fme_cur_y_i         ;
input 	 [7-1:0] 	        fme_ref_x_i 	    ; // fme ref x 
input 	 [7-1:0] 	        fme_ref_y_i 	    ; // fme ref y 
input 	 [1-1:0] 	        fme_ref_rden_i 	    ; // fme ref read enable 
output 	 [64*`PIXEL_WIDTH-1:0] 	fme_ref_pel_o 	    ; // fme ref pixel 
input 	 [1-1:0] 	        ext_load_done_i     ; // load current lcu done 
input 	 [96*`PIXEL_WIDTH-1:0] 	ext_load_data_i     ; // load current lcu data 
input    [7-1:0]                ext_load_addr_i     ;
input 	 [1-1:0] 	        ext_load_valid_i    ; // load current lcu data valid 

// ********************************************
//
//    WIRE / REG DECLARATION
//
// ********************************************

reg      [2-1:0]               rotate_cnt           ;
//reg      [7-1:0]               ext_load_addr_i        ; 

reg      [1-1:0]               ref_luma_00_wen      ;   
reg      [7-1:0]               ref_luma_00_waddr    ;
reg      [96*`PIXEL_WIDTH-1:0] ref_luma_00_wdata    ;
reg      [1-1:0]               ref_luma_00_rden     ;
reg      [7-1:0]               ref_luma_00_raddr    ;
wire     [96*`PIXEL_WIDTH-1:0] ref_luma_00_rdata    ;

reg     [1-1:0]                ref_luma_01_wen      ;   
reg     [7-1:0]                ref_luma_01_waddr    ;
reg     [96*`PIXEL_WIDTH-1:0]  ref_luma_01_wdata    ;
reg     [1-1:0]                ref_luma_01_rden     ;
reg     [7-1:0]                ref_luma_01_raddr    ;
wire    [96*`PIXEL_WIDTH-1:0]  ref_luma_01_rdata    ;

reg     [1-1:0]                ref_luma_02_wen      ;   
reg     [7-1:0]                ref_luma_02_waddr    ;
reg     [96*`PIXEL_WIDTH-1:0]  ref_luma_02_wdata    ;
reg     [1-1:0]                ref_luma_02_rden     ;
reg     [7-1:0]                ref_luma_02_raddr    ;
wire    [96*`PIXEL_WIDTH-1:0]  ref_luma_02_rdata    ;


reg     [96*`PIXEL_WIDTH-1:0]  fime_ref_pel         ;
reg     [96*`PIXEL_WIDTH-1:0]  fme_ref_pel          ;


reg 	 [7-1:0] 	       fime_ref_y           ; // fime ref y 
reg 	 [7-1:0] 	       fme_ref_y            ; // fme ref y 
reg 	 [8-1:0] 	       fime_ref_x 	    ; // fime ref x 
reg 	 [8-1:0] 	       fme_ref_x 	    ; // fime ref x 

// ********************************************
//
//    Alias Logic
//
// ********************************************

assign fime_ref_pel_o = fime_ref_pel[92*`PIXEL_WIDTH-1 : 28*`PIXEL_WIDTH];
assign fme_ref_pel_o  = fme_ref_pel [96*`PIXEL_WIDTH-1 : 32*`PIXEL_WIDTH];


// ********************************************
//
//    Sequential Logic
//
// ********************************************

  always @ (posedge clk or negedge rstn) begin
    if (~rstn) begin
      fime_ref_x <= 'd0;
      fme_ref_x <= 'd0;
    end
    else begin
      fime_ref_x <= fime_ref_x_i;
      fme_ref_x  <= fme_ref_x_i;
    end
  end

  always @ (posedge clk or negedge rstn) begin
    if( !rstn )
      rotate_cnt <= 0 ;
    else if( sysif_start_i ) begin
      if( rotate_cnt == 2 )
        rotate_cnt <= 0 ;
      else begin
        rotate_cnt <= rotate_cnt + 1 ;
      end
    end
  end

/*
always @ (posedge clk or negedge rstn) begin
    if (~rstn) begin
        ext_load_addr <= 'd0;
    end
    else if (ext_load_done_i) begin
        ext_load_addr <= 'd0;
    end
    else if (ext_load_valid_i) begin
        ext_load_addr <= ext_load_addr + 'd1;
    end
end
*/

// ********************************************
//
//    Sel Logic
//
// ********************************************

always @ (*) begin
    if(fime_cur_y_i  == 'd0)
        fime_ref_y = (fime_ref_y_i < 'd12) ? 'd0 : (fime_ref_y_i - 12);
    else if(fime_cur_y_i  == sysif_total_y_i)
        fime_ref_y = (fime_ref_y_i >= 'd76) ? 'd79 : (fime_ref_y_i + 4);
    else
        fime_ref_y = fime_ref_y_i + 4;
end
    
always @ (*) begin
    if(fme_cur_y_i  == 'd0)
        fme_ref_y = (fme_ref_y_i < 'd16) ? 'd0 : (fme_ref_y_i - 16);
    else if(fme_cur_y_i  == sysif_total_y_i)
        fme_ref_y = (fme_ref_y_i >= 'd80) ? 'd79 : fme_ref_y_i;
    else
        fme_ref_y = fme_ref_y_i;
end


always @ (*) begin
    case(rotate_cnt) 
    'd0: begin
        ref_luma_00_wen     = ext_load_valid_i;
        ref_luma_00_waddr   = ext_load_addr_i;   
        ref_luma_00_wdata   = ext_load_data_i; 
        ref_luma_00_rden    = 'b0;
        ref_luma_00_raddr   = 'b0;
        
        ref_luma_01_wen     = 'b0;
        ref_luma_01_waddr   = 'b0;   
        ref_luma_01_wdata   = 'b0; 
        ref_luma_01_rden    = fme_ref_rden_i;
        ref_luma_01_raddr   = fme_ref_y;
        
        ref_luma_02_wen     = 'b0;
        ref_luma_02_waddr   = 'b0;   
        ref_luma_02_wdata   = 'b0; 
        ref_luma_02_rden    = fime_ref_rden_i;
        ref_luma_02_raddr   = fime_ref_y;

        fime_ref_pel        = ref_luma_02_rdata << ({fime_ref_x,3'b0});
        fme_ref_pel         = ref_luma_01_rdata << ({fme_ref_x,3'b0} );
    end
    'd1: begin
        ref_luma_00_wen     = 'b0;           
        ref_luma_00_waddr   = 'b0;           
        ref_luma_00_wdata   = 'b0;           
        ref_luma_00_rden    = fime_ref_rden_i;
        ref_luma_00_raddr   = fime_ref_y;   
        
        ref_luma_01_wen     = ext_load_valid_i;
        ref_luma_01_waddr   = ext_load_addr_i;     
        ref_luma_01_wdata   = ext_load_data_i; 
        ref_luma_01_rden    = 'b0;             
        ref_luma_01_raddr   = 'b0;             
        
        ref_luma_02_wen     = 'b0;            
        ref_luma_02_waddr   = 'b0;               
        ref_luma_02_wdata   = 'b0;             
        ref_luma_02_rden    = fme_ref_rden_i;
        ref_luma_02_raddr   = fme_ref_y;   

        fime_ref_pel        = ref_luma_00_rdata << ({fime_ref_x,3'b0});
        fme_ref_pel         = ref_luma_02_rdata << ({fme_ref_x,3'b0} );
    end
    'd2: begin
        ref_luma_00_wen     = 'b0;            
        ref_luma_00_waddr   = 'b0;               
        ref_luma_00_wdata   = 'b0;             
        ref_luma_00_rden    = fme_ref_rden_i;
        ref_luma_00_raddr   = fme_ref_y;   

        ref_luma_01_wen     = 'b0;           
        ref_luma_01_waddr   = 'b0;           
        ref_luma_01_wdata   = 'b0;           
        ref_luma_01_rden    = fime_ref_rden_i;
        ref_luma_01_raddr   = fime_ref_y;   
        
        ref_luma_02_wen     = ext_load_valid_i;
        ref_luma_02_waddr   = ext_load_addr_i;     
        ref_luma_02_wdata   = ext_load_data_i; 
        ref_luma_02_rden    = 'b0;             
        ref_luma_02_raddr   = 'b0;             

        fime_ref_pel        = ref_luma_01_rdata << ({fime_ref_x,3'b0});
        fme_ref_pel         = ref_luma_00_rdata << ({fme_ref_x,3'b0} );
    end
    default: begin
        ref_luma_00_wen     = 'b0;            
        ref_luma_00_waddr   = 'b0;               
        ref_luma_00_wdata   = 'b0;             
        ref_luma_00_rden    = 'b0;
        ref_luma_00_raddr   = 'b0;

        ref_luma_01_wen     = 'b0;           
        ref_luma_01_waddr   = 'b0;           
        ref_luma_01_wdata   = 'b0;           
        ref_luma_01_rden    = 'b0;
        ref_luma_01_raddr   = 'b0;
        
        ref_luma_02_wen     = 'b0;
        ref_luma_02_waddr   = 'b0; 
        ref_luma_02_wdata   = 'b0;
        ref_luma_02_rden    = 'b0;             
        ref_luma_02_raddr   = 'b0;

		fime_ref_pel        = 'b0;
		fme_ref_pel         = 'b0;
    end
    endcase
end


// ********************************************
//
//   mem wrapper
//
// ********************************************


wrap_ref_luma  ref_luma_00(
    .clk            (clk         ),
    .rstn           (rstn        ),
                                 
    .wrif_en_i      (ref_luma_00_wen   ),
    .wrif_addr_i    (ref_luma_00_waddr ),
    .wrif_data_i    (ref_luma_00_wdata ),
                                 
    .rdif_en_i      (ref_luma_00_rden  ),
    .rdif_addr_i    (ref_luma_00_raddr ),
    .rdif_pdata_o   (ref_luma_00_rdata )     
);

wrap_ref_luma  ref_luma_01(
    .clk            (clk         ),
    .rstn           (rstn        ),
                                 
    .wrif_en_i      (ref_luma_01_wen   ),
    .wrif_addr_i    (ref_luma_01_waddr ),
    .wrif_data_i    (ref_luma_01_wdata ),
                                
    .rdif_en_i      (ref_luma_01_rden  ),
    .rdif_addr_i    (ref_luma_01_raddr ),
    .rdif_pdata_o   (ref_luma_01_rdata )     
);

wrap_ref_luma  ref_luma_02(
    .clk            (clk         ),
    .rstn           (rstn        ),
                                 
    .wrif_en_i      (ref_luma_02_wen   ),
    .wrif_addr_i    (ref_luma_02_waddr ),
    .wrif_data_i    (ref_luma_02_wdata ),
                               
    .rdif_en_i      (ref_luma_02_rden  ),
    .rdif_addr_i    (ref_luma_02_raddr ),
    .rdif_pdata_o   (ref_luma_02_rdata )     
);

endmodule

