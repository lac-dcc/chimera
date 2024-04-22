--	(c) 2020 d18c7db(a)hotmail
--
--	This program is free software; you can redistribute it and/or modify it under
--	the terms of the GNU General Public License version 3 or, at your option,
--	any later version as published by the Free Software Foundation.
--
--	This program is distributed in the hope that it will be useful,
--	but WITHOUT ANY WARRANTY; without even the implied warranty of
--	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--
-- For full details, see the GNU General Public License at www.gnu.org/licenses

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

--pragma translate_off
--	use ieee.std_logic_textio.all;
--	use std.textio.all;
--pragma translate_on

entity AUDIO is
	port(
		I_PHI					: in	std_logic_vector( 3 downto 0);
		I_MCKR				: in	std_logic;

		I_1H					: in	std_logic;	-- 3.58MHz
		I_2H					: in	std_logic;	-- 1.79MHz
		I_32V					: in	std_logic;
		I_VBLANKn			: in	std_logic;

		I_SNDNMIn			: in	std_logic;
		I_SNDINTn			: in	std_logic;
		I_SNDRESn			: in	std_logic;

		I_SELFTESTn			: in	std_logic;
		I_COIN				: in	std_logic_vector( 3 downto 0); -- 1L, 2, 3, 4R

		I_SBD					: in	std_logic_vector( 7 downto 0);
		O_SBD					: out std_logic_vector( 7 downto 0) := (others=>'1');
		O_WR68Kn				: out std_logic;
		O_RD68Kn				: out std_logic;

		O_CCTR1n				: out	std_logic;
		O_CCTR2n				: out	std_logic;
		O_AUDIO_L			: out	std_logic_vector(15 downto 0) := (others=>'1');
		O_AUDIO_R			: out	std_logic_vector(15 downto 0) := (others=>'1');

		-- ROMs are external
		O_AP_EN	 			: out std_logic;
		O_AP_AD				: out	std_logic_vector(15 downto 0) := (others=>'1');
		I_AP_DI				: in 	std_logic_vector( 7 downto 0)
	);
end AUDIO;

architecture RTL of AUDIO is
	component jt51
	port (
		rst		:	 in std_logic;
		clk		:	 in std_logic;
		cen		:	 in std_logic;
		cen_p1	:	 in std_logic;
		cs_n		:	 in std_logic;
		wr_n		:	 in std_logic;
		a0			:	 in std_logic;
		din		:	 in std_logic_vector(7 downto 0);
		dout		:	 out std_logic_vector(7 downto 0);
		ct1		:	 out std_logic;
		ct2		:	 out std_logic;
		irq_n		:	 out std_logic;
		sample	:	 out std_logic;
		left		:	 out std_logic_vector(15 downto 0);
		right		:	 out std_logic_vector(15 downto 0);
		xleft		:	 out signed(15 downto 0);
		xright	:	 out signed(15 downto 0);
		dacleft	:	 out std_logic_vector(15 downto 0);
		dacright	:	 out std_logic_vector(15 downto 0)
	);
	end component;

	signal
		sl_COINn,
		sl_MIXn,
		sl_MIXn_last,
		sl_MUSICn,
		sl_POKEYn,
		sl_RD68kn,
		sl_SBR_Wn,
		sl_SBW_Rn,
		sl_SIORDn,
		sl_SIOWRn,
		sl_SIRQACKn,
		sl_SNDIRQn,
		sl_SPHRDYn,
		sl_SPHRESn,
		sl_SPHWRRn,
		sl_SPHWRn,
		sl_SQUEAKn,
		sl_SRDn,
		sl_SWRn,
		sl_VOICEn,
		sl_VOICEn_last,
		sl_WR68kn,
		sl_YAMRESn,
		sl_POKEY_cs
								: std_logic := '0';
	signal
		sl_SWR,
		sl_TMS_ckena,
		sl_SYNC,
		sl_CKR_en,
		sl_PHI2,
		sl_CPU_ena,
		sl_13L4,
		sl_13L5,
		sl_14L4,
		sl_14P4,
		sl_14P5,
		sl_14P6,
		sl_14P7,
		sl_1H,
		sl_2H,
		sl_32V_last,
		sl_B02,
		sl_YAMRES,
		sl_ROM_CS,
		sl_RAM_16M_cs,
		sl_RAM_16N_cs,
		sl_ROM_16R_cs,
		sl_ROM_16S_cs
								: std_logic := '1';
	signal
		slv_YM_vol,
		slv_PM_vol,
		slv_SM_vol
								: std_logic_vector( 2 downto 0) := (others => '0');
	signal
		sph_ctr
								: std_logic_vector( 3 downto 0) := (others => '0');
	signal
		out_l,
		out_r,
		slv_l,
		slv_r
								: std_logic_vector(15 downto 0) := (others => '0');
	signal
		tctr,
		slv_12P,
		slv_IO,
		slv_16R_ROM_data,
		slv_16S_ROM_data,
		slv_16N_RAM_data,
		slv_16M_RAM_data,
		slv_SBDI,
		slv_SBDO,
		slv_TMS_data,
		slv_YM_data,
		slv_POKEY_data
								: std_logic_vector( 7 downto 0) := (others => '0');
	signal
		s_TMS_out
								: signed(13 downto 0) := (others => '0');
	signal
		s_POK_out
								: signed( 5 downto 0) := (others => '0');
	signal
		s_audio_TMS,
		s_audio_POK,
		s_audio_YML,
		s_audio_YMR
								: signed(15 downto 0) := (others => '0');
	signal
		s_chan_l,
		s_chan_r
								: signed(15 downto 0) := (others => '0');
	signal
		s_YML_out,
		s_YMR_out
								: signed(15 downto 0) := (others => '0');
	signal
		slv_SBA
								: std_logic_vector(23 downto 0) := (others => '0');
begin
	sl_CKR_en	<= I_PHI(3);

	p_volmux : process
	begin
		wait until rising_edge(I_MCKR);
		if sl_CKR_en = '1' then

			-- apply volume control to outputs normalized to 12 bits, result extended to 16 bits for later addition
			s_audio_TMS <= signed('0' & slv_SM_vol) * s_TMS_out(s_TMS_out'left downto s_TMS_out'left-11);
			s_audio_YML <= signed('0' & slv_YM_vol) * s_YML_out(s_YML_out'left downto s_YML_out'left-11);
			s_audio_YMR <= signed('0' & slv_YM_vol) * s_YMR_out(s_YMR_out'left downto s_YMR_out'left-11);
			s_audio_POK <= signed('0' & slv_PM_vol) * (s_POK_out(s_POK_out'left) & s_POK_out & "00000");

			-- add signed outputs together, already have extra spare bits for overflow
			s_chan_l <= ( (s_audio_TMS + s_audio_YML) + ( s_audio_POK ) );
			s_chan_r <= ( (s_audio_TMS + s_audio_YMR) + ( s_audio_POK ) );

			-- convert to unsigned slv for DAC usage
			out_l <= std_logic_vector(s_chan_l + 16383);
			out_r <= std_logic_vector(s_chan_r + 16383);
	--		out_l <= std_logic_vector((not s_chan_l(s_chan_l'left)) & s_chan_l(s_chan_l'left-1 downto 0));
	--		out_r <= std_logic_vector((not s_chan_r(s_chan_r'left)) & s_chan_r(s_chan_r'left-1 downto 0));

			O_AUDIO_L <= out_l;
			O_AUDIO_R <= out_r;
		end if;
	end process;

--pragma translate_off
--	p_debug_snd : process
--		type myfile is file of integer;
--		file		traw			: myfile open WRITE_MODE is "sndt.raw";
--		file		praw			: myfile open WRITE_MODE is "sndp.raw";
--		file		yraw			: myfile open WRITE_MODE is "sndy.raw";
--		file		craw			: myfile open WRITE_MODE is "sndc.raw";
--		file		oraw			: myfile open WRITE_MODE is "sndo.raw";
--		file		ofile			: TEXT open WRITE_MODE is "audio.log";
--		variable	s				: line;
--	begin
--		wait until rising_edge(I_MCKR);
--		if sl_CKR_en = '1' then
--			tctr <= tctr + 1;
--			if (tctr(6 downto 0) = "0000000") then -- 7:0 27965 samples/sec, 6:0 55930 samples/sec
--				WRITE(traw,to_integer(s_audio_TMS));
--				WRITE(yraw,to_integer(s_audio_YML));
--				WRITE(yraw,to_integer(s_audio_YMR));
--				WRITE(praw,to_integer(s_audio_POK));
--
--				WRITE(craw,to_integer(s_chan_l));
--				WRITE(craw,to_integer(s_chan_r));
--
--				WRITE(oraw,to_integer(unsigned(out_l)));
--				WRITE(oraw,to_integer(unsigned(out_r)));
--			end if;
--
--			write(s, s_TMS_out); write(s, string'(" * "));
--			write(s, slv_SM_vol); write(s, string'(" = "));
--			write(s, s_audio_TMS); write(s, string'(", "));
--			write(s, (s_audio_TMS+16383)/128); write(s, string'(", "));
--			hwrite(s,std_logic_vector(to_unsigned((s_audio_TMS+16383)/128, 8))); writeline(ofile, s);
--		end if;
--	end process;
--
--	p_debug_out : process
--		file		ofile			: TEXT open WRITE_MODE is "T65.LOG";
--		variable	s				: line;
--	begin
--		wait until rising_edge(I_MCKR);
--		if sl_CKR_en = '1' and sl_CPU_ena = '1' and (sl_SYNC='1') then
--			hwrite(s, slv_SBA(15 downto 0));
--			write(s, string'(" -- ")); write(s, time'image(now), right, 18);
--			writeline(ofile, s);
--		end if;
--	end process;
--
--	p_TMS_out : process
--		file		ofile			: TEXT open WRITE_MODE is "TM.LOG";
--		variable	s				: line;
--	begin
--		wait until falling_edge(sl_SPHWRn);
--		if sl_CKR_en = '1' and (sl_SPHRESn= '1') then
--			hwrite(s, slv_TMS_data);
--			write(s, string'(" -- ")); write(s, now, right, 18);
--			writeline(ofile, s);
--		end if;
--	end process;
--
--	p_YM_out : process
--		file		ofile			: TEXT open WRITE_MODE is "YM.LOG";
--		variable	s				: line;
--	begin
--		wait until rising_edge(I_1H);
--		if sl_CKR_en = '1' then
--			if sl_MUSICn = '0' and sl_b02='1' then
--				if (sl_SWRn = '0') then
--					if (slv_SBA(0)='0') then
--						write(s, string'("  A "));
--					else
--						write(s, string'("  D "));
--					end if;
--					hwrite(s, slv_SBDO);
--				else
--					if (slv_SBA(0)='0') then
--						write(s, string'("R A "));
--					else
--						write(s, string'("R D "));
--					end if;
--					hwrite(s, slv_YM_data);
--				end if;
--				write(s, string'(" -- ")); write(s, time'image(now), right, 18);
--				writeline(ofile, s);
--			end if;
--		end if;
--	end process;
--
--	p_POK_out : process
--		file		ofile			: TEXT open WRITE_MODE is "PK.LOG";
--		variable	s				: line;
--	begin
--		wait until rising_edge(I_MCKR);
--		if sl_CKR_en = '1' and sl_CPU_ena= '1' and sl_POKEY_cs = '1' then
--			if (sl_SBR_Wn = '0') then
--				write(s, string'("     "));
--				hwrite(s, slv_SBDO); write(s, string'("=>180")); hwrite(s, slv_SBA(3 downto 0));
--			else
--				write(s, string'("180")); hwrite(s, slv_SBA(3 downto 0));
--				write(s, string'("=")); hwrite(s, slv_POKEY_data); write(s, string'("      "));
--			end if;
--			write(s, string'(" -- ")); write(s, time'image(now), right, 18);
--			writeline(ofile, s);
--		end if;
--	end process;
--
--	p_AUD_out : process
--		file		ofile			: TEXT open WRITE_MODE is "AUD.LOG";
--		variable	s				: line;
--	begin
--		wait until rising_edge(I_MCKR);
--		if sl_CKR_en = '1' then
--			write(s, s_TMS_out); write(s, string'(", "));
--			write(s, s_POK_out); write(s, string'(", "));
--			write(s, s_YMR_out); write(s, string'(", "));
--
--			write(s, slv_SM_vol); write(s, string'(", "));
--			write(s, slv_PM_vol); write(s, string'(", "));
--			write(s, slv_YM_vol); write(s, string'(", "));
--
--			hwrite(s, slv_l); write(s, string'(", "));
--			hwrite(s, slv_r); write(s, string'(", "));
--
--			write(s, string'(" -- ")); write(s, time'image(now), right, 18);
--			writeline(ofile, s);
--		end if;
--	end process;
--	pragma translate_on

	O_RD68Kn <= sl_RD68Kn;

-- Delay CPU enable to create an artificial PHI2 clock enable, PHI1 is not used
	p_cpuena : process
	begin
		wait until falling_edge(I_MCKR);
		-- use 1H and 2H to create a short clock enable for the 7MHz master clock
		sl_CPU_ena <= I_PHI(2) and (    I_1H) and (not I_2H);
		sl_PHI2    <= I_PHI(2) and (not I_1H) and (    I_2H);
	end process;

	O_WR68Kn <= sl_WR68kn;
	-------------
	-- sheet 5 --
	-------------
	u_15_16L : entity work.T65
	port map (
		MODE		=> "00",					-- "00" => 6502, "01" => 65C02, "10" => 65C816
		Enable	=> sl_CPU_ena,			-- clock enable to run at 1.7MHz

		CLK		=> I_MCKR,				-- in, system clock 7MHz
		IRQ_n		=> sl_SNDIRQn,			-- in, active low irq
		NMI_n		=> I_SNDNMIn,			-- in, active low nmi
		RES_n		=> I_SNDRESn,			-- in, active low reset
		RDY		=> '1',					-- in, ready
		SO_n		=> '1',					-- in, set overflow
		DI			=> slv_SBDI,			-- in, data

		A			=> slv_SBA,				-- out, address
		DO			=> slv_SBDO,			-- out, data
		R_W_n		=> sl_SBR_Wn,			-- out, read /write
		SYNC		=> sl_SYNC				-- out, sync
	);

	O_SBD   <= slv_SBDO;
	O_AP_EN <= (sl_CPU_ena or sl_PHI2) and sl_ROM_CS and sl_SBR_Wn; -- when reading from ROM range
	O_AP_AD <= slv_SBA(15 downto 0);

	-- 15P, 16K, 16L are just buffers
	p_cpubus : process
	begin
		wait until rising_edge(I_MCKR);
		if sl_PHI2 = '1' then
			-- CPU input data bus mux
			   if sl_SBR_Wn = '1' and sl_ROM_CS = '1'     then slv_SBDI <= I_AP_DI;							-- @4000-FFFF
			elsif sl_SRDn   = '0' and sl_RAM_16M_CS = '1' then slv_SBDI <= slv_16M_RAM_data;				-- @0000-07FF
			elsif sl_SRDn   = '0' and sl_RAM_16N_CS = '1' then slv_SBDI <= slv_16N_RAM_data;				-- @0800-0FFF
			elsif sl_SBR_Wn = '1' and sl_POKEYn = '0'	    then slv_SBDI <= slv_POKEY_data;				-- @1800
			elsif sl_SBR_Wn = '1' and sl_MUSICn = '0'	    then slv_SBDI <= slv_YM_data;					-- @1810
			elsif sl_SBR_Wn = '1' and sl_RD68Kn = '0'     then slv_SBDI <= I_SBD;							-- @1010
			elsif sl_SBR_Wn = '1' and (sl_COINn = '0' or sl_SIORDn = '0') then slv_SBDI <= slv_12P;	-- @1020, @1030
			else slv_SBDI <= (others=>'Z'); -- FIXME
			end if;
		end if;
	end process;

	p_RAM_16N : entity work.RAM_2K8 port map (I_MCKR => I_MCKR, I_EN => sl_RAM_16N_CS, I_WR => sl_SWR, I_ADDR => slv_SBA(10 downto 0), I_DATA => slv_SBDO, O_DATA => slv_16N_RAM_data );
	p_RAM_16M : entity work.RAM_2K8 port map (I_MCKR => I_MCKR, I_EN => sl_RAM_16M_CS, I_WR => sl_SWR, I_ADDR => slv_SBA(10 downto 0), I_DATA => slv_SBDO, O_DATA => slv_16M_RAM_data );

	sl_ROM_16S_CS	<= not sl_14L4;	-- @8000-FFFF
	sl_ROM_16R_CS	<= not sl_13L5;	-- @4000-7FFF
	sl_RAM_16N_CS	<= not sl_14P5;	-- @0800-0FFF
	sl_RAM_16M_CS	<= not sl_14P4;	-- @0000-07FF
	sl_ROM_CS      <= sl_ROM_16S_CS or sl_ROM_16R_CS;

	-- Address Decoding

	-- 14L
	sl_14L4			<= ( not slv_SBA(15));	-- @8000-FFFF

	-- 13L
	sl_13L5			<= (     slv_SBA(15)) or ( not slv_SBA(14)); -- Y1 @4000-7FFF
	sl_13L4			<= (     slv_SBA(15)) or (     slv_SBA(14)); -- Y0 @0000-3FFF

	-- 14P
	sl_14P7			<= sl_13L4 or ( not slv_SBA(12)) or ( not slv_SBA(11)); -- Y3 @1800-1FFF
	sl_14P6			<= sl_13L4 or ( not slv_SBA(12)) or (     slv_SBA(11)); -- Y2 @1000-17FF
	sl_14P5			<= sl_13L4 or (     slv_SBA(12)) or ( not slv_SBA(11)); -- Y1 @0800-0FFF
	sl_14P4			<= sl_13L4 or (     slv_SBA(12)) or (     slv_SBA(11)); -- Y0 @0000-07FF

	sl_SIRQACKn		<= sl_14P7 or ( not slv_SBA(5))  or ( not slv_SBA(4)); -- Y3 @1830
	sl_VOICEn		<= sl_14P7 or ( not slv_SBA(5))  or (     slv_SBA(4)); -- Y2 @1820
	sl_MUSICn		<= sl_14P7 or (     slv_SBA(5))  or ( not slv_SBA(4)); -- Y1 @1810
	sl_POKEYn		<= sl_14P7 or (     slv_SBA(5))  or (     slv_SBA(4)); -- Y0 @1800

	sl_POKEY_cs		<= not sl_POKEYn;

	-- 12R
	sl_SIORDn		<= (not sl_B02) or sl_14P6 or ( not slv_SBA(5)) or ( not slv_SBA(4) or ( not sl_SBR_Wn )); -- Y7 @1030 RD
	sl_SIOWRn		<= (not sl_B02) or sl_14P6 or ( not slv_SBA(5)) or ( not slv_SBA(4) or (     sl_SBR_Wn )); -- Y6 @1030 WR
	sl_COINn			<= (not sl_B02) or sl_14P6 or ( not slv_SBA(5)) or (     slv_SBA(4) or ( not sl_SBR_Wn )); -- Y5 @1020 RD
	sl_MIXn			<= (not sl_B02) or sl_14P6 or ( not slv_SBA(5)) or (     slv_SBA(4) or (     sl_SBR_Wn )); -- Y4 @1020 WR
	sl_RD68Kn		<= (not sl_B02) or sl_14P6 or (     slv_SBA(5)) or ( not slv_SBA(4) or ( not sl_SBR_Wn )); -- Y3 @1010 RD
--	sl_12R13			<= (not sl_B02) or sl_14P6 or (     slv_SBA(5)) or ( not slv_SBA(4) or (     sl_SBR_Wn )); -- Y2
--	sl_12R14			<= (not sl_B02) or sl_14P6 or (     slv_SBA(5)) or (     slv_SBA(4) or ( not sl_SBR_Wn )); -- Y1
	sl_WR68Kn		<= (not sl_B02) or sl_14P6 or (     slv_SBA(5)) or (     slv_SBA(4) or (     sl_SBR_Wn )); -- Y0 @1000 WR

	-- 14M F/F
	p_14M : process
	begin
		wait until rising_edge(I_MCKR);
		sl_32V_last <= I_32V;
		if sl_SIRQACKn = '0' then
			sl_SNDIRQn <= '1';
		elsif sl_32V_last = '0' and I_32V = '1' then
			sl_SNDIRQn <= not I_VBLANKn;
		end if;
	end process;

	-- 16T/U simplified addressable latch
	p_16T_U : process
	begin
		wait until falling_edge(I_MCKR);
		if I_SNDRESn = '0' then
			sl_YAMRESn		<= '0';
			sl_SPHWRRn		<= '0';
			sl_SPHRESn		<= '0';
			sl_SQUEAKn		<= '0';
			O_CCTR1n			<= '0';
			O_CCTR2n			<= '0';
		else
			if sl_SIOWRn = '0' then
				case slv_SBA(2 downto 0) is
					when "000" => sl_YAMRESn	<=     slv_SBDO(7); -- @1030
					when "001" => sl_SPHWRRn	<=     slv_SBDO(7); -- @1031
					when "010" => sl_SPHRESn	<=     slv_SBDO(7); -- @1032
					when "011" => sl_SQUEAKn	<=     slv_SBDO(7); -- @1033
					when "100" => O_CCTR1n		<= not slv_SBDO(7); -- @1034 (inverted by Q17)
					when "101" => O_CCTR2n		<= not slv_SBDO(7); -- @1035 (inverted by Q18)
					when others => null;
				end case;
			end if;
		end if;
	end process;

	-- gate 14N
	sl_SPHWRn	<= sl_SPHWRRn and sl_SPHRESn;

	-- gates 12S
	sl_SWRn		<= not (sl_B02 and sl_SBW_Rn);
	sl_SRDn		<= not (sl_B02 and sl_SBR_Wn);
	sl_SWR		<= not sl_SWRn;
	sl_SBW_Rn	<= not sl_SBR_Wn;
	sl_B02		<= sl_PHI2;

	-------------
	-- sheet 6 --
	-------------

	-- 14S counter is clocked by 7.159MHz (not 1H, schema is wrong) and provides TMS5220 clock
	-- when SQUEAK is 0 counter is preset with 5, else 7 then counts up to F before being preset again
	--	divide by 11 gives 650.8KHz, divide by 9 gives 795.4KHz
	p_14S : process
	begin
		wait until rising_edge(I_MCKR);
--		if I_1H = '0' then
			if sl_CKR_en = '1' then
				if sph_ctr = "1111" then
					sph_ctr <= "01" & sl_SQUEAKn & '1';
				else
					sph_ctr <= sph_ctr + 1;
				end if;
			end if;
--		end if;
	end process;

	-- generate TMS5220 clock enable
	sl_TMS_ckena <= '1' when I_PHI(0) = '1' and (sph_ctr="1111") else '0';

	-- 13P
	p_13P : process
	begin
		wait until rising_edge(I_MCKR);
		sl_VOICEn_last <= sl_VOICEn;
		if sl_VOICEn_last = '0' and sl_VOICEn = '1' then
			slv_TMS_data <= slv_SBDO;
		end if;
	end process;

	-- 15S latch - 3 bit volume control
	p_15S : process(I_SNDRESn, I_MCKR)
	begin
		if I_SNDRESn = '0' then
			slv_SM_vol <= "000";
			slv_PM_vol <= "000";
			slv_YM_vol <= "000";
		elsif rising_edge(I_MCKR) then
			sl_MIXn_last <= sl_MIXn;
			if sl_MIXn_last = '0' and sl_MIXn = '1' then
				slv_SM_vol <= slv_SBDO(7 downto 5);
				slv_PM_vol <= slv_SBDO(4 downto 3) & slv_SBDO(3); -- PM0 and PM1 are connected together by R132
				slv_YM_vol <= slv_SBDO(2 downto 0);
			end if;
		end if;
	end process;

	sl_YAMRES <= not sl_YAMRESn;
	sl_1H <= I_PHI(2) and I_1H ;
	sl_2H <= I_PHI(2) and I_1H and I_2H;

	-- YM2151 sound
	u_15R : JT51
	port map(
		-- inputs
		rst		=> sl_YAMRES,	-- active high reset
		clk		=> I_MCKR,
		cen		=> sl_1H,
		cen_p1	=> sl_2H,
		a0			=> slv_SBA(0),
		wr_n		=> sl_SWRn,
		cs_n		=> sl_MUSICn,
		din		=> slv_SBDO,

		-- outputs
		dout		=> slv_YM_data,
		irq_n		=> open,

		ct1		=> open,
		ct2		=> open,

		--	 Low resolution outputs (same as real chip)
		sample	=> open,	-- marks new output sample
		left		=> open,	-- std_logic_vector(15 downto 0)
		right		=> open,	-- std_logic_vector(15 downto 0)

		--	 Full resolution outputs
		xleft		=> s_YML_out,	-- std_logic_vector(15 downto 0)
		xright	=> s_YMR_out,	-- std_logic_vector(15 downto 0)
		dacleft	=> open,
		dacright	=> open
	);

--	-- YM3012 DAC - not used becase YM2151 core outputs parallel sound data
--	u_15T : entity work.YM3012
--	generic map (signed_data => false)
--	port map (
--		PHI0     => clk,
--		ICL      => reset,
--		SDATA    => ym_sd,
--		SAM1     => ym_sam1,
--		SAM2     => ym_sam2,
--		CH1      => open,
--		Ch2      => open
--	);

	--	POKEY sound (Atari custom chip 137430-001)
	u_15L : entity work.POKEY
	port map (
		ADDR      		=> slv_SBA(3 downto 0),
		DIN       		=> slv_SBDO,
		DOUT      		=> slv_POKEY_data,
		DOUT_OE_L 		=> open,
		RW_L      		=> sl_SBR_Wn,
		CS        		=> sl_POKEY_cs,
		CS_L      		=> '0',

		AUDIO_OUT 		=> s_POK_out,

		PIN       		=> x"00",
		ENA       		=> sl_CPU_ena,
		CLK       		=> I_MCKR
	);

	-- TMS5220 Voice Synthesis
	u_13R : entity work.TMS5220
	port map (
		I_OSC			=> I_MCKR,
		I_ENA			=> sl_TMS_ckena,
		I_WSn			=> sl_SPHWRn,
		I_RSn			=> sl_SPHRESn,
		I_DATA		=> '1',
		I_TEST		=> '1',
		I_DBUS		=> slv_TMS_data,

		O_DBUS		=> open,
		O_RDYn		=> sl_SPHRDYn,
		O_INTn		=> open,
		O_M0			=> open,
		O_M1			=> open,
		O_ADD8		=> open,
		O_ADD4		=> open,
		O_ADD2		=> open,
		O_ADD1		=> open,
		O_ROMCLK		=> open,
		O_T11			=> open,
		O_IO			=> open,
		O_PRMOUT		=> open,
		O_SPKR		=> s_TMS_out
	);

	-------------
	-- sheet 7 --
	-------------

	-- 12P buffer
	slv_12P	<= (not I_SNDNMIn) & (not I_SNDINTn) & sl_SPHRDYn & I_SELFTESTn & I_COIN;
end RTL;
