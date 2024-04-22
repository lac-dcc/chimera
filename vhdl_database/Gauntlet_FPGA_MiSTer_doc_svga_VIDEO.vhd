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
--

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

--pragma translate_off
--	use ieee.std_logic_textio.all;
--	use std.textio.all;
--pragma translate_on

entity VIDEO is
	port(
		I_MCKR				: in	std_logic;	-- MCKR  7.159 MHz
		I_ADDR				: in	std_logic_vector(14 downto 1);
		I_DATA				: in	std_logic_vector(15 downto 0);
		I_HSCRLDn			: in	std_logic;
		I_CRAMn				: in	std_logic;
		I_VRAMn				: in	std_logic;
		I_VBUSn				: in	std_logic;
		I_VRDTACK			: in	std_logic;
		I_VBKACKn			: in	std_logic;
		I_R_Wn				: in	std_logic;
		I_LDSn				: in	std_logic;
		I_UDSn				: in	std_logic;
		I_SLAP_TYPE			: in  integer range 0 to 118; -- slapstic type can be changed dynamically
		O_VCPU				: out	std_logic;
		O_VBKINTn			: out	std_logic;
		O_VBLANKn			: out	std_logic;
		O_HBLANKn			: out	std_logic;
		O_1H					: out	std_logic;
		O_2H					: out	std_logic;
		O_32V					: out	std_logic;
		O_DATA				: out	std_logic_vector(15 downto 0);
		O_I					: out	std_logic_vector( 3 downto 0);
		O_R					: out	std_logic_vector( 3 downto 0);
		O_G					: out	std_logic_vector( 3 downto 0);
		O_B					: out	std_logic_vector( 3 downto 0);
		O_PHI					: out	std_logic_vector( 3 downto 0);
		O_HSYNC				: out	std_logic;
		O_VSYNC				: out	std_logic;
		O_CSYNC				: out	std_logic;
		-- external GFX ROMs
		O_GP_EN				: out	std_logic;
		O_GP_ADDR			: out	std_logic_vector(17 downto 0);
		I_GP_DATA			: in 	std_logic_vector(31 downto 0);
		O_4R_ADDR			: out	std_logic_vector( 7 downto 0);
		I_4R_DATA			: in 	std_logic_vector( 3 downto 0);
		O_CP_ADDR			: out	std_logic_vector(13 downto 0);
		I_CP_DATA			: in 	std_logic_vector( 7 downto 0)
	);
end VIDEO;

architecture RTL of VIDEO is
	signal
		sl_MATCH,
		sl_VRDTACK,
		sl_VBUS,
		sl_1H,
		sl_2H,
		sl_4H,
--		sl_4HD3,
		sl_6S6,
		sl_6T8,
		sl_6X6,
--		sl_6X8,
		sl_6X8_en,
		sl_7S7,
		sl_9D12,
		sl_9D4,
		sl_9D7,
		sl_9D9,
		sl_ALC3,
		sl_ALC3D,
		sl_ALC4,
		sl_ALC4D,
		sl_CRA5,
		sl_CRA7,
		sl_H03,
		sl_HFLP,
--		sl_HORZDL,
		sl_MREFL,
		sl_NXL,
		sl_NXLDL,
		sl_VCPU,
--		sl_VERTDL,
		sl_GPC_P7,
		sl_GPC_M7,
		sl_VRAMWE
--		sl_PICTDL
								: std_logic := '0';
	signal
		sl_GP_EN,
		sl_GP_ADDR14,
		sl_MCKF,
		sl_HSCRLDn,
		sl_VRAMn,
		sl_LDSn,
		sl_UDSn,
		sl_BR_Wn,
		sl_BW_Rn,
		sl_4HD3_en,
		sl_4HD3n,
		sl_4HDDn,
		sl_4HDLn,
		sl_4Hn,
		sl_6S9,
		sl_BUFCLRn,
		sl_ENDn,
		sl_FLBAn,
		sl_FLBBn,
		sl_G8T,
		sl_GLD,
		sl_GLDn,
		sl_HORZDLn,
		sl_HORZDLn_tap,
		sl_HSYNCn,
		sl_LDABn,
		sl_LINKn_tap,
		sl_LMPDn,
		sl_MATCHDL,
		sl_MC0,
		sl_MC1,
		sl_MFLP,
		sl_MO_PFn,
		sl_NEWMOn,
		sl_NEWMOn_G,
		sl_NEWMOn_V,
		sl_NXLn,
		sl_PFHSTn,
--		sl_PICTDLn,
		sl_PICTDLn_tap,
		sl_VBKACKn,
		sl_VBLANKn,
		sl_HBLANKn,
		sl_VBLANKn_en,
		sl_VERTDLn,
		sl_VERTDLn_tap,
		sl_VIDBLANKn,
		sl_VMATCHn,
		sl_VSYNCn
								: std_logic := '1';
	signal
		slv_VAS,
		slv_VAS_star
								: std_logic_vector( 1 downto 0) := (others=>'0');
	signal
		slv_HSIZ,
		slv_VSIZ
								: std_logic_vector( 2 downto 0) := (others=>'0');
	signal slv_phi			: std_logic_vector( 3 downto 0) := (others=>'0');
	signal
		sl_I,
		sl_R,
		sl_G,
		sl_B,
		slv_4E,
		slv_PSEL,
		slv_ctr_5R,
		slv_sum_6L,
		slv_shift_7N,
		slv_shift_7P,
		slv_4R_data
								: std_logic_vector( 3 downto 0) := (others=>'0');
	signal
		slv_PFSR
								: std_logic_vector( 6 downto 0) := (others=>'0');
	signal
		slv_ctr_4L_4M,
		slv_MPIC,
		slv_MPX,
		slv_PFX,
		slv_MOSR,
		slv_ROM_6P_data,
		slv_PROM_5L_data
								: std_logic_vector( 7 downto 0) := (others=>'0');
	signal
		slv_PFH
								: std_logic_vector( 8 downto 3) := (others=>'0');
	signal
		slv_adder_a,
		slv_XPOS,
		slv_YPOS,
		slv_HPOS,
		slv_sum_5D_5E
								: std_logic_vector( 8 downto 0) := (others=>'0');
	signal
		slv_H,
		slv_V,
		slv_sum,
		slv_CRA,
		slv_LINK,
		slv_GPC_CA
								: std_logic_vector( 9 downto 0) := (others=>'0');
	signal
		slv_AL_offset,
		slv_PFV,
		slv_VRAM,
		slv_VRA
								: std_logic_vector(11 downto 0) := (others=>'0');
	signal
		slv_ROM_6P_addr
								: std_logic_vector(13 downto 0) := (others=>'0');
	signal
		slv_MA
								: std_logic_vector(14 downto 1) := (others=>'0');
	signal
		slv_CRAM,
		slv_4C_4K,
		slv_TILE,
		slv_VBD,
		slv_VRD
								: std_logic_vector(15 downto 0) := (others=>'0');
	signal
		slv_GP_ADDR
								: std_logic_vector(17 downto 0) := (others=>'0');
	signal
		slv_GP_DATA			: std_logic_vector(31 downto 0) := (others=>'0');

--pragma translate_off
--		file logfile: TEXT open WRITE_MODE is "D3000000.txt";
--		shared variable	s			: line;
--		signal	vidframe	: integer := 0;
--		signal	vidline_old	: integer := 0;
--		signal	vidline	: integer := 0;
--		signal	vidpix	: integer := 0;
--		signal	gamex	: integer := 0;
--		signal	gamey	: integer := 0;
--pragma translate_on
begin
--	####################################################################
--	debugging block starts
--	pragma translate_off
--	gamex <= to_integer(unsigned(slv_H))+46;
--	gamey <= to_integer(unsigned(slv_v))+16;
--
--	p_log_pix : process
--	begin
--		wait until rising_edge(I_MCKR);
--		vidline_old <= vidline;
--		if vidline_old /= vidline then
--			vidpix <= 0;
--		else
--			vidpix <= vidpix+1;
--		end if;
--	end process;
--
--	p_log_hsync : process
--	begin
--		wait until rising_edge(sl_HSYNCn);
--		if (sl_VSYNCn = '1') then
--			vidline <= vidline + 1;
--		else
--			vidline <= 0;
--			-- deallocate(s);
--		end if;
--	end process;
--
--	p_log_vsync : process
--	begin
--		wait until rising_edge(sl_vSYNCn);
----		FILE_CLOSE(logfile);
----		deallocate(s);
----		WRITE(s,"D"); WRITE(s,1000+vidframe); WRITE(s,".txt");
----		FILE_OPEN(logfile, s.all, WRITE_MODE);
----		WRITELINE(output, s);
--		vidframe <= vidframe + 1;
--	end process;
--
--	p_log_GPC : process
--		file logfile: TEXT open WRITE_MODE is "GPC.TXT";
--		variable	s : line;
--		variable cntr : integer := 0;
--	begin
--		wait until falling_edge(I_MCKR);
--		if vidframe = 1 and sl_VBLANKn = '1' then
--			WRITE(s, sl_HBLANKn); WRITE(s, string'(", "));
--			WRITE(s, sl_VBLANKn); WRITE(s, string'(", "));
--			HWRITE(s, "00"&slv_CRA , right, 3); WRITE(s, string'(", "));
--			HWRITE(s,      slv_CRAM, right, 4); WRITE(s, string'(", "));
--			HWRITE(s, sl_I&sl_R&sl_G&sl_B, right, 4);
--			WRITELINE(logfile,s );
--		end if;
--	end process;
--
--	p_log_MOHLB : process
--		file logfile: TEXT open WRITE_MODE is "MOHLB.TXT";
--		variable	s : line;
--		variable cntr : integer := 0;
--	begin
--		wait until falling_edge(I_MCKR);
--		WRITE(s, string'("(X,Y)=(")); WRITE(s, gamex, right, 3);
--		WRITE(s, string'(","));       WRITE(s, gamey, right, 3);
--		WRITE(s, string'(")  "));
--		WRITE(s, string'(" HPOS "));  WRITE(s, cntr, right, 3);
--		WRITE(s, string'(" ("));  WRITE(s, cntr+55, right, 3);
--		WRITE(s, string'(")  "));
--
--		if sl_LMPDn = '1' and slv_MOSR(3 downto 0) /= "1111" then
--			HWRITE(s, slv_MOSR, right, 3);
--		end if;
--
--		if sl_LDABn = '0' then
--			cntr := to_integer(unsigned(slv_HPOS));
--			WRITELINE(logfile,s );
--		else
--			cntr := cntr + 1;
--		end if;
--		WRITELINE(logfile,s );
--	end process;
--
--	p_log_4R : process
--		file logfile: TEXT open WRITE_MODE is "4R.TXT";
--		variable	s : line;
--	begin
--		wait until falling_edge(I_MCKR);
--		WRITE(s, string'("(X,Y)=(")); WRITE(s, gamex, right, 3);
--		WRITE(s, string'(","));       WRITE(s, gamey, right, 3);
--		WRITE(s, string'(")  "));
--
--		WRITE(s, string'(" H=")); WRITE(s, to_integer(unsigned(slv_H)), right, 3);
--		WRITE(s, string'(" V=")); WRITE(s, to_integer(unsigned(slv_V)), right, 3);
--		WRITE(s, string'("  "));
--
----		WRITE(s, string'(" XOFF=")); WRITE(s, to_integer(unsigned(slv_adder_a))+1, right, 3);
--		WRITE(s, string'(" HPOS=")); WRITE(s, to_integer(unsigned(slv_HPOS)), right, 3);
--		WRITE(s, string'(" MOSR=")); HWRITE(s, slv_MOSR, right, 3);
--		WRITE(s, string'(" MPX="));  HWRITE(s, slv_MPX,  right, 3);
--
----		WRITE(s, string'(" YOFF=")); WRITE(s, to_integer(unsigned(slv_PFV(8 downto 0))), right, 3);
----		WRITE(s, string'(" VPOS=")); WRITE(s, to_integer(unsigned(slv_sum_5D_5E)), right, 3);
--
--		WRITE(s, string'("  "));
--		WRITE(s, string'(" 4RA=")); HWRITE(s, slv_HPOS(8 downto 4)&slv_HSIZ(2 downto 0), right, 2);
--		WRITE(s, string'(" 4RD=")); HWRITE(s, slv_4R_data);
--
--		WRITE(s, string'("  ["));
--		WRITE(s, string'(" TILE=")); HWRITE(s, slv_TILE, right, 4);
--		WRITE(s, string'(" XPOS=")); WRITE(s, to_integer(unsigned(slv_XPOS)), right, 3);
--		WRITE(s, string'(" YPOS=")); WRITE(s, to_integer(unsigned(slv_YPOS)), right, 3);
--		WRITE(s, string'(" LINK=")); HWRITE(s, '0'&slv_LINK&'0', right, 3);
--		WRITE(s, string'(" ]"));
----		WRITE(s, string'(" HSIZ=")); WRITE(s, to_integer(unsigned(slv_HSIZ)));
----		WRITE(s, string'(" VSIZ=")); WRITE(s, to_integer(unsigned(slv_VSIZ)));
----		WRITE(s, string'(" PSEL=")); HWRITE(s, slv_PSEL, right, 2);
--		if sl_LMPDn = '0' and sl_4HD3_en = '0' then
--			WRITE(s, string'(" LMPDn "));
--		end if;
--
--		if sl_VMATCHn = '0' then
--			WRITE(s, string'(" VMATCH"));
--		end if;
--
--		if sl_NXLDL='1' then
--			WRITE(s, string'(" NXL"));
--		end if;
--		if sl_LINKn_tap = '0' and sl_VMATCHn = '0' then
--			WRITE(s, string'(" LINK"));
--		end if;
--		if sl_LDABn = '0' then
--			WRITE(s, string'(" LDAB"));
--		end if;
--			WRITELINE(logfile,s );
--	end process;
--
--	-- this logs VRD bus data
--	p_log_VRD : process
--		file logfile: TEXT open WRITE_MODE is "VRD.TXT";
--		variable	s : line;
--		variable	header : boolean := true;
--		variable	addr : std_logic_vector(23 downto 0);
--	begin
--		wait until rising_edge(I_MCKR);
--		if header then
--			header := false;
--			WRITE(s, string'(" F,L  VAS NXL ADDR_3 ADDR_2 ADDR_1 ADDR_0 slv_VRA 900xxx 9020xx 9028xx 9030xx 9038xx 905F6E 905F8x 905FCx slv_VRD -- TIME"));
--			WRITELINE(logfile,s );
--		end if;
--
--		if (vidframe  > 0) then
--			WRITE(s, string'("("));
--			WRITE(s, vidframe);
--			WRITE(s, string'(","));
--			WRITE(s, vidline);
--			WRITE(s, string'(")  "));
--			HWRITE(s, "00" & slv_VAS);
--			if sl_NXLDL = '1' then
--				WRITE(s, string'("   N  "));
--				addr := x"90" & '0' & sl_9D4 & sl_9D7 & "111111" &                  slv_MA(6 downto 1) & '0'; HWRITE(s, addr); WRITE(s, string'(" ")); -- c3
--				addr := x"90" & '0' & sl_9D4 & sl_9D7 & "111111" &                   slv_H(8 downto 3) & '0'; HWRITE(s, addr); WRITE(s, string'(" ")); -- c2
--				addr := x"90" & '0' & sl_9D4 & sl_9D7 & "111111" &                slv_LINK(5 downto 0) & '0'; HWRITE(s, addr); WRITE(s, string'(" ")); -- c1
--				addr := x"90" & '0' & sl_9D4 & sl_9D7 & "111111" &                 slv_PFV(8 downto 3) & '0'; HWRITE(s, addr); WRITE(s, string'(" ")); -- c0
--			else
--				WRITE(s, string'("   .  "));
--				addr := x"90" & '0' & sl_9D4 & sl_9D7 &                            slv_MA(12 downto 1) & '0'; HWRITE(s, addr); WRITE(s, string'(" ")); -- c3
--				addr := x"90" & '0' & sl_9D4 & sl_9D7 & '1' & slv_V(7 downto 3) &    slv_H(8 downto 3) & '0'; HWRITE(s, addr); WRITE(s, string'(" ")); -- c2
--				addr := x"90" & '0' & sl_9D4 & sl_9D7 &      sl_MC1 & sl_MC0    & slv_LINK(9 downto 0) & '0'; HWRITE(s, addr); WRITE(s, string'(" ")); -- c1
--				addr := x"90" & '0' & sl_9D4 & sl_9D7 &   slv_PFH(8 downto 3)   &  slv_PFV(8 downto 3) & '0'; HWRITE(s, addr); WRITE(s, string'(" ")); -- c0
--			end if;
--
--			addr := x"90" & '0' & sl_9D4 & sl_9D7 &                                     slv_VRA & '0'; HWRITE(s, addr); WRITE(s, string'("= "));
--
--			if		(addr>=x"902000") and (addr<x"902800") then
--				WRITE(s, string'(" "),right,7*1); HWRITE(s, slv_VRD,right,6); WRITE(s, string'(" "),right,(7*7)-1);
--			elsif	(addr>=x"902800") and (addr<x"903000") then
--				WRITE(s, string'(" "),right,7*2); HWRITE(s, slv_VRD,right,6); WRITE(s, string'(" "),right,(7*6)-1);
--			elsif	(addr>=x"903000") and (addr<x"903800") then
--				WRITE(s, string'(" "),right,7*3); HWRITE(s, slv_VRD,right,6); WRITE(s, string'(" "),right,(7*5)-1);
--			elsif	(addr>=x"903800") and (addr<x"904000") then
--				WRITE(s, string'(" "),right,7*4); HWRITE(s, slv_VRD,right,6); WRITE(s, string'(" "),right,(7*4)-1);
--			elsif	(addr=x"905F6E") then
--				WRITE(s, string'(" "),right,7*5); HWRITE(s, slv_VRD,right,6); WRITE(s, string'(" "),right,(7*3)-1);
--			elsif	(addr>=x"905F80") and (addr<x"905FC0") then
--				WRITE(s, string'(" "),right,7*6); HWRITE(s, slv_VRD,right,6); WRITE(s, string'(" "),right,(7*2)-1);
--			elsif	(addr>=x"905FC0") and (addr<x"906000") then
--				WRITE(s, string'(" "),right,7*7); HWRITE(s, slv_VRD,right,6); WRITE(s, string'(" "),right,(7*1)-1);
--			else
--				WRITE(s, string'(" "),right,(7*8)-1);  HWRITE(s, slv_VRD,right,6);
--			end if;
--			WRITE(s, string'("   -- ")); WRITE(s, now, right, 18);
--
--			WRITELINE(logfile,s );
--		end if;
--	end process;
--
--	-- create log file from SLAGS
--	p_log_SLAGS : process
--		file logfile: TEXT open WRITE_MODE is "SLAGS.log";
--		variable	s : line;
--	begin
--		wait until falling_edge(I_MCKR);
--		if (vidline  > 0) and (vidline < 333) then
--			if (sl_GLDn  ='1') then WRITE(s, string'("   ")); else WRITE(s, string'("LD ")); end if;
--			if (sl_MO_PFn='1') then WRITE(s, string'("MO ")); else WRITE(s, string'("PF ")); end if;
--			HWRITE(s, "00" & slv_GP_ADDR(17 downto 15) & sl_GP_ADDR14 & slv_GP_ADDR(13 downto 0),right,6);
--			WRITE(s, string'(" "));
--			HWRITE(s, slv_GP_DATA,right,9);
--			WRITE(s, string'(" MOSR=")); HWRITE(s, slv_MOSR);
--			WRITE(s, string'(" PFSR=")); HWRITE(s, '0'&slv_PFSR);
--			WRITE(s, string'("   -- ")); WRITE(s, now, right, 18);
--			WRITELINE(logfile,s );
--		end if;
--	end process;
--
--	-- this logs a grayscale BMP file from the SLAGS MOSR output signals
--	SLAGS_MOSR_out : entity work.bmp_out
--	generic map (
--		FILENAME    => "SLAGS_MOSR_"
--	)
--	port map (
--		clk_i => I_MCKR,
--		dat_i(23 downto 20) => slv_MOSR(3 downto 0),
--		dat_i(19 downto 16) => "0000",
--		dat_i(15 downto 12) => slv_MOSR(3 downto 0),
--		dat_i(11 downto  8) => "0000",
--		dat_i( 7 downto  4) => slv_MOSR(3 downto 0),
--		dat_i( 3 downto  0) => "0000",
--		hs_i  => sl_HSYNCn,
--		vs_i  => sl_VSYNCn
--	);
--
--	-- this logs a grayscale BMP file from the SLAGS PFSR output signals
--	SLAGS_PFSR_out : entity work.bmp_out
--	generic map (
--		FILENAME    => "SLAGS_PFSR_"
--	)
--	port map (
--		clk_i => I_MCKR,
--		dat_i(23 downto 20) => slv_PFSR(3 downto 0),
--		dat_i(19 downto 16) => "0000",
--		dat_i(15 downto 12) => slv_PFSR(3 downto 0),
--		dat_i(11 downto  8) => "0000",
--		dat_i( 7 downto  4) => slv_PFSR(3 downto 0),
--		dat_i( 3 downto  0) => "0000",
--		hs_i  => sl_HSYNCn,
--		vs_i  => sl_VSYNCn
--	);
--
--	-- this logs a grayscale BMP file from the GPC PFX input signals
--	GPC_out : entity work.bmp_out
--	generic map (
--		FILENAME    => "GPC_MPX_"
--	)
--	port map (
--		clk_i => I_MCKR,
--		dat_i(23 downto 20) => slv_MPX(3 downto 0),
--		dat_i(19 downto 16) => "0000",
--		dat_i(15 downto 12) => slv_MPX(3 downto 0),
--		dat_i(11 downto  8) => "0000",
--		dat_i( 7 downto  4) => slv_MPX(3 downto 0),
--		dat_i( 3 downto  0) => "0000",
--		hs_i  => sl_HSYNCn,
--		vs_i  => sl_VSYNCn
--	);
--
--	pragma translate_on
--	debugging block ends
--	####################################################################

	O_I       <= sl_I;
	O_R       <= sl_R;
	O_G       <= sl_G;
	O_B       <= sl_B;

	O_PHI     <= slv_phi;
	O_1H      <= slv_H(2); -- maintain the 3.56MHz signal
	O_2H      <= slv_H(3); -- maintain the 1.78MHz signal
	O_32V     <= -- replicate 4ms period of 32V, used for audio timing
					'1' when
					(to_integer(unsigned(slv_V)) >  72 and to_integer(unsigned(slv_V)) < 146) or
					(to_integer(unsigned(slv_V)) > 220 and to_integer(unsigned(slv_V)) < 294) or
					(to_integer(unsigned(slv_V)) > 366 and to_integer(unsigned(slv_V)) < 430) or
					(to_integer(unsigned(slv_V)) > 512 and to_integer(unsigned(slv_V)) < 586)
					else '0';

--	O_DATA    <= slv_VBD;
	O_VCPU    <= (sl_VCPU or (slv_VAS_star(0) and slv_VAS_star(1)));
	O_VBLANKn <= sl_VBLANKn;
	O_HBLANKn <= sl_HBLANKn;

	O_HSYNC   <= sl_HSYNCn;
	O_VSYNC   <= sl_VSYNCn;
	O_CSYNC   <= sl_HSYNCn and sl_VSYNCn;

	-- Vindicators II uses ROM 2J which is the only ROM with a scrambled address -- FIXME
	O_GP_ADDR <= slv_GP_ADDR(17 downto 15) & sl_GP_ADDR14 & slv_GP_ADDR(13 downto 0);
	O_GP_EN   <= sl_GP_EN;

	-- CHAR ROM
	O_CP_ADDR <= slv_ROM_6P_addr;
	slv_ROM_6P_data <= I_CP_DATA;

	sl_MCKF   <= not I_MCKR;

	p_phi : process
	begin
		wait until falling_edge(I_MCKR);
		if sl_NXL = '1' then
			slv_phi <= "1000";
		else
			slv_phi <= slv_phi(0) & slv_phi(3 downto 1);
		end if;
	end process;

	p_reg : process
	begin
		wait until rising_edge(I_MCKR);
		if slv_phi(0)='1' then
			O_DATA <= slv_VBD;
		end if;
	end process;

	-----------------------------
	-- sheet 2 control signals --
	-----------------------------

	slv_MA		<= I_ADDR;
	sl_VBUS		<= I_VBUSn;
	sl_VRDTACK	<= I_VRDTACK;
	sl_VBKACKn	<= I_VBKACKn;
	sl_HSCRLDn	<= '1'; --I_HSCRLDn;
	sl_VRAMn		<= I_VRAMn;
	sl_UDSn		<= I_UDSn;
	sl_LDSn		<= I_LDSn;
	sl_BR_Wn		<= I_R_Wn;
	sl_BW_Rn		<= not I_R_Wn;

	-----------------------
	-- sheet 8 RAM banks --
	-----------------------
	-- at adress 900000-905FFF
	u_VRAMS : entity work.VRAMS
	port map (
		I_CK		=>	sl_MCKF,
		I_VRAMWE	=>	sl_VRAMWE,
		I_SELB	=>	sl_9D4,
		I_SELA	=>	sl_9D7,
		I_UDSn	=>	sl_9D9,
		I_LDSn	=>	sl_9D12,
		I_VRA		=>	slv_VRA,
		I_VRD		=>	slv_VBD,
		O_VRD		=>	slv_VRD
	);

	------------------------------------------
	-- sheet 9 VRAM addr and data bus muxes --
	------------------------------------------

	--	903800-903FFF   R/W   ------xx xxxxxxxx      (Link to next object)
	-- 8F, 8J latches sheet 9
	-- D transfered to Q on the rising edge of clock if enable /G is low
	p_8F_8J : process
	begin
		wait until rising_edge(I_MCKR);
		if sl_LINKn_tap = '0' then
			slv_LINK <= slv_VRD(9 downto 0);
		end if;
	end process;

	slv_VRA <= slv_VRAM when sl_NXLDL = '0' else "111111" & slv_VRAM( 5 downto 0); -- pullups RN7

-- Offset Alphanumerics "VVVVVVHHHHHH" H+1 = 8 pix left, V+1 + 2 pixel up
-- slv_AL_offset forms address lines MA12..MA1 with MA14,MA13=10 addressing alphanumeric range
-- MA12 must be set so final address is:
-- A23 12 = 1001 0000 0101
-- A11-7 = V(7..3)
-- A6-1  = H(8..3)
-- A0 = upper/lower byte in word

-- ALPHA RAM range 905000-905F6E (lines 30 by 42 chars)

-- word at 905000 first line first char,        000 00000 000000 V=0  H=0
-- word at 905052 first line last visible char, 052 00000 101001 V=0  H=41

-- word at 905080 second line first char        080 00001 000000 V=1  H=0
-- word at 9050D2 second line last visible char 0D2 00001 101001 V=1  H=41

-- word at 905E80 last line first char          E80 11101 000000 V=29 H=0
-- word at 905ED2 last line last visible char   ED2 11101 101001 V=29 H=41

-- playfield text 0-29 player stats 30-41
-- H +1 moves right 8 pixels
-- V +1 moves    up 8 pixels

	slv_AL_offset <=
	-- display playfield text when H reaches 280 and offset text by -35*8 = -280
	('1' & slv_V(7 downto 3) & (slv_H(8 downto 3) - "100011") )
	when to_integer(unsigned(slv_V)) < 240 and to_integer(unsigned(slv_H)) > 279 else
	-- old playfield H pixels 232+104=336 new playfield 512+104=616 offset 616-336=280
	-- when outside the playfield coordinates, 81D word pointer to 904000+81D*2 = address 90503A = black
	x"81D"
	when to_integer(unsigned(slv_V)) > 239 and to_integer(unsigned(slv_H)) > 511 else

	-- when inside the playfield coordinates, F80 word pointer to 904000+F80*2 = address 905F00 = transparent
	x"F80";

	-- 8C, 8E, 8D selectors create video RAM address high
	-- 7L, 8L, 8K selectors create video RAM address low
	slv_VRAM <=
		slv_MA(12 downto 1)									when slv_VAS = "11" else	-- c3 CPU
--		'1' & slv_V(7 downto 3) & slv_H(8 downto 3)	when slv_VAS = "10" else	-- c2 AL
		slv_AL_offset											when slv_VAS = "10" else	-- c2 AL
		sl_MC1 & sl_MC0 & slv_LINK(9 downto 0)			when slv_VAS = "01" else	-- c1 MO
		slv_PFH(8 downto 3) & slv_PFV(8 downto 3)		when slv_VAS = "00";			-- c0 PF

	-- 7S latch
	p_7S : process
	begin
		wait until rising_edge(I_MCKR);
		sl_NXLDL		<= sl_NXL;
		slv_VAS(1)	<= slv_VAS_star(1) and sl_NXLn;
		sl_7S7		<= slv_VAS_star(1);
		slv_VAS(0)	<= slv_VAS_star(0);
		sl_VCPU		<= slv_VAS_star(0) and slv_VAS_star(1);
	end process;

	-- 9D selector SEL 0=A 1=B
	sl_9D4		<= slv_MA(14)	when sl_VCPU = '1' else sl_7S7;
	sl_9D7		<= slv_MA(13)	when sl_VCPU = '1' else slv_VAS(0);
	sl_9D9		<= sl_UDSn		when sl_VCPU = '1' else '0';
	sl_9D12		<= sl_LDSn		when sl_VCPU = '1' else '0';

	-- gate 11J
	sl_VRAMWE	<= sl_VCPU and sl_VRDTACK and sl_BW_Rn; -- and sl_MCKF

	-- 9E, 10E transceivers to/from 68K data bus
	-- 9K, 10K transceivers to/from CRAM
	-- DIR 0=B->A 1=A->B
	-- VBD is driven by either
	--		68K data bus
	--		CRAM data bus
	--		VRAM data bus
	--		else it holds its value (latches 9J,10J)
	slv_VBD <=
		I_DATA		when sl_BW_Rn = '1' and sl_VBUS  = '0' else			-- VBUS write access from 68K
		slv_CRAM		when sl_BW_Rn = '0' and I_CRAMn  = '0' else			-- CRAM read access
		slv_VRD		when sl_BW_Rn = '0' and sl_VRAMn = '0' else			-- VRAM read access
		(others=>'0');																	-- else floating

	----------------------------
	-- sheet 10
	----------------------------

	--	902000-9027FF   R/W   -xxxxxxx xxxxxxxx      (Tile index / Sprite)
	-- 3C, 3K latch sheet 10
	p_3C_3K : process
	begin
		wait until rising_edge(I_MCKR);
		if sl_PICTDLn_tap = '0' then
			slv_TILE <= sl_MREFL & slv_VRD(14 downto 0);
		end if;
	end process;

	--	903000-9037FF  R/W   xxxxxxxx x-------      (Y position)
	--						R/W   -------- -x------      (Horizontal flip)
	--						R/W   -------- --xxx---      (Number of X tiles - 1)
	--						R/W   -------- -----xxx      (Number of Y tiles - 1)
	-- 5C, 5K latches sheet 10
	p_5C_5K : process
	begin
		wait until rising_edge(I_MCKR);
		if sl_VERTDLn_tap = '0' then
			slv_YPOS <= slv_VRD(15 downto 7);
			sl_MFLP	<= slv_VRD(6);
			slv_HSIZ	<= slv_VRD( 5 downto 3);
			slv_VSIZ	<= slv_VRD( 2 downto 0);
		end if;
	end process;

	-- adders 5D, 5E
	slv_sum_5D_5E <= (slv_PFV(8 downto 0) + slv_YPOS) + (x"00" & sl_VBLANKn);

	-- 4E latch
	p_4E : process
	begin
		wait until rising_edge(I_MCKR);
		if sl_H03 = '1' and sl_4H = '0' then
			if sl_NEWMOn = '0' then
				slv_4E	<= slv_sum_5D_5E(2 downto 0) & sl_MATCH;
				sl_MREFL	<= sl_MFLP;
			end if;
		end if;
	end process;

	-- 3C, 3J, and 3D, 4K tristate outputs are muxed here
	-- when MO/PF is active selects 3D, 4K outputs
	-- when /4HDL is active selects 3C, 3J outputs
	sl_HFLP <= slv_TILE(15) when sl_4HDLn = '0' else slv_4C_4K(15);

	-- 3F decoder is external because all ROMs are also external, address bits 17:15 below would decode to GCS0..5
	slv_GP_ADDR(17 downto 3) <= slv_TILE(14 downto 8) & slv_MPIC when sl_4HDLn = '0' else '0' & slv_PFV(11 downto 10) & slv_4C_4K(11 downto 0);

	-- 3E mux, SEL 0=A, 1=B
	slv_GP_ADDR(2) <= slv_4E(3) when sl_4HDLn = '0' else slv_PFV(2);
	slv_GP_ADDR(1) <= slv_4E(2) when sl_4HDLn = '0' else slv_PFV(1);
	slv_GP_ADDR(0) <= slv_4E(1) when sl_4HDLn = '0' else slv_PFV(0);
	sl_GP_EN       <= slv_4E(0) when sl_4HDLn = '0' else '1';

	-- bit 14 inverted as per XOR gate 4J
	sl_GP_ADDR14 <= (not slv_GP_ADDR(14));

	-- adder 6L
	slv_sum_6L <= ( ('1' & slv_VSIZ(2 downto 0)) + ( '1' & slv_sum_5D_5E(5 downto 3)) ) + ( "0001");

	-- NAND gate 6T
	sl_VMATCHn <= not (slv_sum_5D_5E(8) and slv_sum_5D_5E(7) and slv_sum_5D_5E(6) and slv_sum_6L(3));

	-- PROM 5L is 82S147 512x8 TTL BIPOLAR PROM (Atari chip 136037.102)
	-- Top 2 address bits tied low so only 128x8 used
	u_5L : entity work.PROM_5L
	port map (
		CLK		=> I_MCKR,
		ADDR(6)	=> sl_MFLP,
		ADDR(5)	=> slv_HSIZ(2),
		ADDR(4)	=> slv_HSIZ(1),
		ADDR(3)	=> slv_HSIZ(0),
		ADDR(2)	=> slv_sum_6L(2),
		ADDR(1)	=> slv_sum_6L(1),
		ADDR(0)	=> slv_sum_6L(0),
		DATA		=> slv_PROM_5L_data
	);

	-- 4L, 4M counters
	p_4L_4M : process
	begin
		wait until rising_edge(I_MCKR);
		if sl_H03 = '1' and sl_4H = '0' then
			if sl_NEWMOn = '0' then
				slv_ctr_4L_4M	<= slv_PROM_5L_data;
			elsif sl_MREFL  = '0' then
				slv_ctr_4L_4M	<= slv_ctr_4L_4M + 1;
			else
				slv_ctr_4L_4M	<= slv_ctr_4L_4M - 1;
			end if;
		end if;
	end process;

	-- 3L, 3M adders
	slv_MPIC <= slv_TILE(7 downto 0) + slv_ctr_4L_4M;

	-- 5J, 5F, 4F counters
	p_5J_5F_4F : process
	begin
		wait until rising_edge(I_MCKR);
		if sl_H03 = '1' and sl_4H = '0' and sl_PFHSTn = '0' then
			if sl_VSYNCn = '0' then
				slv_PFV	<= slv_VRD( 1 downto 0) & "0000000000"; -- '0' & slv_VRD(15 downto 7); -- disable YPOS -- +1 moves up by 1
			elsif sl_VBLANKn = '1' then
				slv_PFV	<= slv_PFV + 1;
			end if;
		end if;
	end process;

	-- 4C, 4K latch
	p_4C_4K : process
	begin
		wait until rising_edge(I_MCKR);
		if sl_H03 = '1' and sl_4Hn = '0' then
			slv_4C_4K <= slv_VRD;
		end if;
	end process;

	sl_4HD3_en <= sl_4hn or sl_4hdln or sl_4hddn or (not sl_4hd3n);

	-- 4D latch
	p_4D : process
	begin
		-- rising edge sl_4HD3 in schema
		wait until rising_edge(I_MCKR);
		if sl_4HD3_en = '0' then
			slv_PFSR(6 downto 4) <= not slv_4C_4K(14 downto 12);
		end if;
	end process;

	-- remember that MO/PF is /4HDL inverted
	sl_MO_PFn <= not sl_4HDLn;

	--------------------------------------------------
	-- sheet 11 - plane 0 and plane 1 ROMs and SLAG --
	-- sheet 12 - plane 2 and plane 3 ROMs and SLAG --
	-- ROMs total 256KB and are stored outside the FPGA
	--------------------------------------------------

	-- 1K Storage/Logic Array Graphics Shifter
	u_1K : entity work.SLAGS
	port map (
		I_MCKR		=> I_MCKR,
		I_A			=> slv_GP_DATA( 7 downto  0),
		I_B			=> slv_GP_DATA(15 downto  8),
		I_HLDAn		=> '1',
		I_HLDBn		=> '1',
		I_FLP			=> sl_HFLP,
		I_MO_PFn		=> sl_MO_PFn,
		I_LDn			=> sl_GLDn,

		O_PFDA		=> slv_PFSR(0),
		O_PFDB		=> slv_PFSR(1),
		O_MODA		=> slv_MOSR(0),
		O_MODB		=> slv_MOSR(1)
	);

	-- 2K Storage/Logic Array Graphics Shifter
	u_2K : entity work.SLAGS
	port map (
		I_MCKR		=> I_MCKR,
		I_A			=> slv_GP_DATA(23 downto 16),
		I_B			=> slv_GP_DATA(31 downto 24),
		I_HLDAn		=> '1',
		I_HLDBn		=> '1',
		I_FLP			=> sl_HFLP,
		I_MO_PFn		=> sl_MO_PFn,
		I_LDn			=> sl_GLDn,

		O_PFDA		=> slv_PFSR(2),
		O_PFDB		=> slv_PFSR(3),
		O_MODA		=> slv_MOSR(2),
		O_MODB		=> slv_MOSR(3)
	);

	-- Pullups RN3, RN4, RN5, RN6
	slv_GP_DATA <= I_GP_DATA when sl_GP_EN = '1' else (others=>'1');

	--------------------------------
	-- sheet 13 Play Field Scroll --
	--------------------------------

	-- 12K Play Field Horizontal Scroll
	u_12K : entity work.PFHS
	port map (
		I_CK					=> I_MCKR,
		I_ST					=> sl_PFHSTn,
		I_4H					=> sl_4H,
		I_HS					=> sl_HSCRLDn,
		I_SPC					=> '1',
		I_D					=> slv_VBD(8 downto 0),
		I_PS(7)				=> slv_PFSR(6),
		I_PS(6 downto 0)	=> slv_PFSR(6 downto 0),

		O_PFM					=> open,
		O_PFH					=> slv_PFH(8 downto 3),
		O_XP					=> slv_PFX
	);

	-- Motion Object Horizontal Line Buffer
	u_MOHLB : entity work.MOHLB
	port map (
		I_MCKR				=> I_MCKR,
		I_LMPDn				=> sl_LMPDn,
		I_LDABn				=> sl_LDABn,
		I_BUFCLRn			=> sl_BUFCLRn,

		I_HPOS				=> slv_HPOS,
		I_MOSR				=> slv_MOSR,

		O_MPX					=> slv_MPX
	);

	----------------------------
	-- sheet 14
	----------------------------

	--	902800-903000  R/W   xxxxxxxx x-------      (X position)
	--						R/W   -------- ----xxxx      (Palette select)
	-- 4N, 3N latches sheet 14
	p_4N_3N : process
	begin
		wait until rising_edge(I_MCKR);
		if sl_HORZDLn_tap = '0' then
			slv_XPOS		<= slv_VRD(15 downto 7);
			slv_PSEL		<= slv_VRD(3 downto 0);
		end if;
	end process;

	-- 9S, 6M, 7M latches (Playfield X scroll at address 930000)
	p_9S_6M_7M : process
	begin
		-- rising edge sl_HSCRLDn in schema
		wait until rising_edge(I_MCKR);
		if sl_HSCRLDn = '0' then
			slv_adder_a	<= not slv_VBD(8 downto 0); -- /PF256LD .. /PF1LD
		end if;
	end process;

	-- 5N, 5P adders and gates 4T
	slv_HPOS <= slv_XPOS + (slv_adder_a + "111111001"); -- +1 right 1 pixel

	-- 3P latch
	p_3P : process
	begin
		-- rising edge sl_LDABn in schema
		wait until rising_edge(I_MCKR);
		if sl_LDABn = '0' then
			slv_MOSR(7 downto 4) <= not slv_PSEL;
		end if;
	end process;

	-- PROM 4R is 74S287 (256x4) TTL PROM "136037-103"
	O_4R_ADDR <= slv_HPOS(8 downto 4) & slv_HSIZ(2 downto 0);
	slv_4R_data <= I_4R_DATA;

	-- 5R counter
	p_5R : process
	begin
		-- rising edge sl_4HD3 in schema
		wait until rising_edge(I_MCKR);
		if sl_4HD3_en = '0' then
			if sl_NEWMOn = '0' then
				slv_ctr_5R <= '0' & slv_4R_data(3 downto 1);
			else
				slv_ctr_5R <= slv_ctr_5R - 1;
			end if;
		end if;
	end process;

	sl_ENDn <= slv_ctr_5R(3) or slv_ctr_5R(2) or slv_ctr_5R(1) or slv_ctr_5R(0);

	-- 6S F/F with async set/reset
	p_6S6 : process(sl_NXLn, I_MCKR)
	begin
		if sl_NXLn = '0' then
			sl_6S6 <= '0';
		elsif rising_edge(I_MCKR) then
			if sl_VERTDLn = '0' then
				sl_6S6 <= not sl_VMATCHn;
			end if;
		end if;
	end process;

	p_6S9 : process(sl_VERTDLn, I_MCKR)
	begin
		if sl_VERTDLn = '0' then
			sl_6S9 <= '1';
		elsif rising_edge(I_MCKR) then
			if sl_HORZDLn = '0' then
				sl_6S9 <= slv_4R_data(0);
			end if;
		end if;
	end process;

	-- gate 4U
	sl_MATCH <= sl_6S6 and sl_6S9;

	sl_2H	<= slv_H(1);
	sl_1H	<= slv_H(0);

	-- gate 7T
	sl_H03	<= sl_2H and sl_1H;

	-- Vindicators has tweaked equations in PROM 7U for signal /NEWMON
	-- Select between Vindicators or Gauntlet equations
	sl_NEWMOn <= sl_NEWMOn_V when I_SLAP_TYPE = 118 else sl_NEWMOn_G;

	-- 6U latch with 7U PROM equations
	p_6U : process
	begin
		wait until rising_edge(I_MCKR);
			-- 82S147 512x8 TTL BIPOLAR PROM (Atari chip 136037.101)
			-- These equations replace the 7U PROM

		-- /NEWMON maintains its state unless one of the below conditions are true:
		-- set /NEWMON when /NXL=0 and H(2:0)="111"  (only for Gauntlet)
		-- clr /NEWMON when /END=0 and H(2:0)="010"
		-- set /NEWMON when /END=1 and H(2:0)="010" and MATCH=1 and MATCHDL=1
		sl_NEWMOn_V <=	(sl_NEWMOn_V and (sl_4H or (not sl_2H) or sl_1H)) or
							(sl_ENDn and sl_MATCHDL and sl_MATCH and (not sl_4H) and sl_2H and (not sl_1H)) or
							(sl_ENDn and sl_NEWMOn_V);

		sl_NEWMOn_G <=	(sl_NEWMOn_G and ( (not sl_2H) or ((not sl_4H) and sl_1H) or (sl_4H and (not sl_1H)) or (sl_NXLn and sl_1H))) or
							(sl_ENDn and sl_MATCHDL and sl_MATCH and (not sl_4H) and sl_2H and (not sl_1H)) or
							(sl_ENDn and sl_NEWMOn_G and (not sl_4H));

		sl_LDABn <=		sl_NEWMOn or sl_4H or sl_2H or (not sl_1H);

		sl_G8T <=		(sl_2H xor sl_1H) or
							( (sl_NEWMOn and sl_MATCH) and ( ((not sl_4H) and sl_1H) or (sl_NXLn and sl_1H) ) ) or
							(sl_NXLn and (not sl_MATCHDL) and sl_MATCH and sl_4H and sl_1H);

		sl_MC1 <=		(sl_2H xor sl_1H) or
							(not sl_MATCH) or
							((sl_NEWMOn or sl_4H) and sl_1H) or
							((not sl_NEWMOn) and sl_MATCHDL and (not sl_4H) and (not sl_2H));

		sl_MC0 <=		(sl_2H xor sl_1H) or
							((not sl_MATCH) and sl_1H) or
							((sl_NEWMOn or sl_4H) and sl_MATCH) or
							((not sl_MATCHDL) and sl_MATCH and (not sl_2H));

		sl_BUFCLRn <=	sl_LMPDn or (not sl_4H) or sl_2H or (not sl_1H);
	end process;

	slv_VAS_star(1) <=
						((not sl_2H) and sl_1H) or
						((not sl_4H) and sl_2H and (not sl_1H)) or
						((not sl_NXLn) and sl_4H and sl_1H) or
						((not sl_MATCHDL) and sl_MATCH and sl_4H and sl_1H) or
						(sl_NEWMOn and sl_MATCH and sl_1H);
	slv_VAS_star(0) <=
						(not sl_2H) or
						((not sl_4H) and sl_1H) or
						(sl_NXLn and sl_1H);

	-- 8T selector
	--	here we use the tap signals as master clock gates so that we can capture the
	--	data we want at the same time as falling edge of the corresponding non tap signals
	sl_LINKn_tap	<= sl_G8T or (not sl_MC1) or (not sl_MC0); -- 3 LINK
	sl_VERTDLn_tap	<= sl_G8T or (not sl_MC1) or (    sl_MC0); -- 2 YPOS
	sl_HORZDLn_tap	<= sl_G8T or (    sl_MC1) or (not sl_MC0); -- 1 XPOS
	sl_PICTDLn_tap	<= sl_G8T or (    sl_MC1) or (    sl_MC0); -- 0 TILE

	-- 5S, 5T latches
	p_5S_5T : process
	begin
		wait until rising_edge(I_MCKR);
		-- Q outputs of 5S
		sl_VERTDLn	<= sl_VERTDLn_tap; -- 2
		sl_HORZDLn	<= sl_HORZDLn_tap; -- 1
--		sl_PICTDLn	<= sl_PICTDLn_tap; -- 0
		sl_FLBBn		<= (sl_FLBAn xor sl_BUFCLRn);

		-- Q outputs of 5T
		sl_4H		<= sl_4HD3n;
		sl_4HD3n	<= sl_4HDDn;
		sl_GLD		<= sl_H03;
	end process;

	-- /Q outputs of 5S
--	sl_VERTDL	<= not sl_VERTDLn;
--	sl_HORZDL	<= not sl_HORZDLn;
--	sl_PICTDL	<= not sl_PICTDLn;
	sl_FLBAn	<= not sl_FLBBn;

	-- /Q outputs of 5T
	sl_4Hn		<= not sl_4H;
--	sl_4HD3		<= not sl_4HD3n;
	sl_NXL		<= not sl_NXLn;
	sl_GLDn		<= not sl_GLD;

	-- 14M F/F
	p_14M : process(sl_VBKACKn, I_MCKR)
	begin
		if sl_VBKACKn = '0' then
			O_VBKINTn <= '1';
		elsif rising_edge(I_MCKR) then
			sl_VBLANKn_en <= sl_VBLANKn;
			if sl_VBLANKn = '0' and  sl_VBLANKn_en = '1' then
				O_VBKINTn <= '0';
			end if;
		end if;
	end process;

	u_8P : entity work.SYNGEN
	port map (
		I_CK					=> I_MCKR,

		O_C0					=> open,		-- UNUSED
		O_C1					=> open,		-- UNUSED
		O_C2					=> open,		-- UNUSED
		O_LMPDn				=> sl_LMPDn,
		O_VIDBn				=> sl_VIDBLANKn,
		O_VRESn				=> open,		-- UNUSED

		O_HSYNCn				=> sl_HSYNCn,
		O_VSYNCn				=> sl_VSYNCn,
		O_PFHSTn				=> sl_PFHSTn,
		O_BUFCLRn			=> open,		-- UNUSED this /BUFCLR replaced by signal from PROM 7U

		O_HBLKn				=> sl_HBLANKn,
		O_VBLKn				=> sl_VBLANKn,
		O_VSCK				=> open,		-- UNUSED
		O_CK0n				=> open,		-- same as MCKF
		O_CK0					=> open,		-- same as MCKR
		O_2HDLn				=> open,		-- UNUSED
		O_4HDLn				=> sl_4HDLn,
		O_4HDDn				=> sl_4HDDn,
		O_NXLn				=> sl_NXLn,
		O_V					=> slv_V,
		O_H					=> slv_H
	);

	-- clock generation, 14.31818 MHz xtal drives F/F
	-- F/F divides xtal by 2 and generates:
	--		MCKR (Master Clock Rising - 7.1591MHz)
	--		MCKF (Master Clock Falling - inverted MCKR)
	-- other clocks are copies of master clock
	--		RCLOCK same as MCKR
	--		FCLOCK same as MCKF
	--		LBCKR same as MCKR
	--		LBCKF same as MCKF

	----------------------------
	-- sheet 15
	----------------------------
		-- Original Gauntlet gates 6T, 9R
		sl_6T8 <= not ((not slv_MPX(0)) and slv_MPX(1) and slv_MPX(2) and slv_MPX(3));
		sl_GPC_M7 <= sl_6T8;

		-- Vindicators II conversion daughter board
		sl_GPC_P7 <= (
			(not slv_MPX(0) ) and
			(not (slv_MPX(4) and slv_MPX(5) and slv_MPX(6)) ) and
			(slv_MPX(1) and slv_MPX(2) and slv_MPX(3))
		)
		when I_SLAP_TYPE = 118 else sl_6T8;

	-- Graphic Priority Control
	u_12M : entity work.GPC
	port map (
		I_CK					=> I_MCKR,
		I_PFM					=> '0',
		I_4H					=> sl_4H,
		I_SEL					=> I_CRAMn,

		-- AL serialised data
		I_AL(1)				=> slv_shift_7P(3),	-- APIX1
		I_AL(0)				=> slv_shift_7N(3),	-- APIX0
		I_MA					=> slv_MA(10 downto 9),

		-- I_D controls color for alphanumerics
		I_D(3)				=> slv_VRD(15),	-- to PROM MSB inside GPC
		I_D(2)				=> slv_VRD(12),	-- to ALC2 inside GPC
		I_D(1)				=> slv_VRD(11),	-- to ALC1 inside GPC
		I_D(0)				=> slv_VRD(10),	-- to ALC0 inside GPC

		-- PF data
		I_P(7)				=> sl_GPC_P7,
		I_P(6 downto 0)	=> slv_PFX(6 downto 0),

		-- MO data
		I_M(7)				=> sl_GPC_M7,
		I_M(6 downto 0)	=> slv_MPX(6 downto 0),

		O_CA					=> slv_GPC_CA
	);

	-- at address 910000-9107FF
	u_CRAMS : entity work.CRAMS
	port map (
		I_MCKR	=>	I_MCKR,
		I_UDSn	=>	sl_UDSn,
		I_LDSn	=>	sl_LDSn,
		I_CRAMn	=>	I_CRAMn,
		I_BR_Wn	=>	sl_BR_Wn,
		I_CRA		=>	slv_CRA,
		I_DB		=>	slv_VBD,
		O_DB		=>	slv_CRAM
	);

	-- 9N, 10N latch color palette output
	p_9N_10N : process
	begin
		wait until falling_edge(I_MCKR);
		if I_CRAMn='1' then
			if sl_VIDBLANKn = '0' then
				sl_I <= (others=>'0');
				sl_R <= (others=>'0');
				sl_G <= (others=>'0');
				sl_B <= (others=>'0');
			else
				-- UDS
				sl_I <= slv_CRAM(15 downto 12);	-- INT
				sl_R <= slv_CRAM(11 downto  8);	-- RED
				-- LDS
				sl_G <= slv_CRAM( 7 downto  4);	-- GRN
				sl_B <= slv_CRAM( 3 downto  0);	-- BLU

			end if;
		end if;
	end process;

	slv_CRA(9 downto 8) <= slv_GPC_CA(9 downto 8);

	-- 8M tristate buffer A>Y
	slv_CRA(7 downto 0) <= slv_MA(8 downto 1) when I_CRAMn = '0' else sl_CRA7 & slv_GPC_CA(6) & sl_CRA5 & slv_GPC_CA(4 downto 0);

	-- 8U dual 4:1 mux
	sl_CRA7 <=
		slv_GPC_CA(7)	when slv_GPC_CA(9 downto 8) = "11" else
		slv_GPC_CA(7)	when slv_GPC_CA(9 downto 8) = "10" else
		sl_6X6			when slv_GPC_CA(9 downto 8) = "01" else
		sl_ALC4D			when slv_GPC_CA(9 downto 8) = "00";

	-- 8U dual 4:1 mux
	sl_CRA5 <=
		slv_GPC_CA(5)	when slv_GPC_CA(9 downto 8) = "11" else
		slv_GPC_CA(5)	when slv_GPC_CA(9 downto 8) = "10" else
		slv_GPC_CA(5)	when slv_GPC_CA(9 downto 8) = "01" else
		sl_ALC3D			when slv_GPC_CA(9 downto 8) = "00";

	-- 6X F/F
	p_6X : process
	begin
		wait until falling_edge(I_MCKR);
		sl_6X6 <= not slv_MPX(7);
--		sl_6X8 <= not sl_4H;
	end process;

	sl_6X8_en <= (not sl_4hn) or sl_4hdln or sl_4hddn or sl_4hd3n;

	-- 6W F/F
	p_6W : process
	begin
		wait until falling_edge(I_MCKR);
		if sl_6X8_en = '0' then
			sl_ALC4D <= sl_ALC4;
			sl_ALC3D <= sl_ALC3;
		end if;
	end process;

	-- Alphanumerics are handled by 4P, 7R, 6P, 7P, 7N and fed into GPC

	p_4P_7R : process
	begin
		wait until rising_edge(I_MCKR);
		if sl_H03 = '1' and sl_4H = '0' then
			-- 4P latch
			sl_ALC4	<= slv_VRD(14);
			sl_ALC3	<= slv_VRD(13);
			slv_ROM_6P_addr(13 downto 10)	<= slv_VRD( 9 downto  6);

			-- 7R latch
			slv_ROM_6P_addr( 9 downto 4)	<= slv_VRD( 5 downto 0);
			sl_MATCHDL							<= sl_MATCH;
		end if;
	end process;

	-- unlatched low address bus
	slv_ROM_6P_addr(3 downto 0) <= slv_V(2 downto 0) & sl_4Hn;

	-- 7P, 7N shifters S1 S0 11=load 10=shift left 01=shift right 00=inhibit
	p_7P_7N : process
	begin
		wait until falling_edge(I_MCKR);
		if sl_H03 = '1' then		-- load
			slv_shift_7P <= slv_ROM_6P_data(7 downto 4);
			slv_shift_7N <= slv_ROM_6P_data(3 downto 0);
		elsif sl_H03 = '0' then	-- shift msb
			slv_shift_7P <= slv_shift_7P(2 downto 0) & '0';	--msb is APIX1
			slv_shift_7N <= slv_shift_7N(2 downto 0) & '0';	--msb is APIX0
		-- else inhibit
		end if;
	end process;
end RTL;
