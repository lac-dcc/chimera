-- SRAM Interface
-- 2017 Luis Antoniosi

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sram is

	generic(
		constant row_width		: integer := 320
	);

	port(
		clk			 	: in std_logic; 
		enable			: in std_logic;
		
		-- store
		pixel_in			: in unsigned(15 downto 0);		
		store_row		: in unsigned(8 downto 0); 
		store_col		: out unsigned(8 downto 0); 

		-- load
		pixel_out		: out unsigned(15 downto 0);		
		load_row			: in unsigned(8 downto 0); 
		load_col			: out unsigned(8 downto 0); 

		-- SRAM ports
		pMemOe   		: out std_logic;                        
		pMemCe   		: out std_logic;                        
		pMemWe    		: out std_logic;                        
		pMemAdr     	: out unsigned(17 downto 0);    			
		pMemDat     	: inout unsigned(15 downto 0);
		pMemLB    		: out std_logic;                        
		pMemUB    		: out std_logic;                        

		-- protocol
		wren				: out std_logic;
		rd_req			: in std_logic;
		rd_ack			: out std_logic;
		wr_req			: in std_logic;
		wr_ack 			: out std_logic
	);
  
end sram;

architecture rtl of sram is

	signal SramCe    	: std_logic;
	signal SramOe     : std_logic;
	signal SramWe     : std_logic;
	signal SramUB		: std_logic;
	signal SramLB		: std_logic;
	signal SramAdr    : unsigned(17 downto 0);
	signal SramDat    : unsigned(15 downto 0);

begin
	
	process( clk, enable )

		type typSramRoutine is ( SramRoutine_Idle, SramRoutine_Load, SramRoutine_Store );
		variable SramRoutine : typSramRoutine := SramRoutine_Idle;
		variable SramRoutineSeq : integer range 0 to 2048 := 0;		
		variable SramAddress : unsigned(17 downto 0);
		
	begin
		if rising_edge(clk) then		
		if (enable = '0') then
			-- disable
			
			SramUB 	<= 'Z';
			SramLB 	<= 'Z';
			SramCe	<= 'Z';
			SramOe 	<= 'Z';
			SramWe 	<= 'Z';		
			SramAdr	<= (others => 'Z');
			SramDat	<= (others => 'Z');
			
			rd_ack <= '0';
			wr_ack <= '0';
			wren <= '0';	
				
			SramRoutine := SramRoutine_Idle;
			SramRoutineSeq := 0;			
		else
		
			rd_ack <= '0';
			wr_ack <= '0';
			wren <= '0';
			
			SramUB <= '0';
			SramLB <= '0';	
			
			case SramRoutine is

				when SramRoutine_Idle =>
					SramDat <= (others => 'Z');
					SramCe <= '1';
					SramOe <= 'Z';
					SramWe <= 'Z';
					SramRoutineSeq := 0;					
					if (rd_req = '1') then					
						SramAddress(8 downto 0) := (others => '0');
						SramAddress(17 downto 9) := load_row(8 downto 0);
						SramRoutine := SramRoutine_Load;
					elsif (wr_req = '1') then
						SramAddress(8 downto 0) := (others => '0');
						SramAddress(17 downto 9) := store_row(8 downto 0);	
						SramRoutine := SramRoutine_Store;
					end if;
															
				when SramRoutine_Load =>
					if SramRoutineSeq = 0 then
						SramCe <= '0';
						SramOe <= '0';
						SramWe <= '1';
						SramDat <= (others => 'Z');	
						SramAdr <= SramAddress;
						load_col <= SramAddress(8 downto 0);
						SramRoutineSeq := SramRoutineSeq + 1;
					elsif SramRoutineSeq < row_width * 2 then
						load_col <= SramAddress(8 downto 0);						

						if (to_unsigned(SramRoutineSeq, 10)(0) = '1') then
							SramAddress := SramAddress + 1;
						end if;

						SramAdr <= SramAddress;						
						pixel_out <= pMemDat;
						wren <= '1';
						SramRoutineSeq := SramRoutineSeq + 1;
						
					else
						rd_ack <= '1';
						SramDat <= (others => 'Z');	
						SramCe <= '1';
						SramOe <= 'Z';
						SramWe <= 'Z';								
						SramRoutine := SramRoutine_Idle;
						SramRoutineSeq := 0;
						
					end if;
					
				when SramRoutine_Store =>
					if SramRoutineSeq = 0 then
						SramCe <= '0';
						SramOe <= '1';
						SramWe <= '0';
						SramAdr <= SramAddress;		
						store_col <= SramAddress(8 downto 0);		
						SramRoutineSeq := SramRoutineSeq + 1;
					elsif SramRoutineSeq < row_width then
						SramDat <= pixel_in;						
						SramAdr <= SramAddress;		
						SramAddress := SramAddress + 1;
						store_col <= SramAddress(8 downto 0);
						SramRoutineSeq := SramRoutineSeq + 1;					
					else					
						wr_ack <= '1';		
						SramDat <= (others => 'Z');	
						SramCe <= '1';
						SramOe <= 'Z';
						SramWe <= 'Z';							
						SramRoutine := SramRoutine_Idle;
						SramRoutineSeq := 0;

					end if;				
						
			end case;
			
		end if;
	
		end if;
			
		pMemUB	 <= SramUB;
		pMemLB	 <= SramLB;
		pMemWe 	 <= SramWe;
		pMemOe 	 <= SramOe;
		pMemCe 	 <= SramCe;
		pMemAdr   <= SramAdr;
		pMemDat   <= SramDat;		
		
	end process;	
			
	
end rtl;
