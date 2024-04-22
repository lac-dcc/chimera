--------------------------------------------------------------------------------
-- BASE
-- Definitions
--------------------------------------------------------------------------------
-- DO 3/2009
--------------------------------------------------------------------------------
-- Base
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

PACKAGE base_pack IS
  --------------------------------------
  SUBTYPE uv     IS unsigned;
  SUBTYPE sv     IS signed;
  
  SUBTYPE uv1_0  IS unsigned(1  DOWNTO 0);
  SUBTYPE uv0_1  IS unsigned(0  TO     1);
  SUBTYPE uv3_0  IS unsigned(3  DOWNTO 0);
  SUBTYPE uv0_3  IS unsigned(0  TO     3);
  SUBTYPE uv7_0  IS unsigned(7  DOWNTO 0);
  SUBTYPE uv0_7  IS unsigned(0  TO     7);
  
  SUBTYPE uv2    IS unsigned(1   DOWNTO 0);
  SUBTYPE uv3    IS unsigned(2   DOWNTO 0);
  SUBTYPE uv4    IS unsigned(3   DOWNTO 0);
  SUBTYPE uv5    IS unsigned(4   DOWNTO 0);
  SUBTYPE uv6    IS unsigned(5   DOWNTO 0);
  SUBTYPE uv7    IS unsigned(6   DOWNTO 0);
  SUBTYPE uv8    IS unsigned(7   DOWNTO 0);
  SUBTYPE uv9    IS unsigned(8   DOWNTO 0);
  SUBTYPE uv10   IS unsigned(9   DOWNTO 0);
  SUBTYPE uv11   IS unsigned(10  DOWNTO 0);
  SUBTYPE uv12   IS unsigned(11  DOWNTO 0);
  SUBTYPE uv13   IS unsigned(12  DOWNTO 0);
  SUBTYPE uv14   IS unsigned(13  DOWNTO 0);
  SUBTYPE uv15   IS unsigned(14  DOWNTO 0);
  SUBTYPE uv16   IS unsigned(15  DOWNTO 0);
  SUBTYPE uv24   IS unsigned(23  DOWNTO 0);
  SUBTYPE uv32   IS unsigned(31  DOWNTO 0);
  SUBTYPE uv64   IS unsigned(63  DOWNTO 0);
  SUBTYPE uv128  IS unsigned(127 DOWNTO 0);
  
  SUBTYPE sv2    IS signed(1   DOWNTO 0);
  SUBTYPE sv4    IS signed(3   DOWNTO 0);
  SUBTYPE sv8    IS signed(7   DOWNTO 0);
  SUBTYPE sv16   IS signed(15  DOWNTO 0);
  SUBTYPE sv32   IS signed(31  DOWNTO 0);
  SUBTYPE sv64   IS signed(63  DOWNTO 0);
  SUBTYPE sv128  IS signed(127 DOWNTO 0);
  
  TYPE arr_uv0_3 IS ARRAY(natural RANGE <>) OF uv0_3;
  TYPE arr_uv0_7 IS ARRAY(natural RANGE <>) OF uv0_7;
  
  TYPE arr_uv4   IS ARRAY(natural RANGE <>) OF uv4;
  TYPE arr_uv8   IS ARRAY(natural RANGE <>) OF uv8;
  TYPE arr_uv16  IS ARRAY(natural RANGE <>) OF uv16;
  TYPE arr_uv32  IS ARRAY(natural RANGE <>) OF uv32;
  TYPE arr_uv64  IS ARRAY(natural RANGE <>) OF uv64;

  SUBTYPE uint1  IS natural RANGE 0 TO 1;
  SUBTYPE uint2  IS natural RANGE 0 TO 3;
  SUBTYPE uint3  IS natural RANGE 0 TO 7;
  SUBTYPE uint4  IS natural RANGE 0 TO 15;
  SUBTYPE uint5  IS natural RANGE 0 TO 31;
  SUBTYPE uint6  IS natural RANGE 0 TO 63;
  SUBTYPE uint7  IS natural RANGE 0 TO 127;
  SUBTYPE uint8  IS natural RANGE 0 TO 255;
  SUBTYPE uint12 IS natural RANGE 0 TO 4095;
  SUBTYPE uint16 IS natural RANGE 0 TO 65535;
  SUBTYPE uint24 IS natural RANGE 0 TO 16777215;
  
  -------------------------------------------------------------
  FUNCTION v_or  (CONSTANT v : unsigned) RETURN std_logic;
  FUNCTION v_and (CONSTANT v : unsigned) RETURN std_logic;
  FUNCTION vv    (CONSTANT s : std_logic;
                  CONSTANT N : natural) RETURN unsigned;
  
  --------------------------------------
  FUNCTION to_std_logic (a : boolean) RETURN std_logic;
  --------------------------------------
  FUNCTION mux (
    s : std_logic;
    a : unsigned;
    b : unsigned) RETURN unsigned;
  --------------------------------------
  FUNCTION mux (
    s : boolean;
    a : unsigned;
    b : unsigned) RETURN unsigned;
  --------------------------------------
  FUNCTION mux (
    s : std_logic;
    a : std_logic;
    b : std_logic) RETURN std_logic;
  --------------------------------------
  FUNCTION mux (
    s : boolean;
    a : std_logic;
    b : std_logic) RETURN std_logic;
  --------------------------------------
  FUNCTION mux (
    s : boolean;
    a : boolean;
    b : boolean) RETURN boolean;
  --------------------------------------
  FUNCTION mux (
    s : boolean;
    a : natural;
    b : natural) RETURN natural;
  --------------------------------------
  FUNCTION mux (
    s : std_logic;
    a : character;
    b : character) RETURN character;
  --------------------------------------
  FUNCTION mux (
    s : boolean;
    a : character;
    b : character) RETURN character;
  --------------------------------------
  FUNCTION sext (
    e : unsigned;
    l : natural) RETURN unsigned;
  --------------------------------------
  FUNCTION sext (
    e : std_logic;
    l : natural) RETURN unsigned;
  --------------------------------------
  FUNCTION uext (
    e : unsigned;
    l : natural) RETURN unsigned;
  --------------------------------------
  FUNCTION uext (
    e : std_logic;
    l : natural) RETURN unsigned;
  --------------------------------------
  PROCEDURE wure (
    SIGNAL clk : IN std_logic;
    CONSTANT n : IN natural:=1);
  --------------------------------------
  PROCEDURE wufe (
    SIGNAL clk : IN std_logic;
    CONSTANT n : IN natural:=1);
  --------------------------------------
  FUNCTION To_HString (v : unsigned) RETURN string;
  FUNCTION To_String  (v : unsigned) RETURN string;
  --------------------------------------
  FUNCTION To_Upper (c : character) RETURN character;
  FUNCTION To_Upper (s : string) RETURN string;
  FUNCTION To_String  (i : natural; b : integer) RETURN string;
  FUNCTION To_Natural (s : string; b : integer) RETURN natural;
  
  FUNCTION ilog2 (CONSTANT v : natural) RETURN natural;
  
END PACKAGE base_pack;

--------------------------------------------------------------------------------

PACKAGE BODY base_pack IS

  -------------------------------------------------------------
  FUNCTION vv (CONSTANT s : std_logic;
               CONSTANT N : natural) RETURN unsigned IS
    VARIABLE v : unsigned(N-1 DOWNTO 0);
  BEGIN
    v:=(OTHERS => s);
    RETURN v;
  END FUNCTION vv;
  
  -------------------------------------------------------------
  -- Vector OR (reduce)
  FUNCTION v_or (CONSTANT v : unsigned) RETURN std_logic IS
    VARIABLE r : std_logic := '0';
    VARIABLE Z : unsigned(v'range) := (OTHERS =>'0');
  BEGIN
--pragma synthesis_off
    IF 1=1 THEN
      FOR I IN v'range LOOP
        r:=r OR v(I);
      END LOOP;
      RETURN r;
    ELSE
--pragma synthesis_on
      IF v/=Z THEN
        RETURN '1';
      ELSE
        RETURN '0';
      END IF;
--pragma synthesis_off
    END IF;
--pragma synthesis_on    
  END FUNCTION v_or;
  
  -------------------------------------------------------------
  -- Vector AND (reduce)
  FUNCTION v_and (CONSTANT v : unsigned) RETURN std_logic IS
    VARIABLE r : std_logic := '1';
    VARIABLE U : unsigned(v'range) := (OTHERS =>'1');
  BEGIN
--pragma synthesis_off
    IF 1=1 THEN
      FOR I IN v'range LOOP
        r:=r AND v(I);
      END LOOP;
      RETURN r;
    ELSE
--pragma synthesis_on
      IF v/=U THEN
        RETURN '0';
      ELSE
        RETURN '1';
      END IF;
--pragma synthesis_off
    END IF;
--pragma synthesis_on
  END FUNCTION v_and;
  
  --------------------------------------
  FUNCTION to_std_logic (a : boolean) RETURN std_logic IS
  BEGIN
    IF a THEN RETURN '1';
         ELSE RETURN '0';
    END IF;
  END FUNCTION to_std_logic;
  
  --------------------------------------
  -- Sélection/Multiplexage  s=1:a, s=0:b
  FUNCTION mux (
    s : std_logic;
    a : unsigned;
    b : unsigned) RETURN unsigned IS
    VARIABLE x : unsigned(a'range) :=(OTHERS => 'X');
  BEGIN
    ASSERT a'length=b'length
      REPORT "mux(): Different lengths" SEVERITY failure;
    IF s='1' THEN
      RETURN a;
    ELSIF s='0' THEN
      RETURN b;
    ELSE
      RETURN x;
    END IF;
  END FUNCTION mux;
  
  --------------------------------------
  -- Sélection/Multiplexage  s=true:a, s=false:b
  FUNCTION mux (
    s : boolean;
    a : unsigned;
    b : unsigned) RETURN unsigned IS
  BEGIN
    ASSERT a'length=b'length
      REPORT "mux(): Different lengths" SEVERITY failure;
    IF s THEN
      RETURN a;
    ELSE
      RETURN b;
    END IF;
  END FUNCTION mux;
  
  --------------------------------------
  -- Sélection/Multiplexage  s=1:a, s=0:b
  FUNCTION mux (
    s : std_logic;
    a : std_logic;
    b : std_logic)
    RETURN std_logic IS
  BEGIN
    RETURN (S AND A) OR (NOT S AND B);
  END FUNCTION mux;
  
  --------------------------------------
  -- Sélection/Multiplexage  s=true:a, s=false:b
  FUNCTION mux (
    s : boolean;
    a : std_logic;
    b : std_logic)
    RETURN std_logic IS
  BEGIN
    IF s THEN
      RETURN a;
    ELSE
      RETURN b;
    END IF;
  END FUNCTION mux;
  
  --------------------------------------
  -- Sélection/Multiplexage  s=true:a, s=false:b
  FUNCTION mux (
    s : boolean;
    a : boolean;
    b : boolean)
    RETURN boolean IS
  BEGIN
    IF s THEN
      RETURN a;
    ELSE
      RETURN b;
    END IF;
  END FUNCTION mux;
  
  --------------------------------------
  -- Sélection/Multiplexage  s=1:a, s=0:b
  FUNCTION mux (
    s : boolean;
    a : natural;
    b : natural)
    RETURN natural IS
  BEGIN
    IF s THEN
      RETURN a;
    ELSE
      RETURN b;
    END IF;
  END FUNCTION mux;

  --------------------------------------
  -- Sélection/Multiplexage  s=true:a, s=false:b
  FUNCTION mux (
    s : std_logic;
    a : character;
    b : character)
    RETURN character IS
  BEGIN
    IF s='1' THEN
      RETURN a;
    ELSE
      RETURN b;
    END IF;
  END FUNCTION mux;
  
  --------------------------------------
  -- Sélection/Multiplexage  s=true:a, s=false:b
  FUNCTION mux (
    s : boolean;
    a : character;
    b : character)
    RETURN character IS
  BEGIN
    IF s THEN
      RETURN a;
    ELSE
      RETURN b;
    END IF;
  END FUNCTION mux;
  
  --------------------------------------
  -- Étend un vecteur avec extension de signe
  FUNCTION sext (
    e : unsigned;
    l : natural) RETURN unsigned IS
    VARIABLE t : unsigned(l-1 DOWNTO 0);
  BEGIN
    -- <AFAIRE> Vérifier numeric_std.resize ...
    t:=(OTHERS => e(e'left));
    t(e'length-1 DOWNTO 0):=e;
    RETURN t;
  END FUNCTION sext;
  
  --------------------------------------
  -- Étend un vecteur avec extension de signe
  FUNCTION sext (
    e : std_logic;
    l : natural) RETURN unsigned IS
    VARIABLE t : unsigned(l-1 DOWNTO 0);
  BEGIN
    -- <AFAIRE> Vérifier numeric_std.resize ...
    t:=(OTHERS => e);
    RETURN t;
  END FUNCTION sext;
  
   --------------------------------------
  -- Étend un vecteur sans extension de signe
  FUNCTION uext (
    e : unsigned;
    l : natural) RETURN unsigned IS
    VARIABLE t : unsigned(l-1 DOWNTO 0);
  BEGIN
    -- <AFAIRE> Vérifier numeric_std.resize ...
    t:=(OTHERS => '0');
    t(e'length-1 DOWNTO 0):=e;
    RETURN t;
  END FUNCTION uext;
  
  --------------------------------------
  -- Étend un vecteur sans extension de signe 
  FUNCTION uext (
    e : std_logic;
    l : natural) RETURN unsigned IS
    VARIABLE t : unsigned(l-1 DOWNTO 0);
  BEGIN
  -- <AFAIRE> Vérifier numeric_std.resize ...
    t:=(OTHERS => '0');
    t(0):=e;
    RETURN t;
  END FUNCTION uext;
  
  --------------------------------------
  -- Wait Until Rising Edge
  PROCEDURE wure(
    SIGNAL clk : IN std_logic;
    CONSTANT n : IN natural:=1) IS
  BEGIN
    FOR i IN 1 TO n LOOP
      WAIT UNTIL rising_edge(clk);
    END LOOP;
  END PROCEDURE wure;

  --------------------------------------
  -- Wait Until Rising Edge
  PROCEDURE wufe(
    SIGNAL clk : IN std_logic;
    CONSTANT n : IN natural:=1) IS
  BEGIN
    FOR i IN 1 TO n LOOP
      WAIT UNTIL falling_edge(clk);
    END LOOP;
  END PROCEDURE wufe;

  --------------------------------------
  CONSTANT HexString : string(1 TO 16):="0123456789ABCDEF";
  
  -- Conversion unsigned -> Chaîne hexadécimale
  FUNCTION To_HString(v : unsigned) RETURN string IS
    VARIABLE r : string(1 TO ((v'length)+3)/4);
    VARIABLE x : unsigned(1 TO v'length);
    VARIABLE i,j : integer;
  BEGIN
    x:=v;
    i:=1;
    j:=1;
    r:=(OTHERS =>' ');
    WHILE i<v'length LOOP
      IF x(i)='X' OR x(i+1)='X' OR x(i+2)='X' OR x(i+3)='X' THEN
        r(j):='X';
      ELSIF x(i)='U' OR x(i+1)='U' OR x(i+2)='U' OR x(i+3)='U' THEN
        r(j):='U';
      ELSIF x(i)='Z' OR x(i+1)='Z' OR x(i+2)='Z' OR x(i+3)='Z' THEN
        r(j):='Z';
      ELSIF x(i)='H' OR x(i+1)='H' OR x(i+2)='H' OR x(i+3)='H' THEN
        r(j):='H';
      ELSIF x(i)='L' OR x(i+1)='L' OR x(i+2)='L' OR x(i+3)='L' THEN
        r(j):='L';
      ELSIF x(i)='W' OR x(i+1)='W' OR x(i+2)='W' OR x(i+3)='W' THEN
        r(j):='W';
      ELSE
        r(j):=HexString(to_integer(unsigned(x(i TO i+3)))+1);
      END IF;
      i:=i+4;
      j:=j+1;
    END LOOP;
    RETURN r;
  END FUNCTION To_HString;

  -- Conversion unsigned -> Chaîne binaire
  FUNCTION To_String(v : unsigned) RETURN string IS
    VARIABLE r : string(1 TO v'length);
    VARIABLE x : unsigned(1 TO v'length);
  BEGIN
    x:=v;
    FOR i IN 1 TO v'length LOOP
      CASE x(i) IS
        WHEN '0' =>  r(i):='0';
        WHEN '1' =>  r(i):='1';
        WHEN 'X' =>  r(i):='X';
        WHEN 'Z' =>  r(i):='Z';
        WHEN 'U' =>  r(i):='U';
        WHEN 'H' =>  r(i):='H';
        WHEN 'L' =>  r(i):='L';
        WHEN '-' =>  r(i):='-';
        WHEN 'W' =>  r(i):='W';
      END CASE;
      -- r(i):=std_logic'image(x(i))(1);
    END LOOP;
    RETURN r;
  END FUNCTION To_String;

  --------------------------------------
  -- Conversion majuscules caractère
  FUNCTION To_Upper(c : character) RETURN character IS
    VARIABLE r : character;
  BEGIN
    CASE c IS
      WHEN 'a' => r := 'A';
      WHEN 'b' => r := 'B';
      WHEN 'c' => r := 'C';
      WHEN 'd' => r := 'D';
      WHEN 'e' => r := 'E';
      WHEN 'f' => r := 'F';
      WHEN 'g' => r := 'G';
      WHEN 'h' => r := 'H';
      WHEN 'i' => r := 'I';
      WHEN 'j' => r := 'J';
      WHEN 'k' => r := 'K';
      WHEN 'l' => r := 'L';
      WHEN 'm' => r := 'M';
      WHEN 'n' => r := 'N';
      WHEN 'o' => r := 'O';
      WHEN 'p' => r := 'P';
      WHEN 'q' => r := 'Q';
      WHEN 'r' => r := 'R';
      WHEN 's' => r := 'S';
      WHEN 't' => r := 'T';
      WHEN 'u' => r := 'U';
      WHEN 'v' => r := 'V';
      WHEN 'w' => r := 'W';
      WHEN 'x' => r := 'X';
      WHEN 'y' => r := 'Y';
      WHEN 'z' => r := 'Z';
      WHEN OTHERS => r := c;
    END CASE;
    RETURN r;
  END To_Upper;

  --------------------------------------
  -- Conversion majuscules chaîne
  FUNCTION To_Upper(s: string) RETURN string IS
    VARIABLE r: string (s'range);
  BEGIN
    FOR i IN s'range LOOP
      r(i):= to_upper(s(i));
    END LOOP;
    RETURN r;
  END To_Upper;
  
  --------------------------------------
  -- Conversion entier -> chaîne
  FUNCTION To_String(i: natural; b: integer) RETURN string IS
    VARIABLE r : string(1 TO 10);
    VARIABLE j,k : natural;
    VARIABLE t : character;
  BEGIN
    j:=i;
    k:=10;
    WHILE j>=b LOOP
      r(k):=HexString(j MOD b);
      j:=j/b;
      k:=k-1;
    END LOOP;

    RETURN r(k TO 10);
  END FUNCTION To_String;
  
  --------------------------------------
  -- Conversion chaîne -> entier
  FUNCTION To_Natural (s : string; b : integer) RETURN natural IS
    VARIABLE v,r : natural;
  BEGIN
    r:=0;
     FOR i IN s'range LOOP
       CASE s(i) IS
         WHEN  '0' => v:=0;
         WHEN  '1' => v:=1;
         WHEN  '2' => v:=2;
         WHEN  '3' => v:=3;
         WHEN  '4' => v:=4;
         WHEN  '5' => v:=5;
         WHEN  '6' => v:=6;
         WHEN  '7' => v:=7;
         WHEN  '8' => v:=8;
         WHEN  '9' => v:=9;
         WHEN  'a' | 'A' => v:=10;
         WHEN  'b' | 'B' => v:=11;
         WHEN  'c' | 'C' => v:=12;
         WHEN  'd' | 'D' => v:=13;
         WHEN  'e' | 'E' => v:=14;
         WHEN  'f' | 'F' => v:=15;
         WHEN OTHERS =>
           v:=1000;
       END CASE;
       ASSERT v<b REPORT "To_Natural : Chaîne invalide :" & s SEVERITY error;
       r:=r*b+v;
     END LOOP;
    RETURN r;
  END FUNCTION To_Natural;

  --------------------------------------
  -- Renvoie le log entier en base 2, à peu près
  FUNCTION ilog2 (CONSTANT v : natural) RETURN natural IS
    VARIABLE r : natural := 1;
    VARIABLE n : natural := 0;
  BEGIN
    WHILE v>r LOOP
      n:=n+1;
      r:=r*2;
    END LOOP;
    RETURN n;
  END FUNCTION ilog2;
  
END PACKAGE BODY base_pack;
