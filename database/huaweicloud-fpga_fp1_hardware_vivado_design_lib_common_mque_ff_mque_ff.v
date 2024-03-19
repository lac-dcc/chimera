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

module mque_ff
   #(
        parameter       WADDR_WIDTH             = 9                             ,   
        parameter       RADDR_WIDTH             = 9                             ,   
        parameter       WDATA_WIDTH             = 72                            ,   
        parameter       RDATA_WIDTH             = 72                            ,   
                
        parameter       DEPTH_QUE               = 256                           , 
        parameter       PORT_WIDTH              = 1                             , 
        parameter       PORT_NUM                = 2                             , 
        parameter       WATERLINE_AFULL         = DEPTH_QUE-16                  ,
        parameter       LWADDR_WIDTH            = WADDR_WIDTH - PORT_WIDTH      ,
        parameter       LRADDR_WIDTH            = RADDR_WIDTH - PORT_WIDTH      ,
        
        parameter       FF_LATCH                = DEPTH_QUE - 16                ,
        parameter       OVERFLOW_LATCH          = DEPTH_QUE -2                  ,
        parameter       ADDR_PROTECT            = DEPTH_QUE -2                  ,
        parameter       WLINE_WIDTH             = 8                             ,   
        parameter       RST_CNT_WIDTH           = 9
    )

    (
        input                                   reset                           ,
        input                                   clks                            ,
                                                                                
        input                                   wr                              , 
        input          [PORT_WIDTH-1:0]         wport                           , 
        input          [WDATA_WIDTH-1:0]        wdata                           , 
        output  reg    [PORT_NUM-1:0]           af                              , 
        output  reg    [PORT_NUM-1:0]           ff                              , 
                                                                                
        input                                   rd                              , 
        input          [PORT_WIDTH-1:0]         rport                           , 
        output  wire   [RDATA_WIDTH-1:0]        rdata                           , 
        output  wire   [PORT_NUM-1:0]           ef                              , 
        
        output  reg    [PORT_NUM-1:0]           underflow                       , 
        output  reg    [PORT_NUM-1:0]           overflow                        , 
        output  wire   [WLINE_WIDTH*PORT_NUM-1:0]   waterlinex                    
    );
/******************************************************************************\
    signals
\******************************************************************************/ 
wire    [RADDR_WIDTH-1  : 0]                    raddr                           ;                                             
wire    [WADDR_WIDTH-1  : 0]                    waddr                           ;   

wire    [PORT_NUM-1:0]                          wen                             ;
wire    [PORT_NUM-1:0]                          ren                             ;
reg     [LWADDR_WIDTH-1:0]                      lwaddr[PORT_NUM-1:0]            ;   
reg     [LRADDR_WIDTH-1:0]                      lraddr[PORT_NUM-1:0]            ;

(*max_fanout=4*)    reg                         wr_dly                          ;
(*dont_touch="yes"*)reg     [WDATA_WIDTH-1:0]   wdata_dly={(WDATA_WIDTH){1'b1}} ;  
(*max_fanout=4*)    reg     [WADDR_WIDTH-1:0]   waddr_dly                       ;   

wire    [PORT_NUM-1:0]                          ef_pre                          ;
reg     [2:0]                                   ef_tmp[PORT_NUM-1:0]            ;

wire    [WLINE_WIDTH-1:0]                       waterline[PORT_NUM-1:0]         ;

wire    [PORT_NUM-1:0]                          err_reset                       ;
reg     [RST_CNT_WIDTH-1:0]                     fifo_reset_cnt[PORT_NUM-1:0]    ;

reg     [LWADDR_WIDTH-1:0]                      lwaddr_clksr[PORT_NUM-1:0]      ;

reg     [PORT_NUM-1:0]                          ff_pre                          ;
reg     [PORT_NUM-1:0]                          ff_clkr_pre                     ;
reg     [PORT_NUM-1:0]                          ff_clkr                         ;
reg     [PORT_NUM-1:0]                          af_pre                          ;
reg     [PORT_NUM-1:0]                          af_clkr_pre                     ;
reg     [PORT_NUM-1:0]                          af_clkr                         ;
            
reg     [PORT_NUM-1:0]                          fifo_reset_clksw                ;
reg     [PORT_NUM-1:0]                          fifo_reset_clksw_pre            ;

wire    [PORT_NUM-1:0]                          fifo_reset_clksr                ;
        
wire                                            resetw                          ;  
wire                                            clksw                           ;  
wire                                            resetr                          ;
wire                                            clksr                           ;  


//******************************************************************************\
//                              instance
//******************************************************************************/
sdpramb_dclk

        #(
       .WRITE_WIDTH                ( WDATA_WIDTH         ),
       .WRITE_DEPTHBIT             ( WADDR_WIDTH         ),
       .READ_WIDTH                 ( RDATA_WIDTH         ),
       .READ_DEPTHBIT              ( RADDR_WIDTH         )
    ) u_sdpramb_ram
    (                                                
        .wrclock                   ( clksw               ),
        .wrclocken                 ( 1'b1                ),
        .wren                      ( wr_dly              ),
        .wraddress                 ( waddr_dly           ),
        .data                      ( wdata_dly           ),
        .rdclock                   ( clksr               ),
        .rdclocken                 ( 1'b1                ),
        .rdaddress                 ( raddr               ),
        .q                         ( rdata               )
    );

//******************************************************************************\
//                             write ram process
//******************************************************************************/
assign  resetw = reset;
assign  resetr = reset;
   
assign  clksw  = clks;
assign  clksr  = clks;

assign  waddr  = { wport,lwaddr[wport]};
assign  raddr  = { rport,lraddr[rport]};

always @( posedge clksw or posedge resetw )
begin
    if (resetw == 1'd1 ) begin
        wr_dly <= 1'b0;
    end
    else begin       
        wr_dly <= wr;
    end
end

always @( posedge clksw or posedge resetw )
begin
    if (resetw == 1'd1 ) begin
        waddr_dly <= {(WADDR_WIDTH){1'b0}};
    end
    else begin       
        waddr_dly <= waddr;
    end
end

always @( posedge clksw)
begin
    wdata_dly <= wdata;
end


genvar i;
generate
    for (i=0;i<PORT_NUM;i=i+1) begin : QUE_NUM 
            assign wen[i] = ( ( wport == i ) && ( wr == 1'b1 ) ) ? 1'b1 : 1'b0;
            
            assign ren[i] = ( ( rport == i ) && ( rd == 1'b1 ) ) ? 1'b1 : 1'b0;
            
            
            always @ ( posedge clksw or posedge resetw )
            begin
                if ( resetw == 1'd1 ) begin
                    lwaddr[i] <= {(LWADDR_WIDTH){1'b0}};
                end
                else if ( (fifo_reset_clksw[i] == 1'b1) || ((lwaddr[i] > ADDR_PROTECT[6:0]) && (wen[i] == 1'b1))) begin
                    lwaddr[i] <= {(LWADDR_WIDTH){1'b0}};
                end
                else if (wen[i] == 1'b1) begin
                    lwaddr[i] <= lwaddr[i] + {{(LWADDR_WIDTH-1){1'b0}},1'b1};
                end
                else ;
            end
            
            always @ ( posedge clksr or posedge resetr )
            begin
                if ( resetr == 1'd1 ) begin
                    lraddr[i] <= {(LRADDR_WIDTH){1'b0}};
                end
                else if ( (fifo_reset_clksr[i] == 1'b1) || ((lraddr[i] > ADDR_PROTECT[6:0]) && (ren[i] == 1'b1)) ) begin
                    lraddr[i] <= {(LRADDR_WIDTH){1'b0}};
                end
                else if (ren[i] == 1'b1) begin
                    lraddr[i] <= lraddr[i] + {{(LRADDR_WIDTH-1){1'b0}},1'b1};
                end
                else ;
            end            
            
            always @(posedge clksr or posedge resetr)
            begin
                if (resetr == 1'b1) begin
                    lwaddr_clksr[i] <= {(LWADDR_WIDTH){1'b0}};
                end
                else begin
                    lwaddr_clksr[i] <= lwaddr[i];
                end
            end

            assign  waterline[i] = (lwaddr_clksr[i] >= lraddr[i]) ? (lwaddr_clksr[i] - lraddr[i]) 
                                                                        : (lwaddr_clksr[i] + DEPTH_QUE[6:0] - lraddr[i]);
            
            always @( posedge clksr or posedge resetr )
            begin
                if ( resetr == 1'b1 ) begin
                    ff_pre[i] <= 1'b0;
                end
                else if ( fifo_reset_clksr[i] == 1'b1 ) begin
                    ff_pre[i] <= 1'b1;
                end
                else begin
                    ff_pre[i] <= ( waterline[i] > FF_LATCH[6:0] );
                end
            end
            
            always @( posedge clksw or posedge resetw )
            begin
                if ( resetw == 1'b1 ) begin
                    ff_clkr_pre[i] <= 1'b0;
                    ff_clkr[i]     <= 1'b0;
                    ff[i]          <= 1'b0;
                end
                else begin
                    ff_clkr_pre[i] <= ff_pre[i];
                    ff_clkr[i]     <= ff_clkr_pre[i];
                    ff[i]          <= ff_clkr[i] | fifo_reset_clksw[i];
                end
            end
            
            
            assign ef_pre[i] = ( waterline[i] == {WLINE_WIDTH{1'b0}} ) ? 1'b1 : 1'b0;
            
            always @ (posedge clksr or posedge resetr)
            begin
                if (resetr == 1'b1) begin
                    ef_tmp[i] <= 3'h7;
                end
                else if (fifo_reset_clksr[i] == 1'b1) begin
                    ef_tmp[i] <= 3'h7;
                end
                else begin
                    ef_tmp[i] <= {ef_tmp[i][1:0],ef_pre[i]};
                end
            end
            
            assign ef[i] = (| ef_tmp[i]);
            
            always @ (posedge clksr or posedge resetr)
            begin
                if (resetr == 1'b1) begin
                    underflow[i] <= 1'b0;
                end
                else begin
                    underflow[i] <= ef[i] & ren[i];             
                end           
            end
            
            always @ ( posedge clksr or posedge resetr )
            begin
                if ( resetr == 1'b1 ) begin
                    af_pre[i] <= 1'b0;
                end
                else begin
                    af_pre[i] <= ( waterline[i] > WATERLINE_AFULL[6:0] );
                end
            end
            always @( posedge clksw or posedge resetw )
            begin
                if ( resetw == 1'b1 ) begin
                    af_clkr_pre[i] <= 1'b0;
                    af_clkr[i]     <= 1'b0;
                    af[i]          <= 1'b0;
                end
                else begin
                    af_clkr_pre[i] <= af_pre[i];
                    af_clkr[i]     <= af_clkr_pre[i];
                    af[i]          <= af_clkr[i] | fifo_reset_clksw[i];
                end
            end
                        
            always @ (posedge clksr or posedge resetr)
            begin
                if (resetr == 1'b1) begin
                    overflow[i] <= 1'b0 ;
                end
                else if ( waterline[i] >  OVERFLOW_LATCH[6:0]) begin     
                    overflow[i] <= 1'b1 ;
                end
                else begin
                    overflow[i] <= 1'b0 ;
                end                   
            end           
            
            assign err_reset[i] = underflow[i] | overflow[i];
            
            always @ (posedge clksr or posedge resetr)
            begin
                if (resetr == 1'b1) begin
                    fifo_reset_cnt[i] <= {1'b1,{(RST_CNT_WIDTH-1){1'b0}}};
                end
                else if (err_reset[i] == 1'b1) begin
                    fifo_reset_cnt[i] <= {RST_CNT_WIDTH{1'b0}};
                end
                else if (fifo_reset_cnt[i][RST_CNT_WIDTH-1] == 1'b0) begin
                    fifo_reset_cnt[i] <= fifo_reset_cnt[i] + {{(RST_CNT_WIDTH-1){1'b0}},1'b1};
                end
            end
            
            assign fifo_reset_clksr[i] = (~fifo_reset_cnt[i][RST_CNT_WIDTH-1]);
            
            always @(posedge clksw or posedge resetw)
            begin
                if (resetw == 1'b1) begin
                    fifo_reset_clksw_pre[i] <= 1'b0;
                    fifo_reset_clksw[i]     <= 1'b0;
                end
                else begin
                    fifo_reset_clksw_pre[i] <= fifo_reset_clksr[i];
                    fifo_reset_clksw[i]     <= fifo_reset_clksw_pre[i];
                end
            end
    end
endgenerate

genvar k;
generate
    for (k=0;k<PORT_NUM;k=k+1) begin : QUE_NUM1 
        assign waterlinex[(WLINE_WIDTH*(k+1)-1):k*WLINE_WIDTH] = waterline[k];
    end
endgenerate

endmodule
