//---------------------------------------------------------------------------   
// File:        dpbram.v
// Author:      Zhangxi Tan
// Description: Modified for 2GB dual-rank SODIMMs 
//------------------------------------------------------------------------------  

`timescale 1ns / 1ps

// © Copyright Microsoft Corporation, 2008


// A 1K x 36 dual-ported block ram.  This is a wrapper around RAMB36

module dpbram36_im(wda, rda, aa, wea, ena, clka, wdb, rdb, ab, web, enb, clkb);
//port A
  input [35:0] wda;  //write data, port A
  output [35:00] rda; //read data, port A
  input [9:0] aa; //address, port A
  input wea; //write enable, port A
  input ena; //port A enable
  input clka; //clock, port A
//port B
  input [35:0] wdb;  //write data, port B
  output [35:00] rdb; //read data, port B
  input [9:0] ab;  //address, port B
  input web; //write enable, port B
  input enb; //port B enable
  input clkb; //clock, port B


RAMB36 #(
.DOA_REG(0), // Optional output registers on A port (0 or 1)
.DOB_REG(0), // Optional output registers on B port (0 or 1)
.INIT_A(36'h000000000), // Initial values on A output port
.INIT_B(36'h000000000), // Initial values on B output port
.RAM_EXTENSION_A("NONE"), // "UPPER", "LOWER" or "NONE" when cascaded
.RAM_EXTENSION_B("NONE"), // "UPPER", "LOWER" or "NONE" when cascaded
.READ_WIDTH_A(36), // Valid values are 1, 2, 4, 9, 18, or 36
.READ_WIDTH_B(36), // Valid values are 1, 2, 4, 9, 18, or 36
.SIM_COLLISION_CHECK("ALL"), // Collision check enable "ALL", "WARNING_ONLY",
// "GENERATE_X_ONLY" or "NONE"
.SRVAL_A(36'h000000000), // Set/Reset value for A port output
.SRVAL_B(36'h000000000), // Set/Reset value for B port output
.WRITE_MODE_A("WRITE_FIRST"), // "WRITE_FIRST", "READ_FIRST", or "NO_CHANGE"
.WRITE_MODE_B("WRITE_FIRST"), // "WRITE_FIRST", "READ_FIRST", or "NO_CHANGE"
.WRITE_WIDTH_A(36), // Valid values are 1, 2, 4, 9, 18, or 36
.WRITE_WIDTH_B(36) // Valid values are 1, 2, 4, 9, 18, or 36
) RAMB36_im (
.CASCADEOUTLATA(), // 1-bit cascade A latch output
.CASCADEOUTLATB(), // 1-bit cascade B latch output
.CASCADEOUTREGA(), // 1-bit cascade A register output
.CASCADEOUTREGB(), // 1-bit cascade B register output
.DOA(rda[31:00]), // 32-bit A port data output
.DOB(rdb[31:00]), // 32-bit B port data output
.DOPA(rda[35:32]), // 4-bit A port parity data output
.DOPB(rdb[35:32]), // 4-bit B port parity data output
.ADDRA({1'b0, aa, 5'b00000}), // 16-bit A port address input
.ADDRB({1'b0, ab, 5'b00000}), // 16-bit B port address input
.CASCADEINLATA(), // 1-bit cascade A latch input
.CASCADEINLATB(), // 1-bit cascade B latch input
.CASCADEINREGA(), // 1-bit cascade A register input
.CASCADEINREGB(), // 1-bit cascade B register input
.CLKA(clka), // 1-bit A port clock input
.CLKB(clkb), // 1-bit B port clock input
.DIA(wda[31:00]), // 32-bit A port data input
.DIB(wdb[31:00]), // 32-bit B port data input
.DIPA(wda[35:32]), // 4-bit A port parity data input
.DIPB(wdb[35:32]), // 4-bit B port parity data input
.ENA(ena), // 1-bit A port enable input
.ENB(enb), // 1-bit B port enable input
.REGCEA(1'b0), // 1-bit A port register enable input (registers not used)
.REGCEB(1'b0), // 1-bit B port register enable input
.SSRA(1'b0), // 1-bit A port set/reset input
.SSRB(1'b0), // 1-bit B port set/reset input
.WEA({wea, wea, wea, wea}), // 4-bit A port write enable input
.WEB({web, web, web, web}) // 4-bit B port write enable input
);

`include "im_mem.v"
endmodule

module dpbram18_rfa(wda, aa, wea, ena, clka, rdb, ab,  enb, clkb);
//port A
  input [35:0] wda;  //write data, port A
//  output [35:00] rda; //read data, port A
  input [8:0] aa; //address, port A
  input wea; //write enable, port A
  input ena; //port A enable
  input clka; //clock, port A
//port B
//  input [35:0] wdb;  //write data, port B
  output [35:00] rdb; //read data, port B
  input [8:0] ab;  //address, port B
//  input web; //write enable, port B
  input enb; //port B enable
  input clkb; //clock, port B


RAMB18SDP #(
.DO_REG(0) // Optional output registers on the output port (0 or 1)
) RAMB18_rfa (
.DO(rdb[31:00]), // 32-bit B port data output
.DOP(rdb[35:32]), // 4-bit B port parity data output
.WRADDR(aa), // 16-bit A port address input
.RDADDR(ab), // 16-bit B port address input
.WRCLK(clka), // 1-bit A port clock input
.RDCLK(clkb), // 1-bit B port clock input
.DI(wda[31:00]), // 32-bit A port data input
.DIP(wda[35:32]), // 4-bit A port parity data input
.WREN(ena), // 1-bit A port enable input
.RDEN(enb), // 1-bit B port enable input
.REGCE(1'b0), // 1-bit B port register enable input
.SSR(1'b0), // 1-bit B port set/reset input
.WE({wea, wea, wea, wea}) // 4-bit A port write enable input
);

`include "rfa_mem.v"
endmodule


module dpbram18_rfb(wda, aa, wea, ena, clka, rdb, ab,  enb, clkb);
//port A
  input [35:0] wda;  //write data, port A
//  output [35:00] rda; //read data, port A
  input [8:0] aa; //address, port A
  input wea; //write enable, port A
  input ena; //port A enable
  input clka; //clock, port A
//port B
//  input [35:0] wdb;  //write data, port B
  output [35:00] rdb; //read data, port B
  input [8:0] ab;  //address, port B
//  input web; //write enable, port B
  input enb; //port B enable
  input clkb; //clock, port B


RAMB18SDP #(
.DO_REG(0) // Optional output registers on the output port (0 or 1)
) RAMB18_rfb (
.DO(rdb[31:00]), // 32-bit B port data output
.DOP(rdb[35:32]), // 4-bit B port parity data output
.WRADDR(aa), // 16-bit A port address input
.RDADDR(ab), // 16-bit B port address input
.WRCLK(clka), // 1-bit A port clock input
.RDCLK(clkb), // 1-bit B port clock input
.DI(wda[31:00]), // 32-bit A port data input
.DIP(wda[35:32]), // 4-bit A port parity data input
.WREN(ena), // 1-bit A port enable input
.RDEN(enb), // 1-bit B port enable input
.REGCE(1'b0), // 1-bit B port register enable input
.SSR(1'b0), // 1-bit B port set/reset input
.WE({wea, wea, wea, wea}) // 4-bit A port write enable input
);

`include "rfb_mem.v"
endmodule