library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
library work;
use work.zpu_config.all;
use work.wishbonepkg.all;

entity wb_master_p_to_slave_np is
  port (
    syscon:   in wb_syscon_type;

    -- Master signals
    mwbi:     in wb_miso_type;
    mwbo:     out wb_mosi_type;
    -- Slave signals
    swbi:     in wb_miso_type;
    swbo:     in wb_mosi_type
  );
end entity wb_master_p_to_slave_np;

architecture behave of wb_master_p_to_slave_np is

type state_type is ( idle, wait_for_ack );

signal state: state_type;

begin

process(syscon.clk)
begin
  if rising_edge(syscon.clk) then
    if syscon.rst='1' then
      state <= idle;
    else
      case state is
        when idle =>
          if mwbi.cyc='1' and mwbi.stb='1' then
            state <= wait_for_ack;
          end if;
        when wait_for_ack =>
          if swbi.ack='1' then
            state <= idle;
          end if;
        when others =>
      end case;
    end if;
  end if;
end process;


swbo.stb <= mwbi.stb when state=idle else '0';

swbo.dat <= mwbi.dat;
swbo.adr <= mwbi.adr;
swbo.sel <= mwbi.sel;
swbo.cti <= mwbi.cti;
swbo.we  <= mwbi.we;
swbo.cyc <= mwbi.cyc;

mwbo.dat <= swbi.dat;
mwbo.ack <= swbi.ack;

--mwbo.stall <= '0';

end behave;
