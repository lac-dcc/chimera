-- author: Furkan Cayci, 2018
-- description: video pattern generator based on the active areas
--   displays color spectrum

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pattern_generator is
    port(
        clk          : in  std_logic;
        video_active : in  std_logic;
        rgb          : out std_logic_vector(23 downto 0)
    );
end pattern_generator;

architecture rtl of pattern_generator is
    type state_type is (s0, s1, s2, s3, s4, s5);
    signal state : state_type := s0;

    signal r : unsigned(7 downto 0) := (others => '1');
    signal b : unsigned(7 downto 0) := (others => '0');
    signal g : unsigned(7 downto 0) := (others => '0');
begin

    rgb <= std_logic_vector(r & g & b);

    -- color spectrum process
    process(clk) is
    begin
        if rising_edge(clk) then
            if video_active = '1' then
                case state is
                when s0 =>
                    if g = 255 then
                        state <= s1;
                    else
                        g <= g + 1;
                    end if;
                when s1 =>
                    if r = 0 then
                        state <= s2;
                    else
                        r <= r - 1;
                    end if;
                when s2 =>
                    if b = 255 then
                        state <= s3;
                    else
                        b <= b + 1;
                    end if;
                when s3 =>
                    if g = 0 then
                        state <= s4;
                    else
                        g <= g - 1;
                    end if;
                when s4 =>
                    if r = 255 then
                        state <= s5;
                    else
                        r <= r + 1;
                    end if;
                when s5 =>
                    if b = 0 then
                        state <= s0;
                    else
                        b <= b - 1;
                    end if;
                end case;
            else
                r <= (others => '1');
                g <= (others => '0');
                b <= (others => '0');
                state <= s0;
            end if;
        end if;
    end process;

end rtl;
