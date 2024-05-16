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


module  xilinx_bram #(
    parameter   DEVICE_ID       = "7SERIES"     ,   //"7SERIES" or "SPARTAN6"
                BRAM_TYPE       = "18Kb"        ,   //"9Kb" or "18Kb" or "36Kb"
                RAM_CLK         = "SYNC"        ,   //"SYNC" or "ASYNC"
                RAM_DO_REG      = 0             ,   //0-rdata output no reg,1-reg1
                RAM_WIDTH       = 8             ,   //
                //FIFO_NUMWORDS = 1024          ,   //words number,address width
                RAM_DEEP        = 10                //
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

/**********************************************************************************************************************/
///////////////////////////////////////////////////////////////////////
//  READ_WIDTH | BRAM_SIZE | READ Depth  | RDADDR Width |            //
// WRITE_WIDTH |           | WRITE Depth | WRADDR Width |  WE Width  //
// ============|===========|=============|==============|============//
//    37-72    |  "36Kb"   |      512    |     9-bit    |    8-bit   //
//    19-36    |  "36Kb"   |     1024    |    10-bit    |    4-bit   //
//    10-18    |  "36Kb"   |     2048    |    11-bit    |    2-bit   //
//     5-9     |  "36Kb"   |     4096    |    12-bit    |    1-bit   //
//     3-4     |  "36Kb"   |     8192    |    13-bit    |    1-bit   //
//       2     |  "36Kb"   |    16384    |    14-bit    |    1-bit   //
//       1     |  "36Kb"   |    32768    |    15-bit    |    1-bit   //
//    19-36    |  "18Kb"   |      512    |     9-bit    |    4-bit   //
//    10-18    |  "18Kb"   |     1024    |    10-bit    |    2-bit   //
//     5-9     |  "18Kb"   |     2048    |    11-bit    |    1-bit   //
//     3-4     |  "18Kb"   |     4096    |    12-bit    |    1-bit   //
//       2     |  "18Kb"   |     8192    |    13-bit    |    1-bit   //
//       1     |  "18Kb"   |    16384    |    14-bit    |    1-bit   //
//    10-18    |   "9Kb"   |      512    |     9-bit    |    2-bit   //
//     5-9     |   "9Kb"   |     1024    |    10-bit    |    1-bit   //
//     3-4     |   "9Kb"   |     2048    |    11-bit    |    1-bit   //
//       2     |  " 9Kb"   |     4096    |    12-bit    |    1-bit   //
//       1     |   "9Kb"   |     8192    |    13-bit    |    1-bit   //
///////////////////////////////////////////////////////////////////////
/**********************************************************************************************************************/

//--------------------------
//  functions
//--------------------------
function integer dec2bit_width;
input   [31:0]  dec_data_in;

begin
    for(dec2bit_width=0;dec_data_in >= 2;dec2bit_width=dec2bit_width+1) begin
        dec_data_in = dec_data_in >> 1;
    end
end
endfunction

//1.--RAM deep unit
function integer ram_deepbit_unit;
input   [31:0] data_width;

begin
    if(BRAM_TYPE == "36Kb") begin
        if(data_width > 32'd36) begin       //9bits
            ram_deepbit_unit    = 9;
        end
        else if(data_width > 32'd18) begin       //10bits
            ram_deepbit_unit    = 10;
        end
        else if(data_width > 32'd9) begin   //11bits
            ram_deepbit_unit    = 11;
        end
        else if(data_width > 32'd4) begin   //12bits
            ram_deepbit_unit    = 12;
        end
        else if(data_width > 32'd2) begin   //13bits
            ram_deepbit_unit    = 13;
        end
        else if(data_width == 32'd2) begin  //14bits
            ram_deepbit_unit    = 14;
        end
        else begin                          //15bits
            ram_deepbit_unit    = 15;
        end
    end
    else if(BRAM_TYPE == "18Kb") begin
        if(data_width > 32'd18) begin       //512
            ram_deepbit_unit    = 9;
        end
        else if(data_width > 32'd9) begin   //1024
            ram_deepbit_unit    = 10;
        end
        else if(data_width > 32'd4) begin   //2048
            ram_deepbit_unit    = 11;
        end
        else if(data_width > 32'd2) begin   //4096
            ram_deepbit_unit    = 12;
        end
        else if(data_width == 32'd2) begin  //8192
            ram_deepbit_unit    = 13;
        end
        else begin                          //16384
            ram_deepbit_unit    = 14;
        end
    end
    else begin
        if(data_width > 32'd9) begin        //512
            ram_deepbit_unit    = 9;
        end
        else if(data_width > 32'd4) begin   //1024
            ram_deepbit_unit    = 10;
        end
        else if(data_width > 32'd2) begin   //2048
            ram_deepbit_unit    = 11;
        end
        else if(data_width == 32'd2) begin  //4096
            ram_deepbit_unit    = 12;
        end
        else begin                          //8192
            ram_deepbit_unit    = 13;
        end
    end
end
endfunction

//
function integer ram_row_max_addr;
input   [31:0]  fifo_deep_in;
input   [31:0]  ram_deepbit;

begin
    if(ram_deepbit >= fifo_deep_in) begin
        ram_row_max_addr    = fifo_deep_in;
    end
    else begin
        ram_row_max_addr    = ram_deepbit;
    end
end
endfunction

function integer ram_deep_unit;
input   [31:0] data_width;

begin
    if(BRAM_TYPE == "36Kb") begin
        if(data_width > 32'd36) begin       //9bits
            ram_deep_unit   = 512;
        end
        else if(data_width > 32'd18) begin       //10bits
            ram_deep_unit   = 1024;
        end
        else if(data_width > 32'd9) begin   //11bits
            ram_deep_unit   = 2048;
        end
        else if(data_width > 32'd4) begin   //12bits
            ram_deep_unit   = 4096;
        end
        else if(data_width > 32'd2) begin   //13bits
            ram_deep_unit   = 8192;
        end
        else if(data_width == 32'd2) begin  //14bits
            ram_deep_unit   = 16384;
        end
        else begin                          //15bits
            ram_deep_unit   = 32768;
        end
    end
    else if(BRAM_TYPE == "18Kb") begin
        if(data_width > 32'd18) begin       //512
            ram_deep_unit   = 512;
        end
        else if(data_width > 32'd9) begin   //1024
            ram_deep_unit   = 1024;
        end
        else if(data_width > 32'd4) begin   //2048
            ram_deep_unit   = 2048;
        end
        else if(data_width > 32'd2) begin   //4096
            ram_deep_unit   = 4096;
        end
        else if(data_width == 32'd2) begin  //8192
            ram_deep_unit   = 8192;
        end
        else begin                          //16384
            ram_deep_unit   = 16384;
        end
    end
    else begin
        if(data_width > 32'd9) begin        //512
            ram_deep_unit   = 512;
        end
        else if(data_width > 32'd4) begin   //1024
            ram_deep_unit   = 1024;
        end
        else if(data_width > 32'd2) begin   //2048
            ram_deep_unit   = 2048;
        end
        else if(data_width == 32'd2) begin  //4096
            ram_deep_unit   = 4096;
        end
        else begin                          //8192
            ram_deep_unit   = 8192;
        end
    end
end
endfunction

//accord input data numwords,calc bram used of row.
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

//2.--RAM width process
//accord input data width,calc bram used of column.
function integer ram_col_cnt;
input   [31:0] data_width;

begin
    if(BRAM_TYPE == "36Kb") begin
        if(data_width % 72 == 0) begin
            ram_col_cnt = data_width / 72;
        end
        else begin
            ram_col_cnt = data_width / 72 + 1;
        end
    end
    else if(BRAM_TYPE == "18Kb") begin
        if(data_width % 36 == 0) begin
            ram_col_cnt = data_width / 36;
        end
        else begin
            ram_col_cnt = data_width / 36 + 1;
        end
    end
    else begin
        if(data_width % 18 == 0) begin
            ram_col_cnt = data_width / 18;
        end
        else begin
            ram_col_cnt = data_width / 18 + 1;
        end
    end
end
endfunction

//instance bram's max data width
function integer ram_col_max_width;
input   [31:0] data_width;
begin
    if(BRAM_TYPE == "36Kb") begin
        if(data_width < 72) begin
            ram_col_max_width = data_width;
        end
        else begin
            ram_col_max_width = 72;
        end
    end
    else if(BRAM_TYPE == "18Kb") begin
        if(data_width < 36) begin
            ram_col_max_width = data_width;
        end
        else begin
            ram_col_max_width = 36;
        end
    end
    else begin
        if(data_width < 18) begin
            ram_col_max_width = data_width;
        end
        else begin
            ram_col_max_width = 18;
        end
    end
end
endfunction

//the last instance bram's data width
function integer ram_col_end_width;
input   [31:0] data_width;
input   [31:0] max_width;
input   [31:0] bram_cnt;
begin
    ram_col_end_width = data_width - max_width * (bram_cnt - 1);
end
endfunction

//the input data byte enable calc
function integer ram_width_we;
input   [31:0] ram_data_width;
begin
    if(ram_data_width > 32'd36) begin
        ram_width_we = 8;
    end
    else if(ram_data_width > 32'd18) begin
        ram_width_we = 4;
    end
    else if(ram_data_width > 32'd9) begin
        ram_width_we = 2;
    end
    else begin
        ram_width_we = 1;
    end
end
endfunction

//Vertical
function integer v2_bram_deepbit_unit;
input   [31:0] ram_deep;
begin
    if(BRAM_TYPE == "36Kb") begin
        if(ram_deep > 32'd11) begin //max deep: 9bits*4096
            v2_bram_deepbit_unit = 12;
        end
        else if(ram_deep == 32'd11) begin
            v2_bram_deepbit_unit = 11;
        end
        else if(ram_deep == 32'd10) begin
            v2_bram_deepbit_unit = 10;
        end
        else begin
            v2_bram_deepbit_unit = 9;
        end
    end
    else if(BRAM_TYPE == "18Kb") begin //max deep: 9bits*2048
        if(ram_deep > 32'd10) begin
            v2_bram_deepbit_unit = 11;
        end
        else if(ram_deep == 32'd10) begin
            v2_bram_deepbit_unit = 10;
        end
        else begin
            v2_bram_deepbit_unit = 9;
        end
    end
    else begin
        if(ram_deep > 32'd9) begin
            v2_bram_deepbit_unit = 10;
        end
        else begin
            v2_bram_deepbit_unit = 9;
        end
    end
end
endfunction

function integer V2_bram_row_cnt;   //cal row count.
input   [31:0] ram_deep;
input   [31:0] ram_max_deep;
begin
    if(ram_deep > ram_max_deep) begin
        V2_bram_row_cnt = 2**(ram_deep - ram_max_deep);
    end
    else begin
        V2_bram_row_cnt = 1;
    end
end
endfunction

function integer v2_bram_max_width;
input   [31:0] ram_max_deep;
begin
    if(BRAM_TYPE == "36Kb") begin
        if(ram_max_deep == 32'd12) begin //9bits *4096
            v2_bram_max_width = 9;
        end
        else if(ram_max_deep == 32'd11) begin
            v2_bram_max_width = 18;
        end
        else if(ram_max_deep == 32'd10) begin
            v2_bram_max_width = 36;
        end
        else begin
            v2_bram_max_width = 72;
        end
    end
    else if(BRAM_TYPE == "18Kb") begin
        if(ram_max_deep == 32'd11) begin   //9bits * 2048
            v2_bram_max_width = 9;
        end
        else if(ram_max_deep == 32'd10) begin
            v2_bram_max_width = 18;
        end
        else begin
            v2_bram_max_width = 36;
        end
    end
    else begin
        if(ram_max_deep == 32'd10) begin    //9bits * 1024
            v2_bram_max_width = 9;
        end
        else begin
            v2_bram_max_width = 18;
        end
    end
end
endfunction

function integer V2_bram_col_cnt;   //cal col count.
input   [31:0] data_width;
input   [31:0] data_max_width;
begin
    if(data_width % data_max_width == 0) begin
        V2_bram_col_cnt = data_width / data_max_width;
    end
    else begin
        V2_bram_col_cnt = data_width / data_max_width + 1;
    end
end
endfunction

function integer bram_addr_rsvbit;   //
input   [31:0] data_deep;
input   [31:0] bram_max_deepbit;
begin
    if(data_deep < bram_max_deepbit) begin
        bram_addr_rsvbit = bram_max_deepbit - data_deep;
    end
    else begin
        bram_addr_rsvbit = 0;
    end
end
endfunction

function integer bram_gen_mode;   //
input   [31:0] h1_row_cnt;
input   [31:0] h1_col_cnt;
input   [31:0] v1_row_cnt;
input   [31:0] v1_col_cnt;
begin
    if(h1_row_cnt*h1_col_cnt > v1_row_cnt*v1_col_cnt) begin
        bram_gen_mode = 1;
    end
    else begin
        bram_gen_mode = 0;
    end
end
endfunction
//--------------------------
//  parameters
//--------------------------
localparam  WRITE_MODE          = (RAM_CLK == "SYNC") ? "READ_FIRST" : "WRITE_FIRST";
localparam  FIFO_NUMWORDS       = 2**RAM_DEEP;
//1.Horizontal algorithm,default
localparam  BRAM_DEEP_UNIT              = ram_deep_unit(RAM_WIDTH),
            BRAM_DEEPBIT_UNIT           = ram_deepbit_unit(RAM_WIDTH);
localparam  ALGO_H1_BRAM_MAX_ADDR       = ram_row_max_addr(RAM_DEEP,BRAM_DEEPBIT_UNIT);
localparam  ALGO_H1_BRAM_ADDR_RSVBIT    = bram_addr_rsvbit(RAM_DEEP,BRAM_DEEPBIT_UNIT);
localparam  ALGO_H1_BRAM_COL_CNT        = ram_col_cnt(RAM_WIDTH);
localparam  ALGO_H1_BRAM_ROW_CNT        = ram_row_cnt(FIFO_NUMWORDS,BRAM_DEEP_UNIT);
localparam  ALGO_H1_RAM_MAX_WIDTH       = ram_col_max_width(RAM_WIDTH);
localparam  ALGO_H1_RAM_END_WIDTH       = ram_col_end_width(RAM_WIDTH,ALGO_H1_RAM_MAX_WIDTH,ALGO_H1_BRAM_COL_CNT);
//2.Vertical algorithm
localparam  ALGO_V2_BRAM_DEEPBIT_UNIT   = v2_bram_deepbit_unit(RAM_DEEP);
localparam  ALGO_V2_BRAM_MAX_ADDR       = ram_row_max_addr(RAM_DEEP,ALGO_V2_BRAM_DEEPBIT_UNIT);
localparam  ALGO_V2_BRAM_ADDR_RSVBIT    = bram_addr_rsvbit(RAM_DEEP,ALGO_V2_BRAM_DEEPBIT_UNIT);
localparam  ALGO_V2_RAM_MAX_WIDTH       = v2_bram_max_width(ALGO_V2_BRAM_DEEPBIT_UNIT);
localparam  ALGO_V2_BRAM_COL_CNT        = V2_bram_col_cnt(RAM_WIDTH,ALGO_V2_RAM_MAX_WIDTH);
localparam  ALGO_V2_BRAM_ROW_CNT        = V2_bram_row_cnt(RAM_DEEP,ALGO_V2_BRAM_DEEPBIT_UNIT);
localparam  ALGO_V2_RAM_END_WIDTH       = ram_col_end_width(RAM_WIDTH,ALGO_V2_RAM_MAX_WIDTH,ALGO_V2_BRAM_COL_CNT);
//3.bram gen mode select
localparam  BRAM_GEN_MODE_SEL   = bram_gen_mode(ALGO_H1_BRAM_ROW_CNT,ALGO_H1_BRAM_COL_CNT,ALGO_V2_BRAM_ROW_CNT,ALGO_V2_BRAM_COL_CNT);

localparam  BRAM_ROW_CNT    = (BRAM_GEN_MODE_SEL == 0) ? ALGO_H1_BRAM_ROW_CNT       : ALGO_V2_BRAM_ROW_CNT;
localparam  BRAM_COL_CNT    = (BRAM_GEN_MODE_SEL == 0) ? ALGO_H1_BRAM_COL_CNT       : ALGO_V2_BRAM_COL_CNT;
localparam  BRAM_MAX_ADDR   = (BRAM_GEN_MODE_SEL == 0) ? ALGO_H1_BRAM_MAX_ADDR      : ALGO_V2_BRAM_MAX_ADDR;
localparam  BRAM_RSV_ADDR   = (BRAM_GEN_MODE_SEL == 0) ? ALGO_H1_BRAM_ADDR_RSVBIT   : ALGO_V2_BRAM_ADDR_RSVBIT;
localparam  RAM_MAX_WIDTH   = (BRAM_GEN_MODE_SEL == 0) ? ALGO_H1_RAM_MAX_WIDTH      : ALGO_V2_RAM_MAX_WIDTH;
localparam  RAM_END_WIDTH   = (BRAM_GEN_MODE_SEL == 0) ? ALGO_H1_RAM_END_WIDTH      : ALGO_V2_RAM_END_WIDTH;
//----------
localparam  BRAM_ROW_BIT        = dec2bit_width(BRAM_ROW_CNT);
localparam  RAM_MAX_WE          = ram_width_we(RAM_MAX_WIDTH),
            RAM_END_WE          = ram_width_we(RAM_END_WIDTH);
localparam  BRAM_DO_REG         = (RAM_DO_REG == 1) : 1'b1 : 1'b0;           
//--------------------------
//  signals
//--------------------------
wire[BRAM_ROW_CNT - 1:0]    ram_wen;
wire[BRAM_ROW_CNT - 1:0]    ram_ren;
wire[BRAM_ROW_CNT*RAM_WIDTH - 1:0]  ram_rdata;

wire[RAM_DEEP - 1:0]    rdaddress_tmp;  
reg [RAM_DEEP - 1:0]    rdaddress_dly;  
//-------------------------------------------------------------
//  process
//-------------------------------------------------------------
assign  rdaddress_tmp = (rden == 1'b1) ? rdaddress: rdaddress_dly;
always@(posedge clk_rd or posedge reset)
begin
    if(reset == 1'b1) begin
        rdaddress_dly   <=  {RAM_DEEP{1'b0}};
    end
    else if(rden == 1'b1) begin
        rdaddress_dly   <=  rdaddress;
    end
    else ;
end

//write or read enable select BRAM to op
genvar wr_index;
generate
if(BRAM_ROW_CNT < 2) begin : SIGL_ROW_CNT
    assign  ram_wen = wren;
    assign  ram_ren = rden;
    assign  q       = ram_rdata;
end
else if(RAM_DO_REG == 1) begin : BRAM_SEL_REG

reg [BRAM_ROW_BIT - 1:0]    rdout_sel;
reg [BRAM_ROW_BIT - 1:0]    rdout_sel_1dly;

for(wr_index=0;wr_index<BRAM_ROW_CNT;wr_index=wr_index+1) begin : BRAM_WREN
    assign  ram_wen[wr_index] = (wraddress[RAM_DEEP-1:BRAM_MAX_ADDR] == wr_index) & (wren == 1'b1);
    assign  ram_ren[wr_index] = (rdaddress[RAM_DEEP-1:BRAM_MAX_ADDR] == wr_index) & (rden == 1'b1);
end
//output data select
always@(posedge clk_rd or posedge reset) begin
    if(reset == 1'b1) begin
        rdout_sel   <=  {BRAM_ROW_BIT{1'b0}};
    end
    else if(rden == 1'b1) begin
        rdout_sel   <=  rdaddress[RAM_DEEP-1:BRAM_MAX_ADDR];
    end
    else ;
end

always@(posedge clk_rd or posedge reset) begin
    if(reset == 1'b1) begin
        rdout_sel_1dly  <=  {BRAM_ROW_BIT{1'b0}};
    end
    else begin
        rdout_sel_1dly  <=  rdout_sel;
    end
end
//data out
assign  q   = ram_rdata[RAM_WIDTH*rdout_sel_1dly +:RAM_WIDTH];

end
else begin : BRAM_NO_REG

reg [BRAM_ROW_BIT - 1:0]    rdout_sel;

for(wr_index=0;wr_index<BRAM_ROW_CNT;wr_index=wr_index+1) begin : BRAM_WREN
    assign  ram_wen[wr_index] = (wraddress[RAM_DEEP-1:BRAM_MAX_ADDR] == wr_index) & (wren == 1'b1);
    assign  ram_ren[wr_index] = (rdaddress[RAM_DEEP-1:BRAM_MAX_ADDR] == wr_index) & (rden == 1'b1);
end
//output data select
always@(posedge clk_rd or posedge reset) begin
    if(reset == 1'b1) begin
        rdout_sel   <=  {BRAM_ROW_BIT{1'b0}};
    end
    else if(rden == 1'b1) begin
        rdout_sel   <=  rdaddress[RAM_DEEP-1:BRAM_MAX_ADDR];
    end
    else ;
end
//data out
assign  q   = ram_rdata[RAM_WIDTH*rdout_sel +:RAM_WIDTH];

end
endgenerate

//instance BRAM
genvar col_index,row_index;
generate
for(row_index=0;row_index < BRAM_ROW_CNT;row_index=row_index+1) begin : BRAM_ROW_UNIT
    for(col_index=0;col_index < BRAM_COL_CNT;col_index=col_index+1) begin : BRAM_COL_UNIT
        if(col_index + 1 == BRAM_COL_CNT) begin
            defparam    u1_xilinx_sdpram.DEVICE         = DEVICE_ID     ,   //"7SERIES" or "SPARTAN6"
                        u1_xilinx_sdpram.BRAM_SIZE      = BRAM_TYPE     ,   //"9Kb" or "18Kb" or "36Kb"
                        u1_xilinx_sdpram.WRITE_WIDTH    = RAM_END_WIDTH ,
                        u1_xilinx_sdpram.READ_WIDTH     = RAM_END_WIDTH ,
                        u1_xilinx_sdpram.WRITE_MODE     = WRITE_MODE    ,   //Specify "READ_FIRST" for synchronous clocks,"WRITE_FIRST" for asynchronous clocks
                        u1_xilinx_sdpram.DO_REG         = RAM_DO_REG    ,
                        u1_xilinx_sdpram.SIM_COLLISION_CHECK = "ALL"    ;   //Collision check enable "ALL", "WARNING_ONLY", "GENERATE_X_ONLY" or "NONE"
            BRAM_SDP_MACRO  u1_xilinx_sdpram(
                        .WRCLK    (clk_wr                                                   ),  //i1:write clock

                        .WREN     (1'b1                                                     ),  //i1:write port enable  
                        .WRADDR   ({{BRAM_RSV_ADDR{1'b0}},wraddress[BRAM_MAX_ADDR - 1:0]}   ),  //col_index[DEEP]:write address

                        .WE       ({RAM_END_WE{ram_wen[row_index]}}                         ),  //col_index[n]:write byte enable  
                        .DI       (data[RAM_WIDTH - 1:RAM_MAX_WIDTH*col_index]              ),  //col_index[RAM_END_WIDTH]:write data port
                        //read
                        .RDCLK    (clk_rd                                                   ),  //i1:read clock
                        .RDADDR   ({{BRAM_RSV_ADDR{1'b0}},rdaddress_tmp[BRAM_MAX_ADDR - 1:0]}   ),  //col_index[DEEP]:read address, width defined by read port depth

                        .RDEN     (1'b1                                                     ),  //i1:read port enable 
                        .DO       (ram_rdata[RAM_WIDTH*(row_index+1) - 1: (RAM_MAX_WIDTH*col_index + RAM_WIDTH*row_index)] ),
                        //configure
                        .RST      (1'b0                                                     ),  //i1:reset
                        .REGCE    (BRAM_DO_REG                                              )   //i1:read output register enable
                        );
        end
        else begin
            defparam    u0_xilinx_sdpram.DEVICE         = DEVICE_ID     ,   //"7SERIES" or "SPARTAN6"
                        u0_xilinx_sdpram.BRAM_SIZE      = BRAM_TYPE     ,   //"9Kb" or "18Kb" or "36Kb"
                        u0_xilinx_sdpram.WRITE_WIDTH    = RAM_MAX_WIDTH ,
                        u0_xilinx_sdpram.READ_WIDTH     = RAM_MAX_WIDTH ,
                        u0_xilinx_sdpram.WRITE_MODE     = WRITE_MODE    ,   //Specify "READ_FIRST" for synchronous clocks,"WRITE_FIRST" for asynchronous clocks
                        u0_xilinx_sdpram.DO_REG         = RAM_DO_REG    ,
                        u0_xilinx_sdpram.SIM_COLLISION_CHECK = "ALL"    ;   //Collision check enable "ALL", "WARNING_ONLY", "GENERATE_X_ONLY" or "NONE"
            BRAM_SDP_MACRO  u0_xilinx_sdpram(
                        .WRCLK    (clk_wr                                       ),  //i1:write clock

                        .WREN     (1'b1                                         ),  //i1:write port enable 
                        .WRADDR   (wraddress[BRAM_MAX_ADDR - 1:0]               ),  //col_index[DEEP]:write address

                        .WE       ({RAM_MAX_WE{ram_wen[row_index]}}             ),  //col_index[n]:write byte enable 
                        .DI       (data[RAM_MAX_WIDTH*col_index +:RAM_MAX_WIDTH]),  //col_index[n]:write data port
                        //read
                        .RDCLK    (clk_rd                                       ),  //i1:read clock
                        .RDADDR   (rdaddress_tmp[BRAM_MAX_ADDR - 1:0]           ),  //col_index[DEEP]:read address, width defined by read port depth

                        .RDEN     (1'b1                                         ),  //i1:read port enable 
                        .DO       (ram_rdata[(RAM_MAX_WIDTH*col_index + RAM_WIDTH*row_index) +:RAM_MAX_WIDTH] ),    //o[RAM_MAX_WIDTH]:read data, width defined by READ_WIDTH parameter
                        //configure
                        .RST      (1'b0                                         ),  //i1:reset
                        .REGCE    (BRAM_DO_REG                                  )   //i1:read output register enable
                        );
        end
    end
end
endgenerate

endmodule
