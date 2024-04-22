library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hdd_rom is
 port (
   addr : in  unsigned(7 downto 0);
   clk  : in  std_logic;
   dout : out unsigned(7 downto 0));
end hdd_rom;

architecture rtl of hdd_rom is
  type rom_array is array(0 to 255) of unsigned(7 downto 0);

  constant ROM : rom_array := (
  X"a9", X"20", X"a9", X"00", X"a9", X"03", X"a9", X"3c", X"d0", X"08", X"38", X"b0",
  X"01", X"18", X"b0", X"79", X"90", X"15", X"a9", X"00", X"8d", X"f2", X"c0", X"a9",
  X"70", X"8d", X"f3", X"c0", X"ad", X"f0", X"c0", X"6e", X"f1", X"c0", X"90", X"42",
  X"4c", X"00", X"c6", X"68", X"85", X"46", X"69", X"03", X"a8", X"68", X"85", X"47",
  X"69", X"00", X"48", X"98", X"48", X"a0", X"01", X"b1", X"46", X"85", X"42", X"c8",
  X"b1", X"46", X"85", X"45", X"c8", X"b1", X"46", X"85", X"46", X"a0", X"01", X"b1",
  X"45", X"85", X"43", X"c8", X"b1", X"45", X"85", X"44", X"c8", X"b1", X"45", X"48",
  X"c8", X"b1", X"45", X"48", X"c8", X"b1", X"45", X"85", X"47", X"68", X"85", X"46",
  X"68", X"85", X"45", X"c8", X"d0", X"23", X"a9", X"70", X"85", X"43", X"a9", X"00",
  X"85", X"44", X"85", X"46", X"85", X"47", X"a9", X"08", X"85", X"45", X"a9", X"01",
  X"85", X"42", X"20", X"89", X"c7", X"b0", X"a5", X"2c", X"61", X"c0", X"30", X"a0",
  X"a2", X"70", X"4c", X"01", X"08", X"18", X"a5", X"43", X"8d", X"f3", X"c0", X"a5",
  X"44", X"8d", X"f4", X"c0", X"a5", X"45", X"8d", X"f5", X"c0", X"a5", X"46", X"8d",
  X"f6", X"c0", X"a5", X"47", X"8d", X"f7", X"c0", X"a5", X"42", X"8d", X"f2", X"c0",
  X"c9", X"02", X"d0", X"03", X"20", X"de", X"c7", X"ad", X"f0", X"c0", X"48", X"a5",
  X"42", X"c9", X"01", X"d0", X"03", X"20", X"c1", X"c7", X"6e", X"f1", X"c0", X"68",
  X"60", X"98", X"48", X"a0", X"00", X"ad", X"f8", X"c0", X"91", X"44", X"c8", X"d0",
  X"f8", X"e6", X"45", X"a0", X"00", X"ad", X"f8", X"c0", X"91", X"44", X"c8", X"d0",
  X"f8", X"c6", X"45", X"68", X"a8", X"60", X"98", X"48", X"a0", X"00", X"b1", X"44",
  X"8d", X"f8", X"c0", X"c8", X"d0", X"f8", X"e6", X"45", X"a0", X"00", X"b1", X"44",
  X"8d", X"f8", X"c0", X"c8", X"d0", X"f8", X"c6", X"45", X"68", X"a8", X"60", X"00",
  X"ff", X"7f", X"d7", X"0a");

begin
process (clk)
  begin
    if rising_edge(clk) then
      dout <= ROM(TO_INTEGER(addr));
    end if;
  end process;

end rtl;
