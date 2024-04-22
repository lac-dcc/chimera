library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package wishbonepkg is

constant CTI_CYCLE_CLASSIC:     std_logic_vector(2 downto 0) := "000";
constant CTI_CYCLE_CONSTADDR:   std_logic_vector(2 downto 0) := "001";
constant CTI_CYCLE_INCRADDR:    std_logic_vector(2 downto 0) := "010";
constant CTI_CYCLE_ENDOFBURST:  std_logic_vector(2 downto 0) := "111";

constant BTE_BURST_LINEAR:      std_logic_vector(1 downto 0) := "00";
constant BTE_BURST_4BEATWRAP:   std_logic_vector(1 downto 0) := "01";
constant BTE_BURST_8BEATWRAP:   std_logic_vector(1 downto 0) := "10";
constant BTE_BURST_16BEATWRAP:  std_logic_vector(1 downto 0) := "11";

type wb_p_miso_type is record
    ack:   std_logic;
    dat:   std_logic_vector(31 downto 0);
    tag:   std_logic_vector(31 downto 0);
    int:   std_logic;
    err:   std_logic;
    rty:   std_logic;
    stall: std_logic;
end record;

type wb_miso_type is record
    ack:   std_logic;
    dat:   std_logic_vector(31 downto 0);
    tag:   std_logic_vector(31 downto 0);
    int:   std_logic;
    err:   std_logic;
    rty:   std_logic;
end record;

type wb_mosi_type is record
    dat:      std_logic_vector(31 downto 0);
    adr:      std_logic_vector(31 downto 0);
    tag:      std_logic_vector(31 downto 0);
    cyc:      std_logic;
    stb:      std_logic;
    sel:      std_logic_vector(3 downto 0);
    cti:      std_logic_vector(2 downto 0);
    bte:      std_logic_vector(1 downto 0);
    we:       std_logic;
end record;

type wb_syscon_type is record
  clk:  std_logic;
  rst:  std_logic;
end record;


end wishbonepkg;
