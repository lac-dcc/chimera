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

module  mmu_rx_pkt
                 (
                 //globe signals
                 input                                  clk_sys                    ,
                 input                                  rst                        ,
                
                 //eoc tag info with mmu_rx_pkt 
                 output  wire   [3:0]                   eoc_tag_ren                , 
                 input          [3:0]                   eoc_tag_rdata              ,
                 input          [3:0]                   eoc_tag_empty              ,
                 
                 output   reg                           chn_seq_ren                , 
                 input          [1:0]                   chn_seq_rdata              ,
                 input                                  chn_seq_empty              ,
                 
                 output                                 ve_ff_rd                   , 
                 output         [1:0]                   ve_ff_rport                ,
                 input          [511:0]                 ve_ff_rdata                ,
                 input          [3:0]                   ve_ff_empty                ,     
                
                 input                                  mmu_tx2rx_bd_wr            ,
                 input          [539:0]                 mmu_tx2rx_bd_wdata         ,
                 output                                 mmu_tx2rx_bd_afull         , 
                 //PKT signal with Kernel  
                 output         [3:0]                   pkt_back_full_que          ,       
                 input          [3:0]                   pkt_back_wen_que           ,
                 input          [540*4-1:0]             pkt_back_wdata_que         , 
                
                 //with bd proc
                 input          [3:0]                   bucket_inc_wr              ,
                 input          [13:0]                  bucket_inc_wdata           ,
                 output         [3:0]                   bucket_af                  ,               
                 
                 //ae to ve pkt
                 output                                 ul2sh_pkt_tlast            ,
                 output         [511:0]                 ul2sh_pkt_tdata            ,
                 output         [63:0]                  ul2sh_pkt_tkeep            ,
                 output                                 ul2sh_pkt_tvalid           ,
                 input                                  sh2ul_pkt_tready           ,                
    
                 //with cpu 
                 input          [31:0]                  reg_mmu_rx_cfg             ,
                 input          [15:0]                  reg_tmout_us_cfg           ,  
                 input          [7:0]                   reg_timer_1us_cfg          ,
                 output  reg    [3:0]                   reg_mmu_rxpkt_en           ,
                 output  reg                            reg_mmu_txpkt_en           ,
                 output  reg                            write_ddr_rd_bd_4dly       ,
                 output  reg                            add_hacc_en_5dly           ,
                 output         [31:0]                  reg_mmu_rxpkt_sta          ,
                 output         [31:0]                  reg_mmu_rxpkt_sta1         ,
                 output         [31:0]                  reg_mmu_rxpkt_err             
  
                 );

/*********************************************************************************************************************\
    signals
\*********************************************************************************************************************/
wire      [3:0]                   pkt_back_empty          ;              
reg       [4:0]                   pkt_back_rd             ;       
wire      [540*4-1:0]             pkt_back_rdata          ;
wire      [7:0]                   mmu_tx2rx_bd_fifo_stat  ;              

reg                               pkt_back_rd_1dly        ;
reg                               pkt_back_rd_2dly        ;
reg                               pkt_back_rd_3dly        ;
reg                               pkt_back_rd_4dly        ;

reg                               write_ddr_rd_bd_1dly    ;
reg                               write_ddr_rd_bd_2dly    ;
reg                               write_ddr_rd_bd_3dly    ;


//wire      [3:0]                   tb_rr4_nef              ;
wire      [7:0]                   tb_rr8_nef              ;
wire                              tb_rr8_req              ;
reg                               tb_rr8_req_1dly         ;
reg                               tb_rr8_req_2dly         ;
reg                               tb_rr8_req_3dly         ;
reg                               tb_rr8_ack              ;

reg                               tb_rr8_ack_1dly         ;
reg                               tb_rr8_ack_2dly         ;
(*max_fanout=100*)reg                               tb_rr8_ack_3dly         ;

wire      [2:0]                   tb_rr8_qnum             ;
wire      [4:0]                   eoc_tag_ren_tmp         ;

wire      [1:0]                   cur_que                 ;

wire      [4:0]                   que_eoc_bitmap          ;
reg       [4:0]                   que_eoc_bitmap_1dly     ;
reg       [4:0]                   que_eoc_bitmap_2dly     ;
wire      [3:0]                   rr4_nef_mask            ;
reg       [3:0]                   reg_ddr_tmout_err       ;
reg       [3:0]                   rr4_timeout_en          ;
wire      [4:0]                   rr4_ff_vld              ;
(*max_fanout=50*) reg       [4:0]                   que_soc_flag            ;

reg                               rxff_ren                ;     
reg                               rr8_req_nvld            ;     
wire                              que_eoc_flag_set        ;     
wire                              que_eoc_flag_clr        ;     
reg                               que_eoc_flag            ;     
wire                              rxff_reop               ;    
reg                               rxff_reop_1dly          ;    
reg                               rxff_reop_2dly          ;    
reg       [539:0]                 rxff_rdata              ; 
reg       [539:0]                 rxff_rdata_1dly         ; 
reg       [539:0]                 rxff_rdata_2dly         ; 
reg       [539:0]                 rxff_rdata_3dly         ; 

reg                               pkt_reop                ;    
reg                               pkt_reop_1dly           ;    
reg                               pkt_reop_2dly           ;    
reg                               pkt_reop_3dly           ;    
(*max_fanout=100*)reg                               pkt_reop_4dly           ;    
                 
reg                               ae2ve_pkt_wen           ; 
wire      [539:0]                 ae2ve_pkt_wdata         ; 
wire      [539:0]                 ae2ve_pkt_wdata_conver  ; 
reg       [511:0]                 ae2ve_pkt_wdata_512b    ; 
reg       [27:0]                  ae2ve_pkt_wdata_rev     ; 
wire                              ae2ve_pkt_ff            ; 

reg                               down_flag               ;

wire      [539:0]                 mmu_tx2rx_bd_rdata      ;
reg       [511:0]                 mmu_tx2rx_bd_rdata_1dly ;
reg       [511:0]                 mmu_tx2rx_bd_rdata_2dly ;
reg       [511:0]                 mmu_tx2rx_bd_rdata_lock ;
reg       [511:0]                 header_lock[3:0]        ;
reg       [511:0]                 header_sel              ;
reg       [511:0]                 header_sel_1dly         ;
wire      [511:0]                 header                  ;
wire      [6:0]                   gen_mode                ;
reg       [3:0]                   eoc_eop                 ;  
wire                              eoc_eop_sel             ;  
wire      [31:0]                  len_in_hardacc          ;
reg       [31:0]                  len_in_hardacc_1dly     ;

wire      [63:0]                  des_addr                ;
wire      [12:0]                  des_addr_l13b           ;
wire      [63:0]                  de_addr[3:0]            ;
reg       [63:0]                  de_addr_sel             ;
reg       [25:0]                  de_haddr_l26b[3:0]      ;
reg       [25:0]                  de_haddr_h26b[3:0]      ;
reg       [11:0]                  de_laddr[3:0]           ;

reg                               ve_ff_rd_1dly           ; 
(*max_fanout=50*) reg                               ve_ff_rd_2dly           ; 
reg       [2:0]                   tb_rr8_qnum_1dly        ;
(*max_fanout=50*) reg       [2:0]                   tb_rr8_qnum_2dly        ;
(*max_fanout=50*) reg       [2:0]                   tb_rr8_qnum_3dly        ;
(*max_fanout=50*) reg       [2:0]                   tb_rr8_qnum_4dly        ;

wire      [3:0]                   que_lock_en             ;    
wire      [3:0]                   que_inc_en              ;    
                 
wire      [9:0]                   bucket_wline_tmp[3:0]   ;  
reg       [9:0]                   bucket_wline[3:0]   ;  
reg       [4:0]                   bucket_dec_wend_tmp     ;
wire      [3:0]                   bucket_dec_wend         ;
reg       [3:0]                   bucket_dec_wr           ;
reg       [9:0]                   bucket_dec_wdata[3:0]   ;

wire      [1:0]                   fifo_status             ;                
wire                              fifo_err                ;   
    
wire                              reg_tmout_us_err        ;   
wire      [7:0]                   reg_bucket_err          ;   
wire      [3:0]                   empty_full_err          ;   

reg       [19:0]                  unit_cnt                ;
reg       [19:0]                  timeout_cnt[3:0]        ;
reg       [31:0]                  reg_mmu_rx_cfg_1dly     ;
wire                              chn_seq_ren_tmp         ; 
reg                               add_hacc_en             ;     
reg                               add_hacc_en_1dly        ;     
reg                               add_hacc_en_2dly        ;     
reg                               add_hacc_en_3dly        ;     
reg                               add_hacc_en_4dly        ;     
//reg                               add_hacc_en_5dly        ;     
wire                              add_hacc_0use           ;
wire                              add_hacc_1use           ;

wire                              mmu_tx2rx_bd_empty      ;

genvar i ;
genvar j ;
genvar k ;
genvar l ;
genvar m ;
genvar n ;
genvar q ;
/*********************************************************************************************************************\
    process
\*********************************************************************************************************************/
assign que_eoc_bitmap[3:0] = eoc_tag_rdata; 
assign que_eoc_bitmap[4] = 1'b0; 

//assign rr4_ff_vld     = ~pkt_back_empty;
assign rr4_ff_vld     = ~({mmu_tx2rx_bd_empty,pkt_back_empty});

assign cur_que        = chn_seq_rdata;

generate
    for (j = 0; j<4; j=j+1 ) begin : GEN_NEF_MASK
    
    assign rr4_nef_mask[j] = (cur_que != j) ? que_eoc_bitmap[j]:1'b0;
      
    end
endgenerate

assign tb_rr8_nef =  {3'd0,rr4_ff_vld[4],rr4_ff_vld[3:0]&(~rr4_nef_mask)};
 

assign tb_rr8_req =  (~rr8_req_nvld)&(|tb_rr8_nef)
                    &(~tb_rr8_req_1dly)&(~tb_rr8_req_2dly)&(~tb_rr8_req_3dly);

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        tb_rr8_req_1dly <= 1'b0;
        tb_rr8_req_2dly <= 1'b0;
        tb_rr8_req_3dly <= 1'b0;
    end
    else begin
        tb_rr8_req_1dly <= tb_rr8_req;
        tb_rr8_req_2dly <= tb_rr8_req_1dly;
        tb_rr8_req_3dly <= tb_rr8_req_2dly;
    end
end

assign que_eoc_flag_set =   que_eoc_bitmap[tb_rr8_qnum[1:0]] &tb_rr8_ack & (~tb_rr8_qnum[2]);
assign que_eoc_flag_clr = (~que_eoc_bitmap[tb_rr8_qnum[1:0]])&tb_rr8_ack & (~tb_rr8_qnum[2]);

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        que_eoc_flag <= 1'b0;
    end
    else if(que_eoc_flag_clr == 1'b1) begin
        que_eoc_flag <= 1'b0;
    end
    else if(que_eoc_flag_set == 1'b1) begin
        que_eoc_flag <= 1'b1;
    end
    else;
end   
 
always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        add_hacc_en      <= 1'b0;
        add_hacc_en_1dly <= 1'b0;
        add_hacc_en_2dly <= 1'b0;
        add_hacc_en_3dly <= 1'b0;
        add_hacc_en_4dly <= 1'b0;
        add_hacc_en_5dly <= 1'b0;
    end
    else begin
        add_hacc_en      <= add_hacc_0use | add_hacc_1use;
        add_hacc_en_1dly <= add_hacc_en;
        add_hacc_en_2dly <= add_hacc_en_1dly;
        add_hacc_en_3dly <= add_hacc_en_2dly;
        add_hacc_en_4dly <= add_hacc_en_3dly;
        add_hacc_en_5dly <= add_hacc_en_4dly;
    end
end

assign rxff_reop = (|pkt_back_rd[3:0]) & pkt_reop;
assign add_hacc_0use  = rxff_reop & tb_rr8_ack & que_eoc_bitmap[tb_rr8_qnum[1:0]] & (~tb_rr8_qnum[2]);  
assign add_hacc_1use  = rxff_reop & (~tb_rr8_ack)&que_eoc_flag;  
assign eoc_tag_ren = eoc_tag_ren_tmp[3:0];
assign bucket_dec_wend = bucket_dec_wend_tmp[3:0];
     
always@(posedge clk_sys)
begin
    mmu_tx2rx_bd_rdata_1dly <= mmu_tx2rx_bd_rdata[511:0];
    mmu_tx2rx_bd_rdata_2dly <= mmu_tx2rx_bd_rdata_1dly;
end
     
always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        mmu_tx2rx_bd_rdata_lock <= 512'd0;
    end
    else if(write_ddr_rd_bd_2dly==1'b1) begin
        mmu_tx2rx_bd_rdata_lock <= mmu_tx2rx_bd_rdata_2dly;
    end 
    else;   
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        rxff_reop_1dly <= 1'b0;
        rxff_reop_2dly <= 1'b0;
        que_eoc_bitmap_1dly <= 5'hf;
        que_eoc_bitmap_2dly <= 5'hf;
    end
    else begin    
        rxff_reop_1dly <= rxff_reop ;
        rxff_reop_2dly <= rxff_reop_1dly;
        que_eoc_bitmap_1dly <= que_eoc_bitmap;
        que_eoc_bitmap_2dly <= que_eoc_bitmap_1dly;
    end
end
  
always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        rr8_req_nvld <= 1'b0;
    end
    else if ((rxff_reop_2dly == 1'b1) || (pkt_back_rd[4] == 1'b1)) begin    
        rr8_req_nvld <= 1'b0;
    end
    else if(tb_rr8_req == 1'b1) begin
        rr8_req_nvld <= 1'b1;
    end
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        rxff_ren <= 1'b0;
    end
    else if ((rxff_reop == 1'b1) || (pkt_back_rd[4] == 1'b1))begin
        rxff_ren <= 1'b0;
    end
    else if(tb_rr8_req == 1'b1) begin
        rxff_ren <= 1'b1;
    end
    else;
end

generate
    for (n = 0; n<5; n=n+1 ) begin : GEN_FIFO_REN


    always@( * )
    begin
        if((n == 4) && (tb_rr8_qnum == n))begin
            pkt_back_rd[n] = ((~ae2ve_pkt_ff)&(~mmu_tx2rx_bd_empty)&rxff_ren);
        end
        else if((n < 4) && (tb_rr8_qnum == n))begin
            pkt_back_rd[n] = (~ae2ve_pkt_ff)&(~pkt_back_empty[n])&rxff_ren;
        end
        else begin
            pkt_back_rd[n] = 1'b0;
        end
    end
         
    always@(posedge clk_sys or posedge rst)
    begin
        if(rst == 1'd1)begin
            que_soc_flag[n] <= 1'b1;
        end
        else if((que_eoc_bitmap[n] == 1'b1)&&(tb_rr8_ack ==1'b1)&&(tb_rr8_qnum ==n)) begin
            que_soc_flag[n] <= 1'b1;
        end
        else if((tb_rr8_ack ==1'b1)&&(tb_rr8_qnum ==n)) begin
            que_soc_flag[n] <= 1'b0;
        end
        else;
    end        
      
    assign eoc_tag_ren_tmp[n] = (tb_rr8_qnum == n) ? tb_rr8_ack : 1'b0;
  
    always@(posedge clk_sys or posedge rst)
    begin
        if(rst == 1'd1)begin
            bucket_dec_wend_tmp[n] <= 1'b1;
        end
        else if (tb_rr8_qnum_4dly == n) begin
            bucket_dec_wend_tmp[n] <= pkt_reop_4dly&pkt_back_rd_4dly;
        end
        else begin
            bucket_dec_wend_tmp[n] <= 1'b0;
        end 
    end 
     
    end
endgenerate

always@(*) 
begin 
   case(tb_rr8_qnum)
      3'd0 :  pkt_reop = pkt_back_rdata[540*0+519];
      3'd1 :  pkt_reop = pkt_back_rdata[540*1+519];  
      3'd2 :  pkt_reop = pkt_back_rdata[540*2+519];   
      3'd3 :  pkt_reop = pkt_back_rdata[540*3+519];   
      default:pkt_reop = 1'b0;
   endcase
end   

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
       pkt_reop_1dly <= 1'b0;
       pkt_reop_2dly <= 1'b0;
       pkt_reop_3dly <= 1'b0;
       pkt_reop_4dly <= 1'b0;
    end
    else begin
       pkt_reop_1dly <= pkt_reop;
       pkt_reop_2dly <= pkt_reop_1dly;
       pkt_reop_3dly <= pkt_reop_2dly;
       pkt_reop_4dly <= pkt_reop_3dly;
    end
end

always@(posedge clk_sys)
begin 
   case(tb_rr8_qnum)
      3'd0 :  rxff_rdata <= pkt_back_rdata[540*1-1:540*0];
      3'd1 :  rxff_rdata <= pkt_back_rdata[540*2-1:540*1];  
      3'd2 :  rxff_rdata <= pkt_back_rdata[540*3-1:540*2];   
      3'd3 :  rxff_rdata <= pkt_back_rdata[540*4-1:540*3];   
      default:rxff_rdata <= 540'd0;
   endcase
end   

always@(posedge clk_sys)
begin 
     rxff_rdata_1dly <= rxff_rdata;  
     rxff_rdata_2dly <= rxff_rdata_1dly;  
     rxff_rdata_3dly <= rxff_rdata_2dly;  
end   


assign ve_ff_rd        = tb_rr8_ack&que_soc_flag[tb_rr8_qnum[1:0]] & (~tb_rr8_qnum[2]); 
assign ve_ff_rport     = tb_rr8_qnum[1:0]; 

assign chn_seq_ren_tmp = tb_rr8_ack&que_eoc_bitmap[tb_rr8_qnum[1:0]] & (~tb_rr8_qnum[2]); 

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
       chn_seq_ren <= 1'b0;
    end
    else begin
       chn_seq_ren <= chn_seq_ren_tmp;
    end
end

//==================================================================================
// ae to ve header
//==================================================================================
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
       ve_ff_rd_1dly <= 1'b0;
       ve_ff_rd_2dly <= 1'b0;
    end
    else begin
       ve_ff_rd_1dly <= ve_ff_rd;
       ve_ff_rd_2dly <= ve_ff_rd_1dly;
    end
end        

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
       tb_rr8_ack      <= 1'b0;
       tb_rr8_ack_1dly <= 1'b0;
       tb_rr8_ack_2dly <= 1'b0;
       tb_rr8_ack_3dly <= 1'b0;
    end
    else begin
       tb_rr8_ack      <= tb_rr8_req;
       tb_rr8_ack_1dly <= tb_rr8_ack & (~tb_rr8_qnum[2]);
       tb_rr8_ack_2dly <= tb_rr8_ack_1dly;
       tb_rr8_ack_3dly <= tb_rr8_ack_2dly;
    end
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
       tb_rr8_qnum_1dly <= 3'd0; 
       tb_rr8_qnum_2dly <= 3'd0;
       tb_rr8_qnum_3dly <= 3'd0;
       tb_rr8_qnum_4dly <= 3'd0;
    end
    else begin
       tb_rr8_qnum_1dly <= tb_rr8_qnum;
       tb_rr8_qnum_2dly <= tb_rr8_qnum_1dly;
       tb_rr8_qnum_3dly <= tb_rr8_qnum_2dly;
       tb_rr8_qnum_4dly <= tb_rr8_qnum_3dly;
    end
end

assign des_addr      = ve_ff_rdata[127:64];
    
assign des_addr_l13b = {1'd0,des_addr[11:0]} + 13'd32;

generate
    for (i = 0; i<4; i=i+1 ) begin : GEN_DES_ADDR
   
    assign que_lock_en[i] = ((ve_ff_rd_2dly ==1'b1)&&(tb_rr8_qnum_2dly[1:0] ==i)&&(tb_rr8_qnum_2dly[2] == 1'b0)); 
    assign que_inc_en[i]  = ((tb_rr8_ack_2dly ==1'b1)&&(tb_rr8_qnum_2dly[1:0] ==i)&&(tb_rr8_qnum_2dly[2] == 1'b0));

    always@(posedge clk_sys or posedge rst)
    begin
        if(rst == 1'd1)begin
            de_haddr_l26b[i] <= 26'd0;
        end
        else if((que_lock_en[i]==1'b1)&&(des_addr_l13b[12]==1'b1)) begin
            de_haddr_l26b[i] <= des_addr[37:12] + 26'd1;
        end   
        else if(que_lock_en[i]==1'b1) begin
            de_haddr_l26b[i] <= des_addr[37:12];
        end   
        else if(que_inc_en[i]==1'b1) begin
            de_haddr_l26b[i] <= de_haddr_l26b[i] + 26'd1;
        end
        else ; 
    end
    
    always@(posedge clk_sys or posedge rst)
    begin
        if(rst == 1'd1)begin
            de_haddr_h26b[i] <= 26'd0;
        end
        else if((que_lock_en[i]==1'b1)&&(des_addr[37:12] == 26'h3ffffff)&&(des_addr_l13b[12]==1'b1)) begin
            de_haddr_h26b[i] <= des_addr[63:38] + 26'd1;
        end   
        else if(que_lock_en[i]==1'b1) begin
            de_haddr_h26b[i] <= des_addr[63:38];
        end   
        else if((que_inc_en[i]==1'b1)&&(de_haddr_l26b[i] == 26'h3ffffff)) begin
            de_haddr_h26b[i] <= de_haddr_h26b[i] + 26'd1;
        end
        else ; 
    end
   
    always@(posedge clk_sys or posedge rst)
    begin
        if(rst == 1'd1)begin
            de_laddr[i] <= 12'd0;
        end
        else if(que_lock_en[i]==1'b1) begin
            de_laddr[i] <= des_addr_l13b[11:0];
        end 
        else;   
    end
        
    assign de_addr[i] = {de_haddr_h26b[i],de_haddr_l26b[i],de_laddr[i]};
   
    always@(posedge clk_sys or posedge rst)
    begin
        if(rst == 1'd1)begin
            header_lock[i] <= 512'd0;
        end
        else if(que_lock_en[i]==1'b1) begin
            header_lock[i] <= ve_ff_rdata[511:0];
        end 
        else;   
    end
    
    always@(posedge clk_sys or posedge rst)
    begin
        if(rst == 1'd1)begin
            eoc_eop[i] <= 1'b0;
        end
        else if(que_inc_en[i]==1'b1) begin
            eoc_eop[i] <= que_eoc_bitmap_2dly[i];
        end 
        else;   
    end
    
    end
endgenerate

always@(*)
begin
    case(tb_rr8_qnum_3dly)
       3'd0 :  header_sel = header_lock[0];
       3'd1 :  header_sel = header_lock[1];  
       3'd2 :  header_sel = header_lock[2];   
       3'd3 :  header_sel = header_lock[3];   
       default:header_sel = mmu_tx2rx_bd_rdata_lock;
    endcase
end   

always@(posedge clk_sys)
begin
    header_sel_1dly <= header_sel;
end


always@(*)
begin 
   case(tb_rr8_qnum_3dly)
      3'd0 :  de_addr_sel = de_addr[0];   
      3'd1 :  de_addr_sel = de_addr[1];  
      3'd2 :  de_addr_sel = de_addr[2];   
      3'd3 :  de_addr_sel = de_addr[3];   
      default:de_addr_sel = mmu_tx2rx_bd_rdata_lock[127:64];
   endcase
end   

always@(*)
begin 
   case(tb_rr8_qnum_3dly)
      3'd0 :  down_flag = eoc_eop[0];  
      3'd1 :  down_flag = eoc_eop[1];  
      3'd2 :  down_flag = eoc_eop[2];   
      3'd3 :  down_flag = eoc_eop[3];   
      default:down_flag = write_ddr_rd_bd_3dly;
   endcase
end   

assign eoc_eop_sel = down_flag & (~tb_rr8_qnum_3dly[2]);

//==================================================================================
// ae to ve write signal
//==================================================================================
always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        pkt_back_rd_1dly <= 1'b0;
        pkt_back_rd_2dly <= 1'b0;
        pkt_back_rd_3dly <= 1'b0;
        pkt_back_rd_4dly <= 1'b0;

        write_ddr_rd_bd_1dly <= 1'b0;
        write_ddr_rd_bd_2dly <= 1'b0;
        write_ddr_rd_bd_3dly <= 1'b0;
        write_ddr_rd_bd_4dly <= 1'b0;
    end
    else begin
        pkt_back_rd_1dly <= (|pkt_back_rd[3:0]);
        pkt_back_rd_2dly <= pkt_back_rd_1dly;
        pkt_back_rd_3dly <= pkt_back_rd_2dly;
        pkt_back_rd_4dly <= pkt_back_rd_3dly;

        write_ddr_rd_bd_1dly <= pkt_back_rd[4];
        write_ddr_rd_bd_2dly <= write_ddr_rd_bd_1dly;
        write_ddr_rd_bd_3dly <= write_ddr_rd_bd_2dly;
        write_ddr_rd_bd_4dly <= write_ddr_rd_bd_3dly;
    end
end

 
always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        ae2ve_pkt_wen <= 1'b0;
    end
    else begin
        ae2ve_pkt_wen <= pkt_back_rd_4dly | 
                         tb_rr8_ack_3dly | 
                         write_ddr_rd_bd_3dly | 
                         write_ddr_rd_bd_4dly | 
                         add_hacc_en_4dly | 
                         add_hacc_en_5dly;
    end
end

//|--------------|-----------------------------------------|
//|bit[511:356]  | rsv                                     |
//|--------------|-----------------------------------------|
//|bit[355:320]  | FPGA DDR DES ADDR                       |
//|--------------|-----------------------------------------|
//|bit[319:292]  | rsv                                     |
//|--------------|-----------------------------------------|
//|bit[291:256]  | FPGA DDR SRC ADDR                       |
//|--------------|-----------------------------------------|
//|bit[255:224]  | ae info                                 |
//|--------------|-----------------------------------------|
//|bit[223:217]  | rsv                                     |
//|--------------|-----------------------------------------|
//|bit[216:216]  | done_flag                               |
//|--------------|-----------------------------------------|
//|bit[215:208]  | acc type                                |
//|--------------|-----------------------------------------|
//|bit[207:160]  | ve info                                 |
//|--------------|-----------------------------------------|
//|bit[159:128]  | Length                                  |
//|--------------|-----------------------------------------|
//|bit[127:64]   | des_addr                                |
//|--------------|-----------------------------------------|
//|bit[63:0]     | src addr                                |
//|--------------|-----------------------------------------|

assign header = {header_sel[511:217],down_flag,8'd0,header_sel[175:128],32'd0,de_addr_sel,header_sel[63:0]};
assign gen_mode = 7'd64 - {1'b0,header_sel[333:328]};

assign len_in_hardacc = header_sel[359:328] + 32'd32;

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        len_in_hardacc_1dly <= 32'd0;
    end 
    else begin
        len_in_hardacc_1dly <= len_in_hardacc;
    end
end


//539-523:odd
//522-520:rsv
//519:eoc
//518:pkt_err
//517-512:mod
always@(posedge clk_sys )
begin
    if ((tb_rr8_ack_3dly == 1'b1)||(add_hacc_en_4dly == 1'b1) || (write_ddr_rd_bd_3dly == 1'b1)) begin
       ae2ve_pkt_wdata_rev <= 28'd0;
    end
    else if ((add_hacc_en_5dly == 1'b1) || (write_ddr_rd_bd_4dly == 1'b1)) begin
       ae2ve_pkt_wdata_rev <= {20'd0,2'd2,6'd32};
    end
    else if((pkt_reop_4dly == 1'b1)&&(eoc_eop_sel == 1'b1)&&(pkt_back_rd_4dly==1'b1)) begin
       ae2ve_pkt_wdata_rev <= {rxff_rdata_3dly[539:518],gen_mode[5:0]};
    end
    else begin
       ae2ve_pkt_wdata_rev <= rxff_rdata_3dly[539:512];
    end
end

 
always@(posedge clk_sys )
begin
    if (tb_rr8_ack_3dly == 1'b1) begin
       ae2ve_pkt_wdata_512b <= {header[511:217],1'b0,header[215:0]};
    end
    else if ((add_hacc_en_4dly == 1'b1) || (write_ddr_rd_bd_3dly == 1'b1)) begin
       ae2ve_pkt_wdata_512b <= {header_sel[511:217],down_flag,8'd0,header_sel[175:128],32'd0,header_sel[127:0]};
    end
    else if (write_ddr_rd_bd_4dly == 1'b1) begin
       ae2ve_pkt_wdata_512b <= {256'd0,header_sel_1dly[399:384],64'd0,len_in_hardacc_1dly,6'd0,header_sel_1dly[233:224],28'd0,header_sel_1dly[327:292],28'd0,header_sel_1dly[291:256]};
    end
    else if (add_hacc_en_5dly == 1'b1) begin
       ae2ve_pkt_wdata_512b <= {256'd0,header_sel[399:384],64'd0,len_in_hardacc,6'd0,header_sel[233:224],28'd0,header_sel[327:292],28'd0,header_sel[291:256]};
    end
    else begin
       ae2ve_pkt_wdata_512b <= rxff_rdata_3dly[511:0] ;
    end
end
      
assign ae2ve_pkt_wdata = {ae2ve_pkt_wdata_rev,ae2ve_pkt_wdata_512b};
    
generate
    for (q = 0; q<64; q=q+1 ) begin : DATA_LITTLE2BIG_GEN
        assign ae2ve_pkt_wdata_conver[(63-q)*8+7: (63-q)*8 ] = ae2ve_pkt_wdata[q*8+7:q*8];
    end
endgenerate
      

assign ae2ve_pkt_wdata_conver[539:512] = ae2ve_pkt_wdata[539:512];
      
generate
    for (k = 0; k<4; k=k+1 ) begin : GEN_BUCKET_REN
    
    always@(posedge clk_sys or posedge rst)
    begin
        if(rst == 1'd1)begin
            bucket_dec_wr[k] <= 1'b0;
        end
        else if((tb_rr8_qnum_4dly[1:0] == k[1:0]) && (tb_rr8_qnum_4dly[2] == 1'b0)) begin
            bucket_dec_wr[k] <= pkt_back_rd_4dly;  
        end
        else begin
            bucket_dec_wr[k] <= 1'b0;
        end    
    end
        
    always@(posedge clk_sys or posedge rst)
    begin
        if(rst == 1'd1)begin
           bucket_dec_wdata[k] <= 10'd1;
        end
        else if (bucket_dec_wr[k] == 1'b1 ) begin
           bucket_dec_wdata[k] <= bucket_dec_wdata[k] + 10'd1;
        end
        else;
    end
        
    always@(posedge clk_sys or posedge rst)
    begin
        if(rst == 1'd1)begin
            reg_mmu_rxpkt_en[k] <= 1'b0;
        end
        else begin
            reg_mmu_rxpkt_en[k] <= pkt_back_wen_que[k]&pkt_back_wdata_que[540*k+519];
        end
    end  
         
    end
endgenerate

    
always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        reg_mmu_txpkt_en <= 1'b0;
    end
    else begin
        reg_mmu_txpkt_en <= ae2ve_pkt_wen&ae2ve_pkt_wdata_conver[519];
    end
end

assign reg_mmu_rxpkt_sta = {ve_ff_empty,ae2ve_pkt_ff,tb_rr8_nef[4],eoc_tag_empty,chn_seq_empty,cur_que,que_eoc_bitmap[3:0],fifo_status,bucket_af,pkt_back_full_que,pkt_back_empty,tb_rr8_nef[3:0]}; 
assign reg_mmu_rxpkt_sta1 = {23'd0,que_eoc_flag,rr8_req_nvld,tb_rr8_req,mmu_tx2rx_bd_afull,mmu_tx2rx_bd_empty,mmu_tx2rx_bd_fifo_stat[3:0]}; 
assign reg_mmu_rxpkt_err = {11'd0,mmu_tx2rx_bd_fifo_stat[6:4],reg_ddr_tmout_err,fifo_err,reg_tmout_us_err,reg_bucket_err,empty_full_err};      
/*********************************************************************************************************************\
    timeout
\*********************************************************************************************************************/
always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        unit_cnt <= 20'd0;
    end
    else if(unit_cnt[19]== 1'b1) begin
        unit_cnt <= 20'd0;
    end
    else begin
        unit_cnt <= unit_cnt +20'd1;
    end
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        reg_mmu_rx_cfg_1dly <= 32'd0;
    end
    else begin
        reg_mmu_rx_cfg_1dly <= reg_mmu_rx_cfg;
    end
end  

generate
    for (l = 0; l<4; l=l+1 ) begin : GEN_TIMOUOUT_CNT
    always @ (posedge clk_sys or posedge rst)
    begin
        if (rst == 1'd1)begin
            rr4_timeout_en[l] <= 1'd0;
        end
        else if (  (cur_que == l)&&(eoc_tag_empty[l] == 1'b0)
                 &&(ae2ve_pkt_ff ==1'b0)&&(pkt_back_empty[l]==1'b1))begin
            rr4_timeout_en[l] <= 1'd1;
        end
        else begin
            rr4_timeout_en[l] <= 1'd0;
        end    
    end   
    always @ (posedge clk_sys or posedge rst)
    begin
        if (rst == 1'd1)begin
            timeout_cnt[l] <= 20'd0;
        end
        else if((eoc_tag_ren[l] ==1'b1)||(rr4_timeout_en[l]==1'b0)) begin    
            timeout_cnt[l] <= 20'd0;
        end
        else if((unit_cnt[19]== 1'b1)&&(rr4_timeout_en[l]==1'b1))begin
            timeout_cnt[l] <= timeout_cnt[l] + 20'd1;
        end
        else;
    end
    always @ (posedge clk_sys or posedge rst)
    begin
        if (rst == 1'd1)begin
            reg_ddr_tmout_err[l] <= 1'd0;
        end
        else if((timeout_cnt[l][reg_mmu_rx_cfg_1dly[4:0]] == 1'b1)&&(reg_mmu_rx_cfg_1dly[31]==1'b1))begin    
            reg_ddr_tmout_err[l] <= 1'd1;
        end
        else begin    
            reg_ddr_tmout_err[l] <= 1'd0;
        end
    end
    end
endgenerate
       
/*********************************************************************************************************************\
    instance
\*********************************************************************************************************************/

rr8 u_rr8_p1
    (
    //clock and reset signal
       .clks                  (clk_sys             ),   
       .reset                 (rst                 ),   
       .req                   (tb_rr8_nef          ),   
       .req_vld               (tb_rr8_req          ),   
       .rr_bit                (tb_rr8_qnum         )
    );

generate
    for (m = 0; m<4; m=m+1 ) begin : GEN_ASYN_FRM_FIFO

    always@(posedge clk_sys or posedge rst)
    begin
        if(rst == 1'd1)begin
            bucket_wline[m] <= 10'd512;
        end
        else begin
            bucket_wline[m] <= bucket_wline_tmp[m];
        end
    end  


    asyn_frm_fifo_288x512_sa
        #(
        .DATA_WIDTH         ( 540               ),
        .ADDR_WIDTH         ( 10                ),
        .EOP_POS            ( 519               ),
        .ERR_POS            ( 518               ),
        .FULL_LEVEL         ( 400               ),
        .ERR_DROP           ( 1'b1              )
        )
    u_mmu_pkt_txff
        (
        .rd_clk             ( clk_sys           ),
        .rd_rst             ( rst               ),
        .wr_clk             ( clk_sys           ),
        .wr_rst             ( rst               ),
        .wr                 ( pkt_back_wen_que[m]   ),
        .wdata              ( pkt_back_wdata_que[540*(m+1)-1:540*m]   ),
        .wafull             ( pkt_back_full_que[m]  ),
        .wr_data_cnt        ( bucket_wline_tmp[m]  ),
        .rd                 ( pkt_back_rd[m]    ),
        .rdata              ( pkt_back_rdata[540*(m+1)-1:540*m]   ),
        .rempty             ( pkt_back_empty[m] ),
        .rd_data_cnt        (                   ),
        .empty_full_err     ( empty_full_err[m] )
        );
   
mmu_bucket u_mmu_bucket

       (
        .clk_sys             (clk_sys                ),
        .reset               (rst                    ),
        .bucket_wline        (bucket_wline[m]        ),
        .bucket_inc_wr       (bucket_inc_wr[m]       ),
        .bucket_inc_wdata    (bucket_inc_wdata       ),
        .bucket_dec_wr       (bucket_dec_wr[m]       ),
        .bucket_dec_wdata    (bucket_dec_wdata[m]    ),
        .bucket_dec_wend     (bucket_dec_wend[m]     ),
        .bucket_af           (bucket_af[m]           ),                  
        .reg_bucket_inc_cnt  (                       ),
        .reg_timer_1us_cfg   (reg_timer_1us_cfg      ),
        .reg_bucket_err      (reg_bucket_err[(m+1)*2-1:m*2])        
       );
   
    
    end
endgenerate

raxi_rq512_fifo u_ae2ve_fifo
   (
    .pcie_clk               ( clk_sys               ),
    .pcie_rst               ( rst                   ),
    .pcie_link_up           ( 1'd1                  ),
    .user_clk               ( clk_sys               ),
    .user_rst               ( rst                   ),

    .s_axis_rq_tlast        (ul2sh_pkt_tlast        ),
    .s_axis_rq_tdata        (ul2sh_pkt_tdata        ),
    .s_axis_rq_tuser        (                       ),
    .s_axis_rq_tkeep        (ul2sh_pkt_tkeep        ),
    .s_axis_rq_tready       (sh2ul_pkt_tready       ),
    .s_axis_rq_tvalid       (ul2sh_pkt_tvalid       ),

    .reg_tmout_us_cfg       (reg_tmout_us_cfg       ),
    .reg_tmout_us_err       (reg_tmout_us_err       ),

    .rq_tx_wr               (ae2ve_pkt_wen          ),
    .rq_tx_wdata            (ae2ve_pkt_wdata_conver ),
    .rq_tx_ff               (ae2ve_pkt_ff           ),
    
    .rq_wr_data_cnt         (                       ),
    .rq_rd_data_cnt         (                       ),
    .fifo_status            (fifo_status            ),
    .fifo_err               (fifo_err               ),
    .rq_tx_cnt              (                       )
    );

sfifo_cbb_enc # (
        .FIFO_PARITY          ( "FALSE"             ),
        .PARITY_DLY           ( "FALSE"             ),
        .FIFO_DO_REG          ( 0                   ), 
        .RAM_DO_REG           ( 0                   ),
        .FIFO_ATTR            ( "ahead"             ),
        .FIFO_WIDTH           ( 540                 ),
        .FIFO_DEEP            ( 9                   ),
        .AFULL_OVFL_THD       ( 450                 ),
        .AFULL_UNFL_THD       ( 450                 ),
        .AEMPTY_THD           ( 8                   ) 
        )
U_mmu_tx2rx_bd_fifo  (
        .clk_sys              ( clk_sys             ),
        .reset                ( rst                 ),
        .wen                  ( mmu_tx2rx_bd_wr     ),
        .wdata                ( mmu_tx2rx_bd_wdata  ),
        .ren                  ( pkt_back_rd[4]     ),
        .rdata                ( mmu_tx2rx_bd_rdata  ),
        .full                 (                     ),
        .empty                ( mmu_tx2rx_bd_empty  ),
        .usedw                (                     ),
        .afull                ( mmu_tx2rx_bd_afull  ), 
        .aempty               (                     ),
        .parity_err           (                     ),
        .fifo_stat            ( mmu_tx2rx_bd_fifo_stat ) 
        );

endmodule
