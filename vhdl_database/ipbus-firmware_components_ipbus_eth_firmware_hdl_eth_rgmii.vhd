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




library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.VComponents.all;
--use work.emac_hostbus_decl.all;

library tri_mode_ethernet_mac;
use tri_mode_ethernet_mac.all;


entity eth_rgmii is
	port(
		gtx_clk                    : in std_logic;
		gtx_clk90                  : in std_logic;
		
		refclk                     : in std_logic;
		refclkready                : in std_logic;
		rst                        : in std_logic;
		
		
		rgmii_txd                  : out std_logic_vector(3 downto 0);
		rgmii_tx_ctl               : out std_logic;
		rgmii_txc                  : out std_logic;
		rgmii_rxd                  : in  std_logic_vector(3 downto 0);
		rgmii_rx_ctl               : in  std_logic;
		rgmii_rxc                  : in  std_logic;
		
		
		tx_data: in std_logic_vector(7 downto 0);
		tx_valid: in std_logic;
		tx_last: in std_logic;
		tx_error: in std_logic_vector(0 downto 0);
		tx_ready: out std_logic;
		rx_data: out std_logic_vector(7 downto 0);
		rx_valid: out std_logic;
		rx_last: out std_logic;
		rx_error: out std_logic

	);

end eth_rgmii;

architecture rtl of eth_rgmii is

	-- COMPONENT tri_mode_ethernet_mac_v9_0_3
	  -- PORT (
		 -- glbl_rstn : IN STD_LOGIC;
		 -- rx_axi_rstn : IN STD_LOGIC;
		 -- tx_axi_rstn : IN STD_LOGIC;
		 -- rx_axi_clk : IN STD_LOGIC;
		 -- rx_reset_out : OUT STD_LOGIC;
		 -- rx_axis_mac_tdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 -- rx_axis_mac_tvalid : OUT STD_LOGIC;
		 -- rx_axis_mac_tlast : OUT STD_LOGIC;
		 -- rx_axis_mac_tuser : OUT STD_LOGIC;
		 -- rx_statistics_vector : OUT STD_LOGIC_VECTOR(27 DOWNTO 0);
		 -- rx_statistics_valid : OUT STD_LOGIC;
		 -- tx_axi_clk : IN STD_LOGIC;
		 -- tx_reset_out : OUT STD_LOGIC;
		 -- tx_axis_mac_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 -- tx_axis_mac_tvalid : IN STD_LOGIC;
		 -- tx_axis_mac_tlast : IN STD_LOGIC;
		 -- tx_axis_mac_tuser : IN STD_LOGIC;
		 -- tx_axis_mac_tready : OUT STD_LOGIC;
		 -- tx_ifg_delay : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 -- tx_statistics_vector : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 -- tx_statistics_valid : OUT STD_LOGIC;
		 -- pause_req : IN STD_LOGIC;
		 -- pause_val : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 -- speed_is_100 : OUT STD_LOGIC;
		 -- speed_is_10_100 : OUT STD_LOGIC;
		 -- gmii_txd : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 -- gmii_tx_en : OUT STD_LOGIC;
		 -- gmii_tx_er : OUT STD_LOGIC;
		 -- gmii_rxd : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 -- gmii_rx_dv : IN STD_LOGIC;
		 -- gmii_rx_er : IN STD_LOGIC;
		 -- rx_mac_config_vector : IN STD_LOGIC_VECTOR(79 DOWNTO 0);
		 -- tx_mac_config_vector : IN STD_LOGIC_VECTOR(79 DOWNTO 0)
	  -- );
	-- END COMPONENT;
	
	
	
	component eth
   port(
      gtx_clk                    : in  std_logic;
      gtx_clk90                  : in  std_logic;
      glbl_rstn                  : in  std_logic;
      rx_axi_rstn                : in  std_logic;
      tx_axi_rstn                : in  std_logic;
      rx_statistics_vector       : out std_logic_vector(27 downto 0);
      rx_statistics_valid        : out std_logic;
      rx_mac_aclk                : out std_logic;
      rx_reset                   : out std_logic;
      rx_axis_mac_tdata          : out std_logic_vector(7 downto 0);
      rx_axis_mac_tvalid         : out std_logic;
      rx_axis_mac_tlast          : out std_logic;
      rx_axis_mac_tuser          : out std_logic;
      tx_ifg_delay               : in  std_logic_vector(7 downto 0);
      tx_statistics_vector       : out std_logic_vector(31 downto 0);
      tx_statistics_valid        : out std_logic;
      tx_mac_aclk                : out std_logic;
      tx_reset                   : out std_logic;
      tx_axis_mac_tdata          : in  std_logic_vector(7 downto 0);
      tx_axis_mac_tvalid         : in  std_logic;
      tx_axis_mac_tlast          : in  std_logic;
      tx_axis_mac_tuser          : in  std_logic_vector(0 downto 0);
      tx_axis_mac_tready         : out std_logic;
      pause_req                  : in  std_logic;
      pause_val                  : in  std_logic_vector(15 downto 0);
      speedis100                 : out std_logic;
      speedis10100               : out std_logic;
      rgmii_txd                  : out std_logic_vector(3 downto 0);
      rgmii_tx_ctl               : out std_logic;
      rgmii_txc                  : out std_logic;
      rgmii_rxd                  : in  std_logic_vector(3 downto 0);
      rgmii_rx_ctl               : in  std_logic;
      rgmii_rxc                  : in  std_logic;
      inband_link_status         : out std_logic;
      inband_clock_speed         : out std_logic_vector(1 downto 0);
      inband_duplex_status       : out std_logic;
      rx_configuration_vector    : in  std_logic_vector(79 downto 0);
      tx_configuration_vector    : in  std_logic_vector(79 downto 0)
   );
   end component;
	

	COMPONENT mac_fifo_axi4
	  PORT (
		 m_aclk : IN STD_LOGIC;
		 s_aclk : IN STD_LOGIC;
		 s_aresetn : IN STD_LOGIC;
		 s_axis_tvalid : IN STD_LOGIC;
		 s_axis_tready : OUT STD_LOGIC;
		 s_axis_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 s_axis_tlast : IN STD_LOGIC;
		 s_axis_tuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		 m_axis_tvalid : OUT STD_LOGIC;
		 m_axis_tready : IN STD_LOGIC;
		 m_axis_tdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 m_axis_tlast : OUT STD_LOGIC;
		 m_axis_tuser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
	  );
	END COMPONENT;

	signal rx_clk, rx_clk_io, gtx_clkn: std_logic;
	--signal txd_e, rxd_r: std_logic_vector(7 downto 0);
	--signal tx_en_e, tx_er_e, rx_dv_r, rx_er_r: std_logic;
	--signal gmii_rxd_del: std_logic_vector(7 downto 0);
	--signal gmii_rx_dv_del, gmii_rx_er_del: std_logic;
	
	signal rx_data_e: std_logic_vector(7 downto 0);
	signal rx_valid_e, rx_last_e, rx_user_e, rx_rst, rstn: std_logic;
	signal rx_user_f, rx_user_ef: std_logic_vector(0 downto 0);
	signal idelay_reset_cnt : std_logic_vector(3 downto 0);
	signal idelayctrl_reset : std_logic;
	signal idelayctrl_reset_sync : std_logic;
	--signal rx_valid_f, rx_valid_d: std_logic;
	
begin

	-- bufio0: bufio2 port map(
		-- i => gmii_rx_clk,
		-- ioclk => rx_clk_io
	-- );
	
	 bufg0: bufg port map(
		 i => rgmii_rxc,
		 o => rx_clk
	 );
	
	-- iodelgen: for i in 7 downto 0 generate
	-- begin
		-- iodelay: iodelay2
			-- generic map(
				-- DELAY_SRC => "IDATAIN",
				-- IDELAY_TYPE => "FIXED"
			-- )
			-- port map(
				-- idatain => gmii_rxd(i),
				-- dataout => gmii_rxd_del(i),
				-- cal => '0',
				-- ce => '0',
				-- clk => '0',
				-- inc => '0',
				-- ioclk0 => '0',
				-- ioclk1 => '0',
				-- odatain => '0',
				-- rst => '0',
				-- t => '1'
			-- ); -- Delay element for phase alignment
	
	-- end generate;
	
	-- iodelay_dv: iodelay2
		-- generic map(
			-- DELAY_SRC => "IDATAIN",
			-- IDELAY_TYPE => "FIXED"
		-- )
		-- port map(
			-- idatain => gmii_rx_dv,
			-- dataout => gmii_rx_dv_del,
			-- cal => '0',
			-- ce => '0',
			-- clk => '0',
			-- inc => '0',
			-- ioclk0 => '0',
			-- ioclk1 => '0',
			-- odatain => '0',
			-- rst => '0',
			-- t => '1'
		-- ); -- Delay element on rx clock for phase alignment
		
	-- iodelay_er: iodelay2
		-- generic map(
			-- DELAY_SRC => "IDATAIN",
			-- IDELAY_TYPE => "FIXED"
		-- )
		-- port map(
			-- idatain => gmii_rx_er,
			-- dataout => gmii_rx_er_del,
			-- cal => '0',
			-- ce => '0',
			-- clk => '0',
			-- inc => '0',
			-- ioclk0 => '0',
			-- ioclk1 => '0',
			-- odatain => '0',
			-- rst => '0',
			-- t => '1'
		-- ); -- Delay element for phase alignment

	-- process(rx_clk_io) -- FFs for incoming GMII data (need to be IOB FFs)
	-- begin
		-- if rising_edge(rx_clk_io) then
			-- rxd_r <= gmii_rxd_del;
			-- rx_dv_r <= gmii_rx_dv_del;
			-- rx_er_r <= gmii_rx_er_del;
		-- end if;
	-- end process;

	-- process(gtx_clk) -- FFs for outgoing GMII data (need to be IOB FFs)
	-- begin
		-- if rising_edge(gtx_clk) then
			-- gmii_txd <= txd_e;
			-- gmii_tx_en <= tx_en_e;
			-- gmii_tx_er <= tx_er_e;
		-- end if;
	-- end process;
	
	--gtx_clkn <= not gtx_clk;
	
	-- oddr0: oddr2 port map(
		-- q => gmii_gtx_clk,
		-- c0 => gtx_clk,
		-- c1 => gtx_clkn,
		-- ce => '1',
		-- d0 => '0',
		-- d1 => '1',
		-- r => '0',
		-- s => '0'
	-- ); -- DDR register for clock forwarding
	
	
	   process (refclk)
   begin
      if refclk'event and refclk = '1' then
         if idelayctrl_reset_sync = '1' then
            idelay_reset_cnt <= "0000";
            idelayctrl_reset <= '1';
         else
            idelayctrl_reset <= '1';
            case idelay_reset_cnt is
            when "0000"  => idelay_reset_cnt <= "0001";
            when "0001"  => idelay_reset_cnt <= "0010";
            when "0010"  => idelay_reset_cnt <= "0011";
            when "0011"  => idelay_reset_cnt <= "0100";
            when "0100"  => idelay_reset_cnt <= "0101";
            when "0101"  => idelay_reset_cnt <= "0110";
            when "0110"  => idelay_reset_cnt <= "0111";
            when "0111"  => idelay_reset_cnt <= "1000";
            when "1000"  => idelay_reset_cnt <= "1001";
            when "1001"  => idelay_reset_cnt <= "1010";
            when "1010"  => idelay_reset_cnt <= "1011";
            when "1011"  => idelay_reset_cnt <= "1100";
            when "1100"  => idelay_reset_cnt <= "1101";
            when "1101"  => idelay_reset_cnt <= "1110";
            when others  => idelay_reset_cnt <= "1110";
                            idelayctrl_reset <= '0';
            end case;
         end if;
      end if;
   end process;
	
	
	
	
	

   eth_idelayctrl : IDELAYCTRL
    generic map (
      SIM_DEVICE => "7SERIES"
    )
    port map (
      --RDY                    => refclkready,
      REFCLK                 => refclk,
      RST                    => idelayctrl_reset
   );

	rstn <= not rst;

	eth0: eth port map(
		gtx_clk => gtx_clk,
		gtx_clk90 => gtx_clk90,
		glbl_rstn => rstn,
		rx_axi_rstn => '1',
		tx_axi_rstn => '1',
		rx_reset => open,
		rx_axis_mac_tdata => rx_data_e,
		--rx_axis_mac_tdata => rx_data,
		rx_axis_mac_tvalid => rx_valid_e,
		--rx_axis_mac_tvalid => rx_valid,
		rx_axis_mac_tlast => rx_last_e,
		--rx_axis_mac_tlast => rx_last,
		rx_axis_mac_tuser => rx_user_e,
		--rx_axis_mac_tuser => rx_error,
		rx_statistics_vector => open,
		rx_statistics_valid => open,
		tx_reset => open,
		tx_axis_mac_tdata => tx_data,
		tx_axis_mac_tvalid => tx_valid,
		tx_axis_mac_tlast => tx_last,
		tx_axis_mac_tuser => tx_error,
		tx_axis_mac_tready => tx_ready,
		tx_ifg_delay => X"00",
		tx_statistics_vector => open,
		tx_statistics_valid => open,
		pause_req => '0',
		pause_val => X"0000",
		speedis100 => open,
		speedis10100 => open,
		-- gmii_txd => txd_e,
		-- gmii_tx_en => tx_en_e,
		-- gmii_tx_er => tx_er_e,
		-- gmii_rxd => rxd_r,
		-- gmii_rx_dv => rx_dv_r,
		-- gmii_rx_er => rx_er_r,
		rx_configuration_vector => X"0000_0000_0000_0000_0812",
		tx_configuration_vector => X"0000_0000_0000_0000_0012",
		inband_link_status => open,     
		inband_clock_speed => open,     
		inband_duplex_status => open, 
		rx_mac_aclk => open,           
        tx_mac_aclk => open, 

        rgmii_txd => rgmii_txd,              
        rgmii_tx_ctl => rgmii_tx_ctl,          
        rgmii_txc => rgmii_txc,         
        rgmii_rxd => rgmii_rxd,        
        rgmii_rx_ctl => rgmii_rx_ctl,         
        rgmii_rxc => rgmii_rxc

	);
	
	rx_user_ef(0) <= rx_user_e;
	rx_error <= rx_user_f(0);
	
	process(rx_clk)
	begin
		if rising_edge(rx_clk) then
			rx_rst <= not rst;
		end if;
	end process;
	
	fifo: mac_fifo_axi4 port map(
		m_aclk => gtx_clk,
		s_aclk => rx_clk,
		s_aresetn => rx_rst,
		s_axis_tvalid => rx_valid_e,
		s_axis_tready => open,
		s_axis_tdata => rx_data_e,
		s_axis_tlast => rx_last_e,
		s_axis_tuser => rx_user_ef,
		m_axis_tvalid => rx_valid,
		m_axis_tready => '1',
		m_axis_tdata => rx_data,
		m_axis_tlast => rx_last,
		m_axis_tuser => rx_user_f
	); -- Clock domain crossing FIFO
	
	-- hostbus_out.hostrddata <= (others => '0');
	-- hostbus_out.hostmiimrdy <= '0';
	
end rtl;

