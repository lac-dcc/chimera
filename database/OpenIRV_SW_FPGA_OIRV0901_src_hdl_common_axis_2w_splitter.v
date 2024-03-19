/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: axis_2w_splitter.v
 *  Purpose:  AXI4-Stream 1 to 2 data splitter module. New data is pushed out
 *            at the master ports only when both slaves accept previous data.
 * ----------------------------------------------------------------------------
 *  Copyright © 2020-2021, Vaagn Oganesyan <ovgn@protonmail.com>
 *  
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *  
 *      http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 * ----------------------------------------------------------------------------
 */


`default_nettype none
`timescale 1ps / 1ps


module axis_2w_splitter #
(
    parameter   AXIS_TDATA_WIDTH = 32,
    parameter   AXIS_TUSER_WIDTH = 4
)
(
    input   wire                                axis_aclk,
    input   wire                                axis_aresetn,
    
    input   wire    [AXIS_TDATA_WIDTH - 1:0]    s_axis_tdata,
    input   wire    [AXIS_TUSER_WIDTH - 1:0]    s_axis_tuser,
    input   wire                                s_axis_tvalid,
    output  reg                                 s_axis_tready   = 1'b0,
    input   wire                                s_axis_tlast,
    
    output  wire    [AXIS_TDATA_WIDTH - 1:0]    m_axis_0_tdata,
    output  wire    [AXIS_TUSER_WIDTH - 1:0]    m_axis_0_tuser,
    output  reg                                 m_axis_0_tvalid  = 1'b0,
    input   wire                                m_axis_0_tready,
    output  wire                                m_axis_0_tlast,
    
    output  wire    [AXIS_TDATA_WIDTH - 1:0]    m_axis_1_tdata,
    output  wire    [AXIS_TUSER_WIDTH - 1:0]    m_axis_1_tuser,
    output  reg                                 m_axis_1_tvalid  = 1'b0,
    input   wire                                m_axis_1_tready,
    output  wire                                m_axis_1_tlast
);
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    reg     [AXIS_TDATA_WIDTH - 1:0]    m_axis_tdata = {AXIS_TDATA_WIDTH{1'b0}};
    reg     [AXIS_TUSER_WIDTH - 1:0]    m_axis_tuser = {AXIS_TUSER_WIDTH{1'b0}};
    reg                                 m_axis_tlast = 1'b0;
    
    
    assign  m_axis_0_tdata = m_axis_tdata;
    assign  m_axis_0_tuser = m_axis_tuser;
    assign  m_axis_0_tlast = m_axis_tlast;
    
    assign  m_axis_1_tdata = m_axis_tdata;
    assign  m_axis_1_tuser = m_axis_tuser;
    assign  m_axis_1_tlast = m_axis_tlast;
    
    
    localparam  [1:0]   ST_RST  = 2'd0,
                        ST_GET  = 2'd1,
                        ST_SEND = 2'd2;
                        
    reg         [1:0]   state = ST_RST;
    
    
    always @(posedge axis_aclk) begin
        if (~axis_aresetn) begin
            s_axis_tready   <= 1'b0;
            m_axis_0_tvalid <= 1'b0;
            m_axis_1_tvalid <= 1'b0;
            state <= ST_RST;
        end else begin
            case (state)
                ST_RST: begin
                    s_axis_tready   <= 1'b1;
                    m_axis_0_tvalid <= 1'b0;
                    m_axis_1_tvalid <= 1'b0;
                    state <= ST_GET;
                end
                
                ST_GET: begin
                    if (s_axis_tvalid) begin
                        m_axis_tdata    <= s_axis_tdata;
                        m_axis_tuser    <= s_axis_tuser;
                        m_axis_tlast    <= s_axis_tlast;
                        s_axis_tready   <= 1'b0;
                        m_axis_0_tvalid <= 1'b1;
                        m_axis_1_tvalid <= 1'b1;
                        state <= ST_SEND;
                    end
                end
                
                ST_SEND: begin
                    /* TREADY may rise and fall any time, so 
                     * we should prevent TVALID re-assertion */
                    if (m_axis_0_tready & m_axis_0_tvalid) begin
                        m_axis_0_tvalid <= 1'b0;
                    end
                    
                    /* TREADY may rise and fall any time, so 
                     * we should prevent TVALID re-assertion */
                    if (m_axis_1_tready & m_axis_1_tvalid) begin
                        m_axis_1_tvalid <= 1'b0;
                    end
                    
                    if (~m_axis_0_tvalid & ~m_axis_1_tvalid) begin
                        s_axis_tready <= 1'b1;
                        state <= ST_GET;
                    end
                end
                
                default: begin
                    state <= ST_RST;
                end
            endcase
        end
    end
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
