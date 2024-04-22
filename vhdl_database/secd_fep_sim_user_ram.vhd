-- user_ram.vhd - Synthesizable model for the User RAM

library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use std.textio.all;

entity user_ram is
  port(
    dout             : out std_logic_vector(7 downto 0);
    din              : in std_logic_vector(7 downto 0);
    addr             : in std_logic_vector(13 downto 0);
    en               : in std_logic;
    we               : in std_logic;
    clk              : in std_logic
  );
end;

architecture sim of user_ram is

  constant user_ram_size : integer := 16384;
  type user_ram_type is array (0 to (user_ram_size - 1)) of std_logic_vector (7 downto 0);

begin
  process

    function hex_to_natural(ch : in character) return natural is
      variable retval : natural range 0 to 15;
    begin
      if ch >= '0' and ch <= '9' then
        retval := character'pos(ch) - character'pos('0');
      elsif ch >= 'A' and ch <= 'F' then
        retval := character'pos(ch) - character'pos('A') + 10;
      elsif ch >= 'a' and ch <= 'f' then
        retval := character'pos(ch) - character'pos('a') + 10;
      else
        report "Invalid hex character " & integer'image(character'pos(ch)) & " found in input file" severity failure;
      end if;
      return retval;
    end function;

    procedure read_hex(buf: inout line; retval: out natural; length: in natural) is
      variable i: natural;
      variable ch: character;
      variable accumulator: natural := 0;
    begin
      for i in 0 to length - 1 loop
        read(buf, ch);
        accumulator := accumulator * 16 + hex_to_natural(ch);
      end loop;
      retval := accumulator;
    end procedure;

    variable RAM : user_ram_type;

    file init_file: text open read_mode is "$DSN/../../monitor/secd-app.s19";
    variable address: natural;
    variable length: natural;
    variable byte: natural;
    variable buf: line;
    variable ch: character;

  begin	  

    address := 0;
    while not endfile(init_file) loop
      readline(init_file, buf);
      read(buf, ch);
      assert(ch = 'S') report "Invalid S19 file, line does not begin with S" severity failure;
      read(buf, ch);
      if ch = '1' then
        read_hex(buf, length, 2);
        read_hex(buf, address, 4);
        for i in address to address + length - 3 loop
          read_hex(buf, byte, 2);
          RAM(i) := conv_std_logic_vector(byte, 8);
        end loop;
      elsif ch /= '9' then
        report "Invalid S19 file, line does not begin with S1 or S9" severity failure;
      end if;
    end loop;		
	
	report "S19 file read";

    loop
      wait until rising_edge(clk);
      if en = '1' then
        if we = '1' then
          RAM(conv_integer(addr)) := din;
        end if;
        dout <= RAM(conv_integer(addr));
      end if;
    end loop;
  end process;
end;


