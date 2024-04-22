library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
library work;
use work.zpu_config.all;

entity wb_master_np_to_slave_p is
  generic (
    ADDRESS_HIGH: integer := maxIObit;
    ADDRESS_LOW: integer := maxIObit
  );
  port (
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;

    -- Master signals

    m_wb_dat_o: out std_logic_vector(31 downto 0);
    m_wb_dat_i: in std_logic_vector(31 downto 0);
    m_wb_adr_i: in std_logic_vector(ADDRESS_HIGH downto ADDRESS_LOW);
    m_wb_sel_i: in std_logic_vector(3 downto 0);
    m_wb_cti_i: in std_logic_vector(2 downto 0);
    m_wb_we_i:  in std_logic;
    m_wb_cyc_i: in std_logic;
    m_wb_stb_i: in std_logic;
    m_wb_ack_o: out std_logic;

    -- Slave signals

    s_wb_dat_i: in std_logic_vector(31 downto 0);
    s_wb_dat_o: out std_logic_vector(31 downto 0);
    s_wb_adr_o: out std_logic_vector(ADDRESS_HIGH downto ADDRESS_LOW);
    s_wb_sel_o: out std_logic_vector(3 downto 0);
    s_wb_cti_o: out std_logic_vector(2 downto 0);
    s_wb_we_o:  out std_logic;
    s_wb_cyc_o: out std_logic;
    s_wb_stb_o: out std_logic;
    s_wb_ack_i: in std_logic;
    s_wb_stall_i: in std_logic
  );
end entity wb_master_np_to_slave_p;



architecture behave of wb_master_np_to_slave_p is

type state_type is ( idle, wait_for_ack );
signal state: state_type;

begin

process(wb_clk_i)
begin
  if rising_edge(wb_clk_i) then
    if wb_rst_i='1' then
      state <= idle;
    else
      case state is
        when idle =>
          if m_wb_cyc_i='1' and m_wb_stb_i='1' and s_wb_stall_i='0' then
            state <= wait_for_ack;
          end if;
        when wait_for_ack =>
          if s_wb_ack_i='1' then
            state <= idle;
          end if;
        when others =>
      end case;
    end if;
  end if;
end process;


s_wb_stb_o <= m_wb_stb_i when state=idle else '0';

s_wb_dat_o <= m_wb_dat_i;
s_wb_adr_o <= m_wb_adr_i;
s_wb_sel_o <= m_wb_sel_i;
s_wb_cti_o <= m_wb_cti_i;
s_wb_we_o  <= m_wb_we_i;
s_wb_cyc_o <= m_wb_cyc_i;
m_wb_dat_o <= s_wb_dat_i;
m_wb_ack_o <= s_wb_ack_i;

end behave;
