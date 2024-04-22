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
-- version 006 Merge different variants by Alexey Melnikov
-- version 005 Papilio release by Jack Gassett
-- version 004 spartan3e release
-- version 003 Jan 2006 release, general tidy up
-- version 002 optional vga scan doubler
-- version 001 initial release
--
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;

entity PACMAN is
port
(
	O_VIDEO_R  : out std_logic_vector(2 downto 0);
	O_VIDEO_G  : out std_logic_vector(2 downto 0);
	O_VIDEO_B  : out std_logic_vector(1 downto 0);
	O_HSYNC    : out std_logic;
	O_VSYNC    : out std_logic;
	O_HBLANK   : out std_logic;
	O_VBLANK   : out std_logic;
	--
	O_AUDIO    : out std_logic_vector(9 downto 0);
	--
	in0        : in  std_logic_vector(7 downto 0);
	in1        : in  std_logic_vector(7 downto 0);
	dipsw1     : in  std_logic_vector(7 downto 0);
	dipsw2     : in  std_logic_vector(7 downto 0);
	--
	mod_plus   : in  std_logic;
	mod_jmpst  : in  std_logic;
	mod_bird   : in  std_logic;
	mod_mrtnt  : in  std_logic;
	mod_ms     : in  std_logic;
	mod_woodp  : in  std_logic;
	mod_eeek   : in  std_logic;
	mod_glob   : in  std_logic;
	mod_alib   : in  std_logic;
	mod_ponp   : in  std_logic;
	mod_van    : in  std_logic;
	mod_dshop  : in  std_logic;
	mod_club   : in  std_logic;

	flip_screen : in  std_logic;
	h_offset    : in  std_logic_vector(2 downto 0);
	v_offset    : in  std_logic_vector(2 downto 0);

	--
	dn_addr    : in  std_logic_vector(15 downto 0);
	dn_data    : in  std_logic_vector(7 downto 0);
	dn_wr      : in  std_logic;

	pause      : in  std_logic;
	--
	RESET      : in  std_logic;
	CLK        : in  std_logic;
	ENA_6      : in  std_logic;
	ENA_4      : in  std_logic;
	ENA_1M79   : in  std_logic
);
end;

architecture RTL of PACMAN is
	-- timing
	signal hcnt             : std_logic_vector(8 downto 0) := "010000000"; -- 80
	signal vcnt             : std_logic_vector(8 downto 0) := "011111000"; -- 0F8
	signal vcnt_offset      : std_logic_vector(8 downto 0);

	signal do_vcnt_check    : boolean;
	signal hsync            : std_logic;
	signal vsync            : std_logic;
	signal hblank           : std_logic;
	signal vblank           : std_logic := '1';

	-- cpu
	signal cpu_m1_l         : std_logic;
	signal cpu_mreq_l       : std_logic;
	signal cpu_iorq_l       : std_logic;
	signal cpu_rd_l         : std_logic;
	signal cpu_wr_l         : std_logic;
	signal cpu_rfsh_l       : std_logic;
	signal cpu_int_l        : std_logic;
	signal cpu_addr         : std_logic_vector(15 downto 0);
	signal cpu_data_out     : std_logic_vector(7 downto 0);
	signal cpu_data_in      : std_logic_vector(7 downto 0);

	signal vram_l           : std_logic;
	signal ram_data         : std_logic_vector(7 downto 0);
	signal ram2_we          : std_logic;
	signal ram2_cs          : std_logic;
	signal ram2_data        : std_logic_vector(7 downto 0);

	signal mcnt             : std_logic_vector(7 downto 0);
	signal mcnt2            : std_logic_vector(10 downto 0);
	signal dcnt             : std_logic_vector(1 downto 0);
	signal old_rd_l         : std_logic;
	signal old_rd_l2        : std_logic;
	signal rom_data         : std_logic_vector(7 downto 0);

	signal sync_bus_cs_l    : std_logic;

	signal control_reg      : std_logic_vector(7 downto 0);
	signal c_flip           : std_logic;
	signal c_int            : std_logic;
	signal c_sound          : std_logic;

	signal hp               : std_logic_vector( 4 downto 0);
	signal vp               : std_logic_vector( 4 downto 0);
	signal vram_addr        : std_logic_vector(11 downto 0);
	signal vram_addr_ab     : std_logic_vector(11 downto 0);
	signal ab               : std_logic_vector(11 downto 0);

	signal sync_bus_db      : std_logic_vector(7 downto 0);
	signal sync_bus_r_w_l   : std_logic;
	signal sync_bus_wreq_l  : std_logic;
	signal sync_bus_stb     : std_logic;

	signal inj              : std_logic_vector(3 downto 0);

	signal cpu_vec_reg      : std_logic_vector(7 downto 0);
	signal sync_bus_reg     : std_logic_vector(7 downto 0);

	-- more decode
	signal wr0_l            : std_logic;
	signal wr1_l            : std_logic;
	signal wr2_l            : std_logic;
	signal iodec_out_l      : std_logic;
	signal iodec_wdr_l      : std_logic;
	signal iodec_in0_l      : std_logic;
	signal iodec_in1_l      : std_logic;
	signal iodec_dipsw1_l   : std_logic;
	signal iodec_dipsw2_l   : std_logic;
	signal iodec_myst1_l    : std_logic;
	signal iodec_myst2_l    : std_logic;
	signal iodec_nop_l      : std_logic;
	signal iodec_01         : std_logic;

	-- watchdog
	signal watchdog_cnt     : std_logic_vector(7 downto 0);
	signal watchdog_reset_l : std_logic;

	signal sn1_ce           : std_logic;
	signal sn2_ce           : std_logic;
	signal sn1_ready        : std_logic;
	signal sn2_ready        : std_logic;
	signal sn_d             : std_logic_vector(7 downto 0);
	signal old_we           : std_logic;
	signal wav1u,wav2u      : std_logic_vector(7 downto 0);
	signal ay_out           : std_logic_vector(9 downto 0);
	signal wav4u            : std_logic_vector(7 downto 0);
	signal ay_we            : std_logic;

begin

--
-- video timing
--
p_hvcnt : process
begin
	wait until rising_edge(clk);
	if (ena_6 = '1') then
		if hcnt = "111111111" then
			hcnt <= "010000000"; -- 080
		else
			hcnt <= hcnt +"1";
		end if;
		-- hcnt 8 on circuit is 256H_L
		if do_vcnt_check then
			if vcnt = "111111111" then
				vcnt <= "011111000"; -- 0F8
			else
				vcnt <= vcnt +"1";
			end if;
		end if;
	end if;
end process;

vcnt_offset <= vcnt + v_offset;
vsync <= not vcnt_offset(8);
do_vcnt_check <= (hcnt = "010101111"); -- 0AF

p_sync : process
begin
	wait until rising_edge(clk);
	if (ena_6 = '1') then
		-- Timing hardware is coded differently to the real hw
		-- to avoid the use of multiple clocks. Result is identical.

		if (hcnt = "010011000") then -- 098
			O_HBLANK <= '1';
		elsif (hcnt = "010001111" and mod_ponp = '0') or (hcnt = "111111111" and mod_ponp = '1') then -- 08F
			hblank <= '1';
		elsif (hcnt = "011101111" and mod_ponp = '0') or (hcnt = "011111111" and mod_ponp = '1') then
			hblank <= '0'; -- 0EF
		elsif (hcnt = "011111000") then -- 0F8
			O_HBLANK <= '0';
		end if;

		if (hcnt = "010101111" + h_offset) then -- 0AF (+h_offset)
			hsync <= '1';
		elsif (hcnt = "011001111" + h_offset) then -- 0CF (+h_offset)
			hsync <= '0';
		end if;

		if do_vcnt_check then
			if (vcnt = "111101111") then -- 1EF
				vblank <= '1';
			elsif (vcnt = "100001111") then -- 10F
				vblank <= '0';
			end if;
		end if;
	end if;
end process;

--
-- cpu
--
p_irq_req_watchdog : process
	variable rising_vblank : boolean;
begin
	wait until rising_edge(clk);
	if (ena_6 = '1') then
		rising_vblank := (hcnt = "010101111") and (vcnt = "111101111"); -- AF and 1EF
		-- interrupt 8c

		if (c_int = '0') then
			cpu_int_l <= '1';
		elsif rising_vblank then -- 1EF
			cpu_int_l <= '0';
		end if;

		-- watchdog 8c
		-- note sync reset
		if (reset = '1') then
			watchdog_cnt <= X"FF";
		elsif (iodec_wdr_l = '0') then
			watchdog_cnt <= X"00";
		elsif (pause = '1') then
			watchdog_cnt <= X"00";
		elsif rising_vblank then
			watchdog_cnt <= watchdog_cnt + "1";
		end if;

		watchdog_reset_l <= '1';
		if (watchdog_cnt = X"FF") then
			watchdog_reset_l <= '0';
		end if;
	end if;
end process;

u_cpu : work.T80sed
port map (
	RESET_n => watchdog_reset_l and (not reset),
	CLK_n   => clk,
	CLKEN   => hcnt(0) and ena_6,
	WAIT_n  => sync_bus_wreq_l and (not pause),
	INT_n   => cpu_int_l or     mod_van,
	NMI_n   => cpu_int_l or not mod_van,
	BUSRQ_n => '1',
	M1_n    => cpu_m1_l,
	MREQ_n  => cpu_mreq_l,
	IORQ_n  => cpu_iorq_l,
	RD_n    => cpu_rd_l,
	WR_n    => cpu_wr_l,
	RFSH_n  => cpu_rfsh_l,
	HALT_n  => open,
	BUSAK_n => open,
	A       => cpu_addr,
	DI      => cpu_data_in,
	DO      => cpu_data_out
);

--
-- primary addr decode
--
-- syncbus 0x4000 - 0x7FFF
sync_bus_cs_l   <= '0' when cpu_mreq_l = '0' and cpu_rfsh_l = '1' and cpu_addr(14) = '1' else '1';
sync_bus_wreq_l <= '0' when sync_bus_cs_l = '0' and hcnt(1) = '1' and cpu_rd_l = '0' else '1';
sync_bus_stb    <= '0' when sync_bus_cs_l = '0' and hcnt(1) = '0' else '1';
sync_bus_r_w_l  <= '0' when sync_bus_stb  = '0' and cpu_rd_l = '1' else '1';
 
--
-- sync bus custom ic
--
p_sync_bus_reg : process
begin
	wait until rising_edge(clk);
	if (ena_6 = '1') then
		-- register on sync bus module that is used to store interrupt vector
		if (cpu_iorq_l = '0') and (cpu_m1_l = '1') then
			cpu_vec_reg <= cpu_data_out;
		end if;

		-- read holding reg
		if (hcnt(1 downto 0) = "01") then
			sync_bus_reg <= cpu_data_in;
		end if;
	end if;
end process;

--
-- vram addr custom ic
--
u_vram_addr : work.PACMAN_VRAM_ADDR
port map (
	AB      => vram_addr_ab,
	H256_L  => hcnt(8),
	H128    => hcnt(7),
	H64     => hcnt(6),
	H32     => hcnt(5),
	H16     => hcnt(4),
	H8      => hcnt(3),
	H4      => hcnt(2),
	H2      => hcnt(1),
	H1      => hcnt(0),
	V128    => vcnt(7),
	V64     => vcnt(6),
	V32     => vcnt(5),
	V16     => vcnt(4),
	V8      => vcnt(3),
	V4      => vcnt(2),
	V2      => vcnt(1),
	V1      => vcnt(0),
	FLIP    => c_flip
);

hp <= hcnt(7 downto 3) when c_flip = '0' else not hcnt(7 downto 3);
vp <= vcnt(7 downto 3) when c_flip = '0' else not vcnt(7 downto 3);
vram_addr <= vram_addr_ab when mod_alib = '0' and mod_ponp = '0' else '0' & hcnt(2) & vp & hp when hcnt(8)='1' else
             x"FF" & hcnt(6 downto 4) & hcnt(2) when hblank = '1' and mod_ponp = '1' else
             x"EF" & hcnt(6 downto 4) & hcnt(2) when hblank = '1' else
             '0' & hcnt(2) & hp(3) & hp(3) & hp(3) & hp(3) & hp(0) & vp;

--When 2H is low, the CPU controls the bus.
ab <= cpu_addr(11 downto 0) when hcnt(1) = '0' else vram_addr;
sync_bus_db <= cpu_data_out when hcnt(1) = '0' else ram_data;

--vram_l <= not (not (cpu_addr(12) or sync_bus_stb) or (hcnt(1) and hcnt(0)));
vram_l <= (cpu_addr(12) or sync_bus_stb) and not (hcnt(1) and hcnt(0));

iodec_01 <= '1' when cpu_addr(5 downto 1) = "00000" else '0';

p_io_decode_comb : process(sync_bus_r_w_l, sync_bus_stb, ab, cpu_addr, mod_bird, mod_alib, iodec_01, mod_dshop)
	variable sel  : std_logic_vector(2 downto 0);
	variable dec  : std_logic_vector(7 downto 0);
	variable selb : std_logic_vector(1 downto 0);
	variable decb : std_logic_vector(3 downto 0);
begin
	-- PACMAN

	-- WRITE
	-- wr0_l    0x5040 - 0x504F sound
	-- wr1_l    0x5050 - 0x505F sound
	-- wr2_l    0x5060 - 0x506F sprite
	--          0x5080 - 0x50BF unused
	-- out_l    0x5000 - 0x503F control space
	-- wdr_l    0x50C0 - 0x50FF watchdog reset

	-- READ
	-- dipsw1_l 0x5080 - 0x50BF dip switches
	-- in1_l    0x5040 - 0x507F in port 1
	-- in0_l    0x5000 - 0x503F in port 0

	-- 7J
	dec := "11111111";
	sel := sync_bus_r_w_l & ab(7) & ab(6);
	if (cpu_addr(12) = '1') and ( sync_bus_stb = '0')  then
		case sel is
			when "000" => dec := "11111110";
			when "001" => dec := "11111101";
			when "010" => dec := "11111011";
			when "011" => dec := "11110111";
			when "100" => dec := "11101111";
			when "101" => dec := "11011111";
			when "110" => dec := "10111111";
			when "111" => dec := "01111111";
			when others => null;
		end case;
	end if;

	if mod_alib = '1' then
		iodec_wdr_l   <= dec(0);
		iodec_out_l   <= dec(3);
	else
		iodec_out_l   <= dec(0);
		iodec_wdr_l   <= dec(3);
	end if;

	iodec_in0_l   <= dec(4);
	iodec_in1_l   <= dec(5);
	iodec_dipsw1_l<= dec(6);
	iodec_dipsw2_l<= dec(7) or mod_alib;

	iodec_myst1_l <= dec(7) or not iodec_01 or     cpu_addr(0) or not mod_alib;
	iodec_myst2_l <= dec(7) or not iodec_01 or not cpu_addr(0) or not mod_alib;
	iodec_nop_l   <= dec(7) or     iodec_01                    or not mod_alib;

	-- 7M
	decb := "1111";
	selb := ab(5) & ab(4);
	if (dec(2) = '0' and mod_bird = '1') or (dec(1) = '0' and mod_bird = '0') then
		case selb is
			when "00" => decb := "1110";
			when "01" => decb := "1101";
			when "10" => decb := "1011";
			when "11" => decb := "0111";
			when others => null;
		end case;
	end if;

	wr0_l <= decb(0);
	wr1_l <= decb(1);
	wr2_l <= decb(2);

	if mod_alib = '1' then
		wr2_l <= decb(1);
		wr1_l <= decb(2);
	end if;

	if mod_dshop = '1' then
		wr2_l <= dec(1);
	end if;

end process;

p_control_reg : process
begin
	-- 8 bit addressable latch 7K  (made into register)

	--   PACMAN
	-- 0 Interrupt ena
	-- 1 Sound ena
	-- 2 Not used
	-- 3 Flip
	-- 4 1 player start lamp
	-- 5 2 player start lamp
	-- 6 Coin lockout
	-- 7 Coin counter

	wait until rising_edge(clk);
	if (ena_6 = '1') then
		if (watchdog_reset_l = '0') then
			control_reg <= (others => '0');
		elsif (iodec_out_l = '0') then
			control_reg(to_integer(unsigned(cpu_addr(2 downto 0)))) <= cpu_data_out(0);
		end if;
	end if;
end process;

c_flip <= flip_screen xor control_reg(1) when mod_alib = '1' else flip_screen xor control_reg(5) when mod_bird = '1' else control_reg(3) xor flip_screen;
c_sound<= control_reg(0) when mod_alib = '1' else control_reg(3) when mod_bird = '1' else control_reg(1);
c_int  <= control_reg(2) when mod_alib = '1' else control_reg(1) when mod_bird = '1' else control_reg(0);

p_mcnt : process
begin
	wait until rising_edge(clk);
	mcnt <= (mcnt + "1") + ("0000000" & (in0(3) xor in0(2) xor in0(1) xor in0(0)));
	if (ena_6 = '1') then
		old_rd_l2 <= cpu_rd_l;
		if iodec_myst2_l = '0' and old_rd_l2 = '1' and cpu_rd_l = '0' then
			mcnt2 <= mcnt2 + "1";
		end if;
	end if;
end process;
 

inj <= in0(3 downto 0) when control_reg(5 downto 4) = "01" or mod_club = '0' else
       in1(3 downto 0) when control_reg(5 downto 4) = "10" else
       in0(3 downto 0) and in1(3 downto 0);

cpu_data_in <= cpu_vec_reg               when cpu_iorq_l = '0' and cpu_m1_l = '0' else
               sync_bus_reg              when sync_bus_wreq_l = '0' else
               ram2_data                 when ram2_cs = '1'         else
               rom_data                  when cpu_addr(14) = '0'    else -- ROM at 0000 - 3fff / 8000 - bfff
               in0(7 downto 4) & inj     when iodec_in0_l = '0'     else
               in1                       when iodec_in1_l = '0'     else
               dipsw1                    when iodec_dipsw1_l = '0'  else
               dipsw2                    when iodec_dipsw2_l = '0'  else
               "0000" & mcnt(3 downto 0) when iodec_myst1_l = '0'   else
               "0000000" & mcnt2(10)     when iodec_myst2_l = '0'   else
               x"BF"                     when iodec_nop_l   = '0'   else
               ram_data;

u_rams : work.dpram generic map (12,8)
port map
(
	clk_a_i   => clk,
	en_a_i    => ena_6,
	we_i      => not sync_bus_r_w_l and not vram_l and ena_6,
	addr_a_i  => ab(11 downto 0),
	data_a_i  => cpu_data_out, -- cpu only source of ram data
	clk_b_i   => clk,
	addr_b_i  => ab(11 downto 0),
	data_b_o  => ram_data
);

ram2_we <= '1' when cpu_wr_l = '0' and cpu_mreq_l = '0' and cpu_rfsh_l = '1' else '0';
ram2_cs <= '1' when cpu_addr(15 downto 12) = X"9" and mod_alib = '1' else '0';

u_ram2 : work.dpram generic map (10,8)
port map
(
	clk_a_i   => clk,
	en_a_i    => ena_6,
	we_i      => ram2_we and ram2_cs,
	addr_a_i  => cpu_addr(9 downto 0),
	data_a_i  => cpu_data_out,
	clk_b_i   => clk,
	addr_b_i  => cpu_addr(9 downto 0),
	data_b_o  => ram2_data
);

eeek_decrypt : process
begin
	wait until rising_edge(clk);
	if watchdog_reset_l = '0' then
		if mod_eeek = '1' then
			dcnt <= "01";
		else
			dcnt <= "10";
		end if;
	else
		old_rd_l <= cpu_rd_l;
		if old_rd_l = '1' and cpu_rd_l = '0' and cpu_iorq_l = '0' and cpu_m1_l = '1' then
			if cpu_addr(0) = '1' then
				dcnt <= dcnt - "1";
			else
				dcnt <= dcnt + "1";
			end if;
		end if;
	end if;
end process;

u_program_rom: work.rom_descrambler
port map(
	CLK      => clk,
	MRTNT    => mod_mrtnt,
	MSPACMAN => mod_ms,
	EEEK     => mod_eeek,
	GLOB     => mod_glob,
	PLUS     => mod_plus,
	JMPST		=> mod_jmpst,
	dcnt     => dcnt,
	cpu_m1_l => cpu_m1_l, 
	addr     => cpu_addr,
	data     => rom_data,
	dn_addr  => dn_addr,
	dn_data  => dn_data,
	dn_wr    => dn_wr
);

--
-- video subsystem
--
u_video : work.PACMAN_VIDEO
port map (
	I_HCNT    => hcnt,
	I_VCNT    => vcnt,
	--
	I_AB      => ab,
	I_DB      => sync_bus_db,
	--
	I_HBLANK  => hblank,
	I_VBLANK  => vblank,
	I_FLIP    => c_flip,
	I_WR2_L   => wr2_l,
	--
	dn_addr   => dn_addr,
	dn_data   => dn_data,
	dn_wr     => dn_wr,
	--
	O_RED     => O_VIDEO_R,
	O_GREEN   => O_VIDEO_G,
	O_BLUE    => O_VIDEO_B,
	--
	MRTNT     => mod_mrtnt or mod_woodp,
	PONP      => mod_ponp and not mod_van,
	ENA_6     => ena_6,
	CLK       => clk,
	flip_screen => flip_screen
);

O_HSYNC   <= hSync;
O_VSYNC   <= vSync;
O_VBLANK  <= vblank;

--
--
-- audio subsystem
--
u_audio : work.PACMAN_AUDIO
port map (
	I_HCNT        => hcnt,
	--
	I_AB          => ab,
	I_DB          => sync_bus_db,
	--
	I_WR1_L       => wr1_l,
	I_WR0_L       => wr0_l,
	I_SOUND_ON    => c_sound,
	--
	dn_addr       => dn_addr,
	dn_data       => dn_data,
	dn_wr         => dn_wr,
	--
	O_AUDIO       => wav4u,
	ENA_6         => ena_6 and (not pause),
	CLK           => clk
);

------------------------------------------

process(clk, reset) begin
	if reset = '1' then
		sn1_ce <= '1';
		sn2_ce <= '1';
	elsif rising_edge(clk) then

		if sn1_ready = '1' then
			sn1_ce <= '1';
		end if;

		if sn2_ready = '1' then
			sn2_ce <= '1';
		end if;

		old_we <= cpu_wr_l;
		if old_we = '1' and cpu_wr_l = '0' and cpu_iorq_l = '0' then
			if cpu_addr(7 downto 0) = X"01" then
				sn1_ce <= '0';
				sn_d <= cpu_data_out;
			end if;
			if cpu_addr(7 downto 0) = X"02" then
				sn2_ce <= '0';
				sn_d <= cpu_data_out;
			end if;
		end if;
	end if;
end process;

sn1 : entity work.sn76489_top
generic map (
	clock_div_16_g => 1
)
port map (
	clock_i    => clk,
	clock_en_i => ena_4,
	res_n_i    => not RESET,
	ce_n_i     => sn1_ce,
	we_n_i     => sn1_ce,
	ready_o    => sn1_ready,
	d_i        => sn_d,
	aout_o     => wav1u
);

sn2 : work.sn76489_top
generic map (
	clock_div_16_g => 1
)
port map (
	clock_i    => clk,
	clock_en_i => ena_4,
	res_n_i    => not RESET,
	ce_n_i     => sn2_ce,
	we_n_i     => sn2_ce,
	ready_o    => sn2_ready,
	d_i        => sn_d,
	aout_o     => wav2u
);

------------------------------------------

ay_we <= '1' when cpu_wr_l = '0' and cpu_iorq_l = '0' and cpu_addr(7 downto 1) = "0000011" else '0';

sn : work.YM2149
port map
(
	CLK       => clk,
	ENA       => ENA_1M79,
	RESET_L	  => not reset,
	I_BDIR    => ay_we,
	I_BC1     => cpu_addr(0),
	I_DA      => cpu_data_out,
	O_DA      => open,
	O_AUDIO_L => ay_out,
	O_AUDIO_R => open,

	I_SEL_L   => '1',
	I_IOA     => (others => '0'),
	O_IOA     => open,

	I_IOB     => (others => '0'),
	O_IOB     => open
);

------------------------------------------

O_AUDIO <= ay_out when mod_dshop = '1'
        else (wav1u&"00") + (wav2u&"00") when mod_van = '1'
        else (wav4u & "00");

end RTL;
