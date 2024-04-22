--
-- Terasic DE1 top-level
--

-- altera message_off 10540

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Generic top-level entity for Altera DE1 board
entity speccy48_top is
	port (
	
		clk_28       : in    std_logic;
		reset_n_i   : in    std_logic;
		
		 
		-- VGA
		VGA_R          : out   std_logic_vector(3 downto 0)		:= (others => '1');
		VGA_G          : out   std_logic_vector(3 downto 0)		:= (others => '1');
		VGA_B          : out   std_logic_vector(3 downto 0)		:= (others => '1');
		VGA_HS         : out   std_logic									:= '1';
		VGA_VS         : out   std_logic									:= '1';
		VGA_BLANK 		: out   std_logic									:= '0';
		         
	
		-- PS/2 Keyboard
		keyb_data      : in std_logic_vector(7 downto 0);
		keyb_valid     : in std_logic;

	

		-- SRAM
		SRAM_ADDR      : out   std_logic_vector(18 downto 0)		:= (others => '1');
		FROM_SRAM      : in std_logic_vector(15 downto 0)			:= (others => '1');
		TO_SRAM        : out std_logic_vector(15 downto 0)			:= (others => '1');
		SRAM_CE_N      : out   std_logic									:= '1';
		SRAM_OE_N      : out   std_logic									:= '1';
		SRAM_WE_N      : out   std_logic									:= '1';

		
		-- SD card (SPI mode)
		SD_nCS         : out   std_logic									:= '1';
		SD_MOSI        : out   std_logic									:= '1';
		SD_SCLK        : out   std_logic									:= '1';
		SD_MISO        : in    std_logic;
		oFlash_cs_n			: out std_logic;
		iFlash_miso			: in  std_logic;
		
		PORT_243B      : out   std_logic_vector(7 downto 0)		:= (others => '0');
		
		JOYSTICK       : in   std_logic_vector(7 downto 0)			:= (others => '0');
		
		cnt_h_o      	: out   std_logic_vector(8 downto 0)		:= (others => '0');
		cnt_v_o      	: out   std_logic_vector(8 downto 0)		:= (others => '0');
		
		iRS232_rx 		: in   std_logic;
		oRS232_tx 		: out  std_logic;
		
		port303B_o		: out   std_logic									:= '0'
		
		
	);
end entity;

architecture Behavior of speccy48_top is




	-------------
	-- ULA
	-------------
	component ula is
		port (
			clk14					:  in    std_logic;
			a						:  in    std_logic_vector(15 downto 0);
			din					:  in    std_logic_vector(7 downto 0);
			dout					:  out   std_logic_vector(7 downto 0);
			mreq_n				:  in    std_logic;
			iorq_n				:  in    std_logic;
			rd_n					:  in    std_logic;
			wr_n					:  in    std_logic;
			clkcpu				:  out   std_logic;
			msk_int_n			:  out   std_logic;
			va						:  out   std_logic_vector(13 downto 0);
			vramdout				:  in    std_logic_vector(7 downto 0);
			vramdin				:  out   std_logic_vector(7 downto 0);
			vramoe				:  out   std_logic;
			vramcs				:  out   std_logic;
			vramwe				:  out   std_logic;
			ear					:  in    std_logic;
			mic					:  out   std_logic;
			spk					:  out   std_logic;
			kbcolumns			:  in    std_logic_vector(4 downto 0);
			r						:  out   std_logic;
			g						:  out   std_logic;
			b						:  out   std_logic;
			i						:  out   std_logic;
			hsync					:  out   std_logic;
			vsync					:  out   std_logic;
			cnt_h_o				:  out   std_logic_vector(8 downto 0);
			cnt_v_o				:  out   std_logic_vector(8 downto 0)
		);
	end component;



	-------------
	-- Signals
	-------------



	-- Clock control
	signal clk_ram				: std_logic;		-- Clock   70 MHz para a SDRAM
	signal clk_psg				: std_logic;		-- Clock 1.75 MHz para o AY
	signal clk_cpu				: std_logic;		-- Clock  3.5 MHz para a CPU (contida pela ULA)
	signal clk_vid				: std_logic;		-- Clock   14 MHz para a ULA



	-- CPU signals
	signal cpu_clk				: std_logic;
	signal cpu_wait_n			: std_logic;									-- /WAIT
	signal cpu_irq_n			: std_logic;									-- /IRQ
	signal cpu_nmi_n			: std_logic;									-- /NMI
	signal cpu_busreq_n		: std_logic;									-- /BUSREQ
	signal cpu_m1_n			: std_logic;									-- /M1
	signal cpu_mreq_n			: std_logic;									-- /MREQ
	signal cpu_ioreq_n		: std_logic;									-- /IOREQ
	signal cpu_rd_n			: std_logic;									-- /RD
	signal cpu_wr_n			: std_logic;									-- /WR
	signal cpu_rfsh_n			: std_logic;									-- /REFRESH
	signal cpu_a				: std_logic_vector(15 downto 0);			-- A
	signal cpu_di				: std_logic_vector(7 downto 0);			-- D in
	signal cpu_do				: std_logic_vector(7 downto 0);			-- D out
	signal cpu_d				: std_logic_vector(7 downto 0);			-- D inout

	-- ULA
	signal ula_din				: std_logic_vector(7 downto 0);
	signal ula_dout			: std_logic_vector(7 downto 0);
	signal vram_a				: std_logic_vector(13 downto 0);
	signal vram_dout			: std_logic_vector(7 downto 0);
	signal vram_din			: std_logic_vector(7 downto 0);
	signal vram_oe				: std_logic;
	signal vram_cs				: std_logic;
	signal vram_we				: std_logic;
	signal ula_ear				: std_logic;
	signal ula_mic				: std_logic;
	signal ula_spk				: std_logic;
	signal ula_kbcolumns		: std_logic_vector(4 downto 0);
	signal ula_r				: std_logic;
	signal ula_g				: std_logic;
	signal ula_b				: std_logic;
	signal ula_i				: std_logic;
	signal ula_csync			: std_logic;
	signal ula_hsync			: std_logic;
	signal ula_vsync			: std_logic;

	-- Video and scandoubler
	--signal scandbl_en			: std_logic;
	signal rgb_comb			: std_logic_vector(7 downto 0);
	signal rgb_out				: std_logic_vector(7 downto 0);
	signal hsync_out			: std_logic;
	signal vsync_out			: std_logic;

	-- Memory buses
	signal rom_dout			: std_logic_vector(7 downto 0);
	signal ram_din				: std_logic_vector(7 downto 0);
	signal ram_dout			: std_logic_vector(7 downto 0);

	-- Memory and I/Os enables
	signal ram_cpu_addr     : std_logic_vector(18 downto 0);				-- Endereco absoluto da SDRAM
	signal iord_en				: std_logic;										-- Leitura em alguma porta de I/O
	signal iowr_en				: std_logic;										-- Escrita em alguma porta de I/O
	signal rom_en				: std_logic;										-- ROM acessada (somente leitura)
	signal ramalta_en			: std_logic;										-- RAM acessada (R/W)
	signal vram_en				: std_logic;										-- VRAM acessada na pÃ¡gina 1 (0x4000 a 0x5FFF)
	signal ula_en				: std_logic;										-- Porta 254 da ULA acessada
	signal psg_FFFD_en		: std_logic;										-- Acesso na porta FFFD (AY)
	signal psg_BFFD_en		: std_logic;										-- Acesso na porta BFFD (AY)
	
	signal port243B_wr_s		: std_logic;
	signal port243B_rd_s		: std_logic;
	
	-- Divmmc                                                               
    signal divmmc_no_automap        : std_logic := '0';                  -- 0 ativa a DivMMC          
    signal divmmc_en                : std_logic;                            
    signal divmmc_do                : std_logic_vector(7 downto 0);         
    signal divmmc_ram_en            : std_logic;                              -- Habilitar RAM
    signal divmmc_mapram            : std_logic;                            
    signal divmmc_conmem            : std_logic;                            
    signal divmmc_disable_nmi       : std_logic;                            
    signal divmmc_bank              : std_logic_vector(5 downto 0);         
    signal divmmc_map_00_rom        : std_logic;                              -- Mapear 0000 na ROM
    signal divmmc_map_00_ram3       : std_logic;                              -- Mapear 0000 na RAM banco 3
    signal divmmc_map_01_ram        : std_logic;                              -- Mapear 2000 na RAM banco 'divmmc_bank'
	 
	 signal sram_cpu_addr              : std_logic_vector(17 downto 0);         
        
    
    
    -- SPI
    signal spi_cs_n                 : std_logic;
	 signal sd_cs0_n                	: std_logic;
    signal spi_mosi                 : std_logic;
    signal spi_miso                 : std_logic;
    signal spi_sclk                 : std_logic;
	 
	 signal register_q : std_logic_vector(7 downto 0);         
	
	 signal sdbg_clk                 : std_logic;
    signal sdbg_data                 : std_logic;
	 
	signal signewdata, resetn : std_logic;
	signal dx, dy : std_logic_vector(8 downto 0);
	signal x, y 	: std_logic_vector(7 downto 0);
	signal hexdata : std_logic_vector(15 downto 0);
	signal reset : std_logic;
	

	signal joystick_s	: std_logic_vector(7 downto 0);
	signal joy_en        : std_logic := '0'; 
	
	signal reset_n		: std_logic := '1';
	signal reset_key_n_s		: std_logic := '1';
	
	signal cnt_h_s	: std_logic_vector(8 downto 0);
	signal cnt_v_s	: std_logic_vector(8 downto 0);
	
	-- UART
	signal port143B_wr_s				: std_logic; -- RX
	signal port143B_rd_s				: std_logic; -- RX
	signal port133B_wr_s				: std_logic; -- TX
	signal port133B_rd_s				: std_logic; -- TX

	signal uart_speed_s			: natural;
	signal uart_tx_start_s		: std_logic := '0';	
	signal uart_rx_finished_s	: std_logic := '0';	
	signal uart_rx_byte_s		: std_logic_vector(7 downto 0);	
	signal uart_tx_byte_s		: std_logic_vector(7 downto 0);
	signal fifo_next_byte_s		: std_logic_vector(7 downto 0);
	signal uart_rx_ready_s		: std_logic := '0';
	signal fifo_empty_s			: std_logic := '0';
	signal fifo_full_s			: std_logic := '0';
	signal uart_tx_active_s		: std_logic := '0';
	signal head_s					: unsigned(7 downto 0);
	
	signal uart_prescaler_s 	: std_logic_vector(13 downto 0) := "00000011110011"; -- 243 - vga 0 timing at 115.200
	
	signal port303B_wr_s : std_logic := '0';
 
begin

	reset_n <= reset_n_i and (reset_key_n_s or register_q(7)); --send the reset key only in the loader screen

	-- Clock enable logic
	clken: work.clocks port map (
		clk_28		=> clk_28,					-- Entrada clock 28 MHz do PLL
		nReset		=> reset_n,					-- Entrada sinal de reset
		clk_video	=> clk_vid,					-- Saida clock   14 MHz
		clk_psg		=> clk_psg					-- Saida assÃ­ncrona 1,75 MHz
	);
  
 -- CPU
	cpu: work.T80a port map (
		RESET_n		=> reset_n,					-- Entrada /RESET
		CLK_n			=> cpu_clk,					-- Entrada clock da CPU
		WAIT_n		=> cpu_wait_n,				-- Entrada /WAIT
		INT_n			=> cpu_irq_n,				-- Entrada /IRQ
		NMI_n			=> cpu_nmi_n,				-- Entrada /NMI
		BUSRQ_n		=> cpu_busreq_n,			-- Entrada /BUSREQ
		M1_n			=> cpu_m1_n,				-- Saida /M1
		MREQ_n		=> cpu_mreq_n,				-- Saida /MREQ
		IORQ_n		=> cpu_ioreq_n,			-- Saida /IOREQ
		RD_n			=> cpu_rd_n,				-- Saida /RD
		WR_n			=> cpu_wr_n,				-- Saida /WR
		RFSH_n		=> cpu_rfsh_n,				-- Saida /REFRESH
		HALT_n		=> open,						-- Saida /HALT
		BUSAK_n		=> open,						-- Saida /BUSACK
		A				=> cpu_a,					-- Barramento de endereco
		Din			=> cpu_di,
		Dout			=> cpu_do
	);
	cpu_wait_n   <= '1';
	cpu_nmi_n    <= '1';
--	cpu_nmi_n    <= not reset_n or  divmmc_disable_nmi;
	cpu_busreq_n <= '1';

		-------------
	-- DivMMC  --
	-------------
	mmc: entity work.divmmc
	port map (
		clock				=> cpu_clk,					-- Entrada do clock da CPU
		reset_n			=> reset_n,					-- Reset Power-on
		cpu_a				=> cpu_a,						-- Barramento de enderecos da CPU
		enable			=> divmmc_en,					-- Portas I/O foram selecionadas
		cpu_wr_n			=> cpu_wr_n,						-- Sinal de escrita da CPU
		cpu_rd_n			=> cpu_rd_n,						-- Sinal de leitura da CPU
		cpu_mreq_n		=> cpu_mreq_n,					-- CPU acessando memoria
		cpu_m1_n			=> cpu_m1_n,						-- /M1 da CPU
		di					=> cpu_do,						-- Barramento de dados de entrada
		do					=> divmmc_do,					-- Barramento de dados de saiÃ‚Â­da

		spi_cs			=> spi_cs_n,					-- Saida Chip Select para a flash
		sd_cs0			=> sd_cs0_n,					-- SaiÃ‚Â­da Chip Select para o cartao
		sd_sclk			=> spi_sclk,					-- Saida SCK
		sd_mosi			=> spi_mosi,					-- Master Out Slave In
		sd_miso			=> spi_miso,					-- Master In Slave Out
		
		no_automap		=> divmmc_no_automap,		-- Entrada para desabilitar o Auto Mapeamento -- 0 ativa a DivMMC
		disable_nmi		=> divmmc_disable_nmi,		-- Sinal para desabilitar NMI
		ram_bank			=> divmmc_bank,				-- SaiÃ‚Â­da informando qual banco de 8K da RAM deve mapear entre 2000 e 3FFF
		conmem			=> divmmc_conmem,				--	SaiÃ‚Â­da indicando que tem que fazer o mapeamento de 0000 a 3FFF na ROM e RAM da DivMMC
		mapram			=> divmmc_mapram				-- SaiÃ‚Â­da indicando que o banco 3 da RAM mapeia entre 0000 a 1FFF somente leitura
	);
	
	SD_SCLK  <= spi_sclk;
	SD_MOSI  <= spi_mosi;
--	spi_miso <= SD_MISO;
	spi_miso	<= iFlash_miso	when spi_cs_n = '0'	else SD_MISO;
	SD_nCS   <= sd_cs0_n;	
	oFlash_cs_n	<= spi_cs_n;
	
	joystick_s <= JOYSTICK;
	
	
	-- Keyboard
	kb: entity work.keyboard port map (
		CLK				=> clk_28,						-- Clock 28 MHz
		nRESET			=> reset_n,						-- Reset geral
		keyb_data		=> keyb_data,					
		keyb_valid		=> keyb_valid,						
		A					=> cpu_a,						-- CPU Address bus
		KEYB				=> ula_kbcolumns,				-- Column outputs to ULA
		reset_key_n_o	=> reset_key_n_s
		           
	);


	-- ULA
	ula1: ula port map(
		clk14					=> clk_vid,					-- Clock 14 MHz
		a						=> cpu_a,					-- Barramento de enderecos CPU
		din					=> ula_din,					-- Barramento de dados de entrada
		dout					=> ula_dout,				--	Barramento de dados de saida
		mreq_n				=> cpu_mreq_n,				-- /MREQ
		iorq_n				=> cpu_ioreq_n,			-- /IORQ
		rd_n					=> cpu_rd_n,				-- /RD
		wr_n					=> cpu_wr_n,				-- /WR
		clkcpu				=> clk_cpu,					-- Saida de clock para a CPU
		msk_int_n			=> cpu_irq_n,				-- Saida interrupcao vertical para a CPU
		va						=> vram_a,					-- Barramento de endereco da VRAM (13..0)
		vramdout				=> vram_dout,				-- Barramento de dados de entrada da VRAM
		vramdin				=> vram_din,				-- Barramento de dados de saida para VRAM
		vramoe				=> vram_oe,					-- /OE da VRAM
		vramcs				=> vram_cs,					-- /CS da VRAM
		vramwe				=> vram_we,					-- /WE da VRAM
		ear					=> ula_ear,					-- Entrada EAR
		mic					=> ula_mic,					-- Saida MIC
		spk					=> ula_spk,					-- Saida Speaker
		kbcolumns			=> ula_kbcolumns,			-- kbcolumns
		r						=> ula_r,					-- Saida R do RGBI
		g						=> ula_g,					-- Saida G do RGBI
		b						=> ula_b,					-- Saida B do RGBI
		i						=> ula_i,					-- Saida I do RGBI (Bright)
		hsync					=> ula_hsync,				-- Saida HSYNC
		vsync					=> ula_vsync,				-- Saida VSYNC
		cnt_h_o				=> cnt_h_s,
		cnt_v_o				=> cnt_v_s
	);
	
	cnt_h_o <= cnt_h_s;
	cnt_v_o <= cnt_v_s;


	




	
--	-- SRAM AS7C34096-12 (-15)
--	ram : entity work.dpSRAM_5128
--	port map(
--		clk				=> clk_28,
--		-- Porta 0 = VRAM
--		porta0_addr		=> "10000" & vram_a,
--		porta0_ce		=> vram_cs,
--		porta0_oe		=> vram_oe,
--		porta0_we		=> vram_we,
--		porta0_din		=> vram_din,
--		porta0_dout		=> vram_dout,
--		-- Porta 1 = Upper RAM
--		porta1_addr		=> ram_cpu_addr,
--		porta1_ce		=> (ramalta_en),,
--		porta1_oe		=> not cpu_rd_n,,
--		porta1_we		=> not cpu_wr_n,,
--		porta1_din		=> ram_din,
--		porta1_dout		=> ram_dout,
--		-- Outputs to SRAM on board
--		sram_addr		=> SRAM_ADDR,
--		sram_data		=> sram_data,
--		sram_ce_n		=> open,
--		sram_oe_n		=> sram_oe_n,
--		sram_we_n		=> sram_we_n
--	);

--	vram : work.spram
--	generic map
--	(
--		addr_width_g => 14
--	)
--	port map
--	(
--		clk_i		=> clk_28,
--		we_i		=> vram_we,
--		addr_i	=> vram_a,
--		data_i	=> vram_din,
--		data_o	=> vram_dout
--	);

 	ram : entity work.dpSRAM_25616
 		port map(
 			clk				=> clk_28,
 			-- Porta0 (VRAM)
 			porta0_addr		=> "10000" & vram_a,
 			porta0_ce		=> vram_cs,
 			porta0_oe		=> vram_oe,
 			porta0_we		=> vram_we,
 			porta0_din		=> vram_din,
 			porta0_dout		=> vram_dout,
 			-- Porta1 (Upper RAM)
 			porta1_addr		=> ram_cpu_addr,
 			porta1_ce		=> (ramalta_en),
 			porta1_oe		=> not cpu_rd_n,
 			porta1_we		=> not cpu_wr_n,
 			porta1_din		=> ram_din,
 			porta1_dout		=> ram_dout,
 			-- Outputs to SRAM on board
 			sram_addr		=> SRAM_ADDR,					-- SRAM on board address bus
 			from_sram		=> FROM_SRAM,					--	SRAM on board data bus
			to_sram			=> TO_SRAM,					--	SRAM on board data bus
 			sram_ub			=> open,					--	SRAM on board /UB
 			sram_lb			=> open,					--	SRAM on board /LB
 			sram_ce_n		=> SRAM_CE_N,					--	SRAM on board /CE
 			sram_oe_n		=> SRAM_OE_N,					--	SRAM on board /OE
 			sram_we_n		=> SRAM_WE_N					--	SRAM on board /WE
 		);
		
--- UART


	uart : entity work.uart
   port map 
 	( 
			--ticks_per_bit_i 		=> uart_speed_s,
			uart_prescaler_i		=> "00000011110011", -- 243 - 115.200 at 28.000.000
			clock_i       			=> clk_28, --iClk_3M5,			-- 3.5 mhz no contention
			TX_start_i     		=> uart_tx_start_s,			-- '1' to start the transmission
			TX_byte_i  				=> uart_tx_byte_s,     		-- byte to transmit
			TX_active_o 			=> uart_tx_active_s,		  	-- '1' during transmission
			TX_out_o 				=> oRs232_tx, 					-- TX line
			TX_byte_finished_o   => open,  	  					-- When complete, '1' for one clock cycle
			RX_in_i 					=> iRs232_rx,					-- RX line
			RX_byte_finished_o	=> uart_rx_finished_s, 		-- When complete, '1' for one clock cycle
			RX_byte_o   			=> uart_rx_byte_s				-- The incoming byte
 	);
	
	fifo : entity work.FIFO
	port map
	( 
		clock_i		=> clk_28,--iClk_3M5,	
		reset_i		=> not reset_n,
		fifo_we_i	=> uart_rx_finished_s,
		fifo_data_i	=> uart_rx_byte_s,
		fifo_read_i	=> port143B_rd_s,
		fifo_data_o	=> fifo_next_byte_s,
		fifo_empty_o=> fifo_empty_s,
		fifo_full_o	=> fifo_full_s, --1 when the FIFO is full
		fifo_head_o	=> open
	);

	

	-- UART
	process(reset_n, Clk_cpu, uart_rx_finished_s)
	variable rx_finished_v : std_logic_vector(1 downto 0);
	variable port143B_edge_v : std_logic_vector(1 downto 0);
	begin
	

		
		if reset_n = '0' then

				uart_speed_s <= 243; -- uart default speed 115200 at 28mhz
			
		elsif falling_edge(Clk_cpu) then
		
		
				if port143B_wr_s = '1' then -- A write on the RX port configures the UART pre-scaler (0x143b = 5179)
				
					--	if cpu_do(7) = '0' then
					--		uart_prescaler_s <= uart_prescaler_s(6 downto 0) & cpu_do(6 downto 0);
					--	else
					--		uart_prescaler_s <= cpu_do(6 downto 0) & uart_prescaler_s(6 downto 0);					
					--	end if;

				elsif port133B_wr_s = '1' then -- TX port 0x133b = 4923
						uart_tx_byte_s <= cpu_do;
						uart_tx_start_s <= '1'; -- '1' to start the transmission
				else
						uart_tx_start_s <= '0'; 
				end if;
				

		end if;
	end process;

	
	bootrom2 : entity work.bootrom
	port map (
		addr		=> cpu_a(13 downto 0),
		clk		=> clk_28,
		data		=> rom_dout
	);
	
	----------------
	-- Glue logic --
	----------------
	
	-- Register number
	process (reset_n, clk_cpu)
	begin
		if reset_n = '0' then
			register_q <= (others => '0');
		elsif falling_edge(clk_cpu) then
			if port243B_wr_s = '1' and cpu_wr_n = '0' then
				register_q <= cpu_do;
			end if;
		end if;
	end process;
	
	PORT_243B <= register_q;
	
	
	process (reset_n, clk_cpu, port303B_wr_s)
	begin
		if reset_n = '0' then
			port303B_o <= '0';
		elsif falling_edge(clk_cpu) then
			if port303B_wr_s = '1' then
				port303B_o <= cpu_do(0);
			end if;
		end if;
	end process;
	

	--LEDR(9)		<= reset_n;										-- Indica se esta em reset ou nao

	--scandbl_en			<= '0';--SW(7);

	-- Memory enables
	-- ROM is enabled between 0x0000 and 0x3fff except in +3 special mode
	rom_en			<= '1' when cpu_mreq_n = '0' and cpu_rd_n = '0' and cpu_a(15 downto 14) = "00"				else '0';	-- Ativa somente leitura para a ROM do speccy
	ramalta_en		<= '1' when cpu_mreq_n = '0'							and cpu_a(15) = '1'								else '0';	-- Acesso na pÃ¡gina 3 (0x8000 a 0xFFFF)
	vram_en			<= '1' when cpu_mreq_n = '0'							and cpu_a(15 downto 14) = "01"   			else '0';	-- Ativa leitura e escrita

	-- I/O Port enables
	iord_en        <= '1' when cpu_ioreq_n = '0' and cpu_m1_n = '1' and cpu_rd_n = '0'  else '0';					-- Leitura em alguma porta
	iowr_en        <= '1' when cpu_ioreq_n = '0' and cpu_m1_n = '1' and cpu_wr_n = '0'  else '0';					-- Escrita em alguma porta

	ula_en         <= '1' when iord_en = '1'     and cpu_a(0) = '0'														else '0'; -- Ativa somente leitura

	


	port243B_wr_s	<= '1' when iowr_en = '1' and cpu_a = X"243B"	else '0';
	port243B_rd_s	<= '1' when iord_en = '1' and cpu_a = X"243B"	else '0';
	
	port143B_wr_s	<= '1' when iowr_en = '1' and cpu_a = X"143B" 	else '0';	-- UART RX (W)
	port143B_rd_s	<= '1' when iord_en = '1' and cpu_a = X"143B" 	else '0';	-- UART RX (R)
	port133B_wr_s	<= '1' when iowr_en = '1' and cpu_a = X"133B" 	else '0';	-- UART TX (W)
	port133B_rd_s	<= '1' when iord_en = '1' and cpu_a = X"133B" 	else '0';	-- UART TX (R)
	
	port303B_wr_s	<= '1' when iowr_en = '1' and cpu_a = X"303B" 	else '0';	-- to STM32 reset

	joy_en 			<= '1' when iord_en = '1' and cpu_a = X"263B"	else '0'; -- kempston

	

	-- Mapa da RAM
	ram_cpu_addr <= "0001" & cpu_a(14 downto 0);	-- Acesso RAM alta do speccy (0x8000 a 0xFFFF)

		
	-- ConexÃµes dos barramentos
	ula_din  <= cpu_do;
	ram_din  <= cpu_do;
	cpu_di <= 
		rom_dout								when rom_en				= '1'	else		-- Leitura da ROM
		ula_dout								when vram_en			= '1'	else		-- Leitura da VRAM (controlado pela ULA)
		ula_dout								when ula_en				= '1'	else		-- Leitura da porta 254
		ram_dout								when ramalta_en		= '1'	else		-- Leitura da RAM alta
		divmmc_do							when divmmc_en      	= '1'	else		-- Leitura das portas da interface DivMMC
		register_q							when port243B_rd_s   = '1' else
		joystick_s							when joy_en			   = '1' else
		fifo_next_byte_s					when port143B_rd_s  	= '1' else		-- UART reading when character is present at FIFO
		"00000" & fifo_full_s &	 uart_tx_active_s & (not fifo_empty_s) when port133B_rd_s  = '1' 	else
		(others => 'Z');

	-- VGA ULA
	rgb_comb <=
		ula_r & (ula_i and ula_r) & (ula_i and ula_r) &
		ula_g & (ula_i and ula_g) & (ula_i and ula_g) &
		ula_b & (ula_i and ula_b);

	VGA_R  <= rgb_comb(7 downto 5) & rgb_comb(7);

	VGA_G  <= rgb_comb(4 downto 2) & rgb_comb(4);

	VGA_B  <= rgb_comb(1 downto 0) & rgb_comb(1 downto 0);

	VGA_HS <= ula_hsync;
	VGA_VS <= ula_vsync;

	--
	
	

	-- Verifica se existe acesso nas portas da DivMMC
	-- Aqui so monta a variavel "parcial" de leitura, que e completada nas verificacoes posteriores
	-- O teste e no acesso a porta E* (que mais abaixo filtra se e E7(231) ou E3(227)) e *F (que filtra em 1F(31) ou 3F(63))
    divmmc_en   <= '1' when (cpu_ioreq_n = '0' and cpu_m1_n = '1' and
                            (cpu_a(7 downto 4) = X"E" or cpu_a(4 downto 0) = "11111"))    else '0';                -- Leitura nas porta da DivMMC

	

	

	
	
	
	

	cpu_clk <= clk_cpu;


end architecture;
