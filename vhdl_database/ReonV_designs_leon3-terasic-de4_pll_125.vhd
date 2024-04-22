library ieee;
use ieee.std_logic_1164.all;
library altera_mf;
use altera_mf.all;

entity pll_125 is
	port(
		inclk0      : in std_logic  := '0';
		c0			: out std_logic
	);
end pll_125;


architecture syn of pll_125 is

	COMPONENT altpll
	GENERIC (
		bandwidth_type		: STRING;
		clk0_divide_by		: NATURAL;
		clk0_duty_cycle		: NATURAL;
		clk0_multiply_by		: NATURAL;
		clk0_phase_shift		: STRING;
		clk1_divide_by		: NATURAL;
		clk1_duty_cycle		: NATURAL;
		clk1_multiply_by		: NATURAL;
		clk1_phase_shift		: STRING;
		clk2_divide_by		: NATURAL;
		clk2_duty_cycle		: NATURAL;
		clk2_multiply_by		: NATURAL;
		clk2_phase_shift		: STRING;
		clk3_divide_by		: NATURAL;
		clk3_duty_cycle		: NATURAL;
		clk3_multiply_by		: NATURAL;
		clk3_phase_shift		: STRING;
		clk4_divide_by		: NATURAL;
		clk4_duty_cycle		: NATURAL;
		clk4_multiply_by		: NATURAL;
		clk4_phase_shift		: STRING;
		clk5_divide_by		: NATURAL;
		clk5_duty_cycle		: NATURAL;
		clk5_multiply_by		: NATURAL;
		clk5_phase_shift		: STRING;
		compensate_clock		: STRING;
		inclk0_input_frequency		: NATURAL;
		intended_device_family		: STRING;
		lpm_hint		: STRING;
		lpm_type		: STRING;
		operation_mode		: STRING;
		pll_type		: STRING;
		port_activeclock		: STRING;
		port_areset		: STRING;
		port_clkbad0		: STRING;
		port_clkbad1		: STRING;
		port_clkloss		: STRING;
		port_clkswitch		: STRING;
		port_configupdate		: STRING;
		port_fbin		: STRING;
		port_fbout		: STRING;
		port_inclk0		: STRING;
		port_inclk1		: STRING;
		port_locked		: STRING;
		port_pfdena		: STRING;
		port_phasecounterselect		: STRING;
		port_phasedone		: STRING;
		port_phasestep		: STRING;
		port_phaseupdown		: STRING;
		port_pllena		: STRING;
		port_scanaclr		: STRING;
		port_scanclk		: STRING;
		port_scanclkena		: STRING;
		port_scandata		: STRING;
		port_scandataout		: STRING;
		port_scandone		: STRING;
		port_scanread		: STRING;
		port_scanwrite		: STRING;
		port_clk0		: STRING;
		port_clk1		: STRING;
		port_clk2		: STRING;
		port_clk3		: STRING;
		port_clk4		: STRING;
		port_clk5		: STRING;
		port_clk6		: STRING;
		port_clk7		: STRING;
		port_clk8		: STRING;
		port_clk9		: STRING;
		port_clkena0		: STRING;
		port_clkena1		: STRING;
		port_clkena2		: STRING;
		port_clkena3		: STRING;
		port_clkena4		: STRING;
		port_clkena5		: STRING;
		self_reset_on_loss_lock		: STRING;
		using_fbmimicbidir_port		: STRING;
		width_clock		: NATURAL
	);
	PORT (
		phasestep	: IN STD_LOGIC ;
		phaseupdown	: IN STD_LOGIC ;
		inclk	: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		phasecounterselect	: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		locked	: OUT STD_LOGIC ;
		phasedone	: OUT STD_LOGIC ;
		areset	: IN STD_LOGIC ;
		clk	: OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
		scanclk	: IN STD_LOGIC 
	);
	END COMPONENT;

	signal sub_wire3 : std_logic_vector(1 downto 0);
	signal sub_wire0 : std_logic_vector(9 downto 0);
begin

	sub_wire3 <= '0' & inclk0;
	c0 <= sub_wire0(0);

	altpll_component : altpll
		generic map (
			bandwidth_type => "AUTO",
			clk0_divide_by => 2,
			clk0_duty_cycle => 50,
			clk0_multiply_by => 5,
			clk0_phase_shift => "0",
			clk1_divide_by => 2,
			clk1_duty_cycle => 50,
			clk1_multiply_by => 5,
			clk1_phase_shift => "0",
			clk2_divide_by => 2,
			clk2_duty_cycle => 50,
			clk2_multiply_by => 5,
			clk2_phase_shift => "0",
			clk3_divide_by => 2,
			clk3_duty_cycle => 50,
			clk3_multiply_by => 5,
			clk3_phase_shift => "0",
			clk4_divide_by => 2,
			clk4_duty_cycle => 50,
			clk4_multiply_by => 5,
			clk4_phase_shift => "0",
			clk5_divide_by => 2,
			clk5_duty_cycle => 50,
			clk5_multiply_by => 5,
			clk5_phase_shift => "0",
			compensate_clock => "CLK0",
			inclk0_input_frequency => 20000,
			intended_device_family => "Stratix IV",
			lpm_hint => "CBX_MODULE_PREFIX=pll_125",
			lpm_type => "altpll",
			operation_mode => "NORMAL",
			pll_type => "AUTO",
			port_activeclock => "PORT_UNUSED",
			port_areset => "PORT_UNUSED",
			port_clkbad0 => "PORT_UNUSED",
			port_clkbad1 => "PORT_UNUSED",
			port_clkloss => "PORT_UNUSED",
			port_clkswitch => "PORT_UNUSED",
			port_configupdate => "PORT_UNUSED",
			port_fbin => "PORT_UNUSED",
			port_fbout => "PORT_UNUSED",
			port_inclk0 => "PORT_USED",
			port_inclk1 => "PORT_UNUSED",
			port_locked => "PORT_UNUSED",
			port_pfdena => "PORT_UNUSED",
			port_phasecounterselect => "PORT_UNUSED",
			port_phasedone => "PORT_UNUSED",
			port_phasestep => "PORT_UNUSED",
			port_phaseupdown => "PORT_UNUSED",
			port_pllena => "PORT_UNUSED",
			port_scanaclr => "PORT_UNUSED",
			port_scanclk => "PORT_UNUSED",
			port_scanclkena => "PORT_UNUSED",
			port_scandata => "PORT_UNUSED",
			port_scandataout => "PORT_UNUSED",
			port_scandone => "PORT_UNUSED",
			port_scanread => "PORT_UNUSED",
			port_scanwrite => "PORT_UNUSED",
			port_clk0 => "PORT_USED",
			port_clk1 => "PORT_UNUSED",
			port_clk2 => "PORT_UNUSED",
			port_clk3 => "PORT_UNUSED",
			port_clk4 => "PORT_UNUSED",
			port_clk5 => "PORT_UNUSED",
			port_clk6 => "PORT_UNUSED",
			port_clk7 => "PORT_UNUSED",
			port_clk8 => "PORT_UNUSED",
			port_clk9 => "PORT_UNUSED",
			port_clkena0 => "PORT_UNUSED",
			port_clkena1 => "PORT_UNUSED",
			port_clkena2 => "PORT_UNUSED",
			port_clkena3 => "PORT_UNUSED",
			port_clkena4 => "PORT_UNUSED",
			port_clkena5 => "PORT_UNUSED",
			using_fbmimicbidir_port => "OFF",
			self_reset_on_loss_lock => "OFF",
			width_clock => 10
		)
		port map (
			inclk 				=> sub_wire3,
			clk					=> sub_wire0,
			areset				=> '0',
			phasecounterselect	=> "1111",
			phasestep			=> '1',
			phaseupdown			=> '1',
			scanclk				=> '0'
		);

end architecture syn;
