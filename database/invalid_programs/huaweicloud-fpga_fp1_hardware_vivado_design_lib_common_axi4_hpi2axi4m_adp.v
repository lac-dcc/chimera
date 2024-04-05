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

`include "hpi2axi4_define.h"

module hpi2axi4m_adp
  #(
    parameter   A_WTH           = 24  ,
    parameter   DATA_WIDTH      = 32  ,
    parameter   DATA_BYTE_NUM   = (DATA_WIDTH/8) ,
    parameter   AXI4_ID         = 12'h18   
    )
   (

  input  wire                     aclk                           ,
  input  wire                     areset                         , 

  // axi4  signals
  output      [3:0]               awid                           ,  
  output reg  [63:0]              awaddr                         ,
  output      [6:0]               awlen                          ,
  output      [6:0]               awsize                         ,
  output reg                      awvalid                        ,
  input                           awready                        ,
                                                                  
  //Write data                                                   
  output      [3:0]               wid                            ,
  output  reg [511:0]             wdata                          ,
  output      [63:0]              wstrb                          ,
  output                          wlast                          ,
  output reg                      wvalid                         ,
  input                           wready                         ,
                                                                 
  //Write response 	                                          
  input       [3:0]               bid                            ,
  input       [1:0]               bresp                          ,
  input                           bvalid                         ,
  output  reg                     bready                         ,
     
  output      [3:0]               arid                           ,  
  output  reg [63:0]              araddr                         ,
  output      [6:0]               arlen                          ,
  output      [6:0]               arsize                         ,
  output reg                      arvalid                        ,
  input                           arready                        ,
  input       [3:0]               rid                            ,
  input       [511:0]             rdata                          ,
  input       [1:0]               rresp                          ,
  input                           rlast                          ,
  input                           rvalid                         ,
  output reg                      rready                         ,

  //MPI interface signal for module
  input  wire                     cpu_wr                         ,
  input  wire [A_WTH-1:0]         cpu_addr                       ,
  input  wire [DATA_BYTE_NUM-1:0] cpu_wr_strb                    ,
  input  wire [DATA_WIDTH-1:0]    cpu_data_in                    ,
  input  wire                     cpu_rd                         ,
  input  wire [A_WTH-1:0]         cpu_rd_addr                    ,
  output reg  [DATA_WIDTH-1:0]    cpu_data_out                   
   );

/******************************************************************************\
                            signal 
\******************************************************************************/
wire                        aw_hs             ;
wire                        ar_hs             ;
wire    [31:0]              cpu_data_out0     ;
wire    [31:0]              cpu_data_out1     ;
wire    [31:0]              cpu_data_out2     ;
wire    [31:0]              cpu_data_out3     ;
wire    [31:0]              cpu_data_out4     ;
wire    [31:0]              cpu_data_out80    ;
wire    [31:0]              cpu_data_out81    ;
wire    [31:0]              cpu_data_out100   ;
wire    [1:0]               reg_ddr_cmd       ;
wire    [31:0]              reg_ddr_addr      ;
wire    [31:0]              reg_ddr_wdata     ;
wire    [31:0]              reg_ddr_rdata     ;
wire                        ddr_wr            ;
wire    [31:0]              ddr_addr          ;
wire    [31:0]              ddr_wdata         ;
reg     [31:0]              ddr_rdata         ;
wire                        reg_ddr_cmd_clr   ;
reg                         ddr_wr_1dly       ;
wire                        ddr_rd            ;
reg                         ddr_rd_1dly       ;
wire                        ddr_rd_psg        ;
wire                        ddr_wr_psg        ;
reg                         ddr_wr_psg_1dly   ;
reg     [9:0]               reg_ddr_status    ;
reg     [4:0]               reg_axi_tmout_err ;
wire    [15:0]              reg_tmout_us_cfg  ;
wire                        waddr_time_out    ;
wire                        wdata_time_out    ;
wire                        raddr_time_out    ;
wire                        rdata_time_out    ;
wire                        rsp_time_out      ;
/******************************************************************************\
                            process
\******************************************************************************/
cmd_reg32_inst
     #(
    .ADDR_WIDTH(A_WTH),
     .VLD_WIDTH(2)                                     
      )
     inst_reg_ddr_cmd                                  
     (
     .clks              ( aclk               ),        
     .reset             ( areset             ),        
     .cpu_data_in       ( cpu_data_in        ),        
     .cpu_data_out      ( cpu_data_out0      ),        
     .cpu_addr          ( cpu_addr           ),        
     .cpu_wr            ( cpu_wr             ),        
     .its_addr          ( {AXI4_ID,12'h000}  ),        
     .cmd_clr           ( reg_ddr_cmd_clr    ),        
     .dout              ( reg_ddr_cmd        )         
     );


rw_reg_inst
    #(
    .ADDR_WIDTH(A_WTH),
    .VLD_WIDTH(32),                                    
    .INIT_DATA(32'd0)                                  
    )
     inst_reg_ddr_addr                                 
    (
    .clks               ( aclk               ),     
    .reset              ( areset             ),     
    .cpu_data_in        ( cpu_data_in        ),        
    .cpu_data_out       ( cpu_data_out1      ),        
    .cpu_addr           ( cpu_addr           ),        
    .cpu_wr             ( cpu_wr             ),       
    .its_addr           ( {AXI4_ID,12'h001}  ),        
    .dout               ( reg_ddr_addr       )          
    );

rw_reg_inst
    #(
    .ADDR_WIDTH(A_WTH),
    .VLD_WIDTH(32),                                    
    .INIT_DATA(32'd0)                                  
    )
     inst_reg_ddr_wdata                             
    (
    .clks               ( aclk               ),         
    .reset              ( areset             ),         
    .cpu_data_in        ( cpu_data_in        ),     
    .cpu_data_out       ( cpu_data_out2      ),     
    .cpu_addr           ( cpu_addr           ),     
    .cpu_wr             ( cpu_wr             ),          
    .its_addr           ( {AXI4_ID,12'h002}  ),     
    .dout               ( reg_ddr_wdata      )         
    );


ro_reg_inst
    #(
    .ADDR_WIDTH(A_WTH),
    .VLD_WIDTH(32)                                  
     )
     inst_reg_ddr_rdata                             
    (
    .cpu_data_out       ( cpu_data_out3      ),     
    .cpu_addr           ( cpu_addr           ),     
    .its_addr           ( {AXI4_ID,12'h003}  ),     
    .din                ( reg_ddr_rdata   )         
    );


rw_reg_inst
    #(
    .ADDR_WIDTH(A_WTH),
    .VLD_WIDTH(16),                                 
    .INIT_DATA(16'hffff)                            
    )
     inst_reg_axi_tmout_cfg                         
    (
    .clks               ( aclk               ),     
    .reset              ( areset             ),     
    .cpu_data_in        ( cpu_data_in        ),     
    .cpu_data_out       ( cpu_data_out4      ),     
    .cpu_addr           ( cpu_addr           ),     
    .cpu_wr             ( cpu_wr             ),     
    .its_addr           ( {AXI4_ID,12'h004}  ),     
    .dout               ( reg_tmout_us_cfg   )      
    );

//------------------------AXI write operation-------
  err_wc_reg_inst
     #(
    .ADDR_WIDTH(A_WTH),
    .VLD_WIDTH(5)                                   
     ) inst_reg_axi_time_err
    (
    .clk             (  aclk                 )  ,
    .reset           (  areset               )  ,
    .cpu_data_out    (  cpu_data_out80       )  ,
    .cpu_data_in     (  cpu_data_in          )  ,
    .cpu_addr        (  cpu_addr             )  ,
    .cpu_wr          (  cpu_wr               )  ,
    .its_addr        (  {AXI4_ID,12'h080}    )  ,
    .err_flag_in     (  reg_axi_tmout_err    )
    );

   
 err_wc_reg_inst
     #(
    .ADDR_WIDTH(A_WTH),
    .VLD_WIDTH(10)                                  
     ) inst_reg_ddr_err
    (
    .clk             (  aclk                 )  ,
    .reset           (  areset               )  ,
    .cpu_data_out    (  cpu_data_out81       )  ,
    .cpu_data_in     (  cpu_data_in          )  ,
    .cpu_addr        (  cpu_addr             )  ,
    .cpu_wr          (  cpu_wr               )  ,
    .its_addr        (  {AXI4_ID,12'h081}    )  ,
    .err_flag_in     (  reg_ddr_status       )
    );

ro_reg_inst
    #(
    .ADDR_WIDTH(A_WTH),
    .VLD_WIDTH(10)                                  
     )
     inst_reg_ddr_status                            
    (
    .cpu_data_out       ( cpu_data_out100    ),     
    .cpu_addr           ( cpu_addr           ),     
    .its_addr           ( {AXI4_ID,12'h100}  ),     
    .din                ( reg_ddr_status     )      
    );


always @( posedge aclk or posedge areset )
begin
    if ( areset == 1'b1 ) begin
        reg_ddr_status <= 10'b0;
    end
    else begin
        reg_ddr_status <= {rvalid,arvalid,bvalid,bready,wvalid,awvalid,awready,wready,arready,rready};
    end
end    
assign ddr_wr = (reg_ddr_cmd == 2'd3); 
assign ddr_addr = reg_ddr_addr ;   
assign ddr_wdata = reg_ddr_wdata ;
assign reg_ddr_rdata = ddr_rdata;

assign reg_ddr_cmd_clr = (bvalid & bready) | (rready & rvalid);

//assign ddr_idle = awready & wready & arready & rready;
assign awid     = 4'd0  ;
assign awlen    = 7'd0  ;
assign awsize   = 7'h3f ;

assign wid = 4'd0 ;
assign wlast = 1'b1 ;


always @( posedge aclk or posedge areset )
begin
    if ( areset == 1'b1 ) begin
        ddr_wr_1dly <= 1'b0;
        ddr_wr_psg_1dly <= 1'b0;
    end
    else begin
        ddr_wr_1dly <= ddr_wr;
        ddr_wr_psg_1dly <= ddr_wr_psg;
    end
end

assign ddr_wr_psg = ddr_wr  & (~ddr_wr_1dly );

always @( posedge aclk or posedge areset )
begin
    if ( areset == 1'b1 ) begin
        awvalid <= 1'b0;
    end
    else if ( ddr_wr_psg == 1'b1 ) begin
        awvalid <= 1'd1;
    end
    else if ( awready == 1'b1 ) begin
        awvalid <= 1'b0;
    end
    else ;
end

always @( posedge aclk or posedge areset)
begin
    if ( areset == 1'b1 ) begin
        awaddr <= 64'd0;
    end
    else begin
        awaddr <= {26'd0,ddr_addr[31:0],6'd0};
    end
end

always @( posedge aclk or posedge areset )
begin
    if ( areset == 1'b1 ) begin
        wvalid <= 1'b0;
    end
    else if ( ddr_wr_psg_1dly == 1'b1 ) begin
        wvalid <= 1'b1;
    end
    else if ( wready == 1'b1 ) begin
        wvalid <= 1'b0;
    end
    else;
end

always @( posedge aclk )
begin
    wdata <= {{(512-DATA_WIDTH){1'd0}},ddr_wdata};
end


assign   wstrb = 64'hffffffffffffffff;


assign aw_hs = awvalid & awready;

always @( posedge aclk or posedge areset )
begin
    if ( areset == 1'b1 ) begin
        bready <= 1'b1;
    end
    else if ( aw_hs == 1'b1 ) begin
        bready <= 1'b1;
    end
    else if ( (bvalid == 1'b1) && (bresp == `AXI4_RESP_OKAY) ) begin
        bready <= 1'b0;
    end
    else;
end

assign arid = 4'd0 ;
assign arlen = 7'd0 ;
assign arsize = 7'h3f ;

//------------------------AXI read operation-------------------

assign ddr_rd = reg_ddr_cmd == 2'd2;

always @( posedge aclk or posedge areset )
begin
    if ( areset == 1'b1 ) begin
        ddr_rd_1dly <= 1'b0;
    end
    else begin
        ddr_rd_1dly <=  ddr_rd;
    end
end

assign ddr_rd_psg = ddr_rd  & (~ddr_rd_1dly );

always @( posedge aclk or posedge areset )
begin
    if ( areset == 1'b1 ) begin
        arvalid <= 1'b0;
    end
    else if ( ddr_rd_psg == 1'b1 ) begin
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
        araddr <= 64'd0;
    end
    else begin
        araddr <= {26'd0,ddr_addr[31:0],6'd0};
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
    else if ( (rvalid == 1'b1) && (rresp == `AXI4_RESP_OKAY) ) begin
        rready <= 1'b0;
    end
    else;
end

always @( posedge aclk )
begin
    if ( (rvalid == 1'b1) & (rready == 1'b1)) begin
        ddr_rdata <= rdata[DATA_WIDTH-1:0];
    end
    else;
end

always @ (posedge aclk or posedge areset)
begin
    if (areset == 1'b1)
        cpu_data_out <=  32'd0;
    else
    begin
        casez(cpu_addr[11:0])
            12'h0   : cpu_data_out <= cpu_data_out0;
            12'h1   : cpu_data_out <= cpu_data_out1;
            12'h2   : cpu_data_out <= cpu_data_out2;
            12'h3   : cpu_data_out <= cpu_data_out3;
            12'h4   : cpu_data_out <= cpu_data_out4;

            12'h80  : cpu_data_out <= cpu_data_out80;
            12'h81  : cpu_data_out <= cpu_data_out81;
            12'h100 : cpu_data_out <= cpu_data_out100;
            default : cpu_data_out <= 32'd0;
        endcase
    end
end

always @( posedge aclk or posedge areset)
begin
    if ( areset == 1'b1 ) begin
        reg_axi_tmout_err <= 5'd0;
    end
    else begin
        reg_axi_tmout_err <= {rsp_time_out,rdata_time_out,raddr_time_out,wdata_time_out,waddr_time_out};
    end
end
axi_time_out u_waddr_tmout
(
      .clks               ( aclk            ),
      .reset              ( areset          ),
      
      .vld_in             ( awvalid         ),
      .ready_in           ( awready         ),
      .reg_tmout_us_cfg   ( reg_tmout_us_cfg),
      .time_out           ( waddr_time_out  )
);

axi_time_out u_wdata_tmout
(
      .clks               ( aclk            ),
      .reset              ( areset          ),
      
      .vld_in             ( wvalid          ),
      .ready_in           ( wready          ),
      .reg_tmout_us_cfg   ( reg_tmout_us_cfg),
      .time_out           ( wdata_time_out  )
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

axi_time_out u_rdata_tmout
(
      .clks               ( aclk            ),
      .reset              ( areset          ),
      
      .vld_in             ( rvalid          ),
      .ready_in           ( rready          ),
      .reg_tmout_us_cfg   ( reg_tmout_us_cfg),
      .time_out           ( rdata_time_out  )
);

axi_time_out u_rsp_tmout
(
      .clks               ( aclk            ),
      .reset              ( areset          ),
      
      .vld_in             ( bvalid          ),
      .ready_in           ( bready          ),
      .reg_tmout_us_cfg   ( reg_tmout_us_cfg),
      .time_out           ( rsp_time_out    )
);

endmodule
