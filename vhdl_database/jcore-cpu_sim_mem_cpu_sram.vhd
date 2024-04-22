library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.cpu2j0_pack.all;

entity cpu_sram is 
  port (
    clk : in std_logic;
    ibus_i : in cpu_instruction_o_t;
    ibus_o : out cpu_instruction_i_t;
    db_i : in cpu_data_o_t;
    db_o : out cpu_data_i_t
    );
end;

architecture struc of cpu_sram is
  signal db_we : std_logic_vector(3 downto 0);
  signal iclk : std_logic;
begin

  db_we <= (db_i.wr and db_i.we(3)) &
           (db_i.wr and db_i.we(2)) &
           (db_i.wr and db_i.we(1)) &
           (db_i.wr and db_i.we(0));

  -- clk memory on negative edge to avoid wait states
  iclk <= not clk;

  r : entity work.asymmetric_ram
    generic map (ADDR_WIDTH => 14)
    port map(clkA => iclk,
             clkB => iclk,
             enA => ibus_i.en,
             addrA => ibus_i.a(14 downto 1),
             doA => ibus_o.d,
             enB => db_i.en,
             weB => db_we,
             addrB => db_i.a(14 downto 2),
             diB => db_i.d,
             doB => db_o.d);
             
  -- simply ack immediately. Should this simulate different delays?
  db_o.ack <= db_i.en;
  ibus_o.ack <= ibus_i.en;

end architecture struc;
