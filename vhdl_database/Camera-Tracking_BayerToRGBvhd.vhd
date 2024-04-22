-- BayerToRGB

-- Goal: convert a stream of Bayer formated data to 5 bit RGB data

-- Change Log:

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BayerToRGB is port(
					oDATA: out STD_lOGIC_VECTOR(14 downto 0);  -- 5 bit RGB
					oDVAL: out STD_LOGIC;
					oX_Cont: out STD_LOGIC_VECTOR(15 downto 0);
					oY_Cont: out STD_LOGIC_VECTOR(15 downto 0);
					iX_Cont: in STD_LOGIC_VECTOR(15 downto 0);
					iY_Cont: in STD_LOGIC_VECTOR(15 downto 0);
					iCLK: in STD_LOGIC;
					iDATA: in STD_lOGIC_VECTOR(11 downto 0)
					);
end ;
	
architecture behavior of BayerToRGB is 

	component LineMemory IS	PORT(
		address		: IN STD_LOGIC_VECTOR (11 DOWNTO 0);
		clock			: IN STD_LOGIC  := '1';
		data			: IN STD_LOGIC_VECTOR (11 DOWNTO 0);
		wren			: IN STD_LOGIC ;
		q				: OUT STD_LOGIC_VECTOR (11 DOWNTO 0)
	);
	END component;


signal LastRed: STD_LOGIC_VECTOR(11 downto 0);
signal LastBlue: STD_LOGIC_VECTOR(11 downto 0);

signal LastLineData: STD_LOGIC_VECTOR(11 downto 0);
signal outofcontrol: STD_LOGIC;
signal memWriteEnable: STD_LOGIC;
begin
	oX_Cont <= iX_Cont(15 downto 1) & '0';
	oY_Cont <= iY_Cont;
	oDVAL <= iCLK;
	
	linemem: LineMemory port map(
		address	=> iX_Cont(11 downto 0),
		clock		=> iCLK, 
		data		=> iDATA,
		wren		=> memWriteEnable,   -- if its an odd line save the data
		q			=> LastLineData
	);
	
	process(iX_Cont,iY_Cont)
	begin
		if(iY_Cont(0) = '0')  then -- its an even bit;
											-- this line should have Red and Green -> RGRGRG
			memWriteEnable <= '0';
			if(iX_Cont(0) = '0') then -- its a red value
				LastRed <= iDATA;
				LastBlue <= LastLineData;
			else  -- its a green value
				--oDATA <= "0000000000" & LastLineData(11 downto 7) ;
				--oDATA <=  LastLineData(11 downto 7)&iDATA(11 downto 7) & LastRed(11 downto 7)    ;
				
				--oDATA <=   LastLineData(11 downto 7) &  iDATA(11 downto 7)& LastRed(11 downto 7)    ;
				
				--oDATA <=   "00010" &  iDATA(11 downto 7) & "00010" ;
				
				oDATA <= iDATA(11 downto 7) & iDATA(11 downto 7) & iDATA(11 downto 7);
				
				
				--oDATA <=  LastRed(11 downto 7) & iDATA(11 downto 7) & LastBlue(6 downto 2);
				--oDATA <=  LastBlue(11 downto 7) & "0000000000";
				
				--oDATA <=  "000" & LastBlue;
			end if;
		else  -- is an odd line --> Data is Green and Blue GBGBGB
			memWriteEnable <= '1';
		end if;
	end process;	
end behavior;
