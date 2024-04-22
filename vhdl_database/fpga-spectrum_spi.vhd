-- ZX Spectrum for Altera DE1
--
-- Copyright (c) 2009-2010 Mike Stirling
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- * Redistributions of source code must retain the above copyright notice,
--   this list of conditions and the following disclaimer.
--
-- * Redistributions in synthesized form must reproduce the above copyright
--   notice, this list of conditions and the following disclaimer in the
--   documentation and/or other materials provided with the distribution.
--
-- * Neither the name of the author nor the names of other contributors may
--   be used to endorse or promote products derived from this software without
--   specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--

-- A master-only SPI interface implementation similar to
-- that found on the Atmel AVR series

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- SPCR (SPI control register)
--
-- Bit
-- 7	0		Reserved
-- 6	R/W		SPE - SPI enable (set to 1 for normal operation)
-- 5	R/W		DORD - Data order, 0 = MSB first (normal), 1 = LSB first
-- 4	1		Reserved
-- 3	R/W		CPOL
-- 2	R/W		CPHA
-- 1	R/W		SPR1
-- 0	R/W		SPR0

-- SPSR (SPI status register)
--
-- Bit
-- 7	R		SPIF (Transfer complete, cleared by writing to SPDR)
-- 6	R		WCOL (Write collision)
-- 5-1	0		Reserved
-- 0	R/W		SPI2X

-- SCK rate is defined by
-- SPI2X  SPR1  SPR0
-- 0      0     0		CLK/4
-- 0      0     1		CLK/16
-- 0      1     0		CLK/64
-- 0      1     1		CLK/128
-- 1      0     0		CLK/2
-- 1      0     1		CLK/8
-- 1      1     0		CLK/32
-- 1      1     1		CLK/64

-- SPDR (SPI data register)
-- This is a read/write 8-bit register used for accessing
-- the SPI shift register.  Writing to this register starts
-- a new byte transfer.

-- Register addresses are:
-- A1  A0		Register
-- 0   0		SPDR
-- 0   1		SPCR
-- 1   0		SPSR
-- 1   1		Reserved

entity spi_master is
port (
	CLK		:	in	std_logic;
	CLKEN	:	in	std_logic;
	nRESET	:	in	std_logic;
	
	MOSI	:	out	std_logic;
	MISO	:	in	std_logic;
	SCK		:	out	std_logic;
	nSS		:	out	std_logic;
	
	D_IN	:	in	std_logic_vector(7 downto 0);
	D_OUT	:	out	std_logic_vector(7 downto 0);
	
	A0		:	in	std_logic;
	
	nWR		:	in	std_logic;
	);
end spi_master;

architecture spi_master_arch of spi_master is
signal	shiftreg	:	std_logic_vector(7 downto 0);
signal	counter		:	std_logic_vector(3 downto 0);
begin

	-- MSb first, connect end of shift register to output
	MOSI <= shiftreg(7);
	
	-- Clock generator
	process(nRESET,CLK)
	begin
		if nRESET = '0' then
		elsif rising_edge(CLK) and CLKEN = '1' then
		
		end if;
	end process;

	process(nRESET,CLK)
	begin
	if nRESET = '0' then
		shiftreg <= (others => '1'); -- MOSI idles high
		counter <= (others => '0');
		SCK <= '0'; -- SCK idles low
	elsif rising_edge(CLK) and CLKEN = '1' then
		if counter = '0000' then
			-- Idle
			if nWR = '0' then
				-- Register input data when write strobe asserted
				-- and start new transfer
				shiftreg <= D_IN;
				counter <= '1111';
			end if;
		else
			-- Busy
			if counter(0) = '1' then
				-- Shift master data to output on the falling clock edge
				SCK <= '0';
				shiftreg(7 downto 1) <= shiftreg(6 downto 0);
			else
				-- Store slave data on the rising clock edge
				SCK <= '1';
				shiftreg(0) <= MISO;
			end if;
			
			-- Decrement counter
			counter <= counter - '1';
		end if;
	end if;	
	end process;

end spi_master_arch;
