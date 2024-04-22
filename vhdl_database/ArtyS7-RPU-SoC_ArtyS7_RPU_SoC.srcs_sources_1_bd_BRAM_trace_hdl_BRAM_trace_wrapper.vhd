--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
--Date        : Tue Dec 11 12:52:42 2018
--Host        : rainbowdash running 64-bit major release  (build 9200)
--Command     : generate_target BRAM_trace_wrapper.bd
--Design      : BRAM_trace_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BRAM_trace_wrapper is
  port (
    addra_0 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    addrb_0 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    clka_0 : in STD_LOGIC;
    clkb_0 : in STD_LOGIC;
    dina_0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    dinb_0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    douta_0 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    doutb_0 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    ena_0 : in STD_LOGIC;
    enb_0 : in STD_LOGIC;
    wea_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    web_0 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end BRAM_trace_wrapper;

architecture STRUCTURE of BRAM_trace_wrapper is
  component BRAM_trace is
  port (
    addra_0 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    clka_0 : in STD_LOGIC;
    dina_0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    douta_0 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    ena_0 : in STD_LOGIC;
    wea_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    addrb_0 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    clkb_0 : in STD_LOGIC;
    dinb_0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    doutb_0 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    enb_0 : in STD_LOGIC;
    web_0 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component BRAM_trace;
begin
BRAM_trace_i: component BRAM_trace
     port map (
      addra_0(11 downto 0) => addra_0(11 downto 0),
      addrb_0(11 downto 0) => addrb_0(11 downto 0),
      clka_0 => clka_0,
      clkb_0 => clkb_0,
      dina_0(63 downto 0) => dina_0(63 downto 0),
      dinb_0(63 downto 0) => dinb_0(63 downto 0),
      douta_0(63 downto 0) => douta_0(63 downto 0),
      doutb_0(63 downto 0) => doutb_0(63 downto 0),
      ena_0 => ena_0,
      enb_0 => enb_0,
      wea_0(0) => wea_0(0),
      web_0(0) => web_0(0)
    );
end STRUCTURE;
