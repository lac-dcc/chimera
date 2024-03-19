/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenHBMC
 *  Filename: hbmc_bus_sync.v
 *  Purpose:  Bus synchronizer with fast handshake logic.
 * ----------------------------------------------------------------------------
 *  Copyright © 2020-2022, Vaagn Oganesyan <ovgn@protonmail.com>
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
 *  limitations under the License.
 * ----------------------------------------------------------------------------
 */


`default_nettype none
`timescale 1ps / 1ps


(* KEEP_HIERARCHY = "TRUE" *)
module hbmc_bus_sync #
(
    parameter integer C_SYNC_STAGES = 3,
    parameter integer C_DATA_WIDTH  = 8
)
(
    input   wire                            src_clk,
    input   wire                            src_rst,
    input   wire    [C_DATA_WIDTH - 1 : 0]  src_data,
    input   wire                            src_req,
    output  wire                            src_ack,

    input   wire                            dst_clk,
    input   wire                            dst_rst,
    output  reg     [C_DATA_WIDTH - 1 : 0]  dst_data,
    output  reg                             dst_req,
    input   wire                            dst_ack
);

/*----------------------------------------------------------------------------------------------------------------------------*/
    
    wire    src_req_sync;
    
    
    hbmc_bit_sync #
    (
        .C_SYNC_STAGES  ( C_SYNC_STAGES ),
        .C_RESET_STATE  ( 1'b0          )
    )
    hbmc_bit_sync_inst_0
    (
        .arst   ( dst_rst      ),
        .clk    ( dst_clk      ),
        .d      ( src_req      ),
        .q      ( src_req_sync )
    );

/*----------------------------------------------------------------------------------------------------------------------------*/

    reg     src_ack_async;
    
    
    hbmc_bit_sync #
    (
        .C_SYNC_STAGES  ( C_SYNC_STAGES ),
        .C_RESET_STATE  ( 1'b0          )
    )
    hbmc_bit_sync_inst_1
    (
        .arst   ( src_rst       ),
        .clk    ( src_clk       ),
        .d      ( src_ack_async ),
        .q      ( src_ack       )
    );

/*----------------------------------------------------------------------------------------------------------------------------*/

    localparam  ST_GET = 1'b0,
                ST_SET = 1'b1;

    reg         state;


    always @(posedge dst_clk or posedge dst_rst) begin
        if (dst_rst) begin
            src_ack_async <= 1'b0;
            dst_req       <= 1'b0;
            dst_data      <= {C_DATA_WIDTH{1'b0}};
            state         <= ST_GET;
        end else begin
            case (state)
                ST_GET: begin
                    if (src_req_sync & ~dst_ack) begin
                        src_ack_async <= 1'b1;
                        dst_req       <= 1'b1;
                        dst_data      <= src_data;
                        state         <= ST_SET;
                    end
                end
                
                ST_SET: begin
                    if (dst_ack) begin
                        dst_req <= 1'b0;
                    end
                    
                    if (~src_req_sync) begin
                        src_ack_async <= 1'b0;
                    end
                    
                    if (~dst_req & ~src_ack_async) begin
                        state <= ST_GET;
                    end
                end
            endcase
        end
    end
    
endmodule

/*----------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
