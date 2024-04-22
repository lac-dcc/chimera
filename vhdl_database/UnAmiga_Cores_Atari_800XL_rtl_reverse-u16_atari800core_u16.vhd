---------------------------------------------------------------------------
-- Port to ZX-UNO by Quest 2016
--
-- Ahora tambien para UnAmiga, Jepalza 2018
-- empleando partes del Reverse U16
--
-- (c) 2013-2015 mark watson
-- I am happy for anyone to use this for non-commercial use.
-- If my vhdl files are used commercially or otherwise sold,
-- please contact me for explicit permission at scrameta (gmail).
-- This applies for source and binary form and derived works.
---------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all; 
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

LIBRARY work;

ENTITY atari800core_u16 IS 
	GENERIC
	(
		internal_rom : integer := 1 ;
		internal_ram : integer := 0
	);
	PORT
	(
		CLK_IN :  IN  STD_LOGIC; 

		PS2_CLK1 	: IN  STD_LOGIC;
		PS2_DAT1 	: IN  STD_LOGIC;

		VGA_VS 	: OUT  STD_LOGIC;
		VGA_HS 	: OUT  STD_LOGIC;
		VGA_B 	: OUT  STD_LOGIC_VECTOR(5 DOWNTO 0);
		VGA_G 	: OUT  STD_LOGIC_VECTOR(5 DOWNTO 0);
		VGA_R 	: OUT  STD_LOGIC_VECTOR(5 DOWNTO 0);

		-- mandos de juego
		JOYA			: IN  std_logic_vector(5 downto 0);
		JOYB 			: IN  std_logic_vector(5 downto 0);
		-- led
		LEDS			: OUT  std_logic_vector(1 downto 0);
		-- botones
		KEY			: IN  std_logic_vector(1 downto 0);
		
		--
		AUDIO1_LEFT  : OUT std_logic;
		AUDIO1_RIGHT : OUT std_logic;

		SD_MISO 		 : IN  STD_LOGIC;
		SD_SCK 		 : OUT  STD_LOGIC;
		SD_MOSI 		 : OUT  STD_LOGIC;
		SD_nCS 		 : OUT  STD_LOGIC;

		-- jepalza, ahora con SDRAM, hasta 32mb de espacio
		-- SDRAM (32MB 16x16bit)
		SDRAM_DQ			: inout std_logic_vector(15 downto 0);
		SDRAM_A			: out std_logic_vector(12 downto 0);
		SDRAM_BA			: out std_logic_vector(1 downto 0);
		SDRAM_CLK		: out std_logic;
		SDRAM_CS_N		: out std_logic;
		SDRAM_CKE		: out std_logic;
		SDRAM_DQML		: out std_logic;
		SDRAM_DQMH		: out std_logic;
		SDRAM_WE_N		: out std_logic;
		SDRAM_CAS_N		: out std_logic;
		SDRAM_RAS_N		: out std_logic
	
	);
END atari800core_u16;

ARCHITECTURE vhdl OF atari800core_u16 IS 

component hq_dac
port (
  reset :in std_logic;
  clk :in std_logic;
  clk_ena : in std_logic;
  pcm_in : in std_logic_vector(19 downto 0);
  dac_out : out std_logic
);
end component;

	signal AUDIO_L_PCM : std_logic_vector(15 downto 0);
	signal AUDIO_R_PCM : std_logic_vector(15 downto 0);
	
	signal VIDEO_VS : std_logic;
	signal VIDEO_HS : std_logic;
	signal VIDEO_CS : std_logic;
	signal VIDEO_R : std_logic_vector(7 downto 0);
	signal VIDEO_G : std_logic_vector(7 downto 0);
	signal VIDEO_B : std_logic_vector(7 downto 0);

	signal VIDEO_BLANK : std_logic;
	signal VIDEO_BURST : std_logic;
	signal VIDEO_START_OF_FIELD : std_logic;
	signal VIDEO_ODD_LINE : std_logic;

	signal PAL : std_logic;
	
	signal JOY1_IN_N : std_logic_vector(4 downto 0);
	signal JOY2_IN_N : std_logic_vector(4 downto 0);

	signal PLL1_LOCKED : std_logic;
	signal CLK_PLL1 : std_logic;
	
	signal RESET_N : std_logic;
	signal PLL_LOCKED : std_logic;
	signal CLK : std_logic;
	signal CLK_SDRAM : std_logic;

	-- pokey keyboard
	SIGNAL KEYBOARD_SCAN : std_logic_vector(5 downto 0);
	SIGNAL KEYBOARD_RESPONSE : std_logic_vector(1 downto 0);
	
	-- gtia consol keys
	SIGNAL CONSOL_START : std_logic;
	SIGNAL CONSOL_SELECT : std_logic;
	SIGNAL CONSOL_OPTION : std_logic;
	SIGNAL FKEYS : std_logic_vector(11 downto 0);

	-- scandoubler
	signal half_scandouble_enable_reg : std_logic;
	signal half_scandouble_enable_next : std_logic;
	signal scanlines_reg : std_logic;
	signal scanlines_next : std_logic;
 	SIGNAL COMPOSITE_ON_HSYNC : std_logic := '1';
 	SIGNAL VGA : std_logic := '0';

	-- dma/virtual drive
	signal DMA_ADDR_FETCH : std_logic_vector(23 downto 0);
	signal DMA_WRITE_DATA : std_logic_vector(31 downto 0);
	signal DMA_FETCH : std_logic;
	signal DMA_32BIT_WRITE_ENABLE : std_logic;
	signal DMA_16BIT_WRITE_ENABLE : std_logic;
	signal DMA_8BIT_WRITE_ENABLE : std_logic;
	signal DMA_READ_ENABLE : std_logic;
	signal DMA_MEMORY_READY : std_logic;
	signal DMA_MEMORY_DATA : std_logic_vector(31 downto 0);

	signal ZPU_ADDR_ROM : std_logic_vector(15 downto 0);
	signal ZPU_ROM_DATA :  std_logic_vector(31 downto 0);

	signal ZPU_OUT1 : std_logic_vector(31 downto 0);
	signal ZPU_OUT2 : std_logic_vector(31 downto 0);
	signal ZPU_OUT3 : std_logic_vector(31 downto 0);
	signal ZPU_OUT4 : std_logic_vector(31 downto 0);
	signal ZPU_OUT5 : std_logic_vector(31 downto 0);

	signal zpu_pokey_enable : std_logic;
	signal zpu_sio_txd : std_logic;
	signal zpu_sio_rxd : std_logic;
	signal zpu_sio_command : std_logic;

	-- system control from zpu
	signal ram_select : std_logic_vector(2 downto 0);
	signal reset_atari : std_logic;
	signal pause_atari : std_logic;
	SIGNAL speed_6502 : std_logic_vector(5 downto 0);
	signal emulated_cartridge_select: std_logic_vector(5 downto 0);

	-- turbo freezer!
	signal freezer_enable : std_logic;
	signal freezer_activate: std_logic;

	signal PS2_KEYS : STD_LOGIC_VECTOR(511 downto 0);
	signal PS2_KEYS_NEXT : STD_LOGIC_VECTOR(511 downto 0);

	-- RAM interna
	signal ram_addr : std_logic_vector(22 downto 0);
	signal ram_do : std_logic_vector(31 downto 0);
	signal ram_di : std_logic_vector(31 downto 0);

	-- SDRAM hacia RAM
	signal ram_request		: std_logic;
	signal ram_request_complete	: std_logic;
	signal ram_write_enable	: std_logic;
	signal ram_read_enable	: std_logic;
	signal ram_refresh		: std_logic;
	--
	signal SDRAM_WIDTH_8BIT_ACCESS 	: std_logic;
	signal SDRAM_WIDTH_16BIT_ACCESS	: std_logic;
	signal SDRAM_WIDTH_32BIT_ACCESS	: std_logic;
	signal SDRAM_RESET_N 		: std_logic;
	--
	signal CLK_SDRAM_IN			:std_logic; -- jepalza, reloj 114.28 para el modulo SDRAM
	
	signal VIDEOSW : std_logic := '0';
	signal SCANL : std_logic := '0';
	signal VIDEOSTD : std_logic :='0';
	signal tv : std_logic :='0';
	signal REBOOT : std_logic := '0';
--	signal CLK_MULTIBOOT : std_logic;
	signal scandoubler_ctrl: std_logic;

-- jepalza, ajustes vga LX16
	signal VGA_R4 : STD_LOGIC_VECTOR(3 downto 0);
	signal VGA_G4 : STD_LOGIC_VECTOR(3 downto 0);
	signal VGA_B4 : STD_LOGIC_VECTOR(3 downto 0);

	
BEGIN 


	main_pll: entity work.pal_pll 
	port map (
		inclk0 	=> CLK_IN,
		c0	=> CLK,		-- 56.64 (1.77 * 32)
		c1	=> CLK_SDRAM_IN,	-- 113.28
		c2	=> SDRAM_CLK,		-- 113.28 (shifted) -2.42nz (unos 90 grados)
--		c3	=> CLK_HDMI_IN,		-- 141.6 (pixel clock * 5)
--		c4	=> CLK_PIXEL_IN,	-- 28.32
		locked	=> PLL_LOCKED
	);

			
reset_n <= KEY(0) and PLL_LOCKED and SDRAM_RESET_N; -- jepalza, meto RESET externo y SDRAM_RESET_N



-- sonido canal izquierdo
dac_l : hq_dac
port map
(
  reset => not(reset_n),
  clk => clk,
  clk_ena => '1',
  pcm_in => AUDIO_L_PCM&"0000",
  dac_out => audio1_left -- audio_out_l
);
--audio1_left <= audio_out_l;

-- sonido canal derecho, jepalza
dac_r : hq_dac
port map
(
  reset => not(reset_n),
  clk => clk,
  clk_ena => '1',
  pcm_in => AUDIO_R_PCM&"0000",
  dac_out => audio1_right --audio_out_r
);
--audio1_right <= audio_out_r;



JOY2_IN_N <=  (JOYA(4) xnor not (ps2_keys(16#171#) or ps2_keys(16#70#))) --real joy & numpad joy emulation.
				& (JOYA(0) xnor not  ps2_keys(16#74#)) 
				& (JOYA(1) xnor not  ps2_keys(16#6b#)) 
				& (JOYA(2) xnor not (ps2_keys(16#72#)  or ps2_keys(16#73#))) 
				& (JOYA(3) xnor not  ps2_keys(16#75#));
JOY1_IN_N <= JOYB(4) & JOYB(0) & JOYB(1) & JOYB(2) & JOYB(3);

--JOY1_IN_N <= JOYSTICK1_6&JOYSTICK1_4&JOYSTICK1_3&JOYSTICK1_2&JOYSTICK1_1;
--JOY2_IN_N <= JOYSTICK2_6&JOYSTICK2_4&JOYSTICK2_3&JOYSTICK2_2&JOYSTICK2_1;

-- PS2 to pokey
keyboard_map1 : entity work.ps2_to_atari800
	GENERIC MAP
	(
		ps2_enable => 1,
		direct_enable => 1
	)
	PORT MAP
	( 
		CLK => clk,
		RESET_N => reset_n,
		PS2_CLK => PS2_CLK1,
		PS2_DAT => PS2_DAT1,

		INPUT => zpu_out4,
		
		KEYBOARD_SCAN => KEYBOARD_SCAN,
		KEYBOARD_RESPONSE => KEYBOARD_RESPONSE,

		CONSOL_START => CONSOL_START,
		CONSOL_SELECT => CONSOL_SELECT,
		CONSOL_OPTION => CONSOL_OPTION,
		
		FKEYS => FKEYS,
		FREEZER_ACTIVATE => freezer_activate,

		PS2_KEYS_NEXT_OUT => ps2_keys_next,
		PS2_KEYS => ps2_keys
		--,MRESET => REBOOT -- jepalza, anulo
	);

atarixl_simple_sdram1 : entity work.atari800core_simple_sdram
	GENERIC MAP
	(
		cycle_length => 32,
		internal_rom => internal_rom,
		internal_ram => internal_ram,
		video_bits   => 8,
		palette      => 0,
		low_memory   => 0, -- jepalza --> 0=8mb, 1=1mb, 2=512k?
      STEREO       => 1,
      COVOX        => 1
	)
	PORT MAP
	(
		CLK => CLK,
		RESET_N => RESET_N and not(RESET_ATARI),

		VIDEO_VS => VIDEO_VS,
		VIDEO_HS => VIDEO_HS,
		VIDEO_CS => VIDEO_CS,
		VIDEO_B => VIDEO_B,
		VIDEO_G => VIDEO_G,
		VIDEO_R => VIDEO_R,
		VIDEO_BLANK =>VIDEO_BLANK,
		VIDEO_BURST =>VIDEO_BURST,
		VIDEO_START_OF_FIELD =>VIDEO_START_OF_FIELD,
		VIDEO_ODD_LINE =>VIDEO_ODD_LINE,

		AUDIO_L => AUDIO_L_PCM,
		AUDIO_R => AUDIO_R_PCM,

		JOY1_n => JOY1_IN_N, -- este puerto, ademas, emula mando con teclado
		JOY2_n => JOY2_IN_N, 

		KEYBOARD_RESPONSE => KEYBOARD_RESPONSE,
		KEYBOARD_SCAN => KEYBOARD_SCAN,

		SIO_COMMAND => zpu_sio_command,
		SIO_RXD => zpu_sio_txd,
		SIO_TXD => zpu_sio_rxd,

		CONSOL_OPTION => CONSOL_OPTION,
		CONSOL_SELECT => CONSOL_SELECT,
		CONSOL_START => CONSOL_START,

-- TODO, connect to SRAM! Handle 32-bit in multiple cycles. How fast is the sram.
		SDRAM_REQUEST => ram_request,
		SDRAM_REQUEST_COMPLETE => ram_request_complete,
		SDRAM_READ_ENABLE => ram_read_enable,
		SDRAM_WRITE_ENABLE => ram_write_enable,
		SDRAM_ADDR => ram_addr,
		SDRAM_DO => ram_do,
		SDRAM_DI => ram_di,
		SDRAM_REFRESH => ram_refresh, -- jepalza
		SDRAM_32BIT_WRITE_ENABLE => SDRAM_WIDTH_32BIT_ACCESS, -- jepalza
		SDRAM_16BIT_WRITE_ENABLE => SDRAM_WIDTH_16BIT_ACCESS, -- jepalza
		SDRAM_8BIT_WRITE_ENABLE => SDRAM_WIDTH_8BIT_ACCESS, -- jepalza

		DMA_FETCH => DMA_FETCH,
		DMA_READ_ENABLE => DMA_READ_ENABLE,
		DMA_32BIT_WRITE_ENABLE => DMA_32BIT_WRITE_ENABLE,
		DMA_16BIT_WRITE_ENABLE => DMA_16BIT_WRITE_ENABLE,
		DMA_8BIT_WRITE_ENABLE => DMA_8BIT_WRITE_ENABLE,
		DMA_ADDR => DMA_ADDR_FETCH,
		DMA_WRITE_DATA => DMA_WRITE_DATA,
		MEMORY_READY_DMA => DMA_MEMORY_READY,
		DMA_MEMORY_DATA => DMA_MEMORY_DATA, 

   	RAM_SELECT => ram_select,
		PAL => PAL,
		HALT => pause_atari,
		THROTTLE_COUNT_6502 => speed_6502,
		emulated_cartridge_select => emulated_cartridge_select,
--		freezer_enable => freezer_enable,
--		freezer_activate => freezer_activate
		freezer_enable => '0',
		freezer_activate => '0'
	);


scandoubler_ctrl <= '1';--ram_do(0); -- jepalza, no se si vale asi

-- jepalza, SDRAM desde Reverse U16
sdram_adaptor : entity work.sdram_statemachine
GENERIC MAP(ADDRESS_WIDTH => 24, -- toda la RAM posible: 24-0 son 32mb !!!!
			AP_BIT => 10,
			COLUMN_WIDTH => 9,
			ROW_WIDTH => 13 -- nuestra SDRAM tiene 12 a 0 (13)
			)
PORT MAP(
	    CLK_SYSTEM => CLK, --ATARI_CLK,
		 CLK_SDRAM => CLK_SDRAM_IN, -- 113.28mhz necesarios, pero le paso 114.28
		 RESET_N => KEY(0), -- reset externo por boton
		 REQUEST => ram_request,
		 READ_EN => ram_read_enable,
		 WRITE_EN => ram_write_enable,
		 BYTE_ACCESS => SDRAM_WIDTH_8BIT_ACCESS,
		 WORD_ACCESS => SDRAM_WIDTH_16BIT_ACCESS,
		 LONGWORD_ACCESS => SDRAM_WIDTH_32BIT_ACCESS,
		 REFRESH => ram_refresh,
		 COMPLETE => ram_request_complete,
		 -- modulo SRAM "emulado"
		 --ADDRESS_IN => "00"&"0000"&ram_addr(18 downto 0), -- jepalza, compatible zxuno 512k (solo 320k de ampliacion)
		 ADDRESS_IN => "00"&ram_addr, -- jepalza, 8mb de ram , entrada 24-0 , pero ram_addr solo 22-0
		 DATA_IN => ram_di,
		 DATA_OUT => ram_do,
		 -- Acceso SDRAM externa
		 SDRAM_DQ => SDRAM_DQ,
		 SDRAM_BA0 => SDRAM_BA(0),
		 SDRAM_BA1 => SDRAM_BA(1),
		 SDRAM_CKE => SDRAM_CKE, -- jepalza, antes no estaba
		 SDRAM_CS_N => SDRAM_CS_N, -- jepalza, idem
		 SDRAM_RAS_N => SDRAM_RAS_N,
		 SDRAM_CAS_N => SDRAM_CAS_N,
		 SDRAM_WE_N => SDRAM_WE_N,
		 SDRAM_LDQM => SDRAM_DQML,
		 SDRAM_UDQM => SDRAM_DQMH,
		 SDRAM_ADDR => SDRAM_A, --(12 downto 0), no es necesario
		 --
		 reset_client_n => SDRAM_RESET_N
		 );

-- jepalza, alternativo funciona, pero que lo haga el modulo SDRAM
--SDRAM_CKE <= '1';
--SDRAM_CS_N <= '0';

-- Video options
	PAL <= not VIDEOSTD;
	
--	O_NTSC <= not PAL;
--	O_PAL  <= PAL;
	
	-- Key combos for zxuno
	process (clk) 
	begin
	if (clk'event and clk='1') then
		-- scrolLock RGB/VGA
		if (VIDEOSW = '0' and (not(ps2_keys(16#7e#)) and ps2_keys_next(16#7e#)) = '1'  ) then
			vga <= '1';
			composite_on_hsync <= '0';
			VIDEOSW <= '1';
		elsif (VIDEOSW = '1' and (not(ps2_keys(16#7e#)) and ps2_keys_next(16#7e#)) = '1') then
			vga <= '0';
			composite_on_hsync <= '1';
			VIDEOSW <= '0';
		end if;	
		
		-- "*" PAL / NTSC
		if (VIDEOSTD = '0' and (not(ps2_keys(16#7c#)) and ps2_keys_next(16#7c#)) = '1'  ) then
			VIDEOSTD <= '1';
		elsif (VIDEOSTD = '1' and (not(ps2_keys(16#7c#)) and ps2_keys_next(16#7c#)) = '1') then
			VIDEOSTD <= '0';
		end if;					
	 end if; 
	end process;

	process(clk,RESET_N,reset_atari)
	begin
		if ((RESET_N and not(reset_atari))='0') then
			half_scandouble_enable_reg <= '0';
			scanlines_reg <= '0';
		elsif (clk'event and clk='1') then
			half_scandouble_enable_reg <= half_scandouble_enable_next;
			scanlines_reg <= scanlines_next;
		end if;
	end process;

	half_scandouble_enable_next <= not(half_scandouble_enable_reg);
	
	scanlines_next <= scanlines_reg xor (not(ps2_keys(16#7b#)) and ps2_keys_next(16#7b#)); -- left alt

	scandoubler1: entity work.scandoubler
	PORT MAP
	( 
		CLK => CLK,
	   RESET_N => reset_n,
		
		VGA => scandoubler_ctrl xor vga,
		COMPOSITE_ON_HSYNC => scandoubler_ctrl xor composite_on_hsync,

		colour_enable => half_scandouble_enable_reg,
		doubled_enable => '1',
		scanlines_on => scanlines_reg,
		
		-- GTIA interface
		pal => PAL,
		colour_in => VIDEO_B,
		vsync_in => VIDEO_VS,
		hsync_in => VIDEO_HS,
		csync_in => VIDEO_CS,
		
		-- TO TV...
		R => VGA_R4,
		G => VGA_G4,
		B => VGA_B4,
		
		VSYNC => VGA_VS,
		HSYNC => VGA_HS
	);

VGA_R <= VGA_R4 & "00";
VGA_G <= VGA_G4 & "00";
VGA_B <= VGA_B4 & "00";

zpu: entity work.zpucore
	GENERIC MAP
	(
		platform => 1,
		spi_clock_div => 2, -- 28MHz/2. Max for SD cards is 25MHz...
		usb => 0
	)
	PORT MAP
	(
		-- standard...
		CLK => CLK,
		RESET_N => RESET_N and SDRAM_RESET_N, -- jepalza incluyo SDRAM_RESET_N

		-- dma bus master (with many waitstates...)
		ZPU_ADDR_FETCH => DMA_ADDR_FETCH,
		ZPU_DATA_OUT => DMA_WRITE_DATA,
		ZPU_FETCH => DMA_FETCH,
		ZPU_32BIT_WRITE_ENABLE => DMA_32BIT_WRITE_ENABLE,
		ZPU_16BIT_WRITE_ENABLE => DMA_16BIT_WRITE_ENABLE,
		ZPU_8BIT_WRITE_ENABLE => DMA_8BIT_WRITE_ENABLE,
		ZPU_READ_ENABLE => DMA_READ_ENABLE,
		ZPU_MEMORY_READY => DMA_MEMORY_READY,
		ZPU_MEMORY_DATA => DMA_MEMORY_DATA, 

		-- rom bus master
		-- data on next cycle after addr
		ZPU_ADDR_ROM => zpu_addr_rom,
		ZPU_ROM_DATA => zpu_rom_data,

		-- spi master
		-- Too painful to bit bang spi from zpu, so we have a hardware master in here
		ZPU_SD_DAT0 => SD_MISO,
		ZPU_SD_CLK => SD_SCK,
		ZPU_SD_CMD => SD_MOSI,
		ZPU_SD_DAT3 => SD_nCS,

		-- SIO
		-- Ditto for speaking to Atari, we have a built in Pokey
		ZPU_POKEY_ENABLE => zpu_pokey_enable,
		ZPU_SIO_TXD => zpu_sio_txd,
		ZPU_SIO_RXD => zpu_sio_rxd,
		ZPU_SIO_COMMAND => zpu_sio_command,

		-- external control
		-- switches etc. sector DMA blah blah.
		ZPU_IN1 => X"000"&
			"00"&ps2_keys(16#76#)&ps2_keys(16#5A#)&ps2_keys(16#174#)&ps2_keys(16#16B#)&ps2_keys(16#172#)&ps2_keys(16#175#)& -- (esc)FLRDU
			FKEYS,
		ZPU_IN2 => X"00000000",
		ZPU_IN3 => X"00000000",
		ZPU_IN4 => X"00000000",

		-- ouputs - e.g. Atari system control, halt, throttle, rom select
		ZPU_OUT1 => zpu_out1,
		ZPU_OUT2 => zpu_out2, --joy0
		ZPU_OUT3 => zpu_out3, --joy1
		ZPU_OUT4 => zpu_out4, --keyboard
		ZPU_OUT5 => zpu_out5  --analog stick (not supported without USB)
	);

	pause_atari <= zpu_out1(0);
	reset_atari <= zpu_out1(1);
	speed_6502 <= zpu_out1(7 downto 2);
	ram_select <= zpu_out1(10 downto 8);
	emulated_cartridge_select <= zpu_out1(22 downto 17);
	freezer_enable <= zpu_out1(25);

zpu_rom1: entity work.zpu_rom
	port map(
	        clock => clk,
	        address => zpu_addr_rom(13 downto 2),
	        q => zpu_rom_data
	);

enable_179_clock_div_zpu_pokey : entity work.enable_divider
	generic map (COUNT=>32) -- cycle_length
	port map(clk=>clk,reset_n=>reset_n,enable_in=>'1',enable_out=>zpu_pokey_enable);
	
LEDS(0) <= not(zpu_sio_command);	


END vhdl;
