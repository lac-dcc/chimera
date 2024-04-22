library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

package MAX7219_Pack is

    constant MAX7219BitsPerDigit   : positive := 4;
    constant MAX7219CommandRegSize : positive := 16;

    type MAX7219ConfigIntensity_t is array (natural range <>) of integer range 0 to 15;

    component MAX7219
        generic (
            Devices   : positive; -- Number of devices cascade connected
            Intensity : MAX7219ConfigIntensity_t
        );
        port (
            clk         : in std_logic;
            reset_n     : in std_logic;
            data_vector : in std_logic_vector;
            clk_out     : out std_logic;
            data_out    : out std_logic;
            load_out    : out std_logic
        );
    end component;

    function hex2segment(hex : std_logic_vector(3 downto 0)) return std_logic_vector;

end;

package body MAX7219_Pack is

    function hex2segment(hex : std_logic_vector(3 downto 0)) return std_logic_vector is
    begin
        case hex is
                -- +----+----+----+----+----+----+----+----+
                -- | D7 | D6 | D5 | D4 | D3 | D2 | D1 | D0 |
                -- +----+----+----+----+----+----+----+----+
                -- | DP | A  | B  | C  | D  | E  | F  | G  |
                -- +----+----+----+----+----+----+----+----+
            when "0000" => return("01111110"); -- 0
            when "0001" => return("00110000"); -- 1
            when "0010" => return("01101101"); -- 2
            when "0011" => return("01111001"); -- 3
            when "0100" => return("00110011"); -- 4
            when "0101" => return("01011011"); -- 5
            when "0110" => return("01011111"); -- 6
            when "0111" => return("01110000"); -- 7
            when "1000" => return("01111111"); -- 8
            when "1001" => return("01111011"); -- 9
            when "1010" => return("01111101"); -- a
            when "1011" => return("00011111"); -- b
            when "1100" => return("00001101"); -- c
            when "1101" => return("00111101"); -- d
            when "1110" => return("01001111"); -- E
            when "1111" => return("01000111"); -- F
            when others => return("10000000"); -- .
        end case;
    end hex2segment;

end package body MAX7219_Pack;