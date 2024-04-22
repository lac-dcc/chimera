library IEEE;
use IEEE.std_logic_1164.all;

library PoC;
use PoC.physical.all;

entity dnk7_queens0 is
  generic (
    -- Design Parameters
    N : positive := 27;
    L : positive :=  2;

    SOLVERS      : positive := 240;
    COUNT_CYCLES : boolean  := false;

    SENTINEL : std_logic_vector(7 downto 0) := x"FA";  -- Start Byte

    -- Local Clock Parameters
    CLK_FREQ : FREQ     := 50 MHz;
    CLK_DIV  : positive :=  1;  -- CLK_FREQ / CLK_DIV * CLK_MUL:
    CLK_MUL  : positive := 22;  --   as fast as possible but not above 1200 MHz

    -- Output Clocks
    CLK_DIV_COMP : positive :=  5;      -- fast computation clock
    CLK_DIV_SLOW : positive := 15       -- slower communication clock
  );
  port (
    ---------------------------------------------------------------------------
    -- 50-MHz Input Clock
    CLK_MBCLK : in std_logic;

    ---------------------------------------------------------------------------
    -- FPGA0: PCIe Interface
    BUS_PCIE_CLK_IN_P  : in    std_logic;
    BUS_PCIE_CLK_IN_N  : in    std_logic;
    BUS_PCIE_CLK_OUT_P : out   std_logic;
    BUS_PCIE_CLK_OUT_N : out   std_logic;

    BUS_PCIE_TO_HOST   : out std_logic_vector(38 downto 0);
    BUS_PCIE_FROM_HOST : in  std_logic_vector(77 downto 39);

    ---------------------------------------------------------------------------
    -- Ring Bus

    -- Output
    BUS_OUT_CLKP  : out std_logic;
    BUS_OUT_CLKN  : out std_logic;

    BUS_OUT_PRE_DAT   : out std_logic_vector(8 downto 0);
    BUS_OUT_PRE_PUT   : out std_logic;
    BUS_OUT_PRE_STALL : in  std_logic;

    BUS_OUT_SOL_DAT   : out std_logic_vector(8 downto 0);
    BUS_OUT_SOL_PUT   : out std_logic;
    BUS_OUT_SOL_STALL : in  std_logic;

    -- Input
    BUS_IN_CLKP  : in  std_logic;
    BUS_IN_CLKN  : in  std_logic;

    BUS_IN_PRE_DAT   : in  std_logic_vector(8 downto 0);
    BUS_IN_PRE_PUT   : in  std_logic;
    BUS_IN_PRE_STALL : out std_logic;

    BUS_IN_SOL_DAT   : in  std_logic_vector(8 downto 0);
    BUS_IN_SOL_PUT   : in  std_logic;
    BUS_IN_SOL_STALL : out std_logic
  );
end entity dnk7_queens0;


library IEEE;
use IEEE.numeric_std.all;

library PoC;
use PoC.utils.all;
use PoC.fifo.all;

library UNISIM;
use UNISIM.vcomponents.all;

architecture rtl of dnk7_queens0 is

  ----------------------------------------------------------------------------
  -- Communication Addresses

  -- Word Address: Read                          Write
  -----------------------------------------------------------------------------
  -- 0x0000       <byte capacity:32>            <-:30><enable:2> input  interrupt
  -- 0x0004       <bytes available:32>          <-:30><enable:2> output interrupt
  -- 0x0008       <!vld:1><0:23><data_out:8>    <-:24><data_in:8>
  --
  -- A data read  (@ 0x8) implicitly clears an output interrupt.
  -- A data write (@ 0x8) implicitly clears an input interrupt.
  --
  constant ADDR_STATUS : natural  := 16#00#;  -- status word, interrupt clearance
  constant ADDR_STREAM : natural  := 16#08#;  -- data stream in- and output

  constant ADDR_BITS   : positive := 4;       -- relevant address bits (at least 4)

  -- Bit Length of Pre-Placement
  constant PRE_BITS  : positive := 4*L*log2ceil(N)-1;
  constant PRE_BYTES : positive := (PRE_BITS+7)/8;

  -- FIFO Dimensioning
  constant FIFO_DEPTH : positive := 5*(SOLVERS+5);
  constant STATE_BITS : natural  := log2ceil(FIFO_DEPTH);

  ----------------------------------------------------------------------------
  component reset_resync is
    generic (
      VALUE_DURING_RESET : natural := 1
    );
    port (
      rst_in  : in std_logic;
      clk_in  : in std_logic;
      clk_out : in std_logic;
      rst_out : out std_logic
    );
  end component;

  component pcie_ddr_user_interface is
    generic (
      DCM_PHASE_SHIFT    : natural := 30;
      DCM_PERIOD         : natural := 10;
      DMA_ENGINE_ENABLES : natural := 7
    );
    port (
      reset     : in  std_logic;
      reset_out : out std_logic;
      user_clk  : in  std_logic;
      clk_out   : out std_logic;

      dcm_psdone   : out std_logic;
      dcm_psval    : out std_logic_vector(16 downto 0);
      dcm_psclk    : in  std_logic;
      dcm_psen     : in  std_logic;
      dcm_psincdec : in  std_logic;

      target_address       : out std_logic_vector(63 downto 0);
      target_write_data    : out std_logic_vector(63 downto 0);
      target_write_be      : out std_logic_vector(7 downto 0);
      target_address_valid : out std_logic;
      target_write_enable  : out std_logic;
      target_write_accept  : in  std_logic;

      target_read_enable     : out std_logic;
      target_request_tag     : out std_logic_vector(3 downto 0);
      target_read_data       : in  std_logic_vector(63 downto 0);
      target_read_accept     : in  std_logic;
      target_read_data_tag   : in  std_logic_vector(3 downto 0);
      target_read_data_valid : in  std_logic;
      target_read_ctrl       : out std_logic_vector(7 downto 0);
      target_read_data_ctrl  : in  std_logic_vector(7 downto 0);

      dma0_from_host_data      : out std_logic_vector(63 downto 0);
      dma0_from_host_ctrl      : out std_logic_vector(7 downto 0);
      dma0_from_host_valid     : out std_logic;
      dma0_from_host_advance   : in  std_logic;
      dma1_from_host_data      : out std_logic_vector(63 downto 0);
      dma1_from_host_ctrl      : out std_logic_vector(7 downto 0);
      dma1_from_host_valid     : out std_logic;
      dma1_from_host_advance   : in  std_logic;
      dma2_from_host_data      : out std_logic_vector(63 downto 0);
      dma2_from_host_ctrl      : out std_logic_vector(7 downto 0);
      dma2_from_host_valid     : out std_logic;
      dma2_from_host_advance   : in  std_logic;
      dma0_to_host_data        : in  std_logic_vector(63 downto 0);
      dma0_to_host_ctrl        : in  std_logic_vector(7 downto 0);
      dma0_to_host_valid       : in  std_logic;
      dma0_to_host_almost_full : out std_logic;
      dma1_to_host_data        : in  std_logic_vector(63 downto 0);
      dma1_to_host_ctrl        : in  std_logic_vector(7 downto 0);
      dma1_to_host_valid       : in  std_logic;
      dma1_to_host_almost_full : out std_logic;
      dma2_to_host_data        : in  std_logic_vector(63 downto 0);
      dma2_to_host_ctrl        : in  std_logic_vector(7 downto 0);
      dma2_to_host_valid       : in  std_logic;
      dma2_to_host_almost_full : out std_logic;

      user_interrupts : in std_logic;
      pcie_fromhost_counter : out std_logic_vector(31 downto 0);

      PCIE_TO_HOST_DDR : out std_logic_vector(38 downto 0);
      PCIE_TO_HOST_CLK_P : out std_logic;
      PCIE_TO_HOST_CLK_N : out std_logic;

      PCIE_FROM_HOST_DDR : in std_logic_vector(37 downto 0);
      PCIE_FROM_HOST_CLK_P : in std_logic;
      PCIE_FROM_HOST_CLK_N : in std_logic
    );
  end component;

  ----------------------------------------------------------------------------
  -- Global Control
  signal clk_comp : std_logic;
  signal rst_comp : std_logic;
  signal clk_slow : std_logic;
  signal rst_slow : std_logic;

  -----------------------------------------------------------------------------
  -- Communication FIFOs
  signal acap : std_logic_vector(STATE_BITS-1 downto 0);
  signal avld : std_logic;
  signal aful : std_logic;
  signal adin : std_logic_vector(7 downto 0);
  signal aput : std_logic;

  signal bavl  : std_logic_vector(STATE_BITS-1 downto 0);
  signal bvld  : std_logic;
  signal bful  : std_logic;
  signal bdout : std_logic_vector(7 downto 0);
  signal bgot  : std_logic;

begin

  ----------------------------------------------------------------------------
  -- Clock Generation
  blkClock : block
    signal clk50     : std_logic;
    signal clkfb     : std_logic;
    signal clk_compu : std_logic;
    signal clk_slowu : std_logic;
  begin
    clk_i : BUFG
      port map (
        I => CLK_MBCLK,
        O => clk50
      );

    pll : PLLE2_BASE
      generic map (
        CLKIN1_PERIOD  => to_real(to_time(CLK_FREQ), 1 ns),
        DIVCLK_DIVIDE  => CLK_DIV,
        CLKFBOUT_MULT  => CLK_MUL,
        CLKOUT0_DIVIDE => CLK_DIV_COMP,
        CLKOUT1_DIVIDE => CLK_DIV_SLOW,
        STARTUP_WAIT   => "true"
      )
      port map (
        RST      => '0',
        CLKIN1   => clk50,
        CLKFBOUT => clkfb,
        CLKFBIN  => clkfb,
        CLKOUT0  => clk_compu,
        CLKOUT1  => clk_slowu,
        CLKOUT2  => open,
        CLKOUT3  => open,
        CLKOUT4  => open,
        CLKOUT5  => open,
        LOCKED   => open,
        PWRDWN   => '0'
      );

    clk_compo : BUFG
      port map (
        I => clk_compu,
        O => clk_comp
      );
    clk_slowo : BUFG
       port map (
        I => clk_slowu,
        O => clk_slow
      );

  end block;

  ----------------------------------------------------------------------------
  -- PCIe -> Target Interface
  blkPcie: block

    -- Local Clock
    signal pcie_clk : std_logic;
    signal pcie_rst : std_logic;

    -- Target Interface
    -- Address
    signal target_address       : std_logic_vector(63 downto 0);
    signal target_address_valid : std_logic;

    -- Writing
    signal target_write_enable : std_logic;
    signal target_write_accept : std_logic;
    signal target_write_data   : std_logic_vector(63 downto 0);
    signal target_write_be     : std_logic_vector( 7 downto 0);

    -- Reading
    signal target_read_enable : std_logic;
    signal target_read_accept : std_logic;
    signal target_request_tag : std_logic_vector(3 downto 0);
    signal target_read_ctrl   : std_logic_vector(7 downto 0);

    signal target_read_data_valid : std_logic;
    signal target_read_data       : std_logic_vector(63 downto 0);
    signal target_read_data_tag   : std_logic_vector(3 downto 0);
    signal target_read_data_ctrl  : std_logic_vector(7 downto 0);

    -- Interrupt
    signal user_interrupt : std_logic;

  begin

    -- Reset Recovery
    resync_comp: reset_resync
      port map (
        rst_in  => pcie_rst,
        clk_in  => pcie_clk,
        clk_out => clk_comp,
        rst_out => rst_comp
      );
    resync_slow: reset_resync
      port map (
        rst_in  => pcie_rst,
        clk_in  => pcie_clk,
        clk_out => clk_slow,
        rst_out => rst_slow
      );

    ---------------------------------------------------------------------------
    -- PCIE <-> Target Interface
    pcie: pcie_ddr_user_interface
      generic map (
        DCM_PERIOD      => 6,
        DCM_PHASE_SHIFT => 198
      )
      port map (
        reset                    => '0',
        reset_out                => pcie_rst,
        clk_out                  => pcie_clk,
        user_clk                 => clk_slow,

        PCIE_TO_HOST_DDR         => bus_pcie_to_host,
        PCIE_TO_HOST_CLK_P       => bus_pcie_clk_out_p,
        PCIE_TO_HOST_CLK_N       => bus_pcie_clk_out_n,
        PCIE_FROM_HOST_DDR       => bus_pcie_from_host(76 downto 39),
        PCIE_FROM_HOST_CLK_P     => bus_pcie_clk_in_p,
        PCIE_FROM_HOST_CLK_N     => bus_pcie_clk_in_n,

        pcie_fromhost_counter    => open,
        user_interrupts          => user_interrupt,

        target_address           => target_address,
        target_address_valid     => target_address_valid,

        target_write_enable      => target_write_enable,
        target_write_accept      => target_write_accept,
        target_write_data        => target_write_data,
        target_write_be          => target_write_be,

        target_read_enable       => target_read_enable,
        target_read_accept       => target_read_accept,
        target_request_tag       => target_request_tag,
        target_read_ctrl         => target_read_ctrl,

        target_read_data_valid   => target_read_data_valid,
        target_read_data         => target_read_data,
        target_read_data_tag     => target_read_data_tag,
        target_read_data_ctrl    => target_read_data_ctrl,

        dma0_from_host_data      => open,
        dma0_from_host_ctrl      => open,
        dma0_from_host_valid     => open,
        dma0_from_host_advance   => '1',
        dma0_to_host_data        => (others => '-'),
        dma0_to_host_ctrl        => (others => '0'),
        dma0_to_host_valid       => '0',
        dma0_to_host_almost_full => open,
        dma1_from_host_data      => open,
        dma1_from_host_ctrl      => open,
        dma1_from_host_valid     => open,
        dma1_from_host_advance   => '1',
        dma1_to_host_data        => (others => '-'),
        dma1_to_host_ctrl        => (others => '0'),
        dma1_to_host_valid       => '0',
        dma1_to_host_almost_full => open,
        dma2_from_host_data      => open,
        dma2_from_host_ctrl      => open,
        dma2_from_host_valid     => open,
        dma2_from_host_advance   => '1',
        dma2_to_host_data        => (others => '-'),
        dma2_to_host_ctrl        => (others => '0'),
        dma2_to_host_valid       => '0',
        dma2_to_host_almost_full => open,

        dcm_psdone               => open,
        dcm_psval                => open,
        dcm_psclk                => clk_slow,
        dcm_psen                 => '0',
        dcm_psincdec             => '0'
      );

    ---------------------------------------------------------------------------
    -- Writing
    target_write_accept <= '1';
    aput <= target_write_enable and target_write_be(0) when
            to_integer(unsigned(target_address(ADDR_BITS-1 downto 0))) = ADDR_STREAM else '0';
    adin <= target_write_data(7 downto 0);

    ---------------------------------------------------------------------------
    -- Reading
    bgot <= '0' when to_integer(unsigned(target_address(ADDR_BITS-1 downto 0))) /= ADDR_STREAM else
            target_read_enable;
    blkRead: block
      signal rdVld : std_logic                     := '0';
      signal rdTag : std_logic_vector( 3 downto 0) := (others => '-');
      signal rdCtl : std_logic_vector( 7 downto 0) := (others => '-');
      signal rdDat : std_logic_vector(63 downto 0) := (others => '-');
    begin
      process(clk_slow)
      begin
        if rising_edge(clk_slow) then
          rdVld <= '0';
          rdTag <= (others => '-');
          rdCtl <= (others => '-');
          rdDat <= (others => '-');

          if rst_slow = '0' then

            -- Only accept word-align addresses
            if target_read_enable = '1' and target_address(1 downto 0) = "00" then
              rdVld <= '1';
              rdTag <= target_request_tag;
              rdCtl <= target_read_ctrl;

              rdDat <= (others => '0');
              if to_integer(unsigned(target_address(ADDR_BITS-1 downto 3))) = ADDR_STATUS/8 then
                -- Query FIFO States
                rdDat(STATE_BITS+31 downto 32) <= bavl;  -- @4
                rdDat(STATE_BITS- 1 downto 0)  <= acap;  -- @0
              elsif bgot = '1' then
                -- Read Output
                rdDat(31)         <= not bvld;           -- @8
                rdDat(7 downto 0) <= bdout;
              end if;
            end if;
          end if;

        end if;
      end process;
      target_read_accept     <= '1';
      target_read_data_valid <= rdVld;
      target_read_data       <= rdDat;
      target_read_data_tag   <= rdTag;
      target_read_data_ctrl  <= rdCtl;

    end block blkRead;

    ---------------------------------------------------------------------------
    -- Interrupts
    blkInterrupt: block

      -- Delayed FIFO Status
      signal Zavld  : std_logic := '0';
      signal Zaful  : std_logic := '0';
      signal Zbvld  : std_logic := '0';
      signal Zbful  : std_logic := '0';

      -- Interrupt State
      signal EnaIn  : std_logic := '0';  -- Enable
      signal EnaOut : std_logic := '0';
      signal IrqIn  : std_logic := '0';  -- Pending
      signal IrqOut : std_logic := '0';

    begin

      process(clk_slow)
      begin
        if rising_edge(clk_slow) then
          if rst_slow = '1' then
            Zavld <= '0';
            Zaful <= '0';
            Zbvld <= '0';
            Zbful <= '0';

            EnaIn  <= '0';
            EnaOut <= '0';
            IrqIn  <= '0';
            IrqOut <= '0';
          else

            -- Delayed Status for Edge Detection
            Zavld <= avld;
            Zaful <= aful;
            Zbvld <= bvld;
            Zbful <= bful;

            -- Input IRQ: space has become available | FIFO drained
            if target_write_enable = '1' and target_write_be(0) = '1' and
                  to_integer(unsigned(target_address(ADDR_BITS-1 downto 0))) = ADDR_STATUS then
		if target_write_data(1) = '1' then
		  EnaIn <= '1';
		elsif target_write_data(0) = '0' then
		  EnaIn <= '0';
		end if;
		if target_write_data(1) = '0' then
		  IrqIn <= '0';
		elsif target_write_data(0) = '1' then
		  IrqIn <= not aful;
		end if;
            elsif aput = '1' then
              IrqIn <= '0';
            elsif aful = '0' and Zaful = '1' then
              IrqIn <= EnaIn;
            elsif avld = '0' and Zavld = '1' then
              IrqIn <= EnaIn;
            end if;

            -- Output IRQ: data has become available | FIFO full
            if target_write_enable = '1' and target_write_be(4) = '1' and
                  to_integer(unsigned(target_address(ADDR_BITS-1 downto 0))) = ADDR_STATUS+4 then
		if target_write_data(33) = '1' then
		  EnaOut <= '1';
		elsif target_write_data(32) = '0' then
		  EnaOut <= '0';
		end if;
		if target_write_data(33) = '0' then
		  IrqOut <= '0';
		elsif target_write_data(32) = '1' then
		  IrqOut <= bvld;
		end if;
            elsif bvld = '1' and bgot = '1' then
              IrqOut <= '0';
            elsif bvld = '1' and Zbvld = '0' then
              IrqOut <= EnaOut;
            elsif bful = '1' and Zbful = '0' then
              IrqOut <= EnaOut;
            end if;

          end if;
        end if;
      end process;
      user_interrupt <= IrqIn or IrqOut;
    end block blkInterrupt;

  end block blkPcie;

  ----------------------------------------------------------------------------
  -- Input FIFO to Ring Bus
  blkFeed: block

    -- Byte FIFO -> Unframe
    signal glue_vld : std_logic;
    signal glue_dat : byte;
    signal glue_got : std_logic;

    -- Unframe -> Stream FIFO
    signal oful      : std_logic;
    signal odat      : byte;
    signal oeof      : std_logic;
    signal oput      : std_logic;
    signal ocommit   : std_logic;
    signal orollback : std_logic;

    -- Stream -> Ring Bus
    signal pigot : std_logic;
    signal pidat : byte;
    signal pieof : std_logic;

  begin
    -- Raw Byte Interface: no real buffer
    glue: fifo_glue
      generic map (
        D_BITS => 8
      )
      port map (
        clk => clk_slow,
        rst => rst_slow,
        put => aput,
        di  => adin,
        ful => aful,
        vld => glue_vld,
        do  => glue_dat,
        got => glue_got
      );

    -- Frame Extraction
    unframe_i: entity work.unframe
      generic map (
        SENTINEL => SENTINEL,
        PAY_LEN  => PRE_BYTES
      )
      port map (
        clk       => clk_slow,
        rst       => rst_slow,
        rx_dat    => glue_dat,
        rx_vld    => glue_vld,
        rx_got    => glue_got,
        odat      => odat,
        oeof      => oeof,
        oful      => oful,
        oput      => oput,
        ocommit   => ocommit,
        orollback => orollback
      );

    buf: fifo_cc_got_tempput
      generic map (
        D_BITS         => 9,
        MIN_DEPTH      => FIFO_DEPTH,
        ESTATE_WR_BITS => STATE_BITS
     )
      port map (
        clk => clk_slow,
        rst => rst_slow,

        put             => oput,
        din(8)          => oeof,
        din(7 downto 0) => odat,
        full            => oful,
        commit          => ocommit,
        rollback        => orollback,
        estate_wr       => acap,

        got              => pigot,
        dout(8)          => pieof,
        dout(7 downto 0) => pidat,
        valid            => avld
      );

    blkBus: block

      -- Syncing the stall input
      signal stall_s : std_logic_vector(1 downto 0) := (others => '1');

      -- Outgoing Output Registers
      signal OutDat : std_logic_vector(7 downto 0) := (others => '0');
      signal OutEof : std_logic := '0';
      signal OutPut : std_logic := '0';

      -- Inverted Output Clock
      signal clk_inv : std_logic;

    begin

      -------------------------------------------------------------------------
      -- Output Inverted Clock
      blkClock : block
        signal clk_inv : std_logic;
      begin
        invert : ODDR
          generic map(
            DDR_CLK_EDGE => "OPPOSITE_EDGE",
            INIT         => '1',
            SRTYPE       => "SYNC"
          )
          port map (
            Q  => clk_inv,              -- 1-bit DDR output
            C  => clk_slow,             -- 1-bit clock input
            CE => '1',                  -- 1-bit clock enable input
            D1 => '0',                  -- 1-bit data input (positive edge)
            D2 => '1',                  -- 1-bit data input (negative edge)
            R  => rst_slow,             -- 1-bit reset input
            S  => '0'                   -- 1-bit set input
          );

        OBUFDS_inst : OBUFDS
          generic map (
            IOSTANDARD => "DEFAULT",
            SLEW       => "FAST"
          )
          port map (
            O  => BUS_OUT_CLKP,
            OB => BUS_OUT_CLKN,
            I  => clk_inv
          );
      end block blkClock;

      -------------------------------------------------------------------------
      -- Pre-placement Output

      -- Syncing stall input
      process(clk_slow)
      begin
        if rising_edge(clk_slow) then
          if rst_slow = '1' then
            stall_s <= (others => '1');
          else
            stall_s <= BUS_OUT_PRE_STALL & stall_s(stall_s'left downto 1);
          end if;
        end if;
      end process;
      pigot <= avld and not stall_s(0);

      -- Output Registers
      process(clk_slow)
      begin
        if rising_edge(clk_slow) then
          if rst_slow = '1' then
            OutDat <= (others => '0');
            OutEof <= '0';
            OutPut <= '0';
          else
            OutDat <= pidat;
            OutEof <= pieof;
            OutPut <= pigot;
          end if;
        end if;
      end process;
      BUS_OUT_PRE_DAT <= OutEof & OutDat;
      BUS_OUT_PRE_PUT <= OutPut;

      -------------------------------------------------------------------------
      -- Start of Result Chain
      BUS_OUT_SOL_DAT <= (others => '0');
      BUS_OUT_SOL_PUT <= '0';

    end block blkBus;
  end block blkFeed;

  blkDrain: block

    -- Source synchronous clock domain
    signal clk_in : std_logic;
    signal rst_in : std_logic;

    -- Incoming Bus Data Capture Registers
    signal InPreDat : std_logic_vector(8 downto 0) := (others => '-');
    signal InPrePut : std_logic                    := '0';
    signal InPreCap : std_logic_vector(1 downto 0);

    signal InSolDat : std_logic_vector(8 downto 0) := (others => '-');
    signal InSolPut : std_logic                    := '0';
    signal InSolCap : std_logic_vector(1 downto 0);

    -- Solver Chain Connectivity
    signal pivld : std_logic;
    signal piful : std_logic;
    signal pidat : byte;
    signal pieof : std_logic;
    signal piput : std_logic;

    signal sivld : std_logic;
    signal sidat : byte;
    signal sieof : std_logic;
    signal sigot : std_logic;

    signal sovld : std_logic;
    signal sodat : byte;
    signal soeof : std_logic;
    signal sogot : std_logic;

    -- Solution Stream -> Frames
    signal tx_dat : std_logic_vector(7 downto 0);
    signal tx_ful : std_logic;
    signal tx_put : std_logic;

  begin

    ---------------------------------------------------------------------------
    -- Reading the Bus

    -- Clock Reconstruction
    blkClock: block
      signal clk_in0 : std_logic;
    begin
      IBUFGDS_inst : IBUFGDS
        port map (
          O  => clk_in0,
          I  => BUS_IN_CLKP,
          IB => BUS_IN_CLKN
        );
      BUFG_inst : BUFG
        port map (
          O => clk_in,
          I => clk_in0
        );
      rst_in <= '0';
    end block blkClock;

    -- Bus Input Capture
    process(clk_in)
    begin
      if rising_edge(clk_in) then
        if rst_in = '1' then
          InPreDat <= (others => '-');
          InPrePut <= '0';
          InSolDat <= (others => '-');
          InSolPut <= '0';
        else
          InPreDat <= BUS_IN_PRE_DAT;
          InPrePut <= BUS_IN_PRE_PUT;
          InSolDat <= BUS_IN_SOL_DAT;
          InSolPut <= BUS_IN_SOL_PUT;
        end if;
      end if;
    end process;

    -- Input FIFO (ic): Pre-Placements
    buf_pre : fifo_ic_got
      generic map (
        D_BITS         => 9,
        MIN_DEPTH      => 64,
        ESTATE_WR_BITS => InPreCap'length
      )
      port map (
        clk_wr    => clk_in,
        rst_wr    => rst_in,
        put       => InPrePut,
        din       => InPreDat,
        full      => open,
        estate_wr => InPreCap,

        clk_rd           => clk_comp,
        rst_rd           => rst_comp,
        got              => piput,
        dout(8)          => pieof,
        dout(7 downto 0) => pidat,
        valid            => pivld
      );
    piput <= pivld and not piful;
    BUS_IN_PRE_STALL <= '1' when InPreCap = (InPreCap'range => '0') else '0';

    -- Input FIFO (ic): Solutions
    buf_sol : fifo_ic_got
      generic map (
        D_BITS         => 9,
        MIN_DEPTH      => 64,
        ESTATE_WR_BITS => InSolCap'length
      )
      port map (
        clk_wr    => clk_in,
        rst_wr    => rst_in,
        put       => InSolPut,
        din       => InSolDat,
        full      => open,
        estate_wr => InSolCap,

        clk_rd           => clk_comp,
        rst_rd           => rst_comp,
        got              => sigot,
        dout(8)          => sieof,
        dout(7 downto 0) => sidat,
        valid            => sivld
      );
    BUS_IN_SOL_STALL <= '1' when InSolCap = (InSolCap'range => '0') else '0';

    ---------------------------------------------------------------------------
    -- Solver Chain
    chain: entity work.queens_chain
      generic map (
        N            => N,
        L            => L,
        SOLVERS      => SOLVERS,
        COUNT_CYCLES => COUNT_CYCLES
      )
      port map (
        clk   => clk_comp,
        rst   => rst_comp,

        piful => piful,
        pidat => pidat,
        pieof => pieof,
        piput => piput,

        sivld => sivld,
        sidat => sidat,
        sieof => sieof,
        sigot => sigot,

        poful => '1',
        podat => open,
        poeof => open,
        poput => open,

        sovld => sovld,
        sodat => sodat,
        soeof => soeof,
        sogot => sogot
      );

      enframe_i: entity work.enframe
        generic map (
          SENTINEL => SENTINEL
        )
        port map (
          clk    => clk_comp,
          rst    => rst_comp,

          ivld   => sovld,
          idat   => sodat,
          ieof   => soeof,
          igot   => sogot,

          tx_ful => tx_ful,
          tx_put => tx_put,
          tx_dat => tx_dat
        );

    -- Output FIFO (ic): Solutions
    fifob : fifo_ic_got
      generic map (
        D_BITS         => 8,
        MIN_DEPTH      => FIFO_DEPTH,
        FSTATE_RD_BITS => STATE_BITS
      )
      port map (
        clk_wr    => clk_comp,
        rst_wr    => rst_comp,
        put       => tx_put,
        din       => tx_dat,
        full      => tx_ful,

        clk_rd    => clk_slow,
        rst_rd    => rst_slow,
        got       => bgot,
        dout      => bdout,
        valid     => bvld,
        fstate_rd => bavl
      );
  end block blkDrain;

end rtl;
