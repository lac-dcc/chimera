-- 
-- vdp_wait_control.vhd
--   VDP wait controller for VDP command
--   Revision 1.00
-- 
-- Copyright (c) 2008 Takayuki Hara
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

LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY VDP_WAIT_CONTROL IS
	PORT(
		RESET			: IN	STD_LOGIC;
		CLK21M			: IN	STD_LOGIC;

		VDP_COMMAND		: IN	STD_LOGIC_VECTOR(  7 DOWNTO 4 );
		HISPEED_MODE	: IN	STD_LOGIC;
		DRIVE			: IN	STD_LOGIC;

		ACTIVE			: OUT	STD_LOGIC
	);
END VDP_WAIT_CONTROL;

ARCHITECTURE RTL OF VDP_WAIT_CONTROL IS

	SIGNAL FF_WAIT_CNT		: STD_LOGIC_VECTOR( 15 DOWNTO 0 );

	TYPE WAIT_TABLE_T IS ARRAY( 0 TO 15 ) OF STD_LOGIC_VECTOR( 15 DOWNTO 0 );
	CONSTANT C_WAIT_TABLE : WAIT_TABLE_T :=(
		X"8000",	-- STOP
		X"8000",	-- XXXX
		X"8000",	-- XXXX
		X"8000",	-- XXXX
		X"8000",	-- POINT
		X"8000",	-- PSET
		X"8000",	-- SRCH
		X"1000",	-- LINE
		X"1339",	-- LMMV
		X"1490",	-- LMMM
		X"8000",	-- LMCM
		X"8000",	-- LMMC
		X"13E2",	-- HMMV
		X"1395",	-- HMMM
		X"1708",	-- YMMM
		X"8000"		-- HMMC
	);
BEGIN

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_WAIT_CNT <= (OTHERS => '0');
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DRIVE = '1' )THEN
				FF_WAIT_CNT <= ('0' & FF_WAIT_CNT(14 DOWNTO 0)) + C_WAIT_TABLE( CONV_INTEGER( VDP_COMMAND ) );
			ELSE
			END IF;
		END IF;
	END PROCESS;

	ACTIVE <= FF_WAIT_CNT(15) OR HISPEED_MODE;
END RTL;
