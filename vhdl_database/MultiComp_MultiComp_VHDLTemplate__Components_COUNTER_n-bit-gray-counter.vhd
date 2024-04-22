
--Dated 05/August/2019
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY GrayCounter IS
  GENERIC (N: integer := 4);
  PORT (Clk, Rst, En: IN std_logic;
        output: OUT std_logic_vector (N-1 DOWNTO 0));
END GrayCounter;

ARCHITECTURE GrayCounter_beh OF GrayCounter IS
  SIGNAL Currstate, Nextstate, hold, next_hold: std_logic_vector (N-1 DOWNTO 0);
BEGIN

  StateReg: PROCESS (Clk)
  BEGIN
    IF rising_edge(Clk) THEN
      IF (Rst = '1') THEN
        Currstate <= (OTHERS =>'0');
      ELSIF (En = '1') THEN
        Currstate <= Nextstate;
      END IF;
    END IF;
  END PROCESS;

  hold <= Currstate XOR ('0' & hold(N-1 DOWNTO 1));
  next_hold <= std_logic_vector(unsigned(hold) + 1);
  Nextstate <= next_hold XOR ('0' & next_hold(N-1 DOWNTO 1)); 
  output <= Currstate;

END GrayCounter_beh;
