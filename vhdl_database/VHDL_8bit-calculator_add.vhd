library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity add is
    port (
        clk, rst : in std_logic;
        in1, in2 : in std_logic_vector (0 to 7); 
        output : out std_logic_vector (0 to 7);
        start : in std_logic;
        done : out std_logic
    );
end add;

architecture add_impl of add is
        
    component one_bit_adder is 
        port(
            x, y, c_in : in std_logic; 
            o, c_out : out std_logic
        );
    end component;

    signal carry_bus : std_logic_vector (0 to 7);
    signal output_sig : std_logic_vector (0 to 7);
    signal output_valid_sig : std_logic;
    signal clk_count : integer := 0;

begin

    output <= 
        output_sig when (rst = '0' and carry_bus(0) = '0') else 
        "11111111" when (rst = '0' and carry_bus(0) = '1') else 
        "00000000";
    done <= output_valid_sig when rst = '0' else '0';
    output_valid_sig <= '1' when clk_count = 8 else '0';

    add_last : one_bit_adder port map(
        x => in1(0),
        y => in2(0),
        o => output_sig(0),
        c_in => carry_bus(1),
        c_out => carry_bus(0)
    );

    add_first : one_bit_adder port map(
        x => in1(7),
        y => in2(7),
        c_in => '0',
        o => output_sig(7),
        c_out => carry_bus(7)
    );

    addgen : for x in 1 to 6 generate
        adder : one_bit_adder port map(
            x => in1(x),
            y => in2(x),
            o => output_sig(x),
            c_in => carry_bus(x + 1),
            c_out => carry_bus(x)
        );
    end generate;

    assure_valid : process (start, rst, clk) 
    begin
        if (start = '1') then
            clk_count <= 0;
        elsif (rst = '1') then
            clk_count <= 0;
        else
            clk_count <= clk_count + 1;
        end if;
    end process;

end add_impl;

-- vim: et:ts=4:sw=4:sts=4:ai:hlsearch:nu:
