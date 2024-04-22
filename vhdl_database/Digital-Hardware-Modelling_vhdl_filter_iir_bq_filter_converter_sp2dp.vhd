library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity filter_converter_sp2dp is
    port
    (
        float                   : in  std_logic_vector( 33 downto 0 );
        double                  : out std_logic_vector( 65 downto 0 )
    );
end filter_converter_sp2dp;


architecture behaviour of filter_converter_sp2dp is
    
begin
    
    -- FloPoCo Control bits
    double( 65 downto 64 )     <= float( 33 downto 32 );
    
    -- sign
    double( 63 downto 63 )     <= float( 31 downto 31 );
    
    -- exponent
    double( 62 )               <= float( 30 );
    double( 61 )               <= not float( 30 );
    double( 60 )               <= not float( 30 );
    double( 59 )               <= not float( 30 );
    
    double( 58 downto 52 )     <= float( 29 downto 23 );
    
    -- mantissa
    double( 51 downto 0 )      <= float( 22 downto 0 ) & "00000000000000000000000000000";

end behaviour;
