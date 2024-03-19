/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenHBMC
 *  Filename: hb_dq_iobuf.v
 *  Purpose:  HyperBus data single buffer.
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


module hb_dq_iobuf #
(
    parameter   integer DRIVE_STRENGTH       = 8,
    parameter           SLEW_RATE            = "SLOW",
    parameter   real    IODELAY_REFCLK_MHZ   = 200.0,
    parameter           IODELAY_GROUP_ID     = "HBMC",
    parameter           USE_IDELAY_PRIMITIVE = 0,
    parameter   [4:0]   IDELAY_TAPS_VALUE    = 0
)
(
    input   wire            arst,
    input   wire            oddr_clk,
    input   wire            iddr_clk,
    input   wire            idelay_clk,
    
    inout   wire            buf_io,
    input   wire            buf_t,
    input   wire    [1:0]   sdr_i,
    output  wire    [1:0]   sdr_o,
    output  wire            sdr_o_vld
);
    
    reg     [1:0]   dq_vld_pipe = 2'b00;
    reg     [1:0]   dq_sdr_reg  = 2'b00;
    wire    [1:0]   dq_sdr;
    wire            buf_o;
    wire            buf_i;
    wire            tristate;
    wire            idelay_o;
    
    
    IOBUF #
    (
        .DRIVE  ( DRIVE_STRENGTH ),     // Specify the output drive strength
        .SLEW   ( SLEW_RATE      )      // Specify the output slew rate
    )
    IOBUF_io_buf
    (
        .O  ( buf_o     ),  // Buffer output
        .IO ( buf_io    ),  // Buffer inout port (connect directly to top-level port)
        .I  ( buf_i     ),  // Buffer input
        .T  ( tristate  )   // 3-state enable input, high = input, low = output
    );
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    ODDR #
    (
        .DDR_CLK_EDGE   ( "OPPOSITE_EDGE" ),    // "OPPOSITE_EDGE" or "SAME_EDGE"
        .INIT           ( 1'b0            ),    // Initial value of Q: 1'b0 or 1'b1
        .SRTYPE         ( "ASYNC"         )     // Set/Reset type: "SYNC" or "ASYNC"
    )
    ODDR_buf_i
    (
        .Q  ( buf_i     ),  // 1-bit DDR output
        .C  ( oddr_clk  ),  // 1-bit clock input
        .CE ( 1'b1      ),  // 1-bit clock enable input
        .D1 ( sdr_i[0]  ),  // 1-bit data input (positive edge)
        .D2 ( sdr_i[1]  ),  // 1-bit data input (negative edge)
        .R  ( 1'b0      ),  // 1-bit reset
        .S  ( 1'b0      )   // 1-bit set
    );
    
    
    ODDR #
    (
        .DDR_CLK_EDGE   ( "OPPOSITE_EDGE" ),    // "OPPOSITE_EDGE" or "SAME_EDGE"
        .INIT           ( 1'b0            ),    // Initial value of Q: 1'b0 or 1'b1
        .SRTYPE         ( "ASYNC"         )     // Set/Reset type: "SYNC" or "ASYNC"
    )
    ODDR_buf_t
    (
        .Q  ( tristate  ),  // 1-bit DDR output
        .C  ( oddr_clk  ),  // 1-bit clock input
        .CE ( 1'b1      ),  // 1-bit clock enable input
        .D1 ( buf_t     ),  // 1-bit data input (positive edge)
        .D2 ( buf_t     ),  // 1-bit data input (negative edge)
        .R  ( 1'b0      ),  // 1-bit reset
        .S  ( 1'b0      )   // 1-bit set
    );
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    generate
        if (USE_IDELAY_PRIMITIVE) begin
            
            (* IODELAY_GROUP = IODELAY_GROUP_ID *)  // Specifies group name for associated IDELAYs/ODELAYs and IDELAYCTRL
            
            IDELAYE2 #
            (
                .CINVCTRL_SEL           ( "FALSE"                                          ),   // Enable dynamic clock inversion (FALSE, TRUE)
                .DELAY_SRC              ( "IDATAIN"                                        ),   // Delay input (IDATAIN, DATAIN)
                .HIGH_PERFORMANCE_MODE  ( "FALSE"                                          ),   // Reduced jitter ("TRUE"), Reduced power ("FALSE")
                .IDELAY_TYPE            ( "FIXED"                                          ),   // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
                .IDELAY_VALUE           ( (IDELAY_TAPS_VALUE > 31)? 31 : IDELAY_TAPS_VALUE ),   // Input delay tap setting (0-31)
                .PIPE_SEL               ( "FALSE"                                          ),   // Select pipelined mode, FALSE, TRUE
                .REFCLK_FREQUENCY       ( IODELAY_REFCLK_MHZ                               ),   // IDELAYCTRL clock input frequency in MHz (190.0-210.0).
                .SIGNAL_PATTERN         ( "DATA"                                           )    // DATA, CLOCK input signal
            )
            IDELAYE2_inst
            (
                .C              ( idelay_clk ),     // 1-bit input: Clock input
                .CINVCTRL       ( 1'b0       ),     // 1-bit input: Dynamic clock inversion input
                .DATAIN         ( 1'b0       ),     // 1-bit input: Internal delay data input
                .IDATAIN        ( buf_o      ),     // 1-bit input: Data input from the I/O
                .DATAOUT        ( idelay_o   ),     // 1-bit output: Delayed data output
                .CNTVALUEIN     ( 5'b00000   ),     // 5-bit input: Counter value input
                .CNTVALUEOUT    ( /*--NC--*/ ),     // 5-bit output: Counter value output
                .CE             ( 1'b0       ),     // 1-bit input: Active high enable increment/decrement input
                .INC            ( 1'b0       ),     // 1-bit input: Increment / Decrement tap delay input
                .LD             ( 1'b0       ),     // 1-bit input: Load IDELAY_VALUE input
                .LDPIPEEN       ( 1'b0       ),     // 1-bit input: Enable PIPELINE register to load data input
                .REGRST         ( 1'b0       )      // 1-bit input: Active-high reset tap-delay input
            );
            
        end else begin
            /* Bypassing IDELAY primitive */
            assign idelay_o = buf_o;
        end
    endgenerate

/*----------------------------------------------------------------------------------------------------------------------------*/
    
    IDDR #
    (
        .DDR_CLK_EDGE   ( "SAME_EDGE_PIPELINED" ),  // "OPPOSITE_EDGE", "SAME_EDGE" or "SAME_EDGE_PIPELINED"
        .INIT_Q1        ( 1'b0                  ),  // Initial value of Q1: 1'b0 or 1'b1
        .INIT_Q2        ( 1'b0                  ),  // Initial value of Q2: 1'b0 or 1'b1
        .SRTYPE         ( "ASYNC"               )   // Set/Reset type: "SYNC" or "ASYNC"
    )
    IDDR_inst
    (
        .Q1 ( dq_sdr[1] ),  // 1-bit output forr positive edge of clock
        .Q2 ( dq_sdr[0] ),  // 1-bit output forr negative edge of clock
        .C  ( iddr_clk  ),  // 1-bit clock input
        .CE ( 1'b1      ),  // 1-bit clock enable input
        .D  ( idelay_o  ),  // 1-bit DDR data input
        .R  ( 1'b0      ),  // 1-bit reset
        .S  ( 1'b0      )   // 1-bit set
    );
    
    
    /* 
     * To improve timings, data coming out of the IDDR is registered by the 
     * falling edge of the clock, as IDDR buffer in the "SAME_EDGE_PIPELINED" 
     * mode outputs data with highest T-setup and T-hold margin relatively 
     * to the falling edge of the IDDR clock.
     * 
     * Special pipelined strobe is used to validate incoming data. Two clock
     * cycle shift register allows to compensate single cycle latency of the 
     * IDDR buffer and the additional register stage.
     */
    always @(negedge iddr_clk or posedge arst) begin
        if (arst) begin
            dq_vld_pipe <= 2'b00;
            dq_sdr_reg  <= 2'b00;
        end else begin
            dq_vld_pipe <= {dq_vld_pipe[0], 1'b1};
            dq_sdr_reg  <= dq_sdr;
        end
    end
    
    
    assign sdr_o = dq_sdr_reg;
    assign sdr_o_vld = dq_vld_pipe[1];
    
endmodule

/*----------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
