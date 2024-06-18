// This program was cloned from: https://github.com/OpenCAPI/oc-accel
// License: Apache License 2.0

/*
 * Copyright 2019 International Business Machines
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
`timescale 1ns/1ps

module axi_master_wr #(
                       parameter ID_WIDTH      = 2,
                       parameter ADDR_WIDTH    = 64,
                       parameter DATA_WIDTH    = 512,
                       parameter AWUSER_WIDTH  = 8,
                       parameter ARUSER_WIDTH  = 8,
                       parameter WUSER_WIDTH   = 1,
                       parameter RUSER_WIDTH   = 1,
                       parameter BUSER_WIDTH   = 1
                       )
                      (
                       input                              clk               ,
                       input                              rst_n             , 
                       input     [031:0]                  i_snap_context    ,
                                                            
                       //---- AXI bus ----                   
                         // AXI write address channel           
                       output reg  [ID_WIDTH - 1:0]       m_axi_awid        ,  
                       output wire  [ADDR_WIDTH - 1:0]    m_axi_awaddr      ,  
                       output wire [007:0]                m_axi_awlen       ,  
                       output wire [002:0]                m_axi_awsize      ,  
                       output wire [001:0]                m_axi_awburst     ,  
                       output wire [ARUSER_WIDTH - 1:0]   m_axi_awuser      , 
                       output wire [003:0]                m_axi_awcache     , 
                       output wire [001:0]                m_axi_awlock      ,  
                       output wire [002:0]                m_axi_awprot      , 
                       output wire [003:0]                m_axi_awqos       , 
                       output wire [003:0]                m_axi_awregion    , 
                       output wire                        m_axi_awvalid     , 
                       input                              m_axi_awready     ,
                         // AXI write data channel
                       output wire [DATA_WIDTH - 1:0]     m_axi_wdata       ,  
                       output wire [(DATA_WIDTH/8) - 1:0] m_axi_wstrb       ,  
                       output wire                        m_axi_wlast       ,  
                       output wire                        m_axi_wvalid      ,  
                       input                              m_axi_wready      ,
                         // AXI write data channel            
                       output wire                        m_axi_bready      , 
                       input       [ID_WIDTH - 1:0]       m_axi_bid         ,
                       input       [001:0]                m_axi_bresp       ,
                       input                              m_axi_bvalid      ,
                                 
                       //---- local control ----
                       input                              engine_start_pulse,
                       input                              wrap_mode         ,
                       input       [003:0]                wrap_len          ,
                       input       [063:0]                target_address    ,
                       input       [031:0]                wr_init_data      ,
                       input       [031:0]                wr_pattern        ,
                       input       [031:0]                wr_number         ,
                                 
                       //---- local status report ----            
                       output wire                        wr_done_pulse     ,
                       output reg                         wr_error      
                       );
                  

 wire [002:0] wr_size;
 wire [007:0] wr_len;
 wire [004:0] wr_id_num;
 wire [008:0] wr_len_plus_1;
 reg  [039:0] total_wr_beat_count;
 reg  [031:0] wr_burst_cnt;
 wire         burst_sent;
 wire         wr_engine_start;
 wire         resp_get;
 wire         addr_send_done;
 reg          wr_wait_done;

 assign wr_engine_start = engine_start_pulse && (wr_number != 0);
  
//---- signals for AXI advanced features ----
 assign m_axi_awsize   = wr_pattern[2:0]; // 2^6=512
 assign m_axi_awburst  = 2'd1; // INCR mode for memory access
 assign m_axi_awcache  = 4'd3; // Normal Non-cacheable Bufferable
 assign m_axi_awuser   = i_snap_context[ARUSER_WIDTH - 1:0]; 
 assign m_axi_awprot   = 3'd0;
 assign m_axi_awqos    = 4'd0;
 assign m_axi_awregion = 4'd0; //?
 assign m_axi_awlock   = 2'b00; // normal access  
 assign m_axi_bready   = 1'b1;
 assign burst_sent     = m_axi_awvalid && m_axi_awready;

 always@(posedge clk or negedge rst_n)
 begin
     if(~rst_n)
         m_axi_awid <= 0;
     else if(burst_sent && (m_axi_awid == wr_id_num))
         m_axi_awid <= 0;
     else if(burst_sent)
         m_axi_awid <= m_axi_awid + 1;
 end

 assign wr_size   = wr_pattern[2:0];
 assign wr_len    = wr_pattern[15:8];
 assign wr_id_num = wr_pattern[20:16];

 assign wr_len_plus_1 = {1'b0, wr_len} + 1'b1;
 always@(posedge clk or negedge rst_n)
 begin
     if(~rst_n)
         total_wr_beat_count <= 0;
     else if(wr_engine_start)
         total_wr_beat_count <= {8'b0, wr_number} * ({31'b0, wr_len_plus_1});
 end

/***********************************************************************
*                        write addr send channel                       *
***********************************************************************/

addr_send_channel mwr_addr_send (
           .clk                 (clk                ),
           .rst_n               (rst_n              ),
           .wrap_mode           (wrap_mode          ),
           .wrap_len            (wrap_len           ),
           .engine_start        (wr_engine_start    ),
           .source_address      (target_address     ),
           .size                (wr_size            ),
           .len                 (wr_len             ),
           .number              (wr_number          ),
           .total_beat_count    (total_wr_beat_count),
           .data_error          (1'b0               ),
           .addr_send_done      (addr_send_done     ),
           .axi_addr            (m_axi_awaddr       ),
           .axi_len             (m_axi_awlen        ),
           .axi_valid           (m_axi_awvalid      ),
           .axi_ready           (m_axi_awready      )
    );

/***********************************************************************
*                        write data send channel                       *
***********************************************************************/
wr_data_send_channel mwr_data_send (
           .clk                 (clk                ),
           .rst_n               (rst_n              ),
           .m_axi_wdata         (m_axi_wdata        ),
           .m_axi_wlast         (m_axi_wlast        ),
           .m_axi_wvalid        (m_axi_wvalid       ),
           .m_axi_wstrb         (m_axi_wstrb        ),
           .m_axi_wready        (m_axi_wready       ),
           .total_wr_beat_count (total_wr_beat_count),
           .wr_engine_start     (wr_engine_start    ),
           .wrap_mode           (wrap_mode          ),
           .wrap_len            (wrap_len           ),
           .wr_size             (wr_size            ),
           .wr_len              (wr_len             ),
           .wr_init_data        (wr_init_data       )
    );

/***********************************************************************
*                        write response channel                        *
***********************************************************************/
    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            wr_wait_done <= 1'b0;
        else if(addr_send_done)
            wr_wait_done <= 1'b1;
        else if(wr_done_pulse)
            wr_wait_done <= 1'b0;
    end

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            wr_burst_cnt <= 0;
        else if(burst_sent && !resp_get)
            wr_burst_cnt <= wr_burst_cnt + 1'b1;
        else if(!burst_sent && resp_get)
            wr_burst_cnt <= wr_burst_cnt - 1'b1;
    end

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            wr_error <= 1'b0;
        else if(resp_get)
            wr_error <= (m_axi_bresp != 0);
        else if(wr_error)
            wr_error <= 1'b0;
    end

    assign resp_get = m_axi_bvalid && m_axi_bready;
    assign wr_done_pulse = wr_wait_done && (wr_burst_cnt == 0);

endmodule
