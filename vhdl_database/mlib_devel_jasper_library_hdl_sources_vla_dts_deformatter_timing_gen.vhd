-- </doc timing_gen.vhd
--
-- Generates 10ms, 1second, and 10 second timing from clock for use with DTS
-- modules that send the old format.
--
-- doc/>

-- 20080320 started.
--
-- make 10ms timing for modules that send 19.2 Hz.
--
-- On first index after arm is set counters are initialized. 
-- Arm bit is clear on execute.
-- 
-- doc/>

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timing_gen is
  
  port (
    clock  : in  std_logic;
    index  : in  std_logic;
    d      : in  std_logic_vector(7 downto 0);
    wrs    : in  std_logic;
    cs     : in  std_logic;
    tenms  : out std_logic;
    onesec : out std_logic;
    tensec : out std_logic);

end timing_gen;

architecture behavioral of timing_gen is

  signal   counter_1      : unsigned(19 downto 0);
  constant fullcount_1    : unsigned(19 downto 0) := to_unsigned(640000-1, 20);
  constant initcount_1    : unsigned(19 downto 0) := to_unsigned(1, 20);
  signal   counter_2      : unsigned(6 downto 0);
  constant fullcount_2    : unsigned(6 downto 0)  := to_unsigned(100-1, 7);
  signal   counter_3      : unsigned(3 downto 0);
  constant fullcount_3    : unsigned(3 downto 0)  := to_unsigned(10-1, 4);
  signal   counter_3_init : std_logic_vector(3 downto 0);
  signal   endcount_1     : std_logic;
  signal   endcount_2     : std_logic;
  signal   endcount_3     : std_logic;
  signal   enable         : std_logic;
  signal   enable_2       : std_logic;
  signal   enable_3       : std_logic;
  signal   arm            : std_logic;
  
begin  -- behavioral

  -- It is expected these will be reclocked in the user's space
  tenms  <= endcount_1;
  onesec <= enable_3;
  tensec <= enable_3 and endcount_3;

  process(wrs)
  begin
    if wrs'event and wrs = '1' then     -- rising clock edge
      if cs = '1' then
        counter_3_init <= d(3 downto 0);
      end if;
    end if;
  end process;

-- purpose: arm bit
-- type   : sequential
-- inputs : wrs, enable
-- outputs: arm
  process (wrs, enable)
  begin  -- process
    if enable = '1' then
      arm <= '0';
    elsif wrs'event and wrs = '1' then  -- rising clock edge
      if cs = '1' then
        arm <= '1';
      end if;
    end if;
  end process;

-- purpose: enable bit
-- type   : sequential
-- inputs : clock, arm
-- outputs: enable
  process (clock)
  begin  -- process
    if clock'event and clock = '1' then  -- rising clock edge
      enable <= index and arm;
    end if;
  end process;

  endcount_1 <= '1' when counter_1 = fullcount_1 else '0';
  endcount_2 <= '1' when counter_2 = fullcount_2 else '0';
  endcount_3 <= '1' when counter_3 = fullcount_3 else '0';

  enable_2 <= endcount_1;
  enable_3 <= endcount_1 and endcount_2;

-- purpose: 10 millisecond counter
-- type   : sequential
-- inputs : clock, enable
-- outputs: counter_1
  process (clock)
  begin  -- process
    if clock'event and clock = '1' then  -- rising clock edge
      if enable = '1' then
        counter_1 <= initcount_1;
      elsif endcount_1 = '1' then
        counter_1 <= (others => '0');
      else
        counter_1 <= counter_1 + 1;
      end if;
    end if;
  end process;

-- one second counter
  process (clock)
  begin  -- process
    if clock'event and clock = '1' then  -- rising clock edge
      if enable = '1' then
        counter_2 <= (others => '0');
      elsif enable_2 = '1' then
        if endcount_2 = '1' then
          counter_2 <= (others => '0');
        else
          counter_2 <= counter_2 + 1;
        end if;
      end if;
    end if;
  end process;

-- purpose: ten second timer
-- type   : sequential
-- inputs : clock, enable
-- outputs: counter_3
  process (clock)
  begin  -- process
    if clock'event and clock = '1' then
      if enable = '1' then
        counter_3 <= unsigned(counter_3_init);
      elsif enable_3 = '1' then
        if endcount_3 = '1' then
          counter_3 <= (others => '0');
        else
          counter_3 <= counter_3 + 1;
        end if;
      end if;
    end if;
  end process;

end behavioral;
