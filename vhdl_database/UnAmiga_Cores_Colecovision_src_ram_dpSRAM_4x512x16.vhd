--
-- TBBlue / ZX Spectrum Next project
--
-- TBBlue - Victor Trucco & Fabio Belavenuto
-- 			Special thanks to Mark Smith
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS CODE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
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
-- You are responsible for any legal issues arising from your use of this code.
--

library ieee;
use ieee.std_logic_1164.all;

entity dpSRAM_4x512x16 is
	port (
		clk_i				:  in    std_logic;
		-- Port 0
		port0_addr_i	:  in    std_logic_vector(20 downto 0);
		port0_ce_i		:  in    std_logic;
		port0_oe_i		:  in    std_logic;
		port0_we_i		:  in    std_logic;
		port0_data_i	:  in    std_logic_vector( 7 downto 0);
		port0_data_o	:  out   std_logic_vector( 7 downto 0);
		-- Port 1
		port1_addr_i	:  in    std_logic_vector(20 downto 0);
		port1_ce_i		:  in    std_logic;
		port1_oe_i		:  in    std_logic;
		port1_we_i		:  in    std_logic;
		port1_data_i	:  in    std_logic_vector( 7 downto 0);
		port1_data_o	:  out   std_logic_vector( 7 downto 0);
		-- Output to SRAM in board
		sram_addr_o		:  out   std_logic_vector(18 downto 0);
		sram_data_io	:  inout std_logic_vector(15 downto 0);
		sram_ce_n_o		:  out   std_logic_vector( 3 downto 0)		:= "1111";
		sram_oe_n_o		:  out   std_logic								:= '1';
		sram_we_n_o		:  out   std_logic								:= '1'
	--	sram_new_we_n_o :  out   std_logic								:= '1'
	);
end entity;

architecture Behavior of dpSRAM_4x512x16 is

	signal sram_we_s		: std_logic;
	signal sram_oe_s		: std_logic;

begin

	--sram_we_n_o	<= sram_we_s;
	sram_oe_n_o	<= sram_oe_s;

	
	
	process (clk_i)
	begin
		if falling_edge(clk_i) then
			sram_we_n_o <= sram_we_s;
		--	sram_oe_n_o	<= sram_oe_s;
		end if;
	end process;
	
	process (clk_i)

		variable state_v		: std_logic	:= '0';
		variable p0_ce_v		: std_logic_vector(1 downto 0);
		variable p1_ce_v		: std_logic_vector(1 downto 0);
		variable acess0_v		: std_logic;
		variable acess1_v		: std_logic;
		variable p0_req_v		: std_logic									:= '0';
		variable p1_req_v		: std_logic									:= '0';
		variable p0_we_v		: std_logic									:= '0';
		variable p1_we_v		: std_logic									:= '0';
		variable p0_addr_v	: std_logic_vector(20 downto 0);
		variable p1_addr_v	: std_logic_vector(20 downto 0);
		variable p0_data_v	: std_logic_vector(7 downto 0);
		variable p1_data_v	: std_logic_vector(7 downto 0);
		variable sram0_n_v 	: std_logic;
		variable sram1_n_v 	: std_logic;

	begin
		if rising_edge(clk_i) then
			acess0_v	:= port0_ce_i and (port0_oe_i or port0_we_i);
			acess1_v	:= port1_ce_i and (port1_oe_i or port1_we_i);
			p0_ce_v	:= p0_ce_v(0) & acess0_v;
			p1_ce_v	:= p1_ce_v(0) & acess1_v;

			if p0_ce_v = "01" then
				p0_req_v		:= '1';
				p0_we_v		:= '0';
				p0_addr_v	:= port0_addr_i;
				if port0_we_i = '1' then
					p0_we_v		:= '1';
					p0_data_v	:= port0_data_i;
				end if;
			end if;

			if p1_ce_v = "01" then
				p1_req_v		:= '1';
				p1_we_v		:= '0';
				p1_addr_v	:= port1_addr_i;
				if port1_we_i = '1' then
					p1_we_v		:= '1';
					p1_data_v	:= port1_data_i;
				end if;
			end if;

			if state_v = '0' then
				
				sram_data_io	<= (others => 'Z');
				sram_ce_n_o	<= (others => '1');
				sram_we_s	<= '1';
				--sram_oe_s	<= '1';
					
				if p0_req_v = '1' then
				
					sram_addr_o	<= p0_addr_v(18 downto 0);
					sram_oe_s	<= '0';
					sram_we_s	<= '1';
					sram0_n_v	:= p0_addr_v(19);
					
					case p0_addr_v(20 downto 19) is
						 when "00" 		=> sram_ce_n_o <= "1110";
						 when "01" 		=> sram_ce_n_o <= "1101";
						 when "10" 		=> sram_ce_n_o <= "1011";
						 when others	=> sram_ce_n_o <= "0111";
					end case;
					
					if p0_we_v = '1' then
						if sram0_n_v = '0' then
							sram_data_io( 7 downto 0) <= p0_data_v;
						else
							sram_data_io(15 downto 8) <= p0_data_v;
						end if;
						sram_we_s		<= '0';
						sram_oe_s		<= '1';
					end if;
					
					state_v	:= '1';
					
				elsif p1_req_v = '1' then
				
					sram_addr_o	<= p1_addr_v(18 downto 0);
					sram_oe_s	<= '0';
					sram_we_s	<= '1';
					sram1_n_v	:= p1_addr_v(19);
					
					case p1_addr_v(20 downto 19) is
						 when "00"		=> sram_ce_n_o <= "1110";
						 when "01"		=> sram_ce_n_o <= "1101";
						 when "10"		=> sram_ce_n_o <= "1011";
						 when others	=> sram_ce_n_o <= "0111";
					end case;
					
					if p1_we_v = '1' then
						if sram1_n_v = '0' then
							sram_data_io( 7 downto 0) <= p1_data_v;
						else
							sram_data_io(15 downto 8) <= p1_data_v;
						end if;
						sram_we_s		<= '0';
						sram_oe_s		<= '1';
					end if;
					state_v	:= '1';
				end if;
				
			elsif state_v = '1' then
			
				if p0_req_v = '1' then
				
					--sram_data_io <= (others => 'Z');
					
					if p0_we_v = '0' then
						if sram0_n_v = '0' then
							port0_data_o <= sram_data_io( 7 downto 0);
						else
							port0_data_o <= sram_data_io(15 downto 8);
						end if;
					else
						--sram_we_s		<= '0';
						sram_oe_s		<= '1';
					end if;
					
					p0_req_v		:= '0';
					state_v		:= '0';
					sram_we_s	<= '1';
					sram_oe_s	<= '1';
					--sram_ce_n_o	<= (others => '1');
					
				elsif p1_req_v = '1' then

					--sram_data_io	<= (others => 'Z');
					if p1_we_v = '0' then
						if sram1_n_v = '0' then
							port1_data_o <= sram_data_io( 7 downto 0);
						else
							port1_data_o <= sram_data_io(15 downto 8);
						end if;
					else
						--sram_we_s		<= '0';
						sram_oe_s		<= '1';
					end if;
					
					p1_req_v		:= '0';
					state_v		:= '0';
					sram_we_s	<= '1';
					sram_oe_s	<= '1';
					--sram_ce_n_o	<= (others => '1');
					
				end if;
				
			end if;
		end if;
	end process;

end;