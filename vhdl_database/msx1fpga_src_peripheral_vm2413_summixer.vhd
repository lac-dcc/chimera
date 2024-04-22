--
-- SumMixer.vhd
--
-- Based on TemporalMixer: Copyright (c) 2006 Mitsutaka Okazaki (brezza@pokipoki.org)
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
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.vm2413.all;

entity SumMixer is
	port (
		clk		: in std_logic;
		reset		: in std_logic;
		clkena	: in std_logic;
		slot		: in std_logic_vector( 4 downto 0 );
		stage		: in std_logic_vector( 1 downto 0 );
		rhythm	: in std_logic;
		maddr		: out std_logic_vector( 4 downto 0 );
		mdata		: in SIGNED_LI_TYPE;
		melody_o	: out signed(12 downto 0);
		rhythm_o	: out signed(12 downto 0)
	);
end entity;

architecture RTL of SumMixer is

	signal mmute, rmute	: std_logic;
	signal sum_mo_s		: signed(12 downto 0);
	signal sum_ro_s		: signed(12 downto 0);

begin

	process (clk, reset)
	begin

		if reset = '1' then

			melody_o <= (others =>'0');
			rhythm_o <= (others =>'0');
			maddr <= (others => '0');
			mmute <= '1';
			rmute <= '1';
			sum_mo_s <= (others => '0');
			sum_ro_s <= (others => '0');

		elsif rising_edge(clk) then 

			if clkena='1' then

				if stage = 0 then

					if rhythm = '0' then

						case slot is
							when "00000" => maddr <= "00001"; mmute <='0'; -- CH0
							when "00001" => maddr <= "00011"; mmute <='0'; -- CH1
							when "00010" => maddr <= "00101"; mmute <='0'; -- CH2
							when "00011" => mmute <= '1';
							when "00100" => mmute <= '1';
							when "00101" => mmute <= '1';
							when "00110" => maddr <= "00111"; mmute<='0'; -- CH3
							when "00111" => maddr <= "01001"; mmute<='0'; -- CH4
							when "01000" => maddr <= "01011"; mmute<='0'; -- CH5
							when "01001" => mmute <= '1';
							when "01010" => mmute <= '1';
							when "01011" => mmute <= '1';
							when "01100" => maddr <= "01101"; mmute<='0'; -- CH6
							when "01101" => maddr <= "01111"; mmute<='0'; -- CH7
							when "01110" => maddr <= "10001"; mmute<='0'; -- CH8
							when "01111" => mmute <= '1';
							when "10000" => mmute <= '1';
							when "10001" => mmute <= '1';
							when others  =>
						end case;

						rmute <= '1';

					else --if rhythm = '0'

						case slot is
							when "00000" => maddr <= "00001"; mmute <='0'; rmute <='1'; -- CH0
							when "00001" => maddr <= "00011"; mmute <='0'; rmute <='1'; -- CH1
							when "00010" => maddr <= "00101"; mmute <='0'; rmute <='1'; -- CH2
							when "00011" => maddr <= "01111"; mmute <='1'; rmute <='0'; -- SD
							when "00100" => maddr <= "10001"; mmute <='1'; rmute <='0'; -- CYM
							when "00101" =>                   mmute <='1'; rmute <='1';
							when "00110" => maddr <= "00111"; mmute <='0'; rmute <='1'; -- CH3
							when "00111" => maddr <= "01001"; mmute <='0'; rmute <='1'; -- CH4
							when "01000" => maddr <= "01011"; mmute <='0'; rmute <='1'; -- CH5
							when "01001" => maddr <= "01110"; mmute <='1'; rmute <='0'; -- HH
							when "01010" => maddr <= "10000"; mmute <='1'; rmute <='0'; -- TOM
							when "01011" => maddr <= "01101"; mmute <='1'; rmute <='0'; -- BD
							when "01100" => maddr <= "01111"; mmute <='1'; rmute <='0'; -- SD
							when "01101" => maddr <= "10001"; mmute <='1'; rmute <='0'; -- CYM
							when "01110" => maddr <= "01110"; mmute <='1'; rmute <='0'; -- HH
							when "01111" => maddr <= "10000"; mmute <='1'; rmute <='0'; -- TOM
							when "10000" => maddr <= "01101"; mmute <='1'; rmute <='0'; -- BD
							when "10001" =>                   mmute <='1'; rmute <='1';
							when others  =>
						end case;

					end if; --if rhythm = '0'

				elsif stage = 2 then

					if slot = "10001" then
						melody_o <= sum_mo_s;
						rhythm_o <= sum_ro_s;
						sum_mo_s <= (others => '0');
						sum_ro_s <= (others => '0');
					end if;

					if mmute = '0' then
						if mdata.sign = '0' then
							sum_mo_s <= sum_mo_s + signed('0' & mdata.value);
						else
							sum_mo_s <= sum_mo_s - signed('0' & mdata.value);
						end if;
					end if;

					if rmute = '0' then
						if mdata.sign = '0' then
							sum_ro_s <= sum_ro_s + signed('0' & mdata.value);
						else
							sum_ro_s <= sum_ro_s - signed('0' & mdata.value);
						end if;
					end if;

				end if; -- if stage = 0/elsif stage = 2

			end if; -- clkena

		end if;

	end process;

end architecture;