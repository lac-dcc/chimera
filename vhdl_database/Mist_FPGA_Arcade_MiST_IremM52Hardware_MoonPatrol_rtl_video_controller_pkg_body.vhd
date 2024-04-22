library work;
--use work.pace_pkg.all;

package body video_controller_pkg is

  function NULL_RGB return RGB_t is
  begin
    return (others => (others => '0'));
  end NULL_RGB;

  function NULL_TO_BITMAP_CTL return to_BITMAP_CTL_t is
  begin
    return (others => (others => '0'));
  end NULL_TO_BITMAP_CTL;

  function NULL_TO_TILEMAP_CTL return to_TILEMAP_CTL_t is
  begin
    return ((others => '0'), (others => '0'), (others => '0'));
  end NULL_TO_TILEMAP_CTL;
  
  function NULL_TO_GRAPHICS return to_GRAPHICS_t is
  begin
    return ((others => (others => '0')), 
            (others => (others => '0')), 
            (others => (others => '0')),
            '0', '0', NULL_RGB);
  end NULL_TO_GRAPHICS;

end package body video_controller_pkg;
