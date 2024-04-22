library STD;
use STD.TEXTIO.ALL;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_TEXTIO.all;
use IEEE.NUMERIC_STD.ALL;

entity MSM5205 is
	port(
		CLK 		: in std_logic;
		RST_N		: in std_logic;
		
		XTI		: in std_logic;
		D			: in std_logic_vector(3 downto 0);
		VCK_R		: out std_logic;
		VCK_F		: out std_logic;
		
		SOUT		: out signed(15 downto 0)
	);
end MSM5205;

architecture rtl of MSM5205 is
	
	type DeltaTable_t is array (0 to 391) of unsigned(11 downto 0);
	constant DT : DeltaTable_t :=
	(x"002", x"006", x"00A", x"00E", x"012", x"016", x"01A", x"01E", 
	 x"002", x"006", x"00A", x"00E", x"013", x"017", x"01B", x"01F", 
	 x"002", x"006", x"00B", x"00F", x"015", x"019", x"01E", x"022", 
	 x"002", x"007", x"00C", x"011", x"017", x"01C", x"021", x"026", 
	 x"002", x"007", x"00D", x"012", x"019", x"01E", x"024", x"029", 
	 x"003", x"009", x"00F", x"015", x"01C", x"022", x"028", x"02E", 
	 x"003", x"00A", x"011", x"018", x"01F", x"026", x"02D", x"034", 
	 x"003", x"00A", x"012", x"019", x"022", x"029", x"031", x"038", 
	 x"004", x"00C", x"015", x"01D", x"026", x"02E", x"037", x"03F", 
	 x"004", x"00D", x"016", x"01F", x"029", x"032", x"03B", x"044", 
	 x"005", x"00F", x"019", x"023", x"02E", x"038", x"042", x"04C", 
	 x"005", x"010", x"01B", x"026", x"032", x"03D", x"048", x"053", 
	 x"006", x"012", x"01F", x"02B", x"038", x"044", x"051", x"05D", 
	 x"006", x"013", x"021", x"02E", x"03D", x"04A", x"058", x"065", 
	 x"007", x"016", x"025", x"034", x"043", x"052", x"061", x"070", 
	 x"008", x"018", x"029", x"039", x"04A", x"05A", x"06B", x"07B", 
	 x"009", x"01B", x"02D", x"03F", x"052", x"064", x"076", x"088", 
	 x"00A", x"01E", x"032", x"046", x"05A", x"06E", x"082", x"096", 
	 x"00B", x"021", x"037", x"04D", x"063", x"079", x"08F", x"0A5", 
	 x"00C", x"024", x"03C", x"054", x"06D", x"085", x"09D", x"0B5", 
	 x"00D", x"027", x"042", x"05C", x"078", x"092", x"0AD", x"0C7", 
	 x"00E", x"02B", x"049", x"066", x"084", x"0A1", x"0BF", x"0DC", 
	 x"010", x"030", x"051", x"071", x"092", x"0B2", x"0D3", x"0F3", 
	 x"011", x"034", x"058", x"07B", x"0A0", x"0C3", x"0E7", x"10A", 
	 x"013", x"03A", x"061", x"088", x"0B0", x"0D7", x"0FE", x"125", 
	 x"015", x"040", x"06B", x"096", x"0C2", x"0ED", x"118", x"143", 
	 x"017", x"046", x"076", x"0A5", x"0D5", x"104", x"134", x"163", 
	 x"01A", x"04E", x"082", x"0B6", x"0EB", x"11F", x"153", x"187", 
	 x"01C", x"055", x"08F", x"0C8", x"102", x"13B", x"175", x"1AE", 
	 x"01F", x"05E", x"09D", x"0DC", x"11C", x"15B", x"19A", x"1D9", 
	 x"022", x"067", x"0AD", x"0F2", x"139", x"17E", x"1C4", x"209", 
	 x"026", x"072", x"0BF", x"10B", x"159", x"1A5", x"1F2", x"23E", 
	 x"02A", x"07E", x"0D2", x"126", x"17B", x"1CF", x"223", x"277", 
	 x"02E", x"08A", x"0E7", x"143", x"1A1", x"1FD", x"25A", x"2B6", 
	 x"033", x"099", x"0FF", x"165", x"1CB", x"231", x"297", x"2FD", 
	 x"038", x"0A8", x"118", x"188", x"1F9", x"269", x"2D9", x"349", 
	 x"03D", x"0B8", x"134", x"1AF", x"22B", x"2A6", x"322", x"39D", 
	 x"044", x"0CC", x"154", x"1DC", x"264", x"2EC", x"374", x"3FC", 
	 x"04A", x"0DF", x"175", x"20A", x"2A0", x"335", x"3CB", x"460", 
	 x"052", x"0F6", x"19B", x"23F", x"2E4", x"388", x"42D", x"4D1", 
	 x"05A", x"10F", x"1C4", x"279", x"32E", x"3E3", x"498", x"54D", 
	 x"063", x"12A", x"1F1", x"2B8", x"37F", x"446", x"50D", x"5D4", 
	 x"06D", x"148", x"223", x"2FE", x"3D9", x"4B4", x"58F", x"66A", 
	 x"078", x"168", x"259", x"349", x"43B", x"52B", x"61C", x"70C", 
	 x"084", x"18D", x"296", x"39F", x"4A8", x"5B1", x"6BA", x"7C3", 
	 x"091", x"1B4", x"2D8", x"3FB", x"51F", x"642", x"766", x"889", 
	 x"0A0", x"1E0", x"321", x"461", x"5A2", x"6E2", x"823", x"963", 
	 x"0B0", x"210", x"371", x"4D1", x"633", x"793", x"8F4", x"A54", 
	 x"0C2", x"246", x"3CA", x"54E", x"6D2", x"856", x"9DA", x"B5E"); 
	 
	type StepIndexTable_t is array (0 to 3) of unsigned(3 downto 0);
	constant SIT : StepIndexTable_t := ("0010","0100","0110","1000");
	
	 
	signal CLK_CNT    : unsigned(5 downto 0);
	signal SAMPLE_RCE : std_logic;
	signal SAMPLE_FCE : std_logic;
	 
	signal DEC_DATA   : unsigned(3 downto 0);
	signal DEC_EXEC   : std_logic;
	 
	signal SAMPLE     : unsigned(15 downto 0);
	signal STEP       : unsigned(5 downto 0);

begin

	process( CLK )
	begin
		if rising_edge(CLK) then
			SAMPLE_RCE <= '0';
			SAMPLE_FCE <= '0';
			if XTI = '1' then
				CLK_CNT <= CLK_CNT + 1;
				if CLK_CNT = 24-1 then
					SAMPLE_RCE <= '1';
				end if;
				if CLK_CNT = 48-1 then
					CLK_CNT <= (others => '0');
					SAMPLE_FCE <= '1';
				end if;
			end if;
		end if;
	end process;
	
	VCK_R <= SAMPLE_RCE;
	VCK_F <= SAMPLE_FCE;
	
	process( RST_N, CLK )
	variable DELTA       : unsigned(11 downto 0);
	variable NEXT_STEP   : unsigned(6 downto 0);
	variable NEXT_SAMPLE : unsigned(15 downto 0);
	begin
		if RST_N = '0' then
			DEC_DATA <= (others => '0');
			DEC_EXEC <= '0';
			STEP <= (others => '0');
			SAMPLE <= x"0000";
		elsif rising_edge(CLK) then
			DEC_EXEC <= '0';
			if SAMPLE_FCE = '1' then
				DEC_DATA <= unsigned(D);
				DEC_EXEC <= '1';
			end if;
			
			if DEC_EXEC = '1' then
				DELTA := DT(to_integer(STEP&DEC_DATA(2 downto 0)));
				if DEC_DATA(3) = '1' then
					NEXT_SAMPLE := SAMPLE - DELTA;
				else
					NEXT_SAMPLE := SAMPLE + DELTA;
				end if;
				
				if NEXT_SAMPLE(12 downto 11) = "01" then
					NEXT_SAMPLE := x"07FF";
				elsif NEXT_SAMPLE(12 downto 11) = "10" then
					NEXT_SAMPLE := x"F800";
				end if;
				
				SAMPLE <= NEXT_SAMPLE;

				if DEC_DATA(2) = '1' then
					NEXT_STEP := ("0"&STEP) + SIT(to_integer(DEC_DATA(1 downto 0)));
				else
					NEXT_STEP := ("0"&STEP) - 1;
				end if;
				
				if NEXT_STEP(6) = '1' then
					STEP <= "000000";
				elsif NEXT_STEP > 48 then
					STEP <= "110000";
				else
					STEP <= NEXT_STEP(5 downto 0);
				end if;
			end if;
		end if;
	end process;
	
	SOUT <= signed(SAMPLE(11 downto 0)) & x"0";

end rtl;