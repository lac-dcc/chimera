library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.ALL;

library UNISIM;
use UNISIM.VComponents.all;

library work ;
use work.logi_wishbone_pack.all ;
use work.logi_wishbone_peripherals_pack.all ;


entity sdram_fifo_test is
	port(
		OSC_FPGA : in std_logic ;
		LED :   out  std_logic_vector((2-1) downto 0);
		ARD_SCL, ARD_SDA : inout std_logic;
		
		--gpmc interface
		GPMC_CSN : in std_logic ;
		GPMC_BEN:	in std_logic_vector(1 downto 0);
		GPMC_WEN, GPMC_OEN, GPMC_ADVN :	in std_logic;
		GPMC_CLK :	in std_logic;
		GPMC_AD :	inout std_logic_vector(15 downto 0)	;
		-- DRAM INTERFACE
		
			SDRAM_CLK   : out   STD_LOGIC;
			SDRAM_CKE   : out   STD_LOGIC;
			SDRAM_CS    : out   STD_LOGIC;
			SDRAM_nRAS  : out   STD_LOGIC;
			SDRAM_nCAS  : out   STD_LOGIC;
			SDRAM_nWE   : out   STD_LOGIC;
			SDRAM_DQM   : out   STD_LOGIC_VECTOR( 1 downto 0);
			SDRAM_ADDR  : out   STD_LOGIC_VECTOR (12 downto 0);
			SDRAM_BA    : out   STD_LOGIC_VECTOR( 1 downto 0);
			SDRAM_DQ    : inout STD_LOGIC_VECTOR (15 downto 0)
	);
end sdram_fifo_test;

architecture structural of sdram_fifo_test is
	
constant sdram_address_width : natural := 24;
constant sdram_column_bits   : natural := 9;
constant sdram_startup_cycles: natural := 10100; -- 100us, plus a little more
constant cycles_per_refresh  : natural := (64000*100)/8192-1;	

component heart_beat is
    generic(clk_period_ns : positive := 10; 
				beat_period_ns : positive := 900_000_000;
				beat_length_ns : positive := 100_000_000);
	 port ( gls_clk : in  STD_LOGIC;
           gls_reset : in  STD_LOGIC;
           beat_out : out  STD_LOGIC);
end component;	

component wishbone_dram_fifo is
generic( ADDR_WIDTH: positive := 16; --! width of the address bus
			WIDTH	: positive := 16; --! width of the data bus
			FIFO_SIZE : positive := 8_000_000; --! fifo depth;
			BURST_SIZE : positive := 4;
			THRESHOLD : positive := 4;
			SYNC_LOGIC_INTERFACE : boolean := false;
			IS_READ : boolean := true ;
			sdram_address_width : positive := 24;
			CACHE_ADDRESS : std_logic_vector(31 downto 0) := (others => '0')
			); 
port(
	-- Syscon signals
	gls_reset    : in std_logic ;
	gls_clk      : in std_logic ;
	-- Wishbone signals
	wbs_address       : in std_logic_vector(ADDR_WIDTH-1 downto 0) ;
	wbs_writedata : in std_logic_vector( WIDTH-1 downto 0);
	wbs_readdata  : out std_logic_vector( WIDTH-1 downto 0);
	wbs_strobe    : in std_logic ;
	wbs_cycle      : in std_logic ;
	wbs_write     : in std_logic ;
	wbs_ack       : out std_logic;
		  
	refresh_active, flush_active : out std_logic ;	  
		  
	-- logic signals
	write_fifo, read_fifo : in std_logic ;
	fifo_input: in std_logic_vector((WIDTH - 1) downto 0); --! data input of fifo B
	fifo_output	: out std_logic_vector((WIDTH - 1) downto 0); --! data output of fifo A
	
	fifo_empty, fifo_full : out std_logic ;
	fifo_reset : out std_logic ;
	fifo_threshold : out std_logic;
	
	-- Interface to issue reads or write data
	cmd_ready         : in STD_LOGIC;                     -- '1' when a new command will be acted on
	cmd_enable        : out  STD_LOGIC;                     -- Set to '1' to issue new command (only acted on when cmd_read = '1')
	cmd_wr            : out  STD_LOGIC;                     -- Is this a write?
	cmd_address       : out  STD_LOGIC_VECTOR(sdram_address_width-2 downto 0); -- address to read/write
	cmd_byte_enable   : out  STD_LOGIC_VECTOR(3 downto 0);  -- byte masks for the write command
	cmd_data_in       : out  STD_LOGIC_VECTOR(31 downto 0); -- data for the write command

	sdram_data_out         : in STD_LOGIC_VECTOR(31 downto 0); -- word read from SDRAM
	sdram_data_ready    : in STD_LOGIC
);
end component;


	COMPONENT SDRAM_Controller
    generic (
      sdram_address_width : natural;
      sdram_column_bits   : natural;
      sdram_startup_cycles: natural;
      cycles_per_refresh  : natural;
		very_low_speed : natural := 0
    );
    PORT(
		clk             : IN std_logic;
		reset           : IN std_logic;
      
      -- Interface to issue commands
		cmd_ready       : OUT std_logic;
		cmd_enable      : IN  std_logic;
		cmd_wr          : IN  std_logic;
      cmd_address     : in  STD_LOGIC_VECTOR(sdram_address_width-2 downto 0); -- address to read/write
		cmd_byte_enable : IN  std_logic_vector(3 downto 0);
		cmd_data_in     : IN  std_logic_vector(31 downto 0);    
      
      -- Data being read back from SDRAM
		data_out        : OUT std_logic_vector(31 downto 0);
		data_out_ready  : OUT std_logic;

      -- SDRAM signals
		SDRAM_CLK       : OUT   std_logic;
		SDRAM_CKE       : OUT   std_logic;
		SDRAM_CS        : OUT   std_logic;
		SDRAM_RAS       : OUT   std_logic;
		SDRAM_CAS       : OUT   std_logic;
		SDRAM_WE        : OUT   std_logic;
		SDRAM_DQM       : OUT   std_logic_vector(1 downto 0);
		SDRAM_ADDR      : OUT   std_logic_vector(12 downto 0);
		SDRAM_BA        : OUT   std_logic_vector(1 downto 0);
		SDRAM_DATA      : INOUT std_logic_vector(15 downto 0)     
		);
	END COMPONENT;
	
	
	type wishbone_bus is
	record
		address : std_logic_vector(15 downto 0);
		writedata : std_logic_vector(15 downto 0);
		readdata : std_logic_vector(15 downto 0);
		cycle: std_logic;
		write : std_logic;
		strobe : std_logic;
		ack : std_logic;
	end record;
	
signal Master_0_wbm_Intercon_0_wbs_0 : wishbone_bus;	
signal Intercon_0_wbm_REG_0_wbs_0 : wishbone_bus;
signal Intercon_0_wbm_FIFO_0_wbs_0 : wishbone_bus;




signal gls_clk, gls_clk_unbuf,gls_reset, gls_resetn, clk_locked, clkfb, clkb : std_logic ;



signal fifo_write, pipeline_reset, fifo_full : std_logic ;
signal fifo_data : std_logic_vector(15 downto 0);

signal cmd_address     : std_logic_vector(sdram_address_width-2 downto 0) := (others => '0');
signal cmd_wr          : std_logic := '1';
signal cmd_enable      : std_logic;
signal cmd_byte_enable : std_logic_vector(3 downto 0);
signal cmd_data_in     : std_logic_vector(31 downto 0);
signal cmd_ready       : std_logic;
signal data_out        : std_logic_vector(31 downto 0);
signal data_out_ready  : std_logic;

-- need to make sure the sdram is booted before starting the system ...
signal sdram_ready : std_logic ;

signal clock_divider : std_logic_vector(3 downto 0);

signal refresh_active, flush_active, refresh_active_old, flush_active_old : std_logic ;
signal refresh_count, flush_count : std_logic_vector(15 downto 0);
signal refresh_base_address : std_logic_vector(15 downto 0);
signal write_count : std_logic_vector(31 downto 0);
begin


gls_reset <= (NOT clk_locked); -- system reset while clock not locked
gls_resetn <= NOT gls_reset ;
ARD_SCL <= 'Z';
--'Z' <= ARD_SCL;
ARD_SDA <= 'Z';
--'Z' <= ARD_SDA;


gpmc2wishbone : gpmc_wishbone_wrapper 
generic map(sync => true, burst => false)
port map
    (
      -- GPMC SIGNALS
      gpmc_ad => GPMC_AD, 
      gpmc_csn => GPMC_CSN,
      gpmc_oen => GPMC_OEN,
		gpmc_wen => GPMC_WEN,
		gpmc_advn => GPMC_ADVN,
		gpmc_clk => GPMC_CLK,
		
      -- Global Signals
      gls_reset => gls_reset,
      gls_clk   => gls_clk,
      -- Wishbone interface signals
     wbm_address =>  Master_0_wbm_Intercon_0_wbs_0.address,
		wbm_writedata =>  Master_0_wbm_Intercon_0_wbs_0.writedata,
		wbm_readdata =>  Master_0_wbm_Intercon_0_wbs_0.readdata,
		wbm_cycle =>  Master_0_wbm_Intercon_0_wbs_0.cycle,
		wbm_strobe =>  Master_0_wbm_Intercon_0_wbs_0.strobe,
		wbm_write =>  Master_0_wbm_Intercon_0_wbs_0.write,
		wbm_ack =>  Master_0_wbm_Intercon_0_wbs_0.ack	
    );
	 
	 
intercon0 : wishbone_intercon
generic map(memory_map => 
(
"00010000000000XX", -- reg0
"0000XXXXXXXXXXXX"
)
)
port map(
		gls_reset => gls_reset,
			gls_clk   => gls_clk,
		
		
		wbs_address =>  Master_0_wbm_Intercon_0_wbs_0.address,
		wbs_writedata =>  Master_0_wbm_Intercon_0_wbs_0.writedata,
		wbs_readdata =>  Master_0_wbm_Intercon_0_wbs_0.readdata,
		wbs_cycle =>  Master_0_wbm_Intercon_0_wbs_0.cycle,
		wbs_strobe =>  Master_0_wbm_Intercon_0_wbs_0.strobe,
		wbs_write =>  Master_0_wbm_Intercon_0_wbs_0.write,
		wbs_ack =>  Master_0_wbm_Intercon_0_wbs_0.ack,
		-- Wishbone master signals
		wbm_address(0) =>  Intercon_0_wbm_REG_0_wbs_0.address,
		wbm_address(1) =>  Intercon_0_wbm_FIFO_0_wbs_0.address,

		wbm_writedata(0) =>  Intercon_0_wbm_REG_0_wbs_0.writedata,
		wbm_writedata(1) =>  Intercon_0_wbm_FIFO_0_wbs_0.writedata,	
		
		wbm_readdata(0) =>  Intercon_0_wbm_REG_0_wbs_0.readdata,
		wbm_readdata(1) =>  Intercon_0_wbm_FIFO_0_wbs_0.readdata,

		wbm_cycle(0) =>  Intercon_0_wbm_REG_0_wbs_0.cycle,
		wbm_cycle(1) =>  Intercon_0_wbm_FIFO_0_wbs_0.cycle,


		wbm_strobe(0) =>  Intercon_0_wbm_REG_0_wbs_0.strobe,
		wbm_strobe(1) =>  Intercon_0_wbm_FIFO_0_wbs_0.strobe,	
		
		wbm_write(0) =>  Intercon_0_wbm_REG_0_wbs_0.write,
		wbm_write(1) =>  Intercon_0_wbm_FIFO_0_wbs_0.write,

		wbm_ack(0) =>  Intercon_0_wbm_REG_0_wbs_0.ack,
		wbm_ack(1) =>  Intercon_0_wbm_FIFO_0_wbs_0.ack

	
		
);
	reg0 : wishbone_register
	generic map(
		  nb_regs => 3
	 )
	 port map
	 (
			gls_reset => gls_reset,
			gls_clk   => gls_clk,


			wbs_address    => Intercon_0_wbm_REG_0_wbs_0.address,  	
			wbs_readdata   => Intercon_0_wbm_REG_0_wbs_0.readdata,  	
			wbs_writedata 	=> Intercon_0_wbm_REG_0_wbs_0.writedata,  
			wbs_strobe     => Intercon_0_wbm_REG_0_wbs_0.strobe,      
			wbs_write      => Intercon_0_wbm_REG_0_wbs_0.write,    
			wbs_ack        => Intercon_0_wbm_REG_0_wbs_0.ack,    
			wbs_cycle      => Intercon_0_wbm_REG_0_wbs_0.cycle, 
			
			reg_in(0) => refresh_count,
			reg_in(1) => flush_count,
			reg_in(2) => refresh_base_address,
			reg_out(0)=> open,
			reg_out(1)=> open,
			reg_out(2)=> open
	 );		


led(0) <= '0' ;

FiFO_0 : wishbone_dram_fifo 
generic map(ADDR_WIDTH => 16,
			WIDTH => 16, 
			FIFO_SIZE => 8_000_000, 
			--BURST_SIZE => 512,
			BURST_SIZE => 2048,
			SYNC_LOGIC_INTERFACE => true,
			IS_READ => true,
			sdram_address_width => sdram_address_width,
			CACHE_ADDRESS => X"00000000"
			)
port map(
	gls_clk => gls_clk, 
	gls_reset => gls_reset,

	wbs_address =>  Intercon_0_wbm_FIFO_0_wbs_0.address,
	wbs_writedata =>  Intercon_0_wbm_FIFO_0_wbs_0.writedata,
	wbs_readdata =>  Intercon_0_wbm_FIFO_0_wbs_0.readdata,
	wbs_cycle =>  Intercon_0_wbm_FIFO_0_wbs_0.cycle,
	wbs_strobe =>  Intercon_0_wbm_FIFO_0_wbs_0.strobe,
	wbs_write =>  Intercon_0_wbm_FIFO_0_wbs_0.write,
	wbs_ack =>  Intercon_0_wbm_FIFO_0_wbs_0.ack,
		  
	-- logic signals
	write_fifo => fifo_write, 
	read_fifo => '0',
	fifo_input => fifo_data,
	fifo_output => open,
	fifo_empty => open, 
	fifo_full => fifo_full,
	fifo_threshold	=> open,
	fifo_reset => pipeline_reset,	
	
	flush_active => flush_active,
	refresh_active => refresh_active,
	
	cmd_address     => cmd_address,
	cmd_wr          => cmd_wr,
	cmd_enable      => cmd_enable,
	cmd_ready       => cmd_ready,
	cmd_byte_enable => cmd_byte_enable,
	cmd_data_in     => cmd_data_in, 
	
	sdram_data_out        => data_out,
   sdram_data_ready  => data_out_ready
);


process(gls_clk, gls_reset)
begin
	if gls_reset = '1' then
			flush_count <= (others => '0') ;
			flush_active_old <= '0' ;
	elsif gls_clk'event and gls_clk = '1' then
		if flush_active = '1' and flush_active_old = '0' then
			flush_count <= flush_count + 1 ;
		end if ;
		flush_active_old <= flush_active ;
	end if ;
end process ;

process(gls_clk, gls_reset)
begin
	if gls_reset = '1' then
			refresh_count <= (others => '0') ;
			refresh_active_old <= '0' ;
			refresh_base_address <= (others => '0');
	elsif gls_clk'event and gls_clk = '1' then
		if refresh_active = '1' and refresh_active_old = '0' then
			refresh_count <= refresh_count + 1 ;
			refresh_base_address <= cmd_address(15 downto 0);
		end if ;
		refresh_active_old <= refresh_active ;
	end if ;
end process ;

process(gls_clk, gls_reset)
begin
	if gls_reset = '1' then
			fifo_write <= '0' ;
			fifo_data <= (others => '0');
			clock_divider <= "0001" ;
			write_count <= (others => '0');
	elsif gls_clk'event and gls_clk = '1' then
		clock_divider(3 downto 1) <= clock_divider(2 downto 0);
		clock_divider(0) <= clock_divider(1);
		if write_count < 8_000_000 and sdram_ready = '1' and clock_divider(0) = '1' then
			fifo_write <= '1' ;
		else
			fifo_write <= '0' ;
		end if ;
		
		if fifo_write = '1' then
			--if fifo_data < 255 then
				fifo_data <= fifo_data + 1 ;
			--else
			--	fifo_data <= (others => '0') ;
			--end if ;
			write_count <= write_count + 1 ;
		end if ;
		
	end if ;
end process ;


process(gls_clk, gls_reset)
begin
	if gls_reset = '1' then
			sdram_ready <= '0' ;
	elsif gls_clk'event and gls_clk = '1' then
		if cmd_ready = '1' then
			sdram_ready <= '1' ;
		end if ;
	end if ;
end process ;



Inst_SDRAM_Controller: SDRAM_Controller
	GENERIC MAP (
      sdram_address_width => sdram_address_width,
      sdram_column_bits   => sdram_column_bits,
      sdram_startup_cycles=> sdram_startup_cycles,
      cycles_per_refresh  => cycles_per_refresh,
		very_low_speed => 0 -- only when using controller in sub 80Mhz
   ) PORT MAP(
      clk             => gls_clk,
      reset           => '0',

      cmd_address     => cmd_address,
      cmd_wr          => cmd_wr,
      cmd_enable      => cmd_enable,
      cmd_ready       => cmd_ready,
      cmd_byte_enable => cmd_byte_enable,
      cmd_data_in     => cmd_data_in,
      
      data_out        => data_out,
      data_out_ready  => data_out_ready,
   
      SDRAM_CLK       => SDRAM_CLK,
      SDRAM_CKE       => SDRAM_CKE,
      SDRAM_CS        => SDRAM_CS,
      SDRAM_RAS       => SDRAM_nRAS,
      SDRAM_CAS       => SDRAM_nCAS,
      SDRAM_WE        => SDRAM_nWE,
      SDRAM_DQM       => SDRAM_DQM,
      SDRAM_BA        => SDRAM_BA,
      SDRAM_ADDR      => SDRAM_ADDR,
      SDRAM_DATA      => SDRAM_DQ
   );




beat_0  :heart_beat
	 generic map(clk_period_ns => 10)
	 port map ( gls_clk => gls_clk,
           gls_reset => gls_reset,
           beat_out => led(1));		  


PLL_BASE_inst : PLL_BASE generic map (
      BANDWIDTH => "OPTIMIZED",             -- "HIGH", "LOW" or "OPTIMIZED" 
      CLKFBOUT_MULT => 12,                  -- Multiply value for all CLKOUT clock outputs (1-64)
		CLKFBOUT_PHASE => 0.0,                -- Phase offset in degrees of the clock feedback output (0.0-360.0).
      --!CLKIN_PERIOD => 31.25,               -- Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
      CLKIN_PERIOD => 20.00,               -- Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).

      -- CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for CLKOUT# clock output (1-128)
		CLKOUT0_DIVIDE => 6,  --SYSCLK = clk
		CLKOUT1_DIVIDE => 1,
      CLKOUT2_DIVIDE => 1,
		CLKOUT3_DIVIDE => 1,
      CLKOUT4_DIVIDE => 1,       
		CLKOUT5_DIVIDE => 1,
      -- CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for CLKOUT# clock output (0.01-0.99).
      CLKOUT0_DUTY_CYCLE => 0.5, CLKOUT1_DUTY_CYCLE => 0.5,
      CLKOUT2_DUTY_CYCLE => 0.5, CLKOUT3_DUTY_CYCLE => 0.5,
      CLKOUT4_DUTY_CYCLE => 0.5, CLKOUT5_DUTY_CYCLE => 0.5,
      -- CLKOUT0_PHASE - CLKOUT5_PHASE: Output phase relationship for CLKOUT# clock output (-360.0-360.0).
      CLKOUT0_PHASE => 0.0,      CLKOUT1_PHASE => 0.0, -- Capture clock
      CLKOUT2_PHASE => 0.0,      CLKOUT3_PHASE => 0.0,
      CLKOUT4_PHASE => 0.0,      CLKOUT5_PHASE => 0.0,
      
      CLK_FEEDBACK => "CLKFBOUT",           -- Clock source to drive CLKFBIN ("CLKFBOUT" or "CLKOUT0")
      COMPENSATION => "SYSTEM_SYNCHRONOUS", -- "SYSTEM_SYNCHRONOUS", "SOURCE_SYNCHRONOUS", "EXTERNAL" 
      DIVCLK_DIVIDE => 1,                   -- Division value for all output clocks (1-52)
      REF_JITTER => 0.1,                    -- Reference Clock Jitter in UI (0.000-0.999).
      RESET_ON_LOSS_OF_LOCK => FALSE        -- Must be set to FALSE
   ) port map (
      CLKFBOUT => clkfb, -- 1-bit output: PLL_BASE feedback output
      -- CLKOUT0 - CLKOUT5: 1-bit (each) output: Clock outputs
      CLKOUT0 => gls_clk_unbuf,      CLKOUT1 => open,
      CLKOUT2 => open,   CLKOUT3 => open,
      CLKOUT4 => open,      CLKOUT5 => open,
      LOCKED  => clk_locked,  -- 1-bit output: PLL_BASE lock status output
      CLKFBIN => clkfb, -- 1-bit input: Feedback clock input
      CLKIN   => clkb,  -- 1-bit input: Clock input
      RST     => '0'    -- 1-bit input: Reset input
   );

   -- Buffering of clocks
BUFG_1 : BUFG port map (O => clkb,    I => OSC_FPGA);
BUFG_2 : BUFG port map (O => gls_clk,     I => gls_clk_unbuf);
	 
end structural ;