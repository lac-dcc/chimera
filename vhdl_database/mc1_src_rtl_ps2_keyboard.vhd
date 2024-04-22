----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 Marcus Geelnard
--
-- This software is provided 'as-is', without any express or implied warranty. In no event will the
-- authors be held liable for any damages arising from the use of this software.
--
-- Permission is granted to anyone to use this software for any purpose, including commercial
-- applications, and to alter it and redistribute it freely, subject to the following restrictions:
--
--  1. The origin of this software must not be misrepresented; you must not claim that you wrote
--     the original software. If you use this software in a product, an acknowledgment in the
--     product documentation would be appreciated but is not required.
--
--  2. Altered source versions must be plainly marked as such, and must not be misrepresented as
--     being the original software.
--
--  3. This notice may not be removed or altered from any source distribution.
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- This is a PS/2 keyboard interface.
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity ps2_keyboard is
  generic(
    CLK_FREQ : integer -- System clock frequency in Hz.
  );
  port(
    -- System (CPU) control signals.
    i_rst : in std_logic;
    i_clk : in std_logic;

    -- PS/2 bus signals.
    i_ps2_clk : in std_logic;
    i_ps2_data : in std_logic;

    -- Keyboard output.
    o_scancode : out std_logic_vector(8 downto 0);
    o_press : out std_logic;
    o_stb : out std_logic
  );
end ps2_keyboard;

architecture rtl of ps2_keyboard is
  type STATE_T is (RESET, WAITING, LONGCODE, BREAK, DONE);

  signal s_data : std_logic_vector(7 downto 0);
  signal s_data_stb : std_logic;

  signal s_state : STATE_T;
  signal s_is_break : std_logic;
  signal s_is_long : std_logic;
  signal s_scancode : std_logic_vector(7 downto 0);
begin
  -- Instantiate the PS/2 interface.
  ps2_if: entity work.ps2_receiver
    generic map (
      CLK_FREQ => CLK_FREQ
    )
    port map (
      i_rst => i_rst,
      i_clk => i_clk,
      i_ps2_clk => i_ps2_clk,
      i_ps2_data => i_ps2_data,
      o_data => s_data,
      o_data_stb => s_data_stb
    );

  -- Collect key scancode events.
  process(i_rst, i_clk)
  begin
    if i_rst = '1' then
      s_state <= RESET;
      s_is_break <= '0';
      s_is_long <= '0';
      s_scancode <= (others => '0');
      o_scancode <= (others => '0');
      o_press <= '0';
      o_stb <= '0';
    elsif rising_edge(i_clk) then
      -- FSM.
      case s_state is
        when RESET =>
          -- TODO(m): Add a keyboard reset cycle (e.g. send 0xFF - Reset, 0xED - Set/Reset LEDs).
          o_stb <= '0';
          s_state <= WAITING;

        when WAITING =>
          o_stb <= '0';
          s_is_break <= '0';
          s_is_long <= '0';
          if s_data_stb = '1' then
            s_scancode <= s_data;
            if s_data = x"e0" then
              s_state <= LONGCODE;
            elsif s_data = x"f0" then
              s_state <= BREAK;
            else
              s_state <= DONE;
            end if;
          end if;

        when LONGCODE =>
          s_is_long <= '1';
          if s_data_stb = '1' then
            s_scancode <= s_data;
            if s_data = x"f0" then
              s_state <= BREAK;
            else
              s_state <= DONE;
            end if;
          end if;

        when BREAK =>
          s_is_break <= '1';
          if s_data_stb = '1' then
            s_scancode <= s_data;
            s_state <= DONE;
          end if;

        when DONE =>
          o_scancode <= s_is_long & s_scancode;
          o_press <= not s_is_break;
          o_stb <= '1';
          s_state <= WAITING;

        when others =>
          o_stb <= '0';
          s_state <= WAITING;
      end case;
    end if;
  end process;
end rtl;
