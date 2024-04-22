-- -----------------------------------------------------------------------
--
-- Turbo Chameleon
--
-- Multi purpose FPGA expansion for the Commodore 64 computer
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2011 by Peter Wendrich (pwsoft@syntiac.com)
-- All Rights Reserved.
--
-- http://www.syntiac.com/chameleon.html
-- -----------------------------------------------------------------------
--
-- buttons
--
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- -----------------------------------------------------------------------

entity chameleon_buttons is
	generic (
		shortpress_ms : integer := 50;
		longpress_ms : integer := 1000
	);
	port (
		clk : in std_logic;
		clk_1khz : in std_logic;
		menu_mode : in std_logic;
		
		button_l : in std_logic;
		button_m : in std_logic;
		button_r : in std_logic;
		button_l_2 : in std_logic;
		button_m_2 : in std_logic;
		button_r_2 : in std_logic;
		button_config : in unsigned(3 downto 0);
		
		reset : out std_logic;
		boot : out std_logic;
		freeze : out std_logic;
		menu : out std_logic;
		turbo_toggle : out std_logic;
		disk8_next : out std_logic;
		disk8_first : out std_logic;
		disk9_next : out std_logic;
		disk9_first : out std_logic;
		cart_toggle : out std_logic;
		cart_prg : out std_logic;
		
		key_up : out std_logic;
		key_return : out std_logic;
		key_down : out std_logic
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of chameleon_buttons is
	signal button_l_cnt : integer range 0 to longpress_ms := 0;
	signal button_l_long : std_logic := '0';
	signal button_l_short : std_logic := '0';
	signal button_m_cnt : integer range 0 to longpress_ms := 0;
	signal button_m_long : std_logic := '0';
	signal button_m_short : std_logic := '0';
	signal button_r_cnt : integer range 0 to longpress_ms := 0;
	signal button_r_long : std_logic := '0';
	signal button_r_short : std_logic := '0';
	
	signal button_l_dly1 : std_logic := '0';
	signal button_l_dly2 : std_logic := '0';
	signal button_l_loc : std_logic := '0';
	signal button_m_dly1 : std_logic := '0';
	signal button_m_dly2 : std_logic := '0';
	signal button_m_loc : std_logic := '0';
	signal button_r_dly1 : std_logic := '0';
	signal button_r_dly2 : std_logic := '0';
	signal button_r_loc : std_logic := '0';
	
	signal reset_reg : std_logic := '0';
	signal boot_reg : std_logic := '0';
	signal freeze_reg : std_logic := '0';
	signal menu_reg : std_logic := '0';
	signal cart_toggle_reg : std_logic := '0';
	signal cart_prg_reg : std_logic := '0';
	signal turbo_reg : std_logic := '0';
	signal disk8_next_reg : std_logic := '0';
	signal disk8_first_reg : std_logic := '0';
	signal disk9_next_reg : std_logic := '0';
	signal disk9_first_reg : std_logic := '0';
begin
	reset <= reset_reg;
	boot <= boot_reg;
	freeze <= freeze_reg;
	menu <= menu_reg;
	
	turbo_toggle <= turbo_reg;
	disk8_next <= disk8_next_reg;
	disk8_first <= disk8_first_reg;
	disk9_next <= disk9_next_reg;
	disk9_first <= disk9_first_reg;
	
	cart_toggle <= cart_toggle_reg;
	cart_prg <= cart_prg_reg;

	-- Syncronise buttons to clock (double registered for async inputs)
	process(clk)
	begin
		if rising_edge(clk) then
			button_l_dly1 <= button_l;
			button_l_dly2 <= button_l_dly1;
			button_l_loc <= button_l_dly2 or button_l_2;
			button_m_dly1 <= button_m;
			button_m_dly2 <= button_m_dly1;
			button_m_loc <= button_m_dly2 or button_m_2;
			button_r_dly1 <= button_r;
			button_r_dly2 <= button_r_dly1;
			button_r_loc <= button_r_dly2 or button_r_2;
		end if;
	end process;

	process(clk)
	begin
		if rising_edge(clk) then
			button_l_long <= '0';
			button_l_short <= '0';
			if button_l_loc = '1' then
				if button_l_cnt /= longpress_ms then
					if clk_1khz = '1' then
						button_l_cnt <= button_l_cnt + 1;
					end if;
					if button_l_cnt > shortpress_ms then
						button_l_short <= '1';
					end if;
				else
					button_l_long <= '1';
				end if;
			else
				button_l_cnt <= 0;
			end if;
		end if;	
	end process;

	process(clk)
	begin
		if rising_edge(clk) then
			button_m_long <= '0';
			button_m_short <= '0';
			if button_m_loc = '1' then
				if button_m_cnt /= longpress_ms then
					if clk_1khz = '1' then
						button_m_cnt <= button_m_cnt + 1;
					end if;
					if button_m_cnt > shortpress_ms then
						button_m_short <= '1';
					end if;
				else
					button_m_long <= '1';
				end if;
			else
				button_m_cnt <= 0;
			end if;
		end if;	
	end process;

	process(clk)
	begin
		if rising_edge(clk) then
			button_r_long <= '0';
			button_r_short <= '0';
			if button_r_loc = '1' then
				if button_r_cnt /= longpress_ms then
					if clk_1khz = '1' then
						button_r_cnt <= button_r_cnt + 1;
					end if;
					if button_r_cnt > shortpress_ms then
						button_r_short <= '1';
					end if;
				else
					button_r_long <= '1';
				end if;
			else
				button_r_cnt <= 0;
			end if;
		end if;	
	end process;

	
	process(clk)
	begin
		if rising_edge(clk) then
			reset_reg <= '0';
			menu_reg <= '0';
			boot_reg <= '0';
			cart_toggle_reg <= '0';
			cart_prg_reg <= '0';
			turbo_reg <= '0';
			disk8_next_reg <= '0';
			disk8_first_reg <= '0';
			disk9_next_reg <= '0';
			disk9_first_reg <= '0';
			if button_l_loc = '0' then
				if menu_mode = '0' then
					case button_config is
					when "0000" =>
						menu_reg <= button_l_short;
					when "0001" =>
						cart_toggle_reg <= button_l_short;
						cart_prg_reg <= button_l_long;
					when "0010" =>
						turbo_reg <= button_l_short;
					when "0100" =>
						disk8_next_reg <= button_l_short;
						disk8_first_reg <= button_l_long;
					when "0101" =>
						disk9_next_reg <= button_l_short;
						disk9_first_reg <= button_l_long;
					when others =>
						null;
					end case;
				end if;
			end if;
			if button_m_loc = '0' then
				if menu_mode = '0' then
					freeze_reg <= button_m_short;
					if button_m_long = '1' then
						menu_reg <= '1';
					end if;
				end if;
			end if;
			if button_r_loc = '0' then
				if menu_mode = '0' then
					reset_reg <= button_r_short;
				end if;
				boot_reg <= button_r_long;
			end if;
		end if;	
	end process;
end architecture;
