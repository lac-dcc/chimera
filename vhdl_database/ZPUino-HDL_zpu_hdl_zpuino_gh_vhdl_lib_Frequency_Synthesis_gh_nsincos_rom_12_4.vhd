---------------------------------------------------------------------
--	Filename:	gh_nsincos_rom_12_4.vhd
--			
--	Description:
--		- Sin Cos look up table 12 bit (from 1/4 table)
--
--	Copyright (c) 2008, 2009 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date      	Author   	Comment
--	-------- 	----------	---------	-----------
--	1.0      	11/01/08  	h LeFevre	Initial revision
--	2.0     	03/07/09  	h LeFevre	correct port name
--	
------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_unsigned.all;

entity gh_nsincos_rom_12_4 is
	port (
		CLK  : in std_logic;
		ADD  : in std_logic_vector(11 downto 0);
		nsin : out std_logic_vector(11 downto 0);
		cos  : out std_logic_vector(11 downto 0)
		);
end entity;

architecture a of gh_nsincos_rom_12_4 is

	signal pdsADD, pdcADD :  STD_LOGIC;
	signal dsADD, dcADD :  STD_LOGIC;
	signal sAz, cAz   :  STD_LOGIC;
	signal sADD, cADD :  STD_LOGIC_VECTOR(11 DOWNTO 0);
	signal msin, mcos :  STD_LOGIC_VECTOR(11 DOWNTO 0);

	type rom_mem is array (0 to 1023) of std_logic_vector (11 downto 0);
	constant isin : rom_mem :=(  
    x"000", x"003", x"006", x"009", x"00d", x"010", x"013", x"016", 
    x"019", x"01c", x"01f", x"023", x"026", x"029", x"02c", x"02f", 
    x"032", x"035", x"039", x"03c", x"03f", x"042", x"045", x"048", 
    x"04b", x"04e", x"052", x"055", x"058", x"05b", x"05e", x"061", 
    x"064", x"068", x"06b", x"06e", x"071", x"074", x"077", x"07a", 
    x"07e", x"081", x"084", x"087", x"08a", x"08d", x"090", x"093", 
    x"097", x"09a", x"09d", x"0a0", x"0a3", x"0a6", x"0a9", x"0ac", 
    x"0b0", x"0b3", x"0b6", x"0b9", x"0bc", x"0bf", x"0c2", x"0c6", 
    x"0c9", x"0cc", x"0cf", x"0d2", x"0d5", x"0d8", x"0db", x"0df", 
    x"0e2", x"0e5", x"0e8", x"0eb", x"0ee", x"0f1", x"0f4", x"0f7", 
    x"0fb", x"0fe", x"101", x"104", x"107", x"10a", x"10d", x"110", 
    x"113", x"117", x"11a", x"11d", x"120", x"123", x"126", x"129", 
    x"12c", x"12f", x"133", x"136", x"139", x"13c", x"13f", x"142", 
    x"145", x"148", x"14b", x"14e", x"152", x"155", x"158", x"15b", 
    x"15e", x"161", x"164", x"167", x"16a", x"16d", x"171", x"174", 
    x"177", x"17a", x"17d", x"180", x"183", x"186", x"189", x"18c", 
    x"18f", x"192", x"196", x"199", x"19c", x"19f", x"1a2", x"1a5", 
    x"1a8", x"1ab", x"1ae", x"1b1", x"1b4", x"1b7", x"1ba", x"1bd", 
    x"1c1", x"1c4", x"1c7", x"1ca", x"1cd", x"1d0", x"1d3", x"1d6", 
    x"1d9", x"1dc", x"1df", x"1e2", x"1e5", x"1e8", x"1eb", x"1ee", 
    x"1f1", x"1f4", x"1f7", x"1fb", x"1fe", x"201", x"204", x"207", 
    x"20a", x"20d", x"210", x"213", x"216", x"219", x"21c", x"21f", 
    x"222", x"225", x"228", x"22b", x"22e", x"231", x"234", x"237", 
    x"23a", x"23d", x"240", x"243", x"246", x"249", x"24c", x"24f", 
    x"252", x"255", x"258", x"25b", x"25e", x"261", x"264", x"267", 
    x"26a", x"26d", x"270", x"273", x"276", x"279", x"27c", x"27f", 
    x"282", x"285", x"288", x"28b", x"28e", x"291", x"294", x"297", 
    x"29a", x"29d", x"2a0", x"2a3", x"2a6", x"2a9", x"2ac", x"2af", 
    x"2b2", x"2b5", x"2b8", x"2ba", x"2bd", x"2c0", x"2c3", x"2c6", 
    x"2c9", x"2cc", x"2cf", x"2d2", x"2d5", x"2d8", x"2db", x"2de", 
    x"2e1", x"2e4", x"2e7", x"2e9", x"2ec", x"2ef", x"2f2", x"2f5", 
    x"2f8", x"2fb", x"2fe", x"301", x"304", x"307", x"30a", x"30c", 
    x"30f", x"312", x"315", x"318", x"31b", x"31e", x"321", x"324", 
    x"327", x"329", x"32c", x"32f", x"332", x"335", x"338", x"33b", 
    x"33e", x"340", x"343", x"346", x"349", x"34c", x"34f", x"352", 
    x"354", x"357", x"35a", x"35d", x"360", x"363", x"366", x"368", 
    x"36b", x"36e", x"371", x"374", x"377", x"379", x"37c", x"37f", 
    x"382", x"385", x"387", x"38a", x"38d", x"390", x"393", x"396", 
    x"398", x"39b", x"39e", x"3a1", x"3a4", x"3a6", x"3a9", x"3ac", 
    x"3af", x"3b2", x"3b4", x"3b7", x"3ba", x"3bd", x"3bf", x"3c2", 
    x"3c5", x"3c8", x"3ca", x"3cd", x"3d0", x"3d3", x"3d6", x"3d8", 
    x"3db", x"3de", x"3e1", x"3e3", x"3e6", x"3e9", x"3eb", x"3ee", 
    x"3f1", x"3f4", x"3f6", x"3f9", x"3fc", x"3ff", x"401", x"404", 
    x"407", x"409", x"40c", x"40f", x"412", x"414", x"417", x"41a", 
    x"41c", x"41f", x"422", x"424", x"427", x"42a", x"42c", x"42f", 
    x"432", x"435", x"437", x"43a", x"43d", x"43f", x"442", x"444", 
    x"447", x"44a", x"44c", x"44f", x"452", x"454", x"457", x"45a", 
    x"45c", x"45f", x"462", x"464", x"467", x"469", x"46c", x"46f", 
    x"471", x"474", x"476", x"479", x"47c", x"47e", x"481", x"483", 
    x"486", x"489", x"48b", x"48e", x"490", x"493", x"496", x"498", 
    x"49b", x"49d", x"4a0", x"4a2", x"4a5", x"4a7", x"4aa", x"4ad", 
    x"4af", x"4b2", x"4b4", x"4b7", x"4b9", x"4bc", x"4be", x"4c1", 
    x"4c3", x"4c6", x"4c8", x"4cb", x"4cd", x"4d0", x"4d2", x"4d5", 
    x"4d7", x"4da", x"4dc", x"4df", x"4e1", x"4e4", x"4e6", x"4e9", 
    x"4eb", x"4ee", x"4f0", x"4f3", x"4f5", x"4f8", x"4fa", x"4fd", 
    x"4ff", x"502", x"504", x"506", x"509", x"50b", x"50e", x"510", 
    x"513", x"515", x"517", x"51a", x"51c", x"51f", x"521", x"524", 
    x"526", x"528", x"52b", x"52d", x"530", x"532", x"534", x"537", 
    x"539", x"53b", x"53e", x"540", x"543", x"545", x"547", x"54a", 
    x"54c", x"54e", x"551", x"553", x"555", x"558", x"55a", x"55c", 
    x"55f", x"561", x"563", x"566", x"568", x"56a", x"56d", x"56f", 
    x"571", x"573", x"576", x"578", x"57a", x"57d", x"57f", x"581", 
    x"583", x"586", x"588", x"58a", x"58d", x"58f", x"591", x"593", 
    x"596", x"598", x"59a", x"59c", x"59f", x"5a1", x"5a3", x"5a5", 
    x"5a7", x"5aa", x"5ac", x"5ae", x"5b0", x"5b3", x"5b5", x"5b7", 
    x"5b9", x"5bb", x"5bd", x"5c0", x"5c2", x"5c4", x"5c6", x"5c8", 
    x"5cb", x"5cd", x"5cf", x"5d1", x"5d3", x"5d5", x"5d7", x"5da", 
    x"5dc", x"5de", x"5e0", x"5e2", x"5e4", x"5e6", x"5e9", x"5eb", 
    x"5ed", x"5ef", x"5f1", x"5f3", x"5f5", x"5f7", x"5f9", x"5fb", 
    x"5fd", x"600", x"602", x"604", x"606", x"608", x"60a", x"60c", 
    x"60e", x"610", x"612", x"614", x"616", x"618", x"61a", x"61c", 
    x"61e", x"620", x"622", x"624", x"626", x"628", x"62a", x"62c", 
    x"62e", x"630", x"632", x"634", x"636", x"638", x"63a", x"63c", 
    x"63e", x"640", x"642", x"644", x"646", x"648", x"64a", x"64c", 
    x"64e", x"650", x"652", x"654", x"655", x"657", x"659", x"65b", 
    x"65d", x"65f", x"661", x"663", x"665", x"667", x"668", x"66a", 
    x"66c", x"66e", x"670", x"672", x"674", x"675", x"677", x"679", 
    x"67b", x"67d", x"67f", x"681", x"682", x"684", x"686", x"688", 
    x"68a", x"68b", x"68d", x"68f", x"691", x"693", x"694", x"696", 
    x"698", x"69a", x"69b", x"69d", x"69f", x"6a1", x"6a3", x"6a4", 
    x"6a6", x"6a8", x"6a9", x"6ab", x"6ad", x"6af", x"6b0", x"6b2", 
    x"6b4", x"6b6", x"6b7", x"6b9", x"6bb", x"6bc", x"6be", x"6c0", 
    x"6c1", x"6c3", x"6c5", x"6c6", x"6c8", x"6ca", x"6cb", x"6cd", 
    x"6cf", x"6d0", x"6d2", x"6d4", x"6d5", x"6d7", x"6d9", x"6da", 
    x"6dc", x"6dd", x"6df", x"6e1", x"6e2", x"6e4", x"6e5", x"6e7", 
    x"6e9", x"6ea", x"6ec", x"6ed", x"6ef", x"6f0", x"6f2", x"6f4", 
    x"6f5", x"6f7", x"6f8", x"6fa", x"6fb", x"6fd", x"6fe", x"700", 
    x"701", x"703", x"704", x"706", x"707", x"709", x"70a", x"70c", 
    x"70d", x"70f", x"710", x"712", x"713", x"715", x"716", x"718", 
    x"719", x"71a", x"71c", x"71d", x"71f", x"720", x"722", x"723", 
    x"724", x"726", x"727", x"729", x"72a", x"72b", x"72d", x"72e", 
    x"730", x"731", x"732", x"734", x"735", x"736", x"738", x"739", 
    x"73a", x"73c", x"73d", x"73e", x"740", x"741", x"742", x"744", 
    x"745", x"746", x"748", x"749", x"74a", x"74c", x"74d", x"74e", 
    x"74f", x"751", x"752", x"753", x"754", x"756", x"757", x"758", 
    x"759", x"75b", x"75c", x"75d", x"75e", x"760", x"761", x"762", 
    x"763", x"764", x"766", x"767", x"768", x"769", x"76a", x"76b", 
    x"76d", x"76e", x"76f", x"770", x"771", x"772", x"774", x"775", 
    x"776", x"777", x"778", x"779", x"77a", x"77b", x"77d", x"77e", 
    x"77f", x"780", x"781", x"782", x"783", x"784", x"785", x"786", 
    x"787", x"788", x"789", x"78a", x"78c", x"78d", x"78e", x"78f", 
    x"790", x"791", x"792", x"793", x"794", x"795", x"796", x"797", 
    x"798", x"799", x"79a", x"79b", x"79c", x"79d", x"79e", x"79e", 
    x"79f", x"7a0", x"7a1", x"7a2", x"7a3", x"7a4", x"7a5", x"7a6", 
    x"7a7", x"7a8", x"7a9", x"7aa", x"7aa", x"7ab", x"7ac", x"7ad", 
    x"7ae", x"7af", x"7b0", x"7b1", x"7b1", x"7b2", x"7b3", x"7b4", 
    x"7b5", x"7b6", x"7b7", x"7b7", x"7b8", x"7b9", x"7ba", x"7bb", 
    x"7bb", x"7bc", x"7bd", x"7be", x"7bf", x"7bf", x"7c0", x"7c1", 
    x"7c2", x"7c2", x"7c3", x"7c4", x"7c5", x"7c5", x"7c6", x"7c7", 
    x"7c8", x"7c8", x"7c9", x"7ca", x"7ca", x"7cb", x"7cc", x"7cd", 
    x"7cd", x"7ce", x"7cf", x"7cf", x"7d0", x"7d1", x"7d1", x"7d2", 
    x"7d3", x"7d3", x"7d4", x"7d5", x"7d5", x"7d6", x"7d6", x"7d7", 
    x"7d8", x"7d8", x"7d9", x"7d9", x"7da", x"7db", x"7db", x"7dc", 
    x"7dc", x"7dd", x"7de", x"7de", x"7df", x"7df", x"7e0", x"7e0", 
    x"7e1", x"7e1", x"7e2", x"7e2", x"7e3", x"7e3", x"7e4", x"7e5", 
    x"7e5", x"7e6", x"7e6", x"7e6", x"7e7", x"7e7", x"7e8", x"7e8", 
    x"7e9", x"7e9", x"7ea", x"7ea", x"7eb", x"7eb", x"7ec", x"7ec", 
    x"7ec", x"7ed", x"7ed", x"7ee", x"7ee", x"7ee", x"7ef", x"7ef", 
    x"7f0", x"7f0", x"7f0", x"7f1", x"7f1", x"7f1", x"7f2", x"7f2", 
    x"7f3", x"7f3", x"7f3", x"7f4", x"7f4", x"7f4", x"7f5", x"7f5", 
    x"7f5", x"7f5", x"7f6", x"7f6", x"7f6", x"7f7", x"7f7", x"7f7", 
    x"7f7", x"7f8", x"7f8", x"7f8", x"7f8", x"7f9", x"7f9", x"7f9", 
    x"7f9", x"7fa", x"7fa", x"7fa", x"7fa", x"7fb", x"7fb", x"7fb", 
    x"7fb", x"7fb", x"7fc", x"7fc", x"7fc", x"7fc", x"7fc", x"7fc", 
    x"7fd", x"7fd", x"7fd", x"7fd", x"7fd", x"7fd", x"7fd", x"7fd", 
    x"7fe", x"7fe", x"7fe", x"7fe", x"7fe", x"7fe", x"7fe", x"7fe", 
    x"7fe", x"7fe", x"7ff", x"7ff", x"7ff", x"7ff", x"7ff", x"7ff", 
    x"7ff", x"7ff", x"7ff", x"7ff", x"7ff", x"7ff", x"7ff", x"7ff");

begin

PROCESS (CLK)
BEGIN
	if (rising_edge (clk)) then
		dsADD <= pdsADD;
		dcADD <= pdcADD;
		if ((sADD = x"400") or (sADD = x"c00")) then
			sAz <= '1';
		else
			sAz <= '0';
		end if;
		if ((cADD = x"000") or (cADD = x"800")) then
			cAz <= '1';
		else
			cAz <= '0';
		end if;
		if (ADD(11 downto 10) = "00") then
			pdsADD <= '0';
			pdcADD <= '0';
			sADD <= "00" & ADD(9 downto 0);
			cADD <= "00" & (x"0" - ADD(9 downto 0));
		elsif (ADD(11 downto 10) = "01") then
			pdsADD <= '0';
			pdcADD <= '1';
			sADD <= "01" & (x"0" - ADD(9 downto 0));
			cADD <= "01" &  ADD(9 downto 0);
		elsif (ADD(11 downto 10) = "10") then
			pdsADD <= '1';
			pdcADD <= '1';
			sADD <= "10" & ADD(9 downto 0);
			cADD <= "10" & (x"0" - ADD(9 downto 0));
		else -- (ADD(11 downto 10) = "11") then
			pdsADD <= '1';
			pdcADD <= '0';
			sADD <= "11" & (x"0" - ADD(9 downto 0));
			cADD <= "11" & ADD(9 downto 0);
		end if;
		msin <= isin(conv_integer(sADD(9 downto 0)));
		mcos <= isin(conv_integer(cADD(9 downto 0)));
		if (dsADD = '0') then
			if (sAz = '0') then
				nsin <= x"0" - msin;
			else
				nsin <= x"801";
			end if;
		else
			if (sAz = '0') then
				nsin <= msin;
			else
				nsin <= x"7ff";
			end if;
			
		end if;
		if (dcADD = '0') then
			if (cAz = '0') then
				cos <= mcos;
			else
				cos <= x"7ff";
			end if;			
		else 
			if (cAz = '0') then
				cos <= x"0" - mcos;
			else
				cos <= x"801";
			end if;
			
		end if;	
	end if;
END PROCESS;


end architecture;
