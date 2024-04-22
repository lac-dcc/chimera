library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sms is
	generic (
		hdmi_output_g	: boolean	:= false
	);
	port (
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
		joy1_p6_i			: inout    std_logic;
		joy1_p7_o			: out   std_logic								:= '1';
		joy1_p9_i			: in    std_logic;
		joy2_up_i			: in    std_logic;
		joy2_down_i			: in    std_logic;
		joy2_left_i			: in    std_logic;
		joy2_right_i		: in    std_logic;
		joy2_p6_i			: inout    std_logic;
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

		-- Debug
		leds_n_o				: out   std_logic_vector(7 downto 0)	:= (others => '1')
		);
end sms;

architecture Behavioral of sms is


	component system is
	port (
		clk_cpu:		in		STD_LOGIC;
		clk_vdp:		in		STD_LOGIC;
		
		ram_we_n:	out	STD_LOGIC;
		ram_a:		out	STD_LOGIC_VECTOR(18 downto 0);
		ram_d:		inout	STD_LOGIC_VECTOR(7 downto 0);

		j1_up:		in		STD_LOGIC;
		j1_down:		in		STD_LOGIC;
		j1_left:		in		STD_LOGIC;
		j1_right:	in		STD_LOGIC;
		j1_tl:		in		STD_LOGIC;
		j1_tr:		inout	STD_LOGIC;
		j2_up:		in		STD_LOGIC;
		j2_down:		in		STD_LOGIC;
		j2_left:		in		STD_LOGIC;
		j2_right:	in		STD_LOGIC;
		j2_tl:		in		STD_LOGIC;
		j2_tr:		inout	STD_LOGIC;
		reset:		in		STD_LOGIC;
		pause:		in		STD_LOGIC;

		x:				in		UNSIGNED(8 downto 0);
		y:				in		UNSIGNED(7 downto 0);
--		vblank:		in		STD_LOGIC;
--		hblank:		in		STD_LOGIC;
		color:		out	STD_LOGIC_VECTOR(5 downto 0);
		--audio:		out	STD_LOGIC;
		pcm_o:	   out   std_logic_vector(5 downto 0);
		
      ps2_clk: 	in    std_logic;
      ps2_data: 	in    std_logic;	

		scanSW:		out	std_logic;

		spi_do:		in		STD_LOGIC;
		spi_sclk:	out	STD_LOGIC;
		spi_di:		out	STD_LOGIC;
		spi_cs_n:	buffer	STD_LOGIC;
		HardReset_n_i:		in		STD_LOGIC;
		dbg_o : out STD_LOGIC_VECTOR(7 downto 0)
		
);
	end component;
	
	component rgb_video is
	port (
		clk16:		in  	std_logic;
		clk8:			in  	std_logic; --Q
		x: 			out 	unsigned(8 downto 0);
		y:				out 	unsigned(7 downto 0);
		vblank:		out 	std_logic;
		hblank:		out 	std_logic;
		color:		in  	std_logic_vector(5 downto 0);
		hsync:		out 	std_logic;
		vsync:		out 	std_logic;
		red:			out 	std_logic_vector(2 downto 0);
		green:		out 	std_logic_vector(2 downto 0);
		blue:			out 	std_logic_vector(2 downto 0)
--		; blank:		out 	std_logic
);
	end component;
	

	
	signal clk_cpu:		std_logic;
	signal clk16:			std_logic;
	signal clk8:			std_logic;
	signal clk_vga:		std_logic;
	signal clk_dvi:		std_logic;
		
	signal sel_pclock:	std_logic;
	signal blank:			std_logic;
	signal blankr:			std_logic;
	
	signal x:				unsigned(8 downto 0);
	signal y:				unsigned(7 downto 0);
	signal vblank:			std_logic;
	signal hblank:			std_logic;
	signal color:			std_logic_vector(5 downto 0);
	signal audio:			std_logic;
	
	signal vga_hsync:		std_logic;
	signal vga_vsync:		std_logic;
	signal vga_red:		std_logic_vector(2 downto 0);
	signal vga_green:		std_logic_vector(2 downto 0);
	signal vga_blue:		std_logic_vector(2 downto 0);
	signal vga_x:			unsigned(8 downto 0);
	signal vga_y:			unsigned(7 downto 0);
	signal vga_blank:		std_logic;
	
	signal rgb_hsync:		std_logic;
	signal rgb_vsync:		std_logic;
	signal rgb_red:		std_logic_vector(2 downto 0);
	signal rgb_green:		std_logic_vector(2 downto 0);
	signal rgb_blue:		std_logic_vector(2 downto 0);
	signal rgb_x:			unsigned(8 downto 0);
	signal rgb_y:			unsigned(7 downto 0);
	signal rgb_vblank:	std_logic;
	signal rgb_hblank:	std_logic;	
	
	signal rgb_clk:		std_logic;
	
	signal scanSWk:		std_logic;
	signal scanSW:			std_logic;
	
	signal pcm_s : 	std_logic_vector(5 downto 0);
	
	signal j2_tr:			std_logic;
	
	signal c0, c1, c2 : 	std_logic_vector(9 downto 0);	--hdmi
	
	signal poweron_reset:	unsigned(7 downto 0) := "00000000";
	signal scandoubler_ctrl: std_logic_vector(1 downto 0);
	signal ram_we_n: std_logic;
	signal ram_a:	std_logic_vector(18 downto 0);
	
	signal spi_cs_n :			std_logic;
	
	signal dbg_s : std_logic_vector(7 downto 0);
	
	-- HDMI
	signal tmds_s : std_logic_vector(7 downto 0);
	
	-- scanlines
	signal scanlines_en_s		: std_logic := '0';
	signal btn_scan_s				: std_logic;
	signal odd_line_s				: std_logic := '0';
	signal vga_out_s 		: std_logic_vector(7 downto 0);
	
	signal btn_pause_s				: std_logic;
	signal btn_hard_s				: std_logic;
	
begin

--	clock_inst: clock
--	port map (
--		clk_in		=> clk,
--		sel_pclock  => sel_pclock,
--		clk_cpu		=> clk_cpu,
--		clk16			=> clk16,
--		clk8			=> clk8, --clk32 => open
--		clk32			=> clk32,
--		pclock		=> rgb_clk);

	pll1: entity work.pll
	port map(
		inclk0	=> clock_50_i,
		c0 => clk16,
		c1 => clk8,
		c2 => clk_vga,
		c3 => clk_cpu,
		c4 => clk_dvi
	);
		
	video_inst: rgb_video
	port map (
		clk16			=> clk16, 
		clk8			=> clk8, --Q
		x	 			=> rgb_x,
		y				=> rgb_y,
		vblank		=> rgb_vblank,
		hblank		=> rgb_hblank,
		color			=> color,		
		hsync			=> rgb_hsync,
		vsync			=> rgb_vsync,
		red			=> rgb_red, 
		green			=> rgb_green, 
		blue			=> rgb_blue 
--		,blank		=> blankr
	);
	
	video_vga_inst: entity work.vga_video --vga
	port map (
		clk16			=> clk16, --clk16
	--	dither		=> '0',
		x	 			=> vga_x,
		y				=> vga_y,
		vblank		=> open,
		hblank		=> open,
		color			=> color,		
		hsync			=> vga_hsync,
		vsync			=> vga_vsync,
		red			=> vga_red(2 downto 0), 
		green			=> vga_green(2 downto 0), 
		blue			=> vga_blue(2 downto 0), 
		blank			=> vga_blank
	);	
		
	system_inst: system
	port map (
		clk_cpu		=> clk_cpu,
		clk_vdp		=> clk16,--rgb_clk,	--clk8 = rgb  --clk16 = vga
		
		ram_we_n		=> sram_we_n_o,
		ram_a			=> sram_addr_o,
		ram_d			=> sram_data_io,

		j1_up			=> joy1_up_i,
		j1_down		=> joy1_down_i,
		j1_left		=> joy1_left_i,
		j1_right		=> joy1_right_i,
		j1_tl			=> joy1_p9_i,
		j1_tr			=> joy1_p6_i,
		j2_up			=> joy2_up_i,
		j2_down		=> joy2_down_i,
		j2_left		=> joy2_left_i,
		j2_right		=> joy2_right_i,
		j2_tl			=> joy2_p9_i,
		j2_tr			=> joy2_p6_i,
		reset			=> btn_n_i(3),
		pause			=> btn_pause_s,

		x				=> x,
		y				=> y,
--		vblank		=> vblank,
--		hblank		=> hblank,
		color			=> color,
	--	audio			=> audio,
		pcm_o			=> pcm_s,
		
		ps2_clk		=> ps2_clk_io,
		ps2_data		=> ps2_data_io,
		
		scanSW		=> scanSWk,

		spi_do		=> sd_miso_i,
		spi_sclk		=> sd_sclk_o,
		spi_di		=> sd_mosi_o,
		spi_cs_n		=> spi_cs_n,
		
		HardReset_n_i => btn_hard_s,
		
		dbg_o => dbg_s
		);
		
		sram_oe_n_o <= '0';
		sram_ce_n_o <= "00";
		
		sd_cs_n_o <= spi_cs_n;
		
		leds_n_o(6 downto 0) <= dbg_s(6 downto 0);
	
		leds_n_o(7) <= not spi_cs_n; --Q
	
	
	
	
	
	
	
		inst_dac: work.dac
		port map 
		(
			clk		=> clk_cpu, --clk32
			input		=> pcm_s,
			output	=> audio
		);
		
	dac_l_o <= audio;
	dac_r_o <= audio;
	
	
	
	
	
	
	
--	led <= scandoubler_ctrl(0); --debug scandblctrl reg.

	
	
--	NTSC <= '0';
--	PAL <= '1';	
	
	---- scandlbctrl register detection for video mode initialization at start ----
	
--	process (clk_cpu)
--	begin
--		if rising_edge(clk_cpu) then
--        if (poweron_reset < 126) then
--            scandoubler_ctrl <= ram_d(1 downto 0);
--		  end if;
--		  if poweron_reset < 254 then
--				poweron_reset <= poweron_reset + 1;
--		  end if;
--		end if;
--	end process;
	

--	sram_a <= "0001000111111010101" when poweron_reset < 254 else ram_a; --0x8FD5 SRAM (SCANDBLCTRL REG)
--	sram_we_n <= '1' when poweron_reset < 254 else ram_we_n;
	
	-------------------------------------------------------------------------------
	
	
	
--	vblank <= vga_vblank when scanSW='1' else rgb_vblank;
--	hblank <= vga_hblank when scanSW='1' else rgb_hblank;

	x <= vga_x when scanSW='1'	else rgb_x;
	y <= vga_y when scanSW='1'	else rgb_y;	
	
	sel_pclock <= '1' when scanSW='1' else '0';
	
--	scanSW <= scandoubler_ctrl(0) xor scanSWk; -- Video mode change via ScrollLock / SCANDBLCTRL reg.

	scanSW <= '1';
	


--HDMI

--Inst_MinimalDVID_encoder: MinimalDVID_encoder PORT MAP(
--      clk    => clk32,
--      blank  => blank,
--      hsync  => hsync,
--      vsync  => vsync,
--      red    => red,
--      green  => green,
--      blue   => blue,
--      hdmi_p => hdmi_out_p,
--      hdmi_n => hdmi_out_n
--   );

	uh: if hdmi_output_g generate
			-- HDMI
		inst_dvid: entity work.hdmi
		generic map (
			FREQ	=> 32000000,	-- pixel clock frequency 
			FS		=> 48000,		-- audio sample rate - should be 32000, 41000 or 48000 = 48KHz
			CTS	=> 32000,		-- CTS = Freq(pixclk) * N / (128 * Fs)
			N		=> 6144			-- N = 128 * Fs /1000,  128 * Fs /1500 <= N <= 128 * Fs /300 (Check HDMI spec 7.2 for details)
		) 
		port map (
			I_CLK_VGA		=> clk_vga,
			I_CLK_TMDS		=> clk_dvi,
			
			I_RED				=> vga_out_s(7 downto 5) & vga_out_s(7 downto 5) & vga_out_s(7 downto 6),
			I_GREEN			=> vga_out_s(4 downto 2) & vga_out_s(4 downto 2) & vga_out_s(4 downto 3),
			I_BLUE			=> vga_out_s(1 downto 0) & vga_out_s(1 downto 0) & vga_out_s(1 downto 0) & vga_out_s(1 downto 0),
			
			I_BLANK			=> vga_blank,
			I_HSYNC			=> vga_hsync,
			I_VSYNC			=> vga_vsync,
			I_AUDIO_PCM_L 	=> "0" & pcm_s & "000000000",
			I_AUDIO_PCM_R	=> "0" & pcm_s & "000000000",
			O_TMDS			=> tmds_s
		);
		

		vga_hsync_n_o	<= tmds_s(7);	-- 2+		10
		vga_vsync_n_o	<= tmds_s(6);	-- 2-		11
		vga_b_o(2)		<= tmds_s(5);	-- 1+		144	
		vga_b_o(1)		<= tmds_s(4);	-- 1-		143
		vga_r_o(0)		<= tmds_s(3);	-- 0+		133
		vga_g_o(2)		<= tmds_s(2);	-- 0-		132
		vga_r_o(1)		<= tmds_s(1);	-- CLK+	113
		vga_r_o(2)		<= tmds_s(0);	-- CLK-	112
	end generate;


	nuh: if not hdmi_output_g generate
		vga_vsync_n_o 	<= vga_vsync 										when scanSW='1'	else rgb_vsync;
		vga_hsync_n_o 	<= vga_hsync 										when scanSW='1' 	else rgb_hsync;
		vga_r_o 			<= vga_out_s(7 downto 5) 						when scanSW='1' 	else rgb_red;
		vga_g_o 			<= vga_out_s(4 downto 2) 						when scanSW='1' 	else rgb_green;
		vga_b_o 			<= vga_out_s(1 downto 0) & vga_out_s(0) 	when scanSW='1' 	else rgb_blue;
	end generate;
	
	
	
	
	btnpause: entity work.debounce
	generic map (
		counter_size_g	=> 16
	)
	port map (
		clk_i				=> clk16,
		button_i			=> btn_n_i(4),
		result_o			=> btn_pause_s
	);
	
	
	btnhard: entity work.debounce
	generic map (
		counter_size_g	=> 16
	)
	port map (
		clk_i				=> clk16,
		button_i			=> btn_n_i(3) or btn_n_i(4),
		result_o			=> btn_hard_s
	);
	
	---------------------------------
	-- scanlines
	btnscl: entity work.debounce
	generic map (
		counter_size_g	=> 16
	)
	port map (
		clk_i				=> clk16,
		button_i			=> btn_n_i(1) or btn_n_i(2),
		result_o			=> btn_scan_s
	);
	
	
	process (btn_scan_s)
	begin
		if falling_edge(btn_scan_s) then
			scanlines_en_s <= not scanlines_en_s;
		end if;
	end process;
	
	
	vga_out_s <= '0' & vga_red(1 downto 0) & '0' & vga_green(1 downto 0)& '0' & vga_blue(1) when scanlines_en_s = '1' and odd_line_s = '1' else vga_red(2 downto 0) & vga_green(2 downto 0)& vga_blue(2 downto 1);
	
	
	
	process(vga_hsync,vga_vsync)
	begin
		if vga_vsync = '0' then
			odd_line_s <= '0';
		elsif rising_edge(vga_hsync) then
			odd_line_s <= not odd_line_s;
		end if;
	end process;
      		
	
end Behavioral;
