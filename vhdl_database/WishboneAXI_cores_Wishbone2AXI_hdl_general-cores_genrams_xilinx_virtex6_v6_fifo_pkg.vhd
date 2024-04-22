package v6_fifo_pkg is

  type t_v6_fifo_mapping is record
    d_width  : integer;
    dp_width : integer;
    entries  : integer;
    is_36    : boolean;
  end record;

  type t_v6_fifo_mapping_array is array(integer range <>) of t_v6_fifo_mapping;

  constant c_v6_fifo_mappings : t_v6_fifo_mapping_array (0 to 9) := (
    0 => (d_width => 4, dp_width => 0, entries => 4096, is_36 => false),
    1 => (d_width => 8, dp_width => 1, entries => 2048, is_36 => false),
    2 => (d_width => 16, dp_width => 2, entries => 1024, is_36 => false),
    3 => (d_width => 32, dp_width => 4, entries => 512, is_36 => false),
    4 => (d_width => 32, dp_width => 4, entries => 1024, is_36 => true),
    5 => (d_width => 4, dp_width => 0, entries => 8192, is_36 => true),
    6 => (d_width => 8, dp_width => 1, entries => 4096, is_36 => true),
    7 => (d_width => 16, dp_width => 2, entries => 2048, is_36 => true),
    8 => (d_width => 32, dp_width => 4, entries => 1024, is_36 => true),
    9 => (d_width => 64, dp_width => 8, entries => 512, is_36 => true));

  impure function f_v6_fifo_find_mapping
    (data_width : integer; size : integer) return t_v6_fifo_mapping;

  function f_v6_fifo_mode (m : t_v6_fifo_mapping) return string;

  function f_empty_thr(a: boolean; thr: integer; size:integer) return integer;

end v6_fifo_pkg;

package body v6_fifo_pkg is

  impure function f_v6_fifo_find_mapping
    (data_width  : integer; size : integer) return t_v6_fifo_mapping is
    variable tmp : t_v6_fifo_mapping;
  begin
    for i in 0 to c_v6_fifo_mappings'length-1 loop
      if(c_v6_fifo_mappings(i).d_width + c_v6_fifo_mappings(i).dp_width >= data_width and c_v6_fifo_mappings(i).entries >= size) then
        return c_v6_fifo_mappings(i);
      end if;
    end loop;

    tmp.d_width := 0;
    return tmp;
  end f_v6_fifo_find_mapping;

  function f_v6_fifo_mode (m : t_v6_fifo_mapping) return string is
  begin
    if(m.d_width = 64 and m.is_36 = true) then
      return "FIFO36_72";
    elsif(m.d_width = 32 and m.is_36 = false) then
      return "FIFO18_36";
    elsif(m.is_36 = true) then
      return "FIFO36";
    else
      return "FIFO18";
    end if;
    return "";
  end f_v6_fifo_mode;

  function f_empty_thr
    (a: boolean; thr: integer; size:integer) return integer is
  begin
    if(a = true) then
      return thr;
    else
      return size/2;
    end if;
  end f_empty_thr;

end v6_fifo_pkg;
