--
-- A simulation model of YM2149 (AY-3-8910 with bells on)

-- Copyright (c) MikeJ - Jan 2005
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
-- Email support@fpgaarcade.com
--
-- Revision list
--
-- version 001 initial release
--
-- Clues from MAME sound driver and Kazuhiro TSUJIKAWA
--
-- These are the measured outputs from a real chip for a single Isolated channel into a 1K load (V)
-- vol 15 .. 0
-- 3.27 2.995 2.741 2.588 2.452 2.372 2.301 2.258 2.220 2.198 2.178 2.166 2.155 2.148 2.141 2.132
-- As the envelope volume is 5 bit, I have fitted a curve to the not quite log shape in order
-- to produced all the required values.
-- (The first part of the curve is a bit steeper and the last bit is more linear than expected)
--
-- 2019/10: FBLabs: renamed signals and fixed port_a and port_b directions
-- 2023/12: FBLabs: interface synchronous

library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity YM2149s is
	port (
		clock_master_i		: in  std_logic;
		clock_en_i			: in  std_logic;
		reset_i				: in  std_logic;
		ayymmode_i			: in  std_logic;								-- 0 = YM, 1 = AY
		-- data bus
		data_i				: in  std_logic_vector(7 downto 0);
		data_o				: out std_logic_vector(7 downto 0);
		-- control
		addr_i				: in  std_logic_vector(1 downto 0);
		req_i				: in  std_logic;
		cs_n_i				: in  std_logic;
		rd_n_i				: in  std_logic;
		wr_n_i				: in  std_logic;
		-- I/O ports
		port_a_i			: in  std_logic_vector(7 downto 0);
		port_b_o			: out std_logic_vector(7 downto 0);
		-- audio channels out
		audio_ch_a_o		: out std_logic_vector(7 downto 0);
		audio_ch_b_o		: out std_logic_vector(7 downto 0);
		audio_ch_c_o		: out std_logic_vector(7 downto 0);
		audio_ch_mix_o		: out unsigned(7 downto 0)		-- mixed audio
	);
end;

architecture RTL of YM2149s is

	-- signals
	type  array_16x8_t is array (0 to 15) of std_logic_vector(7 downto 0);
	type  array_3x12_t is array (1 to 3) of std_logic_vector(11 downto 0);
	
	signal cnt_div_s			: unsigned(3 downto 0) := (others => '0');
	signal noise_div_s			: std_logic := '0';
	signal ena_div_s			: std_logic;
	signal ena_div_noise_s		: std_logic;
	signal poly17_s				: std_logic_vector(16 downto 0) := (others => '0');
	

	signal reg_addr_q			: std_logic_vector(7 downto 0);
	signal regs_q				: array_16x8_t	:= (7 => (others => '1'), others => (others => '0'));
	signal env_reset_s			: std_logic;

	signal noise_gen_cnt_s		: unsigned(4 downto 0)		:= (others => '0');
	signal noise_gen_op_s		: std_logic;
	signal tone_gen_cnt_s		: array_3x12_t := (others	=> (others => '0'));
	signal tone_gen_op_s		: std_logic_vector(3 downto 1) := "000";
	
	signal env_gen_cnt_s		: std_logic_vector(15 downto 0)	:= (others => '0');
	signal env_ena_s			: std_logic;
	signal env_hold_s			: std_logic;
	signal env_inc_s			: std_logic;
	signal env_vol_s			: std_logic_vector(4 downto 0);
	
	signal ch_a_s				: std_logic_vector(4 downto 0);
	signal ch_b_s				: std_logic_vector(4 downto 0);
	signal ch_c_s				: std_logic_vector(4 downto 0);

	type volTableType32_t is array (0 to 31) of unsigned(7 downto 0);
	type volTableType16_t is array (0 to 15) of unsigned(7 downto 0);

	constant volTableAy_c : volTableType16_t :=(
		x"00", x"03", x"04", x"06",
		x"0a", x"0f", x"15", x"22", 
		x"28", x"41", x"5b", x"72", 
		x"90", x"b5", x"d7", x"ff" 
	);

	constant volTableYm_c : volTableType32_t :=(
		x"00", x"01", x"01", x"02", x"02", x"03", x"03", x"04",
		x"06", x"07", x"09", x"0a", x"0c", x"0e", x"11", x"13",
		x"17", x"1b", x"20", x"25", x"2c", x"35", x"3e", x"47",
		x"54", x"66", x"77", x"88", x"a1", x"c0", x"e0", x"ff"
	);    

begin

	-- Read request
	p_reg_read: process(cs_n_i, rd_n_i, addr_i, reg_addr_q, regs_q, port_a_i)
	begin
		data_o <= (others => '0');
		if cs_n_i = '0' and rd_n_i = '0' and addr_i = "10" then
			case reg_addr_q is
				when x"00" => data_o <= regs_q(0);
				when x"01" => data_o <= "0000" & regs_q(1)(3 downto 0);
				when x"02" => data_o <= regs_q(2);
				when x"03" => data_o <= "0000" & regs_q(3)(3 downto 0);
				when x"04" => data_o <= regs_q(4);
				when x"05" => data_o <= "0000" & regs_q(5)(3 downto 0);
				when x"06" => data_o <= "000"  & regs_q(6)(4 downto 0);
				when x"07" => data_o <= regs_q(7);
				when x"08" => data_o <= "000"  & regs_q(8)(4 downto 0);
				when x"09" => data_o <= "000"  & regs_q(9)(4 downto 0);
				when x"0A" => data_o <= "000"  & regs_q(10)(4 downto 0);
				when x"0B" => data_o <= regs_q(11);
				when x"0C" => data_o <= regs_q(12);
				when x"0D" => data_o <= "0000" & regs_q(13)(3 downto 0);
				when x"0E" => data_o <= port_a_i;
				when x"0F" => data_o <= regs_q(15);
				when others => null;
			end case;
		end if;
	end process;

	-- Write request
	p_reg_write: process(reset_i, clock_master_i)
	begin
		if reset_i = '1' then
			reg_addr_q	<= (others => '0');
			regs_q		<= (7 => (others => '1'), others => (others => '0'));
		elsif rising_edge(clock_master_i) then
			env_reset_s <= '0';
			if req_i = '1' and cs_n_i = '0' and wr_n_i = '0' then
				if    addr_i = "00"  then		-- Write register address
					reg_addr_q <= data_i;
				elsif addr_i = "01" then		-- Write to registers
					case reg_addr_q is
						when x"00" => regs_q(0)  <= data_i;
						when x"01" => regs_q(1)  <= data_i;
						when x"02" => regs_q(2)  <= data_i;
						when x"03" => regs_q(3)  <= data_i;
						when x"04" => regs_q(4)  <= data_i;
						when x"05" => regs_q(5)  <= data_i;
						when x"06" => regs_q(6)  <= data_i;
						when x"07" => regs_q(7)  <= data_i;
						when x"08" => regs_q(8)  <= data_i;
						when x"09" => regs_q(9)  <= data_i;
						when x"0A" => regs_q(10) <= data_i;
						when x"0B" => regs_q(11) <= data_i;
						when x"0C" => regs_q(12) <= data_i;
						when x"0D" => regs_q(13) <= data_i; env_reset_s <= '1';
						when x"0E" => regs_q(14) <= data_i;
						when x"0F" => regs_q(15) <= data_i;
						when others => null;
					end case;
				end if;
			end if;
		end if;
	end process;

	--
	p_divider : process(clock_master_i, clock_en_i)
	begin
		if rising_edge(clock_master_i) and clock_en_i = '1' then
			ena_div_s		<= '0';
			ena_div_noise_s	<= '0';
			if cnt_div_s = "0000" then
				cnt_div_s	<= "1111";
				ena_div_s	<= '1';
				noise_div_s <= not noise_div_s;
				if noise_div_s = '1' then
					ena_div_noise_s <= '1';
				end if;
			else
				cnt_div_s <= cnt_div_s - "1";
			end if;
		end if;
	end process;  

	--
	p_noise_gen : process(clock_master_i)
		variable noise_gen_comp_v : unsigned(4 downto 0)	:= (others => '0');
		variable poly17_zero_v : std_logic;
	begin
		if rising_edge(clock_master_i) then
			if regs_q(6)(4 downto 0) = "00000" then
				noise_gen_comp_v := "00000";
			else
				noise_gen_comp_v := unsigned( regs_q(6)(4 downto 0) ) - 1;
			end if;

			poly17_zero_v := '0';
			if poly17_s = "00000000000000000" then
				poly17_zero_v := '1'; 
			end if;

			if clock_en_i = '1' then
				if ena_div_noise_s = '1' then -- divider ena
					if noise_gen_cnt_s >= noise_gen_comp_v then
						noise_gen_cnt_s <= "00000";
						poly17_s <= (poly17_s(0) xor poly17_s(2) xor poly17_zero_v) & poly17_s(16 downto 1);
					else
						noise_gen_cnt_s <= noise_gen_cnt_s + 1;
					end if;
				end if;
			end if;
		end if;
	end process;

	--
	p_tone_gens : process(clock_master_i)
		variable tone_gen_freq_v : array_3x12_t	:= (others => (others => '0'));
		variable tone_gen_comp_v : array_3x12_t	:= (others => (others => '0'));
	begin
		if rising_edge(clock_master_i) then
			-- looks like real chips count up - we need to get the Exact behaviour ..
			tone_gen_freq_v(1) := regs_q(1)(3 downto 0) & regs_q(0);
			tone_gen_freq_v(2) := regs_q(3)(3 downto 0) & regs_q(2);
			tone_gen_freq_v(3) := regs_q(5)(3 downto 0) & regs_q(4);
		
			-- period 0 = period 1
			for i in 1 to 3 loop
				if (tone_gen_freq_v(i) = x"000") then
					tone_gen_comp_v(i) := x"000";
				else
					tone_gen_comp_v(i) := std_logic_vector( unsigned(tone_gen_freq_v(i)) - 1 );
				end if;
			end loop;

			if clock_en_i = '1' then
				for i in 1 to 3 loop
					if ena_div_s = '1' then -- divider ena

						if tone_gen_cnt_s(i) >= tone_gen_comp_v(i) then
							tone_gen_cnt_s(i) <= x"000";
							tone_gen_op_s(i) <= not tone_gen_op_s(i);
						else
							tone_gen_cnt_s(i) <= std_logic_vector( unsigned(tone_gen_cnt_s(i)) + 1 );
						end if;
					end if;
				end loop;
			end if;
		end if;
	end process;

	--
	p_envelope_freq : process(clock_master_i)
		variable env_gen_freq_v : std_logic_vector(15 downto 0)	:= (others => '0');
		variable env_gen_comp_v : std_logic_vector(15 downto 0)	:= (others => '0');
	begin
		if rising_edge(clock_master_i) then
	
			env_gen_freq_v := regs_q(12) & regs_q(11);
			-- envelope freqs 1 and 0 are the same.
			if (env_gen_freq_v = x"0000") then
				env_gen_comp_v := x"0000";
			else
				env_gen_comp_v := std_logic_vector( unsigned(env_gen_freq_v) - 1 );
			end if;

			if clock_en_i = '1' then
				env_ena_s <= '0';
				if ena_div_s = '1' then -- divider ena
					if env_gen_cnt_s >= env_gen_comp_v then
						env_gen_cnt_s <= x"0000";
						env_ena_s <= '1';
					else
						env_gen_cnt_s <= std_logic_vector( unsigned( env_gen_cnt_s ) + 1 );
					end if;
				end if;
			end if;
		end if;
	end process;

	--
	p_envelope_shape : process(clock_master_i)
		variable is_bot_v    : boolean;
		variable is_bot_p1_v : boolean;
		variable is_top_m1_v : boolean;
		variable is_top_v    : boolean;
	begin
        -- envelope shapes
        -- C AtAlH
        -- 0 0 x x  \___
        --
        -- 0 1 x x  /___
        --
        -- 1 0 0 0  \\\\
        --
        -- 1 0 0 1  \___
        --
        -- 1 0 1 0  \/\/
        --           ___
        -- 1 0 1 1  \
        --
        -- 1 1 0 0  ////
        --           ___
        -- 1 1 0 1  /
        --
        -- 1 1 1 0  /\/\
        --
        -- 1 1 1 1  /___
		if rising_edge(clock_master_i) then
			if env_reset_s = '1' then
				-- load initial state
				if (regs_q(13)(2) = '0') then -- attack
					env_vol_s <= "11111";
					env_inc_s <= '0'; -- -1
				else
					env_vol_s <= "00000";
					env_inc_s <= '1'; -- +1
				end if;
				env_hold_s <= '0';
			else
				is_bot_v    := (env_vol_s = "00000");
				is_bot_p1_v := (env_vol_s = "00001");
				is_top_m1_v := (env_vol_s = "11110");
				is_top_v    := (env_vol_s = "11111");

				if clock_en_i = '1' then
					if env_ena_s = '1' then
						if env_hold_s = '0' then
							if env_inc_s = '1' then
								env_vol_s <= std_logic_vector( unsigned( env_vol_s ) + "00001");
							else
								env_vol_s <= std_logic_vector( unsigned( env_vol_s ) + "11111");
							end if;
						end if;

						-- envelope shape control.
						if (regs_q(13)(3) = '0') then
							if (env_inc_s = '0') then -- down
								if is_bot_p1_v then
									env_hold_s <= '1'; 
								end if;
							else
								if is_top_v then
									env_hold_s <= '1';
								end if;
							end if;
						else
							if (regs_q(13)(0) = '1') then -- hold = 1
								if (env_inc_s = '0') then -- down
									if (regs_q(13)(1) = '1') then -- alt
										if is_bot_v then
											env_hold_s <= '1';
										end if;
									else
										if is_bot_p1_v then
											env_hold_s <= '1';
										end if;
									end if;
								else
									if (regs_q(13)(1) = '1') then -- alt
										if is_top_v then
											env_hold_s <= '1';
										end if;
									else
										if is_top_m1_v then
											env_hold_s <= '1'; 
										end if;
									end if;
								end if;

							elsif (regs_q(13)(1) = '1') then -- alternate
								if (env_inc_s = '0') then -- down
									if is_bot_p1_v then 
										env_hold_s <= '1';
									end if;
									if is_bot_v then
										env_hold_s <= '0';
										env_inc_s <= '1';
									end if;
								else
									if is_top_m1_v then
										env_hold_s <= '1';
									end if;
									if is_top_v then
										env_hold_s <= '0';
										env_inc_s <= '0';
									end if;
								end if;
							end if;
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;

	--
	p_chan_mixer_table : process(clock_master_i)
		variable chan_mixed_v : std_logic_vector(2 downto 0);
	begin
		if rising_edge(clock_master_i) then
			if clock_en_i = '1' then
				chan_mixed_v(0) := (regs_q(7)(0) or tone_gen_op_s(1)) and (regs_q(7)(3) or noise_gen_op_s);
				chan_mixed_v(1) := (regs_q(7)(1) or tone_gen_op_s(2)) and (regs_q(7)(4) or noise_gen_op_s);
				chan_mixed_v(2) := (regs_q(7)(2) or tone_gen_op_s(3)) and (regs_q(7)(5) or noise_gen_op_s);

				ch_a_s <= "00000";
				ch_b_s <= "00000";
				ch_c_s <= "00000";

				if (chan_mixed_v(0) = '1') then
					if (regs_q(8)(4) = '0') then
						ch_a_s <= regs_q(8)(3 downto 0) & "1";
					else
						ch_a_s <= env_vol_s(4 downto 0);
					end if;
				end if;

				if (chan_mixed_v(1) = '1') then
					if (regs_q(9)(4) = '0') then
						ch_b_s <= regs_q(9)(3 downto 0) & "1";
					else
						ch_b_s <= env_vol_s(4 downto 0);
					end if;
				end if;

				if (chan_mixed_v(2) = '1') then
					if (regs_q(10)(4) = '0') then
						ch_c_s <= regs_q(10)(3 downto 0) & "1";
					else
						ch_c_s <= env_vol_s(4 downto 0);
					end if;
				end if;
			end if;
		end if;    
	end process;

	--
	process(clock_master_i)
		variable out_audio_mixed_v : unsigned(9 downto 0);
	begin
		if rising_edge(clock_master_i) then
			if reset_i = '1' then
				audio_ch_mix_o	<= x"00";
				audio_ch_a_o	<= x"00";
				audio_ch_b_o	<= x"00";
				audio_ch_c_o	<= x"00";
			else
				if ayymmode_i = '0' then
					out_audio_mixed_v :=		("00" & volTableYm_c( to_integer( unsigned( ch_a_s )))) + 
												("00" & volTableYm_c( to_integer( unsigned( ch_b_s )))) + 
												("00" & volTableYm_c( to_integer( unsigned( ch_c_s ))));
					audio_ch_mix_o	<= out_audio_mixed_v(9 downto 2);
					audio_ch_a_o	<= std_logic_vector( volTableYm_c( to_integer( unsigned( ch_a_s ) ) ) );
					audio_ch_b_o	<= std_logic_vector( volTableYm_c( to_integer( unsigned( ch_b_s ) ) ) );
					audio_ch_c_o	<= std_logic_vector( volTableYm_c( to_integer( unsigned( ch_c_s ) ) ) );
				else
					out_audio_mixed_v :=		( "00" & volTableAy_c( to_integer( unsigned( ch_a_s(4 downto 1) )))) + 
												( "00" & volTableAy_c( to_integer( unsigned( ch_b_s(4 downto 1) )))) + 
												( "00" & volTableAy_c( to_integer( unsigned( ch_c_s(4 downto 1) ))));
					audio_ch_mix_o	<= out_audio_mixed_v(9 downto 2);
					audio_ch_a_o	<= std_logic_vector( volTableAy_c( to_integer( unsigned( ch_a_s(4 downto 1) ) ) ) );
					audio_ch_b_o	<= std_logic_vector( volTableAy_c( to_integer( unsigned( ch_b_s(4 downto 1) ) ) ) );
					audio_ch_c_o	<= std_logic_vector( volTableAy_c( to_integer( unsigned( ch_c_s(4 downto 1) ) ) ) );
				end if;
			end if;
		end if;
	end process;

	-- Glue
	port_b_o 		<= regs_q(15);
	noise_gen_op_s	<= poly17_s(0);

end architecture RTL;
