library ieee;
context ieee.ieee_std_context;

package VGA_screen_pkg is
  generic (
    G_WIDTH  : natural := 640;
    G_HEIGHT : natural := 480
  );

  type screen_t is
    array ( natural range 0 to G_HEIGHT-1,
            natural range 0 to G_WIDTH-1 ) of integer;

  shared variable screen: screen_t;

  -- TODO: pass a fat pointer, so that width and height need not to be passed explicitly
  procedure save_screenshot (
    variable ptr: screen_t;
    width, height: natural;
    id: integer := 0
  );
  attribute foreign of save_screenshot : procedure is "VHPIDIRECT save_screenshot";

  procedure sim_cleanup;
  attribute foreign of sim_cleanup : procedure is "VHPIDIRECT sim_cleanup";

  ---

  function RGB_to_integer (rgb: std_logic_vector(2 downto 0)) return integer;

end VGA_screen_pkg;

package body VGA_screen_pkg is

  procedure save_screenshot (
    variable ptr: screen_t;
    width, height: natural;
    id: integer := 0
  ) is
  begin report "VHPIDIRECT save_screenshot" severity failure;
  end procedure;

  procedure sim_cleanup is
  begin report "VHPIDIRECT sim_cleanup" severity failure;
  end procedure;

  ---

  function RGB_to_integer (rgb: std_logic_vector(2 downto 0)) return integer is
    variable raw24: std_logic_vector(31 downto 0);
  begin
    raw24 := (
      7  downto 0  => rgb(2),
      15 downto 8  => rgb(1),
      23 downto 16 => rgb(0),
         others    => '1'
    );
    return to_integer(signed(raw24));
  end function;

end VGA_screen_pkg;
