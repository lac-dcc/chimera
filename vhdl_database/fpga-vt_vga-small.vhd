library ieee;
use ieee.std_logic_1164.all;
-- use  IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity mod_m_counter is
  generic(
    N : integer := 7;                   -- number of bits
    M : integer := 80                   -- mod-M
    );
  port (
    q     : out std_logic_vector((N-1) downto 0);
    wrap  : out std_logic;
    clear : in  std_logic;
    clock : in  std_logic);
end mod_m_counter;

architecture Behav of mod_m_counter is
  signal tmp : std_logic_vector((N-1) downto 0) := (others => '0');
begin
  process(clock, clear)
  begin
    if (rising_edge(clock)) then
      if (clear = '1') then
        tmp <= (others => '0');
      else
        if unsigned(tmp) = M then       -- binary 80
          tmp  <= (others => '0');      -- equivalent to "0000000"
          wrap <= '1';
        else
          tmp  <= std_logic_vector(unsigned(tmp) + 1);
          wrap <= '0';
        end if;
      end if;
    end if;

  end process;

  q <= tmp;

end Behav;

---------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
-- use  IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity shiftreg is
  generic(
    N : integer := 9                    -- number of bits
    );
  port (
    q     : out std_logic;
    load  : in  std_logic;
    input : in  std_logic_vector((N-1) downto 0);
    clock : in  std_logic);
end shiftreg;

architecture Behavioral of shiftreg is
  signal latch   : std_logic_vector((N-1) downto 0);
  signal tmp_out : std_logic;
begin

  process (clock, input, load)
  begin
    if (rising_edge(clock)) then
      if(load = '1') then
        latch <= input;
      else
        latch((N-1) downto 0) <= latch((N-2) downto 0) & '0';
      end if;
    end if;

  end process;

  q <= latch(N-1);

end Behavioral;

---------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
-- use  IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity attr_selector is
  port (
    input       : in  std_logic;
    outR        : out std_logic_vector(3 downto 0);
    outG        : out std_logic_vector(3 downto 0);
    outB        : out std_logic_vector(3 downto 0);
    disp_enable : in  std_logic;
    load        : in  std_logic;
    fg          : in  std_logic_vector(5 downto 0);
    bg          : in  std_logic_vector(5 downto 0);
    flashing    : in  std_logic;
    flashclk    : in  std_logic;
    clock       : in  std_logic
--    blanking    : in  std_logic
    );
end attr_selector;


architecture Behavioral of attr_selector is
  signal fg_latch    : std_logic_vector(5 downto 0);
  signal bg_latch    : std_logic_vector(5 downto 0);
  signal result      : std_logic_vector(5 downto 0);
  signal flash_latch : std_logic;
begin

  process (clock, input, load)
  begin
    if (rising_edge(clock)) then
      if(load = '1') then
        fg_latch    <= fg;
        bg_latch    <= bg;
        flash_latch <= flashing;
      end if;

      if (disp_enable = '0') then
        result <= "000000";
      else
        if (input = '0' or (flashclk and flash_latch) = '1') then
          result <= bg_latch;
        else
          result <= fg_latch;
        end if;
      end if;

    end if;

  end process;

  outR <= result(5 downto 4) & "00";
  outG <= result(3 downto 2) & "00";
  outB <= result(1 downto 0) & "00";

end Behavioral;
