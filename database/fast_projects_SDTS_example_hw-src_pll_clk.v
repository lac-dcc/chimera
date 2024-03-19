`timescale 1ns/1ns
module pll_clk(
   clk_125m_sys,
   clk_125m_core,
   clk_25m_core,
   clk_125m_tx0_7,
   clk_125m_tx8_15,
   clk_25m_tx,
	clk_12m_5_mdio
  );
  input clk_125m_sys;
  output clk_125m_tx0_7;
  output clk_125m_core;
  output clk_25m_core;
  output clk_125m_tx8_15;
  output clk_25m_tx;
  output clk_12m_5_mdio;
wire clk_125m_tx0_7;
wire clk_125m_core;
wire clk_25m_core;
wire clk_125m_tx8_15;
wire clk_25m_tx;
wire clk_12m_5_mdio;
pll_0 pll_0(
	.inclk0(clk_125m_sys),//125M  sys
	.c0(clk_125m_core),
	.c1(clk_25m_core),
	.c2(clk_125m_tx0_7),//port tx clk 0-7;
	.c3(clk_125m_tx8_15),//port tx clk 8-15;
	.c4(clk_25m_tx),
	.c5(clk_12m_5_mdio),
	.locked());   
endmodule 