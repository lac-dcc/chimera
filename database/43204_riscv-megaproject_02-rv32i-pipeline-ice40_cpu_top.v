// This program was cloned from: https://github.com/rongcuid/riscv-megaproject
// License: BSD 3-Clause "New" or "Revised" License

/*
 * The top level module, meant to be synthesized
 */
module cpu_top
  (
   input wire clk,
   input wire resetb,
   output wire [7:0] gpio0
   );

   wire [7:0] io_addr;
   wire       io_en, io_we;
   wire [31:0] io_data_read;
   wire [31:0] io_data_write;
   wire        irq_mtimecmp;

   core_top CT0 
     (
      .clk(clk), .resetb(resetb),
      .io_addr(io_addr), .io_en(io_en), .io_we(io_we),
      .io_data_read(io_data_read), .io_data_write(io_data_write),
      .irq_mtimecmp(irq_mtimecmp)
      );

   io_port IO0
     (
      .clk(clk), .resetb(resetb),
      .io_addr(io_addr), .io_en(io_en), .io_we(io_we),
      .io_data_read(io_data_read), .io_data_write(io_data_write),
      .irq_mtimecmp(irq_mtimecmp),
      .gpio0(gpio0)
      );


endmodule
