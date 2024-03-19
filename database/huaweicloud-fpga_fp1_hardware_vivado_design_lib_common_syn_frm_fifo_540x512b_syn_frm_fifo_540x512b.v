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
`timescale    1ns / 1ns

module syn_frm_fifo_540x512b
    (
    //global
    reset,                  //i  1 
    clk,                    //i  1 

    //wr interface
    wr,                     //i  1 
    wend,                   //i  1 
    wdata,                  //i  x 
    aff,                    //o  1 
    ff,                     //o  1 

    //rd interface
    rd,                     //i  1 
    rend,                   //i  1 
    return_cnt,             //i  3 
    reop,                   //i  1 
    rdata,                  //o  x 
    ef,                     //o  1 
    aef,                    //o  1 
                            //     
                            //     

    //status and err interface
    waterline,              //o  x  
    underflow,              //o  1  
    overflow,               //o  1  
    err                     //o  1 
                            //      
    );

/******************************************************************************\
                               parameter
\******************************************************************************/
parameter       UDLY             = 1'b1;         //UDLY
parameter       REND_RETURN      = 10'd5;        //raddr return value
parameter       WR_ERR_DROP_EN   = 1'b1;         //wr err drop enable
parameter       FIFO_AF_LEVEL    = 9'd420;      //FIFO almost full level
                                                 //waddr - raddr
parameter       ADDR_WIDTH       = 9;           //address depth = 512 words
parameter       DATA_WIDTH       = 512;          //data width = 512 bits
parameter       MODE_WIDTH       = 6;            //mode width = 6 bits
parameter       DATA_REV_WIDTH   = 20;           //reserve width = 20 bits
parameter       WLINE_CLASS      = 3;            //water line precision = 3 bits

parameter       RST_CNT_WIDTH    = 7;            //FIFO reset counter width
                                                 //at least last a max frame len

localparam      RXFF_DWIDTH      = DATA_REV_WIDTH + MODE_WIDTH + DATA_WIDTH + 2;

/******************************************************************************\
                             port signal
\******************************************************************************/
//global
input                       reset;
input                       clk;

//wr interface
input                       wr;
input                       wend;
input    [RXFF_DWIDTH-1:0]  wdata;
output                      aff;
output                      ff;

//rd interface
input                       rd;
input                       rend;
input    [2:0]              return_cnt;
input                       reop;
output   [RXFF_DWIDTH-1:0]  rdata;
output                      ef;
output                      aef;

//status and err interface
output                      underflow;
output                      overflow;
output   [WLINE_CLASS-1:0]  waterline;
output                      err;

/******************************************************************************\
                            inter signal 
\******************************************************************************/
//global
wire                        reset;
wire                        clk;

//wr interface
wire                        wr;
wire                        wend;
wire    [RXFF_DWIDTH-1:0]   wdata;
reg                         aff;
reg                         ff;

//rd interface
wire                        rd;
wire                        rend;
wire    [2:0]               return_cnt;
wire                        reop;
wire    [RXFF_DWIDTH-1:0]   rdata;
reg                         ef;
reg                         aef;

//status and err interface
reg                         underflow;
reg                         overflow;
reg     [WLINE_CLASS-1:0]   waterline;
reg                         err;

wire    [RXFF_DWIDTH-1:0]   rdata_pre;
wire                        eop_pre;
wire                        err_pre;

//  addr
wire                        wdata_eop;
wire                        wdata_err;
wire                        wdata_drop_en;
reg     [ADDR_WIDTH-1:0]    wr_addr;
reg     [ADDR_WIDTH-1:0]    wraddr_lock;
reg     [ADDR_WIDTH-1:0]    rd_addr;

//  ef and underflow
wire                        wdata_rgt_eop;
wire                        wdata_all_eop;
wire                        frame_cnt_inc;

reg     [ADDR_WIDTH-1:0]    frame_cnt;
reg                         rd_flg;
wire                        ef_pre;
reg                         ef_pre_dly1;
reg                         ef_pre_dly2;
wire                        aef_pre;

//  ff and overflow
wire    [ADDR_WIDTH-1:0]    used_unit;

wire                        aff_temp;
wire                        aff_pre;
wire    [ADDR_WIDTH-1:0]    ff_threshold;
wire                        ff_temp;
wire                        ff_pre;
wire    [ADDR_WIDTH-1:0]    overflow_threshold;
wire                        overflow_temp;
wire                        overflow_pre;

wire    [ADDR_WIDTH-1:0]    used_unit_true;
wire    [WLINE_CLASS-1:0]   waterline_pre;

//  ptr err
reg                         wr_dly1;
reg                         wr_dly2;
reg                         wend_dly1;
reg                         wend_dly2;
reg                         wend_dly3;
reg                         wr_flg;
wire                        fifo_ptr_err_pre;
reg                         fifo_ptr_err;

//  eop err
reg     [ADDR_WIDTH:0]      rd_cnt;
wire                        fifo_eop_err;
wire                        err_reset;

//  fifo reset
reg     [RST_CNT_WIDTH-1:0] fifo_reset_cnt;
wire                        fifo_reset;

wire                        odd_pre;

/******************************************************************************\
                               Process
\******************************************************************************/
/////////////////////////////////////////////////////////////////////
//  Instance RAM
//  simple-dual-port BRAM
//  port a is used for write operation
//  port b is used for read operation
//sdpramb_540x512_540x512p1_ce u_sdpramb_540x512_540x512p1_ce
//(
//    .addra                  ( wr_addr                 ),
//    .addrb                  ( rd_addr                 ),
//    .clka                   ( clk                     ),
//    .clkb                   ( clk                     ),
//    .dina                   ( wdata                   ),
//    .doutb                  ( rdata_pre               ),
//    .ena                    ( wr                      ),
//    .enb                    ( 1'b1                    ),
//    .wea                    ( wr                      )
//);

sdpramb_sclk
    #(
    .WRITE_WIDTH            ( 540             ),
    .WRITE_DEPTHBIT         ( 9               ),
    .READ_WIDTH             ( 540             ),
    .READ_DEPTHBIT          ( 9               )
    ) u_sdpramb_ram
    (
    .clock                  ( clk                     ),
    .enable                 ( 1'b1                    ),
    .wren                   ( wr                      ),
    .wraddress              ( wr_addr                 ),
    .data                   ( wdata                   ),
    .rdaddress              ( rd_addr                 ),
    .q                      ( rdata_pre               )
    );

//  rdata
generate
if (DATA_REV_WIDTH == 0)
begin
assign  rdata   = {eop_pre,err_pre,
                   rdata_pre[(DATA_WIDTH+MODE_WIDTH-1):0]};
end

else

begin
assign  rdata   = {rdata_pre[(RXFF_DWIDTH-1):(RXFF_DWIDTH-16)], // rev
                   odd_pre,  // odd
                   rdata_pre[(RXFF_DWIDTH-18):(DATA_WIDTH+MODE_WIDTH+2)],
                   eop_pre,err_pre,
                   rdata_pre[(DATA_WIDTH+MODE_WIDTH-1):0]};

end

endgenerate

//  eop
assign  eop_pre = (fifo_reset == 1'b1) ? 1'b1 : rdata_pre[DATA_WIDTH+MODE_WIDTH+1];

//  err
assign  err_pre = (fifo_reset == 1'b1) ? 1'b1 : rdata_pre[DATA_WIDTH+MODE_WIDTH];

//  odd_pre
assign  odd_pre = (fifo_reset == 1'b1) ? ^{rdata_pre[RXFF_DWIDTH-17],
                                           rdata_pre[DATA_WIDTH+MODE_WIDTH+1],
                                           rdata_pre[DATA_WIDTH+MODE_WIDTH]}
                                         : rdata_pre[RXFF_DWIDTH-17];

//---------------------------------------------------------------------------
//  Address counters
//---------------------------------------------------------------------------
//  Monitor the wr data eop signal
assign  wdata_eop = wdata[DATA_WIDTH+MODE_WIDTH+1];

//  Monitor the wr data eop signal
assign  wdata_err = wdata[DATA_WIDTH+MODE_WIDTH];

//  Catch the drop enable signal when wr a err frame
assign  wdata_drop_en = WR_ERR_DROP_EN ? 1'b1 : 1'b0;

//  write address is incremented when write enable signal has been asserted
always @ (posedge clk or posedge reset)
begin
    if (reset == 1'b1)
        wr_addr <= #UDLY {ADDR_WIDTH{1'b0}};
    else if (fifo_reset == 1'b1)
        wr_addr <= #UDLY {ADDR_WIDTH{1'b0}};
    else if (wr & wdata_eop & wdata_err & wdata_drop_en)  //reloaded wr_addr
        wr_addr <= #UDLY wraddr_lock;
    else if (wr == 1'b1)
        wr_addr <= #UDLY wr_addr + {{(ADDR_WIDTH-1){1'b0}},1'b1};
end

//  store the start address
always @ (posedge clk or posedge reset)
begin
    if (reset == 1'b1)
        wraddr_lock <= #UDLY {ADDR_WIDTH{1'b0}};
    else if (fifo_reset == 1'b1)
        wraddr_lock <= #UDLY {ADDR_WIDTH{1'b0}};
    else if (wr & wdata_eop & (~wdata_err))
        wraddr_lock <= #UDLY wr_addr + {{(ADDR_WIDTH-1){1'b0}},1'b1};
end

//  read address is incremented "1" when read enable signal has been asserted
//  read address is decreased "return_cnt" when rend signal has been asserted
always @ (posedge clk or posedge reset)
begin
    if (reset == 1'b1)
        rd_addr <= #UDLY {ADDR_WIDTH{1'b0}};
    else if (fifo_reset == 1'b1)
        rd_addr <= #UDLY {ADDR_WIDTH{1'b0}};
    else if (rend == 1'b1)
        rd_addr <= #UDLY rd_addr - {{(ADDR_WIDTH-3){1'b0}},return_cnt};  //reture REND_RETURN
    else if (rd == 1'b1)
        rd_addr <= #UDLY rd_addr + {{(ADDR_WIDTH-1){1'b0}},1'b1};
end

//------------------------------------------------------------------------------
//  underflow and empty control
//------------------------------------------------------------------------------
//  Catch the right frame eop information
assign  wdata_rgt_eop = wr & wdata_eop & (~wdata_err);

//  Catch the all frame (include right and err frame) eop information
assign  wdata_all_eop = wr & wdata_eop;

//  when a frame has been stored need to convert to rd clock domain for frame
//  count store
assign  frame_cnt_inc = wdata_drop_en ? wdata_rgt_eop : wdata_all_eop;

//  Frame counter to monitor the number of frames stored within the FIFO.
//  Note:
//  * decrements and increments happened at the end of a frame cycle
//  * + 1 : A frame is written to the fifo and no frame is being read out
//  *       on the same cycle
//  * - 1 : A frame is being read out and no frame is being written into
//  *       the fifo on the same cycle
always @ (posedge clk or posedge reset)
begin
    if (reset == 1'b1)
        frame_cnt <= #UDLY {ADDR_WIDTH{1'b0}};
    else if (fifo_reset == 1'b1)
        frame_cnt <= #UDLY {ADDR_WIDTH{1'b0}};
    else if (frame_cnt_inc & (~reop))
        frame_cnt <= #UDLY frame_cnt + {{(ADDR_WIDTH-1){1'b0}},1'b1};
    else if ((~frame_cnt_inc) & reop)
        frame_cnt <= #UDLY frame_cnt - {{(ADDR_WIDTH-1){1'b0}},1'b1};
end

//  rd flg signal generate
//  in order to smooth the interval rd to continuous rd_flg
always @ (posedge clk or posedge reset)
begin
    if (reset == 1'b1)
        rd_flg <= #UDLY 1'b0;
    else if (fifo_reset | (reop & (~rd)))
        rd_flg <= #UDLY 1'b0;
    else if (rd == 1'b1)
        rd_flg <= #UDLY 1'b1;
end

assign  ef_pre = (frame_cnt == {ADDR_WIDTH{1'b0}})
              |  ((frame_cnt == {{(ADDR_WIDTH-1){1'b0}},1'b1}) & (rd_flg | rd));

always @ (posedge clk or posedge reset)
begin
    if (reset == 1'b1)
    begin
        ef_pre_dly1 <= #UDLY 1'b1;
        ef_pre_dly2 <= #UDLY 1'b1;
    end
    else
    begin
        ef_pre_dly1 <= #UDLY ef_pre;
        ef_pre_dly2 <= #UDLY ef_pre_dly1;
    end
end

always @ (posedge clk or posedge reset)
begin
    if (reset == 1'b1)
        ef <= #UDLY 1'b1;
    else
        ef <= #UDLY ef_pre | ef_pre_dly1 | ef_pre_dly2;
end

//  Detect when the FIFO is almost empty
assign  aef_pre = (frame_cnt <= {{(ADDR_WIDTH-3){1'b0}},3'b100});

always @ (posedge clk or posedge reset)
begin
    if (reset == 1'b1)
        aef <= #UDLY 1'b1;
    else
        aef <= #UDLY aef_pre;
end

//  underflow signal generate
always @ (posedge clk or posedge reset)
begin
    if (reset == 1'b1)
        underflow <= #UDLY 1'b0;
    else if (fifo_reset == 1'b1)
        underflow <= #UDLY 1'b0;
    else
        underflow <= #UDLY ((frame_cnt == {ADDR_WIDTH{1'b0}}) & rd);
end

//------------------------------------------------------------------------------
// overflow and full control
//------------------------------------------------------------------------------
//  Obtain the difference between write and read pointers
assign  used_unit      = wr_addr - rd_addr;

//  used_unit_true
//  in order to avoid rd returned value effect,so add that value
//  for aff,ff,overflow,waterline signal
assign  used_unit_true = used_unit + REND_RETURN;

//  Detect when the FIFO is almost full
assign  aff_temp       = (used_unit_true >= FIFO_AF_LEVEL) & (~ef);

assign  aff_pre        = (fifo_reset == 1'b1) ? 1'b1 : aff_temp;

always @ (posedge clk or posedge reset)
begin
    if (reset == 1'b1)
        aff <= #UDLY 1'b1;
    else
        aff <= #UDLY aff_pre;
end

//  Detect when the FIFO is full
assign  ff_threshold = {ADDR_WIDTH{1'b1}} - {{(ADDR_WIDTH-5){1'b0}},5'd20};

assign  ff_temp      = (used_unit_true >= ff_threshold) & (~ef);

assign  ff_pre       = (fifo_reset == 1'b1) ? 1'b1 : ff_temp;

always @ (posedge clk or posedge reset)
begin
    if (reset == 1'b1)
        ff <= #UDLY 1'b1;
    else
        ff <= #UDLY ff_pre;
end

assign  overflow_threshold = {ADDR_WIDTH{1'b1}} - {{(ADDR_WIDTH-5){1'b0}},5'd5};

assign  overflow_temp      = (used_unit_true > overflow_threshold) & (~ef);

assign  overflow_pre       = (fifo_reset == 1'b1) ? 1'b0 : overflow_temp;

always @ (posedge clk or posedge reset)
begin
    if (reset == 1'b1)
        overflow <= #UDLY 1'b0;
    else
        overflow <= #UDLY overflow_pre;
end

//  waterline signal generate
assign  waterline_pre  = (fifo_reset == 1'b1)
                       ? {WLINE_CLASS{1'b0}}
                       : used_unit_true[(ADDR_WIDTH-1):(ADDR_WIDTH-WLINE_CLASS)];

always @ (posedge clk or posedge reset)
begin
    if (reset == 1'b1)
        waterline <= #UDLY {WLINE_CLASS{1'b0}};
    else
        waterline <= #UDLY waterline_pre;
end

//------------------------------------------------------------------------------
//  ptr_err control
//------------------------------------------------------------------------------
//  wr_flg signal generate
//  in order to smooth the interval wr to continuous wr_flg
always @ (posedge clk or posedge reset)
begin
    if (reset == 1'b1)
    begin
        wr_dly1   <= #UDLY 1'b0;
        wr_dly2   <= #UDLY 1'b0;
        wend_dly1 <= #UDLY 1'b0;
        wend_dly2 <= #UDLY 1'b0;
        wend_dly3 <= #UDLY 1'b0;
    end
    else
    begin
        wr_dly1   <= #UDLY wr;
        wr_dly2   <= #UDLY wr_dly1;
        wend_dly1 <= #UDLY wend;
        wend_dly2 <= #UDLY wend_dly1;
        wend_dly3 <= #UDLY wend_dly2;
    end
end

always @ (posedge clk or posedge reset)
begin
    if (reset == 1'b1)
        wr_flg <= #UDLY 1'b0;
    else if (fifo_reset == 1'b1)
        wr_flg <= #UDLY 1'b0;
    else if (wr | wr_dly1 | wr_dly2)
        wr_flg <= #UDLY 1'b1;
    else if (wend_dly3 == 1'b1)
        wr_flg <= #UDLY 1'b0;
end

//  ptr err
//  byte cnt == 0 & frame cnt != 0
//  byte_cnt != 0 & frame_cnt == 0
assign  fifo_ptr_err_pre = ((~wr_flg) & (~rd_flg)
    	                   & (((frame_cnt == {ADDR_WIDTH{1'b0}})
    	                    & (used_unit != {ADDR_WIDTH{1'b0}}))
    	                   | ((frame_cnt != {ADDR_WIDTH{1'b0}})
    	                    & (used_unit == {ADDR_WIDTH{1'b0}}))));

always @ (posedge clk or posedge reset)
begin
    if (reset == 1'b1)
        fifo_ptr_err <= #UDLY 1'b0;
    else if (fifo_reset == 1'b1)
        fifo_ptr_err <= #UDLY 1'b0;
    else
        fifo_ptr_err <= #UDLY fifo_ptr_err_pre;
end

//------------------------------------------------------------------------------
//  no eop err control
//------------------------------------------------------------------------------
//  rd cnt in order to detect if the fifo have frame
always @ (posedge clk or posedge reset)
begin
    if (reset == 1'b1)
        rd_cnt <= #UDLY {(ADDR_WIDTH+1){1'b0}};
    else if (fifo_reset | reop)
        rd_cnt <= #UDLY {(ADDR_WIDTH+1){1'b0}};
    else if (rd == 1'b1)
        rd_cnt <= #UDLY rd_cnt + {{ADDR_WIDTH{1'b0}},1'b1};
end

assign  fifo_eop_err = rd_cnt[ADDR_WIDTH];

always @ (posedge clk or posedge reset)
begin
    if (reset == 1'b1)
        err <= #UDLY 1'b0;
    else
        err <= #UDLY fifo_ptr_err | fifo_eop_err;
end

//  err reset
assign  err_reset = underflow | overflow | err;

//------------------------------------------------------------------------------
//  fifo reset control
//------------------------------------------------------------------------------
//  fifo_reset_cnt
//  Last at least one max length frame time in order to insure no discontiguous
//  frame in the fifo
always @ (posedge clk or posedge reset)
begin
    if (reset == 1'b1)
        fifo_reset_cnt <= #UDLY {1'b1,{(RST_CNT_WIDTH-1){1'b0}}};
    else if (err_reset == 1'b1)
        fifo_reset_cnt <= #UDLY {RST_CNT_WIDTH{1'b0}};
    else if (fifo_reset_cnt[RST_CNT_WIDTH-1] == 1'b0)
        fifo_reset_cnt <= #UDLY fifo_reset_cnt + {{(RST_CNT_WIDTH-1){1'b0}},1'b1};
end

//  fifo_reset
assign  fifo_reset = (~fifo_reset_cnt[RST_CNT_WIDTH-1]);

endmodule
