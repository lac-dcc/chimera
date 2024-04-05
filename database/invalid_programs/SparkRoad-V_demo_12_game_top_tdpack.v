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
  wire [7:0] \u_cpu/u_alu/n4 ;
  wire [8:0] \u_cpu/u_alu/n5 ;
  wire [7:0] \u_cpu/u_alu/n56 ;
  wire [23:0] \u_cpu/u_debug/n13 ;
  wire [23:0] \u_cpu/u_debug/n7 ;
  wire [7:0] \u_cpu/u_decode/inst_d ;  // sources/rtl/mcu/decode.v(37)
  wire [7:0] \u_cpu/u_execute/C ;  // sources/rtl/mcu/execute.v(72)
  wire [15:0] \u_cpu/u_execute/n35 ;
  wire [15:0] \u_cpu/u_execute/n36 ;
  wire [7:0] \u_cpu/u_execute/n4 ;
  wire [7:0] \u_cpu/u_execute/n47 ;
  wire [7:0] \u_cpu/u_execute/n7 ;
  wire [7:0] \u_cpu/u_execute/rom_data ;  // sources/rtl/mcu/execute.v(74)
  wire [9:0] \u_cpu/u_execute/wt_ram_cmd ;  // sources/rtl/mcu/execute.v(130)
  wire [23:0] \u_cpu/u_fetch/n1 ;
  wire [23:0] \u_cpu/u_fetch/pc ;  // sources/rtl/mcu/fetch.v(51)
  wire [23:0] \u_cpu/u_timer/cnt ;  // sources/rtl/mcu/timer.v(33)
  wire [24:0] \u_cpu/u_timer/n1 ;
  wire [18:0] \u_key/cnt ;  // sources/rtl/key/key.v(34)
  wire [5:0] \u_key/key_d0 ;  // sources/rtl/key/key.v(35)
  wire [5:0] \u_key/key_d1 ;  // sources/rtl/key/key.v(36)
  wire [18:0] \u_key/n3 ;
  wire [7:0] \u_uart/rx_data ;  // sources/rtl/uart/uart.v(48)
  wire [7:0] \u_uart/tx_data ;  // sources/rtl/uart/uart.v(50)
  wire [31:0] \u_uart/u_uart_rx/clk_cnt ;  // sources/rtl/uart/uart_rx.v(43)
  wire [3:0] \u_uart/u_uart_rx/cnt ;  // sources/rtl/uart/uart_rx.v(40)
  wire [7:0] \u_uart/u_uart_rx/data ;  // sources/rtl/uart/uart_rx.v(41)
  wire [31:0] \u_uart/u_uart_rx/n7 ;
  wire [1:0] \u_uart/u_uart_rx/rx_d ;  // sources/rtl/uart/uart_rx.v(42)
  wire [31:0] \u_uart/u_uart_tx/clk_cnt ;  // sources/rtl/uart/uart_tx.v(43)
  wire [3:0] \u_uart/u_uart_tx/cnt ;  // sources/rtl/uart/uart_tx.v(41)
  wire [7:0] \u_uart/u_uart_tx/data ;  // sources/rtl/uart/uart_tx.v(42)
  wire [31:0] \u_uart/u_uart_tx/n1 ;
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
  wire [12:0] \u_vga/vsyn_cnt ;  // sources/rtl/vga/vga.v(58)
  wire [10:0] \u_vram/axis_x_d0 ;  // sources/rtl/vga/vram.v(59)
  wire [10:0] \u_vram/axis_x_d1 ;  // sources/rtl/vga/vram.v(62)
  wire [10:0] \u_vram/axis_x_d2 ;  // sources/rtl/vga/vram.v(65)
  wire [10:0] \u_vram/axis_y_d0 ;  // sources/rtl/vga/vram.v(60)
  wire [10:0] \u_vram/axis_y_d1 ;  // sources/rtl/vga/vram.v(63)
  wire [10:0] \u_vram/axis_y_d2 ;  // sources/rtl/vga/vram.v(66)
  wire [4:0] \u_vram/mesh_x ;  // sources/rtl/vga/vram.v(47)
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
  wire tx_pad;  // sources/rtl/top.v(28)
  wire \u_bus/eq0/or_or_or_xor_i0[0]_i_o ;
  wire \u_bus/mux0_b0_sel_is_3_o ;
  wire \u_bus/n1_lutinv ;
  wire \u_bus/n22 ;
  wire \u_bus/u6_sel_is_3_o ;
  wire \u_cpu/dbg_en ;  // sources/rtl/mcu/cpu.v(86)
  wire \u_cpu/dbg_info_en ;  // sources/rtl/mcu/cpu.v(92)
  wire \u_cpu/dbg_inst_en ;  // sources/rtl/mcu/cpu.v(90)
  wire \u_cpu/dbg_rom_ren ;  // sources/rtl/mcu/cpu.v(87)
  wire \u_cpu/inst_en ;  // sources/rtl/mcu/cpu.v(63)
  wire \u_cpu/pc_wen ;  // sources/rtl/mcu/cpu.v(61)
  wire \u_cpu/timer_state ;  // sources/rtl/mcu/cpu.v(73)
  wire \u_cpu/timer_wen ;  // sources/rtl/mcu/cpu.v(71)
  wire \u_cpu/u_alu/add0/c3 ;
  wire \u_cpu/u_alu/add0/c7 ;
  wire \u_cpu/u_alu/lt0_c1 ;
  wire \u_cpu/u_alu/lt0_c3 ;
  wire \u_cpu/u_alu/lt0_c5 ;
  wire \u_cpu/u_alu/lt0_c7 ;
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
  wire \u_cpu/u_alu/sub0/c1 ;
  wire \u_cpu/u_alu/sub0/c3 ;
  wire \u_cpu/u_alu/sub0/c5 ;
  wire \u_cpu/u_alu/sub0/c7 ;
  wire \u_cpu/u_debug/add0/c11 ;
  wire \u_cpu/u_debug/add0/c15 ;
  wire \u_cpu/u_debug/add0/c19 ;
  wire \u_cpu/u_debug/add0/c23 ;
  wire \u_cpu/u_debug/add0/c3 ;
  wire \u_cpu/u_debug/add0/c7 ;
  wire \u_cpu/u_debug/add1/c11 ;
  wire \u_cpu/u_debug/add1/c3 ;
  wire \u_cpu/u_debug/add1/c7 ;
  wire \u_cpu/u_debug/clear_rom_addr_cmd ;  // sources/rtl/mcu/debug.v(58)
  wire \u_cpu/u_debug/clear_rom_data_cmd ;  // sources/rtl/mcu/debug.v(59)
  wire \u_cpu/u_debug/debug_cmd ;  // sources/rtl/mcu/debug.v(57)
  wire \u_cpu/u_debug/free_run_cmd ;  // sources/rtl/mcu/debug.v(56)
  wire \u_cpu/u_debug/n5 ;
  wire \u_cpu/u_debug/rom_bk_en ;  // sources/rtl/mcu/debug.v(68)
  wire \u_cpu/u_debug/rom_ren_d0 ;  // sources/rtl/mcu/debug.v(66)
  wire \u_cpu/u_debug/rom_ren_d1 ;  // sources/rtl/mcu/debug.v(67)
  wire \u_cpu/u_decode/inst_data ;  // sources/rtl/mcu/decode.v(78)
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
  wire \u_cpu/u_fetch/add0/c11 ;
  wire \u_cpu/u_fetch/add0/c3 ;
  wire \u_cpu/u_fetch/add0/c7 ;
  wire \u_cpu/u_fetch/fetch_en ;  // sources/rtl/mcu/fetch.v(52)
  wire \u_cpu/u_fetch/rom_bk_en ;  // sources/rtl/mcu/fetch.v(53)
  wire \u_cpu/u_timer/n4 ;
  wire \u_cpu/u_timer/sub0/c11 ;
  wire \u_cpu/u_timer/sub0/c15 ;
  wire \u_cpu/u_timer/sub0/c19 ;
  wire \u_cpu/u_timer/sub0/c23 ;
  wire \u_cpu/u_timer/sub0/c3 ;
  wire \u_cpu/u_timer/sub0/c7 ;
  wire \u_key/add0/c11 ;
  wire \u_key/add0/c15 ;
  wire \u_key/add0/c3 ;
  wire \u_key/add0/c7 ;
  wire \u_key/key_flag ;  // sources/rtl/key/key.v(37)
  wire \u_key/n14 ;
  wire \u_key/n23_lutinv ;
  wire \u_pll/clk0_buf ;  // al_ip/pll.v(28)
  wire \u_ram/n4 ;
  wire \u_rom/n4 ;
  wire \u_uart/rx_en ;  // sources/rtl/uart/uart.v(47)
  wire \u_uart/tx_en ;  // sources/rtl/uart/uart.v(49)
  wire \u_uart/tx_ready ;  // sources/rtl/uart/uart.v(51)
  wire \u_uart/u_uart_rx/add0/c11 ;
  wire \u_uart/u_uart_rx/add0/c15 ;
  wire \u_uart/u_uart_rx/add0/c19 ;
  wire \u_uart/u_uart_rx/add0/c23 ;
  wire \u_uart/u_uart_rx/add0/c27 ;
  wire \u_uart/u_uart_rx/add0/c3 ;
  wire \u_uart/u_uart_rx/add0/c31 ;
  wire \u_uart/u_uart_rx/add0/c7 ;
  wire \u_uart/u_uart_rx/add1/c1 ;
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
  wire \u_uart/u_uart_rx/n5 ;
  wire \u_uart/u_uart_rx/start ;  // sources/rtl/uart/uart_rx.v(38)
  wire \u_uart/u_uart_tx/add0/c11 ;
  wire \u_uart/u_uart_tx/add0/c15 ;
  wire \u_uart/u_uart_tx/add0/c19 ;
  wire \u_uart/u_uart_tx/add0/c23 ;
  wire \u_uart/u_uart_tx/add0/c27 ;
  wire \u_uart/u_uart_tx/add0/c3 ;
  wire \u_uart/u_uart_tx/add0/c31 ;
  wire \u_uart/u_uart_tx/add0/c7 ;
  wire \u_uart/u_uart_tx/add1/c1 ;
  wire \u_uart/u_uart_tx/add1/c3 ;
  wire \u_uart/u_uart_tx/clk_en ;  // sources/rtl/uart/uart_tx.v(40)
  wire \u_uart/u_uart_tx/mux1_b0_sel_is_1_o ;
  wire \u_uart/u_uart_tx/n0 ;
  wire \u_uart/u_uart_tx/n4 ;
  wire \u_uart/u_uart_tx/n8 ;
  wire \u_uart/u_uart_tx/start ;  // sources/rtl/uart/uart_tx.v(39)
  wire \u_uart/u_ubus/add1/c1 ;
  wire \u_uart/u_ubus/add1/c3 ;
  wire \u_uart/u_ubus/frame_head_flag ;  // sources/rtl/uart/ubus.v(71)
  wire \u_uart/u_ubus/frame_head_flag0 ;  // sources/rtl/uart/ubus.v(65)
  wire \u_uart/u_ubus/frame_head_flag1 ;  // sources/rtl/uart/ubus.v(66)
  wire \u_uart/u_ubus/frame_head_flag2 ;  // sources/rtl/uart/ubus.v(67)
  wire \u_uart/u_ubus/frame_head_flag3 ;  // sources/rtl/uart/ubus.v(68)
  wire \u_uart/u_ubus/frame_head_flag4 ;  // sources/rtl/uart/ubus.v(69)
  wire \u_uart/u_ubus/frame_head_flag5 ;  // sources/rtl/uart/ubus.v(70)
  wire \u_uart/u_ubus/n42 ;
  wire \u_uart/u_ubus/rx_en_d ;  // sources/rtl/uart/ubus.v(56)
  wire \u_uart/u_ubus/send_finish ;  // sources/rtl/uart/ubus.v(73)
  wire \u_uart/u_ubus/send_flag ;  // sources/rtl/uart/ubus.v(75)
  wire \u_uart/u_ubus/send_start ;  // sources/rtl/uart/ubus.v(72)
  wire \u_uart/u_ubus/tx_ready_flag ;  // sources/rtl/uart/ubus.v(78)
  wire \u_vga/add0/c11 ;
  wire \u_vga/add0/c3 ;
  wire \u_vga/add0/c7 ;
  wire \u_vga/add1/c11 ;
  wire \u_vga/add1/c3 ;
  wire \u_vga/add1/c7 ;
  wire \u_vga/lt0_c1 ;
  wire \u_vga/lt0_c11 ;
  wire \u_vga/lt0_c13 ;
  wire \u_vga/lt0_c3 ;
  wire \u_vga/lt0_c5 ;
  wire \u_vga/lt0_c7 ;
  wire \u_vga/lt0_c9 ;
  wire \u_vga/lt1_c1 ;
  wire \u_vga/lt1_c11 ;
  wire \u_vga/lt1_c13 ;
  wire \u_vga/lt1_c3 ;
  wire \u_vga/lt1_c5 ;
  wire \u_vga/lt1_c7 ;
  wire \u_vga/lt1_c9 ;
  wire \u_vga/lt2_c1 ;
  wire \u_vga/lt2_c11 ;
  wire \u_vga/lt2_c13 ;
  wire \u_vga/lt2_c3 ;
  wire \u_vga/lt2_c5 ;
  wire \u_vga/lt2_c7 ;
  wire \u_vga/lt2_c9 ;
  wire \u_vga/lt3_c1 ;
  wire \u_vga/lt3_c11 ;
  wire \u_vga/lt3_c13 ;
  wire \u_vga/lt3_c3 ;
  wire \u_vga/lt3_c5 ;
  wire \u_vga/lt3_c7 ;
  wire \u_vga/lt3_c9 ;
  wire \u_vga/lt4_c1 ;
  wire \u_vga/lt4_c11 ;
  wire \u_vga/lt4_c13 ;
  wire \u_vga/lt4_c3 ;
  wire \u_vga/lt4_c5 ;
  wire \u_vga/lt4_c7 ;
  wire \u_vga/lt4_c9 ;
  wire \u_vga/lt5_c1 ;
  wire \u_vga/lt5_c11 ;
  wire \u_vga/lt5_c13 ;
  wire \u_vga/lt5_c3 ;
  wire \u_vga/lt5_c5 ;
  wire \u_vga/lt5_c7 ;
  wire \u_vga/lt5_c9 ;
  wire \u_vga/mux4_b0_sel_is_3_o ;
  wire \u_vga/n0 ;
  wire \u_vga/n11 ;
  wire \u_vga/n12 ;
  wire \u_vga/n13 ;
  wire \u_vga/n14 ;
  wire \u_vga/n15 ;
  wire \u_vga/n16 ;
  wire \u_vga/n3_lutinv ;
  wire \u_vga/n7 ;
  wire \u_vga/n9 ;
  wire \u_vga/sub0/c1 ;
  wire \u_vga/sub0/c3 ;
  wire \u_vga/sub0/c5 ;
  wire \u_vga/sub1/c3 ;
  wire \u_vga/sub1/c7 ;
  wire \u_vram/add0/c1 ;
  wire \u_vram/add0/c3 ;
  wire \u_vram/add0/c5 ;
  wire \u_vram/axis_en_d0 ;  // sources/rtl/vga/vram.v(58)
  wire \u_vram/axis_en_d1 ;  // sources/rtl/vga/vram.v(61)
  wire \u_vram/axis_en_d2 ;  // sources/rtl/vga/vram.v(64)
  wire \u_vram/hs_i_d0 ;  // sources/rtl/vga/vram.v(52)
  wire \u_vram/hs_i_d1 ;  // sources/rtl/vga/vram.v(54)
  wire \u_vram/hs_i_d2 ;  // sources/rtl/vga/vram.v(56)
  wire \u_vram/lt0_c1 ;
  wire \u_vram/lt0_c11 ;
  wire \u_vram/lt0_c3 ;
  wire \u_vram/lt0_c5 ;
  wire \u_vram/lt0_c7 ;
  wire \u_vram/lt0_c9 ;
  wire \u_vram/lt1_c1 ;
  wire \u_vram/lt1_c11 ;
  wire \u_vram/lt1_c3 ;
  wire \u_vram/lt1_c5 ;
  wire \u_vram/lt1_c7 ;
  wire \u_vram/lt1_c9 ;
  wire \u_vram/lt2_c1 ;
  wire \u_vram/lt2_c11 ;
  wire \u_vram/lt2_c3 ;
  wire \u_vram/lt2_c5 ;
  wire \u_vram/lt2_c7 ;
  wire \u_vram/lt2_c9 ;
  wire \u_vram/lt3_c1 ;
  wire \u_vram/lt3_c11 ;
  wire \u_vram/lt3_c3 ;
  wire \u_vram/lt3_c5 ;
  wire \u_vram/lt3_c7 ;
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
  wire \u_vram/n26[11]_d ;
  wire \u_vram/n9 ;
  wire \u_vram/state ;  // sources/rtl/vga/vram.v(46)
  wire \u_vram/sub0/c1 ;
  wire \u_vram/sub0/c3 ;
  wire \u_vram/sub1/c1 ;
  wire \u_vram/sub1/c3 ;
  wire \u_vram/vs_i_d0 ;  // sources/rtl/vga/vram.v(53)
  wire \u_vram/vs_i_d1 ;  // sources/rtl/vga/vram.v(55)
  wire \u_vram/vs_i_d2 ;  // sources/rtl/vga/vram.v(57)
  wire vga_clk_pad;  // sources/rtl/top.v(31)
  wire vram_rdata;  // sources/rtl/top.v(91)
  wire vram_ren;  // sources/rtl/top.v(90)
  wire vram_wdata;  // sources/rtl/top.v(89)
  wire vram_wen;  // sources/rtl/top.v(88)
  wire vsyn;  // sources/rtl/top.v(78)

  // sources/rtl/mcu/execute.v(287)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(~C*~B))"),
    //.LUT1("(~B*~(C*D))"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011111100),
    .INIT_LUT1(16'b0000001100110011),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u1000|u_cpu/u_execute/reg4_b2  (
    .b({\u_cpu/u_execute/wt_ram_cmd [1],\u_cpu/u_execute/ram_to_c_wen }),
    .c({\u_cpu/u_execute/wt_ram_cmd [2],\u_cpu/u_execute/C [2]}),
    .ce(\u_bus/eq0/or_or_or_xor_i0[0]_i_o ),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/C [2],\u_cpu/u_execute/bus_to_c_wen }),
    .mi({open_n12,\u_cpu/u_execute/C [2]}),
    .f({_al_u1000_o,_al_u889_o}),
    .q({open_n17,\u_cpu/pc_wdata [2]}));  // sources/rtl/mcu/execute.v(287)
  // sources/rtl/mcu/execute.v(391)
  EG_PHY_LSLICE #(
    //.LUTF0("((~B*~A)*~(C)*~(D)+(~B*~A)*C*~(D)+~((~B*~A))*C*D+(~B*~A)*C*D)"),
    //.LUTF1("(C*~(B*~(~D*~A)))"),
    //.LUTG0("((~B*~A)*~(C)*~(D)+(~B*~A)*C*~(D)+~((~B*~A))*C*D+(~B*~A)*C*D)"),
    //.LUTG1("(C*~(B*~(~D*~A)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000010001),
    .INIT_LUTF1(16'b0011000001110000),
    .INIT_LUTG0(16'b1111000000010001),
    .INIT_LUTG1(16'b0011000001110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u1001|u_cpu/u_execute/reg10_b2  (
    .a({\u_cpu/u_execute/n47 [2],_al_u1001_o}),
    .b({_al_u999_o,_al_u1002_o}),
    .c({_al_u1000_o,bus_wdata[2]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/wt_ram_cmd [4],\u_cpu/u_execute/wt_ram_cmd [0]}),
    .f({_al_u1001_o,open_n36}),
    .q({open_n40,ram_wdata[2]}));  // sources/rtl/mcu/execute.v(391)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*~D)"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"))
    \_al_u1002|_al_u1012  (
    .c({\u_cpu/u_execute/wt_ram_cmd [1],\u_cpu/u_execute/wt_ram_cmd [1]}),
    .d(\u_cpu/alu_in2 [2:1]),
    .f({_al_u1002_o,_al_u1012_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*~(D*~A))"),
    //.LUT1("(~C*~(B*~(A)*~(D)+B*A*~(D)+~(B)*A*D+B*A*D))"),
    .INIT_LUT0(16'b0000001000000011),
    .INIT_LUT1(16'b0000010100000011),
    .MODE("LOGIC"))
    \_al_u1004|_al_u1015  (
    .a({\u_cpu/alu_out4 [1],\u_cpu/alu_out3 [0]}),
    .b({ram_wdata[1],\u_cpu/u_execute/wt_ram_cmd [6]}),
    .c(\u_cpu/u_execute/wt_ram_cmd [8:7]),
    .d(\u_cpu/u_execute/wt_ram_cmd [9:8]),
    .f({_al_u1004_o,_al_u1015_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*~(D*~A))"),
    //.LUTF1("(~C*~B*~(D*~A))"),
    //.LUTG0("(~C*~B*~(D*~A))"),
    //.LUTG1("(~C*~B*~(D*~A))"),
    .INIT_LUTF0(16'b0000001000000011),
    .INIT_LUTF1(16'b0000001000000011),
    .INIT_LUTG0(16'b0000001000000011),
    .INIT_LUTG1(16'b0000001000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u1005|_al_u945  (
    .a({\u_cpu/alu_out3 [1],\u_cpu/alu_out3 [7]}),
    .b({\u_cpu/u_execute/wt_ram_cmd [6],\u_cpu/u_execute/wt_ram_cmd [6]}),
    .c({\u_cpu/u_execute/wt_ram_cmd [7],\u_cpu/u_execute/wt_ram_cmd [7]}),
    .d({\u_cpu/u_execute/wt_ram_cmd [8],\u_cpu/u_execute/wt_ram_cmd [8]}),
    .f({_al_u1005_o,_al_u945_o}));
  // sources/rtl/mcu/alu.v(53)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(~D*~(C*~(B*~A)))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000001001111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u1008|u_cpu/u_alu/reg0_b9  (
    .a({_al_u1004_o,open_n109}),
    .b({_al_u1005_o,open_n110}),
    .c({_al_u1006_o,\u_cpu/u_execute/wt_ram_cmd [5]}),
    .ce(\u_cpu/alu_cmd [2]),
    .clk(vga_clk_pad),
    .d({_al_u1007_o,\u_cpu/alu_out1 [9]}),
    .mi({open_n121,\u_cpu/u_alu/n17 [9]}),
    .f({\u_cpu/u_execute/n47 [1],_al_u1007_o}),
    .q({open_n126,\u_cpu/alu_out1 [9]}));  // sources/rtl/mcu/alu.v(53)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*~(D*~A))"),
    //.LUT1("(~C*~B*~(D*~A))"),
    .INIT_LUT0(16'b0000001000000011),
    .INIT_LUT1(16'b0000001000000011),
    .MODE("LOGIC"))
    \_al_u1009|_al_u979  (
    .a({\u_cpu/alu_out0 [1],\u_cpu/alu_out0 [4]}),
    .b({\u_cpu/u_execute/wt_ram_cmd [2],\u_cpu/u_execute/wt_ram_cmd [2]}),
    .c({\u_cpu/u_execute/wt_ram_cmd [3],\u_cpu/u_execute/wt_ram_cmd [3]}),
    .d({\u_cpu/u_execute/wt_ram_cmd [4],\u_cpu/u_execute/wt_ram_cmd [4]}),
    .f({_al_u1009_o,_al_u979_o}));
  // sources/rtl/mcu/execute.v(287)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~A*~(~C*~B))"),
    //.LUT1("(~B*~(C*D))"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000001010100),
    .INIT_LUT1(16'b0000001100110011),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u1010|u_cpu/u_execute/reg4_b1  (
    .a({open_n147,\u_cpu/u_execute/bus_to_c_wen }),
    .b({\u_cpu/u_execute/wt_ram_cmd [1],\u_cpu/u_execute/ram_to_c_wen }),
    .c({\u_cpu/u_execute/wt_ram_cmd [2],\u_cpu/u_execute/C [1]}),
    .ce(\u_bus/eq0/or_or_or_xor_i0[0]_i_o ),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/C [1],\u_cpu/u_execute/rom_to_c_wen }),
    .mi({open_n158,\u_cpu/u_execute/C [1]}),
    .f({_al_u1010_o,_al_u909_o}),
    .q({open_n163,\u_cpu/pc_wdata [1]}));  // sources/rtl/mcu/execute.v(287)
  // sources/rtl/mcu/execute.v(391)
  EG_PHY_MSLICE #(
    //.LUT0("((~B*~A)*~(C)*~(D)+(~B*~A)*C*~(D)+~((~B*~A))*C*D+(~B*~A)*C*D)"),
    //.LUT1("(C*~(B*~(~D*~A)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000000010001),
    .INIT_LUT1(16'b0011000001110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u1011|u_cpu/u_execute/reg10_b1  (
    .a({\u_cpu/u_execute/n47 [1],_al_u1011_o}),
    .b({_al_u1009_o,_al_u1012_o}),
    .c({_al_u1010_o,bus_wdata[1]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/wt_ram_cmd [4],\u_cpu/u_execute/wt_ram_cmd [0]}),
    .f({_al_u1011_o,open_n178}),
    .q({open_n182,ram_wdata[1]}));  // sources/rtl/mcu/execute.v(391)
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTF1("(~C*~(B*~(A)*~(D)+B*A*~(D)+~(B)*A*D+B*A*D))"),
    //.LUTG0("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTG1("(~C*~(B*~(A)*~(D)+B*A*~(D)+~(B)*A*D+B*A*D))"),
    .INIT_LUTF0(16'b0000100001001100),
    .INIT_LUTF1(16'b0000010100000011),
    .INIT_LUTG0(16'b0000100001001100),
    .INIT_LUTG1(16'b0000010100000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u1014|_al_u927  (
    .a({\u_cpu/alu_out4 [0],\u_cpu/u_execute/n0_lutinv }),
    .b({ram_wdata[0],\u_cpu/u_execute/ram_to_b_wen }),
    .c({\u_cpu/u_execute/wt_ram_cmd [8],ram_wdata[0]}),
    .d({\u_cpu/u_execute/wt_ram_cmd [9],ram_rdata[0]}),
    .f({_al_u1014_o,_al_u927_o}));
  // sources/rtl/mcu/alu.v(53)
  EG_PHY_MSLICE #(
    //.LUT0("~((D*B)*~(A)*~(C)+(D*B)*A*~(C)+~((D*B))*A*C+(D*B)*A*C)"),
    //.LUT1("(~D*~(C*~(B*~A)))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0101001101011111),
    .INIT_LUT1(16'b0000000001001111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u1017|u_cpu/u_alu/reg0_b0  (
    .a({_al_u1014_o,\u_cpu/alu_out1 [0]}),
    .b({_al_u1015_o,\u_cpu/alu_out2 [0]}),
    .c({_al_u1016_o,\u_cpu/u_execute/wt_ram_cmd [6]}),
    .ce(\u_cpu/alu_cmd [2]),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/wt_ram_cmd [5],\u_cpu/u_execute/wt_ram_cmd [7]}),
    .mi({open_n217,\u_cpu/u_alu/n17 [0]}),
    .f({_al_u1017_o,_al_u1016_o}),
    .q({open_n222,\u_cpu/alu_out1 [0]}));  // sources/rtl/mcu/alu.v(53)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*~(D*~A))"),
    //.LUT1("(~B*~(C*D))"),
    .INIT_LUT0(16'b0000001000000011),
    .INIT_LUT1(16'b0000001100110011),
    .MODE("LOGIC"))
    \_al_u1020|_al_u959  (
    .a({open_n223,\u_cpu/alu_out0 [6]}),
    .b({\u_cpu/u_execute/wt_ram_cmd [2],\u_cpu/u_execute/wt_ram_cmd [2]}),
    .c({\u_cpu/u_execute/wt_ram_cmd [3],\u_cpu/u_execute/wt_ram_cmd [3]}),
    .d({\u_cpu/alu_out0 [8],\u_cpu/u_execute/wt_ram_cmd [4]}),
    .f({_al_u1020_o,_al_u959_o}));
  // sources/rtl/mcu/alu.v(53)
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(C*D))"),
    //.LUT1("(D*~(C*~(B*~A)))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000001100110011),
    .INIT_LUT1(16'b0100111100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u1021|u_cpu/u_alu/reg0_b8  (
    .a({_al_u1017_o,open_n244}),
    .b({_al_u1018_o,\u_cpu/u_execute/wt_ram_cmd [4]}),
    .c({_al_u1019_o,\u_cpu/u_execute/wt_ram_cmd [5]}),
    .ce(\u_cpu/alu_cmd [2]),
    .clk(vga_clk_pad),
    .d({_al_u1020_o,\u_cpu/alu_out1 [8]}),
    .mi({open_n255,\u_cpu/u_alu/n17 [8]}),
    .f({_al_u1021_o,_al_u1018_o}),
    .q({open_n260,\u_cpu/alu_out1 [8]}));  // sources/rtl/mcu/alu.v(53)
  // sources/rtl/vga/vram.v(144)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*~D))"),
    //.LUTF1("(C*~B*~D)"),
    //.LUTG0("(C*~(~B*~D))"),
    //.LUTG1("(C*~B*~D)"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000011000000),
    .INIT_LUTF1(16'b0000000000110000),
    .INIT_LUTG0(16'b1111000011000000),
    .INIT_LUTG1(16'b0000000000110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u1031|u_vram/reg9_b14  (
    .b({\u_vram/n18_lutinv ,\u_vram/n18_lutinv }),
    .c({\u_vram/mux3_b12_sel_is_1_o ,\u_vram/mux3_b12_sel_is_1_o }),
    .clk(vga_clk_pad),
    .d({_al_u1026_o,_al_u1026_o}),
    .mi({open_n267,1'b1}),
    .sr(\u_vram/mux3_b14_sel_is_3_o ),
    .f({\u_vram/mux3_b10_sel_is_3_o ,\u_vram/mux3_b14_sel_is_3_o }),
    .q({open_n282,vga_rgb_pad[14]}));  // sources/rtl/vga/vram.v(144)
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
    .do({open_n403,open_n404,open_n405,led_pad}),
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
    .do({open_n437,open_n438,open_n439,tx_pad}),
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
    .do({open_n454,open_n455,open_n456,vga_clk_pad}),
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
    .do({open_n471,open_n472,open_n473,vga_rgb_pad[14]}),
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
    .do({open_n488,open_n489,open_n490,vga_rgb_pad[22]}),
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
    .do({open_n505,open_n506,open_n507,vga_rgb_pad[21]}),
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
    .do({open_n522,open_n523,open_n524,vga_rgb_pad[22]}),
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
    .do({open_n539,open_n540,open_n541,vga_rgb_pad[19]}),
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
    .do({open_n556,open_n557,open_n558,1'b0}),
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
    .do({open_n573,open_n574,open_n575,1'b0}),
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
    .do({open_n590,open_n591,open_n592,1'b0}),
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
    .do({open_n607,open_n608,open_n609,vga_rgb_pad[21]}),
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
    .do({open_n624,open_n625,open_n626,vga_rgb_pad[14]}),
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
    .do({open_n641,open_n642,open_n643,vga_rgb_pad[13]}),
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
    .do({open_n658,open_n659,open_n660,vga_rgb_pad[21]}),
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
    .do({open_n675,open_n676,open_n677,vga_rgb_pad[19]}),
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
    .do({open_n692,open_n693,open_n694,1'b0}),
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
    .do({open_n709,open_n710,open_n711,1'b0}),
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
    .do({open_n726,open_n727,open_n728,1'b0}),
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
    .do({open_n743,open_n744,open_n745,vga_rgb_pad[13]}),
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
    .do({open_n760,open_n761,open_n762,vga_rgb_pad[14]}),
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
    .do({open_n777,open_n778,open_n779,vga_rgb_pad[13]}),
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
    .do({open_n794,open_n795,open_n796,vga_rgb_pad[14]}),
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
    .do({open_n811,open_n812,open_n813,1'b0}),
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
    .do({open_n828,open_n829,open_n830,1'b0}),
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
    .do({open_n845,open_n846,open_n847,1'b0}),
    .opad(vga_rgb[0]));  // sources/rtl/top.v(34)
  // sources/rtl/mcu/alu.v(46)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~C*~(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0000001100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u289|u_cpu/u_alu/reg4_b8  (
    .a({\u_cpu/alu_out0 [8],open_n861}),
    .b({\u_cpu/u_alu/n5 [8],\u_cpu/u_alu/n3 }),
    .c({\u_cpu/alu_cmd [0],\u_cpu/alu_cmd [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_cmd [1],_al_u289_o}),
    .f({_al_u289_o,open_n876}),
    .q({open_n880,\u_cpu/alu_out0 [8]}));  // sources/rtl/mcu/alu.v(46)
  // sources/rtl/mcu/alu.v(46)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~C*~(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0000001100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u291|u_cpu/u_alu/reg4_b7  (
    .a({\u_cpu/alu_out0 [7],open_n881}),
    .b({\u_cpu/u_alu/n5 [7],\u_cpu/u_alu/n4 [7]}),
    .c({\u_cpu/alu_cmd [0],\u_cpu/alu_cmd [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_cmd [1],_al_u291_o}),
    .f({_al_u291_o,open_n896}),
    .q({open_n900,\u_cpu/alu_out0 [7]}));  // sources/rtl/mcu/alu.v(46)
  // sources/rtl/mcu/alu.v(46)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~C*~(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~C*~(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0000001100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0000001100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u293|u_cpu/u_alu/reg4_b6  (
    .a({\u_cpu/alu_out0 [6],open_n901}),
    .b({\u_cpu/u_alu/n5 [6],\u_cpu/u_alu/n4 [6]}),
    .c({\u_cpu/alu_cmd [0],\u_cpu/alu_cmd [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_cmd [1],_al_u293_o}),
    .f({_al_u293_o,open_n920}),
    .q({open_n924,\u_cpu/alu_out0 [6]}));  // sources/rtl/mcu/alu.v(46)
  // sources/rtl/mcu/alu.v(46)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~C*~(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~C*~(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0000001100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0000001100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u295|u_cpu/u_alu/reg4_b5  (
    .a({\u_cpu/alu_out0 [5],open_n925}),
    .b({\u_cpu/u_alu/n5 [5],\u_cpu/u_alu/n4 [5]}),
    .c({\u_cpu/alu_cmd [0],\u_cpu/alu_cmd [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_cmd [1],_al_u295_o}),
    .f({_al_u295_o,open_n944}),
    .q({open_n948,\u_cpu/alu_out0 [5]}));  // sources/rtl/mcu/alu.v(46)
  // sources/rtl/mcu/alu.v(46)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~C*~(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0000001100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u297|u_cpu/u_alu/reg4_b4  (
    .a({\u_cpu/alu_out0 [4],open_n949}),
    .b({\u_cpu/u_alu/n5 [4],\u_cpu/u_alu/n4 [4]}),
    .c({\u_cpu/alu_cmd [0],\u_cpu/alu_cmd [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_cmd [1],_al_u297_o}),
    .f({_al_u297_o,open_n964}),
    .q({open_n968,\u_cpu/alu_out0 [4]}));  // sources/rtl/mcu/alu.v(46)
  // sources/rtl/mcu/alu.v(46)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~C*~(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0000001100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u299|u_cpu/u_alu/reg4_b3  (
    .a({\u_cpu/alu_out0 [3],open_n969}),
    .b({\u_cpu/u_alu/n5 [3],\u_cpu/u_alu/n4 [3]}),
    .c({\u_cpu/alu_cmd [0],\u_cpu/alu_cmd [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_cmd [1],_al_u299_o}),
    .f({_al_u299_o,open_n984}),
    .q({open_n988,\u_cpu/alu_out0 [3]}));  // sources/rtl/mcu/alu.v(46)
  // sources/rtl/mcu/alu.v(46)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~C*~(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~C*~(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0000001100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0000001100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u301|u_cpu/u_alu/reg4_b2  (
    .a({\u_cpu/alu_out0 [2],open_n989}),
    .b({\u_cpu/u_alu/n5 [2],\u_cpu/u_alu/n4 [2]}),
    .c({\u_cpu/alu_cmd [0],\u_cpu/alu_cmd [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_cmd [1],_al_u301_o}),
    .f({_al_u301_o,open_n1008}),
    .q({open_n1012,\u_cpu/alu_out0 [2]}));  // sources/rtl/mcu/alu.v(46)
  // sources/rtl/mcu/debug.v(92)
  EG_PHY_MSLICE #(
    //.LUT0("~(~C*~D)"),
    //.LUT1("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111111111110000),
    .INIT_LUT1(16'b0001000000010101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u307|u_cpu/u_debug/dbg_en_reg  (
    .a({\u_cpu/pc_wen ,open_n1013}),
    .b({\u_cpu/u_fetch/n1 [0],open_n1014}),
    .c({\u_cpu/u_fetch/fetch_en ,\u_cpu/dbg_en }),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_fetch/pc [0],\u_cpu/u_debug/debug_cmd }),
    .sr(\u_cpu/u_debug/free_run_cmd ),
    .f({_al_u307_o,open_n1028}),
    .q({open_n1032,\u_cpu/dbg_en }));  // sources/rtl/mcu/debug.v(92)
  // sources/rtl/mcu/fetch.v(75)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(~C*B))"),
    //.LUT1("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110011),
    .INIT_LUT1(16'b0001000000010101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u309|u_cpu/u_fetch/reg0_b1  (
    .a({\u_cpu/pc_wen ,open_n1033}),
    .b({\u_cpu/u_fetch/n1 [1],\u_cpu/pc_wen }),
    .c({\u_cpu/u_fetch/fetch_en ,\u_cpu/pc_wdata [1]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_fetch/pc [1],_al_u309_o}),
    .sr(\u_cpu/dbg_en ),
    .f({_al_u309_o,open_n1047}),
    .q({open_n1051,\u_cpu/u_fetch/pc [1]}));  // sources/rtl/mcu/fetch.v(75)
  // sources/rtl/mcu/fetch.v(75)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(~C*B))"),
    //.LUT1("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110011),
    .INIT_LUT1(16'b0001000000010101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u311|u_cpu/u_fetch/reg0_b10  (
    .a({\u_cpu/pc_wen ,open_n1052}),
    .b({\u_cpu/u_fetch/n1 [10],\u_cpu/pc_wen }),
    .c({\u_cpu/u_fetch/fetch_en ,\u_cpu/pc_wdata [10]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_fetch/pc [10],_al_u311_o}),
    .sr(\u_cpu/dbg_en ),
    .f({_al_u311_o,open_n1066}),
    .q({open_n1070,\u_cpu/u_fetch/pc [10]}));  // sources/rtl/mcu/fetch.v(75)
  // sources/rtl/mcu/fetch.v(75)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(~C*B))"),
    //.LUTF1("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    //.LUTG0("(~D*~(~C*B))"),
    //.LUTG1("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110011),
    .INIT_LUTF1(16'b0001000000010101),
    .INIT_LUTG0(16'b0000000011110011),
    .INIT_LUTG1(16'b0001000000010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u313|u_cpu/u_fetch/reg0_b11  (
    .a({\u_cpu/pc_wen ,open_n1071}),
    .b({\u_cpu/u_fetch/n1 [11],\u_cpu/pc_wen }),
    .c({\u_cpu/u_fetch/fetch_en ,\u_cpu/pc_wdata [11]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_fetch/pc [11],_al_u313_o}),
    .sr(\u_cpu/dbg_en ),
    .f({_al_u313_o,open_n1089}),
    .q({open_n1093,\u_cpu/u_fetch/pc [11]}));  // sources/rtl/mcu/fetch.v(75)
  // sources/rtl/mcu/fetch.v(75)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(~C*B))"),
    //.LUTF1("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    //.LUTG0("(~D*~(~C*B))"),
    //.LUTG1("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110011),
    .INIT_LUTF1(16'b0001000000010101),
    .INIT_LUTG0(16'b0000000011110011),
    .INIT_LUTG1(16'b0001000000010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u315|u_cpu/u_fetch/reg0_b2  (
    .a({\u_cpu/pc_wen ,open_n1094}),
    .b({\u_cpu/u_fetch/n1 [2],\u_cpu/pc_wen }),
    .c({\u_cpu/u_fetch/fetch_en ,\u_cpu/pc_wdata [2]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_fetch/pc [2],_al_u315_o}),
    .sr(\u_cpu/dbg_en ),
    .f({_al_u315_o,open_n1112}),
    .q({open_n1116,\u_cpu/u_fetch/pc [2]}));  // sources/rtl/mcu/fetch.v(75)
  // sources/rtl/mcu/fetch.v(75)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(~C*B))"),
    //.LUT1("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110011),
    .INIT_LUT1(16'b0001000000010101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u317|u_cpu/u_fetch/reg0_b3  (
    .a({\u_cpu/pc_wen ,open_n1117}),
    .b({\u_cpu/u_fetch/n1 [3],\u_cpu/pc_wen }),
    .c({\u_cpu/u_fetch/fetch_en ,\u_cpu/pc_wdata [3]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_fetch/pc [3],_al_u317_o}),
    .sr(\u_cpu/dbg_en ),
    .f({_al_u317_o,open_n1131}),
    .q({open_n1135,\u_cpu/u_fetch/pc [3]}));  // sources/rtl/mcu/fetch.v(75)
  // sources/rtl/mcu/fetch.v(75)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(~C*B))"),
    //.LUT1("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110011),
    .INIT_LUT1(16'b0001000000010101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u319|u_cpu/u_fetch/reg0_b4  (
    .a({\u_cpu/pc_wen ,open_n1136}),
    .b({\u_cpu/u_fetch/n1 [4],\u_cpu/pc_wen }),
    .c({\u_cpu/u_fetch/fetch_en ,\u_cpu/pc_wdata [4]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_fetch/pc [4],_al_u319_o}),
    .sr(\u_cpu/dbg_en ),
    .f({_al_u319_o,open_n1150}),
    .q({open_n1154,\u_cpu/u_fetch/pc [4]}));  // sources/rtl/mcu/fetch.v(75)
  // sources/rtl/mcu/fetch.v(75)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(~C*B))"),
    //.LUTF1("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    //.LUTG0("(~D*~(~C*B))"),
    //.LUTG1("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110011),
    .INIT_LUTF1(16'b0001000000010101),
    .INIT_LUTG0(16'b0000000011110011),
    .INIT_LUTG1(16'b0001000000010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u321|u_cpu/u_fetch/reg0_b5  (
    .a({\u_cpu/pc_wen ,open_n1155}),
    .b({\u_cpu/u_fetch/n1 [5],\u_cpu/pc_wen }),
    .c({\u_cpu/u_fetch/fetch_en ,\u_cpu/pc_wdata [5]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_fetch/pc [5],_al_u321_o}),
    .sr(\u_cpu/dbg_en ),
    .f({_al_u321_o,open_n1173}),
    .q({open_n1177,\u_cpu/u_fetch/pc [5]}));  // sources/rtl/mcu/fetch.v(75)
  // sources/rtl/mcu/fetch.v(75)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(~C*B))"),
    //.LUTF1("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    //.LUTG0("(~D*~(~C*B))"),
    //.LUTG1("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110011),
    .INIT_LUTF1(16'b0001000000010101),
    .INIT_LUTG0(16'b0000000011110011),
    .INIT_LUTG1(16'b0001000000010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u323|u_cpu/u_fetch/reg0_b6  (
    .a({\u_cpu/pc_wen ,open_n1178}),
    .b({\u_cpu/u_fetch/n1 [6],\u_cpu/pc_wen }),
    .c({\u_cpu/u_fetch/fetch_en ,\u_cpu/pc_wdata [6]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_fetch/pc [6],_al_u323_o}),
    .sr(\u_cpu/dbg_en ),
    .f({_al_u323_o,open_n1196}),
    .q({open_n1200,\u_cpu/u_fetch/pc [6]}));  // sources/rtl/mcu/fetch.v(75)
  // sources/rtl/mcu/fetch.v(75)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(~C*B))"),
    //.LUT1("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110011),
    .INIT_LUT1(16'b0001000000010101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u325|u_cpu/u_fetch/reg0_b7  (
    .a({\u_cpu/pc_wen ,open_n1201}),
    .b({\u_cpu/u_fetch/n1 [7],\u_cpu/pc_wen }),
    .c({\u_cpu/u_fetch/fetch_en ,\u_cpu/pc_wdata [7]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_fetch/pc [7],_al_u325_o}),
    .sr(\u_cpu/dbg_en ),
    .f({_al_u325_o,open_n1215}),
    .q({open_n1219,\u_cpu/u_fetch/pc [7]}));  // sources/rtl/mcu/fetch.v(75)
  // sources/rtl/mcu/fetch.v(75)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(~C*B))"),
    //.LUT1("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110011),
    .INIT_LUT1(16'b0001000000010101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u327|u_cpu/u_fetch/reg0_b8  (
    .a({\u_cpu/pc_wen ,open_n1220}),
    .b({\u_cpu/u_fetch/n1 [8],\u_cpu/pc_wen }),
    .c({\u_cpu/u_fetch/fetch_en ,\u_cpu/pc_wdata [8]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_fetch/pc [8],_al_u327_o}),
    .sr(\u_cpu/dbg_en ),
    .f({_al_u327_o,open_n1234}),
    .q({open_n1238,\u_cpu/u_fetch/pc [8]}));  // sources/rtl/mcu/fetch.v(75)
  // sources/rtl/mcu/fetch.v(64)
  EG_PHY_LSLICE #(
    //.LUTF0("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    //.LUTF1("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    //.LUTG0("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    //.LUTG1("(~A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000010000010101),
    .INIT_LUTF1(16'b0001000000010101),
    .INIT_LUTG0(16'b0000010000010101),
    .INIT_LUTG1(16'b0001000000010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u329|u_cpu/u_fetch/fetch_en_reg  (
    .a({\u_cpu/pc_wen ,\u_cpu/dbg_rom_ren }),
    .b({\u_cpu/u_fetch/n1 [9],\u_cpu/u_fetch/fetch_en }),
    .c({\u_cpu/u_fetch/fetch_en ,\u_cpu/u_fetch/pc [9]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_fetch/pc [9],rom_raddr[9]}),
    .mi({open_n1243,\u_cpu/timer_state }),
    .sr(\u_cpu/dbg_en ),
    .f({_al_u329_o,_al_u353_o}),
    .q({open_n1258,\u_cpu/u_fetch/fetch_en }));  // sources/rtl/mcu/fetch.v(64)
  // sources/rtl/mcu/fetch.v(81)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~C*~D)"),
    //.LUTF1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    //.LUTG0("~(~C*~D)"),
    //.LUTG1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111111111110000),
    .INIT_LUTF1(16'b0000010000010101),
    .INIT_LUTG0(16'b1111111111110000),
    .INIT_LUTG1(16'b0000010000010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u331|u_cpu/u_fetch/rom_ren_reg  (
    .a({\u_cpu/dbg_rom_ren ,open_n1259}),
    .b({\u_cpu/u_fetch/fetch_en ,open_n1260}),
    .c({\u_cpu/u_fetch/pc [0],\u_cpu/u_fetch/fetch_en }),
    .clk(vga_clk_pad),
    .d({rom_raddr[0],\u_cpu/dbg_rom_ren }),
    .f({_al_u331_o,open_n1279}),
    .q({open_n1283,rom_ren}));  // sources/rtl/mcu/fetch.v(81)
  // sources/rtl/mcu/fetch.v(90)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0000010000010101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u333|u_cpu/u_fetch/reg1_b9  (
    .a({\u_cpu/dbg_rom_ren ,open_n1284}),
    .b({\u_cpu/u_fetch/fetch_en ,\u_cpu/dbg_rom_raddr [9]}),
    .c({\u_cpu/u_fetch/pc [1],\u_cpu/dbg_rom_ren }),
    .clk(vga_clk_pad),
    .d({rom_raddr[1],_al_u353_o}),
    .f({_al_u333_o,open_n1299}),
    .q({open_n1303,rom_raddr[9]}));  // sources/rtl/mcu/fetch.v(90)
  // sources/rtl/mcu/fetch.v(90)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0000010000010101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0000010000010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u335|u_cpu/u_fetch/reg1_b10  (
    .a({\u_cpu/dbg_rom_ren ,open_n1304}),
    .b({\u_cpu/u_fetch/fetch_en ,\u_cpu/dbg_rom_raddr [10]}),
    .c({\u_cpu/u_fetch/pc [10],\u_cpu/dbg_rom_ren }),
    .clk(vga_clk_pad),
    .d({rom_raddr[10],_al_u335_o}),
    .f({_al_u335_o,open_n1323}),
    .q({open_n1327,rom_raddr[10]}));  // sources/rtl/mcu/fetch.v(90)
  // sources/rtl/mcu/fetch.v(90)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0000010000010101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u337|u_cpu/u_fetch/reg1_b11  (
    .a({\u_cpu/dbg_rom_ren ,open_n1328}),
    .b({\u_cpu/u_fetch/fetch_en ,\u_cpu/dbg_rom_raddr [11]}),
    .c({\u_cpu/u_fetch/pc [11],\u_cpu/dbg_rom_ren }),
    .clk(vga_clk_pad),
    .d({rom_raddr[11],_al_u337_o}),
    .f({_al_u337_o,open_n1343}),
    .q({open_n1347,rom_raddr[11]}));  // sources/rtl/mcu/fetch.v(90)
  // sources/rtl/mcu/fetch.v(90)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0000010000010101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u339|u_cpu/u_fetch/reg1_b2  (
    .a({\u_cpu/dbg_rom_ren ,open_n1348}),
    .b({\u_cpu/u_fetch/fetch_en ,\u_cpu/dbg_rom_raddr [2]}),
    .c({\u_cpu/u_fetch/pc [2],\u_cpu/dbg_rom_ren }),
    .clk(vga_clk_pad),
    .d({rom_raddr[2],_al_u339_o}),
    .f({_al_u339_o,open_n1363}),
    .q({open_n1367,rom_raddr[2]}));  // sources/rtl/mcu/fetch.v(90)
  // sources/rtl/mcu/fetch.v(90)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0000010000010101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0000010000010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u341|u_cpu/u_fetch/reg1_b3  (
    .a({\u_cpu/dbg_rom_ren ,open_n1368}),
    .b({\u_cpu/u_fetch/fetch_en ,\u_cpu/dbg_rom_raddr [3]}),
    .c({\u_cpu/u_fetch/pc [3],\u_cpu/dbg_rom_ren }),
    .clk(vga_clk_pad),
    .d({rom_raddr[3],_al_u341_o}),
    .f({_al_u341_o,open_n1387}),
    .q({open_n1391,rom_raddr[3]}));  // sources/rtl/mcu/fetch.v(90)
  // sources/rtl/mcu/fetch.v(90)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0000010000010101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0000010000010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u343|u_cpu/u_fetch/reg1_b4  (
    .a({\u_cpu/dbg_rom_ren ,open_n1392}),
    .b({\u_cpu/u_fetch/fetch_en ,\u_cpu/dbg_rom_raddr [4]}),
    .c({\u_cpu/u_fetch/pc [4],\u_cpu/dbg_rom_ren }),
    .clk(vga_clk_pad),
    .d({rom_raddr[4],_al_u343_o}),
    .f({_al_u343_o,open_n1411}),
    .q({open_n1415,rom_raddr[4]}));  // sources/rtl/mcu/fetch.v(90)
  // sources/rtl/mcu/fetch.v(90)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0000010000010101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u345|u_cpu/u_fetch/reg1_b5  (
    .a({\u_cpu/dbg_rom_ren ,open_n1416}),
    .b({\u_cpu/u_fetch/fetch_en ,\u_cpu/dbg_rom_raddr [5]}),
    .c({\u_cpu/u_fetch/pc [5],\u_cpu/dbg_rom_ren }),
    .clk(vga_clk_pad),
    .d({rom_raddr[5],_al_u345_o}),
    .f({_al_u345_o,open_n1431}),
    .q({open_n1435,rom_raddr[5]}));  // sources/rtl/mcu/fetch.v(90)
  // sources/rtl/mcu/fetch.v(90)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0000010000010101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u347|u_cpu/u_fetch/reg1_b6  (
    .a({\u_cpu/dbg_rom_ren ,open_n1436}),
    .b({\u_cpu/u_fetch/fetch_en ,\u_cpu/dbg_rom_raddr [6]}),
    .c({\u_cpu/u_fetch/pc [6],\u_cpu/dbg_rom_ren }),
    .clk(vga_clk_pad),
    .d({rom_raddr[6],_al_u347_o}),
    .f({_al_u347_o,open_n1451}),
    .q({open_n1455,rom_raddr[6]}));  // sources/rtl/mcu/fetch.v(90)
  // sources/rtl/mcu/fetch.v(90)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0000010000010101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0000010000010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u349|u_cpu/u_fetch/reg1_b7  (
    .a({\u_cpu/dbg_rom_ren ,open_n1456}),
    .b({\u_cpu/u_fetch/fetch_en ,\u_cpu/dbg_rom_raddr [7]}),
    .c({\u_cpu/u_fetch/pc [7],\u_cpu/dbg_rom_ren }),
    .clk(vga_clk_pad),
    .d({rom_raddr[7],_al_u349_o}),
    .f({_al_u349_o,open_n1475}),
    .q({open_n1479,rom_raddr[7]}));  // sources/rtl/mcu/fetch.v(90)
  // sources/rtl/mcu/fetch.v(90)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0000010000010101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0000010000010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u351|u_cpu/u_fetch/reg1_b8  (
    .a({\u_cpu/dbg_rom_ren ,open_n1480}),
    .b({\u_cpu/u_fetch/fetch_en ,\u_cpu/dbg_rom_raddr [8]}),
    .c({\u_cpu/u_fetch/pc [8],\u_cpu/dbg_rom_ren }),
    .clk(vga_clk_pad),
    .d({rom_raddr[8],_al_u351_o}),
    .f({_al_u351_o,open_n1499}),
    .q({open_n1503,rom_raddr[8]}));  // sources/rtl/mcu/fetch.v(90)
  // sources/rtl/mcu/debug.v(100)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    //.LUT1("(~C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000110000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u392|u_cpu/u_debug/reg0_b0  (
    .b({open_n1506,recv_cmd[0]}),
    .c({\u_cpu/read_abcd [1],recv_cmd[1]}),
    .ce(\u_cpu/u_debug/debug_cmd ),
    .clk(vga_clk_pad),
    .d({\u_cpu/read_abcd [0],_al_u472_o}),
    .mi({open_n1517,recv_data[0]}),
    .f({_al_u392_o,\u_cpu/u_debug/debug_cmd }),
    .q({open_n1522,\u_cpu/dbg_inst [0]}));  // sources/rtl/mcu/debug.v(100)
  // sources/rtl/mcu/execute.v(366)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~A*~(~C*~B))"),
    //.LUTF1("(~D*~C*~B*~A)"),
    //.LUTG0("(~D*~A*~(~C*~B))"),
    //.LUTG1("(~D*~C*~B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000001010100),
    .INIT_LUTF1(16'b0000000000000001),
    .INIT_LUTG0(16'b0000000001010100),
    .INIT_LUTG1(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u394|u_cpu/u_execute/reg9_b5  (
    .a({bus_raddr[4],\u_cpu/u_execute/bus_to_d_wen }),
    .b({bus_raddr[5],\u_cpu/u_execute/ram_to_d_wen }),
    .c(bus_raddr[6:5]),
    .ce(\u_cpu/u_execute/n40 ),
    .clk(vga_clk_pad),
    .d({bus_raddr[7],\u_cpu/u_execute/rom_to_d_wen }),
    .mi({open_n1526,bus_raddr[5]}),
    .f({_al_u394_o,_al_u853_o}),
    .q({open_n1542,ram_waddr[5]}));  // sources/rtl/mcu/execute.v(366)
  // sources/rtl/mcu/bus.v(86)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(D*C*B*A)"),
    //.LUTG1("(~C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u395|u_bus/vram_wen_reg  (
    .a({open_n1543,_al_u396_o}),
    .b({open_n1544,_al_u394_o}),
    .c({bus_raddr[1],bus_wen}),
    .clk(vga_clk_pad),
    .d({_al_u394_o,bus_raddr[1]}),
    .f({_al_u395_o,\u_bus/n22 }),
    .q({open_n1566,vram_wen}));  // sources/rtl/mcu/bus.v(86)
  // sources/rtl/mcu/execute.v(366)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(~C*~B))"),
    //.LUTF1("(~C*~B*~D)"),
    //.LUTG0("(~D*~(~C*~B))"),
    //.LUTG1("(~C*~B*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011111100),
    .INIT_LUTF1(16'b0000000000000011),
    .INIT_LUTG0(16'b0000000011111100),
    .INIT_LUTG1(16'b0000000000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u396|u_cpu/u_execute/reg9_b2  (
    .b({bus_raddr[2],\u_cpu/u_execute/ram_to_d_wen }),
    .c(bus_raddr[3:2]),
    .ce(\u_cpu/u_execute/n40 ),
    .clk(vga_clk_pad),
    .d({bus_raddr[0],\u_cpu/u_execute/bus_to_d_wen }),
    .mi({open_n1572,bus_raddr[2]}),
    .f({_al_u396_o,_al_u904_o}),
    .q({open_n1588,ram_waddr[2]}));  // sources/rtl/mcu/execute.v(366)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(~D*~C*~B*~A)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b0000000000000001),
    .MODE("LOGIC"))
    \_al_u398|_al_u737  (
    .a({\u_cpu/u_timer/cnt [12],open_n1589}),
    .b({\u_cpu/u_timer/cnt [13],open_n1590}),
    .c({\u_cpu/u_timer/cnt [14],\u_cpu/alu_cmd [10]}),
    .d({\u_cpu/u_timer/cnt [15],\u_cpu/alu_out4 [3]}),
    .f({_al_u398_o,_al_u737_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*~A)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~D*~C*~B*~A)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000000000000001),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000000000000001),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u400|_al_u399  (
    .a({open_n1611,\u_cpu/u_timer/cnt [0]}),
    .b({open_n1612,\u_cpu/u_timer/cnt [1]}),
    .c({_al_u399_o,\u_cpu/u_timer/cnt [10]}),
    .d({_al_u398_o,\u_cpu/u_timer/cnt [11]}),
    .f({_al_u400_o,_al_u399_o}));
  // sources/rtl/mcu/timer.v(42)
  EG_PHY_LSLICE #(
    //.LUTF0("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    //.LUTF1("(~D*~C*~B*~A)"),
    //.LUTG0("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    //.LUTG1("(~D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111010000000100),
    .INIT_LUTF1(16'b0000000000000001),
    .INIT_LUTG0(16'b1111010000000100),
    .INIT_LUTG1(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u401|u_cpu/u_timer/reg0_b22  (
    .a({\u_cpu/u_timer/cnt [2],\u_cpu/u_timer/n4 }),
    .b({\u_cpu/u_timer/cnt [20],\u_cpu/u_timer/n1 [22]}),
    .c({\u_cpu/u_timer/cnt [21],\u_cpu/timer_wen }),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_timer/cnt [22],\u_cpu/timer_wdata [22]}),
    .f({_al_u401_o,open_n1655}),
    .q({open_n1659,\u_cpu/u_timer/cnt [22]}));  // sources/rtl/mcu/timer.v(42)
  // sources/rtl/mcu/timer.v(42)
  EG_PHY_LSLICE #(
    //.LUTF0("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    //.LUTF1("(~D*~C*~B*~A)"),
    //.LUTG0("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    //.LUTG1("(~D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111010000000100),
    .INIT_LUTF1(16'b0000000000000001),
    .INIT_LUTG0(16'b1111010000000100),
    .INIT_LUTG1(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u402|u_cpu/u_timer/reg0_b18  (
    .a({\u_cpu/u_timer/cnt [16],\u_cpu/u_timer/n4 }),
    .b({\u_cpu/u_timer/cnt [17],\u_cpu/u_timer/n1 [18]}),
    .c({\u_cpu/u_timer/cnt [18],\u_cpu/timer_wen }),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_timer/cnt [19],\u_cpu/timer_wdata [18]}),
    .f({_al_u402_o,open_n1678}),
    .q({open_n1682,\u_cpu/u_timer/cnt [18]}));  // sources/rtl/mcu/timer.v(42)
  // sources/rtl/mcu/timer.v(42)
  EG_PHY_MSLICE #(
    //.LUT0("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    //.LUT1("(~D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111010000000100),
    .INIT_LUT1(16'b0000000000000001),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u403|u_cpu/u_timer/reg0_b9  (
    .a({\u_cpu/u_timer/cnt [6],\u_cpu/u_timer/n4 }),
    .b({\u_cpu/u_timer/cnt [7],\u_cpu/u_timer/n1 [9]}),
    .c({\u_cpu/u_timer/cnt [8],\u_cpu/timer_wen }),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_timer/cnt [9],\u_cpu/timer_wdata [9]}),
    .f({_al_u403_o,open_n1697}),
    .q({open_n1701,\u_cpu/u_timer/cnt [9]}));  // sources/rtl/mcu/timer.v(42)
  // sources/rtl/mcu/timer.v(42)
  EG_PHY_LSLICE #(
    //.LUTF0("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    //.LUTF1("(~D*~C*~B*~A)"),
    //.LUTG0("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    //.LUTG1("(~D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111010000000100),
    .INIT_LUTF1(16'b0000000000000001),
    .INIT_LUTG0(16'b1111010000000100),
    .INIT_LUTG1(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u404|u_cpu/u_timer/reg0_b5  (
    .a({\u_cpu/u_timer/cnt [23],\u_cpu/u_timer/n4 }),
    .b({\u_cpu/u_timer/cnt [3],\u_cpu/u_timer/n1 [5]}),
    .c({\u_cpu/u_timer/cnt [4],\u_cpu/timer_wen }),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_timer/cnt [5],\u_cpu/timer_wdata [5]}),
    .f({_al_u404_o,open_n1720}),
    .q({open_n1724,\u_cpu/u_timer/cnt [5]}));  // sources/rtl/mcu/timer.v(42)
  // sources/rtl/mcu/timer.v(48)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u405|u_cpu/u_timer/timer_state_reg  (
    .a({_al_u401_o,open_n1725}),
    .b({_al_u402_o,open_n1726}),
    .c({_al_u403_o,_al_u405_o}),
    .clk(vga_clk_pad),
    .d({_al_u404_o,_al_u400_o}),
    .f({_al_u405_o,\u_cpu/u_timer/n4 }),
    .q({open_n1744,\u_cpu/timer_state }));  // sources/rtl/mcu/timer.v(48)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*~(~D*~A))"),
    //.LUTF1("(~C*~B*~(~D*~A))"),
    //.LUTG0("(~C*~B*~(~D*~A))"),
    //.LUTG1("(~C*~B*~(~D*~A))"),
    .INIT_LUTF0(16'b0000001100000010),
    .INIT_LUTF1(16'b0000001100000010),
    .INIT_LUTG0(16'b0000001100000010),
    .INIT_LUTG1(16'b0000001100000010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u433|_al_u439  (
    .a({\u_cpu/alu_out3 [1],\u_cpu/alu_out3 [3]}),
    .b({\u_cpu/alu_cmd [6],\u_cpu/alu_cmd [6]}),
    .c({\u_cpu/alu_cmd [7],\u_cpu/alu_cmd [7]}),
    .d({\u_cpu/alu_cmd [8],\u_cpu/alu_cmd [8]}),
    .f({_al_u433_o,_al_u439_o}));
  // sources/rtl/mcu/alu.v(75)
  EG_PHY_MSLICE #(
    //.LUT0("~(~A*~(D*C*B))"),
    //.LUT1("(A*~(D*~C*~B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1110101010101010),
    .INIT_LUT1(16'b1010100010101010),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u434|u_cpu/u_alu/reg2_b1  (
    .a({_al_u433_o,_al_u434_o}),
    .b({bus_wdata[1],bus_wdata[1]}),
    .c({\u_cpu/alu_in2 [1],\u_cpu/alu_in2 [1]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_cmd [8],\u_cpu/alu_cmd [6]}),
    .sr(\u_cpu/alu_cmd [5]),
    .f({_al_u434_o,open_n1782}),
    .q({open_n1786,\u_cpu/alu_out3 [1]}));  // sources/rtl/mcu/alu.v(75)
  // sources/rtl/mcu/alu.v(75)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~A*~(D*C*B))"),
    //.LUTF1("(A*~(D*~C*~B))"),
    //.LUTG0("~(~A*~(D*C*B))"),
    //.LUTG1("(A*~(D*~C*~B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1110101010101010),
    .INIT_LUTF1(16'b1010100010101010),
    .INIT_LUTG0(16'b1110101010101010),
    .INIT_LUTG1(16'b1010100010101010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u437|u_cpu/u_alu/reg2_b2  (
    .a({_al_u436_o,_al_u437_o}),
    .b({bus_wdata[2],bus_wdata[2]}),
    .c({\u_cpu/alu_in2 [2],\u_cpu/alu_in2 [2]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_cmd [8],\u_cpu/alu_cmd [6]}),
    .sr(\u_cpu/alu_cmd [5]),
    .f({_al_u437_o,open_n1804}),
    .q({open_n1808,\u_cpu/alu_out3 [2]}));  // sources/rtl/mcu/alu.v(75)
  // sources/rtl/mcu/alu.v(75)
  EG_PHY_MSLICE #(
    //.LUT0("~(~A*~(D*C*B))"),
    //.LUT1("(A*~(D*~C*~B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1110101010101010),
    .INIT_LUT1(16'b1010100010101010),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u440|u_cpu/u_alu/reg2_b3  (
    .a({_al_u439_o,_al_u440_o}),
    .b({bus_wdata[3],bus_wdata[3]}),
    .c({\u_cpu/alu_in2 [3],\u_cpu/alu_in2 [3]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_cmd [8],\u_cpu/alu_cmd [6]}),
    .sr(\u_cpu/alu_cmd [5]),
    .f({_al_u440_o,open_n1822}),
    .q({open_n1826,\u_cpu/alu_out3 [3]}));  // sources/rtl/mcu/alu.v(75)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*~(D*~A))"),
    //.LUTF1("(~C*~B*~(~D*~A))"),
    //.LUTG0("(~C*~B*~(D*~A))"),
    //.LUTG1("(~C*~B*~(~D*~A))"),
    .INIT_LUTF0(16'b0000001000000011),
    .INIT_LUTF1(16'b0000001100000010),
    .INIT_LUTG0(16'b0000001000000011),
    .INIT_LUTG1(16'b0000001100000010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u442|_al_u975  (
    .a({\u_cpu/alu_out3 [4],\u_cpu/alu_out3 [4]}),
    .b({\u_cpu/alu_cmd [6],\u_cpu/u_execute/wt_ram_cmd [6]}),
    .c({\u_cpu/alu_cmd [7],\u_cpu/u_execute/wt_ram_cmd [7]}),
    .d({\u_cpu/alu_cmd [8],\u_cpu/u_execute/wt_ram_cmd [8]}),
    .f({_al_u442_o,_al_u975_o}));
  // sources/rtl/mcu/alu.v(75)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~A*~(D*C*B))"),
    //.LUTF1("(A*~(D*~C*~B))"),
    //.LUTG0("~(~A*~(D*C*B))"),
    //.LUTG1("(A*~(D*~C*~B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1110101010101010),
    .INIT_LUTF1(16'b1010100010101010),
    .INIT_LUTG0(16'b1110101010101010),
    .INIT_LUTG1(16'b1010100010101010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u443|u_cpu/u_alu/reg2_b4  (
    .a({_al_u442_o,_al_u443_o}),
    .b({bus_wdata[4],bus_wdata[4]}),
    .c({\u_cpu/alu_in2 [4],\u_cpu/alu_in2 [4]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_cmd [8],\u_cpu/alu_cmd [6]}),
    .sr(\u_cpu/alu_cmd [5]),
    .f({_al_u443_o,open_n1868}),
    .q({open_n1872,\u_cpu/alu_out3 [4]}));  // sources/rtl/mcu/alu.v(75)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*~(D*~A))"),
    //.LUT1("(~C*~B*~(~D*~A))"),
    .INIT_LUT0(16'b0000001000000011),
    .INIT_LUT1(16'b0000001100000010),
    .MODE("LOGIC"))
    \_al_u445|_al_u965  (
    .a({\u_cpu/alu_out3 [5],\u_cpu/alu_out3 [5]}),
    .b({\u_cpu/alu_cmd [6],\u_cpu/u_execute/wt_ram_cmd [6]}),
    .c({\u_cpu/alu_cmd [7],\u_cpu/u_execute/wt_ram_cmd [7]}),
    .d({\u_cpu/alu_cmd [8],\u_cpu/u_execute/wt_ram_cmd [8]}),
    .f({_al_u445_o,_al_u965_o}));
  // sources/rtl/mcu/alu.v(75)
  EG_PHY_MSLICE #(
    //.LUT0("~(~A*~(D*C*B))"),
    //.LUT1("(A*~(D*~C*~B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1110101010101010),
    .INIT_LUT1(16'b1010100010101010),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u446|u_cpu/u_alu/reg2_b5  (
    .a({_al_u445_o,_al_u446_o}),
    .b({bus_wdata[5],bus_wdata[5]}),
    .c({\u_cpu/alu_in2 [5],\u_cpu/alu_in2 [5]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_cmd [8],\u_cpu/alu_cmd [6]}),
    .sr(\u_cpu/alu_cmd [5]),
    .f({_al_u446_o,open_n1906}),
    .q({open_n1910,\u_cpu/alu_out3 [5]}));  // sources/rtl/mcu/alu.v(75)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*~(D*~A))"),
    //.LUTF1("(~C*~B*~(~D*~A))"),
    //.LUTG0("(~C*~B*~(D*~A))"),
    //.LUTG1("(~C*~B*~(~D*~A))"),
    .INIT_LUTF0(16'b0000001000000011),
    .INIT_LUTF1(16'b0000001100000010),
    .INIT_LUTG0(16'b0000001000000011),
    .INIT_LUTG1(16'b0000001100000010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u448|_al_u955  (
    .a({\u_cpu/alu_out3 [6],\u_cpu/alu_out3 [6]}),
    .b({\u_cpu/alu_cmd [6],\u_cpu/u_execute/wt_ram_cmd [6]}),
    .c({\u_cpu/alu_cmd [7],\u_cpu/u_execute/wt_ram_cmd [7]}),
    .d({\u_cpu/alu_cmd [8],\u_cpu/u_execute/wt_ram_cmd [8]}),
    .f({_al_u448_o,_al_u955_o}));
  // sources/rtl/mcu/alu.v(75)
  EG_PHY_MSLICE #(
    //.LUT0("~(~A*~(D*C*B))"),
    //.LUT1("(A*~(D*~C*~B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1110101010101010),
    .INIT_LUT1(16'b1010100010101010),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u449|u_cpu/u_alu/reg2_b6  (
    .a({_al_u448_o,_al_u449_o}),
    .b({bus_wdata[6],bus_wdata[6]}),
    .c({\u_cpu/alu_in2 [6],\u_cpu/alu_in2 [6]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_cmd [8],\u_cpu/alu_cmd [6]}),
    .sr(\u_cpu/alu_cmd [5]),
    .f({_al_u449_o,open_n1948}),
    .q({open_n1952,\u_cpu/alu_out3 [6]}));  // sources/rtl/mcu/alu.v(75)
  // sources/rtl/mcu/alu.v(75)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~A*~(D*C*B))"),
    //.LUTF1("(A*~(D*~C*~B))"),
    //.LUTG0("~(~A*~(D*C*B))"),
    //.LUTG1("(A*~(D*~C*~B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1110101010101010),
    .INIT_LUTF1(16'b1010100010101010),
    .INIT_LUTG0(16'b1110101010101010),
    .INIT_LUTG1(16'b1010100010101010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u452|u_cpu/u_alu/reg2_b7  (
    .a({_al_u451_o,_al_u452_o}),
    .b({bus_wdata[7],bus_wdata[7]}),
    .c({\u_cpu/alu_in2 [7],\u_cpu/alu_in2 [7]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_cmd [8],\u_cpu/alu_cmd [6]}),
    .sr(\u_cpu/alu_cmd [5]),
    .f({_al_u452_o,open_n1970}),
    .q({open_n1974,\u_cpu/alu_out3 [7]}));  // sources/rtl/mcu/alu.v(75)
  // sources/rtl/mcu/execute.v(366)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~A*~(~C*~B))"),
    //.LUTF1("(~C*~B*~D)"),
    //.LUTG0("(~D*~A*~(~C*~B))"),
    //.LUTG1("(~C*~B*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000001010100),
    .INIT_LUTF1(16'b0000000000000011),
    .INIT_LUTG0(16'b0000000001010100),
    .INIT_LUTG1(16'b0000000000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u457|u_cpu/u_execute/reg9_b6  (
    .a({open_n1975,\u_cpu/u_execute/bus_to_d_wen }),
    .b({ram_waddr[6],\u_cpu/u_execute/ram_to_d_wen }),
    .c({ram_waddr[7],bus_raddr[6]}),
    .ce(\u_cpu/u_execute/n40 ),
    .clk(vga_clk_pad),
    .d({ram_waddr[5],\u_cpu/u_execute/rom_to_d_wen }),
    .mi({open_n1979,bus_raddr[6]}),
    .f({_al_u457_o,_al_u841_o}),
    .q({open_n1995,ram_waddr[6]}));  // sources/rtl/mcu/execute.v(366)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~(B*~(A)*~(D)+B*A*~(D)+~(B)*A*D+B*A*D))"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b0000010100000011),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u458|_al_u964  (
    .a({open_n1996,\u_cpu/alu_out4 [5]}),
    .b({ram_wen,ram_wdata[5]}),
    .c({ram_waddr[4],\u_cpu/u_execute/wt_ram_cmd [8]}),
    .d({_al_u457_o,\u_cpu/u_execute/wt_ram_cmd [9]}),
    .f({\u_ram/n4 ,_al_u964_o}));
  // sources/rtl/uart/ubus.v(170)
  EG_PHY_MSLICE #(
    //.LUT0("(~D)"),
    //.LUT1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011111111),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u461|u_uart/u_ubus/reg10_b0  (
    .c({\u_uart/u_uart_tx/cnt [1],open_n2021}),
    .clk(vga_clk_pad),
    .d({\u_uart/u_uart_tx/cnt [0],\u_uart/u_ubus/tx_ready_cnt [0]}),
    .sr(\u_uart/tx_ready ),
    .f({_al_u461_o,open_n2035}),
    .q({open_n2039,\u_uart/u_ubus/tx_ready_cnt [0]}));  // sources/rtl/uart/ubus.v(170)
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(C*~D))"),
    //.LUTF1("(C*~(~D*~(~B*~A)))"),
    //.LUTG0("(~B*~(C*~D))"),
    //.LUTG1("(C*~(~D*~(~B*~A)))"),
    .INIT_LUTF0(16'b0011001100000011),
    .INIT_LUTF1(16'b1111000000010000),
    .INIT_LUTG0(16'b0011001100000011),
    .INIT_LUTG1(16'b1111000000010000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u462|_al_u1019  (
    .a({_al_u461_o,open_n2040}),
    .b({\u_uart/u_uart_tx/cnt [2],\u_cpu/u_execute/wt_ram_cmd [3]}),
    .c({\u_uart/u_uart_tx/cnt [3],\u_cpu/u_execute/wt_ram_cmd [4]}),
    .d({tx_pad,\u_cpu/alu_out0 [0]}),
    .f({_al_u462_o,_al_u1019_o}));
  // sources/rtl/uart/uart_tx.v(74)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~C*B*~A)"),
    //.LUTF1("(~D*~C*~(~B*A))"),
    //.LUTG0("(D*~C*B*~A)"),
    //.LUTG1("(~D*~C*~(~B*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000010000000000),
    .INIT_LUTF1(16'b0000000000001101),
    .INIT_LUTG0(16'b0000010000000000),
    .INIT_LUTG1(16'b0000000000001101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u463|u_uart/u_uart_tx/start_reg  (
    .a({\u_uart/u_uart_tx/data [6],\u_uart/u_uart_tx/cnt [0]}),
    .b({\u_uart/u_uart_tx/cnt [0],\u_uart/u_uart_tx/cnt [1]}),
    .c({\u_uart/u_uart_tx/cnt [1],\u_uart/u_uart_tx/cnt [2]}),
    .ce(\u_uart/u_uart_tx/n4 ),
    .clk(vga_clk_pad),
    .d({\u_uart/u_uart_tx/cnt [2],\u_uart/u_uart_tx/cnt [3]}),
    .mi({open_n2068,1'b0}),
    .sr(\u_uart/tx_en ),
    .f({_al_u463_o,\u_uart/u_uart_tx/n4 }),
    .q({open_n2083,\u_uart/u_uart_tx/start }));  // sources/rtl/uart/uart_tx.v(74)
  // sources/rtl/uart/uart_tx.v(81)
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(C*D))"),
    //.LUTF1("(A*~(B*~(D*C)))"),
    //.LUTG0("(~B*~(C*D))"),
    //.LUTG1("(A*~(B*~(D*C)))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000001100110011),
    .INIT_LUTF1(16'b1010001000100010),
    .INIT_LUTG0(16'b0000001100110011),
    .INIT_LUTG1(16'b1010001000100010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u464|u_uart/u_uart_tx/reg0_b7  (
    .a({_al_u462_o,open_n2084}),
    .b({_al_u463_o,\u_uart/u_ubus/send_cnt [3]}),
    .c({\u_uart/u_uart_tx/data [7],\u_uart/tx_data [7]}),
    .ce(\u_uart/u_uart_tx/n8 ),
    .clk(vga_clk_pad),
    .d({\u_uart/u_uart_tx/cnt [0],_al_u474_o}),
    .mi({open_n2088,\u_uart/tx_data [7]}),
    .f({_al_u464_o,_al_u493_o}),
    .q({open_n2104,\u_uart/u_uart_tx/data [7]}));  // sources/rtl/uart/uart_tx.v(81)
  // sources/rtl/uart/uart_tx.v(81)
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(C*D))"),
    //.LUT1("(D*~(C*~B*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000001100110011),
    .INIT_LUT1(16'b1101111100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u466|u_uart/u_uart_tx/reg0_b4  (
    .a({\u_uart/u_uart_tx/data [4],open_n2105}),
    .b({\u_uart/u_uart_tx/cnt [0],\u_uart/u_ubus/send_cnt [3]}),
    .c({\u_uart/u_uart_tx/cnt [1],\u_uart/tx_data [4]}),
    .ce(\u_uart/u_uart_tx/n8 ),
    .clk(vga_clk_pad),
    .d({\u_uart/u_uart_tx/cnt [2],_al_u474_o}),
    .mi({open_n2116,\u_uart/tx_data [4]}),
    .f({_al_u466_o,_al_u484_o}),
    .q({open_n2121,\u_uart/u_uart_tx/data [4]}));  // sources/rtl/uart/uart_tx.v(81)
  // sources/rtl/uart/uart_tx.v(81)
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(C*D))"),
    //.LUTF1("(C*~B*~(D*A))"),
    //.LUTG0("(~B*~(C*D))"),
    //.LUTG1("(C*~B*~(D*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000001100110011),
    .INIT_LUTF1(16'b0001000000110000),
    .INIT_LUTG0(16'b0000001100110011),
    .INIT_LUTG1(16'b0001000000110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u467|u_uart/u_uart_tx/reg0_b5  (
    .a({_al_u461_o,open_n2122}),
    .b({_al_u465_o,\u_uart/u_ubus/send_cnt [3]}),
    .c({_al_u466_o,\u_uart/tx_data [5]}),
    .ce(\u_uart/u_uart_tx/n8 ),
    .clk(vga_clk_pad),
    .d({\u_uart/u_uart_tx/data [5],_al_u474_o}),
    .mi({open_n2126,\u_uart/tx_data [5]}),
    .f({_al_u467_o,_al_u487_o}),
    .q({open_n2142,\u_uart/u_uart_tx/data [5]}));  // sources/rtl/uart/uart_tx.v(81)
  // sources/rtl/uart/uart_tx.v(117)
  EG_PHY_MSLICE #(
    //.LUT0("(~D)"),
    //.LUT1("(~B*~(C*~D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011111111),
    .INIT_LUT1(16'b0011001100000011),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u468|u_uart/u_uart_tx/tx_ready_reg  (
    .b({\u_uart/u_uart_tx/cnt [0],open_n2145}),
    .c({\u_uart/u_uart_tx/cnt [1],open_n2146}),
    .clk(vga_clk_pad),
    .d({\u_uart/u_uart_tx/data [0],\u_uart/u_uart_tx/start }),
    .sr(\u_uart/tx_en ),
    .f({_al_u468_o,open_n2160}),
    .q({open_n2164,\u_uart/tx_ready }));  // sources/rtl/uart/uart_tx.v(117)
  // sources/rtl/uart/uart_tx.v(81)
  EG_PHY_LSLICE #(
    //.LUTF0("(~A*~(~B*~(D*~C)))"),
    //.LUTF1("(~D*~B*~(C*A))"),
    //.LUTG0("(~A*~(~B*~(D*~C)))"),
    //.LUTG1("(~D*~B*~(C*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0100010101000100),
    .INIT_LUTF1(16'b0000000000010011),
    .INIT_LUTG0(16'b0100010101000100),
    .INIT_LUTG1(16'b0000000000010011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u469|u_uart/u_uart_tx/reg0_b1  (
    .a({_al_u461_o,\u_uart/u_ubus/send_cnt [0]}),
    .b({_al_u468_o,\u_uart/u_ubus/send_cnt [1]}),
    .c({\u_uart/u_uart_tx/data [1],\u_uart/u_ubus/send_cnt [2]}),
    .ce(\u_uart/u_uart_tx/n8 ),
    .clk(vga_clk_pad),
    .d({\u_uart/u_uart_tx/cnt [2],\u_uart/tx_data [1]}),
    .mi({open_n2168,\u_uart/tx_data [1]}),
    .f({_al_u469_o,_al_u500_o}),
    .q({open_n2184,\u_uart/u_uart_tx/data [1]}));  // sources/rtl/uart/uart_tx.v(81)
  // sources/rtl/uart/ubus.v(143)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~(A*~(~D*B)))"),
    //.LUTF1("(~C*~B*~D)"),
    //.LUTG0("(~C*~(A*~(~D*B)))"),
    //.LUTG1("(~C*~B*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000010100001101),
    .INIT_LUTF1(16'b0000000000000011),
    .INIT_LUTG0(16'b0000010100001101),
    .INIT_LUTG1(16'b0000000000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u474|u_uart/u_ubus/reg9_b8  (
    .a({open_n2185,\u_uart/u_ubus/send_cnt [0]}),
    .b({\u_uart/u_ubus/send_cnt [1],\u_uart/u_ubus/send_cnt [2]}),
    .c({\u_uart/u_ubus/send_cnt [2],\u_uart/u_ubus/send_cnt [3]}),
    .ce(send_en),
    .clk(vga_clk_pad),
    .d({\u_uart/u_ubus/send_cnt [0],\u_uart/u_ubus/tx_buffer [8]}),
    .mi({open_n2189,send_cmd[0]}),
    .f({_al_u474_o,_al_u497_o}),
    .q({open_n2205,\u_uart/u_ubus/tx_buffer [8]}));  // sources/rtl/uart/ubus.v(143)
  // sources/rtl/uart/ubus.v(143)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    //.LUTF1("(B*~(C*D))"),
    //.LUTG0("(~C*~(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    //.LUTG1("(B*~(C*D))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000100001101),
    .INIT_LUTF1(16'b0000110011001100),
    .INIT_LUTG0(16'b0000000100001101),
    .INIT_LUTG1(16'b0000110011001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u475|u_uart/u_ubus/reg9_b2  (
    .a({open_n2206,send_data[2]}),
    .b({\u_uart/u_ubus/send_cnt [3],\u_cpu/u_debug/rom_bk_en }),
    .c({\u_uart/u_ubus/tx_buffer [2],\u_cpu/dbg_info_en }),
    .ce(send_en),
    .clk(vga_clk_pad),
    .d({_al_u474_o,\u_cpu/dbg_rom_rdata [2]}),
    .mi({open_n2210,send_data[2]}),
    .f({_al_u475_o,_al_u359_o}),
    .q({open_n2226,\u_uart/u_ubus/tx_buffer [2]}));  // sources/rtl/uart/ubus.v(143)
  // sources/rtl/uart/ubus.v(207)
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(~C*~D))"),
    //.LUT1("(~C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011001100110000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u477|u_uart/u_ubus/reg12_b6  (
    .b({open_n2229,_al_u490_o}),
    .c({\u_uart/u_ubus/send_cnt [3],\u_uart/u_ubus/send_cnt [3]}),
    .clk(vga_clk_pad),
    .d({_al_u476_o,\u_uart/u_ubus/sel0_b6/B2_0 }),
    .f({_al_u477_o,open_n2244}),
    .q({open_n2248,\u_uart/tx_data [6]}));  // sources/rtl/uart/ubus.v(207)
  // sources/rtl/uart/ubus.v(143)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    //.LUT1("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000100001101),
    .INIT_LUT1(16'b0000010010001100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u479|u_uart/u_ubus/reg9_b3  (
    .a({_al_u474_o,send_data[3]}),
    .b({\u_uart/u_ubus/send_cnt [3],\u_cpu/u_debug/rom_bk_en }),
    .c({\u_uart/tx_data [3],\u_cpu/dbg_info_en }),
    .ce(send_en),
    .clk(vga_clk_pad),
    .d({\u_uart/u_ubus/tx_buffer [3],\u_cpu/dbg_rom_rdata [3]}),
    .mi({open_n2259,send_data[3]}),
    .f({_al_u479_o,_al_u361_o}),
    .q({open_n2264,\u_uart/u_ubus/tx_buffer [3]}));  // sources/rtl/uart/ubus.v(143)
  // sources/rtl/uart/ubus.v(143)
  EG_PHY_MSLICE #(
    //.LUT0("(~(~D*B)*~(~C*A))"),
    //.LUT1("(C*B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111010100110001),
    .INIT_LUT1(16'b1100000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u481|u_uart/u_ubus/reg9_b14  (
    .a({open_n2265,_al_u474_o}),
    .b({\u_uart/u_ubus/send_cnt [1],_al_u481_o}),
    .c({\u_uart/u_ubus/send_cnt [2],\u_uart/tx_data [6]}),
    .ce(send_en),
    .clk(vga_clk_pad),
    .d({\u_uart/u_ubus/send_cnt [0],\u_uart/u_ubus/tx_buffer [14]}),
    .mi({open_n2276,send_cmd[6]}),
    .f({_al_u481_o,\u_uart/u_ubus/sel0_b6/B2_0 }),
    .q({open_n2281,\u_uart/u_ubus/tx_buffer [14]}));  // sources/rtl/uart/ubus.v(143)
  // sources/rtl/uart/ubus.v(143)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    //.LUT1("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000100001101),
    .INIT_LUT1(16'b0000010010001100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u483|u_uart/u_ubus/reg9_b4  (
    .a({_al_u474_o,send_data[4]}),
    .b({\u_uart/u_ubus/send_cnt [3],\u_cpu/u_debug/rom_bk_en }),
    .c({\u_uart/tx_data [4],\u_cpu/dbg_info_en }),
    .ce(send_en),
    .clk(vga_clk_pad),
    .d({\u_uart/u_ubus/tx_buffer [4],\u_cpu/dbg_rom_rdata [4]}),
    .mi({open_n2292,send_data[4]}),
    .f({_al_u483_o,_al_u363_o}),
    .q({open_n2297,\u_uart/u_ubus/tx_buffer [4]}));  // sources/rtl/uart/ubus.v(143)
  // sources/rtl/uart/ubus.v(143)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    //.LUTF1("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG0("(~C*~(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    //.LUTG1("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000100001101),
    .INIT_LUTF1(16'b0000010010001100),
    .INIT_LUTG0(16'b0000000100001101),
    .INIT_LUTG1(16'b0000010010001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u486|u_uart/u_ubus/reg9_b5  (
    .a({_al_u474_o,send_data[5]}),
    .b({\u_uart/u_ubus/send_cnt [3],\u_cpu/u_debug/rom_bk_en }),
    .c({\u_uart/tx_data [5],\u_cpu/dbg_info_en }),
    .ce(send_en),
    .clk(vga_clk_pad),
    .d({\u_uart/u_ubus/tx_buffer [5],\u_cpu/dbg_rom_rdata [5]}),
    .mi({open_n2301,send_data[5]}),
    .f({_al_u486_o,_al_u365_o}),
    .q({open_n2317,\u_uart/u_ubus/tx_buffer [5]}));  // sources/rtl/uart/ubus.v(143)
  // sources/rtl/uart/ubus.v(143)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    //.LUTF1("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG0("(~C*~(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    //.LUTG1("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000100001101),
    .INIT_LUTF1(16'b0000010010001100),
    .INIT_LUTG0(16'b0000000100001101),
    .INIT_LUTG1(16'b0000010010001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u495|u_uart/u_ubus/reg9_b0  (
    .a({_al_u474_o,send_data[0]}),
    .b({\u_uart/u_ubus/send_cnt [3],\u_cpu/u_debug/rom_bk_en }),
    .c({\u_uart/tx_data [0],\u_cpu/dbg_info_en }),
    .ce(send_en),
    .clk(vga_clk_pad),
    .d({\u_uart/u_ubus/tx_buffer [0],\u_cpu/dbg_rom_rdata [0]}),
    .mi({open_n2321,send_data[0]}),
    .f({_al_u495_o,_al_u355_o}),
    .q({open_n2337,\u_uart/u_ubus/tx_buffer [0]}));  // sources/rtl/uart/ubus.v(143)
  // sources/rtl/uart/ubus.v(207)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~B*~(~A*~(D*~C)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0010001100100010),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u496|u_uart/u_ubus/reg12_b1  (
    .a({\u_uart/u_ubus/send_cnt [0],open_n2338}),
    .b({\u_uart/u_ubus/send_cnt [1],_al_u500_o}),
    .c({\u_uart/u_ubus/send_cnt [2],_al_u501_o}),
    .clk(vga_clk_pad),
    .d({\u_uart/tx_data [0],_al_u499_o}),
    .f({_al_u496_o,open_n2353}),
    .q({open_n2357,\u_uart/tx_data [1]}));  // sources/rtl/uart/ubus.v(207)
  // sources/rtl/mcu/execute.v(351)
  EG_PHY_LSLICE #(
    //.LUTF0("(~(~B*A)*~(D)*~(C)+~(~B*A)*D*~(C)+~(~(~B*A))*D*C+~(~B*A)*D*C)"),
    //.LUTF1("(C*~B*~D)"),
    //.LUTG0("(~(~B*A)*~(D)*~(C)+~(~B*A)*D*~(C)+~(~(~B*A))*D*C+~(~B*A)*D*C)"),
    //.LUTG1("(C*~B*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111110100001101),
    .INIT_LUTF1(16'b0000000000110000),
    .INIT_LUTG0(16'b1111110100001101),
    .INIT_LUTG1(16'b0000000000110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u503|u_cpu/u_execute/reg7_b9  (
    .a({open_n2358,_al_u392_o}),
    .b({\u_cpu/read_abcd [3],\u_cpu/u_execute/n36 [9]}),
    .c({\u_cpu/dbg_info [9],\u_cpu/u_execute/dbg_info_en0 }),
    .clk(vga_clk_pad),
    .d({\u_cpu/read_abcd [2],bus_wdata[1]}),
    .f({\u_cpu/u_execute/n36 [9],open_n2377}),
    .q({open_n2381,\u_cpu/dbg_info [9]}));  // sources/rtl/mcu/execute.v(351)
  // sources/rtl/mcu/debug.v(180)
  EG_PHY_LSLICE #(
    //.LUTF0("((~B*A)*~(D)*~(C)+(~B*A)*D*~(C)+~((~B*A))*D*C+(~B*A)*D*C)"),
    //.LUTF1("(~C*~B*~D)"),
    //.LUTG0("((~B*A)*~(D)*~(C)+(~B*A)*D*~(C)+~((~B*A))*D*C+(~B*A)*D*C)"),
    //.LUTG1("(~C*~B*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111001000000010),
    .INIT_LUTF1(16'b0000000000000011),
    .INIT_LUTG0(16'b1111001000000010),
    .INIT_LUTG1(16'b0000000000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u505|u_cpu/u_debug/reg5_b3  (
    .a({open_n2382,send_cmd[3]}),
    .b({\u_cpu/read_abcd [3],\u_cpu/u_debug/rom_bk_en }),
    .c({\u_cpu/dbg_info [11],\u_cpu/dbg_info_en }),
    .clk(vga_clk_pad),
    .d({\u_cpu/read_abcd [2],\u_cpu/dbg_info [11]}),
    .f({_al_u505_o,open_n2401}),
    .q({open_n2405,send_cmd[3]}));  // sources/rtl/mcu/debug.v(180)
  // sources/rtl/mcu/debug.v(180)
  EG_PHY_LSLICE #(
    //.LUTF0("((~B*A)*~(D)*~(C)+(~B*A)*D*~(C)+~((~B*A))*D*C+(~B*A)*D*C)"),
    //.LUTF1("(C*~B*~D)"),
    //.LUTG0("((~B*A)*~(D)*~(C)+(~B*A)*D*~(C)+~((~B*A))*D*C+(~B*A)*D*C)"),
    //.LUTG1("(C*~B*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111001000000010),
    .INIT_LUTF1(16'b0000000000110000),
    .INIT_LUTG0(16'b1111001000000010),
    .INIT_LUTG1(16'b0000000000110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u507|u_cpu/u_debug/reg5_b2  (
    .a({open_n2406,send_cmd[2]}),
    .b({\u_cpu/read_abcd [3],\u_cpu/u_debug/rom_bk_en }),
    .c({\u_cpu/dbg_info [10],\u_cpu/dbg_info_en }),
    .clk(vga_clk_pad),
    .d({\u_cpu/read_abcd [2],\u_cpu/dbg_info [10]}),
    .f({\u_cpu/u_execute/n36 [10],open_n2425}),
    .q({open_n2429,send_cmd[2]}));  // sources/rtl/mcu/debug.v(180)
  // sources/rtl/mcu/execute.v(351)
  EG_PHY_MSLICE #(
    //.LUT0("~(~C*~(D)*~(B)+~C*D*~(B)+~(~C)*D*B+~C*D*B)"),
    //.LUT1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000011111100),
    .INIT_LUT1(16'b0000010000010101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u511|u_cpu/u_execute/reg7_b0  (
    .a({\u_cpu/read_abcd [2],open_n2430}),
    .b({\u_cpu/read_abcd [3],_al_u513_o}),
    .c({bus_raddr[0],\u_cpu/alu_in2 [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/dbg_info [0],_al_u512_o}),
    .f({_al_u511_o,open_n2445}),
    .q({open_n2449,\u_cpu/dbg_info [0]}));  // sources/rtl/mcu/execute.v(351)
  // sources/rtl/mcu/execute.v(287)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(~C*B))"),
    //.LUTF1("(~(D*C)*~(~B*A))"),
    //.LUTG0("(D*~(~C*B))"),
    //.LUTG1("(~(D*C)*~(~B*A))"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111001100000000),
    .INIT_LUTF1(16'b0000110111011101),
    .INIT_LUTG0(16'b1111001100000000),
    .INIT_LUTG1(16'b0000110111011101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u512|u_cpu/u_execute/reg4_b0  (
    .a({_al_u510_o,open_n2450}),
    .b({_al_u511_o,\u_cpu/read_abcd [2]}),
    .c({\u_cpu/read_abcd [0],\u_cpu/u_execute/C [0]}),
    .ce(\u_bus/eq0/or_or_or_xor_i0[0]_i_o ),
    .clk(vga_clk_pad),
    .d({bus_wdata[0],_al_u392_o}),
    .mi({open_n2454,\u_cpu/u_execute/C [0]}),
    .f({_al_u512_o,_al_u510_o}),
    .q({open_n2470,\u_cpu/pc_wdata [0]}));  // sources/rtl/mcu/execute.v(287)
  // sources/rtl/mcu/execute.v(351)
  EG_PHY_MSLICE #(
    //.LUT0("((~B*~A)*~(D)*~(C)+(~B*~A)*D*~(C)+~((~B*~A))*D*C+(~B*~A)*D*C)"),
    //.LUT1("(~C*~(B*~D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000100000001),
    .INIT_LUT1(16'b0000111100000011),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u513|u_cpu/u_execute/reg7_b8  (
    .a({open_n2471,_al_u544_o}),
    .b(\u_cpu/read_abcd [1:0]),
    .c({\u_cpu/u_execute/dbg_info_en0 ,\u_cpu/u_execute/dbg_info_en0 }),
    .clk(vga_clk_pad),
    .d({\u_cpu/read_abcd [0],bus_wdata[0]}),
    .f({_al_u513_o,open_n2486}),
    .q({open_n2490,\u_cpu/dbg_info [8]}));  // sources/rtl/mcu/execute.v(351)
  // sources/rtl/mcu/debug.v(180)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(~C*B))"),
    //.LUTF1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    //.LUTG0("(~D*~(~C*B))"),
    //.LUTG1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110011),
    .INIT_LUTF1(16'b0000010000010101),
    .INIT_LUTG0(16'b0000000011110011),
    .INIT_LUTG1(16'b0000010000010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u516|u_cpu/u_debug/reg6_b1  (
    .a({\u_cpu/read_abcd [2],open_n2491}),
    .b({\u_cpu/read_abcd [3],\u_cpu/dbg_info_en }),
    .c({bus_raddr[1],\u_cpu/dbg_info [1]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/dbg_info [1],_al_u357_o}),
    .f({_al_u516_o,open_n2510}),
    .q({open_n2514,send_data[1]}));  // sources/rtl/mcu/debug.v(180)
  // sources/rtl/mcu/execute.v(351)
  EG_PHY_MSLICE #(
    //.LUT0("~(~C*~(D)*~(B)+~C*D*~(B)+~(~C)*D*B+~C*D*B)"),
    //.LUT1("(~(D*C)*~(~B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000011111100),
    .INIT_LUT1(16'b0000110111011101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u517|u_cpu/u_execute/reg7_b1  (
    .a({_al_u515_o,open_n2515}),
    .b({_al_u516_o,_al_u513_o}),
    .c({\u_cpu/read_abcd [0],\u_cpu/alu_in2 [1]}),
    .clk(vga_clk_pad),
    .d({bus_wdata[1],_al_u517_o}),
    .f({_al_u517_o,open_n2530}),
    .q({open_n2534,\u_cpu/dbg_info [1]}));  // sources/rtl/mcu/execute.v(351)
  // sources/rtl/mcu/debug.v(180)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(~C*B))"),
    //.LUTF1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    //.LUTG0("(~D*~(~C*B))"),
    //.LUTG1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110011),
    .INIT_LUTF1(16'b0000010000010101),
    .INIT_LUTG0(16'b0000000011110011),
    .INIT_LUTG1(16'b0000010000010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u520|u_cpu/u_debug/reg6_b2  (
    .a({\u_cpu/read_abcd [2],open_n2535}),
    .b({\u_cpu/read_abcd [3],\u_cpu/dbg_info_en }),
    .c({bus_raddr[2],\u_cpu/dbg_info [2]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/dbg_info [2],_al_u359_o}),
    .f({_al_u520_o,open_n2554}),
    .q({open_n2558,send_data[2]}));  // sources/rtl/mcu/debug.v(180)
  // sources/rtl/mcu/execute.v(351)
  EG_PHY_MSLICE #(
    //.LUT0("~(~C*~(D)*~(B)+~C*D*~(B)+~(~C)*D*B+~C*D*B)"),
    //.LUT1("(~(D*C)*~(~B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000011111100),
    .INIT_LUT1(16'b0000110111011101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u521|u_cpu/u_execute/reg7_b2  (
    .a({_al_u519_o,open_n2559}),
    .b({_al_u520_o,_al_u513_o}),
    .c({\u_cpu/read_abcd [0],\u_cpu/alu_in2 [2]}),
    .clk(vga_clk_pad),
    .d({bus_wdata[2],_al_u521_o}),
    .f({_al_u521_o,open_n2574}),
    .q({open_n2578,\u_cpu/dbg_info [2]}));  // sources/rtl/mcu/execute.v(351)
  // sources/rtl/mcu/execute.v(287)
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(C*D))"),
    //.LUT1("(D*~(~C*B))"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000001100110011),
    .INIT_LUT1(16'b1111001100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u523|u_cpu/u_execute/reg4_b3  (
    .b({\u_cpu/read_abcd [2],\u_cpu/u_execute/wt_ram_cmd [1]}),
    .c({\u_cpu/u_execute/C [3],\u_cpu/u_execute/wt_ram_cmd [2]}),
    .ce(\u_bus/eq0/or_or_or_xor_i0[0]_i_o ),
    .clk(vga_clk_pad),
    .d({_al_u392_o,\u_cpu/u_execute/C [3]}),
    .mi({open_n2591,\u_cpu/u_execute/C [3]}),
    .f({_al_u523_o,_al_u990_o}),
    .q({open_n2596,\u_cpu/pc_wdata [3]}));  // sources/rtl/mcu/execute.v(287)
  // sources/rtl/mcu/execute.v(276)
  EG_PHY_LSLICE #(
    //.LUTF0("~(C*~(B*~(D*A)))"),
    //.LUTF1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    //.LUTG0("~(C*~(B*~(D*A)))"),
    //.LUTG1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0100111111001111),
    .INIT_LUTF1(16'b0000010000010101),
    .INIT_LUTG0(16'b0100111111001111),
    .INIT_LUTG1(16'b0000010000010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u524|u_cpu/u_execute/reg3_b3  (
    .a({\u_cpu/read_abcd [2],_al_u875_o}),
    .b({\u_cpu/read_abcd [3],_al_u885_o}),
    .c({bus_raddr[3],_al_u886_o}),
    .clk(vga_clk_pad),
    .d({\u_cpu/dbg_info [3],\u_cpu/u_execute/ram_to_d_wen }),
    .f({_al_u524_o,open_n2615}),
    .q({open_n2619,bus_raddr[3]}));  // sources/rtl/mcu/execute.v(276)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTF1("(~(D*C)*~(~B*A))"),
    //.LUTG0("(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTG1("(~(D*C)*~(~B*A))"),
    .INIT_LUTF0(16'b1100111111000000),
    .INIT_LUTF1(16'b0000110111011101),
    .INIT_LUTG0(16'b1100111111000000),
    .INIT_LUTG1(16'b0000110111011101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u525|_al_u704  (
    .a({_al_u523_o,open_n2620}),
    .b({_al_u524_o,bus_wdata[3]}),
    .c({\u_cpu/read_abcd [0],\u_cpu/alu_in2 [0]}),
    .d(bus_wdata[3:2]),
    .f({_al_u525_o,\u_cpu/u_alu/n2_lutinv }));
  // sources/rtl/mcu/debug.v(180)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(~C*B))"),
    //.LUT1("(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110011),
    .INIT_LUT1(16'b1100110011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u527|u_cpu/u_debug/reg6_b4  (
    .b({bus_raddr[4],\u_cpu/dbg_info_en }),
    .c({\u_cpu/dbg_info [4],\u_cpu/dbg_info [4]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/read_abcd [3],_al_u363_o}),
    .f({\u_cpu/u_execute/n35 [4],open_n2661}),
    .q({open_n2665,send_data[4]}));  // sources/rtl/mcu/debug.v(180)
  // sources/rtl/mcu/debug.v(109)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(~C*~B*~D)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(~C*~B*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b0000000000000011),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b0000000000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u528|u_cpu/u_debug/reg1_b1  (
    .b({\u_cpu/read_abcd [1],recv_cmd[0]}),
    .c({\u_cpu/u_execute/dbg_info_en0 ,recv_cmd[1]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/read_abcd [0],_al_u673_o}),
    .f({_al_u528_o,open_n2686}),
    .q({open_n2690,\u_cpu/read_abcd [1]}));  // sources/rtl/mcu/debug.v(109)
  // sources/rtl/mcu/execute.v(351)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~A*~(~D*~B))"),
    //.LUTF1("(B*~(A*~(D)*~(C)+A*D*~(C)+~(A)*D*C+A*D*C))"),
    //.LUTG0("(~C*~A*~(~D*~B))"),
    //.LUTG1("(B*~(A*~(D)*~(C)+A*D*~(C)+~(A)*D*C+A*D*C))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000010100000100),
    .INIT_LUTF1(16'b0000010011000100),
    .INIT_LUTG0(16'b0000010100000100),
    .INIT_LUTG1(16'b0000010011000100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u529|u_cpu/u_execute/reg7_b4  (
    .a({\u_cpu/u_execute/n35 [4],_al_u529_o}),
    .b({_al_u528_o,_al_u513_o}),
    .c({\u_cpu/read_abcd [2],_al_u530_o}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/C [4],\u_cpu/alu_in2 [4]}),
    .f({_al_u529_o,open_n2709}),
    .q({open_n2713,\u_cpu/dbg_info [4]}));  // sources/rtl/mcu/execute.v(351)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(~C*B))"),
    //.LUT1("(D*~(C*B))"),
    .INIT_LUT0(16'b1111001100000000),
    .INIT_LUT1(16'b0011111100000000),
    .MODE("LOGIC"))
    \_al_u532|_al_u540  (
    .b({\u_cpu/read_abcd [2],\u_cpu/read_abcd [2]}),
    .c({\u_cpu/u_execute/C [5],\u_cpu/u_execute/C [7]}),
    .d({_al_u392_o,_al_u392_o}),
    .f({_al_u532_o,_al_u540_o}));
  // sources/rtl/mcu/debug.v(180)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(~C*B))"),
    //.LUTF1("(~A*(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    //.LUTG0("(~D*~(~C*B))"),
    //.LUTG1("(~A*(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110011),
    .INIT_LUTF1(16'b0101000101000000),
    .INIT_LUTG0(16'b0000000011110011),
    .INIT_LUTG1(16'b0101000101000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u533|u_cpu/u_debug/reg6_b5  (
    .a({\u_cpu/read_abcd [2],open_n2736}),
    .b({\u_cpu/read_abcd [3],\u_cpu/dbg_info_en }),
    .c({bus_raddr[5],\u_cpu/dbg_info [5]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/dbg_info [5],_al_u365_o}),
    .f({_al_u533_o,open_n2755}),
    .q({open_n2759,send_data[5]}));  // sources/rtl/mcu/debug.v(180)
  // sources/rtl/mcu/execute.v(351)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B)"),
    //.LUTF1("(~(~D*C)*~(~B*A))"),
    //.LUTG0("(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B)"),
    //.LUTG1("(~(~D*C)*~(~B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111110000110000),
    .INIT_LUTF1(16'b1101110100001101),
    .INIT_LUTG0(16'b1111110000110000),
    .INIT_LUTG1(16'b1101110100001101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u534|u_cpu/u_execute/reg7_b5  (
    .a({_al_u532_o,open_n2760}),
    .b({_al_u533_o,_al_u513_o}),
    .c({\u_cpu/read_abcd [0],\u_cpu/alu_in2 [5]}),
    .clk(vga_clk_pad),
    .d({bus_wdata[5],_al_u534_o}),
    .f({_al_u534_o,open_n2779}),
    .q({open_n2783,\u_cpu/dbg_info [5]}));  // sources/rtl/mcu/execute.v(351)
  // sources/rtl/mcu/debug.v(180)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(~C*B))"),
    //.LUTF1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    //.LUTG0("(~D*~(~C*B))"),
    //.LUTG1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110011),
    .INIT_LUTF1(16'b0000010000010101),
    .INIT_LUTG0(16'b0000000011110011),
    .INIT_LUTG1(16'b0000010000010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u537|u_cpu/u_debug/reg6_b6  (
    .a({\u_cpu/read_abcd [2],open_n2784}),
    .b({\u_cpu/read_abcd [3],\u_cpu/dbg_info_en }),
    .c({bus_raddr[6],\u_cpu/dbg_info [6]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/dbg_info [6],_al_u367_o}),
    .f({_al_u537_o,open_n2803}),
    .q({open_n2807,send_data[6]}));  // sources/rtl/mcu/debug.v(180)
  // sources/rtl/mcu/execute.v(351)
  EG_PHY_MSLICE #(
    //.LUT0("~(~C*~(D)*~(B)+~C*D*~(B)+~(~C)*D*B+~C*D*B)"),
    //.LUT1("(~(D*C)*~(~B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000011111100),
    .INIT_LUT1(16'b0000110111011101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u538|u_cpu/u_execute/reg7_b6  (
    .a({_al_u536_o,open_n2808}),
    .b({_al_u537_o,_al_u513_o}),
    .c({\u_cpu/read_abcd [0],\u_cpu/alu_in2 [6]}),
    .clk(vga_clk_pad),
    .d({bus_wdata[6],_al_u538_o}),
    .f({_al_u538_o,open_n2823}),
    .q({open_n2827,\u_cpu/dbg_info [6]}));  // sources/rtl/mcu/execute.v(351)
  // sources/rtl/mcu/debug.v(180)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(~C*B))"),
    //.LUT1("(~A*~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110011),
    .INIT_LUT1(16'b0000010000010101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u541|u_cpu/u_debug/reg6_b0  (
    .a({\u_cpu/read_abcd [2],open_n2828}),
    .b({\u_cpu/read_abcd [3],\u_cpu/dbg_info_en }),
    .c({bus_raddr[7],\u_cpu/dbg_info [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/dbg_info [7],_al_u355_o}),
    .f({_al_u541_o,open_n2843}),
    .q({open_n2847,send_data[0]}));  // sources/rtl/mcu/debug.v(180)
  // sources/rtl/mcu/execute.v(351)
  EG_PHY_MSLICE #(
    //.LUT0("~(~C*~(D)*~(B)+~C*D*~(B)+~(~C)*D*B+~C*D*B)"),
    //.LUT1("(~(D*C)*~(~B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000011111100),
    .INIT_LUT1(16'b0000110111011101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u542|u_cpu/u_execute/reg7_b7  (
    .a({_al_u540_o,open_n2848}),
    .b({_al_u541_o,_al_u513_o}),
    .c({\u_cpu/read_abcd [0],\u_cpu/alu_in2 [7]}),
    .clk(vga_clk_pad),
    .d({bus_wdata[7],_al_u542_o}),
    .f({_al_u542_o,open_n2863}),
    .q({open_n2867,\u_cpu/dbg_info [7]}));  // sources/rtl/mcu/execute.v(351)
  // sources/rtl/mcu/debug.v(136)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(~A*~(~B*~(~D*~C)))"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(~A*~(~B*~(~D*~C)))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b0100010001000101),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b0100010001000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u544|u_cpu/u_debug/reg3_b0  (
    .a({\u_cpu/read_abcd [1],open_n2868}),
    .b({\u_cpu/read_abcd [2],recv_cmd[0]}),
    .c({\u_cpu/read_abcd [3],recv_cmd[1]}),
    .ce(\u_cpu/u_debug/n5 ),
    .clk(vga_clk_pad),
    .d({\u_cpu/dbg_info [8],_al_u472_o}),
    .mi({open_n2872,recv_data[0]}),
    .sr(\u_cpu/u_debug/clear_rom_data_cmd ),
    .f({_al_u544_o,\u_cpu/u_debug/clear_rom_data_cmd }),
    .q({open_n2887,rom_wdata[0]}));  // sources/rtl/mcu/debug.v(136)
  // sources/rtl/key/key.v(43)
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*B*A)"),
    //.LUT1("(C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1000000000000000),
    .INIT_LUT1(16'b1100000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u553|u_key/reg3_b3  (
    .a({open_n2888,\u_key/cnt [3]}),
    .b({_al_u551_o,\u_key/cnt [4]}),
    .c({_al_u552_o,\u_key/cnt [5]}),
    .clk(vga_clk_pad),
    .d({_al_u550_o,\u_key/cnt [6]}),
    .mi({open_n2900,\u_key/n3 [3]}),
    .f({_al_u553_o,_al_u551_o}),
    .q({open_n2905,\u_key/cnt [3]}));  // sources/rtl/key/key.v(43)
  // sources/rtl/key/key.v(43)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(D*C*B*A)"),
    //.LUTG1("(C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u556|u_key/reg3_b12  (
    .a({open_n2906,\u_key/cnt [12]}),
    .b({_al_u554_o,\u_key/cnt [13]}),
    .c({_al_u555_o,\u_key/cnt [14]}),
    .clk(vga_clk_pad),
    .d({_al_u553_o,\u_key/cnt [15]}),
    .mi({open_n2911,\u_key/n3 [12]}),
    .f({\u_key/n14 ,_al_u554_o}),
    .q({open_n2927,\u_key/cnt [12]}));  // sources/rtl/key/key.v(43)
  // sources/rtl/uart/uart_rx.v(118)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~C*~B*A)"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(D*~C*~B*A)"),
    //.LUTG1("(~C*~B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000001000000000),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b0000001000000000),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u557|u_uart/u_uart_rx/reg3_b0  (
    .a({open_n2928,\u_uart/u_uart_rx/cnt [0]}),
    .b(\u_uart/u_uart_rx/cnt [2:1]),
    .c(\u_uart/u_uart_rx/cnt [3:2]),
    .ce(\u_uart/u_uart_rx/n1 ),
    .clk(vga_clk_pad),
    .d({\u_uart/u_uart_rx/clk_en ,\u_uart/u_uart_rx/cnt [3]}),
    .mi({open_n2932,\u_uart/u_uart_rx/data [0]}),
    .f({_al_u557_o,\u_uart/u_uart_rx/n1 }),
    .q({open_n2948,\u_uart/rx_data [0]}));  // sources/rtl/uart/uart_rx.v(118)
  // sources/rtl/uart/uart_rx.v(105)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(~C*B*D)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(~C*B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u561|u_uart/u_uart_rx/reg2_b6  (
    .b({\u_uart/u_uart_rx/cnt [2],\u_uart/u_uart_rx/cnt [0]}),
    .c({\u_uart/u_uart_rx/cnt [3],\u_uart/u_uart_rx/cnt [1]}),
    .ce(\u_uart/u_uart_rx/mux4_b6_sel_is_3_o ),
    .clk(vga_clk_pad),
    .d({\u_uart/u_uart_rx/clk_en ,_al_u561_o}),
    .mi({open_n2954,rx_pad}),
    .f({_al_u561_o,\u_uart/u_uart_rx/mux4_b6_sel_is_3_o }),
    .q({open_n2970,\u_uart/u_uart_rx/data [6]}));  // sources/rtl/uart/uart_rx.v(105)
  // sources/rtl/uart/uart_rx.v(105)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*D)"),
    //.LUTF1("(C*~B*D)"),
    //.LUTG0("(C*~B*D)"),
    //.LUTG1("(C*~B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011000000000000),
    .INIT_LUTF1(16'b0011000000000000),
    .INIT_LUTG0(16'b0011000000000000),
    .INIT_LUTG1(16'b0011000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u566|u_uart/u_uart_rx/reg2_b5  (
    .b({\u_uart/u_uart_rx/cnt [2],\u_uart/u_uart_rx/cnt [0]}),
    .c({\u_uart/u_uart_rx/cnt [3],\u_uart/u_uart_rx/cnt [1]}),
    .ce(\u_uart/u_uart_rx/mux4_b5_sel_is_3_o ),
    .clk(vga_clk_pad),
    .d({\u_uart/u_uart_rx/clk_en ,_al_u561_o}),
    .mi({open_n2976,rx_pad}),
    .f({_al_u566_o,\u_uart/u_uart_rx/mux4_b5_sel_is_3_o }),
    .q({open_n2992,\u_uart/u_uart_rx/data [5]}));  // sources/rtl/uart/uart_rx.v(105)
  // sources/rtl/uart/ubus.v(118)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~C*B*A)"),
    //.LUTF1("(D*C*B*A)"),
    //.LUTG0("(D*~C*B*A)"),
    //.LUTG1("(D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000100000000000),
    .INIT_LUTF1(16'b1000000000000000),
    .INIT_LUTG0(16'b0000100000000000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u569|u_uart/u_ubus/frame_head_flag4_reg  (
    .a({\u_uart/u_ubus/frame_head_flag2 ,_al_u665_o}),
    .b({\u_uart/u_ubus/frame_head_flag3 ,_al_u666_o}),
    .c({\u_uart/u_ubus/frame_head_flag4 ,\u_uart/u_ubus/shift_reg6 [0]}),
    .clk(vga_clk_pad),
    .d({\u_uart/u_ubus/frame_head_flag5 ,\u_uart/u_ubus/shift_reg6 [1]}),
    .f({_al_u569_o,open_n3011}),
    .q({open_n3015,\u_uart/u_ubus/frame_head_flag4 }));  // sources/rtl/uart/ubus.v(118)
  // sources/rtl/vga/vram.v(144)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~C*~D)"),
    //.LUTF1("(~C*~B*~D)"),
    //.LUTG0("~(~C*~D)"),
    //.LUTG1("(~C*~B*~D)"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111111111110000),
    .INIT_LUTF1(16'b0000000000000011),
    .INIT_LUTG0(16'b1111111111110000),
    .INIT_LUTG1(16'b0000000000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u574|u_vram/reg9_b20  (
    .b({\u_vram/n12 ,open_n3018}),
    .c({\u_vram/n14 ,\u_vram/n23_lutinv }),
    .clk(vga_clk_pad),
    .d({\u_vram/n10 ,\u_vram/n24_lutinv }),
    .sr(\u_vram/mux3_b12_sel_is_1_o ),
    .f({_al_u574_o,\u_vram/n26[11]_d }),
    .q({open_n3039,vga_rgb_pad[22]}));  // sources/rtl/vga/vram.v(144)
  // sources/rtl/mcu/fetch.v(113)
  EG_PHY_MSLICE #(
    //.LUT0("(~A*~(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    //.LUT1("(~D*~C*~B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000101010001),
    .INIT_LUT1(16'b0000000000000001),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u589|u_cpu/u_fetch/reg3_b5  (
    .a({\u_cpu/u_decode/inst_d [4],\u_cpu/dbg_inst_en }),
    .b({\u_cpu/u_decode/inst_d [5],\u_cpu/inst [5]}),
    .c({\u_cpu/u_decode/inst_d [6],\u_cpu/u_fetch/rom_bk_en }),
    .ce(\u_cpu/dbg_en ),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_decode/inst_d [7],rom_rdata[5]}),
    .mi({open_n3050,rom_rdata[5]}),
    .f({_al_u589_o,_al_u379_o}),
    .q({open_n3055,\u_cpu/dbg_rom_rdata [5]}));  // sources/rtl/mcu/fetch.v(113)
  // sources/rtl/mcu/fetch.v(106)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(~C*B))"),
    //.LUT1("(~C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110011),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u590|u_cpu/u_fetch/reg2_b6  (
    .b({open_n3058,\u_cpu/dbg_inst_en }),
    .c({\u_cpu/u_decode/inst_d [1],\u_cpu/dbg_inst [6]}),
    .clk(vga_clk_pad),
    .d({_al_u589_o,_al_u385_o}),
    .f({_al_u590_o,open_n3073}),
    .q({open_n3077,\u_cpu/inst [6]}));  // sources/rtl/mcu/fetch.v(106)
  // sources/rtl/mcu/decode.v(104)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~D*~C*B*A)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~D*~C*B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u593|u_cpu/u_decode/inst_data_reg  (
    .a({_al_u589_o,open_n3078}),
    .b({\u_cpu/u_decode/inst_d [1],open_n3079}),
    .c({\u_cpu/u_decode/inst_d [2],_al_u607_o}),
    .ce(\u_cpu/inst_en ),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_decode/inst_d [3],_al_u940_o}),
    .f({_al_u593_o,open_n3097}),
    .q({open_n3101,\u_cpu/u_decode/inst_data }));  // sources/rtl/mcu/decode.v(104)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(~C*B))"),
    //.LUT1("(~D*~C*B*A)"),
    .INIT_LUT0(16'b1111001100000000),
    .INIT_LUT1(16'b0000000000001000),
    .MODE("LOGIC"))
    \_al_u598|_al_u536  (
    .a({_al_u395_o,open_n3102}),
    .b({bus_raddr[0],\u_cpu/read_abcd [2]}),
    .c({bus_raddr[2],\u_cpu/u_execute/C [6]}),
    .d({bus_raddr[3],_al_u392_o}),
    .f({\u_bus/n1_lutinv ,_al_u536_o}));
  // sources/rtl/mcu/execute.v(287)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(~C*~D)"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u686|u_cpu/u_execute/reg4_b11  (
    .c({\u_cpu/alu_in2 [4],\u_cpu/u_execute/wt_ram_cmd [1]}),
    .ce(\u_bus/eq0/or_or_or_xor_i0[0]_i_o ),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_in2 [3],\u_cpu/alu_in2 [3]}),
    .mi({open_n3137,\u_cpu/alu_in2 [3]}),
    .f({_al_u686_o,_al_u992_o}),
    .q({open_n3142,\u_cpu/pc_wdata [11]}));  // sources/rtl/mcu/execute.v(287)
  // sources/rtl/mcu/execute.v(301)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u689|u_cpu/u_execute/reg6_b9  (
    .b({_al_u687_o,_al_u687_o}),
    .c({_al_u688_o,\u_cpu/alu_cmd [9]}),
    .clk(vga_clk_pad),
    .d({_al_u686_o,_al_u686_o}),
    .mi({open_n3149,\u_cpu/decode_cmd [24]}),
    .f({_al_u689_o,_al_u699_o}),
    .q({open_n3165,\u_cpu/alu_cmd [9]}));  // sources/rtl/mcu/execute.v(301)
  // sources/rtl/mcu/bus.v(62)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(~D*~C*~B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000000000001),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u691|u_bus/led_reg  (
    .a({bus_wdata[0],open_n3166}),
    .b({bus_wdata[1],open_n3167}),
    .c({bus_wdata[2],bus_wen}),
    .ce(\u_bus/u6_sel_is_3_o ),
    .clk(vga_clk_pad),
    .d({bus_wdata[3],\u_bus/eq0/or_or_or_xor_i0[0]_i_o }),
    .mi({open_n3178,bus_wdata[0]}),
    .f({_al_u691_o,\u_bus/u6_sel_is_3_o }),
    .q({open_n3183,led_pad}));  // sources/rtl/mcu/bus.v(62)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*~B*~A)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000000000000001),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u692|_al_u690  (
    .a({open_n3184,bus_wdata[4]}),
    .b({open_n3185,bus_wdata[5]}),
    .c({_al_u691_o,bus_wdata[6]}),
    .d({_al_u690_o,bus_wdata[7]}),
    .f({_al_u692_o,_al_u690_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*~(~D*~A))"),
    //.LUTF1("(C*~B*~D)"),
    //.LUTG0("(~C*~B*~(~D*~A))"),
    //.LUTG1("(C*~B*~D)"),
    .INIT_LUTF0(16'b0000001100000010),
    .INIT_LUTF1(16'b0000000000110000),
    .INIT_LUTG0(16'b0000001100000010),
    .INIT_LUTG1(16'b0000000000110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u693|_al_u436  (
    .a({open_n3206,\u_cpu/alu_out3 [2]}),
    .b({_al_u692_o,\u_cpu/alu_cmd [6]}),
    .c({\u_cpu/alu_cmd [5],\u_cpu/alu_cmd [7]}),
    .d({_al_u689_o,\u_cpu/alu_cmd [8]}),
    .f({_al_u693_o,_al_u436_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u694|_al_u700  (
    .c({\u_cpu/alu_in2 [0],\u_cpu/alu_in2 [0]}),
    .d({bus_wdata[0],bus_wdata[0]}),
    .f({_al_u694_o,_al_u700_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(A*~(~C*~(B)*~(D)+~C*B*~(D)+~(~C)*B*D+~C*B*D))"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(A*~(~C*~(B)*~(D)+~C*B*~(D)+~(~C)*B*D+~C*B*D))"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b0010001010100000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b0010001010100000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u702|_al_u720  (
    .a({open_n3259,_al_u702_o}),
    .b({_al_u687_o,_al_u716_o}),
    .c({\u_cpu/alu_cmd [10],\u_cpu/u_alu/n62_lutinv }),
    .d({_al_u686_o,\u_cpu/alu_in2 [2]}),
    .f({_al_u702_o,_al_u720_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(~D*~A*~(C*~B))"),
    //.LUTG0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(~D*~A*~(C*~B))"),
    .INIT_LUTF0(16'b0000000000110101),
    .INIT_LUTF1(16'b0000000001000101),
    .INIT_LUTG0(16'b0000000000110101),
    .INIT_LUTG1(16'b0000000001000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u705|_al_u703  (
    .a({_al_u703_o,bus_wdata[0]}),
    .b({\u_cpu/u_alu/n2_lutinv ,bus_wdata[1]}),
    .c(\u_cpu/alu_in2 [1:0]),
    .d(\u_cpu/alu_in2 [2:1]),
    .f({_al_u705_o,_al_u703_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUT1("(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUT0(16'b1100111111000000),
    .INIT_LUT1(16'b1100111111000000),
    .MODE("LOGIC"))
    \_al_u707|_al_u715  (
    .b(bus_wdata[7:6]),
    .c({\u_cpu/alu_in2 [0],\u_cpu/alu_in2 [0]}),
    .d(bus_wdata[6:5]),
    .f({\u_cpu/u_alu/n65_lutinv ,\u_cpu/u_alu/n78_lutinv }));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTF1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTG0("(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTG1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUTF0(16'b1100111111000000),
    .INIT_LUTF1(16'b0011000000111111),
    .INIT_LUTG0(16'b1100111111000000),
    .INIT_LUTG1(16'b0011000000111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u708|_al_u706  (
    .b({\u_cpu/u_alu/n65_lutinv ,bus_wdata[5]}),
    .c(\u_cpu/alu_in2 [1:0]),
    .d({\u_cpu/u_alu/n0_lutinv ,bus_wdata[4]}),
    .f({_al_u708_o,\u_cpu/u_alu/n0_lutinv }));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*D)"),
    //.LUT1("(A*~(~B*~(D*~C)))"),
    .INIT_LUT0(16'b0000001100000000),
    .INIT_LUT1(16'b1000101010001000),
    .MODE("LOGIC"))
    \_al_u709|_al_u725  (
    .a({_al_u702_o,open_n3356}),
    .b({_al_u705_o,_al_u724_o}),
    .c({_al_u708_o,\u_cpu/alu_in2 [2]}),
    .d({\u_cpu/alu_in2 [2],_al_u699_o}),
    .f({_al_u709_o,_al_u725_o}));
  // sources/rtl/mcu/alu.v(84)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~A*~(~D*~(~C*~B)))"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("~(~A*~(~D*~(~C*~B)))"),
    //.LUTG1("(~C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1010101011111110),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1010101011111110),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u710|u_cpu/u_alu/reg3_b0  (
    .a({open_n3377,_al_u701_o}),
    .b({open_n3378,_al_u709_o}),
    .c({\u_cpu/alu_cmd [10],_al_u710_o}),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_out4 [0],\u_cpu/alu_cmd [9]}),
    .f({_al_u710_o,open_n3397}),
    .q({open_n3401,\u_cpu/alu_out4 [0]}));  // sources/rtl/mcu/alu.v(84)
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1111110000001100),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u713|_al_u712  (
    .b({open_n3404,bus_wdata[1]}),
    .c(\u_cpu/alu_in2 [1:0]),
    .d({\u_cpu/u_alu/n29_lutinv ,bus_wdata[0]}),
    .f({\u_cpu/u_alu/n21_lutinv ,\u_cpu/u_alu/n29_lutinv }));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*D)"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b0000001100000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u714|_al_u733  (
    .b({\u_cpu/u_alu/n21_lutinv ,_al_u732_o}),
    .c({\u_cpu/alu_in2 [2],\u_cpu/alu_in2 [2]}),
    .d({_al_u699_o,_al_u699_o}),
    .f({_al_u714_o,_al_u733_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*~D)"),
    //.LUTF1("~(A*~((~C*B))*~(D)+A*(~C*B)*~(D)+~(A)*(~C*B)*D+A*(~C*B)*D)"),
    //.LUTG0("(~C*~B*~D)"),
    //.LUTG1("~(A*~((~C*B))*~(D)+A*(~C*B)*~(D)+~(A)*(~C*B)*D+A*(~C*B)*D)"),
    .INIT_LUTF0(16'b0000000000000011),
    .INIT_LUTF1(16'b1111001101010101),
    .INIT_LUTG0(16'b0000000000000011),
    .INIT_LUTG1(16'b1111001101010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u716|_al_u688  (
    .a({\u_cpu/u_alu/n78_lutinv ,open_n3447}),
    .b({bus_wdata[7],\u_cpu/alu_in2 [1]}),
    .c({\u_cpu/alu_in2 [0],\u_cpu/alu_in2 [2]}),
    .d(\u_cpu/alu_in2 [1:0]),
    .f({_al_u716_o,_al_u688_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C)"),
    //.LUTF1("(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTG0("(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C)"),
    //.LUTG1("(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUTF0(16'b1111110000001100),
    .INIT_LUTF1(16'b1100111111000000),
    .INIT_LUTG0(16'b1111110000001100),
    .INIT_LUTG1(16'b1100111111000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u718|_al_u723  (
    .b({bus_wdata[2],bus_wdata[2]}),
    .c({\u_cpu/alu_in2 [0],\u_cpu/alu_in2 [0]}),
    .d({bus_wdata[1],bus_wdata[1]}),
    .f({\u_cpu/u_alu/n51_lutinv ,\u_cpu/u_alu/n30_lutinv }));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C)"),
    //.LUTG0("(~D*~(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C)"),
    .INIT_LUTF0(16'b0000000001010011),
    .INIT_LUTF1(16'b1111110000001100),
    .INIT_LUTG0(16'b0000000001010011),
    .INIT_LUTG1(16'b1111110000001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u719|_al_u734  (
    .a({open_n3498,\u_cpu/u_alu/n78_lutinv }),
    .b({\u_cpu/u_alu/n51_lutinv ,\u_cpu/u_alu/n1_lutinv }),
    .c({\u_cpu/alu_in2 [1],\u_cpu/alu_in2 [1]}),
    .d({\u_cpu/u_alu/n1_lutinv ,\u_cpu/alu_in2 [2]}),
    .f({\u_cpu/u_alu/n62_lutinv ,_al_u734_o}));
  // sources/rtl/mcu/alu.v(84)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~A*~(~D*~(~C*~B)))"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("~(~A*~(~D*~(~C*~B)))"),
    //.LUTG1("(~C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1010101011111110),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1010101011111110),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u721|u_cpu/u_alu/reg3_b1  (
    .a({open_n3523,_al_u714_o}),
    .b({open_n3524,_al_u720_o}),
    .c({\u_cpu/alu_cmd [10],_al_u721_o}),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_out4 [1],\u_cpu/alu_cmd [9]}),
    .f({_al_u721_o,open_n3543}),
    .q({open_n3547,\u_cpu/alu_out4 [1]}));  // sources/rtl/mcu/alu.v(84)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*B*A)"),
    //.LUT1("~(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C)"),
    .INIT_LUT0(16'b0000000000001000),
    .INIT_LUT1(16'b0000001111110011),
    .MODE("LOGIC"))
    \_al_u724|_al_u701  (
    .a({open_n3548,_al_u699_o}),
    .b({\u_cpu/u_alu/n30_lutinv ,_al_u700_o}),
    .c({\u_cpu/alu_in2 [1],\u_cpu/alu_in2 [1]}),
    .d({_al_u700_o,\u_cpu/alu_in2 [2]}),
    .f({_al_u724_o,_al_u701_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~B*A*~(D*~C))"),
    .INIT_LUT0(16'b0000000000110101),
    .INIT_LUT1(16'b0010000000100010),
    .MODE("LOGIC"))
    \_al_u728|_al_u726  (
    .a({_al_u702_o,\u_cpu/u_alu/n2_lutinv }),
    .b({_al_u726_o,\u_cpu/u_alu/n0_lutinv }),
    .c({\u_cpu/u_alu/n76_lutinv ,\u_cpu/alu_in2 [1]}),
    .d({\u_cpu/alu_in2 [2],\u_cpu/alu_in2 [2]}),
    .f({_al_u728_o,_al_u726_o}));
  // sources/rtl/mcu/alu.v(84)
  EG_PHY_MSLICE #(
    //.LUT0("~(~A*~(~D*~(~C*~B)))"),
    //.LUT1("(~C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1010101011111110),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u729|u_cpu/u_alu/reg3_b2  (
    .a({open_n3589,_al_u725_o}),
    .b({open_n3590,_al_u728_o}),
    .c({\u_cpu/alu_cmd [10],_al_u729_o}),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_out4 [2],\u_cpu/alu_cmd [9]}),
    .f({_al_u729_o,open_n3605}),
    .q({open_n3609,\u_cpu/alu_out4 [2]}));  // sources/rtl/mcu/alu.v(84)
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C)"),
    //.LUTF1("~(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C)"),
    //.LUTG0("(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C)"),
    //.LUTG1("~(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C)"),
    .INIT_LUTF0(16'b1111110000001100),
    .INIT_LUTF1(16'b0000001111110011),
    .INIT_LUTG0(16'b1111110000001100),
    .INIT_LUTG1(16'b0000001111110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u732|_al_u731  (
    .b({\u_cpu/u_alu/n31_lutinv ,bus_wdata[3]}),
    .c(\u_cpu/alu_in2 [1:0]),
    .d({\u_cpu/u_alu/n29_lutinv ,bus_wdata[2]}),
    .f({_al_u732_o,\u_cpu/u_alu/n31_lutinv }));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"))
    \_al_u736|_al_u796  (
    .c(\u_cpu/alu_in2 [2:1]),
    .d({\u_cpu/u_alu/n75_lutinv ,\u_cpu/u_alu/n32_lutinv }),
    .f({_al_u736_o,_al_u796_o}));
  // sources/rtl/mcu/alu.v(84)
  EG_PHY_MSLICE #(
    //.LUT0("~(~D*~(~C*~B))"),
    //.LUT1("(~D*~(~C*~B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111111100000011),
    .INIT_LUT1(16'b0000000011111101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u738|u_cpu/u_alu/reg3_b3  (
    .a({_al_u702_o,open_n3660}),
    .b({_al_u734_o,_al_u738_o}),
    .c({_al_u736_o,\u_cpu/alu_cmd [9]}),
    .clk(vga_clk_pad),
    .d({_al_u737_o,_al_u733_o}),
    .f({_al_u738_o,open_n3675}),
    .q({open_n3679,\u_cpu/alu_out4 [3]}));  // sources/rtl/mcu/alu.v(84)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*~D)"),
    //.LUTF1("(C*~(B@D))"),
    //.LUTG0("(~C*~B*~D)"),
    //.LUTG1("(C*~(B@D))"),
    .INIT_LUTF0(16'b0000000000000011),
    .INIT_LUTF1(16'b1100000000110000),
    .INIT_LUTG0(16'b0000000000000011),
    .INIT_LUTG1(16'b1100000000110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u740|_al_u687  (
    .b({\u_cpu/alu_in2 [6],\u_cpu/alu_in2 [6]}),
    .c({\u_cpu/alu_cmd [4],\u_cpu/alu_in2 [7]}),
    .d({bus_wdata[6],\u_cpu/alu_in2 [5]}),
    .f({_al_u740_o,_al_u687_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUT1("(~(D@B)*~(C@A))"),
    .INIT_LUT0(16'b1100111111000000),
    .INIT_LUT1(16'b1000010000100001),
    .MODE("LOGIC"))
    \_al_u742|_al_u717  (
    .a({bus_wdata[3],open_n3706}),
    .b({bus_wdata[4],bus_wdata[4]}),
    .c({\u_cpu/alu_in2 [3],\u_cpu/alu_in2 [0]}),
    .d({\u_cpu/alu_in2 [4],bus_wdata[3]}),
    .f({_al_u742_o,\u_cpu/u_alu/n1_lutinv }));
  // sources/rtl/mcu/execute.v(295)
  EG_PHY_LSLICE #(
    //.LUTF0("(~(D@B)*~(C@A))"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(~(D@B)*~(C@A))"),
    //.LUTG1("(C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1000010000100001),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b1000010000100001),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u743|u_cpu/u_execute/reg5_b21  (
    .a({open_n3727,bus_wdata[2]}),
    .b({_al_u741_o,bus_wdata[5]}),
    .c({_al_u742_o,\u_cpu/alu_in2 [2]}),
    .clk(vga_clk_pad),
    .d({_al_u740_o,\u_cpu/alu_in2 [5]}),
    .mi({open_n3732,bus_wdata[5]}),
    .f({_al_u743_o,_al_u741_o}),
    .q({open_n3748,\u_cpu/timer_wdata [21]}));  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/uart/uart_rx.v(74)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*~B*~A)"),
    //.LUT1("(D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000000001),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u752|u_uart/u_uart_rx/reg0_b6  (
    .a({_al_u748_o,\u_uart/u_uart_rx/clk_cnt [6]}),
    .b({_al_u749_o,\u_uart/u_uart_rx/clk_cnt [7]}),
    .c({_al_u750_o,\u_uart/u_uart_rx/clk_cnt [8]}),
    .clk(vga_clk_pad),
    .d({_al_u751_o,\u_uart/u_uart_rx/clk_cnt [9]}),
    .mi({open_n3760,\u_uart/u_uart_rx/n7 [6]}),
    .sr(\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .f({_al_u752_o,_al_u750_o}),
    .q({open_n3764,\u_uart/u_uart_rx/clk_cnt [6]}));  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u757|u_uart/u_uart_rx/reg0_b2  (
    .a({_al_u753_o,open_n3765}),
    .b({_al_u754_o,open_n3766}),
    .c({_al_u755_o,\u_uart/u_uart_rx/n7 [2]}),
    .clk(vga_clk_pad),
    .d({_al_u756_o,\u_uart/u_uart_rx/n5 }),
    .sr(\u_uart/u_uart_rx/start ),
    .f({_al_u757_o,open_n3780}),
    .q({open_n3784,\u_uart/u_uart_rx/clk_cnt [2]}));  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_tx.v(59)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*~B*~A)"),
    //.LUT1("(D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000000001),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u763|u_uart/u_uart_tx/reg2_b6  (
    .a({_al_u759_o,\u_uart/u_uart_tx/clk_cnt [6]}),
    .b({_al_u760_o,\u_uart/u_uart_tx/clk_cnt [7]}),
    .c({_al_u761_o,\u_uart/u_uart_tx/clk_cnt [8]}),
    .clk(vga_clk_pad),
    .d({_al_u762_o,\u_uart/u_uart_tx/clk_cnt [9]}),
    .mi({open_n3796,\u_uart/u_uart_tx/n1 [6]}),
    .sr(\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .f({_al_u763_o,_al_u761_o}),
    .q({open_n3800,\u_uart/u_uart_tx/clk_cnt [6]}));  // sources/rtl/uart/uart_tx.v(59)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(D*C*B*A)"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"))
    \_al_u768|_al_u859  (
    .a({_al_u764_o,open_n3801}),
    .b({_al_u765_o,open_n3802}),
    .c({_al_u766_o,\u_cpu/u_execute/rom_to_c_wen }),
    .d({_al_u767_o,\u_cpu/u_execute/rom_data [4]}),
    .f({_al_u768_o,_al_u859_o}));
  // sources/rtl/vga/vga.v(79)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(~D*~C*~B*A)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(~D*~C*~B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000000000010),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000000000010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u770|u_vga/reg0_b6  (
    .a({\u_vga/vsyn_cnt [3],open_n3823}),
    .b({\u_vga/vsyn_cnt [4],open_n3824}),
    .c({\u_vga/vsyn_cnt [5],\u_vga/n4 [6]}),
    .ce(\u_vga/n0 ),
    .clk(vga_clk_pad),
    .d({\u_vga/vsyn_cnt [6],\u_vga/n3_lutinv }),
    .f({_al_u770_o,open_n3842}),
    .q({open_n3846,\u_vga/vsyn_cnt [6]}));  // sources/rtl/vga/vga.v(79)
  // sources/rtl/vga/vga.v(79)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(D*~C*~B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000001000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u771|u_vga/reg0_b9  (
    .a({_al_u770_o,open_n3847}),
    .b({\u_vga/vsyn_cnt [7],open_n3848}),
    .c({\u_vga/vsyn_cnt [8],\u_vga/n4 [9]}),
    .ce(\u_vga/n0 ),
    .clk(vga_clk_pad),
    .d({\u_vga/vsyn_cnt [9],\u_vga/n3_lutinv }),
    .f({_al_u771_o,open_n3862}),
    .q({open_n3866,\u_vga/vsyn_cnt [9]}));  // sources/rtl/vga/vga.v(79)
  // sources/rtl/vga/vga.v(79)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(D*~C*~B*~A)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(D*~C*~B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000100000000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u772|u_vga/reg0_b2  (
    .a({\u_vga/vsyn_cnt [10],open_n3867}),
    .b({\u_vga/vsyn_cnt [11],open_n3868}),
    .c({\u_vga/vsyn_cnt [12],\u_vga/n4 [2]}),
    .ce(\u_vga/n0 ),
    .clk(vga_clk_pad),
    .d({\u_vga/vsyn_cnt [2],\u_vga/n3_lutinv }),
    .f({_al_u772_o,open_n3886}),
    .q({open_n3890,\u_vga/vsyn_cnt [2]}));  // sources/rtl/vga/vga.v(79)
  // sources/rtl/vga/vga.v(67)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~C*~B*~A)"),
    //.LUT1("(~D*~C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000100000000),
    .INIT_LUT1(16'b0000000000001000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u773|u_vga/reg3_b10  (
    .a({_al_u771_o,\u_vga/hsyn_cnt [10]}),
    .b({_al_u772_o,\u_vga/hsyn_cnt [11]}),
    .c({\u_vga/vsyn_cnt [0],\u_vga/hsyn_cnt [12]}),
    .clk(vga_clk_pad),
    .d({\u_vga/vsyn_cnt [1],\u_vga/hsyn_cnt [2]}),
    .mi({open_n3902,\u_vga/n1 [10]}),
    .sr(\u_vga/n0 ),
    .f({\u_vga/n3_lutinv ,_al_u683_o}),
    .q({open_n3906,\u_vga/hsyn_cnt [10]}));  // sources/rtl/vga/vga.v(67)
  // sources/rtl/mcu/execute.v(301)
  EG_PHY_LSLICE #(
    //.LUTF0("(~(~D*C)*~(B*~A))"),
    //.LUTF1("(D*~C*B*A)"),
    //.LUTG0("(~(~D*C)*~(B*~A))"),
    //.LUTG1("(D*~C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1011101100001011),
    .INIT_LUTF1(16'b0000100000000000),
    .INIT_LUTG0(16'b1011101100001011),
    .INIT_LUTG1(16'b0000100000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u787|u_cpu/u_execute/reg6_b10  (
    .a({_al_u686_o,_al_u708_o}),
    .b({_al_u687_o,_al_u787_o}),
    .c({\u_cpu/alu_in2 [2],\u_cpu/alu_out4 [4]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_cmd [10],\u_cpu/alu_cmd [10]}),
    .mi({open_n3911,\u_cpu/decode_cmd [25]}),
    .f({_al_u787_o,_al_u804_o}),
    .q({open_n3927,\u_cpu/alu_cmd [10]}));  // sources/rtl/mcu/execute.v(301)
  // sources/rtl/mcu/alu.v(84)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~(C*~B)*~(~D*~A))"),
    //.LUTF1("(~(~D*C)*~(B*A))"),
    //.LUTG0("~(~(C*~B)*~(~D*~A))"),
    //.LUTG1("(~(~D*C)*~(B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011000001110101),
    .INIT_LUTF1(16'b0111011100000111),
    .INIT_LUTG0(16'b0011000001110101),
    .INIT_LUTG1(16'b0111011100000111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u788|u_cpu/u_alu/reg3_b7  (
    .a({_al_u787_o,_al_u788_o}),
    .b({\u_cpu/u_alu/n75_lutinv ,_al_u792_o}),
    .c({\u_cpu/alu_out4 [7],_al_u699_o}),
    .clk(vga_clk_pad),
    .d(\u_cpu/alu_cmd [10:9]),
    .f({_al_u788_o,open_n3946}),
    .q({open_n3950,\u_cpu/alu_out4 [7]}));  // sources/rtl/mcu/alu.v(84)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(C*~D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u790|_al_u727  (
    .c({\u_cpu/alu_in2 [1],\u_cpu/alu_in2 [1]}),
    .d({\u_cpu/u_alu/n33_lutinv ,\u_cpu/u_alu/n65_lutinv }),
    .f({_al_u790_o,\u_cpu/u_alu/n76_lutinv }));
  // sources/rtl/mcu/execute.v(295)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("(~(~C*~B)*~(A)*~(D)+~(~C*~B)*A*~(D)+~(~(~C*~B))*A*D+~(~C*~B)*A*D)"),
    //.LUTG0("(~D*~(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("(~(~C*~B)*~(A)*~(D)+~(~C*~B)*A*~(D)+~(~(~C*~B))*A*D+~(~C*~B)*A*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000001010011),
    .INIT_LUTF1(16'b1010101011111100),
    .INIT_LUTG0(16'b0000000001010011),
    .INIT_LUTG1(16'b1010101011111100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u792|u_cpu/u_execute/reg5_b22  (
    .a({_al_u732_o,bus_wdata[6]}),
    .b({_al_u790_o,bus_wdata[7]}),
    .c({_al_u791_o,\u_cpu/alu_in2 [0]}),
    .clk(vga_clk_pad),
    .d(\u_cpu/alu_in2 [2:1]),
    .mi({open_n3983,bus_wdata[6]}),
    .f({_al_u792_o,_al_u791_o}),
    .q({open_n3999,\u_cpu/timer_wdata [22]}));  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/alu.v(84)
  EG_PHY_MSLICE #(
    //.LUT0("~(~(C*B)*~(~D*~A))"),
    //.LUT1("(~(~D*C)*~(B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100000011010101),
    .INIT_LUT1(16'b0111011100000111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u794|u_cpu/u_alu/reg3_b6  (
    .a({\u_cpu/u_alu/n76_lutinv ,_al_u794_o}),
    .b({_al_u787_o,\u_cpu/u_alu/n16_lutinv }),
    .c({\u_cpu/alu_out4 [6],_al_u699_o}),
    .clk(vga_clk_pad),
    .d(\u_cpu/alu_cmd [10:9]),
    .f({_al_u794_o,open_n4014}),
    .q({open_n4018,\u_cpu/alu_out4 [6]}));  // sources/rtl/mcu/alu.v(84)
  // sources/rtl/mcu/execute.v(287)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("~((~C*~B)*~(A)*~(D)+(~C*~B)*A*~(D)+~((~C*~B))*A*D+(~C*~B)*A*D)"),
    //.LUTG0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("~((~C*~B)*~(A)*~(D)+(~C*~B)*A*~(D)+~((~C*~B))*A*D+(~C*~B)*A*D)"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000010101100),
    .INIT_LUTF1(16'b0101010111111100),
    .INIT_LUTG0(16'b0000000010101100),
    .INIT_LUTG1(16'b0101010111111100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u798|u_cpu/u_execute/reg4_b8  (
    .a({_al_u724_o,bus_wdata[5]}),
    .b({_al_u796_o,bus_wdata[6]}),
    .c({_al_u797_o,\u_cpu/alu_in2 [0]}),
    .ce(\u_bus/eq0/or_or_or_xor_i0[0]_i_o ),
    .clk(vga_clk_pad),
    .d(\u_cpu/alu_in2 [2:1]),
    .mi({open_n4022,\u_cpu/alu_in2 [0]}),
    .f({\u_cpu/u_alu/n16_lutinv ,_al_u797_o}),
    .q({open_n4038,\u_cpu/pc_wdata [8]}));  // sources/rtl/mcu/execute.v(287)
  // sources/rtl/mcu/alu.v(84)
  EG_PHY_MSLICE #(
    //.LUT0("~(~B*~(~C*~D))"),
    //.LUT1("(~(~D*C)*~(B*~A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100110011001111),
    .INIT_LUT1(16'b1011101100001011),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u800|u_cpu/u_alu/reg3_b5  (
    .a({_al_u716_o,open_n4039}),
    .b({_al_u787_o,_al_u802_o}),
    .c({\u_cpu/alu_out4 [5],\u_cpu/alu_cmd [9]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_cmd [10],_al_u800_o}),
    .f({_al_u800_o,open_n4054}),
    .q({open_n4058,\u_cpu/alu_out4 [5]}));  // sources/rtl/mcu/alu.v(84)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("(~C*A*~(D*~B))"),
    //.LUTG0("(~D*~(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("(~C*A*~(D*~B))"),
    .INIT_LUTF0(16'b0000000001010011),
    .INIT_LUTF1(16'b0000100000001010),
    .INIT_LUTG0(16'b0000000001010011),
    .INIT_LUTG1(16'b0000100000001010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u802|_al_u801  (
    .a({_al_u699_o,\u_cpu/u_alu/n31_lutinv }),
    .b({\u_cpu/u_alu/n21_lutinv ,\u_cpu/u_alu/n33_lutinv }),
    .c({_al_u801_o,\u_cpu/alu_in2 [1]}),
    .d({\u_cpu/alu_in2 [2],\u_cpu/alu_in2 [2]}),
    .f({_al_u802_o,_al_u801_o}));
  // sources/rtl/mcu/execute.v(287)
  EG_PHY_MSLICE #(
    //.LUT0("~(C*D)"),
    //.LUT1("(C*B*D)"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000111111111111),
    .INIT_LUT1(16'b1100000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u808|u_cpu/u_execute/pc_wen_reg  (
    .b({_al_u396_o,open_n4085}),
    .c({led_pad,_al_u396_o}),
    .ce(\u_bus/eq0/or_or_or_xor_i0[0]_i_o ),
    .clk(vga_clk_pad),
    .d({_al_u395_o,_al_u395_o}),
    .mi({open_n4096,\u_cpu/u_execute/pc_wen0 }),
    .f({\u_bus/sel1_b0/B3 ,\u_bus/eq0/or_or_or_xor_i0[0]_i_o }),
    .q({open_n4101,\u_cpu/pc_wen }));  // sources/rtl/mcu/execute.v(287)
  // sources/rtl/mcu/bus.v(78)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~C*~B*~(D*A))"),
    //.LUTF1("(D*C*B*A)"),
    //.LUTG0("~(~C*~B*~(D*A))"),
    //.LUTG1("(D*C*B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111111011111100),
    .INIT_LUTF1(16'b1000000000000000),
    .INIT_LUTG0(16'b1111111011111100),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u809|u_bus/reg1_b0  (
    .a({_al_u396_o,\u_bus/n1_lutinv }),
    .b({_al_u394_o,\u_bus/sel1_b0/B3 }),
    .c({bus_raddr[1],\u_bus/sel1_b0/B1 }),
    .ce(bus_ren),
    .clk(vga_clk_pad),
    .d({vram_rdata,key_deb[0]}),
    .f({\u_bus/sel1_b0/B1 ,open_n4119}),
    .q({open_n4123,bus_rdata[0]}));  // sources/rtl/mcu/bus.v(78)
  // sources/rtl/mcu/execute.v(366)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~A*~(~C*~B))"),
    //.LUTF1("(~(D@B)*~(C@A))"),
    //.LUTG0("(~D*~A*~(~C*~B))"),
    //.LUTG1("(~(D@B)*~(C@A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000001010100),
    .INIT_LUTF1(16'b1000010000100001),
    .INIT_LUTG0(16'b0000000001010100),
    .INIT_LUTG1(16'b1000010000100001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u814|u_cpu/u_execute/reg9_b3  (
    .a({bus_raddr[2],\u_cpu/u_execute/bus_to_d_wen }),
    .b({bus_raddr[3],\u_cpu/u_execute/ram_to_d_wen }),
    .c({ram_waddr[2],bus_raddr[3]}),
    .ce(\u_cpu/u_execute/n40 ),
    .clk(vga_clk_pad),
    .d({ram_waddr[3],\u_cpu/u_execute/rom_to_d_wen }),
    .mi({open_n4127,bus_raddr[3]}),
    .f({_al_u814_o,_al_u885_o}),
    .q({open_n4143,ram_waddr[3]}));  // sources/rtl/mcu/execute.v(366)
  // sources/rtl/mcu/execute.v(366)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~A*~(~C*~B))"),
    //.LUT1("(~(D@B)*~(C@A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000001010100),
    .INIT_LUT1(16'b1000010000100001),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u815|u_cpu/u_execute/reg9_b7  (
    .a({bus_raddr[5],\u_cpu/u_execute/bus_to_d_wen }),
    .b({bus_raddr[7],\u_cpu/u_execute/ram_to_d_wen }),
    .c({ram_waddr[5],bus_raddr[7]}),
    .ce(\u_cpu/u_execute/n40 ),
    .clk(vga_clk_pad),
    .d({ram_waddr[7],\u_cpu/u_execute/rom_to_d_wen }),
    .mi({open_n4154,bus_raddr[7]}),
    .f({_al_u815_o,_al_u829_o}),
    .q({open_n4159,ram_waddr[7]}));  // sources/rtl/mcu/execute.v(366)
  // sources/rtl/mcu/execute.v(366)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~A*~(~C*~B))"),
    //.LUTF1("(~(D@B)*~(C@A))"),
    //.LUTG0("(~D*~A*~(~C*~B))"),
    //.LUTG1("(~(D@B)*~(C@A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000001010100),
    .INIT_LUTF1(16'b1000010000100001),
    .INIT_LUTG0(16'b0000000001010100),
    .INIT_LUTG1(16'b1000010000100001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u816|u_cpu/u_execute/reg9_b1  (
    .a({bus_raddr[1],\u_cpu/u_execute/bus_to_d_wen }),
    .b({bus_raddr[6],\u_cpu/u_execute/ram_to_d_wen }),
    .c({ram_waddr[1],bus_raddr[1]}),
    .ce(\u_cpu/u_execute/n40 ),
    .clk(vga_clk_pad),
    .d({ram_waddr[6],\u_cpu/u_execute/rom_to_d_wen }),
    .mi({open_n4163,bus_raddr[1]}),
    .f({_al_u816_o,_al_u920_o}),
    .q({open_n4179,ram_waddr[1]}));  // sources/rtl/mcu/execute.v(366)
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUT1("(D*C*B*A)"),
    .INIT_LUT0(16'b0000100001001100),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"))
    \_al_u818|_al_u915  (
    .a({_al_u814_o,\u_cpu/u_execute/n0_lutinv }),
    .b({_al_u815_o,\u_cpu/u_execute/ram_to_a_wen }),
    .c({_al_u816_o,ram_wdata[1]}),
    .d({_al_u817_o,ram_rdata[1]}),
    .f({\u_cpu/u_execute/n0_lutinv ,_al_u915_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUT1("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .INIT_LUT0(16'b0000100001001100),
    .INIT_LUT1(16'b0000100001001100),
    .MODE("LOGIC"))
    \_al_u819|_al_u822  (
    .a({\u_cpu/u_execute/n0_lutinv ,\u_cpu/u_execute/n0_lutinv }),
    .b({\u_cpu/u_execute/ram_to_c_wen ,\u_cpu/u_execute/ram_to_b_wen }),
    .c({ram_wdata[7],ram_wdata[7]}),
    .d({ram_rdata[7],ram_rdata[7]}),
    .f({_al_u819_o,_al_u822_o}));
  // sources/rtl/mcu/execute.v(244)
  EG_PHY_MSLICE #(
    //.LUT0("~(~(D*C)*~(B*~A))"),
    //.LUT1("(~D*~A*~(~C*~B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111010001000100),
    .INIT_LUT1(16'b0000000001010100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u823|u_cpu/u_execute/reg1_b7  (
    .a({\u_cpu/u_execute/bus_to_b_wen ,_al_u822_o}),
    .b({\u_cpu/u_execute/ram_to_b_wen ,_al_u823_o}),
    .c({\u_cpu/alu_in2 [7],\u_cpu/u_execute/rom_data [7]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/rom_to_b_wen ,\u_cpu/u_execute/rom_to_b_wen }),
    .f({_al_u823_o,\u_cpu/u_execute/n7 [7]}),
    .q({open_n4237,\u_cpu/alu_in2 [7]}));  // sources/rtl/mcu/execute.v(244)
  // sources/rtl/mcu/execute.v(228)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~(D*C)*~(B*~A))"),
    //.LUTF1("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTG0("~(~(D*C)*~(B*~A))"),
    //.LUTG1("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111010001000100),
    .INIT_LUTF1(16'b0000100001001100),
    .INIT_LUTG0(16'b1111010001000100),
    .INIT_LUTG1(16'b0000100001001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u825|u_cpu/u_execute/reg0_b7  (
    .a({\u_cpu/u_execute/n0_lutinv ,_al_u825_o}),
    .b({\u_cpu/u_execute/ram_to_a_wen ,_al_u826_o}),
    .c({ram_wdata[7],\u_cpu/u_execute/rom_data [7]}),
    .clk(vga_clk_pad),
    .d({ram_rdata[7],\u_cpu/u_execute/rom_to_a_wen }),
    .f({_al_u825_o,\u_cpu/u_execute/n4 [7]}),
    .q({open_n4259,bus_wdata[7]}));  // sources/rtl/mcu/execute.v(228)
  // sources/rtl/mcu/execute.v(276)
  EG_PHY_MSLICE #(
    //.LUT0("~(~(D*C)*~(B*~A))"),
    //.LUT1("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111010001000100),
    .INIT_LUT1(16'b0000100001001100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u828|u_cpu/u_execute/reg3_b7  (
    .a({\u_cpu/u_execute/n0_lutinv ,_al_u828_o}),
    .b({\u_cpu/u_execute/ram_to_d_wen ,_al_u829_o}),
    .c({ram_wdata[7],\u_cpu/u_execute/rom_data [7]}),
    .clk(vga_clk_pad),
    .d({ram_rdata[7],\u_cpu/u_execute/rom_to_d_wen }),
    .f({_al_u828_o,open_n4274}),
    .q({open_n4278,bus_raddr[7]}));  // sources/rtl/mcu/execute.v(276)
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUT1("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .INIT_LUT0(16'b0000100001001100),
    .INIT_LUT1(16'b0000100001001100),
    .MODE("LOGIC"))
    \_al_u831|_al_u834  (
    .a({\u_cpu/u_execute/n0_lutinv ,\u_cpu/u_execute/n0_lutinv }),
    .b({\u_cpu/u_execute/ram_to_c_wen ,\u_cpu/u_execute/ram_to_b_wen }),
    .c({ram_wdata[6],ram_wdata[6]}),
    .d({ram_rdata[6],ram_rdata[6]}),
    .f({_al_u831_o,_al_u834_o}));
  // sources/rtl/mcu/execute.v(244)
  EG_PHY_MSLICE #(
    //.LUT0("~(~(D*C)*~(B*~A))"),
    //.LUT1("(~D*~A*~(~C*~B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111010001000100),
    .INIT_LUT1(16'b0000000001010100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u835|u_cpu/u_execute/reg1_b6  (
    .a({\u_cpu/u_execute/bus_to_b_wen ,_al_u834_o}),
    .b({\u_cpu/u_execute/ram_to_b_wen ,_al_u835_o}),
    .c({\u_cpu/alu_in2 [6],\u_cpu/u_execute/rom_data [6]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/rom_to_b_wen ,\u_cpu/u_execute/rom_to_b_wen }),
    .f({_al_u835_o,\u_cpu/u_execute/n7 [6]}),
    .q({open_n4316,\u_cpu/alu_in2 [6]}));  // sources/rtl/mcu/execute.v(244)
  // sources/rtl/mcu/execute.v(228)
  EG_PHY_MSLICE #(
    //.LUT0("~(~(D*C)*~(B*~A))"),
    //.LUT1("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111010001000100),
    .INIT_LUT1(16'b0000100001001100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u837|u_cpu/u_execute/reg0_b6  (
    .a({\u_cpu/u_execute/n0_lutinv ,_al_u837_o}),
    .b({\u_cpu/u_execute/ram_to_a_wen ,_al_u838_o}),
    .c({ram_wdata[6],\u_cpu/u_execute/rom_data [6]}),
    .clk(vga_clk_pad),
    .d({ram_rdata[6],\u_cpu/u_execute/rom_to_a_wen }),
    .f({_al_u837_o,\u_cpu/u_execute/n4 [6]}),
    .q({open_n4334,bus_wdata[6]}));  // sources/rtl/mcu/execute.v(228)
  // sources/rtl/mcu/execute.v(276)
  EG_PHY_MSLICE #(
    //.LUT0("~(~(D*C)*~(B*~A))"),
    //.LUT1("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111010001000100),
    .INIT_LUT1(16'b0000100001001100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u840|u_cpu/u_execute/reg3_b6  (
    .a({\u_cpu/u_execute/n0_lutinv ,_al_u840_o}),
    .b({\u_cpu/u_execute/ram_to_d_wen ,_al_u841_o}),
    .c({ram_wdata[6],\u_cpu/u_execute/rom_data [6]}),
    .clk(vga_clk_pad),
    .d({ram_rdata[6],\u_cpu/u_execute/rom_to_d_wen }),
    .f({_al_u840_o,open_n4349}),
    .q({open_n4353,bus_raddr[6]}));  // sources/rtl/mcu/execute.v(276)
  // sources/rtl/mcu/execute.v(276)
  EG_PHY_LSLICE #(
    //.LUTF0("~(C*~(B*~(D*A)))"),
    //.LUTF1("~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D)"),
    //.LUTG0("~(C*~(B*~(D*A)))"),
    //.LUTG1("~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0100111111001111),
    .INIT_LUTF1(16'b0011001100001111),
    .INIT_LUTG0(16'b0100111111001111),
    .INIT_LUTG1(16'b0011001100001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u843|u_cpu/u_execute/reg3_b5  (
    .a({open_n4354,_al_u843_o}),
    .b({ram_wdata[5],_al_u853_o}),
    .c({ram_rdata[5],_al_u854_o}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/n0_lutinv ,\u_cpu/u_execute/ram_to_d_wen }),
    .f({_al_u843_o,open_n4373}),
    .q({open_n4377,bus_raddr[5]}));  // sources/rtl/mcu/execute.v(276)
  // sources/rtl/mcu/execute.v(185)
  EG_PHY_MSLICE #(
    //.LUT0("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    //.LUT1("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000111101110111),
    .INIT_LUT1(16'b0000111101110111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u845|u_cpu/u_execute/reg11_b5  (
    .a({bus_rdata[5],bus_rdata[5]}),
    .b({\u_cpu/u_execute/bus_to_c_wen ,\u_cpu/u_execute/bus_to_d_wen }),
    .c({\u_cpu/u_execute/rom_data [5],\u_cpu/u_execute/rom_data [5]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/rom_to_c_wen ,\u_cpu/u_execute/rom_to_d_wen }),
    .mi({open_n4389,\u_cpu/decode_data [5]}),
    .f({_al_u845_o,_al_u854_o}),
    .q({open_n4394,\u_cpu/u_execute/rom_data [5]}));  // sources/rtl/mcu/execute.v(185)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~A*~(~C*~B))"),
    //.LUT1("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    .INIT_LUT0(16'b0000000001010100),
    .INIT_LUT1(16'b0000111101110111),
    .MODE("LOGIC"))
    \_al_u848|_al_u847  (
    .a({bus_rdata[5],\u_cpu/u_execute/bus_to_b_wen }),
    .b({\u_cpu/u_execute/bus_to_b_wen ,\u_cpu/u_execute/ram_to_b_wen }),
    .c({\u_cpu/u_execute/rom_data [5],\u_cpu/alu_in2 [5]}),
    .d({\u_cpu/u_execute/rom_to_b_wen ,\u_cpu/u_execute/rom_to_b_wen }),
    .f({_al_u848_o,_al_u847_o}));
  // sources/rtl/mcu/bus.v(62)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~A*~(~C*~B))"),
    //.LUTF1("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    //.LUTG0("(~D*~A*~(~C*~B))"),
    //.LUTG1("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000001010100),
    .INIT_LUTF1(16'b0000111101110111),
    .INIT_LUTG0(16'b0000000001010100),
    .INIT_LUTG1(16'b0000111101110111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u851|u_bus/reg0_b5  (
    .a({bus_rdata[5],\u_cpu/u_execute/bus_to_a_wen }),
    .b({\u_cpu/u_execute/bus_to_a_wen ,\u_cpu/u_execute/ram_to_a_wen }),
    .c({\u_cpu/u_execute/rom_data [5],bus_wdata[5]}),
    .ce(\u_bus/mux0_b0_sel_is_3_o ),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/rom_to_a_wen ,\u_cpu/u_execute/rom_to_a_wen }),
    .mi({open_n4418,bus_wdata[5]}),
    .f({_al_u851_o,_al_u850_o}),
    .q({open_n4434,vram_addr[5]}));  // sources/rtl/mcu/bus.v(62)
  // sources/rtl/mcu/execute.v(260)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~(B*~A)))"),
    //.LUTF1("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTG0("(~D*~(C*~(B*~A)))"),
    //.LUTG1("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000001001111),
    .INIT_LUTF1(16'b0000100001001100),
    .INIT_LUTG0(16'b0000000001001111),
    .INIT_LUTG1(16'b0000100001001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u856|u_cpu/u_execute/reg2_b4  (
    .a({\u_cpu/u_execute/n0_lutinv ,_al_u856_o}),
    .b({\u_cpu/u_execute/ram_to_c_wen ,_al_u857_o}),
    .c({ram_wdata[4],_al_u858_o}),
    .clk(vga_clk_pad),
    .d({ram_rdata[4],_al_u859_o}),
    .f({_al_u856_o,open_n4453}),
    .q({open_n4457,\u_cpu/u_execute/C [4]}));  // sources/rtl/mcu/execute.v(260)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~(B*D))"),
    //.LUT1("(~C*~(B*D))"),
    .INIT_LUT0(16'b0000001100001111),
    .INIT_LUT1(16'b0000001100001111),
    .MODE("LOGIC"))
    \_al_u858|_al_u872  (
    .b({\u_cpu/u_execute/bus_to_c_wen ,\u_cpu/u_execute/bus_to_d_wen }),
    .c({\u_cpu/u_execute/rom_to_c_wen ,\u_cpu/u_execute/rom_to_d_wen }),
    .d({bus_rdata[4],bus_rdata[4]}),
    .f({_al_u858_o,_al_u872_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTF1("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTG0("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTG1("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .INIT_LUTF0(16'b0000100001001100),
    .INIT_LUTF1(16'b0000100001001100),
    .INIT_LUTG0(16'b0000100001001100),
    .INIT_LUTG1(16'b0000100001001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u861|_al_u870  (
    .a({\u_cpu/u_execute/n0_lutinv ,\u_cpu/u_execute/n0_lutinv }),
    .b({\u_cpu/u_execute/ram_to_b_wen ,\u_cpu/u_execute/ram_to_d_wen }),
    .c({ram_wdata[4],ram_wdata[4]}),
    .d({ram_rdata[4],ram_rdata[4]}),
    .f({_al_u861_o,_al_u870_o}));
  // sources/rtl/mcu/execute.v(244)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~(B*~A)))"),
    //.LUT1("(~D*~(~C*~B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000001001111),
    .INIT_LUT1(16'b0000000011111100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u862|u_cpu/u_execute/reg1_b4  (
    .a({open_n4504,_al_u861_o}),
    .b({\u_cpu/u_execute/ram_to_b_wen ,_al_u862_o}),
    .c({\u_cpu/alu_in2 [4],_al_u863_o}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/bus_to_b_wen ,_al_u864_o}),
    .f({_al_u862_o,\u_cpu/u_execute/n7 [4]}),
    .q({open_n4522,\u_cpu/alu_in2 [4]}));  // sources/rtl/mcu/execute.v(244)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~(B*D))"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(~C*~(B*D))"),
    //.LUTG1("(C*~D)"),
    .INIT_LUTF0(16'b0000001100001111),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000001100001111),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u864|_al_u863  (
    .b({open_n4525,\u_cpu/u_execute/bus_to_b_wen }),
    .c({\u_cpu/u_execute/rom_to_b_wen ,\u_cpu/u_execute/rom_to_b_wen }),
    .d({\u_cpu/u_execute/rom_data [4],bus_rdata[4]}),
    .f({_al_u864_o,_al_u863_o}));
  // sources/rtl/mcu/execute.v(228)
  EG_PHY_LSLICE #(
    //.LUTF0("~(C*~(B*~D))"),
    //.LUTF1("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    //.LUTG0("~(C*~(B*~D))"),
    //.LUTG1("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000111111001111),
    .INIT_LUTF1(16'b0000111101110111),
    .INIT_LUTG0(16'b0000111111001111),
    .INIT_LUTG1(16'b0000111101110111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u868|u_cpu/u_execute/reg0_b4  (
    .a({bus_rdata[4],open_n4550}),
    .b({\u_cpu/u_execute/bus_to_a_wen ,_al_u867_o}),
    .c({\u_cpu/u_execute/rom_data [4],_al_u868_o}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/rom_to_a_wen ,_al_u866_o}),
    .f({_al_u868_o,\u_cpu/u_execute/n4 [4]}),
    .q({open_n4572,bus_wdata[4]}));  // sources/rtl/mcu/execute.v(228)
  // sources/rtl/mcu/execute.v(391)
  EG_PHY_MSLICE #(
    //.LUT0("((~B*~A)*~(C)*~(D)+(~B*~A)*C*~(D)+~((~B*~A))*C*D+(~B*~A)*C*D)"),
    //.LUT1("~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000000010001),
    .INIT_LUT1(16'b0011001100001111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u875|u_cpu/u_execute/reg10_b3  (
    .a({open_n4573,_al_u991_o}),
    .b({ram_wdata[3],_al_u992_o}),
    .c({ram_rdata[3],bus_wdata[3]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/n0_lutinv ,\u_cpu/u_execute/wt_ram_cmd [0]}),
    .f({_al_u875_o,open_n4588}),
    .q({open_n4592,ram_wdata[3]}));  // sources/rtl/mcu/execute.v(391)
  // sources/rtl/mcu/execute.v(185)
  EG_PHY_MSLICE #(
    //.LUT0("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    //.LUT1("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000111101110111),
    .INIT_LUT1(16'b0000111101110111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u877|u_cpu/u_execute/reg11_b3  (
    .a({bus_rdata[3],bus_rdata[3]}),
    .b({\u_cpu/u_execute/bus_to_c_wen ,\u_cpu/u_execute/bus_to_d_wen }),
    .c({\u_cpu/u_execute/rom_data [3],\u_cpu/u_execute/rom_data [3]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/rom_to_c_wen ,\u_cpu/u_execute/rom_to_d_wen }),
    .mi({open_n4604,\u_cpu/decode_data [3]}),
    .f({_al_u877_o,_al_u886_o}),
    .q({open_n4609,\u_cpu/u_execute/rom_data [3]}));  // sources/rtl/mcu/execute.v(185)
  // sources/rtl/mcu/bus.v(78)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000111101110111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u880|u_bus/reg1_b3  (
    .a({bus_rdata[3],open_n4610}),
    .b({\u_cpu/u_execute/bus_to_b_wen ,open_n4611}),
    .c({\u_cpu/u_execute/rom_data [3],key_deb[3]}),
    .ce(bus_ren),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/rom_to_b_wen ,\u_bus/n1_lutinv }),
    .f({_al_u880_o,open_n4625}),
    .q({open_n4629,bus_rdata[3]}));  // sources/rtl/mcu/bus.v(78)
  // sources/rtl/mcu/execute.v(228)
  EG_PHY_LSLICE #(
    //.LUTF0("~(C*~(B*~(D*A)))"),
    //.LUTF1("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    //.LUTG0("~(C*~(B*~(D*A)))"),
    //.LUTG1("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0100111111001111),
    .INIT_LUTF1(16'b0000111101110111),
    .INIT_LUTG0(16'b0100111111001111),
    .INIT_LUTG1(16'b0000111101110111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u883|u_cpu/u_execute/reg0_b3  (
    .a({bus_rdata[3],_al_u875_o}),
    .b({\u_cpu/u_execute/bus_to_a_wen ,_al_u882_o}),
    .c({\u_cpu/u_execute/rom_data [3],_al_u883_o}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/rom_to_a_wen ,\u_cpu/u_execute/ram_to_a_wen }),
    .f({_al_u883_o,\u_cpu/u_execute/n4 [3]}),
    .q({open_n4651,bus_wdata[3]}));  // sources/rtl/mcu/execute.v(228)
  // sources/rtl/mcu/execute.v(260)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~(B*~A)))"),
    //.LUT1("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000001001111),
    .INIT_LUT1(16'b0000100001001100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u888|u_cpu/u_execute/reg2_b2  (
    .a({\u_cpu/u_execute/n0_lutinv ,_al_u888_o}),
    .b({\u_cpu/u_execute/ram_to_c_wen ,_al_u889_o}),
    .c({ram_wdata[2],_al_u890_o}),
    .clk(vga_clk_pad),
    .d({ram_rdata[2],_al_u891_o}),
    .f({_al_u888_o,open_n4666}),
    .q({open_n4670,\u_cpu/u_execute/C [2]}));  // sources/rtl/mcu/execute.v(260)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~(B*D))"),
    //.LUT1("(~C*~(B*D))"),
    .INIT_LUT0(16'b0000001100001111),
    .INIT_LUT1(16'b0000001100001111),
    .MODE("LOGIC"))
    \_al_u890|_al_u895  (
    .b({\u_cpu/u_execute/bus_to_c_wen ,\u_cpu/u_execute/bus_to_b_wen }),
    .c({\u_cpu/u_execute/rom_to_c_wen ,\u_cpu/u_execute/rom_to_b_wen }),
    .d({bus_rdata[2],bus_rdata[2]}),
    .f({_al_u890_o,_al_u895_o}));
  // sources/rtl/mcu/execute.v(185)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u891|u_cpu/u_execute/reg11_b2  (
    .c({\u_cpu/u_execute/rom_to_c_wen ,\u_cpu/u_execute/rom_to_d_wen }),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/rom_data [2],\u_cpu/u_execute/rom_data [2]}),
    .mi({open_n4701,\u_cpu/decode_data [2]}),
    .f({_al_u891_o,_al_u906_o}),
    .q({open_n4717,\u_cpu/u_execute/rom_data [2]}));  // sources/rtl/mcu/execute.v(185)
  // sources/rtl/mcu/execute.v(244)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~(B*~A)))"),
    //.LUT1("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000001001111),
    .INIT_LUT1(16'b0000100001001100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u893|u_cpu/u_execute/reg1_b2  (
    .a({\u_cpu/u_execute/n0_lutinv ,_al_u893_o}),
    .b({\u_cpu/u_execute/ram_to_b_wen ,_al_u894_o}),
    .c({ram_wdata[2],_al_u895_o}),
    .clk(vga_clk_pad),
    .d({ram_rdata[2],_al_u896_o}),
    .f({_al_u893_o,\u_cpu/u_execute/n7 [2]}),
    .q({open_n4735,\u_cpu/alu_in2 [2]}));  // sources/rtl/mcu/execute.v(244)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*~D)"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u896|_al_u901  (
    .c({\u_cpu/u_execute/rom_to_b_wen ,\u_cpu/u_execute/rom_to_a_wen }),
    .d({\u_cpu/u_execute/rom_data [2],\u_cpu/u_execute/rom_data [2]}),
    .f({_al_u896_o,_al_u901_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUT1("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .INIT_LUT0(16'b0000100001001100),
    .INIT_LUT1(16'b0000100001001100),
    .MODE("LOGIC"))
    \_al_u898|_al_u903  (
    .a({\u_cpu/u_execute/n0_lutinv ,\u_cpu/u_execute/n0_lutinv }),
    .b({\u_cpu/u_execute/ram_to_a_wen ,\u_cpu/u_execute/ram_to_d_wen }),
    .c({ram_wdata[2],ram_wdata[2]}),
    .d({ram_rdata[2],ram_rdata[2]}),
    .f({_al_u898_o,_al_u903_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~(B*D))"),
    //.LUTF1("(~C*~(B*D))"),
    //.LUTG0("(~C*~(B*D))"),
    //.LUTG1("(~C*~(B*D))"),
    .INIT_LUTF0(16'b0000001100001111),
    .INIT_LUTF1(16'b0000001100001111),
    .INIT_LUTG0(16'b0000001100001111),
    .INIT_LUTG1(16'b0000001100001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u900|_al_u917  (
    .b({\u_cpu/u_execute/bus_to_a_wen ,\u_cpu/u_execute/bus_to_a_wen }),
    .c({\u_cpu/u_execute/rom_to_a_wen ,\u_cpu/u_execute/rom_to_a_wen }),
    .d(bus_rdata[2:1]),
    .f({_al_u900_o,_al_u917_o}));
  // sources/rtl/mcu/execute.v(276)
  EG_PHY_MSLICE #(
    //.LUT0("~(C*~(B*~(D*A)))"),
    //.LUT1("~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0100111111001111),
    .INIT_LUT1(16'b0011001100001111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u908|u_cpu/u_execute/reg3_b1  (
    .a({open_n4810,_al_u908_o}),
    .b({ram_wdata[1],_al_u920_o}),
    .c({ram_rdata[1],_al_u921_o}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/n0_lutinv ,\u_cpu/u_execute/ram_to_d_wen }),
    .f({_al_u908_o,open_n4825}),
    .q({open_n4829,bus_raddr[1]}));  // sources/rtl/mcu/execute.v(276)
  // sources/rtl/mcu/execute.v(244)
  EG_PHY_MSLICE #(
    //.LUT0("~(C*~(B*~(D*A)))"),
    //.LUT1("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0100111111001111),
    .INIT_LUT1(16'b0000111101110111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u913|u_cpu/u_execute/reg1_b1  (
    .a({bus_rdata[1],_al_u908_o}),
    .b({\u_cpu/u_execute/bus_to_b_wen ,_al_u912_o}),
    .c({\u_cpu/u_execute/rom_data [1],_al_u913_o}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/rom_to_b_wen ,\u_cpu/u_execute/ram_to_b_wen }),
    .f({_al_u913_o,\u_cpu/u_execute/n7 [1]}),
    .q({open_n4847,\u_cpu/alu_in2 [1]}));  // sources/rtl/mcu/execute.v(244)
  // sources/rtl/mcu/execute.v(260)
  EG_PHY_LSLICE #(
    //.LUTF0("~(C*~(B*~(D*A)))"),
    //.LUTF1("~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D)"),
    //.LUTG0("~(C*~(B*~(D*A)))"),
    //.LUTG1("~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0100111111001111),
    .INIT_LUTF1(16'b0011001100001111),
    .INIT_LUTG0(16'b0100111111001111),
    .INIT_LUTG1(16'b0011001100001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u923|u_cpu/u_execute/reg2_b0  (
    .a({open_n4848,_al_u923_o}),
    .b({ram_wdata[0],_al_u924_o}),
    .c({ram_rdata[0],_al_u925_o}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/n0_lutinv ,\u_cpu/u_execute/ram_to_c_wen }),
    .f({_al_u923_o,open_n4867}),
    .q({open_n4871,\u_cpu/u_execute/C [0]}));  // sources/rtl/mcu/execute.v(260)
  // sources/rtl/mcu/execute.v(228)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~(B*~A)))"),
    //.LUT1("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000001001111),
    .INIT_LUT1(16'b0000100001001100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u932|u_cpu/u_execute/reg0_b0  (
    .a({\u_cpu/u_execute/n0_lutinv ,_al_u932_o}),
    .b({\u_cpu/u_execute/ram_to_a_wen ,_al_u933_o}),
    .c({ram_wdata[0],_al_u934_o}),
    .clk(vga_clk_pad),
    .d({ram_rdata[0],_al_u935_o}),
    .f({_al_u932_o,\u_cpu/u_execute/n4 [0]}),
    .q({open_n4889,bus_wdata[0]}));  // sources/rtl/mcu/execute.v(228)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~(B*~(A)*~(D)+B*A*~(D)+~(B)*A*D+B*A*D))"),
    //.LUTF1("(~C*~(B*~(A)*~(D)+B*A*~(D)+~(B)*A*D+B*A*D))"),
    //.LUTG0("(~C*~(B*~(A)*~(D)+B*A*~(D)+~(B)*A*D+B*A*D))"),
    //.LUTG1("(~C*~(B*~(A)*~(D)+B*A*~(D)+~(B)*A*D+B*A*D))"),
    .INIT_LUTF0(16'b0000010100000011),
    .INIT_LUTF1(16'b0000010100000011),
    .INIT_LUTG0(16'b0000010100000011),
    .INIT_LUTG1(16'b0000010100000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u944|_al_u954  (
    .a(\u_cpu/alu_out4 [7:6]),
    .b(ram_wdata[7:6]),
    .c({\u_cpu/u_execute/wt_ram_cmd [8],\u_cpu/u_execute/wt_ram_cmd [8]}),
    .d({\u_cpu/u_execute/wt_ram_cmd [9],\u_cpu/u_execute/wt_ram_cmd [9]}),
    .f({_al_u944_o,_al_u954_o}));
  // sources/rtl/mcu/alu.v(53)
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(C*D))"),
    //.LUT1("(~D*~(C*~(B*~A)))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000001100110011),
    .INIT_LUT1(16'b0000000001001111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u948|u_cpu/u_alu/reg0_b7  (
    .a({_al_u944_o,open_n4914}),
    .b({_al_u945_o,\u_cpu/u_execute/wt_ram_cmd [5]}),
    .c({_al_u946_o,\u_cpu/u_execute/wt_ram_cmd [6]}),
    .ce(\u_cpu/alu_cmd [2]),
    .clk(vga_clk_pad),
    .d({_al_u947_o,\u_cpu/alu_out1 [7]}),
    .mi({open_n4925,\u_cpu/u_alu/n17 [7]}),
    .f({\u_cpu/u_execute/n47 [7],_al_u946_o}),
    .q({open_n4930,\u_cpu/alu_out1 [7]}));  // sources/rtl/mcu/alu.v(53)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*~(D*~A))"),
    //.LUTF1("(~C*~B*~(D*~A))"),
    //.LUTG0("(~C*~B*~(D*~A))"),
    //.LUTG1("(~C*~B*~(D*~A))"),
    .INIT_LUTF0(16'b0000001000000011),
    .INIT_LUTF1(16'b0000001000000011),
    .INIT_LUTG0(16'b0000001000000011),
    .INIT_LUTG1(16'b0000001000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u949|_al_u969  (
    .a({\u_cpu/alu_out0 [7],\u_cpu/alu_out0 [5]}),
    .b({\u_cpu/u_execute/wt_ram_cmd [2],\u_cpu/u_execute/wt_ram_cmd [2]}),
    .c({\u_cpu/u_execute/wt_ram_cmd [3],\u_cpu/u_execute/wt_ram_cmd [3]}),
    .d({\u_cpu/u_execute/wt_ram_cmd [4],\u_cpu/u_execute/wt_ram_cmd [4]}),
    .f({_al_u949_o,_al_u969_o}));
  // sources/rtl/mcu/execute.v(287)
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(C*D))"),
    //.LUT1("(C*~(B*~(~D*~A)))"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000001100110011),
    .INIT_LUT1(16'b0011000001110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u951|u_cpu/u_execute/reg4_b7  (
    .a({\u_cpu/u_execute/n47 [7],open_n4955}),
    .b({_al_u949_o,\u_cpu/u_execute/wt_ram_cmd [1]}),
    .c({_al_u950_o,\u_cpu/u_execute/wt_ram_cmd [2]}),
    .ce(\u_bus/eq0/or_or_or_xor_i0[0]_i_o ),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/wt_ram_cmd [4],\u_cpu/u_execute/C [7]}),
    .mi({open_n4966,\u_cpu/u_execute/C [7]}),
    .f({_al_u951_o,_al_u950_o}),
    .q({open_n4971,\u_cpu/pc_wdata [7]}));  // sources/rtl/mcu/execute.v(287)
  // sources/rtl/mcu/alu.v(53)
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(C*D))"),
    //.LUTF1("(~D*~(C*~(B*~A)))"),
    //.LUTG0("(~B*~(C*D))"),
    //.LUTG1("(~D*~(C*~(B*~A)))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000001100110011),
    .INIT_LUTF1(16'b0000000001001111),
    .INIT_LUTG0(16'b0000001100110011),
    .INIT_LUTG1(16'b0000000001001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u958|u_cpu/u_alu/reg0_b6  (
    .a({_al_u954_o,open_n4972}),
    .b({_al_u955_o,\u_cpu/u_execute/wt_ram_cmd [5]}),
    .c({_al_u956_o,\u_cpu/u_execute/wt_ram_cmd [6]}),
    .ce(\u_cpu/alu_cmd [2]),
    .clk(vga_clk_pad),
    .d({_al_u957_o,\u_cpu/alu_out1 [6]}),
    .mi({open_n4976,\u_cpu/u_alu/n17 [6]}),
    .f({\u_cpu/u_execute/n47 [6],_al_u956_o}),
    .q({open_n4992,\u_cpu/alu_out1 [6]}));  // sources/rtl/mcu/alu.v(53)
  // sources/rtl/mcu/execute.v(287)
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(C*D))"),
    //.LUTF1("(C*~(B*~(~D*~A)))"),
    //.LUTG0("(~B*~(C*D))"),
    //.LUTG1("(C*~(B*~(~D*~A)))"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000001100110011),
    .INIT_LUTF1(16'b0011000001110000),
    .INIT_LUTG0(16'b0000001100110011),
    .INIT_LUTG1(16'b0011000001110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u961|u_cpu/u_execute/reg4_b6  (
    .a({\u_cpu/u_execute/n47 [6],open_n4993}),
    .b({_al_u959_o,\u_cpu/u_execute/wt_ram_cmd [1]}),
    .c({_al_u960_o,\u_cpu/u_execute/wt_ram_cmd [2]}),
    .ce(\u_bus/eq0/or_or_or_xor_i0[0]_i_o ),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/wt_ram_cmd [4],\u_cpu/u_execute/C [6]}),
    .mi({open_n4997,\u_cpu/u_execute/C [6]}),
    .f({_al_u961_o,_al_u960_o}),
    .q({open_n5013,\u_cpu/pc_wdata [6]}));  // sources/rtl/mcu/execute.v(287)
  // sources/rtl/mcu/alu.v(53)
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(C*D))"),
    //.LUTF1("(~D*~(C*~(B*~A)))"),
    //.LUTG0("(~B*~(C*D))"),
    //.LUTG1("(~D*~(C*~(B*~A)))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000001100110011),
    .INIT_LUTF1(16'b0000000001001111),
    .INIT_LUTG0(16'b0000001100110011),
    .INIT_LUTG1(16'b0000000001001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u968|u_cpu/u_alu/reg0_b5  (
    .a({_al_u964_o,open_n5014}),
    .b({_al_u965_o,\u_cpu/u_execute/wt_ram_cmd [5]}),
    .c({_al_u966_o,\u_cpu/u_execute/wt_ram_cmd [6]}),
    .ce(\u_cpu/alu_cmd [2]),
    .clk(vga_clk_pad),
    .d({_al_u967_o,\u_cpu/alu_out1 [5]}),
    .mi({open_n5018,\u_cpu/u_alu/n17 [5]}),
    .f({\u_cpu/u_execute/n47 [5],_al_u966_o}),
    .q({open_n5034,\u_cpu/alu_out1 [5]}));  // sources/rtl/mcu/alu.v(53)
  // sources/rtl/mcu/execute.v(287)
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(C*D))"),
    //.LUTF1("(C*~(B*~(~D*~A)))"),
    //.LUTG0("(~B*~(C*D))"),
    //.LUTG1("(C*~(B*~(~D*~A)))"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000001100110011),
    .INIT_LUTF1(16'b0011000001110000),
    .INIT_LUTG0(16'b0000001100110011),
    .INIT_LUTG1(16'b0011000001110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u971|u_cpu/u_execute/reg4_b5  (
    .a({\u_cpu/u_execute/n47 [5],open_n5035}),
    .b({_al_u969_o,\u_cpu/u_execute/wt_ram_cmd [1]}),
    .c({_al_u970_o,\u_cpu/u_execute/wt_ram_cmd [2]}),
    .ce(\u_bus/eq0/or_or_or_xor_i0[0]_i_o ),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/wt_ram_cmd [4],\u_cpu/u_execute/C [5]}),
    .mi({open_n5039,\u_cpu/u_execute/C [5]}),
    .f({_al_u971_o,_al_u970_o}),
    .q({open_n5055,\u_cpu/pc_wdata [5]}));  // sources/rtl/mcu/execute.v(287)
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTF1("(~C*~(B*~(A)*~(D)+B*A*~(D)+~(B)*A*D+B*A*D))"),
    //.LUTG0("(B*~(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTG1("(~C*~(B*~(A)*~(D)+B*A*~(D)+~(B)*A*D+B*A*D))"),
    .INIT_LUTF0(16'b0000100001001100),
    .INIT_LUTF1(16'b0000010100000011),
    .INIT_LUTG0(16'b0000100001001100),
    .INIT_LUTG1(16'b0000010100000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u974|_al_u866  (
    .a({\u_cpu/alu_out4 [4],\u_cpu/u_execute/n0_lutinv }),
    .b({ram_wdata[4],\u_cpu/u_execute/ram_to_a_wen }),
    .c({\u_cpu/u_execute/wt_ram_cmd [8],ram_wdata[4]}),
    .d({\u_cpu/u_execute/wt_ram_cmd [9],ram_rdata[4]}),
    .f({_al_u974_o,_al_u866_o}));
  // sources/rtl/mcu/alu.v(53)
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(C*D))"),
    //.LUT1("(~D*~(C*~(B*~A)))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000001100110011),
    .INIT_LUT1(16'b0000000001001111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u978|u_cpu/u_alu/reg0_b4  (
    .a({_al_u974_o,open_n5080}),
    .b({_al_u975_o,\u_cpu/u_execute/wt_ram_cmd [5]}),
    .c({_al_u976_o,\u_cpu/u_execute/wt_ram_cmd [6]}),
    .ce(\u_cpu/alu_cmd [2]),
    .clk(vga_clk_pad),
    .d({_al_u977_o,\u_cpu/alu_out1 [4]}),
    .mi({open_n5091,\u_cpu/u_alu/n17 [4]}),
    .f({\u_cpu/u_execute/n47 [4],_al_u976_o}),
    .q({open_n5096,\u_cpu/alu_out1 [4]}));  // sources/rtl/mcu/alu.v(53)
  // sources/rtl/mcu/execute.v(287)
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(C*D))"),
    //.LUT1("(C*~(B*~(~D*~A)))"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000001100110011),
    .INIT_LUT1(16'b0011000001110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u981|u_cpu/u_execute/reg4_b4  (
    .a({\u_cpu/u_execute/n47 [4],open_n5097}),
    .b({_al_u979_o,\u_cpu/u_execute/wt_ram_cmd [1]}),
    .c({_al_u980_o,\u_cpu/u_execute/wt_ram_cmd [2]}),
    .ce(\u_bus/eq0/or_or_or_xor_i0[0]_i_o ),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/wt_ram_cmd [4],\u_cpu/u_execute/C [4]}),
    .mi({open_n5108,\u_cpu/u_execute/C [4]}),
    .f({_al_u981_o,_al_u980_o}),
    .q({open_n5113,\u_cpu/pc_wdata [4]}));  // sources/rtl/mcu/execute.v(287)
  // sources/rtl/mcu/execute.v(359)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*~(D*~A))"),
    //.LUT1("(~D*~(C*~(B*~A)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000001000000011),
    .INIT_LUT1(16'b0000000001001111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u988|u_cpu/u_execute/reg8_b7  (
    .a({_al_u984_o,\u_cpu/alu_out3 [3]}),
    .b({_al_u985_o,\u_cpu/u_execute/wt_ram_cmd [6]}),
    .c({_al_u986_o,\u_cpu/u_execute/wt_ram_cmd [7]}),
    .clk(vga_clk_pad),
    .d({_al_u987_o,\u_cpu/u_execute/wt_ram_cmd [8]}),
    .mi({open_n5125,\u_cpu/decode_cmd [36]}),
    .f({\u_cpu/u_execute/n47 [3],_al_u985_o}),
    .q({open_n5130,\u_cpu/u_execute/wt_ram_cmd [7]}));  // sources/rtl/mcu/execute.v(359)
  // sources/rtl/mcu/alu.v(53)
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(C*D))"),
    //.LUTF1("(~D*~(C*~(B*~A)))"),
    //.LUTG0("(~B*~(C*D))"),
    //.LUTG1("(~D*~(C*~(B*~A)))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000001100110011),
    .INIT_LUTF1(16'b0000000001001111),
    .INIT_LUTG0(16'b0000001100110011),
    .INIT_LUTG1(16'b0000000001001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u998|u_cpu/u_alu/reg0_b2  (
    .a({_al_u994_o,open_n5131}),
    .b({_al_u995_o,\u_cpu/u_execute/wt_ram_cmd [5]}),
    .c({_al_u996_o,\u_cpu/u_execute/wt_ram_cmd [6]}),
    .ce(\u_cpu/alu_cmd [2]),
    .clk(vga_clk_pad),
    .d({_al_u997_o,\u_cpu/alu_out1 [2]}),
    .mi({open_n5135,\u_cpu/u_alu/n17 [2]}),
    .f({\u_cpu/u_execute/n47 [2],_al_u996_o}),
    .q({open_n5151,\u_cpu/alu_out1 [2]}));  // sources/rtl/mcu/alu.v(53)
  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  // sources/rtl/mcu/bus.v(62)
  // sources/rtl/mcu/bus.v(62)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~A*~(~C*~B))"),
    //.LUTF1("(~D*~A*~(~C*~B))"),
    //.LUTG0("(~D*~A*~(~C*~B))"),
    //.LUTG1("(~D*~A*~(~C*~B))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000001010100),
    .INIT_LUTF1(16'b0000000001010100),
    .INIT_LUTG0(16'b0000000001010100),
    .INIT_LUTG1(16'b0000000001010100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_bus/reg0_b3|u_bus/reg0_b7  (
    .a({\u_cpu/u_execute/bus_to_a_wen ,\u_cpu/u_execute/bus_to_a_wen }),
    .b({\u_cpu/u_execute/ram_to_a_wen ,\u_cpu/u_execute/ram_to_a_wen }),
    .c({bus_wdata[3],bus_wdata[7]}),
    .ce(\u_bus/mux0_b0_sel_is_3_o ),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/rom_to_a_wen ,\u_cpu/u_execute/rom_to_a_wen }),
    .mi({bus_wdata[3],bus_wdata[7]}),
    .f({_al_u882_o,_al_u826_o}),
    .q({vram_addr[3],vram_addr[7]}));  // sources/rtl/mcu/bus.v(62)
  // sources/rtl/mcu/bus.v(62)
  // sources/rtl/mcu/bus.v(62)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~A*~(~C*~B))"),
    //.LUTF1("(~D*~A*~(~C*~B))"),
    //.LUTG0("(~D*~A*~(~C*~B))"),
    //.LUTG1("(~D*~A*~(~C*~B))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000001010100),
    .INIT_LUTF1(16'b0000000001010100),
    .INIT_LUTG0(16'b0000000001010100),
    .INIT_LUTG1(16'b0000000001010100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_bus/reg0_b4|u_bus/reg0_b6  (
    .a({\u_cpu/u_execute/bus_to_a_wen ,\u_cpu/u_execute/bus_to_a_wen }),
    .b({\u_cpu/u_execute/ram_to_a_wen ,\u_cpu/u_execute/ram_to_a_wen }),
    .c({bus_wdata[4],bus_wdata[6]}),
    .ce(\u_bus/mux0_b0_sel_is_3_o ),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/rom_to_a_wen ,\u_cpu/u_execute/rom_to_a_wen }),
    .mi({bus_wdata[4],bus_wdata[6]}),
    .f({_al_u867_o,_al_u838_o}),
    .q({vram_addr[4],vram_addr[6]}));  // sources/rtl/mcu/bus.v(62)
  // sources/rtl/mcu/bus.v(78)
  // sources/rtl/mcu/bus.v(78)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_bus/reg1_b1|u_bus/reg1_b5  (
    .c({key_deb[1],key_deb[5]}),
    .ce(bus_ren),
    .clk(vga_clk_pad),
    .d({\u_bus/n1_lutinv ,\u_bus/n1_lutinv }),
    .q({bus_rdata[1],bus_rdata[5]}));  // sources/rtl/mcu/bus.v(78)
  // sources/rtl/mcu/bus.v(78)
  // sources/rtl/mcu/bus.v(78)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_bus/reg1_b2|u_bus/reg1_b4  (
    .c({key_deb[2],key_deb[4]}),
    .ce(bus_ren),
    .clk(vga_clk_pad),
    .d({\u_bus/n1_lutinv ,\u_bus/n1_lutinv }),
    .q({bus_rdata[2],bus_rdata[4]}));  // sources/rtl/mcu/bus.v(78)
  // sources/rtl/mcu/bus.v(86)
  // sources/rtl/mcu/bus.v(86)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_bus/vram_ren_reg|u_bus/clear_reg  (
    .c({bus_wen,bus_ren}),
    .clk(vga_clk_pad),
    .d({\u_bus/n1_lutinv ,\u_bus/n1_lutinv }),
    .f({\u_bus/mux0_b0_sel_is_3_o ,open_n5305}),
    .q({vram_ren,clear}));  // sources/rtl/mcu/bus.v(86)
  EG_PHY_LSLICE #(
    //.MACRO("u_cpu/u_alu/add0/ucin_al_u1100"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_cpu/u_alu/add0/u3_al_u1101  (
    .a({bus_wdata[5],bus_wdata[3]}),
    .b({bus_wdata[6],bus_wdata[4]}),
    .c(2'b00),
    .d({\u_cpu/alu_in2 [5],\u_cpu/alu_in2 [3]}),
    .e({\u_cpu/alu_in2 [6],\u_cpu/alu_in2 [4]}),
    .fci(\u_cpu/u_alu/add0/c3 ),
    .f({\u_cpu/u_alu/n4 [5],\u_cpu/u_alu/n4 [3]}),
    .fco(\u_cpu/u_alu/add0/c7 ),
    .fx({\u_cpu/u_alu/n4 [6],\u_cpu/u_alu/n4 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cpu/u_alu/add0/ucin_al_u1100"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_cpu/u_alu/add0/u7_al_u1102  (
    .a({open_n5327,bus_wdata[7]}),
    .c(2'b00),
    .d({open_n5332,\u_cpu/alu_in2 [7]}),
    .fci(\u_cpu/u_alu/add0/c7 ),
    .f({open_n5349,\u_cpu/u_alu/n4 [7]}),
    .fx({open_n5351,\u_cpu/u_alu/n3 }));
  EG_PHY_LSLICE #(
    //.MACRO("u_cpu/u_alu/add0/ucin_al_u1100"),
    //.R_POSITION("X0Y0Z0"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_alu/add0/ucin_al_u1100  (
    .a({bus_wdata[1],1'b0}),
    .b({bus_wdata[2],bus_wdata[0]}),
    .c(2'b00),
    .ce(\u_bus/mux0_b0_sel_is_3_o ),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_in2 [1],1'b1}),
    .e({\u_cpu/alu_in2 [2],\u_cpu/alu_in2 [0]}),
    .mi(bus_wdata[2:1]),
    .f({\u_cpu/u_alu/n4 [1],open_n5367}),
    .fco(\u_cpu/u_alu/add0/c3 ),
    .fx({\u_cpu/u_alu/n4 [2],\u_cpu/u_alu/n4 [0]}),
    .q(vram_addr[2:1]));
  EG_PHY_MSLICE #(
    //.MACRO("u_cpu/u_alu/lt0_0|u_cpu/u_alu/lt0_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_alu/lt0_0|u_cpu/u_alu/lt0_cin  (
    .a({\u_cpu/alu_in2 [0],1'b0}),
    .b({bus_wdata[0],open_n5368}),
    .ce(\u_bus/n22 ),
    .clk(vga_clk_pad),
    .mi({open_n5383,bus_wdata[0]}),
    .fco(\u_cpu/u_alu/lt0_c1 ),
    .q({open_n5389,vram_wdata}));
  EG_PHY_MSLICE #(
    //.MACRO("u_cpu/u_alu/lt0_0|u_cpu/u_alu/lt0_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_cpu/u_alu/lt0_2|u_cpu/u_alu/lt0_1  (
    .a(\u_cpu/alu_in2 [2:1]),
    .b(bus_wdata[2:1]),
    .fci(\u_cpu/u_alu/lt0_c1 ),
    .fco(\u_cpu/u_alu/lt0_c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_cpu/u_alu/lt0_0|u_cpu/u_alu/lt0_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_cpu/u_alu/lt0_4|u_cpu/u_alu/lt0_3  (
    .a(\u_cpu/alu_in2 [4:3]),
    .b(bus_wdata[4:3]),
    .fci(\u_cpu/u_alu/lt0_c3 ),
    .fco(\u_cpu/u_alu/lt0_c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_cpu/u_alu/lt0_0|u_cpu/u_alu/lt0_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_cpu/u_alu/lt0_6|u_cpu/u_alu/lt0_5  (
    .a(\u_cpu/alu_in2 [6:5]),
    .b(bus_wdata[6:5]),
    .fci(\u_cpu/u_alu/lt0_c5 ),
    .fco(\u_cpu/u_alu/lt0_c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_cpu/u_alu/lt0_0|u_cpu/u_alu/lt0_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_cpu/u_alu/lt0_cout|u_cpu/u_alu/lt0_7  (
    .a({1'b0,\u_cpu/alu_in2 [7]}),
    .b({1'b1,bus_wdata[7]}),
    .fci(\u_cpu/u_alu/lt0_c7 ),
    .f({\u_cpu/u_alu/n35 ,open_n5480}));
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
    .p({open_n5568,open_n5569,open_n5570,open_n5571,open_n5572,open_n5573,open_n5574,open_n5575,open_n5576,open_n5577,open_n5578,\u_vram/n5 [7:1],open_n5579,open_n5580,\u_cpu/u_alu/n17 }));
  // sources/rtl/mcu/alu.v(53)
  // sources/rtl/mcu/alu.v(53)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_alu/reg0_b10|u_cpu/u_alu/reg0_b15  (
    .c({\u_cpu/u_execute/wt_ram_cmd [5],\u_cpu/u_execute/wt_ram_cmd [5]}),
    .ce(\u_cpu/alu_cmd [2]),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_out1 [10],\u_cpu/alu_out1 [15]}),
    .mi({\u_cpu/u_alu/n17 [10],\u_cpu/u_alu/n17 [15]}),
    .f({_al_u997_o,_al_u947_o}),
    .q({\u_cpu/alu_out1 [10],\u_cpu/alu_out1 [15]}));  // sources/rtl/mcu/alu.v(53)
  // sources/rtl/mcu/alu.v(53)
  // sources/rtl/mcu/alu.v(53)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_alu/reg0_b11|u_cpu/u_alu/reg0_b14  (
    .c({\u_cpu/u_execute/wt_ram_cmd [5],\u_cpu/u_execute/wt_ram_cmd [5]}),
    .ce(\u_cpu/alu_cmd [2]),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_out1 [11],\u_cpu/alu_out1 [14]}),
    .mi({\u_cpu/u_alu/n17 [11],\u_cpu/u_alu/n17 [14]}),
    .f({_al_u987_o,_al_u957_o}),
    .q({\u_cpu/alu_out1 [11],\u_cpu/alu_out1 [14]}));  // sources/rtl/mcu/alu.v(53)
  // sources/rtl/mcu/alu.v(53)
  // sources/rtl/mcu/alu.v(53)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_alu/reg0_b12|u_cpu/u_alu/reg0_b13  (
    .c({\u_cpu/u_execute/wt_ram_cmd [5],\u_cpu/u_execute/wt_ram_cmd [5]}),
    .ce(\u_cpu/alu_cmd [2]),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_out1 [12],\u_cpu/alu_out1 [13]}),
    .mi({\u_cpu/u_alu/n17 [12],\u_cpu/u_alu/n17 [13]}),
    .f({_al_u977_o,_al_u967_o}),
    .q({\u_cpu/alu_out1 [12],\u_cpu/alu_out1 [13]}));  // sources/rtl/mcu/alu.v(53)
  // sources/rtl/mcu/alu.v(53)
  // sources/rtl/mcu/alu.v(53)
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(C*D))"),
    //.LUT1("(~B*~(C*D))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000001100110011),
    .INIT_LUT1(16'b0000001100110011),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_alu/reg0_b1|u_cpu/u_alu/reg0_b3  (
    .b({\u_cpu/u_execute/wt_ram_cmd [5],\u_cpu/u_execute/wt_ram_cmd [5]}),
    .c({\u_cpu/u_execute/wt_ram_cmd [6],\u_cpu/u_execute/wt_ram_cmd [6]}),
    .ce(\u_cpu/alu_cmd [2]),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_out1 [1],\u_cpu/alu_out1 [3]}),
    .mi({\u_cpu/u_alu/n17 [1],\u_cpu/u_alu/n17 [3]}),
    .f({_al_u1006_o,_al_u986_o}),
    .q({\u_cpu/alu_out1 [1],\u_cpu/alu_out1 [3]}));  // sources/rtl/mcu/alu.v(53)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/mcu/alu.v(62)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    //.LUT1("(~(~B*~A)*~(C)*~(D)+~(~B*~A)*C*~(D)+~(~(~B*~A))*C*D+~(~B*~A)*C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000110000000000),
    .INIT_LUT1(16'b1111000011101110),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_alu/reg1_b0|u_vram/axis_en_d2_reg  (
    .a({_al_u745_o,open_n5659}),
    .b({_al_u746_o,\u_vram/axis_en_d2 }),
    .c({\u_cpu/u_alu/n35 ,\u_vram/n9 }),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_cmd [3],_al_u574_o}),
    .mi({open_n5671,\u_vram/axis_en_d1 }),
    .f({open_n5673,\u_vram/mux3_b12_sel_is_1_o }),
    .q({\u_cpu/alu_out2 [0],\u_vram/axis_en_d2 }));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/mcu/execute.v(301)
  // sources/rtl/mcu/alu.v(75)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~(D*~(B*A)))"),
    //.LUTF1("~(~A*~(C*~(~D*~B)))"),
    //.LUTG0("(~C*~(D*~(B*A)))"),
    //.LUTG1("~(~A*~(C*~(~D*~B)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000100000001111),
    .INIT_LUTF1(16'b1111101011101010),
    .INIT_LUTG0(16'b0000100000001111),
    .INIT_LUTG1(16'b1111101011101010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_alu/reg2_b0|u_cpu/u_execute/reg6_b5  (
    .a({_al_u693_o,bus_wdata[0]}),
    .b({\u_cpu/u_alu/n56 [0],\u_cpu/alu_in2 [0]}),
    .c({_al_u697_o,\u_cpu/alu_cmd [5]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_cmd [6],\u_cpu/alu_cmd [6]}),
    .mi({open_n5681,\u_cpu/decode_cmd [20]}),
    .f({open_n5694,_al_u697_o}),
    .q({\u_cpu/alu_out3 [0],\u_cpu/alu_cmd [5]}));  // sources/rtl/mcu/execute.v(301)
  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/alu.v(84)
  EG_PHY_LSLICE #(
    //.LUTF0("(A*~(D*~(~C*B)))"),
    //.LUTF1("~(~(~C*B)*~(~D*~A))"),
    //.LUTG0("(A*~(D*~(~C*B)))"),
    //.LUTG1("~(~(~C*B)*~(~D*~A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000100010101010),
    .INIT_LUTF1(16'b0000110001011101),
    .INIT_LUTG0(16'b0000100010101010),
    .INIT_LUTG1(16'b0000110001011101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_alu/reg3_b4|u_cpu/u_execute/reg5_b9  (
    .a({_al_u804_o,_al_u699_o}),
    .b({_al_u805_o,_al_u700_o}),
    .c({_al_u806_o,\u_cpu/alu_in2 [1]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_cmd [9],\u_cpu/alu_in2 [2]}),
    .mi({open_n5702,\u_cpu/alu_in2 [1]}),
    .f({open_n5715,_al_u805_o}),
    .q({\u_cpu/alu_out4 [4],\u_cpu/timer_wdata [9]}));  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(301)
  // sources/rtl/mcu/alu.v(46)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    //.LUT1("(~D*~(C*~B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000001100000101),
    .INIT_LUT1(16'b0000000011001111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_alu/reg4_b0|u_cpu/u_execute/reg6_b0  (
    .a({open_n5719,\u_cpu/alu_out0 [0]}),
    .b({\u_cpu/u_alu/n4 [0],\u_cpu/u_alu/n5 [0]}),
    .c({\u_cpu/alu_cmd [0],\u_cpu/alu_cmd [0]}),
    .clk(vga_clk_pad),
    .d({_al_u305_o,\u_cpu/alu_cmd [1]}),
    .mi({open_n5731,\u_cpu/decode_cmd [15]}),
    .f({open_n5733,_al_u305_o}),
    .q({\u_cpu/alu_out0 [0],\u_cpu/alu_cmd [0]}));  // sources/rtl/mcu/execute.v(301)
  // sources/rtl/mcu/execute.v(301)
  // sources/rtl/mcu/alu.v(46)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    //.LUTF1("(~D*~(C*~B))"),
    //.LUTG0("(~C*~(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    //.LUTG1("(~D*~(C*~B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000001100000101),
    .INIT_LUTF1(16'b0000000011001111),
    .INIT_LUTG0(16'b0000001100000101),
    .INIT_LUTG1(16'b0000000011001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_alu/reg4_b1|u_cpu/u_execute/reg6_b1  (
    .a({open_n5737,\u_cpu/alu_out0 [1]}),
    .b({\u_cpu/u_alu/n4 [1],\u_cpu/u_alu/n5 [1]}),
    .c({\u_cpu/alu_cmd [0],\u_cpu/alu_cmd [0]}),
    .clk(vga_clk_pad),
    .d({_al_u303_o,\u_cpu/alu_cmd [1]}),
    .mi({open_n5742,\u_cpu/decode_cmd [16]}),
    .f({open_n5755,_al_u303_o}),
    .q({\u_cpu/alu_out0 [1],\u_cpu/alu_cmd [1]}));  // sources/rtl/mcu/execute.v(301)
  EG_PHY_MSLICE #(
    //.MACRO("u_cpu/u_alu/sub0/u0|u_cpu/u_alu/sub0/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("SUB_CARRY"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000000101),
    .INIT_LUT1(16'b1001100110011010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_alu/sub0/u0|u_cpu/u_alu/sub0/ucin  (
    .a({bus_wdata[0],1'b0}),
    .b({\u_cpu/alu_in2 [0],open_n5759}),
    .ce(\u_bus/mux0_b0_sel_is_3_o ),
    .clk(vga_clk_pad),
    .mi({open_n5774,bus_wdata[0]}),
    .f({\u_cpu/u_alu/n5 [0],open_n5776}),
    .fco(\u_cpu/u_alu/sub0/c1 ),
    .q({open_n5779,vram_addr[0]}));
  EG_PHY_MSLICE #(
    //.MACRO("u_cpu/u_alu/sub0/u0|u_cpu/u_alu/sub0/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("SUB"),
    .INIT_LUT0(16'b1001100110011010),
    .INIT_LUT1(16'b1001100110011010),
    .MODE("RIPPLE"))
    \u_cpu/u_alu/sub0/u2|u_cpu/u_alu/sub0/u1  (
    .a(bus_wdata[2:1]),
    .b(\u_cpu/alu_in2 [2:1]),
    .fci(\u_cpu/u_alu/sub0/c1 ),
    .f(\u_cpu/u_alu/n5 [2:1]),
    .fco(\u_cpu/u_alu/sub0/c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_cpu/u_alu/sub0/u0|u_cpu/u_alu/sub0/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("SUB"),
    .INIT_LUT0(16'b1001100110011010),
    .INIT_LUT1(16'b1001100110011010),
    .MODE("RIPPLE"))
    \u_cpu/u_alu/sub0/u4|u_cpu/u_alu/sub0/u3  (
    .a(bus_wdata[4:3]),
    .b(\u_cpu/alu_in2 [4:3]),
    .fci(\u_cpu/u_alu/sub0/c3 ),
    .f(\u_cpu/u_alu/n5 [4:3]),
    .fco(\u_cpu/u_alu/sub0/c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_cpu/u_alu/sub0/u0|u_cpu/u_alu/sub0/ucin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("SUB"),
    .INIT_LUT0(16'b1001100110011010),
    .INIT_LUT1(16'b1001100110011010),
    .MODE("RIPPLE"))
    \u_cpu/u_alu/sub0/u6|u_cpu/u_alu/sub0/u5  (
    .a(bus_wdata[6:5]),
    .b(\u_cpu/alu_in2 [6:5]),
    .fci(\u_cpu/u_alu/sub0/c5 ),
    .f(\u_cpu/u_alu/n5 [6:5]),
    .fco(\u_cpu/u_alu/sub0/c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_cpu/u_alu/sub0/u0|u_cpu/u_alu/sub0/ucin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("SUB"),
    .INIT_LUT0(16'b1001100110011010),
    .INIT_LUT1(16'b1001100110011010),
    .MODE("RIPPLE"))
    \u_cpu/u_alu/sub0/ucout|u_cpu/u_alu/sub0/u7  (
    .a({open_n5846,bus_wdata[7]}),
    .b({open_n5847,\u_cpu/alu_in2 [7]}),
    .fci(\u_cpu/u_alu/sub0/c7 ),
    .f(\u_cpu/u_alu/n5 [8:7]));
  EG_PHY_LSLICE #(
    //.MACRO("u_cpu/u_debug/add0/ucin_al_u1062"),
    //.R_POSITION("X0Y1Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_cpu/u_debug/add0/u11_al_u1065  (
    .a({rom_waddr[13],rom_waddr[11]}),
    .b({rom_waddr[14],rom_waddr[12]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_cpu/u_debug/add0/c11 ),
    .f({\u_cpu/u_debug/n7 [13],\u_cpu/u_debug/n7 [11]}),
    .fco(\u_cpu/u_debug/add0/c15 ),
    .fx({\u_cpu/u_debug/n7 [14],\u_cpu/u_debug/n7 [12]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cpu/u_debug/add0/ucin_al_u1062"),
    //.R_POSITION("X0Y2Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_cpu/u_debug/add0/u15_al_u1066  (
    .a({rom_waddr[17],rom_waddr[15]}),
    .b({rom_waddr[18],rom_waddr[16]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_cpu/u_debug/add0/c15 ),
    .f({\u_cpu/u_debug/n7 [17],\u_cpu/u_debug/n7 [15]}),
    .fco(\u_cpu/u_debug/add0/c19 ),
    .fx({\u_cpu/u_debug/n7 [18],\u_cpu/u_debug/n7 [16]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cpu/u_debug/add0/ucin_al_u1062"),
    //.R_POSITION("X0Y2Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_cpu/u_debug/add0/u19_al_u1067  (
    .a({rom_waddr[21],rom_waddr[19]}),
    .b({rom_waddr[22],rom_waddr[20]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_cpu/u_debug/add0/c19 ),
    .f({\u_cpu/u_debug/n7 [21],\u_cpu/u_debug/n7 [19]}),
    .fco(\u_cpu/u_debug/add0/c23 ),
    .fx({\u_cpu/u_debug/n7 [22],\u_cpu/u_debug/n7 [20]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cpu/u_debug/add0/ucin_al_u1062"),
    //.R_POSITION("X0Y3Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_cpu/u_debug/add0/u23_al_u1068  (
    .a({open_n5925,rom_waddr[23]}),
    .c(2'b00),
    .d({open_n5930,1'b0}),
    .fci(\u_cpu/u_debug/add0/c23 ),
    .f({open_n5947,\u_cpu/u_debug/n7 [23]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cpu/u_debug/add0/ucin_al_u1062"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_cpu/u_debug/add0/u3_al_u1063  (
    .a({rom_waddr[5],rom_waddr[3]}),
    .b({rom_waddr[6],rom_waddr[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_cpu/u_debug/add0/c3 ),
    .f({\u_cpu/u_debug/n7 [5],\u_cpu/u_debug/n7 [3]}),
    .fco(\u_cpu/u_debug/add0/c7 ),
    .fx({\u_cpu/u_debug/n7 [6],\u_cpu/u_debug/n7 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cpu/u_debug/add0/ucin_al_u1062"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_cpu/u_debug/add0/u7_al_u1064  (
    .a({rom_waddr[9],rom_waddr[7]}),
    .b({rom_waddr[10],rom_waddr[8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_cpu/u_debug/add0/c7 ),
    .f({\u_cpu/u_debug/n7 [9],\u_cpu/u_debug/n7 [7]}),
    .fco(\u_cpu/u_debug/add0/c11 ),
    .fx({\u_cpu/u_debug/n7 [10],\u_cpu/u_debug/n7 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cpu/u_debug/add0/ucin_al_u1062"),
    //.R_POSITION("X0Y0Z0"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_cpu/u_debug/add0/ucin_al_u1062  (
    .a({rom_waddr[1],1'b0}),
    .b({rom_waddr[2],rom_waddr[0]}),
    .c(2'b00),
    .ce(rom_wen),
    .clk(vga_clk_pad),
    .d(2'b01),
    .e(2'b01),
    .mi(\u_cpu/u_debug/n7 [2:1]),
    .sr(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .f({\u_cpu/u_debug/n7 [1],open_n6001}),
    .fco(\u_cpu/u_debug/add0/c3 ),
    .fx({\u_cpu/u_debug/n7 [2],\u_cpu/u_debug/n7 [0]}),
    .q(rom_waddr[2:1]));
  EG_PHY_LSLICE #(
    //.MACRO("u_cpu/u_debug/add1/ucin_al_u1089"),
    //.R_POSITION("X0Y1Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_cpu/u_debug/add1/u11_al_u1092  (
    .a({open_n6002,\u_cpu/dbg_rom_raddr [11]}),
    .c(2'b00),
    .d({open_n6007,1'b0}),
    .fci(\u_cpu/u_debug/add1/c11 ),
    .f({open_n6024,\u_cpu/u_debug/n13 [11]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cpu/u_debug/add1/ucin_al_u1089"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_cpu/u_debug/add1/u3_al_u1090  (
    .a({\u_cpu/dbg_rom_raddr [5],\u_cpu/dbg_rom_raddr [3]}),
    .b({\u_cpu/dbg_rom_raddr [6],\u_cpu/dbg_rom_raddr [4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_cpu/u_debug/add1/c3 ),
    .f({\u_cpu/u_debug/n13 [5],\u_cpu/u_debug/n13 [3]}),
    .fco(\u_cpu/u_debug/add1/c7 ),
    .fx({\u_cpu/u_debug/n13 [6],\u_cpu/u_debug/n13 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cpu/u_debug/add1/ucin_al_u1089"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_cpu/u_debug/add1/u7_al_u1091  (
    .a({\u_cpu/dbg_rom_raddr [9],\u_cpu/dbg_rom_raddr [7]}),
    .b({\u_cpu/dbg_rom_raddr [10],\u_cpu/dbg_rom_raddr [8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_cpu/u_debug/add1/c7 ),
    .f({\u_cpu/u_debug/n13 [9],\u_cpu/u_debug/n13 [7]}),
    .fco(\u_cpu/u_debug/add1/c11 ),
    .fx({\u_cpu/u_debug/n13 [10],\u_cpu/u_debug/n13 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cpu/u_debug/add1/ucin_al_u1089"),
    //.R_POSITION("X0Y0Z0"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_cpu/u_debug/add1/ucin_al_u1089  (
    .a({\u_cpu/dbg_rom_raddr [1],1'b0}),
    .b({\u_cpu/dbg_rom_raddr [2],\u_cpu/dbg_rom_raddr [0]}),
    .c(2'b00),
    .ce(\u_cpu/dbg_rom_ren ),
    .clk(vga_clk_pad),
    .d(2'b01),
    .e(2'b01),
    .mi(\u_cpu/u_debug/n13 [1:0]),
    .sr(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .f({\u_cpu/u_debug/n13 [1],open_n6078}),
    .fco(\u_cpu/u_debug/add1/c3 ),
    .fx({\u_cpu/u_debug/n13 [2],\u_cpu/u_debug/n13 [0]}),
    .q(\u_cpu/dbg_rom_raddr [1:0]));
  // sources/rtl/uart/ubus.v(135)
  // sources/rtl/mcu/debug.v(100)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~C*B*A)"),
    //.LUT1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000100000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_debug/dbg_inst_en_reg|u_uart/u_ubus/recv_en_reg  (
    .a({open_n6079,_al_u471_o}),
    .b({open_n6080,recv_en}),
    .c({recv_en,recv_cmd[2]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_debug/debug_cmd ,recv_cmd[3]}),
    .mi({open_n6092,\u_uart/u_ubus/frame_head_flag }),
    .f({open_n6094,_al_u678_o}),
    .q({\u_cpu/dbg_inst_en ,recv_en}));  // sources/rtl/uart/ubus.v(135)
  // sources/rtl/mcu/debug.v(100)
  // sources/rtl/mcu/debug.v(100)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_debug/reg0_b1|u_cpu/u_debug/reg0_b7  (
    .ce(\u_cpu/u_debug/debug_cmd ),
    .clk(vga_clk_pad),
    .mi({recv_data[1],recv_data[7]}),
    .q({\u_cpu/dbg_inst [1],\u_cpu/dbg_inst [7]}));  // sources/rtl/mcu/debug.v(100)
  // sources/rtl/mcu/debug.v(100)
  // sources/rtl/mcu/debug.v(100)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_debug/reg0_b2|u_cpu/u_debug/reg0_b6  (
    .ce(\u_cpu/u_debug/debug_cmd ),
    .clk(vga_clk_pad),
    .mi({recv_data[2],recv_data[6]}),
    .q({\u_cpu/dbg_inst [2],\u_cpu/dbg_inst [6]}));  // sources/rtl/mcu/debug.v(100)
  // sources/rtl/mcu/debug.v(100)
  // sources/rtl/mcu/debug.v(100)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_debug/reg0_b3|u_cpu/u_debug/reg0_b5  (
    .ce(\u_cpu/u_debug/debug_cmd ),
    .clk(vga_clk_pad),
    .mi({recv_data[3],recv_data[5]}),
    .q({\u_cpu/dbg_inst [3],\u_cpu/dbg_inst [5]}));  // sources/rtl/mcu/debug.v(100)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_debug/reg0_b4  (
    .ce(\u_cpu/u_debug/debug_cmd ),
    .clk(vga_clk_pad),
    .mi({open_n6185,recv_data[4]}),
    .q({open_n6203,\u_cpu/dbg_inst [4]}));  // sources/rtl/mcu/debug.v(100)
  // sources/rtl/mcu/debug.v(142)
  // sources/rtl/mcu/debug.v(109)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*D)"),
    //.LUTF1("(C*~B*D)"),
    //.LUTG0("(~C*~B*D)"),
    //.LUTG1("(C*~B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000001100000000),
    .INIT_LUTF1(16'b0011000000000000),
    .INIT_LUTG0(16'b0000001100000000),
    .INIT_LUTG1(16'b0011000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_debug/reg1_b0|u_cpu/u_debug/rom_ren_reg  (
    .b({recv_cmd[0],recv_cmd[0]}),
    .c({recv_cmd[1],recv_cmd[1]}),
    .clk(vga_clk_pad),
    .d({_al_u673_o,_al_u673_o}),
    .q({\u_cpu/read_abcd [0],\u_cpu/dbg_rom_ren }));  // sources/rtl/mcu/debug.v(142)
  // sources/rtl/mcu/debug.v(109)
  // sources/rtl/mcu/debug.v(109)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*D)"),
    //.LUTF1("(~C*B*D)"),
    //.LUTG0("(~C*~B*D)"),
    //.LUTG1("(~C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000001100000000),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b0000001100000000),
    .INIT_LUTG1(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_debug/reg1_b3|u_cpu/u_debug/reg1_b2  (
    .b({recv_cmd[0],recv_cmd[0]}),
    .c({recv_cmd[1],recv_cmd[1]}),
    .clk(vga_clk_pad),
    .d({_al_u678_o,_al_u678_o}),
    .q(\u_cpu/read_abcd [3:2]));  // sources/rtl/mcu/debug.v(109)
  // sources/rtl/mcu/debug.v(127)
  // sources/rtl/mcu/debug.v(127)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*D)"),
    //.LUTF1("(D*~C*~B*A)"),
    //.LUTG0("(C*~B*D)"),
    //.LUTG1("(D*~C*~B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011000000000000),
    .INIT_LUTF1(16'b0000001000000000),
    .INIT_LUTG0(16'b0011000000000000),
    .INIT_LUTG1(16'b0000001000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_cpu/u_debug/reg2_b0|u_cpu/u_debug/reg2_b10  (
    .a({_al_u585_o,open_n6254}),
    .b({rom_waddr[22],recv_cmd[0]}),
    .c({rom_waddr[23],recv_cmd[1]}),
    .ce(rom_wen),
    .clk(vga_clk_pad),
    .d({rom_wen,_al_u472_o}),
    .mi({\u_cpu/u_debug/n7 [0],\u_cpu/u_debug/n7 [10]}),
    .sr(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .f({_al_u586_o,\u_cpu/u_debug/clear_rom_addr_cmd }),
    .q({rom_waddr[0],rom_waddr[10]}));  // sources/rtl/mcu/debug.v(127)
  // sources/rtl/mcu/debug.v(127)
  // sources/rtl/mcu/debug.v(127)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_cpu/u_debug/reg2_b11|u_cpu/u_debug/reg2_b9  (
    .ce(rom_wen),
    .clk(vga_clk_pad),
    .mi({\u_cpu/u_debug/n7 [11],\u_cpu/u_debug/n7 [9]}),
    .sr(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .q({rom_waddr[11],rom_waddr[9]}));  // sources/rtl/mcu/debug.v(127)
  // sources/rtl/mcu/debug.v(127)
  // sources/rtl/mcu/debug.v(127)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_cpu/u_debug/reg2_b13|u_cpu/u_debug/reg2_b8  (
    .ce(rom_wen),
    .clk(vga_clk_pad),
    .mi({\u_cpu/u_debug/n7 [13],\u_cpu/u_debug/n7 [8]}),
    .sr(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .q({rom_waddr[13],rom_waddr[8]}));  // sources/rtl/mcu/debug.v(127)
  // sources/rtl/mcu/debug.v(127)
  // sources/rtl/mcu/debug.v(127)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*B*A)"),
    //.LUTF1("(~D*~C*~B*~A)"),
    //.LUTG0("(~D*~C*B*A)"),
    //.LUTG1("(~D*~C*~B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000001000),
    .INIT_LUTF1(16'b0000000000000001),
    .INIT_LUTG0(16'b0000000000001000),
    .INIT_LUTG1(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_cpu/u_debug/reg2_b14|u_cpu/u_debug/reg2_b12  (
    .a({rom_waddr[14],_al_u586_o}),
    .b({rom_waddr[15],_al_u587_o}),
    .c({rom_waddr[16],rom_waddr[12]}),
    .ce(rom_wen),
    .clk(vga_clk_pad),
    .d({rom_waddr[17],rom_waddr[13]}),
    .mi({\u_cpu/u_debug/n7 [14],\u_cpu/u_debug/n7 [12]}),
    .sr(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .f({_al_u587_o,\u_rom/n4 }),
    .q({rom_waddr[14],rom_waddr[12]}));  // sources/rtl/mcu/debug.v(127)
  // sources/rtl/mcu/debug.v(127)
  // sources/rtl/mcu/debug.v(127)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_cpu/u_debug/reg2_b15|u_cpu/u_debug/reg2_b7  (
    .ce(rom_wen),
    .clk(vga_clk_pad),
    .mi({\u_cpu/u_debug/n7 [15],\u_cpu/u_debug/n7 [7]}),
    .sr(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .q({rom_waddr[15],rom_waddr[7]}));  // sources/rtl/mcu/debug.v(127)
  // sources/rtl/mcu/debug.v(127)
  // sources/rtl/mcu/debug.v(127)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_cpu/u_debug/reg2_b16|u_cpu/u_debug/reg2_b6  (
    .ce(rom_wen),
    .clk(vga_clk_pad),
    .mi({\u_cpu/u_debug/n7 [16],\u_cpu/u_debug/n7 [6]}),
    .sr(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .q({rom_waddr[16],rom_waddr[6]}));  // sources/rtl/mcu/debug.v(127)
  // sources/rtl/mcu/debug.v(127)
  // sources/rtl/mcu/debug.v(127)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_cpu/u_debug/reg2_b17|u_cpu/u_debug/reg2_b5  (
    .ce(rom_wen),
    .clk(vga_clk_pad),
    .mi({\u_cpu/u_debug/n7 [17],\u_cpu/u_debug/n7 [5]}),
    .sr(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .q({rom_waddr[17],rom_waddr[5]}));  // sources/rtl/mcu/debug.v(127)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*~B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000000001),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_cpu/u_debug/reg2_b18  (
    .a({open_n6416,rom_waddr[18]}),
    .b({open_n6417,rom_waddr[19]}),
    .c({open_n6418,rom_waddr[20]}),
    .ce(rom_wen),
    .clk(vga_clk_pad),
    .d({open_n6419,rom_waddr[21]}),
    .mi({open_n6430,\u_cpu/u_debug/n7 [18]}),
    .sr(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .f({open_n6431,_al_u585_o}),
    .q({open_n6435,rom_waddr[18]}));  // sources/rtl/mcu/debug.v(127)
  // sources/rtl/mcu/debug.v(127)
  // sources/rtl/mcu/debug.v(127)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_cpu/u_debug/reg2_b19|u_cpu/u_debug/reg2_b4  (
    .ce(rom_wen),
    .clk(vga_clk_pad),
    .mi({\u_cpu/u_debug/n7 [19],\u_cpu/u_debug/n7 [4]}),
    .sr(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .q({rom_waddr[19],rom_waddr[4]}));  // sources/rtl/mcu/debug.v(127)
  // sources/rtl/mcu/debug.v(127)
  // sources/rtl/mcu/debug.v(127)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_cpu/u_debug/reg2_b20|u_cpu/u_debug/reg2_b3  (
    .ce(rom_wen),
    .clk(vga_clk_pad),
    .mi({\u_cpu/u_debug/n7 [20],\u_cpu/u_debug/n7 [3]}),
    .sr(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .q({rom_waddr[20],rom_waddr[3]}));  // sources/rtl/mcu/debug.v(127)
  // sources/rtl/mcu/debug.v(127)
  // sources/rtl/mcu/debug.v(127)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_cpu/u_debug/reg2_b21|u_cpu/u_debug/reg2_b23  (
    .ce(rom_wen),
    .clk(vga_clk_pad),
    .mi({\u_cpu/u_debug/n7 [21],\u_cpu/u_debug/n7 [23]}),
    .sr(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .q({rom_waddr[21],rom_waddr[23]}));  // sources/rtl/mcu/debug.v(127)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_cpu/u_debug/reg2_b22  (
    .ce(rom_wen),
    .clk(vga_clk_pad),
    .mi({open_n6527,\u_cpu/u_debug/n7 [22]}),
    .sr(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .q({open_n6533,rom_waddr[22]}));  // sources/rtl/mcu/debug.v(127)
  // sources/rtl/mcu/debug.v(136)
  // sources/rtl/mcu/debug.v(136)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_cpu/u_debug/reg3_b1|u_cpu/u_debug/reg3_b7  (
    .ce(\u_cpu/u_debug/n5 ),
    .clk(vga_clk_pad),
    .mi({recv_data[1],recv_data[7]}),
    .sr(\u_cpu/u_debug/clear_rom_data_cmd ),
    .q({rom_wdata[1],rom_wdata[7]}));  // sources/rtl/mcu/debug.v(136)
  // sources/rtl/mcu/debug.v(136)
  // sources/rtl/mcu/debug.v(136)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_cpu/u_debug/reg3_b2|u_cpu/u_debug/reg3_b6  (
    .ce(\u_cpu/u_debug/n5 ),
    .clk(vga_clk_pad),
    .mi({recv_data[2],recv_data[6]}),
    .sr(\u_cpu/u_debug/clear_rom_data_cmd ),
    .q({rom_wdata[2],rom_wdata[6]}));  // sources/rtl/mcu/debug.v(136)
  // sources/rtl/mcu/debug.v(136)
  // sources/rtl/mcu/debug.v(136)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_cpu/u_debug/reg3_b3|u_cpu/u_debug/reg3_b5  (
    .ce(\u_cpu/u_debug/n5 ),
    .clk(vga_clk_pad),
    .mi({recv_data[3],recv_data[5]}),
    .sr(\u_cpu/u_debug/clear_rom_data_cmd ),
    .q({rom_wdata[3],rom_wdata[5]}));  // sources/rtl/mcu/debug.v(136)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_cpu/u_debug/reg3_b4  (
    .ce(\u_cpu/u_debug/n5 ),
    .clk(vga_clk_pad),
    .mi({open_n6618,recv_data[4]}),
    .sr(\u_cpu/u_debug/clear_rom_data_cmd ),
    .q({open_n6635,rom_wdata[4]}));  // sources/rtl/mcu/debug.v(136)
  // sources/rtl/mcu/debug.v(151)
  // sources/rtl/mcu/debug.v(151)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_cpu/u_debug/reg4_b10|u_cpu/u_debug/reg4_b9  (
    .ce(\u_cpu/dbg_rom_ren ),
    .clk(vga_clk_pad),
    .mi(\u_cpu/u_debug/n13 [10:9]),
    .sr(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .q(\u_cpu/dbg_rom_raddr [10:9]));  // sources/rtl/mcu/debug.v(151)
  // sources/rtl/mcu/debug.v(151)
  // sources/rtl/mcu/debug.v(151)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_cpu/u_debug/reg4_b11|u_cpu/u_debug/reg4_b8  (
    .ce(\u_cpu/dbg_rom_ren ),
    .clk(vga_clk_pad),
    .mi({\u_cpu/u_debug/n13 [11],\u_cpu/u_debug/n13 [8]}),
    .sr(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .q({\u_cpu/dbg_rom_raddr [11],\u_cpu/dbg_rom_raddr [8]}));  // sources/rtl/mcu/debug.v(151)
  // sources/rtl/mcu/debug.v(151)
  // sources/rtl/mcu/debug.v(151)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_cpu/u_debug/reg4_b2|u_cpu/u_debug/reg4_b7  (
    .ce(\u_cpu/dbg_rom_ren ),
    .clk(vga_clk_pad),
    .mi({\u_cpu/u_debug/n13 [2],\u_cpu/u_debug/n13 [7]}),
    .sr(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .q({\u_cpu/dbg_rom_raddr [2],\u_cpu/dbg_rom_raddr [7]}));  // sources/rtl/mcu/debug.v(151)
  // sources/rtl/mcu/debug.v(151)
  // sources/rtl/mcu/debug.v(151)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_cpu/u_debug/reg4_b3|u_cpu/u_debug/reg4_b6  (
    .ce(\u_cpu/dbg_rom_ren ),
    .clk(vga_clk_pad),
    .mi({\u_cpu/u_debug/n13 [3],\u_cpu/u_debug/n13 [6]}),
    .sr(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .q({\u_cpu/dbg_rom_raddr [3],\u_cpu/dbg_rom_raddr [6]}));  // sources/rtl/mcu/debug.v(151)
  // sources/rtl/mcu/debug.v(151)
  // sources/rtl/mcu/debug.v(151)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_cpu/u_debug/reg4_b4|u_cpu/u_debug/reg4_b5  (
    .ce(\u_cpu/dbg_rom_ren ),
    .clk(vga_clk_pad),
    .mi({\u_cpu/u_debug/n13 [4],\u_cpu/u_debug/n13 [5]}),
    .sr(\u_cpu/u_debug/clear_rom_addr_cmd ),
    .q({\u_cpu/dbg_rom_raddr [4],\u_cpu/dbg_rom_raddr [5]}));  // sources/rtl/mcu/debug.v(151)
  // sources/rtl/mcu/debug.v(165)
  // sources/rtl/mcu/debug.v(180)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*~D))"),
    //.LUTF1("((~B*A)*~(D)*~(C)+(~B*A)*D*~(C)+~((~B*A))*D*C+(~B*A)*D*C)"),
    //.LUTG0("(C*~(~B*~D))"),
    //.LUTG1("((~B*A)*~(D)*~(C)+(~B*A)*D*~(C)+~((~B*A))*D*C+(~B*A)*D*C)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000011000000),
    .INIT_LUTF1(16'b1111001000000010),
    .INIT_LUTG0(16'b1111000011000000),
    .INIT_LUTG1(16'b1111001000000010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_debug/reg5_b0|u_cpu/u_debug/send_en_reg  (
    .a({send_cmd[0],open_n6759}),
    .b({\u_cpu/u_debug/rom_bk_en ,\u_cpu/dbg_info_en }),
    .c({\u_cpu/dbg_info_en ,send_ready}),
    .clk(vga_clk_pad),
    .d({\u_cpu/dbg_info [8],\u_cpu/u_debug/rom_bk_en }),
    .q({send_cmd[0],send_en}));  // sources/rtl/mcu/debug.v(165)
  // sources/rtl/mcu/debug.v(180)
  // sources/rtl/mcu/debug.v(180)
  EG_PHY_MSLICE #(
    //.LUT0("((~B*A)*~(D)*~(C)+(~B*A)*D*~(C)+~((~B*A))*D*C+(~B*A)*D*C)"),
    //.LUT1("((~B*A)*~(D)*~(C)+(~B*A)*D*~(C)+~((~B*A))*D*C+(~B*A)*D*C)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111001000000010),
    .INIT_LUT1(16'b1111001000000010),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_debug/reg5_b1|u_cpu/u_debug/reg5_b4  (
    .a({send_cmd[1],send_cmd[4]}),
    .b({\u_cpu/u_debug/rom_bk_en ,\u_cpu/u_debug/rom_bk_en }),
    .c({\u_cpu/dbg_info_en ,\u_cpu/dbg_info_en }),
    .clk(vga_clk_pad),
    .d({\u_cpu/dbg_info [9],\u_cpu/dbg_info [12]}),
    .q({send_cmd[1],send_cmd[4]}));  // sources/rtl/mcu/debug.v(180)
  // sources/rtl/mcu/debug.v(159)
  // sources/rtl/mcu/debug.v(180)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    //.LUT1("(~D*~(~C*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000100001101),
    .INIT_LUT1(16'b0000000011110011),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_debug/reg6_b7|u_cpu/u_debug/rom_bk_en_reg  (
    .a({open_n6802,send_data[7]}),
    .b({\u_cpu/dbg_info_en ,\u_cpu/u_debug/rom_bk_en }),
    .c({\u_cpu/dbg_info [7],\u_cpu/dbg_info_en }),
    .clk(vga_clk_pad),
    .d({_al_u369_o,\u_cpu/dbg_rom_rdata [7]}),
    .mi({open_n6814,\u_cpu/u_debug/rom_ren_d1 }),
    .f({open_n6816,_al_u369_o}),
    .q({send_data[7],\u_cpu/u_debug/rom_bk_en }));  // sources/rtl/mcu/debug.v(159)
  // sources/rtl/mcu/debug.v(159)
  // sources/rtl/mcu/debug.v(159)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_debug/rom_ren_d1_reg|u_cpu/u_debug/rom_ren_d0_reg  (
    .clk(vga_clk_pad),
    .mi({\u_cpu/u_debug/rom_ren_d0 ,\u_cpu/dbg_rom_ren }),
    .q({\u_cpu/u_debug/rom_ren_d1 ,\u_cpu/u_debug/rom_ren_d0 }));  // sources/rtl/mcu/debug.v(159)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000110000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_cpu/u_debug/rom_wen_reg  (
    .b({open_n6847,recv_cmd[0]}),
    .c({open_n6848,recv_cmd[1]}),
    .clk(vga_clk_pad),
    .d({open_n6850,_al_u673_o}),
    .sr(\u_cpu/u_debug/clear_rom_data_cmd ),
    .f({open_n6863,\u_cpu/u_debug/n5 }),
    .q({open_n6867,rom_wen}));  // sources/rtl/mcu/debug.v(118)
  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~C*B*A)"),
    //.LUTF1("(D*C*B*A)"),
    //.LUTG0("(D*~C*B*A)"),
    //.LUTG1("(D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000100000000000),
    .INIT_LUTF1(16'b1000000000000000),
    .INIT_LUTG0(16'b0000100000000000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_decode/ex_alua_cmd_reg|u_cpu/u_decode/wt_timer_cmd_reg  (
    .a({_al_u612_o,_al_u612_o}),
    .b({_al_u613_o,_al_u613_o}),
    .c({\u_cpu/inst [0],\u_cpu/inst [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/inst [1],\u_cpu/inst [1]}),
    .q(\u_cpu/decode_cmd [15:14]));  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b1100000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_decode/ex_alub_cmd_reg|u_cpu/u_decode/ex_aluf_cmd_reg  (
    .b({_al_u624_o,_al_u617_o}),
    .c({_al_u638_o,_al_u624_o}),
    .clk(vga_clk_pad),
    .d({_al_u617_o,_al_u608_o}),
    .q({\u_cpu/decode_cmd [16],\u_cpu/decode_cmd [20]}));  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~C*B*A)"),
    //.LUTF1("(~D*C*B*A)"),
    //.LUTG0("(D*~C*B*A)"),
    //.LUTG1("(~D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000100000000000),
    .INIT_LUTF1(16'b0000000010000000),
    .INIT_LUTG0(16'b0000100000000000),
    .INIT_LUTG1(16'b0000000010000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_decode/ex_aluc_cmd_reg|u_cpu/u_decode/ex_alud_cmd_reg  (
    .a({_al_u624_o,_al_u624_o}),
    .b({_al_u638_o,_al_u638_o}),
    .c({\u_cpu/inst [0],\u_cpu/inst [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/inst [1],\u_cpu/inst [1]}),
    .q({\u_cpu/decode_cmd [17],\u_cpu/decode_cmd [18]}));  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*B*A)"),
    //.LUT1("(C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1000000000000000),
    .INIT_LUT1(16'b1100000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_decode/ex_aluj_cmd_reg|u_cpu/u_decode/rd_bus_cmd_reg  (
    .a({open_n6935,_al_u625_o}),
    .b({_al_u617_o,_al_u619_o}),
    .c({_al_u619_o,\u_cpu/inst [0]}),
    .clk(vga_clk_pad),
    .d({_al_u625_o,\u_cpu/inst [1]}),
    .q({\u_cpu/decode_cmd [24],\u_cpu/decode_cmd [27]}));  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~C*B*A)"),
    //.LUTF1("(~D*C*B*A)"),
    //.LUTG0("(D*~C*B*A)"),
    //.LUTG1("(~D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000100000000000),
    .INIT_LUTF1(16'b0000000010000000),
    .INIT_LUTG0(16'b0000100000000000),
    .INIT_LUTG1(16'b0000000010000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_decode/ex_aluk_cmd_reg|u_cpu/u_decode/wt_bus_cmd_reg  (
    .a({_al_u625_o,_al_u625_o}),
    .b({_al_u619_o,_al_u619_o}),
    .c({\u_cpu/inst [0],\u_cpu/inst [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/inst [1],\u_cpu/inst [1]}),
    .q({\u_cpu/decode_cmd [25],\u_cpu/decode_cmd [26]}));  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_decode/rd_ram_cmd_reg|u_cpu/u_decode/wt_d_rt_cmd_reg  (
    .b({_al_u613_o,_al_u617_o}),
    .c({_al_u617_o,_al_u619_o}),
    .clk(vga_clk_pad),
    .d({_al_u625_o,_al_u612_o}),
    .q({\u_cpu/decode_cmd [28],\u_cpu/decode_cmd [8]}));  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(111)
  // sources/rtl/mcu/decode.v(111)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~B*~(C@A))"),
    //.LUTF1("(C*~B*D)"),
    //.LUTG0("(~D*~B*~(C@A))"),
    //.LUTG1("(C*~B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000100001),
    .INIT_LUTF1(16'b0011000000000000),
    .INIT_LUTG0(16'b0000000000100001),
    .INIT_LUTG1(16'b0011000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_decode/reg0_b2|u_cpu/u_decode/reg0_b0  (
    .a({open_n7003,_al_u617_o}),
    .b({\u_cpu/u_decode/inst_data ,\u_cpu/u_decode/inst_data }),
    .c({\u_cpu/inst_en ,\u_cpu/inst [2]}),
    .ce(\u_cpu/u_decode/inst_data ),
    .clk(vga_clk_pad),
    .d({_al_u624_o,\u_cpu/inst [3]}),
    .mi({\u_cpu/inst [2],\u_cpu/inst [0]}),
    .f({_al_u625_o,_al_u940_o}),
    .q({\u_cpu/decode_data [2],\u_cpu/decode_data [0]}));  // sources/rtl/mcu/decode.v(111)
  // sources/rtl/mcu/decode.v(111)
  // sources/rtl/mcu/decode.v(111)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*B*~A)"),
    //.LUTF1("(~D*C*B*~A)"),
    //.LUTG0("(~D*~C*B*~A)"),
    //.LUTG1("(~D*C*B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000100),
    .INIT_LUTF1(16'b0000000001000000),
    .INIT_LUTG0(16'b0000000000000100),
    .INIT_LUTG1(16'b0000000001000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_decode/reg0_b4|u_cpu/u_decode/reg0_b1  (
    .a({\u_cpu/u_decode/inst_data ,\u_cpu/u_decode/inst_data }),
    .b({\u_cpu/inst_en ,\u_cpu/inst_en }),
    .c({\u_cpu/inst [2],\u_cpu/inst [2]}),
    .ce(\u_cpu/u_decode/inst_data ),
    .clk(vga_clk_pad),
    .d({\u_cpu/inst [3],\u_cpu/inst [3]}),
    .mi({\u_cpu/inst [4],\u_cpu/inst [1]}),
    .f({_al_u608_o,_al_u638_o}),
    .q({\u_cpu/decode_data [4],\u_cpu/decode_data [1]}));  // sources/rtl/mcu/decode.v(111)
  // sources/rtl/mcu/decode.v(111)
  // sources/rtl/mcu/decode.v(111)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~B*D)"),
    //.LUT1("(C*~B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000000000000),
    .INIT_LUT1(16'b0011000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_decode/reg0_b5|u_cpu/u_decode/reg0_b3  (
    .b({\u_cpu/u_decode/inst_d [0],\u_cpu/u_decode/inst_data }),
    .c({\u_cpu/inst_en ,\u_cpu/inst_en }),
    .ce(\u_cpu/u_decode/inst_data ),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_decode/inst_data ,_al_u607_o}),
    .mi({\u_cpu/inst [5],\u_cpu/inst [3]}),
    .f({_al_u595_o,_al_u612_o}),
    .q({\u_cpu/decode_data [5],\u_cpu/decode_data [3]}));  // sources/rtl/mcu/decode.v(111)
  // sources/rtl/mcu/decode.v(111)
  // sources/rtl/mcu/decode.v(111)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(~D*~C*B*~A)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(~D*~C*B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b0000000000000100),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b0000000000000100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_decode/reg0_b7|u_cpu/u_decode/reg0_b6  (
    .a({\u_cpu/inst [4],open_n7056}),
    .b({\u_cpu/inst [5],\u_cpu/u_decode/inst_d [0]}),
    .c({\u_cpu/inst [6],\u_cpu/inst_en }),
    .ce(\u_cpu/u_decode/inst_data ),
    .clk(vga_clk_pad),
    .d({\u_cpu/inst [7],\u_cpu/u_decode/inst_data }),
    .mi(\u_cpu/inst [7:6]),
    .f({_al_u643_o,_al_u591_o}),
    .q(\u_cpu/decode_data [7:6]));  // sources/rtl/mcu/decode.v(111)
  // sources/rtl/mcu/decode.v(89)
  // sources/rtl/mcu/decode.v(89)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~D)"),
    //.LUTF1("(~A*~(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    //.LUTG0("(~C*~D)"),
    //.LUTG1("(~A*~(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000001111),
    .INIT_LUTF1(16'b0000000101010001),
    .INIT_LUTG0(16'b0000000000001111),
    .INIT_LUTG1(16'b0000000101010001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_decode/reg1_b1|u_cpu/u_decode/reg1_b0  (
    .a({\u_cpu/dbg_inst_en ,open_n7075}),
    .b({\u_cpu/inst [1],open_n7076}),
    .c({\u_cpu/u_fetch/rom_bk_en ,\u_cpu/inst [1]}),
    .ce(\u_cpu/inst_en ),
    .clk(vga_clk_pad),
    .d({rom_rdata[1],\u_cpu/inst [0]}),
    .mi(\u_cpu/inst [1:0]),
    .f({_al_u371_o,_al_u617_o}),
    .q(\u_cpu/u_decode/inst_d [1:0]));  // sources/rtl/mcu/decode.v(89)
  // sources/rtl/mcu/decode.v(89)
  // sources/rtl/mcu/decode.v(89)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_decode/reg1_b2|u_cpu/u_decode/reg1_b3  (
    .c({\u_cpu/inst [3],\u_cpu/inst [3]}),
    .ce(\u_cpu/inst_en ),
    .clk(vga_clk_pad),
    .d({\u_cpu/inst [2],\u_cpu/inst [2]}),
    .mi({\u_cpu/inst [2],\u_cpu/inst [3]}),
    .f({_al_u619_o,_al_u613_o}),
    .q({\u_cpu/u_decode/inst_d [2],\u_cpu/u_decode/inst_d [3]}));  // sources/rtl/mcu/decode.v(89)
  // sources/rtl/mcu/decode.v(89)
  // sources/rtl/mcu/decode.v(89)
  EG_PHY_LSLICE #(
    //.LUTF0("(~A*~(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    //.LUTF1("(~D*~C*~B*A)"),
    //.LUTG0("(~A*~(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    //.LUTG1("(~D*~C*~B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000101010001),
    .INIT_LUTF1(16'b0000000000000010),
    .INIT_LUTG0(16'b0000000101010001),
    .INIT_LUTG1(16'b0000000000000010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_decode/reg1_b4|u_cpu/u_decode/reg1_b7  (
    .a({\u_cpu/inst [4],\u_cpu/dbg_inst_en }),
    .b({\u_cpu/inst [5],\u_cpu/inst [7]}),
    .c({\u_cpu/inst [6],\u_cpu/u_fetch/rom_bk_en }),
    .ce(\u_cpu/inst_en ),
    .clk(vga_clk_pad),
    .d({\u_cpu/inst [7],rom_rdata[7]}),
    .mi({\u_cpu/inst [4],\u_cpu/inst [7]}),
    .f({_al_u624_o,_al_u383_o}),
    .q({\u_cpu/u_decode/inst_d [4],\u_cpu/u_decode/inst_d [7]}));  // sources/rtl/mcu/decode.v(89)
  // sources/rtl/mcu/decode.v(89)
  // sources/rtl/mcu/decode.v(89)
  EG_PHY_LSLICE #(
    //.LUTF0("(~A*~(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    //.LUTF1("(~D*~C*~B*~A)"),
    //.LUTG0("(~A*~(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    //.LUTG1("(~D*~C*~B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000101010001),
    .INIT_LUTF1(16'b0000000000000001),
    .INIT_LUTG0(16'b0000000101010001),
    .INIT_LUTG1(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_decode/reg1_b5|u_cpu/u_decode/reg1_b6  (
    .a({\u_cpu/inst [4],\u_cpu/dbg_inst_en }),
    .b({\u_cpu/inst [5],\u_cpu/inst [6]}),
    .c({\u_cpu/inst [6],\u_cpu/u_fetch/rom_bk_en }),
    .ce(\u_cpu/inst_en ),
    .clk(vga_clk_pad),
    .d({\u_cpu/inst [7],rom_rdata[6]}),
    .mi({\u_cpu/inst [5],\u_cpu/inst [6]}),
    .f({_al_u607_o,_al_u385_o}),
    .q({\u_cpu/u_decode/inst_d [5],\u_cpu/u_decode/inst_d [6]}));  // sources/rtl/mcu/decode.v(89)
  // sources/rtl/mcu/execute.v(194)
  // sources/rtl/mcu/decode.v(156)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(~D*~C*B*A)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(~D*~C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000000001000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000000001000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_decode/wt_a_cmd_reg|u_cpu/u_execute/rom_to_a_wen_reg  (
    .a({_al_u590_o,open_n7153}),
    .b({_al_u591_o,open_n7154}),
    .c({\u_cpu/u_decode/inst_d [2],\u_cpu/u_execute/rom_to_a_wen }),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_decode/inst_d [3],\u_cpu/u_execute/rom_data [1]}),
    .mi({open_n7159,\u_cpu/decode_cmd [1]}),
    .f({open_n7172,_al_u918_o}),
    .q({\u_cpu/decode_cmd [1],\u_cpu/u_execute/rom_to_a_wen }));  // sources/rtl/mcu/execute.v(194)
  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*B*A)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~D*C*B*A)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000010000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000000010000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_decode/wt_b_cmd_reg|u_cpu/u_decode/wt_d_cmd_reg  (
    .a({open_n7176,_al_u590_o}),
    .b({open_n7177,_al_u595_o}),
    .c({_al_u595_o,\u_cpu/u_decode/inst_d [2]}),
    .clk(vga_clk_pad),
    .d({_al_u593_o,\u_cpu/u_decode/inst_d [3]}),
    .q({\u_cpu/decode_cmd [2],\u_cpu/decode_cmd [4]}));  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/key/key.v(43)
  // sources/rtl/mcu/decode.v(156)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_decode/wt_c_cmd_reg|u_key/reg3_b7  (
    .b({open_n7203,\u_key/cnt [8]}),
    .c({_al_u591_o,\u_key/cnt [9]}),
    .clk(vga_clk_pad),
    .d({_al_u593_o,\u_key/cnt [7]}),
    .mi({open_n7208,\u_key/n3 [7]}),
    .f({open_n7221,_al_u550_o}),
    .q({\u_cpu/decode_cmd [3],\u_key/cnt [7]}));  // sources/rtl/key/key.v(43)
  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*B*A)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(~D*C*B*A)"),
    //.LUTG1("(C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000010000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b0000000010000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_decode/wt_d_bt_cmd_reg|u_cpu/u_decode/wt_pc_cmd_reg  (
    .a({open_n7225,_al_u612_o}),
    .b({_al_u613_o,_al_u613_o}),
    .c({_al_u617_o,\u_cpu/inst [0]}),
    .clk(vga_clk_pad),
    .d({_al_u612_o,\u_cpu/inst [1]}),
    .q({\u_cpu/decode_cmd [12],\u_cpu/decode_cmd [13]}));  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~C*B*A)"),
    //.LUTF1("(~D*C*B*A)"),
    //.LUTG0("(D*~C*B*A)"),
    //.LUTG1("(~D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000100000000000),
    .INIT_LUTF1(16'b0000000010000000),
    .INIT_LUTG0(16'b0000100000000000),
    .INIT_LUTG1(16'b0000000010000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_decode/wt_ram_a_cmd_reg|u_cpu/u_decode/wt_ram_b_cmd_reg  (
    .a({_al_u625_o,_al_u625_o}),
    .b({_al_u613_o,_al_u613_o}),
    .c({\u_cpu/inst [0],\u_cpu/inst [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/inst [1],\u_cpu/inst [1]}),
    .q({\u_cpu/decode_cmd [29],\u_cpu/decode_cmd [30]}));  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b1100000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_decode/wt_ram_alu0_cmd_reg|u_cpu/u_decode/wt_ram_alu4_cmd_reg  (
    .b({_al_u638_o,_al_u617_o}),
    .c({_al_u643_o,_al_u643_o}),
    .clk(vga_clk_pad),
    .d({_al_u617_o,_al_u608_o}),
    .q({\u_cpu/decode_cmd [32],\u_cpu/decode_cmd [36]}));  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~C*B*A)"),
    //.LUTF1("(~D*C*B*A)"),
    //.LUTG0("(D*~C*B*A)"),
    //.LUTG1("(~D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000100000000000),
    .INIT_LUTF1(16'b0000000010000000),
    .INIT_LUTG0(16'b0000100000000000),
    .INIT_LUTG1(16'b0000000010000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_decode/wt_ram_alu1_cmd_reg|u_cpu/u_decode/wt_ram_alu2_cmd_reg  (
    .a({_al_u638_o,_al_u638_o}),
    .b({_al_u643_o,_al_u643_o}),
    .c({\u_cpu/inst [0],\u_cpu/inst [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/inst [1],\u_cpu/inst [1]}),
    .q({\u_cpu/decode_cmd [33],\u_cpu/decode_cmd [34]}));  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/fetch.v(97)
  // sources/rtl/mcu/execute.v(319)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/bus_ren_reg|u_cpu/u_fetch/rom_bk_en_reg  (
    .clk(vga_clk_pad),
    .mi({\u_cpu/decode_cmd [27],rom_ren}),
    .q({bus_ren,\u_cpu/u_fetch/rom_bk_en }));  // sources/rtl/mcu/fetch.v(97)
  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/execute.v(212)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*B*A)"),
    //.LUTF1("(~C*~(B*D))"),
    //.LUTG0("(~D*C*B*A)"),
    //.LUTG1("(~C*~(B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000010000000),
    .INIT_LUTF1(16'b0000001100001111),
    .INIT_LUTG0(16'b0000000010000000),
    .INIT_LUTG1(16'b0000001100001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/bus_to_a_wen_reg|u_cpu/u_decode/wt_a_bt_cmd_reg  (
    .a({open_n7341,_al_u612_o}),
    .b({\u_cpu/u_execute/bus_to_a_wen ,_al_u619_o}),
    .c({\u_cpu/u_execute/rom_to_a_wen ,\u_cpu/inst [0]}),
    .clk(vga_clk_pad),
    .d({bus_rdata[0],\u_cpu/inst [1]}),
    .mi({\u_cpu/decode_cmd [9],open_n7346}),
    .f({_al_u934_o,open_n7359}),
    .q({\u_cpu/u_execute/bus_to_a_wen ,\u_cpu/decode_cmd [9]}));  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/execute.v(212)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~C*B*A)"),
    //.LUT1("(~C*~(B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000100000000000),
    .INIT_LUT1(16'b0000001100001111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/bus_to_b_wen_reg|u_cpu/u_decode/wt_b_bt_cmd_reg  (
    .a({open_n7363,_al_u612_o}),
    .b({\u_cpu/u_execute/bus_to_b_wen ,_al_u619_o}),
    .c({\u_cpu/u_execute/rom_to_b_wen ,\u_cpu/inst [0]}),
    .clk(vga_clk_pad),
    .d({bus_rdata[0],\u_cpu/inst [1]}),
    .mi({\u_cpu/decode_cmd [10],open_n7375}),
    .f({_al_u929_o,open_n7377}),
    .q({\u_cpu/u_execute/bus_to_b_wen ,\u_cpu/decode_cmd [10]}));  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/execute.v(212)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTF1("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    //.LUTG0("(D*C*B*A)"),
    //.LUTG1("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b0000111101110111),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b0000111101110111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/bus_to_c_wen_reg|u_cpu/u_decode/wt_c_bt_cmd_reg  (
    .a({bus_rdata[0],_al_u612_o}),
    .b({\u_cpu/u_execute/bus_to_c_wen ,_al_u619_o}),
    .c({\u_cpu/u_execute/rom_data [0],\u_cpu/inst [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/rom_to_c_wen ,\u_cpu/inst [1]}),
    .mi({\u_cpu/decode_cmd [11],open_n7385}),
    .f({_al_u925_o,open_n7398}),
    .q({\u_cpu/u_execute/bus_to_c_wen ,\u_cpu/decode_cmd [11]}));  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/uart/ubus.v(183)
  // sources/rtl/mcu/execute.v(310)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/bus_wen_reg|u_uart/u_ubus/tx_en_reg  (
    .clk(vga_clk_pad),
    .mi({\u_cpu/decode_cmd [26],\u_uart/u_ubus/send_flag }),
    .q({bus_wen,\u_uart/tx_en }));  // sources/rtl/uart/ubus.v(183)
  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/execute.v(336)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(D*C*B*A)"),
    //.LUTG1("(~C*~B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/dbg_info_en0_reg|u_cpu/u_decode/dbg_info_cmd_reg  (
    .a({open_n7431,_al_u608_o}),
    .b({\u_cpu/u_execute/dbg_info_en0 ,_al_u643_o}),
    .c({bus_wdata[4],\u_cpu/inst [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/read_abcd [0],\u_cpu/inst [1]}),
    .mi({\u_cpu/decode_cmd [39],open_n7436}),
    .f({_al_u530_o,open_n7449}),
    .q({\u_cpu/u_execute/dbg_info_en0 ,\u_cpu/decode_cmd [39]}));  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/key/key.v(57)
  // sources/rtl/mcu/execute.v(287)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/pc_wen0_reg|u_key/reg1_b1  (
    .clk(vga_clk_pad),
    .mi({\u_cpu/decode_cmd [13],\u_key/key_d0 [1]}),
    .q({\u_cpu/u_execute/pc_wen0 ,\u_key/key_d1 [1]}));  // sources/rtl/key/key.v(57)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/mcu/execute.v(327)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/ram_ren_reg|u_vram/reg3_b5  (
    .clk(vga_clk_pad),
    .mi({\u_cpu/decode_cmd [28],axis_x[5]}),
    .q({ram_ren,\u_vram/axis_x_d0 [5]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/execute.v(203)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*B*A)"),
    //.LUTF1("(~D*~(~C*~B))"),
    //.LUTG0("(~D*C*B*A)"),
    //.LUTG1("(~D*~(~C*~B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000010000000),
    .INIT_LUTF1(16'b0000000011111100),
    .INIT_LUTG0(16'b0000000010000000),
    .INIT_LUTG1(16'b0000000011111100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/ram_to_a_wen_reg|u_cpu/u_decode/wt_a_rt_cmd_reg  (
    .a({open_n7503,_al_u607_o}),
    .b({\u_cpu/u_execute/ram_to_a_wen ,_al_u608_o}),
    .c({bus_wdata[0],\u_cpu/inst [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/bus_to_a_wen ,\u_cpu/inst [1]}),
    .mi({\u_cpu/decode_cmd [5],open_n7508}),
    .f({_al_u933_o,open_n7521}),
    .q({\u_cpu/u_execute/ram_to_a_wen ,\u_cpu/decode_cmd [5]}));  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/execute.v(203)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~C*B*A)"),
    //.LUT1("(~D*~(~C*~B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000100000000000),
    .INIT_LUT1(16'b0000000011111100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/ram_to_b_wen_reg|u_cpu/u_decode/wt_b_rt_cmd_reg  (
    .a({open_n7525,_al_u607_o}),
    .b({\u_cpu/u_execute/ram_to_b_wen ,_al_u608_o}),
    .c({\u_cpu/alu_in2 [0],\u_cpu/inst [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/bus_to_b_wen ,\u_cpu/inst [1]}),
    .mi({\u_cpu/decode_cmd [6],open_n7537}),
    .f({_al_u928_o,open_n7539}),
    .q({\u_cpu/u_execute/ram_to_b_wen ,\u_cpu/decode_cmd [6]}));  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/execute.v(203)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTF1("(~D*~A*~(~C*~B))"),
    //.LUTG0("(D*C*B*A)"),
    //.LUTG1("(~D*~A*~(~C*~B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b0000000001010100),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b0000000001010100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/ram_to_c_wen_reg|u_cpu/u_decode/wt_c_rt_cmd_reg  (
    .a({\u_cpu/u_execute/bus_to_c_wen ,_al_u607_o}),
    .b({\u_cpu/u_execute/ram_to_c_wen ,_al_u608_o}),
    .c({\u_cpu/u_execute/C [0],\u_cpu/inst [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/rom_to_c_wen ,\u_cpu/inst [1]}),
    .mi({\u_cpu/decode_cmd [7],open_n7547}),
    .f({_al_u924_o,open_n7560}),
    .q({\u_cpu/u_execute/ram_to_c_wen ,\u_cpu/decode_cmd [7]}));  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/execute.v(359)
  // sources/rtl/mcu/execute.v(359)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*~A)"),
    //.LUTF1("~(~D*~C*B*A)"),
    //.LUTG0("(~D*~C*~B*~A)"),
    //.LUTG1("~(~D*~C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000001),
    .INIT_LUTF1(16'b1111111111110111),
    .INIT_LUTG0(16'b0000000000000001),
    .INIT_LUTG1(16'b1111111111110111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/ram_wen_reg|u_cpu/u_execute/reg8_b5  (
    .a({_al_u454_o,\u_cpu/u_execute/wt_ram_cmd [4]}),
    .b({_al_u455_o,\u_cpu/u_execute/wt_ram_cmd [5]}),
    .c({\u_cpu/u_execute/wt_ram_cmd [6],\u_cpu/u_execute/wt_ram_cmd [8]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/wt_ram_cmd [7],\u_cpu/u_execute/wt_ram_cmd [9]}),
    .mi({open_n7568,\u_cpu/decode_cmd [34]}),
    .f({\u_cpu/u_execute/n40 ,_al_u454_o}),
    .q({ram_wen,\u_cpu/u_execute/wt_ram_cmd [5]}));  // sources/rtl/mcu/execute.v(359)
  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(228)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(~C*~B))"),
    //.LUT1("(~D*~(C*~(B*~A)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011111100),
    .INIT_LUT1(16'b0000000001001111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg0_b1|u_cpu/u_execute/reg5_b17  (
    .a({_al_u915_o,open_n7584}),
    .b({_al_u916_o,\u_cpu/u_execute/ram_to_a_wen }),
    .c({_al_u917_o,bus_wdata[1]}),
    .clk(vga_clk_pad),
    .d({_al_u918_o,\u_cpu/u_execute/bus_to_a_wen }),
    .mi({open_n7596,bus_wdata[1]}),
    .f({\u_cpu/u_execute/n4 [1],_al_u916_o}),
    .q({bus_wdata[1],\u_cpu/timer_wdata [17]}));  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(228)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(~C*~B))"),
    //.LUTF1("(~D*~(C*~(B*~A)))"),
    //.LUTG0("(~D*~(~C*~B))"),
    //.LUTG1("(~D*~(C*~(B*~A)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011111100),
    .INIT_LUTF1(16'b0000000001001111),
    .INIT_LUTG0(16'b0000000011111100),
    .INIT_LUTG1(16'b0000000001001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg0_b2|u_cpu/u_execute/reg5_b18  (
    .a({_al_u898_o,open_n7601}),
    .b({_al_u899_o,\u_cpu/u_execute/ram_to_a_wen }),
    .c({_al_u900_o,bus_wdata[2]}),
    .clk(vga_clk_pad),
    .d({_al_u901_o,\u_cpu/u_execute/bus_to_a_wen }),
    .mi({open_n7606,bus_wdata[2]}),
    .f({\u_cpu/u_execute/n4 [2],_al_u899_o}),
    .q({bus_wdata[2],\u_cpu/timer_wdata [18]}));  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(359)
  // sources/rtl/mcu/execute.v(391)
  EG_PHY_LSLICE #(
    //.LUTF0("~((D*B)*~(A)*~(C)+(D*B)*A*~(C)+~((D*B))*A*C+(D*B)*A*C)"),
    //.LUTF1("~(B*~(C*~D))"),
    //.LUTG0("~((D*B)*~(A)*~(C)+(D*B)*A*~(C)+~((D*B))*A*C+(D*B)*A*C)"),
    //.LUTG1("~(B*~(C*~D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0101001101011111),
    .INIT_LUTF1(16'b0011001111110011),
    .INIT_LUTG0(16'b0101001101011111),
    .INIT_LUTG1(16'b0011001111110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg10_b0|u_cpu/u_execute/reg8_b1  (
    .a({open_n7622,bus_wdata[0]}),
    .b({_al_u1022_o,\u_cpu/alu_in2 [0]}),
    .c({_al_u1023_o,\u_cpu/u_execute/wt_ram_cmd [0]}),
    .clk(vga_clk_pad),
    .d({_al_u1021_o,\u_cpu/u_execute/wt_ram_cmd [1]}),
    .mi({open_n7627,\u_cpu/decode_cmd [30]}),
    .f({open_n7640,_al_u1022_o}),
    .q({ram_wdata[0],\u_cpu/u_execute/wt_ram_cmd [1]}));  // sources/rtl/mcu/execute.v(359)
  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(391)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("((~B*~A)*~(C)*~(D)+(~B*~A)*C*~(D)+~((~B*~A))*C*D+(~B*~A)*C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b1111000000010001),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg10_b4|u_cpu/u_execute/reg5_b12  (
    .a({_al_u981_o,open_n7644}),
    .b({_al_u982_o,open_n7645}),
    .c({bus_wdata[4],\u_cpu/u_execute/wt_ram_cmd [1]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/wt_ram_cmd [0],\u_cpu/alu_in2 [4]}),
    .mi({open_n7657,\u_cpu/alu_in2 [4]}),
    .f({open_n7659,_al_u982_o}),
    .q({ram_wdata[4],\u_cpu/timer_wdata [12]}));  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(391)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("((~B*~A)*~(C)*~(D)+(~B*~A)*C*~(D)+~((~B*~A))*C*D+(~B*~A)*C*D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("((~B*~A)*~(C)*~(D)+(~B*~A)*C*~(D)+~((~B*~A))*C*D+(~B*~A)*C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b1111000000010001),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b1111000000010001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg10_b5|u_cpu/u_execute/reg5_b13  (
    .a({_al_u971_o,open_n7663}),
    .b({_al_u972_o,open_n7664}),
    .c({bus_wdata[5],\u_cpu/u_execute/wt_ram_cmd [1]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/wt_ram_cmd [0],\u_cpu/alu_in2 [5]}),
    .mi({open_n7669,\u_cpu/alu_in2 [5]}),
    .f({open_n7682,_al_u972_o}),
    .q({ram_wdata[5],\u_cpu/timer_wdata [13]}));  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(391)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("((~B*~A)*~(C)*~(D)+(~B*~A)*C*~(D)+~((~B*~A))*C*D+(~B*~A)*C*D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("((~B*~A)*~(C)*~(D)+(~B*~A)*C*~(D)+~((~B*~A))*C*D+(~B*~A)*C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b1111000000010001),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b1111000000010001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg10_b6|u_cpu/u_execute/reg5_b14  (
    .a({_al_u961_o,open_n7686}),
    .b({_al_u962_o,open_n7687}),
    .c({bus_wdata[6],\u_cpu/u_execute/wt_ram_cmd [1]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/wt_ram_cmd [0],\u_cpu/alu_in2 [6]}),
    .mi({open_n7692,\u_cpu/alu_in2 [6]}),
    .f({open_n7705,_al_u962_o}),
    .q({ram_wdata[6],\u_cpu/timer_wdata [14]}));  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(391)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("((~B*~A)*~(C)*~(D)+(~B*~A)*C*~(D)+~((~B*~A))*C*D+(~B*~A)*C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b1111000000010001),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg10_b7|u_cpu/u_execute/reg5_b15  (
    .a({_al_u951_o,open_n7709}),
    .b({_al_u952_o,open_n7710}),
    .c({bus_wdata[7],\u_cpu/u_execute/wt_ram_cmd [1]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/wt_ram_cmd [0],\u_cpu/alu_in2 [7]}),
    .mi({open_n7722,\u_cpu/alu_in2 [7]}),
    .f({open_n7724,_al_u952_o}),
    .q({ram_wdata[7],\u_cpu/timer_wdata [15]}));  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(212)
  // sources/rtl/mcu/execute.v(185)
  EG_PHY_LSLICE #(
    //.LUTF0("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000111101110111),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000111101110111),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg11_b0|u_cpu/u_execute/bus_to_d_wen_reg  (
    .a({open_n7728,bus_rdata[0]}),
    .b({open_n7729,\u_cpu/u_execute/bus_to_d_wen }),
    .c({\u_cpu/u_execute/rom_to_a_wen ,\u_cpu/u_execute/rom_data [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/rom_data [0],\u_cpu/u_execute/rom_to_d_wen }),
    .mi({\u_cpu/decode_data [0],\u_cpu/decode_cmd [12]}),
    .f({_al_u935_o,_al_u938_o}),
    .q({\u_cpu/u_execute/rom_data [0],\u_cpu/u_execute/bus_to_d_wen }));  // sources/rtl/mcu/execute.v(212)
  // sources/rtl/mcu/execute.v(194)
  // sources/rtl/mcu/execute.v(185)
  EG_PHY_LSLICE #(
    //.LUTF0("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    //.LUTF1("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    //.LUTG0("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    //.LUTG1("~((B*A)*~(C)*~(D)+(B*A)*C*~(D)+~((B*A))*C*D+(B*A)*C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000111101110111),
    .INIT_LUTF1(16'b0000111101110111),
    .INIT_LUTG0(16'b0000111101110111),
    .INIT_LUTG1(16'b0000111101110111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg11_b1|u_cpu/u_execute/rom_to_c_wen_reg  (
    .a({bus_rdata[1],bus_rdata[1]}),
    .b({\u_cpu/u_execute/bus_to_d_wen ,\u_cpu/u_execute/bus_to_c_wen }),
    .c({\u_cpu/u_execute/rom_data [1],\u_cpu/u_execute/rom_data [1]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/rom_to_d_wen ,\u_cpu/u_execute/rom_to_c_wen }),
    .mi({\u_cpu/decode_data [1],\u_cpu/decode_cmd [3]}),
    .f({_al_u921_o,_al_u910_o}),
    .q({\u_cpu/u_execute/rom_data [1],\u_cpu/u_execute/rom_to_c_wen }));  // sources/rtl/mcu/execute.v(194)
  // sources/rtl/mcu/execute.v(185)
  // sources/rtl/mcu/execute.v(185)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg11_b6|u_cpu/u_execute/reg11_b7  (
    .clk(vga_clk_pad),
    .mi({\u_cpu/decode_data [6],\u_cpu/decode_data [7]}),
    .q({\u_cpu/u_execute/rom_data [6],\u_cpu/u_execute/rom_data [7]}));  // sources/rtl/mcu/execute.v(185)
  // sources/rtl/mcu/execute.v(194)
  // sources/rtl/mcu/execute.v(244)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(~D*~(C*~(B*~A)))"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(~D*~(C*~(B*~A)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000001001111),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000001001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg1_b0|u_cpu/u_execute/rom_to_b_wen_reg  (
    .a({_al_u927_o,open_n7797}),
    .b({_al_u928_o,open_n7798}),
    .c({_al_u929_o,\u_cpu/u_execute/rom_to_b_wen }),
    .clk(vga_clk_pad),
    .d({_al_u930_o,\u_cpu/u_execute/rom_data [0]}),
    .mi({open_n7803,\u_cpu/decode_cmd [2]}),
    .f({\u_cpu/u_execute/n7 [0],_al_u930_o}),
    .q({\u_cpu/alu_in2 [0],\u_cpu/u_execute/rom_to_b_wen }));  // sources/rtl/mcu/execute.v(194)
  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(244)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~A*~(~C*~B))"),
    //.LUTF1("~(C*~(B*~(D*A)))"),
    //.LUTG0("(~D*~A*~(~C*~B))"),
    //.LUTG1("~(C*~(B*~(D*A)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000001010100),
    .INIT_LUTF1(16'b0100111111001111),
    .INIT_LUTG0(16'b0000000001010100),
    .INIT_LUTG1(16'b0100111111001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg1_b3|u_cpu/u_execute/reg5_b11  (
    .a({_al_u875_o,\u_cpu/u_execute/bus_to_b_wen }),
    .b({_al_u879_o,\u_cpu/u_execute/ram_to_b_wen }),
    .c({_al_u880_o,\u_cpu/alu_in2 [3]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/ram_to_b_wen ,\u_cpu/u_execute/rom_to_b_wen }),
    .mi({open_n7823,\u_cpu/alu_in2 [3]}),
    .f({\u_cpu/u_execute/n7 [3],_al_u879_o}),
    .q({\u_cpu/alu_in2 [3],\u_cpu/timer_wdata [11]}));  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(228)
  // sources/rtl/mcu/execute.v(244)
  EG_PHY_MSLICE #(
    //.LUT0("~(C*~(B*~(D*A)))"),
    //.LUT1("~(C*~(B*~(D*A)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0100111111001111),
    .INIT_LUT1(16'b0100111111001111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg1_b5|u_cpu/u_execute/reg0_b5  (
    .a({_al_u843_o,_al_u843_o}),
    .b({_al_u847_o,_al_u850_o}),
    .c({_al_u848_o,_al_u851_o}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/ram_to_b_wen ,\u_cpu/u_execute/ram_to_a_wen }),
    .f({\u_cpu/u_execute/n7 [5],\u_cpu/u_execute/n4 [5]}),
    .q({\u_cpu/alu_in2 [5],bus_wdata[5]}));  // sources/rtl/mcu/execute.v(228)
  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(260)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(~C*B))"),
    //.LUT1("~(C*~(B*~(D*A)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111001100000000),
    .INIT_LUT1(16'b0100111111001111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg2_b1|u_cpu/u_execute/reg5_b1  (
    .a({_al_u908_o,open_n7856}),
    .b({_al_u909_o,\u_cpu/read_abcd [2]}),
    .c({_al_u910_o,\u_cpu/u_execute/C [1]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/ram_to_c_wen ,_al_u392_o}),
    .mi({open_n7868,\u_cpu/u_execute/C [1]}),
    .f({open_n7870,_al_u515_o}),
    .q({\u_cpu/u_execute/C [1],\u_cpu/timer_wdata [1]}));  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(260)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~A*~(~C*~B))"),
    //.LUT1("~(C*~(B*~(D*A)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000001010100),
    .INIT_LUT1(16'b0100111111001111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg2_b3|u_cpu/u_execute/reg5_b3  (
    .a({_al_u875_o,\u_cpu/u_execute/bus_to_c_wen }),
    .b({_al_u876_o,\u_cpu/u_execute/ram_to_c_wen }),
    .c({_al_u877_o,\u_cpu/u_execute/C [3]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/ram_to_c_wen ,\u_cpu/u_execute/rom_to_c_wen }),
    .mi({open_n7885,\u_cpu/u_execute/C [3]}),
    .f({open_n7887,_al_u876_o}),
    .q({\u_cpu/u_execute/C [3],\u_cpu/timer_wdata [3]}));  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(260)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~A*~(~C*~B))"),
    //.LUT1("~(C*~(B*~(D*A)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000001010100),
    .INIT_LUT1(16'b0100111111001111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg2_b5|u_cpu/u_execute/reg5_b5  (
    .a({_al_u843_o,\u_cpu/u_execute/bus_to_c_wen }),
    .b({_al_u844_o,\u_cpu/u_execute/ram_to_c_wen }),
    .c({_al_u845_o,\u_cpu/u_execute/C [5]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/ram_to_c_wen ,\u_cpu/u_execute/rom_to_c_wen }),
    .mi({open_n7902,\u_cpu/u_execute/C [5]}),
    .f({open_n7904,_al_u844_o}),
    .q({\u_cpu/u_execute/C [5],\u_cpu/timer_wdata [5]}));  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(260)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~A*~(~C*~B))"),
    //.LUTF1("~(~(D*C)*~(B*~A))"),
    //.LUTG0("(~D*~A*~(~C*~B))"),
    //.LUTG1("~(~(D*C)*~(B*~A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000001010100),
    .INIT_LUTF1(16'b1111010001000100),
    .INIT_LUTG0(16'b0000000001010100),
    .INIT_LUTG1(16'b1111010001000100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg2_b6|u_cpu/u_execute/reg5_b6  (
    .a({_al_u831_o,\u_cpu/u_execute/bus_to_c_wen }),
    .b({_al_u832_o,\u_cpu/u_execute/ram_to_c_wen }),
    .c({\u_cpu/u_execute/rom_data [6],\u_cpu/u_execute/C [6]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/rom_to_c_wen ,\u_cpu/u_execute/rom_to_c_wen }),
    .mi({open_n7912,\u_cpu/u_execute/C [6]}),
    .f({open_n7925,_al_u832_o}),
    .q({\u_cpu/u_execute/C [6],\u_cpu/timer_wdata [6]}));  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(260)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~A*~(~C*~B))"),
    //.LUTF1("~(~(D*C)*~(B*~A))"),
    //.LUTG0("(~D*~A*~(~C*~B))"),
    //.LUTG1("~(~(D*C)*~(B*~A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000001010100),
    .INIT_LUTF1(16'b1111010001000100),
    .INIT_LUTG0(16'b0000000001010100),
    .INIT_LUTG1(16'b1111010001000100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg2_b7|u_cpu/u_execute/reg5_b7  (
    .a({_al_u819_o,\u_cpu/u_execute/bus_to_c_wen }),
    .b({_al_u820_o,\u_cpu/u_execute/ram_to_c_wen }),
    .c({\u_cpu/u_execute/rom_data [7],\u_cpu/u_execute/C [7]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/rom_to_c_wen ,\u_cpu/u_execute/rom_to_c_wen }),
    .mi({open_n7933,\u_cpu/u_execute/C [7]}),
    .f({open_n7946,_al_u820_o}),
    .q({\u_cpu/u_execute/C [7],\u_cpu/timer_wdata [7]}));  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(203)
  // sources/rtl/mcu/execute.v(276)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~A*~(~C*~B))"),
    //.LUTF1("~(C*~(B*~(D*A)))"),
    //.LUTG0("(~D*~A*~(~C*~B))"),
    //.LUTG1("~(C*~(B*~(D*A)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000001010100),
    .INIT_LUTF1(16'b0100111111001111),
    .INIT_LUTG0(16'b0000000001010100),
    .INIT_LUTG1(16'b0100111111001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg3_b0|u_cpu/u_execute/ram_to_d_wen_reg  (
    .a({_al_u923_o,\u_cpu/u_execute/bus_to_d_wen }),
    .b({_al_u937_o,\u_cpu/u_execute/ram_to_d_wen }),
    .c({_al_u938_o,bus_raddr[0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/ram_to_d_wen ,\u_cpu/u_execute/rom_to_d_wen }),
    .mi({open_n7954,\u_cpu/decode_cmd [8]}),
    .f({open_n7967,_al_u937_o}),
    .q({bus_raddr[0],\u_cpu/u_execute/ram_to_d_wen }));  // sources/rtl/mcu/execute.v(203)
  // sources/rtl/mcu/execute.v(194)
  // sources/rtl/mcu/execute.v(276)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~(B*D))"),
    //.LUTF1("(~D*~(C*~(B*~A)))"),
    //.LUTG0("(~C*~(B*D))"),
    //.LUTG1("(~D*~(C*~(B*~A)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000001100001111),
    .INIT_LUTF1(16'b0000000001001111),
    .INIT_LUTG0(16'b0000001100001111),
    .INIT_LUTG1(16'b0000000001001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg3_b2|u_cpu/u_execute/rom_to_d_wen_reg  (
    .a({_al_u903_o,open_n7971}),
    .b({_al_u904_o,\u_cpu/u_execute/bus_to_d_wen }),
    .c({_al_u905_o,\u_cpu/u_execute/rom_to_d_wen }),
    .clk(vga_clk_pad),
    .d({_al_u906_o,bus_rdata[2]}),
    .mi({open_n7976,\u_cpu/decode_cmd [4]}),
    .f({open_n7989,_al_u905_o}),
    .q({bus_raddr[2],\u_cpu/u_execute/rom_to_d_wen }));  // sources/rtl/mcu/execute.v(194)
  // sources/rtl/mcu/execute.v(185)
  // sources/rtl/mcu/execute.v(276)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(~D*~(C*~(B*~A)))"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(~D*~(C*~(B*~A)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000001001111),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000001001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg3_b4|u_cpu/u_execute/reg11_b4  (
    .a({_al_u870_o,open_n7993}),
    .b({_al_u871_o,open_n7994}),
    .c({_al_u872_o,\u_cpu/u_execute/rom_to_d_wen }),
    .clk(vga_clk_pad),
    .d({_al_u873_o,\u_cpu/u_execute/rom_data [4]}),
    .mi({open_n7999,\u_cpu/decode_data [4]}),
    .f({open_n8012,_al_u873_o}),
    .q({bus_raddr[4],\u_cpu/u_execute/rom_data [4]}));  // sources/rtl/mcu/execute.v(185)
  // sources/rtl/mcu/execute.v(287)
  // sources/rtl/mcu/execute.v(287)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~A*~(~C*~B))"),
    //.LUTF1("(~D*~(~C*~B))"),
    //.LUTG0("(~D*~A*~(~C*~B))"),
    //.LUTG1("(~D*~(~C*~B))"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000001010100),
    .INIT_LUTF1(16'b0000000011111100),
    .INIT_LUTG0(16'b0000000001010100),
    .INIT_LUTG1(16'b0000000011111100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg4_b10|u_cpu/u_execute/reg4_b9  (
    .a({open_n8016,\u_cpu/u_execute/bus_to_b_wen }),
    .b({\u_cpu/u_execute/ram_to_b_wen ,\u_cpu/u_execute/ram_to_b_wen }),
    .c(\u_cpu/alu_in2 [2:1]),
    .ce(\u_bus/eq0/or_or_or_xor_i0[0]_i_o ),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/bus_to_b_wen ,\u_cpu/u_execute/rom_to_b_wen }),
    .mi(\u_cpu/alu_in2 [2:1]),
    .f({_al_u894_o,_al_u912_o}),
    .q(\u_cpu/pc_wdata [10:9]));  // sources/rtl/mcu/execute.v(287)
  // sources/rtl/mcu/execute.v(359)
  // sources/rtl/mcu/execute.v(295)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*~B*~A)"),
    //.LUT1("(~C*~B*~(D*~A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000000001),
    .INIT_LUT1(16'b0000001000000011),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg5_b0|u_cpu/u_execute/reg8_b0  (
    .a({\u_cpu/u_execute/C [0],\u_cpu/u_execute/wt_ram_cmd [0]}),
    .b({\u_cpu/u_execute/wt_ram_cmd [0],\u_cpu/u_execute/wt_ram_cmd [1]}),
    .c({\u_cpu/u_execute/wt_ram_cmd [1],\u_cpu/u_execute/wt_ram_cmd [2]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/wt_ram_cmd [2],\u_cpu/u_execute/wt_ram_cmd [3]}),
    .mi({\u_cpu/u_execute/C [0],\u_cpu/decode_cmd [29]}),
    .f({_al_u1023_o,_al_u455_o}),
    .q({\u_cpu/timer_wdata [0],\u_cpu/u_execute/wt_ram_cmd [0]}));  // sources/rtl/mcu/execute.v(359)
  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(295)
  EG_PHY_LSLICE #(
    //.LUTF0("(~(D@B)*~(C@A))"),
    //.LUTF1("(B*A*~(D@C))"),
    //.LUTG0("(~(D@B)*~(C@A))"),
    //.LUTG1("(B*A*~(D@C))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1000010000100001),
    .INIT_LUTF1(16'b1000000000001000),
    .INIT_LUTG0(16'b1000010000100001),
    .INIT_LUTG1(16'b1000000000001000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg5_b16|u_cpu/u_execute/reg5_b23  (
    .a({_al_u743_o,bus_wdata[1]}),
    .b({_al_u744_o,bus_wdata[7]}),
    .c({bus_wdata[0],\u_cpu/alu_in2 [1]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_in2 [0],\u_cpu/alu_in2 [7]}),
    .mi({bus_wdata[0],bus_wdata[7]}),
    .f({_al_u745_o,_al_u744_o}),
    .q({\u_cpu/timer_wdata [16],\u_cpu/timer_wdata [23]}));  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/timer.v(42)
  // sources/rtl/mcu/execute.v(295)
  EG_PHY_MSLICE #(
    //.LUT0("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    //.LUT1("(D*~(~C*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111010000000100),
    .INIT_LUT1(16'b1111001100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg5_b2|u_cpu/u_timer/reg0_b2  (
    .a({open_n8069,\u_cpu/u_timer/n4 }),
    .b({\u_cpu/read_abcd [2],\u_cpu/u_timer/n1 [2]}),
    .c({\u_cpu/u_execute/C [2],\u_cpu/timer_wen }),
    .clk(vga_clk_pad),
    .d({_al_u392_o,\u_cpu/timer_wdata [2]}),
    .mi({\u_cpu/u_execute/C [2],open_n8081}),
    .f({_al_u519_o,open_n8083}),
    .q({\u_cpu/timer_wdata [2],\u_cpu/u_timer/cnt [2]}));  // sources/rtl/mcu/timer.v(42)
  // sources/rtl/mcu/timer.v(42)
  // sources/rtl/mcu/execute.v(295)
  EG_PHY_MSLICE #(
    //.LUT0("((D*~A)*~(B)*~(C)+(D*~A)*B*~(C)+~((D*~A))*B*C+(D*~A)*B*C)"),
    //.LUT1("(~D*~(~C*~B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100010111000000),
    .INIT_LUT1(16'b0000000011111100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg5_b4|u_cpu/u_timer/reg0_b4  (
    .a({open_n8087,\u_cpu/u_timer/n4 }),
    .b({\u_cpu/u_execute/ram_to_c_wen ,\u_cpu/timer_wdata [4]}),
    .c({\u_cpu/u_execute/C [4],\u_cpu/timer_wen }),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/bus_to_c_wen ,\u_cpu/u_timer/n1 [4]}),
    .mi({\u_cpu/u_execute/C [4],open_n8099}),
    .f({_al_u857_o,open_n8101}),
    .q({\u_cpu/timer_wdata [4],\u_cpu/u_timer/cnt [4]}));  // sources/rtl/mcu/timer.v(42)
  // sources/rtl/mcu/execute.v(301)
  // sources/rtl/mcu/execute.v(301)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg6_b3|u_cpu/u_execute/reg6_b2  (
    .clk(vga_clk_pad),
    .mi(\u_cpu/decode_cmd [18:17]),
    .q(\u_cpu/alu_cmd [3:2]));  // sources/rtl/mcu/execute.v(301)
  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/execute.v(301)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(D*C*B*A)"),
    //.LUTG1("(~C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg6_b4|u_cpu/u_decode/ex_alue_cmd_reg  (
    .a({open_n8130,_al_u624_o}),
    .b({open_n8131,_al_u638_o}),
    .c({\u_cpu/alu_cmd [4],\u_cpu/inst [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_out2 [0],\u_cpu/inst [1]}),
    .mi({\u_cpu/decode_cmd [19],open_n8136}),
    .f({_al_u746_o,open_n8149}),
    .q({\u_cpu/alu_cmd [4],\u_cpu/decode_cmd [19]}));  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/execute.v(301)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*B*A)"),
    //.LUTF1("(~C*~B*~(~D*~A))"),
    //.LUTG0("(~D*C*B*A)"),
    //.LUTG1("(~C*~B*~(~D*~A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000010000000),
    .INIT_LUTF1(16'b0000001100000010),
    .INIT_LUTG0(16'b0000000010000000),
    .INIT_LUTG1(16'b0000001100000010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg6_b6|u_cpu/u_decode/ex_alug_cmd_reg  (
    .a({\u_cpu/alu_out3 [7],_al_u608_o}),
    .b({\u_cpu/alu_cmd [6],_al_u624_o}),
    .c({\u_cpu/alu_cmd [7],\u_cpu/inst [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_cmd [8],\u_cpu/inst [1]}),
    .mi({\u_cpu/decode_cmd [21],open_n8157}),
    .f({_al_u451_o,open_n8170}),
    .q({\u_cpu/alu_cmd [6],\u_cpu/decode_cmd [21]}));  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/execute.v(301)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~C*B*A)"),
    //.LUTF1("(~C*~(D*B*A))"),
    //.LUTG0("(D*~C*B*A)"),
    //.LUTG1("(~C*~(D*B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000100000000000),
    .INIT_LUTF1(16'b0000011100001111),
    .INIT_LUTG0(16'b0000100000000000),
    .INIT_LUTG1(16'b0000011100001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg6_b7|u_cpu/u_decode/ex_aluh_cmd_reg  (
    .a({_al_u689_o,_al_u608_o}),
    .b({_al_u692_o,_al_u624_o}),
    .c({_al_u695_o,\u_cpu/inst [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_cmd [7],\u_cpu/inst [1]}),
    .mi({\u_cpu/decode_cmd [22],open_n8178}),
    .f({\u_cpu/u_alu/n56 [0],open_n8191}),
    .q({\u_cpu/alu_cmd [7],\u_cpu/decode_cmd [22]}));  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/execute.v(301)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTF1("(~C*(~B*~(A)*~(D)+~B*A*~(D)+~(~B)*A*D+~B*A*D))"),
    //.LUTG0("(D*C*B*A)"),
    //.LUTG1("(~C*(~B*~(A)*~(D)+~B*A*~(D)+~(~B)*A*D+~B*A*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b0000101000000011),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b0000101000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg6_b8|u_cpu/u_decode/ex_alui_cmd_reg  (
    .a({_al_u694_o,_al_u608_o}),
    .b({\u_cpu/alu_out3 [0],_al_u624_o}),
    .c({\u_cpu/alu_cmd [7],\u_cpu/inst [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/alu_cmd [8],\u_cpu/inst [1]}),
    .mi({\u_cpu/decode_cmd [23],open_n8199}),
    .f({_al_u695_o,open_n8212}),
    .q({\u_cpu/alu_cmd [8],\u_cpu/decode_cmd [23]}));  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/execute.v(351)
  // sources/rtl/mcu/execute.v(351)
  EG_PHY_LSLICE #(
    //.LUTF0("((~B*A)*~(D)*~(C)+(~B*A)*D*~(C)+~((~B*A))*D*C+(~B*A)*D*C)"),
    //.LUTF1("(~(~B*A)*~(D)*~(C)+~(~B*A)*D*~(C)+~(~(~B*A))*D*C+~(~B*A)*D*C)"),
    //.LUTG0("((~B*A)*~(D)*~(C)+(~B*A)*D*~(C)+~((~B*A))*D*C+(~B*A)*D*C)"),
    //.LUTG1("(~(~B*A)*~(D)*~(C)+~(~B*A)*D*~(C)+~(~(~B*A))*D*C+~(~B*A)*D*C)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111001000000010),
    .INIT_LUTF1(16'b1111110100001101),
    .INIT_LUTG0(16'b1111001000000010),
    .INIT_LUTG1(16'b1111110100001101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg7_b10|u_cpu/u_execute/reg7_b11  (
    .a({_al_u392_o,_al_u392_o}),
    .b({\u_cpu/u_execute/n36 [10],_al_u505_o}),
    .c({\u_cpu/u_execute/dbg_info_en0 ,\u_cpu/u_execute/dbg_info_en0 }),
    .clk(vga_clk_pad),
    .d({bus_wdata[2],bus_wdata[3]}),
    .q({\u_cpu/dbg_info [10],\u_cpu/dbg_info [11]}));  // sources/rtl/mcu/execute.v(351)
  // sources/rtl/mcu/execute.v(336)
  // sources/rtl/mcu/execute.v(351)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~D*~C*~B*A)"),
    //.LUTF1("~(~(C*B)*~(D*~A))"),
    //.LUTG0("~(~D*~C*~B*A)"),
    //.LUTG1("~(~(C*B)*~(D*~A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111111111111101),
    .INIT_LUTF1(16'b1101010111000000),
    .INIT_LUTG0(16'b1111111111111101),
    .INIT_LUTG1(16'b1101010111000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg7_b12|u_cpu/u_execute/dbg_info_en_reg  (
    .a({\u_cpu/u_execute/n34 ,_al_u392_o}),
    .b({\u_cpu/u_execute/dbg_info_en0 ,\u_cpu/read_abcd [2]}),
    .c({bus_wdata[4],\u_cpu/read_abcd [3]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/dbg_info [12],\u_cpu/u_execute/dbg_info_en0 }),
    .f({open_n8257,\u_cpu/u_execute/n34 }),
    .q({\u_cpu/dbg_info [12],\u_cpu/dbg_info_en }));  // sources/rtl/mcu/execute.v(336)
  // sources/rtl/mcu/debug.v(180)
  // sources/rtl/mcu/execute.v(351)
  EG_PHY_MSLICE #(
    //.LUT0("((~B*A)*~(D)*~(C)+(~B*A)*D*~(C)+~((~B*A))*D*C+(~B*A)*D*C)"),
    //.LUT1("~(~(C*B)*~(D*~A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111001000000010),
    .INIT_LUT1(16'b1101010111000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg7_b13|u_cpu/u_debug/reg5_b5  (
    .a({\u_cpu/u_execute/n34 ,send_cmd[5]}),
    .b({\u_cpu/u_execute/dbg_info_en0 ,\u_cpu/u_debug/rom_bk_en }),
    .c({bus_wdata[5],\u_cpu/dbg_info_en }),
    .clk(vga_clk_pad),
    .d({\u_cpu/dbg_info [13],\u_cpu/dbg_info [13]}),
    .q({\u_cpu/dbg_info [13],send_cmd[5]}));  // sources/rtl/mcu/debug.v(180)
  // sources/rtl/mcu/debug.v(180)
  // sources/rtl/mcu/execute.v(351)
  EG_PHY_LSLICE #(
    //.LUTF0("((~B*A)*~(D)*~(C)+(~B*A)*D*~(C)+~((~B*A))*D*C+(~B*A)*D*C)"),
    //.LUTF1("~(~(C*B)*~(D*~A))"),
    //.LUTG0("((~B*A)*~(D)*~(C)+(~B*A)*D*~(C)+~((~B*A))*D*C+(~B*A)*D*C)"),
    //.LUTG1("~(~(C*B)*~(D*~A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111001000000010),
    .INIT_LUTF1(16'b1101010111000000),
    .INIT_LUTG0(16'b1111001000000010),
    .INIT_LUTG1(16'b1101010111000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg7_b14|u_cpu/u_debug/reg5_b6  (
    .a({\u_cpu/u_execute/n34 ,send_cmd[6]}),
    .b({\u_cpu/u_execute/dbg_info_en0 ,\u_cpu/u_debug/rom_bk_en }),
    .c({bus_wdata[6],\u_cpu/dbg_info_en }),
    .clk(vga_clk_pad),
    .d({\u_cpu/dbg_info [14],\u_cpu/dbg_info [14]}),
    .q({\u_cpu/dbg_info [14],send_cmd[6]}));  // sources/rtl/mcu/debug.v(180)
  // sources/rtl/mcu/debug.v(180)
  // sources/rtl/mcu/execute.v(351)
  EG_PHY_LSLICE #(
    //.LUTF0("((~B*A)*~(D)*~(C)+(~B*A)*D*~(C)+~((~B*A))*D*C+(~B*A)*D*C)"),
    //.LUTF1("~(~(C*B)*~(D*~A))"),
    //.LUTG0("((~B*A)*~(D)*~(C)+(~B*A)*D*~(C)+~((~B*A))*D*C+(~B*A)*D*C)"),
    //.LUTG1("~(~(C*B)*~(D*~A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111001000000010),
    .INIT_LUTF1(16'b1101010111000000),
    .INIT_LUTG0(16'b1111001000000010),
    .INIT_LUTG1(16'b1101010111000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg7_b15|u_cpu/u_debug/reg5_b7  (
    .a({\u_cpu/u_execute/n34 ,send_cmd[7]}),
    .b({\u_cpu/u_execute/dbg_info_en0 ,\u_cpu/u_debug/rom_bk_en }),
    .c({bus_wdata[7],\u_cpu/dbg_info_en }),
    .clk(vga_clk_pad),
    .d({\u_cpu/dbg_info [15],\u_cpu/dbg_info [15]}),
    .q({\u_cpu/dbg_info [15],send_cmd[7]}));  // sources/rtl/mcu/debug.v(180)
  // sources/rtl/mcu/debug.v(180)
  // sources/rtl/mcu/execute.v(351)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(~C*B))"),
    //.LUT1("~(~C*~(D)*~(B)+~C*D*~(B)+~(~C)*D*B+~C*D*B)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110011),
    .INIT_LUT1(16'b0011000011111100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg7_b3|u_cpu/u_debug/reg6_b3  (
    .b({_al_u513_o,\u_cpu/dbg_info_en }),
    .c({\u_cpu/alu_in2 [3],\u_cpu/dbg_info [3]}),
    .clk(vga_clk_pad),
    .d({_al_u525_o,_al_u361_o}),
    .q({\u_cpu/dbg_info [3],send_data[3]}));  // sources/rtl/mcu/debug.v(180)
  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/execute.v(359)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTF1("(~C*~B*~(D*~A))"),
    //.LUTG0("(D*C*B*A)"),
    //.LUTG1("(~C*~B*~(D*~A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b0000001000000011),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b0000001000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg8_b2|u_cpu/u_decode/wt_ram_c_cmd_reg  (
    .a({\u_cpu/alu_out0 [2],_al_u625_o}),
    .b({\u_cpu/u_execute/wt_ram_cmd [2],_al_u613_o}),
    .c({\u_cpu/u_execute/wt_ram_cmd [3],\u_cpu/inst [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/wt_ram_cmd [4],\u_cpu/inst [1]}),
    .mi({\u_cpu/decode_cmd [31],open_n8351}),
    .f({_al_u999_o,open_n8364}),
    .q({\u_cpu/u_execute/wt_ram_cmd [2],\u_cpu/decode_cmd [31]}));  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/execute.v(359)
  // sources/rtl/mcu/execute.v(359)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*~(D*~A))"),
    //.LUT1("(C*~(B*~(~D*~A)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000001000000011),
    .INIT_LUT1(16'b0011000001110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg8_b4|u_cpu/u_execute/reg8_b3  (
    .a({\u_cpu/u_execute/n47 [3],\u_cpu/alu_out0 [3]}),
    .b({_al_u989_o,\u_cpu/u_execute/wt_ram_cmd [2]}),
    .c({_al_u990_o,\u_cpu/u_execute/wt_ram_cmd [3]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/wt_ram_cmd [4],\u_cpu/u_execute/wt_ram_cmd [4]}),
    .mi(\u_cpu/decode_cmd [33:32]),
    .f({_al_u991_o,_al_u989_o}),
    .q(\u_cpu/u_execute/wt_ram_cmd [4:3]));  // sources/rtl/mcu/execute.v(359)
  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/execute.v(359)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTF1("(~C*~B*~(D*~A))"),
    //.LUTG0("(D*C*B*A)"),
    //.LUTG1("(~C*~B*~(D*~A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b0000001000000011),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b0000001000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg8_b6|u_cpu/u_decode/wt_ram_alu3_cmd_reg  (
    .a({\u_cpu/alu_out3 [2],_al_u638_o}),
    .b({\u_cpu/u_execute/wt_ram_cmd [6],_al_u643_o}),
    .c({\u_cpu/u_execute/wt_ram_cmd [7],\u_cpu/inst [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/wt_ram_cmd [8],\u_cpu/inst [1]}),
    .mi({\u_cpu/decode_cmd [35],open_n8387}),
    .f({_al_u995_o,open_n8400}),
    .q({\u_cpu/u_execute/wt_ram_cmd [6],\u_cpu/decode_cmd [35]}));  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/execute.v(359)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*B*A)"),
    //.LUTF1("(~C*~(B*~(A)*~(D)+B*A*~(D)+~(B)*A*D+B*A*D))"),
    //.LUTG0("(~D*C*B*A)"),
    //.LUTG1("(~C*~(B*~(A)*~(D)+B*A*~(D)+~(B)*A*D+B*A*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000010000000),
    .INIT_LUTF1(16'b0000010100000011),
    .INIT_LUTG0(16'b0000000010000000),
    .INIT_LUTG1(16'b0000010100000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg8_b8|u_cpu/u_decode/wt_ram_alu5_cmd_reg  (
    .a({\u_cpu/alu_out4 [2],_al_u608_o}),
    .b({ram_wdata[2],_al_u643_o}),
    .c({\u_cpu/u_execute/wt_ram_cmd [8],\u_cpu/inst [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/wt_ram_cmd [9],\u_cpu/inst [1]}),
    .mi({\u_cpu/decode_cmd [37],open_n8408}),
    .f({_al_u994_o,open_n8421}),
    .q({\u_cpu/u_execute/wt_ram_cmd [8],\u_cpu/decode_cmd [37]}));  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/execute.v(359)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~C*B*A)"),
    //.LUTF1("(~C*~(B*~(A)*~(D)+B*A*~(D)+~(B)*A*D+B*A*D))"),
    //.LUTG0("(D*~C*B*A)"),
    //.LUTG1("(~C*~(B*~(A)*~(D)+B*A*~(D)+~(B)*A*D+B*A*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000100000000000),
    .INIT_LUTF1(16'b0000010100000011),
    .INIT_LUTG0(16'b0000100000000000),
    .INIT_LUTG1(16'b0000010100000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg8_b9|u_cpu/u_decode/wt_ram_alu6_cmd_reg  (
    .a({\u_cpu/alu_out4 [3],_al_u608_o}),
    .b({ram_wdata[3],_al_u643_o}),
    .c({\u_cpu/u_execute/wt_ram_cmd [8],\u_cpu/inst [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_execute/wt_ram_cmd [9],\u_cpu/inst [1]}),
    .mi({\u_cpu/decode_cmd [38],open_n8429}),
    .f({_al_u984_o,open_n8442}),
    .q({\u_cpu/u_execute/wt_ram_cmd [9],\u_cpu/decode_cmd [38]}));  // sources/rtl/mcu/decode.v(156)
  // sources/rtl/mcu/execute.v(366)
  // sources/rtl/mcu/execute.v(366)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(~C*~B))"),
    //.LUTF1("(~(D@B)*~(C@A))"),
    //.LUTG0("(~D*~(~C*~B))"),
    //.LUTG1("(~(D@B)*~(C@A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011111100),
    .INIT_LUTF1(16'b1000010000100001),
    .INIT_LUTG0(16'b0000000011111100),
    .INIT_LUTG1(16'b1000010000100001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/reg9_b0|u_cpu/u_execute/reg9_b4  (
    .a({bus_raddr[0],open_n8446}),
    .b({bus_raddr[4],\u_cpu/u_execute/ram_to_d_wen }),
    .c({ram_waddr[0],bus_raddr[4]}),
    .ce(\u_cpu/u_execute/n40 ),
    .clk(vga_clk_pad),
    .d({ram_waddr[4],\u_cpu/u_execute/bus_to_d_wen }),
    .mi({bus_raddr[0],bus_raddr[4]}),
    .f({_al_u817_o,_al_u871_o}),
    .q({ram_waddr[0],ram_waddr[4]}));  // sources/rtl/mcu/execute.v(366)
  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(295)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_execute/timer_wen0_reg|u_cpu/u_execute/timer_wen_reg  (
    .clk(vga_clk_pad),
    .mi({\u_cpu/decode_cmd [14],\u_cpu/u_execute/timer_wen0 }),
    .q({\u_cpu/u_execute/timer_wen0 ,\u_cpu/timer_wen }));  // sources/rtl/mcu/execute.v(295)
  EG_PHY_LSLICE #(
    //.MACRO("u_cpu/u_fetch/add0/ucin_al_u1093"),
    //.R_POSITION("X0Y1Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_cpu/u_fetch/add0/u11_al_u1096  (
    .a({open_n8494,\u_cpu/u_fetch/pc [11]}),
    .c(2'b00),
    .d({open_n8499,1'b0}),
    .fci(\u_cpu/u_fetch/add0/c11 ),
    .f({open_n8516,\u_cpu/u_fetch/n1 [11]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cpu/u_fetch/add0/ucin_al_u1093"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_cpu/u_fetch/add0/u3_al_u1094  (
    .a({\u_cpu/u_fetch/pc [5],\u_cpu/u_fetch/pc [3]}),
    .b({\u_cpu/u_fetch/pc [6],\u_cpu/u_fetch/pc [4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_cpu/u_fetch/add0/c3 ),
    .f({\u_cpu/u_fetch/n1 [5],\u_cpu/u_fetch/n1 [3]}),
    .fco(\u_cpu/u_fetch/add0/c7 ),
    .fx({\u_cpu/u_fetch/n1 [6],\u_cpu/u_fetch/n1 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cpu/u_fetch/add0/ucin_al_u1093"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_cpu/u_fetch/add0/u7_al_u1095  (
    .a({\u_cpu/u_fetch/pc [9],\u_cpu/u_fetch/pc [7]}),
    .b({\u_cpu/u_fetch/pc [10],\u_cpu/u_fetch/pc [8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_cpu/u_fetch/add0/c7 ),
    .f({\u_cpu/u_fetch/n1 [9],\u_cpu/u_fetch/n1 [7]}),
    .fco(\u_cpu/u_fetch/add0/c11 ),
    .fx({\u_cpu/u_fetch/n1 [10],\u_cpu/u_fetch/n1 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cpu/u_fetch/add0/ucin_al_u1093"),
    //.R_POSITION("X0Y0Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_cpu/u_fetch/add0/ucin_al_u1093  (
    .a({\u_cpu/u_fetch/pc [1],1'b0}),
    .b({\u_cpu/u_fetch/pc [2],\u_cpu/u_fetch/pc [0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({\u_cpu/u_fetch/n1 [1],open_n8575}),
    .fco(\u_cpu/u_fetch/add0/c3 ),
    .fx({\u_cpu/u_fetch/n1 [2],\u_cpu/u_fetch/n1 [0]}));
  // sources/rtl/mcu/fetch.v(106)
  // sources/rtl/mcu/fetch.v(97)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(~C*B))"),
    //.LUT1("~(~C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110011),
    .INIT_LUT1(16'b1111111111110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_fetch/inst_en_reg|u_cpu/u_fetch/reg2_b1  (
    .b({open_n8580,\u_cpu/dbg_inst_en }),
    .c({\u_cpu/u_fetch/rom_bk_en ,\u_cpu/dbg_inst [1]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/dbg_inst_en ,_al_u371_o}),
    .q({\u_cpu/inst_en ,\u_cpu/inst [1]}));  // sources/rtl/mcu/fetch.v(106)
  // sources/rtl/mcu/fetch.v(75)
  // sources/rtl/mcu/fetch.v(75)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(~C*B))"),
    //.LUTF1("(~D*~(~C*B))"),
    //.LUTG0("(~D*~(~C*B))"),
    //.LUTG1("(~D*~(~C*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110011),
    .INIT_LUTF1(16'b0000000011110011),
    .INIT_LUTG0(16'b0000000011110011),
    .INIT_LUTG1(16'b0000000011110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_cpu/u_fetch/reg0_b0|u_cpu/u_fetch/reg0_b9  (
    .b({\u_cpu/pc_wen ,\u_cpu/pc_wen }),
    .c({\u_cpu/pc_wdata [0],\u_cpu/pc_wdata [9]}),
    .clk(vga_clk_pad),
    .d({_al_u307_o,_al_u329_o}),
    .sr(\u_cpu/dbg_en ),
    .q({\u_cpu/u_fetch/pc [0],\u_cpu/u_fetch/pc [9]}));  // sources/rtl/mcu/fetch.v(75)
  // sources/rtl/mcu/fetch.v(90)
  // sources/rtl/mcu/fetch.v(90)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~D*~(C*~B))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~D*~(C*~B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0000000011001111),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0000000011001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_fetch/reg1_b0|u_cpu/u_fetch/reg1_b1  (
    .b({\u_cpu/dbg_rom_raddr [0],\u_cpu/dbg_rom_raddr [1]}),
    .c({\u_cpu/dbg_rom_ren ,\u_cpu/dbg_rom_ren }),
    .clk(vga_clk_pad),
    .d({_al_u331_o,_al_u333_o}),
    .q({rom_raddr[0],rom_raddr[1]}));  // sources/rtl/mcu/fetch.v(90)
  // sources/rtl/mcu/fetch.v(106)
  // sources/rtl/mcu/fetch.v(106)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(~C*B))"),
    //.LUTF1("(~D*~(~C*B))"),
    //.LUTG0("(~D*~(~C*B))"),
    //.LUTG1("(~D*~(~C*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110011),
    .INIT_LUTF1(16'b0000000011110011),
    .INIT_LUTG0(16'b0000000011110011),
    .INIT_LUTG1(16'b0000000011110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_fetch/reg2_b2|u_cpu/u_fetch/reg2_b0  (
    .b({\u_cpu/dbg_inst_en ,\u_cpu/dbg_inst_en }),
    .c({\u_cpu/dbg_inst [2],\u_cpu/dbg_inst [0]}),
    .clk(vga_clk_pad),
    .d({_al_u377_o,_al_u373_o}),
    .q({\u_cpu/inst [2],\u_cpu/inst [0]}));  // sources/rtl/mcu/fetch.v(106)
  // sources/rtl/mcu/fetch.v(106)
  // sources/rtl/mcu/fetch.v(106)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(~C*B))"),
    //.LUT1("(~D*~(~C*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110011),
    .INIT_LUT1(16'b0000000011110011),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_fetch/reg2_b4|u_cpu/u_fetch/reg2_b3  (
    .b({\u_cpu/dbg_inst_en ,\u_cpu/dbg_inst_en }),
    .c(\u_cpu/dbg_inst [4:3]),
    .clk(vga_clk_pad),
    .d({_al_u381_o,_al_u375_o}),
    .q(\u_cpu/inst [4:3]));  // sources/rtl/mcu/fetch.v(106)
  // sources/rtl/mcu/fetch.v(106)
  // sources/rtl/mcu/fetch.v(106)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(~C*B))"),
    //.LUT1("(~D*~(~C*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110011),
    .INIT_LUT1(16'b0000000011110011),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_fetch/reg2_b5|u_cpu/u_fetch/reg2_b7  (
    .b({\u_cpu/dbg_inst_en ,\u_cpu/dbg_inst_en }),
    .c({\u_cpu/dbg_inst [5],\u_cpu/dbg_inst [7]}),
    .clk(vga_clk_pad),
    .d({_al_u379_o,_al_u383_o}),
    .q({\u_cpu/inst [5],\u_cpu/inst [7]}));  // sources/rtl/mcu/fetch.v(106)
  // sources/rtl/mcu/fetch.v(113)
  // sources/rtl/mcu/fetch.v(113)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    //.LUT1("(~C*~(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000100001101),
    .INIT_LUT1(16'b0000000100001101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_fetch/reg3_b1|u_cpu/u_fetch/reg3_b6  (
    .a({send_data[1],send_data[6]}),
    .b({\u_cpu/u_debug/rom_bk_en ,\u_cpu/u_debug/rom_bk_en }),
    .c({\u_cpu/dbg_info_en ,\u_cpu/dbg_info_en }),
    .ce(\u_cpu/dbg_en ),
    .clk(vga_clk_pad),
    .d({\u_cpu/dbg_rom_rdata [1],\u_cpu/dbg_rom_rdata [6]}),
    .mi({rom_rdata[1],rom_rdata[6]}),
    .f({_al_u357_o,_al_u367_o}),
    .q({\u_cpu/dbg_rom_rdata [1],\u_cpu/dbg_rom_rdata [6]}));  // sources/rtl/mcu/fetch.v(113)
  // sources/rtl/mcu/fetch.v(113)
  // sources/rtl/mcu/fetch.v(113)
  EG_PHY_LSLICE #(
    //.LUTF0("(~A*~(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    //.LUTF1("(~A*~(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    //.LUTG0("(~A*~(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    //.LUTG1("(~A*~(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000101010001),
    .INIT_LUTF1(16'b0000000101010001),
    .INIT_LUTG0(16'b0000000101010001),
    .INIT_LUTG1(16'b0000000101010001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_fetch/reg3_b2|u_cpu/u_fetch/reg3_b0  (
    .a({\u_cpu/dbg_inst_en ,\u_cpu/dbg_inst_en }),
    .b({\u_cpu/inst [2],\u_cpu/inst [0]}),
    .c({\u_cpu/u_fetch/rom_bk_en ,\u_cpu/u_fetch/rom_bk_en }),
    .ce(\u_cpu/dbg_en ),
    .clk(vga_clk_pad),
    .d({rom_rdata[2],rom_rdata[0]}),
    .mi({rom_rdata[2],rom_rdata[0]}),
    .f({_al_u377_o,_al_u373_o}),
    .q({\u_cpu/dbg_rom_rdata [2],\u_cpu/dbg_rom_rdata [0]}));  // sources/rtl/mcu/fetch.v(113)
  // sources/rtl/mcu/fetch.v(113)
  // sources/rtl/mcu/fetch.v(113)
  EG_PHY_LSLICE #(
    //.LUTF0("(~A*~(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    //.LUTF1("(~A*~(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    //.LUTG0("(~A*~(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    //.LUTG1("(~A*~(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000101010001),
    .INIT_LUTF1(16'b0000000101010001),
    .INIT_LUTG0(16'b0000000101010001),
    .INIT_LUTG1(16'b0000000101010001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_fetch/reg3_b4|u_cpu/u_fetch/reg3_b3  (
    .a({\u_cpu/dbg_inst_en ,\u_cpu/dbg_inst_en }),
    .b(\u_cpu/inst [4:3]),
    .c({\u_cpu/u_fetch/rom_bk_en ,\u_cpu/u_fetch/rom_bk_en }),
    .ce(\u_cpu/dbg_en ),
    .clk(vga_clk_pad),
    .d(rom_rdata[4:3]),
    .mi(rom_rdata[4:3]),
    .f({_al_u381_o,_al_u375_o}),
    .q(\u_cpu/dbg_rom_rdata [4:3]));  // sources/rtl/mcu/fetch.v(113)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_fetch/reg3_b7  (
    .ce(\u_cpu/dbg_en ),
    .clk(vga_clk_pad),
    .mi({open_n8784,rom_rdata[7]}),
    .q({open_n8791,\u_cpu/dbg_rom_rdata [7]}));  // sources/rtl/mcu/fetch.v(113)
  // sources/rtl/mcu/timer.v(42)
  // sources/rtl/mcu/timer.v(42)
  EG_PHY_MSLICE #(
    //.LUT0("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    //.LUT1("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111010000000100),
    .INIT_LUT1(16'b1111010000000100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_timer/reg0_b0|u_cpu/u_timer/reg0_b7  (
    .a({\u_cpu/u_timer/n4 ,\u_cpu/u_timer/n4 }),
    .b({\u_cpu/u_timer/n1 [0],\u_cpu/u_timer/n1 [7]}),
    .c({\u_cpu/timer_wen ,\u_cpu/timer_wen }),
    .clk(vga_clk_pad),
    .d({\u_cpu/timer_wdata [0],\u_cpu/timer_wdata [7]}),
    .q({\u_cpu/u_timer/cnt [0],\u_cpu/u_timer/cnt [7]}));  // sources/rtl/mcu/timer.v(42)
  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/timer.v(42)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    //.LUTG0("(~D*~(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000001010011),
    .INIT_LUTF1(16'b1111010000000100),
    .INIT_LUTG0(16'b0000000001010011),
    .INIT_LUTG1(16'b1111010000000100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_timer/reg0_b10|u_cpu/u_execute/reg5_b10  (
    .a({\u_cpu/u_timer/n4 ,\u_cpu/u_alu/n30_lutinv }),
    .b({\u_cpu/u_timer/n1 [10],\u_cpu/u_alu/n32_lutinv }),
    .c({\u_cpu/timer_wen ,\u_cpu/alu_in2 [1]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/timer_wdata [10],\u_cpu/alu_in2 [2]}),
    .mi({open_n8815,\u_cpu/alu_in2 [2]}),
    .f({open_n8828,_al_u806_o}),
    .q({\u_cpu/u_timer/cnt [10],\u_cpu/timer_wdata [10]}));  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/timer.v(42)
  // sources/rtl/mcu/timer.v(42)
  EG_PHY_LSLICE #(
    //.LUTF0("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    //.LUTF1("((D*~A)*~(B)*~(C)+(D*~A)*B*~(C)+~((D*~A))*B*C+(D*~A)*B*C)"),
    //.LUTG0("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    //.LUTG1("((D*~A)*~(B)*~(C)+(D*~A)*B*~(C)+~((D*~A))*B*C+(D*~A)*B*C)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111010000000100),
    .INIT_LUTF1(16'b1100010111000000),
    .INIT_LUTG0(16'b1111010000000100),
    .INIT_LUTG1(16'b1100010111000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_timer/reg0_b11|u_cpu/u_timer/reg0_b6  (
    .a({\u_cpu/u_timer/n4 ,\u_cpu/u_timer/n4 }),
    .b({\u_cpu/timer_wdata [11],\u_cpu/u_timer/n1 [6]}),
    .c({\u_cpu/timer_wen ,\u_cpu/timer_wen }),
    .clk(vga_clk_pad),
    .d({\u_cpu/u_timer/n1 [11],\u_cpu/timer_wdata [6]}),
    .q({\u_cpu/u_timer/cnt [11],\u_cpu/u_timer/cnt [6]}));  // sources/rtl/mcu/timer.v(42)
  // sources/rtl/mcu/timer.v(42)
  // sources/rtl/mcu/timer.v(42)
  EG_PHY_MSLICE #(
    //.LUT0("((D*~A)*~(B)*~(C)+(D*~A)*B*~(C)+~((D*~A))*B*C+(D*~A)*B*C)"),
    //.LUT1("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100010111000000),
    .INIT_LUT1(16'b1111010000000100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_timer/reg0_b12|u_cpu/u_timer/reg0_b3  (
    .a({\u_cpu/u_timer/n4 ,\u_cpu/u_timer/n4 }),
    .b({\u_cpu/u_timer/n1 [12],\u_cpu/timer_wdata [3]}),
    .c({\u_cpu/timer_wen ,\u_cpu/timer_wen }),
    .clk(vga_clk_pad),
    .d({\u_cpu/timer_wdata [12],\u_cpu/u_timer/n1 [3]}),
    .q({\u_cpu/u_timer/cnt [12],\u_cpu/u_timer/cnt [3]}));  // sources/rtl/mcu/timer.v(42)
  // sources/rtl/mcu/timer.v(42)
  // sources/rtl/mcu/timer.v(42)
  EG_PHY_LSLICE #(
    //.LUTF0("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    //.LUTF1("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    //.LUTG0("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    //.LUTG1("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111010000000100),
    .INIT_LUTF1(16'b1111010000000100),
    .INIT_LUTG0(16'b1111010000000100),
    .INIT_LUTG1(16'b1111010000000100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_timer/reg0_b13|u_cpu/u_timer/reg0_b23  (
    .a({\u_cpu/u_timer/n4 ,\u_cpu/u_timer/n4 }),
    .b({\u_cpu/u_timer/n1 [13],\u_cpu/u_timer/n1 [23]}),
    .c({\u_cpu/timer_wen ,\u_cpu/timer_wen }),
    .clk(vga_clk_pad),
    .d({\u_cpu/timer_wdata [13],\u_cpu/timer_wdata [23]}),
    .q({\u_cpu/u_timer/cnt [13],\u_cpu/u_timer/cnt [23]}));  // sources/rtl/mcu/timer.v(42)
  // sources/rtl/mcu/timer.v(42)
  // sources/rtl/mcu/timer.v(42)
  EG_PHY_MSLICE #(
    //.LUT0("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    //.LUT1("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111010000000100),
    .INIT_LUT1(16'b1111010000000100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_timer/reg0_b14|u_cpu/u_timer/reg0_b21  (
    .a({\u_cpu/u_timer/n4 ,\u_cpu/u_timer/n4 }),
    .b({\u_cpu/u_timer/n1 [14],\u_cpu/u_timer/n1 [21]}),
    .c({\u_cpu/timer_wen ,\u_cpu/timer_wen }),
    .clk(vga_clk_pad),
    .d({\u_cpu/timer_wdata [14],\u_cpu/timer_wdata [21]}),
    .q({\u_cpu/u_timer/cnt [14],\u_cpu/u_timer/cnt [21]}));  // sources/rtl/mcu/timer.v(42)
  // sources/rtl/mcu/timer.v(42)
  // sources/rtl/mcu/timer.v(42)
  EG_PHY_LSLICE #(
    //.LUTF0("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    //.LUTF1("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    //.LUTG0("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    //.LUTG1("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111010000000100),
    .INIT_LUTF1(16'b1111010000000100),
    .INIT_LUTG0(16'b1111010000000100),
    .INIT_LUTG1(16'b1111010000000100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_timer/reg0_b15|u_cpu/u_timer/reg0_b17  (
    .a({\u_cpu/u_timer/n4 ,\u_cpu/u_timer/n4 }),
    .b({\u_cpu/u_timer/n1 [15],\u_cpu/u_timer/n1 [17]}),
    .c({\u_cpu/timer_wen ,\u_cpu/timer_wen }),
    .clk(vga_clk_pad),
    .d({\u_cpu/timer_wdata [15],\u_cpu/timer_wdata [17]}),
    .q({\u_cpu/u_timer/cnt [15],\u_cpu/u_timer/cnt [17]}));  // sources/rtl/mcu/timer.v(42)
  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/timer.v(42)
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C)"),
    //.LUTF1("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    //.LUTG0("(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C)"),
    //.LUTG1("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111110000001100),
    .INIT_LUTF1(16'b1111010000000100),
    .INIT_LUTG0(16'b1111110000001100),
    .INIT_LUTG1(16'b1111010000000100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_timer/reg0_b19|u_cpu/u_execute/reg5_b19  (
    .a({\u_cpu/u_timer/n4 ,open_n8939}),
    .b({\u_cpu/u_timer/n1 [19],bus_wdata[4]}),
    .c({\u_cpu/timer_wen ,\u_cpu/alu_in2 [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/timer_wdata [19],bus_wdata[3]}),
    .mi({open_n8944,bus_wdata[3]}),
    .f({open_n8957,\u_cpu/u_alu/n32_lutinv }),
    .q({\u_cpu/u_timer/cnt [19],\u_cpu/timer_wdata [19]}));  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/timer.v(42)
  // sources/rtl/mcu/timer.v(42)
  EG_PHY_MSLICE #(
    //.LUT0("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    //.LUT1("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111010000000100),
    .INIT_LUT1(16'b1111010000000100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_timer/reg0_b1|u_cpu/u_timer/reg0_b16  (
    .a({\u_cpu/u_timer/n4 ,\u_cpu/u_timer/n4 }),
    .b({\u_cpu/u_timer/n1 [1],\u_cpu/u_timer/n1 [16]}),
    .c({\u_cpu/timer_wen ,\u_cpu/timer_wen }),
    .clk(vga_clk_pad),
    .d({\u_cpu/timer_wdata [1],\u_cpu/timer_wdata [16]}),
    .q({\u_cpu/u_timer/cnt [1],\u_cpu/u_timer/cnt [16]}));  // sources/rtl/mcu/timer.v(42)
  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/timer.v(42)
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C)"),
    //.LUTF1("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    //.LUTG0("(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C)"),
    //.LUTG1("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111110000001100),
    .INIT_LUTF1(16'b1111010000000100),
    .INIT_LUTG0(16'b1111110000001100),
    .INIT_LUTG1(16'b1111010000000100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_timer/reg0_b20|u_cpu/u_execute/reg5_b20  (
    .a({\u_cpu/u_timer/n4 ,open_n8980}),
    .b({\u_cpu/u_timer/n1 [20],bus_wdata[5]}),
    .c({\u_cpu/timer_wen ,\u_cpu/alu_in2 [0]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/timer_wdata [20],bus_wdata[4]}),
    .mi({open_n8985,bus_wdata[4]}),
    .f({open_n8998,\u_cpu/u_alu/n33_lutinv }),
    .q({\u_cpu/u_timer/cnt [20],\u_cpu/timer_wdata [20]}));  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/execute.v(295)
  // sources/rtl/mcu/timer.v(42)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*D)"),
    //.LUTF1("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    //.LUTG0("(~C*~B*D)"),
    //.LUTG1("((B*~A)*~(D)*~(C)+(B*~A)*D*~(C)+~((B*~A))*D*C+(B*~A)*D*C)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000001100000000),
    .INIT_LUTF1(16'b1111010000000100),
    .INIT_LUTG0(16'b0000001100000000),
    .INIT_LUTG1(16'b1111010000000100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cpu/u_timer/reg0_b8|u_cpu/u_execute/reg5_b8  (
    .a({\u_cpu/u_timer/n4 ,open_n9002}),
    .b({\u_cpu/u_timer/n1 [8],\u_cpu/alu_in2 [0]}),
    .c({\u_cpu/timer_wen ,\u_cpu/alu_in2 [1]}),
    .clk(vga_clk_pad),
    .d({\u_cpu/timer_wdata [8],bus_wdata[7]}),
    .mi({open_n9007,\u_cpu/alu_in2 [0]}),
    .f({open_n9020,\u_cpu/u_alu/n75_lutinv }),
    .q({\u_cpu/u_timer/cnt [8],\u_cpu/timer_wdata [8]}));  // sources/rtl/mcu/execute.v(295)
  EG_PHY_LSLICE #(
    //.MACRO("u_cpu/u_timer/sub0/ucin_al_u1069"),
    //.R_POSITION("X0Y1Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_cpu/u_timer/sub0/u11_al_u1072  (
    .a({\u_cpu/u_timer/cnt [13],\u_cpu/u_timer/cnt [11]}),
    .b({\u_cpu/u_timer/cnt [14],\u_cpu/u_timer/cnt [12]}),
    .c(2'b11),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_cpu/u_timer/sub0/c11 ),
    .f({\u_cpu/u_timer/n1 [13],\u_cpu/u_timer/n1 [11]}),
    .fco(\u_cpu/u_timer/sub0/c15 ),
    .fx({\u_cpu/u_timer/n1 [14],\u_cpu/u_timer/n1 [12]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cpu/u_timer/sub0/ucin_al_u1069"),
    //.R_POSITION("X0Y2Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_cpu/u_timer/sub0/u15_al_u1073  (
    .a({\u_cpu/u_timer/cnt [17],\u_cpu/u_timer/cnt [15]}),
    .b({\u_cpu/u_timer/cnt [18],\u_cpu/u_timer/cnt [16]}),
    .c(2'b11),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_cpu/u_timer/sub0/c15 ),
    .f({\u_cpu/u_timer/n1 [17],\u_cpu/u_timer/n1 [15]}),
    .fco(\u_cpu/u_timer/sub0/c19 ),
    .fx({\u_cpu/u_timer/n1 [18],\u_cpu/u_timer/n1 [16]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cpu/u_timer/sub0/ucin_al_u1069"),
    //.R_POSITION("X0Y2Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_cpu/u_timer/sub0/u19_al_u1074  (
    .a({\u_cpu/u_timer/cnt [21],\u_cpu/u_timer/cnt [19]}),
    .b({\u_cpu/u_timer/cnt [22],\u_cpu/u_timer/cnt [20]}),
    .c(2'b11),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_cpu/u_timer/sub0/c19 ),
    .f({\u_cpu/u_timer/n1 [21],\u_cpu/u_timer/n1 [19]}),
    .fco(\u_cpu/u_timer/sub0/c23 ),
    .fx({\u_cpu/u_timer/n1 [22],\u_cpu/u_timer/n1 [20]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cpu/u_timer/sub0/ucin_al_u1069"),
    //.R_POSITION("X0Y3Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_cpu/u_timer/sub0/u23_al_u1075  (
    .a({open_n9078,\u_cpu/u_timer/cnt [23]}),
    .c(2'b11),
    .d({open_n9083,1'b0}),
    .fci(\u_cpu/u_timer/sub0/c23 ),
    .f({open_n9100,\u_cpu/u_timer/n1 [23]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cpu/u_timer/sub0/ucin_al_u1069"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_cpu/u_timer/sub0/u3_al_u1070  (
    .a({\u_cpu/u_timer/cnt [5],\u_cpu/u_timer/cnt [3]}),
    .b({\u_cpu/u_timer/cnt [6],\u_cpu/u_timer/cnt [4]}),
    .c(2'b11),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_cpu/u_timer/sub0/c3 ),
    .f({\u_cpu/u_timer/n1 [5],\u_cpu/u_timer/n1 [3]}),
    .fco(\u_cpu/u_timer/sub0/c7 ),
    .fx({\u_cpu/u_timer/n1 [6],\u_cpu/u_timer/n1 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cpu/u_timer/sub0/ucin_al_u1069"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_cpu/u_timer/sub0/u7_al_u1071  (
    .a({\u_cpu/u_timer/cnt [9],\u_cpu/u_timer/cnt [7]}),
    .b({\u_cpu/u_timer/cnt [10],\u_cpu/u_timer/cnt [8]}),
    .c(2'b11),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_cpu/u_timer/sub0/c7 ),
    .f({\u_cpu/u_timer/n1 [9],\u_cpu/u_timer/n1 [7]}),
    .fco(\u_cpu/u_timer/sub0/c11 ),
    .fx({\u_cpu/u_timer/n1 [10],\u_cpu/u_timer/n1 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cpu/u_timer/sub0/ucin_al_u1069"),
    //.R_POSITION("X0Y0Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'h0005),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_cpu/u_timer/sub0/ucin_al_u1069  (
    .a({\u_cpu/u_timer/cnt [1],1'b0}),
    .b({\u_cpu/u_timer/cnt [2],\u_cpu/u_timer/cnt [0]}),
    .c(2'b11),
    .d(2'b01),
    .e(2'b01),
    .f({\u_cpu/u_timer/n1 [1],open_n9159}),
    .fco(\u_cpu/u_timer/sub0/c3 ),
    .fx({\u_cpu/u_timer/n1 [2],\u_cpu/u_timer/n1 [0]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_key/add0/ucin_al_u1076"),
    //.R_POSITION("X0Y1Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_key/add0/u11_al_u1079  (
    .a({\u_key/cnt [13],\u_key/cnt [11]}),
    .b({\u_key/cnt [14],\u_key/cnt [12]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_key/add0/c11 ),
    .f({\u_key/n3 [13],\u_key/n3 [11]}),
    .fco(\u_key/add0/c15 ),
    .fx({\u_key/n3 [14],\u_key/n3 [12]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_key/add0/ucin_al_u1076"),
    //.R_POSITION("X0Y2Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_key/add0/u15_al_u1080  (
    .a({\u_key/cnt [17],\u_key/cnt [15]}),
    .b({\u_key/cnt [18],\u_key/cnt [16]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_key/add0/c15 ),
    .f({\u_key/n3 [17],\u_key/n3 [15]}),
    .fx({\u_key/n3 [18],\u_key/n3 [16]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_key/add0/ucin_al_u1076"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_key/add0/u3_al_u1077  (
    .a({\u_key/cnt [5],\u_key/cnt [3]}),
    .b({\u_key/cnt [6],\u_key/cnt [4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_key/add0/c3 ),
    .f({\u_key/n3 [5],\u_key/n3 [3]}),
    .fco(\u_key/add0/c7 ),
    .fx({\u_key/n3 [6],\u_key/n3 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_key/add0/ucin_al_u1076"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_key/add0/u7_al_u1078  (
    .a({\u_key/cnt [9],\u_key/cnt [7]}),
    .b({\u_key/cnt [10],\u_key/cnt [8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_key/add0/c7 ),
    .f({\u_key/n3 [9],\u_key/n3 [7]}),
    .fco(\u_key/add0/c11 ),
    .fx({\u_key/n3 [10],\u_key/n3 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_key/add0/ucin_al_u1076"),
    //.R_POSITION("X0Y0Z0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_key/add0/ucin_al_u1076  (
    .a({\u_key/cnt [1],1'b0}),
    .b({\u_key/cnt [2],\u_key/cnt [0]}),
    .c(2'b00),
    .clk(vga_clk_pad),
    .d(2'b01),
    .e(2'b01),
    .mi(\u_key/n3 [1:0]),
    .f({\u_key/n3 [1],open_n9249}),
    .fco(\u_key/add0/c3 ),
    .fx({\u_key/n3 [2],\u_key/n3 [0]}),
    .q(\u_key/cnt [1:0]));
  // sources/rtl/key/key.v(50)
  // sources/rtl/key/key.v(50)
  EG_PHY_MSLICE #(
    //.LUT0("(~D)"),
    //.LUT1("(~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011111111),
    .INIT_LUT1(16'b0000000011111111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_key/reg0_b0|u_key/reg0_b5  (
    .ce(\u_key/n14 ),
    .clk(vga_clk_pad),
    .d({key_pad[0],key_pad[5]}),
    .q({\u_key/key_d0 [0],\u_key/key_d0 [5]}));  // sources/rtl/key/key.v(50)
  // sources/rtl/key/key.v(50)
  // sources/rtl/key/key.v(50)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D)"),
    //.LUTF1("(~D)"),
    //.LUTG0("(~D)"),
    //.LUTG1("(~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011111111),
    .INIT_LUTF1(16'b0000000011111111),
    .INIT_LUTG0(16'b0000000011111111),
    .INIT_LUTG1(16'b0000000011111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_key/reg0_b1|u_key/reg0_b4  (
    .ce(\u_key/n14 ),
    .clk(vga_clk_pad),
    .d({key_pad[1],key_pad[4]}),
    .q({\u_key/key_d0 [1],\u_key/key_d0 [4]}));  // sources/rtl/key/key.v(50)
  // sources/rtl/key/key.v(50)
  // sources/rtl/key/key.v(50)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D)"),
    //.LUTF1("(~D)"),
    //.LUTG0("(~D)"),
    //.LUTG1("(~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011111111),
    .INIT_LUTF1(16'b0000000011111111),
    .INIT_LUTG0(16'b0000000011111111),
    .INIT_LUTG1(16'b0000000011111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_key/reg0_b2|u_key/reg0_b3  (
    .ce(\u_key/n14 ),
    .clk(vga_clk_pad),
    .d({key_pad[2],key_pad[3]}),
    .q({\u_key/key_d0 [2],\u_key/key_d0 [3]}));  // sources/rtl/key/key.v(50)
  // sources/rtl/key/key.v(57)
  // sources/rtl/key/key.v(57)
  EG_PHY_LSLICE #(
    //.LUTF0("(A*~(~D*~C*B))"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(A*~(~D*~C*B))"),
    //.LUTG1("(~C*~B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1010101010100010),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b1010101010100010),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_key/reg1_b0|u_key/key_flag_reg  (
    .a({open_n9330,\u_key/n23_lutinv }),
    .b({\u_key/key_d1 [0],_al_u548_o}),
    .c({\u_key/key_d1 [1],\u_key/key_d0 [0]}),
    .clk(vga_clk_pad),
    .d({_al_u546_o,\u_key/key_d0 [1]}),
    .mi({\u_key/key_d0 [0],open_n9335}),
    .f({\u_key/n23_lutinv ,open_n9348}),
    .q({\u_key/key_d1 [0],\u_key/key_flag }));  // sources/rtl/key/key.v(57)
  // sources/rtl/key/key.v(57)
  // sources/rtl/key/key.v(57)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*~A)"),
    //.LUTF1("(~D*~C*~B*~A)"),
    //.LUTG0("(~D*~C*~B*~A)"),
    //.LUTG1("(~D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000001),
    .INIT_LUTF1(16'b0000000000000001),
    .INIT_LUTG0(16'b0000000000000001),
    .INIT_LUTG1(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_key/reg1_b2|u_key/reg1_b3  (
    .a({\u_key/key_d0 [2],\u_key/key_d1 [2]}),
    .b({\u_key/key_d0 [3],\u_key/key_d1 [3]}),
    .c({\u_key/key_d0 [4],\u_key/key_d1 [4]}),
    .clk(vga_clk_pad),
    .d({\u_key/key_d0 [5],\u_key/key_d1 [5]}),
    .mi({\u_key/key_d0 [2],\u_key/key_d0 [3]}),
    .f({_al_u548_o,_al_u546_o}),
    .q({\u_key/key_d1 [2],\u_key/key_d1 [3]}));  // sources/rtl/key/key.v(57)
  // sources/rtl/key/key.v(57)
  // sources/rtl/key/key.v(57)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_key/reg1_b4|u_key/reg1_b5  (
    .clk(vga_clk_pad),
    .mi({\u_key/key_d0 [4],\u_key/key_d0 [5]}),
    .q({\u_key/key_d1 [4],\u_key/key_d1 [5]}));  // sources/rtl/key/key.v(57)
  // sources/rtl/key/key.v(66)
  // sources/rtl/key/key.v(66)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_key/reg2_b0|u_key/reg2_b5  (
    .ce(\u_key/key_flag ),
    .clk(vga_clk_pad),
    .mi({\u_key/key_d1 [0],\u_key/key_d1 [5]}),
    .sr(clear),
    .q({key_deb[0],key_deb[5]}));  // sources/rtl/key/key.v(66)
  // sources/rtl/key/key.v(66)
  // sources/rtl/key/key.v(66)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_key/reg2_b1|u_key/reg2_b4  (
    .ce(\u_key/key_flag ),
    .clk(vga_clk_pad),
    .mi({\u_key/key_d1 [1],\u_key/key_d1 [4]}),
    .sr(clear),
    .q({key_deb[1],key_deb[4]}));  // sources/rtl/key/key.v(66)
  // sources/rtl/key/key.v(66)
  // sources/rtl/key/key.v(66)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_key/reg2_b2|u_key/reg2_b3  (
    .ce(\u_key/key_flag ),
    .clk(vga_clk_pad),
    .mi({\u_key/key_d1 [2],\u_key/key_d1 [3]}),
    .sr(clear),
    .q({key_deb[2],key_deb[3]}));  // sources/rtl/key/key.v(66)
  // sources/rtl/key/key.v(43)
  // sources/rtl/key/key.v(43)
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*B*A)"),
    //.LUT1("(D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1000000000000000),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_key/reg3_b10|u_key/reg3_b16  (
    .a({\u_key/cnt [0],\u_key/cnt [16]}),
    .b({\u_key/cnt [1],\u_key/cnt [17]}),
    .c({\u_key/cnt [10],\u_key/cnt [18]}),
    .clk(vga_clk_pad),
    .d({\u_key/cnt [11],\u_key/cnt [2]}),
    .mi({\u_key/n3 [10],\u_key/n3 [16]}),
    .f({_al_u555_o,_al_u552_o}),
    .q({\u_key/cnt [10],\u_key/cnt [16]}));  // sources/rtl/key/key.v(43)
  // sources/rtl/uart/uart_rx.v(54)
  // sources/rtl/key/key.v(43)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_key/reg3_b11|u_uart/u_uart_rx/reg4_b1  (
    .clk(vga_clk_pad),
    .mi({\u_key/n3 [11],\u_uart/u_uart_rx/rx_d [0]}),
    .q({\u_key/cnt [11],\u_uart/u_uart_rx/rx_d [1]}));  // sources/rtl/uart/uart_rx.v(54)
  // sources/rtl/key/key.v(43)
  // sources/rtl/key/key.v(43)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_key/reg3_b14|u_key/reg3_b15  (
    .clk(vga_clk_pad),
    .mi({\u_key/n3 [14],\u_key/n3 [15]}),
    .q({\u_key/cnt [14],\u_key/cnt [15]}));  // sources/rtl/key/key.v(43)
  // sources/rtl/key/key.v(43)
  // sources/rtl/key/key.v(43)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_key/reg3_b17|u_key/reg3_b18  (
    .clk(vga_clk_pad),
    .mi({\u_key/n3 [17],\u_key/n3 [18]}),
    .q({\u_key/cnt [17],\u_key/cnt [18]}));  // sources/rtl/key/key.v(43)
  // sources/rtl/key/key.v(43)
  // sources/rtl/key/key.v(43)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_key/reg3_b2|u_key/reg3_b5  (
    .clk(vga_clk_pad),
    .mi({\u_key/n3 [2],\u_key/n3 [5]}),
    .q({\u_key/cnt [2],\u_key/cnt [5]}));  // sources/rtl/key/key.v(43)
  // sources/rtl/key/key.v(43)
  // sources/rtl/key/key.v(43)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_key/reg3_b4|u_key/reg3_b6  (
    .clk(vga_clk_pad),
    .mi({\u_key/n3 [4],\u_key/n3 [6]}),
    .q({\u_key/cnt [4],\u_key/cnt [6]}));  // sources/rtl/key/key.v(43)
  // sources/rtl/key/key.v(43)
  // sources/rtl/key/key.v(43)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_key/reg3_b8|u_key/reg3_b9  (
    .clk(vga_clk_pad),
    .mi({\u_key/n3 [8],\u_key/n3 [9]}),
    .q({\u_key/cnt [8],\u_key/cnt [9]}));  // sources/rtl/key/key.v(43)
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
    .clkc({open_n9654,open_n9655,open_n9656,open_n9657,\u_pll/clk0_buf }));  // al_ip/pll.v(53)
  // address_offset=0;data_offset=0;depth=16;width=8;num_section=1;width_per_section=8;section_size=8;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0004"),
    //.WID("0x0004"),
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
    .READBACK("OFF"),
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
    .dia({open_n9675,8'b00000000}),
    .dib({open_n9676,ram_wdata}),
    .web(\u_ram/n4 ),
    .doa({open_n9682,ram_rdata}));
  // address_offset=0;data_offset=0;depth=4096;width=2;num_section=1;width_per_section=2;section_size=8;working_depth=4096;working_width=2;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0005"),
    //.WID("0x0005"),
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
    .READBACK("OFF"),
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
    .dia({open_n9699,open_n9700,open_n9701,1'b0,open_n9702,open_n9703,1'b0,open_n9704,open_n9705}),
    .dib({open_n9706,open_n9707,open_n9708,rom_wdata[1],open_n9709,open_n9710,rom_wdata[0],open_n9711,open_n9712}),
    .web(\u_rom/n4 ),
    .doa({open_n9718,open_n9719,open_n9720,open_n9721,open_n9722,open_n9723,open_n9724,rom_rdata[1:0]}));
  // address_offset=0;data_offset=2;depth=4096;width=2;num_section=1;width_per_section=2;section_size=8;working_depth=4096;working_width=2;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0006"),
    //.WID("0x0006"),
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
    .READBACK("OFF"),
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
    .dia({open_n9741,open_n9742,open_n9743,1'b0,open_n9744,open_n9745,1'b0,open_n9746,open_n9747}),
    .dib({open_n9748,open_n9749,open_n9750,rom_wdata[3],open_n9751,open_n9752,rom_wdata[2],open_n9753,open_n9754}),
    .web(\u_rom/n4 ),
    .doa({open_n9760,open_n9761,open_n9762,open_n9763,open_n9764,open_n9765,open_n9766,rom_rdata[3:2]}));
  // address_offset=0;data_offset=4;depth=4096;width=2;num_section=1;width_per_section=2;section_size=8;working_depth=4096;working_width=2;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0007"),
    //.WID("0x0007"),
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
    .READBACK("OFF"),
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
    .dia({open_n9783,open_n9784,open_n9785,1'b0,open_n9786,open_n9787,1'b0,open_n9788,open_n9789}),
    .dib({open_n9790,open_n9791,open_n9792,rom_wdata[5],open_n9793,open_n9794,rom_wdata[4],open_n9795,open_n9796}),
    .web(\u_rom/n4 ),
    .doa({open_n9802,open_n9803,open_n9804,open_n9805,open_n9806,open_n9807,open_n9808,rom_rdata[5:4]}));
  // address_offset=0;data_offset=6;depth=4096;width=2;num_section=1;width_per_section=2;section_size=8;working_depth=4096;working_width=2;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0008"),
    //.WID("0x0008"),
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
    .READBACK("OFF"),
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
    .dia({open_n9825,open_n9826,open_n9827,1'b0,open_n9828,open_n9829,1'b0,open_n9830,open_n9831}),
    .dib({open_n9832,open_n9833,open_n9834,rom_wdata[7],open_n9835,open_n9836,rom_wdata[6],open_n9837,open_n9838}),
    .web(\u_rom/n4 ),
    .doa({open_n9844,open_n9845,open_n9846,open_n9847,open_n9848,open_n9849,open_n9850,rom_rdata[7:6]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_uart/u_uart_rx/add0/ucin_al_u1044"),
    //.R_POSITION("X0Y1Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_uart/u_uart_rx/add0/u11_al_u1047  (
    .a({\u_uart/u_uart_rx/clk_cnt [13],\u_uart/u_uart_rx/clk_cnt [11]}),
    .b({\u_uart/u_uart_rx/clk_cnt [14],\u_uart/u_uart_rx/clk_cnt [12]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_uart/u_uart_rx/add0/c11 ),
    .f({\u_uart/u_uart_rx/n7 [13],\u_uart/u_uart_rx/n7 [11]}),
    .fco(\u_uart/u_uart_rx/add0/c15 ),
    .fx({\u_uart/u_uart_rx/n7 [14],\u_uart/u_uart_rx/n7 [12]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_uart/u_uart_rx/add0/ucin_al_u1044"),
    //.R_POSITION("X0Y2Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_uart/u_uart_rx/add0/u15_al_u1048  (
    .a({\u_uart/u_uart_rx/clk_cnt [17],\u_uart/u_uart_rx/clk_cnt [15]}),
    .b({\u_uart/u_uart_rx/clk_cnt [18],\u_uart/u_uart_rx/clk_cnt [16]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_uart/u_uart_rx/add0/c15 ),
    .f({\u_uart/u_uart_rx/n7 [17],\u_uart/u_uart_rx/n7 [15]}),
    .fco(\u_uart/u_uart_rx/add0/c19 ),
    .fx({\u_uart/u_uart_rx/n7 [18],\u_uart/u_uart_rx/n7 [16]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_uart/u_uart_rx/add0/ucin_al_u1044"),
    //.R_POSITION("X0Y2Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_uart/u_uart_rx/add0/u19_al_u1049  (
    .a({\u_uart/u_uart_rx/clk_cnt [21],\u_uart/u_uart_rx/clk_cnt [19]}),
    .b({\u_uart/u_uart_rx/clk_cnt [22],\u_uart/u_uart_rx/clk_cnt [20]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_uart/u_uart_rx/add0/c19 ),
    .f({\u_uart/u_uart_rx/n7 [21],\u_uart/u_uart_rx/n7 [19]}),
    .fco(\u_uart/u_uart_rx/add0/c23 ),
    .fx({\u_uart/u_uart_rx/n7 [22],\u_uart/u_uart_rx/n7 [20]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_uart/u_uart_rx/add0/ucin_al_u1044"),
    //.R_POSITION("X0Y3Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_uart/u_uart_rx/add0/u23_al_u1050  (
    .a({\u_uart/u_uart_rx/clk_cnt [25],\u_uart/u_uart_rx/clk_cnt [23]}),
    .b({\u_uart/u_uart_rx/clk_cnt [26],\u_uart/u_uart_rx/clk_cnt [24]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_uart/u_uart_rx/add0/c23 ),
    .f({\u_uart/u_uart_rx/n7 [25],\u_uart/u_uart_rx/n7 [23]}),
    .fco(\u_uart/u_uart_rx/add0/c27 ),
    .fx({\u_uart/u_uart_rx/n7 [26],\u_uart/u_uart_rx/n7 [24]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_uart/u_uart_rx/add0/ucin_al_u1044"),
    //.R_POSITION("X0Y3Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_uart/u_uart_rx/add0/u27_al_u1051  (
    .a({\u_uart/u_uart_rx/clk_cnt [29],\u_uart/u_uart_rx/clk_cnt [27]}),
    .b({\u_uart/u_uart_rx/clk_cnt [30],\u_uart/u_uart_rx/clk_cnt [28]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_uart/u_uart_rx/add0/c27 ),
    .f({\u_uart/u_uart_rx/n7 [29],\u_uart/u_uart_rx/n7 [27]}),
    .fco(\u_uart/u_uart_rx/add0/c31 ),
    .fx({\u_uart/u_uart_rx/n7 [30],\u_uart/u_uart_rx/n7 [28]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_uart/u_uart_rx/add0/ucin_al_u1044"),
    //.R_POSITION("X0Y4Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_uart/u_uart_rx/add0/u31_al_u1052  (
    .a({open_n9950,\u_uart/u_uart_rx/clk_cnt [31]}),
    .c(2'b00),
    .d({open_n9955,1'b0}),
    .fci(\u_uart/u_uart_rx/add0/c31 ),
    .f({open_n9972,\u_uart/u_uart_rx/n7 [31]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_uart/u_uart_rx/add0/ucin_al_u1044"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_uart/u_uart_rx/add0/u3_al_u1045  (
    .a({\u_uart/u_uart_rx/clk_cnt [5],\u_uart/u_uart_rx/clk_cnt [3]}),
    .b({\u_uart/u_uart_rx/clk_cnt [6],\u_uart/u_uart_rx/clk_cnt [4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_uart/u_uart_rx/add0/c3 ),
    .f({\u_uart/u_uart_rx/n7 [5],\u_uart/u_uart_rx/n7 [3]}),
    .fco(\u_uart/u_uart_rx/add0/c7 ),
    .fx({\u_uart/u_uart_rx/n7 [6],\u_uart/u_uart_rx/n7 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_uart/u_uart_rx/add0/ucin_al_u1044"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_uart/u_uart_rx/add0/u7_al_u1046  (
    .a({\u_uart/u_uart_rx/clk_cnt [9],\u_uart/u_uart_rx/clk_cnt [7]}),
    .b({\u_uart/u_uart_rx/clk_cnt [10],\u_uart/u_uart_rx/clk_cnt [8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_uart/u_uart_rx/add0/c7 ),
    .f({\u_uart/u_uart_rx/n7 [9],\u_uart/u_uart_rx/n7 [7]}),
    .fco(\u_uart/u_uart_rx/add0/c11 ),
    .fx({\u_uart/u_uart_rx/n7 [10],\u_uart/u_uart_rx/n7 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_uart/u_uart_rx/add0/ucin_al_u1044"),
    //.R_POSITION("X0Y0Z0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_rx/add0/ucin_al_u1044  (
    .a({\u_uart/u_uart_rx/clk_cnt [1],1'b0}),
    .b({\u_uart/u_uart_rx/clk_cnt [2],\u_uart/u_uart_rx/clk_cnt [0]}),
    .c(2'b00),
    .clk(vga_clk_pad),
    .d(2'b01),
    .e(2'b01),
    .mi({open_n10016,\u_uart/u_uart_rx/n7 [1]}),
    .sr(\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .f({\u_uart/u_uart_rx/n7 [1],open_n10028}),
    .fco(\u_uart/u_uart_rx/add0/c3 ),
    .fx({\u_uart/u_uart_rx/n7 [2],\u_uart/u_uart_rx/n7 [0]}),
    .q({open_n10029,\u_uart/u_uart_rx/clk_cnt [1]}));
  // sources/rtl/uart/uart_rx.v(54)
  // sources/rtl/uart/uart_rx.v(80)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_uart_rx/clk_en_reg|u_uart/u_uart_rx/reg4_b0  (
    .c({_al_u757_o,\u_uart/u_uart_rx/rx_d [1]}),
    .clk(vga_clk_pad),
    .d({_al_u752_o,\u_uart/u_uart_rx/rx_d [0]}),
    .mi({open_n10045,rx_pad}),
    .f({\u_uart/u_uart_rx/n5 ,\u_uart/u_uart_rx/n0 }),
    .q({\u_uart/u_uart_rx/clk_en ,\u_uart/u_uart_rx/rx_d [0]}));  // sources/rtl/uart/uart_rx.v(54)
  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .REG1_REGSET("SET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_rx/reg0_b0|u_uart/u_uart_rx/reg0_b3  (
    .c({\u_uart/u_uart_rx/n7 [0],\u_uart/u_uart_rx/n7 [3]}),
    .clk(vga_clk_pad),
    .d({\u_uart/u_uart_rx/n5 ,\u_uart/u_uart_rx/n5 }),
    .sr(\u_uart/u_uart_rx/start ),
    .q({\u_uart/u_uart_rx/clk_cnt [0],\u_uart/u_uart_rx/clk_cnt [3]}));  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(~D*~C*B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000000000100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_rx/reg0_b11|u_uart/u_uart_rx/reg0_b10  (
    .a({\u_uart/u_uart_rx/clk_cnt [0],open_n10076}),
    .b({\u_uart/u_uart_rx/clk_cnt [1],open_n10077}),
    .c({\u_uart/u_uart_rx/clk_cnt [10],\u_uart/u_uart_rx/start }),
    .clk(vga_clk_pad),
    .d({\u_uart/u_uart_rx/clk_cnt [11],\u_uart/u_uart_rx/n5 }),
    .mi(\u_uart/u_uart_rx/n7 [11:10]),
    .sr(\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .f({_al_u754_o,\u_uart/u_uart_rx/mux1_b10_sel_is_1_o }),
    .q(\u_uart/u_uart_rx/clk_cnt [11:10]));  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*~B*~A)"),
    //.LUT1("(~D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000010000),
    .INIT_LUT1(16'b0000000000000001),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_rx/reg0_b12|u_uart/u_uart_rx/reg0_b30  (
    .a({\u_uart/u_uart_rx/clk_cnt [12],\u_uart/u_uart_rx/clk_cnt [30]}),
    .b({\u_uart/u_uart_rx/clk_cnt [13],\u_uart/u_uart_rx/clk_cnt [31]}),
    .c({\u_uart/u_uart_rx/clk_cnt [14],\u_uart/u_uart_rx/clk_cnt [4]}),
    .clk(vga_clk_pad),
    .d({\u_uart/u_uart_rx/clk_cnt [15],\u_uart/u_uart_rx/clk_cnt [5]}),
    .mi({\u_uart/u_uart_rx/n7 [12],\u_uart/u_uart_rx/n7 [30]}),
    .sr(\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .f({_al_u753_o,_al_u751_o}),
    .q({\u_uart/u_uart_rx/clk_cnt [12],\u_uart/u_uart_rx/clk_cnt [30]}));  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_rx/reg0_b13|u_uart/u_uart_rx/reg0_b9  (
    .clk(vga_clk_pad),
    .mi({\u_uart/u_uart_rx/n7 [13],\u_uart/u_uart_rx/n7 [9]}),
    .sr(\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .q({\u_uart/u_uart_rx/clk_cnt [13],\u_uart/u_uart_rx/clk_cnt [9]}));  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_rx/reg0_b14|u_uart/u_uart_rx/reg0_b8  (
    .clk(vga_clk_pad),
    .mi({\u_uart/u_uart_rx/n7 [14],\u_uart/u_uart_rx/n7 [8]}),
    .sr(\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .q({\u_uart/u_uart_rx/clk_cnt [14],\u_uart/u_uart_rx/clk_cnt [8]}));  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_rx/reg0_b15|u_uart/u_uart_rx/reg0_b7  (
    .clk(vga_clk_pad),
    .mi({\u_uart/u_uart_rx/n7 [15],\u_uart/u_uart_rx/n7 [7]}),
    .sr(\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .q({\u_uart/u_uart_rx/clk_cnt [15],\u_uart/u_uart_rx/clk_cnt [7]}));  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~C*~B*~A)"),
    //.LUTF1("(~D*~C*~B*~A)"),
    //.LUTG0("(D*~C*~B*~A)"),
    //.LUTG1("(~D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000100000000),
    .INIT_LUTF1(16'b0000000000000001),
    .INIT_LUTG0(16'b0000000100000000),
    .INIT_LUTG1(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_rx/reg0_b16|u_uart/u_uart_rx/reg0_b27  (
    .a({\u_uart/u_uart_rx/clk_cnt [16],\u_uart/u_uart_rx/clk_cnt [27]}),
    .b({\u_uart/u_uart_rx/clk_cnt [17],\u_uart/u_uart_rx/clk_cnt [28]}),
    .c({\u_uart/u_uart_rx/clk_cnt [18],\u_uart/u_uart_rx/clk_cnt [29]}),
    .clk(vga_clk_pad),
    .d({\u_uart/u_uart_rx/clk_cnt [19],\u_uart/u_uart_rx/clk_cnt [3]}),
    .mi({\u_uart/u_uart_rx/n7 [16],\u_uart/u_uart_rx/n7 [27]}),
    .sr(\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .f({_al_u756_o,_al_u748_o}),
    .q({\u_uart/u_uart_rx/clk_cnt [16],\u_uart/u_uart_rx/clk_cnt [27]}));  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_rx/reg0_b17|u_uart/u_uart_rx/reg0_b5  (
    .clk(vga_clk_pad),
    .mi({\u_uart/u_uart_rx/n7 [17],\u_uart/u_uart_rx/n7 [5]}),
    .sr(\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .q({\u_uart/u_uart_rx/clk_cnt [17],\u_uart/u_uart_rx/clk_cnt [5]}));  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_rx/reg0_b18|u_uart/u_uart_rx/reg0_b4  (
    .clk(vga_clk_pad),
    .mi({\u_uart/u_uart_rx/n7 [18],\u_uart/u_uart_rx/n7 [4]}),
    .sr(\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .q({\u_uart/u_uart_rx/clk_cnt [18],\u_uart/u_uart_rx/clk_cnt [4]}));  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_rx/reg0_b19|u_uart/u_uart_rx/reg0_b31  (
    .clk(vga_clk_pad),
    .mi({\u_uart/u_uart_rx/n7 [19],\u_uart/u_uart_rx/n7 [31]}),
    .sr(\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .q({\u_uart/u_uart_rx/clk_cnt [19],\u_uart/u_uart_rx/clk_cnt [31]}));  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*~A)"),
    //.LUTF1("(~D*~C*~B*~A)"),
    //.LUTG0("(~D*~C*~B*~A)"),
    //.LUTG1("(~D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000001),
    .INIT_LUTF1(16'b0000000000000001),
    .INIT_LUTG0(16'b0000000000000001),
    .INIT_LUTG1(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_rx/reg0_b20|u_uart/u_uart_rx/reg0_b23  (
    .a({\u_uart/u_uart_rx/clk_cnt [2],\u_uart/u_uart_rx/clk_cnt [23]}),
    .b({\u_uart/u_uart_rx/clk_cnt [20],\u_uart/u_uart_rx/clk_cnt [24]}),
    .c({\u_uart/u_uart_rx/clk_cnt [21],\u_uart/u_uart_rx/clk_cnt [25]}),
    .clk(vga_clk_pad),
    .d({\u_uart/u_uart_rx/clk_cnt [22],\u_uart/u_uart_rx/clk_cnt [26]}),
    .mi({\u_uart/u_uart_rx/n7 [20],\u_uart/u_uart_rx/n7 [23]}),
    .sr(\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .f({_al_u755_o,_al_u749_o}),
    .q({\u_uart/u_uart_rx/clk_cnt [20],\u_uart/u_uart_rx/clk_cnt [23]}));  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_rx/reg0_b21|u_uart/u_uart_rx/reg0_b29  (
    .clk(vga_clk_pad),
    .mi({\u_uart/u_uart_rx/n7 [21],\u_uart/u_uart_rx/n7 [29]}),
    .sr(\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .q({\u_uart/u_uart_rx/clk_cnt [21],\u_uart/u_uart_rx/clk_cnt [29]}));  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_rx/reg0_b22|u_uart/u_uart_rx/reg0_b28  (
    .clk(vga_clk_pad),
    .mi({\u_uart/u_uart_rx/n7 [22],\u_uart/u_uart_rx/n7 [28]}),
    .sr(\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .q({\u_uart/u_uart_rx/clk_cnt [22],\u_uart/u_uart_rx/clk_cnt [28]}));  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  // sources/rtl/uart/uart_rx.v(74)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_rx/reg0_b24|u_uart/u_uart_rx/reg0_b26  (
    .clk(vga_clk_pad),
    .mi({\u_uart/u_uart_rx/n7 [24],\u_uart/u_uart_rx/n7 [26]}),
    .sr(\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .q({\u_uart/u_uart_rx/clk_cnt [24],\u_uart/u_uart_rx/clk_cnt [26]}));  // sources/rtl/uart/uart_rx.v(74)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_rx/reg0_b25  (
    .clk(vga_clk_pad),
    .mi({open_n10393,\u_uart/u_uart_rx/n7 [25]}),
    .sr(\u_uart/u_uart_rx/mux1_b10_sel_is_1_o ),
    .q({open_n10399,\u_uart/u_uart_rx/clk_cnt [25]}));  // sources/rtl/uart/uart_rx.v(74)
  EG_PHY_MSLICE #(
    //.MACRO("u_uart/u_uart_rx/reg1_b0|u_uart/u_uart_rx/add1/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_rx/reg1_b0|u_uart/u_uart_rx/add1/ucin  (
    .a({\u_uart/u_uart_rx/cnt [0],1'b0}),
    .b({1'b1,open_n10400}),
    .ce(\u_uart/u_uart_rx/clk_en ),
    .clk(vga_clk_pad),
    .sr(\u_uart/u_uart_rx/start ),
    .fco(\u_uart/u_uart_rx/add1/c1 ),
    .q({\u_uart/u_uart_rx/cnt [0],open_n10421}));
  EG_PHY_MSLICE #(
    //.MACRO("u_uart/u_uart_rx/reg1_b0|u_uart/u_uart_rx/add1/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_rx/reg1_b2|u_uart/u_uart_rx/reg1_b1  (
    .a(\u_uart/u_uart_rx/cnt [2:1]),
    .b(2'b00),
    .ce(\u_uart/u_uart_rx/clk_en ),
    .clk(vga_clk_pad),
    .fci(\u_uart/u_uart_rx/add1/c1 ),
    .sr(\u_uart/u_uart_rx/start ),
    .fco(\u_uart/u_uart_rx/add1/c3 ),
    .q(\u_uart/u_uart_rx/cnt [2:1]));
  EG_PHY_MSLICE #(
    //.MACRO("u_uart/u_uart_rx/reg1_b0|u_uart/u_uart_rx/add1/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_rx/reg1_b3_al_u1103  (
    .a({open_n10441,\u_uart/u_uart_rx/cnt [3]}),
    .b({open_n10442,1'b0}),
    .ce(\u_uart/u_uart_rx/clk_en ),
    .clk(vga_clk_pad),
    .fci(\u_uart/u_uart_rx/add1/c3 ),
    .sr(\u_uart/u_uart_rx/start ),
    .q({open_n10463,\u_uart/u_uart_rx/cnt [3]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTG0("(~C*B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTG0(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_uart_rx/reg2_b0  (
    .b({open_n10466,\u_uart/u_uart_rx/cnt [0]}),
    .c({open_n10467,\u_uart/u_uart_rx/cnt [1]}),
    .ce(\u_uart/u_uart_rx/mux4_b0_sel_is_3_o ),
    .clk(vga_clk_pad),
    .d({open_n10468,_al_u557_o}),
    .mi({open_n10472,rx_pad}),
    .f({open_n10485,\u_uart/u_uart_rx/mux4_b0_sel_is_3_o }),
    .q({open_n10489,\u_uart/u_uart_rx/data [0]}));  // sources/rtl/uart/uart_rx.v(105)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*D)"),
    //.LUTG0("(C*~B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011000000000000),
    .INIT_LUTG0(16'b0011000000000000),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_uart_rx/reg2_b1  (
    .b({open_n10492,\u_uart/u_uart_rx/cnt [0]}),
    .c({open_n10493,\u_uart/u_uart_rx/cnt [1]}),
    .ce(\u_uart/u_uart_rx/mux4_b1_sel_is_3_o ),
    .clk(vga_clk_pad),
    .d({open_n10494,_al_u557_o}),
    .mi({open_n10498,rx_pad}),
    .f({open_n10511,\u_uart/u_uart_rx/mux4_b1_sel_is_3_o }),
    .q({open_n10515,\u_uart/u_uart_rx/data [1]}));  // sources/rtl/uart/uart_rx.v(105)
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_uart_rx/reg2_b2  (
    .b({open_n10518,\u_uart/u_uart_rx/cnt [0]}),
    .c({open_n10519,\u_uart/u_uart_rx/cnt [1]}),
    .ce(\u_uart/u_uart_rx/mux4_b2_sel_is_3_o ),
    .clk(vga_clk_pad),
    .d({open_n10520,_al_u557_o}),
    .mi({open_n10531,rx_pad}),
    .f({open_n10533,\u_uart/u_uart_rx/mux4_b2_sel_is_3_o }),
    .q({open_n10537,\u_uart/u_uart_rx/data [2]}));  // sources/rtl/uart/uart_rx.v(105)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000001100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_uart_rx/reg2_b3  (
    .b({open_n10540,\u_uart/u_uart_rx/cnt [0]}),
    .c({open_n10541,\u_uart/u_uart_rx/cnt [1]}),
    .ce(\u_uart/u_uart_rx/mux4_b3_sel_is_3_o ),
    .clk(vga_clk_pad),
    .d({open_n10542,_al_u561_o}),
    .mi({open_n10553,rx_pad}),
    .f({open_n10555,\u_uart/u_uart_rx/mux4_b3_sel_is_3_o }),
    .q({open_n10559,\u_uart/u_uart_rx/data [3]}));  // sources/rtl/uart/uart_rx.v(105)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000110000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_uart_rx/reg2_b4  (
    .b({open_n10562,\u_uart/u_uart_rx/cnt [0]}),
    .c({open_n10563,\u_uart/u_uart_rx/cnt [1]}),
    .ce(\u_uart/u_uart_rx/mux4_b4_sel_is_3_o ),
    .clk(vga_clk_pad),
    .d({open_n10564,_al_u561_o}),
    .mi({open_n10575,rx_pad}),
    .f({open_n10577,\u_uart/u_uart_rx/mux4_b4_sel_is_3_o }),
    .q({open_n10581,\u_uart/u_uart_rx/data [4]}));  // sources/rtl/uart/uart_rx.v(105)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000001100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_uart_rx/reg2_b7  (
    .b({open_n10584,\u_uart/u_uart_rx/cnt [0]}),
    .c({open_n10585,\u_uart/u_uart_rx/cnt [1]}),
    .ce(\u_uart/u_uart_rx/mux4_b7_sel_is_3_o ),
    .clk(vga_clk_pad),
    .d({open_n10586,_al_u566_o}),
    .mi({open_n10597,rx_pad}),
    .f({open_n10599,\u_uart/u_uart_rx/mux4_b7_sel_is_3_o }),
    .q({open_n10603,\u_uart/u_uart_rx/data [7]}));  // sources/rtl/uart/uart_rx.v(105)
  // sources/rtl/uart/uart_rx.v(118)
  // sources/rtl/uart/uart_rx.v(118)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_uart_rx/reg3_b1|u_uart/u_uart_rx/reg3_b7  (
    .ce(\u_uart/u_uart_rx/n1 ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_uart_rx/data [1],\u_uart/u_uart_rx/data [7]}),
    .q({\u_uart/rx_data [1],\u_uart/rx_data [7]}));  // sources/rtl/uart/uart_rx.v(118)
  // sources/rtl/uart/uart_rx.v(118)
  // sources/rtl/uart/uart_rx.v(118)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_uart_rx/reg3_b2|u_uart/u_uart_rx/reg3_b6  (
    .ce(\u_uart/u_uart_rx/n1 ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_uart_rx/data [2],\u_uart/u_uart_rx/data [6]}),
    .q({\u_uart/rx_data [2],\u_uart/rx_data [6]}));  // sources/rtl/uart/uart_rx.v(118)
  // sources/rtl/uart/uart_rx.v(118)
  // sources/rtl/uart/uart_rx.v(118)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_uart_rx/reg3_b3|u_uart/u_uart_rx/reg3_b5  (
    .ce(\u_uart/u_uart_rx/n1 ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_uart_rx/data [3],\u_uart/u_uart_rx/data [5]}),
    .q({\u_uart/rx_data [3],\u_uart/rx_data [5]}));  // sources/rtl/uart/uart_rx.v(118)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_uart_rx/reg3_b4  (
    .ce(\u_uart/u_uart_rx/n1 ),
    .clk(vga_clk_pad),
    .mi({open_n10702,\u_uart/u_uart_rx/data [4]}),
    .q({open_n10709,\u_uart/rx_data [4]}));  // sources/rtl/uart/uart_rx.v(118)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTG0("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_uart_rx/rx_en_reg  (
    .c({open_n10714,\u_uart/u_uart_rx/start }),
    .clk(vga_clk_pad),
    .d({open_n10716,\u_uart/u_uart_rx/n1 }),
    .q({open_n10739,\u_uart/rx_en }));  // sources/rtl/uart/uart_rx.v(111)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_uart/u_uart_rx/start_reg  (
    .ce(\u_uart/u_uart_rx/n1 ),
    .clk(vga_clk_pad),
    .mi({open_n10751,1'b0}),
    .sr(\u_uart/u_uart_rx/n0 ),
    .q({open_n10768,\u_uart/u_uart_rx/start }));  // sources/rtl/uart/uart_rx.v(63)
  EG_PHY_LSLICE #(
    //.MACRO("u_uart/u_uart_tx/add0/ucin_al_u1053"),
    //.R_POSITION("X0Y1Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_uart/u_uart_tx/add0/u11_al_u1056  (
    .a({\u_uart/u_uart_tx/clk_cnt [13],\u_uart/u_uart_tx/clk_cnt [11]}),
    .b({\u_uart/u_uart_tx/clk_cnt [14],\u_uart/u_uart_tx/clk_cnt [12]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_uart/u_uart_tx/add0/c11 ),
    .f({\u_uart/u_uart_tx/n1 [13],\u_uart/u_uart_tx/n1 [11]}),
    .fco(\u_uart/u_uart_tx/add0/c15 ),
    .fx({\u_uart/u_uart_tx/n1 [14],\u_uart/u_uart_tx/n1 [12]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_uart/u_uart_tx/add0/ucin_al_u1053"),
    //.R_POSITION("X0Y2Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_uart/u_uart_tx/add0/u15_al_u1057  (
    .a({\u_uart/u_uart_tx/clk_cnt [17],\u_uart/u_uart_tx/clk_cnt [15]}),
    .b({\u_uart/u_uart_tx/clk_cnt [18],\u_uart/u_uart_tx/clk_cnt [16]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_uart/u_uart_tx/add0/c15 ),
    .f({\u_uart/u_uart_tx/n1 [17],\u_uart/u_uart_tx/n1 [15]}),
    .fco(\u_uart/u_uart_tx/add0/c19 ),
    .fx({\u_uart/u_uart_tx/n1 [18],\u_uart/u_uart_tx/n1 [16]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_uart/u_uart_tx/add0/ucin_al_u1053"),
    //.R_POSITION("X0Y2Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_uart/u_uart_tx/add0/u19_al_u1058  (
    .a({\u_uart/u_uart_tx/clk_cnt [21],\u_uart/u_uart_tx/clk_cnt [19]}),
    .b({\u_uart/u_uart_tx/clk_cnt [22],\u_uart/u_uart_tx/clk_cnt [20]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_uart/u_uart_tx/add0/c19 ),
    .f({\u_uart/u_uart_tx/n1 [21],\u_uart/u_uart_tx/n1 [19]}),
    .fco(\u_uart/u_uart_tx/add0/c23 ),
    .fx({\u_uart/u_uart_tx/n1 [22],\u_uart/u_uart_tx/n1 [20]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_uart/u_uart_tx/add0/ucin_al_u1053"),
    //.R_POSITION("X0Y3Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_uart/u_uart_tx/add0/u23_al_u1059  (
    .a({\u_uart/u_uart_tx/clk_cnt [25],\u_uart/u_uart_tx/clk_cnt [23]}),
    .b({\u_uart/u_uart_tx/clk_cnt [26],\u_uart/u_uart_tx/clk_cnt [24]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_uart/u_uart_tx/add0/c23 ),
    .f({\u_uart/u_uart_tx/n1 [25],\u_uart/u_uart_tx/n1 [23]}),
    .fco(\u_uart/u_uart_tx/add0/c27 ),
    .fx({\u_uart/u_uart_tx/n1 [26],\u_uart/u_uart_tx/n1 [24]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_uart/u_uart_tx/add0/ucin_al_u1053"),
    //.R_POSITION("X0Y3Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_uart/u_uart_tx/add0/u27_al_u1060  (
    .a({\u_uart/u_uart_tx/clk_cnt [29],\u_uart/u_uart_tx/clk_cnt [27]}),
    .b({\u_uart/u_uart_tx/clk_cnt [30],\u_uart/u_uart_tx/clk_cnt [28]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_uart/u_uart_tx/add0/c27 ),
    .f({\u_uart/u_uart_tx/n1 [29],\u_uart/u_uart_tx/n1 [27]}),
    .fco(\u_uart/u_uart_tx/add0/c31 ),
    .fx({\u_uart/u_uart_tx/n1 [30],\u_uart/u_uart_tx/n1 [28]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_uart/u_uart_tx/add0/ucin_al_u1053"),
    //.R_POSITION("X0Y4Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_uart/u_uart_tx/add0/u31_al_u1061  (
    .a({open_n10859,\u_uart/u_uart_tx/clk_cnt [31]}),
    .c(2'b00),
    .d({open_n10864,1'b0}),
    .fci(\u_uart/u_uart_tx/add0/c31 ),
    .f({open_n10881,\u_uart/u_uart_tx/n1 [31]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_uart/u_uart_tx/add0/ucin_al_u1053"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_uart/u_uart_tx/add0/u3_al_u1054  (
    .a({\u_uart/u_uart_tx/clk_cnt [5],\u_uart/u_uart_tx/clk_cnt [3]}),
    .b({\u_uart/u_uart_tx/clk_cnt [6],\u_uart/u_uart_tx/clk_cnt [4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_uart/u_uart_tx/add0/c3 ),
    .f({\u_uart/u_uart_tx/n1 [5],\u_uart/u_uart_tx/n1 [3]}),
    .fco(\u_uart/u_uart_tx/add0/c7 ),
    .fx({\u_uart/u_uart_tx/n1 [6],\u_uart/u_uart_tx/n1 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_uart/u_uart_tx/add0/ucin_al_u1053"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_uart/u_uart_tx/add0/u7_al_u1055  (
    .a({\u_uart/u_uart_tx/clk_cnt [9],\u_uart/u_uart_tx/clk_cnt [7]}),
    .b({\u_uart/u_uart_tx/clk_cnt [10],\u_uart/u_uart_tx/clk_cnt [8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_uart/u_uart_tx/add0/c7 ),
    .f({\u_uart/u_uart_tx/n1 [9],\u_uart/u_uart_tx/n1 [7]}),
    .fco(\u_uart/u_uart_tx/add0/c11 ),
    .fx({\u_uart/u_uart_tx/n1 [10],\u_uart/u_uart_tx/n1 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_uart/u_uart_tx/add0/ucin_al_u1053"),
    //.R_POSITION("X0Y0Z0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_tx/add0/ucin_al_u1053  (
    .a({\u_uart/u_uart_tx/clk_cnt [1],1'b0}),
    .b({\u_uart/u_uart_tx/clk_cnt [2],\u_uart/u_uart_tx/clk_cnt [0]}),
    .c(2'b00),
    .clk(vga_clk_pad),
    .d(2'b01),
    .e(2'b01),
    .mi(\u_uart/u_uart_tx/n1 [1:0]),
    .sr(\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .f({\u_uart/u_uart_tx/n1 [1],open_n10936}),
    .fco(\u_uart/u_uart_tx/add0/c3 ),
    .fx({\u_uart/u_uart_tx/n1 [2],\u_uart/u_uart_tx/n1 [0]}),
    .q(\u_uart/u_uart_tx/clk_cnt [1:0]));
  // sources/rtl/uart/ubus.v(118)
  // sources/rtl/uart/uart_tx.v(65)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*B*A)"),
    //.LUT1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000010000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_uart_tx/clk_en_reg|u_uart/u_ubus/frame_head_flag1_reg  (
    .a({open_n10937,_al_u656_o}),
    .b({open_n10938,_al_u657_o}),
    .c({_al_u768_o,\u_uart/u_ubus/shift_reg3 [0]}),
    .clk(vga_clk_pad),
    .d({_al_u763_o,\u_uart/u_ubus/shift_reg3 [1]}),
    .f({\u_uart/u_uart_tx/n0 ,open_n10953}),
    .q({\u_uart/u_uart_tx/clk_en ,\u_uart/u_ubus/frame_head_flag1 }));  // sources/rtl/uart/ubus.v(118)
  // sources/rtl/uart/uart_tx.v(81)
  // sources/rtl/uart/uart_tx.v(81)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001010),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011001010),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_uart_tx/reg0_b0|u_uart/u_uart_tx/reg0_b2  (
    .a({open_n10957,\u_uart/u_uart_tx/data [2]}),
    .b({open_n10958,\u_uart/u_uart_tx/data [3]}),
    .c({\u_uart/tx_en ,\u_uart/u_uart_tx/cnt [0]}),
    .ce(\u_uart/u_uart_tx/n8 ),
    .clk(vga_clk_pad),
    .d({\u_uart/u_uart_tx/start ,\u_uart/u_uart_tx/cnt [1]}),
    .mi({\u_uart/tx_data [0],\u_uart/tx_data [2]}),
    .f({\u_uart/u_uart_tx/n8 ,_al_u465_o}),
    .q({\u_uart/u_uart_tx/data [0],\u_uart/u_uart_tx/data [2]}));  // sources/rtl/uart/uart_tx.v(81)
  // sources/rtl/uart/uart_tx.v(81)
  // sources/rtl/uart/uart_tx.v(81)
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(~B*~(C*D))"),
    //.LUTG0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(~B*~(C*D))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000010010001100),
    .INIT_LUTF1(16'b0000001100110011),
    .INIT_LUTG0(16'b0000010010001100),
    .INIT_LUTG1(16'b0000001100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_uart_tx/reg0_b3|u_uart/u_uart_tx/reg0_b6  (
    .a({open_n10977,_al_u474_o}),
    .b({\u_uart/u_ubus/send_cnt [3],\u_uart/u_ubus/send_cnt [3]}),
    .c({\u_uart/tx_data [3],\u_uart/tx_data [6]}),
    .ce(\u_uart/u_uart_tx/n8 ),
    .clk(vga_clk_pad),
    .d({_al_u474_o,\u_uart/u_ubus/tx_buffer [6]}),
    .mi({\u_uart/tx_data [3],\u_uart/tx_data [6]}),
    .f({_al_u480_o,_al_u490_o}),
    .q({\u_uart/u_uart_tx/data [3],\u_uart/u_uart_tx/data [6]}));  // sources/rtl/uart/uart_tx.v(81)
  EG_PHY_MSLICE #(
    //.MACRO("u_uart/u_uart_tx/reg1_b0|u_uart/u_uart_tx/add1/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_tx/reg1_b0|u_uart/u_uart_tx/add1/ucin  (
    .a({\u_uart/u_uart_tx/cnt [0],1'b0}),
    .b({1'b1,open_n10996}),
    .ce(\u_uart/u_uart_tx/clk_en ),
    .clk(vga_clk_pad),
    .sr(\u_uart/u_uart_tx/start ),
    .fco(\u_uart/u_uart_tx/add1/c1 ),
    .q({\u_uart/u_uart_tx/cnt [0],open_n11017}));
  EG_PHY_MSLICE #(
    //.MACRO("u_uart/u_uart_tx/reg1_b0|u_uart/u_uart_tx/add1/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_tx/reg1_b2|u_uart/u_uart_tx/reg1_b1  (
    .a(\u_uart/u_uart_tx/cnt [2:1]),
    .b(2'b00),
    .ce(\u_uart/u_uart_tx/clk_en ),
    .clk(vga_clk_pad),
    .fci(\u_uart/u_uart_tx/add1/c1 ),
    .sr(\u_uart/u_uart_tx/start ),
    .fco(\u_uart/u_uart_tx/add1/c3 ),
    .q(\u_uart/u_uart_tx/cnt [2:1]));
  EG_PHY_MSLICE #(
    //.MACRO("u_uart/u_uart_tx/reg1_b0|u_uart/u_uart_tx/add1/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_tx/reg1_b3_al_u1104  (
    .a({open_n11037,\u_uart/u_uart_tx/cnt [3]}),
    .b({open_n11038,1'b0}),
    .ce(\u_uart/u_uart_tx/clk_en ),
    .clk(vga_clk_pad),
    .fci(\u_uart/u_uart_tx/add1/c3 ),
    .sr(\u_uart/u_uart_tx/start ),
    .q({open_n11059,\u_uart/u_uart_tx/cnt [3]}));
  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(~D*~C*B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000000000100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_tx/reg2_b11|u_uart/u_uart_tx/reg2_b10  (
    .a({\u_uart/u_uart_tx/clk_cnt [0],open_n11060}),
    .b({\u_uart/u_uart_tx/clk_cnt [1],open_n11061}),
    .c({\u_uart/u_uart_tx/clk_cnt [10],\u_uart/u_uart_tx/start }),
    .clk(vga_clk_pad),
    .d({\u_uart/u_uart_tx/clk_cnt [11],\u_uart/u_uart_tx/n0 }),
    .mi(\u_uart/u_uart_tx/n1 [11:10]),
    .sr(\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .f({_al_u765_o,\u_uart/u_uart_tx/mux1_b0_sel_is_1_o }),
    .q(\u_uart/u_uart_tx/clk_cnt [11:10]));  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*~B*~A)"),
    //.LUTF1("(~D*~C*~B*~A)"),
    //.LUTG0("(~D*C*~B*~A)"),
    //.LUTG1("(~D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000010000),
    .INIT_LUTF1(16'b0000000000000001),
    .INIT_LUTG0(16'b0000000000010000),
    .INIT_LUTG1(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_tx/reg2_b12|u_uart/u_uart_tx/reg2_b30  (
    .a({\u_uart/u_uart_tx/clk_cnt [12],\u_uart/u_uart_tx/clk_cnt [30]}),
    .b({\u_uart/u_uart_tx/clk_cnt [13],\u_uart/u_uart_tx/clk_cnt [31]}),
    .c({\u_uart/u_uart_tx/clk_cnt [14],\u_uart/u_uart_tx/clk_cnt [4]}),
    .clk(vga_clk_pad),
    .d({\u_uart/u_uart_tx/clk_cnt [15],\u_uart/u_uart_tx/clk_cnt [5]}),
    .mi({\u_uart/u_uart_tx/n1 [12],\u_uart/u_uart_tx/n1 [30]}),
    .sr(\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .f({_al_u764_o,_al_u762_o}),
    .q({\u_uart/u_uart_tx/clk_cnt [12],\u_uart/u_uart_tx/clk_cnt [30]}));  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_tx/reg2_b13|u_uart/u_uart_tx/reg2_b9  (
    .clk(vga_clk_pad),
    .mi({\u_uart/u_uart_tx/n1 [13],\u_uart/u_uart_tx/n1 [9]}),
    .sr(\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .q({\u_uart/u_uart_tx/clk_cnt [13],\u_uart/u_uart_tx/clk_cnt [9]}));  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_tx/reg2_b14|u_uart/u_uart_tx/reg2_b8  (
    .clk(vga_clk_pad),
    .mi({\u_uart/u_uart_tx/n1 [14],\u_uart/u_uart_tx/n1 [8]}),
    .sr(\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .q({\u_uart/u_uart_tx/clk_cnt [14],\u_uart/u_uart_tx/clk_cnt [8]}));  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_tx/reg2_b15|u_uart/u_uart_tx/reg2_b7  (
    .clk(vga_clk_pad),
    .mi({\u_uart/u_uart_tx/n1 [15],\u_uart/u_uart_tx/n1 [7]}),
    .sr(\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .q({\u_uart/u_uart_tx/clk_cnt [15],\u_uart/u_uart_tx/clk_cnt [7]}));  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~C*~B*~A)"),
    //.LUTF1("(~D*~C*~B*~A)"),
    //.LUTG0("(D*~C*~B*~A)"),
    //.LUTG1("(~D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000100000000),
    .INIT_LUTF1(16'b0000000000000001),
    .INIT_LUTG0(16'b0000000100000000),
    .INIT_LUTG1(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_tx/reg2_b16|u_uart/u_uart_tx/reg2_b27  (
    .a({\u_uart/u_uart_tx/clk_cnt [16],\u_uart/u_uart_tx/clk_cnt [27]}),
    .b({\u_uart/u_uart_tx/clk_cnt [17],\u_uart/u_uart_tx/clk_cnt [28]}),
    .c({\u_uart/u_uart_tx/clk_cnt [18],\u_uart/u_uart_tx/clk_cnt [29]}),
    .clk(vga_clk_pad),
    .d({\u_uart/u_uart_tx/clk_cnt [19],\u_uart/u_uart_tx/clk_cnt [3]}),
    .mi({\u_uart/u_uart_tx/n1 [16],\u_uart/u_uart_tx/n1 [27]}),
    .sr(\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .f({_al_u767_o,_al_u759_o}),
    .q({\u_uart/u_uart_tx/clk_cnt [16],\u_uart/u_uart_tx/clk_cnt [27]}));  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_tx/reg2_b17|u_uart/u_uart_tx/reg2_b5  (
    .clk(vga_clk_pad),
    .mi({\u_uart/u_uart_tx/n1 [17],\u_uart/u_uart_tx/n1 [5]}),
    .sr(\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .q({\u_uart/u_uart_tx/clk_cnt [17],\u_uart/u_uart_tx/clk_cnt [5]}));  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_tx/reg2_b18|u_uart/u_uart_tx/reg2_b4  (
    .clk(vga_clk_pad),
    .mi({\u_uart/u_uart_tx/n1 [18],\u_uart/u_uart_tx/n1 [4]}),
    .sr(\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .q({\u_uart/u_uart_tx/clk_cnt [18],\u_uart/u_uart_tx/clk_cnt [4]}));  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_tx/reg2_b19|u_uart/u_uart_tx/reg2_b31  (
    .clk(vga_clk_pad),
    .mi({\u_uart/u_uart_tx/n1 [19],\u_uart/u_uart_tx/n1 [31]}),
    .sr(\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .q({\u_uart/u_uart_tx/clk_cnt [19],\u_uart/u_uart_tx/clk_cnt [31]}));  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_tx/reg2_b20|u_uart/u_uart_tx/reg2_b3  (
    .clk(vga_clk_pad),
    .mi({\u_uart/u_uart_tx/n1 [20],\u_uart/u_uart_tx/n1 [3]}),
    .sr(\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .q({\u_uart/u_uart_tx/clk_cnt [20],\u_uart/u_uart_tx/clk_cnt [3]}));  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_tx/reg2_b21|u_uart/u_uart_tx/reg2_b29  (
    .clk(vga_clk_pad),
    .mi({\u_uart/u_uart_tx/n1 [21],\u_uart/u_uart_tx/n1 [29]}),
    .sr(\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .q({\u_uart/u_uart_tx/clk_cnt [21],\u_uart/u_uart_tx/clk_cnt [29]}));  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_tx/reg2_b22|u_uart/u_uart_tx/reg2_b28  (
    .clk(vga_clk_pad),
    .mi({\u_uart/u_uart_tx/n1 [22],\u_uart/u_uart_tx/n1 [28]}),
    .sr(\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .q({\u_uart/u_uart_tx/clk_cnt [22],\u_uart/u_uart_tx/clk_cnt [28]}));  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_tx/reg2_b24|u_uart/u_uart_tx/reg2_b26  (
    .clk(vga_clk_pad),
    .mi({\u_uart/u_uart_tx/n1 [24],\u_uart/u_uart_tx/n1 [26]}),
    .sr(\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .q({\u_uart/u_uart_tx/clk_cnt [24],\u_uart/u_uart_tx/clk_cnt [26]}));  // sources/rtl/uart/uart_tx.v(59)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_tx/reg2_b25  (
    .clk(vga_clk_pad),
    .mi({open_n11395,\u_uart/u_uart_tx/n1 [25]}),
    .sr(\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .q({open_n11401,\u_uart/u_uart_tx/clk_cnt [25]}));  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/uart_tx.v(59)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*~B*~A)"),
    //.LUT1("(~D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000000001),
    .INIT_LUT1(16'b0000000000000001),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_uart_tx/reg2_b2|u_uart/u_uart_tx/reg2_b23  (
    .a({\u_uart/u_uart_tx/clk_cnt [2],\u_uart/u_uart_tx/clk_cnt [23]}),
    .b({\u_uart/u_uart_tx/clk_cnt [20],\u_uart/u_uart_tx/clk_cnt [24]}),
    .c({\u_uart/u_uart_tx/clk_cnt [21],\u_uart/u_uart_tx/clk_cnt [25]}),
    .clk(vga_clk_pad),
    .d({\u_uart/u_uart_tx/clk_cnt [22],\u_uart/u_uart_tx/clk_cnt [26]}),
    .mi({\u_uart/u_uart_tx/n1 [2],\u_uart/u_uart_tx/n1 [23]}),
    .sr(\u_uart/u_uart_tx/mux1_b0_sel_is_1_o ),
    .f({_al_u766_o,_al_u760_o}),
    .q({\u_uart/u_uart_tx/clk_cnt [2],\u_uart/u_uart_tx/clk_cnt [23]}));  // sources/rtl/uart/uart_tx.v(59)
  // sources/rtl/uart/ubus.v(207)
  // sources/rtl/uart/uart_tx.v(108)
  EG_PHY_LSLICE #(
    //.LUTF0("(~A*~(B*~(D*C)))"),
    //.LUTF1("~(~A*~(~D*~C*~B))"),
    //.LUTG0("(~A*~(B*~(D*C)))"),
    //.LUTG1("~(~A*~(~D*~C*~B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0101000100010001),
    .INIT_LUTF1(16'b1010101010101011),
    .INIT_LUTG0(16'b0101000100010001),
    .INIT_LUTG1(16'b1010101010101011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_uart_tx/tx_reg|u_uart/u_ubus/reg12_b5  (
    .a({_al_u464_o,_al_u486_o}),
    .b({_al_u467_o,_al_u487_o}),
    .c({_al_u469_o,_al_u481_o}),
    .clk(vga_clk_pad),
    .d({\u_uart/u_uart_tx/cnt [3],\u_uart/u_ubus/tx_buffer [13]}),
    .q({tx_pad,\u_uart/tx_data [5]}));  // sources/rtl/uart/ubus.v(207)
  // sources/rtl/uart/ubus.v(124)
  // sources/rtl/uart/ubus.v(118)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(D*~C*B*A)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(D*~C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b0000100000000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b0000100000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/frame_head_flag0_reg|u_uart/u_ubus/frame_head_flag_reg  (
    .a({_al_u653_o,open_n11439}),
    .b({_al_u654_o,\u_uart/u_ubus/frame_head_flag0 }),
    .c({\u_uart/u_ubus/shift_reg2 [0],\u_uart/u_ubus/frame_head_flag1 }),
    .clk(vga_clk_pad),
    .d({\u_uart/u_ubus/shift_reg2 [1],_al_u569_o}),
    .q({\u_uart/u_ubus/frame_head_flag0 ,\u_uart/u_ubus/frame_head_flag }));  // sources/rtl/uart/ubus.v(124)
  // sources/rtl/uart/ubus.v(118)
  // sources/rtl/uart/ubus.v(118)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTF1("(~D*~C*B*A)"),
    //.LUTG0("(D*C*B*A)"),
    //.LUTG1("(~D*~C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b0000000000001000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b0000000000001000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/frame_head_flag2_reg|u_uart/u_ubus/frame_head_flag3_reg  (
    .a({_al_u659_o,_al_u662_o}),
    .b({_al_u660_o,_al_u663_o}),
    .c({\u_uart/u_ubus/shift_reg4 [0],\u_uart/u_ubus/shift_reg5 [0]}),
    .clk(vga_clk_pad),
    .d({\u_uart/u_ubus/shift_reg4 [1],\u_uart/u_ubus/shift_reg5 [1]}),
    .q({\u_uart/u_ubus/frame_head_flag2 ,\u_uart/u_ubus/frame_head_flag3 }));  // sources/rtl/uart/ubus.v(118)
  // sources/rtl/uart/ubus.v(207)
  // sources/rtl/uart/ubus.v(118)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0000000010000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/frame_head_flag5_reg|u_uart/u_ubus/reg12_b0  (
    .a({_al_u668_o,open_n11486}),
    .b({_al_u669_o,_al_u496_o}),
    .c({\u_uart/u_ubus/shift_reg7 [0],_al_u497_o}),
    .clk(vga_clk_pad),
    .d({\u_uart/u_ubus/shift_reg7 [1],_al_u495_o}),
    .q({\u_uart/u_ubus/frame_head_flag5 ,\u_uart/tx_data [0]}));  // sources/rtl/uart/ubus.v(207)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg0_b0|u_uart/u_ubus/reg1_b0  (
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_ubus/shift_reg0 [0],\u_uart/u_ubus/shift_reg1 [0]}),
    .q({\u_uart/u_ubus/shift_reg1 [0],\u_uart/u_ubus/shift_reg2 [0]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg0_b1|u_uart/u_ubus/reg1_b1  (
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_ubus/shift_reg0 [1],\u_uart/u_ubus/shift_reg1 [1]}),
    .q({\u_uart/u_ubus/shift_reg1 [1],\u_uart/u_ubus/shift_reg2 [1]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg0_b3|u_uart/u_ubus/reg1_b3  (
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_ubus/shift_reg0 [3],\u_uart/u_ubus/shift_reg1 [3]}),
    .q({\u_uart/u_ubus/shift_reg1 [3],\u_uart/u_ubus/shift_reg2 [3]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg0_b4|u_uart/u_ubus/reg1_b4  (
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_ubus/shift_reg0 [4],\u_uart/u_ubus/shift_reg1 [4]}),
    .q({\u_uart/u_ubus/shift_reg1 [4],\u_uart/u_ubus/shift_reg2 [4]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg0_b5|u_uart/u_ubus/reg1_b5  (
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_ubus/shift_reg0 [5],\u_uart/u_ubus/shift_reg1 [5]}),
    .q({\u_uart/u_ubus/shift_reg1 [5],\u_uart/u_ubus/shift_reg2 [5]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg0_b7|u_uart/u_ubus/reg1_b7  (
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_ubus/shift_reg0 [7],\u_uart/u_ubus/shift_reg1 [7]}),
    .q({\u_uart/u_ubus/shift_reg1 [7],\u_uart/u_ubus/shift_reg2 [7]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(170)
  // sources/rtl/uart/ubus.v(170)
  EG_PHY_LSLICE #(
    //.LUTF0("(C@(B*D))"),
    //.LUTF1("(C@D)"),
    //.LUTG0("(C@(B*D))"),
    //.LUTG1("(C@D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011110011110000),
    .INIT_LUTF1(16'b0000111111110000),
    .INIT_LUTG0(16'b0011110011110000),
    .INIT_LUTG1(16'b0000111111110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart/u_ubus/reg10_b1|u_uart/u_ubus/reg10_b2  (
    .b({open_n11664,\u_uart/u_ubus/tx_ready_cnt [1]}),
    .c({\u_uart/u_ubus/tx_ready_cnt [1],\u_uart/u_ubus/tx_ready_cnt [2]}),
    .clk(vga_clk_pad),
    .d({\u_uart/u_ubus/tx_ready_cnt [0],\u_uart/u_ubus/tx_ready_cnt [0]}),
    .sr(\u_uart/tx_ready ),
    .q({\u_uart/u_ubus/tx_ready_cnt [1],\u_uart/u_ubus/tx_ready_cnt [2]}));  // sources/rtl/uart/ubus.v(170)
  EG_PHY_MSLICE #(
    //.MACRO("u_uart/u_ubus/reg11_b0|u_uart/u_ubus/add1/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_uart/u_ubus/reg11_b0|u_uart/u_ubus/add1/ucin  (
    .a({\u_uart/u_ubus/send_cnt [0],1'b0}),
    .b({1'b1,open_n11687}),
    .ce(\u_uart/u_ubus/n42 ),
    .clk(vga_clk_pad),
    .sr(\u_uart/u_ubus/send_finish ),
    .fco(\u_uart/u_ubus/add1/c1 ),
    .q({\u_uart/u_ubus/send_cnt [0],open_n11708}));
  EG_PHY_MSLICE #(
    //.MACRO("u_uart/u_ubus/reg11_b0|u_uart/u_ubus/add1/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_uart/u_ubus/reg11_b2|u_uart/u_ubus/reg11_b1  (
    .a(\u_uart/u_ubus/send_cnt [2:1]),
    .b(2'b00),
    .ce(\u_uart/u_ubus/n42 ),
    .clk(vga_clk_pad),
    .fci(\u_uart/u_ubus/add1/c1 ),
    .sr(\u_uart/u_ubus/send_finish ),
    .fco(\u_uart/u_ubus/add1/c3 ),
    .q(\u_uart/u_ubus/send_cnt [2:1]));
  EG_PHY_MSLICE #(
    //.MACRO("u_uart/u_ubus/reg11_b0|u_uart/u_ubus/add1/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_uart/u_ubus/reg11_b3_al_u1105  (
    .a({open_n11728,\u_uart/u_ubus/send_cnt [3]}),
    .b({open_n11729,1'b0}),
    .ce(\u_uart/u_ubus/n42 ),
    .clk(vga_clk_pad),
    .fci(\u_uart/u_ubus/add1/c3 ),
    .sr(\u_uart/u_ubus/send_finish ),
    .q({open_n11750,\u_uart/u_ubus/send_cnt [3]}));
  // sources/rtl/uart/ubus.v(207)
  // sources/rtl/uart/ubus.v(207)
  EG_PHY_MSLICE #(
    //.LUT0("(~(A)*~(B)*~(C)*~(D)+~(A)*~(B)*C*~(D)+~(A)*~(B)*~(C)*D+A*~(B)*~(C)*D+~(A)*~(B)*C*D+~(A)*B*C*D)"),
    //.LUT1("(~A*~(B*~(D*C)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0101001100010001),
    .INIT_LUT1(16'b0101000100010001),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg12_b3|u_uart/u_ubus/reg12_b2  (
    .a({_al_u479_o,_al_u475_o}),
    .b({_al_u480_o,_al_u477_o}),
    .c({_al_u481_o,_al_u474_o}),
    .clk(vga_clk_pad),
    .d({\u_uart/u_ubus/tx_buffer [11],\u_uart/tx_data [2]}),
    .q(\u_uart/tx_data [3:2]));  // sources/rtl/uart/ubus.v(207)
  // sources/rtl/uart/ubus.v(207)
  // sources/rtl/uart/ubus.v(207)
  EG_PHY_LSLICE #(
    //.LUTF0("(~A*~(B*~(D*C)))"),
    //.LUTF1("(~A*~(B*~(D*C)))"),
    //.LUTG0("(~A*~(B*~(D*C)))"),
    //.LUTG1("(~A*~(B*~(D*C)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0101000100010001),
    .INIT_LUTF1(16'b0101000100010001),
    .INIT_LUTG0(16'b0101000100010001),
    .INIT_LUTG1(16'b0101000100010001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg12_b4|u_uart/u_ubus/reg12_b7  (
    .a({_al_u483_o,_al_u492_o}),
    .b({_al_u484_o,_al_u493_o}),
    .c({_al_u481_o,_al_u481_o}),
    .clk(vga_clk_pad),
    .d({\u_uart/u_ubus/tx_buffer [12],\u_uart/u_ubus/tx_buffer [15]}),
    .q({\u_uart/tx_data [4],\u_uart/tx_data [7]}));  // sources/rtl/uart/ubus.v(207)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg13_b0|u_uart/u_ubus/reg6_b7  (
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .mi({\u_uart/rx_data [0],\u_uart/u_ubus/shift_reg6 [7]}),
    .q({\u_uart/u_ubus/shift_reg0 [0],\u_uart/u_ubus/shift_reg7 [7]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg13_b1|u_uart/u_ubus/reg6_b5  (
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .mi({\u_uart/rx_data [1],\u_uart/u_ubus/shift_reg6 [5]}),
    .q({\u_uart/u_ubus/shift_reg0 [1],\u_uart/u_ubus/shift_reg7 [5]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg13_b2|u_uart/u_ubus/reg0_b2  (
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .mi({\u_uart/rx_data [2],\u_uart/u_ubus/shift_reg0 [2]}),
    .q({\u_uart/u_ubus/shift_reg0 [2],\u_uart/u_ubus/shift_reg1 [2]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg13_b3|u_uart/u_ubus/reg6_b4  (
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .mi({\u_uart/rx_data [3],\u_uart/u_ubus/shift_reg6 [4]}),
    .q({\u_uart/u_ubus/shift_reg0 [3],\u_uart/u_ubus/shift_reg7 [4]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg13_b4|u_uart/u_ubus/reg6_b3  (
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .mi({\u_uart/rx_data [4],\u_uart/u_ubus/shift_reg6 [3]}),
    .q({\u_uart/u_ubus/shift_reg0 [4],\u_uart/u_ubus/shift_reg7 [3]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg13_b5|u_uart/u_ubus/reg6_b1  (
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .mi({\u_uart/rx_data [5],\u_uart/u_ubus/shift_reg6 [1]}),
    .q({\u_uart/u_ubus/shift_reg0 [5],\u_uart/u_ubus/shift_reg7 [1]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg13_b6|u_uart/u_ubus/reg0_b6  (
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .mi({\u_uart/rx_data [6],\u_uart/u_ubus/shift_reg0 [6]}),
    .q({\u_uart/u_ubus/shift_reg0 [6],\u_uart/u_ubus/shift_reg1 [6]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg13_b7|u_uart/u_ubus/reg6_b0  (
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .mi({\u_uart/rx_data [7],\u_uart/u_ubus/shift_reg6 [0]}),
    .q({\u_uart/u_ubus/shift_reg0 [7],\u_uart/u_ubus/shift_reg7 [0]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*A)"),
    //.LUTF1("(~D*~C*~B*A)"),
    //.LUTG0("(~D*~C*~B*A)"),
    //.LUTG1("(~D*~C*~B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000010),
    .INIT_LUTF1(16'b0000000000000010),
    .INIT_LUTG0(16'b0000000000000010),
    .INIT_LUTG1(16'b0000000000000010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg1_b2|u_uart/u_ubus/reg2_b2  (
    .a({\u_uart/u_ubus/shift_reg2 [2],\u_uart/u_ubus/shift_reg3 [2]}),
    .b({\u_uart/u_ubus/shift_reg2 [3],\u_uart/u_ubus/shift_reg3 [3]}),
    .c({\u_uart/u_ubus/shift_reg2 [4],\u_uart/u_ubus/shift_reg3 [4]}),
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .d({\u_uart/u_ubus/shift_reg2 [5],\u_uart/u_ubus/shift_reg3 [5]}),
    .mi({\u_uart/u_ubus/shift_reg1 [2],\u_uart/u_ubus/shift_reg2 [2]}),
    .f({_al_u654_o,_al_u657_o}),
    .q({\u_uart/u_ubus/shift_reg2 [2],\u_uart/u_ubus/shift_reg3 [2]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*D)"),
    //.LUTF1("(C*~B*D)"),
    //.LUTG0("(C*~B*D)"),
    //.LUTG1("(C*~B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011000000000000),
    .INIT_LUTF1(16'b0011000000000000),
    .INIT_LUTG0(16'b0011000000000000),
    .INIT_LUTG1(16'b0011000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg1_b6|u_uart/u_ubus/reg2_b6  (
    .b({\u_uart/u_ubus/shift_reg2 [7],\u_uart/u_ubus/shift_reg3 [7]}),
    .c({\u_uart/u_ubus/rx_en_d ,\u_uart/u_ubus/rx_en_d }),
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .d({\u_uart/u_ubus/shift_reg2 [6],\u_uart/u_ubus/shift_reg3 [6]}),
    .mi({\u_uart/u_ubus/shift_reg1 [6],\u_uart/u_ubus/shift_reg2 [6]}),
    .f({_al_u653_o,_al_u656_o}),
    .q({\u_uart/u_ubus/shift_reg2 [6],\u_uart/u_ubus/shift_reg3 [6]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg2_b0|u_uart/u_ubus/reg3_b0  (
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_ubus/shift_reg2 [0],\u_uart/u_ubus/shift_reg3 [0]}),
    .q({\u_uart/u_ubus/shift_reg3 [0],\u_uart/u_ubus/shift_reg4 [0]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg2_b1|u_uart/u_ubus/reg3_b1  (
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_ubus/shift_reg2 [1],\u_uart/u_ubus/shift_reg3 [1]}),
    .q({\u_uart/u_ubus/shift_reg3 [1],\u_uart/u_ubus/shift_reg4 [1]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg2_b3|u_uart/u_ubus/reg3_b3  (
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_ubus/shift_reg2 [3],\u_uart/u_ubus/shift_reg3 [3]}),
    .q({\u_uart/u_ubus/shift_reg3 [3],\u_uart/u_ubus/shift_reg4 [3]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg2_b4|u_uart/u_ubus/reg3_b4  (
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_ubus/shift_reg2 [4],\u_uart/u_ubus/shift_reg3 [4]}),
    .q({\u_uart/u_ubus/shift_reg3 [4],\u_uart/u_ubus/shift_reg4 [4]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg2_b5|u_uart/u_ubus/reg3_b5  (
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_ubus/shift_reg2 [5],\u_uart/u_ubus/shift_reg3 [5]}),
    .q({\u_uart/u_ubus/shift_reg3 [5],\u_uart/u_ubus/shift_reg4 [5]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg2_b7|u_uart/u_ubus/reg3_b7  (
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_ubus/shift_reg2 [7],\u_uart/u_ubus/shift_reg3 [7]}),
    .q({\u_uart/u_ubus/shift_reg3 [7],\u_uart/u_ubus/shift_reg4 [7]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*~A)"),
    //.LUTF1("(~D*~C*~B*A)"),
    //.LUTG0("(~D*~C*~B*~A)"),
    //.LUTG1("(~D*~C*~B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000001),
    .INIT_LUTF1(16'b0000000000000010),
    .INIT_LUTG0(16'b0000000000000001),
    .INIT_LUTG1(16'b0000000000000010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg3_b2|u_uart/u_ubus/reg4_b2  (
    .a({\u_uart/u_ubus/shift_reg4 [2],\u_uart/u_ubus/shift_reg5 [2]}),
    .b({\u_uart/u_ubus/shift_reg4 [3],\u_uart/u_ubus/shift_reg5 [3]}),
    .c({\u_uart/u_ubus/shift_reg4 [4],\u_uart/u_ubus/shift_reg5 [4]}),
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .d({\u_uart/u_ubus/shift_reg4 [5],\u_uart/u_ubus/shift_reg5 [5]}),
    .mi({\u_uart/u_ubus/shift_reg3 [2],\u_uart/u_ubus/shift_reg4 [2]}),
    .f({_al_u660_o,_al_u663_o}),
    .q({\u_uart/u_ubus/shift_reg4 [2],\u_uart/u_ubus/shift_reg5 [2]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*D)"),
    //.LUTF1("(C*~B*D)"),
    //.LUTG0("(C*~B*D)"),
    //.LUTG1("(C*~B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011000000000000),
    .INIT_LUTF1(16'b0011000000000000),
    .INIT_LUTG0(16'b0011000000000000),
    .INIT_LUTG1(16'b0011000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg3_b6|u_uart/u_ubus/reg4_b6  (
    .b({\u_uart/u_ubus/shift_reg4 [7],\u_uart/u_ubus/shift_reg5 [7]}),
    .c({\u_uart/u_ubus/rx_en_d ,\u_uart/u_ubus/rx_en_d }),
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .d({\u_uart/u_ubus/shift_reg4 [6],\u_uart/u_ubus/shift_reg5 [6]}),
    .mi({\u_uart/u_ubus/shift_reg3 [6],\u_uart/u_ubus/shift_reg4 [6]}),
    .f({_al_u659_o,_al_u662_o}),
    .q({\u_uart/u_ubus/shift_reg4 [6],\u_uart/u_ubus/shift_reg5 [6]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg4_b0|u_uart/u_ubus/reg5_b0  (
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_ubus/shift_reg4 [0],\u_uart/u_ubus/shift_reg5 [0]}),
    .q({\u_uart/u_ubus/shift_reg5 [0],\u_uart/u_ubus/shift_reg6 [0]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg4_b1|u_uart/u_ubus/reg5_b1  (
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_ubus/shift_reg4 [1],\u_uart/u_ubus/shift_reg5 [1]}),
    .q({\u_uart/u_ubus/shift_reg5 [1],\u_uart/u_ubus/shift_reg6 [1]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg4_b3|u_uart/u_ubus/reg5_b3  (
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_ubus/shift_reg4 [3],\u_uart/u_ubus/shift_reg5 [3]}),
    .q({\u_uart/u_ubus/shift_reg5 [3],\u_uart/u_ubus/shift_reg6 [3]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg4_b4|u_uart/u_ubus/reg5_b4  (
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_ubus/shift_reg4 [4],\u_uart/u_ubus/shift_reg5 [4]}),
    .q({\u_uart/u_ubus/shift_reg5 [4],\u_uart/u_ubus/shift_reg6 [4]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg4_b5|u_uart/u_ubus/reg5_b5  (
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_ubus/shift_reg4 [5],\u_uart/u_ubus/shift_reg5 [5]}),
    .q({\u_uart/u_ubus/shift_reg5 [5],\u_uart/u_ubus/shift_reg6 [5]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg4_b7|u_uart/u_ubus/reg5_b7  (
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_ubus/shift_reg4 [7],\u_uart/u_ubus/shift_reg5 [7]}),
    .q({\u_uart/u_ubus/shift_reg5 [7],\u_uart/u_ubus/shift_reg6 [7]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*~A)"),
    //.LUTF1("(~D*~C*~B*~A)"),
    //.LUTG0("(~D*~C*~B*~A)"),
    //.LUTG1("(~D*~C*~B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000001),
    .INIT_LUTF1(16'b0000000000000001),
    .INIT_LUTG0(16'b0000000000000001),
    .INIT_LUTG1(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg6_b2|u_uart/u_ubus/reg5_b2  (
    .a({\u_uart/u_ubus/shift_reg7 [2],\u_uart/u_ubus/shift_reg6 [2]}),
    .b({\u_uart/u_ubus/shift_reg7 [3],\u_uart/u_ubus/shift_reg6 [3]}),
    .c({\u_uart/u_ubus/shift_reg7 [4],\u_uart/u_ubus/shift_reg6 [4]}),
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .d({\u_uart/u_ubus/shift_reg7 [5],\u_uart/u_ubus/shift_reg6 [5]}),
    .mi({\u_uart/u_ubus/shift_reg6 [2],\u_uart/u_ubus/shift_reg5 [2]}),
    .f({_al_u669_o,_al_u666_o}),
    .q({\u_uart/u_ubus/shift_reg7 [2],\u_uart/u_ubus/shift_reg6 [2]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(101)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*D)"),
    //.LUTF1("(C*~B*D)"),
    //.LUTG0("(C*~B*D)"),
    //.LUTG1("(C*~B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011000000000000),
    .INIT_LUTF1(16'b0011000000000000),
    .INIT_LUTG0(16'b0011000000000000),
    .INIT_LUTG1(16'b0011000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg6_b6|u_uart/u_ubus/reg5_b6  (
    .b({\u_uart/u_ubus/shift_reg7 [7],\u_uart/u_ubus/shift_reg6 [7]}),
    .c({\u_uart/u_ubus/rx_en_d ,\u_uart/u_ubus/rx_en_d }),
    .ce(\u_uart/rx_en ),
    .clk(vga_clk_pad),
    .d({\u_uart/u_ubus/shift_reg7 [6],\u_uart/u_ubus/shift_reg6 [6]}),
    .mi({\u_uart/u_ubus/shift_reg6 [6],\u_uart/u_ubus/shift_reg5 [6]}),
    .f({_al_u668_o,_al_u665_o}),
    .q({\u_uart/u_ubus/shift_reg7 [6],\u_uart/u_ubus/shift_reg6 [6]}));  // sources/rtl/uart/ubus.v(101)
  // sources/rtl/uart/ubus.v(135)
  // sources/rtl/uart/ubus.v(135)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*D)"),
    //.LUT1("(~C*~B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000001100000000),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg7_b3|u_uart/u_ubus/reg7_b0  (
    .b({recv_cmd[2],recv_cmd[0]}),
    .c({recv_cmd[3],recv_cmd[1]}),
    .ce(\u_uart/u_ubus/frame_head_flag ),
    .clk(vga_clk_pad),
    .d({_al_u471_o,_al_u472_o}),
    .mi({\u_uart/u_ubus/shift_reg1 [3],\u_uart/u_ubus/shift_reg1 [0]}),
    .f({_al_u472_o,\u_cpu/u_debug/free_run_cmd }),
    .q({recv_cmd[3],recv_cmd[0]}));  // sources/rtl/uart/ubus.v(135)
  // sources/rtl/uart/ubus.v(135)
  // sources/rtl/uart/ubus.v(135)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*B*A)"),
    //.LUTF1("(~D*~C*~B*~A)"),
    //.LUTG0("(~D*C*B*A)"),
    //.LUTG1("(~D*~C*~B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000010000000),
    .INIT_LUTF1(16'b0000000000000001),
    .INIT_LUTG0(16'b0000000010000000),
    .INIT_LUTG1(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg7_b4|u_uart/u_ubus/reg7_b2  (
    .a({recv_cmd[4],_al_u471_o}),
    .b({recv_cmd[5],recv_en}),
    .c({recv_cmd[6],recv_cmd[2]}),
    .ce(\u_uart/u_ubus/frame_head_flag ),
    .clk(vga_clk_pad),
    .d({recv_cmd[7],recv_cmd[3]}),
    .mi({\u_uart/u_ubus/shift_reg1 [4],\u_uart/u_ubus/shift_reg1 [2]}),
    .f({_al_u471_o,_al_u673_o}),
    .q({recv_cmd[4],recv_cmd[2]}));  // sources/rtl/uart/ubus.v(135)
  // sources/rtl/uart/ubus.v(135)
  // sources/rtl/uart/ubus.v(135)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg7_b5|u_uart/u_ubus/reg7_b1  (
    .ce(\u_uart/u_ubus/frame_head_flag ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_ubus/shift_reg1 [5],\u_uart/u_ubus/shift_reg1 [1]}),
    .q({recv_cmd[5],recv_cmd[1]}));  // sources/rtl/uart/ubus.v(135)
  // sources/rtl/uart/ubus.v(135)
  // sources/rtl/uart/ubus.v(135)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg7_b6|u_uart/u_ubus/reg8_b7  (
    .ce(\u_uart/u_ubus/frame_head_flag ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_ubus/shift_reg1 [6],\u_uart/u_ubus/shift_reg0 [7]}),
    .q({recv_cmd[6],recv_data[7]}));  // sources/rtl/uart/ubus.v(135)
  // sources/rtl/uart/ubus.v(135)
  // sources/rtl/uart/ubus.v(135)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg7_b7|u_uart/u_ubus/reg8_b6  (
    .ce(\u_uart/u_ubus/frame_head_flag ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_ubus/shift_reg1 [7],\u_uart/u_ubus/shift_reg0 [6]}),
    .q({recv_cmd[7],recv_data[6]}));  // sources/rtl/uart/ubus.v(135)
  // sources/rtl/uart/ubus.v(135)
  // sources/rtl/uart/ubus.v(135)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg8_b0|u_uart/u_ubus/reg8_b5  (
    .ce(\u_uart/u_ubus/frame_head_flag ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_ubus/shift_reg0 [0],\u_uart/u_ubus/shift_reg0 [5]}),
    .q({recv_data[0],recv_data[5]}));  // sources/rtl/uart/ubus.v(135)
  // sources/rtl/uart/ubus.v(135)
  // sources/rtl/uart/ubus.v(135)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg8_b1|u_uart/u_ubus/reg8_b4  (
    .ce(\u_uart/u_ubus/frame_head_flag ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_ubus/shift_reg0 [1],\u_uart/u_ubus/shift_reg0 [4]}),
    .q({recv_data[1],recv_data[4]}));  // sources/rtl/uart/ubus.v(135)
  // sources/rtl/uart/ubus.v(135)
  // sources/rtl/uart/ubus.v(135)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg8_b2|u_uart/u_ubus/reg8_b3  (
    .ce(\u_uart/u_ubus/frame_head_flag ),
    .clk(vga_clk_pad),
    .mi({\u_uart/u_ubus/shift_reg0 [2],\u_uart/u_ubus/shift_reg0 [3]}),
    .q({recv_data[2],recv_data[3]}));  // sources/rtl/uart/ubus.v(135)
  // sources/rtl/uart/ubus.v(143)
  // sources/rtl/uart/ubus.v(143)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~(A*~(~D*B)))"),
    //.LUTF1("(C*~(~D*B*A))"),
    //.LUTG0("(~C*~(A*~(~D*B)))"),
    //.LUTG1("(C*~(~D*B*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000010100001101),
    .INIT_LUTF1(16'b1111000001110000),
    .INIT_LUTG0(16'b0000010100001101),
    .INIT_LUTG1(16'b1111000001110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg9_b10|u_uart/u_ubus/reg9_b9  (
    .a({\u_uart/u_ubus/send_cnt [0],\u_uart/u_ubus/send_cnt [1]}),
    .b({\u_uart/u_ubus/send_cnt [1],\u_uart/u_ubus/send_cnt [2]}),
    .c({\u_uart/u_ubus/send_cnt [2],\u_uart/u_ubus/send_cnt [3]}),
    .ce(send_en),
    .clk(vga_clk_pad),
    .d(\u_uart/u_ubus/tx_buffer [10:9]),
    .mi(send_cmd[2:1]),
    .f({_al_u476_o,_al_u501_o}),
    .q(\u_uart/u_ubus/tx_buffer [10:9]));  // sources/rtl/uart/ubus.v(143)
  // sources/rtl/uart/ubus.v(143)
  // sources/rtl/uart/ubus.v(143)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg9_b11|u_uart/u_ubus/reg9_b6  (
    .ce(send_en),
    .clk(vga_clk_pad),
    .mi({send_cmd[3],send_data[6]}),
    .q({\u_uart/u_ubus/tx_buffer [11],\u_uart/u_ubus/tx_buffer [6]}));  // sources/rtl/uart/ubus.v(143)
  // sources/rtl/uart/ubus.v(143)
  // sources/rtl/uart/ubus.v(143)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg9_b12|u_uart/u_ubus/reg9_b15  (
    .ce(send_en),
    .clk(vga_clk_pad),
    .mi({send_cmd[4],send_cmd[7]}),
    .q({\u_uart/u_ubus/tx_buffer [12],\u_uart/u_ubus/tx_buffer [15]}));  // sources/rtl/uart/ubus.v(143)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg9_b13  (
    .ce(send_en),
    .clk(vga_clk_pad),
    .mi({open_n12702,send_cmd[5]}),
    .q({open_n12720,\u_uart/u_ubus/tx_buffer [13]}));  // sources/rtl/uart/ubus.v(143)
  // sources/rtl/uart/ubus.v(143)
  // sources/rtl/uart/ubus.v(143)
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000010010001100),
    .INIT_LUTF1(16'b0000010010001100),
    .INIT_LUTG0(16'b0000010010001100),
    .INIT_LUTG1(16'b0000010010001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/reg9_b1|u_uart/u_ubus/reg9_b7  (
    .a({_al_u474_o,_al_u474_o}),
    .b({\u_uart/u_ubus/send_cnt [3],\u_uart/u_ubus/send_cnt [3]}),
    .c({\u_uart/tx_data [1],\u_uart/tx_data [7]}),
    .ce(send_en),
    .clk(vga_clk_pad),
    .d({\u_uart/u_ubus/tx_buffer [1],\u_uart/u_ubus/tx_buffer [7]}),
    .mi({send_data[1],send_data[7]}),
    .f({_al_u499_o,_al_u492_o}),
    .q({\u_uart/u_ubus/tx_buffer [1],\u_uart/u_ubus/tx_buffer [7]}));  // sources/rtl/uart/ubus.v(143)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/rx_en_d_reg  (
    .clk(vga_clk_pad),
    .mi({open_n12758,\u_uart/rx_en }),
    .q({open_n12765,\u_uart/u_ubus/rx_en_d }));  // sources/rtl/uart/ubus.v(107)
  // sources/rtl/uart/ubus.v(176)
  // sources/rtl/uart/ubus.v(183)
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart/u_ubus/send_flag_reg|u_uart/u_ubus/tx_ready_flag_reg  (
    .b({open_n12768,\u_uart/u_ubus/tx_ready_cnt [1]}),
    .c({\u_uart/u_ubus/tx_ready_flag ,\u_uart/u_ubus/tx_ready_cnt [2]}),
    .clk(vga_clk_pad),
    .d({\u_uart/u_ubus/send_start ,\u_uart/u_ubus/tx_ready_cnt [0]}),
    .f({\u_uart/u_ubus/n42 ,open_n12783}),
    .q({\u_uart/u_ubus/send_flag ,\u_uart/u_ubus/tx_ready_flag }));  // sources/rtl/uart/ubus.v(176)
  // sources/rtl/uart/ubus.v(161)
  // sources/rtl/uart/ubus.v(216)
  EG_PHY_MSLICE #(
    //.LUT0("~(~C*~(D*B*A))"),
    //.LUT1("~(~B*~(C*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111100011110000),
    .INIT_LUT1(16'b1111110011001100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_uart/u_ubus/send_ready_reg|u_uart/u_ubus/send_finish_reg  (
    .a({open_n12787,_al_u474_o}),
    .b({send_ready,\u_uart/u_ubus/send_cnt [3]}),
    .c({\u_uart/u_ubus/tx_ready_flag ,\u_uart/u_ubus/send_finish }),
    .clk(vga_clk_pad),
    .d({\u_uart/u_ubus/send_finish ,\u_uart/tx_en }),
    .sr(send_en),
    .q({send_ready,\u_uart/u_ubus/send_finish }));  // sources/rtl/uart/ubus.v(161)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_uart/u_ubus/send_start_reg  (
    .ce(\u_uart/u_ubus/send_finish ),
    .clk(vga_clk_pad),
    .mi({open_n12817,1'b0}),
    .sr(send_en),
    .q({open_n12834,\u_uart/u_ubus/send_start }));  // sources/rtl/uart/ubus.v(152)
  EG_PHY_LSLICE #(
    //.MACRO("u_vga/add0/ucin_al_u1081"),
    //.R_POSITION("X0Y1Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_vga/add0/u11_al_u1084  (
    .a({open_n12835,\u_vga/hsyn_cnt [11]}),
    .b({open_n12836,\u_vga/hsyn_cnt [12]}),
    .c(2'b00),
    .d({open_n12839,1'b0}),
    .e({open_n12840,1'b0}),
    .fci(\u_vga/add0/c11 ),
    .f({open_n12855,\u_vga/n1 [11]}),
    .fx({open_n12857,\u_vga/n1 [12]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_vga/add0/ucin_al_u1081"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_vga/add0/u3_al_u1082  (
    .a({\u_vga/hsyn_cnt [5],\u_vga/hsyn_cnt [3]}),
    .b({\u_vga/hsyn_cnt [6],\u_vga/hsyn_cnt [4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_vga/add0/c3 ),
    .f({\u_vga/n1 [5],\u_vga/n1 [3]}),
    .fco(\u_vga/add0/c7 ),
    .fx({\u_vga/n1 [6],\u_vga/n1 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_vga/add0/ucin_al_u1081"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_vga/add0/u7_al_u1083  (
    .a({\u_vga/hsyn_cnt [9],\u_vga/hsyn_cnt [7]}),
    .b({\u_vga/hsyn_cnt [10],\u_vga/hsyn_cnt [8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_vga/add0/c7 ),
    .f({\u_vga/n1 [9],\u_vga/n1 [7]}),
    .fco(\u_vga/add0/c11 ),
    .fx({\u_vga/n1 [10],\u_vga/n1 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_vga/add0/ucin_al_u1081"),
    //.R_POSITION("X0Y0Z0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_vga/add0/ucin_al_u1081  (
    .a({\u_vga/hsyn_cnt [1],1'b0}),
    .b({\u_vga/hsyn_cnt [2],\u_vga/hsyn_cnt [0]}),
    .c(2'b00),
    .clk(vga_clk_pad),
    .d(2'b01),
    .e(2'b01),
    .mi(\u_vga/hsyn_cnt [2:1]),
    .sr(\u_vga/mux4_b0_sel_is_3_o ),
    .f({\u_vga/n1 [1],open_n12909}),
    .fco(\u_vga/add0/c3 ),
    .fx({\u_vga/n1 [2],\u_vga/n1 [0]}),
    .q(axis_x[2:1]));
  EG_PHY_LSLICE #(
    //.MACRO("u_vga/add1/ucin_al_u1085"),
    //.R_POSITION("X0Y1Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_vga/add1/u11_al_u1088  (
    .a({open_n12910,\u_vga/vsyn_cnt [11]}),
    .b({open_n12911,\u_vga/vsyn_cnt [12]}),
    .c(2'b00),
    .d({open_n12914,1'b0}),
    .e({open_n12915,1'b0}),
    .fci(\u_vga/add1/c11 ),
    .f({open_n12930,\u_vga/n4 [11]}),
    .fx({open_n12932,\u_vga/n4 [12]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_vga/add1/ucin_al_u1085"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_vga/add1/u3_al_u1086  (
    .a({\u_vga/vsyn_cnt [5],\u_vga/vsyn_cnt [3]}),
    .b({\u_vga/vsyn_cnt [6],\u_vga/vsyn_cnt [4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_vga/add1/c3 ),
    .f({\u_vga/n4 [5],\u_vga/n4 [3]}),
    .fco(\u_vga/add1/c7 ),
    .fx({\u_vga/n4 [6],\u_vga/n4 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_vga/add1/ucin_al_u1085"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_vga/add1/u7_al_u1087  (
    .a({\u_vga/vsyn_cnt [9],\u_vga/vsyn_cnt [7]}),
    .b({\u_vga/vsyn_cnt [10],\u_vga/vsyn_cnt [8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_vga/add1/c7 ),
    .f({\u_vga/n4 [9],\u_vga/n4 [7]}),
    .fco(\u_vga/add1/c11 ),
    .fx({\u_vga/n4 [10],\u_vga/n4 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_vga/add1/ucin_al_u1085"),
    //.R_POSITION("X0Y0Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_vga/add1/ucin_al_u1085  (
    .a({\u_vga/vsyn_cnt [1],1'b0}),
    .b({\u_vga/vsyn_cnt [2],\u_vga/vsyn_cnt [0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({\u_vga/n4 [1],open_n12988}),
    .fco(\u_vga/add1/c3 ),
    .fx({\u_vga/n4 [2],\u_vga/n4 [0]}));
  // sources/rtl/vga/vga.v(134)
  // sources/rtl/vga/vga.v(111)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_vga/axis_en_reg|u_vga/reg2_b2  (
    .c({\u_vga/n15 ,\u_vga/n16 }),
    .clk(vga_clk_pad),
    .d({\u_vga/n14 ,\u_vga/n13 }),
    .mi({open_n12999,\u_vga/n21 [2]}),
    .sr(\u_vga/n13 ),
    .f({\u_vga/n16 ,\u_vga/mux4_b0_sel_is_3_o }),
    .q({axis_en,axis_y[2]}));  // sources/rtl/vga/vga.v(134)
  // sources/rtl/vga/vga.v(97)
  // sources/rtl/vga/vga.v(88)
  EG_PHY_MSLICE #(
    //.LUT0("(~D)"),
    //.LUT1("(~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011111111),
    .INIT_LUT1(16'b0000000011111111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vga/hsyn_reg|u_vga/vsyn_reg  (
    .clk(vga_clk_pad),
    .d({\u_vga/n7 ,\u_vga/n9 }),
    .q({hsyn,vsyn}));  // sources/rtl/vga/vga.v(97)
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt0_0|u_vga/lt0_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt0_0|u_vga/lt0_cin  (
    .a({\u_vga/hsyn_cnt [0],1'b0}),
    .b({1'b0,open_n13039}),
    .fco(\u_vga/lt0_c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt0_0|u_vga/lt0_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt0_10|u_vga/lt0_9  (
    .a(\u_vga/hsyn_cnt [10:9]),
    .b(2'b00),
    .fci(\u_vga/lt0_c9 ),
    .fco(\u_vga/lt0_c11 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt0_0|u_vga/lt0_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt0_12|u_vga/lt0_11  (
    .a(\u_vga/hsyn_cnt [12:11]),
    .b(2'b00),
    .fci(\u_vga/lt0_c11 ),
    .fco(\u_vga/lt0_c13 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt0_0|u_vga/lt0_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt0_2|u_vga/lt0_1  (
    .a(\u_vga/hsyn_cnt [2:1]),
    .b(2'b00),
    .fci(\u_vga/lt0_c1 ),
    .fco(\u_vga/lt0_c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt0_0|u_vga/lt0_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt0_4|u_vga/lt0_3  (
    .a(\u_vga/hsyn_cnt [4:3]),
    .b(2'b00),
    .fci(\u_vga/lt0_c3 ),
    .fco(\u_vga/lt0_c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt0_0|u_vga/lt0_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt0_6|u_vga/lt0_5  (
    .a(\u_vga/hsyn_cnt [6:5]),
    .b(2'b11),
    .fci(\u_vga/lt0_c5 ),
    .fco(\u_vga/lt0_c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt0_0|u_vga/lt0_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt0_8|u_vga/lt0_7  (
    .a(\u_vga/hsyn_cnt [8:7]),
    .b(2'b00),
    .fci(\u_vga/lt0_c7 ),
    .fco(\u_vga/lt0_c9 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt0_0|u_vga/lt0_cin"),
    //.R_POSITION("X0Y3Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt0_cout_al_u1106  (
    .a({open_n13209,1'b0}),
    .b({open_n13210,1'b1}),
    .fci(\u_vga/lt0_c13 ),
    .f({open_n13229,\u_vga/n7 }));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt1_0|u_vga/lt1_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt1_0|u_vga/lt1_cin  (
    .a({\u_vga/vsyn_cnt [0],1'b0}),
    .b({1'b0,open_n13235}),
    .fco(\u_vga/lt1_c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt1_0|u_vga/lt1_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt1_10|u_vga/lt1_9  (
    .a(\u_vga/vsyn_cnt [10:9]),
    .b(2'b00),
    .fci(\u_vga/lt1_c9 ),
    .fco(\u_vga/lt1_c11 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt1_0|u_vga/lt1_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt1_12|u_vga/lt1_11  (
    .a(\u_vga/vsyn_cnt [12:11]),
    .b(2'b00),
    .fci(\u_vga/lt1_c11 ),
    .fco(\u_vga/lt1_c13 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt1_0|u_vga/lt1_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt1_2|u_vga/lt1_1  (
    .a(\u_vga/vsyn_cnt [2:1]),
    .b(2'b01),
    .fci(\u_vga/lt1_c1 ),
    .fco(\u_vga/lt1_c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt1_0|u_vga/lt1_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt1_4|u_vga/lt1_3  (
    .a(\u_vga/vsyn_cnt [4:3]),
    .b(2'b00),
    .fci(\u_vga/lt1_c3 ),
    .fco(\u_vga/lt1_c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt1_0|u_vga/lt1_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt1_6|u_vga/lt1_5  (
    .a(\u_vga/vsyn_cnt [6:5]),
    .b(2'b00),
    .fci(\u_vga/lt1_c5 ),
    .fco(\u_vga/lt1_c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt1_0|u_vga/lt1_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt1_8|u_vga/lt1_7  (
    .a(\u_vga/vsyn_cnt [8:7]),
    .b(2'b00),
    .fci(\u_vga/lt1_c7 ),
    .fco(\u_vga/lt1_c9 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt1_0|u_vga/lt1_cin"),
    //.R_POSITION("X0Y3Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt1_cout_al_u1107  (
    .a({open_n13405,1'b0}),
    .b({open_n13406,1'b1}),
    .fci(\u_vga/lt1_c13 ),
    .f({open_n13425,\u_vga/n9 }));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt2_0|u_vga/lt2_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt2_0|u_vga/lt2_cin  (
    .a(2'b11),
    .b({\u_vga/vsyn_cnt [0],open_n13431}),
    .fco(\u_vga/lt2_c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt2_0|u_vga/lt2_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt2_10|u_vga/lt2_9  (
    .a(2'b00),
    .b(\u_vga/vsyn_cnt [10:9]),
    .fci(\u_vga/lt2_c9 ),
    .fco(\u_vga/lt2_c11 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt2_0|u_vga/lt2_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt2_12|u_vga/lt2_11  (
    .a(2'b00),
    .b(\u_vga/vsyn_cnt [12:11]),
    .fci(\u_vga/lt2_c11 ),
    .fco(\u_vga/lt2_c13 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt2_0|u_vga/lt2_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt2_2|u_vga/lt2_1  (
    .a(2'b01),
    .b(\u_vga/vsyn_cnt [2:1]),
    .fci(\u_vga/lt2_c1 ),
    .fco(\u_vga/lt2_c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt2_0|u_vga/lt2_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt2_4|u_vga/lt2_3  (
    .a(2'b00),
    .b(\u_vga/vsyn_cnt [4:3]),
    .fci(\u_vga/lt2_c3 ),
    .fco(\u_vga/lt2_c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt2_0|u_vga/lt2_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt2_6|u_vga/lt2_5  (
    .a(2'b01),
    .b(\u_vga/vsyn_cnt [6:5]),
    .fci(\u_vga/lt2_c5 ),
    .fco(\u_vga/lt2_c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt2_0|u_vga/lt2_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt2_8|u_vga/lt2_7  (
    .a(2'b00),
    .b(\u_vga/vsyn_cnt [8:7]),
    .fci(\u_vga/lt2_c7 ),
    .fco(\u_vga/lt2_c9 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt2_0|u_vga/lt2_cin"),
    //.R_POSITION("X0Y3Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt2_cout_al_u1108  (
    .a({open_n13601,1'b0}),
    .b({open_n13602,1'b1}),
    .fci(\u_vga/lt2_c13 ),
    .f({open_n13621,\u_vga/n11 }));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt3_0|u_vga/lt3_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt3_0|u_vga/lt3_cin  (
    .a({\u_vga/vsyn_cnt [0],1'b0}),
    .b({1'b1,open_n13627}),
    .fco(\u_vga/lt3_c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt3_0|u_vga/lt3_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt3_10|u_vga/lt3_9  (
    .a(\u_vga/vsyn_cnt [10:9]),
    .b(2'b01),
    .fci(\u_vga/lt3_c9 ),
    .fco(\u_vga/lt3_c11 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt3_0|u_vga/lt3_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt3_12|u_vga/lt3_11  (
    .a(\u_vga/vsyn_cnt [12:11]),
    .b(2'b00),
    .fci(\u_vga/lt3_c11 ),
    .fco(\u_vga/lt3_c13 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt3_0|u_vga/lt3_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt3_2|u_vga/lt3_1  (
    .a(\u_vga/vsyn_cnt [2:1]),
    .b(2'b01),
    .fci(\u_vga/lt3_c1 ),
    .fco(\u_vga/lt3_c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt3_0|u_vga/lt3_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt3_4|u_vga/lt3_3  (
    .a(\u_vga/vsyn_cnt [4:3]),
    .b(2'b00),
    .fci(\u_vga/lt3_c3 ),
    .fco(\u_vga/lt3_c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt3_0|u_vga/lt3_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt3_6|u_vga/lt3_5  (
    .a(\u_vga/vsyn_cnt [6:5]),
    .b(2'b00),
    .fci(\u_vga/lt3_c5 ),
    .fco(\u_vga/lt3_c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt3_0|u_vga/lt3_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt3_8|u_vga/lt3_7  (
    .a(\u_vga/vsyn_cnt [8:7]),
    .b(2'b00),
    .fci(\u_vga/lt3_c7 ),
    .fco(\u_vga/lt3_c9 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt3_0|u_vga/lt3_cin"),
    //.R_POSITION("X0Y3Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt3_cout_al_u1109  (
    .a({open_n13797,1'b0}),
    .b({open_n13798,1'b1}),
    .fci(\u_vga/lt3_c13 ),
    .f({open_n13817,\u_vga/n12 }));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt4_0|u_vga/lt4_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt4_0|u_vga/lt4_cin  (
    .a(2'b01),
    .b({\u_vga/hsyn_cnt [0],open_n13823}),
    .fco(\u_vga/lt4_c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt4_0|u_vga/lt4_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt4_10|u_vga/lt4_9  (
    .a(2'b00),
    .b(\u_vga/hsyn_cnt [10:9]),
    .fci(\u_vga/lt4_c9 ),
    .fco(\u_vga/lt4_c11 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt4_0|u_vga/lt4_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt4_12|u_vga/lt4_11  (
    .a(2'b00),
    .b(\u_vga/hsyn_cnt [12:11]),
    .fci(\u_vga/lt4_c11 ),
    .fco(\u_vga/lt4_c13 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt4_0|u_vga/lt4_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt4_2|u_vga/lt4_1  (
    .a(2'b00),
    .b(\u_vga/hsyn_cnt [2:1]),
    .fci(\u_vga/lt4_c1 ),
    .fco(\u_vga/lt4_c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt4_0|u_vga/lt4_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt4_4|u_vga/lt4_3  (
    .a(2'b10),
    .b(\u_vga/hsyn_cnt [4:3]),
    .fci(\u_vga/lt4_c3 ),
    .fco(\u_vga/lt4_c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt4_0|u_vga/lt4_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt4_6|u_vga/lt4_5  (
    .a(2'b00),
    .b(\u_vga/hsyn_cnt [6:5]),
    .fci(\u_vga/lt4_c5 ),
    .fco(\u_vga/lt4_c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt4_0|u_vga/lt4_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt4_8|u_vga/lt4_7  (
    .a(2'b01),
    .b(\u_vga/hsyn_cnt [8:7]),
    .fci(\u_vga/lt4_c7 ),
    .fco(\u_vga/lt4_c9 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt4_0|u_vga/lt4_cin"),
    //.R_POSITION("X0Y3Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt4_cout_al_u1110  (
    .a({open_n13993,1'b0}),
    .b({open_n13994,1'b1}),
    .fci(\u_vga/lt4_c13 ),
    .f({open_n14013,\u_vga/n14 }));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt5_0|u_vga/lt5_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_vga/lt5_0|u_vga/lt5_cin  (
    .a({\u_vga/hsyn_cnt [0],1'b0}),
    .b({1'b0,open_n14019}),
    .clk(vga_clk_pad),
    .mi({open_n14035,\u_vga/hsyn_cnt [0]}),
    .sr(\u_vga/mux4_b0_sel_is_3_o ),
    .fco(\u_vga/lt5_c1 ),
    .q({open_n14040,axis_x[0]}));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt5_0|u_vga/lt5_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt5_10|u_vga/lt5_9  (
    .a(\u_vga/hsyn_cnt [10:9]),
    .b(2'b01),
    .fci(\u_vga/lt5_c9 ),
    .fco(\u_vga/lt5_c11 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt5_0|u_vga/lt5_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt5_12|u_vga/lt5_11  (
    .a(\u_vga/hsyn_cnt [12:11]),
    .b(2'b00),
    .fci(\u_vga/lt5_c11 ),
    .fco(\u_vga/lt5_c13 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt5_0|u_vga/lt5_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt5_2|u_vga/lt5_1  (
    .a(\u_vga/hsyn_cnt [2:1]),
    .b(2'b00),
    .fci(\u_vga/lt5_c1 ),
    .fco(\u_vga/lt5_c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt5_0|u_vga/lt5_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt5_4|u_vga/lt5_3  (
    .a(\u_vga/hsyn_cnt [4:3]),
    .b(2'b10),
    .fci(\u_vga/lt5_c3 ),
    .fco(\u_vga/lt5_c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt5_0|u_vga/lt5_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt5_6|u_vga/lt5_5  (
    .a(\u_vga/hsyn_cnt [6:5]),
    .b(2'b00),
    .fci(\u_vga/lt5_c5 ),
    .fco(\u_vga/lt5_c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt5_0|u_vga/lt5_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt5_8|u_vga/lt5_7  (
    .a(\u_vga/hsyn_cnt [8:7]),
    .b(2'b10),
    .fci(\u_vga/lt5_c7 ),
    .fco(\u_vga/lt5_c9 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/lt5_0|u_vga/lt5_cin"),
    //.R_POSITION("X0Y3Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vga/lt5_cout_al_u1111  (
    .a({open_n14185,1'b0}),
    .b({open_n14186,1'b1}),
    .fci(\u_vga/lt5_c13 ),
    .f({open_n14205,\u_vga/n15 }));
  // sources/rtl/vga/vga.v(79)
  // sources/rtl/vga/vga.v(79)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vga/reg0_b0|u_vga/reg0_b8  (
    .c({\u_vga/n4 [0],\u_vga/n4 [8]}),
    .ce(\u_vga/n0 ),
    .clk(vga_clk_pad),
    .d({\u_vga/n3_lutinv ,\u_vga/n3_lutinv }),
    .q({\u_vga/vsyn_cnt [0],\u_vga/vsyn_cnt [8]}));  // sources/rtl/vga/vga.v(79)
  // sources/rtl/vga/vga.v(79)
  // sources/rtl/vga/vga.v(79)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vga/reg0_b10|u_vga/reg0_b7  (
    .c({\u_vga/n4 [10],\u_vga/n4 [7]}),
    .ce(\u_vga/n0 ),
    .clk(vga_clk_pad),
    .d({\u_vga/n3_lutinv ,\u_vga/n3_lutinv }),
    .q({\u_vga/vsyn_cnt [10],\u_vga/vsyn_cnt [7]}));  // sources/rtl/vga/vga.v(79)
  // sources/rtl/vga/vga.v(79)
  // sources/rtl/vga/vga.v(79)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vga/reg0_b11|u_vga/reg0_b5  (
    .c({\u_vga/n4 [11],\u_vga/n4 [5]}),
    .ce(\u_vga/n0 ),
    .clk(vga_clk_pad),
    .d({\u_vga/n3_lutinv ,\u_vga/n3_lutinv }),
    .q({\u_vga/vsyn_cnt [11],\u_vga/vsyn_cnt [5]}));  // sources/rtl/vga/vga.v(79)
  // sources/rtl/vga/vga.v(79)
  // sources/rtl/vga/vga.v(79)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vga/reg0_b12|u_vga/reg0_b4  (
    .c({\u_vga/n4 [12],\u_vga/n4 [4]}),
    .ce(\u_vga/n0 ),
    .clk(vga_clk_pad),
    .d({\u_vga/n3_lutinv ,\u_vga/n3_lutinv }),
    .q({\u_vga/vsyn_cnt [12],\u_vga/vsyn_cnt [4]}));  // sources/rtl/vga/vga.v(79)
  // sources/rtl/vga/vga.v(79)
  // sources/rtl/vga/vga.v(79)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vga/reg0_b1|u_vga/reg0_b3  (
    .c({\u_vga/n4 [1],\u_vga/n4 [3]}),
    .ce(\u_vga/n0 ),
    .clk(vga_clk_pad),
    .d({\u_vga/n3_lutinv ,\u_vga/n3_lutinv }),
    .q({\u_vga/vsyn_cnt [1],\u_vga/vsyn_cnt [3]}));  // sources/rtl/vga/vga.v(79)
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/reg1_b4|u_vga/sub0/ucin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("SUB"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1001100110011010),
    .INIT_LUT1(16'b1001100110011010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_vga/reg1_b10|u_vga/reg1_b9  (
    .a(\u_vga/hsyn_cnt [10:9]),
    .b(2'b00),
    .clk(vga_clk_pad),
    .fci(\u_vga/sub0/c5 ),
    .sr(\u_vga/mux4_b0_sel_is_3_o ),
    .q(axis_x[10:9]));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_vga/reg1_b3  (
    .a({open_n14350,\u_vga/hsyn_cnt [3]}),
    .b({open_n14351,\u_vga/hsyn_cnt [4]}),
    .c({open_n14352,\u_vga/hsyn_cnt [5]}),
    .clk(vga_clk_pad),
    .d({open_n14354,\u_vga/hsyn_cnt [6]}),
    .mi({open_n14365,\u_vga/hsyn_cnt [3]}),
    .sr(\u_vga/mux4_b0_sel_is_3_o ),
    .f({open_n14366,_al_u681_o}),
    .q({open_n14370,axis_x[3]}));  // sources/rtl/vga/vga.v(125)
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/reg1_b4|u_vga/sub0/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("SUB_CARRY"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000000101),
    .INIT_LUT1(16'b1001100110011010),
    .MODE("RIPPLE"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_vga/reg1_b4|u_vga/sub0/ucin  (
    .a({\u_vga/hsyn_cnt [4],1'b0}),
    .b({1'b1,open_n14371}),
    .clk(vga_clk_pad),
    .sr(\u_vga/mux4_b0_sel_is_3_o ),
    .fco(\u_vga/sub0/c1 ),
    .q({axis_x[4],open_n14393}));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/reg1_b4|u_vga/sub0/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("SUB"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1001100110011010),
    .INIT_LUT1(16'b1001100110011010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_vga/reg1_b6|u_vga/reg1_b5  (
    .a(\u_vga/hsyn_cnt [6:5]),
    .b(2'b00),
    .clk(vga_clk_pad),
    .fci(\u_vga/sub0/c1 ),
    .sr(\u_vga/mux4_b0_sel_is_3_o ),
    .fco(\u_vga/sub0/c3 ),
    .q(axis_x[6:5]));
  EG_PHY_MSLICE #(
    //.MACRO("u_vga/reg1_b4|u_vga/sub0/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("SUB"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1001100110011010),
    .INIT_LUT1(16'b1001100110011010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_vga/reg1_b8|u_vga/reg1_b7  (
    .a(\u_vga/hsyn_cnt [8:7]),
    .b(2'b01),
    .clk(vga_clk_pad),
    .fci(\u_vga/sub0/c3 ),
    .sr(\u_vga/mux4_b0_sel_is_3_o ),
    .fco(\u_vga/sub0/c5 ),
    .q(axis_x[8:7]));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTG0("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_vga/reg2_b10  (
    .c({open_n14438,\u_vga/n12 }),
    .clk(vga_clk_pad),
    .d({open_n14440,\u_vga/n11 }),
    .mi({open_n14444,\u_vga/n21 [10]}),
    .sr(\u_vga/n13 ),
    .f({open_n14456,\u_vga/n13 }),
    .q({open_n14460,axis_y[10]}));  // sources/rtl/vga/vga.v(134)
  // sources/rtl/vga/vga.v(134)
  // sources/rtl/vga/vga.v(134)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_vga/reg2_b3|u_vga/reg2_b9  (
    .clk(vga_clk_pad),
    .mi({\u_vga/n21 [3],\u_vga/n21 [9]}),
    .sr(\u_vga/n13 ),
    .q({axis_y[3],axis_y[9]}));  // sources/rtl/vga/vga.v(134)
  // sources/rtl/vga/vga.v(134)
  // sources/rtl/vga/vga.v(134)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_vga/reg2_b4|u_vga/reg2_b8  (
    .clk(vga_clk_pad),
    .mi({\u_vga/n21 [4],\u_vga/n21 [8]}),
    .sr(\u_vga/n13 ),
    .q({axis_y[4],axis_y[8]}));  // sources/rtl/vga/vga.v(134)
  // sources/rtl/vga/vga.v(134)
  // sources/rtl/vga/vga.v(134)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_vga/reg2_b6|u_vga/reg2_b7  (
    .clk(vga_clk_pad),
    .mi({\u_vga/n21 [6],\u_vga/n21 [7]}),
    .sr(\u_vga/n13 ),
    .q({axis_y[6],axis_y[7]}));  // sources/rtl/vga/vga.v(134)
  // sources/rtl/vga/vga.v(67)
  // sources/rtl/vga/vga.v(67)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_vga/reg3_b11|u_vga/reg3_b9  (
    .clk(vga_clk_pad),
    .mi({\u_vga/n1 [11],\u_vga/n1 [9]}),
    .sr(\u_vga/n0 ),
    .q({\u_vga/hsyn_cnt [11],\u_vga/hsyn_cnt [9]}));  // sources/rtl/vga/vga.v(67)
  // sources/rtl/vga/vga.v(67)
  // sources/rtl/vga/vga.v(67)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_vga/reg3_b12|u_vga/reg3_b8  (
    .clk(vga_clk_pad),
    .mi({\u_vga/n1 [12],\u_vga/n1 [8]}),
    .sr(\u_vga/n0 ),
    .q({\u_vga/hsyn_cnt [12],\u_vga/hsyn_cnt [8]}));  // sources/rtl/vga/vga.v(67)
  // sources/rtl/vga/vga.v(67)
  // sources/rtl/vga/vga.v(67)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_vga/reg3_b1|u_vga/reg3_b6  (
    .clk(vga_clk_pad),
    .mi({\u_vga/n1 [1],\u_vga/n1 [6]}),
    .sr(\u_vga/n0 ),
    .q({\u_vga/hsyn_cnt [1],\u_vga/hsyn_cnt [6]}));  // sources/rtl/vga/vga.v(67)
  // sources/rtl/vga/vga.v(67)
  // sources/rtl/vga/vga.v(67)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_vga/reg3_b2|u_vga/reg3_b5  (
    .clk(vga_clk_pad),
    .mi({\u_vga/n1 [2],\u_vga/n1 [5]}),
    .sr(\u_vga/n0 ),
    .q({\u_vga/hsyn_cnt [2],\u_vga/hsyn_cnt [5]}));  // sources/rtl/vga/vga.v(67)
  // sources/rtl/vga/vga.v(67)
  // sources/rtl/vga/vga.v(67)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_vga/reg3_b3|u_vga/reg3_b4  (
    .clk(vga_clk_pad),
    .mi({\u_vga/n1 [3],\u_vga/n1 [4]}),
    .sr(\u_vga/n0 ),
    .q({\u_vga/hsyn_cnt [3],\u_vga/hsyn_cnt [4]}));  // sources/rtl/vga/vga.v(67)
  // sources/rtl/vga/vga.v(67)
  // sources/rtl/vga/vga.v(67)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTF1("(D*C*~B*A)"),
    //.LUTG0("(D*C*B*A)"),
    //.LUTG1("(D*C*~B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b0010000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b0010000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_vga/reg3_b7|u_vga/reg3_b0  (
    .a({_al_u681_o,_al_u682_o}),
    .b({\u_vga/hsyn_cnt [7],_al_u683_o}),
    .c({\u_vga/hsyn_cnt [8],\u_vga/hsyn_cnt [0]}),
    .clk(vga_clk_pad),
    .d({\u_vga/hsyn_cnt [9],\u_vga/hsyn_cnt [1]}),
    .mi({\u_vga/n1 [7],\u_vga/n1 [0]}),
    .sr(\u_vga/n0 ),
    .f({_al_u682_o,\u_vga/n0 }),
    .q({\u_vga/hsyn_cnt [7],\u_vga/hsyn_cnt [0]}));  // sources/rtl/vga/vga.v(67)
  EG_PHY_LSLICE #(
    //.MACRO("u_vga/sub1/ucin_al_u1097"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_vga/sub1/u3_al_u1098  (
    .a({\u_vga/vsyn_cnt [5],\u_vga/vsyn_cnt [3]}),
    .b({\u_vga/vsyn_cnt [6],\u_vga/vsyn_cnt [4]}),
    .c(2'b11),
    .d(2'b10),
    .e(2'b00),
    .fci(\u_vga/sub1/c3 ),
    .f({\u_vga/n21 [5],\u_vga/n21 [3]}),
    .fco(\u_vga/sub1/c7 ),
    .fx({\u_vga/n21 [6],\u_vga/n21 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_vga/sub1/ucin_al_u1097"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_vga/sub1/u7_al_u1099  (
    .a({\u_vga/vsyn_cnt [9],\u_vga/vsyn_cnt [7]}),
    .b({\u_vga/vsyn_cnt [10],\u_vga/vsyn_cnt [8]}),
    .c(2'b11),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_vga/sub1/c7 ),
    .f({\u_vga/n21 [9],\u_vga/n21 [7]}),
    .fx({\u_vga/n21 [10],\u_vga/n21 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_vga/sub1/ucin_al_u1097"),
    //.R_POSITION("X0Y0Z0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'h0005),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_vga/sub1/ucin_al_u1097  (
    .a({\u_vga/vsyn_cnt [1],1'b0}),
    .b({\u_vga/vsyn_cnt [2],\u_vga/vsyn_cnt [0]}),
    .c(2'b11),
    .clk(vga_clk_pad),
    .d(2'b11),
    .e(2'b01),
    .mi(\u_vga/n21 [1:0]),
    .sr(\u_vga/n13 ),
    .f({\u_vga/n21 [1],open_n14741}),
    .fco(\u_vga/sub1/c3 ),
    .fx({\u_vga/n21 [2],\u_vga/n21 [0]}),
    .q(axis_y[1:0]));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/add0/u0|u_vram/add0/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \u_vram/add0/u0|u_vram/add0/ucin  (
    .a({\u_vram/n5 [1],1'b0}),
    .b({\u_vram/mesh_x [1],open_n14742}),
    .f({n1[0],open_n14762}),
    .fco(\u_vram/add0/c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/add0/u0|u_vram/add0/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \u_vram/add0/u2|u_vram/add0/u1  (
    .a(\u_vram/n5 [3:2]),
    .b(\u_vram/mesh_x [3:2]),
    .fci(\u_vram/add0/c1 ),
    .f(n1[2:1]),
    .fco(\u_vram/add0/c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/add0/u0|u_vram/add0/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \u_vram/add0/u4|u_vram/add0/u3  (
    .a(\u_vram/n5 [5:4]),
    .b({1'b0,\u_vram/mesh_x [4]}),
    .fci(\u_vram/add0/c3 ),
    .f(n1[4:3]),
    .fco(\u_vram/add0/c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/add0/u0|u_vram/add0/ucin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \u_vram/add0/u6|u_vram/add0/u5  (
    .a(\u_vram/n5 [7:6]),
    .b(2'b00),
    .fci(\u_vram/add0/c5 ),
    .f(n1[6:5]));
  // sources/rtl/key/key.v(43)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/axis_en_d0_reg|u_key/reg3_b13  (
    .clk(vga_clk_pad),
    .mi({axis_en,\u_key/n3 [13]}),
    .q({\u_vram/axis_en_d0 ,\u_key/cnt [13]}));  // sources/rtl/key/key.v(43)
  // sources/rtl/vga/vram.v(123)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/axis_en_d1_reg|u_vram/vs_i_d0_reg  (
    .clk(vga_clk_pad),
    .mi({\u_vram/axis_en_d0 ,vsyn}),
    .q({\u_vram/axis_en_d1 ,\u_vram/vs_i_d0 }));  // sources/rtl/vga/vram.v(123)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(123)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/hs_i_d0_reg|u_vram/reg5_b10  (
    .clk(vga_clk_pad),
    .mi({hsyn,\u_vram/axis_x_d0 [10]}),
    .q({\u_vram/hs_i_d0 ,\u_vram/axis_x_d1 [10]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(123)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/hs_i_d1_reg|u_vram/reg3_b4  (
    .clk(vga_clk_pad),
    .mi({\u_vram/hs_i_d0 ,axis_x[4]}),
    .q({\u_vram/hs_i_d1 ,\u_vram/axis_x_d0 [4]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(123)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/hs_i_d2_reg|u_vram/reg3_b3  (
    .clk(vga_clk_pad),
    .mi({\u_vram/hs_i_d1 ,axis_x[3]}),
    .q({\u_vram/hs_i_d2 ,\u_vram/axis_x_d0 [3]}));  // sources/rtl/vga/vram.v(110)
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
    .do({open_n14967,open_n14968,open_n14969,\u_vram/hs_i_d2 }),
    .osclk(vga_clk_pad),
    .opad(vga_hs));  // sources/rtl/vga/vram.v(152)
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt0_0|u_vram/lt0_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vram/lt0_0|u_vram/lt0_cin  (
    .a({\u_vram/axis_x_d2 [0],1'b0}),
    .b({1'b0,open_n14982}),
    .fco(\u_vram/lt0_c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt0_0|u_vram/lt0_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vram/lt0_10|u_vram/lt0_9  (
    .a(\u_vram/axis_x_d2 [10:9]),
    .b(2'b00),
    .fci(\u_vram/lt0_c9 ),
    .fco(\u_vram/lt0_c11 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt0_0|u_vram/lt0_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vram/lt0_2|u_vram/lt0_1  (
    .a(\u_vram/axis_x_d2 [2:1]),
    .b(2'b00),
    .fci(\u_vram/lt0_c1 ),
    .fco(\u_vram/lt0_c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt0_0|u_vram/lt0_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vram/lt0_4|u_vram/lt0_3  (
    .a(\u_vram/axis_x_d2 [4:3]),
    .b(2'b00),
    .fci(\u_vram/lt0_c3 ),
    .fco(\u_vram/lt0_c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt0_0|u_vram/lt0_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vram/lt0_6|u_vram/lt0_5  (
    .a(\u_vram/axis_x_d2 [6:5]),
    .b(2'b01),
    .fci(\u_vram/lt0_c5 ),
    .fco(\u_vram/lt0_c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt0_0|u_vram/lt0_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vram/lt0_8|u_vram/lt0_7  (
    .a(\u_vram/axis_x_d2 [8:7]),
    .b(2'b00),
    .fci(\u_vram/lt0_c7 ),
    .fco(\u_vram/lt0_c9 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt0_0|u_vram/lt0_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vram/lt0_cout_al_u1112  (
    .a({open_n15128,1'b0}),
    .b({open_n15129,1'b1}),
    .fci(\u_vram/lt0_c11 ),
    .f({open_n15148,\u_vram/n9 }));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt1_0|u_vram/lt1_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/lt1_0|u_vram/lt1_cin  (
    .a(2'b00),
    .b({\u_vram/axis_x_d2 [0],open_n15154}),
    .clk(vga_clk_pad),
    .mi({open_n15170,\u_vram/axis_x_d1 [0]}),
    .fco(\u_vram/lt1_c1 ),
    .q({open_n15176,\u_vram/axis_x_d2 [0]}));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt1_0|u_vram/lt1_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vram/lt1_10|u_vram/lt1_9  (
    .a(2'b01),
    .b(\u_vram/axis_x_d2 [10:9]),
    .fci(\u_vram/lt1_c9 ),
    .fco(\u_vram/lt1_c11 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt1_0|u_vram/lt1_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vram/lt1_2|u_vram/lt1_1  (
    .a(2'b00),
    .b(\u_vram/axis_x_d2 [2:1]),
    .fci(\u_vram/lt1_c1 ),
    .fco(\u_vram/lt1_c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt1_0|u_vram/lt1_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vram/lt1_4|u_vram/lt1_3  (
    .a(2'b00),
    .b(\u_vram/axis_x_d2 [4:3]),
    .fci(\u_vram/lt1_c3 ),
    .fco(\u_vram/lt1_c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt1_0|u_vram/lt1_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vram/lt1_6|u_vram/lt1_5  (
    .a(2'b11),
    .b(\u_vram/axis_x_d2 [6:5]),
    .fci(\u_vram/lt1_c5 ),
    .fco(\u_vram/lt1_c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt1_0|u_vram/lt1_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vram/lt1_8|u_vram/lt1_7  (
    .a(2'b00),
    .b(\u_vram/axis_x_d2 [8:7]),
    .fci(\u_vram/lt1_c7 ),
    .fco(\u_vram/lt1_c9 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt1_0|u_vram/lt1_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vram/lt1_cout_al_u1113  (
    .a({open_n15297,1'b0}),
    .b({open_n15298,1'b1}),
    .fci(\u_vram/lt1_c11 ),
    .f({open_n15317,\u_vram/n10 }));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt2_0|u_vram/lt2_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vram/lt2_0|u_vram/lt2_cin  (
    .a({\u_vram/axis_y_d2 [0],1'b0}),
    .b({1'b0,open_n15323}),
    .fco(\u_vram/lt2_c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt2_0|u_vram/lt2_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vram/lt2_10|u_vram/lt2_9  (
    .a(\u_vram/axis_y_d2 [10:9]),
    .b(2'b00),
    .fci(\u_vram/lt2_c9 ),
    .fco(\u_vram/lt2_c11 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt2_0|u_vram/lt2_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vram/lt2_2|u_vram/lt2_1  (
    .a(\u_vram/axis_y_d2 [2:1]),
    .b(2'b00),
    .fci(\u_vram/lt2_c1 ),
    .fco(\u_vram/lt2_c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt2_0|u_vram/lt2_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vram/lt2_4|u_vram/lt2_3  (
    .a(\u_vram/axis_y_d2 [4:3]),
    .b(2'b00),
    .fci(\u_vram/lt2_c3 ),
    .fco(\u_vram/lt2_c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt2_0|u_vram/lt2_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vram/lt2_6|u_vram/lt2_5  (
    .a(\u_vram/axis_y_d2 [6:5]),
    .b(2'b01),
    .fci(\u_vram/lt2_c5 ),
    .fco(\u_vram/lt2_c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt2_0|u_vram/lt2_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vram/lt2_8|u_vram/lt2_7  (
    .a(\u_vram/axis_y_d2 [8:7]),
    .b(2'b00),
    .fci(\u_vram/lt2_c7 ),
    .fco(\u_vram/lt2_c9 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt2_0|u_vram/lt2_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vram/lt2_cout_al_u1114  (
    .a({open_n15469,1'b0}),
    .b({open_n15470,1'b1}),
    .fci(\u_vram/lt2_c11 ),
    .f({open_n15489,\u_vram/n12 }));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt3_0|u_vram/lt3_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/lt3_0|u_vram/lt3_cin  (
    .a(2'b00),
    .b({\u_vram/axis_y_d2 [0],open_n15495}),
    .clk(vga_clk_pad),
    .mi({open_n15511,\u_vram/axis_y_d1 [0]}),
    .fco(\u_vram/lt3_c1 ),
    .q({open_n15517,\u_vram/axis_y_d2 [0]}));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt3_0|u_vram/lt3_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vram/lt3_10|u_vram/lt3_9  (
    .a(2'b00),
    .b(\u_vram/axis_y_d2 [10:9]),
    .fci(\u_vram/lt3_c9 ),
    .fco(\u_vram/lt3_c11 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt3_0|u_vram/lt3_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vram/lt3_2|u_vram/lt3_1  (
    .a(2'b00),
    .b(\u_vram/axis_y_d2 [2:1]),
    .fci(\u_vram/lt3_c1 ),
    .fco(\u_vram/lt3_c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt3_0|u_vram/lt3_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vram/lt3_4|u_vram/lt3_3  (
    .a(2'b00),
    .b(\u_vram/axis_y_d2 [4:3]),
    .fci(\u_vram/lt3_c3 ),
    .fco(\u_vram/lt3_c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt3_0|u_vram/lt3_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vram/lt3_6|u_vram/lt3_5  (
    .a(2'b10),
    .b(\u_vram/axis_y_d2 [6:5]),
    .fci(\u_vram/lt3_c5 ),
    .fco(\u_vram/lt3_c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt3_0|u_vram/lt3_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vram/lt3_8|u_vram/lt3_7  (
    .a(2'b11),
    .b(\u_vram/axis_y_d2 [8:7]),
    .fci(\u_vram/lt3_c7 ),
    .fco(\u_vram/lt3_c9 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/lt3_0|u_vram/lt3_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_vram/lt3_cout_al_u1115  (
    .a({open_n15638,1'b0}),
    .b({open_n15639,1'b1}),
    .fci(\u_vram/lt3_c11 ),
    .f({open_n15658,\u_vram/n14 }));
  // address_offset=0;data_offset=0;depth=256;width=1;num_section=1;width_per_section=1;section_size=1;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0009"),
    //.WID("0x0009"),
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
    .READBACK("OFF"),
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
    .dia({open_n15671,open_n15672,open_n15673,open_n15674,open_n15675,open_n15676,open_n15677,1'b0,open_n15678}),
    .dib({open_n15679,open_n15680,open_n15681,open_n15682,open_n15683,open_n15684,open_n15685,vram_wdata,open_n15686}),
    .web(vram_wen),
    .doa({open_n15692,open_n15693,open_n15694,open_n15695,open_n15696,open_n15697,open_n15698,open_n15699,vram_rdata}));
  // address_offset=0;data_offset=0;depth=256;width=1;num_section=1;width_per_section=1;section_size=1;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x000A"),
    //.WID("0x000A"),
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
    .READBACK("OFF"),
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
    .dia({open_n15717,open_n15718,open_n15719,open_n15720,open_n15721,open_n15722,open_n15723,1'b0,open_n15724}),
    .dib({open_n15725,open_n15726,open_n15727,open_n15728,open_n15729,open_n15730,open_n15731,vram_wdata,open_n15732}),
    .web(vram_wen),
    .doa({open_n15738,open_n15739,open_n15740,open_n15741,open_n15742,open_n15743,open_n15744,open_n15745,\u_vram/state }));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/reg0_b0|u_vram/sub0/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("SUB_CARRY"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000000101),
    .INIT_LUT1(16'b1001100110011010),
    .MODE("RIPPLE"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg0_b0|u_vram/sub0/ucin  (
    .a({axis_x[5],1'b0}),
    .b({1'b1,open_n15755}),
    .clk(vga_clk_pad),
    .fco(\u_vram/sub0/c1 ),
    .q({\u_vram/mesh_x [0],open_n15778}));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/reg0_b0|u_vram/sub0/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("SUB"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1001100110011010),
    .INIT_LUT1(16'b1001100110011010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg0_b2|u_vram/reg0_b1  (
    .a(axis_x[7:6]),
    .b(2'b00),
    .clk(vga_clk_pad),
    .fci(\u_vram/sub0/c1 ),
    .fco(\u_vram/sub0/c3 ),
    .q(\u_vram/mesh_x [2:1]));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/reg0_b0|u_vram/sub0/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("SUB"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1001100110011010),
    .INIT_LUT1(16'b1001100110011010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg0_b4|u_vram/reg0_b3  (
    .a(axis_x[9:8]),
    .b(2'b00),
    .clk(vga_clk_pad),
    .fci(\u_vram/sub0/c3 ),
    .q(\u_vram/mesh_x [4:3]));
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg3_b0|u_vram/reg5_b0  (
    .clk(vga_clk_pad),
    .mi({axis_x[0],\u_vram/axis_x_d0 [0]}),
    .q({\u_vram/axis_x_d0 [0],\u_vram/axis_x_d1 [0]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg3_b10|u_vram/reg3_b9  (
    .clk(vga_clk_pad),
    .mi(axis_x[10:9]),
    .q(\u_vram/axis_x_d0 [10:9]));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg3_b1|u_vram/reg5_b1  (
    .clk(vga_clk_pad),
    .mi({axis_x[1],\u_vram/axis_x_d0 [1]}),
    .q({\u_vram/axis_x_d0 [1],\u_vram/axis_x_d1 [1]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg3_b2|u_vram/reg5_b2  (
    .clk(vga_clk_pad),
    .mi({axis_x[2],\u_vram/axis_x_d0 [2]}),
    .q({\u_vram/axis_x_d0 [2],\u_vram/axis_x_d1 [2]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg3_b7|u_vram/reg3_b8  (
    .clk(vga_clk_pad),
    .mi({axis_x[7],axis_x[8]}),
    .q({\u_vram/axis_x_d0 [7],\u_vram/axis_x_d0 [8]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg4_b0|u_vram/reg6_b0  (
    .clk(vga_clk_pad),
    .mi({axis_y[0],\u_vram/axis_y_d0 [0]}),
    .q({\u_vram/axis_y_d0 [0],\u_vram/axis_y_d1 [0]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg4_b10|u_vram/reg6_b10  (
    .clk(vga_clk_pad),
    .mi({axis_y[10],\u_vram/axis_y_d0 [10]}),
    .q({\u_vram/axis_y_d0 [10],\u_vram/axis_y_d1 [10]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg4_b1|u_vram/reg6_b1  (
    .clk(vga_clk_pad),
    .mi({axis_y[1],\u_vram/axis_y_d0 [1]}),
    .q({\u_vram/axis_y_d0 [1],\u_vram/axis_y_d1 [1]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg4_b2|u_vram/reg6_b2  (
    .clk(vga_clk_pad),
    .mi({axis_y[2],\u_vram/axis_y_d0 [2]}),
    .q({\u_vram/axis_y_d0 [2],\u_vram/axis_y_d1 [2]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg4_b3|u_vram/reg4_b9  (
    .clk(vga_clk_pad),
    .mi({axis_y[3],axis_y[9]}),
    .q({\u_vram/axis_y_d0 [3],\u_vram/axis_y_d0 [9]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg4_b4|u_vram/reg4_b8  (
    .clk(vga_clk_pad),
    .mi({axis_y[4],axis_y[8]}),
    .q({\u_vram/axis_y_d0 [4],\u_vram/axis_y_d0 [8]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg4_b6|u_vram/reg4_b7  (
    .clk(vga_clk_pad),
    .mi({axis_y[6],axis_y[7]}),
    .q({\u_vram/axis_y_d0 [6],\u_vram/axis_y_d0 [7]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg5_b3|u_vram/reg7_b3  (
    .clk(vga_clk_pad),
    .mi({\u_vram/axis_x_d0 [3],\u_vram/axis_x_d1 [3]}),
    .q({\u_vram/axis_x_d1 [3],\u_vram/axis_x_d2 [3]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg5_b4|u_vram/reg7_b4  (
    .clk(vga_clk_pad),
    .mi({\u_vram/axis_x_d0 [4],\u_vram/axis_x_d1 [4]}),
    .q({\u_vram/axis_x_d1 [4],\u_vram/axis_x_d2 [4]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg5_b5|u_vram/reg7_b5  (
    .clk(vga_clk_pad),
    .mi({\u_vram/axis_x_d0 [5],\u_vram/axis_x_d1 [5]}),
    .q({\u_vram/axis_x_d1 [5],\u_vram/axis_x_d2 [5]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg5_b6|u_vram/reg3_b6  (
    .clk(vga_clk_pad),
    .mi({\u_vram/axis_x_d0 [6],axis_x[6]}),
    .q({\u_vram/axis_x_d1 [6],\u_vram/axis_x_d0 [6]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg5_b7|u_vram/reg7_b7  (
    .clk(vga_clk_pad),
    .mi({\u_vram/axis_x_d0 [7],\u_vram/axis_x_d1 [7]}),
    .q({\u_vram/axis_x_d1 [7],\u_vram/axis_x_d2 [7]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg5_b8|u_vram/reg7_b8  (
    .clk(vga_clk_pad),
    .mi({\u_vram/axis_x_d0 [8],\u_vram/axis_x_d1 [8]}),
    .q({\u_vram/axis_x_d1 [8],\u_vram/axis_x_d2 [8]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg5_b9|u_vram/reg7_b9  (
    .clk(vga_clk_pad),
    .mi({\u_vram/axis_x_d0 [9],\u_vram/axis_x_d1 [9]}),
    .q({\u_vram/axis_x_d1 [9],\u_vram/axis_x_d2 [9]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg6_b3|u_vram/reg8_b3  (
    .clk(vga_clk_pad),
    .mi({\u_vram/axis_y_d0 [3],\u_vram/axis_y_d1 [3]}),
    .q({\u_vram/axis_y_d1 [3],\u_vram/axis_y_d2 [3]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg6_b4|u_vram/reg8_b4  (
    .clk(vga_clk_pad),
    .mi({\u_vram/axis_y_d0 [4],\u_vram/axis_y_d1 [4]}),
    .q({\u_vram/axis_y_d1 [4],\u_vram/axis_y_d2 [4]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg6_b5|u_vram/reg4_b5  (
    .clk(vga_clk_pad),
    .mi({\u_vram/axis_y_d0 [5],axis_y[5]}),
    .q({\u_vram/axis_y_d1 [5],\u_vram/axis_y_d0 [5]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg6_b6|u_vram/reg8_b6  (
    .clk(vga_clk_pad),
    .mi({\u_vram/axis_y_d0 [6],\u_vram/axis_y_d1 [6]}),
    .q({\u_vram/axis_y_d1 [6],\u_vram/axis_y_d2 [6]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg6_b7|u_vram/reg8_b7  (
    .clk(vga_clk_pad),
    .mi({\u_vram/axis_y_d0 [7],\u_vram/axis_y_d1 [7]}),
    .q({\u_vram/axis_y_d1 [7],\u_vram/axis_y_d2 [7]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg6_b8|u_vram/reg8_b8  (
    .clk(vga_clk_pad),
    .mi({\u_vram/axis_y_d0 [8],\u_vram/axis_y_d1 [8]}),
    .q({\u_vram/axis_y_d1 [8],\u_vram/axis_y_d2 [8]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg6_b9|u_vram/reg8_b9  (
    .clk(vga_clk_pad),
    .mi({\u_vram/axis_y_d0 [9],\u_vram/axis_y_d1 [9]}),
    .q({\u_vram/axis_y_d1 [9],\u_vram/axis_y_d2 [9]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*~D)"),
    //.LUT1("(~C*~B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000000011),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg7_b1|u_vram/reg7_b2  (
    .b({\u_vram/axis_x_d2 [0],\u_vram/axis_x_d2 [3]}),
    .c({\u_vram/axis_x_d2 [1],\u_vram/axis_x_d2 [4]}),
    .clk(vga_clk_pad),
    .d({_al_u576_o,\u_vram/axis_x_d2 [2]}),
    .mi({\u_vram/axis_x_d1 [1],\u_vram/axis_x_d1 [2]}),
    .f({\u_vram/n24_lutinv ,_al_u576_o}),
    .q({\u_vram/axis_x_d2 [1],\u_vram/axis_x_d2 [2]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*B*~A)"),
    //.LUT1("(B*A*~(D@C))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000000100),
    .INIT_LUT1(16'b1000000000001000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg7_b6|u_vram/reg7_b10  (
    .a({\u_vram/n24_lutinv ,\u_vram/axis_x_d2 [10]}),
    .b({_al_u1027_o,\u_vram/axis_x_d2 [5]}),
    .c({\u_vram/axis_x_d2 [6],\u_vram/axis_x_d2 [7]}),
    .clk(vga_clk_pad),
    .d(\u_vram/axis_x_d2 [9:8]),
    .mi({\u_vram/axis_x_d1 [6],\u_vram/axis_x_d1 [10]}),
    .f({\u_vram/n18_lutinv ,_al_u1027_o}),
    .q({\u_vram/axis_x_d2 [6],\u_vram/axis_x_d2 [10]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_LSLICE #(
    //.LUTF0("(~(A)*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+A*B*~(C)*~(D)+~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*B*C*~(D)+A*B*C*~(D)+~(A)*~(B)*~(C)*D+A*~(B)*~(C)*D+~(A)*B*~(C)*D+A*B*~(C)*D+~(A)*~(B)*C*D+A*~(B)*C*D+A*B*C*D)"),
    //.LUTF1("(~D*~C*~B*A)"),
    //.LUTG0("(~(A)*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+A*B*~(C)*~(D)+~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*B*C*~(D)+A*B*C*~(D)+~(A)*~(B)*~(C)*D+A*~(B)*~(C)*D+~(A)*B*~(C)*D+A*B*~(C)*D+~(A)*~(B)*C*D+A*~(B)*C*D+A*B*C*D)"),
    //.LUTG1("(~D*~C*~B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1011111111111101),
    .INIT_LUTF1(16'b0000000000000010),
    .INIT_LUTG0(16'b1011111111111101),
    .INIT_LUTG1(16'b0000000000000010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg8_b10|u_vram/reg8_b5  (
    .a({\u_vram/n23_lutinv ,\u_vram/axis_y_d2 [5]}),
    .b({_al_u1025_o,\u_vram/axis_y_d2 [6]}),
    .c({\u_vram/axis_y_d2 [10],\u_vram/axis_y_d2 [7]}),
    .clk(vga_clk_pad),
    .d(\u_vram/axis_y_d2 [9:8]),
    .mi({\u_vram/axis_y_d1 [10],\u_vram/axis_y_d1 [5]}),
    .f({_al_u1026_o,_al_u1025_o}),
    .q({\u_vram/axis_y_d2 [10],\u_vram/axis_y_d2 [5]}));  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  // sources/rtl/vga/vram.v(110)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*~D)"),
    //.LUT1("(~C*~B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000000011),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/reg8_b1|u_vram/reg8_b2  (
    .b({\u_vram/axis_y_d2 [0],\u_vram/axis_y_d2 [3]}),
    .c({\u_vram/axis_y_d2 [1],\u_vram/axis_y_d2 [4]}),
    .clk(vga_clk_pad),
    .d({_al_u578_o,\u_vram/axis_y_d2 [2]}),
    .mi({\u_vram/axis_y_d1 [1],\u_vram/axis_y_d1 [2]}),
    .f({\u_vram/n23_lutinv ,_al_u578_o}),
    .q({\u_vram/axis_y_d2 [1],\u_vram/axis_y_d2 [2]}));  // sources/rtl/vga/vram.v(110)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTG0("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_vram/reg9_b10  (
    .c({open_n16600,\u_vram/state }),
    .clk(vga_clk_pad),
    .d({open_n16602,\u_vram/n26[11]_d }),
    .sr(\u_vram/mux3_b10_sel_is_3_o ),
    .q({open_n16624,vga_rgb_pad[19]}));  // sources/rtl/vga/vram.v(144)
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
    .do({open_n16625,open_n16626,open_n16627,\u_vram/n26[11]_d }),
    .osclk(vga_clk_pad),
    .rst(\u_vram/mux3_b10_sel_is_3_o ),
    .opad(vga_rgb[11]));  // sources/rtl/vga/vram.v(144)
  // sources/rtl/vga/vram.v(144)
  // sources/rtl/vga/vram.v(144)
  EG_PHY_MSLICE #(
    //.LUT0("~(~C*~B*~(D*~A))"),
    //.LUT1("~(~C*~D)"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111110111111100),
    .INIT_LUT1(16'b1111111111110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_vram/reg9_b13|u_vram/reg9_b12  (
    .a({open_n16639,\u_vram/n26[11]_d }),
    .b({open_n16640,_al_u1026_o}),
    .c({\u_vram/state ,\u_vram/n18_lutinv }),
    .clk(vga_clk_pad),
    .d({\u_vram/n26[11]_d ,\u_vram/state }),
    .sr(\u_vram/mux3_b12_sel_is_1_o ),
    .q({vga_rgb_pad[13],vga_rgb_pad[21]}));  // sources/rtl/vga/vram.v(144)
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/sub1/u0|u_vram/sub1/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("SUB_CARRY"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000000101),
    .INIT_LUT1(16'b1001100110011010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_vram/sub1/u0|u_vram/sub1/ucin  (
    .a({axis_y[5],1'b0}),
    .b({1'b1,open_n16659}),
    .clk(vga_clk_pad),
    .mi({open_n16675,\u_vga/n21 [5]}),
    .sr(\u_vga/n13 ),
    .f({\u_vram/n4 [0],open_n16676}),
    .fco(\u_vram/sub1/c1 ),
    .q({open_n16679,axis_y[5]}));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/sub1/u0|u_vram/sub1/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("SUB"),
    .INIT_LUT0(16'b1001100110011010),
    .INIT_LUT1(16'b1001100110011010),
    .MODE("RIPPLE"))
    \u_vram/sub1/u2|u_vram/sub1/u1  (
    .a(axis_y[7:6]),
    .b(2'b00),
    .fci(\u_vram/sub1/c1 ),
    .f(\u_vram/n4 [2:1]),
    .fco(\u_vram/sub1/c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_vram/sub1/u0|u_vram/sub1/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("SUB"),
    .INIT_LUT0(16'b1001100110011010),
    .INIT_LUT1(16'b1001100110011010),
    .MODE("RIPPLE"))
    \u_vram/sub1/u4|u_vram/sub1/u3  (
    .a(axis_y[9:8]),
    .b(2'b00),
    .fci(\u_vram/sub1/c3 ),
    .f(\u_vram/n4 [4:3]));
  // sources/rtl/vga/vram.v(123)
  // sources/rtl/vga/vram.v(123)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_vram/vs_i_d1_reg|u_vram/vs_i_d2_reg  (
    .clk(vga_clk_pad),
    .mi({\u_vram/vs_i_d0 ,\u_vram/vs_i_d1 }),
    .q({\u_vram/vs_i_d1 ,\u_vram/vs_i_d2 }));  // sources/rtl/vga/vram.v(123)
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
    .do({open_n16750,open_n16751,open_n16752,\u_vram/vs_i_d2 }),
    .osclk(vga_clk_pad),
    .opad(vga_vs));  // sources/rtl/vga/vram.v(152)

endmodule 

