library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

library STD;
use std.env.all;

library uvvm_util;
context uvvm_util.uvvm_util_context;

use uvvm_util.spi_bfm_pkg.all;

use std.textio.all;
use std.env.finish;

entity tb_ADXL362 is
end tb_ADXL362;

architecture sim of tb_ADXL362 is

-----------------------------------------------------------------------------
-- CONSTANTS
-----------------------------------------------------------------------------
-- Clock Constants
constant c_clkperiod                : time 		:= 10 ns;
constant c_sclkfreq 				: integer   := 1_000_000;
constant c_clkfreq                  : integer 	:= 100_000_000;
constant c_clock_high_percentage    : integer 	:= 50;
constant c_readfreq					: integer 	:= 1_000;
constant c_cpol						: std_logic := '0';
constant c_cpha						: std_logic := '0';

-----------------------------------------------------------------------------
-- SPI_BFM Signals
signal spi_if           : t_spi_if;
signal spi_bfm_config   : t_spi_bfm_config := C_SPI_BFM_CONFIG_DEFAULT;
	
--Inputs
signal clk	 	: std_logic := '0';

--Outputs
signal ax_o 	: STD_LOGIC_VECTOR (15 downto 0);
signal ay_o 	: STD_LOGIC_VECTOR (15 downto 0);
signal az_o 	: STD_LOGIC_VECTOR (15 downto 0);
signal ready_o	: STD_LOGIC;

begin

-- Instantiate the Unit Under Test (UUT)
DUT : entity work.ADXL362
generic map(
	c_clkfreq 	=> c_clkfreq 	,
	c_sclkfreq 	=> c_sclkfreq 	,
	c_readfreq	=> c_readfreq	,
	c_cpol		=> c_cpol		,
	c_cpha		=> c_cpha		
)
port map( 
	clk_i 	=> clk 	   		,
	miso_i 	=> spi_if.miso 	,
	mosi_o 	=> spi_if.mosi 	,
	sclk_o 	=> spi_if.sclk 	,
	cs_o 	=> spi_if.ss_n 	,
	ax_o 	=> ax_o 	    ,
	ay_o 	=> ay_o 	    ,
	az_o 	=> az_o 	    ,
	ready_o	=> ready_o	
);

-----------------------------------------------------------------------------
-- Clock Generator
-----------------------------------------------------------------------------
clock_generator(clk, c_clkperiod, c_clock_high_percentage);

------------------------------------------------
-- PROCESS: p_main
------------------------------------------------
p_main: process
    constant C_SCOPE        : string    := C_TB_SCOPE_DEFAULT;
    variable v_time_stamp   : time      := 0 ns;
    variable v_acc_data 	: t_slv_array(0 to 5)(8-1 downto 0);
    variable v_adxl_config 	: t_slv_array(0 to 2)(8-1 downto 0); 
    variable v_acc_x 		: std_logic_vector(2*8-1 downto 0);   
    variable v_acc_y 		: std_logic_vector(2*8-1 downto 0);   
    variable v_acc_z 		: std_logic_vector(2*8-1 downto 0);   
    variable v_rx_data 		: std_logic_vector(8-1 downto 0);   

    -----------------------------------------------------------------------------
	-- SPI Internal Overload Procedures
	procedure spi_slave_transmit_and_receive (
		constant tx_data                : in    std_logic_vector;
		variable rx_data                : out   std_logic_vector;
		constant when_to_start_transfer : in    t_when_to_start_transfer;
		constant msg                    : in    string) is
	begin
		spi_slave_transmit_and_receive(
		tx_data					=> tx_data,
		rx_data					=> rx_data,
		msg						=> msg,
		spi_if 					=> spi_if,
		when_to_start_transfer 	=> when_to_start_transfer,
		scope                   => C_SCOPE,
		msg_id_panel            => shared_msg_id_panel,
		config                  => spi_bfm_config,
		ext_proc_call           => ""
		);
	end;	

	-----------------------------------------------------------------------------
	procedure spi_slave_check (
		constant data_exp               : in    std_logic_vector;
		constant when_to_start_transfer : in    t_when_to_start_transfer;
		constant msg                    : in    string) is
	begin
		spi_slave_check(	
		data_exp 				=> data_exp,
		msg 					=> msg,
		spi_if 					=> spi_if,
		alert_level             => error,
		when_to_start_transfer  => when_to_start_transfer,
		scope                   => C_SCOPE,
		msg_id_panel            => shared_msg_id_panel,
		config                  => spi_bfm_config
		);	
	end;

    -----------------------------------------------------------------------------
    -- BEGIN STIMULI
    -----------------------------------------------------------------------------
begin		

    -- spi initializations
	spi_bfm_config.spi_bit_time			<= 1 us;
	spi_bfm_config.ss_n_to_sclk			<= 500 ns;
	spi_bfm_config.sclk_to_ss_n			<= 500 ns;
    wait for 1 ps;
	spi_if <=  init_spi_if_signals(
		config      => spi_bfm_config,
		master_mode => false
	);
	wait for 1 ps;

    -- Print the configuration to the log
    -- report_global_ctrl(VOID);
    -- report_msg_id_panel(VOID);

    --enable_log_msg(ALL_MESSAGES);
    disable_log_msg(ALL_MESSAGES);
    --enable_log_msg(ID_LOG_HDR);
	
	log(ID_LOG_HDR, "Start Simulation of TB for SPI master", C_SCOPE);

    wait for 1 ps;

	-----------------------------------------------------------------------------
	-- read config info and check
	-- "when_to_start_transfer" parameter must be "START_TRANSFER_ON_NEXT_SS" for first and "START_TRANSFER_IMMEDIATE" for others
	v_adxl_config(0)	:= x"0A";
	v_adxl_config(1)	:= x"2D";
	v_adxl_config(2)	:= x"02";
	spi_slave_check(v_adxl_config(0),START_TRANSFER_ON_NEXT_SS,"");
	spi_slave_check(v_adxl_config(1),START_TRANSFER_IMMEDIATE,"");
	spi_slave_check(v_adxl_config(2),START_TRANSFER_IMMEDIATE,"");

	-- now the module is in measure mode
	-- we need to sent acceleration data to the master
	-- first check if master sents 0x0B 0x0E
	v_adxl_config(0)	:= x"0B";
	v_adxl_config(1)	:= x"0E";
	spi_slave_check(v_adxl_config(0),START_TRANSFER_ON_NEXT_SS,"");
	spi_slave_check(v_adxl_config(1),START_TRANSFER_IMMEDIATE,"");
	-- then sent accelerometer data
	-- ACC_X
	v_acc_data(0)		:= x"1A";
	v_acc_data(1)		:= x"03";
	-- ACC_Y
	v_acc_data(2)		:= x"2B";
	v_acc_data(3)		:= x"04";
	-- ACC_X
	v_acc_data(4)		:= x"3C";
	v_acc_data(5)		:= x"05";
	spi_slave_transmit_and_receive(v_acc_data(0),v_rx_data,START_TRANSFER_IMMEDIATE,"");
	spi_slave_transmit_and_receive(v_acc_data(1),v_rx_data,START_TRANSFER_IMMEDIATE,"");
	spi_slave_transmit_and_receive(v_acc_data(2),v_rx_data,START_TRANSFER_IMMEDIATE,"");
	spi_slave_transmit_and_receive(v_acc_data(3),v_rx_data,START_TRANSFER_IMMEDIATE,"");
	spi_slave_transmit_and_receive(v_acc_data(4),v_rx_data,START_TRANSFER_IMMEDIATE,"");
	spi_slave_transmit_and_receive(v_acc_data(5),v_rx_data,START_TRANSFER_IMMEDIATE,"");

	-- check if module output signals and simulation acc data are the same
	check_value(v_acc_data(1) & v_acc_data(0), ax_o, ERROR, "");
	check_value(v_acc_data(3) & v_acc_data(2), ay_o, ERROR, "");
	check_value(v_acc_data(5) & v_acc_data(4), az_o, ERROR, "");

	-----------------------------------------------------------------------------
	-- check next samples with different acc values
	v_adxl_config(0)	:= x"0B";
	v_adxl_config(1)	:= x"0E";
	spi_slave_check(v_adxl_config(0),START_TRANSFER_ON_NEXT_SS,"");
	spi_slave_check(v_adxl_config(1),START_TRANSFER_IMMEDIATE,"");
	-- then sent accelerometer data
	-- ACC_X
	v_acc_data(0)		:= x"23";
	v_acc_data(1)		:= x"01";
	-- ACC_Y
	v_acc_data(2)		:= x"34";
	v_acc_data(3)		:= x"02";
	-- ACC_X
	v_acc_data(4)		:= x"45";
	v_acc_data(5)		:= x"03";
	spi_slave_transmit_and_receive(v_acc_data(0),v_rx_data,START_TRANSFER_IMMEDIATE,"");
	spi_slave_transmit_and_receive(v_acc_data(1),v_rx_data,START_TRANSFER_IMMEDIATE,"");
	spi_slave_transmit_and_receive(v_acc_data(2),v_rx_data,START_TRANSFER_IMMEDIATE,"");
	spi_slave_transmit_and_receive(v_acc_data(3),v_rx_data,START_TRANSFER_IMMEDIATE,"");
	spi_slave_transmit_and_receive(v_acc_data(4),v_rx_data,START_TRANSFER_IMMEDIATE,"");
	spi_slave_transmit_and_receive(v_acc_data(5),v_rx_data,START_TRANSFER_IMMEDIATE,"");

	-- check if module output signals and simulation acc data are the same
	check_value(v_acc_data(1) & v_acc_data(0), ax_o, ERROR, "");
	check_value(v_acc_data(3) & v_acc_data(2), ay_o, ERROR, "");
	check_value(v_acc_data(5) & v_acc_data(4), az_o, ERROR, "");	

	wait for 3 us;

    --==================================================================================================
    -- Ending the simulation
    --------------------------------------------------------------------------------------
    wait for 1000 ns;             -- to allow some time for completion
    report_alert_counters(FINAL); -- Report final counters and print conclusion for simulation (Success/Fail)
    log(ID_LOG_HDR, "SIMULATION COMPLETED", C_SCOPE);

    -- Finish the simulation
    std.env.stop;
    wait;  -- to stop completely

end process p_main;	

end sim;