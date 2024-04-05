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


`include "cbb_define.v"

module  sfifo_cbb_enc #(
    parameter   VENDER_ID       = `VENDER_ID        ,   //Altera or Xilinx or Lattice
                DEVICE_ID       = `DEVICE_ID        ,   //
                BRAM_TYPE       = `BRAM_TYPE        ,   //
                FIFO_PARITY     = `FIFO_PARITY      ,   //"TRUE" or "FALSE"
                PARITY_DLY      = `PARITY_DLY       ,   //"TRUE" or "FALSE"
                FIFO_DO_REG     = 0                 ,   //0-rdata output no reg,1-use reg and no delay.
                RAM_DO_REG      = 0                 ,   //0-rdata output no reg,1-use blockram inter_reg of 1 delay.
                FIFO_ATTR       = "normal"          ,   //"normal" or "ahead"
                FIFO_WIDTH      = 8                 ,   //
                FIFO_DEEP       = 10                ,   //2**M
                AFULL_OVFL_THD  = 2**FIFO_DEEP - 1  ,   //afull set threshold. afull=1,used>=SET_THD.
                AFULL_UNFL_THD  = AFULL_OVFL_THD    ,   //afull clear threshold. afull=0,used<CLR_THD.
                AEMPTY_THD      = 1                     //aempty =1, used=<THD;else 0.

    )(
        input                               clk_sys     ,   //i1:
        input                               reset       ,   //i1:
        input                               wen         ,   //i1:
        input           [FIFO_WIDTH - 1:0]  wdata       ,   //i[FIFO_WIDTH]:
        input                               ren         ,   //i1:
        output  wire    [FIFO_WIDTH - 1:0]  rdata       ,   //o[FIFO_WIDTH]:
        output  wire                        full        ,   //o1:
        output  wire                        empty       ,   //o1:
        output  wire    [FIFO_DEEP  - 1:0]  usedw       ,   //o[FIFO_DEEP]:
        output  reg                         afull       ,   //o1: almost full>=AFULL_OVFL_THD(reg)
        output  reg                         aempty      ,   //o1: almost empty < AEMPTY_THD(wire)
        output  wire                        parity_err  ,   //o1: even parity. 1-parity error,0-parity ok, 1 cycle pulse sync with rdata.
        output  wire    [7:0]               fifo_stat       //o8:[0]:~empty;[1]:~aempty;[2]:full;[3]:afull,[4]:underflow;[5]:overflow;[6]:parity_err;[7]:rsv

    );

//--------------------------
//  parameters
//--------------------------
localparam  FIFO_WIDTH_GEN    = (FIFO_PARITY == "TRUE") ? (FIFO_WIDTH + 1) : FIFO_WIDTH;

//--------------------------
//  signals
//--------------------------
wire[FIFO_DEEP:0]           fifo_used;
reg                         overflow;
reg                         underflow;

wire                        fifo_wen;
wire[FIFO_WIDTH_GEN - 1:0]  fifo_wdata;
wire                        fifo_ren;
wire[FIFO_WIDTH_GEN - 1:0]  fifo_rdata;
wire                        fifo_full;
wire                        fifo_empty;
wire[FIFO_DEEP  - 1:0]      fifo_usedw;
//fifo reg 1 delay
wire[FIFO_WIDTH_GEN - 1:0]  rdata_tmp;
wire                        parity_err_flag;
//-------------------------------------------------------------
//  process
//-------------------------------------------------------------

assign  full        = fifo_full;
assign  usedw       = fifo_usedw;
//---
assign  fifo_stat   = {1'b0,parity_err_flag,overflow,underflow,afull,full,~aempty,~empty};

//aempty & afull
assign  fifo_used   = {full,usedw};

always @(posedge clk_sys or posedge reset)
begin
    if(reset == 1'b1) begin
        aempty  <= 1'b1;
    end
    else if(fifo_used < AEMPTY_THD) begin
        aempty  <= 1'b1;
    end
    else begin
        aempty  <= 1'b0;
    end
end

always @(posedge clk_sys or posedge reset)
begin
    if(reset == 1'b1) begin
        afull   <=  1'b0;
    end
    else if(fifo_used >= AFULL_OVFL_THD) begin
        afull   <=  1'b1;
    end
    else if(fifo_used < AFULL_UNFL_THD) begin
        afull   <=  1'b0;
    end
    else ;
end

//usedw--
always @(posedge clk_sys or posedge reset)
begin
    if(reset == 1'b1) begin
        overflow    <=  1'b0;
        underflow   <=  1'b0;
    end
    else begin
        if((fifo_wen == 1'b1) && (full  == 1'b1)) overflow   <=  1'b1; else ; 
        if((ren == 1'b1) && (empty == 1'b1)) underflow  <=  1'b1; else ;
    end
end

//2. generate:the difference signal between ahead and normal mode.(fifo_reg)
generate
if(FIFO_DO_REG == 1) begin : reg_fifo

defparam    u_fifo_cbb_reg.FIFO_ATTR    = FIFO_ATTR         ,
            u_fifo_cbb_reg.FIFO_WIDTH   = FIFO_WIDTH_GEN    ;
fifo_cbb_reg u_fifo_cbb_reg(
        .clk_sys        (clk_sys        ),   //i1: clock
        .reset          (reset          ),   //i1: reset,active high
        .ren            (ren            ),   //i1: user input fifo read enable.1-enable
        .fifo_empty     (fifo_empty     ),   //i1: fifo_cbb output empty signal.1-empty,0-no empty
        .fifo_rdata     (fifo_rdata     ),   //i[FIFO_WIDTH]: fifo_cbb output read data
        .reg_fifo_rdata (rdata_tmp      ),   //o[FIFO_WIDTH]: reg_fifo_cbb output read data
        .reg_fifo_ren   (fifo_ren       ),   //o1: reg_fifo_cbb output to read fifo_cbb signal.1-enable
        .empty          (empty          )    //o1: reg_fifo_cbb empty signal
        );

end
else begin : no_reg_fifo

assign  rdata_tmp   = fifo_rdata;
assign  empty       = fifo_empty;
assign  fifo_ren    = ren;

end
endgenerate

//3. generate: FIFO even parity.
generate
if(FIFO_PARITY == "TRUE") begin : add_parity_wr

defparam    u_fifo_cbb_parity.FIFO_WIDTH   = FIFO_WIDTH,
            u_fifo_cbb_parity.FIFO_ATTR    = FIFO_ATTR,
            u_fifo_cbb_parity.PARITY_DLY   = PARITY_DLY;
fifo_cbb_parity u_fifo_cbb_parity(
        .clk_wr             (clk_sys        ),   //i1: write clock
        .wr_reset           (reset          ),   //i1: reset,active high
        .clk_rd             (clk_sys        ),   //i1: read clock
        .rd_reset           (reset          ),   //i1: reset,active high
        //write data
        .wen                (wen            ),   //i1: user input fifo write enable.1-enable
        .wdata              (wdata          ),   //i[FIFO_WIDTH]: user write fifo data.
        .fifo_wen           (fifo_wen       ),   //o1: fifo_cbb write enable after parity.1-enable
        .fifo_wdata         (fifo_wdata     ),   //o[FIFO_WIDTH+1]: fifo_cbb write enable after parity.
        //read data
        .fifo_ren           (fifo_ren       ),   //i1: fifo read enable
        .fifo_rdata         (rdata_tmp      ),   //i[FIFO_WIDTH+1]: fifo_cbb output read data
        .parity_err         (parity_err     ),   //o1: reg_fifo_cbb output to read fifo_cbb signal.1-enable
        .parity_err_flag    (parity_err_flag)    //o1: reg_fifo_cbb empty signal
        );

assign  rdata   = rdata_tmp[FIFO_WIDTH - 1:0];
        
end
else begin : no_parity_wr

assign  fifo_wen        = wen;
assign  fifo_wdata      = wdata;
assign  rdata           = rdata_tmp;
assign  parity_err      = 1'b0;
assign  parity_err_flag = 1'b0;

end
endgenerate

//--instance
defparam    u_fifo.VENDER_ID        = VENDER_ID     ,
            u_fifo.DEVICE_ID        = DEVICE_ID     ,
            u_fifo.BRAM_TYPE        = BRAM_TYPE     ,
            u_fifo.RAM_DO_REG       = RAM_DO_REG    ,
            u_fifo.FIFO_ATTR        = FIFO_ATTR     ,
            u_fifo.FIFO_WIDTH       = FIFO_WIDTH_GEN,
            u_fifo.FIFO_DEEP        = FIFO_DEEP     ;

sfifo_cbb  u_fifo(
            .clk_sys    (clk_sys    ),  //i1:
            .reset      (reset      ),  //i1:
            .wen        (fifo_wen   ),  //i1:
            .wdata      (fifo_wdata ),  //i[FIFO_WIDTH]:
            .ren        (fifo_ren   ),  //i1:
            .rdata      (fifo_rdata ),  //o[FIFO_WIDTH]:
            .full       (fifo_full  ),  //o1:
            .empty      (fifo_empty ),  //o1:
            .usedw      (fifo_usedw )   //o[FIFO_DEEP]:
            );

endmodule
