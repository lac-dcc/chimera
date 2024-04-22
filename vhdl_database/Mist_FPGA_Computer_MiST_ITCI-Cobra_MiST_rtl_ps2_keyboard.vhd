library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ps2_keyboard is
	Port(
		CLK : in std_logic;

		PS2_CLK : in std_logic;
		PS2_DATA : in std_logic;
		
		KEY_SCANCODE : out std_logic_vector(7 downto 0);
		KEY_MAKE : out std_logic;
		KEY_BREAK : out std_logic
	);
end ps2_keyboard;

architecture Behavioral of ps2_keyboard is

signal scancode_reg : std_logic_vector(7 downto 0);
signal scancode_next : std_logic_vector(7 downto 0);

type state_type is (s0, s1, s2, s3, s4, s5, s6, s7);
signal cs : state_type := s0;
signal ns : state_type;

signal bitpos_reg : integer range 0 to 7;
signal bitpos_next : integer range 0 to 7;

signal make_reg : std_logic;
signal make_next : std_logic;
signal break_reg : std_logic;
signal break_next : std_logic;

signal data_R : std_logic;

signal clk_R_prev : std_logic;
signal clk_R : std_logic;
signal clk_falling_edge : std_logic := '0';

begin

	KEY_MAKE <= make_reg;
	KEY_BREAK <= break_reg;
	KEY_SCANCODE <= scancode_reg;
	
	process (CLK) is
	begin
		if rising_edge(CLK) then
			data_R <= PS2_DATA;
			scancode_reg <= scancode_next;
			break_reg <= break_next;
			make_reg <= make_next;
			bitpos_reg <= bitpos_next;
			cs <= ns;
			if (clk_R_prev = '1' and clk_R = '0') then
				clk_falling_edge <= '1';
			else
				clk_falling_edge <= '0';
			end if;
			clk_R_prev <= clk_R;
			clk_R <= PS2_CLK;
		end if;
	end process;
	
	process (cs, break_reg, make_reg, bitpos_reg, scancode_reg, data_R, clk_falling_edge) is
	begin
		ns <= cs;
		break_next <= break_reg;
		make_next <= make_reg;
		bitpos_next <= bitpos_reg;
		scancode_next <= scancode_reg;
		
		if (clk_falling_edge='1') then
			case cs is
				when s0 => --idle
					if (data_R='0') then --start_bit
						bitpos_next <= 0;
						make_next <= '0';
						break_next <= '0';
						ns <= s1;
					else
						ns <= s0;
					end if;

				when s1 =>
					scancode_next(bitpos_reg) <= data_R;
				
					if bitpos_reg<7 then --get next bit
						bitpos_next <= bitpos_reg + 1;
						ns <= s1;
					else -- last bit, get stop bit
						ns <= s2;
					end if;
				
				when s2 => --rcv odd parity bit
					ns <= s3;
				
				when s3 => --rcv stop bit
					if (data_R = '1') then --stop_bit
						if scancode_reg=X"F0" then --key break
							ns <= s4;
						else
							ns <= s0;
							make_next <= '1';
						end if;
					else -- wrong stop bit value
						ns <= s0;
					end if;

				when s4 => --key break
					if (data_R = '0') then --start_bit
						bitpos_next <= 0;
						ns <= s5;
					else
						ns <= s0;
					end if;

				when s5 => 
					scancode_next(bitpos_reg) <= data_R;
				
					if bitpos_reg<7 then --get next bit
						bitpos_next <= bitpos_reg + 1;
						ns <= s5;
					else -- last bit, get stop bit
						ns <= s6;
					end if;

				when s6 => --rcv odd parity bit
					ns <= s7;
				
				when s7 => --rcv stop bit
					if (data_R = '1') then --stop_bit
						ns <= s0;
						break_next <= '1';
					else -- wrong stop bit value
						ns <= s0;
					end if;
			end case;
		end if;
	end process;
	
end Behavioral;

