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

`resetall
`timescale 1ns/1ns
module smt_con_rx
   (
     input                            aclk                               ,
     input                            areset                             , 
    
     //mmu axi4 read addr 	                                           
     input        [3:0]               mmu_arid                           ,  
     input        [63:0]              mmu_araddr                         ,
     input        [7:0]               mmu_arlen                          ,
     input        [2:0]               mmu_arsize                         ,
     input                            mmu_arvalid                        ,
     output                           mmu_arready                        ,

     //mmu axi4 read data 	                                          
     output       [3:0]               mmu_rid                            ,
     output       [511:0]             mmu_rdata                          ,
     output       [1:0]               mmu_rresp                          ,
     output                           mmu_rlast                          ,
     output                           mmu_rvalid                         ,
     input                            mmu_rready                         ,               
     
     //knl axi4 read addr 	                                          
     input        [3:0]               knl_arid                           ,  
     input        [63:0]              knl_araddr                         ,
     input        [7:0]               knl_arlen                          ,
     input        [2:0]               knl_arsize                         ,
     input                            knl_arvalid                        ,
     output                           knl_arready                        ,

     //mmu axi4 read data 	                                       
     output       [3:0]               knl_rid                            ,
     output       [511:0]             knl_rdata                          ,
     output       [1:0]               knl_rresp                          ,
     output                           knl_rlast                          ,
     output                           knl_rvalid                         ,
     input                            knl_rready                         ,               
     
     //ddr axi4 read addr 	                                          
     output reg   [3:0]               ddr_arid                           ,  
     output reg   [63:0]              ddr_araddr                         ,
     output reg   [7:0]               ddr_arlen                          ,
     output reg   [2:0]               ddr_arsize                         ,
     output reg                       ddr_arvalid                        ,
     input                            ddr_arready                        ,

     //ddr axi4 read data 	                                    
     input        [3:0]               ddr_rid                            ,
     input        [511:0]             ddr_rdata                          ,
     input        [1:0]               ddr_rresp                          ,
     input                            ddr_rlast                          ,
     input                            ddr_rvalid                         ,
     output reg                       ddr_rready                         ,
     
     //with cpu
     input        [31:0]              reg_cont_rd_cfg                    ,
     output       [31:0]              reg_cont_rd_err                    ,
     output       [31:0]              reg_cont_rd_sta                    ,
     output                           reg_cont_rcmd_en                   ,
     output                           reg_cont_rpkt_en                 
     
     
   );
/******************************************************************************\
                            signal 
\******************************************************************************/
reg       [1:0]                   tb_rr2_nef              ;
wire                              tb_rr2_req              ;
reg                               tb_rr2_req_1dly         ;
reg                               tb_rr2_req_2dly         ;
wire                              tb_rr2_qnum             ;
 
wire                              rcmd_ff_full            ;      
reg                               rcmd_ff_wen             ;
reg       [85:0]                  rcmd_ff_wdata           ;
reg       [81:0]                  mmu_wdata               ;
reg       [81:0]                  knl_wdata               ;
reg       [81:0]                  mmu_wdata_1dly          ;
reg       [81:0]                  knl_wdata_1dly          ;
   
wire                              rcmd_ff_emp             ;    
wire                              rcmd_ff_ren             ;
wire      [85:0]                  rcmd_ff_rdata           ;

wire                              chn_seq_wen             ;
wire                              chn_seq_wdata           ;
wire                              chn_seq_full            ;
                 
reg                               chn_seq_ren             ; 
wire                              chn_seq_rdata           ;
wire                              chn_id                  ;
wire                              chn_seq_empty           ;

wire      [1:0]                   pkt_back_full           ;       
reg       [1:0]                   pkt_back_wen            ;
reg       [539:0]                 pkt_back_wdata_pre      ; 
reg       [539:0]                 pkt_back_wdata          ; 
wire      [27:0]                  rdata_rev               ;    

wire      [1:0]                   pkt_back_empty          ;              
wire      [1:0]                   pkt_back_rd             ;       
wire      [540*2-1:0]             pkt_back_rdata          ;

wire      [1:0]                   rready_tmp              ; 
wire      [1:0]                   rvalid_tmp              ; 
wire      [1:0]                   rlast_tmp               ; 
wire      [511:0]                 rdata_tmp[1:0]          ; 
wire      [3:0]                   rid_tmp[1:0]            ; 
wire      [1:0]                   rresp_tmp[1:0]          ; 
wire                              chn_seq_parity_err      ;
wire      [7:0]                   chn_seq_fifo_stat       ;
wire                              rcmd_emp_full_err       ;
wire      [1:0]                   empty_full_err          ; 
wire                              ddr_rdata_time_out      ;
wire                              knl_raddr_time_out      ;
wire                              mmu_raddr_time_out      ;
wire      [15:0]                  reg_tmout_us_cfg        ;   
reg                               ddr_rready_pre          ;                       
reg                               ddr_rlast_1dly          ;
reg                               ddr_rvalid_1dly         ;
reg                               ddr_rready_1dly         ;

genvar i ;
genvar j ;

/******************************************************************************\
                            process
\******************************************************************************/
//==================================================================================
// axi4 read ctrl 
//==================================================================================
always@(posedge aclk or posedge areset)
begin
    if(areset == 1'd1)begin
        tb_rr2_nef <= 2'd0;
    end
    else begin
        tb_rr2_nef <= {mmu_arvalid,knl_arvalid};
    end
end

assign tb_rr2_req = (~rcmd_ff_full)&(|tb_rr2_nef)&(~chn_seq_full)
                    &(~tb_rr2_req_1dly)&(~tb_rr2_req_2dly);

always@(posedge aclk or posedge areset)
begin
    if(areset == 1'd1)begin
        tb_rr2_req_1dly <= 1'b0;
        tb_rr2_req_2dly <= 1'b0;
    end
    else begin
        tb_rr2_req_1dly <= tb_rr2_req;
        tb_rr2_req_2dly <= tb_rr2_req_1dly;
    end
end

assign knl_arready = ((tb_rr2_qnum==1'b0)&&(tb_rr2_req_1dly==1'b1));
assign mmu_arready = ((tb_rr2_qnum==1'b1)&&(tb_rr2_req_1dly==1'b1));

always@(posedge aclk or posedge areset)
begin
    if(areset == 1'd1)begin
        rcmd_ff_wen <= 1'b0;
    end
    else begin
        rcmd_ff_wen <= tb_rr2_req_1dly;
    end
end

always@(posedge aclk)
begin
    mmu_wdata <= {3'd0,mmu_arlen,mmu_arsize,mmu_arid,mmu_araddr};
    knl_wdata <= {3'd0,knl_arlen,knl_arsize,knl_arid,knl_araddr};
end

always@(posedge aclk)
begin
    mmu_wdata_1dly <= mmu_wdata;
    knl_wdata_1dly <= knl_wdata;
end

always@(posedge aclk)
begin
    if(tb_rr2_qnum == 1'b0)begin
        rcmd_ff_wdata <= {4'd8,knl_wdata_1dly};
    end
    else begin
        rcmd_ff_wdata <= {4'd8,mmu_wdata_1dly};
    end
end

assign rcmd_ff_ren = ddr_arvalid & ddr_arready;

always @( posedge aclk or posedge areset )
begin
    if ( areset == 1'b1 ) begin
        ddr_arvalid <= 1'b0;
    end
    else if (rcmd_ff_ren == 1'b1 ) begin
        ddr_arvalid <= 1'b0;
    end
    else if (rcmd_ff_emp == 1'b0 ) begin
        ddr_arvalid <= 1'b1;
    end
    else;
end

always @( posedge aclk )
begin
    ddr_araddr <= rcmd_ff_rdata[63:0];
end

always @( posedge aclk )
begin
    ddr_arid <= rcmd_ff_rdata[67:64];
end

always @( posedge aclk )
begin
    ddr_arsize <= rcmd_ff_rdata[70:68];
end

always @( posedge aclk )
begin
    ddr_arlen  <= rcmd_ff_rdata[78:71];
end

assign chn_seq_wen   = tb_rr2_req_1dly;
assign chn_seq_wdata = tb_rr2_qnum;

//==================================================================================
// axi4 read data 
//==================================================================================
always @( posedge aclk or posedge areset )
begin
    if ( areset == 1'b1 ) begin
        chn_seq_ren <= 1'b0;
    end
    else begin
        chn_seq_ren <= (ddr_rlast&ddr_rready) & (~chn_seq_empty);
    end
end

assign chn_id = chn_seq_rdata;

always @( posedge aclk or posedge areset )
begin
    if ( areset == 1'b1 ) begin
        ddr_rready_pre <= 1'b0;
        ddr_rready     <= 1'b0;
        ddr_rready_1dly <= 1'b0;
    end
    else begin
        ddr_rready_pre <= ~(|pkt_back_full);
        ddr_rready     <= ddr_rready_pre;
        ddr_rready_1dly <= ddr_rready;
    end
end
always @( posedge aclk or posedge areset )
begin
    if ( areset == 1'b1 ) begin
        ddr_rvalid_1dly <= 1'b0;
        ddr_rlast_1dly  <= 1'b0;
    end
    else begin
        ddr_rvalid_1dly <= ddr_rvalid;
        ddr_rlast_1dly  <= ddr_rlast;
    end
end

assign rdata_rev = {ddr_rid,ddr_rresp,14'd0,ddr_rlast,7'd0};

always @( posedge aclk )
begin
    pkt_back_wdata_pre <= {rdata_rev,ddr_rdata};
    pkt_back_wdata     <= pkt_back_wdata_pre;
end

assign rready_tmp = {mmu_rready,knl_rready};

generate
    for (i = 0; i<2; i=i+1 ) begin : GEN_PKT_BACK_WEN
    
    
    always@(posedge aclk or posedge areset)
    begin
        if(areset == 1'd1)begin
            pkt_back_wen[i] <= 1'b0;
        end
        else if (chn_id == i) begin
            pkt_back_wen[i] <= (ddr_rvalid_1dly | ddr_rlast_1dly) & ddr_rready_1dly;
        end
        else begin
            pkt_back_wen[i] <= 1'b0;
        end
    end

    assign pkt_back_rd[i] = rvalid_tmp[i]&rready_tmp[i]; 

    assign rvalid_tmp[i]  = ~pkt_back_empty[i];

    assign rlast_tmp[i]   = pkt_back_rdata[540*i+519];
    
    assign rid_tmp[i]     = pkt_back_rdata[540*i+539:540*i+536];
    assign rresp_tmp[i]   = pkt_back_rdata[540*i+535:540*i+534];
    assign rdata_tmp[i]   = pkt_back_rdata[540*i+511:540*i];

    end
endgenerate

assign knl_rvalid = rvalid_tmp[0];
assign mmu_rvalid = rvalid_tmp[1];

assign knl_rlast  = rlast_tmp[0];
assign mmu_rlast  = rlast_tmp[1];

assign knl_rresp   = rresp_tmp[0];
assign mmu_rresp   = rresp_tmp[0];

assign knl_rid    = rid_tmp[0];
assign mmu_rid    = rid_tmp[1];
assign knl_rdata  = rdata_tmp[0];
assign mmu_rdata  = rdata_tmp[1];
//==================================================================================
// dfx  
//==================================================================================
assign reg_tmout_us_cfg    = reg_cont_rd_cfg[15:0]; 
assign reg_cont_rd_err     = {17'd0,chn_seq_fifo_stat,ddr_rdata_time_out,knl_raddr_time_out,mmu_raddr_time_out,
                              empty_full_err,chn_seq_parity_err,rcmd_emp_full_err};
assign reg_cont_rd_sta     = {22'd0,pkt_back_full,pkt_back_empty,chn_seq_full,chn_seq_empty,rcmd_ff_full,rcmd_ff_emp,tb_rr2_nef};
assign reg_cont_rcmd_en    = rcmd_ff_wen;
assign reg_cont_rpkt_en    = pkt_back_wdata[519]&(|pkt_back_wen);

/******************************************************************************\
                            instance
\******************************************************************************/
rr2 u_rr2_p1
    (
    //clock and reset signal
       .clks                  (aclk                ),   
       .reset                 (areset              ),   
       .req                   (tb_rr2_nef          ),   
       .req_vld               (tb_rr2_req          ),   
       .rr_bit                (tb_rr2_qnum         )
    );

axi_time_out u_mmu_raddr_tmout
     (
      .clks               ( aclk            ),
      .reset              ( areset          ),
      
      .vld_in             ( mmu_rvalid      ),
      .ready_in           ( mmu_rready      ),
      .reg_tmout_us_cfg   ( reg_tmout_us_cfg),
      .time_out           ( mmu_raddr_time_out  )
    );

axi_time_out u_knl_raddr_tmout
     (
      .clks               ( aclk            ),
      .reset              ( areset          ),
      
      .vld_in             ( knl_rvalid      ),
      .ready_in           ( knl_rready      ),
      .reg_tmout_us_cfg   ( reg_tmout_us_cfg),
      .time_out           ( knl_raddr_time_out  )
    );

axi_time_out u_ddr_rdata_tmout
     (
      .clks               ( aclk            ),
      .reset              ( areset          ),
      
      .vld_in             ( ddr_arvalid     ),
      .ready_in           ( ddr_arready     ),
      .reg_tmout_us_cfg   ( reg_tmout_us_cfg),
      .time_out           ( ddr_rdata_time_out  )
    );

asyn_frm_fifo_288x512_sa
    #(
    .DATA_WIDTH         ( 86                ),
    .ADDR_WIDTH         ( 9                 ),
    .EOP_POS            ( 85                ),
    .ERR_POS            ( 84                ),
    .FULL_LEVEL         ( 400               ),
    .ERR_DROP           ( 1'b1              )
    )
u_rcmd_ff
    (
    .rd_clk             ( aclk              ),
    .rd_rst             ( areset            ),
    .wr_clk             ( aclk              ),
    .wr_rst             ( areset            ),
    .wr                 ( rcmd_ff_wen       ),
    .wdata              ( rcmd_ff_wdata     ),
    .wafull             ( rcmd_ff_full      ),
    .wr_data_cnt        (                   ),
    .rd                 ( rcmd_ff_ren       ),
    .rdata              ( rcmd_ff_rdata     ),
    .rempty             ( rcmd_ff_emp       ),
    .rd_data_cnt        (                   ),
    .empty_full_err     (rcmd_emp_full_err  )
    );

sfifo_cbb_enc # (
        .FIFO_PARITY       ( "FALSE"               ),
        .PARITY_DLY        ( "FALSE"               ),
        .FIFO_DO_REG       ( 0                     ), 
        .RAM_DO_REG        ( 0                     ),
        .FIFO_ATTR         ( "ahead"               ),
        .FIFO_WIDTH        ( 1                     ),
        .FIFO_DEEP         ( 9                     ),
        .AFULL_OVFL_THD    ( 450                   ),
        .AFULL_UNFL_THD    ( 450                   ),
        .AEMPTY_THD        ( 8                     ) 
        )
u_chn_seq_fifo (
        .clk_sys           (aclk                   ),
        .reset             (areset                 ),
        .wen               (chn_seq_wen            ),
        .wdata             (chn_seq_wdata          ),
        .ren               (chn_seq_ren            ),
        .rdata             (chn_seq_rdata          ),
        .full              (                       ),
        .empty             (chn_seq_empty          ),
        .usedw             (                       ),
        .afull             (chn_seq_full           ), 
        .aempty            (                       ),
        .parity_err        (chn_seq_parity_err     ),
        .fifo_stat         (chn_seq_fifo_stat      ) 
        );
    
generate
    for (j = 0; j<2; j=j+1 ) begin : GEN_ASYN_FRM_FIFO
    
    asyn_frm_fifo_288x512_sa
        #(
        .DATA_WIDTH         ( 540               ),
        .ADDR_WIDTH         ( 9                 ),
        .EOP_POS            ( 519               ),
        .ERR_POS            ( 518               ),
        .FULL_LEVEL         ( 400               ),
        .ERR_DROP           ( 1'b1              )
        )
    u_mmu_pkt_txff
        (
        .rd_clk             ( aclk              ),
        .rd_rst             ( areset            ),
        .wr_clk             ( aclk              ),
        .wr_rst             ( areset            ),
        .wr                 ( pkt_back_wen[j]   ),
        .wdata              ( pkt_back_wdata    ),
        .wafull             ( pkt_back_full[j]  ),
        .wr_data_cnt        (                   ),
        .rd                 ( pkt_back_rd[j]    ),
        .rdata              ( pkt_back_rdata[540*(j+1)-1:540*j]),
        .rempty             ( pkt_back_empty[j] ),
        .rd_data_cnt        (                   ),
        .empty_full_err     ( empty_full_err[j] )
        );
    
    end
endgenerate
  
endmodule        
