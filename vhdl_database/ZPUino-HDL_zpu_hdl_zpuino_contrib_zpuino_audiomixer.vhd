--
-- Audio mixer
--
-- Copyright 2011 TRSi
--
-- Version: 0.1
--
-- The FreeBSD license
-- 
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions
-- are met:
-- 
-- 1. Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimer.
-- 2. Redistributions in binary form must reproduce the above
--    copyright notice, this list of conditions and the following
--    disclaimer in the documentation and/or other materials
--    provided with the distribution.
-- 
-- THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY
-- EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
-- PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
-- ZPU PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
-- INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
-- OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
-- HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
-- STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
-- ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--
-- Changelog:
--
-- 0.1: First version
--

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_arith.all;
  use ieee.std_logic_unsigned.all;

library work;
  use work.zpuino_config.all;
  use work.zpu_config.all;
  use work.zpupkg.all;
  
entity zpuino_io_audiomixer is
	port (
    clk:      	in std_logic;
    rst:      	in std_logic;
    ena:			in std_logic;
    
    data_in1:  	in std_logic_vector(17 downto 0);
    data_in2:  	in std_logic_vector(17 downto 0);
    data_in3:  	in std_logic_vector(17 downto 0);
    
    audio_out: 	out std_logic
    );
end entity zpuino_io_audiomixer;

architecture behave of zpuino_io_audiomixer is

-- divier per input
signal cnt_div: 			std_logic_vector(1 downto 0) := (others => '0');

-- accumulator for each input, on 9 bits, enough for 3 inputs@8bits
signal audio_mix: 		std_logic_vector(19 downto 0) := (others => '0'); 

-- to store final accumulator value
signal audio_final: 		std_logic_vector(19 downto 0) := (others => '0');
signal current_input:	std_logic_vector(17 downto 0) := (others => '0');
signal data_out:			std_logic_vector(17 downto 0) := (others => '0');

-- DAC
component simple_sigmadelta is
  generic (
    BITS: integer := 18
  );
	port (
    clk:      in std_logic;
    rst:      in std_logic;
    data_in:  in std_logic_vector(BITS-1 downto 0);
    data_out: out std_logic
    );
end component simple_sigmadelta;

begin

	sdo: simple_sigmadelta
	generic map (
		BITS =>  18
	)
	port map (
		clk       => clk,
		rst       => rst,
		data_in   => data_out,
		data_out  => audio_out
	);

	-- divide clock by input channels number
	p_divider : process
	begin
		wait until rising_edge(clk);
		if (ena = '1') then
			if (cnt_div = "00") then
				cnt_div <= "11";
			else
				cnt_div <= cnt_div - "1";
			end if;
		end if;
	end process;	
	
	-- assign an input
	p_chan_mixer : process(cnt_div, data_in1, data_in2, data_in3)
	begin
		current_input <= (others => DontCareValue);
		case cnt_div(1 downto 0) is
			when "11" =>
				current_input <= data_in1;
			when "10" =>
				current_input <= data_in2;
			when "01" =>
				current_input <= data_in3;
			when "00" => null; -- mix outputs become valid on this clock
			when others => null;
		end case;
	end process;	
	
	-- mixer process, input by input
	p_op_mixer : process
	begin
		wait until rising_edge(clk);

		if (ena = '1') then	
	
			if (cnt_div(1 downto 0) = "00") then
				audio_mix   <= (others => '0');
				audio_final <= audio_mix;
			else
				audio_mix   <= audio_mix + ("00" & current_input);
			end if;
		end if;

		if (rst='1') then
			data_out(17 downto 0) <= (others => '0');
		else
			if (audio_final(19) = '0') then
				data_out(17 downto 0) <= audio_final(18 downto 1);
			else -- clip
				data_out(17 downto 0) <= "111111111111111111";
			end if;
		end if;
  end process;	

end behave;

