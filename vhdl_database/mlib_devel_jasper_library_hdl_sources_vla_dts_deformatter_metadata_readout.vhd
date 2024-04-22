-- </doc metadata_readout.vhd
--
-- Interface to the ISA bus to read out the captured metadata.
--
-- doc/>

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity metadata_readout is
  
  generic (
    address : std_logic_vector(7 downto 0) := X"00");

  port (
    input : in    std_logic_vector(31 downto 0);
    clock : in    std_logic;
    cs    : in    std_logic;
    rdstb : in    std_logic;
    sel   : in    std_logic_vector(7 downto 0);
    dout  : out   std_logic_vector(7 downto 0));


end metadata_readout;

architecture behavioral of metadata_readout is
  
  subtype byte is std_logic_vector(7 downto 0);
  subtype address_t is unsigned(1 downto 0);
  type    byte_array is array (0 to 3) of byte;

  signal addr : address_t := (others => '0');

  signal selected : std_logic := '0';
  signal drivebus : std_logic := '0';

  signal hold      : std_logic_vector(31 downto 0) := (others => '0');
  signal hold_load : std_logic_vector(2 downto 0)  := (others => '0');

  signal result_a : byte_array := (others => (others => '0'));

  signal result : std_logic_vector(7 downto 0) := (others => '0');
  
begin  -- behavioral

  dout     <= result when drivebus = '1' else "00000000";
  drivebus <= '1'    when selected = '1'
              and cs = '0' and rdstb = '0' else '0';
  selected <= '1' when sel = address else '0';

  g0 : for i in result_a'range generate
    result_a(result_a'high-i) <=
      hold(i*byte'length+7 downto i*byte'length);
  end generate g0;

  result <= result_a(to_integer(addr));

  process(rdstb, selected)
  begin
    if selected = '0' then
      addr <= (others => '0');
    elsif rising_edge(rdstb) then
      addr <= addr + 1;
    end if;
  end process;

  process(clock)
  begin
    if rising_edge(clock) then
      hold_load <= hold_load(hold_load'left-1 downto 0) & selected;
    end if;
  end process;

  process(clock)
  begin
    if rising_edge(clock) then
      if (hold_load(hold_load'left-1) and not hold_load(hold_load'left))
         = '1' then
        hold <= input;
      end if;
    end if;
  end process;

end behavioral;
