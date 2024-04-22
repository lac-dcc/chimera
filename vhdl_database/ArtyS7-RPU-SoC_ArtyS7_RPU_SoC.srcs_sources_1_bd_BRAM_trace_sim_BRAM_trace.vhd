--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
--Date        : Tue Dec 11 12:52:42 2018
--Host        : rainbowdash running 64-bit major release  (build 9200)
--Command     : generate_target BRAM_trace.bd
--Design      : BRAM_trace
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BRAM_trace is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of BRAM_trace : entity is "BRAM_trace,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=BRAM_trace,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of BRAM_trace : entity is "BRAM_trace.hwdef";
end BRAM_trace;

architecture STRUCTURE of BRAM_trace is
  component BRAM_trace_blk_mem_gen_0_0 is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 63 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 63 downto 0 );
    clkb : in STD_LOGIC;
    enb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 0 to 0 );
    addrb : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 63 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  end component BRAM_trace_blk_mem_gen_0_0;
  signal addra_0_1 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal addrb_0_1 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal blk_mem_gen_0_douta : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal blk_mem_gen_0_doutb : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal clka_0_1 : STD_LOGIC;
  signal clkb_0_1 : STD_LOGIC;
  signal dina_0_1 : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal dinb_0_1 : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal ena_0_1 : STD_LOGIC;
  signal enb_0_1 : STD_LOGIC;
  signal wea_0_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal web_0_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clka_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLKA_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clka_0 : signal is "XIL_INTERFACENAME CLK.CLKA_0, CLK_DOMAIN BRAM_trace_clka_0, FREQ_HZ 100000000, PHASE 0.000";
  attribute X_INTERFACE_INFO of clkb_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLKB_0 CLK";
  attribute X_INTERFACE_PARAMETER of clkb_0 : signal is "XIL_INTERFACENAME CLK.CLKB_0, CLK_DOMAIN BRAM_trace_clkb_0, FREQ_HZ 100000000, PHASE 0.000";
begin
  addra_0_1(11 downto 0) <= addra_0(11 downto 0);
  addrb_0_1(11 downto 0) <= addrb_0(11 downto 0);
  clka_0_1 <= clka_0;
  clkb_0_1 <= clkb_0;
  dina_0_1(63 downto 0) <= dina_0(63 downto 0);
  dinb_0_1(63 downto 0) <= dinb_0(63 downto 0);
  douta_0(63 downto 0) <= blk_mem_gen_0_douta(63 downto 0);
  doutb_0(63 downto 0) <= blk_mem_gen_0_doutb(63 downto 0);
  ena_0_1 <= ena_0;
  enb_0_1 <= enb_0;
  wea_0_1(0) <= wea_0(0);
  web_0_1(0) <= web_0(0);
blk_mem_gen_0: component BRAM_trace_blk_mem_gen_0_0
     port map (
      addra(11 downto 0) => addra_0_1(11 downto 0),
      addrb(11 downto 0) => addrb_0_1(11 downto 0),
      clka => clka_0_1,
      clkb => clkb_0_1,
      dina(63 downto 0) => dina_0_1(63 downto 0),
      dinb(63 downto 0) => dinb_0_1(63 downto 0),
      douta(63 downto 0) => blk_mem_gen_0_douta(63 downto 0),
      doutb(63 downto 0) => blk_mem_gen_0_doutb(63 downto 0),
      ena => ena_0_1,
      enb => enb_0_1,
      wea(0) => wea_0_1(0),
      web(0) => web_0_1(0)
    );
end STRUCTURE;
