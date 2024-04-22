--
-- Terasic DE1 top-level
--

-- altera message_off 10540

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Generic top-level entity for Altera DE1 board
entity top is
	port (
		-- Clocks
		CLOCK_24       : in    std_logic_vector(1 downto 0);
		CLOCK_27       : in    std_logic_vector(1 downto 0);
		CLOCK_50       : in    std_logic;
		EXT_CLOCK      : in    std_logic;

		-- Switches
		SW             : in    std_logic_vector(9 downto 0);
		-- Buttons
		KEY            : in    std_logic_vector(3 downto 0);
		 
		-- 7 segment displays
		HEX0           : out   std_logic_vector(6 downto 0)		:= (others => '1');
		HEX1           : out   std_logic_vector(6 downto 0)		:= (others => '1');
		HEX2           : out   std_logic_vector(6 downto 0)		:= (others => '1');
		HEX3           : out   std_logic_vector(6 downto 0)		:= (others => '1');
		-- Red LEDs
		LEDR           : out   std_logic_vector(9 downto 0)		:= (others => '0');
		-- Green LEDs
		LEDG           : out   std_logic_vector(7 downto 0)		:= (others => '0');
		 
		-- VGA
		VGA_R          : out   std_logic_vector(3 downto 0)		:= (others => '1');
		VGA_G          : out   std_logic_vector(3 downto 0)		:= (others => '1');
		VGA_B          : out   std_logic_vector(3 downto 0)		:= (others => '1');
		VGA_HS         : out   std_logic									:= '1';
		VGA_VS         : out   std_logic									:= '1';
		 
		-- Serial
		UART_RXD       : in    std_logic;
		UART_TXD       : out   std_logic									:= '1';
		 
		-- PS/2 Keyboard
		PS2_CLK        : in std_logic;
		PS2_DAT        : in std_logic;

		-- I2C
		I2C_SCLK       : inout std_logic;
		I2C_SDAT       : inout std_logic;

		-- Audio
		AUD_XCK        : out   std_logic									:= '1';
		AUD_BCLK       : out   std_logic									:= '1';
		AUD_ADCLRCK    : out   std_logic									:= '1';
		AUD_ADCDAT     : in    std_logic;
		AUD_DACLRCK    : out   std_logic									:= '1';
		AUD_DACDAT     : out   std_logic									:= '1';

		-- SRAM
		SRAM_ADDR      : out   std_logic_vector(17 downto 0)		:= (others => '1');
		SRAM_DQ        : inout std_logic_vector(15 downto 0)		:= (others => '1');
		SRAM_CE_N      : out   std_logic									:= '1';
		SRAM_OE_N      : out   std_logic									:= '1';
		SRAM_WE_N      : out   std_logic									:= '1';
		SRAM_UB_N      : out   std_logic									:= '1';
		SRAM_LB_N      : out   std_logic									:= '1';

		-- SDRAM
		DRAM_ADDR      : out   std_logic_vector(11 downto 0)		:= (others => '1');
		DRAM_DQ        : inout std_logic_vector(15 downto 0)		:= (others => '1');
		DRAM_BA_0      : out   std_logic									:= '1';
		DRAM_BA_1      : out   std_logic									:= '1';
		DRAM_CAS_N     : out   std_logic									:= '1';
		DRAM_CKE       : out   std_logic									:= '1';
		DRAM_CLK       : out   std_logic									:= '1';
		DRAM_CS_N      : out   std_logic									:= '1';
		DRAM_LDQM      : out   std_logic									:= '1';
		DRAM_RAS_N     : out   std_logic									:= '1';
		DRAM_UDQM      : out   std_logic									:= '1';
		DRAM_WE_N      : out   std_logic									:= '1';
		 
		-- Flash
		FL_ADDR        : out   std_logic_vector(21 downto 0)		:= (others => '1');
		FL_DQ          : inout std_logic_vector(7 downto 0)		:= (others => '1');
		FL_RST_N       : out   std_logic									:= '1';
		FL_OE_N        : out   std_logic									:= '1';
		FL_WE_N        : out   std_logic									:= '1';
		FL_CE_N        : out   std_logic									:= '1';
		 
		-- SD card (SPI mode)
		SD_nCS         : out   std_logic									:= '1';
		SD_MOSI        : out   std_logic									:= '1';
		SD_SCLK        : out   std_logic									:= '1';
		SD_MISO        : in    std_logic;
		 
		-- GPIO
		GPIO_0         : inout std_logic_vector(31 downto 0)		:= (others => '1');
		
		
				-- PS/2
		GPIO_PS2_CLK1        : inout std_logic;
		GPIO_PS2_DAT1        : inout std_logic;

				-- PS/2
		GPIO_PS2_CLK2        : in std_logic;
		GPIO_PS2_DAT2        : in std_logic;

		
		GPIO_1         : inout std_logic_vector(10 downto 0)		:= (others => '1');
		
		
		GPIO_D : inout std_logic_vector(7 downto 0)		:= (others => 'Z');
		GPIO_WR : out   std_logic									:= '1';
		GPIO_RD : out   std_logic									:= '1';
		GPIO_A0 : out   std_logic									:= '1';
		GPIO_CS : out   std_logic									:= '1';
		
		GPIO_INT : in   std_logic	
		
		
	);
end entity;

architecture Behavior of top is

	-- Reset signal
	signal reset_n				: std_logic;		-- Reset geral
	
	-- Master clock
	signal pll_reset			: std_logic;		-- Reset do PLL
	signal pll_locked			: std_logic;		-- PLL travado quando 1
	
	-- Master clock
	signal clk_28		: std_logic;
	signal memory_clock		: std_logic;
	signal vid_clk: std_logic := '0';
	signal sysclk : std_logic := '0';
	signal atari_clk: std_logic;
	
		signal ram_a				: std_logic_vector(17 downto 0);		-- 512K
	signal ram_din				: std_logic_vector(15 downto 0);
	signal ram_dout				: std_logic_vector(15 downto 0);
	signal ram_cs				: std_logic;
	signal ram_oe				: std_logic;
	signal ram_we				: std_logic;
	signal rom_a				: std_logic_vector(13 downto 0);		-- 16K
	signal rom_dout			: std_logic_vector(7 downto 0);
	
	signal from_sram			: std_logic_vector(15 downto 0);
	signal to_sram			: std_logic_vector(15 downto 0);
	
		-- ram
	signal loader_ram_a				: std_logic_vector(17 downto 0);		-- 512K
	signal loader_to_sram			: std_logic_vector(15 downto 0);
	signal loader_from_sram			: std_logic_vector(15 downto 0);
	signal loader_ram_data			: std_logic_vector(15 downto 0);
	signal loader_ram_cs				: std_logic;
	signal loader_ram_oe				: std_logic;
	signal loader_ram_we				: std_logic;

	signal a2601_ram_a				: std_logic_vector(11 downto 0);	
	signal a2601_ram_dout			: std_logic_vector(7 downto 0);
	

	
	
	--rgb
	signal rgb_loader_out			: std_logic_vector(7 downto 0);
	signal rgb_atari_out				: std_logic_vector(7 downto 0);
	
	signal hsync_loader_out			: std_logic;
	signal vsync_loader_out			: std_logic;
	
	signal hsync_atari_out			: std_logic;
	signal vsync_atari_out			: std_logic;
	
	signal vga_hsync_n_s		: std_logic;
	signal vga_vsync_n_s		: std_logic;
	signal vga_blank_s		: std_logic;
	
	
		-- PS/2
	signal keyb_data_s 				: std_logic_vector(7 downto 0);
	signal keyb_valid_s 				: std_logic;
	signal clk_keyb 					: std_logic;
	
	signal cnt_hor_s 					: std_logic_vector(8 downto 0);
	signal cnt_ver_s 					: std_logic_vector(8 downto 0);
	signal loader_hor_s				: std_logic_vector( 8 downto 0);
	signal loader_ver_s				: std_logic_vector( 8 downto 0);
	signal vga_col_s					: std_logic_vector( 7 downto 0);
	
	alias smt_rx_i						: std_logic is GPIO_0(0);
	alias smt_tx_o						: std_logic is GPIO_0(1);
	
begin

	-- 28 MHz master clock
	pll: work.pll1 port map (
		areset		=> pll_reset,				-- PLL Reset
		inclk0		=> CLOCK_50,				-- Clock 50 MHz externo
		c0				=> clk_28,										
		locked		=> pll_locked				-- Sinal de travamento (1 = PLL travado e pronto)
	);
	
	pll_reset	<= not KEY(0);
	reset_n		<= not (pll_reset or not pll_locked);	-- System is reset by external reset switch or PLL being out of lock
	
	loader : work.speccy48_top port map (
		
		clk_28      => clk_28,
		reset_n_i => reset_n,
	
		-- VGA
		VGA_R(3 downto 1)          => rgb_loader_out (7 downto 5),    
		VGA_G(3 downto 1)          => rgb_loader_out (4 downto 2),    
		VGA_B(3 downto 2)          => rgb_loader_out (1 downto 0),   
		VGA_HS         => hsync_loader_out  ,  
		VGA_VS         => vsync_loader_out ,    
   
   	-- PS/2 Keyboar   -- PS/2 Ke
		keyb_data      => keyb_data_s, 
		keyb_valid     => keyb_valid_s,   
		
		SRAM_ADDR      => loader_ram_a ,
		FROM_SRAM      => loader_from_sram   ,
		TO_SRAM       	=> loader_to_sram   ,
		SRAM_CE_N      => loader_ram_cs ,
		SRAM_OE_N      => loader_ram_oe ,
		SRAM_WE_N      => loader_ram_we ,
                  
				  
		SD_nCS         => SD_nCS    ,
		SD_MOSI        => SD_MOSI  , 
		SD_SCLK        => SD_SCLK  , 
		SD_MISO        => SD_MISO   ,
		

		PORT_243B		=> open,
		
		JOYSTICK       => "000" & SW(4 downto 0),
		
		cnt_h_o      => loader_hor_s,
		cnt_v_o      => loader_ver_s,
		
		iRS232_rx	=> smt_rx_i,
		oRS232_tx	=> smt_tx_o
		
	);
	
	
	
	
	SRAM_ADDR   <= ram_a;
	SRAM_DQ 		<= to_sram when ram_we = '0' else (others=>'Z');
	from_sram 	<= SRAM_DQ;
	SRAM_CE_N   <= ram_cs;
   SRAM_OE_N   <= ram_oe;
	SRAM_WE_N   <= ram_we;
   SRAM_UB_N   <= '1';
	SRAM_LB_N   <= '0';


	



		
	process(SW)
	begin
		--if SW(9)='0' then
			
			
			
		--else
			
			--LOADER
			

			ram_a				<= loader_ram_a;
			
			to_sram			<= loader_to_sram;
			loader_from_sram <= from_sram;
			
			ram_cs			<= loader_ram_cs;
			ram_oe			<= loader_ram_oe;
			ram_we			<= loader_ram_we;
			

		--end if;
	end process;
			


	
	scandbl: work.scandoubler 
	port map(
		clk					=> clk_28,
		hSyncPolarity		=> '0',
		vSyncPolarity		=> '0',
		enable_in			=> '1',
		scanlines_in		=> '0',
		video_in				=> rgb_loader_out,
		vsync_in				=> vsync_loader_out,
		hsync_in				=> hsync_loader_out,
		video_out			=> vga_col_s,
		vsync_out			=> vga_vsync_n_s,
		hsync_out			=> vga_hsync_n_s
	);
	
	VGA_R  <= vga_col_s(7 downto 5) & '0';
	VGA_G  <= vga_col_s(4 downto 2) & '0';
	VGA_B  <= vga_col_s(1 downto 0) & vga_col_s(0) & '0';
	VGA_HS <= vga_hsync_n_s;
	VGA_VS <= vga_vsync_n_s;
			
	----------------------------
	-- debugs
	
		-- Led display
	ld3: work.seg7 port map(
		D		=> "0000",
		Q		=> HEX3
	);

	ld2: work.seg7 port map(
		D		=> loader_ram_a(11 downto 8),
		Q		=> HEX2
	);

	ld1: work.seg7 port map(
		D		=> loader_ram_a(7 downto 4),
		Q		=> HEX1
	);

	ld0: work.seg7 port map(
		D		=> loader_ram_a(3 downto 0),
		Q		=> HEX0
	);
	
	

end architecture;
