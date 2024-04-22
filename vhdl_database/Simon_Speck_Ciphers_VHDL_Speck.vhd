-- Speck.vhd
-- Copyright 2016 Michael Calvin McCoy
-- calvin.mccoy@gmail.com
-- see LICENSE.md
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use work.SPECK_CONSTANTS.all;

entity SPECK_CIPHER is
	Generic(KEY_SIZE : integer range 0 to 256 := 256;
			BLOCK_SIZE : integer range 0 to 128 := 128;
			ROUND_LIMIT: integer range 0 to 34 := 34);
    
    Port (SYS_CLK,RST : in std_logic;
    		BUSY : out  std_logic;
    		CONTROL : in  std_logic_vector(1 downto 0);
    		KEY : in  std_logic_vector (KEY_SIZE - 1 downto 0);
			BLOCK_INPUT : in  std_logic_vector (BLOCK_SIZE - 1 downto 0);
			BLOCK_OUTPUT : out  std_logic_vector (BLOCK_SIZE - 1 downto 0));
			
end SPECK_CIPHER;


architecture Behavioral of SPECK_CIPHER is

-------------------------------------------------------------
-- Cipher Constants
constant WORD_SIZE : integer range 0 to 64 := BLOCK_SIZE / 2;
constant KEY_WORDS_M : integer range 0 to 4 := KEY_SIZE / WORD_SIZE;
constant ALPHA_SHIFT : integer range 0 to 15 := Alpha_Lookup(KEY_SIZE, BLOCK_SIZE);
constant BETA_SHIFT : integer range 0 to 3 := Beta_Lookup(KEY_SIZE, BLOCK_SIZE);
-------------------------------------------------------------

-- Key Schedule Storage Array
type ARRAY_ROUNDxWORDSIZE is array(0 to (ROUND_LIMIT - 1)) of std_logic_vector(WORD_SIZE - 1 downto 0);
signal key_schedule: ARRAY_ROUNDxWORDSIZE;
signal round_key : std_logic_vector(WORD_SIZE - 1 downto 0);

type ARRAY_PARTKEYxWORD is array (0 to KEY_WORDS_M-1) of std_logic_vector(WORD_SIZE - 1 downto 0);
signal key_l : ARRAY_PARTKEYxWORD;
signal key_feedback : ARRAY_PARTKEYxWORD;
signal key_gen_round_output : STD_LOGIC_VECTOR(BLOCK_SIZE - 1 downto 0);

------------------------------------------------------
-- Fiestel Structure Signals
signal b_buf : STD_LOGIC_VECTOR(WORD_SIZE - 1 downto 0);
signal a_buf : STD_LOGIC_VECTOR(WORD_SIZE - 1 downto 0);
signal encryption_round_output : STD_LOGIC_VECTOR(BLOCK_SIZE - 1 downto 0);
signal decryption_round_output : STD_LOGIC_VECTOR(BLOCK_SIZE - 1 downto 0);

--------------------------------------------------------


--------------------------------------------------------
-- State Machine Signals

type state is (Reset,Idle,Key_Schedule_Generation_Run,Key_Schedule_Generation_Finish,
	Cipher_Start,Cipher_Run,Cipher_Finish_1,Cipher_Finish_2,Cipher_Latch);
signal pr_state,nx_state : state;
--------------------------------------------------------

--------------------------------------------------------
-- Round Counting Signals 
signal round_count : integer range 0 to (ROUND_LIMIT - 1);
signal inv_round_count : integer range 0 to (ROUND_LIMIT - 1);
signal round_count_mux : integer range 0 to (ROUND_LIMIT - 1);
signal cipher_direction : std_logic;
--------------------------------------------------------

function  Encrypt_Round(b, a, key_i : std_logic_vector(WORD_SIZE -1 downto 0)) return std_logic_vector is
  variable b_unsigned : unsigned(WORD_SIZE - 1 downto 0);
  variable a_unsigned : unsigned(WORD_SIZE - 1 downto 0);
  variable r_shift_alpha : unsigned(WORD_SIZE - 1 downto 0);
  variable l_shift_beta : unsigned(WORD_SIZE - 1 downto 0);
  variable adder: unsigned(WORD_SIZE - 1 downto 0);
  variable key_xor : unsigned(WORD_SIZE - 1 downto 0);
  variable cross_xor : unsigned(WORD_SIZE - 1 downto 0);
  
  variable encrypt_output : std_logic_vector(BLOCK_SIZE - 1 downto 0);
begin
	
	b_unsigned := unsigned(b);

  	a_unsigned := unsigned(a);
	
	r_shift_alpha := b_unsigned(ALPHA_SHIFT - 1 downto 0) & b_unsigned(WORD_SIZE -1 downto ALPHA_SHIFT);
	
	l_shift_beta := a_unsigned(WORD_SIZE - (BETA_SHIFT + 1) downto 0) & a_unsigned((WORD_SIZE -1) downto (WORD_SIZE - BETA_SHIFT));

	adder := r_shift_alpha + a_unsigned;

	key_xor := adder xor unsigned(key_i);

	cross_xor := l_shift_beta xor key_xor;	

	encrypt_output := std_logic_vector(key_xor) & std_logic_vector(cross_xor);

  	return encrypt_output;
end Encrypt_Round;


function  Decrypt_Round(b, a, key_i : std_logic_vector(WORD_SIZE -1 downto 0)) return std_logic_vector is
  variable b_unsigned : unsigned(WORD_SIZE - 1 downto 0);
  variable a_unsigned : unsigned(WORD_SIZE - 1 downto 0);
  variable l_shift_alpha : unsigned(WORD_SIZE - 1 downto 0);
  variable r_shift_beta : unsigned(WORD_SIZE - 1 downto 0);
  variable subtractor: unsigned(WORD_SIZE - 1 downto 0);
  variable key_xor : unsigned(WORD_SIZE - 1 downto 0);
  variable cross_xor : unsigned(WORD_SIZE - 1 downto 0);

  variable decrypt_output : std_logic_vector(BLOCK_SIZE - 1 downto 0);
begin

	b_unsigned := unsigned(b);

  	a_unsigned := unsigned(a);
	
	cross_xor := b_unsigned xor a_unsigned;	

	r_shift_beta := cross_xor(BETA_SHIFT - 1 downto 0) & cross_xor(WORD_SIZE -1 downto BETA_SHIFT); 

	key_xor := b_unsigned xor unsigned(key_i);
	
	subtractor := key_xor - r_shift_beta;

	l_shift_alpha := subtractor(WORD_SIZE - (ALPHA_SHIFT + 1) downto 0) & subtractor((WORD_SIZE -1) downto (WORD_SIZE - ALPHA_SHIFT));
	
	decrypt_output := std_logic_vector(l_shift_alpha) & std_logic_vector(r_shift_beta);

  	return decrypt_output;
end Decrypt_Round;


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
			Init_Gen_Regs : for i in 0 to (KEY_WORDS_M -1) loop
				key_l(i) <= key(((i + 1) * WORD_SIZE) - 1 downto (i * WORD_SIZE));
			end loop ; -- Update_Gen_Regs

		elsif (pr_state = Key_Schedule_Generation_Run or pr_state = Key_Schedule_Generation_Finish) then
			for i in 0 to (KEY_WORDS_M - 1) loop
				key_l(i) <= key_feedback(i);
			end loop;
		end if;
	end if;
end process ; -- Key_Schedule_Generator


Main_Cipher_Process : process(SYS_CLK)
begin
	if SYS_CLK'event and SYS_CLK = '1' then
		-- Load for Encryption/Decryption
		if (pr_state = Idle) then
			if (CONTROL(1) = '1') then
				a_buf <= BLOCK_INPUT(WORD_SIZE - 1 downto 0);
				b_buf <= BLOCK_INPUT(BLOCK_SIZE - 1 downto WORD_SIZE);
			end if;
		
		-- Run Cipher Engine
		elsif (pr_state = Cipher_Run  or pr_state = Cipher_Finish_1 or pr_state = Cipher_Finish_2) then
			if (cipher_direction = '1') then  -- Encryption
				a_buf <= encryption_round_output(WORD_SIZE - 1 downto 0);
				b_buf <= encryption_round_output(BLOCK_SIZE - 1 downto WORD_SIZE);
			else  -- Decryption
				a_buf <= decryption_round_output(WORD_SIZE - 1 downto 0);
				b_buf <= decryption_round_output(BLOCK_SIZE - 1 downto WORD_SIZE);
			end if;
		end if;
	end if;
end process ;


Output_Buffer : process(SYS_CLK)
begin
	if SYS_CLK'event and SYS_CLK = '1' then
		if (pr_state = Cipher_Latch) then
			BLOCK_OUTPUT <= b_buf & a_buf;
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
        	key_schedule(round_count) <= key_l(0);   
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

round_count_mux <= round_count when cipher_direction = '1' else inv_round_count;

key_gen_round_output <= Encrypt_Round(key_l(1), key_l(0), std_logic_vector(to_unsigned(round_count, WORD_SIZE)));

encryption_round_output <= Encrypt_Round(b_buf, a_buf, round_key);

decryption_round_output <= Decrypt_Round(b_buf, a_buf, round_key);

key_feedback(0) <= key_gen_round_output(WORD_SIZE - 1 downto 0);
key_feedback(KEY_WORDS_M - 1) <= key_gen_round_output(BLOCK_SIZE - 1 downto WORD_SIZE);
			
Keys_3 : if (KEY_WORDS_M = 3) generate
begin
		key_feedback(1) <= key_l(2); 
end generate;

Keys_4 : if (KEY_WORDS_M = 4) generate
begin
	key_feedback(1) <= key_l(2);
	key_feedback(2) <= key_l(3);		
end generate;






end Behavioral;
