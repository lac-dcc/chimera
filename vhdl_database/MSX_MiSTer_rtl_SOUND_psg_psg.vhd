-- 
-- psg.vhd
--   Programmable Sound Generator (AY-3-8910/YM2149)
--   Revision 1.00
-- 
-- Copyright (c) 2006 Kazuhiro Tsujikawa (ESE Artists' factory)
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
-- fix caro 17/05/2013
--
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;

entity psg is
    port(
        clk21m      : in    std_logic;
        reset       : in    std_logic;
        clkena      : in    std_logic;
        req         : in    std_logic;
        ack         : out   std_logic;
        wrt         : in    std_logic;
        adr         : in    std_logic_vector( 15 downto 0 );
        dbi         : out   std_logic_vector(  7 downto 0 );
        dbo         : in    std_logic_vector(  7 downto 0 );

        joya        : in    std_logic_vector(  5 downto 0 );
        stra        : out   std_logic;
        joyb        : in    std_logic_vector(  5 downto 0 );
        strb        : out   std_logic;

        kana        : out   std_logic;
        cmtin       : in    std_logic;
        keymode     : in    std_logic;

        wave        : out   std_logic_vector(  9 downto 0 ) -- fix caro
 );
end psg;

architecture rtl of psg is

	signal rega         : std_logic_vector(  7 downto 0 );
	signal regb         : std_logic_vector(  7 downto 0 );
	signal cha,chb,chc  : std_logic_vector(  7 downto 0 );
	 
	component ym2149
		port (
			CLK       : in    std_logic;
			CE        : in    std_logic;
			RESET     : in    std_logic;
			BDIR      : in    std_logic;
			BC        : in    std_logic;
			DI        : in    std_logic_vector(  7 downto 0 );
			DO        : out   std_logic_vector(  7 downto 0 );
			CHANNEL_A : out   std_logic_vector(  7 downto 0 );
			CHANNEL_B : out   std_logic_vector(  7 downto 0 );
			CHANNEL_C : out   std_logic_vector(  7 downto 0 );
			
			SEL       : in    std_logic;
			MODE      : in    std_logic;
			
			IOA_in    : in    std_logic_vector(  7 downto 0 );
			IOA_out   : out   std_logic_vector(  7 downto 0 );
			
			IOB_in    : in    std_logic_vector(  7 downto 0 );
			IOB_out   : out   std_logic_vector(  7 downto 0 )
		);
	end component;
	 

begin

	ym2149_inst : ym2149
	port map
	(
		CLK       => clk21m,
		CE        => clkena,
		RESET     => reset,
		BDIR      => not adr(1) and wrt and req,
		BC        => not adr(0),
		DI        => dbo,
		DO        => dbi,
		CHANNEL_A => cha,
		CHANNEL_B => chb,
		CHANNEL_C => chc,
		
		SEL       => '1',
		MODE      => '0',
		
		IOA_in    => rega,
		IOA_out   => open,
		
		IOB_in    => regb,
		IOB_out   => regb
	);
	
	wave <= ("00"&cha)+("00"&chb)+("00"&chc);
	ack <= req;
	
	rega(5 downto 0) <= joya when regb(6) = '0' else joyb;
	rega(6) <= keymode;     -- keyboard mode : 1=jis
	rega(7) <= cmtin;       -- cassete voice input : always '0' on msx turbor

	strb <= regb(5);
	stra <= regb(4);
	kana <= regb(7);

end rtl;
