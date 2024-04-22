--
-- Copyright: 2014, Technical University of Denmark, DTU Compute
-- Author: Luca Pezzarossa (lpez@dtu.dk)
-- License: Simplified BSD License
--
-- Ethernet controller VHDL top level
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity eth_controller_top is
	generic(
		BUFF_ADDR_WIDTH : natural --byte based (2^(BUFF_ADDR_WIDTH) = # of bytes)
	);
	port(
		clk           : in  std_logic;
		rst           : in  std_logic;

		-- OCP IN (slave) for Patmos
		M_Cmd          : in  std_logic_vector(2 downto 0);
		M_Addr         : in  std_logic_vector(15 downto 0);
		M_Data         : in  std_logic_vector(31 downto 0);
		M_ByteEn       : in  std_logic_vector(3 downto 0);
		S_Resp         : out std_logic_vector(1 downto 0);
		S_Data         : out std_logic_vector(31 downto 0);

		--PHY interface
		-- Tx
		mtx_clk_pad_i : in  std_logic;  -- Transmit clock (from PHY)
		mtxd_pad_o    : out std_logic_vector(3 downto 0); -- Transmit nibble (to PHY)
		mtxen_pad_o   : out std_logic;  -- Transmit enable (to PHY)
		mtxerr_pad_o  : out std_logic;  -- Transmit error (to PHY)

		-- Rx
		mrx_clk_pad_i : in  std_logic;  -- Receive clock (from PHY)
		mrxd_pad_i    : in  std_logic_vector(3 downto 0); -- Receive nibble (from PHY)
		mrxdv_pad_i   : in  std_logic;  -- Receive data valid (from PHY)
		mrxerr_pad_i  : in  std_logic;  -- Receive data error (from PHY)

		-- Common Tx and Rx
		mcoll_pad_i   : in  std_logic;  -- Collision (from PHY)
		mcrs_pad_i    : in  std_logic;  -- Carrier sense (from PHY)

		--// MII Management interface
		md_pad_i      : in  std_logic;  -- MII data input (from I/O cell)
		mdc_pad_o     : out std_logic;  -- MII Management data clock (to PHY)
		md_pad_o      : out std_logic;  -- MII data output (to I/O cell)
		md_padoe_o    : out std_logic;  -- MII data output enable (to I/O cell)

		int_o         : out std_logic   -- Interrupt output
	);
end eth_controller_top;

architecture rtl of eth_controller_top is
	component eth_top is
		port(
			wb_clk_i      : in  std_logic; -- WISHBONE clock
			wb_rst_i      : in  std_logic; -- WISHBONE reset
			wb_dat_i      : in  std_logic_vector(31 downto 0); -- WISHBONE data input
			wb_dat_o      : out std_logic_vector(31 downto 0); -- WISHBONE data output
			wb_err_o      : out std_logic; -- WISHBONE error output

			--// WISHBONE slave
			wb_adr_i      : in  std_logic_vector(11 downto 2); -- WISHBONE address input
			wb_sel_i      : in  std_logic_vector(3 downto 0); -- WISHBONE byte select input
			wb_we_i       : in  std_logic; -- WISHBONE write enable input
			wb_cyc_i      : in  std_logic; -- WISHBONE cycle input
			wb_stb_i      : in  std_logic; -- WISHBONE strobe input
			wb_ack_o      : out std_logic; -- WISHBONE acknowledge output

			--// WISHBONE master
			m_wb_adr_o    : out std_logic_vector(31 downto 0); --
			m_wb_sel_o    : out std_logic_vector(3 downto 0); --
			m_wb_we_o     : out std_logic; --
			m_wb_dat_i    : in  std_logic_vector(31 downto 0); --
			m_wb_dat_o    : out std_logic_vector(31 downto 0); --
			m_wb_cyc_o    : out std_logic; --
			m_wb_stb_o    : out std_logic; --
			m_wb_ack_i    : in  std_logic; --
			m_wb_err_i    : in  std_logic; --

			--// Tx
			mtx_clk_pad_i : in  std_logic; -- Transmit clock (from PHY)
			mtxd_pad_o    : out std_logic_vector(3 downto 0); -- Transmit nibble (to PHY)
			mtxen_pad_o   : out std_logic; -- Transmit enable (to PHY)
			mtxerr_pad_o  : out std_logic; -- Transmit error (to PHY)

			--// Rx
			mrx_clk_pad_i : in  std_logic; -- Receive clock (from PHY)
			mrxd_pad_i    : in  std_logic_vector(3 downto 0); -- Receive nibble (from PHY)
			mrxdv_pad_i   : in  std_logic; -- Receive data valid (from PHY)
			mrxerr_pad_i  : in  std_logic; -- Receive data error (from PHY)

			--// Common Tx and Rx
			mcoll_pad_i   : in  std_logic; -- Collision (from PHY)
			mcrs_pad_i    : in  std_logic; -- Carrier sense (from PHY)

			--// MII Management interface
			md_pad_i      : in  std_logic; -- MII data input (from I/O cell)
			mdc_pad_o     : out std_logic; -- MII Management data clock (to PHY)
			md_pad_o      : out std_logic; -- MII data output (to I/O cell)
			md_padoe_o    : out std_logic; -- MII data output enable (to I/O cell)

			int_o         : out std_logic -- Interrupt output
		);
	end component;

	component rx_tx_buffer is
		generic(
			ADDR_WIDTH : natural
		);
		port(
			clk       : in  std_logic;
			rst       : in  std_logic;

			-- OCP IN (slave) for Patmos
			MCmd      : in  std_logic_vector(2 downto 0);
			MAddr     : in  std_logic_vector((ADDR_WIDTH - 1) downto 0);
			MData     : in  std_logic_vector(31 downto 0);
			MByteEn   : in  std_logic_vector(3 downto 0);
			SResp     : out std_logic_vector(1 downto 0);
			SData     : out std_logic_vector(31 downto 0);

			-- Wishbone Slave (for EthMac controller)
			wb_addr_i : in  std_logic_vector((ADDR_WIDTH - 1) downto 0);
			wb_sel_i  : in  std_logic_vector(3 downto 0);
			wb_we_i   : in  std_logic;
			wb_data_o : out std_logic_vector(31 downto 0);
			wb_data_i : in  std_logic_vector(31 downto 0);
			wb_cyc_i  : in  std_logic;
			wb_stb_i  : in  std_logic;
			wb_ack_o  : out std_logic;
			wb_err_o  : out std_logic
		);
	end component;

	-- wishbone signals for registers
	signal next_wb_r_addr_o, wb_r_addr_o : std_logic_vector(11 downto 2);
	signal next_wb_r_data_o, wb_r_data_o : std_logic_vector(31 downto 0);
	signal wb_r_data_i                   : std_logic_vector(31 downto 0);
	signal wb_r_err_i                    : std_logic;
	signal next_wb_r_we_o, wb_r_we_o     : std_logic;
	signal next_wb_r_stb_o, wb_r_stb_o   : std_logic;
	signal wb_r_ack_i                    : std_logic;
	signal next_wb_r_cyc_o, wb_r_cyc_o   : std_logic;

	-- OCP signals for buffer
	signal M_Cmd_b                : std_logic_vector(2 downto 0);
	signal M_Cmd_r                : std_logic_vector(2 downto 0);
	signal S_Resp_b               : std_logic_vector(1 downto 0);
	signal S_Data_b               : std_logic_vector(31 downto 0);
	signal next_S_Resp_r, S_Resp_r : std_logic_vector(1 downto 0);
	signal next_S_Data_r, S_Data_r : std_logic_vector(31 downto 0);
	signal next_mux_sel, mux_sel : std_logic;

	-- wishbone signals for buffer
	signal wb_b_addr_i : std_logic_vector((BUFF_ADDR_WIDTH - 1) downto 0);
	signal wb_b_sel_i  : std_logic_vector(3 downto 0);
	signal wb_b_we_i   : std_logic;
	signal wb_b_data_o : std_logic_vector(31 downto 0);
	signal wb_b_data_i : std_logic_vector(31 downto 0);
	signal wb_b_cyc_i  : std_logic;
	signal wb_b_stb_i  : std_logic;
	signal wb_b_ack_o  : std_logic;
	signal wb_b_err_o  : std_logic;

begin
	M_Cmd_b <= "000" when (M_Addr(BUFF_ADDR_WIDTH-1 downto 12) = (BUFF_ADDR_WIDTH-1 downto 12=>'1')) else M_Cmd;	--control buffer, 15th bit is reserved for PTP
	M_Cmd_r <= "000" when (M_Addr(BUFF_ADDR_WIDTH-1 downto 12) /= (BUFF_ADDR_WIDTH-1 downto 12=>'1')) else M_Cmd;	--control registers, 15th bit is reserved for PTP
	S_Resp  <= S_Resp_r when (mux_sel = '1') else S_Resp_b;
	S_Data  <= S_Data_r when (mux_sel = '1') else S_Data_b;

	--Control mux
	process(wb_r_ack_i, M_Cmd_r, M_Addr, M_Data, wb_r_data_o, wb_r_we_o, wb_r_stb_o, wb_r_cyc_o, wb_r_addr_o, wb_r_data_i)
	begin
		if (wb_r_ack_i = '0') then
			next_S_Resp_r <= "00";
			next_S_Data_r <= (others  => '0');
			next_mux_sel <= '0';
			case M_Cmd_r is
				when "001" =>           -- write
					next_wb_r_we_o                <= '1';
					next_wb_r_stb_o               <= '1';
					next_wb_r_cyc_o               <= '1';
					next_wb_r_addr_o(11 downto 2) <= M_Addr(11 downto 2);
					next_wb_r_data_o              <= M_Data;
				when "010" =>           -- read
					next_wb_r_we_o                <= '0';
					next_wb_r_stb_o               <= '1';
					next_wb_r_cyc_o               <= '1';
					next_wb_r_addr_o(11 downto 2) <= M_Addr(11 downto 2);
					next_wb_r_data_o              <= wb_r_data_o;
				when others =>          -- idle
					next_wb_r_we_o                <= wb_r_we_o;
					next_wb_r_stb_o               <= wb_r_stb_o;
					next_wb_r_cyc_o               <= wb_r_cyc_o;
					next_wb_r_addr_o(11 downto 2) <= wb_r_addr_o(11 downto 2);
					next_wb_r_data_o              <= wb_r_data_o;
			end case;
		else
			next_wb_r_we_o                <= '0';
			next_wb_r_stb_o               <= '0';
			next_wb_r_cyc_o               <= '0';
			next_wb_r_addr_o(11 downto 2) <= wb_r_addr_o(11 downto 2);
			next_wb_r_data_o              <= wb_r_data_o;
			next_S_Resp_r                  <= "01";
			next_S_Data_r                  <= wb_r_data_i;
			next_mux_sel                  <= '1'; --put out the data from the registers
		end if;
	end process;

	--Register
	process(clk, rst)
	begin
		if rst = '1' then
			wb_r_we_o                <= '0';
			wb_r_stb_o               <= '0';
			wb_r_cyc_o               <= '0';
			wb_r_addr_o(11 downto 2) <= (others => '0');
			wb_r_data_o              <= (others => '0');
			S_Resp_r                  <= (others => '0');
			S_Data_r                  <= (others => '0');
			mux_sel                  <= '0';
		elsif rising_edge(clk) then
			wb_r_we_o                <= next_wb_r_we_o;
			wb_r_stb_o               <= next_wb_r_stb_o;
			wb_r_cyc_o               <= next_wb_r_cyc_o;
			wb_r_addr_o(11 downto 2) <= next_wb_r_addr_o(11 downto 2);
			wb_r_data_o              <= next_wb_r_data_o;
			S_Resp_r                  <= next_S_Resp_r;
			S_Data_r                  <= next_S_Data_r;
			mux_sel                  <= next_mux_sel;
		end if;
	end process;

	eth_top_comp_0 : eth_top port map(
			wb_clk_i                                   => clk, -- : in std_logic;-- WISHBONE clock
			wb_rst_i                                   => rst, -- : in std_logic;-- WISHBONE reset

			--// WISHBONE slave
			wb_dat_i                                   => wb_r_data_o, -- : in std_logic_vector(31 downto 0);-- WISHBONE data input
			wb_dat_o                                   => wb_r_data_i, -- : out std_logic_vector(31 downto 0);-- WISHBONE data output
			wb_err_o                                   => wb_r_err_i, -- : out std_logic;-- WISHBONE error output
			wb_adr_i                                   => wb_r_addr_o(11 downto 2), -- : in std_logic_vector(11 downto 2);-- WISHBONE address input
			wb_sel_i                                   => "1111", -- : in std_logic_vector(3 downto 0);-- WISHBONE byte select input
			wb_we_i                                    => wb_r_we_o, -- : in std_logic;-- WISHBONE write enable input
			wb_cyc_i                                   => wb_r_cyc_o, -- : in std_logic;-- WISHBONE cycle input
			wb_stb_i                                   => wb_r_stb_o, -- : in std_logic;-- WISHBONE strobe input
			wb_ack_o                                   => wb_r_ack_i, -- : out std_logic;-- WISHBONE acknowledge output

			--// WISHBONE master
			m_wb_adr_o(31 downto BUFF_ADDR_WIDTH)      => open,
			m_wb_adr_o((BUFF_ADDR_WIDTH - 1) downto 0) => wb_b_addr_i, -- : out std_logic_vector(31 downto 0);--
			m_wb_sel_o                                 => wb_b_sel_i, -- : out std_logic_vector(3 downto 0);--
			m_wb_we_o                                  => wb_b_we_i, -- : out std_logic;--
			m_wb_dat_i                                 => wb_b_data_o, -- : in std_logic_vector(31 downto 0);--
			m_wb_dat_o                                 => wb_b_data_i, -- : out std_logic_vector(31 downto 0);--
			m_wb_cyc_o                                 => wb_b_cyc_i, -- : out std_logic;--
			m_wb_stb_o                                 => wb_b_stb_i, -- : out std_logic;--
			m_wb_ack_i                                 => wb_b_ack_o, -- : in std_logic;--
			m_wb_err_i                                 => wb_b_err_o, -- : in std_logic;--

			--// Tx
			mtx_clk_pad_i                              => mtx_clk_pad_i, -- : in std_logic;-- Transmit clock (from PHY)
			mtxd_pad_o                                 => mtxd_pad_o, -- : out std_logic_vector(3 downto 0);-- Transmit nibble (to PHY)
			mtxen_pad_o                                => mtxen_pad_o, -- : out std_logic;-- Transmit enable (to PHY)
			mtxerr_pad_o                               => mtxerr_pad_o, -- : out std_logic;-- Transmit error (to PHY)

			--// Rx
			mrx_clk_pad_i                              => mrx_clk_pad_i, -- : in std_logic;-- Receive clock (from PHY)
			mrxd_pad_i                                 => mrxd_pad_i, -- : in std_logic_vector(3 downto 0);-- Receive nibble (from PHY)
			mrxdv_pad_i                                => mrxdv_pad_i, -- : in std_logic;-- Receive data valid (from PHY)
			mrxerr_pad_i                               => mrxerr_pad_i, -- : in std_logic;-- Receive data error (from PHY)

			--// Common Tx and Rx
			mcoll_pad_i                                => mcoll_pad_i, -- : in std_logic;-- Collision (from PHY)
			mcrs_pad_i                                 => mcrs_pad_i, -- : in std_logic;-- Carrier sense (from PHY)

			--// MII Management interface
			md_pad_i                                   => md_pad_i,
			mdc_pad_o                                  => mdc_pad_o,
			md_pad_o                                   => md_pad_o,
			md_padoe_o                                 => md_padoe_o,
			int_o                                      => int_o
		);

	rx_tx_buffer_comp_0 : rx_tx_buffer
		generic map(
			ADDR_WIDTH => (BUFF_ADDR_WIDTH - 2)
		)
		port map(
			clk       => clk,
			rst       => rst,

			-- OCP IN (slave) for Patmos
			MCmd      => M_Cmd_b,
			MAddr     => M_Addr((BUFF_ADDR_WIDTH - 1) downto 2),
			MData     => M_Data,
			MByteEn   => M_ByteEn,
			SResp     => S_Resp_b,
			SData     => S_Data_b,

			-- Wishbone Slave (for EthMac controller)
			wb_addr_i => wb_b_addr_i((BUFF_ADDR_WIDTH - 1) downto 2), --tanslation from byte to word based address
			wb_sel_i  => wb_b_sel_i,
			wb_we_i   => wb_b_we_i,
			wb_data_o => wb_b_data_o,
			wb_data_i => wb_b_data_i,
			wb_cyc_i  => wb_b_cyc_i,
			wb_stb_i  => wb_b_stb_i,
			wb_ack_o  => wb_b_ack_o,
			wb_err_o  => wb_b_err_o
		);

end rtl; 
