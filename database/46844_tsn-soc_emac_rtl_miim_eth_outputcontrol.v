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
 * Output control for PHY MDIO interface 
-*/

module eth_outputcontrol (
    input               Clk,                // Host Clock
    input               rst_n,              // General Reset, active low
    input               WriteOp_i,            // Write Operation Latch (When asserted, write operation is in progress)
    input               NoPre_i,              // No Preamble (no 32-bit preamble)
    input               InProgress_i,         // Operation in progress
    input               ShiftedBit_i,         // This bit is output of the shift register and is connected to the Mdo signal
    input  [6:0]        BitCounter_i,         // Bit Counter
    input               MdcEn_n_i,            // MII Management Data Clock Enable signal is asserted for one Clk period before Mdc falls.
    
    output reg          Mdo_o,                // MII Management Data Output
    output reg          MdoEn_o               // MII Management Data Output Enable
);

    wire          SerialEn;
    
    reg           MdoEn_2d;
    reg           MdoEn_d;
    
    reg           Mdo_2d;
    reg           Mdo_d;

    // Generation of the Serial Enable signal (enables the serialization of the data)
    assign SerialEn =  WriteOp_i & InProgress_i & ( BitCounter_i>31 | ( ( BitCounter_i == 0 ) & NoPre_i ) )
                    | ~WriteOp_i & InProgress_i & (( BitCounter_i>31 & BitCounter_i<46 ) | ( ( BitCounter_i == 0 ) & NoPre_i ));

    // Generation of the MdoEn signal
    always @ (posedge Clk or negedge rst_n) begin
        if(!rst_n) begin
            MdoEn_2d <=  1'b0;
            MdoEn_d <=  1'b0;
            MdoEn_o <=  1'b0;
        end
        else begin
            if(MdcEn_n_i) begin
                MdoEn_2d <=  SerialEn | InProgress_i & BitCounter_i<32;
                MdoEn_d <=  MdoEn_2d;
                MdoEn_o <=  MdoEn_d;
            end
        end
    end

    // Generation of the Mdo signal.
    always @ (posedge Clk or negedge rst_n) begin
        if(!rst_n) begin
            Mdo_2d <=  1'b0;
            Mdo_d <=  1'b0;
            Mdo_o <=  1'b0;
        end
        else begin
            if(MdcEn_n_i) begin
                Mdo_2d <=  ~SerialEn & BitCounter_i<32;
                Mdo_d <=  ShiftedBit_i | Mdo_2d;
                Mdo_o <=  Mdo_d;
            end
        end
    end

endmodule
