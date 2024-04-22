library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
library work;
use work.zpu_config.all;

entity wbbootloadermux is
  generic (
    address_high: integer:=31;
    address_low: integer:=2
  );
  port (
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;

    sel:      in std_logic;
    -- Master 

    m_wb_dat_o: out std_logic_vector(31 downto 0);
    m_wb_dat_i: in std_logic_vector(31 downto 0);
    m_wb_adr_i: in std_logic_vector(address_high downto address_low);
    m_wb_sel_i: in std_logic_vector(3 downto 0);
    m_wb_cti_i: in std_logic_vector(2 downto 0);
    m_wb_we_i:  in std_logic;
    m_wb_cyc_i: in std_logic;
    m_wb_stb_i: in std_logic;
    m_wb_ack_o: out std_logic;
    m_wb_stall_o: out std_logic;

    -- Slave 0 signals

    s0_wb_dat_i: in std_logic_vector(31 downto 0);
    s0_wb_dat_o: out std_logic_vector(31 downto 0);
    s0_wb_adr_o: out std_logic_vector(address_high downto address_low);
    s0_wb_sel_o: out std_logic_vector(3 downto 0);
    s0_wb_cti_o: out std_logic_vector(2 downto 0);
    s0_wb_we_o:  out std_logic;
    s0_wb_cyc_o: out std_logic;
    s0_wb_stb_o: out std_logic;
    s0_wb_ack_i: in std_logic;
    s0_wb_stall_i: in std_logic;

    -- Slave 1 signals

    s1_wb_dat_i: in std_logic_vector(31 downto 0);
    s1_wb_dat_o: out std_logic_vector(31 downto 0);
    s1_wb_adr_o: out std_logic_vector(11 downto 2);
    s1_wb_sel_o: out std_logic_vector(3 downto 0);
    s1_wb_cti_o: out std_logic_vector(2 downto 0);
    s1_wb_we_o:  out std_logic;
    s1_wb_cyc_o: out std_logic;
    s1_wb_stb_o: out std_logic;
    s1_wb_ack_i: in std_logic;
    s1_wb_stall_i: in std_logic

  );
end entity wbbootloadermux;



architecture behave of wbbootloadermux is

signal select_zero: std_logic;

begin

select_zero<='0' when sel='1' else '1';

s0_wb_dat_o <= m_wb_dat_i;
s0_wb_adr_o <= m_wb_adr_i;
s0_wb_stb_o <= m_wb_stb_i;
s0_wb_we_o  <= m_wb_we_i;
s0_wb_cti_o <= m_wb_cti_i;
s0_wb_sel_o <= m_wb_sel_i;

s1_wb_dat_o <= m_wb_dat_i;
s1_wb_adr_o <= m_wb_adr_i(11 downto 2);
s1_wb_stb_o <= m_wb_stb_i;
s1_wb_we_o  <= m_wb_we_i;
s1_wb_cti_o <= m_wb_cti_i;
s1_wb_sel_o <= m_wb_sel_i;

process(m_wb_cyc_i,select_zero)
begin
  if m_wb_cyc_i='0' then
    s0_wb_cyc_o<='0';
    s1_wb_cyc_o<='0';
  else
    s0_wb_cyc_o<=select_zero;
    s1_wb_cyc_o<=not select_zero;
  end if;
end process;

process(select_zero,s1_wb_dat_i,s0_wb_dat_i,s0_wb_ack_i,s1_wb_ack_i,s0_wb_stall_i,s1_wb_stall_i)
begin
  if select_zero='0' then
    m_wb_dat_o<=s1_wb_dat_i;
    m_wb_ack_o<=s1_wb_ack_i;
    m_wb_stall_o<=s1_wb_stall_i;
  else
    m_wb_dat_o<=s0_wb_dat_i;
    m_wb_ack_o<=s0_wb_ack_i;
    m_wb_stall_o<=s0_wb_stall_i;
  end if;
end process;

end behave;
