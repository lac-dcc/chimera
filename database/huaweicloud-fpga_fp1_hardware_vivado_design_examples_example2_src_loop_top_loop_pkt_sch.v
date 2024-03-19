//
//------------------------------------------------------------------------------
//     Copyright (c) 2017 Huawei Technologies Co., Ltd. All Rights Reserved.
//
//     This program is free software; you can redistribute it and/or modify
//     it under the terms of the Huawei Software License (the "License").
//     A copy of the License is located in the "LICENSE" file accompanying 
//     this file.
//
//     This program is distributed in the hope that it will be useful,
//     but WITHOUT ANY WARRANTY; without even the implied warranty of
//     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
//     Huawei Software License for more details. 
//------------------------------------------------------------------------------


module  loop_pkt_sch (
                 //globe signals
                 input                            clk_sys                  ,
                 input                            rst                      ,

                 //with loop_bd_proc
                 input                            rltpkt_hd_wen            ,
                 input           [255:0]          rltpkt_hd_wdata          ,
                 output  wire                     rltpkt_hd_full           ,

                 //ve to ae pkt
                 output  wire                     ve2ae_txffd_rd           ,
                 input           [539:0]          ve2ae_txffd_rdata        ,
                 input                            ve2ae_txffd_ef           ,

                 //with eth
                 output  reg                      mac_dfifo_wen            ,
                 output  wire    [539:0]          mac_dfifo_wdata          ,
                 output  reg                      mac_dfifo_wend           ,
                 input   wire                     mac_dfifo_aff            ,
                 
                 output  reg                      mac_dfifo_ren            ,
                 input   wire    [539:0]          mac_dfifo_rdata          ,
                 output  reg                      mac_dfifo_reop           ,
                 output  wire                     mac_dfifo_rend           ,
                 input   wire                     mac_dfifo_ef             ,
                 input   wire                     mac_dfifo_aef            ,
                 
                 //ae to ve pkt
                 output  reg                      ae2ve_rxffd_wen          ,
                 output  wire    [539:0]          ae2ve_rxffd_wdata        ,
                 input                            ae2ve_rxffd_ff           ,

                 output                           ve2ae_txffd_reop         ,
                 output  reg                      reg_ae2ve_weop           ,
                 
                 output  reg     [3:0]            reg_pkt_sta              ,
                 output  reg     [3:0]            reg_pkt_err              ,
                 
                 //dfx
                 input                            reg_loop_port_cfg        ,
                 input           [31:0]           reg_loop_cfg         
                 );


/**********************************************************************************\
    signals
\**********************************************************************************/
wire [539:0]       ve2ae_txffd_wdata                   ;
reg  [539:0]       ve2ae_txffd_wdata_1dly              ;
reg                loop_dfifo_wen                      ;
reg                loop_dfifo_wend                     ;
wire [539:0]       loop_dfifo_wdata                    ;
wire               loop_dfifo_aff                      ;

reg  [1:0]         sel_bp_flag                         ;
reg                dfifo_aff                           ;
wire               ve2ae_txffd_wen                     ;
wire [511:0]       ve2ae_txffd_rdata_conver            ;
reg                loop_port_lock                      ;

wire               loop_dfifo_rd_en                    ;
wire [539:0]       loop_dfifo_rdata                    ;
wire               loop_dfifo_ef                       ;
wire               loop_dfifo_aef                      ;


wire               mac_dfifo_rd_en                     ;
wire               dfifo_rd_en                         ;
reg                loop_dfifo_ren                      ;
reg                loop_dfifo_ren_1dly                 ;
reg                loop_dfifo_ren_2dly                 ;
reg                mac_dfifo_ren_1dly                  ;
reg                mac_dfifo_ren_2dly                  ;
wire               dfifo_ren                           ;
reg                dfifo_ren_1dly                      ;
reg                dfifo_ren_2dly                      ;

wire               loop_dfifo_valid                    ;
wire               loop_dfifo_rend                     ;
wire               loop_dfifo_reop_pre                 ;
reg                loop_dfifo_reop                     ;
wire               mac_dfifo_valid                     ;
wire               mac_dfifo_reop_pre                  ;

reg                dfifo_weop_flag                     ;
wire               dfifo_weop                          ;
wire               loop_dfifo_wsop                     ;

wire               ae2ve_rxffd_wen_pre                 ;
wire               result_bd_fifo_ren                  ;
reg   [539:0]      ae2ve_rxffd_wdata_pre               ;
wire  [511:0]      ae2ve_rxffd_wdata_conver            ;
wire  [255:0]      result_bd_fifo_rdata                ;
wire               result_bd_fifo_ef                   ;
wire  [2:0]        reg_bp_cfg                          ;
wire               bp_flag                             ;
wire  [7:0]        reg_timer_cnt_cfg                   ; 
wire  [7:0]        reg_bp_pulse_cycle_cfg              ; 
wire  [7:0]        reg_bp_pulse_duty_cycle_cfg         ; 
wire               reg_bp_en_cfg                       ; 

wire               loop_dfifo_rerr                     ; 
wire               loop_dfifo_werr                     ; 
wire               loop_dfifo_err                      ; 
reg                ve2ae_txffd_rd_tmp                  ;

//**********************************************************************************/
// MEMORY instance
//**********************************************************************************/

syn_frm_fifo_540x512b  
                 #(
                 .UDLY                 (  1'b0                  ),
                 .REND_RETURN          (  9'd0                  ),
                 .WR_ERR_DROP_EN       (  1'b0                  ),
                 .FIFO_AF_LEVEL        (  9'd400                ),
                 .ADDR_WIDTH           (  9                     ),
                 .DATA_WIDTH           (  512                   ),
                 .MODE_WIDTH           (  6                     ),
                 .DATA_REV_WIDTH       (  20                    ),
                 .WLINE_CLASS          (  9                     ),
                 .RST_CNT_WIDTH        (  8                     ) 
                 )                                                
u_dma_dma_dff   (                                                 
                 //global                                         
                 .reset                ( rst                    ),
                 .clk                  ( clk_sys                ),
                                                                  
                 //wr interface                                   
                 .wr                   ( loop_dfifo_wen         ),
                 .wend                 ( loop_dfifo_wend        ),
                 .wdata                ( loop_dfifo_wdata       ),
                 .aff                  ( loop_dfifo_aff         ),
                 .ff                   (                        ),
                                                                  
                 //rd interface                                   
                 .rd                   ( loop_dfifo_ren         ),
                 .rend                 ( loop_dfifo_rend        ),
                 .return_cnt           ( 3'd2                   ),
                 .reop                 ( loop_dfifo_reop        ),
                 .rdata                ( loop_dfifo_rdata       ),
                 .ef                   ( loop_dfifo_ef          ),
                 .aef                  ( loop_dfifo_aef         ),
                 
                 //status signal                                  
                 .waterline            (                        ),
                 .underflow            ( loop_dfifo_rerr        ),
                 .overflow             ( loop_dfifo_werr        ),
                 .err                  ( loop_dfifo_err         ) 
                 );


sfifo_cbb_enc # (
                 .FIFO_PARITY          ( "FALSE"                ),
                 .PARITY_DLY           ( "FALSE"                ),
                 .FIFO_DO_REG          ( 0                      ),
                 .RAM_DO_REG           ( 0                      ),
                 .FIFO_ATTR            ( "ahead"                ),
                 .FIFO_WIDTH           ( 256                    ),
                 .FIFO_DEEP            ( 9                      ),
                 .AFULL_OVFL_THD       ( 450                    ),
                 .AFULL_UNFL_THD       ( 450                    ),
                 .AEMPTY_THD           ( 8                      ) 
        )
U_rd_cmd_fifo  (
                 .clk_sys              (clk_sys                 ),
                 .reset                (rst                     ),
                 .wen                  (rltpkt_hd_wen           ),
                 .wdata                (rltpkt_hd_wdata         ),
                 .ren                  (result_bd_fifo_ren      ),
                 .rdata                (result_bd_fifo_rdata    ),
                 .full                 (                        ),
                 .empty                (result_bd_fifo_ef       ),
                 .usedw                (                        ),
                 .afull                (rltpkt_hd_full          ), 
                 .aempty               (                        ),
                 .parity_err           (                        ),
                 .fifo_stat            (                        ) 
                 );


//**********************************************************************************\
//  pakect wirte process 
//**********************************************************************************/

assign reg_bp_cfg = reg_loop_cfg[2:0];

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        sel_bp_flag <= 2'b00;    
    end
    else if(reg_bp_cfg == 3'b001) begin 
        sel_bp_flag <= {1'b0,bp_flag};    
    end
    else if(reg_bp_cfg == 3'b010) begin 
        sel_bp_flag <= {bp_flag,1'b0};    
    end
    else if(reg_bp_cfg == 3'b011) begin 
        sel_bp_flag <= {bp_flag,bp_flag};    
    end
    else begin
        sel_bp_flag <= 2'b00;    
    end
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        ve2ae_txffd_rd_tmp <= 1'd0;
    end
    else if((ve2ae_txffd_ef == 1'd0)&&(dfifo_aff==1'b0) && (sel_bp_flag[0]==1'b0))begin
        ve2ae_txffd_rd_tmp <= 1'd1;
    end
    else begin
        ve2ae_txffd_rd_tmp <= 1'd0;
    end
end
assign ve2ae_txffd_rd = ve2ae_txffd_rd_tmp && (~ve2ae_txffd_ef );

assign ve2ae_txffd_wen = ve2ae_txffd_rd;

always @(posedge clk_sys or posedge rst)
begin
    if(rst ==1'b1 ) begin
        dfifo_aff <= 1'b0;
    end
    else if(reg_loop_port_cfg ==1'b0 )begin
        dfifo_aff <= loop_dfifo_aff;
    end
    else begin
        dfifo_aff <= mac_dfifo_aff;
    end
end

genvar i ;
generate
    for (i = 0; i<64; i=i+1 ) begin : BIG2LITTLE_GEN
        assign ve2ae_txffd_rdata_conver[(63-i)*8+7: (63-i)*8 ] = ve2ae_txffd_rdata[i*8+7:i*8];
    end
endgenerate

assign ve2ae_txffd_wdata =   {ve2ae_txffd_rdata[539:512], ve2ae_txffd_rdata_conver};

assign ve2ae_txffd_reop = (ve2ae_txffd_rd == 1'd1)&&(ve2ae_txffd_rdata[519] == 1'd1);

//==================================================================================
//If reg_loop_port_cfg ==0 , write to loop fifo 
//If reg_loop_port_cfg ==1 , write to eth100G   
//==================================================================================

always @(posedge clk_sys or posedge rst)
begin
    if(rst==1'b1) begin
        loop_port_lock <= 1'b0;
    end
    else if (ve2ae_txffd_reop==1'b1) begin
        loop_port_lock <= reg_loop_port_cfg ;
    end
    else ;
end

always @(posedge clk_sys or posedge rst)
begin
    if(rst==1'b1) begin
        loop_dfifo_wen <= 1'b0; 
    end
    else begin
        loop_dfifo_wen <= ve2ae_txffd_wen && (loop_port_lock == 1'b0);
    end
end

always @(posedge clk_sys or posedge rst)
begin
    if(rst==1'b1) begin
        mac_dfifo_wen <= 1'b0; 
    end
    else begin
        mac_dfifo_wen <= ve2ae_txffd_wen && (loop_port_lock == 1'b1);
    end
end

assign loop_dfifo_wdata = ve2ae_txffd_wdata_1dly;

assign mac_dfifo_wdata = ve2ae_txffd_wdata_1dly;

always @(posedge clk_sys or posedge rst)
begin
    if(rst ==1'b1) begin
        loop_dfifo_wend <= 1'b0;
    end
    else begin
        loop_dfifo_wend <= ve2ae_txffd_reop && (loop_port_lock== 1'b0);
    end
end

always @(posedge clk_sys or posedge rst)
begin
    if(rst ==1'b1) begin
        mac_dfifo_wend <= 1'b0;
    end
    else begin
        mac_dfifo_wend <= ve2ae_txffd_reop && (loop_port_lock== 1'b1);
    end
end
//==================================================================================
//  pakect read process
//  port 0: loop fifo
//  port 1: NIC 
//==================================================================================
//assign rls_bd_force_en = reg_loop_cfg[0];

assign loop_dfifo_rd_en = (~loop_dfifo_aef) | ((~loop_dfifo_ef ) & (~dfifo_ren) & (~dfifo_ren_1dly) &( ~dfifo_ren_2dly)) ;

assign mac_dfifo_rd_en = (~mac_dfifo_aef) | ((~mac_dfifo_ef ) & (~dfifo_ren) & (~dfifo_ren_1dly) &(~dfifo_ren_2dly)) ;

assign dfifo_rd_en = (~result_bd_fifo_ef) & (~ae2ve_rxffd_ff) &(~sel_bp_flag[1]) & ( (loop_dfifo_rd_en & (~loop_port_lock )) 
                                                                                            |(mac_dfifo_rd_en & loop_port_lock ));

assign dfifo_ren = loop_dfifo_ren | mac_dfifo_ren ;

always @(posedge clk_sys or posedge rst)
begin
    if(rst ==1'b1) begin
        loop_dfifo_ren <= 1'b0;
    end
    else if( dfifo_rd_en ==1'b1) begin
        loop_dfifo_ren <= (loop_port_lock==1'b0 ) ;
    end
    else if( loop_dfifo_reop_pre == 1'b1) begin
        loop_dfifo_ren <= 1'b0;
    end
    else ;
end

assign loop_dfifo_valid  = loop_dfifo_ren & loop_dfifo_ren_1dly & loop_dfifo_ren_2dly;

assign loop_dfifo_reop_pre = loop_dfifo_valid & loop_dfifo_rdata[519] ;

assign loop_dfifo_rend = loop_dfifo_reop & (~loop_dfifo_ren);

//==================================================================================
//MAC FIFO
//==================================================================================

always @(posedge clk_sys or posedge rst)
begin
    if(rst ==1'b1) begin
        mac_dfifo_ren <= 1'b0;
    end
    else if( dfifo_rd_en ==1'b1) begin
        mac_dfifo_ren <= (loop_port_lock==1'b1 ) ;
    end
    else if( mac_dfifo_reop_pre == 1'b1) begin
        mac_dfifo_ren <= 1'b0;
    end
    else ;
end

assign mac_dfifo_valid    = mac_dfifo_ren & mac_dfifo_ren_1dly & mac_dfifo_ren_2dly;
assign mac_dfifo_reop_pre = mac_dfifo_valid & mac_dfifo_rdata[519] ;
assign mac_dfifo_rend     = mac_dfifo_reop & (~mac_dfifo_ren);

always @(posedge clk_sys or posedge rst)
begin
    if(rst ==1'b1) begin
        dfifo_weop_flag <= 1'b1;
    end
    else if(dfifo_weop==1'b1 ) begin
        dfifo_weop_flag <= 1'b1;
    end
    else if(ae2ve_rxffd_wen_pre ==1'b1) begin
        dfifo_weop_flag <= 1'b0;
    end
    else ;
end

assign dfifo_weop = ((~loop_port_lock) & loop_dfifo_valid & loop_dfifo_rdata[519])
                   |(loop_port_lock & mac_dfifo_valid & mac_dfifo_rdata[519]) ;

assign loop_dfifo_wsop = dfifo_weop_flag & ae2ve_rxffd_wen_pre;

assign ae2ve_rxffd_wen_pre = loop_dfifo_valid | mac_dfifo_valid;

assign result_bd_fifo_ren = loop_dfifo_wsop;

always @(posedge clk_sys or posedge rst)
begin
    if(rst ==1'b1) begin
        ae2ve_rxffd_wen <= 1'b0;
    end
    else begin
        ae2ve_rxffd_wen <= ae2ve_rxffd_wen_pre;
    end
end

always @(posedge clk_sys)
begin
    if(loop_dfifo_wsop==1'b1) begin
        ae2ve_rxffd_wdata_pre <= {284'd0,result_bd_fifo_rdata};
    end
    else if(loop_dfifo_valid ==1'b1 ) begin
        ae2ve_rxffd_wdata_pre <= loop_dfifo_rdata ;
    end
    else begin
        ae2ve_rxffd_wdata_pre <= mac_dfifo_rdata ;
    end
end
 
generate
    for (i = 0; i<64; i=i+1 ) begin : LITTLE2BIG_GEN
        assign ae2ve_rxffd_wdata_conver[(63-i)*8+7: (63-i)*8 ] = ae2ve_rxffd_wdata_pre[i*8+7:i*8];
    end
endgenerate

assign ae2ve_rxffd_wdata = {ae2ve_rxffd_wdata_pre[539:512],ae2ve_rxffd_wdata_conver};

//==================================================================================
//pipeline
//==================================================================================
always @(posedge clk_sys )
begin
    ve2ae_txffd_wdata_1dly <= ve2ae_txffd_wdata ;
end

always @(posedge clk_sys or posedge rst)
begin
    if(rst ==1'b1) begin
        loop_dfifo_ren_1dly <= 1'b0;
        loop_dfifo_ren_2dly <= 1'b0;
    end
    else begin
        loop_dfifo_ren_1dly <= loop_dfifo_ren;
        loop_dfifo_ren_2dly <= loop_dfifo_ren_1dly;
    end
end

always @(posedge clk_sys or posedge rst)
begin
    if(rst ==1'b1) begin
        mac_dfifo_ren_1dly <= 1'b0;
        mac_dfifo_ren_2dly <= 1'b0;
    end
    else begin
        mac_dfifo_ren_1dly <= mac_dfifo_ren;
        mac_dfifo_ren_2dly <= mac_dfifo_ren_1dly;
    end
end

always @(posedge clk_sys or posedge rst)
begin
    if(rst ==1'b1) begin
        dfifo_ren_1dly <= 1'b0;
        dfifo_ren_2dly <= 1'b0;
    end
    else begin
        dfifo_ren_1dly <= dfifo_ren;
        dfifo_ren_2dly <= dfifo_ren_1dly;
    end
end

always @(posedge clk_sys or posedge rst)
begin
    if(rst ==1'b1) begin
        loop_dfifo_reop <= 1'b0;
    end
    else begin
        loop_dfifo_reop <= loop_dfifo_reop_pre;
    end
end

always @(posedge clk_sys or posedge rst)
begin
    if(rst ==1'b1) begin
        mac_dfifo_reop <= 1'b0;
    end
    else begin
        mac_dfifo_reop <= mac_dfifo_reop_pre;
    end
end

always @(posedge clk_sys or posedge rst)
begin
    if(rst ==1'b1) begin
        reg_ae2ve_weop  <= 1'b0;
    end
    else begin
        reg_ae2ve_weop  <= ae2ve_rxffd_wen&ae2ve_rxffd_wdata[519];
    end
end

always @(posedge clk_sys or posedge rst)
begin
    if(rst ==1'b1) begin
        reg_pkt_sta  <= 4'd0;
    end
    else begin
        reg_pkt_sta  <= {ve2ae_txffd_ef,result_bd_fifo_ef,ae2ve_rxffd_ff,rltpkt_hd_full};
    end
end

always @(posedge clk_sys or posedge rst)
begin
    if(rst ==1'b1) begin
        reg_pkt_err  <= 4'd0;
    end
    else begin
        reg_pkt_err  <= {loop_dfifo_rerr,loop_dfifo_werr,loop_dfifo_err,ae2ve_rxffd_ff};
    end
end

/**********************************************************************************\
  gen_bp   
\**********************************************************************************/
bp_ctrl #(
    .BP_TIMER_FROM_OUT              ( "NO"                             ) 
    )
u_bp_ctrl (
    .clks                           ( clk_sys                          ),
    .reset                          ( rst                              ),
    .timer_pulse_flg                ( 1'b0                             ),
    .reg_bp_en_cfg                  ( reg_bp_en_cfg                    ),
    .reg_bp_timer_cnt_cfg           ( reg_timer_cnt_cfg                ),
    .reg_bp_pulse_cycle_cfg         ( reg_bp_pulse_cycle_cfg           ),
    .reg_bp_pulse_duty_cycle_cfg    ( reg_bp_pulse_duty_cycle_cfg      ),
    .ctrl_bp_en                     ( bp_flag                          ) 
    );

assign reg_bp_en_cfg               = reg_loop_cfg[4];
assign reg_timer_cnt_cfg           = reg_loop_cfg[15:8]; 
assign reg_bp_pulse_cycle_cfg      = reg_loop_cfg[23:16];
assign reg_bp_pulse_duty_cycle_cfg = reg_loop_cfg[31:24];

endmodule
