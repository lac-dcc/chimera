-------------------------------------------------------------------------------
--
-- Title       : row_twiddle_tay
-- Design      : fpfftk
-- Author      : Kapitanov
-- Company     : 
--
-- Description : Integer Twiddle factor w/ Taylor scheme
--
-------------------------------------------------------------------------------
--
--	Version 1.0  11.02.2018
--
-- 		Data decoder for twiddle factor.
-- 		Main algorithm for calculation FFT coefficients	by Taylor scheme.
--
--		Wcos(x) = cos(x)+sin(x)*pi*cnt(x)/NFFT; *
--		Wsin(x) = sin(x)-cos(x)*pi*cnt(x)/NFFT;
--
--		MPX = (M_PI * CNT) is always has [15:0] bit field!
--
--		** if NFFT > 512K just use 2D FFT algorithm!!
--				
--		RAMB (Width * Depth) is constant value and equals 32x1K,
-- 
--		Taylor alrogithm takes 3 Mults and 2 Adders in INT format. 
--
-- Summary:
--		Twiddle WW generator takes 2 DSP48s and 2 RAMBs 18K.
--
--    -----------------------
--    | ii  | COEFS | NFFT  |
--    -----------------------
--    |  0  |   2K  |   4K  |
--    |  1  |   4K  |   8K  |
--    |  2  |   8K  |  16K  |
--    |  3  |  16K  |  32K  |
--    |  4  |  32K  |  64K  |
--    |  5  |  64K  | 128K  |
--    |  6  | 128K  | 256K  |
--    |  7  | 256K  | 512K  |
--    -----------------------
--
-------------------------------------------------------------------------------
--  
--                       DSP48E1/2
--             __________________________
--            |                          |
--            |     MULT 18x25(27)       |
--   SIN/COS  | A   _____      ADD/SUB   |
--  --------->|--->|     |      _____    |
--   M_PI     | B  |  *  |---->|     |   | NEW SIN/COS
--  --------->|--->|_____|     |  +  | P |
--   COS/SIN  | C              |  /  |---|-->
--  --------->|--------------->|  -  |   |
--            |                |_____|   |
--            |                          |
--            |__________________________|
-- 
--             P = A[24:0]*B[17:0]+C[47:0] (7-series)
--             P = A[26:0]*B[17:0]+C[47:0] (ultrascale)
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

library unisim;
use unisim.vcomponents.dsp48e1;	
use unisim.vcomponents.dsp48e2;

entity row_twiddle_tay is
	generic (
		TD			: time:=0.5ns;	--! Simulation time	
		AWD			: integer:=16;	--! Sin/cos MSB (Mag = 2**Amag)		
		XSER		: string:="NEW"; --! FPGA family: for 6/7 series: "OLD"; for ULTRASCALE: "NEW"	
		USE_MLT		: boolean:=FALSE; --! use DSP48 for calculation PI * CNT
		ii			: integer:=2 --! 0, 1, 2, 3, 4, 5, 6, 7 
	);
	port (
		rom_ww		: in  std_logic_vector(2*AWD-1 downto 0); --! input data twiddle f.
		rom_re		: out std_logic_vector(AWD-1 downto 0); --! output real   
		rom_im		: out std_logic_vector(AWD-1 downto 0); --! output imag  
		rom_cnt		: in  std_logic_vector(ii downto 0); --! counter for rom		
		
		clk 		: in  std_logic; --! global clock
		rstp  		: in  std_logic	 --! negative reset
	);
end row_twiddle_tay;

architecture row_twiddle_tay of row_twiddle_tay is 

---------------- Calculate Data Width --------
function find_widthA return natural is
	variable ret_val : natural:=0;
begin
	if (XSER = "NEW") then 
		ret_val := 21;
	elsif (XSER = "OLD") then 
		ret_val := 23;
	end if;
	return ret_val; 
end function find_widthA;

function const_pi return integer is
	-- variable ret_val : std_logic_vector(15 downto 0);
	variable ret_val : integer:=0;
	variable del_val : integer:=0;
begin
	if (XSER = "NEW") then 
		del_val := 2;
	elsif (XSER = "OLD") then 
		del_val := 0;
	end if;
	-- ret_val := STD_LOGIC_VECTOR(CONV_UNSIGNED(INTEGER(MATH_PI * 2.0**(13-ii-del_val)), 16));
	ret_val := INTEGER(MATH_PI * 2.0**(13-ii-del_val));

	return ret_val; 
end function const_pi;

constant XSHIFT			: integer:=find_widthA;
-- constant MATHPI			: std_logic_vector(15 downto 0):=const_pi(XSER);
constant MATHPI			: integer:=const_pi;

signal mpi				: std_logic_vector(23 downto 00);
signal mpx				: std_logic_vector(17 downto 00);
signal cnt_exp			: std_logic_vector(07 downto 00);

signal sin_prod			: std_logic_vector(47 downto 00);
signal cos_prod			: std_logic_vector(47 downto 00);
	
signal cos_aa			: std_logic_vector(29 downto 00);
signal sin_aa			: std_logic_vector(29 downto 00);
signal cos_cc			: std_logic_vector(47 downto 00);
signal sin_cc			: std_logic_vector(47 downto 00);
	
signal cos_pdt			: std_logic_vector(48-XSHIFT downto 00);
signal sin_pdt			: std_logic_vector(48-XSHIFT downto 00);	

signal cos_rnd			: std_logic_vector(47-XSHIFT downto 00);
signal sin_rnd			: std_logic_vector(47-XSHIFT downto 00);

begin

rom_im <= cos_rnd(AWD-1 downto 0);
rom_re <= sin_rnd(AWD-1 downto 0);

---- Rounding +/-0.5 ----
pr_rnd: process(clk) is
begin
	if rising_edge(clk) then
		if (cos_pdt(0) = '1') then
			cos_rnd <= cos_pdt(48-xshift downto 1) + 1 after td;
		else
			cos_rnd <= cos_pdt(48-xshift downto 1) after td;
		end if;
		
		if (sin_pdt(0) = '1') then
			sin_rnd <= sin_pdt(48-xshift downto 1) + 1 after td;
		else
			sin_rnd <= sin_pdt(48-xshift downto 1) after td;
		end if;		
	end if;
end process;

cos_pdt <= cos_prod(47 downto XSHIFT-1);
sin_pdt <= sin_prod(47 downto XSHIFT-1);

---- Find counter for MATH_PI ----
cntexp: for jj in 0 to 6-ii generate 
	cnt_exp(7-jj) <= '0';
end generate;  
cnt_exp(ii downto 0) <= rom_cnt;-- when rising_edge(clk); 


---- USE ROM when calculation MATH_PI ----
xROM_PI: if (USE_MLT = FALSE) generate
	
	type std_logic_array_KKxNN is array (0 to (2**(ii+1))-1) of std_logic_vector(15 downto 0);	
	function read_rom(xx : integer) return std_logic_array_KKxNN is
		variable ramb_init  : std_logic_array_KKxNN;
	begin 
		for jj in 0 to (2**(xx+1)-1) loop
			ramb_init(jj) := conv_std_logic_vector(MATHPI*jj, 16);
		end loop;		
		return ramb_init;
	end read_rom;	 
	constant rom_pi 	: std_logic_array_KKxNN:=read_rom(ii);
begin
	mpi(15 downto 00) <= rom_pi(conv_integer(unsigned(cnt_exp))) after td when rising_edge(clk);	
	mpi(23 downto 16) <= x"00";
end generate;


---- USE DSP when calculation MATH_PI ----
xDSP_PI: if (USE_MLT = TRUE) generate

constant std_pi	: std_logic_vector(15 downto 00):=STD_LOGIC_VECTOR(CONV_UNSIGNED(MATHPI, 16));

begin
	pr_pi: process(clk) is
	begin
		if rising_edge(clk) then
			if (rstp = '1') then
				mpi <= (others=>'0') after td;
			else
				mpi <= unsigned(std_pi) * unsigned(cnt_exp) after td;
			end if;
		end if;
	end process;
end generate;

-------------------------------------------------------
---- DSP48 MACC PORTS: P = A[24:0]*B[17:0]+C[47:0] ----
-------------------------------------------------------

---- DATA FOR B PORT (18-bit) ----   
mpx <= '0' & mpi(17 downto 1);

---- DATA FOR A PORT (29-bit) ---- 
sin_aa(AWD-1 downto 0) <= rom_ww(1*AWD-1 downto 0*AWD);
cos_aa(AWD-1 downto 0) <= rom_ww(2*AWD-1 downto 1*AWD);

---- DATA FOR A PORT (29-bit) ----  
xPORT_A: for jj in 0 to 29-AWD generate 
	sin_aa(29-jj) <= rom_ww(1*AWD-1);
	cos_aa(29-jj) <= rom_ww(2*AWD-1);
end generate; 

---- DATA FOR C PORT (48-bit) ----  
XPORT_C: for jj in 0 to 47-AWD-XSHIFT generate 
	cos_cc(47-jj) <= cos_aa(AWD-1) after td when rising_edge(clk);
	sin_cc(47-jj) <= sin_aa(AWD-1) after td when rising_edge(clk);
end generate; 

cos_cc(AWD-1+XSHIFT downto 00+XSHIFT) <= cos_aa(AWD-1 downto 0) after td when rising_edge(clk);
sin_cc(AWD-1+XSHIFT downto 00+XSHIFT) <= sin_aa(AWD-1 downto 0) after td when rising_edge(clk);	
cos_cc(XSHIFT-1 downto 00) <= (others => '0');
sin_cc(XSHIFT-1 downto 00) <= (others => '0');
-------------------------------------------------------

x7SERIES: if (XSER = "OLD") generate
	MULT_ADD: DSP48E1 --   +/-(A*B+Cin)   -- for Virtex-6 and 7 families
		generic map (
			-- Feature Control Attributes: Data Path Selection
			A_INPUT 			=> "DIRECT", 
			B_INPUT 			=> "DIRECT", 
			USE_DPORT 			=> FALSE,
			-- Register Control Attributes: Pipeline Register Configuration
			ACASCREG 			=> 1,
			ADREG 				=> 0,
			ALUMODEREG 			=> 1,
			AREG 				=> 1,
			BCASCREG 			=> 1,
			BREG 				=> 1,
			CARRYINREG 			=> 1,
			CARRYINSELREG 		=> 1,
			CREG 				=> 1,
			DREG 				=> 0,
			INMODEREG 			=> 1,
			MREG 				=> 1,
			OPMODEREG 			=> 1,
			PREG 				=> 1 
		)
		port map (
			-- Data Product Output 
			P 					=> cos_prod,
			-- Cascade: 30-bit (each) input: Cascade Ports
			ACIN 				=> (others=>'0'),
			BCIN 				=> (others=>'0'),
			CARRYCASCIN 		=> '0',    
			MULTSIGNIN 			=> '0',    
			PCIN 				=> (others=>'0'),
			-- Control: 4-bit (each) input: Control Inputs/Status Bits
			ALUMODE 			=> (0 => '1', 1 => '1', others=>'0'),
			CARRYINSEL 			=> (others=>'0'),
			CLK 				=> clk, 
			INMODE 				=> (others=>'0'),
			OPMODE 				=> "0110101", 
			-- Data: 30-bit (each) input: Data Ports
			A 					=> sin_aa,    
			B 					=> mpx,    
			C 					=> cos_cc,         
			CARRYIN 			=> '0',
			D 					=> (others=>'0'),
			-- Reset/Clock Enable: 1-bit (each) input: Reset/Clock Enable Inputs
			CEA1 				=> '1',
			CEA2 				=> '1',
			CEAD 				=> '1',
			CEALUMODE 			=> '1',
			CEB1 				=> '1',
			CEB2 				=> '1',
			CEC 				=> '1',
			CECARRYIN 			=> '1',
			CECTRL 				=> '1',
			CED 				=> '1',
			CEINMODE 			=> '1',
			CEM 				=> '1',
			CEP 				=> '1',
			RSTA				=> rstp,
			RSTALLCARRYIN 		=> rstp,
			RSTALUMODE 			=> rstp,
			RSTB 				=> rstp,
			RSTC 				=> rstp,
			RSTCTRL 			=> rstp,
			RSTD 				=> rstp,
			RSTINMODE 			=> rstp,
			RSTM 				=> rstp,
			RSTP 				=> rstp 
		);

	MULT_SUB: DSP48E1 --   +/-(A*B+Cin)   -- for Virtex-6 and 7 families
		generic map (
			-- Feature Control Attributes: Data Path Selection
			A_INPUT 			=> "DIRECT",           
			B_INPUT 			=> "DIRECT",           
			USE_DPORT 			=> FALSE,              
			USE_MULT 			=> "MULTIPLY",
			-- Register Control Attributes: Pipeline Register Configuration
			ACASCREG 			=> 1,
			ADREG 				=> 0,
			ALUMODEREG 			=> 1,
			AREG 				=> 1,
			BCASCREG 			=> 1,
			BREG 				=> 1,
			CARRYINREG 			=> 1,
			CARRYINSELREG 		=> 1,
			CREG 				=> 1,
			DREG 				=> 0,
			INMODEREG 			=> 1,
			MREG 				=> 1,
			OPMODEREG 			=> 1,
			PREG 				=> 1 
		)
		port map (
			-- Data Product Output 
			P 					=> sin_prod,
			-- Cascade: 30-bit (each) input: Cascade Ports
			ACIN 				=> (others=>'0'),
			BCIN 				=> (others=>'0'),
			CARRYCASCIN 		=> '0',    
			MULTSIGNIN 			=> '0',    
			PCIN 				=> (others=>'0'),              
			-- Control: 4-bit (each) input: Control Inputs/Status Bits
			ALUMODE 			=> (others=>'0'),
			CARRYINSEL 			=> (others=>'0'),
			CLK 				=> clk, 
			INMODE 				=> (others=>'0'),
			OPMODE 				=> "0110101", 
			-- Data: 30-bit (each) input: Data Ports
			A 					=> cos_aa,    
			B 					=> mpx,    
			C 					=> sin_cc,         
			CARRYIN 			=> '0',
			D 					=> (others=>'0'),
			-- Reset/Clock Enable: 1-bit (each) input: Reset/Clock Enable Inputs
			CEA1 				=> '1',
			CEA2 				=> '1',
			CEAD 				=> '1',
			CEALUMODE 			=> '1',
			CEB1 				=> '1',
			CEB2 				=> '1',
			CEC 				=> '1',
			CECARRYIN 			=> '1',
			CECTRL 				=> '1',
			CED 				=> '1',
			CEINMODE 			=> '1',
			CEM 				=> '1',
			CEP 				=> '1',
			RSTA				=> rstp,
			RSTALLCARRYIN 		=> rstp,
			RSTALUMODE 			=> rstp,
			RSTB 				=> rstp,
			RSTC 				=> rstp,
			RSTCTRL 			=> rstp,
			RSTD 				=> rstp,
			RSTINMODE 			=> rstp,
			RSTM 				=> rstp,
			RSTP 				=> rstp 
		);
end generate;

xULTRA: if (XSER = "NEW") generate
	MULT_ADD: DSP48E2
		generic map (
			-- Feature Control Attributes: Data Path Selection
			AMULTSEL 			=> "A",
			A_INPUT 			=> "DIRECT",
			BMULTSEL 			=> "B", 
			B_INPUT 			=> "DIRECT",
			PREADDINSEL 		=> "A",
			USE_MULT 			=> "MULTIPLY",
			-- Register Control Attributes: Pipeline Register Configuration
			ACASCREG 			=> 1,
			ADREG 				=> 0,
			ALUMODEREG 			=> 1,
			AREG 				=> 1,
			BCASCREG 			=> 1,
			BREG 				=> 1,
			CARRYINREG 			=> 1,
			CARRYINSELREG 		=> 1,
			CREG 				=> 1,
			DREG 				=> 0,
			INMODEREG 			=> 1,
			MREG 				=> 1,
			OPMODEREG 			=> 1,
			PREG 				=> 1 
		)
		port map (   
			-- Data: 4-bit (each) output: Data Ports
			P 					=> cos_prod,			
			-- Cascade: 30-bit (each) input: Cascade Ports
			ACIN 				=> (others=>'0'),
			BCIN 				=> (others=>'0'),
			CARRYCASCIN 		=> '0',    
			MULTSIGNIN 			=> '0',    
			PCIN 				=> (others=>'0'),              
			-- Control: 4-bit (each) input: Control Inputs/Status Bits
			ALUMODE 			=> (0 => '1', 1 => '1', others=>'0'),
			CARRYINSEL 			=> (others=>'0'),
			CLK 				=> clk, 
			INMODE 				=> (others=>'0'),
			OPMODE 				=> "000110101", 
			-- Data: 30-bit (each) input: Data Ports
			A 					=> sin_aa,    
			B 					=> mpx,    
			C 					=> cos_cc,         
			CARRYIN 			=> '0',
			D 					=> (others=>'0'),
			-- Reset/Clock Enable: 1-bit (each) input: Reset/Clock Enable Inputs
			CEA1 				=> '1',
			CEA2 				=> '1',
			CEAD 				=> '1',
			CEALUMODE 			=> '1',
			CEB1 				=> '1',                  
			CEB2 				=> '1',         
			CEC 				=> '1',           
			CECARRYIN 			=> '1',
			CECTRL 				=> '1',
			CED 				=> '1',   
			CEINMODE 			=> '1',
			CEM 				=> '1',                     
			CEP 				=> '1',                     
			RSTA				=> rstp,           
			RSTALLCARRYIN 		=> rstp,  
			RSTALUMODE 			=> rstp,     
			RSTB 				=> rstp,           
			RSTC 				=> rstp,           
			RSTCTRL 			=> rstp,        
			RSTD 				=> rstp,           
			RSTINMODE 			=> rstp,      
			RSTM 				=> rstp,           
			RSTP 				=> rstp            
		);

	MULT_SUB: DSP48E2 
		generic map (
			-- Feature Control Attributes: Data Path Selection
			AMULTSEL 			=> "A",
			A_INPUT 			=> "DIRECT",        
			BMULTSEL 			=> "B",
			B_INPUT 			=> "DIRECT",        
			PREADDINSEL 		=> "A",
			USE_MULT 			=> "MULTIPLY", 
			-- Register Control Attributes: Pipeline Register Configuration
			ACASCREG 			=> 1,
			ADREG 				=> 0,
			ALUMODEREG 			=> 1,
			AREG 				=> 1,
			BCASCREG 			=> 1,
			BREG 				=> 1,
			CARRYINREG 			=> 1,
			CARRYINSELREG 		=> 1,
			CREG 				=> 1,
			DREG 				=> 0,
			INMODEREG 			=> 1,
			MREG 				=> 1,
			OPMODEREG 			=> 1,
			PREG 				=> 1 
		)
		port map (
			-- Data: 4-bit (each) output: Data Ports
			P 					=> sin_prod,			
			-- Cascade: 30-bit (each) input: Cascade Ports
			ACIN 				=> (others=>'0'),
			BCIN 				=> (others=>'0'),
			CARRYCASCIN 		=> '0',    
			MULTSIGNIN 			=> '0',    
			PCIN 				=> (others=>'0'),              
			-- Control: 4-bit (each) input: Control Inputs/Status Bits
			ALUMODE 			=> (others=>'0'),
			CARRYINSEL 			=> (others=>'0'),
			CLK 				=> clk, 
			INMODE 				=> (others=>'0'),
			OPMODE 				=> "000110101", 
			-- Data: 30-bit (each) input: Data Ports
			A 					=> cos_aa,    
			B 					=> mpx,    
			C 					=> sin_cc,         
			CARRYIN 			=> '0',
			D 					=> (others=>'0'),
			-- Reset/Clock Enable: 1-bit (each) input: Reset/Clock Enable Inputs
			CEA1 				=> '1',
			CEA2 				=> '1',
			CEAD 				=> '1',
			CEALUMODE 			=> '1',
			CEB1 				=> '1',               
			CEB2 				=> '1',      
			CEC 				=> '1',        
			CECARRYIN 			=> '1',
			CECTRL 				=> '1',
			CED 				=> '1',
			CEINMODE 			=> '1',
			CEM 				=> '1',                  
			CEP 				=> '1',                  
			RSTA				=> rstp,           
			RSTALLCARRYIN 		=> rstp,  
			RSTALUMODE 			=> rstp,     
			RSTB 				=> rstp,           
			RSTC 				=> rstp,           
			RSTCTRL 			=> rstp,        
			RSTD 				=> rstp,           
			RSTINMODE 			=> rstp,      
			RSTM 				=> rstp,           
			RSTP 				=> rstp            
		);
end generate;

end row_twiddle_tay;