/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenHBMC
 *  Filename: sync_cdc_bus.v
 *  Purpose:  Bus synchronizer with full handshake.
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


module sync_cdc_bus #
(
    parameter integer C_SYNC_STAGES = 3,
    parameter integer C_SYNC_WIDTH  = 8
)
(
    input   wire                            src_clk,
    input   wire    [C_SYNC_WIDTH - 1 : 0]  src_in,
    input   wire                            src_req,
    output  wire                            src_ack,

    input   wire                            dst_clk,
    output  wire    [C_SYNC_WIDTH - 1 : 0]  dst_out,
    output  wire                            dst_req,
    input   wire                            dst_ack
);

    xpm_cdc_handshake #
    (
        .DEST_EXT_HSK   ( 1             ),  // DECIMAL; 0 = internal handshake, 1 = external handshake
        .DEST_SYNC_FF   ( C_SYNC_STAGES ),  // DECIMAL; range: 2-10
        .INIT_SYNC_FF   ( 0             ),  // DECIMAL; 0 = disable simulation init values, 1 = enable simulation init values
        .SIM_ASSERT_CHK ( 0             ),  // DECIMAL; 0 = disable simulation messages, 1 = enable simulation messages
        .SRC_SYNC_FF    ( C_SYNC_STAGES ),  // DECIMAL; range: 2-10
        .WIDTH          ( C_SYNC_WIDTH  )   // DECIMAL; range: 1-1024
    )
    xpm_cdc_handshake_inst
    (
        .src_clk    ( src_clk   ),  // 1-bit input: Source clock.
        .dest_clk   ( dst_clk   ),  // 1-bit input: Destination clock.
        
        .src_in     ( src_in    ),  // WIDTH-bit input: Input bus that will be synchronized to the destination clock domain.
        .dest_out   ( dst_out   ),  // WIDTH-bit output: Input bus (src_in) synchronized to destination clock domain. This output is registered.
        
        .src_send   ( src_req   ),  // 1-bit input: Assertion of this signal allows the src_in bus to be synchronized to
                                    // the destination clock domain. This signal should only be asserted when src_rcv is
                                    // deasserted, indicating that the previous data transfer is complete. This signal
                                    // should only be deasserted once src_rcv is asserted, acknowledging that the src_in
                                    // has been received by the destination logic.
        
       .dest_req    ( dst_req   ),  // 1-bit output: Assertion of this signal indicates that new dest_out data has been
                                    // received and is ready to be used or captured by the destination logic. When
                                    // DEST_EXT_HSK = 1, this signal will deassert once the source handshake
                                    // acknowledges that the destination clock domain has received the transferred data.
                                    // When DEST_EXT_HSK = 0, this signal asserts for one clock period when dest_out bus
                                    // is valid. This output is registered.
        
       .src_rcv     ( src_ack   ),  // 1-bit output: Acknowledgement from destination logic that src_in has been
                                    // received. This signal will be deasserted once destination handshake has fully
                                    // completed, thus completing a full data transfer. This output is registered.
        
       .dest_ack    ( dst_ack   )   // 1-bit input: optional; required when DEST_EXT_HSK = 1
    );
    
endmodule

/*----------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
