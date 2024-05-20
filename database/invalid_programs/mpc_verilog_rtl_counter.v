// This program was cloned from: https://github.com/efabless/mpc
// License: Apache License 2.0

// SPDX-FileCopyrightText: 2020 Efabless Corporation
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

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_proj_example
 *
 * This is an example of a (trivially simple) user project,
 * showing how the user project can connect to the logic
 * analyzer, the wishbone bus, and the I/O pads.
 *
 * This project generates an integer count, which is output
 * on the user area GPIO pads (digital output only).  The
 * wishbone connection allows the project to be controlled
 * (start and stop) from the management SoC program.
 *
 * See the testbenches in directory "mprj_counter" for the
 * example programs that drive this user project.  The three
 * testbenches are "io_ports", "la_test1", and "la_test2".
 *
 *-------------------------------------------------------------
 */


module counter #(
    parameter BITS = 30,
    parameter COUNT_STEP = 1
)(
    input wb_clk_i,
    input wb_rst_i,
    input [1:0] la_clk_rst,
    input [1:0] la_clk_rst_oenb,
    input valid,
    input [3:0] wstrb,
    input [BITS-1:0] wdata,
    input [BITS-1:0] wbs_adr_i,
    input [BITS-1:0] la_write,
    input [BITS-1:0] la_input,
    output ready,
    output [BITS-1:0] rdata,
    output [BITS-1:0] count,
    output [BITS-1:0] io_oeb
);
    reg ready;
    reg [BITS-1:0] count;
    reg [BITS-1:0] rdata;
    wire clk ; 
    wire reset ; 
    
    assign clk = (~la_clk_rst_oenb[0]) ? la_clk_rst[0]: wb_clk_i;
    assign reset = (~la_clk_rst_oenb[1]) ? la_clk_rst[1]: wb_rst_i;
    assign io_oeb = {(BITS){reset}};

    always @(posedge clk) begin
        if (reset) begin
            count <= 0;
            ready <= 0;
        end else begin
            ready <= 1'b0;
            if (~|la_write) begin
                count <= count + COUNT_STEP;
            end
            if (valid && !ready) begin
                ready <= 1'b1;
                rdata <= count;
                if (wstrb[0]) count[7:0]   <= wdata[7:0];
                if (wstrb[1]) count[15:8]  <= wdata[15:8];
                if (wstrb[2]) count[23:16] <= wdata[23:16];
                if (wstrb[3]) count[BITS-1:24] <= wdata[BITS-1:24];
            end else if (|la_write) begin
                count <= la_write & la_input;
            end
        end
    end

endmodule
`default_nettype wire
