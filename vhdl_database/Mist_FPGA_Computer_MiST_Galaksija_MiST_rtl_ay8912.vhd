------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                                                                          --
-- Copyright (c) 2005-2009 Tobias Gubener                                   -- 
-- Subdesign CPC T-REX by TobiFlex                                          --
--                                                                          --
-- This source file is free software: you can redistribute it and/or modify --
-- it under the terms of the GNU General Public License as published        --
-- by the Free Software Foundation, either version 3 of the License, or     --
-- (at your option) any later version.                                      --
--                                                                          --
-- This source file is distributed in the hope that it will be useful,      --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of           --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            --
-- GNU General Public License for more details.                             --
--                                                                          --
-- You should have received a copy of the GNU General Public License        --
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.    --
--                                                                          --
------------------------------------------------------------------------------
------------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ay8912 is
    port (
	cpuclk    	: in STD_LOGIC;	--48MHz
	reset    	: in STD_LOGIC;
	cs    		: in STD_LOGIC;		--H-aktiv
	bc0    		: in STD_LOGIC;		--
	bdir    		: in STD_LOGIC;
	Data_in    	: in STD_LOGIC_VECTOR (7 downto 0);
	Data_out    : out STD_LOGIC_VECTOR (7 downto 0);
	IO_A    		: in STD_LOGIC_VECTOR (7 downto 0);
	chanA     	: buffer STD_LOGIC_VECTOR (10 downto 0);
	chanB     	: buffer STD_LOGIC_VECTOR (10 downto 0);
	chanC     	: buffer STD_LOGIC_VECTOR (10 downto 0);
	Arechts     : out STD_LOGIC_VECTOR (15 downto 0);
	Alinks     	: out STD_LOGIC_VECTOR (15 downto 0);
	Amono     	: out STD_LOGIC_VECTOR (15 downto 0)
    );
end ay8912;

architecture logic of ay8912 is
signal 	t_Data		: STD_LOGIC_VECTOR (7 downto 0);
signal 	PSGReg		: STD_LOGIC_VECTOR (3 downto 0);
signal 	APeriode	: STD_LOGIC_VECTOR (11 downto 0);		--Reg 0,1
signal 	BPeriode	: STD_LOGIC_VECTOR (11 downto 0);		--Reg 2,3
signal 	CPeriode	: STD_LOGIC_VECTOR (11 downto 0);		--Reg 4,5
signal 	Noise		: STD_LOGIC_VECTOR (4 downto 0);		--Reg 6
signal 	enable		: STD_LOGIC_VECTOR (7 downto 0);		--Reg 7
signal 	AVol		: STD_LOGIC_VECTOR (4 downto 0);		--Reg 8
signal 	BVol		: STD_LOGIC_VECTOR (4 downto 0);		--Reg 9
signal 	CVol		: STD_LOGIC_VECTOR (4 downto 0);		--Reg 10
signal 	HPeriode	: STD_LOGIC_VECTOR (15 downto 0);		--Reg 11,12
signal 	HKurve		: STD_LOGIC_VECTOR (3 downto 0);		--Reg 13
signal 	PortA		: STD_LOGIC_VECTOR (7 downto 0);		--Reg 14
signal 	PortB		: STD_LOGIC_VECTOR (7 downto 0);		--Reg 15
signal 	AVollog		: STD_LOGIC_VECTOR (9 downto 0);		--Reg 8log
signal 	BVollog		: STD_LOGIC_VECTOR (9 downto 0);		--Reg 9log
signal 	CVollog		: STD_LOGIC_VECTOR (9 downto 0);		--Reg 10log
signal 	Alog		: STD_LOGIC_VECTOR (9 downto 0);
signal 	Blog		: STD_LOGIC_VECTOR (9 downto 0);
signal 	Clog		: STD_LOGIC_VECTOR (9 downto 0);
signal 	HVollog		: STD_LOGIC_VECTOR (11 downto 0);
signal 	ACount		: STD_LOGIC_VECTOR (11 downto 0);		
signal 	BCount		: STD_LOGIC_VECTOR (11 downto 0);
signal 	CCount		: STD_LOGIC_VECTOR (11 downto 0);
signal 	NCount		: STD_LOGIC_VECTOR (4 downto 0);
signal 	HCount		: STD_LOGIC_VECTOR (15 downto 0);		
signal 	HVol		: STD_LOGIC_VECTOR (4 downto 0);
signal 	nHVol		: STD_LOGIC_VECTOR (3 downto 0);
signal 	HStart		: STD_LOGIC;
signal 	Noisebit	: STD_LOGIC;
signal 	RNG			: STD_LOGIC_VECTOR (16 downto 0);
signal 	Anot, Bnot, Cnot		: STD_LOGIC;
signal 	n_setreg	: STD_LOGIC;
signal 	n_Pegel		: STD_LOGIC_VECTOR (11 downto 0);
	
signal 	clockgen		: STD_LOGIC_VECTOR (9 downto 0);
signal 	S_Tick		: STD_LOGIC;
signal 	H_Tick		: STD_LOGIC;



begin

-------------------------------------------------------------------------
--Clock gen
-------------------------------------------------------------------------
process (cpuclk, clockgen)
begin 
	S_Tick <= '0';	--sound
	H_Tick <= '0';	--Hüllkurve
	IF clockgen(9 downto 1)=0 THEN
		S_Tick <= '1';
		IF clockgen(0)='0' THEN
			H_Tick <= '1';
		END IF;
	END IF;
	IF rising_edge(cpuclk) THEN  
		Arechts <= (chanA&"00000")+('0'&chanB&"0000");
		Alinks <= (chanC&"00000")+('0'&chanB&"0000");
		Amono <= (chanC&"00000")+('0'&chanB&"0000")+(chanA&"00000");
		IF H_Tick='1' THEN
--			clockgen <= ((48*16)-1);	--48MHz
			clockgen <= "1011111111";	--48MHz
		ELSE
			clockgen <= clockgen-1;
		END IF;
	END IF;
END process;
-------------------------------------------------------------------------
--IO Regs
-------------------------------------------------------------------------
process (cpuclk, reset, IO_A, PortA, PortB, Aperiode, Bperiode, Cperiode, Hperiode, AVol, BVol, CVol, Noise, HKurve, enable, Data_in, t_Data, PSGReg, bdir, bc0)
begin 
	IF reset='0' THEN
		enable <= (others => '0');
		PortA <= "11111111";
		PortB <= "11111111";
	ELSIF rising_edge(cpuclk) THEN
		HStart <= '0';
		IF bdir='1' AND bc0='1' THEN
			IF Data_in(7 downto 4)="0000" THEN
				PSGReg <= Data_in(3 downto 0);
			END IF;
		ELSE
			IF bdir='1' AND bc0='0' THEN
				CASE PSGReg IS
					WHEN "0000" =>
						APeriode(7 downto 0) <= Data_in;
					WHEN "0001" =>
						APeriode(11 downto 8) <= Data_in(3 downto 0);
					WHEN "0010" =>
						BPeriode(7 downto 0) <= Data_in;
					WHEN "0011" =>
						BPeriode(11 downto 8) <= Data_in(3 downto 0);
					WHEN "0100" =>
						CPeriode(7 downto 0) <= Data_in;
					WHEN "0101" =>
						CPeriode(11 downto 8) <= Data_in(3 downto 0);
					WHEN "0110" =>
						Noise(4 downto 0) <= Data_in(4 downto 0);
					WHEN "0111" =>
						enable <= Data_in XOR B"00111111";
					WHEN "1000" =>
						AVollog <= n_Pegel(9 downto 0);
						AVol(4 downto 0) <= Data_in(4 downto 0);
					WHEN "1001" =>
						BVollog <= n_Pegel(9 downto 0);
						BVol(4 downto 0) <= Data_in(4 downto 0);
					WHEN "1010" =>
						CVollog <= n_Pegel(9 downto 0);
						CVol(4 downto 0) <= Data_in(4 downto 0);
					WHEN "1011" =>
						HPeriode(7 downto 0) <= Data_in;
					WHEN "1100" =>
						HPeriode(15 downto 8) <= Data_in;
					WHEN "1101" =>
						HStart <= '1';
						HKurve(3 downto 0) <= Data_in(3 downto 0);
					WHEN "1110" =>
						PortA <= Data_in;
					WHEN "1111" =>
						PortB <= Data_in;
					WHEN OTHERS => null;	
				END CASE;
			END IF;
		END IF;
	END IF;
	CASE Data_in(3 downto 0) IS
		WHEN "1111"	=>	n_Pegel <= X"2AA";		-- Umsetzung in logarithmische Werte in ca. 3dB Schritten
		WHEN "1110"	=>	n_Pegel <= X"1E2";		-- für Kanäle
		WHEN "1101"	=>	n_Pegel <= X"155";
		WHEN "1100"	=>	n_Pegel <= X"0F1";
		WHEN "1011"	=>	n_Pegel <= X"0AA";
		WHEN "1010"	=>	n_Pegel <= X"078";
		WHEN "1001"	=>	n_Pegel <= X"055";
		WHEN "1000"	=>	n_Pegel <= X"03C";
		WHEN "0111"	=>	n_Pegel <= X"02A";
		WHEN "0110"	=>	n_Pegel <= X"01E";
		WHEN "0101"	=>	n_Pegel <= X"015";
		WHEN "0100"	=>	n_Pegel <= X"00F";
		WHEN "0011"	=>	n_Pegel <= X"00A";
		WHEN "0010"	=>	n_Pegel <= X"007";
		WHEN "0001"	=>	n_Pegel <= X"005";
		WHEN "0000"	=>	n_Pegel <= X"000";
		WHEN OTHERS => null;
	END CASE;	
-- read reg	

	IF bc0='1' AND bdir='0' THEN
		Data_out <= t_Data;
	ELSE
		Data_out <= "11111111";
	END IF;	
	
	t_Data <= "00000000";
	CASE PSGReg IS
		WHEN "0000" =>
			t_Data <= Aperiode(7 downto 0);
		WHEN "0001" =>
			t_Data(3 downto 0) <= Aperiode(11 downto 8);
		WHEN "0010" =>
			t_Data <= Bperiode(7 downto 0);
		WHEN "0011" =>
			t_Data(3 downto 0) <= Bperiode(11 downto 8);
		WHEN "0100" =>
			t_Data <= Cperiode(7 downto 0);
		WHEN "0101" =>
			t_Data(3 downto 0) <= Cperiode(11 downto 8);
		WHEN "0110" =>
			t_Data(4 downto 0) <= Noise;
		WHEN "0111" =>
			t_Data <= enable XOR "00111111";
		WHEN "1000" =>
			t_Data(4 downto 0) <= AVol;
		WHEN "1001" =>
			t_Data(4 downto 0) <= BVol;
		WHEN "1010" =>
			t_Data(4 downto 0) <= CVol;
		WHEN "1011" =>
			t_Data <= Hperiode(7 downto 0);
		WHEN "1100" =>
			t_Data <= Hperiode(15 downto 8);
		WHEN "1101" =>
			t_Data(3 downto 0) <= HKurve;
		WHEN "1110" =>
			IF enable(6)='0' THEN
				t_Data <= PortA AND IO_A;
			ELSE
				t_Data <= PortA;
			END IF;
		WHEN "1111" =>
			t_Data <= PortB;
	END CASE;
END process;
-------------------------------------------------------------------------
--Soundgen
-------------------------------------------------------------------------
process (cpuclk, reset, AVol, BVol, CVol, HVol, nHVol, AVollog, BVollog, CVollog, HVollog, HKurve)
begin 
-- channel A
	IF AVol(4)='1' THEN
		Alog <= HVollog(9 downto 0);
	ELSE
		Alog <= AVollog;
	END IF;
	IF rising_edge(cpuclk) THEN
		IF ((enable(3) AND Noisebit) XOR Anot)='1' THEN
			chanA <= ('0'&Alog);
		ELSE
			chanA <= (others => '0');
		END IF;
		IF enable(0)='0' OR APeriode="000000000000" THEN
			Anot <= '1';
			ACount <= "000000000000";
		ELSIF S_Tick='1' THEN
			IF ACount(11 downto 0)>=APeriode THEN
				ACount <= "000000000001";
				Anot <= NOT Anot;
			ELSE	
				ACount <= ACount+1;
			END IF;
		END IF;
	END IF;
			
-- channel B
	IF BVol(4)='1' THEN
		Blog <= HVollog(9 downto 0);
	ELSE
		Blog <= BVollog;
	END IF;
	IF rising_edge(cpuclk) THEN
		IF ((enable(4) AND Noisebit) XOR Bnot)='1' THEN
			chanB <= ('0'&Blog);
		ELSE
			chanB <= (others => '0');
		END IF;
		IF enable(1)='0' OR BPeriode="000000000000" THEN
			Bnot <= '1';
			BCount <= "000000000000";
		ELSIF S_Tick='1' THEN
			IF BCount(11 downto 0)>=BPeriode THEN
				BCount <= "000000000001";
				Bnot <= NOT Bnot;
			ELSE	
				BCount <= BCount+1;
			END IF;
		END IF;
	END IF;
			
-- channel C
	IF CVol(4)='1' THEN
		Clog <= HVollog(9 downto 0);
	ELSE
		Clog <= CVollog;
	END IF;
	IF rising_edge(cpuclk) THEN
		IF ((enable(5) AND Noisebit) XOR Cnot)='1' THEN
			chanC <= ('0'&Clog);
		ELSE
			chanC <= (others => '0');
		END IF;
		IF enable(2)='0' OR CPeriode="000000000000" THEN
			Cnot <= '1';
			CCount <= "000000000000";
		ELSIF S_Tick='1' THEN
			IF CCount(11 downto 0)>=CPeriode THEN
				CCount <= "000000000001";
				Cnot <= NOT Cnot;
			ELSE	
				CCount <= CCount+1;
			END IF;
		END IF;
	END IF;
			
--noise
--Noise="00000" and Noise="00001" is the same
	IF rising_edge(cpuclk) THEN
		IF S_Tick='1' THEN
			IF NCount(4 downto 1)="0000" THEN
				NCount <= Noise ;
				RNG <= (NOT (RNG(0) XOR RNG(2))& RNG(16 downto 1));
				Noisebit <= RNG(0);
			ELSE	
				NCount <= NCount-1;
			END IF;
		END IF;
	END IF;
	
-- Huellkurve
	nHVol <= HVol(3 downto 0);
	IF ((HKurve(3) OR NOT HVol(4)) AND  ( NOT HKurve(2) XOR ((HKurve(1) XOR HKurve(0)) AND HVol(4))))='1' THEN
		nHVol <= HVol(3 downto 0) XOR "1111";
	END IF;	
	
	IF rising_edge(cpuclk) THEN
		IF HStart='1' THEN
			HCount <= "0000000000000001";
			HVol <= "00000";
		ELSIF H_Tick='1' THEN
			IF HCount>=HPeriode THEN
				HCount <= "0000000000000001";
				IF (NOT HVol(4) OR (NOT HKurve(0) AND HKurve(3)))='1' AND (HPeriode /= 0) THEN    --HOLD 
--				IF (NOT HVol(4) OR (NOT HKurve(0) AND HKurve(3)))='1' THEN    --HOLD 
					HVol <= HVol+1;
				END IF;
			ELSE	
				HCount <= HCount+1;
			END IF;
		END IF;
	END IF;
	
	CASE nHVol(3 downto 0) IS
		WHEN "1111"	=>	HVollog <= X"2AA";		-- Umsetzung in logarithmische Werte in ca. 3dB Schritten
		WHEN "1110"	=>	HVollog <= X"1E2";		-- für Hüllkurve
		WHEN "1101"	=>	HVollog <= X"155";
		WHEN "1100"	=>	HVollog <= X"0F1";
		WHEN "1011"	=>	HVollog <= X"0AA";
		WHEN "1010"	=>	HVollog <= X"078";
		WHEN "1001"	=>	HVollog <= X"055";
		WHEN "1000"	=>	HVollog <= X"03C";
		WHEN "0111"	=>	HVollog <= X"02A";
		WHEN "0110"	=>	HVollog <= X"01E";
		WHEN "0101"	=>	HVollog <= X"015";
		WHEN "0100"	=>	HVollog <= X"00F";
		WHEN "0011"	=>	HVollog <= X"00A";
		WHEN "0010"	=>	HVollog <= X"007";
		WHEN "0001"	=>	HVollog <= X"005";
		WHEN "0000"	=>	HVollog <= X"000";
		WHEN OTHERS => null;
	END CASE;	
END process;

end logic;
