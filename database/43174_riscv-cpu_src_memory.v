// This program was cloned from: https://github.com/matiasilva/riscv-cpu
// License: GNU General Public License v3.0

/*
this can be implemented as BRAM on FPGA
*/

module memory #(
    parameter PRELOAD = 0,
    parameter PRELOAD_FILE = ""
) (
    input rst_n,
    input clk,
    input ctrl_mem_ren_i,
    input ctrl_mem_wren_i,
    input [31:0] mem_addr_i,
    input [31:0] mem_wdata_i,
    output [31:0] mem_rdata_o
);

  localparam MEM_SIZE = 512;

  // 512 bytes, 128 words
  reg [7:0] mem[MEM_SIZE - 1:0];
  reg [31:0] next_rdata;

  integer i;

  initial begin
    if (PRELOAD) begin
      if (PRELOAD_FILE === "") begin
        $display("no preload file provided!");
        $finish;
      end
      $readmemh(PRELOAD_FILE, mem, 0, 31);
    end
  end

  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
`ifdef FPGA
      for (i = 0; i < MEM_SIZE; i++) begin
        mem[i] <= 0;
      end
`endif
      next_rdata <= 0;
    end else begin
      if (ctrl_mem_ren_i) begin
        next_rdata <= {mem[mem_addr_i+3], mem[mem_addr_i+2], mem[mem_addr_i+1], mem[mem_addr_i]};
      end else if (ctrl_mem_wren_i) begin
        for (i = 0; i < 4; i++) begin
          mem[mem_addr_i+i] <= mem_wdata_i[i*8+:8];
        end
      end
    end
  end

  assign mem_rdata_o = next_rdata;

endmodule
