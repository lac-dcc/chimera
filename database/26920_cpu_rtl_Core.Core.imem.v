// This program was cloned from: https://github.com/shinrabansyo/cpu
// License: The Unlicense

module BindsTo_0_Core(
  input        clock,
  input        reset,
  output       io_tx,
  input        io_rx,
  output       io_sclk,
  output       io_mosi,
  input        io_miso,
  output [5:0] io_led
);

initial begin
  $readmemh("src/main/resources/bootrom.hex", Core.imem);
end
                      endmodule

bind Core BindsTo_0_Core BindsTo_0_Core_Inst(.*);