// This program was cloned from: https://github.com/ultraembedded/core_audio
// License: GNU General Public License v2.0

//-----------------------------------------------------------------
//                      Audio Controller
//                           V0.1
//                     Ultra-Embedded.com
//                     Copyright 2012-2019
//
//                 Email: admin@ultra-embedded.com
//
//                         License: GPL
// If you would like a version with a more permissive license for
// use in closed source commercial applications please contact me
// for details.
//-----------------------------------------------------------------
//
// This file is open source HDL; you can redistribute it and/or 
// modify it under the terms of the GNU General Public License as 
// published by the Free Software Foundation; either version 2 of 
// the License, or (at your option) any later version.
//
// This file is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public 
// License along with this file; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
// USA
//-----------------------------------------------------------------

//-----------------------------------------------------------------
//                          Generated File
//-----------------------------------------------------------------
module sigma_dac
#(
    parameter [31:0] NBITS = 16
)
(
    input             clk_i,
    input             rst_i,

    input [NBITS-1:0] din_i,
    output            dout_o
);

//-----------------------------------------------------------------
// Implementation: Described in Xilinx xapp154.pdf
//-----------------------------------------------------------------
reg [NBITS+2:0] delta_adder_r;
reg [NBITS+2:0] sigma_adder_r;
reg [NBITS+2:0] sigma_latch_q;
reg [NBITS+2:0] delta_r;

//synthesis attribute IOB of dac_q is "TRUE"
reg             dac_q;

wire [NBITS-1:0]  input_unsigned_w = din_i + 'd32768;

/* verilator lint_off WIDTH */
always @ * 
    delta_r = {sigma_latch_q[NBITS+2], sigma_latch_q[NBITS+2]} << (NBITS+1);

always @ *
    delta_adder_r = input_unsigned_w + delta_r;
/* verilator lint_on WIDTH */

always @ *
    sigma_adder_r = delta_adder_r + sigma_latch_q;

always @(posedge clk_i or posedge rst_i) 
begin
    if (rst_i)
    begin
        sigma_latch_q <= 1'b1 << (NBITS+1);
        dac_q         <= 1'b0;
    end
    else
    begin
        sigma_latch_q <= sigma_adder_r;
        dac_q         <= sigma_latch_q[NBITS+2];
    end
end

assign dout_o = dac_q;

endmodule
