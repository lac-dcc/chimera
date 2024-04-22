-----------------------------------------------------
-- ECE 338 -- Assignment 3 -- Eight Bit Calculator --
-- Jason Mobarak -- Fall 2005 -----------------------
-----------------------------------------------------

library IEEE;
library calc;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use calc.operators.all;

entity calculator is 
    port(
        input : in std_logic_vector (0 to 7);
        input_valid : in std_logic;

        output : out std_logic_vector (0 to 7);
        output_valid : out std_logic;

        clk : in std_logic;
        rst : in std_logic
    );
end calculator;

architecture simple of calculator is 

    type calc_state is (
        calc_idle,
        calc_recv_in1,
        calc_recv_op,
        calc_recv_in2,
        --calc_start_operation,
        calc_wait_for_result,
        calc_output_result
    );

    signal rising_clk : std_logic; 

    signal operand_one : std_logic_vector (0 to 7);
    signal operand_two : std_logic_vector (0 to 7);
    signal operator : std_logic_vector (0 to 1);

    signal current_state : calc_state := calc_idle;
    signal next_state : calc_state := calc_idle;

    signal rst_v : std_logic_vector (0 to 3);
    signal done_v : std_logic_vector (0 to 3);
    signal start_v : std_logic_vector (0 to 3);

    signal start_v_sig : std_logic_vector (0 to 3);
    signal rst_v_sig : std_logic_vector (0 to 3);

    type ov is array (0 to 3) of std_logic_vector(0 to 7);
    signal output_v : ov;

    signal output_valid_sig : std_logic;
    signal output_buffer : std_logic_vector(0 to 7);

begin

    output_valid <= output_valid_sig;

    output <= output_buffer when 
        (current_state = calc_output_result) else "00000000";

    output_buffer <=
        output_v(0) when 
            (done_v(0) = '1' and current_state = calc_wait_for_result) else
        output_v(1) when 
            (done_v(1) = '1' and current_state = calc_wait_for_result) else
        output_v(2) when 
            (done_v(2) = '1' and current_state = calc_wait_for_result) else
        output_v(3) when 
            (done_v(3) = '1' and current_state = calc_wait_for_result);
         
    add_comp : add port map(
        in1 => operand_one,
        in2 => operand_two,
        rst => rst_v(0),
        clk => clk,
        start => start_v(0),
        done => done_v(0),
        output => output_v(0)
    );

    subtract_comp : subtract port map(
        in1 => operand_one,
        in2 => operand_two,
        rst => rst_v(1),
        clk => clk,
        start => start_v(1),
        done => done_v(1),
        output => output_v(1)
    );
 
    multiply_comp : multiply port map(
        in1 => operand_one,
        in2 => operand_two,
        rst => rst_v(2),
        clk => clk,
        start => start_v(2),
        done => done_v(2),
        output => output_v(2)
    );
   
    divide_comp : divide port map(
        in1 => operand_one,
        in2 => operand_two,
        rst => rst_v(3),
        clk => clk,
        start => start_v(3),
        done => done_v(3),
        output => output_v(3)
    );

    clocking : process (clk, rst) 
    begin
        if (rising_edge(clk)) then
            rising_clk <= '1';
            if (rst = '1') then
                current_state <= calc_idle;
            else
                current_state <= next_state;
            end if;
        else
            rising_clk <= '0';
        end if;
    end process;

    output_valid_sig <= '1' when (current_state = calc_output_result) else '0';
    start_v <= start_v_sig when (current_state = calc_recv_in2) else "0000";
    rst_v <= 
        rst_v_sig when 
            ((current_state = calc_recv_in2) or
             (current_state = calc_wait_for_result) or
             (current_state = calc_output_result))
        else "1111";

    calc_fsm : process (current_state, input_valid, done_v) 
    begin
        case current_state is
        when calc_idle =>
            if (rising_edge(input_valid)) then
                operand_one <= input;
                next_state <= calc_recv_in1;
            else
                next_state <= calc_idle;
            end if;
        when calc_recv_in1 =>
            if (rising_edge(input_valid)) then
                operator <= input(6 to 7);
                next_state <= calc_recv_op;
            else
                next_state <= calc_recv_in1;
            end if;
        when calc_recv_op =>
            if (rising_edge(input_valid)) then
                operand_two <= input;
                next_state <= calc_recv_in2;
            else
                next_state <= calc_recv_op;
            end if;
        when calc_recv_in2 => 
            next_state <= calc_wait_for_result;
            case operator is
            when "00" => 
                start_v_sig <= "1000";
                rst_v_sig <= "0111";
            when "01" =>
                start_v_sig <= "0100";
                rst_v_sig <= "1011";
            when "10" =>
                start_v_sig <= "0010";
                rst_v_sig <= "1101";
            when "11" =>
                start_v_sig <= "0001";
                rst_v_sig <= "1110";
            when others =>
                start_v_sig <= "0000";
                rst_v_sig <= "1111";
            end case;
        when calc_wait_for_result =>
            case operator is
            when "00" => 
                if (done_v(0) = '1') then
                    next_state <= calc_output_result;
                else
                    next_state <= calc_wait_for_result;
                end if;
            when "01" =>
                if (done_v(1) = '1') then
                    next_state <= calc_output_result;
                else
                    next_state <= calc_wait_for_result;
                end if;
            when "10" =>
                if (done_v(2) = '1') then
                    next_state <= calc_output_result;
                else
                    next_state <= calc_wait_for_result;
                end if;
            when "11" =>
                if (done_v(3) = '1') then
                    next_state <= calc_output_result;
                else
                    next_state <= calc_wait_for_result;
                end if;
            when others =>
                next_state <= calc_wait_for_result;
            end case;
        when calc_output_result =>
            next_state <= calc_idle;
        end case;
    end process;

end simple;

-- vim: et:ts=4:sw=4:sts=4:ai:hlsearch:nu:
