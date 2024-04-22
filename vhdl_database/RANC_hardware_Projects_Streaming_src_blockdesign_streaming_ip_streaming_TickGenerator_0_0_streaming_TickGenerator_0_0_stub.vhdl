-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Wed May 22 14:40:42 2019
-- Host        : ENGR-RCL11G running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top streaming_TickGenerator_0_0 -prefix
--               streaming_TickGenerator_0_0_ streaming_TickGenerator_0_1_stub.vhdl
-- Design      : streaming_TickGenerator_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu9eg-ffvb1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity streaming_TickGenerator_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    en : in STD_LOGIC;
    tick : out STD_LOGIC;
    intr : out STD_LOGIC
  );

end streaming_TickGenerator_0_0;

architecture stub of streaming_TickGenerator_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,en,tick,intr";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "TickGenerator,Vivado 2018.2";
begin
end;
