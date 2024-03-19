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

module asyn_frm_fifo_288x512_sa
    #(
    parameter   DATA_WIDTH = 288        ,
    parameter   ADDR_WIDTH = 9          ,
    parameter   EOP_POS    = 262        ,
    parameter   ERR_POS    = 261        ,
    parameter   FULL_LEVEL = 9'd400     ,      
    parameter   ERR_DROP   = 1'b1
    )
    (
    input                           rd_clk              ,
    input                           rd_rst              ,
    input                           wr_clk              ,
    input                           wr_rst              ,

    input                           wr                  ,
    input       [DATA_WIDTH-1:0]    wdata               ,
    output  reg                     wafull              ,
    output  reg [ADDR_WIDTH-1:0]    wr_data_cnt         ,
    
    input                           rd                  ,
    output      [DATA_WIDTH-1:0]    rdata               ,
    output                          rempty              ,
    output  reg [ADDR_WIDTH-1:0]    rd_data_cnt         ,       
    
    output  reg                     empty_full_err             
    );

/********************************************************************************************************************\
 parameter
\********************************************************************************************************************/
localparam  U_DLY       = 0             ;
/********************************************************************************************************************\
 signals
\********************************************************************************************************************/
wire    [ADDR_WIDTH-1:0]    entry_used_wr           ;

wire    [DATA_WIDTH-1:0]    rdata_pre               ;
reg     [ADDR_WIDTH-1:0]    raddr                   ;
reg     [ADDR_WIDTH-1:0]    raddr_gray              ;
reg     [ADDR_WIDTH-1:0]    raddr_gray_1d           ;
reg     [ADDR_WIDTH-1:0]    raddr_gray_2d           ;
reg     [ADDR_WIDTH-1:0]    raddr_wr                ;

reg     [ADDR_WIDTH-1:0]    waddr_lock              ;
reg     [ADDR_WIDTH-1:0]    waddr                   ;
reg     [ADDR_WIDTH-1:0]    waddr_gray              ;
reg     [ADDR_WIDTH-1:0]    waddr_gray_1d           ;
reg     [ADDR_WIDTH-1:0]    waddr_gray_2d           ;
reg     [ADDR_WIDTH-1:0]    waddr_rd                ;

reg     [ADDR_WIDTH-1:0]    wrfrm_cnt               ;
reg     [ADDR_WIDTH-1:0]    wrfrm_cnt_gray          ;
reg     [ADDR_WIDTH-1:0]    wrfrm_cnt_gray_1d       ;
reg     [ADDR_WIDTH-1:0]    wrfrm_cnt_gray_2d       ;
reg     [ADDR_WIDTH-1:0]    wrfrm_cnt_rd            ;

reg     [ADDR_WIDTH-1:0]    rdfrm_cnt               ;

//ping-pong ram output
reg     [DATA_WIDTH-1:0]    pp0_reg                 ;
reg     [DATA_WIDTH-1:0]    pp1_reg                 ;
reg     [DATA_WIDTH-1:0]    pp2_reg                 ;
reg     [DATA_WIDTH-1:0]    pp3_reg                 ;
reg     [DATA_WIDTH-1:0]    ppx_reg                 ;

reg     [2:0]               pp_get                  ;
reg     [2:0]               pp_put                  ;
reg     [2:0]               pp_put_reg              ;
wire                        pp_full                 ;
wire                        pp_empty                ;

wire                        wr_err_drop_en          ;
wire                        waddr_lock_en           ;

wire                        frm_true_empty          ;
reg                         entry_true_full         ;
wire                        entry_true_empty        ;
wire                        inter_rd                ;
(*KEEP = "TRUE"*)     wire  inter_rd_pre            ;
reg                         inter_rd_1d             ;

//ef and ff process
reg                         frm_true_empty_1d_wr    ;
reg                         frm_true_empty_2d_wr    ;
reg                         empty_full_err_pre      ;
reg                         empty_full_err_pre_1d   ;
reg     [3:0]               rst_cnt                 ;
wire                        rst_pre                 ;

reg                         inter_rd_rst_pre        ;
reg                         inter_wr_rst_pre        ;

reg                         inter_rd_rst            ;
reg                         inter_wr_rst            ;
//*********************************************************************************************************************
//    process
//*********************************************************************************************************************
sdpramb_dclk
    #(
    .WRITE_WIDTH                ( DATA_WIDTH          ),
    .WRITE_DEPTHBIT             ( ADDR_WIDTH          ),
    .READ_WIDTH                 ( DATA_WIDTH          ),
    .RAM_OUT_REG                ( 0                   ),
    .READ_DEPTHBIT              ( ADDR_WIDTH          )
    ) u_sdpramb_ram
    (
    .wrclock                    ( wr_clk              ),
    .wrclocken                  ( wr                  ),
    .wren                       ( wr                  ),
    .wraddress                  ( waddr               ),
    .data                       ( wdata               ),
    .rdclock                    ( rd_clk              ),
    .rdclocken                  ( 1'b1                ),
    .rdaddress                  ( raddr               ),
    .q                          ( rdata_pre           )
    );

//judge err drop en
assign wr_err_drop_en = ERR_DROP ? ( wdata[EOP_POS] & wdata[ERR_POS] & wr ) : 1'b0;
assign waddr_lock_en  = wdata[EOP_POS] & ( ~ wdata[ERR_POS] ) & wr;

always @ ( posedge wr_clk or posedge inter_wr_rst )
begin
    if ( inter_wr_rst )
        waddr <= #U_DLY {ADDR_WIDTH{1'b0}};
    else if ( wr & wr_err_drop_en & ( ~ entry_true_full ))
        waddr <= #U_DLY waddr_lock;
    else if ( wr & ( ~ wr_err_drop_en ) & ( ~ entry_true_full ))
        waddr <= #U_DLY waddr + {{(ADDR_WIDTH-1){1'b0}},1'b1};
    else
        ;
end

always @ ( posedge wr_clk or posedge inter_wr_rst )
begin
    if ( inter_wr_rst )
        waddr_lock <= #U_DLY {ADDR_WIDTH{1'b0}};
    else if ( wr & waddr_lock_en )
        waddr_lock <= #U_DLY waddr + {{(ADDR_WIDTH-1){1'b0}},1'b1};
    else
        ;
end

//refresh wr port frame cnt
always @ ( posedge wr_clk or posedge inter_wr_rst )
begin
    if ( inter_wr_rst )
        wrfrm_cnt <= #U_DLY {ADDR_WIDTH{1'b0}};
    else if ( wr & wdata[EOP_POS] & ( ~ wr_err_drop_en ))
        wrfrm_cnt <= #U_DLY wrfrm_cnt + {{(ADDR_WIDTH-1){1'b0}},1'b1};
    else
        ;
end

assign entry_used_wr = ( waddr - raddr_wr );

always @ ( posedge wr_clk or posedge wr_rst )
begin
    if ( wr_rst )
        wr_data_cnt <= #U_DLY {ADDR_WIDTH{1'b0}};
    else
        wr_data_cnt <= #U_DLY entry_used_wr;
end

always @ ( posedge wr_clk or posedge inter_wr_rst )
begin
    if ( inter_wr_rst )
        wafull <= #U_DLY 1'b1;
    else
        wafull <= #U_DLY ( entry_used_wr >= FULL_LEVEL );
end

always @ ( posedge wr_clk or posedge inter_wr_rst )
begin
    if ( inter_wr_rst )
        entry_true_full <= #U_DLY 1'b0;
    else
        entry_true_full <= #U_DLY entry_used_wr >= ({ADDR_WIDTH{1'b1}} - { {(ADDR_WIDTH-4){1'b0}}, 4'ha });
end

//transfer wr addr to gray code
always @ ( posedge wr_clk or posedge inter_wr_rst )
begin
    if ( inter_wr_rst )
        waddr_gray <= #U_DLY {ADDR_WIDTH{1'b0}};
    else
        waddr_gray <= #U_DLY waddr ^ ( waddr >> 1 );
end

always @ ( posedge rd_clk or posedge inter_rd_rst )
begin
    if ( inter_rd_rst )
    begin
        waddr_gray_1d <= #U_DLY {ADDR_WIDTH{1'b0}};
        waddr_gray_2d <= #U_DLY {ADDR_WIDTH{1'b0}};
    end
    else
    begin
        waddr_gray_1d <= #U_DLY waddr_gray;
        waddr_gray_2d <= #U_DLY waddr_gray_1d;
    end
end

always @ ( posedge rd_clk or posedge inter_rd_rst )
begin
    if ( inter_rd_rst )
        waddr_rd <= #U_DLY {ADDR_WIDTH{1'b0}};
    else
        waddr_rd <= #U_DLY gray2bin(waddr_gray_2d);
end

//frame cnt, transfer to gray code, and sync to read clock domain
always @ ( posedge wr_clk or posedge inter_wr_rst )
begin
    if ( inter_wr_rst )
        wrfrm_cnt_gray <= #U_DLY {ADDR_WIDTH{1'b0}};
    else
        wrfrm_cnt_gray <= #U_DLY wrfrm_cnt ^ ( wrfrm_cnt >> 1 );
end

always @ ( posedge rd_clk or posedge inter_rd_rst )
begin
    if ( inter_rd_rst )
    begin
        wrfrm_cnt_gray_1d <= #U_DLY {ADDR_WIDTH{1'b0}};
        wrfrm_cnt_gray_2d <= #U_DLY {ADDR_WIDTH{1'b0}};
    end
    else
    begin
        wrfrm_cnt_gray_1d <= #U_DLY wrfrm_cnt_gray;
        wrfrm_cnt_gray_2d <= #U_DLY wrfrm_cnt_gray_1d;
    end
end

always @ ( posedge rd_clk or posedge inter_rd_rst )
begin
    if ( inter_rd_rst )
        wrfrm_cnt_rd <= #U_DLY {ADDR_WIDTH{1'b0}};
    else
        wrfrm_cnt_rd <= #U_DLY gray2bin(wrfrm_cnt_gray_2d);
end

/*******************************************************************************************************
//read addr process
********************************************************************************************************/
always @ ( posedge rd_clk or posedge inter_rd_rst )
begin
    if ( inter_rd_rst )
        raddr <= #U_DLY {ADDR_WIDTH{1'b0}};
    else if ( inter_rd )
        raddr <= #U_DLY raddr + {{(ADDR_WIDTH-1){1'b0}},1'b1};
    else
        ;
end

assign  entry_true_empty = ( raddr == waddr_rd );
assign  frm_true_empty = ( rdfrm_cnt == wrfrm_cnt_rd );

//rd addr transfer to gray code, sync into wr domain
always @ ( posedge rd_clk or posedge inter_rd_rst )
begin
    if ( inter_rd_rst )
        raddr_gray <= #U_DLY {ADDR_WIDTH{1'b0}};
    else
        raddr_gray <= #U_DLY raddr ^ ( raddr >> 1 );
end

always @ ( posedge wr_clk or posedge inter_wr_rst )
begin
    if ( inter_wr_rst )
    begin
        raddr_gray_1d <= #U_DLY {ADDR_WIDTH{1'b0}};
        raddr_gray_2d <= #U_DLY {ADDR_WIDTH{1'b0}};
    end
    else
    begin
        raddr_gray_1d <= #U_DLY raddr_gray;
        raddr_gray_2d <= #U_DLY raddr_gray_1d;
    end
end

always @ ( posedge wr_clk or posedge inter_wr_rst )
begin
    if ( inter_wr_rst )
        raddr_wr <= #U_DLY {ADDR_WIDTH{1'b0}};
    else
        raddr_wr <= #U_DLY gray2bin(raddr_gray_2d);
end

//make ping-pong regs ef ff signals
assign pp_full = ( pp_put_reg[2] ^ pp_get[2] ) & ( pp_put_reg[1:0] == pp_get[1:0] );    
assign pp_empty = ( pp_put == pp_get );                                     

//refresh rd port frame cnt
always @ ( posedge rd_clk or posedge inter_rd_rst )
begin
    if ( inter_rd_rst )
        rdfrm_cnt <= #U_DLY {ADDR_WIDTH{1'b0}};
    else if ( inter_rd_1d & rdata_pre[EOP_POS] )
        rdfrm_cnt <= #U_DLY rdfrm_cnt + {{(ADDR_WIDTH-1){1'b0}},1'b1};
    else
        ;
end

always @ ( posedge rd_clk or posedge inter_rd_rst )
begin
    if ( inter_rd_rst )
        inter_rd_1d <= #U_DLY 1'b0;
    else
        inter_rd_1d <= #U_DLY inter_rd;
end

//*****************************************************************************************************
assign  inter_rd_pre = ( ~ pp_full ) & ( ~ entry_true_empty ) & ( ~ frm_true_empty );
assign  inter_rd     = ( inter_rd_pre & ( ~ inter_rd_1d )) | ( inter_rd_pre & ( ~ rdata_pre[EOP_POS] ));

//refresh ping-pong flag
always @ ( posedge rd_clk or posedge inter_rd_rst )
begin
    if ( inter_rd_rst )
        pp_put_reg <= #U_DLY 3'b0;
    else if ( inter_rd )
        pp_put_reg <= #U_DLY pp_put_reg + 3'b1;
    else
        ;
end

always @ ( posedge rd_clk or posedge inter_rd_rst )
begin
    if ( inter_rd_rst )
        pp_get <= #U_DLY 3'b0;
    else if ( rd & ( ~ pp_empty ))
        pp_get <= #U_DLY pp_get + 3'b1;
    else
        ;
end

always @ ( posedge rd_clk or posedge inter_rd_rst )
begin
    if ( inter_rd_rst )
        pp_put <= #U_DLY 3'b0;
    else
        pp_put <= #U_DLY pp_put_reg;
end

always @ ( posedge rd_clk or posedge inter_rd_rst )
begin
    if ( inter_rd_rst )
        pp0_reg <= #U_DLY { {(DATA_WIDTH-EOP_POS){1'b0}}, 1'b1, {(EOP_POS-2){1'b0}} };
    else if (( pp_put[1:0]==2'h0 ) & inter_rd_1d )
        pp0_reg <= #U_DLY rdata_pre;
    else
        ;
end

always @ ( posedge rd_clk or posedge inter_rd_rst )
begin
    if ( inter_rd_rst )
        pp1_reg <= #U_DLY { {(DATA_WIDTH-EOP_POS){1'b0}}, 1'b1, {(EOP_POS-2){1'b0}} };
    else if ( ( pp_put[1:0]==2'h1 )& inter_rd_1d )
        pp1_reg <= #U_DLY rdata_pre;
    else
        ;
end

always @ ( posedge rd_clk or posedge inter_rd_rst )
begin
    if ( inter_rd_rst )
        pp2_reg <= #U_DLY { {(DATA_WIDTH-EOP_POS){1'b0}}, 1'b1, {(EOP_POS-2){1'b0}} };
    else if ( ( pp_put[1:0]==2'h2 )& inter_rd_1d )
        pp2_reg <= #U_DLY rdata_pre;
    else
        ;
end

always @ ( posedge rd_clk or posedge inter_rd_rst )
begin
    if ( inter_rd_rst )
        pp3_reg <= #U_DLY { {(DATA_WIDTH-EOP_POS){1'b0}}, 1'b1, {(EOP_POS-2){1'b0}} };
    else if ( ( pp_put[1:0]==2'h3 )& inter_rd_1d )
        pp3_reg <= #U_DLY rdata_pre;
    else
        ;
end

always @ (*)
begin
    case(pp_get[1:0])
    2'b00   : ppx_reg = pp0_reg;
    2'b01   : ppx_reg = pp1_reg;
    2'b10   : ppx_reg = pp2_reg;
    default : ppx_reg = pp3_reg;
    endcase
end

assign rempty = pp_empty;
assign rdata = ppx_reg;


//read port, cnt
always @ ( posedge rd_clk or posedge inter_rd_rst )
begin
    if ( inter_rd_rst )
        rd_data_cnt <= #U_DLY {ADDR_WIDTH{1'b0}};
    else
        rd_data_cnt <= #U_DLY waddr_rd - raddr;
end
/***************************************************************************************************
//reset and err check for ef&ff err, err signal sync into wr clock domain
****************************************************************************************************/
always @ ( posedge wr_clk or posedge inter_wr_rst )
begin
    if ( inter_wr_rst )
    begin
        frm_true_empty_1d_wr <= #U_DLY 1'b0;
        frm_true_empty_2d_wr <= #U_DLY 1'b0;
    end
    else
    begin
        frm_true_empty_1d_wr <= #U_DLY frm_true_empty;
        frm_true_empty_2d_wr <= #U_DLY frm_true_empty_1d_wr;
    end
end

always @ ( posedge wr_clk or posedge inter_wr_rst )
begin
    if ( inter_wr_rst )
    begin
        empty_full_err_pre       <= #U_DLY 1'b0;
        empty_full_err_pre_1d    <= #U_DLY 1'b0;
        empty_full_err           <= #U_DLY 1'b0;
    end
    else
    begin
        empty_full_err_pre       <= #U_DLY frm_true_empty_2d_wr & wafull;
        empty_full_err_pre_1d    <= #U_DLY empty_full_err_pre;
        empty_full_err           <= #U_DLY empty_full_err_pre & ( ~ empty_full_err_pre_1d );
    end
end

//make reset
always @ ( posedge wr_clk or posedge wr_rst )
begin
    if ( wr_rst )
        rst_cnt <= #U_DLY 4'h0;
    else if ( empty_full_err )
        rst_cnt <= #U_DLY 4'h8;
    else if ( rst_cnt[3] )
        rst_cnt <= #U_DLY rst_cnt + 4'h1;
    else
        ;
end

assign rst_pre = rd_rst | wr_rst | rst_cnt[3];

always @ ( posedge wr_clk or posedge rst_pre )
begin
    if ( rst_pre )
    begin
        inter_wr_rst_pre     <= #U_DLY 1'b1;
        inter_wr_rst         <= #U_DLY 1'b1;
    end
    else
    begin
        inter_wr_rst_pre     <= #U_DLY 1'b0;
        inter_wr_rst         <= #U_DLY inter_wr_rst_pre;
    end
end

always @ ( posedge rd_clk or posedge rst_pre )
begin
    if ( rst_pre )
    begin
        inter_rd_rst_pre     <= #U_DLY 1'b1;
        inter_rd_rst         <= #U_DLY 1'b1;
    end
    else
    begin
        inter_rd_rst_pre     <= #U_DLY 1'b0;
        inter_rd_rst         <= #U_DLY inter_rd_rst_pre;
    end
end


//***************************************************************************************************
//function declaration
//****************************************************************************************************/
function [ADDR_WIDTH-1:0] gray2bin;
    input   [ADDR_WIDTH-1:0] gray_in;
    integer i;
begin
    gray2bin = gray_in;
    for (i = 1; i <= ADDR_WIDTH - 1; i = i + 1)
        gray2bin = gray2bin ^ (gray_in >> i);
end
endfunction

endmodule
