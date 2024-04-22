-------------------------------------------------------------------------------
--
-- MSX1 FPGA project
--
-- Copyright (c) 2016, Fabio Belavenuto (belavenuto@gmail.com)
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
-- Please report bugs to the author, but before you do so, please
-- make sure that this is not a derivative work and that
-- you have the latest version of this file.
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.msx_pack.all;

entity swioports is
	port (
		por_i				: in  std_logic;
		reset_i				: in  std_logic;
		clock_i				: in  std_logic;
		addr_i				: in  std_logic_vector( 3 downto 0);
		req_i				: in  std_logic;						-- One pulse
		cs_n_i				: in  std_logic;
		rd_n_i				: in  std_logic;
		wr_n_i				: in  std_logic;
		data_i				: in  std_logic_vector( 7 downto 0);
		data_o				: out std_logic_vector( 7 downto 0);
		--
		hw_id_i				: in  std_logic_vector( 7 downto 0);
		hw_txt_i			: in  string;
		hw_version_i		: in  std_logic_vector( 7 downto 0);
		hw_memsize_i		: in  std_logic_vector( 7 downto 0);
		hw_hashwds_i		: in  std_logic;
		nextor_en_i			: in  std_logic;
		mr_type_i			: in  std_logic_vector( 1 downto 0);
		vga_on_i			: in  std_logic;
		turbo_on_k_i		: in  std_logic;
		vga_on_k_i			: in  std_logic;
		scanline_on_k_i		: in  std_logic;
		vertfreq_on_k_i		: in  std_logic;
		vertfreq_csw_i		: in  std_logic;
		vertfreq_d_i		: in  std_logic;
		keyb_valid_i		: in  std_logic;
		keyb_data_i			: in  std_logic_vector( 7 downto 0);
		--
		nextor_en_o			: out std_logic;
		mr_type_o			: out std_logic_vector( 1 downto 0);
		turbo_on_o			: out std_logic;
		reload_o			: out std_logic;
		softreset_o			: out std_logic;
		vga_en_o			: out std_logic;
		scanline_en_o		: out std_logic;
		ntsc_pal_o			: out std_logic;		-- 0 = NTSC
		keymap_addr_o		: out std_logic_vector( 8 downto 0);
		keymap_data_o		: out std_logic_vector( 7 downto 0);
		keymap_we_n_o		: out std_logic;
		volumes_o			: out volumes_t
	);
end entity;

architecture Behavior of swioports is

	constant MYMKID_C		: std_logic_vector(7 downto 0) := X"28";
	constant PANAMKID_C		: std_logic_vector(7 downto 0) := X"08";
	constant OCMMKID_C		: std_logic_vector(7 downto 0) := X"D4";

	signal maker_id_s		: std_logic_vector(7 downto 0);
	signal reg_addr_q		: std_logic_vector(7 downto 0);
	signal reg_data_q		: std_logic_vector(7 downto 0);
	signal nextor_en_q		: std_logic;
	signal mapper_q			: std_logic_vector(1 downto 0);
	signal turbo_on_q		: std_logic								:= '0';
	signal reload_q			: std_logic								:= '0';
	signal softreset_q		: std_logic								:= '0';
	signal spulse_r_s		: std_logic_vector(1 downto 0)	:= (others => '0');
	signal spulse_w_s		: std_logic_vector(1 downto 0)	:= (others => '0');
	signal keyfifo_r_s		: std_logic								:= '0';
	signal keyfifo_w_s		: std_logic								:= '0';
	signal keyfifo_data_s	: std_logic_vector(7 downto 0);
	signal keyfifo_empty_s	: std_logic;
	signal keyfifo_full_s	: std_logic;
	signal keymap_addr_q	: unsigned(8 downto 0);
	signal keymap_data_q	: std_logic_vector(7 downto 0);
	signal keymap_we_n_s	: std_logic;
	signal vga_en_q			: std_logic;
	signal scanline_en_q	: std_logic								:= '0';
	signal ntsc_pal_q		: std_logic								:= '0';
	signal volumes_q		: volumes_t;

begin

	-- PS/2 keyscan FIFO
	ps2fifo : entity work.fifo
	generic map (
		DATA_WIDTH_G	=> 8,
		FIFO_DEPTH_G	=> 16
	)
	port map (
		clock_i		=> clock_i,
		reset_i		=> reset_i,
		write_en_i	=> keyfifo_w_s,
		data_i		=> keyb_data_i,
		read_en_i	=> keyfifo_r_s,
		data_o		=> keyfifo_data_s,
		empty_o		=> keyfifo_empty_s,
		full_o		=> keyfifo_full_s
	);

	keyfifo_r_s	<= '1' when spulse_r_s = "01"	else '0';
	keyfifo_w_s	<= '1' when spulse_w_s = "01"	else '0';
	
	-- Maker ID
	process (reset_i, clock_i)
	begin
		if reset_i = '1' then
			maker_id_s <= (others => '0');
		elsif rising_edge(clock_i) then
			if req_i = '1' and cs_n_i = '0' and wr_n_i = '0' and addr_i = X"0" then
				if data_i = PANAMKID_C or data_i = MYMKID_C or data_i = OCMMKID_C then
					maker_id_s <= data_i;
				else
					maker_id_s <= X"00";
				end if;
			end if;
		end if;
	end process;

	data_o <=	not maker_id_s	when cs_n_i = '0' and rd_n_i = '0' and addr_i = X"0"	else
					reg_data_q;

	-- Set register number (only if maker id = 40)
	process (reset_i, clock_i)
	begin
		if reset_i = '1' then
			reg_addr_q <= (others => '0');
		elsif rising_edge(clock_i) then
			if req_i = '1' and cs_n_i = '0' and wr_n_i = '0' and maker_id_s = MYMKID_C and addr_i = X"8" then
				reg_addr_q <= data_i;
			end if;
		end if;
	end process;

	-- Write to Switched I/O ports
	process (por_i, reset_i, clock_i, nextor_en_i, mr_type_i, vga_on_i)
		variable turbo_on_de_v	: std_logic_vector(1 downto 0) := "00";
		variable vga_on_de_v	: std_logic_vector(1 downto 0) := "00";
		variable scln_on_de_v	: std_logic_vector(1 downto 0) := "00";
		variable vf_on_de_v		: std_logic_vector(1 downto 0) := "00";
		variable keymap_we_a_v	: std_logic;
	begin
		if por_i = '1' then
			nextor_en_q		<= nextor_en_i;
			mapper_q		<= mr_type_i;
			turbo_on_q		<= '0';
			vga_en_q		<= vga_on_i;
			scanline_en_q	<= '0';
			ntsc_pal_q		<= '0';
			reload_q		<= '0';
			-- default volumes
			volumes_q.beep	<= std_logic_vector(to_unsigned(default_vol_beep, 8));
			volumes_q.ear	<= std_logic_vector(to_unsigned(default_vol_ear, 8));
			volumes_q.psg	<= std_logic_vector(to_unsigned(default_vol_psg, 8));
			volumes_q.scc	<= std_logic_vector(to_unsigned(default_vol_scc, 8));
			volumes_q.opll	<= std_logic_vector(to_unsigned(default_vol_opll, 8));
			volumes_q.aux1	<= std_logic_vector(to_unsigned(default_vol_aux1, 8));

		elsif reset_i = '1' then
			softreset_q		<= '0';
			keymap_we_n_s	<= '1';
		elsif rising_edge(clock_i) then
			turbo_on_de_v	:= turbo_on_de_v(0) & turbo_on_k_i;
			vga_on_de_v		:= vga_on_de_v(0)   & vga_on_k_i;
			scln_on_de_v	:= scln_on_de_v(0)  & scanline_on_k_i;
			vf_on_de_v		:= vf_on_de_v(0)    & vertfreq_on_k_i;
			if turbo_on_de_v = "01" then
				turbo_on_q <= not turbo_on_q;
			end if;
			if vga_on_de_v = "01" then
				vga_en_q <= not vga_en_q;
			end if;
			if scln_on_de_v = "01" then
				scanline_en_q <= not scanline_en_q;
			end if;
			if vf_on_de_v = "01" then
				ntsc_pal_q	<= not ntsc_pal_q;
			end if;
			keymap_we_n_s	<= '1';		-- default
			-- Vertical frequency control by VDP
			if vertfreq_csw_i = '1' then
				ntsc_pal_q	<= vertfreq_d_i;
			end if;

			-- Panasonic
			if    req_i = '1' and cs_n_i = '0' and wr_n_i = '0' and maker_id_s = PANAMKID_C then
				if addr_i = X"1" then
					turbo_on_q <= not data_i(0);
				end if;
			-- MSX1FPGA ID
			elsif req_i = '1' and cs_n_i = '0' and wr_n_i = '0' and maker_id_s = MYMKID_C and addr_i = X"9" then
				case reg_addr_q is
					when X"0A" =>
						reload_q		<= data_i(7);
						softreset_q		<= data_i(0);
					when X"0D" =>
						keymap_addr_q(7 downto 0) <= unsigned(data_i);
					when X"0E" =>
						keymap_addr_q(8 downto 8) <= unsigned(data_i(0 downto 0));
					when X"0F" =>
						keymap_data_q	<= data_i;
						keymap_we_n_s	<= '0';
					when X"10" =>
						ntsc_pal_q		<= data_i(3);
						scanline_en_q	<= data_i(2);
						vga_en_q		<= data_i(1);
						nextor_en_q		<= data_i(0);
					when X"11" =>
						mapper_q		<= data_i(1 downto 0);
					when X"12" =>
						turbo_on_q		<= data_i(0);
					when X"20" =>
						volumes_q.beep	<= data_i;
					when X"21" =>
						volumes_q.ear	<= data_i;
					when X"22" =>
						volumes_q.psg	<= data_i;
					when X"23" =>
						volumes_q.scc	<= data_i;
					when X"24" =>
						volumes_q.opll	<= data_i;
					when X"25" =>
						volumes_q.aux1	<= data_i;
					when others =>
						null;
				end case;
			-- KdL ID (only for MGLOCM)
			elsif req_i = '1' and cs_n_i = '0' and wr_n_i = '0' and maker_id_s = OCMMKID_C then
				if    addr_i = X"1" then
					-- Smart Command
					if    data_i = X"03" then
						turbo_on_q <= '0';
					elsif data_i = X"0A" then
						turbo_on_q <= '1';
					elsif data_i = X"0F" then
						mapper_q <= "00";
					elsif data_i = X"10" then
						mapper_q <= "00";
					elsif data_i = X"11" then
						mapper_q <= "01";
					elsif data_i = X"12" then
						mapper_q <= "01";
					elsif data_i = X"13" then
						mapper_q <= "11";
					elsif data_i = X"14" then
						mapper_q <= "11";
					elsif data_i = X"41" then
						turbo_on_q <= '1';
					end if;
				end if;
			end if;
			if keymap_we_a_v = '0' and keymap_we_n_s = '1' then
				keymap_addr_q <= keymap_addr_q + 1;
			end if;
			keymap_we_a_v	:= keymap_we_n_s;
		end if;
	end process;

	-- Detect edges for reading and writing FIFO
	process (reset_i, clock_i)
	begin
		if reset_i = '1' then
			spulse_r_s	<= (others => '0');
			spulse_w_s	<= (others => '0');
		elsif rising_edge(clock_i) then
			spulse_w_s		<= spulse_w_s(0) & keyb_valid_i;
			spulse_r_s		<= spulse_r_s(0) & '0';
			if req_i = '1' and cs_n_i = '0' and rd_n_i = '0' and maker_id_s = MYMKID_C and addr_i = X"49" then
				if reg_addr_q = X"0C" then
					spulse_r_s(0)	<= '1';
				end if;
			end if;
		end if;
	end process;

	-- Reading register
	process (reset_i, clock_i)
		variable index_v		: integer range 0 to 20	:= 0;
		variable reading_v	: boolean	:= false;
		variable char_v		: character;
	begin
		if reset_i = '1' then
			reading_v 	:= false;
			index_v		:= 0;
		elsif rising_edge(clock_i) then
			-- Panasonic
			if    req_i = '1' and cs_n_i = '0' and rd_n_i = '0' and maker_id_s = PANAMKID_C then
				if addr_i = X"1" then
					reg_data_q			<= "0000000" & not turbo_on_q;
				end if;
			-- MSX1FPGA ID
			elsif req_i = '1' and cs_n_i = '0' and rd_n_i = '0' and maker_id_s = MYMKID_C and addr_i = X"9" then
				case reg_addr_q is
					when X"00" =>
						reg_data_q			<= hw_id_i;
						index_v				:= 0;
					when X"01" =>
						if index_v = hw_txt_i'length then
							reg_data_q		<= (others => '0');
						else
							char_v			:= hw_txt_i(index_v + 1);
							reg_data_q		<= std_logic_vector(to_unsigned(character'pos(char_v), 8));
						end if;
						reading_v			:= true;
					when X"02" =>
						reg_data_q			<= hw_version_i;
					when X"03" =>
						reg_data_q			<= hw_memsize_i;
					when X"04" =>
						reg_data_q			<= "0000000" & hw_hashwds_i;
					when X"0B" =>
						reg_data_q			<= "000000" & keyfifo_empty_s & keyfifo_full_s;
					when X"0C" =>
						reg_data_q			<= keyfifo_data_s;
					when X"10" =>
						reg_data_q			<= "0000" & ntsc_pal_q & scanline_en_q & vga_en_q & nextor_en_q;
					when X"11" =>
						reg_data_q			<= "000000" & mapper_q;
					when X"12" =>
						reg_data_q			<= "0000000" & turbo_on_q;
					when X"20" =>
						reg_data_q			<= volumes_q.beep;
					when X"21" =>
						reg_data_q			<= volumes_q.ear;
					when X"22" =>
						reg_data_q			<= volumes_q.psg;
					when X"23" =>
						reg_data_q			<= volumes_q.scc;
					when X"24" =>
						reg_data_q			<= volumes_q.opll;
					when X"25" =>
						reg_data_q			<= volumes_q.aux1;
					when others =>
						null;
				end case;
			-- KdL ID
			elsif req_i = '1' and cs_n_i = '0' and rd_n_i = '0' and maker_id_s = OCMMKID_C then
				if    addr_i = X"2" then
					reg_data_q			<= nextor_en_q & "0" & mapper_q & "0000";
				elsif addr_i = X"9" then
					reg_data_q			<= "01000000";
				elsif addr_i = X"E" then
					reg_data_q			<= nextor_en_q & "0" & mapper_q & "0000";
				elsif addr_i = X"F" then
					reg_data_q			<= "00000100";
				end if;
			elsif reading_v then
				if index_v < hw_txt_i'length then
					index_v 	:= index_v + 1;
				end if;
				reading_v	:= false;
			end if;

		end if;
	end process;

	--
	nextor_en_o		<= nextor_en_q;
	mr_type_o		<= mapper_q;
	turbo_on_o		<= turbo_on_q;
	reload_o		<= reload_q;
	softreset_o		<= softreset_q;
	keymap_addr_o	<= std_logic_vector(keymap_addr_q);
	keymap_data_o	<= keymap_data_q;
	keymap_we_n_o	<= keymap_we_n_s;
	vga_en_o		<= vga_en_q;
	scanline_en_o	<= scanline_en_q;
	ntsc_pal_o		<= ntsc_pal_q;
	volumes_o		<= volumes_q;

end architecture;
