// This program was cloned from: https://github.com/urish/tt07-spell
// License: Apache License 2.0

// SPDX-FileCopyrightText: © 2024 Uri Shaked <uri@wokwi.com>
// SPDX-License-Identifier: MIT

`default_nettype none

module spell_mem_spi (
    input wire rst_n,
    input wire clk,
    input wire select,
    input wire [7:0] addr,
    input wire [7:0] data_in,
    input wire memory_type_data,
    input wire write,
    output reg [7:0] data_out,
    output reg data_ready,

    /* External memory */
    input  wire spi_miso,
    output reg  spi_cs,
    output reg  spi_clk,
    output reg  spi_mosi
);

  wire [7:0] cmd = write ? 8'h02 : 8'h03;
  wire [15:0] addr16 = {7'b0, memory_type_data, addr};

  reg [5:0] spi_counter;
  wire [31:0] spi_data = {cmd, addr16, write ? data_in : 8'h00};

  always @(posedge clk) begin
    if (~rst_n) begin
      spi_counter <= 0;
      spi_mosi    <= 0;
      spi_cs      <= 1;
      spi_clk     <= 0;
    end else begin
      data_ready <= 1'b0;
      spi_cs     <= 1'b1;
      spi_clk    <= 0;

      if (select && data_ready) begin
        spi_mosi   <= 0;
        data_ready <= 1'b1;
      end else if (select) begin
        spi_cs   <= 1'b0;
        spi_mosi <= spi_data[31-spi_counter];
        if (!spi_cs) begin
          spi_clk <= !spi_clk;
          if (!spi_clk) begin
            spi_counter <= spi_counter + 1;
          end else if (!write && spi_counter >= 24) begin
            data_out <= {data_out[6:0], spi_miso};
          end
          if (spi_clk && spi_counter == 32) begin
            data_ready <= 1'b1;
          end
        end
      end else begin
        spi_counter <= 0;
        spi_mosi    <= 0;
        data_out    <= 8'bx;
      end
    end
  end
endmodule
