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

module axi_master_rd #(
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
                       input                          clk               ,
                       input                          rst_n             , 
                       input     [031:0]              i_snap_context    ,
                                                        
                       //---- AXI bus ----               
                         // AXI read address channel       
                       output reg [ID_WIDTH - 1:0]     m_axi_arid        ,  
                       output wire[ADDR_WIDTH - 1:0]   m_axi_araddr      ,  
                       output wire[007:0]              m_axi_arlen       ,  
                       output wire[002:0]              m_axi_arsize      ,  
                       output wire[001:0]              m_axi_arburst     ,  
                       output wire[ARUSER_WIDTH - 1:0] m_axi_aruser      , 
                       output wire[003:0]              m_axi_arcache     , 
                       output wire[001:0]              m_axi_arlock      ,  
                       output wire[002:0]              m_axi_arprot      , 
                       output wire[003:0]              m_axi_arqos       , 
                       output wire[003:0]              m_axi_arregion    , 
                       output wire                     m_axi_arvalid     , 
                       input                           m_axi_arready     ,
                         // AXI read data channel          
                       output wire                    m_axi_rready      , 
                       input     [ID_WIDTH - 1:0]     m_axi_rid         ,
                       input     [DATA_WIDTH - 1:0]   m_axi_rdata       ,
                       input     [001:0]              m_axi_rresp       ,
                       input                          m_axi_rlast       ,
                       input                          m_axi_rvalid      ,

                       //---- local control ----
                       input                          engine_start_pulse,
                       input                          wrap_mode         ,
                       input     [003:0]              wrap_len          ,
                       input     [063:0]              source_address    ,
                       input     [031:0]              rd_init_data      ,
                       input     [031:0]              rd_pattern        ,
                       input     [031:0]              rd_number         ,

                       //---- local status report ----          
                       output wire                     rd_done_pulse     ,
                       output wire[001:0]              rd_error          ,
                       output wire[063:0]              rd_error_info         
                       );
                  

 wire [002:0] rd_size;
 wire [007:0] rd_len;
 wire [004:0] rd_id_num;
 wire [008:0] rd_len_plus_1;
 reg  [039:0] total_rd_beat_count;
 wire         burst_sent;
 wire         rd_engine_start;
 wire         addr_send_done;
  
 assign rd_engine_start = engine_start_pulse && (rd_number != 0);

//---- signals for AXI advanced features ----
 assign m_axi_arsize   = rd_pattern[2:0]; // 2^6=512
 assign m_axi_arburst  = 2'd1; // INCR mode for memory access
 assign m_axi_arcache  = 4'd3; // Normal Non-cacheable Bufferable
 assign m_axi_aruser   = i_snap_context[ARUSER_WIDTH - 1:0]; 
 assign m_axi_arprot   = 3'd0;
 assign m_axi_arqos    = 4'd0;
 assign m_axi_arregion = 4'd0; //?
 assign m_axi_arlock   = 2'b00; // normal access  
 assign burst_sent     = m_axi_arvalid && m_axi_arready;

 always@(posedge clk or negedge rst_n)
 begin
     if(~rst_n)
         m_axi_arid <= 0;
     else if(burst_sent && (m_axi_arid == rd_id_num))
         m_axi_arid <= 0;
     else if(burst_sent)
         m_axi_arid <= m_axi_arid + 1;
 end

 assign rd_size   = rd_pattern[2:0];
 assign rd_len    = rd_pattern[15:8];
 assign rd_id_num = rd_pattern[20:16];

 assign rd_len_plus_1 = {1'b0, rd_len} + 1'b1;
 always@(posedge clk or negedge rst_n)
 begin
     if(~rst_n)
         total_rd_beat_count <= 0;
     else if(rd_engine_start)
         total_rd_beat_count <= {8'b0, rd_number} * ({31'b0, rd_len_plus_1});
 end

/***********************************************************************
*                        read burst send channel                       *
***********************************************************************/

addr_send_channel mrd_addr_send (
           .clk                 (clk                ),
           .rst_n               (rst_n              ),
           .engine_start        (rd_engine_start    ),
           .wrap_mode           (wrap_mode          ),
           .wrap_len            (wrap_len           ),
           .source_address      (source_address     ),
           .size                (rd_size            ),
           .len                 (rd_len             ),
           .number              (rd_number          ),
           .total_beat_count    (total_rd_beat_count),
           .data_error          (1'b0               ),
           .addr_send_done      (addr_send_done     ),
           .axi_addr            (m_axi_araddr       ),
           .axi_len             (m_axi_arlen        ),
           .axi_valid           (m_axi_arvalid      ),
           .axi_ready           (m_axi_arready      )
    );

rd_result_check_channel mrd_check (
           .clk                 (clk                ),
           .rst_n               (rst_n              ),
           .m_axi_rid           (m_axi_rid          ),
           .m_axi_rdata         (m_axi_rdata        ),
           .m_axi_rlast         (m_axi_rlast        ),
           .m_axi_rvalid        (m_axi_rvalid       ),
           .m_axi_rready        (m_axi_rready       ),
           .m_axi_rresp         (m_axi_rresp        ),
           .total_rd_beat_count (total_rd_beat_count),
           .rd_engine_start     (rd_engine_start    ),
           .wrap_mode           (wrap_mode          ),
           .wrap_len            (wrap_len           ),
           .rd_id_num           (rd_id_num          ),
           .rd_len              (rd_len             ),
           .rd_size             (rd_size            ),
           .rd_init_data        (rd_init_data       ),
           .rd_done             (rd_done_pulse      ),
           .rd_error            (rd_error           ),
           .rd_error_info       (rd_error_info      )
    );

endmodule
