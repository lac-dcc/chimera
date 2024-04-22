---------------------------------------------------------------------------------
-- Phoenix sound effect3 (noise) by Dar (darfpga@aol.fr) (April 2016)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------

-- this module generates noisy sound of ship missile shooting
-- ship explosions and enemy mothership explosion
-- it is often head throught all the levels of the game

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.all;

entity phoenix_effect3 is
generic(
	-- Command 1
	Cmd1_Fs: real := 11.0; -- MHz
	Cmd1_V: real := 5.0; -- V
	Cmd1_Vd: real := 0.46; -- V
	Cmd1_Vce: real := 0.2; -- V
	Cmd1_R1: real := 1.0; -- k
	Cmd1_R2: real := 0.33; -- k
	Cmd1_R3: real := 20.0; -- k
	Cmd1_C: real := 6.8; -- uF
	Cmd1_Div2n: integer := 8; -- bits divisor
	--Cmd1_bits: integer := 16; -- bits counter
	-- Command 2
	Cmd2_Fs: real := 11.0; -- MHz
	Cmd2_V: real := 5.0; -- V
	Cmd2_Vd: real := 0.46; -- V
	Cmd2_Vce: real := 0.2; -- V
	Cmd2_R1: real := 1.0; -- k
	Cmd2_R2: real := 0.33; -- k
	Cmd2_R3: real := 47.0; -- k
	Cmd2_C: real := 6.8; -- uF
	Cmd2_Div2n: integer := 8; -- bits divisor
	--Cmd2_bits: integer := 16; -- bits counter
	-- Oscillator
	Osc_Fs: real := 11.0; -- MHz
	Osc_Vb: real := 5.0; -- V
	Osc_Vce: real := 0.2; -- V
	Oscmin_R1a: real := 47.0; -- k
	Oscmin_R2: real := 0.33; -- k
	Oscmin_C: real := 0.05; -- uF
	Oscmin_bits: integer := 16; -- bits counter
	Oscmax_R1a: real := 2.553; -- k
	Oscmax_R2: real := 1.0; -- k
	Oscmax_C: real := 0.05; -- uF
	Osc_Div2n: integer := 7; -- bits divisor
	--Osc_bits: integer := 16; -- bits counter

	C_commande2_chop_k: integer := 62500;

	Vmax: real := 5.0; -- V
	Vmax_bits: integer := 16 -- number of bits to represent Vmax
);
port(
	clk    : in std_logic;
	reset    : in std_logic;
	trigger1 : in std_logic;
	trigger2 : in std_logic;
	snd      : out std_logic_vector(7 downto 0)
);
end phoenix_effect3;

architecture struct of phoenix_effect3 is

-- integer representation of voltage, full range
constant IVmax: integer := integer(2**Vmax_bits)-1;
-- Command1 --
constant Cmd1_div: integer := integer(2**Cmd1_Div2n);
-- Command1 charge/discharge voltages
constant Cmd1_VFc: real := Cmd1_V-Cmd1_Vd; -- V
constant Cmd1_iVFc: integer := integer(Cmd1_VFc * real(IVmax)/Vmax);
constant Cmd1_VFd: real := Cmd1_Vce+Cmd1_Vd; -- V
constant Cmd1_iVFd: integer := integer(Cmd1_VFd * real(IVmax)/Vmax);
-- Command1 charge/discharge time constants
constant Cmd1_RCc: real := (Cmd1_R1+Cmd1_R2+Cmd1_R3)*Cmd1_C/1000.0; -- s
constant Cmd1_ikc: integer := integer(Cmd1_Fs * 1.0E6 * Cmd1_RCc / 2.0**Cmd1_Div2n);
constant Cmd1_RCd: real := Cmd1_R2*Cmd1_C/1000.0; -- s
constant Cmd1_ikd: integer := integer(Cmd1_Fs * 1.0E6 * Cmd1_RCd / 2.0**Cmd1_Div2n);
-- Command2 --
constant Cmd2_div: integer := integer(2**Cmd2_Div2n);
-- Command2 charge/discharge voltages
constant Cmd2_VFc: real := (Cmd2_V-Cmd2_Vd)*Cmd2_R3/(Cmd2_R1+Cmd2_R2+Cmd2_R3); -- V
constant Cmd2_iVFc: integer := integer(Cmd2_VFc * real(IVmax)/Vmax);
constant Cmd2_VFd: real := 0.0; -- V
constant Cmd2_iVFd: integer := integer(Cmd2_VFd * real(IVmax)/Vmax);
-- Command2 charge/discharge time constants
constant Cmd2_RCc: real := (Cmd2_R1+Cmd2_R2)*Cmd2_R3/(Cmd2_R1+Cmd2_R2+Cmd2_R3)*Cmd2_C/1000.0; -- s
constant Cmd2_ikc: integer := integer(Cmd2_Fs * 1.0E6 * Cmd2_RCc / 2.0**Cmd2_Div2n);
constant Cmd2_RCd: real := Cmd2_R3*Cmd2_C/1000.0; -- s
constant Cmd2_ikd: integer := integer(Cmd2_Fs * 1.0E6 * Cmd2_RCd / 2.0**Cmd2_Div2n);
-- Oscillator --
constant Osc_div: integer := integer(2**Osc_Div2n);
-- Oscillator charge/discharge voltages
constant Osc_VFc: real := Osc_Vb; -- V
constant Osc_iVFc: integer := integer(Osc_VFc * real(IVmax)/Vmax);
constant Osc_VFd: real := Osc_Vce; -- V
constant Osc_iVFd: integer := integer(Osc_VFd * real(IVmax)/Vmax);
-- Oscillator min charge/discharge time constants
constant Oscmin_RCc: real := (Oscmin_R1a+Oscmin_R2)*Oscmin_C/1000.0; -- s
constant Oscmin_ikc: integer := integer(Osc_Fs * 1.0E6 * Oscmin_RCc / 2.0**Osc_Div2n);
constant Oscmin_RCd: real := Oscmin_R2*Oscmin_C/1000.0; -- s
constant Oscmin_ikd: integer := integer(Osc_Fs * 1.0E6 * Oscmin_RCd / 2.0**Osc_Div2n);
-- Oscillator max charge/discharge time constants
constant Oscmax_RCc: real := (Oscmax_R1a+Oscmax_R2)*Oscmax_C/1000.0; -- s
constant Oscmax_ikc: integer := integer(Osc_Fs * 1.0E6 * Oscmax_RCc / 2.0**Osc_Div2n);
constant Oscmax_RCd: real := Oscmax_R2*Oscmax_C/1000.0; -- s
constant Oscmax_ikd: integer := integer(Osc_Fs * 1.0E6 * Oscmax_RCd / 2.0**Osc_Div2n);

function imax(x,y: integer) return integer is begin
	if x > y then
		return x;
	else
		return y;
	end if;
end imax;

signal u_c1  : unsigned(15 downto 0) := (others => '0');
signal u_c2  : unsigned(15 downto 0) := (others => '0');
signal u_c3  : unsigned(15 downto 0) := (others => '0');
signal flip3 : std_logic := '0';
 
signal k_ch     : unsigned(25 downto 0) := (others =>'0');

signal u_ctrl1   : unsigned(15 downto 0) := (others => '0');
signal u_ctrl2   : unsigned(15 downto 0) := (others => '0');
signal u_ctrl1_f : unsigned( 7 downto 0) := (others => '0');
signal u_ctrl2_f : unsigned( 7 downto 0) := (others => '0');
signal sound     : unsigned( 7 downto 0) := (others => '0');

signal shift_reg : std_logic_vector(17 downto 0) := (others => '0');
 
begin

-- Commande1
-- R1 = 1k, R2 = 0.33k, R3 = 20k C=6.8e-6 SR=10MHz
-- Charge   : VF1 = 59507, k1 = 5666 (R1+R2+R3)
-- Decharge : VF2 =  8651, k2 =   88 (R2)
-- Div = 2^8

process (clk)
	-- variable cnt  : unsigned(15 downto 0) := (others => '0');
	variable cnt: integer range 0 to imax(Cmd1_ikc,Cmd1_ikd)*2 := 0;
begin
	if rising_edge(clk) then
		if reset = '1' then
			cnt  := 0;
			u_c1 <= (others => '0');
		else
			cnt  := cnt + 1;
			if trigger1 = '1' then
				-- if cnt > C_commande1_k1 then
				if cnt > Cmd1_ikc then
					cnt := 0;
					-- u_c1 <= u_c1 + (C_commande1_VF1 - u_c1)/256;
					u_c1 <= u_c1 + (Cmd1_iVFc - u_c1)/Cmd1_div;
				end if;
			else
				-- if cnt > C_commande1_k2 then
				if cnt > Cmd1_ikd then
					cnt := 0;
					-- u_c1 <= u_c1 - (u_c1 - C_commande1_VF2)/256; 
					u_c1 <= u_c1 - (u_c1 - Cmd1_iVFd)/Cmd1_div; 
				end if; 
			end if;
		end if;
	end if;
end process;

-- Commande2
-- R1 = 1k, R2 = 0.33k, R3 = 47k C=6.8e-6 SR=10MHz
-- Charge   : VF1 = 57869, k1 =   344 (R1+R2)//R3
-- Decharge : VF2 =     0, k2 = 12484 (R3)
-- Div = 2^8

process (clk)
	-- variable cnt  : unsigned(15 downto 0) := (others => '0');
	variable cnt: integer range 0 to imax(Cmd2_ikc,Cmd2_ikd)*2 := 0;
begin
	if rising_edge(clk) then
		if reset = '1' then
			-- cnt  := (others => '0');
			cnt  := 0;
			u_c2 <= (others => '0');
		else
			cnt := cnt + 1;
			if trigger2 = '1' then
				-- if cnt > C_commande2_k1 then
				if cnt > Cmd2_ikc then
					-- cnt := (others => '0');
					cnt := 0;
					-- u_c2 <= u_c2 + (C_commande2_VF1 - u_c2)/256;
					u_c2 <= u_c2 + (Cmd2_iVFc - u_c2)/Cmd2_div;
				end if;
			else
				-- if cnt > C_commande2_k2 then
				if cnt > Cmd2_ikd then
					-- cnt := (others => '0');
					cnt := 0;
					-- u_c2 <= u_c2 - (u_c2 - C_commande2_VF2)/256; 
					u_c2 <= u_c2 - (u_c2 - Cmd2_iVFd)/Cmd2_div; 
				end if; 
			end if;
		end if;
	end if;
end process;

-- control voltage from command1 is R3 voltage (not u_c1 voltage)   
with trigger1 select
-- u_ctrl1 <= (to_unsigned(C_commande1_VF1,16) - u_c1) when '1', (others=>'0') when others;
u_ctrl1 <= (to_unsigned(Cmd1_iVFc,16) - u_c1) when '1', (others=>'0') when others;

-- control voltage from command2 is u_c2 voltage
u_ctrl2 <= u_c2;

-- sum up and scaled both control voltages to vary R1 resistor of oscillator
-- k_ch <= shift_right(((u_ctrl1/2 + u_ctrl2/2) * to_unsigned(C_oscillateur_min_k1-C_oscillateur_max_k1,10)),15) + C_oscillateur_max_k1;
k_ch <= shift_right(((u_ctrl1/2 + u_ctrl2/2) * to_unsigned(Oscmin_ikc-Oscmax_ikc,10)),15) + Oscmax_ikc;

-- Oscillateur
-- R1 = 47k..2.533k, R2 = 1k, C=0.05e-6, SR=50MHz
-- Charge   : VF1 = 65536, k_ch = 938..69 (R1+R2, C)
-- Decharge : VF2 =  2621, k2   = 20      (R2, C)
-- Div = 2^7

-- noise generator triggered by oscillator output

process (clk)
	variable cnt: integer range 0 to imax(imax(Oscmin_ikc,Oscmin_ikd), imax(Oscmax_ikc,Oscmax_ikd))+256 := 0;
begin
	if rising_edge(clk) then
		if reset = '1' then
			cnt  := 0;
			u_c3 <= (others => '0');
		else
			if u_c3 > X"AAAA" then flip3 <= '0'; end if;
			if u_c3 < X"5555" then
				flip3 <= '1';
				if flip3 = '0' then
					shift_reg <= shift_reg(16 downto 0) & not(shift_reg(17) xor shift_reg(16));
				end if;
			end if; 
			cnt := cnt + 1;
			if flip3 = '1' then
				if cnt > k_ch then
					cnt := 0;
					u_c3 <= u_c3 + (Osc_iVFc - u_c3)/Osc_div;
				end if;
			else
				if cnt > Oscmax_ikd then
					cnt := 0;
					u_c3 <= u_c3 - (u_c3 - Osc_iVFd)/Osc_div;
				end if; 
			end if;
		end if;
	end if;
end process;

-- modulated (chop) command1 voltage with noise generator output
with shift_reg(17) xor shift_reg(16) select
u_ctrl1_f <= u_ctrl1(15 downto 8)/2 when '0', (others => '0') when others;


-- modulated (chop) command2 voltage with noise generator output
-- and add 400Hz filter (raw sub-sampling)
-- f=10 MHz, k = 25000
process (clk)
	variable cnt  : unsigned(15 downto 0) := (others => '0');
begin
	if rising_edge(clk) then
		cnt  := cnt + 1;
		if cnt > C_commande2_chop_k then
			cnt := (others => '0');
			if (shift_reg(17) xor shift_reg(16)) = '0' then
				u_ctrl2_f <= u_ctrl2(15 downto 8)/2;
			else
				u_ctrl2_f <= (others => '0');
			end if;
		end if;
	end if;
end process;

-- mix modulated noises 1 and 2
sound <= u_ctrl1_f + u_ctrl2_f;
snd <= std_logic_vector(sound);
 
end struct;
