-- (C) 2001-2021 Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions and other 
-- software and tools, and its AMPP partner logic functions, and any output 
-- files from any of the foregoing (including device programming or simulation 
-- files), and any associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License Subscription 
-- Agreement, Intel FPGA IP License Agreement, or other applicable 
-- license agreement, including, without limitation, that your use is for the 
-- sole purpose of programming logic devices manufactured by Intel and sold by 
-- Intel or its authorized distributors.  Please refer to the applicable 
-- agreement for further details.



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
library work;
entity fir_2ch_audio_tb is


    constant FIR_INPUT_FILE_c         : string := "fir_2ch_audio_input.txt";
    constant FIR_OUTPUT_FILE_c        : string := "fir_2ch_audio_output.txt";


    constant PHYSCHANIN_c             : natural := 1;
    constant PHYSCHANOUT_c            : natural := 1;
    constant INWIDTH_c                : natural := 16;
    constant OUTWIDTH_c               : natural := 24;
    constant BANKINWIDTH_c            : natural := 0;
    constant BANKCOUNT_c              : natural := 1;
    constant DATA_WIDTH_c             : natural := (INWIDTH_c+BANKINWIDTH_c) * PHYSCHANIN_c;
    constant OUT_WIDTH_c              : natural := OUTWIDTH_c * PHYSCHANOUT_c;
    constant NUM_OF_CHANNELS_c        : natural := 2;
    constant CHANSPERPHYIN_c          : natural := 2;
    constant CHANSPERPHYOUT_c         : natural := 2;
    constant LOG2_CHANSPERPHYOUT_c    : natural := 1;
    constant TDM_FACTOR_c             : natural := 16;
    constant INVERSE_TDM_FACTOR_c     : natural := 1;
    constant INVALID_CYCLES_c         : natural := 14;
    constant INTERP_FACTOR_c          : natural := 1;
    constant TOTAL_INCHANS_ALLOWED    : natural := PHYSCHANIN_c * CHANSPERPHYIN_c;
    constant TOTAL_OUTCHANS_ALLOWED   : natural := PHYSCHANOUT_c * CHANSPERPHYOUT_c;
    constant NUM_OF_TAPS_c            : natural := 16;
    constant TOTAL_EFF_COEF_c         : natural := 8;
    constant COEFF_BIT_WIDTH_c        : natural := 10;
    constant COEFF_BUS_DATA_WIDTH_c   : natural := 16;
    constant COEFF_BUS_ADDR_WIDTH   : natural := 3;

end entity fir_2ch_audio_tb;


architecture rtl of fir_2ch_audio_tb is


    signal ast_sink_data      : std_logic_vector (DATA_WIDTH_c-1 downto 0) := (others => '0');
    signal ast_source_data    : std_logic_vector (OUT_WIDTH_c-1 downto 0);
    signal ast_sink_error     : std_logic_vector (1 downto 0)              := (others => '0');
    signal ast_source_error   : std_logic_vector (1 downto 0);
    signal ast_sink_valid     : std_logic := '0';
    signal ast_source_valid   : std_logic;
    signal ast_source_ready   : std_logic := '0';
    signal clk                : std_logic := '0';
    signal reset_testbench    : std_logic := '1';
    signal reset_design       : std_logic;
    signal eof                : std_logic;
    signal sink_completed     : std_logic := '0';
    signal ast_sink_ready     : std_logic;

    signal ast_sink_sop       : std_logic := '0';
    signal ast_sink_eop       : std_logic := '0';
    signal ast_sink_sop_tmp   : std_logic := '0';
    signal ast_sink_eop_tmp   : std_logic := '0';

----coef reload ports


    signal ast_source_channel : std_logic_vector (LOG2_CHANSPERPHYOUT_c-1 downto 0);
    signal ast_source_eop     : std_logic;
    signal ast_source_sop     : std_logic;

    signal cnt                : natural range 0 to CHANSPERPHYIN_c;
    signal push_counter       : natural range 0 to CHANSPERPHYIN_c :=0;
    constant tclk             : time := 10 ns;
    constant time_lapse_max   : time := 60 us;
    signal time_lapse         : time;
    signal valid_cycles       : std_logic := '1';



    function div_ceil(a : natural; b : natural) return natural is
        variable res : natural := a/b;
    begin
        if res*b /= a then
            res := res +1;
        end if;
        return res;
    end div_ceil;



    function to_hex (value : in signed) return string is
        constant ne     : integer        := (value'length+3)/4;
        constant NUS    : string(2 downto 1) := (others => ' ');  
        variable pad    : std_logic_vector(0 to (ne*4 - value'length) - 1);
        variable ivalue : std_logic_vector(0 to ne*4 - 1);
        variable result : string(1 to ne);
        variable quad   : std_logic_vector(0 to 3);
    begin
        if value'length < 1 then
            return NUS;
        else
            if value (value'left) = 'Z' then
                pad := (others => 'Z');
            else
                pad := (others => value(value'high));             
            end if;
            ivalue := pad & std_logic_vector (value);
            for i in 0 to ne-1 loop
                quad := To_X01Z(ivalue(4*i to 4*i+3));
                case quad is
                    when x"0"   => result(i+1) := '0';
                    when x"1"   => result(i+1) := '1';
                    when x"2"   => result(i+1) := '2';
                    when x"3"   => result(i+1) := '3';
                    when x"4"   => result(i+1) := '4';
                    when x"5"   => result(i+1) := '5';
                    when x"6"   => result(i+1) := '6';
                    when x"7"   => result(i+1) := '7';
                    when x"8"   => result(i+1) := '8';
                    when x"9"   => result(i+1) := '9';
                    when x"A"   => result(i+1) := 'A';
                    when x"B"   => result(i+1) := 'B';
                    when x"C"   => result(i+1) := 'C';
                    when x"D"   => result(i+1) := 'D';
                    when x"E"   => result(i+1) := 'E';
                    when x"F"   => result(i+1) := 'F';
                    when "ZZZZ" => result(i+1) := 'Z';
                    when others => result(i+1) := 'X';
                end case;
            end loop;
            return result;
        end if;
    end function to_hex;  

begin


DUT : entity work.fir_2ch_audio
port map (
    clk                => clk,
    reset_n            => reset_design,

    ast_sink_data      => ast_sink_data,
    ast_source_data    => ast_source_data,
    ast_sink_valid     => ast_sink_valid,
    ast_source_valid   => ast_source_valid,

    ast_sink_sop       => ast_sink_sop,
    ast_sink_eop       => ast_sink_eop,

    ast_source_sop     => ast_source_sop,
    ast_source_eop     => ast_source_eop,
    ast_source_channel => ast_source_channel,

    ast_sink_error     => ast_sink_error,
    ast_source_error   => ast_source_error
);


-- for example purposes, the ready signal is always asserted.
ast_source_ready <= '1';
ast_sink_ready <= '1';



-- no input error
ast_sink_error <= (others => '0');


-- sop and eop asserted in first and last sample of data
cnt_p : process (clk, reset_testbench)
begin
    if reset_testbench = '0' then
    cnt <= 0;
    elsif rising_edge(clk) then
        if ast_sink_valid = '1' and ast_sink_ready = '1' then
            if cnt = CHANSPERPHYIN_c - 1 then
                cnt <= 0;
            else
                cnt <= cnt + 1;
            end if;
        end if;
    end if;
end process cnt_p;


ast_sink_sop_tmp <= '1' when cnt = 0 else
'0';


ast_sink_eop_tmp <= '1' when cnt = CHANSPERPHYIN_c - 1 else
'0';


ast_sink_sop <= ast_sink_sop_tmp after tclk/4;
ast_sink_eop <= ast_sink_eop_tmp after tclk/4;


-----------------------------------------------------------------------------------------------
-- Read input data from file
-----------------------------------------------------------------------------------------------
source_model : process(clk) is

    file in_file     : text open read_mode is FIR_INPUT_FILE_c;
    variable data_in : integer;
    variable bank_in : integer;
    variable indata  : line;
    variable read_data_completed: integer;
    variable q, j, j_temp       : integer := 0 ;
    variable realInChansCount   : integer ;       
    variable totalInChansCount  : integer ;
    variable idle_cyles         : integer := 0 ;    

    type In_2D is array (PHYSCHANIN_c-1 downto 0, CHANSPERPHYIN_c-1 downto 0) of integer;
    variable arrayIn : In_2D;
    variable arrayBank : In_2D;

    --Debug
    variable my_line : line;

begin
if rising_edge(clk) then


    if(reset_testbench = '0') then
        ast_sink_data  <= std_logic_vector(to_signed(0, DATA_WIDTH_c)) after tclk/4;
        ast_sink_valid <= '0' after tclk/4;
        eof            <= '0';

        realInChansCount := NUM_OF_CHANNELS_c * INVERSE_TDM_FACTOR_c;
        totalInChansCount := TOTAL_INCHANS_ALLOWED;        

    else
        if (sink_completed='0' or eof='0') then
            eof <= '0';
            if( valid_cycles = '1' and ast_sink_ready = '1') then
                if not endfile(in_file) then 
                    if (push_counter=0) then
                        q := 0;      
                        for k in 0 to PHYSCHANIN_c-1 loop
                            -- Super-Sample Rate
                            if (k /= 0) then
                                j := j + INVERSE_TDM_FACTOR_c;
                                if (j > PHYSCHANIN_c - 1) then
                                    j_temp := j_temp + 1;
                                    j := j_temp; 
                                end if;
                            else
                                j := k;  
                            end if;

                            for i in 0 to CHANSPERPHYIN_c-1 loop
                                totalInChansCount := totalInChansCount - 1;

                                if (realInChansCount > 0) then
                                    realInChansCount := realInChansCount - 1;
                                    readline(in_file, indata);
                                    read(indata, data_in);
                                    arrayIn(j,i) := data_in;
                                    if (BANKINWIDTH_c > 0) then
                                        read(indata, bank_in);
                                        arrayBank(j,i) := bank_in;
                                    end if;
                                    ast_sink_valid <= '1' after tclk/4;         

                                    --Debug
                                    --write(my_line, string'(" j = "));
                                    --write(my_line, j);
                                    --write(my_line, string'(" i = "));
                                    --write(my_line, i);
                                    --write(my_line, string'(" Array content = "));
                                    --write(my_line, arrayIn(j,i));               
                                    --writeline(output, my_line);        
                                end if;
                            end loop;

                            if (totalInChansCount = 0) then
                                realInChansCount := NUM_OF_CHANNELS_c * INVERSE_TDM_FACTOR_c;
                                totalInChansCount := TOTAL_INCHANS_ALLOWED;
                            end if;

                    end loop;
                    j_temp := 0;
                    sink_completed <= '0';
                    read_data_completed := 1;
                end if;
            else
                eof <='1';
            end if;

            -- Reorder the input format 
            -- Expected input format by FIR Compiler II
            -- ..., <C2>, <C1>, <C0>, -->
            -- ..., <C5>, <C4>, <C3>, -->
            -- ..., <C8>, <C7>, <C6>, -->

            if (read_data_completed = 1) then

                for p in 0 to PHYSCHANIN_c-1 loop
                    --Debug
                    --write(my_line, string'(" Push input = "));
                    --write(my_line,arrayIn(p,q));               
                    --writeline(output, my_line);              -- write to display                 
                    ast_sink_data(p*(INWIDTH_c+BANKINWIDTH_c)+INWIDTH_c-1 downto (INWIDTH_c+BANKINWIDTH_c)*p) <= std_logic_vector(to_signed(arrayIn(p,q), INWIDTH_c)) after tclk/4;
                    if (BANKINWIDTH_c > 0) then
                        ast_sink_data(p*(INWIDTH_c+BANKINWIDTH_c)+(INWIDTH_c+BANKINWIDTH_c)-1 downto (INWIDTH_c+BANKINWIDTH_c)*p+INWIDTH_c) <= std_logic_vector(to_signed(arrayBank(p,q), BANKINWIDTH_c)) after tclk/4;
                    end if;
                end loop;        
                if ( q < CHANSPERPHYIN_c ) then
                    q := q + 1;
                else           
                    q := 0;
                end if;                                    
                if ( push_counter < CHANSPERPHYIN_c-1 ) then
                    push_counter <= push_counter + 1;
                else           
                    push_counter <= 0;
                    read_data_completed := 0;
                    sink_completed <= '1';

                    --start invalid cycles if needed
                    if ( idle_cyles < INVALID_CYCLES_c ) then
                        valid_cycles <= '0' ;
                    end if;                          

                end if;       

            end if;

            -- End Reordering and sinking data

            else
                if ( idle_cyles < INVALID_CYCLES_c ) then
                    ast_sink_valid <= '0' after tclk/4;
                    idle_cyles := idle_cyles + 1;
                    if ( idle_cyles = INVALID_CYCLES_c ) then
                        valid_cycles <= '1' ;            
                        idle_cyles := 0;
                    end if;
                end if;        
                ast_sink_data  <= ast_sink_data after tclk/4;
            end if;
            else
                eof            <= '1';
                ast_sink_valid <= '0' after tclk/4;
                ast_sink_data  <= std_logic_vector(to_signed(0, DATA_WIDTH_c)) after tclk/4;
            end if;
        end if;
    end if;
end process source_model;

---------------------------------------------------------------------------------------------
-- Write FIR output to file
---------------------------------------------------------------------------------------------

sink_model : process(clk) is
    file ro_file   : text open write_mode is FIR_OUTPUT_FILE_c;
    variable rdata : line;
    variable y,z,z_temp         : integer :=0;    
    variable realOutChansCount  : natural := NUM_OF_CHANNELS_c * INVERSE_TDM_FACTOR_c;
    variable totalOutChansCount : natural := TOTAL_OUTCHANS_ALLOWED;

    type Out_2D is array (CHANSPERPHYOUT_c-1 downto 0, PHYSCHANOUT_c-1 downto 0) of integer;
    variable arrayOut : Out_2D;

begin
    if rising_edge(clk) then
        if(ast_source_valid = '1' and ast_source_ready = '1') then

            -- Expected output format from FIR Compiler II
            --> <C0>, <C1>, <C2>, ...
            --> <C3>, <C4>, <C5>, ...
            --> <C6>, <C7>, <C8>, ...

            for x in 0 to PHYSCHANOUT_c-1 loop
                -- Super-Sample Rate or Interpolation with TDM = 1
                -- only interpolation factor is  needed for super-sample rate test
                if ( PHYSCHANOUT_c > NUM_OF_CHANNELS_c ) then
                    if (x /= 0) then
                        z := z + INVERSE_TDM_FACTOR_c * div_ceil(INTERP_FACTOR_c,TDM_FACTOR_c);
                        if (z > PHYSCHANOUT_c-1) then
                            z_temp := z_temp + 1;
                            z := z_temp;
                        end if;
                    end if;
                else
                    z := x;
                end if;


                arrayOut(y,x) := to_integer(signed(ast_source_data(z*OUTWIDTH_c+OUTWIDTH_c-1 downto OUTWIDTH_c*z)));
            end loop;

            if (y < CHANSPERPHYOUT_c - 1) then
                y := y + 1;
            else
                y := 0;
                z := 0;
                z_temp := 0;

                for n in 0 to PHYSCHANOUT_c-1 loop
                    for m in 0 to CHANSPERPHYOUT_c-1 loop
                        totalOutChansCount := totalOutChansCount - 1;
                        if (realOutChansCount > 0) then
                            if (NUM_OF_CHANNELS_c > PHYSCHANOUT_c) then
                                realOutChansCount := realOutChansCount - 1;
                            end if;

                            write(rdata, arrayOut(m,n));
                            writeline(ro_file, rdata);

                        end if;
                    end loop;
                end loop;
            end if;

            if (totalOutChansCount = 0) then
                realOutChansCount := NUM_OF_CHANNELS_c * INVERSE_TDM_FACTOR_c;
                totalOutChansCount := TOTAL_OUTCHANS_ALLOWED;
            end if;
        end if;
    end if;
end process sink_model;


-------------------------------------------------------------------------------
-- clock generator
-------------------------------------------------------------------------------      
clkgen : process
begin  -- process clkgen
    if eof = '1' and sink_completed = '1' and ast_source_valid = '0' and time_lapse >= time_lapse_max then
        clk <= '0';
        assert FALSE
        report "NOTE: Stimuli ended" severity note;
        wait;
    elsif time_lapse >= time_lapse_max then
        clk <= '0';
        assert FALSE
        report "ERROR: Reached time_lapse_max without activity, probably simulation is stuck!" severity Error;
        wait;      
    else
        clk <= '0';
        wait for tclk/2;
        clk <= '1';
        wait for tclk/2;
    end if;
end process clkgen;

monitor_toggling_activity : process(clk, reset_testbench,
ast_source_data, ast_source_valid)
begin
    if reset_testbench = '0' then
        time_lapse <= 0 ns;
    elsif ast_source_data'event or ast_source_valid'event then
        time_lapse <= 0 ns;
    elsif rising_edge(clk) then
        if time_lapse < time_lapse_max then
            time_lapse <= time_lapse + tclk;
        end if;
    end if;
end process monitor_toggling_activity;

    


-------------------------------------------------------------------------------
-- reset generator
-------------------------------------------------------------------------------
reset_testbench_gen : process
begin  -- process resetgen
    reset_testbench <= '1';
    wait for tclk/4;
    reset_testbench <= '0';
    wait for tclk*2;
    reset_testbench <= '1';
    wait;
end process reset_testbench_gen;


reset_design_gen : process
begin  -- process resetgen
    reset_design <= '1';
    wait for tclk/4;
    reset_design <= '0';
    wait for tclk*2;
    reset_design <= '1';
    wait for tclk*80;
    reset_design <= '1';


    wait for tclk*16*2;
    reset_design <= '1';
    wait;
end process reset_design_gen;


end architecture rtl;


