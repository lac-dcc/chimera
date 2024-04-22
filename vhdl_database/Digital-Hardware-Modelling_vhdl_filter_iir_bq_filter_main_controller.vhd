library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.filter_shared_package.all;

entity filter_main_controller is
    generic
        (
            BIQUADS            : natural := B;
            CHANNELS           : natural := C;
            FPMULT_PIPE_LENGTH : P_T     := PM;
            FPADD_PIPE_LENGTH  : P_T     := PA;
            MAC_FILTER_CH      : natural := MC;    -- MAC operations per channel for Main filter operation
            RMS_CH_EN          : natural := RMS;   -- Enable flag for RMS function.    0-disabled 1- enabled.
            MEAN_CH_EN         : natural := MEAN;  -- Enable flag for MEAN function.    0-disabled 1- enabled.        
            ENVELOPE_EN        : natural := ENV;
            ENV_MAC_ID         : natural := ENV_MAC;
            SETZERO_EN         : natural := SETZ
            );        
    port
        (
            -- Input Ports
            clk  : in std_logic;
            rstn : in std_logic;

            envelope  : in std_logic_vector(CHANNELS-1 downto 0);
            give_rms  : in std_logic;
            give_mean : in std_logic;
            set_zero  : in std_logic_vector(CHANNELS-1 downto 0);

            sink_valid         : in std_logic;
            sink_startofpacket : in std_logic;
            sink_endofpacket   : in std_logic;

            -- Output ports
            x_rdaddr : out X_ADD_T;
            x_rden   : out std_logic;
            x_wraddr : out X_ADD_T;
            x_wren   : out std_logic;

            coeff_rdaddr : out COEFF_ADD_T;
            coeff_rden   : out std_logic;

            acc_rdaddr : out ACC_ADD_T;
            acc_rden   : out std_logic;
            acc_wraddr : out ACC_ADD_T;
            acc_wren   : out std_logic;
            zero_acc   : out std_logic;

            y_rdaddr : out Y_ADD_T;
            y_rden   : out std_logic;
            y_wraddr : out Y_ADD_T;
            y_wren   : out std_logic;
            zero_y   : out std_logic;
            is_abs   : out std_logic;

            mac_x_y_sel     : out std_logic;
            mac_coeff_y_sel : out std_logic;

            sink_ready           : out std_logic;
            source_valid         : out std_logic;
            source_rms_valid     : out std_logic;
            source_mean_valid    : out std_logic;
            source_startofpacket : out std_logic;
            source_endofpacket   : out std_logic
            );
end filter_main_controller;

architecture structure of filter_main_controller is

    component filter_counters is
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
                valid_delay   : out std_logic;  -- valid_s [PIPDELAY]
                valid_acc     : out std_logic;  -- valid_s [ACCDELAY]
                cnt_mac       : out std_logic_vector(natural(ceil(log2(real(MAC_FILTER_CH+RMS_CH_EN+MEAN_CH_EN))))-1 downto 0);
                cnt_ch        : out std_logic_vector(natural(ceil(log2(real(CHANNELS))))-1 downto 0);
                cnt_delay_mac : out std_logic_vector(natural(ceil(log2(real(MAC_FILTER_CH+RMS_CH_EN+MEAN_CH_EN))))-1 downto 0);  -- SR [PIPDELAY]
                cnt_delay_ch  : out std_logic_vector(natural(ceil(log2(real(CHANNELS))))-1 downto 0);  -- SR [PIPDELAY]
                cnt_acc_mac   : out std_logic_vector(natural(ceil(log2(real(MAC_FILTER_CH+RMS_CH_EN+MEAN_CH_EN))))-1 downto 0);  -- SR [ACCDELAY]
                cnt_acc_ch    : out std_logic_vector(natural(ceil(log2(real(CHANNELS))))-1 downto 0)  -- SR [ACCDELAY]        
                );
    end component filter_counters;

    component filter_in_data_controller is
        generic
            (
                MAC_FILTER_CH : natural := MC;    -- MAC operations per channel for Main filter operation
                RMS_CH_EN     : natural := RMS;   -- Enable flag for RMS function.     0-disabled 1- enabled.
                MEAN_CH_EN    : natural := MEAN;  -- Enable flag for MEAN function.    0-disabled 1- enabled.
                CHANNELS      : natural := C
                );
        port
            (
                clk                : in    std_logic;
                rstn               : in    std_logic;
                cnt_mac            : in    std_logic_vector(natural(ceil(log2(real(MAC_FILTER_CH+RMS_CH_EN+MEAN_CH_EN))))-1 downto 0);
                cnt_ch             : in    std_logic_vector(natural(ceil(log2(real(CHANNELS))))-1 downto 0);
                x_input            : in    std_logic;
                valid              : in    std_logic;
                sink_valid         : in    std_logic;
                sink_endofpacket   : in    std_logic;
                sink_startofpacket : in    std_logic;
                input_ack          : in    std_logic;
                sink_ready         : out   std_logic;
                input_ok           : out   std_logic;
                x_rdaddr           : out   X_ADD_T;
                x_rden             : out   std_logic;
                x_wraddr           : out   X_ADD_T;
                x_wren             : out   std_logic
                );
    end component filter_in_data_controller;

    component filter_coeff_controller is
        generic
            (
                MAC_FILTER_CH : natural := MC;    -- MAC operations per channel for Main filter operation
                RMS_CH_EN     : natural := RMS;   -- Enable flag for RMS function.    0-disabled 1- enabled.
                MEAN_CH_EN    : natural := MEAN;  -- Enable flag for MEAN function.    0-disabled 1- enabled.
                CHANNELS      : natural := C
                );
        port
            (
                cnt_mac : in std_logic_vector(natural(ceil(log2(real(MAC_FILTER_CH+RMS_CH_EN+MEAN_CH_EN))))-1 downto 0);
                cnt_ch  : in std_logic_vector(natural(ceil(log2(real(CHANNELS))))-1 downto 0);

                valid : in std_logic;

                coeff_rdaddr : out COEFF_ADD_T;
                coeff_rden   : out std_logic
                );
    end component filter_coeff_controller;

    component filter_out_data_controller is
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
    end component filter_out_data_controller;

    component filter_mac_mem_controller is
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
    end component filter_mac_mem_controller;

    component filter_extra_functions is
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
                source_rms_valid  : out std_logic;
                source_mean_valid : out std_logic;
                zero_y            : out std_logic;
                zero_acc_misc     : out std_logic;
                is_abs            : out std_logic;
                cond              : out std_logic
                );
    end component filter_extra_functions;

    -- Counter Signals
    signal input_ok_s      : std_logic;
    signal input_ack_s     : std_logic;
    signal valid_s         : std_logic;
    signal valid_delay_s   : std_logic;
    signal valid_acc_s     : std_logic;
    signal cnt_mac_s       : std_logic_vector(natural(ceil(log2(real(MAC_FILTER_CH+RMS_CH_EN+MEAN_CH_EN))))-1 downto 0);
    signal cnt_ch_s        : std_logic_vector(natural(ceil(log2(real(CHANNELS))))-1 downto 0);
    signal cnt_delay_mac_s : std_logic_vector(natural(ceil(log2(real(MAC_FILTER_CH+RMS_CH_EN+MEAN_CH_EN))))-1 downto 0);
    signal cnt_delay_ch_s  : std_logic_vector(natural(ceil(log2(real(CHANNELS))))-1 downto 0);
    signal cnt_acc_mac_s   : std_logic_vector(natural(ceil(log2(real(MAC_FILTER_CH+RMS_CH_EN+MEAN_CH_EN))))-1 downto 0);
    signal cnt_acc_ch_s    : std_logic_vector(natural(ceil(log2(real(CHANNELS))))-1 downto 0);

    -- X ctrl signals
    signal xy_input_s : std_logic;

    -- Y ctrl signals
    signal mac_x_y_sel_s: std_logic;
    -- Acc ctrl signals
    signal zero_acc_misc_s : std_logic;

    -- Misc functions signals
    signal cond_s : std_logic;

    -- Other signals
    signal tmp_cnt_delay_ch_s : unsigned(cnt_delay_ch_s'range);
    signal output_s           : std_logic;
    
    -- Valid Signals
    signal source_valid_s         : std_logic;
    signal source_startofpacket_s : std_logic;
    signal source_endofpacket_s   : std_logic;  

begin

    -- Component Instantiation Statement (optional)
    filter_counters_inst : component filter_counters
        generic map
        (
            FPMULT_PIPE_LENGTH => FPMULT_PIPE_LENGTH,
            FPADD_PIPE_LENGTH  => FPADD_PIPE_LENGTH,
            MAC_FILTER_CH      => MAC_FILTER_CH,
            RMS_CH_EN          => RMS_CH_EN,
            MEAN_CH_EN         => MEAN_CH_EN,
            CHANNELS           => CHANNELS
            )
        port map
        (
            clk           => clk,
            rstn          => rstn,
            input_ok      => input_ok_s,
            input_ack     => input_ack_s,
            valid         => valid_s,
            valid_delay   => valid_delay_s,
            valid_acc     => valid_acc_s,
            cnt_mac       => cnt_mac_s,
            cnt_ch        => cnt_ch_s,
            cnt_delay_mac => cnt_delay_mac_s,
            cnt_delay_ch  => cnt_delay_ch_s,
            cnt_acc_mac   => cnt_acc_mac_s,
            cnt_acc_ch    => cnt_acc_ch_s
            );

    filter_in_data_controller_inst : component filter_in_data_controller
        generic map
        (
            MAC_FILTER_CH => MAC_FILTER_CH,
            RMS_CH_EN     => RMS_CH_EN,
            MEAN_CH_EN    => MEAN_CH_EN,
            CHANNELS      => CHANNELS
            )
        port map
        (
            clk                => clk,
            rstn               => rstn,
            cnt_mac            => cnt_mac_s,
            cnt_ch             => cnt_ch_s,
            x_input            => xy_input_s,
            valid              => valid_s,
            sink_valid         => sink_valid,
            sink_endofpacket   => sink_endofpacket,
            sink_startofpacket => sink_startofpacket,
            input_ack          => input_ack_s,
            sink_ready         => sink_ready,
            input_ok           => input_ok_s,
            x_rdaddr           => x_rdaddr,
            x_rden             => x_rden,
            x_wraddr           => x_wraddr,
            x_wren             => x_wren
            );

    filter_coeff_controller_inst : component filter_coeff_controller
        generic map
        (
            MAC_FILTER_CH => MAC_FILTER_CH,
            RMS_CH_EN     => RMS_CH_EN,
            MEAN_CH_EN    => MEAN_CH_EN,
            CHANNELS      => CHANNELS
            )
        port map
        (
            cnt_mac      => cnt_mac_s,
            cnt_ch       => cnt_ch_s,
            valid        => valid_s,
            coeff_rdaddr => coeff_rdaddr,
            coeff_rden   => coeff_rden
            );

    filter_out_data_controller_inst : component filter_out_data_controller
        generic map
        (
            BIQUADS       => BIQUADS,
            CHANNELS      => CHANNELS,
            MAC_FILTER_CH => MAC_FILTER_CH,
            RMS_CH_EN     => RMS_CH_EN,
            MEAN_CH_EN    => MEAN_CH_EN
            )
        port map
        (
            clk           => clk,
            rstn          => rstn,
            cnt_mac       => cnt_mac_s,
            cnt_ch        => cnt_ch_s,
            cnt_delay_mac => cnt_delay_mac_s,
            cnt_delay_ch  => cnt_delay_ch_s,
            y_input       => xy_input_s,
            input_ok      => input_ok_s,
            valid_delay   => valid_delay_s,
            y_rdaddr      => y_rdaddr,
            y_rden        => y_rden,
            y_wraddr      => y_wraddr,
            y_wren        => y_wren
            );

    filter_mac_mem_controller_inst : component filter_mac_mem_controller
        generic map
        (
            BIQUADS       => BIQUADS,
            CHANNELS      => CHANNELS,
            MAC_FILTER_CH => MAC_FILTER_CH,
            RMS_CH_EN     => RMS_CH_EN,
            MEAN_CH_EN    => MEAN_CH_EN
            )
        port map
        (
            cnt_delay_mac => cnt_delay_mac_s,
            cnt_delay_ch  => cnt_delay_ch_s,
            cnt_acc_mac   => cnt_acc_mac_s,
            cnt_acc_ch    => cnt_acc_ch_s,
            valid_delay   => valid_delay_s,
            valid_acc     => valid_acc_s,
            zero_acc_misc => zero_acc_misc_s,
            acc_rdaddr    => acc_rdaddr,
            acc_rden      => acc_rden,
            acc_wraddr    => acc_wraddr,
            acc_wren      => acc_wren,
            zero_acc      => zero_acc
            );

    filter_extra_functions_inst : component filter_extra_functions
        generic map
        (
            CHANNELS      => CHANNELS,
            MAC_FILTER_CH => MAC_FILTER_CH,
            ENVELOPE_EN   => ENVELOPE_EN,
            ENV_MAC_ID    => ENV_MAC_ID,
            SETZERO_EN    => SETZERO_EN,
            RMS_CH_EN     => RMS_CH_EN,
            MEAN_CH_EN    => MEAN_CH_EN
            )
        port map
        (
            clk               => clk,
            rstn              => rstn,
            cnt_mac           => cnt_mac_s,
            cnt_ch            => cnt_ch_s,
            cnt_delay_mac     => cnt_delay_mac_s,
            cnt_delay_ch      => cnt_delay_ch_s,
            give_rms          => give_rms,
            give_mean         => give_mean,
            envelope          => envelope,
            set_zero          => set_zero,
            valid_delay       => valid_delay_s,
            output            => output_s,
            source_rms_valid  => source_rms_valid,
            source_mean_valid => source_mean_valid,
            zero_y            => zero_y,
            zero_acc_misc     => zero_acc_misc_s,
            is_abs            => is_abs,
            cond              => cond_s
            );

    -- Request x and y inputs and also set select signal for x(1) or y(0)
    x_y_input : process(cnt_mac_s)
        variable tmp_cnt_mac  : natural;
        variable tmp_xy_input : std_logic;
    begin
        tmp_cnt_mac    := to_integer(unsigned(cnt_mac_s));
        tmp_xy_input   := '0';
        if(tmp_cnt_mac <= 2) then
            tmp_xy_input := '1';
        end if;
        xy_input_s  <= tmp_xy_input;
        mac_x_y_sel_s <= tmp_xy_input;
    end process x_y_input;

    -- valid output after all biquad computations
    Output_Memless : process(cnt_delay_mac_s,valid_delay_s)
        variable tmp_cnt_delay_mac : natural;
        variable tmp_output        : std_logic;
    begin
        tmp_cnt_delay_mac := to_integer(unsigned(cnt_delay_mac_s));
        tmp_output        := '0';
        if tmp_cnt_delay_mac = MAC_FILTER_CH - 1 then
            tmp_output := valid_delay_s;
        end if;
        output_s        <= tmp_output;
        mac_coeff_y_sel <= not tmp_output;
    end process Output_Memless;

    tmp_cnt_delay_ch_s <= unsigned(cnt_delay_ch_s);

    Src_Valid : process (clk, rstn) is
    begin
        if (rstn = '0') then
            source_valid_s         <= '0';
            source_startofpacket_s <= '0';
            source_endofpacket_s  <= '0';
        elsif (rising_edge(clk)) then
            source_valid_s         <= '0';
            source_startofpacket_s <= '0';
            source_endofpacket_s   <= '0';
            if (cond_s = '1') then
                if (tmp_cnt_delay_ch_s = 0) then
                    source_startofpacket_s <= '1';
                elsif (tmp_cnt_delay_ch_s = CHANNELS - 1) then
                    source_endofpacket_s <= '1';
                end if;

                if (tmp_cnt_delay_ch_s < CHANNELS) then
                    source_valid_s <= output_s;
                end if;
            end if;
        end if;
    end process Src_Valid;
    
    --Output process
    Output: process(clk, rstn)
    begin
        if (rstn = '0') then
            source_valid         <= '0';
            source_startofpacket <= '0';
            source_endofpacket   <= '0';
            mac_x_y_sel          <= '0';
        elsif (rising_edge(clk)) then
            source_valid         <= source_valid_s;
            source_startofpacket <= source_startofpacket_s;
            source_endofpacket   <= source_endofpacket_s;
            mac_x_y_sel          <= mac_x_y_sel_s;
        end if;    
    end process Output;
end structure;
