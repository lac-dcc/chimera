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
module timer #(
  parameter CORE_WIDTH = 4,
  parameter TIMER_COUNTER_WIDTH = 16
)(
  input clk,
  input rst,
  input ps_clk,
  
  
  //TIMER

  input  [CORE_WIDTH-1:0] timer_input,
  input  [2*CORE_WIDTH-1:0] timer_conf,
  output [CORE_WIDTH*TIMER_COUNTER_WIDTH-1:0] timer_result);


initial begin
rTimer_input = 0;
enable_signal = 0;
final_signal = 0;
end

reg [3*CORE_WIDTH-1 : 0] rTimer_input;

genvar i;
generate
  for(i=0 ; i < CORE_WIDTH ; i = i+1) begin:edge_detector
    always@(negedge clk) rTimer_input[3*i+2 -: 3] <= {rTimer_input[3*i+1 -: 2], timer_input[i]} ;
  end
endgenerate

wire [CORE_WIDTH-1 : 0]rise_edges;
wire [CORE_WIDTH-1 : 0]fall_edges;

genvar j;
generate
  for(j=0 ; j < CORE_WIDTH ; j = j+1) begin:logic_detector
    assign rise_edges[j] = rTimer_input[3*j+2-:2]==2'b01;
    assign fall_edges[j] = rTimer_input[3*j+2-:2]==2'b10; 
  end
endgenerate

reg [CORE_WIDTH-1:0]enable_signal;
reg [CORE_WIDTH-1:0]final_signal;

genvar l;
generate
  for(l=0 ; l < CORE_WIDTH ; l = l+1) begin:conf_enable_stage
    always@(*) begin
      case(timer_conf[l])
        1'b0: enable_signal[l] = rise_edges[l];
        1'b1: enable_signal[l] = fall_edges[l];
      endcase
    end
  end
endgenerate


genvar m;
generate
  for(m=0 ; m < CORE_WIDTH ; m = m+1) begin:conf_final_stage
    always@(*) begin
      case(timer_conf[m+4])
        1'b0: final_signal[m] = rise_edges[m];
        1'b1: final_signal[m] = fall_edges[m];
      endcase
    end
  end
endgenerate


genvar k;
generate
  for(k=0 ; k < CORE_WIDTH ; k = k+1) begin:counter_stage
    timer_core #(
      .TIMER_COUNTER_WIDTH(TIMER_COUNTER_WIDTH)
    )timer_core0(
      .clk(clk),
      .rst(rst),
      .ps_clk(ps_clk),
  
      .enable_signal(enable_signal[k]),
      .final_signal(final_signal[k]),  
      .counter_result(timer_result[16*k+15-:16])
);
  end
endgenerate

  
endmodule 
  

  
