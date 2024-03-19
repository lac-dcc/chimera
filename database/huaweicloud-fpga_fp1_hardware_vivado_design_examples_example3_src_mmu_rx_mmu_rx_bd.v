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
`timescale 1ns/100ps

module  mmu_rx_bd 
                 (
                 //globe signals
                 input                           clk_sys                    ,
                 input                           rst                        ,
                
                 //BD signal with Kernel  
                 input                           ker2mmu_bd_tlast           ,
                 input   [511:0]                 ker2mmu_bd_tdata           ,
                 input   [74:0]                  ker2mmu_bd_tuser           ,
                 input   [63:0]                  ker2mmu_bd_tkeep           ,
                 input                           ker2mmu_bd_tvalid          ,
                 output                          mmu2ker_bd_tready          ,                               

                 //with mmu_tx
                 input                           bd2rx_s_axis_rq_tlast      ,
                 input   [511:0]                 bd2rx_s_axis_rq_tdata      ,
                 input   [59:0]                  bd2rx_s_axis_rq_tuser      ,
                 input   [63:0]                  bd2rx_s_axis_rq_tkeep      ,
                 output                          bd2rx_s_axis_rq_tready     ,
                 input                           bd2rx_s_axis_rq_tvalid     ,

                 //eoc tag info with mmu_rx_pkt 
                 input   [3:0]                   eoc_tag_ren                , 
                 output  [3:0]                   eoc_tag_rdata              ,
                 output  [3:0]                   eoc_tag_empty              ,
                 
                 input                           chn_seq_ren                , 
                 output  [1:0]                   chn_seq_rdata              ,
                 output                          chn_seq_empty              ,
                 
                 input                           ve_ff_rd                   , 
                 input   [1:0]                   ve_ff_rport                ,
                 output  [511:0]                 ve_ff_rdata                ,
                 output  [3:0]                   ve_ff_empty                ,              
                 
                 output  [3:0]                   bucket_inc_wr              ,
                 output  [13:0]                  bucket_inc_wdata           ,
                 input   [3:0]                   bucket_af                  ,               
                 //write operation BD
                 output  reg                     mmu_tx2rx_bd_wr            ,
                 output  reg [539:0]             mmu_tx2rx_bd_wdata         ,
                 input                           mmu_tx2rx_bd_afull         , 

                //with axim 
                 input   [3:0]                   rcmd_ff_full_que           ,       
                 output  [3:0]                   rcmd_ff_wen_que            ,
                 output  [71:0]                  rcmd_ff_wdata              ,  
                 
                 //with cpu 
                 output  reg                     axis_fifo_rd               ,
                 output  reg                     bd2rx_axis_fifo_rd         ,
                 output  reg                     read_op_vld_dly            ,
                 output  reg                     write_op_vld_dly           ,
                 output                          reg_mmu_rxbd_en            ,
                 output                          reg_mmu_rdcmd_en           ,
                 output  [31:0]                  reg_mmu_rxbd_sta           ,
                 output  [31:0]                  reg_eoc_tag_ff_stat        ,    
                 output  [31:0]                  reg_mmu_rxbd_err             

                 );

/*********************************************************************************************************************\
    signals
\*********************************************************************************************************************/
//reg                                 axis_fifo_rd                    ;
reg                                 tdm_flg                         ;
reg                                 axis_fifo_rd_1dly               ;
wire    [539:0]                     axis_fifo_rdata_conver          ;
wire    [539:0]                     axis_fifo_rdata                 ;
reg     [539:0]                     axis_fifo_rdata_1dly            ;
wire                                axis_fifo_emp                   ;

wire                                bd2rx_axis_fifo_emp             ;
//reg                                 bd2rx_axis_fifo_rd              ;
wire    [539:0]                     bd2rx_axis_fifo_rdata_conver    ;
wire    [539:0]                     bd2rx_axis_fifo_rdata           ;
wire                                read_op_vld                     ;
wire                                write_op_vld                    ;

wire    [1:0]                       ddr_id                          ;
reg     [31:0]                      length                          ;
wire    [31:0]                      lenth                           ;

wire    [35:0]                      fddr_des_addr                   ;                     
reg     [35:0]                      fddr_des_addr_base              ;                     

reg     [11:0]                      fddr_des_laddr                  ;
reg     [5:0]                       fddr_des_haddr_l6b              ;
reg     [15:0]                      fddr_des_haddr_h16b             ;
reg     [1:0]                       fddr_des_haddr_h2b              ;

wire    [3:0]                       eoc_tag_wen                     ;
wire    [3:0]                       eoc_tag_wdata                   ;
wire    [3:0]                       eoc_tag_full                    ;

wire                                chn_seq_wen                     ;
wire    [1:0]                       chn_seq_wdata                   ;
wire                                chn_seq_full                    ;

wire    [11:0]                      len_l12b                        ;
wire    [19:0]                      len_h20b                        ;
wire                                down_flag                       ;
reg                                 normal_cmd_wen                  ;
wire                                long_cmd_wen                    ;

reg                                 cut_flag                        ;
wire                                cut_en                          ;
reg     [19:0]                      left_hlen                       ;
reg     [11:0]                      left_llen                       ;
reg     [19:0]                      left_hlen_tmp                   ;
reg     [11:0]                      left_llen_tmp                   ;
wire                                cut_start                       ;
wire                                cut_over                        ;

wire                                ve_ff_wr                        ;   
wire    [539:0]                     ve_ff_wdata                     ;   
wire    [1:0]                       ve_ff_wport                     ;   
wire    [3:0]                       ve_ff_aff                       ;   

reg                                 eoc_que_full                    ;
reg                                 veinfo_que_full                 ;

reg                                 cache_ff                        ;
reg                                 online_af                       ;
reg                                 rcmd_ff_full                    ;

wire                                fifo_err                        ;            
wire                                bd2rx_fifo_err                  ;            
wire                                chn_seq_parity_err              ;            
wire    [3:0]                       eoc_tag_parity_err              ;            
wire    [31:0]                      eoc_tag_ff_stat                 ;            

wire    [3:0]                       overflow                        ;            
wire    [3:0]                       underflow                       ;            
wire    [1:0]                       fifo_status                     ;            
wire    [1:0]                       bd2rx_fifo_status               ;            

wire                                rcmd_ff_wen                     ;
reg                                 reg_len_err                     ;
wire    [7:0]                       chn_seq_ff_stat                 ;    

genvar i ;
genvar j ;
genvar k ;
/*********************************************************************************************************************\
    process
\*********************************************************************************************************************/
//|--------------|-----------------------------------------|
//|bit[511:400]  | rsv                                     |
//|--------------|-----------------------------------------|
//|bit[399:384]  | crc                                     |
//|--------------|-----------------------------------------|
//|bit[383:360]  | rsv                                     |
//|--------------|-----------------------------------------|
//|bit[359:328]  | Length                                  |
//|--------------|-----------------------------------------|
//|bit[327:292]  | FPGA DDR DES ADDR                       |
//|--------------|-----------------------------------------|
//|bit[291:256]  | FPGA DDR SRC ADDR                       |
//|--------------|-----------------------------------------|
//|bit[255:176]  | rsv                                     |
//|--------------|-----------------------------------------|
//|bit[175:128]  | ve info                                 |
//|--------------|-----------------------------------------|
//|bit[127:64]   | des_addr                                |
//|--------------|-----------------------------------------|
//|bit[63:0]     | src addr                                |
//|--------------|-----------------------------------------|
always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        tdm_flg <= 1'd0;    
    end
    else begin
        tdm_flg <= ~tdm_flg;    
    end
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        axis_fifo_rd <= 1'd0;    
    end
    else if((axis_fifo_emp == 1'd0)&&(cache_ff == 1'd0)
            &&(axis_fifo_rd == 1'd0)&&(cut_flag==1'b0) && 
           (tdm_flg == 1'b1))begin
        axis_fifo_rd <= 1'd1;    
    end
    else begin
        axis_fifo_rd <= 1'd0;    
    end
end


//------------------------------------------------------------------------------
always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        bd2rx_axis_fifo_rd <= 1'd0;    
    end
    else if((bd2rx_axis_fifo_emp == 1'd0)&&(cache_ff == 1'd0) &&
            (bd2rx_axis_fifo_rd == 1'd0)&&(cut_flag==1'b0) && 
            (mmu_tx2rx_bd_afull == 1'b0) && (tdm_flg == 1'b0))begin
        bd2rx_axis_fifo_rd <= 1'd1;    
    end
    else begin
        bd2rx_axis_fifo_rd <= 1'd0;    
    end
end


generate
    for (j = 0; j<64; j=j+1 ) begin : LITTLE2BIG_GEN
        assign axis_fifo_rdata[(63-j)*8+7: (63-j)*8 ] = axis_fifo_rdata_conver[j*8+7:j*8];
        assign bd2rx_axis_fifo_rdata[(63-j)*8+7: (63-j)*8 ] = bd2rx_axis_fifo_rdata_conver[j*8+7:j*8];
    end
endgenerate

assign axis_fifo_rdata[539:512] = axis_fifo_rdata_conver[539:512];
assign bd2rx_axis_fifo_rdata[539:512] = bd2rx_axis_fifo_rdata_conver[539:512];
assign read_op_vld = bd2rx_axis_fifo_rd & (bd2rx_axis_fifo_rdata[225:224] == 2'd1);
assign write_op_vld = bd2rx_axis_fifo_rd & (bd2rx_axis_fifo_rdata[225:224] == 2'd2);

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        read_op_vld_dly <= 1'd0;    
        write_op_vld_dly <= 1'd0;    
    end
    else begin
        read_op_vld_dly <= read_op_vld;    
        write_op_vld_dly <= write_op_vld;    
    end
end


assign ddr_id   = fddr_des_addr[35:34]; 


always@(*)
begin
    if(read_op_vld == 1'b1)begin
        length = bd2rx_axis_fifo_rdata[359:328];    
        fddr_des_addr_base = bd2rx_axis_fifo_rdata[327:292];    
    end
    else begin
        length = axis_fifo_rdata[359:328];    
        fddr_des_addr_base = axis_fifo_rdata[327:292];    
    end
end    



//------------------------------------------------------------------------------
/*********************************************************************************************************************\
   gen read command
\*********************************************************************************************************************/
always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        eoc_que_full <= 1'd0;    
    end
    else begin
        eoc_que_full <= | eoc_tag_full;    
    end
end    

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        veinfo_que_full <= 1'd0;    
    end
    else begin
        veinfo_que_full <= | ve_ff_aff;    
    end
end    

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        online_af <= 1'd0;    
    end
    else begin
        online_af <= | bucket_af;    
    end
end    

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        rcmd_ff_full <= 1'd0;    
    end
    else begin
        rcmd_ff_full <= | rcmd_ff_full_que;    
    end
end    

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        cache_ff <= 1'd0;    
    end
    else begin
        cache_ff <= eoc_que_full | veinfo_que_full | rcmd_ff_full | chn_seq_full| online_af;    
    end
end    

assign len_l12b = length[11:0];   
assign len_h20b = length[31:12];  

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        normal_cmd_wen <= 1'd0;
    end
    else begin
        normal_cmd_wen <= (axis_fifo_rd | read_op_vld)&(((len_h20b==20'd1)&&(len_l12b==12'd0))||(len_h20b==20'd0));
    end
end    

assign long_cmd_wen = cut_en;
assign rcmd_ff_wen   = normal_cmd_wen | long_cmd_wen;  

assign cut_start = (((axis_fifo_rd==1'b1) | (read_op_vld==1'b1))&(((len_h20b==20'd1)&&(len_l12b!=12'd0))||(len_h20b>20'd1))); 

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
        left_llen <= 12'd0;
    end
    else if ((axis_fifo_rd == 1'b1) || (read_op_vld == 1'b1)) begin
        left_llen <= len_l12b;
    end
    else;
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        left_hlen <= 20'd0;
    end
    else if((axis_fifo_rd==1'b1) || (read_op_vld==1'b1))begin
        left_hlen <= len_h20b;
    end
    else if((cut_flag == 1'b1)&&(cache_ff==1'b0))begin
        left_hlen <= left_hlen - 20'd1;
    end
    else;
end    

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        left_hlen_tmp <= 20'd0;
    end
    else if((((axis_fifo_rd==1'b1) || (read_op_vld==1'b1))&&(len_h20b==20'd0))
           || ((cut_flag == 1'b1)&&(cache_ff==1'b0)&&
              ((left_hlen == 20'd1)&&(left_llen!=12'd0))))begin
        left_hlen_tmp <= 20'd0;
    end
    else if((((axis_fifo_rd==1'b1) || (read_op_vld==1'b1))&&(len_h20b!=20'd0))
           || ((cut_flag == 1'b1)&&(cache_ff==1'b0)&&
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
    else if((axis_fifo_rd==1'b1) || (read_op_vld==1'b1))begin
        left_llen_tmp <= len_l12b;
    end
    else if((cut_flag == 1'b1)&&(cache_ff==1'b0)&&
             (  ((left_hlen == 20'd1)&&(left_llen!=12'd0))
              ||((left_hlen == 20'd2)&&(left_llen==12'd0))))begin
        left_llen_tmp <= left_llen;
    end
    else;
end

assign lenth = {left_hlen_tmp,left_llen_tmp};

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        fddr_des_laddr <= 12'd0;
    end
    else if((axis_fifo_rd==1'b1) || (read_op_vld==1'b1))begin
        fddr_des_laddr <= fddr_des_addr_base[11:0];
    end   
    else;
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        fddr_des_haddr_l6b <= 6'd0;
    end
    else if((axis_fifo_rd==1'b1) || (read_op_vld==1'b1))begin
        fddr_des_haddr_l6b <= fddr_des_addr_base[17:12];
    end   
    else if((cut_flag == 1'b1)&&(cache_ff==1'b0))begin
        fddr_des_haddr_l6b <= fddr_des_haddr_l6b + 6'd1;
    end
    else ; 
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        fddr_des_haddr_h16b <= 16'd0;
    end
    else if((axis_fifo_rd==1'b1) || (read_op_vld==1'b1))begin
        fddr_des_haddr_h16b <= fddr_des_addr_base[33:18];
    end   
    else if((cut_flag == 1'b1)&&(cache_ff==1'b0)&&(fddr_des_haddr_l6b==6'h3f))begin
        fddr_des_haddr_h16b <= fddr_des_haddr_h16b + 16'd1;
    end
    else ; 
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        fddr_des_haddr_h2b <= 2'd0;
    end
    else if((axis_fifo_rd==1'b1) || (read_op_vld==1'b1))begin
        fddr_des_haddr_h2b <= fddr_des_addr_base[35:34];
    end   
    else;
end     

assign fddr_des_addr = {fddr_des_haddr_h2b,fddr_des_haddr_h16b,fddr_des_haddr_l6b,fddr_des_laddr};

assign cut_over = cut_flag &(~cache_ff) 
                  &   (((left_hlen == 20'd1)&&(left_llen==12'd0))
                   || ((left_hlen == 20'd0)&&(left_llen !=12'd0))) ;

assign cut_en = ((cut_flag == 1'b1)&&(cache_ff==1'b0));

assign down_flag = (~cut_flag) | cut_over;

/*********************************************************************************************************************\
   gen wr interface
\*********************************************************************************************************************/
assign rcmd_ff_wdata  = {4'd2,lenth,fddr_des_addr};

generate
    for (i = 0; i<4; i=i+1 ) begin : GEN_EOC_TAG_WR
    
        assign eoc_tag_wen[i]     = (ddr_id == i) ? rcmd_ff_wen:1'b0;   
        assign eoc_tag_wdata[i]   = down_flag;

        assign bucket_inc_wr[i]   = (ddr_id == i) ? rcmd_ff_wen:1'b0; 
        assign rcmd_ff_wen_que[i] = (ddr_id == i) ? rcmd_ff_wen:1'b0;   

    end
endgenerate
        
assign bucket_inc_wdata = lenth[13:0]; 

assign ve_ff_wr         = axis_fifo_rd_1dly; 
assign ve_ff_wdata      = axis_fifo_rdata_1dly; 
assign ve_ff_wport      = ddr_id; 

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
       axis_fifo_rd_1dly <= 1'b0 ;
    end
    else begin
       axis_fifo_rd_1dly <= axis_fifo_rd | read_op_vld;
    end
end



always@(posedge clk_sys)
begin
    if(read_op_vld == 1'b1)begin
        axis_fifo_rdata_1dly <= bd2rx_axis_fifo_rdata ;
    end
    else begin
        axis_fifo_rdata_1dly <= axis_fifo_rdata ;
    end
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
       mmu_tx2rx_bd_wr <= 1'b0 ;
    end
    else begin
       mmu_tx2rx_bd_wr <= write_op_vld;
    end
end

always@(posedge clk_sys)
begin
    mmu_tx2rx_bd_wdata <= bd2rx_axis_fifo_rdata ;
end



always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
       reg_len_err <= 1'b0 ;
    end
    else begin
       reg_len_err <= (axis_fifo_rd | read_op_vld) & (~(|length));
    end
end



assign chn_seq_wen      = axis_fifo_rd_1dly;
assign chn_seq_wdata    = ddr_id ;


assign reg_mmu_rxbd_err = {1'b0,
                          eoc_tag_ff_stat[30:28],
                          eoc_tag_ff_stat[22:20],
                          eoc_tag_ff_stat[14:12],
                          eoc_tag_ff_stat[6:4],
                          bd2rx_fifo_err,
                          chn_seq_ff_stat[6:4],
                          reg_len_err,
                          fifo_err,
                          chn_seq_parity_err,
                          eoc_tag_parity_err,
                          underflow,
                          overflow};

assign reg_mmu_rxbd_sta = {5'd0,
                          cut_flag,
                          mmu_tx2rx_bd_afull,
                          bd2rx_axis_fifo_emp,
                          bd2rx_fifo_status,
                          cache_ff,
                          axis_fifo_emp,
                          fifo_status,
                          chn_seq_full,
                          chn_seq_empty,
                          eoc_tag_full,
                          eoc_tag_empty,
                          ve_ff_aff,
                          ve_ff_empty};

assign reg_eoc_tag_ff_stat = {16'd0,
                          eoc_tag_ff_stat[27:24],
                          eoc_tag_ff_stat[19:16],
                          eoc_tag_ff_stat[11:8],
                          eoc_tag_ff_stat[3:0]};

assign reg_mmu_rxbd_en  = axis_fifo_rd_1dly; 
assign reg_mmu_rdcmd_en = rcmd_ff_wen; 

/*********************************************************************************************************************\
    instance
\*********************************************************************************************************************/
raxi_rc512_fifo rx_bd
    (
    .pcie_clk               (clk_sys                ),
    .pcie_rst               (rst                    ),
    .pcie_link_up           (1'd1                   ),
    .user_clk               (clk_sys                ),
    .user_rst               (rst                    ),
    
    .m_axis_rc_tdata        (ker2mmu_bd_tdata       ),
    .m_axis_rc_tuser        (75'd0                  ),
    .m_axis_rc_tlast        (ker2mmu_bd_tlast       ),
    .m_axis_rc_tkeep        (ker2mmu_bd_tkeep       ),
    .m_axis_rc_tvalid       (ker2mmu_bd_tvalid      ),
    .m_axis_rc_tready       (mmu2ker_bd_tready      ),

    .rc_rx_ef               (axis_fifo_emp          ),
    .rc_rx_rd               (axis_fifo_rd           ),
    .rc_rx_rdata            (axis_fifo_rdata_conver ),
    
    .rc_wr_data_cnt         (                       ),
    .rc_rd_data_cnt         (                       ),
    .fifo_status            (fifo_status            ),
    .fifo_err               (fifo_err               ),
    .rc_rx_cnt              (                       ),
    .rc_rx_drop_cnt         (                       )
    );

raxi_rc512_fifo tx2rx_bd
    (
    .pcie_clk               (clk_sys                ),
    .pcie_rst               (rst                    ),
    .pcie_link_up           (1'd1                   ),
    .user_clk               (clk_sys                ),
    .user_rst               (rst                    ),
    
    .m_axis_rc_tdata        (bd2rx_s_axis_rq_tdata  ),
    .m_axis_rc_tuser        (75'd0                  ),
    .m_axis_rc_tlast        (bd2rx_s_axis_rq_tlast  ),
    .m_axis_rc_tkeep        (bd2rx_s_axis_rq_tkeep  ),
    .m_axis_rc_tvalid       (bd2rx_s_axis_rq_tvalid ),
    .m_axis_rc_tready       (bd2rx_s_axis_rq_tready ),

    .rc_rx_ef               (bd2rx_axis_fifo_emp         ),
    .rc_rx_rd               (bd2rx_axis_fifo_rd           ),
    .rc_rx_rdata            (bd2rx_axis_fifo_rdata_conver ),
    
    .rc_wr_data_cnt         (                       ),
    .rc_rd_data_cnt         (                       ),
    .fifo_status            (bd2rx_fifo_status      ),
    .fifo_err               (bd2rx_fifo_err         ),
    .rc_rx_cnt              (                       ),
    .rc_rx_drop_cnt         (                       )
    );

mque_ff
    # ( 
        .WADDR_WIDTH         (9                   ), 
        .RADDR_WIDTH         (9                   ), 
        .WDATA_WIDTH         (512                 ), 
        .RDATA_WIDTH         (512                 ), 
        .DEPTH_QUE           (128                 ), 
        .PORT_WIDTH          (2                   ), 
        .PORT_NUM            (4                   ), 
        .WLINE_WIDTH         (7                   ) 
      
      ) u_mque_ff
     (
      .reset                 (rst                ), 
      .clks                  (clk_sys            ), 
      .wr                    (ve_ff_wr               ), 
      .wport                 (ve_ff_wport            ), 
      .wdata                 (ve_ff_wdata[511:0]     ), 
      .af                    (ve_ff_aff              ), 
      .ff                    (                       ), 
      .rd                    (ve_ff_rd               ), 
      .rport                 (ve_ff_rport            ), 
      .rdata                 (ve_ff_rdata            ), 
      .ef                    (ve_ff_empty            ), 
      .underflow             (underflow              ), 
      .overflow              (overflow               ), 
      .waterlinex            (                       )
     );

generate
    for (k = 0; k<4; k=k+1 ) begin : GEN_EOC_TAG

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
     u_eoc_tag_fifo  (
             .clk_sys           (clk_sys                ),
             .reset             (rst                    ),
             .wen               (eoc_tag_wen[k]         ),
             .wdata             (eoc_tag_wdata[k]       ),
             .ren               (eoc_tag_ren[k]         ),
             .rdata             (eoc_tag_rdata[k]       ),
             .full              (                       ),
             .empty             (eoc_tag_empty[k]       ),
             .usedw             (                       ),
             .afull             (eoc_tag_full[k]        ), 
             .aempty            (                       ),
             .parity_err        (eoc_tag_parity_err[k]  ),
             .fifo_stat         (eoc_tag_ff_stat[8*(k+1)-1:8*k]  ) 
             );
         
    end
endgenerate

sfifo_cbb_enc # (
        .FIFO_PARITY       ( "FALSE"               ),
        .PARITY_DLY        ( "FALSE"               ),
        .FIFO_DO_REG       ( 0                     ), 
        .RAM_DO_REG        ( 0                     ),
        .FIFO_ATTR         ( "ahead"               ),
        .FIFO_WIDTH        ( 2                     ),
        .FIFO_DEEP         ( 9                     ),
        .AFULL_OVFL_THD    ( 450                   ),
        .AFULL_UNFL_THD    ( 450                   ),
        .AEMPTY_THD        ( 8                     ) 
        )
u_chn_seq_fifo (
        .clk_sys           (clk_sys                ),
        .reset             (rst                    ),
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
        .fifo_stat         (chn_seq_ff_stat        ) 
        );
    
endmodule
