library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity top is
generic (
c_clkfreq	: integer := 100_000_000;
c_pwmfreq	: integer := 10_000
);
port (
clk			: in std_logic;
led_color_i	: in std_logic_vector (5 downto 0);
led_color_o	: out std_logic_vector (5 downto 0)
);
end top;

architecture Behavioral of top is

------------------------------------------------
-- COMPONENT DECLERATION
------------------------------------------------
component pwm is
generic (
c_clkfreq	: integer := 100_000_000;
c_pwmfreq	: integer := 1000
);
port (
clk				: in std_logic;
duty_cycle_i	: in std_logic_vector (6 downto 0);
pwm_o			: out std_logic
);
end component;

------------------------------------------------
-- CONSTANT DEFINITIONS
------------------------------------------------
constant c_counterlim		: integer := 100;
constant c_timer50hzlim		: integer := c_clkfreq/50;

------------------------------------------------
-- SIGNAL DEFINITIONS
------------------------------------------------
signal duty_cycle_ld17	: std_logic_vector (6 downto 0) 	:= (others => '0');
signal duty_cycle_ld16	: std_logic_vector (6 downto 0) 	:= (others => '0');
signal pwm_ld17			: std_logic	:= '0';
signal pwm_ld16			: std_logic	:= '0';
signal counter			: integer range 0 to c_counterlim	:= 0;
signal timer50hz		: integer range 0 to c_timer50hzlim	:= 0;

begin

------------------------------------------------
-- COMPONENT INSTANTIATIONS
------------------------------------------------
i_pwm_ld17 : pwm
generic map(
c_clkfreq	=> c_clkfreq,
c_pwmfreq	=> c_pwmfreq
)
port map(
clk				=> clk			  ,
duty_cycle_i	=> duty_cycle_ld17,
pwm_o			=> pwm_ld17
);

i_pwm_ld16 : pwm
generic map(
c_clkfreq	=> c_clkfreq,
c_pwmfreq	=> c_pwmfreq
)
port map(
clk				=> clk			  ,
duty_cycle_i	=> duty_cycle_ld16,
pwm_o			=> pwm_ld16
);

------------------------------------------------
-- CONCURRENT SIGNAL ASSIGNMENTS
------------------------------------------------

-- asagidaki sekilde yazınca "0 definitions of operator "-" match here" hatasi aldim
-- cunku duty_cycle_ld16 'std_logic_vector' tipinde, esitligin sag tarafi ise integer tipinde
-- cozum olarak 'STD_LOGIC_ARITH' package icinde tanimli 'CONV_STD_LOGIC_VECTOR' fonksiyonu kullanilmali

-- duty_cycle_ld16	<= 50 - CONV_INTEGER(duty_cycle_ld17);


duty_cycle_ld16	<= CONV_STD_LOGIC_VECTOR((50 - CONV_INTEGER(duty_cycle_ld17)),7);

------------------------------------------------
-- MAIN PROCESS
------------------------------------------------
P_MAIN : process (clk) begin
if (rising_edge(clk)) then

	if (counter < c_counterlim/2) then
		if (timer50hz = c_timer50hzlim-1) then
			duty_cycle_ld17	<= duty_cycle_ld17 + 1;
			timer50hz		<= 0;
			counter 		<= counter + 1;
		else
			timer50hz		<= timer50hz + 1;
		end if;	
	else
		if (timer50hz = c_timer50hzlim-1) then
			if (counter = c_counterlim) then
				counter			<= 0;
			else
				counter 		<= counter + 1;	
				duty_cycle_ld17	<= duty_cycle_ld17 - 1;				
			end if;			
			timer50hz		<= 0;
		else
			timer50hz		<= timer50hz + 1;
		end if;		
	end if;

end if;
end process;


------------------------------------------------
-- COMBINATIONAL OUTPUT PROCESS
------------------------------------------------
-- P_COMB_OUT : process (led_color_i, pwm_ld17, pwm_ld16) begin

	-- led_color_o(5)	<= led_color_i(5) and pwm_ld17;	-- LED17 RED
	-- led_color_o(4)	<= led_color_i(4) and pwm_ld17;	-- LED17 GREEN
	-- led_color_o(3)	<= led_color_i(3) and pwm_ld17;	-- LED17 BLUE
	
	-- led_color_o(2)	<= led_color_i(2) and pwm_ld16;	-- LED16 RED
	-- led_color_o(1)	<= led_color_i(1) and pwm_ld16;	-- LED16 GREEN
	-- led_color_o(0)	<= led_color_i(0) and pwm_ld16;	-- LED16 BLUE	

-- end process;

------------------------------------------------
-- REGISTERED OUTPUT PROCESS
------------------------------------------------
P_REG_OUT : process (clk) begin
if (rising_edge(clk)) then

	led_color_o(5)	<= led_color_i(5) and pwm_ld17;	-- LED17 RED
	led_color_o(4)	<= led_color_i(4) and pwm_ld17;	-- LED17 GREEN
	led_color_o(3)	<= led_color_i(3) and pwm_ld17;	-- LED17 BLUE
	
	led_color_o(2)	<= led_color_i(2) and pwm_ld16;	-- LED16 RED
	led_color_o(1)	<= led_color_i(1) and pwm_ld16;	-- LED16 GREEN
	led_color_o(0)	<= led_color_i(0) and pwm_ld16;	-- LED16 BLUE	

end if;
end process;

end Behavioral;