library work;
use work.pace_pkg.all;
--use work.sprite_pkg.all;

package body sprite_pkg is

  function NULL_TO_SPRITE_REG return to_SPRITE_REG_t is
  begin
    return ('0', '0', '0', (others => '0'), (others => '0'));
  end function NULL_TO_SPRITE_REG;

  function NULL_TO_SPRITE_CTL return to_SPRITE_CTL_t is
  begin
    return ('0', (others => '0'));
  end function NULL_TO_SPRITE_CTL;

  function flip_row
  (
    row_in      : std_logic_vector;
    flip        : std_logic
  )
  return std_logic_vector is
  
    constant HALF	    : natural := (row_in'length / 2) - 1;

    alias row_in_0    : std_logic_vector(row_in'length-1 downto 0)
                          is row_in;
    variable row_out  : std_logic_vector(row_in_0'range);
    
  begin

    if flip = '0' then
      return row_in;
    else
      for i in 0 to HALF loop
        row_out ((HALF-i)*2+1 downto (HALF-i)*2) := row_in_0(i*2+1 downto i*2);
      end loop;
      return row_out;
    end if;
  
  end flip_row;

  function flip_1
  (
    d_i   : std_logic_vector;
    flip  : std_logic
   )
   return std_logic_vector is
    alias d_i_0   : std_logic_vector(d_i'length-1 downto 0) is d_i;
    variable d_o  : std_logic_vector(d_i_0'range);
   begin
    if flip = '0' then
      return d_i;
    else
      for i in d_i_0'range loop
        d_o(i) := d_i_0(d_i_0'high-i);
      end loop;
      return d_o;
    end if;
   end function flip_1;
    
end package body sprite_pkg;
