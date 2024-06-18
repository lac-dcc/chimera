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

module audio_dac
(
    // Inputs
     input           clk_i
    ,input           rst_i
    ,input           audio_clk_i
    ,input           inport_tvalid_i
    ,input  [ 31:0]  inport_tdata_i
    ,input  [  3:0]  inport_tstrb_i
    ,input  [  3:0]  inport_tdest_i
    ,input           inport_tlast_i

    // Outputs
    ,output          inport_tready_o
    ,output          audio_l_o
    ,output          audio_r_o
);




//-----------------------------------------------------------------
// External clock source
//-----------------------------------------------------------------
wire    bit_clock_w;

assign bit_clock_w = audio_clk_i;

//-----------------------------------------------------------------
// Buffer
//-----------------------------------------------------------------
reg [15:0] left_q;
reg [15:0] right_q;
reg        pop_q;

always @ (posedge rst_i or posedge clk_i )
begin
   if (rst_i)
   begin
        right_q <= 16'b0;
        left_q  <= 16'b0;
        pop_q   <= 1'b0;
   end
   else if (bit_clock_w && inport_tvalid_i)
   begin
        {right_q, left_q} <= inport_tdata_i;
        pop_q   <= 1'b1;
   end
   else
        pop_q   <= 1'b0;
end

assign inport_tready_o = pop_q;

//-----------------------------------------------------------------
// DAC instances
//-----------------------------------------------------------------
sigma_dac
#( .NBITS(16) )
u_dac_l
(
    .clk_i(clk_i),
    .rst_i(rst_i),

    .din_i(left_q),
    .dout_o(audio_l_o)
);

sigma_dac
#( .NBITS(16) )
u_dac_r
(
    .clk_i(clk_i),
    .rst_i(rst_i),

    .din_i(right_q),
    .dout_o(audio_r_o)
);


endmodule
