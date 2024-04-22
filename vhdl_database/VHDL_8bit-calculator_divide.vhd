library IEEE;

use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_1164.all;
--use IEEE.numeric_std.all;

entity divide is
    port (
        clk, rst : in std_logic;
        in1, in2 : in std_logic_vector (0 to 7); 
        output : out std_logic_vector (0 to 7);
        start : in std_logic;
        done : out std_logic
    );
end divide;

architecture divide_impl of divide is

    component subtract is
        port (
            clk, rst : in std_logic;
            in1, in2 : in std_logic_vector (0 to 7); 
            output : out std_logic_vector (0 to 7);
            start : in std_logic;
            done : out std_logic
        );
    end component;

    constant zero_v_8 : std_logic_vector := "00000000";

    signal in1_reg : std_logic_vector (0 to 7);
    signal in2_reg : std_logic_vector (0 to 7);

    signal shift_reg : std_logic_vector (0 to 8) := "000000000";

    signal remainder : std_logic_vector (0 to 7) := zero_v_8;
    signal output_reg : std_logic_vector (0 to 7) := zero_v_8;
    signal done_sig : std_logic;

    signal shift_level : integer := 0;
    signal num_length : integer := 0;

    type div_state is (
        div_idle,
        div_zero_result,
        div_ini_shift,
        div_check_shift,
        div_adj_shift,
        div_push_result,
        div_wait_for_sub,
        div_sub_done,
        div_zeros,
        div_shift,
        div_done
    );

    signal current_state : div_state := div_idle;
    signal next_state : div_state := div_idle;

    signal sub_output_sig : std_logic_vector (0 to 7);
    signal start_subtracting : std_logic;

    signal sub_done_sig : std_logic;
    signal sub_in1 : std_logic_vector (0 to 7);
    signal sub_in2 : std_logic_vector (0 to 7);

    signal rising_clk : std_logic;
    signal shift_tmp : std_logic_vector (0 to 8) := "000000000";

begin

    sub_comp : subtract port map(
        clk => clk,
        rst => rst,
        output => sub_output_sig,
        start => start_subtracting,
        done => sub_done_sig,
        in1 => sub_in1,
        in2 => sub_in2
    );

    output <= output_reg when (rst = '0' and current_state = div_done) else zero_v_8;
    done <= done_sig when rst = '0' else '0';

    done_sig <= 
        '1' when (current_state = div_done) else
        '0';

    clocking : process (clk, rst) 
    begin
        if (rising_edge(clk)) then
            rising_clk <= '1';
            if (rst = '1') then
                current_state <= div_idle;
            else
                current_state <= next_state;
            end if;
        else
            rising_clk <= '0';
        end if;
    end process;

    div_fsm : process (current_state, start, sub_done_sig)
    begin
        case current_state is
        when div_idle =>
            shift_level <= 0;
            num_length <= 0;
            shift_reg <= "000000000";
            output_reg <= zero_v_8;
            if (rising_edge(start)) then
                in1_reg <= in1;
                in2_reg <= in2;
                shift_reg(1 to 8) <= in2;
                next_state <= div_zero_result;
            else
                next_state <= div_idle;
            end if;
        when div_zero_result =>
            if (in2_reg > in1_reg) then
                output_reg <= zero_v_8;
                next_state <= div_done;
            else
                next_state <= div_ini_shift;
            end if;
        when div_ini_shift =>
            shift_tmp(0 to 7) <= shift_reg(1 to 8);
            shift_tmp(0 to 7) <= shift_reg(1 to 8);
            shift_tmp(8) <= '0';
            next_state <= div_check_shift;
            shift_level <= shift_level + 1;
        when div_check_shift =>
            if (shift_tmp < in1_reg) then -- and (not (shift_reg = in1_reg))) then
                shift_reg <= shift_tmp;
                next_state <= div_ini_shift;
            else
                remainder <= in1_reg;
                next_state <= div_adj_shift;
            end if;
        when div_adj_shift =>
            shift_level <= shift_level - 2;
            next_state <= div_push_result;
        when div_push_result =>
            next_state <= div_shift;
            shift_reg(1 to 8) <= shift_reg (0 to 7);
            shift_reg(0) <= '0';
            output_reg(num_length) <= '1';
            num_length <= num_length + 1;
        when div_shift =>
            sub_in1 <= remainder;
            sub_in2 <= shift_reg(1 to 8);
            start_subtracting <= '1';
            next_state <= div_wait_for_sub;
        when div_wait_for_sub =>
            start_subtracting <= '0';
            if (rising_edge(sub_done_sig)) then             
                remainder <= sub_output_sig;
                next_state <= div_sub_done;
            else
                next_state <= div_wait_for_sub;
            end if;
        when div_sub_done =>
            if (shift_level < 0) then
                next_state <= div_done;
            elsif (remainder = shift_reg) then
                next_state <= div_done;
                --output_reg(num_length) <= '1';
                --num_length <= num_length + 1;
            elsif (remainder < shift_reg) then
                shift_reg(1 to 8) <= shift_reg (0 to 7);
                shift_reg(0) <= '0';
                output_reg(num_length) <= '0';
                num_length <= num_length + 1;
                shift_level <= shift_level - 1;
                next_state <= div_zeros;
            elsif (remainder > shift_reg) then
                output_reg(num_length) <= '1';
                num_length <= num_length + 1;
                next_state <= div_shift;
            --elsif (shift_level > 0) then
            --    output_reg(7 - shift_level) <= '1';
            end if;                
        when div_zeros =>
            next_state <= div_sub_done;
        when div_done =>
            next_state <= div_idle;
        end case;        
    end process;

end divide_impl;

-- vim: et:ts=4:sw=4:sts=4:ai:hlsearch:nu:
