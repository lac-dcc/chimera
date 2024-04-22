library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- cambios jepalza para unamiga
entity DE1_Toplevel is
	port
	(

		CLOCK_50		:	 in STD_LOGIC;
--		EXT_CLOCK		:	 in STD_LOGIC;
		KEY		:	 in std_logic_vector(1 downto 0);
--		SW		:	 in std_logic_vector(9 downto 0);
--		HEX0		:	 out std_logic_vector(6 downto 0);
--		HEX1		:	 out std_logic_vector(6 downto 0);
--		HEX2		:	 out std_logic_vector(6 downto 0);
--		HEX3		:	 out std_logic_vector(6 downto 0);
--		LEDG		:	 out std_logic_vector(7 downto 0);
		LEDS		:	 out std_logic_vector(2 downto 0);
		--
		UART_TXD		:	 out STD_LOGIC;
		UART_RXD		:	 in STD_LOGIC;
		--
		DRAM_DQ		:	 inout std_logic_vector(15 downto 0);
		DRAM_ADDR		:	 out std_logic_vector(11 downto 0);
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
		-- sagutxu
		PS2_MDAT		:	 inout STD_LOGIC;
		PS2_MCLK		:	 inout STD_LOGIC;
		--
		VGA_HS		:	 out STD_LOGIC;
		VGA_VS		:	 out STD_LOGIC;
		VGA_R6		:	 out unsigned(5 downto 0);
		VGA_G6		:	 out unsigned(5 downto 0);
		VGA_B6		:	 out unsigned(5 downto 0);
--		AUD_ADCLRCK		:	 out STD_LOGIC;
--		AUD_ADCDAT		:	 in STD_LOGIC;
--		AUD_DACLRCK		:	 out STD_LOGIC;
--		AUD_DACDAT		:	 out STD_LOGIC;
--		AUD_BCLK		:	 inout STD_LOGIC;
--		AUD_XCK		:	 out STD_LOGIC;
--		GPIO_0		:	 inout std_logic_vector(35 downto 0);
		-- sonido
		AUDIO_L		:	out STD_LOGIC;
		AUDIO_R		:	out STD_LOGIC;
		--
		MANDO1		:	 in std_logic_vector(5 downto 0);
		MANDO2		:	 in std_logic_vector(5 downto 0)
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
signal sysclk      : std_logic;
signal memclk      : std_logic;
--signal pll_locked : std_logic;

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

--jepalza, los quito
--signal audio_l : signed(15 downto 0);
--signal audio_r : signed(15 downto 0);

signal hex : std_logic_vector(15 downto 0);

signal AUDIO_L2 : std_logic_vector(15 downto 0);
signal AUDIO_R2 : std_logic_vector(15 downto 0);
signal SOUND_L : std_logic_vector(15 downto 0);
signal SOUND_R : std_logic_vector(15 downto 0);
signal CmtIn : std_logic;

signal joya : std_logic_vector(5 downto 0);
signal joyb : std_logic_vector(5 downto 0);

-- jepalza
--alias PS2_MDAT : std_logic is GPIO_1(0);
--alias PS2_MCLK : std_logic is GPIO_1(1);
signal BOTON_RST : std_logic;
-- para los colores internos
signal VGA_R : unsigned(3 downto 0);
signal VGA_G : unsigned(3 downto 0);
signal VGA_B : unsigned(3 downto 0);

--COMPONENT SEG7_LUT
--	PORT
--	(
--		oSEG		:	 OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
--		iDIG		:	 IN STD_LOGIC_VECTOR(3 DOWNTO 0)
--	);
--END COMPONENT;


begin

--	All bidir ports tri-stated
--FL_DQ <= (others => 'Z');
--SRAM_DQ <= (others => 'Z');
--I2C_SDAT	<= 'Z';
--GPIO_0 <= (others => 'Z');
--GPIO_1 <= (others => 'Z');

--ps2m_clk_out <='1';
--ps2m_dat_out <='1';

-- jepalza, sin reset de momento, anulado
BOTON_RST <= '1';

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
--joya <= 
	--GPIO_1(29)&GPIO_1(35)&GPIO_1(28)&GPIO_1(30)&GPIO_1(32)&GPIO_1(34);
--joyb <= not (MANDO2(5)&MANDO2(4)&MANDO2(0)&MANDO2(1)&MANDO2(2)&MANDO2(3)); 
	--GPIO_1(21)&GPIO_1(25)&GPIO_1(23)&GPIO_1(20)&GPIO_1(22)&GPIO_1(24);

	-- START, BOTON-A, BOTON-B, IZQ,DER,ABAJO,ARRIBA
--joya <= NOT (KEY(1) & MANDO1(5) & '1' & MANDO1(4) & MANDO1(0) & MANDO1(1) & MANDO1(2) & MANDO1(3)); 
joyb <= NOT MANDO2;

reset<=BOTON_RST;-- and pll_locked; -- si uno de los dos es "0", hace reset

  U00 : entity work.pll
    port map(					-- for Altera DE1
      inclk0 => CLOCK_50,       -- 50 MHz external
      c0     => sysclk,         -- ~48Mhz
      c1     => memclk,         -- 100MHz
      c2     => DRAM_CLK        -- 100MHz phase shifted
    );


virtualtoplevel : entity work.Virtual_Toplevel
	generic map(
		colAddrBits => 8,
		rowAddrBits => 12
	)
	port map(
		reset => reset,-- si es "0", es reset
		MCLK => sysclk,
		SDR_CLK => memclk,

    -- SDRAM DE1 ports
--	 pMemClk => DRAM_CLK,
    DRAM_CKE => DRAM_CKE,
    DRAM_CS_N => DRAM_CS_N,
    DRAM_RAS_N => DRAM_RAS_N,
    DRAM_CAS_N => DRAM_CAS_N,
    DRAM_WE_N => DRAM_WE_N,
    DRAM_UDQM => DRAM_UDQM,
    DRAM_LDQM => DRAM_LDQM,
    DRAM_BA_1 => DRAM_BA_1,
    DRAM_BA_0 => DRAM_BA_0,
    DRAM_ADDR => DRAM_ADDR,
    DRAM_DQ => DRAM_DQ,

    -- PS/2 keyboard ports
	 ps2k_clk_out => ps2k_clk_out,
	 ps2k_dat_out => ps2k_dat_out,
	 ps2k_clk_in => ps2k_clk_in,
	 ps2k_dat_in => ps2k_dat_in,
 
--    -- Joystick ports (Port_A, Port_B)
	joya => '0' & not KEY(0) & not MANDO1(5) & not MANDO1(4) & not MANDO1(3) & not MANDO1(2) & not MANDO1(1) & not MANDO1(0),
	joyb => '0' & not KEY(1) & not MANDO2(5) & not MANDO2(4) & not MANDO2(3) & not MANDO2(2) & not MANDO2(1) & not MANDO2(0),

    -- SD/MMC slot ports
	spi_clk => SD_CLK,
	spi_mosi => SD_CMD,
	spi_cs => SD_DAT3,
	spi_miso => SD_DAT,

	-- Video, Audio/CMT ports
    VGA_R => vga_red,
    VGA_G => vga_green,
    VGA_B => vga_blue,

    VGA_HS => vga_hsync,
    VGA_VS => vga_vsync,

	 DAC_LDATA => SOUND_L,
	 DAC_RDATA => SOUND_R,
	 
	 LED	=>	LEDS(0), -- FM habilitado
	 
	 RS232_RXD => UART_RXD,
	 RS232_TXD => UART_TXD
);


	VGA_HS<=vga_hsync;
	VGA_VS<=vga_vsync;
	vga_window<='1';

	mydither : entity work.video_vga_dither
		generic map(
			outbits => 4
		)
		port map(
			clk=>memclk, -- FIXME - sysclk
			hsync=>vga_hsync,
			vsync=>vga_vsync,
			vid_ena=>vga_window,
			iRed => unsigned(vga_red),
			iGreen => unsigned(vga_green),
			iBlue => unsigned(vga_blue),
			oRed => VGA_R,
			oGreen => VGA_G,
			oBlue => VGA_B
		);

-- jepalza, colores unamiga
VGA_R6 <= VGA_R & "00";		
VGA_G6 <= VGA_G & "00";		
VGA_B6 <= VGA_B & "00";		
		
--hex<=X"0000";
-- Hex display		
--	U34: seg7_lut_4
--    port map (HEX0,HEX1,HEX2,HEX3,hex);

-- Audio
		
--  AUD_ADCLRCK	<= 'Z';
	
--jepalza, de momento, sin sonido	
--  U35: a_codec
--	port map (
--	  iCLK	  => sysclk,
--	  iSL     => (others =>'0'), -- SOUND_L,
--	  iSR     => (others =>'0'), -- SOUND_R,
--	  oAUD_XCK  => AUD_XCK,
--	  oAUD_DATA => AUD_DACDAT,
--	  oAUD_LRCK => AUD_DACLRCK,
--	  oAUD_BCK  => AUD_BCLK,
--	  iAUD_ADCDAT => AUD_ADCDAT,
--	  oAUD_ADCLRCK => AUD_ADCLRCK,
--	  o_tape => CmtIn
--	);

--jepalza, sin uso
--  U36: I2C_AV_Config
--	port map (
--	  iCLK	  => sysclk,
--	  iRST_N  => reset,
--	  oI2C_SCLK => I2C_SCLK,
--	  oI2C_SDAT => I2C_SDAT
--	);DRAM_CLK

-- jepalza, DAC desde MIST
leftsd: component hybrid_pwm_sd
	port map
	(
		clk => memclk,
		n_reset => reset,
		din => not AUDIO_L2(15) & std_logic_vector(AUDIO_L2(14 downto 0)),
		dout => AUDIO_L
	);
	
rightsd: component hybrid_pwm_sd
	port map
	(
		clk => memclk,
		n_reset => reset,
		din => not AUDIO_R2(15) & std_logic_vector(AUDIO_R2(14 downto 0)),
		dout => AUDIO_R
	);

-- este modulo lo he cogido del MISTER
compresor: compressor
port map
(
	clk => memclk,
	in1 => SOUND_L(15 downto 4), 
	in2 => SOUND_R(15 downto 4),
	out1 => AUDIO_L2,       
	out2 => AUDIO_R2
);

end architecture;
