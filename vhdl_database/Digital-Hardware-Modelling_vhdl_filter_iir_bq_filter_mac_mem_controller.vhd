library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.filter_shared_package.all;

entity filter_mac_mem_controller is
    generic
        (
            BIQUADS       : natural := B;
            MAC_FILTER_CH : natural := MC;    -- MAC operations per channel for Main filter operation
            RMS_CH_EN     : natural := RMS;   -- Enable flag for RMS function.    0-disabled 1- enabled.
            MEAN_CH_EN    : natural := MEAN;  -- Enable flag for MEAN function.   0-disabled 1- enabled.
            CHANNELS      : natural := C
            );
    port
        (
            cnt_delay_mac : in std_logic_vector(natural(ceil(log2(real(MAC_FILTER_CH+RMS_CH_EN+MEAN_CH_EN))))-1 downto 0);
            cnt_delay_ch  : in std_logic_vector(natural(ceil(log2(real(CHANNELS))))-1 downto 0);
            cnt_acc_mac   : in std_logic_vector(natural(ceil(log2(real(MAC_FILTER_CH+RMS_CH_EN+MEAN_CH_EN))))-1 downto 0);
            cnt_acc_ch    : in std_logic_vector(natural(ceil(log2(real(CHANNELS))))-1 downto 0);

            valid_delay   : in std_logic;
            valid_acc     : in std_logic;
            zero_acc_misc : in std_logic;

            acc_rdaddr : out ACC_ADD_T;
            acc_rden   : out std_logic;
            acc_wraddr : out ACC_ADD_T;
            acc_wren   : out std_logic;
            zero_acc   : out std_logic
            );
end filter_mac_mem_controller;


architecture behaviour of filter_mac_mem_controller is
    constant MAC_BIQUAD        : natural := MAC_FILTER_CH/BIQUADS;
    signal   filter_delay_s    : std_logic_vector(natural(ceil(log2(real(MOD_ACC_PAGES))))-1 downto 0);
    signal   filter_acc_s      : std_logic_vector(natural(ceil(log2(real(MOD_ACC_PAGES))))-1 downto 0);
    signal   zero_acc_filter_s : std_logic;
begin

    -- read and write memory page
    Read_Write_Page_RMS_MEAN : if RMS_CH_EN /= 0 and MEAN_CH_EN /= 0 generate
        process(cnt_acc_mac,cnt_delay_mac)
            variable tmp_cnt_acc_mac   : unsigned(cnt_acc_mac'range);
            variable tmp_cnt_delay_mac : unsigned(cnt_delay_mac'range);
            variable tmp_filter_acc    : std_logic_vector(filter_acc_s'range);
            variable tmp_filter_delay  : std_logic_vector(filter_delay_s'range);
        begin
            tmp_cnt_acc_mac   := unsigned(cnt_acc_mac);
            tmp_cnt_delay_mac := unsigned(cnt_delay_mac);

            if tmp_cnt_acc_mac                                            <= MAC_FILTER_CH - 1 then tmp_filter_acc := (others => '0');
            elsif tmp_cnt_acc_mac = MAC_FILTER_CH then tmp_filter_acc     := "01";
            elsif tmp_cnt_acc_mac = MAC_FILTER_CH + 1 then tmp_filter_acc := "10";
            else tmp_filter_acc                                           := "--";
            end if;

            if tmp_cnt_delay_mac                                              <= MAC_FILTER_CH - 1 then tmp_filter_delay := (others => '0');
            elsif tmp_cnt_delay_mac = MAC_FILTER_CH then tmp_filter_delay     := "01";
            elsif tmp_cnt_delay_mac = MAC_FILTER_CH + 1 then tmp_filter_delay := "10";
            else tmp_filter_delay                                             := "--";
            end if;

            filter_acc_s   <= tmp_filter_acc;
            filter_delay_s <= tmp_filter_delay;
        end process;
    end generate;
    
    Read_Write_Page_RMS_Or_MEAN: if ((RMS_CH_EN /= 0 and MEAN_CH_EN = 0) or (RMS_CH_EN = 0 and MEAN_CH_EN /= 0)) generate
            process(cnt_acc_mac,cnt_delay_mac)
                variable tmp_cnt_acc_mac   : unsigned(cnt_acc_mac'range);
                variable tmp_cnt_delay_mac : unsigned(cnt_delay_mac'range);
                variable tmp_filter_acc    : std_logic_vector(filter_acc_s'range);
                variable tmp_filter_delay  : std_logic_vector(filter_delay_s'range);
            begin
                tmp_cnt_acc_mac   := unsigned(cnt_acc_mac);
                tmp_cnt_delay_mac := unsigned(cnt_delay_mac);

                if tmp_cnt_acc_mac                                        <= MAC_FILTER_CH - 1 then tmp_filter_acc := (others => '0');
                elsif tmp_cnt_acc_mac = MAC_FILTER_CH then tmp_filter_acc := "1";  -- RMS or MEAN
                else tmp_filter_acc                                       := "-";
                end if;

                if tmp_cnt_delay_mac                                          <= MAC_FILTER_CH - 1 then tmp_filter_delay := (others => '0');
                elsif tmp_cnt_delay_mac = MAC_FILTER_CH then tmp_filter_delay := "1";  -- RMS or MEAN
                else tmp_filter_delay                                         := "-";
                end if;

                filter_acc_s   <= tmp_filter_acc;
                filter_delay_s <= tmp_filter_delay;
            end process;
    end generate;
    
    Read_Write_Page: if (RMS_CH_EN = 0 and MEAN_CH_EN = 0) generate
             filter_acc_s   <= (others => '0');
             filter_delay_s <= (others => '0');
    end generate;


     -- read interface    
     acc_rdaddr <= std_logic_vector(resize(unsigned(filter_acc_s) * to_unsigned(CHANNELS,cnt_acc_ch'length), acc_wraddr'length) + unsigned(cnt_acc_ch));  -- p*C + c
     acc_rden   <= valid_acc;

     -- write interface
     acc_wraddr <= std_logic_vector(resize(unsigned(filter_delay_s) * to_unsigned(CHANNELS,cnt_delay_ch'length), acc_wraddr'length) + unsigned(cnt_delay_ch));  -- p*C + c
     acc_wren   <= valid_delay;

     -- Zero the accumulator
     Zero_Acc_Filter : process(cnt_delay_mac)
         variable tmp_cnt_delay_mac   : unsigned(cnt_delay_mac'range);
         variable tmp_zero_acc_filter : std_logic;
     begin
         tmp_cnt_delay_mac   := unsigned(cnt_delay_mac)+1;
         tmp_zero_acc_filter := '0';

         -- end of biquad 0,1,2,3,4...
         if(((tmp_cnt_delay_mac) mod (MAC_BIQUAD) = 0) and tmp_cnt_delay_mac <= MAC_FILTER_CH) then
             tmp_zero_acc_filter := '1';
         end if;
         
         zero_acc_filter_s <= tmp_zero_acc_filter;
         
     end process Zero_Acc_Filter;

     zero_acc <= zero_acc_filter_s or zero_acc_misc;
end behaviour;
     

