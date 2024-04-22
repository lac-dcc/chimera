library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;

entity tb is
end entity;

architecture sim of tb is
  signal clk: std_ulogic :='0';
  signal rst: std_ulogic :='0';
  signal dispclk: std_ulogic := '0';


  signal CLKPERIOD: time := 10 ns;
  signal DISPLAYPERIOD: time := 31.25 ns;

  component zpuino_rgbctrl is
  generic (
      WIDTH_BITS: integer := 5
  );
  port (
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;
    wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
    wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
    wb_adr_i: in std_logic_vector(maxIObit downto minIObit);
    wb_we_i:  in std_logic;
    wb_cyc_i: in std_logic;
    wb_stb_i: in std_logic;
    wb_ack_o: out std_logic;
    wb_inta_o:out std_logic;
    --id:       out slot_id;

    displayclk: in std_logic;
    -- RGB outputters

    R:        out std_logic_vector(1 downto 0);
    G:        out std_logic_vector(1 downto 0);
    B:        out std_logic_vector(1 downto 0);

    COL:      out std_logic_vector(3 downto 0);

    CLK:      out std_logic;
    STB:      out std_logic;
    OE:       out std_logic
  );
  end component zpuino_rgbctrl;

  component rgb32 is
  port (
    R:        in std_logic;
    G:        in std_logic;
    B:        in std_logic;

    Ro:       out std_logic_vector(31 downto 0);
    Go:       out std_logic_vector(31 downto 0);
    Bo:       out std_logic_vector(31 downto 0);

    CLK:      in std_logic;
    STB:      in std_logic;
    OE:       in std_logic
  );
  end component rgb32;

  signal R,G,B: std_logic_vector(1 downto 0);
  signal DPCLK, DPSTB, DPOE: std_logic;
  signal COL: std_logic_vector(3 downto 0);

  signal Ro0,Ro1:       std_logic_vector(31 downto 0);
  signal Go0,Go1:       std_logic_vector(31 downto 0);
  signal Bo0,Bo1:       std_logic_vector(31 downto 0);

begin

  dispclk <= not dispclk after DISPLAYPERIOD/2;
  clk <= not clk after CLKPERIOD/2;


  ctrl: zpuino_rgbctrl
  generic map (
    WIDTH_BITS => 6
    )
  port map (
    wb_clk_i  => clk,
	 	wb_rst_i  => rst,
    wb_dat_i  => (others => '0'),
    wb_adr_i  => (others => '0'),
    wb_we_i   => '0',
    wb_cyc_i  => '0',
    wb_stb_i  => '0',
    wb_ack_o  => open,
    wb_inta_o => open,
    --id        => open,

    displayclk  => dispclk,

    -- RGB outputters

    R         => R,
    G         => G,
    B         => B,

    COL       => COL,

    CLK       => DPCLK,
    STB       => DPSTB,
    OE        => DPOE
  );

    rgb0: rgb32
      port map (
        R => R(0),
        G => G(0),
        B => B(0),
        Ro  => Ro0,
        Go  => Go1,
        Bo  => Bo1,
    
        CLK => DPCLK,
        STB => DPSTB,
        OE  => DPOE
      );

    rgb1: rgb32
      port map (
        R => R(1),
        G => G(1),
        B => B(1),
        Ro  => Ro1,
        Go  => Go1,
        Bo  => Bo1,
    
        CLK => DPCLK,
        STB => DPSTB,
        OE  => DPOE
      );

  


end sim;
