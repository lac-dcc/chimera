/*-------------------------------------------------------------------------
// Module:  gpr
// File:    gpr.v
// Author:  shawn Liu
// E-mail:  shawn110285@gmail.com
// Description: the general purpose registers
//             (1) provide 2 read ports and 1 write port
//             (2) the gpr was updated at the wb stage
--------------------------------------------------------------------------*/

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//-----------------------------------------------------------------

`include "defines.v"

module regfile(

    input wire                    clk_i,
    input wire                    n_rst_i,

    /*---------------- write port-----------*/
    input wire                    rd_we_i,     // write enable
    input wire[`RegAddrBus]       rd_addr_i,   // the register to write
    input wire[`RegBus]           rd_wdata_i,  // the data to write

    /*---------------- read port1 -----------*/
    input wire                    rs1_re_i,     // read enable
    input wire[`RegAddrBus]       rs1_raddr_i,  // the register to read
    output reg[`RegBus]           rs1_rdata_o,  // the output for the reading

    /*---------------- read port2 -----------*/
    input wire                    rs2_re_i,
    input wire[`RegAddrBus]       rs2_raddr_i,
    output reg[`RegBus]           rs2_rdata_o

);

    reg[`RegBus]  regs[0:`RegNum-1];

    /* handle the write request */
    always @ (posedge clk_i) begin
        if (n_rst_i == `RstDisable) begin
            if((rd_we_i == `WriteEnable) && (rd_addr_i != `RegNumLog2'h0)) begin
                regs[rd_addr_i] <= rd_wdata_i;
            end

            /*used for ISA test */
            /*
            if(regs[26] == 32'b1 && regs[27] == 32'b1) begin
                $display("test passed!");
                $finish();
            end
            */
        end
    end

	/* handle the read request on read port1 */
    always @ (*) begin
        if(n_rst_i == `RstEnable) begin
            rs1_rdata_o = `ZeroWord;
        end else if(rs1_raddr_i == `RegNumLog2'h0) begin
            rs1_rdata_o = `ZeroWord;  // read x0 register
        // forward the write port to read port
        end else if((rs1_raddr_i == rd_addr_i) && (rd_we_i == `WriteEnable) && (rs1_re_i == `ReadEnable)) begin
            rs1_rdata_o = rd_wdata_i;
        end else if(rs1_re_i == `ReadEnable) begin
            rs1_rdata_o = regs[rs1_raddr_i];
        end else begin
            rs1_rdata_o = `ZeroWord;
        end
    end

    /* handle the read request on read port2 */
    always @ (*) begin
        if(n_rst_i == `RstEnable) begin
            rs2_rdata_o = `ZeroWord;
        end else if(rs2_raddr_i == `RegNumLog2'h0) begin
            rs2_rdata_o = `ZeroWord;
        end else if((rs2_raddr_i == rd_addr_i) && (rd_we_i == `WriteEnable) && (rs2_re_i == `ReadEnable)) begin
            rs2_rdata_o = rd_wdata_i;
        end else if(rs2_re_i == `ReadEnable) begin
            rs2_rdata_o = regs[rs2_raddr_i];
        end else begin
            rs2_rdata_o = `ZeroWord;
        end
    end
endmodule