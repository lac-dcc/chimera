-- Listing 11.3
-- Dual-port RAM with asynchronous read
-- Modified from XST 8.1i rams_09
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity xilinx_dual_port_ram_async is
   generic(
      ADDR_WIDTH: integer:=6;
      DATA_WIDTH:integer:=8
   );
   port(
      clk: in std_logic;
      we: in std_logic;
      addr_a: in std_logic_vector(ADDR_WIDTH-1 downto 0);
      addr_b: in std_logic_vector(ADDR_WIDTH-1 downto 0);
      din_a: in std_logic_vector(DATA_WIDTH-1 downto 0);
      dout_a: out std_logic_vector(DATA_WIDTH-1 downto 0);
      dout_b: out std_logic_vector(DATA_WIDTH-1 downto 0)
   );
end xilinx_dual_port_ram_async;

architecture beh_arch of xilinx_dual_port_ram_async is
   type ram_type is array (0 to 2**ADDR_WIDTH-1)
        of std_logic_vector (DATA_WIDTH-1 downto 0);
   signal ram: ram_type;
begin
   process(clk)
   begin
     if (clk'event and clk = '1') then
        if (we = '1') then
           ram(to_integer(unsigned(addr_a))) <= din_a;
        end if;
     end if;
   end process;
   dout_a <= ram(to_integer(unsigned(addr_a)));
   dout_b <= ram(to_integer(unsigned(addr_b)));
end beh_arch;