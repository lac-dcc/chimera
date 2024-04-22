library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.defines.all;
use work.hdmi_definitions.all;

entity video_timing_generator is

    port
        ( clock    : in  std_logic
        ; reset    : in  std_logic
        ; launch   : in  std_logic
        ; control  : out  video_control_t
        );

end video_timing_generator;


-- This architecture has been hard-coded with a minimal
-- data-with for the counters. An increase is nessesary
-- if it is be used with a larger framesize.
architecture Behavioral of video_timing_generator is

    signal h_count : unsigned(9 downto 0) := (others => '0');
    signal v_count : unsigned(8 downto 0) := (others => '0');

    signal zero_counter : std_logic := '1';

    constant video_mode : video_mode_t := video_640x480_60Hz;

begin

    launch_proc:
        process (clock) begin
            if rising_edge(clock) then
                if reset = '1' then
                    zero_counter <= '1';
                else
                    if launch = '1' then
                        zero_counter <= '0';
                    end if;
                end if;
            end if;
        end process;

    blank:
        process (v_count, h_count) begin
            control.blank <= '0';

            if (h_count >= video_mode.h.resolution
            or v_count >= video_mode.v.resolution)
            then
                control.blank <= '1';
            end if;
        end process;

    hsync:
        process (h_count) begin
            control.hsync <= not video_mode.h.sync.active;
            if video_mode.h.sync.start <= h_count and h_count < video_mode.h.sync.stop then
                control.hsync <= video_mode.h.sync.active;
            end if;
        end process;

    vsync:
        process (v_count) begin
            control.vsync <= not video_mode.v.sync.active;
            if video_mode.v.sync.start <= v_count and v_count < video_mode.v.sync.stop then
                control.vsync <= video_mode.v.sync.active;
            end if;
        end process;

    counter:
        process (clock) begin
            if rising_edge(clock) then
                h_count <= h_count + 1;
                if h_count = video_mode.h.total or zero_counter = '1' then
                    h_count <= to_unsigned(0, 10);
                    v_count <= v_count + 1;
                end if;
                if v_count = video_mode.v.total or zero_counter = '1' then
                    v_count <= to_unsigned(0, 9);
                end if;
            end if;
        end process;

end Behavioral;
