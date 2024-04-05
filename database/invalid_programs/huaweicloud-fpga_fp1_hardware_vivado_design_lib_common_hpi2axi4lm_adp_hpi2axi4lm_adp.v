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
`timescale 1ps/1ps

`include "hpi2axi_define.h"

module hpi2axi4lm_adp
  #(
    parameter   ADDR_WIDTH      = 32  ,
    parameter   DATA_WIDTH      = 32  ,
    parameter   DATA_BYTE_NUM   = (DATA_WIDTH/8)
    )
   (
    // axi4 lite master signals
    input  wire                             aclk                ,
    input  wire                             areset              ,

    output reg                              awvalid             ,
    output reg  [ADDR_WIDTH-1:0]            awaddr              ,
    input  wire                             awready             ,

    output reg                              wvalid              ,
    output reg  [DATA_WIDTH-1:0]            wdata               ,
    output reg  [DATA_BYTE_NUM-1:0]         wstrb               ,
    input  wire                             wready              ,
    
    input  wire                             bvalid              ,
    input  wire [1:0]                       bresp               ,
    output reg                              bready              ,
    
    output reg                              arvalid             ,
    output reg  [ADDR_WIDTH-1:0]            araddr              ,
    input  wire                             arready             ,
    
    input  wire                             rvalid              ,
    input  wire [DATA_WIDTH-1:0]            rdata               ,
    input  wire [1:0]                       rresp               ,
    output reg                              rready              ,

    input       [15:0]                      reg_tmout_axil_cfg  ,
    output      [4:0]                       reg_tmout_axil_err  ,

    //MPI interface signal for module
    input  wire                             cpu_wr              ,
    input  wire [ADDR_WIDTH-1:0]            cpu_wr_addr         ,
    input  wire [DATA_BYTE_NUM-1:0]         cpu_wr_strb         ,
    input  wire [DATA_WIDTH-1:0]            cpu_data_in         ,
    input  wire                             cpu_rd              ,
    input  wire [ADDR_WIDTH-1:0]            cpu_rd_addr         ,
    output reg                              cpu_data_out_vld    , 
    output reg  [DATA_WIDTH-1:0]            cpu_data_out 
   );

/******************************************************************************\
                             PARAMETER
\******************************************************************************/

/******************************************************************************\
                            temporary signal define
\******************************************************************************/
reg                                         cpu_wr_1dly         ;

wire                                        aw_hs               ;
wire                                        ar_hs               ;

wire    [4:0]                               vld                 ;
wire    [4:0]                               ready               ;

genvar                                      i0                  ;
/******************************************************************************\
                            design
\******************************************************************************/
always @( posedge aclk or posedge areset )
begin
    if ( areset == 1'b1 ) begin
        cpu_wr_1dly <= 1'b0;
    end
    else begin
        cpu_wr_1dly <= cpu_wr;
    end
end

//------------------------AXI write operation-------------------

always @( posedge aclk or posedge areset )
begin
    if ( areset == 1'b1 ) begin
        awvalid <= 1'b0;
    end
    else if ( cpu_wr == 1'b1 ) begin
        awvalid <= 1'b1;
    end
    else if ( awready == 1'b1 ) begin
        awvalid <= 1'b0;
    end
    else;
end

always @( posedge aclk or posedge areset)
begin
    if ( areset == 1'b1 ) begin
        awaddr <= {ADDR_WIDTH{1'b0}};
    end
    else begin
        awaddr <= cpu_wr_addr;
    end
end

always @( posedge aclk or posedge areset )
begin
    if ( areset == 1'b1 ) begin
        wvalid <= 1'b0;
    end
    else if ( cpu_wr_1dly == 1'b1 ) begin
        wvalid <= 1'b1;
    end
    else if ( wready == 1'b1 ) begin
        wvalid <= 1'b0;
    end
    else;
end

always @( posedge aclk )
begin
    wdata <= cpu_data_in;
end

always @( posedge aclk or posedge areset )
begin
    if ( areset == 1'b1 ) begin
        wstrb <= {DATA_BYTE_NUM{1'b1}};
    end
    else if ( cpu_wr == 1'b1 ) begin
        wstrb <= cpu_wr_strb;
    end
    else;
end

assign aw_hs = awvalid & awready;

always @( posedge aclk or posedge areset )
begin
    if ( areset == 1'b1 ) begin
        bready <= 1'b1;
    end
    else if ( aw_hs == 1'b1 ) begin
        bready <= 1'b1;
    end
    else if ( (bvalid == 1'b1) && (bresp == `AXI_RESP_OKAY) ) begin
        bready <= 1'b0;
    end
    else;
end

//------------------------AXI read operation-------------------

always @( posedge aclk or posedge areset )
begin
    if ( areset == 1'b1 ) begin
        arvalid <= 1'b0;
    end
    else if ( cpu_rd == 1'b1 ) begin
        arvalid <= 1'b1;
    end
    else if ( arready == 1'b1 ) begin
        arvalid <= 1'b0;
    end
    else;
end

always @( posedge aclk or posedge areset)
begin
    if ( areset == 1'b1 ) begin
        araddr <= {ADDR_WIDTH{1'b0}};
    end
    else begin
        araddr <= cpu_rd_addr;
    end
end

assign ar_hs   = arvalid & arready;

always @( posedge aclk or posedge areset)
begin
    if ( areset == 1'b1 ) begin
        rready <= 1'b1;
    end
    else if ( ar_hs == 1'b1 ) begin
        rready <= 1'b1;
    end
    else if ( (rvalid == 1'b1) && (rresp == `AXI_RESP_OKAY) ) begin
        rready <= 1'b0;
    end
    else;
end

always @( posedge aclk or posedge areset)
begin
    if ( areset == 1'b1 ) begin
        cpu_data_out_vld <= 1'b0;
    end
    else begin
        cpu_data_out_vld <= bvalid | rvalid;
    end
end

always @( posedge aclk )
begin
    cpu_data_out <= rdata;
end

assign vld   = {rvalid   ,
                arvalid  ,
                bvalid   ,
                wvalid   ,
                awvalid   };

assign ready = {rready   ,
                arready  ,
                bready   ,
                wready   ,
                awready   };

generate
    for( i0=0;i0<5;i0=i0+1) begin: GEN_TMOUT_AXIL_ERR
    
        axi_time_out u_axi_time_out
        (
            .clks                   (aclk                   ),
            .reset                  (areset                 ),
            
            .vld_in                 (vld[i0]                ),
            .ready_in               (ready[i0]              ),
            .reg_tmout_us_cfg       (reg_tmout_axil_cfg     ),
            .time_out               (reg_tmout_axil_err[i0] )  
        
        );
    end
endgenerate

endmodule
