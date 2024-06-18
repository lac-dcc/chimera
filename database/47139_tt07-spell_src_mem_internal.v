// This program was cloned from: https://github.com/urish/tt07-spell
// License: Apache License 2.0

// SPDX-FileCopyrightText: © 2021 Uri Shaked <uri@wokwi.com>
// SPDX-License-Identifier: MIT

`default_nettype none

module spell_mem_internal (
    input wire rst_n,
    input wire clk,
    input wire select,
    input wire [7:0] addr,
    input wire [7:0] data_in,
    input wire memory_type_data,
    input wire write,
    output reg [7:0] data_out,
    output reg data_ready
);

  localparam code_size = 32;
  localparam data_size = 8;

  localparam code_bits = $clog2(code_size);
  localparam data_bits = $clog2(data_size);

  reg [7:0] code_mem[code_size-1:0];
  reg [7:0] data_mem[data_size-1:0];

  wire [code_bits-1:0] code_addr = addr[code_bits-1:0];
  wire [data_bits-1:0] data_addr = addr[data_bits-1:0];

  reg [1:0] cycles;

  integer i;

  always @(posedge clk) begin
    if (~rst_n) begin
      cycles <= 0;
      data_ready <= 0;
      for (i = 0; i < code_size; i++) code_mem[i] <= 8'h00;
      for (i = 0; i < data_size; i++) data_mem[i] <= 8'h00;
    end else begin
      if (!select) begin
        data_out   <= 8'bx;
        data_ready <= 1'b0;
`ifdef SPELL_INTERNAL_MEM_DELAY
        cycles <= 2'b11;
`endif  /* SPELL_INTERNAL_MEM_DELAY */
      end else if (cycles > 0) begin
        cycles <= cycles - 1;
      end else begin
        data_ready <= 1'b1;
        if (write) begin
          if (memory_type_data && addr < data_size) begin
            data_mem[data_addr] <= data_in;
          end else if (!memory_type_data && addr < code_size) begin
            // Code memory is inverted, to make uninitialized memory appear as 0xff
            code_mem[code_addr] <= ~data_in;
          end
        end else begin
          data_out <= memory_type_data ? 8'h00 : 8'hff;
          if (memory_type_data && addr < data_size) begin
            data_out <= data_mem[data_addr];
          end else if (!memory_type_data && addr < code_size) begin
            data_out <= ~code_mem[code_addr];
          end
        end
      end
    end
  end
endmodule
