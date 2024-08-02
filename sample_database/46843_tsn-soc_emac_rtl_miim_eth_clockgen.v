// This program was cloned from: https://github.com/lvzhengde/tsn-soc
// License: BSD 3-Clause "New" or "Revised" License

/*+
 * Copyright (c) 2022-2023 Zhengde
 *
 * Copyright (c) 2001 Igor Mohor (igorM@opencores.org) 
 * 
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 * 1 Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * 
 * 2 Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 * 
 * 3 Neither the name of the copyright holder nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-*/

/*+
 * Generate clock(mdc) for PHY MDIO interface 
-*/

module eth_clockgen (
    input               Clk,              // Input clock (Host clock)
    input               rst_n,            // Reset signal, active low
    input  [7:0]        Divider_i,        // Divider (input clock will be divided by the Divider[7:0])
    
    output reg          Mdc_o,            // Output clock
    output              MdcEn_o,          // Enable signal is asserted for one Clk period before Mdc rises.
    output              MdcEn_n_o         // Enable signal is asserted for one Clk period before Mdc falls.
);

    reg   [7:0] Counter;
    
    wire        CountEq0;
    wire  [7:0] CounterPreset;
    wire  [7:0] TempDivider;

    assign TempDivider[7:0]   = (Divider_i[7:0]<2)? 8'h02 : Divider_i[7:0]; // If smaller than 2
    assign CounterPreset[7:0] = (TempDivider[7:0]>>1) - 8'b1;           // We are counting half of period

    // Counter counts half period
    always @ (posedge Clk or negedge rst_n) begin
        if(!rst_n)
            Counter[7:0] <=  8'h1;
        else begin
            if(CountEq0) begin
                Counter[7:0] <=  CounterPreset[7:0];
            end
            else
                Counter[7:0] <=  Counter - 8'h1;
        end
    end

    // Mdc is asserted every other half period
    always @ (posedge Clk or negedge rst_n) begin
        if(!rst_n)
            Mdc_o <=  1'b0;
        else begin
            if(CountEq0)
                Mdc_o <=  ~Mdc_o;
        end
    end

    assign CountEq0 = Counter == 8'h0;
    assign MdcEn_o = CountEq0 & ~Mdc_o;
    assign MdcEn_n_o = CountEq0 & Mdc_o;

endmodule


