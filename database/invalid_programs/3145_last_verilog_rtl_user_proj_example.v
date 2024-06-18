// This program was cloned from: https://github.com/blue67chillout/last
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

module user_proj_example (
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif
   
   //la probes
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,
   
   
   
   // IOs
    input  [7:0] io_in,
    output [3:0] io_out,
    output [11:0] io_oeb,

    // IRQ
    output [2:0] irq
);
   // wire [3:0]a,b,sum;
    //assign {a,b} = la_data_in[63:56];
  // assign {a,b} = io_in[7:0];
    assign io_oeb  = 12'hFF0;
   // assign io_oeb = 13'h00FF;
    assign irq = 3'b000;	// Unused
   // adder uut(a,b,io_out[3:0]);
    adder uut(io_in[7:4],io_in[3:0],io_out[3:0]);
endmodule

module adder(
input [3:0]a,
input [3:0]b,
output [3:0]sum);

assign sum = a + b;

endmodule
`default_nettype wire
