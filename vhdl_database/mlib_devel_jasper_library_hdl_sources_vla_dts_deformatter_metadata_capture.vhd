-- </doc metadata_capture.vhd
--
-- The metaframe index bit in the high-speed frame is used to provide
-- extra metadata and timing from the antenna.
--
-- The timing received could be 19.2 Hz or 20 Hz.
-- The metaframe index bit is used to carry additional data. The bit's value
-- in the 32 frames following the comprise this data.
-- The data are formatted to present the information meaningfully in a
-- hexadecimal display. Thus each 4 bit nibble is one digit.
--
-- The first two nibbles are the antenna number encoded as two BCD digits.
-- The third nibble encodes the IF as one hex digit a-d.
-- The fourth is the FPGA "chip number" on the formatter board BCD 1-3
-- The fifth is 0 or 1 indicating the data source 1 being 3-bit.
-- The next two are the PLL lock status of the data input plls.
--
-- The data source bit is the lsb of nibble 5 i.e bit 12 in a 32 bit word
-- captured msb first.
--
-- doc/>

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity metadata_capture is
  port (
    index_in    : in  std_logic;
    clock       : in  std_logic;
    index       : out std_logic;
    metadata    : out std_logic_vector(31 downto 0);
    data_source : out std_logic);

end metadata_capture;

architecture behavioral of metadata_capture is

  -- Counts the 32 bits of metadata.
  subtype  counter_t is unsigned(5 downto 0);
  constant stop_count : counter_t := to_unsigned(32, counter_t'length);
  constant full_count : counter_t := to_unsigned(31, counter_t'length);
  signal   counter    : counter_t := stop_count;
  signal   counter_en : std_logic := '0';

  -- 32 bit shift register
  subtype shifter_t is std_logic_vector(31 downto 0);
  signal  shifter : shifter_t := (others => '0');
  -- The metadata storage.
  signal  outreg  : shifter_t := (others => '0');

  signal metaframe : std_logic;         -- validated metaframe index pulse.
  
begin  -- behavioral

  data_source <= outreg(outreg'left-19);
  metadata    <= outreg;
  index       <= metaframe;
  counter_en  <= '0' when counter = stop_count else '1';

  process(clock)
  begin
    if rising_edge(clock) then      
      metaframe <= index_in and not counter_en;
    end if;
  end process;

  process(clock)
  begin
    if rising_edge(clock) then
      if counter = full_count then
        outreg <= shifter;
      end if;
    end if;
  end process;

  -- bit counter.
  process(clock, metaframe)
  begin
    if metaframe = '1' then
      counter <= (others => '0');
    elsif rising_edge(clock) then
      if counter_en = '1' then
        counter <= counter + 1;
      end if;
    end if;
  end process;

-- input shifter;
  process(clock)
  begin
    if rising_edge(clock) then
      shifter <= shifter(shifter'left-1 downto 0) & index_in;
    end if;
  end process;

end behavioral;
