/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenHBMC
 *  Filename: hbmc_iobuf.v
 *  Purpose:  HyperBus I/O logic.
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


module hbmc_iobuf #
(
    parameter   integer DRIVE_STRENGTH          = 8,
    parameter           SLEW_RATE               = "SLOW",
    parameter   integer USE_IDELAY_PRIMITIVE    = 0,
    parameter   real    IODELAY_REFCLK_MHZ      = 200.0,
    parameter           IODELAY_GROUP_ID        = "HBMC",
    parameter   [4:0]   IDELAY_TAPS_VALUE       = 0
)
(
    input   wire            arst,
    input   wire            oddr_clk,
    input   wire            iserdes_clk,
    input   wire            iserdes_clkdiv,
    input   wire            idelay_clk,
    
    inout   wire            buf_io,
    input   wire            buf_t,
    input   wire    [1:0]   sdr_i,
    output  reg     [5:0]   iserdes_o,
    output  wire            iserdes_comb_o
);
    
    wire            buf_o;
    wire            buf_i;
    wire            tristate;
    wire            idelay_o;
    wire            iserdes_d;
    wire    [5:0]   iserdes_q;
    wire            iserdes_ddly;
    
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
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
            
            assign iserdes_d    = 1'b0;
            assign iserdes_ddly = idelay_o;
            
        end else begin
            /* Bypassing IDELAY primitive */
            assign iserdes_d    = buf_o;
            assign iserdes_ddly = 1'b0;
        end
    endgenerate

/*----------------------------------------------------------------------------------------------------------------------------*/
    
    localparam IOBDELAY = (USE_IDELAY_PRIMITIVE)? "BOTH" : "NONE";
    
    
    ISERDESE2 #
    (
        .SERDES_MODE        ( "MASTER"      ),  // MASTER, SLAVE
        .INTERFACE_TYPE     ( "NETWORKING"  ),  // MEMORY, MEMORY_DDR3, MEMORY_QDR, NETWORKING, OVERSAMPLE
        .DATA_RATE          ( "DDR"         ),  // DDR, SDR
        .DATA_WIDTH         ( 6             ),  // Parallel data width (2-8,10,14)
        
        .DYN_CLKDIV_INV_EN  ( "FALSE"       ),  // Enable DYNCLKDIVINVSEL inversion (FALSE, TRUE)
        .DYN_CLK_INV_EN     ( "FALSE"       ),  // Enable DYNCLKINVSEL inversion (FALSE, TRUE)
        .OFB_USED           ( "FALSE"       ),  // Select OFB path (FALSE, TRUE)
        .IOBDELAY           ( IOBDELAY      ),  // NONE, BOTH, IBUF, IFD
        .NUM_CE             ( 1             ),  // Number of clock enables (1,2)
        
        .INIT_Q1            ( 1'b0          ),  // INIT_Q1 - INIT_Q4: Initial value on the Q outputs (0/1)
        .INIT_Q2            ( 1'b0          ),
        .INIT_Q3            ( 1'b0          ),
        .INIT_Q4            ( 1'b0          ),
        
        .SRVAL_Q1           ( 1'b0          ),  // SRVAL_Q1 - SRVAL_Q4: Q output values when SR is used (0/1)
        .SRVAL_Q2           ( 1'b0          ),
        .SRVAL_Q3           ( 1'b0          ),
        .SRVAL_Q4           ( 1'b0          )
    )
    ISERDESE2_inst
    (
        .O              ( iserdes_comb_o    ),  // 1-bit output: Combinatorial output
        
        .Q1             ( iserdes_q[5]      ),  // Q1 - Q8: 1-bit (each) output: Registered data outputs
        .Q2             ( iserdes_q[4]      ),
        .Q3             ( iserdes_q[3]      ),
        .Q4             ( iserdes_q[2]      ),
        .Q5             ( iserdes_q[1]      ),
        .Q6             ( iserdes_q[0]      ),
        .Q7             ( /*-----NC-----*/  ),
        .Q8             ( /*-----NC-----*/  ),
        
        .BITSLIP        ( 1'b0              ),  // 1-bit input: The BITSLIP pin performs a Bitslip operation synchronous to
        
        .CE1            ( 1'b1              ),  // CE1, CE2: 1-bit (each) input: Data register clock enable inputs
        .CE2            ( 1'b1              ),
        
        .CLK            (  iserdes_clk      ),  // 1-bit input: High-speed clock
        .CLKB           ( ~iserdes_clk      ),  // 1-bit input: High-speed secondary clock
        .CLKDIV         ( iserdes_clkdiv    ),  // 1-bit input: Divided clock
        .CLKDIVP        ( 1'b0              ),  // 1-bit input: TBD
        .OCLK           ( 1'b0              ),  // 1-bit input: High speed output clock used when INTERFACE_TYPE="MEMORY"
        .OCLKB          ( 1'b0              ),  // 1-bit input: High speed negative edge output clock
        
        .D              ( iserdes_d         ),  // 1-bit input: Data input
        .DDLY           ( iserdes_ddly      ),  // 1-bit input: Serial data from IDELAYE2
        .OFB            ( 1'b0              ),  // 1-bit input: Data feedback from OSERDESE2
        .RST            ( arst              ),  // 1-bit input: Active high asynchronous reset
        
        .DYNCLKDIVSEL   ( 1'b0              ),  // 1-bit input: Dynamic CLKDIV inversion
        .DYNCLKSEL      ( 1'b0              ),  // 1-bit input: Dynamic CLK/CLKB inversion
        
        .SHIFTOUT1      ( /*-----NC-----*/  ),  // SHIFTOUT1-SHIFTOUT2: 1-bit (each) output: Data width expansion output ports
        .SHIFTOUT2      ( /*-----NC-----*/  ),
        
        .SHIFTIN1       ( 1'b0              ),  // SHIFTIN1-SHIFTIN2: 1-bit (each) input: Data width expansion input ports
        .SHIFTIN2       ( 1'b0              )
    );
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    /* Register ISERDESE2 output */
    always @(posedge iserdes_clkdiv or posedge arst) begin
        if (arst) begin
            iserdes_o <= {6{1'b0}};
        end else begin
            iserdes_o <= iserdes_q;
        end
    end
    
endmodule

/*----------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
