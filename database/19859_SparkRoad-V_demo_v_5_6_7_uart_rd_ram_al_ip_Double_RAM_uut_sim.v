// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

// Verilog netlist created by TD v4.6.12906
// Tue Jul 23 20:06:14 2019

`timescale 1ns / 1ps
module Double_RAM_uut  // al_ip/Double_RAM_uut.v(14)
  (
  addra,
  addrb,
  ceb,
  clka,
  clkb,
  dia,
  dob
  );

  input [7:0] addra;  // al_ip/Double_RAM_uut.v(23)
  input [7:0] addrb;  // al_ip/Double_RAM_uut.v(24)
  input ceb;  // al_ip/Double_RAM_uut.v(25)
  input clka;  // al_ip/Double_RAM_uut.v(26)
  input clkb;  // al_ip/Double_RAM_uut.v(27)
  input [7:0] dia;  // al_ip/Double_RAM_uut.v(22)
  output [7:0] dob;  // al_ip/Double_RAM_uut.v(19)


  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  // address_offset=0;data_offset=0;depth=256;width=8;num_section=1;width_per_section=8;section_size=8;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEAMUX("1"),
    .CSA0("1"),
    .CSA1("1"),
    .CSA2("1"),
    .CSB0("1"),
    .CSB1("1"),
    .CSB2("1"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("0"),
    .RSTBMUX("0"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_256x8_sub_000000_000 (
    .addra({2'b00,addra,3'b111}),
    .addrb({2'b00,addrb,3'b111}),
    .ceb(ceb),
    .clka(clka),
    .clkb(clkb),
    .dia({open_n54,dia}),
    .dob({open_n79,dob}));

endmodule 

