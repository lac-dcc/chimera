// This program was cloned from: https://github.com/MongooseOrion/FPGA-Image-Recognition
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Meyesemi
// Engineer: Nill
// 
// Create Date: 08/01/23 10:43:27
// Design Name: 
// Module Name: wr_rd_ctrl_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`define UD #1
module wr_rd_ctrl_top # (
    parameter                    CTRL_ADDR_WIDTH      = 28,
    parameter                    MEM_DQ_WIDTH         = 16
) (
    input                        clk         ,
    input                        rstn        ,
    
    input                        wr_cmd_en   ,
    input  [CTRL_ADDR_WIDTH-1:0] wr_cmd_addr ,
    input  [31: 0]               wr_cmd_len  ,
    output                       wr_cmd_ready,
    output                       wr_cmd_done,
    
    output                       wr_bac,
    input  [MEM_DQ_WIDTH*8-1:0]  wr_ctrl_data,
    output                       wr_data_re  ,
    
    input                        rd_cmd_en   ,
    input  [CTRL_ADDR_WIDTH-1:0] rd_cmd_addr ,
    input  [31: 0]               rd_cmd_len  ,
    output                       rd_cmd_ready, 
    output                       rd_cmd_done,
    
    input                        read_ready  /* synthesis PAP_MARK_DEBUG="true" */,    
    output [MEM_DQ_WIDTH*8-1:0]  read_rdata  /* synthesis PAP_MARK_DEBUG="true" */,    
    output                       read_en     /* synthesis PAP_MARK_DEBUG="true" */,    
                                      
    // write channel                            
    output [CTRL_ADDR_WIDTH-1:0] axi_awaddr  ,  
    output [3:0]                 axi_awid    ,
    output [3:0]                 axi_awlen   ,
    output [2:0]                 axi_awsize  ,
    output [1:0]                 axi_awburst , //only support 2'b01: INCR
    input                        axi_awready ,
    output                       axi_awvalid ,
                                             
    output [MEM_DQ_WIDTH*8-1:0]  axi_wdata   ,
    output [MEM_DQ_WIDTH -1 :0]  axi_wstrb   ,
    input                        axi_wlast   ,
    output                       axi_wvalid  ,
    input                        axi_wready  ,
    input  [3 : 0]               axi_bid     , // Master Interface Write Response.
    input  [1 : 0]               axi_bresp   , // Write response. This signal indicates the status of the write transaction.
    input                        axi_bvalid  , // Write response valid. This signal indicates that the channel is signaling a valid write response.
    output                       axi_bready  ,
                                             
    // read channel                           
    output [CTRL_ADDR_WIDTH-1:0] axi_araddr  ,    
    output [3:0]                 axi_arid    ,
    output [3:0]                 axi_arlen   ,
    output [2:0]                 axi_arsize  ,
    output [1:0]                 axi_arburst ,
    output                       axi_arvalid , 
    input                        axi_arready , //only support 2'b01: INCR
                                             
    output                       axi_rready  ,
    input  [MEM_DQ_WIDTH*8-1:0]  axi_rdata   ,
    input                        axi_rvalid  ,
    input                        axi_rlast   ,
    input  [3:0]                 axi_rid     ,
    input  [1:0]                 axi_rresp   
);

    wire                        wr_en      /* synthesis PAP_MARK_DEBUG="true" */;            
    wire [CTRL_ADDR_WIDTH-1:0]  wr_addr    /* synthesis PAP_MARK_DEBUG="true" */;            
    wire [3:0]                  wr_id      /* synthesis PAP_MARK_DEBUG="true" */;            
    wire [3:0]                  wr_len     /* synthesis PAP_MARK_DEBUG="true" */;            
    wire                        wr_done    /* synthesis PAP_MARK_DEBUG="true" */;            
    wire                        wr_ready   /* synthesis PAP_MARK_DEBUG="true" */;            
    wire                        wr_data_en /* synthesis PAP_MARK_DEBUG="true" */;            
    wire [MEM_DQ_WIDTH*8-1:0]   wr_data    /* synthesis PAP_MARK_DEBUG="true" */;            
          
    wire                        rd_en      /* synthesis PAP_MARK_DEBUG="true" */;
    wire [CTRL_ADDR_WIDTH-1:0]  rd_addr    /* synthesis PAP_MARK_DEBUG="true" */;           
    wire [3:0]                  rd_id      /* synthesis PAP_MARK_DEBUG="true" */;           
    wire [3:0]                  rd_len     /* synthesis PAP_MARK_DEBUG="true" */;            
    wire                        rd_done_p  /* synthesis PAP_MARK_DEBUG="true" */;   

    wr_cmd_trans#(
        .CTRL_ADDR_WIDTH  (  CTRL_ADDR_WIDTH  ),//parameter                    CTRL_ADDR_WIDTH      = 28,
        .MEM_DQ_WIDTH     (  MEM_DQ_WIDTH     ) //parameter                    MEM_DQ_WIDTH         = 16
    ) wr_cmd_trans (                      
        .clk              (  clk              ),//input                        clk            ,
        .rstn             (  rstn             ),//input                        rstn           ,
                    
        .wr_cmd_en        (  wr_cmd_en        ),//input                            wr_cmd_en,
        .wr_cmd_addr      (  wr_cmd_addr      ),//input  [CTRL_ADDR_WIDTH-1:0]     wr_cmd_addr,
        .wr_cmd_len       (  wr_cmd_len       ),//input  [31£º0]                   wr_cmd_len,
        .wr_cmd_ready     (  wr_cmd_ready     ),//output reg                       wr_cmd_ready,
        .wr_cmd_done      (  wr_cmd_done      ),//output reg                       wr_cmd_done,
        .wr_bac           (  wr_bac           ),//input                            wr_bac,                                
        .wr_ctrl_data     (  wr_ctrl_data     ),//input  [MEM_DQ_WIDTH*8-1:0]      wr_ctrl_data,
        .wr_data_re       (  wr_data_re       ),//output reg                       wr_data_re,
                                
        .wr_en            (  wr_en            ),//output reg                       wr_en,        
        .wr_addr          (  wr_addr          ),//output reg [CTRL_ADDR_WIDTH-1:0] wr_addr,      
        .wr_id            (  wr_id            ),//output reg [ 3: 0]               wr_id,        
        .wr_len           (  wr_len           ),//output reg [ 3: 0]               wr_len,       
        .wr_data_en       (  wr_data_en       ),//output                           wr_data_en,
        .wr_data          (  wr_data          ),//output [MEM_DQ_WIDTH*8-1:0]      wr_data,
        .wr_ready         (  wr_ready         ),//input                            wr_ready,
        .wr_done          (  wr_done          ),//input                            wr_done,
                                              
        .rd_cmd_en        (  rd_cmd_en        ),//input                            rd_cmd_en,
        .rd_cmd_addr      (  rd_cmd_addr      ),//input  [CTRL_ADDR_WIDTH-1:0]     rd_cmd_addr,
        .rd_cmd_len       (  rd_cmd_len       ),//input  [31£º0]                   rd_cmd_len,
        .rd_cmd_ready     (  rd_cmd_ready     ),//output reg                       rd_cmd_ready,
        .rd_cmd_done      (  rd_cmd_done      ),//output reg                       rd_cmd_done,
        .read_en          (  read_en          ),//input                            read_en,
                                              
        .rd_en            (  rd_en            ),//output reg                       rd_en        ,                 
        .rd_addr          (  rd_addr          ),//output reg [CTRL_ADDR_WIDTH-1:0] rd_addr      ,           
        .rd_id            (  rd_id            ),//output reg [3:0]                 rd_id        ,           
        .rd_len           (  rd_len           ),//output reg [3:0]                 rd_len       ,           
        .rd_done_p        (  rd_done_p        ) //input                            rd_done_p     
    );

    wr_ctrl #(
        .CTRL_ADDR_WIDTH  (  CTRL_ADDR_WIDTH  ),//parameter                            CTRL_ADDR_WIDTH      = 28,
        .MEM_DQ_WIDTH     (  MEM_DQ_WIDTH     ) //parameter                            MEM_DQ_WIDTH         = 16
    )wr_ctrl(                        
        .clk              (  clk              ),//input                                clk              ,
        .rst_n            (  rstn             ),//input                                rst_n            , 
                                              
        .wr_en            (  wr_en            ),//input                                wr_en            ,
        .wr_addr          (  wr_addr          ),//input [CTRL_ADDR_WIDTH-1:0]          wr_addr          ,     
        .wr_id            (  wr_id            ),//input [3:0]                          wr_id            ,
        .wr_len           (  wr_len           ),//input [3:0]                          wr_len           ,
        .wr_cmd_done      (  wr_done          ),//output reg                           wr_cmd_done      ,
        .wr_ready         (  wr_ready         ),//output                               wr_ready         ,
        .wr_data_en       (  wr_data_en       ),//input                                wr_data_en       ,
        .wr_data          (  wr_data          ),//input      [MEM_DQ_WIDTH*8-1:0]      wr_data          ,
        .wr_bac           (  wr_bac           ),//output                               wr_bac           ,
                                              
        .axi_awaddr       (  axi_awaddr       ),//output reg [CTRL_ADDR_WIDTH-1:0]     axi_awaddr       ,  
        .axi_awid         (  axi_awid         ),//output reg [3:0]                     axi_awid         ,
        .axi_awlen        (  axi_awlen        ),//output reg [3:0]                     axi_awlen        ,
        .axi_awsize       (  axi_awsize       ),//output     [2:0]                     axi_awsize       ,
        .axi_awburst      (  axi_awburst      ),//output     [1:0]                     axi_awburst      , //only support 2'b01: INCR
        .axi_awready      (  axi_awready      ),//input                                axi_awready      ,
        .axi_awvalid      (  axi_awvalid      ),//output reg                           axi_awvalid      ,
                                              
        .axi_wdata        (  axi_wdata        ),//output     [MEM_DQ_WIDTH*8-1:0]      axi_wdata        ,
        .axi_wstrb        (  axi_wstrb        ),//output     [MEM_DQ_WIDTH -1 :0]      axi_wstrb        ,
        .axi_wlast        (  axi_wlast        ),//output                               axi_wlast        ,
        .axi_wvalid       (  axi_wvalid       ),//output                               axi_wvalid       ,
        .axi_wready       (  axi_wready       ),//input                                axi_wready       ,
        .axi_bid          (  axi_bid          ),//input      [3 : 0]                   axi_bid          , // Master Interface Write Response.
        .axi_bresp        (  axi_bresp        ),//input      [1 : 0]                   axi_bresp        , // Write response. This signal indicates the status of the write transaction.
        .axi_bvalid       (  axi_bvalid       ),//input                                axi_bvalid       , // Write response valid. This signal indicates that the channel is signaling a valid write response.
        .axi_bready       (  axi_bready       ),//output reg                           axi_bready       , // Response ready. This signal indicates that the master can accept a write response.
        .test_wr_state    (                   ) //output reg [2:0]                     test_wr_state
    );

    rd_ctrl #(
        .CTRL_ADDR_WIDTH  (  CTRL_ADDR_WIDTH  ),//parameter                            CTRL_ADDR_WIDTH      = 28,
        .MEM_DQ_WIDTH     (  MEM_DQ_WIDTH     ) //parameter                            MEM_DQ_WIDTH         = 16 
    )rd_ctrl(                               
        .clk              (  clk              ),//input                                clk             ,
        .rst_n            (  rstn             ),//input                                rst_n           ,   
                                                                                  
        .read_addr        (  rd_addr          ),//input [CTRL_ADDR_WIDTH-1:0]          read_addr       ,
        .read_id          (  rd_id            ),//input [3:0]                          read_id         ,
        .read_len         (  rd_len           ),//input [3:0]                          read_len        ,
        .read_en          (  rd_en            ),//input                                read_en         ,
        .read_done_p      (  rd_done_p        ),//output reg                           read_done_p     ,
                                                                                 
        .read_ready       (  read_ready       ),//input                                read_ready      ,
        .read_rdata       (  read_rdata       ),//output   [MEM_DQ_WIDTH*8-1:0]        read_rdata      ,
        .read_rdata_en    (  read_en          ),//output                               read_en         ,
                                                                                   
        .axi_araddr       (  axi_araddr       ),//output reg [CTRL_ADDR_WIDTH-1:0]     axi_araddr      ,    
        .axi_arid         (  axi_arid         ),//output reg [3:0]                     axi_arid        ,
        .axi_arlen        (  axi_arlen        ),//output reg [3:0]                     axi_arlen       ,
        .axi_arsize       (  axi_arsize       ),//output     [2:0]                     axi_arsize      ,
        .axi_arburst      (  axi_arburst      ),//output     [1:0]                     axi_arburst     ,
        .axi_arvalid      (  axi_arvalid      ),//output reg                           axi_arvalid     , 
        .axi_arready      (  axi_arready      ),//input                                axi_arready     ,      //only support 2'b01: INCR
                                                                                 
        .axi_rready       (  axi_rready       ),//output                               axi_rready      ,
        .axi_rdata        (  axi_rdata        ),//input   [MEM_DQ_WIDTH*8-1:0]         axi_rdata       ,
        .axi_rvalid       (  axi_rvalid       ),//input                                axi_rvalid      ,
        .axi_rlast        (  axi_rlast        ),//input                                axi_rlast       ,
        .axi_rid          (  axi_rid          ),//input   [3:0]                        axi_rid         ,
        .axi_rresp        (  axi_rresp        ) //input   [1:0]                        axi_rresp       
    );

endmodule
