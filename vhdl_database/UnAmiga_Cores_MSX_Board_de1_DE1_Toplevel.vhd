library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity DE1_Toplevel is
	port
	(
--		CLOCK_24		:	 in std_logic_vector(1 downto 0);
--		CLOCK_27		:	 in std_logic_vector(1 downto 0);
		CLOCK_50		:	 in STD_LOGIC;
--		EXT_CLOCK		:	 in STD_LOGIC;
		KEY		:	 in std_logic_vector(1 downto 0);
--		SW		:	 in std_logic_vector(1 downto 0);
--		HEX0		:	 out std_logic_vector(6 downto 0);
--		HEX1		:	 out std_logic_vector(6 downto 0);
--		HEX2		:	 out std_logic_vector(6 downto 0);
--		HEX3		:	 out std_logic_vector(6 downto 0);
--		LEDG		:	 out std_logic_vector(7 downto 0);
		LEDS		:	 out std_logic_vector(1 downto 0);
		--
		UART_TXD		:	 out STD_LOGIC;
		UART_RXD		:	 in STD_LOGIC;
		--
		DRAM_DQ		:	 inout std_logic_vector(15 downto 0);
		DRAM_ADDR		:	 out std_logic_vector(12 downto 0);
		DRAM_LDQM		:	 out STD_LOGIC;
		DRAM_UDQM		:	 out STD_LOGIC;
		DRAM_WE_N		:	 out STD_LOGIC;
		DRAM_CAS_N		:	 out STD_LOGIC;
		DRAM_RAS_N		:	 out STD_LOGIC;
		DRAM_CS_N		:	 out STD_LOGIC;
		DRAM_BA_0		:	 out STD_LOGIC;
		DRAM_BA_1		:	 out STD_LOGIC;
		DRAM_CLK		:	 out STD_LOGIC;
		DRAM_CKE		:	 out STD_LOGIC;
--		FL_DQ		:	 inout std_logic_vector(7 downto 0);
--		FL_ADDR		:	 out std_logic_vector(21 downto 0);
--		FL_WE_N		:	 out STD_LOGIC;
--		FL_RST_N		:	 out STD_LOGIC;
--		FL_OE_N		:	 out STD_LOGIC;
--		FL_CE_N		:	 out STD_LOGIC;
--		SRAM_DQ		:	 inout std_logic_vector(15 downto 0);
--		SRAM_ADDR		:	 out std_logic_vector(17 downto 0);
--		SRAM_UB_N		:	 out STD_LOGIC;
--		SRAM_LB_N		:	 out STD_LOGIC;
--		SRAM_WE_N		:	 out STD_LOGIC;
--		SRAM_CE_N		:	 out STD_LOGIC;
--		SRAM_OE_N		:	 out STD_LOGIC;
		SD_DAT		:	 in STD_LOGIC;	-- in
		SD_DAT3		:	 out STD_LOGIC; -- out
		SD_CMD		:	 out STD_LOGIC;
		SD_CLK		:	 out STD_LOGIC;
--		TDI		:	 in STD_LOGIC;
--		TCK		:	 in STD_LOGIC;
--		TCS		:	 in STD_LOGIC;
--		TDO		:	 out STD_LOGIC;
--		I2C_SDAT		:	 inout STD_LOGIC;
--		I2C_SCLK		:	 out STD_LOGIC;
		PS2_DAT		:	 inout STD_LOGIC;
		PS2_CLK		:	 inout STD_LOGIC;
		--
		PS2_MDAT		:	 inout STD_LOGIC;
		PS2_MCLK		:	 inout STD_LOGIC;
		--
		VGA_HS		:	 out STD_LOGIC;
		VGA_VS		:	 out STD_LOGIC;
		VGA_R		:	 out unsigned(5 downto 0);
		VGA_G		:	 out unsigned(5 downto 0);
		VGA_B		:	 out unsigned(5 downto 0);
		-- sonido
		AUDIO_L		:	out STD_LOGIC;
		AUDIO_R		:	out STD_LOGIC;
		--
		MANDOA		:	 in std_logic_vector(5 downto 0);
		MANDOB		:	 in std_logic_vector(5 downto 0)
--		AUD_ADCLRCK		:	 out STD_LOGIC;
--		AUD_ADCDAT		:	 in STD_LOGIC;
--		AUD_DACLRCK		:	 out STD_LOGIC;
--		AUD_DACDAT		:	 out STD_LOGIC;
--		AUD_BCLK		:	 inout STD_LOGIC;
--		AUD_XCK		:	 out STD_LOGIC;
--		GPIO_0		:	 inout std_logic_vector(35 downto 0);
--		GPIO_1		:	 inout std_logic_vector(35 downto 0)
	);
END entity;

architecture rtl of DE1_Toplevel is

  component a_codec
	port(
	  iCLK	    : in std_logic;
	  iSL       : in std_logic_vector(15 downto 0);	-- left chanel
	  iSR       : in std_logic_vector(15 downto 0);	-- right chanel
	  oAUD_XCK	: out std_logic;
	  oAUD_DATA : out std_logic;
	  oAUD_LRCK : out std_logic;
	  oAUD_BCK  : out std_logic;
	  iAUD_ADCDAT	: in std_logic;
	  oAUD_ADCLRCK	: out std_logic;
	  o_tape	: out std_logic	  
	);
  end component;

  component I2C_AV_Config
	port(
	  iCLK	    : in std_logic;
	  iRST_N    : in std_logic;
	  oI2C_SCLK : out std_logic;
	  oI2C_SDAT : inout std_logic
	);
  end component;

  component seg7_lut_4
	port(
	  oSEG0	  : out std_logic_vector(6 downto 0);
	  oSEG1   : out std_logic_vector(6 downto 0);
	  oSEG2   : out std_logic_vector(6 downto 0);
	  oSEG3   : out std_logic_vector(6 downto 0);
	  iDIG	  : in std_logic_vector(15 downto 0)
	);
  end component;
  
-- jepalza, proviene del MIST, para el DAC de sonido
-- Sigma Delta audio
COMPONENT hybrid_pwm_sd
	PORT
	(
		clk		:	 IN STD_LOGIC;
		n_reset		:	 IN STD_LOGIC;
		din		:	 IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		dout		:	 OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT compressor
PORT
(
	clk :	 IN STD_LOGIC;
	in1 :	 IN STD_LOGIC_VECTOR(11 DOWNTO 0); 
	in2 :	 IN STD_LOGIC_VECTOR(11 DOWNTO 0);
	out1 :	 OUT STD_LOGIC_VECTOR(15 DOWNTO 0);    
	out2 :	 OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
);
END COMPONENT;
  

signal reset : std_logic;
signal clk21m      : std_logic;
signal memclk      : std_logic;
signal pll_locked : std_logic;

signal ps2m_clk_in : std_logic;
signal ps2m_clk_out : std_logic;
signal ps2m_dat_in : std_logic;
signal ps2m_dat_out : std_logic;

signal ps2k_clk_in : std_logic;
signal ps2k_clk_out : std_logic;
signal ps2k_dat_in : std_logic;
signal ps2k_dat_out : std_logic;

signal vga_red : std_logic_vector(7 downto 0);
signal vga_green : std_logic_vector(7 downto 0);
signal vga_blue : std_logic_vector(7 downto 0);
signal vga_window : std_logic;
signal vga_hsync : std_logic;
signal vga_vsync : std_logic;

--signal audio_l : signed(15 downto 0);
--signal audio_r : signed(15 downto 0);

--signal hex : std_logic_vector(15 downto 0);

signal SOUND_L : std_logic_vector(15 downto 0);
signal SOUND_R : std_logic_vector(15 downto 0);
signal CmtIn : std_logic;

signal joya : std_logic_vector(5 downto 0);
signal joyb : std_logic_vector(5 downto 0);

signal VGA_R4 : unsigned(3 downto 0);
signal VGA_G4 : unsigned(3 downto 0);
signal VGA_B4 : unsigned(3 downto 0);

--alias PS2_MDAT : std_logic is GPIO_1(19);
--alias PS2_MCLK : std_logic is GPIO_1(18);


--jepalza
signal AUDIO_L2 : std_logic_vector(15 downto 0);
signal AUDIO_R2 : std_logic_vector(15 downto 0);


COMPONENT SEG7_LUT
	PORT
	(
		oSEG		:	 OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		iDIG		:	 IN STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;


begin

--	All bidir ports tri-stated
--FL_DQ <= (others => 'Z');
--SRAM_DQ <= (others => 'Z');
--I2C_SDAT	<= 'Z';
--GPIO_0 <= (others => 'Z');
--GPIO_1 <= (others => 'Z');

--ps2m_clk_out <='1';
--ps2m_dat_out <='1';

	-- PS2 keyboard & mouse
ps2m_dat_in<=PS2_MDAT;
PS2_MDAT <= '0' when ps2m_dat_out='0' else 'Z';
ps2m_clk_in<=PS2_MCLK;
PS2_MCLK <= '0' when ps2m_clk_out='0' else 'Z';

ps2k_dat_in<=PS2_DAT;
PS2_DAT <= '0' when ps2k_dat_out='0' else 'Z';
ps2k_clk_in<=PS2_CLK;
PS2_CLK <= '0' when ps2k_clk_out='0' else 'Z';

-- Joystick
joya<=MANDOA(5) & MANDOA(4) & MANDOA(0) & MANDOA(1) & MANDOA(2) & MANDOA(3); 
joyb<=MANDOB(5) & MANDOB(4) & MANDOB(0) & MANDOB(1) & MANDOB(2) & MANDOB(3); 

reset<=KEY(0) and pll_locked;

--hexdigit0 : component SEG7_LUT
--	port map (oSEG => HEX0, iDIG => hex(3 downto 0));
--hexdigit1 : component SEG7_LUT
--	port map (oSEG => HEX1, iDIG => hex(7 downto 4));
--hexdigit2 : component SEG7_LUT
--	port map (oSEG => HEX2, iDIG => hex(11 downto 8));
--hexdigit3 : component SEG7_LUT
--	port map (oSEG => HEX3, iDIG => hex(15 downto 12));

  U00 : entity work.pll4x2
    port map(					-- for Altera DE1
		areset => not KEY(0),
      inclk0 => CLOCK_50,       -- 50 MHz external
      c0     => clk21m,         -- 21.43MHz internal (50*3/7)
      c1     => memclk,         -- 85.72MHz = 21.43MHz x 4
      c2     => DRAM_CLK,        -- 85.72MHz external
      locked => pll_locked
    );

	 DRAM_ADDR(12) <= '0';

emsx_top : entity work.Virtual_Toplevel
	generic map(
		mouse_fourbyte => '0',
		mouse_init => '1'
	)
	port map(
    -- Clock, Reset ports
--    CLOCK_50 => CLOCK_50,
--    CLOCK_27 => CLOCK_27(0),
		clk21m => clk21m,
		memclk => memclk,
		lock_n => reset, --pll_locked,

--    -- MSX cartridge slot ports
--    pSltClk     : out std_logic;	-- pCpuClk returns here, for Z80, etc.
--    pSltRst_n   : in std_logic :='1';		-- pCpuRst_n returns here
--    pSltSltsl_n : inout std_logic:='1';
--    pSltSlts2_n : inout std_logic:='1';
--    pSltIorq_n  : inout std_logic:='1';
--    pSltRd_n    : inout std_logic:='1';
--    pSltWr_n    : inout std_logic:='1';
--    pSltAdr     : inout std_logic_vector(15 downto 0):=(others=>'1');
--    pSltDat     : inout std_logic_vector(7 downto 0):=(others=>'1');
--    pSltBdir_n  : out std_logic;	-- Bus direction (not used in master mode)
--
--    pSltCs1_n   : inout std_logic:='1';
--    pSltCs2_n   : inout std_logic:='1';
--    pSltCs12_n  : inout std_logic:='1';
--    pSltRfsh_n  : inout std_logic:='1';
--    pSltWait_n  : inout std_logic:='1';
--    pSltInt_n   : inout std_logic:='1';
--    pSltM1_n    : inout std_logic:='1';
--    pSltMerq_n  : inout std_logic:='1';
--
--    pSltRsv5    : out std_logic;            -- Reserved
--    pSltRsv16   : out std_logic;            -- Reserved (w/ external pull-up)
--    pSltSw1     : inout std_logic:='1';          -- Reserved (w/ external pull-up)
--    pSltSw2     : inout std_logic:='1';          -- Reserved

    -- SDRAM DE1 ports
--	 pMemClk => DRAM_CLK,
    pMemCke => DRAM_CKE,
    pMemCs_n => DRAM_CS_N,
    pMemRas_n => DRAM_RAS_N,
    pMemCas_n => DRAM_CAS_N,
    pMemWe_n => DRAM_WE_N,
    pMemUdq => DRAM_UDQM,
    pMemLdq => DRAM_LDQM,
    pMemBa1 => DRAM_BA_1,
    pMemBa0 => DRAM_BA_0,
    pMemAdr => DRAM_ADDR(11 downto 0),
    pMemDat => DRAM_DQ,

    -- PS/2 keyboard ports
	 pPs2Clk_out => ps2k_clk_out,
	 pPs2Dat_out => ps2k_dat_out,
	 pPs2Clk_in => ps2k_clk_in,
	 pPs2Dat_in => ps2k_dat_in,

	 -- PS/2 mouse ports
		ps2m_clk_in => ps2m_clk_in,
		ps2m_dat_in => ps2m_dat_in,
		ps2m_clk_out => ps2m_clk_out,
		ps2m_dat_out => ps2m_dat_out,
 
--    -- Joystick ports (Port_A, Port_B)
    pJoyA => joya,
--    pStrA       : out std_logic;
    pJoyB => joyb,
--    pStrB       : out std_logic;

    -- SD/MMC slot ports
    pSd_Ck => SD_CLK,
    pSd_Cm => SD_CMD,
--  pSd_Dt	    : inout std_logic_vector( 3 downto 0);  -- pin 1(D3), 9(D2), 8(D1), 7(D0)
    pSd_Dt3	=> SD_DAT3,
    pSd_Dt0	=> SD_DAT,


		-- DIP switch, Lamp ports
    pSW => "1111", --KEY,
    pDip => "1111111111", --SW,
    pLedG => OPEN, --LEDG,
    pLedR => OPEN, --LEDS,

--  pLedR(9) <= MemMode;
--  pLedR(8) <= MRAMmode;
--  pLedR(7) <= ff_turbo;
--  pLedR(6) <= Kmap;
--  pLedR(5) <= MegType(1);
--  pLedR(4) <= MegType(0);
--  pLedR(3) <= Slt1Mode;
--  pLedR(2) <= MmcMode;
--  pLedR(1) <= DispSel(1);
--  pLedR(0) <= DispSel(0);
--
--  pLedG <= CmtIn & Sound_level(7 downto 1);

    -- Video, Audio/CMT ports
    pDac_VR => vga_red,
    pDac_VG => vga_green,
    pDac_VB => vga_blue,
--    pDac_S 		: out   std_logic;						-- Sound
--    pREM_out	: out   std_logic;						-- REM output; 1 - Tape On
--    pCMT_out	: out   std_logic;						-- CMT output
--    pCMT_in		: in    std_logic :='1';						-- CMT input

    pVideoHS_n => vga_hsync,
    pVideoVS_n => vga_vsync,

    -- DE1 7-SEG Display
    hex => OPEN, --hex,

	 SOUND_L => SOUND_L,
	 SOUND_R => SOUND_R,
	 
	 CmtIn => '1',--CmtIn,
	 
	 RS232_RxD => UART_RXD,
	 RS232_TxD => UART_TXD
);

	VGA_HS<=vga_hsync;
	VGA_VS<=vga_vsync;
	vga_window<='1';

	mydither : entity work.video_vga_dither
		generic map(
			outbits => 4
		)
		port map(
			clk=>CLOCK_50, -- FIXME - sysclk
			hsync=>vga_hsync,
			vsync=>vga_vsync,
			vid_ena=>vga_window,
			iRed => unsigned(vga_red),
			iGreen => unsigned(vga_green),
			iBlue => unsigned(vga_blue),
			oRed => VGA_R4,
			oGreen => VGA_G4,
			oBlue => VGA_B4
		);

		VGA_R <= VGA_R4 & "00";
		VGA_G <= VGA_G4 & "00";
		VGA_B <= VGA_B4 & "00";
		
-- Hex display		
--	U34: seg7_lut_4
--    port map (HEX0,HEX1,HEX2,HEX3,hex);

-- Audio
		
--  AUD_ADCLRCK	<= 'Z';
		
--  U35: a_codec
--	port map (
--	  iCLK	  => clk21m,
--	  iSL     => SOUND_L,
--	  iSR     => SOUND_R,
--	  oAUD_XCK  => AUD_XCK,
--	  oAUD_DATA => AUD_DACDAT,
--	  oAUD_LRCK => AUD_DACLRCK,
--	  oAUD_BCK  => AUD_BCLK,
--	  iAUD_ADCDAT => AUD_ADCDAT,
--	  oAUD_ADCLRCK => AUD_ADCLRCK,
--	  o_tape => CmtIn
--	);

--  U36: I2C_AV_Config
--	port map (
--	  iCLK	  => clk21m,
--	  iRST_N  => reset,
--	  oI2C_SCLK => I2C_SCLK,
--	  oI2C_SDAT => I2C_SDAT
--	);


-- jepalza, DAC desde MIST
leftsd: component hybrid_pwm_sd
	port map
	(
		clk => clk21m,
		n_reset => reset,
		din => not SOUND_L(15) & std_logic_vector(SOUND_L(14 downto 0)),
		dout => AUDIO_L
	);
	
rightsd: component hybrid_pwm_sd
	port map
	(
		clk => clk21m,
		n_reset => reset,
		din => not SOUND_R(15) & std_logic_vector(SOUND_R(14 downto 0)),
		dout => AUDIO_R
	);

-- este modulo lo he cogido del MISTER
--compresor: compressor
--port map
--(
--	clk => memclk,
--	in1 => SOUND_L(15 downto 4), 
--	in2 => SOUND_R(15 downto 4),
--	out1 => AUDIO_L2,       
--	out2 => AUDIO_R2
--);

end architecture;
