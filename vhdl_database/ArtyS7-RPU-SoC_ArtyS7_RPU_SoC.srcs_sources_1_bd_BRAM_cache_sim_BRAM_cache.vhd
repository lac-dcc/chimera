--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
--Date        : Wed Aug 26 11:27:24 2020
--Host        : rainbowdash running 64-bit major release  (build 9200)
--Command     : generate_target BRAM_cache.bd
--Design      : BRAM_cache
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BRAM_cache is
  port (
    addra_0 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    addrb_0 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    clka_0 : in STD_LOGIC;
    clkb_0 : in STD_LOGIC;
    dina_0 : in STD_LOGIC_VECTOR ( 255 downto 0 );
    dinb_0 : in STD_LOGIC_VECTOR ( 255 downto 0 );
    douta_0 : out STD_LOGIC_VECTOR ( 255 downto 0 );
    doutb_0 : out STD_LOGIC_VECTOR ( 255 downto 0 );
    ena_0 : in STD_LOGIC;
    enb_0 : in STD_LOGIC;
    wea_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    web_0 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute core_generation_info : string;
  attribute core_generation_info of BRAM_cache : entity is "BRAM_cache,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=BRAM_cache,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute hw_handoff : string;
  attribute hw_handoff of BRAM_cache : entity is "BRAM_cache.hwdef";
end BRAM_cache;

architecture STRUCTURE of BRAM_cache is
  component BRAM_cache_blk_mem_gen_0_0 is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 6 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 255 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 255 downto 0 );
    clkb : in STD_LOGIC;
    enb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 0 to 0 );
    addrb : in STD_LOGIC_VECTOR ( 6 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 255 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 255 downto 0 )
  );
  end component BRAM_cache_blk_mem_gen_0_0;
  signal addra_0_1 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal addrb_0_1 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal blk_mem_gen_0_douta : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal blk_mem_gen_0_doutb : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal clka_0_1 : STD_LOGIC;
  signal clkb_0_1 : STD_LOGIC;
  signal dina_0_1 : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal dinb_0_1 : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal ena_0_1 : STD_LOGIC;
  signal enb_0_1 : STD_LOGIC;
  signal wea_0_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal web_0_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute x_interface_info : string;
  attribute x_interface_info of clka_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLKA_0 CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clka_0 : signal is "XIL_INTERFACENAME CLK.CLKA_0, CLK_DOMAIN BRAM_cache_clka_0, FREQ_HZ 100000000, PHASE 0.000";
  attribute x_interface_info of clkb_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLKB_0 CLK";
  attribute x_interface_parameter of clkb_0 : signal is "XIL_INTERFACENAME CLK.CLKB_0, CLK_DOMAIN BRAM_cache_clkb_0, FREQ_HZ 100000000, PHASE 0.000";
begin
  addra_0_1(6 downto 0) <= addra_0(6 downto 0);
  addrb_0_1(6 downto 0) <= addrb_0(6 downto 0);
  clka_0_1 <= clka_0;
  clkb_0_1 <= clkb_0;
  dina_0_1(255 downto 0) <= dina_0(255 downto 0);
  dinb_0_1(255 downto 0) <= dinb_0(255 downto 0);
  douta_0(255 downto 0) <= blk_mem_gen_0_douta(255 downto 0);
  doutb_0(255 downto 0) <= blk_mem_gen_0_doutb(255 downto 0);
  ena_0_1 <= ena_0;
  enb_0_1 <= enb_0;
  wea_0_1(0) <= wea_0(0);
  web_0_1(0) <= web_0(0);
blk_mem_gen_0: component BRAM_cache_blk_mem_gen_0_0
     port map (
      addra(6 downto 0) => addra_0_1(6 downto 0),
      addrb(6 downto 0) => addrb_0_1(6 downto 0),
      clka => clka_0_1,
      clkb => clkb_0_1,
      dina(255 downto 0) => dina_0_1(255 downto 0),
      dinb(255 downto 0) => dinb_0_1(255 downto 0),
      douta(255 downto 0) => blk_mem_gen_0_douta(255 downto 0),
      doutb(255 downto 0) => blk_mem_gen_0_doutb(255 downto 0),
      ena => ena_0_1,
      enb => enb_0_1,
      wea(0) => wea_0_1(0),
      web(0) => web_0_1(0)
    );
end STRUCTURE;
