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
module uart_fifo #(
  parameter ADDRESS_WIDTH = "mandatory",
  parameter DATA_WIDTH    = "mandatory"
) (
  input                       clk         ,
  input                       resetn      ,
  // write port a
  input                       write_enable,
  output reg                  write_ack   ,
  input      [DATA_WIDTH-1:0] data_a      ,
  // read port b
  input                       read_enable ,
  output reg                  read_ack    ,
  output reg [DATA_WIDTH-1:0] data_b      ,
  //status
  input                       fifo_flush,
  output                      empty
);

  reg [ADDRESS_WIDTH-1:0] read_pointer;
  reg [ADDRESS_WIDTH-1:0] write_pointer;

  initial begin
    write_ack = 0;
  end

  localparam DEPTH = (2 ** ADDRESS_WIDTH);

  reg [DATA_WIDTH-1:0] ram[0:DEPTH-1];

  assign empty = (write_pointer == read_pointer);

  always @(posedge clk or posedge resetn) begin
    if(resetn | fifo_flush) begin
      read_pointer <= 0;
    end else if(read_ack) begin
      read_pointer <= read_pointer + 1;
    end
  end

  always @(posedge clk or posedge resetn) begin
    if(resetn | fifo_flush) begin
      write_pointer <= 0;
    end else if(write_ack ) begin
      write_pointer <= write_pointer + 1;
    end
  end

//------------------------------------------------------------------
// write port A
//------------------------------------------------------------------
  always @(posedge clk) begin
    write_ack <= 0;
    if (write_enable) begin
      ram[write_pointer] <= data_a;
      write_ack          <= 1;
    end
  end

//------------------------------------------------------------------
// read port B
//------------------------------------------------------------------
  always @(posedge clk) begin
    read_ack <= 0;
    if(read_enable & (~empty)) begin
      data_b   <= ram[read_pointer];
      read_ack <= 1;
    end else
      data_b <= data_b;
  end

endmodule // uart_fifo
