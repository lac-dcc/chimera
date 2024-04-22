-- ipbus_i2c_master
--
-- Wrapper for opencores i2c wishbone slave
--
-- Dave Newbold, Jan 2012

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.ipbus.all;

entity ipbus_i2c_master is
	generic(addr_width: natural := 0);
	port(
		clk: in std_logic;
		rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		scl: out std_logic;
		sda_o: out std_logic;
		sda_i: in std_logic
	);
	
end ipbus_i2c_master;

architecture rtl of ipbus_i2c_master is

	signal stb, ack, scl_i, sda_enb: std_logic;

begin

	stb <= ipb_in.ipb_strobe and not ack;

	i2c: entity work.i2c_master_top port map(
		wb_clk_i => clk,
		wb_rst_i => rst,
		arst_i => '1',
		wb_adr_i => ipb_in.ipb_addr(2 downto 0),
		wb_dat_i => ipb_in.ipb_wdata(7 downto 0),
		wb_dat_o => ipb_out.ipb_rdata(7 downto 0),
		wb_we_i => ipb_in.ipb_write,
		wb_stb_i => stb,
		wb_cyc_i => '1',
		wb_ack_o => ack,
		scl_pad_i => scl_i,
		scl_padoen_o => scl_i,
		sda_pad_i => sda_i,
		sda_padoen_o => sda_o
	);
	
	ipb_out.ipb_rdata(31 downto 8) <= (others => '0');
	ipb_out.ipb_ack <= ack;
	ipb_out.ipb_err <= '0';
	
	scl <= scl_i;
	
end rtl;
