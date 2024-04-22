--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
--Date        : Tue Sep 25 12:53:26 2018
--Host        : rainbowdash running 64-bit major release  (build 9200)
--Command     : generate_target BRAM_64KB.bd
--Design      : BRAM_64KB
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BRAM_64KB is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of BRAM_64KB : entity is "BRAM_64KB,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=BRAM_64KB,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of BRAM_64KB : entity is "BRAM_64KB.hwdef";
end BRAM_64KB;

architecture STRUCTURE of BRAM_64KB is
  component BRAM_64KB_blk_mem_gen_0_0 is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 3 downto 0 );
    addra : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clkb : in STD_LOGIC;
    enb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 3 downto 0 );
    addrb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component BRAM_64KB_blk_mem_gen_0_0;
  signal I_addra_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal I_addrb_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal I_clka_1 : STD_LOGIC;
  signal I_clkb_1 : STD_LOGIC;
  signal I_dina_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal I_dinb_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal I_ena_1 : STD_LOGIC;
  signal I_enb_1 : STD_LOGIC;
  signal I_wea_1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal I_web_1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal blk_mem_gen_0_douta : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal blk_mem_gen_0_doutb : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of I_clka : signal is "xilinx.com:signal:clock:1.0 CLK.I_CLKA CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of I_clka : signal is "XIL_INTERFACENAME CLK.I_CLKA, CLK_DOMAIN BRAM_64KB_I_clka, FREQ_HZ 100000000, PHASE 0.000";
  attribute X_INTERFACE_INFO of I_clkb : signal is "xilinx.com:signal:clock:1.0 CLK.I_CLKB CLK";
  attribute X_INTERFACE_PARAMETER of I_clkb : signal is "XIL_INTERFACENAME CLK.I_CLKB, CLK_DOMAIN BRAM_64KB_I_clkb, FREQ_HZ 100000000, PHASE 0.000";
begin
  I_addra_1(31 downto 0) <= I_addra(31 downto 0);
  I_addrb_1(31 downto 0) <= I_addrb(31 downto 0);
  I_clka_1 <= I_clka;
  I_clkb_1 <= I_clkb;
  I_dina_1(31 downto 0) <= I_dina(31 downto 0);
  I_dinb_1(31 downto 0) <= I_dinb(31 downto 0);
  I_ena_1 <= I_ena;
  I_enb_1 <= I_enb;
  I_wea_1(3 downto 0) <= I_wea(3 downto 0);
  I_web_1(3 downto 0) <= I_web(3 downto 0);
  O_douta(31 downto 0) <= blk_mem_gen_0_douta(31 downto 0);
  O_doutb(31 downto 0) <= blk_mem_gen_0_doutb(31 downto 0);
blk_mem_gen_0: component BRAM_64KB_blk_mem_gen_0_0
     port map (
      addra(31 downto 0) => I_addra_1(31 downto 0),
      addrb(31 downto 0) => I_addrb_1(31 downto 0),
      clka => I_clka_1,
      clkb => I_clkb_1,
      dina(31 downto 0) => I_dina_1(31 downto 0),
      dinb(31 downto 0) => I_dinb_1(31 downto 0),
      douta(31 downto 0) => blk_mem_gen_0_douta(31 downto 0),
      doutb(31 downto 0) => blk_mem_gen_0_doutb(31 downto 0),
      ena => I_ena_1,
      enb => I_enb_1,
      wea(3 downto 0) => I_wea_1(3 downto 0),
      web(3 downto 0) => I_web_1(3 downto 0)
    );
end STRUCTURE;
