// Verilog netlist created by TD v4.5.12854
// Fri Aug  9 16:25:46 2019

`timescale 1ns / 1ps
module top  // sources/rtl/top.v(22)
  (
  clk,
  key,
  rx,
  led,
  tx,
  vga_clk,
  vga_hs,
  vga_rgb,
  vga_vs
  );

  input clk;  // sources/rtl/top.v(24)
  input [5:0] key;  // sources/rtl/top.v(37)
  input rx;  // sources/rtl/top.v(27)
  output led;  // sources/rtl/top.v(40)
  output tx;  // sources/rtl/top.v(28)
  output vga_clk;  // sources/rtl/top.v(31)
  output vga_hs;  // sources/rtl/top.v(32)
  output [23:0] vga_rgb;  // sources/rtl/top.v(34)
  output vga_vs;  // sources/rtl/top.v(33)

  wire [10:0] axis_x;  // sources/rtl/top.v(80)
  wire [10:0] axis_y;  // sources/rtl/top.v(81)
  wire [7:0] bus_raddr;  // sources/rtl/top.v(73)
  wire [7:0] bus_rdata;  // sources/rtl/top.v(74)
  wire [7:0] bus_wdata;  // sources/rtl/top.v(71)
  wire [5:0] key_deb;  // sources/rtl/top.v(85)
  wire [7:0] ram_rdata;  // sources/rtl/top.v(66)
  wire [7:0] ram_waddr;  // sources/rtl/top.v(62)
  wire [7:0] ram_wdata;  // sources/rtl/top.v(63)
  wire [7:0] recv_cmd;  // sources/rtl/top.v(45)
  wire [7:0] recv_data;  // sources/rtl/top.v(46)
  wire [23:0] rom_raddr;  // sources/rtl/top.v(57)
  wire [7:0] rom_rdata;  // sources/rtl/top.v(58)
  wire [23:0] rom_waddr;  // sources/rtl/top.v(54)
  wire [7:0] rom_wdata;  // sources/rtl/top.v(55)
  wire [7:0] send_cmd;  // sources/rtl/top.v(48)
  wire [7:0] send_data;  // sources/rtl/top.v(49)
  wire [7:0] \u_bus/n15 ;
  wire  \u_bus/sel1_b0/B1 ;
  wire  \u_bus/sel1_b0/B2 ;
  wire  \u_bus/sel1_b0/B3 ;
  wire [10:0] \u_cpu/alu_cmd ;  // sources/rtl/mcu/cpu.v(76)
  wire [7:0] \u_cpu/alu_in2 ;  // sources/rtl/mcu/cpu.v(78)
  wire [8:0] \u_cpu/alu_out0 ;  // sources/rtl/mcu/cpu.v(79)
  wire [15:0] \u_cpu/alu_out1 ;  // sources/rtl/mcu/cpu.v(80)
  wire [7:0] \u_cpu/alu_out2 ;  // sources/rtl/mcu/cpu.v(81)
  wire [7:0] \u_cpu/alu_out3 ;  // sources/rtl/mcu/cpu.v(82)
  wire [7:0] \u_cpu/alu_out4 ;  // sources/rtl/mcu/cpu.v(83)
  wire [15:0] \u_cpu/dbg_info ;  // sources/rtl/mcu/cpu.v(94)
  wire [7:0] \u_cpu/dbg_inst ;  // sources/rtl/mcu/cpu.v(91)
  wire [23:0] \u_cpu/dbg_rom_raddr ;  // sources/rtl/mcu/cpu.v(88)
  wire [7:0] \u_cpu/dbg_rom_rdata ;  // sources/rtl/mcu/cpu.v(89)
  wire [39:0] \u_cpu/decode_cmd ;  // sources/rtl/mcu/cpu.v(67)
  wire [7:0] \u_cpu/decode_data ;  // sources/rtl/mcu/cpu.v(68)
  wire [7:0] \u_cpu/inst ;  // sources/rtl/mcu/cpu.v(64)
  wire [23:0] \u_cpu/pc_wdata ;  // sources/rtl/mcu/cpu.v(62)
  wire [3:0] \u_cpu/read_abcd ;  // sources/rtl/mcu/cpu.v(93)
  wire [23:0] \u_cpu/timer_wdata ;  // sources/rtl/mcu/cpu.v(72)
  wire [15:0] \u_cpu/u_alu/n17 ;
  wire [7:0] \u_cpu/u_alu/n37 ;
  wire [7:0] \u_cpu/u_alu/n38 ;
  wire [7:0] \u_cpu/u_alu/n4 ;
  wire [8:0] \u_cpu/u_alu/n5 ;
  wire [7:0] \u_cpu/u_alu/n50 ;
  wire [7:0] \u_cpu/u_alu/n54 ;
  wire [7:0] \u_cpu/u_alu/n55 ;
  wire [7:0] \u_cpu/u_alu/n56 ;
  wire [7:0] \u_cpu/u_alu/n57 ;
  wire [7:0] \u_cpu/u_alu/n58 ;
  wire [8:0] \u_cpu/u_alu/n6 ;
  wire [7:0] \u_cpu/u_alu/n67 ;
  wire [7:0] \u_cpu/u_alu/n68 ;
  wire [7:0] \u_cpu/u_alu/n69 ;
  wire [8:0] \u_cpu/u_alu/n7 ;
  wire [7:0] \u_cpu/u_alu/n70 ;
  wire [23:0] \u_cpu/u_debug/n13 ;
  wire [7:0] \u_cpu/u_debug/n18 ;
  wire [7:0] \u_cpu/u_debug/n19 ;
  wire [7:0] \u_cpu/u_debug/n20 ;
  wire [7:0] \u_cpu/u_debug/n21 ;
  wire [3:0] \u_cpu/u_debug/n4 ;
  wire [23:0] \u_cpu/u_debug/n7 ;
  wire [7:0] \u_cpu/u_decode/inst_d ;  // sources/rtl/mcu/decode.v(37)
  wire [7:0] \u_cpu/u_execute/C ;  // sources/rtl/mcu/execute.v(72)
  wire [7:0] \u_cpu/u_execute/n1 ;
  wire [7:0] \u_cpu/u_execute/n15 ;
  wire [7:0] \u_cpu/u_execute/n16 ;
  wire [7:0] \u_cpu/u_execute/n17 ;
  wire [7:0] \u_cpu/u_execute/n2 ;
  wire [7:0] \u_cpu/u_execute/n27 ;
  wire [7:0] \u_cpu/u_execute/n28 ;
  wire [7:0] \u_cpu/u_execute/n29 ;
  wire [7:0] \u_cpu/u_execute/n3 ;
  wire [15:0] \u_cpu/u_execute/n35 ;
  wire [15:0] \u_cpu/u_execute/n36 ;
  wire [15:0] \u_cpu/u_execute/n37 ;
  wire [15:0] \u_cpu/u_execute/n38 ;
  wire [15:0] \u_cpu/u_execute/n39 ;
  wire [7:0] \u_cpu/u_execute/n4 ;
  wire [7:0] \u_cpu/u_execute/n43 ;
  wire [7:0] \u_cpu/u_execute/n44 ;
  wire [7:0] \u_cpu/u_execute/n45 ;
  wire [7:0] \u_cpu/u_execute/n46 ;
  wire [7:0] \u_cpu/u_execute/n47 ;
  wire [7:0] \u_cpu/u_execute/n48 ;
  wire [7:0] \u_cpu/u_execute/n49 ;
  wire [7:0] \u_cpu/u_execute/n5 ;
  wire [7:0] \u_cpu/u_execute/n50 ;
  wire [7:0] \u_cpu/u_execute/n51 ;
  wire [7:0] \u_cpu/u_execute/n52 ;
  wire [7:0] \u_cpu/u_execute/n6 ;
  wire [7:0] \u_cpu/u_execute/n7 ;
  wire [7:0] \u_cpu/u_execute/rom_data ;  // sources/rtl/mcu/execute.v(74)
  wire [9:0] \u_cpu/u_execute/wt_ram_cmd ;  // sources/rtl/mcu/execute.v(130)
  wire [23:0] \u_cpu/u_fetch/n1 ;
  wire [7:0] \u_cpu/u_fetch/n10 ;
  wire [23:0] \u_cpu/u_fetch/n2 ;
  wire [23:0] \u_cpu/u_fetch/n3 ;
  wire [23:0] \u_cpu/u_fetch/n6 ;
  wire [23:0] \u_cpu/u_fetch/n7 ;
  wire [7:0] \u_cpu/u_fetch/n9 ;
  wire [23:0] \u_cpu/u_fetch/pc ;  // sources/rtl/mcu/fetch.v(51)
  wire [23:0] \u_cpu/u_timer/cnt ;  // sources/rtl/mcu/timer.v(33)
  wire [24:0] \u_cpu/u_timer/n1 ;
  wire [23:0] \u_cpu/u_timer/n2 ;
  wire [23:0] \u_cpu/u_timer/n3 ;
  wire [18:0] \u_key/cnt ;  // sources/rtl/key/key.v(34)
  wire [5:0] \u_key/key_d0 ;  // sources/rtl/key/key.v(35)
  wire [5:0] \u_key/key_d1 ;  // sources/rtl/key/key.v(36)
  wire [5:0] \u_key/n15 ;
  wire [18:0] \u_key/n3 ;
  wire [7:0] \u_uart/rx_data ;  // sources/rtl/uart/uart.v(48)
  wire [7:0] \u_uart/tx_data ;  // sources/rtl/uart/uart.v(50)
  wire [31:0] \u_uart/u_uart_rx/clk_cnt ;  // sources/rtl/uart/uart_rx.v(43)
  wire [3:0] \u_uart/u_uart_rx/cnt ;  // sources/rtl/uart/uart_rx.v(40)
  wire [7:0] \u_uart/u_uart_rx/data ;  // sources/rtl/uart/uart_rx.v(41)
  wire [3:0] \u_uart/u_uart_rx/n13 ;
  wire [31:0] \u_uart/u_uart_rx/n7 ;
  wire [31:0] \u_uart/u_uart_rx/n8 ;
  wire [1:0] \u_uart/u_uart_rx/rx_d ;  // sources/rtl/uart/uart_rx.v(42)
  wire [31:0] \u_uart/u_uart_tx/clk_cnt ;  // sources/rtl/uart/uart_tx.v(43)
  wire [3:0] \u_uart/u_uart_tx/cnt ;  // sources/rtl/uart/uart_tx.v(41)
  wire [7:0] \u_uart/u_uart_tx/data ;  // sources/rtl/uart/uart_tx.v(42)
  wire [31:0] \u_uart/u_uart_tx/n1 ;
  wire [3:0] \u_uart/u_uart_tx/n10 ;
  wire [2:0] \u_uart/u_ubus/n39 ;
  wire [3:0] \u_uart/u_ubus/n45 ;
  wire [7:0] \u_uart/u_ubus/n57 ;
  wire [3:0] \u_uart/u_ubus/send_cnt ;  // sources/rtl/uart/ubus.v(74)
  wire [7:0] \u_uart/u_ubus/shift_reg0 ;  // sources/rtl/uart/ubus.v(57)
  wire [7:0] \u_uart/u_ubus/shift_reg1 ;  // sources/rtl/uart/ubus.v(58)
  wire [7:0] \u_uart/u_ubus/shift_reg2 ;  // sources/rtl/uart/ubus.v(59)
  wire [7:0] \u_uart/u_ubus/shift_reg3 ;  // sources/rtl/uart/ubus.v(60)
  wire [7:0] \u_uart/u_ubus/shift_reg4 ;  // sources/rtl/uart/ubus.v(61)
  wire [7:0] \u_uart/u_ubus/shift_reg5 ;  // sources/rtl/uart/ubus.v(62)
  wire [7:0] \u_uart/u_ubus/shift_reg6 ;  // sources/rtl/uart/ubus.v(63)
  wire [7:0] \u_uart/u_ubus/shift_reg7 ;  // sources/rtl/uart/ubus.v(64)
  wire [15:0] \u_uart/u_ubus/tx_buffer ;  // sources/rtl/uart/ubus.v(76)
  wire [2:0] \u_uart/u_ubus/tx_ready_cnt ;  // sources/rtl/uart/ubus.v(77)
  wire [12:0] \u_vga/hsyn_cnt ;  // sources/rtl/vga/vga.v(57)
  wire [12:0] \u_vga/n1 ;
  wire [13:0] \u_vga/n18 ;
  wire [13:0] \u_vga/n21 ;
  wire [12:0] \u_vga/n4 ;
  wire [12:0] \u_vga/n5 ;
  wire [12:0] \u_vga/vsyn_cnt ;  // sources/rtl/vga/vga.v(58)
  wire [10:0] \u_vram/axis_x_d0 ;  // sources/rtl/vga/vram.v(59)
  wire [10:0] \u_vram/axis_x_d1 ;  // sources/rtl/vga/vram.v(62)
  wire [10:0] \u_vram/axis_x_d2 ;  // sources/rtl/vga/vram.v(65)
  wire [10:0] \u_vram/axis_y_d0 ;  // sources/rtl/vga/vram.v(60)
  wire [10:0] \u_vram/axis_y_d1 ;  // sources/rtl/vga/vram.v(63)
  wire [10:0] \u_vram/axis_y_d2 ;  // sources/rtl/vga/vram.v(66)
  wire [4:0] \u_vram/mesh_x ;  // sources/rtl/vga/vram.v(47)
  wire [4:0] \u_vram/mesh_y ;  // sources/rtl/vga/vram.v(48)
  wire [22:0] \u_vram/n26 ;
  wire [5:0] \u_vram/n3 ;
  wire [5:0] \u_vram/n4 ;
  wire [9:0] \u_vram/n5 ;
  wire [9:0] \u_vram/n6 ;
  wire [7:0] vram_addr;  // sources/rtl/top.v(92)
  wire axis_en;  // sources/rtl/top.v(79)
  wire bus_ren;  // sources/rtl/top.v(72)
  wire bus_wen;  // sources/rtl/top.v(69)
  wire clear;  // sources/rtl/top.v(84)
  wire hsyn;  // sources/rtl/top.v(77)
  wire ram_ren;  // sources/rtl/top.v(64)
  wire ram_wen;  // sources/rtl/top.v(61)
  wire recv_en;  // sources/rtl/top.v(44)
  wire rom_ren;  // sources/rtl/top.v(56)
  wire rom_wen;  // sources/rtl/top.v(53)
  wire send_en;  // sources/rtl/top.v(47)
  wire send_ready;  // sources/rtl/top.v(50)
  wire \u_bus/mux0_b0_sel_is_3_o ;
  wire \u_bus/n0 ;
  wire \u_bus/n1 ;
  wire \u_bus/n18 ;
  wire \u_bus/n2 ;
  wire \u_bus/n22 ;
  wire \u_bus/sel1_b0/or_B2_B3_o ;
  wire \u_bus/u6_sel_is_3_o ;
  wire \u_cpu/alu_in2[2]_neg ;
  wire \u_cpu/dbg_en ;  // sources/rtl/mcu/cpu.v(86)
  wire \u_cpu/dbg_info_en ;  // sources/rtl/mcu/cpu.v(92)
  wire \u_cpu/dbg_inst_en ;  // sources/rtl/mcu/cpu.v(90)
  wire \u_cpu/dbg_rom_ren ;  // sources/rtl/mcu/cpu.v(87)
  wire \u_cpu/inst_en ;  // sources/rtl/mcu/cpu.v(63)
  wire \u_cpu/pc_wen ;  // sources/rtl/mcu/cpu.v(61)
  wire \u_cpu/read_abcd[0]_neg ;
  wire \u_cpu/read_abcd[1]_neg ;
  wire \u_cpu/read_abcd[2]_neg ;
  wire \u_cpu/read_abcd[3]_neg ;
  wire \u_cpu/timer_state ;  // sources/rtl/mcu/cpu.v(73)
  wire \u_cpu/timer_wen ;  // sources/rtl/mcu/cpu.v(71)
  wire \u_cpu/u_alu/n0 ;
  wire \u_cpu/u_alu/n1 ;
  wire \u_cpu/u_alu/n14 ;
  wire \u_cpu/u_alu/n15 ;
  wire \u_cpu/u_alu/n16 ;
  wire \u_cpu/u_alu/n19 ;
  wire \u_cpu/u_alu/n2 ;
  wire \u_cpu/u_alu/n20 ;
  wire \u_cpu/u_alu/n21 ;
  wire \u_cpu/u_alu/n22 ;
  wire \u_cpu/u_alu/n23 ;
  wire \u_cpu/u_alu/n24 ;
  wire \u_cpu/u_alu/n25 ;
  wire \u_cpu/u_alu/n26 ;
  wire \u_cpu/u_alu/n27 ;
  wire \u_cpu/u_alu/n28 ;
  wire \u_cpu/u_alu/n29 ;
  wire \u_cpu/u_alu/n3 ;
  wire \u_cpu/u_alu/n30 ;
  wire \u_cpu/u_alu/n31 ;
  wire \u_cpu/u_alu/n32 ;
  wire \u_cpu/u_alu/n33 ;
  wire \u_cpu/u_alu/n34 ;
  wire \u_cpu/u_alu/n35 ;
  wire \u_cpu/u_alu/n36 ;
  wire \u_cpu/u_alu/n39 ;
  wire \u_cpu/u_alu/n40 ;
  wire \u_cpu/u_alu/n40_neg ;
  wire \u_cpu/u_alu/n41 ;
  wire \u_cpu/u_alu/n42 ;
  wire \u_cpu/u_alu/n43 ;
  wire \u_cpu/u_alu/n47 ;
  wire \u_cpu/u_alu/n48 ;
  wire \u_cpu/u_alu/n49 ;
  wire \u_cpu/u_alu/n51 ;
  wire \u_cpu/u_alu/n52 ;
  wire \u_cpu/u_alu/n53 ;
  wire \u_cpu/u_alu/n59 ;
  wire \u_cpu/u_alu/n60 ;
  wire \u_cpu/u_alu/n61 ;
  wire \u_cpu/u_alu/n62 ;
  wire \u_cpu/u_alu/n63 ;
  wire \u_cpu/u_alu/n64 ;
  wire \u_cpu/u_alu/n65 ;
  wire \u_cpu/u_alu/n71 ;
  wire \u_cpu/u_alu/n72 ;
  wire \u_cpu/u_alu/n73 ;
  wire \u_cpu/u_alu/n74 ;
  wire \u_cpu/u_alu/n75 ;
  wire \u_cpu/u_alu/n76 ;
  wire \u_cpu/u_alu/n77 ;
  wire \u_cpu/u_alu/n78 ;
  wire \u_cpu/u_alu/n81 ;
  wire \u_cpu/u_alu/n82 ;
  wire \u_cpu/u_alu/n83 ;
  wire \u_cpu/u_alu/n84 ;
  wire \u_cpu/u_alu/n86 ;
  wire \u_cpu/u_alu/n87 ;
  wire \u_cpu/u_alu/n88 ;
  wire \u_cpu/u_alu/n89 ;
  wire \u_cpu/u_alu/n90 ;
  wire \u_cpu/u_alu/n91 ;
  wire \u_cpu/u_alu/n92 ;
  wire \u_cpu/u_alu/u40_sel_is_0_o ;
  wire \u_cpu/u_debug/clear_rom_addr_cmd ;  // sources/rtl/mcu/debug.v(58)
  wire \u_cpu/u_debug/clear_rom_data_cmd ;  // sources/rtl/mcu/debug.v(59)
  wire \u_cpu/u_debug/debug_cmd ;  // sources/rtl/mcu/debug.v(57)
  wire \u_cpu/u_debug/free_run_cmd ;  // sources/rtl/mcu/debug.v(56)
  wire \u_cpu/u_debug/n12 ;
  wire \u_cpu/u_debug/n16 ;
  wire \u_cpu/u_debug/n17 ;
  wire \u_cpu/u_debug/n2 ;
  wire \u_cpu/u_debug/n5 ;
  wire \u_cpu/u_debug/read_a_cmd ;  // sources/rtl/mcu/debug.v(62)
  wire \u_cpu/u_debug/read_b_cmd ;  // sources/rtl/mcu/debug.v(63)
  wire \u_cpu/u_debug/read_c_cmd ;  // sources/rtl/mcu/debug.v(64)
  wire \u_cpu/u_debug/read_d_cmd ;  // sources/rtl/mcu/debug.v(65)
  wire \u_cpu/u_debug/read_rom_cmd ;  // sources/rtl/mcu/debug.v(60)
  wire \u_cpu/u_debug/rom_bk_en ;  // sources/rtl/mcu/debug.v(68)
  wire \u_cpu/u_debug/rom_ren_d0 ;  // sources/rtl/mcu/debug.v(66)
  wire \u_cpu/u_debug/rom_ren_d1 ;  // sources/rtl/mcu/debug.v(67)
  wire \u_cpu/u_debug/write_rom_cmd ;  // sources/rtl/mcu/debug.v(61)
  wire \u_cpu/u_decode/inst_data ;  // sources/rtl/mcu/decode.v(78)
  wire \u_cpu/u_decode/n1 ;
  wire \u_cpu/u_decode/n12 ;
  wire \u_cpu/u_decode/n15 ;
  wire \u_cpu/u_decode/n16 ;
  wire \u_cpu/u_decode/n17 ;
  wire \u_cpu/u_decode/n18 ;
  wire \u_cpu/u_decode/n19 ;
  wire \u_cpu/u_decode/n2 ;
  wire \u_cpu/u_decode/n20 ;
  wire \u_cpu/u_decode/n21 ;
  wire \u_cpu/u_decode/n22 ;
  wire \u_cpu/u_decode/n23 ;
  wire \u_cpu/u_decode/n24 ;
  wire \u_cpu/u_decode/n25 ;
  wire \u_cpu/u_decode/n26 ;
  wire \u_cpu/u_decode/n27 ;
  wire \u_cpu/u_decode/n28 ;
  wire \u_cpu/u_decode/n29 ;
  wire \u_cpu/u_decode/n3 ;
  wire \u_cpu/u_decode/n30 ;
  wire \u_cpu/u_decode/n31 ;
  wire \u_cpu/u_decode/n32 ;
  wire \u_cpu/u_decode/n33 ;
  wire \u_cpu/u_decode/n34 ;
  wire \u_cpu/u_decode/n35 ;
  wire \u_cpu/u_decode/n36 ;
  wire \u_cpu/u_decode/n37 ;
  wire \u_cpu/u_decode/n38 ;
  wire \u_cpu/u_decode/n39 ;
  wire \u_cpu/u_decode/n4 ;
  wire \u_cpu/u_decode/n40 ;
  wire \u_cpu/u_decode/n41 ;
  wire \u_cpu/u_decode/n42 ;
  wire \u_cpu/u_decode/n43 ;
  wire \u_cpu/u_decode/n44 ;
  wire \u_cpu/u_decode/n45 ;
  wire \u_cpu/u_decode/n46 ;
  wire \u_cpu/u_decode/n47 ;
  wire \u_cpu/u_decode/n48 ;
  wire \u_cpu/u_decode/n49 ;
  wire \u_cpu/u_decode/n5 ;
  wire \u_cpu/u_decode/n50 ;
  wire \u_cpu/u_decode/n51 ;
  wire \u_cpu/u_decode/n52 ;
  wire \u_cpu/u_decode/n53 ;
  wire \u_cpu/u_decode/n54 ;
  wire \u_cpu/u_decode/n55 ;
  wire \u_cpu/u_decode/n56 ;
  wire \u_cpu/u_decode/n57 ;
  wire \u_cpu/u_decode/n58 ;
  wire \u_cpu/u_decode/n59 ;
  wire \u_cpu/u_decode/n6 ;
  wire \u_cpu/u_decode/n60 ;
  wire \u_cpu/u_decode/n61 ;
  wire \u_cpu/u_decode/n62 ;
  wire \u_cpu/u_decode/n63 ;
  wire \u_cpu/u_decode/n64 ;
  wire \u_cpu/u_decode/n65 ;
  wire \u_cpu/u_decode/n66 ;
  wire \u_cpu/u_decode/n67 ;
  wire \u_cpu/u_decode/n68 ;
  wire \u_cpu/u_decode/n69 ;
  wire \u_cpu/u_decode/n7 ;
  wire \u_cpu/u_decode/n70 ;
  wire \u_cpu/u_decode/n71 ;
  wire \u_cpu/u_decode/n72 ;
  wire \u_cpu/u_decode/n73 ;
  wire \u_cpu/u_decode/n74 ;
  wire \u_cpu/u_decode/n75 ;
  wire \u_cpu/u_decode/n76 ;
  wire \u_cpu/u_decode/n77 ;
  wire \u_cpu/u_decode/n78 ;
  wire \u_cpu/u_decode/n79 ;
  wire \u_cpu/u_decode/n8 ;
  wire \u_cpu/u_decode/n80 ;
  wire \u_cpu/u_decode/n81 ;
  wire \u_cpu/u_decode/n82 ;
  wire \u_cpu/u_decode/n83 ;
  wire \u_cpu/u_decode/n84 ;
  wire \u_cpu/u_decode/n85 ;
  wire \u_cpu/u_decode/n86 ;
  wire \u_cpu/u_decode/n87 ;
  wire \u_cpu/u_decode/n88 ;
  wire \u_cpu/u_decode/n89 ;
  wire \u_cpu/u_decode/n9 ;
  wire \u_cpu/u_decode/n90 ;
  wire \u_cpu/u_decode/n91 ;
  wire \u_cpu/u_decode/n92 ;
  wire \u_cpu/u_decode/n93 ;
  wire \u_cpu/u_execute/bus_to_a_wen ;  // sources/rtl/mcu/execute.v(86)
  wire \u_cpu/u_execute/bus_to_b_wen ;  // sources/rtl/mcu/execute.v(87)
  wire \u_cpu/u_execute/bus_to_c_wen ;  // sources/rtl/mcu/execute.v(88)
  wire \u_cpu/u_execute/bus_to_d_wen ;  // sources/rtl/mcu/execute.v(89)
  wire \u_cpu/u_execute/dbg_info_en0 ;  // sources/rtl/mcu/execute.v(77)
  wire \u_cpu/u_execute/mux15_b10_sel_is_0_o ;
  wire \u_cpu/u_execute/mux16_b12_sel_is_2_o ;
  wire \u_cpu/u_execute/mux17_b10_sel_is_0_o ;
  wire \u_cpu/u_execute/mux17_b12_sel_is_2_o ;
  wire \u_cpu/u_execute/n0 ;
  wire \u_cpu/u_execute/n10 ;
  wire \u_cpu/u_execute/n11 ;
  wire \u_cpu/u_execute/n12 ;
  wire \u_cpu/u_execute/n13 ;
  wire \u_cpu/u_execute/n14 ;
  wire \u_cpu/u_execute/n18 ;
  wire \u_cpu/u_execute/n19 ;
  wire \u_cpu/u_execute/n20 ;
  wire \u_cpu/u_execute/n21 ;
  wire \u_cpu/u_execute/n22 ;
  wire \u_cpu/u_execute/n23 ;
  wire \u_cpu/u_execute/n24 ;
  wire \u_cpu/u_execute/n25 ;
  wire \u_cpu/u_execute/n26 ;
  wire \u_cpu/u_execute/n33 ;
  wire \u_cpu/u_execute/n34 ;
  wire \u_cpu/u_execute/n40 ;
  wire \u_cpu/u_execute/n41 ;
  wire \u_cpu/u_execute/n8 ;
  wire \u_cpu/u_execute/n9 ;
  wire \u_cpu/u_execute/pc_wen0 ;  // sources/rtl/mcu/execute.v(75)
  wire \u_cpu/u_execute/ram_to_a_wen ;  // sources/rtl/mcu/execute.v(82)
  wire \u_cpu/u_execute/ram_to_b_wen ;  // sources/rtl/mcu/execute.v(83)
  wire \u_cpu/u_execute/ram_to_c_wen ;  // sources/rtl/mcu/execute.v(84)
  wire \u_cpu/u_execute/ram_to_d_wen ;  // sources/rtl/mcu/execute.v(85)
  wire \u_cpu/u_execute/rom_to_a_wen ;  // sources/rtl/mcu/execute.v(78)
  wire \u_cpu/u_execute/rom_to_b_wen ;  // sources/rtl/mcu/execute.v(79)
  wire \u_cpu/u_execute/rom_to_c_wen ;  // sources/rtl/mcu/execute.v(80)
  wire \u_cpu/u_execute/rom_to_d_wen ;  // sources/rtl/mcu/execute.v(81)
  wire \u_cpu/u_execute/timer_wen0 ;  // sources/rtl/mcu/execute.v(76)
  wire \u_cpu/u_fetch/fetch_en ;  // sources/rtl/mcu/fetch.v(52)
  wire \u_cpu/u_fetch/n5 ;
  wire \u_cpu/u_fetch/n8 ;
  wire \u_cpu/u_fetch/rom_bk_en ;  // sources/rtl/mcu/fetch.v(53)
  wire \u_cpu/u_timer/n0 ;
  wire \u_cpu/u_timer/n4 ;
  wire \u_key/key_flag ;  // sources/rtl/key/key.v(37)
  wire \u_key/n0 ;
  wire \u_key/n1 ;
  wire \u_key/n10 ;
  wire \u_key/n11 ;
  wire \u_key/n12 ;
  wire \u_key/n13 ;
  wire \u_key/n14 ;
  wire \u_key/n17 ;
  wire \u_key/n18 ;
  wire \u_key/n19 ;
  wire \u_key/n2 ;
  wire \u_key/n20 ;
  wire \u_key/n21 ;
  wire \u_key/n22 ;
  wire \u_key/n23 ;
  wire \u_key/n24 ;
  wire \u_key/n25 ;
  wire \u_key/n26 ;
  wire \u_key/n27 ;
  wire \u_key/n28 ;
  wire \u_key/n29 ;
  wire \u_key/n30 ;
  wire \u_key/n31 ;
  wire \u_key/n32 ;
  wire \u_key/n4 ;
  wire \u_key/n5 ;
  wire \u_key/n6 ;
  wire \u_key/n7 ;
  wire \u_key/n8 ;
  wire \u_key/n9 ;
  wire \u_pll/clk0_buf ;  // al_ip/pll.v(28)
  wire \u_ram/n0 ;
  wire \u_ram/n1 ;
  wire \u_ram/n2 ;
  wire \u_ram/n4 ;
  wire \u_ram/n7 ;
  wire \u_rom/n0 ;
  wire \u_rom/n1 ;
  wire \u_rom/n10 ;
  wire \u_rom/n11 ;
  wire \u_rom/n12 ;
  wire \u_rom/n13 ;
  wire \u_rom/n14 ;
  wire \u_rom/n15 ;
  wire \u_rom/n2 ;
  wire \u_rom/n4 ;
  wire \u_rom/n5 ;
  wire \u_rom/n8 ;
  wire \u_rom/n9 ;
  wire \u_uart/rx_en ;  // sources/rtl/uart/uart.v(47)
  wire \u_uart/tx_en ;  // sources/rtl/uart/uart.v(49)
  wire \u_uart/tx_ready ;  // sources/rtl/uart/uart.v(51)
  wire \u_uart/u_uart_rx/clk_en ;  // sources/rtl/uart/uart_rx.v(39)
  wire \u_uart/u_uart_rx/mux1_b10_sel_is_1_o ;
  wire \u_uart/u_uart_rx/mux4_b0_sel_is_3_o ;
  wire \u_uart/u_uart_rx/mux4_b1_sel_is_3_o ;
  wire \u_uart/u_uart_rx/mux4_b2_sel_is_3_o ;
  wire \u_uart/u_uart_rx/mux4_b3_sel_is_3_o ;
  wire \u_uart/u_uart_rx/mux4_b4_sel_is_3_o ;
  wire \u_uart/u_uart_rx/mux4_b5_sel_is_3_o ;
  wire \u_uart/u_uart_rx/mux4_b6_sel_is_3_o ;
  wire \u_uart/u_uart_rx/mux4_b7_sel_is_3_o ;
  wire \u_uart/u_uart_rx/n0 ;
  wire \u_uart/u_uart_rx/n1 ;
  wire \u_uart/u_uart_rx/n16 ;
  wire \u_uart/u_uart_rx/n17 ;
  wire \u_uart/u_uart_rx/n18 ;
  wire \u_uart/u_uart_rx/n19 ;
  wire \u_uart/u_uart_rx/n20 ;
  wire \u_uart/u_uart_rx/n21 ;
  wire \u_uart/u_uart_rx/n22 ;
  wire \u_uart/u_uart_rx/n23 ;
  wire \u_uart/u_uart_rx/n28 ;
  wire \u_uart/u_uart_rx/n5 ;
  wire \u_uart/u_uart_rx/n5_neg ;
  wire \u_uart/u_uart_rx/start ;  // sources/rtl/uart/uart_rx.v(38)
  wire \u_uart/u_uart_tx/clk_en ;  // sources/rtl/uart/uart_tx.v(40)
  wire \u_uart/u_uart_tx/mux1_b0_sel_is_1_o ;
  wire \u_uart/u_uart_tx/n0 ;
  wire \u_uart/u_uart_tx/n0_neg ;
  wire \u_uart/u_uart_tx/n13 ;
  wire \u_uart/u_uart_tx/n4 ;
  wire \u_uart/u_uart_tx/n7 ;
  wire \u_uart/u_uart_tx/n8 ;
  wire \u_uart/u_uart_tx/start ;  // sources/rtl/uart/uart_tx.v(39)
  wire \u_uart/u_ubus/frame_head_flag ;  // sources/rtl/uart/ubus.v(71)
  wire \u_uart/u_ubus/frame_head_flag0 ;  // sources/rtl/uart/ubus.v(65)
  wire \u_uart/u_ubus/frame_head_flag1 ;  // sources/rtl/uart/ubus.v(66)
  wire \u_uart/u_ubus/frame_head_flag2 ;  // sources/rtl/uart/ubus.v(67)
  wire \u_uart/u_ubus/frame_head_flag3 ;  // sources/rtl/uart/ubus.v(68)
  wire \u_uart/u_ubus/frame_head_flag4 ;  // sources/rtl/uart/ubus.v(69)
  wire \u_uart/u_ubus/frame_head_flag5 ;  // sources/rtl/uart/ubus.v(70)
  wire \u_uart/u_ubus/n10 ;
  wire \u_uart/u_ubus/n11 ;
  wire \u_uart/u_ubus/n12 ;
  wire \u_uart/u_ubus/n13 ;
  wire \u_uart/u_ubus/n14 ;
  wire \u_uart/u_ubus/n15 ;
  wire \u_uart/u_ubus/n16 ;
  wire \u_uart/u_ubus/n17 ;
  wire \u_uart/u_ubus/n18 ;
  wire \u_uart/u_ubus/n19 ;
  wire \u_uart/u_ubus/n20 ;
  wire \u_uart/u_ubus/n21 ;
  wire \u_uart/u_ubus/n22 ;
  wire \u_uart/u_ubus/n23 ;
  wire \u_uart/u_ubus/n24 ;
  wire \u_uart/u_ubus/n25 ;
  wire \u_uart/u_ubus/n26 ;
  wire \u_uart/u_ubus/n30 ;
  wire \u_uart/u_ubus/n34 ;
  wire \u_uart/u_ubus/n35 ;
  wire \u_uart/u_ubus/n41 ;
  wire \u_uart/u_ubus/n42 ;
  wire \u_uart/u_ubus/n58 ;
  wire \u_uart/u_ubus/rx_en_d ;  // sources/rtl/uart/ubus.v(56)
  wire \u_uart/u_ubus/send_finish ;  // sources/rtl/uart/ubus.v(73)
  wire \u_uart/u_ubus/send_flag ;  // sources/rtl/uart/ubus.v(75)
  wire \u_uart/u_ubus/send_start ;  // sources/rtl/uart/ubus.v(72)
  wire \u_uart/u_ubus/tx_ready_flag ;  // sources/rtl/uart/ubus.v(78)
  wire \u_vga/mux4_b0_sel_is_3_o ;
  wire \u_vga/n0 ;
  wire \u_vga/n10 ;
  wire \u_vga/n11 ;
  wire \u_vga/n12 ;
  wire \u_vga/n13 ;
  wire \u_vga/n14 ;
  wire \u_vga/n15 ;
  wire \u_vga/n16 ;
  wire \u_vga/n3 ;
  wire \u_vga/n7 ;
  wire \u_vga/n8 ;
  wire \u_vga/n9 ;
  wire \u_vram/axis_en_d0 ;  // sources/rtl/vga/vram.v(58)
  wire \u_vram/axis_en_d1 ;  // sources/rtl/vga/vram.v(61)
  wire \u_vram/axis_en_d2 ;  // sources/rtl/vga/vram.v(64)
  wire \u_vram/hs_i_d0 ;  // sources/rtl/vga/vram.v(52)
  wire \u_vram/hs_i_d1 ;  // sources/rtl/vga/vram.v(54)
  wire \u_vram/hs_i_d2 ;  // sources/rtl/vga/vram.v(56)
  wire \u_vram/mux1_b13_sel_is_0_o ;
  wire \u_vram/mux2_b10_sel_is_0_o ;
  wire \u_vram/mux2_b14_sel_is_2_o ;
  wire \u_vram/mux3_b10_sel_is_3_o ;
  wire \u_vram/mux3_b12_sel_is_1_o ;
  wire \u_vram/mux3_b14_sel_is_3_o ;
  wire \u_vram/n10 ;
  wire \u_vram/n11 ;
  wire \u_vram/n12 ;
  wire \u_vram/n13 ;
  wire \u_vram/n14 ;
  wire \u_vram/n15 ;
  wire \u_vram/n15_neg ;
  wire \u_vram/n16 ;
  wire \u_vram/n17 ;
  wire \u_vram/n18 ;
  wire \u_vram/n19 ;
  wire \u_vram/n20 ;
  wire \u_vram/n21 ;
  wire \u_vram/n22 ;
  wire \u_vram/n22_neg ;
  wire \u_vram/n23 ;
  wire \u_vram/n24 ;
  wire \u_vram/n25 ;
  wire \u_vram/n25_neg ;
  wire \u_vram/n9 ;
  wire \u_vram/state ;  // sources/rtl/vga/vram.v(46)
  wire \u_vram/vs_i_d0 ;  // sources/rtl/vga/vram.v(53)
  wire \u_vram/vs_i_d1 ;  // sources/rtl/vga/vram.v(55)
  wire \u_vram/vs_i_d2 ;  // sources/rtl/vga/vram.v(57)
  wire vram_rdata;  // sources/rtl/top.v(91)
  wire vram_ren;  // sources/rtl/top.v(90)
  wire vram_wdata;  // sources/rtl/top.v(89)
  wire vram_wen;  // sources/rtl/top.v(88)
  wire vsyn;  // sources/rtl/top.v(78)

  assign vga_rgb[23] = vga_rgb[14];
  assign vga_rgb[20] = vga_rgb[22];
  assign vga_rgb[18] = 1'b0;
  assign vga_rgb[17] = 1'b0;
  assign vga_rgb[16] = 1'b0;
  assign vga_rgb[15] = vga_rgb[21];
  assign vga_rgb[12] = vga_rgb[21];
  assign vga_rgb[10] = vga_rgb[19];
  assign vga_rgb[9] = 1'b0;
  assign vga_rgb[8] = 1'b0;
  assign vga_rgb[7] = 1'b0;
  assign vga_rgb[6] = vga_rgb[13];
  assign vga_rgb[5] = vga_rgb[14];
  assign vga_rgb[4] = vga_rgb[13];
  assign vga_rgb[3] = vga_rgb[14];
  assign vga_rgb[2] = 1'b0;
  assign vga_rgb[1] = 1'b0;
  assign vga_rgb[0] = 1'b0;
  reg_ar_as_w1 \u_bus/clear_reg  (
    .clk(vga_clk),
    .d(\u_bus/n18 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(clear));  // sources/rtl/mcu/bus.v(86)
  eq_w8 \u_bus/eq0  (
    .i0(bus_raddr),
    .i1(8'b00000000),
    .o(\u_bus/n0 ));  // sources/rtl/mcu/bus.v(56)
  eq_w8 \u_bus/eq1  (
    .i0(bus_raddr),
    .i1(8'b00000001),
    .o(\u_bus/n1 ));  // sources/rtl/mcu/bus.v(57)
  eq_w8 \u_bus/eq2  (
    .i0(bus_raddr),
    .i1(8'b00000010),
    .o(\u_bus/n2 ));  // sources/rtl/mcu/bus.v(58)
  reg_ar_as_w1 \u_bus/led_reg  (
    .clk(vga_clk),
    .d(bus_wdata[0]),
    .en(\u_bus/u6_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(led));  // sources/rtl/mcu/bus.v(62)
  and \u_bus/mux0_b0_sel_is_3  (\u_bus/mux0_b0_sel_is_3_o , bus_wen, \u_bus/n1 );
  reg_ar_as_w1 \u_bus/reg0_b0  (
    .clk(vga_clk),
    .d(bus_wdata[0]),
    .en(\u_bus/mux0_b0_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(vram_addr[0]));  // sources/rtl/mcu/bus.v(62)
  reg_ar_as_w1 \u_bus/reg0_b1  (
    .clk(vga_clk),
    .d(bus_wdata[1]),
    .en(\u_bus/mux0_b0_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(vram_addr[1]));  // sources/rtl/mcu/bus.v(62)
  reg_ar_as_w1 \u_bus/reg0_b2  (
    .clk(vga_clk),
    .d(bus_wdata[2]),
    .en(\u_bus/mux0_b0_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(vram_addr[2]));  // sources/rtl/mcu/bus.v(62)
  reg_ar_as_w1 \u_bus/reg0_b3  (
    .clk(vga_clk),
    .d(bus_wdata[3]),
    .en(\u_bus/mux0_b0_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(vram_addr[3]));  // sources/rtl/mcu/bus.v(62)
  reg_ar_as_w1 \u_bus/reg0_b4  (
    .clk(vga_clk),
    .d(bus_wdata[4]),
    .en(\u_bus/mux0_b0_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(vram_addr[4]));  // sources/rtl/mcu/bus.v(62)
  reg_ar_as_w1 \u_bus/reg0_b5  (
    .clk(vga_clk),
    .d(bus_wdata[5]),
    .en(\u_bus/mux0_b0_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(vram_addr[5]));  // sources/rtl/mcu/bus.v(62)
  reg_ar_as_w1 \u_bus/reg0_b6  (
    .clk(vga_clk),
    .d(bus_wdata[6]),
    .en(\u_bus/mux0_b0_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(vram_addr[6]));  // sources/rtl/mcu/bus.v(62)
  reg_ar_as_w1 \u_bus/reg0_b7  (
    .clk(vga_clk),
    .d(bus_wdata[7]),
    .en(\u_bus/mux0_b0_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(vram_addr[7]));  // sources/rtl/mcu/bus.v(62)
  reg_ar_as_w1 \u_bus/reg1_b0  (
    .clk(vga_clk),
    .d(\u_bus/n15 [0]),
    .en(bus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_rdata[0]));  // sources/rtl/mcu/bus.v(78)
  reg_ar_as_w1 \u_bus/reg1_b1  (
    .clk(vga_clk),
    .d(\u_bus/n15 [1]),
    .en(bus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_rdata[1]));  // sources/rtl/mcu/bus.v(78)
  reg_ar_as_w1 \u_bus/reg1_b2  (
    .clk(vga_clk),
    .d(\u_bus/n15 [2]),
    .en(bus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_rdata[2]));  // sources/rtl/mcu/bus.v(78)
  reg_ar_as_w1 \u_bus/reg1_b3  (
    .clk(vga_clk),
    .d(\u_bus/n15 [3]),
    .en(bus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_rdata[3]));  // sources/rtl/mcu/bus.v(78)
  reg_ar_as_w1 \u_bus/reg1_b4  (
    .clk(vga_clk),
    .d(\u_bus/n15 [4]),
    .en(bus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_rdata[4]));  // sources/rtl/mcu/bus.v(78)
  reg_ar_as_w1 \u_bus/reg1_b5  (
    .clk(vga_clk),
    .d(\u_bus/n15 [5]),
    .en(bus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_rdata[5]));  // sources/rtl/mcu/bus.v(78)
  and \u_bus/sel1_b0/and_b0_1  (\u_bus/sel1_b0/B1 , vram_rdata, \u_bus/n2 );
  and \u_bus/sel1_b0/and_b0_2  (\u_bus/sel1_b0/B2 , key_deb[0], \u_bus/n1 );
  and \u_bus/sel1_b0/and_b0_3  (\u_bus/sel1_b0/B3 , led, \u_bus/n0 );
  or \u_bus/sel1_b0/or_B2_B3  (\u_bus/sel1_b0/or_B2_B3_o , \u_bus/sel1_b0/B2 , \u_bus/sel1_b0/B3 );
  or \u_bus/sel1_b0/or_or_B0_B1_o_or_B2_  (\u_bus/n15 [0], \u_bus/sel1_b0/B1 , \u_bus/sel1_b0/or_B2_B3_o );
  AL_MUX \u_bus/sel1_b1  (
    .i0(1'b0),
    .i1(key_deb[1]),
    .sel(\u_bus/n1 ),
    .o(\u_bus/n15 [1]));  // sources/rtl/mcu/bus.v(76)
  AL_MUX \u_bus/sel1_b2  (
    .i0(1'b0),
    .i1(key_deb[2]),
    .sel(\u_bus/n1 ),
    .o(\u_bus/n15 [2]));  // sources/rtl/mcu/bus.v(76)
  AL_MUX \u_bus/sel1_b3  (
    .i0(1'b0),
    .i1(key_deb[3]),
    .sel(\u_bus/n1 ),
    .o(\u_bus/n15 [3]));  // sources/rtl/mcu/bus.v(76)
  AL_MUX \u_bus/sel1_b4  (
    .i0(1'b0),
    .i1(key_deb[4]),
    .sel(\u_bus/n1 ),
    .o(\u_bus/n15 [4]));  // sources/rtl/mcu/bus.v(76)
  AL_MUX \u_bus/sel1_b5  (
    .i0(1'b0),
    .i1(key_deb[5]),
    .sel(\u_bus/n1 ),
    .o(\u_bus/n15 [5]));  // sources/rtl/mcu/bus.v(76)
  and \u_bus/u10  (\u_bus/n18 , bus_ren, \u_bus/n1 );  // sources/rtl/mcu/bus.v(83)
  and \u_bus/u14  (\u_bus/n22 , bus_wen, \u_bus/n2 );  // sources/rtl/mcu/bus.v(85)
  and \u_bus/u6_sel_is_3  (\u_bus/u6_sel_is_3_o , bus_wen, \u_bus/n0 );
  reg_ar_as_w1 \u_bus/vram_ren_reg  (
    .clk(vga_clk),
    .d(\u_bus/mux0_b0_sel_is_3_o ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(vram_ren));  // sources/rtl/mcu/bus.v(86)
  reg_ar_as_w1 \u_bus/vram_wdata_reg  (
    .clk(vga_clk),
    .d(bus_wdata[0]),
    .en(\u_bus/n22 ),
    .reset(1'b0),
    .set(1'b0),
    .q(vram_wdata));  // sources/rtl/mcu/bus.v(62)
  reg_ar_as_w1 \u_bus/vram_wen_reg  (
    .clk(vga_clk),
    .d(\u_bus/n22 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(vram_wen));  // sources/rtl/mcu/bus.v(86)
  not \u_cpu/alu_in2[2]_inv  (\u_cpu/alu_in2[2]_neg , \u_cpu/alu_in2 [2]);
  not \u_cpu/read_abcd[0]_inv  (\u_cpu/read_abcd[0]_neg , \u_cpu/read_abcd [0]);
  not \u_cpu/read_abcd[1]_inv  (\u_cpu/read_abcd[1]_neg , \u_cpu/read_abcd [1]);
  not \u_cpu/read_abcd[2]_inv  (\u_cpu/read_abcd[2]_neg , \u_cpu/read_abcd [2]);
  not \u_cpu/read_abcd[3]_inv  (\u_cpu/read_abcd[3]_neg , \u_cpu/read_abcd [3]);
  add_pu8_pu8_o9 \u_cpu/u_alu/add0  (
    .i0(bus_wdata),
    .i1(\u_cpu/alu_in2 ),
    .o({\u_cpu/u_alu/n3 ,\u_cpu/u_alu/n4 }));  // sources/rtl/mcu/alu.v(43)
  eq_w8 \u_cpu/u_alu/eq0  (
    .i0(bus_wdata),
    .i1(\u_cpu/alu_in2 ),
    .o(\u_cpu/u_alu/n36 ));  // sources/rtl/mcu/alu.v(61)
  lt_u8_u8 \u_cpu/u_alu/lt0  (
    .ci(1'b0),
    .i0(\u_cpu/alu_in2 ),
    .i1(bus_wdata),
    .o(\u_cpu/u_alu/n35 ));  // sources/rtl/mcu/alu.v(59)
  mult_u8_u8_o16 \u_cpu/u_alu/mult0  (
    .i0(bus_wdata),
    .i1(\u_cpu/alu_in2 ),
    .o(\u_cpu/u_alu/n17 ));  // sources/rtl/mcu/alu.v(52)
  binary_mux_s1_w1 \u_cpu/u_alu/mux0_b0  (
    .i0(\u_cpu/alu_out0 [0]),
    .i1(\u_cpu/u_alu/n5 [0]),
    .sel(\u_cpu/alu_cmd [1]),
    .o(\u_cpu/u_alu/n6 [0]));  // sources/rtl/mcu/alu.v(45)
  binary_mux_s1_w1 \u_cpu/u_alu/mux0_b1  (
    .i0(\u_cpu/alu_out0 [1]),
    .i1(\u_cpu/u_alu/n5 [1]),
    .sel(\u_cpu/alu_cmd [1]),
    .o(\u_cpu/u_alu/n6 [1]));  // sources/rtl/mcu/alu.v(45)
  binary_mux_s1_w1 \u_cpu/u_alu/mux0_b2  (
    .i0(\u_cpu/alu_out0 [2]),
    .i1(\u_cpu/u_alu/n5 [2]),
    .sel(\u_cpu/alu_cmd [1]),
    .o(\u_cpu/u_alu/n6 [2]));  // sources/rtl/mcu/alu.v(45)
  binary_mux_s1_w1 \u_cpu/u_alu/mux0_b3  (
    .i0(\u_cpu/alu_out0 [3]),
    .i1(\u_cpu/u_alu/n5 [3]),
    .sel(\u_cpu/alu_cmd [1]),
    .o(\u_cpu/u_alu/n6 [3]));  // sources/rtl/mcu/alu.v(45)
  binary_mux_s1_w1 \u_cpu/u_alu/mux0_b4  (
    .i0(\u_cpu/alu_out0 [4]),
    .i1(\u_cpu/u_alu/n5 [4]),
    .sel(\u_cpu/alu_cmd [1]),
    .o(\u_cpu/u_alu/n6 [4]));  // sources/rtl/mcu/alu.v(45)
  binary_mux_s1_w1 \u_cpu/u_alu/mux0_b5  (
    .i0(\u_cpu/alu_out0 [5]),
    .i1(\u_cpu/u_alu/n5 [5]),
    .sel(\u_cpu/alu_cmd [1]),
    .o(\u_cpu/u_alu/n6 [5]));  // sources/rtl/mcu/alu.v(45)
  binary_mux_s1_w1 \u_cpu/u_alu/mux0_b6  (
    .i0(\u_cpu/alu_out0 [6]),
    .i1(\u_cpu/u_alu/n5 [6]),
    .sel(\u_cpu/alu_cmd [1]),
    .o(\u_cpu/u_alu/n6 [6]));  // sources/rtl/mcu/alu.v(45)
  binary_mux_s1_w1 \u_cpu/u_alu/mux0_b7  (
    .i0(\u_cpu/alu_out0 [7]),
    .i1(\u_cpu/u_alu/n5 [7]),
    .sel(\u_cpu/alu_cmd [1]),
    .o(\u_cpu/u_alu/n6 [7]));  // sources/rtl/mcu/alu.v(45)
  binary_mux_s1_w1 \u_cpu/u_alu/mux0_b8  (
    .i0(\u_cpu/alu_out0 [8]),
    .i1(\u_cpu/u_alu/n5 [8]),
    .sel(\u_cpu/alu_cmd [1]),
    .o(\u_cpu/u_alu/n6 [8]));  // sources/rtl/mcu/alu.v(45)
  binary_mux_s1_w1 \u_cpu/u_alu/mux10_b0  (
    .i0(\u_cpu/u_alu/n69 [0]),
    .i1(\u_cpu/u_alu/n67 [0]),
    .sel(\u_cpu/alu_cmd [9]),
    .o(\u_cpu/u_alu/n70 [0]));  // sources/rtl/mcu/alu.v(83)
  binary_mux_s1_w1 \u_cpu/u_alu/mux10_b1  (
    .i0(\u_cpu/u_alu/n69 [1]),
    .i1(\u_cpu/u_alu/n67 [1]),
    .sel(\u_cpu/alu_cmd [9]),
    .o(\u_cpu/u_alu/n70 [1]));  // sources/rtl/mcu/alu.v(83)
  binary_mux_s1_w1 \u_cpu/u_alu/mux10_b2  (
    .i0(\u_cpu/u_alu/n69 [2]),
    .i1(\u_cpu/u_alu/n67 [2]),
    .sel(\u_cpu/alu_cmd [9]),
    .o(\u_cpu/u_alu/n70 [2]));  // sources/rtl/mcu/alu.v(83)
  binary_mux_s1_w1 \u_cpu/u_alu/mux10_b3  (
    .i0(\u_cpu/u_alu/n69 [3]),
    .i1(\u_cpu/u_alu/n67 [3]),
    .sel(\u_cpu/alu_cmd [9]),
    .o(\u_cpu/u_alu/n70 [3]));  // sources/rtl/mcu/alu.v(83)
  binary_mux_s1_w1 \u_cpu/u_alu/mux10_b4  (
    .i0(\u_cpu/u_alu/n69 [4]),
    .i1(\u_cpu/u_alu/n67 [4]),
    .sel(\u_cpu/alu_cmd [9]),
    .o(\u_cpu/u_alu/n70 [4]));  // sources/rtl/mcu/alu.v(83)
  binary_mux_s1_w1 \u_cpu/u_alu/mux10_b5  (
    .i0(\u_cpu/u_alu/n69 [5]),
    .i1(\u_cpu/u_alu/n67 [5]),
    .sel(\u_cpu/alu_cmd [9]),
    .o(\u_cpu/u_alu/n70 [5]));  // sources/rtl/mcu/alu.v(83)
  binary_mux_s1_w1 \u_cpu/u_alu/mux10_b6  (
    .i0(\u_cpu/u_alu/n69 [6]),
    .i1(\u_cpu/u_alu/n67 [6]),
    .sel(\u_cpu/alu_cmd [9]),
    .o(\u_cpu/u_alu/n70 [6]));  // sources/rtl/mcu/alu.v(83)
  binary_mux_s1_w1 \u_cpu/u_alu/mux10_b7  (
    .i0(\u_cpu/u_alu/n69 [7]),
    .i1(\u_cpu/u_alu/n67 [7]),
    .sel(\u_cpu/alu_cmd [9]),
    .o(\u_cpu/u_alu/n70 [7]));  // sources/rtl/mcu/alu.v(83)
  binary_mux_s1_w1 \u_cpu/u_alu/mux1_b0  (
    .i0(\u_cpu/u_alu/n6 [0]),
    .i1(\u_cpu/u_alu/n4 [0]),
    .sel(\u_cpu/alu_cmd [0]),
    .o(\u_cpu/u_alu/n7 [0]));  // sources/rtl/mcu/alu.v(45)
  binary_mux_s1_w1 \u_cpu/u_alu/mux1_b1  (
    .i0(\u_cpu/u_alu/n6 [1]),
    .i1(\u_cpu/u_alu/n4 [1]),
    .sel(\u_cpu/alu_cmd [0]),
    .o(\u_cpu/u_alu/n7 [1]));  // sources/rtl/mcu/alu.v(45)
  binary_mux_s1_w1 \u_cpu/u_alu/mux1_b2  (
    .i0(\u_cpu/u_alu/n6 [2]),
    .i1(\u_cpu/u_alu/n4 [2]),
    .sel(\u_cpu/alu_cmd [0]),
    .o(\u_cpu/u_alu/n7 [2]));  // sources/rtl/mcu/alu.v(45)
  binary_mux_s1_w1 \u_cpu/u_alu/mux1_b3  (
    .i0(\u_cpu/u_alu/n6 [3]),
    .i1(\u_cpu/u_alu/n4 [3]),
    .sel(\u_cpu/alu_cmd [0]),
    .o(\u_cpu/u_alu/n7 [3]));  // sources/rtl/mcu/alu.v(45)
  binary_mux_s1_w1 \u_cpu/u_alu/mux1_b4  (
    .i0(\u_cpu/u_alu/n6 [4]),
    .i1(\u_cpu/u_alu/n4 [4]),
    .sel(\u_cpu/alu_cmd [0]),
    .o(\u_cpu/u_alu/n7 [4]));  // sources/rtl/mcu/alu.v(45)
  binary_mux_s1_w1 \u_cpu/u_alu/mux1_b5  (
    .i0(\u_cpu/u_alu/n6 [5]),
    .i1(\u_cpu/u_alu/n4 [5]),
    .sel(\u_cpu/alu_cmd [0]),
    .o(\u_cpu/u_alu/n7 [5]));  // sources/rtl/mcu/alu.v(45)
  binary_mux_s1_w1 \u_cpu/u_alu/mux1_b6  (
    .i0(\u_cpu/u_alu/n6 [6]),
    .i1(\u_cpu/u_alu/n4 [6]),
    .sel(\u_cpu/alu_cmd [0]),
    .o(\u_cpu/u_alu/n7 [6]));  // sources/rtl/mcu/alu.v(45)
  binary_mux_s1_w1 \u_cpu/u_alu/mux1_b7  (
    .i0(\u_cpu/u_alu/n6 [7]),
    .i1(\u_cpu/u_alu/n4 [7]),
    .sel(\u_cpu/alu_cmd [0]),
    .o(\u_cpu/u_alu/n7 [7]));  // sources/rtl/mcu/alu.v(45)
  binary_mux_s1_w1 \u_cpu/u_alu/mux1_b8  (
    .i0(\u_cpu/u_alu/n6 [8]),
    .i1(\u_cpu/u_alu/n3 ),
    .sel(\u_cpu/alu_cmd [0]),
    .o(\u_cpu/u_alu/n7 [8]));  // sources/rtl/mcu/alu.v(45)
  binary_mux_s1_w1 \u_cpu/u_alu/mux3_b0  (
    .i0(\u_cpu/alu_out2 [0]),
    .i1(\u_cpu/u_alu/n36 ),
    .sel(\u_cpu/alu_cmd [4]),
    .o(\u_cpu/u_alu/n37 [0]));  // sources/rtl/mcu/alu.v(61)
  binary_mux_s1_w1 \u_cpu/u_alu/mux4_b0  (
    .i0(\u_cpu/u_alu/n37 [0]),
    .i1(\u_cpu/u_alu/n35 ),
    .sel(\u_cpu/alu_cmd [3]),
    .o(\u_cpu/u_alu/n38 [0]));  // sources/rtl/mcu/alu.v(61)
  binary_mux_s1_w1 \u_cpu/u_alu/mux5_b0  (
    .i0(\u_cpu/alu_out3 [0]),
    .i1(\u_cpu/u_alu/n54 [0]),
    .sel(\u_cpu/alu_cmd [8]),
    .o(\u_cpu/u_alu/n55 [0]));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w1 \u_cpu/u_alu/mux5_b1  (
    .i0(\u_cpu/alu_out3 [1]),
    .i1(\u_cpu/u_alu/n54 [1]),
    .sel(\u_cpu/alu_cmd [8]),
    .o(\u_cpu/u_alu/n55 [1]));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w1 \u_cpu/u_alu/mux5_b2  (
    .i0(\u_cpu/alu_out3 [2]),
    .i1(\u_cpu/u_alu/n54 [2]),
    .sel(\u_cpu/alu_cmd [8]),
    .o(\u_cpu/u_alu/n55 [2]));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w1 \u_cpu/u_alu/mux5_b3  (
    .i0(\u_cpu/alu_out3 [3]),
    .i1(\u_cpu/u_alu/n54 [3]),
    .sel(\u_cpu/alu_cmd [8]),
    .o(\u_cpu/u_alu/n55 [3]));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w1 \u_cpu/u_alu/mux5_b4  (
    .i0(\u_cpu/alu_out3 [4]),
    .i1(\u_cpu/u_alu/n54 [4]),
    .sel(\u_cpu/alu_cmd [8]),
    .o(\u_cpu/u_alu/n55 [4]));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w1 \u_cpu/u_alu/mux5_b5  (
    .i0(\u_cpu/alu_out3 [5]),
    .i1(\u_cpu/u_alu/n54 [5]),
    .sel(\u_cpu/alu_cmd [8]),
    .o(\u_cpu/u_alu/n55 [5]));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w1 \u_cpu/u_alu/mux5_b6  (
    .i0(\u_cpu/alu_out3 [6]),
    .i1(\u_cpu/u_alu/n54 [6]),
    .sel(\u_cpu/alu_cmd [8]),
    .o(\u_cpu/u_alu/n55 [6]));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w1 \u_cpu/u_alu/mux5_b7  (
    .i0(\u_cpu/alu_out3 [7]),
    .i1(\u_cpu/u_alu/n54 [7]),
    .sel(\u_cpu/alu_cmd [8]),
    .o(\u_cpu/u_alu/n55 [7]));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w1 \u_cpu/u_alu/mux6_b0  (
    .i0(\u_cpu/u_alu/n55 [0]),
    .i1(\u_cpu/u_alu/n53 ),
    .sel(\u_cpu/alu_cmd [7]),
    .o(\u_cpu/u_alu/n56 [0]));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w1 \u_cpu/u_alu/mux6_b1  (
    .i0(\u_cpu/u_alu/n55 [1]),
    .i1(1'b0),
    .sel(\u_cpu/alu_cmd [7]),
    .o(\u_cpu/u_alu/n56 [1]));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w1 \u_cpu/u_alu/mux6_b2  (
    .i0(\u_cpu/u_alu/n55 [2]),
    .i1(1'b0),
    .sel(\u_cpu/alu_cmd [7]),
    .o(\u_cpu/u_alu/n56 [2]));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w1 \u_cpu/u_alu/mux6_b3  (
    .i0(\u_cpu/u_alu/n55 [3]),
    .i1(1'b0),
    .sel(\u_cpu/alu_cmd [7]),
    .o(\u_cpu/u_alu/n56 [3]));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w1 \u_cpu/u_alu/mux6_b4  (
    .i0(\u_cpu/u_alu/n55 [4]),
    .i1(1'b0),
    .sel(\u_cpu/alu_cmd [7]),
    .o(\u_cpu/u_alu/n56 [4]));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w1 \u_cpu/u_alu/mux6_b5  (
    .i0(\u_cpu/u_alu/n55 [5]),
    .i1(1'b0),
    .sel(\u_cpu/alu_cmd [7]),
    .o(\u_cpu/u_alu/n56 [5]));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w1 \u_cpu/u_alu/mux6_b6  (
    .i0(\u_cpu/u_alu/n55 [6]),
    .i1(1'b0),
    .sel(\u_cpu/alu_cmd [7]),
    .o(\u_cpu/u_alu/n56 [6]));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w1 \u_cpu/u_alu/mux6_b7  (
    .i0(\u_cpu/u_alu/n55 [7]),
    .i1(1'b0),
    .sel(\u_cpu/alu_cmd [7]),
    .o(\u_cpu/u_alu/n56 [7]));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w1 \u_cpu/u_alu/mux7_b0  (
    .i0(\u_cpu/u_alu/n56 [0]),
    .i1(\u_cpu/u_alu/n50 [0]),
    .sel(\u_cpu/alu_cmd [6]),
    .o(\u_cpu/u_alu/n57 [0]));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w1 \u_cpu/u_alu/mux7_b1  (
    .i0(\u_cpu/u_alu/n56 [1]),
    .i1(\u_cpu/u_alu/n50 [1]),
    .sel(\u_cpu/alu_cmd [6]),
    .o(\u_cpu/u_alu/n57 [1]));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w1 \u_cpu/u_alu/mux7_b2  (
    .i0(\u_cpu/u_alu/n56 [2]),
    .i1(\u_cpu/u_alu/n50 [2]),
    .sel(\u_cpu/alu_cmd [6]),
    .o(\u_cpu/u_alu/n57 [2]));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w1 \u_cpu/u_alu/mux7_b3  (
    .i0(\u_cpu/u_alu/n56 [3]),
    .i1(\u_cpu/u_alu/n50 [3]),
    .sel(\u_cpu/alu_cmd [6]),
    .o(\u_cpu/u_alu/n57 [3]));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w1 \u_cpu/u_alu/mux7_b4  (
    .i0(\u_cpu/u_alu/n56 [4]),
    .i1(\u_cpu/u_alu/n50 [4]),
    .sel(\u_cpu/alu_cmd [6]),
    .o(\u_cpu/u_alu/n57 [4]));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w1 \u_cpu/u_alu/mux7_b5  (
    .i0(\u_cpu/u_alu/n56 [5]),
    .i1(\u_cpu/u_alu/n50 [5]),
    .sel(\u_cpu/alu_cmd [6]),
    .o(\u_cpu/u_alu/n57 [5]));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w1 \u_cpu/u_alu/mux7_b6  (
    .i0(\u_cpu/u_alu/n56 [6]),
    .i1(\u_cpu/u_alu/n50 [6]),
    .sel(\u_cpu/alu_cmd [6]),
    .o(\u_cpu/u_alu/n57 [6]));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w1 \u_cpu/u_alu/mux7_b7  (
    .i0(\u_cpu/u_alu/n56 [7]),
    .i1(\u_cpu/u_alu/n50 [7]),
    .sel(\u_cpu/alu_cmd [6]),
    .o(\u_cpu/u_alu/n57 [7]));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w1 \u_cpu/u_alu/mux8_b0  (
    .i0(\u_cpu/u_alu/n57 [0]),
    .i1(\u_cpu/u_alu/n49 ),
    .sel(\u_cpu/alu_cmd [5]),
    .o(\u_cpu/u_alu/n58 [0]));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w1 \u_cpu/u_alu/mux9_b0  (
    .i0(\u_cpu/alu_out4 [0]),
    .i1(\u_cpu/u_alu/n68 [0]),
    .sel(\u_cpu/alu_cmd [10]),
    .o(\u_cpu/u_alu/n69 [0]));  // sources/rtl/mcu/alu.v(83)
  binary_mux_s1_w1 \u_cpu/u_alu/mux9_b1  (
    .i0(\u_cpu/alu_out4 [1]),
    .i1(\u_cpu/u_alu/n68 [1]),
    .sel(\u_cpu/alu_cmd [10]),
    .o(\u_cpu/u_alu/n69 [1]));  // sources/rtl/mcu/alu.v(83)
  binary_mux_s1_w1 \u_cpu/u_alu/mux9_b2  (
    .i0(\u_cpu/alu_out4 [2]),
    .i1(\u_cpu/u_alu/n68 [2]),
    .sel(\u_cpu/alu_cmd [10]),
    .o(\u_cpu/u_alu/n69 [2]));  // sources/rtl/mcu/alu.v(83)
  binary_mux_s1_w1 \u_cpu/u_alu/mux9_b3  (
    .i0(\u_cpu/alu_out4 [3]),
    .i1(\u_cpu/u_alu/n68 [3]),
    .sel(\u_cpu/alu_cmd [10]),
    .o(\u_cpu/u_alu/n69 [3]));  // sources/rtl/mcu/alu.v(83)
  binary_mux_s1_w1 \u_cpu/u_alu/mux9_b4  (
    .i0(\u_cpu/alu_out4 [4]),
    .i1(\u_cpu/u_alu/n68 [4]),
    .sel(\u_cpu/alu_cmd [10]),
    .o(\u_cpu/u_alu/n69 [4]));  // sources/rtl/mcu/alu.v(83)
  binary_mux_s1_w1 \u_cpu/u_alu/mux9_b5  (
    .i0(\u_cpu/alu_out4 [5]),
    .i1(\u_cpu/u_alu/n68 [5]),
    .sel(\u_cpu/alu_cmd [10]),
    .o(\u_cpu/u_alu/n69 [5]));  // sources/rtl/mcu/alu.v(83)
  binary_mux_s1_w1 \u_cpu/u_alu/mux9_b6  (
    .i0(\u_cpu/alu_out4 [6]),
    .i1(\u_cpu/u_alu/n68 [6]),
    .sel(\u_cpu/alu_cmd [10]),
    .o(\u_cpu/u_alu/n69 [6]));  // sources/rtl/mcu/alu.v(83)
  binary_mux_s1_w1 \u_cpu/u_alu/mux9_b7  (
    .i0(\u_cpu/alu_out4 [7]),
    .i1(\u_cpu/u_alu/n68 [7]),
    .sel(\u_cpu/alu_cmd [10]),
    .o(\u_cpu/u_alu/n69 [7]));  // sources/rtl/mcu/alu.v(83)
  not \u_cpu/u_alu/n40_inv  (\u_cpu/u_alu/n40_neg , \u_cpu/u_alu/n40 );
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b0  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n17 [0]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [0]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b1  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n17 [1]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [1]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b10  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n17 [10]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [10]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b11  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n17 [11]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [11]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b12  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n17 [12]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [12]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b13  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n17 [13]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [13]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b14  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n17 [14]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [14]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b15  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n17 [15]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [15]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b2  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n17 [2]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [2]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b3  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n17 [3]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [3]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b4  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n17 [4]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [4]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b5  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n17 [5]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [5]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b6  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n17 [6]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [6]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b7  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n17 [7]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [7]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b8  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n17 [8]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [8]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b9  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n17 [9]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [9]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg1_b0  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n38 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out2 [0]));  // sources/rtl/mcu/alu.v(62)
  reg_ar_as_w1 \u_cpu/u_alu/reg2_b0  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n58 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out3 [0]));  // sources/rtl/mcu/alu.v(75)
  reg_sr_as_w1 \u_cpu/u_alu/reg2_b1  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n57 [1]),
    .en(1'b1),
    .reset(\u_cpu/alu_cmd [5]),
    .set(1'b0),
    .q(\u_cpu/alu_out3 [1]));  // sources/rtl/mcu/alu.v(75)
  reg_sr_as_w1 \u_cpu/u_alu/reg2_b2  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n57 [2]),
    .en(1'b1),
    .reset(\u_cpu/alu_cmd [5]),
    .set(1'b0),
    .q(\u_cpu/alu_out3 [2]));  // sources/rtl/mcu/alu.v(75)
  reg_sr_as_w1 \u_cpu/u_alu/reg2_b3  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n57 [3]),
    .en(1'b1),
    .reset(\u_cpu/alu_cmd [5]),
    .set(1'b0),
    .q(\u_cpu/alu_out3 [3]));  // sources/rtl/mcu/alu.v(75)
  reg_sr_as_w1 \u_cpu/u_alu/reg2_b4  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n57 [4]),
    .en(1'b1),
    .reset(\u_cpu/alu_cmd [5]),
    .set(1'b0),
    .q(\u_cpu/alu_out3 [4]));  // sources/rtl/mcu/alu.v(75)
  reg_sr_as_w1 \u_cpu/u_alu/reg2_b5  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n57 [5]),
    .en(1'b1),
    .reset(\u_cpu/alu_cmd [5]),
    .set(1'b0),
    .q(\u_cpu/alu_out3 [5]));  // sources/rtl/mcu/alu.v(75)
  reg_sr_as_w1 \u_cpu/u_alu/reg2_b6  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n57 [6]),
    .en(1'b1),
    .reset(\u_cpu/alu_cmd [5]),
    .set(1'b0),
    .q(\u_cpu/alu_out3 [6]));  // sources/rtl/mcu/alu.v(75)
  reg_sr_as_w1 \u_cpu/u_alu/reg2_b7  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n57 [7]),
    .en(1'b1),
    .reset(\u_cpu/alu_cmd [5]),
    .set(1'b0),
    .q(\u_cpu/alu_out3 [7]));  // sources/rtl/mcu/alu.v(75)
  reg_ar_as_w1 \u_cpu/u_alu/reg3_b0  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n70 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out4 [0]));  // sources/rtl/mcu/alu.v(84)
  reg_ar_as_w1 \u_cpu/u_alu/reg3_b1  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n70 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out4 [1]));  // sources/rtl/mcu/alu.v(84)
  reg_ar_as_w1 \u_cpu/u_alu/reg3_b2  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n70 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out4 [2]));  // sources/rtl/mcu/alu.v(84)
  reg_ar_as_w1 \u_cpu/u_alu/reg3_b3  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n70 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out4 [3]));  // sources/rtl/mcu/alu.v(84)
  reg_ar_as_w1 \u_cpu/u_alu/reg3_b4  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n70 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out4 [4]));  // sources/rtl/mcu/alu.v(84)
  reg_ar_as_w1 \u_cpu/u_alu/reg3_b5  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n70 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out4 [5]));  // sources/rtl/mcu/alu.v(84)
  reg_ar_as_w1 \u_cpu/u_alu/reg3_b6  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n70 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out4 [6]));  // sources/rtl/mcu/alu.v(84)
  reg_ar_as_w1 \u_cpu/u_alu/reg3_b7  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n70 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out4 [7]));  // sources/rtl/mcu/alu.v(84)
  reg_ar_as_w1 \u_cpu/u_alu/reg4_b0  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n7 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out0 [0]));  // sources/rtl/mcu/alu.v(46)
  reg_ar_as_w1 \u_cpu/u_alu/reg4_b1  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n7 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out0 [1]));  // sources/rtl/mcu/alu.v(46)
  reg_ar_as_w1 \u_cpu/u_alu/reg4_b2  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n7 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out0 [2]));  // sources/rtl/mcu/alu.v(46)
  reg_ar_as_w1 \u_cpu/u_alu/reg4_b3  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n7 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out0 [3]));  // sources/rtl/mcu/alu.v(46)
  reg_ar_as_w1 \u_cpu/u_alu/reg4_b4  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n7 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out0 [4]));  // sources/rtl/mcu/alu.v(46)
  reg_ar_as_w1 \u_cpu/u_alu/reg4_b5  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n7 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out0 [5]));  // sources/rtl/mcu/alu.v(46)
  reg_ar_as_w1 \u_cpu/u_alu/reg4_b6  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n7 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out0 [6]));  // sources/rtl/mcu/alu.v(46)
  reg_ar_as_w1 \u_cpu/u_alu/reg4_b7  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n7 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out0 [7]));  // sources/rtl/mcu/alu.v(46)
  reg_ar_as_w1 \u_cpu/u_alu/reg4_b8  (
    .clk(vga_clk),
    .d(\u_cpu/u_alu/n7 [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out0 [8]));  // sources/rtl/mcu/alu.v(46)
  add_pu8_mu8_o9 \u_cpu/u_alu/sub0  (
    .i0(bus_wdata),
    .i1(\u_cpu/alu_in2 ),
    .o(\u_cpu/u_alu/n5 ));  // sources/rtl/mcu/alu.v(45)
  AL_MUX \u_cpu/u_alu/u1  (
    .i0(bus_wdata[4]),
    .i1(bus_wdata[5]),
    .sel(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n0 ));  // sources/rtl/mcu/alu.v(83)
  and \u_cpu/u_alu/u10  (\u_cpu/u_alu/n50 [0], bus_wdata[0], \u_cpu/alu_in2 [0]);  // sources/rtl/mcu/alu.v(70)
  or \u_cpu/u_alu/u100  (\u_cpu/u_alu/n89 , \u_cpu/u_alu/n87 , \u_cpu/u_alu/n88 );  // sources/rtl/mcu/alu.v(68)
  or \u_cpu/u_alu/u101  (\u_cpu/u_alu/n90 , bus_wdata[4], bus_wdata[5]);  // sources/rtl/mcu/alu.v(68)
  or \u_cpu/u_alu/u102  (\u_cpu/u_alu/n91 , bus_wdata[6], bus_wdata[7]);  // sources/rtl/mcu/alu.v(68)
  or \u_cpu/u_alu/u103  (\u_cpu/u_alu/n92 , \u_cpu/u_alu/n90 , \u_cpu/u_alu/n91 );  // sources/rtl/mcu/alu.v(68)
  or \u_cpu/u_alu/u104  (\u_cpu/u_alu/n47 , \u_cpu/u_alu/n89 , \u_cpu/u_alu/n92 );  // sources/rtl/mcu/alu.v(68)
  or \u_cpu/u_alu/u11  (\u_cpu/u_alu/n54 [0], bus_wdata[0], \u_cpu/alu_in2 [0]);  // sources/rtl/mcu/alu.v(74)
  AL_MUX \u_cpu/u_alu/u12  (
    .i0(bus_wdata[7]),
    .i1(bus_wdata[6]),
    .sel(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n39 ));  // sources/rtl/mcu/alu.v(81)
  AL_MUX \u_cpu/u_alu/u13  (
    .i0(bus_wdata[5]),
    .i1(bus_wdata[6]),
    .sel(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n78 ));  // sources/rtl/mcu/alu.v(83)
  AL_MUX \u_cpu/u_alu/u14  (
    .i0(bus_wdata[6]),
    .i1(bus_wdata[7]),
    .sel(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n65 ));  // sources/rtl/mcu/alu.v(83)
  AL_MUX \u_cpu/u_alu/u15  (
    .i0(bus_wdata[7]),
    .i1(1'b0),
    .sel(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n64 ));  // sources/rtl/mcu/alu.v(83)
  AL_MUX \u_cpu/u_alu/u16  (
    .i0(\u_cpu/u_alu/n52 ),
    .i1(\u_cpu/u_alu/n2 ),
    .sel(\u_cpu/alu_in2 [1]),
    .o(\u_cpu/u_alu/n63 ));  // sources/rtl/mcu/alu.v(83)
  AL_MUX \u_cpu/u_alu/u17  (
    .i0(\u_cpu/u_alu/n51 ),
    .i1(\u_cpu/u_alu/n1 ),
    .sel(\u_cpu/alu_in2 [1]),
    .o(\u_cpu/u_alu/n62 ));  // sources/rtl/mcu/alu.v(83)
  AL_MUX \u_cpu/u_alu/u18  (
    .i0(\u_cpu/u_alu/n2 ),
    .i1(\u_cpu/u_alu/n0 ),
    .sel(\u_cpu/alu_in2 [1]),
    .o(\u_cpu/u_alu/n61 ));  // sources/rtl/mcu/alu.v(83)
  AL_MUX \u_cpu/u_alu/u19  (
    .i0(\u_cpu/u_alu/n1 ),
    .i1(\u_cpu/u_alu/n78 ),
    .sel(\u_cpu/alu_in2 [1]),
    .o(\u_cpu/u_alu/n60 ));  // sources/rtl/mcu/alu.v(83)
  AL_MUX \u_cpu/u_alu/u2  (
    .i0(bus_wdata[3]),
    .i1(bus_wdata[4]),
    .sel(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n1 ));  // sources/rtl/mcu/alu.v(83)
  AL_MUX \u_cpu/u_alu/u20  (
    .i0(\u_cpu/u_alu/n0 ),
    .i1(\u_cpu/u_alu/n65 ),
    .sel(\u_cpu/alu_in2 [1]),
    .o(\u_cpu/u_alu/n59 ));  // sources/rtl/mcu/alu.v(83)
  AL_MUX \u_cpu/u_alu/u21  (
    .i0(\u_cpu/u_alu/n78 ),
    .i1(\u_cpu/u_alu/n64 ),
    .sel(\u_cpu/alu_in2 [1]),
    .o(\u_cpu/u_alu/n77 ));  // sources/rtl/mcu/alu.v(83)
  AL_MUX \u_cpu/u_alu/u22  (
    .i0(\u_cpu/u_alu/n65 ),
    .i1(1'b0),
    .sel(\u_cpu/alu_in2 [1]),
    .o(\u_cpu/u_alu/n76 ));  // sources/rtl/mcu/alu.v(83)
  AL_MUX \u_cpu/u_alu/u23  (
    .i0(\u_cpu/u_alu/n64 ),
    .i1(1'b0),
    .sel(\u_cpu/alu_in2 [1]),
    .o(\u_cpu/u_alu/n75 ));  // sources/rtl/mcu/alu.v(83)
  AL_MUX \u_cpu/u_alu/u24  (
    .i0(\u_cpu/u_alu/n63 ),
    .i1(\u_cpu/u_alu/n59 ),
    .sel(\u_cpu/alu_in2 [2]),
    .o(\u_cpu/u_alu/n74 ));  // sources/rtl/mcu/alu.v(83)
  AL_MUX \u_cpu/u_alu/u25  (
    .i0(\u_cpu/u_alu/n62 ),
    .i1(\u_cpu/u_alu/n77 ),
    .sel(\u_cpu/alu_in2 [2]),
    .o(\u_cpu/u_alu/n73 ));  // sources/rtl/mcu/alu.v(83)
  AL_MUX \u_cpu/u_alu/u26  (
    .i0(\u_cpu/u_alu/n61 ),
    .i1(\u_cpu/u_alu/n76 ),
    .sel(\u_cpu/alu_in2 [2]),
    .o(\u_cpu/u_alu/n72 ));  // sources/rtl/mcu/alu.v(83)
  AL_MUX \u_cpu/u_alu/u27  (
    .i0(\u_cpu/u_alu/n60 ),
    .i1(\u_cpu/u_alu/n75 ),
    .sel(\u_cpu/alu_in2 [2]),
    .o(\u_cpu/u_alu/n71 ));  // sources/rtl/mcu/alu.v(83)
  AL_MUX \u_cpu/u_alu/u3  (
    .i0(bus_wdata[2]),
    .i1(bus_wdata[3]),
    .sel(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n2 ));  // sources/rtl/mcu/alu.v(83)
  or \u_cpu/u_alu/u32  (\u_cpu/u_alu/n43 , \u_cpu/alu_in2 [3], \u_cpu/alu_in2 [4]);  // sources/rtl/mcu/alu.v(83)
  or \u_cpu/u_alu/u33  (\u_cpu/u_alu/n42 , \u_cpu/alu_in2 [6], \u_cpu/alu_in2 [7]);  // sources/rtl/mcu/alu.v(83)
  or \u_cpu/u_alu/u34  (\u_cpu/u_alu/n41 , \u_cpu/alu_in2 [5], \u_cpu/u_alu/n42 );  // sources/rtl/mcu/alu.v(83)
  or \u_cpu/u_alu/u35  (\u_cpu/u_alu/n40 , \u_cpu/u_alu/n43 , \u_cpu/u_alu/n41 );  // sources/rtl/mcu/alu.v(83)
  AL_MUX \u_cpu/u_alu/u36  (
    .i0(\u_cpu/u_alu/n74 ),
    .i1(1'b0),
    .sel(\u_cpu/u_alu/n40 ),
    .o(\u_cpu/u_alu/n68 [0]));  // sources/rtl/mcu/alu.v(83)
  AL_MUX \u_cpu/u_alu/u37  (
    .i0(\u_cpu/u_alu/n73 ),
    .i1(1'b0),
    .sel(\u_cpu/u_alu/n40 ),
    .o(\u_cpu/u_alu/n68 [1]));  // sources/rtl/mcu/alu.v(83)
  AL_MUX \u_cpu/u_alu/u38  (
    .i0(\u_cpu/u_alu/n72 ),
    .i1(1'b0),
    .sel(\u_cpu/u_alu/n40 ),
    .o(\u_cpu/u_alu/n68 [2]));  // sources/rtl/mcu/alu.v(83)
  AL_MUX \u_cpu/u_alu/u39  (
    .i0(\u_cpu/u_alu/n71 ),
    .i1(1'b0),
    .sel(\u_cpu/u_alu/n40 ),
    .o(\u_cpu/u_alu/n68 [3]));  // sources/rtl/mcu/alu.v(83)
  or \u_cpu/u_alu/u4  (\u_cpu/u_alu/n87 , bus_wdata[0], bus_wdata[1]);  // sources/rtl/mcu/alu.v(68)
  AL_MUX \u_cpu/u_alu/u40  (
    .i0(1'b0),
    .i1(\u_cpu/u_alu/n59 ),
    .sel(\u_cpu/u_alu/u40_sel_is_0_o ),
    .o(\u_cpu/u_alu/n68 [4]));
  and \u_cpu/u_alu/u40_sel_is_0  (\u_cpu/u_alu/u40_sel_is_0_o , \u_cpu/u_alu/n40_neg , \u_cpu/alu_in2[2]_neg );
  AL_MUX \u_cpu/u_alu/u41  (
    .i0(1'b0),
    .i1(\u_cpu/u_alu/n77 ),
    .sel(\u_cpu/u_alu/u40_sel_is_0_o ),
    .o(\u_cpu/u_alu/n68 [5]));
  AL_MUX \u_cpu/u_alu/u42  (
    .i0(1'b0),
    .i1(\u_cpu/u_alu/n76 ),
    .sel(\u_cpu/u_alu/u40_sel_is_0_o ),
    .o(\u_cpu/u_alu/n68 [6]));
  AL_MUX \u_cpu/u_alu/u43  (
    .i0(1'b0),
    .i1(\u_cpu/u_alu/n75 ),
    .sel(\u_cpu/u_alu/u40_sel_is_0_o ),
    .o(\u_cpu/u_alu/n68 [7]));
  AL_MUX \u_cpu/u_alu/u44  (
    .i0(bus_wdata[6]),
    .i1(bus_wdata[5]),
    .sel(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n34 ));  // sources/rtl/mcu/alu.v(81)
  AL_MUX \u_cpu/u_alu/u45  (
    .i0(bus_wdata[5]),
    .i1(bus_wdata[4]),
    .sel(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n33 ));  // sources/rtl/mcu/alu.v(81)
  AL_MUX \u_cpu/u_alu/u46  (
    .i0(bus_wdata[4]),
    .i1(bus_wdata[3]),
    .sel(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n32 ));  // sources/rtl/mcu/alu.v(81)
  AL_MUX \u_cpu/u_alu/u47  (
    .i0(bus_wdata[3]),
    .i1(bus_wdata[2]),
    .sel(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n31 ));  // sources/rtl/mcu/alu.v(81)
  AL_MUX \u_cpu/u_alu/u48  (
    .i0(bus_wdata[2]),
    .i1(bus_wdata[1]),
    .sel(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n30 ));  // sources/rtl/mcu/alu.v(81)
  AL_MUX \u_cpu/u_alu/u49  (
    .i0(bus_wdata[1]),
    .i1(bus_wdata[0]),
    .sel(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n29 ));  // sources/rtl/mcu/alu.v(81)
  and \u_cpu/u_alu/u5  (\u_cpu/u_alu/n49 , \u_cpu/u_alu/n47 , \u_cpu/u_alu/n48 );  // sources/rtl/mcu/alu.v(68)
  AL_MUX \u_cpu/u_alu/u50  (
    .i0(bus_wdata[0]),
    .i1(1'b0),
    .sel(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n28 ));  // sources/rtl/mcu/alu.v(81)
  AL_MUX \u_cpu/u_alu/u51  (
    .i0(\u_cpu/u_alu/n39 ),
    .i1(\u_cpu/u_alu/n33 ),
    .sel(\u_cpu/alu_in2 [1]),
    .o(\u_cpu/u_alu/n27 ));  // sources/rtl/mcu/alu.v(81)
  AL_MUX \u_cpu/u_alu/u52  (
    .i0(\u_cpu/u_alu/n34 ),
    .i1(\u_cpu/u_alu/n32 ),
    .sel(\u_cpu/alu_in2 [1]),
    .o(\u_cpu/u_alu/n26 ));  // sources/rtl/mcu/alu.v(81)
  AL_MUX \u_cpu/u_alu/u53  (
    .i0(\u_cpu/u_alu/n33 ),
    .i1(\u_cpu/u_alu/n31 ),
    .sel(\u_cpu/alu_in2 [1]),
    .o(\u_cpu/u_alu/n25 ));  // sources/rtl/mcu/alu.v(81)
  AL_MUX \u_cpu/u_alu/u54  (
    .i0(\u_cpu/u_alu/n32 ),
    .i1(\u_cpu/u_alu/n30 ),
    .sel(\u_cpu/alu_in2 [1]),
    .o(\u_cpu/u_alu/n24 ));  // sources/rtl/mcu/alu.v(81)
  AL_MUX \u_cpu/u_alu/u55  (
    .i0(\u_cpu/u_alu/n31 ),
    .i1(\u_cpu/u_alu/n29 ),
    .sel(\u_cpu/alu_in2 [1]),
    .o(\u_cpu/u_alu/n23 ));  // sources/rtl/mcu/alu.v(81)
  AL_MUX \u_cpu/u_alu/u56  (
    .i0(\u_cpu/u_alu/n30 ),
    .i1(\u_cpu/u_alu/n28 ),
    .sel(\u_cpu/alu_in2 [1]),
    .o(\u_cpu/u_alu/n22 ));  // sources/rtl/mcu/alu.v(81)
  AL_MUX \u_cpu/u_alu/u57  (
    .i0(\u_cpu/u_alu/n29 ),
    .i1(1'b0),
    .sel(\u_cpu/alu_in2 [1]),
    .o(\u_cpu/u_alu/n21 ));  // sources/rtl/mcu/alu.v(81)
  AL_MUX \u_cpu/u_alu/u58  (
    .i0(\u_cpu/u_alu/n28 ),
    .i1(1'b0),
    .sel(\u_cpu/alu_in2 [1]),
    .o(\u_cpu/u_alu/n20 ));  // sources/rtl/mcu/alu.v(81)
  AL_MUX \u_cpu/u_alu/u59  (
    .i0(\u_cpu/u_alu/n27 ),
    .i1(\u_cpu/u_alu/n23 ),
    .sel(\u_cpu/alu_in2 [2]),
    .o(\u_cpu/u_alu/n19 ));  // sources/rtl/mcu/alu.v(81)
  or \u_cpu/u_alu/u6  (\u_cpu/u_alu/n81 , \u_cpu/alu_in2 [0], \u_cpu/alu_in2 [1]);  // sources/rtl/mcu/alu.v(68)
  AL_MUX \u_cpu/u_alu/u60  (
    .i0(\u_cpu/u_alu/n26 ),
    .i1(\u_cpu/u_alu/n22 ),
    .sel(\u_cpu/alu_in2 [2]),
    .o(\u_cpu/u_alu/n16 ));  // sources/rtl/mcu/alu.v(81)
  AL_MUX \u_cpu/u_alu/u61  (
    .i0(\u_cpu/u_alu/n25 ),
    .i1(\u_cpu/u_alu/n21 ),
    .sel(\u_cpu/alu_in2 [2]),
    .o(\u_cpu/u_alu/n15 ));  // sources/rtl/mcu/alu.v(81)
  AL_MUX \u_cpu/u_alu/u62  (
    .i0(\u_cpu/u_alu/n24 ),
    .i1(\u_cpu/u_alu/n20 ),
    .sel(\u_cpu/alu_in2 [2]),
    .o(\u_cpu/u_alu/n14 ));  // sources/rtl/mcu/alu.v(81)
  AL_MUX \u_cpu/u_alu/u7  (
    .i0(bus_wdata[1]),
    .i1(bus_wdata[2]),
    .sel(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n51 ));  // sources/rtl/mcu/alu.v(83)
  AL_MUX \u_cpu/u_alu/u71  (
    .i0(\u_cpu/u_alu/n19 ),
    .i1(1'b0),
    .sel(\u_cpu/u_alu/n40 ),
    .o(\u_cpu/u_alu/n67 [7]));  // sources/rtl/mcu/alu.v(81)
  AL_MUX \u_cpu/u_alu/u72  (
    .i0(\u_cpu/u_alu/n16 ),
    .i1(1'b0),
    .sel(\u_cpu/u_alu/n40 ),
    .o(\u_cpu/u_alu/n67 [6]));  // sources/rtl/mcu/alu.v(81)
  AL_MUX \u_cpu/u_alu/u73  (
    .i0(\u_cpu/u_alu/n15 ),
    .i1(1'b0),
    .sel(\u_cpu/u_alu/n40 ),
    .o(\u_cpu/u_alu/n67 [5]));  // sources/rtl/mcu/alu.v(81)
  AL_MUX \u_cpu/u_alu/u74  (
    .i0(\u_cpu/u_alu/n14 ),
    .i1(1'b0),
    .sel(\u_cpu/u_alu/n40 ),
    .o(\u_cpu/u_alu/n67 [4]));  // sources/rtl/mcu/alu.v(81)
  AL_MUX \u_cpu/u_alu/u75  (
    .i0(1'b0),
    .i1(\u_cpu/u_alu/n23 ),
    .sel(\u_cpu/u_alu/u40_sel_is_0_o ),
    .o(\u_cpu/u_alu/n67 [3]));
  AL_MUX \u_cpu/u_alu/u76  (
    .i0(1'b0),
    .i1(\u_cpu/u_alu/n22 ),
    .sel(\u_cpu/u_alu/u40_sel_is_0_o ),
    .o(\u_cpu/u_alu/n67 [2]));
  AL_MUX \u_cpu/u_alu/u77  (
    .i0(1'b0),
    .i1(\u_cpu/u_alu/n21 ),
    .sel(\u_cpu/u_alu/u40_sel_is_0_o ),
    .o(\u_cpu/u_alu/n67 [1]));
  AL_MUX \u_cpu/u_alu/u78  (
    .i0(1'b0),
    .i1(\u_cpu/u_alu/n20 ),
    .sel(\u_cpu/u_alu/u40_sel_is_0_o ),
    .o(\u_cpu/u_alu/n67 [0]));
  or \u_cpu/u_alu/u79  (\u_cpu/u_alu/n54 [1], bus_wdata[1], \u_cpu/alu_in2 [1]);  // sources/rtl/mcu/alu.v(74)
  AL_MUX \u_cpu/u_alu/u8  (
    .i0(bus_wdata[0]),
    .i1(bus_wdata[1]),
    .sel(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n52 ));  // sources/rtl/mcu/alu.v(83)
  or \u_cpu/u_alu/u80  (\u_cpu/u_alu/n54 [2], bus_wdata[2], \u_cpu/alu_in2 [2]);  // sources/rtl/mcu/alu.v(74)
  or \u_cpu/u_alu/u81  (\u_cpu/u_alu/n54 [3], bus_wdata[3], \u_cpu/alu_in2 [3]);  // sources/rtl/mcu/alu.v(74)
  or \u_cpu/u_alu/u82  (\u_cpu/u_alu/n54 [4], bus_wdata[4], \u_cpu/alu_in2 [4]);  // sources/rtl/mcu/alu.v(74)
  or \u_cpu/u_alu/u83  (\u_cpu/u_alu/n54 [5], bus_wdata[5], \u_cpu/alu_in2 [5]);  // sources/rtl/mcu/alu.v(74)
  or \u_cpu/u_alu/u84  (\u_cpu/u_alu/n54 [6], bus_wdata[6], \u_cpu/alu_in2 [6]);  // sources/rtl/mcu/alu.v(74)
  or \u_cpu/u_alu/u85  (\u_cpu/u_alu/n54 [7], bus_wdata[7], \u_cpu/alu_in2 [7]);  // sources/rtl/mcu/alu.v(74)
  and \u_cpu/u_alu/u86  (\u_cpu/u_alu/n50 [1], bus_wdata[1], \u_cpu/alu_in2 [1]);  // sources/rtl/mcu/alu.v(70)
  and \u_cpu/u_alu/u87  (\u_cpu/u_alu/n50 [2], bus_wdata[2], \u_cpu/alu_in2 [2]);  // sources/rtl/mcu/alu.v(70)
  and \u_cpu/u_alu/u88  (\u_cpu/u_alu/n50 [3], bus_wdata[3], \u_cpu/alu_in2 [3]);  // sources/rtl/mcu/alu.v(70)
  and \u_cpu/u_alu/u89  (\u_cpu/u_alu/n50 [4], bus_wdata[4], \u_cpu/alu_in2 [4]);  // sources/rtl/mcu/alu.v(70)
  or \u_cpu/u_alu/u9  (\u_cpu/u_alu/n53 , \u_cpu/u_alu/n47 , \u_cpu/u_alu/n48 );  // sources/rtl/mcu/alu.v(72)
  and \u_cpu/u_alu/u90  (\u_cpu/u_alu/n50 [5], bus_wdata[5], \u_cpu/alu_in2 [5]);  // sources/rtl/mcu/alu.v(70)
  and \u_cpu/u_alu/u91  (\u_cpu/u_alu/n50 [6], bus_wdata[6], \u_cpu/alu_in2 [6]);  // sources/rtl/mcu/alu.v(70)
  and \u_cpu/u_alu/u92  (\u_cpu/u_alu/n50 [7], bus_wdata[7], \u_cpu/alu_in2 [7]);  // sources/rtl/mcu/alu.v(70)
  or \u_cpu/u_alu/u93  (\u_cpu/u_alu/n82 , \u_cpu/alu_in2 [2], \u_cpu/alu_in2 [3]);  // sources/rtl/mcu/alu.v(68)
  or \u_cpu/u_alu/u94  (\u_cpu/u_alu/n83 , \u_cpu/u_alu/n81 , \u_cpu/u_alu/n82 );  // sources/rtl/mcu/alu.v(68)
  or \u_cpu/u_alu/u95  (\u_cpu/u_alu/n84 , \u_cpu/alu_in2 [4], \u_cpu/alu_in2 [5]);  // sources/rtl/mcu/alu.v(68)
  or \u_cpu/u_alu/u97  (\u_cpu/u_alu/n86 , \u_cpu/u_alu/n84 , \u_cpu/u_alu/n42 );  // sources/rtl/mcu/alu.v(68)
  or \u_cpu/u_alu/u98  (\u_cpu/u_alu/n48 , \u_cpu/u_alu/n83 , \u_cpu/u_alu/n86 );  // sources/rtl/mcu/alu.v(68)
  or \u_cpu/u_alu/u99  (\u_cpu/u_alu/n88 , bus_wdata[2], bus_wdata[3]);  // sources/rtl/mcu/alu.v(68)
  add_pu24_pu24_o24 \u_cpu/u_debug/add0  (
    .i0(rom_waddr),
    .i1(24'b000000000000000000000001),
    .o(\u_cpu/u_debug/n7 ));  // sources/rtl/mcu/debug.v(126)
  add_pu12_pu12_o12 \u_cpu/u_debug/add1  (
    .i0(\u_cpu/dbg_rom_raddr [11:0]),
    .i1(12'b000000000001),
    .o(\u_cpu/u_debug/n13 [11:0]));  // sources/rtl/mcu/debug.v(150)
  reg_sr_ss_w1 \u_cpu/u_debug/dbg_en_reg  (
    .clk(vga_clk),
    .d(\u_cpu/dbg_en ),
    .en(1'b1),
    .reset(\u_cpu/u_debug/free_run_cmd ),
    .set(\u_cpu/u_debug/debug_cmd ),
    .q(\u_cpu/dbg_en ));  // sources/rtl/mcu/debug.v(92)
  reg_ar_as_w1 \u_cpu/u_debug/dbg_inst_en_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n2 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_inst_en ));  // sources/rtl/mcu/debug.v(100)
  eq_w8 \u_cpu/u_debug/eq0  (
    .i0(recv_cmd),
    .i1(8'b00000000),
    .o(\u_cpu/u_debug/free_run_cmd ));  // sources/rtl/mcu/debug.v(73)
  eq_w8 \u_cpu/u_debug/eq1  (
    .i0(recv_cmd),
    .i1(8'b00000001),
    .o(\u_cpu/u_debug/debug_cmd ));  // sources/rtl/mcu/debug.v(74)
  eq_w8 \u_cpu/u_debug/eq2  (
    .i0(recv_cmd),
    .i1(8'b00000010),
    .o(\u_cpu/u_debug/clear_rom_addr_cmd ));  // sources/rtl/mcu/debug.v(75)
  eq_w8 \u_cpu/u_debug/eq3  (
    .i0(recv_cmd),
    .i1(8'b00000011),
    .o(\u_cpu/u_debug/clear_rom_data_cmd ));  // sources/rtl/mcu/debug.v(76)
  eq_w8 \u_cpu/u_debug/eq4  (
    .i0(recv_cmd),
    .i1(8'b00000100),
    .o(\u_cpu/u_debug/read_rom_cmd ));  // sources/rtl/mcu/debug.v(77)
  eq_w8 \u_cpu/u_debug/eq5  (
    .i0(recv_cmd),
    .i1(8'b00000101),
    .o(\u_cpu/u_debug/write_rom_cmd ));  // sources/rtl/mcu/debug.v(78)
  eq_w8 \u_cpu/u_debug/eq6  (
    .i0(recv_cmd),
    .i1(8'b00000110),
    .o(\u_cpu/u_debug/read_a_cmd ));  // sources/rtl/mcu/debug.v(79)
  eq_w8 \u_cpu/u_debug/eq7  (
    .i0(recv_cmd),
    .i1(8'b00000111),
    .o(\u_cpu/u_debug/read_b_cmd ));  // sources/rtl/mcu/debug.v(80)
  eq_w8 \u_cpu/u_debug/eq8  (
    .i0(recv_cmd),
    .i1(8'b00001000),
    .o(\u_cpu/u_debug/read_c_cmd ));  // sources/rtl/mcu/debug.v(81)
  eq_w8 \u_cpu/u_debug/eq9  (
    .i0(recv_cmd),
    .i1(8'b00001001),
    .o(\u_cpu/u_debug/read_d_cmd ));  // sources/rtl/mcu/debug.v(82)
  binary_mux_s1_w1 \u_cpu/u_debug/mux10_b0  (
    .i0(\u_cpu/u_debug/n19 [0]),
    .i1(\u_cpu/dbg_info [0]),
    .sel(\u_cpu/dbg_info_en ),
    .o(\u_cpu/u_debug/n21 [0]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux10_b1  (
    .i0(\u_cpu/u_debug/n19 [1]),
    .i1(\u_cpu/dbg_info [1]),
    .sel(\u_cpu/dbg_info_en ),
    .o(\u_cpu/u_debug/n21 [1]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux10_b2  (
    .i0(\u_cpu/u_debug/n19 [2]),
    .i1(\u_cpu/dbg_info [2]),
    .sel(\u_cpu/dbg_info_en ),
    .o(\u_cpu/u_debug/n21 [2]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux10_b3  (
    .i0(\u_cpu/u_debug/n19 [3]),
    .i1(\u_cpu/dbg_info [3]),
    .sel(\u_cpu/dbg_info_en ),
    .o(\u_cpu/u_debug/n21 [3]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux10_b4  (
    .i0(\u_cpu/u_debug/n19 [4]),
    .i1(\u_cpu/dbg_info [4]),
    .sel(\u_cpu/dbg_info_en ),
    .o(\u_cpu/u_debug/n21 [4]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux10_b5  (
    .i0(\u_cpu/u_debug/n19 [5]),
    .i1(\u_cpu/dbg_info [5]),
    .sel(\u_cpu/dbg_info_en ),
    .o(\u_cpu/u_debug/n21 [5]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux10_b6  (
    .i0(\u_cpu/u_debug/n19 [6]),
    .i1(\u_cpu/dbg_info [6]),
    .sel(\u_cpu/dbg_info_en ),
    .o(\u_cpu/u_debug/n21 [6]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux10_b7  (
    .i0(\u_cpu/u_debug/n19 [7]),
    .i1(\u_cpu/dbg_info [7]),
    .sel(\u_cpu/dbg_info_en ),
    .o(\u_cpu/u_debug/n21 [7]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux7_b0  (
    .i0(send_cmd[0]),
    .i1(1'b0),
    .sel(\u_cpu/u_debug/rom_bk_en ),
    .o(\u_cpu/u_debug/n18 [0]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux7_b1  (
    .i0(send_cmd[1]),
    .i1(1'b0),
    .sel(\u_cpu/u_debug/rom_bk_en ),
    .o(\u_cpu/u_debug/n18 [1]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux7_b2  (
    .i0(send_cmd[2]),
    .i1(1'b0),
    .sel(\u_cpu/u_debug/rom_bk_en ),
    .o(\u_cpu/u_debug/n18 [2]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux7_b3  (
    .i0(send_cmd[3]),
    .i1(1'b0),
    .sel(\u_cpu/u_debug/rom_bk_en ),
    .o(\u_cpu/u_debug/n18 [3]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux7_b4  (
    .i0(send_cmd[4]),
    .i1(1'b0),
    .sel(\u_cpu/u_debug/rom_bk_en ),
    .o(\u_cpu/u_debug/n18 [4]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux7_b5  (
    .i0(send_cmd[5]),
    .i1(1'b0),
    .sel(\u_cpu/u_debug/rom_bk_en ),
    .o(\u_cpu/u_debug/n18 [5]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux7_b6  (
    .i0(send_cmd[6]),
    .i1(1'b0),
    .sel(\u_cpu/u_debug/rom_bk_en ),
    .o(\u_cpu/u_debug/n18 [6]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux7_b7  (
    .i0(send_cmd[7]),
    .i1(1'b0),
    .sel(\u_cpu/u_debug/rom_bk_en ),
    .o(\u_cpu/u_debug/n18 [7]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux8_b0  (
    .i0(send_data[0]),
    .i1(\u_cpu/dbg_rom_rdata [0]),
    .sel(\u_cpu/u_debug/rom_bk_en ),
    .o(\u_cpu/u_debug/n19 [0]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux8_b1  (
    .i0(send_data[1]),
    .i1(\u_cpu/dbg_rom_rdata [1]),
    .sel(\u_cpu/u_debug/rom_bk_en ),
    .o(\u_cpu/u_debug/n19 [1]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux8_b2  (
    .i0(send_data[2]),
    .i1(\u_cpu/dbg_rom_rdata [2]),
    .sel(\u_cpu/u_debug/rom_bk_en ),
    .o(\u_cpu/u_debug/n19 [2]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux8_b3  (
    .i0(send_data[3]),
    .i1(\u_cpu/dbg_rom_rdata [3]),
    .sel(\u_cpu/u_debug/rom_bk_en ),
    .o(\u_cpu/u_debug/n19 [3]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux8_b4  (
    .i0(send_data[4]),
    .i1(\u_cpu/dbg_rom_rdata [4]),
    .sel(\u_cpu/u_debug/rom_bk_en ),
    .o(\u_cpu/u_debug/n19 [4]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux8_b5  (
    .i0(send_data[5]),
    .i1(\u_cpu/dbg_rom_rdata [5]),
    .sel(\u_cpu/u_debug/rom_bk_en ),
    .o(\u_cpu/u_debug/n19 [5]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux8_b6  (
    .i0(send_data[6]),
    .i1(\u_cpu/dbg_rom_rdata [6]),
    .sel(\u_cpu/u_debug/rom_bk_en ),
    .o(\u_cpu/u_debug/n19 [6]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux8_b7  (
    .i0(send_data[7]),
    .i1(\u_cpu/dbg_rom_rdata [7]),
    .sel(\u_cpu/u_debug/rom_bk_en ),
    .o(\u_cpu/u_debug/n19 [7]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux9_b0  (
    .i0(\u_cpu/u_debug/n18 [0]),
    .i1(\u_cpu/dbg_info [8]),
    .sel(\u_cpu/dbg_info_en ),
    .o(\u_cpu/u_debug/n20 [0]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux9_b1  (
    .i0(\u_cpu/u_debug/n18 [1]),
    .i1(\u_cpu/dbg_info [9]),
    .sel(\u_cpu/dbg_info_en ),
    .o(\u_cpu/u_debug/n20 [1]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux9_b2  (
    .i0(\u_cpu/u_debug/n18 [2]),
    .i1(\u_cpu/dbg_info [10]),
    .sel(\u_cpu/dbg_info_en ),
    .o(\u_cpu/u_debug/n20 [2]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux9_b3  (
    .i0(\u_cpu/u_debug/n18 [3]),
    .i1(\u_cpu/dbg_info [11]),
    .sel(\u_cpu/dbg_info_en ),
    .o(\u_cpu/u_debug/n20 [3]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux9_b4  (
    .i0(\u_cpu/u_debug/n18 [4]),
    .i1(\u_cpu/dbg_info [12]),
    .sel(\u_cpu/dbg_info_en ),
    .o(\u_cpu/u_debug/n20 [4]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux9_b5  (
    .i0(\u_cpu/u_debug/n18 [5]),
    .i1(\u_cpu/dbg_info [13]),
    .sel(\u_cpu/dbg_info_en ),
    .o(\u_cpu/u_debug/n20 [5]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux9_b6  (
    .i0(\u_cpu/u_debug/n18 [6]),
    .i1(\u_cpu/dbg_info [14]),
    .sel(\u_cpu/dbg_info_en ),
    .o(\u_cpu/u_debug/n20 [6]));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w1 \u_cpu/u_debug/mux9_b7  (
    .i0(\u_cpu/u_debug/n18 [7]),
    .i1(\u_cpu/dbg_info [15]),
    .sel(\u_cpu/dbg_info_en ),
    .o(\u_cpu/u_debug/n20 [7]));  // sources/rtl/mcu/debug.v(179)
  reg_ar_as_w1 \u_cpu/u_debug/reg0_b0  (
    .clk(vga_clk),
    .d(recv_data[0]),
    .en(\u_cpu/u_debug/debug_cmd ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_inst [0]));  // sources/rtl/mcu/debug.v(100)
  reg_ar_as_w1 \u_cpu/u_debug/reg0_b1  (
    .clk(vga_clk),
    .d(recv_data[1]),
    .en(\u_cpu/u_debug/debug_cmd ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_inst [1]));  // sources/rtl/mcu/debug.v(100)
  reg_ar_as_w1 \u_cpu/u_debug/reg0_b2  (
    .clk(vga_clk),
    .d(recv_data[2]),
    .en(\u_cpu/u_debug/debug_cmd ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_inst [2]));  // sources/rtl/mcu/debug.v(100)
  reg_ar_as_w1 \u_cpu/u_debug/reg0_b3  (
    .clk(vga_clk),
    .d(recv_data[3]),
    .en(\u_cpu/u_debug/debug_cmd ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_inst [3]));  // sources/rtl/mcu/debug.v(100)
  reg_ar_as_w1 \u_cpu/u_debug/reg0_b4  (
    .clk(vga_clk),
    .d(recv_data[4]),
    .en(\u_cpu/u_debug/debug_cmd ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_inst [4]));  // sources/rtl/mcu/debug.v(100)
  reg_ar_as_w1 \u_cpu/u_debug/reg0_b5  (
    .clk(vga_clk),
    .d(recv_data[5]),
    .en(\u_cpu/u_debug/debug_cmd ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_inst [5]));  // sources/rtl/mcu/debug.v(100)
  reg_ar_as_w1 \u_cpu/u_debug/reg0_b6  (
    .clk(vga_clk),
    .d(recv_data[6]),
    .en(\u_cpu/u_debug/debug_cmd ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_inst [6]));  // sources/rtl/mcu/debug.v(100)
  reg_ar_as_w1 \u_cpu/u_debug/reg0_b7  (
    .clk(vga_clk),
    .d(recv_data[7]),
    .en(\u_cpu/u_debug/debug_cmd ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_inst [7]));  // sources/rtl/mcu/debug.v(100)
  reg_ar_as_w1 \u_cpu/u_debug/reg1_b0  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n4 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/read_abcd [0]));  // sources/rtl/mcu/debug.v(109)
  reg_ar_as_w1 \u_cpu/u_debug/reg1_b1  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n4 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/read_abcd [1]));  // sources/rtl/mcu/debug.v(109)
  reg_ar_as_w1 \u_cpu/u_debug/reg1_b2  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n4 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/read_abcd [2]));  // sources/rtl/mcu/debug.v(109)
  reg_ar_as_w1 \u_cpu/u_debug/reg1_b3  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n4 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/read_abcd [3]));  // sources/rtl/mcu/debug.v(109)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b0  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n7 [0]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[0]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b1  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n7 [1]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[1]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b10  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n7 [10]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[10]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b11  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n7 [11]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[11]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b12  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n7 [12]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[12]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b13  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n7 [13]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[13]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b14  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n7 [14]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[14]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b15  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n7 [15]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[15]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b16  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n7 [16]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[16]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b17  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n7 [17]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[17]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b18  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n7 [18]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[18]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b19  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n7 [19]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[19]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b2  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n7 [2]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[2]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b20  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n7 [20]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[20]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b21  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n7 [21]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[21]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b22  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n7 [22]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[22]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b23  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n7 [23]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[23]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b3  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n7 [3]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[3]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b4  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n7 [4]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[4]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b5  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n7 [5]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[5]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b6  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n7 [6]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[6]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b7  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n7 [7]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[7]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b8  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n7 [8]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[8]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b9  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n7 [9]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[9]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg3_b0  (
    .clk(vga_clk),
    .d(recv_data[0]),
    .en(\u_cpu/u_debug/n5 ),
    .reset(\u_cpu/u_debug/clear_rom_data_cmd ),
    .set(1'b0),
    .q(rom_wdata[0]));  // sources/rtl/mcu/debug.v(136)
  reg_sr_as_w1 \u_cpu/u_debug/reg3_b1  (
    .clk(vga_clk),
    .d(recv_data[1]),
    .en(\u_cpu/u_debug/n5 ),
    .reset(\u_cpu/u_debug/clear_rom_data_cmd ),
    .set(1'b0),
    .q(rom_wdata[1]));  // sources/rtl/mcu/debug.v(136)
  reg_sr_as_w1 \u_cpu/u_debug/reg3_b2  (
    .clk(vga_clk),
    .d(recv_data[2]),
    .en(\u_cpu/u_debug/n5 ),
    .reset(\u_cpu/u_debug/clear_rom_data_cmd ),
    .set(1'b0),
    .q(rom_wdata[2]));  // sources/rtl/mcu/debug.v(136)
  reg_sr_as_w1 \u_cpu/u_debug/reg3_b3  (
    .clk(vga_clk),
    .d(recv_data[3]),
    .en(\u_cpu/u_debug/n5 ),
    .reset(\u_cpu/u_debug/clear_rom_data_cmd ),
    .set(1'b0),
    .q(rom_wdata[3]));  // sources/rtl/mcu/debug.v(136)
  reg_sr_as_w1 \u_cpu/u_debug/reg3_b4  (
    .clk(vga_clk),
    .d(recv_data[4]),
    .en(\u_cpu/u_debug/n5 ),
    .reset(\u_cpu/u_debug/clear_rom_data_cmd ),
    .set(1'b0),
    .q(rom_wdata[4]));  // sources/rtl/mcu/debug.v(136)
  reg_sr_as_w1 \u_cpu/u_debug/reg3_b5  (
    .clk(vga_clk),
    .d(recv_data[5]),
    .en(\u_cpu/u_debug/n5 ),
    .reset(\u_cpu/u_debug/clear_rom_data_cmd ),
    .set(1'b0),
    .q(rom_wdata[5]));  // sources/rtl/mcu/debug.v(136)
  reg_sr_as_w1 \u_cpu/u_debug/reg3_b6  (
    .clk(vga_clk),
    .d(recv_data[6]),
    .en(\u_cpu/u_debug/n5 ),
    .reset(\u_cpu/u_debug/clear_rom_data_cmd ),
    .set(1'b0),
    .q(rom_wdata[6]));  // sources/rtl/mcu/debug.v(136)
  reg_sr_as_w1 \u_cpu/u_debug/reg3_b7  (
    .clk(vga_clk),
    .d(recv_data[7]),
    .en(\u_cpu/u_debug/n5 ),
    .reset(\u_cpu/u_debug/clear_rom_data_cmd ),
    .set(1'b0),
    .q(rom_wdata[7]));  // sources/rtl/mcu/debug.v(136)
  reg_sr_as_w1 \u_cpu/u_debug/reg4_b0  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n13 [0]),
    .en(\u_cpu/dbg_rom_ren ),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_raddr [0]));  // sources/rtl/mcu/debug.v(151)
  reg_sr_as_w1 \u_cpu/u_debug/reg4_b1  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n13 [1]),
    .en(\u_cpu/dbg_rom_ren ),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_raddr [1]));  // sources/rtl/mcu/debug.v(151)
  reg_sr_as_w1 \u_cpu/u_debug/reg4_b10  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n13 [10]),
    .en(\u_cpu/dbg_rom_ren ),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_raddr [10]));  // sources/rtl/mcu/debug.v(151)
  reg_sr_as_w1 \u_cpu/u_debug/reg4_b11  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n13 [11]),
    .en(\u_cpu/dbg_rom_ren ),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_raddr [11]));  // sources/rtl/mcu/debug.v(151)
  reg_sr_as_w1 \u_cpu/u_debug/reg4_b2  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n13 [2]),
    .en(\u_cpu/dbg_rom_ren ),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_raddr [2]));  // sources/rtl/mcu/debug.v(151)
  reg_sr_as_w1 \u_cpu/u_debug/reg4_b3  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n13 [3]),
    .en(\u_cpu/dbg_rom_ren ),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_raddr [3]));  // sources/rtl/mcu/debug.v(151)
  reg_sr_as_w1 \u_cpu/u_debug/reg4_b4  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n13 [4]),
    .en(\u_cpu/dbg_rom_ren ),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_raddr [4]));  // sources/rtl/mcu/debug.v(151)
  reg_sr_as_w1 \u_cpu/u_debug/reg4_b5  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n13 [5]),
    .en(\u_cpu/dbg_rom_ren ),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_raddr [5]));  // sources/rtl/mcu/debug.v(151)
  reg_sr_as_w1 \u_cpu/u_debug/reg4_b6  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n13 [6]),
    .en(\u_cpu/dbg_rom_ren ),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_raddr [6]));  // sources/rtl/mcu/debug.v(151)
  reg_sr_as_w1 \u_cpu/u_debug/reg4_b7  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n13 [7]),
    .en(\u_cpu/dbg_rom_ren ),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_raddr [7]));  // sources/rtl/mcu/debug.v(151)
  reg_sr_as_w1 \u_cpu/u_debug/reg4_b8  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n13 [8]),
    .en(\u_cpu/dbg_rom_ren ),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_raddr [8]));  // sources/rtl/mcu/debug.v(151)
  reg_sr_as_w1 \u_cpu/u_debug/reg4_b9  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n13 [9]),
    .en(\u_cpu/dbg_rom_ren ),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_raddr [9]));  // sources/rtl/mcu/debug.v(151)
  reg_ar_as_w1 \u_cpu/u_debug/reg5_b0  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n20 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_cmd[0]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg5_b1  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n20 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_cmd[1]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg5_b2  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n20 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_cmd[2]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg5_b3  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n20 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_cmd[3]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg5_b4  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n20 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_cmd[4]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg5_b5  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n20 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_cmd[5]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg5_b6  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n20 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_cmd[6]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg5_b7  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n20 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_cmd[7]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg6_b0  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n21 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_data[0]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg6_b1  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n21 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_data[1]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg6_b2  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n21 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_data[2]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg6_b3  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n21 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_data[3]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg6_b4  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n21 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_data[4]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg6_b5  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n21 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_data[5]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg6_b6  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n21 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_data[6]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg6_b7  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n21 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_data[7]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/rom_bk_en_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/rom_ren_d1 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_debug/rom_bk_en ));  // sources/rtl/mcu/debug.v(159)
  reg_ar_as_w1 \u_cpu/u_debug/rom_ren_d0_reg  (
    .clk(vga_clk),
    .d(\u_cpu/dbg_rom_ren ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_debug/rom_ren_d0 ));  // sources/rtl/mcu/debug.v(159)
  reg_ar_as_w1 \u_cpu/u_debug/rom_ren_d1_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/rom_ren_d0 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_debug/rom_ren_d1 ));  // sources/rtl/mcu/debug.v(159)
  reg_ar_as_w1 \u_cpu/u_debug/rom_ren_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n12 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_ren ));  // sources/rtl/mcu/debug.v(142)
  reg_ar_ss_w1 \u_cpu/u_debug/rom_wen_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n5 ),
    .en(1'b1),
    .reset(1'b0),
    .set(\u_cpu/u_debug/clear_rom_data_cmd ),
    .q(rom_wen));  // sources/rtl/mcu/debug.v(118)
  reg_ar_as_w1 \u_cpu/u_debug/send_en_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_debug/n17 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_en));  // sources/rtl/mcu/debug.v(165)
  and \u_cpu/u_debug/u10  (\u_cpu/u_debug/n4 [0], recv_en, \u_cpu/u_debug/read_a_cmd );  // sources/rtl/mcu/debug.v(108)
  and \u_cpu/u_debug/u11  (\u_cpu/u_debug/n12 , recv_en, \u_cpu/u_debug/read_rom_cmd );  // sources/rtl/mcu/debug.v(141)
  or \u_cpu/u_debug/u12  (\u_cpu/u_debug/n16 , \u_cpu/dbg_info_en , \u_cpu/u_debug/rom_bk_en );  // sources/rtl/mcu/debug.v(164)
  and \u_cpu/u_debug/u13  (\u_cpu/u_debug/n17 , send_ready, \u_cpu/u_debug/n16 );  // sources/rtl/mcu/debug.v(164)
  and \u_cpu/u_debug/u2  (\u_cpu/u_debug/n4 [2], recv_en, \u_cpu/u_debug/read_c_cmd );  // sources/rtl/mcu/debug.v(108)
  and \u_cpu/u_debug/u3  (\u_cpu/u_debug/n4 [1], recv_en, \u_cpu/u_debug/read_b_cmd );  // sources/rtl/mcu/debug.v(108)
  and \u_cpu/u_debug/u6  (\u_cpu/u_debug/n2 , recv_en, \u_cpu/u_debug/debug_cmd );  // sources/rtl/mcu/debug.v(97)
  and \u_cpu/u_debug/u7  (\u_cpu/u_debug/n4 [3], recv_en, \u_cpu/u_debug/read_d_cmd );  // sources/rtl/mcu/debug.v(108)
  and \u_cpu/u_debug/u8  (\u_cpu/u_debug/n5 , recv_en, \u_cpu/u_debug/write_rom_cmd );  // sources/rtl/mcu/debug.v(117)
  reg_ar_as_w1 \u_cpu/u_decode/dbg_info_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n93 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [39]));  // sources/rtl/mcu/decode.v(156)
  eq_w8 \u_cpu/u_decode/eq0  (
    .i0(\u_cpu/inst ),
    .i1(8'b00000001),
    .o(\u_cpu/u_decode/n2 ));  // sources/rtl/mcu/decode.v(96)
  eq_w8 \u_cpu/u_decode/eq1  (
    .i0(\u_cpu/inst ),
    .i1(8'b00000010),
    .o(\u_cpu/u_decode/n3 ));  // sources/rtl/mcu/decode.v(97)
  eq_w8 \u_cpu/u_decode/eq10  (
    .i0(\u_cpu/inst ),
    .i1(8'b00000110),
    .o(\u_cpu/u_decode/n26 ));  // sources/rtl/mcu/decode.v(122)
  eq_w8 \u_cpu/u_decode/eq11  (
    .i0(\u_cpu/inst ),
    .i1(8'b00000111),
    .o(\u_cpu/u_decode/n28 ));  // sources/rtl/mcu/decode.v(123)
  eq_w8 \u_cpu/u_decode/eq12  (
    .i0(\u_cpu/inst ),
    .i1(8'b00001000),
    .o(\u_cpu/u_decode/n30 ));  // sources/rtl/mcu/decode.v(124)
  eq_w8 \u_cpu/u_decode/eq13  (
    .i0(\u_cpu/inst ),
    .i1(8'b00001001),
    .o(\u_cpu/u_decode/n32 ));  // sources/rtl/mcu/decode.v(125)
  eq_w8 \u_cpu/u_decode/eq14  (
    .i0(\u_cpu/inst ),
    .i1(8'b00001010),
    .o(\u_cpu/u_decode/n34 ));  // sources/rtl/mcu/decode.v(126)
  eq_w8 \u_cpu/u_decode/eq15  (
    .i0(\u_cpu/inst ),
    .i1(8'b00001011),
    .o(\u_cpu/u_decode/n36 ));  // sources/rtl/mcu/decode.v(127)
  eq_w8 \u_cpu/u_decode/eq16  (
    .i0(\u_cpu/inst ),
    .i1(8'b00001100),
    .o(\u_cpu/u_decode/n38 ));  // sources/rtl/mcu/decode.v(128)
  eq_w8 \u_cpu/u_decode/eq17  (
    .i0(\u_cpu/inst ),
    .i1(8'b00001101),
    .o(\u_cpu/u_decode/n40 ));  // sources/rtl/mcu/decode.v(129)
  eq_w8 \u_cpu/u_decode/eq18  (
    .i0(\u_cpu/inst ),
    .i1(8'b00001110),
    .o(\u_cpu/u_decode/n42 ));  // sources/rtl/mcu/decode.v(130)
  eq_w8 \u_cpu/u_decode/eq19  (
    .i0(\u_cpu/inst ),
    .i1(8'b00001111),
    .o(\u_cpu/u_decode/n44 ));  // sources/rtl/mcu/decode.v(131)
  eq_w8 \u_cpu/u_decode/eq2  (
    .i0(\u_cpu/inst ),
    .i1(8'b00000011),
    .o(\u_cpu/u_decode/n5 ));  // sources/rtl/mcu/decode.v(98)
  eq_w8 \u_cpu/u_decode/eq20  (
    .i0(\u_cpu/inst ),
    .i1(8'b00010000),
    .o(\u_cpu/u_decode/n46 ));  // sources/rtl/mcu/decode.v(132)
  eq_w8 \u_cpu/u_decode/eq21  (
    .i0(\u_cpu/inst ),
    .i1(8'b00010001),
    .o(\u_cpu/u_decode/n48 ));  // sources/rtl/mcu/decode.v(133)
  eq_w8 \u_cpu/u_decode/eq22  (
    .i0(\u_cpu/inst ),
    .i1(8'b00010010),
    .o(\u_cpu/u_decode/n50 ));  // sources/rtl/mcu/decode.v(134)
  eq_w8 \u_cpu/u_decode/eq23  (
    .i0(\u_cpu/inst ),
    .i1(8'b00010011),
    .o(\u_cpu/u_decode/n52 ));  // sources/rtl/mcu/decode.v(135)
  eq_w8 \u_cpu/u_decode/eq24  (
    .i0(\u_cpu/inst ),
    .i1(8'b00010100),
    .o(\u_cpu/u_decode/n54 ));  // sources/rtl/mcu/decode.v(136)
  eq_w8 \u_cpu/u_decode/eq25  (
    .i0(\u_cpu/inst ),
    .i1(8'b00010101),
    .o(\u_cpu/u_decode/n56 ));  // sources/rtl/mcu/decode.v(137)
  eq_w8 \u_cpu/u_decode/eq26  (
    .i0(\u_cpu/inst ),
    .i1(8'b00010110),
    .o(\u_cpu/u_decode/n58 ));  // sources/rtl/mcu/decode.v(138)
  eq_w8 \u_cpu/u_decode/eq27  (
    .i0(\u_cpu/inst ),
    .i1(8'b00010111),
    .o(\u_cpu/u_decode/n60 ));  // sources/rtl/mcu/decode.v(139)
  eq_w8 \u_cpu/u_decode/eq28  (
    .i0(\u_cpu/inst ),
    .i1(8'b00011000),
    .o(\u_cpu/u_decode/n62 ));  // sources/rtl/mcu/decode.v(140)
  eq_w8 \u_cpu/u_decode/eq29  (
    .i0(\u_cpu/inst ),
    .i1(8'b00011001),
    .o(\u_cpu/u_decode/n64 ));  // sources/rtl/mcu/decode.v(141)
  eq_w8 \u_cpu/u_decode/eq3  (
    .i0(\u_cpu/inst ),
    .i1(8'b00000100),
    .o(\u_cpu/u_decode/n7 ));  // sources/rtl/mcu/decode.v(99)
  eq_w8 \u_cpu/u_decode/eq30  (
    .i0(\u_cpu/inst ),
    .i1(8'b00011010),
    .o(\u_cpu/u_decode/n66 ));  // sources/rtl/mcu/decode.v(142)
  eq_w8 \u_cpu/u_decode/eq31  (
    .i0(\u_cpu/inst ),
    .i1(8'b00011011),
    .o(\u_cpu/u_decode/n68 ));  // sources/rtl/mcu/decode.v(143)
  eq_w8 \u_cpu/u_decode/eq32  (
    .i0(\u_cpu/inst ),
    .i1(8'b00011100),
    .o(\u_cpu/u_decode/n70 ));  // sources/rtl/mcu/decode.v(144)
  eq_w8 \u_cpu/u_decode/eq33  (
    .i0(\u_cpu/inst ),
    .i1(8'b00011101),
    .o(\u_cpu/u_decode/n72 ));  // sources/rtl/mcu/decode.v(145)
  eq_w8 \u_cpu/u_decode/eq34  (
    .i0(\u_cpu/inst ),
    .i1(8'b00011110),
    .o(\u_cpu/u_decode/n74 ));  // sources/rtl/mcu/decode.v(146)
  eq_w8 \u_cpu/u_decode/eq35  (
    .i0(\u_cpu/inst ),
    .i1(8'b00011111),
    .o(\u_cpu/u_decode/n76 ));  // sources/rtl/mcu/decode.v(147)
  eq_w8 \u_cpu/u_decode/eq36  (
    .i0(\u_cpu/inst ),
    .i1(8'b00100000),
    .o(\u_cpu/u_decode/n78 ));  // sources/rtl/mcu/decode.v(148)
  eq_w8 \u_cpu/u_decode/eq37  (
    .i0(\u_cpu/inst ),
    .i1(8'b00100001),
    .o(\u_cpu/u_decode/n80 ));  // sources/rtl/mcu/decode.v(149)
  eq_w8 \u_cpu/u_decode/eq38  (
    .i0(\u_cpu/inst ),
    .i1(8'b00100010),
    .o(\u_cpu/u_decode/n82 ));  // sources/rtl/mcu/decode.v(150)
  eq_w8 \u_cpu/u_decode/eq39  (
    .i0(\u_cpu/inst ),
    .i1(8'b00100011),
    .o(\u_cpu/u_decode/n84 ));  // sources/rtl/mcu/decode.v(151)
  eq_w8 \u_cpu/u_decode/eq40  (
    .i0(\u_cpu/inst ),
    .i1(8'b00100100),
    .o(\u_cpu/u_decode/n86 ));  // sources/rtl/mcu/decode.v(152)
  eq_w8 \u_cpu/u_decode/eq41  (
    .i0(\u_cpu/inst ),
    .i1(8'b00100101),
    .o(\u_cpu/u_decode/n88 ));  // sources/rtl/mcu/decode.v(153)
  eq_w8 \u_cpu/u_decode/eq42  (
    .i0(\u_cpu/inst ),
    .i1(8'b00100110),
    .o(\u_cpu/u_decode/n90 ));  // sources/rtl/mcu/decode.v(154)
  eq_w8 \u_cpu/u_decode/eq43  (
    .i0(\u_cpu/inst ),
    .i1(8'b00100111),
    .o(\u_cpu/u_decode/n92 ));  // sources/rtl/mcu/decode.v(155)
  eq_w8 \u_cpu/u_decode/eq5  (
    .i0(\u_cpu/u_decode/inst_d ),
    .i1(8'b00000001),
    .o(\u_cpu/u_decode/n16 ));  // sources/rtl/mcu/decode.v(117)
  eq_w8 \u_cpu/u_decode/eq6  (
    .i0(\u_cpu/u_decode/inst_d ),
    .i1(8'b00000010),
    .o(\u_cpu/u_decode/n18 ));  // sources/rtl/mcu/decode.v(118)
  eq_w8 \u_cpu/u_decode/eq7  (
    .i0(\u_cpu/u_decode/inst_d ),
    .i1(8'b00000011),
    .o(\u_cpu/u_decode/n20 ));  // sources/rtl/mcu/decode.v(119)
  eq_w8 \u_cpu/u_decode/eq8  (
    .i0(\u_cpu/u_decode/inst_d ),
    .i1(8'b00000100),
    .o(\u_cpu/u_decode/n22 ));  // sources/rtl/mcu/decode.v(120)
  eq_w8 \u_cpu/u_decode/eq9  (
    .i0(\u_cpu/inst ),
    .i1(8'b00000101),
    .o(\u_cpu/u_decode/n24 ));  // sources/rtl/mcu/decode.v(121)
  reg_ar_as_w1 \u_cpu/u_decode/ex_alua_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n45 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [15]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/ex_alub_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n47 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [16]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/ex_aluc_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n49 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [17]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/ex_alud_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n51 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [18]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/ex_alue_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n53 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [19]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/ex_aluf_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n55 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [20]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/ex_alug_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n57 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [21]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/ex_aluh_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n59 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [22]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/ex_alui_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n61 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [23]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/ex_aluj_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n63 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [24]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/ex_aluk_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n65 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [25]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/inst_data_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n9 ),
    .en(\u_cpu/inst_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_decode/inst_data ));  // sources/rtl/mcu/decode.v(104)
  reg_ar_as_w1 \u_cpu/u_decode/rd_bus_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n69 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [27]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/rd_ram_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n71 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [28]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/reg0_b0  (
    .clk(vga_clk),
    .d(\u_cpu/inst [0]),
    .en(\u_cpu/u_decode/inst_data ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_data [0]));  // sources/rtl/mcu/decode.v(111)
  reg_ar_as_w1 \u_cpu/u_decode/reg0_b1  (
    .clk(vga_clk),
    .d(\u_cpu/inst [1]),
    .en(\u_cpu/u_decode/inst_data ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_data [1]));  // sources/rtl/mcu/decode.v(111)
  reg_ar_as_w1 \u_cpu/u_decode/reg0_b2  (
    .clk(vga_clk),
    .d(\u_cpu/inst [2]),
    .en(\u_cpu/u_decode/inst_data ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_data [2]));  // sources/rtl/mcu/decode.v(111)
  reg_ar_as_w1 \u_cpu/u_decode/reg0_b3  (
    .clk(vga_clk),
    .d(\u_cpu/inst [3]),
    .en(\u_cpu/u_decode/inst_data ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_data [3]));  // sources/rtl/mcu/decode.v(111)
  reg_ar_as_w1 \u_cpu/u_decode/reg0_b4  (
    .clk(vga_clk),
    .d(\u_cpu/inst [4]),
    .en(\u_cpu/u_decode/inst_data ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_data [4]));  // sources/rtl/mcu/decode.v(111)
  reg_ar_as_w1 \u_cpu/u_decode/reg0_b5  (
    .clk(vga_clk),
    .d(\u_cpu/inst [5]),
    .en(\u_cpu/u_decode/inst_data ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_data [5]));  // sources/rtl/mcu/decode.v(111)
  reg_ar_as_w1 \u_cpu/u_decode/reg0_b6  (
    .clk(vga_clk),
    .d(\u_cpu/inst [6]),
    .en(\u_cpu/u_decode/inst_data ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_data [6]));  // sources/rtl/mcu/decode.v(111)
  reg_ar_as_w1 \u_cpu/u_decode/reg0_b7  (
    .clk(vga_clk),
    .d(\u_cpu/inst [7]),
    .en(\u_cpu/u_decode/inst_data ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_data [7]));  // sources/rtl/mcu/decode.v(111)
  reg_ar_as_w1 \u_cpu/u_decode/reg1_b0  (
    .clk(vga_clk),
    .d(\u_cpu/inst [0]),
    .en(\u_cpu/inst_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_decode/inst_d [0]));  // sources/rtl/mcu/decode.v(89)
  reg_ar_as_w1 \u_cpu/u_decode/reg1_b1  (
    .clk(vga_clk),
    .d(\u_cpu/inst [1]),
    .en(\u_cpu/inst_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_decode/inst_d [1]));  // sources/rtl/mcu/decode.v(89)
  reg_ar_as_w1 \u_cpu/u_decode/reg1_b2  (
    .clk(vga_clk),
    .d(\u_cpu/inst [2]),
    .en(\u_cpu/inst_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_decode/inst_d [2]));  // sources/rtl/mcu/decode.v(89)
  reg_ar_as_w1 \u_cpu/u_decode/reg1_b3  (
    .clk(vga_clk),
    .d(\u_cpu/inst [3]),
    .en(\u_cpu/inst_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_decode/inst_d [3]));  // sources/rtl/mcu/decode.v(89)
  reg_ar_as_w1 \u_cpu/u_decode/reg1_b4  (
    .clk(vga_clk),
    .d(\u_cpu/inst [4]),
    .en(\u_cpu/inst_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_decode/inst_d [4]));  // sources/rtl/mcu/decode.v(89)
  reg_ar_as_w1 \u_cpu/u_decode/reg1_b5  (
    .clk(vga_clk),
    .d(\u_cpu/inst [5]),
    .en(\u_cpu/inst_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_decode/inst_d [5]));  // sources/rtl/mcu/decode.v(89)
  reg_ar_as_w1 \u_cpu/u_decode/reg1_b6  (
    .clk(vga_clk),
    .d(\u_cpu/inst [6]),
    .en(\u_cpu/inst_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_decode/inst_d [6]));  // sources/rtl/mcu/decode.v(89)
  reg_ar_as_w1 \u_cpu/u_decode/reg1_b7  (
    .clk(vga_clk),
    .d(\u_cpu/inst [7]),
    .en(\u_cpu/inst_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_decode/inst_d [7]));  // sources/rtl/mcu/decode.v(89)
  and \u_cpu/u_decode/u10  (\u_cpu/u_decode/n15 , \u_cpu/u_decode/inst_data , \u_cpu/inst_en );  // sources/rtl/mcu/decode.v(117)
  and \u_cpu/u_decode/u11  (\u_cpu/u_decode/n17 , \u_cpu/u_decode/n15 , \u_cpu/u_decode/n16 );  // sources/rtl/mcu/decode.v(117)
  and \u_cpu/u_decode/u12  (\u_cpu/u_decode/n19 , \u_cpu/u_decode/n15 , \u_cpu/u_decode/n18 );  // sources/rtl/mcu/decode.v(118)
  and \u_cpu/u_decode/u13  (\u_cpu/u_decode/n21 , \u_cpu/u_decode/n15 , \u_cpu/u_decode/n20 );  // sources/rtl/mcu/decode.v(119)
  and \u_cpu/u_decode/u14  (\u_cpu/u_decode/n23 , \u_cpu/u_decode/n15 , \u_cpu/u_decode/n22 );  // sources/rtl/mcu/decode.v(120)
  and \u_cpu/u_decode/u15  (\u_cpu/u_decode/n25 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n24 );  // sources/rtl/mcu/decode.v(121)
  and \u_cpu/u_decode/u16  (\u_cpu/u_decode/n27 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n26 );  // sources/rtl/mcu/decode.v(122)
  and \u_cpu/u_decode/u17  (\u_cpu/u_decode/n29 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n28 );  // sources/rtl/mcu/decode.v(123)
  and \u_cpu/u_decode/u18  (\u_cpu/u_decode/n31 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n30 );  // sources/rtl/mcu/decode.v(124)
  and \u_cpu/u_decode/u19  (\u_cpu/u_decode/n33 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n32 );  // sources/rtl/mcu/decode.v(125)
  not \u_cpu/u_decode/u2  (\u_cpu/u_decode/n1 , \u_cpu/u_decode/inst_data );  // sources/rtl/mcu/decode.v(96)
  and \u_cpu/u_decode/u20  (\u_cpu/u_decode/n35 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n34 );  // sources/rtl/mcu/decode.v(126)
  and \u_cpu/u_decode/u21  (\u_cpu/u_decode/n37 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n36 );  // sources/rtl/mcu/decode.v(127)
  and \u_cpu/u_decode/u22  (\u_cpu/u_decode/n39 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n38 );  // sources/rtl/mcu/decode.v(128)
  and \u_cpu/u_decode/u23  (\u_cpu/u_decode/n41 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n40 );  // sources/rtl/mcu/decode.v(129)
  and \u_cpu/u_decode/u24  (\u_cpu/u_decode/n43 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n42 );  // sources/rtl/mcu/decode.v(130)
  and \u_cpu/u_decode/u25  (\u_cpu/u_decode/n45 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n44 );  // sources/rtl/mcu/decode.v(131)
  and \u_cpu/u_decode/u26  (\u_cpu/u_decode/n47 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n46 );  // sources/rtl/mcu/decode.v(132)
  and \u_cpu/u_decode/u27  (\u_cpu/u_decode/n49 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n48 );  // sources/rtl/mcu/decode.v(133)
  and \u_cpu/u_decode/u28  (\u_cpu/u_decode/n51 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n50 );  // sources/rtl/mcu/decode.v(134)
  and \u_cpu/u_decode/u29  (\u_cpu/u_decode/n53 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n52 );  // sources/rtl/mcu/decode.v(135)
  or \u_cpu/u_decode/u3  (\u_cpu/u_decode/n4 , \u_cpu/u_decode/n2 , \u_cpu/u_decode/n3 );  // sources/rtl/mcu/decode.v(97)
  and \u_cpu/u_decode/u32  (\u_cpu/u_decode/n55 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n54 );  // sources/rtl/mcu/decode.v(136)
  and \u_cpu/u_decode/u35  (\u_cpu/u_decode/n57 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n56 );  // sources/rtl/mcu/decode.v(137)
  and \u_cpu/u_decode/u38  (\u_cpu/u_decode/n59 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n58 );  // sources/rtl/mcu/decode.v(138)
  or \u_cpu/u_decode/u4  (\u_cpu/u_decode/n6 , \u_cpu/u_decode/n4 , \u_cpu/u_decode/n5 );  // sources/rtl/mcu/decode.v(98)
  and \u_cpu/u_decode/u41  (\u_cpu/u_decode/n61 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n60 );  // sources/rtl/mcu/decode.v(139)
  and \u_cpu/u_decode/u44  (\u_cpu/u_decode/n63 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n62 );  // sources/rtl/mcu/decode.v(140)
  and \u_cpu/u_decode/u47  (\u_cpu/u_decode/n65 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n64 );  // sources/rtl/mcu/decode.v(141)
  or \u_cpu/u_decode/u5  (\u_cpu/u_decode/n8 , \u_cpu/u_decode/n6 , \u_cpu/u_decode/n7 );  // sources/rtl/mcu/decode.v(99)
  and \u_cpu/u_decode/u50  (\u_cpu/u_decode/n67 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n66 );  // sources/rtl/mcu/decode.v(142)
  and \u_cpu/u_decode/u53  (\u_cpu/u_decode/n69 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n68 );  // sources/rtl/mcu/decode.v(143)
  and \u_cpu/u_decode/u56  (\u_cpu/u_decode/n71 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n70 );  // sources/rtl/mcu/decode.v(144)
  and \u_cpu/u_decode/u59  (\u_cpu/u_decode/n73 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n72 );  // sources/rtl/mcu/decode.v(145)
  and \u_cpu/u_decode/u6  (\u_cpu/u_decode/n9 , \u_cpu/u_decode/n1 , \u_cpu/u_decode/n8 );  // sources/rtl/mcu/decode.v(99)
  and \u_cpu/u_decode/u62  (\u_cpu/u_decode/n75 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n74 );  // sources/rtl/mcu/decode.v(146)
  and \u_cpu/u_decode/u65  (\u_cpu/u_decode/n77 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n76 );  // sources/rtl/mcu/decode.v(147)
  and \u_cpu/u_decode/u68  (\u_cpu/u_decode/n79 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n78 );  // sources/rtl/mcu/decode.v(148)
  and \u_cpu/u_decode/u71  (\u_cpu/u_decode/n81 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n80 );  // sources/rtl/mcu/decode.v(149)
  and \u_cpu/u_decode/u74  (\u_cpu/u_decode/n83 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n82 );  // sources/rtl/mcu/decode.v(150)
  and \u_cpu/u_decode/u77  (\u_cpu/u_decode/n85 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n84 );  // sources/rtl/mcu/decode.v(151)
  and \u_cpu/u_decode/u8  (\u_cpu/u_decode/n12 , \u_cpu/u_decode/n1 , \u_cpu/inst_en );  // sources/rtl/mcu/decode.v(116)
  and \u_cpu/u_decode/u80  (\u_cpu/u_decode/n87 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n86 );  // sources/rtl/mcu/decode.v(152)
  and \u_cpu/u_decode/u83  (\u_cpu/u_decode/n89 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n88 );  // sources/rtl/mcu/decode.v(153)
  and \u_cpu/u_decode/u86  (\u_cpu/u_decode/n91 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n90 );  // sources/rtl/mcu/decode.v(154)
  and \u_cpu/u_decode/u89  (\u_cpu/u_decode/n93 , \u_cpu/u_decode/n12 , \u_cpu/u_decode/n92 );  // sources/rtl/mcu/decode.v(155)
  reg_ar_as_w1 \u_cpu/u_decode/wt_a_bt_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n33 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [9]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_a_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n17 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [1]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_a_rt_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n25 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [5]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_b_bt_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n35 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [10]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_b_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n19 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [2]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_b_rt_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n27 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [6]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_bus_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n67 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [26]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_c_bt_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n37 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [11]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_c_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n21 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [3]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_c_rt_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n29 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [7]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_d_bt_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n39 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [12]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_d_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n23 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [4]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_d_rt_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n31 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [8]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_pc_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n41 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [13]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_ram_a_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n73 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [29]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_ram_alu0_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n79 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [32]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_ram_alu1_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n81 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [33]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_ram_alu2_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n83 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [34]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_ram_alu3_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n85 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [35]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_ram_alu4_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n87 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [36]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_ram_alu5_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n89 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [37]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_ram_alu6_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n91 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [38]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_ram_b_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n75 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [30]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_ram_c_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n77 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [31]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_timer_cmd_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_decode/n43 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [14]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_execute/bus_ren_reg  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [27]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_ren));  // sources/rtl/mcu/execute.v(319)
  reg_ar_as_w1 \u_cpu/u_execute/bus_to_a_wen_reg  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/bus_to_a_wen ));  // sources/rtl/mcu/execute.v(212)
  reg_ar_as_w1 \u_cpu/u_execute/bus_to_b_wen_reg  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/bus_to_b_wen ));  // sources/rtl/mcu/execute.v(212)
  reg_ar_as_w1 \u_cpu/u_execute/bus_to_c_wen_reg  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [11]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/bus_to_c_wen ));  // sources/rtl/mcu/execute.v(212)
  reg_ar_as_w1 \u_cpu/u_execute/bus_to_d_wen_reg  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [12]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/bus_to_d_wen ));  // sources/rtl/mcu/execute.v(212)
  reg_ar_as_w1 \u_cpu/u_execute/bus_wen_reg  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [26]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_wen));  // sources/rtl/mcu/execute.v(310)
  reg_ar_as_w1 \u_cpu/u_execute/dbg_info_en0_reg  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [39]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/dbg_info_en0 ));  // sources/rtl/mcu/execute.v(336)
  reg_ar_as_w1 \u_cpu/u_execute/dbg_info_en_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n34 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info_en ));  // sources/rtl/mcu/execute.v(336)
  eq_w8 \u_cpu/u_execute/eq0  (
    .i0(bus_raddr),
    .i1(ram_waddr),
    .o(\u_cpu/u_execute/n0 ));  // sources/rtl/mcu/execute.v(223)
  binary_mux_s1_w1 \u_cpu/u_execute/mux0_b0  (
    .i0(ram_rdata[0]),
    .i1(ram_wdata[0]),
    .sel(\u_cpu/u_execute/n0 ),
    .o(\u_cpu/u_execute/n1 [0]));  // sources/rtl/mcu/execute.v(226)
  binary_mux_s1_w1 \u_cpu/u_execute/mux0_b1  (
    .i0(ram_rdata[1]),
    .i1(ram_wdata[1]),
    .sel(\u_cpu/u_execute/n0 ),
    .o(\u_cpu/u_execute/n1 [1]));  // sources/rtl/mcu/execute.v(226)
  binary_mux_s1_w1 \u_cpu/u_execute/mux0_b2  (
    .i0(ram_rdata[2]),
    .i1(ram_wdata[2]),
    .sel(\u_cpu/u_execute/n0 ),
    .o(\u_cpu/u_execute/n1 [2]));  // sources/rtl/mcu/execute.v(226)
  binary_mux_s1_w1 \u_cpu/u_execute/mux0_b3  (
    .i0(ram_rdata[3]),
    .i1(ram_wdata[3]),
    .sel(\u_cpu/u_execute/n0 ),
    .o(\u_cpu/u_execute/n1 [3]));  // sources/rtl/mcu/execute.v(226)
  binary_mux_s1_w1 \u_cpu/u_execute/mux0_b4  (
    .i0(ram_rdata[4]),
    .i1(ram_wdata[4]),
    .sel(\u_cpu/u_execute/n0 ),
    .o(\u_cpu/u_execute/n1 [4]));  // sources/rtl/mcu/execute.v(226)
  binary_mux_s1_w1 \u_cpu/u_execute/mux0_b5  (
    .i0(ram_rdata[5]),
    .i1(ram_wdata[5]),
    .sel(\u_cpu/u_execute/n0 ),
    .o(\u_cpu/u_execute/n1 [5]));  // sources/rtl/mcu/execute.v(226)
  binary_mux_s1_w1 \u_cpu/u_execute/mux0_b6  (
    .i0(ram_rdata[6]),
    .i1(ram_wdata[6]),
    .sel(\u_cpu/u_execute/n0 ),
    .o(\u_cpu/u_execute/n1 [6]));  // sources/rtl/mcu/execute.v(226)
  binary_mux_s1_w1 \u_cpu/u_execute/mux0_b7  (
    .i0(ram_rdata[7]),
    .i1(ram_wdata[7]),
    .sel(\u_cpu/u_execute/n0 ),
    .o(\u_cpu/u_execute/n1 [7]));  // sources/rtl/mcu/execute.v(226)
  binary_mux_s1_w1 \u_cpu/u_execute/mux10_b0  (
    .i0(bus_raddr[0]),
    .i1(\u_cpu/u_execute/n1 [0]),
    .sel(\u_cpu/u_execute/ram_to_d_wen ),
    .o(\u_cpu/u_execute/n27 [0]));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w1 \u_cpu/u_execute/mux10_b1  (
    .i0(bus_raddr[1]),
    .i1(\u_cpu/u_execute/n1 [1]),
    .sel(\u_cpu/u_execute/ram_to_d_wen ),
    .o(\u_cpu/u_execute/n27 [1]));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w1 \u_cpu/u_execute/mux10_b2  (
    .i0(bus_raddr[2]),
    .i1(\u_cpu/u_execute/n1 [2]),
    .sel(\u_cpu/u_execute/ram_to_d_wen ),
    .o(\u_cpu/u_execute/n27 [2]));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w1 \u_cpu/u_execute/mux10_b3  (
    .i0(bus_raddr[3]),
    .i1(\u_cpu/u_execute/n1 [3]),
    .sel(\u_cpu/u_execute/ram_to_d_wen ),
    .o(\u_cpu/u_execute/n27 [3]));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w1 \u_cpu/u_execute/mux10_b4  (
    .i0(bus_raddr[4]),
    .i1(\u_cpu/u_execute/n1 [4]),
    .sel(\u_cpu/u_execute/ram_to_d_wen ),
    .o(\u_cpu/u_execute/n27 [4]));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w1 \u_cpu/u_execute/mux10_b5  (
    .i0(bus_raddr[5]),
    .i1(\u_cpu/u_execute/n1 [5]),
    .sel(\u_cpu/u_execute/ram_to_d_wen ),
    .o(\u_cpu/u_execute/n27 [5]));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w1 \u_cpu/u_execute/mux10_b6  (
    .i0(bus_raddr[6]),
    .i1(\u_cpu/u_execute/n1 [6]),
    .sel(\u_cpu/u_execute/ram_to_d_wen ),
    .o(\u_cpu/u_execute/n27 [6]));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w1 \u_cpu/u_execute/mux10_b7  (
    .i0(bus_raddr[7]),
    .i1(\u_cpu/u_execute/n1 [7]),
    .sel(\u_cpu/u_execute/ram_to_d_wen ),
    .o(\u_cpu/u_execute/n27 [7]));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w1 \u_cpu/u_execute/mux11_b0  (
    .i0(\u_cpu/u_execute/n27 [0]),
    .i1(bus_rdata[0]),
    .sel(\u_cpu/u_execute/bus_to_d_wen ),
    .o(\u_cpu/u_execute/n28 [0]));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w1 \u_cpu/u_execute/mux11_b1  (
    .i0(\u_cpu/u_execute/n27 [1]),
    .i1(bus_rdata[1]),
    .sel(\u_cpu/u_execute/bus_to_d_wen ),
    .o(\u_cpu/u_execute/n28 [1]));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w1 \u_cpu/u_execute/mux11_b2  (
    .i0(\u_cpu/u_execute/n27 [2]),
    .i1(bus_rdata[2]),
    .sel(\u_cpu/u_execute/bus_to_d_wen ),
    .o(\u_cpu/u_execute/n28 [2]));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w1 \u_cpu/u_execute/mux11_b3  (
    .i0(\u_cpu/u_execute/n27 [3]),
    .i1(bus_rdata[3]),
    .sel(\u_cpu/u_execute/bus_to_d_wen ),
    .o(\u_cpu/u_execute/n28 [3]));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w1 \u_cpu/u_execute/mux11_b4  (
    .i0(\u_cpu/u_execute/n27 [4]),
    .i1(bus_rdata[4]),
    .sel(\u_cpu/u_execute/bus_to_d_wen ),
    .o(\u_cpu/u_execute/n28 [4]));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w1 \u_cpu/u_execute/mux11_b5  (
    .i0(\u_cpu/u_execute/n27 [5]),
    .i1(bus_rdata[5]),
    .sel(\u_cpu/u_execute/bus_to_d_wen ),
    .o(\u_cpu/u_execute/n28 [5]));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w1 \u_cpu/u_execute/mux11_b6  (
    .i0(\u_cpu/u_execute/n27 [6]),
    .i1(1'b0),
    .sel(\u_cpu/u_execute/bus_to_d_wen ),
    .o(\u_cpu/u_execute/n28 [6]));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w1 \u_cpu/u_execute/mux11_b7  (
    .i0(\u_cpu/u_execute/n27 [7]),
    .i1(1'b0),
    .sel(\u_cpu/u_execute/bus_to_d_wen ),
    .o(\u_cpu/u_execute/n28 [7]));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w1 \u_cpu/u_execute/mux12_b0  (
    .i0(\u_cpu/u_execute/n28 [0]),
    .i1(\u_cpu/u_execute/rom_data [0]),
    .sel(\u_cpu/u_execute/rom_to_d_wen ),
    .o(\u_cpu/u_execute/n29 [0]));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w1 \u_cpu/u_execute/mux12_b1  (
    .i0(\u_cpu/u_execute/n28 [1]),
    .i1(\u_cpu/u_execute/rom_data [1]),
    .sel(\u_cpu/u_execute/rom_to_d_wen ),
    .o(\u_cpu/u_execute/n29 [1]));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w1 \u_cpu/u_execute/mux12_b2  (
    .i0(\u_cpu/u_execute/n28 [2]),
    .i1(\u_cpu/u_execute/rom_data [2]),
    .sel(\u_cpu/u_execute/rom_to_d_wen ),
    .o(\u_cpu/u_execute/n29 [2]));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w1 \u_cpu/u_execute/mux12_b3  (
    .i0(\u_cpu/u_execute/n28 [3]),
    .i1(\u_cpu/u_execute/rom_data [3]),
    .sel(\u_cpu/u_execute/rom_to_d_wen ),
    .o(\u_cpu/u_execute/n29 [3]));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w1 \u_cpu/u_execute/mux12_b4  (
    .i0(\u_cpu/u_execute/n28 [4]),
    .i1(\u_cpu/u_execute/rom_data [4]),
    .sel(\u_cpu/u_execute/rom_to_d_wen ),
    .o(\u_cpu/u_execute/n29 [4]));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w1 \u_cpu/u_execute/mux12_b5  (
    .i0(\u_cpu/u_execute/n28 [5]),
    .i1(\u_cpu/u_execute/rom_data [5]),
    .sel(\u_cpu/u_execute/rom_to_d_wen ),
    .o(\u_cpu/u_execute/n29 [5]));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w1 \u_cpu/u_execute/mux12_b6  (
    .i0(\u_cpu/u_execute/n28 [6]),
    .i1(\u_cpu/u_execute/rom_data [6]),
    .sel(\u_cpu/u_execute/rom_to_d_wen ),
    .o(\u_cpu/u_execute/n29 [6]));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w1 \u_cpu/u_execute/mux12_b7  (
    .i0(\u_cpu/u_execute/n28 [7]),
    .i1(\u_cpu/u_execute/rom_data [7]),
    .sel(\u_cpu/u_execute/rom_to_d_wen ),
    .o(\u_cpu/u_execute/n29 [7]));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w1 \u_cpu/u_execute/mux14_b0  (
    .i0(\u_cpu/dbg_info [0]),
    .i1(bus_raddr[0]),
    .sel(\u_cpu/read_abcd [3]),
    .o(\u_cpu/u_execute/n35 [0]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux14_b1  (
    .i0(\u_cpu/dbg_info [1]),
    .i1(bus_raddr[1]),
    .sel(\u_cpu/read_abcd [3]),
    .o(\u_cpu/u_execute/n35 [1]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux14_b2  (
    .i0(\u_cpu/dbg_info [2]),
    .i1(bus_raddr[2]),
    .sel(\u_cpu/read_abcd [3]),
    .o(\u_cpu/u_execute/n35 [2]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux14_b3  (
    .i0(\u_cpu/dbg_info [3]),
    .i1(bus_raddr[3]),
    .sel(\u_cpu/read_abcd [3]),
    .o(\u_cpu/u_execute/n35 [3]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux14_b4  (
    .i0(\u_cpu/dbg_info [4]),
    .i1(bus_raddr[4]),
    .sel(\u_cpu/read_abcd [3]),
    .o(\u_cpu/u_execute/n35 [4]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux14_b5  (
    .i0(\u_cpu/dbg_info [5]),
    .i1(bus_raddr[5]),
    .sel(\u_cpu/read_abcd [3]),
    .o(\u_cpu/u_execute/n35 [5]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux14_b6  (
    .i0(\u_cpu/dbg_info [6]),
    .i1(bus_raddr[6]),
    .sel(\u_cpu/read_abcd [3]),
    .o(\u_cpu/u_execute/n35 [6]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux14_b7  (
    .i0(\u_cpu/dbg_info [7]),
    .i1(bus_raddr[7]),
    .sel(\u_cpu/read_abcd [3]),
    .o(\u_cpu/u_execute/n35 [7]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux14_b8  (
    .i0(\u_cpu/dbg_info [8]),
    .i1(1'b1),
    .sel(\u_cpu/read_abcd [3]),
    .o(\u_cpu/u_execute/n35 [8]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux15_b0  (
    .i0(\u_cpu/u_execute/n35 [0]),
    .i1(\u_cpu/u_execute/C [0]),
    .sel(\u_cpu/read_abcd [2]),
    .o(\u_cpu/u_execute/n36 [0]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux15_b1  (
    .i0(\u_cpu/u_execute/n35 [1]),
    .i1(\u_cpu/u_execute/C [1]),
    .sel(\u_cpu/read_abcd [2]),
    .o(\u_cpu/u_execute/n36 [1]));  // sources/rtl/mcu/execute.v(350)
  AL_MUX \u_cpu/u_execute/mux15_b10  (
    .i0(1'b0),
    .i1(\u_cpu/dbg_info [10]),
    .sel(\u_cpu/u_execute/mux15_b10_sel_is_0_o ),
    .o(\u_cpu/u_execute/n36 [10]));
  and \u_cpu/u_execute/mux15_b10_sel_is_0  (\u_cpu/u_execute/mux15_b10_sel_is_0_o , \u_cpu/read_abcd[2]_neg , \u_cpu/read_abcd[3]_neg );
  AL_MUX \u_cpu/u_execute/mux15_b11  (
    .i0(1'b1),
    .i1(\u_cpu/dbg_info [11]),
    .sel(\u_cpu/u_execute/mux15_b10_sel_is_0_o ),
    .o(\u_cpu/u_execute/n36 [11]));
  binary_mux_s1_w1 \u_cpu/u_execute/mux15_b2  (
    .i0(\u_cpu/u_execute/n35 [2]),
    .i1(\u_cpu/u_execute/C [2]),
    .sel(\u_cpu/read_abcd [2]),
    .o(\u_cpu/u_execute/n36 [2]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux15_b3  (
    .i0(\u_cpu/u_execute/n35 [3]),
    .i1(\u_cpu/u_execute/C [3]),
    .sel(\u_cpu/read_abcd [2]),
    .o(\u_cpu/u_execute/n36 [3]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux15_b4  (
    .i0(\u_cpu/u_execute/n35 [4]),
    .i1(\u_cpu/u_execute/C [4]),
    .sel(\u_cpu/read_abcd [2]),
    .o(\u_cpu/u_execute/n36 [4]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux15_b5  (
    .i0(\u_cpu/u_execute/n35 [5]),
    .i1(\u_cpu/u_execute/C [5]),
    .sel(\u_cpu/read_abcd [2]),
    .o(\u_cpu/u_execute/n36 [5]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux15_b6  (
    .i0(\u_cpu/u_execute/n35 [6]),
    .i1(\u_cpu/u_execute/C [6]),
    .sel(\u_cpu/read_abcd [2]),
    .o(\u_cpu/u_execute/n36 [6]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux15_b7  (
    .i0(\u_cpu/u_execute/n35 [7]),
    .i1(\u_cpu/u_execute/C [7]),
    .sel(\u_cpu/read_abcd [2]),
    .o(\u_cpu/u_execute/n36 [7]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux15_b8  (
    .i0(\u_cpu/u_execute/n35 [8]),
    .i1(1'b0),
    .sel(\u_cpu/read_abcd [2]),
    .o(\u_cpu/u_execute/n36 [8]));  // sources/rtl/mcu/execute.v(350)
  AL_MUX \u_cpu/u_execute/mux15_b9  (
    .i0(1'b0),
    .i1(\u_cpu/dbg_info [9]),
    .sel(\u_cpu/u_execute/mux15_b10_sel_is_0_o ),
    .o(\u_cpu/u_execute/n36 [9]));
  binary_mux_s1_w1 \u_cpu/u_execute/mux16_b0  (
    .i0(\u_cpu/u_execute/n36 [0]),
    .i1(\u_cpu/alu_in2 [0]),
    .sel(\u_cpu/read_abcd [1]),
    .o(\u_cpu/u_execute/n37 [0]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux16_b1  (
    .i0(\u_cpu/u_execute/n36 [1]),
    .i1(\u_cpu/alu_in2 [1]),
    .sel(\u_cpu/read_abcd [1]),
    .o(\u_cpu/u_execute/n37 [1]));  // sources/rtl/mcu/execute.v(350)
  and \u_cpu/u_execute/mux16_b12_sel_is_2  (\u_cpu/u_execute/mux16_b12_sel_is_2_o , \u_cpu/read_abcd[1]_neg , \u_cpu/u_execute/mux15_b10_sel_is_0_o );
  binary_mux_s1_w1 \u_cpu/u_execute/mux16_b2  (
    .i0(\u_cpu/u_execute/n36 [2]),
    .i1(\u_cpu/alu_in2 [2]),
    .sel(\u_cpu/read_abcd [1]),
    .o(\u_cpu/u_execute/n37 [2]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux16_b3  (
    .i0(\u_cpu/u_execute/n36 [3]),
    .i1(\u_cpu/alu_in2 [3]),
    .sel(\u_cpu/read_abcd [1]),
    .o(\u_cpu/u_execute/n37 [3]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux16_b4  (
    .i0(\u_cpu/u_execute/n36 [4]),
    .i1(\u_cpu/alu_in2 [4]),
    .sel(\u_cpu/read_abcd [1]),
    .o(\u_cpu/u_execute/n37 [4]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux16_b5  (
    .i0(\u_cpu/u_execute/n36 [5]),
    .i1(\u_cpu/alu_in2 [5]),
    .sel(\u_cpu/read_abcd [1]),
    .o(\u_cpu/u_execute/n37 [5]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux16_b6  (
    .i0(\u_cpu/u_execute/n36 [6]),
    .i1(\u_cpu/alu_in2 [6]),
    .sel(\u_cpu/read_abcd [1]),
    .o(\u_cpu/u_execute/n37 [6]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux16_b7  (
    .i0(\u_cpu/u_execute/n36 [7]),
    .i1(\u_cpu/alu_in2 [7]),
    .sel(\u_cpu/read_abcd [1]),
    .o(\u_cpu/u_execute/n37 [7]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux16_b8  (
    .i0(\u_cpu/u_execute/n36 [8]),
    .i1(1'b1),
    .sel(\u_cpu/read_abcd [1]),
    .o(\u_cpu/u_execute/n37 [8]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux17_b0  (
    .i0(\u_cpu/u_execute/n37 [0]),
    .i1(bus_wdata[0]),
    .sel(\u_cpu/read_abcd [0]),
    .o(\u_cpu/u_execute/n38 [0]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux17_b1  (
    .i0(\u_cpu/u_execute/n37 [1]),
    .i1(bus_wdata[1]),
    .sel(\u_cpu/read_abcd [0]),
    .o(\u_cpu/u_execute/n38 [1]));  // sources/rtl/mcu/execute.v(350)
  AL_MUX \u_cpu/u_execute/mux17_b10  (
    .i0(1'b1),
    .i1(\u_cpu/u_execute/n36 [10]),
    .sel(\u_cpu/u_execute/mux17_b10_sel_is_0_o ),
    .o(\u_cpu/u_execute/n38 [10]));
  and \u_cpu/u_execute/mux17_b10_sel_is_0  (\u_cpu/u_execute/mux17_b10_sel_is_0_o , \u_cpu/read_abcd[0]_neg , \u_cpu/read_abcd[1]_neg );
  AL_MUX \u_cpu/u_execute/mux17_b11  (
    .i0(1'b0),
    .i1(\u_cpu/u_execute/n36 [11]),
    .sel(\u_cpu/u_execute/mux17_b10_sel_is_0_o ),
    .o(\u_cpu/u_execute/n38 [11]));
  AL_MUX \u_cpu/u_execute/mux17_b12  (
    .i0(1'b0),
    .i1(\u_cpu/dbg_info [12]),
    .sel(\u_cpu/u_execute/mux17_b12_sel_is_2_o ),
    .o(\u_cpu/u_execute/n38 [12]));
  and \u_cpu/u_execute/mux17_b12_sel_is_2  (\u_cpu/u_execute/mux17_b12_sel_is_2_o , \u_cpu/read_abcd[0]_neg , \u_cpu/u_execute/mux16_b12_sel_is_2_o );
  AL_MUX \u_cpu/u_execute/mux17_b13  (
    .i0(1'b0),
    .i1(\u_cpu/dbg_info [13]),
    .sel(\u_cpu/u_execute/mux17_b12_sel_is_2_o ),
    .o(\u_cpu/u_execute/n38 [13]));
  AL_MUX \u_cpu/u_execute/mux17_b14  (
    .i0(1'b0),
    .i1(\u_cpu/dbg_info [14]),
    .sel(\u_cpu/u_execute/mux17_b12_sel_is_2_o ),
    .o(\u_cpu/u_execute/n38 [14]));
  AL_MUX \u_cpu/u_execute/mux17_b15  (
    .i0(1'b0),
    .i1(\u_cpu/dbg_info [15]),
    .sel(\u_cpu/u_execute/mux17_b12_sel_is_2_o ),
    .o(\u_cpu/u_execute/n38 [15]));
  binary_mux_s1_w1 \u_cpu/u_execute/mux17_b2  (
    .i0(\u_cpu/u_execute/n37 [2]),
    .i1(bus_wdata[2]),
    .sel(\u_cpu/read_abcd [0]),
    .o(\u_cpu/u_execute/n38 [2]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux17_b3  (
    .i0(\u_cpu/u_execute/n37 [3]),
    .i1(bus_wdata[3]),
    .sel(\u_cpu/read_abcd [0]),
    .o(\u_cpu/u_execute/n38 [3]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux17_b4  (
    .i0(\u_cpu/u_execute/n37 [4]),
    .i1(bus_wdata[4]),
    .sel(\u_cpu/read_abcd [0]),
    .o(\u_cpu/u_execute/n38 [4]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux17_b5  (
    .i0(\u_cpu/u_execute/n37 [5]),
    .i1(bus_wdata[5]),
    .sel(\u_cpu/read_abcd [0]),
    .o(\u_cpu/u_execute/n38 [5]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux17_b6  (
    .i0(\u_cpu/u_execute/n37 [6]),
    .i1(bus_wdata[6]),
    .sel(\u_cpu/read_abcd [0]),
    .o(\u_cpu/u_execute/n38 [6]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux17_b7  (
    .i0(\u_cpu/u_execute/n37 [7]),
    .i1(bus_wdata[7]),
    .sel(\u_cpu/read_abcd [0]),
    .o(\u_cpu/u_execute/n38 [7]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux17_b8  (
    .i0(\u_cpu/u_execute/n37 [8]),
    .i1(1'b0),
    .sel(\u_cpu/read_abcd [0]),
    .o(\u_cpu/u_execute/n38 [8]));  // sources/rtl/mcu/execute.v(350)
  AL_MUX \u_cpu/u_execute/mux17_b9  (
    .i0(1'b1),
    .i1(\u_cpu/u_execute/n36 [9]),
    .sel(\u_cpu/u_execute/mux17_b10_sel_is_0_o ),
    .o(\u_cpu/u_execute/n38 [9]));
  binary_mux_s1_w1 \u_cpu/u_execute/mux18_b0  (
    .i0(\u_cpu/u_execute/n38 [0]),
    .i1(\u_cpu/alu_in2 [0]),
    .sel(\u_cpu/u_execute/dbg_info_en0 ),
    .o(\u_cpu/u_execute/n39 [0]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux18_b1  (
    .i0(\u_cpu/u_execute/n38 [1]),
    .i1(\u_cpu/alu_in2 [1]),
    .sel(\u_cpu/u_execute/dbg_info_en0 ),
    .o(\u_cpu/u_execute/n39 [1]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux18_b10  (
    .i0(\u_cpu/u_execute/n38 [10]),
    .i1(bus_wdata[2]),
    .sel(\u_cpu/u_execute/dbg_info_en0 ),
    .o(\u_cpu/u_execute/n39 [10]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux18_b11  (
    .i0(\u_cpu/u_execute/n38 [11]),
    .i1(bus_wdata[3]),
    .sel(\u_cpu/u_execute/dbg_info_en0 ),
    .o(\u_cpu/u_execute/n39 [11]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux18_b12  (
    .i0(\u_cpu/u_execute/n38 [12]),
    .i1(bus_wdata[4]),
    .sel(\u_cpu/u_execute/dbg_info_en0 ),
    .o(\u_cpu/u_execute/n39 [12]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux18_b13  (
    .i0(\u_cpu/u_execute/n38 [13]),
    .i1(bus_wdata[5]),
    .sel(\u_cpu/u_execute/dbg_info_en0 ),
    .o(\u_cpu/u_execute/n39 [13]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux18_b14  (
    .i0(\u_cpu/u_execute/n38 [14]),
    .i1(bus_wdata[6]),
    .sel(\u_cpu/u_execute/dbg_info_en0 ),
    .o(\u_cpu/u_execute/n39 [14]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux18_b15  (
    .i0(\u_cpu/u_execute/n38 [15]),
    .i1(bus_wdata[7]),
    .sel(\u_cpu/u_execute/dbg_info_en0 ),
    .o(\u_cpu/u_execute/n39 [15]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux18_b2  (
    .i0(\u_cpu/u_execute/n38 [2]),
    .i1(\u_cpu/alu_in2 [2]),
    .sel(\u_cpu/u_execute/dbg_info_en0 ),
    .o(\u_cpu/u_execute/n39 [2]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux18_b3  (
    .i0(\u_cpu/u_execute/n38 [3]),
    .i1(\u_cpu/alu_in2 [3]),
    .sel(\u_cpu/u_execute/dbg_info_en0 ),
    .o(\u_cpu/u_execute/n39 [3]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux18_b4  (
    .i0(\u_cpu/u_execute/n38 [4]),
    .i1(\u_cpu/alu_in2 [4]),
    .sel(\u_cpu/u_execute/dbg_info_en0 ),
    .o(\u_cpu/u_execute/n39 [4]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux18_b5  (
    .i0(\u_cpu/u_execute/n38 [5]),
    .i1(\u_cpu/alu_in2 [5]),
    .sel(\u_cpu/u_execute/dbg_info_en0 ),
    .o(\u_cpu/u_execute/n39 [5]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux18_b6  (
    .i0(\u_cpu/u_execute/n38 [6]),
    .i1(\u_cpu/alu_in2 [6]),
    .sel(\u_cpu/u_execute/dbg_info_en0 ),
    .o(\u_cpu/u_execute/n39 [6]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux18_b7  (
    .i0(\u_cpu/u_execute/n38 [7]),
    .i1(\u_cpu/alu_in2 [7]),
    .sel(\u_cpu/u_execute/dbg_info_en0 ),
    .o(\u_cpu/u_execute/n39 [7]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux18_b8  (
    .i0(\u_cpu/u_execute/n38 [8]),
    .i1(bus_wdata[0]),
    .sel(\u_cpu/u_execute/dbg_info_en0 ),
    .o(\u_cpu/u_execute/n39 [8]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux18_b9  (
    .i0(\u_cpu/u_execute/n38 [9]),
    .i1(bus_wdata[1]),
    .sel(\u_cpu/u_execute/dbg_info_en0 ),
    .o(\u_cpu/u_execute/n39 [9]));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w1 \u_cpu/u_execute/mux1_b0  (
    .i0(bus_wdata[0]),
    .i1(\u_cpu/u_execute/n1 [0]),
    .sel(\u_cpu/u_execute/ram_to_a_wen ),
    .o(\u_cpu/u_execute/n2 [0]));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w1 \u_cpu/u_execute/mux1_b1  (
    .i0(bus_wdata[1]),
    .i1(\u_cpu/u_execute/n1 [1]),
    .sel(\u_cpu/u_execute/ram_to_a_wen ),
    .o(\u_cpu/u_execute/n2 [1]));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w1 \u_cpu/u_execute/mux1_b2  (
    .i0(bus_wdata[2]),
    .i1(\u_cpu/u_execute/n1 [2]),
    .sel(\u_cpu/u_execute/ram_to_a_wen ),
    .o(\u_cpu/u_execute/n2 [2]));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w1 \u_cpu/u_execute/mux1_b3  (
    .i0(bus_wdata[3]),
    .i1(\u_cpu/u_execute/n1 [3]),
    .sel(\u_cpu/u_execute/ram_to_a_wen ),
    .o(\u_cpu/u_execute/n2 [3]));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w1 \u_cpu/u_execute/mux1_b4  (
    .i0(bus_wdata[4]),
    .i1(\u_cpu/u_execute/n1 [4]),
    .sel(\u_cpu/u_execute/ram_to_a_wen ),
    .o(\u_cpu/u_execute/n2 [4]));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w1 \u_cpu/u_execute/mux1_b5  (
    .i0(bus_wdata[5]),
    .i1(\u_cpu/u_execute/n1 [5]),
    .sel(\u_cpu/u_execute/ram_to_a_wen ),
    .o(\u_cpu/u_execute/n2 [5]));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w1 \u_cpu/u_execute/mux1_b6  (
    .i0(bus_wdata[6]),
    .i1(\u_cpu/u_execute/n1 [6]),
    .sel(\u_cpu/u_execute/ram_to_a_wen ),
    .o(\u_cpu/u_execute/n2 [6]));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w1 \u_cpu/u_execute/mux1_b7  (
    .i0(bus_wdata[7]),
    .i1(\u_cpu/u_execute/n1 [7]),
    .sel(\u_cpu/u_execute/ram_to_a_wen ),
    .o(\u_cpu/u_execute/n2 [7]));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w1 \u_cpu/u_execute/mux20_b0  (
    .i0(ram_wdata[0]),
    .i1(\u_cpu/alu_out4 [0]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [9]),
    .o(\u_cpu/u_execute/n43 [0]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux20_b1  (
    .i0(ram_wdata[1]),
    .i1(\u_cpu/alu_out4 [1]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [9]),
    .o(\u_cpu/u_execute/n43 [1]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux20_b2  (
    .i0(ram_wdata[2]),
    .i1(\u_cpu/alu_out4 [2]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [9]),
    .o(\u_cpu/u_execute/n43 [2]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux20_b3  (
    .i0(ram_wdata[3]),
    .i1(\u_cpu/alu_out4 [3]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [9]),
    .o(\u_cpu/u_execute/n43 [3]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux20_b4  (
    .i0(ram_wdata[4]),
    .i1(\u_cpu/alu_out4 [4]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [9]),
    .o(\u_cpu/u_execute/n43 [4]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux20_b5  (
    .i0(ram_wdata[5]),
    .i1(\u_cpu/alu_out4 [5]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [9]),
    .o(\u_cpu/u_execute/n43 [5]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux20_b6  (
    .i0(ram_wdata[6]),
    .i1(\u_cpu/alu_out4 [6]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [9]),
    .o(\u_cpu/u_execute/n43 [6]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux20_b7  (
    .i0(ram_wdata[7]),
    .i1(\u_cpu/alu_out4 [7]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [9]),
    .o(\u_cpu/u_execute/n43 [7]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux21_b0  (
    .i0(\u_cpu/u_execute/n43 [0]),
    .i1(\u_cpu/alu_out3 [0]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [8]),
    .o(\u_cpu/u_execute/n44 [0]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux21_b1  (
    .i0(\u_cpu/u_execute/n43 [1]),
    .i1(\u_cpu/alu_out3 [1]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [8]),
    .o(\u_cpu/u_execute/n44 [1]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux21_b2  (
    .i0(\u_cpu/u_execute/n43 [2]),
    .i1(\u_cpu/alu_out3 [2]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [8]),
    .o(\u_cpu/u_execute/n44 [2]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux21_b3  (
    .i0(\u_cpu/u_execute/n43 [3]),
    .i1(\u_cpu/alu_out3 [3]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [8]),
    .o(\u_cpu/u_execute/n44 [3]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux21_b4  (
    .i0(\u_cpu/u_execute/n43 [4]),
    .i1(\u_cpu/alu_out3 [4]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [8]),
    .o(\u_cpu/u_execute/n44 [4]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux21_b5  (
    .i0(\u_cpu/u_execute/n43 [5]),
    .i1(\u_cpu/alu_out3 [5]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [8]),
    .o(\u_cpu/u_execute/n44 [5]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux21_b6  (
    .i0(\u_cpu/u_execute/n43 [6]),
    .i1(\u_cpu/alu_out3 [6]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [8]),
    .o(\u_cpu/u_execute/n44 [6]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux21_b7  (
    .i0(\u_cpu/u_execute/n43 [7]),
    .i1(\u_cpu/alu_out3 [7]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [8]),
    .o(\u_cpu/u_execute/n44 [7]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux22_b0  (
    .i0(\u_cpu/u_execute/n44 [0]),
    .i1(\u_cpu/alu_out2 [0]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [7]),
    .o(\u_cpu/u_execute/n45 [0]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux22_b1  (
    .i0(\u_cpu/u_execute/n44 [1]),
    .i1(1'b0),
    .sel(\u_cpu/u_execute/wt_ram_cmd [7]),
    .o(\u_cpu/u_execute/n45 [1]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux22_b2  (
    .i0(\u_cpu/u_execute/n44 [2]),
    .i1(1'b0),
    .sel(\u_cpu/u_execute/wt_ram_cmd [7]),
    .o(\u_cpu/u_execute/n45 [2]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux22_b3  (
    .i0(\u_cpu/u_execute/n44 [3]),
    .i1(1'b0),
    .sel(\u_cpu/u_execute/wt_ram_cmd [7]),
    .o(\u_cpu/u_execute/n45 [3]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux22_b4  (
    .i0(\u_cpu/u_execute/n44 [4]),
    .i1(1'b0),
    .sel(\u_cpu/u_execute/wt_ram_cmd [7]),
    .o(\u_cpu/u_execute/n45 [4]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux22_b5  (
    .i0(\u_cpu/u_execute/n44 [5]),
    .i1(1'b0),
    .sel(\u_cpu/u_execute/wt_ram_cmd [7]),
    .o(\u_cpu/u_execute/n45 [5]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux22_b6  (
    .i0(\u_cpu/u_execute/n44 [6]),
    .i1(1'b0),
    .sel(\u_cpu/u_execute/wt_ram_cmd [7]),
    .o(\u_cpu/u_execute/n45 [6]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux22_b7  (
    .i0(\u_cpu/u_execute/n44 [7]),
    .i1(1'b0),
    .sel(\u_cpu/u_execute/wt_ram_cmd [7]),
    .o(\u_cpu/u_execute/n45 [7]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux23_b0  (
    .i0(\u_cpu/u_execute/n45 [0]),
    .i1(\u_cpu/alu_out1 [0]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [6]),
    .o(\u_cpu/u_execute/n46 [0]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux23_b1  (
    .i0(\u_cpu/u_execute/n45 [1]),
    .i1(\u_cpu/alu_out1 [1]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [6]),
    .o(\u_cpu/u_execute/n46 [1]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux23_b2  (
    .i0(\u_cpu/u_execute/n45 [2]),
    .i1(\u_cpu/alu_out1 [2]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [6]),
    .o(\u_cpu/u_execute/n46 [2]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux23_b3  (
    .i0(\u_cpu/u_execute/n45 [3]),
    .i1(\u_cpu/alu_out1 [3]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [6]),
    .o(\u_cpu/u_execute/n46 [3]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux23_b4  (
    .i0(\u_cpu/u_execute/n45 [4]),
    .i1(\u_cpu/alu_out1 [4]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [6]),
    .o(\u_cpu/u_execute/n46 [4]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux23_b5  (
    .i0(\u_cpu/u_execute/n45 [5]),
    .i1(\u_cpu/alu_out1 [5]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [6]),
    .o(\u_cpu/u_execute/n46 [5]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux23_b6  (
    .i0(\u_cpu/u_execute/n45 [6]),
    .i1(\u_cpu/alu_out1 [6]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [6]),
    .o(\u_cpu/u_execute/n46 [6]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux23_b7  (
    .i0(\u_cpu/u_execute/n45 [7]),
    .i1(\u_cpu/alu_out1 [7]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [6]),
    .o(\u_cpu/u_execute/n46 [7]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux24_b0  (
    .i0(\u_cpu/u_execute/n46 [0]),
    .i1(\u_cpu/alu_out1 [8]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [5]),
    .o(\u_cpu/u_execute/n47 [0]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux24_b1  (
    .i0(\u_cpu/u_execute/n46 [1]),
    .i1(\u_cpu/alu_out1 [9]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [5]),
    .o(\u_cpu/u_execute/n47 [1]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux24_b2  (
    .i0(\u_cpu/u_execute/n46 [2]),
    .i1(\u_cpu/alu_out1 [10]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [5]),
    .o(\u_cpu/u_execute/n47 [2]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux24_b3  (
    .i0(\u_cpu/u_execute/n46 [3]),
    .i1(\u_cpu/alu_out1 [11]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [5]),
    .o(\u_cpu/u_execute/n47 [3]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux24_b4  (
    .i0(\u_cpu/u_execute/n46 [4]),
    .i1(\u_cpu/alu_out1 [12]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [5]),
    .o(\u_cpu/u_execute/n47 [4]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux24_b5  (
    .i0(\u_cpu/u_execute/n46 [5]),
    .i1(\u_cpu/alu_out1 [13]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [5]),
    .o(\u_cpu/u_execute/n47 [5]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux24_b6  (
    .i0(\u_cpu/u_execute/n46 [6]),
    .i1(\u_cpu/alu_out1 [14]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [5]),
    .o(\u_cpu/u_execute/n47 [6]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux24_b7  (
    .i0(\u_cpu/u_execute/n46 [7]),
    .i1(\u_cpu/alu_out1 [15]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [5]),
    .o(\u_cpu/u_execute/n47 [7]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux25_b0  (
    .i0(\u_cpu/u_execute/n47 [0]),
    .i1(\u_cpu/alu_out0 [0]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [4]),
    .o(\u_cpu/u_execute/n48 [0]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux25_b1  (
    .i0(\u_cpu/u_execute/n47 [1]),
    .i1(\u_cpu/alu_out0 [1]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [4]),
    .o(\u_cpu/u_execute/n48 [1]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux25_b2  (
    .i0(\u_cpu/u_execute/n47 [2]),
    .i1(\u_cpu/alu_out0 [2]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [4]),
    .o(\u_cpu/u_execute/n48 [2]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux25_b3  (
    .i0(\u_cpu/u_execute/n47 [3]),
    .i1(\u_cpu/alu_out0 [3]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [4]),
    .o(\u_cpu/u_execute/n48 [3]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux25_b4  (
    .i0(\u_cpu/u_execute/n47 [4]),
    .i1(\u_cpu/alu_out0 [4]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [4]),
    .o(\u_cpu/u_execute/n48 [4]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux25_b5  (
    .i0(\u_cpu/u_execute/n47 [5]),
    .i1(\u_cpu/alu_out0 [5]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [4]),
    .o(\u_cpu/u_execute/n48 [5]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux25_b6  (
    .i0(\u_cpu/u_execute/n47 [6]),
    .i1(\u_cpu/alu_out0 [6]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [4]),
    .o(\u_cpu/u_execute/n48 [6]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux25_b7  (
    .i0(\u_cpu/u_execute/n47 [7]),
    .i1(\u_cpu/alu_out0 [7]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [4]),
    .o(\u_cpu/u_execute/n48 [7]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux26_b0  (
    .i0(\u_cpu/u_execute/n48 [0]),
    .i1(\u_cpu/alu_out0 [8]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [3]),
    .o(\u_cpu/u_execute/n49 [0]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux26_b1  (
    .i0(\u_cpu/u_execute/n48 [1]),
    .i1(1'b0),
    .sel(\u_cpu/u_execute/wt_ram_cmd [3]),
    .o(\u_cpu/u_execute/n49 [1]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux26_b2  (
    .i0(\u_cpu/u_execute/n48 [2]),
    .i1(1'b0),
    .sel(\u_cpu/u_execute/wt_ram_cmd [3]),
    .o(\u_cpu/u_execute/n49 [2]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux26_b3  (
    .i0(\u_cpu/u_execute/n48 [3]),
    .i1(1'b0),
    .sel(\u_cpu/u_execute/wt_ram_cmd [3]),
    .o(\u_cpu/u_execute/n49 [3]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux26_b4  (
    .i0(\u_cpu/u_execute/n48 [4]),
    .i1(1'b0),
    .sel(\u_cpu/u_execute/wt_ram_cmd [3]),
    .o(\u_cpu/u_execute/n49 [4]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux26_b5  (
    .i0(\u_cpu/u_execute/n48 [5]),
    .i1(1'b0),
    .sel(\u_cpu/u_execute/wt_ram_cmd [3]),
    .o(\u_cpu/u_execute/n49 [5]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux26_b6  (
    .i0(\u_cpu/u_execute/n48 [6]),
    .i1(1'b0),
    .sel(\u_cpu/u_execute/wt_ram_cmd [3]),
    .o(\u_cpu/u_execute/n49 [6]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux26_b7  (
    .i0(\u_cpu/u_execute/n48 [7]),
    .i1(1'b0),
    .sel(\u_cpu/u_execute/wt_ram_cmd [3]),
    .o(\u_cpu/u_execute/n49 [7]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux27_b0  (
    .i0(\u_cpu/u_execute/n49 [0]),
    .i1(\u_cpu/u_execute/C [0]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [2]),
    .o(\u_cpu/u_execute/n50 [0]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux27_b1  (
    .i0(\u_cpu/u_execute/n49 [1]),
    .i1(\u_cpu/u_execute/C [1]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [2]),
    .o(\u_cpu/u_execute/n50 [1]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux27_b2  (
    .i0(\u_cpu/u_execute/n49 [2]),
    .i1(\u_cpu/u_execute/C [2]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [2]),
    .o(\u_cpu/u_execute/n50 [2]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux27_b3  (
    .i0(\u_cpu/u_execute/n49 [3]),
    .i1(\u_cpu/u_execute/C [3]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [2]),
    .o(\u_cpu/u_execute/n50 [3]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux27_b4  (
    .i0(\u_cpu/u_execute/n49 [4]),
    .i1(\u_cpu/u_execute/C [4]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [2]),
    .o(\u_cpu/u_execute/n50 [4]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux27_b5  (
    .i0(\u_cpu/u_execute/n49 [5]),
    .i1(\u_cpu/u_execute/C [5]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [2]),
    .o(\u_cpu/u_execute/n50 [5]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux27_b6  (
    .i0(\u_cpu/u_execute/n49 [6]),
    .i1(\u_cpu/u_execute/C [6]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [2]),
    .o(\u_cpu/u_execute/n50 [6]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux27_b7  (
    .i0(\u_cpu/u_execute/n49 [7]),
    .i1(\u_cpu/u_execute/C [7]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [2]),
    .o(\u_cpu/u_execute/n50 [7]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux28_b0  (
    .i0(\u_cpu/u_execute/n50 [0]),
    .i1(\u_cpu/alu_in2 [0]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [1]),
    .o(\u_cpu/u_execute/n51 [0]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux28_b1  (
    .i0(\u_cpu/u_execute/n50 [1]),
    .i1(\u_cpu/alu_in2 [1]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [1]),
    .o(\u_cpu/u_execute/n51 [1]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux28_b2  (
    .i0(\u_cpu/u_execute/n50 [2]),
    .i1(\u_cpu/alu_in2 [2]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [1]),
    .o(\u_cpu/u_execute/n51 [2]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux28_b3  (
    .i0(\u_cpu/u_execute/n50 [3]),
    .i1(\u_cpu/alu_in2 [3]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [1]),
    .o(\u_cpu/u_execute/n51 [3]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux28_b4  (
    .i0(\u_cpu/u_execute/n50 [4]),
    .i1(\u_cpu/alu_in2 [4]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [1]),
    .o(\u_cpu/u_execute/n51 [4]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux28_b5  (
    .i0(\u_cpu/u_execute/n50 [5]),
    .i1(\u_cpu/alu_in2 [5]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [1]),
    .o(\u_cpu/u_execute/n51 [5]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux28_b6  (
    .i0(\u_cpu/u_execute/n50 [6]),
    .i1(\u_cpu/alu_in2 [6]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [1]),
    .o(\u_cpu/u_execute/n51 [6]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux28_b7  (
    .i0(\u_cpu/u_execute/n50 [7]),
    .i1(\u_cpu/alu_in2 [7]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [1]),
    .o(\u_cpu/u_execute/n51 [7]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux29_b0  (
    .i0(\u_cpu/u_execute/n51 [0]),
    .i1(bus_wdata[0]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [0]),
    .o(\u_cpu/u_execute/n52 [0]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux29_b1  (
    .i0(\u_cpu/u_execute/n51 [1]),
    .i1(bus_wdata[1]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [0]),
    .o(\u_cpu/u_execute/n52 [1]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux29_b2  (
    .i0(\u_cpu/u_execute/n51 [2]),
    .i1(bus_wdata[2]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [0]),
    .o(\u_cpu/u_execute/n52 [2]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux29_b3  (
    .i0(\u_cpu/u_execute/n51 [3]),
    .i1(bus_wdata[3]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [0]),
    .o(\u_cpu/u_execute/n52 [3]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux29_b4  (
    .i0(\u_cpu/u_execute/n51 [4]),
    .i1(bus_wdata[4]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [0]),
    .o(\u_cpu/u_execute/n52 [4]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux29_b5  (
    .i0(\u_cpu/u_execute/n51 [5]),
    .i1(bus_wdata[5]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [0]),
    .o(\u_cpu/u_execute/n52 [5]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux29_b6  (
    .i0(\u_cpu/u_execute/n51 [6]),
    .i1(bus_wdata[6]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [0]),
    .o(\u_cpu/u_execute/n52 [6]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux29_b7  (
    .i0(\u_cpu/u_execute/n51 [7]),
    .i1(bus_wdata[7]),
    .sel(\u_cpu/u_execute/wt_ram_cmd [0]),
    .o(\u_cpu/u_execute/n52 [7]));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w1 \u_cpu/u_execute/mux2_b0  (
    .i0(\u_cpu/u_execute/n2 [0]),
    .i1(bus_rdata[0]),
    .sel(\u_cpu/u_execute/bus_to_a_wen ),
    .o(\u_cpu/u_execute/n3 [0]));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w1 \u_cpu/u_execute/mux2_b1  (
    .i0(\u_cpu/u_execute/n2 [1]),
    .i1(bus_rdata[1]),
    .sel(\u_cpu/u_execute/bus_to_a_wen ),
    .o(\u_cpu/u_execute/n3 [1]));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w1 \u_cpu/u_execute/mux2_b2  (
    .i0(\u_cpu/u_execute/n2 [2]),
    .i1(bus_rdata[2]),
    .sel(\u_cpu/u_execute/bus_to_a_wen ),
    .o(\u_cpu/u_execute/n3 [2]));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w1 \u_cpu/u_execute/mux2_b3  (
    .i0(\u_cpu/u_execute/n2 [3]),
    .i1(bus_rdata[3]),
    .sel(\u_cpu/u_execute/bus_to_a_wen ),
    .o(\u_cpu/u_execute/n3 [3]));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w1 \u_cpu/u_execute/mux2_b4  (
    .i0(\u_cpu/u_execute/n2 [4]),
    .i1(bus_rdata[4]),
    .sel(\u_cpu/u_execute/bus_to_a_wen ),
    .o(\u_cpu/u_execute/n3 [4]));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w1 \u_cpu/u_execute/mux2_b5  (
    .i0(\u_cpu/u_execute/n2 [5]),
    .i1(bus_rdata[5]),
    .sel(\u_cpu/u_execute/bus_to_a_wen ),
    .o(\u_cpu/u_execute/n3 [5]));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w1 \u_cpu/u_execute/mux2_b6  (
    .i0(\u_cpu/u_execute/n2 [6]),
    .i1(1'b0),
    .sel(\u_cpu/u_execute/bus_to_a_wen ),
    .o(\u_cpu/u_execute/n3 [6]));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w1 \u_cpu/u_execute/mux2_b7  (
    .i0(\u_cpu/u_execute/n2 [7]),
    .i1(1'b0),
    .sel(\u_cpu/u_execute/bus_to_a_wen ),
    .o(\u_cpu/u_execute/n3 [7]));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w1 \u_cpu/u_execute/mux3_b0  (
    .i0(\u_cpu/u_execute/n3 [0]),
    .i1(\u_cpu/u_execute/rom_data [0]),
    .sel(\u_cpu/u_execute/rom_to_a_wen ),
    .o(\u_cpu/u_execute/n4 [0]));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w1 \u_cpu/u_execute/mux3_b1  (
    .i0(\u_cpu/u_execute/n3 [1]),
    .i1(\u_cpu/u_execute/rom_data [1]),
    .sel(\u_cpu/u_execute/rom_to_a_wen ),
    .o(\u_cpu/u_execute/n4 [1]));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w1 \u_cpu/u_execute/mux3_b2  (
    .i0(\u_cpu/u_execute/n3 [2]),
    .i1(\u_cpu/u_execute/rom_data [2]),
    .sel(\u_cpu/u_execute/rom_to_a_wen ),
    .o(\u_cpu/u_execute/n4 [2]));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w1 \u_cpu/u_execute/mux3_b3  (
    .i0(\u_cpu/u_execute/n3 [3]),
    .i1(\u_cpu/u_execute/rom_data [3]),
    .sel(\u_cpu/u_execute/rom_to_a_wen ),
    .o(\u_cpu/u_execute/n4 [3]));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w1 \u_cpu/u_execute/mux3_b4  (
    .i0(\u_cpu/u_execute/n3 [4]),
    .i1(\u_cpu/u_execute/rom_data [4]),
    .sel(\u_cpu/u_execute/rom_to_a_wen ),
    .o(\u_cpu/u_execute/n4 [4]));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w1 \u_cpu/u_execute/mux3_b5  (
    .i0(\u_cpu/u_execute/n3 [5]),
    .i1(\u_cpu/u_execute/rom_data [5]),
    .sel(\u_cpu/u_execute/rom_to_a_wen ),
    .o(\u_cpu/u_execute/n4 [5]));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w1 \u_cpu/u_execute/mux3_b6  (
    .i0(\u_cpu/u_execute/n3 [6]),
    .i1(\u_cpu/u_execute/rom_data [6]),
    .sel(\u_cpu/u_execute/rom_to_a_wen ),
    .o(\u_cpu/u_execute/n4 [6]));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w1 \u_cpu/u_execute/mux3_b7  (
    .i0(\u_cpu/u_execute/n3 [7]),
    .i1(\u_cpu/u_execute/rom_data [7]),
    .sel(\u_cpu/u_execute/rom_to_a_wen ),
    .o(\u_cpu/u_execute/n4 [7]));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w1 \u_cpu/u_execute/mux4_b0  (
    .i0(\u_cpu/alu_in2 [0]),
    .i1(\u_cpu/u_execute/n1 [0]),
    .sel(\u_cpu/u_execute/ram_to_b_wen ),
    .o(\u_cpu/u_execute/n5 [0]));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w1 \u_cpu/u_execute/mux4_b1  (
    .i0(\u_cpu/alu_in2 [1]),
    .i1(\u_cpu/u_execute/n1 [1]),
    .sel(\u_cpu/u_execute/ram_to_b_wen ),
    .o(\u_cpu/u_execute/n5 [1]));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w1 \u_cpu/u_execute/mux4_b2  (
    .i0(\u_cpu/alu_in2 [2]),
    .i1(\u_cpu/u_execute/n1 [2]),
    .sel(\u_cpu/u_execute/ram_to_b_wen ),
    .o(\u_cpu/u_execute/n5 [2]));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w1 \u_cpu/u_execute/mux4_b3  (
    .i0(\u_cpu/alu_in2 [3]),
    .i1(\u_cpu/u_execute/n1 [3]),
    .sel(\u_cpu/u_execute/ram_to_b_wen ),
    .o(\u_cpu/u_execute/n5 [3]));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w1 \u_cpu/u_execute/mux4_b4  (
    .i0(\u_cpu/alu_in2 [4]),
    .i1(\u_cpu/u_execute/n1 [4]),
    .sel(\u_cpu/u_execute/ram_to_b_wen ),
    .o(\u_cpu/u_execute/n5 [4]));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w1 \u_cpu/u_execute/mux4_b5  (
    .i0(\u_cpu/alu_in2 [5]),
    .i1(\u_cpu/u_execute/n1 [5]),
    .sel(\u_cpu/u_execute/ram_to_b_wen ),
    .o(\u_cpu/u_execute/n5 [5]));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w1 \u_cpu/u_execute/mux4_b6  (
    .i0(\u_cpu/alu_in2 [6]),
    .i1(\u_cpu/u_execute/n1 [6]),
    .sel(\u_cpu/u_execute/ram_to_b_wen ),
    .o(\u_cpu/u_execute/n5 [6]));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w1 \u_cpu/u_execute/mux4_b7  (
    .i0(\u_cpu/alu_in2 [7]),
    .i1(\u_cpu/u_execute/n1 [7]),
    .sel(\u_cpu/u_execute/ram_to_b_wen ),
    .o(\u_cpu/u_execute/n5 [7]));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w1 \u_cpu/u_execute/mux5_b0  (
    .i0(\u_cpu/u_execute/n5 [0]),
    .i1(bus_rdata[0]),
    .sel(\u_cpu/u_execute/bus_to_b_wen ),
    .o(\u_cpu/u_execute/n6 [0]));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w1 \u_cpu/u_execute/mux5_b1  (
    .i0(\u_cpu/u_execute/n5 [1]),
    .i1(bus_rdata[1]),
    .sel(\u_cpu/u_execute/bus_to_b_wen ),
    .o(\u_cpu/u_execute/n6 [1]));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w1 \u_cpu/u_execute/mux5_b2  (
    .i0(\u_cpu/u_execute/n5 [2]),
    .i1(bus_rdata[2]),
    .sel(\u_cpu/u_execute/bus_to_b_wen ),
    .o(\u_cpu/u_execute/n6 [2]));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w1 \u_cpu/u_execute/mux5_b3  (
    .i0(\u_cpu/u_execute/n5 [3]),
    .i1(bus_rdata[3]),
    .sel(\u_cpu/u_execute/bus_to_b_wen ),
    .o(\u_cpu/u_execute/n6 [3]));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w1 \u_cpu/u_execute/mux5_b4  (
    .i0(\u_cpu/u_execute/n5 [4]),
    .i1(bus_rdata[4]),
    .sel(\u_cpu/u_execute/bus_to_b_wen ),
    .o(\u_cpu/u_execute/n6 [4]));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w1 \u_cpu/u_execute/mux5_b5  (
    .i0(\u_cpu/u_execute/n5 [5]),
    .i1(bus_rdata[5]),
    .sel(\u_cpu/u_execute/bus_to_b_wen ),
    .o(\u_cpu/u_execute/n6 [5]));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w1 \u_cpu/u_execute/mux5_b6  (
    .i0(\u_cpu/u_execute/n5 [6]),
    .i1(1'b0),
    .sel(\u_cpu/u_execute/bus_to_b_wen ),
    .o(\u_cpu/u_execute/n6 [6]));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w1 \u_cpu/u_execute/mux5_b7  (
    .i0(\u_cpu/u_execute/n5 [7]),
    .i1(1'b0),
    .sel(\u_cpu/u_execute/bus_to_b_wen ),
    .o(\u_cpu/u_execute/n6 [7]));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w1 \u_cpu/u_execute/mux6_b0  (
    .i0(\u_cpu/u_execute/n6 [0]),
    .i1(\u_cpu/u_execute/rom_data [0]),
    .sel(\u_cpu/u_execute/rom_to_b_wen ),
    .o(\u_cpu/u_execute/n7 [0]));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w1 \u_cpu/u_execute/mux6_b1  (
    .i0(\u_cpu/u_execute/n6 [1]),
    .i1(\u_cpu/u_execute/rom_data [1]),
    .sel(\u_cpu/u_execute/rom_to_b_wen ),
    .o(\u_cpu/u_execute/n7 [1]));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w1 \u_cpu/u_execute/mux6_b2  (
    .i0(\u_cpu/u_execute/n6 [2]),
    .i1(\u_cpu/u_execute/rom_data [2]),
    .sel(\u_cpu/u_execute/rom_to_b_wen ),
    .o(\u_cpu/u_execute/n7 [2]));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w1 \u_cpu/u_execute/mux6_b3  (
    .i0(\u_cpu/u_execute/n6 [3]),
    .i1(\u_cpu/u_execute/rom_data [3]),
    .sel(\u_cpu/u_execute/rom_to_b_wen ),
    .o(\u_cpu/u_execute/n7 [3]));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w1 \u_cpu/u_execute/mux6_b4  (
    .i0(\u_cpu/u_execute/n6 [4]),
    .i1(\u_cpu/u_execute/rom_data [4]),
    .sel(\u_cpu/u_execute/rom_to_b_wen ),
    .o(\u_cpu/u_execute/n7 [4]));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w1 \u_cpu/u_execute/mux6_b5  (
    .i0(\u_cpu/u_execute/n6 [5]),
    .i1(\u_cpu/u_execute/rom_data [5]),
    .sel(\u_cpu/u_execute/rom_to_b_wen ),
    .o(\u_cpu/u_execute/n7 [5]));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w1 \u_cpu/u_execute/mux6_b6  (
    .i0(\u_cpu/u_execute/n6 [6]),
    .i1(\u_cpu/u_execute/rom_data [6]),
    .sel(\u_cpu/u_execute/rom_to_b_wen ),
    .o(\u_cpu/u_execute/n7 [6]));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w1 \u_cpu/u_execute/mux6_b7  (
    .i0(\u_cpu/u_execute/n6 [7]),
    .i1(\u_cpu/u_execute/rom_data [7]),
    .sel(\u_cpu/u_execute/rom_to_b_wen ),
    .o(\u_cpu/u_execute/n7 [7]));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w1 \u_cpu/u_execute/mux7_b0  (
    .i0(\u_cpu/u_execute/C [0]),
    .i1(\u_cpu/u_execute/n1 [0]),
    .sel(\u_cpu/u_execute/ram_to_c_wen ),
    .o(\u_cpu/u_execute/n15 [0]));  // sources/rtl/mcu/execute.v(259)
  binary_mux_s1_w1 \u_cpu/u_execute/mux7_b1  (
    .i0(\u_cpu/u_execute/C [1]),
    .i1(\u_cpu/u_execute/n1 [1]),
    .sel(\u_cpu/u_execute/ram_to_c_wen ),
    .o(\u_cpu/u_execute/n15 [1]));  // sources/rtl/mcu/execute.v(259)
  binary_mux_s1_w1 \u_cpu/u_execute/mux7_b2  (
    .i0(\u_cpu/u_execute/C [2]),
    .i1(\u_cpu/u_execute/n1 [2]),
    .sel(\u_cpu/u_execute/ram_to_c_wen ),
    .o(\u_cpu/u_execute/n15 [2]));  // sources/rtl/mcu/execute.v(259)
  binary_mux_s1_w1 \u_cpu/u_execute/mux7_b3  (
    .i0(\u_cpu/u_execute/C [3]),
    .i1(\u_cpu/u_execute/n1 [3]),
    .sel(\u_cpu/u_execute/ram_to_c_wen ),
    .o(\u_cpu/u_execute/n15 [3]));  // sources/rtl/mcu/execute.v(259)
  binary_mux_s1_w1 \u_cpu/u_execute/mux7_b4  (
    .i0(\u_cpu/u_execute/C [4]),
    .i1(\u_cpu/u_execute/n1 [4]),
    .sel(\u_cpu/u_execute/ram_to_c_wen ),
    .o(\u_cpu/u_execute/n15 [4]));  // sources/rtl/mcu/execute.v(259)
  binary_mux_s1_w1 \u_cpu/u_execute/mux7_b5  (
    .i0(\u_cpu/u_execute/C [5]),
    .i1(\u_cpu/u_execute/n1 [5]),
    .sel(\u_cpu/u_execute/ram_to_c_wen ),
    .o(\u_cpu/u_execute/n15 [5]));  // sources/rtl/mcu/execute.v(259)
  binary_mux_s1_w1 \u_cpu/u_execute/mux7_b6  (
    .i0(\u_cpu/u_execute/C [6]),
    .i1(\u_cpu/u_execute/n1 [6]),
    .sel(\u_cpu/u_execute/ram_to_c_wen ),
    .o(\u_cpu/u_execute/n15 [6]));  // sources/rtl/mcu/execute.v(259)
  binary_mux_s1_w1 \u_cpu/u_execute/mux7_b7  (
    .i0(\u_cpu/u_execute/C [7]),
    .i1(\u_cpu/u_execute/n1 [7]),
    .sel(\u_cpu/u_execute/ram_to_c_wen ),
    .o(\u_cpu/u_execute/n15 [7]));  // sources/rtl/mcu/execute.v(259)
  binary_mux_s1_w1 \u_cpu/u_execute/mux8_b0  (
    .i0(\u_cpu/u_execute/n15 [0]),
    .i1(bus_rdata[0]),
    .sel(\u_cpu/u_execute/bus_to_c_wen ),
    .o(\u_cpu/u_execute/n16 [0]));  // sources/rtl/mcu/execute.v(259)
  binary_mux_s1_w1 \u_cpu/u_execute/mux8_b1  (
    .i0(\u_cpu/u_execute/n15 [1]),
    .i1(bus_rdata[1]),
    .sel(\u_cpu/u_execute/bus_to_c_wen ),
    .o(\u_cpu/u_execute/n16 [1]));  // sources/rtl/mcu/execute.v(259)
  binary_mux_s1_w1 \u_cpu/u_execute/mux8_b2  (
    .i0(\u_cpu/u_execute/n15 [2]),
    .i1(bus_rdata[2]),
    .sel(\u_cpu/u_execute/bus_to_c_wen ),
    .o(\u_cpu/u_execute/n16 [2]));  // sources/rtl/mcu/execute.v(259)
  binary_mux_s1_w1 \u_cpu/u_execute/mux8_b3  (
    .i0(\u_cpu/u_execute/n15 [3]),
    .i1(bus_rdata[3]),
    .sel(\u_cpu/u_execute/bus_to_c_wen ),
    .o(\u_cpu/u_execute/n16 [3]));  // sources/rtl/mcu/execute.v(259)
  binary_mux_s1_w1 \u_cpu/u_execute/mux8_b4  (
    .i0(\u_cpu/u_execute/n15 [4]),
    .i1(bus_rdata[4]),
    .sel(\u_cpu/u_execute/bus_to_c_wen ),
    .o(\u_cpu/u_execute/n16 [4]));  // sources/rtl/mcu/execute.v(259)
  binary_mux_s1_w1 \u_cpu/u_execute/mux8_b5  (
    .i0(\u_cpu/u_execute/n15 [5]),
    .i1(bus_rdata[5]),
    .sel(\u_cpu/u_execute/bus_to_c_wen ),
    .o(\u_cpu/u_execute/n16 [5]));  // sources/rtl/mcu/execute.v(259)
  binary_mux_s1_w1 \u_cpu/u_execute/mux8_b6  (
    .i0(\u_cpu/u_execute/n15 [6]),
    .i1(1'b0),
    .sel(\u_cpu/u_execute/bus_to_c_wen ),
    .o(\u_cpu/u_execute/n16 [6]));  // sources/rtl/mcu/execute.v(259)
  binary_mux_s1_w1 \u_cpu/u_execute/mux8_b7  (
    .i0(\u_cpu/u_execute/n15 [7]),
    .i1(1'b0),
    .sel(\u_cpu/u_execute/bus_to_c_wen ),
    .o(\u_cpu/u_execute/n16 [7]));  // sources/rtl/mcu/execute.v(259)
  binary_mux_s1_w1 \u_cpu/u_execute/mux9_b0  (
    .i0(\u_cpu/u_execute/n16 [0]),
    .i1(\u_cpu/u_execute/rom_data [0]),
    .sel(\u_cpu/u_execute/rom_to_c_wen ),
    .o(\u_cpu/u_execute/n17 [0]));  // sources/rtl/mcu/execute.v(259)
  binary_mux_s1_w1 \u_cpu/u_execute/mux9_b1  (
    .i0(\u_cpu/u_execute/n16 [1]),
    .i1(\u_cpu/u_execute/rom_data [1]),
    .sel(\u_cpu/u_execute/rom_to_c_wen ),
    .o(\u_cpu/u_execute/n17 [1]));  // sources/rtl/mcu/execute.v(259)
  binary_mux_s1_w1 \u_cpu/u_execute/mux9_b2  (
    .i0(\u_cpu/u_execute/n16 [2]),
    .i1(\u_cpu/u_execute/rom_data [2]),
    .sel(\u_cpu/u_execute/rom_to_c_wen ),
    .o(\u_cpu/u_execute/n17 [2]));  // sources/rtl/mcu/execute.v(259)
  binary_mux_s1_w1 \u_cpu/u_execute/mux9_b3  (
    .i0(\u_cpu/u_execute/n16 [3]),
    .i1(\u_cpu/u_execute/rom_data [3]),
    .sel(\u_cpu/u_execute/rom_to_c_wen ),
    .o(\u_cpu/u_execute/n17 [3]));  // sources/rtl/mcu/execute.v(259)
  binary_mux_s1_w1 \u_cpu/u_execute/mux9_b4  (
    .i0(\u_cpu/u_execute/n16 [4]),
    .i1(\u_cpu/u_execute/rom_data [4]),
    .sel(\u_cpu/u_execute/rom_to_c_wen ),
    .o(\u_cpu/u_execute/n17 [4]));  // sources/rtl/mcu/execute.v(259)
  binary_mux_s1_w1 \u_cpu/u_execute/mux9_b5  (
    .i0(\u_cpu/u_execute/n16 [5]),
    .i1(\u_cpu/u_execute/rom_data [5]),
    .sel(\u_cpu/u_execute/rom_to_c_wen ),
    .o(\u_cpu/u_execute/n17 [5]));  // sources/rtl/mcu/execute.v(259)
  binary_mux_s1_w1 \u_cpu/u_execute/mux9_b6  (
    .i0(\u_cpu/u_execute/n16 [6]),
    .i1(\u_cpu/u_execute/rom_data [6]),
    .sel(\u_cpu/u_execute/rom_to_c_wen ),
    .o(\u_cpu/u_execute/n17 [6]));  // sources/rtl/mcu/execute.v(259)
  binary_mux_s1_w1 \u_cpu/u_execute/mux9_b7  (
    .i0(\u_cpu/u_execute/n16 [7]),
    .i1(\u_cpu/u_execute/rom_data [7]),
    .sel(\u_cpu/u_execute/rom_to_c_wen ),
    .o(\u_cpu/u_execute/n17 [7]));  // sources/rtl/mcu/execute.v(259)
  reg_ar_as_w1 \u_cpu/u_execute/pc_wen0_reg  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [13]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/pc_wen0 ));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/pc_wen_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/pc_wen0 ),
    .en(~\u_cpu/u_execute/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/pc_wen ));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/ram_ren_reg  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [28]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_ren));  // sources/rtl/mcu/execute.v(327)
  reg_ar_as_w1 \u_cpu/u_execute/ram_to_a_wen_reg  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/ram_to_a_wen ));  // sources/rtl/mcu/execute.v(203)
  reg_ar_as_w1 \u_cpu/u_execute/ram_to_b_wen_reg  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/ram_to_b_wen ));  // sources/rtl/mcu/execute.v(203)
  reg_ar_as_w1 \u_cpu/u_execute/ram_to_c_wen_reg  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/ram_to_c_wen ));  // sources/rtl/mcu/execute.v(203)
  reg_ar_as_w1 \u_cpu/u_execute/ram_to_d_wen_reg  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/ram_to_d_wen ));  // sources/rtl/mcu/execute.v(203)
  reg_ar_as_w1 \u_cpu/u_execute/ram_wen_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n40 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_wen));  // sources/rtl/mcu/execute.v(359)
  reg_ar_as_w1 \u_cpu/u_execute/reg0_b0  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n4 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_wdata[0]));  // sources/rtl/mcu/execute.v(228)
  reg_ar_as_w1 \u_cpu/u_execute/reg0_b1  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n4 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_wdata[1]));  // sources/rtl/mcu/execute.v(228)
  reg_ar_as_w1 \u_cpu/u_execute/reg0_b2  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n4 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_wdata[2]));  // sources/rtl/mcu/execute.v(228)
  reg_ar_as_w1 \u_cpu/u_execute/reg0_b3  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n4 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_wdata[3]));  // sources/rtl/mcu/execute.v(228)
  reg_ar_as_w1 \u_cpu/u_execute/reg0_b4  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n4 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_wdata[4]));  // sources/rtl/mcu/execute.v(228)
  reg_ar_as_w1 \u_cpu/u_execute/reg0_b5  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n4 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_wdata[5]));  // sources/rtl/mcu/execute.v(228)
  reg_ar_as_w1 \u_cpu/u_execute/reg0_b6  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n4 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_wdata[6]));  // sources/rtl/mcu/execute.v(228)
  reg_ar_as_w1 \u_cpu/u_execute/reg0_b7  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n4 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_wdata[7]));  // sources/rtl/mcu/execute.v(228)
  reg_ar_as_w1 \u_cpu/u_execute/reg10_b0  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n52 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_wdata[0]));  // sources/rtl/mcu/execute.v(391)
  reg_ar_as_w1 \u_cpu/u_execute/reg10_b1  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n52 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_wdata[1]));  // sources/rtl/mcu/execute.v(391)
  reg_ar_as_w1 \u_cpu/u_execute/reg10_b2  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n52 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_wdata[2]));  // sources/rtl/mcu/execute.v(391)
  reg_ar_as_w1 \u_cpu/u_execute/reg10_b3  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n52 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_wdata[3]));  // sources/rtl/mcu/execute.v(391)
  reg_ar_as_w1 \u_cpu/u_execute/reg10_b4  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n52 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_wdata[4]));  // sources/rtl/mcu/execute.v(391)
  reg_ar_as_w1 \u_cpu/u_execute/reg10_b5  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n52 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_wdata[5]));  // sources/rtl/mcu/execute.v(391)
  reg_ar_as_w1 \u_cpu/u_execute/reg10_b6  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n52 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_wdata[6]));  // sources/rtl/mcu/execute.v(391)
  reg_ar_as_w1 \u_cpu/u_execute/reg10_b7  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n52 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_wdata[7]));  // sources/rtl/mcu/execute.v(391)
  reg_ar_as_w1 \u_cpu/u_execute/reg11_b0  (
    .clk(vga_clk),
    .d(\u_cpu/decode_data [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/rom_data [0]));  // sources/rtl/mcu/execute.v(185)
  reg_ar_as_w1 \u_cpu/u_execute/reg11_b1  (
    .clk(vga_clk),
    .d(\u_cpu/decode_data [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/rom_data [1]));  // sources/rtl/mcu/execute.v(185)
  reg_ar_as_w1 \u_cpu/u_execute/reg11_b2  (
    .clk(vga_clk),
    .d(\u_cpu/decode_data [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/rom_data [2]));  // sources/rtl/mcu/execute.v(185)
  reg_ar_as_w1 \u_cpu/u_execute/reg11_b3  (
    .clk(vga_clk),
    .d(\u_cpu/decode_data [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/rom_data [3]));  // sources/rtl/mcu/execute.v(185)
  reg_ar_as_w1 \u_cpu/u_execute/reg11_b4  (
    .clk(vga_clk),
    .d(\u_cpu/decode_data [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/rom_data [4]));  // sources/rtl/mcu/execute.v(185)
  reg_ar_as_w1 \u_cpu/u_execute/reg11_b5  (
    .clk(vga_clk),
    .d(\u_cpu/decode_data [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/rom_data [5]));  // sources/rtl/mcu/execute.v(185)
  reg_ar_as_w1 \u_cpu/u_execute/reg11_b6  (
    .clk(vga_clk),
    .d(\u_cpu/decode_data [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/rom_data [6]));  // sources/rtl/mcu/execute.v(185)
  reg_ar_as_w1 \u_cpu/u_execute/reg11_b7  (
    .clk(vga_clk),
    .d(\u_cpu/decode_data [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/rom_data [7]));  // sources/rtl/mcu/execute.v(185)
  reg_ar_as_w1 \u_cpu/u_execute/reg1_b0  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n7 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_in2 [0]));  // sources/rtl/mcu/execute.v(244)
  reg_ar_as_w1 \u_cpu/u_execute/reg1_b1  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n7 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_in2 [1]));  // sources/rtl/mcu/execute.v(244)
  reg_ar_as_w1 \u_cpu/u_execute/reg1_b2  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n7 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_in2 [2]));  // sources/rtl/mcu/execute.v(244)
  reg_ar_as_w1 \u_cpu/u_execute/reg1_b3  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n7 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_in2 [3]));  // sources/rtl/mcu/execute.v(244)
  reg_ar_as_w1 \u_cpu/u_execute/reg1_b4  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n7 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_in2 [4]));  // sources/rtl/mcu/execute.v(244)
  reg_ar_as_w1 \u_cpu/u_execute/reg1_b5  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n7 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_in2 [5]));  // sources/rtl/mcu/execute.v(244)
  reg_ar_as_w1 \u_cpu/u_execute/reg1_b6  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n7 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_in2 [6]));  // sources/rtl/mcu/execute.v(244)
  reg_ar_as_w1 \u_cpu/u_execute/reg1_b7  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n7 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_in2 [7]));  // sources/rtl/mcu/execute.v(244)
  reg_ar_as_w1 \u_cpu/u_execute/reg2_b0  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n17 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/C [0]));  // sources/rtl/mcu/execute.v(260)
  reg_ar_as_w1 \u_cpu/u_execute/reg2_b1  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n17 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/C [1]));  // sources/rtl/mcu/execute.v(260)
  reg_ar_as_w1 \u_cpu/u_execute/reg2_b2  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n17 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/C [2]));  // sources/rtl/mcu/execute.v(260)
  reg_ar_as_w1 \u_cpu/u_execute/reg2_b3  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n17 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/C [3]));  // sources/rtl/mcu/execute.v(260)
  reg_ar_as_w1 \u_cpu/u_execute/reg2_b4  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n17 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/C [4]));  // sources/rtl/mcu/execute.v(260)
  reg_ar_as_w1 \u_cpu/u_execute/reg2_b5  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n17 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/C [5]));  // sources/rtl/mcu/execute.v(260)
  reg_ar_as_w1 \u_cpu/u_execute/reg2_b6  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n17 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/C [6]));  // sources/rtl/mcu/execute.v(260)
  reg_ar_as_w1 \u_cpu/u_execute/reg2_b7  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n17 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/C [7]));  // sources/rtl/mcu/execute.v(260)
  reg_ar_as_w1 \u_cpu/u_execute/reg3_b0  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n29 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_raddr[0]));  // sources/rtl/mcu/execute.v(276)
  reg_ar_as_w1 \u_cpu/u_execute/reg3_b1  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n29 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_raddr[1]));  // sources/rtl/mcu/execute.v(276)
  reg_ar_as_w1 \u_cpu/u_execute/reg3_b2  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n29 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_raddr[2]));  // sources/rtl/mcu/execute.v(276)
  reg_ar_as_w1 \u_cpu/u_execute/reg3_b3  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n29 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_raddr[3]));  // sources/rtl/mcu/execute.v(276)
  reg_ar_as_w1 \u_cpu/u_execute/reg3_b4  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n29 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_raddr[4]));  // sources/rtl/mcu/execute.v(276)
  reg_ar_as_w1 \u_cpu/u_execute/reg3_b5  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n29 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_raddr[5]));  // sources/rtl/mcu/execute.v(276)
  reg_ar_as_w1 \u_cpu/u_execute/reg3_b6  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n29 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_raddr[6]));  // sources/rtl/mcu/execute.v(276)
  reg_ar_as_w1 \u_cpu/u_execute/reg3_b7  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n29 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_raddr[7]));  // sources/rtl/mcu/execute.v(276)
  reg_ar_as_w1 \u_cpu/u_execute/reg4_b0  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/C [0]),
    .en(~\u_cpu/u_execute/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/pc_wdata [0]));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/reg4_b1  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/C [1]),
    .en(~\u_cpu/u_execute/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/pc_wdata [1]));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/reg4_b10  (
    .clk(vga_clk),
    .d(\u_cpu/alu_in2 [2]),
    .en(~\u_cpu/u_execute/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/pc_wdata [10]));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/reg4_b11  (
    .clk(vga_clk),
    .d(\u_cpu/alu_in2 [3]),
    .en(~\u_cpu/u_execute/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/pc_wdata [11]));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/reg4_b2  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/C [2]),
    .en(~\u_cpu/u_execute/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/pc_wdata [2]));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/reg4_b3  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/C [3]),
    .en(~\u_cpu/u_execute/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/pc_wdata [3]));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/reg4_b4  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/C [4]),
    .en(~\u_cpu/u_execute/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/pc_wdata [4]));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/reg4_b5  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/C [5]),
    .en(~\u_cpu/u_execute/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/pc_wdata [5]));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/reg4_b6  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/C [6]),
    .en(~\u_cpu/u_execute/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/pc_wdata [6]));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/reg4_b7  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/C [7]),
    .en(~\u_cpu/u_execute/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/pc_wdata [7]));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/reg4_b8  (
    .clk(vga_clk),
    .d(\u_cpu/alu_in2 [0]),
    .en(~\u_cpu/u_execute/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/pc_wdata [8]));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/reg4_b9  (
    .clk(vga_clk),
    .d(\u_cpu/alu_in2 [1]),
    .en(~\u_cpu/u_execute/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/pc_wdata [9]));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b0  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/C [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [0]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b1  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/C [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [1]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b10  (
    .clk(vga_clk),
    .d(\u_cpu/alu_in2 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [10]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b11  (
    .clk(vga_clk),
    .d(\u_cpu/alu_in2 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [11]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b12  (
    .clk(vga_clk),
    .d(\u_cpu/alu_in2 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [12]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b13  (
    .clk(vga_clk),
    .d(\u_cpu/alu_in2 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [13]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b14  (
    .clk(vga_clk),
    .d(\u_cpu/alu_in2 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [14]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b15  (
    .clk(vga_clk),
    .d(\u_cpu/alu_in2 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [15]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b16  (
    .clk(vga_clk),
    .d(bus_wdata[0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [16]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b17  (
    .clk(vga_clk),
    .d(bus_wdata[1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [17]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b18  (
    .clk(vga_clk),
    .d(bus_wdata[2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [18]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b19  (
    .clk(vga_clk),
    .d(bus_wdata[3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [19]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b2  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/C [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [2]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b20  (
    .clk(vga_clk),
    .d(bus_wdata[4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [20]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b21  (
    .clk(vga_clk),
    .d(bus_wdata[5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [21]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b22  (
    .clk(vga_clk),
    .d(bus_wdata[6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [22]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b23  (
    .clk(vga_clk),
    .d(bus_wdata[7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [23]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b3  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/C [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [3]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b4  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/C [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [4]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b5  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/C [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [5]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b6  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/C [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [6]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b7  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/C [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [7]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b8  (
    .clk(vga_clk),
    .d(\u_cpu/alu_in2 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [8]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b9  (
    .clk(vga_clk),
    .d(\u_cpu/alu_in2 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [9]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg6_b0  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [15]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_cmd [0]));  // sources/rtl/mcu/execute.v(301)
  reg_ar_as_w1 \u_cpu/u_execute/reg6_b1  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [16]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_cmd [1]));  // sources/rtl/mcu/execute.v(301)
  reg_ar_as_w1 \u_cpu/u_execute/reg6_b10  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [25]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_cmd [10]));  // sources/rtl/mcu/execute.v(301)
  reg_ar_as_w1 \u_cpu/u_execute/reg6_b2  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [17]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_cmd [2]));  // sources/rtl/mcu/execute.v(301)
  reg_ar_as_w1 \u_cpu/u_execute/reg6_b3  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [18]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_cmd [3]));  // sources/rtl/mcu/execute.v(301)
  reg_ar_as_w1 \u_cpu/u_execute/reg6_b4  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [19]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_cmd [4]));  // sources/rtl/mcu/execute.v(301)
  reg_ar_as_w1 \u_cpu/u_execute/reg6_b5  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [20]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_cmd [5]));  // sources/rtl/mcu/execute.v(301)
  reg_ar_as_w1 \u_cpu/u_execute/reg6_b6  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [21]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_cmd [6]));  // sources/rtl/mcu/execute.v(301)
  reg_ar_as_w1 \u_cpu/u_execute/reg6_b7  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [22]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_cmd [7]));  // sources/rtl/mcu/execute.v(301)
  reg_ar_as_w1 \u_cpu/u_execute/reg6_b8  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [23]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_cmd [8]));  // sources/rtl/mcu/execute.v(301)
  reg_ar_as_w1 \u_cpu/u_execute/reg6_b9  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [24]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_cmd [9]));  // sources/rtl/mcu/execute.v(301)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b0  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n39 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [0]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b1  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n39 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [1]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b10  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n39 [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [10]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b11  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n39 [11]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [11]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b12  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n39 [12]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [12]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b13  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n39 [13]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [13]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b14  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n39 [14]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [14]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b15  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n39 [15]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [15]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b2  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n39 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [2]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b3  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n39 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [3]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b4  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n39 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [4]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b5  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n39 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [5]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b6  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n39 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [6]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b7  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n39 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [7]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b8  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n39 [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [8]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b9  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/n39 [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [9]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg8_b0  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [29]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/wt_ram_cmd [0]));  // sources/rtl/mcu/execute.v(359)
  reg_ar_as_w1 \u_cpu/u_execute/reg8_b1  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [30]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/wt_ram_cmd [1]));  // sources/rtl/mcu/execute.v(359)
  reg_ar_as_w1 \u_cpu/u_execute/reg8_b2  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [31]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/wt_ram_cmd [2]));  // sources/rtl/mcu/execute.v(359)
  reg_ar_as_w1 \u_cpu/u_execute/reg8_b3  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [32]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/wt_ram_cmd [3]));  // sources/rtl/mcu/execute.v(359)
  reg_ar_as_w1 \u_cpu/u_execute/reg8_b4  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [33]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/wt_ram_cmd [4]));  // sources/rtl/mcu/execute.v(359)
  reg_ar_as_w1 \u_cpu/u_execute/reg8_b5  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [34]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/wt_ram_cmd [5]));  // sources/rtl/mcu/execute.v(359)
  reg_ar_as_w1 \u_cpu/u_execute/reg8_b6  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [35]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/wt_ram_cmd [6]));  // sources/rtl/mcu/execute.v(359)
  reg_ar_as_w1 \u_cpu/u_execute/reg8_b7  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [36]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/wt_ram_cmd [7]));  // sources/rtl/mcu/execute.v(359)
  reg_ar_as_w1 \u_cpu/u_execute/reg8_b8  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [37]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/wt_ram_cmd [8]));  // sources/rtl/mcu/execute.v(359)
  reg_ar_as_w1 \u_cpu/u_execute/reg8_b9  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [38]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/wt_ram_cmd [9]));  // sources/rtl/mcu/execute.v(359)
  reg_ar_as_w1 \u_cpu/u_execute/reg9_b0  (
    .clk(vga_clk),
    .d(bus_raddr[0]),
    .en(\u_cpu/u_execute/n40 ),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_waddr[0]));  // sources/rtl/mcu/execute.v(366)
  reg_ar_as_w1 \u_cpu/u_execute/reg9_b1  (
    .clk(vga_clk),
    .d(bus_raddr[1]),
    .en(\u_cpu/u_execute/n40 ),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_waddr[1]));  // sources/rtl/mcu/execute.v(366)
  reg_ar_as_w1 \u_cpu/u_execute/reg9_b2  (
    .clk(vga_clk),
    .d(bus_raddr[2]),
    .en(\u_cpu/u_execute/n40 ),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_waddr[2]));  // sources/rtl/mcu/execute.v(366)
  reg_ar_as_w1 \u_cpu/u_execute/reg9_b3  (
    .clk(vga_clk),
    .d(bus_raddr[3]),
    .en(\u_cpu/u_execute/n40 ),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_waddr[3]));  // sources/rtl/mcu/execute.v(366)
  reg_ar_as_w1 \u_cpu/u_execute/reg9_b4  (
    .clk(vga_clk),
    .d(bus_raddr[4]),
    .en(\u_cpu/u_execute/n40 ),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_waddr[4]));  // sources/rtl/mcu/execute.v(366)
  reg_ar_as_w1 \u_cpu/u_execute/reg9_b5  (
    .clk(vga_clk),
    .d(bus_raddr[5]),
    .en(\u_cpu/u_execute/n40 ),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_waddr[5]));  // sources/rtl/mcu/execute.v(366)
  reg_ar_as_w1 \u_cpu/u_execute/reg9_b6  (
    .clk(vga_clk),
    .d(bus_raddr[6]),
    .en(\u_cpu/u_execute/n40 ),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_waddr[6]));  // sources/rtl/mcu/execute.v(366)
  reg_ar_as_w1 \u_cpu/u_execute/reg9_b7  (
    .clk(vga_clk),
    .d(bus_raddr[7]),
    .en(\u_cpu/u_execute/n40 ),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_waddr[7]));  // sources/rtl/mcu/execute.v(366)
  reg_ar_as_w1 \u_cpu/u_execute/rom_to_a_wen_reg  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/rom_to_a_wen ));  // sources/rtl/mcu/execute.v(194)
  reg_ar_as_w1 \u_cpu/u_execute/rom_to_b_wen_reg  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/rom_to_b_wen ));  // sources/rtl/mcu/execute.v(194)
  reg_ar_as_w1 \u_cpu/u_execute/rom_to_c_wen_reg  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/rom_to_c_wen ));  // sources/rtl/mcu/execute.v(194)
  reg_ar_as_w1 \u_cpu/u_execute/rom_to_d_wen_reg  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/rom_to_d_wen ));  // sources/rtl/mcu/execute.v(194)
  reg_ar_as_w1 \u_cpu/u_execute/timer_wen0_reg  (
    .clk(vga_clk),
    .d(\u_cpu/decode_cmd [14]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/timer_wen0 ));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/timer_wen_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_execute/timer_wen0 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wen ));  // sources/rtl/mcu/execute.v(295)
  or \u_cpu/u_execute/u39  (\u_cpu/u_execute/n33 , \u_cpu/u_execute/n19 , \u_cpu/u_execute/n18 );  // sources/rtl/mcu/execute.v(335)
  or \u_cpu/u_execute/u40  (\u_cpu/u_execute/n18 , \u_cpu/read_abcd [2], \u_cpu/read_abcd [3]);  // sources/rtl/mcu/execute.v(335)
  or \u_cpu/u_execute/u41  (\u_cpu/u_execute/n40 , \u_cpu/u_execute/n24 , \u_cpu/u_execute/n20 );  // sources/rtl/mcu/execute.v(358)
  or \u_cpu/u_execute/u42  (\u_cpu/u_execute/n20 , \u_cpu/u_execute/n23 , \u_cpu/u_execute/n21 );  // sources/rtl/mcu/execute.v(358)
  or \u_cpu/u_execute/u44  (\u_cpu/u_execute/n21 , \u_cpu/u_execute/wt_ram_cmd [7], \u_cpu/u_execute/n22 );  // sources/rtl/mcu/execute.v(358)
  or \u_cpu/u_execute/u45  (\u_cpu/u_execute/n22 , \u_cpu/u_execute/wt_ram_cmd [8], \u_cpu/u_execute/wt_ram_cmd [9]);  // sources/rtl/mcu/execute.v(358)
  or \u_cpu/u_execute/u46  (\u_cpu/u_execute/n23 , \u_cpu/u_execute/wt_ram_cmd [5], \u_cpu/u_execute/wt_ram_cmd [6]);  // sources/rtl/mcu/execute.v(358)
  or \u_cpu/u_execute/u47  (\u_cpu/u_execute/n24 , \u_cpu/u_execute/n41 , \u_cpu/u_execute/n25 );  // sources/rtl/mcu/execute.v(358)
  or \u_cpu/u_execute/u48  (\u_cpu/u_execute/n25 , \u_cpu/u_execute/wt_ram_cmd [2], \u_cpu/u_execute/n26 );  // sources/rtl/mcu/execute.v(358)
  or \u_cpu/u_execute/u49  (\u_cpu/u_execute/n26 , \u_cpu/u_execute/wt_ram_cmd [3], \u_cpu/u_execute/wt_ram_cmd [4]);  // sources/rtl/mcu/execute.v(358)
  or \u_cpu/u_execute/u51  (\u_cpu/u_execute/n14 , bus_raddr[0], bus_raddr[1]);  // sources/rtl/mcu/execute.v(282)
  or \u_cpu/u_execute/u58  (\u_cpu/u_execute/n34 , \u_cpu/u_execute/dbg_info_en0 , \u_cpu/u_execute/n33 );  // sources/rtl/mcu/execute.v(335)
  or \u_cpu/u_execute/u59  (\u_cpu/u_execute/n19 , \u_cpu/read_abcd [0], \u_cpu/read_abcd [1]);  // sources/rtl/mcu/execute.v(335)
  or \u_cpu/u_execute/u60  (\u_cpu/u_execute/n41 , \u_cpu/u_execute/wt_ram_cmd [0], \u_cpu/u_execute/wt_ram_cmd [1]);  // sources/rtl/mcu/execute.v(358)
  or \u_cpu/u_execute/u83  (\u_cpu/u_execute/n13 , bus_raddr[2], bus_raddr[3]);  // sources/rtl/mcu/execute.v(282)
  or \u_cpu/u_execute/u84  (\u_cpu/u_execute/n12 , \u_cpu/u_execute/n14 , \u_cpu/u_execute/n13 );  // sources/rtl/mcu/execute.v(282)
  or \u_cpu/u_execute/u85  (\u_cpu/u_execute/n11 , bus_raddr[4], bus_raddr[5]);  // sources/rtl/mcu/execute.v(282)
  or \u_cpu/u_execute/u86  (\u_cpu/u_execute/n10 , bus_raddr[6], bus_raddr[7]);  // sources/rtl/mcu/execute.v(282)
  or \u_cpu/u_execute/u87  (\u_cpu/u_execute/n9 , \u_cpu/u_execute/n11 , \u_cpu/u_execute/n10 );  // sources/rtl/mcu/execute.v(282)
  or \u_cpu/u_execute/u88  (\u_cpu/u_execute/n8 , \u_cpu/u_execute/n12 , \u_cpu/u_execute/n9 );  // sources/rtl/mcu/execute.v(282)
  add_pu12_pu12_o12 \u_cpu/u_fetch/add0  (
    .i0(\u_cpu/u_fetch/pc [11:0]),
    .i1(12'b000000000001),
    .o(\u_cpu/u_fetch/n1 [11:0]));  // sources/rtl/mcu/fetch.v(74)
  reg_sr_as_w1 \u_cpu/u_fetch/fetch_en_reg  (
    .clk(vga_clk),
    .d(\u_cpu/timer_state ),
    .en(1'b1),
    .reset(\u_cpu/dbg_en ),
    .set(1'b0),
    .q(\u_cpu/u_fetch/fetch_en ));  // sources/rtl/mcu/fetch.v(64)
  reg_ar_as_w1 \u_cpu/u_fetch/inst_en_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n8 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/inst_en ));  // sources/rtl/mcu/fetch.v(97)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux0_b0  (
    .i0(\u_cpu/u_fetch/pc [0]),
    .i1(\u_cpu/u_fetch/n1 [0]),
    .sel(\u_cpu/u_fetch/fetch_en ),
    .o(\u_cpu/u_fetch/n2 [0]));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux0_b1  (
    .i0(\u_cpu/u_fetch/pc [1]),
    .i1(\u_cpu/u_fetch/n1 [1]),
    .sel(\u_cpu/u_fetch/fetch_en ),
    .o(\u_cpu/u_fetch/n2 [1]));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux0_b10  (
    .i0(\u_cpu/u_fetch/pc [10]),
    .i1(\u_cpu/u_fetch/n1 [10]),
    .sel(\u_cpu/u_fetch/fetch_en ),
    .o(\u_cpu/u_fetch/n2 [10]));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux0_b11  (
    .i0(\u_cpu/u_fetch/pc [11]),
    .i1(\u_cpu/u_fetch/n1 [11]),
    .sel(\u_cpu/u_fetch/fetch_en ),
    .o(\u_cpu/u_fetch/n2 [11]));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux0_b2  (
    .i0(\u_cpu/u_fetch/pc [2]),
    .i1(\u_cpu/u_fetch/n1 [2]),
    .sel(\u_cpu/u_fetch/fetch_en ),
    .o(\u_cpu/u_fetch/n2 [2]));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux0_b3  (
    .i0(\u_cpu/u_fetch/pc [3]),
    .i1(\u_cpu/u_fetch/n1 [3]),
    .sel(\u_cpu/u_fetch/fetch_en ),
    .o(\u_cpu/u_fetch/n2 [3]));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux0_b4  (
    .i0(\u_cpu/u_fetch/pc [4]),
    .i1(\u_cpu/u_fetch/n1 [4]),
    .sel(\u_cpu/u_fetch/fetch_en ),
    .o(\u_cpu/u_fetch/n2 [4]));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux0_b5  (
    .i0(\u_cpu/u_fetch/pc [5]),
    .i1(\u_cpu/u_fetch/n1 [5]),
    .sel(\u_cpu/u_fetch/fetch_en ),
    .o(\u_cpu/u_fetch/n2 [5]));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux0_b6  (
    .i0(\u_cpu/u_fetch/pc [6]),
    .i1(\u_cpu/u_fetch/n1 [6]),
    .sel(\u_cpu/u_fetch/fetch_en ),
    .o(\u_cpu/u_fetch/n2 [6]));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux0_b7  (
    .i0(\u_cpu/u_fetch/pc [7]),
    .i1(\u_cpu/u_fetch/n1 [7]),
    .sel(\u_cpu/u_fetch/fetch_en ),
    .o(\u_cpu/u_fetch/n2 [7]));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux0_b8  (
    .i0(\u_cpu/u_fetch/pc [8]),
    .i1(\u_cpu/u_fetch/n1 [8]),
    .sel(\u_cpu/u_fetch/fetch_en ),
    .o(\u_cpu/u_fetch/n2 [8]));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux0_b9  (
    .i0(\u_cpu/u_fetch/pc [9]),
    .i1(\u_cpu/u_fetch/n1 [9]),
    .sel(\u_cpu/u_fetch/fetch_en ),
    .o(\u_cpu/u_fetch/n2 [9]));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux1_b0  (
    .i0(\u_cpu/u_fetch/n2 [0]),
    .i1(\u_cpu/pc_wdata [0]),
    .sel(\u_cpu/pc_wen ),
    .o(\u_cpu/u_fetch/n3 [0]));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux1_b1  (
    .i0(\u_cpu/u_fetch/n2 [1]),
    .i1(\u_cpu/pc_wdata [1]),
    .sel(\u_cpu/pc_wen ),
    .o(\u_cpu/u_fetch/n3 [1]));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux1_b10  (
    .i0(\u_cpu/u_fetch/n2 [10]),
    .i1(\u_cpu/pc_wdata [10]),
    .sel(\u_cpu/pc_wen ),
    .o(\u_cpu/u_fetch/n3 [10]));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux1_b11  (
    .i0(\u_cpu/u_fetch/n2 [11]),
    .i1(\u_cpu/pc_wdata [11]),
    .sel(\u_cpu/pc_wen ),
    .o(\u_cpu/u_fetch/n3 [11]));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux1_b2  (
    .i0(\u_cpu/u_fetch/n2 [2]),
    .i1(\u_cpu/pc_wdata [2]),
    .sel(\u_cpu/pc_wen ),
    .o(\u_cpu/u_fetch/n3 [2]));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux1_b3  (
    .i0(\u_cpu/u_fetch/n2 [3]),
    .i1(\u_cpu/pc_wdata [3]),
    .sel(\u_cpu/pc_wen ),
    .o(\u_cpu/u_fetch/n3 [3]));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux1_b4  (
    .i0(\u_cpu/u_fetch/n2 [4]),
    .i1(\u_cpu/pc_wdata [4]),
    .sel(\u_cpu/pc_wen ),
    .o(\u_cpu/u_fetch/n3 [4]));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux1_b5  (
    .i0(\u_cpu/u_fetch/n2 [5]),
    .i1(\u_cpu/pc_wdata [5]),
    .sel(\u_cpu/pc_wen ),
    .o(\u_cpu/u_fetch/n3 [5]));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux1_b6  (
    .i0(\u_cpu/u_fetch/n2 [6]),
    .i1(\u_cpu/pc_wdata [6]),
    .sel(\u_cpu/pc_wen ),
    .o(\u_cpu/u_fetch/n3 [6]));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux1_b7  (
    .i0(\u_cpu/u_fetch/n2 [7]),
    .i1(\u_cpu/pc_wdata [7]),
    .sel(\u_cpu/pc_wen ),
    .o(\u_cpu/u_fetch/n3 [7]));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux1_b8  (
    .i0(\u_cpu/u_fetch/n2 [8]),
    .i1(\u_cpu/pc_wdata [8]),
    .sel(\u_cpu/pc_wen ),
    .o(\u_cpu/u_fetch/n3 [8]));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux1_b9  (
    .i0(\u_cpu/u_fetch/n2 [9]),
    .i1(\u_cpu/pc_wdata [9]),
    .sel(\u_cpu/pc_wen ),
    .o(\u_cpu/u_fetch/n3 [9]));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux3_b0  (
    .i0(rom_raddr[0]),
    .i1(\u_cpu/u_fetch/pc [0]),
    .sel(\u_cpu/u_fetch/fetch_en ),
    .o(\u_cpu/u_fetch/n6 [0]));  // sources/rtl/mcu/fetch.v(89)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux3_b1  (
    .i0(rom_raddr[1]),
    .i1(\u_cpu/u_fetch/pc [1]),
    .sel(\u_cpu/u_fetch/fetch_en ),
    .o(\u_cpu/u_fetch/n6 [1]));  // sources/rtl/mcu/fetch.v(89)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux3_b10  (
    .i0(rom_raddr[10]),
    .i1(\u_cpu/u_fetch/pc [10]),
    .sel(\u_cpu/u_fetch/fetch_en ),
    .o(\u_cpu/u_fetch/n6 [10]));  // sources/rtl/mcu/fetch.v(89)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux3_b11  (
    .i0(rom_raddr[11]),
    .i1(\u_cpu/u_fetch/pc [11]),
    .sel(\u_cpu/u_fetch/fetch_en ),
    .o(\u_cpu/u_fetch/n6 [11]));  // sources/rtl/mcu/fetch.v(89)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux3_b2  (
    .i0(rom_raddr[2]),
    .i1(\u_cpu/u_fetch/pc [2]),
    .sel(\u_cpu/u_fetch/fetch_en ),
    .o(\u_cpu/u_fetch/n6 [2]));  // sources/rtl/mcu/fetch.v(89)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux3_b3  (
    .i0(rom_raddr[3]),
    .i1(\u_cpu/u_fetch/pc [3]),
    .sel(\u_cpu/u_fetch/fetch_en ),
    .o(\u_cpu/u_fetch/n6 [3]));  // sources/rtl/mcu/fetch.v(89)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux3_b4  (
    .i0(rom_raddr[4]),
    .i1(\u_cpu/u_fetch/pc [4]),
    .sel(\u_cpu/u_fetch/fetch_en ),
    .o(\u_cpu/u_fetch/n6 [4]));  // sources/rtl/mcu/fetch.v(89)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux3_b5  (
    .i0(rom_raddr[5]),
    .i1(\u_cpu/u_fetch/pc [5]),
    .sel(\u_cpu/u_fetch/fetch_en ),
    .o(\u_cpu/u_fetch/n6 [5]));  // sources/rtl/mcu/fetch.v(89)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux3_b6  (
    .i0(rom_raddr[6]),
    .i1(\u_cpu/u_fetch/pc [6]),
    .sel(\u_cpu/u_fetch/fetch_en ),
    .o(\u_cpu/u_fetch/n6 [6]));  // sources/rtl/mcu/fetch.v(89)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux3_b7  (
    .i0(rom_raddr[7]),
    .i1(\u_cpu/u_fetch/pc [7]),
    .sel(\u_cpu/u_fetch/fetch_en ),
    .o(\u_cpu/u_fetch/n6 [7]));  // sources/rtl/mcu/fetch.v(89)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux3_b8  (
    .i0(rom_raddr[8]),
    .i1(\u_cpu/u_fetch/pc [8]),
    .sel(\u_cpu/u_fetch/fetch_en ),
    .o(\u_cpu/u_fetch/n6 [8]));  // sources/rtl/mcu/fetch.v(89)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux3_b9  (
    .i0(rom_raddr[9]),
    .i1(\u_cpu/u_fetch/pc [9]),
    .sel(\u_cpu/u_fetch/fetch_en ),
    .o(\u_cpu/u_fetch/n6 [9]));  // sources/rtl/mcu/fetch.v(89)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux4_b0  (
    .i0(\u_cpu/u_fetch/n6 [0]),
    .i1(\u_cpu/dbg_rom_raddr [0]),
    .sel(\u_cpu/dbg_rom_ren ),
    .o(\u_cpu/u_fetch/n7 [0]));  // sources/rtl/mcu/fetch.v(89)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux4_b1  (
    .i0(\u_cpu/u_fetch/n6 [1]),
    .i1(\u_cpu/dbg_rom_raddr [1]),
    .sel(\u_cpu/dbg_rom_ren ),
    .o(\u_cpu/u_fetch/n7 [1]));  // sources/rtl/mcu/fetch.v(89)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux4_b10  (
    .i0(\u_cpu/u_fetch/n6 [10]),
    .i1(\u_cpu/dbg_rom_raddr [10]),
    .sel(\u_cpu/dbg_rom_ren ),
    .o(\u_cpu/u_fetch/n7 [10]));  // sources/rtl/mcu/fetch.v(89)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux4_b11  (
    .i0(\u_cpu/u_fetch/n6 [11]),
    .i1(\u_cpu/dbg_rom_raddr [11]),
    .sel(\u_cpu/dbg_rom_ren ),
    .o(\u_cpu/u_fetch/n7 [11]));  // sources/rtl/mcu/fetch.v(89)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux4_b2  (
    .i0(\u_cpu/u_fetch/n6 [2]),
    .i1(\u_cpu/dbg_rom_raddr [2]),
    .sel(\u_cpu/dbg_rom_ren ),
    .o(\u_cpu/u_fetch/n7 [2]));  // sources/rtl/mcu/fetch.v(89)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux4_b3  (
    .i0(\u_cpu/u_fetch/n6 [3]),
    .i1(\u_cpu/dbg_rom_raddr [3]),
    .sel(\u_cpu/dbg_rom_ren ),
    .o(\u_cpu/u_fetch/n7 [3]));  // sources/rtl/mcu/fetch.v(89)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux4_b4  (
    .i0(\u_cpu/u_fetch/n6 [4]),
    .i1(\u_cpu/dbg_rom_raddr [4]),
    .sel(\u_cpu/dbg_rom_ren ),
    .o(\u_cpu/u_fetch/n7 [4]));  // sources/rtl/mcu/fetch.v(89)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux4_b5  (
    .i0(\u_cpu/u_fetch/n6 [5]),
    .i1(\u_cpu/dbg_rom_raddr [5]),
    .sel(\u_cpu/dbg_rom_ren ),
    .o(\u_cpu/u_fetch/n7 [5]));  // sources/rtl/mcu/fetch.v(89)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux4_b6  (
    .i0(\u_cpu/u_fetch/n6 [6]),
    .i1(\u_cpu/dbg_rom_raddr [6]),
    .sel(\u_cpu/dbg_rom_ren ),
    .o(\u_cpu/u_fetch/n7 [6]));  // sources/rtl/mcu/fetch.v(89)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux4_b7  (
    .i0(\u_cpu/u_fetch/n6 [7]),
    .i1(\u_cpu/dbg_rom_raddr [7]),
    .sel(\u_cpu/dbg_rom_ren ),
    .o(\u_cpu/u_fetch/n7 [7]));  // sources/rtl/mcu/fetch.v(89)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux4_b8  (
    .i0(\u_cpu/u_fetch/n6 [8]),
    .i1(\u_cpu/dbg_rom_raddr [8]),
    .sel(\u_cpu/dbg_rom_ren ),
    .o(\u_cpu/u_fetch/n7 [8]));  // sources/rtl/mcu/fetch.v(89)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux4_b9  (
    .i0(\u_cpu/u_fetch/n6 [9]),
    .i1(\u_cpu/dbg_rom_raddr [9]),
    .sel(\u_cpu/dbg_rom_ren ),
    .o(\u_cpu/u_fetch/n7 [9]));  // sources/rtl/mcu/fetch.v(89)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux5_b0  (
    .i0(\u_cpu/inst [0]),
    .i1(rom_rdata[0]),
    .sel(\u_cpu/u_fetch/rom_bk_en ),
    .o(\u_cpu/u_fetch/n9 [0]));  // sources/rtl/mcu/fetch.v(105)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux5_b1  (
    .i0(\u_cpu/inst [1]),
    .i1(rom_rdata[1]),
    .sel(\u_cpu/u_fetch/rom_bk_en ),
    .o(\u_cpu/u_fetch/n9 [1]));  // sources/rtl/mcu/fetch.v(105)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux5_b2  (
    .i0(\u_cpu/inst [2]),
    .i1(rom_rdata[2]),
    .sel(\u_cpu/u_fetch/rom_bk_en ),
    .o(\u_cpu/u_fetch/n9 [2]));  // sources/rtl/mcu/fetch.v(105)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux5_b3  (
    .i0(\u_cpu/inst [3]),
    .i1(rom_rdata[3]),
    .sel(\u_cpu/u_fetch/rom_bk_en ),
    .o(\u_cpu/u_fetch/n9 [3]));  // sources/rtl/mcu/fetch.v(105)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux5_b4  (
    .i0(\u_cpu/inst [4]),
    .i1(rom_rdata[4]),
    .sel(\u_cpu/u_fetch/rom_bk_en ),
    .o(\u_cpu/u_fetch/n9 [4]));  // sources/rtl/mcu/fetch.v(105)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux5_b5  (
    .i0(\u_cpu/inst [5]),
    .i1(rom_rdata[5]),
    .sel(\u_cpu/u_fetch/rom_bk_en ),
    .o(\u_cpu/u_fetch/n9 [5]));  // sources/rtl/mcu/fetch.v(105)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux5_b6  (
    .i0(\u_cpu/inst [6]),
    .i1(rom_rdata[6]),
    .sel(\u_cpu/u_fetch/rom_bk_en ),
    .o(\u_cpu/u_fetch/n9 [6]));  // sources/rtl/mcu/fetch.v(105)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux5_b7  (
    .i0(\u_cpu/inst [7]),
    .i1(rom_rdata[7]),
    .sel(\u_cpu/u_fetch/rom_bk_en ),
    .o(\u_cpu/u_fetch/n9 [7]));  // sources/rtl/mcu/fetch.v(105)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux6_b0  (
    .i0(\u_cpu/u_fetch/n9 [0]),
    .i1(\u_cpu/dbg_inst [0]),
    .sel(\u_cpu/dbg_inst_en ),
    .o(\u_cpu/u_fetch/n10 [0]));  // sources/rtl/mcu/fetch.v(105)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux6_b1  (
    .i0(\u_cpu/u_fetch/n9 [1]),
    .i1(\u_cpu/dbg_inst [1]),
    .sel(\u_cpu/dbg_inst_en ),
    .o(\u_cpu/u_fetch/n10 [1]));  // sources/rtl/mcu/fetch.v(105)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux6_b2  (
    .i0(\u_cpu/u_fetch/n9 [2]),
    .i1(\u_cpu/dbg_inst [2]),
    .sel(\u_cpu/dbg_inst_en ),
    .o(\u_cpu/u_fetch/n10 [2]));  // sources/rtl/mcu/fetch.v(105)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux6_b3  (
    .i0(\u_cpu/u_fetch/n9 [3]),
    .i1(\u_cpu/dbg_inst [3]),
    .sel(\u_cpu/dbg_inst_en ),
    .o(\u_cpu/u_fetch/n10 [3]));  // sources/rtl/mcu/fetch.v(105)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux6_b4  (
    .i0(\u_cpu/u_fetch/n9 [4]),
    .i1(\u_cpu/dbg_inst [4]),
    .sel(\u_cpu/dbg_inst_en ),
    .o(\u_cpu/u_fetch/n10 [4]));  // sources/rtl/mcu/fetch.v(105)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux6_b5  (
    .i0(\u_cpu/u_fetch/n9 [5]),
    .i1(\u_cpu/dbg_inst [5]),
    .sel(\u_cpu/dbg_inst_en ),
    .o(\u_cpu/u_fetch/n10 [5]));  // sources/rtl/mcu/fetch.v(105)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux6_b6  (
    .i0(\u_cpu/u_fetch/n9 [6]),
    .i1(\u_cpu/dbg_inst [6]),
    .sel(\u_cpu/dbg_inst_en ),
    .o(\u_cpu/u_fetch/n10 [6]));  // sources/rtl/mcu/fetch.v(105)
  binary_mux_s1_w1 \u_cpu/u_fetch/mux6_b7  (
    .i0(\u_cpu/u_fetch/n9 [7]),
    .i1(\u_cpu/dbg_inst [7]),
    .sel(\u_cpu/dbg_inst_en ),
    .o(\u_cpu/u_fetch/n10 [7]));  // sources/rtl/mcu/fetch.v(105)
  reg_sr_as_w1 \u_cpu/u_fetch/reg0_b0  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n3 [0]),
    .en(1'b1),
    .reset(\u_cpu/dbg_en ),
    .set(1'b0),
    .q(\u_cpu/u_fetch/pc [0]));  // sources/rtl/mcu/fetch.v(75)
  reg_sr_as_w1 \u_cpu/u_fetch/reg0_b1  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n3 [1]),
    .en(1'b1),
    .reset(\u_cpu/dbg_en ),
    .set(1'b0),
    .q(\u_cpu/u_fetch/pc [1]));  // sources/rtl/mcu/fetch.v(75)
  reg_sr_as_w1 \u_cpu/u_fetch/reg0_b10  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n3 [10]),
    .en(1'b1),
    .reset(\u_cpu/dbg_en ),
    .set(1'b0),
    .q(\u_cpu/u_fetch/pc [10]));  // sources/rtl/mcu/fetch.v(75)
  reg_sr_as_w1 \u_cpu/u_fetch/reg0_b11  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n3 [11]),
    .en(1'b1),
    .reset(\u_cpu/dbg_en ),
    .set(1'b0),
    .q(\u_cpu/u_fetch/pc [11]));  // sources/rtl/mcu/fetch.v(75)
  reg_sr_as_w1 \u_cpu/u_fetch/reg0_b2  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n3 [2]),
    .en(1'b1),
    .reset(\u_cpu/dbg_en ),
    .set(1'b0),
    .q(\u_cpu/u_fetch/pc [2]));  // sources/rtl/mcu/fetch.v(75)
  reg_sr_as_w1 \u_cpu/u_fetch/reg0_b3  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n3 [3]),
    .en(1'b1),
    .reset(\u_cpu/dbg_en ),
    .set(1'b0),
    .q(\u_cpu/u_fetch/pc [3]));  // sources/rtl/mcu/fetch.v(75)
  reg_sr_as_w1 \u_cpu/u_fetch/reg0_b4  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n3 [4]),
    .en(1'b1),
    .reset(\u_cpu/dbg_en ),
    .set(1'b0),
    .q(\u_cpu/u_fetch/pc [4]));  // sources/rtl/mcu/fetch.v(75)
  reg_sr_as_w1 \u_cpu/u_fetch/reg0_b5  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n3 [5]),
    .en(1'b1),
    .reset(\u_cpu/dbg_en ),
    .set(1'b0),
    .q(\u_cpu/u_fetch/pc [5]));  // sources/rtl/mcu/fetch.v(75)
  reg_sr_as_w1 \u_cpu/u_fetch/reg0_b6  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n3 [6]),
    .en(1'b1),
    .reset(\u_cpu/dbg_en ),
    .set(1'b0),
    .q(\u_cpu/u_fetch/pc [6]));  // sources/rtl/mcu/fetch.v(75)
  reg_sr_as_w1 \u_cpu/u_fetch/reg0_b7  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n3 [7]),
    .en(1'b1),
    .reset(\u_cpu/dbg_en ),
    .set(1'b0),
    .q(\u_cpu/u_fetch/pc [7]));  // sources/rtl/mcu/fetch.v(75)
  reg_sr_as_w1 \u_cpu/u_fetch/reg0_b8  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n3 [8]),
    .en(1'b1),
    .reset(\u_cpu/dbg_en ),
    .set(1'b0),
    .q(\u_cpu/u_fetch/pc [8]));  // sources/rtl/mcu/fetch.v(75)
  reg_sr_as_w1 \u_cpu/u_fetch/reg0_b9  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n3 [9]),
    .en(1'b1),
    .reset(\u_cpu/dbg_en ),
    .set(1'b0),
    .q(\u_cpu/u_fetch/pc [9]));  // sources/rtl/mcu/fetch.v(75)
  reg_ar_as_w1 \u_cpu/u_fetch/reg1_b0  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n7 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_raddr[0]));  // sources/rtl/mcu/fetch.v(90)
  reg_ar_as_w1 \u_cpu/u_fetch/reg1_b1  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n7 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_raddr[1]));  // sources/rtl/mcu/fetch.v(90)
  reg_ar_as_w1 \u_cpu/u_fetch/reg1_b10  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n7 [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_raddr[10]));  // sources/rtl/mcu/fetch.v(90)
  reg_ar_as_w1 \u_cpu/u_fetch/reg1_b11  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n7 [11]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_raddr[11]));  // sources/rtl/mcu/fetch.v(90)
  reg_ar_as_w1 \u_cpu/u_fetch/reg1_b2  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n7 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_raddr[2]));  // sources/rtl/mcu/fetch.v(90)
  reg_ar_as_w1 \u_cpu/u_fetch/reg1_b3  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n7 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_raddr[3]));  // sources/rtl/mcu/fetch.v(90)
  reg_ar_as_w1 \u_cpu/u_fetch/reg1_b4  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n7 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_raddr[4]));  // sources/rtl/mcu/fetch.v(90)
  reg_ar_as_w1 \u_cpu/u_fetch/reg1_b5  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n7 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_raddr[5]));  // sources/rtl/mcu/fetch.v(90)
  reg_ar_as_w1 \u_cpu/u_fetch/reg1_b6  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n7 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_raddr[6]));  // sources/rtl/mcu/fetch.v(90)
  reg_ar_as_w1 \u_cpu/u_fetch/reg1_b7  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n7 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_raddr[7]));  // sources/rtl/mcu/fetch.v(90)
  reg_ar_as_w1 \u_cpu/u_fetch/reg1_b8  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n7 [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_raddr[8]));  // sources/rtl/mcu/fetch.v(90)
  reg_ar_as_w1 \u_cpu/u_fetch/reg1_b9  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n7 [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_raddr[9]));  // sources/rtl/mcu/fetch.v(90)
  reg_ar_as_w1 \u_cpu/u_fetch/reg2_b0  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n10 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/inst [0]));  // sources/rtl/mcu/fetch.v(106)
  reg_ar_as_w1 \u_cpu/u_fetch/reg2_b1  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n10 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/inst [1]));  // sources/rtl/mcu/fetch.v(106)
  reg_ar_as_w1 \u_cpu/u_fetch/reg2_b2  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n10 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/inst [2]));  // sources/rtl/mcu/fetch.v(106)
  reg_ar_as_w1 \u_cpu/u_fetch/reg2_b3  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n10 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/inst [3]));  // sources/rtl/mcu/fetch.v(106)
  reg_ar_as_w1 \u_cpu/u_fetch/reg2_b4  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n10 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/inst [4]));  // sources/rtl/mcu/fetch.v(106)
  reg_ar_as_w1 \u_cpu/u_fetch/reg2_b5  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n10 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/inst [5]));  // sources/rtl/mcu/fetch.v(106)
  reg_ar_as_w1 \u_cpu/u_fetch/reg2_b6  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n10 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/inst [6]));  // sources/rtl/mcu/fetch.v(106)
  reg_ar_as_w1 \u_cpu/u_fetch/reg2_b7  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n10 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/inst [7]));  // sources/rtl/mcu/fetch.v(106)
  reg_ar_as_w1 \u_cpu/u_fetch/reg3_b0  (
    .clk(vga_clk),
    .d(rom_rdata[0]),
    .en(\u_cpu/dbg_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_rdata [0]));  // sources/rtl/mcu/fetch.v(113)
  reg_ar_as_w1 \u_cpu/u_fetch/reg3_b1  (
    .clk(vga_clk),
    .d(rom_rdata[1]),
    .en(\u_cpu/dbg_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_rdata [1]));  // sources/rtl/mcu/fetch.v(113)
  reg_ar_as_w1 \u_cpu/u_fetch/reg3_b2  (
    .clk(vga_clk),
    .d(rom_rdata[2]),
    .en(\u_cpu/dbg_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_rdata [2]));  // sources/rtl/mcu/fetch.v(113)
  reg_ar_as_w1 \u_cpu/u_fetch/reg3_b3  (
    .clk(vga_clk),
    .d(rom_rdata[3]),
    .en(\u_cpu/dbg_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_rdata [3]));  // sources/rtl/mcu/fetch.v(113)
  reg_ar_as_w1 \u_cpu/u_fetch/reg3_b4  (
    .clk(vga_clk),
    .d(rom_rdata[4]),
    .en(\u_cpu/dbg_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_rdata [4]));  // sources/rtl/mcu/fetch.v(113)
  reg_ar_as_w1 \u_cpu/u_fetch/reg3_b5  (
    .clk(vga_clk),
    .d(rom_rdata[5]),
    .en(\u_cpu/dbg_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_rdata [5]));  // sources/rtl/mcu/fetch.v(113)
  reg_ar_as_w1 \u_cpu/u_fetch/reg3_b6  (
    .clk(vga_clk),
    .d(rom_rdata[6]),
    .en(\u_cpu/dbg_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_rdata [6]));  // sources/rtl/mcu/fetch.v(113)
  reg_ar_as_w1 \u_cpu/u_fetch/reg3_b7  (
    .clk(vga_clk),
    .d(rom_rdata[7]),
    .en(\u_cpu/dbg_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_rdata [7]));  // sources/rtl/mcu/fetch.v(113)
  reg_ar_as_w1 \u_cpu/u_fetch/rom_bk_en_reg  (
    .clk(vga_clk),
    .d(rom_ren),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_fetch/rom_bk_en ));  // sources/rtl/mcu/fetch.v(97)
  reg_ar_as_w1 \u_cpu/u_fetch/rom_ren_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_fetch/n5 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_ren));  // sources/rtl/mcu/fetch.v(81)
  or \u_cpu/u_fetch/u3  (\u_cpu/u_fetch/n5 , \u_cpu/dbg_rom_ren , \u_cpu/u_fetch/fetch_en );  // sources/rtl/mcu/fetch.v(80)
  or \u_cpu/u_fetch/u4  (\u_cpu/u_fetch/n8 , \u_cpu/dbg_inst_en , \u_cpu/u_fetch/rom_bk_en );  // sources/rtl/mcu/fetch.v(96)
  eq_w24 \u_cpu/u_timer/eq0  (
    .i0(\u_cpu/u_timer/cnt ),
    .i1(24'b000000000000000000000000),
    .o(\u_cpu/u_timer/n4 ));  // sources/rtl/mcu/timer.v(47)
  binary_mux_s1_w1 \u_cpu/u_timer/mux0_b0  (
    .i0(\u_cpu/u_timer/cnt [0]),
    .i1(\u_cpu/u_timer/n1 [0]),
    .sel(\u_cpu/u_timer/n0 ),
    .o(\u_cpu/u_timer/n2 [0]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux0_b1  (
    .i0(\u_cpu/u_timer/cnt [1]),
    .i1(\u_cpu/u_timer/n1 [1]),
    .sel(\u_cpu/u_timer/n0 ),
    .o(\u_cpu/u_timer/n2 [1]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux0_b10  (
    .i0(\u_cpu/u_timer/cnt [10]),
    .i1(\u_cpu/u_timer/n1 [10]),
    .sel(\u_cpu/u_timer/n0 ),
    .o(\u_cpu/u_timer/n2 [10]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux0_b11  (
    .i0(\u_cpu/u_timer/cnt [11]),
    .i1(\u_cpu/u_timer/n1 [11]),
    .sel(\u_cpu/u_timer/n0 ),
    .o(\u_cpu/u_timer/n2 [11]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux0_b12  (
    .i0(\u_cpu/u_timer/cnt [12]),
    .i1(\u_cpu/u_timer/n1 [12]),
    .sel(\u_cpu/u_timer/n0 ),
    .o(\u_cpu/u_timer/n2 [12]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux0_b13  (
    .i0(\u_cpu/u_timer/cnt [13]),
    .i1(\u_cpu/u_timer/n1 [13]),
    .sel(\u_cpu/u_timer/n0 ),
    .o(\u_cpu/u_timer/n2 [13]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux0_b14  (
    .i0(\u_cpu/u_timer/cnt [14]),
    .i1(\u_cpu/u_timer/n1 [14]),
    .sel(\u_cpu/u_timer/n0 ),
    .o(\u_cpu/u_timer/n2 [14]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux0_b15  (
    .i0(\u_cpu/u_timer/cnt [15]),
    .i1(\u_cpu/u_timer/n1 [15]),
    .sel(\u_cpu/u_timer/n0 ),
    .o(\u_cpu/u_timer/n2 [15]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux0_b16  (
    .i0(\u_cpu/u_timer/cnt [16]),
    .i1(\u_cpu/u_timer/n1 [16]),
    .sel(\u_cpu/u_timer/n0 ),
    .o(\u_cpu/u_timer/n2 [16]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux0_b17  (
    .i0(\u_cpu/u_timer/cnt [17]),
    .i1(\u_cpu/u_timer/n1 [17]),
    .sel(\u_cpu/u_timer/n0 ),
    .o(\u_cpu/u_timer/n2 [17]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux0_b18  (
    .i0(\u_cpu/u_timer/cnt [18]),
    .i1(\u_cpu/u_timer/n1 [18]),
    .sel(\u_cpu/u_timer/n0 ),
    .o(\u_cpu/u_timer/n2 [18]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux0_b19  (
    .i0(\u_cpu/u_timer/cnt [19]),
    .i1(\u_cpu/u_timer/n1 [19]),
    .sel(\u_cpu/u_timer/n0 ),
    .o(\u_cpu/u_timer/n2 [19]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux0_b2  (
    .i0(\u_cpu/u_timer/cnt [2]),
    .i1(\u_cpu/u_timer/n1 [2]),
    .sel(\u_cpu/u_timer/n0 ),
    .o(\u_cpu/u_timer/n2 [2]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux0_b20  (
    .i0(\u_cpu/u_timer/cnt [20]),
    .i1(\u_cpu/u_timer/n1 [20]),
    .sel(\u_cpu/u_timer/n0 ),
    .o(\u_cpu/u_timer/n2 [20]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux0_b21  (
    .i0(\u_cpu/u_timer/cnt [21]),
    .i1(\u_cpu/u_timer/n1 [21]),
    .sel(\u_cpu/u_timer/n0 ),
    .o(\u_cpu/u_timer/n2 [21]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux0_b22  (
    .i0(\u_cpu/u_timer/cnt [22]),
    .i1(\u_cpu/u_timer/n1 [22]),
    .sel(\u_cpu/u_timer/n0 ),
    .o(\u_cpu/u_timer/n2 [22]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux0_b23  (
    .i0(\u_cpu/u_timer/cnt [23]),
    .i1(\u_cpu/u_timer/n1 [23]),
    .sel(\u_cpu/u_timer/n0 ),
    .o(\u_cpu/u_timer/n2 [23]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux0_b3  (
    .i0(\u_cpu/u_timer/cnt [3]),
    .i1(\u_cpu/u_timer/n1 [3]),
    .sel(\u_cpu/u_timer/n0 ),
    .o(\u_cpu/u_timer/n2 [3]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux0_b4  (
    .i0(\u_cpu/u_timer/cnt [4]),
    .i1(\u_cpu/u_timer/n1 [4]),
    .sel(\u_cpu/u_timer/n0 ),
    .o(\u_cpu/u_timer/n2 [4]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux0_b5  (
    .i0(\u_cpu/u_timer/cnt [5]),
    .i1(\u_cpu/u_timer/n1 [5]),
    .sel(\u_cpu/u_timer/n0 ),
    .o(\u_cpu/u_timer/n2 [5]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux0_b6  (
    .i0(\u_cpu/u_timer/cnt [6]),
    .i1(\u_cpu/u_timer/n1 [6]),
    .sel(\u_cpu/u_timer/n0 ),
    .o(\u_cpu/u_timer/n2 [6]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux0_b7  (
    .i0(\u_cpu/u_timer/cnt [7]),
    .i1(\u_cpu/u_timer/n1 [7]),
    .sel(\u_cpu/u_timer/n0 ),
    .o(\u_cpu/u_timer/n2 [7]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux0_b8  (
    .i0(\u_cpu/u_timer/cnt [8]),
    .i1(\u_cpu/u_timer/n1 [8]),
    .sel(\u_cpu/u_timer/n0 ),
    .o(\u_cpu/u_timer/n2 [8]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux0_b9  (
    .i0(\u_cpu/u_timer/cnt [9]),
    .i1(\u_cpu/u_timer/n1 [9]),
    .sel(\u_cpu/u_timer/n0 ),
    .o(\u_cpu/u_timer/n2 [9]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux1_b0  (
    .i0(\u_cpu/u_timer/n2 [0]),
    .i1(\u_cpu/timer_wdata [0]),
    .sel(\u_cpu/timer_wen ),
    .o(\u_cpu/u_timer/n3 [0]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux1_b1  (
    .i0(\u_cpu/u_timer/n2 [1]),
    .i1(\u_cpu/timer_wdata [1]),
    .sel(\u_cpu/timer_wen ),
    .o(\u_cpu/u_timer/n3 [1]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux1_b10  (
    .i0(\u_cpu/u_timer/n2 [10]),
    .i1(\u_cpu/timer_wdata [10]),
    .sel(\u_cpu/timer_wen ),
    .o(\u_cpu/u_timer/n3 [10]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux1_b11  (
    .i0(\u_cpu/u_timer/n2 [11]),
    .i1(\u_cpu/timer_wdata [11]),
    .sel(\u_cpu/timer_wen ),
    .o(\u_cpu/u_timer/n3 [11]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux1_b12  (
    .i0(\u_cpu/u_timer/n2 [12]),
    .i1(\u_cpu/timer_wdata [12]),
    .sel(\u_cpu/timer_wen ),
    .o(\u_cpu/u_timer/n3 [12]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux1_b13  (
    .i0(\u_cpu/u_timer/n2 [13]),
    .i1(\u_cpu/timer_wdata [13]),
    .sel(\u_cpu/timer_wen ),
    .o(\u_cpu/u_timer/n3 [13]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux1_b14  (
    .i0(\u_cpu/u_timer/n2 [14]),
    .i1(\u_cpu/timer_wdata [14]),
    .sel(\u_cpu/timer_wen ),
    .o(\u_cpu/u_timer/n3 [14]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux1_b15  (
    .i0(\u_cpu/u_timer/n2 [15]),
    .i1(\u_cpu/timer_wdata [15]),
    .sel(\u_cpu/timer_wen ),
    .o(\u_cpu/u_timer/n3 [15]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux1_b16  (
    .i0(\u_cpu/u_timer/n2 [16]),
    .i1(\u_cpu/timer_wdata [16]),
    .sel(\u_cpu/timer_wen ),
    .o(\u_cpu/u_timer/n3 [16]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux1_b17  (
    .i0(\u_cpu/u_timer/n2 [17]),
    .i1(\u_cpu/timer_wdata [17]),
    .sel(\u_cpu/timer_wen ),
    .o(\u_cpu/u_timer/n3 [17]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux1_b18  (
    .i0(\u_cpu/u_timer/n2 [18]),
    .i1(\u_cpu/timer_wdata [18]),
    .sel(\u_cpu/timer_wen ),
    .o(\u_cpu/u_timer/n3 [18]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux1_b19  (
    .i0(\u_cpu/u_timer/n2 [19]),
    .i1(\u_cpu/timer_wdata [19]),
    .sel(\u_cpu/timer_wen ),
    .o(\u_cpu/u_timer/n3 [19]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux1_b2  (
    .i0(\u_cpu/u_timer/n2 [2]),
    .i1(\u_cpu/timer_wdata [2]),
    .sel(\u_cpu/timer_wen ),
    .o(\u_cpu/u_timer/n3 [2]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux1_b20  (
    .i0(\u_cpu/u_timer/n2 [20]),
    .i1(\u_cpu/timer_wdata [20]),
    .sel(\u_cpu/timer_wen ),
    .o(\u_cpu/u_timer/n3 [20]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux1_b21  (
    .i0(\u_cpu/u_timer/n2 [21]),
    .i1(\u_cpu/timer_wdata [21]),
    .sel(\u_cpu/timer_wen ),
    .o(\u_cpu/u_timer/n3 [21]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux1_b22  (
    .i0(\u_cpu/u_timer/n2 [22]),
    .i1(\u_cpu/timer_wdata [22]),
    .sel(\u_cpu/timer_wen ),
    .o(\u_cpu/u_timer/n3 [22]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux1_b23  (
    .i0(\u_cpu/u_timer/n2 [23]),
    .i1(\u_cpu/timer_wdata [23]),
    .sel(\u_cpu/timer_wen ),
    .o(\u_cpu/u_timer/n3 [23]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux1_b3  (
    .i0(\u_cpu/u_timer/n2 [3]),
    .i1(\u_cpu/timer_wdata [3]),
    .sel(\u_cpu/timer_wen ),
    .o(\u_cpu/u_timer/n3 [3]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux1_b4  (
    .i0(\u_cpu/u_timer/n2 [4]),
    .i1(\u_cpu/timer_wdata [4]),
    .sel(\u_cpu/timer_wen ),
    .o(\u_cpu/u_timer/n3 [4]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux1_b5  (
    .i0(\u_cpu/u_timer/n2 [5]),
    .i1(\u_cpu/timer_wdata [5]),
    .sel(\u_cpu/timer_wen ),
    .o(\u_cpu/u_timer/n3 [5]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux1_b6  (
    .i0(\u_cpu/u_timer/n2 [6]),
    .i1(\u_cpu/timer_wdata [6]),
    .sel(\u_cpu/timer_wen ),
    .o(\u_cpu/u_timer/n3 [6]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux1_b7  (
    .i0(\u_cpu/u_timer/n2 [7]),
    .i1(\u_cpu/timer_wdata [7]),
    .sel(\u_cpu/timer_wen ),
    .o(\u_cpu/u_timer/n3 [7]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux1_b8  (
    .i0(\u_cpu/u_timer/n2 [8]),
    .i1(\u_cpu/timer_wdata [8]),
    .sel(\u_cpu/timer_wen ),
    .o(\u_cpu/u_timer/n3 [8]));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w1 \u_cpu/u_timer/mux1_b9  (
    .i0(\u_cpu/u_timer/n2 [9]),
    .i1(\u_cpu/timer_wdata [9]),
    .sel(\u_cpu/timer_wen ),
    .o(\u_cpu/u_timer/n3 [9]));  // sources/rtl/mcu/timer.v(41)
  ne_w24 \u_cpu/u_timer/neq0  (
    .i0(\u_cpu/u_timer/cnt ),
    .i1(24'b000000000000000000000000),
    .o(\u_cpu/u_timer/n0 ));  // sources/rtl/mcu/timer.v(40)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b0  (
    .clk(vga_clk),
    .d(\u_cpu/u_timer/n3 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [0]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b1  (
    .clk(vga_clk),
    .d(\u_cpu/u_timer/n3 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [1]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b10  (
    .clk(vga_clk),
    .d(\u_cpu/u_timer/n3 [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [10]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b11  (
    .clk(vga_clk),
    .d(\u_cpu/u_timer/n3 [11]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [11]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b12  (
    .clk(vga_clk),
    .d(\u_cpu/u_timer/n3 [12]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [12]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b13  (
    .clk(vga_clk),
    .d(\u_cpu/u_timer/n3 [13]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [13]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b14  (
    .clk(vga_clk),
    .d(\u_cpu/u_timer/n3 [14]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [14]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b15  (
    .clk(vga_clk),
    .d(\u_cpu/u_timer/n3 [15]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [15]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b16  (
    .clk(vga_clk),
    .d(\u_cpu/u_timer/n3 [16]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [16]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b17  (
    .clk(vga_clk),
    .d(\u_cpu/u_timer/n3 [17]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [17]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b18  (
    .clk(vga_clk),
    .d(\u_cpu/u_timer/n3 [18]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [18]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b19  (
    .clk(vga_clk),
    .d(\u_cpu/u_timer/n3 [19]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [19]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b2  (
    .clk(vga_clk),
    .d(\u_cpu/u_timer/n3 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [2]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b20  (
    .clk(vga_clk),
    .d(\u_cpu/u_timer/n3 [20]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [20]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b21  (
    .clk(vga_clk),
    .d(\u_cpu/u_timer/n3 [21]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [21]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b22  (
    .clk(vga_clk),
    .d(\u_cpu/u_timer/n3 [22]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [22]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b23  (
    .clk(vga_clk),
    .d(\u_cpu/u_timer/n3 [23]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [23]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b3  (
    .clk(vga_clk),
    .d(\u_cpu/u_timer/n3 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [3]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b4  (
    .clk(vga_clk),
    .d(\u_cpu/u_timer/n3 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [4]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b5  (
    .clk(vga_clk),
    .d(\u_cpu/u_timer/n3 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [5]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b6  (
    .clk(vga_clk),
    .d(\u_cpu/u_timer/n3 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [6]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b7  (
    .clk(vga_clk),
    .d(\u_cpu/u_timer/n3 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [7]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b8  (
    .clk(vga_clk),
    .d(\u_cpu/u_timer/n3 [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [8]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b9  (
    .clk(vga_clk),
    .d(\u_cpu/u_timer/n3 [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [9]));  // sources/rtl/mcu/timer.v(42)
  add_pu24_mu24_o24 \u_cpu/u_timer/sub0  (
    .i0(\u_cpu/u_timer/cnt ),
    .i1(24'b000000000000000000000001),
    .o(\u_cpu/u_timer/n1 [23:0]));  // sources/rtl/mcu/timer.v(41)
  reg_ar_as_w1 \u_cpu/u_timer/timer_state_reg  (
    .clk(vga_clk),
    .d(\u_cpu/u_timer/n4 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_state ));  // sources/rtl/mcu/timer.v(48)
  add_pu19_pu19_o19 \u_key/add0  (
    .i0(\u_key/cnt ),
    .i1(19'b0000000000000000001),
    .o(\u_key/n3 ));  // sources/rtl/key/key.v(42)
  reg_ar_as_w1 \u_key/key_flag_reg  (
    .clk(vga_clk),
    .d(\u_key/n25 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/key_flag ));  // sources/rtl/key/key.v(57)
  reg_ar_as_w1 \u_key/reg0_b0  (
    .clk(vga_clk),
    .d(\u_key/n15 [0]),
    .en(\u_key/n14 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/key_d0 [0]));  // sources/rtl/key/key.v(50)
  reg_ar_as_w1 \u_key/reg0_b1  (
    .clk(vga_clk),
    .d(\u_key/n15 [1]),
    .en(\u_key/n14 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/key_d0 [1]));  // sources/rtl/key/key.v(50)
  reg_ar_as_w1 \u_key/reg0_b2  (
    .clk(vga_clk),
    .d(\u_key/n15 [2]),
    .en(\u_key/n14 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/key_d0 [2]));  // sources/rtl/key/key.v(50)
  reg_ar_as_w1 \u_key/reg0_b3  (
    .clk(vga_clk),
    .d(\u_key/n15 [3]),
    .en(\u_key/n14 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/key_d0 [3]));  // sources/rtl/key/key.v(50)
  reg_ar_as_w1 \u_key/reg0_b4  (
    .clk(vga_clk),
    .d(\u_key/n15 [4]),
    .en(\u_key/n14 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/key_d0 [4]));  // sources/rtl/key/key.v(50)
  reg_ar_as_w1 \u_key/reg0_b5  (
    .clk(vga_clk),
    .d(\u_key/n15 [5]),
    .en(\u_key/n14 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/key_d0 [5]));  // sources/rtl/key/key.v(50)
  reg_ar_as_w1 \u_key/reg1_b0  (
    .clk(vga_clk),
    .d(\u_key/key_d0 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/key_d1 [0]));  // sources/rtl/key/key.v(57)
  reg_ar_as_w1 \u_key/reg1_b1  (
    .clk(vga_clk),
    .d(\u_key/key_d0 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/key_d1 [1]));  // sources/rtl/key/key.v(57)
  reg_ar_as_w1 \u_key/reg1_b2  (
    .clk(vga_clk),
    .d(\u_key/key_d0 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/key_d1 [2]));  // sources/rtl/key/key.v(57)
  reg_ar_as_w1 \u_key/reg1_b3  (
    .clk(vga_clk),
    .d(\u_key/key_d0 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/key_d1 [3]));  // sources/rtl/key/key.v(57)
  reg_ar_as_w1 \u_key/reg1_b4  (
    .clk(vga_clk),
    .d(\u_key/key_d0 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/key_d1 [4]));  // sources/rtl/key/key.v(57)
  reg_ar_as_w1 \u_key/reg1_b5  (
    .clk(vga_clk),
    .d(\u_key/key_d0 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/key_d1 [5]));  // sources/rtl/key/key.v(57)
  reg_sr_as_w1 \u_key/reg2_b0  (
    .clk(vga_clk),
    .d(\u_key/key_d1 [0]),
    .en(\u_key/key_flag ),
    .reset(clear),
    .set(1'b0),
    .q(key_deb[0]));  // sources/rtl/key/key.v(66)
  reg_sr_as_w1 \u_key/reg2_b1  (
    .clk(vga_clk),
    .d(\u_key/key_d1 [1]),
    .en(\u_key/key_flag ),
    .reset(clear),
    .set(1'b0),
    .q(key_deb[1]));  // sources/rtl/key/key.v(66)
  reg_sr_as_w1 \u_key/reg2_b2  (
    .clk(vga_clk),
    .d(\u_key/key_d1 [2]),
    .en(\u_key/key_flag ),
    .reset(clear),
    .set(1'b0),
    .q(key_deb[2]));  // sources/rtl/key/key.v(66)
  reg_sr_as_w1 \u_key/reg2_b3  (
    .clk(vga_clk),
    .d(\u_key/key_d1 [3]),
    .en(\u_key/key_flag ),
    .reset(clear),
    .set(1'b0),
    .q(key_deb[3]));  // sources/rtl/key/key.v(66)
  reg_sr_as_w1 \u_key/reg2_b4  (
    .clk(vga_clk),
    .d(\u_key/key_d1 [4]),
    .en(\u_key/key_flag ),
    .reset(clear),
    .set(1'b0),
    .q(key_deb[4]));  // sources/rtl/key/key.v(66)
  reg_sr_as_w1 \u_key/reg2_b5  (
    .clk(vga_clk),
    .d(\u_key/key_d1 [5]),
    .en(\u_key/key_flag ),
    .reset(clear),
    .set(1'b0),
    .q(key_deb[5]));  // sources/rtl/key/key.v(66)
  reg_ar_as_w1 \u_key/reg3_b0  (
    .clk(vga_clk),
    .d(\u_key/n3 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [0]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b1  (
    .clk(vga_clk),
    .d(\u_key/n3 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [1]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b10  (
    .clk(vga_clk),
    .d(\u_key/n3 [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [10]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b11  (
    .clk(vga_clk),
    .d(\u_key/n3 [11]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [11]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b12  (
    .clk(vga_clk),
    .d(\u_key/n3 [12]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [12]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b13  (
    .clk(vga_clk),
    .d(\u_key/n3 [13]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [13]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b14  (
    .clk(vga_clk),
    .d(\u_key/n3 [14]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [14]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b15  (
    .clk(vga_clk),
    .d(\u_key/n3 [15]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [15]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b16  (
    .clk(vga_clk),
    .d(\u_key/n3 [16]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [16]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b17  (
    .clk(vga_clk),
    .d(\u_key/n3 [17]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [17]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b18  (
    .clk(vga_clk),
    .d(\u_key/n3 [18]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [18]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b2  (
    .clk(vga_clk),
    .d(\u_key/n3 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [2]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b3  (
    .clk(vga_clk),
    .d(\u_key/n3 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [3]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b4  (
    .clk(vga_clk),
    .d(\u_key/n3 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [4]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b5  (
    .clk(vga_clk),
    .d(\u_key/n3 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [5]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b6  (
    .clk(vga_clk),
    .d(\u_key/n3 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [6]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b7  (
    .clk(vga_clk),
    .d(\u_key/n3 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [7]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b8  (
    .clk(vga_clk),
    .d(\u_key/n3 [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [8]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b9  (
    .clk(vga_clk),
    .d(\u_key/n3 [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [9]));  // sources/rtl/key/key.v(43)
  or \u_key/u10  (\u_key/n24 , \u_key/n1 , \u_key/n13 );  // sources/rtl/key/key.v(56)
  or \u_key/u11  (\u_key/n11 , \u_key/key_d1 [0], \u_key/n12 );  // sources/rtl/key/key.v(56)
  or \u_key/u12  (\u_key/n10 , \u_key/key_d1 [4], \u_key/key_d1 [5]);  // sources/rtl/key/key.v(56)
  or \u_key/u13  (\u_key/n9 , \u_key/key_d1 [3], \u_key/n10 );  // sources/rtl/key/key.v(56)
  or \u_key/u14  (\u_key/n8 , \u_key/n11 , \u_key/n9 );  // sources/rtl/key/key.v(56)
  not \u_key/u15  (\u_key/n23 , \u_key/n8 );  // sources/rtl/key/key.v(56)
  not \u_key/u16  (\u_key/n15 [1], key[1]);  // sources/rtl/key/key.v(49)
  not \u_key/u17  (\u_key/n15 [2], key[2]);  // sources/rtl/key/key.v(49)
  not \u_key/u18  (\u_key/n15 [3], key[3]);  // sources/rtl/key/key.v(49)
  not \u_key/u19  (\u_key/n15 [4], key[4]);  // sources/rtl/key/key.v(49)
  or \u_key/u2  (\u_key/n1 , \u_key/key_d0 [0], \u_key/n2 );  // sources/rtl/key/key.v(56)
  not \u_key/u20  (\u_key/n15 [5], key[5]);  // sources/rtl/key/key.v(49)
  and \u_key/u21  (\u_key/n18 , \u_key/cnt [2], \u_key/cnt [3]);  // sources/rtl/key/key.v(48)
  and \u_key/u22  (\u_key/n19 , \u_key/n17 , \u_key/n18 );  // sources/rtl/key/key.v(48)
  and \u_key/u23  (\u_key/n20 , \u_key/cnt [4], \u_key/cnt [5]);  // sources/rtl/key/key.v(48)
  and \u_key/u24  (\u_key/n21 , \u_key/cnt [7], \u_key/cnt [8]);  // sources/rtl/key/key.v(48)
  and \u_key/u25  (\u_key/n22 , \u_key/cnt [6], \u_key/n21 );  // sources/rtl/key/key.v(48)
  and \u_key/u26  (\u_key/n26 , \u_key/n20 , \u_key/n22 );  // sources/rtl/key/key.v(48)
  and \u_key/u27  (\u_key/n27 , \u_key/n19 , \u_key/n26 );  // sources/rtl/key/key.v(48)
  and \u_key/u28  (\u_key/n28 , \u_key/cnt [9], \u_key/cnt [10]);  // sources/rtl/key/key.v(48)
  and \u_key/u29  (\u_key/n29 , \u_key/cnt [12], \u_key/cnt [13]);  // sources/rtl/key/key.v(48)
  or \u_key/u3  (\u_key/n2 , \u_key/key_d0 [1], \u_key/key_d0 [2]);  // sources/rtl/key/key.v(56)
  and \u_key/u30  (\u_key/n30 , \u_key/cnt [11], \u_key/n29 );  // sources/rtl/key/key.v(48)
  and \u_key/u31  (\u_key/n31 , \u_key/n28 , \u_key/n30 );  // sources/rtl/key/key.v(48)
  and \u_key/u32  (\u_key/n32 , \u_key/cnt [14], \u_key/cnt [15]);  // sources/rtl/key/key.v(48)
  and \u_key/u33  (\u_key/n7 , \u_key/cnt [17], \u_key/cnt [18]);  // sources/rtl/key/key.v(48)
  and \u_key/u34  (\u_key/n6 , \u_key/cnt [16], \u_key/n7 );  // sources/rtl/key/key.v(48)
  and \u_key/u35  (\u_key/n5 , \u_key/n32 , \u_key/n6 );  // sources/rtl/key/key.v(48)
  and \u_key/u36  (\u_key/n4 , \u_key/n31 , \u_key/n5 );  // sources/rtl/key/key.v(48)
  and \u_key/u37  (\u_key/n14 , \u_key/n27 , \u_key/n4 );  // sources/rtl/key/key.v(48)
  and \u_key/u4  (\u_key/n17 , \u_key/cnt [0], \u_key/cnt [1]);  // sources/rtl/key/key.v(48)
  not \u_key/u5  (\u_key/n15 [0], key[0]);  // sources/rtl/key/key.v(49)
  or \u_key/u6  (\u_key/n12 , \u_key/key_d1 [1], \u_key/key_d1 [2]);  // sources/rtl/key/key.v(56)
  and \u_key/u7  (\u_key/n25 , \u_key/n23 , \u_key/n24 );  // sources/rtl/key/key.v(56)
  or \u_key/u8  (\u_key/n0 , \u_key/key_d0 [4], \u_key/key_d0 [5]);  // sources/rtl/key/key.v(56)
  or \u_key/u9  (\u_key/n13 , \u_key/key_d0 [3], \u_key/n0 );  // sources/rtl/key/key.v(56)
  EG_LOGIC_BUFG \u_pll/bufg_feedback  (
    .i(\u_pll/clk0_buf ),
    .o(vga_clk));  // al_ip/pll.v(30)
  EG_PHY_PLL #(
    .CLKC0_CPHASE(39),
    .CLKC0_DIV(40),
    .CLKC0_DIV2_ENABLE("DISABLE"),
    .CLKC0_ENABLE("ENABLE"),
    .CLKC0_FPHASE(0),
    .CLKC1_CPHASE(1),
    .CLKC1_DIV(1),
    .CLKC1_DIV2_ENABLE("DISABLE"),
    .CLKC1_ENABLE("DISABLE"),
    .CLKC1_FPHASE(0),
    .CLKC2_CPHASE(1),
    .CLKC2_DIV(1),
    .CLKC2_DIV2_ENABLE("DISABLE"),
    .CLKC2_ENABLE("DISABLE"),
    .CLKC2_FPHASE(0),
    .CLKC3_CPHASE(1),
    .CLKC3_DIV(1),
    .CLKC3_DIV2_ENABLE("DISABLE"),
    .CLKC3_ENABLE("DISABLE"),
    .CLKC3_FPHASE(0),
    .CLKC4_CPHASE(1),
    .CLKC4_DIV(1),
    .CLKC4_DIV2_ENABLE("DISABLE"),
    .CLKC4_ENABLE("DISABLE"),
    .CLKC4_FPHASE(0),
    .DERIVE_PLL_CLOCKS("DISABLE"),
    .DPHASE_SOURCE("DISABLE"),
    .DYNCFG("DISABLE"),
    .FBCLK_DIV(17),
    .FEEDBK_MODE("NORMAL"),
    .FEEDBK_PATH("CLKC0_EXT"),
    .FIN("24.000"),
    .FREQ_LOCK_ACCURACY(2),
    .GEN_BASIC_CLOCK("DISABLE"),
    .GMC_GAIN(6),
    .GMC_TEST(14),
    .ICP_CURRENT(3),
    .IF_ESCLKSTSW("DISABLE"),
    .INTFB_WAKE("DISABLE"),
    .KVCO(6),
    .LPF_CAPACITOR(3),
    .LPF_RESISTOR(2),
    .NORESET("DISABLE"),
    .ODIV_MUXC0("DIV"),
    .ODIV_MUXC1("DIV"),
    .ODIV_MUXC2("DIV"),
    .ODIV_MUXC3("DIV"),
    .ODIV_MUXC4("DIV"),
    .PLLC2RST_ENA("DISABLE"),
    .PLLC34RST_ENA("DISABLE"),
    .PLLMRST_ENA("DISABLE"),
    .PLLRST_ENA("DISABLE"),
    .PLL_LOCK_MODE(0),
    .PREDIV_MUXC0("VCO"),
    .PREDIV_MUXC1("VCO"),
    .PREDIV_MUXC2("VCO"),
    .PREDIV_MUXC3("VCO"),
    .PREDIV_MUXC4("VCO"),
    .REFCLK_DIV(16),
    .REFCLK_SEL("INTERNAL"),
    .STDBY_ENABLE("DISABLE"),
    .STDBY_VCO_ENA("DISABLE"),
    .SYNC_ENABLE("DISABLE"),
    .VCO_NORESET("DISABLE"))
    \u_pll/pll_inst  (
    .daddr(6'b000000),
    .dclk(1'b0),
    .dcs(1'b0),
    .di(8'b00000000),
    .dwe(1'b0),
    .fbclk(vga_clk),
    .psclk(1'b0),
    .psclksel(3'b000),
    .psdown(1'b0),
    .psstep(1'b0),
    .refclk(clk),
    .reset(1'b0),
    .stdby(1'b0),
    .clkc({open_n0,open_n1,open_n2,open_n3,\u_pll/clk0_buf }));  // al_ip/pll.v(53)
  EG_LOGIC_BRAM #(
    //.FORCE_KEEP("OFF"),
    //.INIT_FILE("NONE"),
    .ADDR_WIDTH_A(4),
    .ADDR_WIDTH_B(4),
    .BYTE_A(1),
    .BYTE_B(1),
    .BYTE_ENABLE(0),
    .DATA_DEPTH_A(16),
    .DATA_DEPTH_B(16),
    .DATA_WIDTH_A(8),
    .DATA_WIDTH_B(8),
    .DEBUGGABLE("NO"),
    .FILL_ALL("NONE"),
    .IMPLEMENT("9K"),
    .MODE("DP"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("READBEFOREWRITE"))
    \u_ram/ram_ram_reg0  (
    .addra(bus_raddr[3:0]),
    .addrb(ram_waddr[3:0]),
    .cea(ram_ren),
    .ceb(1'b1),
    .clka(vga_clk),
    .clkb(vga_clk),
    .dia(8'b00000000),
    .dib(ram_wdata),
    .ocea(1'b1),
    .oceb(1'b1),
    .rsta(1'b0),
    .rstb(1'b0),
    .wea(1'b0),
    .web(\u_ram/n4 ),
    .doa(ram_rdata));  // sources/rtl/mcu/ram.v(40)
  or \u_ram/u2  (\u_ram/n0 , ram_waddr[6], ram_waddr[7]);  // sources/rtl/mcu/ram.v(46)
  or \u_ram/u3  (\u_ram/n1 , ram_waddr[4], ram_waddr[5]);  // sources/rtl/mcu/ram.v(46)
  and \u_ram/u4  (\u_ram/n4 , \u_ram/n2 , ram_wen);  // sources/rtl/mcu/ram.v(46)
  or \u_ram/u6  (\u_ram/n7 , \u_ram/n1 , \u_ram/n0 );  // sources/rtl/mcu/ram.v(46)
  not \u_ram/u7  (\u_ram/n2 , \u_ram/n7 );  // sources/rtl/mcu/ram.v(46)
  EG_LOGIC_BRAM #(
    //.FORCE_KEEP("OFF"),
    //.INIT_FILE("init_str:10000000 00000000 00100000 01010000 10111000 10000000 10000000 00100000 00110000 10111000 10000000 00000000 00100000 11100000 10111000 10000000 00000000 01000000 00000000 11000000 11100011 00100000 00000000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 10000000 00100000 11100000 10111000 10000000 00000000 01000000 10000000 11000000 10101111 00100000 00000000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 10000000 10000000 00000000 01000000 00000000 11000000 11100011 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 01000000 00100000 11100000 10111000 10000000 00000000 01000000 11000000 11000000 10100010 00100000 00000000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 00110000 00111000 00010000 10000000 00000000 01000000 00000000 11000000 11111110 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 00000000 00100000 00110000 10111000 10000000 11000000 00100000 11100000 10111000 10000000 00000000 01000000 01000000 11000000 10100010 00100000 00000000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 01010000 00111000 10100000 01000000 10000000 11110000 00100000 01010000 10000100 00100000 01010000 00111000 10100000 01000000 11111111 11001000 00100000 11010000 00100100 00100000 11010000 00111000 00010000 10000000 00000000 01000000 00000000 11000000 10010101 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 10000000 00100000 00110000 10111000 10000000 11100000 01000000 00001101 11000000 00000011 01110000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 00000000 01000000 00000000 11000000 01001100 00100000 00000000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 00000000 00100000 00000000 10111000 10000000 10000000 00100000 01100000 10111000 00100000 01100000 00111000 00010000 10000000 00000000 01000000 10000000 11000000 10011010 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 00000000 00100000 10000000 10111000 00100000 01100000 00111000 00010000 10000000 00000000 01000000 10000000 11000000 10001100 10110000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 00000000 00111000 10100000 00100000 10000000 01011000 10000000 10000000 00100000 01000000 01011000 00100000 00000000 00111000 10100000 01000000 10000000 11110000 00100000 00000000 10000100 00100000 10000000 00111000 10100000 01000000 10000000 11110000 00100000 10000000 10000100 10000000 01001000 00100000 10000000 00111000 01100000 01001000 00100000 01100000 00100100 10000000 00000000 01000000 00000000 11000000 11100111 00100000 00000000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 01010111 00100000 00000000 00111000 01100000 01001000 00100000 01100000 00100100 10000000 11001000 01000000 10011100 11000000 00000111 01110000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 00000000 01000000 00000000 11000000 10001011 00100000 00000000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 10000000 00100000 01100000 10111000 00100000 01100000 00111000 00010000 10000000 00000000 01000000 10000000 11000000 01100111 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 00000000 00100000 10000000 10111000 00100000 01100000 00111000 00010000 10000000 00000000 01000000 10000000 11000000 01111101 10110000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 00000000 00111000 10100000 01000000 10000000 00001000 00100000 00000000 10000100 00100000 10000000 00111000 10100000 01000000 10000000 11110000 00100000 10000000 10000100 00100000 00000000 00111000 10100000 00100000 10000000 01011000 10000000 00000000 00100000 01000000 01011000 10000000 01001000 00100000 10000000 00111000 01100000 01001000 00100000 01100000 00100100 10000000 00000000 01000000 10000000 11000000 00101110 00100000 00000000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 00000000 00111000 10100000 01000000 00000000 01001000 00100000 01100000 00100100 10000000 11001000 01000000 10011100 11000000 00000111 01110000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 00000000 01000000 10000000 11000000 01111010 00100000 00000000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 00000000 01000000 11100000 11000000 01110111 00100000 00000000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 00010000 00100000 10010000 10111000 10000000 00111101 00100000 10000000 01011000 10000000 10000000 00100000 01000000 01011000 10000000 10110011 00100000 10000000 01011000 10000000 10000000 00100000 01000000 01011000 10000000 01110011 00100000 10000000 01011000 10000000 10000000 00100000 01000000 01011000 10000000 11110011 00100000 10000000 01011000 10000000 10000000 00100000 01000000 01011000 10000000 11111011 00100000 10000000 01011000 10000000 10000000 00100000 01000000 01011000 10000000 10000111 00100000 10000000 01011000 10000000 10000000 00100000 01000000 01011000 10000000 00000000 01000000 11100000 11000000 01110111 00100000 00000000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 11001101 00100000 00000000 10111000 10000000 00000000 00100000 10000000 10111000 10000000 10000000 00100000 01100000 10111000 00100000 01100000 00111000 00010000 10000000 00000000 01000000 01000000 11000000 11100111 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 00000000 00100000 10000000 10111000 00100000 01100000 00111000 00010000 10000000 00000000 01000000 01000000 11000000 01110011 10110000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 00000000 00111000 10100000 01000000 01001000 00001000 00100000 01000000 10000100 00100000 01000000 00111000 10100000 00100000 10000000 01011000 00100000 01000000 11011000 10010000 00100000 00100000 10111000 00100000 00000000 00111000 10100000 00100000 10000000 01011000 00100000 00100000 00111000 10100000 00100000 01000000 01011000 00100000 00000000 00111000 10100000 01000000 10000000 00001000 00100000 00000000 10000100 00100000 10000000 00111000 10100000 01000000 10000000 11110000 00100000 10000000 10000100 10000000 01001000 00100000 10000000 00111000 01100000 01001000 00100000 01100000 00100100 10000000 00000000 01000000 01000000 11000000 01010110 00100000 00000000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 00000000 00111000 10100000 01000000 10001000 01001000 00100000 01100000 00100100 10000000 00000000 01000000 01000000 11000000 00101010 00100000 00000000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 10000000 00100000 01100000 10111000 00100000 01100000 00111000 00010000 10000000 00000000 01000000 11000000 11000000 01101100 10110000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 00000000 00111000 10100000 00100000 10000000 01011000 10000000 10000000 00100000 01000000 01011000 00100000 00000000 00111000 10100000 01000000 00000000 11001000 00100000 01100000 00100100 00100000 01100000 00111000 01100000 10000000 10000000 01001000 00100000 01100000 00100100 00100000 00000000 00111000 10100000 01000000 10000000 00001000 00100000 00000000 10000100 10000000 00000000 01000000 01000000 11000000 00110111 00100000 00000000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 00000000 01000000 11100000 11000000 01110111 00100000 00000000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 10000000 11011000 10010000 00100000 10100000 10111000 00100000 10100000 00111000 10100000 01000000 10000000 11001000 00100000 01100000 00100100 00100000 01100000 00111000 00010000 10000000 00000000 01000000 00100000 11000000 01101111 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 01000101 00100000 00000000 10111000 00100000 00000000 00111000 10100000 00100000 10010000 00111000 01100000 11110000 00100000 00010000 10000100 00100000 00010000 00111000 10100000 00100000 10000000 01011000 10000000 10000000 00100000 01000000 01011000 10000000 11100000 01000000 00001101 11000000 00000011 01110000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 01010000 00111000 10100000 01000000 10000000 11110000 00100000 01010000 10000100 00100000 01010000 00111000 10100000 01000000 11111111 11001000 00100000 11010000 00100100 00100000 11010000 00111000 00010000 10000000 00000000 01000000 11000000 11000000 10111101 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 10000000 00100000 00110000 10111000 00100000 01100000 00111000 00010000 10000000 00000000 01000000 00100000 11000000 01101111 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 10000000 00100000 01000000 10111000 00100000 00010000 00111000 10100000 01000000 01001000 01001000 00100000 01100000 00100100 11001000 00100000 01100000 00111000 10100000 00100000 01100000 00100100 00100000 01100000 00111000 01100000 01101000 00100000 01100000 10100100 00100000 01100000 00111000 00010000 10000000 00000000 01000000 00100000 11000000 10111011 10110000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 00010000 00111000 10100000 01000000 01001000 00001000 00100000 10000000 10000100 00100000 10000000 00111000 10100000 00100000 10000000 01011000 00100000 01000000 11011000 10010000 00100000 01000000 10111000 00100000 00010000 00111000 10100000 00100000 10000000 01011000 10000000 00000000 00100000 01000000 01011000 00100000 00010000 00111000 10100000 01000000 01001000 00001000 00100000 00010000 10000100 00100000 00010000 00111000 10100000 00100000 10000000 01011000 10000000 10000000 00100000 01000000 01011000 10000000 11100000 01000000 00001101 11000000 00000011 01110000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 01010000 00111000 10100000 01000000 10000000 11110000 00100000 01010000 10000100 00100000 01010000 00111000 10100000 01000000 11111111 11001000 00100000 11010000 00100100 00100000 11010000 00111000 00010000 10000000 00000000 01000000 00100000 11000000 10001110 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 10000000 00100000 00110000 10111000 10000000 01001000 00100000 00010000 00111000 01100000 01001000 00100000 01100000 00100100 00100000 01100000 00111000 10100000 00100000 01000000 00111000 01100000 01101000 00100000 01100000 10100100 00100000 01100000 00111000 00010000 10000000 00000000 01000000 00100000 11000000 10111011 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 11100000 01000000 00001101 11000000 00000011 01110000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 01010000 00111000 10100000 01000000 10000000 11110000 00100000 01010000 10000100 00100000 01010000 00111000 10100000 01000000 11111111 11001000 00100000 11010000 00100100 00100000 11010000 00111000 00010000 10000000 00000000 01000000 00100000 11000000 10001011 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 10000000 00100000 00110000 10111000 00100000 00010000 00111000 10100000 00100000 10000000 01011000 10000000 00000000 00100000 01000000 01011000 00100000 01000000 00111000 01100000 10000000 10000000 01001000 00100000 01100000 00100100 10000000 00000000 01000000 11000000 11000000 10111101 00100000 00000000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 10100000 00111000 10100000 01000000 01000000 11001000 00100000 01100000 00100100 00100000 01100000 00111000 00010000 10000000 00000000 01000000 10100000 11000000 10001000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 10100000 00111000 10100000 01000000 00100000 11001000 00100000 01100000 00100100 00100000 01100000 00111000 00010000 10000000 00000000 01000000 10100000 11000000 00110100 10110000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 10100000 00111000 10100000 01000000 00010000 11001000 00100000 01100000 00100100 00100000 01100000 00111000 00010000 10000000 00000000 01000000 01100000 11000000 00011110 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 10100011 00100000 00000000 10111000 10000000 11101011 00100000 10000000 10111000 10000000 10010111 00100000 01000000 10111000 10000000 00001000 00100000 10010000 00111000 01100000 01001000 00100000 01100000 00100100 00100000 01100000 00111000 00010000 10000000 00000000 01000000 01100000 11000000 01011000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 00000000 00111000 10100000 01000000 10000000 00001000 00100000 11000000 10000100 00100000 11000000 00111000 10100000 00100000 10000000 01011000 00100000 01000000 11011000 10010000 00100000 00100000 10111000 00100000 00000000 00111000 10100000 00100000 10000000 01011000 00100000 00100000 00111000 10100000 00100000 01000000 01011000 00100000 00000000 00111000 10100000 01000000 10000000 00001000 00100000 00000000 10000100 00100000 10000000 00111000 10100000 01000000 10000000 00001000 00100000 11000000 10000100 00100000 11000000 00111000 10100000 00100000 10000000 01011000 00100000 01000000 11011000 10010000 00100000 00100000 10111000 00100000 10000000 00111000 10100000 00100000 10000000 01011000 00100000 00100000 00111000 10100000 00100000 01000000 01011000 00100000 10000000 00111000 10100000 01000000 10000000 00001000 00100000 10000000 10000100 00100000 01000000 00111000 10100000 01000000 10000000 00001000 00100000 11000000 10000100 00100000 11000000 00111000 10100000 00100000 10000000 01011000 00100000 01000000 11011000 10010000 00100000 00100000 10111000 00100000 01000000 00111000 10100000 00100000 10000000 01011000 00100000 00100000 00111000 10100000 00100000 01000000 01011000 00100000 01000000 00111000 10100000 01000000 10000000 00001000 00100000 01000000 10000100 00100000 01000000 00111000 10100000 01000000 00011011 01001000 00100000 01100000 00100100 10000000 00000000 01000000 10100000 11000000 00000110 00100000 00000000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 00001000 00100000 10010000 00111000 01100000 01001000 00100000 01100000 00100100 00100000 01100000 00111000 00010000 10000000 00000000 01000000 01100000 11000000 11001010 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 00101101 00100000 10000000 01011000 10000000 00000000 00100000 01000000 01011000 10000000 01100011 00100000 10000000 01011000 10000000 00000000 00100000 01000000 01011000 10000000 00011011 00100000 10000000 01011000 10000000 00000000 00100000 01000000 01011000 10000000 00001000 00100000 10010000 00111000 01100000 01001000 00100000 01100000 00100100 00100000 01100000 00111000 00010000 10000000 00000000 01000000 01100000 11000000 00011110 10110000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 10010000 00111000 10100000 01000000 10000000 11110000 00100000 10010000 10000100 00100000 10100000 00111000 10100000 01000000 00001000 11001000 00100000 01100000 00100100 00100000 01100000 00111000 00010000 10000000 00000000 01000000 01100000 11000000 11001001 10110000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 10100000 00111000 10100000 01000000 00000100 11001000 00100000 01100000 00100100 00100000 01100000 00111000 00010000 10000000 00000000 01000000 11100000 11000000 11111011 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 00101101 00100000 00000000 10111000 10000000 01100011 00100000 10000000 10111000 10000000 00011011 00100000 01000000 10111000 00100000 10010000 00111000 10100000 01000000 10000000 01001000 00100000 01100000 00100100 00100000 01100000 00111000 00010000 10000000 00000000 01000000 11100000 11000000 10000001 10110000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 00000000 00111000 10100000 01000000 10000000 11110000 00100000 11000000 10000100 00100000 11000000 00111000 10100000 00100000 10000000 01011000 00100000 01000000 11011000 10010000 00100000 00100000 10111000 00100000 00000000 00111000 10100000 00100000 10000000 01011000 00100000 00100000 00111000 10100000 00100000 01000000 01011000 00100000 00000000 00111000 10100000 01000000 10000000 11110000 00100000 00000000 10000100 00100000 10000000 00111000 10100000 01000000 10000000 11110000 00100000 11000000 10000100 00100000 11000000 00111000 10100000 00100000 10000000 01011000 00100000 01000000 11011000 10010000 00100000 00100000 10111000 00100000 10000000 00111000 10100000 00100000 10000000 01011000 00100000 00100000 00111000 10100000 00100000 01000000 01011000 00100000 10000000 00111000 10100000 01000000 10000000 11110000 00100000 10000000 10000100 00100000 01000000 00111000 10100000 01000000 10000000 11110000 00100000 11000000 10000100 00100000 11000000 00111000 10100000 00100000 10000000 01011000 00100000 01000000 11011000 10010000 00100000 00100000 10111000 00100000 01000000 00111000 10100000 00100000 10000000 01011000 00100000 00100000 00111000 10100000 00100000 01000000 01011000 00100000 01000000 00111000 10100000 01000000 10000000 11110000 00100000 01000000 10000100 10000000 10010111 00100000 01000000 00111000 01100000 01001000 00100000 01100000 00100100 10000000 00000000 01000000 01100000 11000000 11100011 00100000 00000000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 10010000 00111000 10100000 01000000 10000000 01001000 00100000 01100000 00100100 00100000 01100000 00111000 00010000 10000000 00000000 01000000 11100000 11000000 01011101 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 10100011 00100000 10000000 01011000 10000000 00000000 00100000 01000000 01011000 10000000 11101011 00100000 10000000 01011000 10000000 00000000 00100000 01000000 01011000 10000000 10010111 00100000 10000000 01011000 10000000 00000000 00100000 01000000 01011000 00100000 10010000 00111000 10100000 01000000 10000000 01001000 00100000 01100000 00100100 00100000 01100000 00111000 00010000 10000000 00000000 01000000 11100000 11000000 11111011 10110000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 10010000 00111000 10100000 01000000 10000000 00001000 00100000 10010000 10000100 10000000 00000000 01000000 11100000 11000000 01110111 00100000 00000000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 11100000 00111000 10100000 01000000 00000000 11001000 00100000 01100000 00100100 00100000 01100000 00111000 00010000 10000000 00000000 01000000 00010000 11000000 00011000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 00000000 01000000 00000000 11000000 01111000 00100000 00000000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 11100000 00111000 10100000 01000000 10000000 11001000 00100000 01100000 00100100 00100000 01100000 00111000 00010000 10000000 00000000 01000000 00010000 11000000 01000010 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 00000000 01000000 00000000 11000000 01001100 00100000 00000000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 11100000 00111000 10100000 01000000 01000000 11001000 00100000 01100000 00100100 00100000 01100000 00111000 00010000 10000000 00000000 01000000 00010000 11000000 00110110 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 00000000 01000000 00000000 11000000 10101010 00100000 00000000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 00100000 11100000 00111000 10100000 01000000 11000000 11001000 00100000 01100000 00100100 00100000 01100000 00111000 00010000 10000000 00000000 01000000 00010000 11000000 01101001 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 00000000 01000000 00000000 11000000 11111110 00100000 00000000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 00000000 01000000 00010000 11000000 01101001 00100000 00000000 10110000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000"),
    .ADDR_WIDTH_A(12),
    .ADDR_WIDTH_B(12),
    .BYTE_A(1),
    .BYTE_B(1),
    .BYTE_ENABLE(0),
    .DATA_DEPTH_A(4096),
    .DATA_DEPTH_B(4096),
    .DATA_WIDTH_A(8),
    .DATA_WIDTH_B(8),
    .DEBUGGABLE("NO"),
    .FILL_ALL("NONE"),
    .IMPLEMENT("9K"),
    .MODE("DP"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("READBEFOREWRITE"))
    \u_rom/ram_rom_reg0  (
    .addra(rom_raddr[11:0]),
    .addrb(rom_waddr[11:0]),
    .cea(rom_ren),
    .ceb(1'b1),
    .clka(vga_clk),
    .clkb(vga_clk),
    .dia(8'b00000000),
    .dib(rom_wdata),
    .ocea(1'b1),
    .oceb(1'b1),
    .rsta(1'b0),
    .rstb(1'b0),
    .wea(1'b0),
    .web(\u_rom/n4 ),
    .doa(rom_rdata));  // sources/rtl/mcu/rom.v(40)
  or \u_rom/u10  (\u_rom/n13 , rom_waddr[18], \u_rom/n12 );  // sources/rtl/mcu/rom.v(52)
  or \u_rom/u11  (\u_rom/n14 , rom_waddr[22], rom_waddr[23]);  // sources/rtl/mcu/rom.v(52)
  or \u_rom/u12  (\u_rom/n15 , rom_waddr[21], \u_rom/n14 );  // sources/rtl/mcu/rom.v(52)
  or \u_rom/u13  (\u_rom/n5 , \u_rom/n13 , \u_rom/n15 );  // sources/rtl/mcu/rom.v(52)
  or \u_rom/u14  (\u_rom/n8 , \u_rom/n11 , \u_rom/n5 );  // sources/rtl/mcu/rom.v(52)
  not \u_rom/u15  (\u_rom/n2 , \u_rom/n8 );  // sources/rtl/mcu/rom.v(52)
  or \u_rom/u2  (\u_rom/n0 , rom_waddr[12], \u_rom/n1 );  // sources/rtl/mcu/rom.v(52)
  or \u_rom/u3  (\u_rom/n1 , rom_waddr[13], rom_waddr[14]);  // sources/rtl/mcu/rom.v(52)
  and \u_rom/u4  (\u_rom/n4 , \u_rom/n2 , rom_wen);  // sources/rtl/mcu/rom.v(52)
  or \u_rom/u6  (\u_rom/n9 , rom_waddr[16], rom_waddr[17]);  // sources/rtl/mcu/rom.v(52)
  or \u_rom/u7  (\u_rom/n10 , rom_waddr[15], \u_rom/n9 );  // sources/rtl/mcu/rom.v(52)
  or \u_rom/u8  (\u_rom/n11 , \u_rom/n0 , \u_rom/n10 );  // sources/rtl/mcu/rom.v(52)
  or \u_rom/u9  (\u_rom/n12 , rom_waddr[19], rom_waddr[20]);  // sources/rtl/mcu/rom.v(52)
  add_pu32_pu32_o32 \u_uart/u_uart_rx/add0  (
    .i0(\u_uart/u_uart_rx/clk_cnt ),
    .i1(32'b00000000000000000000000000000001),
    .o(\u_uart/u_uart_rx/n7 ));  // sources/rtl/uart/uart_rx.v(73)
  add_pu4_pu4_o4 \u_uart/u_uart_rx/add1  (
    .i0(\u_uart/u_uart_rx/cnt ),
    .i1(4'b0001),
    .o(\u_uart/u_uart_rx/n13 ));  // sources/rtl/uart/uart_rx.v(88)
  reg_ar_as_w1 \u_uart/u_uart_rx/clk_en_reg  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n5 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_en ));  // sources/rtl/uart/uart_rx.v(80)
  eq_w2 \u_uart/u_uart_rx/eq0  (
    .i0(\u_uart/u_uart_rx/rx_d ),
    .i1(2'b10),
    .o(\u_uart/u_uart_rx/n0 ));  // sources/rtl/uart/uart_rx.v(59)
  eq_w4 \u_uart/u_uart_rx/eq1  (
    .i0(\u_uart/u_uart_rx/cnt ),
    .i1(4'b1001),
    .o(\u_uart/u_uart_rx/n1 ));  // sources/rtl/uart/uart_rx.v(61)
  eq_w4 \u_uart/u_uart_rx/eq10  (
    .i0(\u_uart/u_uart_rx/cnt ),
    .i1(4'b1000),
    .o(\u_uart/u_uart_rx/n23 ));  // sources/rtl/uart/uart_rx.v(103)
  eq_w32 \u_uart/u_uart_rx/eq2  (
    .i0(\u_uart/u_uart_rx/clk_cnt ),
    .i1(32'b00000000000000000000000000011010),
    .o(\u_uart/u_uart_rx/n5 ));  // sources/rtl/uart/uart_rx.v(70)
  eq_w4 \u_uart/u_uart_rx/eq3  (
    .i0(\u_uart/u_uart_rx/cnt ),
    .i1(4'b0001),
    .o(\u_uart/u_uart_rx/n16 ));  // sources/rtl/uart/uart_rx.v(96)
  eq_w4 \u_uart/u_uart_rx/eq4  (
    .i0(\u_uart/u_uart_rx/cnt ),
    .i1(4'b0010),
    .o(\u_uart/u_uart_rx/n17 ));  // sources/rtl/uart/uart_rx.v(97)
  eq_w4 \u_uart/u_uart_rx/eq5  (
    .i0(\u_uart/u_uart_rx/cnt ),
    .i1(4'b0011),
    .o(\u_uart/u_uart_rx/n18 ));  // sources/rtl/uart/uart_rx.v(98)
  eq_w4 \u_uart/u_uart_rx/eq6  (
    .i0(\u_uart/u_uart_rx/cnt ),
    .i1(4'b0100),
    .o(\u_uart/u_uart_rx/n19 ));  // sources/rtl/uart/uart_rx.v(99)
  eq_w4 \u_uart/u_uart_rx/eq7  (
    .i0(\u_uart/u_uart_rx/cnt ),
    .i1(4'b0101),
    .o(\u_uart/u_uart_rx/n20 ));  // sources/rtl/uart/uart_rx.v(100)
  eq_w4 \u_uart/u_uart_rx/eq8  (
    .i0(\u_uart/u_uart_rx/cnt ),
    .i1(4'b0110),
    .o(\u_uart/u_uart_rx/n21 ));  // sources/rtl/uart/uart_rx.v(101)
  eq_w4 \u_uart/u_uart_rx/eq9  (
    .i0(\u_uart/u_uart_rx/cnt ),
    .i1(4'b0111),
    .o(\u_uart/u_uart_rx/n22 ));  // sources/rtl/uart/uart_rx.v(102)
  binary_mux_s1_w1 \u_uart/u_uart_rx/mux0_b0  (
    .i0(\u_uart/u_uart_rx/n7 [0]),
    .i1(1'b0),
    .sel(\u_uart/u_uart_rx/n5 ),
    .o(\u_uart/u_uart_rx/n8 [0]));  // sources/rtl/uart/uart_rx.v(73)
  binary_mux_s1_w1 \u_uart/u_uart_rx/mux0_b2  (
    .i0(\u_uart/u_uart_rx/n7 [2]),
    .i1(1'b0),
    .sel(\u_uart/u_uart_rx/n5 ),
    .o(\u_uart/u_uart_rx/n8 [2]));  // sources/rtl/uart/uart_rx.v(73)
  binary_mux_s1_w1 \u_uart/u_uart_rx/mux0_b3  (
    .i0(\u_uart/u_uart_rx/n7 [3]),
    .i1(1'b0),
    .sel(\u_uart/u_uart_rx/n5 ),
    .o(\u_uart/u_uart_rx/n8 [3]));  // sources/rtl/uart/uart_rx.v(73)
  and \u_uart/u_uart_rx/mux1_b10_sel_is_1  (\u_uart/u_uart_rx/mux1_b10_sel_is_1_o , \u_uart/u_uart_rx/start , \u_uart/u_uart_rx/n5_neg );
  and \u_uart/u_uart_rx/mux4_b0_sel_is_3  (\u_uart/u_uart_rx/mux4_b0_sel_is_3_o , \u_uart/u_uart_rx/clk_en , \u_uart/u_uart_rx/n16 );
  and \u_uart/u_uart_rx/mux4_b1_sel_is_3  (\u_uart/u_uart_rx/mux4_b1_sel_is_3_o , \u_uart/u_uart_rx/clk_en , \u_uart/u_uart_rx/n17 );
  and \u_uart/u_uart_rx/mux4_b2_sel_is_3  (\u_uart/u_uart_rx/mux4_b2_sel_is_3_o , \u_uart/u_uart_rx/clk_en , \u_uart/u_uart_rx/n18 );
  and \u_uart/u_uart_rx/mux4_b3_sel_is_3  (\u_uart/u_uart_rx/mux4_b3_sel_is_3_o , \u_uart/u_uart_rx/clk_en , \u_uart/u_uart_rx/n19 );
  and \u_uart/u_uart_rx/mux4_b4_sel_is_3  (\u_uart/u_uart_rx/mux4_b4_sel_is_3_o , \u_uart/u_uart_rx/clk_en , \u_uart/u_uart_rx/n20 );
  and \u_uart/u_uart_rx/mux4_b5_sel_is_3  (\u_uart/u_uart_rx/mux4_b5_sel_is_3_o , \u_uart/u_uart_rx/clk_en , \u_uart/u_uart_rx/n21 );
  and \u_uart/u_uart_rx/mux4_b6_sel_is_3  (\u_uart/u_uart_rx/mux4_b6_sel_is_3_o , \u_uart/u_uart_rx/clk_en , \u_uart/u_uart_rx/n22 );
  and \u_uart/u_uart_rx/mux4_b7_sel_is_3  (\u_uart/u_uart_rx/mux4_b7_sel_is_3_o , \u_uart/u_uart_rx/clk_en , \u_uart/u_uart_rx/n23 );
  not \u_uart/u_uart_rx/n5_inv  (\u_uart/u_uart_rx/n5_neg , \u_uart/u_uart_rx/n5 );
  reg_ar_ss_w1 \u_uart/u_uart_rx/reg0_b0  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n8 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(~\u_uart/u_uart_rx/start ),
    .q(\u_uart/u_uart_rx/clk_cnt [0]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b1  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [1]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [1]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b10  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [10]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [10]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b11  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [11]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [11]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b12  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [12]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [12]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b13  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [13]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [13]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b14  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [14]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [14]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b15  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [15]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [15]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b16  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [16]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [16]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b17  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [17]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [17]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b18  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [18]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [18]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b19  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [19]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [19]));  // sources/rtl/uart/uart_rx.v(74)
  reg_ar_ss_w1 \u_uart/u_uart_rx/reg0_b2  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n8 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(~\u_uart/u_uart_rx/start ),
    .q(\u_uart/u_uart_rx/clk_cnt [2]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b20  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [20]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [20]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b21  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [21]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [21]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b22  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [22]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [22]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b23  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [23]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [23]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b24  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [24]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [24]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b25  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [25]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [25]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b26  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [26]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [26]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b27  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [27]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [27]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b28  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [28]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [28]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b29  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [29]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [29]));  // sources/rtl/uart/uart_rx.v(74)
  reg_ar_ss_w1 \u_uart/u_uart_rx/reg0_b3  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n8 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(~\u_uart/u_uart_rx/start ),
    .q(\u_uart/u_uart_rx/clk_cnt [3]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b30  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [30]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [30]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b31  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [31]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [31]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b4  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [4]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [4]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b5  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [5]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [5]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b6  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [6]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [6]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b7  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [7]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [7]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b8  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [8]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [8]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b9  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n7 [9]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [9]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg1_b0  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n13 [0]),
    .en(\u_uart/u_uart_rx/clk_en ),
    .reset(~\u_uart/u_uart_rx/start ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/cnt [0]));  // sources/rtl/uart/uart_rx.v(89)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg1_b1  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n13 [1]),
    .en(\u_uart/u_uart_rx/clk_en ),
    .reset(~\u_uart/u_uart_rx/start ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/cnt [1]));  // sources/rtl/uart/uart_rx.v(89)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg1_b2  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n13 [2]),
    .en(\u_uart/u_uart_rx/clk_en ),
    .reset(~\u_uart/u_uart_rx/start ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/cnt [2]));  // sources/rtl/uart/uart_rx.v(89)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg1_b3  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n13 [3]),
    .en(\u_uart/u_uart_rx/clk_en ),
    .reset(~\u_uart/u_uart_rx/start ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/cnt [3]));  // sources/rtl/uart/uart_rx.v(89)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg2_b0  (
    .clk(vga_clk),
    .d(rx),
    .en(\u_uart/u_uart_rx/mux4_b0_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/data [0]));  // sources/rtl/uart/uart_rx.v(105)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg2_b1  (
    .clk(vga_clk),
    .d(rx),
    .en(\u_uart/u_uart_rx/mux4_b1_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/data [1]));  // sources/rtl/uart/uart_rx.v(105)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg2_b2  (
    .clk(vga_clk),
    .d(rx),
    .en(\u_uart/u_uart_rx/mux4_b2_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/data [2]));  // sources/rtl/uart/uart_rx.v(105)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg2_b3  (
    .clk(vga_clk),
    .d(rx),
    .en(\u_uart/u_uart_rx/mux4_b3_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/data [3]));  // sources/rtl/uart/uart_rx.v(105)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg2_b4  (
    .clk(vga_clk),
    .d(rx),
    .en(\u_uart/u_uart_rx/mux4_b4_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/data [4]));  // sources/rtl/uart/uart_rx.v(105)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg2_b5  (
    .clk(vga_clk),
    .d(rx),
    .en(\u_uart/u_uart_rx/mux4_b5_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/data [5]));  // sources/rtl/uart/uart_rx.v(105)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg2_b6  (
    .clk(vga_clk),
    .d(rx),
    .en(\u_uart/u_uart_rx/mux4_b6_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/data [6]));  // sources/rtl/uart/uart_rx.v(105)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg2_b7  (
    .clk(vga_clk),
    .d(rx),
    .en(\u_uart/u_uart_rx/mux4_b7_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/data [7]));  // sources/rtl/uart/uart_rx.v(105)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg3_b0  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/data [0]),
    .en(\u_uart/u_uart_rx/n1 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/rx_data [0]));  // sources/rtl/uart/uart_rx.v(118)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg3_b1  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/data [1]),
    .en(\u_uart/u_uart_rx/n1 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/rx_data [1]));  // sources/rtl/uart/uart_rx.v(118)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg3_b2  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/data [2]),
    .en(\u_uart/u_uart_rx/n1 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/rx_data [2]));  // sources/rtl/uart/uart_rx.v(118)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg3_b3  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/data [3]),
    .en(\u_uart/u_uart_rx/n1 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/rx_data [3]));  // sources/rtl/uart/uart_rx.v(118)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg3_b4  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/data [4]),
    .en(\u_uart/u_uart_rx/n1 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/rx_data [4]));  // sources/rtl/uart/uart_rx.v(118)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg3_b5  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/data [5]),
    .en(\u_uart/u_uart_rx/n1 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/rx_data [5]));  // sources/rtl/uart/uart_rx.v(118)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg3_b6  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/data [6]),
    .en(\u_uart/u_uart_rx/n1 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/rx_data [6]));  // sources/rtl/uart/uart_rx.v(118)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg3_b7  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/data [7]),
    .en(\u_uart/u_uart_rx/n1 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/rx_data [7]));  // sources/rtl/uart/uart_rx.v(118)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg4_b0  (
    .clk(vga_clk),
    .d(rx),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/rx_d [0]));  // sources/rtl/uart/uart_rx.v(54)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg4_b1  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/rx_d [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/rx_d [1]));  // sources/rtl/uart/uart_rx.v(54)
  reg_ar_as_w1 \u_uart/u_uart_rx/rx_en_reg  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_rx/n28 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/rx_en ));  // sources/rtl/uart/uart_rx.v(111)
  reg_ar_ss_w1 \u_uart/u_uart_rx/start_reg  (
    .clk(vga_clk),
    .d(1'b0),
    .en(\u_uart/u_uart_rx/n1 ),
    .reset(1'b0),
    .set(\u_uart/u_uart_rx/n0 ),
    .q(\u_uart/u_uart_rx/start ));  // sources/rtl/uart/uart_rx.v(63)
  and \u_uart/u_uart_rx/u10  (\u_uart/u_uart_rx/n28 , \u_uart/u_uart_rx/start , \u_uart/u_uart_rx/n1 );  // sources/rtl/uart/uart_rx.v(110)
  add_pu32_pu32_o32 \u_uart/u_uart_tx/add0  (
    .i0(\u_uart/u_uart_tx/clk_cnt ),
    .i1(32'b00000000000000000000000000000001),
    .o(\u_uart/u_uart_tx/n1 ));  // sources/rtl/uart/uart_tx.v(58)
  add_pu4_pu4_o4 \u_uart/u_uart_tx/add1  (
    .i0(\u_uart/u_uart_tx/cnt ),
    .i1(4'b0001),
    .o(\u_uart/u_uart_tx/n10 ));  // sources/rtl/uart/uart_tx.v(89)
  reg_ar_as_w1 \u_uart/u_uart_tx/clk_en_reg  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n0 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_en ));  // sources/rtl/uart/uart_tx.v(65)
  eq_w32 \u_uart/u_uart_tx/eq0  (
    .i0(\u_uart/u_uart_tx/clk_cnt ),
    .i1(32'b00000000000000000000000000011010),
    .o(\u_uart/u_uart_tx/n0 ));  // sources/rtl/uart/uart_tx.v(55)
  eq_w4 \u_uart/u_uart_tx/eq1  (
    .i0(\u_uart/u_uart_tx/cnt ),
    .i1(4'b1010),
    .o(\u_uart/u_uart_tx/n4 ));  // sources/rtl/uart/uart_tx.v(72)
  and \u_uart/u_uart_tx/mux1_b0_sel_is_1  (\u_uart/u_uart_tx/mux1_b0_sel_is_1_o , \u_uart/u_uart_tx/start , \u_uart/u_uart_tx/n0_neg );
  binary_mux_s4_w1 \u_uart/u_uart_tx/mux5  (
    .i0(1'b1),
    .i1(1'b0),
    .i10(1'b1),
    .i11(tx),
    .i12(tx),
    .i13(tx),
    .i14(tx),
    .i15(tx),
    .i2(\u_uart/u_uart_tx/data [0]),
    .i3(\u_uart/u_uart_tx/data [1]),
    .i4(\u_uart/u_uart_tx/data [2]),
    .i5(\u_uart/u_uart_tx/data [3]),
    .i6(\u_uart/u_uart_tx/data [4]),
    .i7(\u_uart/u_uart_tx/data [5]),
    .i8(\u_uart/u_uart_tx/data [6]),
    .i9(\u_uart/u_uart_tx/data [7]),
    .sel(\u_uart/u_uart_tx/cnt ),
    .o(\u_uart/u_uart_tx/n13 ));  // sources/rtl/uart/uart_tx.v(107)
  not \u_uart/u_uart_tx/n0_inv  (\u_uart/u_uart_tx/n0_neg , \u_uart/u_uart_tx/n0 );
  reg_ar_as_w1 \u_uart/u_uart_tx/reg0_b0  (
    .clk(vga_clk),
    .d(\u_uart/tx_data [0]),
    .en(\u_uart/u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/data [0]));  // sources/rtl/uart/uart_tx.v(81)
  reg_ar_as_w1 \u_uart/u_uart_tx/reg0_b1  (
    .clk(vga_clk),
    .d(\u_uart/tx_data [1]),
    .en(\u_uart/u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/data [1]));  // sources/rtl/uart/uart_tx.v(81)
  reg_ar_as_w1 \u_uart/u_uart_tx/reg0_b2  (
    .clk(vga_clk),
    .d(\u_uart/tx_data [2]),
    .en(\u_uart/u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/data [2]));  // sources/rtl/uart/uart_tx.v(81)
  reg_ar_as_w1 \u_uart/u_uart_tx/reg0_b3  (
    .clk(vga_clk),
    .d(\u_uart/tx_data [3]),
    .en(\u_uart/u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/data [3]));  // sources/rtl/uart/uart_tx.v(81)
  reg_ar_as_w1 \u_uart/u_uart_tx/reg0_b4  (
    .clk(vga_clk),
    .d(\u_uart/tx_data [4]),
    .en(\u_uart/u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/data [4]));  // sources/rtl/uart/uart_tx.v(81)
  reg_ar_as_w1 \u_uart/u_uart_tx/reg0_b5  (
    .clk(vga_clk),
    .d(\u_uart/tx_data [5]),
    .en(\u_uart/u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/data [5]));  // sources/rtl/uart/uart_tx.v(81)
  reg_ar_as_w1 \u_uart/u_uart_tx/reg0_b6  (
    .clk(vga_clk),
    .d(\u_uart/tx_data [6]),
    .en(\u_uart/u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/data [6]));  // sources/rtl/uart/uart_tx.v(81)
  reg_ar_as_w1 \u_uart/u_uart_tx/reg0_b7  (
    .clk(vga_clk),
    .d(\u_uart/tx_data [7]),
    .en(\u_uart/u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/data [7]));  // sources/rtl/uart/uart_tx.v(81)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg1_b0  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n10 [0]),
    .en(\u_uart/u_uart_tx/clk_en ),
    .reset(~\u_uart/u_uart_tx/start ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/cnt [0]));  // sources/rtl/uart/uart_tx.v(90)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg1_b1  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n10 [1]),
    .en(\u_uart/u_uart_tx/clk_en ),
    .reset(~\u_uart/u_uart_tx/start ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/cnt [1]));  // sources/rtl/uart/uart_tx.v(90)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg1_b2  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n10 [2]),
    .en(\u_uart/u_uart_tx/clk_en ),
    .reset(~\u_uart/u_uart_tx/start ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/cnt [2]));  // sources/rtl/uart/uart_tx.v(90)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg1_b3  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n10 [3]),
    .en(\u_uart/u_uart_tx/clk_en ),
    .reset(~\u_uart/u_uart_tx/start ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/cnt [3]));  // sources/rtl/uart/uart_tx.v(90)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b0  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [0]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [0]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b1  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [1]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [1]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b10  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [10]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [10]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b11  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [11]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [11]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b12  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [12]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [12]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b13  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [13]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [13]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b14  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [14]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [14]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b15  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [15]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [15]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b16  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [16]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [16]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b17  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [17]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [17]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b18  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [18]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [18]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b19  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [19]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [19]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b2  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [2]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [2]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b20  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [20]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [20]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b21  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [21]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [21]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b22  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [22]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [22]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b23  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [23]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [23]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b24  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [24]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [24]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b25  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [25]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [25]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b26  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [26]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [26]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b27  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [27]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [27]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b28  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [28]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [28]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b29  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [29]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [29]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b3  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [3]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [3]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b30  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [30]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [30]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b31  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [31]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [31]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b4  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [4]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [4]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b5  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [5]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [5]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b6  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [6]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [6]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b7  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [7]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [7]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b8  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [8]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [8]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b9  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n1 [9]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [9]));  // sources/rtl/uart/uart_tx.v(59)
  reg_ar_ss_w1 \u_uart/u_uart_tx/start_reg  (
    .clk(vga_clk),
    .d(1'b0),
    .en(\u_uart/u_uart_tx/n4 ),
    .reset(1'b0),
    .set(\u_uart/tx_en ),
    .q(\u_uart/u_uart_tx/start ));  // sources/rtl/uart/uart_tx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_tx/tx_ready_reg  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n7 ),
    .en(1'b1),
    .reset(\u_uart/tx_en ),
    .set(1'b0),
    .q(\u_uart/tx_ready ));  // sources/rtl/uart/uart_tx.v(117)
  reg_ar_as_w1 \u_uart/u_uart_tx/tx_reg  (
    .clk(vga_clk),
    .d(\u_uart/u_uart_tx/n13 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(tx));  // sources/rtl/uart/uart_tx.v(108)
  not \u_uart/u_uart_tx/u4  (\u_uart/u_uart_tx/n7 , \u_uart/u_uart_tx/start );  // sources/rtl/uart/uart_tx.v(79)
  and \u_uart/u_uart_tx/u5  (\u_uart/u_uart_tx/n8 , \u_uart/tx_en , \u_uart/u_uart_tx/n7 );  // sources/rtl/uart/uart_tx.v(79)
  add_pu3_pu3_o3 \u_uart/u_ubus/add0  (
    .i0(\u_uart/u_ubus/tx_ready_cnt ),
    .i1(3'b001),
    .o(\u_uart/u_ubus/n39 ));  // sources/rtl/uart/ubus.v(167)
  add_pu4_pu4_o4 \u_uart/u_ubus/add1  (
    .i0(\u_uart/u_ubus/send_cnt ),
    .i1(4'b0001),
    .o(\u_uart/u_ubus/n45 ));  // sources/rtl/uart/ubus.v(191)
  eq_w8 \u_uart/u_ubus/eq0  (
    .i0(\u_uart/u_ubus/shift_reg2 ),
    .i1(8'b01000110),
    .o(\u_uart/u_ubus/n10 ));  // sources/rtl/uart/ubus.v(112)
  eq_w8 \u_uart/u_ubus/eq1  (
    .i0(\u_uart/u_ubus/shift_reg3 ),
    .i1(8'b01000101),
    .o(\u_uart/u_ubus/n12 ));  // sources/rtl/uart/ubus.v(113)
  eq_w8 \u_uart/u_ubus/eq2  (
    .i0(\u_uart/u_ubus/shift_reg4 ),
    .i1(8'b01000100),
    .o(\u_uart/u_ubus/n14 ));  // sources/rtl/uart/ubus.v(114)
  eq_w8 \u_uart/u_ubus/eq3  (
    .i0(\u_uart/u_ubus/shift_reg5 ),
    .i1(8'b01000011),
    .o(\u_uart/u_ubus/n16 ));  // sources/rtl/uart/ubus.v(115)
  eq_w8 \u_uart/u_ubus/eq4  (
    .i0(\u_uart/u_ubus/shift_reg6 ),
    .i1(8'b01000010),
    .o(\u_uart/u_ubus/n18 ));  // sources/rtl/uart/ubus.v(116)
  eq_w8 \u_uart/u_ubus/eq5  (
    .i0(\u_uart/u_ubus/shift_reg7 ),
    .i1(8'b01000001),
    .o(\u_uart/u_ubus/n20 ));  // sources/rtl/uart/ubus.v(117)
  eq_w4 \u_uart/u_ubus/eq6  (
    .i0(\u_uart/u_ubus/send_cnt ),
    .i1(4'b1000),
    .o(\u_uart/u_ubus/n34 ));  // sources/rtl/uart/ubus.v(159)
  reg_ar_as_w1 \u_uart/u_ubus/frame_head_flag0_reg  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/n11 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/frame_head_flag0 ));  // sources/rtl/uart/ubus.v(118)
  reg_ar_as_w1 \u_uart/u_ubus/frame_head_flag1_reg  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/n13 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/frame_head_flag1 ));  // sources/rtl/uart/ubus.v(118)
  reg_ar_as_w1 \u_uart/u_ubus/frame_head_flag2_reg  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/n15 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/frame_head_flag2 ));  // sources/rtl/uart/ubus.v(118)
  reg_ar_as_w1 \u_uart/u_ubus/frame_head_flag3_reg  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/n17 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/frame_head_flag3 ));  // sources/rtl/uart/ubus.v(118)
  reg_ar_as_w1 \u_uart/u_ubus/frame_head_flag4_reg  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/n19 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/frame_head_flag4 ));  // sources/rtl/uart/ubus.v(118)
  reg_ar_as_w1 \u_uart/u_ubus/frame_head_flag5_reg  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/n21 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/frame_head_flag5 ));  // sources/rtl/uart/ubus.v(118)
  reg_ar_as_w1 \u_uart/u_ubus/frame_head_flag_reg  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/n26 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/frame_head_flag ));  // sources/rtl/uart/ubus.v(124)
  reg_ar_as_w1 \u_uart/u_ubus/recv_en_reg  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/frame_head_flag ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_en));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg0_b0  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg0 [0]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg1 [0]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg0_b1  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg0 [1]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg1 [1]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg0_b2  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg0 [2]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg1 [2]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg0_b3  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg0 [3]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg1 [3]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg0_b4  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg0 [4]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg1 [4]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg0_b5  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg0 [5]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg1 [5]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg0_b6  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg0 [6]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg1 [6]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg0_b7  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg0 [7]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg1 [7]));  // sources/rtl/uart/ubus.v(101)
  reg_sr_as_w1 \u_uart/u_ubus/reg10_b0  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/n39 [0]),
    .en(1'b1),
    .reset(~\u_uart/tx_ready ),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_ready_cnt [0]));  // sources/rtl/uart/ubus.v(170)
  reg_sr_as_w1 \u_uart/u_ubus/reg10_b1  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/n39 [1]),
    .en(1'b1),
    .reset(~\u_uart/tx_ready ),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_ready_cnt [1]));  // sources/rtl/uart/ubus.v(170)
  reg_sr_as_w1 \u_uart/u_ubus/reg10_b2  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/n39 [2]),
    .en(1'b1),
    .reset(~\u_uart/tx_ready ),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_ready_cnt [2]));  // sources/rtl/uart/ubus.v(170)
  reg_sr_as_w1 \u_uart/u_ubus/reg11_b0  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/n45 [0]),
    .en(\u_uart/u_ubus/n42 ),
    .reset(\u_uart/u_ubus/send_finish ),
    .set(1'b0),
    .q(\u_uart/u_ubus/send_cnt [0]));  // sources/rtl/uart/ubus.v(192)
  reg_sr_as_w1 \u_uart/u_ubus/reg11_b1  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/n45 [1]),
    .en(\u_uart/u_ubus/n42 ),
    .reset(\u_uart/u_ubus/send_finish ),
    .set(1'b0),
    .q(\u_uart/u_ubus/send_cnt [1]));  // sources/rtl/uart/ubus.v(192)
  reg_sr_as_w1 \u_uart/u_ubus/reg11_b2  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/n45 [2]),
    .en(\u_uart/u_ubus/n42 ),
    .reset(\u_uart/u_ubus/send_finish ),
    .set(1'b0),
    .q(\u_uart/u_ubus/send_cnt [2]));  // sources/rtl/uart/ubus.v(192)
  reg_sr_as_w1 \u_uart/u_ubus/reg11_b3  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/n45 [3]),
    .en(\u_uart/u_ubus/n42 ),
    .reset(\u_uart/u_ubus/send_finish ),
    .set(1'b0),
    .q(\u_uart/u_ubus/send_cnt [3]));  // sources/rtl/uart/ubus.v(192)
  reg_ar_as_w1 \u_uart/u_ubus/reg12_b0  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/n57 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/tx_data [0]));  // sources/rtl/uart/ubus.v(207)
  reg_ar_as_w1 \u_uart/u_ubus/reg12_b1  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/n57 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/tx_data [1]));  // sources/rtl/uart/ubus.v(207)
  reg_ar_as_w1 \u_uart/u_ubus/reg12_b2  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/n57 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/tx_data [2]));  // sources/rtl/uart/ubus.v(207)
  reg_ar_as_w1 \u_uart/u_ubus/reg12_b3  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/n57 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/tx_data [3]));  // sources/rtl/uart/ubus.v(207)
  reg_ar_as_w1 \u_uart/u_ubus/reg12_b4  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/n57 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/tx_data [4]));  // sources/rtl/uart/ubus.v(207)
  reg_ar_as_w1 \u_uart/u_ubus/reg12_b5  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/n57 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/tx_data [5]));  // sources/rtl/uart/ubus.v(207)
  reg_ar_as_w1 \u_uart/u_ubus/reg12_b6  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/n57 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/tx_data [6]));  // sources/rtl/uart/ubus.v(207)
  reg_ar_as_w1 \u_uart/u_ubus/reg12_b7  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/n57 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/tx_data [7]));  // sources/rtl/uart/ubus.v(207)
  reg_ar_as_w1 \u_uart/u_ubus/reg13_b0  (
    .clk(vga_clk),
    .d(\u_uart/rx_data [0]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg0 [0]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg13_b1  (
    .clk(vga_clk),
    .d(\u_uart/rx_data [1]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg0 [1]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg13_b2  (
    .clk(vga_clk),
    .d(\u_uart/rx_data [2]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg0 [2]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg13_b3  (
    .clk(vga_clk),
    .d(\u_uart/rx_data [3]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg0 [3]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg13_b4  (
    .clk(vga_clk),
    .d(\u_uart/rx_data [4]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg0 [4]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg13_b5  (
    .clk(vga_clk),
    .d(\u_uart/rx_data [5]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg0 [5]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg13_b6  (
    .clk(vga_clk),
    .d(\u_uart/rx_data [6]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg0 [6]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg13_b7  (
    .clk(vga_clk),
    .d(\u_uart/rx_data [7]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg0 [7]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg1_b0  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg1 [0]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg2 [0]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg1_b1  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg1 [1]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg2 [1]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg1_b2  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg1 [2]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg2 [2]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg1_b3  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg1 [3]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg2 [3]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg1_b4  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg1 [4]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg2 [4]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg1_b5  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg1 [5]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg2 [5]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg1_b6  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg1 [6]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg2 [6]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg1_b7  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg1 [7]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg2 [7]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg2_b0  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg2 [0]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg3 [0]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg2_b1  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg2 [1]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg3 [1]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg2_b2  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg2 [2]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg3 [2]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg2_b3  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg2 [3]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg3 [3]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg2_b4  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg2 [4]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg3 [4]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg2_b5  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg2 [5]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg3 [5]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg2_b6  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg2 [6]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg3 [6]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg2_b7  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg2 [7]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg3 [7]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg3_b0  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg3 [0]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg4 [0]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg3_b1  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg3 [1]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg4 [1]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg3_b2  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg3 [2]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg4 [2]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg3_b3  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg3 [3]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg4 [3]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg3_b4  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg3 [4]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg4 [4]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg3_b5  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg3 [5]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg4 [5]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg3_b6  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg3 [6]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg4 [6]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg3_b7  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg3 [7]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg4 [7]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg4_b0  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg4 [0]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg5 [0]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg4_b1  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg4 [1]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg5 [1]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg4_b2  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg4 [2]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg5 [2]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg4_b3  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg4 [3]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg5 [3]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg4_b4  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg4 [4]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg5 [4]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg4_b5  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg4 [5]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg5 [5]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg4_b6  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg4 [6]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg5 [6]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg4_b7  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg4 [7]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg5 [7]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg5_b0  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg5 [0]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg6 [0]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg5_b1  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg5 [1]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg6 [1]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg5_b2  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg5 [2]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg6 [2]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg5_b3  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg5 [3]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg6 [3]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg5_b4  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg5 [4]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg6 [4]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg5_b5  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg5 [5]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg6 [5]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg5_b6  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg5 [6]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg6 [6]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg5_b7  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg5 [7]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg6 [7]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg6_b0  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg6 [0]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg7 [0]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg6_b1  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg6 [1]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg7 [1]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg6_b2  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg6 [2]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg7 [2]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg6_b3  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg6 [3]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg7 [3]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg6_b4  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg6 [4]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg7 [4]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg6_b5  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg6 [5]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg7 [5]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg6_b6  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg6 [6]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg7 [6]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg6_b7  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg6 [7]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg7 [7]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg7_b0  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg1 [0]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_cmd[0]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg7_b1  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg1 [1]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_cmd[1]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg7_b2  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg1 [2]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_cmd[2]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg7_b3  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg1 [3]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_cmd[3]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg7_b4  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg1 [4]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_cmd[4]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg7_b5  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg1 [5]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_cmd[5]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg7_b6  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg1 [6]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_cmd[6]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg7_b7  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg1 [7]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_cmd[7]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg8_b0  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg0 [0]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_data[0]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg8_b1  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg0 [1]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_data[1]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg8_b2  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg0 [2]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_data[2]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg8_b3  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg0 [3]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_data[3]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg8_b4  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg0 [4]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_data[4]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg8_b5  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg0 [5]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_data[5]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg8_b6  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg0 [6]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_data[6]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg8_b7  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/shift_reg0 [7]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_data[7]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b0  (
    .clk(vga_clk),
    .d(send_data[0]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [0]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b1  (
    .clk(vga_clk),
    .d(send_data[1]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [1]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b10  (
    .clk(vga_clk),
    .d(send_cmd[2]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [10]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b11  (
    .clk(vga_clk),
    .d(send_cmd[3]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [11]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b12  (
    .clk(vga_clk),
    .d(send_cmd[4]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [12]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b13  (
    .clk(vga_clk),
    .d(send_cmd[5]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [13]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b14  (
    .clk(vga_clk),
    .d(send_cmd[6]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [14]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b15  (
    .clk(vga_clk),
    .d(send_cmd[7]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [15]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b2  (
    .clk(vga_clk),
    .d(send_data[2]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [2]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b3  (
    .clk(vga_clk),
    .d(send_data[3]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [3]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b4  (
    .clk(vga_clk),
    .d(send_data[4]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [4]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b5  (
    .clk(vga_clk),
    .d(send_data[5]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [5]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b6  (
    .clk(vga_clk),
    .d(send_data[6]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [6]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b7  (
    .clk(vga_clk),
    .d(send_data[7]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [7]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b8  (
    .clk(vga_clk),
    .d(send_cmd[0]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [8]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b9  (
    .clk(vga_clk),
    .d(send_cmd[1]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [9]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/rx_en_d_reg  (
    .clk(vga_clk),
    .d(\u_uart/rx_en ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/rx_en_d ));  // sources/rtl/uart/ubus.v(107)
  binary_mux_s4_w1 \u_uart/u_ubus/sel0_b0  (
    .i0(\u_uart/tx_data [0]),
    .i1(1'b1),
    .i10(\u_uart/tx_data [0]),
    .i11(\u_uart/tx_data [0]),
    .i12(\u_uart/tx_data [0]),
    .i13(\u_uart/tx_data [0]),
    .i14(\u_uart/tx_data [0]),
    .i15(\u_uart/tx_data [0]),
    .i2(1'b0),
    .i3(1'b1),
    .i4(1'b0),
    .i5(1'b1),
    .i6(1'b0),
    .i7(\u_uart/u_ubus/tx_buffer [8]),
    .i8(\u_uart/u_ubus/tx_buffer [0]),
    .i9(\u_uart/tx_data [0]),
    .sel(\u_uart/u_ubus/send_cnt ),
    .o(\u_uart/u_ubus/n57 [0]));  // sources/rtl/uart/ubus.v(206)
  binary_mux_s4_w1 \u_uart/u_ubus/sel0_b1  (
    .i0(\u_uart/tx_data [1]),
    .i1(1'b0),
    .i10(\u_uart/tx_data [1]),
    .i11(\u_uart/tx_data [1]),
    .i12(\u_uart/tx_data [1]),
    .i13(\u_uart/tx_data [1]),
    .i14(\u_uart/tx_data [1]),
    .i15(\u_uart/tx_data [1]),
    .i2(1'b1),
    .i3(1'b1),
    .i4(1'b0),
    .i5(1'b0),
    .i6(1'b1),
    .i7(\u_uart/u_ubus/tx_buffer [9]),
    .i8(\u_uart/u_ubus/tx_buffer [1]),
    .i9(\u_uart/tx_data [1]),
    .sel(\u_uart/u_ubus/send_cnt ),
    .o(\u_uart/u_ubus/n57 [1]));  // sources/rtl/uart/ubus.v(206)
  binary_mux_s4_w1 \u_uart/u_ubus/sel0_b2  (
    .i0(\u_uart/tx_data [2]),
    .i1(1'b0),
    .i10(\u_uart/tx_data [2]),
    .i11(\u_uart/tx_data [2]),
    .i12(\u_uart/tx_data [2]),
    .i13(\u_uart/tx_data [2]),
    .i14(\u_uart/tx_data [2]),
    .i15(\u_uart/tx_data [2]),
    .i2(1'b0),
    .i3(1'b0),
    .i4(1'b1),
    .i5(1'b1),
    .i6(1'b1),
    .i7(\u_uart/u_ubus/tx_buffer [10]),
    .i8(\u_uart/u_ubus/tx_buffer [2]),
    .i9(\u_uart/tx_data [2]),
    .sel(\u_uart/u_ubus/send_cnt ),
    .o(\u_uart/u_ubus/n57 [2]));  // sources/rtl/uart/ubus.v(206)
  binary_mux_s4_w1 \u_uart/u_ubus/sel0_b3  (
    .i0(\u_uart/tx_data [3]),
    .i1(1'b0),
    .i10(\u_uart/tx_data [3]),
    .i11(\u_uart/tx_data [3]),
    .i12(\u_uart/tx_data [3]),
    .i13(\u_uart/tx_data [3]),
    .i14(\u_uart/tx_data [3]),
    .i15(\u_uart/tx_data [3]),
    .i2(1'b0),
    .i3(1'b0),
    .i4(1'b0),
    .i5(1'b0),
    .i6(1'b0),
    .i7(\u_uart/u_ubus/tx_buffer [11]),
    .i8(\u_uart/u_ubus/tx_buffer [3]),
    .i9(\u_uart/tx_data [3]),
    .sel(\u_uart/u_ubus/send_cnt ),
    .o(\u_uart/u_ubus/n57 [3]));  // sources/rtl/uart/ubus.v(206)
  binary_mux_s4_w1 \u_uart/u_ubus/sel0_b4  (
    .i0(\u_uart/tx_data [4]),
    .i1(1'b0),
    .i10(\u_uart/tx_data [4]),
    .i11(\u_uart/tx_data [4]),
    .i12(\u_uart/tx_data [4]),
    .i13(\u_uart/tx_data [4]),
    .i14(\u_uart/tx_data [4]),
    .i15(\u_uart/tx_data [4]),
    .i2(1'b0),
    .i3(1'b0),
    .i4(1'b0),
    .i5(1'b0),
    .i6(1'b0),
    .i7(\u_uart/u_ubus/tx_buffer [12]),
    .i8(\u_uart/u_ubus/tx_buffer [4]),
    .i9(\u_uart/tx_data [4]),
    .sel(\u_uart/u_ubus/send_cnt ),
    .o(\u_uart/u_ubus/n57 [4]));  // sources/rtl/uart/ubus.v(206)
  binary_mux_s4_w1 \u_uart/u_ubus/sel0_b5  (
    .i0(\u_uart/tx_data [5]),
    .i1(1'b0),
    .i10(\u_uart/tx_data [5]),
    .i11(\u_uart/tx_data [5]),
    .i12(\u_uart/tx_data [5]),
    .i13(\u_uart/tx_data [5]),
    .i14(\u_uart/tx_data [5]),
    .i15(\u_uart/tx_data [5]),
    .i2(1'b0),
    .i3(1'b0),
    .i4(1'b0),
    .i5(1'b0),
    .i6(1'b0),
    .i7(\u_uart/u_ubus/tx_buffer [13]),
    .i8(\u_uart/u_ubus/tx_buffer [5]),
    .i9(\u_uart/tx_data [5]),
    .sel(\u_uart/u_ubus/send_cnt ),
    .o(\u_uart/u_ubus/n57 [5]));  // sources/rtl/uart/ubus.v(206)
  binary_mux_s4_w1 \u_uart/u_ubus/sel0_b6  (
    .i0(\u_uart/tx_data [6]),
    .i1(1'b1),
    .i10(\u_uart/tx_data [6]),
    .i11(\u_uart/tx_data [6]),
    .i12(\u_uart/tx_data [6]),
    .i13(\u_uart/tx_data [6]),
    .i14(\u_uart/tx_data [6]),
    .i15(\u_uart/tx_data [6]),
    .i2(1'b1),
    .i3(1'b1),
    .i4(1'b1),
    .i5(1'b1),
    .i6(1'b1),
    .i7(\u_uart/u_ubus/tx_buffer [14]),
    .i8(\u_uart/u_ubus/tx_buffer [6]),
    .i9(\u_uart/tx_data [6]),
    .sel(\u_uart/u_ubus/send_cnt ),
    .o(\u_uart/u_ubus/n57 [6]));  // sources/rtl/uart/ubus.v(206)
  binary_mux_s4_w1 \u_uart/u_ubus/sel0_b7  (
    .i0(\u_uart/tx_data [7]),
    .i1(1'b0),
    .i10(\u_uart/tx_data [7]),
    .i11(\u_uart/tx_data [7]),
    .i12(\u_uart/tx_data [7]),
    .i13(\u_uart/tx_data [7]),
    .i14(\u_uart/tx_data [7]),
    .i15(\u_uart/tx_data [7]),
    .i2(1'b0),
    .i3(1'b0),
    .i4(1'b0),
    .i5(1'b0),
    .i6(1'b0),
    .i7(\u_uart/u_ubus/tx_buffer [15]),
    .i8(\u_uart/u_ubus/tx_buffer [7]),
    .i9(\u_uart/tx_data [7]),
    .sel(\u_uart/u_ubus/send_cnt ),
    .o(\u_uart/u_ubus/n57 [7]));  // sources/rtl/uart/ubus.v(206)
  reg_sr_ss_w1 \u_uart/u_ubus/send_finish_reg  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/send_finish ),
    .en(1'b1),
    .reset(send_en),
    .set(\u_uart/u_ubus/n35 ),
    .q(\u_uart/u_ubus/send_finish ));  // sources/rtl/uart/ubus.v(161)
  reg_ar_as_w1 \u_uart/u_ubus/send_flag_reg  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/n42 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/send_flag ));  // sources/rtl/uart/ubus.v(183)
  reg_sr_ss_w1 \u_uart/u_ubus/send_ready_reg  (
    .clk(vga_clk),
    .d(send_ready),
    .en(1'b1),
    .reset(send_en),
    .set(\u_uart/u_ubus/n58 ),
    .q(send_ready));  // sources/rtl/uart/ubus.v(216)
  reg_ar_ss_w1 \u_uart/u_ubus/send_start_reg  (
    .clk(vga_clk),
    .d(1'b0),
    .en(\u_uart/u_ubus/send_finish ),
    .reset(1'b0),
    .set(send_en),
    .q(\u_uart/u_ubus/send_start ));  // sources/rtl/uart/ubus.v(152)
  reg_ar_as_w1 \u_uart/u_ubus/tx_en_reg  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/send_flag ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/tx_en ));  // sources/rtl/uart/ubus.v(183)
  reg_ar_as_w1 \u_uart/u_ubus/tx_ready_flag_reg  (
    .clk(vga_clk),
    .d(\u_uart/u_ubus/n41 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_ready_flag ));  // sources/rtl/uart/ubus.v(176)
  and \u_uart/u_ubus/u10  (\u_uart/u_ubus/n22 , \u_uart/u_ubus/frame_head_flag0 , \u_uart/u_ubus/frame_head_flag1 );  // sources/rtl/uart/ubus.v(123)
  and \u_uart/u_ubus/u11  (\u_uart/u_ubus/n23 , \u_uart/u_ubus/n22 , \u_uart/u_ubus/frame_head_flag2 );  // sources/rtl/uart/ubus.v(123)
  and \u_uart/u_ubus/u12  (\u_uart/u_ubus/n24 , \u_uart/u_ubus/n23 , \u_uart/u_ubus/frame_head_flag3 );  // sources/rtl/uart/ubus.v(123)
  and \u_uart/u_ubus/u13  (\u_uart/u_ubus/n25 , \u_uart/u_ubus/n24 , \u_uart/u_ubus/frame_head_flag4 );  // sources/rtl/uart/ubus.v(123)
  and \u_uart/u_ubus/u14  (\u_uart/u_ubus/n26 , \u_uart/u_ubus/n25 , \u_uart/u_ubus/frame_head_flag5 );  // sources/rtl/uart/ubus.v(123)
  and \u_uart/u_ubus/u17  (\u_uart/u_ubus/n35 , \u_uart/tx_en , \u_uart/u_ubus/n34 );  // sources/rtl/uart/ubus.v(159)
  and \u_uart/u_ubus/u20  (\u_uart/u_ubus/n42 , \u_uart/u_ubus/send_start , \u_uart/u_ubus/tx_ready_flag );  // sources/rtl/uart/ubus.v(181)
  and \u_uart/u_ubus/u23  (\u_uart/u_ubus/n30 , \u_uart/u_ubus/tx_ready_cnt [1], \u_uart/u_ubus/tx_ready_cnt [2]);  // sources/rtl/uart/ubus.v(175)
  and \u_uart/u_ubus/u24  (\u_uart/u_ubus/n58 , \u_uart/u_ubus/tx_ready_flag , \u_uart/u_ubus/send_finish );  // sources/rtl/uart/ubus.v(214)
  and \u_uart/u_ubus/u31  (\u_uart/u_ubus/n41 , \u_uart/u_ubus/tx_ready_cnt [0], \u_uart/u_ubus/n30 );  // sources/rtl/uart/ubus.v(175)
  and \u_uart/u_ubus/u4  (\u_uart/u_ubus/n11 , \u_uart/u_ubus/rx_en_d , \u_uart/u_ubus/n10 );  // sources/rtl/uart/ubus.v(112)
  and \u_uart/u_ubus/u5  (\u_uart/u_ubus/n13 , \u_uart/u_ubus/rx_en_d , \u_uart/u_ubus/n12 );  // sources/rtl/uart/ubus.v(113)
  and \u_uart/u_ubus/u6  (\u_uart/u_ubus/n15 , \u_uart/u_ubus/rx_en_d , \u_uart/u_ubus/n14 );  // sources/rtl/uart/ubus.v(114)
  and \u_uart/u_ubus/u7  (\u_uart/u_ubus/n17 , \u_uart/u_ubus/rx_en_d , \u_uart/u_ubus/n16 );  // sources/rtl/uart/ubus.v(115)
  and \u_uart/u_ubus/u8  (\u_uart/u_ubus/n19 , \u_uart/u_ubus/rx_en_d , \u_uart/u_ubus/n18 );  // sources/rtl/uart/ubus.v(116)
  and \u_uart/u_ubus/u9  (\u_uart/u_ubus/n21 , \u_uart/u_ubus/rx_en_d , \u_uart/u_ubus/n20 );  // sources/rtl/uart/ubus.v(117)
  add_pu13_pu13_o13 \u_vga/add0  (
    .i0(\u_vga/hsyn_cnt ),
    .i1(13'b0000000000001),
    .o(\u_vga/n1 ));  // sources/rtl/vga/vga.v(66)
  add_pu13_pu13_o13 \u_vga/add1  (
    .i0(\u_vga/vsyn_cnt ),
    .i1(13'b0000000000001),
    .o(\u_vga/n4 ));  // sources/rtl/vga/vga.v(77)
  reg_sr_as_w1 \u_vga/axis_en_reg  (
    .clk(vga_clk),
    .d(\u_vga/n16 ),
    .en(1'b1),
    .reset(~\u_vga/n13 ),
    .set(1'b0),
    .q(axis_en));  // sources/rtl/vga/vga.v(111)
  eq_w13 \u_vga/eq0  (
    .i0(\u_vga/hsyn_cnt ),
    .i1(13'b0001100011111),
    .o(\u_vga/n0 ));  // sources/rtl/vga/vga.v(63)
  eq_w13 \u_vga/eq1  (
    .i0(\u_vga/vsyn_cnt ),
    .i1(13'b0001000001100),
    .o(\u_vga/n3 ));  // sources/rtl/vga/vga.v(74)
  reg_ar_as_w1 \u_vga/hsyn_reg  (
    .clk(vga_clk),
    .d(\u_vga/n8 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(hsyn));  // sources/rtl/vga/vga.v(88)
  lt_u13_u13 \u_vga/lt0  (
    .ci(1'b0),
    .i0(\u_vga/hsyn_cnt ),
    .i1(13'b0000001100000),
    .o(\u_vga/n7 ));  // sources/rtl/vga/vga.v(84)
  lt_u13_u13 \u_vga/lt1  (
    .ci(1'b0),
    .i0(\u_vga/vsyn_cnt ),
    .i1(13'b0000000000010),
    .o(\u_vga/n9 ));  // sources/rtl/vga/vga.v(93)
  lt_u13_u13 \u_vga/lt2  (
    .ci(1'b1),
    .i0(13'b0000000100011),
    .i1(\u_vga/vsyn_cnt ),
    .o(\u_vga/n11 ));  // sources/rtl/vga/vga.v(102)
  lt_u13_u13 \u_vga/lt3  (
    .ci(1'b0),
    .i0(\u_vga/vsyn_cnt ),
    .i1(13'b0001000000011),
    .o(\u_vga/n12 ));  // sources/rtl/vga/vga.v(102)
  lt_u13_u13 \u_vga/lt4  (
    .ci(1'b1),
    .i0(13'b0000010010000),
    .i1(\u_vga/hsyn_cnt ),
    .o(\u_vga/n14 ));  // sources/rtl/vga/vga.v(104)
  lt_u13_u13 \u_vga/lt5  (
    .ci(1'b0),
    .i0(\u_vga/hsyn_cnt ),
    .i1(13'b0001100010000),
    .o(\u_vga/n15 ));  // sources/rtl/vga/vga.v(104)
  binary_mux_s1_w1 \u_vga/mux1_b0  (
    .i0(\u_vga/n4 [0]),
    .i1(1'b0),
    .sel(\u_vga/n3 ),
    .o(\u_vga/n5 [0]));  // sources/rtl/vga/vga.v(77)
  binary_mux_s1_w1 \u_vga/mux1_b1  (
    .i0(\u_vga/n4 [1]),
    .i1(1'b0),
    .sel(\u_vga/n3 ),
    .o(\u_vga/n5 [1]));  // sources/rtl/vga/vga.v(77)
  binary_mux_s1_w1 \u_vga/mux1_b10  (
    .i0(\u_vga/n4 [10]),
    .i1(1'b0),
    .sel(\u_vga/n3 ),
    .o(\u_vga/n5 [10]));  // sources/rtl/vga/vga.v(77)
  binary_mux_s1_w1 \u_vga/mux1_b11  (
    .i0(\u_vga/n4 [11]),
    .i1(1'b0),
    .sel(\u_vga/n3 ),
    .o(\u_vga/n5 [11]));  // sources/rtl/vga/vga.v(77)
  binary_mux_s1_w1 \u_vga/mux1_b12  (
    .i0(\u_vga/n4 [12]),
    .i1(1'b0),
    .sel(\u_vga/n3 ),
    .o(\u_vga/n5 [12]));  // sources/rtl/vga/vga.v(77)
  binary_mux_s1_w1 \u_vga/mux1_b2  (
    .i0(\u_vga/n4 [2]),
    .i1(1'b0),
    .sel(\u_vga/n3 ),
    .o(\u_vga/n5 [2]));  // sources/rtl/vga/vga.v(77)
  binary_mux_s1_w1 \u_vga/mux1_b3  (
    .i0(\u_vga/n4 [3]),
    .i1(1'b0),
    .sel(\u_vga/n3 ),
    .o(\u_vga/n5 [3]));  // sources/rtl/vga/vga.v(77)
  binary_mux_s1_w1 \u_vga/mux1_b4  (
    .i0(\u_vga/n4 [4]),
    .i1(1'b0),
    .sel(\u_vga/n3 ),
    .o(\u_vga/n5 [4]));  // sources/rtl/vga/vga.v(77)
  binary_mux_s1_w1 \u_vga/mux1_b5  (
    .i0(\u_vga/n4 [5]),
    .i1(1'b0),
    .sel(\u_vga/n3 ),
    .o(\u_vga/n5 [5]));  // sources/rtl/vga/vga.v(77)
  binary_mux_s1_w1 \u_vga/mux1_b6  (
    .i0(\u_vga/n4 [6]),
    .i1(1'b0),
    .sel(\u_vga/n3 ),
    .o(\u_vga/n5 [6]));  // sources/rtl/vga/vga.v(77)
  binary_mux_s1_w1 \u_vga/mux1_b7  (
    .i0(\u_vga/n4 [7]),
    .i1(1'b0),
    .sel(\u_vga/n3 ),
    .o(\u_vga/n5 [7]));  // sources/rtl/vga/vga.v(77)
  binary_mux_s1_w1 \u_vga/mux1_b8  (
    .i0(\u_vga/n4 [8]),
    .i1(1'b0),
    .sel(\u_vga/n3 ),
    .o(\u_vga/n5 [8]));  // sources/rtl/vga/vga.v(77)
  binary_mux_s1_w1 \u_vga/mux1_b9  (
    .i0(\u_vga/n4 [9]),
    .i1(1'b0),
    .sel(\u_vga/n3 ),
    .o(\u_vga/n5 [9]));  // sources/rtl/vga/vga.v(77)
  and \u_vga/mux4_b0_sel_is_3  (\u_vga/mux4_b0_sel_is_3_o , \u_vga/n13 , \u_vga/n16 );
  reg_ar_as_w1 \u_vga/reg0_b0  (
    .clk(vga_clk),
    .d(\u_vga/n5 [0]),
    .en(\u_vga/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vga/vsyn_cnt [0]));  // sources/rtl/vga/vga.v(79)
  reg_ar_as_w1 \u_vga/reg0_b1  (
    .clk(vga_clk),
    .d(\u_vga/n5 [1]),
    .en(\u_vga/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vga/vsyn_cnt [1]));  // sources/rtl/vga/vga.v(79)
  reg_ar_as_w1 \u_vga/reg0_b10  (
    .clk(vga_clk),
    .d(\u_vga/n5 [10]),
    .en(\u_vga/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vga/vsyn_cnt [10]));  // sources/rtl/vga/vga.v(79)
  reg_ar_as_w1 \u_vga/reg0_b11  (
    .clk(vga_clk),
    .d(\u_vga/n5 [11]),
    .en(\u_vga/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vga/vsyn_cnt [11]));  // sources/rtl/vga/vga.v(79)
  reg_ar_as_w1 \u_vga/reg0_b12  (
    .clk(vga_clk),
    .d(\u_vga/n5 [12]),
    .en(\u_vga/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vga/vsyn_cnt [12]));  // sources/rtl/vga/vga.v(79)
  reg_ar_as_w1 \u_vga/reg0_b2  (
    .clk(vga_clk),
    .d(\u_vga/n5 [2]),
    .en(\u_vga/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vga/vsyn_cnt [2]));  // sources/rtl/vga/vga.v(79)
  reg_ar_as_w1 \u_vga/reg0_b3  (
    .clk(vga_clk),
    .d(\u_vga/n5 [3]),
    .en(\u_vga/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vga/vsyn_cnt [3]));  // sources/rtl/vga/vga.v(79)
  reg_ar_as_w1 \u_vga/reg0_b4  (
    .clk(vga_clk),
    .d(\u_vga/n5 [4]),
    .en(\u_vga/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vga/vsyn_cnt [4]));  // sources/rtl/vga/vga.v(79)
  reg_ar_as_w1 \u_vga/reg0_b5  (
    .clk(vga_clk),
    .d(\u_vga/n5 [5]),
    .en(\u_vga/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vga/vsyn_cnt [5]));  // sources/rtl/vga/vga.v(79)
  reg_ar_as_w1 \u_vga/reg0_b6  (
    .clk(vga_clk),
    .d(\u_vga/n5 [6]),
    .en(\u_vga/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vga/vsyn_cnt [6]));  // sources/rtl/vga/vga.v(79)
  reg_ar_as_w1 \u_vga/reg0_b7  (
    .clk(vga_clk),
    .d(\u_vga/n5 [7]),
    .en(\u_vga/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vga/vsyn_cnt [7]));  // sources/rtl/vga/vga.v(79)
  reg_ar_as_w1 \u_vga/reg0_b8  (
    .clk(vga_clk),
    .d(\u_vga/n5 [8]),
    .en(\u_vga/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vga/vsyn_cnt [8]));  // sources/rtl/vga/vga.v(79)
  reg_ar_as_w1 \u_vga/reg0_b9  (
    .clk(vga_clk),
    .d(\u_vga/n5 [9]),
    .en(\u_vga/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vga/vsyn_cnt [9]));  // sources/rtl/vga/vga.v(79)
  reg_sr_as_w1 \u_vga/reg1_b0  (
    .clk(vga_clk),
    .d(\u_vga/n18 [0]),
    .en(1'b1),
    .reset(~\u_vga/mux4_b0_sel_is_3_o ),
    .set(1'b0),
    .q(axis_x[0]));  // sources/rtl/vga/vga.v(125)
  reg_sr_as_w1 \u_vga/reg1_b1  (
    .clk(vga_clk),
    .d(\u_vga/n18 [1]),
    .en(1'b1),
    .reset(~\u_vga/mux4_b0_sel_is_3_o ),
    .set(1'b0),
    .q(axis_x[1]));  // sources/rtl/vga/vga.v(125)
  reg_sr_as_w1 \u_vga/reg1_b10  (
    .clk(vga_clk),
    .d(\u_vga/n18 [10]),
    .en(1'b1),
    .reset(~\u_vga/mux4_b0_sel_is_3_o ),
    .set(1'b0),
    .q(axis_x[10]));  // sources/rtl/vga/vga.v(125)
  reg_sr_as_w1 \u_vga/reg1_b2  (
    .clk(vga_clk),
    .d(\u_vga/n18 [2]),
    .en(1'b1),
    .reset(~\u_vga/mux4_b0_sel_is_3_o ),
    .set(1'b0),
    .q(axis_x[2]));  // sources/rtl/vga/vga.v(125)
  reg_sr_as_w1 \u_vga/reg1_b3  (
    .clk(vga_clk),
    .d(\u_vga/n18 [3]),
    .en(1'b1),
    .reset(~\u_vga/mux4_b0_sel_is_3_o ),
    .set(1'b0),
    .q(axis_x[3]));  // sources/rtl/vga/vga.v(125)
  reg_sr_as_w1 \u_vga/reg1_b4  (
    .clk(vga_clk),
    .d(\u_vga/n18 [4]),
    .en(1'b1),
    .reset(~\u_vga/mux4_b0_sel_is_3_o ),
    .set(1'b0),
    .q(axis_x[4]));  // sources/rtl/vga/vga.v(125)
  reg_sr_as_w1 \u_vga/reg1_b5  (
    .clk(vga_clk),
    .d(\u_vga/n18 [5]),
    .en(1'b1),
    .reset(~\u_vga/mux4_b0_sel_is_3_o ),
    .set(1'b0),
    .q(axis_x[5]));  // sources/rtl/vga/vga.v(125)
  reg_sr_as_w1 \u_vga/reg1_b6  (
    .clk(vga_clk),
    .d(\u_vga/n18 [6]),
    .en(1'b1),
    .reset(~\u_vga/mux4_b0_sel_is_3_o ),
    .set(1'b0),
    .q(axis_x[6]));  // sources/rtl/vga/vga.v(125)
  reg_sr_as_w1 \u_vga/reg1_b7  (
    .clk(vga_clk),
    .d(\u_vga/n18 [7]),
    .en(1'b1),
    .reset(~\u_vga/mux4_b0_sel_is_3_o ),
    .set(1'b0),
    .q(axis_x[7]));  // sources/rtl/vga/vga.v(125)
  reg_sr_as_w1 \u_vga/reg1_b8  (
    .clk(vga_clk),
    .d(\u_vga/n18 [8]),
    .en(1'b1),
    .reset(~\u_vga/mux4_b0_sel_is_3_o ),
    .set(1'b0),
    .q(axis_x[8]));  // sources/rtl/vga/vga.v(125)
  reg_sr_as_w1 \u_vga/reg1_b9  (
    .clk(vga_clk),
    .d(\u_vga/n18 [9]),
    .en(1'b1),
    .reset(~\u_vga/mux4_b0_sel_is_3_o ),
    .set(1'b0),
    .q(axis_x[9]));  // sources/rtl/vga/vga.v(125)
  reg_sr_as_w1 \u_vga/reg2_b0  (
    .clk(vga_clk),
    .d(\u_vga/n21 [0]),
    .en(1'b1),
    .reset(~\u_vga/n13 ),
    .set(1'b0),
    .q(axis_y[0]));  // sources/rtl/vga/vga.v(134)
  reg_sr_as_w1 \u_vga/reg2_b1  (
    .clk(vga_clk),
    .d(\u_vga/n21 [1]),
    .en(1'b1),
    .reset(~\u_vga/n13 ),
    .set(1'b0),
    .q(axis_y[1]));  // sources/rtl/vga/vga.v(134)
  reg_sr_as_w1 \u_vga/reg2_b10  (
    .clk(vga_clk),
    .d(\u_vga/n21 [10]),
    .en(1'b1),
    .reset(~\u_vga/n13 ),
    .set(1'b0),
    .q(axis_y[10]));  // sources/rtl/vga/vga.v(134)
  reg_sr_as_w1 \u_vga/reg2_b2  (
    .clk(vga_clk),
    .d(\u_vga/n21 [2]),
    .en(1'b1),
    .reset(~\u_vga/n13 ),
    .set(1'b0),
    .q(axis_y[2]));  // sources/rtl/vga/vga.v(134)
  reg_sr_as_w1 \u_vga/reg2_b3  (
    .clk(vga_clk),
    .d(\u_vga/n21 [3]),
    .en(1'b1),
    .reset(~\u_vga/n13 ),
    .set(1'b0),
    .q(axis_y[3]));  // sources/rtl/vga/vga.v(134)
  reg_sr_as_w1 \u_vga/reg2_b4  (
    .clk(vga_clk),
    .d(\u_vga/n21 [4]),
    .en(1'b1),
    .reset(~\u_vga/n13 ),
    .set(1'b0),
    .q(axis_y[4]));  // sources/rtl/vga/vga.v(134)
  reg_sr_as_w1 \u_vga/reg2_b5  (
    .clk(vga_clk),
    .d(\u_vga/n21 [5]),
    .en(1'b1),
    .reset(~\u_vga/n13 ),
    .set(1'b0),
    .q(axis_y[5]));  // sources/rtl/vga/vga.v(134)
  reg_sr_as_w1 \u_vga/reg2_b6  (
    .clk(vga_clk),
    .d(\u_vga/n21 [6]),
    .en(1'b1),
    .reset(~\u_vga/n13 ),
    .set(1'b0),
    .q(axis_y[6]));  // sources/rtl/vga/vga.v(134)
  reg_sr_as_w1 \u_vga/reg2_b7  (
    .clk(vga_clk),
    .d(\u_vga/n21 [7]),
    .en(1'b1),
    .reset(~\u_vga/n13 ),
    .set(1'b0),
    .q(axis_y[7]));  // sources/rtl/vga/vga.v(134)
  reg_sr_as_w1 \u_vga/reg2_b8  (
    .clk(vga_clk),
    .d(\u_vga/n21 [8]),
    .en(1'b1),
    .reset(~\u_vga/n13 ),
    .set(1'b0),
    .q(axis_y[8]));  // sources/rtl/vga/vga.v(134)
  reg_sr_as_w1 \u_vga/reg2_b9  (
    .clk(vga_clk),
    .d(\u_vga/n21 [9]),
    .en(1'b1),
    .reset(~\u_vga/n13 ),
    .set(1'b0),
    .q(axis_y[9]));  // sources/rtl/vga/vga.v(134)
  reg_sr_as_w1 \u_vga/reg3_b0  (
    .clk(vga_clk),
    .d(\u_vga/n1 [0]),
    .en(1'b1),
    .reset(\u_vga/n0 ),
    .set(1'b0),
    .q(\u_vga/hsyn_cnt [0]));  // sources/rtl/vga/vga.v(67)
  reg_sr_as_w1 \u_vga/reg3_b1  (
    .clk(vga_clk),
    .d(\u_vga/n1 [1]),
    .en(1'b1),
    .reset(\u_vga/n0 ),
    .set(1'b0),
    .q(\u_vga/hsyn_cnt [1]));  // sources/rtl/vga/vga.v(67)
  reg_sr_as_w1 \u_vga/reg3_b10  (
    .clk(vga_clk),
    .d(\u_vga/n1 [10]),
    .en(1'b1),
    .reset(\u_vga/n0 ),
    .set(1'b0),
    .q(\u_vga/hsyn_cnt [10]));  // sources/rtl/vga/vga.v(67)
  reg_sr_as_w1 \u_vga/reg3_b11  (
    .clk(vga_clk),
    .d(\u_vga/n1 [11]),
    .en(1'b1),
    .reset(\u_vga/n0 ),
    .set(1'b0),
    .q(\u_vga/hsyn_cnt [11]));  // sources/rtl/vga/vga.v(67)
  reg_sr_as_w1 \u_vga/reg3_b12  (
    .clk(vga_clk),
    .d(\u_vga/n1 [12]),
    .en(1'b1),
    .reset(\u_vga/n0 ),
    .set(1'b0),
    .q(\u_vga/hsyn_cnt [12]));  // sources/rtl/vga/vga.v(67)
  reg_sr_as_w1 \u_vga/reg3_b2  (
    .clk(vga_clk),
    .d(\u_vga/n1 [2]),
    .en(1'b1),
    .reset(\u_vga/n0 ),
    .set(1'b0),
    .q(\u_vga/hsyn_cnt [2]));  // sources/rtl/vga/vga.v(67)
  reg_sr_as_w1 \u_vga/reg3_b3  (
    .clk(vga_clk),
    .d(\u_vga/n1 [3]),
    .en(1'b1),
    .reset(\u_vga/n0 ),
    .set(1'b0),
    .q(\u_vga/hsyn_cnt [3]));  // sources/rtl/vga/vga.v(67)
  reg_sr_as_w1 \u_vga/reg3_b4  (
    .clk(vga_clk),
    .d(\u_vga/n1 [4]),
    .en(1'b1),
    .reset(\u_vga/n0 ),
    .set(1'b0),
    .q(\u_vga/hsyn_cnt [4]));  // sources/rtl/vga/vga.v(67)
  reg_sr_as_w1 \u_vga/reg3_b5  (
    .clk(vga_clk),
    .d(\u_vga/n1 [5]),
    .en(1'b1),
    .reset(\u_vga/n0 ),
    .set(1'b0),
    .q(\u_vga/hsyn_cnt [5]));  // sources/rtl/vga/vga.v(67)
  reg_sr_as_w1 \u_vga/reg3_b6  (
    .clk(vga_clk),
    .d(\u_vga/n1 [6]),
    .en(1'b1),
    .reset(\u_vga/n0 ),
    .set(1'b0),
    .q(\u_vga/hsyn_cnt [6]));  // sources/rtl/vga/vga.v(67)
  reg_sr_as_w1 \u_vga/reg3_b7  (
    .clk(vga_clk),
    .d(\u_vga/n1 [7]),
    .en(1'b1),
    .reset(\u_vga/n0 ),
    .set(1'b0),
    .q(\u_vga/hsyn_cnt [7]));  // sources/rtl/vga/vga.v(67)
  reg_sr_as_w1 \u_vga/reg3_b8  (
    .clk(vga_clk),
    .d(\u_vga/n1 [8]),
    .en(1'b1),
    .reset(\u_vga/n0 ),
    .set(1'b0),
    .q(\u_vga/hsyn_cnt [8]));  // sources/rtl/vga/vga.v(67)
  reg_sr_as_w1 \u_vga/reg3_b9  (
    .clk(vga_clk),
    .d(\u_vga/n1 [9]),
    .en(1'b1),
    .reset(\u_vga/n0 ),
    .set(1'b0),
    .q(\u_vga/hsyn_cnt [9]));  // sources/rtl/vga/vga.v(67)
  add_pu11_mu11_o11 \u_vga/sub0  (
    .i0(\u_vga/hsyn_cnt [10:0]),
    .i1(11'b00010010000),
    .o(\u_vga/n18 [10:0]));  // sources/rtl/vga/vga.v(119)
  add_pu11_mu11_o11 \u_vga/sub1  (
    .i0(\u_vga/vsyn_cnt [10:0]),
    .i1(11'b00000100011),
    .o(\u_vga/n21 [10:0]));  // sources/rtl/vga/vga.v(131)
  not \u_vga/u2  (\u_vga/n8 , \u_vga/n7 );  // sources/rtl/vga/vga.v(87)
  not \u_vga/u3  (\u_vga/n10 , \u_vga/n9 );  // sources/rtl/vga/vga.v(96)
  and \u_vga/u4  (\u_vga/n13 , \u_vga/n11 , \u_vga/n12 );  // sources/rtl/vga/vga.v(102)
  and \u_vga/u5  (\u_vga/n16 , \u_vga/n14 , \u_vga/n15 );  // sources/rtl/vga/vga.v(104)
  reg_ar_as_w1 \u_vga/vsyn_reg  (
    .clk(vga_clk),
    .d(\u_vga/n10 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(vsyn));  // sources/rtl/vga/vga.v(97)
  add_pu8_pu8_o8 \u_vram/add0  (
    .i0({\u_vram/n5 [7:1],1'b0}),
    .i1({3'b000,\u_vram/mesh_x }),
    .o(\u_vram/n6 [7:0]));  // sources/rtl/vga/vram.v(87)
  reg_ar_as_w1 \u_vram/axis_en_d0_reg  (
    .clk(vga_clk),
    .d(axis_en),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_en_d0 ));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/axis_en_d1_reg  (
    .clk(vga_clk),
    .d(\u_vram/axis_en_d0 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_en_d1 ));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/axis_en_d2_reg  (
    .clk(vga_clk),
    .d(\u_vram/axis_en_d1 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_en_d2 ));  // sources/rtl/vga/vram.v(110)
  eq_w11 \u_vram/eq0  (
    .i0(\u_vram/axis_x_d2 ),
    .i1(11'b00000100000),
    .o(\u_vram/n16 ));  // sources/rtl/vga/vram.v(133)
  eq_w11 \u_vram/eq1  (
    .i0(\u_vram/axis_x_d2 ),
    .i1(11'b01001100000),
    .o(\u_vram/n17 ));  // sources/rtl/vga/vram.v(133)
  eq_w11 \u_vram/eq2  (
    .i0(\u_vram/axis_y_d2 ),
    .i1(11'b00000100000),
    .o(\u_vram/n19 ));  // sources/rtl/vga/vram.v(133)
  eq_w11 \u_vram/eq3  (
    .i0(\u_vram/axis_y_d2 ),
    .i1(11'b00111000000),
    .o(\u_vram/n21 ));  // sources/rtl/vga/vram.v(133)
  eq_w5 \u_vram/eq4  (
    .i0(\u_vram/axis_y_d2 [4:0]),
    .i1(5'b00000),
    .o(\u_vram/n23 ));  // sources/rtl/vga/vram.v(135)
  eq_w5 \u_vram/eq5  (
    .i0(\u_vram/axis_x_d2 [4:0]),
    .i1(5'b00000),
    .o(\u_vram/n24 ));  // sources/rtl/vga/vram.v(135)
  reg_ar_as_w1 \u_vram/hs_i_d0_reg  (
    .clk(vga_clk),
    .d(hsyn),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/hs_i_d0 ));  // sources/rtl/vga/vram.v(123)
  reg_ar_as_w1 \u_vram/hs_i_d1_reg  (
    .clk(vga_clk),
    .d(\u_vram/hs_i_d0 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/hs_i_d1 ));  // sources/rtl/vga/vram.v(123)
  reg_ar_as_w1 \u_vram/hs_i_d2_reg  (
    .clk(vga_clk),
    .d(\u_vram/hs_i_d1 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/hs_i_d2 ));  // sources/rtl/vga/vram.v(123)
  reg_ar_as_w1 \u_vram/hs_o_reg  (
    .clk(~vga_clk),
    .d(\u_vram/hs_i_d2 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(vga_hs));  // sources/rtl/vga/vram.v(152)
  lt_u11_u11 \u_vram/lt0  (
    .ci(1'b0),
    .i0(\u_vram/axis_x_d2 ),
    .i1(11'b00000100000),
    .o(\u_vram/n9 ));  // sources/rtl/vga/vram.v(131)
  lt_u11_u11 \u_vram/lt1  (
    .ci(1'b0),
    .i0(11'b01001100000),
    .i1(\u_vram/axis_x_d2 ),
    .o(\u_vram/n10 ));  // sources/rtl/vga/vram.v(131)
  lt_u11_u11 \u_vram/lt2  (
    .ci(1'b0),
    .i0(\u_vram/axis_y_d2 ),
    .i1(11'b00000100000),
    .o(\u_vram/n12 ));  // sources/rtl/vga/vram.v(131)
  lt_u11_u11 \u_vram/lt3  (
    .ci(1'b0),
    .i0(11'b00111000000),
    .i1(\u_vram/axis_y_d2 ),
    .o(\u_vram/n14 ));  // sources/rtl/vga/vram.v(131)
  mult_u5_u4_o7 \u_vram/mult0  (
    .i0(\u_vram/mesh_y ),
    .i1(4'b1001),
    .o(\u_vram/n5 [7:1]));  // sources/rtl/vga/vram.v(87)
  binary_mux_s1_w1 \u_vram/mux0_b10  (
    .i0(\u_vram/state ),
    .i1(1'b0),
    .sel(\u_vram/n25 ),
    .o(\u_vram/n26 [10]));  // sources/rtl/vga/vram.v(140)
  binary_mux_s1_w1 \u_vram/mux0_b11  (
    .i0(1'b0),
    .i1(1'b1),
    .sel(\u_vram/n25 ),
    .o(\u_vram/n26 [11]));  // sources/rtl/vga/vram.v(140)
  and \u_vram/mux1_b13_sel_is_0  (\u_vram/mux1_b13_sel_is_0_o , \u_vram/n22_neg , \u_vram/n25_neg );
  and \u_vram/mux2_b10_sel_is_0  (\u_vram/mux2_b10_sel_is_0_o , \u_vram/n15_neg , \u_vram/n22_neg );
  and \u_vram/mux2_b14_sel_is_2  (\u_vram/mux2_b14_sel_is_2_o , \u_vram/n15_neg , \u_vram/n22 );
  and \u_vram/mux3_b10_sel_is_3  (\u_vram/mux3_b10_sel_is_3_o , \u_vram/axis_en_d2 , \u_vram/mux2_b10_sel_is_0_o );
  and \u_vram/mux3_b12_sel_is_1  (\u_vram/mux3_b12_sel_is_1_o , \u_vram/axis_en_d2 , \u_vram/n15_neg );
  and \u_vram/mux3_b14_sel_is_3  (\u_vram/mux3_b14_sel_is_3_o , \u_vram/axis_en_d2 , \u_vram/mux2_b14_sel_is_2_o );
  not \u_vram/n15_inv  (\u_vram/n15_neg , \u_vram/n15 );
  not \u_vram/n22_inv  (\u_vram/n22_neg , \u_vram/n22 );
  not \u_vram/n25_inv  (\u_vram/n25_neg , \u_vram/n25 );
  EG_LOGIC_BRAM #(
    //.FORCE_KEEP("OFF"),
    //.INIT_FILE("NONE"),
    .ADDR_WIDTH_A(8),
    .ADDR_WIDTH_B(8),
    .BYTE_A(1),
    .BYTE_B(1),
    .BYTE_ENABLE(0),
    .DATA_DEPTH_A(256),
    .DATA_DEPTH_B(256),
    .DATA_WIDTH_A(1),
    .DATA_WIDTH_B(1),
    .DEBUGGABLE("NO"),
    .FILL_ALL("NONE"),
    .IMPLEMENT("9K"),
    .MODE("DP"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("READBEFOREWRITE"))
    \u_vram/ram_vga_ram0  (
    .addra(vram_addr),
    .addrb(vram_addr),
    .cea(vram_ren),
    .ceb(1'b1),
    .clka(vga_clk),
    .clkb(vga_clk),
    .dia(1'b0),
    .dib(vram_wdata),
    .ocea(1'b1),
    .oceb(1'b1),
    .rsta(1'b0),
    .rstb(1'b0),
    .wea(1'b0),
    .web(vram_wen),
    .doa(vram_rdata));  // sources/rtl/vga/vram.v(50)
  EG_LOGIC_BRAM #(
    //.FORCE_KEEP("OFF"),
    //.INIT_FILE("NONE"),
    .ADDR_WIDTH_A(8),
    .ADDR_WIDTH_B(8),
    .BYTE_A(1),
    .BYTE_B(1),
    .BYTE_ENABLE(0),
    .DATA_DEPTH_A(256),
    .DATA_DEPTH_B(256),
    .DATA_WIDTH_A(1),
    .DATA_WIDTH_B(1),
    .DEBUGGABLE("NO"),
    .FILL_ALL("NONE"),
    .IMPLEMENT("9K"),
    .MODE("DP"),
    .REGMODE_A("OUTREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("READBEFOREWRITE"))
    \u_vram/ram_vga_ram1  (
    .addra(\u_vram/n6 [7:0]),
    .addrb(vram_addr),
    .cea(1'b1),
    .ceb(1'b1),
    .clka(vga_clk),
    .clkb(vga_clk),
    .dia(1'b0),
    .dib(vram_wdata),
    .ocea(1'b1),
    .oceb(1'b1),
    .rsta(1'b0),
    .rstb(1'b0),
    .wea(1'b0),
    .web(vram_wen),
    .doa(\u_vram/state ));  // sources/rtl/vga/vram.v(50)
  reg_ar_as_w1 \u_vram/reg0_b0  (
    .clk(vga_clk),
    .d(\u_vram/n3 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/mesh_x [0]));  // sources/rtl/vga/vram.v(82)
  reg_ar_as_w1 \u_vram/reg0_b1  (
    .clk(vga_clk),
    .d(\u_vram/n3 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/mesh_x [1]));  // sources/rtl/vga/vram.v(82)
  reg_ar_as_w1 \u_vram/reg0_b2  (
    .clk(vga_clk),
    .d(\u_vram/n3 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/mesh_x [2]));  // sources/rtl/vga/vram.v(82)
  reg_ar_as_w1 \u_vram/reg0_b3  (
    .clk(vga_clk),
    .d(\u_vram/n3 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/mesh_x [3]));  // sources/rtl/vga/vram.v(82)
  reg_ar_as_w1 \u_vram/reg0_b4  (
    .clk(vga_clk),
    .d(\u_vram/n3 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/mesh_x [4]));  // sources/rtl/vga/vram.v(82)
  reg_ar_as_w1 \u_vram/reg1_b0  (
    .clk(vga_clk),
    .d(\u_vram/n4 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/mesh_y [0]));  // sources/rtl/vga/vram.v(82)
  reg_ar_as_w1 \u_vram/reg1_b1  (
    .clk(vga_clk),
    .d(\u_vram/n4 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/mesh_y [1]));  // sources/rtl/vga/vram.v(82)
  reg_ar_as_w1 \u_vram/reg1_b2  (
    .clk(vga_clk),
    .d(\u_vram/n4 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/mesh_y [2]));  // sources/rtl/vga/vram.v(82)
  reg_ar_as_w1 \u_vram/reg1_b3  (
    .clk(vga_clk),
    .d(\u_vram/n4 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/mesh_y [3]));  // sources/rtl/vga/vram.v(82)
  reg_ar_as_w1 \u_vram/reg1_b4  (
    .clk(vga_clk),
    .d(\u_vram/n4 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/mesh_y [4]));  // sources/rtl/vga/vram.v(82)
  reg_ar_as_w1 \u_vram/reg3_b0  (
    .clk(vga_clk),
    .d(axis_x[0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d0 [0]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg3_b1  (
    .clk(vga_clk),
    .d(axis_x[1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d0 [1]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg3_b10  (
    .clk(vga_clk),
    .d(axis_x[10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d0 [10]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg3_b2  (
    .clk(vga_clk),
    .d(axis_x[2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d0 [2]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg3_b3  (
    .clk(vga_clk),
    .d(axis_x[3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d0 [3]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg3_b4  (
    .clk(vga_clk),
    .d(axis_x[4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d0 [4]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg3_b5  (
    .clk(vga_clk),
    .d(axis_x[5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d0 [5]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg3_b6  (
    .clk(vga_clk),
    .d(axis_x[6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d0 [6]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg3_b7  (
    .clk(vga_clk),
    .d(axis_x[7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d0 [7]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg3_b8  (
    .clk(vga_clk),
    .d(axis_x[8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d0 [8]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg3_b9  (
    .clk(vga_clk),
    .d(axis_x[9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d0 [9]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg4_b0  (
    .clk(vga_clk),
    .d(axis_y[0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d0 [0]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg4_b1  (
    .clk(vga_clk),
    .d(axis_y[1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d0 [1]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg4_b10  (
    .clk(vga_clk),
    .d(axis_y[10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d0 [10]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg4_b2  (
    .clk(vga_clk),
    .d(axis_y[2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d0 [2]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg4_b3  (
    .clk(vga_clk),
    .d(axis_y[3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d0 [3]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg4_b4  (
    .clk(vga_clk),
    .d(axis_y[4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d0 [4]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg4_b5  (
    .clk(vga_clk),
    .d(axis_y[5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d0 [5]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg4_b6  (
    .clk(vga_clk),
    .d(axis_y[6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d0 [6]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg4_b7  (
    .clk(vga_clk),
    .d(axis_y[7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d0 [7]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg4_b8  (
    .clk(vga_clk),
    .d(axis_y[8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d0 [8]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg4_b9  (
    .clk(vga_clk),
    .d(axis_y[9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d0 [9]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg5_b0  (
    .clk(vga_clk),
    .d(\u_vram/axis_x_d0 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d1 [0]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg5_b1  (
    .clk(vga_clk),
    .d(\u_vram/axis_x_d0 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d1 [1]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg5_b10  (
    .clk(vga_clk),
    .d(\u_vram/axis_x_d0 [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d1 [10]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg5_b2  (
    .clk(vga_clk),
    .d(\u_vram/axis_x_d0 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d1 [2]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg5_b3  (
    .clk(vga_clk),
    .d(\u_vram/axis_x_d0 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d1 [3]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg5_b4  (
    .clk(vga_clk),
    .d(\u_vram/axis_x_d0 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d1 [4]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg5_b5  (
    .clk(vga_clk),
    .d(\u_vram/axis_x_d0 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d1 [5]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg5_b6  (
    .clk(vga_clk),
    .d(\u_vram/axis_x_d0 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d1 [6]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg5_b7  (
    .clk(vga_clk),
    .d(\u_vram/axis_x_d0 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d1 [7]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg5_b8  (
    .clk(vga_clk),
    .d(\u_vram/axis_x_d0 [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d1 [8]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg5_b9  (
    .clk(vga_clk),
    .d(\u_vram/axis_x_d0 [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d1 [9]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg6_b0  (
    .clk(vga_clk),
    .d(\u_vram/axis_y_d0 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d1 [0]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg6_b1  (
    .clk(vga_clk),
    .d(\u_vram/axis_y_d0 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d1 [1]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg6_b10  (
    .clk(vga_clk),
    .d(\u_vram/axis_y_d0 [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d1 [10]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg6_b2  (
    .clk(vga_clk),
    .d(\u_vram/axis_y_d0 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d1 [2]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg6_b3  (
    .clk(vga_clk),
    .d(\u_vram/axis_y_d0 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d1 [3]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg6_b4  (
    .clk(vga_clk),
    .d(\u_vram/axis_y_d0 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d1 [4]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg6_b5  (
    .clk(vga_clk),
    .d(\u_vram/axis_y_d0 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d1 [5]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg6_b6  (
    .clk(vga_clk),
    .d(\u_vram/axis_y_d0 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d1 [6]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg6_b7  (
    .clk(vga_clk),
    .d(\u_vram/axis_y_d0 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d1 [7]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg6_b8  (
    .clk(vga_clk),
    .d(\u_vram/axis_y_d0 [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d1 [8]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg6_b9  (
    .clk(vga_clk),
    .d(\u_vram/axis_y_d0 [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d1 [9]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg7_b0  (
    .clk(vga_clk),
    .d(\u_vram/axis_x_d1 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d2 [0]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg7_b1  (
    .clk(vga_clk),
    .d(\u_vram/axis_x_d1 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d2 [1]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg7_b10  (
    .clk(vga_clk),
    .d(\u_vram/axis_x_d1 [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d2 [10]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg7_b2  (
    .clk(vga_clk),
    .d(\u_vram/axis_x_d1 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d2 [2]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg7_b3  (
    .clk(vga_clk),
    .d(\u_vram/axis_x_d1 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d2 [3]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg7_b4  (
    .clk(vga_clk),
    .d(\u_vram/axis_x_d1 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d2 [4]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg7_b5  (
    .clk(vga_clk),
    .d(\u_vram/axis_x_d1 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d2 [5]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg7_b6  (
    .clk(vga_clk),
    .d(\u_vram/axis_x_d1 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d2 [6]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg7_b7  (
    .clk(vga_clk),
    .d(\u_vram/axis_x_d1 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d2 [7]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg7_b8  (
    .clk(vga_clk),
    .d(\u_vram/axis_x_d1 [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d2 [8]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg7_b9  (
    .clk(vga_clk),
    .d(\u_vram/axis_x_d1 [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d2 [9]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg8_b0  (
    .clk(vga_clk),
    .d(\u_vram/axis_y_d1 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d2 [0]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg8_b1  (
    .clk(vga_clk),
    .d(\u_vram/axis_y_d1 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d2 [1]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg8_b10  (
    .clk(vga_clk),
    .d(\u_vram/axis_y_d1 [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d2 [10]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg8_b2  (
    .clk(vga_clk),
    .d(\u_vram/axis_y_d1 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d2 [2]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg8_b3  (
    .clk(vga_clk),
    .d(\u_vram/axis_y_d1 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d2 [3]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg8_b4  (
    .clk(vga_clk),
    .d(\u_vram/axis_y_d1 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d2 [4]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg8_b5  (
    .clk(vga_clk),
    .d(\u_vram/axis_y_d1 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d2 [5]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg8_b6  (
    .clk(vga_clk),
    .d(\u_vram/axis_y_d1 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d2 [6]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg8_b7  (
    .clk(vga_clk),
    .d(\u_vram/axis_y_d1 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d2 [7]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg8_b8  (
    .clk(vga_clk),
    .d(\u_vram/axis_y_d1 [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d2 [8]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg8_b9  (
    .clk(vga_clk),
    .d(\u_vram/axis_y_d1 [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d2 [9]));  // sources/rtl/vga/vram.v(110)
  reg_sr_as_w1 \u_vram/reg9_b10  (
    .clk(~vga_clk),
    .d(\u_vram/n26 [10]),
    .en(1'b1),
    .reset(~\u_vram/mux3_b10_sel_is_3_o ),
    .set(1'b0),
    .q(vga_rgb[19]));  // sources/rtl/vga/vram.v(144)
  reg_sr_as_w1 \u_vram/reg9_b11  (
    .clk(~vga_clk),
    .d(\u_vram/n25 ),
    .en(1'b1),
    .reset(~\u_vram/mux3_b10_sel_is_3_o ),
    .set(1'b0),
    .q(vga_rgb[11]));  // sources/rtl/vga/vram.v(144)
  reg_sr_ss_w1 \u_vram/reg9_b12  (
    .clk(~vga_clk),
    .d(\u_vram/n26 [10]),
    .en(1'b1),
    .reset(~\u_vram/mux3_b12_sel_is_1_o ),
    .set(\u_vram/n22 ),
    .q(vga_rgb[21]));  // sources/rtl/vga/vram.v(144)
  reg_sr_ss_w1 \u_vram/reg9_b13  (
    .clk(~vga_clk),
    .d(\u_vram/state ),
    .en(1'b1),
    .reset(~\u_vram/mux3_b12_sel_is_1_o ),
    .set(~\u_vram/mux1_b13_sel_is_0_o ),
    .q(vga_rgb[13]));  // sources/rtl/vga/vram.v(144)
  reg_sr_as_w1 \u_vram/reg9_b14  (
    .clk(~vga_clk),
    .d(1'b1),
    .en(1'b1),
    .reset(~\u_vram/mux3_b14_sel_is_3_o ),
    .set(1'b0),
    .q(vga_rgb[14]));  // sources/rtl/vga/vram.v(144)
  reg_sr_ss_w1 \u_vram/reg9_b20  (
    .clk(~vga_clk),
    .d(\u_vram/n26 [11]),
    .en(1'b1),
    .reset(~\u_vram/mux3_b12_sel_is_1_o ),
    .set(\u_vram/n22 ),
    .q(vga_rgb[22]));  // sources/rtl/vga/vram.v(144)
  add_pu5_mu5_o5 \u_vram/sub0  (
    .i0(axis_x[9:5]),
    .i1(5'b00001),
    .o(\u_vram/n3 [4:0]));  // sources/rtl/vga/vram.v(80)
  add_pu5_mu5_o5 \u_vram/sub1  (
    .i0(axis_y[9:5]),
    .i1(5'b00001),
    .o(\u_vram/n4 [4:0]));  // sources/rtl/vga/vram.v(81)
  or \u_vram/u10  (\u_vram/n22 , \u_vram/n20 , \u_vram/n21 );  // sources/rtl/vga/vram.v(133)
  or \u_vram/u11  (\u_vram/n25 , \u_vram/n23 , \u_vram/n24 );  // sources/rtl/vga/vram.v(135)
  or \u_vram/u5  (\u_vram/n11 , \u_vram/n9 , \u_vram/n10 );  // sources/rtl/vga/vram.v(131)
  or \u_vram/u6  (\u_vram/n13 , \u_vram/n11 , \u_vram/n12 );  // sources/rtl/vga/vram.v(131)
  or \u_vram/u7  (\u_vram/n15 , \u_vram/n13 , \u_vram/n14 );  // sources/rtl/vga/vram.v(131)
  or \u_vram/u8  (\u_vram/n18 , \u_vram/n16 , \u_vram/n17 );  // sources/rtl/vga/vram.v(133)
  or \u_vram/u9  (\u_vram/n20 , \u_vram/n18 , \u_vram/n19 );  // sources/rtl/vga/vram.v(133)
  reg_ar_as_w1 \u_vram/vs_i_d0_reg  (
    .clk(vga_clk),
    .d(vsyn),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/vs_i_d0 ));  // sources/rtl/vga/vram.v(123)
  reg_ar_as_w1 \u_vram/vs_i_d1_reg  (
    .clk(vga_clk),
    .d(\u_vram/vs_i_d0 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/vs_i_d1 ));  // sources/rtl/vga/vram.v(123)
  reg_ar_as_w1 \u_vram/vs_i_d2_reg  (
    .clk(vga_clk),
    .d(\u_vram/vs_i_d1 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/vs_i_d2 ));  // sources/rtl/vga/vram.v(123)
  reg_ar_as_w1 \u_vram/vs_o_reg  (
    .clk(~vga_clk),
    .d(\u_vram/vs_i_d2 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(vga_vs));  // sources/rtl/vga/vram.v(152)

endmodule 

module reg_ar_as_w1
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input d;
  input en;
  input reset;
  input set;
  output q;

  parameter REGSET = "RESET";
  wire enout;

  AL_MUX u_en0 (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_DFF #(
    .INI((REGSET == "SET") ? 1'b1 : 1'b0))
    u_seq0 (
    .clk(clk),
    .d(enout),
    .reset(reset),
    .set(set),
    .q(q));

endmodule 

module eq_w8
  (
  i0,
  i1,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  output o;

  wire \or_or_or_xor_i0[0]_i_o ;
  wire \or_or_xor_i0[0]_i1[0_o ;
  wire \or_or_xor_i0[4]_i1[4_o ;
  wire \or_xor_i0[0]_i1[0]_o_o ;
  wire \or_xor_i0[2]_i1[2]_o_o ;
  wire \or_xor_i0[4]_i1[4]_o_o ;
  wire \or_xor_i0[6]_i1[6]_o_o ;
  wire \xor_i0[0]_i1[0]_o ;
  wire \xor_i0[1]_i1[1]_o ;
  wire \xor_i0[2]_i1[2]_o ;
  wire \xor_i0[3]_i1[3]_o ;
  wire \xor_i0[4]_i1[4]_o ;
  wire \xor_i0[5]_i1[5]_o ;
  wire \xor_i0[6]_i1[6]_o ;
  wire \xor_i0[7]_i1[7]_o ;

  not none_diff (o, \or_or_or_xor_i0[0]_i_o );
  or \or_or_or_xor_i0[0]_i  (\or_or_or_xor_i0[0]_i_o , \or_or_xor_i0[0]_i1[0_o , \or_or_xor_i0[4]_i1[4_o );
  or \or_or_xor_i0[0]_i1[0  (\or_or_xor_i0[0]_i1[0_o , \or_xor_i0[0]_i1[0]_o_o , \or_xor_i0[2]_i1[2]_o_o );
  or \or_or_xor_i0[4]_i1[4  (\or_or_xor_i0[4]_i1[4_o , \or_xor_i0[4]_i1[4]_o_o , \or_xor_i0[6]_i1[6]_o_o );
  or \or_xor_i0[0]_i1[0]_o  (\or_xor_i0[0]_i1[0]_o_o , \xor_i0[0]_i1[0]_o , \xor_i0[1]_i1[1]_o );
  or \or_xor_i0[2]_i1[2]_o  (\or_xor_i0[2]_i1[2]_o_o , \xor_i0[2]_i1[2]_o , \xor_i0[3]_i1[3]_o );
  or \or_xor_i0[4]_i1[4]_o  (\or_xor_i0[4]_i1[4]_o_o , \xor_i0[4]_i1[4]_o , \xor_i0[5]_i1[5]_o );
  or \or_xor_i0[6]_i1[6]_o  (\or_xor_i0[6]_i1[6]_o_o , \xor_i0[6]_i1[6]_o , \xor_i0[7]_i1[7]_o );
  xor \xor_i0[0]_i1[0]  (\xor_i0[0]_i1[0]_o , i0[0], i1[0]);
  xor \xor_i0[1]_i1[1]  (\xor_i0[1]_i1[1]_o , i0[1], i1[1]);
  xor \xor_i0[2]_i1[2]  (\xor_i0[2]_i1[2]_o , i0[2], i1[2]);
  xor \xor_i0[3]_i1[3]  (\xor_i0[3]_i1[3]_o , i0[3], i1[3]);
  xor \xor_i0[4]_i1[4]  (\xor_i0[4]_i1[4]_o , i0[4], i1[4]);
  xor \xor_i0[5]_i1[5]  (\xor_i0[5]_i1[5]_o , i0[5], i1[5]);
  xor \xor_i0[6]_i1[6]  (\xor_i0[6]_i1[6]_o , i0[6], i1[6]);
  xor \xor_i0[7]_i1[7]  (\xor_i0[7]_i1[7]_o , i0[7], i1[7]);

endmodule 

module add_pu8_pu8_o9
  (
  i0,
  i1,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  output [8:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a2;
  wire net_a3;
  wire net_a4;
  wire net_a5;
  wire net_a6;
  wire net_a7;
  wire net_b0;
  wire net_b1;
  wire net_b2;
  wire net_b3;
  wire net_b4;
  wire net_b5;
  wire net_b6;
  wire net_b7;
  wire net_cout0;
  wire net_cout1;
  wire net_cout2;
  wire net_cout3;
  wire net_cout4;
  wire net_cout5;
  wire net_cout6;
  wire net_cout7;
  wire net_sum0;
  wire net_sum1;
  wire net_sum2;
  wire net_sum3;
  wire net_sum4;
  wire net_sum5;
  wire net_sum6;
  wire net_sum7;

  assign net_a7 = i0[7];
  assign net_a6 = i0[6];
  assign net_a5 = i0[5];
  assign net_a4 = i0[4];
  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b7 = i1[7];
  assign net_b6 = i1[6];
  assign net_b5 = i1[5];
  assign net_b4 = i1[4];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[8] = net_cout7;
  assign o[7] = net_sum7;
  assign o[6] = net_sum6;
  assign o[5] = net_sum5;
  assign o[4] = net_sum4;
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD comp_0 (
    .a(net_a0),
    .b(net_b0),
    .c(1'b0),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD comp_1 (
    .a(net_a1),
    .b(net_b1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD comp_2 (
    .a(net_a2),
    .b(net_b2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD comp_3 (
    .a(net_a3),
    .b(net_b3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  AL_FADD comp_4 (
    .a(net_a4),
    .b(net_b4),
    .c(net_cout3),
    .cout(net_cout4),
    .sum(net_sum4));
  AL_FADD comp_5 (
    .a(net_a5),
    .b(net_b5),
    .c(net_cout4),
    .cout(net_cout5),
    .sum(net_sum5));
  AL_FADD comp_6 (
    .a(net_a6),
    .b(net_b6),
    .c(net_cout5),
    .cout(net_cout6),
    .sum(net_sum6));
  AL_FADD comp_7 (
    .a(net_a7),
    .b(net_b7),
    .c(net_cout6),
    .cout(net_cout7),
    .sum(net_sum7));

endmodule 

module lt_u8_u8
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [7:0] i0;
  input [7:0] i1;
  output o;

  wire [7:0] diff;
  wire diff_6_7;
  wire less_6_7;
  wire \less_6_7_inst/diff_0 ;
  wire \less_6_7_inst/diff_1 ;
  wire \less_6_7_inst/o_0 ;
  wire o_0;
  wire o_1;
  wire o_2;
  wire o_3;
  wire o_4;
  wire o_5;

  or any_diff_6_7 (diff_6_7, diff[6], diff[7]);
  xor diff_0 (diff[0], i0[0], i1[0]);
  xor diff_1 (diff[1], i0[1], i1[1]);
  xor diff_2 (diff[2], i0[2], i1[2]);
  xor diff_3 (diff[3], i0[3], i1[3]);
  xor diff_4 (diff[4], i0[4], i1[4]);
  xor diff_5 (diff[5], i0[5], i1[5]);
  xor diff_6 (diff[6], i0[6], i1[6]);
  xor diff_7 (diff[7], i0[7], i1[7]);
  AL_MUX \less_6_7_inst/mux_0  (
    .i0(1'b0),
    .i1(i1[6]),
    .sel(\less_6_7_inst/diff_0 ),
    .o(\less_6_7_inst/o_0 ));
  AL_MUX \less_6_7_inst/mux_1  (
    .i0(\less_6_7_inst/o_0 ),
    .i1(i1[7]),
    .sel(\less_6_7_inst/diff_1 ),
    .o(less_6_7));
  xor \less_6_7_inst/xor_0  (\less_6_7_inst/diff_0 , i0[6], i1[6]);
  xor \less_6_7_inst/xor_1  (\less_6_7_inst/diff_1 , i0[7], i1[7]);
  AL_MUX mux_0 (
    .i0(ci),
    .i1(i1[0]),
    .sel(diff[0]),
    .o(o_0));
  AL_MUX mux_1 (
    .i0(o_0),
    .i1(i1[1]),
    .sel(diff[1]),
    .o(o_1));
  AL_MUX mux_2 (
    .i0(o_1),
    .i1(i1[2]),
    .sel(diff[2]),
    .o(o_2));
  AL_MUX mux_3 (
    .i0(o_2),
    .i1(i1[3]),
    .sel(diff[3]),
    .o(o_3));
  AL_MUX mux_4 (
    .i0(o_3),
    .i1(i1[4]),
    .sel(diff[4]),
    .o(o_4));
  AL_MUX mux_5 (
    .i0(o_4),
    .i1(i1[5]),
    .sel(diff[5]),
    .o(o_5));
  AL_MUX mux_6 (
    .i0(o_5),
    .i1(less_6_7),
    .sel(diff_6_7),
    .o(o));

endmodule 

module mult_u8_u8_o16
  (
  i0,
  i1,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  output [15:0] o;

  wire a0;
  wire a1;
  wire a2;
  wire a3;
  wire a4;
  wire a5;
  wire a6;
  wire a7;
  wire b0;
  wire b1;
  wire b2;
  wire b3;
  wire b4;
  wire b5;
  wire b6;
  wire b7;
  wire net_and_a0_b0;
  wire net_and_a0_b1;
  wire net_and_a0_b2;
  wire net_and_a0_b3;
  wire net_and_a0_b4;
  wire net_and_a0_b5;
  wire net_and_a0_b6;
  wire net_and_a0_b7;
  wire net_and_a1_b0;
  wire net_and_a1_b1;
  wire net_and_a1_b2;
  wire net_and_a1_b3;
  wire net_and_a1_b4;
  wire net_and_a1_b5;
  wire net_and_a1_b6;
  wire net_and_a1_b7;
  wire net_and_a2_b0;
  wire net_and_a2_b1;
  wire net_and_a2_b2;
  wire net_and_a2_b3;
  wire net_and_a2_b4;
  wire net_and_a2_b5;
  wire net_and_a2_b6;
  wire net_and_a2_b7;
  wire net_and_a3_b0;
  wire net_and_a3_b1;
  wire net_and_a3_b2;
  wire net_and_a3_b3;
  wire net_and_a3_b4;
  wire net_and_a3_b5;
  wire net_and_a3_b6;
  wire net_and_a3_b7;
  wire net_and_a4_b0;
  wire net_and_a4_b1;
  wire net_and_a4_b2;
  wire net_and_a4_b3;
  wire net_and_a4_b4;
  wire net_and_a4_b5;
  wire net_and_a4_b6;
  wire net_and_a4_b7;
  wire net_and_a5_b0;
  wire net_and_a5_b1;
  wire net_and_a5_b2;
  wire net_and_a5_b3;
  wire net_and_a5_b4;
  wire net_and_a5_b5;
  wire net_and_a5_b6;
  wire net_and_a5_b7;
  wire net_and_a6_b0;
  wire net_and_a6_b1;
  wire net_and_a6_b2;
  wire net_and_a6_b3;
  wire net_and_a6_b4;
  wire net_and_a6_b5;
  wire net_and_a6_b6;
  wire net_and_a6_b7;
  wire net_and_a7_b0;
  wire net_and_a7_b1;
  wire net_and_a7_b2;
  wire net_and_a7_b3;
  wire net_and_a7_b4;
  wire net_and_a7_b5;
  wire net_and_a7_b6;
  wire net_and_a7_b7;
  wire o_0;
  wire o_1;
  wire o_10;
  wire o_11;
  wire o_12;
  wire o_13;
  wire o_14;
  wire o_15;
  wire o_2;
  wire o_3;
  wire o_4;
  wire o_5;
  wire o_6;
  wire o_7;
  wire o_8;
  wire o_9;

  assign a7 = i0[7];
  assign a6 = i0[6];
  assign a5 = i0[5];
  assign a4 = i0[4];
  assign a3 = i0[3];
  assign a2 = i0[2];
  assign a1 = i0[1];
  assign a0 = i0[0];
  assign b7 = i1[7];
  assign b6 = i1[6];
  assign b5 = i1[5];
  assign b4 = i1[4];
  assign b3 = i1[3];
  assign b2 = i1[2];
  assign b1 = i1[1];
  assign b0 = i1[0];
  assign o[15] = o_15;
  assign o[14] = o_14;
  assign o[13] = o_13;
  assign o[12] = o_12;
  assign o[11] = o_11;
  assign o[10] = o_10;
  assign o[9] = o_9;
  assign o[8] = o_8;
  assign o[7] = o_7;
  assign o[6] = o_6;
  assign o[5] = o_5;
  assign o[4] = o_4;
  assign o[3] = o_3;
  assign o[2] = o_2;
  assign o[1] = o_1;
  assign o[0] = o_0;
  and and_a0_b0 (net_and_a0_b0, a0, b0);
  and and_a0_b1 (net_and_a0_b1, a0, b1);
  and and_a0_b2 (net_and_a0_b2, a0, b2);
  and and_a0_b3 (net_and_a0_b3, a0, b3);
  and and_a0_b4 (net_and_a0_b4, a0, b4);
  and and_a0_b5 (net_and_a0_b5, a0, b5);
  and and_a0_b6 (net_and_a0_b6, a0, b6);
  and and_a0_b7 (net_and_a0_b7, a0, b7);
  and and_a1_b0 (net_and_a1_b0, a1, b0);
  and and_a1_b1 (net_and_a1_b1, a1, b1);
  and and_a1_b2 (net_and_a1_b2, a1, b2);
  and and_a1_b3 (net_and_a1_b3, a1, b3);
  and and_a1_b4 (net_and_a1_b4, a1, b4);
  and and_a1_b5 (net_and_a1_b5, a1, b5);
  and and_a1_b6 (net_and_a1_b6, a1, b6);
  and and_a1_b7 (net_and_a1_b7, a1, b7);
  and and_a2_b0 (net_and_a2_b0, a2, b0);
  and and_a2_b1 (net_and_a2_b1, a2, b1);
  and and_a2_b2 (net_and_a2_b2, a2, b2);
  and and_a2_b3 (net_and_a2_b3, a2, b3);
  and and_a2_b4 (net_and_a2_b4, a2, b4);
  and and_a2_b5 (net_and_a2_b5, a2, b5);
  and and_a2_b6 (net_and_a2_b6, a2, b6);
  and and_a2_b7 (net_and_a2_b7, a2, b7);
  and and_a3_b0 (net_and_a3_b0, a3, b0);
  and and_a3_b1 (net_and_a3_b1, a3, b1);
  and and_a3_b2 (net_and_a3_b2, a3, b2);
  and and_a3_b3 (net_and_a3_b3, a3, b3);
  and and_a3_b4 (net_and_a3_b4, a3, b4);
  and and_a3_b5 (net_and_a3_b5, a3, b5);
  and and_a3_b6 (net_and_a3_b6, a3, b6);
  and and_a3_b7 (net_and_a3_b7, a3, b7);
  and and_a4_b0 (net_and_a4_b0, a4, b0);
  and and_a4_b1 (net_and_a4_b1, a4, b1);
  and and_a4_b2 (net_and_a4_b2, a4, b2);
  and and_a4_b3 (net_and_a4_b3, a4, b3);
  and and_a4_b4 (net_and_a4_b4, a4, b4);
  and and_a4_b5 (net_and_a4_b5, a4, b5);
  and and_a4_b6 (net_and_a4_b6, a4, b6);
  and and_a4_b7 (net_and_a4_b7, a4, b7);
  and and_a5_b0 (net_and_a5_b0, a5, b0);
  and and_a5_b1 (net_and_a5_b1, a5, b1);
  and and_a5_b2 (net_and_a5_b2, a5, b2);
  and and_a5_b3 (net_and_a5_b3, a5, b3);
  and and_a5_b4 (net_and_a5_b4, a5, b4);
  and and_a5_b5 (net_and_a5_b5, a5, b5);
  and and_a5_b6 (net_and_a5_b6, a5, b6);
  and and_a5_b7 (net_and_a5_b7, a5, b7);
  and and_a6_b0 (net_and_a6_b0, a6, b0);
  and and_a6_b1 (net_and_a6_b1, a6, b1);
  and and_a6_b2 (net_and_a6_b2, a6, b2);
  and and_a6_b3 (net_and_a6_b3, a6, b3);
  and and_a6_b4 (net_and_a6_b4, a6, b4);
  and and_a6_b5 (net_and_a6_b5, a6, b5);
  and and_a6_b6 (net_and_a6_b6, a6, b6);
  and and_a6_b7 (net_and_a6_b7, a6, b7);
  and and_a7_b0 (net_and_a7_b0, a7, b0);
  and and_a7_b1 (net_and_a7_b1, a7, b1);
  and and_a7_b2 (net_and_a7_b2, a7, b2);
  and and_a7_b3 (net_and_a7_b3, a7, b3);
  and and_a7_b4 (net_and_a7_b4, a7, b4);
  and and_a7_b5 (net_and_a7_b5, a7, b5);
  and and_a7_b6 (net_and_a7_b6, a7, b6);
  and and_a7_b7 (net_and_a7_b7, a7, b7);
  add_pu15_pu14_pu13_pu12_pu11_pu10_pu9_pu8_o16 sum (
    .i0({net_and_a7_b7,net_and_a7_b6,net_and_a7_b5,net_and_a7_b4,net_and_a7_b3,net_and_a7_b2,net_and_a7_b1,net_and_a7_b0,net_and_a6_b0,net_and_a5_b0,net_and_a4_b0,net_and_a3_b0,net_and_a2_b0,net_and_a1_b0,net_and_a0_b0}),
    .i1({net_and_a6_b7,net_and_a6_b6,net_and_a6_b5,net_and_a6_b4,net_and_a6_b3,net_and_a6_b2,net_and_a6_b1,net_and_a5_b1,net_and_a4_b1,net_and_a3_b1,net_and_a2_b1,net_and_a1_b1,net_and_a0_b1,1'b0}),
    .i2({net_and_a5_b7,net_and_a5_b6,net_and_a5_b5,net_and_a5_b4,net_and_a5_b3,net_and_a5_b2,net_and_a4_b2,net_and_a3_b2,net_and_a2_b2,net_and_a1_b2,net_and_a0_b2,2'b00}),
    .i3({net_and_a4_b7,net_and_a4_b6,net_and_a4_b5,net_and_a4_b4,net_and_a4_b3,net_and_a3_b3,net_and_a2_b3,net_and_a1_b3,net_and_a0_b3,3'b000}),
    .i4({net_and_a3_b7,net_and_a3_b6,net_and_a3_b5,net_and_a3_b4,net_and_a2_b4,net_and_a1_b4,net_and_a0_b4,4'b0000}),
    .i5({net_and_a2_b7,net_and_a2_b6,net_and_a2_b5,net_and_a1_b5,net_and_a0_b5,5'b00000}),
    .i6({net_and_a1_b7,net_and_a1_b6,net_and_a0_b6,6'b000000}),
    .i7({net_and_a0_b7,7'b0000000}),
    .o({o_15,o_14,o_13,o_12,o_11,o_10,o_9,o_8,o_7,o_6,o_5,o_4,o_3,o_2,o_1,o_0}));

endmodule 

module binary_mux_s1_w1
  (
  i0,
  i1,
  sel,
  o
  );

  input i0;
  input i1;
  input sel;
  output o;


  AL_MUX al_mux_b0_0_0 (
    .i0(i0),
    .i1(i1),
    .sel(sel),
    .o(o));

endmodule 

module reg_sr_as_w1
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input d;
  input en;
  input reset;
  input set;
  output q;

  parameter REGSET = "RESET";
  wire enout;
  wire resetout;

  AL_MUX u_en0 (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_MUX u_reset0 (
    .i0(enout),
    .i1(1'b0),
    .sel(reset),
    .o(resetout));
  AL_DFF #(
    .INI((REGSET == "SET") ? 1'b1 : 1'b0))
    u_seq0 (
    .clk(clk),
    .d(resetout),
    .reset(1'b0),
    .set(set),
    .q(q));

endmodule 

module add_pu8_mu8_o9
  (
  i0,
  i1,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  output [8:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a2;
  wire net_a3;
  wire net_a4;
  wire net_a5;
  wire net_a6;
  wire net_a7;
  wire net_b0;
  wire net_b1;
  wire net_b2;
  wire net_b3;
  wire net_b4;
  wire net_b5;
  wire net_b6;
  wire net_b7;
  wire net_cout0;
  wire net_cout1;
  wire net_cout2;
  wire net_cout3;
  wire net_cout4;
  wire net_cout5;
  wire net_cout6;
  wire net_cout7;
  wire net_nb0;
  wire net_nb1;
  wire net_nb2;
  wire net_nb3;
  wire net_nb4;
  wire net_nb5;
  wire net_nb6;
  wire net_nb7;
  wire net_ncout;
  wire net_sum0;
  wire net_sum1;
  wire net_sum2;
  wire net_sum3;
  wire net_sum4;
  wire net_sum5;
  wire net_sum6;
  wire net_sum7;

  assign net_a7 = i0[7];
  assign net_a6 = i0[6];
  assign net_a5 = i0[5];
  assign net_a4 = i0[4];
  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b7 = i1[7];
  assign net_b6 = i1[6];
  assign net_b5 = i1[5];
  assign net_b4 = i1[4];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[8] = net_ncout;
  assign o[7] = net_sum7;
  assign o[6] = net_sum6;
  assign o[5] = net_sum5;
  assign o[4] = net_sum4;
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD comp_0 (
    .a(net_a0),
    .b(net_nb0),
    .c(1'b1),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD comp_1 (
    .a(net_a1),
    .b(net_nb1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD comp_2 (
    .a(net_a2),
    .b(net_nb2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD comp_3 (
    .a(net_a3),
    .b(net_nb3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  AL_FADD comp_4 (
    .a(net_a4),
    .b(net_nb4),
    .c(net_cout3),
    .cout(net_cout4),
    .sum(net_sum4));
  AL_FADD comp_5 (
    .a(net_a5),
    .b(net_nb5),
    .c(net_cout4),
    .cout(net_cout5),
    .sum(net_sum5));
  AL_FADD comp_6 (
    .a(net_a6),
    .b(net_nb6),
    .c(net_cout5),
    .cout(net_cout6),
    .sum(net_sum6));
  AL_FADD comp_7 (
    .a(net_a7),
    .b(net_nb7),
    .c(net_cout6),
    .cout(net_cout7),
    .sum(net_sum7));
  not inv_b0 (net_nb0, net_b0);
  not inv_b1 (net_nb1, net_b1);
  not inv_b2 (net_nb2, net_b2);
  not inv_b3 (net_nb3, net_b3);
  not inv_b4 (net_nb4, net_b4);
  not inv_b5 (net_nb5, net_b5);
  not inv_b6 (net_nb6, net_b6);
  not inv_b7 (net_nb7, net_b7);
  not inv_cout (net_ncout, net_cout7);

endmodule 

module add_pu24_pu24_o24
  (
  i0,
  i1,
  o
  );

  input [23:0] i0;
  input [23:0] i1;
  output [23:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a10;
  wire net_a11;
  wire net_a12;
  wire net_a13;
  wire net_a14;
  wire net_a15;
  wire net_a16;
  wire net_a17;
  wire net_a18;
  wire net_a19;
  wire net_a2;
  wire net_a20;
  wire net_a21;
  wire net_a22;
  wire net_a23;
  wire net_a3;
  wire net_a4;
  wire net_a5;
  wire net_a6;
  wire net_a7;
  wire net_a8;
  wire net_a9;
  wire net_b0;
  wire net_b1;
  wire net_b10;
  wire net_b11;
  wire net_b12;
  wire net_b13;
  wire net_b14;
  wire net_b15;
  wire net_b16;
  wire net_b17;
  wire net_b18;
  wire net_b19;
  wire net_b2;
  wire net_b20;
  wire net_b21;
  wire net_b22;
  wire net_b23;
  wire net_b3;
  wire net_b4;
  wire net_b5;
  wire net_b6;
  wire net_b7;
  wire net_b8;
  wire net_b9;
  wire net_cout0;
  wire net_cout1;
  wire net_cout10;
  wire net_cout11;
  wire net_cout12;
  wire net_cout13;
  wire net_cout14;
  wire net_cout15;
  wire net_cout16;
  wire net_cout17;
  wire net_cout18;
  wire net_cout19;
  wire net_cout2;
  wire net_cout20;
  wire net_cout21;
  wire net_cout22;
  wire net_cout23;
  wire net_cout3;
  wire net_cout4;
  wire net_cout5;
  wire net_cout6;
  wire net_cout7;
  wire net_cout8;
  wire net_cout9;
  wire net_sum0;
  wire net_sum1;
  wire net_sum10;
  wire net_sum11;
  wire net_sum12;
  wire net_sum13;
  wire net_sum14;
  wire net_sum15;
  wire net_sum16;
  wire net_sum17;
  wire net_sum18;
  wire net_sum19;
  wire net_sum2;
  wire net_sum20;
  wire net_sum21;
  wire net_sum22;
  wire net_sum23;
  wire net_sum3;
  wire net_sum4;
  wire net_sum5;
  wire net_sum6;
  wire net_sum7;
  wire net_sum8;
  wire net_sum9;

  assign net_a23 = i0[23];
  assign net_a22 = i0[22];
  assign net_a21 = i0[21];
  assign net_a20 = i0[20];
  assign net_a19 = i0[19];
  assign net_a18 = i0[18];
  assign net_a17 = i0[17];
  assign net_a16 = i0[16];
  assign net_a15 = i0[15];
  assign net_a14 = i0[14];
  assign net_a13 = i0[13];
  assign net_a12 = i0[12];
  assign net_a11 = i0[11];
  assign net_a10 = i0[10];
  assign net_a9 = i0[9];
  assign net_a8 = i0[8];
  assign net_a7 = i0[7];
  assign net_a6 = i0[6];
  assign net_a5 = i0[5];
  assign net_a4 = i0[4];
  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b23 = i1[23];
  assign net_b22 = i1[22];
  assign net_b21 = i1[21];
  assign net_b20 = i1[20];
  assign net_b19 = i1[19];
  assign net_b18 = i1[18];
  assign net_b17 = i1[17];
  assign net_b16 = i1[16];
  assign net_b15 = i1[15];
  assign net_b14 = i1[14];
  assign net_b13 = i1[13];
  assign net_b12 = i1[12];
  assign net_b11 = i1[11];
  assign net_b10 = i1[10];
  assign net_b9 = i1[9];
  assign net_b8 = i1[8];
  assign net_b7 = i1[7];
  assign net_b6 = i1[6];
  assign net_b5 = i1[5];
  assign net_b4 = i1[4];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[23] = net_sum23;
  assign o[22] = net_sum22;
  assign o[21] = net_sum21;
  assign o[20] = net_sum20;
  assign o[19] = net_sum19;
  assign o[18] = net_sum18;
  assign o[17] = net_sum17;
  assign o[16] = net_sum16;
  assign o[15] = net_sum15;
  assign o[14] = net_sum14;
  assign o[13] = net_sum13;
  assign o[12] = net_sum12;
  assign o[11] = net_sum11;
  assign o[10] = net_sum10;
  assign o[9] = net_sum9;
  assign o[8] = net_sum8;
  assign o[7] = net_sum7;
  assign o[6] = net_sum6;
  assign o[5] = net_sum5;
  assign o[4] = net_sum4;
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD comp_0 (
    .a(net_a0),
    .b(net_b0),
    .c(1'b0),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD comp_1 (
    .a(net_a1),
    .b(net_b1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD comp_10 (
    .a(net_a10),
    .b(net_b10),
    .c(net_cout9),
    .cout(net_cout10),
    .sum(net_sum10));
  AL_FADD comp_11 (
    .a(net_a11),
    .b(net_b11),
    .c(net_cout10),
    .cout(net_cout11),
    .sum(net_sum11));
  AL_FADD comp_12 (
    .a(net_a12),
    .b(net_b12),
    .c(net_cout11),
    .cout(net_cout12),
    .sum(net_sum12));
  AL_FADD comp_13 (
    .a(net_a13),
    .b(net_b13),
    .c(net_cout12),
    .cout(net_cout13),
    .sum(net_sum13));
  AL_FADD comp_14 (
    .a(net_a14),
    .b(net_b14),
    .c(net_cout13),
    .cout(net_cout14),
    .sum(net_sum14));
  AL_FADD comp_15 (
    .a(net_a15),
    .b(net_b15),
    .c(net_cout14),
    .cout(net_cout15),
    .sum(net_sum15));
  AL_FADD comp_16 (
    .a(net_a16),
    .b(net_b16),
    .c(net_cout15),
    .cout(net_cout16),
    .sum(net_sum16));
  AL_FADD comp_17 (
    .a(net_a17),
    .b(net_b17),
    .c(net_cout16),
    .cout(net_cout17),
    .sum(net_sum17));
  AL_FADD comp_18 (
    .a(net_a18),
    .b(net_b18),
    .c(net_cout17),
    .cout(net_cout18),
    .sum(net_sum18));
  AL_FADD comp_19 (
    .a(net_a19),
    .b(net_b19),
    .c(net_cout18),
    .cout(net_cout19),
    .sum(net_sum19));
  AL_FADD comp_2 (
    .a(net_a2),
    .b(net_b2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD comp_20 (
    .a(net_a20),
    .b(net_b20),
    .c(net_cout19),
    .cout(net_cout20),
    .sum(net_sum20));
  AL_FADD comp_21 (
    .a(net_a21),
    .b(net_b21),
    .c(net_cout20),
    .cout(net_cout21),
    .sum(net_sum21));
  AL_FADD comp_22 (
    .a(net_a22),
    .b(net_b22),
    .c(net_cout21),
    .cout(net_cout22),
    .sum(net_sum22));
  AL_FADD comp_23 (
    .a(net_a23),
    .b(net_b23),
    .c(net_cout22),
    .cout(net_cout23),
    .sum(net_sum23));
  AL_FADD comp_3 (
    .a(net_a3),
    .b(net_b3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  AL_FADD comp_4 (
    .a(net_a4),
    .b(net_b4),
    .c(net_cout3),
    .cout(net_cout4),
    .sum(net_sum4));
  AL_FADD comp_5 (
    .a(net_a5),
    .b(net_b5),
    .c(net_cout4),
    .cout(net_cout5),
    .sum(net_sum5));
  AL_FADD comp_6 (
    .a(net_a6),
    .b(net_b6),
    .c(net_cout5),
    .cout(net_cout6),
    .sum(net_sum6));
  AL_FADD comp_7 (
    .a(net_a7),
    .b(net_b7),
    .c(net_cout6),
    .cout(net_cout7),
    .sum(net_sum7));
  AL_FADD comp_8 (
    .a(net_a8),
    .b(net_b8),
    .c(net_cout7),
    .cout(net_cout8),
    .sum(net_sum8));
  AL_FADD comp_9 (
    .a(net_a9),
    .b(net_b9),
    .c(net_cout8),
    .cout(net_cout9),
    .sum(net_sum9));

endmodule 

module add_pu12_pu12_o12
  (
  i0,
  i1,
  o
  );

  input [11:0] i0;
  input [11:0] i1;
  output [11:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a10;
  wire net_a11;
  wire net_a2;
  wire net_a3;
  wire net_a4;
  wire net_a5;
  wire net_a6;
  wire net_a7;
  wire net_a8;
  wire net_a9;
  wire net_b0;
  wire net_b1;
  wire net_b10;
  wire net_b11;
  wire net_b2;
  wire net_b3;
  wire net_b4;
  wire net_b5;
  wire net_b6;
  wire net_b7;
  wire net_b8;
  wire net_b9;
  wire net_cout0;
  wire net_cout1;
  wire net_cout10;
  wire net_cout11;
  wire net_cout2;
  wire net_cout3;
  wire net_cout4;
  wire net_cout5;
  wire net_cout6;
  wire net_cout7;
  wire net_cout8;
  wire net_cout9;
  wire net_sum0;
  wire net_sum1;
  wire net_sum10;
  wire net_sum11;
  wire net_sum2;
  wire net_sum3;
  wire net_sum4;
  wire net_sum5;
  wire net_sum6;
  wire net_sum7;
  wire net_sum8;
  wire net_sum9;

  assign net_a11 = i0[11];
  assign net_a10 = i0[10];
  assign net_a9 = i0[9];
  assign net_a8 = i0[8];
  assign net_a7 = i0[7];
  assign net_a6 = i0[6];
  assign net_a5 = i0[5];
  assign net_a4 = i0[4];
  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b11 = i1[11];
  assign net_b10 = i1[10];
  assign net_b9 = i1[9];
  assign net_b8 = i1[8];
  assign net_b7 = i1[7];
  assign net_b6 = i1[6];
  assign net_b5 = i1[5];
  assign net_b4 = i1[4];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[11] = net_sum11;
  assign o[10] = net_sum10;
  assign o[9] = net_sum9;
  assign o[8] = net_sum8;
  assign o[7] = net_sum7;
  assign o[6] = net_sum6;
  assign o[5] = net_sum5;
  assign o[4] = net_sum4;
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD comp_0 (
    .a(net_a0),
    .b(net_b0),
    .c(1'b0),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD comp_1 (
    .a(net_a1),
    .b(net_b1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD comp_10 (
    .a(net_a10),
    .b(net_b10),
    .c(net_cout9),
    .cout(net_cout10),
    .sum(net_sum10));
  AL_FADD comp_11 (
    .a(net_a11),
    .b(net_b11),
    .c(net_cout10),
    .cout(net_cout11),
    .sum(net_sum11));
  AL_FADD comp_2 (
    .a(net_a2),
    .b(net_b2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD comp_3 (
    .a(net_a3),
    .b(net_b3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  AL_FADD comp_4 (
    .a(net_a4),
    .b(net_b4),
    .c(net_cout3),
    .cout(net_cout4),
    .sum(net_sum4));
  AL_FADD comp_5 (
    .a(net_a5),
    .b(net_b5),
    .c(net_cout4),
    .cout(net_cout5),
    .sum(net_sum5));
  AL_FADD comp_6 (
    .a(net_a6),
    .b(net_b6),
    .c(net_cout5),
    .cout(net_cout6),
    .sum(net_sum6));
  AL_FADD comp_7 (
    .a(net_a7),
    .b(net_b7),
    .c(net_cout6),
    .cout(net_cout7),
    .sum(net_sum7));
  AL_FADD comp_8 (
    .a(net_a8),
    .b(net_b8),
    .c(net_cout7),
    .cout(net_cout8),
    .sum(net_sum8));
  AL_FADD comp_9 (
    .a(net_a9),
    .b(net_b9),
    .c(net_cout8),
    .cout(net_cout9),
    .sum(net_sum9));

endmodule 

module reg_sr_ss_w1
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input d;
  input en;
  input reset;
  input set;
  output q;

  parameter REGSET = "RESET";
  wire enout;
  wire resetout;
  wire setout;

  AL_MUX u_en0 (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_MUX u_reset0 (
    .i0(setout),
    .i1(1'b0),
    .sel(reset),
    .o(resetout));
  AL_DFF #(
    .INI((REGSET == "SET") ? 1'b1 : 1'b0))
    u_seq0 (
    .clk(clk),
    .d(resetout),
    .reset(1'b0),
    .set(1'b0),
    .q(q));
  AL_MUX u_set0 (
    .i0(enout),
    .i1(1'b1),
    .sel(set),
    .o(setout));

endmodule 

module reg_ar_ss_w1
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input d;
  input en;
  input reset;
  input set;
  output q;

  parameter REGSET = "RESET";
  wire enout;
  wire setout;

  AL_MUX u_en0 (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_DFF #(
    .INI((REGSET == "SET") ? 1'b1 : 1'b0))
    u_seq0 (
    .clk(clk),
    .d(setout),
    .reset(reset),
    .set(1'b0),
    .q(q));
  AL_MUX u_set0 (
    .i0(enout),
    .i1(1'b1),
    .sel(set),
    .o(setout));

endmodule 

module eq_w24
  (
  i0,
  i1,
  o
  );

  input [23:0] i0;
  input [23:0] i1;
  output o;

  wire \or_or_or_or_xor_i0[0_o ;
  wire \or_or_or_xor_i0[0]_i_o ;
  wire \or_or_or_xor_i0[12]__o ;
  wire \or_or_xor_i0[0]_i1[0_o ;
  wire \or_or_xor_i0[12]_i1[_o ;
  wire \or_or_xor_i0[18]_i1[_o ;
  wire \or_or_xor_i0[6]_i1[6_o ;
  wire \or_xor_i0[0]_i1[0]_o_o ;
  wire \or_xor_i0[10]_i1[10]_o ;
  wire \or_xor_i0[12]_i1[12]_o ;
  wire \or_xor_i0[13]_i1[13]_o ;
  wire \or_xor_i0[15]_i1[15]_o ;
  wire \or_xor_i0[16]_i1[16]_o ;
  wire \or_xor_i0[18]_i1[18]_o ;
  wire \or_xor_i0[19]_i1[19]_o ;
  wire \or_xor_i0[1]_i1[1]_o_o ;
  wire \or_xor_i0[21]_i1[21]_o ;
  wire \or_xor_i0[22]_i1[22]_o ;
  wire \or_xor_i0[3]_i1[3]_o_o ;
  wire \or_xor_i0[4]_i1[4]_o_o ;
  wire \or_xor_i0[6]_i1[6]_o_o ;
  wire \or_xor_i0[7]_i1[7]_o_o ;
  wire \or_xor_i0[9]_i1[9]_o_o ;
  wire \xor_i0[0]_i1[0]_o ;
  wire \xor_i0[10]_i1[10]_o ;
  wire \xor_i0[11]_i1[11]_o ;
  wire \xor_i0[12]_i1[12]_o ;
  wire \xor_i0[13]_i1[13]_o ;
  wire \xor_i0[14]_i1[14]_o ;
  wire \xor_i0[15]_i1[15]_o ;
  wire \xor_i0[16]_i1[16]_o ;
  wire \xor_i0[17]_i1[17]_o ;
  wire \xor_i0[18]_i1[18]_o ;
  wire \xor_i0[19]_i1[19]_o ;
  wire \xor_i0[1]_i1[1]_o ;
  wire \xor_i0[20]_i1[20]_o ;
  wire \xor_i0[21]_i1[21]_o ;
  wire \xor_i0[22]_i1[22]_o ;
  wire \xor_i0[23]_i1[23]_o ;
  wire \xor_i0[2]_i1[2]_o ;
  wire \xor_i0[3]_i1[3]_o ;
  wire \xor_i0[4]_i1[4]_o ;
  wire \xor_i0[5]_i1[5]_o ;
  wire \xor_i0[6]_i1[6]_o ;
  wire \xor_i0[7]_i1[7]_o ;
  wire \xor_i0[8]_i1[8]_o ;
  wire \xor_i0[9]_i1[9]_o ;

  not none_diff (o, \or_or_or_or_xor_i0[0_o );
  or \or_or_or_or_xor_i0[0  (\or_or_or_or_xor_i0[0_o , \or_or_or_xor_i0[0]_i_o , \or_or_or_xor_i0[12]__o );
  or \or_or_or_xor_i0[0]_i  (\or_or_or_xor_i0[0]_i_o , \or_or_xor_i0[0]_i1[0_o , \or_or_xor_i0[6]_i1[6_o );
  or \or_or_or_xor_i0[12]_  (\or_or_or_xor_i0[12]__o , \or_or_xor_i0[12]_i1[_o , \or_or_xor_i0[18]_i1[_o );
  or \or_or_xor_i0[0]_i1[0  (\or_or_xor_i0[0]_i1[0_o , \or_xor_i0[0]_i1[0]_o_o , \or_xor_i0[3]_i1[3]_o_o );
  or \or_or_xor_i0[12]_i1[  (\or_or_xor_i0[12]_i1[_o , \or_xor_i0[12]_i1[12]_o , \or_xor_i0[15]_i1[15]_o );
  or \or_or_xor_i0[18]_i1[  (\or_or_xor_i0[18]_i1[_o , \or_xor_i0[18]_i1[18]_o , \or_xor_i0[21]_i1[21]_o );
  or \or_or_xor_i0[6]_i1[6  (\or_or_xor_i0[6]_i1[6_o , \or_xor_i0[6]_i1[6]_o_o , \or_xor_i0[9]_i1[9]_o_o );
  or \or_xor_i0[0]_i1[0]_o  (\or_xor_i0[0]_i1[0]_o_o , \xor_i0[0]_i1[0]_o , \or_xor_i0[1]_i1[1]_o_o );
  or \or_xor_i0[10]_i1[10]  (\or_xor_i0[10]_i1[10]_o , \xor_i0[10]_i1[10]_o , \xor_i0[11]_i1[11]_o );
  or \or_xor_i0[12]_i1[12]  (\or_xor_i0[12]_i1[12]_o , \xor_i0[12]_i1[12]_o , \or_xor_i0[13]_i1[13]_o );
  or \or_xor_i0[13]_i1[13]  (\or_xor_i0[13]_i1[13]_o , \xor_i0[13]_i1[13]_o , \xor_i0[14]_i1[14]_o );
  or \or_xor_i0[15]_i1[15]  (\or_xor_i0[15]_i1[15]_o , \xor_i0[15]_i1[15]_o , \or_xor_i0[16]_i1[16]_o );
  or \or_xor_i0[16]_i1[16]  (\or_xor_i0[16]_i1[16]_o , \xor_i0[16]_i1[16]_o , \xor_i0[17]_i1[17]_o );
  or \or_xor_i0[18]_i1[18]  (\or_xor_i0[18]_i1[18]_o , \xor_i0[18]_i1[18]_o , \or_xor_i0[19]_i1[19]_o );
  or \or_xor_i0[19]_i1[19]  (\or_xor_i0[19]_i1[19]_o , \xor_i0[19]_i1[19]_o , \xor_i0[20]_i1[20]_o );
  or \or_xor_i0[1]_i1[1]_o  (\or_xor_i0[1]_i1[1]_o_o , \xor_i0[1]_i1[1]_o , \xor_i0[2]_i1[2]_o );
  or \or_xor_i0[21]_i1[21]  (\or_xor_i0[21]_i1[21]_o , \xor_i0[21]_i1[21]_o , \or_xor_i0[22]_i1[22]_o );
  or \or_xor_i0[22]_i1[22]  (\or_xor_i0[22]_i1[22]_o , \xor_i0[22]_i1[22]_o , \xor_i0[23]_i1[23]_o );
  or \or_xor_i0[3]_i1[3]_o  (\or_xor_i0[3]_i1[3]_o_o , \xor_i0[3]_i1[3]_o , \or_xor_i0[4]_i1[4]_o_o );
  or \or_xor_i0[4]_i1[4]_o  (\or_xor_i0[4]_i1[4]_o_o , \xor_i0[4]_i1[4]_o , \xor_i0[5]_i1[5]_o );
  or \or_xor_i0[6]_i1[6]_o  (\or_xor_i0[6]_i1[6]_o_o , \xor_i0[6]_i1[6]_o , \or_xor_i0[7]_i1[7]_o_o );
  or \or_xor_i0[7]_i1[7]_o  (\or_xor_i0[7]_i1[7]_o_o , \xor_i0[7]_i1[7]_o , \xor_i0[8]_i1[8]_o );
  or \or_xor_i0[9]_i1[9]_o  (\or_xor_i0[9]_i1[9]_o_o , \xor_i0[9]_i1[9]_o , \or_xor_i0[10]_i1[10]_o );
  xor \xor_i0[0]_i1[0]  (\xor_i0[0]_i1[0]_o , i0[0], i1[0]);
  xor \xor_i0[10]_i1[10]  (\xor_i0[10]_i1[10]_o , i0[10], i1[10]);
  xor \xor_i0[11]_i1[11]  (\xor_i0[11]_i1[11]_o , i0[11], i1[11]);
  xor \xor_i0[12]_i1[12]  (\xor_i0[12]_i1[12]_o , i0[12], i1[12]);
  xor \xor_i0[13]_i1[13]  (\xor_i0[13]_i1[13]_o , i0[13], i1[13]);
  xor \xor_i0[14]_i1[14]  (\xor_i0[14]_i1[14]_o , i0[14], i1[14]);
  xor \xor_i0[15]_i1[15]  (\xor_i0[15]_i1[15]_o , i0[15], i1[15]);
  xor \xor_i0[16]_i1[16]  (\xor_i0[16]_i1[16]_o , i0[16], i1[16]);
  xor \xor_i0[17]_i1[17]  (\xor_i0[17]_i1[17]_o , i0[17], i1[17]);
  xor \xor_i0[18]_i1[18]  (\xor_i0[18]_i1[18]_o , i0[18], i1[18]);
  xor \xor_i0[19]_i1[19]  (\xor_i0[19]_i1[19]_o , i0[19], i1[19]);
  xor \xor_i0[1]_i1[1]  (\xor_i0[1]_i1[1]_o , i0[1], i1[1]);
  xor \xor_i0[20]_i1[20]  (\xor_i0[20]_i1[20]_o , i0[20], i1[20]);
  xor \xor_i0[21]_i1[21]  (\xor_i0[21]_i1[21]_o , i0[21], i1[21]);
  xor \xor_i0[22]_i1[22]  (\xor_i0[22]_i1[22]_o , i0[22], i1[22]);
  xor \xor_i0[23]_i1[23]  (\xor_i0[23]_i1[23]_o , i0[23], i1[23]);
  xor \xor_i0[2]_i1[2]  (\xor_i0[2]_i1[2]_o , i0[2], i1[2]);
  xor \xor_i0[3]_i1[3]  (\xor_i0[3]_i1[3]_o , i0[3], i1[3]);
  xor \xor_i0[4]_i1[4]  (\xor_i0[4]_i1[4]_o , i0[4], i1[4]);
  xor \xor_i0[5]_i1[5]  (\xor_i0[5]_i1[5]_o , i0[5], i1[5]);
  xor \xor_i0[6]_i1[6]  (\xor_i0[6]_i1[6]_o , i0[6], i1[6]);
  xor \xor_i0[7]_i1[7]  (\xor_i0[7]_i1[7]_o , i0[7], i1[7]);
  xor \xor_i0[8]_i1[8]  (\xor_i0[8]_i1[8]_o , i0[8], i1[8]);
  xor \xor_i0[9]_i1[9]  (\xor_i0[9]_i1[9]_o , i0[9], i1[9]);

endmodule 

module ne_w24
  (
  i0,
  i1,
  o
  );

  input [23:0] i0;
  input [23:0] i1;
  output o;

  wire [23:0] diff;

  or any_diff (o, diff[0], diff[1], diff[2], diff[3], diff[4], diff[5], diff[6], diff[7], diff[8], diff[9], diff[10], diff[11], diff[12], diff[13], diff[14], diff[15], diff[16], diff[17], diff[18], diff[19], diff[20], diff[21], diff[22], diff[23]);
  xor diff_0 (diff[0], i0[0], i1[0]);
  xor diff_1 (diff[1], i0[1], i1[1]);
  xor diff_10 (diff[10], i0[10], i1[10]);
  xor diff_11 (diff[11], i0[11], i1[11]);
  xor diff_12 (diff[12], i0[12], i1[12]);
  xor diff_13 (diff[13], i0[13], i1[13]);
  xor diff_14 (diff[14], i0[14], i1[14]);
  xor diff_15 (diff[15], i0[15], i1[15]);
  xor diff_16 (diff[16], i0[16], i1[16]);
  xor diff_17 (diff[17], i0[17], i1[17]);
  xor diff_18 (diff[18], i0[18], i1[18]);
  xor diff_19 (diff[19], i0[19], i1[19]);
  xor diff_2 (diff[2], i0[2], i1[2]);
  xor diff_20 (diff[20], i0[20], i1[20]);
  xor diff_21 (diff[21], i0[21], i1[21]);
  xor diff_22 (diff[22], i0[22], i1[22]);
  xor diff_23 (diff[23], i0[23], i1[23]);
  xor diff_3 (diff[3], i0[3], i1[3]);
  xor diff_4 (diff[4], i0[4], i1[4]);
  xor diff_5 (diff[5], i0[5], i1[5]);
  xor diff_6 (diff[6], i0[6], i1[6]);
  xor diff_7 (diff[7], i0[7], i1[7]);
  xor diff_8 (diff[8], i0[8], i1[8]);
  xor diff_9 (diff[9], i0[9], i1[9]);

endmodule 

module add_pu24_mu24_o24
  (
  i0,
  i1,
  o
  );

  input [23:0] i0;
  input [23:0] i1;
  output [23:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a10;
  wire net_a11;
  wire net_a12;
  wire net_a13;
  wire net_a14;
  wire net_a15;
  wire net_a16;
  wire net_a17;
  wire net_a18;
  wire net_a19;
  wire net_a2;
  wire net_a20;
  wire net_a21;
  wire net_a22;
  wire net_a23;
  wire net_a3;
  wire net_a4;
  wire net_a5;
  wire net_a6;
  wire net_a7;
  wire net_a8;
  wire net_a9;
  wire net_b0;
  wire net_b1;
  wire net_b10;
  wire net_b11;
  wire net_b12;
  wire net_b13;
  wire net_b14;
  wire net_b15;
  wire net_b16;
  wire net_b17;
  wire net_b18;
  wire net_b19;
  wire net_b2;
  wire net_b20;
  wire net_b21;
  wire net_b22;
  wire net_b23;
  wire net_b3;
  wire net_b4;
  wire net_b5;
  wire net_b6;
  wire net_b7;
  wire net_b8;
  wire net_b9;
  wire net_cout0;
  wire net_cout1;
  wire net_cout10;
  wire net_cout11;
  wire net_cout12;
  wire net_cout13;
  wire net_cout14;
  wire net_cout15;
  wire net_cout16;
  wire net_cout17;
  wire net_cout18;
  wire net_cout19;
  wire net_cout2;
  wire net_cout20;
  wire net_cout21;
  wire net_cout22;
  wire net_cout23;
  wire net_cout3;
  wire net_cout4;
  wire net_cout5;
  wire net_cout6;
  wire net_cout7;
  wire net_cout8;
  wire net_cout9;
  wire net_nb0;
  wire net_nb1;
  wire net_nb10;
  wire net_nb11;
  wire net_nb12;
  wire net_nb13;
  wire net_nb14;
  wire net_nb15;
  wire net_nb16;
  wire net_nb17;
  wire net_nb18;
  wire net_nb19;
  wire net_nb2;
  wire net_nb20;
  wire net_nb21;
  wire net_nb22;
  wire net_nb23;
  wire net_nb3;
  wire net_nb4;
  wire net_nb5;
  wire net_nb6;
  wire net_nb7;
  wire net_nb8;
  wire net_nb9;
  wire net_sum0;
  wire net_sum1;
  wire net_sum10;
  wire net_sum11;
  wire net_sum12;
  wire net_sum13;
  wire net_sum14;
  wire net_sum15;
  wire net_sum16;
  wire net_sum17;
  wire net_sum18;
  wire net_sum19;
  wire net_sum2;
  wire net_sum20;
  wire net_sum21;
  wire net_sum22;
  wire net_sum23;
  wire net_sum3;
  wire net_sum4;
  wire net_sum5;
  wire net_sum6;
  wire net_sum7;
  wire net_sum8;
  wire net_sum9;

  assign net_a23 = i0[23];
  assign net_a22 = i0[22];
  assign net_a21 = i0[21];
  assign net_a20 = i0[20];
  assign net_a19 = i0[19];
  assign net_a18 = i0[18];
  assign net_a17 = i0[17];
  assign net_a16 = i0[16];
  assign net_a15 = i0[15];
  assign net_a14 = i0[14];
  assign net_a13 = i0[13];
  assign net_a12 = i0[12];
  assign net_a11 = i0[11];
  assign net_a10 = i0[10];
  assign net_a9 = i0[9];
  assign net_a8 = i0[8];
  assign net_a7 = i0[7];
  assign net_a6 = i0[6];
  assign net_a5 = i0[5];
  assign net_a4 = i0[4];
  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b23 = i1[23];
  assign net_b22 = i1[22];
  assign net_b21 = i1[21];
  assign net_b20 = i1[20];
  assign net_b19 = i1[19];
  assign net_b18 = i1[18];
  assign net_b17 = i1[17];
  assign net_b16 = i1[16];
  assign net_b15 = i1[15];
  assign net_b14 = i1[14];
  assign net_b13 = i1[13];
  assign net_b12 = i1[12];
  assign net_b11 = i1[11];
  assign net_b10 = i1[10];
  assign net_b9 = i1[9];
  assign net_b8 = i1[8];
  assign net_b7 = i1[7];
  assign net_b6 = i1[6];
  assign net_b5 = i1[5];
  assign net_b4 = i1[4];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[23] = net_sum23;
  assign o[22] = net_sum22;
  assign o[21] = net_sum21;
  assign o[20] = net_sum20;
  assign o[19] = net_sum19;
  assign o[18] = net_sum18;
  assign o[17] = net_sum17;
  assign o[16] = net_sum16;
  assign o[15] = net_sum15;
  assign o[14] = net_sum14;
  assign o[13] = net_sum13;
  assign o[12] = net_sum12;
  assign o[11] = net_sum11;
  assign o[10] = net_sum10;
  assign o[9] = net_sum9;
  assign o[8] = net_sum8;
  assign o[7] = net_sum7;
  assign o[6] = net_sum6;
  assign o[5] = net_sum5;
  assign o[4] = net_sum4;
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD comp_0 (
    .a(net_a0),
    .b(net_nb0),
    .c(1'b1),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD comp_1 (
    .a(net_a1),
    .b(net_nb1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD comp_10 (
    .a(net_a10),
    .b(net_nb10),
    .c(net_cout9),
    .cout(net_cout10),
    .sum(net_sum10));
  AL_FADD comp_11 (
    .a(net_a11),
    .b(net_nb11),
    .c(net_cout10),
    .cout(net_cout11),
    .sum(net_sum11));
  AL_FADD comp_12 (
    .a(net_a12),
    .b(net_nb12),
    .c(net_cout11),
    .cout(net_cout12),
    .sum(net_sum12));
  AL_FADD comp_13 (
    .a(net_a13),
    .b(net_nb13),
    .c(net_cout12),
    .cout(net_cout13),
    .sum(net_sum13));
  AL_FADD comp_14 (
    .a(net_a14),
    .b(net_nb14),
    .c(net_cout13),
    .cout(net_cout14),
    .sum(net_sum14));
  AL_FADD comp_15 (
    .a(net_a15),
    .b(net_nb15),
    .c(net_cout14),
    .cout(net_cout15),
    .sum(net_sum15));
  AL_FADD comp_16 (
    .a(net_a16),
    .b(net_nb16),
    .c(net_cout15),
    .cout(net_cout16),
    .sum(net_sum16));
  AL_FADD comp_17 (
    .a(net_a17),
    .b(net_nb17),
    .c(net_cout16),
    .cout(net_cout17),
    .sum(net_sum17));
  AL_FADD comp_18 (
    .a(net_a18),
    .b(net_nb18),
    .c(net_cout17),
    .cout(net_cout18),
    .sum(net_sum18));
  AL_FADD comp_19 (
    .a(net_a19),
    .b(net_nb19),
    .c(net_cout18),
    .cout(net_cout19),
    .sum(net_sum19));
  AL_FADD comp_2 (
    .a(net_a2),
    .b(net_nb2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD comp_20 (
    .a(net_a20),
    .b(net_nb20),
    .c(net_cout19),
    .cout(net_cout20),
    .sum(net_sum20));
  AL_FADD comp_21 (
    .a(net_a21),
    .b(net_nb21),
    .c(net_cout20),
    .cout(net_cout21),
    .sum(net_sum21));
  AL_FADD comp_22 (
    .a(net_a22),
    .b(net_nb22),
    .c(net_cout21),
    .cout(net_cout22),
    .sum(net_sum22));
  AL_FADD comp_23 (
    .a(net_a23),
    .b(net_nb23),
    .c(net_cout22),
    .cout(net_cout23),
    .sum(net_sum23));
  AL_FADD comp_3 (
    .a(net_a3),
    .b(net_nb3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  AL_FADD comp_4 (
    .a(net_a4),
    .b(net_nb4),
    .c(net_cout3),
    .cout(net_cout4),
    .sum(net_sum4));
  AL_FADD comp_5 (
    .a(net_a5),
    .b(net_nb5),
    .c(net_cout4),
    .cout(net_cout5),
    .sum(net_sum5));
  AL_FADD comp_6 (
    .a(net_a6),
    .b(net_nb6),
    .c(net_cout5),
    .cout(net_cout6),
    .sum(net_sum6));
  AL_FADD comp_7 (
    .a(net_a7),
    .b(net_nb7),
    .c(net_cout6),
    .cout(net_cout7),
    .sum(net_sum7));
  AL_FADD comp_8 (
    .a(net_a8),
    .b(net_nb8),
    .c(net_cout7),
    .cout(net_cout8),
    .sum(net_sum8));
  AL_FADD comp_9 (
    .a(net_a9),
    .b(net_nb9),
    .c(net_cout8),
    .cout(net_cout9),
    .sum(net_sum9));
  not inv_b0 (net_nb0, net_b0);
  not inv_b1 (net_nb1, net_b1);
  not inv_b10 (net_nb10, net_b10);
  not inv_b11 (net_nb11, net_b11);
  not inv_b12 (net_nb12, net_b12);
  not inv_b13 (net_nb13, net_b13);
  not inv_b14 (net_nb14, net_b14);
  not inv_b15 (net_nb15, net_b15);
  not inv_b16 (net_nb16, net_b16);
  not inv_b17 (net_nb17, net_b17);
  not inv_b18 (net_nb18, net_b18);
  not inv_b19 (net_nb19, net_b19);
  not inv_b2 (net_nb2, net_b2);
  not inv_b20 (net_nb20, net_b20);
  not inv_b21 (net_nb21, net_b21);
  not inv_b22 (net_nb22, net_b22);
  not inv_b23 (net_nb23, net_b23);
  not inv_b3 (net_nb3, net_b3);
  not inv_b4 (net_nb4, net_b4);
  not inv_b5 (net_nb5, net_b5);
  not inv_b6 (net_nb6, net_b6);
  not inv_b7 (net_nb7, net_b7);
  not inv_b8 (net_nb8, net_b8);
  not inv_b9 (net_nb9, net_b9);

endmodule 

module add_pu19_pu19_o19
  (
  i0,
  i1,
  o
  );

  input [18:0] i0;
  input [18:0] i1;
  output [18:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a10;
  wire net_a11;
  wire net_a12;
  wire net_a13;
  wire net_a14;
  wire net_a15;
  wire net_a16;
  wire net_a17;
  wire net_a18;
  wire net_a2;
  wire net_a3;
  wire net_a4;
  wire net_a5;
  wire net_a6;
  wire net_a7;
  wire net_a8;
  wire net_a9;
  wire net_b0;
  wire net_b1;
  wire net_b10;
  wire net_b11;
  wire net_b12;
  wire net_b13;
  wire net_b14;
  wire net_b15;
  wire net_b16;
  wire net_b17;
  wire net_b18;
  wire net_b2;
  wire net_b3;
  wire net_b4;
  wire net_b5;
  wire net_b6;
  wire net_b7;
  wire net_b8;
  wire net_b9;
  wire net_cout0;
  wire net_cout1;
  wire net_cout10;
  wire net_cout11;
  wire net_cout12;
  wire net_cout13;
  wire net_cout14;
  wire net_cout15;
  wire net_cout16;
  wire net_cout17;
  wire net_cout18;
  wire net_cout2;
  wire net_cout3;
  wire net_cout4;
  wire net_cout5;
  wire net_cout6;
  wire net_cout7;
  wire net_cout8;
  wire net_cout9;
  wire net_sum0;
  wire net_sum1;
  wire net_sum10;
  wire net_sum11;
  wire net_sum12;
  wire net_sum13;
  wire net_sum14;
  wire net_sum15;
  wire net_sum16;
  wire net_sum17;
  wire net_sum18;
  wire net_sum2;
  wire net_sum3;
  wire net_sum4;
  wire net_sum5;
  wire net_sum6;
  wire net_sum7;
  wire net_sum8;
  wire net_sum9;

  assign net_a18 = i0[18];
  assign net_a17 = i0[17];
  assign net_a16 = i0[16];
  assign net_a15 = i0[15];
  assign net_a14 = i0[14];
  assign net_a13 = i0[13];
  assign net_a12 = i0[12];
  assign net_a11 = i0[11];
  assign net_a10 = i0[10];
  assign net_a9 = i0[9];
  assign net_a8 = i0[8];
  assign net_a7 = i0[7];
  assign net_a6 = i0[6];
  assign net_a5 = i0[5];
  assign net_a4 = i0[4];
  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b18 = i1[18];
  assign net_b17 = i1[17];
  assign net_b16 = i1[16];
  assign net_b15 = i1[15];
  assign net_b14 = i1[14];
  assign net_b13 = i1[13];
  assign net_b12 = i1[12];
  assign net_b11 = i1[11];
  assign net_b10 = i1[10];
  assign net_b9 = i1[9];
  assign net_b8 = i1[8];
  assign net_b7 = i1[7];
  assign net_b6 = i1[6];
  assign net_b5 = i1[5];
  assign net_b4 = i1[4];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[18] = net_sum18;
  assign o[17] = net_sum17;
  assign o[16] = net_sum16;
  assign o[15] = net_sum15;
  assign o[14] = net_sum14;
  assign o[13] = net_sum13;
  assign o[12] = net_sum12;
  assign o[11] = net_sum11;
  assign o[10] = net_sum10;
  assign o[9] = net_sum9;
  assign o[8] = net_sum8;
  assign o[7] = net_sum7;
  assign o[6] = net_sum6;
  assign o[5] = net_sum5;
  assign o[4] = net_sum4;
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD comp_0 (
    .a(net_a0),
    .b(net_b0),
    .c(1'b0),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD comp_1 (
    .a(net_a1),
    .b(net_b1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD comp_10 (
    .a(net_a10),
    .b(net_b10),
    .c(net_cout9),
    .cout(net_cout10),
    .sum(net_sum10));
  AL_FADD comp_11 (
    .a(net_a11),
    .b(net_b11),
    .c(net_cout10),
    .cout(net_cout11),
    .sum(net_sum11));
  AL_FADD comp_12 (
    .a(net_a12),
    .b(net_b12),
    .c(net_cout11),
    .cout(net_cout12),
    .sum(net_sum12));
  AL_FADD comp_13 (
    .a(net_a13),
    .b(net_b13),
    .c(net_cout12),
    .cout(net_cout13),
    .sum(net_sum13));
  AL_FADD comp_14 (
    .a(net_a14),
    .b(net_b14),
    .c(net_cout13),
    .cout(net_cout14),
    .sum(net_sum14));
  AL_FADD comp_15 (
    .a(net_a15),
    .b(net_b15),
    .c(net_cout14),
    .cout(net_cout15),
    .sum(net_sum15));
  AL_FADD comp_16 (
    .a(net_a16),
    .b(net_b16),
    .c(net_cout15),
    .cout(net_cout16),
    .sum(net_sum16));
  AL_FADD comp_17 (
    .a(net_a17),
    .b(net_b17),
    .c(net_cout16),
    .cout(net_cout17),
    .sum(net_sum17));
  AL_FADD comp_18 (
    .a(net_a18),
    .b(net_b18),
    .c(net_cout17),
    .cout(net_cout18),
    .sum(net_sum18));
  AL_FADD comp_2 (
    .a(net_a2),
    .b(net_b2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD comp_3 (
    .a(net_a3),
    .b(net_b3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  AL_FADD comp_4 (
    .a(net_a4),
    .b(net_b4),
    .c(net_cout3),
    .cout(net_cout4),
    .sum(net_sum4));
  AL_FADD comp_5 (
    .a(net_a5),
    .b(net_b5),
    .c(net_cout4),
    .cout(net_cout5),
    .sum(net_sum5));
  AL_FADD comp_6 (
    .a(net_a6),
    .b(net_b6),
    .c(net_cout5),
    .cout(net_cout6),
    .sum(net_sum6));
  AL_FADD comp_7 (
    .a(net_a7),
    .b(net_b7),
    .c(net_cout6),
    .cout(net_cout7),
    .sum(net_sum7));
  AL_FADD comp_8 (
    .a(net_a8),
    .b(net_b8),
    .c(net_cout7),
    .cout(net_cout8),
    .sum(net_sum8));
  AL_FADD comp_9 (
    .a(net_a9),
    .b(net_b9),
    .c(net_cout8),
    .cout(net_cout9),
    .sum(net_sum9));

endmodule 

module add_pu32_pu32_o32
  (
  i0,
  i1,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  output [31:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a10;
  wire net_a11;
  wire net_a12;
  wire net_a13;
  wire net_a14;
  wire net_a15;
  wire net_a16;
  wire net_a17;
  wire net_a18;
  wire net_a19;
  wire net_a2;
  wire net_a20;
  wire net_a21;
  wire net_a22;
  wire net_a23;
  wire net_a24;
  wire net_a25;
  wire net_a26;
  wire net_a27;
  wire net_a28;
  wire net_a29;
  wire net_a3;
  wire net_a30;
  wire net_a31;
  wire net_a4;
  wire net_a5;
  wire net_a6;
  wire net_a7;
  wire net_a8;
  wire net_a9;
  wire net_b0;
  wire net_b1;
  wire net_b10;
  wire net_b11;
  wire net_b12;
  wire net_b13;
  wire net_b14;
  wire net_b15;
  wire net_b16;
  wire net_b17;
  wire net_b18;
  wire net_b19;
  wire net_b2;
  wire net_b20;
  wire net_b21;
  wire net_b22;
  wire net_b23;
  wire net_b24;
  wire net_b25;
  wire net_b26;
  wire net_b27;
  wire net_b28;
  wire net_b29;
  wire net_b3;
  wire net_b30;
  wire net_b31;
  wire net_b4;
  wire net_b5;
  wire net_b6;
  wire net_b7;
  wire net_b8;
  wire net_b9;
  wire net_cout0;
  wire net_cout1;
  wire net_cout10;
  wire net_cout11;
  wire net_cout12;
  wire net_cout13;
  wire net_cout14;
  wire net_cout15;
  wire net_cout16;
  wire net_cout17;
  wire net_cout18;
  wire net_cout19;
  wire net_cout2;
  wire net_cout20;
  wire net_cout21;
  wire net_cout22;
  wire net_cout23;
  wire net_cout24;
  wire net_cout25;
  wire net_cout26;
  wire net_cout27;
  wire net_cout28;
  wire net_cout29;
  wire net_cout3;
  wire net_cout30;
  wire net_cout31;
  wire net_cout4;
  wire net_cout5;
  wire net_cout6;
  wire net_cout7;
  wire net_cout8;
  wire net_cout9;
  wire net_sum0;
  wire net_sum1;
  wire net_sum10;
  wire net_sum11;
  wire net_sum12;
  wire net_sum13;
  wire net_sum14;
  wire net_sum15;
  wire net_sum16;
  wire net_sum17;
  wire net_sum18;
  wire net_sum19;
  wire net_sum2;
  wire net_sum20;
  wire net_sum21;
  wire net_sum22;
  wire net_sum23;
  wire net_sum24;
  wire net_sum25;
  wire net_sum26;
  wire net_sum27;
  wire net_sum28;
  wire net_sum29;
  wire net_sum3;
  wire net_sum30;
  wire net_sum31;
  wire net_sum4;
  wire net_sum5;
  wire net_sum6;
  wire net_sum7;
  wire net_sum8;
  wire net_sum9;

  assign net_a31 = i0[31];
  assign net_a30 = i0[30];
  assign net_a29 = i0[29];
  assign net_a28 = i0[28];
  assign net_a27 = i0[27];
  assign net_a26 = i0[26];
  assign net_a25 = i0[25];
  assign net_a24 = i0[24];
  assign net_a23 = i0[23];
  assign net_a22 = i0[22];
  assign net_a21 = i0[21];
  assign net_a20 = i0[20];
  assign net_a19 = i0[19];
  assign net_a18 = i0[18];
  assign net_a17 = i0[17];
  assign net_a16 = i0[16];
  assign net_a15 = i0[15];
  assign net_a14 = i0[14];
  assign net_a13 = i0[13];
  assign net_a12 = i0[12];
  assign net_a11 = i0[11];
  assign net_a10 = i0[10];
  assign net_a9 = i0[9];
  assign net_a8 = i0[8];
  assign net_a7 = i0[7];
  assign net_a6 = i0[6];
  assign net_a5 = i0[5];
  assign net_a4 = i0[4];
  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b31 = i1[31];
  assign net_b30 = i1[30];
  assign net_b29 = i1[29];
  assign net_b28 = i1[28];
  assign net_b27 = i1[27];
  assign net_b26 = i1[26];
  assign net_b25 = i1[25];
  assign net_b24 = i1[24];
  assign net_b23 = i1[23];
  assign net_b22 = i1[22];
  assign net_b21 = i1[21];
  assign net_b20 = i1[20];
  assign net_b19 = i1[19];
  assign net_b18 = i1[18];
  assign net_b17 = i1[17];
  assign net_b16 = i1[16];
  assign net_b15 = i1[15];
  assign net_b14 = i1[14];
  assign net_b13 = i1[13];
  assign net_b12 = i1[12];
  assign net_b11 = i1[11];
  assign net_b10 = i1[10];
  assign net_b9 = i1[9];
  assign net_b8 = i1[8];
  assign net_b7 = i1[7];
  assign net_b6 = i1[6];
  assign net_b5 = i1[5];
  assign net_b4 = i1[4];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[31] = net_sum31;
  assign o[30] = net_sum30;
  assign o[29] = net_sum29;
  assign o[28] = net_sum28;
  assign o[27] = net_sum27;
  assign o[26] = net_sum26;
  assign o[25] = net_sum25;
  assign o[24] = net_sum24;
  assign o[23] = net_sum23;
  assign o[22] = net_sum22;
  assign o[21] = net_sum21;
  assign o[20] = net_sum20;
  assign o[19] = net_sum19;
  assign o[18] = net_sum18;
  assign o[17] = net_sum17;
  assign o[16] = net_sum16;
  assign o[15] = net_sum15;
  assign o[14] = net_sum14;
  assign o[13] = net_sum13;
  assign o[12] = net_sum12;
  assign o[11] = net_sum11;
  assign o[10] = net_sum10;
  assign o[9] = net_sum9;
  assign o[8] = net_sum8;
  assign o[7] = net_sum7;
  assign o[6] = net_sum6;
  assign o[5] = net_sum5;
  assign o[4] = net_sum4;
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD comp_0 (
    .a(net_a0),
    .b(net_b0),
    .c(1'b0),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD comp_1 (
    .a(net_a1),
    .b(net_b1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD comp_10 (
    .a(net_a10),
    .b(net_b10),
    .c(net_cout9),
    .cout(net_cout10),
    .sum(net_sum10));
  AL_FADD comp_11 (
    .a(net_a11),
    .b(net_b11),
    .c(net_cout10),
    .cout(net_cout11),
    .sum(net_sum11));
  AL_FADD comp_12 (
    .a(net_a12),
    .b(net_b12),
    .c(net_cout11),
    .cout(net_cout12),
    .sum(net_sum12));
  AL_FADD comp_13 (
    .a(net_a13),
    .b(net_b13),
    .c(net_cout12),
    .cout(net_cout13),
    .sum(net_sum13));
  AL_FADD comp_14 (
    .a(net_a14),
    .b(net_b14),
    .c(net_cout13),
    .cout(net_cout14),
    .sum(net_sum14));
  AL_FADD comp_15 (
    .a(net_a15),
    .b(net_b15),
    .c(net_cout14),
    .cout(net_cout15),
    .sum(net_sum15));
  AL_FADD comp_16 (
    .a(net_a16),
    .b(net_b16),
    .c(net_cout15),
    .cout(net_cout16),
    .sum(net_sum16));
  AL_FADD comp_17 (
    .a(net_a17),
    .b(net_b17),
    .c(net_cout16),
    .cout(net_cout17),
    .sum(net_sum17));
  AL_FADD comp_18 (
    .a(net_a18),
    .b(net_b18),
    .c(net_cout17),
    .cout(net_cout18),
    .sum(net_sum18));
  AL_FADD comp_19 (
    .a(net_a19),
    .b(net_b19),
    .c(net_cout18),
    .cout(net_cout19),
    .sum(net_sum19));
  AL_FADD comp_2 (
    .a(net_a2),
    .b(net_b2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD comp_20 (
    .a(net_a20),
    .b(net_b20),
    .c(net_cout19),
    .cout(net_cout20),
    .sum(net_sum20));
  AL_FADD comp_21 (
    .a(net_a21),
    .b(net_b21),
    .c(net_cout20),
    .cout(net_cout21),
    .sum(net_sum21));
  AL_FADD comp_22 (
    .a(net_a22),
    .b(net_b22),
    .c(net_cout21),
    .cout(net_cout22),
    .sum(net_sum22));
  AL_FADD comp_23 (
    .a(net_a23),
    .b(net_b23),
    .c(net_cout22),
    .cout(net_cout23),
    .sum(net_sum23));
  AL_FADD comp_24 (
    .a(net_a24),
    .b(net_b24),
    .c(net_cout23),
    .cout(net_cout24),
    .sum(net_sum24));
  AL_FADD comp_25 (
    .a(net_a25),
    .b(net_b25),
    .c(net_cout24),
    .cout(net_cout25),
    .sum(net_sum25));
  AL_FADD comp_26 (
    .a(net_a26),
    .b(net_b26),
    .c(net_cout25),
    .cout(net_cout26),
    .sum(net_sum26));
  AL_FADD comp_27 (
    .a(net_a27),
    .b(net_b27),
    .c(net_cout26),
    .cout(net_cout27),
    .sum(net_sum27));
  AL_FADD comp_28 (
    .a(net_a28),
    .b(net_b28),
    .c(net_cout27),
    .cout(net_cout28),
    .sum(net_sum28));
  AL_FADD comp_29 (
    .a(net_a29),
    .b(net_b29),
    .c(net_cout28),
    .cout(net_cout29),
    .sum(net_sum29));
  AL_FADD comp_3 (
    .a(net_a3),
    .b(net_b3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  AL_FADD comp_30 (
    .a(net_a30),
    .b(net_b30),
    .c(net_cout29),
    .cout(net_cout30),
    .sum(net_sum30));
  AL_FADD comp_31 (
    .a(net_a31),
    .b(net_b31),
    .c(net_cout30),
    .cout(net_cout31),
    .sum(net_sum31));
  AL_FADD comp_4 (
    .a(net_a4),
    .b(net_b4),
    .c(net_cout3),
    .cout(net_cout4),
    .sum(net_sum4));
  AL_FADD comp_5 (
    .a(net_a5),
    .b(net_b5),
    .c(net_cout4),
    .cout(net_cout5),
    .sum(net_sum5));
  AL_FADD comp_6 (
    .a(net_a6),
    .b(net_b6),
    .c(net_cout5),
    .cout(net_cout6),
    .sum(net_sum6));
  AL_FADD comp_7 (
    .a(net_a7),
    .b(net_b7),
    .c(net_cout6),
    .cout(net_cout7),
    .sum(net_sum7));
  AL_FADD comp_8 (
    .a(net_a8),
    .b(net_b8),
    .c(net_cout7),
    .cout(net_cout8),
    .sum(net_sum8));
  AL_FADD comp_9 (
    .a(net_a9),
    .b(net_b9),
    .c(net_cout8),
    .cout(net_cout9),
    .sum(net_sum9));

endmodule 

module add_pu4_pu4_o4
  (
  i0,
  i1,
  o
  );

  input [3:0] i0;
  input [3:0] i1;
  output [3:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a2;
  wire net_a3;
  wire net_b0;
  wire net_b1;
  wire net_b2;
  wire net_b3;
  wire net_cout0;
  wire net_cout1;
  wire net_cout2;
  wire net_cout3;
  wire net_sum0;
  wire net_sum1;
  wire net_sum2;
  wire net_sum3;

  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD comp_0 (
    .a(net_a0),
    .b(net_b0),
    .c(1'b0),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD comp_1 (
    .a(net_a1),
    .b(net_b1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD comp_2 (
    .a(net_a2),
    .b(net_b2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD comp_3 (
    .a(net_a3),
    .b(net_b3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));

endmodule 

module eq_w2
  (
  i0,
  i1,
  o
  );

  input [1:0] i0;
  input [1:0] i1;
  output o;

  wire \or_xor_i0[0]_i1[0]_o_o ;
  wire \xor_i0[0]_i1[0]_o ;
  wire \xor_i0[1]_i1[1]_o ;

  not none_diff (o, \or_xor_i0[0]_i1[0]_o_o );
  or \or_xor_i0[0]_i1[0]_o  (\or_xor_i0[0]_i1[0]_o_o , \xor_i0[0]_i1[0]_o , \xor_i0[1]_i1[1]_o );
  xor \xor_i0[0]_i1[0]  (\xor_i0[0]_i1[0]_o , i0[0], i1[0]);
  xor \xor_i0[1]_i1[1]  (\xor_i0[1]_i1[1]_o , i0[1], i1[1]);

endmodule 

module eq_w4
  (
  i0,
  i1,
  o
  );

  input [3:0] i0;
  input [3:0] i1;
  output o;

  wire \or_or_xor_i0[0]_i1[0_o ;
  wire \or_xor_i0[0]_i1[0]_o_o ;
  wire \or_xor_i0[2]_i1[2]_o_o ;
  wire \xor_i0[0]_i1[0]_o ;
  wire \xor_i0[1]_i1[1]_o ;
  wire \xor_i0[2]_i1[2]_o ;
  wire \xor_i0[3]_i1[3]_o ;

  not none_diff (o, \or_or_xor_i0[0]_i1[0_o );
  or \or_or_xor_i0[0]_i1[0  (\or_or_xor_i0[0]_i1[0_o , \or_xor_i0[0]_i1[0]_o_o , \or_xor_i0[2]_i1[2]_o_o );
  or \or_xor_i0[0]_i1[0]_o  (\or_xor_i0[0]_i1[0]_o_o , \xor_i0[0]_i1[0]_o , \xor_i0[1]_i1[1]_o );
  or \or_xor_i0[2]_i1[2]_o  (\or_xor_i0[2]_i1[2]_o_o , \xor_i0[2]_i1[2]_o , \xor_i0[3]_i1[3]_o );
  xor \xor_i0[0]_i1[0]  (\xor_i0[0]_i1[0]_o , i0[0], i1[0]);
  xor \xor_i0[1]_i1[1]  (\xor_i0[1]_i1[1]_o , i0[1], i1[1]);
  xor \xor_i0[2]_i1[2]  (\xor_i0[2]_i1[2]_o , i0[2], i1[2]);
  xor \xor_i0[3]_i1[3]  (\xor_i0[3]_i1[3]_o , i0[3], i1[3]);

endmodule 

module eq_w32
  (
  i0,
  i1,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  output o;

  wire or_or_or_or_or_xor_i_o;
  wire \or_or_or_or_xor_i0[0_o ;
  wire \or_or_or_or_xor_i0[1_o ;
  wire \or_or_or_xor_i0[0]_i_o ;
  wire \or_or_or_xor_i0[16]__o ;
  wire \or_or_or_xor_i0[24]__o ;
  wire \or_or_or_xor_i0[8]_i_o ;
  wire \or_or_xor_i0[0]_i1[0_o ;
  wire \or_or_xor_i0[12]_i1[_o ;
  wire \or_or_xor_i0[16]_i1[_o ;
  wire \or_or_xor_i0[20]_i1[_o ;
  wire \or_or_xor_i0[24]_i1[_o ;
  wire \or_or_xor_i0[28]_i1[_o ;
  wire \or_or_xor_i0[4]_i1[4_o ;
  wire \or_or_xor_i0[8]_i1[8_o ;
  wire \or_xor_i0[0]_i1[0]_o_o ;
  wire \or_xor_i0[10]_i1[10]_o ;
  wire \or_xor_i0[12]_i1[12]_o ;
  wire \or_xor_i0[14]_i1[14]_o ;
  wire \or_xor_i0[16]_i1[16]_o ;
  wire \or_xor_i0[18]_i1[18]_o ;
  wire \or_xor_i0[20]_i1[20]_o ;
  wire \or_xor_i0[22]_i1[22]_o ;
  wire \or_xor_i0[24]_i1[24]_o ;
  wire \or_xor_i0[26]_i1[26]_o ;
  wire \or_xor_i0[28]_i1[28]_o ;
  wire \or_xor_i0[2]_i1[2]_o_o ;
  wire \or_xor_i0[30]_i1[30]_o ;
  wire \or_xor_i0[4]_i1[4]_o_o ;
  wire \or_xor_i0[6]_i1[6]_o_o ;
  wire \or_xor_i0[8]_i1[8]_o_o ;
  wire \xor_i0[0]_i1[0]_o ;
  wire \xor_i0[10]_i1[10]_o ;
  wire \xor_i0[11]_i1[11]_o ;
  wire \xor_i0[12]_i1[12]_o ;
  wire \xor_i0[13]_i1[13]_o ;
  wire \xor_i0[14]_i1[14]_o ;
  wire \xor_i0[15]_i1[15]_o ;
  wire \xor_i0[16]_i1[16]_o ;
  wire \xor_i0[17]_i1[17]_o ;
  wire \xor_i0[18]_i1[18]_o ;
  wire \xor_i0[19]_i1[19]_o ;
  wire \xor_i0[1]_i1[1]_o ;
  wire \xor_i0[20]_i1[20]_o ;
  wire \xor_i0[21]_i1[21]_o ;
  wire \xor_i0[22]_i1[22]_o ;
  wire \xor_i0[23]_i1[23]_o ;
  wire \xor_i0[24]_i1[24]_o ;
  wire \xor_i0[25]_i1[25]_o ;
  wire \xor_i0[26]_i1[26]_o ;
  wire \xor_i0[27]_i1[27]_o ;
  wire \xor_i0[28]_i1[28]_o ;
  wire \xor_i0[29]_i1[29]_o ;
  wire \xor_i0[2]_i1[2]_o ;
  wire \xor_i0[30]_i1[30]_o ;
  wire \xor_i0[31]_i1[31]_o ;
  wire \xor_i0[3]_i1[3]_o ;
  wire \xor_i0[4]_i1[4]_o ;
  wire \xor_i0[5]_i1[5]_o ;
  wire \xor_i0[6]_i1[6]_o ;
  wire \xor_i0[7]_i1[7]_o ;
  wire \xor_i0[8]_i1[8]_o ;
  wire \xor_i0[9]_i1[9]_o ;

  not none_diff (o, or_or_or_or_or_xor_i_o);
  or or_or_or_or_or_xor_i (or_or_or_or_or_xor_i_o, \or_or_or_or_xor_i0[0_o , \or_or_or_or_xor_i0[1_o );
  or \or_or_or_or_xor_i0[0  (\or_or_or_or_xor_i0[0_o , \or_or_or_xor_i0[0]_i_o , \or_or_or_xor_i0[8]_i_o );
  or \or_or_or_or_xor_i0[1  (\or_or_or_or_xor_i0[1_o , \or_or_or_xor_i0[16]__o , \or_or_or_xor_i0[24]__o );
  or \or_or_or_xor_i0[0]_i  (\or_or_or_xor_i0[0]_i_o , \or_or_xor_i0[0]_i1[0_o , \or_or_xor_i0[4]_i1[4_o );
  or \or_or_or_xor_i0[16]_  (\or_or_or_xor_i0[16]__o , \or_or_xor_i0[16]_i1[_o , \or_or_xor_i0[20]_i1[_o );
  or \or_or_or_xor_i0[24]_  (\or_or_or_xor_i0[24]__o , \or_or_xor_i0[24]_i1[_o , \or_or_xor_i0[28]_i1[_o );
  or \or_or_or_xor_i0[8]_i  (\or_or_or_xor_i0[8]_i_o , \or_or_xor_i0[8]_i1[8_o , \or_or_xor_i0[12]_i1[_o );
  or \or_or_xor_i0[0]_i1[0  (\or_or_xor_i0[0]_i1[0_o , \or_xor_i0[0]_i1[0]_o_o , \or_xor_i0[2]_i1[2]_o_o );
  or \or_or_xor_i0[12]_i1[  (\or_or_xor_i0[12]_i1[_o , \or_xor_i0[12]_i1[12]_o , \or_xor_i0[14]_i1[14]_o );
  or \or_or_xor_i0[16]_i1[  (\or_or_xor_i0[16]_i1[_o , \or_xor_i0[16]_i1[16]_o , \or_xor_i0[18]_i1[18]_o );
  or \or_or_xor_i0[20]_i1[  (\or_or_xor_i0[20]_i1[_o , \or_xor_i0[20]_i1[20]_o , \or_xor_i0[22]_i1[22]_o );
  or \or_or_xor_i0[24]_i1[  (\or_or_xor_i0[24]_i1[_o , \or_xor_i0[24]_i1[24]_o , \or_xor_i0[26]_i1[26]_o );
  or \or_or_xor_i0[28]_i1[  (\or_or_xor_i0[28]_i1[_o , \or_xor_i0[28]_i1[28]_o , \or_xor_i0[30]_i1[30]_o );
  or \or_or_xor_i0[4]_i1[4  (\or_or_xor_i0[4]_i1[4_o , \or_xor_i0[4]_i1[4]_o_o , \or_xor_i0[6]_i1[6]_o_o );
  or \or_or_xor_i0[8]_i1[8  (\or_or_xor_i0[8]_i1[8_o , \or_xor_i0[8]_i1[8]_o_o , \or_xor_i0[10]_i1[10]_o );
  or \or_xor_i0[0]_i1[0]_o  (\or_xor_i0[0]_i1[0]_o_o , \xor_i0[0]_i1[0]_o , \xor_i0[1]_i1[1]_o );
  or \or_xor_i0[10]_i1[10]  (\or_xor_i0[10]_i1[10]_o , \xor_i0[10]_i1[10]_o , \xor_i0[11]_i1[11]_o );
  or \or_xor_i0[12]_i1[12]  (\or_xor_i0[12]_i1[12]_o , \xor_i0[12]_i1[12]_o , \xor_i0[13]_i1[13]_o );
  or \or_xor_i0[14]_i1[14]  (\or_xor_i0[14]_i1[14]_o , \xor_i0[14]_i1[14]_o , \xor_i0[15]_i1[15]_o );
  or \or_xor_i0[16]_i1[16]  (\or_xor_i0[16]_i1[16]_o , \xor_i0[16]_i1[16]_o , \xor_i0[17]_i1[17]_o );
  or \or_xor_i0[18]_i1[18]  (\or_xor_i0[18]_i1[18]_o , \xor_i0[18]_i1[18]_o , \xor_i0[19]_i1[19]_o );
  or \or_xor_i0[20]_i1[20]  (\or_xor_i0[20]_i1[20]_o , \xor_i0[20]_i1[20]_o , \xor_i0[21]_i1[21]_o );
  or \or_xor_i0[22]_i1[22]  (\or_xor_i0[22]_i1[22]_o , \xor_i0[22]_i1[22]_o , \xor_i0[23]_i1[23]_o );
  or \or_xor_i0[24]_i1[24]  (\or_xor_i0[24]_i1[24]_o , \xor_i0[24]_i1[24]_o , \xor_i0[25]_i1[25]_o );
  or \or_xor_i0[26]_i1[26]  (\or_xor_i0[26]_i1[26]_o , \xor_i0[26]_i1[26]_o , \xor_i0[27]_i1[27]_o );
  or \or_xor_i0[28]_i1[28]  (\or_xor_i0[28]_i1[28]_o , \xor_i0[28]_i1[28]_o , \xor_i0[29]_i1[29]_o );
  or \or_xor_i0[2]_i1[2]_o  (\or_xor_i0[2]_i1[2]_o_o , \xor_i0[2]_i1[2]_o , \xor_i0[3]_i1[3]_o );
  or \or_xor_i0[30]_i1[30]  (\or_xor_i0[30]_i1[30]_o , \xor_i0[30]_i1[30]_o , \xor_i0[31]_i1[31]_o );
  or \or_xor_i0[4]_i1[4]_o  (\or_xor_i0[4]_i1[4]_o_o , \xor_i0[4]_i1[4]_o , \xor_i0[5]_i1[5]_o );
  or \or_xor_i0[6]_i1[6]_o  (\or_xor_i0[6]_i1[6]_o_o , \xor_i0[6]_i1[6]_o , \xor_i0[7]_i1[7]_o );
  or \or_xor_i0[8]_i1[8]_o  (\or_xor_i0[8]_i1[8]_o_o , \xor_i0[8]_i1[8]_o , \xor_i0[9]_i1[9]_o );
  xor \xor_i0[0]_i1[0]  (\xor_i0[0]_i1[0]_o , i0[0], i1[0]);
  xor \xor_i0[10]_i1[10]  (\xor_i0[10]_i1[10]_o , i0[10], i1[10]);
  xor \xor_i0[11]_i1[11]  (\xor_i0[11]_i1[11]_o , i0[11], i1[11]);
  xor \xor_i0[12]_i1[12]  (\xor_i0[12]_i1[12]_o , i0[12], i1[12]);
  xor \xor_i0[13]_i1[13]  (\xor_i0[13]_i1[13]_o , i0[13], i1[13]);
  xor \xor_i0[14]_i1[14]  (\xor_i0[14]_i1[14]_o , i0[14], i1[14]);
  xor \xor_i0[15]_i1[15]  (\xor_i0[15]_i1[15]_o , i0[15], i1[15]);
  xor \xor_i0[16]_i1[16]  (\xor_i0[16]_i1[16]_o , i0[16], i1[16]);
  xor \xor_i0[17]_i1[17]  (\xor_i0[17]_i1[17]_o , i0[17], i1[17]);
  xor \xor_i0[18]_i1[18]  (\xor_i0[18]_i1[18]_o , i0[18], i1[18]);
  xor \xor_i0[19]_i1[19]  (\xor_i0[19]_i1[19]_o , i0[19], i1[19]);
  xor \xor_i0[1]_i1[1]  (\xor_i0[1]_i1[1]_o , i0[1], i1[1]);
  xor \xor_i0[20]_i1[20]  (\xor_i0[20]_i1[20]_o , i0[20], i1[20]);
  xor \xor_i0[21]_i1[21]  (\xor_i0[21]_i1[21]_o , i0[21], i1[21]);
  xor \xor_i0[22]_i1[22]  (\xor_i0[22]_i1[22]_o , i0[22], i1[22]);
  xor \xor_i0[23]_i1[23]  (\xor_i0[23]_i1[23]_o , i0[23], i1[23]);
  xor \xor_i0[24]_i1[24]  (\xor_i0[24]_i1[24]_o , i0[24], i1[24]);
  xor \xor_i0[25]_i1[25]  (\xor_i0[25]_i1[25]_o , i0[25], i1[25]);
  xor \xor_i0[26]_i1[26]  (\xor_i0[26]_i1[26]_o , i0[26], i1[26]);
  xor \xor_i0[27]_i1[27]  (\xor_i0[27]_i1[27]_o , i0[27], i1[27]);
  xor \xor_i0[28]_i1[28]  (\xor_i0[28]_i1[28]_o , i0[28], i1[28]);
  xor \xor_i0[29]_i1[29]  (\xor_i0[29]_i1[29]_o , i0[29], i1[29]);
  xor \xor_i0[2]_i1[2]  (\xor_i0[2]_i1[2]_o , i0[2], i1[2]);
  xor \xor_i0[30]_i1[30]  (\xor_i0[30]_i1[30]_o , i0[30], i1[30]);
  xor \xor_i0[31]_i1[31]  (\xor_i0[31]_i1[31]_o , i0[31], i1[31]);
  xor \xor_i0[3]_i1[3]  (\xor_i0[3]_i1[3]_o , i0[3], i1[3]);
  xor \xor_i0[4]_i1[4]  (\xor_i0[4]_i1[4]_o , i0[4], i1[4]);
  xor \xor_i0[5]_i1[5]  (\xor_i0[5]_i1[5]_o , i0[5], i1[5]);
  xor \xor_i0[6]_i1[6]  (\xor_i0[6]_i1[6]_o , i0[6], i1[6]);
  xor \xor_i0[7]_i1[7]  (\xor_i0[7]_i1[7]_o , i0[7], i1[7]);
  xor \xor_i0[8]_i1[8]  (\xor_i0[8]_i1[8]_o , i0[8], i1[8]);
  xor \xor_i0[9]_i1[9]  (\xor_i0[9]_i1[9]_o , i0[9], i1[9]);

endmodule 

module binary_mux_s4_w1
  (
  i0,
  i1,
  i10,
  i11,
  i12,
  i13,
  i14,
  i15,
  i2,
  i3,
  i4,
  i5,
  i6,
  i7,
  i8,
  i9,
  sel,
  o
  );

  input i0;
  input i1;
  input i10;
  input i11;
  input i12;
  input i13;
  input i14;
  input i15;
  input i2;
  input i3;
  input i4;
  input i5;
  input i6;
  input i7;
  input i8;
  input i9;
  input [3:0] sel;
  output o;

  wire  B0_0;
  wire  B0_1;
  wire  B0_2;
  wire  B0_3;
  wire  B0_4;
  wire  B0_5;
  wire  B0_6;
  wire  B0_7;
  wire  B1_0;
  wire  B1_1;
  wire  B1_2;
  wire  B1_3;
  wire  B2_0;
  wire  B2_1;

  AL_MUX al_mux_b0_0_0 (
    .i0(i0),
    .i1(i1),
    .sel(sel[0]),
    .o(B0_0));
  AL_MUX al_mux_b0_0_1 (
    .i0(i2),
    .i1(i3),
    .sel(sel[0]),
    .o(B0_1));
  AL_MUX al_mux_b0_0_2 (
    .i0(i4),
    .i1(i5),
    .sel(sel[0]),
    .o(B0_2));
  AL_MUX al_mux_b0_0_3 (
    .i0(i6),
    .i1(i7),
    .sel(sel[0]),
    .o(B0_3));
  AL_MUX al_mux_b0_0_4 (
    .i0(i8),
    .i1(i9),
    .sel(sel[0]),
    .o(B0_4));
  AL_MUX al_mux_b0_0_5 (
    .i0(i10),
    .i1(i11),
    .sel(sel[0]),
    .o(B0_5));
  AL_MUX al_mux_b0_0_6 (
    .i0(i12),
    .i1(i13),
    .sel(sel[0]),
    .o(B0_6));
  AL_MUX al_mux_b0_0_7 (
    .i0(i14),
    .i1(i15),
    .sel(sel[0]),
    .o(B0_7));
  AL_MUX al_mux_b0_1_0 (
    .i0(B0_0),
    .i1(B0_1),
    .sel(sel[1]),
    .o(B1_0));
  AL_MUX al_mux_b0_1_1 (
    .i0(B0_2),
    .i1(B0_3),
    .sel(sel[1]),
    .o(B1_1));
  AL_MUX al_mux_b0_1_2 (
    .i0(B0_4),
    .i1(B0_5),
    .sel(sel[1]),
    .o(B1_2));
  AL_MUX al_mux_b0_1_3 (
    .i0(B0_6),
    .i1(B0_7),
    .sel(sel[1]),
    .o(B1_3));
  AL_MUX al_mux_b0_2_0 (
    .i0(B1_0),
    .i1(B1_1),
    .sel(sel[2]),
    .o(B2_0));
  AL_MUX al_mux_b0_2_1 (
    .i0(B1_2),
    .i1(B1_3),
    .sel(sel[2]),
    .o(B2_1));
  AL_MUX al_mux_b0_3_0 (
    .i0(B2_0),
    .i1(B2_1),
    .sel(sel[3]),
    .o(o));

endmodule 

module add_pu3_pu3_o3
  (
  i0,
  i1,
  o
  );

  input [2:0] i0;
  input [2:0] i1;
  output [2:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a2;
  wire net_b0;
  wire net_b1;
  wire net_b2;
  wire net_cout0;
  wire net_cout1;
  wire net_cout2;
  wire net_sum0;
  wire net_sum1;
  wire net_sum2;

  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD comp_0 (
    .a(net_a0),
    .b(net_b0),
    .c(1'b0),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD comp_1 (
    .a(net_a1),
    .b(net_b1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD comp_2 (
    .a(net_a2),
    .b(net_b2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));

endmodule 

module add_pu13_pu13_o13
  (
  i0,
  i1,
  o
  );

  input [12:0] i0;
  input [12:0] i1;
  output [12:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a10;
  wire net_a11;
  wire net_a12;
  wire net_a2;
  wire net_a3;
  wire net_a4;
  wire net_a5;
  wire net_a6;
  wire net_a7;
  wire net_a8;
  wire net_a9;
  wire net_b0;
  wire net_b1;
  wire net_b10;
  wire net_b11;
  wire net_b12;
  wire net_b2;
  wire net_b3;
  wire net_b4;
  wire net_b5;
  wire net_b6;
  wire net_b7;
  wire net_b8;
  wire net_b9;
  wire net_cout0;
  wire net_cout1;
  wire net_cout10;
  wire net_cout11;
  wire net_cout12;
  wire net_cout2;
  wire net_cout3;
  wire net_cout4;
  wire net_cout5;
  wire net_cout6;
  wire net_cout7;
  wire net_cout8;
  wire net_cout9;
  wire net_sum0;
  wire net_sum1;
  wire net_sum10;
  wire net_sum11;
  wire net_sum12;
  wire net_sum2;
  wire net_sum3;
  wire net_sum4;
  wire net_sum5;
  wire net_sum6;
  wire net_sum7;
  wire net_sum8;
  wire net_sum9;

  assign net_a12 = i0[12];
  assign net_a11 = i0[11];
  assign net_a10 = i0[10];
  assign net_a9 = i0[9];
  assign net_a8 = i0[8];
  assign net_a7 = i0[7];
  assign net_a6 = i0[6];
  assign net_a5 = i0[5];
  assign net_a4 = i0[4];
  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b12 = i1[12];
  assign net_b11 = i1[11];
  assign net_b10 = i1[10];
  assign net_b9 = i1[9];
  assign net_b8 = i1[8];
  assign net_b7 = i1[7];
  assign net_b6 = i1[6];
  assign net_b5 = i1[5];
  assign net_b4 = i1[4];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[12] = net_sum12;
  assign o[11] = net_sum11;
  assign o[10] = net_sum10;
  assign o[9] = net_sum9;
  assign o[8] = net_sum8;
  assign o[7] = net_sum7;
  assign o[6] = net_sum6;
  assign o[5] = net_sum5;
  assign o[4] = net_sum4;
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD comp_0 (
    .a(net_a0),
    .b(net_b0),
    .c(1'b0),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD comp_1 (
    .a(net_a1),
    .b(net_b1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD comp_10 (
    .a(net_a10),
    .b(net_b10),
    .c(net_cout9),
    .cout(net_cout10),
    .sum(net_sum10));
  AL_FADD comp_11 (
    .a(net_a11),
    .b(net_b11),
    .c(net_cout10),
    .cout(net_cout11),
    .sum(net_sum11));
  AL_FADD comp_12 (
    .a(net_a12),
    .b(net_b12),
    .c(net_cout11),
    .cout(net_cout12),
    .sum(net_sum12));
  AL_FADD comp_2 (
    .a(net_a2),
    .b(net_b2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD comp_3 (
    .a(net_a3),
    .b(net_b3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  AL_FADD comp_4 (
    .a(net_a4),
    .b(net_b4),
    .c(net_cout3),
    .cout(net_cout4),
    .sum(net_sum4));
  AL_FADD comp_5 (
    .a(net_a5),
    .b(net_b5),
    .c(net_cout4),
    .cout(net_cout5),
    .sum(net_sum5));
  AL_FADD comp_6 (
    .a(net_a6),
    .b(net_b6),
    .c(net_cout5),
    .cout(net_cout6),
    .sum(net_sum6));
  AL_FADD comp_7 (
    .a(net_a7),
    .b(net_b7),
    .c(net_cout6),
    .cout(net_cout7),
    .sum(net_sum7));
  AL_FADD comp_8 (
    .a(net_a8),
    .b(net_b8),
    .c(net_cout7),
    .cout(net_cout8),
    .sum(net_sum8));
  AL_FADD comp_9 (
    .a(net_a9),
    .b(net_b9),
    .c(net_cout8),
    .cout(net_cout9),
    .sum(net_sum9));

endmodule 

module eq_w13
  (
  i0,
  i1,
  o
  );

  input [12:0] i0;
  input [12:0] i1;
  output o;

  wire \or_or_or_xor_i0[0]_i_o ;
  wire \or_or_xor_i0[0]_i1[0_o ;
  wire \or_or_xor_i0[6]_i1[6_o ;
  wire \or_or_xor_i0[9]_i1[9_o ;
  wire \or_xor_i0[0]_i1[0]_o_o ;
  wire \or_xor_i0[11]_i1[11]_o ;
  wire \or_xor_i0[1]_i1[1]_o_o ;
  wire \or_xor_i0[3]_i1[3]_o_o ;
  wire \or_xor_i0[4]_i1[4]_o_o ;
  wire \or_xor_i0[6]_i1[6]_o_o ;
  wire \or_xor_i0[7]_i1[7]_o_o ;
  wire \or_xor_i0[9]_i1[9]_o_o ;
  wire \xor_i0[0]_i1[0]_o ;
  wire \xor_i0[10]_i1[10]_o ;
  wire \xor_i0[11]_i1[11]_o ;
  wire \xor_i0[12]_i1[12]_o ;
  wire \xor_i0[1]_i1[1]_o ;
  wire \xor_i0[2]_i1[2]_o ;
  wire \xor_i0[3]_i1[3]_o ;
  wire \xor_i0[4]_i1[4]_o ;
  wire \xor_i0[5]_i1[5]_o ;
  wire \xor_i0[6]_i1[6]_o ;
  wire \xor_i0[7]_i1[7]_o ;
  wire \xor_i0[8]_i1[8]_o ;
  wire \xor_i0[9]_i1[9]_o ;

  not none_diff (o, \or_or_or_xor_i0[0]_i_o );
  or \or_or_or_xor_i0[0]_i  (\or_or_or_xor_i0[0]_i_o , \or_or_xor_i0[0]_i1[0_o , \or_or_xor_i0[6]_i1[6_o );
  or \or_or_xor_i0[0]_i1[0  (\or_or_xor_i0[0]_i1[0_o , \or_xor_i0[0]_i1[0]_o_o , \or_xor_i0[3]_i1[3]_o_o );
  or \or_or_xor_i0[6]_i1[6  (\or_or_xor_i0[6]_i1[6_o , \or_xor_i0[6]_i1[6]_o_o , \or_or_xor_i0[9]_i1[9_o );
  or \or_or_xor_i0[9]_i1[9  (\or_or_xor_i0[9]_i1[9_o , \or_xor_i0[9]_i1[9]_o_o , \or_xor_i0[11]_i1[11]_o );
  or \or_xor_i0[0]_i1[0]_o  (\or_xor_i0[0]_i1[0]_o_o , \xor_i0[0]_i1[0]_o , \or_xor_i0[1]_i1[1]_o_o );
  or \or_xor_i0[11]_i1[11]  (\or_xor_i0[11]_i1[11]_o , \xor_i0[11]_i1[11]_o , \xor_i0[12]_i1[12]_o );
  or \or_xor_i0[1]_i1[1]_o  (\or_xor_i0[1]_i1[1]_o_o , \xor_i0[1]_i1[1]_o , \xor_i0[2]_i1[2]_o );
  or \or_xor_i0[3]_i1[3]_o  (\or_xor_i0[3]_i1[3]_o_o , \xor_i0[3]_i1[3]_o , \or_xor_i0[4]_i1[4]_o_o );
  or \or_xor_i0[4]_i1[4]_o  (\or_xor_i0[4]_i1[4]_o_o , \xor_i0[4]_i1[4]_o , \xor_i0[5]_i1[5]_o );
  or \or_xor_i0[6]_i1[6]_o  (\or_xor_i0[6]_i1[6]_o_o , \xor_i0[6]_i1[6]_o , \or_xor_i0[7]_i1[7]_o_o );
  or \or_xor_i0[7]_i1[7]_o  (\or_xor_i0[7]_i1[7]_o_o , \xor_i0[7]_i1[7]_o , \xor_i0[8]_i1[8]_o );
  or \or_xor_i0[9]_i1[9]_o  (\or_xor_i0[9]_i1[9]_o_o , \xor_i0[9]_i1[9]_o , \xor_i0[10]_i1[10]_o );
  xor \xor_i0[0]_i1[0]  (\xor_i0[0]_i1[0]_o , i0[0], i1[0]);
  xor \xor_i0[10]_i1[10]  (\xor_i0[10]_i1[10]_o , i0[10], i1[10]);
  xor \xor_i0[11]_i1[11]  (\xor_i0[11]_i1[11]_o , i0[11], i1[11]);
  xor \xor_i0[12]_i1[12]  (\xor_i0[12]_i1[12]_o , i0[12], i1[12]);
  xor \xor_i0[1]_i1[1]  (\xor_i0[1]_i1[1]_o , i0[1], i1[1]);
  xor \xor_i0[2]_i1[2]  (\xor_i0[2]_i1[2]_o , i0[2], i1[2]);
  xor \xor_i0[3]_i1[3]  (\xor_i0[3]_i1[3]_o , i0[3], i1[3]);
  xor \xor_i0[4]_i1[4]  (\xor_i0[4]_i1[4]_o , i0[4], i1[4]);
  xor \xor_i0[5]_i1[5]  (\xor_i0[5]_i1[5]_o , i0[5], i1[5]);
  xor \xor_i0[6]_i1[6]  (\xor_i0[6]_i1[6]_o , i0[6], i1[6]);
  xor \xor_i0[7]_i1[7]  (\xor_i0[7]_i1[7]_o , i0[7], i1[7]);
  xor \xor_i0[8]_i1[8]  (\xor_i0[8]_i1[8]_o , i0[8], i1[8]);
  xor \xor_i0[9]_i1[9]  (\xor_i0[9]_i1[9]_o , i0[9], i1[9]);

endmodule 

module lt_u13_u13
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [12:0] i0;
  input [12:0] i1;
  output o;

  wire [12:0] diff;
  wire diff_6_11;
  wire less_6_11;
  wire \less_6_11_inst/diff_0 ;
  wire \less_6_11_inst/diff_1 ;
  wire \less_6_11_inst/diff_2 ;
  wire \less_6_11_inst/diff_3 ;
  wire \less_6_11_inst/diff_4 ;
  wire \less_6_11_inst/diff_5 ;
  wire \less_6_11_inst/o_0 ;
  wire \less_6_11_inst/o_1 ;
  wire \less_6_11_inst/o_2 ;
  wire \less_6_11_inst/o_3 ;
  wire \less_6_11_inst/o_4 ;
  wire o_0;
  wire o_1;
  wire o_2;
  wire o_3;
  wire o_4;
  wire o_5;
  wire o_6;

  or any_diff_6_11 (diff_6_11, diff[6], diff[7], diff[8], diff[9], diff[10], diff[11]);
  xor diff_0 (diff[0], i0[0], i1[0]);
  xor diff_1 (diff[1], i0[1], i1[1]);
  xor diff_10 (diff[10], i0[10], i1[10]);
  xor diff_11 (diff[11], i0[11], i1[11]);
  xor diff_12 (diff[12], i0[12], i1[12]);
  xor diff_2 (diff[2], i0[2], i1[2]);
  xor diff_3 (diff[3], i0[3], i1[3]);
  xor diff_4 (diff[4], i0[4], i1[4]);
  xor diff_5 (diff[5], i0[5], i1[5]);
  xor diff_6 (diff[6], i0[6], i1[6]);
  xor diff_7 (diff[7], i0[7], i1[7]);
  xor diff_8 (diff[8], i0[8], i1[8]);
  xor diff_9 (diff[9], i0[9], i1[9]);
  AL_MUX \less_6_11_inst/mux_0  (
    .i0(1'b0),
    .i1(i1[6]),
    .sel(\less_6_11_inst/diff_0 ),
    .o(\less_6_11_inst/o_0 ));
  AL_MUX \less_6_11_inst/mux_1  (
    .i0(\less_6_11_inst/o_0 ),
    .i1(i1[7]),
    .sel(\less_6_11_inst/diff_1 ),
    .o(\less_6_11_inst/o_1 ));
  AL_MUX \less_6_11_inst/mux_2  (
    .i0(\less_6_11_inst/o_1 ),
    .i1(i1[8]),
    .sel(\less_6_11_inst/diff_2 ),
    .o(\less_6_11_inst/o_2 ));
  AL_MUX \less_6_11_inst/mux_3  (
    .i0(\less_6_11_inst/o_2 ),
    .i1(i1[9]),
    .sel(\less_6_11_inst/diff_3 ),
    .o(\less_6_11_inst/o_3 ));
  AL_MUX \less_6_11_inst/mux_4  (
    .i0(\less_6_11_inst/o_3 ),
    .i1(i1[10]),
    .sel(\less_6_11_inst/diff_4 ),
    .o(\less_6_11_inst/o_4 ));
  AL_MUX \less_6_11_inst/mux_5  (
    .i0(\less_6_11_inst/o_4 ),
    .i1(i1[11]),
    .sel(\less_6_11_inst/diff_5 ),
    .o(less_6_11));
  xor \less_6_11_inst/xor_0  (\less_6_11_inst/diff_0 , i0[6], i1[6]);
  xor \less_6_11_inst/xor_1  (\less_6_11_inst/diff_1 , i0[7], i1[7]);
  xor \less_6_11_inst/xor_2  (\less_6_11_inst/diff_2 , i0[8], i1[8]);
  xor \less_6_11_inst/xor_3  (\less_6_11_inst/diff_3 , i0[9], i1[9]);
  xor \less_6_11_inst/xor_4  (\less_6_11_inst/diff_4 , i0[10], i1[10]);
  xor \less_6_11_inst/xor_5  (\less_6_11_inst/diff_5 , i0[11], i1[11]);
  AL_MUX mux_0 (
    .i0(ci),
    .i1(i1[0]),
    .sel(diff[0]),
    .o(o_0));
  AL_MUX mux_1 (
    .i0(o_0),
    .i1(i1[1]),
    .sel(diff[1]),
    .o(o_1));
  AL_MUX mux_2 (
    .i0(o_1),
    .i1(i1[2]),
    .sel(diff[2]),
    .o(o_2));
  AL_MUX mux_3 (
    .i0(o_2),
    .i1(i1[3]),
    .sel(diff[3]),
    .o(o_3));
  AL_MUX mux_4 (
    .i0(o_3),
    .i1(i1[4]),
    .sel(diff[4]),
    .o(o_4));
  AL_MUX mux_5 (
    .i0(o_4),
    .i1(i1[5]),
    .sel(diff[5]),
    .o(o_5));
  AL_MUX mux_6 (
    .i0(o_5),
    .i1(less_6_11),
    .sel(diff_6_11),
    .o(o_6));
  AL_MUX mux_7 (
    .i0(o_6),
    .i1(i1[12]),
    .sel(diff[12]),
    .o(o));

endmodule 

module add_pu11_mu11_o11
  (
  i0,
  i1,
  o
  );

  input [10:0] i0;
  input [10:0] i1;
  output [10:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a10;
  wire net_a2;
  wire net_a3;
  wire net_a4;
  wire net_a5;
  wire net_a6;
  wire net_a7;
  wire net_a8;
  wire net_a9;
  wire net_b0;
  wire net_b1;
  wire net_b10;
  wire net_b2;
  wire net_b3;
  wire net_b4;
  wire net_b5;
  wire net_b6;
  wire net_b7;
  wire net_b8;
  wire net_b9;
  wire net_cout0;
  wire net_cout1;
  wire net_cout10;
  wire net_cout2;
  wire net_cout3;
  wire net_cout4;
  wire net_cout5;
  wire net_cout6;
  wire net_cout7;
  wire net_cout8;
  wire net_cout9;
  wire net_nb0;
  wire net_nb1;
  wire net_nb10;
  wire net_nb2;
  wire net_nb3;
  wire net_nb4;
  wire net_nb5;
  wire net_nb6;
  wire net_nb7;
  wire net_nb8;
  wire net_nb9;
  wire net_sum0;
  wire net_sum1;
  wire net_sum10;
  wire net_sum2;
  wire net_sum3;
  wire net_sum4;
  wire net_sum5;
  wire net_sum6;
  wire net_sum7;
  wire net_sum8;
  wire net_sum9;

  assign net_a10 = i0[10];
  assign net_a9 = i0[9];
  assign net_a8 = i0[8];
  assign net_a7 = i0[7];
  assign net_a6 = i0[6];
  assign net_a5 = i0[5];
  assign net_a4 = i0[4];
  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b10 = i1[10];
  assign net_b9 = i1[9];
  assign net_b8 = i1[8];
  assign net_b7 = i1[7];
  assign net_b6 = i1[6];
  assign net_b5 = i1[5];
  assign net_b4 = i1[4];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[10] = net_sum10;
  assign o[9] = net_sum9;
  assign o[8] = net_sum8;
  assign o[7] = net_sum7;
  assign o[6] = net_sum6;
  assign o[5] = net_sum5;
  assign o[4] = net_sum4;
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD comp_0 (
    .a(net_a0),
    .b(net_nb0),
    .c(1'b1),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD comp_1 (
    .a(net_a1),
    .b(net_nb1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD comp_10 (
    .a(net_a10),
    .b(net_nb10),
    .c(net_cout9),
    .cout(net_cout10),
    .sum(net_sum10));
  AL_FADD comp_2 (
    .a(net_a2),
    .b(net_nb2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD comp_3 (
    .a(net_a3),
    .b(net_nb3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  AL_FADD comp_4 (
    .a(net_a4),
    .b(net_nb4),
    .c(net_cout3),
    .cout(net_cout4),
    .sum(net_sum4));
  AL_FADD comp_5 (
    .a(net_a5),
    .b(net_nb5),
    .c(net_cout4),
    .cout(net_cout5),
    .sum(net_sum5));
  AL_FADD comp_6 (
    .a(net_a6),
    .b(net_nb6),
    .c(net_cout5),
    .cout(net_cout6),
    .sum(net_sum6));
  AL_FADD comp_7 (
    .a(net_a7),
    .b(net_nb7),
    .c(net_cout6),
    .cout(net_cout7),
    .sum(net_sum7));
  AL_FADD comp_8 (
    .a(net_a8),
    .b(net_nb8),
    .c(net_cout7),
    .cout(net_cout8),
    .sum(net_sum8));
  AL_FADD comp_9 (
    .a(net_a9),
    .b(net_nb9),
    .c(net_cout8),
    .cout(net_cout9),
    .sum(net_sum9));
  not inv_b0 (net_nb0, net_b0);
  not inv_b1 (net_nb1, net_b1);
  not inv_b10 (net_nb10, net_b10);
  not inv_b2 (net_nb2, net_b2);
  not inv_b3 (net_nb3, net_b3);
  not inv_b4 (net_nb4, net_b4);
  not inv_b5 (net_nb5, net_b5);
  not inv_b6 (net_nb6, net_b6);
  not inv_b7 (net_nb7, net_b7);
  not inv_b8 (net_nb8, net_b8);
  not inv_b9 (net_nb9, net_b9);

endmodule 

module add_pu8_pu8_o8
  (
  i0,
  i1,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  output [7:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a2;
  wire net_a3;
  wire net_a4;
  wire net_a5;
  wire net_a6;
  wire net_a7;
  wire net_b0;
  wire net_b1;
  wire net_b2;
  wire net_b3;
  wire net_b4;
  wire net_b5;
  wire net_b6;
  wire net_b7;
  wire net_cout0;
  wire net_cout1;
  wire net_cout2;
  wire net_cout3;
  wire net_cout4;
  wire net_cout5;
  wire net_cout6;
  wire net_cout7;
  wire net_sum0;
  wire net_sum1;
  wire net_sum2;
  wire net_sum3;
  wire net_sum4;
  wire net_sum5;
  wire net_sum6;
  wire net_sum7;

  assign net_a7 = i0[7];
  assign net_a6 = i0[6];
  assign net_a5 = i0[5];
  assign net_a4 = i0[4];
  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b7 = i1[7];
  assign net_b6 = i1[6];
  assign net_b5 = i1[5];
  assign net_b4 = i1[4];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[7] = net_sum7;
  assign o[6] = net_sum6;
  assign o[5] = net_sum5;
  assign o[4] = net_sum4;
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD comp_0 (
    .a(net_a0),
    .b(net_b0),
    .c(1'b0),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD comp_1 (
    .a(net_a1),
    .b(net_b1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD comp_2 (
    .a(net_a2),
    .b(net_b2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD comp_3 (
    .a(net_a3),
    .b(net_b3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  AL_FADD comp_4 (
    .a(net_a4),
    .b(net_b4),
    .c(net_cout3),
    .cout(net_cout4),
    .sum(net_sum4));
  AL_FADD comp_5 (
    .a(net_a5),
    .b(net_b5),
    .c(net_cout4),
    .cout(net_cout5),
    .sum(net_sum5));
  AL_FADD comp_6 (
    .a(net_a6),
    .b(net_b6),
    .c(net_cout5),
    .cout(net_cout6),
    .sum(net_sum6));
  AL_FADD comp_7 (
    .a(net_a7),
    .b(net_b7),
    .c(net_cout6),
    .cout(net_cout7),
    .sum(net_sum7));

endmodule 

module eq_w11
  (
  i0,
  i1,
  o
  );

  input [10:0] i0;
  input [10:0] i1;
  output o;

  wire \or_or_or_xor_i0[0]_i_o ;
  wire \or_or_xor_i0[0]_i1[0_o ;
  wire \or_or_xor_i0[5]_i1[5_o ;
  wire \or_xor_i0[0]_i1[0]_o_o ;
  wire \or_xor_i0[2]_i1[2]_o_o ;
  wire \or_xor_i0[3]_i1[3]_o_o ;
  wire \or_xor_i0[5]_i1[5]_o_o ;
  wire \or_xor_i0[6]_i1[6]_o_o ;
  wire \or_xor_i0[8]_i1[8]_o_o ;
  wire \or_xor_i0[9]_i1[9]_o_o ;
  wire \xor_i0[0]_i1[0]_o ;
  wire \xor_i0[10]_i1[10]_o ;
  wire \xor_i0[1]_i1[1]_o ;
  wire \xor_i0[2]_i1[2]_o ;
  wire \xor_i0[3]_i1[3]_o ;
  wire \xor_i0[4]_i1[4]_o ;
  wire \xor_i0[5]_i1[5]_o ;
  wire \xor_i0[6]_i1[6]_o ;
  wire \xor_i0[7]_i1[7]_o ;
  wire \xor_i0[8]_i1[8]_o ;
  wire \xor_i0[9]_i1[9]_o ;

  not none_diff (o, \or_or_or_xor_i0[0]_i_o );
  or \or_or_or_xor_i0[0]_i  (\or_or_or_xor_i0[0]_i_o , \or_or_xor_i0[0]_i1[0_o , \or_or_xor_i0[5]_i1[5_o );
  or \or_or_xor_i0[0]_i1[0  (\or_or_xor_i0[0]_i1[0_o , \or_xor_i0[0]_i1[0]_o_o , \or_xor_i0[2]_i1[2]_o_o );
  or \or_or_xor_i0[5]_i1[5  (\or_or_xor_i0[5]_i1[5_o , \or_xor_i0[5]_i1[5]_o_o , \or_xor_i0[8]_i1[8]_o_o );
  or \or_xor_i0[0]_i1[0]_o  (\or_xor_i0[0]_i1[0]_o_o , \xor_i0[0]_i1[0]_o , \xor_i0[1]_i1[1]_o );
  or \or_xor_i0[2]_i1[2]_o  (\or_xor_i0[2]_i1[2]_o_o , \xor_i0[2]_i1[2]_o , \or_xor_i0[3]_i1[3]_o_o );
  or \or_xor_i0[3]_i1[3]_o  (\or_xor_i0[3]_i1[3]_o_o , \xor_i0[3]_i1[3]_o , \xor_i0[4]_i1[4]_o );
  or \or_xor_i0[5]_i1[5]_o  (\or_xor_i0[5]_i1[5]_o_o , \xor_i0[5]_i1[5]_o , \or_xor_i0[6]_i1[6]_o_o );
  or \or_xor_i0[6]_i1[6]_o  (\or_xor_i0[6]_i1[6]_o_o , \xor_i0[6]_i1[6]_o , \xor_i0[7]_i1[7]_o );
  or \or_xor_i0[8]_i1[8]_o  (\or_xor_i0[8]_i1[8]_o_o , \xor_i0[8]_i1[8]_o , \or_xor_i0[9]_i1[9]_o_o );
  or \or_xor_i0[9]_i1[9]_o  (\or_xor_i0[9]_i1[9]_o_o , \xor_i0[9]_i1[9]_o , \xor_i0[10]_i1[10]_o );
  xor \xor_i0[0]_i1[0]  (\xor_i0[0]_i1[0]_o , i0[0], i1[0]);
  xor \xor_i0[10]_i1[10]  (\xor_i0[10]_i1[10]_o , i0[10], i1[10]);
  xor \xor_i0[1]_i1[1]  (\xor_i0[1]_i1[1]_o , i0[1], i1[1]);
  xor \xor_i0[2]_i1[2]  (\xor_i0[2]_i1[2]_o , i0[2], i1[2]);
  xor \xor_i0[3]_i1[3]  (\xor_i0[3]_i1[3]_o , i0[3], i1[3]);
  xor \xor_i0[4]_i1[4]  (\xor_i0[4]_i1[4]_o , i0[4], i1[4]);
  xor \xor_i0[5]_i1[5]  (\xor_i0[5]_i1[5]_o , i0[5], i1[5]);
  xor \xor_i0[6]_i1[6]  (\xor_i0[6]_i1[6]_o , i0[6], i1[6]);
  xor \xor_i0[7]_i1[7]  (\xor_i0[7]_i1[7]_o , i0[7], i1[7]);
  xor \xor_i0[8]_i1[8]  (\xor_i0[8]_i1[8]_o , i0[8], i1[8]);
  xor \xor_i0[9]_i1[9]  (\xor_i0[9]_i1[9]_o , i0[9], i1[9]);

endmodule 

module eq_w5
  (
  i0,
  i1,
  o
  );

  input [4:0] i0;
  input [4:0] i1;
  output o;

  wire \or_or_xor_i0[0]_i1[0_o ;
  wire \or_xor_i0[0]_i1[0]_o_o ;
  wire \or_xor_i0[2]_i1[2]_o_o ;
  wire \or_xor_i0[3]_i1[3]_o_o ;
  wire \xor_i0[0]_i1[0]_o ;
  wire \xor_i0[1]_i1[1]_o ;
  wire \xor_i0[2]_i1[2]_o ;
  wire \xor_i0[3]_i1[3]_o ;
  wire \xor_i0[4]_i1[4]_o ;

  not none_diff (o, \or_or_xor_i0[0]_i1[0_o );
  or \or_or_xor_i0[0]_i1[0  (\or_or_xor_i0[0]_i1[0_o , \or_xor_i0[0]_i1[0]_o_o , \or_xor_i0[2]_i1[2]_o_o );
  or \or_xor_i0[0]_i1[0]_o  (\or_xor_i0[0]_i1[0]_o_o , \xor_i0[0]_i1[0]_o , \xor_i0[1]_i1[1]_o );
  or \or_xor_i0[2]_i1[2]_o  (\or_xor_i0[2]_i1[2]_o_o , \xor_i0[2]_i1[2]_o , \or_xor_i0[3]_i1[3]_o_o );
  or \or_xor_i0[3]_i1[3]_o  (\or_xor_i0[3]_i1[3]_o_o , \xor_i0[3]_i1[3]_o , \xor_i0[4]_i1[4]_o );
  xor \xor_i0[0]_i1[0]  (\xor_i0[0]_i1[0]_o , i0[0], i1[0]);
  xor \xor_i0[1]_i1[1]  (\xor_i0[1]_i1[1]_o , i0[1], i1[1]);
  xor \xor_i0[2]_i1[2]  (\xor_i0[2]_i1[2]_o , i0[2], i1[2]);
  xor \xor_i0[3]_i1[3]  (\xor_i0[3]_i1[3]_o , i0[3], i1[3]);
  xor \xor_i0[4]_i1[4]  (\xor_i0[4]_i1[4]_o , i0[4], i1[4]);

endmodule 

module lt_u11_u11
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [10:0] i0;
  input [10:0] i1;
  output o;

  wire [10:0] diff;
  wire diff_6_10;
  wire less_6_10;
  wire \less_6_10_inst/diff_0 ;
  wire \less_6_10_inst/diff_1 ;
  wire \less_6_10_inst/diff_2 ;
  wire \less_6_10_inst/diff_3 ;
  wire \less_6_10_inst/diff_4 ;
  wire \less_6_10_inst/o_0 ;
  wire \less_6_10_inst/o_1 ;
  wire \less_6_10_inst/o_2 ;
  wire \less_6_10_inst/o_3 ;
  wire o_0;
  wire o_1;
  wire o_2;
  wire o_3;
  wire o_4;
  wire o_5;

  or any_diff_6_10 (diff_6_10, diff[6], diff[7], diff[8], diff[9], diff[10]);
  xor diff_0 (diff[0], i0[0], i1[0]);
  xor diff_1 (diff[1], i0[1], i1[1]);
  xor diff_10 (diff[10], i0[10], i1[10]);
  xor diff_2 (diff[2], i0[2], i1[2]);
  xor diff_3 (diff[3], i0[3], i1[3]);
  xor diff_4 (diff[4], i0[4], i1[4]);
  xor diff_5 (diff[5], i0[5], i1[5]);
  xor diff_6 (diff[6], i0[6], i1[6]);
  xor diff_7 (diff[7], i0[7], i1[7]);
  xor diff_8 (diff[8], i0[8], i1[8]);
  xor diff_9 (diff[9], i0[9], i1[9]);
  AL_MUX \less_6_10_inst/mux_0  (
    .i0(1'b0),
    .i1(i1[6]),
    .sel(\less_6_10_inst/diff_0 ),
    .o(\less_6_10_inst/o_0 ));
  AL_MUX \less_6_10_inst/mux_1  (
    .i0(\less_6_10_inst/o_0 ),
    .i1(i1[7]),
    .sel(\less_6_10_inst/diff_1 ),
    .o(\less_6_10_inst/o_1 ));
  AL_MUX \less_6_10_inst/mux_2  (
    .i0(\less_6_10_inst/o_1 ),
    .i1(i1[8]),
    .sel(\less_6_10_inst/diff_2 ),
    .o(\less_6_10_inst/o_2 ));
  AL_MUX \less_6_10_inst/mux_3  (
    .i0(\less_6_10_inst/o_2 ),
    .i1(i1[9]),
    .sel(\less_6_10_inst/diff_3 ),
    .o(\less_6_10_inst/o_3 ));
  AL_MUX \less_6_10_inst/mux_4  (
    .i0(\less_6_10_inst/o_3 ),
    .i1(i1[10]),
    .sel(\less_6_10_inst/diff_4 ),
    .o(less_6_10));
  xor \less_6_10_inst/xor_0  (\less_6_10_inst/diff_0 , i0[6], i1[6]);
  xor \less_6_10_inst/xor_1  (\less_6_10_inst/diff_1 , i0[7], i1[7]);
  xor \less_6_10_inst/xor_2  (\less_6_10_inst/diff_2 , i0[8], i1[8]);
  xor \less_6_10_inst/xor_3  (\less_6_10_inst/diff_3 , i0[9], i1[9]);
  xor \less_6_10_inst/xor_4  (\less_6_10_inst/diff_4 , i0[10], i1[10]);
  AL_MUX mux_0 (
    .i0(ci),
    .i1(i1[0]),
    .sel(diff[0]),
    .o(o_0));
  AL_MUX mux_1 (
    .i0(o_0),
    .i1(i1[1]),
    .sel(diff[1]),
    .o(o_1));
  AL_MUX mux_2 (
    .i0(o_1),
    .i1(i1[2]),
    .sel(diff[2]),
    .o(o_2));
  AL_MUX mux_3 (
    .i0(o_2),
    .i1(i1[3]),
    .sel(diff[3]),
    .o(o_3));
  AL_MUX mux_4 (
    .i0(o_3),
    .i1(i1[4]),
    .sel(diff[4]),
    .o(o_4));
  AL_MUX mux_5 (
    .i0(o_4),
    .i1(i1[5]),
    .sel(diff[5]),
    .o(o_5));
  AL_MUX mux_6 (
    .i0(o_5),
    .i1(less_6_10),
    .sel(diff_6_10),
    .o(o));

endmodule 

module mult_u5_u4_o7
  (
  i0,
  i1,
  o
  );

  input [4:0] i0;
  input [3:0] i1;
  output [6:0] o;

  wire a0;
  wire a1;
  wire a2;
  wire a3;
  wire a4;
  wire b0;
  wire b1;
  wire b2;
  wire b3;
  wire net_and_a0_b0;
  wire net_and_a0_b1;
  wire net_and_a0_b2;
  wire net_and_a0_b3;
  wire net_and_a1_b0;
  wire net_and_a1_b1;
  wire net_and_a1_b2;
  wire net_and_a1_b3;
  wire net_and_a2_b0;
  wire net_and_a2_b1;
  wire net_and_a2_b2;
  wire net_and_a2_b3;
  wire net_and_a3_b0;
  wire net_and_a3_b1;
  wire net_and_a3_b2;
  wire net_and_a3_b3;
  wire net_and_a4_b0;
  wire net_and_a4_b1;
  wire net_and_a4_b2;
  wire o_0;
  wire o_1;
  wire o_2;
  wire o_3;
  wire o_4;
  wire o_5;
  wire o_6;

  assign a4 = i0[4];
  assign a3 = i0[3];
  assign a2 = i0[2];
  assign a1 = i0[1];
  assign a0 = i0[0];
  assign b3 = i1[3];
  assign b2 = i1[2];
  assign b1 = i1[1];
  assign b0 = i1[0];
  assign o[6] = o_6;
  assign o[5] = o_5;
  assign o[4] = o_4;
  assign o[3] = o_3;
  assign o[2] = o_2;
  assign o[1] = o_1;
  assign o[0] = o_0;
  and and_a0_b0 (net_and_a0_b0, a0, b0);
  and and_a0_b1 (net_and_a0_b1, a0, b1);
  and and_a0_b2 (net_and_a0_b2, a0, b2);
  and and_a0_b3 (net_and_a0_b3, a0, b3);
  and and_a1_b0 (net_and_a1_b0, a1, b0);
  and and_a1_b1 (net_and_a1_b1, a1, b1);
  and and_a1_b2 (net_and_a1_b2, a1, b2);
  and and_a1_b3 (net_and_a1_b3, a1, b3);
  and and_a2_b0 (net_and_a2_b0, a2, b0);
  and and_a2_b1 (net_and_a2_b1, a2, b1);
  and and_a2_b2 (net_and_a2_b2, a2, b2);
  and and_a2_b3 (net_and_a2_b3, a2, b3);
  and and_a3_b0 (net_and_a3_b0, a3, b0);
  and and_a3_b1 (net_and_a3_b1, a3, b1);
  and and_a3_b2 (net_and_a3_b2, a3, b2);
  and and_a3_b3 (net_and_a3_b3, a3, b3);
  and and_a4_b0 (net_and_a4_b0, a4, b0);
  and and_a4_b1 (net_and_a4_b1, a4, b1);
  and and_a4_b2 (net_and_a4_b2, a4, b2);
  add_pu7_pu7_pu6_pu5_o7 sum (
    .i0({net_and_a4_b2,net_and_a4_b1,net_and_a4_b0,net_and_a3_b0,net_and_a2_b0,net_and_a1_b0,net_and_a0_b0}),
    .i1({net_and_a3_b3,net_and_a3_b2,net_and_a3_b1,net_and_a2_b1,net_and_a1_b1,net_and_a0_b1,1'b0}),
    .i2({net_and_a2_b3,net_and_a2_b2,net_and_a1_b2,net_and_a0_b2,2'b00}),
    .i3({net_and_a1_b3,net_and_a0_b3,3'b000}),
    .o({o_6,o_5,o_4,o_3,o_2,o_1,o_0}));

endmodule 

module add_pu5_mu5_o5
  (
  i0,
  i1,
  o
  );

  input [4:0] i0;
  input [4:0] i1;
  output [4:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a2;
  wire net_a3;
  wire net_a4;
  wire net_b0;
  wire net_b1;
  wire net_b2;
  wire net_b3;
  wire net_b4;
  wire net_cout0;
  wire net_cout1;
  wire net_cout2;
  wire net_cout3;
  wire net_cout4;
  wire net_nb0;
  wire net_nb1;
  wire net_nb2;
  wire net_nb3;
  wire net_nb4;
  wire net_sum0;
  wire net_sum1;
  wire net_sum2;
  wire net_sum3;
  wire net_sum4;

  assign net_a4 = i0[4];
  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b4 = i1[4];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[4] = net_sum4;
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD comp_0 (
    .a(net_a0),
    .b(net_nb0),
    .c(1'b1),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD comp_1 (
    .a(net_a1),
    .b(net_nb1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD comp_2 (
    .a(net_a2),
    .b(net_nb2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD comp_3 (
    .a(net_a3),
    .b(net_nb3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  AL_FADD comp_4 (
    .a(net_a4),
    .b(net_nb4),
    .c(net_cout3),
    .cout(net_cout4),
    .sum(net_sum4));
  not inv_b0 (net_nb0, net_b0);
  not inv_b1 (net_nb1, net_b1);
  not inv_b2 (net_nb2, net_b2);
  not inv_b3 (net_nb3, net_b3);
  not inv_b4 (net_nb4, net_b4);

endmodule 

module add_pu15_pu14_pu13_pu12_pu11_pu10_pu9_pu8_o16
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  i5,
  i6,
  i7,
  o
  );

  input [14:0] i0;
  input [13:0] i1;
  input [12:0] i2;
  input [11:0] i3;
  input [10:0] i4;
  input [9:0] i5;
  input [8:0] i6;
  input [7:0] i7;
  output [15:0] o;

  wire net_a0_0;
  wire net_a0_1;
  wire net_a0_10;
  wire net_a0_11;
  wire net_a0_12;
  wire net_a0_13;
  wire net_a0_14;
  wire net_a0_2;
  wire net_a0_3;
  wire net_a0_4;
  wire net_a0_5;
  wire net_a0_6;
  wire net_a0_7;
  wire net_a0_8;
  wire net_a0_9;
  wire net_a1_0;
  wire net_a1_1;
  wire net_a1_10;
  wire net_a1_11;
  wire net_a1_12;
  wire net_a1_13;
  wire net_a1_2;
  wire net_a1_3;
  wire net_a1_4;
  wire net_a1_5;
  wire net_a1_6;
  wire net_a1_7;
  wire net_a1_8;
  wire net_a1_9;
  wire net_a2_0;
  wire net_a2_1;
  wire net_a2_10;
  wire net_a2_11;
  wire net_a2_12;
  wire net_a2_2;
  wire net_a2_3;
  wire net_a2_4;
  wire net_a2_5;
  wire net_a2_6;
  wire net_a2_7;
  wire net_a2_8;
  wire net_a2_9;
  wire net_a3_0;
  wire net_a3_1;
  wire net_a3_10;
  wire net_a3_11;
  wire net_a3_2;
  wire net_a3_3;
  wire net_a3_4;
  wire net_a3_5;
  wire net_a3_6;
  wire net_a3_7;
  wire net_a3_8;
  wire net_a3_9;
  wire net_a4_0;
  wire net_a4_1;
  wire net_a4_10;
  wire net_a4_2;
  wire net_a4_3;
  wire net_a4_4;
  wire net_a4_5;
  wire net_a4_6;
  wire net_a4_7;
  wire net_a4_8;
  wire net_a4_9;
  wire net_a5_0;
  wire net_a5_1;
  wire net_a5_2;
  wire net_a5_3;
  wire net_a5_4;
  wire net_a5_5;
  wire net_a5_6;
  wire net_a5_7;
  wire net_a5_8;
  wire net_a5_9;
  wire net_a6_0;
  wire net_a6_1;
  wire net_a6_2;
  wire net_a6_3;
  wire net_a6_4;
  wire net_a6_5;
  wire net_a6_6;
  wire net_a6_7;
  wire net_a6_8;
  wire net_a7_0;
  wire net_a7_1;
  wire net_a7_2;
  wire net_a7_3;
  wire net_a7_4;
  wire net_a7_5;
  wire net_a7_6;
  wire net_a7_7;
  wire net_cout1_0;
  wire net_cout1_1;
  wire net_cout1_10;
  wire net_cout1_11;
  wire net_cout1_12;
  wire net_cout1_13;
  wire net_cout1_14;
  wire net_cout1_2;
  wire net_cout1_3;
  wire net_cout1_4;
  wire net_cout1_5;
  wire net_cout1_6;
  wire net_cout1_7;
  wire net_cout1_8;
  wire net_cout1_9;
  wire net_cout2_0;
  wire net_cout2_1;
  wire net_cout2_10;
  wire net_cout2_11;
  wire net_cout2_12;
  wire net_cout2_13;
  wire net_cout2_14;
  wire net_cout2_15;
  wire net_cout2_2;
  wire net_cout2_3;
  wire net_cout2_4;
  wire net_cout2_5;
  wire net_cout2_6;
  wire net_cout2_7;
  wire net_cout2_8;
  wire net_cout2_9;
  wire net_cout3_0;
  wire net_cout3_1;
  wire net_cout3_10;
  wire net_cout3_11;
  wire net_cout3_12;
  wire net_cout3_13;
  wire net_cout3_14;
  wire net_cout3_15;
  wire net_cout3_2;
  wire net_cout3_3;
  wire net_cout3_4;
  wire net_cout3_5;
  wire net_cout3_6;
  wire net_cout3_7;
  wire net_cout3_8;
  wire net_cout3_9;
  wire net_cout4_0;
  wire net_cout4_1;
  wire net_cout4_10;
  wire net_cout4_11;
  wire net_cout4_12;
  wire net_cout4_13;
  wire net_cout4_14;
  wire net_cout4_15;
  wire net_cout4_2;
  wire net_cout4_3;
  wire net_cout4_4;
  wire net_cout4_5;
  wire net_cout4_6;
  wire net_cout4_7;
  wire net_cout4_8;
  wire net_cout4_9;
  wire net_cout5_0;
  wire net_cout5_1;
  wire net_cout5_10;
  wire net_cout5_11;
  wire net_cout5_12;
  wire net_cout5_13;
  wire net_cout5_14;
  wire net_cout5_15;
  wire net_cout5_2;
  wire net_cout5_3;
  wire net_cout5_4;
  wire net_cout5_5;
  wire net_cout5_6;
  wire net_cout5_7;
  wire net_cout5_8;
  wire net_cout5_9;
  wire net_cout6_0;
  wire net_cout6_1;
  wire net_cout6_10;
  wire net_cout6_11;
  wire net_cout6_12;
  wire net_cout6_13;
  wire net_cout6_14;
  wire net_cout6_15;
  wire net_cout6_2;
  wire net_cout6_3;
  wire net_cout6_4;
  wire net_cout6_5;
  wire net_cout6_6;
  wire net_cout6_7;
  wire net_cout6_8;
  wire net_cout6_9;
  wire net_cout7_0;
  wire net_cout7_1;
  wire net_cout7_10;
  wire net_cout7_11;
  wire net_cout7_12;
  wire net_cout7_13;
  wire net_cout7_14;
  wire net_cout7_15;
  wire net_cout7_2;
  wire net_cout7_3;
  wire net_cout7_4;
  wire net_cout7_5;
  wire net_cout7_6;
  wire net_cout7_7;
  wire net_cout7_8;
  wire net_cout7_9;
  wire net_sum1_0;
  wire net_sum1_1;
  wire net_sum1_10;
  wire net_sum1_11;
  wire net_sum1_12;
  wire net_sum1_13;
  wire net_sum1_14;
  wire net_sum1_2;
  wire net_sum1_3;
  wire net_sum1_4;
  wire net_sum1_5;
  wire net_sum1_6;
  wire net_sum1_7;
  wire net_sum1_8;
  wire net_sum1_9;
  wire net_sum2_0;
  wire net_sum2_1;
  wire net_sum2_10;
  wire net_sum2_11;
  wire net_sum2_12;
  wire net_sum2_13;
  wire net_sum2_14;
  wire net_sum2_15;
  wire net_sum2_2;
  wire net_sum2_3;
  wire net_sum2_4;
  wire net_sum2_5;
  wire net_sum2_6;
  wire net_sum2_7;
  wire net_sum2_8;
  wire net_sum2_9;
  wire net_sum3_0;
  wire net_sum3_1;
  wire net_sum3_10;
  wire net_sum3_11;
  wire net_sum3_12;
  wire net_sum3_13;
  wire net_sum3_14;
  wire net_sum3_15;
  wire net_sum3_2;
  wire net_sum3_3;
  wire net_sum3_4;
  wire net_sum3_5;
  wire net_sum3_6;
  wire net_sum3_7;
  wire net_sum3_8;
  wire net_sum3_9;
  wire net_sum4_0;
  wire net_sum4_1;
  wire net_sum4_10;
  wire net_sum4_11;
  wire net_sum4_12;
  wire net_sum4_13;
  wire net_sum4_14;
  wire net_sum4_15;
  wire net_sum4_2;
  wire net_sum4_3;
  wire net_sum4_4;
  wire net_sum4_5;
  wire net_sum4_6;
  wire net_sum4_7;
  wire net_sum4_8;
  wire net_sum4_9;
  wire net_sum5_0;
  wire net_sum5_1;
  wire net_sum5_10;
  wire net_sum5_11;
  wire net_sum5_12;
  wire net_sum5_13;
  wire net_sum5_14;
  wire net_sum5_15;
  wire net_sum5_2;
  wire net_sum5_3;
  wire net_sum5_4;
  wire net_sum5_5;
  wire net_sum5_6;
  wire net_sum5_7;
  wire net_sum5_8;
  wire net_sum5_9;
  wire net_sum6_0;
  wire net_sum6_1;
  wire net_sum6_10;
  wire net_sum6_11;
  wire net_sum6_12;
  wire net_sum6_13;
  wire net_sum6_14;
  wire net_sum6_15;
  wire net_sum6_2;
  wire net_sum6_3;
  wire net_sum6_4;
  wire net_sum6_5;
  wire net_sum6_6;
  wire net_sum6_7;
  wire net_sum6_8;
  wire net_sum6_9;
  wire net_sum7_0;
  wire net_sum7_1;
  wire net_sum7_10;
  wire net_sum7_11;
  wire net_sum7_12;
  wire net_sum7_13;
  wire net_sum7_14;
  wire net_sum7_15;
  wire net_sum7_2;
  wire net_sum7_3;
  wire net_sum7_4;
  wire net_sum7_5;
  wire net_sum7_6;
  wire net_sum7_7;
  wire net_sum7_8;
  wire net_sum7_9;

  assign net_a0_14 = i0[14];
  assign net_a0_13 = i0[13];
  assign net_a0_12 = i0[12];
  assign net_a0_11 = i0[11];
  assign net_a0_10 = i0[10];
  assign net_a0_9 = i0[9];
  assign net_a0_8 = i0[8];
  assign net_a0_7 = i0[7];
  assign net_a0_6 = i0[6];
  assign net_a0_5 = i0[5];
  assign net_a0_4 = i0[4];
  assign net_a0_3 = i0[3];
  assign net_a0_2 = i0[2];
  assign net_a0_1 = i0[1];
  assign net_a0_0 = i0[0];
  assign net_a1_13 = i1[13];
  assign net_a1_12 = i1[12];
  assign net_a1_11 = i1[11];
  assign net_a1_10 = i1[10];
  assign net_a1_9 = i1[9];
  assign net_a1_8 = i1[8];
  assign net_a1_7 = i1[7];
  assign net_a1_6 = i1[6];
  assign net_a1_5 = i1[5];
  assign net_a1_4 = i1[4];
  assign net_a1_3 = i1[3];
  assign net_a1_2 = i1[2];
  assign net_a1_1 = i1[1];
  assign net_a1_0 = i1[0];
  assign net_a2_12 = i2[12];
  assign net_a2_11 = i2[11];
  assign net_a2_10 = i2[10];
  assign net_a2_9 = i2[9];
  assign net_a2_8 = i2[8];
  assign net_a2_7 = i2[7];
  assign net_a2_6 = i2[6];
  assign net_a2_5 = i2[5];
  assign net_a2_4 = i2[4];
  assign net_a2_3 = i2[3];
  assign net_a2_2 = i2[2];
  assign net_a2_1 = i2[1];
  assign net_a2_0 = i2[0];
  assign net_a3_11 = i3[11];
  assign net_a3_10 = i3[10];
  assign net_a3_9 = i3[9];
  assign net_a3_8 = i3[8];
  assign net_a3_7 = i3[7];
  assign net_a3_6 = i3[6];
  assign net_a3_5 = i3[5];
  assign net_a3_4 = i3[4];
  assign net_a3_3 = i3[3];
  assign net_a3_2 = i3[2];
  assign net_a3_1 = i3[1];
  assign net_a3_0 = i3[0];
  assign net_a4_10 = i4[10];
  assign net_a4_9 = i4[9];
  assign net_a4_8 = i4[8];
  assign net_a4_7 = i4[7];
  assign net_a4_6 = i4[6];
  assign net_a4_5 = i4[5];
  assign net_a4_4 = i4[4];
  assign net_a4_3 = i4[3];
  assign net_a4_2 = i4[2];
  assign net_a4_1 = i4[1];
  assign net_a4_0 = i4[0];
  assign net_a5_9 = i5[9];
  assign net_a5_8 = i5[8];
  assign net_a5_7 = i5[7];
  assign net_a5_6 = i5[6];
  assign net_a5_5 = i5[5];
  assign net_a5_4 = i5[4];
  assign net_a5_3 = i5[3];
  assign net_a5_2 = i5[2];
  assign net_a5_1 = i5[1];
  assign net_a5_0 = i5[0];
  assign net_a6_8 = i6[8];
  assign net_a6_7 = i6[7];
  assign net_a6_6 = i6[6];
  assign net_a6_5 = i6[5];
  assign net_a6_4 = i6[4];
  assign net_a6_3 = i6[3];
  assign net_a6_2 = i6[2];
  assign net_a6_1 = i6[1];
  assign net_a6_0 = i6[0];
  assign net_a7_7 = i7[7];
  assign net_a7_6 = i7[6];
  assign net_a7_5 = i7[5];
  assign net_a7_4 = i7[4];
  assign net_a7_3 = i7[3];
  assign net_a7_2 = i7[2];
  assign net_a7_1 = i7[1];
  assign net_a7_0 = i7[0];
  assign o[15] = net_sum7_15;
  assign o[14] = net_sum7_14;
  assign o[13] = net_sum7_13;
  assign o[12] = net_sum7_12;
  assign o[11] = net_sum7_11;
  assign o[10] = net_sum7_10;
  assign o[9] = net_sum7_9;
  assign o[8] = net_sum7_8;
  assign o[7] = net_sum7_7;
  assign o[6] = net_sum7_6;
  assign o[5] = net_sum7_5;
  assign o[4] = net_sum7_4;
  assign o[3] = net_sum7_3;
  assign o[2] = net_sum7_2;
  assign o[1] = net_sum7_1;
  assign o[0] = net_sum7_0;
  AL_FADD comp1_0 (
    .a(net_a1_0),
    .b(net_a0_0),
    .c(1'b0),
    .cout(net_cout1_0),
    .sum(net_sum1_0));
  AL_FADD comp1_1 (
    .a(net_a1_1),
    .b(net_a0_1),
    .c(net_cout1_0),
    .cout(net_cout1_1),
    .sum(net_sum1_1));
  AL_FADD comp1_10 (
    .a(net_a1_10),
    .b(net_a0_10),
    .c(net_cout1_9),
    .cout(net_cout1_10),
    .sum(net_sum1_10));
  AL_FADD comp1_11 (
    .a(net_a1_11),
    .b(net_a0_11),
    .c(net_cout1_10),
    .cout(net_cout1_11),
    .sum(net_sum1_11));
  AL_FADD comp1_12 (
    .a(net_a1_12),
    .b(net_a0_12),
    .c(net_cout1_11),
    .cout(net_cout1_12),
    .sum(net_sum1_12));
  AL_FADD comp1_13 (
    .a(net_a1_13),
    .b(net_a0_13),
    .c(net_cout1_12),
    .cout(net_cout1_13),
    .sum(net_sum1_13));
  AL_FADD comp1_14 (
    .a(1'b0),
    .b(net_a0_14),
    .c(net_cout1_13),
    .cout(net_cout1_14),
    .sum(net_sum1_14));
  AL_FADD comp1_2 (
    .a(net_a1_2),
    .b(net_a0_2),
    .c(net_cout1_1),
    .cout(net_cout1_2),
    .sum(net_sum1_2));
  AL_FADD comp1_3 (
    .a(net_a1_3),
    .b(net_a0_3),
    .c(net_cout1_2),
    .cout(net_cout1_3),
    .sum(net_sum1_3));
  AL_FADD comp1_4 (
    .a(net_a1_4),
    .b(net_a0_4),
    .c(net_cout1_3),
    .cout(net_cout1_4),
    .sum(net_sum1_4));
  AL_FADD comp1_5 (
    .a(net_a1_5),
    .b(net_a0_5),
    .c(net_cout1_4),
    .cout(net_cout1_5),
    .sum(net_sum1_5));
  AL_FADD comp1_6 (
    .a(net_a1_6),
    .b(net_a0_6),
    .c(net_cout1_5),
    .cout(net_cout1_6),
    .sum(net_sum1_6));
  AL_FADD comp1_7 (
    .a(net_a1_7),
    .b(net_a0_7),
    .c(net_cout1_6),
    .cout(net_cout1_7),
    .sum(net_sum1_7));
  AL_FADD comp1_8 (
    .a(net_a1_8),
    .b(net_a0_8),
    .c(net_cout1_7),
    .cout(net_cout1_8),
    .sum(net_sum1_8));
  AL_FADD comp1_9 (
    .a(net_a1_9),
    .b(net_a0_9),
    .c(net_cout1_8),
    .cout(net_cout1_9),
    .sum(net_sum1_9));
  AL_FADD comp2_0 (
    .a(net_a2_0),
    .b(net_sum1_0),
    .c(1'b0),
    .cout(net_cout2_0),
    .sum(net_sum2_0));
  AL_FADD comp2_1 (
    .a(net_a2_1),
    .b(net_sum1_1),
    .c(net_cout2_0),
    .cout(net_cout2_1),
    .sum(net_sum2_1));
  AL_FADD comp2_10 (
    .a(net_a2_10),
    .b(net_sum1_10),
    .c(net_cout2_9),
    .cout(net_cout2_10),
    .sum(net_sum2_10));
  AL_FADD comp2_11 (
    .a(net_a2_11),
    .b(net_sum1_11),
    .c(net_cout2_10),
    .cout(net_cout2_11),
    .sum(net_sum2_11));
  AL_FADD comp2_12 (
    .a(net_a2_12),
    .b(net_sum1_12),
    .c(net_cout2_11),
    .cout(net_cout2_12),
    .sum(net_sum2_12));
  AL_FADD comp2_13 (
    .a(1'b0),
    .b(net_sum1_13),
    .c(net_cout2_12),
    .cout(net_cout2_13),
    .sum(net_sum2_13));
  AL_FADD comp2_14 (
    .a(1'b0),
    .b(net_sum1_14),
    .c(net_cout2_13),
    .cout(net_cout2_14),
    .sum(net_sum2_14));
  AL_FADD comp2_15 (
    .a(1'b0),
    .b(net_cout1_14),
    .c(net_cout2_14),
    .cout(net_cout2_15),
    .sum(net_sum2_15));
  AL_FADD comp2_2 (
    .a(net_a2_2),
    .b(net_sum1_2),
    .c(net_cout2_1),
    .cout(net_cout2_2),
    .sum(net_sum2_2));
  AL_FADD comp2_3 (
    .a(net_a2_3),
    .b(net_sum1_3),
    .c(net_cout2_2),
    .cout(net_cout2_3),
    .sum(net_sum2_3));
  AL_FADD comp2_4 (
    .a(net_a2_4),
    .b(net_sum1_4),
    .c(net_cout2_3),
    .cout(net_cout2_4),
    .sum(net_sum2_4));
  AL_FADD comp2_5 (
    .a(net_a2_5),
    .b(net_sum1_5),
    .c(net_cout2_4),
    .cout(net_cout2_5),
    .sum(net_sum2_5));
  AL_FADD comp2_6 (
    .a(net_a2_6),
    .b(net_sum1_6),
    .c(net_cout2_5),
    .cout(net_cout2_6),
    .sum(net_sum2_6));
  AL_FADD comp2_7 (
    .a(net_a2_7),
    .b(net_sum1_7),
    .c(net_cout2_6),
    .cout(net_cout2_7),
    .sum(net_sum2_7));
  AL_FADD comp2_8 (
    .a(net_a2_8),
    .b(net_sum1_8),
    .c(net_cout2_7),
    .cout(net_cout2_8),
    .sum(net_sum2_8));
  AL_FADD comp2_9 (
    .a(net_a2_9),
    .b(net_sum1_9),
    .c(net_cout2_8),
    .cout(net_cout2_9),
    .sum(net_sum2_9));
  AL_FADD comp3_0 (
    .a(net_a3_0),
    .b(net_sum2_0),
    .c(1'b0),
    .cout(net_cout3_0),
    .sum(net_sum3_0));
  AL_FADD comp3_1 (
    .a(net_a3_1),
    .b(net_sum2_1),
    .c(net_cout3_0),
    .cout(net_cout3_1),
    .sum(net_sum3_1));
  AL_FADD comp3_10 (
    .a(net_a3_10),
    .b(net_sum2_10),
    .c(net_cout3_9),
    .cout(net_cout3_10),
    .sum(net_sum3_10));
  AL_FADD comp3_11 (
    .a(net_a3_11),
    .b(net_sum2_11),
    .c(net_cout3_10),
    .cout(net_cout3_11),
    .sum(net_sum3_11));
  AL_FADD comp3_12 (
    .a(1'b0),
    .b(net_sum2_12),
    .c(net_cout3_11),
    .cout(net_cout3_12),
    .sum(net_sum3_12));
  AL_FADD comp3_13 (
    .a(1'b0),
    .b(net_sum2_13),
    .c(net_cout3_12),
    .cout(net_cout3_13),
    .sum(net_sum3_13));
  AL_FADD comp3_14 (
    .a(1'b0),
    .b(net_sum2_14),
    .c(net_cout3_13),
    .cout(net_cout3_14),
    .sum(net_sum3_14));
  AL_FADD comp3_15 (
    .a(1'b0),
    .b(net_sum2_15),
    .c(net_cout3_14),
    .cout(net_cout3_15),
    .sum(net_sum3_15));
  AL_FADD comp3_2 (
    .a(net_a3_2),
    .b(net_sum2_2),
    .c(net_cout3_1),
    .cout(net_cout3_2),
    .sum(net_sum3_2));
  AL_FADD comp3_3 (
    .a(net_a3_3),
    .b(net_sum2_3),
    .c(net_cout3_2),
    .cout(net_cout3_3),
    .sum(net_sum3_3));
  AL_FADD comp3_4 (
    .a(net_a3_4),
    .b(net_sum2_4),
    .c(net_cout3_3),
    .cout(net_cout3_4),
    .sum(net_sum3_4));
  AL_FADD comp3_5 (
    .a(net_a3_5),
    .b(net_sum2_5),
    .c(net_cout3_4),
    .cout(net_cout3_5),
    .sum(net_sum3_5));
  AL_FADD comp3_6 (
    .a(net_a3_6),
    .b(net_sum2_6),
    .c(net_cout3_5),
    .cout(net_cout3_6),
    .sum(net_sum3_6));
  AL_FADD comp3_7 (
    .a(net_a3_7),
    .b(net_sum2_7),
    .c(net_cout3_6),
    .cout(net_cout3_7),
    .sum(net_sum3_7));
  AL_FADD comp3_8 (
    .a(net_a3_8),
    .b(net_sum2_8),
    .c(net_cout3_7),
    .cout(net_cout3_8),
    .sum(net_sum3_8));
  AL_FADD comp3_9 (
    .a(net_a3_9),
    .b(net_sum2_9),
    .c(net_cout3_8),
    .cout(net_cout3_9),
    .sum(net_sum3_9));
  AL_FADD comp4_0 (
    .a(net_a4_0),
    .b(net_sum3_0),
    .c(1'b0),
    .cout(net_cout4_0),
    .sum(net_sum4_0));
  AL_FADD comp4_1 (
    .a(net_a4_1),
    .b(net_sum3_1),
    .c(net_cout4_0),
    .cout(net_cout4_1),
    .sum(net_sum4_1));
  AL_FADD comp4_10 (
    .a(net_a4_10),
    .b(net_sum3_10),
    .c(net_cout4_9),
    .cout(net_cout4_10),
    .sum(net_sum4_10));
  AL_FADD comp4_11 (
    .a(1'b0),
    .b(net_sum3_11),
    .c(net_cout4_10),
    .cout(net_cout4_11),
    .sum(net_sum4_11));
  AL_FADD comp4_12 (
    .a(1'b0),
    .b(net_sum3_12),
    .c(net_cout4_11),
    .cout(net_cout4_12),
    .sum(net_sum4_12));
  AL_FADD comp4_13 (
    .a(1'b0),
    .b(net_sum3_13),
    .c(net_cout4_12),
    .cout(net_cout4_13),
    .sum(net_sum4_13));
  AL_FADD comp4_14 (
    .a(1'b0),
    .b(net_sum3_14),
    .c(net_cout4_13),
    .cout(net_cout4_14),
    .sum(net_sum4_14));
  AL_FADD comp4_15 (
    .a(1'b0),
    .b(net_sum3_15),
    .c(net_cout4_14),
    .cout(net_cout4_15),
    .sum(net_sum4_15));
  AL_FADD comp4_2 (
    .a(net_a4_2),
    .b(net_sum3_2),
    .c(net_cout4_1),
    .cout(net_cout4_2),
    .sum(net_sum4_2));
  AL_FADD comp4_3 (
    .a(net_a4_3),
    .b(net_sum3_3),
    .c(net_cout4_2),
    .cout(net_cout4_3),
    .sum(net_sum4_3));
  AL_FADD comp4_4 (
    .a(net_a4_4),
    .b(net_sum3_4),
    .c(net_cout4_3),
    .cout(net_cout4_4),
    .sum(net_sum4_4));
  AL_FADD comp4_5 (
    .a(net_a4_5),
    .b(net_sum3_5),
    .c(net_cout4_4),
    .cout(net_cout4_5),
    .sum(net_sum4_5));
  AL_FADD comp4_6 (
    .a(net_a4_6),
    .b(net_sum3_6),
    .c(net_cout4_5),
    .cout(net_cout4_6),
    .sum(net_sum4_6));
  AL_FADD comp4_7 (
    .a(net_a4_7),
    .b(net_sum3_7),
    .c(net_cout4_6),
    .cout(net_cout4_7),
    .sum(net_sum4_7));
  AL_FADD comp4_8 (
    .a(net_a4_8),
    .b(net_sum3_8),
    .c(net_cout4_7),
    .cout(net_cout4_8),
    .sum(net_sum4_8));
  AL_FADD comp4_9 (
    .a(net_a4_9),
    .b(net_sum3_9),
    .c(net_cout4_8),
    .cout(net_cout4_9),
    .sum(net_sum4_9));
  AL_FADD comp5_0 (
    .a(net_a5_0),
    .b(net_sum4_0),
    .c(1'b0),
    .cout(net_cout5_0),
    .sum(net_sum5_0));
  AL_FADD comp5_1 (
    .a(net_a5_1),
    .b(net_sum4_1),
    .c(net_cout5_0),
    .cout(net_cout5_1),
    .sum(net_sum5_1));
  AL_FADD comp5_10 (
    .a(1'b0),
    .b(net_sum4_10),
    .c(net_cout5_9),
    .cout(net_cout5_10),
    .sum(net_sum5_10));
  AL_FADD comp5_11 (
    .a(1'b0),
    .b(net_sum4_11),
    .c(net_cout5_10),
    .cout(net_cout5_11),
    .sum(net_sum5_11));
  AL_FADD comp5_12 (
    .a(1'b0),
    .b(net_sum4_12),
    .c(net_cout5_11),
    .cout(net_cout5_12),
    .sum(net_sum5_12));
  AL_FADD comp5_13 (
    .a(1'b0),
    .b(net_sum4_13),
    .c(net_cout5_12),
    .cout(net_cout5_13),
    .sum(net_sum5_13));
  AL_FADD comp5_14 (
    .a(1'b0),
    .b(net_sum4_14),
    .c(net_cout5_13),
    .cout(net_cout5_14),
    .sum(net_sum5_14));
  AL_FADD comp5_15 (
    .a(1'b0),
    .b(net_sum4_15),
    .c(net_cout5_14),
    .cout(net_cout5_15),
    .sum(net_sum5_15));
  AL_FADD comp5_2 (
    .a(net_a5_2),
    .b(net_sum4_2),
    .c(net_cout5_1),
    .cout(net_cout5_2),
    .sum(net_sum5_2));
  AL_FADD comp5_3 (
    .a(net_a5_3),
    .b(net_sum4_3),
    .c(net_cout5_2),
    .cout(net_cout5_3),
    .sum(net_sum5_3));
  AL_FADD comp5_4 (
    .a(net_a5_4),
    .b(net_sum4_4),
    .c(net_cout5_3),
    .cout(net_cout5_4),
    .sum(net_sum5_4));
  AL_FADD comp5_5 (
    .a(net_a5_5),
    .b(net_sum4_5),
    .c(net_cout5_4),
    .cout(net_cout5_5),
    .sum(net_sum5_5));
  AL_FADD comp5_6 (
    .a(net_a5_6),
    .b(net_sum4_6),
    .c(net_cout5_5),
    .cout(net_cout5_6),
    .sum(net_sum5_6));
  AL_FADD comp5_7 (
    .a(net_a5_7),
    .b(net_sum4_7),
    .c(net_cout5_6),
    .cout(net_cout5_7),
    .sum(net_sum5_7));
  AL_FADD comp5_8 (
    .a(net_a5_8),
    .b(net_sum4_8),
    .c(net_cout5_7),
    .cout(net_cout5_8),
    .sum(net_sum5_8));
  AL_FADD comp5_9 (
    .a(net_a5_9),
    .b(net_sum4_9),
    .c(net_cout5_8),
    .cout(net_cout5_9),
    .sum(net_sum5_9));
  AL_FADD comp6_0 (
    .a(net_a6_0),
    .b(net_sum5_0),
    .c(1'b0),
    .cout(net_cout6_0),
    .sum(net_sum6_0));
  AL_FADD comp6_1 (
    .a(net_a6_1),
    .b(net_sum5_1),
    .c(net_cout6_0),
    .cout(net_cout6_1),
    .sum(net_sum6_1));
  AL_FADD comp6_10 (
    .a(1'b0),
    .b(net_sum5_10),
    .c(net_cout6_9),
    .cout(net_cout6_10),
    .sum(net_sum6_10));
  AL_FADD comp6_11 (
    .a(1'b0),
    .b(net_sum5_11),
    .c(net_cout6_10),
    .cout(net_cout6_11),
    .sum(net_sum6_11));
  AL_FADD comp6_12 (
    .a(1'b0),
    .b(net_sum5_12),
    .c(net_cout6_11),
    .cout(net_cout6_12),
    .sum(net_sum6_12));
  AL_FADD comp6_13 (
    .a(1'b0),
    .b(net_sum5_13),
    .c(net_cout6_12),
    .cout(net_cout6_13),
    .sum(net_sum6_13));
  AL_FADD comp6_14 (
    .a(1'b0),
    .b(net_sum5_14),
    .c(net_cout6_13),
    .cout(net_cout6_14),
    .sum(net_sum6_14));
  AL_FADD comp6_15 (
    .a(1'b0),
    .b(net_sum5_15),
    .c(net_cout6_14),
    .cout(net_cout6_15),
    .sum(net_sum6_15));
  AL_FADD comp6_2 (
    .a(net_a6_2),
    .b(net_sum5_2),
    .c(net_cout6_1),
    .cout(net_cout6_2),
    .sum(net_sum6_2));
  AL_FADD comp6_3 (
    .a(net_a6_3),
    .b(net_sum5_3),
    .c(net_cout6_2),
    .cout(net_cout6_3),
    .sum(net_sum6_3));
  AL_FADD comp6_4 (
    .a(net_a6_4),
    .b(net_sum5_4),
    .c(net_cout6_3),
    .cout(net_cout6_4),
    .sum(net_sum6_4));
  AL_FADD comp6_5 (
    .a(net_a6_5),
    .b(net_sum5_5),
    .c(net_cout6_4),
    .cout(net_cout6_5),
    .sum(net_sum6_5));
  AL_FADD comp6_6 (
    .a(net_a6_6),
    .b(net_sum5_6),
    .c(net_cout6_5),
    .cout(net_cout6_6),
    .sum(net_sum6_6));
  AL_FADD comp6_7 (
    .a(net_a6_7),
    .b(net_sum5_7),
    .c(net_cout6_6),
    .cout(net_cout6_7),
    .sum(net_sum6_7));
  AL_FADD comp6_8 (
    .a(net_a6_8),
    .b(net_sum5_8),
    .c(net_cout6_7),
    .cout(net_cout6_8),
    .sum(net_sum6_8));
  AL_FADD comp6_9 (
    .a(1'b0),
    .b(net_sum5_9),
    .c(net_cout6_8),
    .cout(net_cout6_9),
    .sum(net_sum6_9));
  AL_FADD comp7_0 (
    .a(net_a7_0),
    .b(net_sum6_0),
    .c(1'b0),
    .cout(net_cout7_0),
    .sum(net_sum7_0));
  AL_FADD comp7_1 (
    .a(net_a7_1),
    .b(net_sum6_1),
    .c(net_cout7_0),
    .cout(net_cout7_1),
    .sum(net_sum7_1));
  AL_FADD comp7_10 (
    .a(1'b0),
    .b(net_sum6_10),
    .c(net_cout7_9),
    .cout(net_cout7_10),
    .sum(net_sum7_10));
  AL_FADD comp7_11 (
    .a(1'b0),
    .b(net_sum6_11),
    .c(net_cout7_10),
    .cout(net_cout7_11),
    .sum(net_sum7_11));
  AL_FADD comp7_12 (
    .a(1'b0),
    .b(net_sum6_12),
    .c(net_cout7_11),
    .cout(net_cout7_12),
    .sum(net_sum7_12));
  AL_FADD comp7_13 (
    .a(1'b0),
    .b(net_sum6_13),
    .c(net_cout7_12),
    .cout(net_cout7_13),
    .sum(net_sum7_13));
  AL_FADD comp7_14 (
    .a(1'b0),
    .b(net_sum6_14),
    .c(net_cout7_13),
    .cout(net_cout7_14),
    .sum(net_sum7_14));
  AL_FADD comp7_15 (
    .a(1'b0),
    .b(net_sum6_15),
    .c(net_cout7_14),
    .cout(net_cout7_15),
    .sum(net_sum7_15));
  AL_FADD comp7_2 (
    .a(net_a7_2),
    .b(net_sum6_2),
    .c(net_cout7_1),
    .cout(net_cout7_2),
    .sum(net_sum7_2));
  AL_FADD comp7_3 (
    .a(net_a7_3),
    .b(net_sum6_3),
    .c(net_cout7_2),
    .cout(net_cout7_3),
    .sum(net_sum7_3));
  AL_FADD comp7_4 (
    .a(net_a7_4),
    .b(net_sum6_4),
    .c(net_cout7_3),
    .cout(net_cout7_4),
    .sum(net_sum7_4));
  AL_FADD comp7_5 (
    .a(net_a7_5),
    .b(net_sum6_5),
    .c(net_cout7_4),
    .cout(net_cout7_5),
    .sum(net_sum7_5));
  AL_FADD comp7_6 (
    .a(net_a7_6),
    .b(net_sum6_6),
    .c(net_cout7_5),
    .cout(net_cout7_6),
    .sum(net_sum7_6));
  AL_FADD comp7_7 (
    .a(net_a7_7),
    .b(net_sum6_7),
    .c(net_cout7_6),
    .cout(net_cout7_7),
    .sum(net_sum7_7));
  AL_FADD comp7_8 (
    .a(1'b0),
    .b(net_sum6_8),
    .c(net_cout7_7),
    .cout(net_cout7_8),
    .sum(net_sum7_8));
  AL_FADD comp7_9 (
    .a(1'b0),
    .b(net_sum6_9),
    .c(net_cout7_8),
    .cout(net_cout7_9),
    .sum(net_sum7_9));

endmodule 

module add_pu7_pu7_pu6_pu5_o7
  (
  i0,
  i1,
  i2,
  i3,
  o
  );

  input [6:0] i0;
  input [6:0] i1;
  input [5:0] i2;
  input [4:0] i3;
  output [6:0] o;

  wire net_a0_0;
  wire net_a0_1;
  wire net_a0_2;
  wire net_a0_3;
  wire net_a0_4;
  wire net_a0_5;
  wire net_a0_6;
  wire net_a1_0;
  wire net_a1_1;
  wire net_a1_2;
  wire net_a1_3;
  wire net_a1_4;
  wire net_a1_5;
  wire net_a1_6;
  wire net_a2_0;
  wire net_a2_1;
  wire net_a2_2;
  wire net_a2_3;
  wire net_a2_4;
  wire net_a2_5;
  wire net_a3_0;
  wire net_a3_1;
  wire net_a3_2;
  wire net_a3_3;
  wire net_a3_4;
  wire net_cout1_0;
  wire net_cout1_1;
  wire net_cout1_2;
  wire net_cout1_3;
  wire net_cout1_4;
  wire net_cout1_5;
  wire net_cout1_6;
  wire net_cout2_0;
  wire net_cout2_1;
  wire net_cout2_2;
  wire net_cout2_3;
  wire net_cout2_4;
  wire net_cout2_5;
  wire net_cout2_6;
  wire net_cout3_0;
  wire net_cout3_1;
  wire net_cout3_2;
  wire net_cout3_3;
  wire net_cout3_4;
  wire net_cout3_5;
  wire net_cout3_6;
  wire net_sum1_0;
  wire net_sum1_1;
  wire net_sum1_2;
  wire net_sum1_3;
  wire net_sum1_4;
  wire net_sum1_5;
  wire net_sum1_6;
  wire net_sum2_0;
  wire net_sum2_1;
  wire net_sum2_2;
  wire net_sum2_3;
  wire net_sum2_4;
  wire net_sum2_5;
  wire net_sum2_6;
  wire net_sum3_0;
  wire net_sum3_1;
  wire net_sum3_2;
  wire net_sum3_3;
  wire net_sum3_4;
  wire net_sum3_5;
  wire net_sum3_6;

  assign net_a0_6 = i0[6];
  assign net_a0_5 = i0[5];
  assign net_a0_4 = i0[4];
  assign net_a0_3 = i0[3];
  assign net_a0_2 = i0[2];
  assign net_a0_1 = i0[1];
  assign net_a0_0 = i0[0];
  assign net_a1_6 = i1[6];
  assign net_a1_5 = i1[5];
  assign net_a1_4 = i1[4];
  assign net_a1_3 = i1[3];
  assign net_a1_2 = i1[2];
  assign net_a1_1 = i1[1];
  assign net_a1_0 = i1[0];
  assign net_a2_5 = i2[5];
  assign net_a2_4 = i2[4];
  assign net_a2_3 = i2[3];
  assign net_a2_2 = i2[2];
  assign net_a2_1 = i2[1];
  assign net_a2_0 = i2[0];
  assign net_a3_4 = i3[4];
  assign net_a3_3 = i3[3];
  assign net_a3_2 = i3[2];
  assign net_a3_1 = i3[1];
  assign net_a3_0 = i3[0];
  assign o[6] = net_sum3_6;
  assign o[5] = net_sum3_5;
  assign o[4] = net_sum3_4;
  assign o[3] = net_sum3_3;
  assign o[2] = net_sum3_2;
  assign o[1] = net_sum3_1;
  assign o[0] = net_sum3_0;
  AL_FADD comp1_0 (
    .a(net_a1_0),
    .b(net_a0_0),
    .c(1'b0),
    .cout(net_cout1_0),
    .sum(net_sum1_0));
  AL_FADD comp1_1 (
    .a(net_a1_1),
    .b(net_a0_1),
    .c(net_cout1_0),
    .cout(net_cout1_1),
    .sum(net_sum1_1));
  AL_FADD comp1_2 (
    .a(net_a1_2),
    .b(net_a0_2),
    .c(net_cout1_1),
    .cout(net_cout1_2),
    .sum(net_sum1_2));
  AL_FADD comp1_3 (
    .a(net_a1_3),
    .b(net_a0_3),
    .c(net_cout1_2),
    .cout(net_cout1_3),
    .sum(net_sum1_3));
  AL_FADD comp1_4 (
    .a(net_a1_4),
    .b(net_a0_4),
    .c(net_cout1_3),
    .cout(net_cout1_4),
    .sum(net_sum1_4));
  AL_FADD comp1_5 (
    .a(net_a1_5),
    .b(net_a0_5),
    .c(net_cout1_4),
    .cout(net_cout1_5),
    .sum(net_sum1_5));
  AL_FADD comp1_6 (
    .a(net_a1_6),
    .b(net_a0_6),
    .c(net_cout1_5),
    .cout(net_cout1_6),
    .sum(net_sum1_6));
  AL_FADD comp2_0 (
    .a(net_a2_0),
    .b(net_sum1_0),
    .c(1'b0),
    .cout(net_cout2_0),
    .sum(net_sum2_0));
  AL_FADD comp2_1 (
    .a(net_a2_1),
    .b(net_sum1_1),
    .c(net_cout2_0),
    .cout(net_cout2_1),
    .sum(net_sum2_1));
  AL_FADD comp2_2 (
    .a(net_a2_2),
    .b(net_sum1_2),
    .c(net_cout2_1),
    .cout(net_cout2_2),
    .sum(net_sum2_2));
  AL_FADD comp2_3 (
    .a(net_a2_3),
    .b(net_sum1_3),
    .c(net_cout2_2),
    .cout(net_cout2_3),
    .sum(net_sum2_3));
  AL_FADD comp2_4 (
    .a(net_a2_4),
    .b(net_sum1_4),
    .c(net_cout2_3),
    .cout(net_cout2_4),
    .sum(net_sum2_4));
  AL_FADD comp2_5 (
    .a(net_a2_5),
    .b(net_sum1_5),
    .c(net_cout2_4),
    .cout(net_cout2_5),
    .sum(net_sum2_5));
  AL_FADD comp2_6 (
    .a(1'b0),
    .b(net_sum1_6),
    .c(net_cout2_5),
    .cout(net_cout2_6),
    .sum(net_sum2_6));
  AL_FADD comp3_0 (
    .a(net_a3_0),
    .b(net_sum2_0),
    .c(1'b0),
    .cout(net_cout3_0),
    .sum(net_sum3_0));
  AL_FADD comp3_1 (
    .a(net_a3_1),
    .b(net_sum2_1),
    .c(net_cout3_0),
    .cout(net_cout3_1),
    .sum(net_sum3_1));
  AL_FADD comp3_2 (
    .a(net_a3_2),
    .b(net_sum2_2),
    .c(net_cout3_1),
    .cout(net_cout3_2),
    .sum(net_sum3_2));
  AL_FADD comp3_3 (
    .a(net_a3_3),
    .b(net_sum2_3),
    .c(net_cout3_2),
    .cout(net_cout3_3),
    .sum(net_sum3_3));
  AL_FADD comp3_4 (
    .a(net_a3_4),
    .b(net_sum2_4),
    .c(net_cout3_3),
    .cout(net_cout3_4),
    .sum(net_sum3_4));
  AL_FADD comp3_5 (
    .a(1'b0),
    .b(net_sum2_5),
    .c(net_cout3_4),
    .cout(net_cout3_5),
    .sum(net_sum3_5));
  AL_FADD comp3_6 (
    .a(1'b0),
    .b(net_sum2_6),
    .c(net_cout3_5),
    .cout(net_cout3_6),
    .sum(net_sum3_6));

endmodule 

module AL_MUX
  (
  input i0,
  input i1,
  input sel,
  output o
  );

  wire not_sel, sel_i0, sel_i1;
  not u0 (not_sel, sel);
  and u1 (sel_i1, sel, i1);
  and u2 (sel_i0, not_sel, i0);
  or u3 (o, sel_i1, sel_i0);

endmodule

module AL_DFF
  (
  input reset,
  input set,
  input clk,
  input d,
  output reg q
  );

  parameter INI = 1'b0;

  always @(posedge reset or posedge set or posedge clk)
  begin
    if (reset)
      q <= 1'b0;
    else if (set)
      q <= 1'b1;
    else
      q <= d;
  end

endmodule

module AL_FADD
  (
  input a,
  input b,
  input c,
  output sum,
  output cout
  );

  wire prop;
  wire not_prop;
  wire sel_i0;
  wire sel_i1;

  xor u0 (prop, a, b);
  xor u1 (sum, prop, c);
  not u2 (not_prop, prop);
  and u3 (sel_i1, prop, c);
  and u4 (sel_i0, not_prop, a);
  or  u5 (cout, sel_i0, sel_i1);

endmodule

