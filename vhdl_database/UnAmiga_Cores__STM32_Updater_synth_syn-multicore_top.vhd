

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity top is
	generic
	(
	
	  out_HDMI		: boolean := true;
	  out_loader	: boolean := false;
	  out_vga		: boolean := false
	  
	);
	port 
	(
			-- Clocks
		clock_50_i			: in    std_logic;

		-- Buttons
		btn_n_i				: in    std_logic_vector(4 downto 1);
		btn_oe_n_i			: in    std_logic;
		btn_clr_n_i			: in    std_logic;

		-- SRAM (AS7C34096)
		sram_addr_o			: out   std_logic_vector(18 downto 0)	:= (others => '0');
		sram_data_io		: inout std_logic_vector(7 downto 0)	:= (others => 'Z');
		sram_we_n_o			: out   std_logic								:= '1';
		sram_ce_n_o			: out   std_logic_vector(1 downto 0)	:= (others => '1');
		sram_oe_n_o			: out   std_logic								:= '1';

		-- PS2
		ps2_clk_io			: inout std_logic								:= 'Z';
		ps2_data_io			: inout std_logic								:= 'Z';
		ps2_mouse_clk_io  : inout std_logic								:= 'Z';
		ps2_mouse_data_io : inout std_logic								:= 'Z';

		-- SD Card
		sd_cs_n_o			: out   std_logic								:= '1';
		sd_sclk_o			: out   std_logic								:= '0';
		sd_mosi_o			: out   std_logic								:= '0';
		sd_miso_i			: in    std_logic;

		-- Joystick
		joy1_up_i			: in    std_logic;
		joy1_down_i			: in    std_logic;
		joy1_left_i			: in    std_logic;
		joy1_right_i		: in    std_logic;
		joy1_p6_i			: in    std_logic;
		joy1_p7_o			: out   std_logic								:= '1';
		joy1_p9_i			: in    std_logic;
		joy2_up_i			: in    std_logic;
		joy2_down_i			: in    std_logic;
		joy2_left_i			: in    std_logic;
		joy2_right_i		: in    std_logic;
		joy2_p6_i			: in    std_logic;
		joy2_p7_o			: out   std_logic								:= '1';
		joy2_p9_i			: in    std_logic;

		-- Audio
		dac_l_o				: out   std_logic								:= '0';
		dac_r_o				: out   std_logic								:= '0';
		ear_i					: in    std_logic;
		mic_o					: out   std_logic								:= '0';

		-- VGA
		vga_r_o				: out   std_logic_vector(2 downto 0)	:= (others => '0');
		vga_g_o				: out   std_logic_vector(2 downto 0)	:= (others => '0');
		vga_b_o				: out   std_logic_vector(2 downto 0)	:= (others => '0');
		vga_hsync_n_o		: out   std_logic								:= '1';
		vga_vsync_n_o		: out   std_logic								:= '1';

		-- HDMI
--		hdmi_d_o				: out   std_logic_vector(2 downto 0)	:= (others => '0');
--		hdmi_clk_o			: out   std_logic								:= '0';
--		hdmi_cec_o			: out   std_logic								:= '0';

		-- Debug
		leds_n_o				: out   std_logic_vector(7 downto 0)	:= (others => '1')
		
		
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

	signal a2601_ram_a				: std_logic_vector(13 downto 0);	
	signal a2601_ram_dout			: std_logic_vector(7 downto 0);
	
	signal port_243b : std_logic_vector(7 downto 0);

	-- A2601
	signal audio: std_logic := '0';	
	signal A2601_reset: std_logic := '0';
	signal p_l: std_logic := '0';
	signal p_r: std_logic := '0';
	signal p_a: std_logic := '0';
	signal p_u: std_logic := '0';
	signal p_d: std_logic := '0';
	signal p2_l: std_logic := '0';
	signal p2_r: std_logic := '0';
	signal p2_a: std_logic := '0';
	signal p2_u: std_logic := '0';
	signal p2_d: std_logic := '0';
	signal p_s: std_logic := '0';
	signal p_bs: std_logic;
	signal LED: std_logic_vector(2 downto 0);
	signal I_SW : std_logic_vector(2 downto 0) := (others => '0');
	
	signal cart_a: std_logic_vector(13 downto 0);
	signal cart_d : std_logic_vector(7 downto 0);
	
	
	--rgb
	signal rgb_loader_out			: std_logic_vector(7 downto 0);
	signal rgb_atari_out				: std_logic_vector(7 downto 0);
	
	signal hsync_loader_out			: std_logic;
	signal vsync_loader_out			: std_logic;
	
	signal hsync_atari_out			: std_logic;
	signal vsync_atari_out			: std_logic;
	
	signal bs_method			 		: std_logic_vector(7 downto 0);
	
	-- PS/2
	signal keyb_data_s 			: std_logic_vector(7 downto 0);
	signal keyb_valid_s 			: std_logic;
	signal clk_keyb : std_logic;
	
	signal joy_l_s			: std_logic;
	signal joy_r_s			: std_logic;
	
	-- HDMI
	
	signal clk_pixel, clk_pixel_shift: std_logic;
		signal vga_hsync_n_s		: std_logic;
	signal vga_vsync_n_s		: std_logic;
	signal vga_blank_s		: std_logic;
	signal sound_hdmi_s		: std_logic_vector(15 downto 0);
	signal tdms_s				: std_logic_vector( 7 downto 0);
		signal vga_col_s			: std_logic_vector( 3 downto 0);
		
		signal loader_hor_s: std_logic_vector( 8 downto 0);
		signal loader_ver_s: std_logic_vector( 8 downto 0);
		signal cnt_hor_s 				: std_logic_vector(8 downto 0);
	signal cnt_ver_s 				: std_logic_vector(8 downto 0);
	  
		
begin

	DB1: entity work.debounce 
		generic map
		(
			counter_size_g	 => 13
		)
		port map(
			clk_i				=> clk_pixel,
			button_i			=> not joy1_left_i,
			result_o			=>joy_l_s
		);
	
	DB2: entity work.debounce 
		generic map
		(
			counter_size_g	 => 13
		)
		port map(
			clk_i				=> clk_pixel,
			button_i			=> not joy1_right_i,
			result_o			=> joy_r_s
		);
		
	
	
--	process(joy_l_s)
--		begin
--			if rising_edge (joy_l_s) then
--				write_mem_s <= not write_mem_s;
--			end if;
--	end process;

 	ps2 : work.ps2_intf port map 
	(
		clk_keyb,
		reset_n,
		ps2_clk_io,
		ps2_data_io,
		keyb_data_s,
		keyb_valid_s,
		open
	);
	
	clk_keyb <= clk_pixel;-- when A2601_reset = '1' else vid_clk;

	-- 28 MHz master clock
	pll: work.pll1 port map (
		areset		=> pll_reset,				-- PLL Reset
		inclk0		=> clock_50_i,				-- Clock 50 MHz externo
		c0				=> sysclk,		
		c1				=> vid_clk,
		c2				=> clk_28,	
		c3				=> clk_pixel,       		--  25 MHz		
		c4				=> clk_pixel_shift, 		-- 125 MHz		
		locked		=> pll_locked				-- Sinal de travamento (1 = PLL travado e pronto)
	);
	
	pll_reset	<= '1' when btn_n_i(3) = '0' and btn_n_i(4) = '0' else '0';
	reset_n		<= not (pll_reset or not pll_locked);	-- System is reset by external reset switch or PLL being out of lock
	
	loader : work.speccy48_top port map 
	(
		
		clk_28   	=> clk_pixel,
		reset_n_i 	=> reset_n,
	
		VGA_R(3 downto 1) => rgb_loader_out (7 downto 5),    
		VGA_G(3 downto 1) => rgb_loader_out (4 downto 2),    
		VGA_B(3 downto 2) => rgb_loader_out (1 downto 0),   
		VGA_HS         	=> hsync_loader_out,  
		VGA_VS         	=> vsync_loader_out,   
		--VGA_BLANK			=> blank_ula_s,

		-- PS/2 Keyboar   -- PS/2 Ke
		keyb_data      => keyb_data_s, 
		keyb_valid     => keyb_valid_s,   
   
		SRAM_ADDR      => loader_ram_a,
		FROM_SRAM      => loader_from_sram,
		TO_SRAM       	=> loader_to_sram,
		SRAM_CE_N      => loader_ram_cs,
		SRAM_OE_N      => loader_ram_oe,
		SRAM_WE_N      => loader_ram_we ,
                  		  
		SD_nCS         => sd_cs_n_o,
		SD_MOSI        => sd_mosi_o, 
		SD_SCLK        => sd_sclk_o, 
		SD_MISO        => sd_miso_i,
		
		PORT_243B 		=> port_243b,
		
		joystick       => "000" & not joy1_p6_i &  not joy1_up_i &  not joy1_down_i & not joy1_left_i & not joy1_right_i,
		
		cnt_h_o      => loader_hor_s,
		cnt_v_o      => loader_ver_s
		
	);
	
	sram_addr_o   <= "0" & ram_a;
	sram_data_io  <= to_sram(7 downto 0) when ram_we = '0' else (others=>'Z');
	from_sram(7 downto 0) 	  <= sram_data_io;
	sram_ce_n_o(0)<= ram_cs;
   sram_oe_n_o   <= ram_oe;
	sram_we_n_o   <= ram_we;


--cartridge

--	Inst_cart_rom: entity work.cart_enduro PORT MAP(
--		clock => CLOCK_50,
--		q => cart_d,
--		address => cart_a	
--	);	



		
	process(port_243b)
	begin
		if port_243b(7) = '1' then --magic bit to start 
			
			
			
		else
			
			--LOADER
			
			bs_method <= '0' & port_243b(6 downto 0);

			ram_a				<= loader_ram_a;
			
			to_sram			<= loader_to_sram;
			loader_from_sram <= from_sram;
			
			ram_cs			<= loader_ram_cs;
			ram_oe			<= loader_ram_oe;
			ram_we			<= loader_ram_we;
			
		--	vga_r_o  <= rgb_loader_out (7 downto 5);
	--		vga_g_o  <= rgb_loader_out (4 downto 2);
		--	vga_b_o  <= rgb_loader_out (1 downto 0) & rgb_loader_out (0);
		--	vga_hsync_n_o <= hsync_loader_out;
		--	vga_vsync_n_o <= vsync_loader_out;
			
			cnt_hor_s <= loader_hor_s;
			cnt_ver_s <= loader_ver_s;
			
			sound_hdmi_s <=(others=>'0');
	
			
		end if;
	end process;
	
	-- VGA framebuffer
	vga: entity work.vga
	port map (
		I_CLK			=> clk_pixel,
		I_CLK_VGA	=> clk_pixel,
		I_COLOR		=> "0" & rgb_loader_out(7)& rgb_loader_out(4)& rgb_loader_out(1),
		I_HCNT		=> cnt_hor_s,
		I_VCNT		=> cnt_ver_s,
		O_HSYNC		=> vga_hsync_n_s,
		O_VSYNC		=> vga_vsync_n_s,
		O_COLOR		=> vga_col_s,
		O_HCNT		=> open,
		O_VCNT		=> open,
		O_H			=> open,
		O_BLANK		=> vga_blank_s
	);
	
		-- HDMI
	inst_dvid: entity work.hdmi
	generic map (
		FREQ	=> 25200000,	-- pixel clock frequency 
		FS		=> 48000,		-- audio sample rate - should be 32000, 41000 or 48000 = 48KHz
		CTS	=> 25200,		-- CTS = Freq(pixclk) * N / (128 * Fs)
		N		=> 6144			-- N = 128 * Fs /1000,  128 * Fs /1500 <= N <= 128 * Fs /300 (Check HDMI spec 7.2 for details)
	) 
	port map (
		I_CLK_VGA		=> clk_pixel,
		I_CLK_TMDS		=> clk_pixel_shift,
		I_RED				=> vga_col_s(2) & vga_col_s(2) & vga_col_s(2) & vga_col_s(2) & vga_col_s(2) & vga_col_s(2)& vga_col_s(2) & vga_col_s(2),
		I_GREEN			=> vga_col_s(1) & vga_col_s(1) & vga_col_s(1) & vga_col_s(1) & vga_col_s(1) & vga_col_s(1)& vga_col_s(1) & vga_col_s(1),
		I_BLUE			=> vga_col_s(0) & vga_col_s(0) & vga_col_s(0) & vga_col_s(0) & vga_col_s(0) & vga_col_s(0)& vga_col_s(0) & vga_col_s(0),
		I_BLANK			=> vga_blank_s,
		I_HSYNC			=> vga_hsync_n_s,
		I_VSYNC			=> vga_vsync_n_s,
		I_AUDIO_PCM_L 	=> sound_hdmi_s,
		I_AUDIO_PCM_R	=> sound_hdmi_s,
		O_TMDS			=> tdms_s
	);
	 
G_hdmi : if out_HDMI generate
	vga_hsync_n_o	<= tdms_s(7);	-- 2+		10
	vga_vsync_n_o	<= tdms_s(6);	-- 2-		11
	vga_b_o(2)		<= tdms_s(5);	-- 1+		144	
	vga_b_o(1)		<= tdms_s(4);	-- 1-		143
	vga_r_o(0)		<= tdms_s(3);	-- 0+		133
	vga_g_o(2)		<= tdms_s(2);	-- 0-		132
	vga_r_o(1)		<= tdms_s(1);	-- CLK+	113
	vga_r_o(2)		<= tdms_s(0);	-- CLK-	112
end generate; 

	
end architecture;
