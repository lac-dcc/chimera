library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- 12/15/2003 changed behavior.
-- 01/21/2004 added long term accumulator
-- 10/26/2008 cleanup of code after 5 more years vhdl experience.

-- Counts frames with parity errors.
-- To be counted the following have to be true:
--  The deformatter must be in sync.
--  There must be a parity error in the current frame.
--
-- Counts errors between 1pps pulses.
-- At each 1pps
--   If reset bit set
--     Transfer previous count to accumulator.
--   else
--     Add previous count to accumulator register.
--
--   Preloads counter with current parity error bit, makes it
--    possible to count errors in frames coinciding with 1pps.
--
-- The accumulator register is 32 bits.
-- The 1 second register is 16 bits.
-- The time accumulator register is 24 bits (194 days).
-- You should really collect statistics more frequently than this.
-- 
-- When the select inputs are set to their assigned value the contents
-- of the time accumulator, the long term accumulator, and the error counter
-- are copied to a holding register (to accomplish atomic read). Then the
-- holding register is transferred 8 bits at a time in big endian fashion.
-- The data are returned in this order:
--  Three bytes of time counter. 
--  Four bytes of long term accumulator.
--  Two bytes of error counter. (The number of errors in the previous 1 second.)
-- The time counter applies to the long term accumulator contents. It does not include
--  the previous 1 second. The long term accumulator content does not include errors
--  in the error counter bytes.
--
-- Need 16 bits in counter because end of life error rates for the system
--  are 10e-6. This is 1000 errors in a second.
--
-- First read after select returns the low bits of the error count
--  next read returns the high bits. Alternate thereafter.

entity parity_counter is
  port(
    wstb   : in    std_logic;           -- write strobe
    din    : in    std_logic_vector(7 downto 0);
    dout   : out   std_logic_vector(7 downto 0);
    rstb   : in    std_logic;           -- read strobe
    sel    : in    std_logic;           -- register select
    cs     : in    std_logic;           -- chip select
    clock  : in    std_logic;           -- frame clock
    parity : in    std_logic;           -- parity error
    onesec : in    std_logic;           -- 1pps 
    nsync  : in    std_logic            -- synchronized
    );
end parity_counter;

architecture behavioral of parity_counter is

  subtype accum_t is unsigned(31 downto 0);
  subtype time_t is unsigned(23 downto 0);
  subtype count_t is unsigned(15 downto 0);
  subtype rsel_t is unsigned(3 downto 0);

  signal tock_tc   : std_logic;
  signal drb       : std_logic;
  signal data      : std_logic_vector(7 downto 0);
  signal counter   : count_t;
  signal count     : count_t;
  signal preload   : count_t;
  signal accum     : accum_t;
  signal increment : accum_t;
  signal time      : time_t;
  signal rsel      : rsel_t;
  signal reset     : std_logic;
  signal reset1    : std_logic;
  signal reset2    : std_logic;
  signal reset3    : std_logic;
  signal holding   : std_logic_vector(71 downto 0);
  signal drbsr     : std_logic_vector(2 downto 0);
  signal drbedge   : std_logic;

begin

  tock_tc <= onesec;

-- holding register
  process(clock, nsync)
  begin
    if nsync = '0' then
      count <= (others => '0');
    elsif clock'event and clock = '1' then
      if tock_tc = '1' then
        count <= counter;
      end if;
    end if;
  end process;

-- error counter
  preload <= to_unsigned(0, preload'length-1) & parity;

  process(clock, nsync)
  begin
    if nsync = '0' then
      counter <= (others => '0');
    elsif clock'event and clock = '1' then
      if tock_tc = '1' then
        counter <= preload;
      else
        counter <= counter + preload;
      end if;
    end if;
  end process;


-- reset pipeline logic
  process(sel, cs, wstb, din, reset3)
  begin
    if reset3 = '1' then
      reset <= '0';
    elsif wstb'event and wstb = '1' then
      if sel = '1' and cs = '0' then
        reset <= din(0);
      end if;
    end if;
  end process;

  process(clock)
  begin
    if clock'event and clock = '1' then
      reset1 <= reset;
    end if;
  end process;

  process(clock, reset3)
  begin
    if reset3 = '1' then
      reset2 <= '0';
    elsif clock'event and clock = '1' then
      if tock_tc = '1' then
        reset2 <= reset1;
      end if;
    end if;
  end process;

  process(clock)
  begin
    if clock'event and clock = '1' then
      reset3 <= reset2;
    end if;
  end process;


-- long term accumulator.
  increment <= to_unsigned(0, increment'length-counter'length) & counter;

  process(clock, nsync)
  begin
    if nsync = '0' then
      accum <= (others => '0');
    elsif clock'event and clock = '1' then
      if tock_tc = '1' then
        if reset1 = '1' then
          accum <= increment;
        else
          accum <= accum + increment;
        end if;
      end if;
    end if;
  end process;


  process(clock, tock_tc, reset1, nsync)
  begin
    if nsync = '0' then
      time <= (others => '0');
    elsif clock'event and clock = '1' then
      if tock_tc = '1' then
        if reset = '1' then
          time <= (others => '0');
        else
          time <= time + 1;
        end if;
      end if;
    end if;
  end process;

-- read out
-- capture counters to holding register for atomic readback.
  process(clock, drb)
  begin
    if clock'event and clock = '1' then
      drbsr <= drbsr(1 downto 0) & drb;
    end if;
  end process;

  drbedge <= not drbsr(2) and drbsr(1);  -- rising edge on drb

  process(clock, nsync)
  begin
    if nsync = '0' then
      holding <= (others => '0');
    elsif clock'event and clock = '1' then
      if drbedge = '1' then
        holding <= std_logic_vector(time) &
                   std_logic_vector(accum) &
                   std_logic_vector(count);
      end if;
    end if;
  end process;

  drb <= '1' when (sel = '1' and cs = '0' and rstb = '0') else '0';

  process(rstb, sel)
  begin
    if sel = '0' then
      rsel <= (others => '0');
    elsif rstb'event and rstb = '1' then
      rsel <= rsel + 1;
    end if;
  end process;

  with std_logic_vector(rsel) select
    data <= holding(71 downto 64) when "0000",
    holding(63 downto 56)         when "0001",
    holding(55 downto 48)         when "0010",
    holding(47 downto 40)         when "0011",
    holding(39 downto 32)         when "0100",
    holding(31 downto 24)         when "0101",
    holding(23 downto 16)         when "0110",
    holding(15 downto 8)          when "0111",
    holding(7 downto 0)           when "1000",
    "00000000"                    when others;

  dout <= data when drb = '1' else "00000000";

end behavioral;
