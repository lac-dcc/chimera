library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity swanbioscolor is
   port
   (
      clk         : in std_logic;
      address     : in std_logic_vector(11 downto 0);
      data        : out std_logic_vector(15 downto 0);
      bios_wraddr : in  std_logic_vector(11 downto 0);
      bios_wrdata : in  std_logic_vector(15 downto 0);
      bios_wr     : in  std_logic
   );
end entity;

architecture arch of swanbioscolor is

   type t_rom is array(0 to 4095) of std_logic_vector(15 downto 0);
   signal rom : t_rom;
   
begin

   process (clk) 
   begin
      if rising_edge(clk) then
         data <= rom(to_integer(unsigned(address)));
      end if;
   end process;
   
   process (clk) 
   begin
      if rising_edge(clk) then
         if bios_wr = '1' then
            rom(to_integer(unsigned(bios_wraddr))) <= bios_wrdata;
         end if;
      end if;
   end process;

end architecture;
