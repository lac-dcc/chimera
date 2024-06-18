// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

module Memory (
    address,
    write_bus,
    write_en,
    read_en,
    clk,
    out_bus
);
  parameter word_len = 32;
  parameter addr_len = 32;
  parameter word_count = 2 ** 20;

  input [addr_len - 1 : 0] address;
  input [word_len - 1 : 0] write_bus;
  input write_en, read_en, clk;

  output [word_len - 1 : 0] out_bus;

  reg [word_len - 1 : 0] memory[0 : word_count - 1];

  integer cur_addr = 0;

  integer start_address = 0;
  integer data_address = 500;
  integer i = 0;
  initial begin
    for(i = 0; i < word_count; i = i + 1) begin
      memory[i] = 'b0;
    end
    //address is relative to "ModelSim" directory
    $readmemb("../src/memory/inst.mem", memory, start_address);
    $readmemb("../src/memory/data.mem", memory, data_address);
  end

  assign out_bus = (read_en) ? memory[address] : 'bx;

  always @(posedge clk) begin
    if (write_en)
      memory[address] <= write_bus;
  end
endmodule
