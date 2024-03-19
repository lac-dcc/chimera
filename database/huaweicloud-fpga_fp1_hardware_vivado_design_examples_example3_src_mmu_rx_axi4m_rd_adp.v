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

module axi4m_rd_adp
   (
     input                           aclk                           ,
     input                           areset                         , 

     //with bd proc 	                                          
     output                          rcmd_ff_full                   ,       
     input                           rcmd_ff_wen                    ,
     input       [71:0]              rcmd_ff_wdata                  , 

     //with pkt proc 	                                          
     input                           pkt_back_full                  ,       
     output  reg                     pkt_back_wen                   ,
     output  reg [539:0]             pkt_back_wdata                 , 

    //axi4 read addr 	                                          
     output  reg [3:0]               arid                           ,  
     output  reg [63:0]              araddr                         ,
     output  reg [7:0]               arlen                          ,
     output      [2:0]               arsize                         ,
     output  reg                     arvalid                        ,
     input                           arready                        ,

     //axi4 read data 	                                          
     input       [3:0]               rid                            ,
     input       [511:0]             rdata                          ,
     input       [1:0]               rresp                          ,
     input                           rlast                          ,
     input                           rvalid                         ,
     output reg                      rready                         ,               
     
     //with cpu 	                                          
     input       [15:0]              reg_tmout_us_cfg               ,  
     output  reg [3:0]               reg_axi_tmout_err
   );

/******************************************************************************\
                            signal 
\******************************************************************************/
wire                        rcmd_ff_emp       ;     
wire                        rcmd_ff_ren       ;
wire    [71:0]              rcmd_ff_rdata     ;

wire    [27:0]              rdata_rev         ;

wire                        raddr_time_out    ;

/******************************************************************************\
                            process
\******************************************************************************/
//==================================================================================
// axi4 read ctrl 
//==================================================================================
assign rcmd_ff_ren = arvalid & arready;

assign arsize = 3'd6 ;

always @( posedge aclk or posedge areset )
begin
    if ( areset == 1'b1 ) begin
        arvalid <= 1'b0;
    end
    else if (rcmd_ff_ren == 1'b1 ) begin
        arvalid <= 1'b0;
    end
    else if (rcmd_ff_emp == 1'b0 ) begin
        arvalid <= 1'b1;
    end
    else;
end

always @( posedge aclk or posedge areset)
begin
    if ( areset == 1'b1 ) begin
        araddr <= 64'd0;
    end
    else begin
        araddr <= {30'd0,rcmd_ff_rdata[33:0]};
    end
end

always @( posedge aclk or posedge areset)
begin
    if ( areset == 1'b1 ) begin
        arid <= 4'd0;
    end
    else begin
        arid <= {2'd0,rcmd_ff_rdata[35:34]};
    end
end

always @( posedge aclk or posedge areset)
begin
    if ( areset == 1'b1 ) begin
        arlen <= 8'd0;
    end
    else begin
        arlen <= rcmd_ff_rdata[49:42] + {7'd0,((|rcmd_ff_rdata[41:36]))} - 8'd1;
    end
end

//==================================================================================
// axi4 read data 
//==================================================================================
always @( posedge aclk or posedge areset)
begin
    if ( areset == 1'b1 ) begin
        rready <= 1'b1;
    end
    else begin    
        rready <= ~pkt_back_full;
    end
end

assign rdata_rev = {20'd0,rlast,7'd0};

always @( posedge aclk )
begin
     pkt_back_wdata <= {rdata_rev,rdata[511:0]};
end
    
always@(posedge aclk or posedge areset)
begin
    if(areset == 1'd1)begin
        pkt_back_wen <= 1'b0;
    end
    else begin
        pkt_back_wen <= rvalid&rready;
    end
end   
    

always @( posedge aclk or posedge areset)
begin
    if ( areset == 1'b1 ) begin
        reg_axi_tmout_err <= 4'd0;
    end
    else begin
        reg_axi_tmout_err <= {3'd0,raddr_time_out};
    end
end

/******************************************************************************\
                            instance
\******************************************************************************/
asyn_frm_fifo_288x512_sa
    #(
    .DATA_WIDTH         ( 72                ),
    .ADDR_WIDTH         ( 9                 ),
    .EOP_POS            ( 69                ),
    .ERR_POS            ( 68                ),
    .FULL_LEVEL         ( 400               ),
    .ERR_DROP           ( 1'b1              )
    )
u_rcmd_ff
    (
    .rd_clk             ( aclk              ),
    .rd_rst             ( areset            ),
    .wr_clk             ( aclk              ),
    .wr_rst             ( areset            ),
    .wr                 ( rcmd_ff_wen       ),
    .wdata              ( rcmd_ff_wdata     ),
    .wafull             ( rcmd_ff_full      ),
    .wr_data_cnt        (                   ),
    .rd                 ( rcmd_ff_ren       ),
    .rdata              ( rcmd_ff_rdata     ),
    .rempty             ( rcmd_ff_emp       ),
    .rd_data_cnt        (                   ),
    .empty_full_err     (                   )
    );

axi_time_out u_raddr_tmout
     (
      .clks               ( aclk            ),
      .reset              ( areset          ),
      
      .vld_in             ( arvalid         ),
      .ready_in           ( arready         ),
      .reg_tmout_us_cfg   ( reg_tmout_us_cfg),
      .time_out           ( raddr_time_out  )
    );

endmodule
