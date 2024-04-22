---------------------------------------------------------------------------------
-- Phoenix sound effect1 by Dar (darfpga@aol.fr) (April 2016)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------

-- this module generates sound how the birds fly
-- how they burn and the ship's barrier activation sound
-- it is most often heard module througut all levels of the game

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity phoenix_effect1 is
generic(
	-- Command
	Cmd_Fs: real := 11.0; -- MHz
	Cmd_V: real := 12.0; -- V
	Cmd_Vd: real := 0.46; -- V
	Cmd_Vce: real := 0.2; -- V
	Cmd_R1: real := 100.0; -- k
	Cmd_R2: real := 33.0; -- k
	Cmd_R3: real := 0.47; -- k
	Cmd_C: real := 6.8; -- uF
	Cmd_Div2n: integer := 8; -- bits divisor
	Cmd_bits: integer := 16; -- bits counter
	-- Oscillator
	Osc_Fs: real := 11.0; -- MHz
	Osc_Vb: real := 5.0; -- V
	Osc_Vce: real := 0.2; -- V
	Osc_R1: real := 47.0; -- k
	Osc_R2: real := 47.0; -- k
	Osc_C: real := 0.001; -- uF
	Osc_Div2n: integer := 7; -- bits divisor
	Osc_bits: integer := 6; -- bits counter
	-- Filter
	Filt_Fs: real := 11.0; -- MHz
	Filt_V1: real := 5.0; -- V
	Filt_V2: real := 0.0; -- V
	Filt_R1: real := 100.0; -- k
	Filt_R2: real := 10.0; -- k
	Filt_C: real := 0.047; -- uF
	Filt_Div2n: integer := 7; -- bits divisor
	Filt_bits: integer := 8;  -- bits counter

	Vmax: real := 5.0; -- V
	Vmax_bits: integer := 16 -- number of bits to represent vmax
);
port(
	clk      : in std_logic;
	reset    : in std_logic;
	trigger  : in std_logic;
	filter   : in std_logic;
	divider  : in std_logic_vector(3 downto 0);
	snd      : out std_logic_vector(7 downto 0)
);
end phoenix_effect1;

architecture struct of phoenix_effect1 is

-- integer representation of voltage, full range
constant IVmax: integer := integer(2**Vmax_bits)-1;
-- command --
constant Cmd_div: integer := integer(2**Cmd_Div2n);
-- command charge
constant Cmd_VFc: real := (Cmd_V*Cmd_R2 + Cmd_Vd*Cmd_R1)/(Cmd_R1 + Cmd_R2); -- V
constant Cmd_RCc: real := Cmd_R1*Cmd_R2/(Cmd_R1 + Cmd_R2)*Cmd_C/1000.0; -- s
constant Cmd_ikc: integer := integer(Cmd_Fs * 1.0E6 * Cmd_RCc / 2.0**Cmd_Div2n);
constant Cmd_iVFc: integer := integer(Cmd_VFc * real(IVmax)/Vmax);
-- command discharge
constant Cmd_VFd: real := (Cmd_V/Cmd_R1+Cmd_Vd/Cmd_R2+(Cmd_Vd+Cmd_Vce)/Cmd_R3)/(1.0/Cmd_R1+1.0/Cmd_R2+1.0/Cmd_R3); -- V
constant Cmd_RCd: real := 1.0/(1.0/Cmd_R1+1.0/Cmd_R2+1.0/Cmd_R3)*Cmd_C/1000.0; -- s
constant Cmd_ikd: integer := integer(Cmd_Fs * 1.0E6 * Cmd_RCd / 2.0**Cmd_Div2n);
constant Cmd_iVFd: integer := integer(Cmd_VFd * real(IVmax)/Vmax);

-- oscillator
constant Osc_div: integer := integer(2**Osc_Div2n);
-- oscillator charge
constant Osc_VFc: real := Osc_Vb; -- V
constant Osc_RCc: real := (Osc_R1+Osc_R2)*Osc_C/1000.0; -- s
constant Osc_ikc: integer := integer(Osc_Fs * 1.0E6 * Osc_RCc / 2.0**Osc_Div2n);
constant Osc_iVFc: integer := integer(Osc_VFc * real(IVmax)/Vmax);
-- oscillator discharge
constant Osc_VFd: real := Osc_Vce; -- V
constant Osc_RCd: real := Osc_R2*Osc_C/1000.0; -- s
constant Osc_ikd: integer := integer(Osc_Fs * 1.0E6 * Osc_RCd / 2.0**Osc_Div2n);
constant Osc_iVFd: integer := integer(Osc_VFd * real(IVmax)/Vmax);

-- filter
constant Filt_div: integer := integer(2**Filt_Div2n);
-- filter charge
constant Filt_VFc: real := Filt_V1; -- V
constant Filt_RCc: real := 1.0/(1.0/Filt_R1+1.0/Filt_R2)*Filt_C/1000.0; -- s
constant Filt_ikc: integer := integer(Filt_Fs * 1.0E6 * Filt_RCc / 2.0**Filt_Div2n);
constant Filt_iVFc: integer := integer(Filt_VFc * real(IVmax)/Vmax);
-- filter discharge
constant Filt_VFd: real := Filt_V2; -- V
constant Filt_RCd: real := Filt_RCc; -- s
constant Filt_ikd: integer := integer(Filt_Fs * 1.0E6 * Filt_RCd / 2.0**Filt_Div2n);
constant Filt_iVFd: integer := integer(Filt_VFd * real(IVmax)/Vmax);

function imax(x,y: integer) return integer is begin
	if x > y then
		return x;
	else
		return y;
	end if;
end imax;

signal u_c1  : unsigned(15 downto 0) := (others => '0');
signal u_c2  : unsigned(15 downto 0) := (others => '0');
signal flip  : std_logic := '0';

signal u_cf  : unsigned(15 downto 0) := (others => '0');
signal sound : std_logic := '0';

begin

-- Commande
-- R1 = 100k, R2 = 33k, R3 = 0.47k C=6.8e-6 SR=10MHz
-- Charge   : VF1 = 43559, k1 = 6591 (R1//R2)
-- Decharge : VF2 =  9300, k2 =  123 (R1//R2//R3)
-- Div = 2^8

process (clk)
	variable cnt: integer range 0 to imax(Cmd_ikc,Cmd_ikd) := 0;
begin
	if rising_edge(clk) then
		if reset = '1' then
			cnt  := 0;
			u_c1 <= (others => '0');
		else
			cnt := cnt + 1;
			if trigger = '0' then
				if cnt = Cmd_ikc then
					cnt := 0;
					u_c1 <= u_c1 + (Cmd_iVFc - u_c1)/Cmd_div;
				end if;
			else
				if cnt = Cmd_ikd then
					cnt := 0;
					u_c1 <= u_c1 - (u_c1 - Cmd_iVFd)/Cmd_div;
				end if; 
			end if;
		end if;
	end if;
end process;

-- Oscillateur
-- R1 = 47k, R2 = 47k, C=0.001e-6 SR=50MHz
-- Charge   : VF1 = 65535, k1 = 37 (R1+R2)
-- Decharge : VF2 =  2621, k2 = 18 (R2)
-- Div = 2^7

-- Diviseur
-- LS163 : Count up, Sync load when 0xF (no toggle sound if divider = 0xF)
-- LS74  : Divide by 2

process (clk)
	variable cnt: integer range 0 to imax(Osc_ikc,Osc_ikd) := 0;
	variable cnt2: unsigned(3 downto 0) := (others => '0');
begin
	if rising_edge(clk) then
		if reset = '1' then
			cnt  := 0;
			u_c2 <= (others => '0');
			flip <= '0';
		else
			if u_c2 > u_c1   then flip <= '0'; end if;
			if u_c2 < u_c1/2 then 
				flip <= '1';
				if flip = '0' then
					cnt2 := cnt2 + 1;
					if cnt2 = "0000" then
						cnt2 := unsigned(divider);
						if divider /= "1111" then sound <=  not sound; end if;
					end if;
				end if;
			end if; 
			cnt := cnt + 1;
			if flip = '1' then
				if cnt = Osc_ikc then
					cnt := 0;
					u_c2 <= u_c2 + (Osc_iVFc - u_c2)/Osc_div;
				end if;
			else
				if cnt = Osc_ikd then
					cnt := 0;
					u_c2 <= u_c2 - (u_c2 - Osc_iVFd)/Osc_div;
				end if; 
			end if;
		end if;
	end if;
end process;

-- filter
-- R1 = 10k, R2 = 100k, C=0.047e-6, SR=10MHz
-- Charge :   VF1= 65535, k1 = 33 (R1//R2)
-- Decharge : VF2=    0 , k2 = 33 (R1//R2)
-- Div = 2^7

process (clk)
	variable cnt: integer range 0 to imax(Filt_ikc,Filt_ikd) := 0;
begin
	if rising_edge(clk) then
		if reset = '1' then
			cnt  := 0;
			u_cf <= (others => '0');
		else
			cnt := cnt + 1;
			if sound = '1' then
				if cnt = Filt_ikc then
					cnt := 0;
					u_cf <= u_cf + (Filt_iVFc - u_cf)/Filt_div;
				end if;
			else
				if cnt = Filt_ikd then
					cnt := 0;
					u_cf <= u_cf - (u_cf - Filt_iVFd)/Filt_div;
				end if; 
			end if;
		end if;
	end if;
end process;
 
with filter select snd <= std_logic_vector(u_cf(15 downto 8)) when '1',  sound&"0000000" when others;

end struct;
