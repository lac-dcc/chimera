// This program was cloned from: https://github.com/rongcuid/riscv-megaproject
// License: BSD 3-Clause "New" or "Revised" License

/*
* 64 Bit system timer sitting on IO address space
* mtime - 0x80000010
* mtimecmp - 0x80000018
* TODO: interrupts
*/

module timer(
  input wire clk,
  input wire resetb,
  // No io_en signal since read has no side effect
  input wire [3:2] io_addr_3_2,
    input wire io_we,
    input wire [31:0] io_din,
    output wire [31:0] io_dout,
    // mtimecmp port
    // IRQ
    output reg irq_mtimecmp
    );

    reg [63:0] mtime;
    reg [63:0] mtimecmp;

    always @ (posedge clk) begin : TIMER_PIPELINE
      if (!resetb) begin
        mtime <= 64'b0;
        // mtimecmp <= 64'hFFFFFFFFFFFFFFFF;
        mtimecmp <= 64'b0;
        irq_mtimecmp <= 1'b0;
      end
      else if (clk) begin
        mtime <= mtime + 1;
        if (io_we) begin
          case (io_addr_3_2[3:2])
            2'b00: mtime[0+:32] <= io_din;
            2'b01: mtime[32+:32] <= io_din;
            2'b10: begin 
            mtimecmp[0+:32] <= io_din;
            irq_mtimecmp <= 1'b0;
          end
          2'b11: begin 
          mtimecmp[32+:32] <= io_din;
          irq_mtimecmp <= 1'b0;
        end
      endcase
    end
    if (mtime == mtimecmp) begin
      irq_mtimecmp <= 1'b1;
    end
  end
end

assign io_dout = 
  io_addr_3_2[3]
  ? ( io_addr_3_2[2] ? mtimecmp[32+:32] : mtimecmp[0+:32] )
  : ( io_addr_3_2[2] ? mtime[32+:32] : mtime[0+:32] );

  endmodule
