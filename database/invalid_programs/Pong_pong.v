`include "font_rom.v"
`include "font_test_gen.v"
`include "font_test_top.v"
`include "m100_counter.v"
`include "pong_graph.v"
`include "pong_text.v"
`include "pong_top.v"
`include "text_screen_gen.v"
`include "text_screen_top.v"
`include "timer.v"
`include "bitmap_gen.v"
`include "dot_top.v"
`include "vga_sync.v"
`include "vga_test.v"
`include "xilinx_dual_port_ram_sync.v"
`include "debounce.v"

module pong();
	pong_top pong();
endmodule
