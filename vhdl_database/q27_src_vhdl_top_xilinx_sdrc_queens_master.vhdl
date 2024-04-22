library IEEE;
use IEEE.std_logic_1164.all;

library PoC;
use PoC.physical.all;

entity sdrc_queens_master is
  generic (
    -- Design Parameters
    N : positive := 27;
    L : positive :=  2;

    SOLVERS      : positive := 90;
    COUNT_CYCLES : boolean  := false;

    -- Local Clock Parameters
    CLK_FREQ : FREQ	:= 16 MHz;	-- external clock
    CLK_MUL  : positive := 31;		-- computation clock:
    CLK_DIV  : positive :=  4;		--    CLK_FREQ / CLK_DIV * CLK_MUL

    -- UART Parameters
    BAUDRATE : positive := 115200;
    SENTINEL : std_logic_vector(7 downto 0) := x"FA"  -- Start Byte
  );
  port (
    ---------------------------------------------------------------------------
    -- 16-MHz Input Clock
    CLK16_U : in std_logic;

    ---------------------------------------------------------------------------
    -- Master: UART
    rx  : in  std_logic;
    tx  : out std_logic;
    cts : in  std_logic;
    rts : out std_logic;

    ---------------------------------------------------------------------------
    -- Status
    led : out std_logic_vector(3 downto 0);

    ---------------------------------------------------------------------------
    -- Ring Bus

    -- Output
    BUS_OUT_CLKP  : out std_logic;
    BUS_OUT_CLKN  : out std_logic;

    BUS_OUT_PRE_DAT : out std_logic_vector(8 downto 0);
    BUS_OUT_PRE_PUT : out std_logic;
    BUS_OUT_PRE_GO  : in  std_logic;

    BUS_OUT_SOL_DAT : out std_logic_vector(8 downto 0);
    BUS_OUT_SOL_PUT : out std_logic;
    BUS_OUT_SOL_GO  : in  std_logic;

    -- Input
    BUS_IN_CLKP  : in  std_logic;
    BUS_IN_CLKN  : in  std_logic;

    BUS_IN_PRE_DAT : in  std_logic_vector(8 downto 0);
    BUS_IN_PRE_PUT : in  std_logic;
    BUS_IN_PRE_GO  : out std_logic;

    BUS_IN_SOL_DAT : in  std_logic_vector(8 downto 0);
    BUS_IN_SOL_PUT : in  std_logic;
    BUS_IN_SOL_GO  : out std_logic
  );
end sdrc_queens_master;


library IEEE;
use IEEE.numeric_std.all;

library PoC;
use PoC.utils.all;
use PoC.fifo.all;
use PoC.uart.all;

library UNISIM;
use UNISIM.vcomponents.all;

architecture rtl of sdrc_queens_master is

  -- Bit Length of Pre-Placement
  constant PRE_BITS  : positive := 4*L*log2ceil(N)-1;
  constant PRE_BYTES : positive := (PRE_BITS+7)/8;

  -- FIFO Dimensioning
  constant FIFO_DEPTH : positive := 5*(SOLVERS+5);

  ----------------------------------------------------------------------------
  -- Global Control
  signal clk_comp : std_logic; -- Computation Clock
  signal rst_comp : std_logic;

  signal clk_out : std_logic;  -- Communication Clock (Output Side)
  signal rst_out : std_logic;

  -- UART Interface
  signal rx_dat : byte;
  signal rx_stb : std_logic;
  signal tx_dat : byte;
  signal tx_ful : std_logic;
  signal tx_put : std_logic;

  -- Frame Interface
  signal pvld : std_logic;
  signal pdat : byte;
  signal peof : std_logic;
  signal pgot : std_logic;

begin

  ----------------------------------------------------------------------------
  -- Clock Generation
  blkClock: block

    -- Intermediate Clock Signals
    signal clk16       : std_logic;	-- Buffered Input Clock
    signal clk_comp_u  : std_logic;
    signal locked_comp : std_logic;

  begin

    -- 16 MHz Board Clock -> Computation Clock
    clk16_buf : IBUFG
      port map (
        I => CLK16_U,
        O => clk16
      );

    DCM0 : DCM_BASE
      generic map (
        CLKIN_PERIOD          => to_real(1.0/CLK_FREQ, 1 ns),
        CLKIN_DIVIDE_BY_2     => FALSE,
        PHASE_SHIFT           => 0,
        CLKFX_MULTIPLY        => CLK_MUL,
        CLKFX_DIVIDE          => CLK_DIV,
        CLKOUT_PHASE_SHIFT    => "NONE",
        CLK_FEEDBACK          => "NONE",  -- only using clkfx
        DLL_FREQUENCY_MODE    => "LOW",
        DFS_FREQUENCY_MODE    => "LOW",
        DUTY_CYCLE_CORRECTION => TRUE,
        STARTUP_WAIT          => TRUE,
        DCM_AUTOCALIBRATION   => FALSE
      )
      port map (
        CLKIN    => clk16,
        CLKFB    => '0',
        RST      => '0',

        CLK0     => open,
        CLK180   => open,
        CLK270   => open,
        CLK2X    => open,
        CLK2X180 => open,
        CLK90    => open,
        CLKDV    => open,
        CLKFX    => clk_comp_u,
        CLKFX180 => open,
        LOCKED   => locked_comp
      );

    clk_comp_buf : BUFGCE
      port map (
	CE => locked_comp,
	I  => clk_comp_u,
	O  => clk_comp
      );
    rst_comp <= '0';

    clk_out_buf : BUFGCE
      port map (
	CE => locked_comp,
	I => clk16,
        O => clk_out
      );
    rst_out <= '0';

    led(0) <= locked_comp;
  end block blkClock;

  ----------------------------------------------------------------------------
  -- UART
  blkUART: block
    signal bclk_x8 : std_logic;
    signal bclk_x1 : std_logic;
  begin

    -- Bit Clock Generation
    bclk_gen_x8: entity PoC.arith_counter_free
      generic map (
	DIVIDER => integer(to_real(CLK_FREQ, 1 Hz))/(8*BAUDRATE)
      )
      port map (
	clk => clk_out,
	rst => '0',
	inc => '1',
	stb => bclk_x8
      );
    bclk_gen_x1: entity PoC.arith_counter_free
      generic map (
	DIVIDER => 8
      )
      port map (
	clk => clk_out,
	rst => '0',
	inc => bclk_x8,
	stb => bclk_x1
      );

    -- Receive Bytes
    uart_rx_i : uart_rx
      port map (
	clk     => clk_out,
	rst     => rst_out,
	bclk_x8 => bclk_x8,
	rx      => rx,
	stb     => rx_stb,
	do      => rx_dat
      );

    -- Transmit Bytes
    uart_tx_i : uart_tx
      port map (
	clk  => clk_out,
	rst  => rst_out,
	bclk => bclk_x1,
	put  => tx_put,
	di   => tx_dat,
	ful  => tx_ful,
	tx   => tx
      );

    rts <= cts;
  end block blkUART;

  -- Unframing
  blkUnframe: block

    -- Input Glue FIFO -> Unframe
    signal glue_vld : std_logic;
    signal glue_dat : byte;
    signal glue_got : std_logic;

    -- Unframe -> Input Buffer
    signal odat	     : byte;
    signal oeof	     : std_logic;
    signal oful	     : std_logic;
    signal oput	     : std_logic;
    signal ocommit   : std_logic;
    signal orollback : std_logic;

  begin

    glue: fifo_glue
      generic map (
	D_BITS => 8
      )
      port map (
	clk => clk_out,
	rst => rst_out,
	put => rx_stb,
	di  => rx_dat,
	ful => open,
	vld => glue_vld,
	do  => glue_dat,
	got => glue_got
      );

    unframe_i: entity work.unframe
      generic map (
	SENTINEL => SENTINEL,
	PAY_LEN  => PRE_BYTES
      )
      port map (
	clk       => clk_out,
	rst       => rst_out,
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
	MIN_DEPTH      => 5*(SOLVERS+5),
	D_BITS         => 9
      )
      port map (
	clk => clk_out,
	rst => rst_out,

	put             => oput,
	din(8)          => oeof,
	din(7 downto 0) => odat,
	full            => oful,
	commit          => ocommit,
	rollback        => orollback,

	got              => pgot,
	dout(8)          => peof,
	dout(7 downto 0) => pdat,
	valid            => pvld
      );

  end block blkUnframe;

  blkFeed: block

    -- Syncing the stall input
    signal go_s : std_logic_vector(1 downto 0) := (others => '0');

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
	  C  => clk_out,              -- 1-bit clock input
	  CE => '1',                  -- 1-bit clock enable input
	  D1 => '0',                  -- 1-bit data input (positive edge)
	  D2 => '1',                  -- 1-bit data input (negative edge)
	  R  => rst_out,              -- 1-bit reset input
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
    process(clk_out)
    begin
      if rising_edge(clk_out) then
        if rst_out = '1' then
          go_s <= (others => '0');
        else
          go_s <= BUS_OUT_PRE_GO & go_s(go_s'left downto 1);
        end if;
      end if;
    end process;
    pgot   <= pvld and go_s(0);

    -- Output Registers
    process(clk_out)
    begin
      if rising_edge(clk_out) then
	if rst_out = '1' then
	  OutDat <= (others => '0');
	  OutEof <= '0';
	  OutPut <= '0';
	else
	  OutDat <= pdat;
	  OutEof <= peof;
	  OutPut <= pgot;
	end if;
      end if;
    end process;
    BUS_OUT_PRE_DAT <= OutEof & OutDat;
    BUS_OUT_PRE_PUT <= OutPut;

    -------------------------------------------------------------------------
    -- Start of Result Chain
    BUS_OUT_SOL_DAT <= (others => '0');
    BUS_OUT_SOL_PUT <= '0';

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
    signal tdat : std_logic_vector(7 downto 0);
    signal tful : std_logic;
    signal tput : std_logic;

    signal tx_vld : std_logic;
    signal tx_got : std_logic;

  begin

    ---------------------------------------------------------------------------
    -- Reading the Bus

    -- Clock Reconstruction
    blkClock : block
      signal clk_in0 : std_logic;
    begin
      IBUFGDS_inst : IBUFGDS
        port map (
          O  => clk_in0,
          I  => BUS_IN_CLKP,
          IB => BUS_IN_CLKN
        );
      BUFG_inst : BUFR
        port map (
          I   => clk_in0,
          CE  => '1',
          CLR => '0',
          O   => clk_in
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
    BUS_IN_PRE_GO <= '0' when InPreCap = (InPreCap'range => '0') else '1';

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
    BUS_IN_SOL_GO <= '0' when InSolCap = (InSolCap'range => '0') else '1';

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

	tx_ful => tful,
	tx_put => tput,
	tx_dat => tdat
      );

    -- Output FIFO (ic): Solutions
    fifob : fifo_ic_got
      generic map (
        D_BITS         => 8,
        MIN_DEPTH      => FIFO_DEPTH
      )
      port map (
        clk_wr    => clk_comp,
        rst_wr    => rst_comp,
        put       => tput,
        din       => tdat,
        full      => tful,

        clk_rd    => clk_out,
        rst_rd    => rst_out,
        got       => tx_got,
        dout      => tx_dat,
        valid     => tx_vld
      );

    tx_put <= tx_vld and not tx_ful;
    tx_got <= tx_put;
  end block blkDrain;

  led(3 downto 1) <= "110";
end rtl;
