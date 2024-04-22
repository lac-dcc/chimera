
use std.textio.ALL;
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_arith.all;
  use ieee.std_logic_unsigned.all;

entity YM2149_TB is
end;

architecture Sim of YM2149_TB is
  component YM2149
    port (
    -- data bus
    I_DA                : in  std_logic_vector(7 downto 0);
    O_DA                : out std_logic_vector(7 downto 0);
    O_DA_OE_L           : out std_logic;
    -- control
    I_A9_L              : in  std_logic;
    I_A8                : in  std_logic;
    I_BDIR              : in  std_logic;
    I_BC2               : in  std_logic;
    I_BC1               : in  std_logic;
    I_SEL_L             : in  std_logic;

    O_AUDIO             : out std_logic_vector(7 downto 0);
    -- port a
    I_IOA               : in  std_logic_vector(7 downto 0);
    O_IOA               : out std_logic_vector(7 downto 0);
    O_IOA_OE_L          : out std_logic;
    -- port b
    I_IOB               : in  std_logic_vector(7 downto 0);
    O_IOB               : out std_logic_vector(7 downto 0);
    O_IOB_OE_L          : out std_logic;

    ENA                 : in  std_logic; -- clock enable for higher speed operation
    RESET_L             : in  std_logic;
    CLK                 : in  std_logic  -- note 6 Mhz
    );
  end component;

  --  signals
  constant CLKPERIOD          : time := 25 ns;
  signal func                 : string(8 downto 1);

  signal clk                  : std_logic;
  signal reset_l              : std_logic;
  signal reset_h              : std_logic;

  signal da_in                : std_logic_vector(7 downto 0);
  signal da_out               : std_logic_vector(7 downto 0);
  signal da_oe_l              : std_logic;
  signal bdir                 : std_logic;
  signal bc2                  : std_logic;
  signal bc1                  : std_logic;
  signal audio                : std_logic_vector(7 downto 0);
  signal ioa_in               : std_logic_vector(7 downto 0);
  signal ioa_out              : std_logic_vector(7 downto 0);
  signal ioa_oe_l             : std_logic;
  signal iob_in               : std_logic_vector(7 downto 0);
  signal iob_out              : std_logic_vector(7 downto 0);
  signal iob_oe_l             : std_logic;
begin
  u0 : YM2149
    port map (
    -- data bus
    I_DA                => da_in,
    O_DA                => da_out,
    O_DA_OE_L           => da_oe_l,
    -- control
    I_A9_L              => '0',
    I_A8                => '1',
    I_BDIR              => bdir,
    I_BC2               => bc2,
    I_BC1               => bc1,
    I_SEL_L             => '1',

    O_AUDIO             => audio,
    -- port a
    I_IOA               => ioa_in,
    O_IOA               => ioa_out,
    O_IOA_OE_L          => ioa_oe_l,
    -- port b
    I_IOB               => iob_in,
    O_IOB               => iob_out,
    O_IOB_OE_L          => iob_oe_l,

    ENA                 => '1',
    RESET_L             => reset_l,
    CLK                 => clk
    );

  p_clk  : process
  begin
    CLK <= '0';
    wait for CLKPERIOD / 2;
    CLK <= '1';
    wait for CLKPERIOD - (CLKPERIOD / 2);
  end process;

  p_debug_comb : process(bdir, bc2, bc1)
    variable sel : std_logic_vector(2 downto 0);
  begin
    func <= "-XXXXXX-";
    sel := bdir & bc2 & bc1;
    case sel is
      when "000" |
           "010" |
           "101" => func <= "inactive";
      when "001" |
           "100" |
           "111" => func <= "address ";
      when "011" => func <= "read    ";
      when "110" => func <= "write   ";
      when others => null;
    end case;
  end process;

  p_test : process

  procedure write(
    addr : in bit_vector(3 downto 0);
    data : in bit_vector(7 downto 0)
  ) is
  begin
    wait until rising_edge(clk);
    -- addr
    bdir <= '1';
    bc2 <= '1';
    bc1 <= '1';
    da_in <= x"0" & to_stdlogicvector(addr);
    wait for 300 ns;
    bdir <= '0';
    bc2 <= '0';
    bc1 <= '0';
    wait for 80 ns;
    da_in <= (others => 'Z');
    wait for 100 ns;
    -- write
    bdir <= '1';
    bc2 <= '1';
    bc1 <= '0';
    da_in <= to_stdlogicvector(data);
    wait for 300 ns;
    bdir <= '0';
    bc2 <= '0';
    bc1 <= '0';
    wait for 80 ns;
    da_in <= (others => 'Z');
    wait for 100 ns;
    wait until rising_edge(clk);

  end write;

  procedure read(
    addr : in bit_vector(3 downto 0)
  ) is
  begin
    wait until rising_edge(clk);
    -- addr
    bdir <= '1';
    bc2 <= '1';
    bc1 <= '1';
    da_in <= x"0" & to_stdlogicvector(addr);
    wait for 300 ns;
    bdir <= '0';
    bc2 <= '0';
    bc1 <= '0';
    wait for 80 ns;
    da_in <= (others => 'Z');
    wait for 100 ns;
    -- read
    bdir <= '0';
    bc2 <= '1';
    bc1 <= '1';
    da_in <= (others => 'Z');
    wait for 300 ns;
    bdir <= '0';
    bc2 <= '0';
    bc1 <= '0';
    wait for 180 ns;
    wait until rising_edge(clk);

  end read;

  begin
    reset_l <= '0';
    reset_h <= '1';
    da_in <= (others => 'Z');
    bdir <= '0';
    bc2 <= '0';
    bc1 <= '0';
    wait for 100 ns;
    reset_l <= '1';
    reset_h <= '0';
    wait until rising_edge(clk);
    wait until rising_edge(clk);
    wait until rising_edge(clk);
    write(x"0",x"08");
    write(x"1",x"00");
    read(x"0");
    wait for 500 ns;
    write(x"7",x"fb");
    write(x"8",x"00");
    write(x"a",x"0f");
    write(x"B",x"00");
    write(x"C",x"00");
    write(x"D",x"0E");
    wait;
  end process;

end Sim;

