--
-- A simulation model of Pacman hardware
-- Copyright (c) MikeJ - January 2006
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
-- The latest version of this file can be found at: www.fpgaarcade.com
--
-- Email pacman@fpgaarcade.com
--
-- Revision list
--
-- version 003 Jan 2006 release, general tidy up
-- version 002 added volume multiplier
-- version 001 initial release
--
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;

entity PACMAN_AUDIO is
  port (
    I_HCNT            : in    std_logic_vector(8 downto 0);
    --
    I_AB              : in    std_logic_vector(11 downto 0);
    I_DB              : in    std_logic_vector( 7 downto 0);
    --
    I_WR1_L           : in    std_logic;
    I_WR0_L           : in    std_logic;
    I_SOUND_ON        : in    std_logic;
    --
    dn_addr           : in    std_logic_vector(15 downto 0);
    dn_data           : in    std_logic_vector(7 downto 0);
    dn_wr             : in    std_logic;
	--
    O_AUDIO           : out   std_logic_vector(7 downto 0);
    ENA_6             : in    std_logic;
    CLK               : in    std_logic
    );
end;

architecture RTL of PACMAN_AUDIO is

  signal addr          : std_logic_vector(3 downto 0);
  signal data          : std_logic_vector(3 downto 0);
  signal vol_ram_dout  : std_logic_vector(3 downto 0);
  signal frq_ram_dout  : std_logic_vector(3 downto 0);

  signal sum           : std_logic_vector(5 downto 0);
  signal accum_reg     : std_logic_vector(5 downto 0);
  signal rom3m_n       : std_logic_vector(15 downto 0);
  signal rom3m_w       : std_logic_vector(3 downto 0);
  signal rom3m         : std_logic_vector(3 downto 0);

  signal rom1m_addr    : std_logic_vector(7 downto 0);
  signal rom1m_data    : std_logic_vector(7 downto 0);
  
  signal prom_cs       : std_logic;
  signal rom1m_cs      : std_logic;

begin
  p_sel_com : process(I_HCNT, I_AB, I_DB, accum_reg)
  begin
    if (I_HCNT(1) = '0') then -- 2h,
      addr <= I_AB(3 downto 0);
      data <= I_DB(3 downto 0); -- removed invert
    else
      addr <= I_HCNT(5 downto 2);
      data <= accum_reg(4 downto 1);
    end if;
  end process;

	vol_ram : work.dpram generic map (4,4)
	port map
	(
		clk_a_i   => CLK,
		en_a_i    => ENA_6,
		we_i      => not I_WR1_L,
		addr_a_i  => addr(3 downto 0),
		data_a_i  => data,

		clk_b_i   => CLK,
		addr_b_i  => addr(3 downto 0),
		data_b_o  => vol_ram_dout
	);
  
	frq_ram : work.dpram generic map (4,4)
	port map
	(
		clk_a_i   => CLK,
		en_a_i    => ENA_6,
		we_i      => rom3m(1),
		addr_a_i  => addr(3 downto 0),
		data_a_i  => data,

		clk_b_i   => CLK,
		addr_b_i  => addr(3 downto 0),
		data_b_o  => frq_ram_dout
	);

  p_control_rom_comb : process(I_HCNT)
  begin
    rom3m_n <= x"0000"; rom3m_w <= x"0"; -- default assign
    case I_HCNT(3 downto 0) is
      when x"0" => rom3m_n <= x"0008"; rom3m_w <= x"0";
      when x"1" => rom3m_n <= x"0000"; rom3m_w <= x"2";
      when x"2" => rom3m_n <= x"1111"; rom3m_w <= x"0";
      when x"3" => rom3m_n <= x"2222"; rom3m_w <= x"0";
      when x"4" => rom3m_n <= x"0000"; rom3m_w <= x"0";
      when x"5" => rom3m_n <= x"0000"; rom3m_w <= x"2";
      when x"6" => rom3m_n <= x"1101"; rom3m_w <= x"0";
      when x"7" => rom3m_n <= x"2242"; rom3m_w <= x"0";
      when x"8" => rom3m_n <= x"0080"; rom3m_w <= x"0";
      when x"9" => rom3m_n <= x"0000"; rom3m_w <= x"2";
      when x"A" => rom3m_n <= x"1011"; rom3m_w <= x"0";
      when x"B" => rom3m_n <= x"2422"; rom3m_w <= x"0";
      when x"C" => rom3m_n <= x"0800"; rom3m_w <= x"0";
      when x"D" => rom3m_n <= x"0000"; rom3m_w <= x"2";
      when x"E" => rom3m_n <= x"0111"; rom3m_w <= x"0";
      when x"F" => rom3m_n <= x"4222"; rom3m_w <= x"0";
      when others => null;
    end case;
  end process;

  p_control_rom_op_comb : process(I_HCNT, I_WR0_L, rom3m_n, rom3m_w)
  begin
    rom3m <= rom3m_w;
    if (I_WR0_L = '1') then
      case I_HCNT(5 downto 4) is
        when "00" => rom3m <= rom3m_n( 3 downto 0);
        when "01" => rom3m <= rom3m_n( 7 downto 4);
        when "10" => rom3m <= rom3m_n(11 downto 8);
        when "11" => rom3m <= rom3m_n(15 downto 12);
        when others => null;
      end case;
    end if;
  end process;

  p_adder : process(vol_ram_dout, frq_ram_dout, accum_reg)
  begin
    -- 1K 4 bit adder
    sum <= ('0' & vol_ram_dout & '1') + ('0' & frq_ram_dout & accum_reg(5));
  end process;

  p_accum_reg : process
  begin
    -- 1L
    wait until rising_edge(CLK);
    if (ENA_6 = '1') then
      if (rom3m(3) = '1') then -- clear
        accum_reg <= "000000";
      elsif (rom3m(0) = '1') then -- rising edge clk
        accum_reg <= sum(5 downto 1) & accum_reg(4);
      end if;
    end if;
  end process;

  p_rom_1m_addr_comb : process(accum_reg, frq_ram_dout)
  begin
    rom1m_addr(7 downto 5) <= frq_ram_dout(2 downto 0);
    rom1m_addr(4 downto 0) <= accum_reg(4 downto 0);

  end process;

  prom_cs <= '1' when dn_addr(15 downto 14) = "11" else '0';
  rom1m_cs <= '1' when dn_addr(9 downto 8) = "00" else '0';

  audio_rom_1m : work.dpram generic map (8,8)
  port map
	(
		clk_a_i   => CLK,
		en_a_i    => '1',
		we_i      => dn_wr and rom1m_cs and prom_cs,
		addr_a_i  => dn_addr(7 downto 0),
		data_a_i  => dn_data,
	
		clk_b_i   => CLK,
		addr_b_i  => rom1m_addr,
		data_b_o  => rom1m_data
   );
  p_original_output_reg : process
  begin
    -- 2m used to use async clear
    wait until rising_edge(CLK);
    if (ENA_6 = '1') then
      if (I_SOUND_ON = '0') then
			O_AUDIO <= "00000000";
      elsif (rom3m(2) = '1') then
			O_AUDIO <= vol_ram_dout(3 downto 0) * rom1m_data(3 downto 0);
      end if;
    end if;
  end process;

end architecture RTL;
