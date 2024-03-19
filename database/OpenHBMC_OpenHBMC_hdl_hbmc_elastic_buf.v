/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenHBMC
 *  Filename: hbmc_elastic_buf.v
 *  Purpose:  Elastic buffer module. Used to synchronize data transfer between
 *  two clock domains with same frequency, but random phase.
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


module hbmc_elastic_buf #
(
    parameter   DATA_WIDTH = 8
)
(
    input   wire                        arst,
    input   wire                        clk_din,
    input   wire                        clk_dout,
    input   wire    [DATA_WIDTH - 1:0]  din,
    output  reg     [DATA_WIDTH - 1:0]  dout
);

/*----------------------------------------------------------------------------------------------------------------------------*/
    
    wire    rst_0;
    wire    rst_1;
    
    
    hbmc_arst_sync #
    (
        .C_SYNC_STAGES ( 3 )
    )
    hbmc_arst_sync_inst_0
    (
        .clk   ( clk_din ),
        .arst  ( arst    ),
        .rst   ( rst_0   )
    );
    
    
    hbmc_arst_sync #
    (
        .C_SYNC_STAGES ( 3 )
    )
    hbmc_arst_sync_inst_1
    (
        .clk   ( clk_dout ),
        .arst  ( arst     ),
        .rst   ( rst_1    )
    );
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    reg     [4:0]               wr_addr;
    reg     [4:0]               rd_addr;
    wire    [DATA_WIDTH - 1:0]  dout_ram;
    
    /* Circular buffer write pointer */
    always @(posedge clk_din or posedge rst_0) begin
        if (rst_0) begin
            wr_addr <= 5'd2;    // write to read pointer margin
        end else begin
            wr_addr <= wr_addr + 1'b1;
        end
    end
    
    
    /* Circular buffer read pointer */
    always @(posedge clk_dout or posedge rst_1) begin
        if (rst_1) begin
            rd_addr <= 5'd0;
            dout    <= {DATA_WIDTH{1'b0}};
        end else begin
            rd_addr <= rd_addr + 1'b1;
            dout    <= dout_ram;
        end
    end
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    genvar i;
    
    generate
        for (i = 0; i < DATA_WIDTH; i = i + 1) begin
            RAM32X1D #
            (
                .INIT   ( 32'h00000000 )    // Initial contents of RAM
            )
            RAM32X1D_inst
            (
                .WCLK   ( clk_din     ),    // Write clock input
                .WE     ( 1'b1        ),    // Write enable input
                .A0     ( wr_addr[0]  ),    // RW address[0] input bit
                .A1     ( wr_addr[1]  ),    // RW address[1] input bit
                .A2     ( wr_addr[2]  ),    // RW address[2] input bit
                .A3     ( wr_addr[3]  ),    // RW address[3] input bit
                .A4     ( wr_addr[4]  ),    // RW address[4] input bit
                .D      ( din[i]      ),    // Write 1-bit data input
                .SPO    ( /*--NC--*/  ),    // RW 1-bit data output
                
                .DPRA0  ( rd_addr[0]  ),    // RO address[0] input bit
                .DPRA1  ( rd_addr[1]  ),    // RO address[1] input bit
                .DPRA2  ( rd_addr[2]  ),    // RO address[2] input bit
                .DPRA3  ( rd_addr[3]  ),    // RO address[3] input bit
                .DPRA4  ( rd_addr[4]  ),    // RO address[4] input bit
                .DPO    ( dout_ram[i] )     // RO 1-bit data output
            );
        end
    endgenerate
    
endmodule

/*----------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
