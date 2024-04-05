// Verilog netlist created by TD v4.5.12854
// Fri Aug  9 16:25:47 2019

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
  wire [5:0] key_pad;  // sources/rtl/top.v(37)
  wire [6:0] n0;
  wire [6:0] n1;
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
  wire [7:0] \u_cpu/u_alu/n38 ;
  wire [7:0] \u_cpu/u_alu/n4 ;
  wire [8:0] \u_cpu/u_alu/n5 ;
  wire [7:0] \u_cpu/u_alu/n56 ;
  wire [7:0] \u_cpu/u_alu/n57 ;
  wire [7:0] \u_cpu/u_alu/n58 ;
  wire [8:0] \u_cpu/u_alu/n7 ;
  wire [7:0] \u_cpu/u_alu/n70 ;
  wire [23:0] \u_cpu/u_debug/n13 ;
  wire [7:0] \u_cpu/u_debug/n20 ;
  wire [7:0] \u_cpu/u_debug/n21 ;
  wire [3:0] \u_cpu/u_debug/n4 ;
  wire [23:0] \u_cpu/u_debug/n7 ;
  wire [7:0] \u_cpu/u_decode/inst_d ;  // sources/rtl/mcu/decode.v(37)
  wire [7:0] \u_cpu/u_execute/C ;  // sources/rtl/mcu/execute.v(72)
  wire [7:0] \u_cpu/u_execute/n17 ;
  wire [7:0] \u_cpu/u_execute/n29 ;
  wire [15:0] \u_cpu/u_execute/n35 ;
  wire [15:0] \u_cpu/u_execute/n36 ;
  wire [15:0] \u_cpu/u_execute/n39 ;
  wire [7:0] \u_cpu/u_execute/n4 ;
  wire [7:0] \u_cpu/u_execute/n47 ;
  wire [7:0] \u_cpu/u_execute/n52 ;
  wire [7:0] \u_cpu/u_execute/n7 ;
  wire [7:0] \u_cpu/u_execute/rom_data ;  // sources/rtl/mcu/execute.v(74)
  wire [9:0] \u_cpu/u_execute/wt_ram_cmd ;  // sources/rtl/mcu/execute.v(130)
  wire [23:0] \u_cpu/u_fetch/n1 ;
  wire [7:0] \u_cpu/u_fetch/n10 ;
  wire [23:0] \u_cpu/u_fetch/n3 ;
  wire [23:0] \u_cpu/u_fetch/n7 ;
  wire [23:0] \u_cpu/u_fetch/pc ;  // sources/rtl/mcu/fetch.v(51)
  wire [23:0] \u_cpu/u_timer/cnt ;  // sources/rtl/mcu/timer.v(33)
  wire [24:0] \u_cpu/u_timer/n1 ;
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
  wire  \u_uart/u_ubus/sel0_b6/B2_0 ;
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
  wire [22:0] \u_vram/n26 ;
  wire [5:0] \u_vram/n3 ;
  wire [5:0] \u_vram/n4 ;
  wire [9:0] \u_vram/n5 ;
  wire [23:0] vga_rgb_pad;  // sources/rtl/top.v(34)
  wire [7:0] vram_addr;  // sources/rtl/top.v(92)
  wire _al_u1000_o;
  wire _al_u1001_o;
  wire _al_u1002_o;
  wire _al_u1004_o;
  wire _al_u1005_o;
  wire _al_u1006_o;
  wire _al_u1007_o;
  wire _al_u1009_o;
  wire _al_u1010_o;
  wire _al_u1011_o;
  wire _al_u1012_o;
  wire _al_u1014_o;
  wire _al_u1015_o;
  wire _al_u1016_o;
  wire _al_u1017_o;
  wire _al_u1018_o;
  wire _al_u1019_o;
  wire _al_u1020_o;
  wire _al_u1021_o;
  wire _al_u1022_o;
  wire _al_u1023_o;
  wire _al_u1025_o;
  wire _al_u1026_o;
  wire _al_u1027_o;
  wire _al_u289_o;
  wire _al_u291_o;
  wire _al_u293_o;
  wire _al_u295_o;
  wire _al_u297_o;
  wire _al_u299_o;
  wire _al_u301_o;
  wire _al_u303_o;
  wire _al_u305_o;
  wire _al_u307_o;
  wire _al_u309_o;
  wire _al_u311_o;
  wire _al_u313_o;
  wire _al_u315_o;
  wire _al_u317_o;
  wire _al_u319_o;
  wire _al_u321_o;
  wire _al_u323_o;
  wire _al_u325_o;
  wire _al_u327_o;
  wire _al_u329_o;
  wire _al_u331_o;
  wire _al_u333_o;
  wire _al_u335_o;
  wire _al_u337_o;
  wire _al_u339_o;
  wire _al_u341_o;
  wire _al_u343_o;
  wire _al_u345_o;
  wire _al_u347_o;
  wire _al_u349_o;
  wire _al_u351_o;
  wire _al_u353_o;
  wire _al_u355_o;
  wire _al_u357_o;
  wire _al_u359_o;
  wire _al_u361_o;
  wire _al_u363_o;
  wire _al_u365_o;
  wire _al_u367_o;
  wire _al_u369_o;
  wire _al_u371_o;
  wire _al_u373_o;
  wire _al_u375_o;
  wire _al_u377_o;
  wire _al_u379_o;
  wire _al_u381_o;
  wire _al_u383_o;
  wire _al_u385_o;
  wire _al_u392_o;
  wire _al_u394_o;
  wire _al_u395_o;
  wire _al_u396_o;
  wire _al_u398_o;
  wire _al_u399_o;
  wire _al_u400_o;
  wire _al_u401_o;
  wire _al_u402_o;
  wire _al_u403_o;
  wire _al_u404_o;
  wire _al_u405_o;
  wire _al_u433_o;
  wire _al_u434_o;
  wire _al_u436_o;
  wire _al_u437_o;
  wire _al_u439_o;
  wire _al_u440_o;
  wire _al_u442_o;
  wire _al_u443_o;
  wire _al_u445_o;
  wire _al_u446_o;
  wire _al_u448_o;
  wire _al_u449_o;
  wire _al_u451_o;
  wire _al_u452_o;
  wire _al_u454_o;
  wire _al_u455_o;
  wire _al_u457_o;
  wire _al_u461_o;
  wire _al_u462_o;
  wire _al_u463_o;
  wire _al_u464_o;
  wire _al_u465_o;
  wire _al_u466_o;
  wire _al_u467_o;
  wire _al_u468_o;
  wire _al_u469_o;
  wire _al_u471_o;
  wire _al_u472_o;
  wire _al_u474_o;
  wire _al_u475_o;
  wire _al_u476_o;
  wire _al_u477_o;
  wire _al_u479_o;
  wire _al_u480_o;
  wire _al_u481_o;
  wire _al_u483_o;
  wire _al_u484_o;
  wire _al_u486_o;
  wire _al_u487_o;
  wire _al_u490_o;
  wire _al_u492_o;
  wire _al_u493_o;
  wire _al_u495_o;
  wire _al_u496_o;
  wire _al_u497_o;
  wire _al_u499_o;
  wire _al_u500_o;
  wire _al_u501_o;
  wire _al_u505_o;
  wire _al_u510_o;
  wire _al_u511_o;
  wire _al_u512_o;
  wire _al_u513_o;
  wire _al_u515_o;
  wire _al_u516_o;
  wire _al_u517_o;
  wire _al_u519_o;
  wire _al_u520_o;
  wire _al_u521_o;
  wire _al_u523_o;
  wire _al_u524_o;
  wire _al_u525_o;
  wire _al_u528_o;
  wire _al_u529_o;
  wire _al_u530_o;
  wire _al_u532_o;
  wire _al_u533_o;
  wire _al_u534_o;
  wire _al_u536_o;
  wire _al_u537_o;
  wire _al_u538_o;
  wire _al_u540_o;
  wire _al_u541_o;
  wire _al_u542_o;
  wire _al_u544_o;
  wire _al_u546_o;
  wire _al_u548_o;
  wire _al_u550_o;
  wire _al_u551_o;
  wire _al_u552_o;
  wire _al_u553_o;
  wire _al_u554_o;
  wire _al_u555_o;
  wire _al_u557_o;
  wire _al_u561_o;
  wire _al_u566_o;
  wire _al_u569_o;
  wire _al_u574_o;
  wire _al_u576_o;
  wire _al_u578_o;
  wire _al_u585_o;
  wire _al_u586_o;
  wire _al_u587_o;
  wire _al_u589_o;
  wire _al_u590_o;
  wire _al_u591_o;
  wire _al_u593_o;
  wire _al_u595_o;
  wire _al_u607_o;
  wire _al_u608_o;
  wire _al_u612_o;
  wire _al_u613_o;
  wire _al_u617_o;
  wire _al_u619_o;
  wire _al_u624_o;
  wire _al_u625_o;
  wire _al_u638_o;
  wire _al_u643_o;
  wire _al_u653_o;
  wire _al_u654_o;
  wire _al_u656_o;
  wire _al_u657_o;
  wire _al_u659_o;
  wire _al_u660_o;
  wire _al_u662_o;
  wire _al_u663_o;
  wire _al_u665_o;
  wire _al_u666_o;
  wire _al_u668_o;
  wire _al_u669_o;
  wire _al_u673_o;
  wire _al_u678_o;
  wire _al_u681_o;
  wire _al_u682_o;
  wire _al_u683_o;
  wire _al_u686_o;
  wire _al_u687_o;
  wire _al_u688_o;
  wire _al_u689_o;
  wire _al_u690_o;
  wire _al_u691_o;
  wire _al_u692_o;
  wire _al_u693_o;
  wire _al_u694_o;
  wire _al_u695_o;
  wire _al_u697_o;
  wire _al_u699_o;
  wire _al_u700_o;
  wire _al_u701_o;
  wire _al_u702_o;
  wire _al_u703_o;
  wire _al_u705_o;
  wire _al_u708_o;
  wire _al_u709_o;
  wire _al_u710_o;
  wire _al_u714_o;
  wire _al_u716_o;
  wire _al_u720_o;
  wire _al_u721_o;
  wire _al_u724_o;
  wire _al_u725_o;
  wire _al_u726_o;
  wire _al_u728_o;
  wire _al_u729_o;
  wire _al_u732_o;
  wire _al_u733_o;
  wire _al_u734_o;
  wire _al_u736_o;
  wire _al_u737_o;
  wire _al_u738_o;
  wire _al_u740_o;
  wire _al_u741_o;
  wire _al_u742_o;
  wire _al_u743_o;
  wire _al_u744_o;
  wire _al_u745_o;
  wire _al_u746_o;
  wire _al_u748_o;
  wire _al_u749_o;
  wire _al_u750_o;
  wire _al_u751_o;
  wire _al_u752_o;
  wire _al_u753_o;
  wire _al_u754_o;
  wire _al_u755_o;
  wire _al_u756_o;
  wire _al_u757_o;
  wire _al_u759_o;
  wire _al_u760_o;
  wire _al_u761_o;
  wire _al_u762_o;
  wire _al_u763_o;
  wire _al_u764_o;
  wire _al_u765_o;
  wire _al_u766_o;
  wire _al_u767_o;
  wire _al_u768_o;
  wire _al_u770_o;
  wire _al_u771_o;
  wire _al_u772_o;
  wire _al_u787_o;
  wire _al_u788_o;
  wire _al_u790_o;
  wire _al_u791_o;
  wire _al_u792_o;
  wire _al_u794_o;
  wire _al_u796_o;
  wire _al_u797_o;
  wire _al_u800_o;
  wire _al_u801_o;
  wire _al_u802_o;
  wire _al_u804_o;
  wire _al_u805_o;
  wire _al_u806_o;
  wire _al_u814_o;
  wire _al_u815_o;
  wire _al_u816_o;
  wire _al_u817_o;
  wire _al_u819_o;
  wire _al_u820_o;
  wire _al_u822_o;
  wire _al_u823_o;
  wire _al_u825_o;
  wire _al_u826_o;
  wire _al_u828_o;
  wire _al_u829_o;
  wire _al_u831_o;
  wire _al_u832_o;
  wire _al_u834_o;
  wire _al_u835_o;
  wire _al_u837_o;
  wire _al_u838_o;
  wire _al_u840_o;
  wire _al_u841_o;
  wire _al_u843_o;
  wire _al_u844_o;
  wire _al_u845_o;
  wire _al_u847_o;
  wire _al_u848_o;
  wire _al_u850_o;
  wire _al_u851_o;
  wire _al_u853_o;
  wire _al_u854_o;
  wire _al_u856_o;
  wire _al_u857_o;
  wire _al_u858_o;
  wire _al_u859_o;
  wire _al_u861_o;
  wire _al_u862_o;
  wire _al_u863_o;
  wire _al_u864_o;
  wire _al_u866_o;
  wire _al_u867_o;
  wire _al_u868_o;
  wire _al_u870_o;
  wire _al_u871_o;
  wire _al_u872_o;
  wire _al_u873_o;
  wire _al_u875_o;
  wire _al_u876_o;
  wire _al_u877_o;
  wire _al_u879_o;
  wire _al_u880_o;
  wire _al_u882_o;
  wire _al_u883_o;
  wire _al_u885_o;
  wire _al_u886_o;
  wire _al_u888_o;
  wire _al_u889_o;
  wire _al_u890_o;
  wire _al_u891_o;
  wire _al_u893_o;
  wire _al_u894_o;
  wire _al_u895_o;
  wire _al_u896_o;
  wire _al_u898_o;
  wire _al_u899_o;
  wire _al_u900_o;
  wire _al_u901_o;
  wire _al_u903_o;
  wire _al_u904_o;
  wire _al_u905_o;
  wire _al_u906_o;
  wire _al_u908_o;
  wire _al_u909_o;
  wire _al_u910_o;
  wire _al_u912_o;
  wire _al_u913_o;
  wire _al_u915_o;
  wire _al_u916_o;
  wire _al_u917_o;
  wire _al_u918_o;
  wire _al_u920_o;
  wire _al_u921_o;
  wire _al_u923_o;
  wire _al_u924_o;
  wire _al_u925_o;
  wire _al_u927_o;
  wire _al_u928_o;
  wire _al_u929_o;
  wire _al_u930_o;
  wire _al_u932_o;
  wire _al_u933_o;
  wire _al_u934_o;
  wire _al_u935_o;
  wire _al_u937_o;
  wire _al_u938_o;
  wire _al_u940_o;
  wire _al_u944_o;
  wire _al_u945_o;
  wire _al_u946_o;
  wire _al_u947_o;
  wire _al_u949_o;
  wire _al_u950_o;
  wire _al_u951_o;
  wire _al_u952_o;
  wire _al_u954_o;
  wire _al_u955_o;
  wire _al_u956_o;
  wire _al_u957_o;
  wire _al_u959_o;
  wire _al_u960_o;
  wire _al_u961_o;
  wire _al_u962_o;
  wire _al_u964_o;
  wire _al_u965_o;
  wire _al_u966_o;
  wire _al_u967_o;
  wire _al_u969_o;
  wire _al_u970_o;
  wire _al_u971_o;
  wire _al_u972_o;
  wire _al_u974_o;
  wire _al_u975_o;
  wire _al_u976_o;
  wire _al_u977_o;
  wire _al_u979_o;
  wire _al_u980_o;
  wire _al_u981_o;
  wire _al_u982_o;
  wire _al_u984_o;
  wire _al_u985_o;
  wire _al_u986_o;
  wire _al_u987_o;
  wire _al_u989_o;
  wire _al_u990_o;
  wire _al_u991_o;
  wire _al_u992_o;
  wire _al_u994_o;
  wire _al_u995_o;
  wire _al_u996_o;
  wire _al_u997_o;
  wire _al_u999_o;
  wire axis_en;  // sources/rtl/top.v(79)
  wire bus_ren;  // sources/rtl/top.v(72)
  wire bus_wen;  // sources/rtl/top.v(69)
  wire clear;  // sources/rtl/top.v(84)
  wire clk_pad;  // sources/rtl/top.v(24)
  wire hsyn;  // sources/rtl/top.v(77)
  wire led_pad;  // sources/rtl/top.v(40)
  wire ram_ren;  // sources/rtl/top.v(64)
  wire ram_wen;  // sources/rtl/top.v(61)
  wire recv_en;  // sources/rtl/top.v(44)
  wire rom_ren;  // sources/rtl/top.v(56)
  wire rom_wen;  // sources/rtl/top.v(53)
  wire rx_pad;  // sources/rtl/top.v(27)
  wire send_en;  // sources/rtl/top.v(47)
  wire send_ready;  // sources/rtl/top.v(50)
  wire send_ready_d;
  wire tx_pad;  // sources/rtl/top.v(28)
  wire \u_bus/eq0/or_or_or_xor_i0[0]_i_o ;
  wire \u_bus/mux0_b0_sel_is_3_o ;
  wire \u_bus/n18 ;
  wire \u_bus/n1_lutinv ;
  wire \u_bus/n22 ;
  wire \u_bus/u6_sel_is_3_o ;
  wire \u_cpu/dbg_en ;  // sources/rtl/mcu/cpu.v(86)
  wire \u_cpu/dbg_en_d ;
  wire \u_cpu/dbg_info_en ;  // sources/rtl/mcu/cpu.v(92)
  wire \u_cpu/dbg_inst_en ;  // sources/rtl/mcu/cpu.v(90)
  wire \u_cpu/dbg_rom_ren ;  // sources/rtl/mcu/cpu.v(87)
  wire \u_cpu/inst_en ;  // sources/rtl/mcu/cpu.v(63)
  wire \u_cpu/pc_wen ;  // sources/rtl/mcu/cpu.v(61)
  wire \u_cpu/timer_state ;  // sources/rtl/mcu/cpu.v(73)
  wire \u_cpu/timer_wen ;  // sources/rtl/mcu/cpu.v(71)
  wire \u_cpu/u_alu/add0/c0 ;
  wire \u_cpu/u_alu/add0/c1 ;
  wire \u_cpu/u_alu/add0/c2 ;
  wire \u_cpu/u_alu/add0/c3 ;
  wire \u_cpu/u_alu/add0/c4 ;
  wire \u_cpu/u_alu/add0/c5 ;
  wire \u_cpu/u_alu/add0/c6 ;
  wire \u_cpu/u_alu/add0/c7 ;
  wire \u_cpu/u_alu/add0/c8 ;
  wire \u_cpu/u_alu/lt0_c0 ;
  wire \u_cpu/u_alu/lt0_c1 ;
  wire \u_cpu/u_alu/lt0_c2 ;
  wire \u_cpu/u_alu/lt0_c3 ;
  wire \u_cpu/u_alu/lt0_c4 ;
  wire \u_cpu/u_alu/lt0_c5 ;
  wire \u_cpu/u_alu/lt0_c6 ;
  wire \u_cpu/u_alu/lt0_c7 ;
  wire \u_cpu/u_alu/lt0_c8 ;
  wire \u_cpu/u_alu/n0_lutinv ;
  wire \u_cpu/u_alu/n16_lutinv ;
  wire \u_cpu/u_alu/n1_lutinv ;
  wire \u_cpu/u_alu/n21_lutinv ;
  wire \u_cpu/u_alu/n29_lutinv ;
  wire \u_cpu/u_alu/n2_lutinv ;
  wire \u_cpu/u_alu/n3 ;
  wire \u_cpu/u_alu/n30_lutinv ;
  wire \u_cpu/u_alu/n31_lutinv ;
  wire \u_cpu/u_alu/n32_lutinv ;
  wire \u_cpu/u_alu/n33_lutinv ;
  wire \u_cpu/u_alu/n35 ;
  wire \u_cpu/u_alu/n51_lutinv ;
  wire \u_cpu/u_alu/n62_lutinv ;
  wire \u_cpu/u_alu/n65_lutinv ;
  wire \u_cpu/u_alu/n75_lutinv ;
  wire \u_cpu/u_alu/n76_lutinv ;
  wire \u_cpu/u_alu/n78_lutinv ;
  wire \u_cpu/u_alu/sub0/c0 ;
  wire \u_cpu/u_alu/sub0/c1 ;
  wire \u_cpu/u_alu/sub0/c2 ;
  wire \u_cpu/u_alu/sub0/c3 ;
  wire \u_cpu/u_alu/sub0/c4 ;
  wire \u_cpu/u_alu/sub0/c5 ;
  wire \u_cpu/u_alu/sub0/c6 ;
  wire \u_cpu/u_alu/sub0/c7 ;
  wire \u_cpu/u_alu/sub0/c8 ;
  wire \u_cpu/u_debug/add0/c0 ;
  wire \u_cpu/u_debug/add0/c1 ;
  wire \u_cpu/u_debug/add0/c10 ;
  wire \u_cpu/u_debug/add0/c11 ;
  wire \u_cpu/u_debug/add0/c12 ;
  wire \u_cpu/u_debug/add0/c13 ;
  wire \u_cpu/u_debug/add0/c14 ;
  wire \u_cpu/u_debug/add0/c15 ;
  wire \u_cpu/u_debug/add0/c16 ;
  wire \u_cpu/u_debug/add0/c17 ;
  wire \u_cpu/u_debug/add0/c18 ;
  wire \u_cpu/u_debug/add0/c19 ;
  wire \u_cpu/u_debug/add0/c2 ;
  wire \u_cpu/u_debug/add0/c20 ;
  wire \u_cpu/u_debug/add0/c21 ;
  wire \u_cpu/u_debug/add0/c22 ;
  wire \u_cpu/u_debug/add0/c23 ;
  wire \u_cpu/u_debug/add0/c3 ;
  wire \u_cpu/u_debug/add0/c4 ;
  wire \u_cpu/u_debug/add0/c5 ;
  wire \u_cpu/u_debug/add0/c6 ;
  wire \u_cpu/u_debug/add0/c7 ;
  wire \u_cpu/u_debug/add0/c8 ;
  wire \u_cpu/u_debug/add0/c9 ;
  wire \u_cpu/u_debug/add1/c0 ;
  wire \u_cpu/u_debug/add1/c1 ;
  wire \u_cpu/u_debug/add1/c10 ;
  wire \u_cpu/u_debug/add1/c11 ;
  wire \u_cpu/u_debug/add1/c2 ;
  wire \u_cpu/u_debug/add1/c3 ;
  wire \u_cpu/u_debug/add1/c4 ;
  wire \u_cpu/u_debug/add1/c5 ;
  wire \u_cpu/u_debug/add1/c6 ;
  wire \u_cpu/u_debug/add1/c7 ;
  wire \u_cpu/u_debug/add1/c8 ;
  wire \u_cpu/u_debug/add1/c9 ;
  wire \u_cpu/u_debug/clear_rom_addr_cmd ;  // sources/rtl/mcu/debug.v(58)
  wire \u_cpu/u_debug/clear_rom_data_cmd ;  // sources/rtl/mcu/debug.v(59)
  wire \u_cpu/u_debug/debug_cmd ;  // sources/rtl/mcu/debug.v(57)
  wire \u_cpu/u_debug/free_run_cmd ;  // sources/rtl/mcu/debug.v(56)
  wire \u_cpu/u_debug/n12 ;
  wire \u_cpu/u_debug/n17 ;
  wire \u_cpu/u_debug/n2 ;
  wire \u_cpu/u_debug/n5 ;
  wire \u_cpu/u_debug/rom_bk_en ;  // sources/rtl/mcu/debug.v(68)
  wire \u_cpu/u_debug/rom_ren_d0 ;  // sources/rtl/mcu/debug.v(66)
  wire \u_cpu/u_debug/rom_ren_d1 ;  // sources/rtl/mcu/debug.v(67)
  wire \u_cpu/u_decode/inst_data ;  // sources/rtl/mcu/decode.v(78)
  wire \u_cpu/u_decode/n17 ;
  wire \u_cpu/u_decode/n19 ;
  wire \u_cpu/u_decode/n21 ;
  wire \u_cpu/u_decode/n23 ;
  wire \u_cpu/u_decode/n25 ;
  wire \u_cpu/u_decode/n27 ;
  wire \u_cpu/u_decode/n29 ;
  wire \u_cpu/u_decode/n31 ;
  wire \u_cpu/u_decode/n33 ;
  wire \u_cpu/u_decode/n35 ;
  wire \u_cpu/u_decode/n37 ;
  wire \u_cpu/u_decode/n39 ;
  wire \u_cpu/u_decode/n41 ;
  wire \u_cpu/u_decode/n43 ;
  wire \u_cpu/u_decode/n45 ;
  wire \u_cpu/u_decode/n47 ;
  wire \u_cpu/u_decode/n49 ;
  wire \u_cpu/u_decode/n51 ;
  wire \u_cpu/u_decode/n53 ;
  wire \u_cpu/u_decode/n55 ;
  wire \u_cpu/u_decode/n57 ;
  wire \u_cpu/u_decode/n59 ;
  wire \u_cpu/u_decode/n61 ;
  wire \u_cpu/u_decode/n63 ;
  wire \u_cpu/u_decode/n65 ;
  wire \u_cpu/u_decode/n67 ;
  wire \u_cpu/u_decode/n69 ;
  wire \u_cpu/u_decode/n71 ;
  wire \u_cpu/u_decode/n73 ;
  wire \u_cpu/u_decode/n75 ;
  wire \u_cpu/u_decode/n77 ;
  wire \u_cpu/u_decode/n79 ;
  wire \u_cpu/u_decode/n81 ;
  wire \u_cpu/u_decode/n83 ;
  wire \u_cpu/u_decode/n85 ;
  wire \u_cpu/u_decode/n87 ;
  wire \u_cpu/u_decode/n89 ;
  wire \u_cpu/u_decode/n9 ;
  wire \u_cpu/u_decode/n91 ;
  wire \u_cpu/u_decode/n93 ;
  wire \u_cpu/u_execute/bus_to_a_wen ;  // sources/rtl/mcu/execute.v(86)
  wire \u_cpu/u_execute/bus_to_b_wen ;  // sources/rtl/mcu/execute.v(87)
  wire \u_cpu/u_execute/bus_to_c_wen ;  // sources/rtl/mcu/execute.v(88)
  wire \u_cpu/u_execute/bus_to_d_wen ;  // sources/rtl/mcu/execute.v(89)
  wire \u_cpu/u_execute/dbg_info_en0 ;  // sources/rtl/mcu/execute.v(77)
  wire \u_cpu/u_execute/n0_lutinv ;
  wire \u_cpu/u_execute/n34 ;
  wire \u_cpu/u_execute/n40 ;
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
  wire \u_cpu/u_fetch/add0/c0 ;
  wire \u_cpu/u_fetch/add0/c1 ;
  wire \u_cpu/u_fetch/add0/c10 ;
  wire \u_cpu/u_fetch/add0/c11 ;
  wire \u_cpu/u_fetch/add0/c2 ;
  wire \u_cpu/u_fetch/add0/c3 ;
  wire \u_cpu/u_fetch/add0/c4 ;
  wire \u_cpu/u_fetch/add0/c5 ;
  wire \u_cpu/u_fetch/add0/c6 ;
  wire \u_cpu/u_fetch/add0/c7 ;
  wire \u_cpu/u_fetch/add0/c8 ;
  wire \u_cpu/u_fetch/add0/c9 ;
  wire \u_cpu/u_fetch/fetch_en ;  // sources/rtl/mcu/fetch.v(52)
  wire \u_cpu/u_fetch/n5 ;
  wire \u_cpu/u_fetch/n8 ;
  wire \u_cpu/u_fetch/rom_bk_en ;  // sources/rtl/mcu/fetch.v(53)
  wire \u_cpu/u_timer/n4 ;
  wire \u_cpu/u_timer/sub0/c0 ;
  wire \u_cpu/u_timer/sub0/c1 ;
  wire \u_cpu/u_timer/sub0/c10 ;
  wire \u_cpu/u_timer/sub0/c11 ;
  wire \u_cpu/u_timer/sub0/c12 ;
  wire \u_cpu/u_timer/sub0/c13 ;
  wire \u_cpu/u_timer/sub0/c14 ;
  wire \u_cpu/u_timer/sub0/c15 ;
  wire \u_cpu/u_timer/sub0/c16 ;
  wire \u_cpu/u_timer/sub0/c17 ;
  wire \u_cpu/u_timer/sub0/c18 ;
  wire \u_cpu/u_timer/sub0/c19 ;
  wire \u_cpu/u_timer/sub0/c2 ;
  wire \u_cpu/u_timer/sub0/c20 ;
  wire \u_cpu/u_timer/sub0/c21 ;
  wire \u_cpu/u_timer/sub0/c22 ;
  wire \u_cpu/u_timer/sub0/c23 ;
  wire \u_cpu/u_timer/sub0/c3 ;
  wire \u_cpu/u_timer/sub0/c4 ;
  wire \u_cpu/u_timer/sub0/c5 ;
  wire \u_cpu/u_timer/sub0/c6 ;
  wire \u_cpu/u_timer/sub0/c7 ;
  wire \u_cpu/u_timer/sub0/c8 ;
  wire \u_cpu/u_timer/sub0/c9 ;
  wire \u_key/add0/c0 ;
  wire \u_key/add0/c1 ;
  wire \u_key/add0/c10 ;
  wire \u_key/add0/c11 ;
  wire \u_key/add0/c12 ;
  wire \u_key/add0/c13 ;
  wire \u_key/add0/c14 ;
  wire \u_key/add0/c15 ;
  wire \u_key/add0/c16 ;
  wire \u_key/add0/c17 ;
  wire \u_key/add0/c18 ;
  wire \u_key/add0/c2 ;
  wire \u_key/add0/c3 ;
  wire \u_key/add0/c4 ;
  wire \u_key/add0/c5 ;
  wire \u_key/add0/c6 ;
  wire \u_key/add0/c7 ;
  wire \u_key/add0/c8 ;
  wire \u_key/add0/c9 ;
  wire \u_key/key_flag ;  // sources/rtl/key/key.v(37)
  wire \u_key/n14 ;
  wire \u_key/n23_lutinv ;
  wire \u_key/n25 ;
  wire \u_pll/clk0_buf ;  // al_ip/pll.v(28)
  wire \u_ram/n4 ;
  wire \u_rom/n4 ;
  wire \u_uart/rx_en ;  // sources/rtl/uart/uart.v(47)
  wire \u_uart/tx_en ;  // sources/rtl/uart/uart.v(49)
  wire \u_uart/tx_ready ;  // sources/rtl/uart/uart.v(51)
  wire \u_uart/u_uart_rx/add0/c0 ;
  wire \u_uart/u_uart_rx/add0/c1 ;
  wire \u_uart/u_uart_rx/add0/c10 ;
  wire \u_uart/u_uart_rx/add0/c11 ;
  wire \u_uart/u_uart_rx/add0/c12 ;
  wire \u_uart/u_uart_rx/add0/c13 ;
  wire \u_uart/u_uart_rx/add0/c14 ;
  wire \u_uart/u_uart_rx/add0/c15 ;
  wire \u_uart/u_uart_rx/add0/c16 ;
  wire \u_uart/u_uart_rx/add0/c17 ;
  wire \u_uart/u_uart_rx/add0/c18 ;
  wire \u_uart/u_uart_rx/add0/c19 ;
  wire \u_uart/u_uart_rx/add0/c2 ;
  wire \u_uart/u_uart_rx/add0/c20 ;
  wire \u_uart/u_uart_rx/add0/c21 ;
  wire \u_uart/u_uart_rx/add0/c22 ;
  wire \u_uart/u_uart_rx/add0/c23 ;
  wire \u_uart/u_uart_rx/add0/c24 ;
  wire \u_uart/u_uart_rx/add0/c25 ;
  wire \u_uart/u_uart_rx/add0/c26 ;
  wire \u_uart/u_uart_rx/add0/c27 ;
  wire \u_uart/u_uart_rx/add0/c28 ;
  wire \u_uart/u_uart_rx/add0/c29 ;
  wire \u_uart/u_uart_rx/add0/c3 ;
  wire \u_uart/u_uart_rx/add0/c30 ;
  wire \u_uart/u_uart_rx/add0/c31 ;
  wire \u_uart/u_uart_rx/add0/c4 ;
  wire \u_uart/u_uart_rx/add0/c5 ;
  wire \u_uart/u_uart_rx/add0/c6 ;
  wire \u_uart/u_uart_rx/add0/c7 ;
  wire \u_uart/u_uart_rx/add0/c8 ;
  wire \u_uart/u_uart_rx/add0/c9 ;
  wire \u_uart/u_uart_rx/add1/c0 ;
  wire \u_uart/u_uart_rx/add1/c1 ;
  wire \u_uart/u_uart_rx/add1/c2 ;
  wire \u_uart/u_uart_rx/add1/c3 ;
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
  wire \u_uart/u_uart_rx/n28 ;
  wire \u_uart/u_uart_rx/n5 ;
  wire \u_uart/u_uart_rx/start ;  // sources/rtl/uart/uart_rx.v(38)
  wire \u_uart/u_uart_tx/add0/c0 ;
  wire \u_uart/u_uart_tx/add0/c1 ;
  wire \u_uart/u_uart_tx/add0/c10 ;
  wire \u_uart/u_uart_tx/add0/c11 ;
  wire \u_uart/u_uart_tx/add0/c12 ;
  wire \u_uart/u_uart_tx/add0/c13 ;
  wire \u_uart/u_uart_tx/add0/c14 ;
  wire \u_uart/u_uart_tx/add0/c15 ;
  wire \u_uart/u_uart_tx/add0/c16 ;
  wire \u_uart/u_uart_tx/add0/c17 ;
  wire \u_uart/u_uart_tx/add0/c18 ;
  wire \u_uart/u_uart_tx/add0/c19 ;
  wire \u_uart/u_uart_tx/add0/c2 ;
  wire \u_uart/u_uart_tx/add0/c20 ;
  wire \u_uart/u_uart_tx/add0/c21 ;
  wire \u_uart/u_uart_tx/add0/c22 ;
  wire \u_uart/u_uart_tx/add0/c23 ;
  wire \u_uart/u_uart_tx/add0/c24 ;
  wire \u_uart/u_uart_tx/add0/c25 ;
  wire \u_uart/u_uart_tx/add0/c26 ;
  wire \u_uart/u_uart_tx/add0/c27 ;
  wire \u_uart/u_uart_tx/add0/c28 ;
  wire \u_uart/u_uart_tx/add0/c29 ;
  wire \u_uart/u_uart_tx/add0/c3 ;
  wire \u_uart/u_uart_tx/add0/c30 ;
  wire \u_uart/u_uart_tx/add0/c31 ;
  wire \u_uart/u_uart_tx/add0/c4 ;
  wire \u_uart/u_uart_tx/add0/c5 ;
  wire \u_uart/u_uart_tx/add0/c6 ;
  wire \u_uart/u_uart_tx/add0/c7 ;
  wire \u_uart/u_uart_tx/add0/c8 ;
  wire \u_uart/u_uart_tx/add0/c9 ;
  wire \u_uart/u_uart_tx/add1/c0 ;
  wire \u_uart/u_uart_tx/add1/c1 ;
  wire \u_uart/u_uart_tx/add1/c2 ;
  wire \u_uart/u_uart_tx/add1/c3 ;
  wire \u_uart/u_uart_tx/clk_en ;  // sources/rtl/uart/uart_tx.v(40)
  wire \u_uart/u_uart_tx/mux1_b0_sel_is_1_o ;
  wire \u_uart/u_uart_tx/n0 ;
  wire \u_uart/u_uart_tx/n13 ;
  wire \u_uart/u_uart_tx/n4 ;
  wire \u_uart/u_uart_tx/n7 ;
  wire \u_uart/u_uart_tx/n8 ;
  wire \u_uart/u_uart_tx/start ;  // sources/rtl/uart/uart_tx.v(39)
  wire \u_uart/u_ubus/add1/c0 ;
  wire \u_uart/u_ubus/add1/c1 ;
  wire \u_uart/u_ubus/add1/c2 ;
  wire \u_uart/u_ubus/add1/c3 ;
  wire \u_uart/u_ubus/frame_head_flag ;  // sources/rtl/uart/ubus.v(71)
  wire \u_uart/u_ubus/frame_head_flag0 ;  // sources/rtl/uart/ubus.v(65)
  wire \u_uart/u_ubus/frame_head_flag1 ;  // sources/rtl/uart/ubus.v(66)
  wire \u_uart/u_ubus/frame_head_flag2 ;  // sources/rtl/uart/ubus.v(67)
  wire \u_uart/u_ubus/frame_head_flag3 ;  // sources/rtl/uart/ubus.v(68)
  wire \u_uart/u_ubus/frame_head_flag4 ;  // sources/rtl/uart/ubus.v(69)
  wire \u_uart/u_ubus/frame_head_flag5 ;  // sources/rtl/uart/ubus.v(70)
  wire \u_uart/u_ubus/n11 ;
  wire \u_uart/u_ubus/n13 ;
  wire \u_uart/u_ubus/n15 ;
  wire \u_uart/u_ubus/n17 ;
  wire \u_uart/u_ubus/n19 ;
  wire \u_uart/u_ubus/n21 ;
  wire \u_uart/u_ubus/n26 ;
  wire \u_uart/u_ubus/n41 ;
  wire \u_uart/u_ubus/n42 ;
  wire \u_uart/u_ubus/rx_en_d ;  // sources/rtl/uart/ubus.v(56)
  wire \u_uart/u_ubus/send_finish ;  // sources/rtl/uart/ubus.v(73)
  wire \u_uart/u_ubus/send_finish_d ;
  wire \u_uart/u_ubus/send_flag ;  // sources/rtl/uart/ubus.v(75)
  wire \u_uart/u_ubus/send_start ;  // sources/rtl/uart/ubus.v(72)
  wire \u_uart/u_ubus/tx_ready_flag ;  // sources/rtl/uart/ubus.v(78)
  wire \u_vga/add0/c0 ;
  wire \u_vga/add0/c1 ;
  wire \u_vga/add0/c10 ;
  wire \u_vga/add0/c11 ;
  wire \u_vga/add0/c12 ;
  wire \u_vga/add0/c2 ;
  wire \u_vga/add0/c3 ;
  wire \u_vga/add0/c4 ;
  wire \u_vga/add0/c5 ;
  wire \u_vga/add0/c6 ;
  wire \u_vga/add0/c7 ;
  wire \u_vga/add0/c8 ;
  wire \u_vga/add0/c9 ;
  wire \u_vga/add1/c0 ;
  wire \u_vga/add1/c1 ;
  wire \u_vga/add1/c10 ;
  wire \u_vga/add1/c11 ;
  wire \u_vga/add1/c12 ;
  wire \u_vga/add1/c2 ;
  wire \u_vga/add1/c3 ;
  wire \u_vga/add1/c4 ;
  wire \u_vga/add1/c5 ;
  wire \u_vga/add1/c6 ;
  wire \u_vga/add1/c7 ;
  wire \u_vga/add1/c8 ;
  wire \u_vga/add1/c9 ;
  wire \u_vga/lt0_c0 ;
  wire \u_vga/lt0_c1 ;
  wire \u_vga/lt0_c10 ;
  wire \u_vga/lt0_c11 ;
  wire \u_vga/lt0_c12 ;
  wire \u_vga/lt0_c13 ;
  wire \u_vga/lt0_c2 ;
  wire \u_vga/lt0_c3 ;
  wire \u_vga/lt0_c4 ;
  wire \u_vga/lt0_c5 ;
  wire \u_vga/lt0_c6 ;
  wire \u_vga/lt0_c7 ;
  wire \u_vga/lt0_c8 ;
  wire \u_vga/lt0_c9 ;
  wire \u_vga/lt1_c0 ;
  wire \u_vga/lt1_c1 ;
  wire \u_vga/lt1_c10 ;
  wire \u_vga/lt1_c11 ;
  wire \u_vga/lt1_c12 ;
  wire \u_vga/lt1_c13 ;
  wire \u_vga/lt1_c2 ;
  wire \u_vga/lt1_c3 ;
  wire \u_vga/lt1_c4 ;
  wire \u_vga/lt1_c5 ;
  wire \u_vga/lt1_c6 ;
  wire \u_vga/lt1_c7 ;
  wire \u_vga/lt1_c8 ;
  wire \u_vga/lt1_c9 ;
  wire \u_vga/lt2_c0 ;
  wire \u_vga/lt2_c1 ;
  wire \u_vga/lt2_c10 ;
  wire \u_vga/lt2_c11 ;
  wire \u_vga/lt2_c12 ;
  wire \u_vga/lt2_c13 ;
  wire \u_vga/lt2_c2 ;
  wire \u_vga/lt2_c3 ;
  wire \u_vga/lt2_c4 ;
  wire \u_vga/lt2_c5 ;
  wire \u_vga/lt2_c6 ;
  wire \u_vga/lt2_c7 ;
  wire \u_vga/lt2_c8 ;
  wire \u_vga/lt2_c9 ;
  wire \u_vga/lt3_c0 ;
  wire \u_vga/lt3_c1 ;
  wire \u_vga/lt3_c10 ;
  wire \u_vga/lt3_c11 ;
  wire \u_vga/lt3_c12 ;
  wire \u_vga/lt3_c13 ;
  wire \u_vga/lt3_c2 ;
  wire \u_vga/lt3_c3 ;
  wire \u_vga/lt3_c4 ;
  wire \u_vga/lt3_c5 ;
  wire \u_vga/lt3_c6 ;
  wire \u_vga/lt3_c7 ;
  wire \u_vga/lt3_c8 ;
  wire \u_vga/lt3_c9 ;
  wire \u_vga/lt4_c0 ;
  wire \u_vga/lt4_c1 ;
  wire \u_vga/lt4_c10 ;
  wire \u_vga/lt4_c11 ;
  wire \u_vga/lt4_c12 ;
  wire \u_vga/lt4_c13 ;
  wire \u_vga/lt4_c2 ;
  wire \u_vga/lt4_c3 ;
  wire \u_vga/lt4_c4 ;
  wire \u_vga/lt4_c5 ;
  wire \u_vga/lt4_c6 ;
  wire \u_vga/lt4_c7 ;
  wire \u_vga/lt4_c8 ;
  wire \u_vga/lt4_c9 ;
  wire \u_vga/lt5_c0 ;
  wire \u_vga/lt5_c1 ;
  wire \u_vga/lt5_c10 ;
  wire \u_vga/lt5_c11 ;
  wire \u_vga/lt5_c12 ;
  wire \u_vga/lt5_c13 ;
  wire \u_vga/lt5_c2 ;
  wire \u_vga/lt5_c3 ;
  wire \u_vga/lt5_c4 ;
  wire \u_vga/lt5_c5 ;
  wire \u_vga/lt5_c6 ;
  wire \u_vga/lt5_c7 ;
  wire \u_vga/lt5_c8 ;
  wire \u_vga/lt5_c9 ;
  wire \u_vga/mux4_b0_sel_is_3_o ;
  wire \u_vga/n0 ;
  wire \u_vga/n10 ;
  wire \u_vga/n11 ;
  wire \u_vga/n12 ;
  wire \u_vga/n13 ;
  wire \u_vga/n14 ;
  wire \u_vga/n15 ;
  wire \u_vga/n16 ;
  wire \u_vga/n3_lutinv ;
  wire \u_vga/n7 ;
  wire \u_vga/n8 ;
  wire \u_vga/n9 ;
  wire \u_vga/sub0/c0 ;
  wire \u_vga/sub0/c1 ;
  wire \u_vga/sub0/c2 ;
  wire \u_vga/sub0/c3 ;
  wire \u_vga/sub0/c4 ;
  wire \u_vga/sub0/c5 ;
  wire \u_vga/sub0/c6 ;
  wire \u_vga/sub1/c0 ;
  wire \u_vga/sub1/c1 ;
  wire \u_vga/sub1/c10 ;
  wire \u_vga/sub1/c2 ;
  wire \u_vga/sub1/c3 ;
  wire \u_vga/sub1/c4 ;
  wire \u_vga/sub1/c5 ;
  wire \u_vga/sub1/c6 ;
  wire \u_vga/sub1/c7 ;
  wire \u_vga/sub1/c8 ;
  wire \u_vga/sub1/c9 ;
  wire \u_vram/add0/c0 ;
  wire \u_vram/add0/c1 ;
  wire \u_vram/add0/c2 ;
  wire \u_vram/add0/c3 ;
  wire \u_vram/add0/c4 ;
  wire \u_vram/add0/c5 ;
  wire \u_vram/add0/c6 ;
  wire \u_vram/axis_en_d0 ;  // sources/rtl/vga/vram.v(58)
  wire \u_vram/axis_en_d1 ;  // sources/rtl/vga/vram.v(61)
  wire \u_vram/axis_en_d2 ;  // sources/rtl/vga/vram.v(64)
  wire \u_vram/hs_i_d0 ;  // sources/rtl/vga/vram.v(52)
  wire \u_vram/hs_i_d1 ;  // sources/rtl/vga/vram.v(54)
  wire \u_vram/hs_i_d2 ;  // sources/rtl/vga/vram.v(56)
  wire \u_vram/lt0_c0 ;
  wire \u_vram/lt0_c1 ;
  wire \u_vram/lt0_c10 ;
  wire \u_vram/lt0_c11 ;
  wire \u_vram/lt0_c2 ;
  wire \u_vram/lt0_c3 ;
  wire \u_vram/lt0_c4 ;
  wire \u_vram/lt0_c5 ;
  wire \u_vram/lt0_c6 ;
  wire \u_vram/lt0_c7 ;
  wire \u_vram/lt0_c8 ;
  wire \u_vram/lt0_c9 ;
  wire \u_vram/lt1_c0 ;
  wire \u_vram/lt1_c1 ;
  wire \u_vram/lt1_c10 ;
  wire \u_vram/lt1_c11 ;
  wire \u_vram/lt1_c2 ;
  wire \u_vram/lt1_c3 ;
  wire \u_vram/lt1_c4 ;
  wire \u_vram/lt1_c5 ;
  wire \u_vram/lt1_c6 ;
  wire \u_vram/lt1_c7 ;
  wire \u_vram/lt1_c8 ;
  wire \u_vram/lt1_c9 ;
  wire \u_vram/lt2_c0 ;
  wire \u_vram/lt2_c1 ;
  wire \u_vram/lt2_c10 ;
  wire \u_vram/lt2_c11 ;
  wire \u_vram/lt2_c2 ;
  wire \u_vram/lt2_c3 ;
  wire \u_vram/lt2_c4 ;
  wire \u_vram/lt2_c5 ;
  wire \u_vram/lt2_c6 ;
  wire \u_vram/lt2_c7 ;
  wire \u_vram/lt2_c8 ;
  wire \u_vram/lt2_c9 ;
  wire \u_vram/lt3_c0 ;
  wire \u_vram/lt3_c1 ;
  wire \u_vram/lt3_c10 ;
  wire \u_vram/lt3_c11 ;
  wire \u_vram/lt3_c2 ;
  wire \u_vram/lt3_c3 ;
  wire \u_vram/lt3_c4 ;
  wire \u_vram/lt3_c5 ;
  wire \u_vram/lt3_c6 ;
  wire \u_vram/lt3_c7 ;
  wire \u_vram/lt3_c8 ;
  wire \u_vram/lt3_c9 ;
  wire \u_vram/mux3_b10_sel_is_3_o ;
  wire \u_vram/mux3_b12_sel_is_1_o ;
  wire \u_vram/mux3_b14_sel_is_3_o ;
  wire \u_vram/n10 ;
  wire \u_vram/n12 ;
  wire \u_vram/n14 ;
  wire \u_vram/n18_lutinv ;
  wire \u_vram/n23_lutinv ;
  wire \u_vram/n24_lutinv ;
  wire \u_vram/n26[10]_d ;
  wire \u_vram/n26[11]_d ;
  wire \u_vram/n9 ;
  wire \u_vram/state ;  // sources/rtl/vga/vram.v(46)
  wire \u_vram/state_d ;
  wire \u_vram/sub0/c0 ;
  wire \u_vram/sub0/c1 ;
  wire \u_vram/sub0/c2 ;
  wire \u_vram/sub0/c3 ;
  wire \u_vram/sub0/c4 ;
  wire \u_vram/sub1/c0 ;
  wire \u_vram/sub1/c1 ;
  wire \u_vram/sub1/c2 ;
  wire \u_vram/sub1/c3 ;
  wire \u_vram/sub1/c4 ;
  wire \u_vram/vs_i_d0 ;  // sources/rtl/vga/vram.v(53)
  wire \u_vram/vs_i_d1 ;  // sources/rtl/vga/vram.v(55)
  wire \u_vram/vs_i_d2 ;  // sources/rtl/vga/vram.v(57)
  wire vga_clk_pad;  // sources/rtl/top.v(31)
  wire vram_rdata;  // sources/rtl/top.v(91)
  wire vram_ren;  // sources/rtl/top.v(90)
  wire vram_wdata;  // sources/rtl/top.v(89)
  wire vram_wen;  // sources/rtl/top.v(88)
  wire vsyn;  // sources/rtl/top.v(78)

  AL_MAP_LUT3 #(
    .EQN("(~B*~(C*A))"),
    .INIT(8'h13))
    _al_u1000 (
    .a(\u_cpu/u_execute/C [2]),
    .b(\u_cpu/u_execute/wt_ram_cmd [1]),
    .c(\u_cpu/u_execute/wt_ram_cmd [2]),
    .o(_al_u1000_o));
  AL_MAP_LUT4 #(
    .EQN("(C*~(B*~(~D*~A)))"),
    .INIT(16'h3070))
    _al_u1001 (
    .a(\u_cpu/u_execute/n47 [2]),
    .b(_al_u999_o),
    .c(_al_u1000_o),
    .d(\u_cpu/u_execute/wt_ram_cmd [4]),
    .o(_al_u1001_o));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u1002 (
    .a(\u_cpu/alu_in2 [2]),
    .b(\u_cpu/u_execute/wt_ram_cmd [1]),
    .o(_al_u1002_o));
  AL_MAP_LUT4 #(
    .EQN("((~B*~A)*~(C)*~(D)+(~B*~A)*C*~(D)+~((~B*~A))*C*D+(~B*~A)*C*D)"),
    .INIT(16'hf011))
    _al_u1003 (
    .a(_al_u1001_o),
    .b(_al_u1002_o),
    .c(bus_wdata[2]),
    .d(\u_cpu/u_execute/wt_ram_cmd [0]),
    .o(\u_cpu/u_execute/n52 [2]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(B*~(A)*~(D)+B*A*~(D)+~(B)*A*D+B*A*D))"),
    .INIT(16'h0503))
    _al_u1004 (
    .a(\u_cpu/alu_out4 [1]),
    .b(ram_wdata[1]),
    .c(\u_cpu/u_execute/wt_ram_cmd [8]),
    .d(\u_cpu/u_execute/wt_ram_cmd [9]),
    .o(_al_u1004_o));
  AL_MAP_LUT4 #(
    .EQN("(~C*~B*~(D*~A))"),
    .INIT(16'h0203))
    _al_u1005 (
    .a(\u_cpu/alu_out3 [1]),
    .b(\u_cpu/u_execute/wt_ram_cmd [6]),
    .c(\u_cpu/u_execute/wt_ram_cmd [7]),
    .d(\u_cpu/u_execute/wt_ram_cmd [8]),
    .o(_al_u1005_o));
  AL_MAP_LUT3 #(
    .EQN("(~B*~(C*A))"),
    .INIT(8'h13))
    _al_u1006 (
    .a(\u_cpu/alu_out1 [1]),
    .b(\u_cpu/u_execute/wt_ram_cmd [5]),
    .c(\u_cpu/u_execute/wt_ram_cmd [6]),
    .o(_al_u1006_o));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u1007 (
    .a(\u_cpu/alu_out1 [9]),
    .b(\u_cpu/u_execute/wt_ram_cmd [5]),
    .o(_al_u1007_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~(B*~A)))"),
    .INIT(16'h004f))
    _al_u1008 (
    .a(_al_u1004_o),
    .b(_al_u1005_o),
    .c(_al_u1006_o),
    .d(_al_u1007_o),
    .o(\u_cpu/u_execute/n47 [1]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~B*~(D*~A))"),
    .INIT(16'h0203))
    _al_u1009 (
    .a(\u_cpu/alu_out0 [1]),
    .b(\u_cpu/u_execute/wt_ram_cmd [2]),
    .c(\u_cpu/u_execute/wt_ram_cmd [3]),
    .d(\u_cpu/u_execute/wt_ram_cmd [4]),
    .o(_al_u1009_o));
  AL_MAP_LUT3 #(
    .EQN("(~B*~(C*A))"),
    .INIT(8'h13))
    _al_u1010 (
    .a(\u_cpu/u_execute/C [1]),
    .b(\u_cpu/u_execute/wt_ram_cmd [1]),
    .c(\u_cpu/u_execute/wt_ram_cmd [2]),
    .o(_al_u1010_o));
  AL_MAP_LUT4 #(
    .EQN("(C*~(B*~(~D*~A)))"),
    .INIT(16'h3070))
    _al_u1011 (
    .a(\u_cpu/u_execute/n47 [1]),
    .b(_al_u1009_o),
    .c(_al_u1010_o),
    .d(\u_cpu/u_execute/wt_ram_cmd [4]),
    .o(_al_u1011_o));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u1012 (
    .a(\u_cpu/alu_in2 [1]),
    .b(\u_cpu/u_execute/wt_ram_cmd [1]),
    .o(_al_u1012_o));
  AL_MAP_LUT4 #(
    .EQN("((~B*~A)*~(C)*~(D)+(~B*~A)*C*~(D)+~((~B*~A))*C*D+(~B*~A)*C*D)"),
    .INIT(16'hf011))
    _al_u1013 (
    .a(_al_u1011_o),
    .b(_al_u1012_o),
    .c(bus_wdata[1]),
    .d(\u_cpu/u_execute/wt_ram_cmd [0]),
    .o(\u_cpu/u_execute/n52 [1]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(B*~(A)*~(D)+B*A*~(D)+~(B)*A*D+B*A*D))"),
    .INIT(16'h0503))
    _al_u1014 (
    .a(\u_cpu/alu_out4 [0]),
    .b(ram_wdata[0]),
    .c(\u_cpu/u_execute/wt_ram_cmd [8]),
    .d(\u_cpu/u_execute/wt_ram_cmd [9]),
    .o(_al_u1014_o));
  AL_MAP_LUT4 #(
    .EQN("(~C*~B*~(D*~A))"),
    .INIT(16'h0203))
    _al_u1015 (
    .a(\u_cpu/alu_out3 [0]),
    .b(\u_cpu/u_execute/wt_ram_cmd [6]),
    .c(\u_cpu/u_execute/wt_ram_cmd [7]),
    .d(\u_cpu/u_execute/wt_ram_cmd [8]),
    .o(_al_u1015_o));
  AL_MAP_LUT4 #(
    .EQN("~((D*B)*~(A)*~(C)+(D*B)*A*~(C)+~((D*B))*A*C+(D*B)*A*C)"),
    .INIT(16'h535f))
    _al_u1016 (
    .a(\u_cpu/alu_out1 [0]),
    .b(\u_cpu/alu_out2 [0]),
    .c(\u_cpu/u_execute/wt_ram_cmd [6]),
    .d(\u_cpu/u_execute/wt_ram_cmd [7]),
    .o(_al_u1016_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~(B*~A)))"),
    .INIT(16'h004f))
    _al_u1017 (
    .a(_al_u1014_o),
    .b(_al_u1015_o),
    .c(_al_u1016_o),
    .d(\u_cpu/u_execute/wt_ram_cmd [5]),
    .o(_al_u1017_o));
  AL_MAP_LUT3 #(
    .EQN("(~B*~(C*A))"),
    .INIT(8'h13))
    _al_u1018 (
    .a(\u_cpu/alu_out1 [8]),
    .b(\u_cpu/u_execute/wt_ram_cmd [4]),
    .c(\u_cpu/u_execute/wt_ram_cmd [5]),
    .o(_al_u1018_o));
  AL_MAP_LUT3 #(
    .EQN("(~B*~(C*~A))"),
    .INIT(8'h23))
    _al_u1019 (
    .a(\u_cpu/alu_out0 [0]),
    .b(\u_cpu/u_execute/wt_ram_cmd [3]),
    .c(\u_cpu/u_execute/wt_ram_cmd [4]),
    .o(_al_u1019_o));
  AL_MAP_LUT3 #(
    .EQN("(~B*~(C*A))"),
    .INIT(8'h13))
    _al_u1020 (
    .a(\u_cpu/alu_out0 [8]),
    .b(\u_cpu/u_execute/wt_ram_cmd [2]),
    .c(\u_cpu/u_execute/wt_ram_cmd [3]),
    .o(_al_u1020_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~(C*~(B*~A)))"),
    .INIT(16'h4f00))
    _al_u1021 (
    .a(_al_u1017_o),
    .b(_al_u1018_o),
    .c(_al_u1019_o),
    .d(_al_u1020_o),
    .o(_al_u1021_o));
  AL_MAP_LUT4 #(
    .EQN("~((D*B)*~(A)*~(C)+(D*B)*A*~(C)+~((D*B))*A*C+(D*B)*A*C)"),
    .INIT(16'h535f))
    _al_u1022 (
    .a(bus_wdata[0]),
    .b(\u_cpu/alu_in2 [0]),
    .c(\u_cpu/u_execute/wt_ram_cmd [0]),
    .d(\u_cpu/u_execute/wt_ram_cmd [1]),
    .o(_al_u1022_o));
  AL_MAP_LUT4 #(
    .EQN("(~C*~B*~(D*~A))"),
    .INIT(16'h0203))
    _al_u1023 (
    .a(\u_cpu/u_execute/C [0]),
    .b(\u_cpu/u_execute/wt_ram_cmd [0]),
    .c(\u_cpu/u_execute/wt_ram_cmd [1]),
    .d(\u_cpu/u_execute/wt_ram_cmd [2]),
    .o(_al_u1023_o));
  AL_MAP_LUT3 #(
    .EQN("~(B*~(C*~A))"),
    .INIT(8'h73))
    _al_u1024 (
    .a(_al_u1021_o),
    .b(_al_u1022_o),
    .c(_al_u1023_o),
    .o(\u_cpu/u_execute/n52 [0]));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+A*B*~(C)*~(D)+~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*B*C*~(D)+A*B*C*~(D)+~(A)*~(B)*~(C)*D+A*~(B)*~(C)*D+~(A)*B*~(C)*D+A*B*~(C)*D+~(A)*~(B)*C*D+A*~(B)*C*D+A*B*C*D)"),
    .INIT(16'hbffd))
    _al_u1025 (
    .a(\u_vram/axis_y_d2 [5]),
    .b(\u_vram/axis_y_d2 [6]),
    .c(\u_vram/axis_y_d2 [7]),
    .d(\u_vram/axis_y_d2 [8]),
    .o(_al_u1025_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*A)"),
    .INIT(16'h0002))
    _al_u1026 (
    .a(\u_vram/n23_lutinv ),
    .b(_al_u1025_o),
    .c(\u_vram/axis_y_d2 [10]),
    .d(\u_vram/axis_y_d2 [9]),
    .o(_al_u1026_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*~A)"),
    .INIT(16'h0004))
    _al_u1027 (
    .a(\u_vram/axis_x_d2 [10]),
    .b(\u_vram/axis_x_d2 [5]),
    .c(\u_vram/axis_x_d2 [7]),
    .d(\u_vram/axis_x_d2 [8]),
    .o(_al_u1027_o));
  AL_MAP_LUT4 #(
    .EQN("(B*A*~(D@C))"),
    .INIT(16'h8008))
    _al_u1028 (
    .a(\u_vram/n24_lutinv ),
    .b(_al_u1027_o),
    .c(\u_vram/axis_x_d2 [6]),
    .d(\u_vram/axis_x_d2 [9]),
    .o(\u_vram/n18_lutinv ));
  AL_MAP_LUT4 #(
    .EQN("~(~C*~B*~(D*~A))"),
    .INIT(16'hfdfc))
    _al_u1029 (
    .a(\u_vram/n26[11]_d ),
    .b(_al_u1026_o),
    .c(\u_vram/n18_lutinv ),
    .d(\u_vram/state ),
    .o(\u_vram/n26[10]_d ));
  AL_MAP_LUT3 #(
    .EQN("(C*~(~B*~A))"),
    .INIT(8'he0))
    _al_u1030 (
    .a(_al_u1026_o),
    .b(\u_vram/n18_lutinv ),
    .c(\u_vram/mux3_b12_sel_is_1_o ),
    .o(\u_vram/mux3_b14_sel_is_3_o ));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*~A)"),
    .INIT(8'h10))
    _al_u1031 (
    .a(_al_u1026_o),
    .b(\u_vram/n18_lutinv ),
    .c(\u_vram/mux3_b12_sel_is_1_o ),
    .o(\u_vram/mux3_b10_sel_is_3_o ));
  AL_MAP_LUT2 #(
    .EQN("~(~B*~A)"),
    .INIT(4'he))
    _al_u1032 (
    .a(\u_vram/n26[11]_d ),
    .b(\u_vram/state ),
    .o(\u_vram/state_d ));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u1033 (
    .a(key_pad[5]),
    .o(\u_key/n15 [5]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u1034 (
    .a(key_pad[4]),
    .o(\u_key/n15 [4]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u1035 (
    .a(key_pad[3]),
    .o(\u_key/n15 [3]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u1036 (
    .a(key_pad[2]),
    .o(\u_key/n15 [2]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u1037 (
    .a(key_pad[1]),
    .o(\u_key/n15 [1]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u1038 (
    .a(key_pad[0]),
    .o(\u_key/n15 [0]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u1039 (
    .a(\u_uart/u_uart_tx/start ),
    .o(\u_uart/u_uart_tx/n7 ));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u1040 (
    .a(\u_uart/u_ubus/tx_ready_cnt [0]),
    .o(\u_uart/u_ubus/n39 [0]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u1041 (
    .a(\u_vga/n7 ),
    .o(\u_vga/n8 ));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u1042 (
    .a(\u_vga/n9 ),
    .o(\u_vga/n10 ));
  EG_PHY_PAD #(
    //.LOCATION("K14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u122 (
    .ipad(clk),
    .di(clk_pad));  // sources/rtl/top.v(24)
  EG_PHY_PAD #(
    //.LOCATION("G12"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u123 (
    .ipad(key[5]),
    .di(key_pad[5]));  // sources/rtl/top.v(37)
  EG_PHY_PAD #(
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u124 (
    .ipad(key[4]),
    .di(key_pad[4]));  // sources/rtl/top.v(37)
  EG_PHY_PAD #(
    //.LOCATION("J13"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u125 (
    .ipad(key[3]),
    .di(key_pad[3]));  // sources/rtl/top.v(37)
  EG_PHY_PAD #(
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u126 (
    .ipad(key[2]),
    .di(key_pad[2]));  // sources/rtl/top.v(37)
  EG_PHY_PAD #(
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u127 (
    .ipad(key[1]),
    .di(key_pad[1]));  // sources/rtl/top.v(37)
  EG_PHY_PAD #(
    //.LOCATION("H14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u128 (
    .ipad(key[0]),
    .di(key_pad[0]));  // sources/rtl/top.v(37)
  EG_PHY_PAD #(
    //.LOCATION("M3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u129 (
    .do({open_n120,open_n121,open_n122,led_pad}),
    .opad(led));  // sources/rtl/top.v(40)
  EG_PHY_PAD #(
    //.LOCATION("F16"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u130 (
    .ipad(rx),
    .di(rx_pad));  // sources/rtl/top.v(27)
  EG_PHY_PAD #(
    //.LOCATION("E16"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u131 (
    .do({open_n154,open_n155,open_n156,tx_pad}),
    .opad(tx));  // sources/rtl/top.v(28)
  EG_PHY_PAD #(
    //.LOCATION("H2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u132 (
    .do({open_n171,open_n172,open_n173,vga_clk_pad}),
    .opad(vga_clk));  // sources/rtl/top.v(31)
  EG_PHY_PAD #(
    //.LOCATION("L5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u133 (
    .do({open_n188,open_n189,open_n190,vga_rgb_pad[14]}),
    .opad(vga_rgb[23]));  // sources/rtl/top.v(34)
  EG_PHY_PAD #(
    //.LOCATION("L3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u134 (
    .do({open_n205,open_n206,open_n207,vga_rgb_pad[22]}),
    .opad(vga_rgb[22]));  // sources/rtl/top.v(34)
  EG_PHY_PAD #(
    //.LOCATION("M2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u135 (
    .do({open_n222,open_n223,open_n224,vga_rgb_pad[21]}),
    .opad(vga_rgb[21]));  // sources/rtl/top.v(34)
  EG_PHY_PAD #(
    //.LOCATION("M1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u136 (
    .do({open_n239,open_n240,open_n241,vga_rgb_pad[22]}),
    .opad(vga_rgb[20]));  // sources/rtl/top.v(34)
  EG_PHY_PAD #(
    //.LOCATION("L4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u137 (
    .do({open_n256,open_n257,open_n258,vga_rgb_pad[19]}),
    .opad(vga_rgb[19]));  // sources/rtl/top.v(34)
  EG_PHY_PAD #(
    //.LOCATION("K5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u138 (
    .do({open_n273,open_n274,open_n275,1'b0}),
    .opad(vga_rgb[18]));  // sources/rtl/top.v(34)
  EG_PHY_PAD #(
    //.LOCATION("K3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u139 (
    .do({open_n290,open_n291,open_n292,1'b0}),
    .opad(vga_rgb[17]));  // sources/rtl/top.v(34)
  EG_PHY_PAD #(
    //.LOCATION("K6"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u140 (
    .do({open_n307,open_n308,open_n309,1'b0}),
    .opad(vga_rgb[16]));  // sources/rtl/top.v(34)
  EG_PHY_PAD #(
    //.LOCATION("H5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u141 (
    .do({open_n324,open_n325,open_n326,vga_rgb_pad[21]}),
    .opad(vga_rgb[15]));  // sources/rtl/top.v(34)
  EG_PHY_PAD #(
    //.LOCATION("H1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u142 (
    .do({open_n341,open_n342,open_n343,vga_rgb_pad[14]}),
    .opad(vga_rgb[14]));  // sources/rtl/top.v(34)
  EG_PHY_PAD #(
    //.LOCATION("J6"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u143 (
    .do({open_n358,open_n359,open_n360,vga_rgb_pad[13]}),
    .opad(vga_rgb[13]));  // sources/rtl/top.v(34)
  EG_PHY_PAD #(
    //.LOCATION("H3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u144 (
    .do({open_n375,open_n376,open_n377,vga_rgb_pad[21]}),
    .opad(vga_rgb[12]));  // sources/rtl/top.v(34)
  EG_PHY_PAD #(
    //.LOCATION("K1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u145 (
    .do({open_n392,open_n393,open_n394,vga_rgb_pad[19]}),
    .opad(vga_rgb[10]));  // sources/rtl/top.v(34)
  EG_PHY_PAD #(
    //.LOCATION("K2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u146 (
    .do({open_n409,open_n410,open_n411,1'b0}),
    .opad(vga_rgb[9]));  // sources/rtl/top.v(34)
  EG_PHY_PAD #(
    //.LOCATION("L1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u147 (
    .do({open_n426,open_n427,open_n428,1'b0}),
    .opad(vga_rgb[8]));  // sources/rtl/top.v(34)
  EG_PHY_PAD #(
    //.LOCATION("C1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u148 (
    .do({open_n443,open_n444,open_n445,1'b0}),
    .opad(vga_rgb[7]));  // sources/rtl/top.v(34)
  EG_PHY_PAD #(
    //.LOCATION("D1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u149 (
    .do({open_n460,open_n461,open_n462,vga_rgb_pad[13]}),
    .opad(vga_rgb[6]));  // sources/rtl/top.v(34)
  EG_PHY_PAD #(
    //.LOCATION("E2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u150 (
    .do({open_n477,open_n478,open_n479,vga_rgb_pad[14]}),
    .opad(vga_rgb[5]));  // sources/rtl/top.v(34)
  EG_PHY_PAD #(
    //.LOCATION("G3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u151 (
    .do({open_n494,open_n495,open_n496,vga_rgb_pad[13]}),
    .opad(vga_rgb[4]));  // sources/rtl/top.v(34)
  EG_PHY_PAD #(
    //.LOCATION("E1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u152 (
    .do({open_n511,open_n512,open_n513,vga_rgb_pad[14]}),
    .opad(vga_rgb[3]));  // sources/rtl/top.v(34)
  EG_PHY_PAD #(
    //.LOCATION("F2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u153 (
    .do({open_n528,open_n529,open_n530,1'b0}),
    .opad(vga_rgb[2]));  // sources/rtl/top.v(34)
  EG_PHY_PAD #(
    //.LOCATION("F1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u154 (
    .do({open_n545,open_n546,open_n547,1'b0}),
    .opad(vga_rgb[1]));  // sources/rtl/top.v(34)
  EG_PHY_PAD #(
    //.LOCATION("G1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u155 (
    .do({open_n562,open_n563,open_n564,1'b0}),
    .opad(vga_rgb[0]));  // sources/rtl/top.v(34)
  AL_MAP_LUT2 #(
    .EQN("~(~B*~A)"),
    .INIT(4'he))
    _al_u275 (
    .a(\u_cpu/dbg_rom_ren ),
    .b(\u_cpu/u_fetch/fetch_en ),
    .o(\u_cpu/u_fetch/n5 ));
  AL_MAP_LUT2 #(
    .EQN("~(~B*~A)"),
    .INIT(4'he))
    _al_u276 (
    .a(\u_cpu/dbg_inst_en ),
    .b(\u_cpu/u_fetch/rom_bk_en ),
    .o(\u_cpu/u_fetch/n8 ));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u277 (
    .a(\u_uart/u_ubus/send_start ),
    .b(\u_uart/u_ubus/tx_ready_flag ),
    .o(\u_uart/u_ubus/n42 ));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u278 (
    .a(\u_vga/n11 ),
    .b(\u_vga/n12 ),
    .o(\u_vga/n13 ));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u279 (
    .a(\u_vga/n14 ),
    .b(\u_vga/n15 ),
    .o(\u_vga/n16 ));
  AL_MAP_LUT4 #(
    .EQN("((~B*A)*~(D)*~(C)+(~B*A)*D*~(C)+~((~B*A))*D*C+(~B*A)*D*C)"),
    .INIT(16'hf202))
    _al_u280 (
    .a(send_cmd[7]),
    .b(\u_cpu/u_debug/rom_bk_en ),
    .c(\u_cpu/dbg_info_en ),
    .d(\u_cpu/dbg_info [15]),
    .o(\u_cpu/u_debug/n20 [7]));
  AL_MAP_LUT4 #(
    .EQN("((~B*A)*~(D)*~(C)+(~B*A)*D*~(C)+~((~B*A))*D*C+(~B*A)*D*C)"),
    .INIT(16'hf202))
    _al_u281 (
    .a(send_cmd[6]),
    .b(\u_cpu/u_debug/rom_bk_en ),
    .c(\u_cpu/dbg_info_en ),
    .d(\u_cpu/dbg_info [14]),
    .o(\u_cpu/u_debug/n20 [6]));
  AL_MAP_LUT4 #(
    .EQN("((~B*A)*~(D)*~(C)+(~B*A)*D*~(C)+~((~B*A))*D*C+(~B*A)*D*C)"),
    .INIT(16'hf202))
    _al_u282 (
    .a(send_cmd[5]),
    .b(\u_cpu/u_debug/rom_bk_en ),
    .c(\u_cpu/dbg_info_en ),
    .d(\u_cpu/dbg_info [13]),
    .o(\u_cpu/u_debug/n20 [5]));
  AL_MAP_LUT4 #(
    .EQN("((~B*A)*~(D)*~(C)+(~B*A)*D*~(C)+~((~B*A))*D*C+(~B*A)*D*C)"),
    .INIT(16'hf202))
    _al_u283 (
    .a(send_cmd[4]),
    .b(\u_cpu/u_debug/rom_bk_en ),
    .c(\u_cpu/dbg_info_en ),
    .d(\u_cpu/dbg_info [12]),
    .o(\u_cpu/u_debug/n20 [4]));
  AL_MAP_LUT4 #(
    .EQN("((~B*A)*~(D)*~(C)+(~B*A)*D*~(C)+~((~B*A))*D*C+(~B*A)*D*C)"),
    .INIT(16'hf202))
    _al_u284 (
    .a(send_cmd[3]),
    .b(\u_cpu/u_debug/rom_bk_en ),
    .c(\u_cpu/dbg_info_en ),
    .d(\u_cpu/dbg_info [11]),
    .o(\u_cpu/u_debug/n20 [3]));
  AL_MAP_LUT4 #(
    .EQN("((~B*A)*~(D)*~(C)+(~B*A)*D*~(C)+~((~B*A))*D*C+(~B*A)*D*C)"),
    .INIT(16'hf202))
    _al_u285 (
    .a(send_cmd[2]),
    .b(\u_cpu/u_debug/rom_bk_en ),
    .c(\u_cpu/dbg_info_en ),
    .d(\u_cpu/dbg_info [10]),
    .o(\u_cpu/u_debug/n20 [2]));
  AL_MAP_LUT4 #(
    .EQN("((~B*A)*~(D)*~(C)+(~B*A)*D*~(C)+~((~B*A))*D*C+(~B*A)*D*C)"),
    .INIT(16'hf202))
    _al_u286 (
    .a(send_cmd[1]),
    .b(\u_cpu/u_debug/rom_bk_en ),
    .c(\u_cpu/dbg_info_en ),
    .d(\u_cpu/dbg_info [9]),
    .o(\u_cpu/u_debug/n20 [1]));
  AL_MAP_LUT4 #(
    .EQN("((~B*A)*~(D)*~(C)+(~B*A)*D*~(C)+~((~B*A))*D*C+(~B*A)*D*C)"),
    .INIT(16'hf202))
    _al_u287 (
    .a(send_cmd[0]),
    .b(\u_cpu/u_debug/rom_bk_en ),
    .c(\u_cpu/dbg_info_en ),
    .d(\u_cpu/dbg_info [8]),
    .o(\u_cpu/u_debug/n20 [0]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(~B*~A))"),
    .INIT(8'he0))
    _al_u288 (
    .a(\u_cpu/u_debug/rom_bk_en ),
    .b(\u_cpu/dbg_info_en ),
    .c(send_ready),
    .o(\u_cpu/u_debug/n17 ));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    .INIT(16'h0305))
    _al_u289 (
    .a(\u_cpu/alu_out0 [8]),
    .b(\u_cpu/u_alu/n5 [8]),
    .c(\u_cpu/alu_cmd [0]),
    .d(\u_cpu/alu_cmd [1]),
    .o(_al_u289_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u290 (
    .a(_al_u289_o),
    .b(\u_cpu/u_alu/n3 ),
    .c(\u_cpu/alu_cmd [0]),
    .o(\u_cpu/u_alu/n7 [8]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    .INIT(16'h0305))
    _al_u291 (
    .a(\u_cpu/alu_out0 [7]),
    .b(\u_cpu/u_alu/n5 [7]),
    .c(\u_cpu/alu_cmd [0]),
    .d(\u_cpu/alu_cmd [1]),
    .o(_al_u291_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u292 (
    .a(_al_u291_o),
    .b(\u_cpu/u_alu/n4 [7]),
    .c(\u_cpu/alu_cmd [0]),
    .o(\u_cpu/u_alu/n7 [7]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    .INIT(16'h0305))
    _al_u293 (
    .a(\u_cpu/alu_out0 [6]),
    .b(\u_cpu/u_alu/n5 [6]),
    .c(\u_cpu/alu_cmd [0]),
    .d(\u_cpu/alu_cmd [1]),
    .o(_al_u293_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u294 (
    .a(_al_u293_o),
    .b(\u_cpu/u_alu/n4 [6]),
    .c(\u_cpu/alu_cmd [0]),
    .o(\u_cpu/u_alu/n7 [6]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    .INIT(16'h0305))
    _al_u295 (
    .a(\u_cpu/alu_out0 [5]),
    .b(\u_cpu/u_alu/n5 [5]),
    .c(\u_cpu/alu_cmd [0]),
    .d(\u_cpu/alu_cmd [1]),
    .o(_al_u295_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u296 (
    .a(_al_u295_o),
    .b(\u_cpu/u_alu/n4 [5]),
    .c(\u_cpu/alu_cmd [0]),
    .o(\u_cpu/u_alu/n7 [5]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    .INIT(16'h0305))
    _al_u297 (
    .a(\u_cpu/alu_out0 [4]),
    .b(\u_cpu/u_alu/n5 [4]),
    .c(\u_cpu/alu_cmd [0]),
    .d(\u_cpu/alu_cmd [1]),
    .o(_al_u297_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u298 (
    .a(_al_u297_o),
    .b(\u_cpu/u_alu/n4 [4]),
    .c(\u_cpu/alu_cmd [0]),
    .o(\u_cpu/u_alu/n7 [4]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    .INIT(16'h0305))
    _al_u299 (
    .a(\u_cpu/alu_out0 [3]),
    .b(\u_cpu/u_alu/n5 [3]),
    .c(\u_cpu/alu_cmd [0]),
    .d(\u_cpu/alu_cmd [1]),
    .o(_al_u299_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u300 (
    .a(_al_u299_o),
    .b(\u_cpu/u_alu/n4 [3]),
    .c(\u_cpu/alu_cmd [0]),
    .o(\u_cpu/u_alu/n7 [3]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    .INIT(16'h0305))
    _al_u301 (
    .a(\u_cpu/alu_out0 [2]),
    .b(\u_cpu/u_alu/n5 [2]),
    .c(\u_cpu/alu_cmd [0]),
    .d(\u_cpu/alu_cmd [1]),
    .o(_al_u301_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u302 (
    .a(_al_u301_o),
    .b(\u_cpu/u_alu/n4 [2]),
    .c(\u_cpu/alu_cmd [0]),
    .o(\u_cpu/u_alu/n7 [2]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    .INIT(16'h0305))
    _al_u303 (
    .a(\u_cpu/alu_out0 [1]),
    .b(\u_cpu/u_alu/n5 [1]),
    .c(\u_cpu/alu_cmd [0]),
    .d(\u_cpu/alu_cmd [1]),
    .o(_al_u303_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u304 (
    .a(_al_u303_o),
    .b(\u_cpu/u_alu/n4 [1]),
    .c(\u_cpu/alu_cmd [0]),
    .o(\u_cpu/u_alu/n7 [1]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    .INIT(16'h0305))
    _al_u305 (
    .a(\u_cpu/alu_out0 [0]),
    .b(\u_cpu/u_alu/n5 [0]),
    .c(\u_cpu/alu_cmd [0]),
    .d(\u_cpu/alu_cmd [1]),
    .o(_al_u305_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u306 (
    .a(_al_u305_o),
    .b(\u_cpu/u_alu/n4 [0]),
    .c(\u_cpu/alu_cmd [0]),
    .o(\u_cpu/u_alu/n7 [0]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .INIT(16'h1015))
    _al_u307 (
    .a(\u_cpu/pc_wen ),
    .b(\u_cpu/u_fetch/n1 [0]),
    .c(\u_cpu/u_fetch/fetch_en ),
    .d(\u_cpu/u_fetch/pc [0]),
    .o(_al_u307_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u308 (
    .a(_al_u307_o),
    .b(\u_cpu/pc_wen ),
    .c(\u_cpu/pc_wdata [0]),
    .o(\u_cpu/u_fetch/n3 [0]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .INIT(16'h1015))
    _al_u309 (
    .a(\u_cpu/pc_wen ),
    .b(\u_cpu/u_fetch/n1 [1]),
    .c(\u_cpu/u_fetch/fetch_en ),
    .d(\u_cpu/u_fetch/pc [1]),
    .o(_al_u309_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u310 (
    .a(_al_u309_o),
    .b(\u_cpu/pc_wen ),
    .c(\u_cpu/pc_wdata [1]),
    .o(\u_cpu/u_fetch/n3 [1]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .INIT(16'h1015))
    _al_u311 (
    .a(\u_cpu/pc_wen ),
    .b(\u_cpu/u_fetch/n1 [10]),
    .c(\u_cpu/u_fetch/fetch_en ),
    .d(\u_cpu/u_fetch/pc [10]),
    .o(_al_u311_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u312 (
    .a(_al_u311_o),
    .b(\u_cpu/pc_wen ),
    .c(\u_cpu/pc_wdata [10]),
    .o(\u_cpu/u_fetch/n3 [10]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .INIT(16'h1015))
    _al_u313 (
    .a(\u_cpu/pc_wen ),
    .b(\u_cpu/u_fetch/n1 [11]),
    .c(\u_cpu/u_fetch/fetch_en ),
    .d(\u_cpu/u_fetch/pc [11]),
    .o(_al_u313_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u314 (
    .a(_al_u313_o),
    .b(\u_cpu/pc_wen ),
    .c(\u_cpu/pc_wdata [11]),
    .o(\u_cpu/u_fetch/n3 [11]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .INIT(16'h1015))
    _al_u315 (
    .a(\u_cpu/pc_wen ),
    .b(\u_cpu/u_fetch/n1 [2]),
    .c(\u_cpu/u_fetch/fetch_en ),
    .d(\u_cpu/u_fetch/pc [2]),
    .o(_al_u315_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u316 (
    .a(_al_u315_o),
    .b(\u_cpu/pc_wen ),
    .c(\u_cpu/pc_wdata [2]),
    .o(\u_cpu/u_fetch/n3 [2]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .INIT(16'h1015))
    _al_u317 (
    .a(\u_cpu/pc_wen ),
    .b(\u_cpu/u_fetch/n1 [3]),
    .c(\u_cpu/u_fetch/fetch_en ),
    .d(\u_cpu/u_fetch/pc [3]),
    .o(_al_u317_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u318 (
    .a(_al_u317_o),
    .b(\u_cpu/pc_wen ),
    .c(\u_cpu/pc_wdata [3]),
    .o(\u_cpu/u_fetch/n3 [3]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .INIT(16'h1015))
    _al_u319 (
    .a(\u_cpu/pc_wen ),
    .b(\u_cpu/u_fetch/n1 [4]),
    .c(\u_cpu/u_fetch/fetch_en ),
    .d(\u_cpu/u_fetch/pc [4]),
    .o(_al_u319_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u320 (
    .a(_al_u319_o),
    .b(\u_cpu/pc_wen ),
    .c(\u_cpu/pc_wdata [4]),
    .o(\u_cpu/u_fetch/n3 [4]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .INIT(16'h1015))
    _al_u321 (
    .a(\u_cpu/pc_wen ),
    .b(\u_cpu/u_fetch/n1 [5]),
    .c(\u_cpu/u_fetch/fetch_en ),
    .d(\u_cpu/u_fetch/pc [5]),
    .o(_al_u321_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u322 (
    .a(_al_u321_o),
    .b(\u_cpu/pc_wen ),
    .c(\u_cpu/pc_wdata [5]),
    .o(\u_cpu/u_fetch/n3 [5]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .INIT(16'h1015))
    _al_u323 (
    .a(\u_cpu/pc_wen ),
    .b(\u_cpu/u_fetch/n1 [6]),
    .c(\u_cpu/u_fetch/fetch_en ),
    .d(\u_cpu/u_fetch/pc [6]),
    .o(_al_u323_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u324 (
    .a(_al_u323_o),
    .b(\u_cpu/pc_wen ),
    .c(\u_cpu/pc_wdata [6]),
    .o(\u_cpu/u_fetch/n3 [6]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .INIT(16'h1015))
    _al_u325 (
    .a(\u_cpu/pc_wen ),
    .b(\u_cpu/u_fetch/n1 [7]),
    .c(\u_cpu/u_fetch/fetch_en ),
    .d(\u_cpu/u_fetch/pc [7]),
    .o(_al_u325_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u326 (
    .a(_al_u325_o),
    .b(\u_cpu/pc_wen ),
    .c(\u_cpu/pc_wdata [7]),
    .o(\u_cpu/u_fetch/n3 [7]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .INIT(16'h1015))
    _al_u327 (
    .a(\u_cpu/pc_wen ),
    .b(\u_cpu/u_fetch/n1 [8]),
    .c(\u_cpu/u_fetch/fetch_en ),
    .d(\u_cpu/u_fetch/pc [8]),
    .o(_al_u327_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u328 (
    .a(_al_u327_o),
    .b(\u_cpu/pc_wen ),
    .c(\u_cpu/pc_wdata [8]),
    .o(\u_cpu/u_fetch/n3 [8]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .INIT(16'h1015))
    _al_u329 (
    .a(\u_cpu/pc_wen ),
    .b(\u_cpu/u_fetch/n1 [9]),
    .c(\u_cpu/u_fetch/fetch_en ),
    .d(\u_cpu/u_fetch/pc [9]),
    .o(_al_u329_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u330 (
    .a(_al_u329_o),
    .b(\u_cpu/pc_wen ),
    .c(\u_cpu/pc_wdata [9]),
    .o(\u_cpu/u_fetch/n3 [9]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .INIT(16'h0415))
    _al_u331 (
    .a(\u_cpu/dbg_rom_ren ),
    .b(\u_cpu/u_fetch/fetch_en ),
    .c(\u_cpu/u_fetch/pc [0]),
    .d(rom_raddr[0]),
    .o(_al_u331_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u332 (
    .a(_al_u331_o),
    .b(\u_cpu/dbg_rom_raddr [0]),
    .c(\u_cpu/dbg_rom_ren ),
    .o(\u_cpu/u_fetch/n7 [0]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .INIT(16'h0415))
    _al_u333 (
    .a(\u_cpu/dbg_rom_ren ),
    .b(\u_cpu/u_fetch/fetch_en ),
    .c(\u_cpu/u_fetch/pc [1]),
    .d(rom_raddr[1]),
    .o(_al_u333_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u334 (
    .a(_al_u333_o),
    .b(\u_cpu/dbg_rom_raddr [1]),
    .c(\u_cpu/dbg_rom_ren ),
    .o(\u_cpu/u_fetch/n7 [1]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .INIT(16'h0415))
    _al_u335 (
    .a(\u_cpu/dbg_rom_ren ),
    .b(\u_cpu/u_fetch/fetch_en ),
    .c(\u_cpu/u_fetch/pc [10]),
    .d(rom_raddr[10]),
    .o(_al_u335_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u336 (
    .a(_al_u335_o),
    .b(\u_cpu/dbg_rom_raddr [10]),
    .c(\u_cpu/dbg_rom_ren ),
    .o(\u_cpu/u_fetch/n7 [10]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .INIT(16'h0415))
    _al_u337 (
    .a(\u_cpu/dbg_rom_ren ),
    .b(\u_cpu/u_fetch/fetch_en ),
    .c(\u_cpu/u_fetch/pc [11]),
    .d(rom_raddr[11]),
    .o(_al_u337_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u338 (
    .a(_al_u337_o),
    .b(\u_cpu/dbg_rom_raddr [11]),
    .c(\u_cpu/dbg_rom_ren ),
    .o(\u_cpu/u_fetch/n7 [11]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .INIT(16'h0415))
    _al_u339 (
    .a(\u_cpu/dbg_rom_ren ),
    .b(\u_cpu/u_fetch/fetch_en ),
    .c(\u_cpu/u_fetch/pc [2]),
    .d(rom_raddr[2]),
    .o(_al_u339_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u340 (
    .a(_al_u339_o),
    .b(\u_cpu/dbg_rom_raddr [2]),
    .c(\u_cpu/dbg_rom_ren ),
    .o(\u_cpu/u_fetch/n7 [2]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .INIT(16'h0415))
    _al_u341 (
    .a(\u_cpu/dbg_rom_ren ),
    .b(\u_cpu/u_fetch/fetch_en ),
    .c(\u_cpu/u_fetch/pc [3]),
    .d(rom_raddr[3]),
    .o(_al_u341_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u342 (
    .a(_al_u341_o),
    .b(\u_cpu/dbg_rom_raddr [3]),
    .c(\u_cpu/dbg_rom_ren ),
    .o(\u_cpu/u_fetch/n7 [3]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .INIT(16'h0415))
    _al_u343 (
    .a(\u_cpu/dbg_rom_ren ),
    .b(\u_cpu/u_fetch/fetch_en ),
    .c(\u_cpu/u_fetch/pc [4]),
    .d(rom_raddr[4]),
    .o(_al_u343_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u344 (
    .a(_al_u343_o),
    .b(\u_cpu/dbg_rom_raddr [4]),
    .c(\u_cpu/dbg_rom_ren ),
    .o(\u_cpu/u_fetch/n7 [4]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .INIT(16'h0415))
    _al_u345 (
    .a(\u_cpu/dbg_rom_ren ),
    .b(\u_cpu/u_fetch/fetch_en ),
    .c(\u_cpu/u_fetch/pc [5]),
    .d(rom_raddr[5]),
    .o(_al_u345_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u346 (
    .a(_al_u345_o),
    .b(\u_cpu/dbg_rom_raddr [5]),
    .c(\u_cpu/dbg_rom_ren ),
    .o(\u_cpu/u_fetch/n7 [5]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .INIT(16'h0415))
    _al_u347 (
    .a(\u_cpu/dbg_rom_ren ),
    .b(\u_cpu/u_fetch/fetch_en ),
    .c(\u_cpu/u_fetch/pc [6]),
    .d(rom_raddr[6]),
    .o(_al_u347_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u348 (
    .a(_al_u347_o),
    .b(\u_cpu/dbg_rom_raddr [6]),
    .c(\u_cpu/dbg_rom_ren ),
    .o(\u_cpu/u_fetch/n7 [6]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .INIT(16'h0415))
    _al_u349 (
    .a(\u_cpu/dbg_rom_ren ),
    .b(\u_cpu/u_fetch/fetch_en ),
    .c(\u_cpu/u_fetch/pc [7]),
    .d(rom_raddr[7]),
    .o(_al_u349_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u350 (
    .a(_al_u349_o),
    .b(\u_cpu/dbg_rom_raddr [7]),
    .c(\u_cpu/dbg_rom_ren ),
    .o(\u_cpu/u_fetch/n7 [7]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .INIT(16'h0415))
    _al_u351 (
    .a(\u_cpu/dbg_rom_ren ),
    .b(\u_cpu/u_fetch/fetch_en ),
    .c(\u_cpu/u_fetch/pc [8]),
    .d(rom_raddr[8]),
    .o(_al_u351_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u352 (
    .a(_al_u351_o),
    .b(\u_cpu/dbg_rom_raddr [8]),
    .c(\u_cpu/dbg_rom_ren ),
    .o(\u_cpu/u_fetch/n7 [8]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .INIT(16'h0415))
    _al_u353 (
    .a(\u_cpu/dbg_rom_ren ),
    .b(\u_cpu/u_fetch/fetch_en ),
    .c(\u_cpu/u_fetch/pc [9]),
    .d(rom_raddr[9]),
    .o(_al_u353_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u354 (
    .a(_al_u353_o),
    .b(\u_cpu/dbg_rom_raddr [9]),
    .c(\u_cpu/dbg_rom_ren ),
    .o(\u_cpu/u_fetch/n7 [9]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    .INIT(16'h010d))
    _al_u355 (
    .a(send_data[0]),
    .b(\u_cpu/u_debug/rom_bk_en ),
    .c(\u_cpu/dbg_info_en ),
    .d(\u_cpu/dbg_rom_rdata [0]),
    .o(_al_u355_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u356 (
    .a(_al_u355_o),
    .b(\u_cpu/dbg_info_en ),
    .c(\u_cpu/dbg_info [0]),
    .o(\u_cpu/u_debug/n21 [0]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    .INIT(16'h010d))
    _al_u357 (
    .a(send_data[1]),
    .b(\u_cpu/u_debug/rom_bk_en ),
    .c(\u_cpu/dbg_info_en ),
    .d(\u_cpu/dbg_rom_rdata [1]),
    .o(_al_u357_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u358 (
    .a(_al_u357_o),
    .b(\u_cpu/dbg_info_en ),
    .c(\u_cpu/dbg_info [1]),
    .o(\u_cpu/u_debug/n21 [1]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    .INIT(16'h010d))
    _al_u359 (
    .a(send_data[2]),
    .b(\u_cpu/u_debug/rom_bk_en ),
    .c(\u_cpu/dbg_info_en ),
    .d(\u_cpu/dbg_rom_rdata [2]),
    .o(_al_u359_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u360 (
    .a(_al_u359_o),
    .b(\u_cpu/dbg_info_en ),
    .c(\u_cpu/dbg_info [2]),
    .o(\u_cpu/u_debug/n21 [2]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    .INIT(16'h010d))
    _al_u361 (
    .a(send_data[3]),
    .b(\u_cpu/u_debug/rom_bk_en ),
    .c(\u_cpu/dbg_info_en ),
    .d(\u_cpu/dbg_rom_rdata [3]),
    .o(_al_u361_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u362 (
    .a(_al_u361_o),
    .b(\u_cpu/dbg_info_en ),
    .c(\u_cpu/dbg_info [3]),
    .o(\u_cpu/u_debug/n21 [3]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    .INIT(16'h010d))
    _al_u363 (
    .a(send_data[4]),
    .b(\u_cpu/u_debug/rom_bk_en ),
    .c(\u_cpu/dbg_info_en ),
    .d(\u_cpu/dbg_rom_rdata [4]),
    .o(_al_u363_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u364 (
    .a(_al_u363_o),
    .b(\u_cpu/dbg_info_en ),
    .c(\u_cpu/dbg_info [4]),
    .o(\u_cpu/u_debug/n21 [4]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    .INIT(16'h010d))
    _al_u365 (
    .a(send_data[5]),
    .b(\u_cpu/u_debug/rom_bk_en ),
    .c(\u_cpu/dbg_info_en ),
    .d(\u_cpu/dbg_rom_rdata [5]),
    .o(_al_u365_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u366 (
    .a(_al_u365_o),
    .b(\u_cpu/dbg_info_en ),
    .c(\u_cpu/dbg_info [5]),
    .o(\u_cpu/u_debug/n21 [5]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    .INIT(16'h010d))
    _al_u367 (
    .a(send_data[6]),
    .b(\u_cpu/u_debug/rom_bk_en ),
    .c(\u_cpu/dbg_info_en ),
    .d(\u_cpu/dbg_rom_rdata [6]),
    .o(_al_u367_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u368 (
    .a(_al_u367_o),
    .b(\u_cpu/dbg_info_en ),
    .c(\u_cpu/dbg_info [6]),
    .o(\u_cpu/u_debug/n21 [6]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    .INIT(16'h010d))
    _al_u369 (
    .a(send_data[7]),
    .b(\u_cpu/u_debug/rom_bk_en ),
    .c(\u_cpu/dbg_info_en ),
    .d(\u_cpu/dbg_rom_rdata [7]),
    .o(_al_u369_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u370 (
    .a(_al_u369_o),
    .b(\u_cpu/dbg_info_en ),
    .c(\u_cpu/dbg_info [7]),
    .o(\u_cpu/u_debug/n21 [7]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    .INIT(16'h0151))
    _al_u371 (
    .a(\u_cpu/dbg_inst_en ),
    .b(\u_cpu/inst [1]),
    .c(\u_cpu/u_fetch/rom_bk_en ),
    .d(rom_rdata[1]),
    .o(_al_u371_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u372 (
    .a(_al_u371_o),
    .b(\u_cpu/dbg_inst_en ),
    .c(\u_cpu/dbg_inst [1]),
    .o(\u_cpu/u_fetch/n10 [1]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    .INIT(16'h0151))
    _al_u373 (
    .a(\u_cpu/dbg_inst_en ),
    .b(\u_cpu/inst [0]),
    .c(\u_cpu/u_fetch/rom_bk_en ),
    .d(rom_rdata[0]),
    .o(_al_u373_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u374 (
    .a(_al_u373_o),
    .b(\u_cpu/dbg_inst_en ),
    .c(\u_cpu/dbg_inst [0]),
    .o(\u_cpu/u_fetch/n10 [0]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    .INIT(16'h0151))
    _al_u375 (
    .a(\u_cpu/dbg_inst_en ),
    .b(\u_cpu/inst [3]),
    .c(\u_cpu/u_fetch/rom_bk_en ),
    .d(rom_rdata[3]),
    .o(_al_u375_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u376 (
    .a(_al_u375_o),
    .b(\u_cpu/dbg_inst_en ),
    .c(\u_cpu/dbg_inst [3]),
    .o(\u_cpu/u_fetch/n10 [3]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    .INIT(16'h0151))
    _al_u377 (
    .a(\u_cpu/dbg_inst_en ),
    .b(\u_cpu/inst [2]),
    .c(\u_cpu/u_fetch/rom_bk_en ),
    .d(rom_rdata[2]),
    .o(_al_u377_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u378 (
    .a(_al_u377_o),
    .b(\u_cpu/dbg_inst_en ),
    .c(\u_cpu/dbg_inst [2]),
    .o(\u_cpu/u_fetch/n10 [2]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    .INIT(16'h0151))
    _al_u379 (
    .a(\u_cpu/dbg_inst_en ),
    .b(\u_cpu/inst [5]),
    .c(\u_cpu/u_fetch/rom_bk_en ),
    .d(rom_rdata[5]),
    .o(_al_u379_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u380 (
    .a(_al_u379_o),
    .b(\u_cpu/dbg_inst_en ),
    .c(\u_cpu/dbg_inst [5]),
    .o(\u_cpu/u_fetch/n10 [5]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    .INIT(16'h0151))
    _al_u381 (
    .a(\u_cpu/dbg_inst_en ),
    .b(\u_cpu/inst [4]),
    .c(\u_cpu/u_fetch/rom_bk_en ),
    .d(rom_rdata[4]),
    .o(_al_u381_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u382 (
    .a(_al_u381_o),
    .b(\u_cpu/dbg_inst_en ),
    .c(\u_cpu/dbg_inst [4]),
    .o(\u_cpu/u_fetch/n10 [4]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    .INIT(16'h0151))
    _al_u383 (
    .a(\u_cpu/dbg_inst_en ),
    .b(\u_cpu/inst [7]),
    .c(\u_cpu/u_fetch/rom_bk_en ),
    .d(rom_rdata[7]),
    .o(_al_u383_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u384 (
    .a(_al_u383_o),
    .b(\u_cpu/dbg_inst_en ),
    .c(\u_cpu/dbg_inst [7]),
    .o(\u_cpu/u_fetch/n10 [7]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    .INIT(16'h0151))
    _al_u385 (
    .a(\u_cpu/dbg_inst_en ),
    .b(\u_cpu/inst [6]),
    .c(\u_cpu/u_fetch/rom_bk_en ),
    .d(rom_rdata[6]),
    .o(_al_u385_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    _al_u386 (
    .a(_al_u385_o),
    .b(\u_cpu/dbg_inst_en ),
    .c(\u_cpu/dbg_inst [6]),
    .o(\u_cpu/u_fetch/n10 [6]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u387 (
    .a(\u_uart/u_uart_tx/start ),
    .b(\u_uart/tx_en ),
    .o(\u_uart/u_uart_tx/n8 ));
  AL_MAP_LUT2 #(
    .EQN("(B@A)"),
    .INIT(4'h6))
    _al_u388 (
    .a(\u_uart/u_ubus/tx_ready_cnt [0]),
    .b(\u_uart/u_ubus/tx_ready_cnt [1]),
    .o(\u_uart/u_ubus/n39 [1]));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u389 (
    .a(\u_uart/u_ubus/tx_ready_cnt [0]),
    .b(\u_uart/u_ubus/tx_ready_cnt [1]),
    .c(\u_uart/u_ubus/tx_ready_cnt [2]),
    .o(\u_uart/u_ubus/n41 ));
  AL_MAP_LUT3 #(
    .EQN("~(~B*~(C*A))"),
    .INIT(8'hec))
    _al_u390 (
    .a(\u_uart/u_ubus/send_finish ),
    .b(send_ready),
    .c(\u_uart/u_ubus/tx_ready_flag ),
    .o(send_ready_d));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u391 (
    .a(\u_vga/n13 ),
    .b(\u_vga/n16 ),
    .o(\u_vga/mux4_b0_sel_is_3_o ));
  AL_MAP_LUT2 #(
    .EQN("(~B*~A)"),
    .INIT(4'h1))
    _al_u392 (
    .a(\u_cpu/read_abcd [0]),
    .b(\u_cpu/read_abcd [1]),
    .o(_al_u392_o));
  AL_MAP_LUT4 #(
    .EQN("~(~D*~C*~B*A)"),
    .INIT(16'hfffd))
    _al_u393 (
    .a(_al_u392_o),
    .b(\u_cpu/read_abcd [2]),
    .c(\u_cpu/read_abcd [3]),
    .d(\u_cpu/u_execute/dbg_info_en0 ),
    .o(\u_cpu/u_execute/n34 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u394 (
    .a(bus_raddr[4]),
    .b(bus_raddr[5]),
    .c(bus_raddr[6]),
    .d(bus_raddr[7]),
    .o(_al_u394_o));
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    _al_u395 (
    .a(_al_u394_o),
    .b(bus_raddr[1]),
    .o(_al_u395_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*~A)"),
    .INIT(8'h01))
    _al_u396 (
    .a(bus_raddr[0]),
    .b(bus_raddr[2]),
    .c(bus_raddr[3]),
    .o(_al_u396_o));
  AL_MAP_LUT2 #(
    .EQN("~(B*A)"),
    .INIT(4'h7))
    _al_u397 (
    .a(_al_u395_o),
    .b(_al_u396_o),
    .o(\u_bus/eq0/or_or_or_xor_i0[0]_i_o ));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u398 (
    .a(\u_cpu/u_timer/cnt [12]),
    .b(\u_cpu/u_timer/cnt [13]),
    .c(\u_cpu/u_timer/cnt [14]),
    .d(\u_cpu/u_timer/cnt [15]),
    .o(_al_u398_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u399 (
    .a(\u_cpu/u_timer/cnt [0]),
    .b(\u_cpu/u_timer/cnt [1]),
    .c(\u_cpu/u_timer/cnt [10]),
    .d(\u_cpu/u_timer/cnt [11]),
    .o(_al_u399_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u400 (
    .a(_al_u398_o),
    .b(_al_u399_o),
    .o(_al_u400_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u401 (
    .a(\u_cpu/u_timer/cnt [2]),
    .b(\u_cpu/u_timer/cnt [20]),
    .c(\u_cpu/u_timer/cnt [21]),
    .d(\u_cpu/u_timer/cnt [22]),
    .o(_al_u401_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u402 (
    .a(\u_cpu/u_timer/cnt [16]),
    .b(\u_cpu/u_timer/cnt [17]),
    .c(\u_cpu/u_timer/cnt [18]),
    .d(\u_cpu/u_timer/cnt [19]),
    .o(_al_u402_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u403 (
    .a(\u_cpu/u_timer/cnt [6]),
    .b(\u_cpu/u_timer/cnt [7]),
    .c(\u_cpu/u_timer/cnt [8]),
    .d(\u_cpu/u_timer/cnt [9]),
    .o(_al_u403_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u404 (
    .a(\u_cpu/u_timer/cnt [23]),
    .b(\u_cpu/u_timer/cnt [3]),
    .c(\u_cpu/u_timer/cnt [4]),
    .d(\u_cpu/u_timer/cnt [5]),
    .o(_al_u404_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u405 (
    .a(_al_u401_o),
    .b(_al_u402_o),
    .c(_al_u403_o),
    .d(_al_u404_o),
    .o(_al_u405_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u406 (
    .a(_al_u400_o),
    .b(_al_u405_o),
    .o(\u_cpu/u_timer/n4 ));
  AL_MAP_LUT4 #(
    .EQN("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .INIT(16'hf404))
    _al_u407 (
    .a(\u_cpu/u_timer/n4 ),
    .b(\u_cpu/u_timer/n1 [9]),
    .c(\u_cpu/timer_wen ),
    .d(\u_cpu/timer_wdata [9]),
    .o(\u_cpu/u_timer/n3 [9]));
  AL_MAP_LUT4 #(
    .EQN("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .INIT(16'hf404))
    _al_u408 (
    .a(\u_cpu/u_timer/n4 ),
    .b(\u_cpu/u_timer/n1 [8]),
    .c(\u_cpu/timer_wen ),
    .d(\u_cpu/timer_wdata [8]),
    .o(\u_cpu/u_timer/n3 [8]));
  AL_MAP_LUT4 #(
    .EQN("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .INIT(16'hf404))
    _al_u409 (
    .a(\u_cpu/u_timer/n4 ),
    .b(\u_cpu/u_timer/n1 [7]),
    .c(\u_cpu/timer_wen ),
    .d(\u_cpu/timer_wdata [7]),
    .o(\u_cpu/u_timer/n3 [7]));
  AL_MAP_LUT4 #(
    .EQN("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .INIT(16'hf404))
    _al_u410 (
    .a(\u_cpu/u_timer/n4 ),
    .b(\u_cpu/u_timer/n1 [6]),
    .c(\u_cpu/timer_wen ),
    .d(\u_cpu/timer_wdata [6]),
    .o(\u_cpu/u_timer/n3 [6]));
  AL_MAP_LUT4 #(
    .EQN("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .INIT(16'hf404))
    _al_u411 (
    .a(\u_cpu/u_timer/n4 ),
    .b(\u_cpu/u_timer/n1 [5]),
    .c(\u_cpu/timer_wen ),
    .d(\u_cpu/timer_wdata [5]),
    .o(\u_cpu/u_timer/n3 [5]));
  AL_MAP_LUT4 #(
    .EQN("((D*~A)*~(B)*~(C)+(D*~A)*B*~(C)+~((D*~A))*B*C+(D*~A)*B*C)"),
    .INIT(16'hc5c0))
    _al_u412 (
    .a(\u_cpu/u_timer/n4 ),
    .b(\u_cpu/timer_wdata [4]),
    .c(\u_cpu/timer_wen ),
    .d(\u_cpu/u_timer/n1 [4]),
    .o(\u_cpu/u_timer/n3 [4]));
  AL_MAP_LUT4 #(
    .EQN("((D*~A)*~(B)*~(C)+(D*~A)*B*~(C)+~((D*~A))*B*C+(D*~A)*B*C)"),
    .INIT(16'hc5c0))
    _al_u413 (
    .a(\u_cpu/u_timer/n4 ),
    .b(\u_cpu/timer_wdata [3]),
    .c(\u_cpu/timer_wen ),
    .d(\u_cpu/u_timer/n1 [3]),
    .o(\u_cpu/u_timer/n3 [3]));
  AL_MAP_LUT4 #(
    .EQN("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .INIT(16'hf404))
    _al_u414 (
    .a(\u_cpu/u_timer/n4 ),
    .b(\u_cpu/u_timer/n1 [23]),
    .c(\u_cpu/timer_wen ),
    .d(\u_cpu/timer_wdata [23]),
    .o(\u_cpu/u_timer/n3 [23]));
  AL_MAP_LUT4 #(
    .EQN("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .INIT(16'hf404))
    _al_u415 (
    .a(\u_cpu/u_timer/n4 ),
    .b(\u_cpu/u_timer/n1 [22]),
    .c(\u_cpu/timer_wen ),
    .d(\u_cpu/timer_wdata [22]),
    .o(\u_cpu/u_timer/n3 [22]));
  AL_MAP_LUT4 #(
    .EQN("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .INIT(16'hf404))
    _al_u416 (
    .a(\u_cpu/u_timer/n4 ),
    .b(\u_cpu/u_timer/n1 [21]),
    .c(\u_cpu/timer_wen ),
    .d(\u_cpu/timer_wdata [21]),
    .o(\u_cpu/u_timer/n3 [21]));
  AL_MAP_LUT4 #(
    .EQN("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .INIT(16'hf404))
    _al_u417 (
    .a(\u_cpu/u_timer/n4 ),
    .b(\u_cpu/u_timer/n1 [20]),
    .c(\u_cpu/timer_wen ),
    .d(\u_cpu/timer_wdata [20]),
    .o(\u_cpu/u_timer/n3 [20]));
  AL_MAP_LUT4 #(
    .EQN("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .INIT(16'hf404))
    _al_u418 (
    .a(\u_cpu/u_timer/n4 ),
    .b(\u_cpu/u_timer/n1 [2]),
    .c(\u_cpu/timer_wen ),
    .d(\u_cpu/timer_wdata [2]),
    .o(\u_cpu/u_timer/n3 [2]));
  AL_MAP_LUT4 #(
    .EQN("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .INIT(16'hf404))
    _al_u419 (
    .a(\u_cpu/u_timer/n4 ),
    .b(\u_cpu/u_timer/n1 [19]),
    .c(\u_cpu/timer_wen ),
    .d(\u_cpu/timer_wdata [19]),
    .o(\u_cpu/u_timer/n3 [19]));
  AL_MAP_LUT4 #(
    .EQN("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .INIT(16'hf404))
    _al_u420 (
    .a(\u_cpu/u_timer/n4 ),
    .b(\u_cpu/u_timer/n1 [18]),
    .c(\u_cpu/timer_wen ),
    .d(\u_cpu/timer_wdata [18]),
    .o(\u_cpu/u_timer/n3 [18]));
  AL_MAP_LUT4 #(
    .EQN("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .INIT(16'hf404))
    _al_u421 (
    .a(\u_cpu/u_timer/n4 ),
    .b(\u_cpu/u_timer/n1 [17]),
    .c(\u_cpu/timer_wen ),
    .d(\u_cpu/timer_wdata [17]),
    .o(\u_cpu/u_timer/n3 [17]));
  AL_MAP_LUT4 #(
    .EQN("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .INIT(16'hf404))
    _al_u422 (
    .a(\u_cpu/u_timer/n4 ),
    .b(\u_cpu/u_timer/n1 [16]),
    .c(\u_cpu/timer_wen ),
    .d(\u_cpu/timer_wdata [16]),
    .o(\u_cpu/u_timer/n3 [16]));
  AL_MAP_LUT4 #(
    .EQN("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .INIT(16'hf404))
    _al_u423 (
    .a(\u_cpu/u_timer/n4 ),
    .b(\u_cpu/u_timer/n1 [15]),
    .c(\u_cpu/timer_wen ),
    .d(\u_cpu/timer_wdata [15]),
    .o(\u_cpu/u_timer/n3 [15]));
  AL_MAP_LUT4 #(
    .EQN("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .INIT(16'hf404))
    _al_u424 (
    .a(\u_cpu/u_timer/n4 ),
    .b(\u_cpu/u_timer/n1 [14]),
    .c(\u_cpu/timer_wen ),
    .d(\u_cpu/timer_wdata [14]),
    .o(\u_cpu/u_timer/n3 [14]));
  AL_MAP_LUT4 #(
    .EQN("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .INIT(16'hf404))
    _al_u425 (
    .a(\u_cpu/u_timer/n4 ),
    .b(\u_cpu/u_timer/n1 [13]),
    .c(\u_cpu/timer_wen ),
    .d(\u_cpu/timer_wdata [13]),
    .o(\u_cpu/u_timer/n3 [13]));
  AL_MAP_LUT4 #(
    .EQN("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .INIT(16'hf404))
    _al_u426 (
    .a(\u_cpu/u_timer/n4 ),
    .b(\u_cpu/u_timer/n1 [12]),
    .c(\u_cpu/timer_wen ),
    .d(\u_cpu/timer_wdata [12]),
    .o(\u_cpu/u_timer/n3 [12]));
  AL_MAP_LUT4 #(
    .EQN("((D*~A)*~(B)*~(C)+(D*~A)*B*~(C)+~((D*~A))*B*C+(D*~A)*B*C)"),
    .INIT(16'hc5c0))
    _al_u427 (
    .a(\u_cpu/u_timer/n4 ),
    .b(\u_cpu/timer_wdata [11]),
    .c(\u_cpu/timer_wen ),
    .d(\u_cpu/u_timer/n1 [11]),
    .o(\u_cpu/u_timer/n3 [11]));
  AL_MAP_LUT4 #(
    .EQN("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .INIT(16'hf404))
    _al_u428 (
    .a(\u_cpu/u_timer/n4 ),
    .b(\u_cpu/u_timer/n1 [10]),
    .c(\u_cpu/timer_wen ),
    .d(\u_cpu/timer_wdata [10]),
    .o(\u_cpu/u_timer/n3 [10]));
  AL_MAP_LUT4 #(
    .EQN("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .INIT(16'hf404))
    _al_u429 (
    .a(\u_cpu/u_timer/n4 ),
    .b(\u_cpu/u_timer/n1 [1]),
    .c(\u_cpu/timer_wen ),
    .d(\u_cpu/timer_wdata [1]),
    .o(\u_cpu/u_timer/n3 [1]));
  AL_MAP_LUT4 #(
    .EQN("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .INIT(16'hf404))
    _al_u430 (
    .a(\u_cpu/u_timer/n4 ),
    .b(\u_cpu/u_timer/n1 [0]),
    .c(\u_cpu/timer_wen ),
    .d(\u_cpu/timer_wdata [0]),
    .o(\u_cpu/u_timer/n3 [0]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u431 (
    .a(\u_uart/u_uart_rx/rx_d [0]),
    .b(\u_uart/u_uart_rx/rx_d [1]),
    .o(\u_uart/u_uart_rx/n0 ));
  AL_MAP_LUT3 #(
    .EQN("(C@(B*A))"),
    .INIT(8'h78))
    _al_u432 (
    .a(\u_uart/u_ubus/tx_ready_cnt [0]),
    .b(\u_uart/u_ubus/tx_ready_cnt [1]),
    .c(\u_uart/u_ubus/tx_ready_cnt [2]),
    .o(\u_uart/u_ubus/n39 [2]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~B*~(~D*~A))"),
    .INIT(16'h0302))
    _al_u433 (
    .a(\u_cpu/alu_out3 [1]),
    .b(\u_cpu/alu_cmd [6]),
    .c(\u_cpu/alu_cmd [7]),
    .d(\u_cpu/alu_cmd [8]),
    .o(_al_u433_o));
  AL_MAP_LUT4 #(
    .EQN("(A*~(D*~C*~B))"),
    .INIT(16'ha8aa))
    _al_u434 (
    .a(_al_u433_o),
    .b(bus_wdata[1]),
    .c(\u_cpu/alu_in2 [1]),
    .d(\u_cpu/alu_cmd [8]),
    .o(_al_u434_o));
  AL_MAP_LUT4 #(
    .EQN("~(~A*~(D*C*B))"),
    .INIT(16'heaaa))
    _al_u435 (
    .a(_al_u434_o),
    .b(bus_wdata[1]),
    .c(\u_cpu/alu_in2 [1]),
    .d(\u_cpu/alu_cmd [6]),
    .o(\u_cpu/u_alu/n57 [1]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~B*~(~D*~A))"),
    .INIT(16'h0302))
    _al_u436 (
    .a(\u_cpu/alu_out3 [2]),
    .b(\u_cpu/alu_cmd [6]),
    .c(\u_cpu/alu_cmd [7]),
    .d(\u_cpu/alu_cmd [8]),
    .o(_al_u436_o));
  AL_MAP_LUT4 #(
    .EQN("(A*~(D*~C*~B))"),
    .INIT(16'ha8aa))
    _al_u437 (
    .a(_al_u436_o),
    .b(bus_wdata[2]),
    .c(\u_cpu/alu_in2 [2]),
    .d(\u_cpu/alu_cmd [8]),
    .o(_al_u437_o));
  AL_MAP_LUT4 #(
    .EQN("~(~A*~(D*C*B))"),
    .INIT(16'heaaa))
    _al_u438 (
    .a(_al_u437_o),
    .b(bus_wdata[2]),
    .c(\u_cpu/alu_in2 [2]),
    .d(\u_cpu/alu_cmd [6]),
    .o(\u_cpu/u_alu/n57 [2]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~B*~(~D*~A))"),
    .INIT(16'h0302))
    _al_u439 (
    .a(\u_cpu/alu_out3 [3]),
    .b(\u_cpu/alu_cmd [6]),
    .c(\u_cpu/alu_cmd [7]),
    .d(\u_cpu/alu_cmd [8]),
    .o(_al_u439_o));
  AL_MAP_LUT4 #(
    .EQN("(A*~(D*~C*~B))"),
    .INIT(16'ha8aa))
    _al_u440 (
    .a(_al_u439_o),
    .b(bus_wdata[3]),
    .c(\u_cpu/alu_in2 [3]),
    .d(\u_cpu/alu_cmd [8]),
    .o(_al_u440_o));
  AL_MAP_LUT4 #(
    .EQN("~(~A*~(D*C*B))"),
    .INIT(16'heaaa))
    _al_u441 (
    .a(_al_u440_o),
    .b(bus_wdata[3]),
    .c(\u_cpu/alu_in2 [3]),
    .d(\u_cpu/alu_cmd [6]),
    .o(\u_cpu/u_alu/n57 [3]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~B*~(~D*~A))"),
    .INIT(16'h0302))
    _al_u442 (
    .a(\u_cpu/alu_out3 [4]),
    .b(\u_cpu/alu_cmd [6]),
    .c(\u_cpu/alu_cmd [7]),
    .d(\u_cpu/alu_cmd [8]),
    .o(_al_u442_o));
  AL_MAP_LUT4 #(
    .EQN("(A*~(D*~C*~B))"),
    .INIT(16'ha8aa))
    _al_u443 (
    .a(_al_u442_o),
    .b(bus_wdata[4]),
    .c(\u_cpu/alu_in2 [4]),
    .d(\u_cpu/alu_cmd [8]),
    .o(_al_u443_o));
  AL_MAP_LUT4 #(
    .EQN("~(~A*~(D*C*B))"),
    .INIT(16'heaaa))
    _al_u444 (
    .a(_al_u443_o),
    .b(bus_wdata[4]),
    .c(\u_cpu/alu_in2 [4]),
    .d(\u_cpu/alu_cmd [6]),
    .o(\u_cpu/u_alu/n57 [4]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~B*~(~D*~A))"),
    .INIT(16'h0302))
    _al_u445 (
    .a(\u_cpu/alu_out3 [5]),
    .b(\u_cpu/alu_cmd [6]),
    .c(\u_cpu/alu_cmd [7]),
    .d(\u_cpu/alu_cmd [8]),
    .o(_al_u445_o));
  AL_MAP_LUT4 #(
    .EQN("(A*~(D*~C*~B))"),
    .INIT(16'ha8aa))
    _al_u446 (
    .a(_al_u445_o),
    .b(bus_wdata[5]),
    .c(\u_cpu/alu_in2 [5]),
    .d(\u_cpu/alu_cmd [8]),
    .o(_al_u446_o));
  AL_MAP_LUT4 #(
    .EQN("~(~A*~(D*C*B))"),
    .INIT(16'heaaa))
    _al_u447 (
    .a(_al_u446_o),
    .b(bus_wdata[5]),
    .c(\u_cpu/alu_in2 [5]),
    .d(\u_cpu/alu_cmd [6]),
    .o(\u_cpu/u_alu/n57 [5]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~B*~(~D*~A))"),
    .INIT(16'h0302))
    _al_u448 (
    .a(\u_cpu/alu_out3 [6]),
    .b(\u_cpu/alu_cmd [6]),
    .c(\u_cpu/alu_cmd [7]),
    .d(\u_cpu/alu_cmd [8]),
    .o(_al_u448_o));
  AL_MAP_LUT4 #(
    .EQN("(A*~(D*~C*~B))"),
    .INIT(16'ha8aa))
    _al_u449 (
    .a(_al_u448_o),
    .b(bus_wdata[6]),
    .c(\u_cpu/alu_in2 [6]),
    .d(\u_cpu/alu_cmd [8]),
    .o(_al_u449_o));
  AL_MAP_LUT4 #(
    .EQN("~(~A*~(D*C*B))"),
    .INIT(16'heaaa))
    _al_u450 (
    .a(_al_u449_o),
    .b(bus_wdata[6]),
    .c(\u_cpu/alu_in2 [6]),
    .d(\u_cpu/alu_cmd [6]),
    .o(\u_cpu/u_alu/n57 [6]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~B*~(~D*~A))"),
    .INIT(16'h0302))
    _al_u451 (
    .a(\u_cpu/alu_out3 [7]),
    .b(\u_cpu/alu_cmd [6]),
    .c(\u_cpu/alu_cmd [7]),
    .d(\u_cpu/alu_cmd [8]),
    .o(_al_u451_o));
  AL_MAP_LUT4 #(
    .EQN("(A*~(D*~C*~B))"),
    .INIT(16'ha8aa))
    _al_u452 (
    .a(_al_u451_o),
    .b(bus_wdata[7]),
    .c(\u_cpu/alu_in2 [7]),
    .d(\u_cpu/alu_cmd [8]),
    .o(_al_u452_o));
  AL_MAP_LUT4 #(
    .EQN("~(~A*~(D*C*B))"),
    .INIT(16'heaaa))
    _al_u453 (
    .a(_al_u452_o),
    .b(bus_wdata[7]),
    .c(\u_cpu/alu_in2 [7]),
    .d(\u_cpu/alu_cmd [6]),
    .o(\u_cpu/u_alu/n57 [7]));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u454 (
    .a(\u_cpu/u_execute/wt_ram_cmd [4]),
    .b(\u_cpu/u_execute/wt_ram_cmd [5]),
    .c(\u_cpu/u_execute/wt_ram_cmd [8]),
    .d(\u_cpu/u_execute/wt_ram_cmd [9]),
    .o(_al_u454_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u455 (
    .a(\u_cpu/u_execute/wt_ram_cmd [0]),
    .b(\u_cpu/u_execute/wt_ram_cmd [1]),
    .c(\u_cpu/u_execute/wt_ram_cmd [2]),
    .d(\u_cpu/u_execute/wt_ram_cmd [3]),
    .o(_al_u455_o));
  AL_MAP_LUT4 #(
    .EQN("~(~D*~C*B*A)"),
    .INIT(16'hfff7))
    _al_u456 (
    .a(_al_u454_o),
    .b(_al_u455_o),
    .c(\u_cpu/u_execute/wt_ram_cmd [6]),
    .d(\u_cpu/u_execute/wt_ram_cmd [7]),
    .o(\u_cpu/u_execute/n40 ));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*~A)"),
    .INIT(8'h01))
    _al_u457 (
    .a(ram_waddr[5]),
    .b(ram_waddr[6]),
    .c(ram_waddr[7]),
    .o(_al_u457_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*B*A)"),
    .INIT(8'h08))
    _al_u458 (
    .a(_al_u457_o),
    .b(ram_wen),
    .c(ram_waddr[4]),
    .o(\u_ram/n4 ));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*A)"),
    .INIT(16'h0200))
    _al_u459 (
    .a(\u_uart/u_uart_rx/cnt [0]),
    .b(\u_uart/u_uart_rx/cnt [1]),
    .c(\u_uart/u_uart_rx/cnt [2]),
    .d(\u_uart/u_uart_rx/cnt [3]),
    .o(\u_uart/u_uart_rx/n1 ));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*~A)"),
    .INIT(16'h0400))
    _al_u460 (
    .a(\u_uart/u_uart_tx/cnt [0]),
    .b(\u_uart/u_uart_tx/cnt [1]),
    .c(\u_uart/u_uart_tx/cnt [2]),
    .d(\u_uart/u_uart_tx/cnt [3]),
    .o(\u_uart/u_uart_tx/n4 ));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u461 (
    .a(\u_uart/u_uart_tx/cnt [0]),
    .b(\u_uart/u_uart_tx/cnt [1]),
    .o(_al_u461_o));
  AL_MAP_LUT4 #(
    .EQN("(C*~(~D*~(~B*~A)))"),
    .INIT(16'hf010))
    _al_u462 (
    .a(_al_u461_o),
    .b(\u_uart/u_uart_tx/cnt [2]),
    .c(\u_uart/u_uart_tx/cnt [3]),
    .d(tx_pad),
    .o(_al_u462_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~(~B*A))"),
    .INIT(16'h000d))
    _al_u463 (
    .a(\u_uart/u_uart_tx/data [6]),
    .b(\u_uart/u_uart_tx/cnt [0]),
    .c(\u_uart/u_uart_tx/cnt [1]),
    .d(\u_uart/u_uart_tx/cnt [2]),
    .o(_al_u463_o));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B*~(D*C)))"),
    .INIT(16'ha222))
    _al_u464 (
    .a(_al_u462_o),
    .b(_al_u463_o),
    .c(\u_uart/u_uart_tx/data [7]),
    .d(\u_uart/u_uart_tx/cnt [0]),
    .o(_al_u464_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'h00ca))
    _al_u465 (
    .a(\u_uart/u_uart_tx/data [2]),
    .b(\u_uart/u_uart_tx/data [3]),
    .c(\u_uart/u_uart_tx/cnt [0]),
    .d(\u_uart/u_uart_tx/cnt [1]),
    .o(_al_u465_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~(C*~B*A))"),
    .INIT(16'hdf00))
    _al_u466 (
    .a(\u_uart/u_uart_tx/data [4]),
    .b(\u_uart/u_uart_tx/cnt [0]),
    .c(\u_uart/u_uart_tx/cnt [1]),
    .d(\u_uart/u_uart_tx/cnt [2]),
    .o(_al_u466_o));
  AL_MAP_LUT4 #(
    .EQN("(C*~B*~(D*A))"),
    .INIT(16'h1030))
    _al_u467 (
    .a(_al_u461_o),
    .b(_al_u465_o),
    .c(_al_u466_o),
    .d(\u_uart/u_uart_tx/data [5]),
    .o(_al_u467_o));
  AL_MAP_LUT3 #(
    .EQN("(~B*~(C*~A))"),
    .INIT(8'h23))
    _al_u468 (
    .a(\u_uart/u_uart_tx/data [0]),
    .b(\u_uart/u_uart_tx/cnt [0]),
    .c(\u_uart/u_uart_tx/cnt [1]),
    .o(_al_u468_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~B*~(C*A))"),
    .INIT(16'h0013))
    _al_u469 (
    .a(_al_u461_o),
    .b(_al_u468_o),
    .c(\u_uart/u_uart_tx/data [1]),
    .d(\u_uart/u_uart_tx/cnt [2]),
    .o(_al_u469_o));
  AL_MAP_LUT4 #(
    .EQN("~(~A*~(~D*~C*~B))"),
    .INIT(16'haaab))
    _al_u470 (
    .a(_al_u464_o),
    .b(_al_u467_o),
    .c(_al_u469_o),
    .d(\u_uart/u_uart_tx/cnt [3]),
    .o(\u_uart/u_uart_tx/n13 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u471 (
    .a(recv_cmd[4]),
    .b(recv_cmd[5]),
    .c(recv_cmd[6]),
    .d(recv_cmd[7]),
    .o(_al_u471_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    _al_u472 (
    .a(_al_u471_o),
    .b(recv_cmd[2]),
    .c(recv_cmd[3]),
    .o(_al_u472_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    _al_u473 (
    .a(_al_u472_o),
    .b(recv_cmd[0]),
    .c(recv_cmd[1]),
    .o(\u_cpu/u_debug/free_run_cmd ));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*~A)"),
    .INIT(8'h01))
    _al_u474 (
    .a(\u_uart/u_ubus/send_cnt [0]),
    .b(\u_uart/u_ubus/send_cnt [1]),
    .c(\u_uart/u_ubus/send_cnt [2]),
    .o(_al_u474_o));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C*A))"),
    .INIT(8'h4c))
    _al_u475 (
    .a(_al_u474_o),
    .b(\u_uart/u_ubus/send_cnt [3]),
    .c(\u_uart/u_ubus/tx_buffer [2]),
    .o(_al_u475_o));
  AL_MAP_LUT4 #(
    .EQN("(C*~(~D*B*A))"),
    .INIT(16'hf070))
    _al_u476 (
    .a(\u_uart/u_ubus/send_cnt [0]),
    .b(\u_uart/u_ubus/send_cnt [1]),
    .c(\u_uart/u_ubus/send_cnt [2]),
    .d(\u_uart/u_ubus/tx_buffer [10]),
    .o(_al_u476_o));
  AL_MAP_LUT2 #(
    .EQN("(~B*~A)"),
    .INIT(4'h1))
    _al_u477 (
    .a(_al_u476_o),
    .b(\u_uart/u_ubus/send_cnt [3]),
    .o(_al_u477_o));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)+~(A)*~(B)*C*~(D)+~(A)*~(B)*~(C)*D+A*~(B)*~(C)*D+~(A)*~(B)*C*D+~(A)*B*C*D)"),
    .INIT(16'h5311))
    _al_u478 (
    .a(_al_u475_o),
    .b(_al_u477_o),
    .c(_al_u474_o),
    .d(\u_uart/tx_data [2]),
    .o(\u_uart/u_ubus/n57 [2]));
  AL_MAP_LUT4 #(
    .EQN("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT(16'h048c))
    _al_u479 (
    .a(_al_u474_o),
    .b(\u_uart/u_ubus/send_cnt [3]),
    .c(\u_uart/tx_data [3]),
    .d(\u_uart/u_ubus/tx_buffer [3]),
    .o(_al_u479_o));
  AL_MAP_LUT3 #(
    .EQN("(~B*~(C*A))"),
    .INIT(8'h13))
    _al_u480 (
    .a(_al_u474_o),
    .b(\u_uart/u_ubus/send_cnt [3]),
    .c(\u_uart/tx_data [3]),
    .o(_al_u480_o));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u481 (
    .a(\u_uart/u_ubus/send_cnt [0]),
    .b(\u_uart/u_ubus/send_cnt [1]),
    .c(\u_uart/u_ubus/send_cnt [2]),
    .o(_al_u481_o));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(B*~(D*C)))"),
    .INIT(16'h5111))
    _al_u482 (
    .a(_al_u479_o),
    .b(_al_u480_o),
    .c(_al_u481_o),
    .d(\u_uart/u_ubus/tx_buffer [11]),
    .o(\u_uart/u_ubus/n57 [3]));
  AL_MAP_LUT4 #(
    .EQN("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT(16'h048c))
    _al_u483 (
    .a(_al_u474_o),
    .b(\u_uart/u_ubus/send_cnt [3]),
    .c(\u_uart/tx_data [4]),
    .d(\u_uart/u_ubus/tx_buffer [4]),
    .o(_al_u483_o));
  AL_MAP_LUT3 #(
    .EQN("(~B*~(C*A))"),
    .INIT(8'h13))
    _al_u484 (
    .a(_al_u474_o),
    .b(\u_uart/u_ubus/send_cnt [3]),
    .c(\u_uart/tx_data [4]),
    .o(_al_u484_o));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(B*~(D*C)))"),
    .INIT(16'h5111))
    _al_u485 (
    .a(_al_u483_o),
    .b(_al_u484_o),
    .c(_al_u481_o),
    .d(\u_uart/u_ubus/tx_buffer [12]),
    .o(\u_uart/u_ubus/n57 [4]));
  AL_MAP_LUT4 #(
    .EQN("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT(16'h048c))
    _al_u486 (
    .a(_al_u474_o),
    .b(\u_uart/u_ubus/send_cnt [3]),
    .c(\u_uart/tx_data [5]),
    .d(\u_uart/u_ubus/tx_buffer [5]),
    .o(_al_u486_o));
  AL_MAP_LUT3 #(
    .EQN("(~B*~(C*A))"),
    .INIT(8'h13))
    _al_u487 (
    .a(_al_u474_o),
    .b(\u_uart/u_ubus/send_cnt [3]),
    .c(\u_uart/tx_data [5]),
    .o(_al_u487_o));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(B*~(D*C)))"),
    .INIT(16'h5111))
    _al_u488 (
    .a(_al_u486_o),
    .b(_al_u487_o),
    .c(_al_u481_o),
    .d(\u_uart/u_ubus/tx_buffer [13]),
    .o(\u_uart/u_ubus/n57 [5]));
  AL_MAP_LUT4 #(
    .EQN("(~(~D*B)*~(~C*A))"),
    .INIT(16'hf531))
    _al_u489 (
    .a(_al_u474_o),
    .b(_al_u481_o),
    .c(\u_uart/tx_data [6]),
    .d(\u_uart/u_ubus/tx_buffer [14]),
    .o(\u_uart/u_ubus/sel0_b6/B2_0 ));
  AL_MAP_LUT4 #(
    .EQN("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT(16'h048c))
    _al_u490 (
    .a(_al_u474_o),
    .b(\u_uart/u_ubus/send_cnt [3]),
    .c(\u_uart/tx_data [6]),
    .d(\u_uart/u_ubus/tx_buffer [6]),
    .o(_al_u490_o));
  AL_MAP_LUT3 #(
    .EQN("(~B*~(~C*~A))"),
    .INIT(8'h32))
    _al_u491 (
    .a(\u_uart/u_ubus/sel0_b6/B2_0 ),
    .b(_al_u490_o),
    .c(\u_uart/u_ubus/send_cnt [3]),
    .o(\u_uart/u_ubus/n57 [6]));
  AL_MAP_LUT4 #(
    .EQN("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT(16'h048c))
    _al_u492 (
    .a(_al_u474_o),
    .b(\u_uart/u_ubus/send_cnt [3]),
    .c(\u_uart/tx_data [7]),
    .d(\u_uart/u_ubus/tx_buffer [7]),
    .o(_al_u492_o));
  AL_MAP_LUT3 #(
    .EQN("(~B*~(C*A))"),
    .INIT(8'h13))
    _al_u493 (
    .a(_al_u474_o),
    .b(\u_uart/u_ubus/send_cnt [3]),
    .c(\u_uart/tx_data [7]),
    .o(_al_u493_o));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(B*~(D*C)))"),
    .INIT(16'h5111))
    _al_u494 (
    .a(_al_u492_o),
    .b(_al_u493_o),
    .c(_al_u481_o),
    .d(\u_uart/u_ubus/tx_buffer [15]),
    .o(\u_uart/u_ubus/n57 [7]));
  AL_MAP_LUT4 #(
    .EQN("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT(16'h048c))
    _al_u495 (
    .a(_al_u474_o),
    .b(\u_uart/u_ubus/send_cnt [3]),
    .c(\u_uart/tx_data [0]),
    .d(\u_uart/u_ubus/tx_buffer [0]),
    .o(_al_u495_o));
  AL_MAP_LUT4 #(
    .EQN("(~B*~(~A*~(D*~C)))"),
    .INIT(16'h2322))
    _al_u496 (
    .a(\u_uart/u_ubus/send_cnt [0]),
    .b(\u_uart/u_ubus/send_cnt [1]),
    .c(\u_uart/u_ubus/send_cnt [2]),
    .d(\u_uart/tx_data [0]),
    .o(_al_u496_o));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(A*~(~D*B)))"),
    .INIT(16'h050d))
    _al_u497 (
    .a(\u_uart/u_ubus/send_cnt [0]),
    .b(\u_uart/u_ubus/send_cnt [2]),
    .c(\u_uart/u_ubus/send_cnt [3]),
    .d(\u_uart/u_ubus/tx_buffer [8]),
    .o(_al_u497_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u498 (
    .a(_al_u495_o),
    .b(_al_u496_o),
    .c(_al_u497_o),
    .o(\u_uart/u_ubus/n57 [0]));
  AL_MAP_LUT4 #(
    .EQN("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT(16'h048c))
    _al_u499 (
    .a(_al_u474_o),
    .b(\u_uart/u_ubus/send_cnt [3]),
    .c(\u_uart/tx_data [1]),
    .d(\u_uart/u_ubus/tx_buffer [1]),
    .o(_al_u499_o));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(~B*~(D*~C)))"),
    .INIT(16'h4544))
    _al_u500 (
    .a(\u_uart/u_ubus/send_cnt [0]),
    .b(\u_uart/u_ubus/send_cnt [1]),
    .c(\u_uart/u_ubus/send_cnt [2]),
    .d(\u_uart/tx_data [1]),
    .o(_al_u500_o));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(A*~(~D*B)))"),
    .INIT(16'h050d))
    _al_u501 (
    .a(\u_uart/u_ubus/send_cnt [1]),
    .b(\u_uart/u_ubus/send_cnt [2]),
    .c(\u_uart/u_ubus/send_cnt [3]),
    .d(\u_uart/u_ubus/tx_buffer [9]),
    .o(_al_u501_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u502 (
    .a(_al_u499_o),
    .b(_al_u500_o),
    .c(_al_u501_o),
    .o(\u_uart/u_ubus/n57 [1]));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*~A)"),
    .INIT(8'h10))
    _al_u503 (
    .a(\u_cpu/read_abcd [2]),
    .b(\u_cpu/read_abcd [3]),
    .c(\u_cpu/dbg_info [9]),
    .o(\u_cpu/u_execute/n36 [9]));
  AL_MAP_LUT4 #(
    .EQN("(~(~B*A)*~(D)*~(C)+~(~B*A)*D*~(C)+~(~(~B*A))*D*C+~(~B*A)*D*C)"),
    .INIT(16'hfd0d))
    _al_u504 (
    .a(_al_u392_o),
    .b(\u_cpu/u_execute/n36 [9]),
    .c(\u_cpu/u_execute/dbg_info_en0 ),
    .d(bus_wdata[1]),
    .o(\u_cpu/u_execute/n39 [9]));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*~A)"),
    .INIT(8'h01))
    _al_u505 (
    .a(\u_cpu/read_abcd [2]),
    .b(\u_cpu/read_abcd [3]),
    .c(\u_cpu/dbg_info [11]),
    .o(_al_u505_o));
  AL_MAP_LUT4 #(
    .EQN("((~B*A)*~(D)*~(C)+(~B*A)*D*~(C)+~((~B*A))*D*C+(~B*A)*D*C)"),
    .INIT(16'hf202))
    _al_u506 (
    .a(_al_u392_o),
    .b(_al_u505_o),
    .c(\u_cpu/u_execute/dbg_info_en0 ),
    .d(bus_wdata[3]),
    .o(\u_cpu/u_execute/n39 [11]));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*~A)"),
    .INIT(8'h10))
    _al_u507 (
    .a(\u_cpu/read_abcd [2]),
    .b(\u_cpu/read_abcd [3]),
    .c(\u_cpu/dbg_info [10]),
    .o(\u_cpu/u_execute/n36 [10]));
  AL_MAP_LUT4 #(
    .EQN("(~(~B*A)*~(D)*~(C)+~(~B*A)*D*~(C)+~(~(~B*A))*D*C+~(~B*A)*D*C)"),
    .INIT(16'hfd0d))
    _al_u508 (
    .a(_al_u392_o),
    .b(\u_cpu/u_execute/n36 [10]),
    .c(\u_cpu/u_execute/dbg_info_en0 ),
    .d(bus_wdata[2]),
    .o(\u_cpu/u_execute/n39 [10]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u509 (
    .a(\u_bus/eq0/or_or_or_xor_i0[0]_i_o ),
    .b(bus_wen),
    .o(\u_bus/u6_sel_is_3_o ));
  AL_MAP_LUT3 #(
    .EQN("(A*~(~C*B))"),
    .INIT(8'ha2))
    _al_u510 (
    .a(_al_u392_o),
    .b(\u_cpu/read_abcd [2]),
    .c(\u_cpu/u_execute/C [0]),
    .o(_al_u510_o));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .INIT(16'h0415))
    _al_u511 (
    .a(\u_cpu/read_abcd [2]),
    .b(\u_cpu/read_abcd [3]),
    .c(bus_raddr[0]),
    .d(\u_cpu/dbg_info [0]),
    .o(_al_u511_o));
  AL_MAP_LUT4 #(
    .EQN("(~(D*C)*~(~B*A))"),
    .INIT(16'h0ddd))
    _al_u512 (
    .a(_al_u510_o),
    .b(_al_u511_o),
    .c(\u_cpu/read_abcd [0]),
    .d(bus_wdata[0]),
    .o(_al_u512_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~(B*~A))"),
    .INIT(8'h0b))
    _al_u513 (
    .a(\u_cpu/read_abcd [0]),
    .b(\u_cpu/read_abcd [1]),
    .c(\u_cpu/u_execute/dbg_info_en0 ),
    .o(_al_u513_o));
  AL_MAP_LUT3 #(
    .EQN("~(~C*~(A)*~(B)+~C*A*~(B)+~(~C)*A*B+~C*A*B)"),
    .INIT(8'h74))
    _al_u514 (
    .a(_al_u512_o),
    .b(_al_u513_o),
    .c(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_execute/n39 [0]));
  AL_MAP_LUT3 #(
    .EQN("(A*~(~C*B))"),
    .INIT(8'ha2))
    _al_u515 (
    .a(_al_u392_o),
    .b(\u_cpu/read_abcd [2]),
    .c(\u_cpu/u_execute/C [1]),
    .o(_al_u515_o));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .INIT(16'h0415))
    _al_u516 (
    .a(\u_cpu/read_abcd [2]),
    .b(\u_cpu/read_abcd [3]),
    .c(bus_raddr[1]),
    .d(\u_cpu/dbg_info [1]),
    .o(_al_u516_o));
  AL_MAP_LUT4 #(
    .EQN("(~(D*C)*~(~B*A))"),
    .INIT(16'h0ddd))
    _al_u517 (
    .a(_al_u515_o),
    .b(_al_u516_o),
    .c(\u_cpu/read_abcd [0]),
    .d(bus_wdata[1]),
    .o(_al_u517_o));
  AL_MAP_LUT3 #(
    .EQN("~(~C*~(A)*~(B)+~C*A*~(B)+~(~C)*A*B+~C*A*B)"),
    .INIT(8'h74))
    _al_u518 (
    .a(_al_u517_o),
    .b(_al_u513_o),
    .c(\u_cpu/alu_in2 [1]),
    .o(\u_cpu/u_execute/n39 [1]));
  AL_MAP_LUT3 #(
    .EQN("(A*~(~C*B))"),
    .INIT(8'ha2))
    _al_u519 (
    .a(_al_u392_o),
    .b(\u_cpu/read_abcd [2]),
    .c(\u_cpu/u_execute/C [2]),
    .o(_al_u519_o));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .INIT(16'h0415))
    _al_u520 (
    .a(\u_cpu/read_abcd [2]),
    .b(\u_cpu/read_abcd [3]),
    .c(bus_raddr[2]),
    .d(\u_cpu/dbg_info [2]),
    .o(_al_u520_o));
  AL_MAP_LUT4 #(
    .EQN("(~(D*C)*~(~B*A))"),
    .INIT(16'h0ddd))
    _al_u521 (
    .a(_al_u519_o),
    .b(_al_u520_o),
    .c(\u_cpu/read_abcd [0]),
    .d(bus_wdata[2]),
    .o(_al_u521_o));
  AL_MAP_LUT3 #(
    .EQN("~(~C*~(A)*~(B)+~C*A*~(B)+~(~C)*A*B+~C*A*B)"),
    .INIT(8'h74))
    _al_u522 (
    .a(_al_u521_o),
    .b(_al_u513_o),
    .c(\u_cpu/alu_in2 [2]),
    .o(\u_cpu/u_execute/n39 [2]));
  AL_MAP_LUT3 #(
    .EQN("(A*~(~C*B))"),
    .INIT(8'ha2))
    _al_u523 (
    .a(_al_u392_o),
    .b(\u_cpu/read_abcd [2]),
    .c(\u_cpu/u_execute/C [3]),
    .o(_al_u523_o));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .INIT(16'h0415))
    _al_u524 (
    .a(\u_cpu/read_abcd [2]),
    .b(\u_cpu/read_abcd [3]),
    .c(bus_raddr[3]),
    .d(\u_cpu/dbg_info [3]),
    .o(_al_u524_o));
  AL_MAP_LUT4 #(
    .EQN("(~(D*C)*~(~B*A))"),
    .INIT(16'h0ddd))
    _al_u525 (
    .a(_al_u523_o),
    .b(_al_u524_o),
    .c(\u_cpu/read_abcd [0]),
    .d(bus_wdata[3]),
    .o(_al_u525_o));
  AL_MAP_LUT3 #(
    .EQN("~(~C*~(A)*~(B)+~C*A*~(B)+~(~C)*A*B+~C*A*B)"),
    .INIT(8'h74))
    _al_u526 (
    .a(_al_u525_o),
    .b(_al_u513_o),
    .c(\u_cpu/alu_in2 [3]),
    .o(\u_cpu/u_execute/n39 [3]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'hd8))
    _al_u527 (
    .a(\u_cpu/read_abcd [3]),
    .b(bus_raddr[4]),
    .c(\u_cpu/dbg_info [4]),
    .o(\u_cpu/u_execute/n35 [4]));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*~A)"),
    .INIT(8'h01))
    _al_u528 (
    .a(\u_cpu/read_abcd [0]),
    .b(\u_cpu/read_abcd [1]),
    .c(\u_cpu/u_execute/dbg_info_en0 ),
    .o(_al_u528_o));
  AL_MAP_LUT4 #(
    .EQN("(B*~(A*~(D)*~(C)+A*D*~(C)+~(A)*D*C+A*D*C))"),
    .INIT(16'h04c4))
    _al_u529 (
    .a(\u_cpu/u_execute/n35 [4]),
    .b(_al_u528_o),
    .c(\u_cpu/read_abcd [2]),
    .d(\u_cpu/u_execute/C [4]),
    .o(_al_u529_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    _al_u530 (
    .a(\u_cpu/read_abcd [0]),
    .b(\u_cpu/u_execute/dbg_info_en0 ),
    .c(bus_wdata[4]),
    .o(_al_u530_o));
  AL_MAP_LUT4 #(
    .EQN("(~C*~A*~(~D*~B))"),
    .INIT(16'h0504))
    _al_u531 (
    .a(_al_u529_o),
    .b(_al_u513_o),
    .c(_al_u530_o),
    .d(\u_cpu/alu_in2 [4]),
    .o(\u_cpu/u_execute/n39 [4]));
  AL_MAP_LUT3 #(
    .EQN("(A*~(C*B))"),
    .INIT(8'h2a))
    _al_u532 (
    .a(_al_u392_o),
    .b(\u_cpu/read_abcd [2]),
    .c(\u_cpu/u_execute/C [5]),
    .o(_al_u532_o));
  AL_MAP_LUT4 #(
    .EQN("(~A*(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .INIT(16'h5140))
    _al_u533 (
    .a(\u_cpu/read_abcd [2]),
    .b(\u_cpu/read_abcd [3]),
    .c(bus_raddr[5]),
    .d(\u_cpu/dbg_info [5]),
    .o(_al_u533_o));
  AL_MAP_LUT4 #(
    .EQN("(~(~D*C)*~(~B*A))"),
    .INIT(16'hdd0d))
    _al_u534 (
    .a(_al_u532_o),
    .b(_al_u533_o),
    .c(\u_cpu/read_abcd [0]),
    .d(bus_wdata[5]),
    .o(_al_u534_o));
  AL_MAP_LUT3 #(
    .EQN("(C*~(A)*~(B)+C*A*~(B)+~(C)*A*B+C*A*B)"),
    .INIT(8'hb8))
    _al_u535 (
    .a(_al_u534_o),
    .b(_al_u513_o),
    .c(\u_cpu/alu_in2 [5]),
    .o(\u_cpu/u_execute/n39 [5]));
  AL_MAP_LUT3 #(
    .EQN("(A*~(~C*B))"),
    .INIT(8'ha2))
    _al_u536 (
    .a(_al_u392_o),
    .b(\u_cpu/read_abcd [2]),
    .c(\u_cpu/u_execute/C [6]),
    .o(_al_u536_o));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .INIT(16'h0415))
    _al_u537 (
    .a(\u_cpu/read_abcd [2]),
    .b(\u_cpu/read_abcd [3]),
    .c(bus_raddr[6]),
    .d(\u_cpu/dbg_info [6]),
    .o(_al_u537_o));
  AL_MAP_LUT4 #(
    .EQN("(~(D*C)*~(~B*A))"),
    .INIT(16'h0ddd))
    _al_u538 (
    .a(_al_u536_o),
    .b(_al_u537_o),
    .c(\u_cpu/read_abcd [0]),
    .d(bus_wdata[6]),
    .o(_al_u538_o));
  AL_MAP_LUT3 #(
    .EQN("~(~C*~(A)*~(B)+~C*A*~(B)+~(~C)*A*B+~C*A*B)"),
    .INIT(8'h74))
    _al_u539 (
    .a(_al_u538_o),
    .b(_al_u513_o),
    .c(\u_cpu/alu_in2 [6]),
    .o(\u_cpu/u_execute/n39 [6]));
  AL_MAP_LUT3 #(
    .EQN("(A*~(~C*B))"),
    .INIT(8'ha2))
    _al_u540 (
    .a(_al_u392_o),
    .b(\u_cpu/read_abcd [2]),
    .c(\u_cpu/u_execute/C [7]),
    .o(_al_u540_o));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .INIT(16'h0415))
    _al_u541 (
    .a(\u_cpu/read_abcd [2]),
    .b(\u_cpu/read_abcd [3]),
    .c(bus_raddr[7]),
    .d(\u_cpu/dbg_info [7]),
    .o(_al_u541_o));
  AL_MAP_LUT4 #(
    .EQN("(~(D*C)*~(~B*A))"),
    .INIT(16'h0ddd))
    _al_u542 (
    .a(_al_u540_o),
    .b(_al_u541_o),
    .c(\u_cpu/read_abcd [0]),
    .d(bus_wdata[7]),
    .o(_al_u542_o));
  AL_MAP_LUT3 #(
    .EQN("~(~C*~(A)*~(B)+~C*A*~(B)+~(~C)*A*B+~C*A*B)"),
    .INIT(8'h74))
    _al_u543 (
    .a(_al_u542_o),
    .b(_al_u513_o),
    .c(\u_cpu/alu_in2 [7]),
    .o(\u_cpu/u_execute/n39 [7]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(~B*~(~D*~C)))"),
    .INIT(16'h4445))
    _al_u544 (
    .a(\u_cpu/read_abcd [1]),
    .b(\u_cpu/read_abcd [2]),
    .c(\u_cpu/read_abcd [3]),
    .d(\u_cpu/dbg_info [8]),
    .o(_al_u544_o));
  AL_MAP_LUT4 #(
    .EQN("((~B*~A)*~(D)*~(C)+(~B*~A)*D*~(C)+~((~B*~A))*D*C+(~B*~A)*D*C)"),
    .INIT(16'hf101))
    _al_u545 (
    .a(_al_u544_o),
    .b(\u_cpu/read_abcd [0]),
    .c(\u_cpu/u_execute/dbg_info_en0 ),
    .d(bus_wdata[0]),
    .o(\u_cpu/u_execute/n39 [8]));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u546 (
    .a(\u_key/key_d1 [2]),
    .b(\u_key/key_d1 [3]),
    .c(\u_key/key_d1 [4]),
    .d(\u_key/key_d1 [5]),
    .o(_al_u546_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    _al_u547 (
    .a(_al_u546_o),
    .b(\u_key/key_d1 [0]),
    .c(\u_key/key_d1 [1]),
    .o(\u_key/n23_lutinv ));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u548 (
    .a(\u_key/key_d0 [2]),
    .b(\u_key/key_d0 [3]),
    .c(\u_key/key_d0 [4]),
    .d(\u_key/key_d0 [5]),
    .o(_al_u548_o));
  AL_MAP_LUT4 #(
    .EQN("(A*~(~D*~C*B))"),
    .INIT(16'haaa2))
    _al_u549 (
    .a(\u_key/n23_lutinv ),
    .b(_al_u548_o),
    .c(\u_key/key_d0 [0]),
    .d(\u_key/key_d0 [1]),
    .o(\u_key/n25 ));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u550 (
    .a(\u_key/cnt [7]),
    .b(\u_key/cnt [8]),
    .c(\u_key/cnt [9]),
    .o(_al_u550_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u551 (
    .a(\u_key/cnt [3]),
    .b(\u_key/cnt [4]),
    .c(\u_key/cnt [5]),
    .d(\u_key/cnt [6]),
    .o(_al_u551_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u552 (
    .a(\u_key/cnt [16]),
    .b(\u_key/cnt [17]),
    .c(\u_key/cnt [18]),
    .d(\u_key/cnt [2]),
    .o(_al_u552_o));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u553 (
    .a(_al_u550_o),
    .b(_al_u551_o),
    .c(_al_u552_o),
    .o(_al_u553_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u554 (
    .a(\u_key/cnt [12]),
    .b(\u_key/cnt [13]),
    .c(\u_key/cnt [14]),
    .d(\u_key/cnt [15]),
    .o(_al_u554_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u555 (
    .a(\u_key/cnt [0]),
    .b(\u_key/cnt [1]),
    .c(\u_key/cnt [10]),
    .d(\u_key/cnt [11]),
    .o(_al_u555_o));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u556 (
    .a(_al_u553_o),
    .b(_al_u554_o),
    .c(_al_u555_o),
    .o(\u_key/n14 ));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    _al_u557 (
    .a(\u_uart/u_uart_rx/clk_en ),
    .b(\u_uart/u_uart_rx/cnt [2]),
    .c(\u_uart/u_uart_rx/cnt [3]),
    .o(_al_u557_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*B*A)"),
    .INIT(8'h08))
    _al_u558 (
    .a(_al_u557_o),
    .b(\u_uart/u_uart_rx/cnt [0]),
    .c(\u_uart/u_uart_rx/cnt [1]),
    .o(\u_uart/u_uart_rx/mux4_b0_sel_is_3_o ));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u559 (
    .a(_al_u557_o),
    .b(\u_uart/u_uart_rx/cnt [0]),
    .c(\u_uart/u_uart_rx/cnt [1]),
    .o(\u_uart/u_uart_rx/mux4_b2_sel_is_3_o ));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u560 (
    .a(_al_u557_o),
    .b(\u_uart/u_uart_rx/cnt [0]),
    .c(\u_uart/u_uart_rx/cnt [1]),
    .o(\u_uart/u_uart_rx/mux4_b1_sel_is_3_o ));
  AL_MAP_LUT3 #(
    .EQN("(~C*B*A)"),
    .INIT(8'h08))
    _al_u561 (
    .a(\u_uart/u_uart_rx/clk_en ),
    .b(\u_uart/u_uart_rx/cnt [2]),
    .c(\u_uart/u_uart_rx/cnt [3]),
    .o(_al_u561_o));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u562 (
    .a(_al_u561_o),
    .b(\u_uart/u_uart_rx/cnt [0]),
    .c(\u_uart/u_uart_rx/cnt [1]),
    .o(\u_uart/u_uart_rx/mux4_b6_sel_is_3_o ));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u563 (
    .a(_al_u561_o),
    .b(\u_uart/u_uart_rx/cnt [0]),
    .c(\u_uart/u_uart_rx/cnt [1]),
    .o(\u_uart/u_uart_rx/mux4_b5_sel_is_3_o ));
  AL_MAP_LUT3 #(
    .EQN("(~C*B*A)"),
    .INIT(8'h08))
    _al_u564 (
    .a(_al_u561_o),
    .b(\u_uart/u_uart_rx/cnt [0]),
    .c(\u_uart/u_uart_rx/cnt [1]),
    .o(\u_uart/u_uart_rx/mux4_b4_sel_is_3_o ));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    _al_u565 (
    .a(_al_u561_o),
    .b(\u_uart/u_uart_rx/cnt [0]),
    .c(\u_uart/u_uart_rx/cnt [1]),
    .o(\u_uart/u_uart_rx/mux4_b3_sel_is_3_o ));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u566 (
    .a(\u_uart/u_uart_rx/clk_en ),
    .b(\u_uart/u_uart_rx/cnt [2]),
    .c(\u_uart/u_uart_rx/cnt [3]),
    .o(_al_u566_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    _al_u567 (
    .a(_al_u566_o),
    .b(\u_uart/u_uart_rx/cnt [0]),
    .c(\u_uart/u_uart_rx/cnt [1]),
    .o(\u_uart/u_uart_rx/mux4_b7_sel_is_3_o ));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u568 (
    .a(\u_uart/u_uart_rx/n1 ),
    .b(\u_uart/u_uart_rx/start ),
    .o(\u_uart/u_uart_rx/n28 ));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u569 (
    .a(\u_uart/u_ubus/frame_head_flag2 ),
    .b(\u_uart/u_ubus/frame_head_flag3 ),
    .c(\u_uart/u_ubus/frame_head_flag4 ),
    .d(\u_uart/u_ubus/frame_head_flag5 ),
    .o(_al_u569_o));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u570 (
    .a(_al_u569_o),
    .b(\u_uart/u_ubus/frame_head_flag0 ),
    .c(\u_uart/u_ubus/frame_head_flag1 ),
    .o(\u_uart/u_ubus/n26 ));
  AL_MAP_LUT3 #(
    .EQN("(~C*B*A)"),
    .INIT(8'h08))
    _al_u571 (
    .a(_al_u472_o),
    .b(recv_cmd[0]),
    .c(recv_cmd[1]),
    .o(\u_cpu/u_debug/debug_cmd ));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u572 (
    .a(_al_u472_o),
    .b(recv_cmd[0]),
    .c(recv_cmd[1]),
    .o(\u_cpu/u_debug/clear_rom_data_cmd ));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u573 (
    .a(_al_u472_o),
    .b(recv_cmd[0]),
    .c(recv_cmd[1]),
    .o(\u_cpu/u_debug/clear_rom_addr_cmd ));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*~A)"),
    .INIT(8'h01))
    _al_u574 (
    .a(\u_vram/n10 ),
    .b(\u_vram/n12 ),
    .c(\u_vram/n14 ),
    .o(_al_u574_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*B*A)"),
    .INIT(8'h08))
    _al_u575 (
    .a(_al_u574_o),
    .b(\u_vram/axis_en_d2 ),
    .c(\u_vram/n9 ),
    .o(\u_vram/mux3_b12_sel_is_1_o ));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*~A)"),
    .INIT(8'h01))
    _al_u576 (
    .a(\u_vram/axis_x_d2 [2]),
    .b(\u_vram/axis_x_d2 [3]),
    .c(\u_vram/axis_x_d2 [4]),
    .o(_al_u576_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    _al_u577 (
    .a(_al_u576_o),
    .b(\u_vram/axis_x_d2 [0]),
    .c(\u_vram/axis_x_d2 [1]),
    .o(\u_vram/n24_lutinv ));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*~A)"),
    .INIT(8'h01))
    _al_u578 (
    .a(\u_vram/axis_y_d2 [2]),
    .b(\u_vram/axis_y_d2 [3]),
    .c(\u_vram/axis_y_d2 [4]),
    .o(_al_u578_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    _al_u579 (
    .a(_al_u578_o),
    .b(\u_vram/axis_y_d2 [0]),
    .c(\u_vram/axis_y_d2 [1]),
    .o(\u_vram/n23_lutinv ));
  AL_MAP_LUT2 #(
    .EQN("~(~B*~A)"),
    .INIT(4'he))
    _al_u580 (
    .a(\u_vram/n24_lutinv ),
    .b(\u_vram/n23_lutinv ),
    .o(\u_vram/n26[11]_d ));
  AL_MAP_LUT4 #(
    .EQN("~(~(C*B)*~(D*~A))"),
    .INIT(16'hd5c0))
    _al_u581 (
    .a(\u_cpu/u_execute/n34 ),
    .b(\u_cpu/u_execute/dbg_info_en0 ),
    .c(bus_wdata[7]),
    .d(\u_cpu/dbg_info [15]),
    .o(\u_cpu/u_execute/n39 [15]));
  AL_MAP_LUT4 #(
    .EQN("~(~(C*B)*~(D*~A))"),
    .INIT(16'hd5c0))
    _al_u582 (
    .a(\u_cpu/u_execute/n34 ),
    .b(\u_cpu/u_execute/dbg_info_en0 ),
    .c(bus_wdata[6]),
    .d(\u_cpu/dbg_info [14]),
    .o(\u_cpu/u_execute/n39 [14]));
  AL_MAP_LUT4 #(
    .EQN("~(~(C*B)*~(D*~A))"),
    .INIT(16'hd5c0))
    _al_u583 (
    .a(\u_cpu/u_execute/n34 ),
    .b(\u_cpu/u_execute/dbg_info_en0 ),
    .c(bus_wdata[5]),
    .d(\u_cpu/dbg_info [13]),
    .o(\u_cpu/u_execute/n39 [13]));
  AL_MAP_LUT4 #(
    .EQN("~(~(C*B)*~(D*~A))"),
    .INIT(16'hd5c0))
    _al_u584 (
    .a(\u_cpu/u_execute/n34 ),
    .b(\u_cpu/u_execute/dbg_info_en0 ),
    .c(bus_wdata[4]),
    .d(\u_cpu/dbg_info [12]),
    .o(\u_cpu/u_execute/n39 [12]));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u585 (
    .a(rom_waddr[18]),
    .b(rom_waddr[19]),
    .c(rom_waddr[20]),
    .d(rom_waddr[21]),
    .o(_al_u585_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*A)"),
    .INIT(16'h0200))
    _al_u586 (
    .a(_al_u585_o),
    .b(rom_waddr[22]),
    .c(rom_waddr[23]),
    .d(rom_wen),
    .o(_al_u586_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u587 (
    .a(rom_waddr[14]),
    .b(rom_waddr[15]),
    .c(rom_waddr[16]),
    .d(rom_waddr[17]),
    .o(_al_u587_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*A)"),
    .INIT(16'h0008))
    _al_u588 (
    .a(_al_u586_o),
    .b(_al_u587_o),
    .c(rom_waddr[12]),
    .d(rom_waddr[13]),
    .o(\u_rom/n4 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u589 (
    .a(\u_cpu/u_decode/inst_d [4]),
    .b(\u_cpu/u_decode/inst_d [5]),
    .c(\u_cpu/u_decode/inst_d [6]),
    .d(\u_cpu/u_decode/inst_d [7]),
    .o(_al_u589_o));
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    _al_u590 (
    .a(_al_u589_o),
    .b(\u_cpu/u_decode/inst_d [1]),
    .o(_al_u590_o));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u591 (
    .a(\u_cpu/u_decode/inst_data ),
    .b(\u_cpu/u_decode/inst_d [0]),
    .c(\u_cpu/inst_en ),
    .o(_al_u591_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*A)"),
    .INIT(16'h0008))
    _al_u592 (
    .a(_al_u590_o),
    .b(_al_u591_o),
    .c(\u_cpu/u_decode/inst_d [2]),
    .d(\u_cpu/u_decode/inst_d [3]),
    .o(\u_cpu/u_decode/n17 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*A)"),
    .INIT(16'h0008))
    _al_u593 (
    .a(_al_u589_o),
    .b(\u_cpu/u_decode/inst_d [1]),
    .c(\u_cpu/u_decode/inst_d [2]),
    .d(\u_cpu/u_decode/inst_d [3]),
    .o(_al_u593_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u594 (
    .a(_al_u593_o),
    .b(_al_u591_o),
    .o(\u_cpu/u_decode/n21 ));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u595 (
    .a(\u_cpu/u_decode/inst_data ),
    .b(\u_cpu/u_decode/inst_d [0]),
    .c(\u_cpu/inst_en ),
    .o(_al_u595_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u596 (
    .a(_al_u593_o),
    .b(_al_u595_o),
    .o(\u_cpu/u_decode/n19 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    _al_u597 (
    .a(_al_u590_o),
    .b(_al_u595_o),
    .c(\u_cpu/u_decode/inst_d [2]),
    .d(\u_cpu/u_decode/inst_d [3]),
    .o(\u_cpu/u_decode/n23 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*A)"),
    .INIT(16'h0008))
    _al_u598 (
    .a(_al_u395_o),
    .b(bus_raddr[0]),
    .c(bus_raddr[2]),
    .d(bus_raddr[3]),
    .o(\u_bus/n1_lutinv ));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u599 (
    .a(\u_bus/n1_lutinv ),
    .b(bus_ren),
    .o(\u_bus/n18 ));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u600 (
    .a(\u_bus/n1_lutinv ),
    .b(key_deb[5]),
    .o(\u_bus/n15 [5]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u601 (
    .a(\u_bus/n1_lutinv ),
    .b(key_deb[4]),
    .o(\u_bus/n15 [4]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u602 (
    .a(\u_bus/n1_lutinv ),
    .b(key_deb[3]),
    .o(\u_bus/n15 [3]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u603 (
    .a(\u_bus/n1_lutinv ),
    .b(key_deb[2]),
    .o(\u_bus/n15 [2]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u604 (
    .a(\u_bus/n1_lutinv ),
    .b(key_deb[1]),
    .o(\u_bus/n15 [1]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u605 (
    .a(\u_bus/n1_lutinv ),
    .b(bus_wen),
    .o(\u_bus/mux0_b0_sel_is_3_o ));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u606 (
    .a(_al_u396_o),
    .b(_al_u394_o),
    .c(bus_wen),
    .d(bus_raddr[1]),
    .o(\u_bus/n22 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u607 (
    .a(\u_cpu/inst [4]),
    .b(\u_cpu/inst [5]),
    .c(\u_cpu/inst [6]),
    .d(\u_cpu/inst [7]),
    .o(_al_u607_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*~A)"),
    .INIT(16'h0040))
    _al_u608 (
    .a(\u_cpu/u_decode/inst_data ),
    .b(\u_cpu/inst_en ),
    .c(\u_cpu/inst [2]),
    .d(\u_cpu/inst [3]),
    .o(_al_u608_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    _al_u609 (
    .a(_al_u607_o),
    .b(_al_u608_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n25 ));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u610 (
    .a(_al_u607_o),
    .b(_al_u608_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n29 ));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*A)"),
    .INIT(16'h0800))
    _al_u611 (
    .a(_al_u607_o),
    .b(_al_u608_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n27 ));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u612 (
    .a(_al_u607_o),
    .b(\u_cpu/u_decode/inst_data ),
    .c(\u_cpu/inst_en ),
    .o(_al_u612_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u613 (
    .a(\u_cpu/inst [2]),
    .b(\u_cpu/inst [3]),
    .o(_al_u613_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u614 (
    .a(_al_u612_o),
    .b(_al_u613_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n45 ));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*A)"),
    .INIT(16'h0800))
    _al_u615 (
    .a(_al_u612_o),
    .b(_al_u613_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n43 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    _al_u616 (
    .a(_al_u612_o),
    .b(_al_u613_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n41 ));
  AL_MAP_LUT2 #(
    .EQN("(~B*~A)"),
    .INIT(4'h1))
    _al_u617 (
    .a(\u_cpu/inst [0]),
    .b(\u_cpu/inst [1]),
    .o(_al_u617_o));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u618 (
    .a(_al_u612_o),
    .b(_al_u613_o),
    .c(_al_u617_o),
    .o(\u_cpu/u_decode/n39 ));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u619 (
    .a(\u_cpu/inst [2]),
    .b(\u_cpu/inst [3]),
    .o(_al_u619_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u620 (
    .a(_al_u612_o),
    .b(_al_u619_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n37 ));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*A)"),
    .INIT(16'h0800))
    _al_u621 (
    .a(_al_u612_o),
    .b(_al_u619_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n35 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    _al_u622 (
    .a(_al_u612_o),
    .b(_al_u619_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n33 ));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u623 (
    .a(_al_u612_o),
    .b(_al_u617_o),
    .c(_al_u619_o),
    .o(\u_cpu/u_decode/n31 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*A)"),
    .INIT(16'h0002))
    _al_u624 (
    .a(\u_cpu/inst [4]),
    .b(\u_cpu/inst [5]),
    .c(\u_cpu/inst [6]),
    .d(\u_cpu/inst [7]),
    .o(_al_u624_o));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u625 (
    .a(_al_u624_o),
    .b(\u_cpu/u_decode/inst_data ),
    .c(\u_cpu/inst_en ),
    .o(_al_u625_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u626 (
    .a(_al_u625_o),
    .b(_al_u613_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n77 ));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*A)"),
    .INIT(16'h0800))
    _al_u627 (
    .a(_al_u625_o),
    .b(_al_u613_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n75 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    _al_u628 (
    .a(_al_u625_o),
    .b(_al_u613_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n73 ));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u629 (
    .a(_al_u625_o),
    .b(_al_u613_o),
    .c(_al_u617_o),
    .o(\u_cpu/u_decode/n71 ));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u630 (
    .a(_al_u625_o),
    .b(_al_u619_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n69 ));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*A)"),
    .INIT(16'h0800))
    _al_u631 (
    .a(_al_u625_o),
    .b(_al_u619_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n67 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    _al_u632 (
    .a(_al_u625_o),
    .b(_al_u619_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n65 ));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u633 (
    .a(_al_u625_o),
    .b(_al_u617_o),
    .c(_al_u619_o),
    .o(\u_cpu/u_decode/n63 ));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u634 (
    .a(_al_u608_o),
    .b(_al_u624_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n61 ));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*A)"),
    .INIT(16'h0800))
    _al_u635 (
    .a(_al_u608_o),
    .b(_al_u624_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n59 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    _al_u636 (
    .a(_al_u608_o),
    .b(_al_u624_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n57 ));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u637 (
    .a(_al_u608_o),
    .b(_al_u617_o),
    .c(_al_u624_o),
    .o(\u_cpu/u_decode/n55 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*~A)"),
    .INIT(16'h0004))
    _al_u638 (
    .a(\u_cpu/u_decode/inst_data ),
    .b(\u_cpu/inst_en ),
    .c(\u_cpu/inst [2]),
    .d(\u_cpu/inst [3]),
    .o(_al_u638_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u639 (
    .a(_al_u624_o),
    .b(_al_u638_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n53 ));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*A)"),
    .INIT(16'h0800))
    _al_u640 (
    .a(_al_u624_o),
    .b(_al_u638_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n51 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    _al_u641 (
    .a(_al_u624_o),
    .b(_al_u638_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n49 ));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u642 (
    .a(_al_u617_o),
    .b(_al_u624_o),
    .c(_al_u638_o),
    .o(\u_cpu/u_decode/n47 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*~A)"),
    .INIT(16'h0004))
    _al_u643 (
    .a(\u_cpu/inst [4]),
    .b(\u_cpu/inst [5]),
    .c(\u_cpu/inst [6]),
    .d(\u_cpu/inst [7]),
    .o(_al_u643_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u644 (
    .a(_al_u608_o),
    .b(_al_u643_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n93 ));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*A)"),
    .INIT(16'h0800))
    _al_u645 (
    .a(_al_u608_o),
    .b(_al_u643_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n91 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    _al_u646 (
    .a(_al_u608_o),
    .b(_al_u643_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n89 ));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u647 (
    .a(_al_u608_o),
    .b(_al_u617_o),
    .c(_al_u643_o),
    .o(\u_cpu/u_decode/n87 ));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u648 (
    .a(_al_u638_o),
    .b(_al_u643_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n85 ));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*A)"),
    .INIT(16'h0800))
    _al_u649 (
    .a(_al_u638_o),
    .b(_al_u643_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n83 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    _al_u650 (
    .a(_al_u638_o),
    .b(_al_u643_o),
    .c(\u_cpu/inst [0]),
    .d(\u_cpu/inst [1]),
    .o(\u_cpu/u_decode/n81 ));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u651 (
    .a(_al_u617_o),
    .b(_al_u638_o),
    .c(_al_u643_o),
    .o(\u_cpu/u_decode/n79 ));
  AL_MAP_LUT4 #(
    .EQN("~(~C*~(D*B*A))"),
    .INIT(16'hf8f0))
    _al_u652 (
    .a(_al_u474_o),
    .b(\u_uart/u_ubus/send_cnt [3]),
    .c(\u_uart/u_ubus/send_finish ),
    .d(\u_uart/tx_en ),
    .o(\u_uart/u_ubus/send_finish_d ));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u653 (
    .a(\u_uart/u_ubus/shift_reg2 [6]),
    .b(\u_uart/u_ubus/shift_reg2 [7]),
    .c(\u_uart/u_ubus/rx_en_d ),
    .o(_al_u653_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*A)"),
    .INIT(16'h0002))
    _al_u654 (
    .a(\u_uart/u_ubus/shift_reg2 [2]),
    .b(\u_uart/u_ubus/shift_reg2 [3]),
    .c(\u_uart/u_ubus/shift_reg2 [4]),
    .d(\u_uart/u_ubus/shift_reg2 [5]),
    .o(_al_u654_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*A)"),
    .INIT(16'h0800))
    _al_u655 (
    .a(_al_u653_o),
    .b(_al_u654_o),
    .c(\u_uart/u_ubus/shift_reg2 [0]),
    .d(\u_uart/u_ubus/shift_reg2 [1]),
    .o(\u_uart/u_ubus/n11 ));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u656 (
    .a(\u_uart/u_ubus/shift_reg3 [6]),
    .b(\u_uart/u_ubus/shift_reg3 [7]),
    .c(\u_uart/u_ubus/rx_en_d ),
    .o(_al_u656_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*A)"),
    .INIT(16'h0002))
    _al_u657 (
    .a(\u_uart/u_ubus/shift_reg3 [2]),
    .b(\u_uart/u_ubus/shift_reg3 [3]),
    .c(\u_uart/u_ubus/shift_reg3 [4]),
    .d(\u_uart/u_ubus/shift_reg3 [5]),
    .o(_al_u657_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    _al_u658 (
    .a(_al_u656_o),
    .b(_al_u657_o),
    .c(\u_uart/u_ubus/shift_reg3 [0]),
    .d(\u_uart/u_ubus/shift_reg3 [1]),
    .o(\u_uart/u_ubus/n13 ));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u659 (
    .a(\u_uart/u_ubus/shift_reg4 [6]),
    .b(\u_uart/u_ubus/shift_reg4 [7]),
    .c(\u_uart/u_ubus/rx_en_d ),
    .o(_al_u659_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*A)"),
    .INIT(16'h0002))
    _al_u660 (
    .a(\u_uart/u_ubus/shift_reg4 [2]),
    .b(\u_uart/u_ubus/shift_reg4 [3]),
    .c(\u_uart/u_ubus/shift_reg4 [4]),
    .d(\u_uart/u_ubus/shift_reg4 [5]),
    .o(_al_u660_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*A)"),
    .INIT(16'h0008))
    _al_u661 (
    .a(_al_u659_o),
    .b(_al_u660_o),
    .c(\u_uart/u_ubus/shift_reg4 [0]),
    .d(\u_uart/u_ubus/shift_reg4 [1]),
    .o(\u_uart/u_ubus/n15 ));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u662 (
    .a(\u_uart/u_ubus/shift_reg5 [6]),
    .b(\u_uart/u_ubus/shift_reg5 [7]),
    .c(\u_uart/u_ubus/rx_en_d ),
    .o(_al_u662_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u663 (
    .a(\u_uart/u_ubus/shift_reg5 [2]),
    .b(\u_uart/u_ubus/shift_reg5 [3]),
    .c(\u_uart/u_ubus/shift_reg5 [4]),
    .d(\u_uart/u_ubus/shift_reg5 [5]),
    .o(_al_u663_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u664 (
    .a(_al_u662_o),
    .b(_al_u663_o),
    .c(\u_uart/u_ubus/shift_reg5 [0]),
    .d(\u_uart/u_ubus/shift_reg5 [1]),
    .o(\u_uart/u_ubus/n17 ));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u665 (
    .a(\u_uart/u_ubus/shift_reg6 [6]),
    .b(\u_uart/u_ubus/shift_reg6 [7]),
    .c(\u_uart/u_ubus/rx_en_d ),
    .o(_al_u665_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u666 (
    .a(\u_uart/u_ubus/shift_reg6 [2]),
    .b(\u_uart/u_ubus/shift_reg6 [3]),
    .c(\u_uart/u_ubus/shift_reg6 [4]),
    .d(\u_uart/u_ubus/shift_reg6 [5]),
    .o(_al_u666_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*A)"),
    .INIT(16'h0800))
    _al_u667 (
    .a(_al_u665_o),
    .b(_al_u666_o),
    .c(\u_uart/u_ubus/shift_reg6 [0]),
    .d(\u_uart/u_ubus/shift_reg6 [1]),
    .o(\u_uart/u_ubus/n19 ));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u668 (
    .a(\u_uart/u_ubus/shift_reg7 [6]),
    .b(\u_uart/u_ubus/shift_reg7 [7]),
    .c(\u_uart/u_ubus/rx_en_d ),
    .o(_al_u668_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u669 (
    .a(\u_uart/u_ubus/shift_reg7 [2]),
    .b(\u_uart/u_ubus/shift_reg7 [3]),
    .c(\u_uart/u_ubus/shift_reg7 [4]),
    .d(\u_uart/u_ubus/shift_reg7 [5]),
    .o(_al_u669_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    _al_u670 (
    .a(_al_u668_o),
    .b(_al_u669_o),
    .c(\u_uart/u_ubus/shift_reg7 [0]),
    .d(\u_uart/u_ubus/shift_reg7 [1]),
    .o(\u_uart/u_ubus/n21 ));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u671 (
    .a(\u_cpu/u_debug/debug_cmd ),
    .b(recv_en),
    .o(\u_cpu/u_debug/n2 ));
  AL_MAP_LUT2 #(
    .EQN("~(~B*~A)"),
    .INIT(4'he))
    _al_u672 (
    .a(\u_cpu/u_debug/debug_cmd ),
    .b(\u_cpu/dbg_en ),
    .o(\u_cpu/dbg_en_d ));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    _al_u673 (
    .a(_al_u471_o),
    .b(recv_en),
    .c(recv_cmd[2]),
    .d(recv_cmd[3]),
    .o(_al_u673_o));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u674 (
    .a(_al_u673_o),
    .b(recv_cmd[0]),
    .c(recv_cmd[1]),
    .o(\u_cpu/u_debug/n4 [1]));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u675 (
    .a(_al_u673_o),
    .b(recv_cmd[0]),
    .c(recv_cmd[1]),
    .o(\u_cpu/u_debug/n4 [0]));
  AL_MAP_LUT3 #(
    .EQN("(~C*B*A)"),
    .INIT(8'h08))
    _al_u676 (
    .a(_al_u673_o),
    .b(recv_cmd[0]),
    .c(recv_cmd[1]),
    .o(\u_cpu/u_debug/n5 ));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    _al_u677 (
    .a(_al_u673_o),
    .b(recv_cmd[0]),
    .c(recv_cmd[1]),
    .o(\u_cpu/u_debug/n12 ));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*A)"),
    .INIT(16'h0800))
    _al_u678 (
    .a(_al_u471_o),
    .b(recv_en),
    .c(recv_cmd[2]),
    .d(recv_cmd[3]),
    .o(_al_u678_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*B*A)"),
    .INIT(8'h08))
    _al_u679 (
    .a(_al_u678_o),
    .b(recv_cmd[0]),
    .c(recv_cmd[1]),
    .o(\u_cpu/u_debug/n4 [3]));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    _al_u680 (
    .a(_al_u678_o),
    .b(recv_cmd[0]),
    .c(recv_cmd[1]),
    .o(\u_cpu/u_debug/n4 [2]));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*A)"),
    .INIT(16'h0008))
    _al_u681 (
    .a(\u_vga/hsyn_cnt [3]),
    .b(\u_vga/hsyn_cnt [4]),
    .c(\u_vga/hsyn_cnt [5]),
    .d(\u_vga/hsyn_cnt [6]),
    .o(_al_u681_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~B*A)"),
    .INIT(16'h2000))
    _al_u682 (
    .a(_al_u681_o),
    .b(\u_vga/hsyn_cnt [7]),
    .c(\u_vga/hsyn_cnt [8]),
    .d(\u_vga/hsyn_cnt [9]),
    .o(_al_u682_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*~A)"),
    .INIT(16'h0100))
    _al_u683 (
    .a(\u_vga/hsyn_cnt [10]),
    .b(\u_vga/hsyn_cnt [11]),
    .c(\u_vga/hsyn_cnt [12]),
    .d(\u_vga/hsyn_cnt [2]),
    .o(_al_u683_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u684 (
    .a(_al_u682_o),
    .b(_al_u683_o),
    .c(\u_vga/hsyn_cnt [0]),
    .d(\u_vga/hsyn_cnt [1]),
    .o(\u_vga/n0 ));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u685 (
    .a(\u_vram/n26[11]_d ),
    .b(\u_vram/state ),
    .o(\u_vram/n26 [10]));
  AL_MAP_LUT2 #(
    .EQN("(~B*~A)"),
    .INIT(4'h1))
    _al_u686 (
    .a(\u_cpu/alu_in2 [3]),
    .b(\u_cpu/alu_in2 [4]),
    .o(_al_u686_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*~A)"),
    .INIT(8'h01))
    _al_u687 (
    .a(\u_cpu/alu_in2 [5]),
    .b(\u_cpu/alu_in2 [6]),
    .c(\u_cpu/alu_in2 [7]),
    .o(_al_u687_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*~A)"),
    .INIT(8'h01))
    _al_u688 (
    .a(\u_cpu/alu_in2 [0]),
    .b(\u_cpu/alu_in2 [1]),
    .c(\u_cpu/alu_in2 [2]),
    .o(_al_u688_o));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u689 (
    .a(_al_u686_o),
    .b(_al_u687_o),
    .c(_al_u688_o),
    .o(_al_u689_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u690 (
    .a(bus_wdata[4]),
    .b(bus_wdata[5]),
    .c(bus_wdata[6]),
    .d(bus_wdata[7]),
    .o(_al_u690_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u691 (
    .a(bus_wdata[0]),
    .b(bus_wdata[1]),
    .c(bus_wdata[2]),
    .d(bus_wdata[3]),
    .o(_al_u691_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u692 (
    .a(_al_u690_o),
    .b(_al_u691_o),
    .o(_al_u692_o));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*~A)"),
    .INIT(8'h10))
    _al_u693 (
    .a(_al_u689_o),
    .b(_al_u692_o),
    .c(\u_cpu/alu_cmd [5]),
    .o(_al_u693_o));
  AL_MAP_LUT2 #(
    .EQN("(~B*~A)"),
    .INIT(4'h1))
    _al_u694 (
    .a(bus_wdata[0]),
    .b(\u_cpu/alu_in2 [0]),
    .o(_al_u694_o));
  AL_MAP_LUT4 #(
    .EQN("(~C*(~B*~(A)*~(D)+~B*A*~(D)+~(~B)*A*D+~B*A*D))"),
    .INIT(16'h0a03))
    _al_u695 (
    .a(_al_u694_o),
    .b(\u_cpu/alu_out3 [0]),
    .c(\u_cpu/alu_cmd [7]),
    .d(\u_cpu/alu_cmd [8]),
    .o(_al_u695_o));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(D*B*A))"),
    .INIT(16'h070f))
    _al_u696 (
    .a(_al_u689_o),
    .b(_al_u692_o),
    .c(_al_u695_o),
    .d(\u_cpu/alu_cmd [7]),
    .o(\u_cpu/u_alu/n56 [0]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(D*~(B*A)))"),
    .INIT(16'h080f))
    _al_u697 (
    .a(bus_wdata[0]),
    .b(\u_cpu/alu_in2 [0]),
    .c(\u_cpu/alu_cmd [5]),
    .d(\u_cpu/alu_cmd [6]),
    .o(_al_u697_o));
  AL_MAP_LUT4 #(
    .EQN("~(~A*~(C*~(~D*~B)))"),
    .INIT(16'hfaea))
    _al_u698 (
    .a(_al_u693_o),
    .b(\u_cpu/u_alu/n56 [0]),
    .c(_al_u697_o),
    .d(\u_cpu/alu_cmd [6]),
    .o(\u_cpu/u_alu/n58 [0]));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u699 (
    .a(_al_u686_o),
    .b(_al_u687_o),
    .c(\u_cpu/alu_cmd [9]),
    .o(_al_u699_o));
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    _al_u700 (
    .a(bus_wdata[0]),
    .b(\u_cpu/alu_in2 [0]),
    .o(_al_u700_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*A)"),
    .INIT(16'h0008))
    _al_u701 (
    .a(_al_u699_o),
    .b(_al_u700_o),
    .c(\u_cpu/alu_in2 [1]),
    .d(\u_cpu/alu_in2 [2]),
    .o(_al_u701_o));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u702 (
    .a(_al_u686_o),
    .b(_al_u687_o),
    .c(\u_cpu/alu_cmd [10]),
    .o(_al_u702_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'h0035))
    _al_u703 (
    .a(bus_wdata[0]),
    .b(bus_wdata[1]),
    .c(\u_cpu/alu_in2 [0]),
    .d(\u_cpu/alu_in2 [1]),
    .o(_al_u703_o));
  AL_MAP_LUT3 #(
    .EQN("(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C)"),
    .INIT(8'hca))
    _al_u704 (
    .a(bus_wdata[2]),
    .b(bus_wdata[3]),
    .c(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n2_lutinv ));
  AL_MAP_LUT4 #(
    .EQN("(~D*~A*~(C*~B))"),
    .INIT(16'h0045))
    _al_u705 (
    .a(_al_u703_o),
    .b(\u_cpu/u_alu/n2_lutinv ),
    .c(\u_cpu/alu_in2 [1]),
    .d(\u_cpu/alu_in2 [2]),
    .o(_al_u705_o));
  AL_MAP_LUT3 #(
    .EQN("(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C)"),
    .INIT(8'hca))
    _al_u706 (
    .a(bus_wdata[4]),
    .b(bus_wdata[5]),
    .c(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n0_lutinv ));
  AL_MAP_LUT3 #(
    .EQN("(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C)"),
    .INIT(8'hca))
    _al_u707 (
    .a(bus_wdata[6]),
    .b(bus_wdata[7]),
    .c(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n65_lutinv ));
  AL_MAP_LUT3 #(
    .EQN("~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C)"),
    .INIT(8'h35))
    _al_u708 (
    .a(\u_cpu/u_alu/n0_lutinv ),
    .b(\u_cpu/u_alu/n65_lutinv ),
    .c(\u_cpu/alu_in2 [1]),
    .o(_al_u708_o));
  AL_MAP_LUT4 #(
    .EQN("(A*~(~B*~(D*~C)))"),
    .INIT(16'h8a88))
    _al_u709 (
    .a(_al_u702_o),
    .b(_al_u705_o),
    .c(_al_u708_o),
    .d(\u_cpu/alu_in2 [2]),
    .o(_al_u709_o));
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    _al_u710 (
    .a(\u_cpu/alu_out4 [0]),
    .b(\u_cpu/alu_cmd [10]),
    .o(_al_u710_o));
  AL_MAP_LUT4 #(
    .EQN("~(~A*~(~D*~(~C*~B)))"),
    .INIT(16'haafe))
    _al_u711 (
    .a(_al_u701_o),
    .b(_al_u709_o),
    .c(_al_u710_o),
    .d(\u_cpu/alu_cmd [9]),
    .o(\u_cpu/u_alu/n70 [0]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C)"),
    .INIT(8'hac))
    _al_u712 (
    .a(bus_wdata[0]),
    .b(bus_wdata[1]),
    .c(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n29_lutinv ));
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    _al_u713 (
    .a(\u_cpu/u_alu/n29_lutinv ),
    .b(\u_cpu/alu_in2 [1]),
    .o(\u_cpu/u_alu/n21_lutinv ));
  AL_MAP_LUT3 #(
    .EQN("(~C*B*A)"),
    .INIT(8'h08))
    _al_u714 (
    .a(_al_u699_o),
    .b(\u_cpu/u_alu/n21_lutinv ),
    .c(\u_cpu/alu_in2 [2]),
    .o(_al_u714_o));
  AL_MAP_LUT3 #(
    .EQN("(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C)"),
    .INIT(8'hca))
    _al_u715 (
    .a(bus_wdata[5]),
    .b(bus_wdata[6]),
    .c(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n78_lutinv ));
  AL_MAP_LUT4 #(
    .EQN("~(A*~((~C*B))*~(D)+A*(~C*B)*~(D)+~(A)*(~C*B)*D+A*(~C*B)*D)"),
    .INIT(16'hf355))
    _al_u716 (
    .a(\u_cpu/u_alu/n78_lutinv ),
    .b(bus_wdata[7]),
    .c(\u_cpu/alu_in2 [0]),
    .d(\u_cpu/alu_in2 [1]),
    .o(_al_u716_o));
  AL_MAP_LUT3 #(
    .EQN("(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C)"),
    .INIT(8'hca))
    _al_u717 (
    .a(bus_wdata[3]),
    .b(bus_wdata[4]),
    .c(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n1_lutinv ));
  AL_MAP_LUT3 #(
    .EQN("(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C)"),
    .INIT(8'hca))
    _al_u718 (
    .a(bus_wdata[1]),
    .b(bus_wdata[2]),
    .c(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n51_lutinv ));
  AL_MAP_LUT3 #(
    .EQN("(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C)"),
    .INIT(8'hac))
    _al_u719 (
    .a(\u_cpu/u_alu/n1_lutinv ),
    .b(\u_cpu/u_alu/n51_lutinv ),
    .c(\u_cpu/alu_in2 [1]),
    .o(\u_cpu/u_alu/n62_lutinv ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(~C*~(B)*~(D)+~C*B*~(D)+~(~C)*B*D+~C*B*D))"),
    .INIT(16'h22a0))
    _al_u720 (
    .a(_al_u702_o),
    .b(_al_u716_o),
    .c(\u_cpu/u_alu/n62_lutinv ),
    .d(\u_cpu/alu_in2 [2]),
    .o(_al_u720_o));
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    _al_u721 (
    .a(\u_cpu/alu_out4 [1]),
    .b(\u_cpu/alu_cmd [10]),
    .o(_al_u721_o));
  AL_MAP_LUT4 #(
    .EQN("~(~A*~(~D*~(~C*~B)))"),
    .INIT(16'haafe))
    _al_u722 (
    .a(_al_u714_o),
    .b(_al_u720_o),
    .c(_al_u721_o),
    .d(\u_cpu/alu_cmd [9]),
    .o(\u_cpu/u_alu/n70 [1]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C)"),
    .INIT(8'hac))
    _al_u723 (
    .a(bus_wdata[1]),
    .b(bus_wdata[2]),
    .c(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n30_lutinv ));
  AL_MAP_LUT3 #(
    .EQN("~(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C)"),
    .INIT(8'h53))
    _al_u724 (
    .a(_al_u700_o),
    .b(\u_cpu/u_alu/n30_lutinv ),
    .c(\u_cpu/alu_in2 [1]),
    .o(_al_u724_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    _al_u725 (
    .a(_al_u699_o),
    .b(_al_u724_o),
    .c(\u_cpu/alu_in2 [2]),
    .o(_al_u725_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'h0035))
    _al_u726 (
    .a(\u_cpu/u_alu/n2_lutinv ),
    .b(\u_cpu/u_alu/n0_lutinv ),
    .c(\u_cpu/alu_in2 [1]),
    .d(\u_cpu/alu_in2 [2]),
    .o(_al_u726_o));
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    _al_u727 (
    .a(\u_cpu/u_alu/n65_lutinv ),
    .b(\u_cpu/alu_in2 [1]),
    .o(\u_cpu/u_alu/n76_lutinv ));
  AL_MAP_LUT4 #(
    .EQN("(~B*A*~(D*~C))"),
    .INIT(16'h2022))
    _al_u728 (
    .a(_al_u702_o),
    .b(_al_u726_o),
    .c(\u_cpu/u_alu/n76_lutinv ),
    .d(\u_cpu/alu_in2 [2]),
    .o(_al_u728_o));
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    _al_u729 (
    .a(\u_cpu/alu_out4 [2]),
    .b(\u_cpu/alu_cmd [10]),
    .o(_al_u729_o));
  AL_MAP_LUT4 #(
    .EQN("~(~A*~(~D*~(~C*~B)))"),
    .INIT(16'haafe))
    _al_u730 (
    .a(_al_u725_o),
    .b(_al_u728_o),
    .c(_al_u729_o),
    .d(\u_cpu/alu_cmd [9]),
    .o(\u_cpu/u_alu/n70 [2]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C)"),
    .INIT(8'hac))
    _al_u731 (
    .a(bus_wdata[2]),
    .b(bus_wdata[3]),
    .c(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n31_lutinv ));
  AL_MAP_LUT3 #(
    .EQN("~(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C)"),
    .INIT(8'h53))
    _al_u732 (
    .a(\u_cpu/u_alu/n29_lutinv ),
    .b(\u_cpu/u_alu/n31_lutinv ),
    .c(\u_cpu/alu_in2 [1]),
    .o(_al_u732_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    _al_u733 (
    .a(_al_u699_o),
    .b(_al_u732_o),
    .c(\u_cpu/alu_in2 [2]),
    .o(_al_u733_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    .INIT(16'h0053))
    _al_u734 (
    .a(\u_cpu/u_alu/n78_lutinv ),
    .b(\u_cpu/u_alu/n1_lutinv ),
    .c(\u_cpu/alu_in2 [1]),
    .d(\u_cpu/alu_in2 [2]),
    .o(_al_u734_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    _al_u735 (
    .a(bus_wdata[7]),
    .b(\u_cpu/alu_in2 [0]),
    .c(\u_cpu/alu_in2 [1]),
    .o(\u_cpu/u_alu/n75_lutinv ));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u736 (
    .a(\u_cpu/u_alu/n75_lutinv ),
    .b(\u_cpu/alu_in2 [2]),
    .o(_al_u736_o));
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    _al_u737 (
    .a(\u_cpu/alu_out4 [3]),
    .b(\u_cpu/alu_cmd [10]),
    .o(_al_u737_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(~C*~B*A))"),
    .INIT(16'h00fd))
    _al_u738 (
    .a(_al_u702_o),
    .b(_al_u734_o),
    .c(_al_u736_o),
    .d(_al_u737_o),
    .o(_al_u738_o));
  AL_MAP_LUT3 #(
    .EQN("~(~A*~(~C*~B))"),
    .INIT(8'hab))
    _al_u739 (
    .a(_al_u733_o),
    .b(_al_u738_o),
    .c(\u_cpu/alu_cmd [9]),
    .o(\u_cpu/u_alu/n70 [3]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B@A))"),
    .INIT(8'h90))
    _al_u740 (
    .a(bus_wdata[6]),
    .b(\u_cpu/alu_in2 [6]),
    .c(\u_cpu/alu_cmd [4]),
    .o(_al_u740_o));
  AL_MAP_LUT4 #(
    .EQN("(~(D@B)*~(C@A))"),
    .INIT(16'h8421))
    _al_u741 (
    .a(bus_wdata[2]),
    .b(bus_wdata[5]),
    .c(\u_cpu/alu_in2 [2]),
    .d(\u_cpu/alu_in2 [5]),
    .o(_al_u741_o));
  AL_MAP_LUT4 #(
    .EQN("(~(D@B)*~(C@A))"),
    .INIT(16'h8421))
    _al_u742 (
    .a(bus_wdata[3]),
    .b(bus_wdata[4]),
    .c(\u_cpu/alu_in2 [3]),
    .d(\u_cpu/alu_in2 [4]),
    .o(_al_u742_o));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u743 (
    .a(_al_u740_o),
    .b(_al_u741_o),
    .c(_al_u742_o),
    .o(_al_u743_o));
  AL_MAP_LUT4 #(
    .EQN("(~(D@B)*~(C@A))"),
    .INIT(16'h8421))
    _al_u744 (
    .a(bus_wdata[1]),
    .b(bus_wdata[7]),
    .c(\u_cpu/alu_in2 [1]),
    .d(\u_cpu/alu_in2 [7]),
    .o(_al_u744_o));
  AL_MAP_LUT4 #(
    .EQN("(B*A*~(D@C))"),
    .INIT(16'h8008))
    _al_u745 (
    .a(_al_u743_o),
    .b(_al_u744_o),
    .c(bus_wdata[0]),
    .d(\u_cpu/alu_in2 [0]),
    .o(_al_u745_o));
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    _al_u746 (
    .a(\u_cpu/alu_out2 [0]),
    .b(\u_cpu/alu_cmd [4]),
    .o(_al_u746_o));
  AL_MAP_LUT4 #(
    .EQN("(~(~B*~A)*~(C)*~(D)+~(~B*~A)*C*~(D)+~(~(~B*~A))*C*D+~(~B*~A)*C*D)"),
    .INIT(16'hf0ee))
    _al_u747 (
    .a(_al_u745_o),
    .b(_al_u746_o),
    .c(\u_cpu/u_alu/n35 ),
    .d(\u_cpu/alu_cmd [3]),
    .o(\u_cpu/u_alu/n38 [0]));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*~A)"),
    .INIT(16'h0100))
    _al_u748 (
    .a(\u_uart/u_uart_rx/clk_cnt [27]),
    .b(\u_uart/u_uart_rx/clk_cnt [28]),
    .c(\u_uart/u_uart_rx/clk_cnt [29]),
    .d(\u_uart/u_uart_rx/clk_cnt [3]),
    .o(_al_u748_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u749 (
    .a(\u_uart/u_uart_rx/clk_cnt [23]),
    .b(\u_uart/u_uart_rx/clk_cnt [24]),
    .c(\u_uart/u_uart_rx/clk_cnt [25]),
    .d(\u_uart/u_uart_rx/clk_cnt [26]),
    .o(_al_u749_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u750 (
    .a(\u_uart/u_uart_rx/clk_cnt [6]),
    .b(\u_uart/u_uart_rx/clk_cnt [7]),
    .c(\u_uart/u_uart_rx/clk_cnt [8]),
    .d(\u_uart/u_uart_rx/clk_cnt [9]),
    .o(_al_u750_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*~A)"),
    .INIT(16'h0010))
    _al_u751 (
    .a(\u_uart/u_uart_rx/clk_cnt [30]),
    .b(\u_uart/u_uart_rx/clk_cnt [31]),
    .c(\u_uart/u_uart_rx/clk_cnt [4]),
    .d(\u_uart/u_uart_rx/clk_cnt [5]),
    .o(_al_u751_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u752 (
    .a(_al_u748_o),
    .b(_al_u749_o),
    .c(_al_u750_o),
    .d(_al_u751_o),
    .o(_al_u752_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u753 (
    .a(\u_uart/u_uart_rx/clk_cnt [12]),
    .b(\u_uart/u_uart_rx/clk_cnt [13]),
    .c(\u_uart/u_uart_rx/clk_cnt [14]),
    .d(\u_uart/u_uart_rx/clk_cnt [15]),
    .o(_al_u753_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*~A)"),
    .INIT(16'h0004))
    _al_u754 (
    .a(\u_uart/u_uart_rx/clk_cnt [0]),
    .b(\u_uart/u_uart_rx/clk_cnt [1]),
    .c(\u_uart/u_uart_rx/clk_cnt [10]),
    .d(\u_uart/u_uart_rx/clk_cnt [11]),
    .o(_al_u754_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u755 (
    .a(\u_uart/u_uart_rx/clk_cnt [2]),
    .b(\u_uart/u_uart_rx/clk_cnt [20]),
    .c(\u_uart/u_uart_rx/clk_cnt [21]),
    .d(\u_uart/u_uart_rx/clk_cnt [22]),
    .o(_al_u755_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u756 (
    .a(\u_uart/u_uart_rx/clk_cnt [16]),
    .b(\u_uart/u_uart_rx/clk_cnt [17]),
    .c(\u_uart/u_uart_rx/clk_cnt [18]),
    .d(\u_uart/u_uart_rx/clk_cnt [19]),
    .o(_al_u756_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u757 (
    .a(_al_u753_o),
    .b(_al_u754_o),
    .c(_al_u755_o),
    .d(_al_u756_o),
    .o(_al_u757_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u758 (
    .a(_al_u752_o),
    .b(_al_u757_o),
    .o(\u_uart/u_uart_rx/n5 ));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*~A)"),
    .INIT(16'h0100))
    _al_u759 (
    .a(\u_uart/u_uart_tx/clk_cnt [27]),
    .b(\u_uart/u_uart_tx/clk_cnt [28]),
    .c(\u_uart/u_uart_tx/clk_cnt [29]),
    .d(\u_uart/u_uart_tx/clk_cnt [3]),
    .o(_al_u759_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u760 (
    .a(\u_uart/u_uart_tx/clk_cnt [23]),
    .b(\u_uart/u_uart_tx/clk_cnt [24]),
    .c(\u_uart/u_uart_tx/clk_cnt [25]),
    .d(\u_uart/u_uart_tx/clk_cnt [26]),
    .o(_al_u760_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u761 (
    .a(\u_uart/u_uart_tx/clk_cnt [6]),
    .b(\u_uart/u_uart_tx/clk_cnt [7]),
    .c(\u_uart/u_uart_tx/clk_cnt [8]),
    .d(\u_uart/u_uart_tx/clk_cnt [9]),
    .o(_al_u761_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*~A)"),
    .INIT(16'h0010))
    _al_u762 (
    .a(\u_uart/u_uart_tx/clk_cnt [30]),
    .b(\u_uart/u_uart_tx/clk_cnt [31]),
    .c(\u_uart/u_uart_tx/clk_cnt [4]),
    .d(\u_uart/u_uart_tx/clk_cnt [5]),
    .o(_al_u762_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u763 (
    .a(_al_u759_o),
    .b(_al_u760_o),
    .c(_al_u761_o),
    .d(_al_u762_o),
    .o(_al_u763_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u764 (
    .a(\u_uart/u_uart_tx/clk_cnt [12]),
    .b(\u_uart/u_uart_tx/clk_cnt [13]),
    .c(\u_uart/u_uart_tx/clk_cnt [14]),
    .d(\u_uart/u_uart_tx/clk_cnt [15]),
    .o(_al_u764_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*~A)"),
    .INIT(16'h0004))
    _al_u765 (
    .a(\u_uart/u_uart_tx/clk_cnt [0]),
    .b(\u_uart/u_uart_tx/clk_cnt [1]),
    .c(\u_uart/u_uart_tx/clk_cnt [10]),
    .d(\u_uart/u_uart_tx/clk_cnt [11]),
    .o(_al_u765_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u766 (
    .a(\u_uart/u_uart_tx/clk_cnt [2]),
    .b(\u_uart/u_uart_tx/clk_cnt [20]),
    .c(\u_uart/u_uart_tx/clk_cnt [21]),
    .d(\u_uart/u_uart_tx/clk_cnt [22]),
    .o(_al_u766_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u767 (
    .a(\u_uart/u_uart_tx/clk_cnt [16]),
    .b(\u_uart/u_uart_tx/clk_cnt [17]),
    .c(\u_uart/u_uart_tx/clk_cnt [18]),
    .d(\u_uart/u_uart_tx/clk_cnt [19]),
    .o(_al_u767_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u768 (
    .a(_al_u764_o),
    .b(_al_u765_o),
    .c(_al_u766_o),
    .d(_al_u767_o),
    .o(_al_u768_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u769 (
    .a(_al_u763_o),
    .b(_al_u768_o),
    .o(\u_uart/u_uart_tx/n0 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*A)"),
    .INIT(16'h0002))
    _al_u770 (
    .a(\u_vga/vsyn_cnt [3]),
    .b(\u_vga/vsyn_cnt [4]),
    .c(\u_vga/vsyn_cnt [5]),
    .d(\u_vga/vsyn_cnt [6]),
    .o(_al_u770_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*A)"),
    .INIT(16'h0200))
    _al_u771 (
    .a(_al_u770_o),
    .b(\u_vga/vsyn_cnt [7]),
    .c(\u_vga/vsyn_cnt [8]),
    .d(\u_vga/vsyn_cnt [9]),
    .o(_al_u771_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*~A)"),
    .INIT(16'h0100))
    _al_u772 (
    .a(\u_vga/vsyn_cnt [10]),
    .b(\u_vga/vsyn_cnt [11]),
    .c(\u_vga/vsyn_cnt [12]),
    .d(\u_vga/vsyn_cnt [2]),
    .o(_al_u772_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*A)"),
    .INIT(16'h0008))
    _al_u773 (
    .a(_al_u771_o),
    .b(_al_u772_o),
    .c(\u_vga/vsyn_cnt [0]),
    .d(\u_vga/vsyn_cnt [1]),
    .o(\u_vga/n3_lutinv ));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u774 (
    .a(\u_vga/n3_lutinv ),
    .b(\u_vga/n4 [9]),
    .o(\u_vga/n5 [9]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u775 (
    .a(\u_vga/n3_lutinv ),
    .b(\u_vga/n4 [8]),
    .o(\u_vga/n5 [8]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u776 (
    .a(\u_vga/n3_lutinv ),
    .b(\u_vga/n4 [7]),
    .o(\u_vga/n5 [7]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u777 (
    .a(\u_vga/n3_lutinv ),
    .b(\u_vga/n4 [6]),
    .o(\u_vga/n5 [6]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u778 (
    .a(\u_vga/n3_lutinv ),
    .b(\u_vga/n4 [5]),
    .o(\u_vga/n5 [5]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u779 (
    .a(\u_vga/n3_lutinv ),
    .b(\u_vga/n4 [4]),
    .o(\u_vga/n5 [4]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u780 (
    .a(\u_vga/n3_lutinv ),
    .b(\u_vga/n4 [3]),
    .o(\u_vga/n5 [3]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u781 (
    .a(\u_vga/n3_lutinv ),
    .b(\u_vga/n4 [2]),
    .o(\u_vga/n5 [2]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u782 (
    .a(\u_vga/n3_lutinv ),
    .b(\u_vga/n4 [12]),
    .o(\u_vga/n5 [12]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u783 (
    .a(\u_vga/n3_lutinv ),
    .b(\u_vga/n4 [11]),
    .o(\u_vga/n5 [11]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u784 (
    .a(\u_vga/n3_lutinv ),
    .b(\u_vga/n4 [10]),
    .o(\u_vga/n5 [10]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u785 (
    .a(\u_vga/n3_lutinv ),
    .b(\u_vga/n4 [1]),
    .o(\u_vga/n5 [1]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u786 (
    .a(\u_vga/n3_lutinv ),
    .b(\u_vga/n4 [0]),
    .o(\u_vga/n5 [0]));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*A)"),
    .INIT(16'h0800))
    _al_u787 (
    .a(_al_u686_o),
    .b(_al_u687_o),
    .c(\u_cpu/alu_in2 [2]),
    .d(\u_cpu/alu_cmd [10]),
    .o(_al_u787_o));
  AL_MAP_LUT4 #(
    .EQN("(~(~D*C)*~(B*A))"),
    .INIT(16'h7707))
    _al_u788 (
    .a(_al_u787_o),
    .b(\u_cpu/u_alu/n75_lutinv ),
    .c(\u_cpu/alu_out4 [7]),
    .d(\u_cpu/alu_cmd [10]),
    .o(_al_u788_o));
  AL_MAP_LUT3 #(
    .EQN("(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C)"),
    .INIT(8'hac))
    _al_u789 (
    .a(bus_wdata[4]),
    .b(bus_wdata[5]),
    .c(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n33_lutinv ));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u790 (
    .a(\u_cpu/u_alu/n33_lutinv ),
    .b(\u_cpu/alu_in2 [1]),
    .o(_al_u790_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    .INIT(16'h0053))
    _al_u791 (
    .a(bus_wdata[6]),
    .b(bus_wdata[7]),
    .c(\u_cpu/alu_in2 [0]),
    .d(\u_cpu/alu_in2 [1]),
    .o(_al_u791_o));
  AL_MAP_LUT4 #(
    .EQN("(~(~C*~B)*~(A)*~(D)+~(~C*~B)*A*~(D)+~(~(~C*~B))*A*D+~(~C*~B)*A*D)"),
    .INIT(16'haafc))
    _al_u792 (
    .a(_al_u732_o),
    .b(_al_u790_o),
    .c(_al_u791_o),
    .d(\u_cpu/alu_in2 [2]),
    .o(_al_u792_o));
  AL_MAP_LUT4 #(
    .EQN("~(~(C*~B)*~(~D*~A))"),
    .INIT(16'h3075))
    _al_u793 (
    .a(_al_u788_o),
    .b(_al_u792_o),
    .c(_al_u699_o),
    .d(\u_cpu/alu_cmd [9]),
    .o(\u_cpu/u_alu/n70 [7]));
  AL_MAP_LUT4 #(
    .EQN("(~(~D*C)*~(B*A))"),
    .INIT(16'h7707))
    _al_u794 (
    .a(\u_cpu/u_alu/n76_lutinv ),
    .b(_al_u787_o),
    .c(\u_cpu/alu_out4 [6]),
    .d(\u_cpu/alu_cmd [10]),
    .o(_al_u794_o));
  AL_MAP_LUT3 #(
    .EQN("(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C)"),
    .INIT(8'hac))
    _al_u795 (
    .a(bus_wdata[3]),
    .b(bus_wdata[4]),
    .c(\u_cpu/alu_in2 [0]),
    .o(\u_cpu/u_alu/n32_lutinv ));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u796 (
    .a(\u_cpu/u_alu/n32_lutinv ),
    .b(\u_cpu/alu_in2 [1]),
    .o(_al_u796_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    .INIT(16'h00ac))
    _al_u797 (
    .a(bus_wdata[5]),
    .b(bus_wdata[6]),
    .c(\u_cpu/alu_in2 [0]),
    .d(\u_cpu/alu_in2 [1]),
    .o(_al_u797_o));
  AL_MAP_LUT4 #(
    .EQN("~((~C*~B)*~(A)*~(D)+(~C*~B)*A*~(D)+~((~C*~B))*A*D+(~C*~B)*A*D)"),
    .INIT(16'h55fc))
    _al_u798 (
    .a(_al_u724_o),
    .b(_al_u796_o),
    .c(_al_u797_o),
    .d(\u_cpu/alu_in2 [2]),
    .o(\u_cpu/u_alu/n16_lutinv ));
  AL_MAP_LUT4 #(
    .EQN("~(~(C*B)*~(~D*~A))"),
    .INIT(16'hc0d5))
    _al_u799 (
    .a(_al_u794_o),
    .b(\u_cpu/u_alu/n16_lutinv ),
    .c(_al_u699_o),
    .d(\u_cpu/alu_cmd [9]),
    .o(\u_cpu/u_alu/n70 [6]));
  AL_MAP_LUT4 #(
    .EQN("(~(~D*C)*~(B*~A))"),
    .INIT(16'hbb0b))
    _al_u800 (
    .a(_al_u716_o),
    .b(_al_u787_o),
    .c(\u_cpu/alu_out4 [5]),
    .d(\u_cpu/alu_cmd [10]),
    .o(_al_u800_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    .INIT(16'h0053))
    _al_u801 (
    .a(\u_cpu/u_alu/n31_lutinv ),
    .b(\u_cpu/u_alu/n33_lutinv ),
    .c(\u_cpu/alu_in2 [1]),
    .d(\u_cpu/alu_in2 [2]),
    .o(_al_u801_o));
  AL_MAP_LUT4 #(
    .EQN("(~C*A*~(D*~B))"),
    .INIT(16'h080a))
    _al_u802 (
    .a(_al_u699_o),
    .b(\u_cpu/u_alu/n21_lutinv ),
    .c(_al_u801_o),
    .d(\u_cpu/alu_in2 [2]),
    .o(_al_u802_o));
  AL_MAP_LUT3 #(
    .EQN("~(~B*~(~C*~A))"),
    .INIT(8'hcd))
    _al_u803 (
    .a(_al_u800_o),
    .b(_al_u802_o),
    .c(\u_cpu/alu_cmd [9]),
    .o(\u_cpu/u_alu/n70 [5]));
  AL_MAP_LUT4 #(
    .EQN("(~(~D*C)*~(B*~A))"),
    .INIT(16'hbb0b))
    _al_u804 (
    .a(_al_u708_o),
    .b(_al_u787_o),
    .c(\u_cpu/alu_out4 [4]),
    .d(\u_cpu/alu_cmd [10]),
    .o(_al_u804_o));
  AL_MAP_LUT4 #(
    .EQN("(A*~(D*~(~C*B)))"),
    .INIT(16'h08aa))
    _al_u805 (
    .a(_al_u699_o),
    .b(_al_u700_o),
    .c(\u_cpu/alu_in2 [1]),
    .d(\u_cpu/alu_in2 [2]),
    .o(_al_u805_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    .INIT(16'h0053))
    _al_u806 (
    .a(\u_cpu/u_alu/n30_lutinv ),
    .b(\u_cpu/u_alu/n32_lutinv ),
    .c(\u_cpu/alu_in2 [1]),
    .d(\u_cpu/alu_in2 [2]),
    .o(_al_u806_o));
  AL_MAP_LUT4 #(
    .EQN("~(~(~C*B)*~(~D*~A))"),
    .INIT(16'h0c5d))
    _al_u807 (
    .a(_al_u804_o),
    .b(_al_u805_o),
    .c(_al_u806_o),
    .d(\u_cpu/alu_cmd [9]),
    .o(\u_cpu/u_alu/n70 [4]));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u808 (
    .a(_al_u395_o),
    .b(_al_u396_o),
    .c(led_pad),
    .o(\u_bus/sel1_b0/B3 ));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u809 (
    .a(_al_u396_o),
    .b(_al_u394_o),
    .c(bus_raddr[1]),
    .d(vram_rdata),
    .o(\u_bus/sel1_b0/B1 ));
  AL_MAP_LUT4 #(
    .EQN("~(~C*~B*~(D*A))"),
    .INIT(16'hfefc))
    _al_u810 (
    .a(\u_bus/n1_lutinv ),
    .b(\u_bus/sel1_b0/B3 ),
    .c(\u_bus/sel1_b0/B1 ),
    .d(key_deb[0]),
    .o(\u_bus/n15 [0]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u811 (
    .a(\u_uart/u_uart_rx/n5 ),
    .b(\u_uart/u_uart_rx/n7 [3]),
    .o(\u_uart/u_uart_rx/n8 [3]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u812 (
    .a(\u_uart/u_uart_rx/n5 ),
    .b(\u_uart/u_uart_rx/n7 [2]),
    .o(\u_uart/u_uart_rx/n8 [2]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u813 (
    .a(\u_uart/u_uart_rx/n5 ),
    .b(\u_uart/u_uart_rx/n7 [0]),
    .o(\u_uart/u_uart_rx/n8 [0]));
  AL_MAP_LUT4 #(
    .EQN("(~(D@B)*~(C@A))"),
    .INIT(16'h8421))
    _al_u814 (
    .a(bus_raddr[2]),
    .b(bus_raddr[3]),
    .c(ram_waddr[2]),
    .d(ram_waddr[3]),
    .o(_al_u814_o));
  AL_MAP_LUT4 #(
    .EQN("(~(D@B)*~(C@A))"),
    .INIT(16'h8421))
    _al_u815 (
    .a(bus_raddr[5]),
    .b(bus_raddr[7]),
    .c(ram_waddr[5]),
    .d(ram_waddr[7]),
    .o(_al_u815_o));
  AL_MAP_LUT4 #(
    .EQN("(~(D@B)*~(C@A))"),
    .INIT(16'h8421))
    _al_u816 (
    .a(bus_raddr[1]),
    .b(bus_raddr[6]),
    .c(ram_waddr[1]),
    .d(ram_waddr[6]),
    .o(_al_u816_o));
  AL_MAP_LUT4 #(
    .EQN("(~(D@B)*~(C@A))"),
    .INIT(16'h8421))
    _al_u817 (
    .a(bus_raddr[0]),
    .b(bus_raddr[4]),
    .c(ram_waddr[0]),
    .d(ram_waddr[4]),
    .o(_al_u817_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u818 (
    .a(_al_u814_o),
    .b(_al_u815_o),
    .c(_al_u816_o),
    .d(_al_u817_o),
    .o(\u_cpu/u_execute/n0_lutinv ));
  AL_MAP_LUT4 #(
    .EQN("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .INIT(16'h084c))
    _al_u819 (
    .a(\u_cpu/u_execute/n0_lutinv ),
    .b(\u_cpu/u_execute/ram_to_c_wen ),
    .c(ram_wdata[7]),
    .d(ram_rdata[7]),
    .o(_al_u819_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~A*~(~C*~B))"),
    .INIT(16'h0054))
    _al_u820 (
    .a(\u_cpu/u_execute/bus_to_c_wen ),
    .b(\u_cpu/u_execute/ram_to_c_wen ),
    .c(\u_cpu/u_execute/C [7]),
    .d(\u_cpu/u_execute/rom_to_c_wen ),
    .o(_al_u820_o));
  AL_MAP_LUT4 #(
    .EQN("~(~(D*C)*~(B*~A))"),
    .INIT(16'hf444))
    _al_u821 (
    .a(_al_u819_o),
    .b(_al_u820_o),
    .c(\u_cpu/u_execute/rom_data [7]),
    .d(\u_cpu/u_execute/rom_to_c_wen ),
    .o(\u_cpu/u_execute/n17 [7]));
  AL_MAP_LUT4 #(
    .EQN("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .INIT(16'h084c))
    _al_u822 (
    .a(\u_cpu/u_execute/n0_lutinv ),
    .b(\u_cpu/u_execute/ram_to_b_wen ),
    .c(ram_wdata[7]),
    .d(ram_rdata[7]),
    .o(_al_u822_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~A*~(~C*~B))"),
    .INIT(16'h0054))
    _al_u823 (
    .a(\u_cpu/u_execute/bus_to_b_wen ),
    .b(\u_cpu/u_execute/ram_to_b_wen ),
    .c(\u_cpu/alu_in2 [7]),
    .d(\u_cpu/u_execute/rom_to_b_wen ),
    .o(_al_u823_o));
  AL_MAP_LUT4 #(
    .EQN("~(~(D*C)*~(B*~A))"),
    .INIT(16'hf444))
    _al_u824 (
    .a(_al_u822_o),
    .b(_al_u823_o),
    .c(\u_cpu/u_execute/rom_data [7]),
    .d(\u_cpu/u_execute/rom_to_b_wen ),
    .o(\u_cpu/u_execute/n7 [7]));
  AL_MAP_LUT4 #(
    .EQN("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .INIT(16'h084c))
    _al_u825 (
    .a(\u_cpu/u_execute/n0_lutinv ),
    .b(\u_cpu/u_execute/ram_to_a_wen ),
    .c(ram_wdata[7]),
    .d(ram_rdata[7]),
    .o(_al_u825_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~A*~(~C*~B))"),
    .INIT(16'h0054))
    _al_u826 (
    .a(\u_cpu/u_execute/bus_to_a_wen ),
    .b(\u_cpu/u_execute/ram_to_a_wen ),
    .c(bus_wdata[7]),
    .d(\u_cpu/u_execute/rom_to_a_wen ),
    .o(_al_u826_o));
  AL_MAP_LUT4 #(
    .EQN("~(~(D*C)*~(B*~A))"),
    .INIT(16'hf444))
    _al_u827 (
    .a(_al_u825_o),
    .b(_al_u826_o),
    .c(\u_cpu/u_execute/rom_data [7]),
    .d(\u_cpu/u_execute/rom_to_a_wen ),
    .o(\u_cpu/u_execute/n4 [7]));
  AL_MAP_LUT4 #(
    .EQN("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .INIT(16'h084c))
    _al_u828 (
    .a(\u_cpu/u_execute/n0_lutinv ),
    .b(\u_cpu/u_execute/ram_to_d_wen ),
    .c(ram_wdata[7]),
    .d(ram_rdata[7]),
    .o(_al_u828_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~A*~(~C*~B))"),
    .INIT(16'h0054))
    _al_u829 (
    .a(\u_cpu/u_execute/bus_to_d_wen ),
    .b(\u_cpu/u_execute/ram_to_d_wen ),
    .c(bus_raddr[7]),
    .d(\u_cpu/u_execute/rom_to_d_wen ),
    .o(_al_u829_o));
  AL_MAP_LUT4 #(
    .EQN("~(~(D*C)*~(B*~A))"),
    .INIT(16'hf444))
    _al_u830 (
    .a(_al_u828_o),
    .b(_al_u829_o),
    .c(\u_cpu/u_execute/rom_data [7]),
    .d(\u_cpu/u_execute/rom_to_d_wen ),
    .o(\u_cpu/u_execute/n29 [7]));
  AL_MAP_LUT4 #(
    .EQN("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .INIT(16'h084c))
    _al_u831 (
    .a(\u_cpu/u_execute/n0_lutinv ),
    .b(\u_cpu/u_execute/ram_to_c_wen ),
    .c(ram_wdata[6]),
    .d(ram_rdata[6]),
    .o(_al_u831_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~A*~(~C*~B))"),
    .INIT(16'h0054))
    _al_u832 (
    .a(\u_cpu/u_execute/bus_to_c_wen ),
    .b(\u_cpu/u_execute/ram_to_c_wen ),
    .c(\u_cpu/u_execute/C [6]),
    .d(\u_cpu/u_execute/rom_to_c_wen ),
    .o(_al_u832_o));
  AL_MAP_LUT4 #(
    .EQN("~(~(D*C)*~(B*~A))"),
    .INIT(16'hf444))
    _al_u833 (
    .a(_al_u831_o),
    .b(_al_u832_o),
    .c(\u_cpu/u_execute/rom_data [6]),
    .d(\u_cpu/u_execute/rom_to_c_wen ),
    .o(\u_cpu/u_execute/n17 [6]));
  AL_MAP_LUT4 #(
    .EQN("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .INIT(16'h084c))
    _al_u834 (
    .a(\u_cpu/u_execute/n0_lutinv ),
    .b(\u_cpu/u_execute/ram_to_b_wen ),
    .c(ram_wdata[6]),
    .d(ram_rdata[6]),
    .o(_al_u834_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~A*~(~C*~B))"),
    .INIT(16'h0054))
    _al_u835 (
    .a(\u_cpu/u_execute/bus_to_b_wen ),
    .b(\u_cpu/u_execute/ram_to_b_wen ),
    .c(\u_cpu/alu_in2 [6]),
    .d(\u_cpu/u_execute/rom_to_b_wen ),
    .o(_al_u835_o));
  AL_MAP_LUT4 #(
    .EQN("~(~(D*C)*~(B*~A))"),
    .INIT(16'hf444))
    _al_u836 (
    .a(_al_u834_o),
    .b(_al_u835_o),
    .c(\u_cpu/u_execute/rom_data [6]),
    .d(\u_cpu/u_execute/rom_to_b_wen ),
    .o(\u_cpu/u_execute/n7 [6]));
  AL_MAP_LUT4 #(
    .EQN("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .INIT(16'h084c))
    _al_u837 (
    .a(\u_cpu/u_execute/n0_lutinv ),
    .b(\u_cpu/u_execute/ram_to_a_wen ),
    .c(ram_wdata[6]),
    .d(ram_rdata[6]),
    .o(_al_u837_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~A*~(~C*~B))"),
    .INIT(16'h0054))
    _al_u838 (
    .a(\u_cpu/u_execute/bus_to_a_wen ),
    .b(\u_cpu/u_execute/ram_to_a_wen ),
    .c(bus_wdata[6]),
    .d(\u_cpu/u_execute/rom_to_a_wen ),
    .o(_al_u838_o));
  AL_MAP_LUT4 #(
    .EQN("~(~(D*C)*~(B*~A))"),
    .INIT(16'hf444))
    _al_u839 (
    .a(_al_u837_o),
    .b(_al_u838_o),
    .c(\u_cpu/u_execute/rom_data [6]),
    .d(\u_cpu/u_execute/rom_to_a_wen ),
    .o(\u_cpu/u_execute/n4 [6]));
  AL_MAP_LUT4 #(
    .EQN("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .INIT(16'h084c))
    _al_u840 (
    .a(\u_cpu/u_execute/n0_lutinv ),
    .b(\u_cpu/u_execute/ram_to_d_wen ),
    .c(ram_wdata[6]),
    .d(ram_rdata[6]),
    .o(_al_u840_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~A*~(~C*~B))"),
    .INIT(16'h0054))
    _al_u841 (
    .a(\u_cpu/u_execute/bus_to_d_wen ),
    .b(\u_cpu/u_execute/ram_to_d_wen ),
    .c(bus_raddr[6]),
    .d(\u_cpu/u_execute/rom_to_d_wen ),
    .o(_al_u841_o));
  AL_MAP_LUT4 #(
    .EQN("~(~(D*C)*~(B*~A))"),
    .INIT(16'hf444))
    _al_u842 (
    .a(_al_u840_o),
    .b(_al_u841_o),
    .c(\u_cpu/u_execute/rom_data [6]),
    .d(\u_cpu/u_execute/rom_to_d_wen ),
    .o(\u_cpu/u_execute/n29 [6]));
  AL_MAP_LUT3 #(
    .EQN("~(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'h27))
    _al_u843 (
    .a(\u_cpu/u_execute/n0_lutinv ),
    .b(ram_wdata[5]),
    .c(ram_rdata[5]),
    .o(_al_u843_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~A*~(~C*~B))"),
    .INIT(16'h0054))
    _al_u844 (
    .a(\u_cpu/u_execute/bus_to_c_wen ),
    .b(\u_cpu/u_execute/ram_to_c_wen ),
    .c(\u_cpu/u_execute/C [5]),
    .d(\u_cpu/u_execute/rom_to_c_wen ),
    .o(_al_u844_o));
  AL_MAP_LUT4 #(
    .EQN("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    .INIT(16'h0f77))
    _al_u845 (
    .a(bus_rdata[5]),
    .b(\u_cpu/u_execute/bus_to_c_wen ),
    .c(\u_cpu/u_execute/rom_data [5]),
    .d(\u_cpu/u_execute/rom_to_c_wen ),
    .o(_al_u845_o));
  AL_MAP_LUT4 #(
    .EQN("~(C*~(B*~(D*A)))"),
    .INIT(16'h4fcf))
    _al_u846 (
    .a(_al_u843_o),
    .b(_al_u844_o),
    .c(_al_u845_o),
    .d(\u_cpu/u_execute/ram_to_c_wen ),
    .o(\u_cpu/u_execute/n17 [5]));
  AL_MAP_LUT4 #(
    .EQN("(~D*~A*~(~C*~B))"),
    .INIT(16'h0054))
    _al_u847 (
    .a(\u_cpu/u_execute/bus_to_b_wen ),
    .b(\u_cpu/u_execute/ram_to_b_wen ),
    .c(\u_cpu/alu_in2 [5]),
    .d(\u_cpu/u_execute/rom_to_b_wen ),
    .o(_al_u847_o));
  AL_MAP_LUT4 #(
    .EQN("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    .INIT(16'h0f77))
    _al_u848 (
    .a(bus_rdata[5]),
    .b(\u_cpu/u_execute/bus_to_b_wen ),
    .c(\u_cpu/u_execute/rom_data [5]),
    .d(\u_cpu/u_execute/rom_to_b_wen ),
    .o(_al_u848_o));
  AL_MAP_LUT4 #(
    .EQN("~(C*~(B*~(D*A)))"),
    .INIT(16'h4fcf))
    _al_u849 (
    .a(_al_u843_o),
    .b(_al_u847_o),
    .c(_al_u848_o),
    .d(\u_cpu/u_execute/ram_to_b_wen ),
    .o(\u_cpu/u_execute/n7 [5]));
  AL_MAP_LUT4 #(
    .EQN("(~D*~A*~(~C*~B))"),
    .INIT(16'h0054))
    _al_u850 (
    .a(\u_cpu/u_execute/bus_to_a_wen ),
    .b(\u_cpu/u_execute/ram_to_a_wen ),
    .c(bus_wdata[5]),
    .d(\u_cpu/u_execute/rom_to_a_wen ),
    .o(_al_u850_o));
  AL_MAP_LUT4 #(
    .EQN("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    .INIT(16'h0f77))
    _al_u851 (
    .a(bus_rdata[5]),
    .b(\u_cpu/u_execute/bus_to_a_wen ),
    .c(\u_cpu/u_execute/rom_data [5]),
    .d(\u_cpu/u_execute/rom_to_a_wen ),
    .o(_al_u851_o));
  AL_MAP_LUT4 #(
    .EQN("~(C*~(B*~(D*A)))"),
    .INIT(16'h4fcf))
    _al_u852 (
    .a(_al_u843_o),
    .b(_al_u850_o),
    .c(_al_u851_o),
    .d(\u_cpu/u_execute/ram_to_a_wen ),
    .o(\u_cpu/u_execute/n4 [5]));
  AL_MAP_LUT4 #(
    .EQN("(~D*~A*~(~C*~B))"),
    .INIT(16'h0054))
    _al_u853 (
    .a(\u_cpu/u_execute/bus_to_d_wen ),
    .b(\u_cpu/u_execute/ram_to_d_wen ),
    .c(bus_raddr[5]),
    .d(\u_cpu/u_execute/rom_to_d_wen ),
    .o(_al_u853_o));
  AL_MAP_LUT4 #(
    .EQN("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    .INIT(16'h0f77))
    _al_u854 (
    .a(bus_rdata[5]),
    .b(\u_cpu/u_execute/bus_to_d_wen ),
    .c(\u_cpu/u_execute/rom_data [5]),
    .d(\u_cpu/u_execute/rom_to_d_wen ),
    .o(_al_u854_o));
  AL_MAP_LUT4 #(
    .EQN("~(C*~(B*~(D*A)))"),
    .INIT(16'h4fcf))
    _al_u855 (
    .a(_al_u843_o),
    .b(_al_u853_o),
    .c(_al_u854_o),
    .d(\u_cpu/u_execute/ram_to_d_wen ),
    .o(\u_cpu/u_execute/n29 [5]));
  AL_MAP_LUT4 #(
    .EQN("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .INIT(16'h084c))
    _al_u856 (
    .a(\u_cpu/u_execute/n0_lutinv ),
    .b(\u_cpu/u_execute/ram_to_c_wen ),
    .c(ram_wdata[4]),
    .d(ram_rdata[4]),
    .o(_al_u856_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*~B))"),
    .INIT(8'h54))
    _al_u857 (
    .a(\u_cpu/u_execute/bus_to_c_wen ),
    .b(\u_cpu/u_execute/ram_to_c_wen ),
    .c(\u_cpu/u_execute/C [4]),
    .o(_al_u857_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~(B*A))"),
    .INIT(8'h07))
    _al_u858 (
    .a(bus_rdata[4]),
    .b(\u_cpu/u_execute/bus_to_c_wen ),
    .c(\u_cpu/u_execute/rom_to_c_wen ),
    .o(_al_u858_o));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u859 (
    .a(\u_cpu/u_execute/rom_data [4]),
    .b(\u_cpu/u_execute/rom_to_c_wen ),
    .o(_al_u859_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~(B*~A)))"),
    .INIT(16'h004f))
    _al_u860 (
    .a(_al_u856_o),
    .b(_al_u857_o),
    .c(_al_u858_o),
    .d(_al_u859_o),
    .o(\u_cpu/u_execute/n17 [4]));
  AL_MAP_LUT4 #(
    .EQN("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .INIT(16'h084c))
    _al_u861 (
    .a(\u_cpu/u_execute/n0_lutinv ),
    .b(\u_cpu/u_execute/ram_to_b_wen ),
    .c(ram_wdata[4]),
    .d(ram_rdata[4]),
    .o(_al_u861_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*~B))"),
    .INIT(8'h54))
    _al_u862 (
    .a(\u_cpu/u_execute/bus_to_b_wen ),
    .b(\u_cpu/u_execute/ram_to_b_wen ),
    .c(\u_cpu/alu_in2 [4]),
    .o(_al_u862_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~(B*A))"),
    .INIT(8'h07))
    _al_u863 (
    .a(bus_rdata[4]),
    .b(\u_cpu/u_execute/bus_to_b_wen ),
    .c(\u_cpu/u_execute/rom_to_b_wen ),
    .o(_al_u863_o));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u864 (
    .a(\u_cpu/u_execute/rom_data [4]),
    .b(\u_cpu/u_execute/rom_to_b_wen ),
    .o(_al_u864_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~(B*~A)))"),
    .INIT(16'h004f))
    _al_u865 (
    .a(_al_u861_o),
    .b(_al_u862_o),
    .c(_al_u863_o),
    .d(_al_u864_o),
    .o(\u_cpu/u_execute/n7 [4]));
  AL_MAP_LUT4 #(
    .EQN("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .INIT(16'h084c))
    _al_u866 (
    .a(\u_cpu/u_execute/n0_lutinv ),
    .b(\u_cpu/u_execute/ram_to_a_wen ),
    .c(ram_wdata[4]),
    .d(ram_rdata[4]),
    .o(_al_u866_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~A*~(~C*~B))"),
    .INIT(16'h0054))
    _al_u867 (
    .a(\u_cpu/u_execute/bus_to_a_wen ),
    .b(\u_cpu/u_execute/ram_to_a_wen ),
    .c(bus_wdata[4]),
    .d(\u_cpu/u_execute/rom_to_a_wen ),
    .o(_al_u867_o));
  AL_MAP_LUT4 #(
    .EQN("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    .INIT(16'h0f77))
    _al_u868 (
    .a(bus_rdata[4]),
    .b(\u_cpu/u_execute/bus_to_a_wen ),
    .c(\u_cpu/u_execute/rom_data [4]),
    .d(\u_cpu/u_execute/rom_to_a_wen ),
    .o(_al_u868_o));
  AL_MAP_LUT3 #(
    .EQN("~(C*~(B*~A))"),
    .INIT(8'h4f))
    _al_u869 (
    .a(_al_u866_o),
    .b(_al_u867_o),
    .c(_al_u868_o),
    .o(\u_cpu/u_execute/n4 [4]));
  AL_MAP_LUT4 #(
    .EQN("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .INIT(16'h084c))
    _al_u870 (
    .a(\u_cpu/u_execute/n0_lutinv ),
    .b(\u_cpu/u_execute/ram_to_d_wen ),
    .c(ram_wdata[4]),
    .d(ram_rdata[4]),
    .o(_al_u870_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*~B))"),
    .INIT(8'h54))
    _al_u871 (
    .a(\u_cpu/u_execute/bus_to_d_wen ),
    .b(\u_cpu/u_execute/ram_to_d_wen ),
    .c(bus_raddr[4]),
    .o(_al_u871_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~(B*A))"),
    .INIT(8'h07))
    _al_u872 (
    .a(bus_rdata[4]),
    .b(\u_cpu/u_execute/bus_to_d_wen ),
    .c(\u_cpu/u_execute/rom_to_d_wen ),
    .o(_al_u872_o));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u873 (
    .a(\u_cpu/u_execute/rom_data [4]),
    .b(\u_cpu/u_execute/rom_to_d_wen ),
    .o(_al_u873_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~(B*~A)))"),
    .INIT(16'h004f))
    _al_u874 (
    .a(_al_u870_o),
    .b(_al_u871_o),
    .c(_al_u872_o),
    .d(_al_u873_o),
    .o(\u_cpu/u_execute/n29 [4]));
  AL_MAP_LUT3 #(
    .EQN("~(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'h27))
    _al_u875 (
    .a(\u_cpu/u_execute/n0_lutinv ),
    .b(ram_wdata[3]),
    .c(ram_rdata[3]),
    .o(_al_u875_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~A*~(~C*~B))"),
    .INIT(16'h0054))
    _al_u876 (
    .a(\u_cpu/u_execute/bus_to_c_wen ),
    .b(\u_cpu/u_execute/ram_to_c_wen ),
    .c(\u_cpu/u_execute/C [3]),
    .d(\u_cpu/u_execute/rom_to_c_wen ),
    .o(_al_u876_o));
  AL_MAP_LUT4 #(
    .EQN("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    .INIT(16'h0f77))
    _al_u877 (
    .a(bus_rdata[3]),
    .b(\u_cpu/u_execute/bus_to_c_wen ),
    .c(\u_cpu/u_execute/rom_data [3]),
    .d(\u_cpu/u_execute/rom_to_c_wen ),
    .o(_al_u877_o));
  AL_MAP_LUT4 #(
    .EQN("~(C*~(B*~(D*A)))"),
    .INIT(16'h4fcf))
    _al_u878 (
    .a(_al_u875_o),
    .b(_al_u876_o),
    .c(_al_u877_o),
    .d(\u_cpu/u_execute/ram_to_c_wen ),
    .o(\u_cpu/u_execute/n17 [3]));
  AL_MAP_LUT4 #(
    .EQN("(~D*~A*~(~C*~B))"),
    .INIT(16'h0054))
    _al_u879 (
    .a(\u_cpu/u_execute/bus_to_b_wen ),
    .b(\u_cpu/u_execute/ram_to_b_wen ),
    .c(\u_cpu/alu_in2 [3]),
    .d(\u_cpu/u_execute/rom_to_b_wen ),
    .o(_al_u879_o));
  AL_MAP_LUT4 #(
    .EQN("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    .INIT(16'h0f77))
    _al_u880 (
    .a(bus_rdata[3]),
    .b(\u_cpu/u_execute/bus_to_b_wen ),
    .c(\u_cpu/u_execute/rom_data [3]),
    .d(\u_cpu/u_execute/rom_to_b_wen ),
    .o(_al_u880_o));
  AL_MAP_LUT4 #(
    .EQN("~(C*~(B*~(D*A)))"),
    .INIT(16'h4fcf))
    _al_u881 (
    .a(_al_u875_o),
    .b(_al_u879_o),
    .c(_al_u880_o),
    .d(\u_cpu/u_execute/ram_to_b_wen ),
    .o(\u_cpu/u_execute/n7 [3]));
  AL_MAP_LUT4 #(
    .EQN("(~D*~A*~(~C*~B))"),
    .INIT(16'h0054))
    _al_u882 (
    .a(\u_cpu/u_execute/bus_to_a_wen ),
    .b(\u_cpu/u_execute/ram_to_a_wen ),
    .c(bus_wdata[3]),
    .d(\u_cpu/u_execute/rom_to_a_wen ),
    .o(_al_u882_o));
  AL_MAP_LUT4 #(
    .EQN("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    .INIT(16'h0f77))
    _al_u883 (
    .a(bus_rdata[3]),
    .b(\u_cpu/u_execute/bus_to_a_wen ),
    .c(\u_cpu/u_execute/rom_data [3]),
    .d(\u_cpu/u_execute/rom_to_a_wen ),
    .o(_al_u883_o));
  AL_MAP_LUT4 #(
    .EQN("~(C*~(B*~(D*A)))"),
    .INIT(16'h4fcf))
    _al_u884 (
    .a(_al_u875_o),
    .b(_al_u882_o),
    .c(_al_u883_o),
    .d(\u_cpu/u_execute/ram_to_a_wen ),
    .o(\u_cpu/u_execute/n4 [3]));
  AL_MAP_LUT4 #(
    .EQN("(~D*~A*~(~C*~B))"),
    .INIT(16'h0054))
    _al_u885 (
    .a(\u_cpu/u_execute/bus_to_d_wen ),
    .b(\u_cpu/u_execute/ram_to_d_wen ),
    .c(bus_raddr[3]),
    .d(\u_cpu/u_execute/rom_to_d_wen ),
    .o(_al_u885_o));
  AL_MAP_LUT4 #(
    .EQN("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    .INIT(16'h0f77))
    _al_u886 (
    .a(bus_rdata[3]),
    .b(\u_cpu/u_execute/bus_to_d_wen ),
    .c(\u_cpu/u_execute/rom_data [3]),
    .d(\u_cpu/u_execute/rom_to_d_wen ),
    .o(_al_u886_o));
  AL_MAP_LUT4 #(
    .EQN("~(C*~(B*~(D*A)))"),
    .INIT(16'h4fcf))
    _al_u887 (
    .a(_al_u875_o),
    .b(_al_u885_o),
    .c(_al_u886_o),
    .d(\u_cpu/u_execute/ram_to_d_wen ),
    .o(\u_cpu/u_execute/n29 [3]));
  AL_MAP_LUT4 #(
    .EQN("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .INIT(16'h084c))
    _al_u888 (
    .a(\u_cpu/u_execute/n0_lutinv ),
    .b(\u_cpu/u_execute/ram_to_c_wen ),
    .c(ram_wdata[2]),
    .d(ram_rdata[2]),
    .o(_al_u888_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*~B))"),
    .INIT(8'h54))
    _al_u889 (
    .a(\u_cpu/u_execute/bus_to_c_wen ),
    .b(\u_cpu/u_execute/ram_to_c_wen ),
    .c(\u_cpu/u_execute/C [2]),
    .o(_al_u889_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~(B*A))"),
    .INIT(8'h07))
    _al_u890 (
    .a(bus_rdata[2]),
    .b(\u_cpu/u_execute/bus_to_c_wen ),
    .c(\u_cpu/u_execute/rom_to_c_wen ),
    .o(_al_u890_o));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u891 (
    .a(\u_cpu/u_execute/rom_data [2]),
    .b(\u_cpu/u_execute/rom_to_c_wen ),
    .o(_al_u891_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~(B*~A)))"),
    .INIT(16'h004f))
    _al_u892 (
    .a(_al_u888_o),
    .b(_al_u889_o),
    .c(_al_u890_o),
    .d(_al_u891_o),
    .o(\u_cpu/u_execute/n17 [2]));
  AL_MAP_LUT4 #(
    .EQN("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .INIT(16'h084c))
    _al_u893 (
    .a(\u_cpu/u_execute/n0_lutinv ),
    .b(\u_cpu/u_execute/ram_to_b_wen ),
    .c(ram_wdata[2]),
    .d(ram_rdata[2]),
    .o(_al_u893_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*~B))"),
    .INIT(8'h54))
    _al_u894 (
    .a(\u_cpu/u_execute/bus_to_b_wen ),
    .b(\u_cpu/u_execute/ram_to_b_wen ),
    .c(\u_cpu/alu_in2 [2]),
    .o(_al_u894_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~(B*A))"),
    .INIT(8'h07))
    _al_u895 (
    .a(bus_rdata[2]),
    .b(\u_cpu/u_execute/bus_to_b_wen ),
    .c(\u_cpu/u_execute/rom_to_b_wen ),
    .o(_al_u895_o));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u896 (
    .a(\u_cpu/u_execute/rom_data [2]),
    .b(\u_cpu/u_execute/rom_to_b_wen ),
    .o(_al_u896_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~(B*~A)))"),
    .INIT(16'h004f))
    _al_u897 (
    .a(_al_u893_o),
    .b(_al_u894_o),
    .c(_al_u895_o),
    .d(_al_u896_o),
    .o(\u_cpu/u_execute/n7 [2]));
  AL_MAP_LUT4 #(
    .EQN("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .INIT(16'h084c))
    _al_u898 (
    .a(\u_cpu/u_execute/n0_lutinv ),
    .b(\u_cpu/u_execute/ram_to_a_wen ),
    .c(ram_wdata[2]),
    .d(ram_rdata[2]),
    .o(_al_u898_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*~B))"),
    .INIT(8'h54))
    _al_u899 (
    .a(\u_cpu/u_execute/bus_to_a_wen ),
    .b(\u_cpu/u_execute/ram_to_a_wen ),
    .c(bus_wdata[2]),
    .o(_al_u899_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~(B*A))"),
    .INIT(8'h07))
    _al_u900 (
    .a(bus_rdata[2]),
    .b(\u_cpu/u_execute/bus_to_a_wen ),
    .c(\u_cpu/u_execute/rom_to_a_wen ),
    .o(_al_u900_o));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u901 (
    .a(\u_cpu/u_execute/rom_data [2]),
    .b(\u_cpu/u_execute/rom_to_a_wen ),
    .o(_al_u901_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~(B*~A)))"),
    .INIT(16'h004f))
    _al_u902 (
    .a(_al_u898_o),
    .b(_al_u899_o),
    .c(_al_u900_o),
    .d(_al_u901_o),
    .o(\u_cpu/u_execute/n4 [2]));
  AL_MAP_LUT4 #(
    .EQN("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .INIT(16'h084c))
    _al_u903 (
    .a(\u_cpu/u_execute/n0_lutinv ),
    .b(\u_cpu/u_execute/ram_to_d_wen ),
    .c(ram_wdata[2]),
    .d(ram_rdata[2]),
    .o(_al_u903_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*~B))"),
    .INIT(8'h54))
    _al_u904 (
    .a(\u_cpu/u_execute/bus_to_d_wen ),
    .b(\u_cpu/u_execute/ram_to_d_wen ),
    .c(bus_raddr[2]),
    .o(_al_u904_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~(B*A))"),
    .INIT(8'h07))
    _al_u905 (
    .a(bus_rdata[2]),
    .b(\u_cpu/u_execute/bus_to_d_wen ),
    .c(\u_cpu/u_execute/rom_to_d_wen ),
    .o(_al_u905_o));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u906 (
    .a(\u_cpu/u_execute/rom_data [2]),
    .b(\u_cpu/u_execute/rom_to_d_wen ),
    .o(_al_u906_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~(B*~A)))"),
    .INIT(16'h004f))
    _al_u907 (
    .a(_al_u903_o),
    .b(_al_u904_o),
    .c(_al_u905_o),
    .d(_al_u906_o),
    .o(\u_cpu/u_execute/n29 [2]));
  AL_MAP_LUT3 #(
    .EQN("~(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'h27))
    _al_u908 (
    .a(\u_cpu/u_execute/n0_lutinv ),
    .b(ram_wdata[1]),
    .c(ram_rdata[1]),
    .o(_al_u908_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~A*~(~C*~B))"),
    .INIT(16'h0054))
    _al_u909 (
    .a(\u_cpu/u_execute/bus_to_c_wen ),
    .b(\u_cpu/u_execute/ram_to_c_wen ),
    .c(\u_cpu/u_execute/C [1]),
    .d(\u_cpu/u_execute/rom_to_c_wen ),
    .o(_al_u909_o));
  AL_MAP_LUT4 #(
    .EQN("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    .INIT(16'h0f77))
    _al_u910 (
    .a(bus_rdata[1]),
    .b(\u_cpu/u_execute/bus_to_c_wen ),
    .c(\u_cpu/u_execute/rom_data [1]),
    .d(\u_cpu/u_execute/rom_to_c_wen ),
    .o(_al_u910_o));
  AL_MAP_LUT4 #(
    .EQN("~(C*~(B*~(D*A)))"),
    .INIT(16'h4fcf))
    _al_u911 (
    .a(_al_u908_o),
    .b(_al_u909_o),
    .c(_al_u910_o),
    .d(\u_cpu/u_execute/ram_to_c_wen ),
    .o(\u_cpu/u_execute/n17 [1]));
  AL_MAP_LUT4 #(
    .EQN("(~D*~A*~(~C*~B))"),
    .INIT(16'h0054))
    _al_u912 (
    .a(\u_cpu/u_execute/bus_to_b_wen ),
    .b(\u_cpu/u_execute/ram_to_b_wen ),
    .c(\u_cpu/alu_in2 [1]),
    .d(\u_cpu/u_execute/rom_to_b_wen ),
    .o(_al_u912_o));
  AL_MAP_LUT4 #(
    .EQN("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    .INIT(16'h0f77))
    _al_u913 (
    .a(bus_rdata[1]),
    .b(\u_cpu/u_execute/bus_to_b_wen ),
    .c(\u_cpu/u_execute/rom_data [1]),
    .d(\u_cpu/u_execute/rom_to_b_wen ),
    .o(_al_u913_o));
  AL_MAP_LUT4 #(
    .EQN("~(C*~(B*~(D*A)))"),
    .INIT(16'h4fcf))
    _al_u914 (
    .a(_al_u908_o),
    .b(_al_u912_o),
    .c(_al_u913_o),
    .d(\u_cpu/u_execute/ram_to_b_wen ),
    .o(\u_cpu/u_execute/n7 [1]));
  AL_MAP_LUT4 #(
    .EQN("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .INIT(16'h084c))
    _al_u915 (
    .a(\u_cpu/u_execute/n0_lutinv ),
    .b(\u_cpu/u_execute/ram_to_a_wen ),
    .c(ram_wdata[1]),
    .d(ram_rdata[1]),
    .o(_al_u915_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*~B))"),
    .INIT(8'h54))
    _al_u916 (
    .a(\u_cpu/u_execute/bus_to_a_wen ),
    .b(\u_cpu/u_execute/ram_to_a_wen ),
    .c(bus_wdata[1]),
    .o(_al_u916_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~(B*A))"),
    .INIT(8'h07))
    _al_u917 (
    .a(bus_rdata[1]),
    .b(\u_cpu/u_execute/bus_to_a_wen ),
    .c(\u_cpu/u_execute/rom_to_a_wen ),
    .o(_al_u917_o));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u918 (
    .a(\u_cpu/u_execute/rom_data [1]),
    .b(\u_cpu/u_execute/rom_to_a_wen ),
    .o(_al_u918_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~(B*~A)))"),
    .INIT(16'h004f))
    _al_u919 (
    .a(_al_u915_o),
    .b(_al_u916_o),
    .c(_al_u917_o),
    .d(_al_u918_o),
    .o(\u_cpu/u_execute/n4 [1]));
  AL_MAP_LUT4 #(
    .EQN("(~D*~A*~(~C*~B))"),
    .INIT(16'h0054))
    _al_u920 (
    .a(\u_cpu/u_execute/bus_to_d_wen ),
    .b(\u_cpu/u_execute/ram_to_d_wen ),
    .c(bus_raddr[1]),
    .d(\u_cpu/u_execute/rom_to_d_wen ),
    .o(_al_u920_o));
  AL_MAP_LUT4 #(
    .EQN("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    .INIT(16'h0f77))
    _al_u921 (
    .a(bus_rdata[1]),
    .b(\u_cpu/u_execute/bus_to_d_wen ),
    .c(\u_cpu/u_execute/rom_data [1]),
    .d(\u_cpu/u_execute/rom_to_d_wen ),
    .o(_al_u921_o));
  AL_MAP_LUT4 #(
    .EQN("~(C*~(B*~(D*A)))"),
    .INIT(16'h4fcf))
    _al_u922 (
    .a(_al_u908_o),
    .b(_al_u920_o),
    .c(_al_u921_o),
    .d(\u_cpu/u_execute/ram_to_d_wen ),
    .o(\u_cpu/u_execute/n29 [1]));
  AL_MAP_LUT3 #(
    .EQN("~(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'h27))
    _al_u923 (
    .a(\u_cpu/u_execute/n0_lutinv ),
    .b(ram_wdata[0]),
    .c(ram_rdata[0]),
    .o(_al_u923_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~A*~(~C*~B))"),
    .INIT(16'h0054))
    _al_u924 (
    .a(\u_cpu/u_execute/bus_to_c_wen ),
    .b(\u_cpu/u_execute/ram_to_c_wen ),
    .c(\u_cpu/u_execute/C [0]),
    .d(\u_cpu/u_execute/rom_to_c_wen ),
    .o(_al_u924_o));
  AL_MAP_LUT4 #(
    .EQN("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    .INIT(16'h0f77))
    _al_u925 (
    .a(bus_rdata[0]),
    .b(\u_cpu/u_execute/bus_to_c_wen ),
    .c(\u_cpu/u_execute/rom_data [0]),
    .d(\u_cpu/u_execute/rom_to_c_wen ),
    .o(_al_u925_o));
  AL_MAP_LUT4 #(
    .EQN("~(C*~(B*~(D*A)))"),
    .INIT(16'h4fcf))
    _al_u926 (
    .a(_al_u923_o),
    .b(_al_u924_o),
    .c(_al_u925_o),
    .d(\u_cpu/u_execute/ram_to_c_wen ),
    .o(\u_cpu/u_execute/n17 [0]));
  AL_MAP_LUT4 #(
    .EQN("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .INIT(16'h084c))
    _al_u927 (
    .a(\u_cpu/u_execute/n0_lutinv ),
    .b(\u_cpu/u_execute/ram_to_b_wen ),
    .c(ram_wdata[0]),
    .d(ram_rdata[0]),
    .o(_al_u927_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*~B))"),
    .INIT(8'h54))
    _al_u928 (
    .a(\u_cpu/u_execute/bus_to_b_wen ),
    .b(\u_cpu/u_execute/ram_to_b_wen ),
    .c(\u_cpu/alu_in2 [0]),
    .o(_al_u928_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~(B*A))"),
    .INIT(8'h07))
    _al_u929 (
    .a(bus_rdata[0]),
    .b(\u_cpu/u_execute/bus_to_b_wen ),
    .c(\u_cpu/u_execute/rom_to_b_wen ),
    .o(_al_u929_o));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u930 (
    .a(\u_cpu/u_execute/rom_data [0]),
    .b(\u_cpu/u_execute/rom_to_b_wen ),
    .o(_al_u930_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~(B*~A)))"),
    .INIT(16'h004f))
    _al_u931 (
    .a(_al_u927_o),
    .b(_al_u928_o),
    .c(_al_u929_o),
    .d(_al_u930_o),
    .o(\u_cpu/u_execute/n7 [0]));
  AL_MAP_LUT4 #(
    .EQN("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .INIT(16'h084c))
    _al_u932 (
    .a(\u_cpu/u_execute/n0_lutinv ),
    .b(\u_cpu/u_execute/ram_to_a_wen ),
    .c(ram_wdata[0]),
    .d(ram_rdata[0]),
    .o(_al_u932_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*~B))"),
    .INIT(8'h54))
    _al_u933 (
    .a(\u_cpu/u_execute/bus_to_a_wen ),
    .b(\u_cpu/u_execute/ram_to_a_wen ),
    .c(bus_wdata[0]),
    .o(_al_u933_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~(B*A))"),
    .INIT(8'h07))
    _al_u934 (
    .a(bus_rdata[0]),
    .b(\u_cpu/u_execute/bus_to_a_wen ),
    .c(\u_cpu/u_execute/rom_to_a_wen ),
    .o(_al_u934_o));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u935 (
    .a(\u_cpu/u_execute/rom_data [0]),
    .b(\u_cpu/u_execute/rom_to_a_wen ),
    .o(_al_u935_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~(B*~A)))"),
    .INIT(16'h004f))
    _al_u936 (
    .a(_al_u932_o),
    .b(_al_u933_o),
    .c(_al_u934_o),
    .d(_al_u935_o),
    .o(\u_cpu/u_execute/n4 [0]));
  AL_MAP_LUT4 #(
    .EQN("(~D*~A*~(~C*~B))"),
    .INIT(16'h0054))
    _al_u937 (
    .a(\u_cpu/u_execute/bus_to_d_wen ),
    .b(\u_cpu/u_execute/ram_to_d_wen ),
    .c(bus_raddr[0]),
    .d(\u_cpu/u_execute/rom_to_d_wen ),
    .o(_al_u937_o));
  AL_MAP_LUT4 #(
    .EQN("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    .INIT(16'h0f77))
    _al_u938 (
    .a(bus_rdata[0]),
    .b(\u_cpu/u_execute/bus_to_d_wen ),
    .c(\u_cpu/u_execute/rom_data [0]),
    .d(\u_cpu/u_execute/rom_to_d_wen ),
    .o(_al_u938_o));
  AL_MAP_LUT4 #(
    .EQN("~(C*~(B*~(D*A)))"),
    .INIT(16'h4fcf))
    _al_u939 (
    .a(_al_u923_o),
    .b(_al_u937_o),
    .c(_al_u938_o),
    .d(\u_cpu/u_execute/ram_to_d_wen ),
    .o(\u_cpu/u_execute/n29 [0]));
  AL_MAP_LUT4 #(
    .EQN("(~D*~B*~(C@A))"),
    .INIT(16'h0021))
    _al_u940 (
    .a(_al_u617_o),
    .b(\u_cpu/u_decode/inst_data ),
    .c(\u_cpu/inst [2]),
    .d(\u_cpu/inst [3]),
    .o(_al_u940_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u941 (
    .a(_al_u940_o),
    .b(_al_u607_o),
    .o(\u_cpu/u_decode/n9 ));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u942 (
    .a(\u_uart/u_uart_rx/n5 ),
    .b(\u_uart/u_uart_rx/start ),
    .o(\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u943 (
    .a(\u_uart/u_uart_tx/n0 ),
    .b(\u_uart/u_uart_tx/start ),
    .o(\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(B*~(A)*~(D)+B*A*~(D)+~(B)*A*D+B*A*D))"),
    .INIT(16'h0503))
    _al_u944 (
    .a(\u_cpu/alu_out4 [7]),
    .b(ram_wdata[7]),
    .c(\u_cpu/u_execute/wt_ram_cmd [8]),
    .d(\u_cpu/u_execute/wt_ram_cmd [9]),
    .o(_al_u944_o));
  AL_MAP_LUT4 #(
    .EQN("(~C*~B*~(D*~A))"),
    .INIT(16'h0203))
    _al_u945 (
    .a(\u_cpu/alu_out3 [7]),
    .b(\u_cpu/u_execute/wt_ram_cmd [6]),
    .c(\u_cpu/u_execute/wt_ram_cmd [7]),
    .d(\u_cpu/u_execute/wt_ram_cmd [8]),
    .o(_al_u945_o));
  AL_MAP_LUT3 #(
    .EQN("(~B*~(C*A))"),
    .INIT(8'h13))
    _al_u946 (
    .a(\u_cpu/alu_out1 [7]),
    .b(\u_cpu/u_execute/wt_ram_cmd [5]),
    .c(\u_cpu/u_execute/wt_ram_cmd [6]),
    .o(_al_u946_o));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u947 (
    .a(\u_cpu/alu_out1 [15]),
    .b(\u_cpu/u_execute/wt_ram_cmd [5]),
    .o(_al_u947_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~(B*~A)))"),
    .INIT(16'h004f))
    _al_u948 (
    .a(_al_u944_o),
    .b(_al_u945_o),
    .c(_al_u946_o),
    .d(_al_u947_o),
    .o(\u_cpu/u_execute/n47 [7]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~B*~(D*~A))"),
    .INIT(16'h0203))
    _al_u949 (
    .a(\u_cpu/alu_out0 [7]),
    .b(\u_cpu/u_execute/wt_ram_cmd [2]),
    .c(\u_cpu/u_execute/wt_ram_cmd [3]),
    .d(\u_cpu/u_execute/wt_ram_cmd [4]),
    .o(_al_u949_o));
  AL_MAP_LUT3 #(
    .EQN("(~B*~(C*A))"),
    .INIT(8'h13))
    _al_u950 (
    .a(\u_cpu/u_execute/C [7]),
    .b(\u_cpu/u_execute/wt_ram_cmd [1]),
    .c(\u_cpu/u_execute/wt_ram_cmd [2]),
    .o(_al_u950_o));
  AL_MAP_LUT4 #(
    .EQN("(C*~(B*~(~D*~A)))"),
    .INIT(16'h3070))
    _al_u951 (
    .a(\u_cpu/u_execute/n47 [7]),
    .b(_al_u949_o),
    .c(_al_u950_o),
    .d(\u_cpu/u_execute/wt_ram_cmd [4]),
    .o(_al_u951_o));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u952 (
    .a(\u_cpu/alu_in2 [7]),
    .b(\u_cpu/u_execute/wt_ram_cmd [1]),
    .o(_al_u952_o));
  AL_MAP_LUT4 #(
    .EQN("((~B*~A)*~(C)*~(D)+(~B*~A)*C*~(D)+~((~B*~A))*C*D+(~B*~A)*C*D)"),
    .INIT(16'hf011))
    _al_u953 (
    .a(_al_u951_o),
    .b(_al_u952_o),
    .c(bus_wdata[7]),
    .d(\u_cpu/u_execute/wt_ram_cmd [0]),
    .o(\u_cpu/u_execute/n52 [7]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(B*~(A)*~(D)+B*A*~(D)+~(B)*A*D+B*A*D))"),
    .INIT(16'h0503))
    _al_u954 (
    .a(\u_cpu/alu_out4 [6]),
    .b(ram_wdata[6]),
    .c(\u_cpu/u_execute/wt_ram_cmd [8]),
    .d(\u_cpu/u_execute/wt_ram_cmd [9]),
    .o(_al_u954_o));
  AL_MAP_LUT4 #(
    .EQN("(~C*~B*~(D*~A))"),
    .INIT(16'h0203))
    _al_u955 (
    .a(\u_cpu/alu_out3 [6]),
    .b(\u_cpu/u_execute/wt_ram_cmd [6]),
    .c(\u_cpu/u_execute/wt_ram_cmd [7]),
    .d(\u_cpu/u_execute/wt_ram_cmd [8]),
    .o(_al_u955_o));
  AL_MAP_LUT3 #(
    .EQN("(~B*~(C*A))"),
    .INIT(8'h13))
    _al_u956 (
    .a(\u_cpu/alu_out1 [6]),
    .b(\u_cpu/u_execute/wt_ram_cmd [5]),
    .c(\u_cpu/u_execute/wt_ram_cmd [6]),
    .o(_al_u956_o));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u957 (
    .a(\u_cpu/alu_out1 [14]),
    .b(\u_cpu/u_execute/wt_ram_cmd [5]),
    .o(_al_u957_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~(B*~A)))"),
    .INIT(16'h004f))
    _al_u958 (
    .a(_al_u954_o),
    .b(_al_u955_o),
    .c(_al_u956_o),
    .d(_al_u957_o),
    .o(\u_cpu/u_execute/n47 [6]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~B*~(D*~A))"),
    .INIT(16'h0203))
    _al_u959 (
    .a(\u_cpu/alu_out0 [6]),
    .b(\u_cpu/u_execute/wt_ram_cmd [2]),
    .c(\u_cpu/u_execute/wt_ram_cmd [3]),
    .d(\u_cpu/u_execute/wt_ram_cmd [4]),
    .o(_al_u959_o));
  AL_MAP_LUT3 #(
    .EQN("(~B*~(C*A))"),
    .INIT(8'h13))
    _al_u960 (
    .a(\u_cpu/u_execute/C [6]),
    .b(\u_cpu/u_execute/wt_ram_cmd [1]),
    .c(\u_cpu/u_execute/wt_ram_cmd [2]),
    .o(_al_u960_o));
  AL_MAP_LUT4 #(
    .EQN("(C*~(B*~(~D*~A)))"),
    .INIT(16'h3070))
    _al_u961 (
    .a(\u_cpu/u_execute/n47 [6]),
    .b(_al_u959_o),
    .c(_al_u960_o),
    .d(\u_cpu/u_execute/wt_ram_cmd [4]),
    .o(_al_u961_o));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u962 (
    .a(\u_cpu/alu_in2 [6]),
    .b(\u_cpu/u_execute/wt_ram_cmd [1]),
    .o(_al_u962_o));
  AL_MAP_LUT4 #(
    .EQN("((~B*~A)*~(C)*~(D)+(~B*~A)*C*~(D)+~((~B*~A))*C*D+(~B*~A)*C*D)"),
    .INIT(16'hf011))
    _al_u963 (
    .a(_al_u961_o),
    .b(_al_u962_o),
    .c(bus_wdata[6]),
    .d(\u_cpu/u_execute/wt_ram_cmd [0]),
    .o(\u_cpu/u_execute/n52 [6]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(B*~(A)*~(D)+B*A*~(D)+~(B)*A*D+B*A*D))"),
    .INIT(16'h0503))
    _al_u964 (
    .a(\u_cpu/alu_out4 [5]),
    .b(ram_wdata[5]),
    .c(\u_cpu/u_execute/wt_ram_cmd [8]),
    .d(\u_cpu/u_execute/wt_ram_cmd [9]),
    .o(_al_u964_o));
  AL_MAP_LUT4 #(
    .EQN("(~C*~B*~(D*~A))"),
    .INIT(16'h0203))
    _al_u965 (
    .a(\u_cpu/alu_out3 [5]),
    .b(\u_cpu/u_execute/wt_ram_cmd [6]),
    .c(\u_cpu/u_execute/wt_ram_cmd [7]),
    .d(\u_cpu/u_execute/wt_ram_cmd [8]),
    .o(_al_u965_o));
  AL_MAP_LUT3 #(
    .EQN("(~B*~(C*A))"),
    .INIT(8'h13))
    _al_u966 (
    .a(\u_cpu/alu_out1 [5]),
    .b(\u_cpu/u_execute/wt_ram_cmd [5]),
    .c(\u_cpu/u_execute/wt_ram_cmd [6]),
    .o(_al_u966_o));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u967 (
    .a(\u_cpu/alu_out1 [13]),
    .b(\u_cpu/u_execute/wt_ram_cmd [5]),
    .o(_al_u967_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~(B*~A)))"),
    .INIT(16'h004f))
    _al_u968 (
    .a(_al_u964_o),
    .b(_al_u965_o),
    .c(_al_u966_o),
    .d(_al_u967_o),
    .o(\u_cpu/u_execute/n47 [5]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~B*~(D*~A))"),
    .INIT(16'h0203))
    _al_u969 (
    .a(\u_cpu/alu_out0 [5]),
    .b(\u_cpu/u_execute/wt_ram_cmd [2]),
    .c(\u_cpu/u_execute/wt_ram_cmd [3]),
    .d(\u_cpu/u_execute/wt_ram_cmd [4]),
    .o(_al_u969_o));
  AL_MAP_LUT3 #(
    .EQN("(~B*~(C*A))"),
    .INIT(8'h13))
    _al_u970 (
    .a(\u_cpu/u_execute/C [5]),
    .b(\u_cpu/u_execute/wt_ram_cmd [1]),
    .c(\u_cpu/u_execute/wt_ram_cmd [2]),
    .o(_al_u970_o));
  AL_MAP_LUT4 #(
    .EQN("(C*~(B*~(~D*~A)))"),
    .INIT(16'h3070))
    _al_u971 (
    .a(\u_cpu/u_execute/n47 [5]),
    .b(_al_u969_o),
    .c(_al_u970_o),
    .d(\u_cpu/u_execute/wt_ram_cmd [4]),
    .o(_al_u971_o));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u972 (
    .a(\u_cpu/alu_in2 [5]),
    .b(\u_cpu/u_execute/wt_ram_cmd [1]),
    .o(_al_u972_o));
  AL_MAP_LUT4 #(
    .EQN("((~B*~A)*~(C)*~(D)+(~B*~A)*C*~(D)+~((~B*~A))*C*D+(~B*~A)*C*D)"),
    .INIT(16'hf011))
    _al_u973 (
    .a(_al_u971_o),
    .b(_al_u972_o),
    .c(bus_wdata[5]),
    .d(\u_cpu/u_execute/wt_ram_cmd [0]),
    .o(\u_cpu/u_execute/n52 [5]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(B*~(A)*~(D)+B*A*~(D)+~(B)*A*D+B*A*D))"),
    .INIT(16'h0503))
    _al_u974 (
    .a(\u_cpu/alu_out4 [4]),
    .b(ram_wdata[4]),
    .c(\u_cpu/u_execute/wt_ram_cmd [8]),
    .d(\u_cpu/u_execute/wt_ram_cmd [9]),
    .o(_al_u974_o));
  AL_MAP_LUT4 #(
    .EQN("(~C*~B*~(D*~A))"),
    .INIT(16'h0203))
    _al_u975 (
    .a(\u_cpu/alu_out3 [4]),
    .b(\u_cpu/u_execute/wt_ram_cmd [6]),
    .c(\u_cpu/u_execute/wt_ram_cmd [7]),
    .d(\u_cpu/u_execute/wt_ram_cmd [8]),
    .o(_al_u975_o));
  AL_MAP_LUT3 #(
    .EQN("(~B*~(C*A))"),
    .INIT(8'h13))
    _al_u976 (
    .a(\u_cpu/alu_out1 [4]),
    .b(\u_cpu/u_execute/wt_ram_cmd [5]),
    .c(\u_cpu/u_execute/wt_ram_cmd [6]),
    .o(_al_u976_o));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u977 (
    .a(\u_cpu/alu_out1 [12]),
    .b(\u_cpu/u_execute/wt_ram_cmd [5]),
    .o(_al_u977_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~(B*~A)))"),
    .INIT(16'h004f))
    _al_u978 (
    .a(_al_u974_o),
    .b(_al_u975_o),
    .c(_al_u976_o),
    .d(_al_u977_o),
    .o(\u_cpu/u_execute/n47 [4]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~B*~(D*~A))"),
    .INIT(16'h0203))
    _al_u979 (
    .a(\u_cpu/alu_out0 [4]),
    .b(\u_cpu/u_execute/wt_ram_cmd [2]),
    .c(\u_cpu/u_execute/wt_ram_cmd [3]),
    .d(\u_cpu/u_execute/wt_ram_cmd [4]),
    .o(_al_u979_o));
  AL_MAP_LUT3 #(
    .EQN("(~B*~(C*A))"),
    .INIT(8'h13))
    _al_u980 (
    .a(\u_cpu/u_execute/C [4]),
    .b(\u_cpu/u_execute/wt_ram_cmd [1]),
    .c(\u_cpu/u_execute/wt_ram_cmd [2]),
    .o(_al_u980_o));
  AL_MAP_LUT4 #(
    .EQN("(C*~(B*~(~D*~A)))"),
    .INIT(16'h3070))
    _al_u981 (
    .a(\u_cpu/u_execute/n47 [4]),
    .b(_al_u979_o),
    .c(_al_u980_o),
    .d(\u_cpu/u_execute/wt_ram_cmd [4]),
    .o(_al_u981_o));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u982 (
    .a(\u_cpu/alu_in2 [4]),
    .b(\u_cpu/u_execute/wt_ram_cmd [1]),
    .o(_al_u982_o));
  AL_MAP_LUT4 #(
    .EQN("((~B*~A)*~(C)*~(D)+(~B*~A)*C*~(D)+~((~B*~A))*C*D+(~B*~A)*C*D)"),
    .INIT(16'hf011))
    _al_u983 (
    .a(_al_u981_o),
    .b(_al_u982_o),
    .c(bus_wdata[4]),
    .d(\u_cpu/u_execute/wt_ram_cmd [0]),
    .o(\u_cpu/u_execute/n52 [4]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(B*~(A)*~(D)+B*A*~(D)+~(B)*A*D+B*A*D))"),
    .INIT(16'h0503))
    _al_u984 (
    .a(\u_cpu/alu_out4 [3]),
    .b(ram_wdata[3]),
    .c(\u_cpu/u_execute/wt_ram_cmd [8]),
    .d(\u_cpu/u_execute/wt_ram_cmd [9]),
    .o(_al_u984_o));
  AL_MAP_LUT4 #(
    .EQN("(~C*~B*~(D*~A))"),
    .INIT(16'h0203))
    _al_u985 (
    .a(\u_cpu/alu_out3 [3]),
    .b(\u_cpu/u_execute/wt_ram_cmd [6]),
    .c(\u_cpu/u_execute/wt_ram_cmd [7]),
    .d(\u_cpu/u_execute/wt_ram_cmd [8]),
    .o(_al_u985_o));
  AL_MAP_LUT3 #(
    .EQN("(~B*~(C*A))"),
    .INIT(8'h13))
    _al_u986 (
    .a(\u_cpu/alu_out1 [3]),
    .b(\u_cpu/u_execute/wt_ram_cmd [5]),
    .c(\u_cpu/u_execute/wt_ram_cmd [6]),
    .o(_al_u986_o));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u987 (
    .a(\u_cpu/alu_out1 [11]),
    .b(\u_cpu/u_execute/wt_ram_cmd [5]),
    .o(_al_u987_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~(B*~A)))"),
    .INIT(16'h004f))
    _al_u988 (
    .a(_al_u984_o),
    .b(_al_u985_o),
    .c(_al_u986_o),
    .d(_al_u987_o),
    .o(\u_cpu/u_execute/n47 [3]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~B*~(D*~A))"),
    .INIT(16'h0203))
    _al_u989 (
    .a(\u_cpu/alu_out0 [3]),
    .b(\u_cpu/u_execute/wt_ram_cmd [2]),
    .c(\u_cpu/u_execute/wt_ram_cmd [3]),
    .d(\u_cpu/u_execute/wt_ram_cmd [4]),
    .o(_al_u989_o));
  AL_MAP_LUT3 #(
    .EQN("(~B*~(C*A))"),
    .INIT(8'h13))
    _al_u990 (
    .a(\u_cpu/u_execute/C [3]),
    .b(\u_cpu/u_execute/wt_ram_cmd [1]),
    .c(\u_cpu/u_execute/wt_ram_cmd [2]),
    .o(_al_u990_o));
  AL_MAP_LUT4 #(
    .EQN("(C*~(B*~(~D*~A)))"),
    .INIT(16'h3070))
    _al_u991 (
    .a(\u_cpu/u_execute/n47 [3]),
    .b(_al_u989_o),
    .c(_al_u990_o),
    .d(\u_cpu/u_execute/wt_ram_cmd [4]),
    .o(_al_u991_o));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u992 (
    .a(\u_cpu/alu_in2 [3]),
    .b(\u_cpu/u_execute/wt_ram_cmd [1]),
    .o(_al_u992_o));
  AL_MAP_LUT4 #(
    .EQN("((~B*~A)*~(C)*~(D)+(~B*~A)*C*~(D)+~((~B*~A))*C*D+(~B*~A)*C*D)"),
    .INIT(16'hf011))
    _al_u993 (
    .a(_al_u991_o),
    .b(_al_u992_o),
    .c(bus_wdata[3]),
    .d(\u_cpu/u_execute/wt_ram_cmd [0]),
    .o(\u_cpu/u_execute/n52 [3]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(B*~(A)*~(D)+B*A*~(D)+~(B)*A*D+B*A*D))"),
    .INIT(16'h0503))
    _al_u994 (
    .a(\u_cpu/alu_out4 [2]),
    .b(ram_wdata[2]),
    .c(\u_cpu/u_execute/wt_ram_cmd [8]),
    .d(\u_cpu/u_execute/wt_ram_cmd [9]),
    .o(_al_u994_o));
  AL_MAP_LUT4 #(
    .EQN("(~C*~B*~(D*~A))"),
    .INIT(16'h0203))
    _al_u995 (
    .a(\u_cpu/alu_out3 [2]),
    .b(\u_cpu/u_execute/wt_ram_cmd [6]),
    .c(\u_cpu/u_execute/wt_ram_cmd [7]),
    .d(\u_cpu/u_execute/wt_ram_cmd [8]),
    .o(_al_u995_o));
  AL_MAP_LUT3 #(
    .EQN("(~B*~(C*A))"),
    .INIT(8'h13))
    _al_u996 (
    .a(\u_cpu/alu_out1 [2]),
    .b(\u_cpu/u_execute/wt_ram_cmd [5]),
    .c(\u_cpu/u_execute/wt_ram_cmd [6]),
    .o(_al_u996_o));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u997 (
    .a(\u_cpu/alu_out1 [10]),
    .b(\u_cpu/u_execute/wt_ram_cmd [5]),
    .o(_al_u997_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*~(B*~A)))"),
    .INIT(16'h004f))
    _al_u998 (
    .a(_al_u994_o),
    .b(_al_u995_o),
    .c(_al_u996_o),
    .d(_al_u997_o),
    .o(\u_cpu/u_execute/n47 [2]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~B*~(D*~A))"),
    .INIT(16'h0203))
    _al_u999 (
    .a(\u_cpu/alu_out0 [2]),
    .b(\u_cpu/u_execute/wt_ram_cmd [2]),
    .c(\u_cpu/u_execute/wt_ram_cmd [3]),
    .d(\u_cpu/u_execute/wt_ram_cmd [4]),
    .o(_al_u999_o));
  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  reg_ar_as_w1 \u_bus/clear_reg  (
    .clk(vga_clk_pad),
    .d(\u_bus/n18 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(clear));  // sources/rtl/mcu/bus.v(86)
  reg_ar_as_w1 \u_bus/led_reg  (
    .clk(vga_clk_pad),
    .d(bus_wdata[0]),
    .en(\u_bus/u6_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(led_pad));  // sources/rtl/mcu/bus.v(62)
  reg_ar_as_w1 \u_bus/reg0_b0  (
    .clk(vga_clk_pad),
    .d(bus_wdata[0]),
    .en(\u_bus/mux0_b0_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(vram_addr[0]));  // sources/rtl/mcu/bus.v(62)
  reg_ar_as_w1 \u_bus/reg0_b1  (
    .clk(vga_clk_pad),
    .d(bus_wdata[1]),
    .en(\u_bus/mux0_b0_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(vram_addr[1]));  // sources/rtl/mcu/bus.v(62)
  reg_ar_as_w1 \u_bus/reg0_b2  (
    .clk(vga_clk_pad),
    .d(bus_wdata[2]),
    .en(\u_bus/mux0_b0_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(vram_addr[2]));  // sources/rtl/mcu/bus.v(62)
  reg_ar_as_w1 \u_bus/reg0_b3  (
    .clk(vga_clk_pad),
    .d(bus_wdata[3]),
    .en(\u_bus/mux0_b0_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(vram_addr[3]));  // sources/rtl/mcu/bus.v(62)
  reg_ar_as_w1 \u_bus/reg0_b4  (
    .clk(vga_clk_pad),
    .d(bus_wdata[4]),
    .en(\u_bus/mux0_b0_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(vram_addr[4]));  // sources/rtl/mcu/bus.v(62)
  reg_ar_as_w1 \u_bus/reg0_b5  (
    .clk(vga_clk_pad),
    .d(bus_wdata[5]),
    .en(\u_bus/mux0_b0_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(vram_addr[5]));  // sources/rtl/mcu/bus.v(62)
  reg_ar_as_w1 \u_bus/reg0_b6  (
    .clk(vga_clk_pad),
    .d(bus_wdata[6]),
    .en(\u_bus/mux0_b0_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(vram_addr[6]));  // sources/rtl/mcu/bus.v(62)
  reg_ar_as_w1 \u_bus/reg0_b7  (
    .clk(vga_clk_pad),
    .d(bus_wdata[7]),
    .en(\u_bus/mux0_b0_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(vram_addr[7]));  // sources/rtl/mcu/bus.v(62)
  reg_ar_as_w1 \u_bus/reg1_b0  (
    .clk(vga_clk_pad),
    .d(\u_bus/n15 [0]),
    .en(bus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_rdata[0]));  // sources/rtl/mcu/bus.v(78)
  reg_ar_as_w1 \u_bus/reg1_b1  (
    .clk(vga_clk_pad),
    .d(\u_bus/n15 [1]),
    .en(bus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_rdata[1]));  // sources/rtl/mcu/bus.v(78)
  reg_ar_as_w1 \u_bus/reg1_b2  (
    .clk(vga_clk_pad),
    .d(\u_bus/n15 [2]),
    .en(bus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_rdata[2]));  // sources/rtl/mcu/bus.v(78)
  reg_ar_as_w1 \u_bus/reg1_b3  (
    .clk(vga_clk_pad),
    .d(\u_bus/n15 [3]),
    .en(bus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_rdata[3]));  // sources/rtl/mcu/bus.v(78)
  reg_ar_as_w1 \u_bus/reg1_b4  (
    .clk(vga_clk_pad),
    .d(\u_bus/n15 [4]),
    .en(bus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_rdata[4]));  // sources/rtl/mcu/bus.v(78)
  reg_ar_as_w1 \u_bus/reg1_b5  (
    .clk(vga_clk_pad),
    .d(\u_bus/n15 [5]),
    .en(bus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_rdata[5]));  // sources/rtl/mcu/bus.v(78)
  reg_ar_as_w1 \u_bus/vram_ren_reg  (
    .clk(vga_clk_pad),
    .d(\u_bus/mux0_b0_sel_is_3_o ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(vram_ren));  // sources/rtl/mcu/bus.v(86)
  reg_ar_as_w1 \u_bus/vram_wdata_reg  (
    .clk(vga_clk_pad),
    .d(bus_wdata[0]),
    .en(\u_bus/n22 ),
    .reset(1'b0),
    .set(1'b0),
    .q(vram_wdata));  // sources/rtl/mcu/bus.v(62)
  reg_ar_as_w1 \u_bus/vram_wen_reg  (
    .clk(vga_clk_pad),
    .d(\u_bus/n22 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(vram_wen));  // sources/rtl/mcu/bus.v(86)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_alu/add0/u0  (
    .a(bus_wdata[0]),
    .b(\u_cpu/alu_in2 [0]),
    .c(\u_cpu/u_alu/add0/c0 ),
    .o({\u_cpu/u_alu/add0/c1 ,\u_cpu/u_alu/n4 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_alu/add0/u1  (
    .a(bus_wdata[1]),
    .b(\u_cpu/alu_in2 [1]),
    .c(\u_cpu/u_alu/add0/c1 ),
    .o({\u_cpu/u_alu/add0/c2 ,\u_cpu/u_alu/n4 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_alu/add0/u2  (
    .a(bus_wdata[2]),
    .b(\u_cpu/alu_in2 [2]),
    .c(\u_cpu/u_alu/add0/c2 ),
    .o({\u_cpu/u_alu/add0/c3 ,\u_cpu/u_alu/n4 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_alu/add0/u3  (
    .a(bus_wdata[3]),
    .b(\u_cpu/alu_in2 [3]),
    .c(\u_cpu/u_alu/add0/c3 ),
    .o({\u_cpu/u_alu/add0/c4 ,\u_cpu/u_alu/n4 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_alu/add0/u4  (
    .a(bus_wdata[4]),
    .b(\u_cpu/alu_in2 [4]),
    .c(\u_cpu/u_alu/add0/c4 ),
    .o({\u_cpu/u_alu/add0/c5 ,\u_cpu/u_alu/n4 [4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_alu/add0/u5  (
    .a(bus_wdata[5]),
    .b(\u_cpu/alu_in2 [5]),
    .c(\u_cpu/u_alu/add0/c5 ),
    .o({\u_cpu/u_alu/add0/c6 ,\u_cpu/u_alu/n4 [5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_alu/add0/u6  (
    .a(bus_wdata[6]),
    .b(\u_cpu/alu_in2 [6]),
    .c(\u_cpu/u_alu/add0/c6 ),
    .o({\u_cpu/u_alu/add0/c7 ,\u_cpu/u_alu/n4 [6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_alu/add0/u7  (
    .a(bus_wdata[7]),
    .b(\u_cpu/alu_in2 [7]),
    .c(\u_cpu/u_alu/add0/c7 ),
    .o({\u_cpu/u_alu/add0/c8 ,\u_cpu/u_alu/n4 [7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \u_cpu/u_alu/add0/ucin  (
    .a(1'b0),
    .o({\u_cpu/u_alu/add0/c0 ,open_n627}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_alu/add0/ucout  (
    .c(\u_cpu/u_alu/add0/c8 ),
    .o({open_n630,\u_cpu/u_alu/n3 }));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_cpu/u_alu/lt0_0  (
    .a(\u_cpu/alu_in2 [0]),
    .b(bus_wdata[0]),
    .c(\u_cpu/u_alu/lt0_c0 ),
    .o({\u_cpu/u_alu/lt0_c1 ,open_n631}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_cpu/u_alu/lt0_1  (
    .a(\u_cpu/alu_in2 [1]),
    .b(bus_wdata[1]),
    .c(\u_cpu/u_alu/lt0_c1 ),
    .o({\u_cpu/u_alu/lt0_c2 ,open_n632}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_cpu/u_alu/lt0_2  (
    .a(\u_cpu/alu_in2 [2]),
    .b(bus_wdata[2]),
    .c(\u_cpu/u_alu/lt0_c2 ),
    .o({\u_cpu/u_alu/lt0_c3 ,open_n633}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_cpu/u_alu/lt0_3  (
    .a(\u_cpu/alu_in2 [3]),
    .b(bus_wdata[3]),
    .c(\u_cpu/u_alu/lt0_c3 ),
    .o({\u_cpu/u_alu/lt0_c4 ,open_n634}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_cpu/u_alu/lt0_4  (
    .a(\u_cpu/alu_in2 [4]),
    .b(bus_wdata[4]),
    .c(\u_cpu/u_alu/lt0_c4 ),
    .o({\u_cpu/u_alu/lt0_c5 ,open_n635}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_cpu/u_alu/lt0_5  (
    .a(\u_cpu/alu_in2 [5]),
    .b(bus_wdata[5]),
    .c(\u_cpu/u_alu/lt0_c5 ),
    .o({\u_cpu/u_alu/lt0_c6 ,open_n636}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_cpu/u_alu/lt0_6  (
    .a(\u_cpu/alu_in2 [6]),
    .b(bus_wdata[6]),
    .c(\u_cpu/u_alu/lt0_c6 ),
    .o({\u_cpu/u_alu/lt0_c7 ,open_n637}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_cpu/u_alu/lt0_7  (
    .a(\u_cpu/alu_in2 [7]),
    .b(bus_wdata[7]),
    .c(\u_cpu/u_alu/lt0_c7 ),
    .o({\u_cpu/u_alu/lt0_c8 ,open_n638}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    \u_cpu/u_alu/lt0_cin  (
    .a(1'b0),
    .o({\u_cpu/u_alu/lt0_c0 ,open_n641}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_cpu/u_alu/lt0_cout  (
    .a(1'b0),
    .b(1'b1),
    .c(\u_cpu/u_alu/lt0_c8 ),
    .o({open_n642,\u_cpu/u_alu/n35 }));
  EG_PHY_MULT18 #(
    .CEAMUX("1"),
    .CEBMUX("1"),
    .CLKMUX("SIG"),
    .INPUTREGA("ENABLE"),
    .INPUTREGB("ENABLE"),
    .MODE("MULT9X9C"),
    .OUTPUTREG("DISABLE"),
    .RSTANMUX("1"),
    .RSTBNMUX("1"),
    .SIGNEDAMUX("1"),
    .SIGNEDBMUX("1"))
    \u_cpu/u_alu/mult0_u_vram/mult0_  (
    .a({4'b0000,\u_vram/n4 [4:0],1'b0,\u_cpu/u_execute/n4 }),
    .b({10'b0000010010,\u_cpu/u_execute/n7 }),
    .clk(vga_clk_pad),
    .p({open_n725,open_n726,open_n727,open_n728,open_n729,open_n730,open_n731,open_n732,open_n733,open_n734,open_n735,\u_vram/n5 [7:1],open_n736,open_n737,\u_cpu/u_alu/n17 }));
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n17 [0]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [0]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b1  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n17 [1]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [1]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b10  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n17 [10]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [10]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b11  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n17 [11]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [11]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b12  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n17 [12]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [12]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b13  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n17 [13]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [13]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b14  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n17 [14]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [14]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b15  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n17 [15]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [15]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b2  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n17 [2]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [2]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b3  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n17 [3]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [3]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b4  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n17 [4]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [4]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b5  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n17 [5]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [5]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b6  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n17 [6]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [6]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b7  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n17 [7]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [7]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b8  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n17 [8]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [8]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg0_b9  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n17 [9]),
    .en(\u_cpu/alu_cmd [2]),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out1 [9]));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w1 \u_cpu/u_alu/reg1_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n38 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out2 [0]));  // sources/rtl/mcu/alu.v(62)
  reg_ar_as_w1 \u_cpu/u_alu/reg2_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n58 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out3 [0]));  // sources/rtl/mcu/alu.v(75)
  reg_sr_as_w1 \u_cpu/u_alu/reg2_b1  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n57 [1]),
    .en(1'b1),
    .reset(\u_cpu/alu_cmd [5]),
    .set(1'b0),
    .q(\u_cpu/alu_out3 [1]));  // sources/rtl/mcu/alu.v(75)
  reg_sr_as_w1 \u_cpu/u_alu/reg2_b2  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n57 [2]),
    .en(1'b1),
    .reset(\u_cpu/alu_cmd [5]),
    .set(1'b0),
    .q(\u_cpu/alu_out3 [2]));  // sources/rtl/mcu/alu.v(75)
  reg_sr_as_w1 \u_cpu/u_alu/reg2_b3  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n57 [3]),
    .en(1'b1),
    .reset(\u_cpu/alu_cmd [5]),
    .set(1'b0),
    .q(\u_cpu/alu_out3 [3]));  // sources/rtl/mcu/alu.v(75)
  reg_sr_as_w1 \u_cpu/u_alu/reg2_b4  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n57 [4]),
    .en(1'b1),
    .reset(\u_cpu/alu_cmd [5]),
    .set(1'b0),
    .q(\u_cpu/alu_out3 [4]));  // sources/rtl/mcu/alu.v(75)
  reg_sr_as_w1 \u_cpu/u_alu/reg2_b5  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n57 [5]),
    .en(1'b1),
    .reset(\u_cpu/alu_cmd [5]),
    .set(1'b0),
    .q(\u_cpu/alu_out3 [5]));  // sources/rtl/mcu/alu.v(75)
  reg_sr_as_w1 \u_cpu/u_alu/reg2_b6  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n57 [6]),
    .en(1'b1),
    .reset(\u_cpu/alu_cmd [5]),
    .set(1'b0),
    .q(\u_cpu/alu_out3 [6]));  // sources/rtl/mcu/alu.v(75)
  reg_sr_as_w1 \u_cpu/u_alu/reg2_b7  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n57 [7]),
    .en(1'b1),
    .reset(\u_cpu/alu_cmd [5]),
    .set(1'b0),
    .q(\u_cpu/alu_out3 [7]));  // sources/rtl/mcu/alu.v(75)
  reg_ar_as_w1 \u_cpu/u_alu/reg3_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n70 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out4 [0]));  // sources/rtl/mcu/alu.v(84)
  reg_ar_as_w1 \u_cpu/u_alu/reg3_b1  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n70 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out4 [1]));  // sources/rtl/mcu/alu.v(84)
  reg_ar_as_w1 \u_cpu/u_alu/reg3_b2  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n70 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out4 [2]));  // sources/rtl/mcu/alu.v(84)
  reg_ar_as_w1 \u_cpu/u_alu/reg3_b3  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n70 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out4 [3]));  // sources/rtl/mcu/alu.v(84)
  reg_ar_as_w1 \u_cpu/u_alu/reg3_b4  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n70 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out4 [4]));  // sources/rtl/mcu/alu.v(84)
  reg_ar_as_w1 \u_cpu/u_alu/reg3_b5  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n70 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out4 [5]));  // sources/rtl/mcu/alu.v(84)
  reg_ar_as_w1 \u_cpu/u_alu/reg3_b6  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n70 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out4 [6]));  // sources/rtl/mcu/alu.v(84)
  reg_ar_as_w1 \u_cpu/u_alu/reg3_b7  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n70 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out4 [7]));  // sources/rtl/mcu/alu.v(84)
  reg_ar_as_w1 \u_cpu/u_alu/reg4_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n7 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out0 [0]));  // sources/rtl/mcu/alu.v(46)
  reg_ar_as_w1 \u_cpu/u_alu/reg4_b1  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n7 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out0 [1]));  // sources/rtl/mcu/alu.v(46)
  reg_ar_as_w1 \u_cpu/u_alu/reg4_b2  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n7 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out0 [2]));  // sources/rtl/mcu/alu.v(46)
  reg_ar_as_w1 \u_cpu/u_alu/reg4_b3  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n7 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out0 [3]));  // sources/rtl/mcu/alu.v(46)
  reg_ar_as_w1 \u_cpu/u_alu/reg4_b4  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n7 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out0 [4]));  // sources/rtl/mcu/alu.v(46)
  reg_ar_as_w1 \u_cpu/u_alu/reg4_b5  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n7 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out0 [5]));  // sources/rtl/mcu/alu.v(46)
  reg_ar_as_w1 \u_cpu/u_alu/reg4_b6  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n7 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out0 [6]));  // sources/rtl/mcu/alu.v(46)
  reg_ar_as_w1 \u_cpu/u_alu/reg4_b7  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n7 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out0 [7]));  // sources/rtl/mcu/alu.v(46)
  reg_ar_as_w1 \u_cpu/u_alu/reg4_b8  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_alu/n7 [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_out0 [8]));  // sources/rtl/mcu/alu.v(46)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_alu/sub0/u0  (
    .a(bus_wdata[0]),
    .b(\u_cpu/alu_in2 [0]),
    .c(\u_cpu/u_alu/sub0/c0 ),
    .o({\u_cpu/u_alu/sub0/c1 ,\u_cpu/u_alu/n5 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_alu/sub0/u1  (
    .a(bus_wdata[1]),
    .b(\u_cpu/alu_in2 [1]),
    .c(\u_cpu/u_alu/sub0/c1 ),
    .o({\u_cpu/u_alu/sub0/c2 ,\u_cpu/u_alu/n5 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_alu/sub0/u2  (
    .a(bus_wdata[2]),
    .b(\u_cpu/alu_in2 [2]),
    .c(\u_cpu/u_alu/sub0/c2 ),
    .o({\u_cpu/u_alu/sub0/c3 ,\u_cpu/u_alu/n5 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_alu/sub0/u3  (
    .a(bus_wdata[3]),
    .b(\u_cpu/alu_in2 [3]),
    .c(\u_cpu/u_alu/sub0/c3 ),
    .o({\u_cpu/u_alu/sub0/c4 ,\u_cpu/u_alu/n5 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_alu/sub0/u4  (
    .a(bus_wdata[4]),
    .b(\u_cpu/alu_in2 [4]),
    .c(\u_cpu/u_alu/sub0/c4 ),
    .o({\u_cpu/u_alu/sub0/c5 ,\u_cpu/u_alu/n5 [4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_alu/sub0/u5  (
    .a(bus_wdata[5]),
    .b(\u_cpu/alu_in2 [5]),
    .c(\u_cpu/u_alu/sub0/c5 ),
    .o({\u_cpu/u_alu/sub0/c6 ,\u_cpu/u_alu/n5 [5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_alu/sub0/u6  (
    .a(bus_wdata[6]),
    .b(\u_cpu/alu_in2 [6]),
    .c(\u_cpu/u_alu/sub0/c6 ),
    .o({\u_cpu/u_alu/sub0/c7 ,\u_cpu/u_alu/n5 [6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_alu/sub0/u7  (
    .a(bus_wdata[7]),
    .b(\u_cpu/alu_in2 [7]),
    .c(\u_cpu/u_alu/sub0/c7 ),
    .o({\u_cpu/u_alu/sub0/c8 ,\u_cpu/u_alu/n5 [7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB_CARRY"))
    \u_cpu/u_alu/sub0/ucin  (
    .a(1'b0),
    .o({\u_cpu/u_alu/sub0/c0 ,open_n740}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_alu/sub0/ucout  (
    .c(\u_cpu/u_alu/sub0/c8 ),
    .o({open_n743,\u_cpu/u_alu/n5 [8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add0/u0  (
    .a(rom_waddr[0]),
    .b(1'b1),
    .c(\u_cpu/u_debug/add0/c0 ),
    .o({\u_cpu/u_debug/add0/c1 ,\u_cpu/u_debug/n7 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add0/u1  (
    .a(rom_waddr[1]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add0/c1 ),
    .o({\u_cpu/u_debug/add0/c2 ,\u_cpu/u_debug/n7 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add0/u10  (
    .a(rom_waddr[10]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add0/c10 ),
    .o({\u_cpu/u_debug/add0/c11 ,\u_cpu/u_debug/n7 [10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add0/u11  (
    .a(rom_waddr[11]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add0/c11 ),
    .o({\u_cpu/u_debug/add0/c12 ,\u_cpu/u_debug/n7 [11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add0/u12  (
    .a(rom_waddr[12]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add0/c12 ),
    .o({\u_cpu/u_debug/add0/c13 ,\u_cpu/u_debug/n7 [12]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add0/u13  (
    .a(rom_waddr[13]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add0/c13 ),
    .o({\u_cpu/u_debug/add0/c14 ,\u_cpu/u_debug/n7 [13]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add0/u14  (
    .a(rom_waddr[14]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add0/c14 ),
    .o({\u_cpu/u_debug/add0/c15 ,\u_cpu/u_debug/n7 [14]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add0/u15  (
    .a(rom_waddr[15]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add0/c15 ),
    .o({\u_cpu/u_debug/add0/c16 ,\u_cpu/u_debug/n7 [15]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add0/u16  (
    .a(rom_waddr[16]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add0/c16 ),
    .o({\u_cpu/u_debug/add0/c17 ,\u_cpu/u_debug/n7 [16]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add0/u17  (
    .a(rom_waddr[17]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add0/c17 ),
    .o({\u_cpu/u_debug/add0/c18 ,\u_cpu/u_debug/n7 [17]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add0/u18  (
    .a(rom_waddr[18]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add0/c18 ),
    .o({\u_cpu/u_debug/add0/c19 ,\u_cpu/u_debug/n7 [18]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add0/u19  (
    .a(rom_waddr[19]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add0/c19 ),
    .o({\u_cpu/u_debug/add0/c20 ,\u_cpu/u_debug/n7 [19]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add0/u2  (
    .a(rom_waddr[2]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add0/c2 ),
    .o({\u_cpu/u_debug/add0/c3 ,\u_cpu/u_debug/n7 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add0/u20  (
    .a(rom_waddr[20]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add0/c20 ),
    .o({\u_cpu/u_debug/add0/c21 ,\u_cpu/u_debug/n7 [20]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add0/u21  (
    .a(rom_waddr[21]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add0/c21 ),
    .o({\u_cpu/u_debug/add0/c22 ,\u_cpu/u_debug/n7 [21]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add0/u22  (
    .a(rom_waddr[22]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add0/c22 ),
    .o({\u_cpu/u_debug/add0/c23 ,\u_cpu/u_debug/n7 [22]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add0/u23  (
    .a(rom_waddr[23]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add0/c23 ),
    .o({open_n744,\u_cpu/u_debug/n7 [23]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add0/u3  (
    .a(rom_waddr[3]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add0/c3 ),
    .o({\u_cpu/u_debug/add0/c4 ,\u_cpu/u_debug/n7 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add0/u4  (
    .a(rom_waddr[4]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add0/c4 ),
    .o({\u_cpu/u_debug/add0/c5 ,\u_cpu/u_debug/n7 [4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add0/u5  (
    .a(rom_waddr[5]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add0/c5 ),
    .o({\u_cpu/u_debug/add0/c6 ,\u_cpu/u_debug/n7 [5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add0/u6  (
    .a(rom_waddr[6]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add0/c6 ),
    .o({\u_cpu/u_debug/add0/c7 ,\u_cpu/u_debug/n7 [6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add0/u7  (
    .a(rom_waddr[7]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add0/c7 ),
    .o({\u_cpu/u_debug/add0/c8 ,\u_cpu/u_debug/n7 [7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add0/u8  (
    .a(rom_waddr[8]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add0/c8 ),
    .o({\u_cpu/u_debug/add0/c9 ,\u_cpu/u_debug/n7 [8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add0/u9  (
    .a(rom_waddr[9]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add0/c9 ),
    .o({\u_cpu/u_debug/add0/c10 ,\u_cpu/u_debug/n7 [9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \u_cpu/u_debug/add0/ucin  (
    .a(1'b0),
    .o({\u_cpu/u_debug/add0/c0 ,open_n747}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add1/u0  (
    .a(\u_cpu/dbg_rom_raddr [0]),
    .b(1'b1),
    .c(\u_cpu/u_debug/add1/c0 ),
    .o({\u_cpu/u_debug/add1/c1 ,\u_cpu/u_debug/n13 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add1/u1  (
    .a(\u_cpu/dbg_rom_raddr [1]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add1/c1 ),
    .o({\u_cpu/u_debug/add1/c2 ,\u_cpu/u_debug/n13 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add1/u10  (
    .a(\u_cpu/dbg_rom_raddr [10]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add1/c10 ),
    .o({\u_cpu/u_debug/add1/c11 ,\u_cpu/u_debug/n13 [10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add1/u11  (
    .a(\u_cpu/dbg_rom_raddr [11]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add1/c11 ),
    .o({open_n748,\u_cpu/u_debug/n13 [11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add1/u2  (
    .a(\u_cpu/dbg_rom_raddr [2]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add1/c2 ),
    .o({\u_cpu/u_debug/add1/c3 ,\u_cpu/u_debug/n13 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add1/u3  (
    .a(\u_cpu/dbg_rom_raddr [3]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add1/c3 ),
    .o({\u_cpu/u_debug/add1/c4 ,\u_cpu/u_debug/n13 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add1/u4  (
    .a(\u_cpu/dbg_rom_raddr [4]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add1/c4 ),
    .o({\u_cpu/u_debug/add1/c5 ,\u_cpu/u_debug/n13 [4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add1/u5  (
    .a(\u_cpu/dbg_rom_raddr [5]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add1/c5 ),
    .o({\u_cpu/u_debug/add1/c6 ,\u_cpu/u_debug/n13 [5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add1/u6  (
    .a(\u_cpu/dbg_rom_raddr [6]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add1/c6 ),
    .o({\u_cpu/u_debug/add1/c7 ,\u_cpu/u_debug/n13 [6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add1/u7  (
    .a(\u_cpu/dbg_rom_raddr [7]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add1/c7 ),
    .o({\u_cpu/u_debug/add1/c8 ,\u_cpu/u_debug/n13 [7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add1/u8  (
    .a(\u_cpu/dbg_rom_raddr [8]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add1/c8 ),
    .o({\u_cpu/u_debug/add1/c9 ,\u_cpu/u_debug/n13 [8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_debug/add1/u9  (
    .a(\u_cpu/dbg_rom_raddr [9]),
    .b(1'b0),
    .c(\u_cpu/u_debug/add1/c9 ),
    .o({\u_cpu/u_debug/add1/c10 ,\u_cpu/u_debug/n13 [9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \u_cpu/u_debug/add1/ucin  (
    .a(1'b0),
    .o({\u_cpu/u_debug/add1/c0 ,open_n751}));
  reg_sr_as_w1 \u_cpu/u_debug/dbg_en_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/dbg_en_d ),
    .en(1'b1),
    .reset(\u_cpu/u_debug/free_run_cmd ),
    .set(1'b0),
    .q(\u_cpu/dbg_en ));  // sources/rtl/mcu/debug.v(92)
  reg_ar_as_w1 \u_cpu/u_debug/dbg_inst_en_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n2 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_inst_en ));  // sources/rtl/mcu/debug.v(100)
  reg_ar_as_w1 \u_cpu/u_debug/reg0_b0  (
    .clk(vga_clk_pad),
    .d(recv_data[0]),
    .en(\u_cpu/u_debug/debug_cmd ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_inst [0]));  // sources/rtl/mcu/debug.v(100)
  reg_ar_as_w1 \u_cpu/u_debug/reg0_b1  (
    .clk(vga_clk_pad),
    .d(recv_data[1]),
    .en(\u_cpu/u_debug/debug_cmd ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_inst [1]));  // sources/rtl/mcu/debug.v(100)
  reg_ar_as_w1 \u_cpu/u_debug/reg0_b2  (
    .clk(vga_clk_pad),
    .d(recv_data[2]),
    .en(\u_cpu/u_debug/debug_cmd ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_inst [2]));  // sources/rtl/mcu/debug.v(100)
  reg_ar_as_w1 \u_cpu/u_debug/reg0_b3  (
    .clk(vga_clk_pad),
    .d(recv_data[3]),
    .en(\u_cpu/u_debug/debug_cmd ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_inst [3]));  // sources/rtl/mcu/debug.v(100)
  reg_ar_as_w1 \u_cpu/u_debug/reg0_b4  (
    .clk(vga_clk_pad),
    .d(recv_data[4]),
    .en(\u_cpu/u_debug/debug_cmd ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_inst [4]));  // sources/rtl/mcu/debug.v(100)
  reg_ar_as_w1 \u_cpu/u_debug/reg0_b5  (
    .clk(vga_clk_pad),
    .d(recv_data[5]),
    .en(\u_cpu/u_debug/debug_cmd ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_inst [5]));  // sources/rtl/mcu/debug.v(100)
  reg_ar_as_w1 \u_cpu/u_debug/reg0_b6  (
    .clk(vga_clk_pad),
    .d(recv_data[6]),
    .en(\u_cpu/u_debug/debug_cmd ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_inst [6]));  // sources/rtl/mcu/debug.v(100)
  reg_ar_as_w1 \u_cpu/u_debug/reg0_b7  (
    .clk(vga_clk_pad),
    .d(recv_data[7]),
    .en(\u_cpu/u_debug/debug_cmd ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_inst [7]));  // sources/rtl/mcu/debug.v(100)
  reg_ar_as_w1 \u_cpu/u_debug/reg1_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n4 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/read_abcd [0]));  // sources/rtl/mcu/debug.v(109)
  reg_ar_as_w1 \u_cpu/u_debug/reg1_b1  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n4 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/read_abcd [1]));  // sources/rtl/mcu/debug.v(109)
  reg_ar_as_w1 \u_cpu/u_debug/reg1_b2  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n4 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/read_abcd [2]));  // sources/rtl/mcu/debug.v(109)
  reg_ar_as_w1 \u_cpu/u_debug/reg1_b3  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n4 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/read_abcd [3]));  // sources/rtl/mcu/debug.v(109)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n7 [0]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[0]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b1  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n7 [1]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[1]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b10  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n7 [10]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[10]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b11  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n7 [11]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[11]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b12  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n7 [12]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[12]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b13  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n7 [13]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[13]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b14  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n7 [14]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[14]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b15  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n7 [15]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[15]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b16  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n7 [16]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[16]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b17  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n7 [17]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[17]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b18  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n7 [18]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[18]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b19  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n7 [19]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[19]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b2  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n7 [2]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[2]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b20  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n7 [20]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[20]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b21  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n7 [21]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[21]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b22  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n7 [22]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[22]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b23  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n7 [23]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[23]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b3  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n7 [3]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[3]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b4  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n7 [4]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[4]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b5  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n7 [5]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[5]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b6  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n7 [6]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[6]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b7  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n7 [7]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[7]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b8  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n7 [8]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[8]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg2_b9  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n7 [9]),
    .en(rom_wen),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(rom_waddr[9]));  // sources/rtl/mcu/debug.v(127)
  reg_sr_as_w1 \u_cpu/u_debug/reg3_b0  (
    .clk(vga_clk_pad),
    .d(recv_data[0]),
    .en(\u_cpu/u_debug/n5 ),
    .reset(\u_cpu/u_debug/clear_rom_data_cmd ),
    .set(1'b0),
    .q(rom_wdata[0]));  // sources/rtl/mcu/debug.v(136)
  reg_sr_as_w1 \u_cpu/u_debug/reg3_b1  (
    .clk(vga_clk_pad),
    .d(recv_data[1]),
    .en(\u_cpu/u_debug/n5 ),
    .reset(\u_cpu/u_debug/clear_rom_data_cmd ),
    .set(1'b0),
    .q(rom_wdata[1]));  // sources/rtl/mcu/debug.v(136)
  reg_sr_as_w1 \u_cpu/u_debug/reg3_b2  (
    .clk(vga_clk_pad),
    .d(recv_data[2]),
    .en(\u_cpu/u_debug/n5 ),
    .reset(\u_cpu/u_debug/clear_rom_data_cmd ),
    .set(1'b0),
    .q(rom_wdata[2]));  // sources/rtl/mcu/debug.v(136)
  reg_sr_as_w1 \u_cpu/u_debug/reg3_b3  (
    .clk(vga_clk_pad),
    .d(recv_data[3]),
    .en(\u_cpu/u_debug/n5 ),
    .reset(\u_cpu/u_debug/clear_rom_data_cmd ),
    .set(1'b0),
    .q(rom_wdata[3]));  // sources/rtl/mcu/debug.v(136)
  reg_sr_as_w1 \u_cpu/u_debug/reg3_b4  (
    .clk(vga_clk_pad),
    .d(recv_data[4]),
    .en(\u_cpu/u_debug/n5 ),
    .reset(\u_cpu/u_debug/clear_rom_data_cmd ),
    .set(1'b0),
    .q(rom_wdata[4]));  // sources/rtl/mcu/debug.v(136)
  reg_sr_as_w1 \u_cpu/u_debug/reg3_b5  (
    .clk(vga_clk_pad),
    .d(recv_data[5]),
    .en(\u_cpu/u_debug/n5 ),
    .reset(\u_cpu/u_debug/clear_rom_data_cmd ),
    .set(1'b0),
    .q(rom_wdata[5]));  // sources/rtl/mcu/debug.v(136)
  reg_sr_as_w1 \u_cpu/u_debug/reg3_b6  (
    .clk(vga_clk_pad),
    .d(recv_data[6]),
    .en(\u_cpu/u_debug/n5 ),
    .reset(\u_cpu/u_debug/clear_rom_data_cmd ),
    .set(1'b0),
    .q(rom_wdata[6]));  // sources/rtl/mcu/debug.v(136)
  reg_sr_as_w1 \u_cpu/u_debug/reg3_b7  (
    .clk(vga_clk_pad),
    .d(recv_data[7]),
    .en(\u_cpu/u_debug/n5 ),
    .reset(\u_cpu/u_debug/clear_rom_data_cmd ),
    .set(1'b0),
    .q(rom_wdata[7]));  // sources/rtl/mcu/debug.v(136)
  reg_sr_as_w1 \u_cpu/u_debug/reg4_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n13 [0]),
    .en(\u_cpu/dbg_rom_ren ),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_raddr [0]));  // sources/rtl/mcu/debug.v(151)
  reg_sr_as_w1 \u_cpu/u_debug/reg4_b1  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n13 [1]),
    .en(\u_cpu/dbg_rom_ren ),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_raddr [1]));  // sources/rtl/mcu/debug.v(151)
  reg_sr_as_w1 \u_cpu/u_debug/reg4_b10  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n13 [10]),
    .en(\u_cpu/dbg_rom_ren ),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_raddr [10]));  // sources/rtl/mcu/debug.v(151)
  reg_sr_as_w1 \u_cpu/u_debug/reg4_b11  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n13 [11]),
    .en(\u_cpu/dbg_rom_ren ),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_raddr [11]));  // sources/rtl/mcu/debug.v(151)
  reg_sr_as_w1 \u_cpu/u_debug/reg4_b2  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n13 [2]),
    .en(\u_cpu/dbg_rom_ren ),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_raddr [2]));  // sources/rtl/mcu/debug.v(151)
  reg_sr_as_w1 \u_cpu/u_debug/reg4_b3  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n13 [3]),
    .en(\u_cpu/dbg_rom_ren ),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_raddr [3]));  // sources/rtl/mcu/debug.v(151)
  reg_sr_as_w1 \u_cpu/u_debug/reg4_b4  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n13 [4]),
    .en(\u_cpu/dbg_rom_ren ),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_raddr [4]));  // sources/rtl/mcu/debug.v(151)
  reg_sr_as_w1 \u_cpu/u_debug/reg4_b5  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n13 [5]),
    .en(\u_cpu/dbg_rom_ren ),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_raddr [5]));  // sources/rtl/mcu/debug.v(151)
  reg_sr_as_w1 \u_cpu/u_debug/reg4_b6  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n13 [6]),
    .en(\u_cpu/dbg_rom_ren ),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_raddr [6]));  // sources/rtl/mcu/debug.v(151)
  reg_sr_as_w1 \u_cpu/u_debug/reg4_b7  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n13 [7]),
    .en(\u_cpu/dbg_rom_ren ),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_raddr [7]));  // sources/rtl/mcu/debug.v(151)
  reg_sr_as_w1 \u_cpu/u_debug/reg4_b8  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n13 [8]),
    .en(\u_cpu/dbg_rom_ren ),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_raddr [8]));  // sources/rtl/mcu/debug.v(151)
  reg_sr_as_w1 \u_cpu/u_debug/reg4_b9  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n13 [9]),
    .en(\u_cpu/dbg_rom_ren ),
    .reset(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_raddr [9]));  // sources/rtl/mcu/debug.v(151)
  reg_ar_as_w1 \u_cpu/u_debug/reg5_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n20 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_cmd[0]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg5_b1  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n20 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_cmd[1]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg5_b2  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n20 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_cmd[2]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg5_b3  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n20 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_cmd[3]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg5_b4  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n20 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_cmd[4]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg5_b5  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n20 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_cmd[5]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg5_b6  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n20 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_cmd[6]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg5_b7  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n20 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_cmd[7]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg6_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n21 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_data[0]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg6_b1  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n21 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_data[1]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg6_b2  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n21 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_data[2]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg6_b3  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n21 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_data[3]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg6_b4  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n21 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_data[4]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg6_b5  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n21 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_data[5]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg6_b6  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n21 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_data[6]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/reg6_b7  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n21 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_data[7]));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w1 \u_cpu/u_debug/rom_bk_en_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/rom_ren_d1 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_debug/rom_bk_en ));  // sources/rtl/mcu/debug.v(159)
  reg_ar_as_w1 \u_cpu/u_debug/rom_ren_d0_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/dbg_rom_ren ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_debug/rom_ren_d0 ));  // sources/rtl/mcu/debug.v(159)
  reg_ar_as_w1 \u_cpu/u_debug/rom_ren_d1_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/rom_ren_d0 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_debug/rom_ren_d1 ));  // sources/rtl/mcu/debug.v(159)
  reg_ar_as_w1 \u_cpu/u_debug/rom_ren_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n12 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_ren ));  // sources/rtl/mcu/debug.v(142)
  reg_ar_ss_w1 \u_cpu/u_debug/rom_wen_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n5 ),
    .en(1'b1),
    .reset(1'b0),
    .set(\u_cpu/u_debug/clear_rom_data_cmd ),
    .q(rom_wen));  // sources/rtl/mcu/debug.v(118)
  reg_ar_as_w1 \u_cpu/u_debug/send_en_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_debug/n17 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_en));  // sources/rtl/mcu/debug.v(165)
  reg_ar_as_w1 \u_cpu/u_decode/dbg_info_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n93 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [39]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/ex_alua_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n45 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [15]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/ex_alub_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n47 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [16]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/ex_aluc_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n49 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [17]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/ex_alud_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n51 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [18]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/ex_alue_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n53 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [19]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/ex_aluf_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n55 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [20]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/ex_alug_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n57 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [21]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/ex_aluh_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n59 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [22]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/ex_alui_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n61 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [23]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/ex_aluj_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n63 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [24]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/ex_aluk_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n65 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [25]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/inst_data_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n9 ),
    .en(\u_cpu/inst_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_decode/inst_data ));  // sources/rtl/mcu/decode.v(104)
  reg_ar_as_w1 \u_cpu/u_decode/rd_bus_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n69 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [27]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/rd_ram_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n71 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [28]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/reg0_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/inst [0]),
    .en(\u_cpu/u_decode/inst_data ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_data [0]));  // sources/rtl/mcu/decode.v(111)
  reg_ar_as_w1 \u_cpu/u_decode/reg0_b1  (
    .clk(vga_clk_pad),
    .d(\u_cpu/inst [1]),
    .en(\u_cpu/u_decode/inst_data ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_data [1]));  // sources/rtl/mcu/decode.v(111)
  reg_ar_as_w1 \u_cpu/u_decode/reg0_b2  (
    .clk(vga_clk_pad),
    .d(\u_cpu/inst [2]),
    .en(\u_cpu/u_decode/inst_data ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_data [2]));  // sources/rtl/mcu/decode.v(111)
  reg_ar_as_w1 \u_cpu/u_decode/reg0_b3  (
    .clk(vga_clk_pad),
    .d(\u_cpu/inst [3]),
    .en(\u_cpu/u_decode/inst_data ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_data [3]));  // sources/rtl/mcu/decode.v(111)
  reg_ar_as_w1 \u_cpu/u_decode/reg0_b4  (
    .clk(vga_clk_pad),
    .d(\u_cpu/inst [4]),
    .en(\u_cpu/u_decode/inst_data ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_data [4]));  // sources/rtl/mcu/decode.v(111)
  reg_ar_as_w1 \u_cpu/u_decode/reg0_b5  (
    .clk(vga_clk_pad),
    .d(\u_cpu/inst [5]),
    .en(\u_cpu/u_decode/inst_data ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_data [5]));  // sources/rtl/mcu/decode.v(111)
  reg_ar_as_w1 \u_cpu/u_decode/reg0_b6  (
    .clk(vga_clk_pad),
    .d(\u_cpu/inst [6]),
    .en(\u_cpu/u_decode/inst_data ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_data [6]));  // sources/rtl/mcu/decode.v(111)
  reg_ar_as_w1 \u_cpu/u_decode/reg0_b7  (
    .clk(vga_clk_pad),
    .d(\u_cpu/inst [7]),
    .en(\u_cpu/u_decode/inst_data ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_data [7]));  // sources/rtl/mcu/decode.v(111)
  reg_ar_as_w1 \u_cpu/u_decode/reg1_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/inst [0]),
    .en(\u_cpu/inst_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_decode/inst_d [0]));  // sources/rtl/mcu/decode.v(89)
  reg_ar_as_w1 \u_cpu/u_decode/reg1_b1  (
    .clk(vga_clk_pad),
    .d(\u_cpu/inst [1]),
    .en(\u_cpu/inst_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_decode/inst_d [1]));  // sources/rtl/mcu/decode.v(89)
  reg_ar_as_w1 \u_cpu/u_decode/reg1_b2  (
    .clk(vga_clk_pad),
    .d(\u_cpu/inst [2]),
    .en(\u_cpu/inst_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_decode/inst_d [2]));  // sources/rtl/mcu/decode.v(89)
  reg_ar_as_w1 \u_cpu/u_decode/reg1_b3  (
    .clk(vga_clk_pad),
    .d(\u_cpu/inst [3]),
    .en(\u_cpu/inst_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_decode/inst_d [3]));  // sources/rtl/mcu/decode.v(89)
  reg_ar_as_w1 \u_cpu/u_decode/reg1_b4  (
    .clk(vga_clk_pad),
    .d(\u_cpu/inst [4]),
    .en(\u_cpu/inst_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_decode/inst_d [4]));  // sources/rtl/mcu/decode.v(89)
  reg_ar_as_w1 \u_cpu/u_decode/reg1_b5  (
    .clk(vga_clk_pad),
    .d(\u_cpu/inst [5]),
    .en(\u_cpu/inst_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_decode/inst_d [5]));  // sources/rtl/mcu/decode.v(89)
  reg_ar_as_w1 \u_cpu/u_decode/reg1_b6  (
    .clk(vga_clk_pad),
    .d(\u_cpu/inst [6]),
    .en(\u_cpu/inst_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_decode/inst_d [6]));  // sources/rtl/mcu/decode.v(89)
  reg_ar_as_w1 \u_cpu/u_decode/reg1_b7  (
    .clk(vga_clk_pad),
    .d(\u_cpu/inst [7]),
    .en(\u_cpu/inst_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_decode/inst_d [7]));  // sources/rtl/mcu/decode.v(89)
  reg_ar_as_w1 \u_cpu/u_decode/wt_a_bt_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n33 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [9]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_a_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n17 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [1]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_a_rt_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n25 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [5]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_b_bt_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n35 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [10]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_b_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n19 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [2]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_b_rt_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n27 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [6]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_bus_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n67 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [26]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_c_bt_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n37 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [11]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_c_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n21 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [3]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_c_rt_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n29 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [7]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_d_bt_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n39 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [12]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_d_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n23 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [4]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_d_rt_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n31 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [8]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_pc_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n41 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [13]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_ram_a_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n73 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [29]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_ram_alu0_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n79 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [32]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_ram_alu1_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n81 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [33]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_ram_alu2_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n83 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [34]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_ram_alu3_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n85 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [35]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_ram_alu4_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n87 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [36]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_ram_alu5_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n89 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [37]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_ram_alu6_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n91 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [38]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_ram_b_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n75 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [30]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_ram_c_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n77 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [31]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_decode/wt_timer_cmd_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_decode/n43 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/decode_cmd [14]));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w1 \u_cpu/u_execute/bus_ren_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [27]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_ren));  // sources/rtl/mcu/execute.v(319)
  reg_ar_as_w1 \u_cpu/u_execute/bus_to_a_wen_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/bus_to_a_wen ));  // sources/rtl/mcu/execute.v(212)
  reg_ar_as_w1 \u_cpu/u_execute/bus_to_b_wen_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/bus_to_b_wen ));  // sources/rtl/mcu/execute.v(212)
  reg_ar_as_w1 \u_cpu/u_execute/bus_to_c_wen_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [11]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/bus_to_c_wen ));  // sources/rtl/mcu/execute.v(212)
  reg_ar_as_w1 \u_cpu/u_execute/bus_to_d_wen_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [12]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/bus_to_d_wen ));  // sources/rtl/mcu/execute.v(212)
  reg_ar_as_w1 \u_cpu/u_execute/bus_wen_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [26]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_wen));  // sources/rtl/mcu/execute.v(310)
  reg_ar_as_w1 \u_cpu/u_execute/dbg_info_en0_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [39]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/dbg_info_en0 ));  // sources/rtl/mcu/execute.v(336)
  reg_ar_as_w1 \u_cpu/u_execute/dbg_info_en_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n34 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info_en ));  // sources/rtl/mcu/execute.v(336)
  reg_ar_as_w1 \u_cpu/u_execute/pc_wen0_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [13]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/pc_wen0 ));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/pc_wen_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/pc_wen0 ),
    .en(~\u_bus/eq0/or_or_or_xor_i0[0]_i_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/pc_wen ));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/ram_ren_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [28]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_ren));  // sources/rtl/mcu/execute.v(327)
  reg_ar_as_w1 \u_cpu/u_execute/ram_to_a_wen_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/ram_to_a_wen ));  // sources/rtl/mcu/execute.v(203)
  reg_ar_as_w1 \u_cpu/u_execute/ram_to_b_wen_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/ram_to_b_wen ));  // sources/rtl/mcu/execute.v(203)
  reg_ar_as_w1 \u_cpu/u_execute/ram_to_c_wen_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/ram_to_c_wen ));  // sources/rtl/mcu/execute.v(203)
  reg_ar_as_w1 \u_cpu/u_execute/ram_to_d_wen_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/ram_to_d_wen ));  // sources/rtl/mcu/execute.v(203)
  reg_ar_as_w1 \u_cpu/u_execute/ram_wen_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n40 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_wen));  // sources/rtl/mcu/execute.v(359)
  reg_ar_as_w1 \u_cpu/u_execute/reg0_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n4 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_wdata[0]));  // sources/rtl/mcu/execute.v(228)
  reg_ar_as_w1 \u_cpu/u_execute/reg0_b1  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n4 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_wdata[1]));  // sources/rtl/mcu/execute.v(228)
  reg_ar_as_w1 \u_cpu/u_execute/reg0_b2  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n4 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_wdata[2]));  // sources/rtl/mcu/execute.v(228)
  reg_ar_as_w1 \u_cpu/u_execute/reg0_b3  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n4 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_wdata[3]));  // sources/rtl/mcu/execute.v(228)
  reg_ar_as_w1 \u_cpu/u_execute/reg0_b4  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n4 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_wdata[4]));  // sources/rtl/mcu/execute.v(228)
  reg_ar_as_w1 \u_cpu/u_execute/reg0_b5  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n4 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_wdata[5]));  // sources/rtl/mcu/execute.v(228)
  reg_ar_as_w1 \u_cpu/u_execute/reg0_b6  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n4 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_wdata[6]));  // sources/rtl/mcu/execute.v(228)
  reg_ar_as_w1 \u_cpu/u_execute/reg0_b7  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n4 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_wdata[7]));  // sources/rtl/mcu/execute.v(228)
  reg_ar_as_w1 \u_cpu/u_execute/reg10_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n52 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_wdata[0]));  // sources/rtl/mcu/execute.v(391)
  reg_ar_as_w1 \u_cpu/u_execute/reg10_b1  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n52 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_wdata[1]));  // sources/rtl/mcu/execute.v(391)
  reg_ar_as_w1 \u_cpu/u_execute/reg10_b2  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n52 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_wdata[2]));  // sources/rtl/mcu/execute.v(391)
  reg_ar_as_w1 \u_cpu/u_execute/reg10_b3  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n52 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_wdata[3]));  // sources/rtl/mcu/execute.v(391)
  reg_ar_as_w1 \u_cpu/u_execute/reg10_b4  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n52 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_wdata[4]));  // sources/rtl/mcu/execute.v(391)
  reg_ar_as_w1 \u_cpu/u_execute/reg10_b5  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n52 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_wdata[5]));  // sources/rtl/mcu/execute.v(391)
  reg_ar_as_w1 \u_cpu/u_execute/reg10_b6  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n52 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_wdata[6]));  // sources/rtl/mcu/execute.v(391)
  reg_ar_as_w1 \u_cpu/u_execute/reg10_b7  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n52 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_wdata[7]));  // sources/rtl/mcu/execute.v(391)
  reg_ar_as_w1 \u_cpu/u_execute/reg11_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_data [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/rom_data [0]));  // sources/rtl/mcu/execute.v(185)
  reg_ar_as_w1 \u_cpu/u_execute/reg11_b1  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_data [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/rom_data [1]));  // sources/rtl/mcu/execute.v(185)
  reg_ar_as_w1 \u_cpu/u_execute/reg11_b2  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_data [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/rom_data [2]));  // sources/rtl/mcu/execute.v(185)
  reg_ar_as_w1 \u_cpu/u_execute/reg11_b3  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_data [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/rom_data [3]));  // sources/rtl/mcu/execute.v(185)
  reg_ar_as_w1 \u_cpu/u_execute/reg11_b4  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_data [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/rom_data [4]));  // sources/rtl/mcu/execute.v(185)
  reg_ar_as_w1 \u_cpu/u_execute/reg11_b5  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_data [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/rom_data [5]));  // sources/rtl/mcu/execute.v(185)
  reg_ar_as_w1 \u_cpu/u_execute/reg11_b6  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_data [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/rom_data [6]));  // sources/rtl/mcu/execute.v(185)
  reg_ar_as_w1 \u_cpu/u_execute/reg11_b7  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_data [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/rom_data [7]));  // sources/rtl/mcu/execute.v(185)
  reg_ar_as_w1 \u_cpu/u_execute/reg1_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n7 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_in2 [0]));  // sources/rtl/mcu/execute.v(244)
  reg_ar_as_w1 \u_cpu/u_execute/reg1_b1  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n7 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_in2 [1]));  // sources/rtl/mcu/execute.v(244)
  reg_ar_as_w1 \u_cpu/u_execute/reg1_b2  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n7 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_in2 [2]));  // sources/rtl/mcu/execute.v(244)
  reg_ar_as_w1 \u_cpu/u_execute/reg1_b3  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n7 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_in2 [3]));  // sources/rtl/mcu/execute.v(244)
  reg_ar_as_w1 \u_cpu/u_execute/reg1_b4  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n7 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_in2 [4]));  // sources/rtl/mcu/execute.v(244)
  reg_ar_as_w1 \u_cpu/u_execute/reg1_b5  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n7 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_in2 [5]));  // sources/rtl/mcu/execute.v(244)
  reg_ar_as_w1 \u_cpu/u_execute/reg1_b6  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n7 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_in2 [6]));  // sources/rtl/mcu/execute.v(244)
  reg_ar_as_w1 \u_cpu/u_execute/reg1_b7  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n7 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_in2 [7]));  // sources/rtl/mcu/execute.v(244)
  reg_ar_as_w1 \u_cpu/u_execute/reg2_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n17 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/C [0]));  // sources/rtl/mcu/execute.v(260)
  reg_ar_as_w1 \u_cpu/u_execute/reg2_b1  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n17 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/C [1]));  // sources/rtl/mcu/execute.v(260)
  reg_ar_as_w1 \u_cpu/u_execute/reg2_b2  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n17 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/C [2]));  // sources/rtl/mcu/execute.v(260)
  reg_ar_as_w1 \u_cpu/u_execute/reg2_b3  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n17 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/C [3]));  // sources/rtl/mcu/execute.v(260)
  reg_ar_as_w1 \u_cpu/u_execute/reg2_b4  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n17 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/C [4]));  // sources/rtl/mcu/execute.v(260)
  reg_ar_as_w1 \u_cpu/u_execute/reg2_b5  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n17 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/C [5]));  // sources/rtl/mcu/execute.v(260)
  reg_ar_as_w1 \u_cpu/u_execute/reg2_b6  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n17 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/C [6]));  // sources/rtl/mcu/execute.v(260)
  reg_ar_as_w1 \u_cpu/u_execute/reg2_b7  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n17 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/C [7]));  // sources/rtl/mcu/execute.v(260)
  reg_ar_as_w1 \u_cpu/u_execute/reg3_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n29 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_raddr[0]));  // sources/rtl/mcu/execute.v(276)
  reg_ar_as_w1 \u_cpu/u_execute/reg3_b1  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n29 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_raddr[1]));  // sources/rtl/mcu/execute.v(276)
  reg_ar_as_w1 \u_cpu/u_execute/reg3_b2  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n29 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_raddr[2]));  // sources/rtl/mcu/execute.v(276)
  reg_ar_as_w1 \u_cpu/u_execute/reg3_b3  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n29 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_raddr[3]));  // sources/rtl/mcu/execute.v(276)
  reg_ar_as_w1 \u_cpu/u_execute/reg3_b4  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n29 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_raddr[4]));  // sources/rtl/mcu/execute.v(276)
  reg_ar_as_w1 \u_cpu/u_execute/reg3_b5  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n29 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_raddr[5]));  // sources/rtl/mcu/execute.v(276)
  reg_ar_as_w1 \u_cpu/u_execute/reg3_b6  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n29 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_raddr[6]));  // sources/rtl/mcu/execute.v(276)
  reg_ar_as_w1 \u_cpu/u_execute/reg3_b7  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n29 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_raddr[7]));  // sources/rtl/mcu/execute.v(276)
  reg_ar_as_w1 \u_cpu/u_execute/reg4_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/C [0]),
    .en(~\u_bus/eq0/or_or_or_xor_i0[0]_i_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/pc_wdata [0]));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/reg4_b1  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/C [1]),
    .en(~\u_bus/eq0/or_or_or_xor_i0[0]_i_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/pc_wdata [1]));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/reg4_b10  (
    .clk(vga_clk_pad),
    .d(\u_cpu/alu_in2 [2]),
    .en(~\u_bus/eq0/or_or_or_xor_i0[0]_i_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/pc_wdata [10]));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/reg4_b11  (
    .clk(vga_clk_pad),
    .d(\u_cpu/alu_in2 [3]),
    .en(~\u_bus/eq0/or_or_or_xor_i0[0]_i_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/pc_wdata [11]));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/reg4_b2  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/C [2]),
    .en(~\u_bus/eq0/or_or_or_xor_i0[0]_i_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/pc_wdata [2]));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/reg4_b3  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/C [3]),
    .en(~\u_bus/eq0/or_or_or_xor_i0[0]_i_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/pc_wdata [3]));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/reg4_b4  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/C [4]),
    .en(~\u_bus/eq0/or_or_or_xor_i0[0]_i_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/pc_wdata [4]));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/reg4_b5  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/C [5]),
    .en(~\u_bus/eq0/or_or_or_xor_i0[0]_i_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/pc_wdata [5]));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/reg4_b6  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/C [6]),
    .en(~\u_bus/eq0/or_or_or_xor_i0[0]_i_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/pc_wdata [6]));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/reg4_b7  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/C [7]),
    .en(~\u_bus/eq0/or_or_or_xor_i0[0]_i_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/pc_wdata [7]));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/reg4_b8  (
    .clk(vga_clk_pad),
    .d(\u_cpu/alu_in2 [0]),
    .en(~\u_bus/eq0/or_or_or_xor_i0[0]_i_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/pc_wdata [8]));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/reg4_b9  (
    .clk(vga_clk_pad),
    .d(\u_cpu/alu_in2 [1]),
    .en(~\u_bus/eq0/or_or_or_xor_i0[0]_i_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/pc_wdata [9]));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/C [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [0]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b1  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/C [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [1]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b10  (
    .clk(vga_clk_pad),
    .d(\u_cpu/alu_in2 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [10]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b11  (
    .clk(vga_clk_pad),
    .d(\u_cpu/alu_in2 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [11]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b12  (
    .clk(vga_clk_pad),
    .d(\u_cpu/alu_in2 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [12]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b13  (
    .clk(vga_clk_pad),
    .d(\u_cpu/alu_in2 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [13]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b14  (
    .clk(vga_clk_pad),
    .d(\u_cpu/alu_in2 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [14]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b15  (
    .clk(vga_clk_pad),
    .d(\u_cpu/alu_in2 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [15]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b16  (
    .clk(vga_clk_pad),
    .d(bus_wdata[0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [16]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b17  (
    .clk(vga_clk_pad),
    .d(bus_wdata[1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [17]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b18  (
    .clk(vga_clk_pad),
    .d(bus_wdata[2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [18]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b19  (
    .clk(vga_clk_pad),
    .d(bus_wdata[3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [19]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b2  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/C [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [2]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b20  (
    .clk(vga_clk_pad),
    .d(bus_wdata[4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [20]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b21  (
    .clk(vga_clk_pad),
    .d(bus_wdata[5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [21]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b22  (
    .clk(vga_clk_pad),
    .d(bus_wdata[6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [22]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b23  (
    .clk(vga_clk_pad),
    .d(bus_wdata[7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [23]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b3  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/C [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [3]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b4  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/C [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [4]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b5  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/C [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [5]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b6  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/C [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [6]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b7  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/C [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [7]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b8  (
    .clk(vga_clk_pad),
    .d(\u_cpu/alu_in2 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [8]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg5_b9  (
    .clk(vga_clk_pad),
    .d(\u_cpu/alu_in2 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wdata [9]));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/reg6_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [15]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_cmd [0]));  // sources/rtl/mcu/execute.v(301)
  reg_ar_as_w1 \u_cpu/u_execute/reg6_b1  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [16]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_cmd [1]));  // sources/rtl/mcu/execute.v(301)
  reg_ar_as_w1 \u_cpu/u_execute/reg6_b10  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [25]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_cmd [10]));  // sources/rtl/mcu/execute.v(301)
  reg_ar_as_w1 \u_cpu/u_execute/reg6_b2  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [17]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_cmd [2]));  // sources/rtl/mcu/execute.v(301)
  reg_ar_as_w1 \u_cpu/u_execute/reg6_b3  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [18]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_cmd [3]));  // sources/rtl/mcu/execute.v(301)
  reg_ar_as_w1 \u_cpu/u_execute/reg6_b4  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [19]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_cmd [4]));  // sources/rtl/mcu/execute.v(301)
  reg_ar_as_w1 \u_cpu/u_execute/reg6_b5  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [20]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_cmd [5]));  // sources/rtl/mcu/execute.v(301)
  reg_ar_as_w1 \u_cpu/u_execute/reg6_b6  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [21]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_cmd [6]));  // sources/rtl/mcu/execute.v(301)
  reg_ar_as_w1 \u_cpu/u_execute/reg6_b7  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [22]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_cmd [7]));  // sources/rtl/mcu/execute.v(301)
  reg_ar_as_w1 \u_cpu/u_execute/reg6_b8  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [23]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_cmd [8]));  // sources/rtl/mcu/execute.v(301)
  reg_ar_as_w1 \u_cpu/u_execute/reg6_b9  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [24]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/alu_cmd [9]));  // sources/rtl/mcu/execute.v(301)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n39 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [0]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b1  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n39 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [1]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b10  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n39 [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [10]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b11  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n39 [11]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [11]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b12  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n39 [12]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [12]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b13  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n39 [13]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [13]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b14  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n39 [14]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [14]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b15  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n39 [15]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [15]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b2  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n39 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [2]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b3  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n39 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [3]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b4  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n39 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [4]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b5  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n39 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [5]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b6  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n39 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [6]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b7  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n39 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [7]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b8  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n39 [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [8]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg7_b9  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/n39 [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_info [9]));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w1 \u_cpu/u_execute/reg8_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [29]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/wt_ram_cmd [0]));  // sources/rtl/mcu/execute.v(359)
  reg_ar_as_w1 \u_cpu/u_execute/reg8_b1  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [30]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/wt_ram_cmd [1]));  // sources/rtl/mcu/execute.v(359)
  reg_ar_as_w1 \u_cpu/u_execute/reg8_b2  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [31]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/wt_ram_cmd [2]));  // sources/rtl/mcu/execute.v(359)
  reg_ar_as_w1 \u_cpu/u_execute/reg8_b3  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [32]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/wt_ram_cmd [3]));  // sources/rtl/mcu/execute.v(359)
  reg_ar_as_w1 \u_cpu/u_execute/reg8_b4  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [33]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/wt_ram_cmd [4]));  // sources/rtl/mcu/execute.v(359)
  reg_ar_as_w1 \u_cpu/u_execute/reg8_b5  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [34]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/wt_ram_cmd [5]));  // sources/rtl/mcu/execute.v(359)
  reg_ar_as_w1 \u_cpu/u_execute/reg8_b6  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [35]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/wt_ram_cmd [6]));  // sources/rtl/mcu/execute.v(359)
  reg_ar_as_w1 \u_cpu/u_execute/reg8_b7  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [36]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/wt_ram_cmd [7]));  // sources/rtl/mcu/execute.v(359)
  reg_ar_as_w1 \u_cpu/u_execute/reg8_b8  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [37]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/wt_ram_cmd [8]));  // sources/rtl/mcu/execute.v(359)
  reg_ar_as_w1 \u_cpu/u_execute/reg8_b9  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [38]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/wt_ram_cmd [9]));  // sources/rtl/mcu/execute.v(359)
  reg_ar_as_w1 \u_cpu/u_execute/reg9_b0  (
    .clk(vga_clk_pad),
    .d(bus_raddr[0]),
    .en(\u_cpu/u_execute/n40 ),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_waddr[0]));  // sources/rtl/mcu/execute.v(366)
  reg_ar_as_w1 \u_cpu/u_execute/reg9_b1  (
    .clk(vga_clk_pad),
    .d(bus_raddr[1]),
    .en(\u_cpu/u_execute/n40 ),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_waddr[1]));  // sources/rtl/mcu/execute.v(366)
  reg_ar_as_w1 \u_cpu/u_execute/reg9_b2  (
    .clk(vga_clk_pad),
    .d(bus_raddr[2]),
    .en(\u_cpu/u_execute/n40 ),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_waddr[2]));  // sources/rtl/mcu/execute.v(366)
  reg_ar_as_w1 \u_cpu/u_execute/reg9_b3  (
    .clk(vga_clk_pad),
    .d(bus_raddr[3]),
    .en(\u_cpu/u_execute/n40 ),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_waddr[3]));  // sources/rtl/mcu/execute.v(366)
  reg_ar_as_w1 \u_cpu/u_execute/reg9_b4  (
    .clk(vga_clk_pad),
    .d(bus_raddr[4]),
    .en(\u_cpu/u_execute/n40 ),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_waddr[4]));  // sources/rtl/mcu/execute.v(366)
  reg_ar_as_w1 \u_cpu/u_execute/reg9_b5  (
    .clk(vga_clk_pad),
    .d(bus_raddr[5]),
    .en(\u_cpu/u_execute/n40 ),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_waddr[5]));  // sources/rtl/mcu/execute.v(366)
  reg_ar_as_w1 \u_cpu/u_execute/reg9_b6  (
    .clk(vga_clk_pad),
    .d(bus_raddr[6]),
    .en(\u_cpu/u_execute/n40 ),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_waddr[6]));  // sources/rtl/mcu/execute.v(366)
  reg_ar_as_w1 \u_cpu/u_execute/reg9_b7  (
    .clk(vga_clk_pad),
    .d(bus_raddr[7]),
    .en(\u_cpu/u_execute/n40 ),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_waddr[7]));  // sources/rtl/mcu/execute.v(366)
  reg_ar_as_w1 \u_cpu/u_execute/rom_to_a_wen_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/rom_to_a_wen ));  // sources/rtl/mcu/execute.v(194)
  reg_ar_as_w1 \u_cpu/u_execute/rom_to_b_wen_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/rom_to_b_wen ));  // sources/rtl/mcu/execute.v(194)
  reg_ar_as_w1 \u_cpu/u_execute/rom_to_c_wen_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/rom_to_c_wen ));  // sources/rtl/mcu/execute.v(194)
  reg_ar_as_w1 \u_cpu/u_execute/rom_to_d_wen_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/rom_to_d_wen ));  // sources/rtl/mcu/execute.v(194)
  reg_ar_as_w1 \u_cpu/u_execute/timer_wen0_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/decode_cmd [14]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_execute/timer_wen0 ));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w1 \u_cpu/u_execute/timer_wen_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_execute/timer_wen0 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_wen ));  // sources/rtl/mcu/execute.v(295)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_fetch/add0/u0  (
    .a(\u_cpu/u_fetch/pc [0]),
    .b(1'b1),
    .c(\u_cpu/u_fetch/add0/c0 ),
    .o({\u_cpu/u_fetch/add0/c1 ,\u_cpu/u_fetch/n1 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_fetch/add0/u1  (
    .a(\u_cpu/u_fetch/pc [1]),
    .b(1'b0),
    .c(\u_cpu/u_fetch/add0/c1 ),
    .o({\u_cpu/u_fetch/add0/c2 ,\u_cpu/u_fetch/n1 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_fetch/add0/u10  (
    .a(\u_cpu/u_fetch/pc [10]),
    .b(1'b0),
    .c(\u_cpu/u_fetch/add0/c10 ),
    .o({\u_cpu/u_fetch/add0/c11 ,\u_cpu/u_fetch/n1 [10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_fetch/add0/u11  (
    .a(\u_cpu/u_fetch/pc [11]),
    .b(1'b0),
    .c(\u_cpu/u_fetch/add0/c11 ),
    .o({open_n752,\u_cpu/u_fetch/n1 [11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_fetch/add0/u2  (
    .a(\u_cpu/u_fetch/pc [2]),
    .b(1'b0),
    .c(\u_cpu/u_fetch/add0/c2 ),
    .o({\u_cpu/u_fetch/add0/c3 ,\u_cpu/u_fetch/n1 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_fetch/add0/u3  (
    .a(\u_cpu/u_fetch/pc [3]),
    .b(1'b0),
    .c(\u_cpu/u_fetch/add0/c3 ),
    .o({\u_cpu/u_fetch/add0/c4 ,\u_cpu/u_fetch/n1 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_fetch/add0/u4  (
    .a(\u_cpu/u_fetch/pc [4]),
    .b(1'b0),
    .c(\u_cpu/u_fetch/add0/c4 ),
    .o({\u_cpu/u_fetch/add0/c5 ,\u_cpu/u_fetch/n1 [4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_fetch/add0/u5  (
    .a(\u_cpu/u_fetch/pc [5]),
    .b(1'b0),
    .c(\u_cpu/u_fetch/add0/c5 ),
    .o({\u_cpu/u_fetch/add0/c6 ,\u_cpu/u_fetch/n1 [5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_fetch/add0/u6  (
    .a(\u_cpu/u_fetch/pc [6]),
    .b(1'b0),
    .c(\u_cpu/u_fetch/add0/c6 ),
    .o({\u_cpu/u_fetch/add0/c7 ,\u_cpu/u_fetch/n1 [6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_fetch/add0/u7  (
    .a(\u_cpu/u_fetch/pc [7]),
    .b(1'b0),
    .c(\u_cpu/u_fetch/add0/c7 ),
    .o({\u_cpu/u_fetch/add0/c8 ,\u_cpu/u_fetch/n1 [7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_fetch/add0/u8  (
    .a(\u_cpu/u_fetch/pc [8]),
    .b(1'b0),
    .c(\u_cpu/u_fetch/add0/c8 ),
    .o({\u_cpu/u_fetch/add0/c9 ,\u_cpu/u_fetch/n1 [8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_cpu/u_fetch/add0/u9  (
    .a(\u_cpu/u_fetch/pc [9]),
    .b(1'b0),
    .c(\u_cpu/u_fetch/add0/c9 ),
    .o({\u_cpu/u_fetch/add0/c10 ,\u_cpu/u_fetch/n1 [9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \u_cpu/u_fetch/add0/ucin  (
    .a(1'b0),
    .o({\u_cpu/u_fetch/add0/c0 ,open_n755}));
  reg_sr_as_w1 \u_cpu/u_fetch/fetch_en_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/timer_state ),
    .en(1'b1),
    .reset(\u_cpu/dbg_en ),
    .set(1'b0),
    .q(\u_cpu/u_fetch/fetch_en ));  // sources/rtl/mcu/fetch.v(64)
  reg_ar_as_w1 \u_cpu/u_fetch/inst_en_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n8 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/inst_en ));  // sources/rtl/mcu/fetch.v(97)
  reg_sr_as_w1 \u_cpu/u_fetch/reg0_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n3 [0]),
    .en(1'b1),
    .reset(\u_cpu/dbg_en ),
    .set(1'b0),
    .q(\u_cpu/u_fetch/pc [0]));  // sources/rtl/mcu/fetch.v(75)
  reg_sr_as_w1 \u_cpu/u_fetch/reg0_b1  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n3 [1]),
    .en(1'b1),
    .reset(\u_cpu/dbg_en ),
    .set(1'b0),
    .q(\u_cpu/u_fetch/pc [1]));  // sources/rtl/mcu/fetch.v(75)
  reg_sr_as_w1 \u_cpu/u_fetch/reg0_b10  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n3 [10]),
    .en(1'b1),
    .reset(\u_cpu/dbg_en ),
    .set(1'b0),
    .q(\u_cpu/u_fetch/pc [10]));  // sources/rtl/mcu/fetch.v(75)
  reg_sr_as_w1 \u_cpu/u_fetch/reg0_b11  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n3 [11]),
    .en(1'b1),
    .reset(\u_cpu/dbg_en ),
    .set(1'b0),
    .q(\u_cpu/u_fetch/pc [11]));  // sources/rtl/mcu/fetch.v(75)
  reg_sr_as_w1 \u_cpu/u_fetch/reg0_b2  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n3 [2]),
    .en(1'b1),
    .reset(\u_cpu/dbg_en ),
    .set(1'b0),
    .q(\u_cpu/u_fetch/pc [2]));  // sources/rtl/mcu/fetch.v(75)
  reg_sr_as_w1 \u_cpu/u_fetch/reg0_b3  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n3 [3]),
    .en(1'b1),
    .reset(\u_cpu/dbg_en ),
    .set(1'b0),
    .q(\u_cpu/u_fetch/pc [3]));  // sources/rtl/mcu/fetch.v(75)
  reg_sr_as_w1 \u_cpu/u_fetch/reg0_b4  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n3 [4]),
    .en(1'b1),
    .reset(\u_cpu/dbg_en ),
    .set(1'b0),
    .q(\u_cpu/u_fetch/pc [4]));  // sources/rtl/mcu/fetch.v(75)
  reg_sr_as_w1 \u_cpu/u_fetch/reg0_b5  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n3 [5]),
    .en(1'b1),
    .reset(\u_cpu/dbg_en ),
    .set(1'b0),
    .q(\u_cpu/u_fetch/pc [5]));  // sources/rtl/mcu/fetch.v(75)
  reg_sr_as_w1 \u_cpu/u_fetch/reg0_b6  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n3 [6]),
    .en(1'b1),
    .reset(\u_cpu/dbg_en ),
    .set(1'b0),
    .q(\u_cpu/u_fetch/pc [6]));  // sources/rtl/mcu/fetch.v(75)
  reg_sr_as_w1 \u_cpu/u_fetch/reg0_b7  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n3 [7]),
    .en(1'b1),
    .reset(\u_cpu/dbg_en ),
    .set(1'b0),
    .q(\u_cpu/u_fetch/pc [7]));  // sources/rtl/mcu/fetch.v(75)
  reg_sr_as_w1 \u_cpu/u_fetch/reg0_b8  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n3 [8]),
    .en(1'b1),
    .reset(\u_cpu/dbg_en ),
    .set(1'b0),
    .q(\u_cpu/u_fetch/pc [8]));  // sources/rtl/mcu/fetch.v(75)
  reg_sr_as_w1 \u_cpu/u_fetch/reg0_b9  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n3 [9]),
    .en(1'b1),
    .reset(\u_cpu/dbg_en ),
    .set(1'b0),
    .q(\u_cpu/u_fetch/pc [9]));  // sources/rtl/mcu/fetch.v(75)
  reg_ar_as_w1 \u_cpu/u_fetch/reg1_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n7 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_raddr[0]));  // sources/rtl/mcu/fetch.v(90)
  reg_ar_as_w1 \u_cpu/u_fetch/reg1_b1  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n7 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_raddr[1]));  // sources/rtl/mcu/fetch.v(90)
  reg_ar_as_w1 \u_cpu/u_fetch/reg1_b10  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n7 [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_raddr[10]));  // sources/rtl/mcu/fetch.v(90)
  reg_ar_as_w1 \u_cpu/u_fetch/reg1_b11  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n7 [11]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_raddr[11]));  // sources/rtl/mcu/fetch.v(90)
  reg_ar_as_w1 \u_cpu/u_fetch/reg1_b2  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n7 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_raddr[2]));  // sources/rtl/mcu/fetch.v(90)
  reg_ar_as_w1 \u_cpu/u_fetch/reg1_b3  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n7 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_raddr[3]));  // sources/rtl/mcu/fetch.v(90)
  reg_ar_as_w1 \u_cpu/u_fetch/reg1_b4  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n7 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_raddr[4]));  // sources/rtl/mcu/fetch.v(90)
  reg_ar_as_w1 \u_cpu/u_fetch/reg1_b5  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n7 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_raddr[5]));  // sources/rtl/mcu/fetch.v(90)
  reg_ar_as_w1 \u_cpu/u_fetch/reg1_b6  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n7 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_raddr[6]));  // sources/rtl/mcu/fetch.v(90)
  reg_ar_as_w1 \u_cpu/u_fetch/reg1_b7  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n7 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_raddr[7]));  // sources/rtl/mcu/fetch.v(90)
  reg_ar_as_w1 \u_cpu/u_fetch/reg1_b8  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n7 [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_raddr[8]));  // sources/rtl/mcu/fetch.v(90)
  reg_ar_as_w1 \u_cpu/u_fetch/reg1_b9  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n7 [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_raddr[9]));  // sources/rtl/mcu/fetch.v(90)
  reg_ar_as_w1 \u_cpu/u_fetch/reg2_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n10 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/inst [0]));  // sources/rtl/mcu/fetch.v(106)
  reg_ar_as_w1 \u_cpu/u_fetch/reg2_b1  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n10 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/inst [1]));  // sources/rtl/mcu/fetch.v(106)
  reg_ar_as_w1 \u_cpu/u_fetch/reg2_b2  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n10 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/inst [2]));  // sources/rtl/mcu/fetch.v(106)
  reg_ar_as_w1 \u_cpu/u_fetch/reg2_b3  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n10 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/inst [3]));  // sources/rtl/mcu/fetch.v(106)
  reg_ar_as_w1 \u_cpu/u_fetch/reg2_b4  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n10 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/inst [4]));  // sources/rtl/mcu/fetch.v(106)
  reg_ar_as_w1 \u_cpu/u_fetch/reg2_b5  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n10 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/inst [5]));  // sources/rtl/mcu/fetch.v(106)
  reg_ar_as_w1 \u_cpu/u_fetch/reg2_b6  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n10 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/inst [6]));  // sources/rtl/mcu/fetch.v(106)
  reg_ar_as_w1 \u_cpu/u_fetch/reg2_b7  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n10 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/inst [7]));  // sources/rtl/mcu/fetch.v(106)
  reg_ar_as_w1 \u_cpu/u_fetch/reg3_b0  (
    .clk(vga_clk_pad),
    .d(rom_rdata[0]),
    .en(\u_cpu/dbg_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_rdata [0]));  // sources/rtl/mcu/fetch.v(113)
  reg_ar_as_w1 \u_cpu/u_fetch/reg3_b1  (
    .clk(vga_clk_pad),
    .d(rom_rdata[1]),
    .en(\u_cpu/dbg_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_rdata [1]));  // sources/rtl/mcu/fetch.v(113)
  reg_ar_as_w1 \u_cpu/u_fetch/reg3_b2  (
    .clk(vga_clk_pad),
    .d(rom_rdata[2]),
    .en(\u_cpu/dbg_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_rdata [2]));  // sources/rtl/mcu/fetch.v(113)
  reg_ar_as_w1 \u_cpu/u_fetch/reg3_b3  (
    .clk(vga_clk_pad),
    .d(rom_rdata[3]),
    .en(\u_cpu/dbg_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_rdata [3]));  // sources/rtl/mcu/fetch.v(113)
  reg_ar_as_w1 \u_cpu/u_fetch/reg3_b4  (
    .clk(vga_clk_pad),
    .d(rom_rdata[4]),
    .en(\u_cpu/dbg_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_rdata [4]));  // sources/rtl/mcu/fetch.v(113)
  reg_ar_as_w1 \u_cpu/u_fetch/reg3_b5  (
    .clk(vga_clk_pad),
    .d(rom_rdata[5]),
    .en(\u_cpu/dbg_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_rdata [5]));  // sources/rtl/mcu/fetch.v(113)
  reg_ar_as_w1 \u_cpu/u_fetch/reg3_b6  (
    .clk(vga_clk_pad),
    .d(rom_rdata[6]),
    .en(\u_cpu/dbg_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_rdata [6]));  // sources/rtl/mcu/fetch.v(113)
  reg_ar_as_w1 \u_cpu/u_fetch/reg3_b7  (
    .clk(vga_clk_pad),
    .d(rom_rdata[7]),
    .en(\u_cpu/dbg_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/dbg_rom_rdata [7]));  // sources/rtl/mcu/fetch.v(113)
  reg_ar_as_w1 \u_cpu/u_fetch/rom_bk_en_reg  (
    .clk(vga_clk_pad),
    .d(rom_ren),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_fetch/rom_bk_en ));  // sources/rtl/mcu/fetch.v(97)
  reg_ar_as_w1 \u_cpu/u_fetch/rom_ren_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_fetch/n5 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_ren));  // sources/rtl/mcu/fetch.v(81)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b0  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_timer/n3 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [0]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b1  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_timer/n3 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [1]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b10  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_timer/n3 [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [10]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b11  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_timer/n3 [11]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [11]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b12  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_timer/n3 [12]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [12]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b13  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_timer/n3 [13]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [13]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b14  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_timer/n3 [14]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [14]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b15  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_timer/n3 [15]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [15]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b16  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_timer/n3 [16]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [16]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b17  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_timer/n3 [17]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [17]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b18  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_timer/n3 [18]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [18]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b19  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_timer/n3 [19]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [19]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b2  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_timer/n3 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [2]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b20  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_timer/n3 [20]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [20]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b21  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_timer/n3 [21]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [21]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b22  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_timer/n3 [22]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [22]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b23  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_timer/n3 [23]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [23]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b3  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_timer/n3 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [3]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b4  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_timer/n3 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [4]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b5  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_timer/n3 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [5]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b6  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_timer/n3 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [6]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b7  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_timer/n3 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [7]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b8  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_timer/n3 [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [8]));  // sources/rtl/mcu/timer.v(42)
  reg_ar_as_w1 \u_cpu/u_timer/reg0_b9  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_timer/n3 [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/u_timer/cnt [9]));  // sources/rtl/mcu/timer.v(42)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_timer/sub0/u0  (
    .a(\u_cpu/u_timer/cnt [0]),
    .b(1'b1),
    .c(\u_cpu/u_timer/sub0/c0 ),
    .o({\u_cpu/u_timer/sub0/c1 ,\u_cpu/u_timer/n1 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_timer/sub0/u1  (
    .a(\u_cpu/u_timer/cnt [1]),
    .b(1'b0),
    .c(\u_cpu/u_timer/sub0/c1 ),
    .o({\u_cpu/u_timer/sub0/c2 ,\u_cpu/u_timer/n1 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_timer/sub0/u10  (
    .a(\u_cpu/u_timer/cnt [10]),
    .b(1'b0),
    .c(\u_cpu/u_timer/sub0/c10 ),
    .o({\u_cpu/u_timer/sub0/c11 ,\u_cpu/u_timer/n1 [10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_timer/sub0/u11  (
    .a(\u_cpu/u_timer/cnt [11]),
    .b(1'b0),
    .c(\u_cpu/u_timer/sub0/c11 ),
    .o({\u_cpu/u_timer/sub0/c12 ,\u_cpu/u_timer/n1 [11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_timer/sub0/u12  (
    .a(\u_cpu/u_timer/cnt [12]),
    .b(1'b0),
    .c(\u_cpu/u_timer/sub0/c12 ),
    .o({\u_cpu/u_timer/sub0/c13 ,\u_cpu/u_timer/n1 [12]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_timer/sub0/u13  (
    .a(\u_cpu/u_timer/cnt [13]),
    .b(1'b0),
    .c(\u_cpu/u_timer/sub0/c13 ),
    .o({\u_cpu/u_timer/sub0/c14 ,\u_cpu/u_timer/n1 [13]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_timer/sub0/u14  (
    .a(\u_cpu/u_timer/cnt [14]),
    .b(1'b0),
    .c(\u_cpu/u_timer/sub0/c14 ),
    .o({\u_cpu/u_timer/sub0/c15 ,\u_cpu/u_timer/n1 [14]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_timer/sub0/u15  (
    .a(\u_cpu/u_timer/cnt [15]),
    .b(1'b0),
    .c(\u_cpu/u_timer/sub0/c15 ),
    .o({\u_cpu/u_timer/sub0/c16 ,\u_cpu/u_timer/n1 [15]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_timer/sub0/u16  (
    .a(\u_cpu/u_timer/cnt [16]),
    .b(1'b0),
    .c(\u_cpu/u_timer/sub0/c16 ),
    .o({\u_cpu/u_timer/sub0/c17 ,\u_cpu/u_timer/n1 [16]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_timer/sub0/u17  (
    .a(\u_cpu/u_timer/cnt [17]),
    .b(1'b0),
    .c(\u_cpu/u_timer/sub0/c17 ),
    .o({\u_cpu/u_timer/sub0/c18 ,\u_cpu/u_timer/n1 [17]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_timer/sub0/u18  (
    .a(\u_cpu/u_timer/cnt [18]),
    .b(1'b0),
    .c(\u_cpu/u_timer/sub0/c18 ),
    .o({\u_cpu/u_timer/sub0/c19 ,\u_cpu/u_timer/n1 [18]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_timer/sub0/u19  (
    .a(\u_cpu/u_timer/cnt [19]),
    .b(1'b0),
    .c(\u_cpu/u_timer/sub0/c19 ),
    .o({\u_cpu/u_timer/sub0/c20 ,\u_cpu/u_timer/n1 [19]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_timer/sub0/u2  (
    .a(\u_cpu/u_timer/cnt [2]),
    .b(1'b0),
    .c(\u_cpu/u_timer/sub0/c2 ),
    .o({\u_cpu/u_timer/sub0/c3 ,\u_cpu/u_timer/n1 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_timer/sub0/u20  (
    .a(\u_cpu/u_timer/cnt [20]),
    .b(1'b0),
    .c(\u_cpu/u_timer/sub0/c20 ),
    .o({\u_cpu/u_timer/sub0/c21 ,\u_cpu/u_timer/n1 [20]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_timer/sub0/u21  (
    .a(\u_cpu/u_timer/cnt [21]),
    .b(1'b0),
    .c(\u_cpu/u_timer/sub0/c21 ),
    .o({\u_cpu/u_timer/sub0/c22 ,\u_cpu/u_timer/n1 [21]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_timer/sub0/u22  (
    .a(\u_cpu/u_timer/cnt [22]),
    .b(1'b0),
    .c(\u_cpu/u_timer/sub0/c22 ),
    .o({\u_cpu/u_timer/sub0/c23 ,\u_cpu/u_timer/n1 [22]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_timer/sub0/u23  (
    .a(\u_cpu/u_timer/cnt [23]),
    .b(1'b0),
    .c(\u_cpu/u_timer/sub0/c23 ),
    .o({open_n756,\u_cpu/u_timer/n1 [23]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_timer/sub0/u3  (
    .a(\u_cpu/u_timer/cnt [3]),
    .b(1'b0),
    .c(\u_cpu/u_timer/sub0/c3 ),
    .o({\u_cpu/u_timer/sub0/c4 ,\u_cpu/u_timer/n1 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_timer/sub0/u4  (
    .a(\u_cpu/u_timer/cnt [4]),
    .b(1'b0),
    .c(\u_cpu/u_timer/sub0/c4 ),
    .o({\u_cpu/u_timer/sub0/c5 ,\u_cpu/u_timer/n1 [4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_timer/sub0/u5  (
    .a(\u_cpu/u_timer/cnt [5]),
    .b(1'b0),
    .c(\u_cpu/u_timer/sub0/c5 ),
    .o({\u_cpu/u_timer/sub0/c6 ,\u_cpu/u_timer/n1 [5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_timer/sub0/u6  (
    .a(\u_cpu/u_timer/cnt [6]),
    .b(1'b0),
    .c(\u_cpu/u_timer/sub0/c6 ),
    .o({\u_cpu/u_timer/sub0/c7 ,\u_cpu/u_timer/n1 [6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_timer/sub0/u7  (
    .a(\u_cpu/u_timer/cnt [7]),
    .b(1'b0),
    .c(\u_cpu/u_timer/sub0/c7 ),
    .o({\u_cpu/u_timer/sub0/c8 ,\u_cpu/u_timer/n1 [7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_timer/sub0/u8  (
    .a(\u_cpu/u_timer/cnt [8]),
    .b(1'b0),
    .c(\u_cpu/u_timer/sub0/c8 ),
    .o({\u_cpu/u_timer/sub0/c9 ,\u_cpu/u_timer/n1 [8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_cpu/u_timer/sub0/u9  (
    .a(\u_cpu/u_timer/cnt [9]),
    .b(1'b0),
    .c(\u_cpu/u_timer/sub0/c9 ),
    .o({\u_cpu/u_timer/sub0/c10 ,\u_cpu/u_timer/n1 [9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB_CARRY"))
    \u_cpu/u_timer/sub0/ucin  (
    .a(1'b0),
    .o({\u_cpu/u_timer/sub0/c0 ,open_n759}));
  reg_ar_as_w1 \u_cpu/u_timer/timer_state_reg  (
    .clk(vga_clk_pad),
    .d(\u_cpu/u_timer/n4 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_cpu/timer_state ));  // sources/rtl/mcu/timer.v(48)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_key/add0/u0  (
    .a(\u_key/cnt [0]),
    .b(1'b1),
    .c(\u_key/add0/c0 ),
    .o({\u_key/add0/c1 ,\u_key/n3 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_key/add0/u1  (
    .a(\u_key/cnt [1]),
    .b(1'b0),
    .c(\u_key/add0/c1 ),
    .o({\u_key/add0/c2 ,\u_key/n3 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_key/add0/u10  (
    .a(\u_key/cnt [10]),
    .b(1'b0),
    .c(\u_key/add0/c10 ),
    .o({\u_key/add0/c11 ,\u_key/n3 [10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_key/add0/u11  (
    .a(\u_key/cnt [11]),
    .b(1'b0),
    .c(\u_key/add0/c11 ),
    .o({\u_key/add0/c12 ,\u_key/n3 [11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_key/add0/u12  (
    .a(\u_key/cnt [12]),
    .b(1'b0),
    .c(\u_key/add0/c12 ),
    .o({\u_key/add0/c13 ,\u_key/n3 [12]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_key/add0/u13  (
    .a(\u_key/cnt [13]),
    .b(1'b0),
    .c(\u_key/add0/c13 ),
    .o({\u_key/add0/c14 ,\u_key/n3 [13]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_key/add0/u14  (
    .a(\u_key/cnt [14]),
    .b(1'b0),
    .c(\u_key/add0/c14 ),
    .o({\u_key/add0/c15 ,\u_key/n3 [14]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_key/add0/u15  (
    .a(\u_key/cnt [15]),
    .b(1'b0),
    .c(\u_key/add0/c15 ),
    .o({\u_key/add0/c16 ,\u_key/n3 [15]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_key/add0/u16  (
    .a(\u_key/cnt [16]),
    .b(1'b0),
    .c(\u_key/add0/c16 ),
    .o({\u_key/add0/c17 ,\u_key/n3 [16]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_key/add0/u17  (
    .a(\u_key/cnt [17]),
    .b(1'b0),
    .c(\u_key/add0/c17 ),
    .o({\u_key/add0/c18 ,\u_key/n3 [17]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_key/add0/u18  (
    .a(\u_key/cnt [18]),
    .b(1'b0),
    .c(\u_key/add0/c18 ),
    .o({open_n760,\u_key/n3 [18]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_key/add0/u2  (
    .a(\u_key/cnt [2]),
    .b(1'b0),
    .c(\u_key/add0/c2 ),
    .o({\u_key/add0/c3 ,\u_key/n3 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_key/add0/u3  (
    .a(\u_key/cnt [3]),
    .b(1'b0),
    .c(\u_key/add0/c3 ),
    .o({\u_key/add0/c4 ,\u_key/n3 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_key/add0/u4  (
    .a(\u_key/cnt [4]),
    .b(1'b0),
    .c(\u_key/add0/c4 ),
    .o({\u_key/add0/c5 ,\u_key/n3 [4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_key/add0/u5  (
    .a(\u_key/cnt [5]),
    .b(1'b0),
    .c(\u_key/add0/c5 ),
    .o({\u_key/add0/c6 ,\u_key/n3 [5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_key/add0/u6  (
    .a(\u_key/cnt [6]),
    .b(1'b0),
    .c(\u_key/add0/c6 ),
    .o({\u_key/add0/c7 ,\u_key/n3 [6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_key/add0/u7  (
    .a(\u_key/cnt [7]),
    .b(1'b0),
    .c(\u_key/add0/c7 ),
    .o({\u_key/add0/c8 ,\u_key/n3 [7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_key/add0/u8  (
    .a(\u_key/cnt [8]),
    .b(1'b0),
    .c(\u_key/add0/c8 ),
    .o({\u_key/add0/c9 ,\u_key/n3 [8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_key/add0/u9  (
    .a(\u_key/cnt [9]),
    .b(1'b0),
    .c(\u_key/add0/c9 ),
    .o({\u_key/add0/c10 ,\u_key/n3 [9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \u_key/add0/ucin  (
    .a(1'b0),
    .o({\u_key/add0/c0 ,open_n763}));
  reg_ar_as_w1 \u_key/key_flag_reg  (
    .clk(vga_clk_pad),
    .d(\u_key/n25 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/key_flag ));  // sources/rtl/key/key.v(57)
  reg_ar_as_w1 \u_key/reg0_b0  (
    .clk(vga_clk_pad),
    .d(\u_key/n15 [0]),
    .en(\u_key/n14 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/key_d0 [0]));  // sources/rtl/key/key.v(50)
  reg_ar_as_w1 \u_key/reg0_b1  (
    .clk(vga_clk_pad),
    .d(\u_key/n15 [1]),
    .en(\u_key/n14 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/key_d0 [1]));  // sources/rtl/key/key.v(50)
  reg_ar_as_w1 \u_key/reg0_b2  (
    .clk(vga_clk_pad),
    .d(\u_key/n15 [2]),
    .en(\u_key/n14 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/key_d0 [2]));  // sources/rtl/key/key.v(50)
  reg_ar_as_w1 \u_key/reg0_b3  (
    .clk(vga_clk_pad),
    .d(\u_key/n15 [3]),
    .en(\u_key/n14 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/key_d0 [3]));  // sources/rtl/key/key.v(50)
  reg_ar_as_w1 \u_key/reg0_b4  (
    .clk(vga_clk_pad),
    .d(\u_key/n15 [4]),
    .en(\u_key/n14 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/key_d0 [4]));  // sources/rtl/key/key.v(50)
  reg_ar_as_w1 \u_key/reg0_b5  (
    .clk(vga_clk_pad),
    .d(\u_key/n15 [5]),
    .en(\u_key/n14 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/key_d0 [5]));  // sources/rtl/key/key.v(50)
  reg_ar_as_w1 \u_key/reg1_b0  (
    .clk(vga_clk_pad),
    .d(\u_key/key_d0 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/key_d1 [0]));  // sources/rtl/key/key.v(57)
  reg_ar_as_w1 \u_key/reg1_b1  (
    .clk(vga_clk_pad),
    .d(\u_key/key_d0 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/key_d1 [1]));  // sources/rtl/key/key.v(57)
  reg_ar_as_w1 \u_key/reg1_b2  (
    .clk(vga_clk_pad),
    .d(\u_key/key_d0 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/key_d1 [2]));  // sources/rtl/key/key.v(57)
  reg_ar_as_w1 \u_key/reg1_b3  (
    .clk(vga_clk_pad),
    .d(\u_key/key_d0 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/key_d1 [3]));  // sources/rtl/key/key.v(57)
  reg_ar_as_w1 \u_key/reg1_b4  (
    .clk(vga_clk_pad),
    .d(\u_key/key_d0 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/key_d1 [4]));  // sources/rtl/key/key.v(57)
  reg_ar_as_w1 \u_key/reg1_b5  (
    .clk(vga_clk_pad),
    .d(\u_key/key_d0 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/key_d1 [5]));  // sources/rtl/key/key.v(57)
  reg_sr_as_w1 \u_key/reg2_b0  (
    .clk(vga_clk_pad),
    .d(\u_key/key_d1 [0]),
    .en(\u_key/key_flag ),
    .reset(clear),
    .set(1'b0),
    .q(key_deb[0]));  // sources/rtl/key/key.v(66)
  reg_sr_as_w1 \u_key/reg2_b1  (
    .clk(vga_clk_pad),
    .d(\u_key/key_d1 [1]),
    .en(\u_key/key_flag ),
    .reset(clear),
    .set(1'b0),
    .q(key_deb[1]));  // sources/rtl/key/key.v(66)
  reg_sr_as_w1 \u_key/reg2_b2  (
    .clk(vga_clk_pad),
    .d(\u_key/key_d1 [2]),
    .en(\u_key/key_flag ),
    .reset(clear),
    .set(1'b0),
    .q(key_deb[2]));  // sources/rtl/key/key.v(66)
  reg_sr_as_w1 \u_key/reg2_b3  (
    .clk(vga_clk_pad),
    .d(\u_key/key_d1 [3]),
    .en(\u_key/key_flag ),
    .reset(clear),
    .set(1'b0),
    .q(key_deb[3]));  // sources/rtl/key/key.v(66)
  reg_sr_as_w1 \u_key/reg2_b4  (
    .clk(vga_clk_pad),
    .d(\u_key/key_d1 [4]),
    .en(\u_key/key_flag ),
    .reset(clear),
    .set(1'b0),
    .q(key_deb[4]));  // sources/rtl/key/key.v(66)
  reg_sr_as_w1 \u_key/reg2_b5  (
    .clk(vga_clk_pad),
    .d(\u_key/key_d1 [5]),
    .en(\u_key/key_flag ),
    .reset(clear),
    .set(1'b0),
    .q(key_deb[5]));  // sources/rtl/key/key.v(66)
  reg_ar_as_w1 \u_key/reg3_b0  (
    .clk(vga_clk_pad),
    .d(\u_key/n3 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [0]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b1  (
    .clk(vga_clk_pad),
    .d(\u_key/n3 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [1]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b10  (
    .clk(vga_clk_pad),
    .d(\u_key/n3 [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [10]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b11  (
    .clk(vga_clk_pad),
    .d(\u_key/n3 [11]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [11]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b12  (
    .clk(vga_clk_pad),
    .d(\u_key/n3 [12]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [12]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b13  (
    .clk(vga_clk_pad),
    .d(\u_key/n3 [13]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [13]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b14  (
    .clk(vga_clk_pad),
    .d(\u_key/n3 [14]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [14]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b15  (
    .clk(vga_clk_pad),
    .d(\u_key/n3 [15]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [15]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b16  (
    .clk(vga_clk_pad),
    .d(\u_key/n3 [16]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [16]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b17  (
    .clk(vga_clk_pad),
    .d(\u_key/n3 [17]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [17]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b18  (
    .clk(vga_clk_pad),
    .d(\u_key/n3 [18]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [18]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b2  (
    .clk(vga_clk_pad),
    .d(\u_key/n3 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [2]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b3  (
    .clk(vga_clk_pad),
    .d(\u_key/n3 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [3]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b4  (
    .clk(vga_clk_pad),
    .d(\u_key/n3 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [4]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b5  (
    .clk(vga_clk_pad),
    .d(\u_key/n3 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [5]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b6  (
    .clk(vga_clk_pad),
    .d(\u_key/n3 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [6]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b7  (
    .clk(vga_clk_pad),
    .d(\u_key/n3 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [7]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b8  (
    .clk(vga_clk_pad),
    .d(\u_key/n3 [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [8]));  // sources/rtl/key/key.v(43)
  reg_ar_as_w1 \u_key/reg3_b9  (
    .clk(vga_clk_pad),
    .d(\u_key/n3 [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_key/cnt [9]));  // sources/rtl/key/key.v(43)
  EG_PHY_GCLK \u_pll/bufg_feedback  (
    .clki(\u_pll/clk0_buf ),
    .clko(vga_clk_pad));  // al_ip/pll.v(30)
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
    .fbclk(vga_clk_pad),
    .psclk(1'b0),
    .psclksel(3'b000),
    .psdown(1'b0),
    .psstep(1'b0),
    .refclk(clk_pad),
    .reset(1'b0),
    .stdby(1'b0),
    .clkc({open_n764,open_n765,open_n766,open_n767,\u_pll/clk0_buf }));  // al_ip/pll.v(53)
  // address_offset=0;data_offset=0;depth=16;width=8;num_section=1;width_per_section=8;section_size=8;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEBMUX("1"),
    .CSA0("1"),
    .CSA1("1"),
    .CSA2("1"),
    .CSB0("1"),
    .CSB1("1"),
    .CSB2("1"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("1"),
    .OCEBMUX("1"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"),
    .RSTAMUX("0"),
    .RSTBMUX("0"),
    .WEAMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("READBEFOREWRITE"))
    \u_ram/ram_ram_reg0_16x8_sub_000000_000  (
    .addra({6'b000000,bus_raddr[3:0],3'b111}),
    .addrb({6'b000000,ram_waddr[3:0],3'b111}),
    .cea(ram_ren),
    .clka(vga_clk_pad),
    .clkb(vga_clk_pad),
    .dia({open_n785,8'b00000000}),
    .dib({open_n786,ram_wdata}),
    .web(\u_ram/n4 ),
    .doa({open_n792,ram_rdata}));
  // address_offset=0;data_offset=0;depth=4096;width=2;num_section=1;width_per_section=2;section_size=8;working_depth=4096;working_width=2;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEBMUX("1"),
    .CSA0("1"),
    .CSA1("1"),
    .CSA2("1"),
    .CSB0("1"),
    .CSB1("1"),
    .CSB2("1"),
    .DATA_WIDTH_A("2"),
    .DATA_WIDTH_B("2"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h000107A1735010007C840000107E1724001F21400041D85C500043C85C141581),
    .INIT_01(256'h64400005D8421410005D8421854040010B2100008CB5050005C8430CF9218D92),
    .INIT_02(256'h1B6108504001B6108614001072100008DB48A0240010F21228495364443640A1),
    .INIT_03(256'h6415040010BE100042D84000236D2224000040D848A1268191014D9110190000),
    .INIT_04(256'h900001BA108504001FA108615414340010BE1A1645A164DA164DA1649A1645A1),
    .INIT_05(256'h00001BE10861400103A12264000042E848A1254D911019028409101078912182),
    .INIT_06(256'h6440438440424001B21082364451D00010BE100040E8501900896208C9028591),
    .INIT_07(256'h00005C84218A20848C8A901850006C8421050005F8430CF9218D920000232DA1),
    .INIT_08(256'h1208A025050005C8430CF9218D920000232DA1644040A40A0644061E244450A4),
    .INIT_09(256'h23A4400041F8489622819101050005C8430CF9218D920000232D0005C84218A2),
    .INIT_0A(256'h131C1900001BA108228416154D4140013A108232440004D84208C91000176108),
    .INIT_0B(256'h8192284091210789131C19214191284091110789131C19110190284091010789),
    .INIT_0C(256'h3244536440004E84208A106819068192681904001FA1082284100040D8488921),
    .INIT_0D(256'h0A10244041E244C736400005F84208991181525010007F84208C910001FA1082),
    .INIT_0E(256'h0010FA12288563648A10244841E244C7364853644A10244441E244C736444364),
    .INIT_0F(256'h21082324C00042F8541910001FE10822644A0645A064DA06450006F842089910),
    .INIT_10(256'hB210823E4C00041C840013210823A4C00042C84001B21082364C00042C840013),
    .INIT_11(256'h00000000000000000000000000000000000000000000000010B2100043C84001),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .MODE("DP8K"),
    .OCEAMUX("1"),
    .OCEBMUX("1"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"),
    .RSTAMUX("0"),
    .RSTBMUX("0"),
    .WEAMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("READBEFOREWRITE"))
    \u_rom/ram_rom_reg0_4096x8_sub_000000_000  (
    .addra({rom_raddr[11:0],1'b1}),
    .addrb({rom_waddr[11:0],1'b1}),
    .cea(rom_ren),
    .clka(vga_clk_pad),
    .clkb(vga_clk_pad),
    .dia({open_n809,open_n810,open_n811,1'b0,open_n812,open_n813,1'b0,open_n814,open_n815}),
    .dib({open_n816,open_n817,open_n818,rom_wdata[1],open_n819,open_n820,rom_wdata[0],open_n821,open_n822}),
    .web(\u_rom/n4 ),
    .doa({open_n828,open_n829,open_n830,open_n831,open_n832,open_n833,open_n834,rom_rdata[1:0]}));
  // address_offset=0;data_offset=2;depth=4096;width=2;num_section=1;width_per_section=2;section_size=8;working_depth=4096;working_width=2;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEBMUX("1"),
    .CSA0("1"),
    .CSA1("1"),
    .CSA2("1"),
    .CSB0("1"),
    .CSB1("1"),
    .CSB2("1"),
    .DATA_WIDTH_A("2"),
    .DATA_WIDTH_B("2"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h40031400D43D0000F002F40031400D400034001000C500350000C500350F4390),
    .INIT_01(256'h2171000C002D710000E002D750C4000310000000C013D0000E002E5931E49C1E),
    .INIT_02(256'h3C00B5C40003400B5D4000310000000C20151C60003140054710070710707184),
    .INIT_03(256'h21CE600031C40000C7000000308054071000C500151C421085C41C1C4101C400),
    .INIT_04(256'h1C4003C00B5C40003400B5D4310C400031C40842108421C8421C8421C8421C84),
    .INIT_05(256'hC4003400B5D40003140054071000C600151C401C1C4101C617585C75A185C410),
    .INIT_06(256'h2179277971C40003440B554075D6840031C40000C7000101C5501D5501C61085),
    .INIT_07(256'h9000F102D555D55751501E710000D102D7D0000F002E5931E49C1E4000300484),
    .INIT_08(256'h5D551E43D0000C102E5931E49C1E4000300484217924079842179C6861710407),
    .INIT_09(256'h54075000C7001501C61085E7D0000C102E5931E49C1E40003004000F102D555C),
    .INIT_0A(256'h5C4101C4003840B554790C6314C50003840B554875000F102D5511D4003040B5),
    .INIT_0B(256'h101C617585C75A185C4101C4101C617585C75A185C4101C4101C617585C75A18),
    .INIT_0C(256'h407527079000E102D551E42108621085210850003040B554790000C4101521C4),
    .INIT_0D(256'h185D6171D68617107071000C102D5501E718C5314000F102D5501D4003040B55),
    .INIT_0E(256'h0031440547180707185D6171D686171070710707185D6171D686171070710707),
    .INIT_0F(256'h80B554075000C7100901E4003C40B554079842188421484214000E102D5501E4),
    .INIT_10(256'h480B554075000C5000003C80B554075000C4000003080B554075000C70000038),
    .INIT_11(256'h00000000000000000000000000000000000000000000000031480000C7000003),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .MODE("DP8K"),
    .OCEAMUX("1"),
    .OCEBMUX("1"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"),
    .RSTAMUX("0"),
    .RSTBMUX("0"),
    .WEAMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("READBEFOREWRITE"))
    \u_rom/ram_rom_reg0_4096x8_sub_000000_002  (
    .addra({rom_raddr[11:0],1'b1}),
    .addrb({rom_waddr[11:0],1'b1}),
    .cea(rom_ren),
    .clka(vga_clk_pad),
    .clkb(vga_clk_pad),
    .dia({open_n851,open_n852,open_n853,1'b0,open_n854,open_n855,1'b0,open_n856,open_n857}),
    .dib({open_n858,open_n859,open_n860,rom_wdata[3],open_n861,open_n862,rom_wdata[2],open_n863,open_n864}),
    .web(\u_rom/n4 ),
    .doa({open_n870,open_n871,open_n872,open_n873,open_n874,open_n875,open_n876,rom_rdata[3:2]}));
  // address_offset=0;data_offset=4;depth=4096;width=2;num_section=1;width_per_section=2;section_size=8;working_depth=4096;working_width=2;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEBMUX("1"),
    .CSA0("1"),
    .CSA1("1"),
    .CSA2("1"),
    .CSB0("1"),
    .CSB1("1"),
    .CSB2("1"),
    .DATA_WIDTH_A("2"),
    .DATA_WIDTH_B("2"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000040100000300040000000040000000000000300100000000010040100),
    .INIT_01(256'h101000030004100000100041004000000C000000030100000200042070420004),
    .INIT_02(256'h0C00104000008001040000004000000231204420000080081104800108001040),
    .INIT_03(256'h10C40000008000000100000008C4810100000300204411004042000420404000),
    .INIT_04(256'h0400000001040000080010401004300000800401084010440100401004010040),
    .INIT_05(256'h40000C0010400000040081410000020020441200042040410104041010404205),
    .INIT_06(256'h1010801010420000C00108101040400000800000020020404204042040410040),
    .INIT_07(256'h000010004204420106050410000030004100000300042070420004000000C040),
    .INIT_08(256'h0420441100000300042070420004000000C04010108141040101040410108141),
    .INIT_09(256'h81010000030020404100404100000100042070420004000000C0000100042044),
    .INIT_0A(256'h04204040000400108110442104400000C0010810100002000420404000040010),
    .INIT_0B(256'h0404101040410104042040420404101040410104042040420404101040410104),
    .INIT_0C(256'h1410800100003000420441100411004010043000040010811040000200205042),
    .INIT_0D(256'h0404101040410108001000000004204041044010C00010004206040000400108),
    .INIT_0E(256'h0000000811088001040410104041010800108001040410104041010800108001),
    .INIT_0F(256'h0010810100000200204040000400108101040108401044010000030004204040),
    .INIT_10(256'h4001081010000010000008001081010000030000000001081010000010000004),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000040000003000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .MODE("DP8K"),
    .OCEAMUX("1"),
    .OCEBMUX("1"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"),
    .RSTAMUX("0"),
    .RSTBMUX("0"),
    .WEAMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("READBEFOREWRITE"))
    \u_rom/ram_rom_reg0_4096x8_sub_000000_004  (
    .addra({rom_raddr[11:0],1'b1}),
    .addrb({rom_waddr[11:0],1'b1}),
    .cea(rom_ren),
    .clka(vga_clk_pad),
    .clkb(vga_clk_pad),
    .dia({open_n893,open_n894,open_n895,1'b0,open_n896,open_n897,1'b0,open_n898,open_n899}),
    .dib({open_n900,open_n901,open_n902,rom_wdata[5],open_n903,open_n904,rom_wdata[4],open_n905,open_n906}),
    .web(\u_rom/n4 ),
    .doa({open_n912,open_n913,open_n914,open_n915,open_n916,open_n917,open_n918,rom_rdata[5:4]}));
  // address_offset=0;data_offset=6;depth=4096;width=2;num_section=1;width_per_section=2;section_size=8;working_depth=4096;working_width=2;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEBMUX("1"),
    .CSA0("1"),
    .CSA1("1"),
    .CSA2("1"),
    .CSB0("1"),
    .CSB1("1"),
    .CSB2("1"),
    .DATA_WIDTH_A("2"),
    .DATA_WIDTH_B("2"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h00000400000000001000000000400000000C0000000300000000030000000000),
    .INIT_01(256'h0000000000000000001000000000000000000000320000000200000030000000),
    .INIT_02(256'h080000000000C00000000000C0000003000000300000C0000000000000000000),
    .INIT_03(256'h0080000000C00000010000000C00000000000100000000000000000000000000),
    .INIT_04(256'h000000C0000000000C0000000000200000C000000C0000C0000C0000C0000C00),
    .INIT_05(256'h0000000000000000040000000000010000000000000000000000000000000000),
    .INIT_06(256'h0000000000020000C00000000000000000C00000030000000000000000000000),
    .INIT_07(256'h00003000000000000000000000003000000000020000003000000000000C8000),
    .INIT_08(256'h000000000000010000003000000000000C800000000000000000000000000000),
    .INIT_09(256'h0000000002000000000000000000030000003000000000000C80000300000000),
    .INIT_0A(256'h0000000000000000000000300C03000040000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000001000000000000030000300002000040000000000000100003000),
    .INIT_0D(256'h00000000000000000000000200000000000C0300800030000000000000800000),
    .INIT_0E(256'h0000C000000C0000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000300000000000C0000000000000C0000C0000C00020000000000),
    .INIT_10(256'h8000000000000010000004000000000000000000004000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000080000001000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .MODE("DP8K"),
    .OCEAMUX("1"),
    .OCEBMUX("1"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"),
    .RSTAMUX("0"),
    .RSTBMUX("0"),
    .WEAMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("READBEFOREWRITE"))
    \u_rom/ram_rom_reg0_4096x8_sub_000000_006  (
    .addra({rom_raddr[11:0],1'b1}),
    .addrb({rom_waddr[11:0],1'b1}),
    .cea(rom_ren),
    .clka(vga_clk_pad),
    .clkb(vga_clk_pad),
    .dia({open_n935,open_n936,open_n937,1'b0,open_n938,open_n939,1'b0,open_n940,open_n941}),
    .dib({open_n942,open_n943,open_n944,rom_wdata[7],open_n945,open_n946,rom_wdata[6],open_n947,open_n948}),
    .web(\u_rom/n4 ),
    .doa({open_n954,open_n955,open_n956,open_n957,open_n958,open_n959,open_n960,rom_rdata[7:6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u0  (
    .a(\u_uart/u_uart_rx/clk_cnt [0]),
    .b(1'b1),
    .c(\u_uart/u_uart_rx/add0/c0 ),
    .o({\u_uart/u_uart_rx/add0/c1 ,\u_uart/u_uart_rx/n7 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u1  (
    .a(\u_uart/u_uart_rx/clk_cnt [1]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c1 ),
    .o({\u_uart/u_uart_rx/add0/c2 ,\u_uart/u_uart_rx/n7 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u10  (
    .a(\u_uart/u_uart_rx/clk_cnt [10]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c10 ),
    .o({\u_uart/u_uart_rx/add0/c11 ,\u_uart/u_uart_rx/n7 [10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u11  (
    .a(\u_uart/u_uart_rx/clk_cnt [11]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c11 ),
    .o({\u_uart/u_uart_rx/add0/c12 ,\u_uart/u_uart_rx/n7 [11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u12  (
    .a(\u_uart/u_uart_rx/clk_cnt [12]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c12 ),
    .o({\u_uart/u_uart_rx/add0/c13 ,\u_uart/u_uart_rx/n7 [12]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u13  (
    .a(\u_uart/u_uart_rx/clk_cnt [13]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c13 ),
    .o({\u_uart/u_uart_rx/add0/c14 ,\u_uart/u_uart_rx/n7 [13]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u14  (
    .a(\u_uart/u_uart_rx/clk_cnt [14]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c14 ),
    .o({\u_uart/u_uart_rx/add0/c15 ,\u_uart/u_uart_rx/n7 [14]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u15  (
    .a(\u_uart/u_uart_rx/clk_cnt [15]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c15 ),
    .o({\u_uart/u_uart_rx/add0/c16 ,\u_uart/u_uart_rx/n7 [15]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u16  (
    .a(\u_uart/u_uart_rx/clk_cnt [16]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c16 ),
    .o({\u_uart/u_uart_rx/add0/c17 ,\u_uart/u_uart_rx/n7 [16]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u17  (
    .a(\u_uart/u_uart_rx/clk_cnt [17]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c17 ),
    .o({\u_uart/u_uart_rx/add0/c18 ,\u_uart/u_uart_rx/n7 [17]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u18  (
    .a(\u_uart/u_uart_rx/clk_cnt [18]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c18 ),
    .o({\u_uart/u_uart_rx/add0/c19 ,\u_uart/u_uart_rx/n7 [18]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u19  (
    .a(\u_uart/u_uart_rx/clk_cnt [19]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c19 ),
    .o({\u_uart/u_uart_rx/add0/c20 ,\u_uart/u_uart_rx/n7 [19]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u2  (
    .a(\u_uart/u_uart_rx/clk_cnt [2]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c2 ),
    .o({\u_uart/u_uart_rx/add0/c3 ,\u_uart/u_uart_rx/n7 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u20  (
    .a(\u_uart/u_uart_rx/clk_cnt [20]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c20 ),
    .o({\u_uart/u_uart_rx/add0/c21 ,\u_uart/u_uart_rx/n7 [20]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u21  (
    .a(\u_uart/u_uart_rx/clk_cnt [21]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c21 ),
    .o({\u_uart/u_uart_rx/add0/c22 ,\u_uart/u_uart_rx/n7 [21]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u22  (
    .a(\u_uart/u_uart_rx/clk_cnt [22]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c22 ),
    .o({\u_uart/u_uart_rx/add0/c23 ,\u_uart/u_uart_rx/n7 [22]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u23  (
    .a(\u_uart/u_uart_rx/clk_cnt [23]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c23 ),
    .o({\u_uart/u_uart_rx/add0/c24 ,\u_uart/u_uart_rx/n7 [23]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u24  (
    .a(\u_uart/u_uart_rx/clk_cnt [24]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c24 ),
    .o({\u_uart/u_uart_rx/add0/c25 ,\u_uart/u_uart_rx/n7 [24]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u25  (
    .a(\u_uart/u_uart_rx/clk_cnt [25]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c25 ),
    .o({\u_uart/u_uart_rx/add0/c26 ,\u_uart/u_uart_rx/n7 [25]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u26  (
    .a(\u_uart/u_uart_rx/clk_cnt [26]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c26 ),
    .o({\u_uart/u_uart_rx/add0/c27 ,\u_uart/u_uart_rx/n7 [26]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u27  (
    .a(\u_uart/u_uart_rx/clk_cnt [27]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c27 ),
    .o({\u_uart/u_uart_rx/add0/c28 ,\u_uart/u_uart_rx/n7 [27]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u28  (
    .a(\u_uart/u_uart_rx/clk_cnt [28]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c28 ),
    .o({\u_uart/u_uart_rx/add0/c29 ,\u_uart/u_uart_rx/n7 [28]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u29  (
    .a(\u_uart/u_uart_rx/clk_cnt [29]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c29 ),
    .o({\u_uart/u_uart_rx/add0/c30 ,\u_uart/u_uart_rx/n7 [29]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u3  (
    .a(\u_uart/u_uart_rx/clk_cnt [3]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c3 ),
    .o({\u_uart/u_uart_rx/add0/c4 ,\u_uart/u_uart_rx/n7 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u30  (
    .a(\u_uart/u_uart_rx/clk_cnt [30]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c30 ),
    .o({\u_uart/u_uart_rx/add0/c31 ,\u_uart/u_uart_rx/n7 [30]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u31  (
    .a(\u_uart/u_uart_rx/clk_cnt [31]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c31 ),
    .o({open_n970,\u_uart/u_uart_rx/n7 [31]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u4  (
    .a(\u_uart/u_uart_rx/clk_cnt [4]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c4 ),
    .o({\u_uart/u_uart_rx/add0/c5 ,\u_uart/u_uart_rx/n7 [4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u5  (
    .a(\u_uart/u_uart_rx/clk_cnt [5]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c5 ),
    .o({\u_uart/u_uart_rx/add0/c6 ,\u_uart/u_uart_rx/n7 [5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u6  (
    .a(\u_uart/u_uart_rx/clk_cnt [6]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c6 ),
    .o({\u_uart/u_uart_rx/add0/c7 ,\u_uart/u_uart_rx/n7 [6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u7  (
    .a(\u_uart/u_uart_rx/clk_cnt [7]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c7 ),
    .o({\u_uart/u_uart_rx/add0/c8 ,\u_uart/u_uart_rx/n7 [7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u8  (
    .a(\u_uart/u_uart_rx/clk_cnt [8]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c8 ),
    .o({\u_uart/u_uart_rx/add0/c9 ,\u_uart/u_uart_rx/n7 [8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add0/u9  (
    .a(\u_uart/u_uart_rx/clk_cnt [9]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add0/c9 ),
    .o({\u_uart/u_uart_rx/add0/c10 ,\u_uart/u_uart_rx/n7 [9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \u_uart/u_uart_rx/add0/ucin  (
    .a(1'b0),
    .o({\u_uart/u_uart_rx/add0/c0 ,open_n973}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add1/u0  (
    .a(\u_uart/u_uart_rx/cnt [0]),
    .b(1'b1),
    .c(\u_uart/u_uart_rx/add1/c0 ),
    .o({\u_uart/u_uart_rx/add1/c1 ,\u_uart/u_uart_rx/n13 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add1/u1  (
    .a(\u_uart/u_uart_rx/cnt [1]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add1/c1 ),
    .o({\u_uart/u_uart_rx/add1/c2 ,\u_uart/u_uart_rx/n13 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add1/u2  (
    .a(\u_uart/u_uart_rx/cnt [2]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add1/c2 ),
    .o({\u_uart/u_uart_rx/add1/c3 ,\u_uart/u_uart_rx/n13 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_rx/add1/u3  (
    .a(\u_uart/u_uart_rx/cnt [3]),
    .b(1'b0),
    .c(\u_uart/u_uart_rx/add1/c3 ),
    .o({open_n974,\u_uart/u_uart_rx/n13 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \u_uart/u_uart_rx/add1/ucin  (
    .a(1'b0),
    .o({\u_uart/u_uart_rx/add1/c0 ,open_n977}));
  reg_ar_as_w1 \u_uart/u_uart_rx/clk_en_reg  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n5 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_en ));  // sources/rtl/uart/uart_rx.v(80)
  reg_ar_ss_w1 \u_uart/u_uart_rx/reg0_b0  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n8 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(~\u_uart/u_uart_rx/start ),
    .q(\u_uart/u_uart_rx/clk_cnt [0]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b1  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [1]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [1]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b10  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [10]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [10]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b11  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [11]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [11]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b12  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [12]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [12]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b13  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [13]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [13]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b14  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [14]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [14]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b15  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [15]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [15]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b16  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [16]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [16]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b17  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [17]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [17]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b18  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [18]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [18]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b19  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [19]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [19]));  // sources/rtl/uart/uart_rx.v(74)
  reg_ar_ss_w1 \u_uart/u_uart_rx/reg0_b2  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n8 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(~\u_uart/u_uart_rx/start ),
    .q(\u_uart/u_uart_rx/clk_cnt [2]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b20  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [20]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [20]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b21  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [21]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [21]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b22  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [22]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [22]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b23  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [23]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [23]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b24  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [24]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [24]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b25  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [25]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [25]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b26  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [26]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [26]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b27  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [27]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [27]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b28  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [28]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [28]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b29  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [29]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [29]));  // sources/rtl/uart/uart_rx.v(74)
  reg_ar_ss_w1 \u_uart/u_uart_rx/reg0_b3  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n8 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(~\u_uart/u_uart_rx/start ),
    .q(\u_uart/u_uart_rx/clk_cnt [3]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b30  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [30]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [30]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b31  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [31]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [31]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b4  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [4]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [4]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b5  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [5]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [5]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b6  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [6]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [6]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b7  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [7]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [7]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b8  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [8]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [8]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg0_b9  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n7 [9]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/clk_cnt [9]));  // sources/rtl/uart/uart_rx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg1_b0  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n13 [0]),
    .en(\u_uart/u_uart_rx/clk_en ),
    .reset(~\u_uart/u_uart_rx/start ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/cnt [0]));  // sources/rtl/uart/uart_rx.v(89)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg1_b1  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n13 [1]),
    .en(\u_uart/u_uart_rx/clk_en ),
    .reset(~\u_uart/u_uart_rx/start ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/cnt [1]));  // sources/rtl/uart/uart_rx.v(89)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg1_b2  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n13 [2]),
    .en(\u_uart/u_uart_rx/clk_en ),
    .reset(~\u_uart/u_uart_rx/start ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/cnt [2]));  // sources/rtl/uart/uart_rx.v(89)
  reg_sr_as_w1 \u_uart/u_uart_rx/reg1_b3  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n13 [3]),
    .en(\u_uart/u_uart_rx/clk_en ),
    .reset(~\u_uart/u_uart_rx/start ),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/cnt [3]));  // sources/rtl/uart/uart_rx.v(89)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg2_b0  (
    .clk(vga_clk_pad),
    .d(rx_pad),
    .en(\u_uart/u_uart_rx/mux4_b0_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/data [0]));  // sources/rtl/uart/uart_rx.v(105)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg2_b1  (
    .clk(vga_clk_pad),
    .d(rx_pad),
    .en(\u_uart/u_uart_rx/mux4_b1_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/data [1]));  // sources/rtl/uart/uart_rx.v(105)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg2_b2  (
    .clk(vga_clk_pad),
    .d(rx_pad),
    .en(\u_uart/u_uart_rx/mux4_b2_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/data [2]));  // sources/rtl/uart/uart_rx.v(105)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg2_b3  (
    .clk(vga_clk_pad),
    .d(rx_pad),
    .en(\u_uart/u_uart_rx/mux4_b3_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/data [3]));  // sources/rtl/uart/uart_rx.v(105)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg2_b4  (
    .clk(vga_clk_pad),
    .d(rx_pad),
    .en(\u_uart/u_uart_rx/mux4_b4_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/data [4]));  // sources/rtl/uart/uart_rx.v(105)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg2_b5  (
    .clk(vga_clk_pad),
    .d(rx_pad),
    .en(\u_uart/u_uart_rx/mux4_b5_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/data [5]));  // sources/rtl/uart/uart_rx.v(105)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg2_b6  (
    .clk(vga_clk_pad),
    .d(rx_pad),
    .en(\u_uart/u_uart_rx/mux4_b6_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/data [6]));  // sources/rtl/uart/uart_rx.v(105)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg2_b7  (
    .clk(vga_clk_pad),
    .d(rx_pad),
    .en(\u_uart/u_uart_rx/mux4_b7_sel_is_3_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/data [7]));  // sources/rtl/uart/uart_rx.v(105)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg3_b0  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/data [0]),
    .en(\u_uart/u_uart_rx/n1 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/rx_data [0]));  // sources/rtl/uart/uart_rx.v(118)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg3_b1  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/data [1]),
    .en(\u_uart/u_uart_rx/n1 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/rx_data [1]));  // sources/rtl/uart/uart_rx.v(118)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg3_b2  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/data [2]),
    .en(\u_uart/u_uart_rx/n1 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/rx_data [2]));  // sources/rtl/uart/uart_rx.v(118)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg3_b3  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/data [3]),
    .en(\u_uart/u_uart_rx/n1 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/rx_data [3]));  // sources/rtl/uart/uart_rx.v(118)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg3_b4  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/data [4]),
    .en(\u_uart/u_uart_rx/n1 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/rx_data [4]));  // sources/rtl/uart/uart_rx.v(118)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg3_b5  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/data [5]),
    .en(\u_uart/u_uart_rx/n1 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/rx_data [5]));  // sources/rtl/uart/uart_rx.v(118)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg3_b6  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/data [6]),
    .en(\u_uart/u_uart_rx/n1 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/rx_data [6]));  // sources/rtl/uart/uart_rx.v(118)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg3_b7  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/data [7]),
    .en(\u_uart/u_uart_rx/n1 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/rx_data [7]));  // sources/rtl/uart/uart_rx.v(118)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg4_b0  (
    .clk(vga_clk_pad),
    .d(rx_pad),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/rx_d [0]));  // sources/rtl/uart/uart_rx.v(54)
  reg_ar_as_w1 \u_uart/u_uart_rx/reg4_b1  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/rx_d [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_rx/rx_d [1]));  // sources/rtl/uart/uart_rx.v(54)
  reg_ar_as_w1 \u_uart/u_uart_rx/rx_en_reg  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_rx/n28 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/rx_en ));  // sources/rtl/uart/uart_rx.v(111)
  reg_ar_ss_w1 \u_uart/u_uart_rx/start_reg  (
    .clk(vga_clk_pad),
    .d(1'b0),
    .en(\u_uart/u_uart_rx/n1 ),
    .reset(1'b0),
    .set(\u_uart/u_uart_rx/n0 ),
    .q(\u_uart/u_uart_rx/start ));  // sources/rtl/uart/uart_rx.v(63)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u0  (
    .a(\u_uart/u_uart_tx/clk_cnt [0]),
    .b(1'b1),
    .c(\u_uart/u_uart_tx/add0/c0 ),
    .o({\u_uart/u_uart_tx/add0/c1 ,\u_uart/u_uart_tx/n1 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u1  (
    .a(\u_uart/u_uart_tx/clk_cnt [1]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c1 ),
    .o({\u_uart/u_uart_tx/add0/c2 ,\u_uart/u_uart_tx/n1 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u10  (
    .a(\u_uart/u_uart_tx/clk_cnt [10]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c10 ),
    .o({\u_uart/u_uart_tx/add0/c11 ,\u_uart/u_uart_tx/n1 [10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u11  (
    .a(\u_uart/u_uart_tx/clk_cnt [11]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c11 ),
    .o({\u_uart/u_uart_tx/add0/c12 ,\u_uart/u_uart_tx/n1 [11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u12  (
    .a(\u_uart/u_uart_tx/clk_cnt [12]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c12 ),
    .o({\u_uart/u_uart_tx/add0/c13 ,\u_uart/u_uart_tx/n1 [12]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u13  (
    .a(\u_uart/u_uart_tx/clk_cnt [13]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c13 ),
    .o({\u_uart/u_uart_tx/add0/c14 ,\u_uart/u_uart_tx/n1 [13]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u14  (
    .a(\u_uart/u_uart_tx/clk_cnt [14]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c14 ),
    .o({\u_uart/u_uart_tx/add0/c15 ,\u_uart/u_uart_tx/n1 [14]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u15  (
    .a(\u_uart/u_uart_tx/clk_cnt [15]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c15 ),
    .o({\u_uart/u_uart_tx/add0/c16 ,\u_uart/u_uart_tx/n1 [15]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u16  (
    .a(\u_uart/u_uart_tx/clk_cnt [16]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c16 ),
    .o({\u_uart/u_uart_tx/add0/c17 ,\u_uart/u_uart_tx/n1 [16]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u17  (
    .a(\u_uart/u_uart_tx/clk_cnt [17]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c17 ),
    .o({\u_uart/u_uart_tx/add0/c18 ,\u_uart/u_uart_tx/n1 [17]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u18  (
    .a(\u_uart/u_uart_tx/clk_cnt [18]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c18 ),
    .o({\u_uart/u_uart_tx/add0/c19 ,\u_uart/u_uart_tx/n1 [18]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u19  (
    .a(\u_uart/u_uart_tx/clk_cnt [19]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c19 ),
    .o({\u_uart/u_uart_tx/add0/c20 ,\u_uart/u_uart_tx/n1 [19]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u2  (
    .a(\u_uart/u_uart_tx/clk_cnt [2]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c2 ),
    .o({\u_uart/u_uart_tx/add0/c3 ,\u_uart/u_uart_tx/n1 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u20  (
    .a(\u_uart/u_uart_tx/clk_cnt [20]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c20 ),
    .o({\u_uart/u_uart_tx/add0/c21 ,\u_uart/u_uart_tx/n1 [20]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u21  (
    .a(\u_uart/u_uart_tx/clk_cnt [21]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c21 ),
    .o({\u_uart/u_uart_tx/add0/c22 ,\u_uart/u_uart_tx/n1 [21]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u22  (
    .a(\u_uart/u_uart_tx/clk_cnt [22]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c22 ),
    .o({\u_uart/u_uart_tx/add0/c23 ,\u_uart/u_uart_tx/n1 [22]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u23  (
    .a(\u_uart/u_uart_tx/clk_cnt [23]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c23 ),
    .o({\u_uart/u_uart_tx/add0/c24 ,\u_uart/u_uart_tx/n1 [23]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u24  (
    .a(\u_uart/u_uart_tx/clk_cnt [24]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c24 ),
    .o({\u_uart/u_uart_tx/add0/c25 ,\u_uart/u_uart_tx/n1 [24]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u25  (
    .a(\u_uart/u_uart_tx/clk_cnt [25]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c25 ),
    .o({\u_uart/u_uart_tx/add0/c26 ,\u_uart/u_uart_tx/n1 [25]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u26  (
    .a(\u_uart/u_uart_tx/clk_cnt [26]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c26 ),
    .o({\u_uart/u_uart_tx/add0/c27 ,\u_uart/u_uart_tx/n1 [26]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u27  (
    .a(\u_uart/u_uart_tx/clk_cnt [27]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c27 ),
    .o({\u_uart/u_uart_tx/add0/c28 ,\u_uart/u_uart_tx/n1 [27]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u28  (
    .a(\u_uart/u_uart_tx/clk_cnt [28]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c28 ),
    .o({\u_uart/u_uart_tx/add0/c29 ,\u_uart/u_uart_tx/n1 [28]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u29  (
    .a(\u_uart/u_uart_tx/clk_cnt [29]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c29 ),
    .o({\u_uart/u_uart_tx/add0/c30 ,\u_uart/u_uart_tx/n1 [29]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u3  (
    .a(\u_uart/u_uart_tx/clk_cnt [3]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c3 ),
    .o({\u_uart/u_uart_tx/add0/c4 ,\u_uart/u_uart_tx/n1 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u30  (
    .a(\u_uart/u_uart_tx/clk_cnt [30]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c30 ),
    .o({\u_uart/u_uart_tx/add0/c31 ,\u_uart/u_uart_tx/n1 [30]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u31  (
    .a(\u_uart/u_uart_tx/clk_cnt [31]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c31 ),
    .o({open_n978,\u_uart/u_uart_tx/n1 [31]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u4  (
    .a(\u_uart/u_uart_tx/clk_cnt [4]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c4 ),
    .o({\u_uart/u_uart_tx/add0/c5 ,\u_uart/u_uart_tx/n1 [4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u5  (
    .a(\u_uart/u_uart_tx/clk_cnt [5]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c5 ),
    .o({\u_uart/u_uart_tx/add0/c6 ,\u_uart/u_uart_tx/n1 [5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u6  (
    .a(\u_uart/u_uart_tx/clk_cnt [6]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c6 ),
    .o({\u_uart/u_uart_tx/add0/c7 ,\u_uart/u_uart_tx/n1 [6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u7  (
    .a(\u_uart/u_uart_tx/clk_cnt [7]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c7 ),
    .o({\u_uart/u_uart_tx/add0/c8 ,\u_uart/u_uart_tx/n1 [7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u8  (
    .a(\u_uart/u_uart_tx/clk_cnt [8]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c8 ),
    .o({\u_uart/u_uart_tx/add0/c9 ,\u_uart/u_uart_tx/n1 [8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add0/u9  (
    .a(\u_uart/u_uart_tx/clk_cnt [9]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add0/c9 ),
    .o({\u_uart/u_uart_tx/add0/c10 ,\u_uart/u_uart_tx/n1 [9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \u_uart/u_uart_tx/add0/ucin  (
    .a(1'b0),
    .o({\u_uart/u_uart_tx/add0/c0 ,open_n981}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add1/u0  (
    .a(\u_uart/u_uart_tx/cnt [0]),
    .b(1'b1),
    .c(\u_uart/u_uart_tx/add1/c0 ),
    .o({\u_uart/u_uart_tx/add1/c1 ,\u_uart/u_uart_tx/n10 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add1/u1  (
    .a(\u_uart/u_uart_tx/cnt [1]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add1/c1 ),
    .o({\u_uart/u_uart_tx/add1/c2 ,\u_uart/u_uart_tx/n10 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add1/u2  (
    .a(\u_uart/u_uart_tx/cnt [2]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add1/c2 ),
    .o({\u_uart/u_uart_tx/add1/c3 ,\u_uart/u_uart_tx/n10 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_uart_tx/add1/u3  (
    .a(\u_uart/u_uart_tx/cnt [3]),
    .b(1'b0),
    .c(\u_uart/u_uart_tx/add1/c3 ),
    .o({open_n982,\u_uart/u_uart_tx/n10 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \u_uart/u_uart_tx/add1/ucin  (
    .a(1'b0),
    .o({\u_uart/u_uart_tx/add1/c0 ,open_n985}));
  reg_ar_as_w1 \u_uart/u_uart_tx/clk_en_reg  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n0 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_en ));  // sources/rtl/uart/uart_tx.v(65)
  reg_ar_as_w1 \u_uart/u_uart_tx/reg0_b0  (
    .clk(vga_clk_pad),
    .d(\u_uart/tx_data [0]),
    .en(\u_uart/u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/data [0]));  // sources/rtl/uart/uart_tx.v(81)
  reg_ar_as_w1 \u_uart/u_uart_tx/reg0_b1  (
    .clk(vga_clk_pad),
    .d(\u_uart/tx_data [1]),
    .en(\u_uart/u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/data [1]));  // sources/rtl/uart/uart_tx.v(81)
  reg_ar_as_w1 \u_uart/u_uart_tx/reg0_b2  (
    .clk(vga_clk_pad),
    .d(\u_uart/tx_data [2]),
    .en(\u_uart/u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/data [2]));  // sources/rtl/uart/uart_tx.v(81)
  reg_ar_as_w1 \u_uart/u_uart_tx/reg0_b3  (
    .clk(vga_clk_pad),
    .d(\u_uart/tx_data [3]),
    .en(\u_uart/u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/data [3]));  // sources/rtl/uart/uart_tx.v(81)
  reg_ar_as_w1 \u_uart/u_uart_tx/reg0_b4  (
    .clk(vga_clk_pad),
    .d(\u_uart/tx_data [4]),
    .en(\u_uart/u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/data [4]));  // sources/rtl/uart/uart_tx.v(81)
  reg_ar_as_w1 \u_uart/u_uart_tx/reg0_b5  (
    .clk(vga_clk_pad),
    .d(\u_uart/tx_data [5]),
    .en(\u_uart/u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/data [5]));  // sources/rtl/uart/uart_tx.v(81)
  reg_ar_as_w1 \u_uart/u_uart_tx/reg0_b6  (
    .clk(vga_clk_pad),
    .d(\u_uart/tx_data [6]),
    .en(\u_uart/u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/data [6]));  // sources/rtl/uart/uart_tx.v(81)
  reg_ar_as_w1 \u_uart/u_uart_tx/reg0_b7  (
    .clk(vga_clk_pad),
    .d(\u_uart/tx_data [7]),
    .en(\u_uart/u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/data [7]));  // sources/rtl/uart/uart_tx.v(81)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg1_b0  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n10 [0]),
    .en(\u_uart/u_uart_tx/clk_en ),
    .reset(~\u_uart/u_uart_tx/start ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/cnt [0]));  // sources/rtl/uart/uart_tx.v(90)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg1_b1  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n10 [1]),
    .en(\u_uart/u_uart_tx/clk_en ),
    .reset(~\u_uart/u_uart_tx/start ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/cnt [1]));  // sources/rtl/uart/uart_tx.v(90)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg1_b2  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n10 [2]),
    .en(\u_uart/u_uart_tx/clk_en ),
    .reset(~\u_uart/u_uart_tx/start ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/cnt [2]));  // sources/rtl/uart/uart_tx.v(90)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg1_b3  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n10 [3]),
    .en(\u_uart/u_uart_tx/clk_en ),
    .reset(~\u_uart/u_uart_tx/start ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/cnt [3]));  // sources/rtl/uart/uart_tx.v(90)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b0  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [0]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [0]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b1  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [1]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [1]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b10  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [10]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [10]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b11  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [11]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [11]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b12  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [12]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [12]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b13  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [13]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [13]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b14  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [14]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [14]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b15  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [15]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [15]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b16  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [16]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [16]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b17  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [17]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [17]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b18  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [18]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [18]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b19  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [19]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [19]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b2  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [2]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [2]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b20  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [20]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [20]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b21  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [21]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [21]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b22  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [22]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [22]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b23  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [23]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [23]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b24  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [24]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [24]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b25  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [25]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [25]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b26  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [26]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [26]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b27  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [27]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [27]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b28  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [28]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [28]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b29  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [29]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [29]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b3  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [3]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [3]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b30  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [30]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [30]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b31  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [31]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [31]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b4  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [4]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [4]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b5  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [5]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [5]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b6  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [6]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [6]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b7  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [7]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [7]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b8  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [8]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [8]));  // sources/rtl/uart/uart_tx.v(59)
  reg_sr_as_w1 \u_uart/u_uart_tx/reg2_b9  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n1 [9]),
    .en(1'b1),
    .reset(~\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart/u_uart_tx/clk_cnt [9]));  // sources/rtl/uart/uart_tx.v(59)
  reg_ar_ss_w1 \u_uart/u_uart_tx/start_reg  (
    .clk(vga_clk_pad),
    .d(1'b0),
    .en(\u_uart/u_uart_tx/n4 ),
    .reset(1'b0),
    .set(\u_uart/tx_en ),
    .q(\u_uart/u_uart_tx/start ));  // sources/rtl/uart/uart_tx.v(74)
  reg_sr_as_w1 \u_uart/u_uart_tx/tx_ready_reg  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n7 ),
    .en(1'b1),
    .reset(\u_uart/tx_en ),
    .set(1'b0),
    .q(\u_uart/tx_ready ));  // sources/rtl/uart/uart_tx.v(117)
  reg_ar_as_w1 \u_uart/u_uart_tx/tx_reg  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_uart_tx/n13 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_pad));  // sources/rtl/uart/uart_tx.v(108)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_ubus/add1/u0  (
    .a(\u_uart/u_ubus/send_cnt [0]),
    .b(1'b1),
    .c(\u_uart/u_ubus/add1/c0 ),
    .o({\u_uart/u_ubus/add1/c1 ,\u_uart/u_ubus/n45 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_ubus/add1/u1  (
    .a(\u_uart/u_ubus/send_cnt [1]),
    .b(1'b0),
    .c(\u_uart/u_ubus/add1/c1 ),
    .o({\u_uart/u_ubus/add1/c2 ,\u_uart/u_ubus/n45 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_ubus/add1/u2  (
    .a(\u_uart/u_ubus/send_cnt [2]),
    .b(1'b0),
    .c(\u_uart/u_ubus/add1/c2 ),
    .o({\u_uart/u_ubus/add1/c3 ,\u_uart/u_ubus/n45 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart/u_ubus/add1/u3  (
    .a(\u_uart/u_ubus/send_cnt [3]),
    .b(1'b0),
    .c(\u_uart/u_ubus/add1/c3 ),
    .o({open_n986,\u_uart/u_ubus/n45 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \u_uart/u_ubus/add1/ucin  (
    .a(1'b0),
    .o({\u_uart/u_ubus/add1/c0 ,open_n989}));
  reg_ar_as_w1 \u_uart/u_ubus/frame_head_flag0_reg  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/n11 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/frame_head_flag0 ));  // sources/rtl/uart/ubus.v(118)
  reg_ar_as_w1 \u_uart/u_ubus/frame_head_flag1_reg  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/n13 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/frame_head_flag1 ));  // sources/rtl/uart/ubus.v(118)
  reg_ar_as_w1 \u_uart/u_ubus/frame_head_flag2_reg  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/n15 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/frame_head_flag2 ));  // sources/rtl/uart/ubus.v(118)
  reg_ar_as_w1 \u_uart/u_ubus/frame_head_flag3_reg  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/n17 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/frame_head_flag3 ));  // sources/rtl/uart/ubus.v(118)
  reg_ar_as_w1 \u_uart/u_ubus/frame_head_flag4_reg  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/n19 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/frame_head_flag4 ));  // sources/rtl/uart/ubus.v(118)
  reg_ar_as_w1 \u_uart/u_ubus/frame_head_flag5_reg  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/n21 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/frame_head_flag5 ));  // sources/rtl/uart/ubus.v(118)
  reg_ar_as_w1 \u_uart/u_ubus/frame_head_flag_reg  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/n26 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/frame_head_flag ));  // sources/rtl/uart/ubus.v(124)
  reg_ar_as_w1 \u_uart/u_ubus/recv_en_reg  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/frame_head_flag ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_en));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg0_b0  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg0 [0]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg1 [0]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg0_b1  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg0 [1]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg1 [1]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg0_b2  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg0 [2]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg1 [2]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg0_b3  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg0 [3]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg1 [3]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg0_b4  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg0 [4]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg1 [4]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg0_b5  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg0 [5]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg1 [5]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg0_b6  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg0 [6]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg1 [6]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg0_b7  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg0 [7]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg1 [7]));  // sources/rtl/uart/ubus.v(101)
  reg_sr_as_w1 \u_uart/u_ubus/reg10_b0  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/n39 [0]),
    .en(1'b1),
    .reset(~\u_uart/tx_ready ),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_ready_cnt [0]));  // sources/rtl/uart/ubus.v(170)
  reg_sr_as_w1 \u_uart/u_ubus/reg10_b1  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/n39 [1]),
    .en(1'b1),
    .reset(~\u_uart/tx_ready ),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_ready_cnt [1]));  // sources/rtl/uart/ubus.v(170)
  reg_sr_as_w1 \u_uart/u_ubus/reg10_b2  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/n39 [2]),
    .en(1'b1),
    .reset(~\u_uart/tx_ready ),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_ready_cnt [2]));  // sources/rtl/uart/ubus.v(170)
  reg_sr_as_w1 \u_uart/u_ubus/reg11_b0  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/n45 [0]),
    .en(\u_uart/u_ubus/n42 ),
    .reset(\u_uart/u_ubus/send_finish ),
    .set(1'b0),
    .q(\u_uart/u_ubus/send_cnt [0]));  // sources/rtl/uart/ubus.v(192)
  reg_sr_as_w1 \u_uart/u_ubus/reg11_b1  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/n45 [1]),
    .en(\u_uart/u_ubus/n42 ),
    .reset(\u_uart/u_ubus/send_finish ),
    .set(1'b0),
    .q(\u_uart/u_ubus/send_cnt [1]));  // sources/rtl/uart/ubus.v(192)
  reg_sr_as_w1 \u_uart/u_ubus/reg11_b2  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/n45 [2]),
    .en(\u_uart/u_ubus/n42 ),
    .reset(\u_uart/u_ubus/send_finish ),
    .set(1'b0),
    .q(\u_uart/u_ubus/send_cnt [2]));  // sources/rtl/uart/ubus.v(192)
  reg_sr_as_w1 \u_uart/u_ubus/reg11_b3  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/n45 [3]),
    .en(\u_uart/u_ubus/n42 ),
    .reset(\u_uart/u_ubus/send_finish ),
    .set(1'b0),
    .q(\u_uart/u_ubus/send_cnt [3]));  // sources/rtl/uart/ubus.v(192)
  reg_ar_as_w1 \u_uart/u_ubus/reg12_b0  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/n57 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/tx_data [0]));  // sources/rtl/uart/ubus.v(207)
  reg_ar_as_w1 \u_uart/u_ubus/reg12_b1  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/n57 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/tx_data [1]));  // sources/rtl/uart/ubus.v(207)
  reg_ar_as_w1 \u_uart/u_ubus/reg12_b2  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/n57 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/tx_data [2]));  // sources/rtl/uart/ubus.v(207)
  reg_ar_as_w1 \u_uart/u_ubus/reg12_b3  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/n57 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/tx_data [3]));  // sources/rtl/uart/ubus.v(207)
  reg_ar_as_w1 \u_uart/u_ubus/reg12_b4  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/n57 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/tx_data [4]));  // sources/rtl/uart/ubus.v(207)
  reg_ar_as_w1 \u_uart/u_ubus/reg12_b5  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/n57 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/tx_data [5]));  // sources/rtl/uart/ubus.v(207)
  reg_ar_as_w1 \u_uart/u_ubus/reg12_b6  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/n57 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/tx_data [6]));  // sources/rtl/uart/ubus.v(207)
  reg_ar_as_w1 \u_uart/u_ubus/reg12_b7  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/n57 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/tx_data [7]));  // sources/rtl/uart/ubus.v(207)
  reg_ar_as_w1 \u_uart/u_ubus/reg13_b0  (
    .clk(vga_clk_pad),
    .d(\u_uart/rx_data [0]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg0 [0]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg13_b1  (
    .clk(vga_clk_pad),
    .d(\u_uart/rx_data [1]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg0 [1]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg13_b2  (
    .clk(vga_clk_pad),
    .d(\u_uart/rx_data [2]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg0 [2]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg13_b3  (
    .clk(vga_clk_pad),
    .d(\u_uart/rx_data [3]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg0 [3]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg13_b4  (
    .clk(vga_clk_pad),
    .d(\u_uart/rx_data [4]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg0 [4]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg13_b5  (
    .clk(vga_clk_pad),
    .d(\u_uart/rx_data [5]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg0 [5]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg13_b6  (
    .clk(vga_clk_pad),
    .d(\u_uart/rx_data [6]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg0 [6]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg13_b7  (
    .clk(vga_clk_pad),
    .d(\u_uart/rx_data [7]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg0 [7]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg1_b0  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg1 [0]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg2 [0]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg1_b1  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg1 [1]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg2 [1]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg1_b2  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg1 [2]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg2 [2]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg1_b3  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg1 [3]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg2 [3]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg1_b4  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg1 [4]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg2 [4]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg1_b5  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg1 [5]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg2 [5]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg1_b6  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg1 [6]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg2 [6]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg1_b7  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg1 [7]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg2 [7]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg2_b0  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg2 [0]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg3 [0]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg2_b1  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg2 [1]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg3 [1]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg2_b2  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg2 [2]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg3 [2]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg2_b3  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg2 [3]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg3 [3]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg2_b4  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg2 [4]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg3 [4]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg2_b5  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg2 [5]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg3 [5]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg2_b6  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg2 [6]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg3 [6]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg2_b7  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg2 [7]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg3 [7]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg3_b0  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg3 [0]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg4 [0]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg3_b1  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg3 [1]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg4 [1]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg3_b2  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg3 [2]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg4 [2]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg3_b3  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg3 [3]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg4 [3]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg3_b4  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg3 [4]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg4 [4]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg3_b5  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg3 [5]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg4 [5]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg3_b6  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg3 [6]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg4 [6]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg3_b7  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg3 [7]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg4 [7]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg4_b0  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg4 [0]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg5 [0]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg4_b1  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg4 [1]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg5 [1]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg4_b2  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg4 [2]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg5 [2]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg4_b3  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg4 [3]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg5 [3]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg4_b4  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg4 [4]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg5 [4]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg4_b5  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg4 [5]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg5 [5]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg4_b6  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg4 [6]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg5 [6]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg4_b7  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg4 [7]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg5 [7]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg5_b0  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg5 [0]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg6 [0]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg5_b1  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg5 [1]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg6 [1]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg5_b2  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg5 [2]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg6 [2]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg5_b3  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg5 [3]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg6 [3]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg5_b4  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg5 [4]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg6 [4]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg5_b5  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg5 [5]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg6 [5]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg5_b6  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg5 [6]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg6 [6]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg5_b7  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg5 [7]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg6 [7]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg6_b0  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg6 [0]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg7 [0]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg6_b1  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg6 [1]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg7 [1]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg6_b2  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg6 [2]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg7 [2]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg6_b3  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg6 [3]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg7 [3]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg6_b4  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg6 [4]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg7 [4]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg6_b5  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg6 [5]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg7 [5]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg6_b6  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg6 [6]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg7 [6]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg6_b7  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg6 [7]),
    .en(\u_uart/rx_en ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/shift_reg7 [7]));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w1 \u_uart/u_ubus/reg7_b0  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg1 [0]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_cmd[0]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg7_b1  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg1 [1]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_cmd[1]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg7_b2  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg1 [2]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_cmd[2]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg7_b3  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg1 [3]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_cmd[3]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg7_b4  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg1 [4]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_cmd[4]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg7_b5  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg1 [5]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_cmd[5]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg7_b6  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg1 [6]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_cmd[6]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg7_b7  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg1 [7]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_cmd[7]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg8_b0  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg0 [0]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_data[0]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg8_b1  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg0 [1]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_data[1]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg8_b2  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg0 [2]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_data[2]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg8_b3  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg0 [3]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_data[3]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg8_b4  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg0 [4]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_data[4]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg8_b5  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg0 [5]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_data[5]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg8_b6  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg0 [6]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_data[6]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg8_b7  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/shift_reg0 [7]),
    .en(\u_uart/u_ubus/frame_head_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_data[7]));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b0  (
    .clk(vga_clk_pad),
    .d(send_data[0]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [0]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b1  (
    .clk(vga_clk_pad),
    .d(send_data[1]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [1]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b10  (
    .clk(vga_clk_pad),
    .d(send_cmd[2]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [10]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b11  (
    .clk(vga_clk_pad),
    .d(send_cmd[3]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [11]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b12  (
    .clk(vga_clk_pad),
    .d(send_cmd[4]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [12]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b13  (
    .clk(vga_clk_pad),
    .d(send_cmd[5]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [13]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b14  (
    .clk(vga_clk_pad),
    .d(send_cmd[6]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [14]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b15  (
    .clk(vga_clk_pad),
    .d(send_cmd[7]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [15]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b2  (
    .clk(vga_clk_pad),
    .d(send_data[2]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [2]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b3  (
    .clk(vga_clk_pad),
    .d(send_data[3]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [3]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b4  (
    .clk(vga_clk_pad),
    .d(send_data[4]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [4]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b5  (
    .clk(vga_clk_pad),
    .d(send_data[5]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [5]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b6  (
    .clk(vga_clk_pad),
    .d(send_data[6]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [6]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b7  (
    .clk(vga_clk_pad),
    .d(send_data[7]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [7]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b8  (
    .clk(vga_clk_pad),
    .d(send_cmd[0]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [8]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/reg9_b9  (
    .clk(vga_clk_pad),
    .d(send_cmd[1]),
    .en(send_en),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_buffer [9]));  // sources/rtl/uart/ubus.v(143)
  reg_ar_as_w1 \u_uart/u_ubus/rx_en_d_reg  (
    .clk(vga_clk_pad),
    .d(\u_uart/rx_en ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/rx_en_d ));  // sources/rtl/uart/ubus.v(107)
  reg_sr_as_w1 \u_uart/u_ubus/send_finish_reg  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/send_finish_d ),
    .en(1'b1),
    .reset(send_en),
    .set(1'b0),
    .q(\u_uart/u_ubus/send_finish ));  // sources/rtl/uart/ubus.v(161)
  reg_ar_as_w1 \u_uart/u_ubus/send_flag_reg  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/n42 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/send_flag ));  // sources/rtl/uart/ubus.v(183)
  reg_sr_as_w1 \u_uart/u_ubus/send_ready_reg  (
    .clk(vga_clk_pad),
    .d(send_ready_d),
    .en(1'b1),
    .reset(send_en),
    .set(1'b0),
    .q(send_ready));  // sources/rtl/uart/ubus.v(216)
  reg_ar_ss_w1 \u_uart/u_ubus/send_start_reg  (
    .clk(vga_clk_pad),
    .d(1'b0),
    .en(\u_uart/u_ubus/send_finish ),
    .reset(1'b0),
    .set(send_en),
    .q(\u_uart/u_ubus/send_start ));  // sources/rtl/uart/ubus.v(152)
  reg_ar_as_w1 \u_uart/u_ubus/tx_en_reg  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/send_flag ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/tx_en ));  // sources/rtl/uart/ubus.v(183)
  reg_ar_as_w1 \u_uart/u_ubus/tx_ready_flag_reg  (
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/n41 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart/u_ubus/tx_ready_flag ));  // sources/rtl/uart/ubus.v(176)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vga/add0/u0  (
    .a(\u_vga/hsyn_cnt [0]),
    .b(1'b1),
    .c(\u_vga/add0/c0 ),
    .o({\u_vga/add0/c1 ,\u_vga/n1 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vga/add0/u1  (
    .a(\u_vga/hsyn_cnt [1]),
    .b(1'b0),
    .c(\u_vga/add0/c1 ),
    .o({\u_vga/add0/c2 ,\u_vga/n1 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vga/add0/u10  (
    .a(\u_vga/hsyn_cnt [10]),
    .b(1'b0),
    .c(\u_vga/add0/c10 ),
    .o({\u_vga/add0/c11 ,\u_vga/n1 [10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vga/add0/u11  (
    .a(\u_vga/hsyn_cnt [11]),
    .b(1'b0),
    .c(\u_vga/add0/c11 ),
    .o({\u_vga/add0/c12 ,\u_vga/n1 [11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vga/add0/u12  (
    .a(\u_vga/hsyn_cnt [12]),
    .b(1'b0),
    .c(\u_vga/add0/c12 ),
    .o({open_n990,\u_vga/n1 [12]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vga/add0/u2  (
    .a(\u_vga/hsyn_cnt [2]),
    .b(1'b0),
    .c(\u_vga/add0/c2 ),
    .o({\u_vga/add0/c3 ,\u_vga/n1 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vga/add0/u3  (
    .a(\u_vga/hsyn_cnt [3]),
    .b(1'b0),
    .c(\u_vga/add0/c3 ),
    .o({\u_vga/add0/c4 ,\u_vga/n1 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vga/add0/u4  (
    .a(\u_vga/hsyn_cnt [4]),
    .b(1'b0),
    .c(\u_vga/add0/c4 ),
    .o({\u_vga/add0/c5 ,\u_vga/n1 [4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vga/add0/u5  (
    .a(\u_vga/hsyn_cnt [5]),
    .b(1'b0),
    .c(\u_vga/add0/c5 ),
    .o({\u_vga/add0/c6 ,\u_vga/n1 [5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vga/add0/u6  (
    .a(\u_vga/hsyn_cnt [6]),
    .b(1'b0),
    .c(\u_vga/add0/c6 ),
    .o({\u_vga/add0/c7 ,\u_vga/n1 [6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vga/add0/u7  (
    .a(\u_vga/hsyn_cnt [7]),
    .b(1'b0),
    .c(\u_vga/add0/c7 ),
    .o({\u_vga/add0/c8 ,\u_vga/n1 [7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vga/add0/u8  (
    .a(\u_vga/hsyn_cnt [8]),
    .b(1'b0),
    .c(\u_vga/add0/c8 ),
    .o({\u_vga/add0/c9 ,\u_vga/n1 [8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vga/add0/u9  (
    .a(\u_vga/hsyn_cnt [9]),
    .b(1'b0),
    .c(\u_vga/add0/c9 ),
    .o({\u_vga/add0/c10 ,\u_vga/n1 [9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \u_vga/add0/ucin  (
    .a(1'b0),
    .o({\u_vga/add0/c0 ,open_n993}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vga/add1/u0  (
    .a(\u_vga/vsyn_cnt [0]),
    .b(1'b1),
    .c(\u_vga/add1/c0 ),
    .o({\u_vga/add1/c1 ,\u_vga/n4 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vga/add1/u1  (
    .a(\u_vga/vsyn_cnt [1]),
    .b(1'b0),
    .c(\u_vga/add1/c1 ),
    .o({\u_vga/add1/c2 ,\u_vga/n4 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vga/add1/u10  (
    .a(\u_vga/vsyn_cnt [10]),
    .b(1'b0),
    .c(\u_vga/add1/c10 ),
    .o({\u_vga/add1/c11 ,\u_vga/n4 [10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vga/add1/u11  (
    .a(\u_vga/vsyn_cnt [11]),
    .b(1'b0),
    .c(\u_vga/add1/c11 ),
    .o({\u_vga/add1/c12 ,\u_vga/n4 [11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vga/add1/u12  (
    .a(\u_vga/vsyn_cnt [12]),
    .b(1'b0),
    .c(\u_vga/add1/c12 ),
    .o({open_n994,\u_vga/n4 [12]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vga/add1/u2  (
    .a(\u_vga/vsyn_cnt [2]),
    .b(1'b0),
    .c(\u_vga/add1/c2 ),
    .o({\u_vga/add1/c3 ,\u_vga/n4 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vga/add1/u3  (
    .a(\u_vga/vsyn_cnt [3]),
    .b(1'b0),
    .c(\u_vga/add1/c3 ),
    .o({\u_vga/add1/c4 ,\u_vga/n4 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vga/add1/u4  (
    .a(\u_vga/vsyn_cnt [4]),
    .b(1'b0),
    .c(\u_vga/add1/c4 ),
    .o({\u_vga/add1/c5 ,\u_vga/n4 [4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vga/add1/u5  (
    .a(\u_vga/vsyn_cnt [5]),
    .b(1'b0),
    .c(\u_vga/add1/c5 ),
    .o({\u_vga/add1/c6 ,\u_vga/n4 [5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vga/add1/u6  (
    .a(\u_vga/vsyn_cnt [6]),
    .b(1'b0),
    .c(\u_vga/add1/c6 ),
    .o({\u_vga/add1/c7 ,\u_vga/n4 [6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vga/add1/u7  (
    .a(\u_vga/vsyn_cnt [7]),
    .b(1'b0),
    .c(\u_vga/add1/c7 ),
    .o({\u_vga/add1/c8 ,\u_vga/n4 [7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vga/add1/u8  (
    .a(\u_vga/vsyn_cnt [8]),
    .b(1'b0),
    .c(\u_vga/add1/c8 ),
    .o({\u_vga/add1/c9 ,\u_vga/n4 [8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vga/add1/u9  (
    .a(\u_vga/vsyn_cnt [9]),
    .b(1'b0),
    .c(\u_vga/add1/c9 ),
    .o({\u_vga/add1/c10 ,\u_vga/n4 [9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \u_vga/add1/ucin  (
    .a(1'b0),
    .o({\u_vga/add1/c0 ,open_n997}));
  reg_sr_as_w1 \u_vga/axis_en_reg  (
    .clk(vga_clk_pad),
    .d(\u_vga/n16 ),
    .en(1'b1),
    .reset(~\u_vga/n13 ),
    .set(1'b0),
    .q(axis_en));  // sources/rtl/vga/vga.v(111)
  reg_ar_as_w1 \u_vga/hsyn_reg  (
    .clk(vga_clk_pad),
    .d(\u_vga/n8 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(hsyn));  // sources/rtl/vga/vga.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt0_0  (
    .a(\u_vga/hsyn_cnt [0]),
    .b(1'b0),
    .c(\u_vga/lt0_c0 ),
    .o({\u_vga/lt0_c1 ,open_n998}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt0_1  (
    .a(\u_vga/hsyn_cnt [1]),
    .b(1'b0),
    .c(\u_vga/lt0_c1 ),
    .o({\u_vga/lt0_c2 ,open_n999}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt0_10  (
    .a(\u_vga/hsyn_cnt [10]),
    .b(1'b0),
    .c(\u_vga/lt0_c10 ),
    .o({\u_vga/lt0_c11 ,open_n1000}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt0_11  (
    .a(\u_vga/hsyn_cnt [11]),
    .b(1'b0),
    .c(\u_vga/lt0_c11 ),
    .o({\u_vga/lt0_c12 ,open_n1001}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt0_12  (
    .a(\u_vga/hsyn_cnt [12]),
    .b(1'b0),
    .c(\u_vga/lt0_c12 ),
    .o({\u_vga/lt0_c13 ,open_n1002}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt0_2  (
    .a(\u_vga/hsyn_cnt [2]),
    .b(1'b0),
    .c(\u_vga/lt0_c2 ),
    .o({\u_vga/lt0_c3 ,open_n1003}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt0_3  (
    .a(\u_vga/hsyn_cnt [3]),
    .b(1'b0),
    .c(\u_vga/lt0_c3 ),
    .o({\u_vga/lt0_c4 ,open_n1004}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt0_4  (
    .a(\u_vga/hsyn_cnt [4]),
    .b(1'b0),
    .c(\u_vga/lt0_c4 ),
    .o({\u_vga/lt0_c5 ,open_n1005}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt0_5  (
    .a(\u_vga/hsyn_cnt [5]),
    .b(1'b1),
    .c(\u_vga/lt0_c5 ),
    .o({\u_vga/lt0_c6 ,open_n1006}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt0_6  (
    .a(\u_vga/hsyn_cnt [6]),
    .b(1'b1),
    .c(\u_vga/lt0_c6 ),
    .o({\u_vga/lt0_c7 ,open_n1007}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt0_7  (
    .a(\u_vga/hsyn_cnt [7]),
    .b(1'b0),
    .c(\u_vga/lt0_c7 ),
    .o({\u_vga/lt0_c8 ,open_n1008}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt0_8  (
    .a(\u_vga/hsyn_cnt [8]),
    .b(1'b0),
    .c(\u_vga/lt0_c8 ),
    .o({\u_vga/lt0_c9 ,open_n1009}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt0_9  (
    .a(\u_vga/hsyn_cnt [9]),
    .b(1'b0),
    .c(\u_vga/lt0_c9 ),
    .o({\u_vga/lt0_c10 ,open_n1010}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    \u_vga/lt0_cin  (
    .a(1'b0),
    .o({\u_vga/lt0_c0 ,open_n1013}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt0_cout  (
    .a(1'b0),
    .b(1'b1),
    .c(\u_vga/lt0_c13 ),
    .o({open_n1014,\u_vga/n7 }));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt1_0  (
    .a(\u_vga/vsyn_cnt [0]),
    .b(1'b0),
    .c(\u_vga/lt1_c0 ),
    .o({\u_vga/lt1_c1 ,open_n1015}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt1_1  (
    .a(\u_vga/vsyn_cnt [1]),
    .b(1'b1),
    .c(\u_vga/lt1_c1 ),
    .o({\u_vga/lt1_c2 ,open_n1016}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt1_10  (
    .a(\u_vga/vsyn_cnt [10]),
    .b(1'b0),
    .c(\u_vga/lt1_c10 ),
    .o({\u_vga/lt1_c11 ,open_n1017}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt1_11  (
    .a(\u_vga/vsyn_cnt [11]),
    .b(1'b0),
    .c(\u_vga/lt1_c11 ),
    .o({\u_vga/lt1_c12 ,open_n1018}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt1_12  (
    .a(\u_vga/vsyn_cnt [12]),
    .b(1'b0),
    .c(\u_vga/lt1_c12 ),
    .o({\u_vga/lt1_c13 ,open_n1019}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt1_2  (
    .a(\u_vga/vsyn_cnt [2]),
    .b(1'b0),
    .c(\u_vga/lt1_c2 ),
    .o({\u_vga/lt1_c3 ,open_n1020}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt1_3  (
    .a(\u_vga/vsyn_cnt [3]),
    .b(1'b0),
    .c(\u_vga/lt1_c3 ),
    .o({\u_vga/lt1_c4 ,open_n1021}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt1_4  (
    .a(\u_vga/vsyn_cnt [4]),
    .b(1'b0),
    .c(\u_vga/lt1_c4 ),
    .o({\u_vga/lt1_c5 ,open_n1022}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt1_5  (
    .a(\u_vga/vsyn_cnt [5]),
    .b(1'b0),
    .c(\u_vga/lt1_c5 ),
    .o({\u_vga/lt1_c6 ,open_n1023}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt1_6  (
    .a(\u_vga/vsyn_cnt [6]),
    .b(1'b0),
    .c(\u_vga/lt1_c6 ),
    .o({\u_vga/lt1_c7 ,open_n1024}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt1_7  (
    .a(\u_vga/vsyn_cnt [7]),
    .b(1'b0),
    .c(\u_vga/lt1_c7 ),
    .o({\u_vga/lt1_c8 ,open_n1025}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt1_8  (
    .a(\u_vga/vsyn_cnt [8]),
    .b(1'b0),
    .c(\u_vga/lt1_c8 ),
    .o({\u_vga/lt1_c9 ,open_n1026}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt1_9  (
    .a(\u_vga/vsyn_cnt [9]),
    .b(1'b0),
    .c(\u_vga/lt1_c9 ),
    .o({\u_vga/lt1_c10 ,open_n1027}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    \u_vga/lt1_cin  (
    .a(1'b0),
    .o({\u_vga/lt1_c0 ,open_n1030}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt1_cout  (
    .a(1'b0),
    .b(1'b1),
    .c(\u_vga/lt1_c13 ),
    .o({open_n1031,\u_vga/n9 }));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt2_0  (
    .a(1'b1),
    .b(\u_vga/vsyn_cnt [0]),
    .c(\u_vga/lt2_c0 ),
    .o({\u_vga/lt2_c1 ,open_n1032}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt2_1  (
    .a(1'b1),
    .b(\u_vga/vsyn_cnt [1]),
    .c(\u_vga/lt2_c1 ),
    .o({\u_vga/lt2_c2 ,open_n1033}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt2_10  (
    .a(1'b0),
    .b(\u_vga/vsyn_cnt [10]),
    .c(\u_vga/lt2_c10 ),
    .o({\u_vga/lt2_c11 ,open_n1034}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt2_11  (
    .a(1'b0),
    .b(\u_vga/vsyn_cnt [11]),
    .c(\u_vga/lt2_c11 ),
    .o({\u_vga/lt2_c12 ,open_n1035}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt2_12  (
    .a(1'b0),
    .b(\u_vga/vsyn_cnt [12]),
    .c(\u_vga/lt2_c12 ),
    .o({\u_vga/lt2_c13 ,open_n1036}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt2_2  (
    .a(1'b0),
    .b(\u_vga/vsyn_cnt [2]),
    .c(\u_vga/lt2_c2 ),
    .o({\u_vga/lt2_c3 ,open_n1037}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt2_3  (
    .a(1'b0),
    .b(\u_vga/vsyn_cnt [3]),
    .c(\u_vga/lt2_c3 ),
    .o({\u_vga/lt2_c4 ,open_n1038}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt2_4  (
    .a(1'b0),
    .b(\u_vga/vsyn_cnt [4]),
    .c(\u_vga/lt2_c4 ),
    .o({\u_vga/lt2_c5 ,open_n1039}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt2_5  (
    .a(1'b1),
    .b(\u_vga/vsyn_cnt [5]),
    .c(\u_vga/lt2_c5 ),
    .o({\u_vga/lt2_c6 ,open_n1040}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt2_6  (
    .a(1'b0),
    .b(\u_vga/vsyn_cnt [6]),
    .c(\u_vga/lt2_c6 ),
    .o({\u_vga/lt2_c7 ,open_n1041}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt2_7  (
    .a(1'b0),
    .b(\u_vga/vsyn_cnt [7]),
    .c(\u_vga/lt2_c7 ),
    .o({\u_vga/lt2_c8 ,open_n1042}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt2_8  (
    .a(1'b0),
    .b(\u_vga/vsyn_cnt [8]),
    .c(\u_vga/lt2_c8 ),
    .o({\u_vga/lt2_c9 ,open_n1043}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt2_9  (
    .a(1'b0),
    .b(\u_vga/vsyn_cnt [9]),
    .c(\u_vga/lt2_c9 ),
    .o({\u_vga/lt2_c10 ,open_n1044}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    \u_vga/lt2_cin  (
    .a(1'b1),
    .o({\u_vga/lt2_c0 ,open_n1047}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt2_cout  (
    .a(1'b0),
    .b(1'b1),
    .c(\u_vga/lt2_c13 ),
    .o({open_n1048,\u_vga/n11 }));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt3_0  (
    .a(\u_vga/vsyn_cnt [0]),
    .b(1'b1),
    .c(\u_vga/lt3_c0 ),
    .o({\u_vga/lt3_c1 ,open_n1049}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt3_1  (
    .a(\u_vga/vsyn_cnt [1]),
    .b(1'b1),
    .c(\u_vga/lt3_c1 ),
    .o({\u_vga/lt3_c2 ,open_n1050}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt3_10  (
    .a(\u_vga/vsyn_cnt [10]),
    .b(1'b0),
    .c(\u_vga/lt3_c10 ),
    .o({\u_vga/lt3_c11 ,open_n1051}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt3_11  (
    .a(\u_vga/vsyn_cnt [11]),
    .b(1'b0),
    .c(\u_vga/lt3_c11 ),
    .o({\u_vga/lt3_c12 ,open_n1052}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt3_12  (
    .a(\u_vga/vsyn_cnt [12]),
    .b(1'b0),
    .c(\u_vga/lt3_c12 ),
    .o({\u_vga/lt3_c13 ,open_n1053}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt3_2  (
    .a(\u_vga/vsyn_cnt [2]),
    .b(1'b0),
    .c(\u_vga/lt3_c2 ),
    .o({\u_vga/lt3_c3 ,open_n1054}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt3_3  (
    .a(\u_vga/vsyn_cnt [3]),
    .b(1'b0),
    .c(\u_vga/lt3_c3 ),
    .o({\u_vga/lt3_c4 ,open_n1055}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt3_4  (
    .a(\u_vga/vsyn_cnt [4]),
    .b(1'b0),
    .c(\u_vga/lt3_c4 ),
    .o({\u_vga/lt3_c5 ,open_n1056}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt3_5  (
    .a(\u_vga/vsyn_cnt [5]),
    .b(1'b0),
    .c(\u_vga/lt3_c5 ),
    .o({\u_vga/lt3_c6 ,open_n1057}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt3_6  (
    .a(\u_vga/vsyn_cnt [6]),
    .b(1'b0),
    .c(\u_vga/lt3_c6 ),
    .o({\u_vga/lt3_c7 ,open_n1058}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt3_7  (
    .a(\u_vga/vsyn_cnt [7]),
    .b(1'b0),
    .c(\u_vga/lt3_c7 ),
    .o({\u_vga/lt3_c8 ,open_n1059}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt3_8  (
    .a(\u_vga/vsyn_cnt [8]),
    .b(1'b0),
    .c(\u_vga/lt3_c8 ),
    .o({\u_vga/lt3_c9 ,open_n1060}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt3_9  (
    .a(\u_vga/vsyn_cnt [9]),
    .b(1'b1),
    .c(\u_vga/lt3_c9 ),
    .o({\u_vga/lt3_c10 ,open_n1061}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    \u_vga/lt3_cin  (
    .a(1'b0),
    .o({\u_vga/lt3_c0 ,open_n1064}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt3_cout  (
    .a(1'b0),
    .b(1'b1),
    .c(\u_vga/lt3_c13 ),
    .o({open_n1065,\u_vga/n12 }));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt4_0  (
    .a(1'b0),
    .b(\u_vga/hsyn_cnt [0]),
    .c(\u_vga/lt4_c0 ),
    .o({\u_vga/lt4_c1 ,open_n1066}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt4_1  (
    .a(1'b0),
    .b(\u_vga/hsyn_cnt [1]),
    .c(\u_vga/lt4_c1 ),
    .o({\u_vga/lt4_c2 ,open_n1067}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt4_10  (
    .a(1'b0),
    .b(\u_vga/hsyn_cnt [10]),
    .c(\u_vga/lt4_c10 ),
    .o({\u_vga/lt4_c11 ,open_n1068}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt4_11  (
    .a(1'b0),
    .b(\u_vga/hsyn_cnt [11]),
    .c(\u_vga/lt4_c11 ),
    .o({\u_vga/lt4_c12 ,open_n1069}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt4_12  (
    .a(1'b0),
    .b(\u_vga/hsyn_cnt [12]),
    .c(\u_vga/lt4_c12 ),
    .o({\u_vga/lt4_c13 ,open_n1070}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt4_2  (
    .a(1'b0),
    .b(\u_vga/hsyn_cnt [2]),
    .c(\u_vga/lt4_c2 ),
    .o({\u_vga/lt4_c3 ,open_n1071}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt4_3  (
    .a(1'b0),
    .b(\u_vga/hsyn_cnt [3]),
    .c(\u_vga/lt4_c3 ),
    .o({\u_vga/lt4_c4 ,open_n1072}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt4_4  (
    .a(1'b1),
    .b(\u_vga/hsyn_cnt [4]),
    .c(\u_vga/lt4_c4 ),
    .o({\u_vga/lt4_c5 ,open_n1073}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt4_5  (
    .a(1'b0),
    .b(\u_vga/hsyn_cnt [5]),
    .c(\u_vga/lt4_c5 ),
    .o({\u_vga/lt4_c6 ,open_n1074}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt4_6  (
    .a(1'b0),
    .b(\u_vga/hsyn_cnt [6]),
    .c(\u_vga/lt4_c6 ),
    .o({\u_vga/lt4_c7 ,open_n1075}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt4_7  (
    .a(1'b1),
    .b(\u_vga/hsyn_cnt [7]),
    .c(\u_vga/lt4_c7 ),
    .o({\u_vga/lt4_c8 ,open_n1076}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt4_8  (
    .a(1'b0),
    .b(\u_vga/hsyn_cnt [8]),
    .c(\u_vga/lt4_c8 ),
    .o({\u_vga/lt4_c9 ,open_n1077}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt4_9  (
    .a(1'b0),
    .b(\u_vga/hsyn_cnt [9]),
    .c(\u_vga/lt4_c9 ),
    .o({\u_vga/lt4_c10 ,open_n1078}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    \u_vga/lt4_cin  (
    .a(1'b1),
    .o({\u_vga/lt4_c0 ,open_n1081}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt4_cout  (
    .a(1'b0),
    .b(1'b1),
    .c(\u_vga/lt4_c13 ),
    .o({open_n1082,\u_vga/n14 }));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt5_0  (
    .a(\u_vga/hsyn_cnt [0]),
    .b(1'b0),
    .c(\u_vga/lt5_c0 ),
    .o({\u_vga/lt5_c1 ,open_n1083}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt5_1  (
    .a(\u_vga/hsyn_cnt [1]),
    .b(1'b0),
    .c(\u_vga/lt5_c1 ),
    .o({\u_vga/lt5_c2 ,open_n1084}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt5_10  (
    .a(\u_vga/hsyn_cnt [10]),
    .b(1'b0),
    .c(\u_vga/lt5_c10 ),
    .o({\u_vga/lt5_c11 ,open_n1085}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt5_11  (
    .a(\u_vga/hsyn_cnt [11]),
    .b(1'b0),
    .c(\u_vga/lt5_c11 ),
    .o({\u_vga/lt5_c12 ,open_n1086}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt5_12  (
    .a(\u_vga/hsyn_cnt [12]),
    .b(1'b0),
    .c(\u_vga/lt5_c12 ),
    .o({\u_vga/lt5_c13 ,open_n1087}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt5_2  (
    .a(\u_vga/hsyn_cnt [2]),
    .b(1'b0),
    .c(\u_vga/lt5_c2 ),
    .o({\u_vga/lt5_c3 ,open_n1088}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt5_3  (
    .a(\u_vga/hsyn_cnt [3]),
    .b(1'b0),
    .c(\u_vga/lt5_c3 ),
    .o({\u_vga/lt5_c4 ,open_n1089}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt5_4  (
    .a(\u_vga/hsyn_cnt [4]),
    .b(1'b1),
    .c(\u_vga/lt5_c4 ),
    .o({\u_vga/lt5_c5 ,open_n1090}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt5_5  (
    .a(\u_vga/hsyn_cnt [5]),
    .b(1'b0),
    .c(\u_vga/lt5_c5 ),
    .o({\u_vga/lt5_c6 ,open_n1091}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt5_6  (
    .a(\u_vga/hsyn_cnt [6]),
    .b(1'b0),
    .c(\u_vga/lt5_c6 ),
    .o({\u_vga/lt5_c7 ,open_n1092}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt5_7  (
    .a(\u_vga/hsyn_cnt [7]),
    .b(1'b0),
    .c(\u_vga/lt5_c7 ),
    .o({\u_vga/lt5_c8 ,open_n1093}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt5_8  (
    .a(\u_vga/hsyn_cnt [8]),
    .b(1'b1),
    .c(\u_vga/lt5_c8 ),
    .o({\u_vga/lt5_c9 ,open_n1094}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt5_9  (
    .a(\u_vga/hsyn_cnt [9]),
    .b(1'b1),
    .c(\u_vga/lt5_c9 ),
    .o({\u_vga/lt5_c10 ,open_n1095}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    \u_vga/lt5_cin  (
    .a(1'b0),
    .o({\u_vga/lt5_c0 ,open_n1098}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vga/lt5_cout  (
    .a(1'b0),
    .b(1'b1),
    .c(\u_vga/lt5_c13 ),
    .o({open_n1099,\u_vga/n15 }));
  reg_ar_as_w1 \u_vga/reg0_b0  (
    .clk(vga_clk_pad),
    .d(\u_vga/n5 [0]),
    .en(\u_vga/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vga/vsyn_cnt [0]));  // sources/rtl/vga/vga.v(79)
  reg_ar_as_w1 \u_vga/reg0_b1  (
    .clk(vga_clk_pad),
    .d(\u_vga/n5 [1]),
    .en(\u_vga/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vga/vsyn_cnt [1]));  // sources/rtl/vga/vga.v(79)
  reg_ar_as_w1 \u_vga/reg0_b10  (
    .clk(vga_clk_pad),
    .d(\u_vga/n5 [10]),
    .en(\u_vga/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vga/vsyn_cnt [10]));  // sources/rtl/vga/vga.v(79)
  reg_ar_as_w1 \u_vga/reg0_b11  (
    .clk(vga_clk_pad),
    .d(\u_vga/n5 [11]),
    .en(\u_vga/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vga/vsyn_cnt [11]));  // sources/rtl/vga/vga.v(79)
  reg_ar_as_w1 \u_vga/reg0_b12  (
    .clk(vga_clk_pad),
    .d(\u_vga/n5 [12]),
    .en(\u_vga/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vga/vsyn_cnt [12]));  // sources/rtl/vga/vga.v(79)
  reg_ar_as_w1 \u_vga/reg0_b2  (
    .clk(vga_clk_pad),
    .d(\u_vga/n5 [2]),
    .en(\u_vga/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vga/vsyn_cnt [2]));  // sources/rtl/vga/vga.v(79)
  reg_ar_as_w1 \u_vga/reg0_b3  (
    .clk(vga_clk_pad),
    .d(\u_vga/n5 [3]),
    .en(\u_vga/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vga/vsyn_cnt [3]));  // sources/rtl/vga/vga.v(79)
  reg_ar_as_w1 \u_vga/reg0_b4  (
    .clk(vga_clk_pad),
    .d(\u_vga/n5 [4]),
    .en(\u_vga/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vga/vsyn_cnt [4]));  // sources/rtl/vga/vga.v(79)
  reg_ar_as_w1 \u_vga/reg0_b5  (
    .clk(vga_clk_pad),
    .d(\u_vga/n5 [5]),
    .en(\u_vga/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vga/vsyn_cnt [5]));  // sources/rtl/vga/vga.v(79)
  reg_ar_as_w1 \u_vga/reg0_b6  (
    .clk(vga_clk_pad),
    .d(\u_vga/n5 [6]),
    .en(\u_vga/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vga/vsyn_cnt [6]));  // sources/rtl/vga/vga.v(79)
  reg_ar_as_w1 \u_vga/reg0_b7  (
    .clk(vga_clk_pad),
    .d(\u_vga/n5 [7]),
    .en(\u_vga/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vga/vsyn_cnt [7]));  // sources/rtl/vga/vga.v(79)
  reg_ar_as_w1 \u_vga/reg0_b8  (
    .clk(vga_clk_pad),
    .d(\u_vga/n5 [8]),
    .en(\u_vga/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vga/vsyn_cnt [8]));  // sources/rtl/vga/vga.v(79)
  reg_ar_as_w1 \u_vga/reg0_b9  (
    .clk(vga_clk_pad),
    .d(\u_vga/n5 [9]),
    .en(\u_vga/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vga/vsyn_cnt [9]));  // sources/rtl/vga/vga.v(79)
  reg_sr_as_w1 \u_vga/reg1_b0  (
    .clk(vga_clk_pad),
    .d(\u_vga/hsyn_cnt [0]),
    .en(1'b1),
    .reset(~\u_vga/mux4_b0_sel_is_3_o ),
    .set(1'b0),
    .q(axis_x[0]));  // sources/rtl/vga/vga.v(125)
  reg_sr_as_w1 \u_vga/reg1_b1  (
    .clk(vga_clk_pad),
    .d(\u_vga/hsyn_cnt [1]),
    .en(1'b1),
    .reset(~\u_vga/mux4_b0_sel_is_3_o ),
    .set(1'b0),
    .q(axis_x[1]));  // sources/rtl/vga/vga.v(125)
  reg_sr_as_w1 \u_vga/reg1_b10  (
    .clk(vga_clk_pad),
    .d(n0[6]),
    .en(1'b1),
    .reset(~\u_vga/mux4_b0_sel_is_3_o ),
    .set(1'b0),
    .q(axis_x[10]));  // sources/rtl/vga/vga.v(125)
  reg_sr_as_w1 \u_vga/reg1_b2  (
    .clk(vga_clk_pad),
    .d(\u_vga/hsyn_cnt [2]),
    .en(1'b1),
    .reset(~\u_vga/mux4_b0_sel_is_3_o ),
    .set(1'b0),
    .q(axis_x[2]));  // sources/rtl/vga/vga.v(125)
  reg_sr_as_w1 \u_vga/reg1_b3  (
    .clk(vga_clk_pad),
    .d(\u_vga/hsyn_cnt [3]),
    .en(1'b1),
    .reset(~\u_vga/mux4_b0_sel_is_3_o ),
    .set(1'b0),
    .q(axis_x[3]));  // sources/rtl/vga/vga.v(125)
  reg_sr_as_w1 \u_vga/reg1_b4  (
    .clk(vga_clk_pad),
    .d(n0[0]),
    .en(1'b1),
    .reset(~\u_vga/mux4_b0_sel_is_3_o ),
    .set(1'b0),
    .q(axis_x[4]));  // sources/rtl/vga/vga.v(125)
  reg_sr_as_w1 \u_vga/reg1_b5  (
    .clk(vga_clk_pad),
    .d(n0[1]),
    .en(1'b1),
    .reset(~\u_vga/mux4_b0_sel_is_3_o ),
    .set(1'b0),
    .q(axis_x[5]));  // sources/rtl/vga/vga.v(125)
  reg_sr_as_w1 \u_vga/reg1_b6  (
    .clk(vga_clk_pad),
    .d(n0[2]),
    .en(1'b1),
    .reset(~\u_vga/mux4_b0_sel_is_3_o ),
    .set(1'b0),
    .q(axis_x[6]));  // sources/rtl/vga/vga.v(125)
  reg_sr_as_w1 \u_vga/reg1_b7  (
    .clk(vga_clk_pad),
    .d(n0[3]),
    .en(1'b1),
    .reset(~\u_vga/mux4_b0_sel_is_3_o ),
    .set(1'b0),
    .q(axis_x[7]));  // sources/rtl/vga/vga.v(125)
  reg_sr_as_w1 \u_vga/reg1_b8  (
    .clk(vga_clk_pad),
    .d(n0[4]),
    .en(1'b1),
    .reset(~\u_vga/mux4_b0_sel_is_3_o ),
    .set(1'b0),
    .q(axis_x[8]));  // sources/rtl/vga/vga.v(125)
  reg_sr_as_w1 \u_vga/reg1_b9  (
    .clk(vga_clk_pad),
    .d(n0[5]),
    .en(1'b1),
    .reset(~\u_vga/mux4_b0_sel_is_3_o ),
    .set(1'b0),
    .q(axis_x[9]));  // sources/rtl/vga/vga.v(125)
  reg_sr_as_w1 \u_vga/reg2_b0  (
    .clk(vga_clk_pad),
    .d(\u_vga/n21 [0]),
    .en(1'b1),
    .reset(~\u_vga/n13 ),
    .set(1'b0),
    .q(axis_y[0]));  // sources/rtl/vga/vga.v(134)
  reg_sr_as_w1 \u_vga/reg2_b1  (
    .clk(vga_clk_pad),
    .d(\u_vga/n21 [1]),
    .en(1'b1),
    .reset(~\u_vga/n13 ),
    .set(1'b0),
    .q(axis_y[1]));  // sources/rtl/vga/vga.v(134)
  reg_sr_as_w1 \u_vga/reg2_b10  (
    .clk(vga_clk_pad),
    .d(\u_vga/n21 [10]),
    .en(1'b1),
    .reset(~\u_vga/n13 ),
    .set(1'b0),
    .q(axis_y[10]));  // sources/rtl/vga/vga.v(134)
  reg_sr_as_w1 \u_vga/reg2_b2  (
    .clk(vga_clk_pad),
    .d(\u_vga/n21 [2]),
    .en(1'b1),
    .reset(~\u_vga/n13 ),
    .set(1'b0),
    .q(axis_y[2]));  // sources/rtl/vga/vga.v(134)
  reg_sr_as_w1 \u_vga/reg2_b3  (
    .clk(vga_clk_pad),
    .d(\u_vga/n21 [3]),
    .en(1'b1),
    .reset(~\u_vga/n13 ),
    .set(1'b0),
    .q(axis_y[3]));  // sources/rtl/vga/vga.v(134)
  reg_sr_as_w1 \u_vga/reg2_b4  (
    .clk(vga_clk_pad),
    .d(\u_vga/n21 [4]),
    .en(1'b1),
    .reset(~\u_vga/n13 ),
    .set(1'b0),
    .q(axis_y[4]));  // sources/rtl/vga/vga.v(134)
  reg_sr_as_w1 \u_vga/reg2_b5  (
    .clk(vga_clk_pad),
    .d(\u_vga/n21 [5]),
    .en(1'b1),
    .reset(~\u_vga/n13 ),
    .set(1'b0),
    .q(axis_y[5]));  // sources/rtl/vga/vga.v(134)
  reg_sr_as_w1 \u_vga/reg2_b6  (
    .clk(vga_clk_pad),
    .d(\u_vga/n21 [6]),
    .en(1'b1),
    .reset(~\u_vga/n13 ),
    .set(1'b0),
    .q(axis_y[6]));  // sources/rtl/vga/vga.v(134)
  reg_sr_as_w1 \u_vga/reg2_b7  (
    .clk(vga_clk_pad),
    .d(\u_vga/n21 [7]),
    .en(1'b1),
    .reset(~\u_vga/n13 ),
    .set(1'b0),
    .q(axis_y[7]));  // sources/rtl/vga/vga.v(134)
  reg_sr_as_w1 \u_vga/reg2_b8  (
    .clk(vga_clk_pad),
    .d(\u_vga/n21 [8]),
    .en(1'b1),
    .reset(~\u_vga/n13 ),
    .set(1'b0),
    .q(axis_y[8]));  // sources/rtl/vga/vga.v(134)
  reg_sr_as_w1 \u_vga/reg2_b9  (
    .clk(vga_clk_pad),
    .d(\u_vga/n21 [9]),
    .en(1'b1),
    .reset(~\u_vga/n13 ),
    .set(1'b0),
    .q(axis_y[9]));  // sources/rtl/vga/vga.v(134)
  reg_sr_as_w1 \u_vga/reg3_b0  (
    .clk(vga_clk_pad),
    .d(\u_vga/n1 [0]),
    .en(1'b1),
    .reset(\u_vga/n0 ),
    .set(1'b0),
    .q(\u_vga/hsyn_cnt [0]));  // sources/rtl/vga/vga.v(67)
  reg_sr_as_w1 \u_vga/reg3_b1  (
    .clk(vga_clk_pad),
    .d(\u_vga/n1 [1]),
    .en(1'b1),
    .reset(\u_vga/n0 ),
    .set(1'b0),
    .q(\u_vga/hsyn_cnt [1]));  // sources/rtl/vga/vga.v(67)
  reg_sr_as_w1 \u_vga/reg3_b10  (
    .clk(vga_clk_pad),
    .d(\u_vga/n1 [10]),
    .en(1'b1),
    .reset(\u_vga/n0 ),
    .set(1'b0),
    .q(\u_vga/hsyn_cnt [10]));  // sources/rtl/vga/vga.v(67)
  reg_sr_as_w1 \u_vga/reg3_b11  (
    .clk(vga_clk_pad),
    .d(\u_vga/n1 [11]),
    .en(1'b1),
    .reset(\u_vga/n0 ),
    .set(1'b0),
    .q(\u_vga/hsyn_cnt [11]));  // sources/rtl/vga/vga.v(67)
  reg_sr_as_w1 \u_vga/reg3_b12  (
    .clk(vga_clk_pad),
    .d(\u_vga/n1 [12]),
    .en(1'b1),
    .reset(\u_vga/n0 ),
    .set(1'b0),
    .q(\u_vga/hsyn_cnt [12]));  // sources/rtl/vga/vga.v(67)
  reg_sr_as_w1 \u_vga/reg3_b2  (
    .clk(vga_clk_pad),
    .d(\u_vga/n1 [2]),
    .en(1'b1),
    .reset(\u_vga/n0 ),
    .set(1'b0),
    .q(\u_vga/hsyn_cnt [2]));  // sources/rtl/vga/vga.v(67)
  reg_sr_as_w1 \u_vga/reg3_b3  (
    .clk(vga_clk_pad),
    .d(\u_vga/n1 [3]),
    .en(1'b1),
    .reset(\u_vga/n0 ),
    .set(1'b0),
    .q(\u_vga/hsyn_cnt [3]));  // sources/rtl/vga/vga.v(67)
  reg_sr_as_w1 \u_vga/reg3_b4  (
    .clk(vga_clk_pad),
    .d(\u_vga/n1 [4]),
    .en(1'b1),
    .reset(\u_vga/n0 ),
    .set(1'b0),
    .q(\u_vga/hsyn_cnt [4]));  // sources/rtl/vga/vga.v(67)
  reg_sr_as_w1 \u_vga/reg3_b5  (
    .clk(vga_clk_pad),
    .d(\u_vga/n1 [5]),
    .en(1'b1),
    .reset(\u_vga/n0 ),
    .set(1'b0),
    .q(\u_vga/hsyn_cnt [5]));  // sources/rtl/vga/vga.v(67)
  reg_sr_as_w1 \u_vga/reg3_b6  (
    .clk(vga_clk_pad),
    .d(\u_vga/n1 [6]),
    .en(1'b1),
    .reset(\u_vga/n0 ),
    .set(1'b0),
    .q(\u_vga/hsyn_cnt [6]));  // sources/rtl/vga/vga.v(67)
  reg_sr_as_w1 \u_vga/reg3_b7  (
    .clk(vga_clk_pad),
    .d(\u_vga/n1 [7]),
    .en(1'b1),
    .reset(\u_vga/n0 ),
    .set(1'b0),
    .q(\u_vga/hsyn_cnt [7]));  // sources/rtl/vga/vga.v(67)
  reg_sr_as_w1 \u_vga/reg3_b8  (
    .clk(vga_clk_pad),
    .d(\u_vga/n1 [8]),
    .en(1'b1),
    .reset(\u_vga/n0 ),
    .set(1'b0),
    .q(\u_vga/hsyn_cnt [8]));  // sources/rtl/vga/vga.v(67)
  reg_sr_as_w1 \u_vga/reg3_b9  (
    .clk(vga_clk_pad),
    .d(\u_vga/n1 [9]),
    .en(1'b1),
    .reset(\u_vga/n0 ),
    .set(1'b0),
    .q(\u_vga/hsyn_cnt [9]));  // sources/rtl/vga/vga.v(67)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vga/sub0/u0  (
    .a(\u_vga/hsyn_cnt [4]),
    .b(1'b1),
    .c(\u_vga/sub0/c0 ),
    .o({\u_vga/sub0/c1 ,n0[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vga/sub0/u1  (
    .a(\u_vga/hsyn_cnt [5]),
    .b(1'b0),
    .c(\u_vga/sub0/c1 ),
    .o({\u_vga/sub0/c2 ,n0[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vga/sub0/u2  (
    .a(\u_vga/hsyn_cnt [6]),
    .b(1'b0),
    .c(\u_vga/sub0/c2 ),
    .o({\u_vga/sub0/c3 ,n0[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vga/sub0/u3  (
    .a(\u_vga/hsyn_cnt [7]),
    .b(1'b1),
    .c(\u_vga/sub0/c3 ),
    .o({\u_vga/sub0/c4 ,n0[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vga/sub0/u4  (
    .a(\u_vga/hsyn_cnt [8]),
    .b(1'b0),
    .c(\u_vga/sub0/c4 ),
    .o({\u_vga/sub0/c5 ,n0[4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vga/sub0/u5  (
    .a(\u_vga/hsyn_cnt [9]),
    .b(1'b0),
    .c(\u_vga/sub0/c5 ),
    .o({\u_vga/sub0/c6 ,n0[5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vga/sub0/u6  (
    .a(\u_vga/hsyn_cnt [10]),
    .b(1'b0),
    .c(\u_vga/sub0/c6 ),
    .o({open_n1100,n0[6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB_CARRY"))
    \u_vga/sub0/ucin  (
    .a(1'b0),
    .o({\u_vga/sub0/c0 ,open_n1103}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vga/sub1/u0  (
    .a(\u_vga/vsyn_cnt [0]),
    .b(1'b1),
    .c(\u_vga/sub1/c0 ),
    .o({\u_vga/sub1/c1 ,\u_vga/n21 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vga/sub1/u1  (
    .a(\u_vga/vsyn_cnt [1]),
    .b(1'b1),
    .c(\u_vga/sub1/c1 ),
    .o({\u_vga/sub1/c2 ,\u_vga/n21 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vga/sub1/u10  (
    .a(\u_vga/vsyn_cnt [10]),
    .b(1'b0),
    .c(\u_vga/sub1/c10 ),
    .o({open_n1104,\u_vga/n21 [10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vga/sub1/u2  (
    .a(\u_vga/vsyn_cnt [2]),
    .b(1'b0),
    .c(\u_vga/sub1/c2 ),
    .o({\u_vga/sub1/c3 ,\u_vga/n21 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vga/sub1/u3  (
    .a(\u_vga/vsyn_cnt [3]),
    .b(1'b0),
    .c(\u_vga/sub1/c3 ),
    .o({\u_vga/sub1/c4 ,\u_vga/n21 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vga/sub1/u4  (
    .a(\u_vga/vsyn_cnt [4]),
    .b(1'b0),
    .c(\u_vga/sub1/c4 ),
    .o({\u_vga/sub1/c5 ,\u_vga/n21 [4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vga/sub1/u5  (
    .a(\u_vga/vsyn_cnt [5]),
    .b(1'b1),
    .c(\u_vga/sub1/c5 ),
    .o({\u_vga/sub1/c6 ,\u_vga/n21 [5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vga/sub1/u6  (
    .a(\u_vga/vsyn_cnt [6]),
    .b(1'b0),
    .c(\u_vga/sub1/c6 ),
    .o({\u_vga/sub1/c7 ,\u_vga/n21 [6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vga/sub1/u7  (
    .a(\u_vga/vsyn_cnt [7]),
    .b(1'b0),
    .c(\u_vga/sub1/c7 ),
    .o({\u_vga/sub1/c8 ,\u_vga/n21 [7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vga/sub1/u8  (
    .a(\u_vga/vsyn_cnt [8]),
    .b(1'b0),
    .c(\u_vga/sub1/c8 ),
    .o({\u_vga/sub1/c9 ,\u_vga/n21 [8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vga/sub1/u9  (
    .a(\u_vga/vsyn_cnt [9]),
    .b(1'b0),
    .c(\u_vga/sub1/c9 ),
    .o({\u_vga/sub1/c10 ,\u_vga/n21 [9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB_CARRY"))
    \u_vga/sub1/ucin  (
    .a(1'b0),
    .o({\u_vga/sub1/c0 ,open_n1107}));
  reg_ar_as_w1 \u_vga/vsyn_reg  (
    .clk(vga_clk_pad),
    .d(\u_vga/n10 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(vsyn));  // sources/rtl/vga/vga.v(97)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vram/add0/u0  (
    .a(\u_vram/n5 [1]),
    .b(\u_vram/mesh_x [1]),
    .c(\u_vram/add0/c0 ),
    .o({\u_vram/add0/c1 ,n1[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vram/add0/u1  (
    .a(\u_vram/n5 [2]),
    .b(\u_vram/mesh_x [2]),
    .c(\u_vram/add0/c1 ),
    .o({\u_vram/add0/c2 ,n1[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vram/add0/u2  (
    .a(\u_vram/n5 [3]),
    .b(\u_vram/mesh_x [3]),
    .c(\u_vram/add0/c2 ),
    .o({\u_vram/add0/c3 ,n1[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vram/add0/u3  (
    .a(\u_vram/n5 [4]),
    .b(\u_vram/mesh_x [4]),
    .c(\u_vram/add0/c3 ),
    .o({\u_vram/add0/c4 ,n1[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vram/add0/u4  (
    .a(\u_vram/n5 [5]),
    .b(1'b0),
    .c(\u_vram/add0/c4 ),
    .o({\u_vram/add0/c5 ,n1[4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vram/add0/u5  (
    .a(\u_vram/n5 [6]),
    .b(1'b0),
    .c(\u_vram/add0/c5 ),
    .o({\u_vram/add0/c6 ,n1[5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_vram/add0/u6  (
    .a(\u_vram/n5 [7]),
    .b(1'b0),
    .c(\u_vram/add0/c6 ),
    .o({open_n1108,n1[6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \u_vram/add0/ucin  (
    .a(1'b0),
    .o({\u_vram/add0/c0 ,open_n1111}));
  reg_ar_as_w1 \u_vram/axis_en_d0_reg  (
    .clk(vga_clk_pad),
    .d(axis_en),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_en_d0 ));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/axis_en_d1_reg  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_en_d0 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_en_d1 ));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/axis_en_d2_reg  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_en_d1 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_en_d2 ));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/hs_i_d0_reg  (
    .clk(vga_clk_pad),
    .d(hsyn),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/hs_i_d0 ));  // sources/rtl/vga/vram.v(123)
  reg_ar_as_w1 \u_vram/hs_i_d1_reg  (
    .clk(vga_clk_pad),
    .d(\u_vram/hs_i_d0 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/hs_i_d1 ));  // sources/rtl/vga/vram.v(123)
  reg_ar_as_w1 \u_vram/hs_i_d2_reg  (
    .clk(vga_clk_pad),
    .d(\u_vram/hs_i_d1 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/hs_i_d2 ));  // sources/rtl/vga/vram.v(123)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("J3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("INV"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    \u_vram/hs_o_reg_DO  (
    .ce(1'b1),
    .do({open_n1112,open_n1113,open_n1114,\u_vram/hs_i_d2 }),
    .osclk(vga_clk_pad),
    .opad(vga_hs));  // sources/rtl/vga/vram.v(152)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt0_0  (
    .a(\u_vram/axis_x_d2 [0]),
    .b(1'b0),
    .c(\u_vram/lt0_c0 ),
    .o({\u_vram/lt0_c1 ,open_n1127}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt0_1  (
    .a(\u_vram/axis_x_d2 [1]),
    .b(1'b0),
    .c(\u_vram/lt0_c1 ),
    .o({\u_vram/lt0_c2 ,open_n1128}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt0_10  (
    .a(\u_vram/axis_x_d2 [10]),
    .b(1'b0),
    .c(\u_vram/lt0_c10 ),
    .o({\u_vram/lt0_c11 ,open_n1129}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt0_2  (
    .a(\u_vram/axis_x_d2 [2]),
    .b(1'b0),
    .c(\u_vram/lt0_c2 ),
    .o({\u_vram/lt0_c3 ,open_n1130}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt0_3  (
    .a(\u_vram/axis_x_d2 [3]),
    .b(1'b0),
    .c(\u_vram/lt0_c3 ),
    .o({\u_vram/lt0_c4 ,open_n1131}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt0_4  (
    .a(\u_vram/axis_x_d2 [4]),
    .b(1'b0),
    .c(\u_vram/lt0_c4 ),
    .o({\u_vram/lt0_c5 ,open_n1132}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt0_5  (
    .a(\u_vram/axis_x_d2 [5]),
    .b(1'b1),
    .c(\u_vram/lt0_c5 ),
    .o({\u_vram/lt0_c6 ,open_n1133}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt0_6  (
    .a(\u_vram/axis_x_d2 [6]),
    .b(1'b0),
    .c(\u_vram/lt0_c6 ),
    .o({\u_vram/lt0_c7 ,open_n1134}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt0_7  (
    .a(\u_vram/axis_x_d2 [7]),
    .b(1'b0),
    .c(\u_vram/lt0_c7 ),
    .o({\u_vram/lt0_c8 ,open_n1135}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt0_8  (
    .a(\u_vram/axis_x_d2 [8]),
    .b(1'b0),
    .c(\u_vram/lt0_c8 ),
    .o({\u_vram/lt0_c9 ,open_n1136}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt0_9  (
    .a(\u_vram/axis_x_d2 [9]),
    .b(1'b0),
    .c(\u_vram/lt0_c9 ),
    .o({\u_vram/lt0_c10 ,open_n1137}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    \u_vram/lt0_cin  (
    .a(1'b0),
    .o({\u_vram/lt0_c0 ,open_n1140}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt0_cout  (
    .a(1'b0),
    .b(1'b1),
    .c(\u_vram/lt0_c11 ),
    .o({open_n1141,\u_vram/n9 }));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt1_0  (
    .a(1'b0),
    .b(\u_vram/axis_x_d2 [0]),
    .c(\u_vram/lt1_c0 ),
    .o({\u_vram/lt1_c1 ,open_n1142}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt1_1  (
    .a(1'b0),
    .b(\u_vram/axis_x_d2 [1]),
    .c(\u_vram/lt1_c1 ),
    .o({\u_vram/lt1_c2 ,open_n1143}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt1_10  (
    .a(1'b0),
    .b(\u_vram/axis_x_d2 [10]),
    .c(\u_vram/lt1_c10 ),
    .o({\u_vram/lt1_c11 ,open_n1144}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt1_2  (
    .a(1'b0),
    .b(\u_vram/axis_x_d2 [2]),
    .c(\u_vram/lt1_c2 ),
    .o({\u_vram/lt1_c3 ,open_n1145}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt1_3  (
    .a(1'b0),
    .b(\u_vram/axis_x_d2 [3]),
    .c(\u_vram/lt1_c3 ),
    .o({\u_vram/lt1_c4 ,open_n1146}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt1_4  (
    .a(1'b0),
    .b(\u_vram/axis_x_d2 [4]),
    .c(\u_vram/lt1_c4 ),
    .o({\u_vram/lt1_c5 ,open_n1147}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt1_5  (
    .a(1'b1),
    .b(\u_vram/axis_x_d2 [5]),
    .c(\u_vram/lt1_c5 ),
    .o({\u_vram/lt1_c6 ,open_n1148}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt1_6  (
    .a(1'b1),
    .b(\u_vram/axis_x_d2 [6]),
    .c(\u_vram/lt1_c6 ),
    .o({\u_vram/lt1_c7 ,open_n1149}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt1_7  (
    .a(1'b0),
    .b(\u_vram/axis_x_d2 [7]),
    .c(\u_vram/lt1_c7 ),
    .o({\u_vram/lt1_c8 ,open_n1150}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt1_8  (
    .a(1'b0),
    .b(\u_vram/axis_x_d2 [8]),
    .c(\u_vram/lt1_c8 ),
    .o({\u_vram/lt1_c9 ,open_n1151}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt1_9  (
    .a(1'b1),
    .b(\u_vram/axis_x_d2 [9]),
    .c(\u_vram/lt1_c9 ),
    .o({\u_vram/lt1_c10 ,open_n1152}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    \u_vram/lt1_cin  (
    .a(1'b0),
    .o({\u_vram/lt1_c0 ,open_n1155}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt1_cout  (
    .a(1'b0),
    .b(1'b1),
    .c(\u_vram/lt1_c11 ),
    .o({open_n1156,\u_vram/n10 }));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt2_0  (
    .a(\u_vram/axis_y_d2 [0]),
    .b(1'b0),
    .c(\u_vram/lt2_c0 ),
    .o({\u_vram/lt2_c1 ,open_n1157}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt2_1  (
    .a(\u_vram/axis_y_d2 [1]),
    .b(1'b0),
    .c(\u_vram/lt2_c1 ),
    .o({\u_vram/lt2_c2 ,open_n1158}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt2_10  (
    .a(\u_vram/axis_y_d2 [10]),
    .b(1'b0),
    .c(\u_vram/lt2_c10 ),
    .o({\u_vram/lt2_c11 ,open_n1159}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt2_2  (
    .a(\u_vram/axis_y_d2 [2]),
    .b(1'b0),
    .c(\u_vram/lt2_c2 ),
    .o({\u_vram/lt2_c3 ,open_n1160}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt2_3  (
    .a(\u_vram/axis_y_d2 [3]),
    .b(1'b0),
    .c(\u_vram/lt2_c3 ),
    .o({\u_vram/lt2_c4 ,open_n1161}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt2_4  (
    .a(\u_vram/axis_y_d2 [4]),
    .b(1'b0),
    .c(\u_vram/lt2_c4 ),
    .o({\u_vram/lt2_c5 ,open_n1162}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt2_5  (
    .a(\u_vram/axis_y_d2 [5]),
    .b(1'b1),
    .c(\u_vram/lt2_c5 ),
    .o({\u_vram/lt2_c6 ,open_n1163}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt2_6  (
    .a(\u_vram/axis_y_d2 [6]),
    .b(1'b0),
    .c(\u_vram/lt2_c6 ),
    .o({\u_vram/lt2_c7 ,open_n1164}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt2_7  (
    .a(\u_vram/axis_y_d2 [7]),
    .b(1'b0),
    .c(\u_vram/lt2_c7 ),
    .o({\u_vram/lt2_c8 ,open_n1165}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt2_8  (
    .a(\u_vram/axis_y_d2 [8]),
    .b(1'b0),
    .c(\u_vram/lt2_c8 ),
    .o({\u_vram/lt2_c9 ,open_n1166}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt2_9  (
    .a(\u_vram/axis_y_d2 [9]),
    .b(1'b0),
    .c(\u_vram/lt2_c9 ),
    .o({\u_vram/lt2_c10 ,open_n1167}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    \u_vram/lt2_cin  (
    .a(1'b0),
    .o({\u_vram/lt2_c0 ,open_n1170}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt2_cout  (
    .a(1'b0),
    .b(1'b1),
    .c(\u_vram/lt2_c11 ),
    .o({open_n1171,\u_vram/n12 }));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt3_0  (
    .a(1'b0),
    .b(\u_vram/axis_y_d2 [0]),
    .c(\u_vram/lt3_c0 ),
    .o({\u_vram/lt3_c1 ,open_n1172}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt3_1  (
    .a(1'b0),
    .b(\u_vram/axis_y_d2 [1]),
    .c(\u_vram/lt3_c1 ),
    .o({\u_vram/lt3_c2 ,open_n1173}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt3_10  (
    .a(1'b0),
    .b(\u_vram/axis_y_d2 [10]),
    .c(\u_vram/lt3_c10 ),
    .o({\u_vram/lt3_c11 ,open_n1174}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt3_2  (
    .a(1'b0),
    .b(\u_vram/axis_y_d2 [2]),
    .c(\u_vram/lt3_c2 ),
    .o({\u_vram/lt3_c3 ,open_n1175}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt3_3  (
    .a(1'b0),
    .b(\u_vram/axis_y_d2 [3]),
    .c(\u_vram/lt3_c3 ),
    .o({\u_vram/lt3_c4 ,open_n1176}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt3_4  (
    .a(1'b0),
    .b(\u_vram/axis_y_d2 [4]),
    .c(\u_vram/lt3_c4 ),
    .o({\u_vram/lt3_c5 ,open_n1177}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt3_5  (
    .a(1'b0),
    .b(\u_vram/axis_y_d2 [5]),
    .c(\u_vram/lt3_c5 ),
    .o({\u_vram/lt3_c6 ,open_n1178}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt3_6  (
    .a(1'b1),
    .b(\u_vram/axis_y_d2 [6]),
    .c(\u_vram/lt3_c6 ),
    .o({\u_vram/lt3_c7 ,open_n1179}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt3_7  (
    .a(1'b1),
    .b(\u_vram/axis_y_d2 [7]),
    .c(\u_vram/lt3_c7 ),
    .o({\u_vram/lt3_c8 ,open_n1180}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt3_8  (
    .a(1'b1),
    .b(\u_vram/axis_y_d2 [8]),
    .c(\u_vram/lt3_c8 ),
    .o({\u_vram/lt3_c9 ,open_n1181}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt3_9  (
    .a(1'b0),
    .b(\u_vram/axis_y_d2 [9]),
    .c(\u_vram/lt3_c9 ),
    .o({\u_vram/lt3_c10 ,open_n1182}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    \u_vram/lt3_cin  (
    .a(1'b0),
    .o({\u_vram/lt3_c0 ,open_n1185}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_vram/lt3_cout  (
    .a(1'b0),
    .b(1'b1),
    .c(\u_vram/lt3_c11 ),
    .o({open_n1186,\u_vram/n14 }));
  // address_offset=0;data_offset=0;depth=256;width=1;num_section=1;width_per_section=1;section_size=1;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEBMUX("1"),
    .CSA0("1"),
    .CSA1("1"),
    .CSA2("1"),
    .CSB0("1"),
    .CSB1("1"),
    .CSB2("1"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("1"),
    .OCEBMUX("1"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"),
    .RSTAMUX("0"),
    .RSTBMUX("0"),
    .WEAMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("READBEFOREWRITE"))
    \u_vram/ram_vga_ram0_256x1_sub_000000_000  (
    .addra({5'b00000,vram_addr}),
    .addrb({5'b00000,vram_addr}),
    .cea(vram_ren),
    .clka(vga_clk_pad),
    .clkb(vga_clk_pad),
    .dia({open_n1194,open_n1195,open_n1196,open_n1197,open_n1198,open_n1199,open_n1200,1'b0,open_n1201}),
    .dib({open_n1202,open_n1203,open_n1204,open_n1205,open_n1206,open_n1207,open_n1208,vram_wdata,open_n1209}),
    .web(vram_wen),
    .doa({open_n1215,open_n1216,open_n1217,open_n1218,open_n1219,open_n1220,open_n1221,open_n1222,vram_rdata}));
  // address_offset=0;data_offset=0;depth=256;width=1;num_section=1;width_per_section=1;section_size=1;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEAMUX("1"),
    .CEBMUX("1"),
    .CSA0("1"),
    .CSA1("1"),
    .CSA2("1"),
    .CSB0("1"),
    .CSB1("1"),
    .CSB2("1"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("1"),
    .OCEBMUX("1"),
    .REGMODE_A("OUTREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("0"),
    .RSTBMUX("0"),
    .WEAMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("READBEFOREWRITE"))
    \u_vram/ram_vga_ram1_256x1_sub_000000_000  (
    .addra({5'b00000,n1,\u_vram/mesh_x [0]}),
    .addrb({5'b00000,vram_addr}),
    .clka(vga_clk_pad),
    .clkb(vga_clk_pad),
    .dia({open_n1240,open_n1241,open_n1242,open_n1243,open_n1244,open_n1245,open_n1246,1'b0,open_n1247}),
    .dib({open_n1248,open_n1249,open_n1250,open_n1251,open_n1252,open_n1253,open_n1254,vram_wdata,open_n1255}),
    .web(vram_wen),
    .doa({open_n1261,open_n1262,open_n1263,open_n1264,open_n1265,open_n1266,open_n1267,open_n1268,\u_vram/state }));
  reg_ar_as_w1 \u_vram/reg0_b0  (
    .clk(vga_clk_pad),
    .d(\u_vram/n3 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/mesh_x [0]));  // sources/rtl/vga/vram.v(82)
  reg_ar_as_w1 \u_vram/reg0_b1  (
    .clk(vga_clk_pad),
    .d(\u_vram/n3 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/mesh_x [1]));  // sources/rtl/vga/vram.v(82)
  reg_ar_as_w1 \u_vram/reg0_b2  (
    .clk(vga_clk_pad),
    .d(\u_vram/n3 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/mesh_x [2]));  // sources/rtl/vga/vram.v(82)
  reg_ar_as_w1 \u_vram/reg0_b3  (
    .clk(vga_clk_pad),
    .d(\u_vram/n3 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/mesh_x [3]));  // sources/rtl/vga/vram.v(82)
  reg_ar_as_w1 \u_vram/reg0_b4  (
    .clk(vga_clk_pad),
    .d(\u_vram/n3 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/mesh_x [4]));  // sources/rtl/vga/vram.v(82)
  reg_ar_as_w1 \u_vram/reg3_b0  (
    .clk(vga_clk_pad),
    .d(axis_x[0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d0 [0]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg3_b1  (
    .clk(vga_clk_pad),
    .d(axis_x[1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d0 [1]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg3_b10  (
    .clk(vga_clk_pad),
    .d(axis_x[10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d0 [10]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg3_b2  (
    .clk(vga_clk_pad),
    .d(axis_x[2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d0 [2]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg3_b3  (
    .clk(vga_clk_pad),
    .d(axis_x[3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d0 [3]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg3_b4  (
    .clk(vga_clk_pad),
    .d(axis_x[4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d0 [4]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg3_b5  (
    .clk(vga_clk_pad),
    .d(axis_x[5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d0 [5]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg3_b6  (
    .clk(vga_clk_pad),
    .d(axis_x[6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d0 [6]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg3_b7  (
    .clk(vga_clk_pad),
    .d(axis_x[7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d0 [7]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg3_b8  (
    .clk(vga_clk_pad),
    .d(axis_x[8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d0 [8]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg3_b9  (
    .clk(vga_clk_pad),
    .d(axis_x[9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d0 [9]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg4_b0  (
    .clk(vga_clk_pad),
    .d(axis_y[0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d0 [0]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg4_b1  (
    .clk(vga_clk_pad),
    .d(axis_y[1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d0 [1]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg4_b10  (
    .clk(vga_clk_pad),
    .d(axis_y[10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d0 [10]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg4_b2  (
    .clk(vga_clk_pad),
    .d(axis_y[2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d0 [2]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg4_b3  (
    .clk(vga_clk_pad),
    .d(axis_y[3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d0 [3]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg4_b4  (
    .clk(vga_clk_pad),
    .d(axis_y[4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d0 [4]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg4_b5  (
    .clk(vga_clk_pad),
    .d(axis_y[5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d0 [5]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg4_b6  (
    .clk(vga_clk_pad),
    .d(axis_y[6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d0 [6]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg4_b7  (
    .clk(vga_clk_pad),
    .d(axis_y[7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d0 [7]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg4_b8  (
    .clk(vga_clk_pad),
    .d(axis_y[8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d0 [8]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg4_b9  (
    .clk(vga_clk_pad),
    .d(axis_y[9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d0 [9]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg5_b0  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_x_d0 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d1 [0]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg5_b1  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_x_d0 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d1 [1]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg5_b10  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_x_d0 [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d1 [10]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg5_b2  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_x_d0 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d1 [2]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg5_b3  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_x_d0 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d1 [3]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg5_b4  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_x_d0 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d1 [4]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg5_b5  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_x_d0 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d1 [5]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg5_b6  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_x_d0 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d1 [6]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg5_b7  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_x_d0 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d1 [7]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg5_b8  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_x_d0 [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d1 [8]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg5_b9  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_x_d0 [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d1 [9]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg6_b0  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_y_d0 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d1 [0]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg6_b1  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_y_d0 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d1 [1]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg6_b10  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_y_d0 [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d1 [10]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg6_b2  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_y_d0 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d1 [2]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg6_b3  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_y_d0 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d1 [3]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg6_b4  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_y_d0 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d1 [4]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg6_b5  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_y_d0 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d1 [5]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg6_b6  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_y_d0 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d1 [6]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg6_b7  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_y_d0 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d1 [7]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg6_b8  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_y_d0 [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d1 [8]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg6_b9  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_y_d0 [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d1 [9]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg7_b0  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_x_d1 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d2 [0]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg7_b1  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_x_d1 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d2 [1]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg7_b10  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_x_d1 [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d2 [10]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg7_b2  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_x_d1 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d2 [2]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg7_b3  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_x_d1 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d2 [3]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg7_b4  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_x_d1 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d2 [4]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg7_b5  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_x_d1 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d2 [5]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg7_b6  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_x_d1 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d2 [6]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg7_b7  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_x_d1 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d2 [7]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg7_b8  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_x_d1 [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d2 [8]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg7_b9  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_x_d1 [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_x_d2 [9]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg8_b0  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_y_d1 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d2 [0]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg8_b1  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_y_d1 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d2 [1]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg8_b10  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_y_d1 [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d2 [10]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg8_b2  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_y_d1 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d2 [2]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg8_b3  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_y_d1 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d2 [3]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg8_b4  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_y_d1 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d2 [4]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg8_b5  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_y_d1 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d2 [5]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg8_b6  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_y_d1 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d2 [6]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg8_b7  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_y_d1 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d2 [7]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg8_b8  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_y_d1 [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d2 [8]));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w1 \u_vram/reg8_b9  (
    .clk(vga_clk_pad),
    .d(\u_vram/axis_y_d1 [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/axis_y_d2 [9]));  // sources/rtl/vga/vram.v(110)
  reg_sr_as_w1 \u_vram/reg9_b10  (
    .clk(~vga_clk_pad),
    .d(\u_vram/n26 [10]),
    .en(1'b1),
    .reset(~\u_vram/mux3_b10_sel_is_3_o ),
    .set(1'b0),
    .q(vga_rgb_pad[19]));  // sources/rtl/vga/vram.v(144)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("J1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("INV"),
    .OUTSCLKMUX("INV"),
    .SRMODE("SYNC"),
    .TSMUX("0"))
    \u_vram/reg9_b11_DO  (
    .ce(1'b1),
    .do({open_n1278,open_n1279,open_n1280,\u_vram/n26[11]_d }),
    .osclk(vga_clk_pad),
    .rst(\u_vram/mux3_b10_sel_is_3_o ),
    .opad(vga_rgb[11]));  // sources/rtl/vga/vram.v(144)
  reg_sr_as_w1 \u_vram/reg9_b12  (
    .clk(~vga_clk_pad),
    .d(\u_vram/n26[10]_d ),
    .en(1'b1),
    .reset(~\u_vram/mux3_b12_sel_is_1_o ),
    .set(1'b0),
    .q(vga_rgb_pad[21]));  // sources/rtl/vga/vram.v(144)
  reg_sr_as_w1 \u_vram/reg9_b13  (
    .clk(~vga_clk_pad),
    .d(\u_vram/state_d ),
    .en(1'b1),
    .reset(~\u_vram/mux3_b12_sel_is_1_o ),
    .set(1'b0),
    .q(vga_rgb_pad[13]));  // sources/rtl/vga/vram.v(144)
  reg_sr_as_w1 \u_vram/reg9_b14  (
    .clk(~vga_clk_pad),
    .d(1'b1),
    .en(1'b1),
    .reset(~\u_vram/mux3_b14_sel_is_3_o ),
    .set(1'b0),
    .q(vga_rgb_pad[14]));  // sources/rtl/vga/vram.v(144)
  reg_sr_as_w1 \u_vram/reg9_b20  (
    .clk(~vga_clk_pad),
    .d(\u_vram/n26[11]_d ),
    .en(1'b1),
    .reset(~\u_vram/mux3_b12_sel_is_1_o ),
    .set(1'b0),
    .q(vga_rgb_pad[22]));  // sources/rtl/vga/vram.v(144)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vram/sub0/u0  (
    .a(axis_x[5]),
    .b(1'b1),
    .c(\u_vram/sub0/c0 ),
    .o({\u_vram/sub0/c1 ,\u_vram/n3 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vram/sub0/u1  (
    .a(axis_x[6]),
    .b(1'b0),
    .c(\u_vram/sub0/c1 ),
    .o({\u_vram/sub0/c2 ,\u_vram/n3 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vram/sub0/u2  (
    .a(axis_x[7]),
    .b(1'b0),
    .c(\u_vram/sub0/c2 ),
    .o({\u_vram/sub0/c3 ,\u_vram/n3 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vram/sub0/u3  (
    .a(axis_x[8]),
    .b(1'b0),
    .c(\u_vram/sub0/c3 ),
    .o({\u_vram/sub0/c4 ,\u_vram/n3 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vram/sub0/u4  (
    .a(axis_x[9]),
    .b(1'b0),
    .c(\u_vram/sub0/c4 ),
    .o({open_n1292,\u_vram/n3 [4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB_CARRY"))
    \u_vram/sub0/ucin  (
    .a(1'b0),
    .o({\u_vram/sub0/c0 ,open_n1295}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vram/sub1/u0  (
    .a(axis_y[5]),
    .b(1'b1),
    .c(\u_vram/sub1/c0 ),
    .o({\u_vram/sub1/c1 ,\u_vram/n4 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vram/sub1/u1  (
    .a(axis_y[6]),
    .b(1'b0),
    .c(\u_vram/sub1/c1 ),
    .o({\u_vram/sub1/c2 ,\u_vram/n4 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vram/sub1/u2  (
    .a(axis_y[7]),
    .b(1'b0),
    .c(\u_vram/sub1/c2 ),
    .o({\u_vram/sub1/c3 ,\u_vram/n4 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vram/sub1/u3  (
    .a(axis_y[8]),
    .b(1'b0),
    .c(\u_vram/sub1/c3 ),
    .o({\u_vram/sub1/c4 ,\u_vram/n4 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u_vram/sub1/u4  (
    .a(axis_y[9]),
    .b(1'b0),
    .c(\u_vram/sub1/c4 ),
    .o({open_n1296,\u_vram/n4 [4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB_CARRY"))
    \u_vram/sub1/ucin  (
    .a(1'b0),
    .o({\u_vram/sub1/c0 ,open_n1299}));
  reg_ar_as_w1 \u_vram/vs_i_d0_reg  (
    .clk(vga_clk_pad),
    .d(vsyn),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/vs_i_d0 ));  // sources/rtl/vga/vram.v(123)
  reg_ar_as_w1 \u_vram/vs_i_d1_reg  (
    .clk(vga_clk_pad),
    .d(\u_vram/vs_i_d0 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/vs_i_d1 ));  // sources/rtl/vga/vram.v(123)
  reg_ar_as_w1 \u_vram/vs_i_d2_reg  (
    .clk(vga_clk_pad),
    .d(\u_vram/vs_i_d1 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_vram/vs_i_d2 ));  // sources/rtl/vga/vram.v(123)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("J4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("INV"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    \u_vram/vs_o_reg_DO  (
    .ce(1'b1),
    .do({open_n1300,open_n1301,open_n1302,\u_vram/vs_i_d2 }),
    .osclk(vga_clk_pad),
    .opad(vga_vs));  // sources/rtl/vga/vram.v(152)

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

