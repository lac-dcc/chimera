// This program was cloned from: https://github.com/matrix-io/matrix-creator-fpga
// License: GNU General Public License v3.0

/*
* Copyright 2016-2020 MATRIX Labs
* MATRIX Labs  [http://creator.matrix.one]
* Authors: Andres Calderon <andres.calderon@admobilize.com>
*          Kevin Patiño    <kevin.patino@admobilize.com>        
*
* This file is part of MATRIX Creator HDL for Spartan 6
*
* MATRIX Creator HDL is like free software: you can redistribute
* it and/or modify it under the terms of the GNU General Public License
* as published by the Free Software Foundation, either version 3 of the
* License, or (at your option) any later version.

* This program is distributed in the hope that it will be useful, but
* WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.

* You should have received a copy of the GNU General Public License along
* with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

module cic #(
  parameter WIDTH="mandatory",
  parameter STAGES="mandatory",
  parameter CHANNELS="mandatory"
)(
  input  clk,
  input  resetn,
  input  [CHANNELS-1:0] pdm_data, /* MIC_Interface */
  input  integrator_enable,
  input  comb_enable,
  input  pdm_read_enable,
  output [$clog2(CHANNELS)-1:0] channel,
  output signed [WIDTH-1:0] data_out,
  output write_memory  
);

wire wr_en,read_en;

assign write_memory = wr_en & comb_enable;

localparam signed [WIDTH-1:0] HIGH_LEVEL = 1              ;
localparam signed [WIDTH-1:0] LOW_LEVEL  = ~(HIGH_LEVEL)+1;

//PDM Data
reg signed [WIDTH-1:0] signed_data;

reg [CHANNELS-1:0] pdm_data_reg;

always @(posedge clk or posedge resetn) begin
  if (resetn)
    pdm_data_reg <= {CHANNELS{1'b0}};
  else begin
    if (pdm_read_enable)
      pdm_data_reg <= pdm_data;
    else
      pdm_data_reg <= pdm_data_reg;
  end
end

always @(*) begin
  case(pdm_data_reg[channel])
    1'b0 : signed_data = LOW_LEVEL;
    1'b1 : signed_data = HIGH_LEVEL;
  endcase
end

wire signed [WIDTH-1:0] data_int [STAGES:0];
wire signed [WIDTH-1:0] data_comb[STAGES:0];

assign data_int[0] = signed_data;

cic_op_fsm #(
  .WIDTH   (WIDTH   ),
  .CHANNELS(CHANNELS)
) op_fsm0 (
  .clk    (clk              ),
  .resetn (resetn           ),
  .enable (integrator_enable),
  .read_en(read_en          ),
  .wr_en  (wr_en            ),
  .channel(channel          )
);

genvar i;
generate
  for (i=0; i<STAGES; i=i+1)
    begin: int_stage
      cic_int #(
        .WIDTH   (WIDTH   ),
        .CHANNELS(CHANNELS)
      ) int0 (
        .clk     (clk          ),
        .resetn  (resetn       ),
        .wr_en   (wr_en        ),
        .read_en (read_en      ),
        .channel (channel      ),
        .data_in (data_int[i]  ),
        .data_out(data_int[i+1])
      );
    end
endgenerate
//CIC Data Out

assign data_comb[0] = data_int[STAGES];

genvar j;
generate
  for (j=0; j<STAGES; j=j+1)
    begin: comb_stage
      cic_comb #(
        .WIDTH   (WIDTH   ),
        .CHANNELS(CHANNELS)
      ) comb0 (
        .clk     (clk                  ),
        .resetn  (resetn               ),
        .read_en (read_en & comb_enable),
        .wr_en   (write_memory         ),
        .channel (channel              ),
        .data_in (data_comb[j]         ),
        .data_out(data_comb[j+1]       )
      );
    end
endgenerate
//CIC Data Out
assign data_out = data_comb[STAGES];


endmodule

