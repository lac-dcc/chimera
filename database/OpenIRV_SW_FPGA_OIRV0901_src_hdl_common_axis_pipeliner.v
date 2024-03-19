/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: axis_pipeliner.v
 *  Purpose:  Current module allows to convert any pipelined module into 
 *            a true AXI4-Stream. Data qualifier bits are also integrated. 
 *            The main requirements for proper operation:
 *            
 *            - constant pipeline delay
 *            - clock enable input, that can be toggled any time
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


module axis_pipeliner #
(
    parameter integer PIPE_DATA_IN_WIDTH  = 32,
    parameter integer PIPE_DATA_OUT_WIDTH = 32,
    parameter integer PIPE_QUAL_WIDTH = 4,
    parameter integer PIPE_STAGES = 8
)
(
    input   wire                                axis_aclk,
    input   wire                                axis_aresetn,
    
    input   wire    [PIPE_DATA_IN_WIDTH - 1:0]  s_axis_tdata,
    input   wire    [PIPE_QUAL_WIDTH - 1:0]     s_axis_tuser,
    input   wire                                s_axis_tvalid,
    output  wire                                s_axis_tready,
    input   wire                                s_axis_tlast,
    
    output  wire    [PIPE_DATA_OUT_WIDTH - 1:0] m_axis_tdata,
    output  wire    [PIPE_QUAL_WIDTH - 1:0]     m_axis_tuser,
    output  wire                                m_axis_tvalid,
    input   wire                                m_axis_tready,
    output  wire                                m_axis_tlast,
    
    output  wire                                pipe_cen,
    output  wire    [PIPE_DATA_IN_WIDTH - 1:0]  pipe_in_data,
    input   wire    [PIPE_DATA_OUT_WIDTH - 1:0] pipe_out_data
);
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    reg     [PIPE_STAGES - 1:0]  tvalid_pipe = {PIPE_STAGES{1'b0}};
    reg     [PIPE_STAGES - 1:0]  tlast_pipe  = {PIPE_STAGES{1'b0}};
    
    
    always @(posedge axis_aclk) begin
        if (~axis_aresetn) begin
            tvalid_pipe <= {PIPE_STAGES{1'b0}};
            tlast_pipe  <= {PIPE_STAGES{1'b0}};
        end else begin
            if (pipe_cen) begin
                tvalid_pipe <= (PIPE_STAGES > 1)? {tvalid_pipe[PIPE_STAGES - 2:0], s_axis_tvalid} : s_axis_tvalid;
                tlast_pipe  <= (PIPE_STAGES > 1)? {tlast_pipe[PIPE_STAGES - 2:0],  s_axis_tlast}  : s_axis_tlast;
            end
        end
    end
    
    
    assign s_axis_tready = s_axis_tvalid & (~tvalid_pipe[PIPE_STAGES - 1] | m_axis_tready);
    assign pipe_cen      = s_axis_tready |  ~tvalid_pipe[PIPE_STAGES - 1] | m_axis_tready;
    assign pipe_in_data  = s_axis_tdata;
    
    assign m_axis_tdata  = pipe_out_data;
    assign m_axis_tvalid = tvalid_pipe[PIPE_STAGES - 1];
    assign m_axis_tlast  = tlast_pipe[PIPE_STAGES - 1];
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/

    genvar i;
    generate
        for (i = 0; i < PIPE_QUAL_WIDTH; i = i + 1) begin: loop
            reg [PIPE_STAGES - 1:0] pipe_gen = {PIPE_STAGES{1'b0}};
            
            always @(posedge axis_aclk) begin
                if (pipe_cen) begin
                    pipe_gen <= (PIPE_STAGES > 1)? {pipe_gen[PIPE_STAGES - 2:0], s_axis_tuser[i]} : s_axis_tuser[i];
                end
            end
            
            assign m_axis_tuser[i] = pipe_gen[PIPE_STAGES - 1];
        end
    endgenerate
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
