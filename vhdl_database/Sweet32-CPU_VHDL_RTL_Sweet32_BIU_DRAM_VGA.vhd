-- ############# Sweet32 microprocessor - Bus Interface Unit #############
-- #######################################################################
-- Module Name:		Sweet32_MCU.vhd
-- Module Version:	0.41
-- Module author:	Valentin Angelovski
-- Module date:		14/09/2014
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
use work.CommonPckg.all;

entity Sweet32_BIU_DRAM_VGA is
	generic(
		SYS_CLOCK_HZ	: NATURAL;	-- e.g., 100_000_000 Hz for 100 Mhz
		BAUD_RATE		: NATURAL);	-- e.g., 115,200 baud
	port (
		clk				: in std_logic;
		reset_in		: in std_logic;

		--video out
		vgaclk			: in std_logic;
		R				: out std_logic_vector(3 downto 0);
		G				: out std_logic_vector(3 downto 0);
		B				: out std_logic_vector(3 downto 0);
		hsync			: out std_logic;
		vsync			: out std_logic;

		-- User bidirectional port
		GPIO_wordport	: inout std_logic_vector(15 downto 0);

		-- User LEDs
		GPIO_outport	: buffer std_logic_vector(3 downto 0);

		--PWM output
		PWM0_out		: out std_logic;
		PWM1_out		: out std_logic;

		--ADC input
		--ADC0_Q_ouput	: BUFFER STD_LOGIC;	-- Sigma Delta ADC - Comparator result
		--ADC0_D_input	: in STD_LOGIC;		-- Sigma Delta ADC - RC circuit driver out

		-- UART
		rxd				: in std_logic;
		txd				: out std_logic;
		
		-- PS/2 Keyboard		
		ps2k_clk_in : in std_logic;
		ps2k_dat_in : in std_logic;
		ps2k_clk_out : out std_logic;
		ps2k_dat_out : out std_logic;		

		-- SDRAM interface (For use with 16Mx16bit or 32Mx16bit SDR DRAM, depending on version)
		Dram_n_Ras		: out		std_logic;	-- SDRAM RAS
		Dram_n_Cas		: out		std_logic;	-- SDRAM CAS
		Dram_n_We		: out		std_logic;	-- SDRAM write-enable
		Dram_BA			: out		std_logic_vector(1 downto 0);	-- SDRAM bank-address
		Dram_Addr		: out		std_logic_vector(12 downto 0);	-- SDRAM address bus
		Dram_Data		: inout		std_logic_vector(15 downto 0);	-- data bus to/from SDRAM
		Dram_n_cs		: out		std_logic;
		--Dram_dqm		: out		std_logic_vector(1 downto 0);
		Dram_DQMH		: out		std_logic;
		Dram_DQML		: out		std_logic			
		);
end entity;

architecture rtl of Sweet32_BIU_DRAM_VGA is

-- System reset
signal reset				: std_logic := '0';
signal reset_counter		: unsigned(15 downto 0) := X"0000";
signal h_reset				: std_logic := '1';

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
signal GPIO_register		: std_logic_vector(15 downto 0);	

-- ADC signals
--signal ADC0_result			: unsigned (10 downto 0);
 
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


-- VGA Color text
signal vgactrl_reg			: std_logic_vector(7 downto 0) := "11100000";
signal vgacurx_reg			: std_logic_vector(7 downto 0) := "00000000";
signal vgacury_reg			: std_logic_vector(7 downto 0) := "00000000";
signal vgaram_writeEnableUB: std_logic; 
signal vgaram_writeEnableLB: std_logic; 
signal vgaram_data_out		: std_logic_vector(15 downto 0);
signal vgaram_data_in		: std_logic_vector(15 downto 0);
signal vgaram_vga_out		: std_logic_vector(15 downto 0);
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

-- SDRAM signals
  signal sdram_read	  : std_logic_vector(15 downto 0);
  signal sdram_write  : std_logic_vector(15 downto 0);
  signal dram_address : std_logic_vector(23 downto 0);

  signal done_s       : std_logic;      -- SDRAM operation complete indicator
  signal rdDone_s     : std_logic;      -- SDRAM operation complete indicator
  signal rw_i         : std_logic;      -- host-side read control signal
  signal we_i         : std_logic;      -- host-side write control signal
  signal dram_ready   : std_logic;      -- host-side write control signal

 
  signal refresh_counter : integer range 0 to 1000 := 0;
  signal dram_refresh   : std_logic;    
  signal SDR_DQMH  : std_logic;  	-- DRAM upper byte write mask
  signal SDR_DQML  : std_logic;  	-- DRAM lower byte write mask
  
-- SDRAM states 
type sdram_states is (read1, read2, read3, write1, writeb, write2, write3, idle, refresh);
signal sdram_state : sdram_states; 
  

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
	if reset='0' then
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
	if reset_in='0' then
		reset_counter<=X"FFFF";
		reset<='0';
	elsif rising_edge(clk) then
		reset_counter<=reset_counter-1;
		if reset_counter=X"0000" then
			reset<= dram_ready;
		end if;
	end if;
end process;

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
			rxd => rxd,
			txd => txd
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
--	ADC0 : entity work.simple_ADC
--	port map(
--		clk => clk,
--		rst => reset,
--		Sampler_Q => ADC0_Q_ouput,
--		Sampler_D => ADC0_D_input,
--		adc_output => ADC0_result

	--);
	

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

	

  sdram0 : entity work.sdram_simple
 
    port map(
      clk_100m0_i      => clk,  -- master clock from external clock source (unbuffered)
      reset_i          => reset_in,  	  -- reset
	  
      rw_i           => rw_i,  -- host-side SDRAM read control from memory tester
      we_i           => we_i,  -- host-side SDRAM write control from memory tester
      done_o         => done_s,  -- SDRAM memory read/write done indicator
	  
      addr_i         => dram_address,  -- host-side address from memory tester to SDRAM
      data_i         => sdram_write,  -- test data pattern from memory tester to SDRAM
      data_o         => sdram_read,  -- SDRAM data output to Sweet32
	  
      refresh_i   => dram_refresh, 	  
	  
      sdCke_o        => open,
	  ready_o		 => dram_ready,
	   
      ub_i        	 => SDR_DQMH,         -- Data upper byte enable, active low
      lb_i           => SDR_DQML,         -- Data lower byte enable, active low
	     
      sdRas_bo     	=> Dram_n_Ras,
      sdCas_bo     	=> Dram_n_Cas,
      sdWe_bo      	=> Dram_n_We,
      sdBs_o(0)     => Dram_BA(0),
      sdBs_o(1)     => Dram_BA(1),
	  sdCe_bo	    => Dram_n_cs,	
      sdDqmh_o     	=> Dram_DQMH,
      sdDqml_o     	=> Dram_DQML,  
      sdAddr_o     	=> Dram_Addr,
      sdData_io     => Dram_Data
	  

      );


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

 dram_address <= (mem_addr(23 downto 1) & '0');
 h_reset <= NOT reset;

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
		vsync		=>	vsync
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

	GPIO_wordport(0)<= 'Z' when GPIO_direction(0) = '0' else GPIO_register(0);
	GPIO_wordport(1)<= 'Z' when GPIO_direction(1) = '0' else GPIO_register(1);
	GPIO_wordport(2)<= 'Z' when GPIO_direction(2) = '0' else GPIO_register(2);
	GPIO_wordport(3)<= 'Z' when GPIO_direction(3) = '0' else GPIO_register(3);
	GPIO_wordport(4)<= 'Z' when GPIO_direction(4) = '0' else GPIO_register(4);
	GPIO_wordport(5)<= 'Z' when GPIO_direction(5) = '0' else GPIO_register(5);
	GPIO_wordport(6)<= 'Z' when GPIO_direction(6) = '0' else GPIO_register(6);
	GPIO_wordport(7)<= 'Z' when GPIO_direction(7) = '0' else GPIO_register(7);
	GPIO_wordport(8)<= 'Z' when GPIO_direction(8) = '0' else GPIO_register(8);
	GPIO_wordport(9)<= 'Z' when GPIO_direction(9) = '0' else GPIO_register(9);
	GPIO_wordport(10)<= 'Z' when GPIO_direction(10) = '0' else GPIO_register(10);
	GPIO_wordport(11)<= 'Z' when GPIO_direction(11) = '0' else GPIO_register(11);
	GPIO_wordport(12)<= 'Z' when GPIO_direction(12) = '0' else GPIO_register(12);
	GPIO_wordport(13)<= 'Z' when GPIO_direction(13) = '0' else GPIO_register(13);
	GPIO_wordport(14)<= 'Z' when GPIO_direction(14) = '0' else GPIO_register(14);
	GPIO_wordport(15)<= 'Z' when GPIO_direction(15) = '0' else GPIO_register(15);

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
		GPIO_outport <= NOT "0000";
		rw_i <= '0'; -- Initiate a read or write operation, active high
		we_i <= '1'; -- Write enable, active low
		sdram_state<=idle;
		kbdsendtrigger<='0';
		refresh_counter <= 0;
		dram_refresh <= '0';
	elsif rising_edge(clk) then

		kbdsendtrigger<='0';
		timer0_prescaler <= timer0_prescaler + 1; -- Generate 25MHz clock for Timer0

		if (mem_busy = '0') then
			bus_state<=bus_state+1;
		end if;
		if bus_state="11" then -- Bus State Generation. Four Bus cycles = One CPU cycle		
			if refresh_counter > 180 then
				mem_busy<='1';	
				sdram_state<=refresh;
				dram_refresh <= '1';
				bus_state<="11";			
			else 
				bus_state<="00";
				mem_busy<='0';
				cpu_reset<='1';
				cpu_cycle_counter <= cpu_cycle_counter + 1;
			end if;
		end if;
		
		refresh_counter <= refresh_counter + 1;		-- Increment refresh	
		
		Sweet32_IRQ <= timer0_overflow; -- Sample Timer0 overflow interrupt pin

		ser_txgo<='0';
		ser_clock_divisor_rst <= '0';


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
							
						when X"30" => -- User LEDs control reg
							GPIO_outport<= NOT mem_write(3 downto 0);
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
							
						when X"80" => -- GPIO Data out register
							GPIO_register<= mem_write;
							mem_busy<='0';

						when X"82" => -- GPIO Input/output select
							GPIO_direction <= mem_write;
							mem_busy<='0';
							
						when others =>
							null;
					end case;
				when others =>
					mem_busy<='1';	
					sdram_state<=write1;
				    rw_i <= '1'; -- Initiate a read or write operation, active high
					we_i <= '0'; -- Write enable, active low
					SDR_DQMH <= NOT mem_writeEnableUB; 
					SDR_DQML <= NOT mem_writeEnableLB; 
					sdram_write<=mem_write;	
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

						when X"30" => -- GPIO Input port
							mem_busy<='0';

						when X"38" => -- PS/2 Keyboard TX/RX port status bits + receive buffer
							mem_read<="0000" & kbdrecvreg & not kbdsendbusy & kbdrecvbyte(10 downto 1);
								
					--	when X"40" => -- Sigma-Delta ADC0 result reg
					--		mem_read<= "00000" & std_logic_vector(ADC0_result);
					--		mem_busy<='0';

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

						when X"80" => -- GPIO Data out register
							mem_read<= GPIO_wordport;
							mem_busy<='0';

						when others =>
							mem_read<= (others => '0');
							mem_busy<='0';
					end case;
				when others =>
					sdram_state<=read1;
					mem_busy<='1';

				    rw_i <= '1'; -- Initiate a read or write operation, active high
					we_i <= '1'; -- Write enable, active low

			end case;
		end if;

	-- SDRAM state machine
	
		case sdram_state is
			when read1 => -- read first word from RAM

				if(done_s = '1') then
					rw_i <= '0'; -- Initiate a read or write operation, active high
					we_i <= '1'; -- Write enable, active low
					mem_busy<='0';
					mem_read<=sdram_read;
					sdram_state<=idle;
				end if;
					
			when write1 => -- write 16-bit word to SDRAM		
				if(done_s = '1') then
					rw_i <= '0'; -- Initiate a read or write operation, active high
					we_i <= '1'; -- Write enable, active low
					mem_busy<='0';
					sdram_state<=idle;
					SDR_DQMH <= '0'; 
					SDR_DQMH <= '0'; 
				end if;
					
			when refresh => -- write 16-bit word to SDRAM	
				dram_refresh <='0';	
				if(done_s = '1') then
					mem_busy<='0';
					sdram_state<=idle;
					
					refresh_counter <= 0;
				end if;			
			
		--		sdram_addr<=mem_Addr(30 downto 0) & '0';
		--		sdram_wr<='0';
		--		sdram_req<='1';
		--		sdram_write(15 downto 0)<=mem_write; -- 16-bits now
		--		if sdram_ack='0' then -- done?
		--			sdram_req<='0';
		--			sdram_state<=idle;
		--			mem_busy<='0'; 
		--		end if;
		--	when writeb => -- write 8-bit value to SDRAM
		--		sdram_addr<=mem_Addr;
		--		sdram_wr<='0';
		--		sdram_req<='1';
		--		sdram_write(15 downto 0)<=mem_write; -- 32-bits now
		--		sdram_write(15 downto 8)<=mem_write(7 downto 0); -- 32-bits now
		--		if sdram_ack='0' then -- done?
		--			sdram_req<='0';
		--			sdram_state<=idle;
		--			mem_busy<='0';
		--		end if;
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
