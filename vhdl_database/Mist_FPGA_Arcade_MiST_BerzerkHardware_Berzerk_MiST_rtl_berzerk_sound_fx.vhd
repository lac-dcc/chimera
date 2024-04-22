---------------------------------------------------------------------------------
-- Berzerk sound effects  - Dar - July 2018
---------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity berzerk_sound_fx is
port	(
	clock  : in  std_logic;
	reset  : in  std_logic;
	cs     : in  std_logic;
	addr   : in  std_logic_vector(4 downto 0);
	di     : in  std_logic_vector(7 downto 0);
	sample : out std_logic_vector(11 downto 0)
);
end berzerk_sound_fx;

architecture struct of berzerk_sound_fx is

signal hdiv         : std_logic_vector(1 downto 0);
signal ena_internal_clock  : std_logic;

signal ptm6840_msb_buffer : std_logic_vector(7 downto 0);
signal ptm6840_max1 : std_logic_vector(15 downto 0);
signal ptm6840_max2 : std_logic_vector(15 downto 0);
signal ptm6840_max3 : std_logic_vector(15 downto 0);
signal ptm6840_cnt1 : std_logic_vector(15 downto 0);
signal ptm6840_cnt2 : std_logic_vector(15 downto 0);
signal ptm6840_cnt3 : std_logic_vector(15 downto 0);
signal ptm6840_ctrl1 : std_logic_vector(7 downto 0);
signal ptm6840_ctrl2 : std_logic_vector(7 downto 0);
signal ptm6840_ctrl3 : std_logic_vector(7 downto 0);

signal ptm6840_q1 : std_logic;
signal ptm6840_q2 : std_logic;
signal ptm6840_q3 : std_logic;

signal ctrl_noise_and_ch1 : std_logic_vector(1 downto 0);
signal ctrl_vol_ch1 : std_logic_vector(2 downto 0);
signal ctrl_vol_ch2 : std_logic_vector(2 downto 0);
signal ctrl_vol_ch3 : std_logic_vector(2 downto 0);

type vol_type is array(0 to 7) of unsigned(7 downto 0);
constant vol : vol_type := (X"01", X"02", X"04", X"08", X"10", X"20", X"40", X"80");

signal snd1 : signed(8 downto 0);
signal snd2 : signed(8 downto 0);
signal snd3 : signed(8 downto 0);
--signal snd  : std_logic_vector(11 downto 0);

signal ptm6840_q1_r : std_logic;
signal ena_q1_clock : std_logic;
signal noise_xor, noise_xor_r : std_logic;
signal noise_shift_reg : std_logic_vector(127 downto 0) := (others => '1');
signal noise_shift_reg_95_r : std_logic;
signal ena_external_clock : std_logic;

begin

sample <= std_logic_vector(snd1+snd2+snd3) + X"7FF";

-- make enable signal to replace misc clocks
process(clock)
begin
	if rising_edge(clock) then

		-- ptm_6840 E input pin (internal clock)
		-- board input clock divide by 4
		if hdiv = "11" then
			hdiv <= "00";
			ena_internal_clock <= '1';
		else
			hdiv <= std_logic_vector(unsigned(hdiv) + 1);
			ena_internal_clock <= '0';
		end if;
		
		-- ptm6840_q1 is used for alternate noise generator clock
		ptm6840_q1_r <= ptm6840_q1;	
		if ptm6840_q1_r = '0' and ptm6840_q1 = '1' then
			ena_q1_clock <= '1';
		else
			ena_q1_clock <= '0';
		end if;

		-- noise generator ouput is use for ptm6840 external clocks (C1, C2, C3)
		noise_shift_reg_95_r <= noise_shift_reg(95);
		if noise_shift_reg_95_r = '0' and noise_shift_reg(95) = '1' then
			ena_external_clock <= '1';
		else
			ena_external_clock <= '0';
		end if;

	end if;
end process;

--control/registers interface with cpu addr/data
ctrl_regs : process(clock, reset)
begin
	if reset = '1' then

		ptm6840_ctrl1 <= X"01";
		ptm6840_ctrl2 <= (others => '0');
		ptm6840_ctrl3 <= (others => '0');
	
		ctrl_noise_and_ch1 <= (others => '0');
		ctrl_vol_ch1 <= (others => '0');
		ctrl_vol_ch2 <= (others => '0');
		ctrl_vol_ch3 <= (others => '0');
	
	else
		if rising_edge(clock) then
			if cs = '1' and addr(4 downto 3) = "00" then
							
				case addr(2 downto 0) is
			
				when "000" => 
					if ptm6840_ctrl2(0) = '1' then 
						ptm6840_ctrl1 <= di;
					else
						ptm6840_ctrl3 <= di;
					end if;

				when "001" => 
					ptm6840_ctrl2 <= di;
					
				when "011" =>
					ptm6840_max1 <= ptm6840_msb_buffer & di;
								
				when "101" =>
					ptm6840_max2 <= ptm6840_msb_buffer & di;

				when "111" =>
					ptm6840_max3 <= ptm6840_msb_buffer & di;
					
				when "110" =>
--					ptm6840_msb_buffer <= di;
					case di(7 downto 6) is
					when "00" =>
						ctrl_noise_and_ch1 <= di(1 downto 0);
					when "01" =>
						ctrl_vol_ch1 <= di(2 downto 0);
					when "10" =>					
						ctrl_vol_ch2 <= di(2 downto 0);
					when others =>
						ctrl_vol_ch3 <= di(2 downto 0);
					end case;
														
				when others =>	
					ptm6840_msb_buffer <= di;
					
				end case;
				
			end if;
		end if;
	end if; 
end process;

-- simplified ptm6840 (only useful part for berzerk)
-- only synthesis mode
-- 16 bits count mode only (no dual 8 bits mode)
-- count on internal or external clock
-- no status
-- no IRQ
-- no gates input

counters : process(clock, reset)
begin
	if reset = '1' then
		ptm6840_cnt1 <= ptm6840_max1;
		ptm6840_cnt2 <= ptm6840_max2; 
		ptm6840_cnt3 <= ptm6840_max3;
		ptm6840_q1  <= '0';
		ptm6840_q2  <= '0';
		ptm6840_q3  <= '0';
	else
	
		if rising_edge(clock) then
			if ptm6840_ctrl1(0) = '0'  then
			
				-- counter #1
				if  (ptm6840_ctrl1(1) = '1' and ena_internal_clock = '1') or
					 (ptm6840_ctrl1(1) = '0' and ena_external_clock = '1') then
					if ptm6840_cnt1 = X"0000" then
						ptm6840_cnt1 <= ptm6840_max1;
						ptm6840_q1 <= not ptm6840_q1;
					else
						ptm6840_cnt1 <= ptm6840_cnt1 - '1';
					end if;
				end if;
				
				-- counter #2
				if  (ptm6840_ctrl2(1) = '1' and ena_internal_clock = '1') or
					 (ptm6840_ctrl2(1) = '0' and ena_external_clock = '1') then
					if ptm6840_cnt2 = X"0000" then
						ptm6840_cnt2 <= ptm6840_max2;
						ptm6840_q2 <= not ptm6840_q2;
					else
						ptm6840_cnt2 <= ptm6840_cnt2 - '1';
					end if;
				end if;

				-- counter #3
				if  (ptm6840_ctrl3(1) = '1' and ena_internal_clock = '1') or
					 (ptm6840_ctrl3(1) = '0' and ena_external_clock = '1') then
					if ptm6840_cnt3 = X"0000" then
						ptm6840_cnt3 <= ptm6840_max3;
						ptm6840_q3 <= not ptm6840_q3;
					else
						ptm6840_cnt3 <= ptm6840_cnt3 - '1';
					end if;
				end if;				
				
			else
				ptm6840_cnt1 <= ptm6840_max1;
				ptm6840_cnt2 <= ptm6840_max2; 
				ptm6840_cnt3 <= ptm6840_max3;
			end if;

			-- fx channel #1 enable and volume
			-- channel #1 output is OFF when q1 drive noise generator clock
			snd1 <= (others=>'0');			
			if ptm6840_ctrl1(7) = '1' then
				if ptm6840_q1 = '1' and ctrl_noise_and_ch1(1) = '0' then
					snd1 <= signed('0'&vol(to_integer(unsigned(ctrl_vol_ch1))));
				else
					snd1 <= -signed('0'&vol(to_integer(unsigned(ctrl_vol_ch1))));
				end if;
			end if;
			
			-- fx channel #2 enable and volume
			snd2 <= (others=>'0');
			if ptm6840_ctrl2(7) = '1' then
				if ptm6840_q2 = '1' then
					snd2 <= signed('0'&vol(to_integer(unsigned(ctrl_vol_ch2))));
				else
					snd2 <= -signed('0'&vol(to_integer(unsigned(ctrl_vol_ch2))));				
				end if;
			end if;
			
			-- fx channel #2 enable and volume
			snd3 <= (others=>'0');	
			if ptm6840_ctrl3(7) = '1' then
				if ptm6840_q3 = '1' then
					snd3 <= signed('0'&vol(to_integer(unsigned(ctrl_vol_ch3))));
				else
					snd3 <= -signed('0'&vol(to_integer(unsigned(ctrl_vol_ch3))));
				end if;
			end if;
			
		end if;
		
	end if; 
end process;

-- noise generator
noise_xor <= noise_shift_reg(127) xor noise_shift_reg(95);
noise: process(clock, reset)
begin
	if reset = '1' then
		noise_shift_reg <= (others => '1');
	else
		if rising_edge(clock) then
			-- noise clock is either same as internal clock or q1 output
			if (ctrl_noise_and_ch1(0) = '0' and ena_internal_clock = '1') or
				(ctrl_noise_and_ch1(0) = '1' and ena_q1_clock       = '1') then
				
				noise_shift_reg <= noise_shift_reg(126 downto 0) & (noise_xor_r xor noise_xor);
				noise_xor_r <= noise_xor;
			end if;		
		end if;		
	end if;
end process;
	
end architecture;