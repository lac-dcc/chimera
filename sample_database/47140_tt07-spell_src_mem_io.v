// This program was cloned from: https://github.com/urish/tt07-spell
// License: Apache License 2.0

// SPDX-FileCopyrightText: © 2021 Uri Shaked <uri@wokwi.com>
// SPDX-License-Identifier: MIT

`default_nettype none

module spell_mem_io (
    input wire rst_n,
    input wire clk,
    input wire select,
    input wire [7:0] addr,
    input wire [7:0] data_in,
    input wire write,
    output reg [7:0] data_out,
    output reg data_ready,

    /* IO */
    input  wire [7:0] io_in,
    output reg  [7:0] io_out,
    output reg  [7:0] io_oe    // out enable (active high)
);

  localparam REG_PIN = 8'h36;
  localparam REG_DDR = 8'h37;
  localparam REG_PORT = 8'h38;

  reg past_write;

  always @(posedge clk) begin
    if (~rst_n) begin
      io_out <= 8'b00000000;
      io_oe  <= 8'b00000000;
      data_out <= 8'b0;
      data_ready <= 1'b0;
      past_write <= 1'b0;
    end else begin
      past_write <= select & write;
      if (select) begin
        data_out   <= 8'b0;
        data_ready <= 1'b1;

        case (addr)
          REG_PIN: begin
            if (write) begin
              if (~past_write) io_out <= io_out ^ data_in;
            end else begin
              data_out <= io_in;
            end
          end
          REG_DDR: begin
            if (write) begin
              io_oe <= data_in;
            end else begin
              data_out <= io_oe;
            end
          end
          REG_PORT: begin
            if (write) begin
              io_out <= data_in;
            end else begin
              data_out <= io_out;
            end
          end
          default: begin
            if (~write) data_out <= 8'hff;
          end
        endcase
      end else data_ready <= 1'b0;
    end
  end
endmodule
