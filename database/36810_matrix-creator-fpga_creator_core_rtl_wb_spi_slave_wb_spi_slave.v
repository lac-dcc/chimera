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

module wb_spi_slave #(
  parameter ADDR_WIDTH = "mandatory",
  parameter DATA_WIDTH = "mandatory"
) (
  input  clk,
  input  resetn,
  // SPI interface
  input  mosi,
  input  ss,
  input  sck,
  output miso,
  // WishBone Interface
  input ack,
  output [DATA_WIDTH-1:0] data_bus_r,
  input  [DATA_WIDTH-1:0] data_bus_w,
  output reg [ADDR_WIDTH-1:0] addr_bus,
  output reg wr,
  output reg strobe,
  output cycle
);
// SPI Slave Core
  spi_slave #(.DATA_WIDTH(DATA_WIDTH)) spi0 (
    .clk            (clk                                         ),
    .resetn         (resetn                                      ),
    
    .mosi           (mosi                                        ),
    .ss             (ss                                          ),
    .sck            (sck                                         ),
    .miso           (miso                                        ),
    
    .data_bus_r     ({data_bus_r[7:0],data_bus_r[DATA_WIDTH-1:8]}),
    .data_bus_w     ({data_bus_w[7:0],data_bus_w[DATA_WIDTH-1:8]}),
    
    .data_enable    (data_enable                                 ),
    .SSEL_active(spi_active                                  ),
    .load_data_miso (ack                                         )
  );

  reg [3:0] state;
  reg rd,addr_enable,addr_inc;
  assign cycle = strobe;

  localparam [3:0] S_IDLE        = 4'd0;
  localparam [3:0] S_ADDRES      = 4'd1;
  localparam [3:0] S_MODE        = 4'd2;
  localparam [3:0] S_WRITE       = 4'd3;
  localparam [3:0] S_READ        = 4'd4;
  localparam [3:0] S_WAIT        = 4'd5;
  localparam [3:0] S_WAIT_ACK_RD = 4'd6;
  localparam [3:0] S_WAIT_ACK_WR = 4'd7;
  localparam [3:0] S_ADDR_INC    = 4'd8;

  always @(posedge clk or posedge resetn) begin
    if(resetn)
      state <= S_IDLE;
    else begin
      case(state)
        S_IDLE :
          if(data_enable)
            state <= S_ADDRES;
        else
          state <= S_IDLE;
        S_ADDRES :
          if(~spi_active)
            state <= S_IDLE;
        else
          state <= S_MODE;
        S_MODE :
          if(~spi_active)
            state <= S_IDLE;
        else if (rd_nwr)
          state <= S_READ;
        else if (~rd_nwr)
          state <= S_WAIT;
        else
          state <= S_MODE;
        S_READ :
          if(~spi_active)
            state <= S_IDLE;
        else if (ack)
          state <= S_WAIT;
        else
          state <= S_WAIT_ACK_RD;
        S_WAIT :
          if(~spi_active)
            state <= S_IDLE;
        else if (data_enable & ~rd_nwr)
          state <= S_WRITE;
        else if (data_enable)
          state <= S_MODE;
        else
          state <= S_WAIT;
        S_WRITE :
          if(~spi_active)
            state <= S_IDLE;
        else
          state <= S_WAIT_ACK_WR;
        S_WAIT_ACK_RD :
          if(~spi_active)
            state <= S_IDLE;
        else if(ack & rd_nwr)
          state <= S_ADDR_INC;
        else
          state <= S_WAIT_ACK_RD;
        S_WAIT_ACK_WR :
          if(~spi_active)
            state <= S_IDLE;
        else if(ack & ~rd_nwr)
          state <= S_ADDR_INC;
        else
          state <= S_WAIT_ACK_WR;
        S_ADDR_INC :
          if(~spi_active)
            state <= S_IDLE;
        else if(rd_nwr)
          state <= S_WAIT;
        else if(~rd_nwr)
          state <= S_MODE;
        else
          state <= S_IDLE;
        default :
          state <= S_IDLE;
      endcase
    end
  end

  always @(state) begin
    case(state)
      S_IDLE :
        {addr_enable,wr,rd,strobe,addr_inc} = {1'b0,1'b0,1'b0,1'b0,1'b0};
      S_ADDRES :
        {addr_enable,wr,rd,strobe,addr_inc} = {1'b1,1'b0,1'b0,1'b0,1'b0};
      S_MODE :
        {addr_enable,wr,rd,strobe,addr_inc} = {1'b0,1'b0,1'b0,1'b0,1'b0};
      S_READ :
        {addr_enable,wr,rd,strobe,addr_inc} = {1'b0,1'b0,1'b1,1'b1,1'b0};
      S_WRITE :
        {addr_enable,wr,rd,strobe,addr_inc} = {1'b0,1'b1,1'b0,1'b1,1'b0};
      S_WAIT_ACK_RD :
        {addr_enable,wr,rd,strobe,addr_inc} = {1'b0,1'b0,1'b1,1'b1,1'b0};
      S_WAIT_ACK_WR :
        {addr_enable,wr,rd,strobe,addr_inc} = {1'b0,1'b1,1'b0,1'b1,1'b0};
      S_WAIT :
        {addr_enable,wr,rd,strobe,addr_inc} = {1'b0,1'b0,1'b0,1'b0,1'b0};
      S_ADDR_INC :
        {addr_enable,wr,rd,strobe,addr_inc} = {1'b0,1'b0,1'b0,1'b0,1'b1};
      default :
        {addr_enable,wr,rd,strobe,addr_inc} = {1'b0,1'b0,1'b0,1'b0,1'b0};
    endcase
  end

  reg rd_nwr;

  always @(posedge clk or posedge resetn) begin
    if (resetn | ~spi_active) begin
      addr_bus <= 0;
      rd_nwr   <= 0;
    end
    else begin
      if(addr_enable) begin
        addr_bus <= data_bus_r[DATA_WIDTH-1:1];
        rd_nwr   <= data_bus_r[0];
      end else if(addr_inc)
        addr_bus <= addr_bus + 1;
      else begin
        rd_nwr   <= rd_nwr;
        addr_bus <= addr_bus;
      end
    end
  end

endmodule


