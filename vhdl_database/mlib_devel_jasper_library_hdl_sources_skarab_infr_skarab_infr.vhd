library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

library unisim;
use unisim.vcomponents.all;

use work.parameter.all;

entity skarab_infr is
    generic (
        -- mmcm parameters
        MULTIPLY : REAL    := 6.0;
        DIVIDE   : REAL    := 6.0;
        DIVCLK   : INTEGER := 1);
    port(
        user_clk_o      : out std_logic;
        user_rst_o      : out std_logic;
        board_clk_o     : out std_logic;
        board_clk_rst_o : out std_logic;
        hmc_rst_o       : out std_logic;
        hmc_clk_o       : out std_logic; 

        qsfp_gtrefclk     : in  std_logic;
        qsfp_soft_reset_0 : out std_logic;
        qsfp_soft_reset_1 : out std_logic;
        qsfp_soft_reset_2 : out std_logic;
        qsfp_soft_reset_3 : out std_logic;

        xlgmii_txled_0 : in std_logic_vector(1 downto 0);
        xlgmii_rxled_0 : in std_logic_vector(1 downto 0);
        xlgmii_txled_1 : in std_logic_vector(1 downto 0);
        xlgmii_rxled_1 : in std_logic_vector(1 downto 0);
        xlgmii_txled_2 : in std_logic_vector(1 downto 0);
        xlgmii_rxled_2 : in std_logic_vector(1 downto 0);
        xlgmii_txled_3 : in std_logic_vector(1 downto 0);
        xlgmii_rxled_3 : in std_logic_vector(1 downto 0);

        gbe_if_present    : in std_logic;
        fgbe_if_0_present : in std_logic;
        fgbe_if_1_present : in std_logic;
        fgbe_if_2_present : in std_logic;
        fgbe_if_3_present : in std_logic;

        --TODO Bring from one_gbe to here
        --gbe_link_up        : in  std_logic;
        gbe_status_vector    : in  std_logic_vector(15 downto 0);
        gbe_int_n            : in  std_logic;
        host_reset_o         : out std_logic;
        --user_mmcm_locked_o   : out std_logic;
        gmii_clk             : in  std_logic;
        sync_gmii_fpga_rst_o : out std_logic;
        gmii_reset_done      : in std_logic;

        gbe_phy_up       : in std_logic;
        fgbe_phy_rx_up_0 : in std_logic;
        fgbe_phy_rx_up_1 : in std_logic;
        fgbe_phy_rx_up_2 : in std_logic;
        fgbe_phy_rx_up_3 : in std_logic;

        FPGA_RESET_N       : in std_logic;
        FPGA_REFCLK_BUF0_P : in std_logic;
        FPGA_REFCLK_BUF0_N : in std_logic;
        FPGA_REFCLK_BUF1_P : in std_logic;
        FPGA_REFCLK_BUF1_N : in std_logic;
        
        -- MEZZANINE 0 SIDEBAND SIGNALS
        MEZZANINE_0_PRESENT_N : in std_logic;
        MEZZANINE_0_ENABLE_N : out std_logic;
        --MEZZANINE_0_RESET : out std_logic;   --this is moved to the top.v now
        MEZZANINE_0_FAULT_N : in std_logic;
        MEZZANINE_0_ONE_WIRE : inout std_logic;
        MEZZANINE_0_ONE_WIRE_STRONG_PULLUP_EN_N : out std_logic;
        --MEZZANINE_0_CLK_SEL : out std_logic; --this is moved to the top.v now
        MEZZANINE_0_SCL_FPGA : inout std_logic;
        MEZZANINE_0_SDA_FPGA : inout std_logic;
        MEZZANINE_0_INT_N : in std_logic;
        
        -- MEZZANINE 1 SIDEBAND SIGNALS
        MEZZANINE_1_PRESENT_N : in std_logic;
        MEZZANINE_1_ENABLE_N : out std_logic;
        --MEZZANINE_1_RESET : out std_logic;   --this is moved to the top.v now
        MEZZANINE_1_FAULT_N : in std_logic;
        MEZZANINE_1_ONE_WIRE : inout std_logic;
        MEZZANINE_1_ONE_WIRE_STRONG_PULLUP_EN_N : out std_logic;
        --MEZZANINE_1_CLK_SEL : out std_logic; --this is moved to the top.v now
        MEZZANINE_1_SCL_FPGA : inout std_logic;
        MEZZANINE_1_SDA_FPGA : inout std_logic;
        MEZZANINE_1_INT_N : in std_logic;

        -- MEZZANINE 2 SIDEBAND SIGNALS
        MEZZANINE_2_PRESENT_N : in std_logic;
        MEZZANINE_2_ENABLE_N : out std_logic;
        --MEZZANINE_2_RESET : out std_logic;
        MEZZANINE_2_FAULT_N : in std_logic;
        MEZZANINE_2_ONE_WIRE : inout std_logic;
        MEZZANINE_2_ONE_WIRE_STRONG_PULLUP_EN_N : out std_logic;
        --MEZZANINE_2_CLK_SEL : out std_logic;
        MEZZANINE_2_SCL_FPGA : inout std_logic;
        MEZZANINE_2_SDA_FPGA : inout std_logic;
        MEZZANINE_2_INT_N : in std_logic;        

        -- MEZZANINE 3 SIDEBAND SIGNALS
        MEZZANINE_3_PRESENT_N : in    std_logic;
        MEZZANINE_3_ENABLE_N  : out   std_logic;
        MEZZANINE_3_RESET     : out   std_logic;
        MEZZANINE_3_FAULT_N   : in    std_logic;
        MEZZANINE_3_ONE_WIRE  : inout std_logic;
        MEZZANINE_3_ONE_WIRE_STRONG_PULLUP_EN_N : out std_logic;
        MEZZANINE_3_CLK_SEL   : out   std_logic;
        MEZZANINE_3_SCL_FPGA  : inout std_logic;
        MEZZANINE_3_SDA_FPGA  : inout std_logic;
        MEZZANINE_3_INT_N     : in    std_logic;
        
        --Mezzanine 0 Signals
        MEZZ0_SCL_OUT : out std_logic;
        MEZZ0_SDA_OUT : out std_logic;
        MEZZ0_SCL_IN : in std_logic;
        MEZZ0_SDA_IN : in std_logic;
        MEZZ0_INIT_DONE : in std_logic;
        MEZZ0_POST_OK : in std_logic;        
        MEZZ0_ID : in std_logic_vector(2 downto 0);
        MEZZ0_PRESENT : in std_logic;

        --Mezzanine 1 Signals
        MEZZ1_SCL_OUT : out std_logic;
        MEZZ1_SDA_OUT : out std_logic;
        MEZZ1_SCL_IN : in std_logic;
        MEZZ1_SDA_IN : in std_logic;
        MEZZ1_INIT_DONE : in std_logic;
        MEZZ1_POST_OK : in std_logic;        
        MEZZ1_ID : in std_logic_vector(2 downto 0);
        MEZZ1_PRESENT : in std_logic;        
        
        --Mezzanine 2 Signals
        MEZZ2_SCL_OUT : out std_logic;
        MEZZ2_SDA_OUT : out std_logic;
        MEZZ2_SCL_IN : in std_logic;
        MEZZ2_SDA_IN : in std_logic;
        MEZZ2_INIT_DONE : in std_logic;
        MEZZ2_POST_OK : in std_logic;                
        MEZZ2_ID : in std_logic_vector(2 downto 0);
        MEZZ2_PRESENT : in std_logic;        
        
        ONE_GBE_LINK    : in  std_logic;

        -- MOTHERBOARD ONE WIRE EEPROM
        ONE_WIRE_EEPROM : inout std_logic;
        ONE_WIRE_EEPROM_STRONG_PULLUP_EN_N : out std_logic;

        -- I2C INTERFACE AND MONITORING
        I2C_SCL_FPGA             : inout std_logic;
        I2C_SDA_FPGA             : inout std_logic;
        I2C_RESET_FPGA           : out   std_logic;
        FAN_CONT_RST_N           : out   std_logic;
        FAN_CONT_ALERT_N         : in    std_logic;
        FAN_CONT_FAULT_N         : in    std_logic;
        MONITOR_ALERT_N          : in    std_logic;
        MEZZANINE_COMBINED_FAULT : out   std_logic;
        FPGA_ATX_PSU_KILL        : out   std_logic;

        -- USB INTERFACE
        USB_FPGA     : in  std_logic_vector(3 downto 0);
        USB_I2C_CTRL : in  std_logic;
        USB_UART_RXD : out std_logic;
        USB_UART_TXD : in  std_logic;

        PCIE_RST_N      : in  std_logic;
        CPU_PWR_BTN_N   : out std_logic;
        CPU_PWR_OK      : out std_logic;
        CPU_SYS_RESET_N : out std_logic;
        CPU_SUS_S3_N    : in  std_logic;
        CPU_SUS_S4_N    : in  std_logic;
        CPU_SUS_S5_N    : in  std_logic;
        CPU_SUS_STAT_N  : in  std_logic;

        -- FLASH CONFIGURATION INTERFACE
        EMCCLK       : in    std_logic;
        FPGA_EMCCLK2 : in    std_logic;
        FLASH_DQ     : inout std_logic_vector(15 downto 0);
        FLASH_A      : out   std_logic_vector(28 downto 0);
        FLASH_CS_N   : out   std_logic;
        FLASH_OE_N   : out   std_logic;
        FLASH_WE_N   : out   std_logic;
        FLASH_ADV_N  : out   std_logic;
        FLASH_RS0    : out   std_logic;
        FLASH_RS1    : out   std_logic;
        FLASH_WAIT   : in    std_logic;

        -- SPARTAN CONFIGURATION FPGA INTERFACE
        SPARTAN_CLK :  out std_logic;
        CONFIG_IO_0 :  out std_logic;
        CONFIG_IO_1 :  out std_logic;
        CONFIG_IO_2 :  in  std_logic;
        CONFIG_IO_3 :  out std_logic;
        CONFIG_IO_4 :  out std_logic;
        CONFIG_IO_5 :  in  std_logic;
        CONFIG_IO_6 :  out std_logic;
        CONFIG_IO_7 :  out std_logic;
        CONFIG_IO_8 :  out std_logic;
        CONFIG_IO_9 :  out std_logic;
        CONFIG_IO_10 : out std_logic;
        CONFIG_IO_11 : out std_logic;

        -- SPARTAN INTERNAL SPI FLASH
        SPI_MISO : in  std_logic;
        SPI_MOSI : out std_logic;
        SPI_CSB  : out std_logic;
        SPI_CLK  : out std_logic;

        -- GPIO
        DEBUG_UART_TX : out std_logic;
        DEBUG_UART_RX : in  std_logic;

        -- > Master LEDs that will be output (Front panel LEDs)
        dsp_leds_i     : in std_logic_vector(7 downto 0);
        fpga_leds_o    : out std_logic_vector(7 downto 0);
        
        -- AUX CONNECTIONS
        --AUX_CLK_P   : in  std_logic;
        --AUX_CLK_N   : in  std_logic;
        --AUX_SYNCI_P : in  std_logic;
        --AUX_SYNCI_N : in  std_logic;
        --AUX_SYNCO_P : out std_logic;
        --AUX_SYNCO_N : out std_logic;

        EMCCLK_FIX : out std_logic;
        GND        : out std_logic_vector(15 downto 0);

        --DSP Wishbone Arbiter Interface
        WB_SLV_CLK_I_top : out std_logic;
        WB_SLV_RST_I_top : out std_logic;
        WB_SLV_DAT_I_top : out std_logic_vector(31 downto 0);--ST_WB_DATA;
        WB_SLV_DAT_O_top : in  std_logic_vector(31 downto 0);--ST_WB_DATA;
        WB_SLV_ACK_O_top : in  std_logic;
        WB_SLV_ADR_I_top : out std_logic_vector(31 downto 0);--ST_SLAVE_WB_ADDRESS;
        WB_SLV_CYC_I_top : out std_logic;
        WB_SLV_SEL_I_top : out std_logic_vector(3 downto 0);--ST_WB_SEL;
        WB_SLV_STB_I_top : out std_logic;
        WB_SLV_WE_I_top  : out std_logic);

end skarab_infr;

--}} End of automatically maintained section

architecture arch_skarab_infr of skarab_infr is

    constant C_IDLE_TXD : std_logic_vector(255 downto 0):= X"0707070707070707070707070707070707070707070707070707070707070707";
    constant C_IDLE_TXC : std_logic_vector(31 downto 0) := "11111111111111111111111111111111";

    component cont_microblaze_wrapper
    port (
        ACK_I       : in std_logic;
        ADR_O       : out std_logic_vector( 31 downto 0 );
        CYC_O       : out std_logic;
        Clk         : in std_logic;
        DAT_I       : in std_logic_vector( 31 downto 0 );
        DAT_O       : out std_logic_vector( 31 downto 0 );
        RST_O       : out std_logic;
        Reset       : in std_logic;
        SEL_O       : out std_logic_vector( 3 downto 0 );
        STB_O       : out std_logic;
        UART_rxd    : in std_logic;
        UART_txd    : out std_logic;
        WE_O        : out std_logic;
        dcm_locked  : in std_logic);
    end component;
    
    component mezzanine_enable_delay
    port(
        clk : in std_logic;
        rst : in std_logic;
        second_toggle                    : in std_logic;
        mezzanine_enable                 : in std_logic;
        mezzanine_fault_checking_enable  : out std_logic);
    end component;    
    
    component second_gen
    port(
        clk : in std_logic;
        rst : in std_logic;
        second_toggle : out std_logic);
    end component; 
    
    --component clock_frequency_measure
    --port(
    --    clk : in std_logic;
    --    rst : in std_logic;
    --    second_toggle   : in std_logic;
    --    measure_freq    : out std_logic_vector(31 downto 0));
    --end component;       

    component wishbone_interconnect
    port (
        CLK_I : in std_logic;
        RST_I : in std_logic;
        MST_DAT_O : in std_logic_vector(31 downto 0);
        MST_DAT_I : out std_logic_vector(31 downto 0);
        MST_ACK_I : out std_logic;
        MST_ADR_O : in std_logic_vector((C_WB_MST_ADDRESS_BITS - 1) downto 0);
        MST_CYC_O : in std_logic;
        MST_SEL_O : in std_logic_vector(3 downto 0);
        MST_STB_O : in std_logic;
        MST_WE_O  : in std_logic;
        SLV_DAT_O : in T_SLAVE_WB_DATA;
        SLV_DAT_I : out T_SLAVE_WB_DATA;
        SLV_ACK_O : in std_logic_vector(0 to (C_WB_NUM_SLAVES - 1));
        SLV_ADR_I : out T_SLAVE_WB_ADDRESS;
        SLV_CYC_I : out std_logic_vector(0 to (C_WB_NUM_SLAVES - 1));
        SLV_SEL_I : out T_SLAVE_WB_SEL;
        SLV_STB_I : out std_logic_vector(0 to (C_WB_NUM_SLAVES - 1));
        SLV_WE_I  : out std_logic_vector(0 to (C_WB_NUM_SLAVES - 1)));
    end component;

    component wishbone_register
    port (
        CLK_I : in std_logic;
        RST_I : in std_logic;
        DAT_I : in std_logic_vector(31 downto 0);
        DAT_O : out std_logic_vector(31 downto 0);
        ACK_O : out std_logic;
        ADR_I : in std_logic_vector((C_NUM_REGISTER_ADDRESS_BITS + 1) downto 0);
        CYC_I : in std_logic;
        SEL_I : in std_logic_vector(3 downto 0);
        STB_I : in std_logic;
        WE_I  : in std_logic;
        user_read_regs    : in T_REGISTER_BLOCK;
        user_write_regs   : out T_REGISTER_BLOCK);
    end component;

    component wishbone_flash_sdram_interface
    port (
        CLK_I : in std_logic;
        RST_I : in std_logic;
        DAT_I : in std_logic_vector(31 downto 0);
        DAT_O : out std_logic_vector(31 downto 0);
        ACK_O : out std_logic;
        ADR_I : in std_logic_vector(14 downto 0);
        CYC_I : in std_logic;
        SEL_I : in std_logic_vector(3 downto 0);
        STB_I : in std_logic;
        WE_I  : in std_logic;
        fpga_emcclk     : in std_logic;
        fpga_emcclk2    : in std_logic;
        flash_dq_in     : in std_logic_vector(15 downto 0);
        flash_dq_out    : out std_logic_vector(15 downto 0);
        flash_dq_out_en : out std_logic;
        flash_a         : out std_logic_vector(28 downto 0);
        flash_cs_n      : out std_logic;
        flash_oe_n      : out std_logic;
        flash_we_n      : out std_logic;
        flash_adv_n     : out std_logic;
        flash_rs0       : out std_logic;
        flash_rs1       : out std_logic;
        flash_wait      : in std_logic;
        flash_output_enable : out std_logic;
        spartan_clk : out std_logic;
        config_io_0 : out std_logic;
        config_io_1 : out std_logic;
        config_io_2 : in std_logic;
        config_io_3 : out std_logic;
        config_io_4 : out std_logic;
        config_io_5 : in std_logic;
        config_io_6 : out std_logic;
        config_io_7 : out std_logic;
        config_io_8 : out std_logic;
        config_io_9 : out std_logic;
        config_io_10 : out std_logic;
        config_io_11 : out std_logic;
        spi_miso : in std_logic;
        spi_mosi : out std_logic;
        spi_csb  : out std_logic;
        spi_clk  : out std_logic;
        debug_sdram_program_header  : out std_logic_vector(63 downto 0));
    end component;

    component wishbone_one_wire
    generic (
        NUM_ONE_WIRE_INTERFACES : integer);
    port (
        CLK_I : in std_logic;
        RST_I : in std_logic;
        DAT_I : in std_logic_vector(31 downto 0);
        DAT_O : out std_logic_vector(31 downto 0);
        ACK_O : out std_logic;
        ADR_I : in std_logic_vector(2 downto 0);
        CYC_I : in std_logic;
        SEL_I : in std_logic_vector(3 downto 0);
        STB_I : in std_logic;
        WE_I  : in std_logic;
        one_wire_pull_down_enable         : out std_logic_vector((NUM_ONE_WIRE_INTERFACES - 1) downto 0);
        one_wire_in                       : in std_logic_vector((NUM_ONE_WIRE_INTERFACES - 1) downto 0);
        one_wire_strong_pull_up_enable    : out std_logic_vector((NUM_ONE_WIRE_INTERFACES - 1) downto 0));
   end component;

    component wishbone_i2c
    port (
        CLK_I : in std_logic;
        RST_I : in std_logic;
        DAT_I : in std_logic_vector(31 downto 0);
        DAT_O : out std_logic_vector(31 downto 0);
        ACK_O : out std_logic;
        ADR_I : in std_logic_vector(4 downto 0);
        CYC_I : in std_logic;
        SEL_I : in std_logic_vector(3 downto 0);
        STB_I : in std_logic;
        WE_I  : in std_logic;
        scl_pad_i     : in std_logic;
        scl_pad_o     : out std_logic;
        scl_padoen_o  : out std_logic;
        sda_pad_i     : in std_logic;
        sda_pad_o     : out std_logic;
        sda_padoen_o  : out std_logic);
    end component;

    component FPGA_DNA_CHECKER is
        Port(
            CLK_I            : in  std_logic;
            RST_I            : in  std_logic;

            FPGA_EMCCLK2_I   : in  std_logic;
            FPGA_DNA_O       : out std_logic_vector(63 downto 0);
            FPGA_DNA_MATCH_O : out std_logic
        );
    end component FPGA_DNA_CHECKER;
    
    -- GT 29/03/2017 ADDED ACCESS TO XADC
    component xadc_measurement
        port (
            daddr_in        : in std_logic_vector(6 downto 0);
            den_in          : in std_logic;
            di_in           : in std_logic_vector(15 downto 0);
            dwe_in          : in std_logic;
            do_out          : out std_logic_vector(15 downto 0);
            drdy_out        : out std_logic;
            dclk_in         : in std_logic;
            reset_in        : in std_logic;
            busy_out        : out std_logic;
            channel_out     : out std_logic_vector(4 downto 0);
            eoc_out         : out std_logic;
            eos_out         : out std_logic;
            ot_out          : out std_logic;
            user_temp_alarm_out : out std_logic;
            alarm_out       : out std_logic;
            vp_in           : in std_logic;
            vn_in           : in std_logic);
    end component;    
       
    component cross_clock_fifo_wb_out_73x16
    port (
        rst             : in std_logic;
        wr_clk          : in std_logic;
        rd_clk          : in std_logic;
        din             : in std_logic_vector(72 downto 0);
        wr_en           : in std_logic;
        rd_en           : in std_logic;
        dout            : out std_logic_vector(72 downto 0);
        full            : out std_logic;
        empty           : out std_logic);
    end component; 
        
   type T_WB_DSP_WR_STATE is (
     WB_DSP_WR_IDLE,
     WB_DSP_WR_STROBE_CHECK,
     WB_DSP_WR_FIFO_WR_EN_1,
     WB_DSP_WR_FIFO_WR_EN_2,
     WB_DSP_WR_FIFO_WR_EN_3,
     WB_DSP_WR_FIFO_WR_EN_4,     
     WB_DSP_WR_FIFO_WR_DIS);   

    component led_manager
        port (
            clk                     : in std_logic;
            rst                     : in std_logic;
            forty_gbe_link_status   : in std_logic;
            dhcp_resolved           : in std_logic;
            firmware_version        : in std_logic_vector(3 downto 0);
            ublaze_toggle_value     : in std_logic;
            dsp_override_i          : in std_logic;
            dsp_leds_i              : in std_logic_vector(7 downto 0);
            leds_out                : out std_logic_vector(7 downto 0)
            );
    end component;

    signal sys_clk : std_logic;
    signal sys_clk_mmcm : std_logic;
    signal sys_rst : std_logic; 
    signal bsp_rst : std_logic;
    signal user_40gbe_rst : std_logic;

    signal refclk_0 : std_logic;
    signal refclk_1 : std_logic;
    --signal aux_clk : std_logic;
    --signal aux_synci : std_logic;
    --signal aux_synco : std_logic;

    signal user_clk : std_logic;
    signal user_clk_mmcm : std_logic;
    --signal user_rst : std_logic;

    signal bsp_clk : std_logic;
    signal bsp_clk_mmcm : std_logic;
    
    signal emcclk2 : std_logic;
    
    signal sys_mmcm_locked : std_logic;
    signal user_mmcm_locked : std_logic;

    --Reset Synchroniser and user reset signals
    attribute ASYNC_REG : string;

    signal sys_fpga_rst : std_logic;
    signal sync_sys_fpga_rst : std_logic;
    attribute ASYNC_REG of sys_fpga_rst: signal is "TRUE";
    attribute ASYNC_REG of sync_sys_fpga_rst: signal is "TRUE";

    --signal aux_fpga_rst : std_logic;
    --signal sync_aux_fpga_rst : std_logic;
    --attribute ASYNC_REG of aux_fpga_rst: signal is "TRUE";
    --attribute ASYNC_REG of sync_aux_fpga_rst: signal is "TRUE";

    signal user_fpga_rst : std_logic;
    signal sync_user_fpga_rst : std_logic;
    attribute ASYNC_REG of user_fpga_rst: signal is "TRUE";
    attribute ASYNC_REG of sync_user_fpga_rst: signal is "TRUE";

    signal bsp_fpga_rst : std_logic;
    signal sync_bsp_fpga_rst : std_logic;
    attribute ASYNC_REG of bsp_fpga_rst: signal is "TRUE";
    attribute ASYNC_REG of sync_bsp_fpga_rst: signal is "TRUE";
        
    signal gmii_fpga_rst : std_logic;
    signal sync_gmii_fpga_rst : std_logic;
    attribute ASYNC_REG of gmii_fpga_rst: signal is "TRUE";
    attribute ASYNC_REG of sync_gmii_fpga_rst: signal is "TRUE";

    --signal qsfp_fpga_rst : std_logic;
    --signal sync_qsfp_fpga_rst : std_logic;
    --attribute ASYNC_REG of qsfp_fpga_rst: signal is "TRUE";
    --attribute ASYNC_REG of sync_qsfp_fpga_rst: signal is "TRUE";

    --signal emcclk_fpga_rst : std_logic;
    --signal sync_emcclk_fpga_rst : std_logic;       
    --attribute ASYNC_REG of emcclk_fpga_rst: signal is "TRUE";
    --attribute ASYNC_REG of sync_emcclk_fpga_rst: signal is "TRUE";
    
    signal enable_40gbe_packet_generation : std_logic_vector(3 downto 0);
    signal enable_40gbe_packet_generation_z1 : std_logic_vector(3 downto 0);
    signal enable_1gbe_packet_generation : std_logic;
    signal enable_1gbe_packet_generation_z1 : std_logic;

    signal brd_user_read_regs : T_REGISTER_BLOCK;
    signal brd_user_write_regs : T_REGISTER_BLOCK;
    --signal brd_user_read_regs_2 : T_REGISTER_BLOCK;
    --signal brd_user_write_regs_2 : T_REGISTER_BLOCK;

    signal WB_MST_ACK_I : std_logic;
    signal WB_MST_ADR_O : std_logic_vector(31 downto 0);
    signal WB_MST_CYC_O : std_logic;
    signal WB_MST_DAT_I : std_logic_vector(31 downto 0);
    signal WB_MST_DAT_O : std_logic_vector(31 downto 0);
    signal WB_MST_RST_O : std_logic;
    signal WB_MST_SEL_O : std_logic_vector(3 downto 0);
    signal WB_MST_STB_O : std_logic;
    signal WB_MST_WE_O : std_logic;

    signal WB_SLV_DAT_O : T_SLAVE_WB_DATA;
    signal WB_SLV_DAT_I : T_SLAVE_WB_DATA;
    signal WB_SLV_ACK_O : std_logic_vector(0 to (C_WB_NUM_SLAVES - 1));
    signal WB_SLV_ADR_I : T_SLAVE_WB_ADDRESS;
    signal WB_SLV_CYC_I : std_logic_vector(0 to (C_WB_NUM_SLAVES - 1));
    signal WB_SLV_SEL_I : T_SLAVE_WB_SEL;
    signal WB_SLV_STB_I : std_logic_vector(0 to (C_WB_NUM_SLAVES - 1));
    signal WB_SLV_WE_I  : std_logic_vector(0 to (C_WB_NUM_SLAVES - 1));

    signal spartan_clk_i : std_logic;
    signal config_io_0_i : std_logic;
    signal config_io_1_i : std_logic;
    signal config_io_2_i : std_logic;
    signal config_io_3_i : std_logic;
    signal config_io_4_i : std_logic;
    signal config_io_5_i : std_logic;
    signal config_io_6_i : std_logic;
    signal config_io_7_i : std_logic;
    signal config_io_8_i : std_logic;
    signal config_io_9_i : std_logic;
    signal config_io_10_i : std_logic;
    signal config_io_11_i : std_logic;
    signal spi_miso_i : std_logic;
    signal spi_mosi_i : std_logic;
    signal spi_csb_i : std_logic;
    signal spi_clk_i : std_logic;

    signal one_wire_pull_down_enable : std_logic_vector(4 downto 0);
    signal one_wire_in : std_logic_vector(4 downto 0);
    signal one_wire_strong_pull_up_enable_i : std_logic_vector(4 downto 0);

    signal flash_dq_out : std_logic_vector(15 downto 0);
    signal flash_dq_out_en : std_logic;
    signal flash_a_i : std_logic_vector(28 downto 0);
    signal flash_output_enable : std_logic;
    signal flash_rs0_i : std_logic;
    signal flash_rs1_i : std_logic;
    signal flash_cs_n_i : std_logic;
    signal flash_oe_n_i : std_logic;
    signal flash_we_n_i : std_logic;
    signal flash_adv_n_i : std_logic;

    signal i2c_scl_pad_i : std_logic_vector(0 to 4);
    signal i2c_scl_pad_o : std_logic_vector(0 to 4);
    signal i2c_scl_padoen_o : std_logic_vector(0 to 4);
    signal i2c_sda_pad_i : std_logic_vector(0 to 4);
    signal i2c_sda_pad_o : std_logic_vector(0 to 4);
    signal i2c_sda_padoen_o : std_logic_vector(0 to 4);

    signal sfp_reset_delay_low : std_logic_vector(15 downto 0);
    signal sfp_reset_delay_low_over : std_logic;
    signal sfp_reset_delay_high : std_logic_vector(12 downto 0);

    signal microblaze_uart_rxd : std_logic;
    signal microblaze_uart_txd : std_logic;

    signal mezzanine_0_enable : std_logic;
    signal mezzanine_1_enable : std_logic;
    signal mezzanine_2_enable : std_logic;
    signal mezzanine_3_enable : std_logic;

    signal mezzanine_0_fault_checking_enable : std_logic;
    signal mezzanine_1_fault_checking_enable : std_logic;
    signal mezzanine_2_fault_checking_enable : std_logic;
    signal mezzanine_3_fault_checking_enable : std_logic;

    signal mezzanine_0_fault : std_logic;
    signal mezzanine_1_fault : std_logic;
    signal mezzanine_2_fault : std_logic;
    signal mezzanine_3_fault : std_logic;

    signal host_reset_req : std_logic;
    signal host_reset_req_z : std_logic;
    signal host_reset_count : std_logic_vector(7 downto 0);
    signal host_reset : std_logic;

    signal host_reset_u : std_logic;
    signal host_reset_u2 : std_logic;
    signal host_reset_u3 : std_logic; 
    attribute ASYNC_REG of host_reset_u: signal is "TRUE";
    attribute ASYNC_REG of host_reset_u2: signal is "TRUE";    
    attribute ASYNC_REG of host_reset_u3: signal is "TRUE";    
    
    signal host_reset_d : std_logic;
    signal host_reset_d2 : std_logic;
    signal host_reset_d3 : std_logic; 
    attribute ASYNC_REG of host_reset_d: signal is "TRUE";
    attribute ASYNC_REG of host_reset_d2: signal is "TRUE";    
    attribute ASYNC_REG of host_reset_d3: signal is "TRUE";         

    signal led_rx : std_logic;
    signal led_tx : std_logic;
    signal led_up : std_logic;

    signal phy_rx_up_z1_0  : std_logic;
    signal phy_rx_up_z2_0  : std_logic;
    signal phy_rx_up_cpu_0 : std_logic;
    attribute ASYNC_REG of phy_rx_up_z1_0: signal is "TRUE";
    attribute ASYNC_REG of phy_rx_up_z2_0: signal is "TRUE";    
    attribute ASYNC_REG of phy_rx_up_cpu_0: signal is "TRUE";     

    signal phy_rx_up_z1_1  : std_logic;
    signal phy_rx_up_z2_1  : std_logic;
    signal phy_rx_up_cpu_1 : std_logic;
    attribute ASYNC_REG of phy_rx_up_z1_1: signal is "TRUE";
    attribute ASYNC_REG of phy_rx_up_z2_1: signal is "TRUE";    
    attribute ASYNC_REG of phy_rx_up_cpu_1: signal is "TRUE";      

    signal phy_rx_up_z1_2  : std_logic;
    signal phy_rx_up_z2_2  : std_logic;
    signal phy_rx_up_cpu_2 : std_logic;
    attribute ASYNC_REG of phy_rx_up_z1_2: signal is "TRUE";
    attribute ASYNC_REG of phy_rx_up_z2_2: signal is "TRUE";    
    attribute ASYNC_REG of phy_rx_up_cpu_2: signal is "TRUE";      
    
    signal phy_rx_up_z1_3  : std_logic;
    signal phy_rx_up_z2_3  : std_logic;
    signal phy_rx_up_cpu_3 : std_logic;
    attribute ASYNC_REG of phy_rx_up_z1_3: signal is "TRUE";
    attribute ASYNC_REG of phy_rx_up_z2_3: signal is "TRUE";    
    attribute ASYNC_REG of phy_rx_up_cpu_3: signal is "TRUE";      
    
    -- GT 29/03/2017 XADC SIGNALS
    signal xadc_busy_out : std_logic;
    signal xadc_channel_out :  std_logic_vector (4 downto 0);
    signal xadc_eoc_out : std_logic;
    signal xadc_eos_out : std_logic;
    signal xadc_ot_out : std_logic;
    signal xadc_user_temp_alarm_out : std_logic;
    signal xadc_alarm_out : std_logic;
    
    signal xadc_daddr_in : std_logic_vector (6 downto 0);
    signal xadc_den_in : std_logic;
    signal xadc_di_in : std_logic_vector (15 downto 0);
    signal xadc_dwe_in : std_logic;
    signal xadc_do_out : std_logic_vector (15 downto 0);
    signal xadc_drdy_out : std_logic;    
    
    -- AP: LED Manager
    -- > Will use the following signals:
    --   -> clk => sys_clk and rst => sys_rst
    --   -> forty_gbe_link_status => fgbe_link_status
    --   -> dhcp_resolved => brd_user_write_regs(C_WR_FRONT_PANEL_STAT_LED_ADDR)(0)
    --   -> firmware_version => C_VERSION (from parameter.vhd), or brd_user_read_regs(C_RD_VERSION_ADDR)
    --   -> dsp_override_i and dsp_leds_in
    --   -> leds_out => FPGA_LEDS(7 downto 0)
    
    signal mezzanine_fault_override : std_logic;

    signal src_packets_sent : std_logic_vector(15 downto 0);
    signal xaui_packets_sent : std_logic_vector(15 downto 0);
    signal gmii_packets_sent : std_logic_vector(15 downto 0);

    signal debug_out : std_logic_vector(7 downto 0);

    signal timer_counter_reset : std_logic;
    signal timer_counter_low : std_logic_vector(15 downto 0);
    signal timer_counter_low_over : std_logic;
    signal timer_counter_high : std_logic_vector(15 downto 0);
    signal timer_counter_low_latched : std_logic_vector(15 downto 0);
    signal timer_counter_high_latched : std_logic_vector(15 downto 0);
    signal timer_counter_stop : std_logic;
    signal timer_counter_stop_z1 : std_logic;
    signal timer_link : std_logic_vector(2 downto 0);

    signal latched_ramp_fault : std_logic_vector(255 downto 0);
    signal latched_desired_data : std_logic_vector(15 downto 0);
    signal latched_rx_valid : std_logic_vector(3 downto 0);
    signal latched_overflow : std_logic;
    signal latched_packet_number : std_logic_vector(15 downto 0);
    signal packet_size : std_logic_vector(15 downto 0);

    --signal qsfp_xl_tx_clk_156m25_frequency : std_logic_vector(31 downto 0);
    --signal fpga_emcclk2_frequency : std_logic_vector(31 downto 0);

    signal ramp_fault : std_logic;
    signal ramp_fault_reg : std_logic;

    signal second_toggle : std_logic;
    --signal aux_clk_frequency : std_logic_vector(31 downto 0);

    signal ramp_source_destination_ip_address_0 : std_logic_vector(31 downto 0);
    signal ramp_checker_source_ip_address_0 : std_logic_vector(31 downto 0);
    signal ramp_source_destination_ip_address_1 : std_logic_vector(31 downto 0);
    signal ramp_checker_source_ip_address_1 : std_logic_vector(31 downto 0);
    signal ramp_source_destination_ip_address_2 : std_logic_vector(31 downto 0);
    signal ramp_checker_source_ip_address_2 : std_logic_vector(31 downto 0);
    signal ramp_source_destination_ip_address_3 : std_logic_vector(31 downto 0);
    signal ramp_checker_source_ip_address_3 : std_logic_vector(31 downto 0);

    signal payload_words : std_logic_vector(10 downto 0);

    -- MB 08/10/2015 ADDED SUPPORT FOR READING FPGA DNA
    signal fpga_dna : std_logic_vector(63 downto 0);
    
    --signal select_one_gbe_data_sel  : std_logic;

    signal sys_clk_mmcm_fb : std_logic;
    signal user_clk_mmcm_fb : std_logic;
    
    --I2C Mezzanine 0 Signals
    signal smezz0_scl_out : std_logic;
    signal smezz0_sda_out : std_logic;
    signal smezz0_scl_in : std_logic;
    signal smezz0_sda_in : std_logic;

    --I2C Mezzanine 1 Signals
    signal smezz1_scl_out : std_logic;
    signal smezz1_sda_out : std_logic;
    signal smezz1_scl_in : std_logic;
    signal smezz1_sda_in : std_logic;
    
    --I2C Mezzanine 2 Signals
    signal smezz2_scl_out : std_logic;
    signal smezz2_sda_out : std_logic;
    signal smezz2_scl_in : std_logic;
    signal smezz2_sda_in : std_logic;
    
    --Wishbone DSP FIFO Signals
    --Output to DSP
    signal wb_cross_clock_out_din : std_logic_vector(72 downto 0);
    signal wb_cross_clock_out_wrreq : std_logic;
    signal wb_cross_clock_out_rdreq : std_logic;
    signal wb_cross_clock_out_dout : std_logic_vector(72 downto 0);
    signal wb_cross_clock_out_full : std_logic;
    signal wb_cross_clock_out_empty : std_logic;
    
    --Input from DSP
    signal wb_data_in : std_logic_vector(31 downto 0);
    signal wb_ack_in : std_logic;
    signal wb_ack_in_z1 : std_logic;
    signal wb_ack_in_z2 : std_logic;
    signal wb_sync_ack_in : std_logic;
    signal wb_sync_data_in : std_logic_vector(31 downto 0);
    
    
    --Wishbone Write State Machine
    signal wb_dsp_wr_state : T_WB_DSP_WR_STATE;
    signal wb_slv_stb_hist_i : std_logic;
    
    --Mezzanine 3 
    signal MEZZ3_ID : std_logic_vector(2 downto 0);
    signal MEZZ3_PRESENT : std_logic;
    
    --fortygbe tx and rx LED signals
    signal s_xlgmii_txled_0 : std_logic_vector(1 downto 0);
    signal s_xlgmii_txled_1 : std_logic_vector(1 downto 0);
    signal s_xlgmii_txled_2 : std_logic_vector(1 downto 0);
    signal s_xlgmii_txled_3 : std_logic_vector(1 downto 0);
    signal s_xlgmii_rxled_0 : std_logic_vector(1 downto 0);
    signal s_xlgmii_rxled_1 : std_logic_vector(1 downto 0);
    signal s_xlgmii_rxled_2 : std_logic_vector(1 downto 0);
    signal s_xlgmii_rxled_3 : std_logic_vector(1 downto 0);
    signal sBusLedValid : std_logic;
    signal sBusLedValidD1 : std_logic;
    attribute ASYNC_REG of sBusLedValid: signal is "TRUE";
    attribute ASYNC_REG of sBusLedValidD1: signal is "TRUE"; 
   
    --LED Manager synchronisation signals
    signal sDhcpResolvedD2 : std_logic;
    signal sDhcpResolvedD1 : std_logic;  
    attribute ASYNC_REG of sDhcpResolvedD2: signal is "TRUE";
    attribute ASYNC_REG of sDhcpResolvedD1: signal is "TRUE";     
    signal sUbToggleValueD2 : std_logic;
    signal sUbToggleValueD1 : std_logic;  
    attribute ASYNC_REG of sUbToggleValueD2: signal is "TRUE";
    attribute ASYNC_REG of sUbToggleValueD1: signal is "TRUE";     
    signal sDspOverrideD2 : std_logic;
    signal sDspOverrideD1 : std_logic;  
    attribute ASYNC_REG of sDspOverrideD2: signal is "TRUE";
    attribute ASYNC_REG of sDspOverrideD1: signal is "TRUE"; 
    
    --QSFP Soft Reset Signal
    signal sQsfpSoftReset0D1 : std_logic;
    signal sQsfpSoftReset0D2 : std_logic;
    attribute ASYNC_REG of sQsfpSoftReset0D2: signal is "TRUE";
    attribute ASYNC_REG of sQsfpSoftReset0D1: signal is "TRUE"; 
    signal sQsfpSoftReset1D1 : std_logic;
    signal sQsfpSoftReset1D2 : std_logic;
    attribute ASYNC_REG of sQsfpSoftReset1D2: signal is "TRUE";
    attribute ASYNC_REG of sQsfpSoftReset1D1: signal is "TRUE"; 
    signal sQsfpSoftReset2D1 : std_logic;
    signal sQsfpSoftReset2D2 : std_logic;
    attribute ASYNC_REG of sQsfpSoftReset2D2: signal is "TRUE";
    attribute ASYNC_REG of sQsfpSoftReset2D1: signal is "TRUE"; 
    signal sQsfpSoftReset3D1 : std_logic;
    signal sQsfpSoftReset3D2 : std_logic;
    attribute ASYNC_REG of sQsfpSoftReset3D2: signal is "TRUE";
    attribute ASYNC_REG of sQsfpSoftReset3D1: signal is "TRUE"; 
    
    --HMC Status Signals
    signal sMezz0InitDoneD1 : std_logic;
    signal sMezz0InitDoneD2 : std_logic;
    attribute ASYNC_REG of sMezz0InitDoneD2: signal is "TRUE";
    attribute ASYNC_REG of sMezz0InitDoneD1: signal is "TRUE";     
    signal sMezz1InitDoneD1 : std_logic;
    signal sMezz1InitDoneD2 : std_logic;
    attribute ASYNC_REG of sMezz1InitDoneD2: signal is "TRUE";
    attribute ASYNC_REG of sMezz1InitDoneD1: signal is "TRUE";     
    signal sMezz2InitDoneD1 : std_logic;
    signal sMezz2InitDoneD2 : std_logic;
    attribute ASYNC_REG of sMezz2InitDoneD2: signal is "TRUE";
    attribute ASYNC_REG of sMezz2InitDoneD1: signal is "TRUE";        
    signal sMezz0PostOkD1 : std_logic;
    signal sMezz0PostOkD2 : std_logic;
    attribute ASYNC_REG of sMezz0PostOkD2: signal is "TRUE";
    attribute ASYNC_REG of sMezz0PostOkD1: signal is "TRUE";       
    signal sMezz1PostOkD1 : std_logic;
    signal sMezz1PostOkD2 : std_logic;    
    attribute ASYNC_REG of sMezz1PostOkD2: signal is "TRUE";
    attribute ASYNC_REG of sMezz1PostOkD1: signal is "TRUE";       
    signal sMezz2PostOkD1 : std_logic;
    signal sMezz2PostOkD2 : std_logic;
    attribute ASYNC_REG of sMezz2PostOkD2: signal is "TRUE";
    attribute ASYNC_REG of sMezz2PostOkD1: signal is "TRUE";      
    --1GbE Signals
    signal sGbeStatusVectorD2 : std_logic;
    signal sGbeStatusVectorD1 : std_logic;
    attribute ASYNC_REG of sGbeStatusVectorD2: signal is "TRUE";
    attribute ASYNC_REG of sGbeStatusVectorD1: signal is "TRUE"; 
    signal sGmiiResetDoneD2 : std_logic;
    signal sGmiiResetDoneD1 : std_logic;
    attribute ASYNC_REG of sGmiiResetDoneD2: signal is "TRUE";
    attribute ASYNC_REG of sGmiiResetDoneD1: signal is "TRUE";
    signal sGmiiResetDone : std_logic;
    
                     
begin
    --Mezzanine 3 ID and Present (this should be part of the 40GbE yellow block, but is part of the BSP for now)
    --Mezzanine ID: "000" = spare, "001" = 40GbE, "010" = HMC, "011" = ADC, rest = spare
    MEZZ3_ID <= "001";
    MEZZ3_PRESENT <= '1';

    EMCCLK_FIX <= EMCCLK;

    -- These signals are not used but kept in for completeness sake.
    -- They are for the com express, which is not populated on the SKA boards
    CPU_PWR_BTN_N   <= '1';
    CPU_PWR_OK      <= '0';
    CPU_SYS_RESET_N <= '0';

    GND <= (others => '0');
    
---------------------------------------------------------------------------
-- REFCLK CONNECTIONS
---------------------------------------------------------------------------

    refclk_0_ibufgds : IBUFGDS
    generic map (
        DIFF_TERM => TRUE)
    port map (
        I  => FPGA_REFCLK_BUF0_P,
        IB => FPGA_REFCLK_BUF0_N,
        O  => refclk_0);

    refclk_1_ibufgds : IBUFGDS
    generic map (
        DIFF_TERM => TRUE)
    port map (
        I  => FPGA_REFCLK_BUF1_P,
        IB => FPGA_REFCLK_BUF1_N,
        O  => refclk_1);


---------------------------------------------------------------------------
-- system clock mmcm
---------------------------------------------------------------------------

    SYS_CLK_MMCM_inst : MMCME2_BASE
    generic map (
        BANDWIDTH        => "OPTIMIZED", -- Jitter programming (OPTIMIZED, HIGH, LOW)
        CLKFBOUT_MULT_F  => 6.0,         -- Multiply value for all CLKOUT (2.000-64.000).
        CLKFBOUT_PHASE   => 0.0,         -- Phase offset in degrees of CLKFB (-360.000-360.000).
        CLKIN1_PERIOD    => 6.4,         -- 156.25MHz Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
        -- CLKOUT0_DIVIDE - CLKOUT6_DIVIDE: Divide amount for each CLKOUT (1-128)
        CLKOUT0_DIVIDE_F => 6.0,         -- Divide amount for CLKOUT0 (1.000-128.000).
        CLKOUT1_DIVIDE   => 24,          -- Divide amount for CLKOUT1 (1.000-128.000).
        DIVCLK_DIVIDE    => 1,           -- Master division value (1-106)
        REF_JITTER1      => 0.0,         -- Reference input jitter in UI (0.000-0.999).
        STARTUP_WAIT     => FALSE        -- Delays DONE until MMCM is locked (FALSE, TRUE)
    )
    port map (
        CLKOUT0   => sys_clk_mmcm,
        CLKOUT1   => bsp_clk_mmcm,
        CLKFBOUT  => sys_clk_mmcm_fb,  -- Feedback clock output
        LOCKED    => sys_mmcm_locked,
        --LOCKED    => user_mmcm_locked,
        CLKIN1    => refclk_0,         -- Main clock input
        PWRDWN    => '0',
        RST       => not FPGA_RESET_N,--'0',              -- fpga_reset,
        CLKFBIN   => sys_clk_mmcm_fb   -- Feedback clock input
    );

    sys_clk_BUFG_inst : BUFG
    port map (
        I => sys_clk_mmcm, -- Clock input
        O => sys_clk       -- Clock output
    );
    
    bsp_clk_BUFG_inst : BUFG
    port map (
        I => bsp_clk_mmcm, -- Clock input
        O => bsp_clk       -- Clock output
    );

    USER_CLK_MMCM_inst : MMCME2_BASE
    generic map (
        BANDWIDTH        => "OPTIMIZED", -- Jitter programming (OPTIMIZED, HIGH, LOW)
        CLKFBOUT_MULT_F  => MULTIPLY,    -- Multiply value for all CLKOUT (2.000-64.000).
        CLKFBOUT_PHASE   => 0.0,         -- Phase offset in degrees of CLKFB (-360.000-360.000).
        CLKIN1_PERIOD    => 6.4,         -- 156.25MHz Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
        -- CLKOUT0_DIVIDE - CLKOUT6_DIVIDE: Divide amount for each CLKOUT (1-128)
        CLKOUT0_DIVIDE_F => DIVIDE,      -- Divide amount for CLKOUT0 (1.000-128.000).
        DIVCLK_DIVIDE    => DIVCLK,      -- Master division value (1-106)
        REF_JITTER1      => 0.0,         -- Reference input jitter in UI (0.000-0.999).
        STARTUP_WAIT     => FALSE        -- Delays DONE until MMCM is locked (FALSE, TRUE)
    )
    port map (
        CLKOUT0   => user_clk_mmcm,
        CLKFBOUT  => user_clk_mmcm_fb,  -- Feedback clock output
        LOCKED    => user_mmcm_locked,
        CLKIN1    => refclk_0,          -- Main clock input
        PWRDWN    => '0',
        RST       => not sys_mmcm_locked,   --fpga_reset,
        CLKFBIN   => user_clk_mmcm_fb   -- Feedback clock input
    );

    user_clk_BUFG_inst : BUFG
    port map (
        I => user_clk_mmcm, -- Clock input
        O => user_clk       -- Clock output
    );

    --signal qsfp_gtrefclk : std_logic;
    --signal qsfp_gtrefclk_pb : std_logic;
    
    emcclk2_BUFG_inst : BUFG
    port map (
        I => FPGA_EMCCLK2, -- Clock input
        O => emcclk2       -- Clock output
    );



    --user_clk <= sys_clk;

    --sys_clk    <= refclk_0;
    user_clk_o <= user_clk;
    --AI: Sys reset is synchronised with the user clock.
    user_rst_o <= user_fpga_rst;
    hmc_rst_o  <= sys_rst;
    hmc_clk_o  <= sys_clk;

    host_reset_o <= host_reset;
    
---------------------------------------------------------------------------
-- RESETS
---------------------------------------------------------------------------

    pSysResetSynchroniser : process(user_mmcm_locked, sys_clk)
    begin
       if (user_mmcm_locked = '0')then
           sys_fpga_rst <= '1';
           sync_sys_fpga_rst <= '1';
       elsif (rising_edge(sys_clk))then
          if (host_reset_d3 = '0') then
            sync_sys_fpga_rst <= '0';
            sys_fpga_rst <= sync_sys_fpga_rst;
          else
            sync_sys_fpga_rst <= '1';
            sys_fpga_rst <= '1';
          end if;  
       end if;
    end process;

    pUserResetSynchroniser : process(user_mmcm_locked, user_clk)
    begin
       if (user_mmcm_locked = '0')then
           user_fpga_rst <= '1';
           sync_user_fpga_rst <= '1';
       elsif (rising_edge(user_clk))then
          if (host_reset_u3 = '0') then
            sync_user_fpga_rst <= '0';
            user_fpga_rst <= sync_user_fpga_rst;
          else
            sync_user_fpga_rst <= '1';
            user_fpga_rst <= '1';
          end if;  
       end if;
    end process;
    
   pBspResetSynchroniser : process(user_mmcm_locked, bsp_clk)
    begin
        if (user_mmcm_locked = '0')then
            bsp_fpga_rst <= '1';
            sync_bsp_fpga_rst <= '1';
        elsif (rising_edge(bsp_clk))then
           if (host_reset = '0') then
             sync_bsp_fpga_rst <= '0';
             bsp_fpga_rst <= sync_bsp_fpga_rst;
           else
             sync_bsp_fpga_rst <= '1';
             bsp_fpga_rst <= '1';
           end if;  
        end if;
     end process;     
     
    sys_rst  <= sys_fpga_rst;
    --user_rst <= user_fpga_rst;
    bsp_rst <=  bsp_fpga_rst;
 
    --pFpgaResetAuxSynchroniser : process(user_mmcm_locked, aux_clk)
    --begin
    --    if (user_mmcm_locked = '0')then
    --        sync_aux_fpga_rst <= '1';
    --        aux_fpga_rst <= '1';
    --    elsif (rising_edge(aux_clk))then
    --        sync_aux_fpga_rst <= '0';
    --        aux_fpga_rst <= sync_aux_fpga_rst;
    --    end if;
    --end process; 

    pFpgaResetGmiiSynchroniser : process(user_mmcm_locked, gmii_clk)
    begin
        if (user_mmcm_locked = '0')then
            sync_gmii_fpga_rst <= '1';
            gmii_fpga_rst <= '1';
        elsif (rising_edge(gmii_clk))then
            sync_gmii_fpga_rst <= '0';
            gmii_fpga_rst <= sync_gmii_fpga_rst;
        end if;
    end process;

    --pFpgaResetQsfpSynchroniser : process(user_mmcm_locked, qsfp_gtrefclk)
    --begin
    --    if (user_mmcm_locked = '0')then
    --        sync_qsfp_fpga_rst <= '1';
    --        qsfp_fpga_rst <= '1';
    --    elsif (rising_edge(qsfp_gtrefclk))then
    --        sync_qsfp_fpga_rst <= '0';
    --        qsfp_fpga_rst <= sync_qsfp_fpga_rst;
    --    end if;
    --end process; 
    
    --pFpgaResetEmcclkSynchroniser : process(user_mmcm_locked, FPGA_EMCCLK2)
    --begin
    --    if (user_mmcm_locked = '0')then
    --        sync_emcclk_fpga_rst <= '1';
    --        emcclk_fpga_rst <= '1';
    --    elsif (rising_edge(FPGA_EMCCLK2))then
    --        sync_emcclk_fpga_rst <= '0';
    --        emcclk_fpga_rst <= sync_emcclk_fpga_rst;
    --    end if;
    --end process;     

    FAN_CONT_RST_N <= FPGA_RESET_N;

    gen_host_reset_req_z : process(bsp_clk)
    begin
        if (rising_edge(bsp_clk))then
            host_reset_req_z <= host_reset_req;
        end if;
    end process;

    gen_host_reset_count : process(user_mmcm_locked, bsp_clk)
    begin
        if (user_mmcm_locked = '0')then
            host_reset_count <= (others => '1');
        elsif (rising_edge(bsp_clk))then
            if ((host_reset_req_z = '0')and(host_reset_req = '1'))then
                host_reset_count <= (others => '0');
            else
                if (host_reset_count /= X"FF")then
                    host_reset_count <= host_reset_count + X"01";
                end if;
            end if;
        end if;
    end process;
    
    reg_host_reset :process(bsp_clk)
    begin
        if (rising_edge(bsp_clk))then
            if ((host_reset_count = X"FF"))then
                host_reset <= '0';
            else
                host_reset <= '1'; 
            end if;
        end if;    
    end process;

    --host_reset <= '0' when (host_reset_count = X"FF") else '1';

    --host reset synchronised to the user_clk
    gen_host_reset_u : process(user_clk)
    begin
        if (rising_edge(user_clk))then
            host_reset_u <= host_reset;
            host_reset_u2 <= host_reset_u;
            host_reset_u3 <= host_reset_u2;
        end if;
    end process;
    
    --host reset synchronised to the sys_clk
    gen_host_reset_d : process(sys_clk)
    begin
        if (rising_edge(sys_clk))then
            host_reset_d <= host_reset;
            host_reset_d2 <= host_reset_d;
            host_reset_d3 <= host_reset_d2;
        end if;
    end process;    

----------------------------------------------------------------------------
-- REGISTER CONNECTIONS
----------------------------------------------------------------------------

    brd_user_read_regs(C_RD_VERSION_ADDR) <= C_VERSION;

    brd_user_read_regs(C_RD_BRD_CTL_STAT_0_ADDR)(0) <= sGmiiResetDoneD2;


    brd_user_read_regs(C_RD_BRD_CTL_STAT_0_ADDR)(1) <= not MONITOR_ALERT_N;
    brd_user_read_regs(C_RD_BRD_CTL_STAT_0_ADDR)(2) <= not FAN_CONT_ALERT_N;
    brd_user_read_regs(C_RD_BRD_CTL_STAT_0_ADDR)(3) <= not FAN_CONT_FAULT_N;
    brd_user_read_regs(C_RD_BRD_CTL_STAT_0_ADDR)(4) <= ONE_GBE_LINK;
    brd_user_read_regs(C_RD_BRD_CTL_STAT_0_ADDR)(5) <= gbe_int_n;

    --brd_user_read_regs(C_RD_BRD_CTL_STAT_0_ADDR)(6) <= one_gbe_packets_checked;
    --brd_user_read_regs(C_RD_BRD_CTL_STAT_0_ADDR)(7) <= one_gbe_ramp_fault;
    --brd_user_read_regs(C_RD_BRD_CTL_STAT_0_ADDR)(8) <= one_gbe_ip_fault;

    --brd_user_read_regs(C_RD_BRD_CTL_STAT_0_ADDR)(9) <= xlgmii_packets_checked(0);
    --brd_user_read_regs(C_RD_BRD_CTL_STAT_0_ADDR)(10) <= xlgmii_ramp_fault(0);
    --brd_user_read_regs(C_RD_BRD_CTL_STAT_0_ADDR)(11) <= xlgmii_ip_fault(0);

    --brd_user_read_regs(C_RD_BRD_CTL_STAT_0_ADDR)(12) <= xlgmii_packets_checked(1);
    --brd_user_read_regs(C_RD_BRD_CTL_STAT_0_ADDR)(13) <= xlgmii_ramp_fault(1);
    --brd_user_read_regs(C_RD_BRD_CTL_STAT_0_ADDR)(14) <= xlgmii_ip_fault(1);

    --brd_user_read_regs(C_RD_BRD_CTL_STAT_0_ADDR)(15) <= xlgmii_packets_checked(2);
    --brd_user_read_regs(C_RD_BRD_CTL_STAT_0_ADDR)(16) <= xlgmii_ramp_fault(2);
    --brd_user_read_regs(C_RD_BRD_CTL_STAT_0_ADDR)(17) <= xlgmii_ip_fault(2);

    --brd_user_read_regs(C_RD_BRD_CTL_STAT_0_ADDR)(18) <= xlgmii_packets_checked(3);
    --brd_user_read_regs(C_RD_BRD_CTL_STAT_0_ADDR)(19) <= xlgmii_ramp_fault(3);
    --brd_user_read_regs(C_RD_BRD_CTL_STAT_0_ADDR)(20) <= xlgmii_ip_fault(3);

    brd_user_read_regs(C_RD_BRD_CTL_STAT_0_ADDR)(31 downto 21) <= (others => '0');
    
    --1GbE data select (1 = 1 GbE data select, 0 = 1 GbE configuration only)
    --select_one_gbe_data_sel  <= brd_user_write_regs(C_WR_BRD_CTL_STAT_0_ADDR)(1);
    mezzanine_fault_override <= brd_user_write_regs(C_WR_BRD_CTL_STAT_0_ADDR)(2);
    --enable_1gbe_packet_generation <= brd_user_write_regs(C_WR_BRD_CTL_STAT_0_ADDR)(3);
    --enable_40gbe_packet_generation <= brd_user_write_regs(C_WR_BRD_CTL_STAT_0_ADDR)(7 downto 4);
    timer_link <= brd_user_write_regs(C_WR_BRD_CTL_STAT_0_ADDR)(29 downto 27);
    host_reset_req <= brd_user_write_regs(C_WR_BRD_CTL_STAT_0_ADDR)(30);
    
    FPGA_ATX_PSU_KILL <= (brd_user_write_regs(C_WR_BRD_CTL_STAT_0_ADDR)(31) and brd_user_write_regs(C_WR_BRD_CTL_STAT_1_ADDR)(31));
    

    brd_user_read_regs(C_RD_LOOPBACK_ADDR) <= brd_user_write_regs(C_WR_LOOPBACK_ADDR);
    
    
    pCDC1GbESynchroniser : process(bsp_clk)
    begin
        if (rising_edge(bsp_clk))then
           sGbeStatusVectorD2 <= sGbeStatusVectorD1;
           sGbeStatusVectorD1 <= gbe_status_vector(0);
           sGmiiResetDoneD2 <= sGmiiResetDoneD1;
           sGmiiResetDoneD1 <= sGmiiResetDone;                        
       end if;
    end process pCDC1GbESynchroniser;
    
    pCDC1GbEResetDoneReg : process(gmii_clk)
    begin
        if (rising_edge(gmii_clk))then
          sGmiiResetDone <= gmii_reset_done;                       
       end if;
    end process pCDC1GbEResetDoneReg;    
    
    
    

    -- LINK UP STATUS
    -- GT 29/03/2017 INCLUDE 1GBE PHY LINK UP STATUS
    brd_user_read_regs(C_RD_ETH_IF_LINK_UP_ADDR)(0) <= '1' when ((sGbeStatusVectorD2 = '1')and(ONE_GBE_LINK = '1')) else '0'; -- 1GB ETH LINK UP
    brd_user_read_regs(C_RD_ETH_IF_LINK_UP_ADDR)(1) <= phy_rx_up_cpu_0;  -- 40GB ETH 0 LINK UP
    brd_user_read_regs(C_RD_ETH_IF_LINK_UP_ADDR)(2) <= phy_rx_up_cpu_1;  -- 40GB ETH 1 LINK UP
    brd_user_read_regs(C_RD_ETH_IF_LINK_UP_ADDR)(3) <= phy_rx_up_cpu_2;  -- 40GB ETH 2 LINK UP
    brd_user_read_regs(C_RD_ETH_IF_LINK_UP_ADDR)(4) <= phy_rx_up_cpu_3;  -- 40GB ETH 3 LINK UP
    --brd_user_read_regs(C_RD_ETH_IF_LINK_UP_ADDR)(5) <= '1';    -- GBE COMPILED IN
    -- include when the 1gbe is extracted
    brd_user_read_regs(C_RD_ETH_IF_LINK_UP_ADDR)(5) <= gbe_if_present;    -- GBE COMPILED IN
    brd_user_read_regs(C_RD_ETH_IF_LINK_UP_ADDR)(6) <= fgbe_if_0_present; -- 40GB ETH 1 COMPILED IN
    brd_user_read_regs(C_RD_ETH_IF_LINK_UP_ADDR)(7) <= fgbe_if_1_present; -- 40GB ETH 2 COMPILED IN
    brd_user_read_regs(C_RD_ETH_IF_LINK_UP_ADDR)(8) <= fgbe_if_2_present; -- 40GB ETH 3 COMPILED IN
    brd_user_read_regs(C_RD_ETH_IF_LINK_UP_ADDR)(9) <= fgbe_if_3_present; -- 40GB ETH 4 COMPILED IN
    --brd_user_read_regs(C_RD_ETH_IF_LINK_UP_ADDR)(15 downto 5) <= (others => '0');
    
    
    pCDCLedSynchroniser : process(bsp_rst, bsp_clk)
    begin
       if (bsp_rst = '1')then
           sBusLedValidD1 <= '0';
           sBusLedValid <= '0'; 
           s_xlgmii_txled_0 <= (others => '0');
           s_xlgmii_rxled_0 <= (others => '0');
           s_xlgmii_txled_1 <= (others => '0');
           s_xlgmii_rxled_1 <= (others => '0');
           s_xlgmii_txled_2 <= (others => '0');
           s_xlgmii_rxled_2 <= (others => '0');
           s_xlgmii_txled_3 <= (others => '0');
           s_xlgmii_rxled_3 <= (others => '0');           
       elsif (rising_edge(bsp_clk))then
           sBusLedValidD1 <= sBusLedValid;
           sBusLedValid <= '1';
	     if (sBusLedValidD1 = '1') then
		s_xlgmii_txled_0 <= xlgmii_txled_0; 
		s_xlgmii_rxled_0 <= xlgmii_rxled_0;
		s_xlgmii_txled_1 <= xlgmii_txled_1; 
		s_xlgmii_rxled_1 <= xlgmii_rxled_1;
		s_xlgmii_txled_2 <= xlgmii_txled_2; 
		s_xlgmii_rxled_2 <= xlgmii_rxled_2;
		s_xlgmii_txled_3 <= xlgmii_txled_3; 
		s_xlgmii_rxled_3 <= xlgmii_rxled_3;		
             end if;  
       end if;
    end process pCDCLedSynchroniser;     

    -- LED STATUS
    brd_user_read_regs(C_RD_ETH_IF_LINK_UP_ADDR)(17 downto 16) <= s_xlgmii_txled_0; -- 40GBE ETH 0 TX
    brd_user_read_regs(C_RD_ETH_IF_LINK_UP_ADDR)(19 downto 18) <= s_xlgmii_rxled_0; -- 40GBE ETH 0 RX
    brd_user_read_regs(C_RD_ETH_IF_LINK_UP_ADDR)(21 downto 20) <= s_xlgmii_txled_1; -- 40GBE ETH 1 TX
    brd_user_read_regs(C_RD_ETH_IF_LINK_UP_ADDR)(23 downto 22) <= s_xlgmii_rxled_1; -- 40GBE ETH 1 RX
    brd_user_read_regs(C_RD_ETH_IF_LINK_UP_ADDR)(25 downto 24) <= s_xlgmii_txled_2; -- 40GBE ETH 2 TX
    brd_user_read_regs(C_RD_ETH_IF_LINK_UP_ADDR)(27 downto 26) <= s_xlgmii_rxled_2; -- 40GBE ETH 2 RX
    brd_user_read_regs(C_RD_ETH_IF_LINK_UP_ADDR)(29 downto 28) <= s_xlgmii_txled_3; -- 40GBE ETH 3 TX
    brd_user_read_regs(C_RD_ETH_IF_LINK_UP_ADDR)(31 downto 30) <= s_xlgmii_rxled_3; -- 40GBE ETH 3 RX
    
    --The 40GbE MAC and PHY microblaze reset needs to be OR'ed with hard reset in
    --order to make the reset deterministic. This will prevent the Rx Link from not
    --functioning properly
    
     
    pCDCSoftResetSynchroniser : process(sys_clk)
    begin
       if (rising_edge(sys_clk))then
         sQsfpSoftReset0D2 <= sQsfpSoftReset0D1;
         sQsfpSoftReset0D1 <= brd_user_write_regs(C_WR_ETH_IF_CTL_ADDR)(1);-- or bsp_rst;
         sQsfpSoftReset1D2 <= sQsfpSoftReset1D1;
         sQsfpSoftReset1D1 <= brd_user_write_regs(C_WR_ETH_IF_CTL_ADDR)(2);-- or bsp_rst;
         sQsfpSoftReset2D2 <= sQsfpSoftReset2D1;
         sQsfpSoftReset2D1 <= brd_user_write_regs(C_WR_ETH_IF_CTL_ADDR)(3);-- or bsp_rst;
         sQsfpSoftReset3D2 <= sQsfpSoftReset3D1;
         sQsfpSoftReset3D1 <= brd_user_write_regs(C_WR_ETH_IF_CTL_ADDR)(4);-- or bsp_rst;       
       end if;
    end process pCDCSoftResetSynchroniser;
    
    qsfp_soft_reset_0 <= sQsfpSoftReset0D2 or sys_rst;
    qsfp_soft_reset_1 <= sQsfpSoftReset1D2 or sys_rst;
    qsfp_soft_reset_2 <= sQsfpSoftReset2D2 or sys_rst;
    qsfp_soft_reset_3 <= sQsfpSoftReset3D2 or sys_rst;
    
    -- Microblaze Alive Signal
    brd_user_read_regs(C_RD_UBLAZE_ALIVE_ADDR) <= brd_user_write_regs(C_WR_UBLAZE_ALIVE_ADDR);

    -- -- DSP Override signal for Front Panel LEDs
    brd_user_read_regs(C_RD_DSP_OVERRIDE_ADDR) <= brd_user_write_regs(C_WR_DSP_OVERRIDE_ADDR);
    
    --AI start: Add fortygbe config interface
    --fortygbe data select (1 = 40 GbE data select, 0 = 40 GbE configuration only)
    --select_forty_gbe_data_sel  <= brd_user_write_regs(C_WR_BRD_CTL_STAT_1_ADDR)(1);
    
    --This is part of the configuration link auto-sensing function. If any of the 40GbE links are up then configuration
    --defaults to the 40GbE interface else it defaults to the 1GbE interface 
    --fgbe_link_status <= phy_rx_up_cpu_0 or phy_rx_up_cpu_1 or phy_rx_up_cpu_2 or phy_rx_up_cpu_3;
    --Select whether configuration via forty_gbe interface or via 1GbE interface (0 = 1GbE, 1 = 40GbE)
    --This will override the auto-sensing select function (default is 40GbE)
    --Obviously if there is no 40GbE this will have no effect, as fbe_link_status will be '0' and hence, 1GbE will
    --be selected 
    --fgbe_reg_sel <= not(brd_user_write_regs(C_WR_BRD_CTL_STAT_1_ADDR)(2)); --(0 = 1GbE, 1 = 40GbE)
    --Final Selection whether configuration via forty_gbe interface or via 1GbE interface (0 = 1GbE, 1 = 40GbE)
    --fgbe_config_en <= fgbe_link_status and fgbe_reg_sel;
    --AI end: Add fortygbe config interface            

    -- MOVE 40GBE LINK UP TO bsp_clk CLOCK DOMAIN
    gen_phy_rx_up_cpu : process(bsp_clk)
    begin
        if (rising_edge(bsp_clk))then
            phy_rx_up_z1_0 <= fgbe_phy_rx_up_0;
            phy_rx_up_z2_0 <= phy_rx_up_z1_0;
            phy_rx_up_cpu_0 <= phy_rx_up_z2_0;

            phy_rx_up_z1_1 <= fgbe_phy_rx_up_1;
            phy_rx_up_z2_1 <= phy_rx_up_z1_1;
            phy_rx_up_cpu_1 <= phy_rx_up_z2_1;

            phy_rx_up_z1_2 <= fgbe_phy_rx_up_2;
            phy_rx_up_z2_2 <= phy_rx_up_z1_2;
            phy_rx_up_cpu_2 <= phy_rx_up_z2_2;

            phy_rx_up_z1_3 <= fgbe_phy_rx_up_3;
            phy_rx_up_z2_3 <= phy_rx_up_z1_3;
            phy_rx_up_cpu_3 <= phy_rx_up_z2_3;
        end if;
    end process;



    brd_user_read_regs(C_RD_MEZZANINE_STAT_0_ADDR)(0) <= not MEZZANINE_0_PRESENT_N;
    brd_user_read_regs(C_RD_MEZZANINE_STAT_0_ADDR)(1) <= not MEZZANINE_1_PRESENT_N;
    brd_user_read_regs(C_RD_MEZZANINE_STAT_0_ADDR)(2) <= not MEZZANINE_2_PRESENT_N;
    brd_user_read_regs(C_RD_MEZZANINE_STAT_0_ADDR)(3) <= not MEZZANINE_3_PRESENT_N;
    brd_user_read_regs(C_RD_MEZZANINE_STAT_0_ADDR)(7 downto 4) <= (others => '0');

    --Only do fault checking when fault checking is enabled and mezzanine ID is not a SKARAB ADC. The SKARAB ADC uses the
    --MEZZANINE_X_FAULT_N line as a trigger out signal due to no other GPIO being available on the mezzanine card 
    --and it will be reported as a MEZZANINE_COMBINED_FAULT if this is not disabled. 
    mezzanine_0_fault <= (not MEZZANINE_0_FAULT_N) when (mezzanine_0_fault_checking_enable = '1' and MEZZ0_ID /= "011") else '0';
    mezzanine_1_fault <= (not MEZZANINE_1_FAULT_N) when (mezzanine_1_fault_checking_enable = '1' and MEZZ1_ID /= "011") else '0';
    mezzanine_2_fault <= (not MEZZANINE_2_FAULT_N) when (mezzanine_2_fault_checking_enable = '1' and MEZZ2_ID /= "011") else '0';
    mezzanine_3_fault <= (not MEZZANINE_3_FAULT_N) when (mezzanine_3_fault_checking_enable = '1' and MEZZ3_ID /= "011") else '0';

    brd_user_read_regs(C_RD_MEZZANINE_STAT_0_ADDR)(8) <= mezzanine_0_fault;
    brd_user_read_regs(C_RD_MEZZANINE_STAT_0_ADDR)(9) <= mezzanine_1_fault;
    brd_user_read_regs(C_RD_MEZZANINE_STAT_0_ADDR)(10) <= mezzanine_2_fault;
    brd_user_read_regs(C_RD_MEZZANINE_STAT_0_ADDR)(11) <= mezzanine_3_fault;
    brd_user_read_regs(C_RD_MEZZANINE_STAT_0_ADDR)(15 downto 12) <= (others => '0');

    brd_user_read_regs(C_RD_MEZZANINE_STAT_0_ADDR)(16) <= not MEZZANINE_0_INT_N;
    brd_user_read_regs(C_RD_MEZZANINE_STAT_0_ADDR)(17) <= not MEZZANINE_1_INT_N;
    brd_user_read_regs(C_RD_MEZZANINE_STAT_0_ADDR)(18) <= not MEZZANINE_2_INT_N;
    brd_user_read_regs(C_RD_MEZZANINE_STAT_0_ADDR)(19) <= not MEZZANINE_3_INT_N;
    brd_user_read_regs(C_RD_MEZZANINE_STAT_0_ADDR)(31 downto 20) <= (others => '0');

    mezzanine_0_enable <= brd_user_write_regs(C_WR_MEZZANINE_CTL_ADDR)(0);
    mezzanine_1_enable <= brd_user_write_regs(C_WR_MEZZANINE_CTL_ADDR)(1);
    mezzanine_2_enable <= brd_user_write_regs(C_WR_MEZZANINE_CTL_ADDR)(2);
    mezzanine_3_enable <= brd_user_write_regs(C_WR_MEZZANINE_CTL_ADDR)(3);
    
    --HMC status signals synchronised to the bsp_clk
    pHmcStatusSynchroniser : process(bsp_clk)
    begin
        if (rising_edge(bsp_clk))then
            --Init_Done Mezz 0, 1 and 2
            sMezz0InitDoneD1 <= MEZZ0_INIT_DONE;
            sMezz0InitDoneD2 <= sMezz0InitDoneD1;
            sMezz1InitDoneD1 <= MEZZ1_INIT_DONE;
            sMezz1InitDoneD2 <= sMezz1InitDoneD1;
            sMezz2InitDoneD1 <= MEZZ2_INIT_DONE;
            sMezz2InitDoneD2 <= sMezz2InitDoneD1;
            --Post OK Mezz 0, 1 and 2
            sMezz0PostOkD1 <= MEZZ0_POST_OK;
            sMezz0PostOkD2 <= sMezz0PostOkD1;
            sMezz1PostOkD1 <= MEZZ1_POST_OK;
            sMezz1PostOkD2 <= sMezz1PostOkD1;
            sMezz2PostOkD1 <= MEZZ2_POST_OK;
            sMezz2PostOkD2 <= sMezz2PostOkD1;           
        end if;
    end process;     
    
    
    --MEZZANINE STATUS 1 REGISTER (MEZZ0)
    brd_user_read_regs(C_RD_MEZZANINE_STAT_1_ADDR)(0) <= ((not MEZZANINE_0_PRESENT_N) and MEZZ0_PRESENT);
    brd_user_read_regs(C_RD_MEZZANINE_STAT_1_ADDR)(3 downto 1) <= MEZZ0_ID;
    brd_user_read_regs(C_RD_MEZZANINE_STAT_1_ADDR)(4) <= sMezz0InitDoneD2; --MEZZ0_INIT_DONE;
    brd_user_read_regs(C_RD_MEZZANINE_STAT_1_ADDR)(5) <= sMezz0PostOkD2; --MEZZ0_POST_OK;
    brd_user_read_regs(C_RD_MEZZANINE_STAT_1_ADDR)(7 downto 6) <= (others => '0');    
    
    --MEZZANINE STATUS 1 REGISTER (MEZZ1)
    brd_user_read_regs(C_RD_MEZZANINE_STAT_1_ADDR)(8) <= ((not MEZZANINE_1_PRESENT_N) and MEZZ1_PRESENT);
    brd_user_read_regs(C_RD_MEZZANINE_STAT_1_ADDR)(11 downto 9) <= MEZZ1_ID;
    brd_user_read_regs(C_RD_MEZZANINE_STAT_1_ADDR)(12) <= sMezz1InitDoneD2; --MEZZ1_INIT_DONE;
    brd_user_read_regs(C_RD_MEZZANINE_STAT_1_ADDR)(13) <= sMezz1PostOkD2; --MEZZ1_POST_OK;
    brd_user_read_regs(C_RD_MEZZANINE_STAT_1_ADDR)(15 downto 14) <= (others => '0');    
    
    --MEZZANINE STATUS 1 REGISTER (MEZZ2)
    brd_user_read_regs(C_RD_MEZZANINE_STAT_1_ADDR)(16) <= ((not MEZZANINE_2_PRESENT_N) and MEZZ2_PRESENT);
    brd_user_read_regs(C_RD_MEZZANINE_STAT_1_ADDR)(19 downto 17) <= MEZZ2_ID;
    brd_user_read_regs(C_RD_MEZZANINE_STAT_1_ADDR)(20) <= sMezz2InitDoneD2; --MEZZ2_INIT_DONE;
    brd_user_read_regs(C_RD_MEZZANINE_STAT_1_ADDR)(21) <= sMezz2PostOkD2; --MEZZ2_POST_OK;
    brd_user_read_regs(C_RD_MEZZANINE_STAT_1_ADDR)(23 downto 22) <= (others => '0');    

    --MEZZANINE STATUS 1 REGISTER (MEZZ3)
    brd_user_read_regs(C_RD_MEZZANINE_STAT_1_ADDR)(24) <= ((not MEZZANINE_3_PRESENT_N) and MEZZ3_PRESENT);
    brd_user_read_regs(C_RD_MEZZANINE_STAT_1_ADDR)(27 downto 25) <= MEZZ3_ID;
    brd_user_read_regs(C_RD_MEZZANINE_STAT_1_ADDR)(28) <= fgbe_if_0_present;
    brd_user_read_regs(C_RD_MEZZANINE_STAT_1_ADDR)(29) <= fgbe_if_1_present;
    brd_user_read_regs(C_RD_MEZZANINE_STAT_1_ADDR)(30) <= fgbe_if_2_present;
    brd_user_read_regs(C_RD_MEZZANINE_STAT_1_ADDR)(31) <= fgbe_if_3_present;  

    brd_user_read_regs(C_RD_40GBE_IF_0_OFFSET_ADDR) <= X"00050000";
    brd_user_read_regs(C_RD_40GBE_IF_1_OFFSET_ADDR) <= X"00000001";
    brd_user_read_regs(C_RD_40GBE_IF_2_OFFSET_ADDR) <= X"00000001";
    brd_user_read_regs(C_RD_40GBE_IF_3_OFFSET_ADDR) <= X"00000001";
    
    mezzanine_enable_delay_0 : mezzanine_enable_delay
    port map(
        clk => bsp_clk,
        rst => bsp_rst,
        second_toggle                    => second_toggle,
        mezzanine_enable                 => mezzanine_0_enable,
        mezzanine_fault_checking_enable  => mezzanine_0_fault_checking_enable);

    mezzanine_enable_delay_1 : mezzanine_enable_delay
    port map(
        clk => bsp_clk,
        rst => bsp_rst,
        second_toggle                    => second_toggle,
        mezzanine_enable                 => mezzanine_1_enable,
        mezzanine_fault_checking_enable  => mezzanine_1_fault_checking_enable);

    mezzanine_enable_delay_2 : mezzanine_enable_delay
    port map(
        clk => bsp_clk,
        rst => bsp_rst,
        second_toggle                    => second_toggle,
        mezzanine_enable                 => mezzanine_2_enable,
        mezzanine_fault_checking_enable  => mezzanine_2_fault_checking_enable);

    mezzanine_enable_delay_3 : mezzanine_enable_delay
    port map(
        clk => bsp_clk,
        rst => bsp_rst,
        second_toggle                    => second_toggle,
        mezzanine_enable                 => mezzanine_3_enable,
        mezzanine_fault_checking_enable  => mezzanine_3_fault_checking_enable);

    MEZZANINE_0_ENABLE_N <= not mezzanine_0_enable;
    MEZZANINE_1_ENABLE_N <= not mezzanine_1_enable;
    MEZZANINE_2_ENABLE_N <= not mezzanine_2_enable;
    MEZZANINE_3_ENABLE_N <= not mezzanine_3_enable;

    --MEZZANINE_3_ENABLE_N <= not mezzanine_3_enable;
    --MEZZANINE_0_RESET <= brd_user_write_regs(C_WR_MEZZANINE_CTL_ADDR)(8) or bsp_rst;
    --MEZZANINE_1_RESET <= brd_user_write_regs(C_WR_MEZZANINE_CTL_ADDR)(9) or bsp_rst;
    --MEZZANINE_2_RESET <= brd_user_write_regs(C_WR_MEZZANINE_CTL_ADDR)(10) or bsp_rst;    
    MEZZANINE_3_RESET <= brd_user_write_regs(C_WR_MEZZANINE_CTL_ADDR)(11) or bsp_rst;

    MEZZANINE_3_CLK_SEL <= not brd_user_write_regs(C_WR_MEZZANINE_CTL_ADDR)(19); -- DEFAULT '1' = MEZZANINE CLOCK

    --MEZZANINE_COMBINED_FAULT <= mezzanine_fault_override or mezzanine_3_fault;
    
    MEZZANINE_COMBINED_FAULT <= mezzanine_fault_override or mezzanine_0_fault or mezzanine_1_fault or mezzanine_2_fault or mezzanine_3_fault;


    brd_user_read_regs(C_RD_USB_STAT_ADDR)(3 downto 0) <= USB_FPGA;
    brd_user_read_regs(C_RD_USB_STAT_ADDR)(7 downto 4) <= (others => '0');
    brd_user_read_regs(C_RD_USB_STAT_ADDR)(8) <= USB_I2C_CTRL;
    brd_user_read_regs(C_RD_USB_STAT_ADDR)(31 downto 9) <= (others => '0');

    USB_UART_RXD <= microblaze_uart_txd;
    -- USB SERIAL CURRENTLY NOT USED FOR RECEIVING
    microblaze_uart_rxd <= USB_UART_TXD;
    --USB_UART_TXD

    --brd_user_read_regs(C_RD_AUX_CLK_FREQ_ADDR) <= aux_clk_frequency;

    --brd_user_read_regs(C_RD_MEZZANINE_CLK_FREQ_ADDR) <= qsfp_xl_tx_clk_156m25_frequency;

    --brd_user_read_regs(C_RD_CONFIG_CLK_FREQ_ADDR) <= fpga_emcclk2_frequency;

    USR_ACCESSE2_0 : USR_ACCESSE2
    port map (
        CFGCLK      => open,
        DATA        => brd_user_read_regs(C_RD_SOC_VERSION_ADDR),
        DATAVALID   => open);

    brd_user_read_regs(C_RD_FPGA_DNA_LOW_ADDR) <= fpga_dna(31 downto 0);
    brd_user_read_regs(C_RD_FPGA_DNA_HIGH_ADDR) <= fpga_dna(63 downto 32);

---------------------------------------------------------------------------
-- AUX CONNECTIONS
---------------------------------------------------------------------------

    --aux_clk_ibufds : IBUFDS
    --generic map (
    --    DIFF_TERM => TRUE)
    --port map (
    --    O  => aux_clk,
    --    I  => AUX_CLK_P,
    --    IB => AUX_CLK_N);

    --aux_synci_ibufds : IBUFDS
    --generic map (
    --    DIFF_TERM => TRUE)
    --port map (
    --    O  => aux_synci,
    --    I  => AUX_SYNCI_P,
    --    IB => AUX_SYNCI_N);

    --aux_sync_gen_0 : aux_sync_gen
    --port map(
    --    clk => sys_clk,
    --    rst => sys_rst,
    --    aux_sync_out    => aux_synco);

    --aux_synco_obufds : OBUFDS
    --port map (
    --    I  => aux_synco,
    --    O  => AUX_SYNCO_P,
    --    OB => AUX_SYNCO_N);

    --clock_frequency_measure_0 : clock_frequency_measure
    --port map(
    --    clk => aux_clk,
    --    rst => fpga_reset,
    --    second_toggle   => second_toggle,
    --    measure_freq    => aux_clk_frequency);

    

---------------------------------------------------------------------------
-- BLOCK DESIGN WRAPPER
---------------------------------------------------------------------------

    cont_microblaze_wrapper_0 : cont_microblaze_wrapper
    port map(
        ACK_I       => WB_MST_ACK_I,
        ADR_O       => WB_MST_ADR_O,
        CYC_O       => WB_MST_CYC_O,
        Clk         => bsp_clk,
        DAT_I       => WB_MST_DAT_I,
        DAT_O       => WB_MST_DAT_O,
        RST_O       => WB_MST_RST_O,
        Reset       => bsp_rst,
        SEL_O       => WB_MST_SEL_O,
        STB_O       => WB_MST_STB_O,
        UART_rxd    => microblaze_uart_rxd,
        UART_txd    => microblaze_uart_txd,
        WE_O        => WB_MST_WE_O,
        dcm_locked  => user_mmcm_locked);
        


    --microblaze_uart_rxd <= DEBUG_UART_RX;
    DEBUG_UART_TX <= microblaze_uart_txd;

----------------------------------------------------------------------------
-- WISHBONE SLAVES
----------------------------------------------------------------------------

    wishbone_interconnect_0 : wishbone_interconnect
    port map(
        CLK_I => bsp_clk,
        RST_I => bsp_rst,
        MST_DAT_O => WB_MST_DAT_O,
        MST_DAT_I => WB_MST_DAT_I,
        MST_ACK_I => WB_MST_ACK_I,
        MST_ADR_O => WB_MST_ADR_O,
        MST_CYC_O => WB_MST_CYC_O,
        MST_SEL_O => WB_MST_SEL_O,
        MST_STB_O => WB_MST_STB_O,
        MST_WE_O  => WB_MST_WE_O,
        SLV_DAT_O => WB_SLV_DAT_O,
        SLV_DAT_I => WB_SLV_DAT_I,
        SLV_ACK_O => WB_SLV_ACK_O,
        SLV_ADR_I => WB_SLV_ADR_I,
        SLV_CYC_I => WB_SLV_CYC_I,
        SLV_SEL_I => WB_SLV_SEL_I,
        SLV_STB_I => WB_SLV_STB_I,
        SLV_WE_I  => WB_SLV_WE_I);

    -- WISHBONE SLAVE 0 - BOARD READ/WRITE REGISTERS 1
    wishbone_register_0 : wishbone_register
    port map(
        CLK_I => bsp_clk,
        RST_I => bsp_rst,
        DAT_I => WB_SLV_DAT_I(0),
        DAT_O => WB_SLV_DAT_O(0),
        ACK_O => WB_SLV_ACK_O(0),
        ADR_I => WB_SLV_ADR_I(0)((C_NUM_REGISTER_ADDRESS_BITS + 1) downto 0),
        CYC_I => WB_SLV_CYC_I(0),
        SEL_I => WB_SLV_SEL_I(0),
        STB_I => WB_SLV_STB_I(0),
        WE_I  => WB_SLV_WE_I(0),
        user_read_regs    => brd_user_read_regs,
        user_write_regs   => brd_user_write_regs);

    -- WISHBONE SLAVE 1 - BOARD READ/WRITE REGISTERS 2
    --wishbone_register_1 : wishbone_register
    --port map(
    --    CLK_I => sys_clk,
    --    RST_I => sys_rst,
    --    DAT_I => WB_SLV_DAT_I(1),
    --    DAT_O => WB_SLV_DAT_O(1),
    --    ACK_O => WB_SLV_ACK_O(1),
    --    ADR_I => WB_SLV_ADR_I(1)((C_NUM_REGISTER_ADDRESS_BITS + 1) downto 0),
    --    CYC_I => WB_SLV_CYC_I(1),
    --    SEL_I => WB_SLV_SEL_I(1),
    --    STB_I => WB_SLV_STB_I(1),
    --    WE_I  => WB_SLV_WE_I(1),
    --    user_read_regs    => brd_user_read_regs_2,
    --    user_write_regs   => brd_user_write_regs_2);

    -- WISHBONE SLAVE 2 - FLASH/SDRAM RECONFIGURATION
    FLASH_A <= flash_a_i(28 downto 0) when (flash_output_enable = '1') else (others => 'Z');

    FLASH_DQ <= flash_dq_out when ((flash_dq_out_en = '1')and(flash_output_enable = '1')) else (others => 'Z');

    wishbone_flash_sdram_interface_0 : wishbone_flash_sdram_interface
    port map(
        CLK_I => bsp_clk,
        RST_I => bsp_rst,
        DAT_I => WB_SLV_DAT_I(2),
        DAT_O => WB_SLV_DAT_O(2),
        ACK_O => WB_SLV_ACK_O(2),
        ADR_I => WB_SLV_ADR_I(2)(14 downto 0),
        CYC_I => WB_SLV_CYC_I(2),
        SEL_I => WB_SLV_SEL_I(2),
        STB_I => WB_SLV_STB_I(2),
        WE_I  => WB_SLV_WE_I(2),
        fpga_emcclk     => '0',
        fpga_emcclk2    => '0',
        flash_dq_in     => FLASH_DQ,
        flash_dq_out    => flash_dq_out,
        flash_dq_out_en => flash_dq_out_en,
        flash_a         => flash_a_i,
        flash_cs_n      => flash_cs_n_i,
        flash_oe_n      => flash_oe_n_i,
        flash_we_n      => flash_we_n_i,
        flash_adv_n     => flash_adv_n_i,
        flash_rs0       => flash_rs0_i,
        flash_rs1       => flash_rs1_i,
        flash_wait      => '0',
        flash_output_enable => flash_output_enable,
        spartan_clk => spartan_clk_i,
        config_io_0 => config_io_0_i,
        config_io_1 => config_io_1_i,
        config_io_2 => config_io_2_i,
        config_io_3 => config_io_3_i,
        config_io_4 => config_io_4_i,
        config_io_5 => config_io_5_i,
        config_io_6 => config_io_6_i,
        config_io_7 => config_io_7_i,
        config_io_8 => config_io_8_i,
        config_io_9 => config_io_9_i,
        config_io_10 => config_io_10_i,
        config_io_11 => config_io_11_i,
        spi_miso => spi_miso_i,
        spi_mosi => spi_mosi_i,
        spi_csb  => spi_csb_i,
        spi_clk  => spi_clk_i,
        debug_sdram_program_header  => open);

        FLASH_RS0 <= flash_rs0_i when (flash_output_enable = '1') else 'Z';
        FLASH_RS1 <= flash_rs1_i when (flash_output_enable = '1') else 'Z';

        FLASH_CS_N <= flash_cs_n_i when (flash_output_enable = '1') else 'Z';
        FLASH_OE_N <= flash_oe_n_i when (flash_output_enable = '1') else 'Z';
        FLASH_WE_N <= flash_we_n_i when (flash_output_enable = '1') else 'Z';
        FLASH_ADV_N <= flash_adv_n_i when (flash_output_enable = '1') else 'Z';

        SPARTAN_CLK <= spartan_clk_i;
        CONFIG_IO_0 <= config_io_0_i;
        CONFIG_IO_1 <= config_io_1_i;
        config_io_2_i <= CONFIG_IO_2;
        CONFIG_IO_3 <= config_io_3_i;
        CONFIG_IO_4 <= config_io_4_i;
        config_io_5_i <= CONFIG_IO_5;
        CONFIG_IO_6 <= config_io_6_i;
        CONFIG_IO_7 <= config_io_7_i;
        CONFIG_IO_8 <= config_io_8_i;
        CONFIG_IO_9 <= config_io_9_i;
        CONFIG_IO_10 <= config_io_10_i;
        CONFIG_IO_11 <= config_io_11_i;

        spi_miso_i <= SPI_MISO;
        SPI_MOSI <= spi_mosi_i;
        SPI_CSB  <= spi_csb_i;
        SPI_CLK  <= spi_clk_i;

    -- WISHBONE SLAVE 3 - ONE WIRE INTERFACES
    wishbone_one_wire_0 : wishbone_one_wire
    generic map(
        NUM_ONE_WIRE_INTERFACES => 5)
    port map(
        CLK_I => bsp_clk,
        RST_I => bsp_rst,
        DAT_I => WB_SLV_DAT_I(3),
        DAT_O => WB_SLV_DAT_O(3),
        ACK_O => WB_SLV_ACK_O(3),
        ADR_I => WB_SLV_ADR_I(3)(2 downto 0),
        CYC_I => WB_SLV_CYC_I(3),
        SEL_I => WB_SLV_SEL_I(3),
        STB_I => WB_SLV_STB_I(3),
        WE_I  => WB_SLV_WE_I(3),
        one_wire_pull_down_enable         => one_wire_pull_down_enable,
        one_wire_in                       => one_wire_in,
        one_wire_strong_pull_up_enable    => one_wire_strong_pull_up_enable_i);

    ONE_WIRE_EEPROM <= '0' when ((one_wire_pull_down_enable(0) = '1')and(one_wire_strong_pull_up_enable_i(0) = '0'))else 'Z';
    one_wire_in(0) <= ONE_WIRE_EEPROM;


    ONE_WIRE_EEPROM_STRONG_PULLUP_EN_N <= not one_wire_strong_pull_up_enable_i(0);

    MEZZANINE_0_ONE_WIRE <= '0' when ((one_wire_pull_down_enable(1) = '1')and(one_wire_strong_pull_up_enable_i(1) = '0')) else 'Z';
    one_wire_in(1) <= MEZZANINE_0_ONE_WIRE;
    MEZZANINE_0_ONE_WIRE_STRONG_PULLUP_EN_N <= not one_wire_strong_pull_up_enable_i(1);

    MEZZANINE_1_ONE_WIRE <= '0' when ((one_wire_pull_down_enable(2) = '1')and(one_wire_strong_pull_up_enable_i(2) = '0')) else 'Z';
    one_wire_in(2) <= MEZZANINE_1_ONE_WIRE;
    MEZZANINE_1_ONE_WIRE_STRONG_PULLUP_EN_N <= not one_wire_strong_pull_up_enable_i(2);

    MEZZANINE_2_ONE_WIRE <= '0' when ((one_wire_pull_down_enable(3) = '1')and(one_wire_strong_pull_up_enable_i(3) = '0')) else 'Z';
    one_wire_in(3) <= MEZZANINE_2_ONE_WIRE;
    MEZZANINE_2_ONE_WIRE_STRONG_PULLUP_EN_N <= not one_wire_strong_pull_up_enable_i(3);

    MEZZANINE_3_ONE_WIRE <= '0' when ((one_wire_pull_down_enable(4) = '1')and(one_wire_strong_pull_up_enable_i(4) = '0')) else 'Z';
    one_wire_in(4) <= MEZZANINE_3_ONE_WIRE;
    MEZZANINE_3_ONE_WIRE_STRONG_PULLUP_EN_N <= not one_wire_strong_pull_up_enable_i(4);

    -- WISHBONE SLAVE 4, 5, 6, 7, 8 - I2C INTERFACES
    generate_I2C_0_to_4 : for a in 0 to 4 generate
        wishbone_i2c_0_to_4 : wishbone_i2c
        port map(
            CLK_I => bsp_clk,
            RST_I => bsp_rst,
            DAT_I => WB_SLV_DAT_I(4 + a),
            DAT_O => WB_SLV_DAT_O(4 + a),
            ACK_O => WB_SLV_ACK_O(4 + a),
            ADR_I => WB_SLV_ADR_I(4 + a)(4 downto 0),
            CYC_I => WB_SLV_CYC_I(4 + a),
            SEL_I => WB_SLV_SEL_I(4 + a),
            STB_I => WB_SLV_STB_I(4 + a),
            WE_I  => WB_SLV_WE_I(4 + a),
            scl_pad_i     => i2c_scl_pad_i(a),
            scl_pad_o     => i2c_scl_pad_o(a),
            scl_padoen_o  => i2c_scl_padoen_o(a),
            sda_pad_i     => i2c_sda_pad_i(a),
            sda_pad_o     => i2c_sda_pad_o(a),
            sda_padoen_o  => i2c_sda_padoen_o(a));
    end generate generate_I2C_0_to_4;



    --I2C_RESET_FPGA <= sys_fpga_rst;
    I2C_RESET_FPGA <= bsp_fpga_rst;
    I2C_SCL_FPGA <= i2c_scl_pad_o(0) when (i2c_scl_padoen_o(0) = '0') else 'Z';
    I2C_SDA_FPGA <= i2c_sda_pad_o(0) when (i2c_sda_padoen_o(0) = '0') else 'Z';
    i2c_scl_pad_i(0) <= I2C_SCL_FPGA;
    i2c_sda_pad_i(0) <= I2C_SDA_FPGA;

    --AI Start: Only need one I2C bus for Mezzanine Site 3
    --MEZZANINE_0_SCL_FPGA <= i2c_scl_pad_o(1) when (i2c_scl_padoen_o(1) = '0') else 'Z';
    --MEZZANINE_0_SDA_FPGA <= i2c_sda_pad_o(1) when (i2c_sda_padoen_o(1) = '0') else 'Z';
    --i2c_scl_pad_i(1) <= MEZZANINE_0_SCL_FPGA;
    --i2c_sda_pad_i(1) <= MEZZANINE_0_SDA_FPGA;

    --MEZZANINE_1_SCL_FPGA <= i2c_scl_pad_o(2) when (i2c_scl_padoen_o(2) = '0') else 'Z';
    --MEZZANINE_1_SDA_FPGA <= i2c_sda_pad_o(2) when (i2c_sda_padoen_o(2) = '0') else 'Z';
    --i2c_scl_pad_i(2) <= MEZZANINE_1_SCL_FPGA;
    --i2c_sda_pad_i(2) <= MEZZANINE_1_SDA_FPGA;

    --MEZZANINE_2_SCL_FPGA <= i2c_scl_pad_o(3) when (i2c_scl_padoen_o(3) = '0') else 'Z';
    --MEZZANINE_2_SDA_FPGA <= i2c_sda_pad_o(3) when (i2c_sda_padoen_o(3) = '0') else 'Z';
    --i2c_scl_pad_i(3) <= MEZZANINE_2_SCL_FPGA;
    --i2c_sda_pad_i(3) <= MEZZANINE_2_SDA_FPGA;
    --AI En: Only need one I2C bus for Mezzanine Site 3

    MEZZANINE_3_SCL_FPGA <= i2c_scl_pad_o(4) when (i2c_scl_padoen_o(4) = '0') else 'Z';
    MEZZANINE_3_SDA_FPGA <= i2c_sda_pad_o(4) when (i2c_sda_padoen_o(4) = '0') else 'Z';
    i2c_scl_pad_i(4) <= MEZZANINE_3_SCL_FPGA;
    i2c_sda_pad_i(4) <= MEZZANINE_3_SDA_FPGA;
    
    --IIC MUX
    MEZZANINE_0_SCL_FPGA <= smezz0_scl_out when (sMezz0InitDoneD2 = '0' and MEZZ0_ID = "010") else i2c_scl_pad_o(1) when (i2c_scl_padoen_o(1) = '0') else 'Z';
    MEZZANINE_0_SDA_FPGA <= smezz0_sda_out when (sMezz0InitDoneD2 = '0' and MEZZ0_ID = "010") else i2c_sda_pad_o(1) when (i2c_sda_padoen_o(1) = '0') else 'Z';
    i2c_scl_pad_i(1) <= MEZZANINE_0_SCL_FPGA;
    i2c_sda_pad_i(1) <= MEZZANINE_0_SDA_FPGA;
    smezz0_scl_in <= MEZZANINE_0_SCL_FPGA;
    smezz0_sda_in <= MEZZANINE_0_SDA_FPGA; 

    MEZZANINE_1_SCL_FPGA <= smezz1_scl_out when (sMezz1InitDoneD2 = '0' and MEZZ1_ID = "010") else i2c_scl_pad_o(2) when (i2c_scl_padoen_o(2) = '0') else 'Z';
    MEZZANINE_1_SDA_FPGA <= smezz1_sda_out when (sMezz1InitDoneD2 = '0' and MEZZ1_ID = "010") else i2c_sda_pad_o(2) when (i2c_sda_padoen_o(2) = '0') else 'Z';
    i2c_scl_pad_i(2) <= MEZZANINE_1_SCL_FPGA;
    i2c_sda_pad_i(2) <= MEZZANINE_1_SDA_FPGA;
    smezz1_scl_in <= MEZZANINE_1_SCL_FPGA;
    smezz1_sda_in <= MEZZANINE_1_SDA_FPGA; 

    MEZZANINE_2_SCL_FPGA <= smezz2_scl_out when (sMezz2InitDoneD2 = '0' and MEZZ2_ID = "010") else  i2c_scl_pad_o(3) when (i2c_scl_padoen_o(3) = '0') else 'Z';
    MEZZANINE_2_SDA_FPGA <= smezz2_sda_out when (sMezz2InitDoneD2 = '0' and MEZZ2_ID = "010") else  i2c_sda_pad_o(3) when (i2c_sda_padoen_o(3) = '0') else 'Z';
    i2c_scl_pad_i(3) <= MEZZANINE_2_SCL_FPGA;
    i2c_sda_pad_i(3) <= MEZZANINE_2_SDA_FPGA;
    smezz2_scl_in <= MEZZANINE_2_SCL_FPGA;
    smezz2_sda_in <= MEZZANINE_2_SDA_FPGA; 
    
    --Mezzanine 0 signal assignments 
    smezz0_scl_out <= MEZZ0_SCL_IN;
    smezz0_sda_out <= MEZZ0_SDA_IN;
    MEZZ0_SCL_OUT <= smezz0_scl_in; 
    MEZZ0_SDA_OUT <= smezz0_sda_in; 
      
    --Mezzanine 1 signal assignments
    
    smezz1_scl_out <= MEZZ1_SCL_IN;
    smezz1_sda_out <= MEZZ1_SDA_IN;
    MEZZ1_SCL_OUT <= smezz1_scl_in; 
    MEZZ1_SDA_OUT <= smezz1_sda_in;     
    
    --Mezzanine 2 signal assignments
    smezz2_scl_out <= MEZZ2_SCL_IN;
    smezz2_sda_out <= MEZZ2_SDA_IN;
    MEZZ2_SCL_OUT <= smezz2_scl_in; 
    MEZZ2_SDA_OUT <= smezz2_sda_in; 

-------------------------------------------------------------------------
-- CREATE SIGNAL THAT TOGGLES ONCE/SECOND
-------------------------------------------------------------------------

    second_gen_0 : second_gen
    port map(
        clk => bsp_clk,
        rst => bsp_rst,
        second_toggle => second_toggle);

-------------------------------------------------------------------------
-- MEASURE FREQUENCY OF GTH CLOCK
-------------------------------------------------------------------------
    --AI: Remove Nice to have function - free up resources 
    --clock_frequency_measure_1 : clock_frequency_measure
    --port map(
    --    clk => qsfp_gtrefclk,
    --    rst => qsfp_fpga_rst,
    --    second_toggle   => second_toggle,
    --    measure_freq    => qsfp_xl_tx_clk_156m25_frequency);

-------------------------------------------------------------------------
-- MEASURE FREQUENCY OF CONFIG CLOCK
-------------------------------------------------------------------------

    --AI: Remove Nice to have function - free up resources
    --clock_frequency_measure_2 : clock_frequency_measure
    --port map(
    --    clk => FPGA_EMCCLK2,
    --    rst => emcclk_fpga_rst,
    --    second_toggle   => second_toggle,
    --    measure_freq    => fpga_emcclk2_frequency);


-------------------------------------------------------------------------
-- ACCESS FPGA DEVICE DNA_PORT VALUE
-------------------------------------------------------------------------

    FPGA_DNA_CHECKER_inst : component FPGA_DNA_CHECKER
        port map(
            CLK_I            => bsp_clk,
            RST_I            => bsp_rst,
            FPGA_EMCCLK2_I   => emcclk2,
            FPGA_DNA_O       => fpga_dna,
            FPGA_DNA_MATCH_O => open
        );
        
-------------------------------------------------------------------------
-- XADC MEASUREMENT     
------------------------------------------------------------------------- 
    
    xadc_measurement_0 : xadc_measurement
    port map(
        daddr_in        => xadc_daddr_in,
        den_in          => xadc_den_in,
        di_in           => xadc_di_in,
        dwe_in          => xadc_dwe_in,
        do_out          => xadc_do_out,
        drdy_out        => xadc_drdy_out,
        dclk_in         => bsp_clk,
        reset_in        => bsp_rst,
        busy_out        => xadc_busy_out,
        channel_out     => xadc_channel_out,
        eoc_out         => xadc_eoc_out,
        eos_out         => xadc_eos_out,
        ot_out          => xadc_ot_out,
        user_temp_alarm_out => xadc_user_temp_alarm_out,
        alarm_out       => xadc_alarm_out,
        vp_in           => '0',
        vn_in           => '0');

    gen_xadc_latched : process(bsp_rst, bsp_clk)
    begin
        if (bsp_rst = '1')then
            brd_user_read_regs(C_RD_XADC_LATCHED_ADDR) <= (others => '0');
        elsif (rising_edge(bsp_clk))then
            if (xadc_drdy_out = '1')then
                brd_user_read_regs(C_RD_XADC_LATCHED_ADDR) <= X"0000" & xadc_do_out;
            end if;   
        end if;
    end process;

    brd_user_read_regs(C_RD_XADC_STATUS_ADDR)(15 downto 0) <= xadc_do_out;
    brd_user_read_regs(C_RD_XADC_STATUS_ADDR)(16) <= xadc_drdy_out;
    brd_user_read_regs(C_RD_XADC_STATUS_ADDR)(17) <= xadc_ot_out;
    brd_user_read_regs(C_RD_XADC_STATUS_ADDR)(18) <= xadc_user_temp_alarm_out;
    brd_user_read_regs(C_RD_XADC_STATUS_ADDR)(19) <= xadc_alarm_out;
    brd_user_read_regs(C_RD_XADC_STATUS_ADDR)(31 downto 20) <= (others => '0');

    xadc_di_in <= brd_user_write_regs(C_WR_XADC_CONTROL_ADDR)(15 downto 0);
    xadc_daddr_in <= brd_user_write_regs(C_WR_XADC_CONTROL_ADDR)(22 downto 16);
    xadc_den_in <= brd_user_write_regs(C_WR_XADC_CONTROL_ADDR)(23);
    xadc_dwe_in <= brd_user_write_regs(C_WR_XADC_CONTROL_ADDR)(24);             
        
-------------------------------------------------------------------------
-- Wishbone DSP Registers
-------------------------------------------------------------------------
       
    -- WISHBONE SLAVE 14 - DSP Registers
    WB_SLV_CLK_I_top <= bsp_clk;--sys_clk;
    WB_SLV_RST_I_top <= bsp_rst;--sys_rst;
    WB_SLV_DAT_I_top <= wb_cross_clock_out_dout(69 downto 38);--WB_SLV_DAT_I(14);
    --WB_SLV_DAT_O(14) <= WB_SLV_DAT_O_top;
    --WB_SLV_ACK_O(14) <= WB_SLV_ACK_O_top;
    --Deconcatenate the signals from the FIFO to the wishbone interconnect
    WB_SLV_DAT_O(14) <= wb_sync_data_in;--wb_cross_clock_in_dout(31 downto 0);
    WB_SLV_ACK_O(14) <= wb_sync_ack_in;--wb_cross_clock_in_dout(32);    
    WB_SLV_ADR_I_top <= wb_cross_clock_out_dout(37 downto 6);--WB_SLV_ADR_I(14)((C_WB_SLV_ADDRESS_BITS - 1) downto 0);
    WB_SLV_CYC_I_top <= wb_cross_clock_out_dout(5);--WB_SLV_CYC_I(14);
    WB_SLV_SEL_I_top <= wb_cross_clock_out_dout(4 downto 1);--WB_SLV_SEL_I(14);
    WB_SLV_STB_I_top <= wb_cross_clock_out_dout(72);--WB_SLV_STB_I(14);
    WB_SLV_WE_I_top  <= wb_cross_clock_out_dout(0);--WB_SLV_WE_I(14); 
    
    --Wishbone signals to the DSP
    cross_clock_fifo_wb_out_73x16_dsp : cross_clock_fifo_wb_out_73x16
    port map(
        rst             => bsp_rst,
        wr_clk          => bsp_clk,
        rd_clk          => bsp_clk, 
        din             => wb_cross_clock_out_din,
        wr_en           => wb_cross_clock_out_wrreq,
        rd_en           => wb_cross_clock_out_rdreq,
        dout            => wb_cross_clock_out_dout,
        full            => wb_cross_clock_out_full,
        empty           => wb_cross_clock_out_empty);  
     
        
   --WB FIFO Write State Machine (Wishbone to DSP Interface [39.0625MHz to 39.0625MHz)
   --The Strobe, Write Enable and Cyclic signals are asserted for a long duration and
   -- so this state machine ensures that the arbiter will see three clock cycle write asserted 
   --strobes and write enabled and one clock cycle read asserted strobes with write disabled.   
    fifo_wb_write_to_dsp_state_machine : process(bsp_rst, bsp_clk)
    begin
        if (bsp_rst = '1')then
            wb_cross_clock_out_wrreq <= '0';
            wb_dsp_wr_state <= WB_DSP_WR_IDLE;
            wb_cross_clock_out_din <= (others => '0');
            wb_slv_stb_hist_i <= '0';
        elsif (rising_edge(bsp_clk))then
            wb_slv_stb_hist_i <= WB_SLV_STB_I(14);
            case wb_dsp_wr_state is    
                when WB_DSP_WR_IDLE =>
                  wb_dsp_wr_state <= WB_DSP_WR_STROBE_CHECK;
                  wb_cross_clock_out_wrreq <= '0';
                  wb_cross_clock_out_din <= "000" &  WB_SLV_DAT_I(14) & WB_SLV_ADR_I(14)((C_WB_SLV_ADDRESS_BITS - 1) downto 0) & '0' & WB_SLV_SEL_I(14) & '0';                                                 
                when WB_DSP_WR_STROBE_CHECK =>
                                    
                  --Check for strobe and write enable (write operation)
                  if (WB_SLV_STB_I(14) = '1' and wb_slv_stb_hist_i = '0' and WB_SLV_WE_I(14) = '1')then
                      wb_dsp_wr_state <= WB_DSP_WR_FIFO_WR_EN_1;
                      wb_cross_clock_out_din <= "100" &  WB_SLV_DAT_I(14) & WB_SLV_ADR_I(14)((C_WB_SLV_ADDRESS_BITS - 1) downto 0) & WB_SLV_CYC_I(14) & WB_SLV_SEL_I(14) & '1';   
                      wb_cross_clock_out_wrreq <= '1' and not(wb_cross_clock_out_full);
                  --Check for strobe and write deasserted (read operation)    
                  elsif (WB_SLV_STB_I(14) = '1' and wb_slv_stb_hist_i = '0' and  WB_SLV_WE_I(14) = '0') then
                      wb_dsp_wr_state <= WB_DSP_WR_FIFO_WR_EN_3;
                      wb_cross_clock_out_din <= "100" &  WB_SLV_DAT_I(14) & WB_SLV_ADR_I(14)((C_WB_SLV_ADDRESS_BITS - 1) downto 0) & WB_SLV_CYC_I(14) & WB_SLV_SEL_I(14) & '0';   
                      wb_cross_clock_out_wrreq <= '1' and not(wb_cross_clock_out_full);                  
                  else
                      wb_dsp_wr_state <= WB_DSP_WR_STROBE_CHECK;                  
                      wb_cross_clock_out_din <= "000" &  WB_SLV_DAT_I(14) & WB_SLV_ADR_I(14)((C_WB_SLV_ADDRESS_BITS - 1) downto 0) & WB_SLV_CYC_I(14) & WB_SLV_SEL_I(14) & '0';
                      wb_cross_clock_out_wrreq <= '0';
                  end if;
                --enable write for two clock cycles to ensure wishbone write is successful  
                when WB_DSP_WR_FIFO_WR_EN_1 =>
                  
                  wb_dsp_wr_state <= WB_DSP_WR_FIFO_WR_EN_2;
                  wb_cross_clock_out_wrreq <= '1' and not(wb_cross_clock_out_full);
                  wb_cross_clock_out_din <= "100" &  WB_SLV_DAT_I(14) & WB_SLV_ADR_I(14)((C_WB_SLV_ADDRESS_BITS - 1) downto 0) & WB_SLV_CYC_I(14) & WB_SLV_SEL_I(14) & '1';                           

                --enable write for three clock cycles to ensure wishbone write is successful  
                when WB_DSP_WR_FIFO_WR_EN_2 =>
                  
                  wb_dsp_wr_state <= WB_DSP_WR_FIFO_WR_EN_3;
                  wb_cross_clock_out_wrreq <= '1' and not(wb_cross_clock_out_full);
                  wb_cross_clock_out_din <= "100" &  WB_SLV_DAT_I(14) & WB_SLV_ADR_I(14)((C_WB_SLV_ADDRESS_BITS - 1) downto 0) & WB_SLV_CYC_I(14) & WB_SLV_SEL_I(14) & '1';                           

                --write in next cycle to ensure strobe and values have cleared, except cyc signal                
                when WB_DSP_WR_FIFO_WR_EN_3 =>

                  wb_dsp_wr_state <= WB_DSP_WR_FIFO_WR_EN_4;
                  wb_cross_clock_out_wrreq <= '1' and not(wb_cross_clock_out_full);
                  wb_cross_clock_out_din <= "000" &  WB_SLV_DAT_I(14) & WB_SLV_ADR_I(14)((C_WB_SLV_ADDRESS_BITS - 1) downto 0) & WB_SLV_CYC_I(14) & WB_SLV_SEL_I(14) & '0';
                --write in next cycle to ensure all strobe and values have cleared, including cyc signal                
                when WB_DSP_WR_FIFO_WR_EN_4 =>
                 
                  wb_dsp_wr_state <= WB_DSP_WR_FIFO_WR_DIS;
                  wb_cross_clock_out_wrreq <= '1' and not(wb_cross_clock_out_full);
                  wb_cross_clock_out_din <= "000" &  WB_SLV_DAT_I(14) & WB_SLV_ADR_I(14)((C_WB_SLV_ADDRESS_BITS - 1) downto 0) & '0' & WB_SLV_SEL_I(14) & '0';

                --stop writing and allow slower clock to read out              
                when WB_DSP_WR_FIFO_WR_DIS =>
                  wb_dsp_wr_state <= WB_DSP_WR_STROBE_CHECK;
                  wb_cross_clock_out_wrreq <= '0';
                  wb_cross_clock_out_din <= "000" &  WB_SLV_DAT_I(14) & WB_SLV_ADR_I(14)((C_WB_SLV_ADDRESS_BITS - 1) downto 0) & '0' & WB_SLV_SEL_I(14) & '0';
                  
                when others =>
                  wb_dsp_wr_state <= WB_DSP_WR_IDLE;
            end case;
        end if;
    end process;   
   
    --Start reading out of the wishbone FIFO (wishbone to DSP interface [39.0625MHz to 39.0625MHz]) when FIFO is not empty   
    wb_cross_clock_out_rdreq <= '1' when ((wb_cross_clock_out_empty = '0') and (bsp_rst = '0')) else '0';
    
    --Wishbone signals from the DSP
    
    --This process only allows valid data to be latched through
    --creates a static bus signal for the synchroniser function below
    read_wb_dsp_data : process(bsp_rst, bsp_clk)
    begin
        if (bsp_rst = '1')then
            wb_data_in <= (others => '0');
            wb_ack_in <= '0';
        elsif (rising_edge(bsp_clk))then
            --if valid data
            if (WB_SLV_ACK_O_top = '1')then
                wb_data_in <= WB_SLV_DAT_O_top;
                wb_ack_in <= '1';
            else
                wb_ack_in <= '0';                
            end if;   
        end if;
    end process; 
    
    -- This function performs clock domain crossing synchronisation
    -- on a static bus signal
    wb_read_synchroniser: process(bsp_rst, bsp_clk, wb_ack_in)
    begin
        if (bsp_rst = '1') then
            wb_ack_in_z1 <= '0';
            wb_ack_in_z2 <= '0';
            wb_sync_data_in <= (others => '0');
            wb_sync_ack_in <= '0';
        elsif (rising_edge(bsp_clk)) then
            wb_ack_in_z2 <= wb_ack_in_z1;
            wb_ack_in_z1 <= wb_ack_in;
            if (wb_ack_in_z2 = '1') then
                wb_sync_data_in <= wb_data_in;
                wb_sync_ack_in <= '1';
            else
                wb_sync_ack_in <= '0';
            end if;
        end if;
    end process;
    
    -------------------------------------------------------------------------
    -- LED Manager Instantiation
    -------------------------------------------------------------------------
    
    pCDCLedManSynchroniser : process(sys_clk)
    begin
       if (rising_edge(sys_clk))then
         sDhcpResolvedD2 <= sDhcpResolvedD1;
         sDhcpResolvedD1 <= brd_user_write_regs(C_WR_FRONT_PANEL_STAT_LED_ADDR)(0);        
         
         sUbToggleValueD2 <= sUbToggleValueD1;
         sUbToggleValueD1 <= brd_user_read_regs(C_RD_UBLAZE_ALIVE_ADDR)(0);        
         
         sDspOverrideD2 <= sDspOverrideD1;
         sDspOverrideD1 <= brd_user_read_regs(C_RD_DSP_OVERRIDE_ADDR)(0);               
       end if;
    end process pCDCLedManSynchroniser;     

    led_manager_0 : led_manager
    port map(
        clk                   => sys_clk,
        rst                   => sys_rst,
        forty_gbe_link_status => fgbe_phy_rx_up_0 or fgbe_phy_rx_up_1 or fgbe_phy_rx_up_2 or fgbe_phy_rx_up_3, -- Only using 40GbE_0
        dhcp_resolved         => sDhcpResolvedD2,
        firmware_version      => C_VERSION(31 downto 28),
        ublaze_toggle_value   => sUbToggleValueD2,
        dsp_override_i        => sDspOverrideD2,
        dsp_leds_i            => dsp_leds_i,
        leds_out              => fpga_leds_o
    );

    board_clk_o <= sys_clk;
    board_clk_rst_o <= sys_rst;
    --user_mmcm_locked_o <= user_mmcm_locked;
end arch_skarab_infr;
