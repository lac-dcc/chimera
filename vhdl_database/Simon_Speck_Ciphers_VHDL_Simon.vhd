-- Simon.vhd
-- Copyright 2016 Michael Calvin McCoy
-- calvin.mccoy@gmail.com
-- see LICENSE.md
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use work.SIMON_CONSTANTS.all;

entity SIMON_CIPHER is
	Generic(KEY_SIZE : integer range 0 to 256 := 256;
			BLOCK_SIZE : integer range 0 to 128 := 128;
			ROUND_LIMIT: integer range 0 to 72 := 72);
    
    Port (SYS_CLK,RST : in std_logic;
    		BUSY : out  std_logic;
    		CONTROL : in  std_logic_vector(1 downto 0);
    		KEY : in  std_logic_vector (KEY_SIZE - 1 downto 0);
			BLOCK_INPUT : in  std_logic_vector (BLOCK_SIZE - 1 downto 0);
			BLOCK_OUTPUT : out  std_logic_vector (BLOCK_SIZE - 1 downto 0));
			
end SIMON_CIPHER;


architecture Behavioral of SIMON_CIPHER is
-------------------------------------------------------------
-- Cipher Constants
constant WORD_SIZE : integer range 0 to 64 := BLOCK_SIZE / 2;
constant K_SEGMENTS : integer range 0 to 4 := KEY_SIZE /  WORD_SIZE;

constant ROUND_CONSTANT_HI : std_logic_vector(WORD_SIZE - 5 downto 0) := (OTHERS => '1'); 
constant ROUND_CONSTANT_LO : std_logic_vector(3 downto 0) := X"C";
-------------------------------------------------------------

signal ZJ : std_logic_vector(61 downto 0);
signal z_shift : std_logic_vector(61 downto 0);


-- Key Schedule Storage Array
type ARRAY_ROUNDxWORDSIZE is array(0 to (ROUND_LIMIT - 1)) of std_logic_vector(WORD_SIZE - 1 downto 0);
signal key_schedule: ARRAY_ROUNDxWORDSIZE;
signal round_key : std_logic_vector(WORD_SIZE - 1 downto 0);


signal round_constant : std_logic_vector(WORD_SIZE - 1 downto 0);

type ARRAY_PARTKEYxWORD is array (0 to K_SEGMENTS-1) of std_logic_vector(WORD_SIZE - 1 downto 0);
signal key_gen : ARRAY_PARTKEYxWORD;


signal cipher_direction : std_logic;


------------------------------------------------------
-- Fiestel Structure Signals
signal b_buf : STD_LOGIC_VECTOR(WORD_SIZE - 1 downto 0);
signal a_buf : STD_LOGIC_VECTOR(WORD_SIZE - 1 downto 0);
signal b_lft1 : STD_LOGIC_VECTOR(WORD_SIZE - 1 downto 0);
signal b_lft8 : STD_LOGIC_VECTOR(WORD_SIZE - 1 downto 0);
signal b_lft2 : STD_LOGIC_VECTOR(WORD_SIZE - 1 downto 0);

signal b_and : STD_LOGIC_VECTOR(WORD_SIZE - 1 downto 0);

signal b_xor : STD_LOGIC_VECTOR(WORD_SIZE - 1 downto 0);

signal a_xor : STD_LOGIC_VECTOR(WORD_SIZE - 1 downto 0);

signal key_xor : STD_LOGIC_VECTOR(WORD_SIZE - 1 downto 0);

--------------------------------------------------------


--------------------------------------------------------
-- Key Generation Signals
signal key_temp_1 : std_logic_vector(WORD_SIZE -1 downto 0);
signal key_temp_2 : std_logic_vector(WORD_SIZE -1 downto 0);
signal rs3  : STD_LOGIC_VECTOR(WORD_SIZE - 1 downto 0);
signal rs1  : STD_LOGIC_VECTOR(WORD_SIZE - 1 downto 0);
signal zji  : STD_LOGIC_VECTOR(WORD_SIZE - 1 downto 0);

type state is (Reset,Idle,Key_Schedule_Generation_Run,Key_Schedule_Generation_Finish,
	Cipher_Start,Cipher_Run,Cipher_Finish_1,Cipher_Finish_2,Cipher_Latch);
signal pr_state,nx_state : state;

signal round_count : integer range 0 to (ROUND_LIMIT - 1);
signal inv_round_count : integer range 0 to (ROUND_LIMIT - 1);
signal round_count_mux : integer range 0 to (ROUND_LIMIT - 1);

signal key_feedback : std_logic_vector(WORD_SIZE - 1 downto 0);

begin

----------------------------------------------------------------------
-- State Machine Processes
----------------------------------------------------------------------
State_Machine_Head : process (SYS_CLK) ----State Machine Master Control
begin
	if (SYS_CLK'event and SYS_CLK='1') then
		if (RST = '1') then
			pr_state <= RESET;
		else
			pr_state <= nx_state;
		end if;
	end if;
end process; -- State_Machine_Head

State_Machine_Body : process (CONTROL, round_count, pr_state) ---State Machine State Definitions
begin
	case pr_state is
		
		when Reset =>  --Master Reset State
			nx_state <= Idle;

		when Idle =>  
			if (CONTROL = "01") then
				nx_state <= Key_Schedule_Generation_Run;
			elsif (CONTROL = "11" or CONTROL = "10") then
				nx_state <= Cipher_Start;
			else
				nx_state <= Idle;
			end if;	

		when Key_Schedule_Generation_Run =>  
			if (round_count = ROUND_LIMIT - 2) then
				nx_state <= Key_Schedule_Generation_Finish;
			else
				nx_state <= Key_Schedule_Generation_Run;
			end if;	

		when Key_Schedule_Generation_Finish =>  
			nx_state <= Idle;

		when Cipher_Start =>
			nx_state <= Cipher_Run;

		when Cipher_Run =>  
			if (round_count = ROUND_LIMIT - 2) then
				nx_state <= Cipher_Finish_1;
			else
				nx_state <= Cipher_Run;
			end if;	

		when Cipher_Finish_1 =>  
			nx_state <= Cipher_Finish_2;

		when Cipher_Finish_2 =>  
			nx_state <= Cipher_Latch;
		
		when Cipher_Latch =>
			nx_state <= Idle;

	end case;
end process;

----------------------------------------------------------------------
-- END State Machine Processes
----------------------------------------------------------------------



----------------------------------------------------------------------
-- Register Processes
----------------------------------------------------------------------
Cipher_Direction_Flag : process(SYS_CLK)
begin
	if SYS_CLK'event and SYS_CLK = '1' then
		if (pr_state = Reset) then
			cipher_direction <= '0';
		elsif (pr_state = Idle) then
			cipher_direction <= CONTROL(0);			
		end if ;
	end if;
end process;


Busy_Flag_Generator : process(SYS_CLK)
begin
	if SYS_CLK'event and SYS_CLK = '1' then
		if (pr_state = Reset or (pr_state = Idle and CONTROL /= "00")) then
			BUSY <= '1';
		elsif ((pr_state = Idle and CONTROL = "00") or pr_state = Cipher_Latch or pr_state = Key_Schedule_Generation_Finish) then
			BUSY <= '0';
		end if;
	end if;	
end process ; -- Busy_Flag_Generator


Key_Schedule_Generator : process(SYS_CLK)
begin
	if SYS_CLK'event and SYS_CLK = '1' then
		if (pr_state = Idle) then
			Init_Gen_Regs : for i in 0 to (K_SEGMENTS-1) loop
				key_gen(i) <= key(((i + 1) * WORD_SIZE) - 1 downto (i * WORD_SIZE));
			end loop ; -- Update_Gen_Regs

			z_shift <= ZJ;

		elsif (pr_state = Key_Schedule_Generation_Run or pr_state = Key_Schedule_Generation_Finish) then
						
			key_gen(K_SEGMENTS-1) <= key_feedback;
			
			for i in 0 to (K_SEGMENTS-2) loop
				key_gen(i) <= key_gen(i+1);
			end loop ;

			z_shift <= z_shift(0) & z_shift(61 downto 1);
		
		end if;
	end if;
end process ; -- Key_Schedule_Generator


Fiestel_Round : process(SYS_CLK)
begin
	if SYS_CLK'event and SYS_CLK = '1' then
		if (pr_state = Idle) then
			
			-- Load for Encryption
			if (CONTROL = "11") then
				a_buf <= BLOCK_INPUT(WORD_SIZE - 1 downto 0);
				b_buf <= BLOCK_INPUT(BLOCK_SIZE - 1 downto WORD_SIZE);
			
			-- Load for Decryption
			elsif (CONTROL = "10") then
				a_buf <= BLOCK_INPUT(BLOCK_SIZE - 1 downto WORD_SIZE);
				b_buf <= BLOCK_INPUT(WORD_SIZE - 1 downto 0);
			end if;
		
		-- Run Cipher Engine
		elsif (pr_state = Cipher_Run  or pr_state = Cipher_Finish_1 or pr_state = Cipher_Finish_2) then
			a_buf <= b_buf;
			b_buf <= key_xor;
		end if;
	end if;
end process ; -- Fiestel_Round


Output_Buffer : process(SYS_CLK)
begin
	if SYS_CLK'event and SYS_CLK = '1' then
		if (pr_state = Cipher_Latch) then
			if (cipher_direction = '1') then
				BLOCK_OUTPUT <= b_buf & a_buf;
			else
				BLOCK_OUTPUT <= a_buf & b_buf;
			end if;
		end if;
	end if;
end process ; -- Output_Buffer

----------------------------------------------------------------------
-- END Register Processes
----------------------------------------------------------------------



----------------------------------------------------------------------
-- RAM Processes
----------------------------------------------------------------------

Key_Schedule_Array: process (SYS_CLK)   
begin   
	if (SYS_CLK'event and SYS_CLK = '1') then
		round_key <= key_schedule(round_count_mux);  
		if (pr_state = Key_Schedule_Generation_Run or pr_state = Key_Schedule_Generation_Finish) then   
        	key_schedule(round_count) <= key_gen(0);   
      	end if;   
	end if;   
end process;   



----------------------------------------------------------------------
-- End RAM Processes
----------------------------------------------------------------------



----------------------------------------------------------------------
-- Counter Processes
----------------------------------------------------------------------
	
Round_Counter : process(SYS_CLK)
begin
	if (SYS_CLK'event and SYS_CLK = '1') then
		if (pr_state = Reset) then
			round_count <= 0;
			inv_round_count <= 0;
		elsif (pr_state = Idle) then
			round_count <= 0;
			inv_round_count <= ROUND_LIMIT - 1;
		elsif (pr_state = Cipher_Start or pr_state = Cipher_Run or pr_state = Key_Schedule_Generation_Run) then
			round_count <= round_count + 1;
			inv_round_count <= inv_round_count - 1;
		end if ;
	end if ;
end process;
	
----------------------------------------------------------------------
-- END Counter Processes
----------------------------------------------------------------------


----------------------------------------------------------------------
-- Async Signals
----------------------------------------------------------------------
ZJ <= Z_Array_Lookup(KEY_SIZE,BLOCK_SIZE);

round_count_mux <= round_count when cipher_direction = '1' else inv_round_count;



-- Fiestel Round
b_lft1 <= b_buf((WORD_SIZE - 2) downto 0) & b_buf(WORD_SIZE - 1);
b_lft8 <= b_buf((WORD_SIZE - 9) downto 0) & b_buf(WORD_SIZE - 1 downto (WORD_SIZE- 8));
b_lft2 <= b_buf((WORD_SIZE - 3) downto 0) & b_buf(WORD_SIZE - 1 downto (WORD_SIZE- 2));

b_and <= b_lft1 and b_lft8;

b_xor <= b_and xor b_lft2;

a_xor <= a_buf xor b_xor;

key_xor <= round_key xor a_xor;


-- Key Schedule Generation Logic
rs3 <= key_gen(K_SEGMENTS - 1)(2 downto 0) & key_gen(K_SEGMENTS - 1)(WORD_SIZE - 1 downto 3);

Key_Feedback_1 : if (K_SEGMENTS /= 4) generate
begin
	key_temp_1 <= rs3; 
end generate;

Key_Feedback_2 : if (K_SEGMENTS = 4) generate
begin
	key_temp_1 <= rs3 xor key_gen(1);	
end generate;

rs1 <= key_temp_1(0) & key_temp_1(WORD_SIZE - 1 downto 1);

key_temp_2 <= (key_gen(0) xor key_temp_1) xor rs1;

round_constant <= ROUND_CONSTANT_HI & ROUND_CONSTANT_LO;
zji <= round_constant(WORD_SIZE - 1 downto 1) & z_shift(0);

key_feedback <= key_temp_2 xor zji;





end Behavioral;

	
