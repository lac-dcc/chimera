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


module  loop_bd_proc
                #
                (
                 parameter       BP_TIMER_CNT_WIDTH = 8                    ,
                 parameter       BP_PULSE_CNT_WIDTH = 8                    
                )
                (
                 //globe signals
                 input                            clk_sys                  ,
                 input                            rst                      ,

                 //ve to ae bd
                 output  reg                      stxqm2inq_fifo_rd        ,
                 input           [287:0]          stxqm2inq_fifo_rdata     ,
                 input   wire                     inq2stxqm_fifo_emp       ,

                 //ae to ve read command
                 output  reg                      ppm2stxm_rxffc_wr        ,
                 output  reg     [287:0]          ppm2stxm_rxffc_wdata     ,
                 input                            stxm2ppm_rxffc_ff        ,

                 //with pkt_gen 
                 output  wire                     rltpkt_hd_wen            , 
                 output  wire    [255:0]          rltpkt_hd_wdata          ,
                 input   wire                     rltpkt_hd_full           ,     
                 
                 input   wire                     tx_pkt_wend              ,     
                 
                 //dfx 
                 output  reg     [5:0]            reg_bd_sta               , 
                 output  reg     [5:0]            reg_bd_err               , 
                 input           [31:0]           reg_loop_cfg             , 
                 input   wire    [31:0]           reg_bp_mux_cfg           
                 
                  );


/**********************************************************************************\
    signals
\**********************************************************************************/
reg  [07:0]        acc_type                        ;
reg  [47:0]        ve_info                         ;
wire [31:0]        length                          ;
wire [63:0]        de_addr                         ;
reg  [25:0]        de_haddr_l26b                   ;
reg  [25:0]        de_haddr_h26b                   ;
reg  [11:0]        de_laddr                        ;
wire [63:0]        src_addr                        ;
reg  [25:0]        sr_haddr_l26b                   ;
reg  [25:0]        sr_haddr_h26b                   ;
reg  [11:0]        sr_laddr                        ;
wire               down_flag                       ;
reg                normal_cmd_wen                  ;
wire               long_cmd_wen                    ;
wire               rd_cmd_wen                      ;
wire [255:0]       rd_cmd_wdata                    ;
wire [255:0]       rd_cmd_copy_wdata               ;
wire               rd_cmd_full                     ;
wire               rd_cmd_empty                    ;
reg  [15:0]        rd_pkt_online_cnt               ;
reg                rd_cmd_ren                      ;
wire [255:0]       rd_cmd_rdata                    ;
wire               online_empty                    ;

wire               stxqm2inq_fifo_wr               ;
wire [287:0]       stxqm2inq_fifo_wdata            ;
wire [11:0]        len_l12b                        ;
wire [19:0]        len_h20b                        ;
reg                inq2stxqm_fifo_ff               ;

wire               bp_flag                         ;
reg  [1:0]         sel_bp_flag                     ;
reg                cut_flag                        ;
wire               cut_en                          ;
reg  [19:0]        left_hlen                       ;
reg  [11:0]        left_llen                       ;
reg  [19:0]        left_hlen_tmp                   ;
reg  [11:0]        left_llen_tmp                   ;
wire               cut_start                       ;
wire               cut_over                        ;
wire  [7:0]        reg_timer_cnt_cfg               ; 
wire  [7:0]        reg_bp_pulse_cycle_cfg          ; 
wire  [7:0]        reg_bp_pulse_duty_cycle_cfg     ; 
wire               reg_bp_en_cfg                   ; 
reg                reg_len_err                     ;  
wire  [2:0]        reg_bp_cfg                      ;

/**********************************************************************************\
    processes
\**********************************************************************************/
assign reg_bp_cfg = reg_loop_cfg[2:0];

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        sel_bp_flag <= 2'b00;    
    end
    else if(reg_bp_cfg == 3'b101) begin 
        sel_bp_flag <= {1'b0,bp_flag};    
    end
    else if(reg_bp_cfg == 3'b110) begin 
        sel_bp_flag <= {bp_flag,1'b0};    
    end
    else if(reg_bp_cfg == 3'b111) begin 
        sel_bp_flag <= {bp_flag,bp_flag};    
    end
    else begin
        sel_bp_flag <= 2'b00;    
    end
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        stxqm2inq_fifo_rd <= 1'd0;    
    end
    else if((inq2stxqm_fifo_emp == 1'd0)&&(inq2stxqm_fifo_ff == 1'd0)
            &&(stxqm2inq_fifo_rd == 1'd0)&&(cut_flag == 1'b0)&&(sel_bp_flag[0]==1'b0))begin
        stxqm2inq_fifo_rd <= 1'd1;    
    end
    else begin
        stxqm2inq_fifo_rd <= 1'd0;    
    end
end


assign stxqm2inq_fifo_wr = stxqm2inq_fifo_rd;
assign stxqm2inq_fifo_wdata = {stxqm2inq_fifo_rdata[287:256],
                               stxqm2inq_fifo_rdata[7  :0],
                               stxqm2inq_fifo_rdata[15 :8],
                               stxqm2inq_fifo_rdata[23 :16],
                               stxqm2inq_fifo_rdata[31 :24],
                               stxqm2inq_fifo_rdata[39 :32],
                               stxqm2inq_fifo_rdata[47 :40],
                               stxqm2inq_fifo_rdata[55 :48],
                               stxqm2inq_fifo_rdata[63 :56],
                               stxqm2inq_fifo_rdata[71 :64],
                               stxqm2inq_fifo_rdata[79 :72],
                               stxqm2inq_fifo_rdata[87 :80],
                               stxqm2inq_fifo_rdata[95 :88],
                               stxqm2inq_fifo_rdata[103:96],
                               stxqm2inq_fifo_rdata[111:104],
                               stxqm2inq_fifo_rdata[119:112],
                               stxqm2inq_fifo_rdata[127:120],
                               stxqm2inq_fifo_rdata[128 + 7  :128 + 0],
                               stxqm2inq_fifo_rdata[128 + 15 :128 + 8],
                               stxqm2inq_fifo_rdata[128 + 23 :128 + 16],
                               stxqm2inq_fifo_rdata[128 + 31 :128 + 24],
                               stxqm2inq_fifo_rdata[128 + 39 :128 + 32],
                               stxqm2inq_fifo_rdata[128 + 47 :128 + 40],
                               stxqm2inq_fifo_rdata[128 + 55 :128 + 48],
                               stxqm2inq_fifo_rdata[128 + 63 :128 + 56],
                               stxqm2inq_fifo_rdata[128 + 71 :128 + 64],
                               stxqm2inq_fifo_rdata[128 + 79 :128 + 72],
                               stxqm2inq_fifo_rdata[128 + 87 :128 + 80],
                               stxqm2inq_fifo_rdata[128 + 95 :128 + 88],
                               stxqm2inq_fifo_rdata[128 + 103:128 + 96],
                               stxqm2inq_fifo_rdata[128 + 111:128 + 104],
                               stxqm2inq_fifo_rdata[128 + 119:128 + 112],
                               stxqm2inq_fifo_rdata[128 + 127:128 + 120]
                              };

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        inq2stxqm_fifo_ff <= 1'd0;
    end
    else  begin
        inq2stxqm_fifo_ff <= rd_cmd_full | rltpkt_hd_full;   
    end
end     

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        acc_type <= 8'd0;
        ve_info  <= 48'd0;
        left_llen <= 12'd0;
    end
    else if (stxqm2inq_fifo_wr == 1'b1) begin
        acc_type   <= stxqm2inq_fifo_wdata[215:208];
        ve_info    <= stxqm2inq_fifo_wdata[207:160];
        left_llen <= stxqm2inq_fifo_wdata[139:128];
    end
    else;
end

assign len_l12b = stxqm2inq_fifo_wdata[139:128];   
assign len_h20b = stxqm2inq_fifo_wdata[159:140];  
always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        normal_cmd_wen <= 1'd0;
    end
    else begin
        normal_cmd_wen <= stxqm2inq_fifo_wr&(((len_h20b==20'd1)&&(len_l12b==12'd0))||(len_h20b==20'd0));
    end
end    

assign long_cmd_wen = cut_en;
assign rd_cmd_wen   = normal_cmd_wen | long_cmd_wen;  


assign cut_start = ((stxqm2inq_fifo_wr==1'b1)&(((len_h20b==20'd1)&&(len_l12b!=12'd0))||(len_h20b>20'd1))); 

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        cut_flag <= 1'b0;
    end
    else if (cut_start ==1'b1) begin
        cut_flag <= 1'b1;
    end
    else if(cut_over == 1'b1 )begin
        cut_flag <= 1'b0;
    end
    else;
end    

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        left_hlen <= 20'd0;
    end
    else if(stxqm2inq_fifo_wr==1'b1)begin
        left_hlen <= stxqm2inq_fifo_wdata[159:140];
    end
    else if((cut_flag == 1'b1)&&(inq2stxqm_fifo_ff==1'b0))begin
        left_hlen <= left_hlen - 20'd1;
    end
    else;
end    

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        left_hlen_tmp <= 20'd0;
    end
    else if(((stxqm2inq_fifo_wr==1'b1)&&(len_h20b==20'd0))
           || ((cut_flag == 1'b1)&&(inq2stxqm_fifo_ff==1'b0)&&
              ((left_hlen == 20'd1)&&(left_llen!=12'd0))))begin
        left_hlen_tmp <= 20'd0;
    end
    else if(((stxqm2inq_fifo_wr==1'b1)&&(len_h20b!=20'd0))
           || ((cut_flag == 1'b1)&&(inq2stxqm_fifo_ff==1'b0)&&
              ((left_hlen == 20'd2)&&(left_llen==12'd0))))begin
        left_hlen_tmp <= 20'd1;
    end
    else;
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        left_llen_tmp <= 12'd0;
    end
    else if(cut_start ==1'b1)begin
        left_llen_tmp <= 12'd0;
    end
    else if(stxqm2inq_fifo_wr ==1'b1)begin
        left_llen_tmp <= stxqm2inq_fifo_wdata[139:128];
    end
    else if((cut_flag == 1'b1)&&(inq2stxqm_fifo_ff==1'b0)&&
             (  ((left_hlen == 20'd1)&&(left_llen!=12'd0))
              ||((left_hlen == 20'd2)&&(left_llen==12'd0))))begin
        left_llen_tmp <= left_llen;
    end
    else;
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        de_haddr_l26b <= 26'd0;
    end
    else if(stxqm2inq_fifo_wr==1'b1)begin
        de_haddr_l26b <= stxqm2inq_fifo_wdata[101:76];
    end   
    else if((cut_flag == 1'b1)&&(inq2stxqm_fifo_ff==1'b0))begin
        de_haddr_l26b <= de_haddr_l26b + 26'd1;
    end
    else ; 
end
always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        de_haddr_h26b <= 26'd0;
    end
    else if(stxqm2inq_fifo_wr==1'b1)begin
        de_haddr_h26b <= stxqm2inq_fifo_wdata[127:102];
    end   
    else if((cut_flag == 1'b1)&&(inq2stxqm_fifo_ff==1'b0)&&(de_haddr_l26b==26'h3ffffff))begin
        de_haddr_h26b <= de_haddr_h26b + 26'd1;
    end
    else ; 
end

assign length = {left_hlen_tmp,left_llen_tmp};

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        de_laddr <= 12'd0;
    end
    else if(stxqm2inq_fifo_wr==1'b1)begin
        de_laddr <= stxqm2inq_fifo_wdata[75:64];
    end    
    else;   
end
    
always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        sr_haddr_l26b <= 26'd0;
    end
    else if(stxqm2inq_fifo_wr==1'b1)begin
        sr_haddr_l26b <= stxqm2inq_fifo_wdata[37:12];
    end   
    else if((cut_flag == 1'b1)&&(inq2stxqm_fifo_ff==1'b0))begin
        sr_haddr_l26b <= sr_haddr_l26b + 26'd1;
    end
    else ; 
end
always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        sr_haddr_h26b <= 26'd0;
    end
    else if(stxqm2inq_fifo_wr==1'b1)begin
        sr_haddr_h26b <= stxqm2inq_fifo_wdata[63:38];
    end   
    else if((cut_flag == 1'b1)&&(inq2stxqm_fifo_ff==1'b0)&&(sr_haddr_l26b==26'h3ffffff))begin
        sr_haddr_h26b <= sr_haddr_h26b + 26'd1;
    end
    else ; 
end
always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        sr_laddr <= 12'd0;
    end
    else if(stxqm2inq_fifo_wr==1'b1)begin
        sr_laddr <= stxqm2inq_fifo_wdata[11:0];
    end 
    else;   
end
assign src_addr = {sr_haddr_h26b,sr_haddr_l26b,sr_laddr};
assign de_addr = {de_haddr_h26b,de_haddr_l26b,de_laddr};


assign cut_over = cut_flag &(~inq2stxqm_fifo_ff) 
                  &   (((left_hlen == 20'd1)&&(left_llen==12'd0))
                   || ((left_hlen == 20'd0)&&(left_llen !=12'd0))) ;

assign cut_en = ((cut_flag == 1'b1)&&(inq2stxqm_fifo_ff==1'b0));


assign down_flag = (~cut_flag) | cut_over;

//|--------------|-----------------------------------------|
//|bit[255:224]  | ae info                                 |
//|--------------|-----------------------------------------|
//|bit[223:216]  | rsv                                     |
//|--------------|-----------------------------------------|
//|bit[215:208]  | acc type                                |
//|--------------|-----------------------------------------|
//|bit[207:160]  | ve info                                 |
//|--------------|-----------------------------------------|
//|bit[159:128]  | Length                                  |
//|--------------|-----------------------------------------|
//|bit[127:64]   | rsv                                     |
//|--------------|-----------------------------------------|
//|bit[63:0]     | src addr                                |
//|--------------|-----------------------------------------|
assign rd_cmd_wdata      = {32'd0,8'd0,acc_type,ve_info,length,de_addr,src_addr};

//latch some signal for read pkt
sfifo_cbb_enc # (
        .FIFO_PARITY       ( "FALSE"               ),
        .PARITY_DLY        ( "FALSE"               ),
        .FIFO_DO_REG       ( 0                     ), 
        .RAM_DO_REG        ( 0                     ),
        .FIFO_ATTR         ( "ahead"               ),
        .FIFO_WIDTH        ( 256                   ),
        .FIFO_DEEP         ( 9                     ),
        .AFULL_OVFL_THD    ( 450                   ),
        .AFULL_UNFL_THD    ( 450                   ),
        .AEMPTY_THD        ( 8                     ) 
        )
U_rd_cmd_fifo  (
        .clk_sys           (clk_sys                ),
        .reset             (rst                    ),
        .wen               (rd_cmd_wen             ),
        .wdata             (rd_cmd_wdata           ),
        .ren               (rd_cmd_ren             ),
        .rdata             (rd_cmd_rdata           ),
        .full              (                       ),
        .empty             (rd_cmd_empty           ),
        .usedw             (                       ),
        .afull             (rd_cmd_full            ), 
        .aempty            (                       ),
        .parity_err        (                       ),
        .fifo_stat         (                       ) 
        );


always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        rd_pkt_online_cnt <= 16'd0;
    end
    else if((rd_cmd_ren == 1'd1)&&(tx_pkt_wend == 1'd0))begin
        rd_pkt_online_cnt <= rd_pkt_online_cnt + 16'd1;
    end
    else if((rd_cmd_ren == 1'd0)&&(tx_pkt_wend == 1'd1)&&(rd_pkt_online_cnt > 16'd0))begin
        rd_pkt_online_cnt <= rd_pkt_online_cnt - 16'd1;
    end
    else ;
end

assign online_empty =  (rd_pkt_online_cnt < reg_bp_mux_cfg[15:0]);

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        rd_cmd_ren <= 1'd0;
    end
    else if((rd_cmd_ren == 1'd0)&&(online_empty == 1'b1)
           &&(stxm2ppm_rxffc_ff == 1'd0)&&
            (rd_cmd_empty == 1'd0)&&(sel_bp_flag[1]==1'b0))begin
        rd_cmd_ren <= 1'd1;
    end
    else begin
        rd_cmd_ren <= 1'd0;
    end
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        ppm2stxm_rxffc_wr <= 1'd0;
    end
    else begin
        ppm2stxm_rxffc_wr <= rd_cmd_ren;
    end
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        ppm2stxm_rxffc_wdata <= 288'd0;
    end
    else begin                 //odd  rsv   eop  err  mod  data
        ppm2stxm_rxffc_wdata <= {9'd0,16'd0,1'd1,1'd0,5'd0,
                                 rd_cmd_rdata[7  :0],
                                 rd_cmd_rdata[15 :8],
                                 rd_cmd_rdata[23 :16],
                                 rd_cmd_rdata[31 :24],
                                 rd_cmd_rdata[39 :32],
                                 rd_cmd_rdata[47 :40],
                                 rd_cmd_rdata[55 :48],
                                 rd_cmd_rdata[63 :56],
                                 rd_cmd_rdata[71 :64],
                                 rd_cmd_rdata[79 :72],
                                 rd_cmd_rdata[87 :80],
                                 rd_cmd_rdata[95 :88],
                                 rd_cmd_rdata[103:96],
                                 rd_cmd_rdata[111:104],
                                 rd_cmd_rdata[119:112],
                                 rd_cmd_rdata[127:120],
                                 rd_cmd_rdata[128 + 7  :128 + 0],
                                 rd_cmd_rdata[128 + 15 :128 + 8],
                                 rd_cmd_rdata[128 + 23 :128 + 16],
                                 rd_cmd_rdata[128 + 31 :128 + 24],
                                 rd_cmd_rdata[128 + 39 :128 + 32],
                                 rd_cmd_rdata[128 + 47 :128 + 40],
                                 rd_cmd_rdata[128 + 55 :128 + 48],
                                 rd_cmd_rdata[128 + 63 :128 + 56],
                                 rd_cmd_rdata[128 + 71 :128 + 64],
                                 rd_cmd_rdata[128 + 79 :128 + 72],
                                 rd_cmd_rdata[128 + 87 :128 + 80],
                                 rd_cmd_rdata[128 + 95 :128 + 88],
                                 rd_cmd_rdata[128 + 103:128 + 96],
                                 rd_cmd_rdata[128 + 111:128 + 104],
                                 rd_cmd_rdata[128 + 119:128 + 112],
                                 rd_cmd_rdata[128 + 127:128 + 120]
                                };
    end                        
end

//|--------------|-----------------------------------------|
//|bit[255:217]  | rsv                                     |
//|--------------|-----------------------------------------|
//|bit[216]      | done flag                               |
//|--------------|-----------------------------------------|
//|bit[215:208]  | acc type                                |
//|--------------|-----------------------------------------|
//|bit[207:160]  | ve info                                 |
//|--------------|-----------------------------------------|
//|bit[159:128]  | rsv                                     |
//|--------------|-----------------------------------------|
//|bit[127:64]   | de addr                                 |
//|--------------|-----------------------------------------|
//|bit[63:0]     | rsv                                     |
//|--------------|-----------------------------------------|
assign rd_cmd_copy_wdata = {39'd0,down_flag,acc_type,ve_info,32'd0,de_addr,src_addr};
assign rltpkt_hd_wen     = rd_cmd_wen; 
assign rltpkt_hd_wdata   = rd_cmd_copy_wdata; 

/**********************************************************************************\
  reg    
\**********************************************************************************/
always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        reg_bd_sta <= 6'd0;
    end
    else begin
        reg_bd_sta <= {1'b0,(|sel_bp_flag),rltpkt_hd_full,stxm2ppm_rxffc_ff,rd_cmd_full,rd_cmd_empty};
    end
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        reg_len_err <= 1'd0;
    end
    else begin
        reg_len_err <=stxqm2inq_fifo_wr&(~(|stxqm2inq_fifo_wdata[159:128]));
    end
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        reg_bd_err <= 6'd0;
    end
    else begin
        reg_bd_err <= {2'd0,reg_len_err,rltpkt_hd_full,stxm2ppm_rxffc_ff,rd_cmd_full};
    end
end

/**********************************************************************************\
  gen_bp   
\**********************************************************************************/
bp_ctrl #(
    .BP_TIMER_FROM_OUT              ( "NO"                            ),
    .BP_TIMER_CNT_WIDTH             ( BP_TIMER_CNT_WIDTH               ),
    .BP_PULSE_CNT_WIDTH             ( BP_PULSE_CNT_WIDTH               ) 
    )
u_bp_ctrl (
    .clks                           ( clk_sys                          ),
    .reset                          ( rst                              ),
    .timer_pulse_flg                ( 1'b0                             ),
    .reg_bp_en_cfg                  ( reg_bp_en_cfg                    ),
    .reg_bp_timer_cnt_cfg           ( reg_timer_cnt_cfg                ),
    .reg_bp_pulse_cycle_cfg         ( reg_bp_pulse_cycle_cfg[7:0]      ),
    .reg_bp_pulse_duty_cycle_cfg    ( reg_bp_pulse_duty_cycle_cfg[7:0] ),
    .ctrl_bp_en                     ( bp_flag                          ) 
    );

assign reg_bp_en_cfg               = reg_loop_cfg[4];
assign reg_timer_cnt_cfg           = reg_loop_cfg[15:8]; 
assign reg_bp_pulse_cycle_cfg      = reg_loop_cfg[23:16];
assign reg_bp_pulse_duty_cycle_cfg = reg_loop_cfg[31:24];

endmodule
