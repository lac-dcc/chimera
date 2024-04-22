---------------------------------------------------------------------------------
-- Phoenix sound effect2 by Dar (darfpga@aol.fr) (April 2016)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------

-- this module outputs sound of mothership's descend
-- it could be heard at beginning of level 5
-- the prrrrr...vioooouuuuu sound
-- fixme:
-- the VCO control levels are too coarse (quantized)
-- frequency transitions are heard in large steps
-- instead of continous sweep

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity phoenix_effect2 is
generic(
	-- Oscillator 1
	Osc1_Fs: real := 11.0; -- MHz
	Osc1_Vb: real := 5.0; -- V
	Osc1_Vce: real := 0.2; -- V
	Osc1_R1: real := 47.0; -- k
	Osc1_R2: real := 100.0; -- k
	Osc1_C1: real := 0.01; -- uF
	Osc1_C2: real := 0.47; -- uF
	Osc1_C3: real := 1.0; -- uF
	Osc1_Div2n: integer := 8; -- bits divisor
	Osc1_bits: integer := 16; -- bits counter
	-- Oscillator 2
	Osc2_Fs: real := 11.0; -- MHz
	Osc2_Vb: real := 5.0; -- V
	Osc2_Vce: real := 0.2; -- V
	Osc2_R1: real := 510.0; -- k
	Osc2_R2: real := 510.0; -- k
	Osc2_C: real := 1.0; -- uF
	Osc2_Div2n: integer := 8; -- bits divisor
	Osc2_bits: integer := 17; -- bits counter
	-- Filter 2
	Filt2_Fs: real := 11.0; -- MHz
	Filt2_V: real := 5.0; -- V
	Filt2_R1: real := 10.0; -- k
	Filt2_R2: real := 5.1; -- k
	Filt2_R3: real := 5.1; -- k
	Filt2_R4: real := 5.0; -- k
	Filt2_R5: real := 10.0; -- k
	Filt2_C: real := 100.0; -- uF
	Filt2_Div2n: integer := 8; -- bits divisor
	Filt2_bits: integer := 16; -- bits counter
	-- Oscillator 3
	Osc3_Fs: real := 11.0; -- MHz
	Osc3_Vb: real := 5.0; -- V
	Osc3_Vce: real := 0.2; -- V
	Osc3_R1: real := 20.0; -- k
	Osc3_R2: real := 20.0; -- k
	Osc3_C: real := 0.001; -- uF
	Osc3_Div2n: integer := 6; -- bits divisor
	Osc3_bits: integer := 6; -- bits counter

	C_flip1_0: integer := 22020;
	C_flip1_1: integer := 33063;
	C_flip1_scale: integer := 84; -- ??


	Vmax: real := 5.0; -- V
	Vmax_bits: integer := 16 -- number of bits to represent Vmax
);

port(
	clk    : in std_logic;
	reset    : in std_logic;
	trigger1 : in std_logic;
	trigger2 : in std_logic;
	divider  : in std_logic_vector(3 downto 0);
	snd      : out std_logic_vector(1 downto 0)
); 
end phoenix_effect2;

architecture struct of phoenix_effect2 is

function imax(x,y: integer) return integer is begin
	if x > y then
		return x;
	else
		return y;
	end if;
end imax;

-- integer representation of voltage, full range
constant IVmax: integer := integer(2**Vmax_bits)-1;
-- Oscillator1 --
constant Osc1_div: integer := integer(2**Osc1_Div2n);
-- Oscillator1 charge/discharge voltages
constant Osc1_VFc: real := Osc1_Vb; -- V
constant Osc1_iVFc: integer := integer(Osc1_VFc * real(IVmax)/Vmax);
constant Osc1_VFd: real := Osc1_Vce; -- V
constant Osc1_iVFd: integer := integer(Osc1_VFd * real(IVmax)/Vmax);
-- Oscillator1 charge/discharge time constants
constant Osc1_T0_RCc: real := (Osc1_R1+Osc1_R2)*Osc1_C1/1000.0; -- s
constant Osc1_T0_ikc: integer := integer(Osc1_Fs * 1.0E6 * Osc1_T0_RCc / 2.0**Osc1_Div2n);
constant Osc1_T0_RCd: real := Osc1_R2*Osc1_C1/1000.0; -- s
constant Osc1_T0_ikd: integer := integer(Osc1_Fs * 1.0E6 * Osc1_T0_RCd / 2.0**Osc1_Div2n);

constant Osc1_T1_RCc: real := (Osc1_R1+Osc1_R2)*(Osc1_C1+Osc1_C2)/1000.0; -- s
constant Osc1_T1_ikc: integer := integer(Osc1_Fs * 1.0E6 * Osc1_T1_RCc / 2.0**Osc1_Div2n);
constant Osc1_T1_RCd: real := Osc1_R2*(Osc1_C1+Osc1_C2)/1000.0; -- s
constant Osc1_T1_ikd: integer := integer(Osc1_Fs * 1.0E6 * Osc1_T1_RCd / 2.0**Osc1_Div2n);

constant Osc1_T2_RCc: real := (Osc1_R1+Osc1_R2)*(Osc1_C1+Osc1_C3)/1000.0; -- s
constant Osc1_T2_ikc: integer := integer(Osc1_Fs * 1.0E6 * Osc1_T2_RCc / 2.0**Osc1_Div2n);
constant Osc1_T2_RCd: real := Osc1_R2*(Osc1_C1+Osc1_C3)/1000.0; -- s
constant Osc1_T2_ikd: integer := integer(Osc1_Fs * 1.0E6 * Osc1_T2_RCd / 2.0**Osc1_Div2n);

constant Osc1_T3_RCc: real := (Osc1_R1+Osc1_R2)*(Osc1_C1+Osc1_C2+Osc1_C3)/1000.0; -- s
constant Osc1_T3_ikc: integer := integer(Osc1_Fs * 1.0E6 * Osc1_T3_RCc / 2.0**Osc1_Div2n);
constant Osc1_T3_RCd: real := Osc1_R2*(Osc1_C1+Osc1_C2+Osc1_C3)/1000.0; -- s
constant Osc1_T3_ikd: integer := integer(Osc1_Fs * 1.0E6 * Osc1_T3_RCd / 2.0**Osc1_Div2n);

constant Osc1_ik_max: integer := imax( imax(Osc1_T1_ikc,Osc1_T1_ikd), imax(Osc1_T3_ikc,Osc1_T3_ikd));

-- Oscillator2 --
constant Osc2_div: integer := integer(2**Osc2_Div2n);
-- Oscillator2 charge/discharge voltages
constant Osc2_VFc: real := Osc2_Vb; -- V
constant Osc2_iVFc: integer := integer(Osc2_VFc * real(IVmax)/Vmax);
constant Osc2_VFd: real := Osc2_Vce; -- V
constant Osc2_iVFd: integer := integer(Osc2_VFd * real(IVmax)/Vmax);
-- Oscillator2 charge/discharge time constants
constant Osc2_RCc: real := (Osc2_R1+Osc2_R2)*Osc2_C/1000.0; -- s
constant Osc2_ikc: integer := integer(Osc2_Fs * 1.0E6 * Osc2_RCc / 2.0**Osc2_Div2n);
constant Osc2_RCd: real := Osc2_R2*Osc2_C/1000.0; -- s
constant Osc2_ikd: integer := integer(Osc2_Fs * 1.0E6 * Osc2_RCd / 2.0**Osc2_Div2n);

-- Filter2 --
constant Filt2_div: integer := integer(2**Filt2_Div2n);
constant Filt2_R4p: real := 1.0/(1.0/Filt2_R1+1.0/Filt2_R4); -- k
constant Filt2_R5p: real := 1.0/(1.0/Filt2_R1+1.0/Filt2_R5); -- k
constant Filt2_Rp: real := 1.0/(1.0/Filt2_R3+1.0/Filt2_R4+1.0/Filt2_R5p); -- k
constant Filt2_Rs: real := 1.0/(1.0/Filt2_R2+1.0/Filt2_R3-Filt2_Rp/(Filt2_R3**2)); -- k
constant Filt2_RC: real := Filt2_Rs*Filt2_C/1000.0; -- s
constant Filt2_ik: integer := integer(Filt2_Fs*1.0E6*Filt2_RC / 2.0**Filt2_Div2n);
-- Filter2 voltages
constant Filt2_V0: real := Filt2_V*Filt2_Rp*Filt2_Rs/(Filt2_R3*Filt2_R4); -- V
constant Filt2_iV0: integer := integer(Filt2_V0 * real(IVmax)/Vmax);
constant Filt2_V1: real := Filt2_V*Filt2_Rp*Filt2_Rs/(Filt2_R4p*Filt2_R3); -- V
constant Filt2_iV1: integer := integer(Filt2_V1 * real(IVmax)/Vmax);
constant Filt2_V2: real := Filt2_V*Filt2_Rp*Filt2_Rs/(Filt2_R3*Filt2_R4)+Filt2_V*Filt2_Rs/Filt2_R2; -- V
constant Filt2_iV2: integer := integer(Filt2_V2 * real(IVmax)/Vmax);
constant Filt2_V3: real := Filt2_V*Filt2_Rp*Filt2_Rs/(Filt2_R3*Filt2_R4p)+Filt2_V*Filt2_Rs/Filt2_R2; -- V
constant Filt2_iV3: integer := integer(Filt2_V3 * real(IVmax)/Vmax);

-- Oscillator3 --
constant Osc3_div: integer := integer(2**Osc3_Div2n);
-- Oscillator3 charge/discharge voltages
constant Osc3_VFc: real := Osc3_Vb; -- V
constant Osc3_iVFc: integer := integer(Osc3_VFc * real(IVmax)/Vmax);
constant Osc3_VFd: real := Osc3_Vce; -- V
constant Osc3_iVFd: integer := integer(Osc3_VFd * real(IVmax)/Vmax);
-- Oscillator3 charge/discharge time constants
constant Osc3_RCc: real := (Osc3_R1+Osc3_R2)*Osc3_C/1000.0; -- s
constant Osc3_ikc: integer := integer(Osc3_Fs * 1.0E6 * Osc3_RCc / 2.0**Osc3_Div2n);
constant Osc3_RCd: real := Osc3_R2*Osc3_C/1000.0; -- s
constant Osc3_ikd: integer := integer(Osc3_Fs * 1.0E6 * Osc3_RCd / 2.0**Osc3_Div2n);

signal u_c1  : unsigned(15 downto 0) := (others => '0');
signal u_c2  : unsigned(15 downto 0) := (others => '0');
signal u_c3  : unsigned(16 downto 0) := (others => '0');
signal flip1 : std_logic := '0';
signal flip2 : std_logic := '0';
signal flip3 : std_logic := '0';

signal triggers : std_logic_vector(1 downto 0) := "00";
--signal kc       : unsigned(15 downto 0) := (others =>'0');
--signal kd       : unsigned(15 downto 0) := (others =>'0');
signal kc       : integer range 0 to Osc1_ik_max;
signal kd       : integer range 0 to Osc1_ik_max;

signal u_cf  : unsigned(15 downto 0) := (others => '0');
signal flips : std_logic_vector(1 downto 0) := "00";
signal vf    : unsigned(15 downto 0) := (others =>'0');

signal u_cf_scaled  : unsigned(23 downto 0) := (others => '0');
signal u_ctrl       : unsigned(15 downto 0) := (others => '0');

signal sound: std_logic := '0';
 
begin

-- Oscillateur1
-- R1 = 47k, R2 = 100k, C1=0.01e-6, C2=0.047e-6, C3=1.000e-6 SR=10MHz
-- Div = 2^8

-- trigger = 00
-- Charge   : VF1 = 65535, k1 = 57 (R1+R2, C1)
-- Decharge : VF2 =  2621, k2 = 39 (R2, C1)
-- trigger = 01
-- Charge   : VF1 = 65535, k1 = 2756 (R1+R2, C1+C2)
-- Decharge : VF2 =  2621, k2 = 1875 (R2, C1+C2)
-- trigger = 10
-- Charge   : VF1 = 65535, k1 = 5800 (R1+R2, C1+C3)
-- Decharge : VF2 =  2621, k2 = 3945 (R2, C1+C3)
-- trigger = 11
-- Charge   : VF1 = 65535, k1 = 8498 (R1+R2, C1+C2+C3)
-- Decharge : VF2 =  2621, k2 = 5781 (R2, C1+C2+C3)

triggers <= trigger2 & trigger1;

with triggers select
kc <= Osc1_T0_ikc when "00",
      Osc1_T1_ikc when "01",
      Osc1_T2_ikc when "10",
      Osc1_T3_ikc when others;

with triggers select
kd <= Osc1_T0_ikd when "00",
      Osc1_T1_ikd when "01",
      Osc1_T2_ikd when "10",
      Osc1_T3_ikd when others;

process (clk)
	variable cnt: integer range 0 to Osc1_ik_max := 0;
begin
	if rising_edge(clk) then
		if reset = '1' then
			cnt  := 0;
			u_c1 <= (others => '0');
		else
			if u_c1 > X"AAAA" then flip1 <= '0'; end if;
			if u_c1 < X"5555" then flip1 <= '1'; end if; 
			cnt := cnt + 1;
			if flip1 = '1' then
				if cnt = kc then
					cnt := 0;
					u_c1 <= u_c1 + (Osc1_iVFc - u_c1)/Osc1_div;
				end if;
			else
				if cnt = kd then
					cnt := 0;
					u_c1 <= u_c1 - (u_c1 - Osc1_iVFd)/Osc1_div;
				end if; 
			end if;
		end if;
	end if;
end process;

-- Oscillateur2
-- R1 = 510k, R2 = 510k, C=1.000e-6, SR=10MHz
-- Charge   : VF1 = 65535, k1 = 39844 (R1+R2, C)
-- Decharge : VF2 =  2621, k2 = 19922 (R2, C)
-- Div = 2^8

process (clk)
	variable cnt: integer range 0 to imax(Osc2_ikc,Osc2_ikd) := 0;
begin
	if rising_edge(clk) then
		if reset = '1' then
			cnt  := 0;
			u_c2 <= (others => '0');
		else
			if u_c2 > X"AAAA" then flip2 <= '0'; end if;
			if u_c2 < X"5555" then flip2 <= '1'; end if; 
			cnt := cnt + 1;
			if flip2 = '1' then
				if cnt = Osc2_ikc then
					cnt := 0;
					u_c2 <= u_c2 + (Osc2_iVFc - u_c2)/Osc2_div;
				end if;
			else
				if cnt = Osc2_ikd then
					cnt := 0;
					u_c2 <= u_c2 - (u_c2 - Osc2_iVFd)/Osc2_div; 
				end if; 
			end if;
		end if;
	end if;
end process;

-- Filtre
-- V1 = 5V
-- R1 = 10k, R2 = 5.1k, R3 = 5.1k, R4 = 5k, R5 = 10k, C=100.0e-6, SR=10MHz 
-- Rp = R3//R4//R4//R1 = 1.68k
-- Rs = 1/(1/R2 + 1/R3 - Rp/(R3*R3)) = 3.05k
-- k = 11922 (Rs*C)
-- Div = 2^8

-- VF00 = 13159 (V*Rp*Rs)/(R4*R3)
-- VF01 = 19738 (V*Rp*Rs)/(R4p*R3)
-- VF10 = 52377 (V*Rp*Rs)/(R4*R3) + V*Rs/R2
-- VF11 = 58957 (V*Rp*Rs)/(R4p*R3) + V*Rs/R2

flips <= flip2 & flip1;

with flips select

vf <= to_unsigned(Filt2_iV0,16) when "00",
      to_unsigned(Filt2_iV1,16) when "01",
      to_unsigned(Filt2_iV2,16) when "10",
      to_unsigned(Filt2_iV3,16) when others;

process (clk)
	variable cnt: integer range 0 to Filt2_ik := 0;
begin
	if rising_edge(clk) then
		if reset = '1' then
			cnt  := 0;
			u_cf <= (others => '0');
		else
			cnt := cnt + 1;
			if vf > u_cf then
				if cnt = Filt2_ik then
					cnt := 0;
					u_cf <= u_cf + (vf - u_cf)/Filt2_div;
				end if;
			else
				if cnt = Filt2_ik then
					cnt := 0;
					u_cf <= u_cf - (u_cf - vf)/Filt2_div; 
				end if; 
			end if;
		end if;
	end if;
end process;

-- U_CTRL 

-- flip1 = 0  u_ctrl = 5V*Rp/R4  + u_cf*Rp/R3 # 22020 + u_cf*84/256
-- flip1 = 1  u_ctrl = 5V*Rp/R4p + u_cf*Rp/R3 # 33063 + u_cf*84/256 

u_cf_scaled <= u_cf*to_unsigned(C_flip1_scale,8);

with flip1 select
 u_ctrl <= to_unsigned(C_flip1_0,16)+u_cf_scaled(23 downto 8) when '0',
           to_unsigned(C_flip1_1,16)+u_cf_scaled(23 downto 8) when others;

-- Oscillateur3
-- R1 = 20k, R2 = 20k, C=0.001e-6 SR=50MHz
-- Charge   : VF1 = 65535, k1 = 31 (R1+R2)
-- Decharge : VF2 =  2621, k2 = 16 (R2)
-- Div = 2^6

-- Diviseur
-- LS163 : Count up, Sync load when 0xF (no toggle sound if divider = 0xF)
-- LS74  : Divide by 2

process (clk)
	variable cnt: integer range 0 to imax(Osc3_ikc,Osc3_ikd) := 0;
	variable cnt2: unsigned(3 downto 0) := (others => '0');
begin
	if rising_edge(clk) then
		if reset = '1' then
			cnt  := 0;
			u_c3 <= (others => '0');
			flip3 <= '0';
		else
			if u_c3 > u_ctrl   then flip3 <= '0'; end if;
			if u_c3 < u_ctrl/2 then
				flip3 <= '1';
				if flip3 = '0' then
					cnt2 := cnt2 + 1;
					if cnt2 = "0000" then
						cnt2 := unsigned(divider);
						if divider /= "1111" then sound <=  not sound; end if;
					end if;
				end if;
			end if; 
			cnt := cnt + 1;
			if flip3 = '1' then
				if cnt = Osc3_ikc then
					cnt := 0;
					u_c3 <= u_c3 + (Osc3_iVFc - u_c3)/Osc3_div;
				end if;
			else
				if cnt = Osc3_ikd then
					cnt := 0;
					u_c3 <= u_c3 - (u_c3 - Osc3_iVFd)/Osc3_div;
				end if;
			end if;
		end if;
	end if;
end process;

with trigger2 select snd <= '0'&sound when '1', sound&'0' when others;

end struct;
