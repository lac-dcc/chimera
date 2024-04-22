-- The 3-Clause BSD License
-- 
-- SPDX short identifier: BSD-3-Clause
-- 
-- Copyright 2016-2017 Trenz Electronic GmbH
-- 
-- Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
-- 
-- 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
-- 
-- 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
-- 
-- 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
-- 
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
--------------------------------------------------------------------------------
entity rpm_check is
generic (
	C_REF_RPM				: integer		:= 3000;
	C_TOLERANCE				: integer		:= 100;
	C_LEDS					: integer		:= 4;
	C_START_DELAY           : integer		:= 100000000;
	C_TDATA_WIDTH			: integer		:= 16
);
port (
    mode_in                 : in  STD_LOGIC_VECTOR(31 downto 0);
    led_in                  : in  STD_LOGIC;
    ss_in                   : in  STD_LOGIC;
    restart_in              : in  STD_LOGIC;
    tolerance_in            : in  STD_LOGIC_VECTOR(15 downto 0);
	-- Input stream
	aclk					: in  STD_LOGIC;
	rpm_data				: in  STD_LOGIC_VECTOR(C_TDATA_WIDTH-1 downto 0);
	button					: in  STD_LOGIC;
	led						: out STD_LOGIC_VECTOR(C_LEDS-1 downto 0)
);
end rpm_check;
--------------------------------------------------------------------------------
architecture arch_imp of rpm_check is
--------------------------------------------------------------------------------
type sm_state_type is (ST_IDLE, ST_WAIT, ST_CHECK, ST_ERR);
signal sm_state     : sm_state_type := ST_IDLE;

signal btn_in		: STD_LOGIC;
signal mode         : UNSIGNED(31 downto 0);
signal rpm          : SIGNED(C_TDATA_WIDTH-1 downto 0);
signal wait_cnt     : integer range 0 to C_START_DELAY-1;
signal tolerance    : SIGNED(15 downto 0);
signal restart      : STD_LOGIC;   
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
process(aclk)
begin
	if(aclk = '1' and aclk'event)then
		btn_in	   <= button;
	    led(3)     <= led_in;
		led(1)     <= ss_in;
	    rpm        <= SIGNED(rpm_data);
	    mode       <= UNSIGNED(mode_in);
	    tolerance  <= SIGNED(tolerance_in);
	    restart    <= restart_in;
	    case sm_state is
	       when ST_IDLE =>
               led(0)		<= '0';
               --led(1)       <= '0';
			   
               wait_cnt     <= 0;
	           --if(mode = TO_UNSIGNED(1,32))then
	           if((mode = TO_UNSIGNED(1,32)) or (mode = TO_UNSIGNED(4,32)))then
	               sm_state    <= ST_WAIT;
	               led(2)		<= '1';
	           else
                   led(2)		<= '0';
	           end if;
	       when ST_WAIT =>
	           if(wait_cnt = C_START_DELAY-1)then
	               sm_state    <= ST_CHECK;
    	           led(2)	   <= '0';
    	       else
    	           wait_cnt    <= wait_cnt + 1;
	           end if;
	       when ST_CHECK =>
	           --if(abs(rpm - TO_SIGNED(C_REF_RPM,32)) > TO_SIGNED(C_TOLERANCE,C_TDATA_WIDTH))then
	           if(abs(rpm - TO_SIGNED(C_REF_RPM,32)) > resize(tolerance,C_TDATA_WIDTH))then
	               sm_state    <= ST_ERR;
	               led(0)		<= '1';
                   --led(1)        <= '1';
	           elsif(not ((mode = TO_UNSIGNED(1,32)) or (mode = TO_UNSIGNED(4,32))))then
	               sm_state    <= ST_IDLE;
	           end if;
	       when ST_ERR =>
	           if((btn_in = '1') or (restart = '1') or (not ((mode = TO_UNSIGNED(1,32)) or (mode = TO_UNSIGNED(4,32)))))then
	               sm_state    <= ST_IDLE;
	           end if;
	    end case;
	end if;
end process;
--------------------------------------------------------------------------------
end arch_imp;
