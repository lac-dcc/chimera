library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity cobra_kbd is
	Port (
		clk : in std_logic;
		key_code : in std_logic_vector(7 downto 0);
		key_set : in std_logic;
		key_clr : in std_logic;
		kbd_vector : out std_logic_vector(39 downto 0)
	);
end cobra_kbd;

architecture Behavioral of cobra_kbd is
signal kbd_vector_next : std_logic_vector(39 downto 0) := (others=>'1');
signal kbd_vector_reg : std_logic_vector(39 downto 0) := (others=>'1');
signal key_set_R : std_logic := '0';
signal key_clr_R : std_logic := '0';
signal key_set_R_prev : std_logic := '0';
signal key_clr_R_prev : std_logic := '0';
signal key_code_R : std_logic_vector(7 downto 0);

begin

	process (clk) is
	begin
		if rising_edge(clk) then
			kbd_vector_reg <= kbd_vector_next;
			key_set_R_prev <= key_set_R;
			key_set_R <= key_set;
			key_clr_R_prev <= key_clr_R;
			key_clr_R <= key_clr;
			key_code_R <= key_code;
			kbd_vector_reg <= kbd_vector_next;
		end if;
	end process;
	
	process (kbd_vector_reg, key_code_R, key_set_R, key_set_R_prev, key_clr_R, key_clr_R_prev) is
	variable pos : integer range 0 to 40;
	begin
		kbd_vector_next <= kbd_vector_reg;
		
		if (key_set_R_prev = '0' and key_set_R = '1') or (key_clr_R_prev='0' and key_clr_R='1') then
			case key_code_R is
				--row 0
				when X"12" => --shift left
					pos := 0;
				when X"59" => --shift right
					pos := 0;
				when X"1A" => --Z
					pos := 1;
				when X"22" => --X
					pos := 2;
				when X"21" => --C
					pos := 3;
				when X"2A" => --V
					pos := 4;

				--row 1
				when X"1C" => --A
					pos := 5;
				when X"1B" => --S
					pos := 6;
				when X"23" => --D
					pos := 7;
				when X"2B" => --F
					pos := 8;
				when X"34" => --G
					pos := 9;

				--row 2
				when X"15" => --Q
					pos := 10;
				when X"1D" => --W
					pos := 11;
				when X"24" => --E
					pos := 12;
				when X"2D" => --R
					pos := 13;
				when X"2C" => --T
					pos := 14;

				--row 3
				when X"16" => --1
					pos := 15;
				when X"1E" => --2
					pos := 16;
				when X"26" => --3
					pos := 17;
				when X"25" => --4
					pos := 18;
				when X"2E" => --5
					pos := 19;

				--row 4
				when X"45" => --0
					pos := 20;
				when X"46" => --9
					pos := 21;
				when X"3E" => --8
					pos := 22;
				when X"3D" => --7
					pos := 23;
				when X"36" => --6
					pos := 24;

				--row 5
				when X"4D" => --P
					pos := 25;
				when X"44" => --O
					pos := 26;
				when X"43" => --I
					pos := 27;
				when X"3C" => --U
					pos := 28;
				when X"35" => --Y
					pos := 29;

				--row 6
				when X"5A" => --CR
					pos := 30;
				when X"4B" => --L
					pos := 31;
				when X"42" => --K
					pos := 32;
				when X"3B" => --J
					pos := 33;
				when X"33" => --H
					pos := 34;

				--row 7
				when X"29" => --space
					pos := 35;
				when X"41" => --,
					pos := 36;
				when X"3A" => --M
					pos := 37;
				when X"31" => --N
					pos := 38;
				when X"32" => --B
					pos := 39;

				when others =>
					pos := 40;
			end case;
			
			if pos<40 then
				if key_set_R='1' then
					kbd_vector_next(pos) <= '0';
				elsif key_clr_R='1' then
					kbd_vector_next(pos) <= '1';
				end if;
			end if;
		end if;
	end process;

	kbd_vector <= kbd_vector_reg;
	
end Behavioral;

