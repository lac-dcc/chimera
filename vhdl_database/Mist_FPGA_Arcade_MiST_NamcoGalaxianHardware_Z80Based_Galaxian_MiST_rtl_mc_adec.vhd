---------------------------------------------------------------------
-- FPGA GALAXIAN ADDRESS DECDER
--
-- Version : 2.01
--
-- Copyright(c) 2004 Katsumi Degawa , All rights reserved
--
-- Important !
--
-- This program is freeware for non-commercial use.
-- The author does not guarantee this program.
-- You can use this at your own risk.
--
-- 2004- 4-30  galaxian modify by K.DEGAWA
-- 2004- 5- 6  first release.
-- 2004- 8-23  Improvement with T80-IP.
---------------------------------------------------------------------
--
--GALAXIAN Address Map
--
-- Address      Item(R..read-mode W..wight-mode)        Parts
--0000 - 1FFF   CPU-ROM..R                            ( 7H or 7K )
--2000 - 3FFF   CPU-ROM..R                            ( 7L )
--4000 - 47FF   CPU-RAM..RW                           ( 7N  & 7P )
--5000 - 57FF   VID-RAM..RW
--5800 - 5FFF   OBJ-RAM..RW
--6000 -        SW0..R   LAMP......W
--6800 -        SW1..R   SOUND.....W
--7000 -        DIP..R
--7001                   NMI_ON....W
--7004                   STARS_ON..W
--7006                   H_FLIP....W
--7007                   V-FLIP....W
--7800          WDR..R   PITCH.....W
--
--W MODE
--6000                  1P START
--6001                  2P START
--6002                  COIN LOCKOUT
--6003                  COIN COUNTER
--6004 - 6007           SOUND CONTROL(OSC)
--
--6800                  SOUND CONTROL(FS1)
--6801                  SOUND CONTROL(FS2)
--6802                  SOUND CONTROL(FS3)
--6803                  SOUND CONTROL(HIT)
--6805                  SOUND CONTROL(SHOT)
--6806                  SOUND CONTROL(VOL1)
--6807                  SOUND CONTROL(VOL2)
--
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

entity MC_ADEC is
	port (
		I_CLK_12M     : in  std_logic;
		I_CLK_6M      : in  std_logic;
		I_RSTn        : in  std_logic;
		I_MOONCR      : in  std_logic;

		I_CPU_A       : in  std_logic_vector(15 downto 0);
		I_CPU_D       : in  std_logic;
		I_MREQn       : in  std_logic;
		I_RFSHn       : in  std_logic;
		I_RDn         : in  std_logic;
		I_WRn         : in  std_logic;
		I_H_BL        : in  std_logic;
		I_V_BLn       : in  std_logic;

		O_WAITn       : out std_logic;
		O_NMIn        : out std_logic;
		O_CPU_ROM_CS  : out std_logic;
		O_CPU_RAM_RD  : out std_logic;
		O_CPU_RAM_WR  : out std_logic;
		O_CPU_RAM_CS  : out std_logic;
		O_OBJ_RAM_RD  : out std_logic;
		O_OBJ_RAM_WR  : out std_logic;
		O_OBJ_RAM_RQ  : out std_logic;
		O_VID_RAM_RD  : out std_logic;
		O_VID_RAM_WR  : out std_logic;
		O_SW0_OE      : out std_logic;
		O_SW1_OE      : out std_logic;
		O_DIP_OE      : out std_logic;
		O_WDR_OE      : out std_logic;
		O_DRIVER_WE   : out std_logic;
		O_SOUND_WE    : out std_logic;
		O_MISC_WE     : out std_logic;
		O_PITCH       : out std_logic;
		O_H_FLIP      : out std_logic;
		O_V_FLIP      : out std_logic;
		O_SPEECH      : out std_logic_vector(1 downto 0); -- kingballoon
		O_SPEECH_DIP  : out std_logic;
		O_BD_G        : out std_logic;
		O_STARS_ON    : out std_logic;
		O_ROM_SWP     : out std_logic  -- ZigZag
	);
end;

architecture RTL of MC_ADEC is
	signal W_8E1_Q   : std_logic_vector(3 downto 0) := (others => '0');
	signal W_8E2_Q   : std_logic_vector(3 downto 0) := (others => '0');
	signal W_8P_Q    : std_logic_vector(7 downto 0) := (others => '0');
	signal W_8N_Q    : std_logic_vector(7 downto 0) := (others => '0');
	signal W_8M_Q    : std_logic_vector(7 downto 0) := (others => '0');
	signal W_9N_Q    : std_logic_vector(7 downto 0) := (others => '0');
	signal W_NMI_ONn : std_logic := '0';
	signal MEM_SEL   : std_logic := '0';
	--------  CPU WAITn  ----------------------------------------------
--	signal W_6S1_Q   : std_logic := '0';
	signal W_6S1_Qn  : std_logic := '0';
--	signal W_6S2_Qn  : std_logic := '0';

	signal W_V_BL    : std_logic := '0';

begin
		W_NMI_ONn <= W_9N_Q(1); --  galaxian

--		O_WAITn <= '1' ; -- No Wait
		O_WAITn <= W_6S1_Qn;

	process(I_CLK_6M, I_V_BLn)
	begin
		if (I_V_BLn = '0') then
--			W_6S1_Q  <= '0';
			W_6S1_Qn <= '1';
		elsif rising_edge(I_CLK_6M) then
--			W_6S1_Q  <= not (I_H_BL or W_8P_Q(2));
			W_6S1_Qn <=      I_H_BL or W_8P_Q(2);
		end if;
	end process;

--	process(I_CPU_CLK)
--	begin
--		if falling_edge(I_CPU_CLK) then
--			W_6S2_Qn <= not W_6S1_Q;
--		end if;
--	end process;

--------  CPU NMIn  -----------------------------------------------
	W_V_BL <= not I_V_BLn;
	process(W_V_BL, W_NMI_ONn)
	begin
		if (W_NMI_ONn = '0') then
			O_NMIn  <= '1';
		elsif rising_edge(W_V_BL) then
			O_NMIn  <= '0';
		end if;
	end process;

	-------------------------------------------------------------------
	u_8e1 : entity work.LOGIC_74XX139
	port map (
		I_G      => I_MREQn,
		I_Sel(1) => I_CPU_A(15),
		I_Sel(0) => I_CPU_A(14),
		O_Q      => W_8E1_Q
	);

	----------   CPU_ROM CS    0000 - 3FFF  ---------------------------
	u_8e2 : entity work.LOGIC_74XX139
	port map (
		I_G      => I_RDn,
		I_Sel(1) => W_8E1_Q(0),
		I_Sel(0) => I_CPU_A(13),
		O_Q      => W_8E2_Q
	);

	O_CPU_ROM_CS  <= not (W_8E2_Q(0) and W_8E2_Q(1) ) ;  --   0000 - 3FFF
	-------------------------------------------------------------------
	--                  ADDRESS
	--    W_8E1_Q[0] = 0000 - 3FFF    ---- CPU_ROM_USE
	--    W_8E1_Q[1] = 4000 - 7FFF    ---- GALAXIAN USE   *1 (I_MOONCR = '0')
	--    W_8E1_Q[2] = 8000 - BFFF    ---- MOONCREST USE     (I_MOONCR = '1')
	--    W_8E1_Q[3] = C000 - FFFF

	MEM_SEL <= W_8E1_Q(1) when I_MOONCR = '0' else W_8E1_Q(2);

	u_8p : entity work.LOGIC_74XX138
	port map (
		I_G1  => I_RFSHn,
		I_G2a => MEM_SEL,   -- <= *1
		I_G2b => MEM_SEL,   -- <= *1
		I_Sel => I_CPU_A(13 downto 11),
		O_Q   => W_8P_Q
	);

	u_8n : entity work.LOGIC_74XX138
	port map (
		I_G1  => '1',
		I_G2a => I_RDn,
		I_G2b => MEM_SEL,   -- <= *1
		I_Sel => I_CPU_A(13 downto 11),
		O_Q   => W_8N_Q
	);

	u_8m : entity work.LOGIC_74XX138
	port map (
	--	I_G1  => W_6S2_Qn,
		I_G1  => '1', -- No Wait
		I_G2a => I_WRn,
		I_G2b => MEM_SEL,   -- <= *1
		I_Sel => I_CPU_A(13 downto 11),
		O_Q   => W_8M_Q
	);

	O_BD_G        <= not (W_8E1_Q(0) and W_8P_Q(0));
	O_OBJ_RAM_RQ  <= not W_8P_Q(3);

	O_CPU_RAM_CS  <= not (W_8N_Q(0) and W_8M_Q(0));

	O_WDR_OE      <= not W_8N_Q(7);
	O_DIP_OE      <= not W_8N_Q(6);
	O_SW1_OE      <= not W_8N_Q(5);
	O_SW0_OE      <= not W_8N_Q(4);
	O_OBJ_RAM_RD  <= not W_8N_Q(3);
	O_VID_RAM_RD  <= not W_8N_Q(2);
--	UNUSED        <= not W_8N_Q(1);
	O_CPU_RAM_RD  <= not W_8N_Q(0);

	O_PITCH       <= not W_8M_Q(7);
	O_MISC_WE     <= not W_8M_Q(6);
	O_SOUND_WE    <= not W_8M_Q(5);
	O_DRIVER_WE   <= not W_8M_Q(4);
	O_OBJ_RAM_WR  <= not W_8M_Q(3);
	O_VID_RAM_WR  <= not W_8M_Q(2);
--	UNUSED        <= not W_8M_Q(1);
	O_CPU_RAM_WR  <= not W_8M_Q(0);

	-----  Parts 9N ---------

	process(I_CLK_12M, I_RSTn)
	begin
		if (I_RSTn = '0') then
			W_9N_Q <= (others => '0');
		elsif rising_edge(I_CLK_12M) then
			if (W_8M_Q(6) = '0') then
				case I_CPU_A(2 downto 0) is
					when "000"  => W_9N_Q(0) <= I_CPU_D;
					when "001"  => W_9N_Q(1) <= I_CPU_D;
					when "010"  => W_9N_Q(2) <= I_CPU_D;
					when "011"  => W_9N_Q(3) <= I_CPU_D;
					when "100"  => W_9N_Q(4) <= I_CPU_D;
					when "101"  => W_9N_Q(5) <= I_CPU_D;
					when "110"  => W_9N_Q(6) <= I_CPU_D;
					when "111"  => W_9N_Q(7) <= I_CPU_D;
					when others => null;
				end case;
			end if;
		end if;
	end process;

	O_STARS_ON <= W_9N_Q(4);
	O_H_FLIP   <= W_9N_Q(6);
	O_V_FLIP   <= W_9N_Q(7);
	O_SPEECH   <= W_9N_Q(2)&W_9N_Q(0); -- King & Balloon
	O_SPEECH_DIP <= W_9N_Q(3);
	O_ROM_SWP  <= W_9N_Q(2); -- ZigZag

end RTL;
