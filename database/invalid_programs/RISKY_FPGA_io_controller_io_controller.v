// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

`include "../vga/display_module.v"
`include "../timer/ms_counter.v"
`include "../timer/tick_counter.v"
`include "../keyboard/ps2_rx.v"
`include "../keyboard/keyboard.v"
`include "../keyboard/key2ascii.v"
`include "../fifo/fifo.v"
`include "../game_rom/game_rom.v"

module io_controller (
  input [31:0] addr_in,
  input [31:0] data_in,
  input [31:0] ia,
  input wr,
  input [15:0] wr_mask,
  input clk,
  input reset,
  output irq,
  output [7:0] rgb,
  output [31:0] mrd,
  output [31:0] id,
  output hsync,
  output vsync,
  output ram_en
);

wire [31:0] ms;
wire tick;
wire ram_en;
wire [31:0] id_bus;

assign ram_en = wr && (addr_in[31:28] == 4'b0000);
assign id = id_bus;

display_module dm0 (
  .clk(clk),
  .rst(reset),
  .data(data_in),
  .waddr(addr_in),
  .w_en(wr),
  .rgb(rgb),
  .hsync(hsync),
  .vsync(vsync)
);

game_rom game0 (
  .clk(clk),
  .ia(ia),
  .game_data(id_bus)
);


endmodule
