// Copyright (C) 2020-2022 University of Zurich
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// Licensed under the Solderpad Hardware License v 2.1 (the “License”); you may not use this file except in compliance
// with the License, or, at your option, the Apache License version 2.0. You may obtain a copy of the License at
// https://solderpad.org/licenses/SHL-2.1/
//
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on
// an “AS IS” BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.
//
//------------------------------------------------------------------------------
//
// "fifo.v" -  FIFO module
// 
// Project: ReckOn - Spiking RECurrent neural network processor enabling ON-chip learning over second-long timescales
//
// Author:  C. Frenkel, Institute of Neuroinformatics, University of Zurich and ETH Zurich
//
// Cite/paper: [C. Frenkel and G. Indiveri, "ReckOn: A 28nm sub-mm² task-agnostic spiking recurrent neural network
//             processor enabling on-chip learning over second-long timescales," IEEE International Solid-State
//             Circuits Conference (ISSCC), 2022]
//
// Comments: -
//
//------------------------------------------------------------------------------

module fifo #(
    parameter width      = 9,
    parameter depth      = 4,
    parameter depth_addr = 2        // Should never be less than 2
)(
    input  wire                  clk,
    input  wire                  rst_n,
    input  wire                  push_req_n,
    input  wire                  pop_req_n,
    input  wire [     width-1:0] data_in,
    output reg                   empty,
    output wire                  full,
    output wire [depth_addr-1:0] free_space,
    output wire [     width-1:0] data_out,
    output wire [     width-1:0] data_out_next);
  

//Wires and internal registers  
reg  [width-1:0] mem [0:depth-1]; 

reg  [depth_addr-1:0] write_ptr;
reg  [depth_addr-1:0] read_ptr;
wire [depth_addr-1:0] next_read_ptr;
reg  [depth_addr-1:0] fill_cnt;

genvar i;


always @(posedge clk, negedge rst_n) begin
    if (!rst_n)
        write_ptr <= {(depth_addr){1'b0}};
    else if (!push_req_n && (!full || !pop_req_n))
        write_ptr <= write_ptr + {{(depth_addr-1){1'b0}},1'b1};
    else
        write_ptr <= write_ptr;
end

always @(posedge clk, negedge rst_n) begin
    if (!rst_n)
        read_ptr <= {(depth_addr){1'b0}};
    else if (!pop_req_n && !empty)
        read_ptr <= next_read_ptr;
    else
        read_ptr <= read_ptr;
end
assign next_read_ptr = read_ptr + {{(depth_addr-1){1'b0}},1'b1};

always @(posedge clk, negedge rst_n) begin
    if (!rst_n)
        fill_cnt <= {(depth_addr){1'b0}};
    else if (!push_req_n && pop_req_n && !empty && !full)
        fill_cnt <= fill_cnt + {{(depth_addr-1){1'b0}},1'b1};
    else if (!push_req_n && !pop_req_n)
        fill_cnt <= fill_cnt;
    else if (!pop_req_n && |fill_cnt)
        fill_cnt <= fill_cnt - {{(depth_addr-1){1'b0}},1'b1};
    else
        fill_cnt <= fill_cnt;
end

always @(posedge clk, negedge rst_n) begin
    if (!rst_n)
        empty <= 1'b1;
    else if (!push_req_n)
        empty <= 1'b0;
    else if (!pop_req_n)
        empty <= ~|fill_cnt; 
    else 
        empty <= empty; 
end

assign free_space = {(depth_addr){1'b1}} - fill_cnt;

assign full       = &fill_cnt;


generate

    for (i=0; i<depth; i=i+1) begin
        
        always @(posedge clk) begin
            if (!push_req_n && (!full || !pop_req_n) && (write_ptr == i))
                mem[i] <= data_in;
            else 
                mem[i] <= mem[i];
        end
        
    end
    
endgenerate

assign data_out      = mem[read_ptr];
assign data_out_next = mem[next_read_ptr];


endmodule 
