library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all; 

entity lcd_control is 
   port ( 
       rst		: in STD_LOGIC; 
       clk		: in STD_LOGIC;
       lap		: in STD_LOGIC;
		 mode		: in STD_LOGIC;
		 hundredths	: in std_logic_vector (3 downto 0);
		 tenths	: in std_logic_vector (3 downto 0);
		 ones	: in std_logic_vector (3 downto 0);
		 tens	: in std_logic_vector (3 downto 0);
		 minutes	: in std_logic_vector (3 downto 0); 
       control	: out std_logic_vector (2 downto 0); -- LCD_RS, LCD_RW, LCD_E
       sf_d: out STD_LOGIC_VECTOR (7 downto 0)); --LCD data bus
end lcd_control; 

architecture lcd_control_arch of lcd_control is
type state_type is (waiting, init1,init2,init3,init4,init5,init6,init7,
							word1,word2,word3,word4,word5,alt_word5,word6,word7,word8,word9,word10,
							time_display1,time_display2,time_display3,time_display4,time_display5,
							time_display6,time_display7,time_display8,time_display9,time_display10,
							time_display11,time_display12,time_display13,time_display14,
							lap_display1,lap_display2,lap_display3,lap_display4,lap_display5,
							lap_display6,lap_display7,lap_display8,lap_display9,lap_display10,
							lap_display11,lap_display12,lap_display13,lap_display14,
							donestate);
signal state,next_state  : state_type;
signal mode_state,next_mode_state : std_logic := '0';
signal sf_d_temp 			 : std_logic_vector (7 downto 0) := "00000000";
signal lap_min,lap_tens,lap_ones,lap_tenths,lap_hundredths : std_logic_vector (3 downto 0) := "0000";
signal count, count_temp : integer := 0;
signal state_flag					 : std_logic := '0';
signal lap_flag, set_lap_flag	 : std_logic := '1';
signal set_timer_flag, timer_flag  : std_logic := '0';
signal set_clock_flag, clock_flag  : std_logic := '1';
constant TIME1 : integer := 750000;
constant TIME2 : integer := 1;
constant TIME3 : integer := 210000;
constant TIME4 : integer := 420000;
begin 

run : process (clk,state,count,minutes,tens,ones,tenths,hundredths,lap_flag,lap_min,lap_tens,
					lap_ones,lap_tenths,lap_hundredths,timer_flag,clock_flag,mode) is
begin
set_lap_flag <= lap_flag;
set_timer_flag <= timer_flag;
set_clock_flag <= clock_flag;
	case state is	 
		-- Initialization Starts --------------------------------
		when waiting =>
			sf_d_temp <= "00000000";
			control <= "000"; 								-- RS, RW, E		 
			if 	(count >= TIME1) then
					next_state <= init1;      state_flag <= '1';  
			else	next_state <= waiting; state_flag <= '0';
			end if;
		when init1 => 
			sf_d_temp <= "00111100";	--Function set DL = 8bit, NL = 2, Font = 5x11
			if 	(count = TIME4) then
					next_state <= init2;	control <= "001"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME4) then
					next_state <= init1; control <= "000"; state_flag <= '0';  
			else	next_state <= init1; control <= "001"; state_flag <= '0';
			end if;
		when init2 => 
			sf_d_temp <= "00111100";	--Function set DL = 8bit, NL = 2, Font = 5x11
			if 	(count = TIME4) then
					next_state <= init3;	control <= "001"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME4) then
					next_state <= init2; control <= "000"; state_flag <= '0';  
			else  next_state <= init2; control <= "001"; state_flag <= '0';
			end if;
		when init3 =>
			sf_d_temp <= "00111100";	 --Function set DL = 8bit, NL = 2, Font = 5x11
			if 	(count = TIME4) then
					next_state <= init4;	control <= "001"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME4) then
					next_state <= init3; control <= "000"; state_flag <= '0';  
			else	next_state <= init3; control <= "001"; state_flag <= '0';
			end if;
		when init4 =>
			sf_d_temp <= "00111100";	 --Function set DL = 8bit, NL = 2, Font = 5x11
			if 	(count = TIME3) then
					next_state <= init5;	control <= "001"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= init4; control <= "000"; state_flag <= '0';  
			else	next_state <= init4; control <= "001"; state_flag <= '0';
			end if;
		when init5 =>
			sf_d_temp <= "00001100";	 --Set Display Display=on, Cursor=off, cursor_position=off
			if 	(count = TIME3) then
					next_state <= init6; control <= "001"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= init5; control <= "000"; state_flag <= '0';  
			else	next_state <= init5; control <= "001"; state_flag <= '0';
			end if;
		when init6 =>
			sf_d_temp <= "00000001";	 --Clear Display
			set_timer_flag <= '0'; set_clock_flag <= '0';  --reset display flags			
			if 	(count = TIME3) then
					next_state <= init7; control <= "001"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= init6; control <= "000"; state_flag <= '0';  
			else	next_state <= init6; control <= "001"; state_flag <= '0';
			end if;
		when init7 =>
			sf_d_temp <= "00000110";	 --Entry Mode set ID=1, S=0
			if 	(count = TIME3) then
					next_state <= word1; control <= "001"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= init7; control <= "000"; state_flag <= '0';  
			else	next_state <= init7; control <= "001"; state_flag <= '0';
			end if;
		-- Initialization Ends -----------------------------------


-------------------------Write out 'Time:'-----------------------
		when word1 =>
			sf_d_temp <= "01010100"; -- T	 
			if 	(count = TIME3) then
					next_state <= word2; control <= "101"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= word1; control <= "100"; state_flag <= '0';  
			else	next_state <= word1; control <= "101"; state_flag <= '0';
			end if;	
		when word2 =>
			sf_d_temp <= "01101001"; -- i	 
			if 	(count = TIME3) then
					next_state <= word3; control <= "101"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= word2; control <= "100"; state_flag <= '0';  
			else	next_state <= word2; control <= "101"; state_flag <= '0';
			end if;	
		when word3 =>
			sf_d_temp <= "01101101"; -- m	 
			if 	(count = TIME3) then
					next_state <= word4; control <= "101"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= word3; control <= "100"; state_flag <= '0';  
			else	next_state <= word3; control <= "101"; state_flag <= '0';
			end if;	
		when word4 =>
			sf_d_temp <= "01100101"; -- e	 
			if 	(count = TIME3) then
				if (mode = '1') then  -- Clock mode
					next_state <= word5; control <= "101"; state_flag <= '1';
				else						-- Timer Mode
					next_state <= alt_word5; control <= "101"; state_flag <= '1';
				end if;	
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= word4; control <= "100"; state_flag <= '0';  
			else	next_state <= word4; control <= "101"; state_flag <= '0';
			end if;	
		when alt_word5 =>
			sf_d_temp <= "01110010"; -- r written if in timer mode		
			if 	(count = TIME3) then
					next_state <= time_display1; control <= "101"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= alt_word5; control <= "100"; state_flag <= '0';  
			else	next_state <= alt_word5; control <= "101"; state_flag <= '0';
			end if;	
			when word5 =>
			sf_d_temp <= "00111010"; -- [colon]		
			if 	(count = TIME3) then
					next_state <= word6; control <= "101"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= word5; control <= "100"; state_flag <= '0';  
			else	next_state <= word5; control <= "101"; state_flag <= '0';
			end if;	
-------------------------Write out 'Lap:'-----------------------			
		when word6 =>
			sf_d_temp <= "11000000"; -- Set Address hx40	 
			if 	(count = TIME3) then
					next_state <= word7; control <= "001"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= word6; control <= "000"; state_flag <= '0';  
			else	next_state <= word6; control <= "001"; state_flag <= '0';
			end if;	
		when word7 =>
			sf_d_temp <= "01001100"; -- L	 
			if 	(count = TIME3) then
					next_state <= word8; control <= "101"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= word7; control <= "100"; state_flag <= '0';  
			else	next_state <= word7; control <= "101"; state_flag <= '0';
			end if;	
		when word8 =>
			sf_d_temp <= "01100001"; -- a	 
			if 	(count = TIME3) then
					next_state <= word9; control <= "101"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= word8; control <= "100"; state_flag <= '0';  
			else	next_state <= word8; control <= "101"; state_flag <= '0';
			end if;	
		when word9 =>
			sf_d_temp <= "01110000"; -- p	 
			if 	(count = TIME3) then
					next_state <= word10; control <= "101"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= word9; control <= "100"; state_flag <= '0';  
			else	next_state <= word9; control <= "101"; state_flag <= '0';
			end if;	
		when word10 =>
			sf_d_temp <= "00111010"; -- [colon]		
			if 	(count = TIME3) then
					next_state <= time_display1; control <= "101"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= word10; control <= "100"; state_flag <= '0';  
			else	next_state <= word10; control <= "101"; state_flag <= '0';
			end if;	
	
----------------------- Time Display--------------------------------------
		when time_display1 =>
			sf_d_temp <= "10000110"; -- Set Address hx06	 
			if 	(count = TIME3) then
					next_state <= time_display2; control <= "001"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= time_display1; control <= "000"; state_flag <= '0';  
			else	next_state <= time_display1; control <= "001"; state_flag <= '0';
			end if;
		when time_display2=>   -- Display minute digit
			case minutes is  
				when "0000" => sf_d_temp <= "00110000"; --0
      		when "0001" => sf_d_temp <= "00110001"; --1
      		when "0010" => sf_d_temp <= "00110010"; --2
      		when "0011" => sf_d_temp <= "00110011"; --3
      		when "0100" => sf_d_temp <= "00110100"; --4
      		when "0101" => sf_d_temp <= "00110101"; --5
      		when "0110" => sf_d_temp <= "00110110"; --6
      		when "0111" => sf_d_temp <= "00110111"; --7
      		when "1000" => sf_d_temp <= "00111000"; --8
      		when "1001" => sf_d_temp <= "00111001"; --9
				when others => sf_d_temp <= "00101101"; --[-]
			end case;
			if 	(count = TIME3) then
					next_state <= time_display3; control <= "101"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= time_display2; control <= "100"; state_flag <= '0';  
			else	next_state <= time_display2; control <= "101"; state_flag <= '0';
			end if;
		when time_display3 =>
			sf_d_temp <= "10000111"; -- Set Address hx07	 
			if 	(count = TIME3) then
					next_state <= time_display4; control <= "001"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= time_display3; control <= "000"; state_flag <= '0';  
			else	next_state <= time_display3; control <= "001"; state_flag <= '0';
			end if;
		when time_display4 =>
			sf_d_temp <= "00111010"; -- [colon]	 
			if 	(count = TIME3) then
					next_state <= time_display5; control <= "101"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= time_display4; control <= "100"; state_flag <= '0';  
			else	next_state <= time_display4; control <= "101"; state_flag <= '0';
			end if;	
		when time_display5 =>
			sf_d_temp <= "10001000"; -- Set Address hx08	 
			if 	(count = TIME3) then
					next_state <= time_display6; control <= "001"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= time_display5; control <= "000"; state_flag <= '0';  
			else	next_state <= time_display5; control <= "001"; state_flag <= '0';
			end if;	
		when time_display6=>   -- Display tens of seconds digit
			case tens is
				when "0000" => sf_d_temp <= "00110000"; --0
      		when "0001" => sf_d_temp <= "00110001"; --1
      		when "0010" => sf_d_temp <= "00110010"; --2
      		when "0011" => sf_d_temp <= "00110011"; --3
      		when "0100" => sf_d_temp <= "00110100"; --4
      		when "0101" => sf_d_temp <= "00110101"; --5
      		when "0110" => sf_d_temp <= "00110110"; --6
      		when "0111" => sf_d_temp <= "00110111"; --7
      		when "1000" => sf_d_temp <= "00111000"; --8
      		when "1001" => sf_d_temp <= "00111001"; --9
				when others => sf_d_temp <= "00101101"; --[-]
			end case;
			if 	(count = TIME3) then
					next_state <= time_display7; control <= "101"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= time_display6; control <= "100"; state_flag <= '0';  
			else	next_state <= time_display6; control <= "101"; state_flag <= '0';
			end if;
		when time_display7 =>
			sf_d_temp <= "10001001"; -- Set Address hx09	 
			if 	(count = TIME3) then
					next_state <= time_display8; control <= "001"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= time_display7; control <= "000"; state_flag <= '0';  
			else	next_state <= time_display7; control <= "001"; state_flag <= '0';
			end if;
		when time_display8 =>   -- Display seconds digit
			case ones is     		 
				when "0000" => sf_d_temp <= "00110000"; --0 		
				when "0001" => sf_d_temp <= "00110001"; --1 		
				when "0010" => sf_d_temp <= "00110010"; --2 		
				when "0011" => sf_d_temp <= "00110011"; --3		
				when "0100" => sf_d_temp <= "00110100"; --4	
				when "0101" => sf_d_temp <= "00110101"; --5		 
				when "0110" => sf_d_temp <= "00110110"; --6	
				when "0111" => sf_d_temp <= "00110111"; --7	
				when "1000" => sf_d_temp <= "00111000"; --8	
				when "1001" => sf_d_temp <= "00111001"; --9	
				when others => sf_d_temp <= "00101101"; --[-]
			end case;
			if 	(count = TIME3) then
					next_state <= time_display9; control <= "101"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= time_display8; control <= "100"; state_flag <= '0';  
			else	next_state <= time_display8; control <= "101"; state_flag <= '0';
			end if;
		when time_display9 =>
			sf_d_temp <= "10001010"; -- Set Address hx0A	 
			if 	(count = TIME3) then
					next_state <= time_display10; control <= "001"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= time_display9; control <= "000"; state_flag <= '0';  
			else	next_state <= time_display9; control <= "001"; state_flag <= '0';
			end if;
		when time_display10 =>
			sf_d_temp <= "00111010"; -- [colon]	 
			if 	(count = TIME3) then
					next_state <= time_display11; control <= "101"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= time_display10; control <= "100"; state_flag <= '0';  
			else	next_state <= time_display10; control <= "101"; state_flag <= '0';
			end if;	
		when time_display11 =>
			sf_d_temp <= "10001011"; -- Set Address hx0B	 
			if 	(count = TIME3) then
					next_state <= time_display12; control <= "001"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= time_display11; control <= "000"; state_flag <= '0';  
			else	next_state <= time_display11; control <= "001"; state_flag <= '0';
			end if;
		when time_display12 =>   -- Display tenths of second digit
			case tenths is
				when "0000" => sf_d_temp <= "00110000"; --0
      		when "0001" => sf_d_temp <= "00110001"; --1
      		when "0010" => sf_d_temp <= "00110010"; --2
      		when "0011" => sf_d_temp <= "00110011"; --3
      		when "0100" => sf_d_temp <= "00110100"; --4
      		when "0101" => sf_d_temp <= "00110101"; --5
      		when "0110" => sf_d_temp <= "00110110"; --6
      		when "0111" => sf_d_temp <= "00110111"; --7
      		when "1000" => sf_d_temp <= "00111000"; --8
      		when "1001" => sf_d_temp <= "00111001"; --9
				when others => sf_d_temp <= "00101101"; --[-]
			end case;                                                                  
			if 	(count = TIME3) then
					next_state <= time_display13; control <= "101"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= time_display12; control <= "100"; state_flag <= '0';  
			else	next_state <= time_display12; control <= "101"; state_flag <= '0';
			end if;
		when time_display13 =>
			sf_d_temp <= "10001100"; -- Set Address hx0C	 
			if 	(count = TIME3) then
					next_state <= time_display14; control <= "001"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= time_display13; control <= "000"; state_flag <= '0';  
			else	next_state <= time_display13; control <= "001"; state_flag <= '0';
			end if;
		when time_display14 =>   -- Display hundredths of second digit
			case hundredths is
				when "0000" => sf_d_temp <= "00110000"; --0
      		when "0001" => sf_d_temp <= "00110001"; --1
      		when "0010" => sf_d_temp <= "00110010"; --2
      		when "0011" => sf_d_temp <= "00110011"; --3
      		when "0100" => sf_d_temp <= "00110100"; --4
      		when "0101" => sf_d_temp <= "00110101"; --5
      		when "0110" => sf_d_temp <= "00110110"; --6
      		when "0111" => sf_d_temp <= "00110111"; --7
      		when "1000" => sf_d_temp <= "00111000"; --8
      		when "1001" => sf_d_temp <= "00111001"; --9
				when others => sf_d_temp <= "00101101"; --[-]
			end case;                                             
			if 	(count = TIME3) then
				if ((mode = '1') AND (lap_flag = '1')) then -- Clock mode lap_flag triggered
					next_state <= lap_display1; control <= "101"; state_flag <= '1';
				elsif ((mode = '1') AND (lap_flag = '0')) then -- Clock mode
					if (clock_flag ='1') then
						next_state <= init6; control <= "101"; state_flag <= '1'; set_clock_flag <= '0';
					else next_state <= lap_display1; control <= "101"; state_flag <= '1';
					end if;
				elsif (mode = '0') then -- timer mode
					if (timer_flag ='1') then
						next_state <= init6; control <= "101"; state_flag <= '1'; set_timer_flag <= '0';
					else next_state <= time_display1; control <= "101"; state_flag <= '1';
					end if;
				else	
					next_state <= time_display1; control <= "101"; state_flag <= '1';
				end if;	
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= time_display14; control <= "100"; state_flag <= '0';  
			else	next_state <= time_display14; control <= "101"; state_flag <= '0';
			end if;

----------------------- Lap Time Display--------------------------------------
		when lap_display1 =>
			sf_d_temp <= "11000110"; -- Set Address hx46	 
			if 	(count = TIME3) then
					next_state <= lap_display2; control <= "001"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= lap_display1; control <= "000"; state_flag <= '0';  
			else	next_state <= lap_display1; control <= "001"; state_flag <= '0';
			end if;
		when lap_display2=>   -- Display minute digit
			case lap_min is  
				when "0000" => sf_d_temp <= "00110000"; --0
      		when "0001" => sf_d_temp <= "00110001"; --1
      		when "0010" => sf_d_temp <= "00110010"; --2
      		when "0011" => sf_d_temp <= "00110011"; --3
      		when "0100" => sf_d_temp <= "00110100"; --4
      		when "0101" => sf_d_temp <= "00110101"; --5
      		when "0110" => sf_d_temp <= "00110110"; --6
      		when "0111" => sf_d_temp <= "00110111"; --7
      		when "1000" => sf_d_temp <= "00111000"; --8
      		when "1001" => sf_d_temp <= "00111001"; --9
				when others => sf_d_temp <= "00101101"; --[-]
			end case;
			if 	(count = TIME3) then
					next_state <= lap_display3; control <= "101"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= lap_display2; control <= "100"; state_flag <= '0';  
			else	next_state <= lap_display2; control <= "101"; state_flag <= '0';
			end if;
		when lap_display3 =>
			sf_d_temp <= "11000111"; -- Set Address hx47	 
			if 	(count = TIME3) then
					next_state <= lap_display4; control <= "001"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= lap_display3; control <= "000"; state_flag <= '0';  
			else	next_state <= lap_display3; control <= "001"; state_flag <= '0';
			end if;
		when lap_display4 =>
			sf_d_temp <= "00111010"; -- [colon]	 
			if 	(count = TIME3) then
					next_state <= lap_display5; control <= "101"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= lap_display4; control <= "100"; state_flag <= '0';  
			else	next_state <= lap_display4; control <= "101"; state_flag <= '0';
			end if;	
		when lap_display5 =>
			sf_d_temp <= "11001000"; -- Set Address hx48	 
			if 	(count = TIME3) then
					next_state <= lap_display6; control <= "001"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= lap_display5; control <= "000"; state_flag <= '0';  
			else	next_state <= lap_display5; control <= "001"; state_flag <= '0';
			end if;	
		when lap_display6=>   -- Display tens of seconds digit
			case lap_tens is
				when "0000" => sf_d_temp <= "00110000"; --0
      		when "0001" => sf_d_temp <= "00110001"; --1
      		when "0010" => sf_d_temp <= "00110010"; --2
      		when "0011" => sf_d_temp <= "00110011"; --3
      		when "0100" => sf_d_temp <= "00110100"; --4
      		when "0101" => sf_d_temp <= "00110101"; --5
      		when "0110" => sf_d_temp <= "00110110"; --6
      		when "0111" => sf_d_temp <= "00110111"; --7
      		when "1000" => sf_d_temp <= "00111000"; --8
      		when "1001" => sf_d_temp <= "00111001"; --9
				when others => sf_d_temp <= "00101101"; --[-]
			end case;
			if 	(count = TIME3) then
					next_state <= lap_display7; control <= "101"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= lap_display6; control <= "100"; state_flag <= '0';  
			else	next_state <= lap_display6; control <= "101"; state_flag <= '0';
			end if;
		when lap_display7 =>
			sf_d_temp <= "11001001"; -- Set Address hx49	 
			if 	(count = TIME3) then
					next_state <= lap_display8; control <= "001"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= lap_display7; control <= "000"; state_flag <= '0';  
			else	next_state <= lap_display7; control <= "001"; state_flag <= '0';
			end if;
		when lap_display8 =>   -- Display seconds digit
			case lap_ones is     		 
				when "0000" => sf_d_temp <= "00110000"; --0 		
				when "0001" => sf_d_temp <= "00110001"; --1 		
				when "0010" => sf_d_temp <= "00110010"; --2 		
				when "0011" => sf_d_temp <= "00110011"; --3		
				when "0100" => sf_d_temp <= "00110100"; --4	
				when "0101" => sf_d_temp <= "00110101"; --5		 
				when "0110" => sf_d_temp <= "00110110"; --6	
				when "0111" => sf_d_temp <= "00110111"; --7	
				when "1000" => sf_d_temp <= "00111000"; --8	
				when "1001" => sf_d_temp <= "00111001"; --9	
				when others => sf_d_temp <= "00101101"; --[-]
			end case;
			if 	(count = TIME3) then
					next_state <= lap_display9; control <= "101"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= lap_display8; control <= "100"; state_flag <= '0';  
			else	next_state <= lap_display8; control <= "101"; state_flag <= '0';
			end if;
		when lap_display9 =>
			sf_d_temp <= "11001010"; -- Set Address hx4A	 
			if 	(count = TIME3) then
					next_state <= lap_display10; control <= "001"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= lap_display9; control <= "000"; state_flag <= '0';  
			else	next_state <= lap_display9; control <= "001"; state_flag <= '0';
			end if;
		when lap_display10 =>
			sf_d_temp <= "00111010"; -- [colon]	 
			if 	(count = TIME3) then
					next_state <= lap_display11; control <= "101"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= lap_display10; control <= "100"; state_flag <= '0';  
			else	next_state <= lap_display10; control <= "101"; state_flag <= '0';
			end if;	
		when lap_display11 =>
			sf_d_temp <= "11001011"; -- Set Address hx4B	 
			if 	(count = TIME3) then
					next_state <= lap_display12; control <= "001"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= lap_display11; control <= "000"; state_flag <= '0';  
			else	next_state <= lap_display11; control <= "001"; state_flag <= '0';
			end if;
		when lap_display12 =>   -- Display tenths of second digit
			case lap_tenths is
				when "0000" => sf_d_temp <= "00110000"; --0
      		when "0001" => sf_d_temp <= "00110001"; --1
      		when "0010" => sf_d_temp <= "00110010"; --2
      		when "0011" => sf_d_temp <= "00110011"; --3
      		when "0100" => sf_d_temp <= "00110100"; --4
      		when "0101" => sf_d_temp <= "00110101"; --5
      		when "0110" => sf_d_temp <= "00110110"; --6
      		when "0111" => sf_d_temp <= "00110111"; --7
      		when "1000" => sf_d_temp <= "00111000"; --8
      		when "1001" => sf_d_temp <= "00111001"; --9
				when others => sf_d_temp <= "00101101"; --[-]
			end case;                                                                  
			if 	(count = TIME3) then
					next_state <= lap_display13; control <= "101"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= lap_display12; control <= "100"; state_flag <= '0';  
			else	next_state <= lap_display12; control <= "101"; state_flag <= '0';
			end if;
		when lap_display13 =>
			sf_d_temp <= "11001100"; -- Set Address hx4C	 
			if 	(count = TIME3) then
					next_state <= lap_display14; control <= "001"; state_flag <= '1';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= lap_display13; control <= "000"; state_flag <= '0';  
			else	next_state <= lap_display13; control <= "001"; state_flag <= '0';
			end if;
		when lap_display14 =>   -- Display hundredths of second digit
			case lap_hundredths is
				when "0000" => sf_d_temp <= "00110000"; --0
      		when "0001" => sf_d_temp <= "00110001"; --1
      		when "0010" => sf_d_temp <= "00110010"; --2
      		when "0011" => sf_d_temp <= "00110011"; --3
      		when "0100" => sf_d_temp <= "00110100"; --4
      		when "0101" => sf_d_temp <= "00110101"; --5
      		when "0110" => sf_d_temp <= "00110110"; --6
      		when "0111" => sf_d_temp <= "00110111"; --7
      		when "1000" => sf_d_temp <= "00111000"; --8
      		when "1001" => sf_d_temp <= "00111001"; --9
				when others => sf_d_temp <= "00101101"; --[-]
			end case;                                             
			if 	(count = TIME3) then
					next_state <= time_display1; control <= "101"; state_flag <= '1'; set_lap_flag <= '0';
			elsif (count > TIME2 AND count <= TIME3) then
					next_state <= lap_display14; control <= "100"; state_flag <= '0';  
			else	next_state <= lap_display14; control <= "101"; state_flag <= '0';
			end if;

		when donestate =>
			control <= "100";				
			sf_d_temp <= "00000000";
			if 	(count = TIME3) then
					next_state <= donestate; state_flag <= '1'; 
			else	next_state <= donestate; state_flag <= '0';
			end if;
	end case;
end process run;

lap_time : process (rst, clk, count, lap) is
begin
	if	(rising_edge(clk)) then
		if ((rst = '1') OR (Mode = '0')) then
			lap_flag <= '0';
			lap_min <= "0000";
			lap_tens <= "0000";
			lap_ones <= "0000";
			lap_tenths <= "0000";
			lap_hundredths <= "0000";
		elsif ((lap = '1') AND (mode = '1')) then
			lap_flag <= '1';
			lap_min <= minutes;
			lap_tens <= tens;
			lap_ones <= ones;
			lap_tenths <= tenths;
			lap_hundredths <= hundredths;
		else 
			lap_min <= lap_min;
			lap_tens <=lap_tens;
			lap_ones <= lap_ones;
			lap_tenths <= lap_tenths;
			lap_hundredths <= lap_hundredths;
			lap_flag <= set_lap_flag;
		end if;
	end if;
end process lap_time;	

mode_set : process (rst, clk, mode) is
begin
	if	(rising_edge(clk)) then
		if (rst = '1') then
			timer_flag <= '0';
			next_mode_state <= '0';
			clock_flag <= '0';
		elsif (mode_state = '1') then	 
				if 	(mode = '1') then
						next_mode_state <= '1'; clock_flag  <= set_clock_flag;
				else	next_mode_state <= '0'; timer_flag <= '1';
				end if;	
		elsif (mode_state = '0') then	 
				if 	(mode = '0') then
						next_mode_state <= '0'; timer_flag <= set_timer_flag;
				else	next_mode_state <= '1'; clock_flag <= '1';
				end if;	
		end if;
	end if;
end process mode_set;	

		
timing : process (rst, clk, count) is
begin
	if	(rising_edge(clk)) then
		sf_d <= sf_d_temp;
		count <= count_temp;
		if (rst = '1') then
			state <= waiting;
			mode_state <= '0';
			count_temp <= 0;
		elsif (state_flag = '1') then
 			state <= next_state;
			mode_state <= next_mode_state;
			count_temp <= 0;
		else
			state <= next_state;
			mode_state <= next_mode_state;
			count_temp <= count_temp + 1;
		end if;
	end if;
end process timing; 

end lcd_control_arch;  