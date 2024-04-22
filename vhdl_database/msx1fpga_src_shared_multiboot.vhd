-------------------------------------------------------------------------------
--
-- MSX1 FPGA project
--
-- Copyright (c) 2016, Fabio Belavenuto (belavenuto@gmail.com)
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
-- Multiboot core
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library UNISIM;
use UNISIM.VComponents.all;

entity multiboot is
	generic (
		bit_g			: integer	:= 4		-- 1 or 2 or 4
	);
	port(
		reset_i		: in  std_logic;
		clock_i		: in  std_logic;
		start_i		: in  std_logic;
		spi_addr_i	: in  std_logic_vector(23 downto 0)	:= X"000000"
	);
end entity;

architecture Behavioral of multiboot is

	----------------------------------------------------------------------------
	-- ICAP configuration data codes
	----------------------------------------------------------------------------
	--  For custom data codes like the ones for reading back, take a look to:
	--    [OPCODES]        UG380 page 88   table  5-23
	--    [CFG PACKETS]    UG380 page 89   tables 5-{24, 25}
	--    [CG REGISTERS]   UG380 page 90   table  5-30
	----------------------------------------------------------------------------
	constant DUMMY_C			: std_logic_vector(15 downto 0) := X"FFFF";	-- 
	constant NOOP_C			: std_logic_vector(15 downto 0) := X"2000";	-- 
	constant NULL1_C			: std_logic_vector(15 downto 0) := X"0000";	--
	constant NULL2_C			: std_logic_vector(15 downto 0) := X"1111";	-- 
	constant SYNCH_C			: std_logic_vector(15 downto 0) := X"AA99";	--
	constant SYNCL_C			: std_logic_vector(15 downto 0) := X"5566";	--
	constant CMD_WR_GEN1_C	: std_logic_vector(15 downto 0) := X"3261";	-- 
	constant CMD_WR_GEN2_C	: std_logic_vector(15 downto 0) := X"3281";	-- 
	constant CMD_WR_CMD_C	: std_logic_vector(15 downto 0) := X"30A1";	-- 
	constant CMD_WR_MOD_C	: std_logic_vector(15 downto 0) := X"3301";	-- 
	constant CMD_IPROG_C		: std_logic_vector(15 downto 0) := X"000E";	--
	constant BIT1X_C			: std_logic_vector(15 downto 0) := X"2100";	-- 
	constant BIT2X_C			: std_logic_vector(15 downto 0) := X"2900";	-- 	
	constant BIT4X_C			: std_logic_vector(15 downto 0) := X"3100";	-- 
	-- SPI commands
	constant FASTREAD_C		: std_logic_vector( 7 downto 0)	:= X"0B";	-- 1x
	constant DUALREAD_C		: std_logic_vector( 7 downto 0)	:= X"3B";	-- 2x
	constant QUADREAD_C		: std_logic_vector( 7 downto 0)	:= X"6B";	-- 4x

	--
   type states_t is (IDLE, SYNC_H, SYNC_L, GEN1_H, GEN1_L, GEN2_H, GEN2_L, NUL_H,
				NUL_L, MOD_H, MOD_L, RBT_H, RBT_L, NOOP_0, NOOP_1, NOOP_2, NOOP_3);

	signal state_s			: states_t;
	signal next_state_s	: states_t;

   signal icap_ce_r_s	: std_logic;
   signal icap_wr_r_s	: std_logic;
   signal icap_ce_s		: std_logic;
   signal icap_wr_s		: std_logic;
   signal icap_i_r_s		: std_logic_vector(15 downto 0);
   signal icap_i_s		: std_logic_vector(15 downto 0);
	signal modereg_s		: std_logic_vector(15 downto 0);
	signal spi_cmd_s		: std_logic_vector( 7 downto 0);

begin

	ICAP_SPARTAN6_inst : ICAP_SPARTAN6
	port map (
		CLK	=> clock_i,				-- 1-bit input: Clock input
		CE		=> icap_ce_s,			-- 1-bit input: Active-Low ICAP Enable input
		I		=> icap_i_s,			-- 16-bit input: Configuration data input bus
		WRITE	=> icap_wr_s			-- 1-bit input: Read/Write control input
	);

	spi_cmd_s	<= FASTREAD_C	when bit_g = 1	else
						DUALREAD_C	when bit_g = 2	else
						QUADREAD_C;

	modereg_s	<= BIT1X_C		when bit_g = 1	else
						BIT2X_C		when bit_g = 2	else
						BIT4X_C;

	-- assign values
	process(clock_i)
	begin
		if rising_edge(clock_i) then
			-- First we order the bits according to UG380 Table2-5 page 37, as specified in page 126
			icap_i_s(0)		<= icap_i_r_s(7);  
			icap_i_s(1)		<= icap_i_r_s(6);
			icap_i_s(2)		<= icap_i_r_s(5);
			icap_i_s(3)		<= icap_i_r_s(4);
			icap_i_s(4)		<= icap_i_r_s(3);  
			icap_i_s(5)		<= icap_i_r_s(2);
			icap_i_s(6)		<= icap_i_r_s(1);
			icap_i_s(7)		<= icap_i_r_s(0);
			icap_i_s(8)		<= icap_i_r_s(15);  
			icap_i_s(9)		<= icap_i_r_s(14);
			icap_i_s(10)	<= icap_i_r_s(13);
			icap_i_s(11)	<= icap_i_r_s(12);
			icap_i_s(12)	<= icap_i_r_s(11);  
			icap_i_s(13)	<= icap_i_r_s(10);
			icap_i_s(14)	<= icap_i_r_s(9);
			icap_i_s(15)	<= icap_i_r_s(8);
			icap_wr_s		<= icap_wr_r_s;
			icap_ce_s		<= icap_ce_r_s;
		end if;
	end process;

	-- next state
	process(clock_i)
	begin
		if rising_edge(clock_i) then
			if reset_i = '1' then
				state_s <= IDLE;
			else
				state_s <= next_state_s;
			end if;
		end if;
	end process;

	-- FSM
	process (state_s, start_i, spi_addr_i)
	begin
		case state_s is
			when IDLE =>
				if start_i = '1' then
					next_state_s	<= SYNC_H;
					icap_ce_r_s		<= '0';
					icap_wr_r_s		<= '0';
					icap_i_r_s		<= SYNCH_C;
				else
					next_state_s	<= IDLE;
					icap_ce_r_s		<= '1';
					icap_wr_r_s		<= '1';
					icap_i_r_s		<= DUMMY_C;
				end if;
			when SYNC_H =>
				next_state_s	<= SYNC_L;
				icap_ce_r_s		<= '0';
				icap_wr_r_s		<= '0';
				icap_i_r_s		<= SYNCL_C;
			when SYNC_L =>
				next_state_s	<= NUL_H;
				icap_ce_r_s		<= '0';
				icap_wr_r_s		<= '0';
				icap_i_r_s		<= CMD_WR_CMD_C;
			when NUL_H =>
				next_state_s	<= GEN1_H;
				icap_ce_r_s		<= '0';
				icap_wr_r_s		<= '0';
				icap_i_r_s		<= NULL1_C;
			when GEN1_H =>
				next_state_s	<= GEN1_L;
				icap_ce_r_s		<= '0';
				icap_wr_r_s		<= '0';
				icap_i_r_s		<= CMD_WR_GEN1_C;
			when GEN1_L =>
				next_state_s	<= GEN2_H;
				icap_ce_r_s		<= '0';
				icap_wr_r_s		<= '0';
				icap_i_r_s		<= spi_addr_i(15 downto 0);
			when GEN2_H =>
				next_state_s	<= GEN2_L;
				icap_ce_r_s		<= '0';
				icap_wr_r_s		<= '0';
				icap_i_r_s		<= CMD_WR_GEN2_C;
			when GEN2_L =>
				next_state_s	<= MOD_H;
				icap_ce_r_s		<= '0';
				icap_wr_r_s		<= '0';
				icap_i_r_s		<= spi_cmd_s & spi_addr_i(23 downto 16);
			when MOD_H =>
				next_state_s	<= MOD_L;
				icap_ce_r_s		<= '0';
				icap_wr_r_s		<= '0';
				icap_i_r_s		<= CMD_WR_MOD_C;
			when MOD_L =>
				next_state_s	<= NUL_L;
				icap_ce_r_s		<= '0';
				icap_wr_r_s		<= '0';
				icap_i_r_s		<= modereg_s;
			when NUL_L =>
				next_state_s	<= RBT_H;
				icap_ce_r_s		<= '0';
				icap_wr_r_s		<= '0';
				icap_i_r_s		<= CMD_WR_CMD_C;
			when RBT_H =>
				next_state_s	<= RBT_L;
				icap_ce_r_s		<= '0';
				icap_wr_r_s		<= '0';
				icap_i_r_s		<= CMD_IPROG_C;
			when RBT_L =>
				next_state_s	<= NOOP_0;
				icap_ce_r_s		<= '0';
				icap_wr_r_s		<= '0';
				icap_i_r_s		<= NOOP_C;
			when NOOP_0 =>
				next_state_s	<= NOOP_1;
				icap_ce_r_s		<= '0';
				icap_wr_r_s		<= '0';
				icap_i_r_s		<= NOOP_C;
			when NOOP_1 =>
				next_state_s	<= NOOP_2;
				icap_ce_r_s		<= '0';
				icap_wr_r_s		<= '0';
				icap_i_r_s		<= NOOP_C;
			when NOOP_2 =>
				next_state_s	<= NOOP_3;
				icap_ce_r_s		<= '0';
				icap_wr_r_s		<= '0';
				icap_i_r_s		<= NOOP_C;
			when NOOP_3 =>
				next_state_s	<= IDLE;
				icap_ce_r_s		<= '0';
				icap_wr_r_s		<= '0';
				icap_i_r_s		<= NULL2_C;
--			when others =>
--				next_state_s	<= IDLE;
--				icap_ce_r_s		<= '1';
--				icap_wr_r_s		<= '1';
--				icap_i_r_s		<= NULL2_C;
		end case;
	end process;

end architecture;
