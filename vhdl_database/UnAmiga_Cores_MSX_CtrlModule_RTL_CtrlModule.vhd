library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

library work;
use work.zpupkg.ALL;

entity CtrlModule is
	generic (
		sysclk_frequency : integer := 1000; -- Sysclk frequency * 10
		mouse_fourbyte : in std_logic :='0';  -- Does the board initialise the mouse in 4-byte mode?
		mouse_init : in std_logic :='1'  -- Does the mouse need initialising?
	);
	port (
		clk 			: in std_logic;
		reset_n 	: in std_logic;

		-- SPI signals
		spi_miso		: in std_logic := '1'; -- Allow the SPI interface not to be plumbed in.
		spi_mosi		: out std_logic;
		spi_clk		: out std_logic;
		spi_cs 		: out std_logic;
		
		-- UART
		rxd	: in std_logic;
		txd	: out std_logic;
		
		-- DIP switches
		dipswitches : out std_logic_vector(11 downto 0);

		-- PS2 keyboard
		ps2k_clk_in : in std_logic := '1';
		ps2k_dat_in : in std_logic := '1';
--		ps2k_clk_out : out std_logic;
--		ps2k_dat_out : out std_logic;

		ps2m_clk_in : in std_logic := '1';
		ps2m_dat_in : in std_logic := '1';
		ps2m_clk_out : out std_logic;
		ps2m_dat_out : out std_logic;
		
		-- Host control
		host_reset_n : out std_logic;
		host_bootdone : out std_logic;
		host_divert_sdcard : out std_logic;
		host_divert_keyboard : out std_logic;
		
		-- Host boot data
		host_bootdata : out std_logic_vector(7 downto 0);
		host_bootdata_req : in std_logic:='0';
		host_bootdata_ack : out std_logic;
		
		-- Mouse data
		mouse_deltax : out std_logic_vector(7 downto 0);
		mouse_deltay : out std_logic_vector(7 downto 0);
		mouse_buttons : out std_logic_vector(1 downto 0);
		mouse_rdy : out std_logic;
		mouse_idle : in std_logic;
		
		-- Video signals for OSD
		vga_hsync : in std_logic;
		vga_vsync : in std_logic;
		osd_window : out std_logic;
		osd_pixel : out std_logic;

		-- Audio volumes
		vol_master : out std_logic_vector(2 downto 0);
		vol_opll : out std_logic_vector(2 downto 0);
		vol_scc : out std_logic_vector(2 downto 0);
		vol_psg : out std_logic_vector(2 downto 0)
);
end entity;

architecture rtl of CtrlModule is

constant sysclk_hz : integer := sysclk_frequency*1000;
constant uart_divisor : integer := sysclk_hz/1152;
constant maxAddrBit : integer := 20;

signal reset : std_logic := '0';
signal reset_counter : unsigned(15 downto 0) := X"FFFF";

-- SPI Clock counter
signal spi_tick : unsigned(8 downto 0);
signal spiclk_in : std_logic;
signal spi_fast : std_logic;

-- SPI signals
signal host_to_spi : std_logic_vector(7 downto 0);
signal spi_to_host : std_logic_vector(31 downto 0);
signal spi_wide : std_logic;
signal spi_trigger : std_logic;
signal spi_busy : std_logic;
signal spi_active : std_logic;


-- UART signals

signal ser_txdata : std_logic_vector(7 downto 0);
signal ser_txready : std_logic;
signal ser_rxdata : std_logic_vector(7 downto 0);
signal ser_rxrecv : std_logic;
signal ser_txgo : std_logic;
signal ser_rxint : std_logic;

-- ZPU signals

signal mem_busy           : std_logic;
signal mem_read             : std_logic_vector(wordSize-1 downto 0);
signal mem_write            : std_logic_vector(wordSize-1 downto 0);
signal mem_addr             : std_logic_vector(maxAddrBit downto 0);
signal mem_writeEnable      : std_logic; 
signal mem_writeEnableh      : std_logic; 
signal mem_writeEnableb      : std_logic; 
signal mem_readEnable       : std_logic;

signal zpu_to_rom : ZPU_ToROM;
signal zpu_from_rom : ZPU_FromROM;

signal host_bootdata_pending : std_logic;
signal host_bootdata_ack_r : std_logic;


-- Interrupt signals

constant int_max : integer := 2;
signal int_triggers : std_logic_vector(int_max downto 0);
signal int_status : std_logic_vector(int_max downto 0);
signal int_ack : std_logic;
signal int_req : std_logic;
signal int_enabled : std_logic :='0'; -- Disabled by default
signal int_trigger : std_logic;


-- PS2 signals
signal ps2_int : std_logic;

signal kbdidle : std_logic;
signal kbdrecv : std_logic;
signal kbdrecvreg : std_logic;
signal kbdrecvbyte : std_logic_vector(10 downto 0);
--signal kbdsendbusy : std_logic;
--signal kbdsendtrigger : std_logic;
--signal kbdsenddone : std_logic;
--signal kbdsendbyte : std_logic_vector(7 downto 0);

signal mouserecv : std_logic;
signal mouserecvreg : std_logic;
signal mouserecvbyte : std_logic_vector(10 downto 0);
signal mousesendbusy : std_logic;
signal mousesendtrigger : std_logic;
signal mousesenddone : std_logic;
signal mousesendbyte : std_logic_vector(7 downto 0);

signal osd_wr : std_logic;
signal osd_charwr : std_logic;
signal osd_char_q : std_logic_vector(7 downto 0);
signal osd_data : std_logic_vector(15 downto 0);
signal vga_vsync_d : std_logic;
signal vblank : std_logic;


begin

	host_bootdata_ack<=host_bootdata_ack_r;

-- ROM

	myrom : entity work.CtrlROM_ROM
	generic map
	(
		maxAddrBitBRAM => 13
	)
	port map (
		clk => clk,
		from_zpu => zpu_to_rom,
		to_zpu => zpu_from_rom
	);


-- Reset counter.

process(clk)
begin
	if reset_n='0' then
		reset_counter<=X"FFFF";
		reset<='0';
	elsif rising_edge(clk) then
		reset_counter<=reset_counter-1;
		if reset_counter=X"0000" then
			reset<='1';
		end if;
	end if;
end process;


-- UART

myuart : entity work.simple_uart
	generic map(
		enable_tx=>true,
		enable_rx=>false
	)
	port map(
		clk => clk,
		reset => reset, -- active low
		txdata => ser_txdata,
		txready => ser_txready,
		txgo => ser_txgo,
		rxdata => ser_rxdata,
		rxint => ser_rxint,
		txint => open,
		clock_divisor => to_unsigned(uart_divisor,16),
		rxd => rxd,
		txd => txd
	);


-- SPI Timer
process(clk)
begin
	if rising_edge(clk) then
		spiclk_in<='0';
		spi_tick<=spi_tick+1;
		if (spi_fast='1' and spi_tick(5)='1') or spi_tick(8)='1' then
			spiclk_in<='1'; -- Momentary pulse for SPI host.
			spi_tick<='0'&X"00";
		end if;
	end if;
end process;


-- OSD

myosd : entity work.OnScreenDisplay
port map(
	reset_n => reset,
	clk => clk,
	-- Video
	hsync_n => vga_hsync,
	vsync_n => vga_vsync,
--	enabled => host_divert_keyboard,
	pixel => osd_pixel,
	window => osd_window,
	-- Registers
	addr => mem_addr(8 downto 0),
	data_in => mem_write(15 downto 0),
	data_out => osd_data(15 downto 0),
	reg_wr => osd_wr,
	char_wr => osd_charwr,
	char_q => osd_char_q
);


-- SPI host
spi : entity work.spi_interface
	port map(
		sysclk => clk,
		reset => reset,

		-- Host interface
		spiclk_in => spiclk_in,
		host_to_spi => host_to_spi,
		spi_to_host => spi_to_host,
--		wide => spi_wide,
		trigger => spi_trigger,
		busy => spi_busy,

		-- Hardware interface
		miso => spi_miso,
		mosi => spi_mosi,
		spiclk_out => spi_clk
	);

	-- PS2 keyboard
		mykeyboard : entity work.io_ps2_com
		generic map (
			clockFilter => 15,
			ticksPerUsec => sysclk_frequency/10
		)
		port map (
			clk => clk,
			reset => not reset, -- active high!
			ps2_clk_in => ps2k_clk_in,
			ps2_dat_in => ps2k_dat_in,
--			ps2_clk_out => ps2k_clk_out, -- Receive only
--			ps2_dat_out => ps2k_dat_out,
			
			inIdle => open,
			sendTrigger => '0',
			sendByte => (others=>'X'),
			sendBusy => open,
			sendDone => open,
			recvTrigger => kbdrecv,
			recvByte => kbdrecvbyte
		);

		-- PS2 mouse
		mymouse : entity work.io_ps2_com
		generic map (
			clockFilter => 15,
			ticksPerUsec => sysclk_frequency/10
		)
		port map (
			clk => clk,
			reset => not reset, -- active high!
			ps2_clk_in => ps2m_clk_in,
			ps2_dat_in => ps2m_dat_in,
			ps2_clk_out => ps2m_clk_out, -- Receive only
			ps2_dat_out => ps2m_dat_out,
			
			inIdle => open,
			sendTrigger => mousesendtrigger,
			sendByte => mousesendbyte,
			sendBusy => mousesendbusy,
			sendDone => mousesenddone,
			recvTrigger => mouserecv,
			recvByte => mouserecvbyte
		);

-- Interrupt controller

intcontroller: entity work.interrupt_controller
generic map (
	max_int => int_max
)
port map (
	clk => clk,
	reset_n => reset,
	trigger => int_triggers, -- Again, thanks ISE.
	ack => int_ack,
	int => int_req,
	status => int_status
);

int_triggers<=(0=>kbdrecv,
					1=>mouserecv,
					2=>vblank,
					others => '0');

-- Detect vblank
vblank<='1' when vga_vsync='0' and vga_vsync_d='1' else '0';
process(clk,vga_vsync)
begin
	if rising_edge(clk) then
		vga_vsync_d<=vga_vsync;
	end if;
end process;
			

-- Main CPU

	zpu: zpu_core_flex
	generic map (
		IMPL_MULTIPLY => true,
		IMPL_COMPARISON_SUB => true,
		IMPL_EQBRANCH => true,
		IMPL_STOREBH => true,
		IMPL_LOADBH => true,
		IMPL_CALL => true,
		IMPL_SHIFT => true,
		IMPL_XOR => true,
--		IMPL_EMULATION => minimal,
		CACHE => true,
		REMAP_STACK => false, -- We're not accessing SDRAM, so no need to remap the Boot ROM / Stack RAM
		EXECUTE_RAM => false,
		maxAddrBit => maxAddrBit,
		maxAddrBitBRAM => 13
	)
	port map (
		clk                 => clk,
		reset               => not reset,
		in_mem_busy         => mem_busy,
		mem_read            => mem_read,
		mem_write           => mem_write,
		out_mem_addr        => mem_addr,
		out_mem_writeEnable => mem_writeEnable,
		out_mem_hEnable     => mem_writeEnableh,
		out_mem_bEnable     => mem_writeEnableb,
		out_mem_readEnable  => mem_readEnable,
		from_rom => zpu_from_rom,
		to_rom => zpu_to_rom,
		interrupt => int_trigger
	);

int_trigger<=int_req and int_enabled;	

process(clk)
begin
	if reset='0' then
		spi_cs<='1';
		spi_active<='0';
		int_enabled<='0';
		kbdrecvreg <='0';
		host_bootdata_ack_r<='0';
		host_bootdata_pending<='0';
		host_divert_sdcard<='0';
		host_divert_keyboard<='0';
		mouserecvreg <='0';
	elsif rising_edge(clk) then
		mem_busy<='1';
		ser_txgo<='0';
		spi_trigger<='0';
		int_ack<='0';
		osd_charwr<='0';
		osd_wr<='0';
		mousesendtrigger<='0';

		if mouse_idle='0' then
			mouse_rdy<='0';
		end if;
		
		-- Write from CPU?
		if mem_writeEnable='1' then
			case mem_addr(maxAddrBit)&mem_addr(10 downto 8) is
				when X"B" =>	-- OSD controller at 0xFFFFFB00
					osd_wr<='1';
--					osd_req<='1';
					mem_busy<='0';
				when X"C" =>	-- OSD controller at 0xFFFFFC00 & 0xFFFFFD00
					osd_charwr<='1';
					mem_busy<='0';
				when X"D" =>	-- OSD controller at 0xFFFFFC00 & 0xFFFFFD00
					osd_charwr<='1';
					mem_busy<='0';
				when X"F" =>	-- Peripherals at 0xFFFFFF00
					case mem_addr(7 downto 0) is
						when X"B0" => -- Interrupts
							int_enabled<=mem_write(0);
							mem_busy<='0';

						when X"C0" => -- UART
							ser_txdata<=mem_write(7 downto 0);
							ser_txgo<='1';
							mem_busy<='0';

						when X"D0" => -- SPI CS
							spi_cs<=not mem_write(0);
							spi_fast<=mem_write(8);
							mem_busy<='0';

						when X"D4" => -- SPI Data
							spi_wide<='0';
							spi_trigger<='1';
							host_to_spi<=mem_write(7 downto 0);
							spi_active<='1';

						when X"E4" => -- PS2 Mouse
							mousesendbyte<=mem_write(7 downto 0);
							mousesendtrigger<='1';
							mem_busy<='0';
							
						when X"40" => -- Host SW
							mem_busy<='0';
							dipswitches<=mem_write(11 downto 0);
							
						when X"44" => -- Host control
							host_reset_n<=not mem_write(0);
							host_bootdone<=mem_write(1);
							host_divert_sdcard <= mem_write(2);
							host_divert_keyboard <= mem_write(3);
							mem_busy<='0';
							
						when X"48" => -- Host boot data
							host_bootdata<=mem_write(7 downto 0);
							host_bootdata_pending<='1';
--								mem_busy<='0';

						when X"4C" => -- Host mouse buttons
							mouse_buttons<=mem_write(1 downto 0);
							mem_busy<='0';

						when X"50" => -- Host mouse data
							mouse_deltax<=mem_write(15 downto 8);
							mouse_deltay<=mem_write(7 downto 0);
							mouse_rdy<='1'; -- New data present.
							mem_busy<='0';

						when X"54" => -- Audio volumes
							vol_master<=not mem_write(2 downto 0);
							vol_opll<=mem_write(6 downto 4);
							vol_scc<=mem_write(10 downto 8);
							vol_psg<=mem_write(14 downto 12);
							mem_busy<='0';

						when others =>
							mem_busy<='0';
							null;
					end case;
				when others =>
					mem_busy<='0';
			end case;

		elsif mem_readEnable='1' then -- Read from CPU?
			case mem_addr(maxAddrBit)&mem_addr(10 downto 8) is

				when X"B" =>	-- OSD registers
					mem_read(31 downto 16)<=(others => '0');
					mem_read(15 downto 0)<=osd_data;
					mem_busy<='0';
--					osd_req<='1';
				when X"C" =>	-- OSD controller at 0xFFFFFC00 & 0xFFFFFD00
					mem_read(31 downto 8)<=(others => '0');
					mem_read(7 downto 0)<=osd_char_q;
					mem_busy<='0';
				when X"D" =>	-- OSD controller at 0xFFFFFC00 & 0xFFFFFD00
					mem_read(31 downto 8)<=(others => '0');
					mem_read(7 downto 0)<=osd_char_q;
					mem_busy<='0';

				when X"F" =>	-- Peripherals
					case mem_addr(7 downto 0) is
						when X"B0" => -- Interrupt
							mem_read<=(others=>'0');
							mem_read(int_max downto 0)<=int_status;
							int_ack<='1';
							mem_busy<='0';

						when X"C0" => -- UART
							mem_read<=(others=>'0');
							mem_read(9 downto 0)<=ser_rxrecv&ser_txready&ser_rxdata;
							ser_rxrecv<='0';	-- Clear rx flag.
							mem_busy<='0';

						when X"D0" => -- SPI Status
							mem_read<=(others=>'0');
							mem_read(15)<=spi_busy;
							mem_busy<='0';

						when X"D4" => -- SPI read (blocking)
							spi_active<='1';

						-- Read from PS/2 regs
						when X"E0" =>
							mem_read<=(others =>'0');
							mem_read(11 downto 0)<=kbdrecvreg & '1' & kbdrecvbyte(10 downto 1);
							kbdrecvreg<='0';
							mem_busy<='0';

						when X"E4" =>
							mem_read<=(others =>'0');
							mem_read(13 downto 0)<=mouse_init & mouse_fourbyte & mouserecvreg & not mousesendbusy & mouserecvbyte(10 downto 1);
							mouserecvreg<='0';
							mem_busy<='0';

						when X"50" => -- Host mouse data
							mem_read<=(others =>'0');
							mem_read(0)<=mouse_idle;
							mem_busy<='0';

						when others =>
							mem_busy<='0';
							null;
					end case;

				when others => -- SDRAM
					mem_busy<='0';
			end case;
		end if;
		
		-- SPI cycles

		if spi_active='1' and spi_busy='0' then
			mem_read<=spi_to_host;
			spi_active<='0';
			mem_busy<='0';
		end if;

		-- Set this after the read operation has potentially cleared it.
		if ser_rxint='1' then
			ser_rxrecv<='1';
		end if;

		if kbdrecv='1' then
			kbdrecvreg <= '1'; -- remains high until cleared by a read
		end if;
		if mouserecv='1' then
			mouserecvreg <= '1'; -- remains high until cleared by a read
		end if;	

		if host_bootdata_req='1' and host_bootdata_pending='1' then
			host_bootdata_ack_r<='1';
			host_bootdata_pending<='0';
		elsif host_bootdata_ack_r='1' and host_bootdata_req='0' then
			host_bootdata_ack_r<='0';
			mem_busy<='0';
		end if;
		
	end if; -- rising-edge(clk)

end process;
	
end architecture;
