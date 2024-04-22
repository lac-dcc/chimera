library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity subtract is
    port (
        clk, rst : in std_logic;
        in1, in2 : in std_logic_vector (0 to 7); 
        output : out std_logic_vector (0 to 7);
        start : in std_logic;
        done : out std_logic
    );
end subtract;

architecture subtract_impl of subtract is

    component one_bit_subtractor is 
        port(
            x, y, b_in : in std_logic; 
            d, b_out : out std_logic
        );
    end component;

    signal borrow_bus : std_logic_vector (0 to 7);
    signal output_sig : std_logic_vector (0 to 7);
    signal output_valid_sig : std_logic;
    signal clk_count : integer := 0;

begin

    output <= 
        output_sig when (rst = '0' and borrow_bus(0) = '0') else
        "00000000";
    done <= output_valid_sig when rst = '0' else '0';
    output_valid_sig <= '1' when clk_count = 8 else '0';

    sub_first : one_bit_subtractor port map(
        x => in1(7),
        y => in2(7),
        b_in => '0',
        d => output_sig(7),
        b_out => borrow_bus(7)
    );

    subgen : for x in 0 to 6 generate 
        subber : one_bit_subtractor port map(
            x => in1(x),
            y => in2(x),
            d => output_sig(x),
            b_in => borrow_bus(x + 1),
            b_out => borrow_bus(x)
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

end subtract_impl;

-- vim: et:ts=4:sw=4:sts=4:ai:hlsearch:nu:
