-- Listing 15.3
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity pico_sio is
   port(
      clk, reset: in std_logic;
      sw: in std_logic_vector(7 downto 0);
      led: out std_logic_vector(7 downto 0)
   );
end pico_sio;

architecture arch of pico_sio is
   -- KCPSM3/ROM signals
   signal address: std_logic_vector(9 downto 0);
   signal instruction: std_logic_vector(17 downto 0);
   signal port_id: std_logic_vector(7 downto 0);
   signal in_port, out_port: std_logic_vector(7 downto 0);
   signal write_strobe: std_logic;
   -- register signals
   signal led_reg: std_logic_vector(7 downto 0);

begin
   -- =====================================================
   --  KCPSM and ROM instantiation
   -- =====================================================
   proc_unit: entity work.kcpsm3
      port map(
         clk=>clk, reset=>reset,
         address=>address, instruction=>instruction,
         port_id=>open, write_strobe=>write_strobe,
         out_port=>out_port, read_strobe=>open,
         in_port=>in_port, interrupt=>'0',
         interrupt_ack=>open);
   rom_unit: entity work.sio_rom
      port map(
          clk => clk, address=>address,
          instruction=>instruction);
   -- =====================================================
   --  output interface
   -- =====================================================
   --output register
   process (clk)
   begin
      if (clk'event and clk='1') then
         if write_strobe='1' then
            led_reg <= out_port;
         end if;
      end if;
   end process;
   led <= led_reg;
   -- =====================================================
   --  input interface
   -- =====================================================
   in_port <= sw;
end arch;