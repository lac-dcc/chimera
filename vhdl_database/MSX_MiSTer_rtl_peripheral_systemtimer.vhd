--
-- systemtimer.vhd
--   System Timer for MSXturboR (3.911usec increment freerun counter)
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

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;

entity system_timer is
    port(
        clk21m  : in    std_logic;
        reset   : in    std_logic;
        req     : in    std_logic;
        ack     : out   std_logic;
        adr     : in    std_logic_vector( 15 downto 0 );
        dbi     : out   std_logic_vector(  7 downto 0 );
        dbo     : in    std_logic_vector(  7 downto 0 )
    );
end system_timer;

architecture rtl of system_timer is
    signal      ff_div_counter      : std_logic_vector(  6 downto 0 );
    signal      ff_freerun_counter  : std_logic_vector( 15 downto 0 );
    signal      ff_ack              : std_logic;
    signal      w_3_911usec         : std_logic;
    constant    c_div_start_pt      : std_logic_vector(  6 downto 0 ) := "1010011";
begin

    ----------------------------------------------------------------
    --  out assignment
    ----------------------------------------------------------------
    dbi <=  ff_freerun_counter(  7 downto 0 )   when( adr(0) = '0' )else
            ff_freerun_counter( 15 downto 8 );
    ack <=  ff_ack;

    ----------------------------------------------------------------
    --  3.911usec generator
    ----------------------------------------------------------------
    w_3_911usec <=  '1' when( ff_div_counter = "0000000" )else
                    '0';

    process( reset, clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( reset = '1' )then
                ff_div_counter <=   (others => '0');
	    else
                if( w_3_911usec = '1' )then
                    ff_div_counter <=   c_div_start_pt;
                else
                    ff_div_counter <=   ff_div_counter - 1;
                end if;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------
    --  register write
    ----------------------------------------------------------------
    process( reset, clk21m )
    begin
        if( rising_edge(clk21m) )then
            if( reset = '1' )then
                ff_freerun_counter <= (others => '0');
	    else
                if( w_3_911usec = '1' )then
                    ff_freerun_counter <= ff_freerun_counter + 1;
                else
                    -- hold
                end if;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------
    --  ack
    ----------------------------------------------------------------
    process( reset, clk21m )
    begin
        if( clk21m'event and clk21m = '1' )then
            if( reset = '1' )then
                ff_ack <= '0';
	    else
                ff_ack <= req;
            end if;
        end if;
    end process;
end rtl;
