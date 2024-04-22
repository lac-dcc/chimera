library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.filter_shared_package.all;

entity filter_generic_iir_biquad is
    generic
        (
            BIQUADS            : natural := B;
            CHANNELS           : natural := C;
            PRECISION          : natural := PREC;
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
            clk                  : in  std_logic;
            rstn                 : in  std_logic;
            envelope             : in  std_logic_vector(CHANNELS-1 downto 0):= (others => '0');
            give_rms             : in  std_logic:= '0';
            give_mean            : in  std_logic:= '0';
            set_zero             : in  std_logic_vector(CHANNELS-1 downto 0):= (others => '0');
            sink_data            : in  std_logic_vector(SINGLE_EXT-1 downto 0);
            sink_valid           : in  std_logic;
            sink_startofpacket   : in  std_logic;
            sink_endofpacket     : in  std_logic;
            sink_ready           : out std_logic;
            coeff_wren           : in  std_logic;
            coeff_wraddr         : in  COEFF_ADD_T;
            coeff_data           : in  DATA_IO_PORT_T;
            source_data          : out std_logic_vector(SINGLE_EXT-1 downto 0);
            source_valid         : out std_logic;
            source_rms_valid     : out std_logic:= '1';
            source_mean_valid    : out std_logic:= '0';
            source_startofpacket : out std_logic;
            source_endofpacket   : out std_logic
            );
end filter_generic_iir_biquad;

architecture structural of filter_generic_iir_biquad is
    component filter_main_controller is
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
    end component filter_main_controller;

    component filter_datapath is
        generic
            (
                FPMULT_PIPE_LENGTH : P_T     := PM;
                FPADD_PIPE_LENGTH  : P_T     := PA;
                PRECISION          : natural := PREC
                );

        port
            (
                -- Input ports
                clk  : in std_logic;
                rstn : in std_logic;
                aclr : in std_logic;

                x_rdaddr  : in X_ADD_T;
                x_rden    : in std_logic;
                x_wraddr  : in X_ADD_T;
                x_wren    : in std_logic;
                sink_data : in std_logic_vector(SINGLE_EXT-1 downto 0);

                coeff_rdaddr : in COEFF_ADD_T;
                coeff_rden   : in std_logic;
                coeff_wraddr : in COEFF_ADD_T;
                coeff_wren   : in std_logic;
                coeff_data   : in DATA_IO_PORT_T;

                acc_rdaddr : in ACC_ADD_T;
                acc_rden   : in std_logic;
                acc_wraddr : in ACC_ADD_T;
                acc_wren   : in std_logic;
                zero_acc   : in std_logic;

                y_rdaddr : in Y_ADD_T;
                y_rden   : in std_logic;
                y_wraddr : in Y_ADD_T;
                y_wren   : in std_logic;
                zero_y   : in std_logic;
                is_abs   : in std_logic;

                mac_x_y_sel     : in std_logic;
                mac_coeff_y_sel : in std_logic;

                -- Output ports
                source_data : out std_logic_vector(SINGLE_EXT-1 downto 0)
                );
    end component filter_datapath;

    -- Signals
    signal x_rdaddr_s        : X_ADD_T;
    signal x_rden_s          : std_logic;
    signal x_wraddr_s        : X_ADD_T;
    signal x_wren_s          : std_logic;
    signal coeff_rdaddr_s    : COEFF_ADD_T;
    signal coeff_rden_s      : std_logic;
    signal acc_rdaddr_s      : ACC_ADD_T;
    signal acc_rden_s        : std_logic;
    signal acc_wraddr_s      : ACC_ADD_T;
    signal acc_wren_s        : std_logic;
    signal zero_acc_s        : std_logic;
    signal y_rdaddr_s        : Y_ADD_T;
    signal y_rden_s          : std_logic;
    signal y_wraddr_s        : Y_ADD_T;
    signal y_wren_s          : std_logic;
    signal zero_y_s          : std_logic;
    signal is_abs_s          : std_logic;
    signal mac_x_y_sel_s     : std_logic;
    signal mac_coeff_y_sel_s : std_logic;
    signal aclr_s            : std_logic;

begin
    aclr_s <= not rstn;

    main_controller_inst : component filter_main_controller
        generic map
        (
            BIQUADS            => BIQUADS,
            CHANNELS           => CHANNELS,
            FPMULT_PIPE_LENGTH => FPMULT_PIPE_LENGTH,
            FPADD_PIPE_LENGTH  => FPADD_PIPE_LENGTH,
            MAC_FILTER_CH      => MAC_FILTER_CH,
            RMS_CH_EN          => RMS_CH_EN,
            MEAN_CH_EN         => MEAN_CH_EN,
            ENVELOPE_EN        => ENVELOPE_EN,
            ENV_MAC_ID         => ENV_MAC_ID,
            SETZERO_EN         => SETZERO_EN
            )
        port map
        (
            clk                  => clk,
            rstn                 => rstn,
            envelope             => envelope,
            give_rms             => give_rms,
            give_mean            => give_mean,
            set_zero             => set_zero,
            sink_valid           => sink_valid,
            sink_startofpacket   => sink_startofpacket,
            sink_endofpacket     => sink_endofpacket,
            x_rdaddr             => x_rdaddr_s,
            x_rden               => x_rden_s,
            x_wraddr             => x_wraddr_s,
            x_wren               => x_wren_s,
            coeff_rdaddr         => coeff_rdaddr_s,
            coeff_rden           => coeff_rden_s,
            acc_rdaddr           => acc_rdaddr_s,
            acc_rden             => acc_rden_s,
            acc_wraddr           => acc_wraddr_s,
            acc_wren             => acc_wren_s,
            zero_acc             => zero_acc_s,
            y_rdaddr             => y_rdaddr_s,
            y_rden               => y_rden_s,
            y_wraddr             => y_wraddr_s,
            y_wren               => y_wren_s,
            zero_y               => zero_y_s,
            is_abs               => is_abs_s,
            mac_x_y_sel          => mac_x_y_sel_s,
            mac_coeff_y_sel      => mac_coeff_y_sel_s,
            sink_ready           => sink_ready,
            source_valid         => source_valid,
            source_rms_valid     => source_rms_valid,
            source_mean_valid    => source_mean_valid,
            source_startofpacket => source_startofpacket,
            source_endofpacket   => source_endofpacket
            );

    filter_datapath_inst : component filter_datapath
        generic map
        (
            FPMULT_PIPE_LENGTH => FPMULT_PIPE_LENGTH,
            FPADD_PIPE_LENGTH  => FPADD_PIPE_LENGTH,
            PRECISION          => PRECISION
            )
        port map
        (
            clk             => clk,
            rstn            => rstn,
            aclr            => aclr_s,
            x_rdaddr        => x_rdaddr_s,
            x_rden          => x_rden_s,
            x_wraddr        => x_wraddr_s,
            x_wren          => x_wren_s,
            sink_data       => sink_data,
            coeff_rdaddr    => coeff_rdaddr_s,
            coeff_rden      => coeff_rden_s,
            coeff_wraddr    => coeff_wraddr,
            coeff_wren      => coeff_wren,
            coeff_data      => coeff_data,
            acc_rdaddr      => acc_rdaddr_s,
            acc_rden        => acc_rden_s,
            acc_wraddr      => acc_wraddr_s,
            acc_wren        => acc_wren_s,
            zero_acc        => zero_acc_s,
            y_rdaddr        => y_rdaddr_s,
            y_rden          => y_rden_s,
            y_wraddr        => y_wraddr_s,
            y_wren          => y_wren_s,
            zero_y          => zero_y_s,
            is_abs          => is_abs_s,
            mac_x_y_sel     => mac_x_y_sel_s,
            mac_coeff_y_sel => mac_coeff_y_sel_s,
            source_data     => source_data
            );

end structural;
