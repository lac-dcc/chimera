library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ctrl_params is

	generic(
		constant c_phase			: integer := 1;	
		constant c_samples		: integer := 2;
		constant c_top_border	: integer := 28;
		constant c_left_border	: integer := 146
	);

    port(
		clk 					: in std_logic;
		enable				: in std_logic;
		left_btn				: in std_logic;
		right_btn			: in std_logic;
		up_btn				: in std_logic;
		down_btn				: in std_logic;
		
		phase					: out unsigned(2 downto 0);
		samples				: out unsigned(2 downto 0);
		top_border			: out unsigned(7 downto 0);
		left_border 		: out unsigned(7 downto 0);
		hsync					: out unsigned(7 downto 0);
		vsync					: out unsigned(13 downto 0);		
		osd_active			: out	std_logic;
		osd_ctrl				: out	unsigned(1 downto 0);
		osd_value			: out unsigned(5 downto 0)
		);
			
end ctrl_params;

architecture behavioral of ctrl_params is

signal	s_phase			: unsigned(2 downto 0) := to_unsigned(c_phase, 3);
signal	s_samples		: unsigned(2 downto 0) := to_unsigned(c_samples, 3);
signal	s_top_border	: unsigned(7 downto 0) := to_unsigned(c_top_border, 8);
signal	s_left_border	: unsigned(7 downto 0) := to_unsigned(c_left_border, 8);

signal	s_cur_ctrl		: integer range 0 to 3 := 0;

signal	s_right_pressed: std_logic := '0';
signal	s_left_pressed	: std_logic := '0';
signal	s_up_pressed	: std_logic := '0';
signal	s_down_pressed	: std_logic := '0';

begin
	
	process(clk, enable, s_up_pressed, s_down_pressed)
	begin
		if (rising_edge(clk)) then	
			if (enable = '1') then
				if (s_up_pressed = '1') then
						if (s_cur_ctrl > 0) then
							s_cur_ctrl <= s_cur_ctrl - 1;
						else
							s_cur_ctrl <= 2;
						end if;
				elsif (s_down_pressed = '1') then
						if (s_cur_ctrl < 2) then
							s_cur_ctrl <= s_cur_ctrl + 1;
						else
							s_cur_ctrl <= 0;
						end if;		
				end if;
			end if;
		end if;
	end process;
	
	process(clk, enable, s_cur_ctrl, s_left_pressed, s_right_pressed)
	begin
		if (rising_edge(clk)) then	
			if (enable = '1') then		
				if (s_left_pressed = '1') then
					if (s_cur_ctrl = 2) then
						if (s_phase > 0) then
							s_phase <= s_phase - 1;
						end if;
					end if;
				elsif (s_right_pressed = '1') then
					if (s_cur_ctrl = 2) then
						if (s_phase < 7) then
							s_phase <= s_phase + 1;
						end if;
					end if;
				end if;
			end if;
		end if;						
	end process;	
	
	process(clk, enable, s_cur_ctrl, s_left_pressed, s_right_pressed)
	begin
		if (rising_edge(clk)) then		
			if (enable = '1') then		
				if (s_left_pressed = '1') then
					if (s_cur_ctrl = 3) then
						if (s_samples > 0) then
							s_samples <= s_samples - 1;
						end if;
					end if;
				elsif (s_right_pressed = '1') then
					if (s_cur_ctrl = 3) then
						if (s_samples < 7) then
							s_samples <= s_samples + 1;
						end if;
					end if;
				end if;
			end if;
		end if;			
	end process;		
	
	process(clk, enable, s_cur_ctrl, s_left_pressed, s_right_pressed)
	begin
		if (rising_edge(clk)) then		
			if (enable = '1') then		
				if (s_left_pressed = '1') then
					if (s_cur_ctrl = 0) then
						if (s_left_border < 255) then
							s_left_border <= s_left_border + 1;
						end if;
					end if;
				elsif (s_right_pressed = '1') then
					if (s_cur_ctrl = 0) then
						if (s_left_border > 0) then
							s_left_border <= s_left_border - 1;
						end if;
					end if;
				end if;
			end if;
		end if;			
	end process;	
	
	process(clk, enable, s_cur_ctrl, s_left_pressed, s_right_pressed)
	begin
		if (rising_edge(clk)) then	
			if (enable = '1') then		
				if (s_left_pressed = '1') then
					if (s_cur_ctrl = 1) then
						if (s_top_border < 63) then
							s_top_border <= s_top_border + 1;
						end if;
					end if;
				elsif (s_right_pressed = '1') then
					if (s_cur_ctrl = 1) then
						if (s_top_border > 0) then
							s_top_border <= s_top_border - 1;
						end if;
					end if;
				end if;
			end if;
		end if;			
	end process;	

	process(clk, right_btn, enable)
	variable latch : std_logic := '0';
	variable peak: integer range 0 to 128*1024 := 128*1024;
	begin
		if (rising_edge(clk)) then			
			s_right_pressed <= '0';
			if (enable = '1') then			
				if (right_btn /= latch) then				
					if (peak > 0) then
						peak := peak - 1;
					else
						latch := right_btn;
						peak := 128*1024;
						
						if (right_btn = '0') then
							s_right_pressed <= '1';
						end if;						
					end if;	
				else
					peak := 128*1024;
				end if;
			end if;		
		end if;
	end process;
	
	process(clk, left_btn, enable)
	variable latch : std_logic := '0';
	variable peak: integer range 0 to 128*1024 := 128*1024;
	begin
		if (rising_edge(clk)) then			
			s_left_pressed <= '0';
			if (enable = '1') then			
				if (left_btn /= latch) then				
					if (peak > 0) then
						peak := peak - 1;
					else
						latch := left_btn;
						peak := 128*1024;
						
						if (left_btn = '0') then
							s_left_pressed <= '1';
						end if;						
					end if;	
				else
					peak := 128*1024;
				end if;
			end if;		
		end if;
	end process;	
	
	process(clk, up_btn, enable)
	variable latch : std_logic := '0';
	variable peak: integer range 0 to 128*1024 := 128*1024;
	begin
		if (rising_edge(clk)) then			
			s_up_pressed <= '0';
			if (enable = '1') then			
				if (up_btn /= latch) then				
					if (peak > 0) then
						peak := peak - 1;
					else
						latch := up_btn;
						peak := 128*1024;
						
						if (up_btn = '0') then
							s_up_pressed <= '1';
						end if;						
					end if;	
				else
					peak := 128*1024;
				end if;
			end if;		
		end if;
	end process;		
	
	process(clk, down_btn, enable)
	variable latch : std_logic := '0';
	variable peak: integer range 0 to 128*1024 := 128*1024;
	begin
		if (rising_edge(clk)) then			
			s_down_pressed <= '0';
			if (enable = '1') then			
				if (down_btn /= latch) then				
					if (peak > 0) then
						peak := peak - 1;
					else
						latch := down_btn;
						peak := 128*1024;
						
						if (down_btn = '0') then
							s_down_pressed <= '1';
						end if;						
					end if;	
				else
					peak := 128*1024;
				end if;
			end if;		
		end if;
	end process;	

	process(clk, down_btn, up_btn, left_btn, right_btn, enable)
	variable peak: integer range 0 to 256*1024*1024 := 0;
	begin
		if (rising_edge(clk)) then	
			if (enable = '1') then
				osd_active <= '0';
				
				if (peak > 0) then
					peak := peak - 1;
					osd_active <= '1';				
				end if;
				
				if (down_btn = '1' or up_btn = '1' or left_btn = '1' or right_btn = '1') then
					peak := 256*1024*1024-1;
				end if;
			end if;			
		end if;
	end process;	
	
	process(clk, s_phase, s_samples, s_top_border, s_left_border, s_cur_ctrl, enable)
	begin
		if (rising_edge(clk)) then			
			if (enable = '1') then
				case s_cur_ctrl is
					when 0 =>
						osd_value <= to_unsigned(63 - to_integer(s_left_border(7 downto 2)), 6);
					when 1 =>
						osd_value <= to_unsigned(63 - to_integer(s_top_border(5 downto 0)), 6);
					when 2 =>
						osd_value <= s_phase & s_phase;
					when 3 =>
						osd_value <= s_samples  & s_samples;
					when others =>
						osd_value <= (others => '0');
				end case;
			end if;
		end if;
	end process;	

	
	phase <=  s_phase;
	samples <= s_samples;
	top_border <=  s_top_border;
	left_border <=  s_left_border;
	
	osd_ctrl <= to_unsigned(s_cur_ctrl, 2);
	
end behavioral;

