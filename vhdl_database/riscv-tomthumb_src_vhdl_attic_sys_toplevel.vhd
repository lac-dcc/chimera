library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.constants.all;

entity sys_toplevel is
	Port(
		I_clk: in std_logic;
		I_en: in std_logic := '1';
		I_reset: in std_logic := '0';
		I_serial_rx: in std_logic;

		O_addr: out std_logic_vector(XLEN-1 downto 0);
		O_data: out std_logic_vector(XLEN-1 downto 0);
		O_leds: out std_logic_vector(7 downto 0);
		O_serial_tx: out std_logic;
		O_busy: out std_logic
	);
end sys_toplevel;


architecture Behavioral of sys_toplevel is

	component arbiter
		Port(
			I_addr: in std_logic_vector(31 downto 0);
			I_busy0, I_busy1, I_busy2, I_busy3: in std_logic;
			I_data0, I_data1, I_data2, I_data3: in std_logic_vector(31 downto 0);
			I_en: in std_logic;
			O_busy: out std_logic;
			O_data: out std_logic_vector(31 downto 0);
			O_en0, O_en1, O_en2, O_en3: out std_logic
		);	
	end component;
	
	component arbiter_dummy
		Port(
			I_addr: in std_logic_vector(31 downto 0);
			I_clk: in std_logic;
			I_data: in std_logic_vector(31 downto 0);
			I_en: in std_logic;
			I_write: in std_logic;
			O_busy: out std_logic;
			O_data: out std_logic_vector(31 downto 0)
		);	
	end component;


	component cpu_toplevel
		Port(
			I_clk: in std_logic;
			I_en: in std_logic;
			I_reset: in std_logic;

			I_memdata: in std_logic_vector(XLEN-1 downto 0);
			I_membusy: in std_logic;
			O_memdata: out std_logic_vector(XLEN-1 downto 0);
			O_memaddr: out std_logic_vector(XLEN-1 downto 0);
			O_memen: out std_logic := '0';
			O_memwrite: out std_logic := '0'
		);	
	end component;
	
	component leds
		Port(
			I_addr: in std_logic_vector(31 downto 0);
			I_clk: in std_logic;
			I_data: in std_logic_vector(31 downto 0);
			I_en: in std_logic;
			I_write: in std_logic;
			O_busy: out std_logic;
			O_data: out std_logic_vector(31 downto 0);
			O_leds: out std_logic_vector(7 downto 0)
		);	
	end component;
	
	
	component ram
		Port(
			I_clk: in std_logic;
			I_en: in std_logic;
			I_write: in std_logic;
			I_addr: in std_logic_vector(XLEN-1 downto 0);
			I_data: in std_logic_vector(XLEN-1 downto 0);
			O_data: out std_logic_vector(XLEN-1 downto 0);
			O_busy: out std_logic
		);	
	end component;
	

	component serial
		Port(
			I_clk: in std_logic;
			I_en: in std_logic;
			I_addr: in std_logic_vector(31 downto 0);
			I_data: in std_logic_vector(31 downto 0);
			I_rx: in std_logic;
			I_write: in std_logic;
			O_tx: out std_logic;
			O_busy: out std_logic;
			O_data: out std_logic_vector(31 downto 0)
		);	
	end component;
	
	component wizpll
		PORT(
			inclk0		: IN STD_LOGIC  := '0';
			c0		: OUT STD_LOGIC 
		);
	end component;
	
	signal arb_busy, arb_en0, arb_en1, arb_en2, arb_en3: std_logic;
	signal arb_data: std_logic_vector(XLEN-1 downto 0);
	
	signal cpu_memdata: std_logic_vector(XLEN-1 downto 0);
	signal cpu_memaddr: std_logic_vector(XLEN-1 downto 0);
	signal cpu_memen: std_logic := '0';
	signal cpu_memwrite: std_logic := '0';
	
	signal dummy3_data: std_logic_vector(XLEN-1 downto 0);
	signal dummy3_busy: std_logic;

	signal inv_clk: std_logic;
	signal inv_reset: std_logic;
	
	signal led_busy: std_logic;
	signal led_data: std_logic_vector(XLEN-1 downto 0);
	
	signal pll_clk: std_logic;
	
	signal ram_busy: std_logic := '0';
	signal ram_data: std_logic_vector(XLEN-1 downto 0);
	
	signal serial_busy: std_logic;
	signal serial_data: std_logic_vector(XLEN-1 downto 0);



begin

	arbiter_instance: arbiter port map(
		I_addr => cpu_memaddr,
		I_busy0 => ram_busy,
		I_busy1 => led_busy,
		I_busy2 => serial_busy,
		I_busy3 => dummy3_busy,
		I_data0 => ram_data,
		I_data1 => led_data,
		I_data2 => serial_data,
		I_data3 => dummy3_data,
		I_en => cpu_memen,
		O_busy => arb_busy,
		O_data => arb_data,
		O_en0 => arb_en0,
		O_en1 => arb_en1,
		O_en2 => arb_en2,
		O_en3 => arb_en3
	);

	cpu_instance: cpu_toplevel port map(
		I_clk => pll_clk,
		I_en => I_en,
		I_reset => inv_reset,
		I_memdata => arb_data,
		I_membusy => arb_busy,
		O_memdata => cpu_memdata,
		O_memaddr => cpu_memaddr,
		O_memen => cpu_memen,
		O_memwrite => cpu_memwrite
	);
	
	
	-- I/O device 0
	ram_instance: ram port map(
		I_clk => inv_clk,
		I_en => arb_en0,
		I_write => cpu_memwrite,
		I_addr => cpu_memaddr,
		I_data => cpu_memdata,
		O_data => ram_data,
		O_busy => ram_busy
	);
	
	-- I/O device 1
	leds_instance: leds port map(
		I_clk => inv_clk,
		I_en => arb_en1,
		I_write => cpu_memwrite,
		I_addr => cpu_memaddr,
		I_data => cpu_memdata,
		O_data => led_data,
		O_busy => led_busy,
		O_leds => O_leds
	);
	
	-- I/O device 2
	serial_instance: serial port map(
		I_clk => inv_clk,
		I_en => arb_en2,
		I_addr => cpu_memaddr,
		I_data => cpu_memdata,
		I_rx => I_serial_rx,
		I_write => cpu_memwrite,
		O_tx => O_serial_tx,
		O_busy => serial_busy,
		O_data => serial_data
	);
	
	-- I/O device 3
	dummy3: arbiter_dummy port map(
			I_addr => cpu_memaddr,
			I_clk => inv_clk,
			I_data => cpu_memdata,
			I_en => arb_en3,
			I_write => cpu_memwrite,
			O_busy => dummy3_busy,
			O_data => dummy3_data
	);
	
	pll_instance: wizpll port map(
			inclk0 => I_clk,
			c0		=> pll_clk
	);


	inv_clk <= not pll_clk;
	inv_reset <= not I_reset;

	O_addr <= cpu_memaddr;
	O_data <= cpu_memdata;
	O_busy <= arb_busy;
	

end Behavioral;