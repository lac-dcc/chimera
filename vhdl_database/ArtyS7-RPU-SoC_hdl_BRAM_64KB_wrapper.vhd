--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
--Date        : Sat Jun 23 23:48:53 2018
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BRAM_64KB_wrapper is
  port (
    I_addra : in STD_LOGIC_VECTOR ( 31 downto 0 );
    I_addrb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    I_clka : in STD_LOGIC;
    I_clkb : in STD_LOGIC;
    I_dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    I_dinb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    I_ena : in STD_LOGIC;
    I_enb : in STD_LOGIC;
    I_wea : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I_web : in STD_LOGIC_VECTOR ( 3 downto 0 );
    O_douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    O_doutb : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end BRAM_64KB_wrapper;

architecture STRUCTURE of BRAM_64KB_wrapper is
  component BRAM_64KB is
  port (
    I_addra : in STD_LOGIC_VECTOR ( 31 downto 0 );
    I_clka : in STD_LOGIC;
    I_dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    O_douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    I_ena : in STD_LOGIC;
    I_wea : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I_addrb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    I_clkb : in STD_LOGIC;
    I_dinb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    O_doutb : out STD_LOGIC_VECTOR ( 31 downto 0 );
    I_enb : in STD_LOGIC;
    I_web : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component BRAM_64KB;
  
  signal outa : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal outb : STD_LOGIC_VECTOR ( 31 downto 0 );
    
begin
BRAM_64KB_i: component BRAM_64KB
     port map (
      I_addra(31 downto 0) => I_addra(31 downto 0),
      I_addrb(31 downto 0) => I_addrb(31 downto 0),
      I_clka => I_clka,
      I_clkb => I_clkb,
      I_dina(31 downto 0) => I_dina(31 downto 0),
      I_dinb(31 downto 0) => I_dinb(31 downto 0),
      I_ena => I_ena,
      I_enb => I_enb,
      I_wea(3 downto 0) => I_wea(3 downto 0),
      I_web(3 downto 0) => I_web(3 downto 0),
      O_douta(31 downto 0) => outa(31 downto 0),
      O_doutb(31 downto 0) => outb(31 downto 0)
    );
    
    O_douta <= outa when (I_ena='1') else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    O_doutb <= outb when (I_enb='1') else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
        
end STRUCTURE;
