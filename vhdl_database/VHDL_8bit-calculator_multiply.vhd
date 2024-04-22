library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity multiply is
    port (
        clk, rst : in std_logic;
        in1, in2 : in std_logic_vector (0 to 7); 
        output : out std_logic_vector (0 to 7);
        start : in std_logic;
        done : out std_logic
    );
end multiply;

architecture multiply_impl of multiply is

    component add16 is
        port (
            clk, rst : in std_logic;
            in1, in2 : in std_logic_vector (0 to 15); 
            output : out std_logic_vector (0 to 15);
            start : in std_logic;
            done : out std_logic
        );
    end component;

    constant zero_v_16 : std_logic_vector := "0000000000000000";
    constant zero_v_8 : std_logic_vector := "00000000";

    signal product_reg : std_logic_vector (0 to 15) := zero_v_16;
    signal shift_reg : std_logic_vector (0 to 15) := zero_v_16;

    signal in1_reg : std_logic_vector (0 to 7);
    signal in2_reg : std_logic_vector (0 to 7);

    signal output_sig : std_logic_vector (0 to 7);
    signal done_sig : std_logic;

    signal shift_level : integer := 0;

    type mult_state is (
        mult_idle, 
        mult_add_start, 
        mult_add_wait, 
        mult_add_done, 
        mult_shift_start, 
        mult_shift, 
        mult_add_iter, 
        mult_done
    );

    signal current_state : mult_state := mult_idle;
    signal next_state : mult_state := mult_idle;

    signal add16_output_sig : std_logic_vector (0 to 15);
    signal start_adding : std_logic;
    signal add_done_sig : std_logic;
    signal add_in1 : std_logic_vector (0 to 15);
    signal add_in2 : std_logic_vector (0 to 15);

    signal rising_clk : std_logic;

    signal xor_oper : std_logic := '0';

begin

    add16_comp : add16 port map(
        clk => clk,
        rst => rst,
        output => add16_output_sig,
        start => start_adding,
        done => add_done_sig,
        in1 => add_in1,
        in2 => add_in2
    );

    output <= output_sig when rst = '0' else zero_v_8;
    done <= done_sig when rst = '0' else '0';

    output_sig <=
        product_reg(8 to 15) when ((current_state = mult_done) and (product_reg(7) = '0')) else
        "11111111" when ((current_state = mult_done) and (product_reg(7) = '1')) else
        zero_v_8;

    done_sig <= 
        '1' when (current_state = mult_done) else
        '0';

    clocking : process (clk, rst) 
    begin
        if (rising_edge(clk)) then
            rising_clk <= '1';
            if (rst = '1') then
                current_state <= mult_idle;
            else
                current_state <= next_state;
            end if;
        else
            rising_clk <= '0';
        end if;
    end process;

    start_adding <= 
        '1' when (current_state = mult_add_start) else 
        '0';

    add_in1 <= 
        product_reg when ((current_state = mult_add_start) or
                          (current_state = mult_add_wait)) else
        zero_v_16;

    add_in2 <= 
        shift_reg when ((current_state = mult_add_start) or
                        (current_state = mult_add_wait)) else
        zero_v_16;

    mult_fsm : process (current_state, start, add_done_sig)
    begin
        case current_state is
        when mult_idle =>
            shift_level <= 0;
            shift_reg   <= zero_v_16;
            product_reg <= zero_v_16;
            if (rising_edge(start)) then
                in1_reg <= in1;
                in2_reg <= in2;
                next_state <= mult_add_start;
            else
                next_state <= mult_idle;
            end if;
        when mult_add_start =>
            next_state <= mult_add_wait;
        when mult_add_wait =>
            if (rising_edge(add_done_sig)) then
                next_state <= mult_add_done; 
            else
                next_state <= mult_add_wait;
            end if;
        when mult_add_done =>
            next_state <= mult_shift_start;
            product_reg <= add16_output_sig;
            xor_oper <= in2_reg(7 - shift_level);
        when mult_shift_start =>
            shift_reg <= zero_v_16;
            next_state <= mult_shift;
        when mult_shift =>
            for idx in 0 to 7 loop
                 shift_reg (15 - (idx + shift_level)) <= xor_oper and in1_reg(7 - idx);    
            end loop;
            next_state <= mult_add_iter;
        when mult_add_iter =>
            if (shift_level = 7 or shift_level > 7) then
                next_state <= mult_done;
            else
                shift_level <= shift_level + 1;
                next_state <= mult_add_start;
            end if;
        when mult_done =>
            next_state <= mult_idle;
        end case;
    end process;

end multiply_impl;

-- vim: et:ts=4:sw=4:sts=4:ai:hlsearch:nu:
