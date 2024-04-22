-------------------------------------------------------------------------------
--
-- Title       : rom_twiddle_int
-- Design      : FFTK
-- Author      : Kapitanov Alexander
-- Company     :
--
-- Description : Integer Twiddle factor (sin/cos)
--
-------------------------------------------------------------------------------
--
--	Version 1.0  01.03.2018
--    Description: Twiddle factor in ROMs for FFT/IFFT.
-- 
--
-- Example: NFFT = 16
--    ---------------------------------
--    | Stage | DEPTH | COEFS | RAMBS |
--    ---------------------------------
--    |   15  | 512   | 32K   |  TAY  |
--    |   14  | 512   | 16K   |  TAY  |
--    |   13  | 512   |  8K   |  TAY  |
--    |   12  | 512   |  4K   |  TAY  |
--    |   11  | 512** |  2K   |  TAY  |
--    |   10  | 512   |  1K   |   1   |
--    |    9  | 256   | 512   |   0   |
--    |    8  | 128   | 256   |  LUT  |
--    |    7  |  64   | 128   |  LUT  |
--    |    6  |  32   |  64   |  LUT  |
--    |    5  |  16   |  32   |  LUT  |
--    |    4  |   8   |  16   |  LUT  |
--    |    3  |   4   |   8   |  LUT  |
--    |    2  |   2   |   4   |  LUT  |
--    |    1  |   1   |   2   |   X   |
--    |    0  |   1*  |   1   |   X   |
--    ---------------------------------
-- 
-- Example: NFFT = 11
--   ---------------------------------
--   | Stage | DEPTH | COEFS | RAMBS |
--   ---------------------------------
--   |   10  |  512  |  1K   |  RAMB |
--   |   9   |  256  | 512   |  LUT  |
--   |   8   |  128  | 256   |  LUT  |
--   |   7   |   64  | 128   |  LUT  |
--   |   6   |   32  |  64   |  LUT  |
--   |   5   |   16  |  32   |  LUT  |
--   |   4   |    8  |  16   |  LUT  |
--   |   3   |    4  |   8   |  LUT  |
--   |   2   |    2  |   4   |  LUT  |
--   |   1   |    1  |   2   |   X   |
--   |   0   |    1* |   1   |   X   |
--   ----------------------------------
--
-- * - first and second stages don't need ROM. 
--     STAGE = 0: {0,1}; 
--     STAGE = 1: {0,1} and {-1,0};
-- ** - Taylor scheme (1 RAMB)
--
-- AWD - data width = 16-25(27) for integer twiddle factor
-- 
-- Delay: IF (STAGE < 11): delay - 2 taps,
--        ELSE: delay - 7 taps.
--
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--
--	GNU GENERAL PUBLIC LICENSE
--  Version 3, 29 June 2007
--
--	Copyright (c) 2018 Kapitanov Alexander
--
--  This program is free software: you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.
--
--  You should have received a copy of the GNU General Public License
--  along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
--  THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY
--  APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT 
--  HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY 
--  OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, 
--  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
--  PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM 
--  IS WITH YOU.  SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF 
--  ALL NECESSARY SERVICING, REPAIR OR CORRECTION. 
-- 
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;  
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use ieee.math_real.all;

entity rom_twiddle_int is 
	generic(
		AWD			: integer:=16;		--! Sin/cos MSB (Magnitude = 2**(Amag-1))
		NFFT		: integer:=16;		--! FFT lenght
		STAGE 		: integer:=15;		--! FFT stages
		USE_MLT		: boolean:=FALSE;	--! use DSP48 for calculation PI * CNT		
		XSER		: string:="OLD"	    --! FPGA family: for 6/7 series: "OLD"; for ULTRASCALE: "NEW";	
	);
	port(		
		CLK			: in std_logic; --! DSP clock
		RST			: in std_logic; --! Common reset
		WW_EN		: in std_logic; --! Enable strobe
		WW_RE		: out std_logic_vector(AWD-1 downto 0); --! Twiddle factor (Re)		
		WW_IM		: out std_logic_vector(AWD-1 downto 0)  --! Twiddle factor (Im)		
	);
end rom_twiddle_int;

architecture rom_twiddle_int of rom_twiddle_int is 
	
	---- Calculate ROM depth ----
	function find_depth return integer is
		variable dpt : integer:=0;
	begin
		if (STAGE > 0) and (STAGE < 11) then
			dpt := STAGE-1;
		elsif (STAGE < 1) then
			dpt := 0;
		else
			dpt := 9;
		end if;
		return dpt;
	end find_depth;

	constant DEPTH : integer:=find_depth;

	---- Calculate Twiddle factor ----
	type array_dbl is array (2**DEPTH-1 downto 0) of std_logic_vector(2*AWD-1 downto 0);
	function rom_twiddle(xN, xMAG : integer) return array_dbl is
		variable pi_std : real:=0.0;
		variable mg_std : real:=0.0;
		variable sc_int : array_dbl;
		
		variable re_int : integer:=0;
		variable im_int : integer:=0;
	begin
		if (xMAG < 18) then
			mg_std := (2.0 ** (xMAG-1)) - 1.0;
		else
			mg_std := (2.0 ** (xMAG-2)) - 1.0;
		end if;
		for ii in 0 to 2**xN-1 loop
			pi_std := (real(ii) * MATH_PI)/(2.0**(xN+1));
			
			re_int := INTEGER(mg_std*COS(pi_std));	
			im_int := INTEGER(mg_std*SIN(-pi_std));

			sc_int(ii)(2*AWD-1 downto 1*AWD) := STD_LOGIC_VECTOR(CONV_SIGNED(im_int, AWD));
			sc_int(ii)(1*AWD-1 downto 0*AWD) := STD_LOGIC_VECTOR(CONV_SIGNED(re_int, AWD));	
		end loop;
		
		return sc_int;		
	end rom_twiddle;
	
	constant ARR_DBL : array_dbl:=rom_twiddle(DEPTH, AWD);
	
	---- Common signal declaration ----
	signal ram 			: std_logic_vector(2*AWD-1 downto 0);
	signal ww_rom		: std_logic_vector(2*AWD-1 downto 0);
	
	signal div 			: std_logic;
	signal cnt			: std_logic_vector(STAGE-1 downto 0);
	signal addr 		: std_logic_vector(STAGE-2 downto 0);

begin

-- Twiddle Re/Im parts calculating --
pr_ww: process(clk) is
begin
	if rising_edge(clk) then
		if (div = '0') then
			ww_rom <= ram;
		else      
			ww_rom(2*AWD-1 downto 1*AWD) <= not ram(1*AWD-1 downto 0*AWD) + '1';
			ww_rom(1*AWD-1 downto 0*AWD) <= ram(2*AWD-1 downto 1*AWD);
		end if;
	end if;
end process; 

---- Counter / Address increment ----
xCNT: if (STAGE > 0) generate	
	addr <= cnt(STAGE-2 downto 0);		
	div  <= cnt(STAGE-1) when rising_edge(clk);

	---- Read counter signal ----
	pr_cnt: process(clk) is
	begin
		if rising_edge(clk) then
			if (rst = '1') then
				cnt	<=	(others	=>	'0');			
			elsif (ww_en = '1') then
				cnt <= cnt + '1';
			end if;
		end if;
	end process;
end generate;

---- Middle stage ----
xSTD: if (STAGE < 11) generate		

	ww_re <= ww_rom(1*AWD-1 downto 0*AWD);	
	ww_im <= ww_rom(2*AWD-1 downto 1*AWD);
	
	--ram <= ARR_DBL(conv_integer(unsigned(addr))) when rising_edge(clk) and WW_EN = '1';	
	ram <= ARR_DBL(conv_integer(unsigned(addr))) when rising_edge(clk);	
end generate;		

---- Long stage ----
xLNG: if (STAGE >= 11) generate	 	
	
	signal addrx		: std_logic_vector(8 downto 0);	
	signal count 		: std_logic_vector(STAGE-11 downto 0);
	signal cntzz 		: std_logic_vector(STAGE-11 downto 0);
begin	
	addrx <= addr(STAGE-2 downto STAGE-10);	
	---- Read data from RAMB ----
	ram <= ARR_DBL(conv_integer(unsigned(addrx))) when rising_edge(clk);
	
	count <= addr(STAGE-11 downto 0);
	
	cntzz <= count when rising_edge(clk);	
	
	xTAY_DSP: entity work.row_twiddle_tay
		generic map (
			AWD			=> AWD,
			XSER  		=> XSER,
			USE_MLT		=> USE_MLT,
			ii			=> STAGE-11
		)
		port map (
			rom_ww		=> ww_rom,		   
			rom_re		=> ww_re,			
			rom_im		=> ww_im,			
			rom_cnt		=> cntzz,	
			
			clk 		=> clk,
			rstp  		=> rst
		);	
	--ww <= ww_o;	
end generate;		

end rom_twiddle_int;