-- based on https://github.com/ipbus/ipbus-firmware/blob/master/components/ipbus_eth/firmware/hdl/eth_us_1000basex.vhd
-- taken at commit e9d7ddbb8ab196fe0974213bd1feb30514619123

---------------------------------------------------------------------------------
--
--   Copyright 2017 - Rutherford Appleton Laboratory and University of Bristol
--
--   Licensed under the Apache License, Version 2.0 (the "License");
--   you may not use this file except in compliance with the License.
--   You may obtain a copy of the License at
--
--       http://www.apache.org/licenses/LICENSE-2.0
--
--   Unless required by applicable law or agreed to in writing, software
--   distributed under the License is distributed on an "AS IS" BASIS,
--   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--   See the License for the specific language governing permissions and
--   limitations under the License.
--
--                                     - - -
--
--   Additional information about ipbus-firmare and the list of ipbus-firmware
--   contacts are available at
--
--       https://ipbus.web.cern.ch/ipbus
--
---------------------------------------------------------------------------------


-- Contains the instantiation of the Xilinx MAC & 1000baseX pcs/pma & GTP transceiver cores
--
-- Do not change signal names in here without corresponding alteration to the timing contraints file
--
-- Dave Newbold, October 2016

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

entity eth_sgmii_lvds_vcu118 is
    port(
        -- clock and data i/o (connected to external device)
        sgmii_clk_p : in    std_logic;  --> 625 MHz clock
        sgmii_clk_n : in    std_logic;
        sgmii_txp   : out   std_logic;
        sgmii_txn   : out   std_logic;
        sgmii_rxp   : in    std_logic;
        sgmii_rxn   : in    std_logic;
        -- output reset and power signals (to the external device)
        phy_on      : out   std_logic;  -- on/off signal
        phy_resetb  : out   std_logic;  -- reset signal (inverted)
        phy_mdio    : inout std_logic;  -- control line to program the PHY chip
        phy_mdc     : out   std_logic;  -- clock line (must be < 2.5 MHz)
        -- 125 MHz clocks
        clk125_eth  : out   std_logic;  -- 125 MHz from ethernet
        -- input free-running clock
        clk125_fr   : in    std_logic;
        -- connection control and status (to logic)
        rst         : in    std_logic;  -- request reset of ethernet system
        rst_o       : out   std_logic;  -- request reset of output
        locked      : out   std_logic;  -- locked to ethernet clock
        debug_leds  : out   std_logic_vector(7 downto 0);
        dip_sw      : in    std_logic_vector(3 downto 0);
        -- data in and out (connected to ipbus)
        tx_data     : in    std_logic_vector(7 downto 0);
        tx_valid    : in    std_logic;
        tx_last     : in    std_logic;
        tx_error    : in    std_logic;
        tx_ready    : out   std_logic;
        rx_data     : out   std_logic_vector(7 downto 0);
        rx_valid    : out   std_logic;
        rx_last     : out   std_logic;
        rx_error    : out   std_logic
        );

end eth_sgmii_lvds_vcu118;

architecture rtl of eth_sgmii_lvds_vcu118 is
    --- this is the MAC ---
    component temac_gbe_v9_0
        port (
            gtx_clk                 : in  std_logic;
            glbl_rstn               : in  std_logic;
            rx_axi_rstn             : in  std_logic;
            tx_axi_rstn             : in  std_logic;
            rx_statistics_vector    : out std_logic_vector(27 downto 0);
            rx_statistics_valid     : out std_logic;
            rx_mac_aclk             : out std_logic;
            rx_reset                : out std_logic;
            rx_axis_mac_tdata       : out std_logic_vector(7 downto 0);
            rx_axis_mac_tvalid      : out std_logic;
            rx_axis_mac_tlast       : out std_logic;
            rx_axis_mac_tuser       : out std_logic;
            tx_ifg_delay            : in  std_logic_vector(7 downto 0);
            tx_statistics_vector    : out std_logic_vector(31 downto 0);
            tx_statistics_valid     : out std_logic;
            tx_mac_aclk             : out std_logic;
            tx_reset                : out std_logic;
            tx_axis_mac_tdata       : in  std_logic_vector(7 downto 0);
            tx_axis_mac_tvalid      : in  std_logic;
            tx_axis_mac_tlast       : in  std_logic;
            tx_axis_mac_tuser       : in  std_logic_vector(0 downto 0);
            tx_axis_mac_tready      : out std_logic;
            pause_req               : in  std_logic;
            pause_val               : in  std_logic_vector(15 downto 0);
            speedis100              : out std_logic;
            speedis10100            : out std_logic;
            gmii_txd                : out std_logic_vector(7 downto 0);
            gmii_tx_en              : out std_logic;
            gmii_tx_er              : out std_logic;
            gmii_rxd                : in  std_logic_vector(7 downto 0);
            gmii_rx_dv              : in  std_logic;
            gmii_rx_er              : in  std_logic;
            rx_configuration_vector : in  std_logic_vector(79 downto 0);
            tx_configuration_vector : in  std_logic_vector(79 downto 0)
            );
    end component;

    -- this is the SGMII adapter + transceiver using LVDS SelectIO ---
    component gig_eth_pcs_pma_gmii_to_sgmii_bridge
        port (
            txp_0                  : out std_logic;
            txn_0                  : out std_logic;
            rxp_0                  : in  std_logic;
            rxn_0                  : in  std_logic;
            signal_detect_0        : in  std_logic;
            an_adv_config_vector_0 : in  std_logic_vector(15 downto 0);
            an_restart_config_0    : in  std_logic;
            an_interrupt_0         : out std_logic;
            gmii_txd_0             : in  std_logic_vector (7 downto 0);
            gmii_tx_en_0           : in  std_logic;
            gmii_tx_er_0           : in  std_logic;
            gmii_rxd_0             : out std_logic_vector (7 downto 0);
            gmii_rx_dv_0           : out std_logic;
            gmii_rx_er_0           : out std_logic;
            gmii_isolate_0         : out std_logic;
            sgmii_clk_r_0          : out std_logic;
            sgmii_clk_f_0          : out std_logic;
            sgmii_clk_en_0         : out std_logic;
            speed_is_10_100_0      : in  std_logic;
            speed_is_100_0         : in  std_logic;
            status_vector_0        : out std_logic_vector (15 downto 0);
            configuration_vector_0 : in  std_logic_vector (4 downto 0);
            refclk625_p            : in  std_logic;
            refclk625_n            : in  std_logic;
            clk125_out             : out std_logic;
            clk312_out             : out std_logic;
            rst_125_out            : out std_logic;
            tx_logic_reset         : out std_logic;
            rx_logic_reset         : out std_logic;
            rx_locked              : out std_logic;
            tx_locked              : out std_logic;
            tx_bsc_rst_out         : out std_logic;
            rx_bsc_rst_out         : out std_logic;
            tx_bs_rst_out          : out std_logic;
            rx_bs_rst_out          : out std_logic;
            tx_rst_dly_out         : out std_logic;
            rx_rst_dly_out         : out std_logic;
            tx_bsc_en_vtc_out      : out std_logic;
            rx_bsc_en_vtc_out      : out std_logic;
            tx_bs_en_vtc_out       : out std_logic;
            rx_bs_en_vtc_out       : out std_logic;
            riu_clk_out            : out std_logic;
            riu_addr_out           : out std_logic_vector (5 downto 0);
            riu_wr_data_out        : out std_logic_vector (15 downto 0);
            riu_wr_en_out          : out std_logic;
            riu_nibble_sel_out     : out std_logic_vector (1 downto 0);
            riu_rddata_3           : in  std_logic_vector (15 downto 0);
            riu_valid_3            : in  std_logic;
            riu_prsnt_3            : in  std_logic;
            riu_rddata_2           : in  std_logic_vector (15 downto 0);
            riu_valid_2            : in  std_logic;
            riu_prsnt_2            : in  std_logic;
            riu_rddata_1           : in  std_logic_vector (15 downto 0);
            riu_valid_1            : in  std_logic;
            riu_prsnt_1            : in  std_logic;
            rx_btval_3             : out std_logic_vector (8 downto 0);
            rx_btval_2             : out std_logic_vector (8 downto 0);
            rx_btval_1             : out std_logic_vector (8 downto 0);
            tx_dly_rdy_1           : in  std_logic;
            rx_dly_rdy_1           : in  std_logic;
            rx_vtc_rdy_1           : in  std_logic;
            tx_vtc_rdy_1           : in  std_logic;
            tx_dly_rdy_2           : in  std_logic;
            rx_dly_rdy_2           : in  std_logic;
            rx_vtc_rdy_2           : in  std_logic;
            tx_vtc_rdy_2           : in  std_logic;
            tx_dly_rdy_3           : in  std_logic;
            rx_dly_rdy_3           : in  std_logic;
            rx_vtc_rdy_3           : in  std_logic;
            tx_vtc_rdy_3           : in  std_logic;
            tx_pll_clk_out         : out std_logic;
            rx_pll_clk_out         : out std_logic;
            tx_rdclk_out           : out std_logic;
            reset                  : in  std_logic
            );
    end component;

    --- clocks
    signal clk125_sgmii, clk2mhz        : std_logic;
    --- slow clocks and edges
    signal onehz, onehz_d, onehz_re     : std_logic                    := '0';  -- slow generated clocks
    --- resets
    signal rst_delay_slr                : std_logic_vector(4 downto 0) := (others => '1');  -- reset delay shift-register
    signal rst_i, rst_i_n               : std_logic;  -- in to logic
    signal rst125_sgmii, rst125_sgmii_n : std_logic;  -- out from SGMII
    signal tx_reset_out, rx_reset_out   : std_logic;  -- out from MAC
    --- locked
    signal rx_locked, tx_locked         : std_logic;

    -- data
    signal gmii_txd, gmii_rxd                             : std_logic_vector(7 downto 0);
    signal gmii_tx_en, gmii_tx_er, gmii_rx_dv, gmii_rx_er : std_logic;

    -- sgmii controls and status
    signal an_restart, an_restart_d : std_logic := '0';
    signal sgmii_status_vector      : std_logic_vector(15 downto 0);

    -- mdio controls and status
    signal phy_cfg_done, phy_cfg_done_d, phy_cfg_not_done, phy_clkcfg_done, phy_poll_done      : std_logic := '0';
    signal phy_status_reg1, phy_status_reg2, phy_status_reg3, phy_status_reg4, phy_status_reg5 : std_logic_vector(15 downto 0);

begin

    phy_on <= '1';

    clkdiv : entity work.ipbus_clock_div
        port map(
            clk => clk125_fr,
            d7  => clk2mhz,
            d28 => onehz
            );

    phy_mdc <= clk2mhz;

    process(clk125_fr)
    begin
        if rising_edge(clk125_fr) then  -- ff's with CE
            onehz_d <= onehz;
        end if;
    end process;
    onehz_re <= '1' when (onehz = '1' and onehz_d = '0') else '0';

    -- Merge with previous loop?
    process(clk125_fr, rst)             -- async-presettables ff's with CE
    begin
        if rst = '1' then
            rst_delay_slr <= (others => '1');
        elsif rising_edge(clk125_fr) then
            if onehz_re = '1' then
                rst_delay_slr <= "0" & rst_delay_slr(4 downto 1);
            end if;
        end if;
    end process;


    -- Auto negotiator.
    -- 2 clock-cycle (?) high on the rising edge of phy_cfg_done.
    process(clk125_fr)
    begin
        if rising_edge(clk125_fr) then
            phy_cfg_done_d <= phy_cfg_done;
            if phy_cfg_done_d = '0' and phy_cfg_done = '1' then
                an_restart   <= '1';
                an_restart_d <= '1';
            else
                an_restart   <= an_restart_d;
                an_restart_d <= '0';
            end if;
        end if;
    end process;

    -- Reset to PHY, active low. The first to be release after 2s
    phy_resetb <= not rst_delay_slr(3);

    -- Reset to PHY config module and temac
    rst_i   <= rst_delay_slr(0);        -- high until reset slr is flushed
    rst_i_n <= not rst_i;  -- as the previous, but negated because the temac like it so

    rst125_sgmii_n <= not rst125_sgmii;
    -- Reset to temac clients (outgoing)
    rst_o          <= tx_reset_out or rx_reset_out;


    mac : temac_gbe_v9_0
        port map(
            gtx_clk                 => clk125_sgmii,
            glbl_rstn               => rst_i_n,
            rx_axi_rstn             => rst125_sgmii_n,
            tx_axi_rstn             => rst125_sgmii_n,
            rx_statistics_vector    => open,
            rx_statistics_valid     => open,
            rx_mac_aclk             => open,
            rx_reset                => rx_reset_out,
            rx_axis_mac_tdata       => rx_data,
            rx_axis_mac_tvalid      => rx_valid,
            rx_axis_mac_tlast       => rx_last,
            rx_axis_mac_tuser       => rx_error,
            tx_ifg_delay            => X"00",
            tx_statistics_vector    => open,
            tx_statistics_valid     => open,
            tx_mac_aclk             => open,
            tx_reset                => tx_reset_out,
            tx_axis_mac_tdata       => tx_data,
            tx_axis_mac_tvalid      => tx_valid,
            tx_axis_mac_tlast       => tx_last,
            tx_axis_mac_tuser(0)    => tx_error,
            tx_axis_mac_tready      => tx_ready,
            pause_req               => '0',
            pause_val               => X"0000",
            gmii_txd                => gmii_txd,
            gmii_tx_en              => gmii_tx_en,
            gmii_tx_er              => gmii_tx_er,
            gmii_rxd                => gmii_rxd,
            gmii_rx_dv              => gmii_rx_dv,
            gmii_rx_er              => gmii_rx_er,
            rx_configuration_vector => X"0000_0000_0000_0000_0812",
            tx_configuration_vector => X"0000_0000_0000_0000_0012"
            );

    sgmii : gig_eth_pcs_pma_gmii_to_sgmii_bridge
        port map (
            refclk625_p            => sgmii_clk_p,
            refclk625_n            => sgmii_clk_n,
            txp_0                  => sgmii_txp,
            txn_0                  => sgmii_txn,
            rxp_0                  => sgmii_rxp,
            rxn_0                  => sgmii_rxn,
            signal_detect_0        => phy_clkcfg_done,
            an_adv_config_vector_0 => b"1101_1000_0000_0001",  -- probably useless
            an_restart_config_0    => an_restart,       --important
            an_interrupt_0         => open,             --useless
            gmii_txd_0             => gmii_txd,
            gmii_tx_en_0           => gmii_tx_en,
            gmii_tx_er_0           => gmii_tx_er,
            gmii_rxd_0             => gmii_rxd,
            gmii_rx_dv_0           => gmii_rx_dv,
            gmii_rx_er_0           => gmii_rx_er,
            gmii_isolate_0         => open,
            sgmii_clk_r_0          => open,             --??
            sgmii_clk_f_0          => open,             --??
            sgmii_clk_en_0         => open,             --??
            speed_is_10_100_0      => '0',
            speed_is_100_0         => '0',
            status_vector_0        => sgmii_status_vector,
            configuration_vector_0 => (4 => '1', 3 => phy_cfg_not_done, others => '0'),
            clk125_out             => clk125_sgmii,
            rst_125_out            => rst125_sgmii,
            rx_locked              => rx_locked,
            tx_locked              => tx_locked,
            -- al this below is dummy but needed
            riu_rddata_3           => X"0000",
            riu_valid_3            => '0',
            riu_prsnt_3            => '0',
            riu_rddata_2           => X"0000",
            riu_valid_2            => '0',
            riu_prsnt_2            => '0',
            riu_rddata_1           => X"0000",
            riu_valid_1            => '0',
            riu_prsnt_1            => '0',
            tx_dly_rdy_1           => '1',
            rx_dly_rdy_1           => '1',
            rx_vtc_rdy_1           => '1',
            tx_vtc_rdy_1           => '1',
            tx_dly_rdy_2           => '1',
            rx_dly_rdy_2           => '1',
            rx_vtc_rdy_2           => '1',
            tx_vtc_rdy_2           => '1',
            tx_dly_rdy_3           => '1',
            rx_dly_rdy_3           => '1',
            rx_vtc_rdy_3           => '1',
            tx_vtc_rdy_3           => '1',
            -- input reset
            reset                  => phy_cfg_not_done  -- hold the bridge in reset until PHY is up and happy
            );

    clk125_eth <= clk125_sgmii;
    locked     <= rx_locked and tx_locked;

    phy_cfgrt : entity work.phy_mdio_configurator_vcu118
        port map (
            clk125      => clk125_fr,
            mdc         => clk2mhz,
            rst         => rst_i,
            done        => phy_cfg_done,
            clkdone     => phy_clkcfg_done,
            poll_enable => '1',
            poll_clk    => onehz,
            poll_done   => phy_poll_done,
            status_reg1 => phy_status_reg1,
            status_reg2 => phy_status_reg2,
            status_reg3 => phy_status_reg3,
            status_reg4 => phy_status_reg4,
            status_reg5 => phy_status_reg5,
            phy_mdio    => phy_mdio);

    -- Needed by sgmii ports
    phy_cfg_not_done <= not(phy_clkcfg_done);

    -- sgmii_status_vector: 1G/2.5G Ethernet PCS/PMA or SGMII v16.0 Status registers
    -- From Table 2-41, page 64 of
    -- https://www.xilinx.com/support/documentation/ip_documentation/gig_ethernet_pcs_pma/v16_0/pg047-gig-eth-pcs-pma.pdf
    -- 0: Link Status
    -- 1: Link Synchronisation
    -- 2: RUDI(/C/)
    -- 3: RUDI(/I/)
    -- 4: RUDI(INVALID)
    -- 5: RXDISPERR
    -- 6: RXNOTINTABLE
    -- 7: PHY Link Status

    -- PHY status registers
    -- 
    -- https://www.ti.com/lit/gpn/DP83867E

    set_leds : process(clk125_fr)
    begin
        if rising_edge(clk125_fr) then
            case dip_sw(2 downto 0) is
                when "000" =>
                    debug_leds(0) <= onehz;
                    debug_leds(1) <= phy_cfg_done;
                    debug_leds(2) <= rx_locked and tx_locked;
                    debug_leds(3) <= not (tx_reset_out or rx_reset_out);
                    debug_leds(4) <= sgmii_status_vector(0) and sgmii_status_vector(1) and sgmii_status_vector(7);
                    debug_leds(5) <= sgmii_status_vector(3);
                    debug_leds(6) <= sgmii_status_vector(10);
                    debug_leds(7) <= sgmii_status_vector(11);
                when "001" =>
                    debug_leds(0) <= phy_clkcfg_done;
                    debug_leds(1) <= phy_cfg_done;
                    debug_leds(2) <= rx_locked and tx_locked;
                    debug_leds(3) <= rst125_sgmii;
                    debug_leds(4) <= not (tx_reset_out or rx_reset_out);
                    debug_leds(5) <= sgmii_status_vector(0) and sgmii_status_vector(1) and sgmii_status_vector(7);
                    debug_leds(6) <= sgmii_status_vector(3);
                    debug_leds(7) <= an_restart;
                when "010" => debug_leds(7 downto 0) <= (others => '0');
                when "011" => debug_leds(7 downto 0) <= (others => '0');
                when "100" =>
                    debug_leds(0) <= onehz;
                    debug_leds(1) <= phy_poll_done;
                    debug_leds(2) <= phy_status_reg1(5);
                    debug_leds(3) <= phy_status_reg1(4);
                    debug_leds(4) <= phy_status_reg1(3);
                    debug_leds(5) <= phy_status_reg1(2);
                    debug_leds(6) <= phy_status_reg1(1);
                    debug_leds(7) <= phy_status_reg1(0);
                when "101" =>
                    debug_leds(0) <= onehz;
                    debug_leds(1) <= phy_poll_done;
                    debug_leds(2) <= phy_status_reg2(13);
                    debug_leds(3) <= phy_status_reg2(12);
                    debug_leds(4) <= phy_status_reg2(11);
                    debug_leds(5) <= phy_status_reg2(10);
                    debug_leds(6) <= phy_status_reg2(1);
                    debug_leds(7) <= phy_status_reg2(0);
                when "110" =>
                    debug_leds(0) <= onehz;
                    debug_leds(1) <= phy_poll_done;
                    debug_leds(2) <= phy_status_reg3(14);
                    debug_leds(3) <= phy_status_reg3(13);
                    debug_leds(4) <= phy_status_reg3(11);
                    debug_leds(5) <= phy_status_reg3(10);
                    debug_leds(6) <= phy_status_reg3(9);
                    debug_leds(7) <= phy_status_reg3(8);
                when "111" =>
                    debug_leds(0) <= onehz;
                    debug_leds(1) <= phy_poll_done;
                    debug_leds(2) <= phy_status_reg4(15);
                    debug_leds(3) <= phy_status_reg4(14);
                    debug_leds(4) <= phy_status_reg4(13);
                    debug_leds(5) <= phy_status_reg4(12);
                    debug_leds(6) <= phy_status_reg4(11);
                    debug_leds(7) <= phy_status_reg4(10);
            end case;
        end if;
    end process;

end rtl;

