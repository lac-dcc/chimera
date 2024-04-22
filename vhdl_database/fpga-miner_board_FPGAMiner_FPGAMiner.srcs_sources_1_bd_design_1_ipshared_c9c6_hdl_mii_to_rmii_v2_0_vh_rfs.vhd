-----------------------------------------------------------------------
    -- (c) Copyright 1984 - 2012 Xilinx, Inc. All rights reserved.
    --
    -- This file contains confidential and proprietary information
    -- of Xilinx, Inc. and is protected under U.S. and
    -- international copyright and other intellectual property
    -- laws.
    --
    -- DISCLAIMER
    -- This disclaimer is not a license and does not grant any
    -- rights to the materials distributed herewith. Except as
    -- otherwise provided in a valid license issued to you by
    -- Xilinx, and to the maximum extent permitted by applicable
    -- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
    -- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
    -- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
    -- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
    -- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
    -- (2) Xilinx shall not be liable (whether in contract or tort,
    -- including negligence, or under any other theory of
    -- liability) for any loss or damage of any kind or nature
    -- related to, arising under or in connection with these
    -- materials, including for any direct, or any indirect,
    -- special, incidental, or consequential loss or damage
    -- (including loss of data, profits, goodwill, or any type of
    -- loss or damage suffered as a result of any action brought
    -- by a third party) even if such damage or loss was
    -- reasonably foreseeable or Xilinx had been advised of the
    -- possibility of the same.
    --
    -- CRITICAL APPLICATIONS
    -- Xilinx products are not designed or intended to be fail-
    -- safe, or for use in any application requiring fail-safe
    -- performance, such as life-support or safety devices or
    -- systems, Class III medical devices, nuclear facilities,
    -- applications related to the deployment of airbags, or any
    -- other applications that could lead to death, personal
    -- injury, or severe property or environmental damage
    -- (individually and collectively, "Critical
    -- Applications"). Customer assumes the sole risk and
    -- liability of any use of Xilinx products in Critical
    -- Applications, subject only to applicable laws and
    -- regulations governing limitations on product liability.
    --
    -- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
    -- PART OF THIS FILE AT ALL TIMES.
-----------------------------------------------------------------------
-- Filename:        rx_fifo_loader.vhd
--
-- Version:         v1.01.a
-- Description:     This module
--
------------------------------------------------------------------------------
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library mii_to_rmii_v2_0_17;

------------------------------------------------------------------------------
-- Port Declaration
------------------------------------------------------------------------------

entity rx_fifo_loader is
    generic (
            C_RESET_ACTIVE    :  std_logic
            );

    port    (
            Sync_rst_n        :  in   std_logic;
            Ref_Clk           :  in   std_logic;
            Phy2Rmii_crs_dv   :  in   std_logic;
            Phy2Rmii_rx_er    :  in   std_logic;
            Phy2Rmii_rxd      :  in   std_logic_vector(1  downto  0);
            Rx_fifo_wr_en     :  out  std_logic;
            Rx_10             :  out  std_logic;
            Rx_100            :  out  std_logic;
            Rx_data           :  out  std_logic_vector(7  downto  0);
            Rx_error          :  out  std_logic;
            Rx_data_valid     :  out  std_logic;
            Rx_cary_sense     :  out  std_logic;
            Rx_end_of_packet  :  out  std_logic
            );
end rx_fifo_loader;

------------------------------------------------------------------------------
-- Definition of Generics:
--
-- Definition of Ports:
--
------------------------------------------------------------------------------

architecture simulation of rx_fifo_loader is

attribute DowngradeIPIdentifiedWarnings: string;

attribute DowngradeIPIdentifiedWarnings of simulation : architecture is "yes";

type   STATES_TYPE  is (
                       IPG,
                       PREAMBLE,
                       PREAMBLE_10,
                       RX100,
                       RX10
                       );

signal  present_state        :  STATES_TYPE;
signal  next_state           :  STATES_TYPE;
signal  rx_cary_sense_i      :  std_logic;
signal  rx_data_valid_i      :  std_logic;
signal  rx_end_of_packet_i   :  std_logic;
signal  repeated_data_cnt    :  integer   range  0  to  63;
signal  phy2rmii_rxd_d1      :  std_logic_vector(1  downto  0);
signal  phy2rmii_rxd_d2      :  std_logic_vector(1  downto  0);
signal  phy2Rmii_crs_dv_sr   :  std_logic_vector(22 downto 0);
signal  dibit_cnt            :  std_logic_vector(3  downto  0);
signal  sample_rxd_cnt       :  std_logic_vector(4  downto  0);
signal  sample_rxd           :  std_logic;
signal  rxd_is_idle          :  std_logic;
signal  rxd_is_preamble      :  std_logic;
signal  rxd_is_preamble10    :  std_logic;
signal  rxd_10_i             :  std_logic;
signal  rxd_100_i            :  std_logic;

begin

------------------------------------------------------------------------------
-- RMII_CRS_DV_PIPELINE_PROCESS
------------------------------------------------------------------------------

--RMII_CRS_DV_PIPELINE_PROCESS : process ( Ref_Clk )
--begin
--    if (Ref_Clk'event and Ref_Clk = '1') then
--        if (Sync_rst_n = '0') then
--            phy2Rmii_crs_dv_sr <= (others => '0');
--        else
--            phy2Rmii_crs_dv_sr <= phy2Rmii_crs_dv_sr(21 downto 0) &
--                                  Phy2Rmii_crs_dv;
--        end if;
--    end if;
--end process;

------------------------------------------------------------------------------
-- RX_CARRY_SENSE_DATA_VALID_END_OF_PACKET_PROCESS
------------------------------------------------------------------------------
-- Include comments about the function of the process
------------------------------------------------------------------------------

RX_CARRY_SENSE_DATA_VALID_END_OF_PACKET_PROCESS : process ( Ref_Clk )
begin
    if (Ref_Clk'event and Ref_Clk = '1') then
        if (Sync_rst_n = '0') then
            Rx_error            <=  '0';
            Rx_cary_sense       <=  '0';
            rx_cary_sense_i     <=  '0';
            rx_end_of_packet_i  <=  '0';
            Rx_data_valid       <=  '0';
            phy2Rmii_crs_dv_sr  <= (others => '0');
        else
            Rx_error            <=  Phy2Rmii_rx_er;
            Rx_cary_sense       <=  rx_cary_sense_i;
            Rx_data_valid       <=  rx_data_valid_i;
            rx_end_of_packet_i  <=  (rxd_100_i and not Phy2Rmii_crs_dv and not phy2Rmii_crs_dv_sr(0)) or
                                    (rxd_10_i  and not Phy2Rmii_crs_dv and not phy2Rmii_crs_dv_sr(9));
                                     
            rx_cary_sense_i     <=  (Phy2Rmii_crs_dv and rx_cary_sense_i) or 
                                    (Phy2Rmii_crs_dv and not rxd_10_i and not 
                                     phy2Rmii_crs_dv_sr(0) and not phy2Rmii_crs_dv_sr(1)) or
                                    (Phy2Rmii_crs_dv and not rxd_100_i and not
                                     phy2Rmii_crs_dv_sr(0) and not phy2Rmii_crs_dv_sr(11));
                                     
            phy2Rmii_crs_dv_sr  <=  phy2Rmii_crs_dv_sr(21 downto 0) & Phy2Rmii_crs_dv;
        end if;

        if (Sync_rst_n = '0') then
            rx_data_valid_i <=  '0';
        elsif (rx_data_valid_i = '0') then
            rx_data_valid_i <= Phy2Rmii_crs_dv  or  phy2Rmii_crs_dv_sr(0);
        elsif (rx_data_valid_i = '1') then
            rx_data_valid_i <= not rx_end_of_packet_i;
        end if;
    end if;
end process;

Rx_end_of_packet <= rx_end_of_packet_i;

---------------------------------------------------------------------------
-- RXD_PIPELINE_DELAY_PROCESS
---------------------------------------------------------------------------

RXD_PIPELINE_DELAY_PROCESS : process ( Ref_Clk )
begin
    if (Ref_Clk'event and Ref_Clk = '1') then

        if (Sync_rst_n = C_RESET_ACTIVE) then
            phy2rmii_rxd_d2  <=  (others => '0');
            phy2rmii_rxd_d1  <=  (others => '0');
        else
            phy2rmii_rxd_d2  <=  phy2rmii_rxd_d1;
            phy2rmii_rxd_d1  <=  Phy2Rmii_rxd;
        end if;

    end if;
end process;

---------------------------------------------------------------------------
-- REPEATED_DATA_CNT_PROCESS
---------------------------------------------------------------------------

REPEATED_DATA_CNT_PROCESS : process ( Ref_Clk )
begin
    if (Ref_Clk'event and Ref_Clk = '1') then
        if (Sync_rst_n = C_RESET_ACTIVE) then
            repeated_data_cnt  <=  0;
        elsif (phy2rmii_rxd_d1 = Phy2Rmii_rxd) then
            if (repeated_data_cnt = 63) then
                repeated_data_cnt  <=  63;
            else
                repeated_data_cnt  <=  repeated_data_cnt + 1;
            end if;
        else
            repeated_data_cnt  <=  0;
        end if;
    end if;
end process;

---------------------------------------------------------------------------
-- SAMPLE_RXD_CNT_PROCESS
---------------------------------------------------------------------------

SAMPLE_RXD_CNT_PROCESS : process ( Ref_Clk )
begin
    if (Ref_Clk'event and Ref_Clk = '1') then
        if (Sync_rst_n = C_RESET_ACTIVE) then
            sample_rxd_cnt  <=  "00000";
            sample_rxd      <=  '0';
        elsif (rxd_10_i = '1') then
            if (sample_rxd_cnt =  "00000") then
                sample_rxd  <=  '1';
            else
                sample_rxd  <=  '0';
            end if;
            sample_rxd_cnt  <=  sample_rxd_cnt(3 downto 0) & not sample_rxd_cnt(4);
        elsif (rxd_is_preamble10 = '1') then
            sample_rxd_cnt  <=  "10000";
        else
            sample_rxd_cnt  <=  "00001";
            sample_rxd      <=  '1';
        end if;
    end if;
end process;

---------------------------------------------------------------------------
-- DIBIT_CNT_PROCESS
---------------------------------------------------------------------------

DIBIT_CNT_PROCESS : process ( Ref_Clk )
begin
    if (Ref_Clk'event and Ref_Clk = '1') then

        if ((Sync_rst_n = '0') or (rxd_is_idle = '1')) then
            dibit_cnt  <=  "0001";
        elsif (rxd_is_preamble10 = '1') then
            dibit_cnt  <=  "0100";
        elsif ((sample_rxd = '1') and (rxd_is_idle = '0')) then
            dibit_cnt  <=  dibit_cnt(2 downto 0) & (dibit_cnt(3));
        end if;

    end if;
end process;

---------------------------------------------------------------------------
-- DIBIT_TO_BYTE_MAPPING_PROCESS
---------------------------------------------------------------------------

DIBIT_TO_BYTE_MAPPING_PROCESS : process ( Ref_Clk )
begin
    if (Ref_Clk'event and Ref_Clk = '1') then

        if (Sync_rst_n = C_RESET_ACTIVE) then
            Rx_data     <=  (others => '0');
        elsif (dibit_cnt(0) = '1') then
            Rx_data(0)  <=  phy2rmii_rxd_d2(0);
            Rx_data(1)  <=  phy2rmii_rxd_d2(1);
        elsif (dibit_cnt(1) = '1') then
            Rx_data(2)  <=  phy2rmii_rxd_d2(0);
            Rx_data(3)  <=  phy2rmii_rxd_d2(1);
        elsif (dibit_cnt(2) = '1') then
            Rx_data(4)  <=  phy2rmii_rxd_d2(0);
            Rx_data(5)  <=  phy2rmii_rxd_d2(1);
        elsif (dibit_cnt(3) = '1') then
            Rx_data(6)  <=  phy2rmii_rxd_d2(0);
            Rx_data(7)  <=  phy2rmii_rxd_d2(1);
        end if;

    end if;
end process;

---------------------------------------------------------------------------
-- WR_FIFO_EN_PROCESS
---------------------------------------------------------------------------

WR_FIFO_EN_PROCESS : process ( Ref_Clk )
begin
    if (Ref_Clk'event and Ref_Clk = '1') then

        if (Sync_rst_n = '0') then
            Rx_fifo_wr_en  <=  '0';
        elsif ((sample_rxd = '1') and (dibit_cnt(3) = '1') and (rxd_is_idle = '0') and
	                                        (rxd_is_preamble10 = '0')) then
            Rx_fifo_wr_en  <=  '1';
        else
            Rx_fifo_wr_en  <=  '0';
        end if;

    end if;
end process;

------------------------------------------------------------------------------
-- State Machine SYNC_PROCESS
------------------------------------------------------------------------------
-- Include comments about the function of the process
------------------------------------------------------------------------------

SYNC_PROCESS : process ( Ref_Clk )
begin
    if (Ref_Clk'event and Ref_Clk = '1') then

        if (sync_rst_n = C_RESET_ACTIVE) then
            present_state  <=  IPG;
        else
            present_state  <=  next_state;
        end if;

        case next_state is

           when IPG  =>
               rxd_is_idle        <=  '1';
               rxd_is_preamble    <=  '0';
               rxd_is_preamble10  <=  '0';
               rxd_100_i          <=  '0';
               rxd_10_i           <=  '0';

           when PREAMBLE =>
               rxd_is_idle        <=  '0';
               rxd_is_preamble    <=  '1';
               rxd_is_preamble10  <=  '0';
               rxd_100_i          <=  '0';
               rxd_10_i           <=  '0';

           when PREAMBLE_10 =>
               rxd_is_idle        <=  '0';
               rxd_is_preamble    <=  '0';
               rxd_is_preamble10  <=  '1';
               rxd_100_i          <=  '0';
               rxd_10_i           <=  '0';

           when RX100 =>
               rxd_is_idle        <=  '0';
               rxd_is_preamble    <=  '0';
               rxd_is_preamble10  <=  '0';
               rxd_100_i          <=  '1';
               rxd_10_i           <=  '0';

           when RX10 =>
               rxd_is_idle        <=  '0';
               rxd_is_preamble    <=  '0';
               rxd_is_preamble10  <=  '0';
               rxd_100_i          <=  '0';
               rxd_10_i           <=  '1';

        end case;
    end if;
end process;

------------------------------------------------------------------------------
-- State Machine NEXT_STATE_PROCESS
------------------------------------------------------------------------------

NEXT_STATE_PROCESS : process (
                             present_state,
                             repeated_data_cnt,
                             phy2rmii_rxd_d1,
                             Phy2Rmii_rxd,
                             Phy2Rmii_crs_dv,
                             rx_data_valid_i
                             )

begin
    case present_state is

       when IPG  =>
           if ((Phy2Rmii_crs_dv = '1') and (Phy2Rmii_rxd = "01") and (phy2rmii_rxd_d1 = "01")) then
               next_state  <=  PREAMBLE;
           else
               next_state  <=  IPG;
           end if;

       when PREAMBLE  =>
           if ((Phy2Rmii_crs_dv = '1') and (repeated_data_cnt < 31) and (Phy2Rmii_rxd = "11")) then
               next_state  <=  RX100;
           elsif ((Phy2Rmii_crs_dv = '1') and (repeated_data_cnt > 30) and (phy2rmii_rxd_d1 = "01")) then
               next_state  <=  PREAMBLE_10;
           else
               next_state  <=  PREAMBLE;
           end if;

       when PREAMBLE_10  =>
           if ((Phy2Rmii_crs_dv = '1') and (Phy2Rmii_rxd = "11")) then
               next_state  <=  RX10;
           else
               next_state  <=  PREAMBLE_10;
           end if;

       when RX100  =>
           if (rx_data_valid_i = '0')then
               next_state  <=  IPG;
           else
               next_state  <=  RX100;
           end if;

       when RX10  =>
           if (rx_data_valid_i = '0') then
               next_state  <=  IPG;
           else
               next_state  <=  RX10;
           end if;

    end case;
end process;

------------------------------------------------------------------------------
-- Concurrent Signal Assignments
------------------------------------------------------------------------------

RX_10   <=  rxd_10_i;
RX_100  <=  rxd_100_i;

end simulation;


-----------------------------------------------------------------------
    -- (c) Copyright 1984 - 2012 Xilinx, Inc. All rights reserved.
    --
    -- This file contains confidential and proprietary information
    -- of Xilinx, Inc. and is protected under U.S. and
    -- international copyright and other intellectual property
    -- laws.
    --
    -- DISCLAIMER
    -- This disclaimer is not a license and does not grant any
    -- rights to the materials distributed herewith. Except as
    -- otherwise provided in a valid license issued to you by
    -- Xilinx, and to the maximum extent permitted by applicable
    -- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
    -- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
    -- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
    -- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
    -- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
    -- (2) Xilinx shall not be liable (whether in contract or tort,
    -- including negligence, or under any other theory of
    -- liability) for any loss or damage of any kind or nature
    -- related to, arising under or in connection with these
    -- materials, including for any direct, or any indirect,
    -- special, incidental, or consequential loss or damage
    -- (including loss of data, profits, goodwill, or any type of
    -- loss or damage suffered as a result of any action brought
    -- by a third party) even if such damage or loss was
    -- reasonably foreseeable or Xilinx had been advised of the
    -- possibility of the same.
    --
    -- CRITICAL APPLICATIONS
    -- Xilinx products are not designed or intended to be fail-
    -- safe, or for use in any application requiring fail-safe
    -- performance, such as life-support or safety devices or
    -- systems, Class III medical devices, nuclear facilities,
    -- applications related to the deployment of airbags, or any
    -- other applications that could lead to death, personal
    -- injury, or severe property or environmental damage
    -- (individually and collectively, "Critical
    -- Applications"). Customer assumes the sole risk and
    -- liability of any use of Xilinx products in Critical
    -- Applications, subject only to applicable laws and
    -- regulations governing limitations on product liability.
    --
    -- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
    -- PART OF THIS FILE AT ALL TIMES.
-----------------------------------------------------------------------
-- Filename:        rx_fifo_disposer.vhd
--
-- Version:         v1.01.a
-- Description:     This
--
------------------------------------------------------------------------------
------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library mii_to_rmii_v2_0_17;

------------------------------------------------------------------------------
-- Include comments indicating reasons why packages are being used
-- Don't use ".all" - indicate which parts of the packages are used in the
-- "use" statement
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Port Declaration
------------------------------------------------------------------------------

entity rx_fifo_disposer is
    generic (
            C_RESET_ACTIVE    :  std_logic
            );

    port    (
            Sync_rst_n        :  in   std_logic;
            Ref_Clk           :  in   std_logic;
            Rx_10             :  in   std_logic;
            Rx_100            :  in   std_logic;
            Rmii_rx_eop       :  in   std_logic_vector(1  downto  0);
            Rmii_rx_crs       :  in   std_logic_vector(1  downto  0);
            Rmii_rx_er        :  in   std_logic_vector(1  downto  0);
            Rmii_rx_dv        :  in   std_logic_vector(1  downto  0);
            Rmii_rx_data      :  in   std_logic_vector(7  downto  0);
            Rx_fifo_mt_n      :  in   std_logic;
            Rx_fifo_rd_en     :  out  std_logic;
            Rmii2mac_crs      :  out  std_logic;
            Rmii2mac_rx_clk   :  out  std_logic;
            Rmii2mac_rx_er    :  out  std_logic;
            Rmii2mac_rx_dv    :  out  std_logic;
            Rmii2mac_rxd      :  out  std_logic_vector(3  downto  0)
            );
end rx_fifo_disposer;

------------------------------------------------------------------------------
-- Definition of Generics:
--          C_RESET_ACTIVE  -- Assertion level for Reset signal.
--
-- Definition of Ports:
--
------------------------------------------------------------------------------

architecture simulation of rx_fifo_disposer is

attribute DowngradeIPIdentifiedWarnings: string;

attribute DowngradeIPIdentifiedWarnings of simulation : architecture is "yes";

------------------------------------------------------------------------------
-- Signal and Type Declarations
------------------------------------------------------------------------------
-- Signal names begin with a lowercase letter. User defined types and the
-- enumerated values with a type are all uppercase letters.
-- Signals of a user-defined type should be declared after the type declaration
-- Group signals by interfaces
------------------------------------------------------------------------------

type   STATES_TYPE   is  (
                         IDLE_ClK_L,
                         IDLE_ClK_H,
                         RX_100_RD_FIFO_ClK_L,
                         RX_100_NIB_0_CLK_L,
                         RX_100_NIB_0_CLK_H,
                         RX_100_NIB_1_CLK_L,
                         RX_100_NIB_1_CLK_H,
                         RX_100_NIB_1_RD_FIFO_CLK_H,
                         RX_10_RD_FIFO_CLK_L,
                         RX_10_NIB_0_00_CLK_L,
                         RX_10_NIB_0_01_CLK_L,
                         RX_10_NIB_0_02_CLK_L,
                         RX_10_NIB_0_03_CLK_L,
                         RX_10_NIB_0_04_CLK_L,
                         RX_10_NIB_0_05_CLK_L,
                         RX_10_NIB_0_06_CLK_L,
                         RX_10_NIB_0_07_CLK_L,
                         RX_10_NIB_0_08_CLK_L,
                         RX_10_NIB_0_09_CLK_L,
                         RX_10_NIB_0_00_CLK_H,
                         RX_10_NIB_0_01_CLK_H,
                         RX_10_NIB_0_02_CLK_H,
                         RX_10_NIB_0_03_CLK_H,
                         RX_10_NIB_0_04_CLK_H,
                         RX_10_NIB_0_05_CLK_H,
                         RX_10_NIB_0_06_CLK_H,
                         RX_10_NIB_0_07_CLK_H,
                         RX_10_NIB_0_08_CLK_H,
                         RX_10_NIB_0_09_CLK_H,
                         RX_10_NIB_1_00_CLK_L,
                         RX_10_NIB_1_01_CLK_L,
                         RX_10_NIB_1_02_CLK_L,
                         RX_10_NIB_1_03_CLK_L,
                         RX_10_NIB_1_04_CLK_L,
                         RX_10_NIB_1_05_CLK_L,
                         RX_10_NIB_1_06_CLK_L,
                         RX_10_NIB_1_07_CLK_L,
                         RX_10_NIB_1_08_CLK_L,
                         RX_10_NIB_1_09_CLK_L,
                         RX_10_NIB_1_00_CLK_H,
                         RX_10_NIB_1_01_CLK_H,
                         RX_10_NIB_1_02_CLK_H,
                         RX_10_NIB_1_03_CLK_H,
                         RX_10_NIB_1_04_CLK_H,
                         RX_10_NIB_1_05_CLK_H,
                         RX_10_NIB_1_06_CLK_H,
                         RX_10_NIB_1_07_CLK_H,
                         RX_10_NIB_1_08_CLK_H,
                         RX_10_NIB_1_09_CLK_H,
                         RX_10_NIB_1_09_RD_FIFO_CLK_H
                         );

signal  present_state    :  STATES_TYPE;
signal  next_state       :  STATES_TYPE;

begin

------------------------------------------------------------------------------
-- Concurrent Signal Assignments
------------------------------------------------------------------------------
-- No Concurrent Signal Assignments

------------------------------------------------------------------------------
-- State Machine SYNC_PROCESS
------------------------------------------------------------------------------
-- Include comments about the function of the process
------------------------------------------------------------------------------

SYNC_PROCESS : process ( Ref_Clk )
begin
    if (Ref_Clk'event and Ref_Clk = '1') then

        if (sync_rst_n = C_RESET_ACTIVE) then
            present_state  <=  IDLE_ClK_L;
        else
            present_state  <=  next_state;
        end if;
    end if;
end process;

------------------------------------------------------------------------------
-- State Machine NEXT_STATE_PROCESS
------------------------------------------------------------------------------

NEXT_STATE_PROCESS : process (
                             present_state,
                             Rx_100,
                             Rx_10,
                             RMII_rx_EOP,
                             Rmii_rx_er,
                             Rmii_rx_crs,
                             Rmii_rx_dv,
                             Rmii_rx_data,
			     Rx_fifo_mt_n--new addition of signal
                             )

begin
    case present_state is

        when  IDLE_ClK_L  =>
            if (Rx_100 = '1') then
                next_state  <=  RX_100_RD_FIFO_ClK_L;
            elsif (Rx_10 = '1') then
                next_state  <=  RX_10_RD_FIFO_CLK_L;
            else
                next_state  <=  IDLE_ClK_H;
            end if;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '0';
            Rmii2mac_rx_er   <=  '0';
            Rmii2mac_crs     <=  '0';
            Rmii2mac_rx_dv   <=  '0';
            Rmii2mac_rxd     <=  (others => '0');

        when  IDLE_ClK_H  =>
            if (Rx_10 = '1') then
                next_state  <=  RX_10_RD_FIFO_CLK_L;
            else
                next_state  <=  IDLE_ClK_L;
            end if;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '1';
            Rmii2mac_rx_er   <=  '0';
            Rmii2mac_crs     <=  '0';
            Rmii2mac_rx_dv   <=  '0';
            Rmii2mac_rxd     <=  (others => '0');

        when  RX_100_RD_FIFO_ClK_L  =>
            next_state       <=  RX_100_NIB_0_CLK_L;
            Rx_fifo_rd_en    <=  '1';
            Rmii2Mac_rx_clk  <=  '1';
            Rmii2mac_rx_er   <=  '0';
            Rmii2mac_crs     <=  '0';
            Rmii2mac_rx_dv   <=  '0';
            Rmii2mac_rxd     <=  (others => '0');

        when  RX_100_NIB_0_CLK_L  =>
            next_state       <=  RX_100_NIB_0_CLK_H;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '0';
            Rmii2mac_rx_er   <=  Rmii_rx_er(0);
            Rmii2mac_crs     <=  Rmii_rx_crs(0);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(3 downto 0);

        when  RX_100_NIB_0_CLK_H  =>
            next_state       <=  RX_100_NIB_1_CLK_L;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '1';
            Rmii2mac_rx_er   <=  Rmii_rx_er(0);
            Rmii2mac_crs     <=  Rmii_rx_crs(0);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(3 downto 0);

        when  RX_100_NIB_1_CLK_L  =>
            if ((RMII_rx_EOP(0) = '1') or (RMII_rx_EOP(1) = '1')) then
                next_state  <=  RX_100_NIB_1_CLK_H;
            else
                next_state  <=  RX_100_NIB_1_RD_FIFO_CLK_H;
            end if;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '0';
            Rmii2mac_rx_er   <=  Rmii_rx_er(1);
            Rmii2mac_crs     <=  Rmii_rx_crs(1);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(7 downto 4);

        when  RX_100_NIB_1_CLK_H  =>
            next_state       <=  IDLE_ClK_L;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '1';
            Rmii2mac_rx_er   <=  Rmii_rx_er(1);
            Rmii2mac_crs     <=  Rmii_rx_crs(1);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(7 downto 4);

        when  RX_100_NIB_1_RD_FIFO_CLK_H  =>
            next_state       <=  RX_100_NIB_0_CLK_L;
            Rx_fifo_rd_en    <=  '1';
            Rmii2Mac_rx_clk  <=  '1';
            Rmii2mac_rx_er   <=  Rmii_rx_er(1);
            Rmii2mac_crs     <=  Rmii_rx_crs(1);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(7 downto 4);

        when  RX_10_RD_FIFO_CLK_L  =>
            next_state       <=  RX_10_NIB_0_00_CLK_L;
            Rx_fifo_rd_en    <=  '1';
            Rmii2Mac_rx_clk  <=  '0';
            Rmii2mac_rx_er   <=  '0';
            Rmii2mac_crs     <=  '0';
            Rmii2mac_rx_dv   <=  '0';
            Rmii2mac_rxd     <=  (others => '0');

        when  RX_10_NIB_0_00_CLK_L  =>
            next_state       <=  RX_10_NIB_0_01_CLK_L;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '0';
            Rmii2mac_rx_er   <=  Rmii_rx_er(0);
            Rmii2mac_crs     <=  Rmii_rx_crs(0);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(3 downto 0);

        when  RX_10_NIB_0_01_CLK_L  =>
            next_state       <=  RX_10_NIB_0_02_CLK_L;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '0';
            Rmii2mac_rx_er   <=  Rmii_rx_er(0);
            Rmii2mac_crs     <=  Rmii_rx_crs(0);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(3 downto 0);

        when  RX_10_NIB_0_02_CLK_L  =>
            next_state       <=  RX_10_NIB_0_03_CLK_L;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '0';
            Rmii2mac_rx_er   <=  Rmii_rx_er(0);
            Rmii2mac_crs     <=  Rmii_rx_crs(0);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(3 downto 0);

        when  RX_10_NIB_0_03_CLK_L  =>
            next_state       <=  RX_10_NIB_0_04_CLK_L;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '0';
            Rmii2mac_rx_er   <=  Rmii_rx_er(0);
            Rmii2mac_crs     <=  Rmii_rx_crs(0);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(3 downto 0);

        when  RX_10_NIB_0_04_CLK_L  =>
            next_state       <=  RX_10_NIB_0_05_CLK_L;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '0';
            Rmii2mac_rx_er   <=  Rmii_rx_er(0);
            Rmii2mac_crs     <=  Rmii_rx_crs(0);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(3 downto 0);

        when  RX_10_NIB_0_05_CLK_L  =>
            next_state       <=  RX_10_NIB_0_06_CLK_L;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '0';
            Rmii2mac_rx_er   <=  Rmii_rx_er(0);
            Rmii2mac_crs     <=  Rmii_rx_crs(0);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(3 downto 0);

        when  RX_10_NIB_0_06_CLK_L  =>
            next_state       <=  RX_10_NIB_0_07_CLK_L;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '0';
            Rmii2mac_rx_er   <=  Rmii_rx_er(0);
            Rmii2mac_crs     <=  Rmii_rx_crs(0);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(3 downto 0);

        when  RX_10_NIB_0_07_CLK_L  =>
            next_state       <=  RX_10_NIB_0_08_CLK_L;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '0';
            Rmii2mac_rx_er   <=  Rmii_rx_er(0);
            Rmii2mac_crs     <=  Rmii_rx_crs(0);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(3 downto 0);

        when  RX_10_NIB_0_08_CLK_L  =>
            next_state       <=  RX_10_NIB_0_09_CLK_L;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '0';
            Rmii2mac_rx_er   <=  Rmii_rx_er(0);
            Rmii2mac_crs     <=  Rmii_rx_crs(0);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(3 downto 0);

        when  RX_10_NIB_0_09_CLK_L  =>
            next_state       <=  RX_10_NIB_0_00_CLK_H;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '0';
            Rmii2mac_rx_er   <=  Rmii_rx_er(0);
            Rmii2mac_crs     <=  Rmii_rx_crs(0);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(3 downto 0);

        when  RX_10_NIB_0_00_CLK_H  =>
            next_state       <=  RX_10_NIB_0_01_CLK_H;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '1';
            Rmii2mac_rx_er   <=  Rmii_rx_er(0);
            Rmii2mac_crs     <=  Rmii_rx_crs(0);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(3 downto 0);

        when  RX_10_NIB_0_01_CLK_H  =>
            next_state       <=  RX_10_NIB_0_02_CLK_H;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '1';
            Rmii2mac_rx_er   <=  Rmii_rx_er(0);
            Rmii2mac_crs     <=  Rmii_rx_crs(0);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(3 downto 0);

        when  RX_10_NIB_0_02_CLK_H  =>
            next_state       <=  RX_10_NIB_0_03_CLK_H;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '1';
            Rmii2mac_rx_er   <=  Rmii_rx_er(0);
            Rmii2mac_crs     <=  Rmii_rx_crs(0);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(3 downto 0);

        when  RX_10_NIB_0_03_CLK_H  =>
            next_state       <=  RX_10_NIB_0_04_CLK_H;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '1';
            Rmii2mac_rx_er   <=  Rmii_rx_er(0);
            Rmii2mac_crs     <=  Rmii_rx_crs(0);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(3 downto 0);

        when  RX_10_NIB_0_04_CLK_H  =>
            next_state       <=  RX_10_NIB_0_05_CLK_H;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '1';
            Rmii2mac_rx_er   <=  Rmii_rx_er(0);
            Rmii2mac_crs     <=  Rmii_rx_crs(0);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(3 downto 0);

        when  RX_10_NIB_0_05_CLK_H  =>
            next_state       <=  RX_10_NIB_0_06_CLK_H;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '1';
            Rmii2mac_rx_er   <=  Rmii_rx_er(0);
            Rmii2mac_crs     <=  Rmii_rx_crs(0);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(3 downto 0);

        when  RX_10_NIB_0_06_CLK_H  =>
            next_state       <=  RX_10_NIB_0_07_CLK_H;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '1';
            Rmii2mac_rx_er   <=  Rmii_rx_er(0);
            Rmii2mac_crs     <=  Rmii_rx_crs(0);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(3 downto 0);

        when  RX_10_NIB_0_07_CLK_H  =>
            next_state       <=  RX_10_NIB_0_08_CLK_H;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '1';
            Rmii2mac_rx_er   <=  Rmii_rx_er(0);
            Rmii2mac_crs     <=  Rmii_rx_crs(0);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(3 downto 0);

        when  RX_10_NIB_0_08_CLK_H  =>
            next_state       <=  RX_10_NIB_0_09_CLK_H;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '1';
            Rmii2mac_rx_er   <=  Rmii_rx_er(0);
            Rmii2mac_crs     <=  Rmii_rx_crs(0);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(3 downto 0);

        when  RX_10_NIB_0_09_CLK_H  =>
            next_state       <=  RX_10_NIB_1_00_CLK_L;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '1';
            Rmii2mac_rx_er   <=  Rmii_rx_er(0);
            Rmii2mac_crs     <=  Rmii_rx_crs(0);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(3 downto 0);

        when  RX_10_NIB_1_00_CLK_L  =>
            next_state       <=  RX_10_NIB_1_01_CLK_L;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '0';
            Rmii2mac_rx_er   <=  Rmii_rx_er(1);
            Rmii2mac_crs     <=  Rmii_rx_crs(1);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(7 downto 4);

        when  RX_10_NIB_1_01_CLK_L  =>
            next_state       <=  RX_10_NIB_1_02_CLK_L;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '0';
            Rmii2mac_rx_er   <=  Rmii_rx_er(1);
            Rmii2mac_crs     <=  Rmii_rx_crs(1);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(7 downto 4);

        when  RX_10_NIB_1_02_CLK_L  =>
            next_state       <=  RX_10_NIB_1_03_CLK_L;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '0';
            Rmii2mac_rx_er   <=  Rmii_rx_er(1);
            Rmii2mac_crs     <=  Rmii_rx_crs(1);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(7 downto 4);

        when  RX_10_NIB_1_03_CLK_L  =>
            next_state       <=  RX_10_NIB_1_04_CLK_L;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '0';
            Rmii2mac_rx_er   <=  Rmii_rx_er(1);
            Rmii2mac_crs     <=  Rmii_rx_crs(1);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(7 downto 4);

        when  RX_10_NIB_1_04_CLK_L  =>
            next_state       <=  RX_10_NIB_1_05_CLK_L;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '0';
            Rmii2mac_rx_er   <=  Rmii_rx_er(1);
            Rmii2mac_crs     <=  Rmii_rx_crs(1);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(7 downto 4);

        when  RX_10_NIB_1_05_CLK_L  =>
            next_state       <=  RX_10_NIB_1_06_CLK_L;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '0';
            Rmii2mac_rx_er   <=  Rmii_rx_er(1);
            Rmii2mac_crs     <=  Rmii_rx_crs(1);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(7 downto 4);

        when  RX_10_NIB_1_06_CLK_L  =>
            next_state       <=  RX_10_NIB_1_07_CLK_L;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '0';
            Rmii2mac_rx_er   <=  Rmii_rx_er(1);
            Rmii2mac_crs     <=  Rmii_rx_crs(1);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(7 downto 4);

        when  RX_10_NIB_1_07_CLK_L  =>
            next_state       <=  RX_10_NIB_1_08_CLK_L;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '0';
            Rmii2mac_rx_er   <=  Rmii_rx_er(1);
            Rmii2mac_crs     <=  Rmii_rx_crs(1);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(7 downto 4);

        when  RX_10_NIB_1_08_CLK_L  =>
            next_state       <=  RX_10_NIB_1_09_CLK_L;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '0';
            Rmii2mac_rx_er   <=  Rmii_rx_er(1);
            Rmii2mac_crs     <=  Rmii_rx_crs(1);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(7 downto 4);

        when  RX_10_NIB_1_09_CLK_L  =>
            next_state       <=  RX_10_NIB_1_00_CLK_H;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '0';
            Rmii2mac_rx_er   <=  Rmii_rx_er(1);
            Rmii2mac_crs     <=  Rmii_rx_crs(1);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(7 downto 4);


        when  RX_10_NIB_1_00_CLK_H  =>
            next_state       <=  RX_10_NIB_1_01_CLK_H;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '1';
            Rmii2mac_rx_er   <=  Rmii_rx_er(1);
            Rmii2mac_crs     <=  Rmii_rx_crs(1);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(7 downto 4);

        when  RX_10_NIB_1_01_CLK_H  =>
            next_state       <=  RX_10_NIB_1_02_CLK_H;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '1';
            Rmii2mac_rx_er   <=  Rmii_rx_er(1);
            Rmii2mac_crs     <=  Rmii_rx_crs(1);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(7 downto 4);

        when  RX_10_NIB_1_02_CLK_H  =>
            next_state       <=  RX_10_NIB_1_03_CLK_H;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '1';
            Rmii2mac_rx_er   <=  Rmii_rx_er(1);
            Rmii2mac_crs     <=  Rmii_rx_crs(1);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(7 downto 4);

        when  RX_10_NIB_1_03_CLK_H  =>
            next_state       <=  RX_10_NIB_1_04_CLK_H;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '1';
            Rmii2mac_rx_er   <=  Rmii_rx_er(1);
            Rmii2mac_crs     <=  Rmii_rx_crs(1);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(7 downto 4);

        when  RX_10_NIB_1_04_CLK_H  =>
            next_state       <=  RX_10_NIB_1_05_CLK_H;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '1';
            Rmii2mac_rx_er   <=  Rmii_rx_er(1);
            Rmii2mac_crs     <=  Rmii_rx_crs(1);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(7 downto 4);

        when  RX_10_NIB_1_05_CLK_H  =>
            next_state       <=  RX_10_NIB_1_06_CLK_H;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '1';
            Rmii2mac_rx_er   <=  Rmii_rx_er(1);
            Rmii2mac_crs     <=  Rmii_rx_crs(1);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(7 downto 4);

        when  RX_10_NIB_1_06_CLK_H  =>
            next_state       <=  RX_10_NIB_1_07_CLK_H;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '1';
            Rmii2mac_rx_er   <=  Rmii_rx_er(1);
            Rmii2mac_crs     <=  Rmii_rx_crs(1);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(7 downto 4);

        when  RX_10_NIB_1_07_CLK_H  =>
            next_state       <=  RX_10_NIB_1_08_CLK_H;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '1';
            Rmii2mac_rx_er   <=  Rmii_rx_er(1);
            Rmii2mac_crs     <=  Rmii_rx_crs(1);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(7 downto 4);

        when  RX_10_NIB_1_08_CLK_H  =>
            if ((RMII_rx_EOP(0) = '1') or (RMII_rx_EOP(1) = '1') or (Rx_fifo_mt_n = '0')) then
                next_state  <=  RX_10_NIB_1_09_CLK_H;
            else
                next_state  <=  RX_10_NIB_1_09_RD_FIFO_CLK_H;
            end if;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '1';
            Rmii2mac_rx_er   <=  Rmii_rx_er(1);
            Rmii2mac_crs     <=  Rmii_rx_crs(1);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(7 downto 4);

        when  RX_10_NIB_1_09_CLK_H  =>
            next_state       <=  IDLE_ClK_L;
            Rx_fifo_rd_en    <=  '0';
            Rmii2Mac_rx_clk  <=  '1';
            Rmii2mac_rx_er   <=  Rmii_rx_er(1);
            Rmii2mac_crs     <=  Rmii_rx_crs(1);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(7 downto 4);

        when  RX_10_NIB_1_09_RD_FIFO_CLK_H  =>
            next_state       <=  RX_10_NIB_0_00_CLK_L;
            Rx_fifo_rd_en    <=  '1';
            Rmii2Mac_rx_clk  <=  '1';
            Rmii2mac_rx_er   <=  Rmii_rx_er(1);
            Rmii2mac_crs     <=  Rmii_rx_crs(1);
            Rmii2mac_rx_dv   <=  '1';
            Rmii2mac_rxd     <=  Rmii_rx_data(7 downto 4);

    end case;
end process;

end simulation;


-----------------------------------------------------------------------
    -- (c) Copyright 1984 - 2012 Xilinx, Inc. All rights reserved.
    --
    -- This file contains confidential and proprietary information
    -- of Xilinx, Inc. and is protected under U.S. and
    -- international copyright and other intellectual property
    -- laws.
    --
    -- DISCLAIMER
    -- This disclaimer is not a license and does not grant any
    -- rights to the materials distributed herewith. Except as
    -- otherwise provided in a valid license issued to you by
    -- Xilinx, and to the maximum extent permitted by applicable
    -- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
    -- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
    -- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
    -- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
    -- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
    -- (2) Xilinx shall not be liable (whether in contract or tort,
    -- including negligence, or under any other theory of
    -- liability) for any loss or damage of any kind or nature
    -- related to, arising under or in connection with these
    -- materials, including for any direct, or any indirect,
    -- special, incidental, or consequential loss or damage
    -- (including loss of data, profits, goodwill, or any type of
    -- loss or damage suffered as a result of any action brought
    -- by a third party) even if such damage or loss was
    -- reasonably foreseeable or Xilinx had been advised of the
    -- possibility of the same.
    --
    -- CRITICAL APPLICATIONS
    -- Xilinx products are not designed or intended to be fail-
    -- safe, or for use in any application requiring fail-safe
    -- performance, such as life-support or safety devices or
    -- systems, Class III medical devices, nuclear facilities,
    -- applications related to the deployment of airbags, or any
    -- other applications that could lead to death, personal
    -- injury, or severe property or environmental damage
    -- (individually and collectively, "Critical
    -- Applications"). Customer assumes the sole risk and
    -- liability of any use of Xilinx products in Critical
    -- Applications, subject only to applicable laws and
    -- regulations governing limitations on product liability.
    --
    -- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
    -- PART OF THIS FILE AT ALL TIMES.
-----------------------------------------------------------------------
-- Filename:        rx_fifo.vhd
--
-- Version:         v1.01.a
-- Description:     This module
--
------------------------------------------------------------------------------
------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library mii_to_rmii_v2_0_17;

-- synopsys translate_off


-- synopsys translate_on

------------------------------------------------------------------------------
-- Port Declaration
------------------------------------------------------------------------------

entity rx_fifo is
    generic (
            C_RESET_ACTIVE    :  std_logic
            );

    port    (
            Sync_rst_n        :  in   std_logic;
            Ref_Clk           :  in   std_logic;
            Rx_fifo_wr_en     :  in   std_logic;
            Rx_fifo_rd_en     :  in   std_logic;
            Rx_fifo_input     :  in   std_logic_vector(15  downto  0);
            Rx_fifo_mt_n      :  out  std_logic;
            Rx_fifo_full      :  out  std_logic;
            Rx_fifo_output    :  out  std_logic_vector(15  downto  0)
            );
end rx_fifo;

------------------------------------------------------------------------------
-- Definition of Generics:
--          C_RESET_ACTIVE  --
--
-- Definition of Ports:
--
------------------------------------------------------------------------------

architecture simulation of rx_fifo is

attribute DowngradeIPIdentifiedWarnings: string;

attribute DowngradeIPIdentifiedWarnings of simulation : architecture is "yes";

------------------------------------------------------------------------------
-- Constant Declarations
------------------------------------------------------------------------------
-- Note that global constants and parameters (such as C_RESET_ACTIVE, default
-- values for address and data --widths, initialization values, etc.) should be
-- collected into a global package or include file.
-- Constants are all uppercase.
-- Constants or parameters should be used for all numeric values except for
-- single "0" or "1" values.
-- Constants should also be used when denoting a bit location within a register.
-- If no constants are required, simply lene this in a comment below the file
-- section separation comments.
------------------------------------------------------------------------------

--  No constants in this architecture.

------------------------------------------------------------------------------
-- Signal Declarations
------------------------------------------------------------------------------

signal  srl_fifo_reset      :  std_logic;
signal  rx_fifo_output_i    :  std_logic_vector(15  downto  0);

------------------------------------------------------------------------------
-- Component Declarations
------------------------------------------------------------------------------

component srl_fifo
    generic (
             C_DATA_BITS  :  natural  :=  8;
             C_DEPTH      :  natural  :=  16;
             C_XON        :  boolean  :=  false
            );

    port    (
             Clk          :  in   std_logic;
             Reset        :  in   std_logic;
             FIFO_Write   :  in   std_logic;
             Data_In      :  in   std_logic_vector(0 to C_DATA_BITS-1);
             FIFO_Read    :  in   std_logic;
             Data_Out     :  out  std_logic_vector(0 to C_DATA_BITS-1);
             FIFO_Full    :  out  std_logic;
             Data_Exists  :  out  std_logic;
             Addr         :  out  std_logic_vector(0 to 3) -- Added Addr as a port
            );
end component;

begin

------------------------------------------------------------------------------
-- Component Instantiations
------------------------------------------------------------------------------
-- Lene the function the component is performing with comments
-- Component instantiation names are all uppercase and are of the form:
--          <ENTITY_>I_<#|FUNC>
-- If no components are required, delete this section from the file
------------------------------------------------------------------------------

I_SRL_FIFO : srl_fifo
    generic map (
                 C_DATA_BITS  =>  16,
                 C_DEPTH      =>  16,
                 C_XON        =>  false
                )

    port map    (
                 Clk          =>  Ref_Clk,
                 Reset        =>  srl_fifo_reset,
                 FIFO_Write   =>  Rx_fifo_wr_en,
                 Data_In      =>  Rx_fifo_input,
                 FIFO_Read    =>  Rx_fifo_rd_en,
                 Data_Out     =>  rx_fifo_output_i,
                 FIFO_Full    =>  Rx_fifo_full,
                 Data_Exists  =>  Rx_fifo_mt_n,
                 Addr         =>  open
                );

------------------------------------------------------------------------------
-- RESET_PROCESS
------------------------------------------------------------------------------

RESET_PROCESS : process (Sync_rst_n)
begin
    if (Sync_rst_n = C_RESET_ACTIVE) then
        srl_fifo_reset  <=  '1';
    else
        srl_fifo_reset  <=  '0';
    end if;
end process;

------------------------------------------------------------------------------
-- FIFO_REGISTER_PROCESS
------------------------------------------------------------------------------
-- Include comments about the function of the process
------------------------------------------------------------------------------

FIFO_REGISTER_PROCESS : process ( Ref_Clk )
begin
    if (Ref_Clk'event and Ref_Clk = '1') then
        if (sync_rst_n = C_RESET_ACTIVE) then
            Rx_fifo_output  <=  (others => '0');
        elsif (Rx_fifo_rd_en = '1') then
            Rx_fifo_output  <=  rx_fifo_output_i;
        end if;
    end if;
end process;

------------------------------------------------------------------------------
-- Concurrent Signal Assignments
------------------------------------------------------------------------------
-- NONE

end simulation;


-- SRL_FIFO entity and architecture
-------------------------------------------------------------------------------
--
-- *************************************************************************
-- **                                                                     **
-- ** DISCLAIMER OF LIABILITY                                             **
-- **                                                                     **
-- ** This text/file contains proprietary, confidential                   **
-- ** information of Xilinx, Inc., is distributed under                   **
-- ** license from Xilinx, Inc., and may be used, copied                  **
-- ** and/or disclosed only pursuant to the terms of a valid              **
-- ** license agreement with Xilinx, Inc. Xilinx hereby                   **
-- ** grants you a license to use this text/file solely for               **
-- ** design, simulation, implementation and creation of                  **
-- ** design files limited to Xilinx devices or technologies.             **
-- ** Use with non-Xilinx devices or technologies is expressly            **
-- ** prohibited and immediately terminates your license unless           **
-- ** covered by a separate agreement.                                    **
-- **                                                                     **
-- ** Xilinx is providing this design, code, or information               **
-- ** "as-is" solely for use in developing programs and                   **
-- ** solutions for Xilinx devices, with no obligation on the             **
-- ** part of Xilinx to provide support. By providing this design,        **
-- ** code, or information as one possible implementation of              **
-- ** this feature, application or standard, Xilinx is making no          **
-- ** representation that this implementation is free from any            **
-- ** claims of infringement. You are responsible for obtaining           **
-- ** any rights you may require for your implementation.                 **
-- ** Xilinx expressly disclaims any warranty whatsoever with             **
-- ** respect to the adequacy of the implementation, including            **
-- ** but not limited to any warranties or representations that this      **
-- ** implementation is free from claims of infringement, implied         **
-- ** warranties of merchantability or fitness for a particular           **
-- ** purpose.                                                            **
-- **                                                                     **
-- ** Xilinx products are not intended for use in life support            **
-- ** appliances, devices, or systems. Use in such applications is        **
-- ** expressly prohibited.                                               **
-- **                                                                     **
-- ** Any modifications that are made to the Source Code are              **
-- ** done at the user’s sole risk and will be unsupported.               **
-- ** The Xilinx Support Hotline does not have access to source           **
-- ** code and therefore cannot answer specific questions related         **
-- ** to source HDL. The Xilinx Hotline support of original source        **
-- ** code IP shall only address issues and questions related             **
-- ** to the standard Netlist version of the core (and thus               **
-- ** indirectly, the original core source).                              **
-- **                                                                     **
-- ** Copyright (c) 2001-2010 Xilinx, Inc. All rights reserved.           **
-- **                                                                     **
-- ** This copyright and support notice must be retained as part          **
-- ** of this text at all times.                                          **
-- **                                                                     **
-- *************************************************************************
--
-------------------------------------------------------------------------------
-- Filename:        srl_fifo.vhd
--
-- Description:     
--                  
-- VHDL-Standard:   VHDL'93
-------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x" 
--      reset signals:                          "rst", "rst_n" 
--      generics:                               "C_*" 
--      user defined types:                     "*_TYPE" 
--      state machine next state:               "*_ns" 
--      state machine current state:            "*_cs" 
--      combinatorial signals:                  "*_com" 
--      pipelined or register delay signals:    "*_d#" 
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce" 
--      internal version of output port         "*_i"
--      device pins:                            "*_pin" 
--      ports:                                  - Names begin with Uppercase 
--      processes:                              "*_PROCESS" 
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
library unisim;
use unisim.all;

entity SRL_FIFO is
  generic (
    C_DATA_BITS : natural := 8;
    C_DEPTH     : natural := 16;
    C_XON       : boolean := false
    );
  port (
    Clk         : in  std_logic;
    Reset       : in  std_logic;
    FIFO_Write  : in  std_logic;
    Data_In     : in  std_logic_vector(0 to C_DATA_BITS-1);
    FIFO_Read   : in  std_logic;
    Data_Out    : out std_logic_vector(0 to C_DATA_BITS-1);
    FIFO_Full   : out std_logic;
    Data_Exists : out std_logic;
    Addr        : out std_logic_vector(0 to 3) -- Added Addr as a port
    );

end entity SRL_FIFO;

architecture IMP of SRL_FIFO is

  component SRL16E is
      -- pragma translate_off
    generic (
      INIT : bit_vector := X"0000"
      );
      -- pragma translate_on    
    port (
      CE  : in  std_logic;
      D   : in  std_logic;
      Clk : in  std_logic;
      A0  : in  std_logic;
      A1  : in  std_logic;
      A2  : in  std_logic;
      A3  : in  std_logic;
      Q   : out std_logic);
  end component SRL16E;

  component LUT4
    generic(
      INIT : bit_vector := X"0000"
      );
    port (
      O  : out std_logic;
      I0 : in  std_logic;
      I1 : in  std_logic;
      I2 : in  std_logic;
      I3 : in  std_logic);
  end component;

  component MULT_AND
    port (
      I0 : in  std_logic;
      I1 : in  std_logic;
      LO : out std_logic);
  end component;

  component MUXCY_L
    port (
      DI : in  std_logic;
      CI : in  std_logic;
      S  : in  std_logic;
      LO : out std_logic);
  end component;

  component XORCY
    port (
      LI : in  std_logic;
      CI : in  std_logic;
      O  : out std_logic);
  end component;

  component FDRE is
    port (
      Q  : out std_logic;
      C  : in  std_logic;
      CE : in  std_logic;
      D  : in  std_logic;
      R  : in  std_logic);
  end component FDRE;

  component FDR is
    port (
      Q  : out std_logic;
      C  : in  std_logic;
      D  : in  std_logic;
      R  : in  std_logic);
  end component FDR;

  signal addr_i       : std_logic_vector(0 to 3);  
  signal buffer_Full  : std_logic;
  signal buffer_Empty : std_logic;

  signal next_Data_Exists : std_logic;
  signal data_Exists_I    : std_logic;

  signal valid_Write : std_logic;

  signal hsum_A  : std_logic_vector(0 to 3);
  signal sum_A   : std_logic_vector(0 to 3);
  signal addr_cy : std_logic_vector(0 to 4);
  
begin  -- architecture IMP

  buffer_Full <= '1' when (addr_i = "1111") else '0';
  FIFO_Full   <= buffer_Full;

  buffer_Empty <= '1' when (addr_i = "0000") else '0';

  next_Data_Exists <= (data_Exists_I and not buffer_Empty) or
                      (buffer_Empty and FIFO_Write) or
                      (data_Exists_I and not FIFO_Read);

  Data_Exists_DFF : FDR
    port map (
      Q  => data_Exists_I,            -- [out std_logic]
      C  => Clk,                      -- [in  std_logic]
      D  => next_Data_Exists,         -- [in  std_logic]
      R  => Reset);                   -- [in std_logic]

  Data_Exists <= data_Exists_I;
  
  valid_Write <= FIFO_Write and (FIFO_Read or not buffer_Full);

  addr_cy(0) <= valid_Write;

  Addr_Counters : for I in 0 to 3 generate

    hsum_A(I) <= (FIFO_Read xor addr_i(I)) and (FIFO_Write or not buffer_Empty);

    MUXCY_L_I : MUXCY_L
      port map (
        DI => addr_i(I),                  -- [in  std_logic]
        CI => addr_cy(I),               -- [in  std_logic]
        S  => hsum_A(I),                -- [in  std_logic]
        LO => addr_cy(I+1));            -- [out std_logic]

    XORCY_I : XORCY
      port map (
        LI => hsum_A(I),                -- [in  std_logic]
        CI => addr_cy(I),               -- [in  std_logic]
        O  => sum_A(I));                -- [out std_logic]

    FDRE_I : FDRE
      port map (
        Q  => addr_i(I),                  -- [out std_logic]
        C  => Clk,                      -- [in  std_logic]
        CE => data_Exists_I,            -- [in  std_logic]
        D  => sum_A(I),                 -- [in  std_logic]
        R  => Reset);                   -- [in std_logic]

  end generate Addr_Counters;

  FIFO_RAM : for I in 0 to C_DATA_BITS-1 generate
    SRL16E_I : SRL16E
      -- pragma translate_off
      generic map (
        INIT => x"0000")
      -- pragma translate_on
      port map (
        CE  => valid_Write,             -- [in  std_logic]
        D   => Data_In(I),              -- [in  std_logic]
        Clk => Clk,                     -- [in  std_logic]
        A0  => addr_i(0),                 -- [in  std_logic]
        A1  => addr_i(1),                 -- [in  std_logic]
        A2  => addr_i(2),                 -- [in  std_logic]
        A3  => addr_i(3),                 -- [in  std_logic]
        Q   => Data_Out(I));            -- [out std_logic]
  end generate FIFO_RAM;
  
-------------------------------------------------------------------------------
-- INT_ADDR_PROCESS
-------------------------------------------------------------------------------
-- This process assigns the internal address to the output port
-------------------------------------------------------------------------------
  INT_ADDR_PROCESS:process (addr_i)
  begin   -- process
    Addr <= addr_i;
  end process;
  

end architecture IMP;


-----------------------------------------------------------------------
    -- (c) Copyright 1984 - 2012 Xilinx, Inc. All rights reserved.
    --
    -- This file contains confidential and proprietary information
    -- of Xilinx, Inc. and is protected under U.S. and
    -- international copyright and other intellectual property
    -- laws.
    --
    -- DISCLAIMER
    -- This disclaimer is not a license and does not grant any
    -- rights to the materials distributed herewith. Except as
    -- otherwise provided in a valid license issued to you by
    -- Xilinx, and to the maximum extent permitted by applicable
    -- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
    -- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
    -- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
    -- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
    -- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
    -- (2) Xilinx shall not be liable (whether in contract or tort,
    -- including negligence, or under any other theory of
    -- liability) for any loss or damage of any kind or nature
    -- related to, arising under or in connection with these
    -- materials, including for any direct, or any indirect,
    -- special, incidental, or consequential loss or damage
    -- (including loss of data, profits, goodwill, or any type of
    -- loss or damage suffered as a result of any action brought
    -- by a third party) even if such damage or loss was
    -- reasonably foreseeable or Xilinx had been advised of the
    -- possibility of the same.
    --
    -- CRITICAL APPLICATIONS
    -- Xilinx products are not designed or intended to be fail-
    -- safe, or for use in any application requiring fail-safe
    -- performance, such as life-support or safety devices or
    -- systems, Class III medical devices, nuclear facilities,
    -- applications related to the deployment of airbags, or any
    -- other applications that could lead to death, personal
    -- injury, or severe property or environmental damage
    -- (individually and collectively, "Critical
    -- Applications"). Customer assumes the sole risk and
    -- liability of any use of Xilinx products in Critical
    -- Applications, subject only to applicable laws and
    -- regulations governing limitations on product liability.
    --
    -- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
    -- PART OF THIS FILE AT ALL TIMES.
-----------------------------------------------------------------------
-- Filename:        rmii_tx_fixed.vhd
--
-- Version:         v1.01.a
-- Description:     Top level of RMII(reduced media independent interface)
--
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x"
--      reset signals:                          "rst", "rst_n"
--      generics:                               "C_*"
--      user defined types:                     "*_TYPE"
--      state machine next state:               "*_ns"
--      state machine current state:            "*_cs"
--      combinatorial signals:                  "*_cmb"
--      pipelined or register delay signals:    "*_d#"
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce"
--      internal version of output port         "*_i"
--      device pins:                            "*_pin"
--      ports:                                  - Names begin with Uppercase
--      processes:                              "*_PROCESS"
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------------
-- Include comments indicating reasons why packages are being used
-- Don't use ".all" - indicate which parts of the packages are used in the
-- "use" statement
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- include library containing the entities you're configuring
------------------------------------------------------------------------------

library mii_to_rmii_v2_0_17;

------------------------------------------------------------------------------
-- Port Declaration
------------------------------------------------------------------------------
-- Definition of Generics:
--          C_GEN1       -- description of generic, if description doesn't fit
--                       -- align with first part of description
--          C_GEN2       -- description of generic
--
-- Definition of Ports:
--          Port_name1   -- description of port, indicate source or destination
--          Port_name2   -- description of port
--
------------------------------------------------------------------------------

entity rmii_tx_fixed is
    generic (
            C_RESET_ACTIVE    : std_logic     :=  '0'
            );

    port    (
            Tx_speed_100      : in    std_logic;
            ------------------  System Signals  -------------------------------
            Sync_rst_n        : in    std_logic;
            Ref_Clk           : in    std_logic;
            ------------------  MII <--> RMII  --------------------------------
            Mac2Rmii_tx_en    : in    std_logic;
            Mac2Rmii_txd      : in    std_logic_vector(3  downto  0);
            Mac2Rmii_tx_er    : in    std_logic;
            Rmii2Mac_tx_clk   : out   std_logic;
            ------------------  RMII <--> PHY  --------------------------------
            Rmii2Phy_txd      : out   std_logic_vector(1  downto  0);
            Rmii2Phy_tx_en    : out   std_logic
            );
end rmii_tx_fixed;

------------------------------------------------------------------------------
-- Configurations
------------------------------------------------------------------------------
-- No Configurations

------------------------------------------------------------------------------
-- Architecture
------------------------------------------------------------------------------

architecture simulation of rmii_tx_fixed is

attribute DowngradeIPIdentifiedWarnings: string;

attribute DowngradeIPIdentifiedWarnings of simulation : architecture is "yes";

------------------------------------------------------------------------------
-- Constant Declarations
------------------------------------------------------------------------------
-- Note that global constants and parameters (such as RESET_ACTIVE, default
-- values for address and data --widths, initialization values, etc.) should be
-- collected into a global package or include file.
-- Constants are all uppercase.
-- Constants or parameters should be used for all numeric values except for
-- single "0" or "1" values.
-- Constants should also be used when denoting a bit location within a register.
-- If no constants are required, simply state this in a comment below the file
-- section separation comments.
------------------------------------------------------------------------------
-- No Constants


------------------------------------------------------------------------------
-- Signal and Type Declarations
------------------------------------------------------------------------------

type   STATES_TYPE  is (
                       IDLE_CLK_L,
                       IDLE_CLK_H,
                       TX100_DIBIT_0_CLK_L,
                       TX100_DIBIT_1_CLK_H,
                       TX10_DIBIT_0_CLK_L0,
                       TX10_DIBIT_0_CLK_L1,
                       TX10_DIBIT_0_CLK_L2,
                       TX10_DIBIT_0_CLK_L3,
                       TX10_DIBIT_0_CLK_L4,
                       TX10_DIBIT_0_CLK_L5,
                       TX10_DIBIT_0_CLK_L6,
                       TX10_DIBIT_0_CLK_L7,
                       TX10_DIBIT_0_CLK_L8,
                       TX10_DIBIT_0_CLK_L9,
                       TX10_DIBIT_1_CLK_H0,
                       TX10_DIBIT_1_CLK_H1,
                       TX10_DIBIT_1_CLK_H2,
                       TX10_DIBIT_1_CLK_H3,
                       TX10_DIBIT_1_CLK_H4,
                       TX10_DIBIT_1_CLK_H5,
                       TX10_DIBIT_1_CLK_H6,
                       TX10_DIBIT_1_CLK_H7,
                       TX10_DIBIT_1_CLK_H8,
                       TX10_DIBIT_1_CLK_H9
                       );

signal  present_state     :  STATES_TYPE;
signal  next_state        :  STATES_TYPE;
signal  mac2Rmii_tx_en_d  :  std_logic;
signal  mac2Rmii_txd_d    :  std_logic_vector(3   downto   0);
signal  mac2Rmii_tx_er_d  :  std_logic;
signal  tx_in_reg_en      :  std_logic;
signal  txd_dibit         :  std_logic;
signal  txd_error         :  std_logic;

begin

------------------------------------------------------------------------------
-- TX_IN_REG_PROCESS
------------------------------------------------------------------------------

TX_IN_REG_PROCESS : process ( Ref_Clk )
begin
    if (Ref_Clk'event and Ref_Clk = '1') then

        if (sync_rst_n = C_RESET_ACTIVE) then
            mac2Rmii_tx_en_d  <=  '0';
            mac2Rmii_txd_d    <=  (others => '0');
            mac2Rmii_tx_er_d  <=  '0';

        elsif (tx_in_reg_en = '1') then
            mac2Rmii_tx_en_d  <=  Mac2Rmii_tx_en;
            mac2Rmii_txd_d    <=  Mac2Rmii_txd;
            mac2Rmii_tx_er_d  <=  Mac2Rmii_tx_er;

        end if;
    end if;
end process;

------------------------------------------------------------------------------
-- TX_OUT_REG_PROCESS
------------------------------------------------------------------------------

TX_OUT_REG_PROCESS : process ( Ref_Clk )
begin
    if (Ref_Clk'event and Ref_Clk = '1') then

        if (sync_rst_n = C_RESET_ACTIVE) then
            Rmii2Phy_txd(0)  <=  '0';
            Rmii2Phy_txd(1)  <=  '0';
            Rmii2Phy_tx_en   <=  '0';

        elsif (txd_dibit  = '0') then
            Rmii2Phy_txd(0)  <=  mac2Rmii_txd_d(0) xor txd_error;
            Rmii2Phy_txd(1)  <=  mac2Rmii_txd_d(1) or  txd_error;
            Rmii2Phy_tx_en   <=  mac2Rmii_tx_en_d;

        elsif (txd_dibit  = '1') then
            Rmii2Phy_txd(0)  <=  mac2Rmii_txd_d(2) xor txd_error;
            Rmii2Phy_txd(1)  <=  mac2Rmii_txd_d(3) or  txd_error;
            Rmii2Phy_tx_en   <=  mac2Rmii_tx_en_d;

        end if;
    end if;
end process;

------------------------------------------------------------------------------
-- TX_CONTROL_SYNC_PROCESS
------------------------------------------------------------------------------

TX_CONTROL_SYNC_PROCESS : process ( Ref_Clk )
begin
    if (Ref_Clk'event and Ref_Clk = '1') then
        if (sync_rst_n = C_RESET_ACTIVE) then
            present_state  <=  IDLE_CLK_L;
        else
            present_state  <=  next_state;
        end if;
    end if;
end process;

------------------------------------------------------------------------------
-- TX_CONTROL_NEXT_STATE_PROCESS
------------------------------------------------------------------------------

TX_CONTROL_NEXT_STATE_PROCESS : process (
                                        present_state,
                                        mac2Rmii_tx_er_d,
                                        Tx_speed_100
                                        )

begin
    case present_state is

       when IDLE_CLK_L  =>
           next_state       <=  IDLE_CLK_H;
           Rmii2Mac_tx_clk  <=  '0';
           tx_in_reg_en     <=  '1';
           txd_dibit        <=  '0';
           txd_error        <=  '0';

       when IDLE_CLK_H  =>
           if (Tx_speed_100 = '1') then
               next_state   <=  TX100_DIBIT_0_CLK_L;
           else
               next_state   <=  TX10_DIBIT_0_CLK_L0;
           end if;
           Rmii2Mac_tx_clk  <=  '1';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '0';
           txd_error        <=  '0';

       when TX100_DIBIT_0_CLK_L  =>
           next_state       <=  TX100_DIBIT_1_CLK_H;
           Rmii2Mac_tx_clk  <=  '0';
           tx_in_reg_en     <=  '1';
           txd_dibit        <=  '1';
           txd_error        <=  mac2Rmii_tx_er_d;

       when TX100_DIBIT_1_CLK_H  =>
           next_state       <=  TX100_DIBIT_0_CLK_L;
           Rmii2Mac_tx_clk  <=  '1';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '0';
           txd_error        <=  mac2Rmii_tx_er_d;

       when TX10_DIBIT_0_CLK_L0  =>
           next_state       <=  TX10_DIBIT_0_CLK_L1;
           Rmii2Mac_tx_clk  <=  '0';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '1';
           txd_error        <=  '0';

       when TX10_DIBIT_0_CLK_L1  =>
           next_state       <=  TX10_DIBIT_0_CLK_L2;
           Rmii2Mac_tx_clk  <=  '0';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '1';
           txd_error        <=  '0';

       when TX10_DIBIT_0_CLK_L2  =>
           next_state       <=  TX10_DIBIT_0_CLK_L3;
           Rmii2Mac_tx_clk  <=  '0';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '1';
           txd_error        <=  '0';

       when TX10_DIBIT_0_CLK_L3  =>
           next_state       <=  TX10_DIBIT_0_CLK_L4;
           Rmii2Mac_tx_clk  <=  '0';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '1';
           txd_error        <=  '0';

       when TX10_DIBIT_0_CLK_L4  =>
           next_state       <=  TX10_DIBIT_0_CLK_L5;
           Rmii2Mac_tx_clk  <=  '0';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '1';
           txd_error        <=  '0';

       when TX10_DIBIT_0_CLK_L5  =>
           next_state       <=  TX10_DIBIT_0_CLK_L6;
           Rmii2Mac_tx_clk  <=  '0';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '1';
           txd_error        <=  '0';

       when TX10_DIBIT_0_CLK_L6  =>
           next_state       <=  TX10_DIBIT_0_CLK_L7;
           Rmii2Mac_tx_clk  <=  '0';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '1';
           txd_error        <=  '0';

       when TX10_DIBIT_0_CLK_L7  =>
           next_state       <=  TX10_DIBIT_0_CLK_L8;
           Rmii2Mac_tx_clk  <=  '0';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '1';
           txd_error        <=  '0';

       when TX10_DIBIT_0_CLK_L8  =>
           next_state       <=  TX10_DIBIT_0_CLK_L9;
           Rmii2Mac_tx_clk  <=  '0';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '1';
           txd_error        <=  '0';

       when TX10_DIBIT_0_CLK_L9  =>
           next_state       <=  TX10_DIBIT_1_CLK_H0;
           Rmii2Mac_tx_clk  <=  '0';
           tx_in_reg_en     <=  '1';
           txd_dibit        <=  '1';
           txd_error        <=  '0';

       when TX10_DIBIT_1_CLK_H0  =>
           next_state       <=  TX10_DIBIT_1_CLK_H1;
           Rmii2Mac_tx_clk  <=  '1';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '0';
           txd_error        <=  '0';

       when TX10_DIBIT_1_CLK_H1  =>
           next_state       <=  TX10_DIBIT_1_CLK_H2;
           Rmii2Mac_tx_clk  <=  '1';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '0';
           txd_error        <=  '0';

       when TX10_DIBIT_1_CLK_H2  =>
           next_state       <=  TX10_DIBIT_1_CLK_H3;
           Rmii2Mac_tx_clk  <=  '1';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '0';
           txd_error        <=  '0';

       when TX10_DIBIT_1_CLK_H3  =>
           next_state       <=  TX10_DIBIT_1_CLK_H4;
           Rmii2Mac_tx_clk  <=  '1';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '0';
           txd_error        <=  '0';

       when TX10_DIBIT_1_CLK_H4  =>
           next_state       <=  TX10_DIBIT_1_CLK_H5;
           Rmii2Mac_tx_clk  <=  '1';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '0';
           txd_error        <=  '0';

       when TX10_DIBIT_1_CLK_H5  =>
           next_state       <=  TX10_DIBIT_1_CLK_H6;
           Rmii2Mac_tx_clk  <=  '1';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '0';
           txd_error        <=  '0';

       when TX10_DIBIT_1_CLK_H6  =>
           next_state       <=  TX10_DIBIT_1_CLK_H7;
           Rmii2Mac_tx_clk  <=  '1';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '0';
           txd_error        <=  '0';

       when TX10_DIBIT_1_CLK_H7  =>
           next_state       <=  TX10_DIBIT_1_CLK_H8;
           Rmii2Mac_tx_clk  <=  '1';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '0';
           txd_error        <=  '0';

       when TX10_DIBIT_1_CLK_H8  =>
           next_state       <=  TX10_DIBIT_1_CLK_H9;
           Rmii2Mac_tx_clk  <=  '1';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '0';
           txd_error        <=  '0';

       when TX10_DIBIT_1_CLK_H9  =>
           next_state       <=  TX10_DIBIT_0_CLK_L0;
           Rmii2Mac_tx_clk  <=  '1';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '0';
           txd_error        <=  '0';


    end case;
end process;

end simulation;


-----------------------------------------------------------------------
    -- (c) Copyright 1984 - 2012 Xilinx, Inc. All rights reserved.
    --
    -- This file contains confidential and proprietary information
    -- of Xilinx, Inc. and is protected under U.S. and
    -- international copyright and other intellectual property
    -- laws.
    --
    -- DISCLAIMER
    -- This disclaimer is not a license and does not grant any
    -- rights to the materials distributed herewith. Except as
    -- otherwise provided in a valid license issued to you by
    -- Xilinx, and to the maximum extent permitted by applicable
    -- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
    -- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
    -- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
    -- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
    -- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
    -- (2) Xilinx shall not be liable (whether in contract or tort,
    -- including negligence, or under any other theory of
    -- liability) for any loss or damage of any kind or nature
    -- related to, arising under or in connection with these
    -- materials, including for any direct, or any indirect,
    -- special, incidental, or consequential loss or damage
    -- (including loss of data, profits, goodwill, or any type of
    -- loss or damage suffered as a result of any action brought
    -- by a third party) even if such damage or loss was
    -- reasonably foreseeable or Xilinx had been advised of the
    -- possibility of the same.
    --
    -- CRITICAL APPLICATIONS
    -- Xilinx products are not designed or intended to be fail-
    -- safe, or for use in any application requiring fail-safe
    -- performance, such as life-support or safety devices or
    -- systems, Class III medical devices, nuclear facilities,
    -- applications related to the deployment of airbags, or any
    -- other applications that could lead to death, personal
    -- injury, or severe property or environmental damage
    -- (individually and collectively, "Critical
    -- Applications"). Customer assumes the sole risk and
    -- liability of any use of Xilinx products in Critical
    -- Applications, subject only to applicable laws and
    -- regulations governing limitations on product liability.
    --
    -- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
    -- PART OF THIS FILE AT ALL TIMES.
-----------------------------------------------------------------------
-- Filename:        rmii_tx_agile.vhd
--
-- Version:         v1.01.a
-- Description:     Top level of RMII(reduced media independent interface)
--
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x"
--      reset signals:                          "rst", "rst_n"
--      generics:                               "C_*"
--      user defined types:                     "*_TYPE"
--      state machine next state:               "*_ns"
--      state machine current state:            "*_cs"
--      combinatorial signals:                  "*_cmb"
--      pipelined or register delay signals:    "*_d#"
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce"
--      internal version of output port         "*_i"
--      device pins:                            "*_pin"
--      ports:                                  - Names begin with Uppercase
--      processes:                              "*_PROCESS"
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------------
-- Include comments indicating reasons why packages are being used
-- Don't use ".all" - indicate which parts of the packages are used in the
-- "use" statement
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- include library containing the entities you're configuring
------------------------------------------------------------------------------

library mii_to_rmii_v2_0_17;

------------------------------------------------------------------------------
-- Port Declaration
------------------------------------------------------------------------------
-- Definition of Generics:
--          C_GEN1          -- description of generic, if description doesn't fit
--                          -- align with first part of description
--          C_GEN2          -- description of generic
--
-- Definition of Ports:
--          Port_name1      -- description of port, indicate source or destination
--          Port_name2      -- description of port
--
------------------------------------------------------------------------------

entity rmii_tx_agile is
    generic (
            C_RESET_ACTIVE    : std_logic     :=  '0'
            );

    port    (
            Tx_speed_100      : in    std_logic;
            ------------------  System Signals  -------------------------------
            Sync_rst_n        : in    std_logic;
            Ref_Clk           : in    std_logic;
            ------------------  MII <--> RMII  --------------------------------
            Mac2Rmii_tx_en    : in    std_logic;
            Mac2Rmii_txd      : in    std_logic_vector(3  downto  0);
            Mac2Rmii_tx_er    : in    std_logic;
            Rmii2Mac_tx_clk   : out   std_logic;
            ------------------  RMII <--> PHY  --------------------------------
            Rmii2Phy_txd      : out   std_logic_vector(1  downto  0);
            Rmii2Phy_tx_en    : out   std_logic
            );
end rmii_tx_agile;

------------------------------------------------------------------------------
-- Configurations
------------------------------------------------------------------------------
-- No Configurations

------------------------------------------------------------------------------
-- Architecture
------------------------------------------------------------------------------

architecture simulation of rmii_tx_agile is

attribute DowngradeIPIdentifiedWarnings: string;

attribute DowngradeIPIdentifiedWarnings of simulation : architecture is "yes";

------------------------------------------------------------------------------
-- Constant Declarations
------------------------------------------------------------------------------
-- Note that global constants and parameters (such as RESET_ACTIVE, default
-- values for address and data --widths, initialization values, etc.) should be
-- collected into a global package or include file.
-- Constants are all uppercase.
-- Constants or parameters should be used for all numeric values except for
-- single "0" or "1" values.
-- Constants should also be used when denoting a bit location within a register.
-- If no constants are required, simply state this in a comment below the file
-- section separation comments.
------------------------------------------------------------------------------
-- No Constants


------------------------------------------------------------------------------
-- Signal and Type Declarations
------------------------------------------------------------------------------

type   STATES_TYPE  is (
                       IDLE_CLK_L,
                       IDLE_CLK_H,
                       TX100_DIBIT_0_CLK_L,
                       TX100_DIBIT_1_CLK_H,
                       TX10_DIBIT_0_CLK_L0,
                       TX10_DIBIT_0_CLK_L1,
                       TX10_DIBIT_0_CLK_L2,
                       TX10_DIBIT_0_CLK_L3,
                       TX10_DIBIT_0_CLK_L4,
                       TX10_DIBIT_0_CLK_L5,
                       TX10_DIBIT_0_CLK_L6,
                       TX10_DIBIT_0_CLK_L7,
                       TX10_DIBIT_0_CLK_L8,
                       TX10_DIBIT_0_CLK_L9,
                       TX10_DIBIT_1_CLK_H0,
                       TX10_DIBIT_1_CLK_H1,
                       TX10_DIBIT_1_CLK_H2,
                       TX10_DIBIT_1_CLK_H3,
                       TX10_DIBIT_1_CLK_H4,
                       TX10_DIBIT_1_CLK_H5,
                       TX10_DIBIT_1_CLK_H6,
                       TX10_DIBIT_1_CLK_H7,
                       TX10_DIBIT_1_CLK_H8,
                       TX10_DIBIT_1_CLK_H9
                       );

signal  present_state     :  STATES_TYPE;
signal  next_state        :  STATES_TYPE;
signal  mac2Rmii_tx_en_d  :  std_logic;
signal  mac2Rmii_txd_d    :  std_logic_vector(3   downto   0);
signal  mac2Rmii_tx_er_d  :  std_logic;
signal  tx_in_reg_en      :  std_logic;
signal  txd_dibit         :  std_logic;
signal  txd_error         :  std_logic;

begin

------------------------------------------------------------------------------
-- TX_IN_REG_PROCESS
------------------------------------------------------------------------------
-- Include comments about the function of the process
------------------------------------------------------------------------------
TX_IN_REG_PROCESS : process ( Ref_Clk )
begin
    if (Ref_Clk'event and Ref_Clk = '1') then

        if (sync_rst_n = C_RESET_ACTIVE) then
            mac2Rmii_tx_en_d  <=  '0';
            mac2Rmii_txd_d    <=  (others => '0');
            mac2Rmii_tx_er_d  <=  '0';

        elsif (tx_in_reg_en = '1') then
            mac2Rmii_tx_en_d  <=  Mac2Rmii_tx_en;
            mac2Rmii_txd_d    <=  Mac2Rmii_txd;
            mac2Rmii_tx_er_d  <=  Mac2Rmii_tx_er;

        end if;
    end if;
end process;

------------------------------------------------------------------------------
-- TX_OUT_REG_PROCESS
------------------------------------------------------------------------------
-- Include comments about the function of the process
------------------------------------------------------------------------------
TX_OUT_REG_PROCESS : process ( Ref_Clk )
begin
    if (Ref_Clk'event and Ref_Clk = '1') then

        if (sync_rst_n = C_RESET_ACTIVE) then
            Rmii2Phy_txd(0)  <=  '0';
            Rmii2Phy_txd(1)  <=  '0';
            Rmii2Phy_tx_en   <=  '0';

        elsif (txd_dibit  = '0') then
            Rmii2Phy_txd(0)  <=  mac2Rmii_txd_d(0) xor txd_error;
            Rmii2Phy_txd(1)  <=  mac2Rmii_txd_d(1) or  txd_error;
            Rmii2Phy_tx_en   <=  mac2Rmii_tx_en_d;

        elsif (txd_dibit  = '1') then
            Rmii2Phy_txd(0)  <=  mac2Rmii_txd_d(2) xor txd_error;
            Rmii2Phy_txd(1)  <=  mac2Rmii_txd_d(3) or  txd_error;
            Rmii2Phy_tx_en   <=  mac2Rmii_tx_en_d;

        end if;
    end if;
end process;

------------------------------------------------------------------------------
-- TX_CONTROL_SYNC_PROCESS
------------------------------------------------------------------------------
-- Include comments about the function of the process
------------------------------------------------------------------------------
TX_CONTROL_SYNC_PROCESS : process ( Ref_Clk )
begin
    if (Ref_Clk'event and Ref_Clk = '1') then
        if (sync_rst_n = C_RESET_ACTIVE) then
            present_state  <=  IDLE_CLK_L;
        else
            present_state  <=  next_state;
        end if;
    end if;
end process;

------------------------------------------------------------------------------
-- TX_CONTROL_NEXT_STATE_PROCESS
------------------------------------------------------------------------------
-- Include comments about the function of the process
------------------------------------------------------------------------------
TX_CONTROL_NEXT_STATE_PROCESS : process (
                                        present_state,
                                        mac2Rmii_tx_er_d,
					Tx_speed_100--new addition of signals
                                        )

begin
    case present_state is

       when IDLE_CLK_L  =>
           next_state       <=  IDLE_CLK_H;
           Rmii2Mac_tx_clk  <=  '0';
           tx_in_reg_en     <=  '1';
           txd_dibit        <=  '0';
           txd_error        <=  '0';

       when IDLE_CLK_H  =>
           if (Tx_speed_100 = '1') then
               next_state   <=  TX100_DIBIT_0_CLK_L;
           else
               next_state   <=  TX10_DIBIT_0_CLK_L0;
           end if;
           Rmii2Mac_tx_clk  <=  '1';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '0';
           txd_error        <=  '0';

       when TX100_DIBIT_0_CLK_L  =>
           next_state       <=  TX100_DIBIT_1_CLK_H;
           Rmii2Mac_tx_clk  <=  '0';
           tx_in_reg_en     <=  '1';
           txd_dibit        <=  '1';
           txd_error        <=  mac2Rmii_tx_er_d;

       when TX100_DIBIT_1_CLK_H  =>
           next_state       <=  TX100_DIBIT_0_CLK_L;
           Rmii2Mac_tx_clk  <=  '1';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '0';
           txd_error        <=  mac2Rmii_tx_er_d;

       when TX10_DIBIT_0_CLK_L0  =>
           next_state       <=  TX10_DIBIT_0_CLK_L1;
           Rmii2Mac_tx_clk  <=  '0';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '1';
           txd_error        <=  '0';

       when TX10_DIBIT_0_CLK_L1  =>
           next_state       <=  TX10_DIBIT_0_CLK_L2;
           Rmii2Mac_tx_clk  <=  '0';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '1';
           txd_error        <=  '0';

       when TX10_DIBIT_0_CLK_L2  =>
           next_state       <=  TX10_DIBIT_0_CLK_L3;
           Rmii2Mac_tx_clk  <=  '0';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '1';
           txd_error        <=  '0';

       when TX10_DIBIT_0_CLK_L3  =>
           next_state       <=  TX10_DIBIT_0_CLK_L4;
           Rmii2Mac_tx_clk  <=  '0';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '1';
           txd_error        <=  '0';

       when TX10_DIBIT_0_CLK_L4  =>
           next_state       <=  TX10_DIBIT_0_CLK_L5;
           Rmii2Mac_tx_clk  <=  '0';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '1';
           txd_error        <=  '0';

       when TX10_DIBIT_0_CLK_L5  =>
           next_state       <=  TX10_DIBIT_0_CLK_L6;
           Rmii2Mac_tx_clk  <=  '0';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '1';
           txd_error        <=  '0';

       when TX10_DIBIT_0_CLK_L6  =>
           next_state       <=  TX10_DIBIT_0_CLK_L7;
           Rmii2Mac_tx_clk  <=  '0';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '1';
           txd_error        <=  '0';

       when TX10_DIBIT_0_CLK_L7  =>
           next_state       <=  TX10_DIBIT_0_CLK_L8;
           Rmii2Mac_tx_clk  <=  '0';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '1';
           txd_error        <=  '0';

       when TX10_DIBIT_0_CLK_L8  =>
           next_state       <=  TX10_DIBIT_0_CLK_L9;
           Rmii2Mac_tx_clk  <=  '0';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '1';
           txd_error        <=  '0';

       when TX10_DIBIT_0_CLK_L9  =>
           next_state       <=  TX10_DIBIT_1_CLK_H0;
           Rmii2Mac_tx_clk  <=  '0';
           tx_in_reg_en     <=  '1';
           txd_dibit        <=  '1';
           txd_error        <=  '0';

       when TX10_DIBIT_1_CLK_H0  =>
           next_state       <=  TX10_DIBIT_1_CLK_H1;
           Rmii2Mac_tx_clk  <=  '1';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '0';
           txd_error        <=  '0';

       when TX10_DIBIT_1_CLK_H1  =>
           next_state       <=  TX10_DIBIT_1_CLK_H2;
           Rmii2Mac_tx_clk  <=  '1';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '0';
           txd_error        <=  '0';

       when TX10_DIBIT_1_CLK_H2  =>
           next_state       <=  TX10_DIBIT_1_CLK_H3;
           Rmii2Mac_tx_clk  <=  '1';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '0';
           txd_error        <=  '0';

       when TX10_DIBIT_1_CLK_H3  =>
           next_state       <=  TX10_DIBIT_1_CLK_H4;
           Rmii2Mac_tx_clk  <=  '1';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '0';
           txd_error        <=  '0';

       when TX10_DIBIT_1_CLK_H4  =>
           next_state       <=  TX10_DIBIT_1_CLK_H5;
           Rmii2Mac_tx_clk  <=  '1';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '0';
           txd_error        <=  '0';

       when TX10_DIBIT_1_CLK_H5  =>
           next_state       <=  TX10_DIBIT_1_CLK_H6;
           Rmii2Mac_tx_clk  <=  '1';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '0';
           txd_error        <=  '0';

       when TX10_DIBIT_1_CLK_H6  =>
           next_state       <=  TX10_DIBIT_1_CLK_H7;
           Rmii2Mac_tx_clk  <=  '1';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '0';
           txd_error        <=  '0';

       when TX10_DIBIT_1_CLK_H7  =>
           next_state       <=  TX10_DIBIT_1_CLK_H8;
           Rmii2Mac_tx_clk  <=  '1';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '0';
           txd_error        <=  '0';

       when TX10_DIBIT_1_CLK_H8  =>
           next_state       <=  TX10_DIBIT_1_CLK_H9;
           Rmii2Mac_tx_clk  <=  '1';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '0';
           txd_error        <=  '0';

       when TX10_DIBIT_1_CLK_H9  =>
           next_state       <=  TX10_DIBIT_0_CLK_L0;
           Rmii2Mac_tx_clk  <=  '1';
           tx_in_reg_en     <=  '0';
           txd_dibit        <=  '0';
           txd_error        <=  '0';


    end case;
end process;

end simulation;


-----------------------------------------------------------------------
    -- (c) Copyright 1984 - 2012 Xilinx, Inc. All rights reserved.
    --
    -- This file contains confidential and proprietary information
    -- of Xilinx, Inc. and is protected under U.S. and
    -- international copyright and other intellectual property
    -- laws.
    --
    -- DISCLAIMER
    -- This disclaimer is not a license and does not grant any
    -- rights to the materials distributed herewith. Except as
    -- otherwise provided in a valid license issued to you by
    -- Xilinx, and to the maximum extent permitted by applicable
    -- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
    -- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
    -- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
    -- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
    -- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
    -- (2) Xilinx shall not be liable (whether in contract or tort,
    -- including negligence, or under any other theory of
    -- liability) for any loss or damage of any kind or nature
    -- related to, arising under or in connection with these
    -- materials, including for any direct, or any indirect,
    -- special, incidental, or consequential loss or damage
    -- (including loss of data, profits, goodwill, or any type of
    -- loss or damage suffered as a result of any action brought
    -- by a third party) even if such damage or loss was
    -- reasonably foreseeable or Xilinx had been advised of the
    -- possibility of the same.
    --
    -- CRITICAL APPLICATIONS
    -- Xilinx products are not designed or intended to be fail-
    -- safe, or for use in any application requiring fail-safe
    -- performance, such as life-support or safety devices or
    -- systems, Class III medical devices, nuclear facilities,
    -- applications related to the deployment of airbags, or any
    -- other applications that could lead to death, personal
    -- injury, or severe property or environmental damage
    -- (individually and collectively, "Critical
    -- Applications"). Customer assumes the sole risk and
    -- liability of any use of Xilinx products in Critical
    -- Applications, subject only to applicable laws and
    -- regulations governing limitations on product liability.
    --
    -- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
    -- PART OF THIS FILE AT ALL TIMES.
-----------------------------------------------------------------------
-- Filename:        rmii_rx_fixed.vhd
--
-- Version:         v1.01.a
-- Description:     Top level of RMII(reduced media independent interface)
--
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x"
--      reset signals:                          "rst", "rst_n"
--      generics:                               "C_*"
--      user defined types:                     "*_TYPE"
--      state machine next state:               "*_ns"
--      state machine current state:            "*_cs"
--      combinatorial signals:                  "*_cmb"
--      pipelined or register delay signals:    "*_d#"
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce"
--      internal version of output port         "*_i"
--      device pins:                            "*_pin"
--      ports:                                  - Names begin with Uppercase
--      processes:                              "*_PROCESS"
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

------------------------------------------------------------------------------
-- Include comments indicating reasons why packages are being used
-- Don't use ".all" - indicate which parts of the packages are used in the
-- "use" statement
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- include library containing the entities you're configuring
------------------------------------------------------------------------------

library mii_to_rmii_v2_0_17;
use mii_to_rmii_v2_0_17.all;


------------------------------------------------------------------------------
-- Port Declaration
------------------------------------------------------------------------------
-- Definition of Generics:
--          C_GEN1          -- description of generic, if description doesn't
--                          -- fit align with first part of description
--          C_GEN2          -- description of generic
--
-- Definition of Ports:
--          Port_name1      -- description of port, indicate source or
--          Port_name2      -- destination description of port
--
------------------------------------------------------------------------------

entity rmii_rx_fixed is
    generic (
            C_RESET_ACTIVE    :  std_logic     :=  '0';
            C_SPEED_100       :  std_logic     :=  '1'
            );

    port    (
            Rx_speed_100      : in    std_logic;
            ------------------  System Signals  ---------------------
            Sync_rst_n        : in    std_logic;
            Ref_Clk           : in    std_logic;
            ------------------  MII <--> RMII  ----------------------
            Rmii2Mac_rx_clk   : out   std_logic;
            Rmii2Mac_crs      : out   std_logic;
            Rmii2Mac_rx_dv    : out   std_logic;
            Rmii2Mac_rx_er    : out   std_logic;
            Rmii2Mac_rxd      : out   std_logic_vector(3  downto  0);
            ------------------  RMII <--> PHY  ----------------------
            Phy2Rmii_crs_dv   : in    std_logic;
            Phy2Rmii_rx_er    : in    std_logic;
            Phy2Rmii_rxd      : in    std_logic_vector(1  downto  0)
            );
end rmii_rx_fixed;

------------------------------------------------------------------------------
-- Configurations
------------------------------------------------------------------------------
-- No Configurations

------------------------------------------------------------------------------
-- Architecture
------------------------------------------------------------------------------

architecture simulation of rmii_rx_fixed is

attribute DowngradeIPIdentifiedWarnings: string;

attribute DowngradeIPIdentifiedWarnings of simulation : architecture is "yes";

------------------------------------------------------------------------------
-- Constant Declarations
------------------------------------------------------------------------------
-- Note that global constants and parameters (such as RESET_ACTIVE, default
-- values for address and data --widths, initialization values, etc.) should
-- be collected into a global package or include file.
-- Constants are all uppercase.
-- Constants or parameters should be used for all numeric values except for
-- single "0" or "1" values.
-- Constants should also be used when denoting a bit location within a
-- register. If no constants are required, simply state this in a comment
-- below the file section separation comments.
------------------------------------------------------------------------------

-- No Constants

------------------------------------------------------------------------------
-- Signal and Type Declarations
------------------------------------------------------------------------------

-- No Signal or Types

------------------------------------------------------------------------------
-- Component Declarations
------------------------------------------------------------------------------

-- No Components

begin

------------------------------------------------------------------------------
--
-- Conditional Generate for FIXED speed throughput of 10 Mb/s
--
------------------------------------------------------------------------------

RX_10_MBPS : if (C_SPEED_100 = '0') generate

    --------------------------------------------------------------------------
    -- Signal and Type Declarations
    --------------------------------------------------------------------------


    type   F_LDR_TYPE  is  (
                            IDLE,
                            RXD_DIB0_0,
                            RXD_DIB0_1,
                            RXD_DIB0_2,
                            RXD_DIB0_3,
                            RXD_DIB0_4,
                            RXD_DIB0_5,
                            RXD_DIB0_6,
                            RXD_DIB0_7,
                            RXD_DIB0_8,
                            RXD_DIB0_9,
                            RXD_DIB1_0,
                            RXD_DIB1_1,
                            RXD_DIB1_2,
                            RXD_DIB1_3,
                            RXD_DIB1_4,
                            RXD_DIB1_5,
                            RXD_DIB1_6,
                            RXD_DIB1_7,
                            RXD_DIB1_8,
                            RXD_DIB1_9
                           );

    type   F_UNLDR_TYPE is (
                            RX_CLK_L0,
                            RX_CLK_L1,
                            RX_CLK_L2,
                            RX_CLK_L3,
                            RX_CLK_L4,
                            RX_CLK_L5,
                            RX_CLK_L6,
                            RX_CLK_L7,
                            RX_CLK_L8,
                            RX_CLK_L9,
                            RX_CLK_H0,
                            RX_CLK_H1,
                            RX_CLK_H2,
                            RX_CLK_H3,
                            RX_CLK_H4,
                            RX_CLK_H5,
                            RX_CLK_H6,
                            RX_CLK_H7,
                            RX_CLK_H8,
                            RX_CLK_H9
                           );

    signal  fifo_ldr_cs               :  F_LDR_TYPE;
    signal  fifo_ldr_ns               :  F_LDR_TYPE;

    signal  fifo_unldr_cs             :  F_UNLDR_TYPE;
    signal  fifo_unldr_ns             :  F_UNLDR_TYPE;

    signal  rmii2Mac_crs_i            :  std_logic;
    signal  rmii2Mac_rx_er_i          :  std_logic;

    signal  rx_begin_packet           :  std_logic_vector(1 downto 0);
    signal  rx_beg_of_packet          :  std_logic;
    signal  rx_end_packet             :  std_logic_vector(1 downto 0);
    signal  rx_end_of_packet          :  std_logic;

    signal  phy2Rmii_crs_dv_sr        :  std_logic_vector(22 downto 0);

    signal  rx_out_mux_sel            :  std_logic;
    signal  rx_out_reg_en             :  std_logic;

    signal  phy2Rmii_rxd_d1           :  std_logic_vector(3 downto 0);

    signal  fIFO_Reset                :  std_logic;
    signal  fIFO_Write                :  std_logic;
    signal  fIFO_Data_In              :  std_logic_vector(4 downto 0);
    signal  fIFO_Read                 :  std_logic;
    signal  fIFO_Data_Out             :  std_logic_vector(4 downto 0);
    signal  fIFO_Data_Exists          :  std_logic;
    signal  fifo_din_dv               :  std_logic;

    signal  rxd_smpl_dibit            :  std_logic;

    begin

    --------------------------------------------------------------------------
    -- Component Instaniations
    --------------------------------------------------------------------------

    SRL_FIFO_I_1 : entity mii_to_rmii_v2_0_17.srl_fifo(IMP)
        generic map (
                     C_DATA_BITS  =>  5,
                     C_DEPTH      =>  16
                    )

        port map    (
                     Clk          =>  Ref_Clk,           -- in
                     Reset        =>  fIFO_Reset,        -- in
                     FIFO_Write   =>  fIFO_Write,        -- in
                     Data_In      =>  fIFO_Data_In,      -- in
                     FIFO_Read    =>  fIFO_Read,         -- out
                     Data_Out     =>  fIFO_Data_Out,     -- out
                     FIFO_Full    =>  open,              -- out
                     Data_Exists  =>  fIFO_Data_Exists,  -- out
                     Addr         =>  open
                    );

    --------------------------------------------------------------------------
    --  FIFO_RESET_PROCESS
    --------------------------------------------------------------------------

    FIFO_RESET_PROCESS : process ( sync_rst_n )
    begin
        if (sync_rst_n = C_RESET_ACTIVE) then
            fIFO_Reset <= '1';
        else
            fIFO_Reset <= '0';
        end if;
    end process;

    --------------------------------------------------------------------------
    -- Concurrent Signal Assignments
    --------------------------------------------------------------------------

    Rmii2Mac_crs      <= rmii2Mac_crs_i;
    rx_beg_of_packet  <= rx_begin_packet(0) and not rx_begin_packet(1);
    rx_end_of_packet  <= rx_end_packet(0)   and not rx_end_packet(1);
    fIFO_Data_In      <= fifo_din_dv & phy2Rmii_rxd_d1;

    --------------------------------------------------------------------------
    -- RX_CARRY_SENSE_PROCESS
    --------------------------------------------------------------------------

    RX_CARRY_SENSE_PROCESS : process ( Ref_Clk )
    begin
        if (Ref_Clk'event and Ref_Clk = '1') then
            if (Sync_rst_n = '0') then
                rmii2Mac_crs_i <= '0';
            else
                rmii2Mac_crs_i <= ( phy2Rmii_crs_dv_sr(1) and rmii2Mac_crs_i ) or
                                   (phy2Rmii_crs_dv_sr(1) and not
                                    phy2Rmii_crs_dv_sr(21) );
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------
    -- RMII_CRS_DV_PIPELINE_PROCESS
    --------------------------------------------------------------------------

    RMII_CRS_DV_PIPELINE_PROCESS : process ( Ref_Clk )
    begin
        if (Ref_Clk'event and Ref_Clk = '1') then
            if (Sync_rst_n = '0') then
                phy2Rmii_crs_dv_sr <= (others => '0');
            else
                phy2Rmii_crs_dv_sr <= phy2Rmii_crs_dv_sr(21 downto 0) &
                                      Phy2Rmii_crs_dv;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------
    -- FIFO_DIN_DV_PROCESS
    --------------------------------------------------------------------------

    FIFO_DIN_DV_PROCESS : process ( Ref_Clk )
    begin
        if (Ref_Clk'event and Ref_Clk = '1') then
            if ( Sync_rst_n = '0' ) then
                fifo_din_dv  <= '0';
            elsif ( rx_beg_of_packet = '1' ) then
                fifo_din_dv  <= '1';
            elsif ( rx_end_of_packet = '1' ) then
                fifo_din_dv  <= '0';
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------
    -- RX_IN_REG_PROCESS
    --------------------------------------------------------------------------

    RX_IN_REG_PROCESS : process ( Ref_Clk )
    begin
        if (Ref_Clk'event and Ref_Clk = '1') then
            if (sync_rst_n = C_RESET_ACTIVE) then
                phy2Rmii_rxd_d1  <= (others => '0');
            elsif (rxd_smpl_dibit = '1') then
                phy2Rmii_rxd_d1(1 downto 0) <= phy2Rmii_rxd_d1(3 downto 2);
                phy2Rmii_rxd_d1(3 downto 2) <= Phy2Rmii_rxd;
            end if;
       end if;
    end process;

    --------------------------------------------------------------------------
    -- RX_BEGIN_OF_PACKET_PROCESS
    --------------------------------------------------------------------------

    RX_BEGIN_OF_PACKET_PROCESS : process ( Ref_Clk )
    begin
        if (Ref_Clk'event and Ref_Clk = '1') then
            if (( Sync_rst_n = '0' ) or ( rx_end_of_packet = '1' )) then
                rx_begin_packet  <= "00";
            else
                rx_begin_packet(1)  <= rx_begin_packet(0);
                if ( ( Phy2Rmii_crs_dv  = '1'  ) and
                     ( Phy2Rmii_rxd     = "01" ) and
                     ( rx_beg_of_packet = '0'  ) ) then

                     rx_begin_packet(0)  <= '1';

                end if;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------
    -- RX_END_OF_PACKET_PROCESS
    --------------------------------------------------------------------------

    RX_END_OF_PACKET_PROCESS : process ( Ref_Clk )
    begin
        if (Ref_Clk'event and Ref_Clk = '1') then
            if (( Sync_rst_n = '0' ) or ( rx_beg_of_packet = '1' )) then
                rx_end_packet   <= "00";
            else
                rx_end_packet(1)  <= rx_end_packet(0);
                if ( ( phy2Rmii_crs_dv_sr(9) = '0' ) and
                     ( phy2Rmii_crs_dv = '0' ) and
                     ( rx_end_of_packet   = '0' ) ) then

                     rx_end_packet(0)  <= '1';

                end if;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------
    -- RX_ERROR_PROCESS
    --------------------------------------------------------------------------

    RX_ERROR_PROCESS : process ( Ref_Clk )
    begin
        if (Ref_Clk'event and Ref_Clk = '1') then
            if (Sync_rst_n = '0') then
                rmii2Mac_rx_er_i  <= '0';
            else
                rmii2Mac_rx_er_i  <= Phy2Rmii_rx_er;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------
    -- RX_OUT_REG_PROCESS
    --------------------------------------------------------------------------

    RX_OUT_REG_PROCESS : process ( Ref_Clk )
    begin
        if (Ref_Clk'event and Ref_Clk = '1') then
            if (sync_rst_n = C_RESET_ACTIVE) then
                Rmii2Mac_rx_er  <=  '0';
                Rmii2Mac_rx_dv  <=  '0';
                Rmii2Mac_rxd    <= (others => '0');
            elsif (rx_out_reg_en = '1') then
                if (rx_out_mux_sel = '1') then
                    Rmii2Mac_rx_er <= rmii2Mac_rx_er_i;
                    Rmii2Mac_rx_dv <= fIFO_Data_Out(4);
                    Rmii2Mac_rxd   <= fIFO_Data_Out(3 downto 0);
                else
                    Rmii2Mac_rx_er <= rmii2Mac_rx_er_i;
                    Rmii2Mac_rx_dv <= '0';
                    Rmii2Mac_rxd   <= (others => '0');
                end if;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------
    -- STATE_MACHS_SYNC_PROCESS
    --------------------------------------------------------------------------

    STATE_MACHS_SYNC_PROCESS : process ( Ref_Clk )
    begin
        if (Ref_Clk'event and Ref_Clk = '1') then
            if (sync_rst_n = C_RESET_ACTIVE) then
                fifo_ldr_cs   <= IDLE;
                fifo_unldr_cs <= RX_CLK_L0;
            else
                fifo_ldr_cs   <= fifo_ldr_ns;
                fifo_unldr_cs <= fifo_unldr_ns;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------
    -- FIFO_LOADER_NEXT_STATE_PROCESS
    --------------------------------------------------------------------------

    FIFO_LOADER_NEXT_STATE_PROCESS : process (
                                             fifo_ldr_cs,
                                             fifo_din_dv
                                             )

    begin
        case fifo_ldr_cs is

           when IDLE =>
               if (fifo_din_dv = '1') then
                   fifo_ldr_ns <= RXD_DIB0_0;
               else
                   fifo_ldr_ns <= IDLE;
               end if;
               rxd_smpl_dibit <= '0';
               fIFO_Write     <= '0';

           when RXD_DIB0_0 =>
               fifo_ldr_ns    <= RXD_DIB0_1;
               rxd_smpl_dibit <= '0';
               fIFO_Write     <= '0';

           when RXD_DIB0_1 =>
               fifo_ldr_ns    <= RXD_DIB0_2;
               rxd_smpl_dibit <= '0';
               fIFO_Write     <= '0';

           when RXD_DIB0_2 =>
               fifo_ldr_ns    <= RXD_DIB0_3;
               rxd_smpl_dibit <= '0';
               fIFO_Write     <= '0';

           when RXD_DIB0_3 =>
               fifo_ldr_ns    <= RXD_DIB0_4;
               rxd_smpl_dibit <= '1';
               fIFO_Write     <= '0';

           when RXD_DIB0_4 =>
               fifo_ldr_ns    <= RXD_DIB0_5;
               rxd_smpl_dibit <= '0';
               fIFO_Write     <= '0';

           when RXD_DIB0_5 =>
               fifo_ldr_ns    <= RXD_DIB0_6;
               rxd_smpl_dibit <= '0';
               fIFO_Write     <= '0';

           when RXD_DIB0_6 =>
               fifo_ldr_ns    <= RXD_DIB0_7;
               rxd_smpl_dibit <= '0';
               fIFO_Write     <= '0';

           when RXD_DIB0_7 =>
               fifo_ldr_ns    <= RXD_DIB0_8;
               rxd_smpl_dibit <= '0';
               fIFO_Write     <= '0';

           when RXD_DIB0_8 =>
               fifo_ldr_ns    <= RXD_DIB0_9;
               rxd_smpl_dibit <= '0';
               fIFO_Write     <= '0';

           when RXD_DIB0_9 =>
               fifo_ldr_ns    <= RXD_DIB1_0;
               rxd_smpl_dibit <= '0';
               fIFO_Write     <= '0';

           when RXD_DIB1_0 =>
               fifo_ldr_ns    <= RXD_DIB1_1;
               rxd_smpl_dibit <= '0';
               fIFO_Write     <= '0';

           when RXD_DIB1_1 =>
               fifo_ldr_ns    <= RXD_DIB1_2;
               rxd_smpl_dibit <= '0';
               fIFO_Write     <= '0';

           when RXD_DIB1_2 =>
               fifo_ldr_ns    <= RXD_DIB1_3;
               rxd_smpl_dibit <= '0';
               fIFO_Write     <= '0';

           when RXD_DIB1_3 =>
               fifo_ldr_ns    <= RXD_DIB1_4;
               rxd_smpl_dibit <= '1';
               fIFO_Write     <= '0';

           when RXD_DIB1_4 =>
               fifo_ldr_ns    <= RXD_DIB1_5;
               rxd_smpl_dibit <= '0';
               fIFO_Write     <= '0';

           when RXD_DIB1_5 =>
               fifo_ldr_ns    <= RXD_DIB1_6;
               rxd_smpl_dibit <= '0';
               fIFO_Write     <= '0';

           when RXD_DIB1_6 =>
               fifo_ldr_ns    <= RXD_DIB1_7;
               rxd_smpl_dibit <= '0';
               fIFO_Write     <= '0';

           when RXD_DIB1_7 =>
               fifo_ldr_ns    <= RXD_DIB1_8;
               rxd_smpl_dibit <= '0';
               fIFO_Write     <= '0';

           when RXD_DIB1_8 =>
               fifo_ldr_ns    <= RXD_DIB1_9;
               rxd_smpl_dibit <= '0';
               fIFO_Write     <= '0';

           when RXD_DIB1_9 =>
               if (fifo_din_dv = '1') then
                   fifo_ldr_ns <= RXD_DIB0_0;
               else
                   fifo_ldr_ns <= IDLE;
               end if;
               rxd_smpl_dibit <= '0';
               fIFO_Write     <= '1';

        end case;
    end process;

    --------------------------------------------------------------------------
    -- FIFO_UNLOADER_NEXT_STATE_PROCESS
    --------------------------------------------------------------------------

    FIFO_UNLOADER_NEXT_STATE_PROCESS : process (
                                                fifo_unldr_cs,
                                                fIFO_Data_Exists
                                               )

    begin
        case fifo_unldr_cs is

            when RX_CLK_L0 =>
                fifo_unldr_ns   <= RX_CLK_L1;
                Rmii2Mac_rx_clk <= '0';
                rx_out_reg_en   <= '0';
                fIFO_Read       <= '0';
                rx_out_mux_sel  <= '0';

            when RX_CLK_L1 =>
                fifo_unldr_ns   <= RX_CLK_L2;
                Rmii2Mac_rx_clk <= '0';
                rx_out_reg_en   <= '0';
                fIFO_Read       <= '0';
                rx_out_mux_sel  <= '0';

            when RX_CLK_L2 =>
                fifo_unldr_ns   <= RX_CLK_L3;
                Rmii2Mac_rx_clk <= '0';
                rx_out_reg_en   <= '0';
                fIFO_Read       <= '0';
                rx_out_mux_sel  <= '0';

            when RX_CLK_L3 =>
                fifo_unldr_ns   <= RX_CLK_L4;
                Rmii2Mac_rx_clk <= '0';
                rx_out_reg_en   <= '0';
                fIFO_Read       <= '0';
                rx_out_mux_sel  <= '0';

            when RX_CLK_L4 =>
                fifo_unldr_ns   <= RX_CLK_L5;
                Rmii2Mac_rx_clk <= '0';
                rx_out_reg_en   <= '0';
                fIFO_Read       <= '0';
                rx_out_mux_sel  <= '0';

            when RX_CLK_L5 =>
                fifo_unldr_ns   <= RX_CLK_L6;
                Rmii2Mac_rx_clk <= '0';
                rx_out_reg_en   <= '0';
                fIFO_Read       <= '0';
                rx_out_mux_sel  <= '0';

            when RX_CLK_L6 =>
                fifo_unldr_ns   <= RX_CLK_L7;
                Rmii2Mac_rx_clk <= '0';
                rx_out_reg_en   <= '0';
                fIFO_Read       <= '0';
                rx_out_mux_sel  <= '0';

            when RX_CLK_L7 =>
                fifo_unldr_ns   <= RX_CLK_L8;
                Rmii2Mac_rx_clk <= '0';
                rx_out_reg_en   <= '0';
                fIFO_Read       <= '0';
                rx_out_mux_sel  <= '0';

            when RX_CLK_L8 =>
                fifo_unldr_ns   <= RX_CLK_L9;
                Rmii2Mac_rx_clk <= '0';
                rx_out_reg_en   <= '0';
                fIFO_Read       <= '0';
                rx_out_mux_sel  <= '0';

            when RX_CLK_L9 =>
                fifo_unldr_ns   <= RX_CLK_H0;
                Rmii2Mac_rx_clk <= '0';
                rx_out_reg_en   <= '0';
                fIFO_Read       <= '0';
                rx_out_mux_sel  <= '0';

            when RX_CLK_H0 =>
                fifo_unldr_ns   <= RX_CLK_H1;
                Rmii2Mac_rx_clk <= '1';
                rx_out_reg_en   <= '0';
                fIFO_Read       <= '0';
                rx_out_mux_sel  <= '0';

            when RX_CLK_H1 =>
                fifo_unldr_ns   <= RX_CLK_H2;
                Rmii2Mac_rx_clk <= '1';
                rx_out_reg_en   <= '0';
                fIFO_Read       <= '0';
                rx_out_mux_sel  <= '0';

            when RX_CLK_H2 =>
                fifo_unldr_ns   <= RX_CLK_H3;
                Rmii2Mac_rx_clk <= '1';
                rx_out_reg_en   <= '0';
                fIFO_Read       <= '0';
                rx_out_mux_sel  <= '0';

            when RX_CLK_H3 =>
                fifo_unldr_ns   <= RX_CLK_H4;
                Rmii2Mac_rx_clk <= '1';
                rx_out_reg_en   <= '0';
                fIFO_Read       <= '0';
                rx_out_mux_sel  <= '0';

            when RX_CLK_H4 =>
                fifo_unldr_ns   <= RX_CLK_H5;
                Rmii2Mac_rx_clk <= '1';
                rx_out_reg_en   <= '0';
                fIFO_Read       <= '0';
                rx_out_mux_sel  <= '0';

            when RX_CLK_H5 =>
                fifo_unldr_ns   <= RX_CLK_H6;
                Rmii2Mac_rx_clk <= '1';
                rx_out_reg_en   <= '0';
                fIFO_Read       <= '0';
                rx_out_mux_sel  <= '0';

            when RX_CLK_H6 =>
                fifo_unldr_ns   <= RX_CLK_H7;
                Rmii2Mac_rx_clk <= '1';
                rx_out_reg_en   <= '0';
                fIFO_Read       <= '0';
                rx_out_mux_sel  <= '0';

            when RX_CLK_H7 =>
                fifo_unldr_ns   <= RX_CLK_H8;
                Rmii2Mac_rx_clk <= '1';
                rx_out_reg_en   <= '0';
                fIFO_Read       <= fIFO_Data_Exists;
                rx_out_mux_sel  <= '0';

            when RX_CLK_H8 =>
                fifo_unldr_ns   <= RX_CLK_H9;
                Rmii2Mac_rx_clk <= '1';
                rx_out_reg_en   <= '0';
                fIFO_Read       <= '0';
                rx_out_mux_sel  <= '0';

            when RX_CLK_H9 =>
                fifo_unldr_ns   <= RX_CLK_L0;
                Rmii2Mac_rx_clk <= '1';
                rx_out_reg_en   <= '1';
                fIFO_Read       <= '0';
                rx_out_mux_sel  <= '1';

        end case;
    end process;

end generate;

------------------------------------------------------------------------------
--
-- Conditional Generate for FIXED speed throughput of 100 Mb/s
--
------------------------------------------------------------------------------

RX_100_MBPS : if (C_SPEED_100 = '1') generate

    --------------------------------------------------------------------------
    -- Signal and Type Declarations
    --------------------------------------------------------------------------
    
    type   F_LDR_TYPE  is (
                           IDLE_NO_WR,
                           RX_NO_WR,
                           RX_WR
                           );
    
    signal  fifo_ldr_cs         :  F_LDR_TYPE;
    signal  fifo_ldr_ns         :  F_LDR_TYPE;
    
    type   FLSHR_TYPE  is (
                           FLSHR_IDLE_L,
                           FLSHR_IDLE_H,
                           RX100_CLK_L,
                           RX100_CLK_H
                           );
    
    signal  fifo_flshr_cs       :  FLSHR_TYPE;
    signal  fifo_flshr_ns       :  FLSHR_TYPE;
    
    signal  rmii2Mac_crs_i      :  std_logic;
    signal  rmii2Mac_rx_er_d3   :  std_logic;
    signal  rmii2Mac_rx_er_d2   :  std_logic;
    signal  rmii2Mac_rx_er_d1   :  std_logic;
    
    signal  rx_begin_packet     :  std_logic_vector(1 downto 0);
    signal  rx_beg_of_packet    :  std_logic;
    signal  rx_end_packet       :  std_logic_vector(1 downto 0);
    signal  rx_end_of_packet    :  std_logic;
    
    signal  phy2Rmii_crs_dv_d4  :  std_logic;
    signal  phy2Rmii_crs_dv_d3  :  std_logic;
    signal  phy2Rmii_crs_dv_d2  :  std_logic;
    signal  phy2Rmii_crs_dv_d1  :  std_logic;
    
    signal  rx_out_mux_sel      :  std_logic;
    signal  rx_out_reg_en       :  std_logic;
    
    signal  phy2Rmii_rxd_d3     :  std_logic_vector(3 downto 0);
    signal  phy2Rmii_rxd_d2     :  std_logic_vector(3 downto 0);
    signal  phy2Rmii_rxd_d1     :  std_logic_vector(3 downto 0);
    
    signal  fIFO_Reset          :  std_logic;
    signal  fIFO_Write          :  std_logic;
    signal  fIFO_Data_In        :  std_logic_vector(4 downto 0);
    signal  fIFO_Read           :  std_logic;
    signal  fIFO_Data_Out       :  std_logic_vector(4 downto 0);
    signal  fIFO_Full           :  std_logic;
    signal  fIFO_Data_Exists    :  std_logic;
    signal  fifo_din_dv         :  std_logic;
    
    --CR#618005
    attribute shreg_extract : string;
    attribute shreg_extract of phy2Rmii_crs_dv_d1  : signal is "no";
    attribute shreg_extract of phy2Rmii_rxd_d1     : signal is "no";
    attribute shreg_extract of rmii2Mac_rx_er_d1   : signal is "no";
    --------------------------------------------------------------------------
    -- Component Declarations
    --------------------------------------------------------------------------
    
    component srl_fifo
        generic (
                 C_DATA_BITS  :  natural  :=  8;
                 C_DEPTH      :  natural  :=  16
                );
    
        port    (
                 Clk          :  in   std_logic;
                 Reset        :  in   std_logic;
                 FIFO_Write   :  in   std_logic;
                 Data_In      :  in   std_logic_vector(0 to C_DATA_BITS-1);
                 FIFO_Read    :  in   std_logic;
                 Data_Out     :  out  std_logic_vector(0 to C_DATA_BITS-1);
                 FIFO_Full    :  out  std_logic;
                 Data_Exists  :  out  std_logic;
                 Addr         :  out  std_logic_vector(0 to 3)
                );
    end component;
    
    begin
    
    --------------------------------------------------------------------------
    -- Component Instaniations
    --------------------------------------------------------------------------
    
    I_SRL_FIFO : srl_fifo
        generic map (
                     C_DATA_BITS  =>  5,
                     C_DEPTH      =>  16
                    )
    
        port map    (
                     Clk          =>  Ref_Clk,
                     Reset        =>  fIFO_Reset,
                     FIFO_Write   =>  fIFO_Write,
                     Data_In      =>  fIFO_Data_In,
                     FIFO_Read    =>  fIFO_Read,
                     Data_Out     =>  fIFO_Data_Out,
                     FIFO_Full    =>  fIFO_Full,
                     Data_Exists  =>  fIFO_Data_Exists,
                     Addr         =>  open
                    );
    
    --------------------------------------------------------------------------
    -- Concurrent Signal Assignments
    --------------------------------------------------------------------------
    
    Rmii2Mac_crs      <= rmii2Mac_crs_i;
    rx_beg_of_packet  <= rx_begin_packet(0) and not rx_begin_packet(1);
    rx_end_of_packet  <= rx_end_packet(0)   and not rx_end_packet(1);
    fIFO_Reset        <= not sync_rst_n;
    fIFO_Data_In      <= fifo_din_dv & phy2Rmii_rxd_d3;
    
    --------------------------------------------------------------------------
    -- RX_CARRY_SENSE_PROCESS
    --------------------------------------------------------------------------
    
    RX_CARRY_SENSE_PROCESS : process ( Ref_Clk )
    begin
        if (Ref_Clk'event and Ref_Clk = '1') then
            if (Sync_rst_n = '0') then
                rmii2Mac_crs_i <=  '0';
            else
                rmii2Mac_crs_i <= ( Phy2Rmii_crs_dv_d2 and rmii2Mac_crs_i ) or
                                  ( Phy2Rmii_crs_dv_d2 and not phy2Rmii_crs_dv_d4 );
            end if;
        end if;
    end process;
    
    --------------------------------------------------------------------------
    -- RMII_CRS_DV_PIPELINE_PROCESS
    --------------------------------------------------------------------------
    
    RMII_CRS_DV_PIPELINE_PROCESS : process ( Ref_Clk )
    begin
        if (Ref_Clk'event and Ref_Clk = '1') then
            if (Sync_rst_n = '0') then
                phy2Rmii_crs_dv_d4  <=  '0';
                phy2Rmii_crs_dv_d3  <=  '0';
                phy2Rmii_crs_dv_d2  <=  '0';
                phy2Rmii_crs_dv_d1  <=  '0';
            else
                phy2Rmii_crs_dv_d4  <=  phy2Rmii_crs_dv_d3;
                phy2Rmii_crs_dv_d3  <=  phy2Rmii_crs_dv_d2;
                phy2Rmii_crs_dv_d2  <=  phy2Rmii_crs_dv_d1;
                phy2Rmii_crs_dv_d1  <=  Phy2Rmii_crs_dv;
            end if;
        end if;
    end process;
    
    --------------------------------------------------------------------------
    -- FIFO_DIN_DV_PROCESS
    --------------------------------------------------------------------------
    
    FIFO_DIN_DV_PROCESS : process ( Ref_Clk )
    begin
        if (Ref_Clk'event and Ref_Clk = '1') then
            if ( Sync_rst_n = '0' ) then
                fifo_din_dv  <=  '0';
            elsif ( rx_beg_of_packet = '1') then
                fifo_din_dv  <=  '1';
            elsif ( ( Phy2Rmii_crs_dv_d2 = '0' ) and 
                    ( phy2Rmii_crs_dv_d3 = '0' ) ) then
                fifo_din_dv  <=  '0';
            end if;
        end if;
    end process;
    
    --------------------------------------------------------------------------
    -- RX_IN_REG_PROCESS
    --------------------------------------------------------------------------
    
    RX_IN_REG_PROCESS : process ( Ref_Clk )
    begin
        if (Ref_Clk'event and Ref_Clk = '1') then
            if (sync_rst_n = C_RESET_ACTIVE) then
                phy2Rmii_rxd_d3  <=  (others => '0');
                phy2Rmii_rxd_d2  <=  (others => '0');
                phy2Rmii_rxd_d1  <=  (others => '0');
            else
                phy2Rmii_rxd_d3             <=  phy2Rmii_rxd_d2;
                phy2Rmii_rxd_d2             <=  phy2Rmii_rxd_d1;
                phy2Rmii_rxd_d1(1 downto 0) <=  phy2Rmii_rxd_d1(3 downto 2);
                phy2Rmii_rxd_d1(3 downto 2) <=  Phy2Rmii_rxd;
            end if;
       end if;
    end process;
    
    --------------------------------------------------------------------------
    -- RX_BEGIN_OF_PACKET_PROCESS
    --------------------------------------------------------------------------
    
    RX_BEGIN_OF_PACKET_PROCESS : process ( Ref_Clk )
    begin
        if (Ref_Clk'event and Ref_Clk = '1') then
            if (( Sync_rst_n = '0' ) or ( rx_end_of_packet = '1' )) then
                rx_begin_packet  <= "00";
            else
                rx_begin_packet(1)  <=  rx_begin_packet(0);
    
                if ( ( Phy2Rmii_crs_dv_d2  = '1'  ) and
                     ( Phy2Rmii_rxd_d2(3 downto 2) = "01" ) and
                     ( rx_beg_of_packet    = '0'  ) ) then
    
                     rx_begin_packet(0)  <=  '1';
    
                end if;
    
            end if;
        end if;
    end process;
    
    --------------------------------------------------------------------------
    -- RX_END_OF_PACKET_PROCESS
    --------------------------------------------------------------------------
    
    RX_END_OF_PACKET_PROCESS : process ( Ref_Clk )
    begin
        if (Ref_Clk'event and Ref_Clk = '1') then
            if (( Sync_rst_n = '0' ) or ( rx_beg_of_packet = '1' )) then
                rx_end_packet   <= "00";
            else
                rx_end_packet(1)  <=  rx_end_packet(0);
    
                if ( ( Phy2Rmii_crs_dv_d2 = '0' ) and 
                     ( phy2Rmii_crs_dv_d3 = '0' ) and
                     ( rx_end_of_packet   = '0' ) ) then
    
                     rx_end_packet(0)  <=  '1';
    
                end if;
            end if;
        end if;
    end process;
    
    --------------------------------------------------------------------------
    -- RX_ERROR_PROCESS
    --------------------------------------------------------------------------
    
    RX_ERROR_PROCESS : process ( Ref_Clk )
    begin
        if (Ref_Clk'event and Ref_Clk = '1') then
            if (Sync_rst_n = '0') then
                rmii2Mac_rx_er_d3  <=  '0';
                rmii2Mac_rx_er_d2  <=  '0';
                rmii2Mac_rx_er_d1  <=  '0';
            else
                rmii2Mac_rx_er_d3  <=  rmii2Mac_rx_er_d2;
                rmii2Mac_rx_er_d2  <=  rmii2Mac_rx_er_d1;
                rmii2Mac_rx_er_d1  <=  Phy2Rmii_rx_er;
            end if;
        end if;
    end process;
    
    --------------------------------------------------------------------------
    -- RX_OUT_REG_PROCESS
    --------------------------------------------------------------------------
    
    RX_OUT_REG_PROCESS : process ( Ref_Clk )
    begin
        if (Ref_Clk'event and Ref_Clk = '1') then
            if (sync_rst_n = C_RESET_ACTIVE) then
                Rmii2Mac_rx_er  <=   '0';
                Rmii2Mac_rx_dv  <=   '0';
                Rmii2Mac_rxd    <=  (others => '0');
            elsif (rx_out_reg_en = '1') then
                if ( rx_out_mux_sel = '1' ) then
                    Rmii2Mac_rx_er  <=  rmii2Mac_rx_er_d3;
                    Rmii2Mac_rx_dv  <=  '1';
                    Rmii2Mac_rxd    <=  fIFO_Data_Out(3 downto 0);
                else
                   Rmii2Mac_rx_er  <=  '0';
                   Rmii2Mac_rx_dv  <=  '0';
                   Rmii2Mac_rxd    <=  (others => '0');
                end if;
            end if;
        end if;
    end process;
    
    --------------------------------------------------------------------------
    -- STATE_MACHS_SYNC_PROCESS
    --------------------------------------------------------------------------
    
    STATE_MACHS_SYNC_PROCESS : process ( Ref_Clk )
    begin
        if (Ref_Clk'event and Ref_Clk = '1') then
            if (sync_rst_n = C_RESET_ACTIVE) then
                fifo_ldr_cs    <=  IDLE_NO_WR;
                fifo_flshr_cs  <=  FLSHR_IDLE_L;
            else
                fifo_ldr_cs    <=  fifo_ldr_ns;
                fifo_flshr_cs  <=  fifo_flshr_ns;
            end if;
        end if;
    end process;
    
    --------------------------------------------------------------------------
    -- FIFO_LOADER_NEXT_STATE_PROCESS
    --------------------------------------------------------------------------
    
    FIFO_LOADER_NEXT_STATE_PROCESS : process (
                                             fifo_ldr_cs,
                                             rx_beg_of_packet,
                                             rx_end_of_packet
                                             )
    
    begin
        case fifo_ldr_cs is
    
           when IDLE_NO_WR  =>
               if (rx_beg_of_packet = '1') then
                   fifo_ldr_ns  <=  RX_WR;
               else
                   fifo_ldr_ns  <=  IDLE_NO_WR;
               end if;
               fIFO_Write    <= '0';
    
           when RX_NO_WR  =>
               if (rx_end_of_packet = '1') then
                   fifo_ldr_ns  <=  IDLE_NO_WR;
               else
                   fifo_ldr_ns  <=  RX_WR;
               end if;
               fIFO_Write    <= '0';
    
           when RX_WR  =>
               if (rx_end_of_packet = '1') then
                   fifo_ldr_ns  <=  IDLE_NO_WR;
                   fIFO_Write   <= '0';
               else
                   fifo_ldr_ns  <=  RX_NO_WR;
                   fIFO_Write   <= '1';
               end if;
    
        end case;
    end process;
    
    --------------------------------------------------------------------------
    -- FIFO_FLUSHER_NEXT_STATE_PROCESS
    --------------------------------------------------------------------------
    
    FIFO_FLUSHER_NEXT_STATE_PROCESS : process (
                                              fifo_flshr_cs,
                                              fIFO_Data_Exists
                                              )
    
    begin
        case fifo_flshr_cs is
    
           when FLSHR_IDLE_L  =>
               if (fIFO_Data_Exists = '1') then
                   fifo_flshr_ns   <=  RX100_CLK_H;
               else
                   fifo_flshr_ns   <=  FLSHR_IDLE_H;
               end if;
               Rmii2Mac_rx_clk  <=  '0';
               rx_out_reg_en    <=  '0';
               fIFO_Read        <=  '0';
               rx_out_mux_sel   <=  '0';
    
           when FLSHR_IDLE_H  =>
               if (fIFO_Data_Exists = '1') then
                   fifo_flshr_ns   <=  RX100_CLK_L;
               else
                   fifo_flshr_ns   <=  FLSHR_IDLE_L;
               end if;
               Rmii2Mac_rx_clk  <=  '1';
               rx_out_reg_en    <=  '1';
               fIFO_Read        <=  '0';
               rx_out_mux_sel   <=  '0';
    
           when RX100_CLK_L  =>
               if (fIFO_Data_Exists = '0') then
                   fifo_flshr_ns   <=  FLSHR_IDLE_H;
               else
                   fifo_flshr_ns   <=  RX100_CLK_H;
               end if;
               Rmii2Mac_rx_clk  <=  '0';
               rx_out_reg_en    <=  '0';
               fIFO_Read        <=  '0';
               rx_out_mux_sel   <=  '1';
    
           when RX100_CLK_H  =>
               if (fIFO_Data_Exists = '0') then
                   fifo_flshr_ns   <=  FLSHR_IDLE_L;
               else
                   fifo_flshr_ns   <=  RX100_CLK_L;
               end if;
               Rmii2Mac_rx_clk  <=  '1';
               rx_out_reg_en    <=  '1';
               fIFO_Read        <=  '1';
               rx_out_mux_sel   <=  '1';
    
        end case;
    end process;

end generate;

end simulation;


-----------------------------------------------------------------------
    -- (c) Copyright 1984 - 2012 Xilinx, Inc. All rights reserved.
    --
    -- This file contains confidential and proprietary information
    -- of Xilinx, Inc. and is protected under U.S. and
    -- international copyright and other intellectual property
    -- laws.
    --
    -- DISCLAIMER
    -- This disclaimer is not a license and does not grant any
    -- rights to the materials distributed herewith. Except as
    -- otherwise provided in a valid license issued to you by
    -- Xilinx, and to the maximum extent permitted by applicable
    -- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
    -- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
    -- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
    -- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
    -- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
    -- (2) Xilinx shall not be liable (whether in contract or tort,
    -- including negligence, or under any other theory of
    -- liability) for any loss or damage of any kind or nature
    -- related to, arising under or in connection with these
    -- materials, including for any direct, or any indirect,
    -- special, incidental, or consequential loss or damage
    -- (including loss of data, profits, goodwill, or any type of
    -- loss or damage suffered as a result of any action brought
    -- by a third party) even if such damage or loss was
    -- reasonably foreseeable or Xilinx had been advised of the
    -- possibility of the same.
    --
    -- CRITICAL APPLICATIONS
    -- Xilinx products are not designed or intended to be fail-
    -- safe, or for use in any application requiring fail-safe
    -- performance, such as life-support or safety devices or
    -- systems, Class III medical devices, nuclear facilities,
    -- applications related to the deployment of airbags, or any
    -- other applications that could lead to death, personal
    -- injury, or severe property or environmental damage
    -- (individually and collectively, "Critical
    -- Applications"). Customer assumes the sole risk and
    -- liability of any use of Xilinx products in Critical
    -- Applications, subject only to applicable laws and
    -- regulations governing limitations on product liability.
    --
    -- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
    -- PART OF THIS FILE AT ALL TIMES.
-----------------------------------------------------------------------
-- Filename:        rmii_rx_agile.vhd
--
-- Version:         v1.01.a
-- Description:     Top level of RMII(reduced media independent interface)
--
------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x"
--      reset signals:                          "rst", "rst_n"
--      generics:                               "C_*"
--      user defined types:                     "*_TYPE"
--      state machine next state:               "*_ns"
--      state machine current state:            "*_cs"
--      combinatorial signals:                  "*_cmb"
--      pipelined or register delay signals:    "*_d#"
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce"
--      internal version of output port         "*_i"
--      device pins:                            "*_pin"
--      ports:                                  - Names begin with Uppercase
--      processes:                              "*_PROCESS"
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------------
-- Include comments indicating reasons why packages are being used
-- Don't use ".all" - indicate which parts of the packages are used in the
-- "use" statement
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- include library containing the entities you're configuring
------------------------------------------------------------------------------

library mii_to_rmii_v2_0_17;

------------------------------------------------------------------------------
-- Port Declaration
------------------------------------------------------------------------------
-- Definition of Generics:
--          C_GEN1          -- description of generic, if description doesn't fit
--                          -- align with first part of description
--          C_GEN2          -- description of generic
--
-- Definition of Ports:
--          Port_name1      -- description of port, indicate source or destination
--          Port_name2      -- description of port
--
------------------------------------------------------------------------------
entity rmii_rx_agile is
    generic (
            C_RESET_ACTIVE    : std_logic
            );

    port    (
            Rx_speed_100      : in    std_logic;
            ------------------  System Signals  -------------------------------
            Sync_rst_n        : in    std_logic;
            Ref_Clk           : in    std_logic;
            ------------------  MII <--> RMII  --------------------------------
            Rmii2Mac_rx_clk   : out   std_logic;
            Rmii2Mac_crs      : out   std_logic;
            Rmii2Mac_rx_dv    : out   std_logic;
            Rmii2Mac_rx_er    : out   std_logic;
            Rmii2Mac_rxd      : out   std_logic_vector(3  downto  0);
            ------------------  RMII <--> PHY  --------------------------------
            Phy2Rmii_crs_dv   : in    std_logic;
            Phy2Rmii_rx_er    : in    std_logic;
            Phy2Rmii_rxd      : in    std_logic_vector(1  downto  0)
            );
end rmii_rx_agile;

------------------------------------------------------------------------------
-- Configurations
------------------------------------------------------------------------------
-- No Configurations

------------------------------------------------------------------------------
-- Architecture
------------------------------------------------------------------------------

architecture simulation of rmii_rx_agile is

attribute DowngradeIPIdentifiedWarnings: string;

attribute DowngradeIPIdentifiedWarnings of simulation : architecture is "yes";

------------------------------------------------------------------------------
-- Components
------------------------------------------------------------------------------

component rx_fifo_loader
    generic (
            C_RESET_ACTIVE    :  std_logic
            );

    port    (
            Sync_rst_n        :  in   std_logic;
            Ref_Clk           :  in   std_logic;
            Phy2Rmii_crs_dv   :  in   std_logic;
            Phy2Rmii_rx_er    :  in   std_logic;
            Phy2Rmii_rxd      :  in   std_logic_vector(1  downto  0);
            Rx_fifo_wr_en     :  out  std_logic;
            Rx_10             :  out  std_logic;
            Rx_100            :  out  std_logic;
            Rx_data           :  out  std_logic_vector(7  downto  0);
            Rx_error          :  out  std_logic;
            Rx_data_valid     :  out  std_logic;
            Rx_cary_sense     :  out  std_logic;
            Rx_end_of_packet  :  out  std_logic
            );
end component;

component rx_fifo
    generic (
            C_RESET_ACTIVE    :  std_logic
            );

    port    (
            Sync_rst_n        :  in   std_logic;
            Ref_Clk           :  in   std_logic;
            Rx_fifo_wr_en     :  in   std_logic;
            Rx_fifo_rd_en     :  in   std_logic;
            Rx_fifo_input     :  in   std_logic_vector(15  downto  0);
            Rx_fifo_mt_n      :  out  std_logic;
            Rx_fifo_full      :  out  std_logic;
            Rx_fifo_output    :  out  std_logic_vector(15  downto  0)
            );
end component;

component rx_fifo_disposer
    generic (
            C_RESET_ACTIVE    :  std_logic
            );

    port    (
            Sync_rst_n        :  in   std_logic;
            Ref_Clk           :  in   std_logic;
            Rx_10             :  in   std_logic;
            Rx_100            :  in   std_logic;
            Rmii_rx_eop       :  in   std_logic_vector(1  downto  0);
            Rmii_rx_crs       :  in   std_logic_vector(1  downto  0);
            Rmii_rx_er        :  in   std_logic_vector(1  downto  0);
            Rmii_rx_dv        :  in   std_logic_vector(1  downto  0);
            Rmii_rx_data      :  in   std_logic_vector(7  downto  0);
            Rx_fifo_mt_n      :  in   std_logic;
            Rx_fifo_rd_en     :  out  std_logic;
            Rmii2mac_crs      :  out  std_logic;
            Rmii2mac_rx_clk   :  out  std_logic;
            Rmii2mac_rx_er    :  out  std_logic;
            Rmii2mac_rx_dv    :  out  std_logic;
            Rmii2mac_rxd      :  out  std_logic_vector(3  downto  0)
            );
end component;

------------------------------------------------------------------------------
-- Constant Declarations
------------------------------------------------------------------------------
-- Note that global constants and parameters (such as RESET_ACTIVE, default
-- values for address and data --widths, initialization values, etc.) should be
-- collected into a global package or include file.
-- Constants are all uppercase.
-- Constants or parameters should be used for all numeric values except for
-- single "0" or "1" values.
-- Constants should also be used when denoting a bit location within a register.
-- If no constants are required, simply state this in a comment below the file
-- section separation comments.
------------------------------------------------------------------------------
-- No Constant Declarations

------------------------------------------------------------------------------
-- Signal and Type Declarations
------------------------------------------------------------------------------

signal  rx_fifo_wr_en     :  std_logic;
signal  rx_fifo_rd_en     :  std_logic;
signal  rx_fifo_full      :  std_logic;
signal  rx_fifo_mt_n      :  std_logic;
signal  rx_10             :  std_logic;
signal  rx_100            :  std_logic;
signal  rx_data           :  std_logic_vector(7  downto  0);
signal  rx_data_valid     :  std_logic;
signal  rx_cary_sense     :  std_logic;
signal  rx_error          :  std_logic;
signal  rx_end_of_packet  :  std_logic;
signal  rx_mii_eop        :  std_logic_vector(1  downto  0);
signal  rx_mii_crs        :  std_logic_vector(1  downto  0);
signal  rx_mii_er         :  std_logic_vector(1  downto  0);
signal  rx_mii_dv         :  std_logic_vector(1  downto  0);
signal  rx_mii_data       :  std_logic_vector(7  downto  0);

begin

------------------------------------------------------------------------------
-- Concurrent Signal Assignments
------------------------------------------------------------------------------

Rmii2Mac_crs <= rx_cary_sense;

------------------------------------------------------------------------------
-- Component Instantiations
------------------------------------------------------------------------------


I_RX_FIFO_LOADER : rx_fifo_loader
    generic map(
               C_RESET_ACTIVE      =>  C_RESET_ACTIVE
               )

    port map   (
               Sync_rst_n          =>  Sync_rst_n,
               Ref_Clk             =>  Ref_Clk,
               Phy2Rmii_crs_dv     =>  Phy2Rmii_crs_dv,
               Phy2Rmii_rx_er      =>  Phy2Rmii_rx_er,
               Phy2Rmii_rxd        =>  Phy2Rmii_rxd,
               Rx_fifo_wr_en       =>  rx_fifo_wr_en,
               Rx_10               =>  rx_10,
               Rx_100              =>  rx_100,
               Rx_data             =>  rx_data,
               Rx_error            =>  rx_error,
               Rx_data_valid       =>  rx_data_valid,
               Rx_cary_sense       =>  rx_cary_sense,
               Rx_end_of_packet    =>  rx_end_of_packet
               );

I_RX_FIFO : rx_fifo
    generic map(
               C_RESET_ACTIVE      =>  C_RESET_ACTIVE
               )

    port map   (
               Sync_rst_n          =>  Sync_rst_n,
               Ref_Clk             =>  Ref_Clk,
               Rx_fifo_wr_en       =>  rx_fifo_wr_en,
               Rx_fifo_rd_en       =>  rx_fifo_rd_en,
               Rx_fifo_input(15)   =>  rx_end_of_packet,
               Rx_fifo_input(14)   =>  rx_cary_sense,
               Rx_fifo_input(13)   =>  rx_error,
               Rx_fifo_input(12)   =>  rx_data_valid,
               Rx_fifo_input(11)   =>  rx_data(7),
               Rx_fifo_input(10)   =>  rx_data(6),
               Rx_fifo_input(9)    =>  rx_data(5),
               Rx_fifo_input(8)    =>  rx_data(4),
               Rx_fifo_input(7)    =>  rx_end_of_packet,
               Rx_fifo_input(6)    =>  rx_cary_sense,
               Rx_fifo_input(5)    =>  rx_error,
               Rx_fifo_input(4)    =>  rx_data_valid,
               Rx_fifo_input(3)    =>  rx_data(3),
               Rx_fifo_input(2)    =>  rx_data(2),
               Rx_fifo_input(1)    =>  rx_data(1),
               Rx_fifo_input(0)    =>  rx_data(0),
               Rx_fifo_mt_n        =>  rx_fifo_mt_n,
               Rx_fifo_full        =>  rx_fifo_full,
               Rx_fifo_output(15)  =>  rx_mii_eop(1),
               Rx_fifo_output(14)  =>  rx_mii_crs(1),
               Rx_fifo_output(13)  =>  rx_mii_er(1),
               Rx_fifo_output(12)  =>  rx_mii_dv(1),
               Rx_fifo_output(11)  =>  rx_mii_data(7),
               Rx_fifo_output(10)  =>  rx_mii_data(6),
               Rx_fifo_output(9)   =>  rx_mii_data(5),
               Rx_fifo_output(8)   =>  rx_mii_data(4),
               Rx_fifo_output(7)   =>  rx_mii_eop(0),
               Rx_fifo_output(6)   =>  rx_mii_crs(0),
               Rx_fifo_output(5)   =>  rx_mii_er(0),
               Rx_fifo_output(4)   =>  rx_mii_dv(0),
               Rx_fifo_output(3)   =>  rx_mii_data(3),
               Rx_fifo_output(2)   =>  rx_mii_data(2),
               Rx_fifo_output(1)   =>  rx_mii_data(1),
               Rx_fifo_output(0)   =>  rx_mii_data(0)
               );

I_RX_FIFO_DISPOSER : rx_fifo_disposer
    generic map(
               C_RESET_ACTIVE      =>  C_RESET_ACTIVE
               )

    port map   (
               Sync_rst_n          =>  Sync_rst_n,
               Ref_Clk             =>  Ref_Clk,
               Rx_10               =>  rx_10,
               Rx_100              =>  rx_100,
               Rmii_rx_eop         =>  rx_mii_eop,
               Rmii_rx_crs         =>  rx_mii_crs,
               Rmii_rx_er          =>  rx_mii_er,
               Rmii_rx_dv          =>  rx_mii_dv,
               Rmii_rx_data        =>  rx_mii_data,
               Rx_fifo_mt_n        =>  rx_fifo_mt_n,
               Rx_fifo_rd_en       =>  rx_fifo_rd_en,
            --   Rmii2mac_crs        =>  Rmii2mac_crs,
               Rmii2mac_crs        =>  open,
               Rmii2mac_rx_clk     =>  Rmii2mac_rx_clk,
               Rmii2mac_rx_er      =>  Rmii2mac_rx_er,
               Rmii2mac_rx_dv      =>  Rmii2mac_rx_dv,
               Rmii2mac_rxd        =>  Rmii2mac_rxd
               );

end simulation;


-----------------------------------------------------------------------
    -- (c) Copyright 1984 - 2012 Xilinx, Inc. All rights reserved.
    --
    -- This file contains confidential and proprietary information
    -- of Xilinx, Inc. and is protected under U.S. and
    -- international copyright and other intellectual property
    -- laws.
    --
    -- DISCLAIMER
    -- This disclaimer is not a license and does not grant any
    -- rights to the materials distributed herewith. Except as
    -- otherwise provided in a valid license issued to you by
    -- Xilinx, and to the maximum extent permitted by applicable
    -- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
    -- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
    -- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
    -- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
    -- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
    -- (2) Xilinx shall not be liable (whether in contract or tort,
    -- including negligence, or under any other theory of
    -- liability) for any loss or damage of any kind or nature
    -- related to, arising under or in connection with these
    -- materials, including for any direct, or any indirect,
    -- special, incidental, or consequential loss or damage
    -- (including loss of data, profits, goodwill, or any type of
    -- loss or damage suffered as a result of any action brought
    -- by a third party) even if such damage or loss was
    -- reasonably foreseeable or Xilinx had been advised of the
    -- possibility of the same.
    --
    -- CRITICAL APPLICATIONS
    -- Xilinx products are not designed or intended to be fail-
    -- safe, or for use in any application requiring fail-safe
    -- performance, such as life-support or safety devices or
    -- systems, Class III medical devices, nuclear facilities,
    -- applications related to the deployment of airbags, or any
    -- other applications that could lead to death, personal
    -- injury, or severe property or environmental damage
    -- (individually and collectively, "Critical
    -- Applications"). Customer assumes the sole risk and
    -- liability of any use of Xilinx products in Critical
    -- Applications, subject only to applicable laws and
    -- regulations governing limitations on product liability.
    --
    -- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
    -- PART OF THIS FILE AT ALL TIMES.
-----------------------------------------------------------------------

-- @BEGIN_CHANGELOG EDK_Im_SP1
-- Updated Release For V5 Porting
-- @END_CHANGELOG
------------------------------------------------------------------------------
-- Filename:        mii_to_rmii.vhd
--
-- Version:         v1.01.a
-- Description:     Top level of RMII(reduced media independent interface)
--
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------------
-- include library containing the entities you're configuring
------------------------------------------------------------------------------

library mii_to_rmii_v2_0_17;
use mii_to_rmii_v2_0_17.all;
library unisim;
use unisim.Vcomponents.all;

------------------------------------------------------------------------------
-- Port Declaration
------------------------------------------------------------------------------
-- Definition of Generics:
--          C_INSTANCE      -- Instance name in the system.
--          C_FIXED_SPEED   -- selects a fixed data throughput or agile RX
--                          -- side, TX side is will be fixed either way
--          C_SPEED_100     -- selects speed for TX, RX if C_FIXED_SPEED is
--                          -- selected
--
-- Definition of Ports:
--          rst_n           -- active low reset
--          ref_clk         -- clk, must be 50 MHz
--          mac2rmii_tx_en  -- active high transmit enable, valid txd
--          mac2rmii_txd    -- 4 bits of tx data from MAC
--          mac2rmii_tx_er  -- active high tx error indicator
--          rmii2mac_tx_clk -- 25 or 2.5 MHz clock to MAC
--          rmii2mac_rx_clk -- 25 or 2.5 MHz clock to MAC
--          rmii2mac_col    -- active high colision indicator
--          rmii2mac_crs    -- active high carrier sense
--          rmii2mac_rx_dv  -- active high rx data valid
--          rmii2mac_rx_er  -- acitve high rx error indicator
--          rmii2mac_rxd    -- 4 bits of rx data to MAC
--          phy2rmii_crs_dv -- active high carrier sense / data valid to rmii
--          phy2rmii_rx_er  -- active high rx error indicator
--          phy2rmii_rxd    -- 2 bits of rx data to rmii
--          rmii2phy_txd    -- 2 bits of tx data to phy
--          rmii2phy_tx_en  -- active high tx enable, valid tx to phy
--
------------------------------------------------------------------------------

entity mii_to_rmii is
    generic (
             C_INSTANCE        :  string        :=  "mii_to_rmii_inst";
             C_FIXED_SPEED     :  std_logic     :=  '1';
             C_INCLUDE_BUF     : integer range 0 to 2 := 0;--default no buffer is inserted
             C_SPEED_100       :  std_logic     :=  '1';
             C_FAMILY                        : string            := "virtex7"
            );

    port    (
             ------------------  System Signals  ----------------------
             rst_n             : in    std_logic;
             ref_clk           : in    std_logic;
             ------------------  Speed Setting  -----------------------
             --Tx_speed_100      : in    std_logic;      -- add if ever
             --Rx_speed_100      : in    std_logic;      -- auto speed
             ------------------  MAC <--> RMII  -----------------------
             mac2rmii_tx_en    : in    std_logic;
             mac2rmii_txd      : in    std_logic_vector(3  downto  0);
             mac2rmii_tx_er    : in    std_logic;
             rmii2mac_tx_clk   : out   std_logic;
             rmii2mac_rx_clk   : out   std_logic;
             rmii2mac_col      : out   std_logic;
             rmii2mac_crs      : out   std_logic;
             rmii2mac_rx_dv    : out   std_logic;
             rmii2mac_rx_er    : out   std_logic;
             rmii2mac_rxd      : out   std_logic_vector(3  downto  0);
             ------------------  RMII <--> PHY  -----------------------
             phy2rmii_crs_dv   : in    std_logic;
             phy2rmii_rx_er    : in    std_logic;
             phy2rmii_rxd      : in    std_logic_vector(1  downto  0);
             rmii2phy_txd      : out   std_logic_vector(1  downto  0);
             rmii2phy_tx_en    : out   std_logic
            );

    attribute  HDL           :    string;
    attribute  IMP_NETLIST   :    string;
    attribute  IPTYPE        :    string;
    attribute  IP_GROUP      :    string;
    attribute  SIGIS         :    string;
    attribute  STYLE         :    string;
    attribute  XRANGE        :    string;
    attribute  HDL           of   mii_to_rmii:entity     is  "VHDL";
    attribute  IMP_NETLIST   of   mii_to_rmii:entity     is  "TRUE";
    attribute  IPTYPE        of   mii_to_rmii:entity     is  "IP";
    attribute  IP_GROUP      of   mii_to_rmii:entity     is  "LOGICORE";
    attribute  SIGIS         of   ref_clk:signal         is  "CLK";
   -- attribute  SIGIS         of   rmii2mac_tx_clk:signal is  "CLK";
   -- attribute  SIGIS         of   rmii2mac_rx_clk:signal is  "CLK";
    attribute  SIGIS         of   rst_n:signal           is  "RST";
    attribute  STYLE         of   mii_to_rmii:entity     is  "HDL";
    attribute  XRANGE        of   C_FIXED_SPEED:constant is  "('0':'1')";
    attribute  XRANGE        of   C_SPEED_100:constant   is  "('0':'1')";

end mii_to_rmii;

------------------------------------------------------------------------------
-- Configurations
------------------------------------------------------------------------------

-- No Configurations

------------------------------------------------------------------------------
-- Architecture
------------------------------------------------------------------------------

architecture simulation of mii_to_rmii is

attribute DowngradeIPIdentifiedWarnings: string;

attribute DowngradeIPIdentifiedWarnings of simulation : architecture is "yes";

function chr(sl: std_logic) return character is
    variable c: character;
    begin
      case sl is
         when 'U' => c:= 'U';
         when 'X' => c:= 'X';
         when '0' => c:= '0';
         when '1' => c:= '1';
         when 'Z' => c:= 'Z';
         when 'W' => c:= 'W';
         when 'L' => c:= 'L';
         when 'H' => c:= 'H';
         when '-' => c:= '-';
      end case;
    return c;
   end chr;


function str(sl: std_logic) return string is
    variable s: string(1 to 1);
    begin
        s(1) := chr(sl);
        return s;
   end str;



  constant C_CORE_GENERATION_INFO : string := C_INSTANCE & ",mii_to_rmii,{" 
                & "c_instance = "     & C_INSTANCE 
                & ",c_fixed_speed = " & str(C_FIXED_SPEED) 
		& ",c_speed_100 = "   & str(C_SPEED_100)
		& "}";

  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of simulation : architecture is C_CORE_GENERATION_INFO;

  component BUFG
     port (
        O  : out std_ulogic;
        I : in std_ulogic := '0'
     );
  end component;

  component BUFH
     port (
        O  : out std_ulogic;
        I : in std_ulogic := '0'
     );
  end component;  
------------------------------------------------------------------------------
-- Constant Declarations
------------------------------------------------------------------------------

constant  RESET_ACTIVE      :  std_logic    := '0';

------------------------------------------------------------------------------
-- Signal and Type Declarations
------------------------------------------------------------------------------

signal  tx_speed_100_i      :   std_logic;
signal  rx_speed_100_i      :   std_logic;
signal  sync_rst_n          :   std_logic;
signal  rst_n_d             :   std_logic_vector(1   downto   0);
signal  mac2Rmii_tx_en_d2   :   std_logic;
signal  mac2Rmii_tx_en_d1   :   std_logic;
signal  mac2Rmii_txd_d2     :   std_logic_vector(3   downto   0);
signal  mac2Rmii_txd_d1     :   std_logic_vector(3   downto   0);
signal  mac2Rmii_tx_er_d2   :   std_logic;
signal  mac2Rmii_tx_er_d1   :   std_logic;
signal  rmii2Mac_tx_clk_i   :   std_logic;
signal  rmii2Mac_rx_clk_i   :   std_logic;
signal  rmii2mac_rx_clk_bi   :   std_logic;
signal  rmii2mac_tx_clk_bi   :   std_logic;
signal  rmii2Mac_crs_i      :   std_logic;
signal  rmii2Mac_rx_dv_i    :   std_logic;
signal  rmii2Mac_rx_er_i    :   std_logic;
signal  rmii2Mac_rxd_i      :   std_logic_vector(3  downto  0);
signal  phy2Rmii_crs_dv_d2  :   std_logic;
signal  phy2Rmii_crs_dv_d1  :   std_logic;
signal  phy2Rmii_rx_er_d2   :   std_logic;
signal  phy2Rmii_rx_er_d1   :   std_logic;
signal  phy2Rmii_rxd_d2     :   std_logic_vector(1  downto  0);
signal  phy2Rmii_rxd_d1     :   std_logic_vector(1  downto  0);
signal  rmii2Phy_txd_i      :   std_logic_vector(1  downto  0);
signal  rmii2Phy_tx_en_i    :   std_logic;

begin

------------------------------------------------------------------------------
-- SYNC_RST_N_PROCESS
------------------------------------------------------------------------------

SYNC_RST_N_PROCESS : process (
                             ref_clk,
                             rst_n,
                             rst_n_d
                             )
begin
    sync_rst_n  <=  rst_n_d(1);
    if (ref_clk'event and ref_clk = '1') then
        rst_n_d  <=  rst_n_d(0)  &  rst_n;
    end if;
end process;

------------------------------------------------------------------------------
-- INPUT_PIPELINE_PROCESS
------------------------------------------------------------------------------

INPUT_PIPELINE_PROCESS : process ( ref_clk )
begin
    if (ref_clk'event and ref_clk = '1') then
        if ( sync_rst_n =  '0' ) then
            mac2Rmii_tx_en_d2  <=  '0';
            mac2Rmii_tx_en_d1  <=  '0';
            mac2Rmii_txd_d2    <=  "0000";
            mac2Rmii_txd_d1    <=  "0000";
            mac2Rmii_tx_er_d2  <=  '0';
            mac2Rmii_tx_er_d1  <=  '0';
            phy2Rmii_crs_dv_d2 <=  '0';
            phy2Rmii_crs_dv_d1 <=  '0';
            phy2Rmii_rx_er_d2  <=  '0';
            phy2Rmii_rx_er_d1  <=  '0';
            phy2Rmii_rxd_d2    <=  "00";
            phy2Rmii_rxd_d1    <=  "00";
        else
            mac2Rmii_tx_en_d2  <=  mac2Rmii_tx_en_d1;
            mac2Rmii_tx_en_d1  <=  mac2rmii_tx_en;
            mac2Rmii_txd_d2    <=  mac2Rmii_txd_d1;
            mac2Rmii_txd_d1    <=  mac2rmii_txd;
            mac2Rmii_tx_er_d2  <=  mac2Rmii_tx_er_d1;
            mac2Rmii_tx_er_d1  <=  mac2rmii_tx_er;
            phy2Rmii_crs_dv_d2 <=  phy2Rmii_crs_dv_d1;
            phy2Rmii_crs_dv_d1 <=  phy2rmii_crs_dv;
            phy2Rmii_rx_er_d2  <=  phy2Rmii_rx_er_d1;
            phy2Rmii_rx_er_d1  <=  phy2rmii_rx_er;
            phy2Rmii_rxd_d2    <=  phy2Rmii_rxd_d1;
            phy2Rmii_rxd_d1    <=  phy2rmii_rxd;
        end if;
    end if;
end process;

------------------------------------------------------------------------------
-- OUTPUT_PIPELINE_PROCESS
------------------------------------------------------------------------------

OUTPUT_PIPELINE_PROCESS : process ( ref_clk )
begin
    if (ref_clk'event and ref_clk = '1') then
        if ( sync_rst_n =  '0' ) then
            rmii2mac_tx_clk_bi<=  '0';
            rmii2mac_rx_clk_bi<=  '0';
            rmii2mac_col      <=  '0';
            rmii2mac_crs      <=  '0';
            rmii2mac_rx_dv    <=  '0';
            rmii2mac_rx_er    <=  '0';
            rmii2mac_rxd      <=  "0000";
            rmii2phy_txd      <=  "00";
            rmii2phy_tx_en    <=  '0';
        else
            rmii2mac_tx_clk_bi<=  rmii2Mac_tx_clk_i;
            rmii2mac_rx_clk_bi<=  rmii2Mac_rx_clk_i;
            rmii2mac_col      <=  rmii2Mac_crs_i  and  mac2Rmii_tx_en_d2;
            rmii2mac_crs      <=  rmii2Mac_crs_i;
            rmii2mac_rx_dv    <=  rmii2Mac_rx_dv_i;
            rmii2mac_rx_er    <=  rmii2Mac_rx_er_i;
            rmii2mac_rxd      <=  rmii2Mac_rxd_i;
            rmii2phy_txd      <=  rmii2Phy_txd_i;
            rmii2phy_tx_en    <=  rmii2Phy_tx_en_i;
        end if;
    end if;
end process;

  BUFG_USED_1: if (C_INCLUDE_BUF = 1) generate
  begin
RX_CLK_BUFG: BUFG
           port map (
             O  => rmii2mac_rx_clk,  --[out]
             I  => rmii2mac_rx_clk_bi     --[in]
           );

TX_CLK_BUFG: BUFG
           port map (
             O  => rmii2mac_tx_clk,  --[out]
             I  => rmii2mac_tx_clk_bi     --[in]
           );
  end generate BUFG_USED_1;
  BUFH_USED_1: if (C_INCLUDE_BUF = 2) generate
  begin
RX_CLK_BUFH: BUFH
           port map (
             O  => rmii2mac_rx_clk,  --[out]
             I  => rmii2mac_rx_clk_bi     --[in]
           );

TX_CLK_BUFH: BUFH
           port map (
             O  => rmii2mac_tx_clk,  --[out]
             I  => rmii2mac_tx_clk_bi     --[in]
           );
  end generate BUFH_USED_1;
  NO_BUF_USED_1: if (C_INCLUDE_BUF = 0) generate
  begin
             rmii2mac_rx_clk <= rmii2mac_rx_clk_bi; 
             rmii2mac_tx_clk <= rmii2mac_tx_clk_bi;
           
  end generate NO_BUF_USED_1;


------------------------------------------------------------------------------
-- Concurrent signal assignments
------------------------------------------------------------------------------

tx_speed_100_i  <= C_SPEED_100;
rx_speed_100_i  <= C_SPEED_100;

------------------------------------------------------------------------------
--
-- Conditional Generate for AGILE speed throughput
--
------------------------------------------------------------------------------

RMII_AGILE : if (C_FIXED_SPEED = '0') generate

begin

    --------------------------------------------------------------------------
    -- Component Instatiations
    --------------------------------------------------------------------------

    I_TX : entity mii_to_rmii_v2_0_17.rmii_tx_agile(simulation)
        generic map(
                   C_RESET_ACTIVE    => RESET_ACTIVE
                   )

        port map   (
                   Tx_speed_100      => tx_speed_100_i,
                   ------------------  System Signals  -------------
                   Sync_rst_n        => sync_rst_n,           -- in
                   ref_clk           => ref_clk,              -- in
                   ------------------  MII  <-->  RMII  ------------
                   mac2rmii_tx_en    => mac2Rmii_tx_en_d2,    -- in
                   mac2rmii_txd      => mac2Rmii_txd_d2,      -- in
                   mac2rmii_tx_er    => mac2Rmii_tx_er_d2,    -- in
                   rmii2mac_tx_clk   => rmii2Mac_tx_clk_i,    -- out
                   ------------------  RMII  <-->  PHY  ------------
                   rmii2phy_txd      => rmii2Phy_txd_i,       -- out
                   rmii2phy_tx_en    => rmii2Phy_tx_en_i      -- out
                   );

    I_RX : entity mii_to_rmii_v2_0_17.rmii_rx_agile(simulation)
        generic map(
                   C_RESET_ACTIVE   => RESET_ACTIVE
                   )

        port map   (
                   Rx_speed_100      => rx_speed_100_i,
                   ------------------  System Signals  -------------
                   Sync_rst_n        => sync_rst_n,           -- in
                   ref_clk           => ref_clk,              -- in
                   ------------------  MII  <-->  RMII  ------------
                   rmii2mac_rx_clk   => rmii2Mac_rx_clk_i,    -- out
                   rmii2mac_crs      => rmii2Mac_crs_i,       -- out
                   rmii2mac_rx_dv    => rmii2Mac_rx_dv_i,     -- out
                   rmii2mac_rx_er    => rmii2Mac_rx_er_i,     -- out
                   rmii2mac_rxd      => rmii2Mac_rxd_i,       -- out
                   ------------------  RMII  <-->  PHY  ------------
                   phy2rmii_crs_dv   => phy2Rmii_crs_dv_d2,   -- in
                   phy2rmii_rx_er    => phy2Rmii_rx_er_d2,    -- in
                   phy2rmii_rxd      => phy2Rmii_rxd_d2       -- in
                   );

end generate RMII_AGILE;

------------------------------------------------------------------------------
--
-- Conditional Generate for FIXED speed throughput
--
------------------------------------------------------------------------------

RMII_FIXED : if (C_FIXED_SPEED = '1') generate

begin

    --------------------------------------------------------------------------
    -- Component Instatiations
    --------------------------------------------------------------------------

    I_TX : entity mii_to_rmii_v2_0_17.rmii_tx_fixed(simulation)
        generic map(
                   C_RESET_ACTIVE    => RESET_ACTIVE
                   )

        port map   (
                   Tx_speed_100      => tx_speed_100_i,
                   ------------------  System Signals  -------------
                   Sync_rst_n        => sync_rst_n,           -- in
                   ref_clk           => ref_clk,              -- in
                   ------------------  MII  <-->  RMII  ------------
                   mac2rmii_tx_en    => mac2Rmii_tx_en_d2,    -- in
                   mac2rmii_txd      => mac2Rmii_txd_d2,      -- in
                   mac2rmii_tx_er    => mac2Rmii_tx_er_d2,    -- in
                   rmii2mac_tx_clk   => rmii2Mac_tx_clk_i,    -- out
                   ------------------  RMII  <-->  PHY  ------------
                   rmii2phy_txd      => rmii2Phy_txd_i,       -- out
                   rmii2phy_tx_en    => rmii2Phy_tx_en_i      -- out
                   );

    I_RX : entity mii_to_rmii_v2_0_17.rmii_rx_fixed(simulation)
        generic map(
                   C_RESET_ACTIVE    => RESET_ACTIVE,
                   C_SPEED_100       => C_SPEED_100
                   )

        port map   (
                   Rx_speed_100      => rx_speed_100_i,
                   ------------------  System Signals  -------------
                   Sync_rst_n        => sync_rst_n,           -- in
                   ref_clk           => ref_clk,              -- in
                   ------------------  MII  <-->  RMII  ------------
                   rmii2mac_rx_clk   => rmii2Mac_rx_clk_i,    -- out
                   rmii2mac_crs      => rmii2Mac_crs_i,       -- out
                   rmii2mac_rx_dv    => rmii2Mac_rx_dv_i,     -- out
                   rmii2mac_rx_er    => rmii2Mac_rx_er_i,     -- out
                   rmii2mac_rxd      => rmii2Mac_rxd_i,       -- out
                   ------------------  RMII  <-->  PHY  ------------
                   phy2rmii_crs_dv   => phy2Rmii_crs_dv_d2,   -- in
                   phy2rmii_rx_er    => phy2Rmii_rx_er_d2,    -- in
                   phy2rmii_rxd      => phy2Rmii_rxd_d2       -- in
                   );

end generate RMII_FIXED;

end simulation;


