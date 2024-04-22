--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
--Date        : Fri Dec 14 15:28:45 2018
--Host        : rainbowdash running 64-bit major release  (build 9200)
--Command     : generate_target clk_main_wrapper.bd
--Design      : clk_main_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_main_wrapper is
  port (
    clk_100MHz_0 : out STD_LOGIC;
    clk_200MHz_0 : out STD_LOGIC;
    clk_core_0 : out STD_LOGIC;
    clk_in1_0 : in STD_LOGIC;
    locked_0 : out STD_LOGIC;
    reset_0 : in STD_LOGIC
  );
end clk_main_wrapper;

architecture STRUCTURE of clk_main_wrapper is
  component clk_main is
  port (
    reset_0 : in STD_LOGIC;
    clk_in1_0 : in STD_LOGIC;
    locked_0 : out STD_LOGIC;
    clk_100MHz_0 : out STD_LOGIC;
    clk_200MHz_0 : out STD_LOGIC;
    clk_core_0 : out STD_LOGIC
  );
  end component clk_main;
begin
clk_main_i: component clk_main
     port map (
      clk_100MHz_0 => clk_100MHz_0,
      clk_200MHz_0 => clk_200MHz_0,
      clk_core_0 => clk_core_0,
      clk_in1_0 => clk_in1_0,
      locked_0 => locked_0,
      reset_0 => reset_0
    );
end STRUCTURE;
