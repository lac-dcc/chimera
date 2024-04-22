-- ############# Sweet32 microprocessor - simple ADC peripheral ##############
-- ###########################################################################
-- Module Name:		simple_ADC.vhd
-- Module Version:	0.1
-- Module author:	Valentin Angelovski
-- Module date:		14/09/2014
-- Project IDE:		Lattice Diamond ver. 3.1.0.96
--
--------------------------------------------------------------------------------/
--
-- Copyright (C) 2014 Valentin Angelovski
--
-- This source file may be used and distributed without
-- restriction provided that this copyright statement is not
-- removed from the file and that any derivative work contains
-- the original copyright notice and the associated disclaimer.
--
-- This source file is free software; you can redistribute it
-- and/or modify it under the terms of the GNU Lesser General
-- Public License as published by the Free Software Foundation;
-- either version 2.1 of the License, or (at your option) any
-- later version.
--
-- This source is distributed in the hope that it will be
-- useful, but WITHOUT ANY WARRANTY; without even the implied
-- warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
-- PURPOSE. See the GNU Lesser General Public License for more
-- details.
--
-- You should have received a copy of the GNU Lesser General
-- Public License along with this source; if not, download it
-- from http://www.opencores.org/lgpl.shtml
--
----------------------------------------------------------------------------------/
--
--
-- Version release history
-- 14/09/2014 v0.1 (Initial beta pre-release)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;


entity simple_ADC is
	port(
		clk			: in		STD_LOGIC;	-- 100MHz sample clock
		rst			: in		STD_LOGIC;	-- reset

		Sampler_Q	: BUFFER	STD_LOGIC;	-- Sigma Delta ADC - Comparator result
		Sampler_D	: in		STD_LOGIC;		-- Sigma Delta ADC - RC circuit driver out

		adc_output	: out 		unsigned(10 downto 0) -- ADC output register
	);
END;


ARCHITECTURE behavior OF simple_ADC IS

-- Declare registers and signals needed for the sigma-delta ADC (Analog-to-Digital Converter)
	signal adc_rawout: signed (13 downto 0);
	signal adc_filout: signed (13 downto 0);

BEGIN

	-- Our combinatorial logic goes here (if any)

	-- *** Sigma-Delta ADC sampling and processing loop ***
	PROCESS (clk, rst)
	begin

		if rst = '0' then -- ADC reset
			adc_rawout <= "00000000000000";
			Sampler_Q <='0';
		else -- Sigma-delta ADC sampling loop clocked @ 100MHz
			if(clk'event and clk='1') then
				Sampler_Q <= Sampler_D; -- sample ADC comparator value
				-- Add the signed difference (Delta) between the previous sample and current one
				adc_rawout <= adc_rawout + shift_right((("00"& Sampler_Q & "00000000000") - adc_rawout), 6) ;
				adc_filout <= shift_right(adc_filout + adc_rawout, 1) ;
				adc_output <= unsigned(adc_filout(10 downto 0));
			end if;
		end if;
	end process;

end architecture;
