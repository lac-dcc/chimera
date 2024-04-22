-------------------------------------------------------------------------------
--
-- Title       : Align FFT data delay
-- Design      : Integer FFTK
-- Author      : Kapitanov
-- Company     :
--
-- Description : int_align_ifft
--
-- Version 1.0  01.02.2018
-- 		Delay correction for TWIDDLE factor and FLYes: Inverse FFT 
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

entity int_align_ifft is 
	generic ( 
		DATW		: integer:=16;	--! Data width
		NFFT		: integer:=16;	--! FFT lenght
		STAGE 		: integer:=0	--! FFT stage			
	);
	port (	
		CLK			: in  std_logic; --! Clock
		-- DATA FROM BUTTERFLY --
		IA_RE		: in  std_logic_vector(DATW-1 downto 0); --! I: (A Re)
		IA_IM		: in  std_logic_vector(DATW-1 downto 0); --! I: (A Im)
		IB_RE		: in  std_logic_vector(DATW-1 downto 0); --! I: (B Re)
		IB_IM		: in  std_logic_vector(DATW-1 downto 0); --! I: (B Im)
		-- DATA TO BUTTERFLY
		OA_RE		: out std_logic_vector(DATW-1 downto 0); --! O: (A Re)
		OA_IM		: out std_logic_vector(DATW-1 downto 0); --! O: (A Im)
		OB_RE		: out std_logic_vector(DATW-1 downto 0); --! O: (B Re)
		OB_IM		: out std_logic_vector(DATW-1 downto 0); --! O: (B Im)	
		-- ENABLEs FROM/TO BUTTERFLY -
		BF_EN		: in  std_logic;
		BF_VL		: out std_logic;
		TW_EN		: out std_logic
	);
end int_align_ifft;

architecture int_align_ifft of int_align_ifft is   		  

begin 

TW_EN <= BF_EN;
	
ZERO_WW: if (STAGE < 2) generate 
begin	
	BF_VL <= BF_EN;
	OA_RE <= IA_RE;
	OA_IM <= IA_IM;
	OB_RE <= IB_RE;
	OB_IM <= IB_IM;
end generate;

-- LOW STAGES: 
LOW_WW: if (STAGE > 1) and (STAGE < 11) generate
	signal za_re : std_logic_vector(DATW-1 downto 0);
	signal za_im : std_logic_vector(DATW-1 downto 0);
	signal zb_re : std_logic_vector(DATW-1 downto 0);
	signal zb_im : std_logic_vector(DATW-1 downto 0);
	signal zz_en : std_logic;
begin
	za_re <= IA_RE when rising_edge(clk);
    za_im <= IA_IM when rising_edge(clk);
    zb_re <= IB_RE when rising_edge(clk);
    zb_im <= IB_IM when rising_edge(clk);
	zz_en <= BF_EN when rising_edge(clk);

	OA_RE <= za_re when rising_edge(clk);
	OA_IM <= za_im when rising_edge(clk);
	OB_RE <= zb_re when rising_edge(clk);
	OB_IM <= zb_im when rising_edge(clk);
	BF_VL <= zz_en when rising_edge(clk);
end generate;

-- LONG STAGES:
LONG_WW: if (STAGE > 10) generate

	type data_arr is array (5 downto 0) of std_logic_vector(DATW-1 downto 0);
	signal bf_ez 	: std_logic_vector(5 downto 0);
	
	signal za_re 	: data_arr;
	signal za_im 	: data_arr;
	signal zb_re 	: data_arr; 
	signal zb_im 	: data_arr; 
	
begin	

	OA_RE <= za_re(za_re'left);
	OA_IM <= za_im(za_im'left);
	OB_RE <= zb_re(zb_re'left);
	OB_IM <= zb_im(zb_im'left);
	BF_VL <= bf_ez(bf_ez'left);
	
	za_re <= za_re(za_re'left-1 downto 0) & IA_RE when rising_edge(clk);   	
	za_im <= za_im(za_im'left-1 downto 0) & IA_IM when rising_edge(clk);   	
	zb_re <= zb_re(zb_re'left-1 downto 0) & IB_RE when rising_edge(clk);   					
	zb_im <= zb_im(zb_im'left-1 downto 0) & IB_IM when rising_edge(clk);   					
	bf_ez <= bf_ez(bf_ez'left-1 downto 0) & BF_EN when rising_edge(clk); 
	
end generate;		

end int_align_ifft; 