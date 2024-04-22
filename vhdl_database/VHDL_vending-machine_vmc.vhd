-- Vending Machine Controller

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
--use IEEE.std_logic_arith.all;

entity vmc is 
    port(
        in_a, in_b, in_c, 
        in_d, in_e, in_f  : in std_logic;

        in_0, in_1, in_2,
        in_3, in_4, in_5,
        in_6, in_7, in_8,
        in_9              : in std_logic;

        clk, rst, 
        coin_return       : in std_logic;

        nickle_in, 
        dime_in,
        quarter_in        : in std_logic;

        vend,
        nickle_out,    
        dime_out,       
        quarter_out       : out std_logic;

        selection_out     : out std_logic_vector (0 to 5)
        );
end vmc;

architecture simple of vmc is 
 
    type sel_state    is 
        (dump_everything,
         reset_stuff, 
         need_number, 
         need_letter, 
         sel_done, 
         need_change, 
         sel_ok);

    type price_mem     is array(0 to 59) of integer;
    type selection_mem is array(0 to 1) of integer;

    signal sel_st_ns         : sel_state     := need_letter;
    signal sel_st_ps         : sel_state     := need_letter;

    signal change_need       : integer       := 0;
    signal give_change       : std_logic     := '0';

    signal selection         : selection_mem := (0, 0);
    signal is_number         : std_logic     := '0';
    signal coin_in           : std_logic     := '0';
    signal change_given      : integer       := 0;
    signal current_payment   : integer       := 0;
    signal current_coin      : integer       := 0;
    signal selection_price   : integer       := 0;
    signal selection_idx     : integer       := 0;

    signal return_coin_q     : std_logic     := '0';
    signal return_coin_d     : std_logic     := '0';
    signal return_coin_n     : std_logic     := '0';

    signal incr_payment      : std_logic     := '0';
    signal reset_payment     : std_logic     := '0';

    signal have_input        : std_logic     := '0';

    constant price_list : price_mem := (
        95,  40,  80, 100,  -- AO -- A1 -- A2 -- A3
        90, 100,  45,  50,  -- A4 -- A5 -- A6 -- A7
        60,  15,   5,  70,  -- A8 -- A9 -- B0 -- B1
        75,  55,  75,  60,  -- B2 -- B3 -- B4 -- B5
        90,  40,  40,  90,  -- B6 -- B7 -- B8 -- B9
        60,  30,  90,  15,  -- C0 -- C1 -- C2 -- C3
        90,  90,  10,  10,  -- C4 -- C5 -- C6 -- C7
        45,  10,  70,  95,  -- C8 -- C9 -- D0 -- D1
        70,  45,   5,  90,  -- D2 -- D3 -- D4 -- D5
        90,  10,  85,  70,  -- D6 -- D7 -- D8 -- D9
        30,  65,  90,  15,  -- E0 -- E1 -- E2 -- E3
        90, 100,  65,  90,  -- E4 -- E5 -- E6 -- E7
        45,  30,  85,  40,  -- E8 -- E9 -- F0 -- F1
        40,  10,  20,  35,  -- F2 -- F3 -- F4 -- F5
        40,  75,  65,  40   -- F6 -- F7 -- F8 -- F9
    );

    signal rising_clk : std_logic;

    begin

    change_on_rising_edge : process (clk, rst) 
    begin
        --if (rising_edge(clk)) then
        if (rising_edge(clk)) then
            rising_clk <= '1';
            if (rst = '1') then
                sel_st_ps     <= reset_stuff;
            else
                sel_st_ps     <= sel_st_ns;
            end if;
        else
            rising_clk <= '0';
        end if;
    end process;

    main_state_machine : process (rising_clk, coin_return, is_number, sel_st_ps)
    begin
        if (rising_clk = '1') then
            reset_payment <= '0';
            if (coin_return = '1') then
                sel_st_ns   <= dump_everything; 
                change_need <= current_payment;
            else
                case sel_st_ps is
                when dump_everything => 
                    if (change_given < change_need) then
                        give_change <= '1';
                        sel_st_ns   <= dump_everything;
                    else
                        sel_st_ns     <= need_letter;
                        give_change   <= '0';
                        reset_payment <= '1';
                    end if;
                when reset_stuff =>
                    give_change   <= '0';
                    reset_payment <= '1';
                    sel_st_ns     <= need_letter; 
                when need_letter => 
                    if (have_input = '1') then
                        if (is_number = '1') then
                            sel_st_ns <= need_letter;
                        else
                            sel_st_ns <= need_number;
                        end if;
                    else
                        sel_st_ns <= need_letter;
                    end if;
                when need_number =>
                    if (is_number = '1') then
                        sel_st_ns <= sel_done;
                    else
                        sel_st_ns <= need_number;
                    end if;
                when sel_done =>
                    if ((current_payment > selection_price) or 
                        (current_payment = selection_price)) 
                    then
                        change_need   <= current_payment - selection_price;
                        sel_st_ns     <= need_change;
                    else
                        sel_st_ns <= sel_done;
                    end if;
                when need_change => 
                    if (change_given < change_need) then
                        give_change   <= '1';
                    else
                        sel_st_ns     <= sel_ok;
                        give_change   <= '0';
                        reset_payment <= '1';
                    end if;
                when others =>
                    sel_st_ns <= need_letter;
                end case;
            end if;
        end if;
    end process;

    decode_selection : process
        (clk, in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8, in_9,
         in_a, in_b, in_c, in_d, in_e, in_f)

    variable idx : integer;
    
    begin
        have_input <= '1';
        if (in_0 = '1' or in_1 = '1' or in_2 = '1' or 
            in_3 = '1' or in_4 = '1' or in_5 = '1' or 
            in_6 = '1' or in_7 = '1' or in_8 = '1' or 
            in_9 = '1')
        then
            is_number    <= '1';
        elsif (in_a = '1' or in_b = '1' or in_c = '1' or 
               in_d = '1' or in_e = '1' or in_f = '1')
        then
            is_number    <= '0';
        else
            is_number    <= '0';
        end if;

        if    (in_0 = '1') then 
            selection(0) <= 0;
        elsif (in_1 = '1') then 
            selection(0) <= 1;
        elsif (in_2= '1') then 
            selection(0) <= 2;
        elsif (in_3 = '1') then 
            selection(0) <= 3;
        elsif (in_4 = '1') then 
            selection(0) <= 4;
        elsif (in_5 = '1') then 
            selection(0) <= 5;
        elsif (in_6 = '1') then 
            selection(0) <= 6;
        elsif (in_7 = '1') then 
            selection(0) <= 7;
        elsif (in_8 = '1') then 
            selection(0) <= 8;
        elsif (in_9 = '1') then 
            selection(0) <= 9;
        elsif (in_a = '1') then 
            selection(1) <= 0;
        elsif (in_b = '1') then 
            selection(1) <= 1;
        elsif (in_c = '1') then 
            selection(1) <= 2;
        elsif (in_d = '1') then 
            selection(1) <= 3;
        elsif (in_e = '1') then 
            selection(1) <= 4;
        elsif (in_f = '1') then 
            selection(1) <= 5;
        else
            have_input   <= '0';
            --selection(0) <= 0;
            --selection(1) <= 0;
        end if;
        idx := (selection(1) * 10) + selection(0);
        selection_idx   <= idx;
        selection_price <= price_list(idx);
    end process;

    handle_payment : process (incr_payment, reset_payment) 
    begin
        if (incr_payment = '1') then
            current_payment <= current_payment + current_coin;
        elsif (reset_payment = '1') then
            current_payment <= 0;
        end if;
    end process;

    incr_pay_mon : process (rising_clk, coin_in)
    begin
        if (rising_clk = '1') then
            if (coin_in = '1') then
                incr_payment <= '1';
            else
                incr_payment <= '0';
            end if;
        else
            incr_payment <= '0';
        end if;
    end process;

    decode_coin : process (nickle_in, dime_in, quarter_in)
    begin
        if (nickle_in  = '1'  or 
            dime_in    = '1'  or 
            quarter_in = '1') 
        then
            coin_in <= '1';
        else
            coin_in <= '0';
        end if;
        if    (nickle_in  = '1') then current_coin <=  5;
        elsif (dime_in    = '1') then current_coin <= 10;
        elsif (quarter_in = '1') then current_coin <= 25;
        else
            current_coin <= 0;
        end if;
        if ((current_payment + current_coin) > 100) then
            if    (nickle_in  = '1') then 
                return_coin_n <= '1';
            else
                return_coin_n <= '0';
            end if;
            if (dime_in    = '1') then 
                return_coin_d <= '1';
            else
                return_coin_d <= '0';
            end if;
            if (quarter_in = '1') then 
                return_coin_q <= '1';
            else
                return_coin_q <= '0';
            end if;
        end if;
    end process;

    vend_product : process (sel_st_ps) 
    begin
        case sel_st_ps is
        when sel_ok =>
            selection_out <= 
                std_logic_vector(to_unsigned(selection_idx, 6));
            vend          <= '1';
        when others =>    
            selection_out <= "000000";
            vend          <= '0';
        end case;
    end process;

    pulse_change : process (rising_clk, give_change, return_coin_q, return_coin_n, return_coin_d) 
    begin
        if (rising_clk = '1') then
            quarter_out  <= '0';
            dime_out     <= '0';
            nickle_out   <= '0';
            if (give_change = '1') then
                if ((change_given + 25) <= change_need) then
                    change_given <= change_given + 25;
                    quarter_out  <= '1';
                elsif ((change_given + 10) <= change_need) then
                    change_given <= change_given + 10;
                    dime_out     <= '1';
                elsif ((change_given + 5) <= change_need) then
                    change_given <= change_given + 5;
                    nickle_out   <= '1';
                end if;
            elsif (return_coin_d = '1' or return_coin_q = '1' or return_coin_d = '1') then
                if    (return_coin_q = '1') then
                    quarter_out  <= '1';
                elsif (return_coin_d = '1') then
                    dime_out     <= '1';
                elsif (return_coin_n = '1') then
                    nickle_out   <= '1';
                end if;
            elsif (give_change = '0') then
                change_given <= 0;
            end if;
        end if;
    end process;
 
end simple; 

-- vim: et:ts=4:sw=4:sts=4:ai:hlsearch:nu:
