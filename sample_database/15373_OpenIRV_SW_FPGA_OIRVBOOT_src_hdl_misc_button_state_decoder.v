// This program was cloned from: https://github.com/OVGN/OpenIRV
// License: Apache License 2.0

/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: button_state_decoder.v
 *  Purpose:  Current module allows to decode different button press
 *            states for easier button event software handling.
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


module button_state_decoder #
(
    parameter CLK_HZ = 0
)
(
    input   wire    clk,
    input   wire    rstn,
    input   wire    btn_in,
    output  wire    btn_out_imm,
    output  wire    btn_out_up,
    output  wire    btn_out_down,
    output  wire    btn_out_shrt,
    output  wire    btn_out_long
);
    
    localparam MS_DELAY = CLK_HZ / 1000;

/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    reg     [1:0]   btn_in_pipe = 2'b00;
    
    reg             btn_shrt = 1'b0;
    reg             btn_long = 1'b0;
    
    wire            btn_imm   =  btn_in_pipe[1];
    wire            btn_up    =  btn_in_pipe[1] & ~btn_in_pipe[0];
    wire            btn_down  = ~btn_in_pipe[1] &  btn_in_pipe[0];
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/

    always @(posedge clk) begin
        if (~rstn) begin
            btn_in_pipe <= 2'b00;
        end else begin
            btn_in_pipe <= {btn_in_pipe[0], ~btn_in};
        end
    end

/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  [31:0]  BTN_DEBOUNCE_VALUE    = MS_DELAY * 20,      // 20ms
                        BTN_SHORT_PRESS_VALUE = MS_DELAY * 50,      // 50ms
                        BTN_LONG_PRESS_VALUE  = MS_DELAY * 300;     // 300ms
    
    localparam          ST_WAIT_PRESS    = 1'b0,
                        ST_CALC_DURATION = 1'b1;
    
    reg                 state = ST_WAIT_PRESS;
    
    reg         [31:0]  btn_tc = {32{1'b0}};
    
    
    always @(posedge clk) begin
        if (~rstn) begin
            btn_shrt <= 1'b0;
            btn_long <= 1'b0;
            state <= ST_WAIT_PRESS;
        end else begin
            case (state)
                
                ST_WAIT_PRESS: begin
                    btn_shrt <= 1'b0;
                    btn_long <= 1'b0;
                    
                    if (btn_down) begin
                        btn_tc <= 32'd0;
                        state <= ST_CALC_DURATION;
                    end
                end
                
                ST_CALC_DURATION: begin
                    if (btn_imm) begin
                        btn_tc <= btn_tc + 1'b1;
                        if (btn_tc > BTN_LONG_PRESS_VALUE) begin
                            btn_shrt <= 1'b0;
                            btn_long <= 1'b1;
                            state <= ST_WAIT_PRESS;
                        end
                    end else begin
                        state <= ST_WAIT_PRESS;
                        if (btn_tc > BTN_SHORT_PRESS_VALUE) begin
                            btn_shrt <= 1'b1;
                            btn_long <= 1'b0;
                        end
                    end
                end
                
            endcase
        end
    end
    
    
    edge_to_pulse #
    (
        .CLK_HZ (CLK_HZ),
        .PULSE_DURATION_MS (5),
        .EDGE_TYPE ("RISING")
    )
    edge_to_pulse_bnt_up
    (
        .clk       ( clk          ),
        .rstn      ( rstn         ),
        .edge_in   ( btn_up       ),
        .pulse_out ( btn_out_up   )
    );
    
    
    edge_to_pulse #
    (
        .CLK_HZ (CLK_HZ),
        .PULSE_DURATION_MS (5),
        .EDGE_TYPE ("RISING")
    )
    edge_to_pulse_bnt_down
    (
        .clk       ( clk          ),
        .rstn      ( rstn         ),
        .edge_in   ( btn_down     ),
        .pulse_out ( btn_out_down )
    );
    
    
    edge_to_pulse #
    (
        .CLK_HZ (CLK_HZ),
        .PULSE_DURATION_MS (5),
        .EDGE_TYPE ("RISING")
    )
    edge_to_pulse_bnt_shrt
    (
        .clk       ( clk          ),
        .rstn      ( rstn         ),
        .edge_in   ( btn_shrt     ),
        .pulse_out ( btn_out_shrt )
    );
    
    
    edge_to_pulse #
    (
        .CLK_HZ (CLK_HZ),
        .PULSE_DURATION_MS (5),
        .EDGE_TYPE ("RISING")
    )
    edge_to_pulse_bnt_long
    (
        .clk       ( clk          ),
        .rstn      ( rstn         ),
        .edge_in   ( btn_long     ),
        .pulse_out ( btn_out_long )
    );
    
    
    assign btn_out_imm = btn_imm;

endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
