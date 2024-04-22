library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.all;
use work.filter_shared_package.all;

entity counter is
    generic
        (
            FPMULT_PIPE_LENGTH : P_T     := PM;
            FPADD_PIPE_LENGTH  : P_T     := PA;
            MAC_FILTER_CH      : natural := MC;    -- MAC operations per channel for Main filter operation
            RMS_CH_EN          : natural := RMS;   -- Enable flag for RMS function.    0-disabled 1- enabled.
            MEAN_CH_EN         : natural := MEAN;  -- Enable flag for MEAN function.    0-disabled 1- enabled.
            CHANNELS           : natural := C
            );

    port
        (
            -- Input ports
            clk      : in std_logic;
            rstn     : in std_logic;
            input_ok : in std_logic;

            -- Output ports
            input_ack     : out std_logic;
            valid         : out std_logic;
            valid_delay   : out std_logic;                                                        -- valid_s [PIPDELAY]
            valid_acc     : out std_logic;                                                        -- valid_s [ACCDELAY]
            cnt_mac       : out std_logic_vector(natural(ceil(log2(real(MAC_FILTER_CH+RMS_CH_EN+MEAN_CH_EN))))-1 downto 0);
            cnt_ch        : out std_logic_vector(natural(ceil(log2(real(CHANNELS))))-1 downto 0);
            cnt_delay_mac : out std_logic_vector(natural(ceil(log2(real(MAC_FILTER_CH+RMS_CH_EN+MEAN_CH_EN))))-1 downto 0);  -- SR [PIPDELAY]
            cnt_delay_ch  : out std_logic_vector(natural(ceil(log2(real(CHANNELS))))-1 downto 0);  -- SR [PIPDELAY]
            cnt_acc_mac   : out std_logic_vector(natural(ceil(log2(real(MAC_FILTER_CH+RMS_CH_EN+MEAN_CH_EN))))-1 downto 0);  -- SR [ACCDELAY]
            cnt_acc_ch    : out std_logic_vector(natural(ceil(log2(real(CHANNELS))))-1 downto 0)  -- SR [ACCDELAY]        
            );
end counter;

architecture counter_behaviour of counter is
    -- Constants
    constant PIPELINE_DELAY : integer := FPMULT_PIPE_LENGTH + FPADD_PIPE_LENGTH + 1;  -- 1 additional register between * and +. TODO: make it configurable
    constant ACC_DELAY      : integer := FPMULT_PIPE_LENGTH - 1;

    -- Subtypes
    type SHIFT_REG is array(PIPELINE_DELAY downto 0) of std_logic_vector(cnt_mac'length + cnt_ch'length - 1 downto 0);

    -- Signals and Registers
    signal run_s       : std_logic;
    signal cnt_mac_s   : unsigned(cnt_mac'LEFT downto 0);
    signal cnt_ch_s    : unsigned(cnt_ch'LEFT downto 0);
    signal valid_s     : std_logic_vector(PIPELINE_DELAY downto 0);
    signal shift_reg_s : SHIFT_REG;
begin
    -- shift register for valid flags and counter
    process (clk, rstn) is
    begin
        if (rstn = '0') then
            shift_reg_s <= (others => (others => '0'));
            valid_s     <= (others => '0');
            
        elsif (clk = '1' and clk'event) then

            -- Load shift registers
            shift_reg_s(0) <= std_logic_vector(cnt_mac_s) & std_logic_vector(cnt_ch_s);
            valid_s(0)     <= run_s;

            for n in 1 to PIPELINE_DELAY loop
                shift_reg_s(n) <= shift_reg_s(n-1);
                valid_s(n)     <= valid_s(n-1);
            end loop;

        end if;
    end process;

    -- counter process
    process (clk, rstn) is
    begin
        if (rstn = '0') then
            cnt_mac_s <= to_unsigned(MAC_FILTER_CH + RMS_CH_EN + MEAN_CH_EN - 1, cnt_mac_s'length);
            cnt_ch_s  <= to_unsigned(CHANNELS-1, cnt_ch_s'length);
            run_s     <= '0';
            input_ack <= '0';
        elsif (clk = '1' and clk'event) then
            input_ack <= '0';
            if (cnt_ch_s = CHANNELS-1) then
                -- MAC_FILTER_CH MAC operations, 1x RMS, 1x MEAN
                if (cnt_mac_s = MAC_FILTER_CH + RMS_CH_EN + MEAN_CH_EN - 1) then
                    -- biquads computed; stop until new input has arrived
                    run_s <= '0';

                    -- run when input is valid
                    if (input_ok = '1') then
                        -- set running
                        run_s <= '1';

                        -- acknowledge new input
                        input_ack <= '1';

                        -- rstn counter                        
                        cnt_ch_s  <= (others => '0');
                        cnt_mac_s <= (others => '0');
                    end if;
                else
                    cnt_ch_s  <= (others => '0');
                    cnt_mac_s <= cnt_mac_s + 1;
                end if;
            else
                cnt_ch_s <= cnt_ch_s + 1;
            end if;
        end if;
    end process;

    -- Remaining Outputs
    valid_delay   <= valid_s(PIPELINE_DELAY);
    valid_acc     <= valid_s(ACC_DELAY);
    cnt_mac       <= std_logic_vector(cnt_mac_s);
    cnt_ch        <= std_logic_vector(cnt_ch_s);
    cnt_delay_mac <= shift_reg_s(PIPELINE_DELAY)(shift_reg_s(PIPELINE_DELAY)'LEFT downto cnt_ch'length);
    cnt_delay_ch  <= shift_reg_s(PIPELINE_DELAY)(cnt_delay_ch'range);
    cnt_acc_mac   <= shift_reg_s(ACC_DELAY)(shift_reg_s(ACC_DELAY)'LEFT downto cnt_ch'length);
    cnt_acc_ch    <= shift_reg_s(ACC_DELAY)(cnt_acc_ch'range);
    valid         <= run_s;
end counter_behaviour;
