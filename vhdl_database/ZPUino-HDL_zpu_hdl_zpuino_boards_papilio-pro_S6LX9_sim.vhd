library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;

package sim is

  procedure hexread(L : inout line; value:out bit_vector);
  procedure hexread(L : inout line; value:out std_logic_vector);
  function ishex(c : character) return boolean;

end package;

package body sim is

  procedure char2hex(C: character; result: out bit_vector(3 downto 0);
            good: out boolean; report_error: in boolean) is
  begin
    good := true;
    case C is
    when '0' => result :=  x"0"; 
    when '1' => result :=  x"1"; 
    when '2' => result :=  X"2"; 
    when '3' => result :=  X"3"; 
    when '4' => result :=  X"4"; 
    when '5' => result :=  X"5"; 
    when '6' => result :=  X"6"; 
    when '7' => result :=  X"7"; 
    when '8' => result :=  X"8"; 
    when '9' => result :=  X"9"; 
    when 'A' => result :=  X"A"; 
    when 'B' => result :=  X"B"; 
    when 'C' => result :=  X"C"; 
    when 'D' => result :=  X"D"; 
    when 'E' => result :=  X"E"; 
    when 'F' => result :=  X"F"; 

    when 'a' => result :=  X"A"; 
    when 'b' => result :=  X"B"; 
    when 'c' => result :=  X"C"; 
    when 'd' => result :=  X"D"; 
    when 'e' => result :=  X"E"; 
    when 'f' => result :=  X"F"; 
    when others =>
      if report_error then
        assert false report 
	  "hexread error: read a '" & C & "', expected a hex character (0-F).";
      end if;
      good := false;
    end case;
  end;

  procedure hexread(L:inout line; value:out bit_vector)  is
                variable OK: boolean;
                variable C:  character;
                constant NE: integer := value'length/4;	--'
                variable BV: bit_vector(0 to value'length-1);	--'
                variable S:  string(1 to NE-1);
  begin
    if value'length mod 4 /= 0 then	--'
      assert false report
        "hexread Error: Trying to read vector " &
        "with an odd (non multiple of 4) length";
      return;
    end if;
 
    loop                                    -- skip white space
      read(L,C);
      exit when ((C /= ' ') and (C /= CR) and (C /= HT));
    end loop;
    char2hex(C, BV(0 to 3), OK, false);
    if not OK then
      return;
    end if;
 
    read(L, S, OK);
--    if not OK then
--      assert false report "hexread Error: Failed to read the STRING";
--      return;
--    end if;
 
    for I in 1 to NE-1 loop
      char2hex(S(I), BV(4*I to 4*I+3), OK, false);
      if not OK then
        return;
      end if;
    end loop;
    value := BV;
  end hexread;

  procedure hexread(L:inout line; value:out std_ulogic_vector) is
    variable tmp: bit_vector(value'length-1 downto 0);	--'
  begin
    hexread(L, tmp);
    value := TO_X01(tmp);
  end hexread;

  procedure hexread(L:inout line; value:out std_logic_vector) is
    variable tmp: std_ulogic_vector(value'length-1 downto 0);	--'
  begin
    hexread(L, tmp);
    value := std_logic_vector(tmp);
  end hexread;

  function ishex(c:character) return boolean is
  variable tmp : bit_vector(3 downto 0);
  variable OK : boolean;
  begin
    char2hex(C, tmp, OK, false);
    return OK;
  end ishex;

end ;