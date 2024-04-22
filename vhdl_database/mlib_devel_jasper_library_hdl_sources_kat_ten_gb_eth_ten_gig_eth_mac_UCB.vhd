--  Copyright (c) 2005-2006, Regents of the University of California
--  All rights reserved.
--
--  Redistribution and use in source and binary forms, with or without modification,
--  are permitted provided that the following conditions are met:
--
--      - Redistributions of source code must retain the above copyright notice,
--          this list of conditions and the following disclaimer.
--      - Redistributions in binary form must reproduce the above copyright
--          notice, this list of conditions and the following disclaimer
--          in the documentation and/or other materials provided with the
--          distribution.
--      - Neither the name of the University of California, Berkeley nor the
--          names of its contributors may be used to endorse or promote
--          products derived from this software without specific prior
--          written permission.
--
--  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
--  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
--  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
--  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
--  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
--  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
--  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
--  ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
--  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
--  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

--   #      ###    #####          #######
--  ##     #   #  #     #  #      #
-- # #    # #   # #        #      #
--   #    #  #  # #  ####  #####  #####
--   #    #   # # #     #  #    # #
--   #     #   #  #     #  #    # #
-- #####    ###    #####   #####  #######


-- 10GbEthernet core MAC

-- *********************************************************************
-- * THIS CORE IS INTENDED TO BE USED WITH THE UCB 10GB INTERFACE      *
-- * IT SUPPORTS ONLY A VERY LIMITED RANGE OF THE FUNCTIONALITIES      *
-- * THAT A REAL MAC SHOULD SUPPORT. FOR A FULL SUPPORT OF 10GB,       *
-- * USE THE XILINX MAC.                                               *
-- * NOT SUPPORTED:                                                    *
-- *   - no configuration                                              *
-- *   - no statistics vectors                                         *
-- *   - no CRC check on receive                                       *
-- *   - no interframe minimization                                    *
-- *   - supports only full words or 16 bits word at the input         *
-- *   - no flow control                                               *
-- *********************************************************************

-- created by Pierre-Yves Droz 2006

------------------------------------------------------------------------------
-- mac.vhd
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use std.textio.all; --  Imports the standard textio package.
use ieee.std_logic_textio.all ;

entity ten_gig_eth_mac_UCB is
	port (
		reset                : in  std_logic;
		tx_underrun          : in  std_logic;
		tx_data              : in  std_logic_vector(63 downto 0);
		tx_data_valid        : in  std_logic_vector(7 downto 0);
		tx_start             : in  std_logic;
		tx_ack               : out std_logic;
		tx_ifg_delay         : in  std_logic_vector(7 downto 0);
		tx_statistics_vector : out std_logic_vector(24 downto 0);
		tx_statistics_valid  : out std_logic;
		rx_data              : out std_logic_vector(63 downto 0);
		rx_data_valid        : out std_logic_vector(7 downto 0);
		rx_good_frame        : out std_logic;
		rx_bad_frame         : out std_logic;
		rx_statistics_vector : out std_logic_vector(28 downto 0);
		rx_statistics_valid  : out std_logic;
		pause_val            : in  std_logic_vector(15 downto 0);
		pause_req            : in  std_logic;
		configuration_vector : in  std_logic_vector(66 downto 0);
		tx_clk0              : in  std_logic;
		tx_dcm_lock          : in  std_logic;
		xgmii_txd            : out std_logic_vector(63 downto 0);
		xgmii_txc            : out std_logic_vector(7 downto 0);
		rx_clk0              : in  std_logic;
		rx_dcm_lock          : in  std_logic;
		xgmii_rxd            : in  std_logic_vector(63 downto 0);
		xgmii_rxc            : in  std_logic_vector(7 downto 0)
	);
end entity ten_gig_eth_mac_UCB;

architecture ten_gig_eth_mac_UCB_arch of ten_gig_eth_mac_UCB is

-- ######  #    #  #    #   ####    #####     #     ####   #    #   ####
-- #       #    #  ##   #  #    #     #       #    #    #  ##   #  #
-- #####   #    #  # #  #  #          #       #    #    #  # #  #   ####
-- #       #    #  #  # #  #          #       #    #    #  #  # #       #
-- #       #    #  #   ##  #    #     #       #    #    #  #   ##  #    #
-- #        ####   #    #   ####      #       #     ####   #    #   ####

-- bit reverse a signal
function bit_reverse (a: in std_logic_vector) return std_logic_vector is
	variable result: std_logic_vector(a'RANGE);
	alias    aa    : std_logic_vector(a'REVERSE_RANGE) is a;
begin
	for i in aa'RANGE loop
		result(i) := aa(i);
	end loop;
	return result;
end;

--  ####    ####   #    #   ####    #####
-- #    #  #    #  ##   #  #          #
-- #       #    #  # #  #   ####      #
-- #       #    #  #  # #       #     #
-- #    #  #    #  #   ##  #    #     #
--  ####    ####   #    #   ####      #

	type tx_fsm_state is (
			IDLE                 ,
			INTERFRAME           ,
			SEND_PREAMBLE        ,
			SEND_DATA            ,
			SEND_END_ALIGNED     ,
			SEND_END_NON_ALIGNED ,
			SEND_CORRUPTED_CRC   
		);

	type rx_fsm_state is (
			IDLE,
			WAIT_ONE,
			RECEIVE_DATA
		);


--  ####      #     ####   #    #    ##    #        ####
-- #          #    #    #  ##   #   #  #   #       #
--  ####      #    #       # #  #  #    #  #        ####
--      #     #    #  ###  #  # #  ######  #            #
-- #    #     #    #    #  #   ##  #    #  #       #    #
--  ####      #     ####   #    #  #    #  ######   ####

	-- TX controller signals
	signal tx_state                                : tx_fsm_state := IDLE;
	signal tx_start_latched                        : std_logic := '0';
	signal xgmii_tx0                               : std_logic_vector(63 downto 0);
	signal xgmii_txR                               : std_logic_vector(63 downto 0);
	signal xgmii_partR                             : std_logic_vector(15 downto 0);
	signal tx_crc                                  : std_logic_vector(31 downto 0);
	signal tx_partial_crc                          : std_logic_vector(31 downto 0);

	-- RX controller signals
	signal rx_state                                : rx_fsm_state := IDLE;
	signal xgmii_rxd0                              : std_logic_vector(63 downto 0);
	signal xgmii_rxc0                              : std_logic_vector(7 downto 0);
	signal xgmii_rxd_aligned                       : std_logic_vector(63 downto 0);
	signal xgmii_rxc_aligned                       : std_logic_vector(7 downto 0);
	signal xgmii_rxd_aligned0                      : std_logic_vector(63 downto 0);
	signal rx_data_is_aligned                      : std_logic;
	signal rx_enable                               : std_logic_vector(7 downto 0);
	signal rx_good_frame0                          : std_logic;

begin
	-- statistic vectors are not supported
	rx_statistics_vector <= (others => '0');
	rx_statistics_valid  <= '0';
	tx_statistics_vector <= (others => '0');
	tx_statistics_valid  <= '0';

	--  #####  #    # 
	--    #     #  #  
	--    #      ##   
	--    #      ##   
	--    #     #  #  
	--    #    #    # 
	fu_proc: process(tx_clk0)

  variable l : line;

  begin
		if tx_clk0'event and tx_clk0 = '1' then
      write(l,string'("data - "));
      hwrite(l,std_logic_vector'(xgmii_tx0));
      write(l,string'(" crc - "));
      hwrite(l,std_logic_vector'(not bit_reverse(tx_crc)));
      write(l,string'(" - "));
      hwrite(l,std_logic_vector'(bit_reverse(tx_crc)));
      write(l,string'(" - "));
      hwrite(l,std_logic_vector'((tx_crc)));

      writeline (output, l);
    end if;
  end process;
	
	-- Transmit state machine
	tx_proc: process(tx_clk0)
	begin
		if tx_clk0'event and tx_clk0 = '1' then
			-- register the data coming from the user
			xgmii_tx0 <= tx_data;

			-- Transmit CRC computation		
			tx_crc(0) <= 
				xgmii_txR(63) xor xgmii_txR(61) xor xgmii_txR(60) xor xgmii_txR(58) xor xgmii_txR(55) xor xgmii_txR(54) xor 
		        xgmii_txR(53) xor xgmii_txR(50) xor xgmii_txR(48) xor xgmii_txR(47) xor xgmii_txR(45) xor xgmii_txR(44) xor 
				xgmii_txR(37) xor xgmii_txR(34) xor xgmii_txR(32) xor xgmii_txR(31) xor xgmii_txR(30) xor xgmii_txR(29) xor 
				xgmii_txR(28) xor xgmii_txR(26) xor xgmii_txR(25) xor xgmii_txR(24) xor xgmii_txR(16) xor xgmii_txR(12) xor 
				xgmii_txR(10) xor xgmii_txR(9)  xor xgmii_txR(6)  xor xgmii_txR(0)  xor tx_crc(0)     xor tx_crc(2)     xor 
				tx_crc(5)     xor tx_crc(12)    xor tx_crc(13)    xor tx_crc(15)    xor tx_crc(16)    xor tx_crc(18)    xor 
				tx_crc(21)    xor tx_crc(22)    xor tx_crc(23)    xor tx_crc(26)    xor tx_crc(28)    xor tx_crc(29)    xor 
				tx_crc(31);
			tx_crc(1) <=
				xgmii_txR(63) xor xgmii_txR(62) xor xgmii_txR(60) xor xgmii_txR(59) xor xgmii_txR(58) xor xgmii_txR(56) xor 
				xgmii_txR(53) xor xgmii_txR(51) xor xgmii_txR(50) xor xgmii_txR(49) xor xgmii_txR(47) xor xgmii_txR(46) xor 
				xgmii_txR(44) xor xgmii_txR(38) xor xgmii_txR(37) xor xgmii_txR(35) xor xgmii_txR(34) xor xgmii_txR(33) xor 
				xgmii_txR(28) xor xgmii_txR(27) xor xgmii_txR(24) xor xgmii_txR(17) xor xgmii_txR(16) xor xgmii_txR(13) xor 
				xgmii_txR(12) xor xgmii_txR(11) xor xgmii_txR(9)  xor xgmii_txR(7)  xor xgmii_txR(6)  xor xgmii_txR(1)  xor 
				xgmii_txR(0)  xor tx_crc(1)     xor tx_crc(2)     xor tx_crc(3)     xor tx_crc(5)     xor tx_crc(6)     xor 
				tx_crc(12)    xor tx_crc(14)    xor tx_crc(15)    xor tx_crc(17)    xor tx_crc(18)    xor tx_crc(19)    xor 
				tx_crc(21)    xor tx_crc(24)    xor tx_crc(26)    xor tx_crc(27)    xor tx_crc(28)    xor tx_crc(30)    xor 
				tx_crc(31);
			tx_crc(2) <=
				xgmii_txR(59) xor xgmii_txR(58) xor xgmii_txR(57) xor xgmii_txR(55) xor xgmii_txR(53) xor xgmii_txR(52) xor 
				xgmii_txR(51) xor xgmii_txR(44) xor xgmii_txR(39) xor xgmii_txR(38) xor xgmii_txR(37) xor xgmii_txR(36) xor 
				xgmii_txR(35) xor xgmii_txR(32) xor xgmii_txR(31) xor xgmii_txR(30) xor xgmii_txR(26) xor xgmii_txR(24) xor 
				xgmii_txR(18) xor xgmii_txR(17) xor xgmii_txR(16) xor xgmii_txR(14) xor xgmii_txR(13) xor xgmii_txR(9)  xor 
				xgmii_txR(8)  xor xgmii_txR(7)  xor xgmii_txR(6)  xor xgmii_txR(2)  xor xgmii_txR(1)  xor xgmii_txR(0)  xor 
				tx_crc(0)     xor tx_crc(3)     xor tx_crc(4)     xor tx_crc(5)     xor tx_crc(6)     xor tx_crc(7)     xor 
				tx_crc(12)    xor tx_crc(19)    xor tx_crc(20)    xor tx_crc(21)    xor tx_crc(23)    xor tx_crc(25)    xor 
				tx_crc(26)    xor tx_crc(27);
			tx_crc(3) <=
				xgmii_txR(60) xor xgmii_txR(59) xor xgmii_txR(58) xor xgmii_txR(56) xor xgmii_txR(54) xor xgmii_txR(53) xor 
				xgmii_txR(52) xor xgmii_txR(45) xor xgmii_txR(40) xor xgmii_txR(39) xor xgmii_txR(38) xor xgmii_txR(37) xor 
				xgmii_txR(36) xor xgmii_txR(33) xor xgmii_txR(32) xor xgmii_txR(31) xor xgmii_txR(27) xor xgmii_txR(25) xor 
				xgmii_txR(19) xor xgmii_txR(18) xor xgmii_txR(17) xor xgmii_txR(15) xor xgmii_txR(14) xor xgmii_txR(10) xor 
				xgmii_txR(9)  xor xgmii_txR(8)  xor xgmii_txR(7)  xor xgmii_txR(3)  xor xgmii_txR(2)  xor xgmii_txR(1)  xor 
				tx_crc(0)     xor tx_crc(1)     xor tx_crc(4)     xor tx_crc(5)     xor tx_crc(6)     xor tx_crc(7)     xor 
				tx_crc(8)     xor tx_crc(13)    xor tx_crc(20)    xor tx_crc(21)    xor tx_crc(22)    xor tx_crc(24)    xor 
				tx_crc(26)    xor tx_crc(27)    xor tx_crc(28);
			tx_crc(4) <=
				xgmii_txR(63) xor xgmii_txR(59) xor xgmii_txR(58) xor xgmii_txR(57) xor xgmii_txR(50) xor xgmii_txR(48) xor 
				xgmii_txR(47) xor xgmii_txR(46) xor xgmii_txR(45) xor xgmii_txR(44) xor xgmii_txR(41) xor xgmii_txR(40) xor 
				xgmii_txR(39) xor xgmii_txR(38) xor xgmii_txR(33) xor xgmii_txR(31) xor xgmii_txR(30) xor xgmii_txR(29) xor 
				xgmii_txR(25) xor xgmii_txR(24) xor xgmii_txR(20) xor xgmii_txR(19) xor xgmii_txR(18) xor xgmii_txR(15) xor 
				xgmii_txR(12) xor xgmii_txR(11) xor xgmii_txR(8)  xor xgmii_txR(6)  xor xgmii_txR(4)  xor xgmii_txR(3)  xor 
				xgmii_txR(2)  xor xgmii_txR(0)  xor tx_crc(1)     xor tx_crc(6)     xor tx_crc(7)     xor tx_crc(8)     xor 
				tx_crc(9)     xor tx_crc(12)    xor tx_crc(13)    xor tx_crc(14)    xor tx_crc(15)    xor tx_crc(16)    xor 
				tx_crc(18)    xor tx_crc(25)    xor tx_crc(26)    xor tx_crc(27)    xor tx_crc(31);
			tx_crc(5) <=
				xgmii_txR(63) xor xgmii_txR(61) xor xgmii_txR(59) xor xgmii_txR(55) xor xgmii_txR(54) xor xgmii_txR(53) xor 
				xgmii_txR(51) xor xgmii_txR(50) xor xgmii_txR(49) xor xgmii_txR(46) xor xgmii_txR(44) xor xgmii_txR(42) xor 
				xgmii_txR(41) xor xgmii_txR(40) xor xgmii_txR(39) xor xgmii_txR(37) xor xgmii_txR(29) xor xgmii_txR(28) xor 
				xgmii_txR(24) xor xgmii_txR(21) xor xgmii_txR(20) xor xgmii_txR(19) xor xgmii_txR(13) xor xgmii_txR(10) xor 
				xgmii_txR(7)  xor xgmii_txR(6)  xor xgmii_txR(5)  xor xgmii_txR(4)  xor xgmii_txR(3)  xor xgmii_txR(1)  xor 
				xgmii_txR(0)  xor tx_crc(5)     xor tx_crc(7)     xor tx_crc(8)     xor tx_crc(9)     xor tx_crc(10)    xor 
				tx_crc(12)    xor tx_crc(14)    xor tx_crc(17)    xor tx_crc(18)    xor tx_crc(19)    xor tx_crc(21)    xor 
				tx_crc(22)    xor tx_crc(23)    xor tx_crc(27)    xor tx_crc(29)    xor tx_crc(31);
			tx_crc(6) <= 
				xgmii_txR(62) xor xgmii_txR(60) xor xgmii_txR(56) xor xgmii_txR(55) xor xgmii_txR(54) xor xgmii_txR(52) xor 
				xgmii_txR(51) xor xgmii_txR(50) xor xgmii_txR(47) xor xgmii_txR(45) xor xgmii_txR(43) xor xgmii_txR(42) xor 
				xgmii_txR(41) xor xgmii_txR(40) xor xgmii_txR(38) xor xgmii_txR(30) xor xgmii_txR(29) xor xgmii_txR(25) xor 
				xgmii_txR(22) xor xgmii_txR(21) xor xgmii_txR(20) xor xgmii_txR(14) xor xgmii_txR(11) xor xgmii_txR(8)  xor 
				xgmii_txR(7)  xor xgmii_txR(6)  xor xgmii_txR(5)  xor xgmii_txR(4)  xor xgmii_txR(2)  xor xgmii_txR(1)  xor 
				tx_crc(6)     xor tx_crc(8)     xor tx_crc(9)     xor tx_crc(10)    xor tx_crc(11)    xor tx_crc(13)    xor 
				tx_crc(15)    xor tx_crc(18)    xor tx_crc(19)    xor tx_crc(20)    xor tx_crc(22)    xor tx_crc(23)    xor 
				tx_crc(24)    xor tx_crc(28)    xor tx_crc(30);
			tx_crc(7) <=
				xgmii_txR(60) xor xgmii_txR(58) xor xgmii_txR(57) xor xgmii_txR(56) xor xgmii_txR(54) xor xgmii_txR(52) xor 
				xgmii_txR(51) xor xgmii_txR(50) xor xgmii_txR(47) xor xgmii_txR(46) xor xgmii_txR(45) xor xgmii_txR(43) xor 
				xgmii_txR(42) xor xgmii_txR(41) xor xgmii_txR(39) xor xgmii_txR(37) xor xgmii_txR(34) xor xgmii_txR(32) xor 
				xgmii_txR(29) xor xgmii_txR(28) xor xgmii_txR(25) xor xgmii_txR(24) xor xgmii_txR(23) xor xgmii_txR(22) xor 
				xgmii_txR(21) xor xgmii_txR(16) xor xgmii_txR(15) xor xgmii_txR(10) xor xgmii_txR(8)  xor xgmii_txR(7)  xor 
				xgmii_txR(5)  xor xgmii_txR(3)  xor xgmii_txR(2)  xor xgmii_txR(0)  xor tx_crc(0)     xor tx_crc(2)     xor 
				tx_crc(5)     xor tx_crc(7)     xor tx_crc(9)     xor tx_crc(10)    xor tx_crc(11)    xor tx_crc(13)    xor 
				tx_crc(14)    xor tx_crc(15)    xor tx_crc(18)    xor tx_crc(19)    xor tx_crc(20)    xor tx_crc(22)    xor 
				tx_crc(24)    xor tx_crc(25)    xor tx_crc(26)    xor tx_crc(28);
			tx_crc(8) <=
				xgmii_txR(63) xor xgmii_txR(60) xor xgmii_txR(59) xor xgmii_txR(57) xor xgmii_txR(54) xor xgmii_txR(52) xor 
				xgmii_txR(51) xor xgmii_txR(50) xor xgmii_txR(46) xor xgmii_txR(45) xor xgmii_txR(43) xor xgmii_txR(42) xor 
				xgmii_txR(40) xor xgmii_txR(38) xor xgmii_txR(37) xor xgmii_txR(35) xor xgmii_txR(34) xor xgmii_txR(33) xor 
				xgmii_txR(32) xor xgmii_txR(31) xor xgmii_txR(28) xor xgmii_txR(23) xor xgmii_txR(22) xor xgmii_txR(17) xor 
				xgmii_txR(12) xor xgmii_txR(11) xor xgmii_txR(10) xor xgmii_txR(8)  xor xgmii_txR(4)  xor xgmii_txR(3)  xor 
				xgmii_txR(1)  xor xgmii_txR(0)  xor tx_crc(0)     xor tx_crc(1)     xor tx_crc(2)     xor tx_crc(3)     xor 
				tx_crc(5)     xor tx_crc(6)     xor tx_crc(8)     xor tx_crc(10)    xor tx_crc(11)    xor tx_crc(13)    xor 
				tx_crc(14)    xor tx_crc(18)    xor tx_crc(19)    xor tx_crc(20)    xor tx_crc(22)    xor tx_crc(25)    xor 
				tx_crc(27)    xor tx_crc(28)    xor tx_crc(31);
			tx_crc(9) <=
				xgmii_txR(61) xor xgmii_txR(60) xor xgmii_txR(58) xor xgmii_txR(55) xor xgmii_txR(53) xor xgmii_txR(52) xor 
				xgmii_txR(51) xor xgmii_txR(47) xor xgmii_txR(46) xor xgmii_txR(44) xor xgmii_txR(43) xor xgmii_txR(41) xor 
				xgmii_txR(39) xor xgmii_txR(38) xor xgmii_txR(36) xor xgmii_txR(35) xor xgmii_txR(34) xor xgmii_txR(33) xor 
				xgmii_txR(32) xor xgmii_txR(29) xor xgmii_txR(24) xor xgmii_txR(23) xor xgmii_txR(18) xor xgmii_txR(13) xor 
				xgmii_txR(12) xor xgmii_txR(11) xor xgmii_txR(9)  xor xgmii_txR(5)  xor xgmii_txR(4)  xor xgmii_txR(2)  xor 
				xgmii_txR(1)  xor tx_crc(0)     xor tx_crc(1)     xor tx_crc(2)     xor tx_crc(3)     xor tx_crc(4)     xor 
				tx_crc(6)     xor tx_crc(7)     xor tx_crc(9)     xor tx_crc(11)    xor tx_crc(12)    xor tx_crc(14)    xor 
				tx_crc(15)    xor tx_crc(19)    xor tx_crc(20)    xor tx_crc(21)    xor tx_crc(23)    xor tx_crc(26)    xor 
				tx_crc(28)    xor tx_crc(29);
			tx_crc(10) <=
				xgmii_txR(63) xor xgmii_txR(62) xor xgmii_txR(60) xor xgmii_txR(59) xor xgmii_txR(58) xor xgmii_txR(56) xor 
				xgmii_txR(55) xor xgmii_txR(52) xor xgmii_txR(50) xor xgmii_txR(42) xor xgmii_txR(40) xor xgmii_txR(39) xor 
				xgmii_txR(36) xor xgmii_txR(35) xor xgmii_txR(33) xor xgmii_txR(32) xor xgmii_txR(31) xor xgmii_txR(29) xor 
				xgmii_txR(28) xor xgmii_txR(26) xor xgmii_txR(19) xor xgmii_txR(16) xor xgmii_txR(14) xor xgmii_txR(13) xor 
				xgmii_txR(9)  xor xgmii_txR(5)  xor xgmii_txR(3)  xor xgmii_txR(2)  xor xgmii_txR(0)  xor tx_crc(0)     xor 
				tx_crc(1)     xor tx_crc(3)     xor tx_crc(4)     xor tx_crc(7)     xor tx_crc(8)     xor tx_crc(10)    xor 
				tx_crc(18)    xor tx_crc(20)    xor tx_crc(23)    xor tx_crc(24)    xor tx_crc(26)    xor tx_crc(27)    xor 
				tx_crc(28)    xor tx_crc(30)    xor tx_crc(31);
		    tx_crc(11) <=
		    	xgmii_txR(59) xor xgmii_txR(58) xor xgmii_txR(57) xor xgmii_txR(56) xor xgmii_txR(55) xor xgmii_txR(54) xor 
				xgmii_txR(51) xor xgmii_txR(50) xor xgmii_txR(48) xor xgmii_txR(47) xor xgmii_txR(45) xor xgmii_txR(44) xor 
				xgmii_txR(43) xor xgmii_txR(41) xor xgmii_txR(40) xor xgmii_txR(36) xor xgmii_txR(33) xor xgmii_txR(31) xor 
				xgmii_txR(28) xor xgmii_txR(27) xor xgmii_txR(26) xor xgmii_txR(25) xor xgmii_txR(24) xor xgmii_txR(20) xor 
				xgmii_txR(17) xor xgmii_txR(16) xor xgmii_txR(15) xor xgmii_txR(14) xor xgmii_txR(12) xor xgmii_txR(9)  xor 
				xgmii_txR(4)  xor xgmii_txR(3)  xor xgmii_txR(1)  xor xgmii_txR(0)  xor tx_crc(1)     xor tx_crc(4)     xor 
				tx_crc(8)     xor tx_crc(9)     xor tx_crc(11)    xor tx_crc(12)    xor tx_crc(13)    xor tx_crc(15)    xor 
				tx_crc(16)    xor tx_crc(18)    xor tx_crc(19)    xor tx_crc(22)    xor tx_crc(23)    xor tx_crc(24)    xor 
				tx_crc(25)    xor tx_crc(26)    xor tx_crc(27);
			tx_crc(12) <=
				xgmii_txR(63) xor xgmii_txR(61) xor xgmii_txR(59) xor xgmii_txR(57) xor xgmii_txR(56) xor xgmii_txR(54) xor 
				xgmii_txR(53) xor xgmii_txR(52) xor xgmii_txR(51) xor xgmii_txR(50) xor xgmii_txR(49) xor xgmii_txR(47) xor 
				xgmii_txR(46) xor xgmii_txR(42) xor xgmii_txR(41) xor xgmii_txR(31) xor xgmii_txR(30) xor xgmii_txR(27) xor 
				xgmii_txR(24) xor xgmii_txR(21) xor xgmii_txR(18) xor xgmii_txR(17) xor xgmii_txR(15) xor xgmii_txR(13) xor 
				xgmii_txR(12) xor xgmii_txR(9)  xor xgmii_txR(6)  xor xgmii_txR(5)  xor xgmii_txR(4)  xor xgmii_txR(2)  xor 
				xgmii_txR(1)  xor xgmii_txR(0)  xor tx_crc(9)     xor tx_crc(10)    xor tx_crc(14)    xor tx_crc(15)    xor 
				tx_crc(17)    xor tx_crc(18)    xor tx_crc(19)    xor tx_crc(20)    xor tx_crc(21)    xor tx_crc(22)    xor 
				tx_crc(24)    xor tx_crc(25)    xor tx_crc(27)    xor tx_crc(29)    xor tx_crc(31);
			tx_crc(13) <=
				xgmii_txR(62) xor xgmii_txR(60) xor xgmii_txR(58) xor xgmii_txR(57) xor xgmii_txR(55) xor xgmii_txR(54) xor 
				xgmii_txR(53) xor xgmii_txR(52) xor xgmii_txR(51) xor xgmii_txR(50) xor xgmii_txR(48) xor xgmii_txR(47) xor 
				xgmii_txR(43) xor xgmii_txR(42) xor xgmii_txR(32) xor xgmii_txR(31) xor xgmii_txR(28) xor xgmii_txR(25) xor 
				xgmii_txR(22) xor xgmii_txR(19) xor xgmii_txR(18) xor xgmii_txR(16) xor xgmii_txR(14) xor xgmii_txR(13) xor 
				xgmii_txR(10) xor xgmii_txR(7)  xor xgmii_txR(6)  xor xgmii_txR(5)  xor xgmii_txR(3)  xor xgmii_txR(2)  xor 
				xgmii_txR(1)  xor tx_crc(0)     xor tx_crc(10)    xor tx_crc(11)    xor tx_crc(15)    xor tx_crc(16)    xor 
				tx_crc(18)    xor tx_crc(19)    xor tx_crc(20)    xor tx_crc(21)    xor tx_crc(22)    xor tx_crc(23)    xor 
				tx_crc(25)    xor tx_crc(26)    xor tx_crc(28)    xor tx_crc(30);
			tx_crc(14) <=
				xgmii_txR(63) xor xgmii_txR(61) xor xgmii_txR(59) xor xgmii_txR(58) xor xgmii_txR(56) xor xgmii_txR(55) xor 
				xgmii_txR(54) xor xgmii_txR(53) xor xgmii_txR(52) xor xgmii_txR(51) xor xgmii_txR(49) xor xgmii_txR(48) xor 
				xgmii_txR(44) xor xgmii_txR(43) xor xgmii_txR(33) xor xgmii_txR(32) xor xgmii_txR(29) xor xgmii_txR(26) xor 
				xgmii_txR(23) xor xgmii_txR(20) xor xgmii_txR(19) xor xgmii_txR(17) xor xgmii_txR(15) xor xgmii_txR(14) xor 
				xgmii_txR(11) xor xgmii_txR(8)  xor xgmii_txR(7)  xor xgmii_txR(6)  xor xgmii_txR(4)  xor xgmii_txR(3)  xor 
				xgmii_txR(2)  xor tx_crc(0)     xor tx_crc(1)     xor tx_crc(11)    xor tx_crc(12)    xor tx_crc(16)    xor 
				tx_crc(17)    xor tx_crc(19)    xor tx_crc(20)    xor tx_crc(21)    xor tx_crc(22)    xor tx_crc(23)    xor 
				tx_crc(24)    xor tx_crc(26)    xor tx_crc(27)    xor tx_crc(29)    xor tx_crc(31);
			tx_crc(15) <=
				xgmii_txR(62) xor xgmii_txR(60) xor xgmii_txR(59) xor xgmii_txR(57) xor xgmii_txR(56) xor xgmii_txR(55) xor 
				xgmii_txR(54) xor xgmii_txR(53) xor xgmii_txR(52) xor xgmii_txR(50) xor xgmii_txR(49) xor xgmii_txR(45) xor 
				xgmii_txR(44) xor xgmii_txR(34) xor xgmii_txR(33) xor xgmii_txR(30) xor xgmii_txR(27) xor xgmii_txR(24) xor 
				xgmii_txR(21) xor xgmii_txR(20) xor xgmii_txR(18) xor xgmii_txR(16) xor xgmii_txR(15) xor xgmii_txR(12) xor 
				xgmii_txR(9)  xor xgmii_txR(8)  xor xgmii_txR(7)  xor xgmii_txR(5)  xor xgmii_txR(4)  xor xgmii_txR(3)  xor 
				tx_crc(1)     xor tx_crc(2)     xor tx_crc(12)    xor tx_crc(13)    xor tx_crc(17)    xor tx_crc(18)    xor 
				tx_crc(20)    xor tx_crc(21)    xor tx_crc(22)    xor tx_crc(23)    xor tx_crc(24)    xor tx_crc(25)    xor 
				tx_crc(27)    xor tx_crc(28)    xor tx_crc(30);
			tx_crc(16) <=
				xgmii_txR(57) xor xgmii_txR(56) xor xgmii_txR(51) xor xgmii_txR(48) xor xgmii_txR(47) xor xgmii_txR(46) xor 
				xgmii_txR(44) xor xgmii_txR(37) xor xgmii_txR(35) xor xgmii_txR(32) xor xgmii_txR(30) xor xgmii_txR(29) xor 
				xgmii_txR(26) xor xgmii_txR(24) xor xgmii_txR(22) xor xgmii_txR(21) xor xgmii_txR(19) xor xgmii_txR(17) xor 
				xgmii_txR(13) xor xgmii_txR(12) xor xgmii_txR(8)  xor xgmii_txR(5)  xor xgmii_txR(4)  xor xgmii_txR(0)  xor 
				tx_crc(0)     xor tx_crc(3)     xor tx_crc(5)     xor tx_crc(12)    xor tx_crc(14)    xor tx_crc(15)    xor 
				tx_crc(16)    xor tx_crc(19)    xor tx_crc(24)    xor tx_crc(25);
			tx_crc(17) <=
				xgmii_txR(58) xor xgmii_txR(57) xor xgmii_txR(52) xor xgmii_txR(49) xor xgmii_txR(48) xor xgmii_txR(47) xor 
				xgmii_txR(45) xor xgmii_txR(38) xor xgmii_txR(36) xor xgmii_txR(33) xor xgmii_txR(31) xor xgmii_txR(30) xor 
				xgmii_txR(27) xor xgmii_txR(25) xor xgmii_txR(23) xor xgmii_txR(22) xor xgmii_txR(20) xor xgmii_txR(18) xor 
				xgmii_txR(14) xor xgmii_txR(13) xor xgmii_txR(9)  xor xgmii_txR(6)  xor xgmii_txR(5)  xor xgmii_txR(1)  xor 
				tx_crc(1)     xor tx_crc(4)     xor tx_crc(6)     xor tx_crc(13)    xor tx_crc(15)    xor tx_crc(16)    xor 
				tx_crc(17)    xor tx_crc(20)    xor tx_crc(25)    xor tx_crc(26);
			tx_crc(18) <=
				xgmii_txR(59) xor xgmii_txR(58) xor xgmii_txR(53) xor xgmii_txR(50) xor xgmii_txR(49) xor xgmii_txR(48) xor 
				xgmii_txR(46) xor xgmii_txR(39) xor xgmii_txR(37) xor xgmii_txR(34) xor xgmii_txR(32) xor xgmii_txR(31) xor 
				xgmii_txR(28) xor xgmii_txR(26) xor xgmii_txR(24) xor xgmii_txR(23) xor xgmii_txR(21) xor xgmii_txR(19) xor 
				xgmii_txR(15) xor xgmii_txR(14) xor xgmii_txR(10) xor xgmii_txR(7)  xor xgmii_txR(6)  xor xgmii_txR(2)  xor 
				tx_crc(0)     xor tx_crc(2)     xor tx_crc(5)     xor tx_crc(7)     xor tx_crc(14)    xor tx_crc(16)    xor 
				tx_crc(17)    xor tx_crc(18)    xor tx_crc(21)    xor tx_crc(26)    xor tx_crc(27);
			tx_crc(19) <=
				xgmii_txR(60) xor xgmii_txR(59) xor xgmii_txR(54) xor xgmii_txR(51) xor xgmii_txR(50) xor xgmii_txR(49) xor 
				xgmii_txR(47) xor xgmii_txR(40) xor xgmii_txR(38) xor xgmii_txR(35) xor xgmii_txR(33) xor xgmii_txR(32) xor 
				xgmii_txR(29) xor xgmii_txR(27) xor xgmii_txR(25) xor xgmii_txR(24) xor xgmii_txR(22) xor xgmii_txR(20) xor 
				xgmii_txR(16) xor xgmii_txR(15) xor xgmii_txR(11) xor xgmii_txR(8)  xor xgmii_txR(7)  xor xgmii_txR(3)  xor 
				tx_crc(0)     xor tx_crc(1)     xor tx_crc(3)     xor tx_crc(6)     xor tx_crc(8)     xor tx_crc(15)    xor 
				tx_crc(17)    xor tx_crc(18)    xor tx_crc(19)    xor tx_crc(22)    xor tx_crc(27)    xor tx_crc(28);
			tx_crc(20) <=
				xgmii_txR(61) xor xgmii_txR(60) xor xgmii_txR(55) xor xgmii_txR(52) xor xgmii_txR(51) xor xgmii_txR(50) xor 
				xgmii_txR(48) xor xgmii_txR(41) xor xgmii_txR(39) xor xgmii_txR(36) xor xgmii_txR(34) xor xgmii_txR(33) xor 
				xgmii_txR(30) xor xgmii_txR(28) xor xgmii_txR(26) xor xgmii_txR(25) xor xgmii_txR(23) xor xgmii_txR(21) xor 
				xgmii_txR(17) xor xgmii_txR(16) xor xgmii_txR(12) xor xgmii_txR(9)  xor xgmii_txR(8)  xor xgmii_txR(4)  xor 
				tx_crc(1)     xor tx_crc(2)     xor tx_crc(4)     xor tx_crc(7)     xor tx_crc(9)     xor tx_crc(16)    xor 
				tx_crc(18)    xor tx_crc(19)    xor tx_crc(20)    xor tx_crc(23)    xor tx_crc(28)    xor tx_crc(29);
			tx_crc(21) <=
				xgmii_txR(62) xor xgmii_txR(61) xor xgmii_txR(56) xor xgmii_txR(53) xor xgmii_txR(52) xor xgmii_txR(51) xor 
				xgmii_txR(49) xor xgmii_txR(42) xor xgmii_txR(40) xor xgmii_txR(37) xor xgmii_txR(35) xor xgmii_txR(34) xor 
				xgmii_txR(31) xor xgmii_txR(29) xor xgmii_txR(27) xor xgmii_txR(26) xor xgmii_txR(24) xor xgmii_txR(22) xor 
				xgmii_txR(18) xor xgmii_txR(17) xor xgmii_txR(13) xor xgmii_txR(10) xor xgmii_txR(9)  xor xgmii_txR(5)  xor 
				tx_crc(2)     xor tx_crc(3)     xor tx_crc(5)     xor tx_crc(8)     xor tx_crc(10)    xor tx_crc(17)    xor 
				tx_crc(19)    xor tx_crc(20)    xor tx_crc(21)    xor tx_crc(24)    xor tx_crc(29)    xor tx_crc(30);
			tx_crc(22) <=
				xgmii_txR(62) xor xgmii_txR(61) xor xgmii_txR(60) xor xgmii_txR(58) xor xgmii_txR(57) xor xgmii_txR(55) xor 
				xgmii_txR(52) xor xgmii_txR(48) xor xgmii_txR(47) xor xgmii_txR(45) xor xgmii_txR(44) xor xgmii_txR(43) xor 
				xgmii_txR(41) xor xgmii_txR(38) xor xgmii_txR(37) xor xgmii_txR(36) xor xgmii_txR(35) xor xgmii_txR(34) xor 
				xgmii_txR(31) xor xgmii_txR(29) xor xgmii_txR(27) xor xgmii_txR(26) xor xgmii_txR(24) xor xgmii_txR(23) xor 
				xgmii_txR(19) xor xgmii_txR(18) xor xgmii_txR(16) xor xgmii_txR(14) xor xgmii_txR(12) xor xgmii_txR(11) xor 
				xgmii_txR(9)  xor xgmii_txR(0)  xor tx_crc(2)     xor tx_crc(3)     xor tx_crc(4)     xor tx_crc(5)     xor 
				tx_crc(6)     xor tx_crc(9)     xor tx_crc(11)    xor tx_crc(12)    xor tx_crc(13)    xor tx_crc(15)    xor 
				tx_crc(16)    xor tx_crc(20)    xor tx_crc(23)    xor tx_crc(25)    xor tx_crc(26)    xor tx_crc(28)    xor 
				tx_crc(29)    xor tx_crc(30);
			tx_crc(23) <=
				xgmii_txR(62) xor xgmii_txR(60) xor xgmii_txR(59) xor xgmii_txR(56) xor xgmii_txR(55) xor xgmii_txR(54) xor 
				xgmii_txR(50) xor xgmii_txR(49) xor xgmii_txR(47) xor xgmii_txR(46) xor xgmii_txR(42) xor xgmii_txR(39) xor 
				xgmii_txR(38) xor xgmii_txR(36) xor xgmii_txR(35) xor xgmii_txR(34) xor xgmii_txR(31) xor xgmii_txR(29) xor 
				xgmii_txR(27) xor xgmii_txR(26) xor xgmii_txR(20) xor xgmii_txR(19) xor xgmii_txR(17) xor xgmii_txR(16) xor 
				xgmii_txR(15) xor xgmii_txR(13) xor xgmii_txR(9)  xor xgmii_txR(6)  xor xgmii_txR(1)  xor xgmii_txR(0)  xor 
				tx_crc(2)     xor tx_crc(3)     xor tx_crc(4)     xor tx_crc(6)     xor tx_crc(7)     xor tx_crc(10)    xor 
				tx_crc(14)    xor tx_crc(15)    xor tx_crc(17)    xor tx_crc(18)    xor tx_crc(22)    xor tx_crc(23)    xor 
				tx_crc(24)    xor tx_crc(27)    xor tx_crc(28)    xor tx_crc(30);
			tx_crc(24) <=
				xgmii_txR(63) xor xgmii_txR(61) xor xgmii_txR(60) xor xgmii_txR(57) xor xgmii_txR(56) xor xgmii_txR(55) xor 
				xgmii_txR(51) xor xgmii_txR(50) xor xgmii_txR(48) xor xgmii_txR(47) xor xgmii_txR(43) xor xgmii_txR(40) xor 
				xgmii_txR(39) xor xgmii_txR(37) xor xgmii_txR(36) xor xgmii_txR(35) xor xgmii_txR(32) xor xgmii_txR(30) xor 
				xgmii_txR(28) xor xgmii_txR(27) xor xgmii_txR(21) xor xgmii_txR(20) xor xgmii_txR(18) xor xgmii_txR(17) xor 
				xgmii_txR(16) xor xgmii_txR(14) xor xgmii_txR(10) xor xgmii_txR(7)  xor xgmii_txR(2)  xor xgmii_txR(1)  xor 
				tx_crc(0)     xor tx_crc(3)     xor tx_crc(4)     xor tx_crc(5)     xor tx_crc(7)     xor tx_crc(8)     xor 
				tx_crc(11)    xor tx_crc(15)    xor tx_crc(16)    xor tx_crc(18)    xor tx_crc(19)    xor tx_crc(23)    xor 
				tx_crc(24)    xor tx_crc(25)    xor tx_crc(28)    xor tx_crc(29)    xor tx_crc(31);
			tx_crc(25) <=
				xgmii_txR(62) xor xgmii_txR(61) xor xgmii_txR(58) xor xgmii_txR(57) xor xgmii_txR(56) xor xgmii_txR(52) xor 
				xgmii_txR(51) xor xgmii_txR(49) xor xgmii_txR(48) xor xgmii_txR(44) xor xgmii_txR(41) xor xgmii_txR(40) xor 
				xgmii_txR(38) xor xgmii_txR(37) xor xgmii_txR(36) xor xgmii_txR(33) xor xgmii_txR(31) xor xgmii_txR(29) xor 
				xgmii_txR(28) xor xgmii_txR(22) xor xgmii_txR(21) xor xgmii_txR(19) xor xgmii_txR(18) xor xgmii_txR(17) xor 
				xgmii_txR(15) xor xgmii_txR(11) xor xgmii_txR(8)  xor xgmii_txR(3)  xor xgmii_txR(2)  xor tx_crc(1)     xor 
				tx_crc(4)     xor tx_crc(5)     xor tx_crc(6)     xor tx_crc(8)     xor tx_crc(9)     xor tx_crc(12)    xor 
				tx_crc(16)    xor tx_crc(17)    xor tx_crc(19)    xor tx_crc(20)    xor tx_crc(24)    xor tx_crc(25)    xor 
				tx_crc(26)    xor tx_crc(29)    xor tx_crc(30);
			tx_crc(26) <=
				xgmii_txR(62) xor xgmii_txR(61) xor xgmii_txR(60) xor xgmii_txR(59) xor xgmii_txR(57) xor xgmii_txR(55) xor 
				xgmii_txR(54) xor xgmii_txR(52) xor xgmii_txR(49) xor xgmii_txR(48) xor xgmii_txR(47) xor xgmii_txR(44) xor 
				xgmii_txR(42) xor xgmii_txR(41) xor xgmii_txR(39) xor xgmii_txR(38) xor xgmii_txR(31) xor xgmii_txR(28) xor 
				xgmii_txR(26) xor xgmii_txR(25) xor xgmii_txR(24) xor xgmii_txR(23) xor xgmii_txR(22) xor xgmii_txR(20) xor 
				xgmii_txR(19) xor xgmii_txR(18) xor xgmii_txR(10) xor xgmii_txR(6)  xor xgmii_txR(4)  xor xgmii_txR(3)  xor 
				xgmii_txR(0)  xor tx_crc(6)     xor tx_crc(7)     xor tx_crc(9)     xor tx_crc(10)    xor tx_crc(12)    xor 
				tx_crc(15)    xor tx_crc(16)    xor tx_crc(17)    xor tx_crc(20)    xor tx_crc(22)    xor tx_crc(23)    xor 
				tx_crc(25)    xor tx_crc(27)    xor tx_crc(28)    xor tx_crc(29)    xor tx_crc(30);
			tx_crc(27) <=
				xgmii_txR(63) xor xgmii_txR(62) xor xgmii_txR(61) xor xgmii_txR(60) xor xgmii_txR(58) xor xgmii_txR(56) xor 
				xgmii_txR(55) xor xgmii_txR(53) xor xgmii_txR(50) xor xgmii_txR(49) xor xgmii_txR(48) xor xgmii_txR(45) xor 
				xgmii_txR(43) xor xgmii_txR(42) xor xgmii_txR(40) xor xgmii_txR(39) xor xgmii_txR(32) xor xgmii_txR(29) xor 
				xgmii_txR(27) xor xgmii_txR(26) xor xgmii_txR(25) xor xgmii_txR(24) xor xgmii_txR(23) xor xgmii_txR(21) xor 
				xgmii_txR(20) xor xgmii_txR(19) xor xgmii_txR(11) xor xgmii_txR(7)  xor xgmii_txR(5)  xor xgmii_txR(4)  xor 
				xgmii_txR(1)  xor tx_crc(0)     xor tx_crc(7)     xor tx_crc(8)     xor tx_crc(10)    xor tx_crc(11)    xor 
				tx_crc(13)    xor tx_crc(16)    xor tx_crc(17)    xor tx_crc(18)    xor tx_crc(21)    xor tx_crc(23)    xor 
				tx_crc(24)    xor tx_crc(26)    xor tx_crc(28)    xor tx_crc(29)    xor tx_crc(30)    xor tx_crc(31);
			tx_crc(28) <=
				xgmii_txR(63) xor xgmii_txR(62) xor xgmii_txR(61) xor xgmii_txR(59) xor xgmii_txR(57) xor xgmii_txR(56) xor 
				xgmii_txR(54) xor xgmii_txR(51) xor xgmii_txR(50) xor xgmii_txR(49) xor xgmii_txR(46) xor xgmii_txR(44) xor 
				xgmii_txR(43) xor xgmii_txR(41) xor xgmii_txR(40) xor xgmii_txR(33) xor xgmii_txR(30) xor xgmii_txR(28) xor 
				xgmii_txR(27) xor xgmii_txR(26) xor xgmii_txR(25) xor xgmii_txR(24) xor xgmii_txR(22) xor xgmii_txR(21) xor 
				xgmii_txR(20) xor xgmii_txR(12) xor xgmii_txR(8)  xor xgmii_txR(6)  xor xgmii_txR(5)  xor xgmii_txR(2)  xor 
				tx_crc(1)     xor tx_crc(8)     xor tx_crc(9)     xor tx_crc(11)    xor tx_crc(12)    xor tx_crc(14)    xor 
				tx_crc(17)    xor tx_crc(18)    xor tx_crc(19)    xor tx_crc(22)    xor tx_crc(24)    xor tx_crc(25)    xor 
				tx_crc(27)    xor tx_crc(29)    xor tx_crc(30)    xor tx_crc(31);
			tx_crc(29) <=
				xgmii_txR(63) xor xgmii_txR(62) xor xgmii_txR(60) xor xgmii_txR(58) xor xgmii_txR(57) xor xgmii_txR(55) xor 
				xgmii_txR(52) xor xgmii_txR(51) xor xgmii_txR(50) xor xgmii_txR(47) xor xgmii_txR(45) xor xgmii_txR(44) xor 
				xgmii_txR(42) xor xgmii_txR(41) xor xgmii_txR(34) xor xgmii_txR(31) xor xgmii_txR(29) xor xgmii_txR(28) xor 
				xgmii_txR(27) xor xgmii_txR(26) xor xgmii_txR(25) xor xgmii_txR(23) xor xgmii_txR(22) xor xgmii_txR(21) xor 
				xgmii_txR(13) xor xgmii_txR(9)  xor xgmii_txR(7)  xor xgmii_txR(6)  xor xgmii_txR(3)  xor tx_crc(2)     xor 
				tx_crc(9)     xor tx_crc(10)    xor tx_crc(12)    xor tx_crc(13)    xor tx_crc(15)    xor tx_crc(18)    xor 
				tx_crc(19)    xor tx_crc(20)    xor tx_crc(23)    xor tx_crc(25)    xor tx_crc(26)    xor tx_crc(28)    xor 
				tx_crc(30)    xor tx_crc(31);
			tx_crc(30) <=
				xgmii_txR(63) xor xgmii_txR(61) xor xgmii_txR(59) xor xgmii_txR(58) xor xgmii_txR(56) xor xgmii_txR(53) xor 
				xgmii_txR(52) xor xgmii_txR(51) xor xgmii_txR(48) xor xgmii_txR(46) xor xgmii_txR(45) xor xgmii_txR(43) xor 
				xgmii_txR(42) xor xgmii_txR(35) xor xgmii_txR(32) xor xgmii_txR(30) xor xgmii_txR(29) xor xgmii_txR(28) xor 
				xgmii_txR(27) xor xgmii_txR(26) xor xgmii_txR(24) xor xgmii_txR(23) xor xgmii_txR(22) xor xgmii_txR(14) xor 
				xgmii_txR(10) xor xgmii_txR(8)  xor xgmii_txR(7)  xor xgmii_txR(4)  xor tx_crc(0)     xor tx_crc(3)     xor 
				tx_crc(10)    xor tx_crc(11)    xor tx_crc(13)    xor tx_crc(14)    xor tx_crc(16)    xor tx_crc(19)    xor 
				tx_crc(20)    xor tx_crc(21)    xor tx_crc(24)    xor tx_crc(26)    xor tx_crc(27)    xor tx_crc(29)    xor 
				tx_crc(31);
			tx_crc(31) <=
				xgmii_txR(62) xor xgmii_txR(60) xor xgmii_txR(59) xor xgmii_txR(57) xor xgmii_txR(54) xor xgmii_txR(53) xor 
				xgmii_txR(52) xor xgmii_txR(49) xor xgmii_txR(47) xor xgmii_txR(46) xor xgmii_txR(44) xor xgmii_txR(43) xor 
				xgmii_txR(36) xor xgmii_txR(33) xor xgmii_txR(31) xor xgmii_txR(30) xor xgmii_txR(29) xor xgmii_txR(28) xor 
				xgmii_txR(27) xor xgmii_txR(25) xor xgmii_txR(24) xor xgmii_txR(23) xor xgmii_txR(15) xor xgmii_txR(11) xor 
				xgmii_txR(9)  xor xgmii_txR(8)  xor xgmii_txR(5)  xor tx_crc(1)     xor tx_crc(4)     xor tx_crc(11)    xor 
				tx_crc(12)    xor tx_crc(14)    xor tx_crc(15)    xor tx_crc(17)    xor tx_crc(20)    xor tx_crc(21)    xor 
				tx_crc(22)    xor tx_crc(25)    xor tx_crc(27)    xor tx_crc(28)    xor tx_crc(30);

			if reset = '1' then
				tx_state         <= IDLE;
				tx_ack           <= '0';
				tx_start_latched <= '0';
			else
				-- single cycle active signals
				tx_ack   <= '0';

				-- latch tx_start when we receive it, until we can acknowledge the request
				if tx_start = '1' then
					tx_start_latched <= '1';
				end if;
				
				case tx_state is
					when IDLE            =>
						if tx_start = '1' or tx_start_latched = '1' then
							tx_ack   <= '1';		
							tx_start_latched <= '0';
							tx_state         <= SEND_PREAMBLE;
						end if;
					when SEND_PREAMBLE   =>
						tx_crc <= (others => '1');
						tx_state <= SEND_DATA;
					when SEND_DATA       =>
						case tx_data_valid is
							when "11111111" =>
							when "00000000" =>
								tx_state         <= SEND_END_ALIGNED;
							when "00000011" =>
								tx_state         <= SEND_END_NON_ALIGNED;
							when others =>
								-- this version of the mac does not support any other enable pattern. if we receive an unsupported one then we send a shorter frame and corrupt the CRC.
								tx_state         <= SEND_CORRUPTED_CRC;
						end case;
					when SEND_END_ALIGNED       =>
						tx_state <= INTERFRAME;
					when SEND_END_NON_ALIGNED   =>
						tx_state <= INTERFRAME;
					when SEND_CORRUPTED_CRC     =>
						tx_state <= INTERFRAME;
					when INTERFRAME             =>
						tx_state <= IDLE;
					when others => 
				end case;
			
			end if;	


		end if;
	end process;

	-- Compute a partial CRC used when receiveing a partial word
	tx_partial_crc(0) <=
		xgmii_partR(12) xor xgmii_partR(10) xor xgmii_partR(9)  xor xgmii_partR(6) xor xgmii_partR(0) xor tx_crc(16)     xor 
		tx_crc(22)      xor tx_crc(25)      xor tx_crc(26)      xor tx_crc(28);
	tx_partial_crc(1) <=
		xgmii_partR(13) xor xgmii_partR(12) xor xgmii_partR(11) xor xgmii_partR(9) xor xgmii_partR(7) xor xgmii_partR(6) xor 
		xgmii_partR(1)  xor xgmii_partR(0)  xor tx_crc(16)      xor tx_crc(17)     xor tx_crc(22)     xor tx_crc(23)     xor 
		tx_crc(25)      xor tx_crc(27)      xor tx_crc(28)      xor tx_crc(29);
	tx_partial_crc(2) <=
		xgmii_partR(14) xor xgmii_partR(13) xor xgmii_partR(9)  xor xgmii_partR(8) xor xgmii_partR(7) xor xgmii_partR(6) xor 
		xgmii_partR(2)  xor xgmii_partR(1)  xor xgmii_partR(0)  xor tx_crc(16)     xor tx_crc(17)     xor tx_crc(18)     xor 
		tx_crc(22)      xor tx_crc(23)      xor tx_crc(24)      xor tx_crc(25)     xor tx_crc(29)     xor tx_crc(30);
	tx_partial_crc(3) <=
		xgmii_partR(15) xor xgmii_partR(14) xor xgmii_partR(10) xor xgmii_partR(9) xor xgmii_partR(8) xor xgmii_partR(7) xor 
		xgmii_partR(3)  xor xgmii_partR(2)  xor xgmii_partR(1)  xor tx_crc(17)     xor tx_crc(18)     xor tx_crc(19)     xor 
		tx_crc(23)      xor tx_crc(24)      xor tx_crc(25)      xor tx_crc(26)     xor tx_crc(30)     xor tx_crc(31);
	tx_partial_crc(4) <=
		xgmii_partR(15) xor xgmii_partR(12) xor xgmii_partR(11) xor xgmii_partR(8) xor xgmii_partR(6) xor xgmii_partR(4) xor 
		xgmii_partR(3)  xor xgmii_partR(2)  xor xgmii_partR(0)  xor tx_crc(16)     xor tx_crc(18)     xor tx_crc(19)     xor 
		tx_crc(20)      xor tx_crc(22)      xor tx_crc(24)      xor tx_crc(27)     xor tx_crc(28)     xor tx_crc(31);
	tx_partial_crc(5) <=
		xgmii_partR(13) xor xgmii_partR(10) xor xgmii_partR(7)  xor xgmii_partR(6) xor xgmii_partR(5) xor xgmii_partR(4) xor 
		xgmii_partR(3)  xor xgmii_partR(1)  xor xgmii_partR(0)  xor tx_crc(16)     xor tx_crc(17)     xor tx_crc(19)     xor 
		tx_crc(20)      xor tx_crc(21)      xor tx_crc(22)      xor tx_crc(23)     xor tx_crc(26)     xor tx_crc(29);
	tx_partial_crc(6) <=
		xgmii_partR(14) xor xgmii_partR(11) xor xgmii_partR(8)  xor xgmii_partR(7) xor xgmii_partR(6) xor xgmii_partR(5) xor 
		xgmii_partR(4)  xor xgmii_partR(2)  xor xgmii_partR(1)  xor tx_crc(17)     xor tx_crc(18)     xor tx_crc(20)     xor 
		tx_crc(21)      xor tx_crc(22)      xor tx_crc(23)      xor tx_crc(24)     xor tx_crc(27)     xor tx_crc(30);
	tx_partial_crc(7) <=
		xgmii_partR(15) xor xgmii_partR(10) xor xgmii_partR(8)  xor xgmii_partR(7) xor xgmii_partR(5) xor xgmii_partR(3) xor 
		xgmii_partR(2)  xor xgmii_partR(0)  xor tx_crc(16)      xor tx_crc(18)     xor tx_crc(19)     xor tx_crc(21)     xor 
		tx_crc(23)      xor tx_crc(24)      xor tx_crc(26)      xor tx_crc(31);
	tx_partial_crc(8) <=
		xgmii_partR(12) xor xgmii_partR(11) xor xgmii_partR(10) xor xgmii_partR(8) xor xgmii_partR(4) xor xgmii_partR(3) xor 
		xgmii_partR(1)  xor xgmii_partR(0)  xor tx_crc(16)      xor tx_crc(17)     xor tx_crc(19)     xor tx_crc(20)     xor 
		tx_crc(24)      xor tx_crc(26)      xor tx_crc(27)      xor tx_crc(28);
	tx_partial_crc(9) <=
		xgmii_partR(13) xor xgmii_partR(12) xor xgmii_partR(11) xor xgmii_partR(9) xor xgmii_partR(5) xor xgmii_partR(4) xor 
		xgmii_partR(2)  xor xgmii_partR(1)  xor tx_crc(17)      xor tx_crc(18)     xor tx_crc(20)     xor tx_crc(21)     xor 
		tx_crc(25)      xor tx_crc(27)      xor tx_crc(28)      xor tx_crc(29);
	tx_partial_crc(10) <=
		xgmii_partR(14) xor xgmii_partR(13) xor xgmii_partR(9)  xor xgmii_partR(5) xor xgmii_partR(3) xor xgmii_partR(2) xor 
		xgmii_partR(0)  xor tx_crc(16)      xor tx_crc(18)      xor tx_crc(19)     xor tx_crc(21)     xor tx_crc(25)     xor 
		tx_crc(29)      xor tx_crc(30);
	tx_partial_crc(11) <=
		xgmii_partR(15) xor xgmii_partR(14) xor xgmii_partR(12) xor xgmii_partR(9) xor xgmii_partR(4) xor xgmii_partR(3) xor 
		xgmii_partR(1)  xor xgmii_partR(0)  xor tx_crc(16)      xor tx_crc(17)     xor tx_crc(19)     xor tx_crc(20)     xor 
		tx_crc(25)      xor tx_crc(28)      xor tx_crc(30)      xor tx_crc(31);
	tx_partial_crc(12) <=
		xgmii_partR(15) xor xgmii_partR(13) xor xgmii_partR(12) xor xgmii_partR(9) xor xgmii_partR(6) xor xgmii_partR(5) xor 
		xgmii_partR(4)  xor xgmii_partR(2)  xor xgmii_partR(1)  xor xgmii_partR(0) xor tx_crc(16)     xor tx_crc(17)     xor 
		tx_crc(18)      xor tx_crc(20)      xor tx_crc(21)      xor tx_crc(22)     xor tx_crc(25)     xor tx_crc(28)     xor 
		tx_crc(29)      xor tx_crc(31);
	tx_partial_crc(13) <=
		xgmii_partR(14) xor xgmii_partR(13) xor xgmii_partR(10) xor xgmii_partR(7) xor xgmii_partR(6) xor xgmii_partR(5) xor 
		xgmii_partR(3)  xor xgmii_partR(2)  xor xgmii_partR(1)  xor tx_crc(17)     xor tx_crc(18)     xor tx_crc(19)     xor 
		tx_crc(21)      xor tx_crc(22)      xor tx_crc(23)      xor tx_crc(26)     xor tx_crc(29)     xor tx_crc(30);
	tx_partial_crc(14) <=
		xgmii_partR(15) xor xgmii_partR(14) xor xgmii_partR(11) xor xgmii_partR(8) xor xgmii_partR(7) xor xgmii_partR(6) xor 
		xgmii_partR(4)  xor xgmii_partR(3)  xor xgmii_partR(2)  xor tx_crc(18)     xor tx_crc(19)     xor tx_crc(20)     xor 
		tx_crc(22)      xor tx_crc(23)      xor tx_crc(24)      xor tx_crc(27)     xor tx_crc(30)     xor tx_crc(31);
	tx_partial_crc(15) <=
		xgmii_partR(15) xor xgmii_partR(12) xor xgmii_partR(9)  xor xgmii_partR(8) xor xgmii_partR(7) xor xgmii_partR(5) xor 
		xgmii_partR(4)  xor xgmii_partR(3)  xor tx_crc(19)      xor tx_crc(20)     xor tx_crc(21)     xor tx_crc(23)     xor 
		tx_crc(24)      xor tx_crc(25)      xor tx_crc(28)      xor tx_crc(31);
	tx_partial_crc(16) <=
		xgmii_partR(13) xor xgmii_partR(12) xor xgmii_partR(8)  xor xgmii_partR(5) xor xgmii_partR(4) xor xgmii_partR(0) xor 
		tx_crc(0)       xor tx_crc(16)      xor tx_crc(20)      xor tx_crc(21)     xor tx_crc(24)     xor tx_crc(28)     xor 
		tx_crc(29);
	tx_partial_crc(17) <=
		xgmii_partR(14) xor xgmii_partR(13) xor xgmii_partR(9)  xor xgmii_partR(6) xor xgmii_partR(5) xor xgmii_partR(1) xor 
		tx_crc(1)       xor tx_crc(17)      xor tx_crc(21)      xor tx_crc(22)     xor tx_crc(25)     xor tx_crc(29)     xor 
		tx_crc(30);
	tx_partial_crc(18) <=
		xgmii_partR(15) xor xgmii_partR(14) xor xgmii_partR(10) xor xgmii_partR(7) xor xgmii_partR(6) xor xgmii_partR(2) xor 
		tx_crc(2)       xor tx_crc(18)      xor tx_crc(22)      xor tx_crc(23)     xor tx_crc(26)     xor tx_crc(30)     xor 
		tx_crc(31);
	tx_partial_crc(19) <=
		xgmii_partR(15) xor xgmii_partR(11) xor xgmii_partR(8)  xor xgmii_partR(7) xor xgmii_partR(3) xor tx_crc(3)      xor 
		tx_crc(19)      xor tx_crc(23)      xor tx_crc(24)      xor tx_crc(27)     xor tx_crc(31);
	tx_partial_crc(20) <=
		xgmii_partR(12) xor xgmii_partR(9)  xor xgmii_partR(8)  xor xgmii_partR(4) xor tx_crc(4)      xor tx_crc(20)     xor 
		tx_crc(24)      xor tx_crc(25)      xor tx_crc(28);
	tx_partial_crc(21) <=
		xgmii_partR(13) xor xgmii_partR(10) xor xgmii_partR(9)  xor xgmii_partR(5) xor tx_crc(5)      xor tx_crc(21)     xor 
		tx_crc(25)      xor tx_crc(26)      xor tx_crc(29);
	tx_partial_crc(22) <=
		xgmii_partR(14) xor xgmii_partR(12) xor xgmii_partR(11) xor xgmii_partR(9) xor xgmii_partR(0) xor tx_crc(6)      xor 
		tx_crc(16)      xor tx_crc(25)      xor tx_crc(27)      xor tx_crc(28)     xor tx_crc(30);
	tx_partial_crc(23) <=
		xgmii_partR(15) xor xgmii_partR(13) xor xgmii_partR(9)  xor xgmii_partR(6) xor xgmii_partR(1) xor xgmii_partR(0) xor 
		tx_crc(7)       xor tx_crc(16)      xor tx_crc(17)      xor tx_crc(22)     xor tx_crc(25)     xor tx_crc(29)     xor 
		tx_crc(31);
	tx_partial_crc(24) <=
		xgmii_partR(14) xor xgmii_partR(10) xor xgmii_partR(7)  xor xgmii_partR(2) xor xgmii_partR(1) xor tx_crc(8)      xor 
		tx_crc(17)      xor tx_crc(18)      xor tx_crc(23)      xor tx_crc(26)     xor tx_crc(30);
	tx_partial_crc(25) <=
		xgmii_partR(15) xor xgmii_partR(11) xor xgmii_partR(8)  xor xgmii_partR(3) xor xgmii_partR(2) xor tx_crc(9)      xor 
		tx_crc(18)      xor tx_crc(19)      xor tx_crc(24)      xor tx_crc(27)     xor tx_crc(31);
	tx_partial_crc(26) <=
		xgmii_partR(10) xor xgmii_partR(6)  xor xgmii_partR(4)  xor xgmii_partR(3) xor xgmii_partR(0) xor tx_crc(10)     xor 
		tx_crc(16)      xor tx_crc(19)      xor tx_crc(20)      xor tx_crc(22)     xor tx_crc(26);
	tx_partial_crc(27) <=
		xgmii_partR(11) xor xgmii_partR(7)  xor xgmii_partR(5)  xor xgmii_partR(4) xor xgmii_partR(1) xor tx_crc(11)     xor 
		tx_crc(17)      xor tx_crc(20)      xor tx_crc(21)      xor tx_crc(23)     xor tx_crc(27);
	tx_partial_crc(28) <=
		xgmii_partR(12) xor xgmii_partR(8)  xor xgmii_partR(6)  xor xgmii_partR(5) xor xgmii_partR(2) xor tx_crc(12)     xor 
		tx_crc(18)      xor tx_crc(21)      xor tx_crc(22)      xor tx_crc(24)     xor tx_crc(28);
	tx_partial_crc(29) <=
		xgmii_partR(13) xor xgmii_partR(9)  xor xgmii_partR(7)  xor xgmii_partR(6) xor xgmii_partR(3) xor tx_crc(13)     xor 
		tx_crc(19)      xor tx_crc(22)      xor tx_crc(23)      xor tx_crc(25)     xor tx_crc(29);
	tx_partial_crc(30) <=
		xgmii_partR(14) xor xgmii_partR(10) xor xgmii_partR(8)  xor xgmii_partR(7) xor xgmii_partR(4) xor tx_crc(14)     xor 
		tx_crc(20)      xor tx_crc(23)      xor tx_crc(24)      xor tx_crc(26)     xor tx_crc(30);
	tx_partial_crc(31) <=
		xgmii_partR(15) xor xgmii_partR(11) xor xgmii_partR(9)  xor xgmii_partR(8) xor xgmii_partR(5) xor tx_crc(15) xor 
		tx_crc(21)      xor tx_crc(24)      xor tx_crc(25)      xor tx_crc(27)     xor tx_crc(31);

	-- Assign the data to be sent to the XGMII depending on the current state
	with tx_state select xgmii_txd <= 
		X"0707070707070707"                                                  when IDLE,
		X"0707070707070707"                                                  when INTERFRAME,
		X"D5555555555555FB"                                                  when SEND_PREAMBLE,
		xgmii_tx0                                                            when SEND_DATA,
		X"070707FD" & (not bit_reverse(tx_crc))                              when SEND_END_ALIGNED,
		X"07FD" & (not bit_reverse(tx_partial_crc)) & xgmii_tx0(15 downto 0) when SEND_END_NON_ALIGNED,
		X"070707FD" & (not bit_reverse(tx_crc) xor X"00000001")              when SEND_CORRUPTED_CRC,
		(others => '0')                                                      when others;
	with tx_state select xgmii_txc <= 
		"11111111"                                                           when IDLE,
		"11111111"                                                           when INTERFRAME,
		"00000001"                                                           when SEND_PREAMBLE,
		"00000000"                                                           when SEND_DATA,
		"11110000"                                                           when SEND_END_ALIGNED,
		"11000000"                                                           when SEND_END_NON_ALIGNED,
		"11110000"                                                           when SEND_CORRUPTED_CRC,
		(others => '0')                                                      when others;	

	-- Bit reverse the data before feeding it to the CRC computation block. We also need to use the bit reverse version of the data generated by the CRC block.
	xgmii_txR      <= bit_reverse(xgmii_tx0);
	xgmii_partR    <= bit_reverse(xgmii_tx0(15 downto 0));

	-- #####   #    #
	-- #    #   #  #
	-- #    #    ##
	-- #####     ##
	-- #   #    #  #
	-- #    #  #    #

	-- Receive state machine
	rx_proc: process(rx_clk0)
	begin
		if rx_clk0'event and rx_clk0 = '1' then
			if reset = '1' then
				rx_state           <= IDLE;
				rx_data_valid      <= (others => '0');
				rx_enable          <= "00000000";
				rx_data_is_aligned <= '1';
				rx_good_frame      <= '0';
				rx_good_frame0     <= '0';
				rx_bad_frame       <= '0';
			else
				-- register data and control
				xgmii_rxd0         <= xgmii_rxd;
				xgmii_rxc0         <= xgmii_rxc;
				xgmii_rxd_aligned0 <= xgmii_rxd_aligned;

				-- defaults rx_enable to 0
				rx_enable          <= "00000000";

				-- defaults good and bad signals to 0
				rx_good_frame0     <= '0';
				rx_good_frame      <= rx_good_frame0;
				rx_bad_frame       <= '0';

				-- data to user
				rx_data       <= xgmii_rxd_aligned0;
				rx_data_valid <= rx_enable;

				case rx_state is
					when IDLE               =>
						if xgmii_rxd(7 downto 0) = X"FB" and xgmii_rxc(0) = '1' then
							rx_data_is_aligned <= '1';
							rx_state        <= RECEIVE_DATA;
						end if;
						if xgmii_rxd0(39 downto 32) = X"FB" and xgmii_rxc0(4) = '1' then
							rx_data_is_aligned <= '0';
							rx_state        <= RECEIVE_DATA;
						end if;
					when RECEIVE_DATA       =>
						rx_enable      <= "11111111";
						if xgmii_rxc_aligned /= "00000000" then
							rx_state          <= IDLE;
							rx_good_frame0    <= '1';
							rx_enable         <= "10101010";
							rx_data_valid     <= not(xgmii_rxc_aligned(3 downto 0)) & "1111";
							rx_enable         <= "0000" & not(xgmii_rxc_aligned(7 downto 4));
						end if;
					when others => 
				end case;
	
	
			end if;
		end if;
	end process;

	with rx_data_is_aligned select xgmii_rxd_aligned <=
		xgmii_rxd                                          when '1',
		xgmii_rxd(31 downto 0) & xgmii_rxd0(63 downto 32)  when '0',
		(others => '0')                                    when others;

	with rx_data_is_aligned select xgmii_rxc_aligned <=
		xgmii_rxc                                          when '1',
		xgmii_rxc(3 downto 0)  & xgmii_rxc0(7 downto 4)    when '0',
		(others => '0')                                    when others;


end architecture ten_gig_eth_mac_UCB_arch;
