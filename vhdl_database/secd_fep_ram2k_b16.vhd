library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
library unisim;
use unisim.all;

entity ram_2k is
  Port (
    clk   : in  std_logic;
    rst   : in  std_logic;
    cs    : in  std_logic;
    rw    : in  std_logic;
    addr  : in  std_logic_vector (10 downto 0);
    rdata : out std_logic_vector (7 downto 0);
    wdata : in  std_logic_vector (7 downto 0)
    );
end ram_2k;

architecture rtl of ram_2k is

  component RAMB16_S9
    port (
      do   : out std_logic_vector(7 downto 0);
      dop  : out std_logic_vector(0 downto 0);
      addr : in std_logic_vector(10 downto 0);
      clk  : in std_logic;
      di   : in std_logic_vector(7 downto 0);
      dip : in std_logic_vector(0 downto 0);
      en   : in std_logic;
      ssr  : in std_logic;
      we   : in std_logic
      );
  end component RAMB16_S9;

  signal we : std_logic;
  signal dp : std_logic;

begin

  ROM : RAMB16_S9
    port map (
      do   => rdata,
      dop(0) => dp,
      addr => addr,
      clk  => clk,
      di   => wdata,
      dip(0) => dp,
      en   => cs,
      ssr  => rst,
      we   => we
      );

  my_ram_2k : process ( rw )
  begin
    we    <= not rw;
  end process;

end architecture rtl;

