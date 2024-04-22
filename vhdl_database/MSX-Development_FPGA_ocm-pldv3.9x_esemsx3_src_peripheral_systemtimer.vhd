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
-- 2020/03/01  t.hara
--   Added "Clear System Timer Function at write E6h"
-- 2021/02/22  KdL
--   3.911usec generator with LFSR counter
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
        wrt     : in    std_logic;
        adr     : in    std_logic_vector( 15 downto 0 );
        dbi     : out   std_logic_vector(  7 downto 0 );
        dbo     : in    std_logic_vector(  7 downto 0 )
    );
end system_timer;

architecture rtl of system_timer is

    constant    c_div_start_pt      : std_logic_vector(  6 downto 0 ) := "0101001"; -- x"29" / LFSR count = 84
    signal      ff_div_counter      : std_logic_vector(  6 downto 0 ) := c_div_start_pt;
    signal      ff_div_counter_d0   : std_logic;
    signal      ff_freerun_counter  : std_logic_vector( 15 downto 0 );
    signal      ff_ack              : std_logic;
    signal      w_3_911usec         : std_logic := '1';
    signal      w_counter_reset     : std_logic;

begin

    ----------------------------------------------------------------
    --  out assignment
    ----------------------------------------------------------------
    dbi <=  ff_freerun_counter(  7 downto 0 ) when( adr(0) = '0' )else
            ff_freerun_counter( 15 downto 8 );

    ack <=  ff_ack;

    ----------------------------------------------------------------
    --  3.911usec generator with LFSR counter
    ----------------------------------------------------------------
    ff_div_counter_d0 <= ff_div_counter(6) xnor ff_div_counter(5);

    w_3_911usec <= '1' when( ff_div_counter = c_div_start_pt )else
                   '0';

    w_counter_reset <= req and wrt and (not adr(0));

    process( reset, clk21m )
    begin
        if( reset = '1' )then
            ff_div_counter <= c_div_start_pt;
        elsif( clk21m'event and clk21m = '1' )then
            if( w_counter_reset = '1' )then
                ff_div_counter <= c_div_start_pt;
            elsif( w_3_911usec = '1' )then
                ff_div_counter <= (others => '0');
            else
                ff_div_counter <= ff_div_counter(5 downto 0) & ff_div_counter_d0;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------
    --  register write
    ----------------------------------------------------------------
    process( reset, clk21m )
    begin
        if( reset = '1' )then
            ff_freerun_counter <= (others => '0');
        elsif( clk21m'event and clk21m = '1' )then
            if( w_counter_reset = '1' )then
                ff_freerun_counter <= (others => '0');
            elsif( w_3_911usec = '1' )then
                ff_freerun_counter <= ff_freerun_counter + 1;
            else
                -- hold
            end if;
        end if;
    end process;

    ----------------------------------------------------------------
    --  ack
    ----------------------------------------------------------------
    process( reset, clk21m )
    begin
        if( reset = '1' )then
            ff_ack <= '0';
        elsif( clk21m'event and clk21m = '1' )then
            ff_ack <= req;
        end if;
    end process;

end rtl;
