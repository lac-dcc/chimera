library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.filter_shared_package.all;

entity filter_extra_functions is
    generic
        (
            MAC_FILTER_CH : natural := MC;   -- MAC operations per channel for Main filter operation
            CHANNELS      : natural := C;
            ENVELOPE_EN   : natural := ENV;
            ENV_MAC_ID    : natural := ENV_MAC;
            SETZERO_EN    : natural := SETZ;
            RMS_CH_EN     : natural := RMS;  -- Enable flag for RMS function.    0-disabled 1- enabled.
            MEAN_CH_EN    : natural := MEAN  -- Enable flag for MEAN function.    0-disabled 1- enabled.
            );

    port
        (
            -- Input ports
            clk  : in std_logic;
            rstn : in std_logic;

            cnt_mac       : in std_logic_vector(natural(ceil(log2(real(MAC_FILTER_CH + RMS_CH_EN + MEAN_CH_EN))))-1 downto 0);
            cnt_ch        : in std_logic_vector(natural(ceil(log2(real(CHANNELS))))-1 downto 0);
            cnt_delay_mac : in std_logic_vector(natural(ceil(log2(real(MAC_FILTER_CH + RMS_CH_EN + MEAN_CH_EN))))-1 downto 0);
            cnt_delay_ch  : in std_logic_vector(natural(ceil(log2(real(CHANNELS))))-1 downto 0);

            give_rms  : in std_logic;
            give_mean : in std_logic;
            envelope  : in std_logic_vector(CHANNELS-1 downto 0);
            set_zero  : in std_logic_vector(CHANNELS-1 downto 0);

            valid_delay : in std_logic;
            output      : in std_logic;

            -- Output ports
            source_rms_valid  : out std_logic:= '0';
            source_mean_valid : out std_logic:= '0';
            zero_y            : out std_logic:= '0';
            zero_acc_misc     : out std_logic;
            is_abs            : out std_logic:= '0';
            cond              : out std_logic
            );
end filter_extra_functions;

architecture filter_extra_functions_arch of filter_extra_functions is
    signal rms_output_s, mean_output_s, cond_s : std_logic;
    signal tmp_cnt_delay_ch_s                  : unsigned(cnt_delay_ch'range);

    -- Envelope enable signal and absolute flag
    signal envelope_en_s, is_abs_s : std_logic;
    
    -- Set Zero signals
    signal set_zero_s, set_zero_1_s, set_zero_2_s, set_zero_3_s, set_zero_4_s : std_logic_vector(CHANNELS-1 downto 0);    

    -- Valid Signal registers
    signal source_rms_valid_s  : std_logic;
    signal source_mean_valid_s : std_logic;
begin
    tmp_cnt_delay_ch_s <= unsigned(cnt_delay_ch);

    -- RMS and MEAN Functionality
    Cond_Zero_Rms_Mean: if RMS_CH_EN /= 0 and MEAN_CH_EN /= 0 generate
        -- valid RMS and MEAN output if requested
        Rms_Mean_Memless : process(cnt_delay_mac,give_rms,give_mean)
            variable tmp_cnt_delay_mac               : natural;
            variable tmp_rms_output, tmp_mean_output : std_logic;
        begin
            tmp_cnt_delay_mac := to_integer(unsigned(cnt_delay_mac));
            tmp_rms_output    := '0';
            tmp_mean_output   := '0';
            if tmp_cnt_delay_mac = MAC_FILTER_CH then
                tmp_rms_output := give_rms;
            end if;
            if tmp_cnt_delay_mac = MAC_FILTER_CH+1 then
                tmp_mean_output := give_mean;
            end if;
            rms_output_s  <= tmp_rms_output;
            mean_output_s <= tmp_mean_output;
            zero_acc_misc <= tmp_rms_output or tmp_mean_output;
        end process Rms_Mean_Memless;
        cond_s <= '1' when (output = '1') or (rms_output_s = '1') or (mean_output_s = '1') else
                  '0';
    end generate;
    
    Cond_Zero_Rms: if RMS_CH_EN /= 0 and MEAN_CH_EN = 0 generate
        -- valid RMS output if requested
        Rms_Memless : process(cnt_delay_mac,give_rms)
            variable tmp_cnt_delay_mac : natural;
            variable tmp_rms_output    : std_logic;
        begin
            tmp_cnt_delay_mac := to_integer(unsigned(cnt_delay_mac));
            tmp_rms_output    := '0';
            if tmp_cnt_delay_mac = MAC_FILTER_CH then
                tmp_rms_output := give_rms;
            end if;
            rms_output_s  <= tmp_rms_output;
            zero_acc_misc <= tmp_rms_output;
        end process Rms_Memless;
        cond_s <= '1' when (output = '1') or (rms_output_s = '1') else
                  '0';
    end generate;
    
    Cond_Zero_Mean: if RMS_CH_EN = 0 and MEAN_CH_EN /= 0 generate
        -- valid MEAN output if requested
        Mean_Memless : process(cnt_delay_mac,give_mean)
            variable tmp_cnt_delay_mac : natural;
            variable tmp_mean_output   : std_logic;
        begin
            tmp_cnt_delay_mac := to_integer(unsigned(cnt_delay_mac));
            tmp_mean_output   := '0';
            if tmp_cnt_delay_mac = MAC_FILTER_CH then
                tmp_mean_output := give_mean;
            end if;
            mean_output_s <= tmp_mean_output;
            zero_acc_misc <= tmp_mean_output;
        end process Mean_Memless;
        cond_s <= '1' when (output = '1') or (mean_output_s = '1') else
                  '0';
    end generate;
    
    Cond_Zero: if RMS_CH_EN = 0 and MEAN_CH_EN = 0 generate
        cond_s <= '1' when (output = '1') else
                  '0';
        zero_acc_misc <= '0';
    end generate;

    cond <= cond_s;

    Rms_Valid_Memzing : if RMS_CH_EN /= 0 generate
        process (clk, rstn) is
        begin
            if (rstn = '0') then
                source_rms_valid_s <= '0';
                source_rms_valid   <= '0';
            elsif (rising_edge(clk)) then
                source_rms_valid_s <= '0';
                if (cond_s = '1' and tmp_cnt_delay_ch_s < CHANNELS) then
                    source_rms_valid_s <= rms_output_s;
                end if;
                source_rms_valid <= source_rms_valid_s;
            end if;
        end process;
    end generate Rms_Valid_Memzing;

    Mean_Valid_Memzing : if MEAN_CH_EN /= 0 generate
        process (clk, rstn) is
        begin
            if (rstn = '0') then
                source_mean_valid_s <= '0';
                source_mean_valid <= '0';
            elsif (rising_edge(clk)) then
                source_mean_valid_s <= '0';
                if (cond_s = '1' and tmp_cnt_delay_ch_s < CHANNELS) then
                    source_mean_valid_s <= mean_output_s;
                end if;
                source_mean_valid <= source_mean_valid_s;
            end if;
        end process;
    end generate Mean_Valid_Memzing;

     -- Envelope Functionality
    Env : if ENVELOPE_EN /= 0 generate
        -- Generate envelope enable signal and absolute flag
        Env_Abs_Memless : process(cnt_ch,cnt_mac,envelope)
            variable tmp_cnt_ch, tmp_cnt_mac : natural;
            variable tmp_is_abs              : std_logic;
        begin
            tmp_cnt_ch                                   := to_integer(unsigned(cnt_ch));
            tmp_cnt_mac                                  := to_integer(unsigned(cnt_mac));
            tmp_is_abs                                   := '0';
            if(tmp_cnt_mac >= ENV_MAC_ID and tmp_cnt_mac <= ENV_MAC_ID + 2) then
                tmp_is_abs := '1';
            end if;
            envelope_en_s <= envelope(tmp_cnt_ch);
            is_abs_s      <= tmp_is_abs;
        end process Env_Abs_Memless;

       -- Register the absolute flag according to envelope select
        process (clk, rstn) is
        begin
            if (rstn = '0') then
                is_abs <= '0';
            elsif (clk = '1' and clk'event) then
                is_abs <= '0';
                if (envelope_en_s = '1') then
                    is_abs <= is_abs_s;
                end if;
            end if;
        end process;
    end generate Env;
    
     -- Set-Zero Functionality
    ZeroY : if SETZERO_EN /= 0 generate
        process (clk, rstn) is
        begin
            if (rstn = '0') then
                set_zero_s   <= (others => '0');
                set_zero_1_s <= (others => '0');
                set_zero_2_s <= (others => '0');
                set_zero_3_s <= (others => '0');
                set_zero_4_s <= (others => '0');
            elsif (rising_edge(clk)) then
                if (output = '1' and tmp_cnt_delay_ch_s = CHANNELS-1) then
                    set_zero_1_s <= set_zero;
                    set_zero_2_s <= set_zero_1_s;
                    set_zero_3_s <= set_zero_2_s;
                    set_zero_4_s <= set_zero_3_s;
                    set_zero_s   <= set_zero or set_zero_1_s or set_zero_2_s or set_zero_3_s or set_zero_4_s;
                end if;
            end if;
        end process;
        zero_y <= set_zero_s(to_integer(unsigned(cnt_delay_ch)));
    end generate ZeroY;
    
end filter_extra_functions_arch;