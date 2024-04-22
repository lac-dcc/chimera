--
-- Code based from Speccy 2010: https://code.google.com/p/speccy2010/source/browse/trunk/firmware/fpga/src/peripheral/memory/sdram.vhd
--


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sdram is
	generic(
		page0 : integer := 512;
		page1	: integer := 128
	);

	port(
		clk			 : in std_logic; 

		pixelIn		: in unsigned(15 downto 0);		
		rowStoreNr	: in unsigned(9 downto 0); 
		colStoreNr	: buffer unsigned(9 downto 0); 
		rowStoreReq	: in std_logic;
		rowStoreAck : out std_logic := '0';
		
		pixelOut		: out unsigned(15 downto 0);
		rowLoadNr	: in unsigned(9 downto 0); 
		colLoadNr	: buffer unsigned(9 downto 0); 
		rowLoadReq	: in std_logic;
		rowLoadAck  : out std_logic := '0';
		
		-- SD-RAM ports
		pMemClk     : out std_logic;                        -- SD-RAM Clock
		pMemCke     : out std_logic;                        -- SD-RAM Clock enable
		pMemCs_n    : out std_logic;                        -- SD-RAM Chip select
		pMemRas_n   : out std_logic;                        -- SD-RAM Row/RAS
		pMemCas_n   : out std_logic;                        -- SD-RAM /CAS
		pMemWe_n    : out std_logic;                        -- SD-RAM /WE
		pMemUdq     : out std_logic;                        -- SD-RAM UDQM
		pMemLdq     : out std_logic;                        -- SD-RAM LDQM
		pMemBa1     : out std_logic;                        -- SD-RAM Bank select address 1
		pMemBa0     : out std_logic;                        -- SD-RAM Bank select address 0
		pMemAdr     : out unsigned(12 downto 0);    			 -- SD-RAM Address
		pMemDat     : inout unsigned(15 downto 0);  		 	 -- SD-RAM Data
		
		wren_sdr		: out std_logic
		
	);
  
end sdram;

architecture rtl of sdram is

--	-- SD-RAM control signals
	signal SdrCmd      : unsigned(3 downto 0);
	signal SdrBa0      : std_logic;
	signal SdrBa1      : std_logic;
	signal SdrUdq      : std_logic;
	signal SdrLdq      : std_logic;
	signal SdrAdr      : unsigned(12 downto 0);
	signal SdrDat      : unsigned(15 downto 0);

	constant SdrCmd_de : unsigned(3 downto 0) := "1111"; -- deselect
	constant SdrCmd_pr : unsigned(3 downto 0) := "0010"; -- precharge all
	constant SdrCmd_re : unsigned(3 downto 0) := "0001"; -- refresh
	constant SdrCmd_ms : unsigned(3 downto 0) := "0000"; -- mode register set
	constant SdrCmd_xx : unsigned(3 downto 0) := "0111"; -- no operation
	constant SdrCmd_ac : unsigned(3 downto 0) := "0011"; -- activate
	constant SdrCmd_rd : unsigned(3 downto 0) := "0101"; -- read
	constant SdrCmd_wr : unsigned(3 downto 0) := "0100"; -- write		
	constant SdrCmd_bs : unsigned(3 downto 0) := "0110"; -- burst stop
	
	signal	curRow	: unsigned(9 downto 0);
		
begin
	
	process( clk )

		type typSdrRoutine is ( SdrRoutine_Null, SdrRoutine_Init, SdrRoutine_Idle, SdrRoutine_RefreshAll, SdrRoutine_LoadRow, SdrRoutine_StoreRow );
		variable SdrRoutine : typSdrRoutine := SdrRoutine_Null;
		variable SdrRoutineSeq : integer range 0 to 2048 := 0;

		variable refreshDelayCounter : unsigned(23 downto 0) := X"000000";
		variable SdrRefreshCounter : unsigned(15 downto 0) := X"0000";
		
		variable SdrAddress : unsigned(23 downto 0);
		
	begin
	
		if rising_edge(clk) then		

			refreshDelayCounter := refreshDelayCounter + 1;
			
			--if( refreshDelayCounter >= ( freq * 1000 * 64 ) ) then
			--	refreshDelayCounter := x"000000";
			--	SdrRefreshCounter := x"0000";
			--end if;
	
			rowStoreAck <= '0';
			rowLoadAck <= '0';
			wren_sdr <= '0';

			case SdrRoutine is
					
				when SdrRoutine_Null =>
				
					SdrCmd <= SdrCmd_xx;
					SdrDat <= (others => 'Z');
					
					if refreshDelayCounter = 0 then
						SdrRoutine := SdrRoutine_Init;
					end if;
					
				when SdrRoutine_Init =>
				
					if( SdrRoutineSeq = 0 ) then
						SdrCmd <= SdrCmd_pr;
						SdrAdr <= "1111111111111";
						SdrBa1 <= '0';
						SdrBa0 <= '0';
						SdrUdq <= '1';
						SdrLdq <= '1';
						SdrRoutineSeq := SdrRoutineSeq + 1;
					elsif( SdrRoutineSeq = 4 or SdrRoutineSeq = 12 ) then
						SdrCmd <= SdrCmd_re;
						SdrRoutineSeq := SdrRoutineSeq + 1;
					elsif( SdrRoutineSeq = 20 ) then
						SdrCmd <= SdrCmd_ms;
						SdrAdr <= "0000" & "00" & "011" & "0" & "111";
						SdrRoutineSeq := SdrRoutineSeq + 1;
					elsif( SdrRoutineSeq = 23 ) then
						SdrCmd <= SdrCmd_xx;
						SdrRoutineSeq := 0;
						SdrRoutine := SdrRoutine_Idle;
					else
						SdrCmd <= SdrCmd_xx;
						SdrRoutineSeq := SdrRoutineSeq + 1;
					end if;

				when SdrRoutine_Idle =>
				
					SdrCmd <= SdrCmd_xx;
					SdrDat <= (others => 'Z');
					
					if( rowLoadReq = '1' ) then
						SdrAddress(23 downto 19) := "00000";
						SdrAddress(18 downto 9) := rowLoadNr;
						curRow <= rowLoadNr;
						SdrAddress(8 downto 0) := "000000000";
						SdrRoutine := SdrRoutine_LoadRow;
					
					elsif( rowStoreReq = '1' ) then
						SdrAddress(23 downto 19) := "00000";
						SdrAddress(18 downto 9) := rowStoreNr;
						curRow <= rowStoreNr;
						SdrAddress(8 downto 0) := "000000000";
						SdrRoutine := SdrRoutine_StoreRow;

					--elsif SdrRefreshCounter < 4096 then
					--	SdrRoutine := SdrRoutine_RefreshAll;
					--	SdrRefreshCounter := SdrRefreshCounter + 1;
					
					end if;
				
				when SdrRoutine_RefreshAll =>	
				
					if( SdrRoutineSeq = 0 ) then
						SdrCmd <= SdrCmd_re;
						SdrRoutineSeq := SdrRoutineSeq + 1;
						
					elsif( SdrRoutineSeq = 6 ) then
						SdrCmd <= SdrCmd_xx;
						SdrRoutineSeq := 0;
						SdrRoutine := SdrRoutine_Idle;
						
					else
						SdrCmd <= SdrCmd_xx;
						SdrRoutineSeq := SdrRoutineSeq + 1;
					end if;
				
				when SdrRoutine_LoadRow =>	
				
					if( SdrRoutineSeq = 0 ) then
						SdrCmd <= SdrCmd_ac;
						SdrBa0 <= SdrAddress(22);
						SdrBa1 <= '0';
						SdrAdr <= SdrAddress(21 downto 9);		
						colLoadNr <= to_unsigned(0, colLoadNr'length);				
						SdrRoutineSeq := SdrRoutineSeq + 1;									
					elsif( SdrRoutineSeq = 2 ) then					
						SdrCmd <= SdrCmd_rd;
						SdrUdq <= '0';
						SdrLdq <= '0';
						SdrAdr(12 downto 9) <= "0010";
						SdrAdr(8 downto 0) <= SdrAddress(8 downto 0);						
						SdrRoutineSeq := SdrRoutineSeq + 1;	
					elsif( SdrRoutineSeq = 7) then
						SdrCmd <= SdrCmd_xx;						
						colLoadNr <= colLoadNr + 1;
						pixelOut <= pMemDat;						
						wren_sdr <= '1';
						SdrAddress := SdrAddress + 1;											
						SdrRoutineSeq := SdrRoutineSeq + 1;						
					elsif( SdrRoutineSeq > 7 and SdrRoutineSeq < 8+page0 ) then
						SdrCmd <= SdrCmd_xx;						
						colLoadNr <= colLoadNr + 1;
						pixelOut <= pMemDat;						
						wren_sdr <= '1';
						SdrAddress := SdrAddress + 1;											
						SdrRoutineSeq := SdrRoutineSeq + 1;											
					elsif( SdrRoutineSeq = 8+page0) then					
						SdrCmd <= SdrCmd_bs; 	
						--rowLoadAck <= '1'; 						
						SdrRoutineSeq := SdrRoutineSeq + 1;											
						SdrAddress(23 downto 19) := "00000";
						SdrAddress(18 downto 9) := curRow;
						SdrAddress(8 downto 0) := "000000000";		
						
					elsif( SdrRoutineSeq = 9+page0 ) then
						SdrCmd <= SdrCmd_ac;
						SdrBa0 <= SdrAddress(22);
						SdrBa1 <= '1';
						SdrAdr <= SdrAddress(21 downto 9);	
						colLoadNr <= to_unsigned(page0+1, colLoadNr'length);					
						SdrRoutineSeq := SdrRoutineSeq + 1;									
					elsif( SdrRoutineSeq = 11+page0) then
						SdrCmd <= SdrCmd_rd;
						SdrUdq <= '0';
						SdrLdq <= '0';
						SdrAdr(12 downto 9) <= "0010";
						SdrAdr(8 downto 0) <= SdrAddress(8 downto 0);						
						SdrRoutineSeq := SdrRoutineSeq + 1;		
					elsif( SdrRoutineSeq = 16+page0) then
						SdrCmd <= SdrCmd_xx;										
						pixelOut <= pMemDat;	
						colLoadNr <= colLoadNr + 1;	
						wren_sdr <= '1';				
						SdrAddress := SdrAddress + 1;											
						SdrRoutineSeq := SdrRoutineSeq + 1;								
					elsif( SdrRoutineSeq > 17+page0 and SdrRoutineSeq < 17+page0+page1 ) then
						SdrCmd <= SdrCmd_xx;						
						colLoadNr <= colLoadNr + 1;
						pixelOut <= pMemDat;		
						wren_sdr <= '1';				
						SdrAddress := SdrAddress + 1;											
						SdrRoutineSeq := SdrRoutineSeq + 1;		
					elsif( SdrRoutineSeq = 17+page0+page1  ) then	
						SdrCmd <= SdrCmd_bs;	
						rowLoadAck <= '1'; 					
						SdrRoutineSeq := SdrRoutineSeq + 1;	
					elsif( SdrRoutineSeq = 18+page0+page1  ) then
						SdrCmd <= SdrCmd_xx;						
						SdrRoutineSeq := 0;
						SdrRoutine := SdrRoutine_Idle;						
					else
						SdrCmd <= SdrCmd_xx;
						SdrRoutineSeq := SdrRoutineSeq + 1;					
					end if;
					
					
				when SdrRoutine_StoreRow =>	
					if( SdrRoutineSeq = 0 ) then
						SdrCmd <= SdrCmd_ac;
						SdrBa0 <= SdrAddress(22);
						SdrBa1 <= '0';
						SdrAdr <= SdrAddress(21 downto 9);
						colStoreNr <= to_unsigned(0, colStoreNr'length);								
						SdrRoutineSeq := SdrRoutineSeq + 1;
					elsif( SdrRoutineSeq = 2 ) then
						SdrCmd <= SdrCmd_wr;
						SdrAdr(12 downto 9) <= "0010";
						SdrAdr(8 downto 0) <= SdrAddress(8 downto 0);
						SdrLdq <= '0';
						SdrUdq <= '0';
						SdrDat <= pixelIn;					
						colStoreNr <= colStoreNr + 1;
						SdrAddress := SdrAddress + 1;						
						SdrRoutineSeq := SdrRoutineSeq + 1;
					elsif( SdrRoutineSeq >= 3 and SdrRoutineSeq < 4+page0) then
						SdrCmd <= SdrCmd_xx;
						SdrDat <= pixelIn;					
						SdrAddress := SdrAddress + 1;						
						colStoreNr <= colStoreNr + 1;
						SdrRoutineSeq := SdrRoutineSeq + 1;
					elsif( SdrRoutineSeq = 4+page0) then
						SdrCmd <= SdrCmd_bs;
						SdrDat <= (others => 'Z');			
						--rowStoreAck <= '1';				
						SdrRoutineSeq := SdrRoutineSeq + 1;
						SdrAddress(23 downto 19) := "00000";
						SdrAddress(18 downto 9) := curRow;
						SdrAddress(8 downto 0) := "000000000";
						
					elsif( SdrRoutineSeq = 5+page0) then
						SdrCmd <= SdrCmd_ac;
						SdrBa0 <= SdrAddress(22);
						SdrBa1 <= '1';
						SdrAdr <= SdrAddress(21 downto 9);
						colStoreNr <= to_unsigned(page0, colStoreNr'length);						
						SdrRoutineSeq := SdrRoutineSeq + 1;
					elsif( SdrRoutineSeq = 7+page0 ) then
						SdrCmd <= SdrCmd_wr;
						SdrAdr(12 downto 9) <= "0010";
						SdrAdr(8 downto 0) <= SdrAddress(8 downto 0);
						SdrLdq <= '0';
						SdrUdq <= '0';
						SdrDat <= pixelIn;			
						SdrAddress := SdrAddress + 1;						
						colStoreNr <= colStoreNr + 1;						
						SdrRoutineSeq := SdrRoutineSeq + 1;					
					elsif( SdrRoutineSeq >= 8+page0 and SdrRoutineSeq < 8+page0+page1) then
						SdrCmd <= SdrCmd_xx;
						SdrDat <= pixelIn;					
						SdrAddress := SdrAddress + 1;						
						colStoreNr <= colStoreNr + 1;
						SdrRoutineSeq := SdrRoutineSeq + 1;
					elsif( SdrRoutineSeq = 8+page0+page1) then
						SdrCmd <= SdrCmd_bs;
						SdrDat <= (others => 'Z');
						rowStoreAck <= '1';					
						SdrRoutineSeq := SdrRoutineSeq + 1;							
					elsif( SdrRoutineSeq = 9+page0+page1 ) then		
						SdrCmd <= SdrCmd_xx;
						SdrRoutineSeq := 0;
						SdrRoutine := SdrRoutine_Idle;
					else
						SdrCmd <= SdrCmd_xx;
						SdrRoutineSeq := SdrRoutineSeq + 1;					
					end if;
					
			end case;
			
		end if;

	end process;	
	
	
	
	pMemClk   <= clk;
	pMemCke   <= '1';

	pMemBa1   <= SdrBa1;
	pMemBa0   <= SdrBa0;
	pMemAdr   <= SdrAdr;
	pMemDat   <= SdrDat;

	pMemUdq   <= SdrUdq;
	pMemLdq   <= SdrLdq;

	pMemCs_n  <= SdrCmd(3);
	pMemRas_n <= SdrCmd(2);
	pMemCas_n <= SdrCmd(1);
	pMemWe_n  <= SdrCmd(0);

end rtl;
