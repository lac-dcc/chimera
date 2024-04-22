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
-- Indiana Jones and the Temple of Doom cartridge for Atari System 1
-- From SP-282 schematic (identical to SP-280 just different page order)
--
-- controls
-- UP1 up
-- DN1 down
-- LT1 left
-- RT1 right
-- SW1 start1/whip
-- SW2 start2/whip

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ATARI_CART is
port(
	I_SLAP_TYPE  : in  integer range 0 to 118; -- slapstic type can be changed dynamically
	I_MCKR       : in  std_logic;
	I_XCKR       : in  std_logic;

	I_BASn       : in  std_logic;
	O_INT1n      : out std_logic;
	O_INT3n      : out std_logic;
	O_WAITn      : out std_logic;
	O_MD7        : out std_logic;

	-- sound ROMs
	I_SBA        : in  std_logic_vector(13 downto 0);
	I_SMD        : in  std_logic_vector( 7 downto 0);
	O_SMD        : out std_logic_vector( 7 downto 0);

	-- main ROMs
	I_SLAPn      : in  std_logic;
	I_MA18n      : in  std_logic;
	I_MADDR      : in  std_logic_vector(15 downto 1);

	I_MGRA       : in  std_logic_vector(19 downto 1);
	I_MATCHn     : in  std_logic;
	I_MGHF       : in  std_logic;
	I_MEXTn      : in  std_logic;
	I_BW_Rn      : in  std_logic;

	I_GLDn       : in  std_logic;
	I_MO_PFn     : in  std_logic;
	I_SNDEXTn    : in  std_logic;
	I_SNDRSTn    : in  std_logic;
	I_SNDBW_Rn   : in  std_logic;
	I_B02        : in  std_logic;

	-- video
	O_MOSR       : out std_logic_vector(6 downto 0);
	O_PFSR       : out std_logic_vector(7 downto 0);

	-- sound L and R are identical
	O_SND        : out signed(13 downto 0);

	-- CPU address to ROMs after Slapstic decoding
	O_MADEC      : out std_logic_vector(15 downto 1);

	-- PROMs
	O_PADDR      : out std_logic_vector( 8 downto 0);
	I_PD4A       : in  std_logic_vector( 7 downto 0);
	I_PD7A       : in  std_logic_vector( 7 downto 0);

	-- sound ROMs
	I_SDATA      : in  std_logic_vector( 7 downto 0);

	-- video ROMs
	O_VADDR      : out std_logic_vector(18 downto 0);
	I_VDATA      : in  std_logic_vector(63 downto 0)
);
end ATARI_CART;

architecture logic of ATARI_CART is
	signal
		sl_GD7P7, sl_NOROM7n,
		sl_GD7P6, sl_NOROM6n,
		sl_GD7P5, sl_NOROM5n,
		sl_GD7P4, sl_NOROM4n,
		sl_GD7P3, sl_NOROM3n,
		sl_MCKF,
		sl_BASn,
		sl_SLAPn,
		sl_BMO_PFn,
		sl_MGHF,
		sl_GLDn,
		sl_srq,
		sl_45f_qa,
		sl_45f_qa_t,
		sl_GLDn_last,
		sl_RD240Kn,
		sl_SNDEXTn,
		sl_SNDRSTn,
		sl_SNDBR_Wn,
		sl_B02,
		sl_TMS_EN,
		sl_TMS_RDYn,
		sl_TMS_INTn
								: std_logic:='1';
	signal
		slv_BS
								: std_logic_vector( 1 downto 0):=(others=>'0');
	signal
		slv_45f,
		slv_14S
								: std_logic_vector( 3 downto 0):=(others=>'1');
	signal
		slv_MOSR
								: std_logic_vector( 6 downto 0):=(others=>'1');
	signal
		slv_PBO,
		slv_TMS_DI,
		slv_TMS_DO,
		slv_PFSR,
		slv_VIA_DI,
		slv_SMDO,
		slv_VIA_DO,
		slv_5B_DB,
		slv_5B_DA,
		slv_5C_DB,
		slv_5C_DA,
		slv_5D_DB,
		slv_5D_DA,
		slv_5E_DB,
		slv_5E_DA
								: std_logic_vector( 7 downto 0):=(others=>'1');
	signal
		slv_SBA
								: std_logic_vector(13 downto 0):=(others=>'0');
	signal
		slv_MADDR
								: std_logic_vector(15 downto 1):=(others=>'0');
	signal
		slv_GBA
								: std_logic_vector(19 downto 1):=(others=>'0');
	signal
		slv_MGRA
								: std_logic_vector(19 downto 1):=(others=>'0');
	signal
		slv_VDATA
								: std_logic_vector(63 downto 0):=(others=>'0');
begin
	O_VADDR     <= slv_GBA;
	sl_SLAPn    <= I_SLAPn;
	sl_BASn     <= I_BASn;
	sl_MGHF     <= I_MGHF;
	sl_GLDn     <= I_GLDn;
	sl_BMO_PFn  <= I_MO_PFn;
	sl_SNDEXTn  <= I_SNDEXTn;
	sl_SNDRSTn  <= I_SNDRSTn;
	sl_SNDBR_Wn <= not I_SNDBW_Rn;
	sl_B02      <= I_B02;

	slv_SBA     <= I_SBA;
	slv_MGRA    <= I_MGRA;

	slv_MADDR   <= I_MADDR;

	O_SMD       <= slv_SMDO;
	slv_VIA_DI  <= I_SMD;

	O_MOSR      <= slv_MOSR;
	O_PFSR      <= slv_PFSR;
	O_INT1n     <= '1';
	O_INT3n     <= not (sl_srq and sl_45f_qa) when (I_SLAP_TYPE = 108 or I_SLAP_TYPE = 109 or I_SLAP_TYPE = 110) else '1';
	O_WAITn     <= '1';
	O_MD7       <= sl_45f_qa;

	----------------------------------------
	-- sheet 11 SP-299 INT3 schema        --
	----------------------------------------
	sl_RD240Kn <= I_MEXTn or I_MA18n or I_BW_Rn;

	-- counter 4/5F is kept in "hold" mode (pins ENT, ENP grounded) so just (ab)used as a 1 bit latch
	-- deviation from schematic, it was determined that INT3 was occuring too early and causing video
	-- problems with roadblasters due to V offset being loaded too early (VSCRCLK is basically /HSYNC)
	-- so here we delay INT3 by about 3 GLDn pulses so V offset is loaded after the VSCRCLK pulse
	p_45F : process
	begin
		wait until rising_edge(I_MCKR);
		sl_GLDn_last <= sl_GLDn;
		if sl_GLDn_last = '0' and sl_GLDn = '1' then
			-- if /LD asserted
			if I_MATCHn = '0' and slv_MGRA(19 downto 4) = x"FFFF" then
				sl_45f_qa_t <= not (slv_MGRA(3) or slv_MGRA(2) or slv_MGRA(1));
				slv_45f <= "0011"; -- delay by 3
			end if;
			-- countdown to actual signal latch
			if slv_45f /= "0000" then
				slv_45f <= slv_45f - 1;
			else
				sl_45f_qa <= sl_45f_qa_t;
			end if;
		end if;
	end process;

	-- clocked S/R flip/flop
	p_SRFF : process
	begin
		wait until rising_edge(I_MCKR);
		-- set (enable INT3)
		if sl_RD240Kn = '0' then
			sl_srq <= '1';
		-- reset (disable INT3)
		elsif sl_SNDRSTn = '0'then
			sl_srq <= '0';
		end if;
	end process;

	----------------------------------------
	-- sheet 2 SP-282 -- (sheet 8 SP-280) --
	-- sheet 3 SP-282 -- (sheet 7 SP-280) --
	----------------------------------------
	p_17A : entity work.SLAPSTIC
	port map (
		I_SLAP_TYPE => I_SLAP_TYPE,
		I_CK  => I_MCKR,
		I_ASn => sl_BASn,
		I_CSn => sl_SLAPn,
		I_A   => slv_MADDR(14 downto 1),
		O_BS  => slv_BS
	);

	-- Main CPU ROMs
	-- if slapstic selected use descrambled addresses else use normal addresses
	O_MADEC <= slv_MADDR(15 downto 1) when sl_SLAPn = '1' else '0' & slv_BS & slv_MADDR(12 downto 1);

	----------------------------------------
	-- sheet 4 SP-282 -- (sheet 2 SP-280) --
	----------------------------------------

	-- 14D 6522 VIA
	u_14D : entity work.M6522
	port map (
		I_RS        => slv_SBA(3 downto 0),
		I_DATA      => slv_VIA_DI,
		O_DATA      => slv_VIA_DO,
		O_DATA_OE_L => open,

		I_RW_L      => sl_SNDBR_Wn,
		I_CS1       => '1',
		I_CS2_L     => sl_SNDEXTn,

		O_IRQ_L     => open,

		-- Port A
		I_CA1       => '1',
		I_CA2       => '1',
		O_CA2       => open,
		O_CA2_OE_L  => open,

		I_PA        => slv_TMS_DO,
		O_PA        => slv_TMS_DI,
		O_PA_OE_L   => open,

		-- Port B
		I_CB1       => '1',
		O_CB1       => open,
		O_CB1_OE_L  => open,

		I_CB2       => '1',
		O_CB2       => open,
		O_CB2_OE_L  => open,

		I_PB(7)     => slv_PBO(7),
		I_PB(6)     => slv_PBO(6),
		I_PB(5)     => slv_PBO(5),
		I_PB(4)     => slv_PBO(4),
		I_PB(3)     => sl_TMS_INTn,
		I_PB(2)     => sl_TMS_RDYn,
		I_PB(1)     => slv_PBO(1),
		I_PB(0)     => slv_PBO(0),

		O_PB        => slv_PBO,
		O_PB_OE_L   => open,

		I_P2_H      => sl_B02, -- FIXME
		RESET_L     => sl_SNDRSTn,
		ENA_4       => '1',-- FIXME
		CLK         => sl_MCKF
	);
	-- running 6522 off inverted clk gives it a chance to place data on the
	-- data bus in time for 6502 to read it else the CPU misses it
	sl_MCKF <= not I_MCKR;

	-- 12E counter is clocked by 7.159MHz and provides TMS5220 clock
	-- when PB4 is 0 counter is preset with 5, else 7 then counts up to F before being preset again
	--	divide by 11 gives 650.8KHz, divide by 9 gives 795.4KHz
	p_14S : process
	begin
		wait until rising_edge(I_MCKR);
		if slv_14S = "1111" or sl_SNDRSTn = '0' then
			slv_14S <= "01" & slv_PBO(4) & '1';
		else
			slv_14S <= slv_14S + 1;
		end if;
	end process;

	-- generate TMS5220 clock enable
	sl_TMS_EN <= '1' when (slv_14S="1111") else '0';

	-- 14E TMS5220
	u_14E : entity work.TMS5220
	port map (
		I_OSC    => I_MCKR,
		I_ENA    => sl_TMS_EN,
		I_WSn    => slv_PBO(0),
		I_RSn    => slv_PBO(1),
		I_DATA   => '1',
		I_TEST   => '1',
		I_DBUS   => slv_TMS_DI,

		O_DBUS   => slv_TMS_DO,
		O_RDYn   => sl_TMS_RDYn,
		O_INTn   => sl_TMS_INTn,

		O_M0     => open,
		O_M1     => open,
		O_ADD8   => open,
		O_ADD4   => open,
		O_ADD2   => open,
		O_ADD1   => open,
		O_ROMCLK => open,

		O_T11    => open,
		O_IO     => open,
		O_PRMOUT => open,
		O_SPKR   => O_SND
	);

	-- sound ROMs
	slv_SMDO <= slv_VIA_DO when (sl_SNDEXTn = '0') else I_SDATA;

	----------------------------------------
	-- schematic variation between games
	-- sheet 4 SP-282 vs sheet 12 SP-299
	----------------------------------------

	--	common address for PROMs 4/5A, 7A on SP-282 or 2D, 1/2D on SP-299
	O_PADDR <= sl_BMO_PFn & slv_MGRA(19 downto 12);

	process (I_SLAP_TYPE, I_MATCHn, I_PD4A, I_PD7A, slv_MGRA)
	begin
		if (I_SLAP_TYPE = 108) or (I_SLAP_TYPE = 109) or (I_SLAP_TYPE = 110) then
			-- if Roadrunner or Roadblasters use variation SP-298 / SP-299
			-- !!! THIS TOTALLY DOESN'T WORK AT ALL !!!
			-- PROM 2D on SP-299
--			if I_MATCHn = '0' then
--				sl_NOROM7n <= '0';
--				sl_NOROM6n <= '0';
--				sl_NOROM5n <= I_PD4A(5);
--				sl_NOROM4n <= I_PD4A(4);
--				sl_NOROM3n <= I_PD4A(7);
--				sl_GD7P7   <= I_PD4A(3);
--				sl_GD7P6   <= I_PD4A(2);
--				sl_GD7P5   <= I_PD4A(1);
--				sl_GD7P4   <= I_PD4A(0);
--				sl_GD7P3   <= I_PD4A(6);
--			else
--				sl_NOROM7n <= '1';
--				sl_NOROM6n <= '1';
--				sl_NOROM5n <= '1';
--				sl_NOROM4n <= '1';
--				sl_NOROM3n <= '1';
--				sl_GD7P7   <= '1';
--				sl_GD7P6   <= '1';
--				sl_GD7P5   <= '1';
--				sl_GD7P4   <= '1';
--				sl_GD7P3   <= '1';
--			end if;
--
--			-- PROM 1/2D , decoder 1D, buffers 2H, 3H, 4H on SP-299
--			slv_GBA <=  I_PD7A & slv_MGRA(11 downto 1);

			-- if Roadrunner or Roadblasters use this variation
			-- derived from MAME source code since schema SP-299 doesn't work

			if I_MATCHn = '0' then
				sl_NOROM7n <= '0';
				sl_NOROM6n <= '0';
				sl_NOROM5n <= I_PD4A(5);
				sl_NOROM4n <= I_PD4A(4);
				sl_NOROM3n <= '1';
				sl_GD7P7   <= I_PD4A(3);
				sl_GD7P6   <= I_PD4A(2);
				sl_GD7P5   <= I_PD4A(1);
				sl_GD7P4   <= I_PD4A(0);
				sl_GD7P3   <= '1';
				-- convert ROM selects back into an address vector
				   if I_PD7A(4) = '0'                    then slv_GBA(19 downto 16) <= "0010"; -- GCS1
				elsif I_PD7A(5) = '0'                    then slv_GBA(19 downto 16) <= "0100"; -- GCS2
				elsif I_PD7A(6) = '0'                    then slv_GBA(19 downto 16) <= "0110"; -- GCS3
				elsif I_PD7A(7) = '0'                    then slv_GBA(19 downto 16) <= "1000"; -- GCS4
				elsif I_PD4A(6) = '0'                    then slv_GBA(19 downto 16) <= "1010"; -- GCS5
				elsif I_PD4A(7) = '0' and I_PD4A(3)= '1' then slv_GBA(19 downto 16) <= "1100"; -- GCS6
				elsif I_PD4A(7) = '0' and I_PD4A(3)= '0' then slv_GBA(19 downto 16) <= "1110"; -- GCS7
				else                                          slv_GBA(19 downto 16) <= "0000";
				end if;
			else
				sl_NOROM7n <= '1';
				sl_NOROM6n <= '1';
				sl_NOROM5n <= '1';
				sl_NOROM4n <= '1';
				sl_NOROM3n <= '1';
				sl_GD7P7   <= '1';
				sl_GD7P6   <= '1';
				sl_GD7P5   <= '1';
				sl_GD7P4   <= '1';
				sl_GD7P3   <= '1';
				slv_GBA(19 downto 16) <= "0000";
			end if;

			slv_GBA(15 downto 1) <= I_PD7A(3 downto 0) & slv_MGRA(11 downto 1);
		else
			-- else if others default to SP-282

			-- PROM 4/5A on SP-282
			if I_MATCHn = '0' then
				sl_NOROM7n <= I_PD4A(7);
				sl_NOROM6n <= I_PD4A(6);
				sl_NOROM5n <= I_PD4A(5);
				sl_NOROM4n <= I_PD4A(4);
				sl_NOROM3n <= '1';
				sl_GD7P7   <= I_PD4A(3);
				sl_GD7P6   <= I_PD4A(2);
				sl_GD7P5   <= I_PD4A(1);
				sl_GD7P4   <= I_PD4A(0);
				sl_GD7P3   <= '1';
				-- PROM 7A on SP-282
				-- convert ROM selects back into an address vector
				   if I_PD7A(4) = '0'                    then slv_GBA(19 downto 16) <= "0010"; -- GCS1
				elsif I_PD7A(5) = '0'                    then slv_GBA(19 downto 16) <= "0100"; -- GCS2
				elsif I_PD7A(6) = '0'                    then slv_GBA(19 downto 16) <= "0110"; -- GCS3
				elsif I_PD7A(7) = '0'                    then slv_GBA(19 downto 16) <= "1000"; -- GCS4
				else                                          slv_GBA(19 downto 16) <= "0000";
				end if;
			else
				sl_NOROM7n <= '1';
				sl_NOROM6n <= '1';
				sl_NOROM5n <= '1';
				sl_NOROM4n <= '1';
				sl_NOROM3n <= '1';
				sl_GD7P7   <= '1';
				sl_GD7P6   <= '1';
				sl_GD7P5   <= '1';
				sl_GD7P4   <= '1';
				sl_GD7P3   <= '1';
				slv_GBA(19 downto 16) <= "0000";
			end if;

			-- buffers 3A, 6A
			slv_GBA(15 downto 1) <= I_PD7A(3 downto 0) & slv_MGRA(11 downto 1);
		end if;
	end process;

	-- the intended effect of /MATCH when not asserted is all ROMs chip selects are also not asserted so databus pullups take over
	slv_VDATA <= I_VDATA when I_MATCHn = '0' else (others=>'1');

	-- if no ROMs fitted on PCB
	slv_5B_DB <=                                                 slv_VDATA(63 downto 56); -- plane 0
	slv_5B_DA <=                                                 slv_VDATA(55 downto 48); -- plane 1
	slv_5C_DB <=                                                 slv_VDATA(47 downto 40); -- plane 2
	slv_5C_DA <= sl_GD7P3 & "1111111" when sl_NOROM3n = '0' else slv_VDATA(39 downto 32); -- plane 3
	slv_5D_DB <= sl_GD7P4 & "1111111" when sl_NOROM4n = '0' else slv_VDATA(31 downto 24); -- plane 4
	slv_5D_DA <= sl_GD7P5 & "1111111" when sl_NOROM5n = '0' else slv_VDATA(23 downto 16); -- plane 5
	slv_5E_DB <= sl_GD7P6 & "1111111" when sl_NOROM6n = '0' else slv_VDATA(15 downto  8); -- plane 6
	slv_5E_DA <= sl_GD7P7 & "1111111" when sl_NOROM7n = '0' else slv_VDATA( 7 downto  0); -- plane 7

	-- gate 9A "not slv_GBA(15)" not used anywhere

	----------------------------------------
	-- sheet 5 SP-282 -- (sheet 4 SP-280) --
	----------------------------------------

	-- 5B Storage/Logic Array Graphics Shifter
	u_5B : entity work.SLAGS
	port map (
		I_MCKR     => I_MCKR,
		I_B        => slv_5B_DB,
		I_A        => slv_5B_DA,
		I_HLDBn    => '1',
		I_HLDAn    => '1',
		I_FLP      => sl_MGHF,
		I_MO_PFn   => sl_BMO_PFn,
		I_LDn      => sl_GLDn,

		O_PFDA     => slv_PFSR(1),
		O_PFDB     => slv_PFSR(0),
		O_MODA     => slv_MOSR(1),
		O_MODB     => slv_MOSR(0)
	);

	----------------------------------------
	-- sheet 6 SP-282 -- (sheet 5 SP-280) --
	----------------------------------------

	-- 5C Storage/Logic Array Graphics Shifter
	u_5C : entity work.SLAGS
	port map (
		I_MCKR     => I_MCKR,
		I_B        => slv_5C_DB,
		I_A        => slv_5C_DA,
		I_HLDBn    => '1',
		I_HLDAn    => sl_NOROM3n,
		I_FLP      => sl_MGHF,
		I_MO_PFn   => sl_BMO_PFn,
		I_LDn      => sl_GLDn,

		O_PFDA     => slv_PFSR(3),
		O_PFDB     => slv_PFSR(2),
		O_MODA     => slv_MOSR(3),
		O_MODB     => slv_MOSR(2)
	);

	----------------------------------------
	-- sheet 7 SP-282 -- (sheet 6 SP-280) --
	----------------------------------------
	-- 5D Storage/Logic Array Graphics Shifter
	u_5D : entity work.SLAGS
	port map (
		I_MCKR     => I_MCKR,
		I_B        => slv_5D_DB,
		I_A        => slv_5D_DA,
		I_HLDBn    => sl_NOROM4n,
		I_HLDAn    => sl_NOROM5n,
		I_FLP      => sl_MGHF,
		I_MO_PFn   => sl_BMO_PFn,
		I_LDn      => sl_GLDn,

		O_PFDA     => slv_PFSR(5),
		O_PFDB     => slv_PFSR(4),
		O_MODA     => slv_MOSR(5),
		O_MODB     => slv_MOSR(4)
	);

	----------------------------------------
	-- sheet 8 SP-282 -- (sheet 3 SP-280) --
	----------------------------------------
	-- 5E Storage/Logic Array Graphics Shifter
	u_5E : entity work.SLAGS
	port map (
		I_MCKR     => I_MCKR,
		I_B        => slv_5E_DB,
		I_A        => slv_5E_DA,
		I_HLDBn    => sl_NOROM6n,
		I_HLDAn    => sl_NOROM7n,
		I_FLP      => sl_MGHF,
		I_MO_PFn   => sl_BMO_PFn,
		I_LDn      => sl_GLDn,

		O_PFDA     => slv_PFSR(7),
		O_PFDB     => slv_PFSR(6),
		O_MODA     => open,
		O_MODB     => slv_MOSR(6)
	);
end;
