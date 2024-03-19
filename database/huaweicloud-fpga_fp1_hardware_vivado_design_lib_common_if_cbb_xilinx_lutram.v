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


module  xilinx_lutram #(
    parameter   DEVICE_ID       = "7SERIES"     ,   //"7SERIES" or "SPARTAN6"
                BRAM_TYPE       = "18Kb"        ,   //"MLAB" or "reg"
                RAM_WIDTH       = 8             ,   //
                RAM_DEEP        = 5                 //
    )(
        input                               clk_wr      ,   //i1:
        input                               clk_rd      ,   //i1:
        input                               reset       ,   //i1:
        input                               wren        ,   //i1:
        input           [RAM_DEEP - 1:0]    wraddress   ,   //col_index[RAM_WIDTH]:
        input           [RAM_WIDTH - 1:0]   data        ,   //col_index[RAM_WIDTH]:
        input                               rden        ,   //i1:
        input           [RAM_DEEP - 1:0]    rdaddress   ,   //col_index[RAM_WIDTH]:
        output  wire    [RAM_WIDTH - 1:0]   q               //o[RAM_WIDTH]:
    );

//--------------------------
//  functions
//--------------------------

//1.--accord input data numwords,calc mlab used of row.
function integer ram_row_cnt;
input   [31:0]  data_numwords;
input   [31:0]  data_deep;

begin
    if(data_numwords % data_deep == 0) begin
        ram_row_cnt = data_numwords / data_deep;
    end
    else begin
        ram_row_cnt = data_numwords / data_deep + 1;
    end
end
endfunction

//2.--reserved write data.
function integer ram_rsv_bits;
input   [31:0]  data_act_width;
input   [31:0]  ram_max_width;

begin
    if(data_act_width % ram_max_width == 0) begin
        ram_rsv_bits = 0;
    end
    else begin
        ram_rsv_bits = ram_max_width - (data_act_width % ram_max_width);
    end
end
endfunction

//--------------------------
//  parameters
//--------------------------
localparam  FIFO_NUMWORDS       = 2**RAM_DEEP;
localparam  RAM_DEEP_BIT        = 5,                //RAM32
            RAM_DEEP_UNIT       = 2**RAM_DEEP_BIT;

localparam  BRAM_ROW_CNT        = ram_row_cnt(FIFO_NUMWORDS,RAM_DEEP_UNIT),
            BRAM_ROW_BIT        = RAM_DEEP - RAM_DEEP_BIT + 1;

//localparam  BRAM_COL_CNT        = RAM_WIDTH;
localparam  RAM_MAX_WIDTH       = 6;                             //RAM32M becomes a 32*6 bits simple dual port ram.
localparam  BRAM_COL_CNT        = ram_row_cnt(RAM_WIDTH,RAM_MAX_WIDTH);     //RAM32M,unit:6bits;RAM32X1D,unit:1bit                    
localparam  BRAM_RSV_BITS       = ram_rsv_bits(RAM_WIDTH,RAM_MAX_WIDTH);
//--------------------------
//  signals
//--------------------------
wire[BRAM_ROW_CNT - 1:0]            ram_wen;
wire[BRAM_ROW_CNT*(RAM_WIDTH+BRAM_RSV_BITS) - 1:0]  ram_rdata;

wire[RAM_WIDTH+BRAM_RSV_BITS - 1:0]  rdata;      //6*x
wire[RAM_WIDTH+BRAM_RSV_BITS - 1:0]  wdata;

//-------------------------------------------------------------
//  process
//-------------------------------------------------------------

//write or read enable select BRAM to op
genvar wr_index;
generate
if(BRAM_ROW_CNT < 2) begin : ROW_1_RAM
    assign  ram_wen = wren;
    assign  rdata   = ram_rdata;
    assign  q       = rdata[RAM_WIDTH - 1:0];
end
else begin

wire [BRAM_ROW_BIT - 1:0]    rdout_sel;

for(wr_index=0;wr_index<BRAM_ROW_CNT;wr_index=wr_index+1) begin : BRAM_WREN
    assign  ram_wen[wr_index] = (wraddress[RAM_DEEP-1:RAM_DEEP_BIT] == wr_index) & (wren == 1'b1);
    //assign  ram_ren[wr_index] = (rdaddress[RAM_DEEP-1:BRAM_MAX_ADDR] == wr_index) & (rden == 1'b1);
end

//data out
assign  rdout_sel   = rdaddress[RAM_DEEP-1:RAM_DEEP_BIT];
assign  rdata       = ram_rdata[(RAM_WIDTH+BRAM_RSV_BITS)*rdout_sel +:(RAM_WIDTH+BRAM_RSV_BITS)];
assign  q           = rdata[RAM_WIDTH - 1:0];

end
endgenerate

//write and read data reserved
assign  wdata   = {{BRAM_RSV_BITS{1'b0}},data};

//instance BRAM
genvar col_index,row_index;
generate
for(row_index=0;row_index < BRAM_ROW_CNT;row_index=row_index+1) begin : LUTRAM_ROW_UNIT
    for(col_index=0;col_index < BRAM_COL_CNT;col_index=col_index+1) begin : LUTRAM_COL_UNIT
        RAM32M  u_xilinx_lutram(
                .WCLK       (clk_wr                                     ),  //i1: write clock
                .WE         (ram_wen[row_index]                         ),  //i1: write enable
                .DIA        (wdata[RAM_MAX_WIDTH*col_index +:2]         ),  //i2: write data,2bits LSB
                .DIB        (wdata[(RAM_MAX_WIDTH*col_index + 2) +:2]   ),  //i2: write data,2bits
                .DIC        (wdata[(RAM_MAX_WIDTH*col_index + 4) +:2]   ),  //i2: write data,2bits
                .DID        (2'h0                                       ),  //i2: CH D need to tied ground. 
                .ADDRD      (wraddress[4:0]                             ),  //i5: write address,all channel shared waddr.
                //read
                .ADDRA      (rdaddress[4:0]                             ),  //i5: read address,ch a raddr
                .ADDRB      (rdaddress[4:0]                             ),  //i5: read address,ch b raddr
                .ADDRC      (rdaddress[4:0]                             ),  //i5: read address,ch c raddr
                .DOA        (ram_rdata[(RAM_MAX_WIDTH*col_index + (RAM_WIDTH+BRAM_RSV_BITS)*row_index) +:2]     ),  //o2:
                .DOB        (ram_rdata[(RAM_MAX_WIDTH*col_index + (RAM_WIDTH+BRAM_RSV_BITS)*row_index + 2) +:2] ),  //o2:
                .DOC        (ram_rdata[(RAM_MAX_WIDTH*col_index + (RAM_WIDTH+BRAM_RSV_BITS)*row_index + 4) +:2] ),  //o2:
                .DOD        ()
                );
    end
end
endgenerate

endmodule
