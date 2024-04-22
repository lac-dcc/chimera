----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:14:22 06/21/2012 
-- Design Name: 
-- Module Name:    spartcam_beaglebone - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

library work ;
use work.logi_wishbone_pack.all ;
use work.logi_wishbone_peripherals_pack.all ;
use work.utils_pack.all ;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity logibone_mining is
port( OSC_FPGA : in std_logic;
		PB : in std_logic_vector(1 downto 0);
		LED : out std_logic_vector(1 downto 0);	
		
		--i2c interface
		signal ARD_SCL, ARD_SDA : inout std_logic ;
		--gpmc interface
		GPMC_CSN : in std_logic ;
		GPMC_BEN : in std_logic_vector(1 downto 0);
		GPMC_WEN, GPMC_OEN, GPMC_ADVN, GPMC_CLK:	in std_logic;
		GPMC_AD :	inout std_logic_vector(15 downto 0)	
);
end logibone_mining;

architecture Behavioral of logibone_mining is

	COMPONENT clock_gen
	PORT(
		CLK_IN1 : IN std_logic;          
		CLK_OUT1 : OUT std_logic;
		CLK_OUT2 : OUT std_logic;
		LOCKED : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT miner
	generic ( DEPTH : integer );
	PORT(
		clk : IN std_logic;
		step : IN std_logic_vector(5 downto 0);
		data : IN std_logic_vector(95 downto 0);
		state : IN  STD_LOGIC_VECTOR (255 downto 0);
		nonce : IN std_logic_vector(31 downto 0);          
		hit : OUT std_logic
		);
	END COMPONENT;



	
	signal gls_clk, clk_100, clk_miner, clk_locked : std_logic ;
	signal gls_reset , gls_resetn : std_logic ;
	
	signal counter_output : std_logic_vector(31 downto 0);
	signal intercon_wrapper_wbm_address :  std_logic_vector(15 downto 0);
	signal intercon_wrapper_wbm_readdata :  std_logic_vector(15 downto 0);
	signal intercon_wrapper_wbm_writedata :  std_logic_vector(15 downto 0);
	signal intercon_wrapper_wbm_strobe :  std_logic;
	signal intercon_wrapper_wbm_write :  std_logic;
	signal intercon_wrapper_wbm_ack :  std_logic;
	signal intercon_wrapper_wbm_cycle :  std_logic;

	signal intercon_fifo0_wbm_address :  std_logic_vector(15 downto 0);
	signal intercon_fifo0_wbm_readdata :  std_logic_vector(15 downto 0);
	signal intercon_fifo0_wbm_writedata :  std_logic_vector(15 downto 0);
	signal intercon_fifo0_wbm_strobe :  std_logic;
	signal intercon_fifo0_wbm_write :  std_logic;
	signal intercon_fifo0_wbm_ack :  std_logic;
	signal intercon_fifo0_wbm_cycle :  std_logic;
	
	signal intercon_reg0_wbm_address :  std_logic_vector(15 downto 0);
	signal intercon_reg0_wbm_readdata :  std_logic_vector(15 downto 0);
	signal intercon_reg0_wbm_writedata :  std_logic_vector(15 downto 0);
	signal intercon_reg0_wbm_strobe :  std_logic;
	signal intercon_reg0_wbm_write :  std_logic;
	signal intercon_reg0_wbm_ack :  std_logic;
	signal intercon_reg0_wbm_cycle :  std_logic;


	constant DEPTH : integer := 1;
	signal data : std_logic_vector(95 downto 0);
	signal state : std_logic_vector(255 downto 0);
	signal nonce, currnonce : std_logic_vector(31 downto 0);
	signal step : std_logic_vector(5 downto 0) := "000000";
	signal hit, hit_latched : std_logic;
	signal load : std_logic_vector(351 downto 0);
	signal loadctr : std_logic_vector(5 downto 0);
	signal loading : std_logic := '0';
	signal txdata : std_logic_vector(48 downto 0);
	signal txwidth : std_logic_vector(5 downto 0);
	signal result_latched : std_logic_vector(31 downto 0) ;
	signal en_counter : std_logic ;
	signal count : std_logic_vector(1 downto 0);
	signal toggle : std_logic ;
	signal sraz_nonce, wr_rising_edge, wr_old : std_logic ;
	signal latch_loop : std_logic_vector(15 downto 0);
	signal state_register : std_logic_vector(15 downto 0);
	signal fifo_wr : std_logic ;
begin
	
	
	ARD_SCL <= 'Z' ;
	ARD_SDA <= 'Z' ;
	sys_clocks_gen: clock_gen 
	PORT MAP(
		CLK_IN1 => OSC_FPGA,
		CLK_OUT1 => gls_clk,
		CLK_OUT2 => clk_miner,-- 50mhz mining clock
		LOCKED => clk_locked
	);
gls_reset <= not clk_locked ;
gls_resetn <= clk_locked ;



divider : simple_counter 
	 generic map(NBIT => 32)
    port map( clk => gls_clk, 
           resetn => gls_resetn, 
           sraz => '0',
           en => '1',
			  load => '0' ,
			  E => X"00000000",
			  Q => counter_output
			  );
LED(0) <= counter_output(24);


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
      wbm_address    => intercon_wrapper_wbm_address,  -- Address bus
      wbm_readdata   => intercon_wrapper_wbm_readdata,  -- Data bus for read access
      wbm_writedata 	=> intercon_wrapper_wbm_writedata,  -- Data bus for write access
      wbm_strobe     => intercon_wrapper_wbm_strobe,     -- Data Strobe
      wbm_write      => intercon_wrapper_wbm_write,      -- Write access
      wbm_ack        => intercon_wrapper_wbm_ack,        -- acknowledge
      wbm_cycle      => intercon_wrapper_wbm_cycle       -- bus cycle in progress
    );


intercon0 : wishbone_intercon
generic map(memory_map => ("0000000000000XXX", -- fifo0
"0000000000001XXX") -- reg0
)
port map(
		gls_reset => gls_reset,
			gls_clk   => gls_clk,
		
		
		wbs_address    => intercon_wrapper_wbm_address,  	-- Address bus
		wbs_readdata   => intercon_wrapper_wbm_readdata,  	-- Data bus for read access
		wbs_writedata 	=> intercon_wrapper_wbm_writedata,  -- Data bus for write access
		wbs_strobe     => intercon_wrapper_wbm_strobe,     -- Data Strobe
		wbs_write      => intercon_wrapper_wbm_write,      -- Write access
		wbs_ack        => intercon_wrapper_wbm_ack,        -- acknowledge
		wbs_cycle      => intercon_wrapper_wbm_cycle,      -- bus cycle in progress
		
		-- Wishbone master signals
		wbm_address(0) => intercon_fifo0_wbm_address,
		wbm_address(1) => intercon_reg0_wbm_address,
		
		wbm_writedata(0)  => intercon_fifo0_wbm_writedata,
		wbm_writedata(1)  => intercon_reg0_wbm_writedata,
		
		wbm_readdata(0)  => intercon_fifo0_wbm_readdata,
		wbm_readdata(1)  => intercon_reg0_wbm_readdata,
		
		wbm_strobe(0)  => intercon_fifo0_wbm_strobe,
		wbm_strobe(1)  => intercon_reg0_wbm_strobe,
		
		wbm_cycle(0)   => intercon_fifo0_wbm_cycle,
		wbm_cycle(1)   => intercon_reg0_wbm_cycle,
		
		wbm_write(0)   => intercon_fifo0_wbm_write,
		wbm_write(1)   => intercon_reg0_wbm_write,
		
		wbm_ack(0)      => intercon_fifo0_wbm_ack,
		wbm_ack(1)      => intercon_reg0_wbm_ack
		
		
);


register0 : wishbone_register
	generic map(nb_regs => 8)
	 port map
	 (
		  -- Syscon signals
		  gls_reset   => gls_reset ,
		  gls_clk     => gls_clk ,
		  -- Wishbone signals
		  wbs_address      =>  intercon_reg0_wbm_address ,
		  wbs_writedata => intercon_reg0_wbm_writedata,
		  wbs_readdata  => intercon_reg0_wbm_readdata,
		  wbs_strobe    => intercon_reg0_wbm_strobe,
		  wbs_cycle     => intercon_reg0_wbm_cycle,
		  wbs_write     => intercon_reg0_wbm_write,
		  wbs_ack       => intercon_reg0_wbm_ack,
		  
		reg_in(0) =>  state_register,
		reg_in(1) =>  result_latched(15 downto 0),
		reg_in(2) =>  result_latched(31 downto 16),
		reg_in(3) =>  data(15 downto 0),
		reg_in(4) =>  data(31 downto 16),
		reg_in(5) =>  data(79 downto 64),
		reg_in(6) =>  data(95 downto 80),
		reg_in(7) =>  latch_loop,
		reg_out(0) => open ,
		reg_out(1) => open ,
		reg_out(2) => open ,
		reg_out(3) => open ,
		reg_out(4) => open ,
		reg_out(5) => open ,
		reg_out(6) => open ,
		reg_out(7) => latch_loop
	);


	fifo_wr <= (intercon_fifo0_wbm_write and intercon_fifo0_wbm_cycle and intercon_fifo0_wbm_strobe) ;
	process(gls_clk, gls_resetn)
	begin
		if gls_resetn = '0' then
			wr_old <= '0' ;
		elsif gls_clk'event and gls_clk = '1' then
			wr_old <= fifo_wr ;
		end if ;
	end process ;
	wr_rising_edge <= fifo_wr and (not wr_old) ;

	process(gls_clk, gls_resetn)
	begin
		if gls_resetn = '0' then
			load <= (others => '0') ;
			loadctr <= (others => '0') ;
		elsif gls_clk'event and gls_clk = '1' then
			if wr_rising_edge = '1' and intercon_fifo0_wbm_address(2 downto 0) = 0 then
					load(351 downto 16) <= load(335 downto 0);
					load(15 downto 0) <= intercon_fifo0_wbm_writedata;
					loadctr <= loadctr + 1 ;
					if loadctr = "010101" then
						loadctr <= (others => '0') ;
					end if ;
			end if ;
		end if ;
	end process ;
	loading <= '1' when loadctr > 0 else
					'0' ;
	process(clk_miner, gls_resetn)
	begin
	if gls_resetn = '0' then
		nonce <= (others => '0');
	elsif rising_edge(clk_miner) then
		step <= step + 1;
		if sraz_nonce = '1' then
			nonce <= (others => '0');
		elsif conv_integer(step) = 2 ** (6 - DEPTH) - 1 then
			step <= "000000";
			nonce <= nonce + 1;
		end if;
	end if;
	end process ;
	sraz_nonce <= loading ;
	state <= load(351 downto 96);
	data <= load(95 downto 0) ; -- last data to load

		miner0: miner
	   generic map ( DEPTH => DEPTH )
		port map (
			clk => clk_miner,
			step => step,
			data => data,
			state => state,
			nonce => nonce,
			hit => hit
		);
		
	currnonce <= nonce - 2 * 2 ** DEPTH;		
		
	-- manage state register
	process(clk_miner, gls_resetn)
	begin
		if gls_resetn = '0' then
			state_register <= (others => '0') ;
			hit_latched <= '0' ;
		elsif clk_miner'event and clk_miner = '1' then
			state_register(15 downto 10) <= step ;
			state_register(9 downto 2) <= nonce(31 downto  24);
			state_register(1) <= hit_latched ;
			if loading = '1' then
				state_register(0) <= '0' ;
				hit_latched <= '0' ;
			elsif nonce = X"ffffffff" and  step = "000000"then
				state_register(0) <= '1' ;
			elsif hit = '1' then
				hit_latched <= '1' ;
			end if ;
		end if ;
	end process ;
	
	result_latch : generic_latch 
	 generic map(NBIT => 32)
    port map ( clk => clk_miner,
           resetn => gls_resetn,
           sraz => '0' ,
           en => hit ,
           d => currnonce, 
           q => result_latched );
	
						
	LED(1) <= hit_latched ;	
										
					
end Behavioral;

