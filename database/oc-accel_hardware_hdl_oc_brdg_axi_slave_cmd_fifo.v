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

`include "snap_global_vars.v"

// Description: This is a common fifo structure for AW* and AR* commands
// When the fifo is nearly full, the almost_full signal will be used to
// de-assert s_axi_a*ready.
//
// It needs to be FWFT (first word fall through) FIFO
// so the read data will be always present on dout when it is not empty.

module brdg_axi_slave_cmd_fifo (
          clk,
         rst_n,

         axi_id,
         axi_addr,
         axi_len,
         axi_size,
         axi_burst,
         axi_user,
         cf_id,
         cf_addr,
         cf_len,
         cf_size,
         cf_burst,
         cf_user,

         cf_wr_en,
         cf_almost_full,
         cf_full,
         cf_empty,
         cf_rd_en
);

input                     clk;
input                     rst_n;

input      [`IDW-1:0]      axi_id;
input      [63:0]         axi_addr;
input      [7:0]          axi_len;
input      [2:0]          axi_size;
input      [1:0]          axi_burst;
input      [`CTXW-1:0]     axi_user;

output     [`IDW-1:0]      cf_id;
output     [63:0]         cf_addr;
output     [7:0]          cf_len;
output     [2:0]          cf_size;
output     [1:0]          cf_burst;
output     [`CTXW-1:0]     cf_user;

input                     cf_wr_en; //There is a valid cmd

output                    cf_almost_full;
output                    cf_full;
output                    cf_empty;
input                     cf_rd_en;




wire [`IDW + 64 + 8 + 3 + 2 + `CTXW - 1:0] din;
wire [`IDW + 64 + 8 + 3 + 2 + `CTXW - 1:0] dout;

assign din = {axi_id, axi_len, axi_size, axi_burst, axi_user, axi_addr};
assign {cf_id, cf_len, cf_size, cf_burst, cf_user,  cf_addr} = dout; 

//`IDW=5, `CTXW=9
//5 + 64 + 8 + 3 + 2 + 9 = 91


        //axicf_sync_fifo_16_91i91o axicfifo(
        fifo_sync          # (.DATA_WIDTH (91),
                              .ADDR_WIDTH (4), 
                              .FWFT (1)
                              ) axicfifo 
                                     (
                                     .clk        (clk                      ),
                                     .rst_n      (rst_n                    ),
                                     .din        (din                      ),
                                     .wr_en      (cf_wr_en                 ),
                                     .rd_en      (cf_rd_en                 ),
                                     .dout       (dout                     ),
                                     .valid      (                         ),
                                     .full       (cf_full                  ),
                                     .almost_full(cf_almost_full           ),
                                     .almost_empty (                       ),
                                     .count      (                         ),
                                     .empty      (cf_empty                 )
                                     );


endmodule 
