-- 
-- systemtimer.vhd
--   System Timer for MSXturboR (3.911usec increment freerun counter)
--   3.90478 for OCM DE1 (21 MHz)
--   Revision 1.00
-- 
-- Copyright (c) 2007 Takayuki Hara.
-- All rights reserved.
-- 
-- Redistribution and use of this source code or any derivative works, are 
-- permitted provided that the following conditions are met:
--
-- 1. Redistributions of source code must retain the above copyright notice, 
--    this list of conditions and the following disclaimer.
-- 2. Redistributions in binary form must reproduce the above copyright 
--    notice, this list of conditions and the following disclaimer in the 
--    documentation and/or other materials provided with the distribution.
-- 3. Redistributions may not be sold, nor may they be used in a commercial 
--    product or activity without specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
-- "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED 
-- TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR 
-- CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
-- EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
-- PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
-- OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
-- WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR 
-- OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF 
-- ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--

LIBRARY	IEEE;
	USE	IEEE.STD_LOGIC_1164.ALL;
	USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY SYSTEM_TIMER IS
	PORT(
		CLK21M	: IN	STD_LOGIC;
		RESET	: IN	STD_LOGIC;
		REQ		: IN	STD_LOGIC;
		ACK		: OUT	STD_LOGIC;
		ADR		: IN	STD_LOGIC_VECTOR( 15 DOWNTO 0 );
		DBI		: OUT	STD_LOGIC_VECTOR(  7 DOWNTO 0 );
		DBO		: IN	STD_LOGIC_VECTOR(  7 DOWNTO 0 )
	);
END	SYSTEM_TIMER;

ARCHITECTURE RTL OF SYSTEM_TIMER IS
	SIGNAL		FF_DIV_COUNTER		: STD_LOGIC_VECTOR(  6 DOWNTO 0 );
	SIGNAL		FF_FREERUN_COUNTER	: STD_LOGIC_VECTOR( 15 DOWNTO 0 );
	SIGNAL		FF_ACK			: STD_LOGIC;
	SIGNAL		W_3_911USEC		: STD_LOGIC;
--	CONSTANT	C_DIV_START_PT	: STD_LOGIC_VECTOR(  6 DOWNTO 0  ) := "1010011"; -- 83 for 21.47
	CONSTANT	C_DIV_START_PT	: STD_LOGIC_VECTOR( 6 DOWNTO 0 ) := "1010001"; -- 81 for OCM DE1 21 MHz
BEGIN

----------------------------------------------------------------
--	OUT ASSIGNMENT
----------------------------------------------------------------
	DBI	<=	FF_FREERUN_COUNTER(  7 DOWNTO 0 ) WHEN( ADR(0) = '0' )ELSE
			FF_FREERUN_COUNTER( 15 DOWNTO 8 );
	ACK	<=	FF_ACK;

----------------------------------------------------------------
--	3.911USEC GENERATOR
----------------------------------------------------------------
	W_3_911USEC <=	'1' WHEN( FF_DIV_COUNTER = "0000000" )ELSE
					'0';

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_DIV_COUNTER <= (OTHERS => '0');
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( W_3_911USEC = '1' )THEN
				FF_DIV_COUNTER <= C_DIV_START_PT;
			ELSE
				FF_DIV_COUNTER <= FF_DIV_COUNTER - 1;
			END IF;
		END IF;
	END PROCESS;

----------------------------------------------------------------
--	REGISTER WRITE
----------------------------------------------------------------
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_FREERUN_COUNTER <= (OTHERS => '0');
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( W_3_911USEC = '1' )THEN
				FF_FREERUN_COUNTER <= FF_FREERUN_COUNTER + 1;
			ELSE
				-- HOLD
			END IF;
		END IF;
	END PROCESS;

----------------------------------------------------------------
--	ACK
----------------------------------------------------------------
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_ACK <= '0';
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			FF_ACK <= REQ;
		END IF;
	END PROCESS;
END RTL;
