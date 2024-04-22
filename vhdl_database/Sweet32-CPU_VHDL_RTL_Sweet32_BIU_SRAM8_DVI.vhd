-- ############# Sweet32 microprocessor - Bus Interface Unit #############
-- #######################################################################
-- ****************** FLEADUINO REV.B+ BUILD *************************
-- Module Name:		Sweet32_MCU.vhd
-- Module Version:	0.41
-- Module author:	Valentin Angelovski
-- Module date:		23/04/2015
-- Project IDE:		Lattice Diamond ver. 3.1.0.96
--
--------------------------------------------------------------------------------/
--
-- Copyright (C) 2014 Valentin Angelovski
--
-- This source file may be used and distributed without
-- restriction provided that this copyright statement is not
-- removed from the file and that any derivative work contains
-- the original copyright notice and the associated disclaimer.
--
-- This source file is free software; you can redistribute it
-- and/or modify it under the terms of the GNU Lesser General
-- Public License as published by the Free Software Foundation;
-- either version 2.1 of the License, or (at your option) any
-- later version.
--
-- This source is distributed in the hope that it will be
-- useful, but WITHOUT ANY WARRANTY; without even the implied
-- warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
-- PURPOSE. See the GNU Lesser General Public License for more
-- details.
--
-- You should have received a copy of the GNU Lesser General
-- Public License along with this source; if not, download it
-- from http://www.opencores.org/lgpl.shtml
--
----------------------------------------------------------------------------------/
--
--
-- Version release history
-- 26/09/2014 v0.41 (Revert back to original simple_UART.vhd, works better)
-- 14/09/2014 v0.1 (Initial beta pre-release)

-- Note: All sources included here are provided as-is without any warranties implied.
-- Use at your own risk!
--------------------------------------------------------------------------------/


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;


entity Sweet32_BIU_SRAM8_DVI is
	generic(
		SYS_CLOCK_HZ	: NATURAL;	-- e.g., 100_000_000 Hz for 100 Mhz
		BAUD_RATE		: NATURAL);	-- e.g., 115,200 baud
	port (
		clk				: in std_logic;
		reset_in		: in std_logic;
		Shield_reset	: inout std_logic;			
		
		clk_dvi			: in std_logic;
		clk_dvin		: in std_logic;
		vgaclk			: in std_logic;
 
		--video out
		LVDS_Red		: out std_logic;	
		LVDS_Green		: out std_logic;	
		LVDS_Blue		: out std_logic;
		LVDS_ck			: out std_logic;

		-- User output port
		USER_LED_outport		: out std_logic_vector(1 downto 0);
 
		--PWM output 
		PWM0_out		: out std_logic;
		PWM1_out		: out std_logic;

		--ADC input
		ADC0_Q_ouput	: BUFFER STD_LOGIC;	-- Sigma Delta ADC - Comparator result
		ADC0_D_input	: inout STD_LOGIC;		-- Sigma Delta ADC - RC circuit driver out
		ADC1_Q_ouput	: BUFFER STD_LOGIC;		-- Sigma Delta ADC - Comparator result
		ADC1_D_input	: inout STD_LOGIC;		-- Sigma Delta ADC - RC circuit driver out
		ADC2_Q_ouput	: BUFFER STD_LOGIC;		-- Sigma Delta ADC - Comparator result
		ADC2_D_input	: inout STD_LOGIC;		-- Sigma Delta ADC - RC circuit driver out
		ADC3_Q_ouput	: BUFFER STD_LOGIC;		-- Sigma Delta ADC - Comparator result
		ADC3_D_input	: inout STD_LOGIC;		-- Sigma Delta ADC - RC circuit driver out
		ADC4_Q_ouput	: BUFFER STD_LOGIC;		-- Sigma Delta ADC - Comparator result
		ADC4_D_input	: inout STD_LOGIC;		-- Sigma Delta ADC - RC circuit driver out
		ADC5_Q_ouput	: BUFFER STD_LOGIC;		-- Sigma Delta ADC - Comparator result
		ADC5_D_input	: inout STD_LOGIC;		-- Sigma Delta ADC - RC circuit driver out
		
		-- Parallel GPIO 
		GPIO_wordport	: inout std_logic_vector(15 downto 0);
		GPIO_pullup		: out std_logic_vector(15 downto 0);
		
		--External SRAM
		SRAM_Addr		: out		std_logic_vector(18 downto 0);	-- SRAM address bus
		SRAM_Data		: inout		std_logic_vector(7 downto 0);	-- data bus to/from SRAM
		SRAM_n_cs		: out		std_logic;
		SRAM_n_oe		: out		std_logic;
		SRAM_n_we		: out		std_logic;

		-- UART
		rxd				: in std_logic;
		txd				: out std_logic;
		  
		-- SPI1 (To on-board Flash ROM..)
		spi1_miso		: in std_logic;
		spi1_mosi		: out std_logic;
		spi1_clk		: out std_logic;
		spi1_cs			: out std_logic;
 
		-- PS/2 Keyboard			
		ps2k_clk_in : in std_logic;
		ps2k_dat_in : in std_logic;
		ps2k_clk_out : out std_logic;
		ps2k_dat_out : out std_logic 	
	
		);  
end entity;
 
architecture rtl of Sweet32_BIU_SRAM8_DVI is

-- System reset
signal reset				: std_logic := '0';
signal reset_counter		: unsigned(15 downto 0) := X"0000";
signal h_reset				: std_logic := '1';

-- System peripherals - GPIO alternate function select signals
signal spi_hostenable 		: std_logic;
signal UART0_enable 		: std_logic;
-- UART signals
signal ser_txdata			: std_logic_vector(7 downto 0);
signal ser_txready			: std_logic;
signal ser_rxdata			: std_logic_vector(7 downto 0);
signal ser_txgo				: std_logic;
signal ser_rxint			: std_logic;
signal ser_clock_divisor		: unsigned(15 downto 0)	:= to_unsigned((SYS_CLOCK_HZ / BAUD_RATE)-1, 16);
signal ser_clock_divisor_read	: unsigned(15 downto 0);
signal ser_clock_divisor_rst	: std_logic;

signal ser_rx_buff			: std_logic_vector(7 downto 0);
signal ser_rx_buff2			: std_logic_vector(7 downto 0);
signal ser_rx_buff_full		: std_logic;
signal ser_rx_buff_full2	: std_logic;
signal txd_buffer			: std_logic;
signal rxd_multiplexed		: std_logic;

-- Millisecond counter
signal timer0_upcounter		: unsigned(15 downto 0);
signal timer0_value			: unsigned(15 downto 0) := X"7000";
signal timer0_int			: std_logic;
signal timer0_overflow		: std_logic;
signal timer0_enable		: std_logic;
signal timer0_prescaler		: unsigned(1 downto 0);

-- PWM signals
signal PWM0_value			: unsigned (11 downto 0);
signal PWM1_value			: unsigned (11 downto 0);

-- GPIO signals
signal GPIO_direction		: std_logic_vector(15 downto 0);				
signal GPIO_outport			: std_logic_vector(15 downto 0);	
signal GPIO_pullenable		: std_logic_vector(15 downto 0);	

signal ADC_GPIO_direction	: std_logic_vector(5 downto 0);				
signal ADC_GPIO_outport		: std_logic_vector(5 downto 0);	

-- ADC signals
signal ADC0_result			: unsigned (10 downto 0);
signal ADC1_result			: unsigned (10 downto 0);
signal ADC2_result			: unsigned (10 downto 0);
signal ADC3_result			: unsigned (10 downto 0);
signal ADC4_result			: unsigned (10 downto 0);
signal ADC5_result			: unsigned (10 downto 0);
  
-- MCU signals
signal mem_busy				: std_logic;
signal mem_read				: std_logic_vector(15 downto 0);
signal mem_write			: std_logic_vector(15 downto 0);
signal mem_addr				: std_logic_vector(31 downto 0);
signal mem_writeEnable		: std_logic;
signal mem_writeEnableUB	: std_logic; 
signal mem_writeEnableLB	: std_logic; 
signal Bootrom_writeEnableUB: std_logic; 
signal Bootrom_writeEnableLB: std_logic; 
signal mem_readEnable		: std_logic;
signal bootrom_data_out		: std_logic_vector(15 downto 0);
signal bootrom_data_in		: std_logic_vector(15 downto 0);
signal soc_read_ack			: std_logic;
signal soc_write_ack		: std_logic;
signal bus_state			: unsigned(1 downto 0);
signal cpu_reset			: std_logic;
signal Sweet32_IRQ			: std_logic;
signal SRAM_byte_Address 	: std_logic_vector(18 downto 0);
 
-- VGA CRTC -> DVI connections 
signal R				: std_logic_vector(3 downto 0);
signal G				: std_logic_vector(3 downto 0);
signal B				: std_logic_vector(3 downto 0);

signal R_8				: std_logic_vector(7 downto 0);
signal G_8				: std_logic_vector(7 downto 0);
signal B_8				: std_logic_vector(7 downto 0);

signal hsync			: std_logic;
signal vsync			: std_logic;
signal blank			: std_logic;

-- VGA Color text
signal vgactrl_reg			: std_logic_vector(7 downto 0) := "11100000";
signal vgacurx_reg			: std_logic_vector(7 downto 0) := "00000000";
signal vgacury_reg			: std_logic_vector(7 downto 0) := "00000000";
signal vgaram_writeEnableUB: std_logic; 
signal vgaram_writeEnableLB: std_logic; 
signal vgaram_data_out		: std_logic_vector(15 downto 0);
signal vgaram_data_in		: std_logic_vector(15 downto 0);
--signal vgaram_vga_out		: std_logic_vector(15 downto 0);
signal TEXT_A      			: std_logic_vector(10 downto 0); -- text buffer addr
signal TEXT_D      			: std_logic_vector(07 downto 0); -- text char (bits 7 to 0)
signal COLOR_D      		: std_logic_vector(07 downto 0); -- text color (bits 15 to 8)
signal vgafont_writeEnableUB: std_logic; 
signal vgafont_writeEnableLB: std_logic; 
signal vgafont_data_out		: std_logic_vector(15 downto 0);
signal vgafont_data_in		: std_logic_vector(15 downto 0);
signal vgafont_vga_out		: std_logic_vector(15 downto 0);
signal FONT_A      			: std_logic_vector(10 downto 0); -- font buffer
signal FONT_D      			: std_logic_vector(07 downto 0);

signal cpu_cycle_counter	: unsigned(31 downto 0);



-- SRAM states 
type sram_states is (readb, writeb , writeb2, writeb3 , writeb4, writeb5 , idle);
signal sram_state : sram_states; 

-- SPI1 signals
signal host_to_spi1 : std_logic_vector(7 downto 0);
signal spi1_to_host : std_logic_vector(15 downto 0);
signal spi1_wide : std_logic;
signal spi1_trigger : std_logic;
signal spi1_busy : std_logic;

-- spi signals
signal host_to_spi : std_logic_vector(7 downto 0);
signal spi_to_host : std_logic_vector(15 downto 0);
signal spi_wide : std_logic;
signal spi_trigger : std_logic;
signal spi_busy : std_logic;
-- For SPI internal routing to parallel GPIO ports..
signal spi_miso : std_logic;
signal spi_mosi : std_logic;
signal spi_clk : std_logic;

 
-- SPI1 Clock counter
signal spi1_preset : unsigned(7 downto 0) := X"08";
signal spi1_tick : unsigned(7 downto 0);
signal spi1clk_in : std_logic;

-- spi Clock counter
signal spi_preset : unsigned(7 downto 0) := X"08";
signal spi_tick : unsigned(7 downto 0);
signal spiclk_in : std_logic;
 
 
-- PS/2 Keyboard port
signal kbdidle : std_logic;
signal kbdrecv : std_logic;
signal kbdrecvreg : std_logic; 
signal kbdsendbusy : std_logic;
signal kbdsendtrigger : std_logic;
signal kbdsenddone : std_logic;
signal kbdsendbyte : std_logic_vector(7 downto 0);
signal kbdrecvbyte : std_logic_vector(10 downto 0);

begin

-- Timer0 module - basically a simple up-counter with overflow output indication
process(timer0_prescaler(1), reset)
begin
	if reset='0'  then
		timer0_upcounter <= X"0000";
		timer0_int<='0';
	elsif rising_edge(timer0_prescaler(1)) then
		if timer0_enable = '1' then
			timer0_int<='0';
			timer0_upcounter<=timer0_upcounter+1;
			if timer0_upcounter= X"0000" then
				timer0_upcounter<=timer0_value+1;
				timer0_int<='1';
			end if;
		end if;
	end if;
end process;

-- Power-on Reset - Helps ensure a clean, reliable reset signal for the system
process(clk, reset_in)
begin
	if Shield_reset = '0' then -- or reset_in='0'then
		reset_counter<=X"FFFF";
		reset<='0';
	elsif rising_edge(clk) then
		reset_counter<=reset_counter-1;
		if reset_counter=X"0000" then
			reset<= '1';
		end if;
	end if;
end process;   

	Shield_reset <= 'Z' when reset_in = '1' else '0'; 

-- UART0 Asynchronous communication port

	myuart0 : entity work.simple_uart
		port map(
			clk => clk,
			reset => reset, -- active low
			txdata => ser_txdata,
			txready => ser_txready,
			txgo => ser_txgo,
			rxdata => ser_rxdata,
			rxint => ser_rxint,
			txint => open,
			clock_divisor => ser_clock_divisor,
			clock_divisor_read => ser_clock_divisor_read,
			clock_divisor_rst	=> ser_clock_divisor_rst,
			rxd => rxd_multiplexed,
			txd => txd_buffer 
		);

-- PWM-DAC channel #0
	PWM0 : entity work.simple_PWM
	port map(
		clk => clk,
		rst => reset,
		pwm_value => PWM0_value,
		PWM_Q => PWM0_out
	);

-- PWM-DAC channel #1
	PWM1 : entity work.simple_PWM 
	port map(
		clk => clk,
		rst => reset,
		pwm_value => PWM1_value,
		PWM_Q => PWM1_out
	);

-- ADC channel #0
	ADC0 : entity work.simple_ADC
	port map( 	clk => clk,	rst => reset, Sampler_Q => ADC0_Q_ouput, 
				Sampler_D => ADC0_D_input, adc_output => ADC0_result );
-- ADC channel #1
	ADC1 : entity work.simple_ADC
	port map( 	clk => clk,	rst => reset, Sampler_Q => ADC1_Q_ouput, 
				Sampler_D => ADC1_D_input, adc_output => ADC1_result );

-- ADC channel #2
	ADC2 : entity work.simple_ADC
	port map( 	clk => clk,	rst => reset, Sampler_Q => ADC2_Q_ouput, 
				Sampler_D => ADC2_D_input, adc_output => ADC2_result );
				
-- ADC channel #3
	ADC3 : entity work.simple_ADC
	port map( 	clk => clk,	rst => reset, Sampler_Q => ADC3_Q_ouput, 
				Sampler_D => ADC3_D_input, adc_output => ADC3_result );

-- ADC channel #4
	ADC4 : entity work.simple_ADC
	port map( 	clk => clk,	rst => reset, Sampler_Q => ADC4_Q_ouput, 
				Sampler_D => ADC4_D_input, adc_output => ADC4_result );

-- ADC channel #5
	ADC5 : entity work.simple_ADC
	port map( 	clk => clk,	rst => reset, Sampler_Q => ADC5_Q_ouput, 
				Sampler_D => ADC5_D_input, adc_output => ADC5_result );


	mykeyboard : entity work.io_ps2_com
		generic map (
			clockFilter => 15,
			ticksPerUsec => 40  -- *********
		)
		port map (
			clk => clk,
			reset => reset, -- active high!
			ps2_clk_in => ps2k_clk_in,
			ps2_dat_in => ps2k_dat_in,
			ps2_clk_out => ps2k_clk_out,
			ps2_dat_out => ps2k_dat_out,
			
			inIdle => open,	-- Probably don't need this
			sendTrigger => kbdsendtrigger,
			sendByte => kbdsendbyte,
			sendBusy => kbdsendbusy,
			sendDone => kbdsenddone,
			recvTrigger => kbdrecv,
			recvByte => kbdrecvbyte
		);

	

--  sdram0 : entity work.sdram_simple
--    port map(
--     clk_100m0_i      => clk,  -- master clock from external clock source (unbuffered)
--      reset_i          => reset_in,  	  -- reset	  
--      rw_i           => rw_i,  -- host-side SDRAM read control from memory tester
--      we_i           => we_i,  -- host-side SDRAM write control from memory tester
--      done_o         => done_s,  -- SDRAM memory read/write done indicator	  
--      addr_i         => dram_address,  -- host-side address from memory tester to SDRAM
--      data_i         => sdram_write,  -- test data pattern from memory tester to SDRAM
--      data_o         => sdram_read,  -- SDRAM data output to Sweet32	  
--      refresh_i   => dram_refresh, 	  	  
--      sdCke_o        => open,
--	  ready_o		 => dram_ready,	  
--      ub_i        	 => SDR_DQMH,         -- Data upper byte enable, active low
--      lb_i           => SDR_DQML,         -- Data lower byte enable, active low	    
--      sdRas_bo     	=> Dram_n_Ras,
--      sdCas_bo     	=> Dram_n_Cas,
--      sdWe_bo      	=> Dram_n_We,
--      sdBs_o(0)     => Dram_BA(0),
--      sdBs_o(1)     => Dram_BA(1),
--	  sdCe_bo	    => Dram_n_cs,	
--     sdDqmh_o     	=> Dram_DQMH,
--      sdDqml_o     	=> Dram_DQML,  
--      sdAddr_o     	=> Dram_Addr,
--      sdData_io     => Dram_Data
--      );


-- Sweet32 CPU
	CPU: entity work.CPU_SWEET32
    generic map(
        IMPLEMENT_32x32_MULTIPLY => false) -- False = MUL_16x16, True = MUL_32x32
	port map (
		data_i		=> mem_read,
		data_o		=> mem_write,
		addr_o		=> mem_addr,
		mem_write_LByte_o => mem_writeEnableLB,
		mem_write_UByte_o => mem_writeEnableUB,
		mem_read_o	=> mem_readEnable,
		IRQ0		=> Sweet32_IRQ,
		clk1		=> bus_state(1),
		rst			=> cpu_reset
		); 

	mem_writeEnable <= mem_writeEnableLB OR mem_writeEnableUB; 
	
	SRAM_byte_Address <= mem_addr(18 downto 1) & '0'; 
	
-- Combined BootROM and Scratchpad RAM - 2KWord (4KBytes) total
	SRAM1a: entity work.Sweet32_SRAM_upper
	port map (
		clk_i		=> clk,
		we_i		=>	Bootrom_writeEnableUB,
		--re_i	: in	std_logic;
		addr_i		=> mem_addr(12 downto 1),
		write_i		=> bootrom_data_in(15 downto 8),
		read_o		=> Bootrom_data_out(15 downto 8)
		);

-- Combined BootROM and Scratchpad RAM - 2KWord (4KBytes) total
	SRAM1b: entity work.Sweet32_SRAM_lower
	port map (	
		clk_i		=> clk,	
		we_i		=>	Bootrom_writeEnableLB,
		--re_i	: in	std_logic;
		addr_i		=> mem_addr(12 downto 1),
		write_i		=> bootrom_data_in(7 downto 0),
		read_o		=> Bootrom_data_out(7 downto 0) 
		);		
		
	Bootrom_writeEnableUB <= mem_writeEnableUB when mem_addr(31 downto 28) = X"0" else '0';
	Bootrom_writeEnableLB <= mem_writeEnableLB when mem_addr(31 downto 28) = X"0" else '0';

 --dram_address <= (mem_addr(23 downto 1) & '0');
 h_reset <= NOT reset;

-- SPI1 Timer
process(clk)
begin
	if rising_edge(clk) then
		spi1clk_in<='0';
		spi1_tick<=spi1_tick-1;
		if spi1_tick = 0 then
			spi1clk_in<='1'; -- Momentary pulse for SPI host.
			spi1_tick<=spi1_preset;
		end if;
	end if;
end process;

-- spi Timer
process(clk)
begin
	if rising_edge(clk) then
		spiclk_in<='0';
		spi_tick<=spi_tick-1;
		if spi_tick = 0 then
			spiclk_in<='1'; -- Momentary pulse for SPI host.
			spi_tick<=spi_preset;
		end if;
	end if;
end process;

-- SPI host port #1
spi1 : entity work.spi_interface
	port map(
		sysclk => clk,
		reset => cpu_reset,

		-- Host interface
		spiclk_in => spi1clk_in,
		host_to_spi => host_to_spi1,
		spi_to_host => spi1_to_host,
		wide => spi_wide,
		trigger => spi1_trigger,
		busy => spi1_busy,

		-- Hardware interface
		miso => spi1_miso,
		mosi => spi1_mosi,
		spiclk_out => spi1_clk
 
	); 
	
-- SPI host port #2
spi : entity work.spi_interface
	port map(
		sysclk => clk,
		reset => cpu_reset,

		-- Host interface
		spiclk_in => spiclk_in,
		host_to_spi => host_to_spi,
		spi_to_host => spi_to_host,
		wide => spi_wide,
		trigger => spi_trigger,
		busy => spi_busy,

		-- Hardware interface
		miso => spi_miso,
		mosi => spi_mosi,
		spiclk_out => spi_clk

	);	
	


-- DVI-D Encoder Block (Thanks Hamster ;-)
	u100 : entity work.dvid PORT MAP(
      clk       => clk_dvi,
      clk_n     => clk_dvin, 
      clk_pixel => vgaclk,
	  
      red_p     => R_8,
      green_p   => G_8,
      blue_p    => B_8,
	  
      blank     => blank,
      hsync     => hsync,
      vsync     => vsync, 
      -- outputs to TMDS drivers
      red_s     => LVDS_Red,
      green_s   => LVDS_Green,
      blue_s    => LVDS_Blue,
      clock_s   => LVDS_ck
   );


-- text mode VGA
	vga_video: entity work.vga80x40
	port map (
		reset		=> h_reset,
		clk25		=> vgaclk,
		--
		cursoron	=> cpu_cycle_counter(23),
		ocrx		=> vgacurx_reg,
		ocry		=> vgacury_reg,
		octl		=> vgactrl_reg, 
		--
		FONT_A      =>	FONT_A,
		FONT_D      =>	FONT_D,
		TEXT_A      =>	TEXT_A,
		TEXT_D      =>  TEXT_D,
		COLOR_D		=>	COLOR_D,
		--
		R			=>	R,
		G			=>	G,
		B			=>	B,
		hsync		=>	hsync,
		vsync		=>	vsync,
		nblank		=>	blank
	);	

	vga_ram_ub: entity work.dp_ram
	generic map(
		addr_width => 11,
		data_width => 8)
	port map(
		addra_i	=>	mem_addr(11 downto 1),
		wea_i	=>	vgaram_writeEnableUB,
		clka_i	=>	clk,
		dina_i	=>	vgaram_data_in(15 downto 8),
		douta_o	=>	vgaram_data_out(15 downto 8),
		
		addrb_i	=>	TEXT_A(10 downto 0),
		web_i	=>	'0',
		clkb_i	=>	vgaclk,
		dinb_i	=>	"00000000",
		doutb_o	=>	COLOR_D);

	vga_ram_lb: entity work.dp_ram
	generic map(
		addr_width => 11,
		data_width => 8)
	port map(
		addra_i	=>	mem_addr(11 downto 1),
		wea_i	=>	vgaram_writeEnableLB,
		clka_i	=>	clk,
		dina_i	=>	vgaram_data_in(7 downto 0),
		douta_o	=>	vgaram_data_out(7 downto 0),
		
		addrb_i	=>	TEXT_A(10 downto 0),
		web_i	=>	'0',
		clkb_i	=>	vgaclk,
		dinb_i	=>	"00000000",
		doutb_o	=>	TEXT_D);

	R_8 <= R & "0000";
	G_8 <= G & "0000";
	B_8 <= B & "0000";
	
	vgaram_writeEnableUB <= mem_writeEnableUB when mem_addr(31 downto 28) = X"2" else '0';
	vgaram_writeEnableLB <= mem_writeEnableLB when mem_addr(31 downto 28) = X"2" else '0';

	vga_font_ub: entity work.font_ub_dp_ram
	generic map(
		addr_width => 10,
		data_width => 8)
	port map(
		addra_i	=>	mem_addr(10 downto 1),
		wea_i	=>	vgafont_writeEnableUB,
		clka_i	=>	clk,
		dina_i	=>	vgafont_data_in(15 downto 8),
		douta_o	=>	vgafont_data_out(15 downto 8),
		
		addrb_i	=>	FONT_A(10 downto 1),
		web_i	=>	'0',
		clkb_i	=>	vgaclk,
		dinb_i	=>	"00000000",
		doutb_o	=>	vgafont_vga_out(15 downto 8));

	vga_font_lb: entity work.font_lb_dp_ram
	generic map(
		addr_width => 10,
		data_width => 8)
	port map(
		addra_i	=>	mem_addr(10 downto 1),
		wea_i	=>	vgafont_writeEnableLB,
		clka_i	=>	clk,
		dina_i	=>	vgafont_data_in(7 downto 0),
		douta_o	=>	vgafont_data_out(7 downto 0),
		
		addrb_i	=>	FONT_A(10 downto 1),
		web_i	=>	'0',
		clkb_i	=>	vgaclk,
		dinb_i	=>	"00000000",
		doutb_o	=>	vgafont_vga_out(7 downto 0));

	FONT_D	<= vgafont_vga_out(15 downto 8) when (FONT_A(0) = '0') else vgafont_vga_out(7 downto 0);

	vgafont_writeEnableUB <= mem_writeEnableUB when mem_addr(31 downto 28) = X"3" else '0';
	vgafont_writeEnableLB <= mem_writeEnableLB when mem_addr(31 downto 28) = X"3" else '0';

 
 -- ********** Sweet32 Multiplexed GPIO pins **********
	spi_miso<=GPIO_wordport(12);
	
	txd<=txd_buffer;
	
	GPIO_wordport(13)<= GPIO_outport(13) when (GPIO_direction(13) = '1' and spi_hostenable = '0') else
							spi_clk when (GPIO_direction(13) = '1' and spi_hostenable = '1') else 'Z';
  
	GPIO_wordport(11)<= GPIO_outport(11) when (GPIO_direction(11) = '1' and spi_hostenable = '0') else
							spi_mosi when (GPIO_direction(11) = '1' and spi_hostenable = '1') else 'Z';
  
	GPIO_wordport(0)<= 'Z' when GPIO_direction(0) = '0' else GPIO_outport(0);
	rxd_multiplexed<=GPIO_wordport(0) when UART0_enable = '1' else rxd;
	
	GPIO_wordport(1)<= GPIO_outport(1) when (GPIO_direction(1) = '1' and UART0_enable = '0') else
							txd_buffer when (GPIO_direction(1) = '1' and UART0_enable = '1') else 'Z';
	
	    
	--GPIO_wordport(1)<= 'Z' when GPIO_direction(1) = '0' else GPIO_outport(1);
	GPIO_wordport(2)<= 'Z' when GPIO_direction(2) = '0' else GPIO_outport(2);
	GPIO_wordport(3)<= 'Z' when GPIO_direction(3) = '0' else GPIO_outport(3);
	GPIO_wordport(4)<= 'Z' when GPIO_direction(4) = '0' else GPIO_outport(4);
	GPIO_wordport(5)<= 'Z' when GPIO_direction(5) = '0' else GPIO_outport(5);
	GPIO_wordport(6)<= 'Z' when GPIO_direction(6) = '0' else GPIO_outport(6);
	GPIO_wordport(7)<= 'Z' when GPIO_direction(7) = '0' else GPIO_outport(7);
	GPIO_wordport(8)<= 'Z' when GPIO_direction(8) = '0' else GPIO_outport(8);
	GPIO_wordport(9)<= 'Z' when GPIO_direction(9) = '0' else GPIO_outport(9);
	GPIO_wordport(10)<= 'Z' when GPIO_direction(10) = '0' else GPIO_outport(10);
	--GPIO_wordport(11)<= 'Z' when GPIO_direction(11) = '0' else GPIO_outport(11);
	GPIO_wordport(12)<= 'Z' when GPIO_direction(12) = '0' else GPIO_outport(12);
	--GPIO_wordport(13)<= 'Z' when GPIO_direction(13) = '0' else GPIO_outport(13);
	GPIO_wordport(14)<= 'Z' when GPIO_direction(14) = '0' else GPIO_outport(14);
	GPIO_wordport(15)<= 'Z' when GPIO_direction(15) = '0' else GPIO_outport(15);

	GPIO_pullup(0)<= 'Z' when GPIO_pullenable(0) = '0' else '1'; 
	GPIO_pullup(1)<= 'Z' when GPIO_pullenable(1) = '0' else '1';
	GPIO_pullup(2)<= 'Z' when GPIO_pullenable(2) = '0' else '1';	
	GPIO_pullup(3)<= 'Z' when GPIO_pullenable(3) = '0' else '1';
	GPIO_pullup(4)<= 'Z' when GPIO_pullenable(4) = '0' else '1'; 
	GPIO_pullup(5)<= 'Z' when GPIO_pullenable(5) = '0' else '1';
	GPIO_pullup(6)<= 'Z' when GPIO_pullenable(6) = '0' else '1'; 
	GPIO_pullup(7)<= 'Z' when GPIO_pullenable(7) = '0' else '1';
	GPIO_pullup(8)<= 'Z' when GPIO_pullenable(8) = '0' else '1'; 
	GPIO_pullup(9)<= 'Z' when GPIO_pullenable(9) = '0' else '1';
	GPIO_pullup(10)<= 'Z' when GPIO_pullenable(10) = '0' else '1'; 
	GPIO_pullup(11)<= 'Z' when GPIO_pullenable(11) = '0' else '1';
	GPIO_pullup(12)<= 'Z' when GPIO_pullenable(12) = '0' else '1'; 
	GPIO_pullup(13)<= 'Z' when GPIO_pullenable(13) = '0' else '1';
	GPIO_pullup(14)<= 'Z' when GPIO_pullenable(14) = '0' else '1'; 
	GPIO_pullup(15)<= 'Z' when GPIO_pullenable(15) = '0' else '1';

	ADC0_D_input<= 'Z' when ADC_GPIO_direction(0) = '0' else ADC_GPIO_outport(0);
	ADC1_D_input<= 'Z' when ADC_GPIO_direction(1) = '0' else ADC_GPIO_outport(1);
	ADC2_D_input<= 'Z' when ADC_GPIO_direction(2) = '0' else ADC_GPIO_outport(2);
	ADC3_D_input<= 'Z' when ADC_GPIO_direction(3) = '0' else ADC_GPIO_outport(3);
	ADC4_D_input<= 'Z' when ADC_GPIO_direction(4) = '0' else ADC_GPIO_outport(4);
	ADC5_D_input<= 'Z' when ADC_GPIO_direction(5) = '0' else ADC_GPIO_outport(5);
  
process(clk, reset)
begin

	if reset='0' then
		soc_write_ack <= '0';
		soc_read_ack <= '0';
		mem_busy<='0';
		timer0_prescaler<="00";
		bus_state<="00";
		cpu_reset<='0';
		timer0_enable <='0';
		timer0_overflow <= '0';
		ser_rx_buff_full<= '0';
		ser_rx_buff_full2<= '0';
		GPIO_wordport <= "ZZZZZZZZZZZZZZZZ";
		GPIO_direction <= X"0000";
		ADC_GPIO_direction <= "000000";
		GPIO_pullenable <= X"FFFF";
		USER_LED_outport <= "11";
		GPIO_pullup <= "ZZZZZZZZZZZZZZZZ";
		GPIO_outport <= X"0000";
		ADC_GPIO_outport <= "000000";
		--GPIO_outport <= NOT "0000";
		kbdsendtrigger<='0'; 
		SRAM_Data <= "ZZZZZZZZ"; -- Disable SRAM data bus		
		SRAM_n_cs <= '0';
		SRAM_n_oe <= '0';
		SRAM_n_we <= '1';
		spi1_trigger<='0';
		spi_trigger<='0';
		spi_hostenable<='0';
		spi1_cs<='1';
		UART0_enable<='0';
	elsif rising_edge(clk) then
 
		kbdsendtrigger<='0';


		if (mem_busy = '0') then
			bus_state<=bus_state+1;
		end if;
		if bus_state="10" then -- Bus State Generation. Four Bus cycles = One CPU cycle		
			bus_state<="00";
			cpu_reset<='1';
			cpu_cycle_counter <= cpu_cycle_counter + 1;
			SRAM_Addr <= SRAM_byte_Address;
			timer0_prescaler <= timer0_prescaler + 1; -- Generate 25MHz clock for Timer0
		end if;
			
		Sweet32_IRQ <= timer0_overflow; -- Sample Timer0 overflow interrupt pin

		ser_txgo<='0';
		ser_clock_divisor_rst <= '0';
		spi1_trigger<='0';
		spi_trigger<='0';
		
		--SRAM_n_oe <= '0';
		
		-- Write from CPU
		if (mem_writeEnable='1' and bus_state="00") then
			case mem_addr(31 downto 28) is
				when X"0" =>	-- Boot ROM
					bootrom_data_in <= mem_write;
					mem_busy<='0';
				when X"2" =>	-- VGA
					vgaram_data_in <= mem_write;
					mem_busy<='0';
				when X"3" =>	-- VGA font
					vgafont_data_in <= mem_write;
					mem_busy<='0';
				when X"7" =>	-- Peripherals
					case mem_addr(7 downto 0) is
						when X"00" => -- UART Transmitter reg
							ser_txdata<=mem_write(7 downto 0);
							ser_txgo<='1';
							mem_busy<='0';

						when X"02" => -- UART RX Interrupt Event Reset reg
							-- Set external signals here
							ser_rx_buff_full<='0';		-- Clear UART RX ready event
							mem_busy<='0';

						when X"04" => -- UART Clock divisor reg
							ser_clock_divisor <= unsigned(mem_write);
							ser_clock_divisor_rst <= '1';
							mem_busy<='0';

						when X"20" => -- System Timer0 reload count reg
							timer0_value <= unsigned(mem_write); -- Set Timer0 reload value
							mem_busy<='0';

						when X"22" => -- System Timer0 Control reg
							timer0_overflow<=mem_write(1);	-- Clear timer0 overflow event
							timer0_enable <=mem_write(0);
							mem_busy<='0';
							
						when X"30" => -- User LED control register
							USER_LED_outport<= NOT mem_write(1 downto 0);
							mem_busy<='0';	

						when X"38" => -- PS/2 Keyboard transmit buffer
							kbdsendbyte<=mem_write(7 downto 0);
							kbdsendtrigger<='1';
							mem_busy<='0';
							
						when X"3A" => -- PS/2 Keyboard char RX event reset
							kbdrecvreg<='0';							
							mem_busy<='0';
							
						when X"40" => -- PWM DAC0 output reg
							PWM0_value<= '0' & unsigned(mem_write(10 downto 0));
							mem_busy<='0';

						when X"42" => -- PWM DAC1 output reg
							PWM1_value<= '0' & unsigned(mem_write(10 downto 0));
							mem_busy<='0';

						when X"50" =>	-- VGA ctrl
							vgactrl_reg <= mem_write(7 downto 0);
							mem_busy<='0';

						when X"52" =>	-- VGA cursor x
							vgacurx_reg <= mem_write(7 downto 0);
							mem_busy<='0';

						when X"54" =>	-- VGA cursor y
							vgacury_reg <= mem_write(7 downto 0);
							mem_busy<='0';

						-- Write to spi transmit buffer:
						when X"70" =>
							spi_wide<='0';
							spi_trigger<='1';
							host_to_spi<=mem_write(7 downto 0);

						-- Write to spi CS flag:
						--when X"72" =>
						--	spi1_cs<=not mem_write(0);
						
						-- Write to SPI1 transmit buffer:
						when X"78" =>
							spi1_wide<='0';
							spi1_trigger<='1';
							host_to_spi1<=mem_write(7 downto 0);

						-- Write to SPI1 CS flag:
						when X"7A" =>
							spi1_cs<=not mem_write(0);
							
						when X"80" => -- GPIO Data out register
							GPIO_outport<= mem_write;
							mem_busy<='0';

						when X"82" => -- GPIO Input/output select
							GPIO_direction <= mem_write;
							mem_busy<='0';
							
						when X"84" => -- GPIO Pullup resistor select
							GPIO_pullenable <= mem_write;
							mem_busy<='0';		

						when X"88" => -- ADC GPIO Data out register
							ADC_GPIO_outport<= mem_write(5 downto 0);
							mem_busy<='0';

						when X"8A" => -- ADC GPIO Input/output select
							ADC_GPIO_direction <= mem_write(5 downto 0);
							mem_busy<='0';

						when X"F0" => -- GPIO Alternate function select
							spi_hostenable <= mem_write(0);
							UART0_enable <= mem_write(1);
				
						when others =>
							null;
							
					end case;
					
				when others =>
					if (mem_writeEnableLB = '1') then
						sram_state<=writeb;
						SRAM_n_we <= '0';
					else
						sram_state<=writeb3;
					end if;
						mem_busy<='1';
						SRAM_n_oe <= '1';
					--mem_busy<='0';	
			end case;
 
		-- Read from CPU
		elsif (mem_readEnable='1' and bus_state="00") then
			soc_read_ack <='1';
			case mem_addr(31 downto 28) is
				when X"0" =>	-- Boot ROM
					mem_read <= bootrom_data_out;
					mem_busy<='0';
				when X"2" =>	-- VGA
					mem_read <= vgaram_data_out;
					mem_busy<='0';
				when X"3" =>	-- VGA font
					mem_read <= vgafont_data_out;
					mem_busy<='0';
				when X"7" =>	-- Peripherals
					case mem_addr(7 downto 0) is
						when X"00" => -- UART receive + port status reg
							mem_read<="000000" & ser_rx_buff_full & ser_txready & ser_rx_buff;
							mem_busy<='0';

						when X"04" => -- UART Clock divisor reg
							mem_read<= std_logic_vector(ser_clock_divisor); -- ser_clock_divisor_read
							mem_busy<='0'; 
 
						when X"06" => -- UART detected minimum bit-clock reg
							mem_read<= std_logic_vector(ser_clock_divisor_read); -- ser_clock_divisor_read
							mem_busy<='0';

						when X"22" => -- Timer0 Control reg
							-- Set external signals here
							mem_busy<='0';
							mem_read(0)<=timer0_overflow;	-- Poll timer0 overflow event

						when X"38" => -- PS/2 Keyboard TX/RX port status bits + receive buffer
							mem_read<="0000" & kbdrecvreg & not kbdsendbusy & kbdrecvbyte(10 downto 1);
								
						when X"40" => -- Sigma-Delta ADC0 result reg
							mem_read<= "00000" & std_logic_vector(ADC0_result);
							mem_busy<='0';
							
						when X"42" => -- Sigma-Delta ADC1 result reg
							mem_read<= "00000" & std_logic_vector(ADC1_result);
							mem_busy<='0';		

						when X"44" => -- Sigma-Delta ADC2 result reg
							mem_read<= "00000" & std_logic_vector(ADC2_result);
							mem_busy<='0';

						when X"46" => -- Sigma-Delta ADC3 result reg
							mem_read<= "00000" & std_logic_vector(ADC3_result);
							mem_busy<='0';
							
						when X"48" => -- Sigma-Delta ADC4 result reg
							mem_read<= "00000" & std_logic_vector(ADC4_result);
							mem_busy<='0';		

						when X"4A" => -- Sigma-Delta ADC5 result reg
							mem_read<= "00000" & std_logic_vector(ADC5_result);
							mem_busy<='0';

						when X"50" =>	-- VGA ctrl
							mem_read <= "00000000" & vgactrl_reg;
							mem_busy<='0';

						when X"52" =>	-- VGA cursor x
							mem_read <= "00000000" & vgacurx_reg;
							mem_busy<='0';

						when X"54" =>	-- VGA cursor y
							mem_read <= "00000000" & vgacury_reg;
							mem_busy<='0';

						when X"60" =>
							mem_read<= std_logic_vector(cpu_cycle_counter(31 downto 16));
							mem_busy<='0';

						when X"62" =>
							mem_read<= std_logic_vector(cpu_cycle_counter(15 downto 0)); 
							mem_busy<='0';

						-- Read from spi received data reg
						when X"70" =>
							mem_read<=spi_to_host;
						
						-- Read from spi status
						when X"72" =>
							mem_read<=spi_busy & "000" & X"000";
							
						-- Read from SPI1 received data reg
						when X"78" =>
							mem_read<=spi1_to_host;
						
						-- Read from SPI1 status
						when X"7A" =>
							mem_read<=spi1_busy & "000" & X"000";
							
						when X"80" => -- GPIO Data out register
							mem_read<= GPIO_wordport;
							mem_busy<='0';

						when X"88" => -- ADC GPIO Data out register
							mem_read<= "0000000000" & std_logic(ADC5_result(10)) & std_logic(ADC4_result(10)) & 
							std_logic(ADC3_result(10)) & std_logic(ADC2_result(10)) & std_logic(ADC1_result(10)) & 
							std_logic(ADC0_result(10));
							mem_busy<='0';
 
						when others =>
							mem_read<= (others => '0');
							mem_busy<='0';
					end case;
				when others =>
					mem_read(7 downto 0) <= SRAM_Data;
					sram_state<=readb;
					SRAM_Addr <= std_logic_vector(unsigned(SRAM_byte_Address) + 1);
					mem_busy<='1'; 
			end case;
		end if;

	-- External SRAM interface FSM
	
		case sram_state is
			when readb => 	-- External SRAM *Read* FSM
				mem_busy<='0';
				mem_read(15 downto 8)<= SRAM_Data;
				sram_state<=idle;	
				
				
				
			when writeb => 	-- External SRAM *Write* FSM
				sram_state<=writeb2;	
				SRAM_Data <= mem_write(7 downto 0);
				
			when writeb2 => 	
				sram_state<=writeb3;
				SRAM_n_we <= '1';

			when writeb3 =>		
				sram_state<=writeb4;
				if (mem_writeEnableUB = '1') then
					SRAM_n_we <= '0';
					SRAM_Addr <= std_logic_vector(unsigned(SRAM_byte_Address) + 1);
					SRAM_Data <= mem_write(15 downto 8);
				end if;
			when writeb4 =>
				sram_state<=writeb5;
				SRAM_n_we <= '1';

			when writeb5 =>
				sram_state<=idle;
				SRAM_Data <= "ZZZZZZZZ"; -- Disable SRAM data bus	
				SRAM_n_oe <= '0';	
				mem_busy<='0';

			when others => 
				null;

		end case;


		-- Capture UART RX ready event
		if ser_rxint='1' then
			if ser_rx_buff_full = '0' then
				ser_rx_buff <= ser_rxdata;
				ser_rx_buff_full <= '1';
			else
				ser_rx_buff2 <= ser_rxdata;
				ser_rx_buff_full2 <= '1';
			end if;
		else
			-- move second buffer to first
			if ser_rx_buff_full = '0' AND ser_rx_buff_full2 = '1' then
				ser_rx_buff <= ser_rx_buff2;
				ser_rx_buff_full <= '1';
				ser_rx_buff_full2 <= '0';
			end if;
		end if;
		
		if kbdrecv='1' then
			kbdrecvreg <= '1'; -- remains high until cleared by a read
		end if;		

		-- Capture Timer0 overflow event
		if timer0_int='1' then
			timer0_overflow<='1';
		end if;

	end if; -- rising-edge(clk)

end process;




end architecture;

