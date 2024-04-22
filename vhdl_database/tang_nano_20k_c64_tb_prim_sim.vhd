
-- ===========Oooo==========================================Oooo========
-- =  Copyright (C) 2014-2023 Gowin Semiconductor Technology Co.,Ltd.
-- =                     All rights reserved.
-- =====================================================================
--
--  __      __      __
--  \ \    /  \    / /   [File name   ] prim_sim.vhd
--   \ \  / /\ \  / /    [Description ] GW2A VHDL functional simulation library
--    \ \/ /  \ \/ /     [Timestamp   ] Mon October 17 11:00:30 2022
--     \  /    \  /      [version     ] 1.9.14
--      \/      \/       
--
-- ===========Oooo==========================================Oooo========


---------------------------package global------------------------------
library ieee;
use ieee.std_logic_1164.all;

package glb is
	signal GSRO : std_logic := '1';
end glb;

package body glb is
end glb;

------------------------------GSR---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity GSR is
    PORT (
         GSRI : in std_logic
    );
end GSR;

architecture Behavioral of GSR is
begin
    GSRO <= GSRI;
end Behavioral;

--------------------------LUT1------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LUT1 is
    GENERIC ( INIT : bit_vector := X"0" );
    PORT (
	 F : out std_logic;
         I0 : in std_logic
    );
end LUT1;
architecture Behavioral of LUT1 is
	constant INIT_reg : std_logic_vector((INIT'length - 1) downto 0) := To_StdLogicVector(INIT);
	COMPONENT MUX2
		PORT(
			I0 : IN  std_logic;
			I1 : IN  std_logic;
			S0 : IN  std_logic;
			O : OUT  std_logic
		);
	END COMPONENT;
begin
   uut: MUX2 PORT MAP (
          I0 => INIT_reg(0),
          I1 => INIT_reg(1),
          S0 => I0,
          O => F
        );
end Behavioral;

--------------------------LUT2 -----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LUT2 is
    GENERIC ( INIT : bit_vector := X"0" );
    PORT (
   	 F : out std_logic;
   	 I0 : in std_logic;
   	 I1 : in std_logic
    );
end LUT2;

architecture Behavioral of LUT2 is
	constant INIT_reg : std_logic_vector((INIT'length - 1) downto 0) := To_StdLogicVector(INIT);
	COMPONENT MUX4
		PORT(
			I0 : IN  std_logic;
			I1 : IN  std_logic;
			I2 : IN  std_logic;
			I3 : IN  std_logic;
			S0 : IN  std_logic;
			S1 : IN  std_logic;
			O : OUT  std_logic
		);
	END COMPONENT;
begin
   m: MUX4 PORT MAP (
          I0 => INIT_reg(0),
          I1 => INIT_reg(1),
          I2 => INIT_reg(2),
          I3 => INIT_reg(3),
          S0 => I0,
          S1 => I1,
          O => F
        );
end Behavioral;

--------------------------LUT3------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LUT3 is
    GENERIC ( INIT : bit_vector := X"00" );
    PORT (
   	 F : out std_logic;
   	 I0 : in std_logic;
   	 I1 : in std_logic;
   	 I2 : in std_logic
    );
end LUT3;

ARCHITECTURE Behavioral of LUT3 is
	constant INIT_reg : std_logic_vector(7 downto 0) := To_StdLogicVector(INIT);
	COMPONENT MUX8
	PORT(
		I0 : IN  std_logic;
		I1 : IN  std_logic;
		I2 : IN  std_logic;
		I3 : IN  std_logic;
		I4 : IN  std_logic;
		I5 : IN  std_logic;
		I6 : IN  std_logic;
		I7 : IN  std_logic;
		S0 : IN  std_logic;
		S1 : IN  std_logic;
		S2 : IN  std_logic;
		O : OUT  std_logic
	  );
	END COMPONENT;
begin

   m: MUX8 PORT MAP (
          I0 => INIT_reg(0),
          I1 => INIT_reg(1),
          I2 => INIT_reg(2),
          I3 => INIT_reg(3),
          I4 => INIT_reg(4),
          I5 => INIT_reg(5),
          I6 => INIT_reg(6),
          I7 => INIT_reg(7),
          S0 => I0,
          S1 => I1,
          S2 => I2,
          O => F
        );
end Behavioral;
  
--------------------------LUT4 -----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LUT4 is
    GENERIC ( INIT : bit_vector := X"0000" );
    PORT (
   	 F : out std_logic;
   	 I0 : in std_logic;
   	 I1 : in std_logic;
   	 I2 : in std_logic;
   	 I3 : in std_logic
    );
end LUT4;

ARCHITECTURE Behavioral of LUT4 is

	constant INIT_reg : std_logic_vector(15 downto 0) := To_StdLogicVector(INIT);    
	COMPONENT MUX16
		PORT(
			I0 : IN  std_logic;
			I1 : IN  std_logic;
			I2 : IN  std_logic;
			I3 : IN  std_logic;
			I4 : IN  std_logic;
			I5 : IN  std_logic;
			I6 : IN  std_logic;
			I7 : IN  std_logic;
			I8 : IN  std_logic;
			I9 : IN  std_logic;
			I10 : IN  std_logic;
			I11 : IN  std_logic;
			I12 : IN  std_logic;
			I13 : IN  std_logic;
			I14 : IN  std_logic;
			I15 : IN  std_logic;
			S0 : IN  std_logic;
			S1 : IN  std_logic;
			S2 : IN  std_logic;
			S3 : IN  std_logic;
			O : OUT  std_logic
		);
	END COMPONENT;
begin
	m: MUX16 PORT MAP (
          I0 => INIT_reg(0),
          I1 => INIT_reg(1),
          I2 => INIT_reg(2),
          I3 => INIT_reg(3),
          I4 => INIT_reg(4),
          I5 => INIT_reg(5),
          I6 => INIT_reg(6),
          I7 => INIT_reg(7),
          I8 => INIT_reg(8),
          I9 => INIT_reg(9),
          I10 => INIT_reg(10),
          I11 => INIT_reg(11),
          I12 => INIT_reg(12),
          I13 => INIT_reg(13),
          I14 => INIT_reg(14),
          I15 => INIT_reg(15),
          S0 => I0,
          S1 => I1,
          S2 => I2,
          S3 => I3,
          O => F
        );
end Behavioral;

--------------------------LUT5 -----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity LUT5 is
    GENERIC ( INIT : bit_vector := X"00000000" );
    PORT (
   	 F : out std_logic;
   	 I0 : in std_logic;
   	 I1 : in std_logic;
   	 I2 : in std_logic;
   	 I3 : in std_logic;
   	 I4 : in std_logic
    );
end LUT5;

architecture Behavioral of LUT5 is
	constant INIT_reg : std_logic_vector(31 downto 0) := To_StdLogicVector(INIT);    
	COMPONENT MUX32
		PORT(
			I0 : IN  std_logic;
			I1 : IN  std_logic;
			I2 : IN  std_logic;
			I3 : IN  std_logic;
			I4 : IN  std_logic;
			I5 : IN  std_logic;
			I6 : IN  std_logic;
			I7 : IN  std_logic;
			I8 : IN  std_logic;
			I9 : IN  std_logic;
			I10 : IN  std_logic;
			I11 : IN  std_logic;
			I12 : IN  std_logic;
			I13 : IN  std_logic;
			I14 : IN  std_logic;
			I15 : IN  std_logic;
			I16 : IN  std_logic;
			I17 : IN  std_logic;
			I18 : IN  std_logic;
			I19 : IN  std_logic;
			I20 : IN  std_logic;
			I21 : IN  std_logic;
			I22 : IN  std_logic;
			I23 : IN  std_logic;
			I24 : IN  std_logic;
			I25 : IN  std_logic;
			I26 : IN  std_logic;
			I27 : IN  std_logic;
			I28 : IN  std_logic;
			I29 : IN  std_logic;
			I30 : IN  std_logic;
			I31 : IN  std_logic;
			S0 : IN  std_logic;
			S1 : IN  std_logic;
			S2 : IN  std_logic;
			S3 : IN  std_logic;
			S4 : IN  std_logic;
			O : OUT  std_logic
		  );
	END COMPONENT;
begin
   m: MUX32 PORT MAP (
          I0 => INIT_reg(0),
          I1 => INIT_reg(1),
          I2 => INIT_reg(2),
          I3 => INIT_reg(3),
          I4 => INIT_reg(4),
          I5 => INIT_reg(5),
          I6 => INIT_reg(6),
          I7 => INIT_reg(7),
          I8 => INIT_reg(8),
          I9 => INIT_reg(9),
          I10 => INIT_reg(10),
          I11 => INIT_reg(11),
          I12 => INIT_reg(12),
          I13 => INIT_reg(13),
          I14 => INIT_reg(14),
          I15 => INIT_reg(15),
          I16 => INIT_reg(16),
          I17 => INIT_reg(17),
          I18 => INIT_reg(18),
          I19 => INIT_reg(19),
          I20 => INIT_reg(20),
          I21 => INIT_reg(21),
          I22 => INIT_reg(22),
          I23 => INIT_reg(23),
          I24 => INIT_reg(24),
          I25 => INIT_reg(25),
          I26 => INIT_reg(26),
          I27 => INIT_reg(27),
          I28 => INIT_reg(28),
          I29 => INIT_reg(29),
          I30 => INIT_reg(30),
          I31 => INIT_reg(31),
          S0 => I0,
          S1 => I1,
          S2 => I2,
          S3 => I3,
          S4 => I4,
          O => F
        );

end Behavioral;

--------------------------LUT6 -----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity LUT6 is
    GENERIC ( INIT : bit_vector := X"0000000000000000" );
    PORT (
   	 F : out std_logic;
   	 I0 : in std_logic;
   	 I1 : in std_logic;
   	 I2 : in std_logic;
   	 I3 : in std_logic;
   	 I4 : in std_logic;
   	 I5 : in std_logic
    );
end LUT6;

architecture  Behavioral of LUT6 is
	function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic)
						return std_logic is
						variable mux2_o : std_logic;
	begin
	
		if((I0 xor I1) = '0' or (I0 xor I1) = '1') then
			if(S = '0') then
				mux2_o := I0;
			elsif(S = '1') then 
				mux2_o := I1;
			elsif(I0 = I1) then
				mux2_o := I0;
			else
				mux2_o := 'X';
			end if;
		elsif(S = '0') then
			mux2_o := I0;
		elsif(S = '1') then
			mux2_o := I1;
		else
			mux2_o := 'X';
		end if;
		return mux2_o;
		
	end function mux2;
    COMPONENT LUT5
		 GENERIC ( INIT : bit_vector := X"00000000" );
		 PORT(
				F : OUT  std_logic;
				I0 : IN  std_logic;
				I1 : IN  std_logic;
				I2 : IN  std_logic;
				I3 : IN  std_logic;
				I4 : IN  std_logic
			  );
    END COMPONENT;
	constant INIT_reg : std_logic_vector(63 downto 0) := To_StdLogicVector(INIT); 
	signal tmp0 : std_logic := '0'; 
	signal tmp1 : std_logic := '0'; 	 	 
begin
   l5_0: LUT5
		GENERIC MAP( INIT => TO_BITVECTOR(INIT_reg(31 downto 0)))
		PORT MAP (
          F => tmp0,
          I0 => I0,
          I1 => I1,
          I2 => I2,
          I3 => I3,
          I4 => I4
		);
	l5_1: LUT5
		GENERIC MAP( INIT => TO_BITVECTOR(INIT_reg(63 downto 32)))
		PORT MAP (
          F => tmp1,
          I0 => I0,
          I1 => I1,
          I2 => I2,
          I3 => I3,
          I4 => I4
		);
	F <= mux2(tmp0, tmp1, I5);

end Behavioral;

--------------------------LUT7 -----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity LUT7 is
    GENERIC ( INIT : bit_vector := X"00000000000000000000000000000000" );
    PORT (
   	 F : out std_logic;
   	 I0 : in std_logic;
   	 I1 : in std_logic;
   	 I2 : in std_logic;
   	 I3 : in std_logic;
   	 I4 : in std_logic;
    	 I5 : in std_logic;
   	 I6 : in std_logic
    );
end LUT7;

architecture  Behavioral of LUT7 is
    function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic)
        return std_logic is
	variable mux2_o : std_logic;
    begin
        if((I0 xor I1) = '0' or (I0 xor I1) = '1') then
	    if(S = '0') then
		mux2_o := I0;
	    elsif(S = '1') then 
		mux2_o := I1;
            elsif(I0 = I1) then
		mux2_o := I0;
        else
	    mux2_o := 'X';
	end if;
	elsif(S = '0') then
	    mux2_o := I0;
	elsif(S = '1') then
	    mux2_o := I1;
 	else
	    mux2_o := 'X';
	end if;
        return mux2_o;		
    end function mux2;

    COMPONENT LUT6
    GENERIC ( INIT : bit_vector := X"0000000000000000");
    PORT(
         F : OUT  std_logic;
         I0 : IN  std_logic;
         I1 : IN  std_logic;
         I2 : IN  std_logic;
         I3 : IN  std_logic;
         I4 : IN  std_logic;
         I5 : IN  std_logic
        );
   END COMPONENT;
	signal tmp0 : std_logic := '0'; 
	signal tmp1 : std_logic := '0';
	constant INIT_reg : std_logic_vector(127 downto 0) := To_StdLogicVector(INIT); 
begin
    l6_0: LUT6
    GENERIC MAP(INIT => TO_BITVECTOR(INIT_reg(63 downto 0)))
    PORT MAP (
          F => tmp0,
          I0 => I0,
          I1 => I1,
          I2 => I2,
          I3 => I3,
          I4 => I4,
          I5 => I5
    );
    l6_1: LUT6
    GENERIC MAP( INIT => TO_BITVECTOR(INIT_reg(127 downto 64)))
    PORT MAP (
          F => tmp1,
          I0 => I0,
          I1 => I1,
          I2 => I2,
          I3 => I3,
          I4 => I4,
          I5 => I5
    );
    F <= mux2(tmp0, tmp1, I6);
end Behavioral;

--------------------------LUT8 -----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity LUT8 is
    GENERIC ( INIT : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" );
    PORT (
   	 F : out std_logic;
   	 I0 : in std_logic;
   	 I1 : in std_logic;
   	 I2 : in std_logic;
   	 I3 : in std_logic;
   	 I4 : in std_logic;
   	 I5 : in std_logic;
   	 I6 : in std_logic;
   	 I7 : in std_logic
    );
end LUT8;
architecture  Behavioral of LUT8 is
function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic)
    return std_logic is
    variable mux2_o : std_logic;
begin
    if((I0 xor I1) = '0' or (I0 xor I1) = '1') then
        if(S = '0') then
	    mux2_o := I0;
	elsif(S = '1') then 
            mux2_o := I1;
	elsif(I0 = I1) then
	    mux2_o := I0;
	else
	    mux2_o := 'X';
    end if;
    elsif(S = '0') then
        mux2_o := I0;
    elsif(S = '1') then
        mux2_o := I1;
    else
        mux2_o := 'X';
    end if;
    return mux2_o;	
end function mux2;

   COMPONENT LUT7
   GENERIC ( INIT : bit_vector := X"00000000000000000000000000000000" );
   PORT(
         F : OUT  std_logic;
         I0 : IN  std_logic;
         I1 : IN  std_logic;
         I2 : IN  std_logic;
         I3 : IN  std_logic;
         I4 : IN  std_logic;
         I5 : IN  std_logic;
         I6 : IN  std_logic
        );
   END COMPONENT;
	signal tmp0 : std_logic := '0'; 
	signal tmp1 : std_logic := '0'; 
        constant INIT_reg : std_logic_vector(255 downto 0) := To_StdLogicVector(INIT);
begin
    l7_0: LUT7
    GENERIC MAP( INIT => TO_BITVECTOR(INIT_reg(127 downto 0)))
    PORT MAP (
          F => tmp0,
          I0 => I0,
          I1 => I1,
          I2 => I2,
          I3 => I3,
          I4 => I4,
          I5 => I5,
          I6 => I6
      );
    l7_1: LUT7
    GENERIC MAP( INIT => TO_BITVECTOR(INIT_reg(255 downto 128)))
    PORT MAP (
          F => tmp1,
          I0 => I0,
          I1 => I1,
          I2 => I2,
          I3 => I3,
          I4 => I4,
          I5 => I5,
          I6 => I6
      );
    F <= mux2(tmp0, tmp1, I7);
end Behavioral;
--------------------------MUX2------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2 is
    PORT (
	 I0 : in std_logic;
	 I1 : in std_logic;
	 S0 : in std_logic;
	 O : out std_logic
    );
end MUX2;

architecture Behavioral of MUX2 is
	function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic)
						return std_logic is
						variable mux2_o : std_logic;
	begin
	
		if((I0 xor I1) = '0' or (I0 xor I1) = '1') then
			if(S = '0') then
				mux2_o := I0;
			elsif(S = '1') then 
				mux2_o := I1;
			elsif(I0 = I1) then
				mux2_o := I0;
			else
				mux2_o := 'X';
			end if;
		elsif(S = '0') then
			mux2_o := I0;
		elsif(S = '1') then
			mux2_o := I1;
		else
			mux2_o := 'X';
		end if;
		return mux2_o;
		
	end function mux2;
begin
	O <= mux2(I0, I1, S0);

end Behavioral;
--------------------------MUX2_LUT5------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_LUT5 is
    PORT (
	 I0 : in std_logic;
	 I1 : in std_logic;
	 S0 : in std_logic;
	 O : out std_logic
    );
end MUX2_LUT5;

architecture Behavioral of MUX2_LUT5 is
	function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic)
						return std_logic is
						variable mux2_o : std_logic;
	begin
	
		if((I0 xor I1) = '0' or (I0 xor I1) = '1') then
			if(S = '0') then
				mux2_o := I0;
			elsif(S = '1') then 
				mux2_o := I1;
			elsif(I0 = I1) then
				mux2_o := I0;
			else
				mux2_o := 'X';
			end if;
		elsif(S = '0') then
			mux2_o := I0;
		elsif(S = '1') then
			mux2_o := I1;
		else
			mux2_o := 'X';
		end if;
		return mux2_o;
		
	end function mux2;
begin
	O <= mux2(I0, I1, S0);

end Behavioral;
--------------------------MUX2_LUT6------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_LUT6 is
    PORT (
	 I0 : in std_logic;
	 I1 : in std_logic;
	 S0 : in std_logic;
	 O : out std_logic
    );
end MUX2_LUT6;

architecture Behavioral of MUX2_LUT6 is
	function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic)
						return std_logic is
						variable mux2_o : std_logic;
	begin
	
		if((I0 xor I1) = '0' or (I0 xor I1) = '1') then
			if(S = '0') then
				mux2_o := I0;
			elsif(S = '1') then 
				mux2_o := I1;
			elsif(I0 = I1) then
				mux2_o := I0;
			else
				mux2_o := 'X';
			end if;
		elsif(S = '0') then
			mux2_o := I0;
		elsif(S = '1') then
			mux2_o := I1;
		else
			mux2_o := 'X';
		end if;
		return mux2_o;
		
	end function mux2;
begin
	O <= mux2(I0, I1, S0);

end Behavioral;
--------------------------MUX2_LUT7------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_LUT7 is
    PORT (
	 I0 : in std_logic;
	 I1 : in std_logic;
	 S0 : in std_logic;
	 O : out std_logic
    );
end MUX2_LUT7;

architecture Behavioral of MUX2_LUT7 is
	function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic)
						return std_logic is
						variable mux2_o : std_logic;
	begin
	
		if((I0 xor I1) = '0' or (I0 xor I1) = '1') then
			if(S = '0') then
				mux2_o := I0;
			elsif(S = '1') then 
				mux2_o := I1;
			elsif(I0 = I1) then
				mux2_o := I0;
			else
				mux2_o := 'X';
			end if;
		elsif(S = '0') then
			mux2_o := I0;
		elsif(S = '1') then
			mux2_o := I1;
		else
			mux2_o := 'X';
		end if;
		return mux2_o;
		
	end function mux2;
begin
	O <= mux2(I0, I1, S0);

end Behavioral;
--------------------------MUX2_LUT8------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_LUT8 is
    PORT (
	 I0 : in std_logic;
	 I1 : in std_logic;
	 S0 : in std_logic;
	 O : out std_logic
    );
end MUX2_LUT8;

architecture Behavioral of MUX2_LUT8 is
	function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic)
						return std_logic is
						variable mux2_o : std_logic;
	begin
	
		if((I0 xor I1) = '0' or (I0 xor I1) = '1') then
			if(S = '0') then
				mux2_o := I0;
			elsif(S = '1') then 
				mux2_o := I1;
			elsif(I0 = I1) then
				mux2_o := I0;
			else
				mux2_o := 'X';
			end if;
		elsif(S = '0') then
			mux2_o := I0;
		elsif(S = '1') then
			mux2_o := I1;
		else
			mux2_o := 'X';
		end if;
		return mux2_o;
		
	end function mux2;
begin
	O <= mux2(I0, I1, S0);

end Behavioral;
--------------------------MUX2_MUX8------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_MUX8 is
    PORT (
	 I0 : in std_logic;
	 I1 : in std_logic;
	 S0 : in std_logic;
	 O : out std_logic
    );
end MUX2_MUX8;

architecture Behavioral of MUX2_MUX8 is
	function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic)
						return std_logic is
						variable mux2_o : std_logic;
	begin
	
		if((I0 xor I1) = '0' or (I0 xor I1) = '1') then
			if(S = '0') then
				mux2_o := I0;
			elsif(S = '1') then 
				mux2_o := I1;
			elsif(I0 = I1) then
				mux2_o := I0;
			else
				mux2_o := 'X';
			end if;
		elsif(S = '0') then
			mux2_o := I0;
		elsif(S = '1') then
			mux2_o := I1;
		else
			mux2_o := 'X';
		end if;
		return mux2_o;
		
	end function mux2;
begin
	O <= mux2(I0, I1, S0);

end Behavioral;
--------------------------MUX2_MUX16------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_MUX16 is
    PORT (
	 I0 : in std_logic;
	 I1 : in std_logic;
	 S0 : in std_logic;
	 O : out std_logic
    );
end MUX2_MUX16;

architecture Behavioral of MUX2_MUX16 is
	function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic)
						return std_logic is
						variable mux2_o : std_logic;
	begin
	
		if((I0 xor I1) = '0' or (I0 xor I1) = '1') then
			if(S = '0') then
				mux2_o := I0;
			elsif(S = '1') then 
				mux2_o := I1;
			elsif(I0 = I1) then
				mux2_o := I0;
			else
				mux2_o := 'X';
			end if;
		elsif(S = '0') then
			mux2_o := I0;
		elsif(S = '1') then
			mux2_o := I1;
		else
			mux2_o := 'X';
		end if;
		return mux2_o;
		
	end function mux2;
begin
	O <= mux2(I0, I1, S0);

end Behavioral;
--------------------------MUX2_MUX32------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_MUX32 is
    PORT (
	 I0 : in std_logic;
	 I1 : in std_logic;
	 S0 : in std_logic;
	 O : out std_logic
    );
end MUX2_MUX32;

architecture Behavioral of MUX2_MUX32 is
	function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic)
						return std_logic is
						variable mux2_o : std_logic;
	begin
	
		if((I0 xor I1) = '0' or (I0 xor I1) = '1') then
			if(S = '0') then
				mux2_o := I0;
			elsif(S = '1') then 
				mux2_o := I1;
			elsif(I0 = I1) then
				mux2_o := I0;
			else
				mux2_o := 'X';
			end if;
		elsif(S = '0') then
			mux2_o := I0;
		elsif(S = '1') then
			mux2_o := I1;
		else
			mux2_o := 'X';
		end if;
		return mux2_o;
		
	end function mux2;
begin
	O <= mux2(I0, I1, S0);

end Behavioral;

--------------------------MUX4------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX4 is
    PORT (
	 I0 : in std_logic;
	 I1 : in std_logic;
	 I2 : in std_logic; 
	 I3 : in std_logic;
	 S0 : in std_logic;
	 S1 : in std_logic;
	 O : out std_logic
    );
end MUX4;

architecture Behavioral of MUX4 is
	function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic)
						return std_logic is
						variable mux2_o : std_logic;
	begin
	
		if((I0 xor I1) = '0' or (I0 xor I1) = '1') then
			if(S = '0') then
				mux2_o := I0;
			elsif(S = '1') then 
				mux2_o := I1;
			elsif(I0 = I1) then
				mux2_o := I0;
			else
				mux2_o := 'X';
			end if;
		elsif(S = '0') then
			mux2_o := I0;
		elsif(S = '1') then
			mux2_o := I1;
		else
			mux2_o := 'X';
		end if;
		return mux2_o;
		
	end function mux2;
begin
	process(I0, I1, I2, I3, S1, S0)
	variable tmp0 : std_logic := '0'; 
	variable tmp1 : std_logic := '0'; 
	begin
		tmp0 := mux2(I0, I1, S0);
		tmp1 := mux2(I2, I3, S0);
		O <= mux2(tmp0, tmp1, S1);
	end process;

end Behavioral;

--------------------------MUX8------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX8 is
    PORT (
	 I0 : in std_logic;
	 I1 : in std_logic;
	 I2 : in std_logic; 
	 I3 : in std_logic;
	 I4 : in std_logic;
	 I5 : in std_logic;
	 I6 : in std_logic;
	 I7 : in std_logic;
	 S0 : in std_logic;
	 S1 : in std_logic;
	 S2 : in std_logic;
	 O : out std_logic
    );
end MUX8;

architecture Behavioral of MUX8 is
	function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic)
						return std_logic is
						variable mux2_o : std_logic;
	begin
	
		if((I0 xor I1) = '0' or (I0 xor I1) = '1') then
			if(S = '0') then
				mux2_o := I0;
			elsif(S = '1') then 
				mux2_o := I1;
			elsif(I0 = I1) then
				mux2_o := I0;
			else
				mux2_o := 'X';
			end if;
		elsif(S = '0') then
			mux2_o := I0;
		elsif(S = '1') then
			mux2_o := I1;
		else
			mux2_o := 'X';
		end if;
		return mux2_o;
		
	end function mux2;
	COMPONENT MUX4
	PORT(
		I0 : IN  std_logic;
		I1 : IN  std_logic;
		I2 : IN  std_logic;
		I3 : IN  std_logic;
		S0 : IN  std_logic;
		S1 : IN  std_logic;
		O : OUT  std_logic
	);
	END COMPONENT;
	signal tmp0 : std_logic := '0'; 
	signal tmp1 : std_logic := '0'; 	 
	 
begin
  m0: MUX4 PORT MAP (
          I0 => I0,
          I1 => I1,
          I2 => I2,
          I3 => I3,
          S0 => S0,
          S1 => S1,
          O => tmp0
        );
  m1: MUX4 PORT MAP (
          I0 => I4,
          I1 => I5,
          I2 => I6,
          I3 => I7,
          S0 => S0,
          S1 => S1,
          O => tmp1
        );
	O <= mux2(tmp0, tmp1, S2);

end Behavioral;

--------------------------MUX16-----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX16 is 
    PORT (
	 I0 : in std_logic;
	 I1 : in std_logic;
	 I2 : in std_logic; 
	 I3 : in std_logic;
	 I4 : in std_logic;
	 I5 : in std_logic;
	 I6 : in std_logic;
	 I7 : in std_logic;
	 I8 : in std_logic;
	 I9 : in std_logic;
	 I10 : in std_logic;
	 I11 : in std_logic;
	 I12 : in std_logic;
	 I13 : in std_logic;
	 I14 : in std_logic;
	 I15 : in std_logic;
	 S0 : in std_logic;
	 S1 : in std_logic;
	 S2 : in std_logic;
	 S3 : in std_logic;
	 O : out std_logic
    );
end MUX16;

architecture Behavioral of MUX16 is
	function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic)
				return std_logic is
				variable mux2_o : std_logic;
		begin				
			if((I0 xor I1) = '0' or (I0 xor I1) = '1') then
				if(S = '0') then
					mux2_o := I0;
				elsif(S = '1') then 
					mux2_o := I1;
				elsif(I0 = I1) then
					mux2_o := I0;
				else
					mux2_o := 'X';
				end if;
			elsif(S = '0') then
				mux2_o := I0;
			elsif(S = '1') then
				mux2_o := I1;
			else
				mux2_o := 'X';
			end if;
			return mux2_o;				
	end function mux2;

	COMPONENT MUX8
		PORT(
			I0 : IN  std_logic;
			I1 : IN  std_logic;
			I2 : IN  std_logic;
			I3 : IN  std_logic;
			I4 : IN  std_logic;
			I5 : IN  std_logic;
			I6 : IN  std_logic;
			I7 : IN  std_logic;
			S0 : IN  std_logic;
			S1 : IN  std_logic;
			S2 : IN  std_logic;
			O : OUT  std_logic
		);
	END COMPONENT;
	signal tmp0 : std_logic := '0'; 
	signal tmp1 : std_logic := '0'; 	 
begin
   m0: MUX8 PORT MAP (
          I0 => I0,
          I1 => I1,
          I2 => I2,
          I3 => I3,
          I4 => I4,
          I5 => I5,
          I6 => I6,
          I7 => I7,
          S0 => S0,
          S1 => S1,
          S2 => S2,
          O => tmp0
		);
   m1: MUX8 PORT MAP (
          I0 => I8,
          I1 => I9,
          I2 => I10,
          I3 => I11,
          I4 => I12,
          I5 => I13,
          I6 => I14,
          I7 => I15,
          S0 => S0,
          S1 => S1,
          S2 => S2,
          O => tmp1
		);
 	O <= mux2(tmp0, tmp1, S3);

end Behavioral;

--------------------------MUX32-----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX32 is 
    PORT (
	 I0 : in std_logic;
	 I1 : in std_logic;
	 I2 : in std_logic; 
	 I3 : in std_logic;
	 I4 : in std_logic;
	 I5 : in std_logic;
	 I6 : in std_logic;
	 I7 : in std_logic;
	 I8 : in std_logic;
	 I9 : in std_logic;
	 I10 : in std_logic;
	 I11 : in std_logic;
	 I12 : in std_logic;
	 I13 : in std_logic;
	 I14 : in std_logic;
	 I15 : in std_logic;
	 I16 : in std_logic;
	 I17 : in std_logic;
	 I18 : in std_logic;
	 I19 : in std_logic;
	 I20 : in std_logic;
	 I21 : in std_logic;
	 I22 : in std_logic;
	 I23:  in std_logic;
	 I24 : in std_logic;
	 I25 : in std_logic;
	 I26 : in std_logic;
	 I27 : in std_logic;
	 I28 : in std_logic;
	 I29 : in std_logic;
	 I30 : in std_logic;
	 I31 : in std_logic; 
	 S0 : in std_logic;
	 S1 : in std_logic;
	 S2 : in std_logic;
	 S3 : in std_logic;
	 S4 : in std_logic;
	 O : out std_logic
    );
end MUX32;

architecture Behavioral of MUX32 is
	function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic)
				return std_logic is
				variable mux2_o : std_logic;
		begin				
			if((I0 xor I1) = '0' or (I0 xor I1) = '1') then
				if(S = '0') then
					mux2_o := I0;
				elsif(S = '1') then 
					mux2_o := I1;
				elsif(I0 = I1) then
					mux2_o := I0;
				else
					mux2_o := 'X';
				end if;
			elsif(S = '0') then
				mux2_o := I0;
			elsif(S = '1') then
				mux2_o := I1;
			else
				mux2_o := 'X';
			end if;
			return mux2_o;				
	end function mux2;
	COMPONENT MUX16
		PORT(
			I0 : IN  std_logic;
			I1 : IN  std_logic;
			I2 : IN  std_logic;
			I3 : IN  std_logic;
			I4 : IN  std_logic;
			I5 : IN  std_logic;
			I6 : IN  std_logic;
			I7 : IN  std_logic;
			I8 : IN  std_logic;
			I9 : IN  std_logic;
			I10 : IN  std_logic;
			I11 : IN  std_logic;
			I12 : IN  std_logic;
			I13 : IN  std_logic;
			I14 : IN  std_logic;
			I15 : IN  std_logic;
			S0 : IN  std_logic;
			S1 : IN  std_logic;
			S2 : IN  std_logic;
			S3 : IN  std_logic;
			O : OUT  std_logic
		);
	END COMPONENT;
	signal tmp0 : std_logic := '0'; 
	signal tmp1 : std_logic := '0'; 	 
begin
	m0: MUX16 PORT MAP (
          I0 => I0,
          I1 => I1,
          I2 => I2,
          I3 => I3,
          I4 => I4,
          I5 => I5,
          I6 => I6,
          I7 => I7,
          I8 => I8,
          I9 => I9,
          I10 => I10,
          I11 => I11,
          I12 => I12,
          I13 => I13,
          I14 => I14,
          I15 => I15,
          S0 => S0,
          S1 => S1,
          S2 => S2,
          S3 => S3,
          O => tmp0
        );
	m1: MUX16 PORT MAP (
          I0 => I16,
          I1 => I17,
          I2 => I18,
          I3 => I19,
          I4 => I20,
          I5 => I21,
          I6 => I22,
          I7 => I23,
          I8 => I24,
          I9 => I25,
          I10 => I26,
          I11 => I27,
          I12 => I28,
          I13 => I29,
          I14 => I30,
          I15 => I31,
          S0 => S0,
          S1 => S1,
          S2 => S2,
          S3 => S3,
          O => tmp1
        );
	O <= mux2(tmp0, tmp1, S4);
end Behavioral;

--------------------------ALU-------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    GENERIC (  
         ADD : INTEGER := 0 ;
       	 SUB : INTEGER := 1 ;
         ADDSUB : INTEGER := 2 ;
       	 NE : INTEGER := 3 ;
       	 GE : INTEGER := 4 ;
	     LE : INTEGER := 5;
       	 CUP : INTEGER := 6 ;
         CDN : INTEGER := 7 ;
         CUPCDN : INTEGER := 8;
	     MULT : INTEGER := 9;
	     ALU_MODE : INTEGER := 0
    );	
    PORT (
	 SUM : OUT std_logic;
	 COUT : OUT std_logic;	
	 I0 : IN std_logic;
	 I1: IN std_logic;
	 I3: IN std_logic;
	 CIN: IN std_logic
    );	
end ALU;

ARCHITECTURE Behavioral OF ALU IS
	SIGNAL S,C :std_logic;
	signal addsub_v,cupcdn_v : std_logic;
begin
	SUM <= S xor CIN;
	COUT <= CIN when S='1' else C;
	addsub_v<=( I0 xor I1 ) when I3='1' else (I0 xor (not I1 ));
	cupcdn_v <= I0 when (I3='1') else (not I0 );
	process (I0, I1,I3,CIN,addsub_v,cupcdn_v) 
	begin	
		case (ALU_MODE) is
			when 0 =>  S <= I0 xor I1;
				     C <= I0;
			when 1 =>  S <= ( I0 xor (  not I1 )  ) ;
                   		     C <= I0;
               		when 2 =>S <= addsub_v;
                    			C <= I0;
                	when 3 =>S <= ( I0 xor (  not I1 )  ) ;
                    		   C <= '1';
                	when 4 =>S <= ( I0 xor (  not I1 )  ) ;
                   		   C <= I0;
			when 5 =>S <= ((not I0) xor I1);
				   C <= I1;
                	when 6 =>S <= I0;
                   		   C <= '0';
               		when 7 =>S <= ( not I0 ) ;
                   		   C <= '1';
                	when 8 =>S <= cupcdn_v;
                   		   C <= I0;
			when 9 =>S <= I0 and I1;
				   C <= I0 and I1;
                	when others => S <= 'X';
				   C <= 'X';
		  end case;
	end process;

end Behavioral;

----------------------------DFF ------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFF is
    GENERIC ( INIT : bit := '0');	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;	
	 CLK : IN std_logic
    );	
end DFF;

ARCHITECTURE Behavioral OF DFF IS
    SIGNAL gsrt: std_logic := '0';
    SIGNAL Q_reg : std_logic;		
begin
    gsrt <= GSRO;
    Q <= Q_reg;
	
    process (CLK,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
    elsif (CLK'event and CLK='1') then
        Q_reg <= D;	
	end if;
    end process;

end Behavioral;

---------------------------DFFE ---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFE is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 CE : IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFE;

ARCHITECTURE Behavioral OF DFFE IS
    SIGNAL gsrt: std_logic := '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (CLK,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (CLK'event and CLK='1') then
	    if (CE = '1') then
         	Q_reg <= D;	
	    end if;
	end if;
    end process;

end Behavioral;

-------------------------DFFS ---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFS is
    GENERIC ( INIT: bit := '1' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 SET : IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFS;

ARCHITECTURE Behavioral OF DFFS IS
    SIGNAL gsrt: std_logic := '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (CLK,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (CLK'event and CLK ='1') then
		if (SET = '1') then
			Q_reg <= '1';
		else
          		Q_reg <= D;	
		end if;
	end if;
    end process;

end Behavioral;

----------------------------DFFSE--------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFSE is
    GENERIC ( INIT : bit := '1' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 SET : IN std_logic;
	 CE: IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFSE;

ARCHITECTURE Behavioral OF DFFSE IS
    SIGNAL gsrt: std_logic := '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (CLK,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (CLK'event and CLK='1') then
		if (SET='1') then
			Q_reg <= '1';
		elsif (CE = '1') then
          		Q_reg <= D;	
		end if;
	end if;
    end process;

end Behavioral;

------------------------DFFR ----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFR is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 RESET : IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFR;

ARCHITECTURE Behavioral OF DFFR IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;
    process (CLK,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (CLK'event and CLK='1') then
		if (RESET = '1') then
			Q_reg <= '0';
		else
          		Q_reg <= D;	
		end if;
	end if;
    end process;

end Behavioral;

---------------------------DFFRE -------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFRE is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 RESET : IN std_logic;
	 CE: IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFRE;

ARCHITECTURE Behavioral OF DFFRE IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;
    process (CLK,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (CLK'event and CLK='1') then
		if (RESET='1') then
			Q_reg <= '0';
		elsif (CE = '1') then
          		Q_reg <= D;	
		end if;
	end if;
    end process;

end Behavioral;

----------------------------DFFP---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFP is
    GENERIC ( INIT : bit := '1' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 PRESET: IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFP;

ARCHITECTURE Behavioral OF DFFP IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (CLK,PRESET,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (PRESET = '1') then
		Q_reg <= '1';
	elsif (CLK'event and CLK = '1') then
          	Q_reg <= D;	
	end if;
    end process;

end Behavioral;

--------------------------DFFPE ---------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFPE is
    GENERIC ( INIT : bit := '1' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 PRESET : IN std_logic;
	 CE: IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFPE;

ARCHITECTURE Behavioral OF DFFPE IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (CLK,PRESET,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
        elsif (PRESET='1') then
		Q_reg <= '1';
	elsif (CLK'event and CLK = '1') then
		if (CE = '1') then
          		Q_reg <= D;
   		end if;	
	end if;
    end process;

end Behavioral;

-----------------------------DFFC --------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFC is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 CLEAR : IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFC;

ARCHITECTURE Behavioral OF DFFC IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (CLK,CLEAR,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (CLEAR = '1') then
		Q_reg <= '0';
	elsif (CLK'event and CLK='1') then
          	Q_reg <= D;	
	end if;
    end process;

end Behavioral;

-----------------------------DFFCE -------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFCE is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 CLEAR : IN std_logic;
	 CE: IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFCE;

ARCHITECTURE Behavioral OF DFFCE IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;
    process (CLK,CLEAR,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (CLEAR ='1') then
		Q_reg <= '0';
	elsif (CLK'event and CLK='1') then
		if (CE='1') then
          		Q_reg <= D;
   		end if;	
	end if;
    end process;

end Behavioral;

--------------------------DFFN ------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFN is
    GENERIC ( INIT : bit := '0');	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFN;

ARCHITECTURE Behavioral OF DFFN IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;		
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (CLK,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (CLK'event and CLK='0') then
        	Q_reg <= D;	
	end if;
    end process;

end Behavioral;


------------------DFFNE ---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFNE is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 CE : IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFNE;

ARCHITECTURE Behavioral OF DFFNE IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (CLK,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (CLK'event and CLK='0') then
		if (CE = '1') then
         		Q_reg <= D;	
		end if;
	end if;
    end process;

end Behavioral;

-------------------------DFFNS ---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFNS is
    GENERIC ( INIT: bit := '1' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 SET : IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFNS;

ARCHITECTURE Behavioral OF DFFNS IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (CLK,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (CLK'event and CLK ='0') then
		if (SET = '1') then
			Q_reg <= '1';
		else
          		Q_reg <= D;	
		end if;
	end if;
    end process;

end Behavioral;

----------------------------DFFNSE--------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFNSE is
    GENERIC ( INIT : bit := '1' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 SET : IN std_logic;
	 CE: IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFNSE;

ARCHITECTURE Behavioral OF DFFNSE IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (CLK,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (CLK'event and CLK='0') then
		if (SET='1') then
			Q_reg <= '1';
		elsif (CE = '1') then
          		Q_reg <= D;	
		end if;
	end if;
    end process;

end Behavioral;

-----------------------------DFFNR----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFNR is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 RESET : IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFNR;

ARCHITECTURE Behavioral OF DFFNR IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (CLK,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (CLK'event and CLK='0') then
		if (RESET = '1') then
			Q_reg <= '0';
		else
          		Q_reg <= D;	
		end if;
	end if;
    end process;

end Behavioral;

---------------------------DFFNRE -------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFNRE is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 RESET : IN std_logic;
	 CE: IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFNRE;

ARCHITECTURE Behavioral OF DFFNRE IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (CLK,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (CLK'event and CLK='0') then
		if (RESET='1') then
			Q_reg <= '0';
		elsif (CE = '1') then
          		Q_reg <= D;	
		end if;
	end if;
    end process;

end Behavioral;

----------------------------DFFNP---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFNP is
    GENERIC ( INIT : bit := '1' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 PRESET: IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFNP;

ARCHITECTURE Behavioral OF DFFNP IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (CLK,PRESET,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (PRESET = '1') then
		Q_reg <= '1';
	elsif (CLK'event and CLK = '0') then
          	Q_reg <= D;	
	end if;
    end process;

end Behavioral;

--------------------------DFFNPE ---------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFNPE is
    GENERIC ( INIT : bit := '1' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 PRESET : IN std_logic;
	 CE: IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFNPE;

ARCHITECTURE Behavioral OF DFFNPE IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (CLK,PRESET,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (PRESET='1') then
		Q_reg <= '1';
	elsif (CLK'event and CLK = '0') then
		if (CE = '1') then
          		Q_reg <= D;
   		end if;	
	end if;
    end process;

end Behavioral;

-----------------------------DFFNC --------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFNC is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 CLEAR : IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFNC;

ARCHITECTURE Behavioral OF DFFNC IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (CLK,CLEAR,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (CLEAR = '1') then
		Q_reg <= '0';
	elsif (CLK'event and CLK='0') then
          	Q_reg <= D;	
	end if;
    end process;

end Behavioral;

-----------------------------DFFNCE -------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFNCE is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 CLEAR : IN std_logic;
	 CE: IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFNCE;

ARCHITECTURE Behavioral OF DFFNCE IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (CLK,CLEAR,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (CLEAR ='1') then
		Q_reg <= '0';
	elsif (CLK'event and CLK='0') then
		if (CE='1') then
          		Q_reg <= D;
   		end if;	
	end if;
    end process;

end Behavioral;

--------------------------------DL ------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DL is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;	
	 G : IN std_logic
    );	
end DL;

ARCHITECTURE Behavioral OF DL IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (D,G,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (G='1') then
		Q_reg <= D;
	end if;
    end process;

end Behavioral;

-------------------------DLE-----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DLE is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 CE: IN std_logic;	
	 G : IN std_logic
    );	
end DLE;

ARCHITECTURE Behavioral OF DLE IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (D,G,CE,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (G='1' and CE='1') then
		Q_reg <= D;
	end if;
    end process;

end Behavioral;

-----------------------------DLC ------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DLC is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 CLEAR : IN std_logic;	
	 G : IN std_logic
    );	
end DLC;

ARCHITECTURE Behavioral OF DLC IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (D,G,CLEAR,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (CLEAR='1') then
		Q_reg <= '0';
	elsif (G='1') then
		Q_reg <= D;
	end if;
    end process;

end Behavioral;

-----------------------------DLCE ------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DLCE is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 CLEAR : IN std_logic;	
	 G : IN std_logic;
	 CE: IN std_logic
    );	
end DLCE;

ARCHITECTURE Behavioral OF DLCE IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (D,G,CLEAR,CE,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (CLEAR='1') then
		Q_reg <= '0';
	elsif (G='1' and CE='1') then
		Q_reg <= D;
	end if;
    end process;

end Behavioral;

-----------------------------DLP ------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DLP is
    GENERIC ( INIT : bit := '1' );	
    PORT (
	 Q : OUT std_logic;	
	 D : std_logic;
	 PRESET : IN std_logic;	
	 G: IN std_logic
    );	
end DLP;

ARCHITECTURE Behavioral OF DLP IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (D,G,PRESET,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (PRESET='1') then
		 Q_reg <= '1';
	elsif (G='1') then
		 Q_reg <= D;
	end if;
    end process;

end Behavioral;

-----------------------------DLPE ------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DLPE is
    GENERIC ( INIT : bit := '1' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 PRESET : IN std_logic;	
	 G : IN std_logic;
	 CE: IN std_logic
    );	
end DLPE;

ARCHITECTURE Behavioral OF DLPE IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (D,G,PRESET,CE,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (PRESET='1') then
		Q_reg <= '1';
	elsif (G='1' and CE='1') then
		Q_reg <= D;
	end if;
    end process;

end Behavioral;

------------------------DLN ------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DLN is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;	
	 G : IN std_logic
    );	
end DLN;

ARCHITECTURE Behavioral OF DLN IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (D,G,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (G='0') then
		Q_reg <= D;
	end if;
    end process;

end Behavioral;

-----------------------------DLNE-----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DLNE is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 CE: IN std_logic;	
	 G : IN std_logic
    );	
end DLNE;

ARCHITECTURE Behavioral OF DLNE IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (D,G,CE,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (G='0' and CE='1') then
		Q_reg <= D;
	end if;
    end process;

end Behavioral;

-----------------------------DLNC ------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DLNC is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 CLEAR : IN std_logic;	
	 G : IN std_logic
    );	
end DLNC;

ARCHITECTURE Behavioral OF DLNC IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (D,G,CLEAR,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (CLEAR='1') then
		Q_reg <= '0';
	elsif (G='0') then
		Q_reg <= D;
	end if;
    end process;

end Behavioral;

-----------------------------DLNCE ------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DLNCE is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 CLEAR : IN std_logic;	
	 G : IN std_logic;
	 CE: IN std_logic
    );	
end DLNCE;

ARCHITECTURE Behavioral OF DLNCE IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (D,G,CLEAR,CE,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (CLEAR='1') then
		Q_reg <= '0';
	elsif (G='0' and CE='1') then
		Q_reg <= D;
	end if;
    end process;

end Behavioral;

-----------------------------DLNP ------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DLNP is
    GENERIC ( INIT : bit := '1' );	
    PORT (
	 Q : OUT std_logic;	
	 D : std_logic;
	 PRESET : IN std_logic;	
	 G: IN std_logic
    );	
end DLNP;

ARCHITECTURE Behavioral OF DLNP IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (D,G,PRESET,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (PRESET='1') then
		 Q_reg <= '1';
	elsif (G='0') then
		 Q_reg <= D;
	end if;
    end process;

end Behavioral;
-----------------------------DLNPE ------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DLNPE is
    GENERIC ( INIT : bit := '1' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 PRESET : IN std_logic;	
	 G : IN std_logic;
	 CE: IN std_logic
    );	
end DLNPE;

ARCHITECTURE Behavioral OF DLNPE IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (D,G,PRESET,CE,gsrt)
    begin
	if (gsrt = '0') then
	    Q_reg <= TO_X01(INIT);
	elsif (PRESET='1') then
		Q_reg <= '1';
	elsif (G='0' and CE='1') then
		Q_reg <= D;
	end if;
    end process;

end Behavioral;

----------------------IBUF-------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IBUF is
    PORT (
    	 O : OUT std_logic;
    	 I : IN std_logic
    );
end IBUF;

architecture Behavioral of IBUF is
begin
    O <= TO_X01(I);
end Behavioral;

------------------------------OBUF---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OBUF is
    PORT (
    	 O : OUT std_logic;
    	 I : IN std_logic
    );
end OBUF;

architecture Behavioral of OBUF is
begin
        O <= TO_X01(I);
end Behavioral;

------------------------------------TBUF---------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TBUF is
    PORT (
    	 O : OUT std_logic;
    	 I : IN std_logic;
    	 OEN : IN std_logic
    );
end TBUF;

architecture Behavioral of TBUF is
begin
  process(I, OEN)
    begin
      if ((OEN = '1') or (OEN = 'H')) then
      	O <= 'Z';
      elsif ((OEN = '0') or (OEN = 'L')) then
        O <= TO_X01(I);
      else                                      
        O <= 'X';  
      end if;
  end process;        

end Behavioral;

----------------------------IOBUF--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IOBUF is
    PORT (
    	 O  : OUT   std_logic;
    	 IO : INOUT std_logic;
     	 I  : IN    std_logic;
	     OEN : IN    std_logic
    );
end IOBUF;

architecture  Behavioral of IOBUF is
begin
    process(IO, I, OEN)
    begin
    	O <= TO_X01(IO);
	if ((OEN = '1') or (OEN = 'H')) then
	    IO <= 'Z';
	elsif ((OEN = '0') or (OEN = 'L')) then
	    IO <= TO_X01(I);
	else
	    IO <= 'X';
	end if;		
    end process;

end Behavioral;

---------------------------------IDDR--------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity IDDR is
    GENERIC (
	Q0_INIT : bit := '0';
	Q1_INIT : bit := '0'
    );	
    PORT (
	 Q0 : OUT std_logic;
	 Q1 : OUT std_logic;	
	 D : IN std_logic;
	 CLK: IN std_logic
    );	
end IDDR;

ARCHITECTURE Behavioral OF IDDR IS
    SIGNAL gsrt : std_logic;
    SIGNAL Q0_oreg,Q0_reg : std_logic := '0';
    SIGNAL Q1_oreg,Q1_reg : std_logic := '0';	
begin
    gsrt <= GSRO;

    process(CLK,gsrt)
	begin
	    if (gsrt = '0') then
	        Q0_oreg <= TO_X01(Q0_INIT);
	        Q0_reg <= TO_X01(Q0_INIT);
	        Q1_reg <= TO_X01(Q0_INIT);
	    elsif (CLK'event and CLK = '1') then
			Q0_oreg <= D;
            Q0_reg <= Q0_oreg;
	        Q1_reg <= Q1_oreg;
	    end if;
    end process;

    process(CLK,gsrt)
	begin
	    if (gsrt = '0') then
		    Q1_oreg <= TO_X01(Q1_INIT);	
	    elsif (CLK'event and CLK = '0') then
			Q1_oreg <= D;
	    end if;
    end process;

    Q0 <= Q0_reg;
    Q1 <= Q1_reg;

end Behavioral;

---------------------------------IDDRC---------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity IDDRC is
    GENERIC ( 
	Q0_INIT : bit := '0';
	Q1_INIT : bit := '0'
    );	
    PORT (
	 Q0 : OUT std_logic;
	 Q1 : OUT std_logic;	
	 D : IN std_logic;
	 CLEAR: IN std_logic;	
	 CLK: IN std_logic
    );	
end IDDRC;

ARCHITECTURE Behavioral OF IDDRC IS
    SIGNAL gsrt : std_logic;
    SIGNAL Q0_oreg,Q0_reg : std_logic := '0';
    SIGNAL Q1_oreg,Q1_reg : std_logic := '0';
	
begin
    gsrt <= GSRO;

    process(CLK, CLEAR,gsrt)
    begin
	    if (gsrt = '0') then
	        Q0_oreg <= TO_X01(Q0_INIT);
		    Q1_reg <= TO_X01(Q1_INIT);	
		    Q0_reg <= TO_X01(Q1_INIT);	
	    elsif (CLEAR = '1') then
		    Q0_oreg <= '0';
		    Q1_reg <= '0';
		    Q0_reg <= '0';
	    elsif (CLK'event and CLK = '1') then
			Q0_oreg <= D;
            Q0_reg <= Q0_oreg;
	        Q1_reg <= Q1_oreg;
	    end if;
    end process;

    process(CLK, CLEAR,gsrt)
    begin
	    if (gsrt = '0') then
		    Q1_oreg <= TO_X01(Q1_INIT);	
	    elsif (CLEAR = '1') then
		    Q1_oreg <= '0';
	    elsif (CLK'event and CLK = '0') then
			Q1_oreg <= D;
	    end if;
    end process;

    Q0 <= Q0_reg;
    Q1 <= Q1_reg;

end Behavioral;

----------------------------IDDR_MEM------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.glb.GSRO;

entity IDDR_MEM is
	GENERIC (
		GSREN : string := "false";
		LSREN : string := "true"
	);
	PORT (
		Q0 : out std_logic;	
		Q1 : out std_logic;	
		D : in std_logic;
		ICLK : in std_logic;
		PCLK : in std_logic;
		RESET : in std_logic;
		WADDR : in std_logic_vector(2 downto 0);
		RADDR : in std_logic_vector(2 downto 0)
	);
end IDDR_MEM;

architecture Behavioral of IDDR_MEM is

	signal Dd0  : std_logic := '0';
	signal D0_mem : std_logic_vector(7 downto 0) := "00000000";
	signal D1_mem : std_logic_vector(7 downto 0) := "00000000";
	signal Q_data : std_logic_vector(1 downto 0) := "00";
	SIGNAL grstn: std_logic := '0';
 	SIGNAL lrstn: std_logic := '0';

begin
   	grstn <= GSRO when GSREN = "true" else '1';
	lrstn <= (NOT RESET) when LSREN = "true" else '1';

	process(ICLK, grstn, lrstn)
	begin
		if(grstn='0') then
			Dd0 <= '0';
		elsif(lrstn='0') then
			Dd0 <= '0';
		elsif(rising_edge(ICLK)) then
			Dd0 <= D;
		end if;
	end process;		

	process(ICLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			D0_mem <= "00000000";
			D1_mem <= "00000000";
		elsif(lrstn ='0') then
			D0_mem <= "00000000";
			D1_mem <= "00000000";
		elsif(falling_edge(ICLK)) then
			D0_mem(CONV_INTEGER(WADDR)) <= Dd0;
			D1_mem(CONV_INTEGER(WADDR)) <= D;
		end if;		
	end process;

	process(PCLK, grstn, lrstn)
	begin
		if(grstn='0') then
			Q_data <= "00";
		elsif(lrstn='0') then
			Q_data <= "00";
		elsif(rising_edge(PCLK)) then
			Q_data <= (D1_mem(CONV_INTEGER(RADDR)), D0_mem(CONV_INTEGER(RADDR)));	
		end if;
	end process;
	
	(Q1,Q0) <= Q_data;
	
end Behavioral;

-------------------------------ODDR----------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity ODDR is
    GENERIC ( 
        TXCLK_POL : bit := '0'; --'0':Rising edge output; '1':Falling edge output        
        CONSTANT INIT : std_logic := '0' 
    );	
    PORT ( 
	    Q0 : OUT std_logic;	
	    Q1 : OUT std_logic;	
	    D0 : IN std_logic;
	    D1 : IN std_logic;
	    TX : IN std_logic;
	    CLK : IN std_logic
    );	
end ODDR;

architecture Behavioral of ODDR is
	signal gsrt : std_logic := '0';
	signal Dd0_0,Dd0_1,Dd0_2 : std_logic := '0';
	signal Dd1_0,Dd1_1,Dd1_2 : std_logic := '0';
	signal Ttx0,Ttx1,DT0,DT1 : std_logic := '0';
begin
	gsrt <= GSRO;

    process(CLK, gsrt)
	begin
		if(gsrt = '0') then
			Dd0_0 <= TO_X01(INIT);
			Dd1_0 <= TO_X01(INIT);
            Dd0_1 <= TO_X01(INIT);
			Dd1_1 <= TO_X01(INIT);
			Dd1_2 <= TO_X01(INIT);
			Ttx0 <= TO_X01(INIT);
			Ttx1 <= TO_X01(INIT);
			DT0 <= TO_X01(INIT);
		elsif(CLK'event and CLK='1') then
			Dd0_0 <= D0;
	        Dd1_0 <= D1;
            Dd0_1 <= Dd0_0;
	        Dd1_1 <= Dd1_0;
	        Dd1_2 <= Dd1_1;
            Ttx0 <= TX;
            Ttx1 <= Ttx0;
            DT0 <= DT1;
		end if;
	end process;

	process(CLK, gsrt)
	begin
		if(gsrt = '0') then
			Dd0_2 <= TO_X01(INIT);
            DT1 <= TO_X01(INIT);
		elsif(CLK'event and CLK='0') then
	        Dd0_2 <= Dd0_1;
            DT1 <= Ttx1;
		end if;
	end process;

    Q0 <= Dd0_2 when CLK='1' else Dd1_2;
    Q1 <= DT0 when (TXCLK_POL = '0') else DT1;	

end Behavioral;

-------------------------------ODDRC----------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity ODDRC is
    GENERIC (
        TXCLK_POL : bit := '0'; --'0':Rising edge output; '1':Falling edge output
        CONSTANT INIT : std_logic := '0'
    );	
    PORT (
	    Q0 : OUT std_logic;
	    Q1 : OUT std_logic;
	    D0 : IN std_logic;
	    D1: IN std_logic;
	    TX: IN std_logic;
	    CLK : IN std_logic;
	    CLEAR: IN std_logic
    );
end ODDRC;

ARCHITECTURE Behavioral OF ODDRC IS
    SIGNAL Dd0_0,Dd0_1,Dd0_2 : std_logic := '0';	
    SIGNAL Dd1_0,Dd1_1,Dd1_2 : std_logic := '0';
    signal Ttx0,Ttx1,DT0,DT1 : std_logic := '0';
    signal gsrt : std_logic := '0';
begin
	gsrt <= GSRO;
	
	process(CLK, gsrt, CLEAR)
	begin
		if(gsrt = '0') then
			Dd0_0 <= TO_X01(INIT);
			Dd1_0 <= TO_X01(INIT);
            Dd0_1 <= TO_X01(INIT);
			Dd1_1 <= TO_X01(INIT);
			Dd1_2 <= TO_X01(INIT);
			Ttx0 <= TO_X01(INIT);
			Ttx1 <= TO_X01(INIT);
			DT0 <= TO_X01(INIT);
		elsif(CLEAR = '1') then
			Dd0_0 <= '0';
			Dd1_0 <= '0';
            Dd0_1 <= '0';
			Dd1_1 <= '0';
			Dd1_2 <= '0';
			Ttx0 <= '0';
			Ttx1 <= '0';
			DT0 <= '0';
		elsif (CLK'event and CLK ='1') then
	        Dd0_0 <= D0;
	        Dd1_0 <= D1;
            Dd0_1 <= Dd0_0;
	        Dd1_1 <= Dd1_0;
	        Dd1_2 <= Dd1_1;
            Ttx0 <= TX;
            Ttx1 <= Ttx0;
            DT0 <= DT1;
        end if;
	end process;

	process (CLK, gsrt, CLEAR)
	begin
		if(gsrt = '0') then
			Dd0_2 <= TO_X01(INIT);
            DT1 <= TO_X01(INIT);
		elsif(CLEAR = '1') then
			Dd0_2 <= '0';
            DT1 <= '0';
		elsif CLK'event and CLK ='0' then
	        Dd0_2 <= Dd0_1;
            DT1 <= Ttx1;            
	    end if;
	end process;

    Q0 <= Dd0_2 when CLK='1' else Dd1_2;
    Q1 <= DT0 when (TXCLK_POL = '0') else DT1;

end Behavioral;

----------------------------ODDR_MEM------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity ODDR_MEM is
    GENERIC(
		GSREN : string := "false";
		LSREN  : string := "true";
        TXCLK_POL : bit := '0'; --'0':Rising edge output; '1':Falling edge output
        TCLK_SOURCE : string := "DQSW"
    );
    PORT (
		 Q0 : out std_logic;	
		 Q1 : out std_logic;	
		 TCLK : in std_logic;
		 PCLK : in std_logic;
		 RESET : in std_logic;
		 D0 : in std_logic;
		 D1 : in std_logic;
		 TX : in std_logic
    );
end ODDR_MEM;

architecture Behavioral of ODDR_MEM is
	signal Ttx1,Ttx2  : std_logic;
	signal Dd1,Dd2 : std_logic_vector(1 downto 0);
	signal DT0,DT1  : std_logic;
	signal Qq0,Qq1  : std_logic;
    signal tclk_sig : std_logic;
	SIGNAL grstn: std_logic;
 	SIGNAL lrstn: std_logic;
	
begin	

	grstn <= GSRO when GSREN="true" else '1';
	lrstn <= (NOT RESET) when LSREN = "true"  else '1';
    tclk_sig <= TCLK when (TCLK_SOURCE = "DQSW") else (not TCLK);

	process(PCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			Dd1 <= "00";
			Ttx1 <= '0';
		elsif(lrstn = '0') then
			Dd1 <= "00";
			Ttx1 <= '0';
		elsif(rising_edge(PCLK)) then
			Dd1 <= (D1,D0);
			Ttx1 <= TX;
		end if;
	end process;

	process(tclk_sig, grstn, lrstn)
	begin
		if(grstn = '0') then
			Dd2 <= "00";
			Ttx2 <= '0';
		elsif(lrstn = '0') then
			Dd2 <= "00";
			Ttx2 <= '0';
		elsif(rising_edge(tclk_sig)) then
			Dd2 <= Dd1;
			Ttx2 <= Ttx1;
		end if;
	end process;

	process(tclk_sig, grstn, lrstn)
	begin
		if(grstn = '0') then
			Qq0 <= '0';
			DT0 <= '0';
		elsif(lrstn = '0') then
			Qq0 <= '0';
			DT0 <= '0';
		elsif(rising_edge(tclk_sig)) then
			Qq0 <= Dd2(1);
			DT0 <= DT1;
		end if;
	end process;

	process(tclk_sig, grstn, lrstn)
	begin
		if(grstn = '0') then
			Qq1 <= '0';
			DT1 <= '0';
		elsif(lrstn = '0') then
			Qq1 <= '0';
			DT1 <= '0';
		elsif(falling_edge(tclk_sig)) then
			Qq1 <= Dd2(0);
			DT1 <= Ttx2;
		end if;
	end process;

	Q0 <= Qq1 when (tclk_sig = '1') else Qq0;
    Q1 <= DT0 when (TXCLK_POL = '0') else DT1;	
	
end Behavioral;

-----------------------------------------IDES4-------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity IDES4 is
	GENERIC (
		GSREN : string := "false";
		LSREN : string := "true"
	);
	PORT (
		D : IN std_logic;
		RESET : IN std_logic;
		CALIB : IN std_logic;
		FCLK : IN std_logic;
		PCLK : IN std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic;
		Q3 : OUT std_logic
	);
end IDES4;

ARCHITECTURE Behavioral of IDES4 is
	signal grstn : std_logic;
	signal lrstn : std_logic;
	SIGNAL Dd0,Dd1 : std_logic;
	SIGNAL D_data,data, Q_reg : std_logic_vector(3 downto 0);	
	signal reset_delay,CALIBdata_rising_p : std_logic;
	SIGNAL CALIBdata : std_logic_vector(2 downto 0);	
	signal D_en1,D_en,dcnt_en,Dd_sel,calib_state : std_logic := '0';
	signal Dd0_reg0,Dd0_reg1,Dd1_reg0,Dd1_reg1 : std_logic := '0';
begin
	grstn <= GSRO WHEN GSREN = "true" ELSE '1';
	lrstn <= not RESET WHEN LSREN = "true" ELSE '1';
	
	process(FCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			Dd0 <= '0';
		elsif(lrstn = '0') then
			Dd0 <= '0';
		elsif(rising_edge(FCLK)) then
			Dd0 <= D;
		end if;
	end process;

	process(FCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			Dd1 <= '0';
		elsif (lrstn='0') then
			Dd1 <= '0';
		elsif(falling_edge(FCLK))then
			Dd1 <= D;
		end if;
	end process;

	process (FCLK, grstn, lrstn) 
    begin
        if (grstn = '0') then
			Dd0_reg0 <= '0';
            Dd0_reg1 <= '0';
            Dd1_reg0 <= '0';
            Dd1_reg1 <= '0';
		elsif (lrstn = '0') then
		    Dd0_reg0 <= '0';
            Dd0_reg1 <= '0';
            Dd1_reg0 <= '0';
            Dd1_reg1 <= '0';
        elsif(rising_edge(FCLK)) then
            Dd0_reg0 <= Dd0;
            Dd0_reg1 <= Dd0_reg0;
            Dd1_reg0 <= Dd1;
            Dd1_reg1 <= Dd1_reg0;
        end if;
    end process;

    process(FCLK, grstn,lrstn) 
    begin
        if (grstn = '0') then
            reset_delay <= '0';
		elsif (lrstn = '0') then
            reset_delay <= '0';
        elsif(rising_edge(FCLK)) then
            reset_delay <= '1';
        end if;
    end process;

    process(FCLK,reset_delay)
	begin
		if (reset_delay = '0') then
			CALIBdata <= "000";
		elsif(rising_edge(FCLK)) then
			CALIBdata <= CALIBdata(1 downto 0) & CALIB;
		end if;
	end process;
	
	CALIBdata_rising_p <= CALIBdata(1) and (not CALIBdata(2));
    dcnt_en <= not (CALIBdata_rising_p and calib_state);

	process (FCLK, reset_delay) 
    begin
		if (reset_delay = '0') then
            calib_state <= '0';
            D_en1 <= '0';
            D_en  <= '0';
            Dd_sel <= '0';
		elsif(rising_edge(FCLK)) then
            D_en <= not D_en1;
            if (CALIBdata_rising_p = '1') then
                calib_state <= not calib_state;
                Dd_sel <= not Dd_sel;
            else 
                calib_state <= calib_state;
                Dd_sel <= Dd_sel;
            end if;
                
            if (dcnt_en = '1') then
                D_en1 <= not D_en1;
            else 
                D_en1 <= D_en1;
            end if;
        end if;
    end process;
    
	process (Dd_sel, Dd0, Dd0_reg0, Dd0_reg1, Dd1_reg0, Dd1_reg1) 
    begin
        if(Dd_sel = '1') then
            D_data(3) <= Dd0;
            D_data(2) <= Dd1_reg0;
            D_data(1) <= Dd0_reg0;
            D_data(0) <= Dd1_reg1;
        else
            D_data(3) <= Dd1_reg0;
            D_data(2) <= Dd0_reg0;
            D_data(1) <= Dd1_reg1;
            D_data(0) <= Dd0_reg1;
        end if;
    end process;
    
    process(FCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			data <= "0000";
		elsif (lrstn = '0') then
			data <= "0000";
		elsif (rising_edge(FCLK)) then
            if (D_en = '1' ) then
                data <= D_data;
            end if;
		end if;
	end process;

	process(PCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			Q_reg <= "0000";
		elsif (lrstn = '0') then
			Q_reg <= "0000";
		elsif(rising_edge(PCLK))then
			Q_reg <= data;
		end if;
	end process;

	(Q3,Q2,Q1,Q0) <= Q_reg;

end Behavioral;

--------------------------IDES4_MEM----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity IDES4_MEM is
	generic(
		GSREN : string := "false";
		LSREN : string := "true"
	);
	PORT(
		D,RESET : IN std_logic;
		CALIB : IN std_logic;
		ICLK,FCLK,PCLK : IN std_logic;
		WADDR : IN std_logic_vector(2 downto 0);
		RADDR : IN std_logic_vector(2 downto 0);
		Q0 : OUT std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic;
		Q3 : OUT std_logic
	 );
end IDES4_MEM;

ARCHITECTURE Behavioral of IDES4_MEM is
	SIGNAL Dd0 : std_logic;
	SIGNAL D_data,data,Q_reg : std_logic_vector(3 downto 0) := "0000";
	SIGNAL D0_mem,D1_mem : std_logic_vector(7 downto 0) := "00000000";
	signal D_en1,D_en,dcnt_en,Dd_sel,calib_state : std_logic := '0';
	signal Dd0_reg0,Dd0_reg1,Dd1_reg0,Dd1_reg1 : std_logic := '0';
	signal CALIBdata_rising_p : std_logic;
    signal CALIBdata : std_logic_vector(2 downto 0);
    signal grstn,lrstn,reset_delay : std_logic;
begin
	grstn <= GSRO WHEN GSREN = "true" ELSE '1';
	lrstn <= not RESET WHEN LSREN = "true" ELSE '1';
	process(ICLK,grstn,lrstn)
	begin
		if(grstn = '0') then
			Dd0 <= '0';
		elsif(lrstn = '0') then
			Dd0 <= '0';
		elsif(rising_edge(ICLK))then
			Dd0 <= D;
		end if;
	end process;

	process(ICLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			D1_mem <= "00000000";
		elsif (lrstn = '0') then
			D1_mem <= "00000000";
		elsif(falling_edge(ICLK))then
			D1_mem(CONV_INTEGER(WADDR)) <= D;
		end if;
	end process;

	process(ICLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			D0_mem <= "00000000";
		elsif (lrstn = '0') then
			D0_mem <= "00000000";
		elsif(falling_edge(ICLK))then
			D0_mem(CONV_INTEGER(WADDR)) <= Dd0;
		end if;
	end process;

	process (FCLK, grstn, lrstn) 
    begin
        if (grstn = '0') then
            Dd0_reg0 <= '0';
            Dd0_reg1 <= '0';
            Dd1_reg0 <= '0';
            Dd1_reg1 <= '0';
		elsif (lrstn = '0') then
            Dd0_reg0 <= '0';
            Dd0_reg1 <= '0';
            Dd1_reg0 <= '0';
            Dd1_reg1 <= '0';
		elsif(rising_edge(FCLK))then
            Dd0_reg0 <= D0_mem(CONV_INTEGER(RADDR));
            Dd0_reg1 <= Dd0_reg0;
            Dd1_reg0 <= D1_mem(CONV_INTEGER(RADDR));
            Dd1_reg1 <= Dd1_reg0;
        end if;
    end process;

	process(FCLK, grstn,lrstn) 
    begin
        if (grstn = '0') then
            reset_delay <= '0';
		elsif (lrstn = '0') then
            reset_delay <= '0';
        elsif(rising_edge(FCLK)) then
            reset_delay <= '1';
        end if;
    end process;

    process(FCLK,reset_delay)
	begin
		if (reset_delay = '0') then
			CALIBdata <= "000";
		elsif(rising_edge(FCLK)) then
			CALIBdata <= CALIBdata(1 downto 0) & CALIB;
		end if;
	end process;
	
	CALIBdata_rising_p <= CALIBdata(1) and (not CALIBdata(2));
    dcnt_en <= not (CALIBdata_rising_p and calib_state);

	process (FCLK, reset_delay) 
    begin
		if (reset_delay = '0') then
            calib_state <= '0';
            D_en1 <= '0';
            D_en  <= '0';
            Dd_sel <= '0';
		elsif(rising_edge(FCLK)) then
            D_en <= not D_en1;
            if (CALIBdata_rising_p = '1') then
                calib_state <= not calib_state;
                Dd_sel <= not Dd_sel;
            else 
                calib_state <= calib_state;
                Dd_sel <= Dd_sel;
            end if;
                
            if (dcnt_en = '1') then
                D_en1 <= not D_en1;
            else 
                D_en1 <= D_en1;
            end if;
        end if;
    end process;
    
	process (Dd_sel, D0_mem, Dd0_reg0, Dd0_reg1, Dd1_reg0, Dd1_reg1) 
    begin
        if(Dd_sel = '1') then
            D_data(3) <= D0_mem(CONV_INTEGER(RADDR));
            D_data(2) <= Dd1_reg0;
            D_data(1) <= Dd0_reg0;
            D_data(0) <= Dd1_reg1;
        else
            D_data(3) <= Dd1_reg0;
            D_data(2) <= Dd0_reg0;
            D_data(1) <= Dd1_reg1;
            D_data(0) <= Dd0_reg1;
        end if;
    end process;

	process(FCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			data <= "0000";
		elsif (lrstn = '0') then
			data <= "0000";
		elsif (rising_edge(FCLK)) then
			if(D_en = '1') then 
				data <= D_data;
			end if;
		end if;
	end process;

	process(PCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			Q_reg <= "0000";
		elsif (lrstn = '0') then
			Q_reg <= "0000";
		elsif(rising_edge(PCLK))then
			Q_reg <= data;
		end if;
	end process;

	(Q3,Q2,Q1,Q0) <= Q_reg;

end Behavioral;

------------------------------------IVIDEO-------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity IVIDEO is
    GENERIC (
		GSREN : string := "false";
		LSREN : string := "true"
    );
	 
    PORT (
		D : IN std_logic;
		RESET : IN std_logic;
		CALIB : IN std_logic;
		FCLK : IN std_logic;
		PCLK : IN std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic;
		Q3 : OUT std_logic;
		Q4 : OUT std_logic;
		Q5 : OUT std_logic;
		Q6 : OUT std_logic
    );
end IVIDEO;

ARCHITECTURE Behavioral of IVIDEO is
	SIGNAL Dd0,Dd1 : std_logic;
	SIGNAL reset_delay : std_logic;
	SIGNAL D_data,data,Q_reg : std_logic_vector(6 downto 0) := "0000000";
	SIGNAL CALIBdata : std_logic_vector(2 downto 0) := "000";
	SIGNAL D_en,D_en0,D_en1,dcnt_en,dsel_en,Dd_sel : std_logic := '0';
	SIGNAL Dd0_reg0,Dd0_reg1,Dd0_reg2,Dd1_reg0,Dd1_reg1,Dd1_reg2,Dd1_reg3 : std_logic := '0';
	SIGNAL CALIBdata_rising_p: std_logic;
	SIGNAL grstn: std_logic;
	SIGNAL lrstn: std_logic;

begin
	grstn <= GSRO WHEN GSREN = "true" ELSE  '1';
	lrstn <= not RESET WHEN LSREN = "true" ELSE '1';

	process(FCLK,grstn,lrstn)
	begin
		if(grstn='0') then
			Dd0<= '0';
		elsif(lrstn='0') then
			Dd0<= '0';
		elsif(rising_edge(FCLK))then
			Dd0<=D;
		end if;
	end process;

	process(FCLK,grstn,lrstn)
	begin
		if (grstn='0') then
			Dd1 <= '0';
		elsif (lrstn='0') then
			Dd1 <= '0';
		elsif(falling_edge(FCLK))then
			Dd1 <= D;
		end if;
	end process;

	process(FCLK,grstn,lrstn)
	begin
		if (grstn='0') then
			reset_delay <= '0';
		elsif (lrstn='0') then
			reset_delay <= '0';
		elsif(rising_edge(FCLK))then
			reset_delay <= '1';
		end if;
	end process;

	process(FCLK,reset_delay)
	begin
		if (reset_delay = '0') then
			CALIBdata <= "000";
		elsif(rising_edge(FCLK)) then
			CALIBdata <= CALIBdata(1 downto 0)&CALIB;
		end if;
	end process;
	
	CALIBdata_rising_p <=  CALIBdata(1) and (not CALIBdata(2));
    dcnt_en <= not CALIBdata_rising_p;
    dsel_en <= (Dd_sel and D_en1 and (not D_en0) and (not CALIBdata_rising_p)) or ((not Dd_sel) and D_en0 and D_en1);
	
	process(FCLK, reset_delay) 
    begin
		if (reset_delay = '0') then
            D_en1 <= '0';
            D_en0 <= '0';
            D_en  <= '0';
            Dd_sel <= '0';
		elsif(rising_edge(FCLK)) then
            D_en <= (not((not Dd_sel) or D_en0 or D_en1)) or (not(Dd_sel or D_en1 or (not D_en0)));
            if (dsel_en = '1') then
                Dd_sel <= not Dd_sel;
            else
                Dd_sel <= Dd_sel;
            end if;
        
            if (dcnt_en = '1') then
                D_en0 <= not(D_en0 or (Dd_sel and D_en1 and (not D_en0)));
            else
                D_en0 <= D_en0;
            end if;
                                                                                   
            if (dcnt_en = '1') then
                D_en1 <= (not(Dd_sel and D_en1 and (not D_en0))) and (D_en0 xor D_en1);
            else
                D_en1 <= D_en1;
            end if;   
        end if;          
    end process;

    process(FCLK, grstn, lrstn) 
    begin
		if (grstn='0') then
            Dd0_reg0 <= '0';
            Dd0_reg1 <= '0';
            Dd0_reg2 <= '0';
            Dd1_reg0 <= '0';
            Dd1_reg1 <= '0';
            Dd1_reg2 <= '0';
            Dd1_reg3 <= '0';
		elsif (lrstn='0') then
            Dd0_reg0 <= '0';
            Dd0_reg1 <= '0';
            Dd0_reg2 <= '0';
            Dd1_reg0 <= '0';
            Dd1_reg1 <= '0';
            Dd1_reg2 <= '0';
            Dd1_reg3 <= '0';
		elsif(rising_edge(FCLK)) then
            Dd0_reg0 <= Dd0;
            Dd0_reg1 <= Dd0_reg0;
            Dd0_reg2 <= Dd0_reg1;
            Dd1_reg0 <= Dd1;
            Dd1_reg1 <= Dd1_reg0;
            Dd1_reg2 <= Dd1_reg1;
            Dd1_reg3 <= Dd1_reg2;
        end if;
    end process;

    process(Dd_sel, Dd0, Dd0_reg0, Dd0_reg1, Dd0_reg2, Dd1_reg0, Dd1_reg1, Dd1_reg2, Dd1_reg3) 
    begin
        if(Dd_sel = '1') then
            D_data(6) <= Dd0;
            D_data(5) <= Dd1_reg0;
            D_data(4) <= Dd0_reg0;
            D_data(3) <= Dd1_reg1;
            D_data(2) <= Dd0_reg1;
            D_data(1) <= Dd1_reg2;
            D_data(0) <= Dd0_reg2;
        else
            D_data(6) <= Dd1_reg0;
            D_data(5) <= Dd0_reg0;
            D_data(4) <= Dd1_reg1;
            D_data(3) <= Dd0_reg1;
            D_data(2) <= Dd1_reg2;
            D_data(1) <= Dd0_reg2;
            D_data(0) <= Dd1_reg3;
        end if;
    end process;
	
	process(FCLK,grstn,lrstn)
	begin
		if (grstn='0') then
			data <= "0000000";
		elsif (lrstn='0') then
			data <= "0000000";
		elsif(rising_edge(FCLK))then
			if(D_en = '1') then
				data <= D_data;
			end if;
		end if;
	end process;

	process(PCLK,grstn,lrstn)
	begin
		if (grstn='0') then
			Q_reg <= "0000000";
		elsif (lrstn='0') then
			Q_reg <= "0000000";
		elsif(rising_edge(PCLK))then
			Q_reg <= data;
		end if;
	end process;

	(Q6,Q5,Q4,Q3,Q2,Q1,Q0) <= Q_reg;
	
end Behavioral;

-----------------------------------IDES8-------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity IDES8 is
    GENERIC (
	    GSREN : string := "false";
		LSREN : string := "true"
    );
    PORT (
		D,RESET : IN std_logic;
		CALIB : IN std_logic;
		FCLK,PCLK : IN std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic;
		Q3 : OUT std_logic;
		Q4 : OUT std_logic;
		Q5 : OUT std_logic;
		Q6 : OUT std_logic;
		Q7 : OUT std_logic
    );
end IDES8;

ARCHITECTURE Behavioral of IDES8 is
SIGNAL grstn,lrstn,reset_delay : std_logic;
SIGNAL Dd0,Dd1 : std_logic;
SIGNAL D_en,D_en0,D_en1,Dd_sel,calib_state,dcnt_en : std_logic := '0';
signal Dd0_reg0,Dd0_reg1,Dd0_reg2,Dd0_reg3,Dd1_reg0,Dd1_reg1,Dd1_reg2,Dd1_reg3 : std_logic  := '0';
SIGNAL D_data,data,Q_reg : std_logic_vector(7 downto 0);
SIGNAL CALIBdata : std_logic_vector(2 downto 0);
SIGNAL CALIBdata_rising_p : std_logic;

begin
	grstn <= GSRO WHEN GSREN = "true" ELSE '1';
	lrstn <= not RESET WHEN LSREN = "true" ELSE '1';
	
	process(FCLK,grstn,lrstn)
	begin
		if(grstn = '0') then
			Dd0 <= '0';
		elsif(lrstn = '0') then
			Dd0 <= '0';
		elsif(rising_edge(FCLK))then
			Dd0 <= D;
		end if;
	end process;

	process(FCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			Dd1 <= '0';
		elsif (lrstn = '0') then
			Dd1 <= '0';
		elsif(falling_edge(FCLK))then
			Dd1 <= D;
		end if;
	end process;

	process(FCLK,grstn,lrstn)
	begin
		if (grstn='0') then
			reset_delay <= '0';
		elsif (lrstn='0') then
			reset_delay <= '0';
		elsif(rising_edge(FCLK))then
			reset_delay <= '1';
		end if;
	end process;

	process(FCLK,reset_delay)
	begin
		if (reset_delay = '0') then
			CALIBdata <= "000";
		elsif(rising_edge(FCLK)) then
			CALIBdata <= CALIBdata(1 downto 0)&CALIB;
		end if;
	end process;
	
	CALIBdata_rising_p <=  CALIBdata(1) and (not CALIBdata(2));
    dcnt_en <= not (CALIBdata_rising_p and calib_state);
	
	process(FCLK, reset_delay) 
    begin
		if (reset_delay = '0') then
            calib_state <= '0';
            D_en1 <= '0';
            D_en0 <= '0';
            D_en  <= '0';
            Dd_sel <= '0';
		elsif(rising_edge(FCLK)) then
            D_en <= D_en0 and (not D_en1);
            if (CALIBdata_rising_p = '1') then
                calib_state <= not calib_state;
                Dd_sel <= not Dd_sel;
            else
                calib_state <= calib_state;
                Dd_sel <= Dd_sel;
            end if;
        
            if (dcnt_en = '1') then
                D_en0 <= not D_en0;
            else
                D_en0 <= D_en0;
            end if;
                                                                                   
            if (dcnt_en = '1') then
                D_en1 <= D_en0 xor D_en1;
            else
                D_en1 <= D_en1;
            end if;   
        end if;          
    end process;

    process(FCLK, grstn, lrstn) 
    begin
		if (grstn='0') then
            Dd0_reg0 <= '0';
            Dd0_reg1 <= '0';
            Dd0_reg2 <= '0';
            Dd0_reg3 <= '0';
            Dd1_reg0 <= '0';
            Dd1_reg1 <= '0';
            Dd1_reg2 <= '0';
            Dd1_reg3 <= '0';
		elsif (lrstn='0') then
            Dd0_reg0 <= '0';
            Dd0_reg1 <= '0';
            Dd0_reg2 <= '0';
            Dd0_reg3 <= '0';
            Dd1_reg0 <= '0';
            Dd1_reg1 <= '0';
            Dd1_reg2 <= '0';
            Dd1_reg3 <= '0';
		elsif(rising_edge(FCLK)) then
            Dd0_reg0 <= Dd0;
            Dd0_reg1 <= Dd0_reg0;
            Dd0_reg2 <= Dd0_reg1;
            Dd0_reg3 <= Dd0_reg2;
            Dd1_reg0 <= Dd1;
            Dd1_reg1 <= Dd1_reg0;
            Dd1_reg2 <= Dd1_reg1;
            Dd1_reg3 <= Dd1_reg2;
        end if;
    end process;

    process(Dd_sel, Dd0, Dd0_reg0, Dd0_reg1, Dd0_reg2, Dd0_reg3, Dd1_reg0, Dd1_reg1, Dd1_reg2, Dd1_reg3) 
    begin
        if(Dd_sel = '1') then
            D_data(7) <= Dd0;
            D_data(6) <= Dd1_reg0;
            D_data(5) <= Dd0_reg0;
            D_data(4) <= Dd1_reg1;
            D_data(3) <= Dd0_reg1;
            D_data(2) <= Dd1_reg2;
            D_data(1) <= Dd0_reg2;
            D_data(0) <= Dd1_reg3;
        else
            D_data(7) <= Dd1_reg0;
            D_data(6) <= Dd0_reg0;
            D_data(5) <= Dd1_reg1;
            D_data(4) <= Dd0_reg1;
            D_data(3) <= Dd1_reg2;
            D_data(2) <= Dd0_reg2;
            D_data(1) <= Dd1_reg3;
            D_data(0) <= Dd0_reg3;
        end if;
    end process;
	
	process(FCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			data <= "00000000";
		elsif(lrstn = '0')then
			data <= "00000000";
		elsif(rising_edge(FCLK))then
			if(D_en = '1') then
				data <= D_data;
			end if;
		end if;
	end process;

	process(PCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			Q_reg <= "00000000";
		elsif(lrstn='0')then
			Q_reg <= "00000000";
		elsif(rising_edge(PCLK))then
			Q_reg <= data;
		end if;
	end process;

	(Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0) <= Q_reg;

end Behavioral;

-------------------------IDES8_MEM----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity IDES8_MEM is
    GENERIC (
	    GSREN : string := "false";
		LSREN : string := "true"
    );
    PORT (
		D,RESET : IN std_logic;
		CALIB : IN std_logic;
		FCLK,ICLK,PCLK : IN std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic;
		Q3 : OUT std_logic;
		Q4 : OUT std_logic;
		Q5 : OUT std_logic;
		Q6 : OUT std_logic;
		Q7 : OUT std_logic;
		WADDR : in std_logic_vector(2 downto 0);
		RADDR : in std_logic_vector(2 downto 0)
    );
end IDES8_MEM;

ARCHITECTURE Behavioral of IDES8_MEM is
signal grstn,lrstn,reset_delay : std_logic; 
SIGNAL Dd0 : std_logic;
signal D_en,D_en0,D_en1,Dd_sel,calib_state,dcnt_en : std_logic := '0';
SIGNAL D_data,data,Q_reg,Dd0_mem,Dd1_mem : std_logic_vector(7 downto 0);
SIGNAL CALIBdata : std_logic_vector(2 downto 0);
signal Dd0_reg0,Dd0_reg1,Dd0_reg2,Dd0_reg3,Dd1_reg0,Dd1_reg1,Dd1_reg2,Dd1_reg3 : std_logic := '0';
signal CALIBdata_rising_p : std_logic;

begin
	grstn <= GSRO WHEN GSREN = "true" ELSE '1';
	lrstn <= not RESET WHEN LSREN = "true" ELSE '1';
	process(ICLK,grstn,lrstn)
	begin
		if(grstn = '0') then
			Dd0 <= '0';
		elsif(lrstn = '0') then
			Dd0 <= '0';
		elsif(rising_edge(ICLK))then
			Dd0 <= D;
		end if;
	end process;

	process(ICLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			Dd0_mem <= "00000000";
		elsif (lrstn = '0') then
			Dd0_mem <= "00000000";
		elsif(falling_edge(ICLK))then
			Dd0_mem(CONV_INTEGER(WADDR)) <= Dd0;
		end if;
	end process;

	process(ICLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			Dd1_mem <= "00000000";
		elsif (lrstn = '0') then
			Dd1_mem <= "00000000";
		elsif(falling_edge(ICLK))then
			Dd1_mem(CONV_INTEGER(WADDR)) <= D;
		end if;
	end process;

	process(FCLK,grstn,lrstn)
	begin
		if (grstn='0') then
			reset_delay <= '0';
		elsif (lrstn='0') then
			reset_delay <= '0';
		elsif(rising_edge(FCLK))then
			reset_delay <= '1';
		end if;
	end process;

	process(FCLK,reset_delay)
	begin
		if (reset_delay = '0') then
			CALIBdata <= "000";
		elsif(rising_edge(FCLK)) then
			CALIBdata <= CALIBdata(1 downto 0)&CALIB;
		end if;
	end process;
	
	CALIBdata_rising_p <=  CALIBdata(1) and (not CALIBdata(2));
    dcnt_en <= not (CALIBdata_rising_p and calib_state);
	
	process(FCLK, reset_delay) 
    begin
		if (reset_delay = '0') then
            calib_state <= '0';
            D_en1 <= '0';
            D_en0 <= '0';
            D_en  <= '0';
            Dd_sel <= '0';
		elsif(rising_edge(FCLK)) then
            D_en <= D_en0 and (not D_en1);
            if (CALIBdata_rising_p = '1') then
                calib_state <= not calib_state;
                Dd_sel <= not Dd_sel;
            else
                calib_state <= calib_state;
                Dd_sel <= Dd_sel;
            end if;
        
            if (dcnt_en = '1') then
                D_en0 <= not D_en0;
            else
                D_en0 <= D_en0;
            end if;
                                                                                   
            if (dcnt_en = '1') then
                D_en1 <= D_en0 xor D_en1;
            else
                D_en1 <= D_en1;
            end if;   
        end if;          
    end process;

    process(FCLK, grstn, lrstn) 
	begin
		if (grstn='0') then
            Dd0_reg0 <= '0';
            Dd0_reg1 <= '0';
            Dd0_reg2 <= '0';
            Dd0_reg3 <= '0';
            Dd1_reg0 <= '0';
            Dd1_reg1 <= '0';
            Dd1_reg2 <= '0';
            Dd1_reg3 <= '0';
		elsif (lrstn='0') then
            Dd0_reg0 <= '0';
            Dd0_reg1 <= '0';
            Dd0_reg2 <= '0';
            Dd0_reg3 <= '0';
            Dd1_reg0 <= '0';
            Dd1_reg1 <= '0';
            Dd1_reg2 <= '0';
            Dd1_reg3 <= '0';
		elsif(rising_edge(FCLK)) then
            Dd0_reg0 <= Dd0_mem(CONV_INTEGER(RADDR));
            Dd0_reg1 <= Dd0_reg0;
            Dd0_reg2 <= Dd0_reg1;
            Dd0_reg3 <= Dd0_reg2;
            Dd1_reg0 <= Dd1_mem(CONV_INTEGER(RADDR));
            Dd1_reg1 <= Dd1_reg0;
            Dd1_reg2 <= Dd1_reg1;
            Dd1_reg3 <= Dd1_reg2;
        end if;
    end process;

    process(Dd_sel, Dd0_mem, Dd0_reg0, Dd0_reg1, Dd0_reg2, Dd1_reg0, Dd1_reg1, Dd1_reg2, Dd1_reg3) 
	begin
        if(Dd_sel = '1') then
            D_data(7) <= Dd0_mem(CONV_INTEGER(RADDR));
            D_data(6) <= Dd1_reg0;
            D_data(5) <= Dd0_reg0;
            D_data(4) <= Dd1_reg1;
            D_data(3) <= Dd0_reg1;
            D_data(2) <= Dd1_reg2;
            D_data(1) <= Dd0_reg2;
            D_data(0) <= Dd1_reg3;
        else
            D_data(7) <= Dd1_reg0;
            D_data(6) <= Dd0_reg0;
            D_data(5) <= Dd1_reg1;
            D_data(4) <= Dd0_reg1;
            D_data(3) <= Dd1_reg2;
            D_data(2) <= Dd0_reg2;
            D_data(1) <= Dd1_reg3;
            D_data(0) <= Dd0_reg3;
        end if;
    end process;
	
	process(FCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			data <= "00000000";
		elsif(lrstn = '0')then
			data <= "00000000";
		elsif(rising_edge(FCLK))then
			if(D_en = '1') then
				data <= D_data;
			end if;
		end if;
	end process;

	process(PCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			Q_reg <= "00000000";
		elsif(lrstn = '0')then
			Q_reg <= "00000000";
		elsif(rising_edge(PCLK))then
			Q_reg <= data;
		end if;
	end process;

	(Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0) <= Q_reg;

end Behavioral;

--------------------------------------IDES10----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity IDES10 is
    GENERIC (
	    GSREN : string := "false";
		LSREN : string := "true"
    );
    PORT (
		D,RESET : IN std_logic;
		CALIB : IN std_logic;
		FCLK,PCLK : IN std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic;
		Q3 : OUT std_logic;
		Q4 : OUT std_logic;
		Q5 : OUT std_logic;
		Q6 : OUT std_logic;
		Q7 : OUT std_logic;
		Q8 : OUT std_logic;
		Q9 : OUT std_logic
    );
end IDES10;

ARCHITECTURE Behavioral of IDES10 is
	SIGNAL Dd0,Dd1,grstn,lrstn,reset_delay,dcnt_reset : std_logic;
	SIGNAL D_en,D_en0,D_en1,D_en2,dcnt_en,Dd_sel,calib_state : std_logic := '0';
	SIGNAL D_data,data,Q_reg : std_logic_vector(9 downto 0);
	SIGNAL CALIBdata : std_logic_vector(2 downto 0);
	SIGNAL Dd0_reg0,Dd0_reg1,Dd0_reg2,Dd0_reg3,Dd0_reg4,Dd1_reg0,Dd1_reg1,Dd1_reg2,Dd1_reg3,Dd1_reg4 : std_logic := '0';
    SIGNAL CALIBdata_rising_p : std_logic;

begin
	grstn <= GSRO WHEN GSREN = "true" ELSE '1';
	lrstn <= not RESET WHEN LSREN = "true" ELSE '1';
	process(FCLK,grstn,lrstn)
	begin
		if(grstn = '0') then
			Dd0<= '0';
		elsif(lrstn = '0') then
			Dd0<= '0';
		elsif(rising_edge(FCLK))then
			Dd0 <= D;
		end if;
	end process;

	process(FCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			Dd1 <= '0';
		elsif (lrstn = '0') then
			Dd1 <= '0';
		elsif(falling_edge(FCLK))then
			Dd1 <= D;
		end if;
	end process;

	process(FCLK,grstn,lrstn)
	begin
		if (grstn='0') then
			reset_delay <= '0';
		elsif (lrstn='0') then
			reset_delay <= '0';
		elsif(rising_edge(FCLK))then
			reset_delay <= '1';
		end if;
	end process;

	process(FCLK,reset_delay)
	begin
		if (reset_delay = '0') then
			CALIBdata <= "000";
		elsif(rising_edge(FCLK)) then
			CALIBdata <= CALIBdata(1 downto 0)&CALIB;
		end if;
	end process;
	
	CALIBdata_rising_p <=  CALIBdata(1) and (not CALIBdata(2));
    dcnt_en <= not (CALIBdata_rising_p and calib_state);
    dcnt_reset <= D_en2 and (not D_en1) and (not D_en0);
	
	process(FCLK, reset_delay) 
    begin
		if (reset_delay = '0') then
            calib_state <= '0';
            D_en1 <= '0';
            D_en0 <= '0';
            D_en2 <= '0';
            D_en  <= '0';
            Dd_sel <= '0';
		elsif(rising_edge(FCLK)) then
            D_en <= (not D_en0) and D_en1;
            if (CALIBdata_rising_p = '1') then
                calib_state <= not calib_state;
                Dd_sel <= not Dd_sel;
            else
                calib_state <= calib_state;
                Dd_sel <= Dd_sel;
            end if;
        
            if (dcnt_en = '1') then
                D_en0 <= not(dcnt_reset or D_en0);
            else
                D_en0 <= D_en0;
            end if;                                                                                   
            if (dcnt_en = '1') then
                D_en1 <= D_en0 xor D_en1;
            else
                D_en1 <= D_en1;
            end if;   

            if (dcnt_en = '1') then
                D_en2 <= ((D_en0 and D_en1) xor D_en2) and (not dcnt_reset);
            else
                D_en2 <= D_en2;
            end if;  

        end if;          
    end process;

    process(FCLK, grstn, lrstn) 
    begin
		if (grstn = '0') then
            Dd0_reg0 <= '0';
            Dd0_reg1 <= '0';
            Dd0_reg2 <= '0';
            Dd0_reg3 <= '0';
            Dd0_reg4 <= '0';
            Dd1_reg0 <= '0';
            Dd1_reg1 <= '0';
            Dd1_reg2 <= '0';
            Dd1_reg3 <= '0';
            Dd1_reg4 <= '0';
		elsif(lrstn = '0')then
            Dd0_reg0 <= '0';
            Dd0_reg1 <= '0';
            Dd0_reg2 <= '0';
            Dd0_reg3 <= '0';
            Dd0_reg4 <= '0';
            Dd1_reg0 <= '0';
            Dd1_reg1 <= '0';
            Dd1_reg2 <= '0';
            Dd1_reg3 <= '0';
            Dd1_reg4 <= '0';        
		elsif(rising_edge(FCLK))then
            Dd0_reg0 <= Dd0;
            Dd0_reg1 <= Dd0_reg0;
            Dd0_reg2 <= Dd0_reg1;
            Dd0_reg3 <= Dd0_reg2;
            Dd0_reg4 <= Dd0_reg3;
            Dd1_reg0 <= Dd1;
            Dd1_reg1 <= Dd1_reg0;
            Dd1_reg2 <= Dd1_reg1;
            Dd1_reg3 <= Dd1_reg2;
            Dd1_reg4 <= Dd1_reg3;
        end if;
    end process;

    process(Dd_sel, Dd0, Dd0_reg0, Dd0_reg1, Dd0_reg2, Dd0_reg3, Dd0_reg4, Dd1_reg0, Dd1_reg1, Dd1_reg2, Dd1_reg3, Dd1_reg4) 
    begin
        if(Dd_sel = '1') then
            D_data(9) <= Dd0;
            D_data(8) <= Dd1_reg0;
            D_data(7) <= Dd0_reg0;
            D_data(6) <= Dd1_reg1;
            D_data(5) <= Dd0_reg1;
            D_data(4) <= Dd1_reg2;
            D_data(3) <= Dd0_reg2;
            D_data(2) <= Dd1_reg3;
            D_data(1) <= Dd0_reg3;
            D_data(0) <= Dd1_reg4;
        else 
            D_data(9) <= Dd1_reg0;
            D_data(8) <= Dd0_reg0;
            D_data(7) <= Dd1_reg1;
            D_data(6) <= Dd0_reg1;
            D_data(5) <= Dd1_reg2;
            D_data(4) <= Dd0_reg2;
            D_data(3) <= Dd1_reg3;
            D_data(2) <= Dd0_reg3;
            D_data(1) <= Dd1_reg4;
            D_data(0) <= Dd0_reg4;
        end if;
    end process;

	process(FCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			data <= "0000000000";
		elsif(lrstn = '0')then
			data <= "0000000000";
		elsif(rising_edge(FCLK))then
			if(D_en = '1') then
				data <= D_data;
			end if;
		end if;
	end process;

	process(PCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			Q_reg <= "0000000000";
		elsif(lrstn = '0')then
			Q_reg <= "0000000000";
		elsif(rising_edge(PCLK))then
			Q_reg <= data;
		end if;
	end process;

	(Q9,Q8,Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0) <= Q_reg;

end Behavioral;


-------------------------OSER4------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity OSER4 is
	GENERIC (
		GSREN : string := "false";
		LSREN : string := "true";
        HWL : string := "false"; --"true"; "false"
        TXCLK_POL : bit := '0' --'0':Rising edge output; '1':Falling edge output
	);
	PORT (
		D0 : in std_logic;
		D1 : in std_logic;
		D2 : in std_logic;
		D3 : in std_logic;
		TX0 : in std_logic;
		TX1 : in std_logic;
		PCLK : in std_logic;
		RESET : in std_logic;
		FCLK : in std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic
	);
end OSER4;

architecture Behavioral of OSER4 is

	SIGNAL Dd1,Dd2,Dd3 : std_logic_vector(3 downto 0);
	SIGNAL Ttx1,Ttx2,Ttx3 : std_logic_vector(1 downto 0);
	SIGNAL rstn_dsel,d_up0,d_up1 : std_logic;
	SIGNAL dsel : std_logic := '0';	
    SIGNAL d_en0,d_en1 : std_logic;
	SIGNAL Qq_n,Q_data_n,Qq_p,Q_data_p : std_logic;
	SIGNAL grstn,lrstn : std_logic;
		
begin
	grstn <= GSRO when GSREN = "true" else '1';
	lrstn <= (not RESET) when LSREN = "true" else '1';	 

	process(PCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			Dd1 <= "0000";
			Ttx1 <= "00";
		elsif (lrstn='0') then
			Dd1 <= "0000";
			Ttx1 <= "00";
		elsif (PCLK'event and PCLK ='1' ) then
			Dd1 <= (D3,D2,D1,D0);
			Ttx1 <= (TX1,TX0);
		end if;
	end process;

	process(FCLK, grstn, lrstn)
		begin
		if(grstn = '0') then
			rstn_dsel <= '0';
		elsif(lrstn = '0') then
			rstn_dsel <= '0';
		elsif(FCLK'event and FCLK = '1') then
			rstn_dsel <= '1';
		end if;
	end process;

    process(FCLK, rstn_dsel)
	begin
		if(rstn_dsel = '0') then
			dsel <= '0';
		elsif(FCLK'event and FCLK = '1') then
			dsel <= (not dsel);
		end if;
	end process;
    
    d_en0 <= not dsel;
    d_en1 <= (not dsel) when (HWL = "true") else dsel;

    process(FCLK, rstn_dsel)
	begin
		if(rstn_dsel = '0') then
			d_up0 <= '0';
			d_up1 <= '0';
		elsif(FCLK'event and FCLK = '1') then
            if(d_en0 = '1') then
                d_up0 <= '1';
            else
                d_up0 <= '0';
            end if;

            if(d_en1 = '1') then
                d_up1 <= '1';
            else
                d_up1 <= '0';
            end if;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			Dd2 <= "0000";
			Ttx2 <= "00";
		elsif(lrstn = '0') then
			Dd2 <= "0000";
			Ttx2 <= "00";
		elsif(FCLK'event and FCLK = '1') then
			if (d_up0 = '1') then
				Dd2 <= Dd1;
				Ttx2 <= Ttx1;
            else
                Dd2 <= Dd2;
                Ttx2 <= Ttx2;
			end if;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			Dd3 <= "0000";
			Ttx3 <= "00";
		elsif(lrstn = '0') then
			Dd3 <= "0000";
			Ttx3 <= "00";
		elsif(FCLK'event and FCLK = '1') then 
			if (d_up1 = '1') then
				Dd3 <= Dd2;
				Ttx3 <= Ttx2;
			else 
				Dd3 <= "00"&Dd3(3 downto 2);
				Ttx3 <= '0'&Ttx3(1);
			end if;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			Qq_p <= '0';
			Q_data_p <= '0';
		elsif (lrstn = '0') then
			Qq_p <= '0';
			Q_data_p <= '0';
		elsif (FCLK'event and FCLK = '1') then 
			Qq_p <= Dd3(1);
			Q_data_p <= Q_data_n;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn='0') then
			Qq_n <= '0';
            Q_data_n <= '0'; 
		elsif(lrstn='0') then
			Qq_n <= '0';
            Q_data_n <= '0'; 
		elsif(FCLK'event and FCLK = '0') then
			Qq_n <= Dd3(0);
            Q_data_n <= Ttx3(0);
		end if;
	end process;

	Q0 <= Qq_n when FCLK = '1' else Qq_p;
    Q1 <= Q_data_p when (TXCLK_POL = '0') else Q_data_n;
	
end Behavioral;

-----------------OSER4_MEM--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity OSER4_MEM is
	GENERIC (
		GSREN : string := "false";
		LSREN : string := "true";
		HWL : string := "false";
        TXCLK_POL : bit := '0';--'0':Rising edge output; '1':Falling edge output
        TCLK_SOURCE : string := "DQSW"    
	);
	PORT (
		D0 : in std_logic;
		D1 : in std_logic;
		D2 : in std_logic;
		D3 : in std_logic;
		TX0 : in std_logic;
		TX1 : in std_logic;
		PCLK : in std_logic;
		RESET : in std_logic;
		FCLK : in std_logic;
		TCLK : in std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic
	);
end OSER4_MEM;

architecture Behavioral of OSER4_MEM is
	SIGNAL Dd1,Dd2,Dd3 : std_logic_vector(3 downto 0);
	SIGNAL Ttx1,Ttx2,Ttx3 : std_logic_vector(1 downto 0);
	SIGNAL rstn_dsel0,d_up0,rstn_dsel1,d_up1 : std_logic;
	SIGNAL dsel0,dsel1 : std_logic := '0';
	SIGNAL d_en0,d_en1 : std_logic;
	SIGNAL Qq_n,Q_data_n,Qq_p,Q_data_p : std_logic;
    signal tclk_sig : std_logic;
	SIGNAL grstn: std_logic;
	SIGNAL lrstn: std_logic;
begin
	grstn <= GSRO when GSREN = "true" else '1';
	lrstn <= not RESET when LSREN = "true" else '1';
    tclk_sig <= TCLK when (TCLK_SOURCE = "DQSW") else (not TCLK);

	process(PCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			Dd1 <= "0000";
			Ttx1 <= "00";
		elsif(lrstn = '0') then
			Dd1 <= "0000";
			Ttx1 <= "00";
		elsif(PCLK'event and PCLK = '1') then 
			Dd1 <= (D3,D2,D1,D0);
			Ttx1 <= (TX1,TX0);
		end if;
	end process;

    process(FCLK, grstn, lrstn)
		begin
		if(grstn = '0') then
			rstn_dsel0 <= '0';
		elsif(lrstn = '0') then
			rstn_dsel0 <= '0';
		elsif(FCLK'event and FCLK = '1') then
			rstn_dsel0 <= '1';
		end if;
	end process;

    process(FCLK, rstn_dsel0)
	begin
		if(rstn_dsel0 = '0') then
			dsel0 <= '0';
		elsif(FCLK'event and FCLK = '1') then
			dsel0 <= (not dsel0);
		end if;
	end process;
    
    d_en0 <= not dsel0;

    process(FCLK, rstn_dsel0)
	begin
		if(rstn_dsel0 = '0') then
			d_up0 <= '0';
		elsif(FCLK'event and FCLK = '1') then
            if(d_en0 = '1') then
                d_up0 <= '1';
            else
                d_up0 <= '0';
            end if;
		end if;
	end process;

    process(tclk_sig, grstn, lrstn)
		begin
		if(grstn = '0') then
			rstn_dsel1 <= '0';
		elsif(lrstn = '0') then
			rstn_dsel1 <= '0';
		elsif(tclk_sig'event and tclk_sig = '1') then
			rstn_dsel1 <= '1';
		end if;
	end process;

    process(tclk_sig, rstn_dsel1)
	begin
		if(rstn_dsel1 = '0') then
			dsel1 <= '0';
		elsif(tclk_sig'event and tclk_sig = '1') then
			dsel1 <= (not dsel1);
		end if;
	end process;

    d_en1 <= (not dsel1) when (HWL = "true") else dsel1;

    process(tclk_sig, rstn_dsel1)
	begin
		if(rstn_dsel1 = '0') then
			d_up1 <= '0';
		elsif(tclk_sig'event and tclk_sig = '1') then
            if(d_en1 = '1') then
                d_up1 <= '1';
            else
                d_up1 <= '0';
            end if;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			Dd2 <= "0000";
			Ttx2 <= "00";
		elsif(lrstn = '0') then
			Dd2 <= "0000";
			Ttx2 <= "00";
		elsif(FCLK'event and FCLK = '1') then
			if(d_up0 = '1') then
				Dd2 <= Dd1;
				Ttx2 <= Ttx1;
            else 
                Dd2 <= Dd2;
				Ttx2 <= Ttx2;
			end if;
		end if;
	end process;
	
	process(tclk_sig, grstn, lrstn)
	begin
		if(grstn = '0') then
			Dd3 <= "0000";
			Ttx3 <= "00";
		elsif(lrstn = '0') then
			Dd3 <= "0000";
			Ttx3 <= "00";
		elsif(tclk_sig'event and tclk_sig = '1') then 
			if(d_up1 = '1') then
				Dd3 <= Dd2;
				Ttx3 <= Ttx2;
			else
				Dd3 <= "00"&Dd3(3 downto 2);
				Ttx3 <= "0"&Ttx3(1);
			end if;
		end if;
	end process;

	process(tclk_sig, grstn, lrstn)
	begin
		if (grstn = '0') then
			Qq_p <= '0';
			Q_data_p <= '0';
		elsif (lrstn = '0') then
			Qq_p <= '0';
			Q_data_p <= '0';
		elsif (tclk_sig'event and tclk_sig = '1') then 
			Qq_p <= Dd3(1);
			Q_data_p <= Q_data_n;
		end if;
	end process;

	process(tclk_sig, grstn, lrstn)
	begin
		if (grstn = '0') then
			Qq_n <= '0';
			Q_data_n <= '0';
		elsif (lrstn = '0') then
			Qq_n <= '0';
			Q_data_n <= '0';
		elsif (tclk_sig'event and tclk_sig = '0') then
			Qq_n <= Dd3(0);
			Q_data_n <= Ttx3(0);
		end if;
	end process;

	Q0 <= Qq_n when tclk_sig  = '1' else Qq_p;
    Q1 <= Q_data_p when (TXCLK_POL = '0') else Q_data_n;    

end Behavioral;

--------------------OVIDEO----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity OVIDEO is
	GENERIC(
		GSREN : string := "false";
		LSREN : string := "true"
	);
	PORT (
		D0 : in std_logic;
		D1 : in std_logic;
		D2 : in std_logic;
		D3 : in std_logic;
		D4 : in std_logic;
		D5 : in std_logic;
		D6 : in std_logic;
		PCLK : in std_logic;
		RESET : in std_logic;
		FCLK : in std_logic;
		Q : OUT std_logic
	);
end OVIDEO;

architecture Behavioral of OVIDEO is
	SIGNAL Dd1 : std_logic_vector(6 downto 0);
	SIGNAL Dd2,Dd3,Dd4 : std_logic_vector(7 downto 0);
	SIGNAL rstn_dsel : std_logic;
	SIGNAL dcnt0,dcnt1,dsel : std_logic := '0';
	SIGNAL dsel_en,dcnt_reset,d_en0,d_en1 : std_logic;
	SIGNAL d_up0,d_up1 : std_logic;
	SIGNAL Qq_p,Qq_n : std_logic;
	SIGNAL grstn: std_logic;
	SIGNAL lrstn: std_logic;

begin
	grstn <= GSRO when (GSREN = "true") else '1';
	lrstn <= (not RESET) when (LSREN = "true") else '1';

	process(PCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			Dd1 <= "0000000";
		elsif(lrstn = '0') then
			Dd1 <= "0000000";
		elsif(PCLK'event and PCLK = '1') then 
			Dd1 <= (D6,D5,D4,D3,D2,D1,D0);
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			rstn_dsel <= '0';
		elsif(lrstn = '0') then
			rstn_dsel <= '0';
		elsif(FCLK'event and FCLK = '1')then
			rstn_dsel <= '1';
		end if;
	end process;

    process(FCLK, rstn_dsel)
	begin
		if(rstn_dsel = '0') then
			dcnt0 <= '0';
			dcnt1 <= '0';
		elsif(FCLK'event and FCLK = '1') then
			dcnt0 <= not (dcnt0 or dcnt_reset);
			dcnt1 <= not((dcnt0 xnor dcnt1) or dcnt_reset);
		end if;
	end process;

    dsel_en <= (dsel and dcnt1 and (not dcnt0)) or ((not dsel) and dcnt1 and dcnt0);

    process(FCLK, rstn_dsel)
	begin
		if(rstn_dsel = '0') then
			dsel <= '0';
		elsif(FCLK'event and FCLK = '1') then
            if(dsel_en = '1') then
			    dsel <= not dsel;
            else
			    dsel <= dsel;
            end if;
		end if;
	end process;

    dcnt_reset <= (not dcnt0) and dcnt1 and dsel;
    d_en0 <= ((not dsel) and (not dcnt1) and dcnt0) or (dsel and (not dcnt1) and (not dcnt0));

    process(FCLK, rstn_dsel)
	begin
		if(rstn_dsel = '0') then
			d_up0 <= '0';
		elsif(FCLK'event and FCLK = '1') then
            if(d_en0 = '1') then
			    d_up0 <= '1';
            else
			    d_up0 <= '0';
            end if;
		end if;
	end process;

    d_en1 <= ((not dsel) and dcnt1 and (not dcnt0)) or (dsel and (not dcnt1) and dcnt0);

    process(FCLK, rstn_dsel)
	begin
		if(rstn_dsel = '0') then
			d_up1 <= '0';
		elsif(FCLK'event and FCLK = '1') then
            if(d_en1 = '1') then
			    d_up1 <= '1';
            else
			    d_up1 <= '0';
            end if;
		end if;
	end process;

    process(Dd1, Dd3, dsel)
    begin
        if(dsel = '1') then 
            Dd2(0) <= Dd3(6);
            Dd2(1) <= Dd1(0);
            Dd2(2) <= Dd1(1);
            Dd2(3) <= Dd1(2);
            Dd2(4) <= Dd1(3);
            Dd2(5) <= Dd1(4);
            Dd2(6) <= Dd1(5);
            Dd2(7) <= Dd1(6);
        else
            Dd2(0) <= Dd1(0);
            Dd2(1) <= Dd1(1);
            Dd2(2) <= Dd1(2);
            Dd2(3) <= Dd1(3);
            Dd2(4) <= Dd1(4);
            Dd2(5) <= Dd1(5);
            Dd2(6) <= Dd1(6);
            Dd2(7) <= '0';
        end if;
    end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			Dd3 <= "00000000";
		elsif(lrstn = '0') then
			Dd3 <= "00000000";
		elsif(FCLK'event and FCLK = '1')then
		   	if(d_up0 = '1') then
				Dd3 <= Dd2;
            else
				Dd3 <= Dd3;
			end if;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			Dd4 <= "00000000";
		elsif(lrstn = '0') then
			Dd4 <= "00000000";
		elsif(FCLK'event and FCLK = '1')then
			if (d_up1 = '1') then
				Dd4 <= Dd3;
			else
				Dd4 <= "00"&Dd4(7 downto 2);
			end if;
		end if;		
	end process;

	process (FCLK, grstn, lrstn)
	begin
		if (grstn = '0') then
			Qq_p <= '0';
		elsif (lrstn = '0') then
			Qq_p <= '0';
		elsif (FCLK 'event and FCLK = '1') then 
			Qq_p <= Dd4(1);
		end if;
	end process;

	process (FCLK, grstn, lrstn)
	begin
		if (grstn = '0') then
			Qq_n <= '0';
		elsif (lrstn = '0') then
			Qq_n <= '0';
		elsif (FCLK 'event and FCLK = '0') then
			Qq_n <= Dd4(0);
		end if;
	end process;

	Q <= Qq_n when FCLK = '1' else Qq_p;

end Behavioral;

--------------------OSER8-----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity OSER8 is
    GENERIC (
    	GSREN : string := "false";
    	LSREN : string := "true";
        HWL : string := "false";
        TXCLK_POL : bit := '0' --'0':Rising edge output; '1':Falling edge output
    );
    PORT (
       	D0 : in std_logic;
       	D1 : in std_logic;
       	D2 : in std_logic;
       	D3 : in std_logic;
       	D4 : in std_logic;
      	D5 : in std_logic;
       	D6 : in std_logic;
       	D7 : in std_logic;
       	TX0 : in std_logic;
    	TX1 : in std_logic;
	    TX2 : in std_logic;
	    TX3 : in std_logic;
	    PCLK : in std_logic;
	    RESET : in std_logic;
    	FCLK : in std_logic;
       	Q0 : OUT std_logic;
       	Q1 : OUT std_logic
    );
end OSER8;

architecture Behavioral of OSER8 is
    	SIGNAL Dd1,Dd2,Dd3 : std_logic_vector(7 downto 0);
    	SIGNAL Ttx1,Ttx2,Ttx3 : std_logic_vector(3 downto 0);
    	SIGNAL rstn_dsel,d_up0,d_up1 : std_logic;
    	SIGNAL dcnt0,dcnt1 : std_logic := '0';
    	SIGNAL d_en0,d_en1 : std_logic;
    	SIGNAL Qq_p,Qq_n,Q_data_p,Q_data_n : std_logic;
	    SIGNAL grstn,lrstn: std_logic;

begin
	grstn <= GSRO when (GSREN = "true") else '1';
	lrstn <= (not RESET) when (LSREN = "true") else '1';	 

	process(PCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			Dd1  <= "00000000";
			Ttx1 <= "0000";
		elsif(lrstn = '0') then
			Dd1  <= "00000000";
			Ttx1 <= "0000";
		elsif(PCLK 'event and PCLK = '1') then 
			Dd1  <= (D7, D6, D5, D4, D3, D2, D1, D0);
			Ttx1 <= (TX3, TX2, TX1, TX0);
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			rstn_dsel <= '0';
		elsif(lrstn = '0') then
			rstn_dsel <= '0';
		elsif(FCLK 'event and FCLK = '1') then
			rstn_dsel <= '1';
		end if;
	end process;

    process(FCLK, rstn_dsel)
	begin
		if(rstn_dsel = '0') then
			dcnt0 <= '0';
			dcnt1 <= '0';
		elsif(FCLK 'event and FCLK = '1') then
			dcnt0 <= not dcnt0;
			dcnt1 <= dcnt0 xor dcnt1;
		end if;
	end process;

    d_en0 <= dcnt0 and (not dcnt1);
    d_en1 <= (dcnt0 and (not dcnt1)) when (HWL = "true") else ((not dcnt0) and (not dcnt1));

    process(FCLK, rstn_dsel)
	begin
		if(rstn_dsel = '0') then
			d_up0 <= '0';
			d_up1 <= '0';
		elsif(FCLK 'event and FCLK = '1') then
            if(d_en0 = '1') then
			    d_up0 <= '1';
            else 
                d_up0 <= '0';
            end if;

            if(d_en1 = '1') then
			    d_up1 <= '1';
            else 
                d_up1 <= '0';
            end if;
		end if;
	end process;


	process(FCLK, grstn, lrstn)
	begin
		if (grstn = '0') then
			Dd2  <= "00000000";
			Ttx2 <= "0000";
		elsif(lrstn = '0') then
			Dd2  <= "00000000";
			Ttx2 <= "0000";
		elsif(FCLK'event and FCLK = '1') then
			if(d_up0 = '1') then
				Dd2  <= Dd1;
				Ttx2 <= Ttx1;
            else
                Dd2  <= Dd2;
				Ttx2 <= Ttx2;
			end if;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			Dd3  <= "00000000";
			Ttx3 <= "0000";
		elsif(lrstn = '0') then
			Dd3  <= "00000000";
			Ttx3 <= "0000";
		elsif(FCLK 'event and FCLK = '1') then
			if(d_up1 = '1') then
				Dd3  <= Dd2;
				Ttx3 <= Ttx2;
			else 
				Dd3  <= "00"&Dd3(7 downto 2);
				Ttx3 <= '0'&Ttx3(3 downto 1);
			end if;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			Qq_p <= '0';
			Q_data_p <= '0';
		elsif(lrstn = '0') then
			Qq_p <= '0';
			Q_data_p <= '0';
		elsif(FCLK 'event and FCLK = '1') then 
			Qq_p <= Dd3(1);
			Q_data_p <= Q_data_n;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			Qq_n <= '0';
			Q_data_n <= '0';
		elsif(lrstn = '0') then
			Qq_n <= '0';
			Q_data_n <= '0';
		elsif(FCLK 'event and FCLK = '0') then
			Qq_n <= Dd3(0);
            Q_data_n <= Ttx3(0);
		end if;
	end process;

	Q0 <= Qq_n when FCLK = '1' else Qq_p;
    Q1 <= Q_data_p when (TXCLK_POL = '0') else Q_data_n;

end Behavioral;

-----------------OSER8_MEM--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity OSER8_MEM is
	GENERIC(
		GSREN : string := "false";
		LSREN : string := "true";
		HWL : string := "false";
        TXCLK_POL : bit := '0';
        TCLK_SOURCE : string := "DQSW"
	);
	PORT (
		D0 : in std_logic;
		D1 : in std_logic;
		D2 : in std_logic;
		D3 : in std_logic;
		D4 : in std_logic;
		D5 : in std_logic;
		D6 : in std_logic;
		D7 : in std_logic;
		TX0 : in std_logic;
		TX1 : in std_logic;
		TX2 : in std_logic;
		TX3 : in std_logic;
		PCLK : in std_logic;
		RESET : in std_logic;
		FCLK : in std_logic;
		TCLK : in std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic
	);
end OSER8_MEM;

architecture Behavioral of OSER8_MEM is

	SIGNAL Dd1,Dd2,Dd3 : std_logic_vector(7 downto 0);
	SIGNAL Ttx1,Ttx2,Ttx3 : std_logic_vector(3 downto 0);
	SIGNAL rstn_dsel0,d_up0,rstn_dsel1,d_up1 : std_logic;
	SIGNAL dcnt0,dcnt1,hcnt0,hcnt1 : std_logic := '0';
	SIGNAL d_en0,d_en1 : std_logic;
	SIGNAL Qq_p,Qq_n,Q_data_p,Q_data_n : std_logic;
    signal tclk_sig : std_logic;
	SIGNAL grstn: std_logic;
	SIGNAL lrstn: std_logic;

begin
	grstn <= GSRO when (GSREN = "true") else '1';
	lrstn <= not RESET when (LSREN = "true") else '1';
    tclk_sig <= TCLK when (TCLK_SOURCE = "DQSW") else (not TCLK);    
	
	process(PCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			Dd1 <= "00000000";
			Ttx1 <= "0000";
		elsif(lrstn = '0') then
			Dd1 <= "00000000";
			Ttx1 <= "0000";
		elsif(PCLK 'event and PCLK = '1') then 
			Dd1 <= (D7,D6,D5,D4,D3,D2,D1,D0);
			Ttx1 <= (TX3,TX2,TX1,TX0);
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn='0') then
			rstn_dsel0 <= '0';
		elsif (lrstn='0') then
			rstn_dsel0 <= '0';
		elsif (FCLK 'event and FCLK = '1') then
			rstn_dsel0 <= '1';
		end if;
	end process;

    process(FCLK, rstn_dsel0)
	begin
		if(rstn_dsel0='0') then
			dcnt0 <= '0';
			dcnt1 <= '0';
		elsif (FCLK 'event and FCLK = '1') then
			dcnt0 <= not dcnt0;
            dcnt1 <= dcnt0 xor dcnt1;
		end if;
	end process;

    d_en0 <= dcnt0 and (not dcnt1);

    process(FCLK, rstn_dsel0)
	begin
		if(rstn_dsel0='0') then
			d_up0 <= '0';
		elsif (FCLK 'event and FCLK = '1') then
            if(d_en0 = '1') then
			    d_up0 <= '1';
            else
                d_up0 <= '0';
            end if;
		end if;
	end process;

    process(tclk_sig, grstn, lrstn)
	begin
		if(grstn='0') then
			rstn_dsel1 <= '0';
		elsif (lrstn='0') then
			rstn_dsel1 <= '0';
		elsif (tclk_sig 'event and tclk_sig = '1') then
			rstn_dsel1 <= '1';
		end if;
	end process;

    process(tclk_sig, rstn_dsel1)
	begin
		if(rstn_dsel1='0') then
			hcnt0 <= '0';
			hcnt1 <= '0';
		elsif (tclk_sig 'event and tclk_sig = '1') then
			hcnt0 <= not hcnt0;
            hcnt1 <= hcnt0 xor hcnt1;
		end if;
	end process;

    d_en1 <= (hcnt0 and (not hcnt1)) when (HWL = "true") else ((not hcnt0) and (not hcnt1));

    process(tclk_sig, rstn_dsel1)
	begin
		if(rstn_dsel1='0') then
			d_up1 <= '0';
		elsif (tclk_sig 'event and tclk_sig = '1') then
            if(d_en1 = '1') then
			    d_up1 <= '1';
            else
                d_up1 <= '0';
            end if;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			Dd2 <= "00000000";
			Ttx2 <= "0000";
		elsif(lrstn = '0') then
			Dd2 <= "00000000";
			Ttx2 <= "0000";
		elsif(FCLK 'event and FCLK = '1') then
			if(d_up0 = '1') then
				Dd2 <= Dd1;
				Ttx2 <= Ttx1;
            else
                Dd2 <= Dd2;
				Ttx2 <= Ttx2;
			end if;
		end if;
	end process;

	process(tclk_sig, grstn, lrstn)
	begin
		if(grstn = '0') then
			Dd3 <= "00000000";
			Ttx3 <= "0000";
		elsif(lrstn = '0') then
			Dd3 <= "00000000";
			Ttx3 <= "0000";
		elsif(tclk_sig 'event and tclk_sig = '1') then
			if(d_up1 = '1') then
				Dd3 <= Dd2;
				Ttx3 <= Ttx2;
			else
				Dd3 <= "00"&Dd3(7 downto 2);
				Ttx3 <= '0'&Ttx3(3 downto 1);
			end if;
		end if;
	end process;

	process(tclk_sig, grstn, lrstn)
	begin
		if(grstn = '0') then
			Qq_p <= '0';
			Q_data_p <= '0';
		elsif(lrstn = '0') then
			Qq_p <= '0';
			Q_data_p <= '0';
		elsif(tclk_sig 'event and tclk_sig = '1') then
			Qq_p <= Dd3(1);
			Q_data_p <= Q_data_n;
		end if;
	end process;

	process(tclk_sig, grstn, lrstn)
	begin
		if(grstn = '0') then
			Qq_n <= '0';
			Q_data_n <= '0';
		elsif(lrstn = '0') then
			Qq_n <= '0';
			Q_data_n <= '0';
		elsif(tclk_sig 'event and tclk_sig = '0') then
			Qq_n <= Dd3(0);
            Q_data_n <= Ttx3(0);
		end if;
	end process;

	Q0 <= Qq_n when tclk_sig = '1' else Qq_p;
    Q1 <= Q_data_p when (TXCLK_POL = '0') else Q_data_n;
		
end Behavioral;


--------------------OSER10-----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity OSER10 is
	GENERIC (
		GSREN : string := "false";
		LSREN : string := "true"
	);
	PORT (
		D0 : in std_logic;
		D1 : in std_logic;
		D2 : in std_logic;
		D3 : in std_logic;
		D4 : in std_logic;
		D5 : in std_logic;
		D6 : in std_logic;
		D7 : in std_logic;
		D8 : in std_logic;
		D9 : in std_logic;
		PCLK : in std_logic;
		RESET : in std_logic;
		FCLK : in std_logic;
		Q : OUT std_logic
	);
end OSER10;

architecture Behavioral of OSER10 is
	SIGNAL Dd1,Dd2,Dd3 : std_logic_vector(9 downto 0);
	SIGNAL rstn_dsel,d_up0,d_up1 : std_logic;
	SIGNAL dcnt0,dcnt1,dcnt2 : std_logic := '0';
	SIGNAL d_en,dcnt_reset : std_logic;
	SIGNAL Qq_p,Qq_n : std_logic;
	SIGNAL grstn: std_logic;
	SIGNAL lrstn: std_logic;
begin
	grstn <= GSRO when (GSREN = "true") else '1';
	lrstn <= (not RESET) when (LSREN = "true") else '1';	 
	
	process(PCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			Dd1 <= "0000000000";
		elsif(lrstn='0') then
			Dd1 <= "0000000000";
		elsif(PCLK 'event and PCLK = '1') then
			Dd1 <= (D9,D8,D7,D6,D5,D4,D3,D2,D1,D0);
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn='0') then
			rstn_dsel <= '0';
		elsif(lrstn='0') then
			rstn_dsel <= '0';
		elsif(FCLK 'event and FCLK = '1') then
			rstn_dsel <= '1';
		end if;
	end process;

    process(FCLK, rstn_dsel)
	begin
		if(rstn_dsel='0') then
			dcnt0 <= '0';
			dcnt1 <= '0';
			dcnt2 <= '0';
		elsif(FCLK 'event and FCLK = '1') then
			dcnt0 <= not(dcnt0 or dcnt_reset);
            dcnt1 <= (dcnt0 xor dcnt1) and (not dcnt_reset);
            dcnt2 <= (dcnt2 xor (dcnt0 and dcnt1)) and (not dcnt_reset);
		end if;
	end process;

    dcnt_reset <= (not dcnt0) and (not dcnt1) and dcnt2;
    d_en <= (not dcnt0) and dcnt1;

    process(FCLK, rstn_dsel)
	begin
		if(rstn_dsel='0') then
			d_up0 <= '0';
			d_up1 <= '0';
		elsif(FCLK 'event and FCLK = '1') then
            if(d_en = '1') then
                d_up0 <= '1';
                d_up1 <= '1';
            else
                d_up0 <= '0';
                d_up1 <= '0';
            end if;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn='0') then
			Dd2 <= "0000000000";
		elsif(lrstn='0') then
			Dd2 <= "0000000000";
		elsif(FCLK 'event and FCLK = '1') then
			if(d_up0 = '1') then
				Dd2 <= Dd1;
            else 
                Dd2 <= Dd2;
			end if;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn='0') then
			Dd3 <= "0000000000";
		elsif(lrstn='0') then
			Dd3 <= "0000000000";
		elsif(FCLK 'event and FCLK = '1') then
			if(d_up1 = '1') then
				Dd3 <= Dd2;
			else
				Dd3 <= "00"&Dd3(9 downto 2);
			end if;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn='0') then
			Qq_p <= '0';
		elsif(lrstn='0') then
			Qq_p <= '0';
		elsif(FCLK 'event and FCLK = '1') then
			Qq_p <= Dd3(1);
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn='0') then
			Qq_n <= '0';
		elsif(lrstn='0') then
			Qq_n <= '0';	
		elsif(FCLK 'event and FCLK = '0') then
			Qq_n <= Dd3(0);
	    end if;
	end process;
	
	Q <= Qq_n when FCLK = '1' else Qq_p;

end Behavioral;


--------------------IODELAY-----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IODELAY is
	GENERIC (  C_STATIC_DLY : integer := 0); -- 0~127
	PORT (
		DI : IN std_logic;
		SDTAP : IN std_logic;
		SETN : IN std_logic;
		VALUE : IN std_logic;
		DO : OUT std_logic;
		DF : OUT std_logic
	);
end IODELAY;

architecture Behavioral of IODELAY is
	SIGNAL delay_data : integer := 0;
	SIGNAL delay_time : time := 0.000 ns;
	SIGNAL delay_in : std_logic_vector(127 downto 0);
    signal pre_value : std_logic;
    signal i : integer;
    signal delay_out : std_logic := '0';

begin
    
    --delay_in(0) <= DI after 0.025 ns; 
    --gen_delay : for i in 1 to 127 generate
    --    delay_in(i)<= delay_in(i-1) after 0.025 ns;
    --end generate gen_delay; 
    --DO <= DI when(delay_data = 0) else delay_in(delay_data-1);
    
    delay_time <=  (0.025 ns * delay_data);
    delay_out <= DI after delay_time;
    DO <= DI when(delay_data = 0) else delay_out;

	process (SDTAP, VALUE)
	begin
		if (SDTAP = '0') then
		    delay_data <= C_STATIC_DLY;
		else
            if(pre_value = '1' and VALUE = '0') then
                if (SDTAP = '1') then
			        if ((SETN = '1') and (delay_data /= 0)) then
				        delay_data <= delay_data - 1;
			        elsif ((SETN = '0') and (delay_data /= 127)) then
				        delay_data <= delay_data + 1;
			        end if;
		        end if;
            end if;
		end if; 
	end process;

    process (VALUE) 
    begin
        pre_value <= VALUE;
    end process;
	
	process (delay_data)
	begin
		if (((SETN = '1')  and (delay_data = 0)) or ((SETN = '0') and (delay_data = 127)) )then
			DF <= '1';
		else
			DF <= '0';
		end if;	
	end process;
	
end Behavioral;


--------------------IEM----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity IEM is
	GENERIC(
		WINSIZE : string := "SMALL";
		GSREN : string := "false";
		LSREN : string := "true"
	);
	PORT (
		D : in std_logic;
		CLK : in std_logic;
		RESET : in std_logic;
		MCLK: in std_logic;
		LAG : out std_logic;
		LEAD : out std_logic
	);
end IEM;

architecture Behavioral of IEM is

	SIGNAL Dd1 : std_logic := '0';
	SIGNAL Dd2 : std_logic := '0';
	SIGNAL Dd3 : std_logic := '0';
	SIGNAL Dd4 : std_logic := '0';
	SIGNAL Dd5 : std_logic := '0';
	SIGNAL Dd6 : std_logic := '0';
	SIGNAL Dd7 : std_logic := '0';
	SIGNAL Dd8 : std_logic := '0';
	SIGNAL DD_lead : std_logic := '0';
	SIGNAL DD_lag : std_logic := '0';
	SIGNAL DD_lead0 : std_logic := '0';
	SIGNAL DD_mid0 : std_logic := '0';
	SIGNAL DD_lag0 : std_logic := '0';
	SIGNAL DD_lead1 : std_logic := '0';
	SIGNAL DD_mid1 : std_logic := '0';
	SIGNAL DD_lag1 : std_logic := '0';
	SIGNAL lead_reg : std_logic := '0';
	SIGNAL lag_reg : std_logic := '0';
	SIGNAL grstn: std_logic := '0';
	SIGNAL lrstn: std_logic := '0';
	SIGNAL lead0 : std_logic := '0';
	SIGNAL lead1 : std_logic := '0';
	SIGNAL lag0 : std_logic := '0';
	SIGNAL lag1 : std_logic := '0';
	SIGNAL lead_sel : std_logic := '0';
	SIGNAL lag_sel : std_logic := '0';
	SIGNAL DD_mid : std_logic := '0';

begin
	grstn <= GSRO when GSREN = "true" else '1';
	lrstn <= not RESET when LSREN = "true" else '1';	
	
	process (D)
	begin
		Dd1 <= D after 0.05 ns ;
		Dd2 <= Dd1 after 0.05 ns;
		Dd3 <= Dd2 after 0.05 ns;
		Dd4 <= Dd3 after 0.05 ns;
		Dd5 <= Dd4 after 0.05 ns;
		Dd6 <= Dd5 after 0.05 ns;
		Dd7 <= Dd6 after 0.05 ns;
		Dd8 <= Dd7 after 0.05 ns;
	end process;

	process (D)
	begin
		if(WINSIZE = "SMALL") then
			DD_lead <= Dd3;
			DD_lag <= Dd5;
		elsif(WINSIZE = "MIDSMALL") then
			DD_lead <= Dd2;
			DD_lag <= Dd6;
		elsif(WINSIZE = "MIDLARGE") then
			DD_lead <= Dd1;
			DD_lag <= Dd7;
		elsif(WINSIZE = "LARGE") then
			DD_lead <= D;
			DD_lag <= Dd8;
		else
			report "Warning! Invalid IEM window size setting";
		end if;
	end process;
       
	DD_mid <= Dd4;

	process (CLK,grstn,lrstn)
	begin
		if (grstn='0') then
			DD_lead0 <= '0';
			DD_mid0   <= '0';
			DD_lag0   <= '0';
		elsif (lrstn='0') then
			DD_lead0 <= '0';
			DD_mid0   <= '0';
			DD_lag0   <= '0';
		elsif(CLK'event and CLK='1')then 
			DD_lead0 <= DD_lead;
			DD_mid0   <= DD_mid;
			DD_lag0   <= DD_lag;
		end if;
	end process;

	process (CLK,grstn,lrstn)
	begin
		if (grstn='0') then
			DD_lead1 <= '0';
			DD_mid1   <= '0';
			DD_lag1   <= '0';
		elsif (lrstn='0') then
			DD_lead1 <= '0';
			DD_mid1   <= '0';
			DD_lag1   <= '0';
		elsif (CLK'event and CLK='0') then
			DD_lead1 <= DD_lead; 
			DD_mid1   <= DD_mid; 
			DD_lag1   <= DD_lag; 
		end if;
	end process;

	lead0 <= DD_lead0 XOR DD_mid0; 
	lead1 <= DD_lead1 XOR DD_mid1; 
	lag0   <= DD_mid0   XOR DD_lag0; 
	lag1   <= DD_mid1   XOR DD_lag1;
	lead_sel <= lead0 or lead1; 
	lag_sel <= lag0 or lag1;

	process (lead_sel, MCLK)
	begin
		if (lead_sel = '1') then 
			lead_reg <= '1'; 
		elsif (MCLK'event and MCLK='1') then 
			lead_reg <= '0'; 
		end if;
	end process;

	process (lag_sel,MCLK)
	begin
		if (lag_sel = '1') then 
			lag_reg <= '1'; 
		elsif (MCLK'event and MCLK='1') then 
			lag_reg <= '0'; 
		end if;
	end process;

	LEAD <= lead_reg; 
	LAG <= lag_reg; 
   
end Behavioral;


-----------------------ROM----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ROM is
    GENERIC ( 
	    BIT_WIDTH : integer :=1; -- 1, 2, 4, 8, 16, 32	
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
    	BLK_SEL : bit_vector := "000"; 
        RESET_MODE : string := "SYNC"; --SYNC, ASYNC
	    INIT_RAM_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"        
    );
    PORT (
	    DO : out std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	    CLK, CE,OCE,RESET,WRE : in std_logic;
    	BLKSEL : in std_logic_vector(2 downto 0);
	    AD : in std_logic_vector(13 downto 0)
    );
end ROM;

architecture Behavioral of ROM is
	signal bp_reg,pl_reg,bp_reg_async,pl_reg_async,bp_reg_sync,pl_reg_sync : std_logic_vector(31 downto 0):= conv_std_logic_vector(0,32);
	signal ram_MEM : std_logic_vector(16383 downto 0):=TO_StdLogicVector(INIT_RAM_3F & INIT_RAM_3E & INIT_RAM_3D & INIT_RAM_3C &INIT_RAM_3B & INIT_RAM_3A & INIT_RAM_39 & INIT_RAM_38 &INIT_RAM_37 & INIT_RAM_36 & INIT_RAM_35 & INIT_RAM_34 &INIT_RAM_33 & INIT_RAM_32 & INIT_RAM_31 & INIT_RAM_30 &INIT_RAM_2F & INIT_RAM_2E & INIT_RAM_2D & INIT_RAM_2C &INIT_RAM_2B & INIT_RAM_2A & INIT_RAM_29 & INIT_RAM_28 &INIT_RAM_27 & INIT_RAM_26 & INIT_RAM_25 & INIT_RAM_24 &INIT_RAM_23 & INIT_RAM_22 & INIT_RAM_21 & INIT_RAM_20 &INIT_RAM_1F & INIT_RAM_1E & INIT_RAM_1D & INIT_RAM_1C &INIT_RAM_1B & INIT_RAM_1A & INIT_RAM_19 & INIT_RAM_18 &INIT_RAM_17 & INIT_RAM_16 & INIT_RAM_15 & INIT_RAM_14 &INIT_RAM_13 & INIT_RAM_12 & INIT_RAM_11 & INIT_RAM_10 &INIT_RAM_0F & INIT_RAM_0E & INIT_RAM_0D & INIT_RAM_0C & INIT_RAM_0B & INIT_RAM_0A & INIT_RAM_09 & INIT_RAM_08 &INIT_RAM_07 & INIT_RAM_06 & INIT_RAM_05 & INIT_RAM_04 &INIT_RAM_03 & INIT_RAM_02 & INIT_RAM_01 & INIT_RAM_00);
	signal data_width_t,addr_width : integer:=0;
	signal bs_en : std_logic;
	signal pce : std_logic;
	signal addr : std_logic_vector(13 downto 0):=conv_std_logic_vector(0,14);
begin

	data_width_t <= BIT_WIDTH;
	for_addr:for k in 0 to 13 generate
	begin
		addr(k)<= '0' when (k<(14-addr_width)) else AD(k);
	end generate for_addr;
	process (data_width_t)
	begin
		case (data_width_t) is
			when 1=> addr_width<=14;
			when 2=> addr_width<=13;
			when 4=> addr_width<=12;
			when 8=> addr_width<=11;
			when 16=> addr_width<=10;
			when 32=> addr_width<=9;
			when others=>addr_width<=0;
		end case;
	end process;

	DO <= bp_reg when(READ_MODE = '0') else pl_reg;
	
	pce <= CE and bs_en;
	process(BLKSEL)
	begin
		if(BLKSEL = TO_STDLOGICVECTOR(BLK_SEL)) then
			bs_en <= '1';
		else 
			bs_en <= '0';
		end if;
	end process;

    process (bp_reg_async,bp_reg_sync,pl_reg_async,pl_reg_sync) 
    begin
        if(RESET_MODE = "ASYNC") then
            bp_reg <= bp_reg_async;
            pl_reg <= pl_reg_async;
        else 
            bp_reg <= bp_reg_sync;
            pl_reg <= pl_reg_sync;
        end if;
    end process;

	process (CLK,RESET)
	variable i : integer :=0;
	begin
		if RESET='1' then
			bp_reg_async <= (others=>'0');
		elsif CLK'event and CLK='1' then
			if((pce='1')and(WRE='0')) then
				i := 0;
				while(i < data_width_t) loop
					bp_reg_async(i) <= ram_MEM((conv_integer(addr)+i));
					i := i+1;
				end loop;
		    end if;
		end if;
	end process;

    process (CLK)
	variable i : integer :=0;
	begin
		if CLK'event and CLK='1' then
		    if RESET='1' then
			    bp_reg_sync <= (others=>'0');
		    elsif((pce='1')and(WRE='0')) then
				i := 0;
				while(i < data_width_t) loop
					bp_reg_sync(i) <= ram_MEM((conv_integer(addr)+i));
					i := i+1;
				end loop;
		    end if;
		end if;
	end process;

    process (CLK,RESET)
	begin
		if RESET='1' then
			pl_reg_async <= (others=>'0');
		elsif CLK'event and CLK='1' then
			if OCE='1' then
				pl_reg_async <= bp_reg;
			end if;
		end if;
	end process;

    process (CLK)
	begin
		if CLK'event and CLK='1' then
		    if RESET='1' then
			    pl_reg_sync <= (others=>'0');
		    elsif OCE='1' then
				pl_reg_sync <= bp_reg;
			end if;
		end if;
	end process;

end Behavioral;

------------------------------ROMX9 ---------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ROMX9 is
    GENERIC ( 
    	BIT_WIDTH : integer :=9; -- 9, 18, 36
   	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
    	BLK_SEL : bit_vector := "000"; 
        RESET_MODE : string := "SYNC"; --SYNC, ASYNC
        INIT_RAM_00 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000"     

    );
    PORT (
	    DO : out std_logic_vector(35 downto 0):=conv_std_logic_vector(0,36);
	    CLK, CE,OCE,RESET,WRE : in std_logic;
    	BLKSEL : in std_logic_vector(2 downto 0);
	    AD : in std_logic_vector(13 downto 0)
    );
end ROMX9;

architecture Behavioral of ROMX9 is
	signal bp_reg,pl_reg,bp_reg_async,pl_reg_async,bp_reg_sync,pl_reg_sync : std_logic_vector(35 downto 0) := conv_std_logic_vector(0,36);
	signal ram_MEM : std_logic_vector(18431 downto 0):=TO_StdLogicVector(INIT_RAM_3F & INIT_RAM_3E & INIT_RAM_3D & INIT_RAM_3C &INIT_RAM_3B & INIT_RAM_3A & INIT_RAM_39 & INIT_RAM_38 &INIT_RAM_37 & INIT_RAM_36 & INIT_RAM_35 & INIT_RAM_34 &INIT_RAM_33 & INIT_RAM_32 & INIT_RAM_31 & INIT_RAM_30 &INIT_RAM_2F & INIT_RAM_2E & INIT_RAM_2D & INIT_RAM_2C &INIT_RAM_2B & INIT_RAM_2A & INIT_RAM_29 & INIT_RAM_28 &INIT_RAM_27 & INIT_RAM_26 & INIT_RAM_25 & INIT_RAM_24 &INIT_RAM_23 & INIT_RAM_22 & INIT_RAM_21 & INIT_RAM_20 &INIT_RAM_1F & INIT_RAM_1E & INIT_RAM_1D & INIT_RAM_1C &INIT_RAM_1B & INIT_RAM_1A & INIT_RAM_19 & INIT_RAM_18 &INIT_RAM_17 & INIT_RAM_16 & INIT_RAM_15 & INIT_RAM_14 &INIT_RAM_13 & INIT_RAM_12 & INIT_RAM_11 & INIT_RAM_10 &INIT_RAM_0F & INIT_RAM_0E & INIT_RAM_0D & INIT_RAM_0C & INIT_RAM_0B & INIT_RAM_0A & INIT_RAM_09 & INIT_RAM_08 &INIT_RAM_07 & INIT_RAM_06 & INIT_RAM_05 & INIT_RAM_04 &INIT_RAM_03 & INIT_RAM_02 & INIT_RAM_01 & INIT_RAM_00);	
	signal data_width_t,addr_width : integer:=0;
	signal bs_en : std_logic;
	signal pce : std_logic;
	signal addr : std_logic_vector(14 downto 0):=conv_std_logic_vector(0,15);
begin

	data_width_t <= BIT_WIDTH;
	addr <= conv_std_logic_vector(conv_integer(AD(13 downto (14-addr_width)))*data_width_t,15);

	process (data_width_t)
	begin
		case (data_width_t) is
			when 9=> addr_width<=11;
			when 18=> addr_width<=10;
			when 36=> addr_width<=9;
			when others=>addr_width<=0;
		end case;
	end process;

	DO <= bp_reg when(READ_MODE = '0') else pl_reg;
	
	pce <= CE and bs_en;
	process(BLKSEL)
	begin
		if(BLKSEL = TO_STDLOGICVECTOR(BLK_SEL)) then
			bs_en <= '1';
		else 
			bs_en <= '0';
		end if;
	end process;

    process (bp_reg_async,bp_reg_sync,pl_reg_async,pl_reg_sync) 
    begin
        if(RESET_MODE = "ASYNC") then
            bp_reg <= bp_reg_async;
            pl_reg <= pl_reg_async;
        else 
            bp_reg <= bp_reg_sync;
            pl_reg <= pl_reg_sync;
        end if;
    end process;

	process (CLK,RESET)
	variable i : integer :=0;
	begin
		if RESET='1' then
			bp_reg_async <= (others=>'0');
		elsif CLK'event and CLK='1' then
			if((pce='1')and(WRE='0'))then
				i := 0;
				while(i < data_width_t) loop
					bp_reg_async(i) <= ram_MEM((conv_integer(addr)+i));
					i := i+1;
				end loop;
		    end if;
		end if;
	end process;

    process (CLK)
	variable i : integer :=0;
	begin
		if CLK'event and CLK='1' then
		    if RESET='1' then
			    bp_reg_sync <= (others=>'0');
			elsif((pce='1')and(WRE='0'))then
				i := 0;
				while(i < data_width_t) loop
					bp_reg_sync(i) <= ram_MEM((conv_integer(addr)+i));
					i := i+1;
				end loop;
		    end if;
		end if;
	end process;

    process (CLK,RESET)
	begin
		if RESET='1' then
			pl_reg_async <= (others=>'0');
		elsif CLK'event and CLK='1' then
			if(OCE = '1') then
				pl_reg_async <= bp_reg;
			end if;
		end if;
	end process;

    process (CLK)
	begin
		if CLK'event and CLK='1' then
		    if RESET='1' then
			    pl_reg_sync <= (others=>'0');
			elsif(OCE = '1') then
				pl_reg_sync <= bp_reg;
			end if;			
		end if;
	end process;

end Behavioral;

-------------------SP---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SP is
    GENERIC (
	    BIT_WIDTH : integer :=32; -- 1, 2, 4, 8, 16, 32
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    WRITE_MODE : bit_vector := "01"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
	    BLK_SEL : bit_vector := "000";
        RESET_MODE : string := "SYNC"; --SYNC, ASYNC
	    INIT_RAM_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"    
    );
    PORT (
	    DO : out std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	    CLK, CE,OCE,RESET,WRE : in std_logic;
	    AD : in std_logic_vector(13 downto 0);
        BLKSEL : in std_logic_vector(2 downto 0);
	    DI : in std_logic_vector(31 downto 0)
    );
end SP;

architecture Behavioral of SP is
	signal bp_reg,bp_reg_async,bp_reg_sync : std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	signal pl_reg,pl_reg_async,pl_reg_sync : std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	signal ram_MEM : std_logic_vector(16383 downto 0) :=TO_StdLogicVector(INIT_RAM_3F & INIT_RAM_3E & INIT_RAM_3D & INIT_RAM_3C &INIT_RAM_3B & INIT_RAM_3A & INIT_RAM_39 & INIT_RAM_38 &INIT_RAM_37 & INIT_RAM_36 & INIT_RAM_35 & INIT_RAM_34 &INIT_RAM_33 & INIT_RAM_32 & INIT_RAM_31 & INIT_RAM_30 &INIT_RAM_2F & INIT_RAM_2E & INIT_RAM_2D & INIT_RAM_2C &INIT_RAM_2B & INIT_RAM_2A & INIT_RAM_29 & INIT_RAM_28 &INIT_RAM_27 & INIT_RAM_26 & INIT_RAM_25 & INIT_RAM_24 &INIT_RAM_23 & INIT_RAM_22 & INIT_RAM_21 & INIT_RAM_20 &INIT_RAM_1F & INIT_RAM_1E & INIT_RAM_1D & INIT_RAM_1C &INIT_RAM_1B & INIT_RAM_1A & INIT_RAM_19 & INIT_RAM_18 &INIT_RAM_17 & INIT_RAM_16 & INIT_RAM_15 & INIT_RAM_14 &INIT_RAM_13 & INIT_RAM_12 & INIT_RAM_11 & INIT_RAM_10 &INIT_RAM_0F & INIT_RAM_0E & INIT_RAM_0D & INIT_RAM_0C & INIT_RAM_0B & INIT_RAM_0A & INIT_RAM_09 & INIT_RAM_08 &INIT_RAM_07 & INIT_RAM_06 & INIT_RAM_05 & INIT_RAM_04 &INIT_RAM_03 & INIT_RAM_02 & INIT_RAM_01 & INIT_RAM_00);
	signal data_width_t: integer := BIT_WIDTH;
	signal addr_width : integer;
	signal mc : std_logic := '0';
	signal pce : std_logic;
	signal bs_en : std_logic; 
	signal addr : std_logic_vector(13 downto 0):="00000000000000";
begin
	
	for_addr:for k in 0 to 13 generate
	begin
		addr(k)<= '0' when (k<(14-addr_width)) else AD(k);
	end generate for_addr;
	
	process (data_width_t)
	begin
		case (data_width_t) is
			when 1=> addr_width<=14;
			when 2=> addr_width<=13;
			when 4=> addr_width<=12;
			when 8=> addr_width<=11;
			when 16=> addr_width<=10;
			when 32=> addr_width<=9;
			when others=>addr_width<=0;
		end case;
	end process;

	DO <= bp_reg when (READ_MODE = '0') else pl_reg;

	pce <= CE and bs_en;
	process(BLKSEL)
	begin
		if(BLKSEL = TO_STDLOGICVECTOR(BLK_SEL)) then
			bs_en <= '1';
		else 
			bs_en <= '0';
		end if;

	end process;

    process (bp_reg_async,bp_reg_sync,pl_reg_async,pl_reg_sync) 
    begin
        if(RESET_MODE = "ASYNC") then
            bp_reg <= bp_reg_async;
            pl_reg <= pl_reg_async;
        else 
            bp_reg <= bp_reg_sync;
            pl_reg <= pl_reg_sync;
        end if;
    end process;

	process (CLK)
	variable i : integer :=0;
	begin
		if (CLK'event and CLK='1') then
		    if (pce='1') then
			    if (WRE = '1') then
				    if((BIT_WIDTH=1) or (BIT_WIDTH=2) or (BIT_WIDTH=4) or (BIT_WIDTH=8)) then
					    i := 0;
					    while(i < BIT_WIDTH) loop
						    ram_MEM((conv_integer(addr)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    elsif(BIT_WIDTH=16) then
				        if (AD(0)='1') then
					        i := 0;
						    while (i < 8) loop
							    ram_MEM((conv_integer(addr)+i))<= DI(i);
							    i := i+1;
						    end loop;
					    end if;
					    if(AD(1)='1') then
						    i := 8;
						    while ((i >= 8) and (i<16)) loop
							    ram_MEM((conv_integer(addr)+i))<= DI(i);
							    i := i+1;
						    end loop;
					    end if;
				    elsif(BIT_WIDTH=32) then
					    if (AD(0)='1') then
						    i := 0;
						    while (i < 8) loop
							    ram_MEM((conv_integer(addr)+i))<= DI(i);
							    i := i+1;
						    end loop;
					    end if;
					    if(AD(1)='1') then
						    i := 8;
						    while ((i >= 8) and (i<16)) loop
							    ram_MEM((conv_integer(addr)+i))<= DI(i);
							    i := i+1;
						    end loop;
					    end if;
					    if(AD(2)='1') then
						    i := 16;
						    while ((i >= 16) and (i<24)) loop
							    ram_MEM((conv_integer(addr)+i))<= DI(i);
							    i := i+1;
						    end loop;
				        end if;
					    if(AD(3)='1') then
						    i := 24;
						    while ((i >= 24) and (i<32)) loop
							    ram_MEM((conv_integer(addr)+i))<= DI(i);
							    i := i+1;
						    end loop;
					    end if;
				    end if;
				    mc <= (not mc);
			    end if;
            end if;
	    end if;
	end process;

    process (CLK,RESET)
	variable i : integer :=0;
	begin
		if (RESET='1') then
			bp_reg_async <=(others=>'0');
		elsif (CLK'event and CLK='1') then
		    if (pce='1') then
			    if (WRE = '1') then
				    if (WRITE_MODE = "01") then
                        i := 0;
					    while(i < data_width_t) loop
						    bp_reg_async(i) <= ram_MEM((conv_integer(addr)+i));
						    i := i+1;
					    end loop;

                        if(BIT_WIDTH <= 8) then
                            bp_reg_async((BIT_WIDTH-1) downto 0) <= DI((BIT_WIDTH-1) downto 0);  
                        elsif(BIT_WIDTH=16) then
                            if(AD(0) = '1') then
							    bp_reg_async(7 downto 0) <= DI(7 downto 0);
                            end if;
                            if(AD(1) = '1') then
                                bp_reg_async(15 downto 8) <= DI(15 downto 8);
                            end if;                        
                        elsif(BIT_WIDTH=32) then
                            if(AD(0) = '1') then
                                bp_reg_async(7 downto 0)  <= DI(7 downto 0);
                            end if;
                            if(AD(1) = '1') then
                                bp_reg_async(15 downto 8) <= DI(15 downto 8);
                            end if;
                            if(AD(2) = '1') then
                                bp_reg_async(23 downto 16) <= DI(23 downto 16);	
                            end if;
                            if(AD(3) = '1') then
                                bp_reg_async(31 downto 24) <= DI(31 downto 24);
                            end if;
                        end if;
				    end if;

				    if (WRITE_MODE = "10") then
					    i := 0;
					    while(i < data_width_t) loop
						    bp_reg_async(i) <= ram_MEM((conv_integer(addr)+i));
						    i := i+1;
					    end loop;
				    end if;

				elsif(WRE = '0') then
					i := 0;
					while(i < BIT_WIDTH) loop
						bp_reg_async(i) <= ram_MEM((conv_integer(addr)+i));
						i := i+1;
					end loop;
			    end if;
		    end if;
	    end if;
	end process;

    process (CLK)
	variable i : integer :=0;
	begin
		if (CLK'event and CLK='1') then
		    if (RESET='1') then
			    bp_reg_sync <=(others=>'0');
		    elsif (pce='1') then
			    if (WRE = '1') then
				    if (WRITE_MODE = "01") then
                        i := 0;
					    while(i < data_width_t) loop
						    bp_reg_sync(i) <= ram_MEM((conv_integer(addr)+i));
						    i := i+1;
					    end loop;

                        if(BIT_WIDTH <= 8) then
                            bp_reg_sync((BIT_WIDTH-1) downto 0) <= DI((BIT_WIDTH-1) downto 0);
                        elsif(BIT_WIDTH=16) then
                            if(AD(0) = '1') then
							    bp_reg_sync(7 downto 0) <= DI(7 downto 0);
                            end if;
                            if(AD(1) = '1') then
                                bp_reg_sync(15 downto 8) <= DI(15 downto 8);
                            end if;
                        elsif(BIT_WIDTH=32) then
                            if(AD(0) = '1') then
                                bp_reg_sync(7 downto 0)  <= DI(7 downto 0);
                            end if;
                            if(AD(1) = '1') then
                                bp_reg_sync(15 downto 8) <= DI(15 downto 8);
                            end if;
                            if(AD(2) = '1') then
                                bp_reg_sync(23 downto 16) <= DI(23 downto 16);
                            end if;
                            if(AD(3) = '1') then
                                bp_reg_sync(31 downto 24) <= DI(31 downto 24);
                            end if;
                        end if;
				    end if;

				    if (WRITE_MODE = "10") then
					    i := 0;
					    while(i < data_width_t) loop
						    bp_reg_sync(i) <= ram_MEM((conv_integer(addr)+i));
						    i := i+1;
					    end loop;
				    end if;

				elsif(WRE = '0') then
					i := 0;
					while(i < BIT_WIDTH) loop
						bp_reg_sync(i) <= ram_MEM((conv_integer(addr)+i));
						i := i+1;
					end loop;
			    end if;
		    end if;
	    end if;
	end process;

    process (CLK,RESET)
	begin
		if (RESET='1') then
			pl_reg_async <=(others=>'0');
		elsif (CLK'event and CLK='1') then
		    if (OCE = '1') then
			    pl_reg_async <= bp_reg;
		    end if;
	    end if;
	end process;

    process (CLK)
	begin
		if (CLK'event and CLK='1') then
		    if (RESET='1') then
			    pl_reg_sync <=(others=>'0');
		    elsif (OCE = '1') then
			    pl_reg_sync <= bp_reg;
		    end if;
	    end if;
	end process;
    
end Behavioral;

----------------------------SPX9---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SPX9 is
    GENERIC ( 
	    BIT_WIDTH : integer :=9;
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    WRITE_MODE : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
	    BLK_SEL : bit_vector := "000"; 
        RESET_MODE : string := "SYNC";--SYNC, ASYNC
	    INIT_RAM_00 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000"    
    
    );
    PORT (
	    DO : out std_logic_vector(35 downto 0):=conv_std_logic_vector(0,36);
	    CLK, CE,OCE,RESET,WRE : in std_logic;
	    AD : in std_logic_vector(13 downto 0);
	    DI : in std_logic_vector(35 downto 0);
        BLKSEL : std_logic_vector(2 downto 0) 
	 
    );
end SPX9;

architecture Behavioral of SPX9 is
	signal bp_reg,pl_reg,bp_reg_async,pl_reg_async,bp_reg_sync,pl_reg_sync : std_logic_vector(35 downto 0) := conv_std_logic_vector(0,36);
	signal ram_MEM : std_logic_vector(18431 downto 0):=TO_StdLogicVector(INIT_RAM_3F & INIT_RAM_3E & INIT_RAM_3D & INIT_RAM_3C &INIT_RAM_3B & INIT_RAM_3A & INIT_RAM_39 & INIT_RAM_38 &INIT_RAM_37 & INIT_RAM_36 & INIT_RAM_35 & INIT_RAM_34 &INIT_RAM_33 & INIT_RAM_32 & INIT_RAM_31 & INIT_RAM_30 &INIT_RAM_2F & INIT_RAM_2E & INIT_RAM_2D & INIT_RAM_2C &INIT_RAM_2B & INIT_RAM_2A & INIT_RAM_29 & INIT_RAM_28 &INIT_RAM_27 & INIT_RAM_26 & INIT_RAM_25 & INIT_RAM_24 &INIT_RAM_23 & INIT_RAM_22 & INIT_RAM_21 & INIT_RAM_20 &INIT_RAM_1F & INIT_RAM_1E & INIT_RAM_1D & INIT_RAM_1C &INIT_RAM_1B & INIT_RAM_1A & INIT_RAM_19 & INIT_RAM_18 &INIT_RAM_17 & INIT_RAM_16 & INIT_RAM_15 & INIT_RAM_14 &INIT_RAM_13 & INIT_RAM_12 & INIT_RAM_11 & INIT_RAM_10 &INIT_RAM_0F & INIT_RAM_0E & INIT_RAM_0D & INIT_RAM_0C & INIT_RAM_0B & INIT_RAM_0A & INIT_RAM_09 & INIT_RAM_08 &INIT_RAM_07 & INIT_RAM_06 & INIT_RAM_05 & INIT_RAM_04 &INIT_RAM_03 & INIT_RAM_02 & INIT_RAM_01 & INIT_RAM_00);
	signal data_width_t,addr_width : integer:=0;
	signal addr : std_logic_vector(14 downto 0);
	signal bs_en : std_logic;
	signal pce : std_logic;
	signal mc : std_logic := '0';
begin
	data_width_t <= BIT_WIDTH;
	addr <= conv_std_logic_vector(conv_integer(AD(13 downto (14-addr_width)))*data_width_t,15);

   process (data_width_t)
	begin
		case (data_width_t) is
			when 9=> addr_width<=11;
			when 18=> addr_width<=10;
			when 36=> addr_width<=9;
			when others=>addr_width<=0;
		end case;
	end process;
	
	DO <= bp_reg when (READ_MODE = '0') else pl_reg;
	
	pce <= CE and bs_en;
	process(BLKSEL)
	begin
		if(BLKSEL = TO_STDLOGICVECTOR(BLK_SEL)) then
			bs_en <= '1';
		else 
			bs_en <= '0';
		end if;

	end process;

    process (bp_reg_async,bp_reg_sync,pl_reg_async,pl_reg_sync) 
    begin
        if(RESET_MODE = "ASYNC") then
            bp_reg <= bp_reg_async;
            pl_reg <= pl_reg_async;
        else 
            bp_reg <= bp_reg_sync;
            pl_reg <= pl_reg_sync;
        end if;
    end process;
	
	process (CLK)
	variable i : integer :=0;
	begin
		if (CLK'event and CLK='1') then
		    if pce='1' then
			    if (WRE = '1') then
				    if(BIT_WIDTH=9) then
					    i := 0;
					    while(i < BIT_WIDTH) loop
						    ram_MEM((conv_integer(addr)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    elsif(BIT_WIDTH=18) then
					    if (AD(0)='1') then
						    i := 0;
						    while (i < 9) loop
							    ram_MEM((conv_integer(addr)+i))<= DI(i);
							    i := i+1;
						    end loop;
					    end if;
					    if(AD(1)='1') then
						    i := 9;
						    while ((i >= 9) and (i < 18)) loop
							    ram_MEM((conv_integer(addr)+i))<= DI(i);
							    i := i+1;
						    end loop;
					    end if;
				    elsif(BIT_WIDTH=36) then
					    if (AD(0)='1') then
						    i := 0;
						    while (i < 9) loop
							    ram_MEM((conv_integer(addr)+i))<= DI(i);
						    	i := i+1;
						    end loop;
					    end if;
					    if(AD(1)='1') then
						    i := 9;
						    while ((i >= 9) and (i < 18)) loop
						    	ram_MEM((conv_integer(addr)+i))<= DI(i);
					    		i := i+1;
					    	end loop;
					    end if;
					    if(AD(2)='1') then
						    i := 18;
						    while ((i >= 18) and (i<27)) loop
							    ram_MEM((conv_integer(addr)+i))<= DI(i);
							    i := i+1;
						    end loop;
				        end if;
					    if(AD(3)='1') then
						    i := 27;
						    while ((i >= 27) and (i<36)) loop
							    ram_MEM((conv_integer(addr)+i))<= DI(i);
							    i := i+1;
						    end loop;
					    end if;
				    end if;
				    mc <= (not mc);
			    end if;
		    end if;
	    end if;
	end process;

    process (CLK)
	variable i : integer :=0;
	begin
		if (CLK'event and CLK='1') then
		    if (RESET='1') then
			    bp_reg_sync <=(others=>'0');
            elsif pce='1' then
			    if (WRE = '1') then
				    if (WRITE_MODE = "01") then
                        i := 0;
					    while(i < data_width_t) loop
						    bp_reg_sync(i) <= ram_MEM((conv_integer(addr)+i));
						    i := i+1;
					    end loop;

                        if(BIT_WIDTH = 9) then
					        bp_reg_sync((BIT_WIDTH-1) downto 0) <= DI((BIT_WIDTH-1) downto 0);             
                        elsif(BIT_WIDTH = 18) then
                            if(AD(0) = '1') then
							    bp_reg_sync(8 downto 0) <= DI(8 downto 0);
                            end if;
                            if(AD(1) = '1') then
                                bp_reg_sync(17 downto 9) <= DI(17 downto 9);
                            end if;                            
                        elsif(BIT_WIDTH = 36) then
                            if(AD(0) = '1') then
                                bp_reg_sync(8 downto 0)  <= DI(8 downto 0);
                            end if;
                            if(AD(1) = '1') then
                                bp_reg_sync(17 downto 9) <= DI(17 downto 9);
                            end if;
                            if(AD(2) = '1') then
                                bp_reg_sync(26 downto 18) <= DI(26 downto 18);	
                            end if;
                            if(AD(3) = '1') then
                                bp_reg_sync(35 downto 27) <= DI(35 downto 27);
                            end if;
                        end if;
				    end if;

				    if (WRITE_MODE = "10") then
					    i := 0;
					    while(i < data_width_t) loop
						    bp_reg_sync(i) <= ram_MEM((conv_integer(addr)+i));
						    i := i+1;
					    end loop;
				    end if;
				
			    elsif(WRE = '0') then
					i := 0;
					while(i < BIT_WIDTH) loop
						bp_reg_sync(i) <= ram_MEM((conv_integer(addr)+i));
						i := i+1;
					end loop;
			    end if;
		    end if;
	    end if;
	end process;

    process (CLK,RESET)
	variable i : integer :=0;
	begin
		if (RESET='1') then
			bp_reg_async <=(others=>'0');
		elsif (CLK'event and CLK='1') then
		    if pce='1' then
			    if (WRE = '1') then
				    if (WRITE_MODE = "01") then
                        i := 0;
					    while(i < data_width_t) loop
						    bp_reg_async(i) <= ram_MEM((conv_integer(addr)+i));
						    i := i+1;
					    end loop;

                        if(BIT_WIDTH = 9) then
					        bp_reg_async((BIT_WIDTH-1) downto 0) <= DI((BIT_WIDTH-1) downto 0);             
                        elsif(BIT_WIDTH = 18) then
                            if(AD(0) = '1') then
							    bp_reg_async(8 downto 0) <= DI(8 downto 0);
                            end if;
                            if(AD(1) = '1') then
                                bp_reg_async(17 downto 9) <= DI(17 downto 9);
                            end if;                            
                        elsif(BIT_WIDTH = 36) then
                            if(AD(0) = '1') then
                                bp_reg_async(8 downto 0)  <= DI(8 downto 0);
                            end if;
                            if(AD(1) = '1') then
                                bp_reg_async(17 downto 9) <= DI(17 downto 9);
                            end if;
                            if(AD(2) = '1') then
                                bp_reg_async(26 downto 18) <= DI(26 downto 18);	
                            end if;
                            if(AD(3) = '1') then
                                bp_reg_async(35 downto 27) <= DI(35 downto 27);
                            end if;
                        end if;
				    end if;

				    if (WRITE_MODE = "10") then
					    i := 0;
					    while(i < data_width_t) loop
						    bp_reg_async(i) <= ram_MEM((conv_integer(addr)+i));
						    i := i+1;
					    end loop;
				    end if;
				
			    elsif(WRE = '0') then
					i := 0;
					while(i < BIT_WIDTH) loop
						bp_reg_async(i) <= ram_MEM((conv_integer(addr)+i));
						i := i+1;
					end loop;
			    end if;
		    end if;
	    end if;
	end process;

    process (CLK,RESET)
	begin
		if (RESET='1') then
			pl_reg_async <=(others=>'0');
		elsif (CLK'event and CLK='1') then
		    if(OCE = '1') then
			    pl_reg_async <= bp_reg;
		    end if;
	    end if;
	end process;

    process (CLK)
	begin
		if (CLK'event and CLK='1') then
		    if (RESET='1') then
			    pl_reg_sync <=(others=>'0');
		    elsif(OCE = '1') then
			    pl_reg_sync <= bp_reg;
		    end if;
	    end if;
	end process;

end Behavioral;

----------------------------------SDP---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SDP is
    GENERIC ( 
	    BIT_WIDTH_0 : integer :=16; -- 1, 2, 4, 8, 16, 32
	    BIT_WIDTH_1 : integer :=16; -- 1, 2, 4, 8, 16, 32
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    BLK_SEL : bit_vector := "000";
        RESET_MODE : string := "SYNC"; --SYNC, ASYNC
	    INIT_RAM_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"    
    
    );
    PORT (
	    DO : out std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	    CLKA,CLKB, CEA,CEB,OCE,RESETA,RESETB,WREA,WREB : in std_logic;
	    ADA,ADB : in std_logic_vector(13 downto 0);
        BLKSEL : in std_logic_vector(2 downto 0);
	    DI : in std_logic_vector(31 downto 0)
    );
end SDP;

architecture Behavioral of SDP is
	signal bp_reg,bp_reg_async,bp_reg_sync : std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	signal pl_reg,pl_reg_async,pl_reg_sync : std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	signal ram_MEM : std_logic_vector(16383 downto 0):=TO_StdLogicVector(INIT_RAM_3F & INIT_RAM_3E & INIT_RAM_3D & INIT_RAM_3C &INIT_RAM_3B & INIT_RAM_3A & INIT_RAM_39 & INIT_RAM_38 &INIT_RAM_37 & INIT_RAM_36 & INIT_RAM_35 & INIT_RAM_34 &INIT_RAM_33 & INIT_RAM_32 & INIT_RAM_31 & INIT_RAM_30 &INIT_RAM_2F & INIT_RAM_2E & INIT_RAM_2D & INIT_RAM_2C &INIT_RAM_2B & INIT_RAM_2A & INIT_RAM_29 & INIT_RAM_28 &INIT_RAM_27 & INIT_RAM_26 & INIT_RAM_25 & INIT_RAM_24 &INIT_RAM_23 & INIT_RAM_22 & INIT_RAM_21 & INIT_RAM_20 &INIT_RAM_1F & INIT_RAM_1E & INIT_RAM_1D & INIT_RAM_1C &INIT_RAM_1B & INIT_RAM_1A & INIT_RAM_19 & INIT_RAM_18 &INIT_RAM_17 & INIT_RAM_16 & INIT_RAM_15 & INIT_RAM_14 &INIT_RAM_13 & INIT_RAM_12 & INIT_RAM_11 & INIT_RAM_10 &INIT_RAM_0F & INIT_RAM_0E & INIT_RAM_0D & INIT_RAM_0C & INIT_RAM_0B & INIT_RAM_0A & INIT_RAM_09 & INIT_RAM_08 &INIT_RAM_07 & INIT_RAM_06 & INIT_RAM_05 & INIT_RAM_04 &INIT_RAM_03 & INIT_RAM_02 & INIT_RAM_01 & INIT_RAM_00);
	signal data_width_t1,data_width_t2,addr_width_a,addr_width_b : integer:=0;
	signal mc : std_logic := '0';
	signal bs_en : std_logic;
	signal pcea,pceb : std_logic;
	signal addr_a,addr_b : std_logic_vector(13 downto 0):=conv_std_logic_vector(0,14);

begin
	data_width_t1 <= BIT_WIDTH_0;
	data_width_t2 <= BIT_WIDTH_1;
	
	for_addr:for k in 0 to 13 generate
	begin
			addr_a(k)<= '0' when (k<(14-addr_width_a)) else ADA(k);
			addr_b(k)<= '0' when (k<(14-addr_width_b)) else ADB(k);
	end generate for_addr;
	
	process (data_width_t1,data_width_t2)
	begin
		case (data_width_t1) is
			when 1=> addr_width_a<=14;
			when 2=> addr_width_a<=13;
			when 4=> addr_width_a<=12;
			when 8=> addr_width_a<=11;
			when 16=> addr_width_a<=10;
			when 32=> addr_width_a<=9;
			when others=>addr_width_a<=0;
		end case;
		case (data_width_t2) is
			when 1=> addr_width_b<=14;
			when 2=> addr_width_b<=13;
			when 4=> addr_width_b<=12;
			when 8=> addr_width_b<=11;
			when 16=> addr_width_b<=10;
			when 32=> addr_width_b<=9;
			when others=>addr_width_b<=0;
		end case;
	end process;

	DO <= bp_reg when (READ_MODE = '0') else pl_reg;
	
	pcea <= CEA and bs_en;
	pceb <= CEB and bs_en;
	process(BLKSEL)
	begin
		if(BLKSEL = TO_STDLOGICVECTOR(BLK_SEL)) then
			bs_en <= '1';
		else 
			bs_en <= '0';
		end if;

	end process;
	
    process (bp_reg_async,bp_reg_sync,pl_reg_async,pl_reg_sync) 
    begin
        if(RESET_MODE = "ASYNC") then
            bp_reg <= bp_reg_async;
            pl_reg <= pl_reg_async;
        else 
            bp_reg <= bp_reg_sync;
            pl_reg <= pl_reg_sync;
        end if;
    end process;

	process (CLKA)
	variable i : integer :=0;
	begin					    
	    if (CLKA'event and CLKA='1') then
		    if (pcea='1') then
			    if (WREA='1') then			    
			        if((data_width_t1=1) or (data_width_t1=2) or (data_width_t1=4) or (data_width_t1=8)) then
				        i := 0;
				        while(i < data_width_t1) loop
					        ram_MEM((conv_integer(addr_a)+i))<= DI(i);
					        i := i+1;
				        end loop;
			        elsif(data_width_t1=16) then
					    if (ADA(0)='1') then
						    i := 0;
						    while (i < 8) loop
							    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
							    i := i+1;
						    end loop;
					    end if;
					    if(ADA(1)='1') then
						    i := 8;
						    while ((i >= 8) and (i<16)) loop
							    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
							    i := i+1;
						    end loop;
					    end if;
			        elsif(data_width_t1=32) then
					    if (ADA(0)='1') then
						    i := 0;
						    while (i < 8) loop
							    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
							    i := i+1;
						    end loop;
					    end if;
					    if(ADA(1)='1') then
						    i := 8;
						    while ((i >= 8) and (i<16)) loop
							    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
							    i := i+1;
						    end loop;
					    end if;
					    if(ADA(2)='1') then
						    i := 16;
						    while ((i >= 16) and (i<24)) loop
							    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
							    i := i+1;
						    end loop;
				        end if;
					    if(ADA(3)='1') then
					    	i := 24;
						    while ((i >= 24) and (i<32)) loop
						    	ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    	i := i+1;
					    	end loop;
				        end if;
			        end if;
			        mc <= (not mc);
		        end if;
	        end if;
	    end if;
	end process;

	process (CLKB,RESETB)
	variable i : integer :=0;
	begin
		if RESETB='1' then
			bp_reg_async <= (others=>'0');
		elsif CLKB'event and CLKB='1' then
			if ((pceb='1') and (WREB='0')) then
				i := 0;
				while(i < data_width_t2) loop
					bp_reg_async(i) <= ram_MEM((conv_integer(addr_b)+i));
					i := i+1;
				end loop;
			end if;
		end if;
	end process;

    process (CLKB)
	variable i : integer :=0;
	begin
		if CLKB'event and CLKB='1' then
		    if RESETB='1' then
			    bp_reg_sync <= (others=>'0');
			elsif ((pceb='1') and (WREB='0')) then
				i := 0;
				while(i < data_width_t2) loop
					bp_reg_sync(i) <= ram_MEM((conv_integer(addr_b)+i));
					i := i+1;
				end loop;
			end if;
		end if;
	end process;

    process (CLKB,RESETB)
	begin
		if RESETB='1' then
			pl_reg_async <= (others=>'0');
		elsif CLKB'event and CLKB='1' then
			if(OCE = '1') then
				pl_reg_async <= bp_reg;
			end if;
		end if;
	end process;

    process (CLKB,RESETB)
	variable i : integer :=0;
	begin
		if CLKB'event and CLKB='1' then
		    if RESETB='1' then
			    pl_reg_sync <= (others=>'0');
			elsif(OCE = '1') then
				pl_reg_sync <= bp_reg;
			end if;
		end if;
	end process;

end Behavioral;

----------------------------------SDPX9---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SDPX9 is
    GENERIC ( 
	    BIT_WIDTH_0 : integer :=18; -- 9, 18, 36
	    BIT_WIDTH_1 : integer :=18; -- 9, 18, 36
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    BLK_SEL : bit_vector := "000";
        RESET_MODE : string := "SYNC"; --SYNC,ASYNC
	    INIT_RAM_00 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000"      
    );
    PORT (
	    DO : out std_logic_vector(35 downto 0):=conv_std_logic_vector(0,36);
	    CLKA,CLKB, CEA,CEB,OCE,RESETA,RESETB,WREA,WREB : in std_logic;
	    ADA,ADB : in std_logic_vector(13 downto 0);
    	BLKSEL : in std_logic_vector(2 downto 0);
	    DI : in std_logic_vector(35 downto 0)
    );
end SDPX9;

architecture Behavioral of SDPX9 is
	signal bp_reg,pl_reg,bp_reg_async,pl_reg_async,bp_reg_sync,pl_reg_sync : std_logic_vector(35 downto 0) := conv_std_logic_vector(0, 36);
	signal ram_MEM : std_logic_vector(18431 downto 0):= TO_StdLogicVector(INIT_RAM_3F & INIT_RAM_3E & INIT_RAM_3D & INIT_RAM_3C &INIT_RAM_3B & INIT_RAM_3A & INIT_RAM_39 & INIT_RAM_38 &INIT_RAM_37 & INIT_RAM_36 & INIT_RAM_35 & INIT_RAM_34 &INIT_RAM_33 & INIT_RAM_32 & INIT_RAM_31 & INIT_RAM_30 &INIT_RAM_2F & INIT_RAM_2E & INIT_RAM_2D & INIT_RAM_2C &INIT_RAM_2B & INIT_RAM_2A & INIT_RAM_29 & INIT_RAM_28 &INIT_RAM_27 & INIT_RAM_26 & INIT_RAM_25 & INIT_RAM_24 &INIT_RAM_23 & INIT_RAM_22 & INIT_RAM_21 & INIT_RAM_20 &INIT_RAM_1F & INIT_RAM_1E & INIT_RAM_1D & INIT_RAM_1C &INIT_RAM_1B & INIT_RAM_1A & INIT_RAM_19 & INIT_RAM_18 &INIT_RAM_17 & INIT_RAM_16 & INIT_RAM_15 & INIT_RAM_14 &INIT_RAM_13 & INIT_RAM_12 & INIT_RAM_11 & INIT_RAM_10 &INIT_RAM_0F & INIT_RAM_0E & INIT_RAM_0D & INIT_RAM_0C & INIT_RAM_0B & INIT_RAM_0A & INIT_RAM_09 & INIT_RAM_08 &INIT_RAM_07 & INIT_RAM_06 & INIT_RAM_05 & INIT_RAM_04 &INIT_RAM_03 & INIT_RAM_02 & INIT_RAM_01 & INIT_RAM_00);
	signal data_width_t1,data_width_t2,addr_width_a,addr_width_b : integer:=0;
	signal addr_a,addr_b : std_logic_vector(14 downto 0):=conv_std_logic_vector(0,15);
	signal mc : std_logic := '0';
	signal bs_en : std_logic;
	signal pcea,pceb : std_logic;
	
begin

	data_width_t1 <= BIT_WIDTH_0;
	data_width_t2 <= BIT_WIDTH_1;

	addr_a <= conv_std_logic_vector(conv_integer(ADA(13 downto (14-addr_width_a)))*data_width_t1,15);
	addr_b <= conv_std_logic_vector(conv_integer(ADB(13 downto (14-addr_width_b)))*data_width_t2,15);

	process (data_width_t1,data_width_t2)
	begin
		case (data_width_t1) is
			when 9=> addr_width_a<=11;
			when 18=> addr_width_a<=10;
			when 36=> addr_width_a<=9;
			when others=>addr_width_a<=0;
		end case;
		case (data_width_t2) is
			when 9=> addr_width_b<=11;
			when 18=> addr_width_b<=10;
			when 36=> addr_width_b<=9;
			when others=>addr_width_b<=0;
		end case;
	end process;

	DO <= bp_reg when (READ_MODE = '0') else pl_reg;
	
	pcea <= CEA and bs_en;
	pceb <= CEB and bs_en;
	process(BLKSEL)
	begin
		if(BLKSEL = TO_STDLOGICVECTOR(BLK_SEL)) then
			bs_en <= '1';
		else
			bs_en <= '0';
		end if;
	end process;

    process (bp_reg_async,bp_reg_sync,pl_reg_async,pl_reg_sync) 
    begin
        if(RESET_MODE = "ASYNC") then
            bp_reg <= bp_reg_async;
            pl_reg <= pl_reg_async;
        else 
            bp_reg <= bp_reg_sync;
            pl_reg <= pl_reg_sync;
        end if;
    end process;
	
	process (CLKA)
	variable i : integer :=0;
	begin
	    if CLKA'event and CLKA='1' then
		    if (pcea='1') then
			    if (WREA='1') then
			        if(data_width_t1=9) then
					    i := 0;
					    while(i < data_width_t1) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    elsif(data_width_t1=18) then
					    if (ADA(0)='1') then
						    i := 0;
						    while (i < 9) loop
							    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
							    i := i+1;
						    end loop;
					    end if;
					    if(ADA(1)='1') then
						    i := 9;
						    while ((i >= 9) and (i < 18)) loop
							    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
							    i := i+1;
						    end loop;
					    end if;
				    elsif(data_width_t1=36) then
					    if (ADA(0)='1') then
						    i := 0;
						    while (i < 9) loop
							    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
							    i := i+1;
						    end loop;
					    end if;
				    	if(ADA(1)='1') then
						    i := 9;
						    while ((i >= 9) and (i < 18)) loop
							    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
							    i := i+1;
					    	end loop;
				    	end if;
					    if(ADA(2)='1') then
						    i := 18;
						    while ((i >= 18) and (i<27)) loop
							    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
							    i := i+1;
						    end loop;
				        end if;
					    if(ADA(3)='1') then
						    i := 27;
						    while ((i >= 27) and (i<36)) loop
							    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
							    i := i+1;
						    end loop;
					    end if;
				    end if;
				mc <= (not mc);
                end if;
	        end if;
	    end if;
	end process;

	process (CLKB,RESETB)
	variable i : integer :=0;
	begin
		if RESETB='1' then
			bp_reg_async <= (others=>'0');
		elsif CLKB'event and CLKB='1' then
			if ((pceb='1') and (WREB='0')) then
				i := 0;
				while(i < data_width_t2) loop
					bp_reg_async(i) <= ram_MEM((conv_integer(addr_b)+i));
					i := i+1;
				end loop;
			end if;
		end if;
	end process;

    process (CLKB)
	variable i : integer :=0;
	begin
		if CLKB'event and CLKB='1' then
		    if RESETB='1' then
			    bp_reg_sync <= (others=>'0');
			elsif ((pceb='1') and (WREB='0')) then
				i := 0;
				while(i < data_width_t2) loop
					bp_reg_sync(i) <= ram_MEM((conv_integer(addr_b)+i));
					i := i+1;
				end loop;
			end if;
		end if;
	end process;

    process (CLKB,RESETB)
	begin
		if RESETB='1' then
			pl_reg_async <= (others=>'0');
		elsif CLKB'event and CLKB='1' then
			if(OCE = '1') then
				pl_reg_async <= bp_reg;
			end if;
		end if;
	end process;

    process (CLKB)
	begin
		if CLKB'event and CLKB='1' then
		    if RESETB='1' then
			    pl_reg_sync <= (others=>'0');
			elsif(OCE = '1') then
				pl_reg_sync <= bp_reg;
			end if;			
		end if;
	end process;

end Behavioral;

----------------------------DP---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DP is
    GENERIC (
		BIT_WIDTH_0 : integer :=16; -- 1, 2, 4, 8, 16
		BIT_WIDTH_1 : integer :=16; -- 1, 2, 4, 8, 16
		READ_MODE0 : bit := '0'; -- 0: bypass mode; 1: pipeline mode
		READ_MODE1 : bit := '0'; -- 0: bypass mode; 1: pipeline mode
		WRITE_MODE0 : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
		WRITE_MODE1 : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
	    BLK_SEL : bit_vector := "000";
        RESET_MODE : string := "SYNC";--SYNC, ASYNC
		INIT_RAM_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"
    );
    PORT (
		DOA,DOB : out std_logic_vector(15 downto 0):=conv_std_logic_vector(0,16);
		CLKA,CLKB, CEA,CEB,OCEA,OCEB,RESETA,RESETB,WREA,WREB : in std_logic;
		ADA,ADB : in std_logic_vector(13 downto 0);
    	BLKSEL : in std_logic_vector(2 downto 0);
		DIA,DIB : in std_logic_vector(15 downto 0)
    );
end DP;

architecture Behavioral of DP is
	signal bpa_reg,bpb_reg,pla_reg,plb_reg,bpa_reg_async,bpb_reg_async,pla_reg_async,plb_reg_async,bpa_reg_sync,bpb_reg_sync,pla_reg_sync,plb_reg_sync : std_logic_vector(15 downto 0):= X"0000";
	signal ram_MEM : std_logic_vector(16383 downto 0) := TO_StdLogicVector(INIT_RAM_3F & INIT_RAM_3E & INIT_RAM_3D & INIT_RAM_3C &INIT_RAM_3B & INIT_RAM_3A & INIT_RAM_39 & INIT_RAM_38 &INIT_RAM_37 & INIT_RAM_36 & INIT_RAM_35 & INIT_RAM_34 &INIT_RAM_33 & INIT_RAM_32 & INIT_RAM_31 & INIT_RAM_30 &INIT_RAM_2F & INIT_RAM_2E & INIT_RAM_2D & INIT_RAM_2C &INIT_RAM_2B & INIT_RAM_2A & INIT_RAM_29 & INIT_RAM_28 &INIT_RAM_27 & INIT_RAM_26 & INIT_RAM_25 & INIT_RAM_24 &INIT_RAM_23 & INIT_RAM_22 & INIT_RAM_21 & INIT_RAM_20 &INIT_RAM_1F & INIT_RAM_1E & INIT_RAM_1D & INIT_RAM_1C &INIT_RAM_1B & INIT_RAM_1A & INIT_RAM_19 & INIT_RAM_18 &INIT_RAM_17 & INIT_RAM_16 & INIT_RAM_15 & INIT_RAM_14 &INIT_RAM_13 & INIT_RAM_12 & INIT_RAM_11 & INIT_RAM_10 &INIT_RAM_0F & INIT_RAM_0E & INIT_RAM_0D & INIT_RAM_0C & INIT_RAM_0B & INIT_RAM_0A & INIT_RAM_09 & INIT_RAM_08 &INIT_RAM_07 & INIT_RAM_06 & INIT_RAM_05 & INIT_RAM_04 &INIT_RAM_03 & INIT_RAM_02 & INIT_RAM_01 & INIT_RAM_00);
	signal data_width_t1,data_width_t2,addr_width_a,addr_width_b : integer := 0;
	signal addr_a,addr_b : std_logic_vector(13 downto 0):=conv_std_logic_vector(0,14);
	signal mc : std_logic := '0';
	signal bs_en : std_logic;
	signal pcea,pceb : std_logic;

begin
	data_width_t1 <= BIT_WIDTH_0;
	data_width_t2 <= BIT_WIDTH_1;
	
	for_addr:for k in 0 to 13 generate
	begin
			addr_a(k)<= '0' when (k<(14-addr_width_a)) else ADA(K);
			addr_b(k)<= '0' when (k<(14-addr_width_b)) else ADB(K);
	end generate for_addr;

	process (data_width_t1,data_width_t2)
	begin
		case (data_width_t1) is
			when 1=> addr_width_a<=14;
			when 2=> addr_width_a<=13;
			when 4=> addr_width_a<=12;
			when 8=> addr_width_a<=11;
			when 16=> addr_width_a<=10;
			when others=>addr_width_a<=0;
		end case;
		case (data_width_t2) is
			when 1=> addr_width_b<=14;
			when 2=> addr_width_b<=13;
			when 4=> addr_width_b<=12;
			when 8=> addr_width_b<=11;
			when 16=> addr_width_b<=10;
			when others=>addr_width_b<=0;
		end case;
	end process;

	DOA <= bpa_reg when (READ_MODE0 = '0') else pla_reg;
	DOB <= bpb_reg when (READ_MODE1 = '0') else plb_reg;
	
	pcea <= CEA and bs_en;
	pceb <= CEB and bs_en;
	process(BLKSEL)
	begin
		if(BLKSEL = TO_STDLOGICVECTOR(BLK_SEL)) then
			bs_en <= '1';
		else 
			bs_en <= '0';
		end if;

	end process;

    process(bpa_reg_async, bpa_reg_sync, pla_reg_async, pla_reg_sync, bpb_reg_async, bpb_reg_sync, plb_reg_async, plb_reg_sync) 
    begin
        if(RESET_MODE = "ASYNC") then
            bpa_reg <= bpa_reg_async;
            pla_reg <= pla_reg_async;
            bpb_reg <= bpb_reg_async;
            plb_reg <= plb_reg_async;
        else 
            bpa_reg <= bpa_reg_sync;
            pla_reg <= pla_reg_sync;
            bpb_reg <= bpb_reg_sync;
            plb_reg <= plb_reg_sync;
        end if;
    end process;


	process (CLKA,CLKB)
	variable i : integer :=0;
	begin	
	    -------port A------------------------
	    if CLKA'event and CLKA='1' then
            if (pcea='1') then
			    if (WREA='1') then
			        if((BIT_WIDTH_0=1) or (BIT_WIDTH_0=2) or (BIT_WIDTH_0=4) or (BIT_WIDTH_0=8)) then
					    i := 0;
					    while(i < BIT_WIDTH_0) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DIA(i);
						    i := i+1;
					    end loop;
				    elsif(BIT_WIDTH_0=16) then
					    if (ADA(0)='1') then
						    i := 0;
						    while (i < 8) loop
							    ram_MEM((conv_integer(addr_a)+i))<= DIA(i);
							    i := i+1;
						    end loop;
					    end if;
					    if(ADA(1)='1') then
						    i := 8;
						    while ((i >= 8) and (i<16)) loop
							    ram_MEM((conv_integer(addr_a)+i))<= DIA(i);
							    i := i+1;
						    end loop;
					    end if;
				    end if;
				    mc <= (not mc);
 			    end if;
		    end if;
	    end if;

	    -------------port B------------------------------------------
	    if CLKB'event and CLKB='1' then
		    if (pceb='1') then
			    if(WREB='1') then
				    if((BIT_WIDTH_1=1) or (BIT_WIDTH_1=2) or (BIT_WIDTH_1=4) or (BIT_WIDTH_1=8)) then
					    i := 0;
					    while(i < BIT_WIDTH_1) loop
						    ram_MEM((conv_integer(addr_b)+i))<= DIB(i);
						    i := i+1;
					    end loop;
				    elsif(BIT_WIDTH_1=16) then
					    if (ADB(0)='1') then
						    i := 0;
						    while (i < 8) loop
							    ram_MEM((conv_integer(addr_b)+i))<= DIB(i);
							    i := i+1;
						    end loop;
					    end if;
					    if(ADB(1)='1') then
						    i := 8;
						    while ((i >= 8) and (i<16)) loop
							    ram_MEM((conv_integer(addr_b)+i))<= DIB(i);
							    i := i+1;
						    end loop;
					    end if;
				    end if;
				    mc <= (not mc);
			    end if;
			end if;
        end if;
	end process;

    
    process (CLKA,CLKB,RESETA,RESETB)
	variable i : integer :=0;
	begin	
	    -------port A------------------------
	    if RESETA='1' then
			bpa_reg_async <= (others=>'0');
	    elsif CLKA'event and CLKA='1' then
		    if (pcea='1') then
			    if (WREA='1') then
			        if (WRITE_MODE0 = "01") then
                        i := 0;
					    while(i < data_width_t1) loop
			   	            bpa_reg_async(i) <= ram_MEM((conv_integer(addr_a)+i));
				            i := i+1;
					    end loop;

                        if(BIT_WIDTH_0<=8) then
					        bpa_reg_async((BIT_WIDTH_0-1) downto 0) <= DIA((BIT_WIDTH_0-1) downto 0);
                        elsif(BIT_WIDTH_0=16) then
                            if(ADA(0) = '1') then
						        bpa_reg_async(7 downto 0) <= DIA(7 downto 0);
                            end if;
                            if(ADA(1) = '1') then
						        bpa_reg_async(15 downto 8) <= DIA(15 downto 8);
                            end if;
				        end if;
			        end if;

			        if (WRITE_MODE0 = "10") then
			    	    i := 0;
					    while(i < data_width_t1) loop
			   	            bpa_reg_async(i) <= ram_MEM((conv_integer(addr_a)+i));
				            i := i+1;
					    end loop;
				    end if;
					 		
				elsif(WREA = '0') then
					i := 0;
					while(i < BIT_WIDTH_0) loop
						bpa_reg_async(i) <= ram_MEM((conv_integer(addr_a)+i));
						i := i+1;
					end loop;
			    end if;
		    end if;
	    end if;

	    -------------port B------------------------------------------
	    if RESETB='1' then
		    bpb_reg_async <=(others=>'0');
	    elsif CLKB'event and CLKB='1' then
		    if (pceb='1') then
			    if(WREB='1') then
				    if (WRITE_MODE1 = "01") then
                        i := 0;
					    while(i < data_width_t2) loop
						    bpb_reg_async(i) <= ram_MEM((conv_integer(addr_b)+i));
						    i := i+1;
					    end loop;

                        if(BIT_WIDTH_1<=8) then
					        bpb_reg_async((BIT_WIDTH_1-1) downto 0) <= DIB((BIT_WIDTH_1-1) downto 0);
                        elsif(BIT_WIDTH_1=16) then
                            if(ADB(0) = '1') then
						        bpb_reg_async(7 downto 0) <= DIB(7 downto 0);
                            end if;
                            if(ADB(1) = '1') then
						        bpb_reg_async(15 downto 8) <= DIB(15 downto 8);
                            end if;
				        end if;
				    end if;

				    if (WRITE_MODE1 = "10") then
					    i := 0;
					    while(i < data_width_t2) loop
						    bpb_reg_async(i) <= ram_MEM((conv_integer(addr_b)+i));
						    i := i+1;
					    end loop;
				    end if;

				elsif(WREB = '0') then
					i := 0;
					while(i < BIT_WIDTH_1) loop
						bpb_reg_async(i) <= ram_MEM((conv_integer(addr_b)+i));
						i := i+1;
					end loop;
			    end if;
			end if;
	    end if;
	end process;

    process (CLKA,CLKB)
	variable i : integer :=0;
	begin	
	    -------port A------------------------
	    if CLKA'event and CLKA='1' then
	        if RESETA='1' then
			    bpa_reg_sync <= (others=>'0');
		    elsif (pcea='1') then
			    if (WREA='1') then
			        if (WRITE_MODE0 = "01") then
                        i := 0;
					    while(i < data_width_t1) loop
			   	            bpa_reg_sync(i) <= ram_MEM((conv_integer(addr_a)+i));
				            i := i+1;
					    end loop;

                        if(BIT_WIDTH_0<=8) then
					        bpa_reg_sync((BIT_WIDTH_0-1) downto 0) <= DIA((BIT_WIDTH_0-1) downto 0);
                        elsif(BIT_WIDTH_0=16) then
                            if(ADA(0) = '1') then
						        bpa_reg_sync(7 downto 0) <= DIA(7 downto 0);
                            end if;
                            if(ADA(1) = '1') then
						        bpa_reg_sync(15 downto 8) <= DIA(15 downto 8);
                            end if;
				        end if;
			        end if;

			        if (WRITE_MODE0 = "10") then
			    	    i := 0;
					    while(i < data_width_t1) loop
			   	            bpa_reg_sync(i) <= ram_MEM((conv_integer(addr_a)+i));
				            i := i+1;
					    end loop;
				    end if;
					 		
				elsif(WREA = '0') then
					i := 0;
					while(i < BIT_WIDTH_0) loop
						bpa_reg_sync(i) <= ram_MEM((conv_integer(addr_a)+i));
						i := i+1;
					end loop;
			    end if;
		    end if;
	    end if;

	    -------------port B------------------------------------------
	    if CLKB'event and CLKB='1' then
	        if RESETB='1' then
		        bpb_reg_sync <=(others=>'0');
		    elsif (pceb='1') then
			    if(WREB='1') then
				    if (WRITE_MODE1 = "01") then
                        i := 0;
					    while(i < data_width_t2) loop
						    bpb_reg_sync(i) <= ram_MEM((conv_integer(addr_b)+i));
						    i := i+1;
					    end loop;

                        if(BIT_WIDTH_1<=8) then
					        bpb_reg_sync((BIT_WIDTH_1-1) downto 0) <= DIB((BIT_WIDTH_1-1) downto 0);
                        elsif(BIT_WIDTH_1=16) then
                            if(ADB(0) = '1') then
						        bpb_reg_sync(7 downto 0) <= DIB(7 downto 0);
                            end if;
                            if(ADB(1) = '1') then
						        bpb_reg_sync(15 downto 8) <= DIB(15 downto 8);
                            end if;
				        end if;
				    end if;

				    if (WRITE_MODE1 = "10") then
					    i := 0;
					    while(i < data_width_t2) loop
						    bpb_reg_sync(i) <= ram_MEM((conv_integer(addr_b)+i));
						    i := i+1;
					    end loop;
				    end if;

				elsif(WREB = '0') then
					i := 0;
					while(i < BIT_WIDTH_1) loop
						bpb_reg_sync(i) <= ram_MEM((conv_integer(addr_b)+i));
						i := i+1;
					end loop;
			    end if;
			end if;
	    end if;
	end process;

    process (CLKA,CLKB,RESETA,RESETB)
	begin	
	    if RESETA='1' then
			pla_reg_async <= (others=>'0');
	    elsif CLKA'event and CLKA='1' then
		    if(OCEA = '1') then
		        pla_reg_async <= bpa_reg;
	        end if;
	    end if;

	    if RESETB='1' then
		    plb_reg_async <=(others=>'0');
	    elsif CLKB'event and CLKB='1' then
		    if(OCEB = '1') then
		        plb_reg_async <= bpb_reg;
	        end if;
		end if;
	end process;

    process (CLKA,CLKB)
	begin	
	    if CLKA'event and CLKA='1' then
	        if RESETA='1' then
			    pla_reg_sync <= (others=>'0');
		    elsif(OCEA = '1') then
		        pla_reg_sync <= bpa_reg;
	        end if;
	    end if;

	    if CLKB'event and CLKB='1' then
	        if RESETB='1' then
		        plb_reg_sync <=(others=>'0');
		    elsif(OCEB = '1') then
		        plb_reg_sync <= bpb_reg;
	        end if;
		end if;
	end process;
	
end Behavioral;

----------------------------DPX9---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DPX9 is
    GENERIC ( 
	    BIT_WIDTH_0 : integer :=18; -- 9, 18
	    BIT_WIDTH_1 : integer :=18; -- 9, 18
	    READ_MODE0 : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    READ_MODE1 : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    WRITE_MODE0 : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
	    WRITE_MODE1 : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
        BLK_SEL : bit_vector := "000";
        RESET_MODE : string := "SYNC";--SYNC, ASYNC
	    INIT_RAM_00 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000"     
    );
    PORT (
	    DOA,DOB : out std_logic_vector(17 downto 0):=conv_std_logic_vector(0,18);
	    CLKA,CLKB, CEA,CEB,OCEA,OCEB,RESETA,RESETB,WREA,WREB : in std_logic;
	    ADA,ADB : in std_logic_vector(13 downto 0);
	    DIA : in std_logic_vector(17 downto 0);
        BLKSEL : in std_logic_vector(2 downto 0);
	    DIB : in std_logic_vector(17 downto 0)
    );
end DPX9;

architecture Behavioral of DPX9 is
	signal bpa_reg,bpb_reg,pla_reg,plb_reg,bpa_reg_async,bpb_reg_async,pla_reg_async,plb_reg_async,bpa_reg_sync,bpb_reg_sync,pla_reg_sync,plb_reg_sync : std_logic_vector(17 downto 0) := conv_std_logic_vector(0, 18);
	signal ram_MEM : std_logic_vector(18431 downto 0):=TO_StdLogicVector(INIT_RAM_3F & INIT_RAM_3E & INIT_RAM_3D & INIT_RAM_3C &INIT_RAM_3B & INIT_RAM_3A & INIT_RAM_39 & INIT_RAM_38 &INIT_RAM_37 & INIT_RAM_36 & INIT_RAM_35 & INIT_RAM_34 &INIT_RAM_33 & INIT_RAM_32 & INIT_RAM_31 & INIT_RAM_30 &INIT_RAM_2F & INIT_RAM_2E & INIT_RAM_2D & INIT_RAM_2C &INIT_RAM_2B & INIT_RAM_2A & INIT_RAM_29 & INIT_RAM_28 &INIT_RAM_27 & INIT_RAM_26 & INIT_RAM_25 & INIT_RAM_24 &INIT_RAM_23 & INIT_RAM_22 & INIT_RAM_21 & INIT_RAM_20 &INIT_RAM_1F & INIT_RAM_1E & INIT_RAM_1D & INIT_RAM_1C &INIT_RAM_1B & INIT_RAM_1A & INIT_RAM_19 & INIT_RAM_18 &INIT_RAM_17 & INIT_RAM_16 & INIT_RAM_15 & INIT_RAM_14 &INIT_RAM_13 & INIT_RAM_12 & INIT_RAM_11 & INIT_RAM_10 &INIT_RAM_0F & INIT_RAM_0E & INIT_RAM_0D & INIT_RAM_0C & INIT_RAM_0B & INIT_RAM_0A & INIT_RAM_09 & INIT_RAM_08 &INIT_RAM_07 & INIT_RAM_06 & INIT_RAM_05 & INIT_RAM_04 &INIT_RAM_03 & INIT_RAM_02 & INIT_RAM_01 & INIT_RAM_00);
	signal data_width_t1,data_width_t2,addr_width_a,addr_width_b : integer:= 0;
	signal addr_a,addr_b : std_logic_vector(14 downto 0):=conv_std_logic_vector(0,15);
	signal mc : std_logic := '0';
	signal bs_en : std_logic;
	signal pcea,pceb : std_logic;

begin
	data_width_t1 <= BIT_WIDTH_0;
	data_width_t2 <= BIT_WIDTH_1;

	addr_a <= conv_std_logic_vector(conv_integer(ADA(13 downto (14-addr_width_a)))*data_width_t1,15);
	addr_b <= conv_std_logic_vector(conv_integer(ADB(13 downto (14-addr_width_b)))*data_width_t2,15);
	
	process (data_width_t1,data_width_t2)
	begin
		case (data_width_t1) is
			when 9=> addr_width_a<=11;
			when 18=> addr_width_a<=10;
			when others=>addr_width_a<=0;
		end case;
		case (data_width_t2) is
			when 9=> addr_width_b<=11;
			when 18=> addr_width_b<=10;
			when others=>addr_width_b<=0;
		end case;
	end process;

	DOA <= bpa_reg when (READ_MODE0 = '0') else pla_reg;
	DOB <= bpb_reg when (READ_MODE1 = '0') else plb_reg;
	
	pcea <= CEA and bs_en;
	pceb <= CEB and bs_en;
	process(BLKSEL)
	begin
		if(BLKSEL = TO_STDLOGICVECTOR(BLK_SEL)) then
			bs_en <= '1';
		else 
			bs_en <= '0';
		end if;

	end process;

    process(bpa_reg_async, bpa_reg_sync, pla_reg_async, pla_reg_sync, bpb_reg_async, bpb_reg_sync, plb_reg_async, plb_reg_sync) 
    begin
        if(RESET_MODE = "ASYNC") then
            bpa_reg <= bpa_reg_async;
            pla_reg <= pla_reg_async;
            bpb_reg <= bpb_reg_async;
            plb_reg <= plb_reg_async;
        else 
            bpa_reg <= bpa_reg_sync;
            pla_reg <= pla_reg_sync;
            bpb_reg <= bpb_reg_sync;
            plb_reg <= plb_reg_sync;
        end if;
    end process;

	process (CLKA,CLKB)
	variable i : integer :=0;
    begin
	-----------port A-----------------------		
	    if CLKA'event and CLKA='1' then
	        if (pcea='1') then
		        if (WREA='1') then			        
				    if(BIT_WIDTH_0=9) then
					    i := 0;
					    while(i < BIT_WIDTH_0) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DIA(i);
						    i := i+1;
					    end loop;
				    elsif(BIT_WIDTH_0=18) then
					    if (ADA(0)='1') then
						    i := 0;
						    while (i < 9) loop
							    ram_MEM((conv_integer(addr_a)+i))<= DIA(i);
							    i := i+1;
						    end loop;
					    end if;
					    if(ADA(1)='1') then
						    i := 9;
						    while ((i >= 9) and (i<18)) loop
							    ram_MEM((conv_integer(addr_a)+i))<= DIA(i);
							    i := i+1;
						    end loop;
					    end if;
				    end if;
				    mc <= (not mc);
			    end if;
		    end if;
	    end if;

	    -------------port B----------------------
	    if CLKB'event and CLKB='1' then
		    if (pceb='1') then
			    if(WREB='1') then								
				    if(BIT_WIDTH_1=9) then
					    i := 0;
					    while(i < BIT_WIDTH_1) loop
						    ram_MEM((conv_integer(addr_b)+i))<= DIB(i);
						    i := i+1;
					    end loop;
				    elsif(BIT_WIDTH_1=18) then
					    if (ADB(0)='1') then
						    i := 0;
						    while (i < 9) loop
							    ram_MEM((conv_integer(addr_b)+i))<= DIB(i);
							    i := i+1;
						    end loop;
					    end if;
					    if(ADB(1)='1') then
						    i := 9;
						    while ((i >= 9) and (i<18)) loop
							    ram_MEM((conv_integer(addr_b)+i))<= DIB(i);
							    i := i+1;
						    end loop;
					    end if;
				    end if;
				    mc <= (not mc);
			    end if;
			end if;
	    end if;
	end process;

    process (CLKA,CLKB,RESETA,RESETB)
	variable i : integer :=0;
    begin
	-----------port A-----------------------		
	    if RESETA='1' then
			bpa_reg_async <= (others=>'0');
	    elsif CLKA'event and CLKA='1' then
		    if (pcea='1') then
		        if (WREA='1') then
			        if (WRITE_MODE0 = "01") then
                        i := 0;
					    while(i < data_width_t1) loop
			   	            bpa_reg_async(i) <= ram_MEM((conv_integer(addr_a)+i));
				            i := i+1;
					    end loop;

                        if (BIT_WIDTH_0 = 9) then
					        bpa_reg_async(8 downto 0) <= DIA(8 downto 0);
                        elsif(BIT_WIDTH_0 = 18) then
                            if(ADA(0) = '1') then
						        bpa_reg_async(8 downto 0) <= DIA(8 downto 0);
                            end if;
                            if(ADA(1) = '1') then
						        bpa_reg_async(17 downto 9) <= DIA(17 downto 9);
                            end if;
                        end if;
			        end if;
			        if (WRITE_MODE0 = "10") then
			    	    i := 0;
					    while(i < data_width_t1) loop
			   	            bpa_reg_async(i) <= ram_MEM((conv_integer(addr_a)+i));
				            i := i+1;
					    end loop;
				    end if;

				elsif(WREA = '0') then
					i := 0;
					while(i < BIT_WIDTH_0) loop
						bpa_reg_async(i) <= ram_MEM((conv_integer(addr_a)+i));
						i := i+1;
					end loop;
			    end if;
		    end if;
	    end if;

	    -------------port B----------------------
	    if RESETB='1' then
		    bpb_reg_async <=(others=>'0');
	    elsif CLKB'event and CLKB='1' then
		    if (pceb='1') then
			    if(WREB='1') then
				    if (WRITE_MODE1 = "01") then
                        i := 0;
					    while(i < data_width_t2) loop
						    bpb_reg_async(i) <= ram_MEM((conv_integer(addr_b)+i));
						    i := i+1;
					    end loop;

                        if (BIT_WIDTH_1 = 9) then
					        bpb_reg_async(8 downto 0) <= DIB(8 downto 0);
                        elsif(BIT_WIDTH_1 = 18) then
                            if(ADB(0) = '1') then
						        bpb_reg_async(8 downto 0) <= DIB(8 downto 0);
                            end if;
                            if(ADB(1) = '1') then
						        bpb_reg_async(17 downto 9) <= DIB(17 downto 9);
                            end if;
                        end if;
				    end if;
				    if (WRITE_MODE1 = "10") then
					    i := 0;
					    while(i < data_width_t2) loop
						    bpb_reg_async(i) <= ram_MEM((conv_integer(addr_b)+i));
						    i := i+1;
					    end loop;
				    end if;
				
				elsif(WREB = '0') then
					i := 0;
					while(i < BIT_WIDTH_1) loop
						bpb_reg_async(i) <= ram_MEM((conv_integer(addr_b)+i));
						i := i+1;
					end loop;
			    end if;
			end if;
	    end if;
	end process;

    process (CLKA,CLKB)
	variable i : integer :=0;
    begin
	-----------port A-----------------------		
	    if CLKA'event and CLKA='1' then
	        if RESETA='1' then
			    bpa_reg_sync <= (others=>'0');
		    elsif (pcea='1') then
		        if (WREA='1') then
			        if (WRITE_MODE0 = "01") then
                        i := 0;
					    while(i < data_width_t1) loop
			   	            bpa_reg_sync(i) <= ram_MEM((conv_integer(addr_a)+i));
				            i := i+1;
					    end loop;

                        if (BIT_WIDTH_0 = 9) then
					        bpa_reg_sync(8 downto 0) <= DIA(8 downto 0);
                        elsif(BIT_WIDTH_0 = 18) then
                            if(ADA(0) = '1') then
						        bpa_reg_sync(8 downto 0) <= DIA(8 downto 0);
                            end if;
                            if(ADA(1) = '1') then
						        bpa_reg_sync(17 downto 9) <= DIA(17 downto 9);
                            end if;
                        end if;
			        end if;
			        if (WRITE_MODE0 = "10") then
			    	    i := 0;
					    while(i < data_width_t1) loop
			   	            bpa_reg_sync(i) <= ram_MEM((conv_integer(addr_a)+i));
				            i := i+1;
					    end loop;
				    end if;

				elsif(WREA = '0') then
					i := 0;
					while(i < BIT_WIDTH_0) loop
						bpa_reg_sync(i) <= ram_MEM((conv_integer(addr_a)+i));
						i := i+1;
					end loop;
			    end if;
		    end if;
	    end if;

	    -------------port B----------------------
	    if CLKB'event and CLKB='1' then
	        if RESETB='1' then
		        bpb_reg_sync <=(others=>'0');
		    elsif (pceb='1') then
			    if(WREB='1') then
				    if (WRITE_MODE1 = "01") then
                        i := 0;
					    while(i < data_width_t2) loop
						    bpb_reg_sync(i) <= ram_MEM((conv_integer(addr_b)+i));
						    i := i+1;
					    end loop;

                        if (BIT_WIDTH_1 = 9) then
					        bpb_reg_sync(8 downto 0) <= DIB(8 downto 0);
                        elsif(BIT_WIDTH_1 = 18) then
                            if(ADB(0) = '1') then
						        bpb_reg_sync(8 downto 0) <= DIB(8 downto 0);
                            end if;
                            if(ADB(1) = '1') then
						        bpb_reg_sync(17 downto 9) <= DIB(17 downto 9);
                            end if;
                        end if;
				    end if;
				    if (WRITE_MODE1 = "10") then
					    i := 0;
					    while(i < data_width_t2) loop
						    bpb_reg_sync(i) <= ram_MEM((conv_integer(addr_b)+i));
						    i := i+1;
					    end loop;
				    end if;
				
				elsif(WREB = '0') then
					i := 0;
					while(i < BIT_WIDTH_1) loop
						bpb_reg_sync(i) <= ram_MEM((conv_integer(addr_b)+i));
						i := i+1;
					end loop;
			    end if;
			end if;
	    end if;
	end process;

    process (CLKA,CLKB,RESETA,RESETB)
    begin
	    if RESETA='1' then
			pla_reg_async <=(others=>'0');
	    elsif CLKA'event and CLKA='1' then
		    if(OCEA = '1') then
		        pla_reg_async <= bpa_reg;
	        end if;
	    end if;

	    if RESETB='1' then
		    plb_reg_async <=(others=>'0');
	    elsif CLKB'event and CLKB='1' then
		    if(OCEB = '1') then
		        plb_reg_async <= bpb_reg;
	        end if;
		end if;
	end process;

    process (CLKA,CLKB)
    begin
	    if CLKA'event and CLKA='1' then
	        if RESETA='1' then
			    pla_reg_sync <=(others=>'0');
		    elsif(OCEA = '1') then
		        pla_reg_sync <= bpa_reg;
	        end if;
	    end if;

	    if CLKB'event and CLKB='1' then
	        if RESETB='1' then
		        plb_reg_sync <=(others=>'0');
		    elsif(OCEB = '1') then
		        plb_reg_sync <= bpb_reg;
	        end if;
		end if;
	end process;
    
end Behavioral;

----------------------------------rSDP---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity rSDP is
    GENERIC ( 
	    BIT_WIDTH_0 : integer :=16; -- 1, 2, 4, 8, 16, 32
	    BIT_WIDTH_1 : integer :=16; -- 1, 2, 4, 8, 16, 32
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    BLK_SEL : bit_vector := "000";
        RESET_MODE : string := "SYNC"; --SYNC, ASYNC
	    INIT_RAM_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"    
    
    );
    PORT (
	    DO : out std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	    CLKA,CLKB, CEA,CEB,OCE,RESETA,RESETB : in std_logic;
	    ADA,ADB : in std_logic_vector(13 downto 0);
        BLKSEL : in std_logic_vector(2 downto 0);
	    DI : in std_logic_vector(31 downto 0)
    );
end rSDP;

architecture Behavioral of rSDP is
	signal bp_reg,bp_reg_async,bp_reg_sync : std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	signal pl_reg,pl_reg_async,pl_reg_sync : std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	signal ram_MEM : std_logic_vector(16383 downto 0):=TO_StdLogicVector(INIT_RAM_3F & INIT_RAM_3E & INIT_RAM_3D & INIT_RAM_3C &INIT_RAM_3B & INIT_RAM_3A & INIT_RAM_39 & INIT_RAM_38 &INIT_RAM_37 & INIT_RAM_36 & INIT_RAM_35 & INIT_RAM_34 &INIT_RAM_33 & INIT_RAM_32 & INIT_RAM_31 & INIT_RAM_30 &INIT_RAM_2F & INIT_RAM_2E & INIT_RAM_2D & INIT_RAM_2C &INIT_RAM_2B & INIT_RAM_2A & INIT_RAM_29 & INIT_RAM_28 &INIT_RAM_27 & INIT_RAM_26 & INIT_RAM_25 & INIT_RAM_24 &INIT_RAM_23 & INIT_RAM_22 & INIT_RAM_21 & INIT_RAM_20 &INIT_RAM_1F & INIT_RAM_1E & INIT_RAM_1D & INIT_RAM_1C &INIT_RAM_1B & INIT_RAM_1A & INIT_RAM_19 & INIT_RAM_18 &INIT_RAM_17 & INIT_RAM_16 & INIT_RAM_15 & INIT_RAM_14 &INIT_RAM_13 & INIT_RAM_12 & INIT_RAM_11 & INIT_RAM_10 &INIT_RAM_0F & INIT_RAM_0E & INIT_RAM_0D & INIT_RAM_0C & INIT_RAM_0B & INIT_RAM_0A & INIT_RAM_09 & INIT_RAM_08 &INIT_RAM_07 & INIT_RAM_06 & INIT_RAM_05 & INIT_RAM_04 &INIT_RAM_03 & INIT_RAM_02 & INIT_RAM_01 & INIT_RAM_00);
	signal data_width_t1,data_width_t2,addr_width_a,addr_width_b : integer:=0;
	signal mc : std_logic := '0';
	signal bs_en : std_logic;
	signal pcea,pceb : std_logic;
	signal addr_a,addr_b : std_logic_vector(13 downto 0):=conv_std_logic_vector(0,14);

begin
	data_width_t1 <= BIT_WIDTH_0;
	data_width_t2 <= BIT_WIDTH_1;
	
	for_addr:for k in 0 to 13 generate
	begin
			addr_a(k)<= '0' when (k<(14-addr_width_a)) else ADA(k);
			addr_b(k)<= '0' when (k<(14-addr_width_b)) else ADB(k);
	end generate for_addr;
	
	process (data_width_t1,data_width_t2)
	begin
		case (data_width_t1) is
			when 1=> addr_width_a<=14;
			when 2=> addr_width_a<=13;
			when 4=> addr_width_a<=12;
			when 8=> addr_width_a<=11;
			when 16=> addr_width_a<=10;
			when 32=> addr_width_a<=9;
			when others=>addr_width_a<=0;
		end case;
		case (data_width_t2) is
			when 1=> addr_width_b<=14;
			when 2=> addr_width_b<=13;
			when 4=> addr_width_b<=12;
			when 8=> addr_width_b<=11;
			when 16=> addr_width_b<=10;
			when 32=> addr_width_b<=9;
			when others=>addr_width_b<=0;
		end case;
	end process;

	DO <= bp_reg when (READ_MODE = '0') else pl_reg;
	
	pcea <= CEA and bs_en;
	pceb <= CEB and bs_en;
	process(BLKSEL)
	begin
		if(BLKSEL = TO_STDLOGICVECTOR(BLK_SEL)) then
			bs_en <= '1';
		else 
			bs_en <= '0';
		end if;

	end process;
	
    process (bp_reg_async,bp_reg_sync,pl_reg_async,pl_reg_sync) 
    begin
        if(RESET_MODE = "ASYNC") then
            bp_reg <= bp_reg_async;
            pl_reg <= pl_reg_async;
        else 
            bp_reg <= bp_reg_sync;
            pl_reg <= pl_reg_sync;
        end if;
    end process;

	process (CLKA)
	variable i : integer :=0;
	begin					    
	    if (CLKA'event and CLKA='1') then
		    if (pcea='1') then
			    if((data_width_t1=1) or (data_width_t1=2) or (data_width_t1=4) or (data_width_t1=8)) then
			        i := 0;
			        while(i < data_width_t1) loop
				        ram_MEM((conv_integer(addr_a)+i))<= DI(i);
				        i := i+1;
			        end loop;
		        elsif(data_width_t1=16) then
				    if (ADA(0)='1') then
					    i := 0;
					    while (i < 8) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    end if;
				    if(ADA(1)='1') then
					    i := 8;
					    while ((i >= 8) and (i<16)) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    end if;
		        elsif(data_width_t1=32) then
				    if (ADA(0)='1') then
					    i := 0;
					    while (i < 8) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    end if;
				    if(ADA(1)='1') then
					    i := 8;
					    while ((i >= 8) and (i<16)) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    end if;
				    if(ADA(2)='1') then
					    i := 16;
					    while ((i >= 16) and (i<24)) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
			        end if;
				    if(ADA(3)='1') then
				    	i := 24;
					    while ((i >= 24) and (i<32)) loop
					    	ram_MEM((conv_integer(addr_a)+i))<= DI(i);
					    	i := i+1;
				    	end loop;
			        end if;
		        end if;
		        mc <= (not mc);
	        end if;
	    end if;
	end process;

	process (CLKB,RESETB)
	variable i : integer :=0;
	begin
		if RESETB='1' then
			bp_reg_async <= (others=>'0');
		elsif CLKB'event and CLKB='1' then
			if (pceb='1') then
				i := 0;
				while(i < data_width_t2) loop
					bp_reg_async(i) <= ram_MEM((conv_integer(addr_b)+i));
					i := i+1;
				end loop;
			end if;
		end if;
	end process;

    process (CLKB)
	variable i : integer :=0;
	begin
		if CLKB'event and CLKB='1' then
		    if RESETB='1' then
			    bp_reg_sync <= (others=>'0');
			elsif (pceb='1') then
				i := 0;
				while(i < data_width_t2) loop
					bp_reg_sync(i) <= ram_MEM((conv_integer(addr_b)+i));
					i := i+1;
				end loop;
			end if;
		end if;
	end process;

    process (CLKB,RESETB)
	begin
		if RESETB='1' then
			pl_reg_async <= (others=>'0');
		elsif CLKB'event and CLKB='1' then
			if(OCE = '1') then
				pl_reg_async <= bp_reg;
			end if;
		end if;
	end process;

    process (CLKB,RESETB)
	variable i : integer :=0;
	begin
		if CLKB'event and CLKB='1' then
		    if RESETB='1' then
			    pl_reg_sync <= (others=>'0');
			elsif(OCE = '1') then
				pl_reg_sync <= bp_reg;
			end if;
		end if;
	end process;

end Behavioral;

----------------------------------rSDPX9---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity rSDPX9 is
    GENERIC ( 
	    BIT_WIDTH_0 : integer :=18; -- 9, 18, 36
	    BIT_WIDTH_1 : integer :=18; -- 9, 18, 36
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    BLK_SEL : bit_vector := "000";
        RESET_MODE : string := "SYNC"; --SYNC,ASYNC
	    INIT_RAM_00 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000"      
    );
    PORT (
	    DO : out std_logic_vector(35 downto 0):=conv_std_logic_vector(0,36);
	    CLKA,CLKB, CEA,CEB,OCE,RESETA,RESETB : in std_logic;
	    ADA,ADB : in std_logic_vector(13 downto 0);
    	BLKSEL : in std_logic_vector(2 downto 0);
	    DI : in std_logic_vector(35 downto 0)
    );
end rSDPX9;

architecture Behavioral of rSDPX9 is
	signal bp_reg,pl_reg,bp_reg_async,pl_reg_async,bp_reg_sync,pl_reg_sync : std_logic_vector(35 downto 0) := conv_std_logic_vector(0, 36);
	signal ram_MEM : std_logic_vector(18431 downto 0):= TO_StdLogicVector(INIT_RAM_3F & INIT_RAM_3E & INIT_RAM_3D & INIT_RAM_3C &INIT_RAM_3B & INIT_RAM_3A & INIT_RAM_39 & INIT_RAM_38 &INIT_RAM_37 & INIT_RAM_36 & INIT_RAM_35 & INIT_RAM_34 &INIT_RAM_33 & INIT_RAM_32 & INIT_RAM_31 & INIT_RAM_30 &INIT_RAM_2F & INIT_RAM_2E & INIT_RAM_2D & INIT_RAM_2C &INIT_RAM_2B & INIT_RAM_2A & INIT_RAM_29 & INIT_RAM_28 &INIT_RAM_27 & INIT_RAM_26 & INIT_RAM_25 & INIT_RAM_24 &INIT_RAM_23 & INIT_RAM_22 & INIT_RAM_21 & INIT_RAM_20 &INIT_RAM_1F & INIT_RAM_1E & INIT_RAM_1D & INIT_RAM_1C &INIT_RAM_1B & INIT_RAM_1A & INIT_RAM_19 & INIT_RAM_18 &INIT_RAM_17 & INIT_RAM_16 & INIT_RAM_15 & INIT_RAM_14 &INIT_RAM_13 & INIT_RAM_12 & INIT_RAM_11 & INIT_RAM_10 &INIT_RAM_0F & INIT_RAM_0E & INIT_RAM_0D & INIT_RAM_0C & INIT_RAM_0B & INIT_RAM_0A & INIT_RAM_09 & INIT_RAM_08 &INIT_RAM_07 & INIT_RAM_06 & INIT_RAM_05 & INIT_RAM_04 &INIT_RAM_03 & INIT_RAM_02 & INIT_RAM_01 & INIT_RAM_00);
	signal data_width_t1,data_width_t2,addr_width_a,addr_width_b : integer:=0;
	signal addr_a,addr_b : std_logic_vector(14 downto 0):=conv_std_logic_vector(0,15);
	signal mc : std_logic := '0';
	signal bs_en : std_logic;
	signal pcea,pceb : std_logic;
	
begin

	data_width_t1 <= BIT_WIDTH_0;
	data_width_t2 <= BIT_WIDTH_1;

	addr_a <= conv_std_logic_vector(conv_integer(ADA(13 downto (14-addr_width_a)))*data_width_t1,15);
	addr_b <= conv_std_logic_vector(conv_integer(ADB(13 downto (14-addr_width_b)))*data_width_t2,15);

	process (data_width_t1,data_width_t2)
	begin
		case (data_width_t1) is
			when 9=> addr_width_a<=11;
			when 18=> addr_width_a<=10;
			when 36=> addr_width_a<=9;
			when others=>addr_width_a<=0;
		end case;
		case (data_width_t2) is
			when 9=> addr_width_b<=11;
			when 18=> addr_width_b<=10;
			when 36=> addr_width_b<=9;
			when others=>addr_width_b<=0;
		end case;
	end process;

	DO <= bp_reg when (READ_MODE = '0') else pl_reg;
	
	pcea <= CEA and bs_en;
	pceb <= CEB and bs_en;
	process(BLKSEL)
	begin
		if(BLKSEL = TO_STDLOGICVECTOR(BLK_SEL)) then
			bs_en <= '1';
		else
			bs_en <= '0';
		end if;
	end process;

    process (bp_reg_async,bp_reg_sync,pl_reg_async,pl_reg_sync) 
    begin
        if(RESET_MODE = "ASYNC") then
            bp_reg <= bp_reg_async;
            pl_reg <= pl_reg_async;
        else 
            bp_reg <= bp_reg_sync;
            pl_reg <= pl_reg_sync;
        end if;
    end process;
	
	process (CLKA)
	variable i : integer :=0;
	begin
	    if CLKA'event and CLKA='1' then
		    if (pcea='1') then
		        if(data_width_t1=9) then
				    i := 0;
				    while(i < data_width_t1) loop
					    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
					    i := i+1;
				    end loop;
			    elsif(data_width_t1=18) then
				    if (ADA(0)='1') then
					    i := 0;
					    while (i < 9) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    end if;
				    if(ADA(1)='1') then
					    i := 9;
					    while ((i >= 9) and (i < 18)) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    end if;
			    elsif(data_width_t1=36) then
				    if (ADA(0)='1') then
					    i := 0;
					    while (i < 9) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    end if;
			    	if(ADA(1)='1') then
					    i := 9;
					    while ((i >= 9) and (i < 18)) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
				    	end loop;
			    	end if;
				    if(ADA(2)='1') then
					    i := 18;
					    while ((i >= 18) and (i<27)) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
			        end if;
				    if(ADA(3)='1') then
					    i := 27;
					    while ((i >= 27) and (i<36)) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    end if;
			    end if;
			mc <= (not mc);
            end if;
	    end if;
	end process;

	process (CLKB,RESETB)
	variable i : integer :=0;
	begin
		if RESETB='1' then
			bp_reg_async <= (others=>'0');
		elsif CLKB'event and CLKB='1' then
			if (pceb='1') then
				i := 0;
				while(i < data_width_t2) loop
					bp_reg_async(i) <= ram_MEM((conv_integer(addr_b)+i));
					i := i+1;
				end loop;
			end if;
		end if;
	end process;

    process (CLKB)
	variable i : integer :=0;
	begin
		if CLKB'event and CLKB='1' then
		    if RESETB='1' then
			    bp_reg_sync <= (others=>'0');
			elsif (pceb='1') then
				i := 0;
				while(i < data_width_t2) loop
					bp_reg_sync(i) <= ram_MEM((conv_integer(addr_b)+i));
					i := i+1;
				end loop;
			end if;
		end if;
	end process;

    process (CLKB,RESETB)
	begin
		if RESETB='1' then
			pl_reg_async <= (others=>'0');
		elsif CLKB'event and CLKB='1' then
			if(OCE = '1') then
				pl_reg_async <= bp_reg;
			end if;
		end if;
	end process;

    process (CLKB)
	begin
		if CLKB'event and CLKB='1' then
		    if RESETB='1' then
			    pl_reg_sync <= (others=>'0');
			elsif(OCE = '1') then
				pl_reg_sync <= bp_reg;
			end if;			
		end if;
	end process;

end Behavioral;

-----------------------rROM----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity rROM is
    GENERIC ( 
	    BIT_WIDTH : integer :=1; -- 1, 2, 4, 8, 16, 32	
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
    	BLK_SEL : bit_vector := "000"; 
        RESET_MODE : string := "SYNC"; --SYNC, ASYNC
	    INIT_RAM_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"        
    );
    PORT (
	    DO : out std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	    CLK, CE,OCE,RESET : in std_logic;
    	BLKSEL : in std_logic_vector(2 downto 0);
	    AD : in std_logic_vector(13 downto 0)
    );
end rROM;

architecture Behavioral of rROM is
	signal bp_reg,pl_reg,bp_reg_async,pl_reg_async,bp_reg_sync,pl_reg_sync : std_logic_vector(31 downto 0):= conv_std_logic_vector(0,32);
	signal ram_MEM : std_logic_vector(16383 downto 0):=TO_StdLogicVector(INIT_RAM_3F & INIT_RAM_3E & INIT_RAM_3D & INIT_RAM_3C &INIT_RAM_3B & INIT_RAM_3A & INIT_RAM_39 & INIT_RAM_38 &INIT_RAM_37 & INIT_RAM_36 & INIT_RAM_35 & INIT_RAM_34 &INIT_RAM_33 & INIT_RAM_32 & INIT_RAM_31 & INIT_RAM_30 &INIT_RAM_2F & INIT_RAM_2E & INIT_RAM_2D & INIT_RAM_2C &INIT_RAM_2B & INIT_RAM_2A & INIT_RAM_29 & INIT_RAM_28 &INIT_RAM_27 & INIT_RAM_26 & INIT_RAM_25 & INIT_RAM_24 &INIT_RAM_23 & INIT_RAM_22 & INIT_RAM_21 & INIT_RAM_20 &INIT_RAM_1F & INIT_RAM_1E & INIT_RAM_1D & INIT_RAM_1C &INIT_RAM_1B & INIT_RAM_1A & INIT_RAM_19 & INIT_RAM_18 &INIT_RAM_17 & INIT_RAM_16 & INIT_RAM_15 & INIT_RAM_14 &INIT_RAM_13 & INIT_RAM_12 & INIT_RAM_11 & INIT_RAM_10 &INIT_RAM_0F & INIT_RAM_0E & INIT_RAM_0D & INIT_RAM_0C & INIT_RAM_0B & INIT_RAM_0A & INIT_RAM_09 & INIT_RAM_08 &INIT_RAM_07 & INIT_RAM_06 & INIT_RAM_05 & INIT_RAM_04 &INIT_RAM_03 & INIT_RAM_02 & INIT_RAM_01 & INIT_RAM_00);
	signal data_width_t,addr_width : integer:=0;
	signal bs_en : std_logic;
	signal pce : std_logic;
	signal addr : std_logic_vector(13 downto 0):=conv_std_logic_vector(0,14);
begin

	data_width_t <= BIT_WIDTH;
	for_addr:for k in 0 to 13 generate
	begin
		addr(k)<= '0' when (k<(14-addr_width)) else AD(k);
	end generate for_addr;
	process (data_width_t)
	begin
		case (data_width_t) is
			when 1=> addr_width<=14;
			when 2=> addr_width<=13;
			when 4=> addr_width<=12;
			when 8=> addr_width<=11;
			when 16=> addr_width<=10;
			when 32=> addr_width<=9;
			when others=>addr_width<=0;
		end case;
	end process;

	DO <= bp_reg when(READ_MODE = '0') else pl_reg;
	
	pce <= CE and bs_en;
	process(BLKSEL)
	begin
		if(BLKSEL = TO_STDLOGICVECTOR(BLK_SEL)) then
			bs_en <= '1';
		else 
			bs_en <= '0';
		end if;
	end process;

    process (bp_reg_async,bp_reg_sync,pl_reg_async,pl_reg_sync) 
    begin
        if(RESET_MODE = "ASYNC") then
            bp_reg <= bp_reg_async;
            pl_reg <= pl_reg_async;
        else 
            bp_reg <= bp_reg_sync;
            pl_reg <= pl_reg_sync;
        end if;
    end process;

	process (CLK,RESET)
	variable i : integer :=0;
	begin
		if RESET='1' then
			bp_reg_async <= (others=>'0');
		elsif CLK'event and CLK='1' then
			if(pce='1') then
				i := 0;
				while(i < data_width_t) loop
					bp_reg_async(i) <= ram_MEM((conv_integer(addr)+i));
					i := i+1;
				end loop;
		    end if;
		end if;
	end process;

    process (CLK)
	variable i : integer :=0;
	begin
		if CLK'event and CLK='1' then
		    if RESET='1' then
			    bp_reg_sync <= (others=>'0');
		    elsif(pce='1') then
				i := 0;
				while(i < data_width_t) loop
					bp_reg_sync(i) <= ram_MEM((conv_integer(addr)+i));
					i := i+1;
				end loop;
		    end if;
		end if;
	end process;

    process (CLK,RESET)
	begin
		if RESET='1' then
			pl_reg_async <= (others=>'0');
		elsif CLK'event and CLK='1' then
			if OCE='1' then
				pl_reg_async <= bp_reg;
			end if;
		end if;
	end process;

    process (CLK)
	begin
		if CLK'event and CLK='1' then
		    if RESET='1' then
			    pl_reg_sync <= (others=>'0');
		    elsif OCE='1' then
				pl_reg_sync <= bp_reg;
			end if;
		end if;
	end process;

end Behavioral;

------------------------------rROMX9 ---------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity rROMX9 is
    GENERIC ( 
    	BIT_WIDTH : integer :=9; -- 9, 18, 36
   	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
    	BLK_SEL : bit_vector := "000"; 
        RESET_MODE : string := "SYNC"; --SYNC, ASYNC
        INIT_RAM_00 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000"     

    );
    PORT (
	    DO : out std_logic_vector(35 downto 0):=conv_std_logic_vector(0,36);
	    CLK, CE,OCE,RESET : in std_logic;
    	BLKSEL : in std_logic_vector(2 downto 0);
	    AD : in std_logic_vector(13 downto 0)
    );
end rROMX9;

architecture Behavioral of rROMX9 is
	signal bp_reg,pl_reg,bp_reg_async,pl_reg_async,bp_reg_sync,pl_reg_sync : std_logic_vector(35 downto 0) := conv_std_logic_vector(0,36);
	signal ram_MEM : std_logic_vector(18431 downto 0):=TO_StdLogicVector(INIT_RAM_3F & INIT_RAM_3E & INIT_RAM_3D & INIT_RAM_3C &INIT_RAM_3B & INIT_RAM_3A & INIT_RAM_39 & INIT_RAM_38 &INIT_RAM_37 & INIT_RAM_36 & INIT_RAM_35 & INIT_RAM_34 &INIT_RAM_33 & INIT_RAM_32 & INIT_RAM_31 & INIT_RAM_30 &INIT_RAM_2F & INIT_RAM_2E & INIT_RAM_2D & INIT_RAM_2C &INIT_RAM_2B & INIT_RAM_2A & INIT_RAM_29 & INIT_RAM_28 &INIT_RAM_27 & INIT_RAM_26 & INIT_RAM_25 & INIT_RAM_24 &INIT_RAM_23 & INIT_RAM_22 & INIT_RAM_21 & INIT_RAM_20 &INIT_RAM_1F & INIT_RAM_1E & INIT_RAM_1D & INIT_RAM_1C &INIT_RAM_1B & INIT_RAM_1A & INIT_RAM_19 & INIT_RAM_18 &INIT_RAM_17 & INIT_RAM_16 & INIT_RAM_15 & INIT_RAM_14 &INIT_RAM_13 & INIT_RAM_12 & INIT_RAM_11 & INIT_RAM_10 &INIT_RAM_0F & INIT_RAM_0E & INIT_RAM_0D & INIT_RAM_0C & INIT_RAM_0B & INIT_RAM_0A & INIT_RAM_09 & INIT_RAM_08 &INIT_RAM_07 & INIT_RAM_06 & INIT_RAM_05 & INIT_RAM_04 &INIT_RAM_03 & INIT_RAM_02 & INIT_RAM_01 & INIT_RAM_00);	
	signal data_width_t,addr_width : integer:=0;
	signal bs_en : std_logic;
	signal pce : std_logic;
	signal addr : std_logic_vector(14 downto 0):=conv_std_logic_vector(0,15);
begin

	data_width_t <= BIT_WIDTH;
	addr <= conv_std_logic_vector(conv_integer(AD(13 downto (14-addr_width)))*data_width_t,15);

	process (data_width_t)
	begin
		case (data_width_t) is
			when 9=> addr_width<=11;
			when 18=> addr_width<=10;
			when 36=> addr_width<=9;
			when others=>addr_width<=0;
		end case;
	end process;

	DO <= bp_reg when(READ_MODE = '0') else pl_reg;
	
	pce <= CE and bs_en;
	process(BLKSEL)
	begin
		if(BLKSEL = TO_STDLOGICVECTOR(BLK_SEL)) then
			bs_en <= '1';
		else 
			bs_en <= '0';
		end if;
	end process;

    process (bp_reg_async,bp_reg_sync,pl_reg_async,pl_reg_sync) 
    begin
        if(RESET_MODE = "ASYNC") then
            bp_reg <= bp_reg_async;
            pl_reg <= pl_reg_async;
        else 
            bp_reg <= bp_reg_sync;
            pl_reg <= pl_reg_sync;
        end if;
    end process;

	process (CLK,RESET)
	variable i : integer :=0;
	begin
		if RESET='1' then
			bp_reg_async <= (others=>'0');
		elsif CLK'event and CLK='1' then
			if(pce='1')then
				i := 0;
				while(i < data_width_t) loop
					bp_reg_async(i) <= ram_MEM((conv_integer(addr)+i));
					i := i+1;
				end loop;
		    end if;
		end if;
	end process;

    process (CLK)
	variable i : integer :=0;
	begin
		if CLK'event and CLK='1' then
		    if RESET='1' then
			    bp_reg_sync <= (others=>'0');
			elsif(pce='1')then
				i := 0;
				while(i < data_width_t) loop
					bp_reg_sync(i) <= ram_MEM((conv_integer(addr)+i));
					i := i+1;
				end loop;
		    end if;
		end if;
	end process;

    process (CLK,RESET)
	begin
		if RESET='1' then
			pl_reg_async <= (others=>'0');
		elsif CLK'event and CLK='1' then
			if(OCE = '1') then
				pl_reg_async <= bp_reg;
			end if;
		end if;
	end process;

    process (CLK)
	begin
		if CLK'event and CLK='1' then
		    if RESET='1' then
			    pl_reg_sync <= (others=>'0');
			elsif(OCE = '1') then
				pl_reg_sync <= bp_reg;
			end if;			
		end if;
	end process;

end Behavioral;

-----------------------pROM----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pROM is
    GENERIC ( 
	    BIT_WIDTH : integer :=1; -- 1, 2, 4, 8, 16, 32	
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
        RESET_MODE : string := "SYNC"; --SYNC, ASYNC
	    INIT_RAM_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"        
    );
    PORT (
	    DO : out std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	    CLK, CE,OCE,RESET : in std_logic;
	    AD : in std_logic_vector(13 downto 0)
    );
end pROM;

architecture Behavioral of pROM is
	signal bp_reg,pl_reg,bp_reg_async,pl_reg_async,bp_reg_sync,pl_reg_sync : std_logic_vector(31 downto 0):= conv_std_logic_vector(0,32);
	signal ram_MEM : std_logic_vector(16383 downto 0):=TO_StdLogicVector(INIT_RAM_3F & INIT_RAM_3E & INIT_RAM_3D & INIT_RAM_3C &INIT_RAM_3B & INIT_RAM_3A & INIT_RAM_39 & INIT_RAM_38 &INIT_RAM_37 & INIT_RAM_36 & INIT_RAM_35 & INIT_RAM_34 &INIT_RAM_33 & INIT_RAM_32 & INIT_RAM_31 & INIT_RAM_30 &INIT_RAM_2F & INIT_RAM_2E & INIT_RAM_2D & INIT_RAM_2C &INIT_RAM_2B & INIT_RAM_2A & INIT_RAM_29 & INIT_RAM_28 &INIT_RAM_27 & INIT_RAM_26 & INIT_RAM_25 & INIT_RAM_24 &INIT_RAM_23 & INIT_RAM_22 & INIT_RAM_21 & INIT_RAM_20 &INIT_RAM_1F & INIT_RAM_1E & INIT_RAM_1D & INIT_RAM_1C &INIT_RAM_1B & INIT_RAM_1A & INIT_RAM_19 & INIT_RAM_18 &INIT_RAM_17 & INIT_RAM_16 & INIT_RAM_15 & INIT_RAM_14 &INIT_RAM_13 & INIT_RAM_12 & INIT_RAM_11 & INIT_RAM_10 &INIT_RAM_0F & INIT_RAM_0E & INIT_RAM_0D & INIT_RAM_0C & INIT_RAM_0B & INIT_RAM_0A & INIT_RAM_09 & INIT_RAM_08 &INIT_RAM_07 & INIT_RAM_06 & INIT_RAM_05 & INIT_RAM_04 &INIT_RAM_03 & INIT_RAM_02 & INIT_RAM_01 & INIT_RAM_00);
	signal data_width_t,addr_width : integer:=0;
	signal addr : std_logic_vector(13 downto 0):=conv_std_logic_vector(0,14);
begin

	data_width_t <= BIT_WIDTH;
	for_addr:for k in 0 to 13 generate
	begin
		addr(k)<= '0' when (k<(14-addr_width)) else AD(k);
	end generate for_addr;
	process (data_width_t)
	begin
		case (data_width_t) is
			when 1=> addr_width<=14;
			when 2=> addr_width<=13;
			when 4=> addr_width<=12;
			when 8=> addr_width<=11;
			when 16=> addr_width<=10;
			when 32=> addr_width<=9;
			when others=>addr_width<=0;
		end case;
	end process;

	DO <= bp_reg when(READ_MODE = '0') else pl_reg;
	
	process (bp_reg_async,bp_reg_sync,pl_reg_async,pl_reg_sync) 
    begin
        if(RESET_MODE = "ASYNC") then
            bp_reg <= bp_reg_async;
            pl_reg <= pl_reg_async;
        else 
            bp_reg <= bp_reg_sync;
            pl_reg <= pl_reg_sync;
        end if;
    end process;

	process (CLK,RESET)
	variable i : integer :=0;
	begin
		if RESET='1' then
			bp_reg_async <= (others=>'0');
		elsif CLK'event and CLK='1' then
			if(CE = '1') then
				i := 0;
				while(i < data_width_t) loop
					bp_reg_async(i) <= ram_MEM((conv_integer(addr)+i));
					i := i+1;
				end loop;
		    end if;
		end if;
	end process;

    process (CLK)
	variable i : integer :=0;
	begin
		if CLK'event and CLK='1' then
		    if RESET='1' then
			    bp_reg_sync <= (others=>'0');
		    elsif(CE = '1') then
				i := 0;
				while(i < data_width_t) loop
					bp_reg_sync(i) <= ram_MEM((conv_integer(addr)+i));
					i := i+1;
				end loop;
		    end if;
		end if;
	end process;

    process (CLK,RESET)
	begin
		if RESET='1' then
			pl_reg_async <= (others=>'0');
		elsif CLK'event and CLK='1' then
			if OCE='1' then
				pl_reg_async <= bp_reg;
			end if;
		end if;
	end process;

    process (CLK)
	begin
		if CLK'event and CLK='1' then
		    if RESET='1' then
			    pl_reg_sync <= (others=>'0');
		    elsif OCE='1' then
				pl_reg_sync <= bp_reg;
			end if;
		end if;
	end process;

end Behavioral;

------------------------------pROMX9 ---------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pROMX9 is
    GENERIC ( 
    	BIT_WIDTH : integer :=9; -- 9, 18, 36
   	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
        RESET_MODE : string := "SYNC"; --SYNC, ASYNC
        INIT_RAM_00 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000"     

    );
    PORT (
	    DO : out std_logic_vector(35 downto 0):=conv_std_logic_vector(0,36);
	    CLK, CE,OCE,RESET : in std_logic;
	    AD : in std_logic_vector(13 downto 0)
    );
end pROMX9;

architecture Behavioral of pROMX9 is
	signal bp_reg,pl_reg,bp_reg_async,pl_reg_async,bp_reg_sync,pl_reg_sync : std_logic_vector(35 downto 0) := conv_std_logic_vector(0,36);
	signal ram_MEM : std_logic_vector(18431 downto 0):=TO_StdLogicVector(INIT_RAM_3F & INIT_RAM_3E & INIT_RAM_3D & INIT_RAM_3C &INIT_RAM_3B & INIT_RAM_3A & INIT_RAM_39 & INIT_RAM_38 &INIT_RAM_37 & INIT_RAM_36 & INIT_RAM_35 & INIT_RAM_34 &INIT_RAM_33 & INIT_RAM_32 & INIT_RAM_31 & INIT_RAM_30 &INIT_RAM_2F & INIT_RAM_2E & INIT_RAM_2D & INIT_RAM_2C &INIT_RAM_2B & INIT_RAM_2A & INIT_RAM_29 & INIT_RAM_28 &INIT_RAM_27 & INIT_RAM_26 & INIT_RAM_25 & INIT_RAM_24 &INIT_RAM_23 & INIT_RAM_22 & INIT_RAM_21 & INIT_RAM_20 &INIT_RAM_1F & INIT_RAM_1E & INIT_RAM_1D & INIT_RAM_1C &INIT_RAM_1B & INIT_RAM_1A & INIT_RAM_19 & INIT_RAM_18 &INIT_RAM_17 & INIT_RAM_16 & INIT_RAM_15 & INIT_RAM_14 &INIT_RAM_13 & INIT_RAM_12 & INIT_RAM_11 & INIT_RAM_10 &INIT_RAM_0F & INIT_RAM_0E & INIT_RAM_0D & INIT_RAM_0C & INIT_RAM_0B & INIT_RAM_0A & INIT_RAM_09 & INIT_RAM_08 &INIT_RAM_07 & INIT_RAM_06 & INIT_RAM_05 & INIT_RAM_04 &INIT_RAM_03 & INIT_RAM_02 & INIT_RAM_01 & INIT_RAM_00);	
	signal data_width_t,addr_width : integer:=0;
	signal addr : std_logic_vector(14 downto 0):=conv_std_logic_vector(0,15);
begin

	data_width_t <= BIT_WIDTH;
	addr <= conv_std_logic_vector(conv_integer(AD(13 downto (14-addr_width)))*data_width_t,15);

	process (data_width_t)
	begin
		case (data_width_t) is
			when 9=> addr_width<=11;
			when 18=> addr_width<=10;
			when 36=> addr_width<=9;
			when others=>addr_width<=0;
		end case;
	end process;

	DO <= bp_reg when(READ_MODE = '0') else pl_reg;
	
	process (bp_reg_async,bp_reg_sync,pl_reg_async,pl_reg_sync) 
    begin
        if(RESET_MODE = "ASYNC") then
            bp_reg <= bp_reg_async;
            pl_reg <= pl_reg_async;
        else 
            bp_reg <= bp_reg_sync;
            pl_reg <= pl_reg_sync;
        end if;
    end process;

	process (CLK,RESET)
	variable i : integer :=0;
	begin
		if RESET='1' then
			bp_reg_async <= (others=>'0');
		elsif CLK'event and CLK='1' then
			if(CE = '1')then
				i := 0;
				while(i < data_width_t) loop
					bp_reg_async(i) <= ram_MEM((conv_integer(addr)+i));
					i := i+1;
				end loop;
		    end if;
		end if;
	end process;

    process (CLK)
	variable i : integer :=0;
	begin
		if CLK'event and CLK='1' then
		    if RESET='1' then
			    bp_reg_sync <= (others=>'0');
			elsif(CE = '1')then
				i := 0;
				while(i < data_width_t) loop
					bp_reg_sync(i) <= ram_MEM((conv_integer(addr)+i));
					i := i+1;
				end loop;
		    end if;
		end if;
	end process;

    process (CLK,RESET)
	begin
		if RESET='1' then
			pl_reg_async <= (others=>'0');
		elsif CLK'event and CLK='1' then
			if(OCE = '1') then
				pl_reg_async <= bp_reg;
			end if;
		end if;
	end process;

    process (CLK)
	begin
		if CLK'event and CLK='1' then
		    if RESET='1' then
			    pl_reg_sync <= (others=>'0');
			elsif(OCE = '1') then
				pl_reg_sync <= bp_reg;
			end if;			
		end if;
	end process;

end Behavioral;

----------------------------------SDPB---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SDPB is
    GENERIC ( 
	    BIT_WIDTH_0 : integer :=16; -- 1, 2, 4, 8, 16, 32
	    BIT_WIDTH_1 : integer :=16; -- 1, 2, 4, 8, 16, 32
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    BLK_SEL_0 : bit_vector := "000";
	    BLK_SEL_1 : bit_vector := "000";
        RESET_MODE : string := "SYNC"; --SYNC, ASYNC
	    INIT_RAM_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"    
    
    );
    PORT (
	    DO : out std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	    CLKA,CLKB, CEA,CEB,OCE,RESETA,RESETB : in std_logic;
	    ADA,ADB : in std_logic_vector(13 downto 0);
        BLKSELA, BLKSELB : in std_logic_vector(2 downto 0);
	    DI : in std_logic_vector(31 downto 0)
    );
end SDPB;

architecture Behavioral of SDPB is
	signal bp_reg,bp_reg_async,bp_reg_sync : std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	signal pl_reg,pl_reg_async,pl_reg_sync : std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	signal ram_MEM : std_logic_vector(16383 downto 0):=TO_StdLogicVector(INIT_RAM_3F & INIT_RAM_3E & INIT_RAM_3D & INIT_RAM_3C &INIT_RAM_3B & INIT_RAM_3A & INIT_RAM_39 & INIT_RAM_38 &INIT_RAM_37 & INIT_RAM_36 & INIT_RAM_35 & INIT_RAM_34 &INIT_RAM_33 & INIT_RAM_32 & INIT_RAM_31 & INIT_RAM_30 &INIT_RAM_2F & INIT_RAM_2E & INIT_RAM_2D & INIT_RAM_2C &INIT_RAM_2B & INIT_RAM_2A & INIT_RAM_29 & INIT_RAM_28 &INIT_RAM_27 & INIT_RAM_26 & INIT_RAM_25 & INIT_RAM_24 &INIT_RAM_23 & INIT_RAM_22 & INIT_RAM_21 & INIT_RAM_20 &INIT_RAM_1F & INIT_RAM_1E & INIT_RAM_1D & INIT_RAM_1C &INIT_RAM_1B & INIT_RAM_1A & INIT_RAM_19 & INIT_RAM_18 &INIT_RAM_17 & INIT_RAM_16 & INIT_RAM_15 & INIT_RAM_14 &INIT_RAM_13 & INIT_RAM_12 & INIT_RAM_11 & INIT_RAM_10 &INIT_RAM_0F & INIT_RAM_0E & INIT_RAM_0D & INIT_RAM_0C & INIT_RAM_0B & INIT_RAM_0A & INIT_RAM_09 & INIT_RAM_08 &INIT_RAM_07 & INIT_RAM_06 & INIT_RAM_05 & INIT_RAM_04 &INIT_RAM_03 & INIT_RAM_02 & INIT_RAM_01 & INIT_RAM_00);
	signal data_width_t1,data_width_t2,addr_width_a,addr_width_b : integer:=0;
	signal mc : std_logic := '0';
	signal bs_ena,bs_enb : std_logic;
	signal pcea,pceb : std_logic;
	signal addr_a,addr_b : std_logic_vector(13 downto 0):=conv_std_logic_vector(0,14);

begin
	data_width_t1 <= BIT_WIDTH_0;
	data_width_t2 <= BIT_WIDTH_1;
	
	for_addr:for k in 0 to 13 generate
	begin
			addr_a(k)<= '0' when (k<(14-addr_width_a)) else ADA(k);
			addr_b(k)<= '0' when (k<(14-addr_width_b)) else ADB(k);
	end generate for_addr;
	
	process (data_width_t1,data_width_t2)
	begin
		case (data_width_t1) is
			when 1=> addr_width_a<=14;
			when 2=> addr_width_a<=13;
			when 4=> addr_width_a<=12;
			when 8=> addr_width_a<=11;
			when 16=> addr_width_a<=10;
			when 32=> addr_width_a<=9;
			when others=>addr_width_a<=0;
		end case;
		case (data_width_t2) is
			when 1=> addr_width_b<=14;
			when 2=> addr_width_b<=13;
			when 4=> addr_width_b<=12;
			when 8=> addr_width_b<=11;
			when 16=> addr_width_b<=10;
			when 32=> addr_width_b<=9;
			when others=>addr_width_b<=0;
		end case;
	end process;

	DO <= bp_reg when (READ_MODE = '0') else pl_reg;
	
	pcea <= CEA and bs_ena;
	pceb <= CEB and bs_enb;
	process(BLKSELA, BLKSELB)
	begin
		if(BLKSELA = TO_STDLOGICVECTOR(BLK_SEL_0)) then
			bs_ena <= '1';
		else 
			bs_ena <= '0';
		end if;

        if(BLKSELB = TO_STDLOGICVECTOR(BLK_SEL_1)) then
			bs_enb <= '1';
		else 
			bs_enb <= '0';
		end if;

	end process;
	
    process (bp_reg_async,bp_reg_sync,pl_reg_async,pl_reg_sync) 
    begin
        if(RESET_MODE = "ASYNC") then
            bp_reg <= bp_reg_async;
            pl_reg <= pl_reg_async;
        else 
            bp_reg <= bp_reg_sync;
            pl_reg <= pl_reg_sync;
        end if;
    end process;

	process (CLKA)
	variable i : integer :=0;
	begin					    
	    if (CLKA'event and CLKA='1') then
		    if (pcea='1') then
			    if((data_width_t1=1) or (data_width_t1=2) or (data_width_t1=4) or (data_width_t1=8)) then
			        i := 0;
			        while(i < data_width_t1) loop
				        ram_MEM((conv_integer(addr_a)+i))<= DI(i);
				        i := i+1;
			        end loop;
		        elsif(data_width_t1=16) then
				    if (ADA(0)='1') then
					    i := 0;
					    while (i < 8) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    end if;
				    if(ADA(1)='1') then
					    i := 8;
					    while ((i >= 8) and (i<16)) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    end if;
		        elsif(data_width_t1=32) then
				    if (ADA(0)='1') then
					    i := 0;
					    while (i < 8) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    end if;
				    if(ADA(1)='1') then
					    i := 8;
					    while ((i >= 8) and (i<16)) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    end if;
				    if(ADA(2)='1') then
					    i := 16;
					    while ((i >= 16) and (i<24)) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
			        end if;
				    if(ADA(3)='1') then
				    	i := 24;
					    while ((i >= 24) and (i<32)) loop
					    	ram_MEM((conv_integer(addr_a)+i))<= DI(i);
					    	i := i+1;
				    	end loop;
			        end if;
		        end if;
		        mc <= (not mc);
	        end if;
	    end if;
	end process;

	process (CLKB,RESETB)
	variable i : integer :=0;
	begin
		if RESETB='1' then
			bp_reg_async <= (others=>'0');
		elsif CLKB'event and CLKB='1' then
			if (pceb='1') then
				i := 0;
				while(i < data_width_t2) loop
					bp_reg_async(i) <= ram_MEM((conv_integer(addr_b)+i));
					i := i+1;
				end loop;
			end if;
		end if;
	end process;

    process (CLKB)
	variable i : integer :=0;
	begin
		if CLKB'event and CLKB='1' then
		    if RESETB='1' then
			    bp_reg_sync <= (others=>'0');
			elsif (pceb='1') then
				i := 0;
				while(i < data_width_t2) loop
					bp_reg_sync(i) <= ram_MEM((conv_integer(addr_b)+i));
					i := i+1;
				end loop;
			end if;
		end if;
	end process;

    process (CLKB,RESETB)
	begin
		if RESETB='1' then
			pl_reg_async <= (others=>'0');
		elsif CLKB'event and CLKB='1' then
			if(OCE = '1') then
				pl_reg_async <= bp_reg;
			end if;
		end if;
	end process;

    process (CLKB,RESETB)
	variable i : integer :=0;
	begin
		if CLKB'event and CLKB='1' then
		    if RESETB='1' then
			    pl_reg_sync <= (others=>'0');
			elsif(OCE = '1') then
				pl_reg_sync <= bp_reg;
			end if;
		end if;
	end process;

end Behavioral;

----------------------------------SDPX9B---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SDPX9B is
    GENERIC ( 
	    BIT_WIDTH_0 : integer :=18; -- 9, 18, 36
	    BIT_WIDTH_1 : integer :=18; -- 9, 18, 36
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    BLK_SEL_0 : bit_vector := "000";
	    BLK_SEL_1 : bit_vector := "000";
        RESET_MODE : string := "SYNC"; --SYNC,ASYNC
	    INIT_RAM_00 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000"      
    );
    PORT (
	    DO : out std_logic_vector(35 downto 0):=conv_std_logic_vector(0,36);
	    CLKA,CLKB, CEA,CEB,OCE,RESETA,RESETB : in std_logic;
	    ADA,ADB : in std_logic_vector(13 downto 0);
    	BLKSELA, BLKSELB : in std_logic_vector(2 downto 0);
	    DI : in std_logic_vector(35 downto 0)
    );
end SDPX9B;

architecture Behavioral of SDPX9B is
	signal bp_reg,pl_reg,bp_reg_async,pl_reg_async,bp_reg_sync,pl_reg_sync : std_logic_vector(35 downto 0) := conv_std_logic_vector(0, 36);
	signal ram_MEM : std_logic_vector(18431 downto 0):= TO_StdLogicVector(INIT_RAM_3F & INIT_RAM_3E & INIT_RAM_3D & INIT_RAM_3C &INIT_RAM_3B & INIT_RAM_3A & INIT_RAM_39 & INIT_RAM_38 &INIT_RAM_37 & INIT_RAM_36 & INIT_RAM_35 & INIT_RAM_34 &INIT_RAM_33 & INIT_RAM_32 & INIT_RAM_31 & INIT_RAM_30 &INIT_RAM_2F & INIT_RAM_2E & INIT_RAM_2D & INIT_RAM_2C &INIT_RAM_2B & INIT_RAM_2A & INIT_RAM_29 & INIT_RAM_28 &INIT_RAM_27 & INIT_RAM_26 & INIT_RAM_25 & INIT_RAM_24 &INIT_RAM_23 & INIT_RAM_22 & INIT_RAM_21 & INIT_RAM_20 &INIT_RAM_1F & INIT_RAM_1E & INIT_RAM_1D & INIT_RAM_1C &INIT_RAM_1B & INIT_RAM_1A & INIT_RAM_19 & INIT_RAM_18 &INIT_RAM_17 & INIT_RAM_16 & INIT_RAM_15 & INIT_RAM_14 &INIT_RAM_13 & INIT_RAM_12 & INIT_RAM_11 & INIT_RAM_10 &INIT_RAM_0F & INIT_RAM_0E & INIT_RAM_0D & INIT_RAM_0C & INIT_RAM_0B & INIT_RAM_0A & INIT_RAM_09 & INIT_RAM_08 &INIT_RAM_07 & INIT_RAM_06 & INIT_RAM_05 & INIT_RAM_04 &INIT_RAM_03 & INIT_RAM_02 & INIT_RAM_01 & INIT_RAM_00);
	signal data_width_t1,data_width_t2,addr_width_a,addr_width_b : integer:=0;
	signal addr_a,addr_b : std_logic_vector(14 downto 0):=conv_std_logic_vector(0,15);
	signal mc : std_logic := '0';
	signal bs_ena,bs_enb : std_logic;
	signal pcea,pceb : std_logic;
	
begin

	data_width_t1 <= BIT_WIDTH_0;
	data_width_t2 <= BIT_WIDTH_1;

	addr_a <= conv_std_logic_vector(conv_integer(ADA(13 downto (14-addr_width_a)))*data_width_t1,15);
	addr_b <= conv_std_logic_vector(conv_integer(ADB(13 downto (14-addr_width_b)))*data_width_t2,15);

	process (data_width_t1,data_width_t2)
	begin
		case (data_width_t1) is
			when 9=> addr_width_a<=11;
			when 18=> addr_width_a<=10;
			when 36=> addr_width_a<=9;
			when others=>addr_width_a<=0;
		end case;
		case (data_width_t2) is
			when 9=> addr_width_b<=11;
			when 18=> addr_width_b<=10;
			when 36=> addr_width_b<=9;
			when others=>addr_width_b<=0;
		end case;
	end process;

	DO <= bp_reg when (READ_MODE = '0') else pl_reg;
	
	pcea <= CEA and bs_ena;
	pceb <= CEB and bs_enb;
	process(BLKSELA, BLKSELB)
	begin
		if(BLKSELA = TO_STDLOGICVECTOR(BLK_SEL_0)) then
			bs_ena <= '1';
		else
			bs_ena <= '0';
		end if;

        if(BLKSELB = TO_STDLOGICVECTOR(BLK_SEL_1)) then
			bs_enb <= '1';
		else
			bs_enb <= '0';
		end if;
	end process;

    process (bp_reg_async,bp_reg_sync,pl_reg_async,pl_reg_sync) 
    begin
        if(RESET_MODE = "ASYNC") then
            bp_reg <= bp_reg_async;
            pl_reg <= pl_reg_async;
        else 
            bp_reg <= bp_reg_sync;
            pl_reg <= pl_reg_sync;
        end if;
    end process;
	
	process (CLKA)
	variable i : integer :=0;
	begin
	    if CLKA'event and CLKA='1' then
		    if (pcea='1') then
		        if(data_width_t1=9) then
				    i := 0;
				    while(i < data_width_t1) loop
					    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
					    i := i+1;
				    end loop;
			    elsif(data_width_t1=18) then
				    if (ADA(0)='1') then
					    i := 0;
					    while (i < 9) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    end if;
				    if(ADA(1)='1') then
					    i := 9;
					    while ((i >= 9) and (i < 18)) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    end if;
			    elsif(data_width_t1=36) then
				    if (ADA(0)='1') then
					    i := 0;
					    while (i < 9) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    end if;
			    	if(ADA(1)='1') then
					    i := 9;
					    while ((i >= 9) and (i < 18)) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
				    	end loop;
			    	end if;
				    if(ADA(2)='1') then
					    i := 18;
					    while ((i >= 18) and (i<27)) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
			        end if;
				    if(ADA(3)='1') then
					    i := 27;
					    while ((i >= 27) and (i<36)) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    end if;
			    end if;
			mc <= (not mc);
            end if;
	    end if;
	end process;

	process (CLKB,RESETB)
	variable i : integer :=0;
	begin
		if RESETB='1' then
			bp_reg_async <= (others=>'0');
		elsif CLKB'event and CLKB='1' then
			if (pceb='1') then
				i := 0;
				while(i < data_width_t2) loop
					bp_reg_async(i) <= ram_MEM((conv_integer(addr_b)+i));
					i := i+1;
				end loop;
			end if;
		end if;
	end process;

    process (CLKB)
	variable i : integer :=0;
	begin
		if CLKB'event and CLKB='1' then
		    if RESETB='1' then
			    bp_reg_sync <= (others=>'0');
			elsif (pceb='1') then
				i := 0;
				while(i < data_width_t2) loop
					bp_reg_sync(i) <= ram_MEM((conv_integer(addr_b)+i));
					i := i+1;
				end loop;
			end if;
		end if;
	end process;

    process (CLKB,RESETB)
	begin
		if RESETB='1' then
			pl_reg_async <= (others=>'0');
		elsif CLKB'event and CLKB='1' then
			if(OCE = '1') then
				pl_reg_async <= bp_reg;
			end if;
		end if;
	end process;

    process (CLKB)
	begin
		if CLKB'event and CLKB='1' then
		    if RESETB='1' then
			    pl_reg_sync <= (others=>'0');
			elsif(OCE = '1') then
				pl_reg_sync <= bp_reg;
			end if;			
		end if;
	end process;

end Behavioral;

----------------------------DPB---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DPB is
    GENERIC (
		BIT_WIDTH_0 : integer :=16; -- 1, 2, 4, 8, 16
		BIT_WIDTH_1 : integer :=16; -- 1, 2, 4, 8, 16
		READ_MODE0 : bit := '0'; -- 0: bypass mode; 1: pipeline mode
		READ_MODE1 : bit := '0'; -- 0: bypass mode; 1: pipeline mode
		WRITE_MODE0 : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
		WRITE_MODE1 : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
	    BLK_SEL_0 : bit_vector := "000";
	    BLK_SEL_1 : bit_vector := "000";
        RESET_MODE : string := "SYNC";--SYNC, ASYNC
		INIT_RAM_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"
    );
    PORT (
		DOA,DOB : out std_logic_vector(15 downto 0):=conv_std_logic_vector(0,16);
		CLKA,CLKB, CEA,CEB,OCEA,OCEB,RESETA,RESETB,WREA,WREB : in std_logic;
		ADA,ADB : in std_logic_vector(13 downto 0);
    	BLKSELA, BLKSELB : in std_logic_vector(2 downto 0);
		DIA,DIB : in std_logic_vector(15 downto 0)
    );
end DPB;

architecture Behavioral of DPB is
	signal bpa_reg,bpb_reg,pla_reg,plb_reg,bpa_reg_async,bpb_reg_async,pla_reg_async,plb_reg_async,bpa_reg_sync,bpb_reg_sync,pla_reg_sync,plb_reg_sync : std_logic_vector(15 downto 0):= X"0000";
	signal ram_MEM : std_logic_vector(16383 downto 0) := TO_StdLogicVector(INIT_RAM_3F & INIT_RAM_3E & INIT_RAM_3D & INIT_RAM_3C &INIT_RAM_3B & INIT_RAM_3A & INIT_RAM_39 & INIT_RAM_38 &INIT_RAM_37 & INIT_RAM_36 & INIT_RAM_35 & INIT_RAM_34 &INIT_RAM_33 & INIT_RAM_32 & INIT_RAM_31 & INIT_RAM_30 &INIT_RAM_2F & INIT_RAM_2E & INIT_RAM_2D & INIT_RAM_2C &INIT_RAM_2B & INIT_RAM_2A & INIT_RAM_29 & INIT_RAM_28 &INIT_RAM_27 & INIT_RAM_26 & INIT_RAM_25 & INIT_RAM_24 &INIT_RAM_23 & INIT_RAM_22 & INIT_RAM_21 & INIT_RAM_20 &INIT_RAM_1F & INIT_RAM_1E & INIT_RAM_1D & INIT_RAM_1C &INIT_RAM_1B & INIT_RAM_1A & INIT_RAM_19 & INIT_RAM_18 &INIT_RAM_17 & INIT_RAM_16 & INIT_RAM_15 & INIT_RAM_14 &INIT_RAM_13 & INIT_RAM_12 & INIT_RAM_11 & INIT_RAM_10 &INIT_RAM_0F & INIT_RAM_0E & INIT_RAM_0D & INIT_RAM_0C & INIT_RAM_0B & INIT_RAM_0A & INIT_RAM_09 & INIT_RAM_08 &INIT_RAM_07 & INIT_RAM_06 & INIT_RAM_05 & INIT_RAM_04 &INIT_RAM_03 & INIT_RAM_02 & INIT_RAM_01 & INIT_RAM_00);
	signal data_width_t1,data_width_t2,addr_width_a,addr_width_b : integer := 0;
	signal addr_a,addr_b : std_logic_vector(13 downto 0):=conv_std_logic_vector(0,14);
	signal mc : std_logic := '0';
	signal bs_ena,bs_enb : std_logic;
	signal pcea,pceb : std_logic;

begin
	data_width_t1 <= BIT_WIDTH_0;
	data_width_t2 <= BIT_WIDTH_1;
	
	for_addr:for k in 0 to 13 generate
	begin
		addr_a(k)<= '0' when (k<(14-addr_width_a)) else ADA(K);
		addr_b(k)<= '0' when (k<(14-addr_width_b)) else ADB(K);
	end generate for_addr;

	process (data_width_t1,data_width_t2)
	begin
		case (data_width_t1) is
			when 1=> addr_width_a<=14;
			when 2=> addr_width_a<=13;
			when 4=> addr_width_a<=12;
			when 8=> addr_width_a<=11;
			when 16=> addr_width_a<=10;
			when others=>addr_width_a<=0;
		end case;
		case (data_width_t2) is
			when 1=> addr_width_b<=14;
			when 2=> addr_width_b<=13;
			when 4=> addr_width_b<=12;
			when 8=> addr_width_b<=11;
			when 16=> addr_width_b<=10;
			when others=>addr_width_b<=0;
		end case;
	end process;

	DOA <= bpa_reg when (READ_MODE0 = '0') else pla_reg;
	DOB <= bpb_reg when (READ_MODE1 = '0') else plb_reg;
	
	pcea <= CEA and bs_ena;
	pceb <= CEB and bs_enb;
	process(BLKSELA, BLKSELB)
	begin
		if(BLKSELA = TO_STDLOGICVECTOR(BLK_SEL_0)) then
			bs_ena <= '1';
		else
			bs_ena <= '0';
		end if;

        if(BLKSELB = TO_STDLOGICVECTOR(BLK_SEL_1)) then
			bs_enb <= '1';
		else
			bs_enb <= '0';
		end if;
	end process;

    process(bpa_reg_async, bpa_reg_sync, pla_reg_async, pla_reg_sync, bpb_reg_async, bpb_reg_sync, plb_reg_async, plb_reg_sync) 
    begin
        if(RESET_MODE = "ASYNC") then
            bpa_reg <= bpa_reg_async;
            pla_reg <= pla_reg_async;
            bpb_reg <= bpb_reg_async;
            plb_reg <= plb_reg_async;
        else 
            bpa_reg <= bpa_reg_sync;
            pla_reg <= pla_reg_sync;
            bpb_reg <= bpb_reg_sync;
            plb_reg <= plb_reg_sync;
        end if;
    end process;


	process (CLKA,CLKB)
	variable i : integer :=0;
	begin	
	    -------port A------------------------
	    if CLKA'event and CLKA='1' then
            if (pcea='1') then
			    if (WREA='1') then
			        if((BIT_WIDTH_0=1) or (BIT_WIDTH_0=2) or (BIT_WIDTH_0=4) or (BIT_WIDTH_0=8)) then
					    i := 0;
					    while(i < BIT_WIDTH_0) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DIA(i);
						    i := i+1;
					    end loop;
				    elsif(BIT_WIDTH_0=16) then
					    if (ADA(0)='1') then
						    i := 0;
						    while (i < 8) loop
							    ram_MEM((conv_integer(addr_a)+i))<= DIA(i);
							    i := i+1;
						    end loop;
					    end if;
					    if(ADA(1)='1') then
						    i := 8;
						    while ((i >= 8) and (i<16)) loop
							    ram_MEM((conv_integer(addr_a)+i))<= DIA(i);
							    i := i+1;
						    end loop;
					    end if;
				    end if;
				    mc <= (not mc);
 			    end if;
		    end if;
	    end if;

	    -------------port B------------------------------------------
	    if CLKB'event and CLKB='1' then
		    if (pceb='1') then
			    if(WREB='1') then
				    if((BIT_WIDTH_1=1) or (BIT_WIDTH_1=2) or (BIT_WIDTH_1=4) or (BIT_WIDTH_1=8)) then
					    i := 0;
					    while(i < BIT_WIDTH_1) loop
						    ram_MEM((conv_integer(addr_b)+i))<= DIB(i);
						    i := i+1;
					    end loop;
				    elsif(BIT_WIDTH_1=16) then
					    if (ADB(0)='1') then
						    i := 0;
						    while (i < 8) loop
							    ram_MEM((conv_integer(addr_b)+i))<= DIB(i);
							    i := i+1;
						    end loop;
					    end if;
					    if(ADB(1)='1') then
						    i := 8;
						    while ((i >= 8) and (i<16)) loop
							    ram_MEM((conv_integer(addr_b)+i))<= DIB(i);
							    i := i+1;
						    end loop;
					    end if;
				    end if;
				    mc <= (not mc);
			    end if;
			end if;
        end if;
	end process;

    
    process (CLKA,CLKB,RESETA,RESETB)
	variable i : integer :=0;
	begin	
	    -------port A------------------------
	    if RESETA='1' then
			bpa_reg_async <= (others=>'0');
	    elsif CLKA'event and CLKA='1' then
		    if (pcea='1') then
			    if (WREA='1') then
			        if (WRITE_MODE0 = "01") then
                        i := 0;
					    while(i < data_width_t1) loop
			   	            bpa_reg_async(i) <= ram_MEM((conv_integer(addr_a)+i));
				            i := i+1;
					    end loop;
                        
                        if(BIT_WIDTH_0<=8) then
					        bpa_reg_async((BIT_WIDTH_0-1) downto 0) <= DIA((BIT_WIDTH_0-1) downto 0);
                        elsif(BIT_WIDTH_0=16) then
                            if(ADA(0) = '1') then
						        bpa_reg_async(7 downto 0) <= DIA(7 downto 0);
                            end if;
                            if(ADA(1) = '1') then
						        bpa_reg_async(15 downto 8) <= DIA(15 downto 8);
                            end if;
				        end if;
			        end if;

			        if (WRITE_MODE0 = "10") then
			    	    i := 0;
					    while(i < data_width_t1) loop
			   	            bpa_reg_async(i) <= ram_MEM((conv_integer(addr_a)+i));
				            i := i+1;
					    end loop;
				    end if;
					 		
				elsif(WREA = '0') then
					i := 0;
					while(i < BIT_WIDTH_0) loop
						bpa_reg_async(i) <= ram_MEM((conv_integer(addr_a)+i));
						i := i+1;
					end loop;
			    end if;
		    end if;
	    end if;

	    -------------port B------------------------------------------
	    if RESETB='1' then
		    bpb_reg_async <=(others=>'0');
	    elsif CLKB'event and CLKB='1' then
		    if (pceb='1') then
			    if(WREB='1') then
				    if (WRITE_MODE1 = "01") then
                        i := 0;
					    while(i < data_width_t2) loop
						    bpb_reg_async(i) <= ram_MEM((conv_integer(addr_b)+i));
						    i := i+1;
					    end loop;

                        if(BIT_WIDTH_1<=8) then
					        bpb_reg_async((BIT_WIDTH_1-1) downto 0) <= DIB((BIT_WIDTH_1-1) downto 0);
                        elsif(BIT_WIDTH_1=16) then
                            if(ADB(0) = '1') then
						        bpb_reg_async(7 downto 0) <= DIB(7 downto 0);
                            end if;
                            if(ADB(1) = '1') then
						        bpb_reg_async(15 downto 8) <= DIB(15 downto 8);
                            end if;
				        end if;
				    end if;

				    if (WRITE_MODE1 = "10") then
					    i := 0;
					    while(i < data_width_t2) loop
						    bpb_reg_async(i) <= ram_MEM((conv_integer(addr_b)+i));
						    i := i+1;
					    end loop;
				    end if;

				elsif(WREB = '0') then
					i := 0;
					while(i < BIT_WIDTH_1) loop
						bpb_reg_async(i) <= ram_MEM((conv_integer(addr_b)+i));
						i := i+1;
					end loop;
			    end if;
			end if;
	    end if;
	end process;

    process (CLKA,CLKB)
	variable i : integer :=0;
	begin	
	    -------port A------------------------
	    if CLKA'event and CLKA='1' then
	        if RESETA='1' then
			    bpa_reg_sync <= (others=>'0');
		    elsif (pcea='1') then
			    if (WREA='1') then
			        if (WRITE_MODE0 = "01") then
                        i := 0;
					    while(i < data_width_t1) loop
			   	            bpa_reg_sync(i) <= ram_MEM((conv_integer(addr_a)+i));
				            i := i+1;
					    end loop;

                        if(BIT_WIDTH_0<=8) then
					        bpa_reg_sync((BIT_WIDTH_0-1) downto 0) <= DIA((BIT_WIDTH_0-1) downto 0);
                        elsif(BIT_WIDTH_0=16) then
                            if(ADA(0) = '1') then
						        bpa_reg_sync(7 downto 0) <= DIA(7 downto 0);
                            end if;
                            if(ADA(1) = '1') then
						        bpa_reg_sync(15 downto 8) <= DIA(15 downto 8);
                            end if;
				        end if;
			        end if;

			        if (WRITE_MODE0 = "10") then
			    	    i := 0;
					    while(i < data_width_t1) loop
			   	            bpa_reg_sync(i) <= ram_MEM((conv_integer(addr_a)+i));
				            i := i+1;
					    end loop;
				    end if;
					 		
				elsif(WREA = '0') then
					i := 0;
					while(i < BIT_WIDTH_0) loop
						bpa_reg_sync(i) <= ram_MEM((conv_integer(addr_a)+i));
						i := i+1;
					end loop;
			    end if;
		    end if;
	    end if;

	    -------------port B------------------------------------------
	    if CLKB'event and CLKB='1' then
	        if RESETB='1' then
		        bpb_reg_sync <=(others=>'0');
		    elsif (pceb='1') then
			    if(WREB='1') then
				    if (WRITE_MODE1 = "01") then
                        i := 0;
					    while(i < data_width_t2) loop
						    bpb_reg_sync(i) <= ram_MEM((conv_integer(addr_b)+i));
						    i := i+1;
					    end loop;

                        if(BIT_WIDTH_1<=8) then
					        bpb_reg_sync((BIT_WIDTH_1-1) downto 0) <= DIB((BIT_WIDTH_1-1) downto 0);
                        elsif(BIT_WIDTH_1=16) then
                            if(ADB(0) = '1') then
						        bpb_reg_sync(7 downto 0) <= DIB(7 downto 0);
                            end if;
                            if(ADB(1) = '1') then
						        bpb_reg_sync(15 downto 8) <= DIB(15 downto 8);
                            end if;
				        end if;
				    end if;

				    if (WRITE_MODE1 = "10") then
					    i := 0;
					    while(i < data_width_t2) loop
						    bpb_reg_sync(i) <= ram_MEM((conv_integer(addr_b)+i));
						    i := i+1;
					    end loop;
				    end if;

				elsif(WREB = '0') then
					i := 0;
					while(i < BIT_WIDTH_1) loop
						bpb_reg_sync(i) <= ram_MEM((conv_integer(addr_b)+i));
						i := i+1;
					end loop;
			    end if;
			end if;
	    end if;
	end process;

    process (CLKA,CLKB,RESETA,RESETB)
	begin	
	    if RESETA='1' then
			pla_reg_async <= (others=>'0');
	    elsif CLKA'event and CLKA='1' then
		    if(OCEA = '1') then
		        pla_reg_async <= bpa_reg;
	        end if;
	    end if;

	    if RESETB='1' then
		    plb_reg_async <=(others=>'0');
	    elsif CLKB'event and CLKB='1' then
		    if(OCEB = '1') then
		        plb_reg_async <= bpb_reg;
	        end if;
		end if;
	end process;

    process (CLKA,CLKB)
	begin	
	    if CLKA'event and CLKA='1' then
	        if RESETA='1' then
			    pla_reg_sync <= (others=>'0');
		    elsif(OCEA = '1') then
		        pla_reg_sync <= bpa_reg;
	        end if;
	    end if;

	    if CLKB'event and CLKB='1' then
	        if RESETB='1' then
		        plb_reg_sync <=(others=>'0');
		    elsif(OCEB = '1') then
		        plb_reg_sync <= bpb_reg;
	        end if;
		end if;
	end process;
	
end Behavioral;

----------------------------DPX9B---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DPX9B is
    GENERIC ( 
	    BIT_WIDTH_0 : integer :=18; -- 9, 18
	    BIT_WIDTH_1 : integer :=18; -- 9, 18
	    READ_MODE0 : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    READ_MODE1 : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    WRITE_MODE0 : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
	    WRITE_MODE1 : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
        BLK_SEL_0 : bit_vector := "000";
        BLK_SEL_1 : bit_vector := "000";
        RESET_MODE : string := "SYNC";--SYNC, ASYNC
	    INIT_RAM_00 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000"     
    );
    PORT (
	    DOA,DOB : out std_logic_vector(17 downto 0):=conv_std_logic_vector(0,18);
	    CLKA,CLKB, CEA,CEB,OCEA,OCEB,RESETA,RESETB,WREA,WREB : in std_logic;
	    ADA,ADB : in std_logic_vector(13 downto 0);
	    DIA : in std_logic_vector(17 downto 0);
        BLKSELA, BLKSELB : in std_logic_vector(2 downto 0);
	    DIB : in std_logic_vector(17 downto 0)
    );
end DPX9B;

architecture Behavioral of DPX9B is
	signal bpa_reg,bpb_reg,pla_reg,plb_reg,bpa_reg_async,bpb_reg_async,pla_reg_async,plb_reg_async,bpa_reg_sync,bpb_reg_sync,pla_reg_sync,plb_reg_sync : std_logic_vector(17 downto 0) := conv_std_logic_vector(0, 18);
	signal ram_MEM : std_logic_vector(18431 downto 0):=TO_StdLogicVector(INIT_RAM_3F & INIT_RAM_3E & INIT_RAM_3D & INIT_RAM_3C &INIT_RAM_3B & INIT_RAM_3A & INIT_RAM_39 & INIT_RAM_38 &INIT_RAM_37 & INIT_RAM_36 & INIT_RAM_35 & INIT_RAM_34 &INIT_RAM_33 & INIT_RAM_32 & INIT_RAM_31 & INIT_RAM_30 &INIT_RAM_2F & INIT_RAM_2E & INIT_RAM_2D & INIT_RAM_2C &INIT_RAM_2B & INIT_RAM_2A & INIT_RAM_29 & INIT_RAM_28 &INIT_RAM_27 & INIT_RAM_26 & INIT_RAM_25 & INIT_RAM_24 &INIT_RAM_23 & INIT_RAM_22 & INIT_RAM_21 & INIT_RAM_20 &INIT_RAM_1F & INIT_RAM_1E & INIT_RAM_1D & INIT_RAM_1C &INIT_RAM_1B & INIT_RAM_1A & INIT_RAM_19 & INIT_RAM_18 &INIT_RAM_17 & INIT_RAM_16 & INIT_RAM_15 & INIT_RAM_14 &INIT_RAM_13 & INIT_RAM_12 & INIT_RAM_11 & INIT_RAM_10 &INIT_RAM_0F & INIT_RAM_0E & INIT_RAM_0D & INIT_RAM_0C & INIT_RAM_0B & INIT_RAM_0A & INIT_RAM_09 & INIT_RAM_08 &INIT_RAM_07 & INIT_RAM_06 & INIT_RAM_05 & INIT_RAM_04 &INIT_RAM_03 & INIT_RAM_02 & INIT_RAM_01 & INIT_RAM_00);
	signal data_width_t1,data_width_t2,addr_width_a,addr_width_b : integer:= 0;
	signal addr_a,addr_b : std_logic_vector(14 downto 0):=conv_std_logic_vector(0,15);
	signal mc : std_logic := '0';
	signal bs_ena,bs_enb : std_logic;
	signal pcea,pceb : std_logic;

begin
	data_width_t1 <= BIT_WIDTH_0;
	data_width_t2 <= BIT_WIDTH_1;

	addr_a <= conv_std_logic_vector(conv_integer(ADA(13 downto (14-addr_width_a)))*data_width_t1,15);
	addr_b <= conv_std_logic_vector(conv_integer(ADB(13 downto (14-addr_width_b)))*data_width_t2,15);
	
	process (data_width_t1,data_width_t2)
	begin
		case (data_width_t1) is
			when 9=> addr_width_a<=11;
			when 18=> addr_width_a<=10;
			when others=>addr_width_a<=0;
		end case;
		case (data_width_t2) is
			when 9=> addr_width_b<=11;
			when 18=> addr_width_b<=10;
			when others=>addr_width_b<=0;
		end case;
	end process;

	DOA <= bpa_reg when (READ_MODE0 = '0') else pla_reg;
	DOB <= bpb_reg when (READ_MODE1 = '0') else plb_reg;
	
	pcea <= CEA and bs_ena;
	pceb <= CEB and bs_enb;
	process(BLKSELA, BLKSELB)
	begin
		if(BLKSELA = TO_STDLOGICVECTOR(BLK_SEL_0)) then
			bs_ena <= '1';
		else 
			bs_ena <= '0';
		end if;

        if(BLKSELB = TO_STDLOGICVECTOR(BLK_SEL_1)) then
			bs_enb <= '1';
		else 
			bs_enb <= '0';
		end if;
	end process;

    process(bpa_reg_async, bpa_reg_sync, pla_reg_async, pla_reg_sync, bpb_reg_async, bpb_reg_sync, plb_reg_async, plb_reg_sync) 
    begin
        if(RESET_MODE = "ASYNC") then
            bpa_reg <= bpa_reg_async;
            pla_reg <= pla_reg_async;
            bpb_reg <= bpb_reg_async;
            plb_reg <= plb_reg_async;
        else 
            bpa_reg <= bpa_reg_sync;
            pla_reg <= pla_reg_sync;
            bpb_reg <= bpb_reg_sync;
            plb_reg <= plb_reg_sync;
        end if;
    end process;

	process (CLKA,CLKB)
	variable i : integer :=0;
    begin
	-----------port A-----------------------		
	    if CLKA'event and CLKA='1' then
	        if (pcea='1') then
		        if (WREA='1') then			        
				    if(BIT_WIDTH_0=9) then
					    i := 0;
					    while(i < BIT_WIDTH_0) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DIA(i);
						    i := i+1;
					    end loop;
				    elsif(BIT_WIDTH_0=18) then
					    if (ADA(0)='1') then
						    i := 0;
						    while (i < 9) loop
							    ram_MEM((conv_integer(addr_a)+i))<= DIA(i);
							    i := i+1;
						    end loop;
					    end if;
					    if(ADA(1)='1') then
						    i := 9;
						    while ((i >= 9) and (i<18)) loop
							    ram_MEM((conv_integer(addr_a)+i))<= DIA(i);
							    i := i+1;
						    end loop;
					    end if;
				    end if;
				    mc <= (not mc);
			    end if;
		    end if;
	    end if;

	    -------------port B----------------------
	    if CLKB'event and CLKB='1' then
		    if (pceb='1') then
			    if(WREB='1') then								
				    if(BIT_WIDTH_1=9) then
					    i := 0;
					    while(i < BIT_WIDTH_1) loop
						    ram_MEM((conv_integer(addr_b)+i))<= DIB(i);
						    i := i+1;
					    end loop;
				    elsif(BIT_WIDTH_1=18) then
					    if (ADB(0)='1') then
						    i := 0;
						    while (i < 9) loop
							    ram_MEM((conv_integer(addr_b)+i))<= DIB(i);
							    i := i+1;
						    end loop;
					    end if;
					    if(ADB(1)='1') then
						    i := 9;
						    while ((i >= 9) and (i<18)) loop
							    ram_MEM((conv_integer(addr_b)+i))<= DIB(i);
							    i := i+1;
						    end loop;
					    end if;
				    end if;
				    mc <= (not mc);
			    end if;
			end if;
	    end if;
	end process;

    process (CLKA,CLKB,RESETA,RESETB)
	variable i : integer :=0;
    begin
	-----------port A-----------------------		
	    if RESETA='1' then
			bpa_reg_async <= (others=>'0');
	    elsif CLKA'event and CLKA='1' then
		    if (pcea='1') then
		        if (WREA='1') then
			        if (WRITE_MODE0 = "01") then
                        i := 0;
					    while(i < data_width_t1) loop
			   	            bpa_reg_async(i) <= ram_MEM((conv_integer(addr_a)+i));
				            i := i+1;
					    end loop;

                        if (BIT_WIDTH_0 = 9) then
					        bpa_reg_async(8 downto 0) <= DIA(8 downto 0);
                        elsif(BIT_WIDTH_0 = 18) then
                            if(ADA(0) = '1') then
						        bpa_reg_async(8 downto 0) <= DIA(8 downto 0);
                            end if;
                            if(ADA(1) = '1') then
						        bpa_reg_async(17 downto 9) <= DIA(17 downto 9);
                            end if;
                        end if;
			        end if;
			        if (WRITE_MODE0 = "10") then
			    	    i := 0;
					    while(i < data_width_t1) loop
			   	            bpa_reg_async(i) <= ram_MEM((conv_integer(addr_a)+i));
				            i := i+1;
					    end loop;
				    end if;

				elsif(WREA = '0') then
					i := 0;
					while(i < BIT_WIDTH_0) loop
						bpa_reg_async(i) <= ram_MEM((conv_integer(addr_a)+i));
						i := i+1;
					end loop;
			    end if;
		    end if;
	    end if;

	    -------------port B----------------------
	    if RESETB='1' then
		    bpb_reg_async <=(others=>'0');
	    elsif CLKB'event and CLKB='1' then
		    if (pceb='1') then
			    if(WREB='1') then
				    if (WRITE_MODE1 = "01") then
                        i := 0;
					    while(i < data_width_t2) loop
						    bpb_reg_async(i) <= ram_MEM((conv_integer(addr_b)+i));
						    i := i+1;
					    end loop;

                        if (BIT_WIDTH_1 = 9) then
					        bpb_reg_async(8 downto 0) <= DIB(8 downto 0);
                        elsif(BIT_WIDTH_1 = 18) then
                            if(ADB(0) = '1') then
						        bpb_reg_async(8 downto 0) <= DIB(8 downto 0);
                            end if;
                            if(ADB(1) = '1') then
						        bpb_reg_async(17 downto 9) <= DIB(17 downto 9);
                            end if;
                        end if;
				    end if;
				    if (WRITE_MODE1 = "10") then
					    i := 0;
					    while(i < data_width_t2) loop
						    bpb_reg_async(i) <= ram_MEM((conv_integer(addr_b)+i));
						    i := i+1;
					    end loop;
				    end if;
				
				elsif(WREB = '0') then
					i := 0;
					while(i < BIT_WIDTH_1) loop
						bpb_reg_async(i) <= ram_MEM((conv_integer(addr_b)+i));
						i := i+1;
					end loop;
			    end if;
			end if;
	    end if;
	end process;

    process (CLKA,CLKB)
	variable i : integer :=0;
    begin
	-----------port A-----------------------		
	    if CLKA'event and CLKA='1' then
	        if RESETA='1' then
			    bpa_reg_sync <= (others=>'0');
		    elsif (pcea='1') then
		        if (WREA='1') then
			        if (WRITE_MODE0 = "01") then
                        i := 0;
					    while(i < data_width_t1) loop
			   	            bpa_reg_sync(i) <= ram_MEM((conv_integer(addr_a)+i));
				            i := i+1;
					    end loop;

                        if (BIT_WIDTH_0 = 9) then
					        bpa_reg_sync(8 downto 0) <= DIA(8 downto 0);
                        elsif(BIT_WIDTH_0 = 18) then
                            if(ADA(0) = '1') then
						        bpa_reg_sync(8 downto 0) <= DIA(8 downto 0);
                            end if;
                            if(ADA(1) = '1') then
						        bpa_reg_sync(17 downto 9) <= DIA(17 downto 9);
                            end if;
                        end if;
			        end if;
			        if (WRITE_MODE0 = "10") then
			    	    i := 0;
					    while(i < data_width_t1) loop
			   	            bpa_reg_sync(i) <= ram_MEM((conv_integer(addr_a)+i));
				            i := i+1;
					    end loop;
				    end if;

				elsif(WREA = '0') then
					i := 0;
					while(i < BIT_WIDTH_0) loop
						bpa_reg_sync(i) <= ram_MEM((conv_integer(addr_a)+i));
						i := i+1;
					end loop;
			    end if;
		    end if;
	    end if;

	    -------------port B----------------------
	    if CLKB'event and CLKB='1' then
	        if RESETB='1' then
		        bpb_reg_sync <=(others=>'0');
		    elsif (pceb='1') then
			    if(WREB='1') then
				    if (WRITE_MODE1 = "01") then
                        i := 0;
					    while(i < data_width_t2) loop
						    bpb_reg_sync(i) <= ram_MEM((conv_integer(addr_b)+i));
						    i := i+1;
					    end loop;

                        if (BIT_WIDTH_1 = 9) then
					        bpb_reg_sync(8 downto 0) <= DIB(8 downto 0);
                        elsif(BIT_WIDTH_1 = 18) then
                            if(ADB(0) = '1') then
						        bpb_reg_sync(8 downto 0) <= DIB(8 downto 0);
                            end if;
                            if(ADB(1) = '1') then
						        bpb_reg_sync(17 downto 9) <= DIB(17 downto 9);
                            end if;
                        end if;
				    end if;
				    if (WRITE_MODE1 = "10") then
					    i := 0;
					    while(i < data_width_t2) loop
						    bpb_reg_sync(i) <= ram_MEM((conv_integer(addr_b)+i));
						    i := i+1;
					    end loop;
				    end if;
				
				elsif(WREB = '0') then
					i := 0;
					while(i < BIT_WIDTH_1) loop
						bpb_reg_sync(i) <= ram_MEM((conv_integer(addr_b)+i));
						i := i+1;
					end loop;
			    end if;
			end if;
	    end if;
	end process;

    process (CLKA,CLKB,RESETA,RESETB)
    begin
	    if RESETA='1' then
			pla_reg_async <=(others=>'0');
	    elsif CLKA'event and CLKA='1' then
		    if(OCEA = '1') then
		        pla_reg_async <= bpa_reg;
	        end if;
	    end if;

	    if RESETB='1' then
		    plb_reg_async <=(others=>'0');
	    elsif CLKB'event and CLKB='1' then
		    if(OCEB = '1') then
		        plb_reg_async <= bpb_reg;
	        end if;
		end if;
	end process;

    process (CLKA,CLKB)
    begin
	    if CLKA'event and CLKA='1' then
	        if RESETA='1' then
			    pla_reg_sync <=(others=>'0');
		    elsif(OCEA = '1') then
		        pla_reg_sync <= bpa_reg;
	        end if;
	    end if;

	    if CLKB'event and CLKB='1' then
	        if RESETB='1' then
		        plb_reg_sync <=(others=>'0');
		    elsif(OCEB = '1') then
		        plb_reg_sync <= bpb_reg;
	        end if;
		end if;
	end process;
    
end Behavioral;


--------------------------------RAM16S1--------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE. STD_LOGIC_UNSIGNED.ALL;

entity RAM16S1 is
    GENERIC ( INIT_0 : bit_vector(15 downto 0) := X"0000" );
    PORT (
		DO : out std_logic;
		CLK : in std_logic;
		WRE : in std_logic;
		AD : in std_logic_vector(3 downto 0);
		DI : in std_logic
    );
end RAM16S1;

architecture Behavioral of RAM16S1 is
	signal mem : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_0);

begin
		
    DO <= mem(conv_integer(AD));
	
	process(CLK)
	begin
		if(CLK'event and CLK = '1') then 
			if(WRE = '1')then
				mem(conv_integer(AD)) <= DI;
			end if;
		end if;
	end process;

end Behavioral;

--------------------------------RAM16S2--------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE. STD_LOGIC_UNSIGNED.ALL;

entity RAM16S2 is
    GENERIC ( INIT_0 : bit_vector(15 downto 0) := X"0000";
	          INIT_1 : bit_vector(15 downto 0) := X"0000" 
            );
    PORT (
		DO : out std_logic_vector(1 downto 0);
		CLK : in std_logic;
		WRE : in std_logic;
		AD : in std_logic_vector(3 downto 0);
		DI : in std_logic_vector(1 downto 0)
    );
end RAM16S2;

architecture Behavioral of RAM16S2 is
	signal mem0 : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_0);
	signal mem1 : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_1);

begin
	
    DO(0) <= mem0(CONV_INTEGER(AD));
	DO(1) <= mem1(CONV_INTEGER(AD));
	
	process(CLK)
	begin
		if(CLK'event and CLK = '1') then 
			if(WRE = '1')then
				mem0(CONV_INTEGER(AD)) <= DI(0);
				mem1(CONV_INTEGER(AD)) <= DI(1);
			end if;
		end if;
	end process;
        
end Behavioral;

--------------------------------RAM16S4--------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE. STD_LOGIC_UNSIGNED.ALL;

entity RAM16S4 is
    GENERIC( INIT_0 : bit_vector(15 downto 0) := X"0000";
	     INIT_1 : bit_vector(15 downto 0) := X"0000";
	     INIT_2 : bit_vector(15 downto 0) := X"0000";
             INIT_3 : bit_vector(15 downto 0) := X"0000"
           );
    PORT (
		DO : out std_logic_vector(3 downto 0); 
		CLK : in std_logic;
		WRE : in std_logic;
		AD : in std_logic_vector(3 downto 0);
		DI : in std_logic_vector(3 downto 0)
    );
end RAM16S4;

architecture Behavioral of RAM16S4 is
	signal mem0 : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_0);
	signal mem1 : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_1);
	signal mem2 : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_2);
	signal mem3 : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_3);
begin

	DO(0) <= mem0(CONV_INTEGER(AD));
	DO(1) <= mem1(CONV_INTEGER(AD));
	DO(2) <= mem2(CONV_INTEGER(AD));
	DO(3) <= mem3(CONV_INTEGER(AD));
	
	process(CLK)
	begin
		if(CLK'event and CLK = '1') then 
			if(WRE = '1')then
				mem0(CONV_INTEGER(AD)) <= DI(0);
				mem1(CONV_INTEGER(AD)) <= DI(1);
				mem2(CONV_INTEGER(AD)) <= DI(2);
				mem3(CONV_INTEGER(AD)) <= DI(3);
			end if;
		end if;
	end process;
        
end Behavioral;

--------------------------------RAM16SDP1--------------------------

library IEEE;  
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE. STD_LOGIC_UNSIGNED.ALL;

entity RAM16SDP1 is
    GENERIC( INIT_0 : bit_vector(15 downto 0) := X"0000" );
    PORT (
		DO : out std_logic;
		CLK : in std_logic;
		WRE : in std_logic;
		WAD : in std_logic_vector(3 downto 0);
		RAD : in std_logic_vector(3 downto 0);
		DI : in std_logic
    );
end RAM16SDP1;

architecture Behavioral of RAM16SDP1 is
	signal mem : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_0);
begin
	process(CLK)
	begin
		if(CLK'event and CLK = '1') then
			if(WRE = '1') then
				mem(CONV_INTEGER(WAD))<=DI;
			end if;
		end if;
	end process;
	
	DO <= mem(CONV_INTEGER(RAD));

end Behavioral;

--------------------------------RAM16SDP2--------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE. STD_LOGIC_UNSIGNED.ALL;

entity RAM16SDP2 is
    GENERIC ( INIT_0 : bit_vector(15 downto 0) := X"0000";
	          INIT_1 : bit_vector(15 downto 0) := X"0000"
            );
    PORT (
	    DO : out std_logic_vector(1 downto 0);
	    CLK : in std_logic;
	    WRE : in std_logic;
	    WAD : in std_logic_vector(3 downto 0);
	    RAD : in std_logic_vector(3 downto 0);
	    DI : in std_logic_vector(1 downto 0)
    );
end RAM16SDP2;

architecture Behavioral of RAM16SDP2 is
	signal mem0 : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_0);
	signal mem1 : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_1);
begin

	process(CLK)
	begin
		if(CLK'event and CLK = '1') then
			if(WRE = '1') then
				mem0(CONV_INTEGER(WAD)) <= DI(0);
				mem1(CONV_INTEGER(WAD)) <= DI(1);
			end if;
		end if;
	end process;

	DO(0) <= mem0(CONV_INTEGER(RAD));
	DO(1) <= mem1(CONV_INTEGER(RAD));
	
end Behavioral;

--------------------------------RAM16SDP4--------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE. STD_LOGIC_UNSIGNED.ALL;

entity RAM16SDP4 is
    GENERIC ( INIT_0 : bit_vector(15 downto 0) := X"0000";
	          INIT_1 : bit_vector(15 downto 0) := X"0000";
              INIT_2 : bit_vector(15 downto 0) := X"0000";
              INIT_3 : bit_vector(15 downto 0) := X"0000"
            );
    PORT (
		DO : out std_logic_vector(3 downto 0);
		CLK : in std_logic;
		WRE : in std_logic;
		WAD : in std_logic_vector(3 downto 0);
		RAD : in std_logic_vector(3 downto 0);
		DI : in std_logic_vector(3 downto 0)
    );
end RAM16SDP4;

architecture Behavioral of RAM16SDP4 is

	signal mem0 : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_0);
	signal mem1 : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_1);
	signal mem2 : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_2);
	signal mem3 : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_3);

begin
	process(CLK)
	begin
		if(CLK'event and CLK = '1') then
			if(WRE = '1') then
				mem0(CONV_INTEGER(WAD)) <= DI(0);
				mem1(CONV_INTEGER(WAD)) <= DI(1);
				mem2(CONV_INTEGER(WAD)) <= DI(2);
				mem3(CONV_INTEGER(WAD)) <= DI(3);
			end if;
		end if;
	end process;
	
	DO(0) <= mem0(CONV_INTEGER(RAD));
	DO(1) <= mem1(CONV_INTEGER(RAD));
	DO(2) <= mem2(CONV_INTEGER(RAD));
	DO(3) <= mem3(CONV_INTEGER(RAD));

end Behavioral;


--------------------------------ROM16-----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE. STD_LOGIC_UNSIGNED.ALL;

entity ROM16 is
    GENERIC ( INIT_0 : bit_vector(15 downto 0) := X"0000" );
    PORT (
 	    DO : out std_logic;
	    AD : in std_logic_vector(3 downto 0)
    );
end ROM16;

architecture Behavioral of ROM16 is
	signal ram_MEM : std_logic_vector(16 downto 0) := ('X' & To_StdLogicVector(INIT_0));

begin
	
    DO <= ram_MEM(CONV_INTEGER(AD));

end Behavioral;


---------------------BUFG---------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BUFG is
  PORT(
    	O : out std_logic;
    	I : in std_logic
    );
end BUFG;

architecture Behavioral of BUFG is
begin
  O <= TO_X01(I);

end Behavioral;

-----------------BUFS--------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BUFS is
    PORT (
         O : out std_logic;
         I : in std_logic
    );
end BUFS;

ARCHITECTURE Behavioral of BUFS is
begin
    O <= TO_X01(I);

end Behavioral;		

----------------------GND-----------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GND is
    PORT (
    	 G : out std_logic
    );
end GND;

architecture Behavioral of GND is
begin
  G <= '0';
end Behavioral;

---------------------VCC------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VCC is
    PORT (
    	 V : out std_logic
    );
end VCC;

architecture Behavioral of VCC is
begin
  V <= '1';
end Behavioral;

---------------------OSC------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY OSC IS
GENERIC (
    FREQ_DIV : integer := 100;  --2~128,only even num
    DEVICE : string := "GW2A-18" --GW2A-18,GW2A-55,GW2AR-18,GW2A-55C,GW2A-18C,GW2AR-18C,GW2ANR-18C,GW2AN-55C
);
PORT (
    OSCOUT: OUT STD_LOGIC
);
END OSC;
 
ARCHITECTURE BHV OF OSC IS
SIGNAL oscr : STD_LOGIC := '0';

SHARED VARIABLE  half_clk : TIME := (2 ns) * FREQ_DIV;
 
BEGIN
    
    PROCESS
    BEGIN
            WAIT FOR half_clk;
                oscr <= '1';
            WAIT FOR half_clk;
                oscr <= '0';
    END PROCESS;

    OSCOUT <= oscr;

END BHV;

-----------------INV---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity INV is
    PORT (
    	 O : OUT std_logic;
    	 I : IN std_logic
    );
end INV;

architecture Behavioral of INV is
begin
    O <= NOT I;
end Behavioral;


-----------------TLVDS_IBUF---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity TLVDS_IBUF is
    PORT(
        O : OUT std_logic;
        I : IN std_logic;
        IB : IN std_logic
        );
end TLVDS_IBUF;

architecture Behavioral of TLVDS_IBUF is
begin
    process(I,IB)
    begin
        if(I = '1' and IB = '0')then 
            O <= I;
        elsif(I = '0' and IB = '1')then 
            O <= I;
        elsif(I = 'X' or IB = 'X')then 
            O <= 'X';
        end if;
    end process;
end Behavioral;

-----------------TLVDS_OBUF---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TLVDS_OBUF is
    PORT(
        O : OUT std_logic;
        OB : OUT std_logic;
        I : IN std_logic
        );
end TLVDS_OBUF;

architecture Behavioral of TLVDS_OBUF is
begin
    process(I)
    begin
        O <= I;
        OB <= not I;
    end process;
end Behavioral;

-----------------TLVDS_TBUF---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TLVDS_TBUF is
    PORT (
    	 O  : OUT   std_logic;
    	 OB : OUT std_logic;
     	 I  : IN    std_logic;
	     OEN : IN    std_logic
    );
end TLVDS_TBUF;

architecture  Behavioral of TLVDS_TBUF is
begin
    process(I, OEN)
    begin
	    if ((OEN = '1') or (OEN = 'H')) then
	        O <= 'Z';
            OB <= 'Z';
	    elsif ((OEN = '0') or (OEN = 'L')) then
	        O <= TO_X01(I);
            OB <= not TO_X01(I);
	    end if;		
    end process;

end Behavioral;

-----------------TLVDS_IOBUF---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TLVDS_IOBUF is
    PORT (
    	 O  : OUT   std_logic;
    	 IOB : INOUT std_logic;
         IO : INOUT std_logic;
     	 I  : IN    std_logic;
	     OEN : IN    std_logic
    );
end TLVDS_IOBUF;

architecture  Behavioral of TLVDS_IOBUF is
begin
    process(I, OEN)
    begin
	    if ((OEN = '1') or (OEN = 'H')) then
	        IO <= 'Z';
            IOB <= 'Z';
	    elsif ((OEN = '0') or (OEN = 'L')) then
	        IO <= TO_X01(I);
            IOB <= not TO_X01(I);
	    end if;		
    end process;

   process(IO,IOB)
   begin
      if(IO = '1' and IOB = '0')then 
          O <= IO;
      elsif(IO = '0' and IOB = '1')then 
          O <= IO;
      elsif(IO = 'X' or IOB = 'X')then 
          O <= 'X';
    end if;

   end process;

end Behavioral;

-----------------ELVDS_IBUF---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity ELVDS_IBUF is
    PORT(
        O : OUT std_logic;
        I : IN std_logic;
        IB : IN std_logic
        );
end ELVDS_IBUF;

architecture Behavioral of ELVDS_IBUF is
begin
    process(I,IB)
    begin
        if(I = '1' and IB = '0')then 
            O <= I;
        elsif(I = '0' and IB = '1')then 
            O <= I;
        elsif(I = 'X' or IB = 'X')then 
            O <= 'X';
        end if;
    end process;
end Behavioral;

-----------------ELVDS_OBUF---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ELVDS_OBUF is
    PORT(
        O : OUT std_logic;
        OB : OUT std_logic;
        I : IN std_logic
        );
end ELVDS_OBUF;

architecture Behavioral of ELVDS_OBUF is
begin
    process(I)
    begin
        O <= I;
        OB <= not I;
    end process;
end Behavioral;

-----------------ELVDS_TBUF---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ELVDS_TBUF is
    PORT (
    	 O  : OUT   std_logic;
    	 OB : OUT std_logic;
     	 I  : IN    std_logic;
	     OEN : IN    std_logic
    );
end ELVDS_TBUF;

architecture  Behavioral of ELVDS_TBUF is
begin
    process(I, OEN)
    begin
	    if ((OEN = '1') or (OEN = 'H')) then
	        O <= 'Z';
            OB <= 'Z';
	    elsif ((OEN = '0') or (OEN = 'L')) then
	        O <= TO_X01(I);
            OB <= not TO_X01(I);
	    end if;		
    end process;

end Behavioral;

-----------------ELVDS_IOBUF---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ELVDS_IOBUF is
    PORT (
    	 O  : OUT   std_logic;
    	 IOB : INOUT std_logic;
         IO : INOUT std_logic;
     	 I  : IN    std_logic;
	     OEN : IN    std_logic
    );
end ELVDS_IOBUF;

architecture  Behavioral of ELVDS_IOBUF is
begin
    process(I, OEN)
    begin
	    if ((OEN = '1') or (OEN = 'H')) then
	        IO <= 'Z';
            IOB <= 'Z';
	    elsif ((OEN = '0') or (OEN = 'L')) then
	        IO <= TO_X01(I);
            IOB <= not TO_X01(I);
	    end if;		
    end process;

   process(IO,IOB)
   begin
      if(IO = '1' and IOB = '0')then 
          O <= IO;
      elsif(IO = '0' and IOB = '1')then 
          O <= IO;
      elsif(IO = 'X' or IOB = 'X')then 
          O <= 'X';
    end if;

   end process;

end Behavioral;


--------------PADD18---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity PADD18 is
	generic(
		AREG : bit := '0';-- '0': bypass mode; '1': registered mode
		BREG : bit := '0'; 
		SOREG : bit := '0';
		ADD_SUB : bit := '0';
        PADD_RESET_MODE : string := "SYNC"; -- SYNC,ASYNC
        BSEL_MODE : bit := '1' -- "1": shift, "0": parallel input B.
	);

	port(
		A : in std_logic_vector(17 downto 0);
		B : in std_logic_vector(17 downto 0);
		ASEL : in std_logic;
		CE,CLK,RESET : in std_logic;
		SI,SBI : in std_logic_vector(17 downto 0);
		SO,SBO : out std_logic_vector(17 downto 0);
		DOUT : out std_logic_vector(17 downto 0)
	);
end PADD18;

architecture Behavioral of PADD18 is

    signal inb,ina0,inb0,ina0_reg,ina1_reg,inb0_reg,ina1,ina2 : std_logic_vector(17 downto 0);
    signal ina0_reg_async,ina0_reg_sync,ina1_reg_async,ina1_reg_sync,inb_reg_async,inb_reg_sync : std_logic_vector(17 downto 0);    
    signal sdob_0,pout_0 : std_logic_vector(17 downto 0);
	signal grstn : std_logic;

	begin
        
        grstn <= GSRO;

        process (ina0_reg_sync, ina0_reg_async,inb_reg_sync,inb_reg_async,ina1_reg_async,ina1_reg_sync)
        begin
            if (PADD_RESET_MODE = "ASYNC") then
                ina0_reg <= ina0_reg_async;
                ina1_reg <= ina1_reg_async;
                inb0_reg <= inb_reg_async;
            elsif (PADD_RESET_MODE = "SYNC") then
                ina0_reg <= ina0_reg_sync;
                ina1_reg <= ina1_reg_sync;
                inb0_reg <= inb_reg_sync;
            end if;
        end process;

        process(SI, A, ASEL)
        begin
            if (ASEL = '1') then
                ina0 <= SI;
            elsif (ASEL = '0') then
                ina0 <= A;
            end if;
        end process;
        
        process(B, SBI, ina1)
        begin
            if (BSEL_MODE = '1') then
                inb0 <= SBI;
            elsif (BSEL_MODE = '0') then
                inb0 <= B;
            end if;
        end process;

        process (CLK, RESET, grstn)
        begin
            if (grstn= '0') then
                ina0_reg_async <= (others=>'0');
                ina1_reg_async <= (others=>'0');
            elsif (RESET = '1') then
                ina0_reg_async  <= (others=>'0');
                ina1_reg_async  <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
                if CE = '1' then
                    ina0_reg_async <= ina0;
                    ina1_reg_async <= ina1;
                end if;
            end if;
        end process;

        process (CLK, grstn)
		begin
			if (grstn = '0') then
				ina0_reg_sync <= (others=>'0');
                ina1_reg_sync <= (others=>'0');
            elsif (CLK'event and CLK = '1') then    
			    if (RESET = '1') then
				    ina0_reg_sync <= (others=>'0');
                    ina1_reg_sync <= (others=>'0');
                elsif (CE = '1') then
                    ina0_reg_sync <= ina0;
                    ina1_reg_sync <= ina1;
				end if;
			end if;
		end process;

        process (CLK, RESET, grstn)
        begin
            if (grstn= '0') then
                inb_reg_async <= (others=>'0'); 
            elsif (RESET = '1') then
                inb_reg_async  <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
                if CE = '1' then
                    inb_reg_async <= inb0;
                end if;
            end if;
        end process;

        process (CLK, grstn)
		begin
			if (grstn = '0') then
				inb_reg_sync <= (others=>'0');
			elsif (CLK'event and CLK = '1') then
			    if (RESET = '1') then
				    inb_reg_sync <= (others=>'0');
                elsif (CE = '1') then
                    inb_reg_sync <= inb0;
				end if;
			end if;
		end process;

        process(ina0_reg, ina0)
        begin
            if (AREG = '0') then
                ina1 <= ina0;
            else
                ina1 <= ina0_reg;
            end if;
        end process;

        process(ina1, ina1_reg)
        begin
            if (SOREG = '0') then
                ina2 <= ina1;
            else
                ina2 <= ina1_reg;
            end if;
        end process;

        SO <= ina2;

        process(inb0_reg, inb0)
        begin
            if (BREG = '0') then
                inb <= inb0;
            else 
                inb <= inb0_reg;
            end if;
        end process;

        SBO <= inb;

		process(ina1, inb)
		begin
			if (ADD_SUB = '1') then
				pout_0 <= ina1 - inb;
			else
				pout_0 <= ina1 + inb;
			end if;
		end process;

        DOUT <= pout_0;

end Behavioral;

-----------------PADD9---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity PADD9 is
	generic(
		AREG : bit := '0';-- '0': bypass mode; '1': registered mode
		BREG : bit := '0'; 
		SOREG : bit := '0';
		ADD_SUB : bit := '0';
        PADD_RESET_MODE : string := "SYNC"; -- SYNC,ASYNC
        BSEL_MODE : bit := '1' -- "1": shift, "0": parallel input B.
	);

	port(
		A : in std_logic_vector(8 downto 0);
		B : in std_logic_vector(8 downto 0);
		ASEL : in std_logic;
		CE,CLK,RESET : in std_logic;
		SI,SBI : in std_logic_vector(8 downto 0);
		SO,SBO : out std_logic_vector(8 downto 0);
		DOUT : out std_logic_vector(8 downto 0)
	);
end PADD9;

architecture Behavioral of PADD9 is

    signal inb,ina0,inb0,ina0_reg,ina1_reg,inb0_reg,ina1,ina2 : std_logic_vector(8 downto 0);
    signal ina0_reg_async,ina0_reg_sync,ina1_reg_async,ina1_reg_sync,inb_reg_async,inb_reg_sync : std_logic_vector(8 downto 0);
    signal sdob_0,pout_0 : std_logic_vector(8 downto 0);
	signal grstn : std_logic;

	begin
        
        grstn <= GSRO;

        process (ina0_reg_sync, ina0_reg_async,inb_reg_sync,inb_reg_async,ina1_reg_async,ina1_reg_sync)
        begin
            if (PADD_RESET_MODE = "ASYNC") then
                ina0_reg <= ina0_reg_async;
                ina1_reg <= ina1_reg_async;
                inb0_reg <= inb_reg_async;
            elsif (PADD_RESET_MODE = "SYNC") then
                ina0_reg <= ina0_reg_sync;
                ina1_reg <= ina1_reg_sync;
                inb0_reg <= inb_reg_sync;
            end if;
        end process;

        process(SI, A, ASEL)
        begin
            if (ASEL = '1') then
                ina0 <= SI;
            elsif (ASEL = '0') then
                ina0 <= A;
            end if;
        end process;
        
        process(B, SBI, ina1)
        begin
            if (BSEL_MODE = '1') then
                inb0 <= SBI;
            elsif (BSEL_MODE = '0') then
                inb0 <= B;
            end if;
        end process;

        process (CLK, RESET, grstn)
        begin
            if (grstn= '0') then
                ina0_reg_async <= (others=>'0'); 
                ina1_reg_async <= (others=>'0'); 
            elsif (RESET = '1') then
                ina0_reg_async  <= (others=>'0');
                ina1_reg_async  <= (others=>'0');
            elsif (CLK'event and CLK = '1') then    
                if CE = '1' then
                    ina0_reg_async <= ina0;
                    ina1_reg_async <= ina1;
                end if;
            end if;
        end process;

        process (CLK, grstn)
		begin
			if (grstn = '0') then
				ina0_reg_sync <= (others=>'0');
                ina1_reg_sync <= (others=>'0');
            elsif (CLK'event and CLK = '1') then    
			    if (RESET = '1') then
				    ina0_reg_sync <= (others=>'0');
                    ina1_reg_sync <= (others=>'0');
                elsif (CE = '1') then
                    ina0_reg_sync <= ina0;
                    ina1_reg_sync <= ina1;
				end if;
			end if;
		end process;

        process (CLK, RESET, grstn)
        begin
            if (grstn= '0') then
                inb_reg_async <= (others=>'0'); 
            elsif (RESET = '1') then
                inb_reg_async  <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
                if CE = '1' then
                    inb_reg_async <= inb0;
                end if;
            end if;
        end process;

        process (CLK, grstn)
		begin
			if (grstn = '0') then
				inb_reg_sync <= (others=>'0');
			elsif (CLK'event and CLK = '1') then
			    if (RESET = '1') then
				    inb_reg_sync <= (others=>'0');
                elsif (CE = '1') then
                    inb_reg_sync <= inb0;
				end if;
			end if;
		end process;

        process(ina0_reg, ina0)
        begin
            if (AREG = '0') then
                ina1 <= ina0;
            else
                ina1 <= ina0_reg;
            end if;
        end process;

        process(ina1, ina1_reg)
        begin
            if (SOREG = '0') then
                ina2 <= ina1;
            else
                ina2 <= ina1_reg;
            end if;
        end process;

        SO <= ina2;

        process(inb0_reg, inb0)
        begin
            if (BREG = '0') then
                inb <= inb0;
            else
                inb <= inb0_reg;
            end if;
        end process;

        SBO <= inb;

		process(ina1, inb)
		begin
			if (ADD_SUB = '1') then
				pout_0 <= ina1 - inb;
			else
				pout_0 <= ina1 + inb;
			end if;
		end process;

        DOUT <= pout_0;

end Behavioral;


-----------------MULT9X9---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity MULT9X9 is
	generic(
		AREG :  bit := '0'; --  '0': bypass mode; '1': registered mode
		BREG :  bit := '0';
		OUT_REG :  bit := '0';
		PIPE_REG :  bit := '0';
		ASIGN_REG :  bit := '0';
		BSIGN_REG :  bit := '0';
        SOA_REG :  bit := '0'; 
		MULT_RESET_MODE : string := "SYNC" -- SYNC, ASYNC
	);

	port (
		A,SIA : in std_logic_vector(8 downto 0);
		B,SIB : in std_logic_vector(8 downto 0);
		ASIGN, BSIGN : in std_logic;
        ASEL,BSEL : in std_logic;
		CE : in std_logic;
		CLK : in std_logic;
		RESET : in std_logic;
		DOUT : out std_logic_vector(17 downto 0);
        SOA,SOB : out std_logic_vector(8 downto 0)
	);
end MULT9X9;

architecture Behavioral of MULT9X9 is

	signal ina, inb, ina_reg_0, inb_reg_0, ina_reg_1, a_in, b_in, ina1 : std_logic_vector(8 downto 0);
	signal ina_reg_async, ina_reg_sync, ina1_reg_async, ina1_reg_sync,inb_reg_async, inb_reg_sync : std_logic_vector(8 downto 0);
	signal ma, mb : std_logic_vector(17 downto 0);
	signal asign_0,bsign_0,asign_reg0,bsign_reg0 : std_logic;
	signal asign_reg0_async,asign_reg0_sync,bsign_reg0_async,bsign_reg0_sync : std_logic;
	signal grstn : std_logic;
	signal out0, out1, out_reg_0, out0_async, out0_sync, out_async, out_sync : std_logic_vector(17 downto 0);
	signal d_out : std_logic_vector(17 downto 0) := (others=>'0');
	signal mult_out : std_logic_vector(17 downto 0);
	signal mult_out_tmp : std_logic_vector(35 downto 0);

	begin
		grstn <= GSRO ;

		process (ina_reg_sync, ina_reg_async, ina1_reg_sync,ina1_reg_async, inb_reg_sync, inb_reg_async, asign_reg0_async, asign_reg0_sync, bsign_reg0_async, bsign_reg0_sync, out0_async, out0_sync, out_async, out_sync)
		begin
			if MULT_RESET_MODE = "ASYNC" then
				ina_reg_0 <= ina_reg_async;
                ina_reg_1 <= ina1_reg_async;
				inb_reg_0 <= inb_reg_async;
				asign_reg0 <= asign_reg0_async;
				bsign_reg0 <= bsign_reg0_async;
				out0 <= out0_async;
				out_reg_0 <= out_async;
			elsif MULT_RESET_MODE = "SYNC" then
				ina_reg_0 <= ina_reg_sync;
                ina_reg_1 <= ina1_reg_sync;
				inb_reg_0 <= inb_reg_sync;
				asign_reg0 <= asign_reg0_sync;
				bsign_reg0 <= bsign_reg0_sync;
				out0 <= out0_sync;
				out_reg_0 <= out_sync;
			end if;
		end process;

        process(ASEL,A,SIA)
        begin
            if(ASEL = '0') then
                a_in <= A;
            elsif(ASEL = '1') then
                a_in <= SIA;
            end if;
        end process;

        process(BSEL,B,SIB) 
        begin
            if(BSEL = '0') then
                b_in <= B;
            elsif(BSEL = '1') then
                b_in <= SIB;
            end if;
        end process;

		process(CLK, RESET, grstn)
		begin
			if (grstn = '0') then
				ina_reg_async <= (others=>'0');
                ina1_reg_async <= (others=>'0');
			elsif RESET = '1' then
				ina_reg_async <= (others=>'0');
                ina1_reg_async <= (others=>'0');
			elsif (CLK'event and CLK = '1') then
				if CE = '1' then
					ina_reg_async <= a_in;
                    ina1_reg_async <= ina;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if (grstn = '0') then
				ina_reg_sync <= (others=>'0');
                ina1_reg_sync <= (others=>'0');
			elsif (CLK'event and CLK = '1') then
				if (RESET = '1') then
				    ina_reg_sync <= (others=>'0');
                    ina1_reg_sync <= (others=>'0');
			    elsif (CE = '1') then
					ina_reg_sync <= a_in;
                    ina1_reg_sync <= ina;
				end if;
			end if;
		end process;

		process(CLK, RESET, grstn)
		begin
			if grstn = '0' then
				inb_reg_async <= (others=>'0');
			elsif RESET = '1' then
				inb_reg_async <= (others=>'0');
			elsif (CLK'event and CLK = '1') then
				if (CE = '1') then
					inb_reg_async <= b_in;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if grstn = '0' then
				inb_reg_sync <= (others=>'0');
			elsif (CLK'event and CLK = '1') then
				if RESET = '1' then
				    inb_reg_sync <= (others=>'0');
			    elsif CE = '1' then
					inb_reg_sync <= b_in;
				end if;
			end if;
		end process;

		process (ina_reg_0, a_in)
		begin
			if AREG = '0' then
				ina <= a_in;
			else
				ina <= ina_reg_0;
			end if;
		end process;

        process (ina, ina_reg_1)
		begin
			if SOA_REG = '0' then
				ina1 <= ina;
			else
				ina1 <= ina_reg_1;
			end if;
		end process;

        SOA <= ina1;

		process (inb_reg_0, b_in)
		begin
			if BREG = '0' then
				inb <= b_in;
			else
				inb <= inb_reg_0;
			end if;
		end process;

        SOB <= inb;
			
		process (ina, asign_0)
		begin
			if (asign_0 = '1') then
				ma(8 downto 0) <= ina(8 downto 0);
				ma(17 downto 9) <= (others=>ina(8));
			else
				ma(8 downto 0) <= ina(8 downto 0);
				ma(17 downto 9) <= (others=>'0');
			end if;
		end process;

		process (inb, bsign_0)
		begin
			if (bsign_0 = '1') then
				mb(8 downto 0) <= inb(8 downto 0);
				mb(17 downto 9) <= (others=>inb(8));
			else
				mb(8 downto 0) <= inb(8 downto 0);
				mb(17 downto 9) <= (others=>'0');
			end if;
		end process;

		process (ma, mb)
		begin
			mult_out_tmp <= ma * mb;
		end process;

		process (mult_out_tmp)
		begin
			mult_out <= mult_out_tmp(17 downto 0);
		end process;

		-- sign reg
		process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				asign_reg0_async <= '0';
			elsif RESET = '1' then
				asign_reg0_async <= '0';
			elsif (CLK'event and CLK = '1') then
				if CE = '1' then
					asign_reg0_async <= ASIGN;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if grstn = '0' then
				asign_reg0_sync <= '0';
			elsif (CLK'event and CLK = '1') then
				if RESET = '1' then
				    asign_reg0_sync <= '0';
			    elsif CE = '1' then
					asign_reg0_sync <= ASIGN;
				end if;
			end if;
		end process;

		process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				bsign_reg0_async <= '0';
			elsif RESET = '1' then
				bsign_reg0_async <= '0';
			elsif (CLK'event and CLK = '1') then
				if CE = '1' then
					bsign_reg0_async <= BSIGN;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if grstn = '0' then
				bsign_reg0_sync <= '0';
			elsif (CLK'event and CLK = '1') then
				if RESET = '1' then
					bsign_reg0_sync <= '0';
			    elsif CE = '1' then
					bsign_reg0_sync <= BSIGN;
				end if;
			end if;
		end process;

		process(ASIGN, asign_reg0)
		begin
			if ASIGN_REG = '0' then
				asign_0 <= ASIGN;
			else
				asign_0 <= asign_reg0;
			end if;
		end process;
		
		process(BSIGN, bsign_reg0)
		begin
			if BSIGN_REG = '0' then
				bsign_0 <= BSIGN;
			else
				bsign_0 <= bsign_reg0;
			end if;
		end process;

        --pipe_reg
		process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				out0_async <= (others=>'0');
			elsif RESET = '1' then
				out0_async <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
			    if CE = '1' then
				    out0_async <= mult_out;
			    end if;
			end if;
		end process;

		process(CLK, grstn)
		begin
			if grstn = '0' then
				out0_sync <= (others=>'0');
			elsif (CLK'event and CLK = '1') then
                if RESET = '1' then
				    out0_sync <= (others=>'0');
				elsif CE = '1' then
					out0_sync <= mult_out;
				end if;
			end if;
		end process;

		process(mult_out, out0)
		begin
			if PIPE_REG = '0' then
				out1 <= mult_out;
			else
				out1 <= out0;
			end if;
		end process; 

		process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				out_async <= (others=>'0');
			elsif RESET = '1' then
				out_async <= (others=>'0');
		    elsif (CLK'event and CLK = '1') then	
                if CE = '1' then
					out_async <= out1;
				end if;
			end if;
		end process;

		process (grstn, CLK)
		begin
			if grstn = '0' then
				out_sync <= (others=>'0');
		    elsif (CLK'event and CLK = '1') then	
                if RESET = '1' then
				    out_sync <= (others=>'0');
				elsif CE = '1' then
					out_sync <= out1;
				end if;
			end if;
		end process; 

		process (out1, out_reg_0)
		begin
			if OUT_REG = '0' then
				d_out <= out1;
			else
				d_out <= out_reg_0;
			end if;
		end process;

		DOUT <= d_out;

end Behavioral;	

-----------------MULT18X18---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity MULT18X18 is
	generic(
		AREG :  bit := '0'; --  '0': bypass mode; '1': registered mode
		BREG :  bit := '0';
		OUT_REG :  bit := '0';
		PIPE_REG :  bit := '0';
		ASIGN_REG :  bit := '0';
		BSIGN_REG :  bit := '0';
        SOA_REG :  bit := '0';
		MULT_RESET_MODE : string := "SYNC" -- SYNC, ASYNC
	);

	port (
		A,SIA : in std_logic_vector(17 downto 0);
		B,SIB : in std_logic_vector(17 downto 0);
		ASIGN, BSIGN : in std_logic;
        ASEL,BSEL : in std_logic;
		CE : in std_logic;
		CLK : in std_logic;
		RESET : in std_logic;
		DOUT : out std_logic_vector(35 downto 0);
        SOA,SOB : out std_logic_vector(17 downto 0)
	);
end MULT18X18;

architecture Behavioral of MULT18X18 is

	signal ina, inb, ina_reg_0, inb_reg_0, ina_reg_1, a_in, b_in, ina1 : std_logic_vector(17 downto 0);
	signal ina_reg_async, ina_reg_sync, ina1_reg_async, ina1_reg_sync,inb_reg_async, inb_reg_sync : std_logic_vector(17 downto 0);
	signal ma, mb : std_logic_vector(35 downto 0);
	signal asign_0,bsign_0,asign_reg0,bsign_reg0 : std_logic;
	signal asign_reg0_async,asign_reg0_sync,bsign_reg0_async,bsign_reg0_sync : std_logic;
	signal grstn : std_logic;
	signal out0, out1, out_reg_0, out0_async, out0_sync, out_async, out_sync : std_logic_vector(35 downto 0);
	signal d_out : std_logic_vector(35 downto 0) := (others=>'0');
	signal mult_out : std_logic_vector(35 downto 0);
	signal mult_out_tmp : std_logic_vector(71 downto 0);

	begin
		grstn <= GSRO ;

		process (ina_reg_sync, ina_reg_async, ina1_reg_sync,ina1_reg_async, inb_reg_sync, inb_reg_async, asign_reg0_async, asign_reg0_sync, bsign_reg0_async, bsign_reg0_sync, out0_async, out0_sync, out_async, out_sync)
		begin
			if MULT_RESET_MODE = "ASYNC" then
				ina_reg_0 <= ina_reg_async;
                ina_reg_1 <= ina1_reg_async;
				inb_reg_0 <= inb_reg_async;
                asign_reg0 <= asign_reg0_async;
				bsign_reg0 <= bsign_reg0_async;
				out0 <= out0_async;
				out_reg_0 <= out_async;
			elsif MULT_RESET_MODE = "SYNC" then
				ina_reg_0 <= ina_reg_sync;
                ina_reg_1 <= ina1_reg_sync;
				inb_reg_0 <= inb_reg_sync;
				asign_reg0 <= asign_reg0_sync;
				bsign_reg0 <= bsign_reg0_sync;
				out0 <= out0_sync;
				out_reg_0 <= out_sync;
			end if;
		end process;

        process(ASEL,A,SIA)
        begin
            if(ASEL = '0') then
                a_in <= A;
            elsif(ASEL = '1') then
                a_in <= SIA;
            end if;
        end process;

        process(BSEL,B,SIB) 
        begin
            if(BSEL = '0') then
                b_in <= B;
            elsif(BSEL = '1') then
                b_in <= SIB;
            end if;
        end process;

		process(CLK, RESET, grstn)
		begin
			if (grstn = '0') then
				ina_reg_async <= (others=>'0');
                ina1_reg_async <= (others=>'0');
			elsif RESET = '1' then
				ina_reg_async <= (others=>'0');
                ina1_reg_async <= (others=>'0');
			elsif (CLK'event and CLK = '1') then
				if CE = '1' then
					ina_reg_async <= a_in;
                    ina1_reg_async <= ina;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if (grstn = '0') then
				ina_reg_sync <= (others=>'0');
                ina1_reg_sync <= (others=>'0');
			elsif (CLK'event and CLK = '1') then
				if (RESET = '1') then
				    ina_reg_sync <= (others=>'0');
                    ina1_reg_sync <= (others=>'0');
			    elsif (CE = '1') then
					ina_reg_sync <= a_in;
                    ina1_reg_sync <= ina;
				end if;
			end if;
		end process;

		process(CLK, RESET, grstn)
		begin
			if grstn = '0' then
				inb_reg_async <= (others=>'0');
			elsif RESET = '1' then
				inb_reg_async <= (others=>'0');
			elsif (CLK'event and CLK = '1') then
				if (CE = '1') then
					inb_reg_async <= b_in;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if grstn = '0' then
				inb_reg_sync <= (others=>'0');
			elsif (CLK'event and CLK = '1') then
				if RESET = '1' then
				    inb_reg_sync <= (others=>'0');
			    elsif CE = '1' then
					inb_reg_sync <= b_in;
				end if;
			end if;
		end process;

		process (ina_reg_0, a_in)
		begin
			if AREG = '0' then
				ina <= a_in;
			else
				ina <= ina_reg_0;
			end if;
		end process;

        process (ina, ina_reg_1)
		begin
			if SOA_REG = '0' then
				ina1 <= ina;
			else
				ina1 <= ina_reg_1;
			end if;
		end process;

        SOA <= ina1;

		process (inb_reg_0, b_in)
		begin
			if BREG = '0' then
				inb <= b_in;
			else
				inb <= inb_reg_0;
			end if;
		end process;

        SOB <= inb;
			
		process (ina, asign_0)
		begin
			if (asign_0 = '1') then
				ma(17 downto 0) <= ina(17 downto 0);
				ma(35 downto 18) <= (others=>ina(17));
			else
				ma(17 downto 0) <= ina(17 downto 0);
				ma(35 downto 18) <= (others=>'0');
			end if;
		end process;

		process (inb, bsign_0)
		begin
			if (bsign_0 = '1') then
				mb(17 downto 0) <= inb(17 downto 0);
				mb(35 downto 18) <= (others=>inb(17));
			else
				mb(17 downto 0) <= inb(17 downto 0);
				mb(35 downto 18) <= (others=>'0');
			end if;
		end process;

        mult_out_tmp <= ma * mb;
        mult_out <= mult_out_tmp(35 downto 0);

		-- sign reg
		process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				asign_reg0_async <= '0';
			elsif RESET = '1' then
				asign_reg0_async <= '0';
			elsif (CLK'event and CLK = '1') then
				if CE = '1' then
					asign_reg0_async <= ASIGN;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if grstn = '0' then
				asign_reg0_sync <= '0';
			elsif (CLK'event and CLK = '1') then
				if RESET = '1' then
				    asign_reg0_sync <= '0';
			    elsif CE = '1' then
					asign_reg0_sync <= ASIGN;
				end if;
			end if;
		end process;

		process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				bsign_reg0_async <= '0';
			elsif RESET = '1' then
				bsign_reg0_async <= '0';
			elsif (CLK'event and CLK = '1') then
				if CE = '1' then
					bsign_reg0_async <= BSIGN;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if grstn = '0' then
				bsign_reg0_sync <= '0';
			elsif (CLK'event and CLK = '1') then
				if RESET = '1' then
					bsign_reg0_sync <= '0';
			    elsif CE = '1' then
					bsign_reg0_sync <= BSIGN;
				end if;
			end if;
		end process;

		process(ASIGN, asign_reg0)
		begin
			if ASIGN_REG = '0' then
				asign_0 <= ASIGN;
			else
				asign_0 <= asign_reg0;
			end if;
		end process;
		
		process(BSIGN, bsign_reg0)
		begin
			if BSIGN_REG = '0' then
				bsign_0 <= BSIGN;
			else
				bsign_0 <= bsign_reg0;
			end if;
		end process;

        --pipe_reg
		process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				out0_async <= (others=>'0');
			elsif RESET = '1' then
				out0_async <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
			    if CE = '1' then
				    out0_async <= mult_out;
			    end if;
			end if;
		end process;

		process(CLK, grstn)
		begin
			if grstn = '0' then
				out0_sync <= (others=>'0');
			elsif (CLK'event and CLK = '1') then
                if RESET = '1' then
				    out0_sync <= (others=>'0');
				elsif CE = '1' then
					out0_sync <= mult_out;
				end if;
			end if;
		end process;

		process(mult_out, out0)
		begin
			if PIPE_REG = '0' then
				out1 <= mult_out;
			else
				out1 <= out0;
			end if;
		end process; 

		process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				out_async <= (others=>'0');
			elsif RESET = '1' then
				out_async <= (others=>'0');
		    elsif (CLK'event and CLK = '1') then	
                if CE = '1' then
					out_async <= out1;
				end if;
			end if;
		end process;

		process (grstn, CLK)
		begin
			if grstn = '0' then
				out_sync <= (others=>'0');
		    elsif (CLK'event and CLK = '1') then	
                if RESET = '1' then
				    out_sync <= (others=>'0');
				elsif CE = '1' then
					out_sync <= out1;
				end if;
			end if;
		end process; 

		process (out1, out_reg_0)
		begin
			if OUT_REG = '0' then
				d_out <= out1;
			else
				d_out <= out_reg_0;
			end if;
		end process;

		DOUT <= d_out;

end Behavioral;	

-----------------MULT36X36---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity MULT36X36 is
	generic(
		AREG :  bit := '0'; --  '0': bypass mode; '1': registered mode
		BREG :  bit := '0';
		OUT0_REG :  bit := '0';
		OUT1_REG :  bit := '0';
		PIPE_REG :  bit := '0';
		ASIGN_REG :  bit := '0';
		BSIGN_REG :  bit := '0';
		MULT_RESET_MODE : string := "SYNC" -- SYNC, ASYNC
	);

	port (
		A : in std_logic_vector(35 downto 0);
		B : in std_logic_vector(35 downto 0);
		ASIGN, BSIGN : in std_logic;
		CE : in std_logic;
		CLK : in std_logic;
		RESET : in std_logic;
		DOUT : out std_logic_vector(71 downto 0)
	);
end MULT36X36;

architecture Behavioral of MULT36X36 is

    signal ina,inb,a_in,b_in,ina_reg_0,inb_reg_0 : std_logic_vector(35 downto 0);
    signal ina_reg_async,ina_reg_sync,inb_reg_async,inb_reg_sync : std_logic_vector(35 downto 0);
    signal ma,mb : std_logic_vector(71 downto 0);

    signal asign_0,bsign_0,asign_reg0,bsign_reg0 : std_logic;
    signal asign_reg0_async,asign_reg0_sync,bsign_reg0_async,bsign_reg0_sync : std_logic;
    signal grstn : std_logic;

    signal out_pipe_reg_async,out_pipe_reg_sync,out_pipe_reg,out_pipe,out0_reg_async,out0_reg_sync,out0_reg_0,m_out0 : std_logic_vector(71 downto 0);
    signal out1_reg_async,out1_reg_sync,out1_reg_0,m_out1 : std_logic_vector(71 downto 18);
    signal m_out : std_logic_vector(71 downto 0) := (others=>'0');
	signal mult_out : std_logic_vector(71 downto 0);
	signal mult_out_tmp : std_logic_vector(143 downto 0);

    begin

		grstn <= GSRO;

		process (ina_reg_sync, ina_reg_async, inb_reg_sync, inb_reg_async, asign_reg0_async, asign_reg0_sync, bsign_reg0_async, bsign_reg0_sync, out_pipe_reg_async, out_pipe_reg_sync, out0_reg_async, out0_reg_sync, out1_reg_async, out1_reg_sync)
		begin
			if MULT_RESET_MODE = "ASYNC" then
				ina_reg_0 <= ina_reg_async;
				inb_reg_0 <= inb_reg_async;
				asign_reg0 <= asign_reg0_async;
				bsign_reg0 <= bsign_reg0_async;
				out_pipe_reg <= out_pipe_reg_async;
                out0_reg_0 <= out0_reg_async;
                out1_reg_0 <= out1_reg_async;
			elsif MULT_RESET_MODE = "SYNC" then
				ina_reg_0 <= ina_reg_sync;
				inb_reg_0 <= inb_reg_sync;
				asign_reg0 <= asign_reg0_sync;
				bsign_reg0 <= bsign_reg0_sync;
				out_pipe_reg <= out_pipe_reg_sync;
                out0_reg_0 <= out0_reg_sync;
                out1_reg_0 <= out1_reg_sync;
			end if;
		end process;

		process(CLK, RESET, grstn)
		begin
			if (grstn = '0') then
				ina_reg_async <= (others=>'0');
			elsif RESET = '1' then
				ina_reg_async <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
                if CE = '1' then
					ina_reg_async <= A;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if (grstn = '0') then
				ina_reg_sync <= (others=>'0');
			elsif (CLK'event and CLK = '1') then
			    if (RESET = '1') then
				    ina_reg_sync <= (others=>'0');
                elsif (CE = '1') then
					ina_reg_sync <= A;
				end if;
			end if;
		end process;

		process(CLK, RESET, grstn)
		begin
			if grstn = '0' then
				inb_reg_async <= (others=>'0');
			elsif RESET = '1' then
				inb_reg_async <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
                if (CE = '1') then
					inb_reg_async <= B;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if grstn = '0' then
				inb_reg_sync <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
				if RESET = '1' then
				    inb_reg_sync <= (others=>'0');
                elsif CE = '1' then
					inb_reg_sync <= B;
				end if;
			end if;
		end process;

        process (ina_reg_0, A)
		begin
			if AREG = '0' then
				ina <= A;
			elsif AREG = '1' then
				ina <= ina_reg_0;
			end if;
		end process;

        process (inb_reg_0, B)
		begin
			if BREG = '0' then
				inb <= B;
			elsif BREG = '1' then
				inb <= inb_reg_0;
			end if;
		end process;

        process (ina, asign_0)
		begin
			if (asign_0 = '1') then
				ma(35 downto 0) <= ina(35 downto 0);
				ma(71 downto 36) <= (others=>ina(35));
			else
				ma(35 downto 0) <= ina(35 downto 0);
				ma(71 downto 36) <= (others=>'0');
			end if;
		end process;

		process (inb, bsign_0)
		begin
			if (bsign_0 = '1') then
				mb(35 downto 0) <= inb(35 downto 0);
				mb(71 downto 36) <= (others=>inb(35));
			else
				mb(35 downto 0) <= inb(35 downto 0);
				mb(71 downto 36) <= (others=>'0');
			end if;
		end process;

        mult_out_tmp <= ma * mb;
        mult_out <= mult_out_tmp(71 downto 0);

        -- sign reg
		process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				asign_reg0_async <= '0';
			elsif RESET = '1' then
				asign_reg0_async <= '0';
            elsif (CLK'event and CLK = '1') then
				if CE = '1' then
					asign_reg0_async <= ASIGN;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if grstn = '0' then
				asign_reg0_sync <= '0';
			elsif (CLK'event and CLK = '1') then
                if RESET = '1' then
				    asign_reg0_sync <= '0';
                elsif CE = '1' then
					asign_reg0_sync <= ASIGN;
				end if;
			end if;
		end process;

		process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				bsign_reg0_async <= '0';
			elsif RESET = '1' then
				bsign_reg0_async <= '0';
            elsif (CLK'event and CLK = '1') then
                if CE = '1' then
					bsign_reg0_async <= BSIGN;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if grstn = '0' then
				bsign_reg0_sync <= '0';
			elsif (CLK'event and CLK = '1') then
                if RESET = '1' then
			    	bsign_reg0_sync <= '0';
			    elsif CE = '1' then
					bsign_reg0_sync <= BSIGN;
				end if;
			end if;
		end process;

		process(ASIGN, asign_reg0)
		begin
			if ASIGN_REG = '0' then
				asign_0 <= ASIGN;
			elsif ASIGN_REG = '1' then
				asign_0 <= asign_reg0;
			end if;
		end process;
		
		process(BSIGN, bsign_reg0)
		begin
			if BSIGN_REG = '0' then
				bsign_0 <= BSIGN;
			elsif BSIGN_REG = '1' then
				bsign_0 <= bsign_reg0;
			end if;
		end process;

        --pipe_reg
        process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				out_pipe_reg_async <= (others=>'0');
			elsif RESET = '1' then
				out_pipe_reg_async <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
			    if CE = '1' then
				    out_pipe_reg_async <= mult_out;
			    end if;
			end if;
		end process;

		process(CLK, grstn)
		begin
			if grstn = '0' then
				out_pipe_reg_sync <= (others=>'0');
			elsif (CLK'event and CLK = '1') then
                if RESET = '1' then
				    out_pipe_reg_sync <= (others=>'0');
				elsif CE = '1' then
					out_pipe_reg_sync <= mult_out;
				end if;
			end if;
		end process;

		process(mult_out, out_pipe_reg)
		begin
			if PIPE_REG = '0' then
				out_pipe <= mult_out;
            elsif PIPE_REG = '1' then
				out_pipe <= out_pipe_reg;
			end if;
		end process; 

        --out_reg
		process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				out0_reg_async <= (others=>'0');
			elsif RESET = '1' then
				out0_reg_async <= (others=>'0');
		    elsif (CLK'event and CLK = '1') then	
                if CE = '1' then
					out0_reg_async <= out_pipe;
				end if;
			end if;
		end process;

		process (grstn, CLK)
		begin
			if grstn = '0' then
				out0_reg_sync <= (others=>'0');
		    elsif (CLK'event and CLK = '1') then	
                if RESET = '1' then
					out0_reg_sync <= (others=>'0');
				elsif CE = '1' then
					out0_reg_sync <= out_pipe;
				end if;
			end if;
		end process; 

		process (out_pipe, out0_reg_0)
		begin
			if OUT0_REG = '0' then
				m_out0 <= out_pipe;
            elsif (OUT0_REG = '1') then
				m_out0 <= out0_reg_0;
			end if;
		end process;

        process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				out1_reg_async <= (others=>'0');
			elsif RESET = '1' then
				out1_reg_async <= (others=>'0');
		    elsif (CLK'event and CLK = '1') then	
                if CE = '1' then
					out1_reg_async <= m_out0(71 downto 18);
				end if;
			end if;
		end process;

		process (grstn, CLK)
		begin
			if grstn = '0' then
				out1_reg_sync <= (others=>'0');
		    elsif (CLK'event and CLK = '1') then	
                if RESET = '1' then
					out1_reg_sync <= (others=>'0');
				elsif CE = '1' then
					out1_reg_sync <= m_out0(71 downto 18);
				end if;
			end if;
		end process; 

		process (m_out0, out1_reg_0)
		begin
			if OUT1_REG = '0' then
				m_out1 <= m_out0(71 downto 18);
            elsif (OUT1_REG = '1') then
				m_out1 <= out1_reg_0;
			end if;
		end process;

        process(m_out0,m_out1)
        begin
            m_out(71 downto 18) <= m_out1;
            m_out(17 downto 0) <= m_out0(17 downto 0);
        end process;

		DOUT <= m_out;

end Behavioral;

-----------------MULTALU36X18---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity MULTALU36X18 is
	generic(
		AREG :  bit := '0'; --  '0': bypass mode; '1': registered mode
		BREG :  bit := '0';
		CREG :  bit := '0';
		OUT_REG :  bit := '0';
		PIPE_REG :  bit := '0';
		ASIGN_REG :  bit := '0';
		BSIGN_REG :  bit := '0';
        ACCLOAD_REG0 : bit := '0';
        ACCLOAD_REG1 : bit := '0';
        MULTALU36X18_MODE : integer := 0;--0:36x18 +/- C; 1:ACC/0 + 36x18; 2: 36x18 + CASI
        C_ADD_SUB : bit := '0';-- '0': add;  '1': sub
		MULT_RESET_MODE : string := "SYNC" -- SYNC, ASYNC
	);
    
	port (
		A : in std_logic_vector(17 downto 0);
		B : in std_logic_vector(35 downto 0);
		C : in std_logic_vector(53 downto 0);
		ASIGN, BSIGN, ACCLOAD : in std_logic;
		CE : in std_logic;
		CLK : in std_logic;
		RESET : in std_logic;
		CASI : in std_logic_vector(54 downto 0);
		DOUT : out std_logic_vector(53 downto 0);
		CASO : out std_logic_vector(54 downto 0)
	);
end MULTALU36X18;

architecture Behavioral of MULTALU36X18 is

    signal ina,ina_reg_0,ina_reg_async,ina_reg_sync : std_logic_vector(17 downto 0);
    signal inb,b_in,inb_reg_0,inb_reg_async,inb_reg_sync : std_logic_vector(35 downto 0);
    signal ma,mb : std_logic_vector(53 downto 0);
    signal inc,inc_reg_0,inc_reg_sync,inc_reg_async : std_logic_vector(53 downto 0);

    signal asign_0,bsign_0,asign_reg0,bsign_reg0,absign_reg,absign_0,absign : std_logic;
    signal asign_reg0_async,asign_reg0_sync,bsign_reg0_async,bsign_reg0_sync,absign_reg_async,absign_reg_sync : std_logic;
    signal accload_0, accload0_reg, accload1_reg,accload_1 : std_logic;
    signal alu_sel : std_logic := '1';
    signal alu_sel0, alu_sel1_reg,alu_sel1 : std_logic;
    signal alu_sel0_reg : std_logic := '0';
    signal grstn : std_logic;

    signal out0, out1, out0_async, out0_sync : std_logic_vector(53 downto 0);
    signal out_async, out_sync, out_reg_0, dout_sig : std_logic_vector(54 downto 0);
    signal m_out : std_logic_vector(54 downto 0) := (others=>'0');
	signal mult_out : std_logic_vector(53 downto 0);
	signal mult_out_tmp : std_logic_vector(107 downto 0);
	signal out_ext,inc_ext,acc_load : std_logic_vector(54 downto 0);

    begin
		grstn <= GSRO;

		process (ina_reg_sync, ina_reg_async, inb_reg_sync, inb_reg_async, inc_reg_async, inc_reg_sync, asign_reg0_async, asign_reg0_sync, bsign_reg0_async, bsign_reg0_sync, absign_reg_async, absign_reg_sync, out0_async, out0_sync, out_async, out_sync)
		begin
			if MULT_RESET_MODE = "ASYNC" then
				ina_reg_0 <= ina_reg_async;
				inb_reg_0 <= inb_reg_async;
				inc_reg_0 <= inc_reg_async;
				asign_reg0 <= asign_reg0_async;
				bsign_reg0 <= bsign_reg0_async;
				absign_reg <= absign_reg_async;
				out0 <= out0_async;
				out_reg_0 <= out_async;
			elsif MULT_RESET_MODE = "SYNC" then
				ina_reg_0 <= ina_reg_sync;
				inb_reg_0 <= inb_reg_sync;
				inc_reg_0 <= inc_reg_sync;
				asign_reg0 <= asign_reg0_sync;
				bsign_reg0 <= bsign_reg0_sync;
				absign_reg <= absign_reg_sync;
				out0 <= out0_sync;
				out_reg_0 <= out_sync;
			end if;
		end process;

		process(CLK, RESET, grstn)
		begin
			if (grstn = '0') then
				ina_reg_async <= (others=>'0');
			elsif RESET = '1' then
				ina_reg_async <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
                if CE = '1' then
					ina_reg_async <= A;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if (grstn = '0') then
				ina_reg_sync <= (others=>'0');
			elsif (CLK'event and CLK = '1') then
			    if (RESET = '1') then
				    ina_reg_sync <= (others=>'0');
                elsif (CE = '1') then
					ina_reg_sync <= A;
				end if;
			end if;
		end process;

		process(CLK, RESET, grstn)
		begin
			if grstn = '0' then
				inb_reg_async <= (others=>'0');
			elsif RESET = '1' then
				inb_reg_async <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
                if (CE = '1') then
					inb_reg_async <= B;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if grstn = '0' then
				inb_reg_sync <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
				if RESET = '1' then
				    inb_reg_sync <= (others=>'0');
                elsif CE = '1' then
					inb_reg_sync <= B;
				end if;
			end if;
		end process;

        process(CLK, RESET, grstn)
		begin
			if (grstn = '0') then
				inc_reg_async <= (others=>'0');
			elsif RESET = '1' then
				inc_reg_async <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
                if CE = '1' then
					inc_reg_async <= C;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if (grstn = '0') then
				inc_reg_sync <= (others=>'0');
			elsif (CLK'event and CLK = '1') then
			    if (RESET = '1') then
				    inc_reg_sync <= (others=>'0');
                elsif (CE = '1') then
					inc_reg_sync <= C;
				end if;
			end if;
		end process;

        process (ina_reg_0, A)
		begin
			if AREG = '0' then
				ina <= A;
			else
				ina <= ina_reg_0;
			end if;
		end process;

        process (inb_reg_0, B)
		begin
			if BREG = '0' then
				inb <= B;
			else
				inb <= inb_reg_0;
			end if;
		end process;

        process (inc_reg_0, C)
		begin
			if CREG = '0' then
				inc <= C;
			else
				inc <= inc_reg_0;
			end if;
		end process;

        process (inb, bsign_0)
		begin
			if (bsign_0 = '1') then
				mb(35 downto 0) <= inb(35 downto 0);
				mb(53 downto 36) <= (others=>inb(35));
			else
				mb(35 downto 0) <= inb(35 downto 0);
				mb(53 downto 36) <= (others=>'0');
			end if;
		end process;

		process (ina, asign_0)
		begin
			if (asign_0 = '1') then
				ma(17 downto 0) <= ina(17 downto 0);
				ma(53 downto 18) <= (others=>ina(17));
			else
				ma(17 downto 0) <= ina(17 downto 0);
				ma(53 downto 18) <= (others=>'0');
			end if;
		end process;

        mult_out_tmp <= ma * mb;
        mult_out <= mult_out_tmp(53 downto 0);

        -- sign reg
		process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				asign_reg0_async <= '0';
			elsif RESET = '1' then
				asign_reg0_async <= '0';
            elsif (CLK'event and CLK = '1') then
				if CE = '1' then
					asign_reg0_async <= ASIGN;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if grstn = '0' then
				asign_reg0_sync <= '0';
			elsif (CLK'event and CLK = '1') then
                if RESET = '1' then
				    asign_reg0_sync <= '0';
                elsif CE = '1' then
					asign_reg0_sync <= ASIGN;
				end if;
			end if;
		end process;

		process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				bsign_reg0_async <= '0';
			elsif RESET = '1' then
				bsign_reg0_async <= '0';
            elsif (CLK'event and CLK = '1') then
                if CE = '1' then
					bsign_reg0_async <= BSIGN;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if grstn = '0' then
				bsign_reg0_sync <= '0';
			elsif (CLK'event and CLK = '1') then
                if RESET = '1' then
			    	bsign_reg0_sync <= '0';
			    elsif CE = '1' then
					bsign_reg0_sync <= BSIGN;
				end if;
			end if;
		end process;

       	process(ASIGN, asign_reg0)
		begin
			if ASIGN_REG = '0' then
				asign_0 <= ASIGN;
			else
				asign_0 <= asign_reg0;
			end if;
		end process;
		
		process(BSIGN, bsign_reg0)
		begin
			if BSIGN_REG = '0' then
				bsign_0 <= BSIGN;
			else
				bsign_0 <= bsign_reg0;
			end if;
		end process;

        absign_0 <= asign_0 or bsign_0;

        process (CLK, grstn)
		begin
			if grstn = '0' then
				alu_sel0_reg <= '0';
			elsif (CLK'event and CLK = '1') then
                if CE = '1' then
					alu_sel0_reg <= alu_sel;
				end if;
			end if;
		end process;

        process (CLK, grstn)
		begin
			if grstn = '0' then
				alu_sel1_reg <= '0';
			elsif (CLK'event and CLK = '1') then
                if CE = '1' then
					alu_sel1_reg <= alu_sel0;
				end if;
			end if;
		end process;

        process (CLK, grstn)
		begin
			if grstn = '0' then
				accload0_reg <= '0';
			elsif (CLK'event and CLK = '1') then
                if CE = '1' then
					accload0_reg <= ACCLOAD;
				end if;
			end if;
		end process;

        process(ACCLOAD, accload0_reg, alu_sel, alu_sel0_reg)
        begin
            if (ACCLOAD_REG0 = '0') then
                accload_0 <= ACCLOAD;
                alu_sel0 <= alu_sel;
            else
                accload_0 <= accload0_reg;
                alu_sel0 <= alu_sel0_reg;
            end if;
        end process;

        process (CLK, grstn)
		begin
			if grstn = '0' then
				accload1_reg <= '0';
			elsif (CLK'event and CLK = '1') then
                if CE = '1' then
					accload1_reg <= accload_0;
				end if;
			end if;
		end process;

        process(accload_0, accload1_reg, alu_sel0, alu_sel1_reg)
        begin
            if (ACCLOAD_REG1 = '0') then
                accload_1 <= accload_0;
                alu_sel1 <= alu_sel0;
            else
                accload_1 <= accload1_reg;
                alu_sel1 <= alu_sel1_reg;
            end if;
        end process;

        --pipe_reg
        process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				out0_async <= (others=>'0');
                absign_reg_async <= '0';
			elsif RESET = '1' then
				out0_async <= (others=>'0');
                absign_reg_async <= '0';
            elsif (CLK'event and CLK = '1') then
			    if CE = '1' then
				    out0_async <= mult_out;
                    absign_reg_async <= absign_0;
			    end if;
			end if;
		end process;

		process(CLK, grstn)
		begin
			if grstn = '0' then
				out0_sync <= (others=>'0');
                absign_reg_sync <= '0';
			elsif (CLK'event and CLK = '1') then
                if RESET = '1' then
				    out0_sync <= (others=>'0');
                    absign_reg_sync <= '0';
				elsif CE = '1' then
					out0_sync <= mult_out;
                    absign_reg_sync <= absign_0;
				end if;
			end if;
		end process;

		process(mult_out, out0, absign_0, absign_reg)
		begin
			if PIPE_REG = '0' then
				out1 <= mult_out;
                absign <= absign_0;
			else
				out1 <= out0;
                absign <= absign_reg;
			end if;
		end process;

        process (inc, alu_sel1)
        begin 
            if(alu_sel1 = '1') then
                inc_ext(53 downto 0) <= inc(53 downto 0);
                inc_ext(54) <= '0';
            else
                inc_ext(54 downto 0) <= (others=>'0');
            end if;     
        end process;

        process(out1, absign, alu_sel1)
        begin
            if(alu_sel1 = '1') then
                if(absign = '1') then
                    out_ext(53 downto 0) <= out1(53 downto 0);
                    out_ext(54) <= out1(53);
                else 
                    out_ext(53 downto 0) <= out1(53 downto 0);
                    out_ext(54) <= '0';
                end if;
            else
                out_ext(54 downto 0) <= (others=>'0');
            end if;    
        end process;

        acc_load <= m_out when (accload_1 = '1') else (others=>'0');

        process(inc_ext, CASI, out_ext, acc_load)
        begin
            if(MULTALU36X18_MODE = 0) then       --36x18 +/- C
                if(C_ADD_SUB = '0') then
                    dout_sig <= out_ext + inc_ext;
                else
                    dout_sig <= out_ext - inc_ext;
                end if;
            elsif(MULTALU36X18_MODE = 1) then    --ACC/0 + 36x18
                dout_sig <= acc_load + out_ext;
            elsif (MULTALU36X18_MODE = 2) then   --36x18 + CASI
                dout_sig <= out_ext + CASI;
            end if;
        end process;

		process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				out_async <= (others=>'0');
			elsif RESET = '1' then
				out_async <= (others=>'0');
		    elsif (CLK'event and CLK = '1') then	
                if CE = '1' then
					out_async <= dout_sig;
				end if;
			end if;
		end process;

		process (grstn, CLK)
		begin
			if grstn = '0' then
				out_sync <= (others=>'0');
		    elsif (CLK'event and CLK = '1') then	
                if RESET = '1' then
					out_sync <= (others=>'0');
				elsif CE = '1' then
					out_sync <= dout_sig;
				end if;
			end if;
		end process;

		process (dout_sig, out_reg_0)
		begin
			if OUT_REG = '0' then
				m_out <= dout_sig;
			else
				m_out <= out_reg_0;
			end if;
		end process;

		DOUT <= m_out(53 downto 0);

        process (m_out, absign)
		begin
			if (absign = '1') then
				CASO(53 downto 0) <= m_out(53 downto 0);
				CASO(54) <= m_out(53);
			else
				CASO(53 downto 0) <= m_out(53 downto 0);
				CASO(54) <= '0';
			end if;
		end process;

end Behavioral;

-----------------MULTADDALU18X18---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity MULTADDALU18X18 is
	generic(
		A0REG : bit := '0';-- '0': bypass mode; '1': registered mode
		B0REG : bit := '0'; 
		A1REG : bit := '0';
		B1REG : bit := '0';
		CREG : bit := '0';
		OUT_REG : bit := '0';
		PIPE0_REG : bit := '0';
		PIPE1_REG : bit := '0';
		ASIGN0_REG : bit := '0';
		BSIGN0_REG : bit := '0';
		ASIGN1_REG : bit := '0';
		BSIGN1_REG : bit := '0';
		ACCLOAD_REG0 : bit := '0';
		ACCLOAD_REG1 : bit := '0';
        SOA_REG : bit := '0';
		B_ADD_SUB : bit := '0';  -- '0': add; '1': sub
		C_ADD_SUB : bit := '0';
		MULTADDALU18X18_MODE : integer := 0;--0:18x18 +/- 18x18 +/- C;  1: ACC/0 + 18x18 +/- 18x18; 2:18x18 +/- 18x18 + CASI
		MULT_RESET_MODE : string := "SYNC" -- SYNC, ASYNC
	);

	port (
		A0,A1 : in std_logic_vector(17 downto 0);
		B0,B1 : in std_logic_vector(17 downto 0);
		SIA,SIB : in std_logic_vector(17 downto 0);
		C : in std_logic_vector(53 downto 0);
        ASIGN,BSIGN : in std_logic_vector(1 downto 0);
        ASEL,BSEL : in std_logic_vector(1 downto 0);
        CASI : in std_logic_vector(54 downto 0);
        ACCLOAD : in std_logic;
		CE : in std_logic;
		CLK : in std_logic;
		RESET : in std_logic;
		DOUT : out std_logic_vector(53 downto 0);
        SOA,SOB : out std_logic_vector(17 downto 0);
		CASO : out std_logic_vector(54 downto 0)
	);
end MULTADDALU18X18;

architecture Behavioral of MULTADDALU18X18 is
    signal mina0,mina1,minb0,minb1,ina0_reg_0,inb0_reg_0,ina1_reg_0,ina2_reg,inb1_reg_0,ina0,inb0,ina1,ina2,inb1 : std_logic_vector(17 downto 0);
    signal ina0_reg_async,ina0_reg_sync,ina1_reg_async,ina1_reg_sync,ina2_reg_async,ina2_reg_sync,inb0_reg_async,inb0_reg_sync,inb1_reg_async,inb1_reg_sync : std_logic_vector(17 downto 0);
    signal inc_reg_async,inc_reg_sync,inc_reg_0,inc : std_logic_vector(53 downto 0);

    signal asign0_0_reg_async,asign0_0_reg_sync,asign1_0_reg_async,asign1_0_reg_sync,absign_0_reg_async,absign_0_reg_sync,absign_1_reg_async,absign_1_reg_sync : std_logic;
    signal asign0_0_reg,asign1_0_reg,absign_0_reg,absign_1_reg, asign0_0,asign1_0,absign0_0,absign1_0,absign_0,absign_1,absign,absign_0_0,absign_1_0 : std_logic;
    signal bsign0_0_reg_async,bsign0_0_reg_sync,bsign1_0_reg_async,bsign1_0_reg_sync : std_logic;
    signal bsign0_0,bsign0_0_reg,bsign1_0_reg,bsign1_0 : std_logic; 
    signal accload_0, accload0_reg, accload1_reg,accload_1 : std_logic;
    signal alu_sel : std_logic := '1';
    signal alu_sel0, alu_sel1_reg,alu_sel1 : std_logic;
    signal  alu_sel0_reg : std_logic := '0';

    signal mult_out0,mult_out1,out0_reg_async,out0_reg_sync,out1_reg_async,out1_reg_sync,out0,out0_reg,out1_reg,out1 : std_logic_vector(35 downto 0);
    signal mult_out0_tmp,mult_out1_tmp : std_logic_vector(71 downto 0);
    signal out0_0,out1_0 : std_logic_vector(54 downto 0);
    signal ma0, mb0, ma1, mb1 : std_logic_vector(35 downto 0);
    signal inc_ext,acc_load,dout_sig,m_out,out_reg_0,out_sync,out_async : std_logic_vector(54 downto 0);
    signal ab_sign0,ab_sign1 : std_logic;
    signal grstn : std_logic;

    begin
        
        grstn <= GSRO;
        
        process (ina0_reg_async, ina0_reg_sync, ina1_reg_async, ina1_reg_sync, ina2_reg_async, ina2_reg_sync, inb0_reg_async, inb0_reg_sync, inb1_reg_async, inb1_reg_sync, inc_reg_async, inc_reg_sync, asign0_0_reg_async, asign0_0_reg_sync, asign1_0_reg_async, asign1_0_reg_sync, absign_0_reg_async, absign_0_reg_sync, bsign0_0_reg_async, bsign0_0_reg_sync, bsign1_0_reg_async, bsign1_0_reg_sync, absign_1_reg_async, absign_1_reg_sync, out0_reg_async, out0_reg_sync, out1_reg_async, out1_reg_sync, out_sync, out_async)
        begin
            if (MULT_RESET_MODE = "ASYNC") then
                ina0_reg_0 <= ina0_reg_async;
                ina1_reg_0 <= ina1_reg_async;
                ina2_reg <= ina2_reg_async;
                inb0_reg_0 <= inb0_reg_async;
                inb1_reg_0 <= inb1_reg_async;
                inc_reg_0 <= inc_reg_async;
                asign0_0_reg <= asign0_0_reg_async;
                asign1_0_reg <= asign1_0_reg_async;
                bsign0_0_reg <= bsign0_0_reg_async;
                bsign1_0_reg <= bsign1_0_reg_async;
                absign_0_reg <= absign_0_reg_async;
                absign_1_reg <= absign_1_reg_async;
                out0_reg <= out0_reg_async;
                out1_reg <= out1_reg_async;
                out_reg_0 <= out_async;
            elsif (MULT_RESET_MODE = "SYNC") then
                ina0_reg_0 <= ina0_reg_sync;
                ina1_reg_0 <= ina1_reg_sync;
                ina2_reg <= ina2_reg_sync;
                inb0_reg_0 <= inb0_reg_sync;
                inb1_reg_0 <= inb1_reg_sync;
                inc_reg_0 <= inc_reg_sync;
                asign0_0_reg <= asign0_0_reg_sync;
                asign1_0_reg <= asign1_0_reg_sync;
                bsign0_0_reg <= bsign0_0_reg_sync;
                bsign1_0_reg <= bsign1_0_reg_sync;
                absign_0_reg <= absign_0_reg_sync;
                absign_1_reg <= absign_1_reg_sync;
                out0_reg <= out0_reg_sync;
                out1_reg <= out1_reg_sync;
                out_reg_0 <= out_sync;         
            end if;
        end process;

        process(A0, SIA, ASEL) 
        begin
            if(ASEL(0) = '0') then
                mina0 <= A0;
            else
                mina0 <= SIA;
            end if;
        end process;

        -- input reg
        process(CLK, RESET, grstn)
		begin
			if (grstn = '0') then
				ina0_reg_async <= (others=>'0');
			elsif RESET = '1' then
				ina0_reg_async <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
                if CE = '1' then
					ina0_reg_async <= mina0;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if (grstn = '0') then
				ina0_reg_sync <= (others=>'0');
			elsif (CLK'event and CLK = '1') then
			    if (RESET = '1') then
				    ina0_reg_sync <= (others=>'0');
                elsif (CE = '1') then
					ina0_reg_sync <= mina0;
				end if;
			end if;
		end process;

        process(A0, ina0, ASEL) 
        begin
            if(ASEL(1) = '0') then
                mina1 <= A1;
            else
                mina1 <= ina0;
            end if;
        end process;

        process(CLK, RESET, grstn)
		begin
			if (grstn = '0') then
				ina1_reg_async <= (others=>'0');
				ina2_reg_async <= (others=>'0');
			elsif RESET = '1' then
				ina1_reg_async <= (others=>'0');
				ina2_reg_async <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
                if CE = '1' then
					ina1_reg_async <= mina1;
				    ina2_reg_async <= ina1;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if (grstn = '0') then
				ina1_reg_sync <= (others=>'0');
				ina2_reg_sync <= (others=>'0');
			elsif (CLK'event and CLK = '1') then
			    if (RESET = '1') then
				    ina1_reg_sync <= (others=>'0');
				    ina2_reg_sync <= (others=>'0');
                elsif (CE = '1') then
					ina1_reg_sync <= mina1;
				    ina2_reg_sync <= ina1;
				end if;
			end if;
		end process;

        process (ina0_reg_0, mina0)
		begin
			if A0REG = '0' then
				ina0 <= mina0;
			else
				ina0 <= ina0_reg_0;
			end if;
		end process;

        process (mina1, ina1_reg_0)
		begin
			if A1REG = '0' then
				ina1 <= mina1;
			else
				ina1 <= ina1_reg_0;
			end if;
		end process;

        process (ina1, ina2_reg)
		begin
			if SOA_REG = '0' then
				ina2 <= ina1;
			else
				ina2 <= ina2_reg;
			end if;
		end process;

        SOA <= ina2;

        process(B0, SIB, BSEL) 
        begin
            if(BSEL(0) = '0') then 
                minb0 <= B0;
            else
                minb0 <= SIB;
            end if;
        end process;

		process(CLK, RESET, grstn)
		begin
			if grstn = '0' then
				inb0_reg_async <= (others=>'0');
			elsif RESET = '1' then
				inb0_reg_async <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
                if (CE = '1') then
					inb0_reg_async <= minb0;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if grstn = '0' then
				inb0_reg_sync <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
				if RESET = '1' then
				    inb0_reg_sync <= (others=>'0');
                elsif CE = '1' then
					inb0_reg_sync <= minb0;
				end if;
			end if;
		end process;

        process(B1, inb0, BSEL) 
        begin
            if(BSEL(1) = '0') then 
                minb1 <= B1;
            else
                minb1 <= inb0;
            end if;
        end process;
        
		process(CLK, RESET, grstn)
		begin
			if grstn = '0' then
				inb1_reg_async <= (others=>'0');
			elsif RESET = '1' then
				inb1_reg_async <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
                if (CE = '1') then
					inb1_reg_async <= minb1;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if grstn = '0' then
				inb1_reg_sync <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
				if RESET = '1' then
				    inb1_reg_sync <= (others=>'0');
                elsif CE = '1' then
					inb1_reg_sync <= minb1;
				end if;
			end if;
		end process;

        process(CLK, RESET, grstn)
		begin
			if grstn = '0' then
				inc_reg_async <= (others=>'0');
			elsif RESET = '1' then
				inc_reg_async <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
                if (CE = '1') then
					inc_reg_async <= C;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if grstn = '0' then
				inc_reg_sync <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
				if RESET = '1' then
				    inc_reg_sync <= (others=>'0');
                elsif CE = '1' then
					inc_reg_sync <= C;
				end if;
			end if;
		end process;

        process (inb0_reg_0, minb0)
		begin
			if B0REG = '0' then
				inb0 <= minb0;
			else
				inb0 <= inb0_reg_0;
			end if;
		end process;

        process (inb1_reg_0, minb1)
		begin
			if B1REG = '0' then
				inb1 <= minb1;
			else
				inb1 <= inb1_reg_0;
			end if;
		end process;

        SOB <= inb1;

        process (inc_reg_0, C)
		begin
			if CREG = '0' then
				inc <= C;
			else
				inc <= inc_reg_0;
			end if;
		end process;

        -- sign reg
		process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				asign0_0_reg_async <= '0';
			elsif RESET = '1' then
				asign0_0_reg_async <= '0';
            elsif (CLK'event and CLK = '1') then
				if CE = '1' then
					asign0_0_reg_async <= ASIGN(0);
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if grstn = '0' then
				asign0_0_reg_sync <= '0';
			elsif (CLK'event and CLK = '1') then
                if RESET = '1' then
				    asign0_0_reg_sync <= '0';
                elsif CE = '1' then
					asign0_0_reg_sync <= ASIGN(0);
				end if;
			end if;
		end process;

		process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				bsign0_0_reg_async <= '0';
			elsif RESET = '1' then
				bsign0_0_reg_async <= '0';
            elsif (CLK'event and CLK = '1') then
                if CE = '1' then
					bsign0_0_reg_async <= BSIGN(0);
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if grstn = '0' then
				bsign0_0_reg_sync <= '0';
			elsif (CLK'event and CLK = '1') then
                if RESET = '1' then
			    	bsign0_0_reg_sync <= '0';
			    elsif CE = '1' then
					bsign0_0_reg_sync <= BSIGN(0);
				end if;
			end if;
		end process;

        process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				asign1_0_reg_async <= '0';
			elsif RESET = '1' then
					asign1_0_reg_async <= '0';
            elsif (CLK'event and CLK = '1') then
				if CE = '1' then
					asign1_0_reg_async <= ASIGN(1);
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if grstn = '0' then
				asign1_0_reg_sync <= '0';
			elsif (CLK'event and CLK = '1') then
                if RESET = '1' then
				    asign1_0_reg_sync <= '0';
                elsif CE = '1' then
					asign1_0_reg_sync <= ASIGN(1);
				end if;
			end if;
		end process;

		process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				bsign1_0_reg_async <= '0';
			elsif RESET = '1' then
				bsign1_0_reg_async <= '0';
            elsif (CLK'event and CLK = '1') then
                if CE = '1' then
					bsign1_0_reg_async <= BSIGN(1);
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if grstn = '0' then
				bsign1_0_reg_sync <= '0';
			elsif (CLK'event and CLK = '1') then
                if RESET = '1' then
			    	bsign1_0_reg_sync <= '0';
			    elsif CE = '1' then
					bsign1_0_reg_sync <= BSIGN(1);
				end if;
			end if;
		end process;

		process(ASIGN(0), asign0_0_reg)
		begin
			if ASIGN0_REG = '0' then
				asign0_0 <= ASIGN(0);
			else
				asign0_0 <= asign0_0_reg;
			end if;
		end process;
		
		process(BSIGN(0), bsign0_0_reg)
		begin
			if BSIGN0_REG = '0' then
				bsign0_0 <= BSIGN(0);
			else
				bsign0_0 <= bsign0_0_reg;
			end if;
		end process;

        process(ASIGN(1), asign1_0_reg)
		begin
			if ASIGN1_REG = '0' then
				asign1_0 <= ASIGN(1);
			else
				asign1_0 <= asign1_0_reg;
			end if;
		end process;
		
		process(BSIGN(1), bsign1_0_reg)
		begin
			if BSIGN1_REG = '0' then
				bsign1_0 <= BSIGN(1);
			else
				bsign1_0 <= bsign1_0_reg;
			end if;
		end process;

        absign_0_0 <= asign0_0 or bsign0_0;
        absign_1_0 <= asign1_0 or bsign1_0;

        process (CLK, grstn)
		begin
			if grstn = '0' then
				alu_sel0_reg <= '0';
			elsif (CLK'event and CLK = '1') then
                if CE = '1' then
					alu_sel0_reg <= alu_sel;
				end if;
			end if;
		end process;

        process (CLK, grstn)
		begin
			if grstn = '0' then
				alu_sel1_reg <= '0';
			elsif (CLK'event and CLK = '1') then
                if CE = '1' then
					alu_sel1_reg <= alu_sel0;
				end if;
			end if;
		end process;

        -- ACCLOAD reg
        process (CLK, grstn)
		begin
			if grstn = '0' then
				accload0_reg <= '0';
			elsif (CLK'event and CLK = '1') then
                if CE = '1' then
					accload0_reg <= ACCLOAD;
				end if;
			end if;
		end process;
		
        process (CLK, grstn)
		begin
			if grstn = '0' then
				accload1_reg <= '0';
			elsif (CLK'event and CLK = '1') then
                if CE = '1' then
					accload1_reg <= accload_0;
				end if;
			end if;
		end process;

        process (ACCLOAD, accload0_reg, alu_sel, alu_sel0_reg)
        begin
            if (ACCLOAD_REG0 = '0') then
                accload_0 <= ACCLOAD;
                alu_sel0 <= alu_sel;
            else
                accload_0 <= accload0_reg;
                alu_sel0 <= alu_sel0_reg;
            end if;
        end process;

        process (accload_0, accload1_reg, alu_sel0, alu_sel1_reg)
        begin
            if (ACCLOAD_REG1 = '0') then
                accload_1 <= accload_0;
                alu_sel1 <= alu_sel0;
            else
                accload_1 <= accload1_reg;
                alu_sel1 <= alu_sel1_reg;
            end if;
        end process;

        process (ina0, asign0_0)
		begin
			if (asign0_0 = '1') then
				ma0(17 downto 0) <= ina0(17 downto 0);
				ma0(35 downto 18) <= (others=>ina0(17));
			else
				ma0(17 downto 0) <= ina0(17 downto 0);
				ma0(35 downto 18) <= (others=>'0');
			end if;
		end process;

		process (inb0, bsign0_0)
		begin
			if (bsign0_0 = '1') then
				mb0(17 downto 0) <= inb0(17 downto 0);
				mb0(35 downto 18) <= (others=>inb0(17));
			else
				mb0(17 downto 0) <= inb0(17 downto 0);
				mb0(35 downto 18) <= (others=>'0');
			end if;
		end process;

        process (ina1, asign1_0)
		begin
			if (asign1_0 = '1') then
				ma1(17 downto 0) <= ina1(17 downto 0);
				ma1(35 downto 18) <= (others=>ina1(17));
			else
				ma1(17 downto 0) <= ina1(17 downto 0);
				ma1(35 downto 18) <= (others=>'0');
			end if;
		end process;

		process (inb1, bsign1_0)
		begin
			if (bsign1_0 = '1') then
				mb1(17 downto 0) <= inb1(17 downto 0);
				mb1(35 downto 18) <= (others=>inb1(17));
			else
				mb1(17 downto 0) <= inb1(17 downto 0);
				mb1(35 downto 18) <= (others=>'0');
			end if;
		end process;

        mult_out0_tmp <= ma0 * mb0;
        mult_out1_tmp <= ma1 * mb1;
        mult_out0 <= mult_out0_tmp(35 downto 0);
        mult_out1 <= mult_out1_tmp(35 downto 0);

        -- pipeline reg
        process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				out0_reg_async <= (others=>'0');
                absign_0_reg_async <= '0';
			elsif RESET = '1' then
				out0_reg_async <= (others=>'0');
                absign_0_reg_async <= '0';
            elsif (CLK'event and CLK = '1') then
			    if CE = '1' then
				    out0_reg_async <= mult_out0;
                    absign_0_reg_async <= absign_0_0;                    
			    end if;
			end if;
		end process;

		process(CLK, grstn)
		begin
			if grstn = '0' then
				out0_reg_sync <= (others=>'0');
                absign_0_reg_sync <= '0';
			elsif (CLK'event and CLK = '1') then
                if RESET = '1' then
				    out0_reg_sync <= (others=>'0');
                    absign_0_reg_sync <= '0';
				elsif CE = '1' then
					out0_reg_sync <= mult_out0;
                    absign_0_reg_sync <= absign_0_0;
				end if;
			end if;
		end process;

		process(mult_out0, out0_reg, absign_0_0, absign_0_reg)
		begin
			if PIPE0_REG = '0' then
				out0 <= mult_out0;
                absign_0 <= absign_0_0;
			else
				out0 <= out0_reg;
                absign_0 <= absign_0_reg;
			end if;
		end process;

        process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				out1_reg_async <= (others=>'0');
                absign_1_reg_async <= '0';
			elsif RESET = '1' then
				out1_reg_async <= (others=>'0');
                absign_1_reg_async <= '0';
            elsif (CLK'event and CLK = '1') then
			    if CE = '1' then
				    out1_reg_async <= mult_out1;
                    absign_1_reg_async <= absign_1_0;
			    end if;
			end if;
		end process;

		process(CLK, grstn)
		begin
			if grstn = '0' then
				out1_reg_sync <= (others=>'0');
                absign_1_reg_sync <= '0';
			elsif (CLK'event and CLK = '1') then
                if RESET = '1' then
				    out1_reg_sync <= (others=>'0');
                    absign_1_reg_sync <= '0';
				elsif CE = '1' then
					out1_reg_sync <= mult_out1;
                    absign_1_reg_sync <= absign_1_0;
				end if;
			end if;
		end process;

		process(mult_out1, out1_reg, absign_1_0, absign_1_reg)
		begin
			if PIPE1_REG = '0' then
				out1 <= mult_out1;
                absign_1 <= absign_1_0;
			else
				out1 <= out1_reg;
                absign_1 <= absign_1_reg;
			end if;
		end process;
		
        absign <= absign_0 or absign_1;

        process (out0, absign_0, alu_sel1)
		begin
            if(alu_sel1 = '1') then
			    if (absign_0 = '1') then
				    out0_0(35 downto 0) <= out0(35 downto 0);
				    out0_0(54 downto 36) <= (others=>out0(35));
			    else
				    out0_0(35 downto 0) <= out0(35 downto 0);
				    out0_0(54 downto 36) <= (others=>'0');
			    end if;
            else 
                out0_0(54 downto 0) <= (others=>'0');
            end if;    
		end process;

        process (out1, absign_1, alu_sel1)
		begin
			if(alu_sel1 = '1') then
			    if (absign_1 = '1') then
				    out1_0(35 downto 0) <= out1(35 downto 0);
				    out1_0(54 downto 36) <= (others=>out1(35));
			    else
				    out1_0(35 downto 0) <= out1(35 downto 0);
				    out1_0(54 downto 36) <= (others=>'0');
			    end if;
            else
				out1_0(54 downto 0) <= (others=>'0');
            end if;    
		end process;

        process (inc, alu_sel1)
        begin
            if(alu_sel1 = '1') then
                inc_ext(53 downto 0) <= inc(53 downto 0);
                inc_ext(54) <= '0';
            else 
                inc_ext(54 downto 0) <= (others=>'0');
            end if;
        end process;

        acc_load <= m_out when (accload_1 = '1') else (others=>'0');

        process(inc_ext, CASI, out0_0, out1_0,acc_load)
        begin
            if(MULTADDALU18X18_MODE = 0) then   --18x18 +/- 18x18 +/- C
                if(B_ADD_SUB = '0' and C_ADD_SUB = '0') then
                    dout_sig <= out0_0 + out1_0 + inc_ext;
                elsif(B_ADD_SUB = '0' and C_ADD_SUB = '1') then
                    dout_sig <= out0_0 + out1_0 - inc_ext;
                elsif(B_ADD_SUB = '1' and C_ADD_SUB = '0') then
                    dout_sig <= out0_0 - out1_0 + inc_ext;
                elsif(B_ADD_SUB = '1' and C_ADD_SUB = '1') then
                    dout_sig <= out0_0 - out1_0 - inc_ext;
                end if;
            elsif(MULTADDALU18X18_MODE = 1) then   --accumulator,ACC/0 + 18x18 +/- 18x18
                if(B_ADD_SUB = '0') then
                    dout_sig <= acc_load + out0_0 + out1_0;
                else
                    dout_sig <= acc_load + out0_0 - out1_0;
                end if;
            elsif (MULTADDALU18X18_MODE = 2) then  --18x18 +/- 18x18 + CASI
                if(B_ADD_SUB = '0') then
                    dout_sig <= out0_0 + out1_0 + CASI;
                else
                    dout_sig <= out0_0 - out1_0 + CASI;
                end if;
            end if;
        end process;

        process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				out_async <= (others=>'0');
			elsif RESET = '1' then
				out_async <= (others=>'0');
		    elsif (CLK'event and CLK = '1') then	
                if CE = '1' then
					out_async <= dout_sig;
				end if;
			end if;
		end process;

		process (grstn, CLK)
		begin
			if grstn = '0' then
				out_sync <= (others=>'0');
		    elsif (CLK'event and CLK = '1') then	
                if RESET = '1' then
					out_sync <= (others=>'0');
				elsif CE = '1' then
					out_sync <= dout_sig;
				end if;
			end if;
		end process; 

		process (dout_sig, out_reg_0)
		begin
			if OUT_REG = '0' then
				m_out <= dout_sig;
			else
				m_out <= out_reg_0;
			end if;
		end process;

        DOUT <= m_out(53 downto 0);
        
        process (m_out, absign)
		begin
			if (absign = '1') then
				CASO(53 downto 0) <= m_out(53 downto 0);
				CASO(54) <= m_out(53);
			else
				CASO(53 downto 0) <= m_out(53 downto 0);
				CASO(54) <= '0';
			end if;
		end process;


end Behavioral;	


-----------------MULTALU18X18---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity MULTALU18X18 is
	generic(
		AREG : bit := '0';-- '0': bypass mode; '1': registered mode
		BREG : bit := '0'; 
		CREG : bit := '0';
		DREG : bit := '0';
        OUT_REG : bit := '0';
		PIPE_REG : bit := '0';
		ASIGN_REG : bit := '0';
		BSIGN_REG : bit := '0';
		DSIGN_REG : bit := '0';
		ACCLOAD_REG0 : bit := '0';
		ACCLOAD_REG1 : bit := '0';
		B_ADD_SUB : bit := '0';  -- '0': add; '1': sub
		C_ADD_SUB : bit := '0';
		MULTALU18X18_MODE : integer := 0;--0:ACC/0 +/- 18x18 +/- C; 1:ACC/0 +/- 18x18 + CASI; 2: 18x18 +/- D + CASI;
		MULT_RESET_MODE : string := "SYNC" -- SYNC, ASYNC
	);

	port (
		A : in std_logic_vector(17 downto 0);
		B : in std_logic_vector(17 downto 0);
		C, D : in std_logic_vector(53 downto 0);
        ASIGN, BSIGN : in std_logic;
        CASI : in std_logic_vector(54 downto 0);
        ACCLOAD,DSIGN : in std_logic;
		CE : in std_logic;
		CLK : in std_logic;
		RESET : in std_logic;
		DOUT : out std_logic_vector(53 downto 0);
		CASO : out std_logic_vector(54 downto 0)
	);
end MULTALU18X18;

architecture Behavioral of MULTALU18X18 is
    signal ina0_reg_async, ina0_reg_sync, ina0_reg, inb0_reg,ina1, inb1,inb0_reg_async, inb0_reg_sync : std_logic_vector(17 downto 0);
    signal ina,inb : std_logic_vector(35 downto 0);
    signal inc_reg_async,inc_reg_sync,inc_reg_0,inc : std_logic_vector(53 downto 0);
    signal ind_0, ind_reg_0, ind_reg_async, ind_reg_sync : std_logic_vector(53 downto 0);

    signal asign0_reg_async,asign0_reg_sync,bsign0_reg_async,bsign0_reg_sync,asign_0,bsign_0,asign0_reg, bsign0_reg,absign_reg_async, absign_reg,absign_reg_sync, absign_0, absign : std_logic;
    signal dsign_reg_async,dsign_reg_sync,dsign_0,dsign_reg_0 : std_logic;
    signal accload_0, accload0_reg, accload1_reg,accload_1 : std_logic;
    signal alu_sel : std_logic := '1';
    signal alu_sel0, alu_sel1_reg,alu_sel1 : std_logic;
    signal alu_sel0_reg : std_logic := '0';

    signal mult_out, out0_async, out0_sync, out0, out1 : std_logic_vector(35 downto 0);
    signal mult_out_tmp : std_logic_vector(71 downto 0);
    signal ppout1_ext,acc_reg_async, acc_reg_sync, acc_reg : std_logic_vector(54 downto 0);
    signal acc_load,ind_ext,inc_ext,acc_out,dout_sig : std_logic_vector(54 downto 0);
    signal grstn : std_logic;

    begin
        
        grstn <= GSRO;
        
        process (ina0_reg_sync, ina0_reg_async, inb0_reg_sync, inb0_reg_async, inc_reg_async, inc_reg_sync, asign0_reg_async, asign0_reg_sync, bsign0_reg_async, bsign0_reg_sync, absign_reg_async, absign_reg_sync, dsign_reg_async, dsign_reg_sync, ind_reg_async, ind_reg_sync, acc_reg_async, acc_reg_sync, out0_async, out0_sync)
        begin
            if (MULT_RESET_MODE = "ASYNC") then
                ina0_reg <= ina0_reg_async;
                inb0_reg <= inb0_reg_async;
                inc_reg_0 <= inc_reg_async;
                asign0_reg <= asign0_reg_async;
                bsign0_reg <= bsign0_reg_async;
                absign_reg <= absign_reg_async;
                dsign_reg_0 <= dsign_reg_async;
                ind_reg_0 <= ind_reg_async;
                out0 <= out0_async;
                acc_reg <= acc_reg_async;
            elsif (MULT_RESET_MODE = "SYNC") then
                ina0_reg <= ina0_reg_sync;
                inb0_reg <= inb0_reg_sync;
                inc_reg_0 <= inc_reg_sync;
                asign0_reg <= asign0_reg_sync;
                bsign0_reg <= bsign0_reg_sync;
                absign_reg <= absign_reg_sync;
                dsign_reg_0 <= dsign_reg_sync;
                ind_reg_0 <= ind_reg_sync;
                out0 <= out0_sync;
                acc_reg <= acc_reg_sync;
            end if;
        end process;

        -- input reg
        process(CLK, RESET, grstn)
		begin
			if (grstn = '0') then
				ina0_reg_async <= (others=>'0');
			elsif RESET = '1' then
				ina0_reg_async <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
                if CE = '1' then
					ina0_reg_async <= A;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if (grstn = '0') then
				ina0_reg_sync <= (others=>'0');
			elsif (CLK'event and CLK = '1') then
			    if (RESET = '1') then
				    ina0_reg_sync <= (others=>'0');
                elsif (CE = '1') then
					ina0_reg_sync <= A;
				end if;
			end if;
		end process;

        process(CLK, RESET, grstn)
		begin
			if grstn = '0' then
				inb0_reg_async <= (others=>'0');
			elsif RESET = '1' then
				inb0_reg_async <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
                if (CE = '1') then
					inb0_reg_async <= B;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if grstn = '0' then
				inb0_reg_sync <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
				if RESET = '1' then
				    inb0_reg_sync <= (others=>'0');
                elsif CE = '1' then
					inb0_reg_sync <= B;
				end if;
			end if;
		end process;

        process(CLK, RESET, grstn)
		begin
			if grstn = '0' then
				inc_reg_async <= (others=>'0');
			elsif RESET = '1' then
				inc_reg_async <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
                if (CE = '1') then
					inc_reg_async <= C;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if grstn = '0' then
				inc_reg_sync <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
				if RESET = '1' then
				    inc_reg_sync <= (others=>'0');
                elsif CE = '1' then
					inc_reg_sync <= C;
				end if;
			end if;
		end process;

        process (ina0_reg, A)
		begin
			if AREG = '0' then
				ina1 <= A;
			else
				ina1 <= ina0_reg;
			end if;
		end process;

        process (inb0_reg, B)
		begin
			if BREG = '0' then
				inb1 <= B;
			else
				inb1 <= inb0_reg;
			end if;
		end process;

        process (inc_reg_0, C)
		begin
			if CREG = '0' then
				inc <= C;
			else
				inc <= inc_reg_0;
			end if;
		end process;

        process(CLK, RESET, grstn)
		begin
			if grstn = '0' then
				ind_reg_async <= (others=>'0');
			elsif RESET = '1' then
				ind_reg_async <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
                if (CE = '1') then
					ind_reg_async <= D;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if grstn = '0' then
				ind_reg_sync <= (others=>'0');
            elsif (CLK'event and CLK = '1') then
				if RESET = '1' then
				    ind_reg_sync <= (others=>'0');
                elsif CE = '1' then
					ind_reg_sync <= D;
				end if;
			end if;
		end process;

        process (ind_reg_0, D)
		begin
			if DREG = '0' then
				ind_0 <= D;
			else
				ind_0 <= ind_reg_0;
			end if;
		end process;

        --sign_reg
        process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				asign0_reg_async <= '0';
			elsif RESET = '1' then
				asign0_reg_async <= '0';
			elsif (CLK'event and CLK = '1') then
				if CE = '1' then
					asign0_reg_async <= ASIGN;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if grstn = '0' then
				asign0_reg_sync <= '0';
			elsif (CLK'event and CLK = '1') then
				if RESET = '1' then
				    asign0_reg_sync <= '0';
			    elsif CE = '1' then
					asign0_reg_sync <= ASIGN;
				end if;
			end if;
		end process;

		process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				bsign0_reg_async <= '0';
			elsif RESET = '1' then
				bsign0_reg_async <= '0';
			elsif (CLK'event and CLK = '1') then
				if CE = '1' then
					bsign0_reg_async <= BSIGN;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if grstn = '0' then
				bsign0_reg_sync <= '0';
			elsif (CLK'event and CLK = '1') then
				if RESET = '1' then
					bsign0_reg_sync <= '0';
			    elsif CE = '1' then
					bsign0_reg_sync <= BSIGN;
				end if;
			end if;
		end process;

        process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				dsign_reg_async <= '0';
			elsif RESET = '1' then
				dsign_reg_async <= '0';
			elsif (CLK'event and CLK = '1') then
				if CE = '1' then
					dsign_reg_async <= DSIGN;
				end if;
			end if;
		end process;

		process (CLK, grstn)
		begin
			if grstn = '0' then
				dsign_reg_sync <= '0';
			elsif (CLK'event and CLK = '1') then
				if RESET = '1' then
					dsign_reg_sync <= '0';
			    elsif CE = '1' then
					dsign_reg_sync <= DSIGN;
				end if;
			end if;
		end process;

		process(ASIGN, asign0_reg)
		begin
			if ASIGN_REG = '0' then
				asign_0 <= ASIGN;
			else
				asign_0 <= asign0_reg;
			end if;
		end process;
		
		process(BSIGN, bsign0_reg)
		begin
			if BSIGN_REG = '0' then
				bsign_0 <= BSIGN;
			else
				bsign_0 <= bsign0_reg;
			end if;
		end process;

		absign_0 <= asign_0 or bsign_0;

        process(DSIGN, dsign_reg_0)
		begin
			if DSIGN_REG = '0' then
				dsign_0 <= DSIGN;
			else
				dsign_0 <= dsign_reg_0;
			end if;
		end process;

        process (CLK, grstn)
		begin
			if grstn = '0' then
				alu_sel0_reg <= '0';
			elsif (CLK'event and CLK = '1') then
                if CE = '1' then
					alu_sel0_reg <= alu_sel;
				end if;
			end if;
		end process;

        process (CLK, grstn)
		begin
			if grstn = '0' then
				alu_sel1_reg <= '0';
			elsif (CLK'event and CLK = '1') then
                if CE = '1' then
					alu_sel1_reg <= alu_sel0;
				end if;
			end if;
		end process;

        process (CLK, grstn)
		begin
			if grstn = '0' then
				accload0_reg <= '0';
			elsif (CLK'event and CLK = '1') then
                if CE = '1' then
					accload0_reg <= ACCLOAD;
				end if;
			end if;
		end process;

        process (ACCLOAD, accload0_reg, alu_sel, alu_sel0_reg)
        begin
            if (ACCLOAD_REG0 = '0') then
                accload_0 <= ACCLOAD;
                alu_sel0 <= alu_sel;
            else
                accload_0 <= accload0_reg;
                alu_sel0 <= alu_sel0_reg;
            end if;
        end process;

		process (CLK, grstn)
		begin
			if grstn = '0' then
				accload1_reg <= '0';
			elsif (CLK'event and CLK = '1') then
                if CE = '1' then
					accload1_reg <= accload_0;
				end if;
			end if;
		end process;

        process (accload_0, accload1_reg, alu_sel0, alu_sel1_reg)
        begin
            if (ACCLOAD_REG1 = '0') then
                accload_1 <= accload_0;
                alu_sel1 <= alu_sel0;
            else
                accload_1 <= accload1_reg;
                alu_sel1 <= alu_sel1_reg;
            end if;
        end process;

        process (ina1, asign_0)
		begin
			if (asign_0 = '1') then
				ina(17 downto 0) <= ina1(17 downto 0);
				ina(35 downto 18) <= (others=>ina1(17));
			else
				ina(17 downto 0) <= ina1(17 downto 0);
				ina(35 downto 18) <= (others=>'0');
			end if;
		end process;

		process (inb1, bsign_0)
		begin
			if (bsign_0 = '1') then
				inb(17 downto 0) <= inb1(17 downto 0);
				inb(35 downto 18) <= (others=>inb1(17));
			else
				inb(17 downto 0) <= inb1(17 downto 0);
				inb(35 downto 18) <= (others=>'0');
			end if;
		end process;

        mult_out_tmp <= ina * inb;
        mult_out <= mult_out_tmp(35 downto 0);

        --pipe_reg
		process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				out0_async <= (others=>'0');
				absign_reg_async <= '0';
			elsif RESET = '1' then
				out0_async <= (others=>'0');
				absign_reg_async <= '0';
            elsif (CLK'event and CLK = '1') then
			    if CE = '1' then
				    out0_async <= mult_out;
				    absign_reg_async <= absign_0;
			    end if;
			end if;
		end process;

		process(CLK, grstn)
		begin
			if grstn = '0' then
				out0_sync <= (others=>'0');
				absign_reg_sync <= '0';
			elsif (CLK'event and CLK = '1') then
                if RESET = '1' then
				    out0_sync <= (others=>'0');
				    absign_reg_sync <= '0';
				elsif CE = '1' then
					out0_sync <= mult_out;
				    absign_reg_sync <= absign_0;
				end if;
			end if;
		end process;

		process(mult_out, out0, absign_0, absign_reg)
		begin
			if PIPE_REG = '0' then
				out1 <= mult_out;
                absign <= absign_0;
			else
				out1 <= out0;
                absign <= absign_reg;
			end if;
		end process; 

        process(out1, absign, alu_sel1)
        begin
            if(alu_sel1 = '1') then
                if (absign = '1') then            
                    ppout1_ext(35 downto 0) <= out1(35 downto 0);
                    ppout1_ext(54 downto 36) <= (others=>out1(35));
                else
                    ppout1_ext(35 downto 0) <= out1(35 downto 0);
                    ppout1_ext(54 downto 36) <= (others=>'0');
                end if;
            else 
                ppout1_ext(54 downto 0) <= (others=>'0');
            end if;    
        end process;

        acc_load <= dout_sig when (accload_1 = '1') else (others=>'0');

        process (inc, alu_sel1)
        begin 
            if(alu_sel1 = '1') then
                inc_ext(53 downto 0) <= inc(53 downto 0);
                inc_ext(54) <= '0';
            else
                inc_ext(54 downto 0) <= (others=>'0');
            end if;
        end process;

        process(dsign_0, ind_0, alu_sel1)
        begin
            if(alu_sel1 = '1') then
                if(dsign_0 = '1') then
                    ind_ext(53 downto 0) <= ind_0(53 downto 0);
                    ind_ext(54) <= ind_0(53);
                else 
                    ind_ext(53 downto 0) <= ind_0(53 downto 0);
                    ind_ext(54) <= '0';
                end if;
            else 
                ind_ext(54 downto 0) <= (others=>'0');
            end if;    
        end process;

        process(acc_load,CASI,ppout1_ext,ind_ext,inc_ext)
        begin
            if(MULTALU18X18_MODE = 0) then        --ACC/0 +/- 18x18 +/- C
                if(B_ADD_SUB = '0' and C_ADD_SUB = '0') then
                    acc_out <= acc_load + ppout1_ext + inc_ext;
                elsif(B_ADD_SUB = '0' and C_ADD_SUB = '1') then
                    acc_out <= acc_load + ppout1_ext - inc_ext;
                elsif(B_ADD_SUB = '1' and C_ADD_SUB = '0') then
                    acc_out <= acc_load - ppout1_ext + inc_ext;
                else
                    acc_out <= acc_load - ppout1_ext - inc_ext;
                end if;
            elsif(MULTALU18X18_MODE = 1) then     --ACC/0 +/- 18x18 + CASI
                if(B_ADD_SUB = '0') then
                    acc_out <= acc_load + ppout1_ext + CASI;
                else
                    acc_out <= acc_load - ppout1_ext + CASI;                
                end if;     
            elsif(MULTALU18X18_MODE = 2) then     --18x18 +/- D + CASI
                if(B_ADD_SUB = '0') then
                    acc_out <= ppout1_ext + ind_ext + CASI;
                else
                    acc_out <= ppout1_ext - ind_ext + CASI;  
                end if;
            end if;
        end process;

        -- out_reg
		process (CLK, RESET, grstn)
		begin
			if grstn = '0' then
				acc_reg_async <= (others=>'0');
			elsif RESET = '1' then
				acc_reg_async <= (others=>'0');
		    elsif (CLK'event and CLK = '1') then	
                if CE = '1' then
					acc_reg_async <= acc_out;
				end if;
			end if;
		end process;

		process (grstn, CLK)
		begin
			if grstn = '0' then
				acc_reg_sync <= (others=>'0');
		    elsif (CLK'event and CLK = '1') then	
                if RESET = '1' then
					acc_reg_sync <= (others=>'0');
				elsif CE = '1' then
					acc_reg_sync <= acc_out;
				end if;
			end if;
		end process; 

		process (acc_out, acc_reg)
		begin
			if OUT_REG = '0' then
				dout_sig <= acc_out;
			else
				dout_sig <= acc_reg;
			end if;
		end process;

		DOUT <= dout_sig(53 downto 0);
		CASO <= (dout_sig(53) and absign) & dout_sig(53 downto 0);

end Behavioral;	

------------------------------ALU54D---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity ALU54D is
    generic(
	    AREG : bit := '0'; --'0': bypass mode; '1': registered mode
        BREG : bit := '0';
	    ASIGN_REG : bit := '0';
	    BSIGN_REG : bit := '0';
	    ACCLOAD_REG : bit := '0';
	    OUT_REG : bit := '0';
	    B_ADD_SUB : bit := '0';--'0':add; '1':sub
	    C_ADD_SUB : bit := '0';
        ALUD_MODE : integer := 0;--0:ACC/0 +/- B +/- A; 1:ACC/0 +/- B + CASI; 2:A +/- B + CASI;
		ALU_RESET_MODE : string := "SYNC" --SYNC, ASYNC
);
    port (
	    A : in std_logic_vector (53 downto 0);
	    B : in std_logic_vector (53 downto 0);
	    CE : in std_logic;
	    CLK : in std_logic;
	    RESET : in std_logic;
	    ASIGN,BSIGN : in std_logic;
	    ACCLOAD : in std_logic;
	    CASI : in std_logic_vector (54 downto 0);
	    DOUT : out std_logic_vector (53 downto 0);
	    CASO : out std_logic_vector (54 downto 0)
    );
end ALU54D;

architecture Behavioral of ALU54D is	

signal ina0_reg_async, ina0_reg_sync, ina0_reg_0, inb0_reg_0,ina0_sig,inb0_sig, inb0_reg_async, inb0_reg_sync : std_logic_vector (53 downto 0);
signal asign_reg0_async,asign_reg0_sync,bsign_reg0_async,bsign_reg0_sync,asign_0,bsign_0,asign_reg0, bsign_reg0 : std_logic;
signal accload0_reg_async, accload0_reg_sync, accload_0, accload0_reg : std_logic;
signal alu_sel : std_logic := '1';
signal alu_sel0_reg : std_logic := '0';
signal alu_sel0 : std_logic;
    
signal ina0_ext,inb0_ext,dout_reg_async, dout_reg_sync, dout_reg : std_logic_vector (54 downto 0);
signal acc_load,m_out,d_out : std_logic_vector (54 downto 0);
signal grstn : std_logic;

begin

	grstn <= GSRO;
	
    process (ina0_reg_sync, ina0_reg_async, inb0_reg_sync, inb0_reg_async, asign_reg0_async, asign_reg0_sync, bsign_reg0_async, bsign_reg0_sync, dout_reg_async, dout_reg_sync)  
	begin
		if (ALU_RESET_MODE = "ASYNC") then
		    ina0_reg_0 <= ina0_reg_async;
            inb0_reg_0 <= inb0_reg_async;
            asign_reg0 <= asign_reg0_async;
            bsign_reg0 <= bsign_reg0_async;
            dout_reg <= dout_reg_async;
		elsif (ALU_RESET_MODE = "SYNC") then
            ina0_reg_0 <= ina0_reg_sync;
            inb0_reg_0 <= inb0_reg_sync;
            asign_reg0 <= asign_reg0_sync;
            bsign_reg0 <= bsign_reg0_sync;
            dout_reg <= dout_reg_sync;			
        end if;
	end process;

    process(CLK, RESET, grstn)
    begin
		if grstn = '0' then
			ina0_reg_async <= (others=>'0');
		elsif RESET = '1' then
			ina0_reg_async <= (others=>'0');
        elsif (CLK'event and CLK = '1') then
            if (CE = '1') then
				ina0_reg_async <= A;
			end if;
		end if;
    end process;

	process (CLK, grstn)
	begin
		if grstn = '0' then
			ina0_reg_sync <= (others=>'0');
        elsif (CLK'event and CLK = '1') then
			if RESET = '1' then
			    ina0_reg_sync <= (others=>'0');
            elsif CE = '1' then
				ina0_reg_sync <= A;
			end if;
		end if;
	end process;

    process (ina0_reg_0, A)
    begin
        if AREG = '0' then
			ina0_sig <= A;
		else
			ina0_sig <= ina0_reg_0;
		end if;
    end process;

    process(CLK, RESET, grstn)
    begin
		if grstn = '0' then
			inb0_reg_async <= (others=>'0');
		elsif RESET = '1' then
			inb0_reg_async <= (others=>'0');
        elsif (CLK'event and CLK = '1') then
            if (CE = '1') then
				inb0_reg_async <= B;
			end if;
		end if;
    end process;

	process (CLK, grstn)
	begin
		if grstn = '0' then
			inb0_reg_sync <= (others=>'0');
        elsif (CLK'event and CLK = '1') then
			if RESET = '1' then
			    inb0_reg_sync <= (others=>'0');
            elsif CE = '1' then
				inb0_reg_sync <= B;
			end if;
		end if;
	end process;

    process (inb0_reg_0, B)
    begin
        if BREG = '0' then
			inb0_sig <= B;
		else
			inb0_sig <= inb0_reg_0;
		end if;
    end process;

    process (CLK, RESET, grstn)
	begin
		if grstn = '0' then
			asign_reg0_async <= '0';
		elsif RESET = '1' then
			asign_reg0_async <= '0';
		elsif (CLK'event and CLK = '1') then
			if CE = '1' then
				asign_reg0_async <= ASIGN;
			end if;
		end if;
	end process;

	process (CLK, grstn)
	begin
		if grstn = '0' then
			asign_reg0_sync <= '0';
		elsif (CLK'event and CLK = '1') then
			if RESET = '1' then
				asign_reg0_sync <= '0';
		    elsif CE = '1' then
				asign_reg0_sync <= ASIGN;
			end if;
		end if;
	end process;

    process (CLK, RESET, grstn)
	begin
		if grstn = '0' then
			bsign_reg0_async <= '0';
		elsif RESET = '1' then
			bsign_reg0_async <= '0';
		elsif (CLK'event and CLK = '1') then
			if CE = '1' then
				bsign_reg0_async <= BSIGN;
			end if;
		end if;
	end process;

	process (CLK, grstn)
	begin
		if grstn = '0' then
			bsign_reg0_sync <= '0';
		elsif (CLK'event and CLK = '1') then
			if RESET = '1' then
				bsign_reg0_sync <= '0';
		    elsif CE = '1' then
				bsign_reg0_sync <= BSIGN;
			end if;
		end if;
	end process;

    process(ASIGN, asign_reg0)
    begin
		if ASIGN_REG = '0' then
			asign_0 <= ASIGN;
		else
			asign_0 <= asign_reg0;
		end if;
	end process;

    process(BSIGN, bsign_reg0)
    begin
		if BSIGN_REG = '0' then
			bsign_0 <= BSIGN;
		else
			bsign_0 <= bsign_reg0;
		end if;
	end process;

    process (CLK, grstn)
	begin
		if grstn = '0' then
			accload0_reg <= '0';
		elsif (CLK'event and CLK = '1') then
            if CE = '1' then
				accload0_reg <= ACCLOAD;
			end if;
		end if;
	end process;

    process (CLK, grstn)
	begin
		if grstn = '0' then
			alu_sel0_reg <= '0';
		elsif (CLK'event and CLK = '1') then
            if CE = '1' then
				alu_sel0_reg <= alu_sel;
		    end if;
		end if;
	end process;

    process (ACCLOAD, accload0_reg, alu_sel, alu_sel0_reg)
    begin
        if (ACCLOAD_REG = '0') then
            accload_0 <= ACCLOAD;
            alu_sel0 <= alu_sel;
        else
            accload_0 <= accload0_reg;
            alu_sel0 <= alu_sel0_reg;
        end if;
    end process;

    process(asign_0, bsign_0, ina0_sig, inb0_sig, alu_sel0)
    begin
        if(alu_sel0 = '1') then
            if (asign_0 = '1') then
                ina0_ext(53 downto 0) <= ina0_sig(53 downto 0);
                ina0_ext(54) <= ina0_sig(53);
            else
                ina0_ext(53 downto 0) <= ina0_sig(53 downto 0);
                ina0_ext(54) <= '0';
            end if;

            if (bsign_0 = '1') then
                inb0_ext(53 downto 0) <= inb0_sig(53 downto 0);
                inb0_ext(54) <= inb0_sig(53);
            else
                inb0_ext(53 downto 0) <= inb0_sig(53 downto 0);
                inb0_ext(54) <= '0';
            end if;
        else 
            ina0_ext(54 downto 0) <= (others=>'0');
            inb0_ext(54 downto 0) <= (others=>'0');
        end if;
    end process;

    acc_load <= m_out when (accload_0 = '1') else (others=>'0');

    process(acc_load,CASI,ina0_ext,inb0_ext)
    begin
        if(ALUD_MODE = 0) then          --ACC/0 +/- B +/- A
            if(B_ADD_SUB = '0' and C_ADD_SUB = '0') then
                d_out <= acc_load + inb0_ext + ina0_ext;
            elsif(B_ADD_SUB = '0' and C_ADD_SUB = '1') then
                d_out <= acc_load + inb0_ext - ina0_ext;
            elsif(B_ADD_SUB = '1' and C_ADD_SUB = '0') then
                d_out <= acc_load - inb0_ext + ina0_ext;
            else
                d_out <= acc_load - inb0_ext - ina0_ext;
            end if;
        elsif(ALUD_MODE = 1) then       --ACC/0 +/- B + CASI
            if(B_ADD_SUB = '0') then
                d_out <= acc_load + inb0_ext + CASI;
            else
                d_out <= acc_load - inb0_ext + CASI;
            end if;       
        elsif(ALUD_MODE = 2) then       --A +/- B + CASI
            if(B_ADD_SUB = '0') then
                d_out <= ina0_ext + inb0_ext + CASI;
            else
                d_out <= ina0_ext - inb0_ext + CASI;
            end if;
        end if;
    end process;

    process (CLK, RESET, grstn)
	begin
		if grstn = '0' then
			dout_reg_async <= (others=>'0');
		elsif RESET = '1' then
			dout_reg_async <= (others=>'0');
	    elsif (CLK'event and CLK = '1') then	
            if CE = '1' then
				dout_reg_async <= d_out;
			end if;
		end if;
	end process;

	process (grstn, CLK)
	begin
		if grstn = '0' then
			dout_reg_sync <= (others=>'0');
	    elsif (CLK'event and CLK = '1') then	
            if RESET = '1' then
				dout_reg_sync <= (others=>'0');
			elsif CE = '1' then
				dout_reg_sync <= d_out;
			end if;
		end if;
	end process;

	process (d_out, dout_reg)
	begin
		if OUT_REG = '0' then
			m_out <= d_out;
		else
			m_out <= dout_reg;
		end if;
	end process;

    DOUT <= m_out(53 downto 0);
    CASO <= m_out;    

end Behavioral;	


------------------------------PLL---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity PLL is
    GENERIC(
             FCLKIN : STRING := "100.0"; --frequency of the clkin(M)
             DEVICE : STRING := "GW2A-18"; --"GW2A-18","GW2A-55","GW2AR-18","GW2A-55C","GW2A-18C","GW2AR-18C","GW2ANR-18C","GW2AN-55C"
             DYN_IDIV_SEL : STRING := "false";--true:IDSEL; false:IDIV_SEL
             IDIV_SEL : integer := 0;--Input divider IDIV, 0:1,1:2...63:64.  1~64
             DYN_FBDIV_SEL : STRING := "false";
             FBDIV_SEL : integer := 0;--Feedback divider FBDIV,  0:1,1:2...63:64. 1~64
             DYN_ODIV_SEL : STRING := "false";--true:ODSEL; false:ODIV_SEL
             ODIV_SEL : integer := 8;--2/4/8/16/32/48/64/80/96/112/128
             PSDA_SEL : STRING := "0000";--
             DYN_DA_EN : STRING := "false";--true:PSDA or DUTYDA or FDA; false: DA_SEL
             DUTYDA_SEL : STRING := "1000";--
             CLKOUT_FT_DIR : bit := '1'; -- CLKOUT fine tuning direction. '1' only
             CLKOUTP_FT_DIR : bit := '1'; -- '1' only
             CLKOUT_DLY_STEP : integer := 0; -- 0,1,2,4
             CLKOUTP_DLY_STEP : integer := 0; -- 0,1,2

             CLKOUTD3_SRC : STRING := "CLKOUT";--select div3 output, CLKOUTP or CLKOUT
             CLKFB_SEL : STRING := "internal"; --"internal", "external"
             CLKOUT_BYPASS : STRING := "false";
             CLKOUTP_BYPASS : STRING := "false";
             CLKOUTD_BYPASS : STRING := "false";
             CLKOUTD_SRC : STRING := "CLKOUT";--select div output,  CLKOUTP or CLKOUT
             DYN_SDIV_SEL : integer := 2 -- 2~128,only even num
	      );
    PORT(
             CLKIN : IN std_logic;
             CLKFB : IN std_logic:='0';
             IDSEL : In std_logic_vector(5 downto 0);
             FBDSEL : In std_logic_vector(5 downto 0);
             ODSEL : In std_logic_vector(5 downto 0);
             RESET : in std_logic:='0';
             RESET_P : in std_logic:='0';
             RESET_I :in std_logic:='0';
             RESET_S : in std_logic :='0';
             PSDA,FDLY : In std_logic_vector(3 downto 0);
             DUTYDA : In std_logic_vector(3 downto 0);
             LOCK : OUT std_logic;
             CLKOUT : OUT std_logic;
             CLKOUTD : out std_logic;
             CLKOUTP : out std_logic;
             CLKOUTD3 : out std_logic
        );
end PLL;

architecture Behavioral of PLL is
        
signal IDIV_SEL_reg,FBDIV_SEL_reg : integer;
signal IDIV_dyn,FBDIV_dyn,IDIV_SEL_reg1,FBDIV_SEL_reg1 : integer;
signal ODSEL_reg : std_logic_vector(5 downto 0);
signal div_dyn_change : std_logic;
signal IDIV_reg,FBDIV_reg : integer := 1;
type  clkin_arr  is array (4 downto 0) of time;
signal clkin_cycle : clkin_arr := (0.0 ns, 0.0 ns, 0.0 ns, 0.0 ns,0.0 ns);
signal clkin_period,clkin_period1 :  time := 2.000 ns;
signal clk_effect,oclk_effect,oclk_build : std_logic := '0';
signal clkout_period : time := 2.000 ns;
signal clkin_period_ref : real := 2.000;
signal tclkout_half,tclkout_half_new : time := 0.000 ns;
signal clkfb_curtime,clkin_curtime,FB_dly,FB_dly0 : time := 0.000 ns;

signal clk_div_src : std_logic;
signal clkfb_reg,clkfb_reg_0,clkfb_0 : std_logic := '0';
signal clkout_o,clk_out,clkoutp_o,clk_ps_reg,clk_ps_reg0 : std_logic := '0';
signal lock_reg : std_logic := '0';
signal clk_tlock_cur : time := 0.0 ns;
signal max_tlock : time := 50000 ns;
signal cnt_lock : integer := 0;

signal ps_dly,f_dly,clkout_duty, ps_value, duty_value,tclkp_duty : time := 0.000 ns;

signal cnt_div,cnt_div3 : integer := 0;
signal multi_clkin : integer;
signal clkout_div_reg,div3_in,div3_reg,pre_div3_in : std_logic := '0';
signal clkin_init,div3_init,clkfb_init,fb_clk_init : std_logic := '1';
signal inner_reset:std_logic:='0';
signal real_fbdiv,real_idiv : real := 1.0;

begin

    IDIV_dyn <= 64 - conv_integer(IDSEL);
    FBDIV_dyn <= 64 - conv_integer(FBDSEL);
    IDIV_SEL_reg <= 1 when (RESET_I = '1') else (IDIV_dyn) when (DYN_IDIV_SEL = "true") else (IDIV_SEL+1);
    FBDIV_SEL_reg <= FBDIV_dyn when DYN_FBDIV_SEL = "true" else (FBDIV_SEL+1);

    inner_reset <= RESET or RESET_P or RESET_I or RESET_S;

    process(CLKIN, inner_reset)
    variable clkin_edge_pre :time := 0 ns;
    variable clkin_edge_cur :time := 0 ns;

    begin
        real_fbdiv <= real(FBDIV_SEL_reg);
        real_idiv <= real(IDIV_SEL_reg);
        if(inner_reset = '1')then
            clk_effect <= '0';
            clkin_cycle(0) <= 0.0 ns;
        elsif(CLKIN'event and CLKIN = '1')then
            clkin_edge_cur := NOW;
            clkin_cycle(4) <= clkin_cycle(3);
	        clkin_cycle(3) <= clkin_cycle(2);
	        clkin_cycle(2) <= clkin_cycle(1);
            clkin_cycle(1) <= clkin_cycle(0);

            if(clkin_edge_pre /= 0 ns)then
                clkin_cycle(0) <= clkin_edge_cur - clkin_edge_pre;
            end if;

            clkin_edge_pre := clkin_edge_cur;

            if(clkin_edge_pre /= 0 ns) then
                if((clkin_cycle(0) = clkin_period) and (div_dyn_change = '0')) then
                    clk_effect <= '1';
                    clkout_period <= clkin_period* real_idiv/real_fbdiv;
                    tclkout_half <= clkout_period /2;

                else
                    clk_effect <= '0';
                end if;
            end if;
        end if;
    end process;

    process(clkin_cycle(0),clkin_cycle(1),clkin_cycle(2),clkin_cycle(3),clkin_cycle(4),clkin_period) 
    variable clkin_period_tmp : time := 0.0 ns;
    begin
        clkin_period_tmp := clkin_cycle(0);
        if(clkin_period_tmp /= clkin_period) then
		    clkin_period1 <= (clkin_cycle(0) + clkin_cycle(1) + clkin_cycle(2) + clkin_cycle(3) + clkin_cycle(4))/5.0;
            clkin_period <= clkin_period1;
        end if;
    end process;

    process(CLKIN) 
    begin
        if(rising_edge(CLKIN)) then
            IDIV_SEL_reg1 <= IDIV_SEL_reg;
            FBDIV_SEL_reg1 <= FBDIV_SEL_reg;
            ODSEL_reg <= ODSEL;
        end if;
    end process;

    process(IDIV_SEL_reg,FBDIV_SEL_reg,ODSEL,IDIV_SEL_reg1,FBDIV_SEL_reg1,ODSEL_reg)
    begin
        if((IDIV_SEL_reg1 /= IDIV_SEL_reg) or (FBDIV_SEL_reg1 /= FBDIV_SEL_reg) or (ODSEL_reg /= ODSEL)) then
            div_dyn_change <= '1';
        else
            div_dyn_change <= '0';
        end if;
    end process;

    -- lock time
    process(CLKIN, inner_reset) 
    begin
        if (inner_reset = '1') then
            max_tlock <= 0.0 us;
        elsif(rising_edge(CLKIN)) then
            if((clkin_cycle(0) >= 2 ns) and (clkin_cycle(0) <= 40 ns)) then
                max_tlock <= 50000 ns;
            elsif ((clkin_cycle(0) > 40 ns) and (clkin_cycle(0) <= 500 ns)) then
                max_tlock <= 200000 ns;              
            end if;
        end if;
    end process;

    process(CLKIN, inner_reset)    
    begin
        if (inner_reset = '1') then
            lock_reg <= '0';
            oclk_effect <= '0';
        elsif(rising_edge(CLKIN)) then
            if(clk_effect = '1') then
                cnt_lock <= cnt_lock + 1;

                if(cnt_lock > (max_tlock/clkin_period - 10)) then
                    oclk_effect <= '1';
                else
                    oclk_effect <= '0';
                end if;

                if(cnt_lock > (max_tlock/clkin_period)) then
                    lock_reg <= '1';
                else
                    lock_reg <= '0';
                end if;

            else
                oclk_effect <= '0';
                cnt_lock <= 0;
                lock_reg <= '0';           
            end if;
        end if;
    end process;

    process 
    variable clkfb_flag : std_logic := '1';
    begin
        if(oclk_effect = '0') then
            clkfb_reg <= '0';
        else
            if(clkfb_flag = '1') then
                clkfb_reg <= '1';
                clkfb_flag := '0';
            else
                wait for (tclkout_half); 
                clkfb_reg <= not clkfb_reg ;
            end if;
        end if;
        wait on oclk_effect,clkfb_reg;
    end process;


    -- calculate CLKFB feedback delay
    process(CLKIN) 
    begin
        if (rising_edge(CLKIN)) then
            if (clkin_init = '1') then
                clkin_curtime <= NOW;
                clkin_init <= '0';
            end if;
        end if;
    end process;

    process(CLKFB) 
    begin
        if (rising_edge(CLKFB)) then
            if (fb_clk_init = '1') then
                clkfb_curtime <= NOW;
                fb_clk_init <= '0';
            end if;
        end if;
    end process;

    process(CLKFB, CLKIN) 
    begin
        if ((clkfb_curtime > 0 ns) and (clkin_curtime > 0 ns)) then
            FB_dly0 <= clkfb_curtime - clkin_curtime;
        end if;

        if ((FB_dly0 >= 0 ns) and (clkin_cycle(0) > 0 ns)) then
            --multi_clkin <= FB_dly0 / (clkin_cycle(0));
            FB_dly <= clkin_cycle(0) - (FB_dly0 - (clkin_cycle(0)) * (FB_dly0 / (clkin_cycle(0))));
        end if;
    end process;

    process (clkfb_reg)
    begin
        if (CLKFB_SEL = "internal") then
            clkfb_0 <= clkfb_reg;
        else
            clkfb_0 <= transport clkfb_reg after (FB_dly);
        end if;
    end process;

    -- clkout
    process
    begin
        if (rising_edge(clkfb_0)) then
            clkout_o <= '1';
            wait for tclkout_half_new;
            clkout_o <= '0';
        end if;
        wait on clkfb_0;
    end process;

    process(CLKIN, oclk_effect, clkout_o, inner_reset) 
    begin
        if (inner_reset = '1') then
            clk_out <= '0';
        --elsif (oclk_effect = '1') then
        else 
            clk_out <= clkout_o;
        end if;
    end process;

    CLKOUT <= CLKIN when (CLKOUT_BYPASS = "true") else clk_out;
    LOCK <= lock_reg;  

    --clkout_p
    --DYN_DA_EN == "false".
    --phase_shift_value
    process (CLKIN,clkout_period)
    variable psda_sel_sig0 : string(1 to 4);
    begin
        psda_sel_sig0 := PSDA_SEL;
        case (psda_sel_sig0) is
	        when "0000" => ps_value <= (clkout_period *  0.0)/16.0;
	        when "0001" => ps_value <= (clkout_period *  1.0)/16.0;
	        when "0010" => ps_value <= (clkout_period *  2.0)/16.0;
	        when "0011" => ps_value <= (clkout_period *  3.0)/16.0;
	        when "0100" => ps_value <= (clkout_period *  4.0)/16.0;
	        when "0101" => ps_value <= (clkout_period *  5.0)/16.0;
	        when "0110" => ps_value <= (clkout_period *  6.0)/16.0;
	        when "0111" => ps_value <= (clkout_period *  7.0)/16.0;
	        when "1000" => ps_value <= (clkout_period *  8.0)/16.0;
	        when "1001" => ps_value <= (clkout_period *  9.0)/16.0;
	        when "1010" => ps_value <= (clkout_period * 10.0)/16.0;
	        when "1011" => ps_value <= (clkout_period * 11.0)/16.0;
	        when "1100" => ps_value <= (clkout_period * 12.0)/16.0;
	        when "1101" => ps_value <= (clkout_period * 13.0)/16.0;
	        when "1110" => ps_value <= (clkout_period * 14.0)/16.0;
	        when "1111" => ps_value <= (clkout_period * 15.0)/16.0;
            when others => ps_value <= (clkout_period *  0.0)/16.0;
	    end case;
    end process;

    process (CLKIN,clkout_period)
    variable dutyda_sel_sig0 : string(1 to 4);
    begin
        dutyda_sel_sig0 := DUTYDA_SEL;
        case (dutyda_sel_sig0) is
	        when "0000" => duty_value <= (clkout_period *  0.0)/16.0;
	        when "0001" => duty_value <= (clkout_period *  1.0)/16.0;
	        when "0010" => duty_value <= (clkout_period *  2.0)/16.0;
	        when "0011" => duty_value <= (clkout_period *  3.0)/16.0;
	        when "0100" => duty_value <= (clkout_period *  4.0)/16.0;
	        when "0101" => duty_value <= (clkout_period *  5.0)/16.0;
	        when "0110" => duty_value <= (clkout_period *  6.0)/16.0;
	        when "0111" => duty_value <= (clkout_period *  7.0)/16.0;
	        when "1000" => duty_value <= (clkout_period *  8.0)/16.0;
	        when "1001" => duty_value <= (clkout_period *  9.0)/16.0;
	        when "1010" => duty_value <= (clkout_period * 10.0)/16.0;
	        when "1011" => duty_value <= (clkout_period * 11.0)/16.0;
	        when "1100" => duty_value <= (clkout_period * 12.0)/16.0;
	        when "1101" => duty_value <= (clkout_period * 13.0)/16.0;
	        when "1110" => duty_value <= (clkout_period * 14.0)/16.0;
	        when "1111" => duty_value <= (clkout_period * 15.0)/16.0;
            when others => duty_value <= (clkout_period *  0.0)/16.0;
	    end case;
    end process;

    --DYN_DA_EN = "true"
    process (FDLY)
    begin
        if(DYN_DA_EN = "true") then
            if(FDLY = "1111") then
                f_dly <= 0.000 ns;
            elsif (FDLY = "1110") then
                f_dly <= 0.125 ns;
            elsif (FDLY = "1101") then
                f_dly <= 0.250 ns;
            elsif (FDLY = "1011") then
                f_dly <= 0.500 ns;
            elsif (FDLY = "0111") then
                f_dly <= 1.000 ns;
            end if;
        end if;
    end process;

    process (PSDA,DUTYDA,ps_value,duty_value)
    variable psda_sig,dutyda_sig : integer; 
    begin
        psda_sig := conv_integer(PSDA);
        dutyda_sig := conv_integer(DUTYDA);
        if (DYN_DA_EN = "true") then
            ps_dly <= (clkout_period * psda_sig)/16;
            if (dutyda_sig > psda_sig) then
                clkout_duty <= (clkout_period * (dutyda_sig - psda_sig))/16;
            elsif (dutyda_sig < psda_sig) then
                clkout_duty <= (clkout_period*(16 + dutyda_sig - psda_sig))/16;
            else 
                clkout_duty <= (clkout_period)/2;
            end if;
        else 
            ps_dly <= ps_value;
            clkout_duty <= duty_value;
        end if;
    end process;
                      
    process (tclkout_half, clkout_duty)
    begin
        if (DYN_DA_EN = "false") then
            tclkout_half_new <= tclkout_half;
            tclkp_duty <= clkout_duty;
        else 
            if (CLKOUT_FT_DIR = '1') then 
                tclkout_half_new <= tclkout_half - ((0.05 ns) * CLKOUT_DLY_STEP);
            else
                tclkout_half_new <=  tclkout_half + ((0.05 ns) * CLKOUT_DLY_STEP);
            end if;

            if (CLKOUTP_FT_DIR = '1') then
                tclkp_duty <= clkout_duty - ((0.05 ns) * CLKOUTP_DLY_STEP);
	        else
                tclkp_duty <=  clkout_duty + ((0.05 ns) * CLKOUTP_DLY_STEP);
            end if;
        end if;
    end process;

    process 
    begin
        if (rising_edge(clkfb_0)) then
            clkoutp_o <= '1';
            wait for tclkp_duty;
            clkoutp_o <= '0';
        end if;
        wait on clkfb_0;
    end process;

    process(clkoutp_o)
    begin
        clk_ps_reg0 <= transport clkoutp_o after (ps_dly+f_dly);    
    end process;
      
    process (CLKIN, oclk_effect, clk_ps_reg0, inner_reset) 
    begin
        if (inner_reset = '1') then
            clk_ps_reg <= '0';
        --elsif (oclk_effect = '1') then
        else 
            clk_ps_reg <= clk_ps_reg0;
        end if;
    end process;

    CLKOUTP <= CLKIN when (CLKOUTP_BYPASS = "true") else clk_ps_reg;

	--divide
    clk_div_src <= clkout_o when (CLKOUTD_SRC = "CLKOUT") else clk_ps_reg0;
    
    process(clk_div_src,RESET_S)
    begin
        if (RESET_S = '1') then
            cnt_div <= 0;
	        clkout_div_reg <= '0';
        elsif(rising_edge(clk_div_src)) then
            cnt_div <= cnt_div + 1;
            if (cnt_div = (DYN_SDIV_SEL/2 - 1)) then
	            clkout_div_reg <= not clkout_div_reg;
			    cnt_div <= 0;
            end if;
        end if;
    end process;
    
    CLKOUTD <= CLKIN when (CLKOUTD_BYPASS = "true") else clkout_div_reg;

    -- div3
    div3_in <= clk_ps_reg when (CLKOUTD3_SRC = "CLKOUTP") else clk_out; 

    process (div3_in) 
    begin
        pre_div3_in <= div3_in;
    end process;

    process (div3_in, RESET_S) 
    begin
        if(div3_init = '1') then
            if((pre_div3_in = '1') and (div3_in = '0')) then
	            div3_reg <= '1';
                div3_init <= '0';
                cnt_div3 <= 0;
            end if;
        elsif(RESET_S = '1') then
            div3_reg <= '0';
            cnt_div3 <= 0;
        elsif(rising_edge(div3_in) or falling_edge(div3_in)) then
            cnt_div3 <= cnt_div3+1;
            if(cnt_div3 = 2) then
                div3_reg <= not div3_reg;
                cnt_div3 <= 0;
            end if;
        end if;
    end process;

    CLKOUTD3 <= div3_reg;

end Behavioral;


------------------------------DLL---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.glb.GSRO;

entity DLL is
    GENERIC(
        DLL_FORCE : integer := 0;--1: force lock and code; 0: code/lock generated from DLL loop
        DIV_SEL : bit := '1';--0,normal lock mode; 1,fast lock mode
	    CODESCAL : STRING := "000";--001 010 011 100 101 110 111
        SCAL_EN : STRING := "true"--true,false
    );
    PORT(
        CLKIN:IN std_logic:='0';
        STOP: In std_logic:='0';
        RESET : In std_logic:='0';
        UPDNCNTL : In std_logic:='0';
        LOCK : OUT std_logic;
        STEP : OUT std_logic_vector(7 downto 0)
     );
end DLL;

architecture Behavioral of DLL is
signal clk_out :std_logic :='0';
signal clkin_edge_pre :time := 0 ns;
signal clkin_period :time := 2 ns;
signal delta : real := 0.025;
signal stop_0 : std_logic:= '0';
signal stop_1n : std_logic:= '1';
signal cnt : integer := 0;
signal clk_effect : std_logic := '0';
signal code_tmp : INTEGER := 0;
signal code_reg,code_reg_sig : std_logic_vector(7 downto 0) := "00000000";
signal clkin_period_pre : time := 0 ns;
signal lock_reg : std_logic := '0';
signal grstn : std_logic;
signal reset_sig: std_logic := '0';
begin
        
grstn<= GSRO;	
reset_sig <= RESET or (not grstn);


--determine clkin_period	 
process(CLKIN,reset_sig)
begin
    if(reset_sig = '1') then
        clk_effect <= '0';
        clkin_period <= 0 ns;
    elsif(CLKIN'event and CLKIN = '1') then
        clkin_period_pre <= clkin_period;
        clkin_period <= NOW - clkin_edge_pre;
		clkin_edge_pre <= NOW;

        if(clkin_period > 0 ns) then
            if(clkin_period = clkin_period_pre) then
		        clk_effect <= '1';
		    else
			    clk_effect <= '0';
		    end if;   
        end if;
    end if;
  
end process; 

process(CLKIN, reset_sig) 
begin
    if (reset_sig = '1') then
        stop_0 <= '0';
    elsif(CLKIN'event and CLKIN='0') then
        stop_0 <= STOP;
    end if;
end process;

process(CLKIN, reset_sig)
begin
    if (reset_sig = '1') then
        stop_1n <= '1';
    elsif(CLKIN'event and CLKIN='0') then
        stop_1n <= not stop_0;
    end if;
end process;

clk_out <= CLKIN and stop_1n;

process(clk_out, reset_sig)
begin
    if (reset_sig = '1') then
        cnt <= 0;
        lock_reg <= '0';
    elsif(clk_out'event and clk_out='1') then
        cnt <= cnt + 1;

        if(DIV_SEL = '0') then
            if(cnt >= 33600) then
                lock_reg <= '1';
            else
                lock_reg <= '0';
            end if;
        end if;

        if(DIV_SEL = '1') then
            if(cnt >= 2100) then
                lock_reg <= '1';
            else               
                lock_reg <= '0';
            end if;               
        end if;
    end if;

end process;

LOCK <= '1' when (DLL_FORCE = 1) else lock_reg;

--determine delay code
process(CLKIN,reset_sig,clk_effect,UPDNCNTL)
begin
    if(reset_sig ='1')then
        code_tmp <= 0;
    elsif(clk_effect = '1')then
        if(UPDNCNTL = '0')then
            if(SCAL_EN = "true")then
                if(CODESCAL="000")then
                    code_tmp <= INTEGER(clkin_period/(1 ns)*11.22222);
                elsif(CODESCAL = "001")then
                    code_tmp <= INTEGER(clkin_period/(1 ns)*12.44444);
                elsif(CODESCAL = "010")then
                    code_tmp <= INTEGER(clkin_period/(1 ns)*13.6667);
                elsif(CODESCAL = "011")then
                    code_tmp <= INTEGER(clkin_period/(1 ns)*15.0);
                elsif(CODESCAL = "100")then
                    code_tmp <= INTEGER(clkin_period/(1 ns)*8.7778);
                elsif(CODESCAL = "101")then
                    code_tmp <= INTEGER(clkin_period/(1 ns)*7.5556);
                elsif(CODESCAL = "110")then
                    code_tmp <= INTEGER(clkin_period/(1 ns)*6.3333);
                elsif(CODESCAL = "111")then
                    code_tmp <= INTEGER(clkin_period/(1 ns)*5.0);
                end if;
            else
                code_tmp <= INTEGER(clkin_period/(1 ns)*10.0);
            end if;
        end if;
    end if;

end process;

code_reg <= conv_std_logic_vector(code_tmp,8);
STEP <= code_reg when (DLL_FORCE = 0) else conv_std_logic_vector(255,8);

end Behavioral;


------------------------------CLKDIV---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.glb.GSRO;

entity CLKDIV is
    GENERIC(
	     DIV_MODE : STRING := "2"; -- "2", "3.5", "4", "5"
	     GSREN : STRING := "false" -- "false", "true"
	    );
    PORT(
         HCLKIN : IN std_logic;
	     RESETN : IN std_logic;
	     CALIB : In std_logic;
	     CLKOUT : OUT std_logic
        );
end CLKDIV;

architecture Behavioral of CLKDIV is
signal reset_0 : std_logic;
signal calib_0,calib_1,calib_2,calib_en,calib_resetn : std_logic;
signal calib_state : std_logic := '0';
signal dsel_en,clk_div_0,cnt_reset,clk_div,cnt_2,cnt_enable :std_logic;
signal select245 : std_logic := '1';
signal select3p5,select5 : std_logic := '0';
signal clk_div_1,clk_div2,d_sel,cnt_0,cnt_1 : std_logic := '0';
signal grstn :std_logic;

begin
    
    grstn <= GSRO when (GSREN = "true") else '1';

    select245 <= '0' when (DIV_MODE = "3.5") else '1';
    select3p5 <= '1' when (DIV_MODE = "3.5") else '0';
    select5 <= '1' when (DIV_MODE = "5") else '0';

    process(HCLKIN, grstn, RESETN)
    begin
        if (grstn = '0') then
            reset_0 <= '0';
        elsif (RESETN = '0') then
            reset_0 <= '0';
        elsif (HCLKIN'event and HCLKIN = '1') then
            reset_0 <= '1';
        end if;
    end process;
	
    process(HCLKIN, reset_0)
    begin
        if (reset_0 = '0') then
            calib_0 <= '0';
        elsif (HCLKIN'event and HCLKIN = '1') then
            calib_0 <= (not CALIB);
        end if;
    end process;

    process(HCLKIN, reset_0)
    begin
        if (reset_0 = '0') then
            calib_1 <= '0';
        elsif (HCLKIN'event and HCLKIN = '1') then
            calib_1 <= calib_0;
        end if;
    end process;

    process(HCLKIN, reset_0)
    begin
        if (reset_0 = '0') then
            calib_2 <= '0';
        elsif (HCLKIN'event and HCLKIN = '1') then
            calib_2 <= calib_1;
        end if;
    end process;

    calib_resetn <=  not (calib_1 and (not calib_2));
    calib_en <= not (calib_resetn or (not select245));

    process(HCLKIN, reset_0)
    begin
        if (reset_0 = '0') then
            calib_state <= '0';
        elsif (HCLKIN'event and HCLKIN = '1') then
            if (calib_en = '1') then
                calib_state <= not calib_state;
            else
                calib_state <= calib_state;
            end if;
        end if;
    end process;

    cnt_enable <= (not((not calib_resetn)and calib_state) and select245) or (calib_resetn and select3p5);

    dsel_en <= (d_sel and cnt_0 and cnt_1 and select3p5) or (calib_resetn and (not d_sel) and (not cnt_0) and cnt_1 and select3p5);

    process(HCLKIN, reset_0) 
    begin
        if (reset_0 = '0') then
            d_sel  <= '0';
        elsif (HCLKIN'event and HCLKIN = '1') then
            if(dsel_en = '1') then
                d_sel  <= not d_sel;
            elsif(dsel_en = '0') then
                d_sel <= d_sel;
            end if;
        end if;
    end process;

    cnt_reset <= (select5 and (not cnt_0) and (not cnt_1) and cnt_2 ) or (select3p5 and (not d_sel) and (not cnt_0) and cnt_1);

    process(HCLKIN, reset_0) 
    begin
        if (reset_0 = '0') then
            cnt_0  <= '1';
        elsif (HCLKIN'event and HCLKIN = '1') then
            if(cnt_enable = '1') then
                cnt_0  <= not(cnt_0 or cnt_reset);
            elsif(cnt_enable = '0') then
                cnt_0 <= cnt_0;
            end if;
        end if;
    end process;

    process(HCLKIN, reset_0) 
    begin
        if (reset_0 = '0') then
            cnt_1  <= '1';
        elsif (HCLKIN'event and HCLKIN = '1') then
            if(cnt_enable = '1') then
                cnt_1  <= not(cnt_reset or (cnt_0 xnor cnt_1));
            elsif(cnt_enable = '0') then
                cnt_1 <= cnt_1;
            end if;
        end if;
    end process;

    process(HCLKIN, reset_0) 
    begin
        if (reset_0 = '0') then
            cnt_2  <= '0';
        elsif (HCLKIN'event and HCLKIN = '1') then
            if(cnt_enable = '1') then
                cnt_2  <= not(cnt_reset or (cnt_2 xnor (cnt_0 and cnt_1)));
            elsif(cnt_enable = '0') then
                cnt_2 <= cnt_2;
            end if;
        end if;
    end process;

    clk_div_0 <= not cnt_1;
    process(HCLKIN, reset_0) 
    begin
        if(reset_0 = '0') then
            clk_div_1 <= '0';
        elsif (HCLKIN'event and HCLKIN = '0') then
            clk_div_1 <= clk_div_0;
        end if;
    end process;

    clk_div <= clk_div_1 when (d_sel = '1') else clk_div_0;
    clk_div2 <= not cnt_0;

    CLKOUT <= clk_div2 when (DIV_MODE = "2") else clk_div;

end Behavioral;

----------------------------DHCEN ------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DHCEN is
    PORT (
	 CLKOUT : OUT std_logic;	
	 CE : IN std_logic;	
	 CLKIN : IN std_logic
    );
end DHCEN;

ARCHITECTURE Behavioral OF DHCEN IS
    SIGNAL ce_reg0,ce_reg1,ce_reg2,ce_reg3 : std_logic;		
begin
	
    process (CLKIN)
    begin
	    if (CLKIN'event and CLKIN='0') then
            ce_reg0 <= (not CE);
            ce_reg1 <= ce_reg0;
            ce_reg2 <= ce_reg1;
            ce_reg3 <= ce_reg2;
	    end if;
    end process;

    CLKOUT <= CLKIN and ce_reg3;

end Behavioral;


-----------------DQS---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity DQS is
	generic(
		FIFO_MODE_SEL : bit := '0';-- FIFO mode select: '0',DDR memory mode;'1': GDDR mode
		RD_PNTR : bit_vector := "000";--FIFO read pointer setting
		DQS_MODE : string := "X1"; -- "X1","X2_DDR2","X2_DDR3","X4","X2_DDR3_EXT"
        HWL : string := "false";--"true"; "false"
		GSREN : string := "false" --false, true
	);

	port (
		DQSIN,PCLK,FCLK,RESET : in std_logic;
		READ : in std_logic_vector(3 downto 0);
		RCLKSEL : in std_logic_vector(2 downto 0);
		DLLSTEP,WSTEP : in std_logic_vector(7 downto 0);
		RLOADN, RMOVE, RDIR, HOLD : in std_logic;
        WLOADN, WMOVE, WDIR : in std_logic;
        DQSR90, DQSW0, DQSW270 : out std_logic;
		RPOINT, WPOINT : out std_logic_vector(2 downto 0);
		RVALID,RBURST, RFLAG, WFLAG : out std_logic
	);
end DQS;

architecture Behavioral of DQS is

	signal hold_0,hold_1,hold_2,hold_cnt0,hold_cnt1 : std_logic; 
	signal hold_en,fclk_hold,fclk_in : std_logic; 
    signal dly_time,wstep_dly,rstep_dly : time := 0.000 ns;
    signal del : time := 0.025 ns;
    signal dqsw270_dly_in,dqsr90_dly_in,dqsw0_dly_in : std_logic_vector(255 downto 0);
	signal pre_wmove : std_logic;
	signal wstep_reg,rstep_reg,wstep_init : integer := 0;
	signal clk_rd,clk_rd_sft,rstn_0,d_cnt0_0,d_cnt0_1,update0,d_cnt1_0,d_cnt1_1,rstn_1,update1 : std_logic;
	signal update0_set,update1_set,rd_up : std_logic;
	signal rd_q3,rd_d23,rd_d123,rd_dq,rd_dqq,rd_reg,rd_post,rd_pre,dqs_en,rd_q1,rd_dq_x1,rd_dq_x2,rd_dq_x4,rd_q1_ext,rd_dq_x2_ext : std_logic;
	signal rd_d0,rd_d1,rd_d_ext,rd_d1_ext : std_logic_vector(3 downto 0);
	signal rd_reg_dly,rd_en,dqs_set,dqs_r_clean,rd_dq_del : std_logic;
	signal dqs_en_dly,rstn_det,cnt_det1,cnt_det0_0,cnt_det0_1,cnt_det0 : std_logic;
	signal cnt0_det1,cnt0_det1_reg,cnt0_det0,cnt0_det0_reg,cnt1_det0,cnt1_det0_reg : std_logic;
	signal pre_rmove : std_logic;
	signal reset_f,reset_wpt,wpt_d_0,wpt_d_1,wpt_d_2 : std_logic;
	signal reset_wfq,wpt_q_0,wpt_q_1,wpt_q_2 : std_logic;
	signal rpointer,wpt_q : std_logic_vector(2 downto 0);
	signal resetn_rfq,rpt_q_0,rpt_q_1,rpt_q_2 : std_logic;
	signal resetn_rpt_0,resetn_rpt_1,resetn_rpt_2,set_rpt_0,set_rpt_1,set_rpt_2,rpt_d_0,rpt_d_1,rpt_d_2 : std_logic;
	signal resetn_up,cnt0_up,cnt1_up,update_rd : std_logic;
	signal update_a,update_rp,shift_0,shift_1,shift_q,sign_q,rd_q,rd_q_1,rvalid_reg : std_logic;
	signal wr_dqcomp,wr_qqcomp,shift,ren,rqen,rpt_en,r_valid : std_logic;
	signal dqsw0_out,dqsw270_out,dqsr90_out,fclk_fifo,dqsw90 : std_logic;    
    signal w_flag,r_flag : std_logic := '0';
	signal grstn,reset_l,ff_mode_sel,x1_mode_sel : std_logic;
    signal i : integer;

	begin
        grstn <= GSRO when (GSREN = "true") else '1';
        reset_l <= RESET or (not grstn);
        rpointer <= TO_STDLOGICVECTOR(RD_PNTR);
        ff_mode_sel <= '0' when (FIFO_MODE_SEL = '0') else '1';
       
        dqsw0_dly_in(0) <=  fclk_in;
        dqsw270_dly_in(0) <=  fclk_in;
        dqsr90_dly_in(0) <= dqs_r_clean;
        gen_delay : for i in 1 to 255 generate
        dqsw0_dly_in(i) <= dqsw0_dly_in(i-1) after 0.025 ns;
        dqsw270_dly_in(i) <= dqsw270_dly_in(i-1) after 0.025 ns;
        dqsr90_dly_in(i) <= dqsr90_dly_in(i-1) after 0.025 ns;
        end generate gen_delay; 

        dqsw0_out <= fclk_in when (DQS_MODE = "X1") else dqsw0_dly_in(conv_integer(WSTEP));
        DQSW0 <= dqsw0_out;
        DQSW90 <= fclk_in when (wstep_reg = 0 or wstep_reg = 256) else dqsw270_dly_in(wstep_reg);
        DQSW270 <= (not dqsw90);
        DQSR90 <= dqs_r_clean when (rstep_reg = 0 or rstep_reg = 256) else dqsr90_dly_in(rstep_reg);

        -- dqs write
        process(FCLK,reset_l)  
        begin
            if (reset_l = '1') then
                hold_0 <= '0';
                hold_1 <= '0';
                hold_2 <= '0';
	        elsif (FCLK'event and FCLK='0') then
                hold_0 <= HOLD;
                hold_1 <= hold_0;
                hold_2 <= hold_1;
            end if;
        end process;

        process (FCLK,reset_l)
        begin
            if (reset_l = '1') then
                hold_cnt0 <= '0';
                hold_cnt1 <= '0';
	        elsif (FCLK'event and FCLK='0') then
                if (hold_en = '1')  then
                    hold_cnt0 <= not hold_cnt0;
                    hold_cnt1 <= (hold_cnt0 xor hold_cnt1);
                end if;
            end if;
        end process;

        hold_en <= hold_2 or hold_cnt1 or hold_cnt0;
        fclk_hold <= (not hold_en) and FCLK;

        process (PCLK,fclk_hold)
        begin
            if(DQS_MODE = "X1") then
                fclk_in <= PCLK;
            else 
                fclk_in <= fclk_hold;
            end if;
        end process;
        
        process (wstep_reg) 
        begin
            if ((wstep_reg = 256 and WDIR = '0') or (wstep_reg = 0 and WDIR = '1')) then
                w_flag <= '1';
            else 
                w_flag <= '0';
            end if;
        end process;
        WFLAG <= w_flag;

        process (WMOVE)
        begin
            pre_wmove <= WMOVE;
        end process;

        process (DLLSTEP,WSTEP)
        begin
            if(DQS_MODE = "X2_DDR2" or DQS_MODE = "X1") then
	 	        wstep_init <= conv_integer(DLLSTEP);              
            elsif(DQS_MODE = "X2_DDR3" or  DQS_MODE = "X4" or DQS_MODE = "X2_DDR3_EXT") then
                if((conv_integer(DLLSTEP) + conv_integer(WSTEP)) >= 255) then
		            wstep_init <= 255;
	            else
	 	            wstep_init <= conv_integer(DLLSTEP+WSTEP);
                end if;
            end if;
        end process;

        process(DLLSTEP, WLOADN, WMOVE) 
        begin
            if (WLOADN = '0') then
                wstep_reg <= wstep_init;
            elsif (WMOVE = '0' and pre_wmove = '1') then
                if (WLOADN = '1') then
                    if (WDIR = '0') then  -- plus(+)
                        if (w_flag = '0' or (wstep_reg <= 0)) then
                            wstep_reg <= wstep_reg + 1;
                        end if;
                    elsif (WDIR = '1') then  -- minus (-)
                        if (w_flag = '0' or (wstep_reg = 256)) then
                            wstep_reg <= wstep_reg - 1;
                        end if;
                    end if;
                end if;
            end if;
        end process;
        
        -- clkmux    
        process(dqsw270_out, RCLKSEL(0), dqsw0_out)
        begin
            if(RCLKSEL(0) = '0') then
                clk_rd <= dqsw0_out;
            elsif(RCLKSEL(0) = '1') then
                clk_rd <= not dqsw270_out;
            end if;
        end process;

        process(clk_rd, RCLKSEL(1))
        begin
            if(RCLKSEL(1) = '0') then
                clk_rd_sft <= not clk_rd;
            elsif(RCLKSEL(1) = '1') then
                clk_rd_sft <= clk_rd;
            end if;
        end process;

        -- dqs read

        process (FCLK, reset_l) 
        begin
            if (reset_l = '1') then
                rstn_0 <= '0';
		    elsif(FCLK'event and FCLK='1')then 
                rstn_0 <= '1';
            end if;
        end process;                                                                                      
        process (FCLK, rstn_0)
        begin
            if (rstn_0 = '0') then
                d_cnt0_0 <= '0';
                d_cnt0_1 <= '0';                
		    elsif(FCLK'event and FCLK='1')then 
                d_cnt0_0 <= not d_cnt0_0;
                d_cnt0_1 <= (d_cnt0_0 xor d_cnt0_1);
            end if;
        end process;

        process (d_cnt0_0,d_cnt0_1)
        begin
            if(DQS_MODE = "X2_DDR2" or DQS_MODE = "X2_DDR3" or DQS_MODE = "X2_DDR3_EXT") then
                update0_set <= not d_cnt0_0;
            elsif(DQS_MODE = "X4") then
                update0_set <= (not d_cnt0_1) and d_cnt0_0; 
            end if;
        end process;
        
        process (FCLK, rstn_0)
        begin
            if (rstn_0 = '0') then
                update0 <= '0';
		    elsif(FCLK'event and FCLK='1')then 
                if (update0_set = '1') then
                    update0 <= '1';
                else
                    update0 <= '0';
                end if;
            end if;
        end process;

        process (clk_rd, reset_l)
        begin
            if (reset_l = '1') then
                rstn_1 <= '0';
		    elsif(clk_rd'event and clk_rd='1')then 
                rstn_1 <= '1';
            end if;
        end process;                                                                                      
        process (clk_rd, rstn_1)
        begin
            if (rstn_1 = '0') then
                d_cnt1_0 <= '0';
                d_cnt1_1 <= '0';                
		    elsif(clk_rd'event and clk_rd='1')then 
                d_cnt1_0 <= not d_cnt1_0;
                d_cnt1_1 <= (d_cnt1_1 xor d_cnt1_0);
            end if;
        end process;

        process (d_cnt1_0,d_cnt1_1)
        begin
            if(DQS_MODE = "X2_DDR2" or DQS_MODE = "X2_DDR3" or DQS_MODE = "X2_DDR3_EXT") then
                if(HWL = "false") then
                    update1_set <= d_cnt1_0;
                else 
                    update1_set <= not d_cnt1_0;
                end if;
            elsif(DQS_MODE = "X4") then
                if(HWL = "false") then
                    update1_set <= (not d_cnt1_1) and (not d_cnt1_0);
                else
                    update1_set <= (not d_cnt1_1) and d_cnt1_0;
                end if;
            end if;
        end process;

        process (clk_rd, rstn_1)
        begin
            if (rstn_1 = '0') then
                update1 <= '0';
		    elsif(clk_rd'event and clk_rd='1')then 
                if (update1_set = '1') then
                    update1 <= '1';
                else
                    update1 <= '0';
                end if;
            end if;
        end process;

        process (PCLK, reset_l)
        begin
            if (reset_l = '1') then
                rd_d0 <= (others=>'0');
                rd_d_ext <= (others=>'0');
		    elsif(PCLK'event and PCLK='1')then 
                rd_d0 <= READ;
                rd_d_ext <= rd_d0;
            end if;
        end process;

        process (clk_rd, reset_l)
        begin
            if (reset_l = '1') then
                rd_dq_x1 <= '0';
		    elsif(clk_rd'event and clk_rd='1')then 
                rd_dq_x1 <= rd_d0(0);
            end if;
        end process;

        process (FCLK, reset_l)
        begin
            if (reset_l = '1') then
                rd_d1 <= (others=>'0');
                rd_d1_ext <= (others=>'0');
		    elsif(FCLK'event and FCLK='1')then 
                if (update0 = '1') then
                    rd_d1 <= rd_d0;
                    rd_d1_ext <= rd_d_ext;         
                elsif (update0 = '0') then
                    rd_d1 <= rd_d1;
                    rd_d1_ext <= rd_d1_ext;
                end if;
            end if;
        end process;

        process (clk_rd, reset_l)
        begin
            if (reset_l = '1') then
                rd_q1 <= '0';
                rd_q1_ext <= '0';
                rd_q3 <= '0';
		    elsif(clk_rd'event and clk_rd='1')then 
                if (update1 = '1') then
                    rd_q1 <= rd_d1(1);
                    rd_q1_ext <= rd_d1_ext(1);
                    rd_q3 <= rd_d1(3);
                end if;
            end if;
        end process;
            
        process(clk_rd, reset_l)
        begin
            if (reset_l = '1') then
                rd_d23 <= '0';
                rd_d123 <= '0';
                rd_dq_x4 <= '0';
                rd_dq_x2 <= '0';
                rd_dq_x2_ext <= '0';
		    elsif(clk_rd'event and clk_rd='1')then 
                if (update1 = '1') then
                    rd_d23 <= rd_d1(2);
                    rd_d123 <= rd_d1(1);
                    rd_dq_x4 <= rd_d1(0);
                    rd_dq_x2 <= rd_d1(0);                                rd_dq_x2_ext <= rd_d1_ext(0);
                elsif (update1 = '0') then
                    rd_d23 <= rd_q3;
                    rd_d123 <= rd_d23; 
                    rd_dq_x4 <= rd_d123;
                    rd_dq_x2 <= rd_q1;            
                    rd_dq_x2_ext <= rd_q1_ext;
                end if;
            end if;
        end process;

        process(rd_dq_x1,rd_dq_x2,rd_dq_x4,rd_dq_x2_ext) 
        begin
            if(DQS_MODE = "X1") then
                rd_dq <= rd_dq_x1;
            elsif(DQS_MODE = "X2_DDR2" or DQS_MODE = "X2_DDR3") then
                rd_dq <= rd_dq_x2;
            elsif(DQS_MODE = "X2_DDR3_EXT") then
                rd_dq <= rd_dq_x2_ext;               
            elsif(DQS_MODE = "X4") then
                rd_dq <= rd_dq_x4;
            end if;
        end process;

        rd_dq_del <= rd_dq after 0.2 ns;

        process (clk_rd, reset_l)
        begin
            if (reset_l = '1') then
                rd_dqq <= '0';
		    elsif(clk_rd'event and clk_rd='1')then 
                rd_dqq <= rd_dq_del;
            end if;
        end process;

        process (rd_dq, rd_dqq, RCLKSEL(2))
        begin
            if(RCLKSEL(2) = '0') then
                rd_reg <= rd_dq;
            elsif(RCLKSEL(2) = '1') then
                rd_reg <= rd_dqq;
            end if;
        end process;

        rd_reg_dly <= rd_reg after 0.2 ns;

        process (clk_rd_sft, reset_l)
        begin
            if (reset_l = '1') then
                rd_post <= '0';
		    elsif(clk_rd_sft'event and clk_rd_sft='1')then 
                rd_post <= rd_reg_dly;
            end if;
        end process;

        process (clk_rd_sft, reset_l)
        begin
            if (reset_l = '1') then
                rd_pre <= '0';
		    elsif(clk_rd_sft'event and clk_rd_sft='0')then 
                rd_pre <= rd_post;
            end if;
        end process;

        rd_en <= rd_post and rd_pre;
        dqs_set <= rd_en and (not reset_l);

        process (dqs_r_clean, reset_l, dqs_set)
        begin
            if (reset_l = '1') then
                dqs_en <= '0';
            elsif (dqs_set = '1') then
                dqs_en <= '1';
		    elsif(dqs_r_clean'event and dqs_r_clean='0')then 
                dqs_en <= rd_en;
            end if;
        end process;

        dqs_r_clean <= DQSIN and dqs_en;

        ---- burst-det
        dqs_en_dly <= (not dqs_en) after 0.2 ns;
        rstn_det <= not(dqs_en and dqs_en_dly) and (not reset_l);

        process (dqs_r_clean, rstn_det)
        begin
            if (rstn_det = '0')  then
                cnt0_det1 <= '0';
                cnt0_det1_reg <= '0';
		    elsif(dqs_r_clean'event and dqs_r_clean='1')then 
                if (dqs_en = '1') then
                    cnt0_det1 <= not cnt0_det1;
                    cnt0_det1_reg <= cnt0_det1;
                end if;
            end if;
        end process;
        cnt_det1 <= ((not cnt0_det1) and cnt0_det1_reg) and (not dqs_en);

        process (dqs_r_clean,rstn_det) 
        begin
            if (rstn_det = '0') then
                cnt0_det0 <= '0';
                cnt0_det0_reg <= '0';
		    elsif(dqs_r_clean'event and dqs_r_clean='0')then 
                cnt0_det0 <= not cnt0_det0;
                cnt0_det0_reg <= cnt0_det0;
            end if;
        end process;
        cnt_det0_0 <= not ((not cnt0_det0) and cnt0_det0_reg);
                              
        process (dqsr90_out, rstn_det)
        begin
            if (rstn_det = '0') then
                cnt1_det0 <= '0';
                cnt1_det0_reg <= '0';
		    elsif(dqsr90_out'event and dqsr90_out='0')then 
                if (rd_en = '1') then
                    cnt1_det0 <= not cnt1_det0;
                    cnt1_det0_reg <= cnt1_det0;
                end if;
            end if;
        end process;
        cnt_det0_1 <=  not(cnt1_det0 and (not cnt1_det0_reg));     
        cnt_det0 <= not(cnt_det0_0 or cnt_det0_1);
        RBURST <= cnt_det0 and cnt_det1;

        process(rstep_reg) 
        begin
            if ((rstep_reg = 256 and RDIR = '0') or (rstep_reg = 0 and RDIR = '1')) then
                r_flag <= '1';
            else 
                r_flag <= '0';
            end if;
        end process;
        RFLAG <= r_flag;

        process (RMOVE)
        begin
            pre_rmove <= RMOVE;
        end process;

        process(DLLSTEP, RLOADN, RMOVE)
        begin
            if (RLOADN = '0') then
                rstep_reg <= conv_integer(DLLSTEP);
            elsif (RMOVE = '0' and pre_rmove = '1') then
                if (RLOADN = '1') then
                    if (RDIR = '0') then   -- plus(+)
                        if (r_flag = '0' or (rstep_reg <= 0)) then
                            rstep_reg <= rstep_reg + 1;
                        end if;
                    elsif (RDIR = '1') then   -- minus (-)
                        if (r_flag = '0' or (rstep_reg = 256)) then
                            rstep_reg <= rstep_reg - 1;
                        end if;
                    end if;
                end if;
            end if;
        end process;
        
        -- dqs fifo_ctrl
        fclk_fifo <= PCLK when (DQS_MODE = "X1") else FCLK;
        reset_f <= (reset_l or HOLD);
        process (dqsr90_out, reset_f)
        begin
            if (reset_f = '1') then
                reset_wfq <= '1';
		    elsif dqsr90_out'event and dqsr90_out='1' then
                reset_wfq <= reset_f;
            end if;
        end process;

        reset_wpt <= reset_f when(FIFO_MODE_SEL = '0') else reset_wfq;

        wpt_d_0 <= not(wpt_q_1 xor wpt_q_2);

        process (dqsr90_out, reset_wpt)
        begin
            if(reset_wpt = '1') then
                wpt_q_0 <= '0';
                wpt_q_1 <= '0';
                wpt_q_2 <= '0';
		    elsif dqsr90_out'event and dqsr90_out='1' then
                wpt_q_0 <= wpt_d_0;
                wpt_q_1 <= wpt_d_1;
                wpt_q_2 <= wpt_d_2;
            end if;
        end process;
        wpt_q <= (wpt_q_2 & wpt_q_1 & wpt_q_0);
        wpt_d_1 <= ((not wpt_q_2) and wpt_q_0) or (wpt_q_1 and (not wpt_q_0));
        wpt_d_2 <= (wpt_q_1 and (not wpt_q_0)) or (wpt_q_2 and wpt_q_0);

        process (dqsr90_out, reset_wpt)
        begin
            if(reset_wpt = '1') then
                WPOINT <= (others => '0');
		    elsif dqsr90_out'event and dqsr90_out='0' then
                WPOINT <= wpt_q;
            end if;
        end process;

        ----read pointer
        process (fclk_fifo, reset_f)
        begin
            if (reset_f = '1') then
                resetn_rfq <= '0';
		    elsif fclk_fifo'event and fclk_fifo='0' then
                resetn_rfq <= '1';
            end if;
        end process;
        resetn_rpt_0 <= resetn_rfq or rpointer(0);
        resetn_rpt_1 <= resetn_rfq or rpointer(1);
        resetn_rpt_2 <= resetn_rfq or rpointer(2);

        set_rpt_0 <= not(resetn_rfq or (not rpointer(0)));
        set_rpt_1 <= not(resetn_rfq or (not rpointer(1)));
        set_rpt_2 <= not(resetn_rfq or (not rpointer(2)));

        rpt_d_0 <= not (rpt_q_1 xor rpt_q_2);
        rpt_d_1 <= ((not rpt_q_2) and rpt_q_0) or (rpt_q_1 and (not rpt_q_0));
        rpt_d_2 <= (rpt_q_1 and (not rpt_q_0)) or (rpt_q_2 and rpt_q_0);

        rpt_en <= ren when(DQS_MODE = "X1") else rqen;

        process(fclk_fifo, resetn_rpt_0, set_rpt_0)
        begin
            if (resetn_rpt_0 = '0') then
                rpt_q_0 <= '0';
            elsif (set_rpt_0 = '1') then
                rpt_q_0 <= '1';
		    elsif fclk_fifo'event and fclk_fifo='1' then
                if (rpt_en = '1') then
                    rpt_q_0 <= rpt_d_0;
                end if;
            end if;
        end process;

        process(fclk_fifo, resetn_rpt_1, set_rpt_1)
        begin
            if (resetn_rpt_1 = '0') then
                rpt_q_1 <= '0';
            elsif (set_rpt_1 = '1') then
                rpt_q_1 <= '1';
		    elsif fclk_fifo'event and fclk_fifo='1' then
                if (rpt_en = '1') then
                    rpt_q_1 <= rpt_d_1;
                end if;
            end if;
        end process;

        process(fclk_fifo, resetn_rpt_2, set_rpt_2)
        begin
            if (resetn_rpt_2 = '0') then
                rpt_q_2 <= '0';
            elsif (set_rpt_2 = '1') then
                rpt_q_2 <= '1';
		    elsif fclk_fifo'event and fclk_fifo='1' then
                if (rpt_en = '1') then 
                    rpt_q_2 <= rpt_d_2;
                end if;
            end if;
        end process;

        RPOINT <= (rpt_q_2 & rpt_q_1 & rpt_q_0);

        process (fclk_fifo, reset_l)
        begin
            if (reset_l = '1') then
                resetn_up <= '0';
		    elsif fclk_fifo'event and fclk_fifo='1' then
                resetn_up <= '1';
            end if;
        end process;

        process (fclk_fifo, resetn_up)
        begin
            if (resetn_up = '0') then
                cnt0_up <= '0';
                cnt1_up <= '0';
		    elsif fclk_fifo'event and fclk_fifo='1' then
                cnt0_up <= not cnt0_up;
                cnt1_up <= (cnt0_up xor cnt1_up);
            end if;
        end process;
 
        update_rd <= (not cnt0_up) when (DQS_MODE = "X2") else ((not cnt1_up) and cnt0_up); 

        process (fclk_fifo, resetn_up)
        begin
            if (resetn_up = '0') then
                update_a <= '0';
		    elsif fclk_fifo'event and fclk_fifo='1' then
                if (update_rd = '1') then
                    update_a <= '1';
                else
                    update_a <= '0';
                end if;
            end if;
        end process;

        process(fclk_fifo, reset_f)
        begin
            if (reset_f = '1')  then
                update_rp <= '0';
		    elsif fclk_fifo'event and fclk_fifo='1' then
                update_rp <= update_a;
            end if;
        end process;

        wr_dqcomp <= (wpt_q_2 xor rpt_d_2) or (wpt_q_1 xor rpt_d_1) or (wpt_q_0 xor rpt_d_0);
        wr_qqcomp <= (wpt_q_2 xor rpt_q_2) or (wpt_q_1 xor rpt_q_1) or (wpt_q_0 xor rpt_q_0);
        shift <= ((not ff_mode_sel) and ((wr_dqcomp and sign_q) or (wr_qqcomp and (not sign_q))));

        process(fclk_fifo, resetn_rfq, shift)
        begin
            if (resetn_rfq = '0') then 
                shift_0 <= '0';
                shift_1 <= '0';
            elsif (fclk_fifo = '0') then
                shift_0 <= shift;
            elsif (fclk_fifo = '1') then
                shift_1 <= shift;
            end if;
        end process;

        process(fclk_fifo, resetn_rfq)
        begin
            if (resetn_rfq = '0') then
                shift_q <= '0';
		    elsif fclk_fifo'event and fclk_fifo='0' then
                shift_q <= (shift_0 and (not sign_q));
            end if;
        end process;

        x1_mode_sel <= '1' when(DQS_MODE = "X1") else '0';      

        process(fclk_fifo, resetn_rfq)
        begin
            if (resetn_rfq = '0')  then
                sign_q <= '0';
		    elsif fclk_fifo'event and fclk_fifo='1' then
                sign_q <= (shift_1 and (shift_q or sign_q or x1_mode_sel));
            end if;
        end process;

        ren <= sign_q or ff_mode_sel;

        process(fclk_fifo, resetn_rfq)
        begin
            if (resetn_rfq = '0') then
                rd_q <= '0';
                rd_q_1 <= '0';
		    elsif fclk_fifo'event and fclk_fifo='1' then
                if (update_a = '1') then
                    rd_q <= (shift_1 and (shift_q or sign_q or x1_mode_sel));
                else
                    rd_q_1 <= rd_q;      
                end if;
            end if;
        end process;

        rqen <= rd_q or ff_mode_sel;

        process(fclk_fifo, resetn_rfq)
        begin
            if (resetn_rfq = '0') then
                rd_up <= '0';
		    elsif fclk_fifo'event and fclk_fifo='1' then
                if (update_rp = '1') then 
                    rd_up <= rd_q_1;
                end if;
            end if;
        end process;

        r_valid <= ren when (DQS_MODE = "X1") else rd_up;

        process(PCLK, resetn_rfq)
        begin
            if (resetn_rfq = '0') then
                rvalid_reg <= '0';
		    elsif PCLK'event and PCLK='1' then
                rvalid_reg <= r_valid;
            end if;
        end process;

        RVALID <= rvalid_reg;

end Behavioral;	


------------------------------DLLDLY---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.glb.GSRO;

entity DLLDLY is
    GENERIC(
        DLL_INSEL : bit := '1'; --'1': use dll_delay cell. '1' only
        DLY_SIGN : bit := '0'; -- '0':'+',  '1': '-'
        DLY_ADJ : integer := 0 --0~255, dly_sign=0 :dly_adj; dly_sign=1: -256+dly_adj
    );
    PORT(
        DLLSTEP : IN std_logic_vector(7 downto 0);
        CLKIN:IN std_logic;
        DIR,LOADN,MOVE: In std_logic;
        CLKOUT : OUT std_logic;
        FLAG : OUT std_logic
     );
end DLLDLY;

architecture Behavioral of DLLDLY is
signal premove :std_logic;
signal clkin_edge,clkin_period,clkin_period_pre :time := 0 ns;
signal step_dly : time := 0.0 ns;
signal del : time := 0.025 ns;
signal dly_adj_0 : integer := 0;
signal clk_effect : std_logic := '0';
signal flag_sig : std_logic := '0';
signal step_reg,dllstep_adj : std_logic_vector(7 downto 0) := "00000000";
signal grstn : std_logic;

begin
        
grstn<= GSRO;	

process (CLKIN,DIR,LOADN,MOVE,DLLSTEP)
begin
    if(DLY_SIGN = '0') then
        dly_adj_0 <= DLY_ADJ;
    elsif(DLY_SIGN = '1') then
        dly_adj_0 <= (-256) + DLY_ADJ;
    end if;
end process;

process(CLKIN)
begin
    if(grstn = '0') then
        clk_effect <= '0';
    elsif(CLKIN'event and CLKIN = '1') then
        clkin_period_pre <= clkin_period;
        clkin_period <= NOW - clkin_edge;
		clkin_edge <= NOW;

        if(clkin_period > 0 ns) then
            if(clkin_period = clkin_period_pre) then
		        clk_effect <= '1';
		    else
			    clk_effect <= '0';
		    end if;   
        end if;
    end if;
  
end process; 

process(step_reg,DIR) 
begin
    if ((step_reg = "11111111" and DIR = '0') or (step_reg = "00000000" and DIR = '1')) then
        flag_sig <= '1';
    else
        flag_sig <= '0';
    end if;
end process;

FLAG <= flag_sig;

process (MOVE)
begin
    premove <= MOVE;
end process;

dllstep_adj <= "00000000" when ((DLLSTEP + dly_adj_0) <= 0) else "11111111" when ((DLLSTEP + dly_adj_0) >= 255) else (DLLSTEP + dly_adj_0);

process(DLLSTEP, LOADN, MOVE, CLKIN, clk_effect)
begin
    if (clk_effect = '1') then
        if (LOADN = '0') then
            step_reg <= dllstep_adj;
        else
            if (MOVE = '0' and premove = '1') then
                if (LOADN = '1') then
                    if (DIR = '0') then  --plus(+)
                        if ((flag_sig = '0') or (step_reg = "00000000")) then
                            step_reg <= step_reg + 1;
                        end if;
                    elsif (DIR = '1') then  -- minus (-)
                        if ((flag_sig = '0') or (step_reg = "11111111")) then
                            step_reg <= step_reg - 1;
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end if;
end process;

process (step_reg) 
begin
    if(DLL_INSEL = '1') then
        step_dly <= CONV_INTEGER(step_reg) * del;
    elsif(DLL_INSEL = '0') then
        step_dly <= 0.0 ns;
    end if;
end process;

process(CLKIN) 
begin
    CLKOUT <= transport CLKIN after step_dly;
end process;

end Behavioral;


------------------------------DCS---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DCS is
	GENERIC (
		DCS_MODE : string := "RISING"   --CLK0,CLK1,CLK2,CLK3,GND,VCC,RISING,FALLING,CLK0_GND,CLK0_VCC,CLK1_GND,CLK1_VCC,CLK2_GND,CLK2_VCC,CLK3_GND,CLK3_VCC
	);
	PORT (
		CLK0 : IN std_logic;
		CLK1 : IN std_logic;
		CLK2 : IN std_logic;
		CLK3 : IN std_logic;
		CLKSEL : IN std_logic_vector(3 downto 0);
		SELFORCE : IN std_logic;
		CLKOUT : OUT std_logic
	);
end DCS;

ARCHITECTURE Behavioral of DCS is
	signal clk0_out,clk1_out,clk2_out,clk3_out,gnd_out,vcc_out : std_logic;
	signal flag_g0,flag_v0,flag_g1,flag_v1,flag_g2,flag_v2,flag_g3,flag_v3 : std_logic := '0';
	signal clk0_gnd,clk0_vcc,clk1_gnd,clk1_vcc,clk2_gnd,clk2_vcc,clk3_gnd,clk3_vcc : std_logic;
	signal clkout_f0,clkout_f1,clkout_f2,clkout_f3,clkout_f : std_logic;
    signal clkout_r0,clkout_r1,clkout_r2,clkout_r3,clkout_r : std_logic;
	signal flag_f0,flag_f1,flag_f2,flag_f3 : std_logic := '0';
    signal flag_r0,flag_r1,flag_r2,flag_r3 : std_logic := '0';
	signal selforce_out : std_logic;
	signal dcsout : std_logic;
	signal clk_out : std_logic := '0';

begin
-----------------------CLK,GND,VCC------------------------
    clk0_out <= CLK0;
    clk1_out <= CLK1;
    clk2_out <= CLK2;
    clk3_out <= CLK3;

    gnd_out <= '0';
    vcc_out <= '1';
------------------------FALLING-------------------------------
    process(CLK0)
	begin
		if(falling_edge(CLK0) and CLKSEL(0) = '1' and flag_f1 = '0' and flag_f2 = '0' and flag_f3 = '0') then
			flag_f0 <= '1';
		elsif(falling_edge(CLK0)) then
			flag_f0 <= '0';
		end if;
	end process;
    clkout_f0 <= CLK0 and flag_f0;

    process(CLK1)
	begin
		if(falling_edge(CLK1) and CLKSEL(1) = '1' and flag_f0 = '0' and flag_f2 = '0' and flag_f3 = '0') then
			flag_f1 <= '1';
		elsif(falling_edge(CLK1)) then
			flag_f1 <= '0';
		end if;
	end process;
    clkout_f1 <= CLK1 and flag_f1;

    process(CLK2)
	begin
		if(falling_edge(CLK2) and CLKSEL(2) = '1' and flag_f0 = '0' and flag_f1 = '0' and flag_f3 = '0') then
			flag_f2 <= '1';
		elsif(falling_edge(CLK2)) then
			flag_f2 <= '0';
		end if;
	end process;
    clkout_f2 <= CLK2 and flag_f2;

    process(CLK3)
	begin
		if(falling_edge(CLK3) and CLKSEL(3) = '1' and flag_f0 = '0' and flag_f1 = '0' and flag_f2 = '0') then
			flag_f3 <= '1';
		elsif(falling_edge(CLK3)) then
			flag_f3 <= '0';
		end if;
	end process;
    clkout_f3 <= CLK3 and flag_f3;

    clkout_f <= clkout_f0 when flag_f0 = '1' else
                clkout_f1 when flag_f1 = '1' else
                clkout_f2 when flag_f2 = '1' else
                clkout_f3 when flag_f3 = '1' else '0';

------------------------RISING-------------------------------
    process(CLK0)
    begin
        if(rising_edge(CLK0) and CLKSEL(0) = '1' and flag_r1 = '0' and flag_r2 = '0' and flag_r3 = '0') then
            flag_r0 <= '1';
        elsif(rising_edge(CLK0)) then
            flag_r0 <= '0';
        end if;
    end process;
    clkout_r0 <= not ((not CLK0) and flag_r0);

    process(CLK1)
    begin
        if(rising_edge(CLK1) and CLKSEL(1) = '1' and flag_r0 = '0' and flag_r2 = '0' and flag_r3 = '0') then
            flag_r1 <= '1';
        elsif(rising_edge(CLK1)) then
            flag_r1 <= '0';
        end if;
    end process;
    clkout_r1 <= not ((not CLK1) and flag_r1);

    process(CLK2)
    begin
        if(rising_edge(CLK2) and CLKSEL(2) = '1' and flag_r0 = '0' and flag_r1 = '0' and flag_r3 = '0') then
            flag_r2 <= '1';
        elsif(rising_edge(CLK2)) then
            flag_r2 <= '0';
        end if;
    end process;
    clkout_r2 <= not ((not CLK2) and flag_r2);

    process(CLK3)
    begin
        if(rising_edge(CLK3) and CLKSEL(3) = '1' and flag_r0 = '0' and flag_r1 = '0' and flag_r2 = '0') then
            flag_r3 <= '1';
        elsif(rising_edge(CLK3)) then
            flag_r3 <= '0';
        end if;
    end process;
    clkout_r3 <= not ((not CLK3) and flag_r3);

    clkout_r <= clkout_r0 when flag_r0 = '1' else
                clkout_r1 when flag_r1 = '1' else
                clkout_r2 when flag_r2 = '1' else
                clkout_r3 when flag_r3 = '1' else '1';

------------------------CLK0_GND-------------------------------
    process(CLK0)
	begin
		if(falling_edge(CLK0) and CLKSEL(0) = '1') then
			flag_g0 <= '1';
		elsif(falling_edge(CLK0)) then
			flag_g0 <= '0';
		end if;
	end process;
    clk0_gnd <= CLK0 and flag_g0;
------------------------CLK0_VCC-------------------------------
    process(CLK0)
	begin
		if(rising_edge(CLK0) and CLKSEL(0) = '1') then
			flag_v0 <= '1';
		elsif(rising_edge(CLK0)) then
			flag_v0 <= '0';
		end if;
	end process;
    clk0_vcc <= not ((not CLK0) and flag_v0);

------------------------CLK1_GND-------------------------------
    process(CLK1)
	begin
		if(falling_edge(CLK1) and CLKSEL(1) = '1') then
			flag_g1 <= '1';
		elsif(falling_edge(CLK1)) then
			flag_g1 <= '0';
		end if;
	end process;
    clk1_gnd <= CLK1 and flag_g1;
------------------------CLK1_VCC-------------------------------
    process(CLK1)
	begin
		if(rising_edge(CLK1) and CLKSEL(1) = '1') then
			flag_v1 <= '1';
		elsif(rising_edge(CLK1)) then
			flag_v1 <= '0';
		end if;
	end process;
    clk1_vcc <= not ((not CLK1) and flag_v1);

------------------------CLK2_GND-------------------------------
    process(CLK2)
	begin
		if(falling_edge(CLK2) and CLKSEL(2) = '1') then
			flag_g2 <= '1';
		elsif(falling_edge(CLK2)) then
			flag_g2 <= '0';
		end if;
	end process;
    clk2_gnd <= CLK2 and flag_g2;
------------------------CLK2_VCC-------------------------------
    process(CLK2)
	begin
		if(rising_edge(CLK2) and CLKSEL(2) = '1') then
			flag_v2 <= '1';
		elsif(rising_edge(CLK2)) then
			flag_v2 <= '0';
		end if;
	end process;
    clk2_vcc <= not ((not CLK2) and flag_v2);

------------------------CLK3_GND-------------------------------
    process(CLK3)
	begin
		if(falling_edge(CLK3) and CLKSEL(3) = '1') then
			flag_g3 <= '1';
		elsif(falling_edge(CLK3)) then
			flag_g3 <= '0';
		end if;
	end process;
    clk3_gnd <= CLK3 and flag_g3;
------------------------CLK3_VCC-------------------------------
    process(CLK3)
	begin
		if(rising_edge(CLK3) and CLKSEL(3) = '1') then
			flag_v3 <= '1';
		elsif(rising_edge(CLK3)) then
			flag_v3 <= '0';
		end if;
	end process;
    clk3_vcc <= not ((not CLK3) and flag_v3);

------------------------dcsout-------------------------------
    process(clk0_out,clk1_out,clk2_out,clk3_out,gnd_out,vcc_out,clk0_gnd,clk0_vcc,clk1_gnd,clk1_vcc,clk2_gnd,clk2_vcc,clk3_gnd,clk3_vcc,clkout_f,clkout_r)
	begin
		if(DCS_MODE = "CLK0") then
			dcsout <= clk0_out;
		elsif(DCS_MODE = "CLK1") then
			dcsout <= clk1_out;
        elsif(DCS_MODE = "CLK2") then
			dcsout <= clk2_out;
        elsif(DCS_MODE = "CLK3") then
			dcsout <= clk3_out;
        elsif(DCS_MODE = "GND") then
			dcsout <= gnd_out;
        elsif(DCS_MODE = "VCC") then
			dcsout <= vcc_out;
        elsif(DCS_MODE = "FALLING") then
			dcsout <= clkout_f;
        elsif(DCS_MODE = "RISING") then
			dcsout <= clkout_r;
        elsif(DCS_MODE = "CLK0_GND") then
			dcsout <= clk0_gnd;
        elsif(DCS_MODE = "CLK0_VCC") then
			dcsout <= clk0_vcc;
        elsif(DCS_MODE = "CLK1_GND") then
			dcsout <= clk1_gnd;
        elsif(DCS_MODE = "CLK1_VCC") then
			dcsout <= clk1_vcc;
        elsif(DCS_MODE = "CLK2_GND") then
			dcsout <= clk2_gnd;
        elsif(DCS_MODE = "CLK2_VCC") then
			dcsout <= clk2_vcc;
        elsif(DCS_MODE = "CLK3_GND") then
			dcsout <= clk3_gnd;
        elsif(DCS_MODE = "CLK3_VCC") then
			dcsout <= clk3_vcc;
		end if;
	end process;

------------------------clk_out-------------------------------
    selforce_out <= CLK0 when CLKSEL = "0001" else
                    CLK1 when CLKSEL = "0010" else
                    CLK2 when CLKSEL = "0100" else
                    CLK3 when CLKSEL = "1000" else '0';
    process(dcsout,selforce_out,SELFORCE)
	begin
		if(SELFORCE = '0') then
			clk_out <= dcsout;
		elsif(SELFORCE = '1') then
			clk_out <= selforce_out;
		end if;
	end process;

    CLKOUT <= clk_out;

end Behavioral;

----------------------------DQCE ------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DQCE is
    PORT (
	 CLKOUT : OUT std_logic;	
	 CE : IN std_logic;	
	 CLKIN : IN std_logic
    );	
end DQCE;

ARCHITECTURE Behavioral OF DQCE IS
    SIGNAL ce_reg : std_logic;		
begin
	
    process (CLKIN)
    begin
	    if (CLKIN'event and CLKIN='0') then
            ce_reg <= CE;	
	    end if;
    end process;

    CLKOUT <= CLKIN and ce_reg;

end Behavioral;

------------------------------CLKDIV2---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.glb.GSRO;

entity CLKDIV2 is
    GENERIC(
	     GSREN : STRING := "false" -- "false", "true"
    );
    PORT(
         HCLKIN : IN std_logic;
	     RESETN : IN std_logic;
	     CLKOUT : OUT std_logic
    );
end CLKDIV2;

architecture Behavioral of CLKDIV2 is
signal reset_0 : std_logic := '0';
signal clk_div2 : std_logic := '0';
signal grstn :std_logic;

begin
    
    grstn <= GSRO when (GSREN = "true") else '1';

    process(HCLKIN, grstn, RESETN)
    begin
        if (grstn = '0') then
            reset_0 <= '0';
        elsif (RESETN = '0') then
            reset_0 <= '0';
        elsif (HCLKIN'event and HCLKIN = '1') then
            reset_0 <= '0';
        end if;
    end process;

    process(HCLKIN, grstn, RESETN)
    begin
        if (grstn = '0') then
            clk_div2  <= '0';
        elsif (RESETN = '0') then
            clk_div2  <= '0';
        elsif (HCLKIN'event and HCLKIN = '1') then
            clk_div2 <= (clk_div2 xor (not reset_0));
        end if;
    end process;

    CLKOUT <= clk_div2;

end Behavioral;

--------------------IODELAYA-----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IODELAYA is
	GENERIC (  C_STATIC_DLY : integer := 0); -- 0~127
	PORT (
		DI : IN std_logic;
		SDTAP : IN std_logic;
		SETN : IN std_logic;
		VALUE : IN std_logic;
		DO : OUT std_logic;
		DF : OUT std_logic
	);
end IODELAYA;

architecture Behavioral of IODELAYA is
	SIGNAL delay_data : integer := 0;
	SIGNAL delay_time : time := 0.000 ns;
	SIGNAL delay_in : std_logic_vector(127 downto 0);
    signal value_en : std_logic;
    signal value_sig,pre_value_sig,pre_DO : std_logic;
    signal DO_sig,DF_sig : std_logic;
    signal delay_out : std_logic := '0';

    signal i : integer;

begin
	
    --delay_in(0) <= DI after 0.025 ns; 
    --gen_delay : for i in 1 to 127 generate
    --    delay_in(i)<= delay_in(i-1) after 0.025 ns;
    --end generate gen_delay; 
    --DO_sig <= DI when(delay_data = 0) else delay_in(delay_data-1);
    
    delay_time <=  (0.025 ns * delay_data);
    delay_out <= DI after delay_time;
    DO_sig <= DI when(delay_data = 0) else delay_out;

    DO <= DO_sig;
     
    process (SDTAP, value_sig)
	begin
		if (SDTAP = '0') then
		    delay_data <= C_STATIC_DLY;
		else
            if(pre_value_sig = '1' and value_sig = '0') then
                if (SDTAP = '1') then
			        --if ((SETN = '1') and (delay_data /= 0)) then
			        if ((SETN = '1') and ((DF_sig = '0') or (delay_data = 127))) then
				        delay_data <= delay_data - 1;
			        --elsif ((SETN = '0') and (delay_data /= 127)) then
			        elsif ((SETN = '0') and ((DF_sig = '0') or (delay_data = 0))) then
				        delay_data <= delay_data + 1;
			        end if;
		        end if;
            end if;
		end if; 
	end process;

    process(DO_sig) 
    begin
        pre_DO <= DO_sig;
    end process;

    value_en <= VALUE and (not DF_sig);
    
    process(value_en, DO_sig)
    begin
        if (DO_sig = '0' and pre_DO = '1') then
            value_sig <= value_en;
        end if;
    end process;

    process (value_sig) 
    begin
        pre_value_sig <= value_sig;
    end process;
	
	process (delay_data,SETN)
	begin
		if (((SETN = '1')  and (delay_data = 0)) or ((SETN = '0') and (delay_data = 127)) )then
			DF_sig <= '1';
		else
			DF_sig <= '0';
		end if;	
	end process;

    DF <= DF_sig;
		
end Behavioral;



------------------------------rPLL---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity rPLL is
    GENERIC(
             FCLKIN : STRING := "100.0"; --frequency of the clkin(M)
             DEVICE : STRING := "GW2A-55"; --"GW2A-18","GW2A-55","GW2AR-18","GW2A-55C","GW2A-18C","GW2AR-18C","GW2ANR-18C","GW2AN-55C"
             DYN_IDIV_SEL : STRING := "false";--true:IDSEL; false:IDIV_SEL
             IDIV_SEL : integer := 0;--Input divider IDIV, 0:1,1:2...63:64.  1~64
             DYN_FBDIV_SEL : STRING := "false";
             FBDIV_SEL : integer := 0;--Feedback divider FBDIV,  0:1,1:2...63:64. 1~64
             DYN_ODIV_SEL : STRING := "false";--true:ODSEL; false:ODIV_SEL
             ODIV_SEL : integer := 8;--2/4/8/16/32/48/64/80/96/112/128
             PSDA_SEL : STRING := "0000";--
             DYN_DA_EN : STRING := "false";--true:PSDA or DUTYDA or FDA; false: DA_SEL
             DUTYDA_SEL : STRING := "1000";--
             CLKOUT_FT_DIR : bit := '1'; -- CLKOUT fine tuning direction. '1' only
             CLKOUTP_FT_DIR : bit := '1'; -- '1' only
             CLKOUT_DLY_STEP : integer := 0; -- 0,1,2,4
             CLKOUTP_DLY_STEP : integer := 0; -- 0,1,2

             CLKOUTD3_SRC : STRING := "CLKOUT";--select div3 output, CLKOUTP or CLKOUT
             CLKFB_SEL : STRING := "internal"; --"internal", "external"
             CLKOUT_BYPASS : STRING := "false";
             CLKOUTP_BYPASS : STRING := "false";
             CLKOUTD_BYPASS : STRING := "false";
             CLKOUTD_SRC : STRING := "CLKOUT";--select div output,  CLKOUTP or CLKOUT
             DYN_SDIV_SEL : integer := 2 -- 2~128,only even num
	      );
    PORT(
             CLKIN : IN std_logic;
             CLKFB : IN std_logic:='0';
             IDSEL : In std_logic_vector(5 downto 0);
             FBDSEL : In std_logic_vector(5 downto 0);
             ODSEL : In std_logic_vector(5 downto 0);
             RESET : in std_logic:='0';
             RESET_P : in std_logic:='0';
             PSDA,FDLY : In std_logic_vector(3 downto 0);
             DUTYDA : In std_logic_vector(3 downto 0);
             LOCK : OUT std_logic;
             CLKOUT : OUT std_logic;
             CLKOUTD : out std_logic;
             CLKOUTP : out std_logic;
             CLKOUTD3 : out std_logic
        );
end rPLL;

architecture Behavioral of rPLL is
        
signal IDIV_SEL_reg,FBDIV_SEL_reg : integer;
signal IDIV_dyn,FBDIV_dyn,IDIV_SEL_reg1,FBDIV_SEL_reg1 : integer;
signal ODSEL_reg : std_logic_vector(5 downto 0);
signal div_dyn_change : std_logic;
signal IDIV_reg,FBDIV_reg : integer := 1;
type  clkin_arr  is array (4 downto 0) of time;
signal clkin_cycle : clkin_arr := (0.0 ns, 0.0 ns, 0.0 ns, 0.0 ns,0.0 ns);
signal clkin_period,clkin_period1 :  time := 2.000 ns;
signal clk_effect,oclk_effect,oclk_build : std_logic := '0';
signal clkout_period : time := 2.000 ns;
signal clkin_period_ref : real := 2.000;
signal tclkout_half,tclkout_half_new : time := 0.000 ns;
signal clkfb_curtime,clkin_curtime,FB_dly,FB_dly0 : time := 0.000 ns;

signal clk_div_src : std_logic;
signal clkfb_reg,clkfb_reg_0,clkfb_0 : std_logic := '0';
signal clkout_o,clk_out,clkoutp_o,clk_ps_reg,clk_ps_reg0 : std_logic := '0';
signal lock_reg : std_logic := '0';
signal clk_tlock_cur : time := 0.0 ns;
signal max_tlock : time := 50000 ns;
signal cnt_lock : integer := 0;

signal ps_dly,f_dly,clkout_duty, ps_value, duty_value,tclkp_duty : time := 0.000 ns;

signal cnt_div,cnt_div3 : integer := 0;
signal multi_clkin : integer;
signal clkout_div_reg,div3_in,div3_reg,pre_div3_in : std_logic := '0';
signal clkin_init,div3_init,clkfb_init,fb_clk_init : std_logic := '1';
signal inner_reset:std_logic:='0';
signal real_fbdiv,real_idiv : real := 1.0;

begin

    IDIV_dyn <= 64 - conv_integer(IDSEL);
    FBDIV_dyn <= 64 - conv_integer(FBDSEL);
    IDIV_SEL_reg <= IDIV_dyn when (DYN_IDIV_SEL = "true") else (IDIV_SEL+1);
    FBDIV_SEL_reg <= FBDIV_dyn when DYN_FBDIV_SEL = "true" else (FBDIV_SEL+1);

    inner_reset <= RESET or RESET_P ;

    process(CLKIN, inner_reset)
    variable clkin_edge_pre :time := 0 ns;
    variable clkin_edge_cur :time := 0 ns;

    begin
        real_fbdiv <= real(FBDIV_SEL_reg);
        real_idiv <= real(IDIV_SEL_reg);
        if(inner_reset = '1')then
            clk_effect <= '0';
            clkin_cycle(0) <= 0.0 ns;
        elsif(CLKIN'event and CLKIN = '1')then
            clkin_edge_cur := NOW;
            clkin_cycle(4) <= clkin_cycle(3);
	        clkin_cycle(3) <= clkin_cycle(2);
	        clkin_cycle(2) <= clkin_cycle(1);
            clkin_cycle(1) <= clkin_cycle(0);

            if(clkin_edge_pre /= 0 ns)then
                clkin_cycle(0) <= clkin_edge_cur - clkin_edge_pre;
            end if;

            clkin_edge_pre := clkin_edge_cur;

            if(clkin_edge_pre /= 0 ns) then
                if((clkin_cycle(0) = clkin_period) and (div_dyn_change = '0')) then
                    clk_effect <= '1';
                    clkout_period <= clkin_period* real_idiv/real_fbdiv;
                    tclkout_half <= clkout_period /2;

                else
                    clk_effect <= '0';
                end if;
            end if;
        end if;
    end process;

    process(clkin_cycle(0),clkin_cycle(1),clkin_cycle(2),clkin_cycle(3),clkin_cycle(4),clkin_period) 
    variable clkin_period_tmp : time := 0.0 ns;
    begin
        clkin_period_tmp := clkin_cycle(0);
        if(clkin_period_tmp /= clkin_period) then
		    clkin_period1 <= (clkin_cycle(0) + clkin_cycle(1) + clkin_cycle(2) + clkin_cycle(3) + clkin_cycle(4))/5.0;
            clkin_period <= clkin_period1;
        end if;
    end process;

    process(CLKIN) 
    begin
        if(rising_edge(CLKIN)) then
            IDIV_SEL_reg1 <= IDIV_SEL_reg;
            FBDIV_SEL_reg1 <= FBDIV_SEL_reg;
            ODSEL_reg <= ODSEL;
        end if;
    end process;

    process(IDIV_SEL_reg,FBDIV_SEL_reg,ODSEL,IDIV_SEL_reg1,FBDIV_SEL_reg1,ODSEL_reg)
    begin
        if((IDIV_SEL_reg1 /= IDIV_SEL_reg) or (FBDIV_SEL_reg1 /= FBDIV_SEL_reg) or (ODSEL_reg /= ODSEL)) then
            div_dyn_change <= '1';
        else
            div_dyn_change <= '0';
        end if;
    end process;

    -- lock time
    process(CLKIN, inner_reset) 
    begin
        if (inner_reset = '1') then
            max_tlock <= 0.0 us;
        elsif(rising_edge(CLKIN)) then
            if((clkin_cycle(0) >= 2 ns) and (clkin_cycle(0) <= 40 ns)) then
                max_tlock <= 50000 ns;
            elsif ((clkin_cycle(0) > 40 ns) and (clkin_cycle(0) <= 500 ns)) then
                max_tlock <= 200000 ns;              
            end if;
        end if;
    end process;

    process(CLKIN, inner_reset)    
    begin
        if (inner_reset = '1') then
            lock_reg <= '0';
            oclk_effect <= '0';
        elsif(rising_edge(CLKIN)) then
            if(clk_effect = '1') then
                cnt_lock <= cnt_lock + 1;

                if(cnt_lock > (max_tlock/clkin_period - 10)) then
                    oclk_effect <= '1';
                else
                    oclk_effect <= '0';
                end if;

                if(cnt_lock > (max_tlock/clkin_period)) then
                    lock_reg <= '1';
                else
                    lock_reg <= '0';
                end if;

            else
                oclk_effect <= '0';
                cnt_lock <= 0;
                lock_reg <= '0';           
            end if;
        end if;
    end process;
    
    process 
    variable clkfb_flag : std_logic := '1';
    begin
        if(oclk_effect = '0') then
            clkfb_reg <= '0';
        else
            if(clkfb_flag = '1') then
                clkfb_reg <= '1';
                clkfb_flag := '0';
            else
                wait for (tclkout_half); 
                clkfb_reg <= not clkfb_reg ;
            end if;
        end if;
        wait on oclk_effect,clkfb_reg;
    end process;


    -- calculate CLKFB feedback delay
    process(CLKIN) 
    begin
        if (rising_edge(CLKIN)) then
            if (clkin_init = '1') then
                clkin_curtime <= NOW;
                clkin_init <= '0';
            end if;
        end if;
    end process;

    process(CLKFB) 
    begin
        if (rising_edge(CLKFB)) then
            if (fb_clk_init = '1') then
                clkfb_curtime <= NOW;
                fb_clk_init <= '0';
            end if;
        end if;
    end process;

    process(CLKFB, CLKIN) 
    begin
        if ((clkfb_curtime > 0 ns) and (clkin_curtime > 0 ns)) then
            FB_dly0 <= clkfb_curtime - clkin_curtime;
        end if;

        if ((FB_dly0 >= 0 ns) and (clkin_cycle(0) > 0 ns)) then
            --multi_clkin <= FB_dly0 / (clkin_cycle(0));
            FB_dly <= clkin_cycle(0) - (FB_dly0 - (clkin_cycle(0)) * (FB_dly0 / (clkin_cycle(0))));
        end if;
    end process;

    process (clkfb_reg)
    begin
        if (CLKFB_SEL = "internal") then
            clkfb_0 <= clkfb_reg;
        else
            clkfb_0 <= transport clkfb_reg after (FB_dly);
        end if;
    end process;

    -- clkout
    process
    begin
        if (rising_edge(clkfb_0)) then
            clkout_o <= '1';
            wait for tclkout_half_new;
            clkout_o <= '0';
        end if;
        wait on clkfb_0;
    end process;

    process(CLKIN, oclk_effect, clkout_o, inner_reset) 
    begin
        if (inner_reset = '1') then
            clk_out <= '0';
        --elsif (oclk_effect = '1') then
        else 
            clk_out <= clkout_o;
        end if;
    end process;

    CLKOUT <= CLKIN when (CLKOUT_BYPASS = "true") else clk_out;
    LOCK <= lock_reg;  

    --clkout_p
    --DYN_DA_EN == "false".
    --phase_shift_value
    process (CLKIN,clkout_period)
    variable psda_sel_sig0 : string(1 to 4);
    begin
        psda_sel_sig0 := PSDA_SEL;
        case (psda_sel_sig0) is
	        when "0000" => ps_value <= (clkout_period *  0.0)/16.0;
	        when "0001" => ps_value <= (clkout_period *  1.0)/16.0;
	        when "0010" => ps_value <= (clkout_period *  2.0)/16.0;
	        when "0011" => ps_value <= (clkout_period *  3.0)/16.0;
	        when "0100" => ps_value <= (clkout_period *  4.0)/16.0;
	        when "0101" => ps_value <= (clkout_period *  5.0)/16.0;
	        when "0110" => ps_value <= (clkout_period *  6.0)/16.0;
	        when "0111" => ps_value <= (clkout_period *  7.0)/16.0;
	        when "1000" => ps_value <= (clkout_period *  8.0)/16.0;
	        when "1001" => ps_value <= (clkout_period *  9.0)/16.0;
	        when "1010" => ps_value <= (clkout_period * 10.0)/16.0;
	        when "1011" => ps_value <= (clkout_period * 11.0)/16.0;
	        when "1100" => ps_value <= (clkout_period * 12.0)/16.0;
	        when "1101" => ps_value <= (clkout_period * 13.0)/16.0;
	        when "1110" => ps_value <= (clkout_period * 14.0)/16.0;
	        when "1111" => ps_value <= (clkout_period * 15.0)/16.0;
            when others => ps_value <= (clkout_period *  0.0)/16.0;
	    end case;
    end process;

    process (CLKIN,clkout_period)
    variable dutyda_sel_sig0 : string(1 to 4);
    begin
        dutyda_sel_sig0 := DUTYDA_SEL;
        case (dutyda_sel_sig0) is
	        when "0000" => duty_value <= (clkout_period *  0.0)/16.0;
	        when "0001" => duty_value <= (clkout_period *  1.0)/16.0;
	        when "0010" => duty_value <= (clkout_period *  2.0)/16.0;
	        when "0011" => duty_value <= (clkout_period *  3.0)/16.0;
	        when "0100" => duty_value <= (clkout_period *  4.0)/16.0;
	        when "0101" => duty_value <= (clkout_period *  5.0)/16.0;
	        when "0110" => duty_value <= (clkout_period *  6.0)/16.0;
	        when "0111" => duty_value <= (clkout_period *  7.0)/16.0;
	        when "1000" => duty_value <= (clkout_period *  8.0)/16.0;
	        when "1001" => duty_value <= (clkout_period *  9.0)/16.0;
	        when "1010" => duty_value <= (clkout_period * 10.0)/16.0;
	        when "1011" => duty_value <= (clkout_period * 11.0)/16.0;
	        when "1100" => duty_value <= (clkout_period * 12.0)/16.0;
	        when "1101" => duty_value <= (clkout_period * 13.0)/16.0;
	        when "1110" => duty_value <= (clkout_period * 14.0)/16.0;
	        when "1111" => duty_value <= (clkout_period * 15.0)/16.0;
            when others => duty_value <= (clkout_period *  0.0)/16.0;
	    end case;
    end process;

    -- DYN_DA_EN = "true".
    process (FDLY) 
    begin
        if(DYN_DA_EN = "true") then
            if(DEVICE = "GW1N-1" or DEVICE = "GW1N-1S") then
                if(FDLY = "0000") then
                    f_dly <= 0.000 ns;
                elsif (FDLY = "0001") then
                    f_dly <= 0.125 ns;
                elsif (FDLY = "0010") then
                    f_dly <= 0.250 ns;
                elsif (FDLY = "0100") then
                    f_dly <= 0.500 ns;
                elsif (FDLY = "1000") then
                    f_dly <= 1.000 ns;
                end if;                
            else
                if(FDLY = "1111") then
                    f_dly <= 0.000 ns;
                elsif (FDLY = "1110") then
                    f_dly <= 0.125 ns;
                elsif (FDLY = "1101") then
                    f_dly <= 0.250 ns;
                elsif (FDLY = "1011") then
                    f_dly <= 0.500 ns;
                elsif (FDLY = "0111") then
                    f_dly <= 1.000 ns;
                end if;
            end if;
        end if;
    end process;

    process (PSDA,DUTYDA,ps_value,duty_value)
    variable psda_sig,dutyda_sig : integer; 
    begin
        psda_sig := conv_integer(PSDA);
        dutyda_sig := conv_integer(DUTYDA);
        if (DYN_DA_EN = "true") then
            ps_dly <= (clkout_period * psda_sig)/16;
            if (dutyda_sig > psda_sig) then
                clkout_duty <= (clkout_period * (dutyda_sig - psda_sig))/16;
            elsif (dutyda_sig < psda_sig) then
                clkout_duty <= (clkout_period*(16 + dutyda_sig - psda_sig))/16;
            else 
                clkout_duty <= (clkout_period)/2;
            end if;
        else 
            ps_dly <= ps_value;
            clkout_duty <= duty_value;
        end if;
    end process;
                      
    process (tclkout_half, clkout_duty)
    begin
        if (DYN_DA_EN = "false") then
            tclkout_half_new <= tclkout_half;
            tclkp_duty <= clkout_duty;
        else 
            if (CLKOUT_FT_DIR = '1') then 
                tclkout_half_new <= tclkout_half - ((0.05 ns) * CLKOUT_DLY_STEP);
            else
                tclkout_half_new <=  tclkout_half + ((0.05 ns) * CLKOUT_DLY_STEP);
            end if;

            if (CLKOUTP_FT_DIR = '1') then
                tclkp_duty <= clkout_duty - ((0.05 ns) * CLKOUTP_DLY_STEP);
	        else
                tclkp_duty <=  clkout_duty + ((0.05 ns) * CLKOUTP_DLY_STEP);
            end if;
        end if;
    end process;

    process 
    begin
        if (rising_edge(clkfb_0)) then
            clkoutp_o <= '1';
            wait for tclkp_duty;
            clkoutp_o <= '0';
        end if;
        wait on clkfb_0;
    end process;

    process(clkoutp_o)
    begin
        clk_ps_reg0 <= transport clkoutp_o after (ps_dly+f_dly);    
    end process;
      
    process (CLKIN, oclk_effect, clk_ps_reg0, inner_reset) 
    begin
        if (inner_reset = '1') then
            clk_ps_reg <= '0';
        --elsif (oclk_effect = '1') then
        else 
            clk_ps_reg <= clk_ps_reg0;
        end if;
    end process;

    CLKOUTP <= CLKIN when (CLKOUTP_BYPASS = "true") else clk_ps_reg;

	--divide
    clk_div_src <= clkout_o when (CLKOUTD_SRC = "CLKOUT") else clk_ps_reg0;
    
    process(clk_div_src,inner_reset)
    begin
        if (inner_reset = '1') then
            cnt_div <= 0;
	        clkout_div_reg <= '0';
        elsif(rising_edge(clk_div_src)) then
            cnt_div <= cnt_div + 1;
            if (cnt_div = (DYN_SDIV_SEL/2 - 1)) then
	            clkout_div_reg <= not clkout_div_reg;
			    cnt_div <= 0;
            end if;
        end if;
    end process;
    
    CLKOUTD <= CLKIN when (CLKOUTD_BYPASS = "true") else clkout_div_reg;

    -- div3
    div3_in <= clk_ps_reg when (CLKOUTD3_SRC = "CLKOUTP") else clk_out; 

    process (div3_in) 
    begin
        pre_div3_in <= div3_in;
    end process;

    process (div3_in, inner_reset) 
    begin
        if(div3_init = '1') then
            if((pre_div3_in = '1') and (div3_in = '0')) then
	            div3_reg <= '1';
                div3_init <= '0';
                cnt_div3 <= 0;
            end if;
        elsif(inner_reset = '1') then
            div3_reg <= '0';
            cnt_div3 <= 0;
        elsif(rising_edge(div3_in) or falling_edge(div3_in)) then
            cnt_div3 <= cnt_div3+1;
            if(cnt_div3 = 2) then
                div3_reg <= not div3_reg;
                cnt_div3 <= 0;
            end if;
        end if;
    end process;

    CLKOUTD3 <= div3_reg;

end Behavioral;


----------------------IBUF_R-------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IBUF_R is
    PORT (
    	O : OUT std_logic;
    	I : IN std_logic;
        RTEN : IN std_logic
        
    );
end IBUF_R;

architecture Behavioral of IBUF_R is
begin
    O <= TO_X01(I);
end Behavioral;

-----------------ELVDS_IBUF_R---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity ELVDS_IBUF_R is
    PORT(
        O : OUT std_logic;
        I : IN std_logic;
        IB : IN std_logic;
        RTEN : IN std_logic
    );
end ELVDS_IBUF_R;

architecture Behavioral of ELVDS_IBUF_R is
begin
    process(I,IB)
    begin
        if(I = '1' and IB = '0')then 
            O <= I;
        elsif(I = '0' and IB = '1')then 
            O <= I;
        elsif(I = 'X' or IB = 'X')then 
            O <= 'X';
        end if;
    end process;
end Behavioral;

----------------------------IOBUF_R--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IOBUF_R is
    PORT (
    	O  : OUT   std_logic;
    	IO : INOUT std_logic;
     	I  : IN    std_logic;
        RTEN  : IN    std_logic;
	    OEN : IN    std_logic
    );
end IOBUF_R;

architecture  Behavioral of IOBUF_R is
begin
    process(IO, I, OEN)
    begin
    	O <= TO_X01(IO);
	    if ((OEN = '1') or (OEN = 'H')) then
	        IO <= 'Z';
	    elsif ((OEN = '0') or (OEN = 'L')) then
	        IO <= TO_X01(I);
	    else
	        IO <= 'X';
	    end if;		
    end process;

end Behavioral;


-----------------ELVDS_IOBUF_R---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ELVDS_IOBUF_R is
    PORT (
    	O  : OUT std_logic;
    	IOB : INOUT std_logic;
        IO : INOUT std_logic;
     	I  : IN std_logic;
        RTEN : IN std_logic;
	    OEN : IN  std_logic
    );
end ELVDS_IOBUF_R;

architecture  Behavioral of ELVDS_IOBUF_R is
begin
    process(I, OEN)
    begin
	    if ((OEN = '1') or (OEN = 'H')) then
	        IO <= 'Z';
            IOB <= 'Z';
	    elsif ((OEN = '0') or (OEN = 'L')) then
	        IO <= TO_X01(I);
            IOB <= not TO_X01(I);
	    end if;		
    end process;

   process(IO,IOB)
   begin
        if(IO = '1' and IOB = '0')then 
            O <= IO;
        elsif(IO = '0' and IOB = '1')then 
            O <= IO;
        elsif(IO = 'X' or IOB = 'X')then 
            O <= 'X';
    end if;
   end process;

end Behavioral;

---------------------OSCW------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY OSCW IS
GENERIC (
    FREQ_DIV : integer := 80  --2~128,only even num
);
PORT (
    OSCOUT: OUT STD_LOGIC
);
END OSCW;
 
ARCHITECTURE BHV OF OSCW IS
SIGNAL oscr : STD_LOGIC := '0';

BEGIN
    
    PROCESS
    BEGIN
        wait for ((2.5 ns) * FREQ_DIV);
	    oscr <= not oscr;
          
    END PROCESS;

    OSCOUT <= oscr;

END BHV;

-----------------SAMB---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SAMB is
    PORT (
    	 SPIAD : IN std_logic_vector(23 downto 0);
    	 LOADN_SPIAD : IN std_logic
    );
end SAMB;

architecture Behavioral of SAMB is
begin

end Behavioral;


-----------------OTP---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OTP is
    PORT (
    	 DOUT : OUT std_logic;
    	 CSB : IN std_logic;
    	 SCLK : IN std_logic
    );
end OTP;

architecture Behavioral of OTP is
begin

end Behavioral;

------------------------------CLKDIVG---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.glb.GSRO;

entity CLKDIVG is
    GENERIC(
	     DIV_MODE : STRING := "2"; -- "2", "3.5", "4", "5"
	     GSREN : STRING := "false" -- "false", "true"
    );
    PORT(
         CLKIN : IN std_logic;
	     RESETN : IN std_logic;
	     CALIB : In std_logic;
	     CLKOUT : OUT std_logic
    );
end CLKDIVG;

architecture Behavioral of CLKDIVG is
signal reset_0 : std_logic;
signal calib_0,calib_1,calib_2,calib_en,calib_resetn : std_logic;
signal calib_state : std_logic := '0';
signal dsel_en,clk_div_0,cnt_reset,clk_div,cnt_enable :std_logic;
signal select2458 : std_logic := '1';
signal select3p5,select5 : std_logic := '0';
signal clk_div_1,clk_div2,d_sel,cnt_0,cnt_1,cnt_2,clk_div8 : std_logic := '0';
signal grstn :std_logic;

begin
    
    grstn <= GSRO when (GSREN = "true") else '1';

    select2458 <= '0' when (DIV_MODE = "3.5") else '1';
    select3p5 <= '1' when (DIV_MODE = "3.5") else '0';
    select5 <= '1' when (DIV_MODE = "5") else '0';

    process(CLKIN, grstn, RESETN)
    begin
        if (grstn = '0') then
            reset_0 <= '0';
        elsif (RESETN = '0') then
            reset_0 <= '0';
        elsif (CLKIN'event and CLKIN = '1') then
            reset_0 <= '1';
        end if;
    end process;
	
    process(CLKIN, reset_0)
    begin
        if (reset_0 = '0') then
            calib_0 <= '0';
        elsif (CLKIN'event and CLKIN = '1') then
            calib_0 <= (not CALIB);
        end if;
    end process;

    process(CLKIN, reset_0)
    begin
        if (reset_0 = '0') then
            calib_1 <= '0';
        elsif (CLKIN'event and CLKIN = '1') then
            calib_1 <= calib_0;
        end if;
    end process;

    process(CLKIN, reset_0)
    begin
        if (reset_0 = '0') then
            calib_2 <= '0';
        elsif (CLKIN'event and CLKIN = '1') then
            calib_2 <= calib_1;
        end if;
    end process;

    calib_resetn <=  not (calib_1 and (not calib_2));
    calib_en <= not (calib_resetn or (not select2458));

    process(CLKIN, reset_0)
    begin
        if (reset_0 = '0') then
            calib_state <= '0';
        elsif (CLKIN'event and CLKIN = '1') then
            if (calib_en = '1') then
                calib_state <= not calib_state;
            else
                calib_state <= calib_state;
            end if;
        end if;
    end process;

    cnt_enable <= (not((not calib_resetn)and calib_state) and select2458) or (calib_resetn and select3p5);

    dsel_en <= (d_sel and cnt_0 and cnt_1 and select3p5) or (calib_resetn and (not d_sel) and (not cnt_0) and cnt_1 and select3p5);

    process(CLKIN, reset_0) 
    begin
        if (reset_0 = '0') then
            d_sel  <= '0';
        elsif (CLKIN'event and CLKIN = '1') then
            if(dsel_en = '1') then
                d_sel  <= not d_sel;
            elsif(dsel_en = '0') then
                d_sel <= d_sel;
            end if;
        end if;
    end process;

    cnt_reset <= (select5 and (not cnt_0) and (not cnt_1) and cnt_2 ) or (select3p5 and (not d_sel) and (not cnt_0) and cnt_1);

    process(CLKIN, reset_0) 
    begin
        if (reset_0 = '0') then
            cnt_0  <= '1';
        elsif (CLKIN'event and CLKIN = '1') then
            if(cnt_enable = '1') then
                cnt_0  <= not(cnt_0 or cnt_reset);
            elsif(cnt_enable = '0') then
                cnt_0 <= cnt_0;
            end if;
        end if;
    end process;

    process(CLKIN, reset_0) 
    begin
        if (reset_0 = '0') then
            cnt_1  <= '1';
        elsif (CLKIN'event and CLKIN = '1') then
            if(cnt_enable = '1') then
                cnt_1  <= not(cnt_reset or (cnt_0 xnor cnt_1));
            elsif(cnt_enable = '0') then
                cnt_1 <= cnt_1;
            end if;
        end if;
    end process;

    process(CLKIN, reset_0) 
    begin
        if (reset_0 = '0') then
            cnt_2  <= '0';
        elsif (CLKIN'event and CLKIN = '1') then
            if(cnt_enable = '1') then
                cnt_2  <= not(cnt_reset or (cnt_2 xnor (cnt_0 and cnt_1)));
            elsif(cnt_enable = '0') then
                cnt_2 <= cnt_2;
            end if;
        end if;
    end process;

    clk_div_0 <= not cnt_1;
    process(CLKIN, reset_0) 
    begin
        if(reset_0 = '0') then
            clk_div_1 <= '0';
        elsif (CLKIN'event and CLKIN = '0') then
            clk_div_1 <= clk_div_0;
        end if;
    end process;

    clk_div <= clk_div_1 when (d_sel = '1') else clk_div_0;
    clk_div2 <= not cnt_0;
    clk_div8 <= cnt_2;

    CLKOUT <= clk_div2 when (DIV_MODE = "2") else clk_div8 when (DIV_MODE = "8") else clk_div;

end Behavioral;


------------------------------PLLO---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all; 

entity PLLO is
    GENERIC(
        FCLKIN : STRING := "100.0"; --frequency of the clkin(M)
        DYN_IDIV_SEL : STRING := "FALSE"; --TRUE:IDSEL; FALSE:IDIV_SEL
        IDIV_SEL : integer := 0; --Input divider IDIV, 0:1,1:2...63:64.  1~64
        DYN_FBDIV_SEL : STRING := "FALSE";
        FBDIV_SEL : integer := 0; --Feedback divider FBDIV,  0:1,1:2...63:64. 1~64
        
        DYN_ODIVA_SEL : STRING := "FALSE"; --TRUE:ODSELA, FALSE:ODIVA_SEL
        ODIVA_SEL : integer := 6; --1~128,integer
        DYN_ODIVB_SEL : STRING := "FALSE"; --TRUE:ODSELB, FALSE:ODIVB_SEL
        ODIVB_SEL : integer := 6; --1~128,integer
        DYN_ODIVC_SEL : STRING := "FALSE"; --TRUE:ODSELC, FALSE:ODIVC_SEL
        ODIVC_SEL : integer := 6; --1~128,integer
        DYN_ODIVD_SEL : STRING := "FALSE"; --TRUE:ODSELD, FALSE:ODIVD_SEL
        ODIVD_SEL : integer := 6; --1~128,integer
      
        CLKOUTA_EN : STRING := "TRUE"; --"TRUE","FALSE"
        CLKOUTB_EN : STRING := "TRUE"; --"TRUE","FALSE"
        CLKOUTC_EN : STRING := "TRUE"; --"TRUE","FALSE"
        CLKOUTD_EN : STRING := "TRUE"; --"TRUE","FALSE"
        
        DYN_DTA_SEL : STRING := "FALSE"; --TRUE:DTA; FALSE:CLKOUTA_DT_DIR & CLKOUTA_DT_STEP
        DYN_DTB_SEL : STRING := "FALSE"; --TRUE:DTB; FALSE:CLKOUTB_DT_DIR & CLKOUTB_DT_STEP
        CLKOUTA_DT_DIR : bit := '1'; -- CLKOUTA dutycycle adjust direction. '1': + ; '0': -
        CLKOUTB_DT_DIR : bit := '1'; -- CLKOUTB dutycycle adjust direction. '1': + ; '0': -
        CLKOUTA_DT_STEP : integer := 0; -- 0,1,2,4; 50ps/step
        CLKOUTB_DT_STEP : integer := 0; -- 0,1,2,4; 50ps/step

        CLKA_IN_SEL  : bit_vector := "00"; --DIVA input source select. 0x:from VCO;11:from CLKIN
        CLKA_OUT_SEL : bit := '0'; --CLKOUTA output select. 0:DIVA output; 1:CLKIN
        CLKB_IN_SEL  : bit_vector := "00"; --DIVB input source select. 0x:from VCO;10:from CLKCAS_A;11:from CLKIN
        CLKB_OUT_SEL : bit := '0'; --CLKOUTB output select. 0:DIVB output; 1:CLKIN
        CLKC_IN_SEL  : bit_vector := "00"; --DIVC input source select. 0x:from VCO;10:from CLKCAS_B;11:from CLKIN
        CLKC_OUT_SEL : bit := '0'; --CLKOUTC output select. 0:DIVC output; 1:CLKIN
        CLKD_IN_SEL  : bit_vector := "00"; --DIVD input source select. 0x:from VCO;10:from CLKCAS_C;11:from CLKIN
        CLKD_OUT_SEL : bit := '0'; --CLKOUTD output select. 0:DIVD output; 1:CLKIN

        CLKFB_SEL : STRING := "INTERNAL"; -- "INTERNAL", "EXTERNAL";

        DYN_DPA_EN : STRING := "FALSE"; --dynamic phaseshift adjustment Enable."TRUE","FALSE"

        DYN_PSB_SEL : STRING := "FALSE"; --"TRUE": select dynamic dpa signal for phase shift B(DYN_DPA_EN="TRUE"); "FALSE":select PSB_COARSE & PSB_FINE as the static control signal for phase shift B
        DYN_PSC_SEL : STRING := "FALSE"; --"TRUE": select dynamic dpa signal for phase shift C(DYN_DPA_EN="TRUE"); "FALSE":select PSC_COARSE & PSC_FINE as the static control signal for phase shift C
        DYN_PSD_SEL : STRING := "FALSE"; --"TRUE": select dynamic dpa signal for phase shift D(DYN_DPA_EN="TRUE"); "FALSE":select PSD_COARSE & PSD_FINE as the static control signal for phase shift D

        PSB_COARSE : integer := 1; --1~128       
        PSB_FINE : integer := 0; --0~7
        PSC_COARSE : integer := 1; --1~128        
        PSC_FINE : integer := 0; --0~7
        PSD_COARSE : integer := 1; --1~128        
        PSD_FINE : integer := 0; --0~7

        DTMS_ENB : STRING := "FALSE"; --"FALSE":fixed 50% duty cycle for case odivb=2~128; "TRUE":set PSB_COARSE & PSB_FINE as duty edge when DYN_DPA_EN="TRUE" for case odivb=2~128
        DTMS_ENC : STRING := "FALSE"; --"FALSE":fixed 50% duty cycle for case odivc=2~128; "TRUE":set PSC_COARSE & PSC_FINE as duty edge when DYN_DPA_EN="TRUE" for case odivc=2~128
        DTMS_END : STRING := "FALSE"; --"FALSE":fixed 50% duty cycle for case odivd=2~128; "TRUE":set PSD_COARSE & PSD_FINE as duty edge when DYN_DPA_EN="TRUE" for case odivd=2~128

        RESET_I_EN : STRING := "FALSE"; --"TRUE","FALSE". Enable RESET_I through the dedicated signal from ciu.
        RESET_S_EN : STRING := "FALSE"; --"TRUE","FALSE". Enable RESET_S through the dedicated signal from ciu.

        DYN_ICP_SEL : STRING := "FALSE"; --TRUE:ICPSEL; FALSE:ICP_SEL
        ICP_SEL : std_logic_vector(4 downto 0) := "XXXXX";
        DYN_RES_SEL : STRING := "FALSE"; --TRUE:LPFRES; FALSE:LPR_REF
        LPR_REF : std_logic_vector(6 downto 0) := "XXXXXXX"
	);
    PORT(
        CLKIN : IN std_logic;
        CLKFB : IN std_logic:='0';
        RESET,RESET_P : IN std_logic:='0';
        RESET_I,RESET_S : IN std_logic:='0';
        IDSEL,FBDSEL : IN std_logic_vector(5 downto 0);
        ODSELA, ODSELB, ODSELC, ODSELD : IN std_logic_vector(6 downto 0);
        DTA, DTB : IN std_logic_vector(3 downto 0);
        ICPSEL : IN std_logic_vector(4 downto 0);
        LPFRES : IN std_logic_vector(2 downto 0);
        PSSEL : IN std_logic_vector(1 downto 0);
        PSDIR,PSPULSE : IN std_logic;
        ENCLKA,ENCLKB,ENCLKC,ENCLKD : IN std_logic;
        LOCK : OUT std_logic;
        CLKOUTA : OUT std_logic;
        CLKOUTB : OUT std_logic;
        CLKOUTC : OUT std_logic;
        CLKOUTD : OUT std_logic
    );
end PLLO;

architecture Behavioral of PLLO is
 
signal IDIV_dyn,FBDIV_dyn : integer;
signal ODIVA_dyn,ODIVB_dyn,ODIVC_dyn,ODIVD_dyn : integer;
signal IDIV_SEL_reg,FBDIV_SEL_reg : integer := 1;
signal ODIVA_SEL_reg,ODIVB_SEL_reg,ODIVC_SEL_reg,ODIVD_SEL_reg : integer;
signal IDIV_dyn_reg,FBDIV_dyn_reg : integer;
signal ODIVA_dyn_reg,ODIVB_dyn_reg,ODIVC_dyn_reg,ODIVD_dyn_reg : integer;
signal div_dyn_change : std_logic;
type  clkin_arr  is array (4 downto 0) of time;
signal clkin_cycle : clkin_arr := (0.0000 ns, 0.0000 ns, 0.0000 ns, 0.0000 ns,0.0000 ns);
signal clkin_period,clkin_period1,vco_period,clkouta_period,clkoutb_period,clkoutc_period,clkoutd_period :  time := 2.0000 ns;
signal clk_effect,oclk_effect : std_logic := '0';
signal clkouta_half,clkoutb_half,clkoutc_half,clkoutd_half : time := 0.0000 ns;
signal clkoutb_half_odd,clkoutc_half_odd,clkoutd_half_odd : time := 0.0000 ns;
signal clkfb_curtime,clkin_curtime,FB_dly,FB_dly0 : time := 0.0000 ns;
signal clka_reg,clkb_reg,clkc_reg,clkd_reg,clka,clkb,clkc,clkd : std_logic := '0';
signal clkout_a,clkouta_ps,clka_out,clkout_b,clkoutb_ps,clkb_out,clkout_c,clkoutc_ps,clkc_out,clkout_d,clkoutd_ps,clkd_out : std_logic := '0';
signal lock_reg : std_logic := '0';

signal real_phasea,real_dutya,real_phaseb,real_dutyb,real_phasec,real_dutyc,real_phased,real_dutyd : real;
signal phase_valuea,clkouta_duty,clkoutb_duty,tclka_duty,tclkb_duty : time := 0.0000 ns;
signal clkoutb_duty_odd,clkoutc_duty_odd,clkoutd_duty_odd : time := 0.0000 ns;
signal phase_valueb,phase_valuec,phase_valued,clkoutc_duty,clkoutd_duty : time := 0.0000 ns;

signal fine_dyn_b,fine_dyn_c,fine_dyn_d : std_logic_vector(2 downto 0) := "000";
signal coarse_dyn_b,coarse_dyn_c,coarse_dyn_d : integer := 1;
signal ps_pulse_pre : std_logic;
signal clka_dt_dir,clkb_dt_dir : std_logic;
signal clka_dt_step,clkb_dt_step : integer := 0;
signal fine_a,fine_b,fine_c,fine_d : integer;
signal coarse_b,coarse_c,coarse_d : integer;
signal unit_duty,unit_phase,unit_div,real_fbdiv : real := 1.0;
signal real_odiva,real_odivb,real_odivc,real_odivd : real := 1.0;

signal max_tlock : time := 50000 ns;
signal cnt_lock : integer := 0;
signal multi_clkin : integer;
signal clkfb_reg,clk0_reg,clk1_reg,clk2_reg,clk3_reg,clk4_reg,clk5_reg : std_logic := '0';
signal clkin_init,fb_clk_init : std_logic := '1';
signal pssel_a_flag,pssel_b_flag,pssel_c_flag,pssel_d_flag : std_logic := '0';
signal inner_reset:std_logic:='0';
signal clka_dt_delay,clkb_dt_delay : time := 0.0000 ns;
signal clkout_dt_a,clkout_dt_b : std_logic := '0';
signal rst : std_logic := '0';
signal enclk_a,enclk_b,enclk_c,enclk_d : std_logic;
signal ckena,ckenb,ckenc,ckend : std_logic := '0';
signal reseti, resets : std_logic := '0';
signal h_level_a,h_level_b,h_level_c,h_level_d : integer := 0;
signal real_h_level_c,real_h_level_d : real := 0.00000;

begin

    reseti <= RESET_I when (RESET_I_EN = "TRUE") else '0';
    resets <= RESET_S when (RESET_S_EN = "TRUE") else '0';

    inner_reset <= RESET or RESET_P or reseti;

    process(CLKIN, inner_reset)
    variable clkin_edge_pre :time := 0 ns;
    variable clkin_edge_cur :time := 0 ns;

    begin
        if(inner_reset = '1')then
            clk_effect <= '0';
            clkin_cycle(0) <= 0.0 ns;
        elsif(CLKIN'event and CLKIN = '1')then
            clkin_edge_cur := NOW;
            clkin_cycle(4) <= clkin_cycle(3);
	        clkin_cycle(3) <= clkin_cycle(2);
	        clkin_cycle(2) <= clkin_cycle(1);
            clkin_cycle(1) <= clkin_cycle(0);

            if(clkin_edge_pre /= 0 ns)then
                clkin_cycle(0) <= clkin_edge_cur - clkin_edge_pre;
            end if;

            clkin_edge_pre := clkin_edge_cur;

            if(clkin_edge_pre /= 0 ns) then
                if((clkin_cycle(0) = clkin_period) and (div_dyn_change = '0')) then
                    clk_effect <= '1';

                else
                    clk_effect <= '0';
                end if;
            end if;
        end if;
    end process;

    process(clkin_cycle(0),clkin_cycle(1),clkin_cycle(2),clkin_cycle(3),clkin_cycle(4),clkin_period) 
    variable clkin_period_tmp : time := 0.0 ns;
    begin
        clkin_period_tmp := clkin_cycle(0);
        if(clkin_period_tmp /= clkin_period) then
		    clkin_period1 <= (clkin_cycle(0) + clkin_cycle(1) + clkin_cycle(2) + clkin_cycle(3) + clkin_cycle(4))/5.0;
            clkin_period <= clkin_period1;
        end if;
    end process;

    IDIV_dyn <= 64 - conv_integer(IDSEL);
    FBDIV_dyn <= 64 - conv_integer(FBDSEL);

    ODIVA_dyn <= 128 - conv_integer(ODSELA);
    ODIVB_dyn <= 128 - conv_integer(ODSELB);
    ODIVC_dyn <= 128 - conv_integer(ODSELC);
    ODIVD_dyn <= 128 - conv_integer(ODSELD);


    IDIV_SEL_reg <= IDIV_dyn when (DYN_IDIV_SEL = "TRUE") else (IDIV_SEL+1);
    FBDIV_SEL_reg <= FBDIV_dyn when (DYN_FBDIV_SEL = "TRUE") else (FBDIV_SEL+1);
    ODIVA_SEL_reg <= ODIVA_dyn when (DYN_ODIVA_SEL = "TRUE") else ODIVA_SEL;
    ODIVB_SEL_reg <= ODIVB_dyn when (DYN_ODIVB_SEL = "TRUE") else ODIVB_SEL;
    ODIVC_SEL_reg <= ODIVC_dyn when (DYN_ODIVC_SEL = "TRUE") else ODIVC_SEL;
    ODIVD_SEL_reg <= ODIVD_dyn when (DYN_ODIVD_SEL = "TRUE") else ODIVD_SEL;

    process(CLKIN) 
    begin
        if(rising_edge(CLKIN)) then
            IDIV_dyn_reg <= IDIV_dyn;
            FBDIV_dyn_reg <= FBDIV_dyn;
            ODIVA_dyn_reg <= ODIVA_dyn;
            ODIVB_dyn_reg <= ODIVB_dyn;
            ODIVC_dyn_reg <= ODIVC_dyn;
            ODIVD_dyn_reg <= ODIVD_dyn;
        end if;
    end process;

    process(IDIV_dyn_reg,IDIV_dyn,FBDIV_dyn_reg,FBDIV_dyn,ODIVA_dyn_reg,ODIVA_dyn,ODIVB_dyn_reg,ODIVB_dyn,ODIVC_dyn_reg,ODIVC_dyn,ODIVD_dyn_reg,ODIVD_dyn)
    begin
        if((IDIV_dyn_reg /= IDIV_dyn) or (FBDIV_dyn_reg /= FBDIV_dyn) or (ODIVA_dyn_reg /= ODIVA_dyn) or (ODIVB_dyn_reg /= ODIVB_dyn) or (ODIVC_dyn_reg /= ODIVC_dyn) or (ODIVD_dyn_reg /= ODIVD_dyn)) then
            div_dyn_change <= '1';
        else
            div_dyn_change <= '0';
        end if;
    end process;


    process(clkin_period, IDIV_SEL_reg, FBDIV_SEL_reg, ODIVA_SEL_reg)
    begin
        real_fbdiv <= (real(FBDIV_SEL_reg));
        vco_period <= ((clkin_period * IDIV_SEL_reg) / real_fbdiv) / ODIVA_SEL_reg;
    end process;

    process(vco_period, ODIVA_SEL_reg,clkoutd_period,clkin_period)
    begin
        real_odiva <= real(ODIVA_SEL_reg);
        if (CLKA_IN_SEL = "00" or CLKA_IN_SEL = "01") then
            clkouta_period <= (vco_period * real_odiva);
        --elsif (CLKA_IN_SEL = "10") then
        --    clkouta_period <= (clkoutd_period * real_odiva);
        elsif (CLKA_IN_SEL = "11") then
            clkouta_period <= (clkin_period * real_odiva);
        end if;
    end process;

    process(vco_period, ODIVB_SEL_reg,clkouta_period,clkin_period)
    begin
        real_odivb <= real(ODIVB_SEL_reg);
        if (CLKB_IN_SEL = "00" or CLKB_IN_SEL = "01") then
            clkoutb_period <= (vco_period * real_odivb);
        elsif (CLKB_IN_SEL = "10") then
            clkoutb_period <= (clkouta_period * real_odivb);
        elsif (CLKB_IN_SEL = "11") then
            clkoutb_period <= (clkin_period * real_odivb);
        end if;
    end process;

    process(vco_period, ODIVC_SEL_reg,clkoutb_period,clkin_period)
    begin
        real_odivc <= real(ODIVC_SEL_reg);
        if (CLKC_IN_SEL = "00" or CLKC_IN_SEL = "01") then
            clkoutc_period <= (vco_period * real_odivc);
        elsif (CLKC_IN_SEL = "10") then
            clkoutc_period <= (clkoutb_period * real_odivc);
        elsif (CLKC_IN_SEL = "11") then
            clkoutc_period <= (clkin_period * real_odivc);
        end if;
    end process;

    process(vco_period, ODIVD_SEL_reg,clkoutc_period,clkin_period)
    begin
        real_odivd <= real(ODIVD_SEL_reg);
        if (CLKD_IN_SEL = "00" or CLKD_IN_SEL = "01") then
            clkoutd_period <= (vco_period * real_odivd);
        elsif (CLKD_IN_SEL = "10") then
            clkoutd_period <= (clkoutc_period * real_odivd);
        elsif (CLKD_IN_SEL = "11") then
            clkoutd_period <= (clkin_period * real_odivd);
        end if;
    end process;
    
    clkouta_half <= (clkouta_period / 2.0);
    clkoutb_half <= (clkoutb_period / 2.0);
    clkoutc_half <= (clkoutc_period / 2.0);
    clkoutd_half <= (clkoutd_period / 2.0);

    -- lock time
    process(CLKIN, inner_reset) 
    begin
        if (inner_reset = '1') then
            max_tlock <= 0.0 us;
        elsif(rising_edge(CLKIN)) then
            if((clkin_cycle(0) >= 2 ns) and (clkin_cycle(0) <= 40 ns)) then
                max_tlock <= 50000.0 ns;
            elsif ((clkin_cycle(0) > 40 ns) and (clkin_cycle(0) <= 500 ns)) then
                max_tlock <= 200000.0 ns;              
            end if;
        end if;
    end process;

    process(CLKIN, inner_reset)    
    begin
        if (inner_reset = '1') then
            lock_reg <= '0';
            oclk_effect <= '0';
        elsif(rising_edge(CLKIN)) then
            if(clk_effect = '1') then
                cnt_lock <= cnt_lock + 1;

                if(cnt_lock > (max_tlock/clkin_period - 10)) then
                    oclk_effect <= '1';
                else
                    oclk_effect <= '0';
                end if;

                if(cnt_lock > (max_tlock/clkin_period)) then
                    lock_reg <= '1';
                else
                    lock_reg <= '0';
                end if;

            else
                oclk_effect <= '0';
                cnt_lock <= 0;
                lock_reg <= '0';           
            end if;
        end if;
    end process;

    LOCK <= '0' when (CLKA_IN_SEL = "11") else lock_reg;
    
    -- calculate CLKFB feedback delay
    process(CLKIN) 
    begin
        if (rising_edge(CLKIN)) then
            if (clkin_init = '1') then
                clkin_curtime <= NOW;
                clkin_init <= '0';
            end if;
        end if;
    end process;

    process(CLKFB) 
    begin
        if (rising_edge(CLKFB)) then
            if (fb_clk_init = '1') then
                clkfb_curtime <= NOW;
                fb_clk_init <= '0';
            end if;
        end if;
    end process;

    process(CLKFB, CLKIN)
    begin
        if ((clkfb_curtime > 0 ns) and (clkin_curtime > 0 ns)) then
            FB_dly0 <= clkfb_curtime - clkin_curtime;
            if ((FB_dly0 >= 0 ns) and (clkin_cycle(0) > 0 ns)) then
                --multi_clkin <= FB_dly0 / (clkin_cycle(0));
                --FB_dly <= clkin_cycle(0) - (FB_dly0 - (clkin_cycle(0)) * multi_clkin);
                FB_dly <= clkin_cycle(0) - (FB_dly0 - (clkin_cycle(0)) * (FB_dly0 / (clkin_cycle(0))));
            end if;
        end if;
    end process;

    process
    variable clka_flag : std_logic := '1';
    begin
        if(oclk_effect = '0') then
            clka_reg <= '0';
        else
            if(clka_flag = '1') then
                clka_reg <= '1';
                clka_flag := '0';
            else
                wait for (clkouta_half); 
                clka_reg <= not clka_reg ;
            end if;
        end if;
        wait on oclk_effect,clka_reg;
    end process;

    process
    variable clkb_flag : std_logic := '1';
    begin
        if(oclk_effect = '0') then
            clkb_reg <= '0';
        else
            if(clkb_flag = '1') then
                clkb_reg <= '1';
                clkb_flag := '0';
            else
                wait for (clkoutb_half); 
                clkb_reg <= not clkb_reg ;
            end if;
        end if;
        wait on oclk_effect,clkb_reg;
    end process;

    process
    variable clkc_flag : std_logic := '1';
    begin
        if(oclk_effect = '0') then
            clkc_reg <= '0';
        else
            if(clkc_flag = '1') then
                clkc_reg <= '1';
                clkc_flag := '0';
            else
                wait for (clkoutc_half);
                clkc_reg <= not clkc_reg ;
            end if;
        end if;
        wait on oclk_effect,clkc_reg;
    end process;

    process
    variable clkd_flag : std_logic := '1';
    begin
        if(oclk_effect = '0') then
            clkd_reg <= '0';
        else
            if(clkd_flag = '1') then
                clkd_reg <= '1';
                clkd_flag := '0';
            else
                wait for (clkoutd_half); 
                clkd_reg <= not clkd_reg ;
            end if;
        end if;
        wait on oclk_effect,clkd_reg;
    end process;


    process (clka_reg, clkb_reg, clkc_reg, clkd_reg, FB_dly)
    begin
        if (CLKFB_SEL = "INTERNAL") then
            clka <= clka_reg;
            clkb <= clkb_reg;
            clkc <= clkc_reg;
            clkd <= clkd_reg;
        else
            clka <= transport clka_reg after (FB_dly);
            clkb <= transport clkb_reg after (FB_dly);
            clkc <= transport clkc_reg after (FB_dly);
            clkd <= transport clkd_reg after (FB_dly);
        end if;
    end process;

    --dynamic phase shift
    process (PSPULSE)
    begin
        ps_pulse_pre <= PSPULSE;
    end process;

    process
    begin
        if(PSSEL = "01") then
            pssel_b_flag <= '1';
            pssel_c_flag <= '0';
            pssel_d_flag <= '0';
            wait for 1 ns;
            pssel_b_flag <= '0';
        elsif(PSSEL = "10") then
            pssel_b_flag <= '0';
            pssel_c_flag <= '1';
            pssel_d_flag <= '0';
            wait for 1 ns;
            pssel_c_flag <= '0';
        elsif(PSSEL = "11") then
            pssel_b_flag <= '0';
            pssel_c_flag <= '0';
            pssel_d_flag <= '1';
            wait for 1 ns;
            pssel_d_flag <= '0';
        end if;
        wait on PSSEL;
    end process;


    process(PSSEL,PSPULSE,PSDIR,ODIVA_SEL_reg,ODIVB_SEL_reg,fine_dyn_b,coarse_dyn_b,ODIVC_SEL_reg,fine_dyn_c,coarse_dyn_c,ODIVD_SEL_reg,fine_dyn_d,coarse_dyn_d,pssel_b_flag,pssel_c_flag,pssel_d_flag)
    begin
    if (inner_reset = '1') then
        fine_dyn_b <= (others=>'0');
        fine_dyn_c<= (others=>'0');
        fine_dyn_d <= (others=>'0');
        coarse_dyn_b <= 1;
        coarse_dyn_c <= 1;
        coarse_dyn_d <= 1;
    else
        if (PSSEL = "01") then
            if(pssel_b_flag = '1') then
                fine_dyn_b <= (others=>'0');
                coarse_dyn_b <= 1;
            else
            if (PSPULSE = '0' and ps_pulse_pre = '1') then
                if (PSDIR = '0') then
                    if(ODIVB_SEL_reg = 1) then
                        coarse_dyn_b <= 1;
                    else
                        if(fine_dyn_b = "111") then
                            coarse_dyn_b <= coarse_dyn_b + 1;
                            if (coarse_dyn_b = ODIVB_SEL_reg) then
                                coarse_dyn_b <= 1;
                            end if;
                        end if;
                    end if;
                    fine_dyn_b <= fine_dyn_b + 1;

                else
                    if(ODIVB_SEL_reg = 1) then
                        coarse_dyn_b <= 1;
                    else
                        if(fine_dyn_b = "000") then
                            coarse_dyn_b <= coarse_dyn_b - 1;
                            if (coarse_dyn_b = 1) then
                                coarse_dyn_b <= ODIVB_SEL_reg;
                            end if;
                        end if;
                    end if;
                    fine_dyn_b <= fine_dyn_b - 1;

                end if;
            end if;
            end if;
        elsif (PSSEL = "10") then
            if(pssel_c_flag = '1') then
                fine_dyn_c <= (others=>'0');
                coarse_dyn_c <= 1;
            else
            if (PSPULSE = '0' and ps_pulse_pre = '1') then
                if (PSDIR = '0') then
                    if(ODIVC_SEL_reg = 1) then
                        coarse_dyn_c <= 1;
                    else
                        if(fine_dyn_c = "111") then
                            coarse_dyn_c <= coarse_dyn_c + 1;
                            if (coarse_dyn_c = ODIVC_SEL_reg) then
                                coarse_dyn_c <= 1;
                            end if;
                        end if;
                    end if;
                    fine_dyn_c <= fine_dyn_c + 1;

                else
                    if(ODIVC_SEL_reg = 1) then
                        coarse_dyn_c <= 1;
                    else
                        if(fine_dyn_c = "000") then
                            coarse_dyn_c <= coarse_dyn_c - 1;
                            if (coarse_dyn_c = 1) then
                                coarse_dyn_c <= ODIVC_SEL_reg;
                            end if;
                        end if;
                    end if;
                    fine_dyn_c <= fine_dyn_c - 1;
                end if;
            end if;
            end if;
        elsif (PSSEL = "11") then
            if(pssel_d_flag = '1') then
                fine_dyn_d <= (others=>'0');
                coarse_dyn_d <= 1;
            else
            if (PSPULSE = '0' and ps_pulse_pre = '1') then
                if (PSDIR = '0') then
                    if(ODIVD_SEL_reg = 1) then
                        coarse_dyn_d <= 1;
                    else
                        if(fine_dyn_d = "111") then
                            coarse_dyn_d <= coarse_dyn_d + 1;
                            if (coarse_dyn_d = ODIVD_SEL_reg) then
                                coarse_dyn_d <= 1;
                            end if;
                        end if;
                    end if;
                    fine_dyn_d <= fine_dyn_d + 1;

                else
                    if(ODIVD_SEL_reg = 1) then
                        coarse_dyn_d <= 1;
                    else
                        if(fine_dyn_d = "000") then
                            coarse_dyn_d <= coarse_dyn_d - 1;
                            if (coarse_dyn_d = 1) then
                                coarse_dyn_d <= ODIVD_SEL_reg;
                            end if;
                        end if;
                    end if;
                    fine_dyn_d <= fine_dyn_d - 1;
                end if;
            end if;
        end if;
        end if;
    end if;
    end process;


    ----clkouta
    --duty_cycle
    h_level_a <= ODIVA_SEL_reg / 2;
    process(h_level_a, clkouta_period, ODIVA_SEL_reg)
    begin
        if(CLKA_IN_SEL = "11") then
            clkouta_duty <= (clkouta_period * h_level_a / ODIVA_SEL_reg);
        else 
            clkouta_duty <= clkouta_half;
        end if;

    end process;
    
    clka_dt_dir <= TO_STDULOGIC(CLKOUTA_DT_DIR) when (DYN_DTA_SEL = "FALSE") else DTA(3);
    clkb_dt_dir <= TO_STDULOGIC(CLKOUTB_DT_DIR) when (DYN_DTB_SEL = "FALSE") else DTB(3);
    clka_dt_step <= CLKOUTA_DT_STEP when (DYN_DTA_SEL = "FALSE") else (7 - conv_integer(DTA(2 downto 0)));
    clkb_dt_step <= CLKOUTB_DT_STEP when (DYN_DTB_SEL = "FALSE") else (7 - conv_integer(DTB(2 downto 0)));
   
    clka_dt_delay <= (0.05 ns * clka_dt_step);
    clkb_dt_delay <= (0.05 ns * clkb_dt_step);

    process(clkouta_duty, clkoutb_duty, clka_dt_dir, clkb_dt_dir, clka_dt_delay, clkb_dt_delay) 
    begin
        if (clka_dt_dir = '1') then
            tclka_duty <= clkouta_duty + clka_dt_delay;
        else 
            tclka_duty <= clkouta_duty - clka_dt_delay;
        end if;

        if (clkb_dt_dir = '1') then
            tclkb_duty <= clkoutb_duty + clkb_dt_delay;
	    else 
            tclkb_duty <= clkoutb_duty - clkb_dt_delay;
        end if;
    end process;
 
    process 
    begin
        if (rising_edge(clka)) then
            clkout_a <= '1';
            wait for tclka_duty;
            clkout_a <= '0';
        end if;
        wait on clka;
    end process;

    process(clkout_a,clka_dt_dir)
    begin
        if(clka_dt_dir = '1') then
            clkout_dt_a <= clkout_a;
        else
            clkout_dt_a <= transport clkout_a after(clka_dt_delay);
        end if;
    end process;

    process(clkout_dt_a)
    begin
        clkouta_ps <= clkout_dt_a;
    end process;
      
    process (CLKIN, oclk_effect, clkouta_ps, inner_reset)
    begin
        if (inner_reset = '1') then
            clka_out  <= '0';
        elsif(CLKA_OUT_SEL = '1') then
            clka_out <= CLKIN;
        --elsif (oclk_effect = '1') then
        else 
            clka_out <= clkouta_ps;
        end if;
    end process;

    CLKOUTA <= clka_out when (ckena = '1') else '0';

    --enclk
    enclk_a <= '1' when ((CLKOUTA_EN = "TRUE") and (ENCLKA = '1')) else '0';
    enclk_b <= '1' when ((CLKOUTB_EN = "TRUE") and (ENCLKB = '1')) else '0';
    enclk_c <= '1' when ((CLKOUTC_EN = "TRUE") and (ENCLKC = '1')) else '0';
    enclk_d <= '1' when ((CLKOUTD_EN = "TRUE") and (ENCLKD = '1')) else '0';

    rst <= RESET or RESET_P or reseti or resets;

    process(clka_out, inner_reset)
    begin
        if(inner_reset = '1') then
            ckena <= '0';
        elsif(falling_edge(clka_out)) then
            ckena <= enclk_a;
        end if;
    end process;

    process(clkb_out, rst)
    begin
        if(rst = '1') then
            ckenb <= '0';
        elsif(falling_edge(clkb_out)) then
            ckenb <= enclk_b;
        end if;
    end process;

    process(clkc_out, rst)
    begin
        if(rst = '1') then
            ckenc <= '0';
        elsif(falling_edge(clkc_out)) then
            ckenc <= enclk_c;
        end if;
    end process;

    process(clkd_out, rst)
    begin
        if(rst = '1') then
            ckend <= '0';
        elsif(falling_edge(clkd_out)) then
            ckend <= enclk_d;
        end if;
    end process;

    --clkoutb
    --phase_shift_value
    process(fine_dyn_b, coarse_dyn_b)
    begin
        if(DYN_PSB_SEL = "TRUE" and DYN_DPA_EN = "TRUE") then
            fine_b <= conv_integer(fine_dyn_b);
            coarse_b <= coarse_dyn_b;

        elsif(DYN_PSB_SEL = "FALSE") then
            fine_b <= PSB_FINE;
            coarse_b <= PSB_COARSE;            
        end if;
    end process;

    process(coarse_b, fine_b, ODIVB_SEL_reg, clkoutb_period,real_phaseb) 
    begin 
        if(coarse_b = ODIVB_SEL_reg) then
            real_phaseb <= (real(fine_b)/8.0);
        else 
            real_phaseb <= (real(coarse_b) + (real(fine_b)/8.0));
        end if;
        phase_valueb <= clkoutb_period * (real_phaseb/real_odivb);
    end process;

    --duty_cycle
    process(ODIVB_SEL_reg,clkoutb_period,h_level_b)
    begin
        h_level_b <= ODIVB_SEL_reg / 2;
        clkoutb_duty_odd <= (clkoutb_period * h_level_b / ODIVB_SEL_reg);
    end process;

    process(clkoutb_half, real_dutyb, real_phaseb, ODIVB_SEL_reg, clkoutb_period, clkoutb_duty_odd) 
    begin
        if(PSB_COARSE = ODIVB_SEL) then
            real_dutyb <= (real(PSB_FINE) / 8.0);
        else 
            real_dutyb <= (real(PSB_COARSE) + (real(PSB_FINE) / 8.0));
        end if;

        if(CLKB_IN_SEL = "10" or CLKB_IN_SEL = "11") then
            clkoutb_duty <= clkoutb_duty_odd;
        elsif((DTMS_ENB = "FALSE") or (DYN_PSB_SEL = "FALSE")) then
            clkoutb_duty <= clkoutb_half;
        elsif((DYN_DPA_EN = "TRUE") and (DTMS_ENB = "TRUE")) then
            if(ODIVB_SEL_reg = 1) then
                clkoutb_duty <= clkoutb_half;
            else 
                if(real_dutyb > real_phaseb) then
                    clkoutb_duty <= (clkoutb_period * (real_dutyb - real_phaseb))/real_odivb;
                elsif(real_dutyb < real_phaseb) then
                    clkoutb_duty <= (clkoutb_period *(real_odivb + (real_dutyb - real_phaseb)))/real_odivb; 
                end if;
            end if;
        end if;
    end process;

    process 
    begin
        if (rising_edge(clkb)) then
            clkout_b <= '1';
            wait for tclkb_duty;
            clkout_b <= '0';
        end if;
        wait on clkb;
    end process;

    process(clkout_b) 
    begin
        if(clkb_dt_dir = '1') then
            clkout_dt_b <= clkout_b;
        else
            clkout_dt_b <= transport clkout_b after(clkb_dt_delay);
        end if;
    end process;

    process(clkout_dt_b)
    begin
        clkoutb_ps <= transport clkout_dt_b after (phase_valueb);
    end process;
    
    process (CLKIN, oclk_effect, clkoutb_ps, inner_reset,resets)
    begin
        if(inner_reset = '1') then
            clkb_out  <= '0';
        elsif(resets = '1') then
            clkb_out  <= '0';
        elsif(CLKB_OUT_SEL = '1') then
            clkb_out <= CLKIN;
        --elsif (oclk_effect = '1') then
        else 
            clkb_out <= clkoutb_ps;
        end if;
    end process;

    CLKOUTB <= clkb_out when (ckenb = '1') else '0';
    
    --clkoutc
    --phase_shift_value
    process(fine_dyn_c, coarse_dyn_c)
    begin
        if(DYN_PSC_SEL = "TRUE" and DYN_DPA_EN = "TRUE") then
            fine_c <= conv_integer(fine_dyn_c);
            coarse_c <= coarse_dyn_c;
        elsif(DYN_PSC_SEL = "FALSE") then
            fine_c <= PSC_FINE;
            coarse_c <= PSC_COARSE;
        end if;
    end process;

    process(coarse_c, fine_c, ODIVC_SEL_reg, clkoutc_period,real_phasec) 
    begin
        if(coarse_c = ODIVC_SEL_reg) then
            real_phasec <= (real(fine_c)/ 8.0);
        else
            real_phasec <= (real(coarse_c) + (real(fine_c)/ 8.0));
        end if;
        phase_valuec <= clkoutc_period * (real_phasec/real_odivc);
    end process;

    --duty_cycle
    h_level_c <= ODIVC_SEL_reg / 2;
    process(ODIVC_SEL_reg,clkoutc_period,h_level_c)
    begin
        real_h_level_c <= real(h_level_c);
        clkoutc_duty_odd <= (clkoutc_period * real_h_level_c / real_odivc);
    end process;

    process(clkoutc_half, real_dutyc, real_phasec, ODIVC_SEL_reg, clkoutc_period) 
    begin
        if(PSC_COARSE = ODIVC_SEL) then
            real_dutyc <= (real(PSC_FINE)/8.0);
        else
            real_dutyc <= (real(PSC_COARSE) + (real(PSC_FINE)/8.0));
        end if;

        if(CLKC_IN_SEL = "10" or CLKC_IN_SEL = "11") then
            clkoutc_duty <= clkoutc_duty_odd;
        elsif((DTMS_ENC = "FALSE") or (DYN_PSC_SEL = "FALSE")) then
            clkoutc_duty <= clkoutc_half;
        elsif(DYN_DPA_EN = "TRUE" and DTMS_ENC = "TRUE") then
            if(ODIVC_SEL_reg = 1) then
                clkoutc_duty <= clkoutc_half;
            else 
                if(real_dutyc > real_phasec) then
                    clkoutc_duty <= (clkoutc_period * (real_dutyc - real_phasec))/real_odivc;
                elsif(real_dutyc < real_phasec) then
                    clkoutc_duty <= (clkoutc_period *(real_odivc + (real_dutyc - real_phasec)))/real_odivc; 
                end if;
            end if;
        end if;
    end process;

    process 
    begin
        if (rising_edge(clkc)) then
            clkout_c <= '1';
            wait for clkoutc_duty;
            clkout_c <= '0';
        end if;
        wait on clkc;
    end process;

    process(clkout_c)
    begin
        clkoutc_ps <= transport clkout_c after (phase_valuec);
    end process;

    process (CLKIN, oclk_effect, clkoutc_ps, inner_reset,resets)
    begin
        if(inner_reset = '1') then
            clkc_out  <= '0';
        elsif(resets = '1') then
            clkc_out  <= '0';
        elsif(CLKC_OUT_SEL = '1') then
            clkc_out <= CLKIN;
        --elsif (oclk_effect = '1') then
        else
            clkc_out <= clkoutc_ps;
        end if;
    end process;

    CLKOUTC <= clkc_out when (ckenc = '1') else '0';   

    --clkoutd
    --phase_shift_value
    process(fine_dyn_d, coarse_dyn_d)
    begin
        if(DYN_PSD_SEL = "TRUE" and DYN_DPA_EN = "TRUE") then
            fine_d <= conv_integer(fine_dyn_d);
            coarse_d <= coarse_dyn_d;            
        elsif(DYN_PSD_SEL = "FALSE") then
            fine_d <= PSD_FINE;
            coarse_d <= PSD_COARSE;
        end if;
    end process;

    process(coarse_d, fine_d, ODIVD_SEL_reg, clkoutd_period,real_phased)
    begin
        if(coarse_d = ODIVD_SEL_reg) then
            real_phased <= (real(fine_d)/8.0);
        else
            real_phased <= (real(coarse_d) + (real(fine_d)/8.0));
        end if;
        phase_valued <= clkoutd_period * (real_phased/real_odivd);
    end process;

     --duty_cycle
    h_level_d <= ODIVD_SEL_reg / 2;
    process(ODIVD_SEL_reg,clkoutd_period,h_level_d)
    begin
        real_h_level_d <= real(h_level_d);
        clkoutd_duty_odd <= (clkoutd_period * real_h_level_d / real_odivd);
    end process;

    process(clkoutd_half, real_dutyd, real_phased, ODIVD_SEL_reg, clkoutd_period) 
    begin
        if(PSD_COARSE = ODIVD_SEL) then
            real_dutyd <= (real(PSD_FINE)/8.0);
        else
            real_dutyd <= (real(PSD_COARSE) + (real(PSD_FINE)/8.0));
        end if;

        if(CLKD_IN_SEL = "10" or CLKD_IN_SEL = "11") then
            clkoutd_duty <= clkoutd_duty_odd;
        elsif((DTMS_END = "FALSE") or (DYN_PSD_SEL = "FALSE")) then
            clkoutd_duty <= clkoutd_half;
        elsif(DYN_DPA_EN = "TRUE" and DTMS_END = "TRUE") then 
            if(ODIVD_SEL_reg = 1) then
                clkoutd_duty <= clkoutd_half;
            else 
                if(real_dutyd > real_phased) then
                    clkoutd_duty <= (clkoutd_period * (real_dutyd - real_phased))/real_odivd;
                elsif(real_dutyd < real_phased) then
                    clkoutd_duty <= (clkoutd_period *(real_odivd + (real_dutyd - real_phased)))/real_odivd;
                end if;
            end if;
        end if;
    end process;

    process 
    begin
        if (rising_edge(clkd)) then
            clkout_d <= '1';
            wait for clkoutd_duty;
            clkout_d <= '0';
        end if;
        wait on clkd;
    end process;

    process(clkout_d)
    begin
        clkoutd_ps <= transport clkout_d after (phase_valued);
    end process;

    process (CLKIN, oclk_effect, clkoutd_ps, inner_reset,resets)
    begin
        if (inner_reset = '1') then
            clkd_out  <= '0';
        elsif(resets = '1') then
            clkd_out  <= '0';
        elsif(CLKD_OUT_SEL = '1') then
            clkd_out <= CLKIN;
        --elsif (oclk_effect = '1') then
        else
            clkd_out <= clkoutd_ps;
        end if;
    end process;

    CLKOUTD <= clkd_out when (ckend = '1') else '0';

end Behavioral;

-----------------ELVDS_IBUF_MIPI---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity ELVDS_IBUF_MIPI is
    PORT(
        OH : OUT std_logic;
        OL : OUT std_logic;
        I : IN std_logic;
        IB : IN std_logic
        );
end ELVDS_IBUF_MIPI;

architecture Behavioral of ELVDS_IBUF_MIPI is
begin
    OL <= IB;

    process(I,IB)
    begin
        if(I = '1' and IB = '0')then 
            OH <= I;
        elsif(I = '0' and IB = '1')then 
            OH <= I;
        elsif(I = 'X' or IB = 'X')then 
            OH <= 'X';
        end if;
    end process;
end Behavioral;


------------------------MIPI_IBUF------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MIPI_IBUF is
    PORT (
         OH, OL, OB : OUT std_logic;
         IO, IOB : INOUT std_logic;
         I, IB : IN std_logic;
         OEN, OENB, HSREN : IN std_logic
    );
end MIPI_IBUF;

architecture Behavioral of MIPI_IBUF is    

begin
    --LP mode
    OL <= TO_X01(IO);
    OB <= TO_X01(IOB);

    process(IO, I, OEN)
    begin
	    if ((OEN = '1') or (OEN = 'H')) then
	        IO <= 'Z';
	    elsif ((OEN = '0') or (OEN = 'L')) then
	        IO <= TO_X01(I);
	    else
	        IO <= 'X';
	    end if;		
    end process;

    process(IOB, IB, OENB)
    begin      
	    if ((OENB = '1') or (OENB = 'H')) then
	        IOB <= 'Z';
	    elsif ((OENB = '0') or (OENB = 'L')) then
	        IOB <= TO_X01(IB);
	    else
	        IOB <= 'X';
	    end if;
    end process;

    --HS mode   
    process (IO, IOB, HSREN)
    begin
        if((IO = '1') and (IOB = '0')) then
            OH <= TO_X01(IO);
        elsif((IO = '0') and (IOB = '1')) then
            OH <= TO_X01(IO);
        elsif((IO = 'X') or (IOB = 'X')) then
            OH <= 'X';
        end if;
    end process;
end Behavioral;

----------------------------I3C_IOBUF--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity I3C_IOBUF is
    PORT (
    	O  : OUT   std_logic;
    	IO : INOUT std_logic;
     	I  : IN    std_logic;
	    MODESEL : IN    std_logic
    );
end I3C_IOBUF;

architecture  Behavioral of I3C_IOBUF is
begin
    process(IO, I, MODESEL)
    begin
    	O <= TO_X01(IO);
	    if ((MODESEL = '1') or (MODESEL = 'H')) then -- open-drain mode
            if(I = '0') then --pull down
                IO <= '0';
            else             --floating
                IO <= 'Z';
            end if;
	    elsif ((MODESEL = '0') or (MODESEL = 'L')) then --normal mode
	        IO <= TO_X01(I);
	    end if;
    end process;

end Behavioral;



