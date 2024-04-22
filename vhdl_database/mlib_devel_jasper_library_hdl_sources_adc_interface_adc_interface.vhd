------------------------------------------------------------------------------
-- adc_interface.vhd - IBOB ADC interface
------------------------------------------------------------------------------
--
--  $Id$
--
--  Original author : Pierre-Yves Droz
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--------------------------------------------------------------------------------
-- Entity section
--------------------------------------------------------------------------------

entity adc_interface is
    port
    (
        --------------------------------------
        -- differential signals from/to the ADC
        --------------------------------------
        -- clocks
        adc_clk_p         : in std_logic;
        adc_clk_n         : in std_logic;
        -- sync
        adc_sync_p        : in std_logic;
        adc_sync_n        : in std_logic;
        -- out of range
        adc_outofrangei_p : in std_logic;
        adc_outofrangei_n : in std_logic;
        adc_outofrangeq_p : in std_logic;
        adc_outofrangeq_n : in std_logic;
        -- data
        adc_dataeveni_p   : in std_logic_vector(7 downto 0);
        adc_dataeveni_n   : in std_logic_vector(7 downto 0);
        adc_dataoddi_p    : in std_logic_vector(7 downto 0);
        adc_dataoddi_n    : in std_logic_vector(7 downto 0);
        adc_dataevenq_p   : in std_logic_vector(7 downto 0);
        adc_dataevenq_n   : in std_logic_vector(7 downto 0);
        adc_dataoddq_p    : in std_logic_vector(7 downto 0);
        adc_dataoddq_n    : in std_logic_vector(7 downto 0);
        -- ddr reset
        adc_ddrb_p        : out std_logic;
        adc_ddrb_n        : out std_logic;

        --------------------------------------
        -- demuxed data from the ADC
        --------------------------------------
        -- data
        user_datai0       : out std_logic_vector(7 downto 0);
        user_datai1       : out std_logic_vector(7 downto 0);
        user_datai2       : out std_logic_vector(7 downto 0);
        user_datai3       : out std_logic_vector(7 downto 0);
        user_dataq0       : out std_logic_vector(7 downto 0);
        user_dataq1       : out std_logic_vector(7 downto 0);
        user_dataq2       : out std_logic_vector(7 downto 0);
        user_dataq3       : out std_logic_vector(7 downto 0);
        -- out of range
        user_outofrangei0 : out std_logic;
        user_outofrangei1 : out std_logic;
        user_outofrangeq0 : out std_logic;
        user_outofrangeq1 : out std_logic;
        -- sync
        user_sync0        : out std_logic;
        user_sync1        : out std_logic;
        user_sync2        : out std_logic;
        user_sync3        : out std_logic;
        -- data valid
        user_data_valid   : out std_logic;

        --------------------------------------
        -- system ports
        --------------------------------------
        mmcm_reset        : in std_logic;
        ctrl_reset        : in std_logic;
        ctrl_clk_in       : in std_logic;
        ctrl_clk_out      : out std_logic;
        ctrl_clk90_out    : out std_logic;
        ctrl_clk180_out   : out std_logic;
        ctrl_clk270_out   : out std_logic;
        ctrl_dcm_locked   : out std_logic;
        -- dcm clock shift
        dcm_psclk         : in std_logic := '0';
        dcm_psen          : in std_logic := '0';
        dcm_psincdec      : in std_logic := '0';
        mmcm_psdone       : out std_logic
    );
end entity adc_interface;

--------------------------------------------------------------------------------
-- Architecture section
--------------------------------------------------------------------------------

architecture IMP of adc_interface is

    --------------------------------------
    -- signals from the ADC
    --------------------------------------
    -- sync
    signal adc_sync         : std_logic;
    -- out of range
    signal adc_outofrangei  : std_logic;
    signal adc_outofrangeq  : std_logic;
    -- data
    signal adc_dataeveni    : std_logic_vector(7 downto 0);
    signal adc_dataoddi     : std_logic_vector(7 downto 0);
    signal adc_dataevenq    : std_logic_vector(7 downto 0);
    signal adc_dataoddq     : std_logic_vector(7 downto 0);

    --------------------------------------
    -- half rate signals
    --------------------------------------
    -- out of range
    signal adc_outofrangei_recapture    : std_logic_vector(1 downto 0);
    signal adc_outofrangeq_recapture    : std_logic_vector(1 downto 0);
    signal adc_outofrangei_ddr          : std_logic_vector(1 downto 0);
    signal adc_outofrangeq_ddr          : std_logic_vector(1 downto 0);
    -- data
    signal adc_datai_recapture          : std_logic_vector(31 downto 0);
    signal adc_dataq_recapture          : std_logic_vector(31 downto 0);
    signal adc_datai_ddr                : std_logic_vector(31 downto 0);
    signal adc_dataq_ddr                : std_logic_vector(31 downto 0);
    -- sync
    signal adc_sync_recapture           : std_logic_vector(3 downto 0);
    signal adc_sync_capture             : std_logic_vector(3 downto 0);
    signal adc_sync_ddr                 : std_logic_vector(3 downto 0);

    --------------------------------------
    -- fifo signals
    --------------------------------------

    signal fifo_din             : std_logic_vector(71 downto 0);
    signal fifo_dout            : std_logic_vector(71 downto 0);
    signal fifo_rd_en           : std_logic := '0';
    signal fifo_empty           : std_logic;
    signal fifo_full            : std_logic;

    ----------------------------------------
    -- Clock signals
    ----------------------------------------
    signal adc_clk              : std_logic;
    signal adc_clk_fb           : std_logic;
    signal adc_clk90            : std_logic;
    signal adc_clk180           : std_logic;
    signal adc_clk270           : std_logic;
    signal adc_clk_fb_mmcm      : std_logic;
    signal adc_clk_buf          : std_logic;
    signal adc_clk_mmcm         : std_logic;
    signal adc_clk90_mmcm       : std_logic;
    signal adc_clk180_mmcm      : std_logic;
    signal adc_clk270_mmcm      : std_logic;

    ----------------------------------------
    -- Keep constraints
    ----------------------------------------
    attribute keep : string;
    attribute keep of adc_sync_ddr: signal is "true";

    ----------------------------------------
    -- Input differential buffer
    ----------------------------------------
    component IBUFDS
        generic (
            DIFF_TERM : boolean := TRUE
        );
        port (
            I  : in  std_logic;
            IB : in  std_logic;
            O  : out std_logic
        );
    end component;

    ----------------------------------------
    -- Output differential buffer
    ----------------------------------------
    component OBUFDS
        port (
            O  : out std_logic;
            OB : out std_logic;
            I  : in  std_logic
        );
    end component;

    ----------------------------------------
    -- Global clock buffer
    ----------------------------------------
    component BUFG
        port (
            I  : in  std_logic;
            O  : out std_logic
        );
    end component;

    ----------------------------------------
    -- Asynchronous FIFO
    ----------------------------------------

    component adc_fifo
        port (
            din    : IN  std_logic_VECTOR(71 downto 0);
            rd_clk : IN  std_logic;
            rd_en  : IN  std_logic;
            rst    : IN  std_logic;
            wr_clk : IN  std_logic;
            wr_en  : IN  std_logic;
            dout   : OUT std_logic_VECTOR(71 downto 0);
            empty  : OUT std_logic;
            full   : OUT std_logic;
            valid  : OUT std_logic
        );
    end component;

    component MMCM_BASE
        generic (
            BANDWIDTH          : string  := "OPTIMIZED"; -- Jitter programming ("HIGH","LOW","OPTIMIZED")
            CLKFBOUT_MULT_F    : integer := 5;           -- Multiply value for all CLKOUT (5.0-64.0). THIS IS THE MULTIPLIER
            CLKFBOUT_PHASE     : real    := 0.0;
            CLKIN1_PERIOD      : real    := 2.5;
            CLKOUT0_DIVIDE_F   : integer := 5;           -- Divide amount for CLKOUT0 (1.000-128.000).
            CLKOUT0_DUTY_CYCLE : real    := 0.5; 
            CLKOUT1_DUTY_CYCLE : real    := 0.5;
            CLKOUT2_DUTY_CYCLE : real    := 0.5;
            CLKOUT3_DUTY_CYCLE : real    := 0.5;
            CLKOUT4_DUTY_CYCLE : real    := 0.5;
            CLKOUT5_DUTY_CYCLE : real    := 0.5;
            CLKOUT6_DUTY_CYCLE : real    := 0.5;
            CLKOUT0_PHASE      : real    := 0.0;
            CLKOUT1_PHASE      : integer := 90;
            CLKOUT2_PHASE      : integer := 180;
            CLKOUT3_PHASE      : integer := 270;
            CLKOUT4_PHASE      : real    := 0.0;
            CLKOUT5_PHASE      : real    := 0.0;
            CLKOUT6_PHASE      : real    := 0.0;
            CLKOUT1_DIVIDE     : integer := 5;            -- THIS IS THE DIVISOR
            CLKOUT2_DIVIDE     : integer := 5;
            CLKOUT3_DIVIDE     : integer := 5;
            CLKOUT4_DIVIDE     : integer := 1;
            CLKOUT5_DIVIDE     : integer := 1;
            CLKOUT6_DIVIDE     : integer := 1;
            CLKOUT4_CASCADE    : string  := "FALSE";
            CLOCK_HOLD         : string  := "FALSE";
            DIVCLK_DIVIDE      : integer := 1;            -- Master division value (1-80)
            REF_JITTER1        : real    := 0.0;
            STARTUP_WAIT       : string  := "FALSE"
        );
        port (
            CLKIN1    : in  std_logic;
            CLKFBIN   : in  std_logic;
            
            CLKFBOUT  : out std_logic;
            CLKFBOUTB : out std_logic;
            
            CLKOUT0   : out std_logic;
            CLKOUT0B  : out std_logic;
            CLKOUT1   : out std_logic;
            CLKOUT1B  : out std_logic;
            CLKOUT2   : out std_logic;
            CLKOUT2B  : out std_logic;
            CLKOUT3   : out std_logic;
            CLKOUT3B  : out std_logic;
            CLKOUT4   : out std_logic;
            CLKOUT5   : out std_logic;
            CLKOUT6   : out std_logic;
            LOCKED    : out std_logic;
            
            PWRDWN    : in  std_logic;
            RST       : in  std_logic
        );
    end component;
    ----------------------------------------
    -- clock DCM
    ----------------------------------------
--
--    component DCM_ADV
--        generic (
--            CLK_FEEDBACK          :     string     := "1X";
--            CLKDV_DIVIDE          :     real       := 2.000000;
--            CLKFX_DIVIDE          :     integer    := 1;
--            CLKFX_MULTIPLY        :     integer    := 4;
--            CLKIN_DIVIDE_BY_2     :     boolean    := false;
--            CLKIN_PERIOD          :     real       := 0.000000;
--            CLKOUT_PHASE_SHIFT    :     string     := "NONE";
--            DESKEW_ADJUST         :     string     := "SYSTEM_SYNCHRONOUS";
--            DFS_FREQUENCY_MODE    :     string     := "HIGH";
--            DLL_FREQUENCY_MODE    :     string     := "HIGH";
--            DUTY_CYCLE_CORRECTION :     boolean    := true;
--            FACTORY_JF            :     bit_vector := x"C080";
--            PHASE_SHIFT           :     integer    := 0;
--            STARTUP_WAIT          :     boolean    := false;
--            DSS_MODE              :     string     := "NONE"
--        );
--        port (
--            CLKIN                   : in  std_logic;
--            CLKFB                   : in  std_logic;
--            RST                     : in  std_logic;
--            PSEN                    : in  std_logic;
--            PSINCDEC                : in  std_logic;
--            PSCLK                   : in  std_logic;
--            CLK0                    : out std_logic;
--            CLK90                   : out std_logic;
--            CLK180                  : out std_logic;
--            CLK270                  : out std_logic;
--            CLKDV                   : out std_logic;
--            CLK2X                   : out std_logic;
--            CLK2X180                : out std_logic;
--            CLKFX                   : out std_logic;
--            CLKFX180                : out std_logic;
--            LOCKED                  : out std_logic;
--            PSDONE                  : out std_logic;
--            DCLK                    : in  std_logic;
--            DADDR                   : in  std_logic_vector (6 downto 0);
--            DI                      : in  std_logic_vector (15 downto 0);
--            DWE                     : in  std_logic;
--            DEN                     : in  std_logic;
--            DO                      : out std_logic_vector (15 downto 0);
--            DRDY                    : out std_logic
--        );
--    end component;

    ----------------------------------------
    -- DDR Input Register
    ----------------------------------------

    component ddr_input
        port (
            clk   : in  std_logic;
            d     : in  std_logic;
            rst   : in  std_logic := '0';
            qrise : out std_logic;
            qfall : out std_logic
        );
    end component;

begin

----------------------------------------
-- Capture the value of the sync on the different cloks
-- TODO: Capture 0 and 180 phases using a ddr_input component?
----------------------------------------
SYNC_CAPTURE_0_PROC : process(adc_clk) is
begin
    if adc_clk'event and adc_clk = '1' then
        adc_sync_ddr(3)             <= adc_sync;
    end if;
end process;

SYNC_CAPTURE_90_PROC : process(adc_clk90) is
begin
    if adc_clk90'event and adc_clk90 = '1' then
        adc_sync_ddr(2)             <= adc_sync;
    end if;
end process;

SYNC_CAPTURE_180_PROC : process(adc_clk) is
begin
    if adc_clk'event and adc_clk = '0' then
        adc_sync_ddr(1)             <= adc_sync;
    end if;
end process;

SYNC_CAPTURE_270_PROC : process(adc_clk90) is
begin
    if adc_clk90'event and adc_clk90 = '0' then
        adc_sync_ddr(0)             <= adc_sync;
    end if;
end process;

----------------------------------------
-- Intermediate capture to help with cross clock boundaries
----------------------------------------
SYNC_CAPTURE_0_0_PROC : process(adc_clk) is
begin
    if adc_clk'event and adc_clk = '1' then
        adc_sync_capture(3)             <= adc_sync_ddr(3);
    end if;
end process;

SYNC_CAPTURE_90_0_PROC : process(adc_clk) is
begin
    if adc_clk'event and adc_clk = '1' then
        adc_sync_capture(2)             <= adc_sync_ddr(2);
    end if;
end process;

SYNC_CAPTURE_180_90_PROC : process(adc_clk90) is
begin
    if adc_clk90'event and adc_clk90 = '1' then
        adc_sync_capture(1)             <= adc_sync_ddr(1);
    end if;
end process;

SYNC_CAPTURE_270_90_PROC : process(adc_clk90) is
begin
    if adc_clk90'event and adc_clk90 = '1' then
        adc_sync_capture(0)             <= adc_sync_ddr(0);
    end if;
end process;

----------------------------------------
-- Capture the value of the DDR data pins
--
-- This uses the ddr_input component as recommended in the
-- Virtex-II Pro User Guide [UG012 (v4.0) 23 March 2005, pp 250-1]
----------------------------------------
ADC_DATA_DDR: for i in adc_dataeveni'range generate
    adc_dataeveni_ddr: ddr_input port map (
        clk   => adc_clk,
        d     => adc_dataeveni(i),
        qrise => adc_datai_ddr(i + 24),
        qfall => adc_datai_ddr(i +  8)
    );
    adc_dataoddi_ddr: ddr_input port map (
        clk   => adc_clk,
        d     => adc_dataoddi(i),
        qrise => adc_datai_ddr(i + 16),
        qfall => adc_datai_ddr(i +  0)
    );

    adc_dataevenq_ddr: ddr_input port map (
        clk   => adc_clk,
        d     => adc_dataevenq(i),
        qrise => adc_dataq_ddr(i + 24),
        qfall => adc_dataq_ddr(i +  8)
    );
    adc_dataoddq_ddr: ddr_input port map (
        clk   => adc_clk,
        d     => adc_dataoddq(i),
        qrise => adc_dataq_ddr(i + 16),
        qfall => adc_dataq_ddr(i +  0)
    );
end generate;

adc_oori_ddr: ddr_input port map (
    clk   => adc_clk,
    d     => adc_outofrangei,
    qrise => adc_outofrangei_ddr(1),
    qfall => adc_outofrangei_ddr(0)
);
adc_oorq_ddr: ddr_input port map (
    clk   => adc_clk,
    d     => adc_outofrangeq,
    qrise => adc_outofrangeq_ddr(1),
    qfall => adc_outofrangeq_ddr(0)
);

-----------------------------------------------------
-- Re-capture all DDR inputs to adc_clk's rising edge
-----------------------------------------------------
ADC_RECAPTURE_PROC : process(adc_clk) is
begin
    if adc_clk'event and adc_clk = '1' then
        adc_outofrangei_recapture   <= adc_outofrangei_ddr;
        adc_outofrangeq_recapture   <= adc_outofrangeq_ddr;
        adc_datai_recapture         <= adc_datai_ddr;
        adc_dataq_recapture         <= adc_dataq_ddr;
        adc_sync_recapture          <= adc_sync_capture;
    end if;
end process;

----------------------------------------
-- Asynchronous FIFO for clock boundary crossing
----------------------------------------

-- Read enable managment
FIFO_RD_EN_PROC : process(ctrl_clk_in, mmcm_reset) is
begin
    if mmcm_reset = '1' then
        fifo_rd_en <= '0';
    else
        if ctrl_clk_in'event and ctrl_clk_in = '1' then
            fifo_rd_en <= not(fifo_empty);
        end if;
    end if;
end process;

-- FIFO signals assignment
fifo_din <= adc_datai_recapture & adc_dataq_recapture & adc_outofrangei_recapture & adc_outofrangeq_recapture & adc_sync_recapture;
user_datai3        <= fifo_dout(47 downto 40);
user_datai2        <= fifo_dout(55 downto 48);
user_datai1        <= fifo_dout(63 downto 56);
user_datai0        <= fifo_dout(71 downto 64);
user_dataq3        <= fifo_dout(15 downto 8 );
user_dataq2        <= fifo_dout(23 downto 16);
user_dataq1        <= fifo_dout(31 downto 24);
user_dataq0        <= fifo_dout(39 downto 32);
user_outofrangei1  <= fifo_dout(6);
user_outofrangei0  <= fifo_dout(7);
user_outofrangeq1  <= fifo_dout(4);
user_outofrangeq0  <= fifo_dout(5);
user_sync3         <= fifo_dout(0);
user_sync2         <= fifo_dout(1);
user_sync1         <= fifo_dout(2);
user_sync0         <= fifo_dout(3);

-- Async FIFO
ADC_ASYNC_FIFO : adc_fifo
    port map (
        wr_clk => adc_clk,
        wr_en  => not ctrl_reset,
        din    => fifo_din,
        full   => fifo_full,

        rd_clk => ctrl_clk_in,
        rd_en  => fifo_rd_en,
        dout   => fifo_dout,
        empty  => fifo_empty,
        valid  => user_data_valid,

        rst    => mmcm_reset
    );

----------------------------------------
-- Differential ADC DDR output reset
----------------------------------------
OBUFDS_ADC_DDRB : OBUFDS
    port map (
        O  => adc_ddrb_p,
        OB => adc_ddrb_n,
        I  => ctrl_reset
    );

----------------------------------------
-- Sync differential input buffer
----------------------------------------

IBUFDS_SYNC : IBUFDS
    generic map (DIFF_TERM => TRUE)
    port map ( I => adc_sync_p, IB => adc_sync_n, O => adc_sync);

----------------------------------------
-- Out of range differential input buffers
----------------------------------------

IBUFDS_OUTOFRANGEI : IBUFDS
    generic map (DIFF_TERM => TRUE)
    port map ( I => adc_outofrangei_p, IB => adc_outofrangei_n, O => adc_outofrangei);
IBUFDS_OUTOFRANGEQ : IBUFDS
    generic map (DIFF_TERM => TRUE)
    port map ( I  => adc_outofrangeq_p, IB => adc_outofrangeq_n, O => adc_outofrangeq);

----------------------------------------
-- Data differential input buffers
----------------------------------------

IBUFDC_DATA: for i in adc_dataeveni'range generate
    -- Even samples, Channel I
    IBUFDS_DATAEVENI : IBUFDS 
    generic map (
        DIFF_TERM => TRUE
    )
    port map (
        I  => adc_dataeveni_p(i),
        IB => adc_dataeveni_n(i),
        O  => adc_dataeveni(i)
    );

    -- Odd samples, Channel I
    IBUFDS_DATAODDI : IBUFDS
    generic map (
        DIFF_TERM => TRUE
    )
    port map (
        I  => adc_dataoddi_p(i),
        IB => adc_dataoddi_n(i),
        O  => adc_dataoddi(i)
    );

    -- Even samples, Channel Q
    IBUFDS_DATAEVENQ : IBUFDS
    generic map (
        DIFF_TERM => TRUE
    )
    port map (
        I  => adc_dataevenq_p(i),
        IB => adc_dataevenq_n(i),
        O  => adc_dataevenq(i)
    );

    -- Odd samples, Channel Q
    IBUFDS_DATAODDQ : IBUFDS
    generic map (
        DIFF_TERM => TRUE
    )
    port map (
        I  => adc_dataoddq_p(i),
        IB => adc_dataoddq_n(i),
        O  => adc_dataoddq(i)
    );
end generate;

----------------------------------------
-- Clock buffer
----------------------------------------

IBUFDS_CLK : IBUFDS
    generic map (DIFF_TERM => TRUE)
    port map ( I => adc_clk_p, IB => adc_clk_n, O => adc_clk_buf);

CLK_CLKBUF : BUFG
    port map ( I => adc_clk_mmcm,    O => adc_clk);
CLK90_CLKBUF : BUFG
    port map ( I => adc_clk90_mmcm,  O => adc_clk90);
CLK180_CLKBUF : BUFG
    port map ( I => adc_clk180_mmcm, O => adc_clk180);
CLK270_CLKBUF : BUFG
    port map ( I => adc_clk270_mmcm, O => adc_clk270);
CLKFB_CLKBUF : BUFG
    port map ( I => adc_clk_fb_mmcm, O => adc_clk_fb);


ctrl_clk_out    <= adc_clk;
ctrl_clk90_out  <= adc_clk90;
ctrl_clk180_out <= adc_clk180;
ctrl_clk270_out <= adc_clk270;


CLKSHIFT_MMCM : MMCM_BASE
    generic map(
        BANDWIDTH          => "OPTIMIZED", -- Jitter programming ("HIGH","LOW","OPTIMIZED")
        CLKFBOUT_MULT_F    => 5,           -- Multiply value for all CLKOUT (5.0-64.0). THIS IS THE MULTIPLIER
        CLKFBOUT_PHASE     => 0.0,
        CLKIN1_PERIOD      => 4.0,
        CLKOUT0_DIVIDE_F   => 5,           -- Divide amount for CLKOUT0 (1.000-128.000).
        CLKOUT0_DUTY_CYCLE => 0.5,
        CLKOUT1_DUTY_CYCLE => 0.5,
        CLKOUT2_DUTY_CYCLE => 0.5,
        CLKOUT3_DUTY_CYCLE => 0.5,
        CLKOUT4_DUTY_CYCLE => 0.5,
        CLKOUT5_DUTY_CYCLE => 0.5,
        CLKOUT6_DUTY_CYCLE => 0.5,
        CLKOUT0_PHASE      => 0.0,
        CLKOUT1_PHASE      => 90,
        CLKOUT2_PHASE      => 180,
        CLKOUT3_PHASE      => 270,
        CLKOUT4_PHASE      => 0.0,
        CLKOUT5_PHASE      => 0.0,
        CLKOUT6_PHASE      => 0.0,
        CLKOUT1_DIVIDE     => 5,            -- THIS IS THE DIVISOR
        CLKOUT2_DIVIDE     => 5,
        CLKOUT3_DIVIDE     => 5,
        CLKOUT4_DIVIDE     => 1,
        CLKOUT5_DIVIDE     => 1,
        CLKOUT6_DIVIDE     => 1,
        CLKOUT4_CASCADE    => "FALSE",
        CLOCK_HOLD         => "FALSE",
        DIVCLK_DIVIDE      => 1,            -- Master division value (1-80)
        REF_JITTER1        => 0.0,
        STARTUP_WAIT       => "FALSE")
    port map(
        CLKIN1    => adc_clk_buf,
        CLKFBIN   => adc_clk_fb,
        
        CLKFBOUT  => adc_clk_fb_mmcm,
        CLKFBOUTB => open,
        
        CLKOUT0   => adc_clk_mmcm,
        CLKOUT0B  => open,
        CLKOUT1   => adc_clk90_mmcm,
        CLKOUT1B  => open,
        CLKOUT2   => adc_clk180_mmcm,
        CLKOUT2B  => open,
        CLKOUT3   => adc_clk270_mmcm,
        CLKOUT3B  => open,
        CLKOUT4   => open,
        CLKOUT5   => open,
        CLKOUT6   => open,
        LOCKED    => mmcm_psdone,
        
        PWRDWN    => '0',
        RST       => mmcm_reset
    );

----------------------------------------
-- Clock DCM for phase shifting
----------------------------------------

--CLKSHIFT_DCM : DCM_ADV
--    generic map(
--        CLK_FEEDBACK          => "1X",
--        CLKDV_DIVIDE          => 2.000000,
--        CLKFX_DIVIDE          => 1,
--        CLKFX_MULTIPLY        => 4,
--        CLKIN_DIVIDE_BY_2     => FALSE,
--        CLKIN_PERIOD          => 3.906250,
--        CLKOUT_PHASE_SHIFT    => "VARIABLE_CENTER",
--        DESKEW_ADJUST         => "SYSTEM_SYNCHRONOUS",
--        DFS_FREQUENCY_MODE    => "HIGH",
--        DLL_FREQUENCY_MODE    => "HIGH",
--        DUTY_CYCLE_CORRECTION => TRUE,
--        FACTORY_JF            => x"C080",
--        PHASE_SHIFT           => 64, -- 64 is a 90 degree offset
--        STARTUP_WAIT          => FALSE)
--    port map (
--        CLKFB                 => adc_clk,
--        CLKIN                 => adc_clk_buf,
--        PSCLK                 => dcm_psclk,
--        PSEN                  => dcm_psen,
--        PSINCDEC              => dcm_psincdec,
--        RST                   => dcm_reset,
--        CLKDV                 => open,
--        CLKFX                 => open,
--        CLKFX180              => open,
--        CLK0                  => adc_clk_dcm,
--        CLK2X                 => open,
--        CLK2X180              => open,
--        CLK90                 => adc_clk90_dcm,
--        CLK180                => adc_clk180_dcm,
--        CLK270                => adc_clk270_dcm,
--        LOCKED                => ctrl_dcm_locked,
--        PSDONE                => dcm_psdone,
--        DCLK                  => '0',
--        DADDR                 => "0000000",
--        DI                    => x"0000",
--        DWE                   => '0',
--        DEN                   => '0',
--        DO                    => open,
--        DRDY                  => open
--    );

end IMP;
