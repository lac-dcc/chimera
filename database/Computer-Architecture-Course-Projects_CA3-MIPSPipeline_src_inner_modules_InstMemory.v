// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

module InstMemory (
    addr,
    clk,
    out_bus
);
  input [31:0] addr;
  input clk;

  output reg [31:0] out_bus;

  initial begin
    //address is relative to "ModelSim" directory
    $readmemb("../src/mem/inst_mem.mem", memory);
  end

  reg [7:0] memory[0:300];

  always @(posedge clk, addr) begin
    out_bus <= {memory[addr], memory[addr+1], memory[addr+2], memory[addr+3]};
  end
endmodule
