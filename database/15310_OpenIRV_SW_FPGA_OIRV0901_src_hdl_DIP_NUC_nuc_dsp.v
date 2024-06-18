// This program was cloned from: https://github.com/OVGN/OpenIRV
// License: Apache License 2.0

/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: nuc_dsp.v
 *  Purpose:  NUC (Non Uniformity Correction) DSP processing module.
 *            Current module adjusts individual sensor pixel output
 *            by individual gain and offset coefficient to get
 *            uniform image output.
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


module nuc_dsp
(
    input   wire            clk,
    input   wire            cen,
    input   wire            sresetn,
    input   wire            bypass,
    
    input   wire    [13:0]  din,
    input   wire    [15:0]  gain,
    input   wire    [15:0]  ofst,
    
    output  reg             dout_good = 1'b0,
    output  reg     [13:0]  dout = {14{1'b0}}
);
                
    localparam  DSP_PIPELINE_DELAY = 4;
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
   /* 
    * -------------------------------------------------------------------------------
    *
    * gain[15] - bit indicates that current pixel is good/bad (1/0)
    * gain[14:0] - is a 15-bit gain correction value.
    *
    * Note that a gain factor of one i.e. unity gain is 16384.
    *
    * Excepting dummy gain value of zero (which is not restricted, but useless)
    * each pixel can be adjusted within a factor range of 1/16384 to 32767/16384,
    * i.e. 0,00006103515625 to 1,99993896484375
    *
    * -------------------------------------------------------------------------------
    *
    * ofst[15:0] - is a 16-bit SIGNED (two's complement) offset correction value.
    *
    * -------------------------------------------------------------------------------
    */
    
    /* Packing arguments to DSP inputs */
    wire    [17:0]  dsp_a   = {18{1'b0}};                           // dummy value for A-input
    wire    [17:0]  dsp_b   = {{3{1'b0}}, gain[14:0]};              // 15-bit gain value
    wire    [47:0]  dsp_c   = {{18{ofst[15]}}, ofst, {14{1'b0}}};   // equal to signed ofst[i] * 16384
    wire    [17:0]  dsp_d   = {{4{1'b0}}, din};                     // raw 14-bit input pixel value
    wire    [47:0]  dsp_p;
    
    
    /* (D-A)*B+C */
    DSP_LINEAR_FUNC dsp
    (
        .CLK    ( clk       ),      // input CLK
        .CE     ( cen       ),      // input CE
        .SCLR   ( ~sresetn  ),      // input SCLR
        .SEL    ( 1'b0      ),      // input  [0 : 0] SEL
        .A      ( dsp_a     ),      // input  [17 : 0] A
        .B      ( dsp_b     ),      // input  [17 : 0] B
        .C      ( dsp_c     ),      // input  [47 : 0] C
        .D      ( dsp_d     ),      // input  [17 : 0] D
        .P      ( dsp_p     )       // output [47 : 0] P
    );
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    wire    [13:0]  din_pipe_out;
    
    pipeline #
    (
        .PIPE_WIDTH  ( 14 ),
        .PIPE_STAGES ( DSP_PIPELINE_DELAY )
    )
    pipeline_din
    (
        .clk        ( clk           ),
        .cen        ( cen           ),
        .srst       ( ~sresetn      ),
        .pipe_in    ( din           ),
        .pipe_out   ( din_pipe_out  )
    );

/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    wire    good_pipe_out;
    
    pipeline #
    (
        .PIPE_WIDTH  ( 1 ),
        .PIPE_STAGES ( DSP_PIPELINE_DELAY )
    )
    pipeline_good_flag
    (
        .clk        ( clk           ),
        .cen        ( cen           ),
        .srst       ( ~sresetn      ),
        .pipe_in    ( gain[15]      ),
        .pipe_out   ( good_pipe_out )
    );
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    wire    [13:0]  dsp_out  = dsp_p[27:14];    // result is divided by 16384
    wire    [19:0]  overflow = dsp_p[47:28];
    wire            sign     = dsp_p[47];
    
    
    always @(posedge clk) begin
        if (~sresetn) begin
            dout_good <= 1'b0;
            dout <= {14{1'b0}};
        end else begin
            if (cen) begin
                if (bypass) begin
                    dout_good <= 1'b0;
                    dout <= din_pipe_out;
                end else begin
                    /* Good pixel flag for dout */
                    dout_good <= good_pipe_out;
                    
                    /* Adjust only good pixels */
                    if (good_pipe_out) begin
                        /* Clip adjusted pixel output in case of overflow */
                        if (overflow != 20'd0) begin
                            /* Checking overflow polarity */
                            dout <= (sign)? {14{1'b0}} : {14{1'b1}};
                        end else begin
                            /* Normal output */
                            dout <= dsp_out;
                        end
                    end else begin
                        /* Zeroing bad pixels */
                        dout <= {14{1'b0}};
                    end
                end
            end
        end
    end
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
