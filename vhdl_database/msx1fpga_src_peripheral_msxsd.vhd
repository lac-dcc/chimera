-------------------------------------------------------------------------------
--
-- MSX1 FPGA project
--
-- Copyright (c) 2023, Fabio Belavenuto (belavenuto@gmail.com)
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--
-- Please report bugs to the author, but before you do so, please
-- make sure that this is not a derivative work and that
-- you have the latest version of this file.
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity msxsd is
	port (
		enable_i		: in  std_logic;
		reset_i			: in  std_logic;
		clock_i			: in  std_logic;
		clock_en_i		: in  std_logic;
		addr_i			: in  std_logic_vector(15 downto 0);
		data_i			: in  std_logic_vector( 7 downto 0);
		data_o			: out std_logic_vector( 7 downto 0);
		sltsl_n_i		: in  std_logic;
		rd_n_i			: in  std_logic;
		wr_n_i			: in  std_logic;
		spi_has_data_o	: out std_logic;
		wait_n_o		: out std_logic;
		-- Memory
		rom_cs_n_o		: out std_logic;
		rom_wr_n_o		: out std_logic;
		rom_page_o		: out std_logic_vector( 2 downto 0);
		-- SD card interface
		spi_cs_n_o		: out std_logic_vector( 2 downto 0)	:= "111";
		spi_sclk_o		: out std_logic;
		spi_mosi_o		: out std_logic;
		spi_miso_i		: in  std_logic;
		sd_wp_i			: in  std_logic;
		sd_pres_n_i		: in  std_logic		
	);
end entity;

architecture Behavior of msxsd is

	signal rom_page_s		: std_logic_vector(2 downto 0);
	signal ram_wr_n_s		: std_logic;
	signal spi_ctrl_cs_n_s	: std_logic;
	signal spi_data_cs_n_s	: std_logic;
	signal sck_delayed_s	: std_logic;
	signal counter_s		: unsigned(3 downto 0);
	-- Shift register has an extra bit because we write on the
	-- falling edge and read on the rising edge
	signal shift_r			: std_logic_vector(8 downto 0);
	signal status_s			: std_logic_vector(7 downto 0);
	signal spidata_r		: std_logic_vector(7 downto 0);
	signal sd_chg_s			: std_logic		:= '0';
	signal sd_chg_q			: std_logic		:= '0';
	--
	signal wait_n_s			: std_logic;
	signal wait_cnt_q		: unsigned( 3 downto 0)	:= (others => '0');

begin

	-- Write Bank switch address
	process (reset_i, clock_i)
	begin
		if reset_i = '1' then
			rom_page_s	<= (others => '0');
		elsif rising_edge(clock_i) and clock_en_i = '1' then
			if enable_i = '1' and sltsl_n_i = '0' and wr_n_i = '0' and addr_i = X"6000" then	-- $6000 from any bank
				rom_page_s <= data_i(2 downto 0);
			end if;
		end if;
	end process;

	rom_page_o	<= rom_page_s;

	-- RAM area inside ROM last page
	ram_wr_n_s	<=	'0' when sltsl_n_i = '0' and wr_n_i = '0' and rom_page_s = "111" and addr_i >= X"7000" and addr_i <= X"7AFF"		else
					'1';
	
	-- SPI area (read and write)
	spi_data_cs_n_s	<= '0' when sltsl_n_i = '0' and rom_page_s = "111" and addr_i >= X"7B00" and addr_i <= X"7EFF"		else	'1';
	spi_ctrl_cs_n_s	<= '0' when sltsl_n_i = '0' and rom_page_s = "111" and addr_i = X"7FF0"								else	'1';

	rom_cs_n_o	<=	'1' when enable_i = '0'																			else
					'0' when sltsl_n_i = '0' and rd_n_i = '0' and addr_i(15 downto 14) = "01" and 
																spi_data_cs_n_s = '1' and spi_ctrl_cs_n_s = '1'		else	-- Read mem addr range $4000-$7FFF excl SPI area
					'0' when ram_wr_n_s = '0'																		else	-- Write RAM area
					'1';

	rom_wr_n_o	<=	'1' when enable_i = '0'																		else
					'0' when ram_wr_n_s = '0'																	else		-- Enable write on RAM area
					'1';

	-- Mount SPI status byte
	status_s	<= "00000" & sd_wp_i & sd_pres_n_i & sd_chg_s;

	-- SPI port reading
	data_o	<=	status_s	when 	spi_ctrl_cs_n_s = '0' and rd_n_i = '0'		else		-- SPI status reg read
				spidata_r	when    spi_data_cs_n_s = '0' and rd_n_i = '0'		else		-- SPI data read
				(others => '1');
	
	-- Inform SPI reading
	spi_has_data_o	<=	'1' when (spi_ctrl_cs_n_s = '0' or spi_data_cs_n_s = '0') and rd_n_i = '0'	else '0';				-- Reading from SPI area

	-- Disk change

	disk_change: process (reset_i, sd_pres_n_i, clock_i)
		variable edge_s		: std_logic_vector(1 downto 0);
	begin
		if reset_i = '1' then							-- Reset clear disk change flag
			sd_chg_q	<= '0';
		elsif rising_edge(clock_i) and clock_en_i = '1' then
			sd_chg_s	<= sd_chg_q;					-- Delay flag
			edge_s		:= edge_s(1) & spi_ctrl_cs_n_s;
			if sd_pres_n_i = '1' then					-- Remove card set disk change flag
				sd_chg_q	<= '1';
			elsif edge_s = "01" then					-- End of read clear disk change flag
				sd_chg_q <= '0';
			end if;
		end if;
	end process;

	--------------------------------------------------
	-- Essa parte lida com a porta SPI por hardware --
	--      Implementa um SPI Master Mode 0         --
	--------------------------------------------------

	-- Control port write
	ctrl_port: process(clock_i, reset_i)
	begin
		if reset_i = '1' then
			spi_cs_n_o <= "111";
		elsif rising_edge(clock_i) and clock_en_i = '1' then
			if spi_ctrl_cs_n_s = '0' and wr_n_i = '0'  then
				spi_cs_n_o(2)	<= data_i(7);
				spi_cs_n_o(1)	<= data_i(1);
				spi_cs_n_o(0)	<= data_i(0);
			end if;
		end if;
	end process;

	-- SD card outputs from clock divider and shift register
	spi_sclk_o  <= sck_delayed_s;
	spi_mosi_o  <= shift_r(8);

	-- Atrasa SCK para dar tempo do bit mais significativo mudar de estado e acertar MOSI antes do SCK
	sck_dly: process (clock_i, reset_i)
	begin
		if reset_i = '1' then
			sck_delayed_s <= '0';
		elsif rising_edge(clock_i) and clock_en_i = '1' then
			sck_delayed_s <= not counter_s(0);
		end if;
	end process;

	-- Data port write
	data_port: process(clock_i, reset_i)
			variable finish_v		: boolean;
	begin		
		if reset_i = '1' then
			shift_r		<= (others => '1');
			spidata_r	<= (others => '1');
			counter_s	<= "1111"; -- Idle
			wait_n_s	<= '1';
			wait_cnt_q	<= (others => '0');
		elsif rising_edge(clock_i) and clock_en_i = '1' then

			if counter_s = "1111" then						-- IDLE state
				spidata_r	<= shift_r(7 downto 0);			-- Store previous shift register value in input register
				shift_r(8)	<= '1';							-- MOSI starts on '1'
				if wait_cnt_q /= 0 then
					wait_cnt_q	<= wait_cnt_q - 1;
				else
					wait_n_s		<= '1';
					-- Check for a bus access
					if spi_data_cs_n_s = '0' then
						-- Write loads shift register with data
						-- Read loads it with all 1s
						if rd_n_i = '0' then
							shift_r <= (others => '1');								-- One read operation sets 0xFF to send and start transmission
						else
							shift_r <= data_i & '1';								-- One write operation gets data input and start transmission
						end if;
						counter_s <= "0000"; -- Initiates transfer
						finish_v := false;
					end if;
				end if;
			else
				counter_s <= counter_s + 1;										-- Transfer in progress
				if sck_delayed_s = '0' then
					shift_r(0)	<= spi_miso_i;									-- Input next bit on rising edge
				else
					shift_r		<= shift_r(7 downto 0) & '1';					-- Output next bit on falling edge
				end if;

				-- Not idle, generate wait if access
				if spi_data_cs_n_s = '0' and finish_v then						-- If new access
					wait_n_s	<= '0';											-- Wait until transfer ready
				elsif spi_data_cs_n_s = '1' then
					finish_v		:= true;									-- Last operation finished
				end if;
				wait_cnt_q	<= "0010";
			end if;
		end if;
	end process;

	wait_n_o <= wait_n_s;
				
end architecture;