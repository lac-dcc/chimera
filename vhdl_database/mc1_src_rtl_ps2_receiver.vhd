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
-- This is a very simple PS/2 receiver that receives data from an input device such as a keyboard.
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity ps2_receiver is
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

    -- Deserialized output.
    o_data : out std_logic_vector(7 downto 0);
    o_data_stb : out std_logic
  );
end ps2_receiver;

architecture rtl of ps2_receiver is
  constant C_CLK_DEBOUNCE_COUNT : integer  := CLK_FREQ / 100000;   -- 10 us
  constant C_DATA_DEBOUNCE_COUNT : integer := CLK_FREQ / 1000000;  -- 1 us
  constant C_MAX_IDLE_COUNT : integer      := CLK_FREQ / 18000;    -- 55.6 us
  constant C_FRAME_BITS : integer := 11;

  type STATE_T is (RESEND, IDLE, RECEIVING, DONE);

  signal s_state : STATE_T;
  signal s_ps2_clk_int : std_logic;
  signal s_prev_ps2_clk_int : std_logic;
  signal s_ps2_data_int : std_logic;
  signal s_ps2_frame : std_logic_vector(C_FRAME_BITS-1 downto 0);
  signal s_bit_count : integer range 0 to C_FRAME_BITS;
  signal s_idle_count : integer range 0 to C_MAX_IDLE_COUNT;

  function is_frame_ok(frame : std_logic_vector) return boolean is
    variable v_start_bit : std_logic;
    variable v_parity : std_logic;
    variable v_stop_bit : std_logic;
  begin
    v_start_bit := frame(0);
    v_parity := frame(1) xor frame(2) xor frame(3) xor frame(4) xor
                frame(5) xor frame(6) xor frame(7) xor frame(8) xor frame(9);
    v_stop_bit := frame(10);
    return v_start_bit = '0' and v_parity = '1' and v_stop_bit = '1';
  end function;
begin
  -- Synchronize the PS/2 signals to the system clock domain.
  sync_ps2_clk: entity work.bit_synchronizer
    generic map (
      STEADY_CYCLES => C_CLK_DEBOUNCE_COUNT
    )
    port map (
      i_rst => i_rst,
      i_clk => i_clk,
      i_d => i_ps2_clk,
      o_q => s_ps2_clk_int
    );
  sync_ps2_data: entity work.bit_synchronizer
    generic map (
      STEADY_CYCLES => C_DATA_DEBOUNCE_COUNT
    )
    port map (
      i_rst => i_rst,
      i_clk => i_clk,
      i_d => i_ps2_data,
      o_q => s_ps2_data_int
    );

  -- Deserialize the PS/2 signal.
  process(i_rst, i_clk)
    variable v_ps2_clk_falling_edge : boolean;
  begin
    if i_rst = '1' then
      s_state <= IDLE;
      s_ps2_frame <= (others => '0');
      s_prev_ps2_clk_int <= '0';
      s_idle_count <= 0;
      o_data <= (others => '0');
      o_data_stb <= '0';
    elsif rising_edge(i_clk) then
      -- Detect falling edges on i_ps2_clk.
      v_ps2_clk_falling_edge := (s_ps2_clk_int = '0' and s_prev_ps2_clk_int = '1');
      s_prev_ps2_clk_int <= s_ps2_clk_int;

      -- FSM.
      case s_state is
        when IDLE =>
          o_data_stb <= '0';
          s_idle_count <= 0;
          -- We start receiving on a falling clock edge if we have a start bit (0).
          if v_ps2_clk_falling_edge and s_ps2_data_int = '0' then
            s_ps2_frame <= s_ps2_data_int & s_ps2_frame(10 downto 1);
            -- s_ps2_frame <= "00000000000";
            s_bit_count <= 1;
            s_state <= RECEIVING;
          end if;

        when RECEIVING =>
          if v_ps2_clk_falling_edge then
            -- Shift in a new bit from the left.
            s_ps2_frame <= s_ps2_data_int & s_ps2_frame(10 downto 1);
            s_bit_count <= s_bit_count + 1;
            s_idle_count <= 0;
          elsif s_idle_count = C_MAX_IDLE_COUNT then
            -- We haven't seen new data cycles for some time, so check if we got a complete
            -- and correct data frame.
            if s_bit_count < C_FRAME_BITS then
              -- We don't have all the bits yet, so wait some more (error?).
              s_idle_count <= 0;
            elsif s_bit_count = C_FRAME_BITS and is_frame_ok(s_ps2_frame) then
              s_state <= DONE;
            else
              -- Error!
              s_state <= RESEND;
            end if;
          else
            -- Count the number of cycles since the last falling edge.
            s_idle_count <= s_idle_count + 1;
          end if;

        when DONE =>
          -- Extract the data payload from the frame, and strobe the o_data_stb signal.
          o_data <= s_ps2_frame(8 downto 1);
          o_data_stb <= '1';
          s_state <= IDLE;

        when RESEND =>
          -- TODO(m): Add a resend request.
          o_data_stb <= '0';
          s_state <= IDLE;

        when others =>
          o_data_stb <= '0';
          s_state <= IDLE;
      end case;
    end if;
  end process;
end rtl;
