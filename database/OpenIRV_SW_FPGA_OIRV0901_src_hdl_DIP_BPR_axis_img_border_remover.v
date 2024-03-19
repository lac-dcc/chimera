/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: axis_img_border_remover.v
 *  Purpose:  This module is used along with axis_img_border_gen.v to
 *            to remove the image boarder from the stream.
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


module axis_img_border_remover #
(
    parameter   BYPASS_BIT_MASK = 16'h4000
)
(
    input   wire            axis_aclk,
    input   wire            axis_aresetn,
    
    input   wire    [15:0]  s_axis_tdata,
    input   wire            s_axis_tvalid,
    output  reg             s_axis_tready   = 1'b0,
    input   wire            s_axis_tlast,
    input   wire            s_axis_tuser,
    
    output  reg     [15:0]  m_axis_tdata    = {16{1'b0}},
    output  reg             m_axis_tvalid   = 1'b0,
    input   wire            m_axis_tready,
    output  reg             m_axis_tlast    = 1'b0,
    output  reg             m_axis_tuser    = 1'b0
);
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  [1:0]   ST_RST  = 2'd0,
                        ST_GET  = 2'd1,
                        ST_SEND = 2'd2;
                        
    reg         [1:0]   state = ST_RST;
    
    
    always @(posedge axis_aclk) begin
        if (~axis_aresetn) begin
            s_axis_tready <= 1'b0;
            m_axis_tvalid <= 1'b0;
            state <= ST_RST;
        end else begin
            case (state)
                ST_RST: begin
                    s_axis_tready <= 1'b1;
                    m_axis_tvalid <= 1'b0;
                    state <= ST_GET;
                end
            
                ST_GET: begin
                    if (s_axis_tvalid && (s_axis_tdata & BYPASS_BIT_MASK)) begin
                        s_axis_tready <= 1'b0;
                        m_axis_tvalid <= 1'b1;
                        m_axis_tdata  <= s_axis_tdata & (~BYPASS_BIT_MASK);
                        m_axis_tlast  <= s_axis_tlast;
                        m_axis_tuser  <= s_axis_tuser;
                        state <= ST_SEND;
                    end
                end
                
                ST_SEND: begin
                    if (m_axis_tready) begin
                        m_axis_tvalid <= 1'b0;
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
