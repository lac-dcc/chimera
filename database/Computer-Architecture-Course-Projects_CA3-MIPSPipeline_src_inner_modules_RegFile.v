// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

module RegFile (
    reg1_addr,
    reg2_addr,
    write_bus,
    write_addr,
    write_en,
    clk,
    rst,
    data1,
    data2
);
  parameter word_len = 32;
  parameter word_count = 32;
  parameter addr_len = 5;

  input [addr_len - 1 : 0] reg1_addr, reg2_addr, write_addr;
  input [word_len - 1 : 0] write_bus;
  input write_en, clk, rst;

  output [word_len - 1 : 0] data1, data2;

  integer curr_addr = 0;
  reg [word_len - 1 : 0] memory[0 : word_count - 1];

  assign data1 = memory[reg1_addr];
  assign data2 = memory[reg2_addr];

  always @(posedge clk, posedge rst) begin
    if (rst) begin
      for (curr_addr = 0; curr_addr <= (2 ** addr_len) - 1; curr_addr = curr_addr + 1) begin
        memory[curr_addr] <= 'b0;
      end
    end

    if (write_en) memory[write_addr] <= write_bus;
  end
endmodule
