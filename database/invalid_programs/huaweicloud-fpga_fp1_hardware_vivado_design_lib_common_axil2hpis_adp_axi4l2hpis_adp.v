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

`include "hpi2axi_define.h"

module axi4l2hpis_adp
  #(
    parameter   ADDR_WIDTH      = 21  ,
    parameter   DATA_WIDTH      = 32  ,
    parameter   DATA_BYTE_NUM   = (DATA_WIDTH/8)
    )
   (
    // axi4 lite slave signals
    input  wire                             aclk                ,
    input  wire                             areset              ,

    input  wire                             awvalid             ,
    input  wire [ADDR_WIDTH-1:0]            awaddr              ,
    output wire                             awready             ,
    
    input  wire                             wvalid              ,
    input  wire [DATA_WIDTH-1:0]            wdata               ,
    input  wire [DATA_BYTE_NUM-1:0]         wstrb               ,
    output wire                             wready              ,
    
    output wire                             bvalid              ,
    output wire [1:0]                       bresp               ,
    input  wire                             bready              ,
    
    input  wire                             arvalid             ,
    input  wire [ADDR_WIDTH-1:0]            araddr              ,
    output wire                             arready             ,

    output wire                             rvalid              ,
    output wire [DATA_WIDTH-1:0]            rdata               ,
    output wire [1:0]                       rresp               ,
    input  wire                             rready              ,

    //MPI interface signal for module
    output reg                              cpu_wr              ,
    output reg  [ADDR_WIDTH-1:0]            cpu_wr_addr         ,
    output reg  [DATA_BYTE_NUM-1:0]         cpu_wr_strb         ,
    output reg  [DATA_WIDTH-1:0]            cpu_data_in         ,
    output reg                              cpu_rd              ,
    input  wire [DATA_WIDTH-1:0]            cpu_data_out
   );

/******************************************************************************\
                             parameter
\******************************************************************************/
localparam      WR_IDLE                 = 4'b0001               ;
localparam      WR_DATA                 = 4'b0010               ;
localparam      WR_RESP                 = 4'b0100               ;
localparam      WR_WAIT                 = 4'b1000               ;

localparam      RD_IDLE                 = 3'b001                ;
localparam      RD_WAIT                 = 3'b010                ;
localparam      RD_DATA                 = 3'b100                ;

/******************************************************************************\
                            signal 
\******************************************************************************/
reg     [3:0]                           wstate                  ;
reg     [3:0]                           wnext                   ;
wire                                    aw_hs                   ;
wire                                    w_hs                    ;
reg     [2:0]                           awwait_cnt              ;
reg                                     awwait_done             ;

reg     [2:0]                           rstate                  ;
reg     [2:0]                           rnext                   ;
wire                                    ar_hs                   ;
reg     [3:0]                           rwait_cnt               ;
reg                                     rwait_done              ;

/******************************************************************************\
                            process
\******************************************************************************/
//------------------------AXI write fsm-------------------
always @(posedge aclk or posedge areset)
begin
    if (areset == 1'b1) begin
        wstate <= WR_IDLE;
    end
    else begin
        wstate <= wnext;
    end
end

always @( * )
begin
    case (wstate)
        WR_IDLE:
            if (awvalid == 1'b1) begin
                wnext = WR_DATA;
            end
            else begin
                wnext = WR_IDLE;
            end
        WR_DATA:
            if (wvalid == 1'b1) begin
                wnext = WR_RESP;
            end
            else begin
                wnext = WR_DATA;
            end
        WR_RESP:
            if (bready == 1'b1) begin
                wnext = WR_WAIT;
            end
            else begin
                wnext = WR_RESP;
            end
        WR_WAIT:
            if (awwait_done == 1'b1) begin
                wnext = WR_IDLE;
            end
            else begin
                wnext = WR_WAIT;
            end
        default:
            wnext = WR_IDLE;
    endcase
end

assign awready = (wstate == WR_IDLE);
assign wready  = (wstate == WR_DATA);
assign aw_hs   = awvalid & awready;
assign bvalid  = (wstate == WR_RESP);
assign w_hs    = wvalid & wready;
assign bresp   = 2'b00;

always @(posedge aclk or posedge areset)
begin
    if (areset == 1'b1) begin
        awwait_cnt <= 3'd0;
    end
    else if (wstate == WR_DATA) begin
            awwait_cnt <= 3'd7;
    end
    else if (awwait_cnt > 3'd0) begin
        awwait_cnt <= awwait_cnt - 3'd1;
    end
    else;
end

always @(posedge aclk or posedge areset)
begin
    if (areset == 1'b1) begin
        awwait_done <= 1'b1;
    end
    else begin
        awwait_done <= (awwait_cnt == 3'd0);
    end
end

always @(posedge aclk or posedge areset)
begin
    if (areset == 1'b1) begin
        cpu_wr_addr <= {ADDR_WIDTH{1'b0}};
    end
    else if (aw_hs == 1'b1) begin
        cpu_wr_addr <= awaddr;
    end
    else if (ar_hs == 1'b1) begin
        cpu_wr_addr <= araddr;
    end
    else;
end

always @(posedge aclk or posedge areset)
begin
    if (areset == 1'b1) begin
        cpu_data_in <= {DATA_WIDTH{1'b0}};
    end
    else if (w_hs == 1'b1) begin
        cpu_data_in <= wdata;
    end
    else;
end

always @(posedge aclk or posedge areset)
begin
    if (areset == 1'b1) begin
        cpu_wr_strb <= {DATA_BYTE_NUM{1'b0}};
    end
    else if (w_hs == 1'b1) begin
        cpu_wr_strb <= wstrb;
    end
    else;
end

always @(posedge aclk or posedge areset)
begin
    if (areset == 1'b1) begin
        cpu_wr <= 1'b0;
    end
    else if (w_hs == 1'b1) begin
        cpu_wr <= 1'b1;
    end
    else begin
        cpu_wr <= 1'b0;
    end
end

//------------------------AXI read fsm-------------------
always @(posedge aclk or posedge areset)
begin
    if (areset == 1'b1) begin
        rstate <= RD_IDLE;
    end
    else begin
        rstate <= rnext;
    end
end

always @( * )
begin
    case (rstate)
        RD_IDLE:
            if (arvalid == 1'b1)
                rnext = RD_WAIT;
            else
                rnext = RD_IDLE;
        RD_WAIT:
            if (rwait_done == 1'b1)
                rnext = RD_DATA;
            else
                rnext = RD_WAIT;
        RD_DATA:
            if (rready & rvalid)
                rnext = RD_IDLE;
            else
                rnext = RD_DATA;
        default:
            rnext = RD_IDLE;
    endcase
end

assign arready = (rstate == RD_IDLE);
assign rdata   = cpu_data_out;
assign rresp   = `AXI_RESP_OKAY;
assign rvalid  = (rstate == RD_DATA);
assign ar_hs   = arvalid & arready;

always @(posedge aclk or posedge areset)
begin
    if (areset == 1'b1) begin
        cpu_rd <= 1'b0;
    end
    else if (rwait_cnt == 4'd10) begin
        cpu_rd <= 1'b1;
    end
    else begin
        cpu_rd <= 1'b0;
    end
end

always @(posedge aclk or posedge areset)
begin
    if (areset == 1'b1) begin
        rwait_cnt <= 4'd0;
    end
    else if (rstate == RD_IDLE) begin
        rwait_cnt <= 4'd15;
    end
    else if (rwait_cnt > 4'd0) begin
        rwait_cnt <= rwait_cnt - 4'd1;
    end
    else;
end

always @(posedge aclk or posedge areset)
begin
    if (areset == 1'b1) begin
        rwait_done <= 1'b0;
    end
    else if (rstate == RD_IDLE) begin
        rwait_done <= 1'b0;
    end
    else begin
        rwait_done <= (rwait_cnt == 4'd0);
    end
end

endmodule

