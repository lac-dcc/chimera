--
library ieee;
use ieee.std_logic_1164.all;
use work.sbone;


--
entity rep_mux is
 generic
 (
  GENERIC_COUNT: natural := sbone.REG_RW_COUNT
 );
 port
 (
  rst: in std_ulogic;
  clk: in std_ulogic;
  rep_en_i: in sbone.rep_en_array_t;
  rep_data_i: in sbone.rep_data_array_t;
  rep_en_o: out std_ulogic;
  rep_data_o: out std_ulogic_vector(sbone.DATA_WIDTH - 1 downto 0)
 );
end entity;


--
architecture rtl of rep_mux is
begin
 process(rst, clk)
 begin
  if rst = '1' then
  elsif rising_edge(clk) then
   rep_en_o <= rep_en_i(0) or rep_en_i(1);
   case rep_en_i(1 downto 0) is
    when b"01" => rep_data_o <= rep_data_i(0);
    when b"10" => rep_data_o <= rep_data_i(1);
    when others => rep_data_o <= (others => '1');
   end case;
  end if;
 end process;
end rtl;
