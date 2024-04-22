library ieee;
use ieee.std_logic_1164.all;
-- use  IEEE.STD_LOGIC_ARITH.all;
-- use  IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity vga_controller is
  generic(
    h_pulse      : integer   := 120;
    h_backporch  : integer   := 64;
    h_pixels     : integer   := 800;
    h_frontporch : integer   := 56;
    h_syncpol    : std_logic := '1';

    v_pulse      : integer   := 6;
    v_backporch  : integer   := 23;
    v_pixels     : integer   := 600;
    v_frontporch : integer   := 37;
    v_syncpol    : std_logic := '1'
    );
  port(
    n_reset  : in std_logic;
    pixelClk : in std_logic;            -- pixel clock (50MHz)

    disp_enable : out std_logic;
    column      : out unsigned(9 downto 0);
    row         : out unsigned(9 downto 0);

    frame_start : out std_logic := '0';
    row_start   : out std_logic := '0';

    hSync : out std_logic;
    vSync : out std_logic
    );

end vga_controller;

architecture behavior of vga_controller is
  constant horiz_period : integer := h_pulse + h_pixels + h_backporch + h_frontporch;
  constant vert_period  : integer := v_pulse + v_pixels + v_backporch + v_frontporch;
begin

  process(pixelClk, n_reset)
    variable h_count : integer range 0 to horiz_period := 0;
    variable v_count : integer range 0 to vert_period  := 0;

  begin

    if(n_reset = '0') then
      h_count := 0;
      v_count := 0;

      hSync <= not h_syncpol;
      vSync <= not v_syncpol;

      disp_enable <= '0';
      column      <= "0000000000";
      row         <= "0000000000";

    elsif(rising_edge(pixelClk)) then

      -- handle coordinate counters
      if(h_count < horiz_period) then
        h_count := h_count + 1;
      else
        h_count := 0;

        if(v_count < vert_period) then
          v_count := v_count + 1;
        else
          v_count := 0;
        end if;
      end if;

      if(h_count < h_pixels + h_frontporch or h_count > h_pixels + h_frontporch + h_pulse) then
        hSync <= not h_syncpol;
      else
        hSync <= h_syncpol;
      end if;

      if(v_count < v_pixels + v_frontporch or v_count > v_pixels + v_frontporch + v_pulse) then
        vSync <= not v_syncpol;
      else
        vSync <= v_syncpol;
      end if;

      if(h_count < h_pixels) then
        column <= to_unsigned(h_count, 10);
      end if;

      if(v_count < v_pixels) then
        row <= to_unsigned(v_count, 10);
      end if;

      if(h_count < h_pixels and v_count < v_pixels) then
        disp_enable <= '1';

        if (h_count = 0 and v_count = 0) then
          frame_start <= '1';
        else
          frame_start <= '0';
        end if;

        if (h_count = 0) then
          row_start <= '1';
        else
          row_start <= '0';
        end if;
      else
        disp_enable <= '0';
      end if;

    end if;

  end process;

end behavior;
