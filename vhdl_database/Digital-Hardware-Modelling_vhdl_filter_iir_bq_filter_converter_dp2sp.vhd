library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity filter_converter_dp2sp is
    port
        (
            double : in  std_logic_vector(65 downto 0);
            float  : out std_logic_vector(33 downto 0)
            );
end filter_converter_dp2sp;


architecture behaviour of filter_converter_dp2sp is
    
    signal inf_s : std_logic;
    
begin

    -- infinity if double is too big for float
    inf_s <= '1' when ((double(62 downto 59) /= "1000") and (double(62 downto 59) /= "0111")) else '0';

    -- FloPoCo Control bits
    -- mark as infinity when double is too big for float
    float(33 downto 32) <= "10" when ((double(65 downto 64) = "01") and (inf_s = '1')) else double(65 downto 64);

    -- sign
    float(31) <= double(63);

    -- exponent
    float(30)           <= double(62);
    float(29 downto 23) <= double(58 downto 52);

    -- mantissa (IEEE rounding mode "truncation")
    float(22 downto 0) <= double(51 downto 29);

end behaviour;
