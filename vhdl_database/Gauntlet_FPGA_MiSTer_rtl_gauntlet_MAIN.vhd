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

entity MAIN is
	port(
		I_MCKR				: in	std_logic;	-- 7MHz
		I_XCKR				: in	std_logic;
		I_RESET				: in	std_logic;	-- active high
		I_VBLANKn			: in	std_logic;
		I_VBKINTn			: in	std_logic;
		I_VCPU				: in	std_logic;
		I_WR68K				: in	std_logic;
		I_RD68K				: in	std_logic;
		I_SBD					: in	std_logic_vector( 7 downto 0);
		I_DATA				: in	std_logic_vector(15 downto 0);
		I_SLAP_TYPE			: in  integer range 0 to 118; -- slapstic type can be changed dynamically

		-- active low player inputs
		I_SELFTESTn			: in	std_logic;
		I_P1					: in	std_logic_vector( 7 downto 0);	-- U, D, L, R, -, -, F, S
		I_P2					: in	std_logic_vector( 7 downto 0);	-- U, D, L, R, -, -, F, S
		I_P3					: in	std_logic_vector( 7 downto 0);	-- U, D, L, R, -, -, F, S
		I_P4					: in	std_logic_vector( 7 downto 0);	-- U, D, L, R, -, -, F, S

		O_HSCRLDn			: out	std_logic;
		O_SNDNMIn			: out	std_logic;
		O_SNDINTn			: out	std_logic;
		O_SNDRESn			: out	std_logic;
		O_CRAMn				: out	std_logic;
		O_VRAMn				: out	std_logic;
		O_VBUSn				: out	std_logic;
		O_VRDTACK			: out	std_logic;
		O_VBKACKn			: out	std_logic;
		O_R_Wn				: out	std_logic;
		O_LDSn				: out	std_logic;
		O_UDSn				: out	std_logic;

		O_LEDS				: out	std_logic_vector( 4 downto 1) := (others=>'0');
		O_SBD					: out	std_logic_vector( 7 downto 0) := (others=>'0');
		O_ADDR				: out	std_logic_vector(14 downto 1) := (others=>'0');
		O_DATA				: out	std_logic_vector(15 downto 0) := (others=>'0');

		-- external program ROMs
		O_MP_EN				: out	std_logic;
		O_MP_ADDR			: out	std_logic_vector(18 downto 0) := (others=>'0');
		I_MP_DATA			: in	std_logic_vector(15 downto 0) := (others=>'0')
	);
end MAIN;

architecture RTL of MAIN is
	signal
		sl_13L_Y0,
--		sl_13L_Y1,
		sl_13L_Y2,
		sl_13L_Y3,
		sl_8T_Y0,
		sl_8T_Y1,
--		sl_8T_Y2,
		sl_8T_Y3,
		sl_13M_Y0,
		sl_13M_Y1,
		sl_13M_Y2,
		sl_13M_Y3,
		sl_14K_Y0,
--		sl_14K_Y1,
		sl_14K_Y2,
--		sl_14K_Y3,
		sl_14K_Y4,
		sl_14K_Y5,
--		sl_14K_Y6,
		sl_14K_Y7,
		sl_14D_Y0,
		sl_14D_Y1,
		sl_14D_Y2,
		sl_14D_Y3,
		sl_14D_Y4,
--		sl_14D_Y5,
--		sl_14D_Y6,
		sl_14D_Y7,
--		sl_10D_Y0,
--		sl_10D_Y1,
--		sl_10D_Y2,
		sl_10D_Y3,
--		sl_10D_Y4,
--		sl_10D_Y5,
--		sl_10D_Y6,
--		sl_10D_Y7,
		sl_13N9,

		sl_BAS,
		sl_VCPU,
		sl_SNDRDn,
		sl_SNDWRn,
		sl_SNDWRn_last,
		sl_VBLANKn_last,
		sl_VCPU_last,
		sl_WR68K_last,
		sl_WLn_last,
		sl_SNDINTn,
		sl_SNDBUF,
		sl_SNDRESn,
		sl_13Na_clr,
		sl_UNLOCKn,
		sl_LATCHn,
		sl_WDOGn,
		sl_INPUTn,

		sl_VPA,
		sl_RCO,

		sl_PL4n,
		sl_PL3n,
		sl_PL2n,
		sl_PL1n,

		sl_EEP_OEn,
		sl_EEP_CEn,
		sl_SLAPSTK,
		sl_BS0,
		sl_BS1,
		sl_ASn,
		sl_ROM,
		sl_SYSRESn,
--		sl_CPU_HALT,
		sl_CPU_RESET,
		sl_ROM_H_Ln,
		sl_RAM0,
		sl_RAM1,

		sl_WHn,
		sl_WLn,
		sl_WRH,
		sl_WRL,
		sl_R_Wn,
--		sl_BR_Wn,
		sl_BW_Rn,
		sl_DTACKn,
		sl_drive,
		sl_LDSn,
		sl_UDSn,
		sl_CRAMn,
		sl_VBUSn,
		sl_VRAMn,
		sl_VRAMn_last,
		sl_MBUSn,
		sl_VBKACKn,
		sl_HSCRLDn
								: std_logic := '1';
	signal
		sl_68KBUF,
		sl_VRDTACK
								: std_logic := '0';
	signal
		slv_BS
								: std_logic_vector( 1 downto 0) := (others=>'1');
	signal
		slv_FC,
--		slv_ROMEN,
		slv_IPL
								: std_logic_vector( 2 downto 0) := (others=>'1');
	signal
		ctr_11N,
		ctr_11R
								: std_logic_vector( 3 downto 0) := (others=>'0');
	signal
		slv_SBDI,
		slv_14F,
		slv_EEP_14A,
		slv_11A_data,
		slv_11B_data,
		slv_12A_data,
		slv_12B_data
								: std_logic_vector( 7 downto 0) := (others=>'1');
	signal
		slv_cpu_di,
		slv_cpu_do,
		slv_VRAM_PF,
		slv_VRAM_MO,
		slv_VRAM_AL,
		slv_CRAM,
		VID_D
								: std_logic_vector(15 downto 0) := (others=>'0');
	signal
		VID_A					: std_logic_vector(18 downto 0) := (others=>'0');

	signal
		slv_cpu_ad
								: std_logic_vector(31 downto 0) := (others=>'0');
begin
	O_ADDR		<= slv_cpu_ad(14 downto 1);
	O_DATA		<= slv_cpu_do;
	O_HSCRLDn	<= sl_HSCRLDn;
	O_SNDNMIn	<= not sl_68KBUF;
	O_SNDINTn	<= not sl_SNDBUF;
	O_CRAMn		<= sl_CRAMn;
	O_VRAMn		<= sl_VRAMn;
	O_VBUSn		<= sl_VBUSn;
	O_VRDTACK	<= sl_VRDTACK;
	O_VBKACKn	<= sl_VBKACKn;
	O_R_Wn		<= sl_R_Wn;
	O_LDSn		<= sl_LDSn;
	O_UDSn		<= sl_UDSn;
	sl_VCPU		<= I_VCPU;

	----------------------------
	-- sheet 2
	----------------------------

	-- reset circuit
	-- counter counts VBLANK intervals from 8 up to 15
	-- the system resets if it reaches 0 without being preset by watchdog back to 8
	p_11R : process(I_RESET, I_MCKR)
	begin
		if I_RESET = '1' then
			ctr_11R <= (others=>'0');
		elsif rising_edge(I_MCKR) then
			sl_VBLANKn_last<=I_VBLANKn;
			if sl_WDOGn = '0' then
				ctr_11R <= "1000";
			elsif sl_VBLANKn_last='1' and I_VBLANKn='0' then
				ctr_11R <= ctr_11R + 1;
			end if;
		end if;
	end process;

	sl_SYSRESn		<= ctr_11R(3);
--	sl_CPU_HALT		<= ctr_11R(3);		-- softcore CPU doesn't have HALT
	sl_CPU_RESET	<= sl_SYSRESn;

	-- gates 12N, 14L
	sl_WHn			<= sl_UDSn or sl_R_Wn;
	sl_WLn			<= sl_LDSn or sl_R_Wn;
--	sl_BR_Wn			<= sl_R_Wn;
	sl_BW_Rn			<= not sl_R_Wn;
	sl_BAS			<= not sl_ASn;

	-- VRDTACK signal generation
	p_12Ja : process
	begin
		wait until rising_edge(I_XCKR);
		sl_VCPU_last <= sl_VCPU;
		sl_VRAMn_last <= sl_VRAMn;
		if sl_BAS = '0' then
			sl_VRDTACK <= '0';
		elsif sl_VCPU_last = '0' and sl_VCPU = '1' then
			sl_VRDTACK <= not sl_VRAMn_last;
		end if;
	end process;

	--	11J gate
	sl_VPA <= not (sl_BAS and slv_FC(2) and slv_FC(1) and slv_FC(0) );

	-- 11S gate
	sl_DTACKn <= not (sl_VRDTACK or sl_RCO);

	-- interrupt priority
	slv_IPL(2) <= I_VBKINTn and sl_SNDINTn; -- the open collectors make an AND gate
	slv_IPL(1) <= sl_SNDINTn;
	slv_IPL(0) <= '1';

	sl_RCO <= ctr_11N(3) and ctr_11N(2) and ctr_11N(1) and ctr_11N(0) and sl_VPA;

	-- busk ACK delay
	p_11N : process
	begin
		wait until rising_edge(I_MCKR);
		-- clear
		if sl_BAS = '0' or sl_VRAMn = '0' then
			ctr_11N <= (others=>'0');
		-- load
		elsif ctr_11N(3) = '0' then
			ctr_11N <= '1' & '1' & sl_EEP_CEn & '1';
		-- count
		elsif sl_VPA = '1' and sl_DTACKn = '1' then
			ctr_11N <= ctr_11N + 1;
		end if;
	end process;

	-- 13L 2:4 decoder
	sl_13L_Y3	<= sl_ASn   or ( not slv_cpu_ad(23) ) or ( not slv_cpu_ad(20) );
	sl_13L_Y2	<= sl_ASn   or ( not slv_cpu_ad(23) ) or (     slv_cpu_ad(20) );
--	sl_13L_Y1	<= sl_ASn   or (     slv_cpu_ad(23) ) or ( not slv_cpu_ad(20) );	-- unused
	sl_13L_Y0	<= sl_ASn   or (     slv_cpu_ad(23) ) or (     slv_cpu_ad(20) );

	sl_VBUSn		<= sl_13L_Y3;
	sl_MBUSn		<= sl_13L_Y2;
	sl_ROM		<= sl_13L_Y0 or sl_BW_Rn;

	-- 8T 2:4 decoder, gate 7X
	sl_8T_Y3		<= sl_VBUSn or ( not slv_cpu_ad(17) ) or ( not slv_cpu_ad(16) );
--	sl_8T_Y2		<= sl_VBUSn or ( not slv_cpu_ad(17) ) or (     slv_cpu_ad(16) );	-- unused
	sl_8T_Y1		<= sl_VBUSn or (     slv_cpu_ad(17) ) or ( not slv_cpu_ad(16) );
	sl_8T_Y0		<= sl_VBUSn or (     slv_cpu_ad(17) ) or (     slv_cpu_ad(16) );

	sl_HSCRLDn	<= sl_8T_Y3 or sl_WLn;
	sl_CRAMn		<= sl_8T_Y1;
	sl_VRAMn		<= sl_8T_Y0;

	-- 13M 2:4 decoder
	sl_13M_Y3	<= sl_MBUSn or ( not slv_cpu_ad(13) ) or ( not slv_cpu_ad(12) );
	sl_13M_Y2	<= sl_MBUSn or ( not slv_cpu_ad(13) ) or (     slv_cpu_ad(12) );
	sl_13M_Y1	<= sl_MBUSn or (     slv_cpu_ad(13) ) or ( not slv_cpu_ad(12) );
	sl_13M_Y0	<= sl_MBUSn or (     slv_cpu_ad(13) ) or (     slv_cpu_ad(12) );

	sl_EEP_CEn	<= sl_13M_Y2;
	sl_RAM1	<= not sl_13M_Y1;
	sl_RAM0	<= not sl_13M_Y0;

	-- 14K 3:8 decoder
	sl_14K_Y7	<= sl_13M_Y3 or sl_WLn or (not slv_cpu_ad(8)) or ( not slv_cpu_ad( 6) ) or ( not slv_cpu_ad( 5) ) or ( not slv_cpu_ad( 4) );
--	sl_14K_Y6	<= sl_13M_Y3 or sl_WLn or (not slv_cpu_ad(8)) or ( not slv_cpu_ad( 6) ) or ( not slv_cpu_ad( 5) ) or (     slv_cpu_ad( 4) );	-- unused
	sl_14K_Y5	<= sl_13M_Y3 or sl_WLn or (not slv_cpu_ad(8)) or ( not slv_cpu_ad( 6) ) or (     slv_cpu_ad( 5) ) or ( not slv_cpu_ad( 4) );
	sl_14K_Y4	<= sl_13M_Y3 or sl_WLn or (not slv_cpu_ad(8)) or ( not slv_cpu_ad( 6) ) or (     slv_cpu_ad( 5) ) or (     slv_cpu_ad( 4) );
--	sl_14K_Y3	<= sl_13M_Y3 or sl_WLn or (not slv_cpu_ad(8)) or (     slv_cpu_ad( 6) ) or ( not slv_cpu_ad( 5) ) or ( not slv_cpu_ad( 4) );	-- unused
	sl_14K_Y2	<= sl_13M_Y3 or sl_WLn or (not slv_cpu_ad(8)) or (     slv_cpu_ad( 6) ) or ( not slv_cpu_ad( 5) ) or (     slv_cpu_ad( 4) );
--	sl_14K_Y1	<= sl_13M_Y3 or sl_WLn or (not slv_cpu_ad(8)) or (     slv_cpu_ad( 6) ) or (     slv_cpu_ad( 5) ) or ( not slv_cpu_ad( 4) );	-- unused
	sl_14K_Y0	<= sl_13M_Y3 or sl_WLn or (not slv_cpu_ad(8)) or (     slv_cpu_ad( 6) ) or (     slv_cpu_ad( 5) ) or (     slv_cpu_ad( 4) );

	sl_SNDWRn	<= sl_14K_Y7;
	sl_UNLOCKn	<= sl_14K_Y5;
	sl_VBKACKn	<= sl_14K_Y4;
	sl_LATCHn	<= sl_14K_Y2;
	sl_WDOGn		<= sl_14K_Y0;

	-- 14D 3:8 decoder
	sl_14D_Y7	<= sl_13M_Y3 or (not sl_R_Wn) or slv_cpu_ad(8) or ( not slv_cpu_ad( 3) ) or ( not slv_cpu_ad( 2) ) or ( not slv_cpu_ad( 1) );
--	sl_14D_Y6	<= sl_13M_Y3 or (not sl_R_Wn) or slv_cpu_ad(8) or ( not slv_cpu_ad( 3) ) or ( not slv_cpu_ad( 2) ) or (     slv_cpu_ad( 1) );	-- unused
--	sl_14D_Y5	<= sl_13M_Y3 or (not sl_R_Wn) or slv_cpu_ad(8) or ( not slv_cpu_ad( 3) ) or (     slv_cpu_ad( 2) ) or ( not slv_cpu_ad( 1) );	-- unused
	sl_14D_Y4	<= sl_13M_Y3 or (not sl_R_Wn) or slv_cpu_ad(8) or ( not slv_cpu_ad( 3) ) or (     slv_cpu_ad( 2) ) or (     slv_cpu_ad( 1) );
	sl_14D_Y3	<= sl_13M_Y3 or (not sl_R_Wn) or slv_cpu_ad(8) or (     slv_cpu_ad( 3) ) or ( not slv_cpu_ad( 2) ) or ( not slv_cpu_ad( 1) );
	sl_14D_Y2	<= sl_13M_Y3 or (not sl_R_Wn) or slv_cpu_ad(8) or (     slv_cpu_ad( 3) ) or ( not slv_cpu_ad( 2) ) or (     slv_cpu_ad( 1) );
	sl_14D_Y1	<= sl_13M_Y3 or (not sl_R_Wn) or slv_cpu_ad(8) or (     slv_cpu_ad( 3) ) or (     slv_cpu_ad( 2) ) or ( not slv_cpu_ad( 1) );
	sl_14D_Y0	<= sl_13M_Y3 or (not sl_R_Wn) or slv_cpu_ad(8) or (     slv_cpu_ad( 3) ) or (     slv_cpu_ad( 2) ) or (     slv_cpu_ad( 1) );

	sl_SNDRDn	<= sl_14D_Y7;
	sl_INPUTn	<= sl_14D_Y4;
	sl_PL4n		<= sl_14D_Y3;
	sl_PL3n		<= sl_14D_Y2;
	sl_PL2n		<= sl_14D_Y1;
	sl_PL1n		<= sl_14D_Y0;

	-- 10D 3:8 decoder
--	sl_10D_Y7	<= slv_cpu_ad(23) or slv_cpu_ad(22) or ( not slv_cpu_ad(18) ) or ( not slv_cpu_ad(17) ) or ( not slv_cpu_ad(16) );
--	sl_10D_Y6	<= slv_cpu_ad(23) or slv_cpu_ad(22) or ( not slv_cpu_ad(18) ) or ( not slv_cpu_ad(17) ) or (     slv_cpu_ad(16) );
--	sl_10D_Y5	<= slv_cpu_ad(23) or slv_cpu_ad(22) or ( not slv_cpu_ad(18) ) or (     slv_cpu_ad(17) ) or ( not slv_cpu_ad(16) );	-- unused
--	sl_10D_Y4	<= slv_cpu_ad(23) or slv_cpu_ad(22) or ( not slv_cpu_ad(18) ) or (     slv_cpu_ad(17) ) or (     slv_cpu_ad(16) );
	sl_10D_Y3	<= slv_cpu_ad(23) or slv_cpu_ad(22) or (     slv_cpu_ad(18) ) or ( not slv_cpu_ad(17) ) or ( not slv_cpu_ad(16) );
--	sl_10D_Y2	<= slv_cpu_ad(23) or slv_cpu_ad(22) or (     slv_cpu_ad(18) ) or ( not slv_cpu_ad(17) ) or (     slv_cpu_ad(16) );	-- unused
--	sl_10D_Y1	<= slv_cpu_ad(23) or slv_cpu_ad(22) or (     slv_cpu_ad(18) ) or (     slv_cpu_ad(17) ) or ( not slv_cpu_ad(16) );	-- unused
--	sl_10D_Y0	<= slv_cpu_ad(23) or slv_cpu_ad(22) or (     slv_cpu_ad(18) ) or (     slv_cpu_ad(17) ) or (     slv_cpu_ad(16) );

--	slv_ROMEN(4)<= sl_10D_Y7;
--	slv_ROMEN(3)<= sl_10D_Y6;
--	slv_ROMEN(2)<= sl_10D_Y5;
--	slv_ROMEN(1)<= sl_10D_Y4;
	sl_SLAPSTK	<= sl_10D_Y3;
--	slv_ROMEN(0)<= sl_10D_Y0;

	-- Wrapper around 68010 soft core
	u_12E : entity work.TG68K
	generic map (
		CPU			=> "01"				-- 00->68000  01->68010  11->68020
	)
	port map (
		CLK			=>	I_MCKR,			-- CLK 7.1591MHz
		RESET		=>	sl_CPU_RESET,	-- RESET active low
		HALT		=> sl_SYSRESn,		-- HALT in sync with reset

		BERR		=> '0',				-- BERR tied high (inverse logic here)
		IPL			=>	slv_IPL,		-- IPL
		ADDR		=> slv_cpu_ad,		-- ADDR
		FC			=> slv_FC,			-- FC2..0
		DATAI		=>	slv_cpu_di,		-- DATA in
		DATAO		=>	slv_cpu_do,		-- DATA out
---- bus control
--		BG			=> open,			-- BG not connected
--		BR			=> '1',				-- BR    tied high
--		BGACK		=> '1',				-- BGACK tied high
-- async interface
		AS			=>	sl_ASn,			-- AS
		UDS			=>	sl_UDSn,		-- UDS
		LDS			=>	sl_LDSn,		-- LDS
		RW			=>	sl_R_Wn,		-- R/W
		DTACK		=>	sl_DTACKn,		-- DTACK active low
-- sync interface
		E			=> open,			-- E not connected
		VPA			=> sl_VPA,			-- VPA active low
		VMA			=> open				-- VMA not connected
	);

	----------------------------
	-- sheet 3
	----------------------------

	-- RAM at address 800000-801FFF only fitted on system board for Vindicators II
--	gen_ram : if slap_type = 118 generate
		sl_WRH <= not sl_WHn;
		sl_WRL <= not sl_WLn;
		p_RAM_11A : entity work.RAM_2K8 port map (I_MCKR => I_XCKR, I_EN => sl_RAM0, I_WR => sl_WRH, I_ADDR => slv_cpu_ad(11 downto 1), I_DATA => slv_cpu_do(15 downto 8), O_DATA => slv_11A_data );
		p_RAM_11B : entity work.RAM_2K8 port map (I_MCKR => I_XCKR, I_EN => sl_RAM0, I_WR => sl_WRL, I_ADDR => slv_cpu_ad(11 downto 1), I_DATA => slv_cpu_do( 7 downto 0), O_DATA => slv_11B_data );
		p_RAM_12A : entity work.RAM_2K8 port map (I_MCKR => I_XCKR, I_EN => sl_RAM1, I_WR => sl_WRH, I_ADDR => slv_cpu_ad(11 downto 1), I_DATA => slv_cpu_do(15 downto 8), O_DATA => slv_12A_data );
		p_RAM_12B : entity work.RAM_2K8 port map (I_MCKR => I_XCKR, I_EN => sl_RAM1, I_WR => sl_WRL, I_ADDR => slv_cpu_ad(11 downto 1), I_DATA => slv_cpu_do( 7 downto 0), O_DATA => slv_12B_data );
--	end generate;

	-- gate 14L, buffer 13C
	sl_ROM_H_Ln	<=	not slv_cpu_ad(15);

	p_12Jb : process
	begin
		wait until rising_edge(I_XCKR);
		if I_RD68K = '0' then
			sl_68KBUF <= '0';
		elsif sl_SNDWRn_last = '0' and sl_SNDWRn = '1' then
				sl_68KBUF <= '1';
		end if;
	end process;

	p_13Na : process(I_MCKR, sl_UNLOCKn)
	begin
		if sl_UNLOCKn = '0' then
			sl_13N9 <= '1';
		elsif rising_edge(I_MCKR) then
			sl_WLn_last <= sl_WLn;
			if sl_SYSRESn = '0' then
				sl_13N9 <= '0';
			elsif sl_WLn_last = '0' and sl_WLn = '1' then
				sl_13N9 <= '0';
			end if;
		end if;
	end process;

	-- Sound Board data latch out
	p_13J : process
	begin
		wait until rising_edge(I_XCKR);
		sl_SNDWRn_last <= sl_SNDWRn;
		if sl_SNDWRn_last = '0' and sl_SNDWRn = '1' then
			O_SBD <= slv_cpu_do(7 downto 0);
		end if;
	end process;

	-- Sound Board data latch in
	p_14J : process
	begin
		wait until rising_edge(I_XCKR);
		sl_WR68K_last <= I_WR68K;
		if sl_WR68K_last = '0' and I_WR68K = '1' then
			slv_SBDI <= I_SBD;
		end if;
	end process;

	p_13Nb : process
	begin
		wait until rising_edge(I_XCKR);
		if sl_13Na_clr = '0' then
			sl_SNDBUF <= '0';
		elsif sl_WR68K_last = '0' and I_WR68K = '1' then
			sl_SNDBUF <= '1';
		end if;
	end process;

	sl_13Na_clr <= sl_SNDRDn and sl_SNDRESn;
	sl_SNDINTn  <= not sl_SNDBUF;
	sl_EEP_OEn  <= sl_13N9 and sl_SYSRESn;
	O_SNDRESn   <= sl_SNDRESn;

	-- 14A simplified addressable latch
	p_14A : process
	begin
		wait until rising_edge(I_MCKR);
		if sl_SYSRESn = '0' then
			sl_SNDRESn <= '0';
			O_LEDS <= (others=>'0');
		else
			if sl_LATCHn = '0' then
				case slv_cpu_ad(3 downto 1) is
					when "000" => O_LEDS(1)  <= slv_cpu_do(0);
					when "001" => O_LEDS(2)  <= slv_cpu_do(0);
					when "010" => O_LEDS(3)  <= slv_cpu_do(0);
					when "011" => O_LEDS(4)  <= slv_cpu_do(0);
					when "111" => sl_SNDRESn <= slv_cpu_do(0);
					when others => null;
				end case;
			end if;
		end if;
	end process;

	-- 12C and 12D bidirectional buffers not required because we have separate in/out busses to CPU

	----------------------------
	-- sheet 4
	----------------------------

	p_10C		: entity work.SLAPSTIC
	port map (
		I_CK	=> I_MCKR,
		I_ASn => sl_ASn,
		I_CSn	=> sl_SLAPSTK,
		I_A	=> slv_cpu_ad(14 downto 1),
		O_BS	=> slv_BS,
		I_SLAP_TYPE => I_SLAP_TYPE
	);

	p_EEP_14A	: entity work.EEP_14A
	port map (
		CLK => I_XCKR,
		WEn => sl_WLn,
		CEn => sl_EEP_CEn,
		OEn => sl_EEP_OEn,
		AD  => slv_cpu_ad( 9 downto 1),
		DI  => slv_cpu_do( 7 downto 0),
		DO  => slv_EEP_14A
	);

	-- address bus and enable for externally located program ROMs, special case for slapstic
	O_MP_EN <=
		not (sl_ASn or sl_ROM);
	O_MP_ADDR <=
		slv_cpu_ad(19 downto 16) & '0' & slv_BS & slv_cpu_ad(12 downto 1) when sl_SLAPSTK='0' else
		slv_cpu_ad(19 downto 16) & sl_ROM_H_Ln  & slv_cpu_ad(14 downto 1);

	----------------------------
	-- sheet 7
	----------------------------
	-- buffer 14F
	slv_14F <= '0' & I_VBLANKn & sl_68KBUF & sl_SNDBUF & I_SELFTESTn & "000";

--	CPU data bus input
--	 ROM=0 SLAPSTK=0            x16 data from 10A, 10B ROMs
--	 ROM=0   /ROM0=0            x16 data from  9A,  9B ROMs
--	 ROM=0   /ROM1=0            x16 data from  7A,  7B ROMs
--	 ROM=0   /ROM2=0            x16 data from  6A,  6B ROMs
--	 ROM=0   /ROM3=0            x16 data from  5A,  5B ROMs
--	 ROM=0   /ROM4=0            x16 data from  3A,  3B ROMs
--	MBUS=0     R/W=1   RAM0=0   x16 data from 11A, 11B RAMs
--	MBUS=0     R/W=1   RAM1=0   x16 data from 12A, 12B RAMs
--	VBUS=0     R/W=1            x16 data from  9E, 10E VBD bus

--	MBUS=0  EEPROM=0    /WL=1   x8  data from 13/14A EEPROM
--	MBUS=0  /SNDRD=0            x8  data from 14J sound latch
--	MBUS=0     R/W=1   /PL1=0   x8  data from 14AB
--	MBUS=0     R/W=1   /PL2=0   x8  data from 14B
--	MBUS=0     R/W=1   /PL3=0   x8  data from 14C
--	MBUS=0     R/W=1   /PL4=0   x8  data from 14E
--	MBUS=0     R/W=1 /INPUT=0   x8  data from 14F

	-- CPU input data bus mux
	slv_cpu_di <=
									  I_MP_DATA when sl_R_Wn='1' and sl_13L_Y0 ='0' else -- ROMs 10A/B, 9A/B, 7A/B
										  I_DATA when sl_R_Wn='1' and sl_VBUSn  ='0' else -- 9E, 10E VID BUS
			  slv_11A_data & slv_11B_data when sl_R_Wn='1' and sl_13M_Y0 ='0' else -- RAMs 11A/B
			  slv_12A_data & slv_12B_data when sl_R_Wn='1' and sl_13M_Y1 ='0' else -- RAMs 12A/B
						x"00" & slv_EEP_14A  when sl_R_Wn='1' and sl_EEP_CEn='0' and sl_EEP_OEn='0' else -- EEPROM
						x"00" & slv_SBDI     when                 sl_SNDRDn ='0' else -- 14J sound latch
						x"00" & I_P1         when                 sl_PL1n   ='0' else -- 14AB
						x"00" & I_P2         when                 sl_PL2n   ='0' else -- 14B
						x"00" & I_P3         when                 sl_PL3n   ='0' else -- 14C
						x"00" & I_P4         when                 sl_PL4n   ='0' else -- 14E
						x"00" & slv_14F      when                 sl_INPUTn ='0' else -- 14F
		(others=>'0');
end RTL;
