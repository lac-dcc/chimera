LIBRARY ieee;
USE ieee.std_logic_1164.all;
package float_types is
	subtype float is std_logic_vector(31 downto 0);
	type float_vector is array( NATURAL range <> ) of float;
	type float_alu_mode is ( idle, add, sub, mul, div, exp);
end package float_types;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.float_types.all;

package float_constants is
	-- whole number constants
	CONSTANT float_zero		: float := "00000000000000000000000000000000";
	CONSTANT float_one 		: float := "00111111100000000000000000000000";

	-- other constants
	CONSTANT float_half		: float := "00111111000000000000000000000000";
	CONSTANT float_1_10		: float := "00111101110011001100110011001100";
	CONSTANT float_1_20		: float := "00111101010011001100110011001101";
	CONSTANT float_1_100	: float := "00111100001000111101011100001010";
	
	CONSTANT float_add_wait : INTEGER := 7;
	CONSTANT float_sub_wait : INTEGER := 7;
	CONSTANT float_div_wait : INTEGER := 6;
	CONSTANT float_mul_wait : INTEGER := 11;
	CONSTANT float_exp_wait : INTEGER := 17;
	CONSTANT float_cmp_wait : INTEGER := 1;

end package float_constants;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.float_types.all;

package float_components is
component fp_add
	PORT
	(
		aclr		: IN STD_LOGIC ;
		clk_en		: IN STD_LOGIC ;
		clock		: IN STD_LOGIC ;
		dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
end component;

component fp_cmp
	PORT
	(
		aclr		: IN STD_LOGIC ;
		clk_en		: IN STD_LOGIC ;
		clock		: IN STD_LOGIC ;
		dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		agb		: OUT STD_LOGIC 
	);
end component;


component fp_div
	PORT
	(
		aclr		: IN STD_LOGIC ;
		clk_en		: IN STD_LOGIC ;
		clock		: IN STD_LOGIC ;
		dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
end component;

component fp_exp
	PORT
	(
		aclr		: IN STD_LOGIC ;
		clk_en		: IN STD_LOGIC ;
		clock		: IN STD_LOGIC ;
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
end component;

component fp_mul
	PORT
	(
		aclr		: IN STD_LOGIC ;
		clk_en		: IN STD_LOGIC ;
		clock		: IN STD_LOGIC ;
		dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
end component;

component fp_sub
	PORT
	(
		aclr		: IN STD_LOGIC ;
		clk_en		: IN STD_LOGIC ;
		clock		: IN STD_LOGIC ;
		dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
end component;

component float_alu IS
	PORT (
		reset, clock : IN STD_LOGIC;
		a, b : IN float;
		c : OUT float;
		mode : IN float_alu_mode;
		ready : OUT STD_LOGIC
	);
end component float_alu;


end package float_components;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.float_types.all;
USE work.float_components.all;
USE work.float_constants.all;

ENTITY float_alu IS
	PORT (
		reset, clock : IN STD_LOGIC;
		a, b : IN float;
		c : OUT float;
		mode : IN float_alu_mode;
		ready : OUT STD_LOGIC
	);
END ENTITY float_alu;

ARCHITECTURE float_alu OF float_alu IS
	-- wait counter
	SIGNAL wait_counter : INTEGER := 0;
	
	-- alu signals
	SIGNAL add_enable, sub_enable, mul_enable, div_enable, exp_enable : STD_LOGIC := '0';
	SIGNAL alu_a, alu_b, alu_c, add_c, sub_c, mul_c, div_c, exp_c : float := float_zero;
	
	TYPE states IS (idle, add, sub, mul, div, exp);
	SIGNAL state : states := idle;
BEGIN

c <= alu_c;

-- alu stuff
fp_add0 : fp_add port map (reset, add_enable, clock, alu_a, alu_b, add_c);
fp_sub0 : fp_sub port map (reset, sub_enable, clock, alu_a, alu_b, sub_c);
fp_mul0 : fp_mul port map (reset, mul_enable, clock, alu_a, alu_b, mul_c);
fp_div0 : fp_div port map (reset, div_enable, clock, alu_a, alu_b, div_c);
fp_exp0 : fp_exp port map (reset, exp_enable, clock, alu_a, exp_c);

fsm: PROCESS(clock, reset) IS
BEGIN
	IF (reset = '1') THEN
		wait_counter <= 0;
		state <= idle;
		ready <= '0';
	ELSIF (clock = '1' AND clock'event) THEN
		IF (wait_counter > 0) THEN
			wait_counter <= wait_counter - 1;
		ELSE
			CASE state IS
			WHEN idle =>
				CASE mode IS
				WHEN idle =>
					ready <= '1';
					state <= idle;
				WHEN add =>
					ready <= '0';
					add_enable <= '1';
					alu_a <= a;
					alu_b <= b;
					wait_counter <= float_add_wait;
					state <= add;
				WHEN sub =>
					ready <= '0';
					sub_enable <= '1';
					alu_a <= a;
					alu_b <= b;
					wait_counter <= float_sub_wait;
					state <= sub;
				WHEN mul =>
					ready <= '0';
					mul_enable <= '1';
					alu_a <= a;
					alu_b <= b;
					wait_counter <= float_mul_wait;
					state <= mul;
				WHEN div =>
					ready <= '0';
					div_enable <= '1';
					alu_a <= a;
					alu_b <= b;
					wait_counter <= float_div_wait;
					state <= div;
				WHEN exp =>
					ready <= '0';
					exp_enable <= '1';
					alu_a <= a;
					wait_counter <= float_exp_wait;
					state <= exp;
				WHEN others =>
					state <= idle;
				END CASE;
			WHEN add =>
				alu_c <= add_c;
				add_enable <= '0';
				state <= idle;
				ready <= '1';
			WHEN sub =>
				alu_c <= sub_c;
				sub_enable <= '0';
				state <= idle;
				ready <= '1';
			WHEN mul =>
				alu_c <= mul_c;
				mul_enable <= '0';
				state <= idle;
				ready <= '1';
			WHEN div =>
				alu_c <= div_c;
				div_enable <= '0';
				state <= idle;
				ready <= '1';
			WHEN exp =>
				alu_c <= exp_c;
				exp_enable <= '0';
				state <= idle;
				ready <= '1';
			WHEN others =>
				state <= idle;
			END CASE;
		END IF;
	END IF;
END PROCESS;

END ARCHITECTURE float_alu;








