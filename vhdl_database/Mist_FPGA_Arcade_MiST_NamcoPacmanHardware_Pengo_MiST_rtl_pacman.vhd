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
-- version 004 spartan3e release
-- version 003 Jan 2006 release, general tidy up
-- version 002 optional vga scan doubler
-- version 001 initial release
--
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

entity PACMAN_MACHINE is
	generic (
		--	only set one of these
		PENGO    : std_logic := '1'; -- set to 1 when using Pengo ROMs, 0 otherwise
		PACMAN   : std_logic := '0'; -- set to 1 for all other Pacman hardware games
		-- only set one of these when PACMAN is set
		MRTNT    : std_logic := '0'; -- set to 1 when using Mr TNT ROMs, 0 otherwise
		LIZWIZ   : std_logic := '0'; -- set to 1 when using Lizard Wizard ROMs, 0 otherwise
		MSPACMAN : std_logic := '0'  -- set to 1 when using Ms Pacman ROMs, 0 otherwise
	);
	port (
		clk                   : in  std_logic;
		ena_6                 : in  std_logic;
		reset                 : in  std_logic;

		-- video
		video_r               : out std_logic_vector(2 downto 0);
		video_g               : out std_logic_vector(2 downto 0);
		video_b               : out std_logic_vector(1 downto 0);
		hsync                 : out std_logic;
		vsync                 : out std_logic;
		v_blank               : out std_logic;
		h_blank               : out std_logic;

		-- audio
		audio                 : out std_logic_vector(7 downto 0);

		-- controls
		in0_reg               : in  std_logic_vector( 7 downto 0);
		in1_reg               : in  std_logic_vector( 7 downto 0);
		dipsw1_reg            : in  std_logic_vector( 7 downto 0);
		dipsw2_reg            : in  std_logic_vector( 7 downto 0)
	);
	end;

architecture RTL of PACMAN_MACHINE is

	-- timing
	signal hcnt             : std_logic_vector( 8 downto 0) := "010000000"; -- 80
	signal vcnt             : std_logic_vector( 8 downto 0) := "011111000"; -- 0F8

	signal do_hsync         : boolean := true;
	signal hblank           : std_logic;
	signal vblank           : std_logic;
--	signal comp_sync_l      : std_logic;

	-- cpu
	signal cpu_ena          : std_logic;
	signal cpu_m1_l         : std_logic;
	signal cpu_mreq_l       : std_logic;
	signal cpu_iorq_l       : std_logic;
	signal cpu_rd_l         : std_logic;
	signal cpu_rfsh_l       : std_logic;
	signal cpu_wait_l       : std_logic;
	signal cpu_int_l        : std_logic;
	signal cpu_nmi_l        : std_logic;
	signal cpu_busrq_l      : std_logic;
	signal cpu_addr         : std_logic_vector(15 downto 0);
	signal cpu_data_out     : std_logic_vector( 7 downto 0);
	signal cpu_data_in      : std_logic_vector( 7 downto 0);

	signal program_rom      : std_logic_vector( 7 downto 0);
	signal program_rom_dinl : std_logic_vector( 7 downto 0);
	signal program_rom_dinh : std_logic_vector( 7 downto 0);
	signal program_rom_bufl : std_logic_vector( 7 downto 0);
	signal program_rom_bufh : std_logic_vector( 7 downto 0);
	signal program_rom_din  : std_logic_vector( 7 downto 0);
	signal rom_to_dec       : std_logic_vector( 7 downto 0);
	signal rom_from_dec     : std_logic_vector( 7 downto 0);
--	signal program_rom_cs_l : std_logic;

	signal control_reg      : std_logic_vector( 7 downto 0);
	--
	signal vram_addr_ab     : std_logic_vector(11 downto 0);
	signal ab               : std_logic_vector(11 downto 0);

	signal sync_bus_reg     : std_logic_vector( 7 downto 0);
	signal sync_bus_db      : std_logic_vector( 7 downto 0);
	signal sync_bus_r_w_l   : std_logic;
	signal sync_bus_wreq_l  : std_logic;
	signal sync_bus_stb     : std_logic;
	signal sync_bus_cs_l    : std_logic;

	signal cpu_vec_reg      : std_logic_vector( 7 downto 0) := (others => '0');
	signal ps_reg           : std_logic_vector( 2 downto 0);

	signal vram_l           : std_logic;
	signal rams_data_out    : std_logic_vector( 7 downto 0);
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

	-- watchdog
	signal watchdog_cnt     : std_logic_vector( 3 downto 0);
	signal watchdog_reset_l : std_logic;

begin

	v_blank <= vblank;
	h_blank <= hblank;

	--
	-- video timing
	--
	p_hvcnt : process
	variable hcarry,vcarry : boolean;
	begin
		wait until rising_edge(clk);
		if (ena_6 = '1') then
			hcarry := (hcnt = "111111111");
			if hcarry then
				hcnt <= "010000000"; -- 080
			else
				hcnt <= hcnt +"1";
			end if;
			-- hcnt 8 on circuit is 256H_L
			vcarry := (vcnt = "111111111");
			if do_hsync then
				if vcarry then
					vcnt <= "011111000"; -- 0F8
				else
					vcnt <= vcnt +"1";
				end if;
			end if;
		end if;
	end process;

	vsync <= not vcnt(8);
	do_hsync <= true when (hcnt = "010101111") else false; -- 0AF

	p_sync : process
	begin
		wait until rising_edge(clk);
		if (ena_6 = '1') then
			-- Timing hardware is coded differently to the real hw
			-- to avoid the use of multiple clocks. Result is identical.

			if (hcnt = "010001111") then -- 08F
				hblank <= '1';
			elsif (hcnt = "011101111") then
				hblank <= '0'; -- 0EF
			end if;

			if do_hsync then
				hsync <= '1';
			elsif (hcnt = "011001111") then -- 0CF
				hsync <= '0';
			end if;

			if do_hsync then
				if (vcnt = "111101111") then -- 1EF
					vblank <= '1';
				elsif (vcnt = "100001111") then -- 10F
					vblank <= '0';
				end if;
			end if;
		end if;
	end process;

	u_cpu : entity work.T80sed
	port map (
		RESET_n => watchdog_reset_l,
		CLK_n   => clk,
		CLKEN   => cpu_ena,
		WAIT_n  => cpu_wait_l,
		INT_n   => cpu_int_l,
		NMI_n   => cpu_nmi_l,
		BUSRQ_n => cpu_busrq_l,
		M1_n    => cpu_m1_l,
		MREQ_n  => cpu_mreq_l,
		IORQ_n  => cpu_iorq_l,
		RD_n    => cpu_rd_l,
		WR_n    => open,
		RFSH_n  => cpu_rfsh_l,
		HALT_n  => open,
		BUSAK_n => open,
		A       => cpu_addr,
		DI      => cpu_data_in,
		DO      => cpu_data_out
	);

	--
	-- cpu
	--
	p_cpu_wait_comb : process(sync_bus_wreq_l)
	begin
		cpu_wait_l  <= '1';
		if (sync_bus_wreq_l = '0') then
			cpu_wait_l  <= '0';
		end if;
	end process;

	p_irq_req_watchdog : process
	variable rising_vblank : boolean;
	begin
		wait until rising_edge(clk);
		if (ena_6 = '1') then
			rising_vblank := do_hsync and (vcnt = "111101111"); -- 1EF
			--rising_vblank := do_hsync; -- debug
			-- interrupt 8c

			if (control_reg(0) = '0') then
				cpu_int_l <= '1';
			elsif rising_vblank then -- 1EF
				cpu_int_l <= '0';
			end if;

			-- watchdog 8c
			-- note sync reset
			if (reset = '1') then
				watchdog_cnt <= "1111";
			elsif (iodec_wdr_l = '0') then
				watchdog_cnt <= "0000";
			elsif rising_vblank then
				watchdog_cnt <= watchdog_cnt + "1";
			end if;

			watchdog_reset_l <= '1';
			if (watchdog_cnt = "1111") then
				watchdog_reset_l <= '0';
			end if;

			-- simulation
			-- pragma translate_off
			-- synopsys translate_off
--			watchdog_reset_l <= not reset; -- watchdog disable
			-- synopsys translate_on
			-- pragma translate_on
		end if;
	end process;

	-- other cpu signals
	cpu_busrq_l <= '1';
	cpu_nmi_l   <= '1';

	p_cpu_ena : process(hcnt, ena_6)
	begin
		cpu_ena <= '0';
		if (ena_6 = '1') then
			cpu_ena <= hcnt(0);
		end if;
	end process;

	--
	-- primary addr decode
	--
	p_mem_decode_comb : process(cpu_rfsh_l, cpu_rd_l, cpu_mreq_l, cpu_addr)
	begin
		-- rom     0x0000 - 0x3FFF
		-- syncbus 0x4000 - 0x7FFF
		-- 7M
		-- 7N
		sync_bus_cs_l <= '1';
		--    program_rom_cs_l  <= '1';

		if (cpu_mreq_l = '0') and (cpu_rfsh_l = '1') then

			--      if (cpu_addr(14) = '0') and (cpu_rd_l = '0') then
			--         program_rom_cs_l <= '0';
			--      end if;

			if (PENGO = '1' and cpu_addr(15) = '1') or (PACMAN = '1' and cpu_addr(14) = '1') then
				sync_bus_cs_l <= '0';
			end if;

		end if;
	end process;

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

	p_sync_bus_comb : process(cpu_rd_l, sync_bus_cs_l, hcnt)
	begin
		-- sync_bus_stb is now an active low clock enable signal
		sync_bus_stb <= '1';
		sync_bus_r_w_l <= '1';

		if (sync_bus_cs_l = '0') and (hcnt(1) = '0') then
			if (cpu_rd_l = '1') then
				sync_bus_r_w_l <= '0';
			end if;
			sync_bus_stb <= '0';
		end if;

		sync_bus_wreq_l <= '1';
		if (sync_bus_cs_l = '0') and (hcnt(1) = '1') and (cpu_rd_l = '0') then
			sync_bus_wreq_l <= '0';
		end if;
	end process;
 
	--
	-- vram addresser custom ic
	--
	u_vram_addr : entity work.PACMAN_VRAM_ADDR
	port map (
		AB      => vram_addr_ab,
		H       => hcnt,
		V       => vcnt(7 downto 0),
		FLIP    => control_reg(3)
	);

	--When 2H is low, the CPU controls the bus.
	ab <= cpu_addr(11 downto 0) when hcnt(1) = '0' else vram_addr_ab;

	--	vram_l <= not ((not (cpu_addr(12) or sync_bus_stb)) or (hcnt(1) and hcnt(0)));
	vram_l <= ( (cpu_addr(12) or sync_bus_stb) and not (hcnt(1) and hcnt(0))      );

	-- PENGO                                                   PACMAN

	-- WRITE
	-- wr0_l    0x9000 - 0x900F voice 1,2,3 waveform           wr0_l    0x5040 - 0x504F sound
	-- wr1_l    0x9010 - 0x901F x50 wr voice 1,2,3 freq/vol    wr1_l    0x5050 - 0x505F sound
	-- wr2_l    0x9020 - 0x902F sprites                        wr2_l    0x5060 - 0x506F sprite
	--                                                                  0x5080 - 0x50BF unused
	-- out_l    0x9040 - 0x904F control space                  out_l    0x5000 - 0x503F control space
	-- wdr_l    0x9070 - 0x907F watchdog reset                 wdr_l    0x50C0 - 0x50FF watchdog reset

	-- READ
	-- dipsw2_l 0x9000 - 0x903F dip switch 2
	-- dipsw1_l 0x9040 - 0x907F dip switch 1                   dipsw1_l 0x5080 - 0x50BF dip switches
	-- in1_l    0x9080 - 0x90BF in port 1                      in1_l    0x5040 - 0x507F in port 1
	-- in0_l    0x90C0 - 0x90FF in port 0                      in0_l    0x5000 - 0x503F in port 0

	-- writes                                           <------------- PENGO ------------->    <------------- PACMAN ------------>
	wr0_l          <= '0' when sync_bus_r_w_l='0' and ( (PACMAN='0' and ab(7 downto 4)=x"0") or (PACMAN='1' and ab(7 downto 4)=x"4") ) and cpu_addr(12)='1' and sync_bus_stb='0' else '1'; -- wr voice 1,2,3 waveform
	wr1_l          <= '0' when sync_bus_r_w_l='0' and ( (PACMAN='0' and ab(7 downto 4)=x"1") or (PACMAN='1' and ab(7 downto 4)=x"5") ) and cpu_addr(12)='1' and sync_bus_stb='0' else '1'; -- wr voice 1,2,3 freq/vol
	wr2_l          <= '0' when sync_bus_r_w_l='0' and ( (PACMAN='0' and ab(7 downto 4)=x"2") or (PACMAN='1' and ab(7 downto 4)=x"6") ) and cpu_addr(12)='1' and sync_bus_stb='0' else '1'; -- wr sprites
	iodec_out_l    <= '0' when sync_bus_r_w_l='0' and ( (PACMAN='0' and ab(7 downto 4)=x"4") or (PACMAN='1' and ab(7 downto 6)="00") ) and cpu_addr(12)='1' and sync_bus_stb='0' else '1'; -- wr control space
	iodec_wdr_l    <= '0' when sync_bus_r_w_l='0' and ( (PACMAN='0' and ab(7 downto 4)=x"7") or (PACMAN='1' and ab(7 downto 6)="11") ) and cpu_addr(12)='1' and sync_bus_stb='0' else '1'; -- wr watchdog reset
                                                                                                                                        
	-- reads                                                                                                                             
	iodec_dipsw2_l <= '0' when sync_bus_r_w_l='1' and ( (PACMAN='0' and ab(7 downto 6)="00") or (PACMAN='1' and ab(7 downto 6)="11") ) and cpu_addr(12)='1' and sync_bus_stb='0' else '1'; -- rd in dip sw2
	iodec_dipsw1_l <= '0' when sync_bus_r_w_l='1' and ( (PACMAN='0' and ab(7 downto 6)="01") or (PACMAN='1' and ab(7 downto 6)="10") ) and cpu_addr(12)='1' and sync_bus_stb='0' else '1'; -- rd in dip sw1
	iodec_in1_l    <= '0' when sync_bus_r_w_l='1' and ( (PACMAN='0' and ab(7 downto 6)="10") or (PACMAN='1' and ab(7 downto 6)="01") ) and cpu_addr(12)='1' and sync_bus_stb='0' else '1'; -- rd in port 1 
	iodec_in0_l    <= '0' when sync_bus_r_w_l='1' and ( (PACMAN='0' and ab(7 downto 6)="11") or (PACMAN='1' and ab(7 downto 6)="00") ) and cpu_addr(12)='1' and sync_bus_stb='0' else '1'; -- rd in port 0 

	ps_reg <= control_reg(7) & control_reg(6) & control_reg(2) when PENGO = '1' else "000";

	p_control_reg : process
	variable ena : std_logic_vector(7 downto 0);
	begin

		wait until rising_edge(clk);
		if (ena_6 = '1') then
			ena := "00000000";
		-- 8 bit addressable latch 7K  (made into register)

		--   PENGO            PACMAN
		-- 0 Interrupt ena    Interrupt ena
		-- 1 Sound ena        Sound ena
		-- 2 PS1              Not used
		-- 3 Flip             Flip
		-- 4 Coin 1 meter     1 player start lamp
		-- 5 Coin 2 meter     2 player start lamp
		-- 6 PS2              Coin lockout
		-- 7 PS3              Coin counter
			if (iodec_out_l = '0') then
				case ab(2 downto 0) is
					when "000" => ena := "00000001";
					when "001" => ena := "00000010";
					when "010" => ena := "00000100";
					when "011" => ena := "00001000";
					when "100" => ena := "00010000";
					when "101" => ena := "00100000";
					when "110" => ena := "01000000";
					when "111" => ena := "10000000";
					when others => null;
				end case;
			end if;

			if (watchdog_reset_l = '0') then
				control_reg <= (others => '0');
			else
				for i in 0 to 7 loop
					if (ena(i) = '1') then
						control_reg(i) <= cpu_data_out(0);
					end if;
				end loop;
			end if;
		end if;
	end process;

	-- simplified data source for video subsystem
	-- only cpu or ram are sources of interest
	sync_bus_db <= cpu_data_out when hcnt(1) = '0' else rams_data_out;

	-- address decoder
	cpu_data_in <=	cpu_vec_reg      when (cpu_iorq_l = '0') and (cpu_m1_l = '0')           else
						sync_bus_reg     when (sync_bus_wreq_l = '0')                           else
						program_rom      when (PENGO  = '1' and cpu_addr(15) = '0')             else  -- ROM at 0000 - 7fff (Pengo descrambler)
						program_rom      when (PACMAN = '1' and cpu_addr(15 downto 14) = "00")  else  -- ROM at 0000 - 3fff and 8000 - bfff
						program_rom      when (PACMAN = '1' and cpu_addr(15 downto 13) = "100") else  -- ROM at 8000 - 9fff (LizWiz)
						in0_reg          when (iodec_in0_l = '0')                               else
						in1_reg          when (iodec_in1_l = '0')                               else
						dipsw1_reg       when (iodec_dipsw1_l = '0')                            else
						dipsw2_reg       when (iodec_dipsw2_l = '0')                            else
						rams_data_out;

	u_adec : entity work.rom_descrambler
	generic map (
		PENGO    => PENGO,
		PACMAN   => PACMAN,
		MRTNT    => MRTNT,
		LIZWIZ   => LIZWIZ,
		MSPACMAN => MSPACMAN
	)
	port map (
		CLK         => clk,
		ENA         => ena_6,
		cpu_m1_l    => cpu_m1_l,
		addr        => cpu_addr,
		data        => program_rom
	);

	u_rams : work.dpram generic map (12,8)
	port map
	(
		clk_a_i  => clk,
		en_a_i   => ena_6,
		we_i     => not sync_bus_r_w_l and not vram_l,
		addr_a_i => ab,
		data_a_i => cpu_data_out, -- cpu only source of ram data
		
		clk_b_i  => clk,
		addr_b_i => ab,
		data_b_o => rams_data_out
	);

	--
	-- video subsystem
	--
	u_video : entity work.PACMAN_VIDEO
	generic map (
		MRTNT => MRTNT
	)
	port map (
		I_HCNT        => hcnt,
		I_VCNT        => vcnt,
		--
		I_AB          => ab,
		I_DB          => sync_bus_db,
		--
		I_HBLANK      => hblank,
		I_VBLANK      => vblank,
		I_FLIP        => control_reg(3),
		I_PS          => ps_reg,
		I_WR2_L       => wr2_l,
		--
		O_RED         => video_r,
		O_GREEN       => video_g,
		O_BLUE        => video_b,
		--
		ENA_6         => ena_6,
		CLK           => clk
	);

	--
	--
	-- audio subsystem
	--
	u_audio : entity work.PACMAN_AUDIO
	port map (
		I_HCNT        => hcnt,
		--
		I_AB          => ab,
		I_DB          => sync_bus_db,
		--
		I_WR1_L       => wr1_l,
		I_WR0_L       => wr0_l,
		I_SOUND_ON    => control_reg(1),
		--
		O_AUDIO       => audio,
		ENA_6         => ena_6,
		CLK           => clk
	);

end RTL;
