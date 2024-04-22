library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package operators is

    component add
        port (
            clk, rst : in std_logic;
            in1, in2 : in std_logic_vector (0 to 7); 
            output : out std_logic_vector (0 to 7);
            start : in std_logic;
            done : out std_logic
        );
    end component;

    component subtract
        port (
            clk, rst : in std_logic;
            in1, in2 : in std_logic_vector (0 to 7); 
            output : out std_logic_vector (0 to 7);
            start : in std_logic;
            done : out std_logic
            --output_valid : out std_logic
        );
    end component;

    component multiply
        port (
            clk, rst : in std_logic;
            in1, in2 : in std_logic_vector (0 to 7); 
            output : out std_logic_vector (0 to 7);
            --output_valid : out std_logic
            start : in std_logic;
            done : out std_logic
        );
    end component;

    component divide
        port (
            clk, rst : in std_logic;
            in1, in2 : in std_logic_vector (0 to 7); 
            output : out std_logic_vector (0 to 7);
            --output_valid : out std_logic
            start : in std_logic;
            done : out std_logic
        );
    end component;

end package operators; 

-- vim: et:ts=4:sw=4:sts=4:ai:hlsearch:nu:
