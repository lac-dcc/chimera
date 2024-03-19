/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: lcd_backlight_ctrl.v
 *  Purpose:  Constant current LED driver controller with dimming via
 *            a proprietary 1-wire serial EZDim interface.
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


module lcd_backlight_ctrl #
(
    parameter integer CLK_HZ = 0
)
(
    input   wire            clk,
    input   wire            srst,
    input   wire    [4:0]   level,
    output  reg             pulse_out = 1'b0
);
    
    localparam US_DELAY = CLK_HZ / 1000000;
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    reg     [4:0]   pulse_cnt = 5'd0;
    reg     [4:0]   level_prev = 5'd0;
    reg     [15:0]  timer = 16'd0;
    reg             timer_hit = 1'b0;
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    /* 10us period timer */
    always @(posedge clk) begin
        if (srst) begin
            timer <= 16'd0;
            timer_hit <= 1'b0;
        end else begin
            if (timer == US_DELAY * 10) begin
                timer <= 16'd0;
                timer_hit <= 1'b1;
            end else begin
                timer <= timer + 1'b1;
                timer_hit <= 1'b0;
            end
        end
    end
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    localparam      ST_RESET   = 2'd0,
                    ST_IDLE    = 2'd1,
                    ST_PULSE_0 = 2'd2,
                    ST_PULSE_1 = 2'd3;
    
    reg     [1:0]   state = ST_RESET;
    
    
    always @(posedge clk) begin
        if (srst) begin
            pulse_out  <= 1'b0;
            level_prev <= 5'd0;
            state      <= ST_RESET;
        end else begin
            
            /* FSM state changes with 10us delay */
            if (timer_hit) begin
                case (state)
                    ST_RESET: begin
                        if (level != 5'd0) begin
                            pulse_out  <= 1'b1;
                            level_prev <= level;
                            pulse_cnt  <= 5'd31 - level;
                            state      <= ST_PULSE_0;
                        end
                    end
                
                    ST_IDLE: begin
                        if (level_prev != level) begin
                            level_prev <= level;
                            pulse_cnt  <= (level_prev > level)? (level_prev - level) : (level_prev - level + 5'd31 + 1'b1);
                            state      <= ST_PULSE_0;
                        end
                    end
                    
                    ST_PULSE_0: begin
                        if (pulse_cnt == 5'd0) begin
                            pulse_out <= 1'b1;
                            state <= ST_IDLE;
                        end else begin
                            pulse_out <= 1'b0;
                            pulse_cnt <= pulse_cnt - 1'b1;
                            state     <= ST_PULSE_1;
                        end
                    end
                    
                    ST_PULSE_1: begin
                        pulse_out <= 1'b1;
                        state <= ST_PULSE_0;
                    end
                endcase
            end
        end
    end

endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
