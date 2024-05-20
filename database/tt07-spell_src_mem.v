// This program was cloned from: https://github.com/urish/tt07-spell
// License: Apache License 2.0

// SPDX-FileCopyrightText: © 2021 Uri Shaked <uri@wokwi.com>
// SPDX-License-Identifier: MIT

`default_nettype none

module spell_mem (
    input wire rst_n,
    input wire clk,
    input wire select,
    input wire [7:0] addr,
    input wire [7:0] data_in,
    input wire memory_type_data,
    input wire write,
    output reg [7:0] data_out,
    output wire data_ready,

    /* External memory */
    input  wire spi_miso,
    output wire spi_cs,
    output wire spi_clk,
    output wire spi_mosi,

    /* IO */
    input  wire [7:0] io_in,
    output wire [7:0] io_out,
    output wire [7:0] io_oe    // out enable bar (low active)
);

  wire code_select = select && !memory_type_data;

  wire data_select = select && memory_type_data;
  wire data_mem_select = data_select && (addr < 8'h20 || addr >= 8'h60);
  wire data_io_select = data_select && (addr >= 8'h20 && addr < 8'h60);

  wire mem_select = code_select || data_mem_select;
  wire intmem_select = mem_select && !spimem_enabled;
  wire spimem_select = mem_select && spimem_enabled;

  wire io_data_ready;
  wire internal_data_ready;
  wire spimem_data_ready;
  reg spimem_enabled;
  assign data_ready = io_data_ready | internal_data_ready | spimem_data_ready;

  wire [7:0] io_data_out;
  wire [7:0] internal_data_out;
  wire [7:0] spimem_data_out;


  spell_mem_io mem_io (
      .rst_n(rst_n),
      .clk(clk),
      .select(data_io_select),
      .addr(addr),
      .data_in(data_in),
      .write(write),
      .data_out(io_data_out),
      .data_ready(io_data_ready),

      /* IO */
      .io_in (io_in),
      .io_out(io_out),
      .io_oe (io_oe)
  );

  spell_mem_internal mem_internal (
      .rst_n(rst_n),
      .clk(clk),
      .select(intmem_select),
      .addr(addr),
      .data_in(data_in),
      .memory_type_data(memory_type_data),
      .write(write),
      .data_out(internal_data_out),
      .data_ready(internal_data_ready)
  );

  spell_mem_spi mem_spi (
      .rst_n(rst_n),
      .clk(clk),
      .select(spimem_select),
      .addr(addr),
      .data_in(data_in),
      .memory_type_data(memory_type_data),
      .write(write),
      .data_out(spimem_data_out),
      .data_ready(spimem_data_ready),

      /* External memory interface */
      .spi_miso(spi_miso),
      .spi_cs  (spi_cs),
      .spi_clk (spi_clk),
      .spi_mosi(spi_mosi)
  );

  always @(*) begin
    if (data_io_select) begin
      data_out = io_data_out;
    end else begin
      if (intmem_select) begin
        data_out = internal_data_out;
      end else begin
        data_out = spimem_data_out;
      end
    end
  end

  always @(posedge clk) begin
    if (!rst_n) begin
      spimem_enabled = spi_miso;
    end
  end

endmodule
