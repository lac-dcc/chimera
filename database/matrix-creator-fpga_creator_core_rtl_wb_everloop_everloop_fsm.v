// This program was cloned from: https://github.com/matrix-io/matrix-creator-fpga
// License: GNU General Public License v3.0

/*
* Copyright 2016-2020 MATRIX Labs
* MATRIX Labs  [http://creator.matrix.one]
* Authors: Kevin Patiño    <kevin.patino@admobilize.com>        
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

module everloop_fsm #(
  parameter SYS_FREQ_HZ = "mandatory",
  parameter N_LEDS = "mandatory",
  parameter RESET_COUNTER = 12000 // uS
)(
  input clk,    // Clock
  input resetn,  // Asynchronous reset active low
  
  input send_complete,

  output reg read_en,

  output reg [7:0] read_count,

  output reset_everloop
);

  reg [2:0] state;
  reg reset_count_en;

  assign reset_everloop = reset_count_en;

  localparam [1:0] S_IDLE  = 3'd0;
  localparam [1:0] S_READ  = 3'd1;
  localparam [1:0] S_DATA  = 3'd2;
  
  always @(state) begin
    case(state)
      S_IDLE :begin
        read_en = 0;
        reset_count_en = 1;
      end
      S_READ : begin
        read_en = 1;
        reset_count_en = 0;
      end
      S_DATA : begin
        read_en = 0;
        reset_count_en = 0;
      end
      default : begin
        read_en = 0;
        reset_count_en = 0;
      end
    endcase
  end

  reg [13:0] reset_count;

  always @(posedge clk or posedge resetn) begin
    if(resetn | ~reset_count_en) begin
       reset_count <= 0;
    end else begin
      if(reset_count_en)
       reset_count <= reset_count + 1;
    end
  end

  
  always @(posedge clk or posedge resetn) begin
    if(resetn | reset_count_en) begin
       read_count <= 0;
    end else begin
      if(read_en)
       read_count <= read_count + 1;
    end
  end

  always @(posedge clk or posedge resetn) begin
    if(resetn)
      state <= S_IDLE;
    else begin
      case(state)
        S_IDLE : begin
          if(reset_count == RESET_COUNTER)
            state <= S_READ;
          else
            state <= S_IDLE;
        end
        S_READ :
          if(read_count == 2*N_LEDS)
            state <= S_IDLE;
          else
            state <= S_DATA;
        S_DATA:
           if(send_complete)
            state <= S_READ;
          else
            state <= S_DATA;
        default :
          state <= S_IDLE;
      endcase
    end
  end

endmodule
