/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenHBMC
 *  Filename: rfifo.v
 *  Purpose:  FIFO that stores data read from the memory part.
 * ----------------------------------------------------------------------------
 *  Copyright © 2020, Vaagn Oganesyan <ovgn@protonmail.com>
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


module rfifo #
(
    parameter integer DATA_BUS_WIDTH = 32
)
(
    input   wire                            fifo_arst,

    input   wire                            fifo_wr_clk,
    input   wire    [15:0]                  fifo_wr_din,
    input   wire                            fifo_wr_last,
    input   wire                            fifo_wr_ena,
    output  wire                            fifo_wr_full,
    
    input   wire                            fifo_rd_clk,
    output  wire    [DATA_BUS_WIDTH-1:0]    fifo_rd_dout,
    output  wire                            fifo_rd_last,
    input   wire                            fifo_rd_en,
    output  wire                            fifo_rd_empty
);

    wire    [17:0]  din = {1'b0, fifo_wr_last, fifo_wr_din};
    
    
    generate
        case (DATA_BUS_WIDTH)
            
            16: begin
                wire    [17:0]  dout;
                assign  fifo_rd_dout = dout[15:0];
                assign  fifo_rd_last = dout[16];
            
                fifo_18b_18b_512w fifo_18b_18b_512w_inst
                (
                    .rst    ( fifo_arst     ),  // input rst
                
                    .wr_clk ( fifo_wr_clk   ),  // input wr_clk
                    .wr_en  ( fifo_wr_ena   ),  // input wr_en
                    .full   ( fifo_wr_full  ),  // output full
                    .din    ( din           ),  // input [17 : 0] din
                    
                    .rd_clk ( fifo_rd_clk   ),  // input rd_clk
                    .rd_en  ( fifo_rd_en    ),  // input rd_en
                    .empty  ( fifo_rd_empty ),  // output empty
                    .dout   ( dout          )   // output [17 : 0] dout
                );
            end

            /*--------------------------------------------------------------------*/
            
            32: begin
                wire    [35:0]  dout;
                assign  fifo_rd_dout = {dout[15:0], dout[33:18]};
                assign  fifo_rd_last = dout[16];
            
                fifo_18b_36b_512w fifo_18b_36b_512w_inst
                (
                    .rst    ( fifo_arst     ),  // input rst
                
                    .wr_clk ( fifo_wr_clk   ),  // input wr_clk
                    .wr_en  ( fifo_wr_ena   ),  // input wr_en
                    .full   ( fifo_wr_full  ),  // output full
                    .din    ( din           ),  // input [17 : 0] din
                    
                    .rd_clk ( fifo_rd_clk   ),  // input rd_clk
                    .rd_en  ( fifo_rd_en    ),  // input rd_en
                    .empty  ( fifo_rd_empty ),  // output empty
                    .dout   ( dout          )   // output [35 : 0] dout
                );
            end

            /*--------------------------------------------------------------------*/
            
            64: begin
                wire    [71:0]  dout;
                assign  fifo_rd_dout = {dout[15:0], dout[33:18], dout[51:36], dout[69:54]};
                assign  fifo_rd_last = dout[16];
                
                fifo_18b_72b_512w fifo_18b_72b_512w_inst
                (
                    .rst    ( fifo_arst     ),  // input rst
                
                    .wr_clk ( fifo_wr_clk   ),  // input wr_clk
                    .wr_en  ( fifo_wr_ena   ),  // input wr_en
                    .full   ( fifo_wr_full  ),  // output full
                    .din    ( din           ),  // input [17 : 0] din
                    
                    .rd_clk ( fifo_rd_clk   ),  // input rd_clk
                    .rd_en  ( fifo_rd_en    ),  // input rd_en
                    .empty  ( fifo_rd_empty ),  // output empty
                    .dout   ( dout          )   // output [71 : 0] dout
                );
            end
            
            default: begin
                INVALID_PARAMETER invalid_parameter_msg();
            end
        endcase
    endgenerate

endmodule

/*-------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
