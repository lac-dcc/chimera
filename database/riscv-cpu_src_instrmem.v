// This program was cloned from: https://github.com/matiasilva/riscv-cpu
// License: GNU General Public License v3.0

/*
this can be implemented as BRAM on FPGA
*/

module instrmem #(
    parameter PRELOAD = 0,
    parameter PRELOAD_FILE = "",
    parameter HARDCODED = 0
) (
    input clk,  // Clock
    input rst_n,  // Asynchronous reset active low
    input [31:0] pc_i,
    output [31:0] instr_o
);

  localparam MEM_SIZE = 512;

  // 512 bytes, 128 words
  reg [31:0] mem[MEM_SIZE - 1:0];
  reg [31:0] next_instr;

  wire [31:0] pc_aligned = pc_i >> 2;

  integer i;

  initial begin
    if (PRELOAD) begin
      if (PRELOAD_FILE === "") begin
        $display("no preload file provided!");
        $finish;
      end
      $readmemh(PRELOAD_FILE, mem, 0, MEM_SIZE - 1);
    end
    if (HARDCODED) begin
      mem[0] <= 32'h07b00093;  // addi x1, x0, 123
      mem[1] <= 32'h00500113;  // addi x2, x0, 5
      mem[2] <= 32'h002081b3;  // add x3, x2, x1
    end
  end

  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
`ifdef FPGA
      for (i = 0; i < MEM_SIZE; i++) begin
        mem[i] <= 0;
      end
`endif
      next_instr <= 32'h00000013;  //  NOP
    end else begin
      next_instr <= mem[pc_aligned];
    end
  end

  assign instr_o = next_instr;

endmodule
