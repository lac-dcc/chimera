library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
library work;
use work.zpu_config.all;

entity wbarb2_1 is
  generic (
    ADDRESS_HIGH: integer := maxIObit;
    ADDRESS_LOW: integer := maxIObit
  );
  port (
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;

    -- Master 0 signals

    m0_wb_dat_o: out std_logic_vector(31 downto 0);
    m0_wb_dat_i: in std_logic_vector(31 downto 0);
    m0_wb_adr_i: in std_logic_vector(ADDRESS_HIGH downto ADDRESS_LOW);
    m0_wb_sel_i: in std_logic_vector(3 downto 0);
    m0_wb_cti_i: in std_logic_vector(2 downto 0);
    m0_wb_we_i:  in std_logic;
    m0_wb_cyc_i: in std_logic;
    m0_wb_stb_i: in std_logic;
    m0_wb_stall_o: out std_logic;
    m0_wb_ack_o: out std_logic;

    -- Master 1 signals

    m1_wb_dat_o: out std_logic_vector(31 downto 0);
    m1_wb_dat_i: in std_logic_vector(31 downto 0);
    m1_wb_adr_i: in std_logic_vector(ADDRESS_HIGH downto ADDRESS_LOW);
    m1_wb_sel_i: in std_logic_vector(3 downto 0);
    m1_wb_cti_i: in std_logic_vector(2 downto 0);
    m1_wb_we_i:  in std_logic;
    m1_wb_cyc_i: in std_logic;
    m1_wb_stb_i: in std_logic;
    m1_wb_ack_o: out std_logic;
    m1_wb_stall_o: out std_logic;

    -- Slave signals

    s0_wb_dat_i: in std_logic_vector(31 downto 0);
    s0_wb_dat_o: out std_logic_vector(31 downto 0);
    s0_wb_adr_o: out std_logic_vector(ADDRESS_HIGH downto ADDRESS_LOW);
    s0_wb_sel_o: out std_logic_vector(3 downto 0);
    s0_wb_cti_o: out std_logic_vector(2 downto 0);
    s0_wb_we_o:  out std_logic;
    s0_wb_cyc_o: out std_logic;
    s0_wb_stb_o: out std_logic;
    s0_wb_ack_i: in std_logic;
    s0_wb_stall_i: in std_logic
  );
end entity wbarb2_1;



architecture behave of wbarb2_1 is

signal current_master: std_logic;
signal next_master: std_logic;
begin

process(wb_clk_i)
begin
  if rising_edge(wb_clk_i) then
    if wb_rst_i='1' then
      current_master <= '0';
    else
      current_master <= next_master;
    end if;
  end if;
end process;


process(current_master, m0_wb_cyc_i, m1_wb_cyc_i)
begin
  next_master <= current_master;

  case current_master is
    when '0' =>
      if m0_wb_cyc_i='0' then
        if m1_wb_cyc_i='1' then
          next_master <= '1';
        end if;
      end if;
    when '1' =>
      if m1_wb_cyc_i='0' then
        if m0_wb_cyc_i='1' then
          next_master <= '0';
        end if;
      end if;
    when others =>
  end case;
end process;

-- Muxers for slave

process(current_master,
        m0_wb_dat_i, m0_wb_adr_i, m0_wb_sel_i, m0_wb_cti_i, m0_wb_we_i, m0_wb_cyc_i, m0_wb_stb_i,
        m1_wb_dat_i, m1_wb_adr_i, m1_wb_sel_i, m1_wb_cti_i, m1_wb_we_i, m1_wb_cyc_i, m1_wb_stb_i)
begin
  case current_master is
    when '0' =>
      s0_wb_dat_o <= m0_wb_dat_i;
      s0_wb_adr_o <= m0_wb_adr_i;
      s0_wb_sel_o <= m0_wb_sel_i;
      s0_wb_cti_o <= m0_wb_cti_i;
      s0_wb_we_o  <= m0_wb_we_i;
      s0_wb_cyc_o <= m0_wb_cyc_i;
      s0_wb_stb_o <= m0_wb_stb_i;
    when '1' =>
      s0_wb_dat_o <= m1_wb_dat_i;
      s0_wb_adr_o <= m1_wb_adr_i;
      s0_wb_sel_o <= m1_wb_sel_i;
      s0_wb_cti_o <= m1_wb_cti_i;
      s0_wb_we_o  <= m1_wb_we_i;
      s0_wb_cyc_o <= m1_wb_cyc_i;
      s0_wb_stb_o <= m1_wb_stb_i;
    when others =>
      null;
  end case;
end process;

-- Muxers/sel for masters

m0_wb_dat_o <= s0_wb_dat_i;
m1_wb_dat_o <= s0_wb_dat_i;

-- Ack

m0_wb_ack_o <= s0_wb_ack_i when current_master='0' else '0';
m1_wb_ack_o <= s0_wb_ack_i when current_master='1' else '0';

m0_wb_stall_o <= s0_wb_stall_i when current_master='0' else '1';
m1_wb_stall_o <= s0_wb_stall_i when current_master='1' else '1';

end behave;
