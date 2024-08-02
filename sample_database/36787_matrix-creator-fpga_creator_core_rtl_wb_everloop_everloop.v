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

module everloop #(
  parameter SYS_FREQ_HZ    = "mandatory",
  parameter DATA_WIDTH     = "mandatory",
  parameter DATA_PERIOD    = 833_000,
  parameter ZERO_HIGH_TIME = 300    ,
  parameter ONE_HIGH_TIME  = 600    ,
  parameter [8:0] DATA_PERIOD_COUNTER = $ceil(SYS_FREQ_HZ/DATA_PERIOD),
  parameter [8:0] ZERO_HIGH_COUNTER = $ceil(SYS_FREQ_HZ/($pow(10,9)/(ZERO_HIGH_TIME))),
  parameter [8:0] ONE_HIGH_COUNTER = $ceil(SYS_FREQ_HZ/($pow(10,9)/(ONE_HIGH_TIME)))
) (
  input                       clk             ,
  input                       resetn          ,
  input      [DATA_WIDTH-1:0] data_everloop   ,
  input                       data_en         ,
  output reg                  everloop_control,
  output                      send_complete   ,
  input                       reset_everloop
);

  reg [7:0] clk_cnt ;
  reg [7:0] data_cnt;

  reg [DATA_WIDTH-1:0] data_register;

  reg  shift_enable;
  wire s_data      ;

  assign send_complete = shift_enable & (data_cnt == DATA_WIDTH);
  assign s_data        = data_register[DATA_WIDTH-1];

  always @(posedge clk or posedge resetn) begin
    if (resetn | shift_enable)
      clk_cnt <= 0;
    else
      clk_cnt <= clk_cnt + 1;
  end

  always @(posedge clk or posedge resetn) begin
    if(resetn | reset_everloop) begin
      shift_enable <= 0;
      data_cnt     <= 0;
    end else begin
      if (clk_cnt == DATA_PERIOD_COUNTER) begin
        data_cnt     <= data_cnt + 1;
        shift_enable <= 1'b1;
      end else if(data_cnt == DATA_WIDTH) begin
        data_cnt     <= 0;
        shift_enable <= 0;
      end else begin
        shift_enable <= 1'b0;
        data_cnt     <= data_cnt;
      end
    end
  end

  always @(posedge clk or posedge resetn) begin
    if(resetn | reset_everloop) begin
      data_register <= 0;
    end else begin
      if(data_en) begin
        data_register <= {data_everloop[7:0],data_everloop[DATA_WIDTH-1-:8]};
      end else if(shift_enable) begin
        data_register <= data_register << 1;
      end else begin
        data_register <= data_register;
      end
    end
  end

  always @(posedge clk or posedge resetn) begin
    if(resetn | reset_everloop) begin
      everloop_control <= 0;
    end else begin
      case(s_data)
        1'b0 : begin
          if(clk_cnt < ZERO_HIGH_COUNTER) begin
            everloop_control <= 1;
          end else begin
            everloop_control <= 0;
          end
        end
        1'b1 : begin
          if(clk_cnt < ONE_HIGH_COUNTER ) begin
            everloop_control <= 1;
          end else begin
            everloop_control <= 0;
          end
        end
      endcase
    end
  end


endmodule



