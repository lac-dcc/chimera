/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: debouncer.v
 *  Purpose:  Current module allows to eliminate the contact bounce effect.
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


module debouncer #
(
    parameter CLK_HZ = 0,
    parameter DEBOUNCE_MS = 20,
    parameter IDLE_STATE = 1'b1
)
(
    input   wire    clk,
    input   wire    rstn,
    input   wire    noisy_in,
    output  reg     filtered_out = IDLE_STATE
);
    
    localparam DELAY_MS = CLK_HZ / 1000;
    
    wire            out_sync;
    reg             out_sync_1 = IDLE_STATE;
    reg     [31:0]  delay_tc   = 32'd0;

/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    xpm_cdc_single #
    (
        .DEST_SYNC_FF   (3),    // DECIMAL; range: 2-10
        .INIT_SYNC_FF   (0),    // DECIMAL; 0=disable simulation init values, 1=enable simulation init values
        .SIM_ASSERT_CHK (0),    // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
        .SRC_INPUT_REG  (0)     // DECIMAL; 0=do not register input, 1=register input
    )
    xpm_cdc_single_inst
    (
        .src_clk    ( 1'b0      ),  // 1-bit input: optional; required when SRC_INPUT_REG = 1
        .dest_clk   ( clk       ),  // 1-bit input: Clock signal for the destination clock domain.
        
        .src_in     ( noisy_in  ),  // 1-bit input: Input signal to be synchronized to dest_clk domain.
        .dest_out   ( out_sync  )   // 1-bit output: src_in synchronized to the destination clock domain. This output is registered.
    );
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    always @(posedge clk) begin
        if (~rstn) begin
            filtered_out <= IDLE_STATE;
            out_sync_1 <= IDLE_STATE;
        end else begin
            out_sync_1 <= out_sync;
            
            if (out_sync ^ out_sync_1) begin
                delay_tc <= 32'd0;
            end else begin
                if (delay_tc == DEBOUNCE_MS * DELAY_MS) begin
                    filtered_out <= out_sync_1;
                end else begin
                    delay_tc <= delay_tc + 1'b1;
                end
            end
        end
    end


endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
