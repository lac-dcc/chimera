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

module mmu_tx_pkt
    #(
    parameter         A_WTH                  = 24,
    parameter         D_WTH                  = 32,
    parameter         MAX_DDR_NUM            = 4 ,
    parameter         DDR_NUM                = 4   
          
    )
    (

    //globle signal                      
    input    wire                            clk_sys                           ,  
    input    wire                            rst                               ,

    //receive hard acc & pkt : axi stream interface
    input    wire    [511:0]                 sh2ul_dmam1_tdata                 , 
    input    wire    [74:0]                  sh2ul_dmam1_tuser                 ,
    input    wire                            sh2ul_dmam1_tlast                 ,
    input    wire    [63:0]                  sh2ul_dmam1_tkeep                 ,
    input    wire                            sh2ul_dmam1_tvalid                ,
    output   wire                            ul2sh_dmam1_tready                ,

    //send pkt to ddr : axi 4 interface
    //wr ddra
    output   wire    [4*DDR_NUM-1:0]         axi4_m2s_awid                     ,
    output   wire    [64*DDR_NUM-1:0]        axi4_m2s_awaddr                   ,
    output   wire    [8*DDR_NUM-1:0]         axi4_m2s_awlen                    ,
    output   wire    [3*DDR_NUM-1:0]         axi4_m2s_awsize                   ,
    output   wire    [8*DDR_NUM-1:0]         axi4_m2s_awuser                   ,
                                             
    output   wire    [1*DDR_NUM-1:0]         axi4_m2s_awvalid                  ,
    input    wire    [1*DDR_NUM-1:0]         axi4_s2m_awready                  ,
    
    output   wire    [4*DDR_NUM-1:0]         axi4_m2s_wid                      ,
    output   wire    [512*DDR_NUM-1:0]       axi4_m2s_wdata                    ,
    output   wire    [64*DDR_NUM-1:0]        axi4_m2s_wstrb                    ,
    output   wire    [1*DDR_NUM-1:0]         axi4_m2s_wlast                    ,
    output   wire    [1*DDR_NUM-1:0]         axi4_m2s_wvalid                   ,
    input    wire    [1*DDR_NUM-1:0]         axi4_s2m_wready                   ,
                                             
    input    wire    [4*DDR_NUM-1:0]         axi4_s2m_bid                      ,
    input    wire    [2*DDR_NUM-1:0]         axi4_s2m_bresp                    ,
    input    wire    [1*DDR_NUM-1:0]         axi4_s2m_bvalid                   ,
    output   wire    [1*DDR_NUM-1:0]         axi4_m2s_bready                   ,
    
    //interface with mmu_tx_bd
    //fpga ddr sa, da 
    output   reg                             hacc_wr                           ,
    output   reg     [8:0]                   hacc_waddr                        ,
    output   reg     [87:0]                  hacc_wdata                        ,

    //online cnt feedback
    output   reg                             online_feedback_en                ,

    //wr ddr response
    output   reg                             wr_ddr_rsp_en                     ,
    output   reg     [10:0]                  wr_ddr_rsp_sn                     ,

    //err, status, cnt 
    input    wire    [15:0]                  reg_cfg_bid_id                    ,
    output   reg     [10:0]                  reg_hacc_sn                       ,
    output   reg     [35:0]                  reg_hacc_ddr_saddr                ,
    output   reg     [35:0]                  reg_hacc_ddr_daddr                ,
    output   reg     [64*MAX_DDR_NUM-1:0]    reg_ddr_wr_addr                   ,
    output   reg     [8*MAX_DDR_NUM-1:0]     reg_ddr_wr_length                 ,
    output   reg     [10:0]                  reg_ddr_rsp_sn                    ,
    output   reg     [2:0]                   reg_seq_info                      ,

    output   reg                             reg_axis_receive_cnt_en           ,
    output   reg                             reg_hacc_receive_cnt_en           ,
    output   reg                             reg_pkt_receive_cnt_en            ,
    output   reg     [1*MAX_DDR_NUM-1:0]     reg_axi4_send_slice_cnt_en        ,
    output   reg     [1*MAX_DDR_NUM-1:0]     reg_axi4_send_ok_cnt_en           ,
    output   reg     [1*MAX_DDR_NUM-1:0]     reg_ddr_rsp_ok_cnt_en             ,
    output   reg     [1*MAX_DDR_NUM-1:0]     reg_axi4_send_wlast_cnt_en        ,

    output   reg     [31:0]                  reg_mmu_tx_pkt_sta                ,
    output   reg     [31:0]                  reg_mmu_tx_pkt_err                                                        

   );
/******************************************************************************\
    inter signal
\******************************************************************************/
wire                           pkt_fifo_wdata_pre_eop                   ;
wire                           hacc_flag_bit                            ;
wire                           soc_bit                                  ;
wire                           eoc_bit                                  ;
reg                            rd_ddr_rsp_en                            ;
reg                            rd_ddr_rsp_en_1dly                       ;
reg   [10:0]                   rd_ddr_rsp_sn                            ;
reg   [10:0]                   rd_ddr_rsp_sn_1dly                       ;

reg                            pkt_sop_lock                             ;
wire                           pkt_fifo_wr_pre                          ;
reg                            pkt_fifo_wr_pre_1dly                     ;
wire  [539:0]                  pkt_fifo_wdata_pre                       ;
reg   [539:0]                  pkt_fifo_wdata_pre_1dly                  ;
wire                           pkt_fifo_wdata_pre_sop                   ;
reg                            pkt_fifo_wdata_sop                       ;
reg                            hacc_flag                                ;
reg   [8:0]                    hacc_sn                                  ;
reg   [1:0]                    opcode                                   ;
reg   [10:0]                   sn_wdata_lock                            ;
reg                            pkt_slice_sop                            ;
reg                            pkt_slice_sop_1dly                       ;
reg                            pkt_slice_soc                            ;
reg                            pkt_slice_eoc                            ;
reg   [12:0]                   pkt_slice_length                         ;

reg                            ddr_info_fifo_wr_pre                     ;
wire  [1*DDR_NUM-1:0]          ddr_info_fifo_wr                         ;
wire  [53:0]                   ddr_info_fifo_wdata                      ;
wire  [1*DDR_NUM-1:0]          ddr_info_fifo_ff                         ;
reg   [1:0]                    pkt_slice_saddr_h2b                      ;
reg   [20:0]                   pkt_slice_saddr_m21b                     ;
reg   [12:0]                   pkt_slice_saddr_l13b                     ;
wire  [35:0]                   pkt_slice_saddr                          ;

wire  [1*DDR_NUM-1:0]          pkt_fifo_wr                              ;
wire  [539:0]                  pkt_fifo_wdata                           ;
wire  [1*DDR_NUM-1:0]          pkt_fifo_ff                              ;

wire  [1*DDR_NUM-1:0]          pkt_fifo_rd                              ;
wire  [539:0]                  pkt_fifo_rdata           [DDR_NUM-1:0]   ;
wire  [1*DDR_NUM-1:0]          pkt_fifo_ef                              ;
wire  [1*DDR_NUM-1:0]          pkt_fifo_err                             ;
wire  [1*DDR_NUM-1:0]          pkt_fifo_rdata_sop_pre                   ;

wire  [1*DDR_NUM-1:0]          ddr_info_fifo_rd                         ;
wire  [53:0]                   ddr_info_fifo_rdata      [DDR_NUM-1:0]   ;
wire  [6:0]                    ddr_info_fifo_beat       [DDR_NUM-1:0]   ;
wire  [1*DDR_NUM-1:0]          ddr_info_fifo_ef                         ;
wire  [1*DDR_NUM-1:0]          ddr_info_fifo_err                        ;

reg                            sn_fifo_wr                               ;
reg   [10:0]                   sn_fifo_wdata                            ;
wire                           sn_fifo_ff                               ;
wire                           sn_fifo_rd                               ;
reg                           sn_fifo_rd_1dly                          ;
wire  [10:0]                   sn_fifo_rdata                            ;
wire                           sn_fifo_ef                               ;
wire  [7:0]                    sn_fifo_stat                             ;

reg                            seq_fifo_wr                              ;
reg   [1:0]                    seq_fifo_wdata                           ;
wire                           seq_fifo_ff                              ;
wire                           seq_fifo_rd                              ;
wire  [1:0]                    seq_fifo_rdata                           ;
wire                           seq_fifo_ef                              ;
wire  [7:0]                    seq_fifo_stat                            ;

reg   [1*DDR_NUM-1:0]          ddr_rsp_fifo_wr                          ;
reg   [1:0]                    ddr_rsp_fifo_wdata       [DDR_NUM-1:0]   ;
wire  [1*DDR_NUM-1:0]          ddr_rsp_fifo_ff                          ;
wire  [1*DDR_NUM-1:0]          ddr_rsp_fifo_rd                          ;
wire  [1:0]                    ddr_rsp_fifo_rdata       [DDR_NUM-1:0]   ;
wire  [1*DDR_NUM-1:0]          ddr_rsp_fifo_ef                          ;
wire  [8*DDR_NUM-1:0]          ddr_rsp_fifo_stat                        ;

wire  [1*DDR_NUM-1:0]          axi4_s2m_rsp_ok_cnt_en                   ; 

reg                            eoc_fifo_wr_pre                          ; 
wire  [1*DDR_NUM-1:0]          eoc_fifo_wr                              ; 
wire                           eoc_fifo_wdata                           ; 
wire  [1*DDR_NUM-1:0]          eoc_fifo_ff                              ; 
wire  [1*DDR_NUM-1:0]          eoc_fifo_rd                              ; 
wire  [1*DDR_NUM-1:0]          eoc_fifo_rdata                           ; 
wire  [1*DDR_NUM-1:0]          eoc_fifo_ef                              ; 
wire  [8*DDR_NUM-1:0]          eoc_fifo_stat                            ; 

reg                            ddr_rsp_fifo_rd_pre                      ;
reg                            ddr_rsp_fifo_rd_pre_1dly                 ;
wire  [3:0]                    ddr_rsp_rr4_req                          ;
wire                           ddr_rsp_rr4_rd_en                        ;
wire  [1:0]                    ddr_rsp_rr4_chn                          ;

wire  [1*DDR_NUM-1:0]          ddr_rsp_fifo_rd_mask                     ;

wire  [1*DDR_NUM-1:0]          sn_fifo_rd_pre                           ;
wire  [1*DDR_NUM-1:0]          seq_fifo_rd_pre                          ;

//******************************************************************************
//process 
//******************************************************************************
//judge pkt fifo wdata sop 
always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        pkt_sop_lock <= 1'b1;
    end
    else if (pkt_fifo_wdata_pre_eop == 1'b1) begin
        pkt_sop_lock <= 1'b1;
    end
    else if (pkt_fifo_wr_pre == 1'b1) begin
        pkt_sop_lock <= 1'b0;
    end
    else ;
end

assign pkt_fifo_wdata_pre_sop = pkt_fifo_wr_pre & pkt_sop_lock;

always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        pkt_fifo_wdata_sop <= 1'b0;
    end
    else begin
        pkt_fifo_wdata_sop <= pkt_fifo_wdata_pre_sop; 
    end
end 

assign pkt_fifo_wdata_pre_eop = pkt_fifo_wr_pre & pkt_fifo_wdata_pre[519];
assign hacc_flag_bit =  pkt_fifo_wdata_pre_sop & pkt_fifo_wdata_pre[255];
assign soc_bit =  pkt_fifo_wdata_pre_sop & pkt_fifo_wdata_pre[254];
assign eoc_bit =  pkt_fifo_wdata_pre_sop & pkt_fifo_wdata_pre[253];

//juge hard acc second slice 
always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        hacc_flag <= 1'b0;
    end 
    else if (hacc_flag_bit == 1'b1) begin
        hacc_flag <= 1'b1;
    end
    else if (pkt_fifo_wr_pre == 1'b1) begin
        hacc_flag <= 1'b0;
    end
    else;
end

//lock hard acc sn
always @ (posedge clk_sys)
begin
    if (hacc_flag_bit == 1'b1) begin
        hacc_sn <= pkt_fifo_wdata_pre[232:224];
        opcode  <= pkt_fifo_wdata_pre[234:233];
        sn_wdata_lock <= pkt_fifo_wdata_pre[234:224];
    end
    else;
end

//lock pkt slice sop
always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        pkt_slice_sop <= 1'b0;
    end
    else begin
        pkt_slice_sop <= ((pkt_fifo_wdata_pre_sop == 1'b1) && (hacc_flag_bit == 1'b0));
    end
end

//lock pkt slice soc
always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        pkt_slice_soc <= 1'b0;
    end
    else begin
        pkt_slice_soc <= ((soc_bit == 1'b1) && (hacc_flag_bit == 1'b0));
    end
end 

//lock pkt slice eoc
always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        pkt_slice_eoc <= 1'b0;
    end
    else begin
        pkt_slice_eoc <= ((eoc_bit == 1'b1) && (hacc_flag_bit == 1'b0));
    end
end 

//lock pkt slice length
always @ (posedge clk_sys)
begin 
    if ((pkt_fifo_wdata_pre_sop == 1'b1) && (hacc_flag_bit == 1'b0)) begin
        pkt_slice_length <= pkt_fifo_wdata_pre[247:235];
    end
    else begin
        pkt_slice_length <= 13'd0;
    end
end

//******************************************************************************
//store fpga ddr sa da into fmmu_tx_bd 
//******************************************************************************
//fpga ddr sa, da lock
always @ (posedge clk_sys)
begin
    if ((pkt_fifo_wr_pre == 1'b1) && (hacc_flag == 1'b1)) begin
        hacc_wdata <= {pkt_fifo_wdata_pre[255:240],pkt_fifo_wdata_pre[99:64],pkt_fifo_wdata_pre[35:0]};
    end
    else;
end

always @ (posedge clk_sys)
begin
    hacc_waddr <= hacc_sn;
end


always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        hacc_wr <= 1'b0;
    end
    else begin
        hacc_wr <= pkt_fifo_wr_pre & hacc_flag;
    end
end 

always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        rd_ddr_rsp_en <= 1'b0;
        rd_ddr_rsp_en_1dly <= 1'b0;
    end
    else begin
        rd_ddr_rsp_en <= ((pkt_fifo_wr_pre == 1'b1) && (hacc_flag == 1'b1) &&
                          (opcode == 2'd1));
        rd_ddr_rsp_en_1dly <= rd_ddr_rsp_en;
    end
end 


always @ (posedge clk_sys)
begin
    rd_ddr_rsp_sn <= sn_wdata_lock;
    rd_ddr_rsp_sn_1dly <= rd_ddr_rsp_sn;
end 


//******************************************************************************
//store info into ddr info fifo 
//******************************************************************************
always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        ddr_info_fifo_wr_pre <= 1'b0;
    end
    else begin
        ddr_info_fifo_wr_pre <= ((pkt_fifo_wdata_pre_sop == 1'b1) && (hacc_flag_bit == 1'b0));
    end
end 

genvar r;
generate
for (r = 0;r < DDR_NUM;r = r + 1 )
    begin : DDR_INFO_WR

        assign ddr_info_fifo_wr[r] = ddr_info_fifo_wr_pre & (pkt_slice_saddr[35:34]==r) ;
    
    end
endgenerate

//36+18= 54 bit
assign ddr_info_fifo_wdata = {
                              1'b1,1'b0,1'b0,
                              pkt_slice_eoc,
                              pkt_slice_soc,
                              pkt_slice_length,
                              pkt_slice_saddr
                              };

//pkt slice addr calculate
always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        pkt_slice_saddr_h2b <= 2'd0;
    end
    else if ((soc_bit == 1'b1) && (hacc_flag_bit == 1'b0)) begin
        pkt_slice_saddr_h2b <= hacc_wdata[35:34];
    end
    else ;
end

always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        pkt_slice_saddr_l13b <= 13'd0;
    end
    else if ((soc_bit == 1'b1) && (hacc_flag_bit == 1'b0)) begin
        pkt_slice_saddr_l13b <= hacc_wdata[12:0];
    end
    else if((pkt_fifo_wdata_pre_sop == 1'b1) && (hacc_flag_bit == 1'b0)) begin
        pkt_slice_saddr_l13b <= pkt_slice_saddr_l13b + 13'd4096;
    end
    else ;
end 

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        pkt_slice_saddr_m21b <= 21'd0;
    end
    else if ((soc_bit == 1'b1) && (hacc_flag_bit == 1'b0)) begin
        pkt_slice_saddr_m21b <= hacc_wdata[33:13];
    end
    else if((pkt_fifo_wdata_pre_sop == 1'b1) && (hacc_flag_bit == 1'b0) && (pkt_slice_saddr_l13b[12] == 1'b1)) begin
        pkt_slice_saddr_m21b <= pkt_slice_saddr_m21b[20:0] + 21'd1;
    end   
    else ; 
end

assign pkt_slice_saddr = {pkt_slice_saddr_h2b,pkt_slice_saddr_m21b,pkt_slice_saddr_l13b};
//******************************************************************************
//store hacc sn info, wait rsp to look for
//******************************************************************************
always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        sn_fifo_wr <= 1'b0;
    end
    else begin
        sn_fifo_wr <= ((pkt_fifo_wdata_pre_sop == 1'b1) && (hacc_flag_bit == 1'b1) &&
                       (pkt_fifo_wdata_pre[234:233] != 2'd1));
    end
end 

always @ (posedge clk_sys)
begin
    sn_fifo_wdata <= pkt_fifo_wdata_pre[234:224];
end 

//******************************************************************************
//store hacc seq info, wait rsp to look for
//******************************************************************************
always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        seq_fifo_wr <= 1'b0;
    end
    else begin
        seq_fifo_wr <= pkt_fifo_wr_pre & hacc_flag &
                       (opcode != 2'd1);
    end
end

always @ (posedge clk_sys)
begin
    seq_fifo_wdata <= pkt_fifo_wdata_pre[35:34];
end 

//******************************************************************************
//store slice eoc info, wait rsp to look for
//******************************************************************************
always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        eoc_fifo_wr_pre <= 1'b0;
    end
    else begin
        eoc_fifo_wr_pre <= (pkt_fifo_wdata_pre_sop == 1'b1) && (hacc_flag_bit == 1'b0);
    end
end 

genvar i;
generate
for (i = 0;i < DDR_NUM;i = i + 1 )
    begin : EOS_INFO_WR

        assign eoc_fifo_wr[i] = eoc_fifo_wr_pre & (pkt_slice_saddr[35:34]==i) ;
    
    end
endgenerate

assign eoc_fifo_wdata = pkt_slice_eoc;

//******************************************************************************
//axi-s --> pkt fifo 
//******************************************************************************
//axi-s --> pkt fifo wdata
always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        pkt_fifo_wr_pre_1dly <= 1'b0;
    end
    else begin
        pkt_fifo_wr_pre_1dly <= pkt_fifo_wr_pre & (~pkt_fifo_wdata_pre_sop) & (~hacc_flag);
    end
end

genvar j;
generate
for (j = 0;j < DDR_NUM;j = j + 1 )
    begin : PKT_WR

        assign pkt_fifo_wr[j] = pkt_fifo_wr_pre_1dly & (pkt_slice_saddr[35:34]==j);
    
    end
endgenerate

//axi-s --> pkt fifo wdata
assign pkt_fifo_wdata = {pkt_fifo_wdata_pre_1dly[539:521],
                         pkt_slice_sop_1dly,
                         pkt_fifo_wdata_pre_1dly[519:0]
                         };

always @ (posedge clk_sys)
begin
    pkt_fifo_wdata_pre_1dly <= pkt_fifo_wdata_pre;
end

always @ (posedge clk_sys)
begin
    pkt_slice_sop_1dly <= pkt_slice_sop;
end 
//******************************************************************************
//ddra pkt fifo --> axi-4 
//******************************************************************************
genvar k;
generate
for (k = 0;k < DDR_NUM;k = k + 1 )
    begin : AXI_PROC

        assign pkt_fifo_rdata_sop_pre[k] = pkt_fifo_rdata[k][520] & (~pkt_fifo_ef[k]);
        
        //read ddr info fifo
        assign ddr_info_fifo_rd[k] = pkt_fifo_rd[k] & pkt_fifo_rdata[k][520];
        
        //axi-4 interface parameter
        assign ddr_info_fifo_beat[k] = (|ddr_info_fifo_rdata[k][48:42])
                                     ? (ddr_info_fifo_rdata[k][48:42] + {6'd0,(|ddr_info_fifo_rdata[k][41:36])} -7'd1): 7'd0;
        assign axi4_m2s_awlen[8*(k+1)-1:8*k] = {1'd0,ddr_info_fifo_beat[k]}; 
        assign axi4_m2s_awsize[3*(k+1)-1:3*k] = 3'b110;
        assign axi4_m2s_awaddr[64*(k+1)-1:64*k] = {30'd0,ddr_info_fifo_rdata[k][33:0]};
        assign axi4_m2s_awid[4*(k+1)-1:4*k] = {2'd0,ddr_info_fifo_rdata[k][35:34]} ;

    end
endgenerate

assign axi4_m2s_awuser = {DDR_NUM{8'd0}};
//******************************************************************************
//use seq info read four ddrs rsp 
//******************************************************************************
//ddr rsp process
genvar m;
generate
for (m = 0;m < DDR_NUM;m = m + 1 )
    begin : RSP_WR

        always @ (posedge clk_sys or posedge rst)
        begin
            if (rst == 1'b1) begin
                ddr_rsp_fifo_wr[m] <= 1'b0;
            end
            else begin
                ddr_rsp_fifo_wr[m] <= axi4_s2m_bvalid[m] & axi4_m2s_bready[m] ;
            end
        end
        
        always @ (posedge clk_sys)
        begin
            ddr_rsp_fifo_wdata[m] <= axi4_s2m_bresp[2*(m+1)-1:2*m];
        end

    end
endgenerate

//******************************************************************************
assign ddr_rsp_rr4_rd_en  = (~ddr_rsp_fifo_rd_pre) & (~ddr_rsp_fifo_rd_pre_1dly) 
                          & (~(&ddr_rsp_fifo_ef)) & (~seq_fifo_ef) & (~sn_fifo_ef);

always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        ddr_rsp_fifo_rd_pre <= 1'b0;
    end
    else begin
        ddr_rsp_fifo_rd_pre <= ddr_rsp_rr4_rd_en;
    end
end 

always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        ddr_rsp_fifo_rd_pre_1dly <= 1'b0;
    end
    else begin
        ddr_rsp_fifo_rd_pre_1dly <= ddr_rsp_fifo_rd_pre;
    end
end 

genvar n;
generate
for (n = 0;n < DDR_NUM;n = n + 1 )
    begin : RSP_PROC

        assign ddr_rsp_rr4_req[n] = ~ddr_rsp_fifo_ef[n];

        assign ddr_rsp_fifo_rd[n] = ddr_rsp_fifo_rd_pre & ddr_rsp_fifo_rd_mask[n] & (ddr_rsp_rr4_chn == n);

        assign ddr_rsp_fifo_rd_mask[n] = ((eoc_fifo_rdata[n] == 1'b1) & (~eoc_fifo_ef[n]) & (seq_fifo_rdata[1:0] != n) & (~seq_fifo_ef)) ? 1'b0 : 1'b1;

        assign eoc_fifo_rd[n] = ddr_rsp_fifo_rd[n];
        
        assign sn_fifo_rd_pre[n]  = eoc_fifo_rd[n] & eoc_fifo_rdata[n];
        
        assign seq_fifo_rd_pre[n] = eoc_fifo_rd[n] & eoc_fifo_rdata[n];

    end
endgenerate

rr4 u_rsp_rr4
    (
       .clks                  (clk_sys             ),   
       .reset                 (rst                 ),   
       .req                   (ddr_rsp_rr4_req     ),   
       .req_vld               (ddr_rsp_rr4_rd_en   ),   
       .rr_bit                (ddr_rsp_rr4_chn     )
    );

assign sn_fifo_rd = |sn_fifo_rd_pre;
assign seq_fifo_rd = |seq_fifo_rd_pre;

always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        sn_fifo_rd_1dly <= 1'b0;
    end
    else begin
        sn_fifo_rd_1dly <= sn_fifo_rd;
    end
end 


always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        wr_ddr_rsp_en <= 1'b0;
    end
    else begin
        wr_ddr_rsp_en <= (sn_fifo_rd | rd_ddr_rsp_en) | 
                         (sn_fifo_rd_1dly & rd_ddr_rsp_en_1dly);
    end
end 

always @ (posedge clk_sys)
begin
    if ((sn_fifo_rd_1dly == 1'b1) && (rd_ddr_rsp_en_1dly == 1'b1)) begin
        wr_ddr_rsp_sn <= rd_ddr_rsp_sn_1dly;
    end
    else if (sn_fifo_rd == 1'b1) begin
        wr_ddr_rsp_sn <= sn_fifo_rdata[10:0];
    end
    else begin
        wr_ddr_rsp_sn <= rd_ddr_rsp_sn;
    end
end

//******************************************************************************
//******************************************************************************
//online cnt feedback
always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        online_feedback_en <= 1'b0;
    end
    else begin
        online_feedback_en <= (|pkt_fifo_rd);
    end
end  

//******************************************************************************
//err, status, cnt
//******************************************************************************
always @ (posedge clk_sys)
begin
    reg_mmu_tx_pkt_sta          <= {
                                    {(28 - DDR_NUM*6){1'b0}},
                                    ddr_rsp_fifo_ff,
                                    ddr_rsp_fifo_ef,
                                    eoc_fifo_ff,
                                    eoc_fifo_ef,
                                    pkt_fifo_ff,
                                    pkt_fifo_ef,
                                    sn_fifo_ff,
                                    sn_fifo_ef,
                                    seq_fifo_ff,
                                    seq_fifo_ef
                                    };

    reg_hacc_sn                 <= {opcode,hacc_sn}; 
    reg_hacc_ddr_saddr          <= hacc_wdata[35:0]; 
    reg_hacc_ddr_daddr          <= hacc_wdata[71:36];
    reg_ddr_rsp_sn              <= wr_ddr_rsp_sn;
    reg_seq_info                <= 3'd0;
end 

always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        reg_mmu_tx_pkt_err          <= 32'd0;

        reg_axis_receive_cnt_en     <= 1'b0; 
        reg_hacc_receive_cnt_en     <= 1'b0; 
        reg_pkt_receive_cnt_en      <= 1'b0;
        

    end
    else begin
        reg_mmu_tx_pkt_err          <= {
                                       4'd0,
                                       sn_fifo_stat[5:4],
                                       seq_fifo_stat[5:4],
                                       ddr_rsp_fifo_stat[29:28],
                                       ddr_rsp_fifo_stat[21:20],
                                       ddr_rsp_fifo_stat[13:12],
                                       ddr_rsp_fifo_stat[5:4],
                                       eoc_fifo_stat[29:28],
                                       eoc_fifo_stat[21:20],
                                       eoc_fifo_stat[13:12],
                                       eoc_fifo_stat[5:4],
                                       ddr_info_fifo_err,
                                       pkt_fifo_err
                                       }; 

        reg_axis_receive_cnt_en     <= pkt_fifo_wdata_pre_sop;
        reg_hacc_receive_cnt_en     <= hacc_wr;
        reg_pkt_receive_cnt_en      <= pkt_slice_sop;
                              
    end
end

genvar p;
generate
for (p = 0;p < DDR_NUM;p = p + 1 )
    begin : STA_CNT

        always @ (posedge clk_sys or posedge rst)
        begin
            if (rst == 1'b1) begin
                reg_ddr_wr_addr[64*(p+1)-1:64*p]  <= 64'd0; 
                reg_ddr_wr_length[8*(p+1)-1:8*p]  <= 8'd0; 
            end
            else if ((axi4_m2s_awvalid[p] & axi4_s2m_awready[p]) == 1'b1) begin
                reg_ddr_wr_addr[64*(p+1)-1:64*p]  <= axi4_m2s_awaddr[64*(p+1)-1:64*p]; 
                reg_ddr_wr_length[8*(p+1)-1:8*p]  <= axi4_m2s_awlen[8*(p+1)-1:8*p]; 
            end
            else;
        end

        always @ (posedge clk_sys or posedge rst)
        begin
            if (rst == 1'b1) begin
                reg_axi4_send_slice_cnt_en[p]  <= 1'b0;
                reg_axi4_send_ok_cnt_en[p]     <= 1'b0;
                reg_ddr_rsp_ok_cnt_en[p]       <= 1'b0;
                reg_axi4_send_wlast_cnt_en[p]  <= 1'b0;
            end
            else begin
                reg_axi4_send_slice_cnt_en[p]  <= axi4_m2s_awvalid[p] & axi4_s2m_awready[p]; 
                reg_axi4_send_ok_cnt_en[p]     <= axi4_s2m_rsp_ok_cnt_en[p]; 
                reg_ddr_rsp_ok_cnt_en[p]       <= axi4_s2m_bvalid[p];
                reg_axi4_send_wlast_cnt_en[p]  <= axi4_m2s_wlast[p];
            end
        end

    end 
endgenerate

//******************************************************************************
//instance
//******************************************************************************
axis_s512_mmu u_axi4_s512_mmu
    (
    .pcie_clk                 (clk_sys               ),
    .pcie_rst                 (rst                   ),
    .pcie_link_up             (1'd1                  ),
    .user_clk                 (clk_sys               ),
    .user_rst                 (rst                   ),
    
    .m_axis_rc_tdata          (sh2ul_dmam1_tdata     ),
    .m_axis_rc_tuser          (75'd0                 ),
    .m_axis_rc_tlast          (sh2ul_dmam1_tlast     ),
    .m_axis_rc_tkeep          (sh2ul_dmam1_tkeep     ),
    .m_axis_rc_tvalid         (sh2ul_dmam1_tvalid    ),
    .m_axis_rc_tready         (ul2sh_dmam1_tready    ),

    .rc_rx_wr                 (pkt_fifo_wr_pre       ),
    .rc_rx_wdata              (pkt_fifo_wdata_pre    ),
    .rc_rx_ff                 ((|pkt_fifo_ff)        ),

    .rc_rx_cnt                (                      ),
    .rc_rx_drop_cnt           (                      )
    );

/********************************************************************************************************************\
    instance
\********************************************************************************************************************/
//********************************************************************************************************************
genvar x;
generate
for (x = 0;x < DDR_NUM;x = x + 1 )
    begin : MULTI_INS

        axi4_m512_mmu
           #(
            .DATA_WIDTH                       ( 512                               ),
            .EOP_POS                          ( 519                               ),
            .ERR_POS                          ( 518                               ),
            .MOD_POS                          ( 512                               ),
            .MOD_WIDTH                        ( 6                                 ),
            .WR_ERR_DROP_EN                   ( 1                                 ) 
            )
        u_axi4_m512_mmu
        (
            .reset_clkw                       ( rst                               ),
            .reset_clkr                       ( rst                               ),
            .clkw                             ( clk_sys                           ),
            .clkr                             ( clk_sys                           ),
        
            .fifo2axi_ef                      ( pkt_fifo_ef[x]                    ),
            .fifo2axi_rd                      ( pkt_fifo_rd[x]                    ),
            .fifo2axi_rdata                   ( pkt_fifo_rdata[x]                 ),  
            .fifo2axi_sop                     ( pkt_fifo_rdata_sop_pre[x]         ),
        
            .axi4_m2s_awvalid                 ( axi4_m2s_awvalid[x]               ),
            .axi4_s2m_awready                 ( axi4_s2m_awready[x]               ),
                                                                 
            .axi4_m2s_wid                     ( axi4_m2s_wid[4*(x+1)-1:4*x]       ),
            .axi4_m2s_wdata                   ( axi4_m2s_wdata[512*(x+1)-1:512*x] ),
            .axi4_m2s_wstrb                   ( axi4_m2s_wstrb[64*(x+1)-1:64*x]   ),
            .axi4_m2s_wlast                   ( axi4_m2s_wlast[x]                 ),
            .axi4_m2s_wvalid                  ( axi4_m2s_wvalid[x]                ),
            .axi4_s2m_wready                  ( axi4_s2m_wready[x]                ),
                                                                 
            .axi4_s2m_bid                     ( axi4_s2m_bid[4*(x+1)-1:4*x]       ),
            .axi4_s2m_bresp                   ( axi4_s2m_bresp[2*(x+1)-1:2*x]     ),
            .axi4_s2m_bvalid                  ( axi4_s2m_bvalid[x]                ),
            .axi4_m2s_bready                  ( axi4_m2s_bready[x]                ),
           
            .cfg_bid_id                       ( x[3:0]                            ),
            .axi4_s2m_rsp_ok_cnt_en           ( axi4_s2m_rsp_ok_cnt_en[x]         ),
            .axi4_s2m_rsp_exok_cnt_en         (                                   ),
            .axi4_s2m_rsp_slverr_cnt_en       (                                   ),
            .axi4_s2m_rsp_decerr_cnt_en       (                                   )   
        );

        //ddr info fifo
        asyn_frm_fifo_288x512_sa
        #(
            .DATA_WIDTH                       ( 54                                ),
            .ADDR_WIDTH                       ( 10                                ),
            .EOP_POS                          ( 53                                ),
            .ERR_POS                          ( 52                                ),
            .FULL_LEVEL                       ( 940                               ),
            .ERR_DROP                         ( 1                                 )
        )
        u_ddr_info_fifo
        (
            .rd_clk                           ( clk_sys                           ),
            .rd_rst                           ( rst                               ),
            .wr_clk                           ( clk_sys                           ),
            .wr_rst                           ( rst                               ),
            .wr                               ( ddr_info_fifo_wr[x]               ),
            .wdata                            ( ddr_info_fifo_wdata               ),
            .wafull                           ( ddr_info_fifo_ff[x]               ),
            .wr_data_cnt                      (                                   ),
            .rd                               ( ddr_info_fifo_rd[x]               ),
            .rdata                            ( ddr_info_fifo_rdata[x]            ),
            .rempty                           ( ddr_info_fifo_ef[x]               ),
            .rd_data_cnt                      (                                   ),
            .empty_full_err                   ( ddr_info_fifo_err[x]              )
        );

        asyn_frm_fifo_288x512_sa
        #(
            .DATA_WIDTH                       ( 540                               ),
            .ADDR_WIDTH                       ( 10                                ),
            .EOP_POS                          ( 519                               ),
            .ERR_POS                          ( 518                               ),
            .FULL_LEVEL                       ( 940                               ),
            .ERR_DROP                         ( 1                                 )
        )
        u_pkt_fifo
        (
            .rd_clk                           ( clk_sys                           ),
            .rd_rst                           ( rst                               ),
            .wr_clk                           ( clk_sys                           ),
            .wr_rst                           ( rst                               ),
            .wr                               ( pkt_fifo_wr[x]                    ),
            .wdata                            ( pkt_fifo_wdata                    ),
            .wafull                           ( pkt_fifo_ff[x]                    ),
            .wr_data_cnt                      (                                   ),
            .rd                               ( pkt_fifo_rd[x]                    ),
            .rdata                            ( pkt_fifo_rdata[x]                 ),
            .rempty                           ( pkt_fifo_ef[x]                    ),
            .rd_data_cnt                      (                                   ),
            .empty_full_err                   ( pkt_fifo_err[x]                   )
        );

        sfifo_cbb_enc 
        #(
            .FIFO_PARITY                      ( "FALSE"                           ),
            .PARITY_DLY                       ( "FALSE"                           ),
            .FIFO_DO_REG                      ( 0                                 ), 
            .RAM_DO_REG                       ( 0                                 ),
            .FIFO_ATTR                        ( "ahead"                           ),
            .FIFO_WIDTH                       ( 1                                 ),
            .FIFO_DEEP                        ( 10                                ),
            .AFULL_OVFL_THD                   ( 940                               ),
            .AFULL_UNFL_THD                   ( 940                               ),
            .AEMPTY_THD                       ( 9                                 ) 
        )
        u_eoc_fifo 
        (
            .clk_sys                          (clk_sys                            ),
            .reset                            (rst                                ),
            .wen                              (eoc_fifo_wr[x]                     ),
            .wdata                            (eoc_fifo_wdata                     ),
            .ren                              (eoc_fifo_rd[x]                     ),
            .rdata                            (eoc_fifo_rdata[x]                  ),
            .full                             (                                   ),
            .empty                            (eoc_fifo_ef[x]                     ),
            .usedw                            (                                   ),
            .afull                            (eoc_fifo_ff[x]                     ), 
            .aempty                           (                                   ),
            .parity_err                       (                                   ),
            .fifo_stat                        (eoc_fifo_stat[(x+1)*8-1:x*8]       ) 
        );

        sfifo_cbb_enc 
        #(
            .FIFO_PARITY                      ( "FALSE"                           ),
            .PARITY_DLY                       ( "FALSE"                           ),
            .FIFO_DO_REG                      ( 0                                 ), 
            .RAM_DO_REG                       ( 0                                 ),
            .FIFO_ATTR                        ( "ahead"                           ),
            .FIFO_WIDTH                       ( 2                                 ),
            .FIFO_DEEP                        ( 10                                ),
            .AFULL_OVFL_THD                   ( 940                               ),
            .AFULL_UNFL_THD                   ( 940                               ),
            .AEMPTY_THD                       ( 9                                 ) 
        )
        u_ddr_rsp_fifo 
        (
            .clk_sys                          ( clk_sys                           ),
            .reset                            ( rst                               ),
            .wen                              ( ddr_rsp_fifo_wr[x]                ),
            .wdata                            ( ddr_rsp_fifo_wdata[x]             ),
            .ren                              ( ddr_rsp_fifo_rd[x]                ),
            .rdata                            ( ddr_rsp_fifo_rdata[x]             ),
            .full                             ( ddr_rsp_fifo_ff[x]                ),
            .empty                            ( ddr_rsp_fifo_ef[x]                ),
            .usedw                            (                                   ),
            .afull                            (                                   ), 
            .aempty                           (                                   ),
            .parity_err                       (                                   ),
            .fifo_stat                        ( ddr_rsp_fifo_stat[(x+1)*8-1:x*8]  ) 
        );

    end
endgenerate

//******************************************************************************
sfifo_cbb_enc 
       #(
        .FIFO_PARITY       ( "FALSE"               ),
        .PARITY_DLY        ( "FALSE"               ),
        .FIFO_DO_REG       ( 0                     ), 
        .RAM_DO_REG        ( 0                     ),
        .FIFO_ATTR         ( "ahead"               ),
        .FIFO_WIDTH        ( 11                    ),
        .FIFO_DEEP         ( 10                    ),
        .AFULL_OVFL_THD    ( 940                   ),
        .AFULL_UNFL_THD    ( 940                   ),
        .AEMPTY_THD        ( 9                     ) 
        )
u_sn_fifo (
        .clk_sys           (clk_sys                ),
        .reset             (rst                    ),
        .wen               (sn_fifo_wr             ),
        .wdata             (sn_fifo_wdata          ),
        .ren               (sn_fifo_rd             ),
        .rdata             (sn_fifo_rdata          ),
        .full              (sn_fifo_ff             ),
        .empty             (sn_fifo_ef             ),
        .usedw             (                       ),
        .afull             (                       ), 
        .aempty            (                       ),
        .parity_err        (                       ),
        .fifo_stat         (sn_fifo_stat           ) 
        );

sfifo_cbb_enc 
       #(
        .FIFO_PARITY       ( "FALSE"               ),
        .PARITY_DLY        ( "FALSE"               ),
        .FIFO_DO_REG       ( 0                     ), 
        .RAM_DO_REG        ( 0                     ),
        .FIFO_ATTR         ( "ahead"               ),
        .FIFO_WIDTH        ( 2                     ),
        .FIFO_DEEP         ( 10                    ),
        .AFULL_OVFL_THD    ( 940                   ),
        .AFULL_UNFL_THD    ( 940                   ),
        .AEMPTY_THD        ( 9                     ) 
        )
u_seq_fifo (
        .clk_sys           (clk_sys                ),
        .reset             (rst                    ),
        .wen               (seq_fifo_wr            ),
        .wdata             (seq_fifo_wdata         ),
        .ren               (seq_fifo_rd            ),
        .rdata             (seq_fifo_rdata         ),
        .full              (seq_fifo_ff            ),
        .empty             (seq_fifo_ef            ),
        .usedw             (                       ),
        .afull             (                       ), 
        .aempty            (                       ),
        .parity_err        (                       ),
        .fifo_stat         (seq_fifo_stat          ) 
        );

endmodule
