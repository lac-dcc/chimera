-- lane_sobel.vhd
--
-- lane detection algorithm
-- storage of 3x3 image region and calculation with Sobel filter
--
-- FPGA Vision Remote Lab http://h-brs.de/fpga-vision-lab
-- (c) Marco Winzker, Hochschule Bonn-Rhein-Sieg, 03.01.2018

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity lane_sobel is
  port (clk      : in  std_logic;
        reset    : in  std_logic;
        de_in    : in  std_logic;
        data_in  : in  std_logic_vector(23 downto 0);
        data_out : out std_logic_vector(23 downto 0));
end lane_sobel;

architecture behave of lane_sobel is


  signal tap_lt, tap_ct, tap_rt,
         tap_lc, tap_cc, tap_rc,
         tap_lb, tap_cb, tap_rb : std_logic_vector(23 downto 0);
            -- 3x3 image region
            --     Y->           (left)    (center)    (right)
            --   X      (top)    tap_lt     tap_ct     tap_rt
            --   |   (center)    tap_lc     tap_cc     tap_rc
            --   v   (bottom)    tap_lb     tap_cb     tap_rb
  signal g_x_2, g_y_2           : integer range 0 to 268435456;
  signal g_sum_2                : integer range 0 to 262143;

  signal g2_limit   : std_logic_vector(12 downto 0);
  signal lum_new    : std_logic_vector(7 downto 0);


begin

  -- current input pixel is right-bottom (rb)
  tap_rb <= data_in;

  -- two line memories: output is right-center (rc) and right-top (rt)
  mem_0 : entity work.lane_linemem
    port map (clk      => clk,
              reset    => reset,
              write_en => de_in,
              data_in  => tap_rb,
              data_out => tap_rc);
  mem_1 : entity work.lane_linemem
    port map (clk      => clk,
              reset    => reset,
              write_en => de_in,
              data_in  => tap_rc,
              data_out => tap_rt);

  process
  begin
    wait until rising_edge(clk);
    -- delay each line by two clock cycles:
    --    previous value of right pixel is now center pixel
    --    previous value of center pixel is now left pixel
    tap_ct <= tap_rt;
    tap_lt <= tap_ct;
    tap_cc <= tap_rc;
    tap_lc <= tap_cc;
    tap_cb <= tap_rb;
    tap_lb <= tap_cb;
  end process;

-- horizontal and vertical sobel matrix and square of G
  g_x : entity work.lane_g_matrix
    port map (clk      => clk,
              reset    => reset,
              in_p1a   => tap_rt,
              in_p2    => tap_rc,
              in_p1b   => tap_rb,
              in_m1a   => tap_lt,
              in_m2    => tap_lc,
              in_m1b   => tap_lb,
              data_out => g_x_2);

  g_y : entity work.lane_g_matrix
    port map (clk      => clk,
              reset    => reset,
              in_p1a   => tap_lt,
              in_p2    => tap_ct,
              in_p1b   => tap_rt,
              in_m1a   => tap_lb,
              in_m2    => tap_cb,
              in_m1b   => tap_rb,
              data_out => g_y_2);

  process

  begin
    wait until rising_edge(clk);
    -- adding the values of horizontal and vertical sobel matrix
    g_sum_2 <= (g_x_2 + g_y_2)/8192;

    -- limiting and invoking ROM for square-root
    if (g_sum_2 > 8191) then
      g2_limit <= (others => '1');
    else
      g2_limit <= std_logic_vector(to_unsigned(g_sum_2, 13));
    end if;
  end process;

  square_root : entity work.lane_g_root_IP  -- 255 minus square-root of 8*g_sum_2
    port map (clock   => clk,
              address => g2_limit,
              q       => lum_new);

  -- set new luminance for red, green, blue
  data_out <= lum_new & lum_new & lum_new;

end behave;
