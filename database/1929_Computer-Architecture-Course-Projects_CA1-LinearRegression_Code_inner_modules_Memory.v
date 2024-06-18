// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

module Memory (
    in_bus,
    addr,
    clk,
    rst,
    read_en,
    write_en,
    out_bus
);

  parameter word_len = 8;
  parameter mem_size = 128;
  parameter addr_len = 8;

  input [word_len - 1 : 0] in_bus;
  input [addr_len - 1 : 0] addr;
  input clk, rst, read_en, write_en;

  output reg [word_len - 1 : 0] out_bus;

  reg [word_len - 1 : 0] mem[0 : mem_size - 1];
  integer i;

  always @(posedge clk or posedge rst) begin
    out_bus = 'bz;
    if (rst) begin
      for (i = 0; i < mem_size; i = i + 1) mem[i] = 'b0;
    end

    if (write_en && read_en) out_bus = 'bz;
    else if (read_en) out_bus = mem[addr];
    else if (!rst & write_en) mem[addr] = in_bus;
  end

endmodule
