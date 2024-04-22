library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use STD.TEXTIO.all;
use IEEE.STD_LOGIC_TEXTIO.all;

entity TB_FP_MULT is
end entity TB_FP_MULT;

use WORK.all;

architecture TB_FP_MULT of TB_FP_MULT is

component FP_MULT is
  port (
    A_H : in  STD_LOGIC_VECTOR ( 31 downto 0 );
    B_H : in  STD_LOGIC_VECTOR ( 31 downto 0 );
    O_H : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end component FP_MULT;

signal A_INPUT    : STD_LOGIC_VECTOR ( 31 downto 0 );
signal B_INPUT    : STD_LOGIC_VECTOR ( 31 downto 0 );
signal F_DETAILED : STD_LOGIC_VECTOR ( 31 downto 0 );

alias A_EXP : STD_LOGIC_VECTOR ( 7 downto 0 ) is A_INPUT ( 30 downto 23 );
alias B_EXP : STD_LOGIC_VECTOR ( 7 downto 0 ) is B_INPUT ( 30 downto 23 );

signal A_EXP_INT : INTEGER;
signal B_EXP_INT : INTEGER;
signal R_EXP_INT : INTEGER;

signal CLOCK : STD_LOGIC;
signal CYCLE : INTEGER := 0;

begin
UUT_DETAILED: FP_MULT
  port map (
    A_H => A_INPUT,
    B_H => B_INPUT,
    O_H => F_DETAILED
  );

CYCLE_PROC:
  process
  begin
    CLOCK <= '1';
    wait for 100 ns;
    CLOCK <= '0';
    wait for 100 ns;
    CYCLE <= CYCLE + 1;
  end process;

  A_EXP_INT <= CONV_INTEGER ( A_EXP ) - 127 ;
  B_EXP_INT <= CONV_INTEGER ( B_EXP ) - 127 ;
  R_EXP_INT <= A_EXP_INT + B_EXP_INT;

DATA_PROC:
  process ( CLOCK ) is
  type DATA_STOR is array ( 0 to 31 ) of STD_LOGIC_VECTOR ( 31 downto 0 );
  constant A_VALS : DATA_STOR := (
    X"3D800000", X"3F800000", X"BF800000", X"3F8F0000",  --  0,  1,  2,  3
    X"BF800000", X"3F800000", X"3F000000", X"3F890000",  --  4,  5,  6,  7
    X"BF000000", X"42C80000", X"42C80000", X"C2C80000",  --  8,  9, 10, 11
    X"41D80000", X"C1D80000", X"4620F800", X"4620F800",  -- 12, 13, 14, 15
    X"49791900", X"49791900", X"42CA0000", X"C1D80000",  -- 16, 17, 18, 19
    X"C2CE0000", X"42CE0000", X"497E07A0", X"C97E07A0",  -- 20, 21, 22, 23
    X"1F0AC723", X"269117C6", X"269FF7C6", X"5F0AC723",  -- 24, 25, 26, 27
    X"733A4000", X"E85B79A2", X"41700000", X"4640E400"   -- 28, 29, 30, 31
  );
  constant B_VALS : DATA_STOR := (
    X"3D000000", X"3F800000", X"3F800000", X"BF800000",
    X"BF800000", X"3F000000", X"3F870000", X"BF00A000",
    X"3F800000", X"3F800000", X"BF800000", X"C0400000",
    X"43110000", X"43110000", X"3E800000", X"BE800000",
    X"42CC0000", X"C2CC0000", X"49791900", X"49FCB8F0",
    X"448FC000", X"C481C000", X"497E07B0", X"497E07B0",
    X"1E9FF7C6", X"5F0AC723", X"269FF7C6", X"5F0AC723",
    X"685B79A2", X"733A4000", X"43988000", X"45D42800"
  );
  variable FIRST : BOOLEAN := TRUE;

  variable INDEX : INTEGER := 0;
  
  begin
    if RISING_EDGE ( CLOCK ) or (FIRST = TRUE ) then
      INDEX := CYCLE mod 32;
      A_INPUT <= A_VALS(INDEX);
      B_INPUT <= B_VALS(INDEX);
      FIRST := FALSE;
    end if;
  end process;


RECORDING_PROC:
  process ( CLOCK ) is
  file OUT_FILE: TEXT open WRITE_MODE is "outputvals.txt";
  variable BUF : LINE;                      -- set BUF up to send line
  constant STR : STRING ( 1 to 3 ) := "   ";
  variable TM  : TIME;
  begin
    if CLOCK'EVENT and CLOCK = '1' and CYCLE > 1 then -- if rising edge
      WRITE  ( BUF, CYCLE );
      WRITE  ( BUF, STR );
      HWRITE ( BUF, A_INPUT );
      WRITE  ( BUF, STR);
      HWRITE ( BUF, B_INPUT );
      WRITE  ( BUF, STR);
      WRITE  ( BUF, STR);
      HWRITE ( BUF, F_DETAILED );
      WRITE  ( BUF, STR);
      WRITE  ( BUF, NOW);
      WRITE  ( BUF, STR);
      TM := F_DETAILED'LAST_EVENT;
      WRITE  ( BUF, TM );
      WRITELINE (OUT_FILE, BUF);            -- and send to file
    end if;
  end process;

end TB_FP_MULT;
