// This program was cloned from: https://github.com/iic-jku/iic-audiodac-v1
// License: Apache License 2.0

// SPDX-FileCopyrightText: 2022 Johannes Kepler University, Institute for 
// Integrated Circuits (H. Pretl, L. Blagojevic, M. Esen, K. Freinberger, 
// M. Golser, M. Hackl, A. Hinterdorfer, O. Kara, D. Kellerer, P. Kotek, 
// J. Mayrhofer, M. Meingast, T. Pankratz, J. Ratschenberger, R. Reddy.Mitta, 
// P. Schmidt, S. Seidl, I. Shala, M. Zöbl)
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`ifndef _SINE_GEN_
`define _SINE_GEN_

module stud_sine_generator(
    input clk_i,
    input rst_n_i,
    input [3:0] psc_i,                  // PSC = 2^(6+psc_i), therefore values of 64 to 2.097.512 are possible
    output reg [15:0] sine_o			// 16 bit signed output
    );

reg [3:0] psc, next_psc;
reg [20:0] ctr, next_ctr;               // max. PSC is 2.097.512, so we need a 21 bit counter
reg [37:0] sine, next_sine;             // sine amplitude is 2^(2*(6+psc_i)-5), so a maximum of 38 bits is required
reg [15:0] next_sine_o;

always @(posedge clk_i)
begin
    // On (synchronous) reset, initialize signals to 0
    if(!rst_n_i)
        begin
        psc <= 0;
        ctr <= 0;
        sine <= 0;
        sine_o <= 0;
        end
    // On pos. clock edge, update signals
    else
        begin
        psc <= next_psc;
        ctr <= next_ctr;
        sine <= next_sine;
        sine_o <= next_sine_o;
        end
end

always @(ctr, psc, psc_i, sine)
begin
    // Default case
    next_psc = psc;
    next_ctr = ctr + 1;
    
    // Decrement sine amplitude in order to not exceed the 16 bit output resolutioon
    if(psc > 4)
        // If adjusted amplitude would be negativ within second half of counter period, an overflow has occurred
        if(ctr > (1<<(6+psc-1)) && (sine+(1<<(6+psc-3)))>>(2*psc-8) >= (1<<15))
            // Limit amplitude to max. positive value
            next_sine_o = (1<<15) - 1;
        // Normal operation
        else
            // Decrement sine amplitude as required
            // This would cause a linter warning since the bitwidth of sine is greather than the bitwidth of next_sine_o, however this is intentional
            /* verilator lint_off WIDTH */
            next_sine_o = (sine+(1<<(6+psc-3)))>>(2*psc-8);
            /* verilator lint_on WIDTH */
    // Increment sine amplitude in order to utilize the 16 bit output resolution as good as possible 
    else
        // If adjusted amplitude would be negativ within second half of counter period, an overflow has occurred
        if(ctr > (1<<(6+psc-1)) && (sine+(1<<(6+psc-3)))<<(8-2*psc) >= (1<<15))
            // Limit amplitude to max. positive value
            next_sine_o = (1<<15) - 1;
        // Normal operation
        else
            // Increment sine amplitude as required
            // This would cause a linter warning since the bitwidth of sine is greather than the bitwidth of next_sine_o, however this is intentional
            /* verilator lint_off WIDTH */
            next_sine_o = (sine+(1<<(6+psc-3)))<<(8-2*psc);
            /* verilator lint_on WIDTH */
    
    // If counter reached PSC value
    if(ctr == (1<<(6+psc)) - 1)
        begin
        // Reset sine generation
        next_ctr = 0;
        next_sine = 0;
        end
    
    // If psc_i has changed
    if(psc_i != psc)
        begin
        // Get new PSC value
        next_psc = psc_i;
        
        // Reset sine generation
        next_ctr = 0;
        next_sine = 0;
        end
    // Normal operation
    else
        begin        
        // If within first half of counter period
        if(ctr < (1<<(6+psc-1)))
            // Increment sine by new counter value and offset to make centered around zero
            // This would cause a linter warning since the bitwidth of ctr is less than the bitwidth of sine, however this is intentional
            /* verilator lint_off WIDTH */
            next_sine = sine + (ctr + 1) - (1<<(6+psc-2));
            /* verilator lint_on WIDTH */
        // Otherwise (second half period)
        else
            // Increment sine by (max counter value - new counter value) and offset to make centered around zero
            // This would cause a linter warning since the bitwidth of ctr is less than the bitwidth of sine, however this is intentional
            /* verilator lint_off WIDTH */
            next_sine = sine + (1<<(6+psc)) - (ctr + 1) - (1<<(6+psc-2));
            /* verilator lint_on WIDTH */
        end
end

endmodule
`endif
