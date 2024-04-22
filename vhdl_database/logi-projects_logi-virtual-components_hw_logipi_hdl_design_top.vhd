library ieee;
use ieee.std_logic_1164.ALL;

library work ;
use work.logi_wishbone_pack.all ;
use work.logi_wishbone_peripherals_pack.all ;


entity design_top is
	port(
		gls_clk, gls_reset : in std_logic ;
		MOSI :  in std_logic;
		MISO :   out  std_logic;
		SS :  in std_logic;
		SCK :  in std_logic;
		LED0 :   out  std_logic;
		LED1 :   out  std_logic;
		PB0 :  in std_logic;
		PB1 :  in std_logic	
	);
end entity;

architecture structural of design_top is
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



	signal Master_0_wbm_Intercon_0_wbs : wishbone_bus;
	signal Intercon_0_wbm_Reg_0_wbs : wishbone_bus;
	signal top_MOSI_Master_0_mosi : std_logic;
	signal top_SS_Master_0_ss : std_logic;
	signal top_SCK_Master_0_sck : std_logic;
	signal Master_0_miso_top_MISO : std_logic;
	signal top_PB0_Reg_0_reg_in : std_logic;
	signal top_PB1_Reg_0_reg_in : std_logic;
	signal Reg_0_reg_out_top_LED0 : std_logic;
	signal Reg_0_reg_out_top_LED1 : std_logic;

begin

Master_0 : spi_wishbone_wrapper
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,
-- port is connected
	mosi =>  top_MOSI_Master_0_mosi
,
-- port is connected
	miso =>  Master_0_miso_top_MISO
,
-- port is connected
	ss =>  top_SS_Master_0_ss
,
-- port is connected
	sck =>  top_SCK_Master_0_sck
,
-- port is connected
-- connection is a record
	wbm_address =>  Master_0_wbm_Intercon_0_wbs.address,
	wbm_writedata =>  Master_0_wbm_Intercon_0_wbs.writedata,
	wbm_readdata =>  Master_0_wbm_Intercon_0_wbs.readdata,
	wbm_cycle =>  Master_0_wbm_Intercon_0_wbs.cycle,
	wbm_strobe =>  Master_0_wbm_Intercon_0_wbs.strobe,
	wbm_write =>  Master_0_wbm_Intercon_0_wbs.write,
	wbm_ack =>  Master_0_wbm_Intercon_0_wbs.ack	
);

Intercon_0 : wishbone_intercon
generic map(memory_map => (0 => "0000000000000000"))
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,
-- port is connected
-- connection is a record
	wbs_address =>  Master_0_wbm_Intercon_0_wbs.address,
	wbs_writedata =>  Master_0_wbm_Intercon_0_wbs.writedata,
	wbs_readdata =>  Master_0_wbm_Intercon_0_wbs.readdata,
	wbs_cycle =>  Master_0_wbm_Intercon_0_wbs.cycle,
	wbs_strobe =>  Master_0_wbm_Intercon_0_wbs.strobe,
	wbs_write =>  Master_0_wbm_Intercon_0_wbs.write,
	wbs_ack =>  Master_0_wbm_Intercon_0_wbs.ack,
-- port is connected
-- connection is a record
	wbm_address(0) =>  Intercon_0_wbm_Reg_0_wbs.address,
	wbm_writedata(0) =>  Intercon_0_wbm_Reg_0_wbs.writedata,
	wbm_readdata(0) =>  Intercon_0_wbm_Reg_0_wbs.readdata,
	wbm_cycle(0) =>  Intercon_0_wbm_Reg_0_wbs.cycle,
	wbm_strobe(0) =>  Intercon_0_wbm_Reg_0_wbs.strobe,
	wbm_write(0) =>  Intercon_0_wbm_Reg_0_wbs.write,
	wbm_ack(0) =>  Intercon_0_wbm_Reg_0_wbs.ack	
);

Reg_0 : wishbone_register
port map(
	gls_clk => gls_clk, gls_reset => gls_reset,
-- port is connected
-- connection is a record
	wbs_address =>  Intercon_0_wbm_Reg_0_wbs.address,
	wbs_writedata =>  Intercon_0_wbm_Reg_0_wbs.writedata,
	wbs_readdata =>  Intercon_0_wbm_Reg_0_wbs.readdata,
	wbs_cycle =>  Intercon_0_wbm_Reg_0_wbs.cycle,
	wbs_strobe =>  Intercon_0_wbm_Reg_0_wbs.strobe,
	wbs_write =>  Intercon_0_wbm_Reg_0_wbs.write,
	wbs_ack =>  Intercon_0_wbm_Reg_0_wbs.ack,
-- port is connected
	reg_out(0)(0) =>  Reg_0_reg_out_top_LED0
,
	reg_out(0)(1) =>  Reg_0_reg_out_top_LED1
,
-- port is connected
	reg_in(0)(0) =>  top_PB0_Reg_0_reg_in
,
	reg_in(0)(1) =>  top_PB1_Reg_0_reg_in
	
);



-- Connecting inputs
top_MOSI_Master_0_mosi <= MOSI;
top_SS_Master_0_ss <= SS;
top_SCK_Master_0_sck <= SCK;
top_PB0_Reg_0_reg_in <= PB0;
top_PB1_Reg_0_reg_in <= PB1;

-- Connecting outputs
MISO <= Master_0_miso_top_MISO;
LED0 <= Reg_0_reg_out_top_LED0;
LED1 <= Reg_0_reg_out_top_LED1;


end architecture ;