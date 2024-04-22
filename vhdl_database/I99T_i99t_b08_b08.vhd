entity b08 is
	port (
	      CLOCK: in bit;
	      RESET: in bit;
	      START: in  bit;
		  I: in  bit_vector (7 downto 0);
		  O: out bit_vector (3 downto 0)
	     );
end b08;


architecture BEHAV of b08 is

	type mem is array (0 to 7) of bit_vector (19 downto 0);
	constant    ROM: mem :=
	(("01111111100101111010"),
	 ("00111001110101100010"),
	 ("10101000111111111111"),
	 ("11111111011010111010"),
	 ("11111111111101101110"),
	 ("11111111101110101000"),
	 ("11001010011101011011"),
	 ("00101111111111110100"));

	constant start_st :integer:=0;
	constant init :integer:=1;
	constant loop_st :integer:=2;
	constant the_end :integer:=3;

	signal   IN_R: bit_vector (7 downto 0);
	signal  OUT_R: bit_vector (3 downto 0);

	signal    MAR: integer range 7 downto 0;

	begin
		process (CLOCK,RESET)
		variable  STATO: integer range 3 downto 0;
		variable  ROM_1: bit_vector (7 downto 0);
		variable  ROM_2: bit_vector (7 downto 0);
		variable ROM_OR: bit_vector (3 downto 0);

		begin
		if RESET = '1' then
			stato := start_st;
			ROM_1 := "00000000";
			ROM_2 := "00000000";
			ROM_OR := "0000";
			MAR <= 0;
			IN_R <= "00000000";
			OUT_R <= "0000";
			O <= "0000";
		elsif CLOCK'event and CLOCK = '1' then
		case STATO is
					
		when start_st =>
			if (START = '1') then
				STATO := init;
			end if;

		when init =>
			IN_R  <= I;
			OUT_R <= "0000";
			MAR   <= 0;
			STATO := loop_st;
											
		when loop_st =>
			ROM_1 := ROM(MAR)(19 downto 12);
			ROM_2 := ROM(MAR)(11 downto 4);
			if ((ROM_2 and not IN_R) or (ROM_1 and IN_R)
			or (ROM_2 and ROM_1)) = "11111111" then
				ROM_OR := ROM(MAR)(3 downto 0);
				OUT_R <= OUT_R or ROM_OR;
			end if;
			STATO := the_end;
		    
		when the_end =>
			if (MAR /= 7) then
				MAR <= MAR+1; 
				STATO := loop_st;
			elsif (START = '0') then
				O <= OUT_R;
				STATO := start_st;
			end if;
					
		end case;
		end if;
	end process;
end BEHAV;
			    
