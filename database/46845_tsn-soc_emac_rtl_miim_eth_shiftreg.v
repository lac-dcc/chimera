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
 * Shift register for PHY MDIO interface 
-*/

module eth_shiftreg (
    input                Clk,                // Input clock (Host clock)
    input                rst_n,              // Reset signal
    input                MdcEn_n_i,          // Enable signal is asserted for one Clk period before Mdc falls.
    input                Mdi_i,              // MII input data
    input  [4:0]         Fiad_i,             // PHY address
    input  [4:0]         Rgad_i,             // Register address (within the selected PHY)
    input  [15:0]        CtrlData_i,         // Control data (data to be written to the PHY)
    input                WriteOp_i,          // The current operation is a PHY register write operation
    input  [3:0]         ByteSelect_i,       // Byte select
    input  [1:0]         LatchByte_i,        // Byte select for latching (read operation)
    
    output               ShiftedBit_o,       // Bit shifted out of the shift register
    output reg [15:0]    Prsd_o,             // Read Status Data (data read from the PHY)
    output reg           LinkFail_o          // Link Integrity Signal
);

    reg   [7:0] ShiftReg;         // Shift register for shifting the data in and out

    // ShiftReg[7:0] :: Shift Register Data
    always @ (posedge Clk or negedge rst_n) begin
        if(!rst_n) begin
            ShiftReg[7:0] <=  8'h0;
            Prsd_o[15:0] <=  16'h0;
            LinkFail_o <=  1'b0;
        end
        else begin
            if(MdcEn_n_i) begin 
                if(|ByteSelect_i) begin
                 /* verilator lint_off CASEINCOMPLETE */
                    case (ByteSelect_i[3:0])  // synopsys parallel_case full_case
                      4'h1 :    ShiftReg[7:0] <=  {2'b01, ~WriteOp_i, WriteOp_i, Fiad_i[4:1]};
                      4'h2 :    ShiftReg[7:0] <=  {Fiad_i[0], Rgad_i[4:0], 2'b10};
                      4'h4 :    ShiftReg[7:0] <=  CtrlData_i[15:8];
                      4'h8 :    ShiftReg[7:0] <=  CtrlData_i[7:0];
                    endcase // case (ByteSelect_i[3:0])
                 /* verilator lint_on CASEINCOMPLETE */
                end 
                else begin
                    ShiftReg[7:0] <=  {ShiftReg[6:0], Mdi_i};
                    if(LatchByte_i[0]) begin
                        Prsd_o[7:0] <=  {ShiftReg[6:0], Mdi_i};
                        if(Rgad_i == 5'h01)
                            LinkFail_o <=  ~ShiftReg[1];  // this is bit [2], because it is not shifted yet
                    end
                    else begin
                        if(LatchByte_i[1])
                            Prsd_o[15:8] <=  {ShiftReg[6:0], Mdi_i};
                    end
                end
            end
        end
    end

    assign ShiftedBit_o = ShiftReg[7];

endmodule
