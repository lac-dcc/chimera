library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.filter_shared_package.all;

entity filter_out_data_controller is
    generic
        (
            BIQUADS       : natural := B;
            MAC_FILTER_CH : natural := MC;    -- MAC operations per channel for Main filter operation
            RMS_CH_EN     : natural := RMS;   -- Enable flag for RMS function.     0-disabled 1- enabled.
            MEAN_CH_EN    : natural := MEAN;  -- Enable flag for MEAN function.    0-disabled 1- enabled.
            CHANNELS      : natural := C
            );

    port
        (
            clk  : in std_logic;
            rstn : in std_logic;

            cnt_mac       : in std_logic_vector(natural(ceil(log2(real(MAC_FILTER_CH+RMS_CH_EN+MEAN_CH_EN))))-1 downto 0);
            cnt_ch        : in std_logic_vector(natural(ceil(log2(real(CHANNELS))))-1 downto 0);
            cnt_delay_mac : in std_logic_vector(natural(ceil(log2(real(MAC_FILTER_CH+RMS_CH_EN+MEAN_CH_EN))))-1 downto 0);
            cnt_delay_ch  : in std_logic_vector(natural(ceil(log2(real(CHANNELS))))-1 downto 0);

            y_input     : in std_logic;
            input_ok    : in std_logic;
            valid_delay : in std_logic;

            y_rdaddr : out Y_ADD_T;
            y_rden   : out std_logic;
            y_wraddr : out Y_ADD_T;
            y_wren   : out std_logic
            );
end filter_out_data_controller;


architecture behaviour_dataflow of filter_out_data_controller is
    constant MAC_BIQUAD : natural := MAC_FILTER_CH/BIQUADS;

    -- Number of y pages required  for given number of biquads:2*BIQUADS+1 
    constant MIN_COUNT : natural := 0;
    constant MAX_COUNT : natural := 2*BIQUADS+1;

    type my_unsigned_array_t is array(0 to MAC_BIQUAD-1) of unsigned(natural(ceil(log2(real(MAX_COUNT+1))))-1 downto 0);    

    signal pagecntr_arr_s                 : my_unsigned_array_t;
    signal mac_cnt_s                      : integer range 0 to MAC_BIQUAD;
    signal cntr_s, newcntr_s, finalcntr_s : unsigned(natural(ceil(log2(real(MAX_COUNT+1))))-1 downto 0);
    signal mod_s                          : std_logic;
    signal page_s                         : unsigned(natural(ceil(log2(real(MAX_COUNT))))-1 downto 0);

    signal y_mod_page_s       : std_logic_vector(natural(ceil(log2(real(MAX_COUNT))))-1 downto 0);  -- log2(2*b+1) downto 0
    signal y_mod_page_delay_s : std_logic_vector(natural(ceil(log2(real(MAX_COUNT))))-1 downto 0);  -- log2(2*b+1) downto 0

    signal enable_s, getnext_y_page_s : std_logic;
    
begin

    process (clk, rstn) is
    begin
        if (rstn = '0') then
            enable_s         <= '0';
            getnext_y_page_s <= '0';
        elsif (clk = '1' and clk'event) then
            enable_s <= '0';

            if (cnt_ch = std_logic_vector(to_unsigned(CHANNELS-2, cnt_ch'length))) then
                -- Donot get new y page for rms and mean value iteration
                if (cnt_mac = std_logic_vector(to_unsigned(MAC_FILTER_CH-1, cnt_mac'length))) then
                    getnext_y_page_s <= '0';
                end if;
                if getnext_y_page_s = '1' then
                    -- enable the y page counter
                    enable_s <= '1';
                end if;
            end if;

            if (cnt_ch = std_logic_vector(to_unsigned(CHANNELS-1, cnt_ch'length))) then
                -- MAC_FILTER_CH + RMS_CH_EN+MEAN_CH_EN(1x RMS, 1x MEAN) mac operations
                if (cnt_mac = std_logic_vector(to_unsigned(MAC_FILTER_CH + RMS_CH_EN+MEAN_CH_EN - 1, cnt_mac'length))) then
                    if (input_ok = '1') then
                        -- get new y page
                        getnext_y_page_s <= '1';
                    end if;
                end if;
            end if;
        end if;
    end process;

    -- Modulous-MAC_BIQUAD counter used for selecting mac operation
    MAC_Counter_Memzing : process (clk, rstn)
    begin
        if rstn = '0' then
            mac_cnt_s <= 0;
        elsif (rising_edge(clk)) then
            if(enable_s = '1') then
                mac_cnt_s <= mac_cnt_s + 1;
                if(mac_cnt_s = MAC_BIQUAD-1) then
                    mac_cnt_s <= 0;
                end if;
            end if;
        end if;
    end process MAC_Counter_Memzing;


    -- Actual page counting(modulous) operation
    Next_Page_Counter : block
    begin
        -- Select a page counter
        cntr_s <= pagecntr_arr_s(mac_cnt_s);

        -- Increment the selected counter
        newcntr_s <= cntr_s + 1;

        -- Modulous operation
        mod_s <= '1' when (newcntr_s = MAX_COUNT) else '0';
        with mod_s select
            finalcntr_s <= newcntr_s when '0',
            to_unsigned(0,finalcntr_s'length) when others;
    end block Next_Page_Counter;


    -- Page counter registers
    Page_Counter_Regs_Memzing : process (clk, rstn)
    begin
        if rstn = '0' then
            -- rstn the five page counters to default values
            pagecntr_arr_s(0) <= to_unsigned(2*BIQUADS,pagecntr_arr_s(0)'length);
            pagecntr_arr_s(1) <= to_unsigned(BIQUADS-1,pagecntr_arr_s(1)'length);
            pagecntr_arr_s(2) <= to_unsigned(2*BIQUADS-1,pagecntr_arr_s(2)'length);
            pagecntr_arr_s(3) <= to_unsigned(MIN_COUNT,pagecntr_arr_s(3)'length);
            pagecntr_arr_s(4) <= to_unsigned(BIQUADS,pagecntr_arr_s(4)'length);
        elsif (rising_edge(clk)) then
            if(enable_s = '1') then
                -- Update selected page counter register
                pagecntr_arr_s(mac_cnt_s) <= finalcntr_s;
            end if;
        end if;
    end process Page_Counter_Regs_Memzing;


    -- Next page based on current mac operation
    page_s <= pagecntr_arr_s(mac_cnt_s);


    Read_Y_Memory : block
    begin
        y_mod_page_s <= std_logic_vector(page_s);
        y_rdaddr     <= std_logic_vector(resize(unsigned(y_mod_page_s) * to_unsigned(CHANNELS,cnt_ch'length), y_rdaddr'length)+ unsigned(cnt_ch));  -- p*C + c
        y_rden       <= not y_input;
    end block Read_Y_Memory;


    Write_Y_Memory : block
    begin
        y_mod_page_delay_s <= std_logic_vector(pagecntr_arr_s(2));
        y_wraddr           <= std_logic_vector(resize(unsigned(y_mod_page_delay_s) * to_unsigned(CHANNELS,cnt_delay_ch'length), y_wraddr'length) + unsigned(cnt_delay_ch));  -- p*C + c
        Y_Wren_Memless : process(cnt_delay_mac,valid_delay)
            variable tmp_cnt_delay_mac : unsigned(cnt_delay_mac'range);
        begin
            tmp_cnt_delay_mac                                                   := unsigned(cnt_delay_mac)+1;
            y_wren                                                              <= '0';
            -- end of biquad 0,1,2,3,4...
            if(((tmp_cnt_delay_mac) mod (MAC_BIQUAD) = 0) and tmp_cnt_delay_mac <= MAC_FILTER_CH) then
                y_wren <= valid_delay;
            end if;
        end process Y_Wren_Memless;
    end block Write_Y_Memory;
end behaviour_dataflow;
