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
`timescale 1ns / 100ps

module axi4_m512_mmu
  #(
    parameter         DATA_WIDTH      = 512 ,
    parameter         AXI_WID         = 4'h0,
    parameter         EOP_POS         = 519 ,
    parameter         ERR_POS         = 518 ,
    parameter         MOD_POS         = 512 ,
    parameter         MOD_WIDTH       = 6   ,
    parameter         WR_ERR_DROP_EN  = 1    
    )
   (
   //clk and reset
   input                                            reset_clkw                       ,             
   input                                            reset_clkr                       ,                                           
   input                                            clkw                             ,                                           
   input                                            clkr                             ,

   //fifo interface                                                                                  
   output                                           fifo2axi_rd                      ,
   input             [539:0]                        fifo2axi_rdata                   ,
   input                                            fifo2axi_ef                      ,
   input                                            fifo2axi_sop                     , 
    
   //axi4 addr
   output reg                                       axi4_m2s_awvalid                 ,
   input                                            axi4_s2m_awready                 ,
   
   //axi4 data                                        
   output            [3:0]                          axi4_m2s_wid                     ,
   output reg        [DATA_WIDTH-1:0]               axi4_m2s_wdata                   ,
   output reg        [63:0]                         axi4_m2s_wstrb                   ,
   output                                           axi4_m2s_wlast                   ,
   output reg                                       axi4_m2s_wvalid                  ,
   input                                            axi4_s2m_wready                  ,
                                                                                     
   input             [3:0]                          axi4_s2m_bid                     ,
   input             [1:0]                          axi4_s2m_bresp                   ,
   input                                            axi4_s2m_bvalid                  ,
   output                                           axi4_m2s_bready                  ,

   input             [3:0]                          cfg_bid_id                       ,                                                                                     
   output reg                                       axi4_s2m_rsp_ok_cnt_en           ,
   output reg                                       axi4_s2m_rsp_exok_cnt_en         ,
   output reg                                       axi4_s2m_rsp_slverr_cnt_en       ,
   output reg                                       axi4_s2m_rsp_decerr_cnt_en          
                           
   );
//******************************************************************************
//  parameters
//******************************************************************************

//******************************************************************************
//  signals
//******************************************************************************
wire                                                axi4_m2s_sop                     ;
reg                                                 axi4_m2s_awvld                   ;
wire                                                axi4_s2m_rsp_vld                 ;
//******************************************************************************
//  implement
//******************************************************************************
assign axi4_m2s_sop       = fifo2axi_sop ;
assign axi4_m2s_wid       = AXI_WID;

//for axi4 awvalid
always @ ( posedge clkr or posedge reset_clkr )
begin
    if ( reset_clkr == 1'b1 )begin
        axi4_m2s_awvalid <=  1'b0;
    end
    else if ( (axi4_s2m_awready == 1'b1) && (axi4_m2s_awvalid == 1'b1) )begin
        axi4_m2s_awvalid <=  1'b0;
    end
    else if ( (fifo2axi_ef == 1'b0) && ( axi4_m2s_sop == 1'b1 ) && (axi4_m2s_awvld == 1'b1))begin
        axi4_m2s_awvalid <=  1'b1;
    end

    else ;
end

always @ ( posedge clkr or posedge reset_clkr )
begin
    if ( reset_clkr == 1'b1 )begin
        axi4_m2s_awvld   <=  1'b1;
    end
    else if (axi4_m2s_wlast == 1'b1 ) begin
        axi4_m2s_awvld   <=  1'b1;
    end
    else if ((axi4_m2s_awvalid == 1'b1) & (axi4_s2m_awready == 1'b1))begin
        axi4_m2s_awvld   <=  1'b0;
    end
    else ;
end   

//for axi4 wvalid
always @ ( posedge clkr or posedge reset_clkr )
begin
    if ( reset_clkr == 1'b1 )begin
        axi4_m2s_wvalid  <=  1'b0;
    end
    else if ( axi4_m2s_wlast == 1'b1 ) begin
        axi4_m2s_wvalid  <=  1'b0;
    end
    else if ((fifo2axi_ef == 1'b0 ) & (axi4_m2s_awvalid == 1'b1) & (axi4_s2m_awready == 1'b1))begin
        axi4_m2s_wvalid  <=  1'b1;
    end
    else ;
end

//for fifo2axi_rd
assign fifo2axi_rd       = axi4_m2s_wvalid & axi4_s2m_wready;

//for axi4_m2s_wlast
assign axi4_m2s_wlast    = fifo2axi_rdata[EOP_POS] & fifo2axi_rd;

always @( * )
begin
    axi4_m2s_wdata[511:0] = fifo2axi_rdata[511:0];                
end

//for axi4_m2s_wstrb
generate
genvar j ;
    for (j=0;j<64;j=j+1) begin:DATA_WSTRB

            always @( * )
            begin
            if( j<fifo2axi_rdata[MOD_POS+MOD_WIDTH-1:MOD_POS])begin
                axi4_m2s_wstrb[63-j] = 1'b0;
            end
            else begin
                axi4_m2s_wstrb[63-j] = 1'b1;
            end            
            end
   end      
endgenerate

assign axi4_m2s_bready  = 1'b1;

assign axi4_s2m_rsp_vld = axi4_m2s_bready & axi4_s2m_bvalid ;

//==============================================================================
//DFX
//==============================================================================

always @ ( posedge clkr or posedge reset_clkr )
begin
    if ( reset_clkr == 1'b1 )begin
        axi4_s2m_rsp_ok_cnt_en <=  1'b0;
    end
    else if ( axi4_s2m_rsp_vld == 1'b1 )begin
        axi4_s2m_rsp_ok_cnt_en <=  (axi4_s2m_bresp == 2'd0) & (axi4_s2m_bid == cfg_bid_id);
    end
    else  begin
        axi4_s2m_rsp_ok_cnt_en <=  1'b0;
    end
end

always @ ( posedge clkr or posedge reset_clkr )
begin
    if ( reset_clkr == 1'b1 )begin
        axi4_s2m_rsp_exok_cnt_en <=  1'b0;
    end
    else if ( axi4_s2m_rsp_vld == 1'b1 )begin
        axi4_s2m_rsp_exok_cnt_en <=  (axi4_s2m_bresp == 2'd1) & (axi4_s2m_bid == cfg_bid_id);
    end
    else  begin
        axi4_s2m_rsp_exok_cnt_en <=  1'b0;
    end
end

always @ ( posedge clkr or posedge reset_clkr )
begin
    if ( reset_clkr == 1'b1 )begin
        axi4_s2m_rsp_slverr_cnt_en <=  1'b0;
    end
    else if ( axi4_s2m_rsp_vld == 1'b1 )begin
        axi4_s2m_rsp_slverr_cnt_en <=  (axi4_s2m_bresp == 2'd2) & (axi4_s2m_bid == cfg_bid_id);
    end
    else  begin
        axi4_s2m_rsp_slverr_cnt_en <=  1'b0;
    end
end

always @ ( posedge clkr or posedge reset_clkr )
begin
    if ( reset_clkr == 1'b1 )begin
        axi4_s2m_rsp_decerr_cnt_en <=  1'b0;
    end
    else if ( axi4_s2m_rsp_vld == 1'b1 )begin
        axi4_s2m_rsp_decerr_cnt_en <=  (axi4_s2m_bresp == 2'd3) & (axi4_s2m_bid == cfg_bid_id);
    end
    else  begin
        axi4_s2m_rsp_decerr_cnt_en <=  1'b0;
    end
end

endmodule
