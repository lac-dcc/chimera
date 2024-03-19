/**
Descripcion,
Testbench simple para vgaHdmi,
sirve para verificar que las senales de hsync y vsync se envíen correctamente.

-----------------------------------------------------------------------------
Author : Nicolas Hasbun, nhasbun@gmail.com
File   : vgaHdmi_TB.v
Create : 2017-06-15 15:44:30
Editor : sublime text3, tab size (2)
-----------------------------------------------------------------------------
*/

`timescale 1ns / 1ps
module vgaHdmi_tb;

//Internal signals declarations:
reg clock, clock50;
reg reset;
reg switchR, switchG, switchB;
wire hsync;
wire vsync;
wire dataEnable;
wire vgaClock;
wire [23:0] RGBchannel;

// Unit Under Test port map
vgaHdmi UUT (
  // input
  .clock  (clock),
  .clock50(clock50),
	.reset  (reset),
	.hsync  (hsync),
	.vsync  (vsync),

  // output
  .switchR   (switchR),
  .switchG   (switchG),
  .switchB   (switchB),
	.dataEnable(dataEnable),
  .vgaClock  (vgaClock),
  .RGBchannel(RGBchannel)
  );

initial begin
  clock   = 0;
  reset   = 1;
  switchR = 0;
  switchG = 0;
  switchB = 0;
  #10;
  reset = 0;
  forever begin
    clock = ~clock;
    #10;
  end
end

initial begin
  clock50 = 0;
  #10;
  forever begin
    clock50 = ~clock50;
    #5;
  end
end

endmodule
