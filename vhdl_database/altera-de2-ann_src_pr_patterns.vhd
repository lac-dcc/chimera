LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.pr_types.all;
USE work.lcd_types.all;

package pattern_constants is

constant PATTERN_SIZE : integer := 16;
constant PATTERN_CLASS_COUNT : integer := 16;
constant PATTERN_TRAINING_COUNT : integer := 16;
constant PATTERN_TRAINING_DATA : std_logic_vector(PATTERN_SIZE * PATTERN_TRAINING_COUNT - 1 downto 0) :=
-- A
"0110" &
"1001" &
"1111" &
"1001" &
-- C
"1111" &
"1000" &
"1000" &
"1111" &
-- D
"1110" &
"1001" &
"1001" &
"1110" &
-- F
"1111" &
"1000" &
"1111" &
"1000" &
-- H
"1001" &
"1111" &
"1111" &
"1001" &
-- I
"1111" &
"0110" &
"0110" &
"1111" &
-- J
"1111" &
"0001" &
"1001" &
"0110" &
-- L
"1000" &
"1000" &
"1000" &
"1111" &
-- N
"1001" &
"1101" &
"1011" &
"1001" &
-- O
"1111" &
"1001" &
"1001" &
"1111" &
-- P
"1111" &
"1001" &
"1111" &
"1000" &
-- T
"1111" &
"0110" &
"0110" &
"0110" &
-- U
"1001" &
"1001" &
"1001" &
"1111" &
-- X
"1001" &
"0110" &
"0110" &
"1001" &
-- Y
"1001" &
"1001" &
"0110" &
"0110" &
-- Z
"1111" &
"0010" &
"0100" &
"1111";

constant PATTERN_TRAINING_CLASS : integer_vector(PATTERN_TRAINING_COUNT - 1 downto 0) := (15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0);

constant PATTERN_DISPLAY : char_vector(PATTERN_CLASS_COUNT - 1 downto 0) := (
(x"41"), -- A
(x"43"), -- C
(x"44"), -- D
(x"46"), -- F
(x"48"), -- H
(x"49"), -- I
(x"4A"), -- J
(x"4C"), -- L
(x"4E"), -- N
(x"4F"), -- O
(x"50"), -- P
(x"54"), -- T
(x"55"), -- U
(x"58"), -- X
(x"59"), -- Y
(x"5A")  -- Z
);
end package pattern_constants;

