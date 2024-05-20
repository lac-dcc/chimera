// This program was cloned from: https://github.com/lrburle/caravel_google_ring_oscillators
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

module mux16x1_project #(
    parameter BITS = 16
)(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    // input wb_clk_i,
    // input wb_rst_i,
    // input wbs_stb_i,
    // input wbs_cyc_i,
    // input wbs_we_i,
    // input [3:0] wbs_sel_i,
    // input [31:0] wbs_dat_i,
    // input [31:0] wbs_adr_i,
    // output wbs_ack_o,
    // output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    // input  [127:0] la_data_in,
    // output [127:0] la_data_out,
    // input  [127:0] la_oenb,

    // IOs
    input  [BITS-1:0] data_in,
    input  [3:0] select,
    output y

    // IRQ
    // output [2:0] irq
);
    // wire clk;
    // wire rst;

    // wire [BITS-1:0] rdata; 
    // wire [BITS-1:0] wdata;
    // wire [BITS-1:0] count;
    // wire mux_out;

    // wire valid;
    // wire [3:0] wstrb;
    // wire [BITS-1:0] la_write;

    // WB MI A
    // assign valid = wbs_cyc_i && wbs_stb_i; 
    // assign wstrb = wbs_sel_i & {4{wbs_we_i}};
    // assign wbs_dat_o = {{(32-BITS){1'b0}}, rdata};
    // assign wdata = wbs_dat_i[BITS-1:0];

    // IO
    // assign io_out = mux_out;
    // assign io_oeb = {(BITS){rst}};

    // IRQ
    // assign irq = 3'b000;	// Unused

    // LA
    // assign la_data_out = {{(128-BITS){1'b0}}, count};
    // // Assuming LA probes [63:32] are for controlling the count register  
    // assign la_write = ~la_oenb[63:64-BITS] & ~{BITS{valid}};
    // // Assuming LA probes [65:64] are for controlling the count clk & reset  
    // assign clk = (~la_oenb[64]) ? la_data_in[64]: wb_clk_i;
    // assign rst = (~la_oenb[65]) ? la_data_in[65]: wb_rst_i;

    mux16x1 #(
        .BITS(BITS)
    ) mx1(
        .s(select),
        .a(data_in),
        .y(y)
    );

endmodule

module mux16x1 #(
   BITS = 16 
) (
    input [3:0] s,
    input [BITS-1:0] a,
    output reg y
);
    
    always @(a or s) begin
       case (s)
        4'b0000: y = a[0];
        4'b0001: y = a[1];
        4'b0010: y = a[2];
        4'b0011: y = a[3];
        4'b0100: y = a[4];
        4'b0101: y = a[5];
        4'b0110: y = a[6];
        4'b0111: y = a[7];
        4'b1000: y = a[8];
        4'b1001: y = a[9];
        4'b1010: y = a[10];
        4'b1011: y = a[11];
        4'b1100: y = a[12];
        4'b1101: y = a[13];
        4'b1110: y = a[14];
        4'b1111: y = a[15];
        default: y = 1'b0; // Default case
       endcase 
    end
endmodule

// module counter #(
//     parameter BITS = 16
// )(
//     input clk,
//     input reset,
//     input valid,
//     input [3:0] wstrb,
//     input [BITS-1:0] wdata,
//     input [BITS-1:0] la_write,
//     input [BITS-1:0] la_input,
//     output reg ready,
//     output reg [BITS-1:0] rdata,
//     output reg [BITS-1:0] count
// );

//     always @(posedge clk) begin
//         if (reset) begin
//             count <= 0;
//             ready <= 0;
//         end else begin
//             ready <= 1'b0;
//             if (~|la_write) begin
//                 count <= count + 1;
//             end
//             if (valid && !ready) begin
//                 ready <= 1'b1;
//                 rdata <= count;
//                 if (wstrb[0]) count[7:0]   <= wdata[7:0];
//                 if (wstrb[1]) count[15:8]  <= wdata[15:8];
//             end else if (|la_write) begin
//                 count <= la_write & la_input;
//             end
//         end
//     end

// endmodule
`default_nettype wire
