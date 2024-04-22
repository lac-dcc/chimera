use std.textio.all;

package bridge_pkg is
  use std.textio.all;
  type lines is array (natural range <>) of line;
  type lines_ptr is access lines;
  procedure trim_right (l : inout line; n : natural);
  procedure split_string (l : inout line; args : inout lines_ptr);
end bridge_pkg;

package body bridge_pkg is

  function is_space (c : character) return boolean is
  begin
    return c = ' ' or c = HT;
  end function is_space;

  procedure trim_right (l : inout line; n : natural)
  is
    variable nl : line;
  begin
    if l = null then
      return;
    end if;
    if l'left < l'right then
      if n >= l'right - l'left + 1 then
        nl := new string'("");
      else
        nl := new string(l'left to l'right - n);
        nl.all := l(l'left to l'right - n);
      end if;
    else
      if n >= l'left - l'right + 1 then
        nl := new string'("");
      else
        nl := new string(l'left downto l'right + n);
        nl.all := l(l'left downto l'right + n);
      end if;
    end if;
    deallocate (l);
    l := nl;
  end trim_right;

  procedure split_string (l : inout line; args : inout lines_ptr)
  is
    variable count : integer := 0;
    variable arg_start : integer := 1;
    variable state : bit := '0';
    variable buf : line;
    variable i : integer;
  begin
    for i in 1 to l'length loop
      if state = '1' then
        if is_space(l(i)) then
          state := '0';
        end if;
      else
        if not is_space(l(i)) then
          state := '1';
          count := count + 1;
        end if;
      end if;
    end loop;

    -- deallocate existing args
    if args /= null then
      for i in 1 to args'length loop
        if args(i) /= null then
          deallocate(args(i));
        end if;
      end loop;
    end if;
    deallocate(args);

    args := new lines (1 to count);

    state := '0';
    count := 1;
    for i in 1 to l'length loop
      if state = '1' then
        if is_space(l(i)) then
          state := '0';
          --write(buf, string'("ARG: "));
          --write(buf, string'(l(arg_start to i - 1)));
          --writeline(output, buf);

          args(count) := new string (1 to i - arg_start);
          args(count).all := l(arg_start to i - 1);
          count := count + 1;
        end if;
      else
        if not is_space(l(i)) then
          state := '1';
          arg_start := i;
        end if;
      end if;
    end loop;

    if state = '1' then
      --write(buf, string'("LAST ARG: "));
      --write(buf, string'(l(arg_start to l'length)));
      --writeline(output, buf);
      args(count) := new string (1 to l'length - arg_start + 1);
      args(count).all := l(arg_start to l'length);
    end if;
  end;
end bridge_pkg;
