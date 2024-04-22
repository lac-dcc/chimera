----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:38:52 06/21/2020 
-- Design Name: 
-- Module Name:    Top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- low power modes
--library METAMOR;
-- package attribtues contains declaration of the Metamor --specific synthesis attributes
--use METAMOR.attributes.all;

entity Top is
    Port ( 
	-- clock
	   q50m : in std_logic;
	   nres : in std_logic;
	
	-- config
	   graphic: in std_logic;	-- from I/O, select charset
	   
	-- CPU interface
	   A : in  STD_LOGIC_VECTOR (15 downto 0);
           D : inout  STD_LOGIC_VECTOR (7 downto 0);
           vda : in  STD_LOGIC;
           vpa : in  STD_LOGIC;
	   rwb : in std_logic;
           phi2 : inout  STD_LOGIC;	-- with pull-up to go to 5V
	   rdy_in : in std_logic;	-- is input only (bi-dir on '816, but hardware only allows in)
	   vpb : in std_logic;
	   e : in std_logic;
	   mlb: in std_logic;
	   mx : in std_logic;

	-- I/O interface
	   phi2_io: inout std_logic;

	-- V/RAM interface
	   VA : out std_logic_vector (18 downto 0);	-- 512k
	   FA : out std_logic_vector (18 downto 15);	-- 512k, mappable in 32k blocks
	   VD : inout std_logic_vector (7 downto 0);
	   
	   nvramsel : out STD_LOGIC;
	   nframsel : out STD_LOGIC;
	   ramrwb : out std_logic;

	-- ROM, I/O (on CPU bus)
	   nsel1 : out STD_LOGIC;
	   nsel2 : out STD_LOGIC;
	   nsel4 : out STD_LOGIC;
	   
	-- video out
           pxl : out  STD_LOGIC;
           vsync : out  STD_LOGIC;
           hsync : out  STD_LOGIC;
	   dclk : out std_logic;
	   dena : out std_logic;
	   pet_vsync: out std_logic;
	   
	-- SPI
	   spi_out : out std_logic;
	   spi_clk : out std_logic;
	   -- MISO
	   spi_in1  : in std_logic;
	   spi_in3  : in std_logic;
	   -- selects
	   nflash : out std_logic;	-- in1
	   spi_nsel2 : out std_logic;	-- in1
	   spi_nsel3 : out std_logic;	-- sd card, in3
	   spi_nsel4 : out std_logic;	-- in1
	   spi_nsel5 : out std_logic	-- in1
	   
	   
	-- Debug
--	   dbg_out: out std_logic;
--	   test: out std_logic;
--	   unused: in std_logic_vector(24 downto 0)
	 );
end Top;

architecture Behavioral of Top is

	attribute LOWPWR: string;
	
	attribute NOREDUCE : string;
	
	-- Initial program load
	signal ipl: std_logic;		-- Initial program load from SPI flash
	constant ipl_addr: std_logic_vector(18 downto 8) := "00011111111";	-- top most RAM page in bank 0
	signal ipl_state: std_logic;	-- 00 = send addr, 01=read block
	signal ipl_state_d: std_logic;	-- 00 = send addr, 01=read block
	signal ipl_cnt: std_logic_vector(11 downto 0); -- 11-4: block address count, 3-0: SPI state count
	signal ipl_out: std_logic;	-- SPI output from IPL to flash
	signal ipl_next: std_logic;	-- start next phase
	
	-- clock
	signal dotclk: std_logic;
	signal dot2clk: std_logic;
	signal dot4clk: std_logic;
	signal slotclk: std_logic;
	signal pxl_window: std_logic;
	signal chr_window: std_logic;
	signal sr_load: std_logic;
	
	signal memclk: std_logic;
	signal intclk: std_logic;
	signal clk1m: std_logic;
	signal clk2m: std_logic;
	signal clk4m: std_logic;
	
	signal phi2_int: std_logic;
	signal phi2_int2: std_logic;
	signal phi2_out: std_logic;
	signal phi2_io_out: std_logic;
	signal is_cpu: std_logic;
	signal is_cpu_trigger: std_logic;
	signal rdy_out: std_logic;
	
	signal phi2_x: std_logic;
		
	-- CPU memory mapper
	signal cfgld_in: std_logic;
	signal ma_out: std_logic_vector(18 downto 8);
	signal ma_vout: std_logic_vector(13 downto 11);
	signal m_framsel_out: std_logic;
	signal m_vramsel_out: std_logic;
	signal m_ffsel_out: std_logic;
	signal nvramsel_int: std_logic;
	signal nframsel_int: std_logic;
	signal m_iosel: std_logic;

	signal sel0 : std_logic;
	signal sel8 : std_logic;

	signal mode : std_logic_vector(1 downto 0);
	signal boot : std_logic;
	signal wp_rom9 : std_logic;
	signal wp_romA : std_logic;
	signal wp_romB : std_logic;
	signal wp_romPET : std_logic;
	signal is8296 : std_logic;
	signal lowbank : std_logic_vector(3 downto 0);
	signal vidblock : std_logic_vector(2 downto 0);
	signal lockb0 : std_logic;
	signal forceb0 : std_logic;
	signal movesync : std_logic;
	
	-- video
	signal va_out: std_logic_vector(15 downto 0);
	attribute LOWPWR of va_out: signal is "on";
	
	signal vd_in: std_logic_vector(7 downto 0);
	--attribute LOWPWR of vd_in: signal is "on";
	
	signal vis_enable: std_logic;
	signal vis_80_in: std_logic;
	signal vis_hires_in: std_logic;
	signal vis_double_in: std_logic;
	signal is_vid_out: std_logic;
	signal is_char_out: std_logic;
	signal vgraphic: std_logic;
	signal screenb0: std_logic;
	signal interlace : std_logic;

	signal is_vid_out_x: std_logic;
	
	signal v_dbg_out: std_logic;
	
	-- cpu
	signal ca_in: std_logic_vector(15 downto 0);
	attribute LOWPWR of ca_in: signal is "on";
	
	signal cd_in: std_logic_vector(7 downto 0);
	--attribute LOWPWR of cd_in: signal is "on";
	
	signal reset: std_logic;
	signal wait_ram: std_logic;
	signal wait_int: std_logic;
	signal wait_int_d: std_logic;
	signal ramrwb_int: std_logic;
	signal do_cpu : std_logic;
	signal memclk_d : std_logic;
	
	-- SPI
	signal spi_dout : std_logic_vector(7 downto 0);
	attribute LOWPWR of spi_dout: signal is "on";

	signal spi_cs : std_logic;
	signal spi_in : std_logic;
	signal spi_sel : std_logic_vector(2 downto 0);
	attribute LOWPWR of spi_sel: signal is "on";
	
	signal spi_outx : std_logic;
	signal spi_clkx : std_logic;
		
	-- components
	
	component Clock is
	  Port (
	   qclk 	: in std_logic;		-- input clock
	   reset	: in std_logic;
	   
	   memclk 	: out std_logic;	-- memory access clock signal
	   intclk	: out std_logic;	-- internal register load from CPU
	   
	   clk1m 	: out std_logic;	-- trigger CPU access @ 1MHz
	   clk2m	: out std_logic;	-- trigger CPU access @ 2MHz
	   clk4m	: out std_logic;	-- trigger CPU access @ 4MHz
	   
	   dotclk	: out std_logic;	-- pixel clock for video (12.5 MHz)
	   dot2clk	: out std_logic;	-- half the pixel clock (6.25 MHz)
	   dot4clk	: out std_logic;	-- 1/4 the pixel clock (3.125 MHz)
	   slotclk	: out std_logic;	-- 1 slot = 8 pixel; 1 slot = 2 memory accesses, one for char, one for pixel data (at end of slot)
	   chr_window	: out std_logic;	-- 1 during character fetch window
	   pxl_window	: out std_logic;	-- 1 during pixel fetch window (end of slot)
	   sr_load	: out std_logic		-- load pixel SR on falling edge of dotclk when this is set
	 );
	end component;
	   
	component Mapper is
	  Port ( 
	   A : in  STD_LOGIC_VECTOR (15 downto 8);
           D : in  STD_LOGIC_VECTOR (7 downto 0);
	   reset : in std_logic;
	   phi2: in std_logic;
	   vpa: in std_logic;
	   vda: in std_logic;
	   vpb: in std_logic;
	   rwb : in std_logic;
	   
	   qclk : in std_logic;
	   
           cfgld : in  STD_LOGIC;	-- set when loading the cfg
	   
           RA : out std_logic_vector (18 downto 8);	-- mapped CPU address (FRAM)
	   VA : out std_logic_vector (13 downto 11);	-- separate VRAM address for screen win
	   ffsel: out std_logic;
	   iosel: out std_logic;
	   vramsel: out std_logic;
	   framsel: out std_logic;

	   boot: in std_logic;
	   lowbank: in std_logic_vector(3 downto 0);
	   vidblock: in std_logic_vector(2 downto 0);
	   wp_rom9: in std_logic;
	   wp_romA: in std_logic;
	   wp_romB: in std_logic;
	   wp_romPET: in std_logic;

	   forceb0: in std_logic;
	   screenb0: in std_logic;
	   
	   dbgout: out std_logic
	  );
	end component;
	
	component Video is
	  Port ( 
	   A : out  STD_LOGIC_VECTOR (15 downto 0);
           D : in  STD_LOGIC_VECTOR (7 downto 0);
	   CPU_D : in std_logic_vector (7 downto 0);
	   phi2 : in std_logic;
	   
	   pxl_out: out std_logic;	-- video bitstream
	   dena   : out std_logic;	-- display enable
           v_sync : out  STD_LOGIC;
           h_sync : out  STD_LOGIC;
	   pet_vsync: out std_logic;	-- for the PET screen interrupt

	   is_enable: in std_logic;	-- is display enabled
           is_80_in : in STD_LOGIC;	-- is 80 column mode?
	   is_hires : in std_logic;	-- is hires mode?
	   is_graph : in std_logic;	-- from PET I/O
	   is_double: in std_logic;	-- when set, use 50 char rows / 400 pixel rows
	   is_nowrap: in std_logic;
	   interlace: in std_logic;
	   movesync:  in std_logic;
	   
	   crtc_sel : in std_logic;	-- select line for CRTC
	   crtc_rs  : in std_logic;	-- register select
	   crtc_rwb : in std_logic;	-- r/-w
	   
	   qclk: in std_logic;		-- Q clock
	   dotclk : in std_logic;	-- 25MHz in (VGA timing)
	   dot2clk : in std_logic;
           memclk : in STD_LOGIC;	-- system clock 8MHz
	   slotclk : in std_logic;
	   chr_window : in std_logic;
	   pxl_window : in std_logic;
	   sr_load : in std_logic;
	   
           is_vid : out STD_LOGIC;	-- true during video access phase
	   is_char: out std_logic;	-- map character data fetch
	   
	   dbg_out: out std_logic;
	   
	   reset : in std_logic
	 );
	end component;

	component SPI is
	  Port ( 
	   DIN : in  STD_LOGIC_VECTOR (7 downto 0);
	   DOUT : out  STD_LOGIC_VECTOR (7 downto 0);
	   RS: in std_logic_vector(1 downto 0);
	   RWB: in std_logic;
	   CS: in std_logic;	-- includes clock
	   
	   serin: in std_logic;
	   serout: out std_logic;
	   serclk: out std_logic;
	   sersel: out std_logic_vector(2 downto 0);	   
	   spiclk : in std_logic;
	   spislowclk : in std_logic;
	   
	   ipl: in std_logic;
	   reset : in std_logic
	 );
	end component;

	function To_Std_Logic(L: BOOLEAN) return std_ulogic is
	begin
		if L then
			return('1');
		else
			return('0');
		end if;
	end function To_Std_Logic;

begin

--	unused <= (others => '0');
--	test <= '0';
	

	clocky: Clock
	port map (
	   q50m,
	   reset,
	   memclk,
	   intclk,
	   clk1m,
	   clk2m,
	   clk4m,
	   dotclk,
	   dot2clk,
	   dot4clk,
	   slotclk,
	   chr_window,
	   pxl_window,
	   sr_load
	);

--	reset_p: process(q50m)
--	begin
--		if (rising_edge(q50m)) then
			reset <= not(nres);
--		end if;
--	end process;
	
	-- define CPU slots.
	-- mode(1 downto 0): 00=1MHz, 01=2MHz, 10=4MHz, 11=Max speed

	is_cpu_trigger <= '1'	when mode = "11" else
			clk4m	when mode = "10" else
			clk2m	when mode = "01" else
			clk1m;

	-- depending on mode, goes high when we have a CPU access pending,
	-- and else low when a CPU access is done
	is_cpu_p: process(reset, is_cpu_trigger, is_cpu, do_cpu, mode, memclk)
	begin
		if (reset = '1') then
			is_cpu <= '0';
		elsif (mode = "11") then
			is_cpu <= '1';
		elsif falling_edge(memclk) then
			if (is_cpu_trigger = '1') then
				is_cpu <= '1';
			elsif (do_cpu = '1') then
				is_cpu <= '0';
			end if;
		end if;
	end process;
	
	-- note: 
	-- m_ramsel_out depends on bankl, which is qualified with rising edge of qclk
	-- memclk is created at falling edge of qclk
	-- is_vid is qualified with rising edge of qclk, but depends on pxl/char_window
	-- that is created at same falling edge of qclk as when memclk falls low
	-- so is_vid is early, but goes low at same falling edge as memclk
	wait_ram <= '1' when m_vramsel_out = '1' and is_vid_out = '1' else	-- video access in RAM
			'0';
	
	-- stretch clock such that we approx. one cycle per is_cpu_trigger (1, 2, 4MHz)
	-- wait_int rises with falling edge of memclk (see trigger above), or is 
	-- constant low (full speed)
	wait_int <= not(is_cpu) or ipl;
	
	wait_p: process(memclk, reset)
	begin
		if (reset = '1') then
			wait_int_d <= '1';
		elsif (rising_edge(memclk)) then
			wait_int_d <= wait_int;
		end if;
	end process;

	-- delay needed in defining do_cpu, as it needs to wait
	-- for the address decoding to happen
	memclk_p: process(memclk, q50m, reset)
	begin
		if (reset = '1') then
			memclk_d <= '0';
		elsif (falling_edge(q50m)) then
			memclk_d <= memclk;
		end if;
	end process;
	
	release2_p: process(memclk_d, reset)
	begin
		if (reset = '1') then
			do_cpu <= '0';
		elsif (rising_edge(memclk_d)) then
			if (wait_ram = '0' 
				and is_cpu='1'
				and ipl='0'
				) then
				do_cpu <= '1';
			else
				do_cpu <= '0';
			end if;
		end if;
	end process;
	

	-- Note if we use phi2 without setting it high on waits (and would use RDY instead), 
	-- the I/O timers will always count on 8MHz - which is not what we want (at 1MHz at least)
	phi2_int <= memclk or not(do_cpu);
	phi2_int2 <= intclk or not(do_cpu);
	
	-- split phi2, stretched phi2 for the CPU to accomodate for waits.
	-- for full speed, don't delay VIA timers
	phi2_out <= phi2_int;
	phi2_io_out <= memclk when mode="11" else
			phi2_int;
	rdy_out <= '1';

	-- to run the VIA timers at full speed all the time use this
	--phi2_out <= memclk;
	--phi2_io <= memclk;
	--rdy_out <= do_cpu;
	
	
	-- use a pullup and this mechanism to drive a 5V signal from a 3.3V CPLD
	-- According to UG445 Figure 7: push up until detected high, then let pull up resistor do the rest.
	-- data_to_pin<= data  when ((data and data_to_pin) ='0') else 'Z';	
	--phi2 <= phi2_int when ((phi2_int and phi2) = '0') else 'Z';
	phi2 <= phi2_out when ((phi2_out and phi2) = '0') else 'Z';
	phi2_io <= phi2_io_out when ((phi2_io_out and phi2_io) = '0') else 'Z';
	
	-- we do split phi2, i.e. CPU gets a stretched clock, while VIA timer a normal one.
	-- this way we can avoid using RDY as control line to the CPU, which requires additional
	-- parts to protect the CPU, as RDY on the '816 is a bidirectional pin!
	--rdy  <= rdy_out when ((rdy_out and rdy) = '0') else 'Z';
	
	------------------------------------------------------
	-- CPU memory mapper
	
	cd_in <= D;
	ca_in <= A;
		
	mappy: Mapper
	port map (
	   ca_in(15 downto 8),
           cd_in,
	   reset,
	   phi2_int,
	   vpa,
	   vda,
	   vpb,
	   rwb,
	   q50m,
           cfgld_in,
	   ma_out,
	   ma_vout,
	   m_ffsel_out,
	   m_iosel,
	   m_vramsel_out,
	   m_framsel_out,
	   boot,
	   lowbank,
	   vidblock,
	   wp_rom9,
	   wp_romA,
	   wp_romB,
	   wp_romPET,
	   forceb0,
	   screenb0
	);

	forceb0 <= '1' when lockb0 = '1' and e = '1' else
		'0';
		
	cfgld_in <= '1' when is8296 = '1' and m_ffsel_out ='1' and ca_in(7 downto 0) = x"F0" else '0';

	-- internal selects
	sel0 <= '1' when m_iosel = '1' and ca_in(7 downto 4) = x"0" else '0';
	sel8 <= '1' when m_iosel = '1' and ca_in(7 downto 4) = x"8" else '0';
	
	-- external selects are inverted
	nsel1 <= '0' when m_iosel = '1' and ca_in(7 downto 4) = x"1" else '1';
	nsel2 <= '0' when m_iosel = '1' and ca_in(7 downto 4) = x"2" else '1';
	nsel4 <= '0' when m_iosel = '1' and ca_in(7 downto 4) = x"4" else '1';
	
	-- test when we have a CPU cycle
	--nsel1 <= is_cpu;
	--nsel1 <= is_vid_out;
	--nsel1 <= m_vramsel_out;
	-- when do we have an SPI read data cycle
	--nsel2 <= To_Std_Logic(sel0 = '1' and ca_in(3) = '1' and ca_in(2) = '0' and phi2_int = '1'
	--		and ca_in(1) = '0' and ca_in(0)='1' and rwb = '1');
	--nsel4 <= boot;
	
	------------------------------------------------------
	-- video
	--
	viccy: Video
	port map (
		va_out,
		vd_in,
		cd_in, 
		phi2_int2,
		pxl,
		dena,
		vsync,
		hsync,
		pet_vsync,
		vis_enable,
		vis_80_in,
		vis_hires_in,
		vgraphic,
		vis_double_in,
		'1',
		interlace,
		movesync,
		sel8,
		ca_in(0),
		rwb,
		q50m,		-- Q clock (50MHz)
		dotclk,
		dot2clk,
		memclk,		-- sysclk (~8MHz)
		slotclk,
		chr_window,
		pxl_window,
		sr_load,
		is_vid_out,
		is_char_out,
		v_dbg_out,
		reset
	);

	phi2_x <= phi2_io_out and not(dotclk);
	
	-- switch with is_vid_out to disable video memory accesses
	is_vid_out_x <= '0';
	
	vgraphic <= graphic;
	
	dclk <= dotclk;
	
	------------------------------------------------------
	-- SPI interface
	
	spi_comp: SPI
	port map (
	   cd_in,
	   spi_dout,
	   ca_in(1 downto 0),
	   rwb,
	   spi_cs,
	   spi_in,
	   spi_outx,
	   spi_clkx,
	   spi_sel,
	   memclk,
	   dot4clk,
	   
	   ipl_state,
	   reset
	);

	-- CPU access to SPI registers
--	spi_cs <= To_Std_Logic(sel0 = '1' and ca_in(3) = '1' and ca_in(2) = '0' and phi2_int = '1');
	spi_cs <= '1' when phi2_int = '1' 
			and sel0 = '1'			-- $e80x
			and ca_in(3 downto 2) = "10"	-- $e808-$e80b
			else
			'0';
			
	-- SPI serial data in - shared except IN3 for SD card
	spi_in <= spi_in3 when spi_sel = "011" else
			spi_in1;
	
	-- SPI serial data out
	spi_out <= ipl_out	when ipl = '1' 	else
		spi_outx;
	-- SPI serial clock
	spi_clk <= ipl_cnt(0)	when ipl = '1' and ipl_state = '0' else
		spi_clkx;
		
	-- SPI select lines
	-- select flash chip
	nflash <= '1'		when reset = '1' else
			'0' 	when ipl = '1'	else
			'0'	when spi_sel = "001" else
			'1';
		
	spi_nsel2 <= '1'	when reset = '1' else
			'0' 	when spi_sel = "010" else
			'1';
	spi_nsel3 <= '1'	when reset = '1' else
			'0' 	when spi_sel = "011" else
			'1';
--	spi_nsel3 <= v_dbg_out;
	
	spi_nsel4 <= '1'	when reset = '1' else
			'0' 	when spi_sel = "100" else
			'1';
	spi_nsel5 <= '1'	when reset = '1' else
			'0' 	when spi_sel = "101" else
			'1';
		
	------------------------------------------------------
	-- control
	
	-- store video control register $e800
	--
	-- D0 	: 1= hires
	-- D1	: 1= 80 column
	-- D2-7	: reserved, must be 0
	--
	Ctrl_P: process(sel0, phi2_int, rwb, reset, ca_in, D)
	begin
		if (reset = '1') then
			vis_hires_in <= '0';
			vis_80_in <= '0';
			vis_enable <= '1';
			vis_double_in <= '0';
			interlace <= '0';
			mode <= "00";
			screenb0 <= '1';
			wp_rom9 <= '0';
			wp_romA <= '0';
			wp_romPET <= '0';
			is8296 <= '0';
			lowbank <= (others => '0');
			-- standard PET CRTC base address is at CRTC's $1000
			-- instead of $0000, translating to $9000 in VRAM
			-- So, we need to select first map on reset
			vidblock <= "010"; --(others => '0');	--"01";	
			boot <= '1';
			lockb0 <= '0';
			movesync <= '0';
		elsif (falling_edge(phi2_int) and sel0='1' and rwb='0' and ca_in(3) = '0') then
			-- Write to $E80x
			case (ca_in(2 downto 0)) is
			when "000" =>
				vis_hires_in <= D(0);
				vis_80_in <= D(1);
				screenb0 <= not(D(2));
				vis_double_in <= D(3);
				interlace <= D(4);
				movesync <= D(6);
				vis_enable <= not(D(7));
			when "001" =>
				lockb0 <= D(0);
				boot <= D(1);
				is8296 <= D(3);
				wp_rom9 <= D(4);
				wp_romA <= D(5);
				wp_romB <= D(6);
				wp_romPET <= D(7);
			when "010" =>
				lowbank <= D(3 downto 0);
			when "011" =>
				mode(1 downto 0) <= D(1 downto 0); -- speed bits
			when "101" =>
				vidblock <= D(2 downto 0);
			when others =>
				null;
			end case;
		end if;
	end process;

	-- RAM address
	VA(7 downto 0) <= 	ipl_cnt(11 downto 4)	when ipl = '1'		else
				ca_in(7 downto 0) 	when is_vid_out = '0' 	else 
				va_out(7 downto 0);
	VA(14 downto 14) <= 	ipl_addr(14 downto 14) 	when ipl = '1'		else 	-- IPL
				ma_out(14 downto 14) 	when is_vid_out = '0' 	else 	-- CPU
				va_out(14 downto 14);					-- Video
	VA(13 downto 11) <= 	ipl_addr(13 downto 11) 	when ipl = '1'		else 	-- IPL
				ma_vout(13 downto 11) 	when is_vid_out = '0' 	else 	-- CPU
				va_out(13 downto 11);					-- Video
	VA(10 downto 8) <= 	ipl_addr(10 downto 8) 	when ipl = '1'		else 	-- IPL
				ma_out(10 downto 8) 	when is_vid_out = '0' 	else 	-- CPU
				va_out(10 downto 8);					-- Video
	VA(15) <= 		ipl_addr(15)		when ipl = '1'		else	-- IPL
				ma_out(15) 		when is_vid_out = '0' 	else 	-- CPU
				va_out(15);						-- Video
--				'1';		-- show init / boot code (see VA14-8)
	VA(18 downto 16) <= 	ipl_addr(18 downto 16)	when ipl = '1'		else	-- IPL
				ma_out(18 downto 16) 	when is_vid_out = '0' 	else	-- CPU access
				"000";
				
	FA(18 downto 16) <= 	ma_out(18 downto 16);
	FA(15) <=		ma_out(15);
	
	-- RAM data in for video fetch
	--vd_in <= x"EA"; --D; --VD;
	vd_in <= VD;
	
	-- RAM R/W (only for video RAM, FRAM gets /WE from CPU's RWB)

	ramrwb_int <= 
		'0'	when ipl = '1' else		-- IPL loads data into RAM
		'1' 	when is_vid_out ='1'    	-- Video reads
			  or m_vramsel_out ='0' 	-- not selected
			  or memclk='0' else		-- protect during memclk low
		rwb;
		
	ramrwb <= ramrwb_int;
	
	-- data transfer between CPU data bus and video/memory data bus
	
	VD <= 	spi_dout	when ipl = '1' 		else	-- IPL
		D 		when ramrwb_int = '0'	else	-- CPU write
		(others => 'Z');
		
--	D <= 	VD when is_vid_out='0' 
----		x"EA" when is_vid_out='0'	-- NOP sled
--			and rwb='1' 
--			and m_vramsel_out ='1' 
--			and phi2_int='1' 
--			and is_cpu='1' 	-- do not bleed video access into system bus when waiting but breaks timing
--		else
--		spi_dout when spi_cs = '1'
--			and rwb = '1'
--		else
--			(others => 'Z');
	D <= 	(others => 'Z') when phi2_int = '0'
			or rwb = '0'
		else VD when m_vramsel_out = '1'
		else spi_dout when spi_cs = '1'
		else (others => 'Z');
		
	-- select RAM
	
	nframsel_int <= '1'	when memclk = '0' else
			'0'	when m_framsel_out = '1' else
			'1';
	
	nvramsel_int <= '1'	when memclk = '0' else	-- inactive after previous access
			'0'	when ipl = '1' else	-- IPL loads data into RAM
			'0' 	when is_vid_out='1' else
			'0' 	when wait_int_d = '0' and m_vramsel_out ='1' else
			'1';
		
	nframsel <= nframsel_int;
	nvramsel <= nvramsel_int;

	
	------------------------------------------------------
	-- IPL logic
	
	ipl_p: process(memclk, reset)
	begin
		if (reset = '1') then 
			ipl_state <= '0';
			ipl_cnt <= (others => '0');
			ipl_out <= '0';
			ipl <= '1';
		elsif (falling_edge(memclk) and ipl = '1') then
		
			--ipl <= '0';	-- block IPL to test
			
			if (ipl_state_d = '0') then
				-- initial count and SPI Flash read command
				if (ipl_cnt >= "000000001011"
					and ipl_cnt <= "000000001110") then
					ipl_out <= '1';
				else
					ipl_out <= '0';
				end if;
				
				if (ipl_next = '1') then
					ipl_state <= '1';
					ipl_cnt <= (others => '0');
				else
					ipl_cnt <= ipl_cnt + 1;
				end if;
			else
				-- read block
				if (ipl_next = '1') then
					ipl <= '0';
					ipl_state <= '0';
				else
					ipl_cnt <= ipl_cnt + 1;
				end if;
				ipl_out <= '0';
			end if;
		end if;
	end process;
	
	ipl_state_p: process(reset, memclk, ipl_state)
	begin
		if (reset = '1') then
			ipl_state_d <= '0';
		elsif (rising_edge(memclk)) then
			ipl_state_d <= ipl_state;
			
			ipl_next <= '0';
			if (ipl_state = '0') then
				if (ipl_cnt = "000001000000") then
					ipl_next <= '1';
				end if;
			else
				if (ipl_cnt = "111111111111") then
					ipl_next <= '1';
				end if;
			end if;
		end if;
	end process;
	
end Behavioral;

