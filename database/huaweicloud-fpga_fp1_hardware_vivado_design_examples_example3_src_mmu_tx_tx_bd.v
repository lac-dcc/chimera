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
`timescale 1ns / 1ns
module  tx_bd
                (
                 //globe signals
                 input                            clk_sys                  ,
                 input                            rst                      ,

                 //ve to ae bd
                 output  reg                      stxqm2inq_fifo_rd        ,
                 input           [287:0]          stxqm2inq_fifo_rdata     ,
                 input                            inq2stxqm_fifo_emp       ,

                 //ae to ve read command
                 output  reg                      ppm2stxm_rxffc_wr        ,
                 output  wire    [255:0]          ppm2stxm_rxffc_wdata     ,
                 input                            stxm2ppm_rxffc_ff        ,

                 //with mmu_tx_pkt 
                 input                            hacc_wr                  ,     
                 input           [8:0]            hacc_waddr               ,
                 input           [87:0]           hacc_wdata               ,
                 input                            online_feedback_en       ,     
                 input                            wr_ddr_rsp_en            ,     
                 input           [10:0]           wr_ddr_rsp_sn            ,

                 //with kernel
                 input                            kernel2tx_afull          ,
                 output  reg                      tx2kernel_bd_wen         ,
                 output  reg     [511:0]          tx2kernel_bd_wdata       ,

                 //with kernel
                 input                            mmu_rx2tx_afull          ,
                 output  reg                      mmu_tx2rx_bd_wen         ,
                 output  wire    [511:0]          mmu_tx2rx_bd_wdata       ,

                 //dfx
                 output  reg                      mmu_tx2rx_wr_bd_wen      ,
                 output  reg                      mmu_tx2rx_rd_bd_wen      ,
                 output  wire    [15:0]           tx_bd_err                ,
                 output  wire    [15:0]           tx_bd_sta                ,
                 output  reg     [10:0]           mmu_tx_online_beat       ,
                 input           [10:0]           reg_mmu_tx_online_beat           
                );

//------------------------------------------------------------------------------
reg   [7:0]            thread_id             ;
reg   [1:0]            opcode                ;
reg   [1:0]            opcode_1dly           ;
reg   [7:0]            acc_type              ;
reg   [47:0]           ve_info               ;
reg   [63:0]           des_addr              ;
reg   [63:0]           src_addr              ;
reg                    rd_cmd_busy           ;
reg   [26:0]           len_latch_h           ;
reg   [4:0]            len_latch_l           ;
reg   [19:0]           len_left_high         ;
reg   [11:0]           len_left_low          ;
reg   [26:0]           real_len_latch_h      ;
reg   [4:0]            real_len_latch_l      ;
wire  [31:0]           real_len_latch        ;
reg                    hardacc_flag          ;
reg                    sod_cmd_flag          ;
reg                    eod_cmd_flag          ;
reg   [8:0]            ram_sn                ;
reg   [9:0]            init_cnt              ;
wire                   init_done             ;
reg                    init_done_1dly        ;
reg                    init_ff_wen           ;
reg   [8:0]            init_ff_wdata         ;
reg   [12:0]           rd_len                ;
reg   [63:0]           rd_src_addr           ;
reg                    ff_wen_sel            ;
reg   [8:0]            ff_wdata_sel          ;
wire  [9:0]            ff_wdata_sel_odd      ;
wire  [9:0]            hdacc_sn_rdata        ;
wire  [7:0]            hdacc_sn_ff_stat      ;
reg                    ddr_rsp_ren           ;
reg                    stxqm2inq_fifo_rd_1dly;
reg                    stxqm2inq_fifo_rd_2dly;
reg                    ddr_rsp_ren_1dly      ;
reg                    ddr_rsp_ren_2dly      ;
reg   [8:0]            bd_online_cnt         ;
reg                    pkt_online_rdy        ;
reg                    bd_online_rdy         ;

wire  [31:0]           len_latch             ;
wire  [287:0]          stxqm2inq_fifo_wdata  ;
wire                   bd_ram_wen            ;
wire  [217:0]          bd_ram_wdata          ;
wire  [8:0]            bd_ram_waddr          ;
wire  [8:0]            bd_ram_raddr          ;
wire  [217:0]          bd_ram_rdata          ;
wire  [8:0]            hcc_raddr             ;
wire  [87:0]           hcc_rdata             ;
wire  [10:0]           ddr_rsp_rdata         ;
wire                   ddr_rsp_empty         ;
wire                   ddr_rsp_afull         ;
wire  [7:0]            ddr_rsp_ff_stat       ;
wire  [255:0]          ppm2stxm_rxffc_wdata_p;
wire  [511:0]          tx2kernel_bd_wdata_p  ;
wire  [511:0]          tx2kernel_bd_wdata_tmp;
wire                   rd_pkt_cmd_acc        ;
wire                   rd_pkt_cmd_eod        ;
wire                   stxqm2inq_fifo_rd_en  ;
wire                   ppm2stxm_rxffc_wr_en  ;
//------------------------------------------------------------------------------

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        stxqm2inq_fifo_rd_1dly <= 1'd0;
        stxqm2inq_fifo_rd_2dly <= 1'd0;
        ddr_rsp_ren_1dly       <= 1'd0;
        ddr_rsp_ren_2dly       <= 1'd0;
    end
    else begin
        stxqm2inq_fifo_rd_1dly <= stxqm2inq_fifo_rd     ;
        stxqm2inq_fifo_rd_2dly <= stxqm2inq_fifo_rd_1dly;
        ddr_rsp_ren_1dly       <= ddr_rsp_ren           ;
        ddr_rsp_ren_2dly       <= ddr_rsp_ren_1dly      ;
    end
end

//------------------------------------------------------------------------------
assign tx_bd_sta = {8'd0,
                    mmu_rx2tx_afull,
                    kernel2tx_afull,
                    stxm2ppm_rxffc_ff,
                    inq2stxqm_fifo_emp,
                    hdacc_sn_ff_stat[0],
                    hdacc_sn_ff_stat[2],
                    ddr_rsp_afull,
                    ddr_rsp_empty};

assign tx_bd_err = {8'd0,
                    hdacc_sn_ff_stat[7:4],
                    ddr_rsp_ff_stat[7:4]};

assign stxqm2inq_fifo_wdata = {stxqm2inq_fifo_rdata[287:256],
                               stxqm2inq_fifo_rdata[7  :0]  ,
                               stxqm2inq_fifo_rdata[15 :8]  ,
                               stxqm2inq_fifo_rdata[23 :16] ,
                               stxqm2inq_fifo_rdata[31 :24] ,
                               stxqm2inq_fifo_rdata[39 :32] ,
                               stxqm2inq_fifo_rdata[47 :40] ,
                               stxqm2inq_fifo_rdata[55 :48] ,
                               stxqm2inq_fifo_rdata[63 :56] ,
                               stxqm2inq_fifo_rdata[71 :64] ,
                               stxqm2inq_fifo_rdata[79 :72] ,
                               stxqm2inq_fifo_rdata[87 :80] ,
                               stxqm2inq_fifo_rdata[95 :88] ,
                               stxqm2inq_fifo_rdata[103:96] ,
                               stxqm2inq_fifo_rdata[111:104],
                               stxqm2inq_fifo_rdata[119:112],
                               stxqm2inq_fifo_rdata[127:120],
                               stxqm2inq_fifo_rdata[128 + 7  :128 + 0]  ,
                               stxqm2inq_fifo_rdata[128 + 15 :128 + 8]  ,
                               stxqm2inq_fifo_rdata[128 + 23 :128 + 16] ,
                               stxqm2inq_fifo_rdata[128 + 31 :128 + 24] ,
                               stxqm2inq_fifo_rdata[128 + 39 :128 + 32] ,
                               stxqm2inq_fifo_rdata[128 + 47 :128 + 40] ,
                               stxqm2inq_fifo_rdata[128 + 55 :128 + 48] ,
                               stxqm2inq_fifo_rdata[128 + 63 :128 + 56] ,
                               stxqm2inq_fifo_rdata[128 + 71 :128 + 64] ,
                               stxqm2inq_fifo_rdata[128 + 79 :128 + 72] ,
                               stxqm2inq_fifo_rdata[128 + 87 :128 + 80] ,
                               stxqm2inq_fifo_rdata[128 + 95 :128 + 88] ,
                               stxqm2inq_fifo_rdata[128 + 103:128 + 96] ,
                               stxqm2inq_fifo_rdata[128 + 111:128 + 104],
                               stxqm2inq_fifo_rdata[128 + 119:128 + 112],
                               stxqm2inq_fifo_rdata[128 + 127:128 + 120]
                              };

assign ppm2stxm_rxffc_wdata = {ppm2stxm_rxffc_wdata_p[7  :0]  ,
                               ppm2stxm_rxffc_wdata_p[15 :8]  ,
                               ppm2stxm_rxffc_wdata_p[23 :16] ,
                               ppm2stxm_rxffc_wdata_p[31 :24] ,
                               ppm2stxm_rxffc_wdata_p[39 :32] ,
                               ppm2stxm_rxffc_wdata_p[47 :40] ,
                               ppm2stxm_rxffc_wdata_p[55 :48] ,
                               ppm2stxm_rxffc_wdata_p[63 :56] ,
                               ppm2stxm_rxffc_wdata_p[71 :64] ,
                               ppm2stxm_rxffc_wdata_p[79 :72] ,
                               ppm2stxm_rxffc_wdata_p[87 :80] ,
                               ppm2stxm_rxffc_wdata_p[95 :88] ,
                               ppm2stxm_rxffc_wdata_p[103:96] ,
                               ppm2stxm_rxffc_wdata_p[111:104],
                               ppm2stxm_rxffc_wdata_p[119:112],
                               ppm2stxm_rxffc_wdata_p[127:120],
                               ppm2stxm_rxffc_wdata_p[128 + 7  :128 + 0]  ,
                               ppm2stxm_rxffc_wdata_p[128 + 15 :128 + 8]  ,
                               ppm2stxm_rxffc_wdata_p[128 + 23 :128 + 16] ,
                               ppm2stxm_rxffc_wdata_p[128 + 31 :128 + 24] ,
                               ppm2stxm_rxffc_wdata_p[128 + 39 :128 + 32] ,
                               ppm2stxm_rxffc_wdata_p[128 + 47 :128 + 40] ,
                               ppm2stxm_rxffc_wdata_p[128 + 55 :128 + 48] ,
                               ppm2stxm_rxffc_wdata_p[128 + 63 :128 + 56] ,
                               ppm2stxm_rxffc_wdata_p[128 + 71 :128 + 64] ,
                               ppm2stxm_rxffc_wdata_p[128 + 79 :128 + 72] ,
                               ppm2stxm_rxffc_wdata_p[128 + 87 :128 + 80] ,
                               ppm2stxm_rxffc_wdata_p[128 + 95 :128 + 88] ,
                               ppm2stxm_rxffc_wdata_p[128 + 103:128 + 96] ,
                               ppm2stxm_rxffc_wdata_p[128 + 111:128 + 104],
                               ppm2stxm_rxffc_wdata_p[128 + 119:128 + 112],
                               ppm2stxm_rxffc_wdata_p[128 + 127:128 + 120]
                              };

assign  tx2kernel_bd_wdata_tmp  = {tx2kernel_bd_wdata_p[7:0    ],tx2kernel_bd_wdata_p[15:8   ],
                               tx2kernel_bd_wdata_p[23:16  ],tx2kernel_bd_wdata_p[31:24  ],
                               tx2kernel_bd_wdata_p[39:32  ],tx2kernel_bd_wdata_p[47:40  ],
                               tx2kernel_bd_wdata_p[55:48  ],tx2kernel_bd_wdata_p[63:56  ],
                               tx2kernel_bd_wdata_p[71:64  ],tx2kernel_bd_wdata_p[79:72  ],
                               tx2kernel_bd_wdata_p[87:80  ],tx2kernel_bd_wdata_p[95:88  ],
                               tx2kernel_bd_wdata_p[103:96 ],tx2kernel_bd_wdata_p[111:104],
                               tx2kernel_bd_wdata_p[119:112],tx2kernel_bd_wdata_p[127:120],
                               tx2kernel_bd_wdata_p[135:128],tx2kernel_bd_wdata_p[143:136],
                               tx2kernel_bd_wdata_p[151:144],tx2kernel_bd_wdata_p[159:152],
                               tx2kernel_bd_wdata_p[167:160],tx2kernel_bd_wdata_p[175:168],
                               tx2kernel_bd_wdata_p[183:176],tx2kernel_bd_wdata_p[191:184],
                               tx2kernel_bd_wdata_p[199:192],tx2kernel_bd_wdata_p[207:200],
                               tx2kernel_bd_wdata_p[215:208],tx2kernel_bd_wdata_p[223:216],
                               tx2kernel_bd_wdata_p[231:224],tx2kernel_bd_wdata_p[239:232],
                               tx2kernel_bd_wdata_p[247:240],tx2kernel_bd_wdata_p[255:248],

                               tx2kernel_bd_wdata_p[263:256],tx2kernel_bd_wdata_p[271:264],
                               tx2kernel_bd_wdata_p[279:272],tx2kernel_bd_wdata_p[287:280],
                               tx2kernel_bd_wdata_p[295:288],tx2kernel_bd_wdata_p[303:296],
                               tx2kernel_bd_wdata_p[311:304],tx2kernel_bd_wdata_p[319:312],
                               tx2kernel_bd_wdata_p[327:320],tx2kernel_bd_wdata_p[335:328],
                               tx2kernel_bd_wdata_p[343:336],tx2kernel_bd_wdata_p[351:344],
                               tx2kernel_bd_wdata_p[359:352],tx2kernel_bd_wdata_p[367:360],
                               tx2kernel_bd_wdata_p[375:368],tx2kernel_bd_wdata_p[383:376],
                               tx2kernel_bd_wdata_p[391:384],tx2kernel_bd_wdata_p[399:392],
                               tx2kernel_bd_wdata_p[407:400],tx2kernel_bd_wdata_p[415:408],
                               tx2kernel_bd_wdata_p[423:416],tx2kernel_bd_wdata_p[431:424],
                               tx2kernel_bd_wdata_p[439:432],tx2kernel_bd_wdata_p[447:440],
                               tx2kernel_bd_wdata_p[455:448],tx2kernel_bd_wdata_p[463:456],
                               tx2kernel_bd_wdata_p[471:464],tx2kernel_bd_wdata_p[479:472],
                               tx2kernel_bd_wdata_p[487:480],tx2kernel_bd_wdata_p[495:488],
                               tx2kernel_bd_wdata_p[503:496],tx2kernel_bd_wdata_p[511:504]
                              };

always@(posedge clk_sys)
begin
    if (stxqm2inq_fifo_rd == 1'b1) begin
        thread_id<= stxqm2inq_fifo_wdata[233:226];
        opcode   <= stxqm2inq_fifo_wdata[225:224];
        acc_type <= stxqm2inq_fifo_wdata[215:208];
        ve_info  <= stxqm2inq_fifo_wdata[207:160];
        des_addr <= stxqm2inq_fifo_wdata[127:64] ;
        src_addr <= stxqm2inq_fifo_wdata[63:0]   ;
    end
    else;
end

always@(posedge clk_sys)
begin
    opcode_1dly   <= opcode;
end


assign rd_pkt_cmd_acc = ppm2stxm_rxffc_wdata_p[255];
assign rd_pkt_cmd_eod = ppm2stxm_rxffc_wdata_p[253] | (opcode == 2'd1);

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        rd_cmd_busy <= 1'd0;
    end
    else if((ppm2stxm_rxffc_wr == 1'd1)&&(rd_pkt_cmd_eod == 1'd1)&&(rd_cmd_busy == 1'd1))begin//eod cmd
        rd_cmd_busy <= 1'd0;
    end
    else if((stxqm2inq_fifo_rd == 1'd1)&&(rd_cmd_busy == 1'd0))begin
        rd_cmd_busy <= 1'd1;
    end
    else ;
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        pkt_online_rdy <= 1'd0;
    end
    else if(mmu_tx_online_beat < reg_mmu_tx_online_beat)begin
        pkt_online_rdy <= 1'd1;
    end
    else begin
        pkt_online_rdy <= 1'd0;
    end
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        bd_online_rdy <= 1'd0;
    end
    else if(bd_online_cnt < 9'd450)begin
        bd_online_rdy <= 1'd1;
    end
    else begin
        bd_online_rdy <= 1'd0;
    end
end

assign stxqm2inq_fifo_rd_en = pkt_online_rdy & bd_online_rdy & (~inq2stxqm_fifo_emp) & (~ddr_rsp_afull)
                              & (~stxqm2inq_fifo_rd) & (~rd_cmd_busy) & (~stxm2ppm_rxffc_ff);

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        stxqm2inq_fifo_rd <= 1'd0;
    end
    else begin
        stxqm2inq_fifo_rd <= stxqm2inq_fifo_rd_en;    
    end
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        len_latch_h <= 27'd0;
        len_latch_l <= 5'd0;
    end
    else if ((stxqm2inq_fifo_wdata[225:224] == 2'd1) && (stxqm2inq_fifo_rd == 1'b1)) begin
        len_latch_h <= 27'd0;
        len_latch_l <= 5'd0;
    end
    else begin
        len_latch_h <= stxqm2inq_fifo_wdata[159:133] - 27'd1;
        len_latch_l <= stxqm2inq_fifo_wdata[132:128];
    end
end

always@(posedge clk_sys)
begin
    real_len_latch_h <= stxqm2inq_fifo_wdata[159:133] - 27'd1;
    real_len_latch_l <= stxqm2inq_fifo_wdata[132:128];
end


assign len_latch = {len_latch_h,len_latch_l};
assign real_len_latch = {real_len_latch_h,real_len_latch_l};

always@(posedge clk_sys)
begin
    if(stxqm2inq_fifo_rd_1dly == 1'd1)begin
        len_left_high <= len_latch[31:12];
    end
    else if(((|len_left_high) == 1'd1)&&(ppm2stxm_rxffc_wr == 1'd1)&&(stxqm2inq_fifo_rd_2dly == 1'd0))begin
        len_left_high <= len_left_high - 20'd1;
    end
    else ;
end

always@(posedge clk_sys)
begin
    if(stxqm2inq_fifo_rd_1dly == 1'd1)begin
        len_left_low <= len_latch[11:0];
    end
    else ;
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        mmu_tx_online_beat <= 11'd0;
    end
    else if((ppm2stxm_rxffc_wr == 1'd1)&&(rd_pkt_cmd_acc == 1'd0)&&(online_feedback_en == 1'd1))begin
        mmu_tx_online_beat <= mmu_tx_online_beat + {4'd0,rd_len[12:6]} + 
                              {10'd0,(|rd_len[5:0])} - 11'd1;
    end
    else if((ppm2stxm_rxffc_wr == 1'd1)&&(rd_pkt_cmd_acc == 1'd0))begin
        mmu_tx_online_beat <= mmu_tx_online_beat + {4'd0,rd_len[12:6]} + 
                              {10'd0,(|rd_len[5:0])};
    end
    else if(((|mmu_tx_online_beat) == 1'd1)&&(online_feedback_en == 1'd1))begin
        mmu_tx_online_beat <= mmu_tx_online_beat - 11'd1;
    end
    else ;
end

assign ppm2stxm_rxffc_wr_en = rd_cmd_busy & pkt_online_rdy & (~ppm2stxm_rxffc_wr) & (~stxm2ppm_rxffc_ff);

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        ppm2stxm_rxffc_wr <= 1'd0;
    end
    else if ((stxqm2inq_fifo_rd_1dly == 1'b1)&&(rd_cmd_busy == 1'd1)) begin//read hardacc cmd
        ppm2stxm_rxffc_wr <= 1'd1;
    end
    else if((ppm2stxm_rxffc_wr_en == 1'd1)&&(((|len_left_high) == 1'd1)||((|len_left_low) == 1'd1)))begin
        ppm2stxm_rxffc_wr <= 1'd1;
    end
    else begin
        ppm2stxm_rxffc_wr <= 1'd0;
    end
end

always@(posedge clk_sys)
begin
    hardacc_flag <= stxqm2inq_fifo_rd_1dly;
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        sod_cmd_flag <= 1'd0;
    end
    else if((ppm2stxm_rxffc_wr == 1'd1)&&(stxqm2inq_fifo_rd_2dly == 1'b0))begin
        sod_cmd_flag <= 1'd0;
    end
    else if((stxqm2inq_fifo_rd_2dly == 1'b1) && (opcode_1dly != 2'd1))begin
        sod_cmd_flag <= 1'd1;
    end
    else ;
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        eod_cmd_flag <= 1'd0;
    end
    else if((ppm2stxm_rxffc_wr == 1'd1)&&(eod_cmd_flag == 1'd1))begin
        eod_cmd_flag <= 1'd0;
    end
    else if((rd_cmd_busy == 1'd1)&&(stxqm2inq_fifo_rd_2dly == 1'b1)&&
            (((len_left_high == 20'd1)&&((|len_left_low) == 1'd0))||
             ((len_left_high == 20'd0)&&((|len_left_low) == 1'd1))))begin
        eod_cmd_flag <= 1'd1;
    end
    else if((rd_cmd_busy == 1'd1)&&(ppm2stxm_rxffc_wr == 1'd1)&&(stxqm2inq_fifo_rd_2dly == 1'b0)&&
            (((len_left_high == 20'd2)&&((|len_left_low) == 1'd0))||
             ((len_left_high == 20'd1)&&((|len_left_low) == 1'd1))))begin
        eod_cmd_flag <= 1'd1;
    end
    else ;
end

always@(posedge clk_sys or posedge rst)
begin
    if( rst ==1'b1 ) begin
        ram_sn <= 9'd0;
    end
    else if (stxqm2inq_fifo_rd == 1'b1) begin
        ram_sn <= hdacc_sn_rdata[8:0];
    end
    else ;
end

always@(posedge clk_sys or posedge rst)
begin
    if( rst ==1'b1 ) begin
        init_cnt <= 10'd0;
    end
    else if (init_done == 1'b0) begin
        init_cnt <= init_cnt + 10'd1 ;
    end
    else ;
end 

assign init_done = init_cnt[9];

always@(posedge clk_sys or posedge rst)
begin
    if( rst == 1'b1) begin
        init_done_1dly <= 1'b0;
        init_ff_wen <= 1'b0;
    end
    else begin
        init_done_1dly <= init_done;
        init_ff_wen <= (init_done == 1'b0);
    end
end

always@(posedge clk_sys)
begin
    if (init_done ==1'b0) begin
        init_ff_wdata <= init_cnt[8:0];
    end
    else begin
        init_ff_wdata <= 9'd0; 
    end
end

//free fifo wen and wdata select
always@(posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        ff_wen_sel <= 1'b0;
    end
    else if (init_done_1dly == 1'b0) begin
        ff_wen_sel <= init_ff_wen;   //init_ff_wen invalid(from 1 to 0) means initial free fifo done
    end
    else begin
        ff_wen_sel <= ddr_rsp_ren;
    end
end

always @(posedge clk_sys)
begin
    if (init_done_1dly == 1'b0) begin
        ff_wdata_sel <= init_ff_wdata; //init_ff_wen invalid(from 1 to 0) means initial free fifo done
    end
    else begin
        ff_wdata_sel <= ddr_rsp_rdata[8:0];
    end
end

assign ff_wdata_sel_odd = {^ff_wdata_sel,ff_wdata_sel};


always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        rd_len <= 13'd0;
    end
    else if(stxqm2inq_fifo_rd_1dly == 1'b1)begin//hardacc
        rd_len <= 13'd32;
    end
    else if((|len_left_high) == 1'd1)begin
        rd_len <= 13'd4096;
    end
    else begin
        rd_len <= {1'd0,len_left_low};
    end
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        rd_src_addr <= 64'd0;
    end
    else if(stxqm2inq_fifo_rd_1dly == 1'b1)begin//latch src addr
        rd_src_addr <= src_addr;//add 32
    end
    else if(stxqm2inq_fifo_rd_2dly == 1'b1)begin//hardacc
        rd_src_addr <= {(rd_src_addr[63:5] + 59'd1),rd_src_addr[4:0]};//add 32
    end
    else if(ppm2stxm_rxffc_wr == 1'd1)begin
        rd_src_addr <= {(rd_src_addr[63:12] + 52'd1),rd_src_addr[11:0]};//add 4096
    end
    else ;
end

assign ppm2stxm_rxffc_wdata_p = {hardacc_flag,sod_cmd_flag,eod_cmd_flag,5'd0,rd_len,opcode,ram_sn,8'd0,
                               acc_type,ve_info,19'd0,rd_len,64'd0,rd_src_addr};

assign bd_ram_wen           = stxqm2inq_fifo_rd_1dly;
assign bd_ram_wdata         = {thread_id,opcode,real_len_latch,ve_info,des_addr,src_addr};
assign bd_ram_waddr         = ram_sn;

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        ddr_rsp_ren <= 1'd0;
    end
    else if((ddr_rsp_empty == 1'd0)&&(kernel2tx_afull == 1'd0)&&(mmu_rx2tx_afull == 1'd0)&&(ddr_rsp_ren == 1'd0))begin
        ddr_rsp_ren <= 1'd1;
    end
    else begin
        ddr_rsp_ren <= 1'd0;
    end
end

assign bd_ram_raddr  = ddr_rsp_rdata[8:0];
assign hcc_raddr     = ddr_rsp_rdata[8:0];

//tx2kernel_bd_wdata_p[225:224]:
//2'd1:read operation
//2'd2:write operation
//2'd0 or 2'd3 : process operation(same old example3)
always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        tx2kernel_bd_wen <= 1'd0;
        mmu_tx2rx_bd_wen <= 1'd0;
        mmu_tx2rx_wr_bd_wen <= 1'd0;
        mmu_tx2rx_rd_bd_wen <= 1'd0;
    end
    else begin
        tx2kernel_bd_wen <= ddr_rsp_ren_2dly & (tx2kernel_bd_wdata_p[225] == tx2kernel_bd_wdata_p[224]);
        mmu_tx2rx_bd_wen <= ddr_rsp_ren_2dly & (tx2kernel_bd_wdata_p[225] != tx2kernel_bd_wdata_p[224]);
        mmu_tx2rx_wr_bd_wen <= ddr_rsp_ren_2dly & (tx2kernel_bd_wdata_p[225:224] == 2'd2);
        mmu_tx2rx_rd_bd_wen <= ddr_rsp_ren_2dly & (tx2kernel_bd_wdata_p[225:224] == 2'd1);
    end
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        tx2kernel_bd_wdata <= 512'd0;
    end
    else begin
        tx2kernel_bd_wdata <= tx2kernel_bd_wdata_tmp;
    end
end

assign mmu_tx2rx_bd_wdata = tx2kernel_bd_wdata;

assign tx2kernel_bd_wdata_p = {112'd0,hcc_rdata[87:72],24'd0,bd_ram_rdata[207:176],hcc_rdata[71:0],22'd0,bd_ram_rdata[217:208],48'd0,bd_ram_rdata[175:0]};

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        bd_online_cnt <= 9'd0;
    end
    else if((stxqm2inq_fifo_rd == 1'd1)&&(ddr_rsp_ren == 1'd0))begin
        bd_online_cnt <= bd_online_cnt + 9'd1;
    end
    else if((stxqm2inq_fifo_rd == 1'd0)&&(ddr_rsp_ren == 1'd1)&&((|bd_online_cnt) == 1'd1))begin
        bd_online_cnt <= bd_online_cnt - 9'd1;
    end
    else ;
end

//------------------------------------------------------------------------------
sdpramb_sclk
        #(
        .WRITE_WIDTH          ( 218                 ), 
        .WRITE_DEPTHBIT       ( 9                   ), 
        .READ_WIDTH           ( 218                 ), 
        .READ_DEPTHBIT        ( 9                   )  
        ) u_bd_dram
        (
        .clock                ( clk_sys             ),
        .enable               ( 1'b1                ),
        .wren                 ( bd_ram_wen          ),
        .wraddress            ( bd_ram_waddr        ),
        .data                 ( bd_ram_wdata        ),
        .rdaddress            ( bd_ram_raddr        ),
        .q                    ( bd_ram_rdata        )
        );

sdpramb_sclk
        #(
        .WRITE_WIDTH          ( 88                  ), 
        .WRITE_DEPTHBIT       ( 9                   ), 
        .READ_WIDTH           ( 88                  ), 
        .READ_DEPTHBIT        ( 9                   )  
        ) u_hacc_dram
        (
        .clock                ( clk_sys             ),
        .enable               ( 1'b1                ),
        .wren                 ( hacc_wr             ),
        .wraddress            ( hacc_waddr          ),
        .data                 ( hacc_wdata          ),
        .rdaddress            ( hcc_raddr           ),
        .q                    ( hcc_rdata           )
        );

sfifo_cbb_enc # (
        .FIFO_PARITY          ( "FALSE"             ),
        .PARITY_DLY           ( "FALSE"             ),
        .FIFO_DO_REG          ( 0                   ), 
        .RAM_DO_REG           ( 0                   ),
        .FIFO_ATTR            ( "ahead"             ),
        .FIFO_WIDTH           ( 11                  ),
        .FIFO_DEEP            ( 9                   ),
        .AFULL_OVFL_THD       ( 450                 ),
        .AFULL_UNFL_THD       ( 450                 ),
        .AEMPTY_THD           ( 8                   ) 
        )
u_rd_cmd_fifo  (
        .clk_sys              ( clk_sys             ),
        .reset                ( rst                 ),
        .wen                  ( wr_ddr_rsp_en       ),
        .wdata                ( wr_ddr_rsp_sn       ),
        .ren                  ( ddr_rsp_ren         ),
        .rdata                ( ddr_rsp_rdata       ),
        .full                 (                     ),
        .empty                ( ddr_rsp_empty       ),
        .usedw                (                     ),
        .afull                ( ddr_rsp_afull       ), 
        .aempty               (                     ),
        .parity_err           (                     ),
        .fifo_stat            ( ddr_rsp_ff_stat     ) 
        );

sfifo_cbb_enc # (
        .FIFO_PARITY          ( "FALSE"             ),
        .PARITY_DLY           ( "FALSE"             ),
        .FIFO_DO_REG          ( 0                   ), 
        .RAM_DO_REG           ( 0                   ),
        .FIFO_ATTR            ( "ahead"             ),
        .FIFO_WIDTH           ( 10                  ),
        .FIFO_DEEP            ( 9                   ),
        .AFULL_OVFL_THD       ( 450                 ),
        .AFULL_UNFL_THD       ( 450                 ),
        .AEMPTY_THD           ( 8                   ) 
        )
u_hardacc_sn_fifo  (
        .clk_sys              ( clk_sys             ),
        .reset                ( rst                 ),
        .wen                  ( ff_wen_sel          ),
        .wdata                ( ff_wdata_sel_odd    ),
        .ren                  ( stxqm2inq_fifo_rd   ),
        .rdata                ( hdacc_sn_rdata      ),
        .full                 (                     ),
        .empty                (                     ),
        .usedw                (                     ),
        .afull                (                     ), 
        .aempty               (                     ),
        .parity_err           (                     ),
        .fifo_stat            ( hdacc_sn_ff_stat    ) 
        );


endmodule
