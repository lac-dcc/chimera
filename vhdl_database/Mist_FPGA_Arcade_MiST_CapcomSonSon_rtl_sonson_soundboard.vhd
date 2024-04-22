library ieee;

use work.pace_pkg.all;

use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
library work;

entity sonson_soundboard is
port(
  clkrst_i     : in from_CLKRST_t;
  sound_irq    : in std_logic;
  sound_data   : in std_logic_vector(7 downto 0);
  audio_out_l  : out std_logic_vector(9 downto 0);
  audio_out_r  : out std_logic_vector(9 downto 0);
  snd_rom_addr : out std_logic_vector(12 downto 0);
  snd_rom_do   : in std_logic_vector(7 downto 0)
  );
  
end sonson_soundboard;

architecture SYN of sonson_soundboard is

  COMPONENT mc6809i
  GENERIC ( ILLEGAL_INSTRUCTIONS : STRING := "GHOST" );
  PORT
  (
    D		:	 IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    DOut		:	 OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    ADDR		:	 OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    RnW		:	 OUT STD_LOGIC;
    E		:	 IN STD_LOGIC;
    Q		:	 IN STD_LOGIC;
    BS		:	 OUT STD_LOGIC;
    BA		:	 OUT STD_LOGIC;
    nIRQ		:	 IN STD_LOGIC;
    nFIRQ		:	 IN STD_LOGIC;
    nNMI		:	 IN STD_LOGIC;
    AVMA		:	 OUT STD_LOGIC;
    BUSY		:	 OUT STD_LOGIC;
    LIC		:	 OUT STD_LOGIC;
    nHALT		:	 IN STD_LOGIC;
    nRESET		:	 IN STD_LOGIC;
    nDMABREQ		:	 IN STD_LOGIC;
    RegData		:	 OUT STD_LOGIC_VECTOR(111 DOWNTO 0)
  );
END COMPONENT;

  alias clk         : std_logic is clkrst_i.clk(0);
  alias reset       : std_logic is clkrst_i.rst(0);  

  signal clk_E      : std_logic;
  signal clk_Q      : std_logic;
  signal cpu_addr   : std_logic_vector(15 downto 0);
  signal cpu_di     : std_logic_vector( 7 downto 0);
  signal cpu_do     : std_logic_vector( 7 downto 0);
  signal cpu_rw     : std_logic;
  signal cpu_irq    : std_logic;
  signal cpu_ba     : std_logic;
  signal cpu_bs     : std_logic;

  signal wram_cs    : std_logic;
  signal wram_we    : std_logic;
  signal wram_do    : std_logic_vector( 7 downto 0);
 
  signal rom_cs     : std_logic;
  signal snd_rd     : std_logic;

  signal clk_en_snd    : std_logic; -- 1.5 MHz
  signal ay1_cs        : std_logic;
  signal ay1_chan_a    : std_logic_vector(7 downto 0);
  signal ay1_chan_b    : std_logic_vector(7 downto 0);
  signal ay1_chan_c    : std_logic_vector(7 downto 0);
  signal ay1_do        : std_logic_vector(7 downto 0);
  signal ay1_port_b_do : std_logic_vector(7 downto 0);
 
  signal ay2_cs        : std_logic;
  signal ay2_chan_a    : std_logic_vector(7 downto 0);
  signal ay2_chan_b    : std_logic_vector(7 downto 0);
  signal ay2_chan_c    : std_logic_vector(7 downto 0);
  signal ay2_do        : std_logic_vector(7 downto 0);

begin

  -- cs
  snd_rd    <= '1' when cpu_addr(15 downto 13) = "101" else '0';  -- a000
  wram_cs   <= '1' when cpu_addr(15 downto 13) = "000" else '0';  -- 0000-07ff RAM
  rom_cs    <= '1' when cpu_addr(15 downto 13) = "111" else '0';  -- e000-ffff ROM
  ay1_cs    <= '1' when cpu_addr(15 downto 13) = "001" else '0';  -- 2000
  ay2_cs    <= '1' when cpu_addr(15 downto 13) = "010" else '0';  -- 4000

  -- write enables
  wram_we <=   '1' when cpu_rw = '0' and wram_cs =   '1' else '0';

  -- mux cpu in data between roms/io/wram
  cpu_di <=	wram_do when wram_cs = '1' else
            sound_data when snd_rd = '1' else
            ay1_do when ay1_cs = '1' else
            ay2_do when ay2_cs = '1' else
            snd_rom_do when rom_cs = '1' else X"FF";

  process (clk)
    variable count : unsigned(3 downto 0);
  begin
    if rising_edge(clk) then
      count := count + 1;
      if count(1 downto 0) = "11" then
        case count(3 downto 2) is
        when "00" => clk_E <= '0';
        when "01" => clk_Q <= '1';
        when "10" => clk_E <= '1';
        when "11" => clk_Q <= '0';
        end case;
      end if;

      clk_en_snd <= '0';
      if count = "0000" then
        clk_en_snd <= '1';
      end if;
    end if;
  end process;

  process (clk, reset)
    variable count : unsigned(16 downto 0);
  begin
    if reset = '1' then
      cpu_irq <= '0';
    elsif rising_edge(clk) then
      count := count + 1;
      if count = 100000 then -- 60Hz*4
        cpu_irq <= '1';
        count := (others => '0');
      elsif cpu_ba = '0' and cpu_bs = '1' then
        cpu_irq <= '0';
      end if;
    end if;
  end process;

  cpu_inst : mc6809i
  port map (
    D         => cpu_di,
    DOut      => cpu_do,
    ADDR      => cpu_addr,
    RnW       => cpu_rw,
    E         => clk_E,
    Q         => clk_Q,
    BS        => cpu_bs,
    BA        => cpu_ba,
    nIRQ      => not cpu_irq,
    nFIRQ     => sound_irq,
    nNMI      => '1',
    AVMA      => open,
    BUSY      => open,
    LIC       => open,
    nHALT     => '1',	 
    nRESET    => not reset,
    nDMABREQ  => '1',
    RegData   => open
    );

  snd_rom_addr <= cpu_addr(12 downto 0);	 

  cpu_ram : entity work.spram
	generic map( widthad_a => 11)
  port map(
    clock  	=> clk,
    wren   	=> wram_we,
    address 	=> cpu_addr(10 downto 0),
    data    	=> cpu_do,
    q    		=> wram_do
  );

  ay83910_inst1: work.YM2149
  port map (
    CLK         => clk,
    ENA         => clk_en_snd,
    RESET_L     => not reset,
    I_A8        => '1',
    I_A9_L      => '0',
    I_BDIR      => ay1_cs and not cpu_rw,
    I_BC1       => ay1_cs and not cpu_addr(0) and not cpu_rw,
    I_DA        => cpu_do,
    O_DA        => ay1_do,

    O_AUDIO_L   => audio_out_l,

    I_IOA       => (others => '0'),

    I_IOB       => (others => '0')
    );

  ay83910_inst2: work.YM2149
  port map (
    CLK         => clk,
    ENA         => clk_en_snd,
    RESET_L     => not reset,
    I_A8        => '1',
    I_A9_L      => '0',
    I_BDIR      => ay2_cs and not cpu_rw,
    I_BC1       => ay2_cs and not cpu_addr(0) and not cpu_rw,
    I_DA        => cpu_do,
    O_DA        => ay2_do,

    O_AUDIO_L   => audio_out_r,

    I_IOA       => (others => '0'),

    I_IOB       => (others => '0')
    );

end SYN;