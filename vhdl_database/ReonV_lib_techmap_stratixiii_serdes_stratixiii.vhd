------------------------------------------------------------------------------
--  This file is a part of the GRLIB VHDL IP LIBRARY
--  Copyright (C) 2003 - 2008, Gaisler Research
--  Copyright (C) 2008 - 2014, Aeroflex Gaisler
--  Copyright (C) 2015 - 2017, Cobham Gaisler
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 
-----------------------------------------------------------------------------
-- Entity:      serdes_stratixiii
-- File:        serdes_stratixiii.vhd
-- Author:      Andrea Gianarro - Aeroflex Gaisler AB
-- Description: Stratix III and IV SGMII Gigabit Ethernet Serdes
------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.stdlib.all;
library techmap;
use techmap.gencomp.all;
library altera_mf;
use altera_mf.altera_mf_components.all;

entity serdes_stratixiii is
	port (
		clk_125 	: in std_logic;
		rst_125 	: in std_logic;
		rx_in 		: in std_logic; 					-- SER IN
		rx_out 		: out std_logic_vector(9 downto 0); -- PAR OUT
		rx_clk 		: out std_logic;
		rx_rstn		: out std_logic;
		rx_pll_clk	: out std_logic;
		rx_pll_rstn	: out std_logic;
		tx_pll_clk	: out std_logic;
		tx_pll_rstn	: out std_logic;
		tx_in		: in std_logic_vector(9 downto 0) ;	-- PAR IN
		tx_out		: out std_logic;					-- SER OUT
		bitslip 	: in std_logic
	);
end entity;

architecture rtl of serdes_stratixiii is

	signal rx_clk_int, rx_pll_clk_int, tx_pll_clk_int, rst_int, pll_areset_int, rx_locked_int, rx_rstn_int_0, tx_locked_int : std_logic;
	signal rx_cda_reset_int, bitslip_int, rx_in_int, rx_rst_int, rx_divfwdclk_int, tx_out_int : std_logic_vector(0 downto 0) ;
	signal rx_clk_rstn_int, rx_pll_rstn_int, tx_pll_rstn_int,  rx_cda_reset_int_0 : std_logic;
	signal rx_out_int, tx_in_int : std_logic_vector(9 downto 0) ;

	signal r0, r1, r2 : std_logic_vector(4 downto 0);
	signal r3 : std_logic_vector(5 downto 0);
	signal r4 : std_logic_vector(1 downto 0);
begin

	bitslip_int(0) <= bitslip;
	rx_in_int(0) <= rx_in;
	tx_in_int <= tx_in;
	rx_out <= rx_out_int;
	tx_out <= tx_out_int(0);
	-- output clocks
	rx_clk <= rx_clk_int;
	rx_pll_clk <= rx_pll_clk_int;
	tx_pll_clk <= tx_pll_clk_int;
	-- output synchronized resets
	rx_rstn <= rx_clk_rstn_int;
	rx_pll_rstn <= rx_pll_rstn_int;
	tx_pll_rstn <= tx_pll_rstn_int;

	--rx_cda_reset_int(0) <= rx_cda_reset_int_0;
	rx_rst_int(0) <= not rx_rstn_int_0;
	rx_clk_int <= rx_divfwdclk_int(0);

	-- reset synchronizers
	rst0 : process (rx_clk_int, rst_125) begin
      if rising_edge(rx_clk_int) then 
        r0 <= r0(3 downto 0) & rx_locked_int; 
        rx_clk_rstn_int <= r0(4) and r0(3) and r0(2);
      end if;
      if (rst_125 = '1') then r0 <= "00000"; rx_clk_rstn_int <= '0'; end if;
    end process;

	rst1 : process (rx_pll_clk_int, rx_clk_rstn_int) begin
      if rising_edge(rx_pll_clk_int) then 
        r1 <= r1(3 downto 0) & rx_locked_int; 
        rx_pll_rstn_int <= r1(4) and r1(3) and r1(2);
      end if;
      if (rx_clk_rstn_int = '0') then r1 <= "00000"; rx_pll_rstn_int <= '0'; end if;
    end process;

    rst2 : process (tx_pll_clk_int, rx_clk_rstn_int) begin
      if rising_edge(tx_pll_clk_int) then 
        r2 <= r2(3 downto 0) & tx_locked_int; 
        tx_pll_rstn_int <= r2(4) and r2(3) and r2(2);
      end if;
      if (rx_clk_rstn_int = '0') then r2 <= "00000"; tx_pll_rstn_int <= '0'; end if;
    end process;

    -- 6 stages reset synchronizer
    rst3 : process (clk_125, rst_125) begin
      if rising_edge(clk_125) then 
        r3 <= r3(4 downto 0) & rx_locked_int; 
        rx_rstn_int_0 <= r3(5) and r3(4) and r3(3);
      end if;
      if (rst_125 = '1') then r3 <= "000000"; rx_rstn_int_0 <= '0'; end if;
    end process;

	lvds_rx0: altlvds_rx
		generic map (
			buffer_implementation					=> "RAM",
			cds_mode								=> "UNUSED",
			--clk_src_is_pll							=> "off",
			common_rx_tx_pll						=> "ON",
			data_align_rollover						=> 10,
			--data_rate								=> "1250.0 Mbps",
			deserialization_factor					=> 10,
			dpa_initial_phase_value					=> 0,
			dpll_lock_count							=> 0,
			dpll_lock_window						=> 0,
			--enable_clock_pin_mode					=> "UNUSED",
			enable_dpa_align_to_rising_edge_only	=> "OFF",
			enable_dpa_calibration					=> "ON",
			enable_dpa_fifo							=> "UNUSED",
			enable_dpa_initial_phase_selection		=> "OFF",
			enable_dpa_mode							=> "ON",
			enable_dpa_pll_calibration				=> "OFF",
			enable_soft_cdr_mode					=> "ON",
			implement_in_les						=> "OFF",
			inclock_boost							=> 0,
			inclock_data_alignment					=> "EDGE_ALIGNED",
			inclock_period							=> 8000,
			inclock_phase_shift						=> 0,
			input_data_rate							=> 1250,
			intended_device_family					=> "Stratix IV",
			lose_lock_on_one_change					=> "UNUSED",
			lpm_hint								=> "UNUSED",
			lpm_type								=> "altlvds_rx",
			number_of_channels						=> 1,
			outclock_resource						=> "AUTO",
			pll_operation_mode						=> "UNUSED",
			pll_self_reset_on_loss_lock				=> "UNUSED",
			port_rx_channel_data_align				=> "PORT_USED",
			port_rx_data_align						=> "PORT_UNUSED",
			--refclk_frequency						=> "125.000000 MHz",
			registered_data_align_input				=> "UNUSED",
			registered_output						=> "ON",
			reset_fifo_at_first_lock				=> "UNUSED",
			rx_align_data_reg						=> "UNUSED",
			sim_dpa_is_negative_ppm_drift			=> "OFF",
			sim_dpa_net_ppm_variation				=> 0,
			sim_dpa_output_clock_phase_shift		=> 0,
			use_coreclock_input						=> "OFF",
			use_dpll_rawperror						=> "OFF",
			use_external_pll						=> "OFF",
			use_no_phase_shift						=> "ON",
			x_on_bitslip							=> "ON"
		)
		port map (
			pll_areset           	=> rst_125, --pll_areset_int,
			rx_channel_data_align	=> bitslip_int,
			rx_in                	=> rx_in_int,
			rx_inclock           	=> clk_125,
			rx_reset             	=> rx_rst_int,
			rx_divfwdclk         	=> rx_divfwdclk_int,
			rx_locked            	=> rx_locked_int,
			rx_out               	=> rx_out_int,
			rx_outclock          	=> rx_pll_clk_int,
			
			dpa_pll_cal_busy		=> open,
			dpa_pll_recal			=> '0',
			pll_phasecounterselect	=> open,
			pll_phasedone			=> '1',
			pll_phasestep			=> open,
			pll_phaseupdown			=> open,
			pll_scanclk				=> open,
			rx_cda_max				=> open,
			rx_cda_reset			=> (others => '0'),
			rx_coreclk				=> (others => '1'),
			rx_data_align			=> '0',
			rx_data_align_reset		=> '0',
			--rx_data_reset			=> '0',
			rx_deskew				=> '0',
			rx_dpa_lock_reset		=> (others => '0'),
			rx_dpa_locked			=> open,
			--rx_dpaclock				=> '0',
			rx_dpll_enable			=> (others => '1'),
			rx_dpll_hold			=> (others => '0'),
			rx_dpll_reset			=> (others => '0'),
			rx_enable				=> '1',
			rx_fifo_reset			=> (others => '0'),
			rx_pll_enable			=> '1',
			rx_readclock			=> '0',
			rx_syncclock			=> '0'
	);

	lvds_tx0: altlvds_tx
		generic map (
			center_align_msb			=> "UNUSED",
			--clk_src_is_pll				=> "off",
			common_rx_tx_pll			=> "ON",
			coreclock_divide_by			=> 1,
			--data_rate					=> "1250.0 Mbps",
			deserialization_factor		=> 10,
			differential_drive			=> 0,
			implement_in_les			=> "OFF",
			inclock_boost				=> 0,
			inclock_data_alignment		=> "EDGE_ALIGNED",
			inclock_period				=> 8000,
			inclock_phase_shift			=> 0,
			intended_device_family		=> "Stratix IV",
			lpm_hint					=> "UNUSED",
			lpm_type					=> "altlvds_tx",
			multi_clock					=> "OFF",
			number_of_channels			=> 1,
			outclock_alignment			=> "EDGE_ALIGNED",
			outclock_divide_by			=> 10,
			outclock_duty_cycle			=> 50,
			outclock_multiply_by		=> 1,
			outclock_phase_shift		=> 0,
			outclock_resource			=> "AUTO",
			output_data_rate			=> 1250,
			pll_self_reset_on_loss_lock	=> "OFF",
			preemphasis_setting			=> 0,
			--refclk_frequency			=> "125.00 MHz",
			registered_input			=> "TX_CORECLK",
			use_external_pll			=> "OFF",
			use_no_phase_shift			=> "ON",
			vod_setting					=> 0
		)
		port map (
			pll_areset      => rst_125, --pll_areset_int,
			tx_in           => tx_in_int,
			tx_inclock      => clk_125,
			tx_out          => tx_out_int,
			tx_locked		=> tx_locked_int,
			tx_coreclock    => tx_pll_clk_int,

			sync_inclock	=> '0',
			--tx_data_reset	=> '0',
			tx_enable		=> '1',
			tx_outclock		=> open,
			tx_pll_enable	=> '1',
			tx_syncclock	=> '0'
		);

end architecture ;
