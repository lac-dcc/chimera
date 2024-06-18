// This program was cloned from: https://github.com/OVGN/OpenIRV
// License: Apache License 2.0

/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: power_switch_fsm.v
 *  Purpose:  Power switch FSM controls main system power path via
 *            external single D-type flip-flop.
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


module power_switch_fsm #
(
    parameter integer CLK_HZ = 0
)
(
    input   wire    clk,
    input   wire    btn_pressed,
    input   wire    pwr_off_req,
    output  reg     fd_clk = 1'b0,
    output  reg     fd_dat = 1'b0
);

/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    /* Checking input parameters */
    
    generate
        if ((CLK_HZ < 1000) || (CLK_HZ > 150000000)) begin
            //INVALID_PARAMETER invalid_parameter_msg();
            initial begin
                $error("Invalid parameter!");
            end
        end
    endgenerate

/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  [31:0]  BUTTON_PRESS_DELAY = CLK_HZ,    // 1 sec delay for on/off
                        FD_SETUP_HOLD_DELAY = 100;      
    
    
    reg     [31:0]  delay_tc = {32{1'b0}};
    
    
    localparam  [2:0]   ST_RESET    = 3'd0,
                        ST_DELAY    = 3'd1,
                        ST_PWR_ON_0 = 3'd2,
                        ST_PWR_ON_1 = 3'd3,
                        ST_PWR_ON_2 = 3'd4,
                        ST_IDLE     = 3'd5,
                        ST_PWR_OFF  = 3'd6;
    
    reg         [2:0]   state = ST_RESET;
    reg         [2:0]   next_state = ST_RESET;
    
    
    always @(posedge clk) begin
        case (state)
            ST_RESET: begin
                fd_clk     <= 1'b0;
                fd_dat     <= 1'b0;
                delay_tc   <= BUTTON_PRESS_DELAY;
                state      <= ST_DELAY;
                next_state <= ST_PWR_ON_0;
            end
            
            ST_DELAY: begin
                if (delay_tc == 32'd0) begin
                    state <= next_state;
                end else begin
                    delay_tc <= delay_tc - 1'b1;
                end
            end
            
            ST_PWR_ON_0: begin
                fd_dat     <= 1'b1;
                delay_tc   <= FD_SETUP_HOLD_DELAY;
                state      <= ST_DELAY;
                next_state <= ST_PWR_ON_1;
            end
            
            ST_PWR_ON_1: begin
                fd_clk   <= 1'b1;
                delay_tc <= FD_SETUP_HOLD_DELAY;
                
                state <= ST_DELAY;
                next_state <= ST_PWR_ON_2;
            end
            
            ST_PWR_ON_2: begin
                fd_clk <= 1'b0;

                /* Wait power button release */
                if (~btn_pressed) begin
                    state <= ST_IDLE;
                end
            end
            
            ST_IDLE: begin
                /* Immediately power off */
                if (pwr_off_req) begin
                    fd_dat <= 1'b0;
                    state  <= ST_PWR_OFF;
                end
                
                /* Emergency manual power off with 5 sec button press delay */
                if (btn_pressed) begin
                    delay_tc <= delay_tc + 1'b1;
                    if (delay_tc > BUTTON_PRESS_DELAY * 5) begin 
                        fd_dat <= 1'b0;
                        state  <= ST_PWR_OFF;
                    end
                end else begin
                    delay_tc <= 32'd0;
                end
            end
            
            ST_PWR_OFF: begin
                fd_clk     <= ~fd_clk;
                delay_tc   <= FD_SETUP_HOLD_DELAY;
                state      <= ST_DELAY;
                next_state <= ST_PWR_OFF;
            end
            
            default: begin
                fd_dat <= 1'b0;
                state <= ST_PWR_OFF;
            end
            
        endcase
    end
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
