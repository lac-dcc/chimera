-- An assemtric ram with a 16-bit wide read-only port and a 32-bit wide
-- read/write port.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity asymmetric_ram is
  generic (
    -- Bit width of the data addressed by the 16-bit read port. Addresses of
    -- the 32-bit read/write port have one less bits.
    ADDR_WIDTH : integer := 14
    );
  port (
    clkA : in std_logic;
    clkB : in std_logic;

    enA : in std_logic;
    addrA : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
    doA : out std_logic_vector(15 downto 0);

    enB : in std_logic;
    weB : in std_logic_vector(3 downto 0);
    addrB : in std_logic_vector(ADDR_WIDTH - 2 downto 0);
    diB : in std_logic_vector(31 downto 0);
    doB : out std_logic_vector(31 downto 0)
    );
end asymmetric_ram;
architecture behavioral of asymmetric_ram is
  constant NUM_WORDS : integer :=  2**ADDR_WIDTH;
  type ram_type is array (0 to NUM_WORDS-1) of std_logic_vector(15 downto 0);

  impure function load_binary(filename : string) return ram_type is
    type binary_file is file of character;
    file f : binary_file;
    variable c : character;
    variable mem : ram_type;
  begin
    file_open(f, filename, read_mode);
    for i in ram_type'range loop
      mem(i) := (others => '0');
      -- read 2 bytes and store in big endian order
      for bi in 1 downto 0 loop
        if not endfile(f) then
          read(f, c);
          mem(i)((bi+1)*8 - 1 downto bi*8) :=
            std_logic_vector(to_unsigned(character'pos(c), 8));
        end if;
      end loop;
    end loop;
    file_close(f);
    return mem;
  end;

  signal ram : ram_type := load_binary("ram.img");
begin

  process (clkA)
  begin
    if clkA'event and clkA = '1' then
      if enA = '1' then
        doA <= ram(to_integer(unsigned(addrA)));
      end if;
    end if;
  end process;

  process (clkB)
    variable readB : std_logic_vector(31 downto 0);
  begin
    if clkB'event and clkB = '1' then
      if enB = '1' then
        if weB(3) = '1' then
          ram(to_integer(unsigned(addrB & '0')))(15 downto 8) <= diB(31 downto 24);
        end if;
        if weB(2) = '1' then
          ram(to_integer(unsigned(addrB & '0')))(7 downto 0) <= diB(23 downto 16);
        end if;
        if weB(1) = '1' then
          ram(to_integer(unsigned(addrB & '1')))(15 downto 8) <= diB(15 downto 8);
        end if;
        if weB(0) = '1' then
          ram(to_integer(unsigned(addrB & '1')))(7 downto 0) <= diB(7 downto 0);
        end if;
        readB(31 downto 16) := ram(to_integer(unsigned(addrB & '0')));
        readB(15 downto 0) := ram(to_integer(unsigned(addrB & '1')));
        doB <= readB;
      end if;
    end if;
  end process;
end behavioral;
